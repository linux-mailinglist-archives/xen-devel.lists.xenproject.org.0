Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id STGoFV3tS2pVdAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 20:01:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE1A714365
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 20:01:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=C1CT7qcM;
	dmarc=pass (policy=reject) header.from=google.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355785.1610546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgncZ-00032S-KU; Mon, 06 Jul 2026 18:00:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355785.1610546; Mon, 06 Jul 2026 18:00:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgncZ-00030p-Hl; Mon, 06 Jul 2026 18:00:43 +0000
Received: by outflank-mailman (input) for mailman id 1355785;
 Mon, 06 Jul 2026 18:00:41 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3N-1LagYKCZoM84HD6AIIAF8.6IGR8H-78P8FFCMNM.R8HJLID86N.ILA@flex--seanjc.bounces.google.com>)
 id 1wgncX-00030i-FR
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 18:00:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgncW-00Ap2d-5l
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 20:00:40 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3N-1LagYKCZoM84HD6AIIAF8.6IGR8H-78P8FFCMNM.R8HJLID86N.ILA@flex--seanjc.bounces.google.com>)
 id 6a4bed32-2eae-0a2a0a5409dd-0a2a450587de-24
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 20:00:40 +0200
Received: from [209.85.210.201] (helo=mail-pf1-f201.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3N-1LagYKCZoM84HD6AIIAF8.6IGR8H-78P8FFCMNM.R8HJLID86N.ILA@flex--seanjc.bounces.google.com>)
 id 6a4bed38-3cb2-0a2a45050019-d155d2c9ed33-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 20:00:26 +0200
Received: by mail-pf1-f201.google.com with SMTP id
 d2e1a72fcca58-8478e9c4bd2so3477344b3a.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 11:00:25 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783360824; x=1783965624; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eYcfhMi5NCPMduPSvGqKtbO87FaKSq3RfhmI47bcB1U=;
        b=C1CT7qcMpykNYW2n4oWTUAdRG0Hs3YAhyA3hp1NG5nD+X/Bh9aYDjQmgYCgSLgxZpJ
         QpAYg6JHJZjdtfGLpwq/mBA1aQ4yRBandYbHF6VwO9g7ajnMmhCCapudKeSvLgnCo3Yu
         DwE5rrWdai9el1xBxBjXbTtTRVErophhkywW+h+Rz4Hikfad+rzExvlr7KMNREZqZbEB
         UM6gVQyWaAomMial7xTYfcBvHVhoWAmMWD7FiXewCIo90ldETpYRFyc0YovaSrMQNbs0
         dRroBkDL0YC6Pqs314kQN6wOskO+10tDNRh4p63xpOVH8QcVO+lc6sk4S7043G+09str
         H8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360824; x=1783965624;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eYcfhMi5NCPMduPSvGqKtbO87FaKSq3RfhmI47bcB1U=;
        b=RAaNNsDVMTF+p1Vzaodkmr7WdECDKl87OEykflgJcfzugQdUTTNelWi9YoSPPeROst
         qkuenBHaasCUYf36jRcKmGoRxKJkjPY+9el3f+oezmMEZ49gtyecOP5fiMmnX57Ug+A4
         XP3ct/M5EvwGpMJTi4jTYRatdWhPHMaO6/6AXz8ga3AjEJE8qEt439NtX5rTtWPNnd2v
         AsYdqDNfyUlpUe9B3HYR4GWMnjB/avgny42Ln3htWX6PF50nJM+OTFFOA4WbmjWhaRc3
         PlzejQILcZh1gvit31WxntHwdIQgMpQWgyWCuUTfhvqqgfQjJ3slDa/UkBPHEjBVBtI0
         h0eA==
X-Forwarded-Encrypted: i=1; AHgh+RpHHaWiKnC0GOGFQ4+XCSfSO+ko/+AsRRP3Qq5KJDylNnIN1XivRn6fZzp4ma2azgic+HSY9VhT8UU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzf5Dkouz/QgrHSyJVLSq6B/fqY/g2jT3+9abthE+ptShRFARgh
	XL/l8rTDLR+d6YUrsQR8iL8LR+uvTzPT3rWaGd8ZfoGOlOKJKX8vLWYTkQEK7EZVHlvPZR1U1fW
	Kkpw6Wg==
X-Received: from pgam14.prod.google.com ([2002:a05:6a02:2b4e:b0:c92:460e:4f73])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4307:b0:847:8c6d:2f24
 with SMTP id d2e1a72fcca58-84826ec2591mr1691676b3a.56.1783360823962; Mon, 06
 Jul 2026 11:00:23 -0700 (PDT)
Date: Mon, 6 Jul 2026 11:00:23 -0700
In-Reply-To: <SN6PR02MB41578D3C34AB283B892C27A4D4F52@SN6PR02MB4157.namprd02.prod.outlook.com>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com> <20260701193212.749551-2-seanjc@google.com>
 <SN6PR02MB41578D3C34AB283B892C27A4D4F52@SN6PR02MB4157.namprd02.prod.outlook.com>
Message-ID: <akvtN7aIjZ7gOq4o@google.com>
Subject: Re: [PATCH v5 01/51] x86/apic: Provide helpers to set local APIC
 timer period in hz and khz
From: Sean Christopherson <seanjc@google.com>
To: Michael Kelley <mhklinux@outlook.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>, 
	"virtualization@lists.linux.dev" <virtualization@lists.linux.dev>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, David Woodhouse <dwmw@amazon.co.uk>, 
	David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
X-purgate-ID: tlsNG-c201ff/1783360826-15B092B8-3A6E25E6/0/0
X-purgate-type: clean
X-purgate-size: 1089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mhklinux@outlook.com,m:corbet@lwn.net,m:pbonzini@redhat.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:kas@kernel.org,m:rick.p.edgecombe@intel.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:jstultz@google.com,m:skhan@linuxfoundation.org,m:hpa@zytor.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:linux-doc@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-coco@lists.linux.dev,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:dwmw@amazon.co.uk,m:dwmw2@infradead.org,m:tglx@linutronix.d
 e,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[outlook.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[41];
	DKIM_TRACE(0.00)[google.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ADE1A714365

On Thu, Jul 02, 2026, Michael Kelley wrote:
> > @@ -796,6 +796,16 @@ bool __init apic_needs_pit(void)
> >  	return lapic_timer_period == 0;
> >  }
> > 
> > +void apic_set_timer_period_khz(u64 period_khz, const char *source)
> > +{
> > +	lapic_timer_period = mul_u64_u32_div(period_khz, 1000, HZ);
> > +}
> > +
> > +void apic_set_timer_period_hz(u64 period_hz, const char *source)
> > +{
> > +	lapic_timer_period = div_u64(period_hz, HZ);
> > +}
> 
> A string "source" argument is passed in, but not used. Is there an
> envisioned future use? Also, this function doesn't output a pr_info()
> message like the existing Hyper-V and VMware code does. 

It was a complete goof on my part (Sashiko also pointed out the oddity[*]).  I
fully intended to log a message and provide equivalent Hyper-V/VMware behavior,
and totally spaced it.

[*] https://lore.kernel.org/all/20260701194621.4BD691F000E9@smtp.kernel.org

> I don't know that the message is all that useful, though I do remember one
> case where I was debugging some clock/timer issue when I looked at it. 


