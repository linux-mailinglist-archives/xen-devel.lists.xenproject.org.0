Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9624BCB176E
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 01:04:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182328.1505216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT7h2-0000xh-PE; Wed, 10 Dec 2025 00:04:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182328.1505216; Wed, 10 Dec 2025 00:04:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT7h2-0000vE-Mg; Wed, 10 Dec 2025 00:04:32 +0000
Received: by outflank-mailman (input) for mailman id 1182328;
 Wed, 10 Dec 2025 00:04:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8oeO=6Q=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vT7h1-0000v3-4S
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 00:04:31 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc224bf2-d55b-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 01:04:29 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F0FA060129;
 Wed, 10 Dec 2025 00:04:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1815C4CEF5;
 Wed, 10 Dec 2025 00:04:27 +0000 (UTC)
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
X-Inumbo-ID: cc224bf2-d55b-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765325068;
	bh=HG25hktIXXAA6Q6WBryBBZfcvkSTXdLg6Q3rNrJHasM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cCVNNTnzY5XvKha5mNg8m7WSOFhdQ8plRvxi/yAJIR7nONHyEL8xzBS2A9NXEhHGd
	 TC3Nx4Oq8Ty4DkyVLA8sfBnQU75sbIfzUXsSDQin4dqkcZ8Q0kPrasLHefQuscvZOc
	 uc9YNjRoQtmH8XJLPwMuRF1JCRulkCtUFdjEPVY8TFZKfAYtKwOQ5I+hSLGWu9NCX0
	 SzkKJioOHJG+n3y/wcMItUpEOMWqVW+X84WMNmVI50tMVQyTRAYC6xyKOE5aFNCF6l
	 mV7JHSuq5KFUejJ0PA8/0ybcBI+gbmCJZv3CZMrn9XldzLHFNIvUWo8VDjEr039ruw
	 3i3PxCeNaFYig==
Date: Tue, 9 Dec 2025 16:04:27 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 6/6] CI: Run driver domains test on Debian too
In-Reply-To: <7fdf483cb41ba04ec3949fba31991ffec2c5b712.1764989098.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2512091604200.19429@ubuntu-linux-20-04-desktop>
References: <cover.b56a66dfe4d98db2f1cc8b1fe0c2091d02cebe38.1764989098.git-series.marmarek@invisiblethingslab.com> <7fdf483cb41ba04ec3949fba31991ffec2c5b712.1764989098.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1256635277-1765325069=:19429"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1256635277-1765325069=:19429
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sat, 6 Dec 2025, Marek Marczykowski-Górecki wrote:
> The recent failure affected only glibc-based systems, so do the test on
> Debian too.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v3:
> - update to trixie
> Changes in v2:
> - use systemd in Debian
> ---
>  automation/build/debian/13-x86_64.dockerfile    |  1 +-
>  automation/gitlab-ci/test.yaml                  | 19 ++++++++++++++++++-
>  automation/scripts/qemu-driverdomains-x86_64.sh | 18 +++++++++++++++--
>  3 files changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/automation/build/debian/13-x86_64.dockerfile b/automation/build/debian/13-x86_64.dockerfile
> index 6382bafbd5bd..3f84ba4a8823 100644
> --- a/automation/build/debian/13-x86_64.dockerfile
> +++ b/automation/build/debian/13-x86_64.dockerfile
> @@ -60,6 +60,7 @@ RUN <<EOF
>          fakeroot
>          ovmf
>          qemu-system-x86
> +        systemctl
>  
>          # for build-each-commit-gcc
>          ccache
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index abc5339a74ab..ffb2880f5af3 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -30,6 +30,17 @@
>      job: microcode-x86
>      ref: master
>  
> +.debian-x86-64-test-needs: &debian-x86-64-test-needs
> +  - project: xen-project/hardware/test-artifacts
> +    job: linux-6.6.56-x86_64
> +    ref: master
> +  - project: xen-project/hardware/test-artifacts
> +    job: debian-13-x86_64-rootfs
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
>      - alpine-3.22-gcc
>  
> +qemu-debian-13-driverdomains-x86_64-gcc:
> +  extends: .qemu-x86-64
> +  script:
> +    - ./automation/scripts/qemu-driverdomains-x86_64.sh 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *debian-x86-64-test-needs
> +    - debian-13-x86_64-gcc-debug
> +
>  qemu-smoke-x86-64-gcc:
>    extends: .qemu-smoke-x86-64
>    script:
> diff --git a/automation/scripts/qemu-driverdomains-x86_64.sh b/automation/scripts/qemu-driverdomains-x86_64.sh
> index c0241da54168..6a69282470ca 100755
> --- a/automation/scripts/qemu-driverdomains-x86_64.sh
> +++ b/automation/scripts/qemu-driverdomains-x86_64.sh
> @@ -23,7 +23,11 @@ if grep -q test=backend /proc/cmdline; then
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
>      tail -F /var/log/xen/xldevd.log /var/log/xen/xen-hotplug.log >>/dev/console 2>/dev/null &
>  else
> @@ -85,7 +89,11 @@ cat > etc/local.d/xen.start << EOF
>  
>  set -x
>  
> -bash /etc/init.d/xencommons start
> +if [ -d /run/systemd ]; then
> +    systemctl start xen-init-dom0.service
> +else
> +    bash /etc/init.d/xencommons start
> +fi
>  
>  xl list
>  
> @@ -102,6 +110,12 @@ cp ../bzImage ./root/
>  mkdir -p etc/default
>  echo 'XENCONSOLED_TRACE=all' >> etc/default/xencommons
>  mkdir -p var/log/xen/console
> +if [ -e etc/systemd/system.conf ]; then
> +    systemctl --root=. enable \
> +        xenstored.service \
> +        xenconsoled.service \
> +        xen-init-dom0.service
> +fi
>  fakeroot -i ../fakeroot-save mkfs.ext4 -d . ../dom0-rootfs.img 2048M
>  cd ..
>  rm -rf rootfs
> -- 
> git-series 0.9.1
> 
--8323329-1256635277-1765325069=:19429--

