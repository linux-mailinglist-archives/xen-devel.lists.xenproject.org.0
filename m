Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFE8A4E96F
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 18:40:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901367.1309331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpWFF-0005vW-ET; Tue, 04 Mar 2025 17:39:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901367.1309331; Tue, 04 Mar 2025 17:39:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpWFF-0005sT-Br; Tue, 04 Mar 2025 17:39:53 +0000
Received: by outflank-mailman (input) for mailman id 901367;
 Tue, 04 Mar 2025 17:39:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=esJf=VX=flex--seanjc.bounces.google.com=35DrHZwYKCbstfbokdhpphmf.dpnyfo-efwfmmjtut.yfoqspkfdu.psh@srs-se1.protection.inumbo.net>)
 id 1tpWFD-0005sN-Uq
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 17:39:52 +0000
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [2607:f8b0:4864:20::649])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abde0fcb-f91f-11ef-9ab4-95dc52dad729;
 Tue, 04 Mar 2025 18:39:50 +0100 (CET)
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-22367f4e9b9so80309475ad.0
 for <xen-devel@lists.xenproject.org>; Tue, 04 Mar 2025 09:39:50 -0800 (PST)
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
X-Inumbo-ID: abde0fcb-f91f-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741109989; x=1741714789; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TI3FoVeE0Ra2glCU+l7ZrrB58ecOTFnnVt+cs3oYhCA=;
        b=rVvLSfFe7LIWkFjAIGNRd3UmHQJh3vfhzuobUvZZBOgFqPuxTuAd/2nJB+RwG4UlWZ
         9lt5vfSFHnnvAyjHR6oB8VWWzM/aXaPMyZNoe5yAVrwXOb/qeOC4lRD0/mumfDSfA2NP
         JsmXmJh0UCaj/8BBud4ZCKpW3yYI7CfkK/dKeFKa1X8bIxpT7KVlV02pJJZvu/kgPXt1
         ZOKaBsUY9INoFn4+vthQBN8NR+QgxC2zbt6IDuA5FVh44mavD3vOcrlma0aJ/ckJx9Xu
         cukT7MaMRlz8yk5S5oMbS1aPdwRb07/9f+ieVo2wFMZw3xp1+b07PvXhRoUAMf9OYFy+
         gNpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741109989; x=1741714789;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TI3FoVeE0Ra2glCU+l7ZrrB58ecOTFnnVt+cs3oYhCA=;
        b=hfScL8QhwtcQcTeJglslf0SdGQf5vUxh7fTAzjgMyHOk6gVddo6PYo3q/eym4dccDi
         BphXf2jqXvwTUrgRjf0xQV3fvIoI9KTZ4pBXNWHgheLEmr3Fmd1tssTMsEX5E/ZNaTqN
         jfK7BK3lEoHect8pJ435ayogMFiBzXZJUTphIPRn0KPIZGluu+ZFr1t+8kt61BtXHJbV
         Cm9kd9fv0VNaWU0PqJv24xfGYu6CYX8d8xPl7ffkfd61PX5S3e15mO0MYOfmzWlytvBp
         qPSNPISAHN6ws/m7JVe989HU2rv/Q5RUmfTEC4U1oQ3ABDMfkfDEkCO3crnDHmu/5yx3
         lizQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHU2wehnEnkV+oF3YK3FwsVBOUf5sjztVKGQPLqzwE/a7qSRrLHHmbQb92vEwCECe8Uvtg9/ObM8o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyxCgaWjAFrtd620DMZLl4oCULNFkO+YCiyajcu9xp6g/SbEq3Q
	x5Rd82N5a3oZp5tUGBmwV7/OcKw+PDXfmaDSWmHuIkUoWnB4mDwFHByGMQbHGelXopi1r+BUhTM
	D2g==
X-Google-Smtp-Source: AGHT+IGZddoSY2oyJ60dCyqtZiF8YnS+v36sYEMEslkao7NI/8RRXlf38IKWdXRybiMidO4JcJg+/iNohU8=
X-Received: from pfbfw3.prod.google.com ([2002:a05:6a00:61c3:b0:730:76c4:7144])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:734b:b0:1ee:d418:f758
 with SMTP id adf61e73a8af0-1f2f4cdb421mr28532451637.17.1741109988705; Tue, 04
 Mar 2025 09:39:48 -0800 (PST)
Date: Tue, 4 Mar 2025 09:39:47 -0800
In-Reply-To: <SN6PR02MB41576973AC66F8515F6C81F0D4C82@SN6PR02MB4157.namprd02.prod.outlook.com>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com> <20250227021855.3257188-9-seanjc@google.com>
 <SN6PR02MB41576973AC66F8515F6C81F0D4C82@SN6PR02MB4157.namprd02.prod.outlook.com>
Message-ID: <Z8c641D3AuWNXGVB@google.com>
Subject: Re: [PATCH v2 08/38] clocksource: hyper-v: Register sched_clock
 save/restore iff it's necessary
From: Sean Christopherson <seanjc@google.com>
To: Michael Kelley <mhklinux@outlook.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Juergen Gross <jgross@suse.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	John Stultz <jstultz@google.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"virtualization@lists.linux.dev" <virtualization@lists.linux.dev>, 
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Mar 04, 2025, Michael Kelley wrote:
> From: Sean Christopherson <seanjc@google.com> Sent: Wednesday, February 26, 2025 6:18 PM
> > 
> > Register the Hyper-V timer callbacks or saving/restoring its PV sched_clock
> 
> s/or/for/
> 
> > if and only if the timer is actually being used for sched_clock.
> > Currently, Hyper-V overrides the save/restore hooks if the reference TSC
> > available, whereas the Hyper-V timer code only overrides sched_clock if
> > the reference TSC is available *and* it's not invariant.  The flaw is
> > effectively papered over by invoking the "old" save/restore callbacks as
> > part of save/restore, but that's unnecessary and fragile.
> 
> The Hyper-V specific terminology here isn't quite right.  There is a
> PV "Hyper-V timer", but it is loaded by the guest OS with a specific value
> and generates an interrupt when that value is reached.  In Linux, it is used
> for clockevents, but it's not a clocksource and is not used for sched_clock.
> The correct Hyper-V term is "Hyper-V reference counter" (or "refcounter"
> for short).  The refcounter behaves like the TSC -- it's a monotonically
> increasing value that is read-only, and can serve as the sched_clock.
> 
> And yes, both the Hyper-V timer and Hyper-V refcounter code is in a
> source file with a name containing "timer" but not "refcounter". But
> that seems to be the pattern for many of the drivers in
> drivers/clocksource. :-)

Heh, wading through misleading naming is basically a right of passage in the kernel.

Thanks for the reviews and testing!  I'll fixup all the changelogs.

