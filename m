Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E84EFAB6E49
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 16:43:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984379.1370522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFDJw-00059j-My; Wed, 14 May 2025 14:42:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984379.1370522; Wed, 14 May 2025 14:42:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFDJw-000578-Jy; Wed, 14 May 2025 14:42:56 +0000
Received: by outflank-mailman (input) for mailman id 984379;
 Wed, 14 May 2025 14:42:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Q1L=X6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uFDJv-000572-5W
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 14:42:55 +0000
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [2607:f8b0:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4c258bf-30d1-11f0-9ffb-bf95429c2676;
 Wed, 14 May 2025 16:42:49 +0200 (CEST)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-22d95f0dda4so79415085ad.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 07:42:49 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-22fc7546b48sm100735775ad.30.2025.05.14.07.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 07:42:47 -0700 (PDT)
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
X-Inumbo-ID: b4c258bf-30d1-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747233768; x=1747838568; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/WoDEQKYgW7h3xnKILE8E0cz6YzU9mr4wqOGsmFK9dQ=;
        b=o2RkTSbFu0HKFpSy0dBFHaS2Qs4fy53xLgJ2+JgSi4oNduJogqPSDw18eRww/kHfev
         lrgmZpWItigK8R4rLvgnY+9Y/24zCPr8A//MrImcLqMP6cgaewR6HuXcRxfJYNJPgSxy
         w6Hx8IC+utCBSNW/mD7lytXpkZJaWia79NePA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747233768; x=1747838568;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/WoDEQKYgW7h3xnKILE8E0cz6YzU9mr4wqOGsmFK9dQ=;
        b=Zy5wUkZVSGy+rJgKKzSkqRQc12/hovr1Ewj30igIOOhRhy+NVaBIAVu8eq9cOWDZ5v
         yACYI5ssItugu+rJcEFXcbkr9CJKLavXuPULMI7IqrANQqbSagiDibr3QeZ0e+Sh4Yyq
         3ZKKaZEWOvniYfnxl8fekp7vJhfvwIN+ZKmKsXyQd8y1+MSx8NEjWobhEDO7aPrcKNTS
         gomRDo4KB2BqAhB4GHa7YYtBnN3IXuvHnTAD0mt+iqigaoiZIjxvB6lvr5llevzgVQyy
         bttBzyS9+u0A95S4FiZNUkq4naafNmxXh5cufk4fHpCToI8japoJ8wDh+im7aZzIf8JU
         dwdQ==
X-Gm-Message-State: AOJu0YySCO0nif3TkmKTGLBreKLeBcwITvKHr5yqx1ixxerCjWDP8m5W
	7t/Y4g5907wgJaH4f+PHSmI42S5rWEiQsheDzanDgEhvOXQF7GysluTLeiJaAEY=
X-Gm-Gg: ASbGnctaX3c+fTGzSbOnLa2MjqJFQj2WhCwnV16kPYk0JHJUT3yvlQPTHYVS6Hz7iMW
	chxVCLw7HvT8kxZ+qnkMWwuiYTClw1ApSczuUtk6o8uxmS4MFGd961BukdnxV5K+w19Bkt7njrt
	l21Ii4yl41O6DUEAIIcXlzC7CpH1GCVhS41rLf4tCOuxsf43AoraBALjoa9kJ+f8rtmZWGtJ1OH
	aEkIVKpolD5a+gQOXZII2siNs6o8N7dsMv6eXvnjJVzMZfhtqnW3YNd8p2jPpnwBXoWMu/yJNZY
	pSguCGqjcjHUiRX6zU58XUECAWBxT/pD8H0hHIRB4DOko1eDFDx2+n5nTwErHA==
X-Google-Smtp-Source: AGHT+IFeSGKNji/QSEGK222NxtXC17g2vNM1VYsYMqhmLemPHZXCWUfdXaCaq2VS8Ifq45kgO7LaSg==
X-Received: by 2002:a17:902:ecc1:b0:220:faa2:c911 with SMTP id d9443c01a7336-231980cf801mr54281865ad.14.1747233767929;
        Wed, 14 May 2025 07:42:47 -0700 (PDT)
Date: Wed, 14 May 2025 16:42:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/6] x86/HVM: restrict guest-induced WBINVD to cache
 writeback
Message-ID: <aCSr4rfRBj_Yajed@macbook.lan>
References: <c030bfde-c5bb-f205-edff-435278a435f4@suse.com>
 <d55070c0-04c5-70a4-f9f3-3227d42578e6@suse.com>
 <aCNMEadsYoIKLbSp@macbook.lan>
 <80ab4cdf-dbbb-4daa-831e-c6d92f5dcf13@suse.com>
 <aCR-xQlo9LQfeLmb@macbook.lan>
 <66603689-429b-4bf6-8792-e4feae346a13@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <66603689-429b-4bf6-8792-e4feae346a13@suse.com>

On Wed, May 14, 2025 at 02:46:32PM +0200, Jan Beulich wrote:
> On 14.05.2025 13:30, Roger Pau Monné wrote:
> > On Tue, May 13, 2025 at 03:54:56PM +0200, Jan Beulich wrote:
> >> On 13.05.2025 15:41, Roger Pau Monné wrote:
> >>> It's my understanding that the same is possible on native, as the CPU
> >>> might speculatively pull lines into the cache.  So there's no reason
> >>> for an OS to use wbinvd if wbnoinvd is available?
> >>
> >> Speculatively pulling data into the cache is possible only when page
> >> table entries permit caching. Hence after changing all mappings of a
> >> certain page to UC, an OS may have a need to ensure that no data of
> >> this page is left in any cache (and it can't be pulled back in
> >> speculatively then).
> > 
> > Is this realistic taking into account the OS is running virtualized?
> > 
> > At least with Xen there's the direct map, so once context is switched
> > back to Xen (for example to execute the wbinvd itself) there's no
> > guarantee the CPU won't speculatively populate the cache with entries
> > from the direct map.
> 
> Well, we've been knowing for a long time that we're not doing things fully
> correctly there. Once a guest has changed all mappings of a page it owns,
> we ought to make the direct map one follow suit (or simply unmap it from
> there).

Keeping track of guests mappings seems extremely complicated - maybe
doable for PV, but not for HVM with HAP I would think?

Also we would need to do something similar if guest enables CR0.CD and
switch all the direct map entries to uncached?

Address Space Isolation (and the removal of the direct map) might
solve part of this, but still I don't think we can fully guarantee Xen
won't have any mapping of guest pages with a different set of cache
attributes.

Thanks, Roger.

