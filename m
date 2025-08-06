Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1BAB1C48B
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 12:53:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071614.1435041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujbld-0006Xi-3j; Wed, 06 Aug 2025 10:53:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071614.1435041; Wed, 06 Aug 2025 10:53:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujbld-0006WJ-13; Wed, 06 Aug 2025 10:53:09 +0000
Received: by outflank-mailman (input) for mailman id 1071614;
 Wed, 06 Aug 2025 10:53:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kasG=2S=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ujbla-0006WD-RF
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 10:53:06 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 884ab04d-72b3-11f0-a322-13f23c93f187;
 Wed, 06 Aug 2025 12:53:06 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-459eb4ae596so1905085e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Aug 2025 03:53:06 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b79c453333sm23425921f8f.45.2025.08.06.03.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 03:53:05 -0700 (PDT)
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
X-Inumbo-ID: 884ab04d-72b3-11f0-a322-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754477585; x=1755082385; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WCiHEodaH1oyXLbRzUSiYpww7CaOdEbPmMDwKVmpVC4=;
        b=wWtmM7bWseCjVHYJhC5KdoGOVb/BZEpOxkPPRLxHyFzKXMjTOkyGNa+DLGuZ43NDqI
         jkrdwwgygfqUkl5YlB+dnds0k7PdsVxf4TiKinf6e8zGvR+G0BOyIe2wOZFrpn7lEd7+
         9G5Zf3yg7ykCT15fXnU/275Y4ey7g1wA+rZXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754477585; x=1755082385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WCiHEodaH1oyXLbRzUSiYpww7CaOdEbPmMDwKVmpVC4=;
        b=GzNjmXgUagGKg5L7PgNYTUS6O59RCwXB5tGlwe3dj0JGQ6Ichf+bz7zYN9mhJkcbS0
         4b36cON/yoCAe3VE5cXfvWrb7/FnTYHbgQ7/Jm5aEh5HXPC/LcBFe60awQnHyxGnfFSH
         1LWghHvo76Z/n2ivq0d29rwIqY+2GDEWksytD5BOW7yVE4kRStCqYIuuQ+vmB6zO+WGv
         9KQr/EIfq/OKAyDD6kiH8uoossFRGf4N7mhKc6JcuaMSDyBH2W5u62BBxr4IUVHjxefa
         V1ivOLPSeGa1+OchQM6tKg+2RUj4MPbl7ZWdjDFA4PkGuUf3wwrkqunV+ejxfcmKc9aJ
         +0NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsU/zjmJX5XNMg8jpMeZf4L5xbIvbLb8M7S4Wxtois2mevTcuAozRDnngXx/tKHaAe9cvQbXfwdqc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywkf5iHSdQo33ncaen2B4FZEBdd0k7TxCq3nnjJ9bRYooAhwhha
	MPUqoATBAX9VAHsLoG5njToXAYVD32FgINlS4ZrHs37tA5eE5s7m7LGxseT+oOPA2cU=
X-Gm-Gg: ASbGnctQ3U86G+yHVrtKYlCeQZu0v+xA0xgeGadK6DEAyxa/NRg+cOb95xb6HHEmtRd
	w15P3veXVuFUL+0eFNdYLXjVxfq238FEpaiPXrF6jdtx3+pLKAvm9HqZtsFkaegtEBSkhL6BFGo
	w/2vLw2smMw0UP/KnMjQA/QscRxxI4wRAb4SX1QPZ6ZhE5BurupdQzJSJ7KY+TIPc26nd4jBJH2
	+mFgpv55vvKpYRCITNFRqSZpQCeqKrUWoYBPLGhzKSAFncki8eygh44LKe4LewlH7t+pWlgcM6w
	DwbrfljCzSgGX+b0nFpZoj0fmI6L8gYaZWua4bhstxbI9C298xzWZfpN5VPx/PLDlkeqG24BReW
	nLxd35sC6UGTH+L2XmrYhV++eZp74Vj2+6wwZ5nq+/1ZVbHdzhrn8uDgNBf27s1QeDg==
