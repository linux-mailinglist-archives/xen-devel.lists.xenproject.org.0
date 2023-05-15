Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A740D7040EA
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 00:24:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534866.832291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pygbk-0007KQ-Dz; Mon, 15 May 2023 22:23:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534866.832291; Mon, 15 May 2023 22:23:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pygbk-0007Hn-AZ; Mon, 15 May 2023 22:23:56 +0000
Received: by outflank-mailman (input) for mailman id 534866;
 Mon, 15 May 2023 22:23:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l5iH=BE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pygbj-0007Hh-7o
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 22:23:55 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c9d4170-f36f-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 00:23:54 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1731D63349;
 Mon, 15 May 2023 22:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F67C433EF;
 Mon, 15 May 2023 22:23:51 +0000 (UTC)
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
X-Inumbo-ID: 2c9d4170-f36f-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684189432;
	bh=7J+TjIjrqNFbQasiJrkzd+Aguwh6/1UXZj14kHSqUOg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LsnnI8r25QRFogAkE7TcZruWhqXqkI8ARK+uv4SlrlChZ9QiM+BqlkN8ZM8S3Q9i0
	 C+D7jrDJVFcz7XZ7Nbn76OTVQeb/5RaXyo2QsxjVbT7uwJJxhl9BW4nsLJw9rEY9io
	 3TCBthC72dc1ii/5FFogqKsSGZ3obLgj1XW+zzUW7dTumRPk0uGjpeAurZqaIs79xu
	 4vkJ2Sin3qXTApuvYYiEj6dj+8v1xuEBqpI2of2TzhrMpV15FxaDySPn48P/RKl47B
	 XyKLk+9ncPefzK7la7+nHfZuBlgtQTFWW4cSVtdl0I+B75rUTlTp+wWW0912TBwvye
	 NVBimlxRVEIkw==
Date: Mon, 15 May 2023 15:23:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 4/4] automation: add PV passthrough tests on a AMD Zen3+
 runner
In-Reply-To: <de2a2841e44f44eb7dd56c0b9a2c27fe041051e9.1683943670.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2305151444590.4125828@ubuntu-linux-20-04-desktop>
References: <cover.83768735557180cd65fb5f932c285271063e04ac.1683943670.git-series.marmarek@invisiblethingslab.com> <de2a2841e44f44eb7dd56c0b9a2c27fe041051e9.1683943670.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-168031179-1684187109=:4125828"
Content-ID: <alpine.DEB.2.22.394.2305151507050.4125828@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-168031179-1684187109=:4125828
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2305151507051.4125828@ubuntu-linux-20-04-desktop>

On Sat, 13 May 2023, Marek Marczykowski-Górecki wrote:
> The PV passthrough test currently fails on this system
> with:
> (d1) Can't find new memory area for initrd needed due to E820 map conflict
> 
> Setting e820_host=1 does not help. So, add this test with
> "allow_failure: true" until the problem is fixed.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> I'm unsure if this should be included. On one hand, the test case will
> help verifying potential fix. But on the other hand, until fixed it will
> be wasting time.

I am not sure about this one either. I committed the other patches. I'll
give it a few days for others to comment on this one.


> ---
>  automation/gitlab-ci/test.yaml |  9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 81d027532cca..7becb7a6b782 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -194,6 +194,15 @@ zen3p-smoke-x86-64-gcc-debug:
>      - *x86-64-test-needs
>      - alpine-3.12-gcc-debug
>  
> +zen3p-pci-pv-x86-64-gcc-debug:
> +  extends: .zen3p-x86-64
> +  allow_failure: true
> +  script:
> +    - ./automation/scripts/qubes-x86-64.sh pci-pv 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.12-gcc-debug
> +
>  zen3p-pci-hvm-x86-64-gcc-debug:
>    extends: .zen3p-x86-64
>    script:
> -- 
> git-series 0.9.1
> 
--8323329-168031179-1684187109=:4125828--

