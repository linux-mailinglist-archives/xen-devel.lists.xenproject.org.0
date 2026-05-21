Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNgmK3FsD2qOLAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 22:34:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A055ABCD9
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 22:34:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315909.1585547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQA6A-00013t-Dz; Thu, 21 May 2026 20:34:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315909.1585547; Thu, 21 May 2026 20:34:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQA6A-00011u-Au; Thu, 21 May 2026 20:34:30 +0000
Received: by outflank-mailman (input) for mailman id 1315909;
 Thu, 21 May 2026 20:34:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3UWwPagYKCb4wierngksskpi.gsq1ir-hizippmwxw.1irtvsnigx.svk@flex--seanjc.bounces.google.com>)
 id 1wQA68-00011o-TS
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 20:34:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQA68-004QCY-9T
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 22:34:28 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3UWwPagYKCb4wierngksskpi.gsq1ir-hizippmwxw.1irtvsnigx.svk@flex--seanjc.bounces.google.com>)
 id 6a0f6c4c-bab6-0a2a0a5309dd-0a2a450badb2-8
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 22:34:28 +0200
Received: from [209.85.214.201] (helo=mail-pl1-f201.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3UWwPagYKCb4wierngksskpi.gsq1ir-hizippmwxw.1irtvsnigx.svk@flex--seanjc.bounces.google.com>)
 id 6a0f6c52-212f-0a2a450b0019-d155d6c9bc67-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 22:34:28 +0200
Received: by mail-pl1-f201.google.com with SMTP id
 d9443c01a7336-2b9fe2d6793so151339755ad.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 13:34:27 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779395666; x=1780000466; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dIireasEnp8AQZjS+o0HC63+VEosuYCnO+TKDPQR05s=;
        b=Mma/CTBS4wvstNA67YLtQiuf7Jo3Ou+lT8Fkz9m1AMBNCvSKvIh3H96gB3EHqJdZdn
         lc1QfGbQ10RTc+8aJ3PO9ytlSkx1SDlbsMsT29twfxGnX9UMfOrh4edsFjeefe2qmUte
         viwChWOdzdrFTCTZZ+BQmotAYOGQHykCNBKGjnxSouk8qnBFNSld6tWuUUpZwXzc4nAr
         RufKXoDB+Aa5aW8+8W1ZdmK+0zr3FyOnfwcBFMOLGTOOmqpScgArioDIU5NpqeCIMoT4
         sb0quKIteRQo1XngVHXdbFEEzRK0Os7q6Mc1PwOM53y+oFVjgus91g+VPlBjKJK1kRJE
         un7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779395666; x=1780000466;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dIireasEnp8AQZjS+o0HC63+VEosuYCnO+TKDPQR05s=;
        b=exDfCjk/6s5AKdsLhcsgSdPNDjfqXut6gRWtBd1ChXdFq0YdfZS7W6cZ3ytf7lD+wJ
         40RQbZThYHxFzTw8wyw+a5oLt504q0qCIzaSQnTvqzAlceSmkUc6QddVxylemmgvPRD1
         uDzGnQ6LJ0pL3t/LbbgFPVsHxe/T6wGY9fZr7OOn7lHmlt3uuDKydqWqAZX+xK4srhdu
         NWpf6DOXAhU568e0YTjNYzynqygSkYQOxWDk9SAW4Zv3etcqZWao2Xv33A162GtHZ+EQ
         hfkOuirUxxLDADTkwMhwbtWOr2jnrA/M6l/6OuH1XPqbytW39pGbWHEy9jPW5kgS9LN2
         ptgw==
X-Forwarded-Encrypted: i=1; AFNElJ/Kn9xyP1YhAkzZZ8vyPwf4Q0W5tFHIbyF9VV+DTsox1OIjgyAGLhR82tPFdhK4ZtlXxJLzhGmMiVI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxpijK+vkgc07JdGzPvDTujUqvkIblEhaP1vC7/XQihwqZ0tRWK
	qYAsRnJJCnpUlI2AlbS7gQOGYiKNZtoiDh6NCvvMf3wBEWJeIfnizihiwHV3slnnDj5nSjCNgf/
	P14Uyzw==
X-Received: from plip15.prod.google.com ([2002:a17:903:38cf:b0:2bc:ae06:63be])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:4405:b0:2b9:6458:1a2c
 with SMTP id d9443c01a7336-2beb06733bemr4530925ad.13.1779395665926; Thu, 21
 May 2026 13:34:25 -0700 (PDT)
Date: Thu, 21 May 2026 13:34:24 -0700
In-Reply-To: <7489ff3cc1ff402bf0ade38272fc52dcbcc75fc1.camel@amazon.co.uk>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com> <20260515191942.1892718-37-seanjc@google.com>
 <7489ff3cc1ff402bf0ade38272fc52dcbcc75fc1.camel@amazon.co.uk>
