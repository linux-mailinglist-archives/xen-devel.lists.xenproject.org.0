Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D151B72D4
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 13:13:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRwFo-0003hM-Qh; Fri, 24 Apr 2020 11:12:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IwUP=6I=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jRwFo-0003hH-7E
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 11:12:20 +0000
X-Inumbo-ID: 7644fde0-861c-11ea-b58d-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7644fde0-861c-11ea-b58d-bc764e2007e4;
 Fri, 24 Apr 2020 11:12:19 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id x18so10298473wrq.2
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2020 04:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=23+YHagCHbRrZ7doxhQOa8LERS8C5Pq3jCURQTjKpBI=;
 b=K5o09HGNi1Ou2P7Rt7wioqprLHmaemnb4jhtJCqLBu9p7DEP2o7Ggjev6f8BFAa+RP
 HUVGqTlaznAf8puRoqdPvbUE2647aajnwTRl0GA/FBBj5AzpwB0E8fqiTzVaKipKjwg7
 WOmnh25NUKYJlbuHUh3GTElQFyU5BHtTcRfL9UfzcW6SmqSBuycWHFTKAHk1PFQO44Zr
 rp0sgj+rIXEzPFvRdDs8o5f2nRbaqLqPfxS8n2SFj1xMtwrWmAk0ITRCSDvtkFNyo7rd
 V0w0h1M9LnpzdgAc62TBS9+FMUbopEKwXtq/zaKLM1VDbOt88LcY6GrTAKpTfXx9jBTX
 thpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=23+YHagCHbRrZ7doxhQOa8LERS8C5Pq3jCURQTjKpBI=;
 b=Lp8QjWvVH4dUL1aRwdymBlZVOBifKQ67dz8TzVykY0jkd9ICQvVj2ErGDdNFO5AYjQ
 2xnNem4xzrX1h8PYFNvuG9svROLQ5mKoNCjPjWAvhiOyi5a/xCSHeKHRawXX8ipPu+cO
 1ESy1yxixbxXsz9Ntb5AL/bVnE03ACtvbuBngY/Tb/MqCYCx4zx6S1dCxUGzejC0fAD7
 z8bpBLl3DIpxIsJAuuXELHmUtDuG5YIaJn4OI/U7dpyXN6z1gfAsvZLZpEPEOvebSH3Y
 5dwRr+gwpjiVWFFwVKiPGTBsIfd3L1Rbetb6HfZIoHEh8lMN/b8QKbDxKhqzpP63Qfw+
 jlrQ==
X-Gm-Message-State: AGi0PuZ5lNPoPZ6E6DgFfHHymQPrmRQ3gDyH0EwfD4IfCGpf7142odHi
 QAnzWDgKmEeKTOuZ039Ekp8=
X-Google-Smtp-Source: APiQypJ/e4MvRrO7/iKBAqP4kab7Qf7NdqnBG2JMz6J3JLHcOrOWwhcvAtYoApvFjMnp6n5pjRhzqw==
X-Received: by 2002:a5d:670d:: with SMTP id o13mr11296887wru.29.1587726738603; 
 Fri, 24 Apr 2020 04:12:18 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id s14sm2284047wmh.18.2020.04.24.04.12.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Apr 2020 04:12:18 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>, "'Jan Beulich'" <jbeulich@suse.com>,
 <xen-devel@lists.xenproject.org>
References: <25c5b76f-4f95-3ba9-0ae0-dd0c1f3f8496@suse.com>
 <002801d61302$dbd21950$93764bf0$@xen.org>
 <410df70e-6e21-2d0a-8148-62ccf2a24366@xen.org>
 <004301d61724$9a5c9ab0$cf15d010$@xen.org>
 <660fa82f-7316-a0ec-baef-dee18f0a57ea@xen.org>
