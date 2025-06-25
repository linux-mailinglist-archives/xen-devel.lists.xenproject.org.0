Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D744BAE8BB3
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 19:45:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1025432.1401028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUUBT-0002sb-Tj; Wed, 25 Jun 2025 17:45:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1025432.1401028; Wed, 25 Jun 2025 17:45:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUUBT-0002rC-Qe; Wed, 25 Jun 2025 17:45:19 +0000
Received: by outflank-mailman (input) for mailman id 1025432;
 Wed, 25 Jun 2025 17:45:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+7fe=ZI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uUUBT-0002nO-9B
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 17:45:19 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2467fcad-51ec-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 19:45:11 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4530921461aso728355e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 10:45:11 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45382349548sm26265485e9.10.2025.06.25.10.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 10:45:10 -0700 (PDT)
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
X-Inumbo-ID: 2467fcad-51ec-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750873511; x=1751478311; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9HuvtyMrzxiIvDmIcbYJGjbJbaFae+Zfd5+5FgSgtCs=;
        b=Se7CqhPfLp3X72JHx7kVDIhvtHd+x3ybaN+zhrAIGdHmp/i9JcXhO+c7V/SSE4p+py
         lnKUh/zY4z4HOro1ynFboRx4OaaWswGSzPrdSehCkyUCGjvE3mC2Owq94peeG4AGA4IN
         9McrDHuH2M0Fek6Y5fOrqrIWIDVwIvrRnNw/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750873511; x=1751478311;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9HuvtyMrzxiIvDmIcbYJGjbJbaFae+Zfd5+5FgSgtCs=;
        b=ZlF//sA5P/1DVZV01T/JpFIFoWESHlPQ3ohZQBjWyQZLJjQhgnVy5/xt3I32oUtfl3
         7Gtqo9+HN0Ps5LxB7Wv1WHxot91ngoqoeww794Yk6RPvvd+y+yYbIokzxXtEtXGpdD09
         MBKqpWkkKMEoQUsH/qXIKvY1+aoUcYYtFKznemqZS6WkQOg9UwHtGKKuU95NCL2YLInt
         dLqqa9t+P2ad0VnBAtXQ2lagoSFl+oRfN7RUyoLIpXFq7x58I1IBUslPKU6cip6ntjjL
         FrtXSoLOVpH9nu0W4yKElUyOv8AfuDbD0KDC386kzx4YHu/VLz5mY2YPmgWEAyZa0CWO
         UKjw==
X-Forwarded-Encrypted: i=1; AJvYcCWmTVVskPMJXx3OXvaFYoR7FRzIJBkl8YNim+zFA9OvgpRGUoRAT+ECi6M8c8b1jWbrD313sERmhaY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxE4i5Xp7xNcw5K4q1mhPhKRbG1DCKOmeAiDPMBLqWDvblIqK8S
	yONb2Qe05zXdiLUqOaSrdy18Xwv5bZz8P0FMGsgku1ZZEZhOG5vyPIwy0qpDt3JTINU=
X-Gm-Gg: ASbGncvCYizAaA3UkbgdPnmQM9Bpz7uRFQoC+tp9SzqtzfEcJ/8SZ54m9MIn5R6r3YI
	3TvjXdvW28ihKu8tw0mRvsHJ2DoIY9D3VFcxRMT9Kf6WF7KxWA7IqGt3Z1ui+UV2JUCbV+9Z6sK
	B6+LHNylruUIjNXkdM4tGxwLIFa2k17RzGL60i1K1RHFk4yYi0gXjG5k2zq4a/1eRyzS6Rcz4Jw
	Ld93WRVHqtuHRddPbYJZQkeqClBPpP5D9eC0AHhbxvDKxJTHDinawfSfzC4WANr+fFgpDSqHd73
	BcCzhhGe1bCk1rjmeyoEu2PTsAdiNyDUX8SxzTumzgDy58oRQi/gHbr/NObLupXwQYEVSW91eM/
	sPAK0M0Pm6jUuaBXJLeMj3t9ltv9RSw==
X-Google-Smtp-Source: AGHT+IH/z+9PRdFLv6Qd4p8Wctzhgxso1VXIficXEtNWFMItPL8wsUqv4AlYmkqQra3mH6NkBOD3GA==
X-Received: by 2002:a05:600c:8b58:b0:441:d43d:4f68 with SMTP id 5b1f17b1804b1-4538870ce27mr8065835e9.15.1750873510856;
        Wed, 25 Jun 2025 10:45:10 -0700 (PDT)
Date: Wed, 25 Jun 2025 19:45:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@cloud.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 4/8] pdx: introduce command line compression toggle
Message-ID: <aFw1pY-4Yv2MtBp6@macbook.local>
References: <20250620111130.29057-1-roger.pau@citrix.com>
 <20250620111130.29057-5-roger.pau@citrix.com>
 <b7e9bca9-5fd6-479c-91eb-202f85efa44e@suse.com>
 <aFwZ3dSo1MHMf-Em@macbook.local>
 <23206592-6016-47cc-87a6-151c76f254d6@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23206592-6016-47cc-87a6-151c76f254d6@suse.com>

On Wed, Jun 25, 2025 at 06:00:48PM +0200, Jan Beulich wrote:
> On 25.06.2025 17:46, Roger Pau Monné wrote:
> > On Tue, Jun 24, 2025 at 03:40:16PM +0200, Jan Beulich wrote:
> >> On 20.06.2025 13:11, Roger Pau Monne wrote:
> >>> Introduce a command line option to allow disabling PDX compression.  The
> >>> disabling is done by turning pfn_pdx_add_region() into a no-op, so when
> >>> attempting to initialize the selected compression algorithm the array of
> >>> ranges to compress is empty.
> >>
> >> While neat, this also feels fragile. It's not obvious that for any
> >> algorithm pfn_pdx_compression_setup() would leave compression disabled
> >> when there are zero ranges. In principle, if it was written differently
> >> for mask compression, there being no ranges could result in compression
> >> simply squeezing out all of the address bits. Yet as long as we think
> >> we're going to keep this in mind ...
> > 
> > It seemed to me that nr_rages == 0 (so no ranges reported) should
> > result in no compression, for example on x86 this means there's no
> > SRAT.
> 
> Just to mention it: While in the pfn_pdx_compression_setup() flavor in
> patch 3 there's no explicit check (hence the logic is assumed to be
> coping with that situation),

If you prefer I can leave the pfn_pdx_compression_setup() as-is in
patch 3, as AFAICT that implementation does cope with nr_ranges == 0,
that would result in a mask with just the low bits set, and hence
hole_shift will be 0.

> the one introduced in the last patch does
> have such an explicit check. Apparently there the logic doesn't cleanly
> cover that case all by itself.

No, I don't think the logic in patch 8 will cope nicely with nr_ranges
== 0, it seems to me at least the flsl() against a 0 pdx size mask
would result in an invalid pdx_index_shift given the current logic.

IMO it's best to short-circuit the nr_ranges == 0 case early in the
function, as that avoids complexity.

Thanks, Roger.

