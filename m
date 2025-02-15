Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A28A369F7
	for <lists+xen-devel@lfdr.de>; Sat, 15 Feb 2025 01:27:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889209.1298401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj61T-0002at-2U; Sat, 15 Feb 2025 00:27:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889209.1298401; Sat, 15 Feb 2025 00:27:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj61S-0002YZ-WB; Sat, 15 Feb 2025 00:27:06 +0000
Received: by outflank-mailman (input) for mailman id 889209;
 Sat, 15 Feb 2025 00:27:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NTp2=VG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tj61R-0002YT-My
 for xen-devel@lists.xenproject.org; Sat, 15 Feb 2025 00:27:05 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9363c0ed-eb33-11ef-9aa4-95dc52dad729;
 Sat, 15 Feb 2025 01:27:03 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 08F925C57BF;
 Sat, 15 Feb 2025 00:26:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C932C4CED1;
 Sat, 15 Feb 2025 00:27:00 +0000 (UTC)
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
X-Inumbo-ID: 9363c0ed-eb33-11ef-9aa4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739579221;
	bh=AWcH0MzwTuHQXnL1k5O6biFxgBtSkxpAY8FAxo0gvms=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=arPGypIFWwSHz8TseMFim5c+bLSt537yfmfX3ZI0d4skMVuYMq/82v3/IilvC+zKv
	 d9y9GmPpoaaTKEZLw7Jz5spqjONFD50vUGaKLMF6fCqgxevmUsCNBB7XeubhUKGxRZ
	 0mwdhjV6iqKXAyfV72xUBvgJYxkmKE4YKk/l/qxTEBwgIvCQI5qcHVj4PxuWCVlNu2
	 HPxGoGTFMo6NU1kwfhBBTuBJq5K4OblzTMWL4sN2YzPW/MEwPWHC4YIiBvHVvNYIiM
	 KTfFPj/bZqOsxwIP1B/paKpczJar7IbO+a08I588DSiDRzAIlv3gkpzvkvZA6jsclf
	 kaE8ng/yxx00Q==
