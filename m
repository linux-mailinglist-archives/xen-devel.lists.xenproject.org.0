Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A49D6A33580
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 03:29:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887098.1296662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiOxp-0008EF-G6; Thu, 13 Feb 2025 02:28:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887098.1296662; Thu, 13 Feb 2025 02:28:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiOxp-0008B7-D3; Thu, 13 Feb 2025 02:28:29 +0000
Received: by outflank-mailman (input) for mailman id 887098;
 Thu, 13 Feb 2025 02:28:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZTDb=VE=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tiOxn-0008B1-Go
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 02:28:27 +0000
Received: from fout-b5-smtp.messagingengine.com
 (fout-b5-smtp.messagingengine.com [202.12.124.148])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32b09d05-e9b2-11ef-a075-877d107080fb;
 Thu, 13 Feb 2025 03:28:24 +0100 (CET)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailfout.stl.internal (Postfix) with ESMTP id E751711400CA;
 Wed, 12 Feb 2025 21:28:22 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-12.internal (MEProxy); Wed, 12 Feb 2025 21:28:23 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Feb 2025 21:28:21 -0500 (EST)
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
X-Inumbo-ID: 32b09d05-e9b2-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1739413702;
	 x=1739500102; bh=Ahlt6x8O+dGNnrAwMVQFXZY4p8B9aOQcVRSj37rgRsA=; b=
	LE1x8jsbw23cJq2CwRJ9QJH4DqwxncxEXxUZPMrGi3PuodJ06KIlrAkU+pwAb5OC
	4XsBF9ebHqPeYGaXnZojypO2rsxIN+xC8EuWNNCw4L7LCpOE9Ao4vgnaL0uAvcNs
	NmEk1jsPP4mdhSpDcCfBdK7i6l9+9fynsTdgrtrx6//ShbROLRT9TydfMhx9RCBI
	Nco1gYojzmooVCqhyeZuX7VQPljm6nrJdhE93eErwR+DhU/XcQC4Qg8DUNnyQlTI
	3VkelqSLM1SrKQTi+EejtVjhEFE2fSUDrE7ETxipfLHAVt8zJeG8JfeZFQU5lpvU
	wQOjiifKTYf2r2/fmeZL0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1739413702; x=1739500102; bh=Ahlt6x8O+dGNnrAwMVQFXZY4p8B9aOQcVRS
	j37rgRsA=; b=zndymUIPcFG7sEBgAztO6M0VzFPj0Tz55cgUW1lLplgpleAZWaV
	zmmUPreDuBQXIx0q8NonYWsUoU+UTkYEW37HtgOFvfxR829zOcxIbSmxLBrUmNWg
	/SQevZhdXJa4qaHNJSWCKXswuhqDOwXFtcMDmArAlybRYo6m26waSXRdjG81ADt6
	dBPJuBHwhEY7BjVuxRPRmlAx3/8QtheNme7YWsGNYBDH6YDLE1Nnft2mKIIokMhy
	cvQFcbOytIkNFiLEpYzhDz0eL8XPdxj5bK252UTvE40L9oVCisWZc5CZ3roTKcy/
	M3/HOKKobzgntnV9A4RFuCI85V7j8lznYOA==
X-ME-Sender: <xms:xlitZ_jI8dKhmm5cNS1NXBaTfO7ysyXFBwhlldrCdpaua1s5fyXQsw>
    <xme:xlitZ8B9F6jcn6MxbWt_Fbhm89mo5ZOYIbeMS_HKjMv1qhlwdvARyK76xuV2oRBqX
    jW71AEkcQLjEw>
X-ME-Received: <xmr:xlitZ_FiWxEWWs2v8hdO7W544e0SRN8BGYQatkSyXreCWp63xNPSoTQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegheehjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdej
    necuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoe
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucgg
    tffrrghtthgvrhhnpefgudelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvd
    egueetfeejudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpd
    hnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsshht
    rggsvghllhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopeigvghnqdguvghvvg
    hlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopegtrghrugho
    vgestggrrhguohgvrdgtohhm
