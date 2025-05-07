Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5DAAAE816
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 19:45:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978774.1365655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCipA-000617-Do; Wed, 07 May 2025 17:44:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978774.1365655; Wed, 07 May 2025 17:44:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCipA-0005zS-BB; Wed, 07 May 2025 17:44:52 +0000
Received: by outflank-mailman (input) for mailman id 978774;
 Wed, 07 May 2025 17:44:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zuHe=XX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uCip9-0005zM-Gm
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 17:44:51 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9b4b960-2b6a-11f0-9eb4-5ba50f476ded;
 Wed, 07 May 2025 19:44:50 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cfe574976so1051705e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 May 2025 10:44:50 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-442cd33331bsm8034595e9.14.2025.05.07.10.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 10:44:49 -0700 (PDT)
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
X-Inumbo-ID: f9b4b960-2b6a-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746639890; x=1747244690; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yyiVLi+bqwfWp97V8f32HPvB5AMqHZCesJ+YUCWwvfc=;
        b=PdOyeksEonFp31wOek3QV/asu4ZZKrNdiZQYu++p9c//OqNkj/akrkblacWqKWcUw7
         FhQVPkZyJ/PCKcNKPSGpFEGywx9KpmVbSbzAbokNZCg1DDdsnw5TQlxgV6ADSPEfsS5q
         RAXhu00Vb9iBQuaTRrr8AKm1IE4OCw0qX+Gn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746639890; x=1747244690;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yyiVLi+bqwfWp97V8f32HPvB5AMqHZCesJ+YUCWwvfc=;
        b=NhFXM4LyN4tkq9Qas2AQ9l0RLIB8oDGoO0d6RS3DwyoMnJoeUYsRp6yvHIpsxEC8hn
         XRzGNmUeVb6iKsS2q4F2PVD7Asl/3uO0GIhEuTIsi+B6c2fDML8Hy8K7EIvGgbVye5fa
         yuvUTvnrSXK73tJZS5JumhpZLU5KcbuCuq7561TCsNEzdjZ/sAw+3nRng2M1cLeesYz7
         cPLiFXborZEaz8shNaJMmCv6ch9qGMUIQp+fzjlt7gp8ElsfI5v2zUtM6Aus25j78oLp
         zdTLMHVwHK2vBZqdnh/YgyFpVtUsGkf5oSaI0XgylD8M9d5uzcBSXQU4a1uhp7TF1Ymi
         FYIA==
X-Forwarded-Encrypted: i=1; AJvYcCVgBJey4mODsieoee6Fu8KWK30kXQ1wsFi78FCmxjvoOppM9RdHkLh2O/WvrEYiraBQdJ38xCxsiOw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwSv9VX5+br67vt3T/NrUHKFoIUFzJmOhxRd+Rq7M2lMJWW65+6
	jUD1vA0YPxFXNPRSJpuLrXBM9rQuEq/WKCXUgQ+SuCsdafj5GMXRoaD9KhjwNz8=
X-Gm-Gg: ASbGncvtY3anP50daFFVW6uPYh5bp1QyjPt1fn5igW/Z3R1RXYeuVWzvdyNBh7pUex0
	xMuG597cHPjxlVgt9e94oD5urm0r+4oMOOQuMrga2A4gd3YBra65fFa6YS39LhCk5KucqYDx6LQ
	LCJHXcbtcCnNahqRsQX2ejV4Yjga1i38fZRLoORsaQlqqdNCq17c/R9O3En2FVQbVIlGrf8KIYW
	aSghDF78HJYu3jFZufj0XDBH/6Q7SBoqSh00Z858n34nxgwrsjPhl6d97ohyVc951ZCayBbtDqv
	Py3XTCBZKbkECpr8KUmRdkjSEZo7lV5QYZstVDWfswcnIg==
X-Google-Smtp-Source: AGHT+IE0xGs1odZQxpMXLISUXQGestLALpbY4lcNnbePKKNXgeGP9EmSyMkoKANL9gpodt3g3PlgCg==
X-Received: by 2002:a05:600c:3ba1:b0:441:d446:b636 with SMTP id 5b1f17b1804b1-441d44e479dmr39431615e9.27.1746639889964;
        Wed, 07 May 2025 10:44:49 -0700 (PDT)
