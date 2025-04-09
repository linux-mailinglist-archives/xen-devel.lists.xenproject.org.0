Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E11BFA82C96
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 18:37:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944342.1342842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2YQK-0005Bw-Qi; Wed, 09 Apr 2025 16:37:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944342.1342842; Wed, 09 Apr 2025 16:37:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2YQK-00058u-Lm; Wed, 09 Apr 2025 16:37:12 +0000
Received: by outflank-mailman (input) for mailman id 944342;
 Wed, 09 Apr 2025 16:37:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fbf/=W3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2YQJ-0004rn-AF
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 16:37:11 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1603400-1560-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 18:37:09 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43cf3192f3bso67469545e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 09:37:09 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233c817dsm20947455e9.23.2025.04.09.09.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 09:37:08 -0700 (PDT)
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
X-Inumbo-ID: e1603400-1560-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744216628; x=1744821428; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WikkQXD4kZveDb/959Oc1/hEF4sz0oUbKzkkNBhCfIM=;
        b=WDeKvUD/gRn3S2eHJP3inoGO+JI82WAIo7qrDmG5+mIn9xPAN6XLKoX9ysh9K+uw9+
         765b0j4ynVwI9msk/yx5i5seM9YBKtlxGIa2Foad5uoD+yDacP6tY1ZDZ+a+2u+vJR4s
         zmvWicNTsjTpNL7c/Ba4Y9A6usnS4yOih60TE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744216628; x=1744821428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WikkQXD4kZveDb/959Oc1/hEF4sz0oUbKzkkNBhCfIM=;
        b=a6u36UwCLS++tEXi5goC31wJZE6I9WxZs6/a9hV785H9SWYYZ4r+yeDpWzwlC+JkNE
         G0yu2ffgWzsGkGDTKKvEG18nYfd9L08aHGQcpvQ/wsHJs7QHEEUEaBwfeMmBC0dmWAbw
         cHT8V2GGxDUVPkupXYqdghp5FB1NeJi1X6JXNV9zMpqw1hxoZgQx5eHyfMjFIlwA5Gll
         XTBGeT2tacfVXB77YOWX1oQ2Aqj96D1Xv0tnjRkOnFroH9oh3sGOigAg6fGm89LKbB25
         RhI3x+RmJNjiMrtDUZdKz4ue1O8lU3lWdpIUZdSS65LwQ0D/jgyS+jzf+uMTSmH69VTP
         wfpw==
X-Gm-Message-State: AOJu0Yxj7qTn+lww3YIIzfc2h7Q0LtI53Pk/4VPrysEzvwNAuXRMjS0z
	+RVDW+P4uLdw9QzLlv4RDZ65QTXBQFY8FSbCmHuEzcppmjKFUfXdodISqFRJXRcnV+VkbAjci6V
	zuwU=
X-Gm-Gg: ASbGncsjlpvnhHJZxIZSh07yk/pNd4B6smdz/X46ke9UthEhSRbzASS4Cv1mZUZu4IH
	1R7MFbwDjddjARS+/DY/SbMMMhW26lWSDYZFOq1jGXpZePCrsmsxSgkVyNLyOCzHL3wmziK9S0m
	A7CcMXQB/YnVwnveWNaqMFn/ot4cN03O1yozJ7sVGf89SdVq6PXJhK0p8W+Ni2kqQln/skkzOsf
	7tlWjEXmte+3tYSLozT88bKx5hCdoOWMvQPobh40kz0MNAsxCUBzUrvTVIgAzngc68DTGydQTvz
	y1yVlWtWAXueWgzjYpJVvAzqXzLSN6OAGpKwEN+ioDEMBlGEI2oKeAZZT1+3DtJKiDa+UcO3BKB
	tWuBQ/P3lWqMmCQ==
X-Google-Smtp-Source: AGHT+IHtUt26LX66Z0WBU4goSEbOVUNSP/4DzsgdbS77DKLY2GKN4mLBaOOitfkuKxGmYoyvBI2YiQ==
X-Received: by 2002:a05:600c:1909:b0:43d:b32:40aa with SMTP id 5b1f17b1804b1-43f1ec0d15dmr36404445e9.3.1744216628397;
        Wed, 09 Apr 2025 09:37:08 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 2/8] Port containerise