X-ME-Proxy: <xmx:xlitZ8QS3fd2bpdYBdJzBbn31z86KIf9nM2VG8oxS4upR0LHKunb0Q>
    <xmx:xlitZ8zZ8Kjj05o6FfHSr7YG-1Y3qhxRLbOA6yM8CxoIJqEAI3qAyA>
    <xmx:xlitZy6gMIN3lQT4JX07haa-pdUvXfIZzepPRJQiTqYqlipe2_UKhA>
    <xmx:xlitZxwZo4xOBm6xM-910EkrF1vJzMgoBdGMKsRTr65uHGCxogOXJg>
    <xmx:xlitZ4-dD7uIwjtQSypDjAOdYyJVLQBnk8cHXt3UFGLpuMWd3PRDSbdW>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 13 Feb 2025 03:28:19 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v1 2/3] automation: add jobs running tests from
 tools/tests/*
Message-ID: <Z61Yw50tlX-xH9b6@mail-itl>
References: <cover.068c7421003863de7fca1cbe6aed2af000f061a7.1739409822.git-series.marmarek@invisiblethingslab.com>
 <3fbb4c6be9d9190bb2bd6427ab0f0a933c95dde1.1739409822.git-series.marmarek@invisiblethingslab.com>
 <alpine.DEB.2.22.394.2502121802540.619090@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RY3QQ9LXq8Kb+OmG"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2502121802540.619090@ubuntu-linux-20-04-desktop>


--RY3QQ9LXq8Kb+OmG
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Feb 2025 03:28:19 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v1 2/3] automation: add jobs running tests from
 tools/tests/*

On Wed, Feb 12, 2025 at 06:07:37PM -0800, Stefano Stabellini wrote:
> On Thu, 13 Feb 2025, Marek Marczykowski-G=C3=B3recki wrote:
> > There are a bunch of tests in tools/tests/, let them run in CI.
> > For each subdirectory expect "make run" will run the test, and observe
> > its exit code. This way, adding new tests is easy, and they will be
> > automatically picked up.
> >=20
> > For better visibility, log test output to junit xml format, and let
> > gitlab ingest it. Set SUT_ADDR variable with name/address of the system
> > under test, so a network can be used to extract the file. The actual
> > address is set using DHCP. And for the test internal network, still add
> > the 192.168.0.1 IP (but don't replace the DHCP-provided one).
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
>=20
> Very nice!!
>=20
> Only one comment below
>=20
>=20
> > ---
> >  automation/gitlab-ci/test.yaml     | 23 +++++++++++++++-
> >  automation/scripts/build           |  1 +-
> >  automation/scripts/qubes-x86-64.sh | 27 +++++++++++++++++-
> >  automation/scripts/run-tools-tests | 47 ++++++++++++++++++++++++++++++=
+-
> >  4 files changed, 97 insertions(+), 1 deletion(-)
> >  create mode 100755 automation/scripts/run-tools-tests
> >=20
> > diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test=
=2Eyaml
> > index 1822e3ea5fd7..c21a37933881 100644
> > --- a/automation/gitlab-ci/test.yaml
> > +++ b/automation/gitlab-ci/test.yaml
> > @@ -130,6 +130,7 @@
> >      PCIDEV: "03:00.0"
> >      PCIDEV_INTR: "MSI-X"
> >      CONSOLE_OPTS: "console=3Dcom1 com1=3D115200,8n1"
> > +    SUT_ADDR: test-2.testnet
> >    artifacts:
> >      paths:
> >        - smoke.serial
> > @@ -263,6 +264,28 @@ adl-pvshim-x86-64-gcc-debug:
> >      - *x86-64-test-needs
> >      - alpine-3.18-gcc-debug
> > =20
> > +adl-tools-tests-pv-x86-64-gcc-debug:
> > +  extends: .adl-x86-64
> > +  script:
> > +    - ./automation/scripts/qubes-x86-64.sh tools-tests-pv 2>&1 | tee $=
{LOGFILE}
> > +  artifacts:
> > +    reports:
> > +      junit: tests-junit.xml
> > +  needs:
> > +    - *x86-64-test-needs
> > +    - alpine-3.18-gcc-debug
> > +
> > +adl-tools-tests-pvh-x86-64-gcc-debug:
> > +  extends: .adl-x86-64
> > +  script:
> > +    - ./automation/scripts/qubes-x86-64.sh tools-tests-pvh 2>&1 | tee =
${LOGFILE}
> > +  artifacts:
> > +    reports:
> > +      junit: tests-junit.xml
> > +  needs:
> > +    - *x86-64-test-needs
> > +    - alpine-3.18-gcc-debug
> > +
> >  zen3p-smoke-x86-64-gcc-debug:
> >    extends: .zen3p-x86-64
> >    script:
> > diff --git a/automation/scripts/build b/automation/scripts/build
> > index 952599cc25c2..522efe774ef3 100755
> > --- a/automation/scripts/build
> > +++ b/automation/scripts/build
> > @@ -109,5 +109,6 @@ else
> >      # even though dist/ contains everything, while some containers don=
't even
> >      # build Xen
> >      cp -r dist binaries/
> > +    cp -r tools/tests binaries/
> >      collect_xen_artefacts
> >  fi
> > diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qu=
bes-x86-64.sh
> > index 7eb3ce1bf703..81d239cc8b75 100755
> > --- a/automation/scripts/qubes-x86-64.sh
> > +++ b/automation/scripts/qubes-x86-64.sh
> > @@ -10,6 +10,8 @@ set -ex
> >  #  - pci-pv         PV dom0,  PV domU + PCI Passthrough
> >  #  - pvshim         PV dom0,  PVSHIM domU
> >  #  - s3             PV dom0,  S3 suspend/resume
> > +#  - tools-tests-pv PV dom0, run tests from tools/tests/*
> > +#  - tools-tests-pvh PVH dom0, run tests from tools/tests/*
> >  test_variant=3D$1
> > =20
> >  ### defaults
> > @@ -19,6 +21,7 @@ timeout=3D120
> >  domU_type=3D"pvh"
> >  domU_vif=3D"'bridge=3Dxenbr0',"
> >  domU_extra_config=3D
> > +retrieve_xml=3D
> > =20
> >  case "${test_variant}" in
> >      ### test: smoke test & smoke test PVH & smoke test HVM & smoke tes=
t PVSHIM
> > @@ -126,6 +129,21 @@ done
> >  "
> >          ;;
> > =20
> > +    ### tests: tools-tests-pv, tools-tests-pvh
> > +    "tools-tests-pv"|"tools-tests-pvh")
> > +        retrieve_xml=3D1
> > +        passed=3D"test passed"
> > +        domU_check=3D""
> > +        dom0_check=3D"
> > +/tests/run-tools-tests /tests /tmp/tests-junit.xml && echo \"${passed}=
\"
> > +nc -l -p 8080 < /tmp/tests-junit.xml >/dev/null &
> > +"
> > +        if [ "${test_variant}" =3D "tools-tests-pvh" ]; then
> > +            extra_xen_opts=3D"dom0=3Dpvh"
> > +        fi
> > +
> > +        ;;
> > +
> >      *)
> >          echo "Unrecognised test_variant '${test_variant}'" >&2
> >          exit 1
> > @@ -178,6 +196,8 @@ mkdir srv
> >  mkdir sys
> >  rm var/run
> >  cp -ar ../binaries/dist/install/* .
> > +cp -ar ../binaries/tests .
> > +cp -a ../automation/scripts/run-tools-tests tests/
> > =20
> >  echo "#!/bin/bash
> > =20
> > @@ -188,7 +208,8 @@ brctl addbr xenbr0
> >  brctl addif xenbr0 eth0
> >  ifconfig eth0 up
> >  ifconfig xenbr0 up
> > -ifconfig xenbr0 192.168.0.1
> > +timeout 30s udhcpc -i xenbr0

This is actually wrong with tests doing passthrough. I'll send v2 that
limits it.

> > +ip addr add dev xenbr0 192.168.0.1/24
> > =20
> >  " > etc/local.d/xen.start
> > =20
> > @@ -272,6 +293,10 @@ if [ $timeout -le 0 ]; then
> >      exit 1
> >  fi
> > =20
> > +if [ -n "$retrieve_xml" ]; then
> > +    nc -w 10 "$SUT_ADDR" 8080 > tests-junit.xml </dev/null
> > +fi
> > +
> >  sleep 1
> > =20
> >  (grep -q "^Welcome to Alpine Linux" smoke.serial && grep -q "${passed}=
" smoke.serial) || exit 1
> > diff --git a/automation/scripts/run-tools-tests b/automation/scripts/ru=
n-tools-tests
> > new file mode 100755
> > index 000000000000..242a9edad941
> > --- /dev/null
> > +++ b/automation/scripts/run-tools-tests
> > @@ -0,0 +1,47 @@
> > +#!/bin/sh
>=20
> It should be /bin/bash

That script is running inside SUT (started from initramfs) which is
rather minimal. I think it currently has bash, but with the initramfs at
over 200MB (compressed) I can see trimming it in the future...

> You could also consider -e and maybe -x

That is a good idea (but also failures need to not break the XML
structure, so it will clutter the script a bit).

> > +usage() {
> > +    echo "Usage: $0 tests-dir xml-out"
> > +}
> > +
> > +xml_out=3D$2
> > +if [ -z "$xml_out" ]; then
> > +  xml_out=3D/dev/null
> > +fi
> > +printf '<?xml version=3D"1.0" encoding=3D"UTF-8"?>\n' > "$xml_out"
> > +printf '<testsuites name=3D"tools.tests">\n' >> "$xml_out"
> > +printf ' <testsuite name=3D"tools.tests">\n' >> "$xml_out"
> > +failed=3D
> > +for dir in "$1"/*; do
> > +    [ -d "$dir" ] || continue
> > +    echo "Running test in $dir"
> > +    printf '  <testcase name=3D"%s">\n' "$dir" >> "$xml_out"
> > +    ret=3D
> > +    for f in "$dir"/*; do
> > +        [ -f "$f" ] || continue
> > +        [ -x "$f" ] || continue
> > +        "$f" 2>&1 | tee /tmp/out
> > +        ret=3D$?
> > +        if [ "$ret" -ne 0 ]; then
> > +            echo "FAILED"
> > +            failed+=3D" $dir"
> > +            printf '   <failure type=3D"failure" message=3D"binary %s =
exited with code %d">\n' "$f" "$ret" >> "$xml_out"
> > +            # TODO: could use xml escaping... but current tests seems =
to
> > +            # produce sane output
> > +            cat /tmp/out >> "$xml_out"
> > +            printf '   </failure>\n' "$f" "$ret" >> "$xml_out"
> > +        else
> > +            echo "PASSED"
> > +        fi
> > +    done
> > +    if [ -z "$ret" ]; then
> > +        printf '   <skipped type=3D"skipped" message=3D"test not found=
"/>\n' >> "$xml_out"
> > +    fi
> > +    printf '  </testcase>\n' "$dir" >> "$xml_out"
> > +done
> > +printf ' </testsuite>\n' >> "$xml_out"
> > +printf '</testsuites>\n' >> "$xml_out"
> > +
> > +if [ -n "$failed" ]; then
> > +    exit 1
> > +fi
> > --=20
> > git-series 0.9.1
> >=20


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--RY3QQ9LXq8Kb+OmG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmetWMMACgkQ24/THMrX
1ywI/gf+KR1E5sgQzA3kTET3cy+7RWRGlvNA9Z/zePf8nrBXOKR0oTmr2/ojvkOF
4cXZ53p7sn4dBdJrOmeYyQ8q48tHt+e+t4L+J+zRXE/SoviizadAO1L2/7O8CH1H
BkLOJREfticEYQs/9mEVJQkJ4yUScsBTdyabdmXU1lIqyeWlUDs7IP19RJQ+wvZE
NWEME9iBmWcgPV2dEGOp6zlslB+MSJzIyTDBXIt3kqk3w0qIYTbkMMUDp05iOhDx
WgU0dYM64OtG7ck4sX82iK8qsZ95SENHUCy68PLdKfju5PD2IDrafsXOvZ3MIC6c
w+2dZokFJR1ucxq5sBdWhjYyNCYfsg==
=wWww
-----END PGP SIGNATURE-----

--RY3QQ9LXq8Kb+OmG--