Date: Wed, 7 May 2025 19:44:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jiqian Chen <Jiqian.Chen@amd.com>,
	Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: Re: [PATCH v20 2/2] vpci: translate virtual PCI bus topology for
 guests
Message-ID: <aBucENdwFYacsQAX@macbook.lan>
References: <20250418185840.335816-1-stewart.hildebrand@amd.com>
 <20250418185840.335816-3-stewart.hildebrand@amd.com>
 <aBnvlY3Dfc_Wpljw@macbook.lan>
 <3693f1ef-e305-4a6b-bb4e-3b842418387f@amd.com>
 <aBsPbyqL0XpjEdeo@macbook.lan>
 <eee6811b-36da-41be-83b0-21ec99d3b829@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eee6811b-36da-41be-83b0-21ec99d3b829@amd.com>

On Wed, May 07, 2025 at 09:38:51AM -0400, Stewart Hildebrand wrote:
> On 5/7/25 03:44, Roger Pau Monné wrote:
> > On Tue, May 06, 2025 at 11:05:13PM -0400, Stewart Hildebrand wrote:
> >> On 5/6/25 07:16, Roger Pau Monné wrote:
> >>> On Fri, Apr 18, 2025 at 02:58:37PM -0400, Stewart Hildebrand wrote:
> >>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >>>>  static int vpci_register_cmp(const struct vpci_register *r1,
> >>>>                               const struct vpci_register *r2)
> >>>>  {
> >>>> @@ -438,7 +473,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
> >>>>      const struct pci_dev *pdev;
> >>>>      const struct vpci_register *r;
> >>>>      unsigned int data_offset = 0;
> >>>> -    uint32_t data = ~(uint32_t)0;
> >>>> +    uint32_t data = 0xffffffffU >> (32 - 8 * size);
> >>>
> >>> This seems kind of unrelated to the rest of the code in the patch,
> >>> why is this needed?  Isn't it always fine to return all ones, and let
> >>> the caller truncate to the required size?
> >>>
> >>> Otherwise the code in vpci_read_hw() also needs to be adjusted.
> >>
> >> On Arm, since 9a5e22b64266 ("xen/arm: check read handler behavior") we
> >> assert that the read handlers don't set any bits above the access size.
> > 
> > I see.  That kind of diverges from x86 behavior, that AFAICT (see
> > memcpy() at tail of hvmemul_do_io()) instead truncates the memcpy to
> > the size of the access.
> > 
> > Maybe it would be better to instead of asserting just truncate the
> > returned value to the given size, as that would allow to just return
> > ~0 from handlers without having to care about the specific access
> > size.
> 
> The impression I get from [0] is that that on Arm, there's no benefit to
> performing truncation in xen/arch/arm/io.c. Doing so would needlessly
> affect other Arm internal read handlers (e.g. vGIC).

But isn't this truncation desirable in order to avoid possibly setting
bits outside of the access size?

> For vPCI
> specifically, however, we could potentially perform truncation in
> xen/arch/arm/vpci.c. So I guess it's a question of whether we want to
> give special treatment to vPCI compared to all other read handlers on
> Arm?

I would think doing the truncation uniformly for all reads would be
better, as we then ensure the value propagated to the registers always
matches the access size?

I'm not expert on ARM, but it seems cumbersome to force this to all
internal handlers, instead of just truncating the value in a single
place.

> >> I had adjusted data here due to returning it directly from vpci_read()
> >> in the current form of the patch. With your suggestion below we would
> >> only need to adjust vpci_read_hw() (and then data here would not
> >> strictly need adjusting).
> > 
> > Both returns would need adjusting IMO,
> 
> OK
> 
> > and it should have been part of
> > 9a5e22b64266 I think, since that's the commit that introduced the
> > checking.
> 
> If we proceed with adjusting vpci_read() and vpci_read_hw(): are you OK
> with these adjustments included in this patch, or would you prefer them
> being split into a pre-patch?

Ideally it should be a separate patch with a "Fixes:" tag that points
to the patch that added the ASSERT().  As I think the current vPCI code is
kind of broken without that truncation on ARM?

Thanks, Roger.

