Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FED5ECD84
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 22:00:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412974.656438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odGjc-0004hZ-EV; Tue, 27 Sep 2022 19:59:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412974.656438; Tue, 27 Sep 2022 19:59:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odGjc-0004f9-BH; Tue, 27 Sep 2022 19:59:16 +0000
Received: by outflank-mailman (input) for mailman id 412974;
 Tue, 27 Sep 2022 19:59:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qlh4=Z6=redhat.com=pabeni@srs-se1.protection.inumbo.net>)
 id 1odGja-0004f3-Sm
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 19:59:15 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db27f9ae-3e9e-11ed-9648-05401a9f4f97;
 Tue, 27 Sep 2022 21:59:13 +0200 (CEST)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-146-u0QsycEsPAWYxtMJsDRfNQ-1; Tue, 27 Sep 2022 15:59:10 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 n32-20020a05600c3ba000b003b5054c71faso8616339wms.9
 for <xen-devel@lists.xenproject.org>; Tue, 27 Sep 2022 12:59:10 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-104-40.dyn.eolo.it.
 [146.241.104.40]) by smtp.gmail.com with ESMTPSA id
 f12-20020a05600c4e8c00b003b33943ce5esm17310012wmq.32.2022.09.27.12.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 12:59:07 -0700 (PDT)
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
X-Inumbo-ID: db27f9ae-3e9e-11ed-9648-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664308751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dx5HDOePnyxgHzqa6DOD5MnqegsYWwrLtgMoZQ1P8dI=;
	b=dzDrfmbzZenJ4kt4SoG0g6RKdm1TcbxEVaoqmg6cma8pgOVlurVLGVxSTHZHD7BG7yGENt
	MqeGCwCXJ92uxWUCqISNdxluncYQzPfo0GGO11L0A8WXehN7bU+pZ+g2q9z5kmmP3rOp4+
	2EYBGNwWWiDlDnlK+DyTcmt/Ci1spQE=
X-MC-Unique: u0QsycEsPAWYxtMJsDRfNQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=Dx5HDOePnyxgHzqa6DOD5MnqegsYWwrLtgMoZQ1P8dI=;
        b=4Ko0YdieYlt8Z5ZajUzRlmEkRSD5uiqRAHuq1rFSMQ/u82goYYe+fI8LO1D7BJIc7W
         c6Z2Yf84oCcvaWc6S5BbJqRgLO98saOfEA9EeZxfwmjIgSEBLAAWKTftzP01DikPlUly
         6omwNEL8A/5MhiZo2f/gZJndl2aFt0jyqncYFCo8ebiOYZmyrHwvD+ocQOBitP6ncBM5
         hAfY4A+9B3fS2cXmwuo9DSsvtv0Ym9ykTan35V+h6F4xmEwPiQ0mCW9aVjqI2tu7aG8c
         424HJCtBBXLIuQ6PiA2yNUvm+ujMyfNwlmN1T30TlMo4wL5KRtrtqKEa6Z22wDBWyyvE
         t6OA==
X-Gm-Message-State: ACrzQf0memo4vznEruLBv1HGYmZBVruQmTjvCvXuXA7vQYy82meCh78O
	lxsRExAdSIi3dJR7KTw8M9lQsVusKbV5RkMpkKO76BFl6inQDitpBHupcZFntb1ST4zaXgjAEjV
	dF01isoZMFoQAGvf8/ZVaXB2GZ08=
X-Received: by 2002:a05:6000:1a8a:b0:22a:33aa:a907 with SMTP id f10-20020a0560001a8a00b0022a33aaa907mr17893662wry.322.1664308748211;
        Tue, 27 Sep 2022 12:59:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7eOWYFV9iprtkvNGfif9TK9/JHNd5re5oxCk70ig0yrmbrjCmGTXstvwdg4i4Hc1mUWp0nvA==
X-Received: by 2002:a05:6000:1a8a:b0:22a:33aa:a907 with SMTP id f10-20020a0560001a8a00b0022a33aaa907mr17893654wry.322.1664308747882;
        Tue, 27 Sep 2022 12:59:07 -0700 (PDT)
Message-ID: <6502e1a45526f97a1e6d7d27bbe07e3bb3623de3.camel@redhat.com>
Subject: Re: [PATCH net-next 0/4] shrink struct ubuf_info
From: Paolo Abeni <pabeni@redhat.com>
To: Pavel Begunkov <asml.silence@gmail.com>, netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>,  linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, Wei Liu <wei.liu@kernel.org>, Paul Durrant
 <paul@xen.org>, kvm@vger.kernel.org, 
 virtualization@lists.linux-foundation.org, "Michael S . Tsirkin"
 <mst@redhat.com>,  Jason Wang <jasowang@redhat.com>
Date: Tue, 27 Sep 2022 21:59:06 +0200
In-Reply-To: <c06897d4-4883-2756-87f9-9b10ab495c43@gmail.com>
References: <cover.1663892211.git.asml.silence@gmail.com>
	 <7fef56880d40b9d83cc99317df9060c4e7cdf919.camel@redhat.com>
	 <021d8ea4-891c-237d-686e-64cecc2cc842@gmail.com>
	 <bbb212f6-0165-0747-d99d-b49acbb02a80@gmail.com>
	 <85cccb780608e830024fc82a8e4f703031646f4e.camel@redhat.com>
	 <c06897d4-4883-2756-87f9-9b10ab495c43@gmail.com>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2022-09-27 at 19:48 +0100, Pavel Begunkov wrote:
