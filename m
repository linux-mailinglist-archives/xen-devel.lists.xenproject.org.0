Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D80E3B05855
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 13:04:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044014.1414076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubdSK-0001dp-HN; Tue, 15 Jul 2025 11:04:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044014.1414076; Tue, 15 Jul 2025 11:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubdSK-0001c6-El; Tue, 15 Jul 2025 11:04:16 +0000
Received: by outflank-mailman (input) for mailman id 1044014;
 Tue, 15 Jul 2025 11:04:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1tvk=Z4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ubdSJ-0001c0-8P
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 11:04:15 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70d98dcf-616b-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 13:04:13 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4561607166aso17044455e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 04:04:13 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b5e8e0d4b5sm15064572f8f.53.2025.07.15.04.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 04:04:10 -0700 (PDT)
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
X-Inumbo-ID: 70d98dcf-616b-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752577453; x=1753182253; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=avXg2zaS3YeGptWFg9IjB4+sZBIGLgJN8rwJNY9dFcs=;
        b=K5OH/pSbZ01okgmQjrDT0ChHZOpP/axHIaerl/K01oj+q0xUKVHc2WzB3X4OWed2iC
         dVYQj1k2lKUjUP1Q/CPJ3MFmOAed1IeMeL+N9RmG/N7rm+ZnEC+31USi3VzF07wQlhzC
         4ATFIHZ1ClJ9e4Sb8m4o6wmQrf4BIzbnROGkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752577453; x=1753182253;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=avXg2zaS3YeGptWFg9IjB4+sZBIGLgJN8rwJNY9dFcs=;
        b=VuGjle01k9IAG+JRHaDe8DDpNiKEvpfYIlG17jRo5HQRDqaiKcBpmeqUqqHyNWM+Qy
         VfmUoPdolERv12OWPA4VVIiWLfLvMCFjVMx8g4xIU7UkVXIpnGvsChvVG6YlQ2wAV3YO
         Zy3iSjkJll59+FciSg6Dnr6mLFeHS0/JAxM5jNonuAAIbjrp2vALMP0xaEHqw2Cva2JL
         yidjVdLH57r9Haolc3Xl9jCrvUg/FZ5Tg0WMNGZ5g8S+T/RdB82wLbBTS3vXmPMaarMP
         7wERuYDWFzTNtJkRaqwVwVGsd7KtKSXrF33K7gMB1A+AylFdWf+MMZ6IAUMjQUy9ygDX
         ZJeQ==
X-Gm-Message-State: AOJu0Yyj17/PPsEA1Ygwkr54OTgfyDZnIiIXHyno+7yR9DQNyIWw+tUj
	bmP0Hnb2VSfHD3zJ24qdeDa32IE99anyXujJWBWA38m1yUi4iwDdDiA2ReTZX3UbbXXY/Q4dgqS
	3EGMb
X-Gm-Gg: ASbGncuaVTa3mJ+ehNqZ+rC8mYWWiVsywkxaJm64IgqXMA4M2yAZ36OwzAsc9N8F3AT
	bE9up0DhBEElPeu8EtYiYFNXbupr7xEdsNzzj0j3wid4qV6NYuHbmHDHOYmUGcqz9uE5MRjy4mu
	cm9q5NNAtPe2TlfV7yL9iTu2dZe9vNJ1rAwQn4A7w/B3MRKx6KwGxkfb50F6yKSuYFBQSqXmZQ6
	kqRMzs/M6EcrbmCORmznZlmxkJIPotIXNpdnkiowDEuPARRkUz0Dp4lhjK03SzGdgMqbH9hLPKb
	0lyeKK6JH7f/41TkVepIyE7dd62RP2cuXTJOL9g+F35ESgzqjAtOrn4tx+Cc9NyEf3OVZqXRnoI
	rWO1xRMGRVJVWUq5+tcR4Kwrbrm1SxSFbYOWeRcEN8yf6hjg//32ob6U5jz/UyOLdwA==
X-Google-Smtp-Source: AGHT+IG1O0scUcDbaXV026rKibqYVxEU1st9QhSbpJpkzkt3kNJZ2moQeO5XMfE09iQAL6VWKw+Yag==
X-Received: by 2002:a5d:5f8f:0:b0:3b3:9c75:bb0e with SMTP id ffacd0b85a97d-3b5f351e6c9mr13546936f8f.11.1752577451146;
        Tue, 15 Jul 2025 04:04:11 -0700 (PDT)
Date: Tue, 15 Jul 2025 13:04:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/PVH: modify permission checking in
 hwdom_fixup_p2m()
Message-ID: <aHY1qZJXkKXi4bt5@macbook.local>
References: <8c610e0e-6778-4d94-92c8-35b280d05b46@suse.com>
 <aHYo4kLRj9LpdaTs@macbook.local>
 <01fb45a5-0e5a-4379-8d36-ec8002739b51@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <01fb45a5-0e5a-4379-8d36-ec8002739b51@suse.com>

On Tue, Jul 15, 2025 at 12:47:15PM +0200, Jan Beulich wrote:
> On 15.07.2025 12:09, Roger Pau Monné wrote:
> > On Mon, Jul 14, 2025 at 06:09:27PM +0200, Jan Beulich wrote:
> >> We're generally striving to minimize behavioral differences between PV
> >> and PVH Dom0. Using is_memory_hole() in the PVH case looks quite a bit
> >> weaker to me, compared to the page ownership check done in the PV case.
> >> Change checking accordingly.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> > Kind of unrelated to this specific patch, but what's our opinion on
> > turning on pf-fixup by default before the release?
> 
> As far as the patch here goes, the relationship is very tight. I came to
> make this patch only while investigating whether we couldn't have Dom0
> report the resource (MMIO) ranges early enough for us to not even need
> such fixing-up. Sadly, as per [1] that turned out pretty much impossible.
> Which means that while I'm still pretty hesitant of us doing something
> like this by default, I can't currently see a way around doing so. Hence
> perhaps yes, we may want (or even need) to turn this on by default.

Sorry, wanted to reply to your previous commit alternative approach
email, but got distracted with something else and forgot about it.

While I won't be opposed to having a way for dom0 to notify extra MMIO
regions it wants added to the p2m, I think this is likely too much
fuzz.  For example for FreeBSD I wouldn't consider adding such logic
to the kernel, simply because I think it's likely to be too intrusive,
and would rather rely on pf-fixup.  Overall the amount of p2m fixups
that Xen ends up doing is always fairly small (I usually see maybe 4
pages tops), and only as result of ACPI related accesses.  IMO it's an
acceptable compromise to map those as individual 4K pages.

I would only consider the alternative approach of using a hypercall if
we saw big regions being mapped by pf-fixup, because in that case it
would better be using p2m superpage(s).

I think we want to enable pf-fixup by default at some point, the
question is whether you would consider it appropriate to do now.
Given it's limited to PVH dom0 only, I think we should enable for this
release already.

Thanks, Roger.

