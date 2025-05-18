Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 911A6ABB01E
	for <lists+xen-devel@lfdr.de>; Sun, 18 May 2025 13:58:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989033.1373382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGcem-0004Ij-5a; Sun, 18 May 2025 11:58:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989033.1373382; Sun, 18 May 2025 11:58:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGcem-0004GH-1O; Sun, 18 May 2025 11:58:16 +0000
Received: by outflank-mailman (input) for mailman id 989033;
 Sun, 18 May 2025 11:58:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GB/u=YC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uGcek-0004G9-AM
 for xen-devel@lists.xenproject.org; Sun, 18 May 2025 11:58:14 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5fb31810-33df-11f0-9eb8-5ba50f476ded;
 Sun, 18 May 2025 13:58:12 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a0b9af89f2so2345121f8f.3
 for <xen-devel@lists.xenproject.org>; Sun, 18 May 2025 04:58:12 -0700 (PDT)
Received: from [172.18.118.114] (ip-185-104-138-68.ptr.icomera.net.
 [185.104.138.68]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f39e851bsm180391485e9.28.2025.05.18.04.58.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 May 2025 04:58:11 -0700 (PDT)
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
X-Inumbo-ID: 5fb31810-33df-11f0-9eb8-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747569492; x=1748174292; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EfFDD0Ep71bUkaHEZI4plG/Hq+OZ0RUEHTBA7USNnFk=;
        b=QvtzH3WLR9KpRytOPiHf+mjgzUwO1qaXKcrFSUninJ2XB8qF2WWMf4hjg2J8RyVopQ
         xWlvtFfmcNU6Yfn9IBpuhHCMUCotN2kDSPnPPsx2bsuMWOswwiv1l/1FEGc8jQ5dJYTg
         KuQkpJqBpMq5SIgEx9WBtC/7O3gmd/uNXTT7cOmPwfT+plKFS4ITlLYjP7y6ewSbIXhM
         LxtAzamL99z5BUNhknHC5/+Bt+aHGyagFghUH6TkzXBkby6uOjGlDRJlQTQyVwxwOBRX
         b0QFhnM18jUVWdmKLG2iZ7+V5mHuVQyY0qILqSRHnhy76xSTAyYg29ZYioDObDYRd7Cj
         /92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747569492; x=1748174292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EfFDD0Ep71bUkaHEZI4plG/Hq+OZ0RUEHTBA7USNnFk=;
        b=Iu/8Jimz18CR9cRKhhbHh6V75sucj3FtcSiHJ1kdcwe36quWHl9ByiBAEdVQt/R7JA
         9UyAf/AEQgVZ6QvO89u41S2k0XVVfln6A8PGygm3E57rFedZfc9Ozk/NBWzH1WIDBOk6
         2meLGvgAla3iEXBUEqsVP2M+HanBcqZanM7Tb8KNJyDvf8pG/upGfB6K/IG81ga4a1Mm
         XKBbSeV+P7HOu9fgEsPsZMriizI9/1pntyKZtsswdOLXKT+///6t3Q6l1Xd8rE88LPbB
         do/SyaQli05ADbaEwq4wAYgFLH6ezVML77fiAYd7hGgk1TKd0WXWN/VU55e68RHFirB1
         7J+A==
X-Forwarded-Encrypted: i=1; AJvYcCWl+n7RlFnurcAwiZwRYQjgGBC5JB9ceY9PWqQJUBVA+qvzDdxONgA9GyY8KDGugPHOHtNJ2/pyOGY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxXlBmN1Igf1hM5RmiENBnZIkFPrzoWDKkx3SUggDRCDpMZARAp
	w4gUarIgrv218QO6mNXhK1ikQzBNK0LFsbsjuKqAMa+5YrpC40yAf/YOEJpJCsafJQ==
X-Gm-Gg: ASbGnctZGrA0l0bHOYmVRVPsqD44AubY4WFXCiRr0EjUBPPwB0gv+O6CQr6Xf3ft3YO
	u6IIKUZwOLCOli0FRbWFTebaSULwCDl95FNiEisH1uKpuT+Lm0ugJNbYyZgs+6guZTaoxpM9qnm
	coBGQJEfFlhW2AV/x5Va0c0xpYNNZO2ECCfsNV7K6dApZr2H8Fbw2pKloRDlRtyCl6keDDnNwRh
	83ptqEeBS+9VY+Yr9s3Qr55yWaV+DT+5aQkTclGK36crDpvbk/HOMX8Yt/tDQkt2ZByMFpuRGoo
	3XtK5mH5d32P6OvnGP/WXc7iAzdZbLWWopPPkMwkGeGGsJJiD77fhagBVJyo65bwxISN6HqUebd
	a0QEFYo22QstlEiPiuKbfPiSSvlDMKmZJE3Y=
X-Google-Smtp-Source: AGHT+IHZrks0jbhlGLi+2hT+pf60RGgtpIVUiYgmhpz8o5NSdYrp9tMnLXEvdupH6VrPdqMvfnb85Q==
X-Received: by 2002:a05:6000:2ae:b0:3a1:fd74:4248 with SMTP id ffacd0b85a97d-3a35fe5c64fmr5330916f8f.5.1747569492104;
        Sun, 18 May 2025 04:58:12 -0700 (PDT)
Message-ID: <523bbab2-01fc-4ed5-910a-09e8f25a8296@suse.com>
Date: Sun, 18 May 2025 13:58:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] livepatch: Embed public key in Xen
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Kevin Lampis <kevin.lampis@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250515093822.659916-1-ross.lagerwall@citrix.com>
 <20250515093822.659916-3-ross.lagerwall@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250515093822.659916-3-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.05.2025 11:38, Ross Lagerwall wrote:
> --- a/xen/crypto/Makefile
> +++ b/xen/crypto/Makefile
> @@ -1,2 +1,15 @@
>  obj-y += rijndael.o
>  obj-y += vmac.o
> +
> +obj-$(CONFIG_PAYLOAD_VERIFY) += builtin_payload_key.o

For new files please prefer dashes over underscores in their names.

> +ifeq ($(CONFIG_PAYLOAD_VERIFY),y)

This isn't needed, is it?

> +key_path := $(objtree)/$(patsubst "%",%,$(CONFIG_PAYLOAD_VERIFY_KEY))

Since they can be used there, dashes imo also want preferring for new
make variables (unless they need exporting to the shell).

> @@ -143,6 +144,11 @@ struct payload;
>  int revert_payload(struct payload *data);
>  void revert_payload_tail(struct payload *data);
>  
> +#ifdef CONFIG_PAYLOAD_VERIFY
> +/* The public key data contained with Xen used to verify payload signatures. */
> +extern const uint8_t __initconst xen_livepatch_key_data[];

Nit: Section placement annotations are generally meaningless on declarations,
and hence want omitting from there.

Jan