Message-ID: <ag9sUI8pBJda0Ml5@google.com>
Subject: Re: [PATCH v3 36/41] x86/kvmclock: Get local APIC bus frequency from
 PV CPUID Timing Info
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: "tglx@kernel.org" <tglx@kernel.org>, "longli@microsoft.com" <longli@microsoft.com>, 
	"luto@kernel.org" <luto@kernel.org>, 
	"alexey.makhalov@broadcom.com" <alexey.makhalov@broadcom.com>, "jstultz@google.com" <jstultz@google.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, 
	"ajay.kaher@broadcom.com" <ajay.kaher@broadcom.com>, "jan.kiszka@siemens.com" <jan.kiszka@siemens.com>, 
	"haiyangz@microsoft.com" <haiyangz@microsoft.com>, "kas@kernel.org" <kas@kernel.org>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "kys@microsoft.com" <kys@microsoft.com>, 
	"decui@microsoft.com" <decui@microsoft.com>, 
	"daniel.lezcano@kernel.org" <daniel.lezcano@kernel.org>, "wei.liu@kernel.org" <wei.liu@kernel.org>, 
	"peterz@infradead.org" <peterz@infradead.org>, "jgross@suse.com" <jgross@suse.com>, 
	"boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"mhklinux@outlook.com" <mhklinux@outlook.com>, "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "nikunj@amd.com" <nikunj@amd.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>, "vkuznets@redhat.com" <vkuznets@redhat.com>, 
	"rick.p.edgecombe@intel.com" <rick.p.edgecombe@intel.com>, 
	"virtualization@lists.linux.dev" <virtualization@lists.linux.dev>, "sboyd@kernel.org" <sboyd@kernel.org>, 
	"x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="us-ascii"
X-purgate-ID: tlsNG-42698a/1779395668-1B979F3B-FE8F1F62/0/0
X-purgate-type: clean
X-purgate-size: 1565
X-Spamd-Result: default: False [-0.69 / 15.00];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,microsoft.com,broadcom.com,google.com,linux.intel.com,siemens.com,redhat.com,infradead.org,suse.com,oracle.com,lists.linux.dev,vger.kernel.org,outlook.com,amd.com,linutronix.de,lists.xenproject.org,intel.com];
	FORGED_RECIPIENTS(0.00)[m:dwmw@amazon.co.uk,m:tglx@kernel.org,m:longli@microsoft.com,m:luto@kernel.org,m:alexey.makhalov@broadcom.com,m:jstultz@google.com,m:dave.hansen@linux.intel.com,m:ajay.kaher@broadcom.com,m:jan.kiszka@siemens.com,m:haiyangz@microsoft.com,m:kas@kernel.org,m:pbonzini@redhat.com,m:kys@microsoft.com,m:decui@microsoft.com,m:daniel.lezcano@kernel.org,m:wei.liu@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:linux-coco@lists.linux.dev,m:kvm@vger.kernel.org,m:mhklinux@outlook.com,m:thomas.lendacky@amd.com,m:linux-kernel@vger.kernel.org,m:bcm-kernel-feedback-list@broadcom.com,m:tglx@linutronix.de,m:nikunj@amd.com,m:xen-devel@lists.xenproject.org,m:linux-hyperv@vger.kernel.org,m:vkuznets@redhat.com,m:rick.p.edgecombe@intel.com,m:virtualization@lists.linux.dev,m:sboyd@kernel.org,m:x86@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	FORGED_SENDER(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 24A055ABCD9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026, David Woodhouse wrote:
> On Fri, 2026-05-15 at 12:19 -0700, Sean Christopherson wrote:
> > When running as a KVM guest with kvmclock support enabled, stuff the APIC
> > timer period/frequency with the local APIC bus frequency reported in
> > CPUID.0x40000010.EBX instead of trying to calibrate/guess the frequency.
> > 
> > See Documentation/virt/kvm/x86/cpuid.rst for details.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> 
> I still don't much like the way this is done inside kvm_get_tsc_khz().

Yeah, I don't like it either (understatement).  Aha!  native_calibrate_tsc() is
the oddball, all of the PV flows stuff lapic_timer_period when parsing the initial
timing info.  I'll just do that.  Blindly writing a global is all kinds of fugly,
but that's a future
problem to solve.

> We also probably ought to be looking for the timing leaf on other
> hypervisors including VMware 

VMware gets the frequency via hypercall.  Why, I have no idea.  I'll let the
VMware folks deal with that.

	eax = vmware_hypercall3(VMWARE_CMD_GETHZ, UINT_MAX, &ebx, &ecx);

> and probably Bhyve too.  Should it be done somewhere else?

I'm not opposed to that, though I don't know that it'd be a net positive. The
"hard" part of getting the info is finding the CPUID base and checking if the
leaf is available.  Unlike the native CPUID leaf, no math is necessary, and so
once the leaf is obtained, getting the frequency is trivial.

Regardless, I definitely don't want to take it on in this series. :-)