In-Reply-To: <660fa82f-7316-a0ec-baef-dee18f0a57ea@xen.org>
Subject: RE: [PATCH 0/3] xenoprof: XSA-313 follow-up
Date: Fri, 24 Apr 2020 12:12:16 +0100
Message-ID: <000201d61a29$37644db0$a62ce910$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKUpBz832WsrmfTrWwwQFYKS8h7/QHBHudWATlYg7wCo38NvwIHqNBwps3cKDA=
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
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Sent: 24 April 2020 11:35
> To: paul@xen.org; 'Jan Beulich' <jbeulich@suse.com>; xen-devel@lists.xenproject.org
> Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>; 'George Dunlap' <george.dunlap@citrix.com>; 'Ian
> Jackson' <ian.jackson@eu.citrix.com>; 'Stefano Stabellini' <sstabellini@kernel.org>; 'Wei Liu'
> <wl@xen.org>
> Subject: Re: [PATCH 0/3] xenoprof: XSA-313 follow-up
> 
> Hi Paul,
> 
> On 20/04/2020 16:01, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: Julien Grall <julien@xen.org>
> >> Sent: 20 April 2020 15:15
> >> To: paul@xen.org; 'Jan Beulich' <jbeulich@suse.com>; xen-devel@lists.xenproject.org
> >> Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>; 'George Dunlap' <george.dunlap@citrix.com>; 'Ian
> >> Jackson' <ian.jackson@eu.citrix.com>; 'Stefano Stabellini' <sstabellini@kernel.org>; 'Wei Liu'
> >> <wl@xen.org>
> >> Subject: Re: [PATCH 0/3] xenoprof: XSA-313 follow-up
> >>
> >> Hi Paul,
> >>
> >> On 15/04/2020 09:50, Paul Durrant wrote:
> >>>> -----Original Message-----
> >>>> From: Jan Beulich <jbeulich@suse.com>
> >>>> Sent: 15 April 2020 09:45
> >>>> To: xen-devel@lists.xenproject.org
> >>>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>; Ian
> >> Jackson
> >>>> <ian.jackson@eu.citrix.com>; Julien Grall <julien@xen.org>; Stefano Stabellini
> >>>> <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; Paul Durrant <paul@xen.org>
> >>>> Subject: [PATCH 0/3] xenoprof: XSA-313 follow-up
> >>>>
> >>>> Patch 1 was considered to become part of the XSA, but it was then
> >>>> decided against. The other two are a little bit of cleanup, albeit
> >>>> there's certainly far more room for tidying. Yet then again Paul,
> >>>> in his mail from Mar 13, was asking whether we shouldn't drop
> >>>> xenoprof altogether, at which point cleaning up the code would be
> >>>> wasted effort.
> >>>>
> >>>
> >>> That's still my opinion. This is a large chunk of (only passively maintained) code which I think
> is
> >> of very limited value (since it relates to an old tool, and it only works for PV domains).
> >>
> >> While there are no active user we are aware of, this is an example on
> >> how to implement a profiler backend with Xen. So I would agree with
> >> Andrew here.
> >>
> >> IIRC, the reason behind your request is it makes difficult for your
> >> xenheap work. Am I correct? If so, do you have a thread explaining the
> >> issues?
> >
> > After shared info and grant table, it is the only other occurrence of a xenheap page shared with a
> non-system domain. Also, it cannot be trivially replaced with an 'extra' domheap page because its
> assignment changes. Thus a whole bunch of cleanup work that I was hoping to do (largely in
> domain_relinquish_resources and free_domheap_pages) is either ruled out, or would have to special-case
> this type of page.
> 
> My knowledge of xenoprof is very limited, so I might be wrong.
> 
>  From my understanding, a buffer can only be shared between two domains:
>     - When in passive mode, the buffer will be shared with the primary
> profiler (always the hwdom per the check in xenoprof_op_init()).
>     - When in active mode, the buffer will be shared with the domain
> requesting to be profiled.
> 
> Would it be possible to consider to have a separate buffer for the
> passive mode and active mode?

I think that may well work, yes.

> 
> > Also, I am unconvinced that PV guests are sufficiently common these days (apart from dom0) that
> profiling them is of any real use.
> 
> Even an HVM guest can't profile itself, I think it would be useful to
> have dom0 to profile an HVM guest. Are you suggesting this doesn't work?
> 

No. That may work for a PV dom0; I'll have to try it. So, yes, passive profiling may indeed still have value.

  Paul