> On 9/27/22 18:56, Paolo Abeni wrote:
> > On Tue, 2022-09-27 at 18:16 +0100, Pavel Begunkov wrote:
> > > On 9/27/22 15:28, Pavel Begunkov wrote:
> > > > Hello Paolo,
> > > > 
> > > > On 9/27/22 14:49, Paolo Abeni wrote:
> > > > > Hello,
> > > > > 
> > > > > On Fri, 2022-09-23 at 17:39 +0100, Pavel Begunkov wrote:
> > > > > > struct ubuf_info is large but not all fields are needed for all
> > > > > > cases. We have limited space in io_uring for it and large ubuf_info
> > > > > > prevents some struct embedding, even though we use only a subset
> > > > > > of the fields. It's also not very clean trying to use this typeless
> > > > > > extra space.
> > > > > > 
> > > > > > Shrink struct ubuf_info to only necessary fields used in generic paths,
> > > > > > namely ->callback, ->refcnt and ->flags, which take only 16 bytes. And
> > > > > > make MSG_ZEROCOPY and some other users to embed it into a larger struct
> > > > > > ubuf_info_msgzc mimicking the former ubuf_info.
> > > > > > 
> > > > > > Note, xen/vhost may also have some cleaning on top by creating
> > > > > > new structs containing ubuf_info but with proper types.
> > > > > 
> > > > > That sounds a bit scaring to me. If I read correctly, every uarg user
> > > > > should check 'uarg->callback == msg_zerocopy_callback' before accessing
> > > > > any 'extend' fields.
> > > > 
> > > > Providers of ubuf_info access those fields via callbacks and so already
> > > > know the actual structure used. The net core, on the opposite, should
> > > > keep it encapsulated and not touch them at all.
> > > > 
> > > > The series lists all places where we use extended fields just on the
> > > > merit of stripping the structure of those fields and successfully
> > > > building it. The only user in net/ipv{4,6}/* is MSG_ZEROCOPY, which
> > > > again uses callbacks.
> > > > 
> > > > Sounds like the right direction for me. There is a couple of
> > > > places where it might get type safer, i.e. adding types instead
> > > > of void* in for struct tun_msg_ctl and getting rid of one macro
> > > > hiding types in xen. But seems more like TODO for later.
> > > > 
> > > > > AFAICS the current code sometimes don't do the
> > > > > explicit test because the condition is somewhat implied, which in turn
> > > > > is quite hard to track.
> > > > > 
> > > > > clearing uarg->zerocopy for the 'wrong' uarg was armless and undetected
> > > > > before this series, and after will trigger an oops..
> > > > 
> > > > And now we don't have this field at all to access, considering that
> > > > nobody blindly casts it.
> > > > 
> > > > > There is some noise due to uarg -> uarg_zc renaming which make the
> > > > > series harder to review. Have you considered instead keeping the old
> > > > > name and introducing a smaller 'struct ubuf_info_common'? the overall
> > > > > code should be mostly the same, but it will avoid the above mentioned
> > > > > noise.
> > > > 
> > > > I don't think there will be less noise this way, but let me try
> > > > and see if I can get rid of some churn.
> > > 
> > > It doesn't look any better for me
> > > 
> > > TL;DR; This series converts only 3 users: tap, xen and MSG_ZEROCOPY
> > > and doesn't touch core code. If we do ubuf_info_common though I'd need
> > > to convert lots of places in skbuff.c and multiple places across
> > > tcp/udp, which is much worse.
> > 
> > Uhmm... I underlook the fact we must preserve the current accessors for
> > the common fields.
> > 
> > I guess something like the following could do (completely untested,
> > hopefully should illustrate the idea):
> > 
> > struct ubuf_info {
> > 	struct_group_tagged(ubuf_info_common, common,
> > 		void (*callback)(struct sk_buff *, struct ubuf_info *,
> >                           bool zerocopy_success);
> > 		refcount_t refcnt;
> > 	        u8 flags;
> > 	);
> > 
> > 	union {
> >                  struct {
> >                          unsigned long desc;
> >                          void *ctx;
> >                  };
> >                  struct {
> >                          u32 id;
> >                          u16 len;
> >                          u16 zerocopy:1;
> >                          u32 bytelen;
> >                  };
> >          };
> > 
> >          struct mmpin {
> >                  struct user_struct *user;
> >                  unsigned int num_pg;
> >          } mmp;
> > };
> > 
> > Then you should be able to:
> > - access ubuf_info->callback,
> > - access the same field via ubuf_info->common.callback
> > - declare variables as 'struct ubuf_info_commom' with appropriate
> > contents.
> > 
> > WDYT?
> 
> Interesting, I didn't think about struct_group, this would
> let to split patches better and would limit non-core changes.
> But if the plan is to convert the core helpers to
> ubuf_info_common, than I think it's still messier than changing
> ubuf providers only.
> 
> I can do the exercise, but I don't really see what is the goal.
> Let me ask this, if we forget for a second how diffs look,
> do you care about which pair is going to be in the end?

Uhm... I proposed this initially with the goal of remove non fuctional
changes from a patch that was hard to digest for me (4/4). So it's
about diffstat to me ;) 

On the flip side the change suggested would probably not be as
straighforward as I would hope for.

> ubuf_info_common/ubuf_info vs ubuf_info/ubuf_info_msgzc?

The specific names used are not much relevant.

> Are there you concerned about naming or is there more to it?

I feel like this series is potentially dangerous, but I could not spot
bugs into the code. I would have felt more relaxed eariler in the devel
cycle.

Cheers,

Paolo


