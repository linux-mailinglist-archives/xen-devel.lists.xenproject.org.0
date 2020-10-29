Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0A529F307
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 18:24:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14507.35867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBfA-00063k-BI; Thu, 29 Oct 2020 17:24:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14507.35867; Thu, 29 Oct 2020 17:24:36 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBfA-00063L-7x; Thu, 29 Oct 2020 17:24:36 +0000
Received: by outflank-mailman (input) for mailman id 14507;
 Thu, 29 Oct 2020 17:24:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iFbr=EE=gmail.com=niveditas98@srs-us1.protection.inumbo.net>)
 id 1kYBc6-0003MD-P8
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:21:26 +0000
Received: from mail-qk1-x736.google.com (unknown [2607:f8b0:4864:20::736])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec327819-3ee6-4007-a9f6-2165b14effc9;
 Thu, 29 Oct 2020 17:20:51 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id s14so2560047qkg.11
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2020 10:20:51 -0700 (PDT)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
 by smtp.gmail.com with ESMTPSA id m33sm1432097qtb.65.2020.10.29.10.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 10:20:50 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=iFbr=EE=gmail.com=niveditas98@srs-us1.protection.inumbo.net>)
	id 1kYBc6-0003MD-P8
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:21:26 +0000
X-Inumbo-ID: ec327819-3ee6-4007-a9f6-2165b14effc9
Received: from mail-qk1-x736.google.com (unknown [2607:f8b0:4864:20::736])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ec327819-3ee6-4007-a9f6-2165b14effc9;
	Thu, 29 Oct 2020 17:20:51 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id s14so2560047qkg.11
        for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2020 10:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bgET2vKXyCysvHtuVXHC8x2bsoHr9I9pVPGZuJ2I2ok=;
        b=kCwHtNb0aDqVERdhKoxZMhicLRZ2QR3PolGpflI38e1AZzBFPmngVCvkULn12HaIpd
         xNZsE0KTf8SFsTeciNeDfLB2b8eo7aWwi+oWAp/jGZANfyHEmSTDAiXW3x245FjthbK+
         cNyymvnYwa4RgDaOm832TsIoNGN5VteNRutW9xIM3LOXzwfrz3rFIbB2qhaahGSK3KWZ
         rcjSGv+Lrv3xXtp7IhxItj2ThU4R1TxkB1brB4zm0qayhFjR52RmdpupiWUa8/437Az6
         Z5hmy1fEbRMjrq5fMw2J1qv+hvc2qIZX/q2dYGHrv1hoTM8Kgy/UG1ajYtjFlzWenf9F
         /BdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=bgET2vKXyCysvHtuVXHC8x2bsoHr9I9pVPGZuJ2I2ok=;
        b=IuxqC6fCv9b7mVDGfgQYwtFqtcaXDbsEhHrWITqCjE/kUmTRAbDIy1XaCSnKXUsyMt
         Kj64Jww9MzeLsPpzczPyhR7US+qtgxvwo1SgYxA+D7xOG1tlPMINwDPn3a0SNhaXJOjE
         urkXazEqrCl++mQPHwra57UuUD2uVzi7DdNOTZ62t13K2eZjAUf0nSfbLqQ6ZIOuy4FC
         qWzKmo0eF6E0CvUy1FPABrUCBm5HA9M7qZmpxAZcxuZHwfC+WkWECJQXRLOC5CcXDKLJ
         kX1MvM4BH0LXlP/TOvok31Nx53AB9J8oi9UKBPOj/j5++Fml8tr6CNWhPSPB/pKcNXOv
         GKUg==
X-Gm-Message-State: AOAM531Ji7tgk5jb6HDV5MuDsCNiEXnn+JPOoFS/iitQv26srSAxTQNP
	R/YHCz9r+FLSYXK88hqm1pc=
X-Google-Smtp-Source: ABdhPJxpj2lHqddfkMCdJsg7kjoxJdmwW/wIVKjCyqCU3W25AK0ciYoXUlV7HQMe/OgzwbBLEfxGlQ==
X-Received: by 2002:a05:620a:130a:: with SMTP id o10mr4612780qkj.63.1603992050890;
        Thu, 29 Oct 2020 10:20:50 -0700 (PDT)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id m33sm1432097qtb.65.2020.10.29.10.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 10:20:50 -0700 (PDT)
Sender: Arvind Sankar <niveditas98@gmail.com>
From: Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date: Thu, 29 Oct 2020 13:20:48 -0400
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Arvind Sankar <nivedita@alum.mit.edu>,
	David Laight <David.Laight@ACULAB.COM>,
	'Arnd Bergmann' <arnd@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"x86@kernel.org" <x86@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
Subject: Re: [PATCH] [v2] x86: apic: avoid -Wshadow warning in header
Message-ID: <20201029172048.GA2571425@rani.riverdale.lan>
References: <20201028212417.3715575-1-arnd@kernel.org>
 <38b11ed3fec64ebd82d6a92834a4bebe@AcuMS.aculab.com>
 <20201029165611.GA2557691@rani.riverdale.lan>
 <93180c2d-268c-3c33-7c54-4221dfe0d7ad@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <93180c2d-268c-3c33-7c54-4221dfe0d7ad@redhat.com>

On Thu, Oct 29, 2020 at 05:59:54PM +0100, Paolo Bonzini wrote:
> On 29/10/20 17:56, Arvind Sankar wrote:
> >> For those two just add:
> >> 	struct apic *apic = x86_system_apic;
> >> before all the assignments.
> >> Less churn and much better code.
> >>
> > Why would it be better code?
> > 
> 
> I think he means the compiler produces better code, because it won't
> read the global variable repeatedly.  Not sure if that's true,(*) but I
> think I do prefer that version if Arnd wants to do that tweak.
> 
> Paolo
> 
> (*) if it is, it might also be due to Linux using -fno-strict-aliasing
> 

Nope, it doesn't read it multiple times. I guess it still assumes that
apic isn't in the middle of what it points to: it would reload the
address if the first element of *apic was modified, but doesn't for
other elements. Interesting.

