Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99965B37E6D
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 11:09:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095763.1450650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urC9w-0004uI-Kv; Wed, 27 Aug 2025 09:09:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095763.1450650; Wed, 27 Aug 2025 09:09:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urC9w-0004sJ-HV; Wed, 27 Aug 2025 09:09:36 +0000
Received: by outflank-mailman (input) for mailman id 1095763;
 Wed, 27 Aug 2025 09:09:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E4uQ=3H=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1urC9v-0004sD-5c
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 09:09:35 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c4605bd-8325-11f0-a32c-13f23c93f187;
 Wed, 27 Aug 2025 11:09:34 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-45b49f7aaf5so39933445e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 27 Aug 2025 02:09:34 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b6f0d78b4sm23170045e9.7.2025.08.27.02.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Aug 2025 02:09:32 -0700 (PDT)
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
X-Inumbo-ID: 8c4605bd-8325-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756285773; x=1756890573; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mZRlqsu1mLsSbCdlJcNjZYpIcngXwXldwqY6dQsQG2Y=;
        b=hfsE100GRiS94yorYlC1ukKo644B169TMoictqa6GO52uTMiZd/VE+45flxvtdfL64
         MGzs/zWZX8Qc/ghmJx5mrommg2gu2tOdQCQ1TLb4i3Gc4oWhd6fN/kMCU+5qjUmS35uI
         uaTSnYLeCjOyY7zVg08eRA1ik3neBUjBNZZ9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756285773; x=1756890573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZRlqsu1mLsSbCdlJcNjZYpIcngXwXldwqY6dQsQG2Y=;
        b=djwzi625dCtpVD10VY8F1zEbuXtvWUgmtc3JFxEADPMBI/Q8gztQPEjUqhrGBCk74z
         vbZ8+9eHawtAfqioR3CLno0n+Eggmez3FuaqAOr8IvWgtMvynezYPlqmS1R8plWK1WTX
         CS7Ijrm0GCcPJanJ23d1orn/REGHu5KYGnOamhX4xfzdmStymiLATpm9F6QarwS7gyJl
         uIBAgNoVOeLRRWIM5zVLBk+DQXPcdfxiauMPmBHBH/gSWQYklL9PwS23/kwzHaXkX4/l
         kAZ+7cbjsl0k9q3tvlS7nEma/WPQBuWdqQbc2SjTGuB7CQAQaW6IXrzWxESZyf0VOuNA
         eRWQ==
X-Gm-Message-State: AOJu0YwLSE21Xb7kW48FfMNpxZIA6LUmCK9LVqD54SHya4/zh6wPQXDZ
	Y5rUf/jB6OhJkwfZ5kTNMlDJBJZW+IN/zcCaOQ2hYdANDxFpKUjvkmI+kEAfXJ4+guc=
X-Gm-Gg: ASbGncs84rA4h+hWBRYSZ6KRrN3C/w0xKGBT9F9jozuKJg/WHYjjLZMnunHHPfdX/+v
	cNi8e/yjnn4G+2ZvHwCLR1c3lU74aF8gsXJ8P9zjrUWydJa313ts0aUicuFdTYqCByTg7Rx2MW4
	g/eXA0/J8YT1RRjBH4iQwlzI1fwhIbGYVvNwrTvqsgyd0KqHHzIEfwDhtjM0P68+hv/cHiuhTUL
	ZI7Mm/grXbznKMxgLEB0YYMiFx6HDbODypiVKE3kgSzDHgnQlS3InN2DMUz5trTxrVljApxI/hX
	L7kDrV1h3eli0ffOxZct2hKWrLYQSMj18FchZKJI/kFeAqc9FFVQKQWmx8+pOAcSnGlE1ibKSAq
	BafVw9y+Gcinv0QOeGDJD0m55m8331srrOHMZaA2EGYFJhVajtap1Rjio6MhpZMhO3Q==
X-Google-Smtp-Source: AGHT+IFCkun1wtsgpQt+n4TFrq5S0vRwuz2psVqD7F+GkkYzBlY6QVQDdvbem9mDxxrihaNLvVEFAA==
X-Received: by 2002:a05:600c:3b26:b0:456:19b2:6aa8 with SMTP id 5b1f17b1804b1-45b517caa99mr156090525e9.19.1756285773393;
        Wed, 27 Aug 2025 02:09:33 -0700 (PDT)
Date: Wed, 27 Aug 2025 11:09:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Vyacheslav Legoshin <vyacheslav.legoshin@yandex.ru>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] x86/vhpet: Add option to always fire hpet timer on
 resume
Message-ID: <aK7LTO1Msvm0hDtH@Mac.lan>
References: <faa5eee741a772eba95415ca26f0cdf304486fc3.1756272466.git.vyacheslav.legoshin@yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <faa5eee741a772eba95415ca26f0cdf304486fc3.1756272466.git.vyacheslav.legoshin@yandex.ru>

On Wed, Aug 27, 2025 at 09:01:08AM +0300, Vyacheslav Legoshin wrote:
> The following issue was observed on Windows 10 21H2 x64+: when the domain state
> is saved while all cores are executing the 'halt' instruction,

I assume this when executing `xl save` or equivalent command from a
different toolstack?

IIRC in that case the guest would be paused while the memory dump to
disk is done, and hence guest vCPUs won't be executing the `halt`
instruction, they wouldn't be executing at all.

> and the memory
> save takes a relatively long time (tens of seconds), the HPET counter may
> overflow as follows:
> counter  = 11243f3e4a
> comparator = 910cb70f
> 
> In such cases, the fix implemented in commit
> b144cf45d50b603c2909fc32c6abf7359f86f1aa does not work (because the 'diff' is
> not negative), resulting in the guest VM becoming unresponsive for
> approximately 30 seconds.
> 
> This patch adds an option to always adjust the HPET timer to fire immediately
> after restore.

What happens if the guest is left running after the save?  I assume
that using `xl save -c <domain>` would leave the domain in a similarly
wedged state, and your proposed workaround won't be effective there,
since there's no restoring process?  Or that's not the case there
because Xen is still keeping track of the internal timer, and would
set an interrupt as pending anyway?

Should we maybe store the last guest time at context save, and check
against that to see whether comparators should have triggered, instead
of playing this games?

Thanks, Roger.

