Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B778F5ECE5C
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 22:24:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412988.656461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odH7I-0000HE-OH; Tue, 27 Sep 2022 20:23:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412988.656461; Tue, 27 Sep 2022 20:23:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odH7I-0000Dl-LH; Tue, 27 Sep 2022 20:23:44 +0000
Received: by outflank-mailman (input) for mailman id 412988;
 Tue, 27 Sep 2022 20:23:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qlh4=Z6=redhat.com=pabeni@srs-se1.protection.inumbo.net>)
 id 1odH7I-0000Df-4Y
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 20:23:44 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 474b28d9-3ea2-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 22:23:43 +0200 (CEST)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-102-GPJ2qOvdNV6TIs-aExmuJA-1; Tue, 27 Sep 2022 16:23:40 -0400
Received: by mail-wm1-f71.google.com with SMTP id
 k21-20020a7bc415000000b003b4fac53006so3160065wmi.3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Sep 2022 13:23:40 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-104-40.dyn.eolo.it.
 [146.241.104.40]) by smtp.gmail.com with ESMTPSA id
 m17-20020a05600c461100b003a5fa79007fsm2520605wmo.7.2022.09.27.13.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 13:23:38 -0700 (PDT)
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
X-Inumbo-ID: 474b28d9-3ea2-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664310221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bPS2hzRpnh4vS84t7HeCrT88khQ6cmZJEXbF5+gL9zE=;
	b=aRMut5g2Fc25bVI2uNwj8RvheG7GkQvt5aaxifuT5P853d/VfODTbTYVRcmWNqHpHJBwWX
	0qhtD0lVzN+1fCLG46+fojqWf+YrVJAWm60HOKnYmNilTO1BVbI84xAvGfkDO+QeNuYSNR
	LOu/JJu0GsAuoWTc+04X8//0wcyqU50=
X-MC-Unique: GPJ2qOvdNV6TIs-aExmuJA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=bPS2hzRpnh4vS84t7HeCrT88khQ6cmZJEXbF5+gL9zE=;
        b=zS8RAnGNDQSlU5S4+9EayXeE3w1s9dZ7HkJR1xbBSPb0/9LMfKRtmXtE3+0N1HXB6b
         vwfv/DRf5nLhL1NwVsWBgluXvd/MYWIYytDsELqjGkXZ9d7Zi17mUMMiku8nby0uJLdp
         cUKKpuGivlif7m0PuCtzDcHR7WLfps+ItRNhHSAqkLJ8sNdMhs+V5yfW+93wqrXowQYL
         mkRxU8hnWsV6UNcnMrm/y1PPguIshRgA5Iqw7nKRDKZNkc4N+LbcG2lSWaAsGX2ufAp8
         WIr2FLM4D4VgwcybUl5f0yZfss3AJqFSmWQyGEKdqomsuY3qKRJjpEPJMc3qiN9DfUeX
         YnMw==
X-Gm-Message-State: ACrzQf22majfMmZPS9t1CPPNtHLxy0Bb4/dWhvsuDg2NAsJRFPPChOoH
	zdoEjk8uaxHOFsqXhZDxhEfaxzD+CYWIqt7znwwW2FelBAnjmcyJYQzIey4yFZy3XNPEGSQni3r
	epYfaG+HWkJDkHtEhrLRKb1dVQJ0=
X-Received: by 2002:a05:6000:18ad:b0:22a:f7b5:16f8 with SMTP id b13-20020a05600018ad00b0022af7b516f8mr18132913wri.305.1664310219380;
        Tue, 27 Sep 2022 13:23:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6ci15yCp/mYBPh7Hxm1QkwLOuat3oDTUzqTHSVWObghnWMRosUrppkyN/V4CuayXBq254sVg==
X-Received: by 2002:a05:6000:18ad:b0:22a:f7b5:16f8 with SMTP id b13-20020a05600018ad00b0022af7b516f8mr18132903wri.305.1664310219067;
        Tue, 27 Sep 2022 13:23:39 -0700 (PDT)
