Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 775DD64A3B1
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 15:48:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459670.717457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4k5p-0003dw-Qu; Mon, 12 Dec 2022 14:47:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459670.717457; Mon, 12 Dec 2022 14:47:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4k5p-0003bX-Nw; Mon, 12 Dec 2022 14:47:45 +0000
Received: by outflank-mailman (input) for mailman id 459670;
 Mon, 12 Dec 2022 14:27:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BPaw=4K=tibco.com=sdyasli@srs-se1.protection.inumbo.net>)
 id 1p4jm0-00008D-Ql
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 14:27:16 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 132a30b3-7a29-11ed-8fd2-01056ac49cbb;
 Mon, 12 Dec 2022 15:27:15 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id e13so13082384edj.7
 for <xen-devel@lists.xenproject.org>; Mon, 12 Dec 2022 06:27:15 -0800 (PST)
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
X-Inumbo-ID: 132a30b3-7a29-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XpuandItVmoNpmtbX8sLodkDJR/K/tYSTNlnrWKDCSI=;
        b=Hvp7A8Rt6FGiDuYmg4TFegkYSzMnIeVsMYALBKxsIu0CPGgImKYOueAXxJDorftfH9
         9Ho+w14JzIwDoHaiKImgkWAM6lqWd6COQHahJSVPo200gnIn1vWoRuSRhqbc0buKHvRL
         TE/Hib9DdEv6l8eWraq5XzdSYUcrljn8bOV+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XpuandItVmoNpmtbX8sLodkDJR/K/tYSTNlnrWKDCSI=;
        b=qzpRxaXAl2DyMUph7vg6EeJ5GdSoDHS4jEEHK/WHw3o0UDgOKXfRWWd7CcF7T822ZL
         Msjrd7s7Jy5D+dQzbhYr90wMGzDWMvDhhCr1GPxv0pU5mBemySTddvU0UGLJgsVAY2SW
         raYZiFPU5wKkqBday4hn5sqk6IQKoPTvD6GWfmkzhjbkmK2BInntmLz7srhvTkLR6xGk
         v9bhH5EdDnBzyIBeppz0CcyCuf2lZ95YWxUPQUsVDB7fiBv9DQzcfRP3CiIaUA2FHBuS
         yXXbtf99o9tRnuLrIS5klr6xLyIKe3nrYo+h6i9BDPPC68+OMowL7dXhtLU5zVx8fkPp
         1uUw==
X-Gm-Message-State: ANoB5pk5dS1FS8SFwCMY60lSfkt4lrvnFSaqcmMjewOKFTMHv1Rdz88Z
	n6dUvIzjuf8IjaBIQAL9mA32PxnFjUmBodLkVsiLI8RP0W4Tavg5
X-Google-Smtp-Source: AA0mqf6xI8QXyVreFeaSZuZAyI182R3j4+8MyB3srjD4UvWWPYOsha7jbAWJJnjpwQQLbH8/eW0zNSLklehK8sJ+1ko=
X-Received: by 2002:a50:fe87:0:b0:46d:5a5c:e3bf with SMTP id
 d7-20020a50fe87000000b0046d5a5ce3bfmr7249934edt.142.1670855234894; Mon, 12
 Dec 2022 06:27:14 -0800 (PST)
MIME-Version: 1.0
References: <20221208132639.29942-1-sergey.dyasli@citrix.com>
 <c6676171-8cab-dfbc-4b18-d9c724588398@citrix.com> <35f9e529-35b9-0432-8e98-8b0100953856@suse.com>
In-Reply-To: <35f9e529-35b9-0432-8e98-8b0100953856@suse.com>
From: Sergey Dyasli <sergey.dyasli@cloud.com>
Date: Mon, 12 Dec 2022 14:27:04 +0000
Message-ID: <CAPRVcuccXaLNX3suy1t+xD_kptnV2yLxoCN_193PF6Gj_FBD1w@mail.gmail.com>
Subject: Re: [PATCH 1/2] x86/ucode: allow cpu_request_microcode() to skip
 memory allocation
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 8, 2022 at 3:34 PM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 08.12.2022 14:59, Andrew Cooper wrote:
> > On 08/12/2022 13:26, Sergey Dyasli wrote:
> >> @@ -240,20 +240,20 @@ static const struct microcode_patch *nmi_patch = ZERO_BLOCK_PTR;
> >>   * patch is found and an error occurs during the parsing process. Otherwise
> >>   * return NULL.
> >>   */
> >> -static struct microcode_patch *parse_blob(const char *buf, size_t len)
> >> +static const struct microcode_patch *parse_blob(const char *buf, size_t len)
> >>  {
> >>      alternative_vcall(ucode_ops.collect_cpu_info);
> >>
> >> -    return alternative_call(ucode_ops.cpu_request_microcode, buf, len);
> >> +    return alternative_call(ucode_ops.cpu_request_microcode, buf, len, true);
> >>  }
> >>
> >> -static void microcode_free_patch(struct microcode_patch *patch)
> >> +static void microcode_free_patch(const struct microcode_patch *patch)
> >>  {
> >> -    xfree(patch);
> >> +    xfree((void *)patch);
> >
> > This hunk demonstrates why the hook wants to return a non-const
> > pointer.  Keeping it non-const will shrink this patch quite a bit.
>
> Alternatively it demonstrates why xfree() should take const void *,
> just like e.g. unmap_domain_page() or vunmap() already do. We've
> talked about this before, and the argument hasn't changed: Neither
> unmapping nor freeing really alters the contents of the pointed to
> area from the perspective of the caller, as the contents simply
> disappears altogether.

Despite my love of const, const correctness in C is quite a pain. I've
tried to make xfree() take a const pointer but then issues began with
add/strip_padding() functions and I couldn't overcome those without
further (void *) casts which just takes the problem to a different
layer.

I think I'll have to go with Andrew's suggestion and continue to return
non-const pointers from cpu_request_microcode(). This will include
a cast though:

    patch = (struct microcode_patch *)saved;

Sergey

