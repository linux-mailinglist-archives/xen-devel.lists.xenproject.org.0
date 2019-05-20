Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB1D24278
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 23:05:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSpPo-0003KE-NF; Mon, 20 May 2019 21:01:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rume=TU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hSpPm-0003K9-Lv
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 21:01:46 +0000
X-Inumbo-ID: 78e53695-7b42-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 78e53695-7b42-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 21:01:44 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 362772171F;
 Mon, 20 May 2019 21:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558386103;
 bh=mze1Im1EaMHwzKqrNPm4WsjMZTDrU6v37V84CfiOxRE=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=RpXpV9Rvt6FjgqLINAYO5LP4XlsuFVhEv5HDvrpHi/8VcRoYzdygrOhA9nwllZ+dl
 jLepoKFQ4ko9sHvfGOLNkEFoq6owzYKHhO8VCnH+xbuyJu5h7Wsc9aykmwNiGw+IHu
 Pvv2KECCE5jRAPHLQ0pFQOahb7q/uYOAwNYAb+vY=
Date: Mon, 20 May 2019 14:01:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <Julien.Grall@arm.com>
In-Reply-To: <10c3ba27-c0df-a0d4-4033-530ec99291ac@arm.com>
Message-ID: <alpine.DEB.2.21.1905201357570.16404@sstabellini-ThinkPad-T480s>
References: <20190508161603.21964-1-julien.grall@arm.com>
 <20190508161603.21964-5-julien.grall@arm.com>
 <alpine.DEB.2.21.1905091307080.25766@sstabellini-ThinkPad-T480s>
 <5fe19f3a-e17b-04b5-ff15-5579ebe789eb@arm.com>
 <cc1d2550-794c-842d-26db-178f614f81b3@arm.com>
 <4b1d9bf6-bf3b-a5ec-da06-534618bb34a8@arm.com>
 <alpine.DEB.2.21.1905101050260.25766@sstabellini-ThinkPad-T480s>
 <10c3ba27-c0df-a0d4-4033-530ec99291ac@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-779133033-1558386103=:16404"
Subject: Re: [Xen-devel] [PATCH v2 4/7] xen/arm: page: Clarify the Xen TLBs
 helpers name
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <Andrii_Anisov@epam.com>,
 "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-779133033-1558386103=:16404
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 10 May 2019, Julien Grall wrote:
> On 10/05/2019 18:57, Stefano Stabellini wrote:
> > On Fri, 10 May 2019, Julien Grall wrote:
> >> On 09/05/2019 22:46, Julien Grall wrote:
> >>> Hi,
> >>>
> >>> On 09/05/2019 21:32, Julien Grall wrote:
> >>>> Hi,
> >>>>
> >>>> On 09/05/2019 21:13, Stefano Stabellini wrote:
> >>>>> On Wed, 8 May 2019, Julien Grall wrote:
> >>>>>>    /* Release all __init and __initdata ranges to be reused */
> >>>>>> diff --git a/xen/include/asm-arm/arm32/page.h
> >>>>>> b/xen/include/asm-arm/arm32/page.h
> >>>>>> index 40a77daa9d..0b41b9214b 100644
> >>>>>> --- a/xen/include/asm-arm/arm32/page.h
> >>>>>> +++ b/xen/include/asm-arm/arm32/page.h
> >>>>>> @@ -61,12 +61,8 @@ static inline void invalidate_icache_local(void)
> >>>>>>        isb();                      /* Synchronize fetched instruction
> >>>>>> stream. */
> >>>>>>    }
> >>>>>> -/*
> >>>>>> - * Flush all hypervisor mappings from the data TLB of the local
> >>>>>> - * processor. This is not sufficient when changing code mappings or
> >>>>>> - * for self modifying code.
> >>>>>> - */
> >>>>>> -static inline void flush_xen_data_tlb_local(void)
> >>>>>> +/* Flush all hypervisor mappings from the TLB of the local processor.
> >>>>>> */
> >>>>>
> >>>>> I realize that the statement "This is not sufficient when changing code
> >>>>> mappings or for self modifying code" is not quite accurate, but I would
> >>>>> prefer not to remove it completely. It would be good to retain a warning
> >>>>> somewhere about IC been needed when changing Xen's own mappings. Maybe
> >>>>> on top of invalidate_icache_local?
> >>>>
> >>>> Can you please expand in which circumstance you need to invalid the
> >>>> instruction cache when changing Xen's own mappings?
> >>>
> >>> Reading the Armv7 (B3.11.2 in ARM DDI 0406C.c) and Armv8 (D5.11.2 in ARM DDI
> >>> 0487D.a), most of the instruction caches implement the IVIPT extension. This
> >>> means that instruction cache maintenance is required only after write new
> >>> data to a PA that holds instructions (see D5-2522 in ARM DDI 0487D.a and
> >>> B3.11.2 in ARM DDI 0406C.c).
> >>>
> >>> The only one that differs with that behavior is ASID and VMID tagged VIVT
> >>> instruction caches which is only present in Armv7 (I can't remember why it
> >>> was dropped in Armv8). Instruction cache maintenance can be required when
> >>> changing the translation of a virtual address to a physical address.
> >>
> >> I thought about this a bit more and chat with my team at Arm. Xen on Arm only
> >> support Cortex-A7, Cortex-A15 and Brahma 15 (see the CPU ID check in
> >> arm32/head.S).
> >> 	
> >> None of them are actually using VIVT instruction caches. In general, VIVT
> >> caches are more difficult to deal with because they require more flush. So I
> >> would be more incline to deny booting Xen on platform where the instruction
> >> caches don't support IVIVT extension.
> >>
> >> I don't think that will have a major impact on the user because of my point
> >> above.
> > 
> > Thanks for looking this up in details. I think there are two interesting
> > points here:
> > 
> > 1) what to do with VIVT
> > 2) what to write in the in-code comment
> > 
> > For 1) I think it would be OK to deny booting. For sure we need at least
> > a warning. Would you be able to add the warning/boot-denial as part of
> > this series, or at least an in-code comment?
> 
> I am planning to deny booting Xen on such platforms.
> 
> > 
> > For 2) I would like this reasonining to be captured somewhere with a
> > in-code comment, if nothing else as a reference to what to search in
> > the Arm Arm. I don't know where is the best place for it. If
> > invalidate_icache_local is not good place for the comment please suggest
> > a better location.
> 
> I still don't understand what reasoning you want to write. If we don't 
> support VIVT then the instruction cache is very easy to maintain. I.e 
> "You flush if you modify the instruction".
> 
> I am worry that if we overdo the explanation in the code, then you are 
> going to confuse more than one person. So it would be better to blank 
> out "VIVT" completely from then.
> 
> Feel free to suggest an in-code comment so we can discuss on the worthiness.

I suggest something like the following:

 /* 
  * Flush all hypervisor mappings from the TLB of the local processor. Note
  * that instruction cache maintenance might also be required when self
  * modifying Xen code, see D5-2522 in ARM DDI 0487D.a and B3.11.2 in ARM
  * DDI 0406C.c.
  */
--8323329-779133033-1558386103=:16404
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-779133033-1558386103=:16404--