X-Google-Smtp-Source: AGHT+IHr5dX5EoJ2leoPkajolYtICUIWEdDkmtCMXF0dY9GIHmNuN8DuNX0XwkzR2WlfWhDFICj6rA==
X-Received: by 2002:a05:600c:5490:b0:458:add2:d4b4 with SMTP id 5b1f17b1804b1-459e741bd55mr20871365e9.12.1754477585446;
        Wed, 06 Aug 2025 03:53:05 -0700 (PDT)
Date: Wed, 6 Aug 2025 12:53:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: dmkhn@proton.me, andrew.cooper3@citrix.com, anthony.perard@vates.tech,
	julien@xen.org, michal.orzel@amd.com, sstabellini@kernel.org,
	dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] ns16550: ensure polling timer is disarmed
Message-ID: <aJM0EFYKVSQOoB4_@macbook.local>
References: <20250730031249.1613142-1-dmukhin@ford.com>
 <5a4dc92b-139d-4fa5-9baf-2ebc41bba758@suse.com>
 <aIplBkq7BL52Fn/Q@kraken>
 <78128ec6-b79f-4d4c-a298-72315b190036@suse.com>
 <aIvjJP6bpJpsQRtQ@kraken>
 <cc3812ca-b929-416c-af75-78c3c3b0d664@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cc3812ca-b929-416c-af75-78c3c3b0d664@suse.com>

On Fri, Aug 01, 2025 at 09:34:42AM +0200, Jan Beulich wrote:
> On 31.07.2025 23:42, dmkhn@proton.me wrote:
> > On Thu, Jul 31, 2025 at 08:54:10AM +0200, Jan Beulich wrote:
> >> On 30.07.2025 20:31, dmkhn@proton.me wrote:
> >>> On Wed, Jul 30, 2025 at 10:12:54AM +0200, Jan Beulich wrote:
> >>>> On 30.07.2025 05:13, dmkhn@proton.me wrote:
> >>>>> From: Denis Mukhin <dmukhin@ford.com>
> >>>>>
> >>>>> As it stands, polling timer is kept in the list of timers even after the
> >>>>> interrupts have been enabled / polling disabled on ns16550-compatible UART.
> >>>>>
> >>>>> Ensure polling timer is removed from the timer list once UART interrupts are
> >>>>> enabled.
> >>>>>
> >>>>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> >>>>
> >>>> Wasn't it Andrew(?) who suggested something along these lines? That would
> >>>> want reflecting by a tag then.
> >>>
> >>> Yes, indeed.
> >>>
> >>>>
> >>>> Also, what's the real problem you want to solve here? The timer function
> >>>> would be run one more time after ->intr_works is set, and then the timer
> >>>> will be permanently inactive (up to a possible S3 resume). Is it being on
> >>>> an inactive list an actual problem? (IOW I'd like to understand if the
> >>>> change is merely cosmetic, or if there is some actual benefit.)
> >>>
> >>> My understanding is running polling timer one more time after the interrupts
> >>> are enabled is the issue: if there's a pending timer when it is known the
> >>> timer not needed, then the timer should be canceled.
> >>
> >> And the effort of canceling outweighs the one extra running of the timer?
> > 
> > I think so, because intr_works will not flip at run-time once set.
> > If so, no need to keep the timer ready to be rearmed.
> 
> Well, to me it looks like a code size increase with extremely limited benefit.
> Hence while likely I wouldn't outright NAK such a change, I also wouldn't ACK
> it.

Hm, indeed the net win of this is dubious, as the extra polling
interrupt would only happen once.  Using stop_timer() would be less
heavyweight than kill_timer().

Overall I think it needs justification in the commit message, as the
timer cannot be removed from the list of timers, otherwise it's usage
on resume from suspension will trigger an ASSERT, so part of the
commit message is stale.

Thanks, Roger.

