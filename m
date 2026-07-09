Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AoRWJe5rT2rZgQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 11:37:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC1972F07F
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 11:37:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="l2Xj+up/";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("google.com:s=arc-20260327:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1357723.1612070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whlCF-0001he-Jc; Thu, 09 Jul 2026 09:37:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357723.1612070; Thu, 09 Jul 2026 09:37:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whlCF-0001fL-Gu; Thu, 09 Jul 2026 09:37:31 +0000
Received: by outflank-mailman (input) for mailman id 1357723;
 Thu, 09 Jul 2026 09:37:29 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1whlCD-0001ce-NY
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 09:37:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whlCD-00ELQn-0C
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 11:37:29 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4f6bd4-e002-0a2a0a5209dd-0a2a45019406-14
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 11:37:28 +0200
Received: from [74.125.224.43] (helo=mail-yx1-f43.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4f6bd7-400f-0a2a45010019-4a7de02bf17a-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 11:37:28 +0200
Received: by mail-yx1-f43.google.com with SMTP id
 956f58d0204a3-664dd23829eso1541310d50.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 02:37:28 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1783589847; cv=none;
        d=google.com; s=arc-20260327;
        b=qTVTs0LY2BOKiBA+DpmkPqrvp8c/uWnP1ZyA9v2ZSz3kpc5VpHT/TvbkKrbPqg6QqV
         9psJkD52TNkqx/tAnWnOZSEiiG1vAs5a3J4umga48xqRi6fFqHbUpbmaBfp7dGnJXN/l
         Kshyk6kpYqsDOi4rz8j5pYmctG1Et5iNG+dc0Dpepe917OAwu3PBeNf3xxXhM3D0aWel
         f3QNnxCzZzWRJIPSn9JgxRqdcxLvRYEwOiURCbW9Ng1MiZaDPCopnQDV1OAdpUxeOubK
         eNRX7xH354tTjc3fcYiDjit45pfEOiLuYs9KeqN7TcQAFLsukHjHSBidaTgzCI9hUcJj
         NZjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=30jgUe5zJKxXDZIxdybxxZTE0JIc8ztpbZM6GTUTIQ8=;
        fh=aU3/UpxH5Blg8M5NzH55q/XY8irYVWQMVJdPeFRWhhg=;
        b=K4eE+h6C7Z4uHl39stvRoXBn7QMHbnjEd7jyli29rqC0luVrl1xXWeLf59y+vVA6cx
         xoxhKkE26yVMCz6D/TiYf1KKlNeXrqZjMlezEoVunDvVp9yCXwO4dCTJJ09pzIT7Efi7
         EVd/BFQ234Dw8tmtEFkpHBJCw17u0Ddhl3i5MTBSbYsJGLJQ16xHvgdSG2h5lMSHySrX
         Jgnl7TExGjvW5HS7yQcOCmpcYNIOTIgNPB8gQaGP+TK0fZtXap/VUJMCc0pvRSWFGbs2
         6oAQKFAT/7rAr+ml0xDnWy+6sgefyo6l0BeAD2Y0volb2c9/3mH+XFpfXnLrE5nMqyv5
         pE8A==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783589847; x=1784194647; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=30jgUe5zJKxXDZIxdybxxZTE0JIc8ztpbZM6GTUTIQ8=;
        b=l2Xj+up/IUBjw0ElyOulfUt9BbcZn2AA+8ciVNPQD3OfPS4Stj8nY6Fz5vPKh4XVXc
         YczGMnNcEqDWXhbq1niIUv68esgN8K/MCTnx2HNeEhlHlX48YgC+4xVMvYjAs6kWHvXV
         aKDKi79yineQoVUEA8bEw0OD0HlRhbt7JQQ0Ickhs0d3LBUoZPcGDZRuAnmo7dPj56NY
         oaPORtBxsYt10k3PfdDiebihAP1oRsLwb/URYcYzofc/N6BqyeLjaC+2ktnK9q/bnkmO
         JFzRl8QQg8lNLgfxEq0jM7h6ZRFii+3Hb05lv9O09LuSGpKA0iAg10otWNkCjTmQ98xP
         /ZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783589847; x=1784194647;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=30jgUe5zJKxXDZIxdybxxZTE0JIc8ztpbZM6GTUTIQ8=;
        b=mnQr6+c99Wc2bnBHWanSMsE/4pcJqM0WrVW6IeLp+fqHc1wfEf3UtTM597WSGnywzw
         5lKW3kjC4VVWRuIfm2P9/UzS1N+U7Zsp2OY/rCVPahZ98P1R3dWm+bh7iY68VT5jbec+
         LDwgPOPdeVxokY26qLzN+mbockT9Ta3c+GxUGNW7sry9aaO29mextgTsgqu+iV7Lo8qO
         J/yydv2cpIgVBPTH/KWice6j/OK3h4QLWcmpBGwLPuOAlF04X8iIX4FlYKtrzyJpHwPw
         r/eGTOg1HkfVwj/67Fr4MhcsF/yrYfyWRSjTwZxLZObh+HyYJR8qbjANZmpPVse4TLFn
         1kNg==
X-Gm-Message-State: AOJu0Yy4xPvPrwdbehu4cV08bGBTF6fMKVPZX64YaQf3zYgA8afr1zVx
	63zFJS4UAS/Xfn/IECA0cl56YKJufdenR0ydPxpeOcd4mWaP7fcIprR+hIvwyw9XZWyzO/hq0H+
	N5KYQ159SwB0z5qi9vSdtEfyeuzF10LI=
X-Gm-Gg: AfdE7cmrOqG7LptmJI1h+9NW0aRU5LO6f63ct8kCZt1C5hphqtm2pjzPACDCX6Yy4Vh
	z1E0mzkkAD0qmZXONkUgbK0MELYPb8zGci9pPRg9IMDdrRikYhVwUsxi1HDZMMcsPna0VRTd1r7
	TNFhG5Gu4YzxtJpJvnQLNN3zP+AZd2pA2hMrUt69sq/HqyfukW2W0HAzpurOt2GmNhLSSWd7XXW
	USvi2cuzYn/j0aqi61o3sqP1nGWaedxZntJUGQayYrb0BmpCD6iBYk8y5o1sHZu0R+3fAjfzSkM
	xlPjwaHfjbi75fnyndVckYz2jdA=
X-Received: by 2002:a05:690e:b4c:b0:667:aa57:686a with SMTP id
 956f58d0204a3-667aa5773b7mr3794473d50.60.1783589847462; Thu, 09 Jul 2026
 02:37:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
 <20260619130501.272832-14-frediano.ziglio@citrix.com> <1783519155.8631fc262581453bbf619ec5b2062170.19f4206944f00080a8@vates.tech>
In-Reply-To: <1783519155.8631fc262581453bbf619ec5b2062170.19f4206944f00080a8@vates.tech>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Thu, 9 Jul 2026 10:37:14 +0100
X-Gm-Features: AVVi8Cdis0fRnDTEPQdyLuzYm6PjmIW-UDJEZT57ID_YOK36X4gkbVTAEnEBXJ4
Message-ID: <CAHt6W4dkCzf4u1Wr2yqxBdV8YpekbySxpm3Zz0TA+z2CKJ4nxw@mail.gmail.com>
Subject: Re: [PATCH v6 13/16] privcmd: Add definition for new Linux privcmd to
 access new Xen hypercall
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, 
	Frediano Ziglio <frediano.ziglio@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-d62444/1783589848-804D21E0-E2FFEC3A/0/0
X-purgate-type: clean
X-purgate-size: 1813
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20260327:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,mail.gmail.com:mid,vates.tech:email];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EAC1972F07F

On Wed, 8 Jul 2026 at 14:59, Anthony PERARD <anthony.perard@vates.tech> wrote:
>
> On Fri, Jun 19, 2026 at 02:04:58PM +0100, Frediano Ziglio wrote:
> > diff --git a/tools/include/xen-sys/Linux/privcmd.h b/tools/include/xen-sys/Linux/privcmd.h
> > index 607dfa2287..7a3c41308b 100644
> > --- a/tools/include/xen-sys/Linux/privcmd.h
> > +++ b/tools/include/xen-sys/Linux/privcmd.h
> > @@ -100,6 +100,14 @@ typedef struct privcmd_pcidev_get_gsi {
> >       __u32 gsi;
> >  } privcmd_pcidev_get_gsi_t;
> >
> > +typedef struct privcmd_foreigncopy {
> > +     domid_t dom;          /* Foreign domain. */
> > +     __u16 dir;            /* Direction,  0 from, 1 to. */
> > +     __u32 num;            /* Number of pages to copy. */
> > +     const xen_pfn_t __user *pfns; /* Array of pfns. */
> > +     void __user *buffer;  /* Buffer to copy to/from. */
> > +} privcmd_foreigncopy_t;
> > +
> >  /*
> >   * @cmd: IOCTL_PRIVCMD_HYPERCALL
> >   * @arg: &privcmd_hypercall_t
> > @@ -121,6 +129,8 @@ typedef struct privcmd_pcidev_get_gsi {
> >       _IOC(_IOC_NONE, 'P', 7, sizeof(privcmd_mmap_resource_t))
> >  #define IOCTL_PRIVCMD_PCIDEV_GET_GSI                 \
> >       _IOC(_IOC_NONE, 'P', 10, sizeof(privcmd_pcidev_get_gsi_t))
> > +#define IOCTL_PRIVCMD_FOREIGNCOPY                            \
> > +     _IOWR('P', 11, privcmd_foreigncopy_t)
> >  #define IOCTL_PRIVCMD_UNIMPLEMENTED                          \
> >       _IOC(_IOC_NONE, 'P', 0xFF, 0)
> >
>
> I don't think I can accept this patch until the changes have been added
> to Linux. Also, I think it would be fine to squash this
> changes into the patch that start using this new hypercall.
>

The last patch is for Linux, but I saw no comments on it.
For the merge, yes, it can be done, not a big deal.

Frediano

