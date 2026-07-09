Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9fhqK2RKT2qIdgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 09:14:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C0272D7F5
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 09:14:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=cMxIxeJ6;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("google.com:s=arc-20260327:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1357575.1611953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whixU-00030C-3r; Thu, 09 Jul 2026 07:14:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357575.1611953; Thu, 09 Jul 2026 07:14:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whixU-0002xU-1C; Thu, 09 Jul 2026 07:14:08 +0000
Received: by outflank-mailman (input) for mailman id 1357575;
 Thu, 09 Jul 2026 07:14:06 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1whixS-0002xO-GG
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 07:14:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whixR-00AuDa-Pc
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 09:14:05 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4f4a3c-e002-0a2a0a5209dd-0a2a450389d6-4
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 09:14:05 +0200
Received: from [74.125.224.52] (helo=mail-yx1-f52.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4f4a3c-ec1a-0a2a45030019-4a7de034bd26-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 09:14:05 +0200
Received: by mail-yx1-f52.google.com with SMTP id
 956f58d0204a3-664cb440f9eso633320d50.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 00:14:05 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1783581244; cv=none;
        d=google.com; s=arc-20260327;
        b=oHXW4CS/Q30vIIlW9AUjWK+b0LfnEjGLh0FBJY1LEVyHf0Eto/womvNOqXQ+CvLEmo
         4LULYKcNNr6eMrauLtwPlKzvuK1slUcKaNsHeYUYZIJXrdKb5h3ImIkuJ4CQOkuBXf1E
         Ungs1Xayd45897pixGZhRtynSxwDwToCL9V3ofFTVTLzCgIa0w8ogRqiM0Jnl4ysjLMB
         ZF4XklpOUeKJ/nPhAWPAdwBtqNImOlBfmZeHGdPXtB8WcMsZBoX2HgSyA19Rb3568D4w
         MqLppqgbw2wriotm3GSzFZ7wp1XElYGuLZpDpBhw9pqZa24DzA5oHaM8hXP5z4VWYzbi
         7Sng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=96R0aAbcwKSJcVhwn6esJttlYNo8225hH9gYOu8JEfo=;
        fh=/xIDEt21AoDgIoFrvXO7IQvdlvHF73QaNWBe25gcoZE=;
        b=cb/HicNx1Zi87X8ds+TAVTT4LZ8qAPnXoX9E+AW8aSNpO2mC+O/s3GgH1UhJKH/j9k
         WY4b2R6B6PMKdEt3IlPblr46p4TVeD60yf0qiVChDD3YaHEFDZAWIzXCaGuN6TDZpuZs
         OG/F2qWnc1oUMhBvxgEoK0vBA52hPfhRxreTQiEKHxm1uGa/xvEN6BAx38RZWvwDJSgR
         S9obYEZh0V8wqCQsybe+VRnNMmzZD78kzVp2Xbo91JZVJ7UGDt62NZKdh8e05wSISEzD
         ETtvalsx9wQIVzMj6yvWSxCPyo0EbBHfNgpbB/StTKFDTbje4AtY80hDqIQyEOrMTI2u
         a4Dg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783581244; x=1784186044; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=96R0aAbcwKSJcVhwn6esJttlYNo8225hH9gYOu8JEfo=;
        b=cMxIxeJ6jLg1CXKSVTURvO9W0sVk7NmQ78mu39nNxIHAXEDGmKvif0hohuwSQdr0Nh
         XV2RmYmILTb9vpGoSLOE+IyBI+sAUvaZbc1O2PB8fAkzd2rb2J4WWBnQvh3/3IOPGfpf
         MKWYreLJXhnnyq+MTPrDhmeY+aNd1VxuH1r+xuUOW7BobYx5pJaImENRaSgDeE06202n
         SsrDgPbkFJoIo/E8vUbx9b4xGE2ZrfQ+jmq781/D2wgfcNFT8rde8ZuhzMfcnOQgvI8z
         DXtj2cSzKaAiMaj5wf1StyO/WQ22W2kUVbdHLnaA3/ErmqsZdThvJrPSrTUa7dohYvbs
         TwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783581244; x=1784186044;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=96R0aAbcwKSJcVhwn6esJttlYNo8225hH9gYOu8JEfo=;
        b=Zvhm4rTbUIsJMR3UIDWAcZdY/bGK8ly4l9FLGd8M2n9BDIaNVGcu9y8/WV9WlUyUnC
         mkIj8Xf7lSi4zdi5m6TrNlnDZa69zdzP6J3TMLWl8PhU0MMjBsELXBOqCReMhooUeTM7
         bQseEQoO6gq1r0+xk4gHQ+E5B8Sb/v7phQzKv1BziD8LKgHjS1glPzFHD+aDg5gvMtIR
         lX+8uv7ho2SxgvjNGpY+PTbQOKBfSrEg6Qg0T76b2/SpEwcyeRWOxY56X7eJDPlgAFOA
         G6e+DZoXP+wmNHHjppy0ffgjmmHMWc0VZWlQwHk/ZKs8h7vwgkKt0CPEE7Q6UrGiL4pq
         o7Gw==
X-Gm-Message-State: AOJu0YxHxKJBxMncAn0iCn8MvnZ/eOWbkULtq2VpTprq6ujEXDWN5F2T
	jw3TJnEFY90XF2VtS+TENjjBga2PEp5dj6pwJ7DdZ2MZikeRirUhJz7Hv6wKH6Vbs8M5H+Dv3wA
	3eoS9Xjb9m4ixmWs4+HTsmD1QuLJ4D+c=
X-Gm-Gg: AfdE7cncutBuTx+/SubKrPxYWeFtKQhuTHrNg0Ec2BbntEfjF3d8xtg3u/LQK35cMUJ
	FAgrK4FrpZyA70660CRLudL/+qCLlBvZemhYawYfXsTaGFTzk97qQeiilkXF9evcJ8UqfeY88Dt
	bFn2F6JnJjS7OMdKSgQJdssjMlXP8taWGZS5E8GKuHqmDaiODdvPsN7+kS6rG04Gbm9ivkmmXr5
	GrnMiVmyFKQHSku/ICYy/SEZIaHu0zC1hNEkdvEa1sRxOUdsC7m3uwQ1xR5TgqhqZ9Ey0Dx2dk6
	ef+iY8unty/R9EIvR63VBceHUZt1K8GUplvkXg==
X-Received: by 2002:a05:690e:4012:b0:666:3c7b:6f79 with SMTP id
 956f58d0204a3-6679f1b316amr3805756d50.68.1783581244131; Thu, 09 Jul 2026
 00:14:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
 <20260619130501.272832-7-frediano.ziglio@citrix.com> <1783432302.8631fc262581453bbf619ec5b2062170.19f3cd94e2d00080a8@vates.tech>
 <CAHt6W4cUTUOw=nsQVYnDBuLMZob0mBaWyjxVrggFWB6tY6LKqQ@mail.gmail.com> <1783516741.8631fc262581453bbf619ec5b2062170.19f41e1bde500080a8@vates.tech>
In-Reply-To: <1783516741.8631fc262581453bbf619ec5b2062170.19f41e1bde500080a8@vates.tech>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Thu, 9 Jul 2026 08:13:51 +0100
X-Gm-Features: AVVi8CeYcbxuGTi9ixzYyESJK5JvJXxNJVwTwLgZJXC8utUtvPexbWDpissTrAM
Message-ID: <CAHt6W4cgB1Azc5ki9-HU=AOf1rnGTvd=ddfJq85k04i7xcxyUg@mail.gmail.com>
Subject: Re: [PATCH v6 06/16] libs/call: cache up to 4 pages in hypercall
 bounce buffers
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, Juergen Gross <jgross@suse.com>, 
	Frediano Ziglio <frediano.ziglio@citrix.com>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-33051d/1783581245-BCF835D1-ACE3F7F2/0/0
X-purgate-type: clean
X-purgate-size: 2598
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20260327:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:edwin.torok@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jgross@suse.com,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 00C0272D7F5

On Wed, 8 Jul 2026 at 14:19, Anthony PERARD <anthony.perard@vates.tech> wrote:
>
> On Tue, Jul 07, 2026 at 03:47:07PM +0100, Frediano Ziglio wrote:
> > On Tue, 7 Jul 2026 at 14:51, Anthony PERARD <anthony.perard@vates.tech> wrote:
> > > On Fri, Jun 19, 2026 at 02:04:51PM +0100, Frediano Ziglio wrote:
> > > > diff --git a/tools/libs/call/buffer.c b/tools/libs/call/buffer.c
> > > > index 155e4f9d43..2f0515c273 100644
> > > > --- a/tools/libs/call/buffer.c
> > > > +++ b/tools/libs/call/buffer.c
> > > > @@ -49,6 +49,9 @@ static void *cache_alloc(xencall_handle *xcall, size_t nr_pages)
> > > >  {
> > > >      void *p = NULL;
> > > >
> > > > +    if ( nr_pages == 0 )
> > > > +        return NULL;
> > >
> > > By doing that check here, we don't update the stat anymore. And it's
> > > getting out-of-sync with the updates done in cache_free().
> > >
> > > Before, we where returning a cache entry for that, and cache_hit++. I
> > > think it's ok to return cache_miss++ instead.
> > >
> >
> > Well... requesting 0 pages is weird by definition, even malloc(0) is
> > not well defined.
>
> malloc(0) isn't defined as weird, it is defined as
> "implementation-defined" ;-). But the pointer that the cache function
> handle isn't from malloc().
>
> > In theory in this case returning NULL would cause cache_free to not be
> > called as filtered by xencall_free_buffer_pages.
>
> Yes, for cases where the allocator returned NULL. But I can't find any
> guaranty of this. So I would prefer to have both cache_alloc() and
> cache_free() behave the same way when faced with nr_pages==0, without
> hindsight into the value of the pointer.
>
> >
> > I think the most symmetric think would be adding a similar test in
> > cache_free, like
> >
> > static int cache_free(xencall_handle *xcall, void *p, size_t nr_pages)
> > {
> >     int rc = 0;
> >
> >     if ( nr_pages == 0 )
> >         return 1;
> >
> >     cache_lock(xcall);
> >
> >
> > (the return 1 is needed to prevent the attempt to munmap the pointer
> > which does not make sense).
>
> If we have a pointer that is not NULL, we must free it. Even if you
> think it doesn't make sense. Also, there's no way to know, here, whether
> munmap() or an other function is going to be used. So, cache_free() must
> not say that it cached the pointer, and let the caller free it.
>

Changed to return 0, NULL pointer is handled by the caller anyway.

> Cheers,
>
>
> --
> Anthony Perard | Vates XCP-ng Developer
>
> XCP-ng & Xen Orchestra - Vates solutions
>
> web: https://vates.tech

