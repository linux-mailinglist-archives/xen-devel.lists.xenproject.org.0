Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE17A91F4C
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 16:17:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957782.1350814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Q31-0007uR-Oa; Thu, 17 Apr 2025 14:16:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957782.1350814; Thu, 17 Apr 2025 14:16:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Q31-0007sJ-Lp; Thu, 17 Apr 2025 14:16:59 +0000
Received: by outflank-mailman (input) for mailman id 957782;
 Thu, 17 Apr 2025 14:16:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dr0F=XD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u5Q30-0007sD-62
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 14:16:58 +0000
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [2607:f8b0:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b423ffc-1b96-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 16:16:52 +0200 (CEST)
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-af9a7717163so808551a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 07:16:52 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-308613b2ff9sm3694940a91.30.2025.04.17.07.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 07:16:47 -0700 (PDT)
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
X-Inumbo-ID: 9b423ffc-1b96-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744899410; x=1745504210; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FPUpq4tKujOJsjsuzDI/0YmmAG8lBDhI8Y8O12aKSJI=;
        b=jRFlpc+5KRx2yayOXIuXfUnGhRM0XKQXrjY0PXZdiaB5jqaIVF32eD//g3crAK+zDe
         VPWnvkY1I/R+mBpBxrR7jRh5lpZ3wibkJN7eunJA+16I4qo0jxdRi9+HJ7QxnwsUai62
         +CXTBT4eiS57eEOlBdEg4rKg1bDDWnm0W+KNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744899410; x=1745504210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPUpq4tKujOJsjsuzDI/0YmmAG8lBDhI8Y8O12aKSJI=;
        b=W7xRUznoKYBO8GMGUMsDW5COaxj0Jaw5HIj3dsWaREqYa6QqcCiIHqgJEaRY0oMAJi
         AfTCQkH8AA014hlNNtxV5GdDKjKQe1u6/CAQgddOmG7qPAxWFcwF7/zFBgvMXRASOvXy
         GzV296zi0f8WOcon0XSFHq5suSwkdzvcq8beL842Dh+lAMHLgzmNxz6ES/L0NqYli+PP
         dQ9ezBjImWlsnwR0sTfg8NMuiOPPsiZjTi/IRLjNi75L0EaqOpBWsAOAnL79Vw/zHOW7
         bbWIt4mBv0GSwPa0qhPvFUY2N9SbCpX1afMcX51+h/cnc4RZBAawZaI5wJiR5+UkjBRl
         oqKg==
X-Forwarded-Encrypted: i=1; AJvYcCUg1Eys6dAXP9FDKWpJ62avm9+iGXRT1aEz0dlyQoPTjsB9mGO0xlq1nak9mvE8F97iq+Mj6ODjunA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YycmymTJaXjSJvhPzOJXcq2Eg2+hTBu5eaBv6fgBPm416Jrk7Mj
	DUHBSs8lKK5ZnnLHFUP9GLgJdiHdKyDrHnvNf/M9Q6PiVU4YcnNoYiV6wuWK6wU=
X-Gm-Gg: ASbGncsZRoTs8o/HGhmQnHYTIHJn0jeEW+zzEmlfMdQsH+ijwU+9C25EO/IXMCxgCoV
	DIRJJfPr8Z1WisPNWGvTbqiqEn5zVOPPFgYJ9VN4xm3tZNLwf10br7SD0QfqZ8R3Cw1Ib/N2p3m
	taNuqiImZNMJF++cltzpLAv4lplT03xvpdZbR+IYQkZpNxvrFKX//HKbELoefaAbIqynYc79vYc
	bz+4q43tWaKVfa7O+bnV6MZSrlDJGtCUbGaKWUgORKv7f0RcGperaB9emClYbNVheyPov3ynXhY
	IPsxUYe5cf/ZS/YrgylD6Q5Hs3g/yot4HJ+BBXN56Ghorg==
X-Google-Smtp-Source: AGHT+IFmuvoPzRIQQou58scHl+MCYihuTVXT8SSDGfsd4Df9KgJGosIIGWTIZUwLsrhm1g3bQKg8Sw==
X-Received: by 2002:a17:90b:4ec6:b0:2ea:bf1c:1e3a with SMTP id 98e67ed59e1d1-30863f1939emr11034897a91.12.1744899408123;
        Thu, 17 Apr 2025 07:16:48 -0700 (PDT)
Date: Thu, 17 Apr 2025 16:16:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/4] xen/io: provide helpers for multi size MMIO
 accesses
Message-ID: <aAENSnhKDQHQERgl@macbook.lan>
References: <20250415153246.81688-1-roger.pau@citrix.com>
 <20250415153246.81688-2-roger.pau@citrix.com>
 <1c4f6304-a272-4fb2-8892-43118d080641@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1c4f6304-a272-4fb2-8892-43118d080641@suse.com>

On Thu, Apr 17, 2025 at 09:43:09AM +0200, Jan Beulich wrote:
> On 15.04.2025 17:32, Roger Pau Monne wrote:
> > @@ -5115,7 +5115,6 @@ static void subpage_mmio_write_emulate(
> >  
> >      if ( test_bit(offset / MMIO_RO_SUBPAGE_GRAN, entry->ro_elems) )
> >      {
> > - write_ignored:
> >          gprintk(XENLOG_WARNING,
> >                  "ignoring write to R/O MMIO 0x%"PRI_mfn"%03x len %u\n",
> >                  mfn_x(mfn), offset, len);
> > @@ -5131,26 +5130,7 @@ static void subpage_mmio_write_emulate(
> >          return;
> >      }
> >  
> > -    addr += offset;
> > -    switch ( len )
> > -    {
> > -    case 1:
> > -        writeb(*(const uint8_t*)data, addr);
> > -        break;
> > -    case 2:
> > -        writew(*(const uint16_t*)data, addr);
> > -        break;
> > -    case 4:
> > -        writel(*(const uint32_t*)data, addr);
> > -        break;
> > -    case 8:
> > -        writeq(*(const uint64_t*)data, addr);
> > -        break;
> > -    default:
> > -        /* mmio_ro_emulated_write() already validated the size */
> > -        ASSERT_UNREACHABLE();
> > -        goto write_ignored;
> > -    }
> > +    write_mmio(addr + offset, data, len);
> >  }
> 
> Should probably have noticed this on v1 already: The log message is now lost
> for the write-ignored case. It looks easy enough to have the function return
> a boolean indicating "done", to retain original behavior here.

Hm, I didn't seem to me the message wants conserving, as it's
unreachable code.  I can try to add again, but we don't print such
message in other cases.

Thanks, Roger.

