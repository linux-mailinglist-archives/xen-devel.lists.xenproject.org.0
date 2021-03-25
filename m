Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94991348509
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 00:07:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101215.193425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPCaw-0007oE-Hg; Wed, 24 Mar 2021 23:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101215.193425; Wed, 24 Mar 2021 23:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPCaw-0007np-E5; Wed, 24 Mar 2021 23:07:22 +0000
Received: by outflank-mailman (input) for mailman id 101215;
 Wed, 24 Mar 2021 23:07:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8uro=IW=gmail.com=unixbhaskar@srs-us1.protection.inumbo.net>)
 id 1lPCau-0007nk-Ib
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 23:07:20 +0000
Received: from mail-qk1-x729.google.com (unknown [2607:f8b0:4864:20::729])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2efdf1de-2b15-471e-af28-c7949d341672;
 Wed, 24 Mar 2021 23:07:19 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id y18so17424qky.11
 for <xen-devel@lists.xenproject.org>; Wed, 24 Mar 2021 16:07:19 -0700 (PDT)
Received: from Slackware ([156.146.55.193])
 by smtp.gmail.com with ESMTPSA id m13sm2793041qkm.103.2021.03.24.16.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 16:07:18 -0700 (PDT)
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
X-Inumbo-ID: 2efdf1de-2b15-471e-af28-c7949d341672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=unU9mIXis029RymGHdH7V1zjjWKUJpo7L/5r2jBdOHw=;
        b=Aw54LjN39oNkovcR3V4TfpdwnEylMj/oVtzW/NXQdaYCxg3Z1Ec6YWTJf/U+L1LIjf
         35ZXylU6/XHmVtfM6knNs2/JPE81nifQvV5LbfJPqpX/txjlJFIpkoNMXSvXNR45JeN4
         scwViwmTM2ZaZcE4fK8t6bREcUD+COLNZBIQkktPUelFaQ64yTnrwNX3B7V0pGztfYQY
         UHxVmGhKa4Vcmg8LjpzVCWi5T78/dOtGgBzxKDzrdcJHyIjkuM24Fcc8qbKHGFlWy6Qo
         p3HTj2YIogqMHlwBlzT5cTsiAG43mqH3xFT3Ei4RnVgk6mk9UtlMkWge4kpsPogcioxs
         IXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=unU9mIXis029RymGHdH7V1zjjWKUJpo7L/5r2jBdOHw=;
        b=KiY/HP2VnjxerkZwPysWLZlW+0vJTqQ5Hs7+6fBiQVGwoMIV+67bbcWu90iAX+GuMJ
         lhjM58mGlIIOebaDPDUioxsyFAAUoODkgBM4ADhTXALxdOj661jvNpluJ+pFQO/Aj4sF
         5Um71Qda/+wsqDm8aFyLODx0s9Lv3WixDanO/K7bBrvUbu3tb1xHLrQKNIm70/9xURCC
         +R2rvlSsFdnaUlM7ZUQC1vKh9lCmzq61OvHbgObSR8LbGWtXy4wsdaIjv5gB+vIq/Ox8
         RCxo4TIaA3IbjWldDssx6ksYraaMUHIG4N6WLZBEbgcJZPxH2Gc7nkUGFRFaD1Olgo/G
         IdDw==
X-Gm-Message-State: AOAM531aU1YX3mnH9E5JtcVaaz7oPGcd4jhskeW0ZFEwLZXLSdyzP2h8
	9aPvQOMV80kQgBFqd0qHmnE=
X-Google-Smtp-Source: ABdhPJy0XDX6xf+AUtITEYmLy/Evqhue1H4jw/H6OCKGGRWyxuZQkdH3VsEtvbV9hUJzchPL3P/mIA==
X-Received: by 2002:a37:2749:: with SMTP id n70mr5477245qkn.105.1616627239714;
        Wed, 24 Mar 2021 16:07:19 -0700 (PDT)
Date: Thu, 25 Mar 2021 10:07:08 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, linux@armlinux.org.uk,
	xen-devel@lists.xenproject.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	jgross@suse.com, boris.ostrovsky@oracle.com
Subject: Re: [PATCH] ARM: xen/mm.c: A mundane typo fix
Message-ID: <YFwTdAnamANFsBPZ@Slackware>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>, linux@armlinux.org.uk,
	xen-devel@lists.xenproject.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	jgross@suse.com, boris.ostrovsky@oracle.com
References: <20210324133036.17665-1-unixbhaskar@gmail.com>
 <alpine.DEB.2.21.2103241154320.439@sstabellini-ThinkPad-T480s>
 <5e1b573a-6dc7-7f28-28ae-c509e6782fbf@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TCrfE9v/6+6uxuTN"
Content-Disposition: inline
In-Reply-To: <5e1b573a-6dc7-7f28-28ae-c509e6782fbf@infradead.org>


--TCrfE9v/6+6uxuTN
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On 11:59 Wed 24 Mar 2021, Randy Dunlap wrote:
>On 3/24/21 11:55 AM, Stefano Stabellini wrote:
>> On Wed, 24 Mar 2021, Bhaskar Chowdhury wrote:
>>> s/acrros/across/
>>>
>>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>
>>
>
>Hi,
>It seems to me like some of those "page" should be "pages".
>
>>> ---
>>>  arch/arm/xen/mm.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
>>> index 467fa225c3d0..be7c942c74bf 100644
>>> --- a/arch/arm/xen/mm.c
>>> +++ b/arch/arm/xen/mm.c
>>> @@ -105,7 +105,7 @@ bool xen_arch_need_swiotlb(struct device *dev,
>>>  	 *	- The Linux page refers to foreign memory
>>>  	 *	- The device doesn't support coherent DMA request
>>>  	 *
>>> -	 * The Linux page may be spanned acrros multiple Xen page, although>> +	 * The Linux page may be spanned across multiple Xen page, although
>
>	                                                     pages,
>
>>>  	 * it's not possible to have a mix of local and foreign Xen page.
>
>	                                                            pages.
>
>>>  	 * Furthermore, range_straddles_page_boundary is already checking
>>>  	 * if buffer is physically contiguous in the host RAM.
>>> --
>
Thank you....I have sent a V2 now.
>
>
>~Randy
>

--TCrfE9v/6+6uxuTN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAmBcE20ACgkQsjqdtxFL
KRUvIggA0Bu+io2ijz60vfhZz7xZNVSid1OoUl1Om/MMq2kve/J9NbkNzt7dGSaO
Nb8vdiEZT77497MkjBJ8U/pxck9POJdv7RJ4S5s949pPcbuP6PsGhlzk35nN7NqM
vZ42o9L0cEtLrIrAxWtl3Rscy6x7W90BHhDMhix174CXg5S8ciQ+MCPdo3EyBwuN
crlJJJZ6VbQiaxOkjGnxyRobSz+WpFCJa/XPioII8xf3p854qdgbVE0GLRaC5f9y
koN0TLULWOVyX8tm1LOkP8ACv6wIQehPlFCkxRLk8C67CUdmQdx+Mz/u6hQK54K2
WjwbqPHASv5QkWa+p9PHbF+GjV7yqg==
=PKSI
-----END PGP SIGNATURE-----

--TCrfE9v/6+6uxuTN--

