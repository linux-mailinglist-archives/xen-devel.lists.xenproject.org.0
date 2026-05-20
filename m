Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPLoEcUoDmpq6gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 23:33:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CC359B052
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 23:33:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1314466.1584434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPoXt-0003Db-KI; Wed, 20 May 2026 21:33:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314466.1584434; Wed, 20 May 2026 21:33:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPoXt-0003B8-HH; Wed, 20 May 2026 21:33:41 +0000
Received: by outflank-mailman (input) for mailman id 1314466;
 Wed, 20 May 2026 21:33:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3sCgOagYKCZEDzv84x19916z.x97Iz8-yzGz663DED.Iz8AC94zxE.9C1@flex--seanjc.bounces.google.com>)
 id 1wPoXr-0003Au-N2
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 21:33:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPoXq-000gTb-PH
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 23:33:38 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3sCgOagYKCZEDzv84x19916z.x97Iz8-yzGz663DED.Iz8AC94zxE.9C1@flex--seanjc.bounces.google.com>)
 id 6a0e2876-5cb7-0a2a0a5109dd-0a2a4503bc6e-38
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 23:33:38 +0200
Received: from [209.85.215.201] (helo=mail-pg1-f201.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3sCgOagYKCZEDzv84x19916z.x97Iz8-yzGz663DED.Iz8AC94zxE.9C1@flex--seanjc.bounces.google.com>)
 id 6a0e28b1-672d-0a2a45030019-d155d7c9d921-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 23:33:38 +0200
Received: by mail-pg1-f201.google.com with SMTP id
 41be03b00d2f7-c828acf7c1dso8774959a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 14:33:38 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Content-Transfer-Encoding:Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779312816; x=1779917616; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LZSsn4W0FsDL+gHozCZFUr2SRc1gslr4/bysNvveKJE=;
        b=Bj04TAHLewNVYX/QUbiC3VU8l65ecoXf8zQbW2Gwjj0Kv34+JbiWwYyVlnpIhGDirY
         85WrUovIZqICDQBD8vQCYEZIplLs5LecZSdEEzEyslJX1mpsgZszyH1Qt98aSSMxsHdV
         yxFeOB2qVgfqdHmSlshAmsMY6C/6xlfrXh96iI+KQOF4KZJ1j5Pn/BH/u4+Ml6Ju/MWN
         9TKOtI/Ce1zaaWHhsLziDw4b0h9rfooDFSbyjL8dYxGJo8tCGBVH/FgsBBgErBt8bD7S
         eEyImAyYcrXw+Z/o08KYA/BuZ2YLBSSZMujvrFAWF9TKrHYiSDGx9n84SE7FZXNy24f5
         6tlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779312816; x=1779917616;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LZSsn4W0FsDL+gHozCZFUr2SRc1gslr4/bysNvveKJE=;
        b=oZ4eSrF2NXjJbpLwdMAnIEp+CGl8p58L7nCFnllEokZObBkRfBjF9m9tkVnfzT8Q7d
         7VkLhf/GRDDq3xqne5D+ZwsgqbHO7QNxA/NDhNd2F1tOKRFrzF5AR4x9vUPFKFJFYZIB
         84dByNsbH22m+jzKZ3AXADmGAfewdDBKH80X7EN7JdfYNnFeEiW3kqUcwU+OXeBA6vS6
         BLggMA/zPmIwmRJzWziBTc9WE6Ysk4i/0Tb45X7O22AWJXXBRP+MGzRSC+Bzw/UuCi+s
         UWpeEY8nE0JdlmPCBFtqFMqMUPJHNFpuHMjVg8LG+kZu8FZq6sb3iacp9+/OX96KCufY
         9wQQ==
X-Forwarded-Encrypted: i=1; AFNElJ+QYRbf80WV3PMPZXu5z+LoKXu/f85uYYo7nzwt4wCgZzw58iU1oZ/oAF5ciA5yK7RB0MdgHoz/kBU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxBifvR+cIp7jllGEaB3ptZqJAG9mquxeoxvAEIAbBU6xsv6c1N
	H+NsY+ACTySR97GF1Dqa1OAn7ntDU9rPrwAqpZHpAUvwkXitgh0a3BnFtxOEgmx9iOV1g1hSV21
	t8PVX6A==
