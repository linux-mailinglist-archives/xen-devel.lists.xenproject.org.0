Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06169B1EDD4
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 19:31:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074919.1437394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukQvW-0001Pf-1t; Fri, 08 Aug 2025 17:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074919.1437394; Fri, 08 Aug 2025 17:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukQvV-0001N8-UY; Fri, 08 Aug 2025 17:30:45 +0000
Received: by outflank-mailman (input) for mailman id 1074919;
 Fri, 08 Aug 2025 17:30:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hyIc=2U=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ukQvT-0001IW-2P
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 17:30:44 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 672f3a0a-747d-11f0-b898-0df219b8e170;
 Fri, 08 Aug 2025 19:30:40 +0200 (CEST)
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
X-Inumbo-ID: 672f3a0a-747d-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1754674236; x=1754933436;
	bh=PYlItJ7VdB1lNO0igL3cbKXbxjyBwIPBcnOMcJ+6nPs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=amC8nZRiq6Qg9aumA5UW0o2VJJVle0VQQxjpeoJOnju/2brI822exfmVRff+3IhCo
	 ZgjFS97VqO4qlvqvBq1NsPp1xI0Y0CtkVQ44boymqtdluwtOgqm+C9dm3ukD9R/y4I
	 AcbwEnFcIjj1uMX7PdV9Gh9iGbRSDfwN28BOqzdw3Q2hvAFkOm+C2o6zuyLcgmQFM6
	 srJbx6wEBy6lCvHv1LGhKWZCktdlvjWqlTnIE+bvdBeDrUqYVErORD2akvlnHNUf0J
	 n1qna9F4m6neBByPjii7WR4RPgSps6v99oINfVKf/stzN+fBiiIfZQ5RMFv4BaslSI
	 3YvauV3MFFDoA==
Date: Fri, 08 Aug 2025 17:30:33 +0000
To: =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 3/3] CI: Run driver domains test on Debian too
Message-ID: <aJY0NYbcHF6sZ/bY@kraken>
In-Reply-To: <3f4e22c2424e8b534fe743aad1e1ee4934f9444c.1754663560.git-series.marmarek@invisiblethingslab.com>
References: <cover.961bf2f7929562a899b182283446598d4c055149.1754663560.git-series.marmarek@invisiblethingslab.com> <3f4e22c2424e8b534fe743aad1e1ee4934f9444c.1754663560.git-series.marmarek@invisiblethingslab.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 3c013f5f2558418e7c7fe9b607a3b0fdb25416ec
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 08, 2025 at 04:32:43PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> The recent failure affected only glibc-based systems, so do the test on
> Debian too.
>=20
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>

Just one tiny comment below, otherwise looks good to me!

With or without addressing it:

Reviewed-by: Denis Mukhin <dmukhin@ford.com>=20

> ---
> Changes in v2:
> - use systemd in Debian
>=20
> I once got the following timeout:
>=20
>     (backend) =3D=3D> /var/log/xen/xldevd.log <=3D=3D
>     (backend) libxl: error: libxl_aoutils.c:539:async_exec_timeout: killi=
ng execution of /etc/xen/scripts/vif-bridge online because of timeout
>=20
> https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/10961394681
> (docker-bobcat runner)
>=20
> Could be related to having systemd in domU (and being on QEMU TCG, not
> even KVM). I never hit this case on Alpine nor Debian with OpenRC. If
> that will repeat, may need some adjustments - more CPUs in QEMU? limit
> to more powerful runners? setup KVM on the runners?
> ---
>  automation/gitlab-ci/test.yaml                  | 19 ++++++++++++++++++-
>  automation/scripts/qemu-driverdomains-x86_64.sh | 18 +++++++++++++++--
>  2 files changed, 35 insertions(+), 2 deletions(-)
>=20
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.y=
aml
> index 5c4b2dc304b4..a5ae03b0eee9 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -30,6 +30,17 @@
>      job: microcode-x86
>      ref: master
>=20
> +.debian-x86-64-test-needs: &debian-x86-64-test-needs
> +  - project: xen-project/hardware/test-artifacts
> +    job: linux-6.6.56-x86_64
> +    ref: master
> +  - project: xen-project/hardware/test-artifacts
> +    job: debian-12-x86_64-rootfs
> +    ref: master
> +  - project: xen-project/hardware/test-artifacts
> +    job: microcode-x86
> +    ref: master
> +
>  .qemu-arm64:
>    extends: .test-jobs-common
>    variables:
> @@ -664,6 +675,14 @@ qemu-alpine-driverdomains-x86_64-gcc:
>      - *x86-64-test-needs
>      - alpine-3.18-gcc
>=20
> +qemu-debian-12-driverdomains-x86_64-gcc:
> +  extends: .qemu-x86-64
> +  script:
> +    - ./automation/scripts/qemu-driverdomains-x86_64.sh 2>&1 | tee ${LOG=
FILE}
> +  needs:
> +    - *debian-x86-64-test-needs
> +    - debian-12-x86_64-gcc-debug
> +
>  qemu-smoke-x86-64-gcc:
>    extends: .qemu-smoke-x86-64
>    script:
> diff --git a/automation/scripts/qemu-driverdomains-x86_64.sh b/automation=
/scripts/qemu-driverdomains-x86_64.sh
> index a8e2ceb33527..e5765ba5dbd6 100755
> --- a/automation/scripts/qemu-driverdomains-x86_64.sh
> +++ b/automation/scripts/qemu-driverdomains-x86_64.sh
> @@ -23,7 +23,11 @@ if grep -q test=3Dbackend /proc/cmdline; then
>      brctl addbr xenbr0
>      ip link set xenbr0 up
>      ip addr add 192.168.0.1/24 dev xenbr0
> -    bash /etc/init.d/xendriverdomain start
> +    if [ -d /run/systemd ]; then
> +        systemctl start xendriverdomain
> +    else
> +        bash /etc/init.d/xendriverdomain start
> +    fi
>      # log backend-related logs to the console
>      tail -F /var/log/xen/xldevd.log /var/log/xen/xen-hotplug.log >>/dev/=
console 2>/dev/null &
>  else
> @@ -77,7 +81,11 @@ cat > etc/local.d/xen.start << EOF
>=20
>  set -x
>=20
> -bash /etc/init.d/xencommons start
> +if [ -d /run/systemd ]; then
> +    systemctl start xen-init-dom0.service
> +else
> +    bash /etc/init.d/xencommons start
> +fi
>=20
>  xl list
>=20
> @@ -94,6 +102,12 @@ cp ../bzImage ./root/
>  mkdir -p etc/default
>  echo 'XENCONSOLED_TRACE=3Dall' >> etc/default/xencommons
>  mkdir -p var/log/xen/console
> +if [ -e etc/systemd/system.conf ]; then
> +    chroot . systemctl enable proc-xen.mount \
> +        xenstored.service \
> +        xenconsoled.service \
> +        xen-init-dom0.service

I would keep the list of files sorted; that may help with future merges, if
any.

> +fi
>  mkfs.ext4 -d . ../dom0-rootfs.img 2048M
>  cd ..
>  rm -rf rootfs
> --
> git-series 0.9.1
>=20


