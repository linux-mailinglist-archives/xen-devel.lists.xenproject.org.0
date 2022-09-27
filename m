Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D23565ECBC9
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 19:57:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412904.656372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odEoY-0006he-Iz; Tue, 27 Sep 2022 17:56:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412904.656372; Tue, 27 Sep 2022 17:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odEoY-0006fI-GA; Tue, 27 Sep 2022 17:56:14 +0000
Received: by outflank-mailman (input) for mailman id 412904;
 Tue, 27 Sep 2022 17:56:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qlh4=Z6=redhat.com=pabeni@srs-se1.protection.inumbo.net>)
 id 1odEoW-0006fC-M2
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 17:56:13 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa45fde1-3e8d-11ed-9648-05401a9f4f97;
 Tue, 27 Sep 2022 19:56:09 +0200 (CEST)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-256-j-9IhWcAMWGjMV6zqhwU-w-1; Tue, 27 Sep 2022 13:56:07 -0400
Received: by mail-wm1-f71.google.com with SMTP id
 n32-20020a05600c3ba000b003b5054c71faso8476983wms.9
 for <xen-devel@lists.xenproject.org>; Tue, 27 Sep 2022 10:56:06 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-104-40.dyn.eolo.it.
 [146.241.104.40]) by smtp.gmail.com with ESMTPSA id
 i24-20020a1c5418000000b003a601a1c2f7sm15224452wmb.19.2022.09.27.10.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 10:56:05 -0700 (PDT)
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
X-Inumbo-ID: aa45fde1-3e8d-11ed-9648-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664301368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ylam0E0Yl8o7oIuCiSoTBfRDDfyFUS+FtVqqi8D5J/k=;
	b=C0MOHD62umI44M+FuCUIUujaCYv+tZZpHZTmPvmBD0Kh5RNnX5DeCg6YILNOC6+Xr/mxtv
	O7ZFFafdS3mgkuPm7JDj6DXv1vrrb2zLHSeEUAYFaNyv9A4gI1Qfog7sp3VGyHcpCVE+0l
	Uq16NKKe3ypuL1fYQtoWuN3H5pdc27U=
X-MC-Unique: j-9IhWcAMWGjMV6zqhwU-w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=ylam0E0Yl8o7oIuCiSoTBfRDDfyFUS+FtVqqi8D5J/k=;
        b=CPQ02u1gFfeT84aTniA3cUZDABCIttLVPyFzutQONfAput4JHwpCTsiUlT1YqfRb53
         /NLoblhRbenPvuElr1bPyM0xGaiVfC7b9s0QMUvFPKYpfYAXZ0fjCSgUmJz5H6m8lE8a
         /88GVLMxX1Lnoz2zbGx9rfIHDD71QhwPc91bU5bbmkIIQqKmn/lFjPac0tXrAGAYxctN
         HVHQ384Sj1hfR06NArz8WBx4N3dA6seytc5g1NNaENuhATppy740R0txKAbeiZod6BHx
         O2ZwWtKssoWsc9c8v/a0qcVrHiR6TrKCzEoAyzq+FuWfeJgc82VbivyoIg6sxSUiZ9l5
         nQLg==
X-Gm-Message-State: ACrzQf0tAU3TXMB+noBz4eBo5LJJbgzEKp4CcjpOgFbR/nyUxffWjQTE
	PzHqQ4zFDSt1HnA7jLmWbtfVJfdAXzQy2onmNrW4wtOkYNRRO7DiKzk+EULq4wsaM53f/rsIqVX
	xBEZ7MUWOo2cT32ahSInzQpxAyyI=
X-Received: by 2002:a05:600c:1906:b0:3b4:c979:e639 with SMTP id j6-20020a05600c190600b003b4c979e639mr3579340wmq.10.1664301366039;
        Tue, 27 Sep 2022 10:56:06 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7FqAzRoJe8tYb81tymnL2G1w/i5A9eSO1xA6YLlCwZrMepZTryND4cUgsUZdpNmVpZgnJ9bg==
X-Received: by 2002:a05:600c:1906:b0:3b4:c979:e639 with SMTP id j6-20020a05600c190600b003b4c979e639mr3579316wmq.10.1664301365775;
        Tue, 27 Sep 2022 10:56:05 -0700 (PDT)
Message-ID: <85cccb780608e830024fc82a8e4f703031646f4e.camel@redhat.com>
Subject: Re: [PATCH net-next 0/4] shrink struct ubuf_info
From: Paolo Abeni <pabeni@redhat.com>
To: Pavel Begunkov <asml.silence@gmail.com>, netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>,  linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, Wei Liu <wei.liu@kernel.org>, Paul Durrant
 <paul@xen.org>, kvm@vger.kernel.org, 
 virtualization@lists.linux-foundation.org, "Michael S . Tsirkin"
 <mst@redhat.com>,  Jason Wang <jasowang@redhat.com>