X-Received: from pgdh5.prod.google.com ([2002:a05:6a02:5185:b0:c79:7107:a67a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7fa8:b0:3a0:b65a:5dd1
 with SMTP id adf61e73a8af0-3b3081bfb61mr164633637.0.1779312816324; Wed, 20
 May 2026 14:33:36 -0700 (PDT)
Date: Wed, 20 May 2026 14:33:35 -0700
In-Reply-To: <621e10bdc9e297c6c600b561d8fa25c3b62968bc.camel@infradead.org>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com> <20260515191942.1892718-3-seanjc@google.com>
 <44e0d60548d317fd59895f18bd17220dfb2f834b.camel@infradead.org>
 <ag4dMc2B3JQi4vxU@google.com> <621e10bdc9e297c6c600b561d8fa25c3b62968bc.camel@infradead.org>
Message-ID: <ag4or9-9c6VZxqya@google.com>
Subject: Re: [PATCH v3 02/41] x86/tsc: Add helper to register CPU and TSC freq
 calibration routines
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	John Stultz <jstultz@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, x86@kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Michael Kelley <mhklinux@outlook.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-purgate-ID: tlsNG-33051d/1779312818-3794D938-11D3E248/0/0
X-purgate-type: clean
X-purgate-size: 4426
X-Spamd-Result: default: False [-0.59 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dwmw2@infradead.org,m:kas@kernel.org,m:pbonzini@redhat.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:dave.hansen@linux.intel.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:tglx@kernel.org,m:jstultz@google.com,m:rick.p.edgecombe@intel.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:x86@kernel.org,m:linux-coco@lists.linux.dev,m:kvm@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:mhklinux@outlook.com,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:tglx@linutronix.de,s:lists@lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,microsoft.com,broadcom.com,siemens.com,linux.intel.com,infradead.org,suse.com,google.com,intel.com,oracle.com,lists.linux.dev,vger.kernel.org,lists.xenproject.org,outlook.com,amd.com,linutronix.de];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_TWELVE(0.00)[34];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: A7CC359B052
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gV2VkLCBNYXkgMjAsIDIwMjYsIERhdmlkIFdvb2Rob3VzZSB3cm90ZToKPiBPbiBXZWQsIDIw
MjYtMDUtMjAgYXQgMTM6NDQgLTA3MDAsIFNlYW4gQ2hyaXN0b3BoZXJzb24gd3JvdGU6Cj4gPiAK
PiA+ICvCoMKgwqDCoMKgwqAgLyoKPiA+ICvCoMKgwqDCoMKgwqDCoCAqIElmIHRoZSBUU0MgY291
bnRzIGF0IGEgY29uc3RhbnQgZnJlcXVlbmN5IGFjcm9zcyBQL1Qgc3RhdGVzLCBjb3VudHMKPiA+
ICvCoMKgwqDCoMKgwqDCoCAqIGluIGRlZXAgQy1zdGF0ZXMsIGFuZCB0aGUgVFNDIGhhc24ndCBi
ZWVuIG1hcmtlZCB1bnN0YWJsZSwgdHJlYXQgdGhlCj4gPiArwqDCoMKgwqDCoMKgwqAgKiBUU0Mg
cmVsaWFibGUsIGFzIGd1YXJhbnRlZWQgYnkgS1ZNLsKgIE5vdGUsIHRoZSBUU0MgdW5zdGFibGUg
Y2hlY2sKPiA+ICvCoMKgwqDCoMKgwqDCoCAqIGV4aXN0cyBwdXJlbHkgdG8gaG9ub3IgdGhlIFRT
QyBiZWluZyBtYXJrZWQgdW5zdGFibGUgdmlhIGNvbW1hbmQKPiA+ICvCoMKgwqDCoMKgwqDCoCAq
IGxpbmUsIGFueSBydW50aW1lIGRldGVjdGlvbiBvZiBhbiB1bnN0YWJsZSB3aWxsIGhhcHBlbiBh
ZnRlciB0aGlzLgo+ID4gK8KgwqDCoMKgwqDCoMKgICovCj4gPiArwqDCoMKgwqDCoMKgIGlmIChi
b290X2NwdV9oYXMoWDg2X0ZFQVRVUkVfQ09OU1RBTlRfVFNDKSAmJgo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgIGJvb3RfY3B1X2hhcyhYODZfRkVBVFVSRV9OT05TVE9QX1RTQykgJiYKPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoCAhY2hlY2tfdHNjX3Vuc3RhYmxlKCkpCj4gICAgIHsgCj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0c2NfcHJvcGVydGllcyA9IFRTQ19GUkVRX0tO
T1dOX0FORF9SRUxJQUJMRTsKPiAKPiAgICAga3ZtY2xvY2sgPSAwOyAvKiBXaHkgdXNlIGl0IGlm
IHRoZSBUU0Mgd29ya3M/IFRoZSBrdm1jbG9jayBleGlzdHMKPiAgICAgICAgICAgICAgICAgICAg
ICAqcHVyZWx5KiB0byB3b3JrIGFyb3VuZCBhIFRTQyB3aGljaCAqZG9lc24ndCoKPiAgICAgICAg
ICAgICAgICAgICAgICBoYXZlIHRob3NlIHByb3BlcnRpZXMgY2hlY2tlZCBhYm92ZS4gKi8KCmt2
bWNsb2NrIHN0aWxsIHByb3ZpZGVzIFNZU1RFTV9USU1FIGFuZCBXQUxMX0NMT0NLIDotLwoKPiAg
ICAgfQo+IAo+IEkgd2FzIGdvaW5nIHRvIHNheSBQVkNMT0NLX1RTQ19TVEFCTEVfQklULCBhbmQg
bWF5YmUgd2Ugc2hvdWxkIGNoZWNrCj4gdGhhdCAqdG9vKiBmb3IgcGFyYW5vaWE/CgpObz8gUFZD
TE9DS19UU0NfU1RBQkxFIGlzIHByb3BlcnR5IG9mIGt2bWNsb2NrIG1vcmUgdGhhbiBpdCdzIGEg
cHJvcGVydHkgb2YgdGhlClRTQyBpdHNlbGYuICBBbmQgZm9yIHRoZSBuby1rdm1jbG9jayBjYXNl
LCB3ZSBtb3N0IGRlZmluaXRlbHkgZG9uJ3Qgd2FudCB0byBzZXR1cAprdm1jbG9jayBqdXN0IHRv
IHF1ZXJ5IHRoYXQgZmxhZy4KCj4gQnV0IGhvcGVmdWxseSB0aGUgY2hlY2tzIHlvdSBoYXZlIGFi
b3ZlIGFyZSBlcXVpdmFsZW50PwoKVGhleSBhcmVuJ3QgYXMgcGFyYW5vaWQsIGJ1dCBpZiB0aGUg
aG9zdCBlbnVtZXJhdGVzIENPTlNUQU5UK05PTlNUT1AgVFNDIGRlc3BpdGUKS1ZNLXRoZS1ob3N0
IG5vdCBiZWluZyBhYmxlIHRvIGFkdmVydGlzZSBQVkNMT0NLX1RTQ19TVEFCTEVfQklULCB0aGVu
IHRoZSBWTU0gZG9uZQptZXNzZWQgdXAuCgo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoCBrdm1fdHNj
X2toel9jcHVpZCA9IGt2bV9wYXJhX3RzY19raHooKTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqAg
LyoKPiA+ICvCoMKgwqDCoMKgwqDCoCAqIElmIHByb3ZpZGVkLCB1c2UgdGhlIFRTQyAoYW5kIEFQ
SUMgYnVzKSBmcmVxdWVuY3kgcHJvdmlkZWQgaW4gS1ZNJ3MKPiA+ICvCoMKgwqDCoMKgwqDCoCAq
IFBWIENQVUlEIGxlYWYgZXZlbiBpZiBrdm1jbG9jayBpdHNlbGYgaXMgZGlzYWJsZWQgdmlhIGNv
bW1hbmQgbGluZS4KPiA+ICvCoMKgwqDCoMKgwqDCoCAqIFRoZSBQViBDUFVJRCBpbmZvcm1hdGlv
biBpc24ndCBkZXBlbmRlbnQgb24ga3ZtY2xvY2sgaW4gYW55IHdheSwgYW5kCj4gPiArwqDCoMKg
wqDCoMKgwqAgKiBpbiBmYWN0IHVzaW5nIHRoZSBwcmVjaXNlIGluZm9ybWF0aW9uIGlzICptb3Jl
KiBpbXBvcnRhbnQgd2hlbiB0aGUKPiA+ICvCoMKgwqDCoMKgwqDCoCAqIHVzZXIgaGFzIGV4cGxp
Y2l0bHkgZGlzYWJsZWQga3ZtY2xvY2sgdG8gZm9yY2UgdGhlIGtlcm5lbCB0byB1c2UgdGhlCj4g
PiArwqDCoMKgwqDCoMKgwqAgKiBUU0MgYXMgaXRzIGNsb2Nrc291cmNlLgo+ID4gK8KgwqDCoMKg
wqDCoMKgICovCj4gPiArwqDCoMKgwqDCoMKgIGlmICgha3ZtY2xvY2spIHsKPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChrdm1fdHNjX2toel9jcHVpZCkKPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0c2NfcmVnaXN0ZXJfY2FsaWJy
YXRpb25fcm91dGluZXMoa3ZtX2dldF90c2Nfa2h6LAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAga3ZtX2dldF9jcHVfa2h6LAo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
dHNjX3Byb3BlcnRpZXMpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
Owo+ID4gK8KgwqDCoMKgwqDCoCB9Cj4gPiArCj4gCj4gCj4gUmVnYXJkbGVzcyBvZiB0aGUgYWJv
dmUsIHdoeSBub3QganVzdCByZWdpc3RlciB0aGVzZSBoZXJlCj4gdW5jb25kaXRpb25hbGx5LCBh
bmQgcmVtb3ZlIHRoZSBsYXRlciBjYWxsIHRoYXQgZG9lcyB0aGUgc2FtZT8KCkJlY2F1c2UgaWYg
a3ZtY2xvY2s9biwgaXQncyBvbmx5IHNhZmUgdG8gY2FsbCBrdm1fZ2V0X3RzY19raHooKSBpZiBr
dm1fdHNjX2toel9jcHVpZAppcyBub24temVybywgb3RoZXIgd2lzZSB0aGUgImVsc2UiIHBhdGgg
d2lsbCBoaXQgYSBOVUxMIHBvaW50ZXIgZGVyZWYgd2hlbiB0cnlpbmcKdG8gZ2V0IHRoZSBmcmVx
dWVuY3kgZnJvbSB0aGUgUFYgY2xvY2sgc3RydWN0OgoKCXJldHVybiBrdm1fdHNjX2toel9jcHVp
ZCA/IDogcHZjbG9ja190c2Nfa2h6KHRoaXNfY3B1X3B2dGkoKSk7Cg==

