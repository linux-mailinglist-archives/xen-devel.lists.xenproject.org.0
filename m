Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE602152D4
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 08:59:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsL5Y-0001dN-Lp; Mon, 06 Jul 2020 06:58:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bUWB=AR=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jsL5X-0001dI-6O
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 06:58:51 +0000
X-Inumbo-ID: 253b0890-bf56-11ea-bb8b-bc764e2007e4
Received: from mail-wm1-x32f.google.com (unknown [2a00:1450:4864:20::32f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 253b0890-bf56-11ea-bb8b-bc764e2007e4;
 Mon, 06 Jul 2020 06:58:50 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id 22so38051215wmg.1
 for <xen-devel@lists.xenproject.org>; Sun, 05 Jul 2020 23:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=9uNruDhmPyImOqqHCrEGTkb5DFGlhJcN7Yk887FFybI=;
 b=suGhUR7EpQXJGED7NSQgAt2gLpJ1pwBVYLR2gDNKouS+HtV/cseJn4WUwm/jQVeCaK
 bTlE8m/gg957YfFt2K4Rhgrn01+2kTnMKXuVjducQStVDKVKu5IVbCKJXuj517QQWz11
 SyYrwaSG4hEhMM27S6xwEqXYCWvDw4W4agyhwPwiNZn0xDY3/AlzWBknWI5WQigbHMzT
 DJp7x7NwJZ2R338CGtY98UmJ7oMIvHxeurrVBw9XIiGeRUFc6pYftMNht0XgUx4sn1I5
 j5+80tjhM/adT6/KQxcZomAT7pTHbHDWZ18h8Du+NvRnkwH4vUm9RStVX+lGP3t8aKDL
 lgVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=9uNruDhmPyImOqqHCrEGTkb5DFGlhJcN7Yk887FFybI=;
 b=rMA33s0VDWaB/mU+UJnpDx3O++NcBsjUKgZgIpdp/E5JzXr2gepk4Wtj2kKwn/mR1a
 wCJSJR4yNzpSuFRgiZitO0wgFPJHsYS0zUiar92TtC4HIcxeSPsJNWB+9+tLWLurQEuL
 U/iGVauCe2ax7v6kboVnVsqwKxEzJucC0fzsN3FL7z7ThYuXWw8pk9AQJVP9WjZfxgG4
 1q4nD9rQz67V1e9/0ZgkZVnKUQpX69GIY4a6mLH/dUOVDQr4TpRIvu+/XwN0MQxAiPhD
 kVQXFzfGB0cDTgEEHGw7HnbEvfmG0UUhL0kpUbqaCePsOPYUe8w64NcQvgj2HZKfSKWH
 eZGA==
X-Gm-Message-State: AOAM530Pmn7nupD/k8bknK0H/rpHkNzDCpWN/y7M2P+QFIxPes9bnXX0
 VEkCo6a6uGhOQ05fR6uLVH4=
X-Google-Smtp-Source: ABdhPJzLjwVLtEZDdcQx3Kd3RzhaH8DDbJBU7HpWPcF0d/onwg6Itjr8nZPwyWoRUzTEGfNDOjnfag==
X-Received: by 2002:a1c:2109:: with SMTP id h9mr4789164wmh.174.1594018729744; 
 Sun, 05 Jul 2020 23:58:49 -0700 (PDT)
Received: from CBGR90WXYV0 ([2a00:23c5:5782:7500:8191:456f:379d:d246])
 by smtp.gmail.com with ESMTPSA id 30sm24064903wrm.74.2020.07.05.23.58.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 05 Jul 2020 23:58:49 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Tim Deegan'" <tim@xen.org>,
	"'Wei Liu'" <wl@xen.org>
References: <20200703201001.56606-1-wl@xen.org>
 <20200703202718.GA72092@deinos.phlegethon.org>
In-Reply-To: <20200703202718.GA72092@deinos.phlegethon.org>
Subject: RE: [PATCH for-4.14] kdd: fix build again
Date: Mon, 6 Jul 2020 07:58:50 +0100
Message-ID: <007701d65362$e7c89130$b759b390$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQL1GIiwyScKkPdw+9l0F8HkPG9WSwGPLZeIprAbMaA=
Content-Language: en-gb
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Xen Development List' <xen-devel@lists.xenproject.org>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'Michael Young' <m.a.young@durham.ac.uk>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Tim Deegan <tim@xen.org>
> Sent: 03 July 2020 21:27
> To: Wei Liu <wl@xen.org>
> Cc: Xen Development List <xen-devel@lists.xenproject.org>; Michael Young <m.a.young@durham.ac.uk>;
> Paul Durrant <paul@xen.org>; Ian Jackson <ian.jackson@eu.citrix.com>
> Subject: Re: [PATCH for-4.14] kdd: fix build again
> 
> At 20:10 +0000 on 03 Jul (1593807001), Wei Liu wrote:
> > Restore Tim's patch. The one that was committed was recreated by me
> > because git didn't accept my saved copy. I made some mistakes while
> > recreating that patch and here we are.
> >
> > Fixes: 3471cafbdda3 ("kdd: stop using [0] arrays to access packet contents")
> > Reported-by: Michael Young <m.a.young@durham.ac.uk>
> > Signed-off-by: Wei Liu <wl@xen.org>
> 
> Reviewed-by: Tim Deegan <tim@xen.org>
> 
> Thanks!
> 
> Tim.

Release-acked-by: Paul Durrant <paul@xen.org>