Date: Tue, 27 Sep 2022 19:56:04 +0200
In-Reply-To: <bbb212f6-0165-0747-d99d-b49acbb02a80@gmail.com>
References: <cover.1663892211.git.asml.silence@gmail.com>
	 <7fef56880d40b9d83cc99317df9060c4e7cdf919.camel@redhat.com>
	 <021d8ea4-891c-237d-686e-64cecc2cc842@gmail.com>
	 <bbb212f6-0165-0747-d99d-b49acbb02a80@gmail.com>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2022-09-27 at 18:16 +0100, Pavel Begunkov wrote:
> On 9/27/22 15:28, Pavel Begunkov wrote:
> > Hello Paolo,
> > 
> > On 9/27/22 14:49, Paolo Abeni wrote:
> > > Hello,
> > > 
> > > On Fri, 2022-09-23 at 17:39 +0100, Pavel Begunkov wrote:
> > > > struct ubuf_info is large but not all fields are needed for all
> > > > cases. We have limited space in io_uring for it and large ubuf_info
> > > > prevents some struct embedding, even though we use only a subset
> > > > of the fields. It's also not very clean trying to use this typeless
> > > > extra space.
> > > > 
> > > > Shrink struct ubuf_info to only necessary fields used in generic paths,
> > > > namely ->callback, ->refcnt and ->flags, which take only 16 bytes. And
> > > > make MSG_ZEROCOPY and some other users to embed it into a larger struct
> > > > ubuf_info_msgzc mimicking the former ubuf_info.
> > > > 
> > > > Note, xen/vhost may also have some cleaning on top by creating
> > > > new structs containing ubuf_info but with proper types.
> > > 
> > > That sounds a bit scaring to me. If I read correctly, every uarg user
> > > should check 'uarg->callback == msg_zerocopy_callback' before accessing
> > > any 'extend' fields.
> > 
> > Providers of ubuf_info access those fields via callbacks and so already
> > know the actual structure used. The net core, on the opposite, should
> > keep it encapsulated and not touch them at all.
> > 
> > The series lists all places where we use extended fields just on the
> > merit of stripping the structure of those fields and successfully
> > building it. The only user in net/ipv{4,6}/* is MSG_ZEROCOPY, which
> > again uses callbacks.
> > 
> > Sounds like the right direction for me. There is a couple of
> > places where it might get type safer, i.e. adding types instead
> > of void* in for struct tun_msg_ctl and getting rid of one macro
> > hiding types in xen. But seems more like TODO for later.
> > 
> > > AFAICS the current code sometimes don't do the
> > > explicit test because the condition is somewhat implied, which in turn
> > > is quite hard to track.
> > > 
> > > clearing uarg->zerocopy for the 'wrong' uarg was armless and undetected
> > > before this series, and after will trigger an oops..
> > 
> > And now we don't have this field at all to access, considering that
> > nobody blindly casts it.
> > 
> > > There is some noise due to uarg -> uarg_zc renaming which make the
> > > series harder to review. Have you considered instead keeping the old
> > > name and introducing a smaller 'struct ubuf_info_common'? the overall
> > > code should be mostly the same, but it will avoid the above mentioned
> > > noise.
> > 
> > I don't think there will be less noise this way, but let me try
> > and see if I can get rid of some churn.
> 
> It doesn't look any better for me
> 
> TL;DR; This series converts only 3 users: tap, xen and MSG_ZEROCOPY
> and doesn't touch core code. If we do ubuf_info_common though I'd need
> to convert lots of places in skbuff.c and multiple places across
> tcp/udp, which is much worse. 

Uhmm... I underlook the fact we must preserve the current accessors for
the common fields.

I guess something like the following could do (completely untested,
hopefully should illustrate the idea):

struct ubuf_info {
	struct_group_tagged(ubuf_info_common, common,
		void (*callback)(struct sk_buff *, struct ubuf_info *,
                         bool zerocopy_success);
		refcount_t refcnt;
	        u8 flags;
	);

	union {
                struct {
                        unsigned long desc;
                        void *ctx;
                };
                struct {
                        u32 id;
                        u16 len;
                        u16 zerocopy:1;
                        u32 bytelen;
                };
        };

        struct mmpin {
                struct user_struct *user;
                unsigned int num_pg;
        } mmp;
};

Then you should be able to:
- access ubuf_info->callback, 
- access the same field via ubuf_info->common.callback
- declare variables as 'struct ubuf_info_commom' with appropriate
contents.

WDYT?

Thanks,

Paolo



