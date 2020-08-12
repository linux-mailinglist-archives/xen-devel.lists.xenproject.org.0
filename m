Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D999D242A98
	for <lists+xen-devel@lfdr.de>; Wed, 12 Aug 2020 15:49:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5r7v-0004A1-Ta; Wed, 12 Aug 2020 13:49:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fTRk=BW=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1k5r7v-00049w-5D
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2020 13:49:11 +0000
X-Inumbo-ID: bcbd956b-a92a-4773-8d57-1bd04ff66c91
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bcbd956b-a92a-4773-8d57-1bd04ff66c91;
 Wed, 12 Aug 2020 13:49:10 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z18so2081714wrm.12
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2020 06:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=B+K/F9zTWabTlMfuT8Q8J7uqeCLpmF3XHAFxcwcJVDQ=;
 b=OTkIb2znAwtxjrTuIbdxlR7ys2FJVdovAKJzKB35lGwTfnfhDq378FqYbEytVAgQ8T
 eCVb00PQ5GxlX06CnUee2bb4oeHoRhMBa6rEFAbs05Wn+mZX2V8amMLa+ESsRZTMBaId
 06vV2VXAHkTzVYe8aLGQWYkC50mTB0WOJCXmdS032I6310poxIZxivdMv5JQ4TX91kBc
 FwekV7J2exgS0dxDrotgm1Nftx1ww3VIAKhAK0BaTK20JM+c4vq6wgtQ3oHtcDSUJZ29
 xUYUmKzQAj7SrvT/kZbshvmvNr9sMgrlPyGC8s9rlufKwyqinnrEaocWJZcW/cNSoQMG
 J+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=B+K/F9zTWabTlMfuT8Q8J7uqeCLpmF3XHAFxcwcJVDQ=;
 b=Woz4soU2R6mK3s+lOBM+wUaEvtCoAXOm/Tll0IC23stcu7rhRo4M/Eo+mOP13dprZV
 o+1GnZv5doAkGBGmjP8WUeZbmBeq40VK8ll7ZrjaQVb6vPWsoSviRRl5QqAzsVQZuA+r
 vYwerUk/TKJONUiT4iFF4mHQz0fnJwwRaItl+xrWP3ugz2sML9QVdOg3ycrEYCahGfcv
 7Hc9W0PP7vCe1AzO5JQicEO0UmsNFaJ9o6WOVCkHN51XcxyrP3eav9md5bK+dknSPTPp
 cLCP1JjQ/xAMK1nqufmD2uQlEbgmQh0Hon0ZWLxwcIFPr6iw9+gxwtF/arP1jXD5Ux6C
 IoZQ==
X-Gm-Message-State: AOAM53142pZO1PqW3R3Wsvpk9pIqH1zlSNozeUUQ7Yod8K19E3/QRFEa
 5CB34HqoDwUUiIoeLr0hNiA=
X-Google-Smtp-Source: ABdhPJzR5UtNlFT+bTv3NE5dHWvVTTftNtzyno+hhp4PyCzdTpGmBQ2k/wWPCn6spjamN7KvpEjVVA==
X-Received: by 2002:a05:6000:118e:: with SMTP id
 g14mr35054938wrx.139.1597240149565; 
 Wed, 12 Aug 2020 06:49:09 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-143-223-30.range86-143.btcentralplus.com.
 [86.143.223.30])
 by smtp.gmail.com with ESMTPSA id g145sm5462472wmg.23.2020.08.12.06.49.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Aug 2020 06:49:08 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
Cc: <xen-devel@lists.xenproject.org>, "'Paul Durrant'" <pdurrant@amazon.com>,
 "'Kevin Tian'" <kevin.tian@intel.com>
References: <20200804134209.8717-1-paul@xen.org>
 <20200804134209.8717-15-paul@xen.org>
 <918260ba-0241-80eb-567c-a2d48419c12a@suse.com>
In-Reply-To: <918260ba-0241-80eb-567c-a2d48419c12a@suse.com>
Subject: RE: [PATCH v4 14/14] vtd: use a bit field for dma_pte
Date: Wed, 12 Aug 2020 14:49:07 +0100
Message-ID: <000901d670af$59d705e0$0d8511a0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGtxlp5X/CuH2IzEhv/FXA8KDRK/wDXgLP2ATS60cSpdW+7cA==
Content-Language: en-gb
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 06 August 2020 13:54
> To: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org; Paul Durrant <pdurrant@amazon.com>; Kevin Tian
> <kevin.tian@intel.com>
> Subject: Re: [PATCH v4 14/14] vtd: use a bit field for dma_pte
> 
> On 04.08.2020 15:42, Paul Durrant wrote:
> > --- a/xen/drivers/passthrough/vtd/iommu.c
> > +++ b/xen/drivers/passthrough/vtd/iommu.c
> > @@ -1772,13 +1772,14 @@ static int __must_check intel_iommu_map_page(struct domain *d, dfn_t dfn,
> >      old = *pte;
> >
> >      dma_set_pte_addr(new, mfn_to_maddr(mfn));
> > -    dma_set_pte_prot(new,
> > -                     ((flags & IOMMUF_readable) ? DMA_PTE_READ  : 0) |
> > -                     ((flags & IOMMUF_writable) ? DMA_PTE_WRITE : 0));
> > +    if ( flags & IOMMUF_readable )
> > +        dma_set_pte_readable(new);
> > +    if ( flags & IOMMUF_writable )
> > +        dma_set_pte_writable(new);
> >
> >      /* Set the SNP on leaf page table if Snoop Control available */
> >      if ( iommu_snoop )
> > -        dma_set_pte_snp(new);
> > +        dma_set_pte_snoop(new);
> 
> Perhaps simply use an initializer:
> 
>     new = (struct dma_ptr){
>             .r = flags & IOMMUF_readable,
>             .w = flags & IOMMUF_writable,
>             .snp = iommu_snoop,
>             .addr = mfn_x(mfn),
>         };
> 
> ? This also points out that the "addr" field isn't really an address,
> and hence may want renaming.

If I am getting rid of macros then this makes more sense.

  Paul

> 
> Again comments on the two earlier patch apply here respectively (or
> else part of the suggestion above isn't going to work as is).
> 
> Jan


