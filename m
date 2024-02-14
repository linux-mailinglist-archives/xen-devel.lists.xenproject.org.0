Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE4C854B03
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 15:04:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680807.1058945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raFrk-0006Ih-Ou; Wed, 14 Feb 2024 14:04:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680807.1058945; Wed, 14 Feb 2024 14:04:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raFrk-0006GT-M8; Wed, 14 Feb 2024 14:04:00 +0000
Received: by outflank-mailman (input) for mailman id 680807;
 Wed, 14 Feb 2024 14:04:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WArD=JX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1raFrk-0006GN-7W
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 14:04:00 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5ad1855-cb41-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 15:03:58 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-51171c9f4c0so6713159e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 06:03:58 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 kf24-20020a05622a2a9800b0042c6c5bc47fsm2019131qtb.83.2024.02.14.06.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 06:03:57 -0800 (PST)
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
X-Inumbo-ID: e5ad1855-cb41-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707919438; x=1708524238; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lhWgYXhhqFI+/ERbgKPrgT4K9Zc+cpdMIudB9KDFJgw=;
        b=XaRaRTZX+iyQPDJvcDhHN3rwsD875k1X9AFnF2vAMn8Q5PN7WaqPwcwCDATQUoebwx
         LsP/1iCdA7sekEiYngDabFMQh5BdGLv671q5SB3n61GDXq0bzK+JrlY79YT+Klcuap/3
         Fn/0DZMNXWe/fx/erDikYYXgBP09E0VqqF+0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707919438; x=1708524238;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lhWgYXhhqFI+/ERbgKPrgT4K9Zc+cpdMIudB9KDFJgw=;
        b=uFYGi5zAOIriVcVQSP4FXgNfaW4lWUz5kenrrII+LLQCsw0QVcr+Mi9+6JITgBRadj
         kN1u7z9rYza3fQvo2QJcUoR0HjBrFty3inviUpETzksBRC1v6HGHRWlHZTZu2EjvPxkW
         BukmsZUlhH4Bw0Ih+CXE0mMxC22RBY4QOiXSlX8QmuL183ZwuMlCXud3pGwWi99o+I+c
         kJKbAHZbwAQjSSlq/8lWkCpmTaJpaTj0XmkPfqvNOCYwHLDpLlRiFR88KS1WzXLSF94B
         KoxeYAIdzfst6IZr8pWF4lVL9OgiFLZe/pLpPCV4r65ph8RwDxLKfICIxwJwG7/HpcDK
         8GXw==
X-Forwarded-Encrypted: i=1; AJvYcCXJVp+bZ8bVBUJf9pHoW/LdagbeC8CTPR4RHydsyewAGOgaOOklBHAVQk8KT8EEueEJZWyUhXIdfOPoWcTV55lSJeMWFHgQUdAOlZSULIo=
X-Gm-Message-State: AOJu0YyJ6weGD/dPO8mSbrmXX8k7QQNu0xxrINfnw9vFcP/1xxTl6tHy
	5n1YeJR2zaz1CMNq7Jjm7VBithoXhTxeQ4TPr8SPhVz1KtBdQYhspGZqVfZ1fZE=
X-Google-Smtp-Source: AGHT+IGUd5Z04e/CMB3mAtU8dI0tbzt3pzLK0HxkmBTX6Qx0lnugbV/I/b/fa+ekAMdd2ICNTFFboQ==
X-Received: by 2002:a05:6512:2002:b0:511:a587:dc27 with SMTP id a2-20020a056512200200b00511a587dc27mr1396934lfb.43.1707919437787;
        Wed, 14 Feb 2024 06:03:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVR8mstF/miSV5POx81ZRwthvKfX2tMF+AFNWL2ksnzsfyEDMhejVVgCtvGmCx6D2xGvEiF93oTh436WXjv5l39rTOiuOLpiNJeyMJzDMqVdFEQw2kYpXiDrh0odw==
Date: Wed, 14 Feb 2024 15:03:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/5] iommu/x86: print RMRR/IVMD ranges using full
 addresses
Message-ID: <ZczIS7Rlnt0xeVGF@macbook>
References: <20240214103741.16189-1-roger.pau@citrix.com>
 <20240214103741.16189-3-roger.pau@citrix.com>
 <2416e41e-0b59-4e63-a9c2-550983b71c1c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2416e41e-0b59-4e63-a9c2-550983b71c1c@suse.com>

On Wed, Feb 14, 2024 at 02:22:09PM +0100, Jan Beulich wrote:
> On 14.02.2024 11:37, Roger Pau Monne wrote:
> > It's easier to correlate with the physical memory map if the addresses are
> > fully printed, instead of using frame numbers.
> > 
> > Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> In principle
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> I'm not sure though that this fully matches Andrew's intentions:
> 
> > --- a/xen/drivers/passthrough/x86/iommu.c
> > +++ b/xen/drivers/passthrough/x86/iommu.c
> > @@ -801,8 +801,8 @@ bool __init iommu_unity_region_ok(const char *prefix, mfn_t start, mfn_t end)
> >          return true;
> >  
> >      printk(XENLOG_WARNING
> > -           "%s: [%#" PRI_mfn " ,%#" PRI_mfn "] is not (entirely) in reserved memory\n",
> > -           prefix, mfn_x(start), mfn_x(end));
> > +           "%s: [%#lx, %#lx] is not (entirely) in reserved memory\n",
> > +           prefix, mfn_to_maddr(start), mfn_to_maddr(end));
> 
> e820.c uses [%016Lx, %016Lx] instead, i.e. full 16-digit numbers. For
> easiest cross matching it may be desirable to do the same here. Then
> of course the 0x prefixes may also better disappear.

Yes, I also saw that format, but wasn't sure whether it was desirable
to use here, as for example I would expect RMRR/IVMD regions to be
below the 4GB boundary.  Also the leading zeros are useful to have a
uniform table when printing the memory map that contains more than
one entry, but here I expect printing will be limited to a very small
set of entries, or maybe just one (as we only print the misplaced
ones).

Thanks, Roger.

