Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 087CFB345C4
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 17:29:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093482.1448984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqZ7u-00010j-3K; Mon, 25 Aug 2025 15:28:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093482.1448984; Mon, 25 Aug 2025 15:28:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqZ7u-0000zE-0Y; Mon, 25 Aug 2025 15:28:54 +0000
Received: by outflank-mailman (input) for mailman id 1093482;
 Mon, 25 Aug 2025 15:28:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kKY8=3F=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uqZ7s-0000z8-C9
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 15:28:52 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31136c39-81c8-11f0-b898-0df219b8e170;
 Mon, 25 Aug 2025 17:28:46 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-45a1b066b5eso23609445e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 08:28:46 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b57449e72sm114391465e9.7.2025.08.25.08.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 08:28:45 -0700 (PDT)
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
X-Inumbo-ID: 31136c39-81c8-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756135726; x=1756740526; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N49DMRXrnFBcfvFWW2Vx0+wgJjxpqPexPeoYupJ7Yfg=;
        b=jKF0MF5ktTD1jTyO2kwCxj3dAubRqpxu37q2X7c/BIUhUDLMXRGRlcSBIcouKFB2sg
         ygsljS82b6L1uKdzbp52+BUqFIBkfwVBuDeMouKJfo8SSYhfJvjE5/YkY7OVRLzVqbCs
         YMJ4501qTPizCyZGcE0in66PDefrAZXUdBh/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756135726; x=1756740526;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N49DMRXrnFBcfvFWW2Vx0+wgJjxpqPexPeoYupJ7Yfg=;
        b=gx8dwe5FU5Sf7ZEket9H6sLLH3oHaUjFbFvWO3qyQsqc5OQMtJ7GRj5KDeJjOv31bP
         f814PuxkqVecxwcA+9N5SyId3xxxnqLhSh7zG0Auavf1a3hz8MffYF/kImWaRm64d6U/
         MKPPZLaydcSFQGSGwAtFUUNAVQ5MU3ydZ9nlrVAtSDO2Q7wpZhk7vm966Ws3LdD/i6MQ
         ftetLVApPLqVv2JER7Op71RU8Cin3TwhLa/YhasbCJkvFW40vQcO7g7SvakYw2RXA51R
         Qi7U/LmdIezVO4GXJJELMo0FuYviFXuXuCOydDBsTAbPbwY1Czq+Lpa1HsNdmmun1P8z
         W27A==
X-Forwarded-Encrypted: i=1; AJvYcCVW+YCwaKQ1DEKjpOrmiVb02yyz9dPABPQQZVT9oOEUcsX04Y1EgmRiIkXp9Ag3j4fusrZFpZg3u98=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxzO3SAwz7ddmZYIoV3HsSjSjW/YawYj9JWDOTilgyS59hAOz4s
	DBEeU5GuGDWsa36rQRK96FDtSg2Ucs/l+Pkf9IPseFUoJFT3/586zp4Ii4elPEbfNWA=
X-Gm-Gg: ASbGncvrEvppMT+E7HKF2NrZN+7hgrjaJszhBqlYnNTLXfqKi4Fh1jlDmEIc5gOu4Zy
	mk61kczEJHaE8c2n+d6tcIE4iyKAPEysv9tc/orN8PB/XZ0Dfc2ieGXsf1xDBhpfaa9I+ACbdZ+
	NEfRpNAu2W2Km4zs7I265szCCG2ZQ1gWpK7wntZXTz1/TznSUFvSw+zkUks9IKEIGotrMHXaIIs
	aQFbEt66oPiasCO2r7KmarIQ4r8MZRWvER+ZTndljX/ID+bozYY/5jZid+ECAQpddEHgu83OBKL
	hFAJzfn4GNouThCUjJm3Qd1hqNetPGvSDoKKJ4orJYzVQoewyaJU/3EubhhV2jhFi8Yi3JkzVXm
	KoQ2e3xcwO/d6L0yreLxHVJYS445fOVD25DgQom9jYLtxyqY5eu3KY18wyKz4PG06mfCZ+bMtvH
	QH
X-Google-Smtp-Source: AGHT+IFfbHOGJ9RPxmXRglsAK8UfPG3uLPVAan7hEClMKQV3JPexyaGh/zSY06H8HYz+gowEfiVIMw==
X-Received: by 2002:a05:600c:4ca1:b0:45b:4ba0:da4 with SMTP id 5b1f17b1804b1-45b541d5401mr64483905e9.13.1756135725935;
        Mon, 25 Aug 2025 08:28:45 -0700 (PDT)
Date: Mon, 25 Aug 2025 17:28:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/suspend: unconditionally raise a timer softirq on
 resume
Message-ID: <aKyBLN0Y3arg1b76@macbook.local>
References: <20250825151515.39177-1-roger.pau@citrix.com>
 <f5fc3210-2911-4b42-af8c-8a2f4bcbdfad@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f5fc3210-2911-4b42-af8c-8a2f4bcbdfad@suse.com>

On Mon, Aug 25, 2025 at 05:25:36PM +0200, Jan Beulich wrote:
> On 25.08.2025 17:15, Roger Pau Monne wrote:
> > The current code to restore the timer state on resume is incomplete.  While
> > the local APIC Initial Count Register is saved and restored across
> > suspension (even if possibly no longer accurate since it's not adjusted to
> > account for the time spent in suspension), the TSC deadline MSR is not
> > saved and restored, hence hosts using the TSC deadline timer will likely
> > get stuck when resuming from suspension.
> > 
> > The lack of restoring of the TSC deadline MSR was mitigated by the raising
> > of a timer softirq in mwait_idle_with_hints() if the timer had expired,
> > previous to commit 3faf0866a33070b926ab78e6298290403f85e76c, which removed
> > that logic.
> > 
> > This patch fixes the usage of the TSC deadline timer with suspension, by
> > unconditionally raising a timer softirq on resume, that will take care of
> > rearming the hardware timer.  Given that a timer softirq will be
> > unconditionally risen, there's no need to save and restore the APIC Initial
> > Count Register anymore either.
> > 
> > Note that secondary processors don't need this special treatment when
> > resuming, since they are offlined before suspension and brought back up
> > during resume, the first timer that gets setup will trigger a timer softirq
> > unconditionally, for example from sched_migrate_timers() that gets called
> > for each secondary processor.
> > 
> > Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> > Fixes: fd1291a826e1 ('X86: Prefer TSC-deadline timer in Xen')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks, I've also added:

Link: https://github.com/QubesOS/qubes-issues/issues/10110

To the tags.

Roger.