Date: Wed,  9 Apr 2025 17:36:56 +0100
Message-Id: <20250409163702.2037301-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250409163702.2037301-1-andrew.cooper3@citrix.com>
References: <20250409163702.2037301-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While it pains me to keep the wrong spelling, do so for consistency.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
---
 containerize | 94 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100755 containerize

diff --git a/containerize b/containerize
new file mode 100755
index 000000000000..c32e40f5a6d9
--- /dev/null
+++ b/containerize
@@ -0,0 +1,94 @@
+#!/bin/bash
+
+#
+# DOCKER_CMD should be either `docker` or `podman`.
+#
+# if using (rootless) podman, remember to set /etc/subuid
+# and /etc/subgid.
+#
+docker_cmd=${DOCKER_CMD:-"docker"}
+[ "$DOCKER_CMD" = "podman" ] && userns_podman="--userns=keep-id" selinux=",z"
+
+einfo() {
+    echo "$*" >&2
+}
+
+die() {
+    echo "$*" >&2
+    exit 1
+}
+
+#
+# The caller is expected to override the CONTAINER environment
+# variable with the container they wish to launch.
+#
+BASE="registry.gitlab.com/xen-project/hardware/test-artifacts"
+case "_${CONTAINER}" in
+    _alpine-x86_64-base) CONTAINER="${BASE}/alpine:x86_64-base" ;;
+    _alpine-x86_64-build|_) CONTAINER="${BASE}/alpine:x86_64-build" ;;
+esac
+
+# Use this variable to control whether root should be used
+case "_${CONTAINER_UID0}" in
+    _1)   userarg="-u 0" ;;
+    _0|_) userarg="-u $(id -u) $userns_podman" ;;
+esac
+
+# Save the commands for future use
+cmd=("$@")
+
+# If no command was specified, just drop us into a shell if we're interactive
+[ $# -eq 0 ] && tty -s && cmd=("/bin/bash")
+
+# Are we in an interactive terminal?
+tty -s && termint=t
+
+#
+# Fetch the latest version of the container in hub.docker.com,
+# unless it's a newly created local copy.
+#
+if [[ "_${CONTAINER_NO_PULL}" != "_1" ]]; then
+    einfo "*** Ensuring ${CONTAINER} is up to date"
+    ${docker_cmd} pull ${CONTAINER} > /dev/null ||     \
+        die "Failed to update container"
+fi
+
+if hash greadlink > /dev/null 2>&1; then
+    READLINK=greadlink
+elif [[ $(uname -s) == "Darwin" ]]; then
+    echo "Unable to forward SSH agent without coreutils installed"
+    unset SSH_AUTH_SOCK
+else
+    READLINK=readlink
+fi
+
+# Ensure we've got what we need for SSH_AUTH_SOCK
+if [[ -n ${SSH_AUTH_SOCK} ]]; then
+    fullpath_sock=$(${READLINK} -f ${SSH_AUTH_SOCK} 2> /dev/null)
+    if [ $? -ne 0 ]; then
+        echo "Invalid SSH_AUTH_SOCK: ${SSH_AUTH_SOCK}"
+        unset SSH_AUTH_SOCK
+    else
+        SSH_AUTH_DIR=$(dirname ${fullpath_sock})
+        SSH_AUTH_NAME=$(basename ${fullpath_sock})
+    fi
+fi
+
+# Figure out the base of what we want as our sources
+# by using the top of the git repo
+if [[ -z ${CONTAINER_PATH} ]]; then
+    CONTAINER_PATH=$(git rev-parse --show-toplevel)
+fi
+
+# Kick off Docker
+einfo "*** Launching container ..."
+exec ${docker_cmd} run \
+    ${userarg} \
+    ${SSH_AUTH_SOCK:+-e SSH_AUTH_SOCK="/tmp/ssh-agent/${SSH_AUTH_NAME}"} \
+    -v "${CONTAINER_PATH}":/build:rw${selinux} \
+    -v "${HOME}/.ssh":/root/.ssh:ro \
+    ${SSH_AUTH_DIR:+-v "${SSH_AUTH_DIR}":/tmp/ssh-agent${selinux}} \
+    ${CONTAINER_ARGS} \
+    -${termint}i --rm -- \
+    ${CONTAINER} \
+    "${cmd[@]}"
-- 
2.39.5


