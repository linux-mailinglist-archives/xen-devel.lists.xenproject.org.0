Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8169A61389D
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 15:01:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.432887.685587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opVM5-0004iP-AQ; Mon, 31 Oct 2022 14:01:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432887.685587; Mon, 31 Oct 2022 14:01:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opVM5-0004cv-3x; Mon, 31 Oct 2022 14:01:33 +0000
Received: by outflank-mailman (input) for mailman id 432887;
 Mon, 31 Oct 2022 14:01:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X+oh=3A=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1opVM3-0004Zq-19
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 14:01:31 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 84240b00-5924-11ed-91b5-6bf2151ebd3b;
 Mon, 31 Oct 2022 15:01:29 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5D811FB;
 Mon, 31 Oct 2022 07:01:34 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B71723F5A1;
 Mon, 31 Oct 2022 07:01:27 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 84240b00-5924-11ed-91b5-6bf2151ebd3b
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 1/4] automation: Add elements for Yocto test and run
Date: Mon, 31 Oct 2022 14:00:53 +0000
Message-Id: <447141266843aeb30cf08507183e06815e957dfe.1667224593.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667224593.git.bertrand.marquis@arm.com>
References: <cover.1667224593.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a container suitable to run yocto kirkstone build based on ubuntu
22.04. It contains all packages required by Yocto and a checkout of the
layers required to build Xen with Yocto.

Add a build script to build and run xen on qemu using Yocto.
The script supports arm32, arm64 and x86_64 and checks that dom0 is
properly booting. At this stage this does not run any guest on top of
dom0.

The build script is currently in the same directory than the docker
files so that it can be included directly in the image. This is required
for the next step which creates images with an initial cache content to
speed up testing.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v3:
- limit number of jobs in yocto by default to 8 and add --num-jobs
option to the script to set a custom number of jobs
- do not copy anymore the build-yocto.sh script inside the main image so
that the current one in the repository is used when running
Changes in v2:
- add a --dump-log command line option to build-yocto.sh script to dump
the logs if an error occurs.
Changes in v1:
- add --image command line argument to build-yocto.sh to allow building
something different than xen-image-minimal.
- modify dockerfile to have one layer per line and make it easier to add
other. I kept the for loop to keep the number of docker steps lower
- update commit message to warn that no guest are tested.
- fix build-yocto script to properly return with an error if expect
script ends up in timeout or EOF.
---
 automation/build/yocto/build-yocto.sh       | 349 ++++++++++++++++++++
 automation/build/yocto/kirkstone.dockerfile |  97 ++++++
 2 files changed, 446 insertions(+)
 create mode 100755 automation/build/yocto/build-yocto.sh
 create mode 100644 automation/build/yocto/kirkstone.dockerfile