Message-ID: <b06d81fe39710b948a74a365c173b316252ed1f8.camel@redhat.com>
Subject: Re: [PATCH net-next 0/4] shrink struct ubuf_info
From: Paolo Abeni <pabeni@redhat.com>
To: Pavel Begunkov <asml.silence@gmail.com>, netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>,  linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, Wei Liu <wei.liu@kernel.org>, Paul Durrant
 <paul@xen.org>, kvm@vger.kernel.org, 
 virtualization@lists.linux-foundation.org, "Michael S . Tsirkin"
 <mst@redhat.com>,  Jason Wang <jasowang@redhat.com>
Date: Tue, 27 Sep 2022 22:23:37 +0200
In-Reply-To: <eb543907-190f-c661-b5d6-b4d67b6184e6@gmail.com>
References: <cover.1663892211.git.asml.silence@gmail.com>
	 <7fef56880d40b9d83cc99317df9060c4e7cdf919.camel@redhat.com>
	 <021d8ea4-891c-237d-686e-64cecc2cc842@gmail.com>
	 <bbb212f6-0165-0747-d99d-b49acbb02a80@gmail.com>
	 <85cccb780608e830024fc82a8e4f703031646f4e.camel@redhat.com>
	 <c06897d4-4883-2756-87f9-9b10ab495c43@gmail.com>
	 <6502e1a45526f97a1e6d7d27bbe07e3bb3623de3.camel@redhat.com>
	 <eb543907-190f-c661-b5d6-b4d67b6184e6@gmail.com>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2022-09-27 at 21:17 +0100, Pavel Begunkov wrote:
