Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD816A305F5
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 09:39:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885133.1294911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thlme-00049T-6b; Tue, 11 Feb 2025 08:38:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885133.1294911; Tue, 11 Feb 2025 08:38:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thlme-000481-3P; Tue, 11 Feb 2025 08:38:20 +0000
Received: by outflank-mailman (input) for mailman id 885133;
 Tue, 11 Feb 2025 08:38:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jP5V=VC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1thlmc-00047t-Mq
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 08:38:18 +0000
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [2607:f8b0:4864:20::102a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8759589d-e853-11ef-b3ef-695165c68f79;
 Tue, 11 Feb 2025 09:38:13 +0100 (CET)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2fa1d9fb990so8312463a91.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 00:38:13 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fa09c19a3csm9989660a91.47.2025.02.11.00.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 00:38:11 -0800 (PST)
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
X-Inumbo-ID: 8759589d-e853-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739263091; x=1739867891; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=msVESuDHG1ZpM2IJbITotM4OwVMr1Jw9KRFXgp4Gqnw=;
        b=DtLBswzyC5L6vGnMt0LVSDMy3Oo+5HxAltBXJH8cZm50esHo/BEj6LztOOBdvzKNyv
         ZHrOmuaXT38wTY00zuN23kC1QZXxb/gf11XHIjJOdxYedvY+LjZatd6DaS956R5TeJA1
         UBW+rO83ppgW1qB8W7amYYuOyhbYwNbJ5lUCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739263091; x=1739867891;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=msVESuDHG1ZpM2IJbITotM4OwVMr1Jw9KRFXgp4Gqnw=;
        b=CWZwiIOju0ld/NQyeaBiZU/U7PUfWCsRvib1guWJg+DRqWfj/Ft43QYtTeMy4FE1eI
         XLseBJHJr11BpLuHVh4/SlvNQhhwTLsC+mq93VxRKlCwgRHYjxUNmdcC+Lggc36GsJl0
         CEeKsAZiHL1Lw4M9XEkPL04tF3tjORHTx85XQMGEkGhh8frHZFCuvXTYa8Cy4UDnapgt
         5bJo0g4s883U8yTqTfB0m3LuaG0VzW6wQp5QBU4WT7GRU3jsdmeytCUFN6zNO0Kiseg8
         Kpx+4uH2R/dwvATNV2eoPqe7iUauH4MEa5tclW3gf1Cblot5eeScH2f+Q36MHC1AO0By
         fFzQ==
X-Gm-Message-State: AOJu0YxI4xWfuodO+xf1wTBuJQZN3RtpBEkYD011JODnK3wUcbKJfqQM
	ARaB45vZAEXdrvKmbbnYwRTO4PiDnNKALZhjELfZphF3r+zy+53obLInhMA+2FA=
X-Gm-Gg: ASbGncuYotlinghPEMrSVzc7vyz1ZeFe83FVZ0enSzjSSl5uPnQAlb0YsV/rY+mhvFI
	hErlHMScgf7Jwsk2HH8cZgTPLsUg7t+w1wThyh7DaBLxjSLltpRJT3tmld5BVndLuZUrrf57l+z
	S4FYlqamumV50xXQTabVdUZnafdWXvHskDtUOytlgFzzf0k2CmJCby4usFqR+MVp8cOhqLsjl2k
	plkAwV5t1jQlbghu1bh7LZhN1uausTGc7prLMRdQv37B/B54vKL1gpPPXS5sDViS3da8ABtxEBN
	udbUL3lKab6LbumAsk8i
X-Google-Smtp-Source: AGHT+IG8MhovgWvv4gJyj87SzsbmVvlQ+095wlIvxbnCsYGx5giPqDCC8N6clluNbPALv97NlYf4iA==
X-Received: by 2002:a17:90b:3558:b0:2f9:9ddd:689c with SMTP id 98e67ed59e1d1-2fa243f031fmr27143311a91.25.1739263091631;
        Tue, 11 Feb 2025 00:38:11 -0800 (PST)
Date: Tue, 11 Feb 2025 09:38:06 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.20? v2 0/5] xen/x86: prevent local APIC errors at
 shutdown
Message-ID: <Z6sMbvBS4yB2le7U@macbook.local>
References: <20250206150615.52052-1-roger.pau@citrix.com>
 <Z6nOmwdp8iRNmkzh@macbook.local>
 <9f6240b2-009d-46a7-af9f-4944cd9439b1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9f6240b2-009d-46a7-af9f-4944cd9439b1@gmail.com>

On Mon, Feb 10, 2025 at 07:29:35PM +0100, Oleksii Kurochko wrote:
> Hello Roger,
> 
> On 2/10/25 11:02 AM, Roger Pau Monné wrote:
> > Hello,
> > 
> > This should have had a 'for-4.20?' tag in the subject name, as
> > otherwise we will need to add an errata to the release notes to notice
> > that reboot can sometimes fail on AMD boxes.
> > 
> > Also adding Oleksii.
> > 
> > Thanks, Roger.
> > 
> > On Thu, Feb 06, 2025 at 04:06:10PM +0100, Roger Pau Monne wrote:
> > > Hello,
> > > 
> > > The following series aims to prevent local APIC errors from stalling the
> > > shtudown process.  On XenServer testing we have seen reports of AMD
> > > boxes sporadically getting stuck in a spam of:
> 
> How often this issue happen?

Hard to tell, we have certainly hit it more than once on XenRT, but
I don't have figures about its probability.  I have at least 14
reports from XenRT from the last 6 months, but there's possibly a lot
more that could have been classified as a different kind of issue.

> > > 
> > > APIC error on CPU0: 00(08), Receive accept error
> > > 
> > > Messages during shutdown, as a result of device interrupts targeting
> > > CPUs that are offline (and have the local APIC disabled).
> > > 
> > > First patch strictly solves the issue of shutdown getting stuck, further
> > > patches aim to quiesce interrupts from all devices (known by Xen) as an
> > > attempt to prevent a spurious "APIC error on CPU0: 00(00)" plus also
> > > make kexec more reliable.
> 
> If the first patch solves does it make sense to consider, at least, it to be merged?

First one sure, the rest I think are also worth considering.  They get
rid of the resulting innocuous "APIC error on CPU0: 00(00)" message.
Also remaining patches are likely to provide the kexec kernel with a
better context, as they quiesce interrupts from devices.

I will send a new version soon, hopefully we can discuss over that one
which patches we want to pick.  With my XenServer hat on I plan to
backport the whole series into our patch queue.

Thanks, Roger.