diff --git a/automation/build/yocto/build-yocto.sh b/automation/build/yocto/build-yocto.sh
new file mode 100755
index 000000000000..d0c93dfaffe0
--- /dev/null
+++ b/automation/build/yocto/build-yocto.sh
@@ -0,0 +1,349 @@
+#!/bin/bash
+#
+# Yocto meta virtualization build and run script
+#
+# This script is building Yocto xen-image-minimal for qemu targets and run
+# them using runqemu inside yocto to check that dom0 is booting properly
+# The build is using a local xen source tree so that specific patches can be
+# tested.
+# In order to optimize the build time, a build cache is used so that only xen
+# packages and its dependencies are rebuilt (qemu and final image mainly).
+#
+
+# Directories
+YOCTODIR="$HOME/yocto-layers"
+CACHEDIR="$HOME/yocto-cache"
+LOGDIR="$HOME/logs"
+XENDIR="$HOME/xen"
+BUILDDIR="$HOME/build"
+
+# what yocto bsp we support
+TARGET_SUPPORTED="qemuarm qemuarm64 qemux86-64"
+VERBOSE="n"
+TARGETLIST=""
+BUILDJOBS="8"
+
+# actions to do
+do_clean="n"
+do_build="y"
+do_run="y"
+do_localsrc="n"
+do_dump="n"
+build_result=0
+
+# layers to include in the project
+build_layerlist="poky/meta poky/meta-poky poky/meta-yocto-bsp \
+                 meta-openembedded/meta-oe meta-openembedded/meta-python \
+                 meta-openembedded/meta-filesystems \
+                 meta-openembedded/meta-networking meta-virtualization"
+
+# yocto image to build
+build_image="xen-image-minimal"
+
+function print_progress() {
+    echo -n "$(date +%T) $*"
+}
+
+function run_task() {
+    local task_name="$1"
+    local task_target="$2"
+
+    task_log="${task_name//project_}-${task_target}"
+
+    mkdir -p "${LOGDIR}"
+    print_progress
+    echo -n "${task_name//project_} ${task_target}: "
+    if [ "${VERBOSE}" = "n" ]; then
+        $@ > "${LOGDIR}/${task_log}.log" 2>&1
+    else
+        $@ 2>&1 | tee "${LOGDIR}/${task_log}.log"
+    fi
+
+    if [ ${?} -ne 0 ]; then
+        echo "Error"
+        build_result=$((build_result+1))
+        if [ "${do_dump}" = "y" ]; then
+            echo
+            echo "############ LOGS-START ############"
+            cat "${LOGDIR}/${task_log}.log"
+            echo "############  LOGS-END  ############"
+            echo
+        fi
+        return 1
+    else
+        echo "OK"
+        return 0
+    fi
+}
+
+function project_create() {
+    target="${1:?}"
+    destdir="${BUILDDIR}/${target}"
+
+    (
+        # init yocto project
+        source ${YOCTODIR}/poky/oe-init-build-env "${destdir}"
+
+        # add needed layers
+        for layer in ${build_layerlist}; do
+            bitbake-layers add-layer ${YOCTODIR}/${layer} || exit 1
+        done
+    ) || return 1
+
+    # customize project configuration
+    cat <<EOF >> "${destdir}/conf/local.conf"
+# Yocto BSP
+MACHINE = "${target}"
+
+# Use local cache to reuse previous builds results
+SSTATE_DIR = "${CACHEDIR}/sstate-cache"
+DL_DIR = "${CACHEDIR}/downloads"
+
+# Enable xen and virtualization
+DISTRO_FEATURES = " virtualization xen ipv4"
+
+# Speed up run by not generating ssh host keys
+IMAGE_INSTALL:append:pn-xen-image-minimal = " ssh-pregen-hostkeys"
+
+# Save some disk space
+INHERIT += "rm_work"
+
+# Reduce number of jobs
+BB_NUMBER_THREADS="${BUILDJOBS}"
+
+EOF
+
+    if [ "${do_localsrc}" = "y" ]; then
+        XENVERS=$(grep -e "^XEN_REL" \
+            "${YOCTODIR}"/meta-virtualization/recipes-extended/xen/xen_*.bb \
+            2> /dev/null | tr -d ' ' | tr -d '?' | tr -d '"' \
+            | sed -e "s/.*=//" | sort -V | tail -n 1)
+
+        XENBASE=$(dirname "$(realpath -m "${XENDIR}")")
+        XENSUB=$(basename "$(realpath -m "${XENDIR}")")
+
+        cat <<EOF >> "${destdir}/conf/local.conf"
+# Use local sources for xen and xen-tools
+FILESEXTRAPATHS:prepend:pn-xen := "${XENBASE}:"
+FILESEXTRAPATHS:prepend:pn-xen-tools := "${XENBASE}:"
+
+SRC_URI:pn-xen = "file://${XENSUB}/;subdir=local-xen/"
+SRC_URI:pn-xen-tools = "file://${XENSUB}/;subdir=local-xen/"
+
+PREFERRED_VERSION:pn-xen = "${XENVERS}%"
+PREFERRED_VERSION:pn-xen-tools = "${XENVERS}%"
+
+S:pn-xen = "\${WORKDIR}/local-xen/${XENSUB}"
+S:pn-xen-tools = "\${WORKDIR}/local-xen/${XENSUB}"
+
+SRCREV:pn-xen = "\${AUTOREV}"
+SRCREV:pn-xen-tools = "\${AUTOREV}"
+
+SRCPV:pn-xen = "1"
+SRCPV:pn-xen-tools = "1"
+
+# Disable all QA errors as the recipe is not up to date with changes in Xen
+# when we use local sources
+ERROR_QA:pn-xen = "arch"
+ERROR_QA:pn-xen-tools = "arch"
+
+EOF
+    fi
+}
+
+function project_build() {
+    target="${1:?}"
+    destdir="${BUILDDIR}/${target}"
+
+    (
+        source ${YOCTODIR}/poky/oe-init-build-env "${destdir}"
+
+        bitbake "${build_image}" || exit 1
+    ) || return 1
+}
+
+function project_clean() {
+    target="${1:?}"
+    destdir="${BUILDDIR}/${target}"
+
+    rm -rf "${destdir}"
+}
+
+function project_run() {
+    target="${1:?}"
+    destdir="${BUILDDIR}/${target}"
+    (
+        source ${YOCTODIR}/poky/oe-init-build-env "${destdir}" > /dev/null 2>&1
+
+        /usr/bin/expect <<EOF
+set timeout 100
+spawn bash -c "runqemu serialstdio nographic slirp"
+
+expect_after {
+    -re "(.*)\r" {
+        exp_continue
+    }
+    timeout {send_user "ERROR-Timeout!\n"; exit 1}
+    eof {send_user "ERROR-EOF!\n"; exit 1}
+}
+
+# wait initial login
+expect -re ".* login: "
+send "root\r"
+expect -re "root@.*# "
+
+EOF
+    exit $?
+    ) || return 1
+}
+
+function help() {
+    cat <<EOF
+Usage: ${0} [TARGET1] [TARGET2]
+
+This script is build the yocto xen-image-minimal for different qemu targets
+and is running it after.
+Without any target specified, all supported targets are done.
+
+Options:
+  -h, --help       Print this help
+  -v, --verbose    Verbose build
+  --list-target    List supported targets
+  --clean          Clean existing project before starting
+  --no-build       Do not build (to run an already built project)
+  --no-run         Do not run
+  --num-jobs=NUM   Define the number of parallel jobs in Yocto.
+                   Default: ${BUILDJOBS}
+  --dump-log       On error, dump the logs on the console
+  --image=IMG      Yocto image or package to build
+                   Default: xen-image-minimal
+  --xen-dir=DIR    path to xen hypervisor source tree
+                   if not provide, normal yocto version of xen is built
+                   Default: ${XENDIR}
+  --out-dir=DIR    directory where to create the projectss
+                   Default: ${BUILDDIR}
+  --log-dir=DIR    directory to store logs
+                   Default: ${LOGDIR}
+  --cache-dir=DIR  directory where to take and store build cache
+                   Default: ${CACHEDIR}
+  --layer-dir=DIR  directory containing the checkout of yocto layers
+                   Default: ${YOCTODIR}
+EOF
+}
+
+for OPTION in "$@"
+do
+    case ${OPTION} in
+        -h|--help)
+            help
+            exit 0
+            ;;
+        -v|--verbose)
+            VERBOSE="y"
+            ;;
+        --list-targets)
+            echo "${TARGET_SUPPORTED}"
+            exit 0
+            ;;
+        --clean)
+            do_clean="y"
+            ;;
+        --no-build)
+            do_build="n"
+            ;;
+        --no-run)
+            do_run="n"
+            ;;
+        --dump-log)
+            do_dump="y"
+            ;;
+        --num-jobs=*)
+            BUILDJOBS="${OPTION#*=}"
+            ;;
+        --image=*)
+            build_image="${OPTION#*=}"
+            ;;
+        --xen-dir=*)
+            XENDIR="${OPTION#*=}"
+            if [ ! -e "${XENDIR}/xen/Makefile" ]; then
+                echo "No Xen source tree in ${XENDIR}"
+                exit 1
+            fi
+            do_localsrc="y"
+            ;;
+        --out-dir=*)
+            BUILDDIR="${OPTION#*=}"
+            ;;
+        --log-dir=*)
+            LOGDIR="${OPTION#*=}"
+            ;;
+        --cache-dir=*)
+            CACHEDIR="${OPTION#*=}"
+            ;;
+        --layer-dir=*)
+            YOCTODIR="${OPTION#*=}"
+            ;;
+        --*)
+            echo "Invalid option ${OPTION}"
+            help
+            exit 1
+            ;;
+        *)
+            if echo "${TARGET_SUPPORTED}" | grep -q -w "${OPTION}"; then
+                TARGETLIST="${TARGETLIST} ${OPTION}"
+            else
+                echo "Unsupported target ${OPTION}"
+                exit 1
+            fi
+            ;;
+    esac
+done
+
+# if no target is specified build all targets
+if [ -z "${TARGETLIST}" ]; then
+    TARGETLIST="${TARGET_SUPPORTED}"
+fi
+
+mkdir -p "${CACHEDIR}"
+mkdir -p "${LOGDIR}"
+mkdir -p "${BUILDDIR}"
+
+# Make sure we have an absolute path
+YOCTODIR=$(realpath -m "${YOCTODIR}")
+CACHEDIR=$(realpath -m "${CACHEDIR}")
+BUILDDIR=$(realpath -m "${BUILDDIR}")
+LOGDIR=$(realpath -m "${LOGDIR}")
+if [ "${do_localsrc}" = "y" ]; then
+    XENDIR=$(realpath -m "${XENDIR}")
+fi
+
+# Check that we have all the layers we need
+for f in ${build_layerlist}; do
+    if [ ! -f "${YOCTODIR}/${f}/conf/layer.conf" ]; then
+        echo "Layer ${f} missing in ${YOCTODIR}"
+        exit 1
+    fi
+done
+
+for f in ${TARGETLIST}; do
+    if [ "${do_clean}" = "y" ]; then
+        run_task project_clean ${f}
+    fi
+    if [ ! -f ${BUILDDIR}/${f}/conf/local.conf ]; then
+        run_task project_create ${f}
+    fi
+    if [ -f ${BUILDDIR}/${f}/conf/local.conf ]; then
+        if [ "${do_build}" = "y" ]; then
+            run_task project_build ${f}
+        fi
+        if [ "${do_run}" = "y" ]; then
+            run_task project_run ${f}
+        fi
+
+    fi
+done
+
+print_progress "Build Complete (${build_result} errors)"
+echo
+exit ${build_result}
+
diff --git a/automation/build/yocto/kirkstone.dockerfile b/automation/build/yocto/kirkstone.dockerfile
new file mode 100644
index 000000000000..ffbd91aa90cc
--- /dev/null
+++ b/automation/build/yocto/kirkstone.dockerfile
@@ -0,0 +1,97 @@
+# Docker file to create an environment to build yocto with virtualization
+#
+# Arguments that can be passed during image creation using --build-arg:
+# "host_uid=$(id -u)": to use current user uid for build user in the image
+# "host_gid=$(id -g)": to use current user gid for build user in the image
+# "yocto_version=VERS": to select the Yocto version (branch name)
+
+# Use standard ubuntu minimal
+From ubuntu:22.04
+LABEL maintainer.name="The Xen Project " \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+
+# Install minimal ubuntu requirements for yocto and other tools we need
+# See https://docs.yoctoproject.org/4.0.1/brief-yoctoprojectqs/index.html#build-host-packages
+RUN apt-get update && \
+    apt-get --quiet --yes install \
+        gawk \
+        wget \
+        git \
+        diffstat \
+        unzip \
+        texinfo \
+        gcc \
+        build-essential \
+        chrpath \
+        socat \
+        cpio \
+        python3 \
+        python3-pip \
+        python3-pexpect \
+        xz-utils \
+        debianutils \
+        iputils-ping \
+        python3-git \
+        python3-jinja2 \
+        libegl1-mesa \
+        libsdl1.2-dev \
+        python3-subunit \
+        mesa-common-dev \
+        zstd \
+        liblz4-tool \
+        file \
+        vim \
+        bison \
+        expect \
+        locales \
+        liblz4-tool \
+        zstd \
+        openssl \
+        libssl3 \
+        ca-certificates \
+        && \
+        apt-get autoremove -y && \
+        apt-get clean && \
+        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
+
+# Use bash as shell
+RUN rm /bin/sh && ln -s bash /bin/sh
+
+# Fix local for yocto
+RUN locale-gen en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 \
+    LANG=en_US.UTF-8
+ENV LANG en_US.UTF-8
+ENV LC_ALL en_US.UTF-8
+
+# Create a user for the build (we don't want to build as root)
+ENV USER_NAME docker-build
+ARG host_uid=1000
+ARG host_gid=1000
+RUN groupadd -g $host_gid $USER_NAME && \
+    useradd -g $host_gid -m -s /bin/bash -u $host_uid $USER_NAME
+
+# Switch to our user instead of root and start in its home
+USER $USER_NAME
+WORKDIR /home/$USER_NAME
+
+# Create needed directories
+RUN mkdir -p /home/$USER_NAME/yocto-layers \
+             /home/$USER_NAME/yocto-cache \
+             /home/$USER_NAME/logs \
+             /home/$USER_NAME/bin \
+             /home/$USER_NAME/xen && \
+    chown $USER_NAME.$USER_NAME /home/$USER_NAME/*
+
+# clone yocto repositories we need
+ARG yocto_version="kirkstone"
+RUN for rep in \
+                https://github.com/openembedded/meta-openembedded \
+                https://git.yoctoproject.org/poky \
+                https://git.yoctoproject.org/meta-virtualization \
+            ; do \
+        git -C /home/$USER_NAME/yocto-layers \
+            clone -b $yocto_version --single-branch $rep; \
+    done
+
-- 
2.25.1


