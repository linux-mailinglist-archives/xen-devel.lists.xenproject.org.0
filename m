Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zMwQEoIrV2p/GwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 08:41:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D80475B283
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 08:41:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=cieebBkB;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20260327:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1362750.1614506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjtIS-0006yB-NY; Wed, 15 Jul 2026 06:40:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362750.1614506; Wed, 15 Jul 2026 06:40:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjtIS-0006w3-KN; Wed, 15 Jul 2026 06:40:44 +0000
Received: by outflank-mailman (input) for mailman id 1362750;
 Wed, 15 Jul 2026 06:40:42 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wjtIQ-0006vc-M5
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 06:40:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjtIQ-00AFBt-2u
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 08:40:42 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a572b60-5cb7-0a2a0a5109dd-0a2a4508c54c-16
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 08:40:41 +0200
Received: from [209.85.128.177] (helo=mail-yw1-f177.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a572b68-f659-0a2a45080019-d15580b1f026-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 08:40:41 +0200
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-80bb41f7f3cso18289637b3.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 23:40:41 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1784097640; cv=none;
        d=google.com; s=arc-20260327;
        b=dohIWdI3BsSvcSyNY2T/KAcUYJIb3pyiqV9D/TENFZ89LICwTpRVKLMfujAax7vhqI
         hODNwt/IWEtt1iqOO1/aPRBxuzXom8xbEwMvxrDF8u/E5kxK19hMpOgGRCulwxrgIJgU
         GKfLweugbOUiDML/IlM8eVWP4Pl1qKw30hGgNclbF2A+z20PZKX0RVavQdlDrzbkk2xb
         75EUwCC1MO0Sicp+7XhoRV7znz/oxiM+92lRZG4patpaNKK8orPZHmcKN2/m5NU4ZKpl
         q0UMZePdYlc/qD6UoZeC5OQ0QI9PyrN8rYpL/TxAEyoPxJElrub6/OSrdmYg3r+tnvl1
         PQxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9+Np44NVG1r6KCmuomiTAT4j+LIYv5FDQ+m0vasJAd4=;
        fh=EJLENqEWin3HDbJrEt5hzjfJyi8vgBHaw+wAcYxLVBA=;
        b=qSBI+P+9/wnXgi2V+2zu21KEaf3ms8XrSP4Nidr3UngPlQTHY5sT7AAY8ckng9hXmy
         FooWdCivcd/6+2Bwx33vbufj2frqUZeTHiKUkgfG4MxlYjicu2RdSmdG6QuUfWrLASzF
         yP9jLMfflZHvsb/sWT/0xPwYcEvgE14hNJLnYueYIz2RMddRlMyvZ45GXhf9i3NSGOe5
         da6TfvxW/wHGAw43P1WocJn7Addw10nj2863GGpj4XRyNgrhhYf3Ug+aUSoZu1GGL1kl
         eX4alMdb+jN/H1U9njYtCoavixaKQNhfjbnL+q8kgh+liXKU/3jgMRB7s+ao4VCtWV/G
         n9DA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784097640; x=1784702440; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9+Np44NVG1r6KCmuomiTAT4j+LIYv5FDQ+m0vasJAd4=;
        b=cieebBkBF/ceighsAJL/vBbPqgxtzcByikJGLZQfaNVXgaaUfbj5OaF8ZGPbiwBNWJ
         3Z6T1s9zenD/pRO9ZfZwqo5QD/LDKxExwJ4I/VSK98gcZZinakzgcVUqU9F2AW1Xc6IG
         1KGRggDQbI+8X0sL/9T7LW/sOcQnw1bNHMQQpEYE8rd5hfScSWbym029gGzcCnIXybdb
         +rDngjOkQFT9cMZeTCD5fALeeYYz3x+qNsq1Cu4CI2GChiYZClQBHzXyJy35bxMLrBZB
         Y6sgkRgDF7DOegj0zzWD9F8JROjGJK/txqQfpVwnry1zffNWvam400hI0+hAxgJxejvS
         jtCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784097640; x=1784702440;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9+Np44NVG1r6KCmuomiTAT4j+LIYv5FDQ+m0vasJAd4=;
        b=nvhzfvlObfUqxwgIdLjxdH7/glItRT1N0EZ5Q5eWLEycn2ylj3VFz80pxS/ohi095F
         4zpmCjFax/upgA/OZHeMoES2aRLIXVuNCccRZi9rt1dhSN2rj63hU3pY5aegUcaFP7bO
         ND2g6LCGPRiuzJmx7hrpdmPrIAgD0IkWE+D5o8zFmozMFHg/evYJOmXbqAxl1LN1Yz/O
         QpzdGBs/0UD5ZMjnnBtijFy3samC2gMRrUiQNwxY5pXZrph+A9bLL8jVARd6F5KgovVd
         h6/G42IjovbI64kg6lWYTMZRzVscWovme4vg3sG+gUZD7umEJ2Qi8qyLpmkrZ0QEu0I+
         4PFg==
X-Forwarded-Encrypted: i=1; AHgh+RqgWjBc7ovS/k9oSROGPCTQfrY2o2FMnm+gCwkP1Ra8b1NfxjQvaWX++bu0uRt29tY9QOi2taJ9LFs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzICRmTWKWU8m3U1Qs/YKwr8zMNh3KZiDGxvRLXzPKD3GMPzY2Y
	x3JsFSLE7Amp9e6FwVx766Wkd7VAAUIWdWhRXZmQ5UeMWIcLskIkc1gpe86+9Csxh5SEL1Z1wH/
	GnVL4czYvbk62NywH4O4jqAIV9sQdSEw=
X-Gm-Gg: AfdE7cniuNGtrlgL3T/AA1vndKtq4zPeEZTtPBo0qoA+W78NRnQPFNhMdgdqrHr35wa
	KC/2y2OA3L5An2nERNhOV3ZCbVR9hXZlVHDZN4YxhHuyabNfiefWyL5ul2mSbhcLThZ/RgMzGOe
	l7wvfNVHG73CmzLEVBWj+8GokV4FIvBIwusnxW4eWhECb/Ym0BYWYeAMkJyQPjoxxdkHKyLBJkj
	ortg2dFK81ABFrSCydXgtMjVCuqpu4V9mDYG9t42AEVw6oooVkjVi7N11caNmclK/E5q+mQwJxC
	MsEokAF4xtYBvj0QB9X8n3hWEA==
X-Received: by 2002:a05:690c:6981:b0:80e:2917:4b01 with SMTP id
 00721157ae682-81e9003e955mr118850887b3.27.1784097640333; Tue, 14 Jul 2026
 23:40:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260715062206.328049-1-frediano.ziglio@citrix.com> <9a410426-8ec8-4314-91e5-d76a73275ad6@suse.com>
In-Reply-To: <9a410426-8ec8-4314-91e5-d76a73275ad6@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Wed, 15 Jul 2026 07:40:29 +0100
X-Gm-Features: AUfX_mxbWb4ZjVAgxaugfClBXhtW3x2HgN-WuWMb0a3Gpi1xZIFaGT8xmGqDUzs
Message-ID: <CAHt6W4cbDh_OFYPxJJy9RiRTCrV3p2OVJ8AL855ixhFKrPm0UA@mail.gmail.com>
Subject: Re: [PATCH v8 0/4] Various patches to improve Secure Boot support
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-c1860d/1784097641-D594A87B-12F30A2F/0/0
X-purgate-type: clean
X-purgate-size: 1368
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20260327:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:frediano.ziglio@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9D80475B283

On Wed, 15 Jul 2026 at 07:24, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 15.07.2026 08:22, Frediano Ziglio wrote:
> > These patches improve support for Secure boot.
> > UEFI CA memory mitigation requires memory pages to be not executable and
> > writable at the same time. So changing permissions and splitting some section
> > is required.
> > Remove multiboot pieces from EFI executable.
> >
> > Changes since v1:
> > - improved some comments;
> > - merged 2 pacthes removing multiboot support in x86 PE;
> > - removed a patch dealing with SBAT;
> > - other minor changes (see single patches).
> >
> > Changes since v2:
> > - improved some comments.
> >
> > Changes since v3:
> > - Added Acked-by;
> > - Improve commit message.
> >
> > Changes since v4:
> > - Messages updates;
> > - Clean some dependencies cause by code removal;
> > - Add small commit to remove a possibly unused string.
> >
> > Changes since v5:
> > - removed merged commit;
> > - remove more code/data from xen.efi output.
> >
> > Changes since v6:
> > - fix commit message.
> >
> > Changes since v7:
> > - added Acked-by, all commit are now acked.
>
> Forgive me asking, but why did this warrant another re-submission? We've
> got enough traffic on the list already.
>
> Jan

Because there was an update and because nothing was merged.

Frediano