> On 9/27/22 20:59, Paolo Abeni wrote:
> > On Tue, 2022-09-27 at 19:48 +0100, Pavel Begunkov wrote:
> > > On 9/27/22 18:56, Paolo Abeni wrote:
> > > > On Tue, 2022-09-27 at 18:16 +0100, Pavel Begunkov wrote:
> > > > > On 9/27/22 15:28, Pavel Begunkov wrote:
> > > > > > Hello Paolo,
> > > > > > 
> > > > > > On 9/27/22 14:49, Paolo Abeni wrote:
> > > > > > > Hello,
> > > > > > > 
> > > > > > > On Fri, 2022-09-23 at 17:39 +0100, Pavel Begunkov wrote:
> > > > > > > > struct ubuf_info is large but not all fields are needed for all
> > > > > > > > cases. We have limited space in io_uring for it and large ubuf_info
> > > > > > > > prevents some struct embedding, even though we use only a subset
> > > > > > > > of the fields. It's also not very clean trying to use this typeless
> > > > > > > > extra space.
> > > > > > > > 
> > > > > > > > Shrink struct ubuf_info to only necessary fields used in generic paths,
> > > > > > > > namely ->callback, ->refcnt and ->flags, which take only 16 bytes. And
> > > > > > > > make MSG_ZEROCOPY and some other users to embed it into a larger struct
> > > > > > > > ubuf_info_msgzc mimicking the former ubuf_info.
> > > > > > > > 
> > > > > > > > Note, xen/vhost may also have some cleaning on top by creating
> > > > > > > > new structs containing ubuf_info but with proper types.
> > > > > > > 
> > > > > > > That sounds a bit scaring to me. If I read correctly, every uarg user
> > > > > > > should check 'uarg->callback == msg_zerocopy_callback' before accessing
> > > > > > > any 'extend' fields.
> > > > > > 
> > > > > > Providers of ubuf_info access those fields via callbacks and so already
> > > > > > know the actual structure used. The net core, on the opposite, should
> > > > > > keep it encapsulated and not touch them at all.
> > > > > > 
> > > > > > The series lists all places where we use extended fields just on the
> > > > > > merit of stripping the structure of those fields and successfully
> > > > > > building it. The only user in net/ipv{4,6}/* is MSG_ZEROCOPY, which
> > > > > > again uses callbacks.
> > > > > > 
> > > > > > Sounds like the right direction for me. There is a couple of
> > > > > > places where it might get type safer, i.e. adding types instead
> > > > > > of void* in for struct tun_msg_ctl and getting rid of one macro
> > > > > > hiding types in xen. But seems more like TODO for later.
> > > > > > 
> > > > > > > AFAICS the current code sometimes don't do the
> > > > > > > explicit test because the condition is somewhat implied, which in turn
> > > > > > > is quite hard to track.
> > > > > > > 
> > > > > > > clearing uarg->zerocopy for the 'wrong' uarg was armless and undetected
> > > > > > > before this series, and after will trigger an oops..
> > > > > > 
> > > > > > And now we don't have this field at all to access, considering that
> > > > > > nobody blindly casts it.
> > > > > > 
> > > > > > > There is some noise due to uarg -> uarg_zc renaming which make the
> > > > > > > series harder to review. Have you considered instead keeping the old
> > > > > > > name and introducing a smaller 'struct ubuf_info_common'? the overall
> > > > > > > code should be mostly the same, but it will avoid the above mentioned
> > > > > > > noise.
> > > > > > 
> > > > > > I don't think there will be less noise this way, but let me try
> > > > > > and see if I can get rid of some churn.
> > > > > 
> > > > > It doesn't look any better for me
> > > > > 
> > > > > TL;DR; This series converts only 3 users: tap, xen and MSG_ZEROCOPY
> > > > > and doesn't touch core code. If we do ubuf_info_common though I'd need
> > > > > to convert lots of places in skbuff.c and multiple places across
> > > > > tcp/udp, which is much worse.
> > > > 
> > > > Uhmm... I underlook the fact we must preserve the current accessors for
> > > > the common fields.
> > > > 
> > > > I guess something like the following could do (completely untested,
> > > > hopefully should illustrate the idea):
> > > > 
> > > > struct ubuf_info {
> > > > 	struct_group_tagged(ubuf_info_common, common,
> > > > 		void (*callback)(struct sk_buff *, struct ubuf_info *,
> > > >                            bool zerocopy_success);
> > > > 		refcount_t refcnt;
> > > > 	        u8 flags;
> > > > 	);
> > > > 
> > > > 	union {
> > > >                   struct {
> > > >                           unsigned long desc;
> > > >                           void *ctx;
> > > >                   };
> > > >                   struct {
> > > >                           u32 id;
> > > >                           u16 len;
> > > >                           u16 zerocopy:1;
> > > >                           u32 bytelen;
> > > >                   };
> > > >           };
> > > > 
> > > >           struct mmpin {
> > > >                   struct user_struct *user;
> > > >                   unsigned int num_pg;
> > > >           } mmp;
> > > > };
> > > > 
> > > > Then you should be able to:
> > > > - access ubuf_info->callback,
> > > > - access the same field via ubuf_info->common.callback
> > > > - declare variables as 'struct ubuf_info_commom' with appropriate
> > > > contents.
> > > > 
> > > > WDYT?
> > > 
> > > Interesting, I didn't think about struct_group, this would
> > > let to split patches better and would limit non-core changes.
> > > But if the plan is to convert the core helpers to
> > > ubuf_info_common, than I think it's still messier than changing
> > > ubuf providers only.
> > > 
> > > I can do the exercise, but I don't really see what is the goal.
> > > Let me ask this, if we forget for a second how diffs look,
> > > do you care about which pair is going to be in the end?
> > 
> > Uhm... I proposed this initially with the goal of remove non fuctional
> > changes from a patch that was hard to digest for me (4/4). So it's
> > about diffstat to me ;)
> 
> Ah, got it
> 
> > On the flip side the change suggested would probably not be as
> > straighforward as I would hope for.
> > 
> > > ubuf_info_common/ubuf_info vs ubuf_info/ubuf_info_msgzc?
> > 
> > The specific names used are not much relevant.
> > 
> > > Are there you concerned about naming or is there more to it?
> > 
> > I feel like this series is potentially dangerous, but I could not spot
> > bugs into the code. I would have felt more relaxed eariler in the devel
> > cycle.
> 
> union {
> 	struct {
> 		unsigned long desc;
> 		void *ctx;
> 	};
> 	struct {
> 		u32 id;
> 		u16 len;
> 		u16 zerocopy:1;
> 		u32 bytelen;
> 	};
> };
> 
> 
> btw, nobody would frivolously change ->zerocopy anyway as it's
> in a union. Even without the series we're absolutely screwed
> if someone does that. If anything it adds a way to get rid of it:
> 
> 1) Make vhost and xen use their own structures with right types.
> 2) kill unused struct {ctx, desc} for MSG_ZEROCOPY

Ok, the above sounds reasonable. Additionally I've spent the last
surviving neuron on my side to on this series, and it looks sane, so...

Acked-by: Paolo Abeni <pabeni@redhat.com>


