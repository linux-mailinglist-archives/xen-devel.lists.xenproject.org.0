Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A9E27D2FF
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 17:44:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.291.776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNHnv-0002o8-VY; Tue, 29 Sep 2020 15:44:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291.776; Tue, 29 Sep 2020 15:44:35 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNHnv-0002nm-Rw; Tue, 29 Sep 2020 15:44:35 +0000
Received: by outflank-mailman (input) for mailman id 291;
 Tue, 29 Sep 2020 15:44:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zis1=DG=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kNHnt-0002nh-Iy
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 15:44:33 +0000
Received: from mail-wm1-x329.google.com (unknown [2a00:1450:4864:20::329])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e00a385b-a490-462a-b034-847911113086;
 Tue, 29 Sep 2020 15:44:32 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id y15so5334095wmi.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2020 08:44:32 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-233.amazon.com. [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id 92sm7173472wra.19.2020.09.29.08.44.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Sep 2020 08:44:31 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Zis1=DG=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kNHnt-0002nh-Iy
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 15:44:33 +0000
X-Inumbo-ID: e00a385b-a490-462a-b034-847911113086
Received: from mail-wm1-x329.google.com (unknown [2a00:1450:4864:20::329])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e00a385b-a490-462a-b034-847911113086;
	Tue, 29 Sep 2020 15:44:32 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id y15so5334095wmi.0
        for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2020 08:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=5My7dn1m6VmkboSE+EbSkmIuow+NJ3bn9iaJxffgICg=;
        b=b+97w1Ft8VElq1NIM6glJH9KWUJ+qBykIFDzEZkU7NPgac5RuFZzxqmV5vTYsF2oRC
         xdwmmZblJbry63LEzM45GrOKkutuS77v7ZflW7lusR03cEsVB0uJa93tBL3WQnZdZ4NL
         hL65WhpnHcJKzcGURuoQ7csAaj13o9NJwgi571ZzEr2UCOJaExsk+FPJ+8mvuSK71MO/
         T42HY82EEaY+B4MzQTMdvBljse4abXadMeshDj+kTwdQ50h03fxVepPkB7zFULup+qFu
         yZ7Z3GLVeR9j1BrQZ0IyTIT2oj+ZP5T3SOkMkECsuVoe442m/M9kS6dVz5y6+aVRXuv2
         FBZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=5My7dn1m6VmkboSE+EbSkmIuow+NJ3bn9iaJxffgICg=;
        b=RNeyEDbQ6xjQhU/K5OJmyWlUu6ZkBrOUcYLrQcEzaBSEM7lRc28n3nI7oQsRQs+C1m
         sTXMlFhL0fS54v5gXvZAy/FpaPHsKlfNXCSNFGh/sofbecJej9fcwdLMHhPbv1SJPbB+
         trSS8dXOdXNOevzqMea0abemt+ASLIw60qhkS99Clrwtb2xfo3NMxcmDJjrCP7KMEp72
         znKk7g0x0vLg6NRhsso4IJd/C+PTDpeoV3YbOpn2L2RMbYP4ZTza5fLej67J/Eu+6IFP
         UcaK0DO9UToJTVOZ/yxW8YKBFeX+QRJiI22Y89x7AdLNJh0tp4iHfx+mH6U0COjatfgU
         x4Kg==
X-Gm-Message-State: AOAM531unq1QNuyIabVwWkbF0Ga04dc2Y5wfIn5MVQtrk8yswJzTyF39
	71W3ELpVOXoGr/9hsN1WlrI=
X-Google-Smtp-Source: ABdhPJwsYb9YytNupf58uADGPnKgcqVcwkB63fieWlE8Gkyc4aiVMgavxEJlJwIIVI0liWrzcYqZQQ==
X-Received: by 2002:a05:600c:4104:: with SMTP id j4mr5108134wmi.36.1601394271855;
        Tue, 29 Sep 2020 08:44:31 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-233.amazon.com. [54.240.197.233])
        by smtp.gmail.com with ESMTPSA id 92sm7173472wra.19.2020.09.29.08.44.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Sep 2020 08:44:31 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'George Dunlap'" <George.Dunlap@eu.citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Julien Grall'" <julien@xen.org>,
	"'Wei Liu'" <wl@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com> <b8f87009-ba1a-dfaf-e130-03c5500f76c4@suse.com>
In-Reply-To: <b8f87009-ba1a-dfaf-e130-03c5500f76c4@suse.com>
Subject: RE: [PATCH 02/12] evtchn: avoid race in get_xen_consumer()
Date: Tue, 29 Sep 2020 16:44:30 +0100
Message-ID: <001f01d69677$6c03c7b0$440b5710$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHyn6bUUfstxLK2yDInWW9SM20ChgIp92gvqTZfUPA=

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Jan Beulich
> Sent: 28 September 2020 11:57
> To: xen-devel@lists.xenproject.org
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap <George.Dunlap@eu.citrix.com>; Ian
> Jackson <iwj@xenproject.org>; Julien Grall <julien@xen.org>; Wei Liu <wl@xen.org>; Stefano Stabellini
> <sstabellini@kernel.org>
> Subject: [PATCH 02/12] evtchn: avoid race in get_xen_consumer()
> 
> There's no global lock around the updating of this global piece of data.
> Make use of cmpxchg() to avoid two entities racing with their updates.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> TBD: Initially I used cmpxchgptr() here, until realizing Arm doesn't
>      have it. It's slightly more type-safe than cmpxchg() (requiring
>      all arguments to actually be pointers), so I now wonder whether Arm
>      should gain it (perhaps simply by moving the x86 implementation to
>      xen/lib.h), or whether we should purge it from x86 as being
>      pointless.
> 
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -57,7 +57,8 @@
>   * with a pointer, we stash them dynamically in a small lookup array which
>   * can be indexed by a small integer.
>   */
> -static xen_event_channel_notification_t xen_consumers[NR_XEN_CONSUMERS];
> +static xen_event_channel_notification_t __read_mostly
> +    xen_consumers[NR_XEN_CONSUMERS];
> 
>  /* Default notification action: wake up from wait_on_xen_event_channel(). */
>  static void default_xen_notification_fn(struct vcpu *v, unsigned int port)
> @@ -81,7 +82,7 @@ static uint8_t get_xen_consumer(xen_even
>      for ( i = 0; i < ARRAY_SIZE(xen_consumers); i++ )
>      {
>          if ( xen_consumers[i] == NULL )
> -            xen_consumers[i] = fn;
> +            (void)cmpxchg(&xen_consumers[i], NULL, fn);
>          if ( xen_consumers[i] == fn )

Why not use the return from cmpxchg() to determine success and break out of the loop rather than re-accessing the global array?

  Paul

>              break;
>      }
> 



