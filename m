Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D64599C049E
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 12:48:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831719.1247074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t90zh-00034g-1o; Thu, 07 Nov 2024 11:48:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831719.1247074; Thu, 07 Nov 2024 11:48:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t90zg-00033C-Tq; Thu, 07 Nov 2024 11:48:08 +0000
Received: by outflank-mailman (input) for mailman id 831719;
 Thu, 07 Nov 2024 11:48:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GEtt=SC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t90zf-000336-Qp
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 11:48:07 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2602dae3-9cfe-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 12:48:04 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5ceb03aadb1so995335a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 03:48:04 -0800 (PST)
Received: from localhost ([213.195.124.162]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0dee4a2sm82210966b.136.2024.11.07.03.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 03:48:03 -0800 (PST)
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
X-Inumbo-ID: 2602dae3-9cfe-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmUiLCJoZWxvIjoibWFpbC1lZDEteDUyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjI2MDJkYWUzLTljZmUtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTgwMDg0LjY2MjkyNSwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730980084; x=1731584884; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kl9tQ+SDV1nln+FQEStM8ScmNXBv0OdZKzB2RZsc5sc=;
        b=JUmfRzbNz/VvTvhvtppk13h4VYUl9FkQO7pCXrZ3JjFW0gA0ykCYhcIdGxpCFPo6Ep
         w319tF5u5YIkIVAHTWXydfpPle+L0G8LFXcMR4z+6FyaVzUHSTgrpl7oz0BpYw9SFN3r
         eW6xisx7t9haF7tJIdE3qkWwLBSSxVzamdid4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730980084; x=1731584884;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kl9tQ+SDV1nln+FQEStM8ScmNXBv0OdZKzB2RZsc5sc=;
        b=BYGPrRuBL/zmAAa1DHaQBp51EjWvrmdPbHsvZLkk15y+4oSVw6APBWdSPQ4O/ONbpS
         YSN2TY1vhGWv/MULIFp4h3fznunl3f/Lvj7HNY4H+eGD1dZ4wRSx0cRdQgfaIyihN+Qd
         8wljiQgtzkQkiD/ZHRhnKzqhMOCLgu0BIIbRsmul2IS9G/GcngAUPVm3QeBexmXl1+C3
         S0ufeB1YPuaCbnr3NaNDitJUds3WzbO5oscM703hRM2VEA6eJZQ0MMNW5blhTPqVFuG2
         KjbO8AMk6CtkU3T5Z9OkLBGg0vqJSjAfshohYgVAqghZX53han2TsPm1fI7YekL17tRI
         z8tQ==
X-Forwarded-Encrypted: i=1; AJvYcCVM66Kn0zWSTuYz/WR5CGEkHx+bAvkQdmWLURPt5TS12qSI6uD9kdemzzw4mXXc7ayqfBFg10TjX1I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzA5bvKCIw9BtmswOsEkf/3CljL6zxJvRBAoUPHgMuzVgxdlrg4
	Xgm2MoCel/2xDWsPIpF8OyeRSIuGAJ6PToGS5RGXQfTDeoXGX6DAJsmSqOx2s6w=
X-Google-Smtp-Source: AGHT+IFOBGOaJuacUpExW+7aimactDysYerGU8GETwLV1d0PE2YrdHHl9Ulc9/AKAZ8aulPCXuDVPA==
X-Received: by 2002:a17:906:478b:b0:a9a:66a9:2c55 with SMTP id a640c23a62f3a-a9ee7479e0emr58887966b.6.1730980083976;
        Thu, 07 Nov 2024 03:48:03 -0800 (PST)
Date: Thu, 7 Nov 2024 12:48:02 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 0/4] x86/mm: miscellaneous fixes
Message-ID: <Zyyo8qMobqQT-rA5@macbook>
References: <20241106122927.26461-1-roger.pau@citrix.com>
 <9472eba9-c016-40c0-8cc3-8297d7db04d3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9472eba9-c016-40c0-8cc3-8297d7db04d3@suse.com>

On Thu, Nov 07, 2024 at 12:28:11PM +0100, Jan Beulich wrote:
> On 06.11.2024 13:29, Roger Pau Monne wrote:
> > The attempt to fix destroy_xen_mappings() so that L2 tables are
> > consistently freed uncovered some errors in the memory management code.
> > The following series attempts to fix them.
> > 
> > All patches except for 4/4 are new in v2, and 4/4 has no change from v1,
> > hence kept Jan's Reviewed-by tag in 4/4.
> 
> Just to mention it: When a patch was buggy, and perhaps even more so when
> it actually needed reverting, I think all R-b (and likely even all A-b)
> should be dropped. Clearly the reviewer, too, missed an important point.

My consideration for keeping you RB was that the patch wasn't buggy
itself, but the bug fixed by the patch uncovered bugs in other areas
of the code.

Hence it's my understanding the patch was and still is correct, but
given the timeframe in which the breackage was discovered (the evening
before a public holiday leading to a weekend) I feel it was safer to
revert than to either rush a fix or lave the tree broken until next
Monday.

> That said, the tag is fine to keep in this specific case; I would merely
> have re-instated it after looking through the prereq changes.
> 
> > Roger Pau Monne (4):
> >   x86/mm: introduce helpers to detect super page alignment
> >   x86/mm: special case super page alignment detection for INVALID_MFN
> >   x86/setup: remove bootstrap_map_addr() usage of destroy_xen_mappings()
> 
> Btw - it looks like patch 3 (with the possibly adjusted description) is
> independent of patch 1 and 2. If you can confirm that and if we can agree
> on replacement wording for its description, it could go in before you
> send out a v3.

No, I'm afraid it can't go in ahead of 1 and 2, as with the current
logic in map_pages_to_xen() using it in bootstrap_map_addr() will lead
to allocation requests, and thus hitting a BUG_ON().  Calling
map_pages_to_xen() with INVALID_MFN currently causes super-page
shattering if present.

Thanks, Roger.