Date: Fri, 14 Feb 2025 16:26:59 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 2/4] automation: add jobs running tests from
 tools/tests/*
In-Reply-To: <cafc69b6c01805e7ccc0fcd6ccebe0b7088c4bd5.1739496480.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2502141626510.3858257@ubuntu-linux-20-04-desktop>
References: <cover.36ee649a8537af1a5fb5b3c5b7ffc0d8a1369969.1739496480.git-series.marmarek@invisiblethingslab.com> <cafc69b6c01805e7ccc0fcd6ccebe0b7088c4bd5.1739496480.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1347266580-1739579221=:3858257"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1347266580-1739579221=:3858257
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 14 Feb 2025, Marek Marczykowski-Górecki wrote:
> There are a bunch of tests in tools/tests/, let them run in CI.
> For each subdirectory expect "make run" will run the test, and observe
> its exit code. This way, adding new tests is easy, and they will be
> automatically picked up.
> 
> For better visibility, log test output to junit xml format, and let
> gitlab ingest it. Set SUT_ADDR variable with name/address of the system
> under test, so a network can be used to extract the file. The actual
> address is set using DHCP. And for the test internal network, still add
> the 192.168.0.1 IP (but don't replace the DHCP-provided one).
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
>  - use bash shebang
>  - clarify skipped message
>  - cleanup extra printf params
>  - limit calling DHCP in dom0 to only tests that need it
> ---
>  automation/gitlab-ci/test.yaml     | 23 +++++++++++++++-
>  automation/scripts/build           |  1 +-
>  automation/scripts/qubes-x86-64.sh | 28 ++++++++++++++++++-
>  automation/scripts/run-tools-tests | 47 +++++++++++++++++++++++++++++++-
>  4 files changed, 99 insertions(+)
>  create mode 100755 automation/scripts/run-tools-tests
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 1822e3ea5fd7..c21a37933881 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -130,6 +130,7 @@
>      PCIDEV: "03:00.0"
>      PCIDEV_INTR: "MSI-X"
>      CONSOLE_OPTS: "console=com1 com1=115200,8n1"
> +    SUT_ADDR: test-2.testnet
>    artifacts:
>      paths:
>        - smoke.serial
> @@ -263,6 +264,28 @@ adl-pvshim-x86-64-gcc-debug:
>      - *x86-64-test-needs
>      - alpine-3.18-gcc-debug
>  
> +adl-tools-tests-pv-x86-64-gcc-debug:
> +  extends: .adl-x86-64
> +  script:
> +    - ./automation/scripts/qubes-x86-64.sh tools-tests-pv 2>&1 | tee ${LOGFILE}
> +  artifacts:
> +    reports:
> +      junit: tests-junit.xml
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.18-gcc-debug
> +
> +adl-tools-tests-pvh-x86-64-gcc-debug:
> +  extends: .adl-x86-64
> +  script:
> +    - ./automation/scripts/qubes-x86-64.sh tools-tests-pvh 2>&1 | tee ${LOGFILE}
> +  artifacts:
> +    reports:
> +      junit: tests-junit.xml
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.18-gcc-debug
> +
>  zen3p-smoke-x86-64-gcc-debug:
>    extends: .zen3p-x86-64
>    script:
> diff --git a/automation/scripts/build b/automation/scripts/build
> index 952599cc25c2..522efe774ef3 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -109,5 +109,6 @@ else
>      # even though dist/ contains everything, while some containers don't even
>      # build Xen
>      cp -r dist binaries/
> +    cp -r tools/tests binaries/
>      collect_xen_artefacts
>  fi
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index 7eb3ce1bf703..7c80e0c23318 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -10,6 +10,8 @@ set -ex
>  #  - pci-pv         PV dom0,  PV domU + PCI Passthrough
>  #  - pvshim         PV dom0,  PVSHIM domU
>  #  - s3             PV dom0,  S3 suspend/resume
> +#  - tools-tests-pv PV dom0, run tests from tools/tests/*
> +#  - tools-tests-pvh PVH dom0, run tests from tools/tests/*
>  test_variant=$1
>  
>  ### defaults
> @@ -19,6 +21,7 @@ timeout=120
>  domU_type="pvh"
>  domU_vif="'bridge=xenbr0',"
>  domU_extra_config=
> +retrieve_xml=
>  
>  case "${test_variant}" in
>      ### test: smoke test & smoke test PVH & smoke test HVM & smoke test PVSHIM
> @@ -126,6 +129,21 @@ done
>  "
>          ;;
>  
> +    ### tests: tools-tests-pv, tools-tests-pvh
> +    "tools-tests-pv"|"tools-tests-pvh")
> +        retrieve_xml=1
> +        passed="test passed"
> +        domU_check=""
> +        dom0_check="
> +/tests/run-tools-tests /tests /tmp/tests-junit.xml && echo \"${passed}\"
> +nc -l -p 8080 < /tmp/tests-junit.xml >/dev/null &
> +"
> +        if [ "${test_variant}" = "tools-tests-pvh" ]; then
> +            extra_xen_opts="dom0=pvh"
> +        fi
> +
> +        ;;
> +
>      *)
>          echo "Unrecognised test_variant '${test_variant}'" >&2
>          exit 1
> @@ -178,6 +196,8 @@ mkdir srv
>  mkdir sys
>  rm var/run
>  cp -ar ../binaries/dist/install/* .
> +cp -ar ../binaries/tests .
> +cp -a ../automation/scripts/run-tools-tests tests/
>  
>  echo "#!/bin/bash
>  
> @@ -192,6 +212,10 @@ ifconfig xenbr0 192.168.0.1
>  
>  " > etc/local.d/xen.start
>  
> +if [ -n "$retrieve_xml" ]; then
> +    echo "timeout 30s udhcpc -i xenbr0" >> etc/local.d/xen.start
> +fi
> +
>  if [ -n "$domU_check" ]; then
>      echo "
>  # get domU console content into test log
> @@ -272,6 +296,10 @@ if [ $timeout -le 0 ]; then
>      exit 1
>  fi
>  
> +if [ -n "$retrieve_xml" ]; then
> +    nc -w 10 "$SUT_ADDR" 8080 > tests-junit.xml </dev/null
> +fi
> +
>  sleep 1
>  
>  (grep -q "^Welcome to Alpine Linux" smoke.serial && grep -q "${passed}" smoke.serial) || exit 1
> diff --git a/automation/scripts/run-tools-tests b/automation/scripts/run-tools-tests
> new file mode 100755
> index 000000000000..770e97c3e943
> --- /dev/null
> +++ b/automation/scripts/run-tools-tests
> @@ -0,0 +1,47 @@
> +#!/bin/bash
> +
> +usage() {
> +    echo "Usage: $0 tests-dir xml-out"
> +}
> +
> +xml_out=$2
> +if [ -z "$xml_out" ]; then
> +  xml_out=/dev/null
> +fi
> +printf '<?xml version="1.0" encoding="UTF-8"?>\n' > "$xml_out"
> +printf '<testsuites name="tools.tests">\n' >> "$xml_out"
> +printf ' <testsuite name="tools.tests">\n' >> "$xml_out"
> +failed=
> +for dir in "$1"/*; do
> +    [ -d "$dir" ] || continue
> +    echo "Running test in $dir"
> +    printf '  <testcase name="%s">\n' "$dir" >> "$xml_out"
> +    ret=
> +    for f in "$dir"/*; do
> +        [ -f "$f" ] || continue
> +        [ -x "$f" ] || continue
> +        "$f" 2>&1 | tee /tmp/out
> +        ret=$?
> +        if [ "$ret" -ne 0 ]; then
> +            echo "FAILED: $ret"
> +            failed+=" $dir"
> +            printf '   <failure type="failure" message="binary %s exited with code %d">\n' "$f" "$ret" >> "$xml_out"
> +            # TODO: could use xml escaping... but current tests seems to
> +            # produce sane output
> +            cat /tmp/out >> "$xml_out"
> +            printf '   </failure>\n' >> "$xml_out"
> +        else
> +            echo "PASSED"
> +        fi
> +    done
> +    if [ -z "$ret" ]; then
> +        printf '   <skipped type="skipped" message="no executable test found in %s"/>\n' "$dir" >> "$xml_out"
> +    fi
> +    printf '  </testcase>\n' >> "$xml_out"
> +done
> +printf ' </testsuite>\n' >> "$xml_out"
> +printf '</testsuites>\n' >> "$xml_out"
> +
> +if [ -n "$failed" ]; then
> +    exit 1
> +fi
> -- 
> git-series 0.9.1
> 
--8323329-1347266580-1739579221=:3858257--

