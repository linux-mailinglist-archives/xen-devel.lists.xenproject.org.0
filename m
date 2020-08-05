Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7787C23CC03
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 18:18:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3M7F-0006Gk-Pz; Wed, 05 Aug 2020 16:18:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GWpV=BP=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1k3M7E-0006Gf-OH
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 16:18:08 +0000
X-Inumbo-ID: ab52e3a5-a157-4252-ac08-d4f232f039c9
Received: from mail-wr1-x435.google.com (unknown [2a00:1450:4864:20::435])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab52e3a5-a157-4252-ac08-d4f232f039c9;
 Wed, 05 Aug 2020 16:18:07 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id a15so41251064wrh.10
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2020 09:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=+Thx91dusakiqrahsI/77vWl7YMCVAiBUNGy9z1ugI4=;
 b=Nofg4blC/GqZ+vEXGW0rM50lD48+CWu1r/3Bm3M5h8ChoPuAn8+h30Jov11Mp7Gnep
 eylGZ5eCwbVUnPT5GFT/hhy4LP7iIEYGxoYGM7twh70g72+zsUll/Y8p7pYuTxkNi6LY
 Zq0IMRTk7DMmztLbKki5DIACccwcmLJZyx84beQ8xZ9fBAC0BebqhSiTjxSQ8TcdiOP5
 cdszslTq5FIg/jEWo/fjFREkMUhPo5bVJkSPOnXfXHEet5yC+VNjJ6sVcAEFTpJ0+EKy
 Y9z6RCSk8bN+1Z5pzLhhbCf+oMBj/8iMHytdm//JXJqcICKTUvujv4Qg6u7tLPQ81UFY
 IjKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=+Thx91dusakiqrahsI/77vWl7YMCVAiBUNGy9z1ugI4=;
 b=cfzPkD6VISwm4xlAKmJKqVY5IUZGOcJw/cAn0mqG9hKKgfjMvEOLZCdkZ/bo5Ii/P6
 +lDvQH4y0AAhCPoBxt2ONGBNaa6MkVuoozCMBSDwzXXGrfsTk+SIkqQL5KRNORDsxjG8
 3AV0VYGIm6h6QIx9nat3LcFXLsDYB4qDQcIlvbMWeq6VGlzRpnwWCcYtOu6WsGBmAg4S
 aUtUH5A4R8JXzQ89mzKt1X1Ackit/7WssiZdy7uJPFn+ACMkQXRsEq+4Ljgp0f7BwQza
 OqjZNdIv6KWWqoaeLhEmmV4mDPjfqT36h8yVsAXW9BuOFcFj8R0JXBN1745QsHJ581Y5
 +Xjg==
X-Gm-Message-State: AOAM533d0rosgNBNI2IACbpIqsjiNoE+UHEwaMDFK06+87Embo1BwAau
 1cRTaCTBOWIQ9tDhABEEqqc=
X-Google-Smtp-Source: ABdhPJycy6sEfMH4i60OfcKVUBubSvTbIi7jedUxc/2okLu7drPoUO+0viJcj9i7hs+jmnhrCHoS6g==
X-Received: by 2002:adf:a195:: with SMTP id u21mr3674201wru.296.1596644286943; 
 Wed, 05 Aug 2020 09:18:06 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-226.amazon.com. [54.240.197.226])
 by smtp.gmail.com with ESMTPSA id s19sm3805896wrb.54.2020.08.05.09.18.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Aug 2020 09:18:06 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <20200804134209.8717-1-paul@xen.org>
 <20200804134209.8717-7-paul@xen.org>
 <82d73571-3e05-65b5-2731-d8cdee651995@suse.com>
In-Reply-To: <82d73571-3e05-65b5-2731-d8cdee651995@suse.com>
Subject: RE: [PATCH v4 06/14] iommu: flush I/O TLB if iommu_map() or
 iommu_unmap() fail
Date: Wed, 5 Aug 2020 17:18:55 +0100
Message-ID: <005e01d66b44$1e57ff80$5b07fe80$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQGtxlp5X/CuH2IzEhv/FXA8KDRK/wEQIAkmATal672paMQrUA==
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: xen-devel@lists.xenproject.org, 'Paul Durrant' <pdurrant@amazon.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 05 August 2020 17:06
> To: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org; Paul Durrant <pdurrant@amazon.com>
> Subject: Re: [PATCH v4 06/14] iommu: flush I/O TLB if iommu_map() or iommu_unmap() fail
> 
> On 04.08.2020 15:42, Paul Durrant wrote:
> > From: Paul Durrant <pdurrant@amazon.com>
> >
> > This patch adds a full I/O TLB flush to the error paths of iommu_map() and
> > iommu_unmap().
> >
> > Without this change callers need constructs such as:
> >
> > rc = iommu_map/unmap(...)
> > err = iommu_flush(...)
> > if ( !rc )
> >   rc = err;
> >
> > With this change, it can be simplified to:
> >
> > rc = iommu_map/unmap(...)
> > if ( !rc )
> >   rc = iommu_flush(...)
> >
> > because, if the map or unmap fails the flush will be unnecessary. This saves
> > a stack variable and generally makes the call sites tidier.
> 
> I appreciate the intent of tidier code, but I wonder whether this
> flushing doesn't go a little too far: There's a need to flush in
> general when multiple pages were to be (un)mapped, and there was
> at least partial success. Hence e.g. in the order == 0 case I
> don't see why any flushing would be needed. Granted errors aren't
> commonly expected, but anyway.
> 

Yes, I wasn't really worried about optimizing the error case, but I can avoid unnecessary flushing in the order 0 case.

> > --- a/xen/drivers/passthrough/iommu.c
> > +++ b/xen/drivers/passthrough/iommu.c
> > @@ -274,6 +274,10 @@ int iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
> >          break;
> >      }
> >
> > +    /* Something went wrong so flush everything and clear flush flags */
> > +    if ( unlikely(rc) && iommu_iotlb_flush_all(d, *flush_flags) )
> 
> Both here and in the unmap path, did you get the return value
> of iommu_iotlb_flush_all() the wrong way round (i.e. isn't there
> a missing ! )?
> 

Yes, I think you're right. I'll need to re-work anyway to avoid the flush in the order 0 case.

  Paul

> Jan


