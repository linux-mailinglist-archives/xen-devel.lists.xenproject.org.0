Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CD892EAF3
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 16:42:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757568.1166591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRuzY-000340-CE; Thu, 11 Jul 2024 14:41:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757568.1166591; Thu, 11 Jul 2024 14:41:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRuzY-00031s-9i; Thu, 11 Jul 2024 14:41:52 +0000
Received: by outflank-mailman (input) for mailman id 757568;
 Thu, 11 Jul 2024 14:41:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FutR=OL=bounce.vates.tech=bounce-md_30504962.668fef2a.v1-6b4da828666440eba984c71482c3a918@srs-se1.protection.inumbo.net>)
 id 1sRuzW-00031k-DS
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 14:41:50 +0000
Received: from mail136-18.atl41.mandrillapp.com
 (mail136-18.atl41.mandrillapp.com [198.2.136.18])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3c1eb28-3f93-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 16:41:48 +0200 (CEST)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-18.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4WKcqt6bJ7zB5vBHF
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 14:41:46 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 6b4da828666440eba984c71482c3a918; Thu, 11 Jul 2024 14:41:46 +0000
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
X-Inumbo-ID: b3c1eb28-3f93-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1720708906; x=1720969406;
	bh=se2giUvnO4PwVBvTRL7DluEUm8fFM6gw7G2S7YthMY0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ZdxKOz3S2q9zXpDt/OeEtgV4S8Anl8sKG8O8o4gNNul6wqWkoaoNkdfKNnAvoX8Iy
	 w6hP6za1sJdGSC2Zkywkq5YEpuZztyxOOGC1byRNrdnhZ+OAPMjR0eJXQB1JOpJTGc
	 bL0szwWqjws9DhRXoTeUAwQC+08scBpkQlqSkuAVJKldko+FTJp8apDIAuBa+ZDri/
	 ZuZD8ToC3nOaLTnMdM9T1JyY3ArqrM7JHUSPlCdkVpThFiciQb9JanvzPqQrH+aRyE
	 9LV64PzBGVrSlaL3ZRFv4SEAAtJ7EPbmec2sObVDjHaKJ1eUTuTtr2uMbRJod450c5
	 UXOoS45hchjBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1720708906; x=1720969406; i=anthony.perard@vates.tech;
	bh=se2giUvnO4PwVBvTRL7DluEUm8fFM6gw7G2S7YthMY0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=iAlquJleJ0VQdEW6dK7ju5aZezp6prfFG1oZHsyIHX+3INQjOFMQ8ImDHdQrFYVwk
	 1Ac7dDJHHjL9luE2fufwOxMM6BYWsBSXJATJtlOckn19xUNW5Z+T1xsr0wwfqeBRwM
	 /3R9R1qNtsXhyj6mIjSqE/dCeBHDIn9fMVEgH9aVZ9+1r8k4PIeNM25n11eXg8y/wW
	 c/saT+5DPJ8JL8UdcK+PB/iQPhOjt79XrqXPUnEHfP/dtTwE6cudnHMKakAKbc4jnb
	 AkxT6tfitY2bA1S20kfUs9EyxZG2H1UTm8pho3BzredJdYaMqOKx4jUq+mkHIkNrsZ
	 n9e1vBkOB3xPg==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2007/12]=20CI:=20Introduce=20a=20debian:12-ppc64le=20container?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1720708905608
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, Shawn Anastasio <sanastasio@raptorengineering.com>
Message-Id: <Zo/vKR2YuDJdFLq+@l14>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com> <20240711111517.3064810-8-andrew.cooper3@citrix.com>
In-Reply-To: <20240711111517.3064810-8-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.6b4da828666440eba984c71482c3a918?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240711:md
Date: Thu, 11 Jul 2024 14:41:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Jul 11, 2024 at 12:15:12PM +0100, Andrew Cooper wrote:
> diff --git a/automation/build/debian/12-ppc64le.dockerfile b/automation/build/debian/12-ppc64le.dockerfile
> new file mode 100644
> index 000000000000..3b311e675ef5
> --- /dev/null
> +++ b/automation/build/debian/12-ppc64le.dockerfile
> @@ -0,0 +1,36 @@
...
> +ENV CROSS_COMPILE=powerpc64le-linux-gnu-
> +ENV XEN_TARGET_ARCH=ppc64

I don't really like these two envvars. The second one is already set in
the env by gitlab, the first one could in theory also come from
gitlab-ci.

But I guess that comment comes from the fact that I don't really know
why we would want a second bookworm containers with only a few packages.

> +
> +RUN <<EOF
> +#!/bin/bash
> +    set -e
> +
> +    useradd --create-home user
> +
> +    apt-get -y update
> +
> +    DEPS=(
> +        # Xen
> +        bison
> +        build-essential
> +        checkpolicy
> +        flex
> +        gcc-powerpc64le-linux-gnu
> +        python3-minimal
> +
> +        # Qemu for test phase
> +        qemu-system-ppc
> +    )
> +
> +    apt-get -y --no-install-recommends install "${DEPS[@]}"
> +    rm -rf /var/lib/apt/lists/*

Other containers do also `apt-get clean` is this not needed? Or maybe
the original containers is setup to not save packages?

/me looking into /var/cache

Looks empty enough, so I guess `apt-get clean` is optional.

Changes looks good enough, so:
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

