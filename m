Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yH20FLqQEGqIZgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 19:22:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F385B81A6
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 19:22:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1317158.1586399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQTZH-0004mX-0v; Fri, 22 May 2026 17:21:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1317158.1586399; Fri, 22 May 2026 17:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQTZG-0004ku-UI; Fri, 22 May 2026 17:21:50 +0000
Received: by outflank-mailman (input) for mailman id 1317158;
 Fri, 22 May 2026 17:21:49 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3qZAQagYKCWQUGCPLEIQQING.EQOZGP-FGXGNNKUVU.ZGPRTQLGEV.QTI@flex--seanjc.bounces.google.com>)
 id 1wQTZF-0004jV-5s
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 17:21:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQTZE-007Lgu-It
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 19:21:48 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3qZAQagYKCWQUGCPLEIQQING.EQOZGP-FGXGNNKUVU.ZGPRTQLGEV.QTI@flex--seanjc.bounces.google.com>)
 id 6a10905c-5cb7-0a2a0a5109dd-0a2a4501eaa2-48
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 19:21:48 +0200
Received: from [209.85.210.201] (helo=mail-pf1-f201.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3qZAQagYKCWQUGCPLEIQQING.EQOZGP-FGXGNNKUVU.ZGPRTQLGEV.QTI@flex--seanjc.bounces.google.com>)
 id 6a1090ab-c1f2-0a2a45010019-d155d2c9bcbc-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 19:21:48 +0200
Received: by mail-pf1-f201.google.com with SMTP id
 d2e1a72fcca58-82f74bcfb86so9401362b3a.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 10:21:47 -0700 (PDT)
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
        d=google.com; s=20251104; t=1779470505; x=1780075305; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j7PDgeJ1DRC6yA0ExvIeovoOboeWG72MkykGKDF6slU=;
        b=OyUwBIZ+QAmfUbUz9ZVcYqWGnXbAuujC20+Emue6ycGmEWHZbcd1ZOKHZax8w45Gzy
         CHKSuZGfJjoZ4JmxSypTbgmFqzi4sUfnfxOQoWlHs7bnYt1/mY/siP89P+ADoYf7CI9T
         nun5JzxzvdWd8sQt6tqtcfbVpNs+wXq6xzOkSBbaXlItOlFFAv7LZZB0TgYki+unWBXc
         dmsm/fht7b+EBC7xdSA6ztR6vgpcP/tktiUPUUzZTblzp6lhHGxy+SiK8yvw5Y77Xx8v
         X+W8NahY60kgSJOuTXzoatQQcB4bmiVTI6AfW8xGNcaHLt+2VAQ8CtRo61HYFAAOZ4vW
         qVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779470505; x=1780075305;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j7PDgeJ1DRC6yA0ExvIeovoOboeWG72MkykGKDF6slU=;
        b=Bkpoqucy6XrOLrTLmjudH1va4OTRtRkOcHjVeDQChBU1RrnjDLQfsOEMzWESM2lqwi
         cgZaFYwi9BSq6Sp1LOXGVlNXkcGqyi8guPibqgUBw9k6kIF5MYi7PGIzjqKHbDb+gPce
         ld9Qamc9+2oPP+/t5C9m1RcJGv+CBjEnCE136M0d2vrX14IBom8i6xrr6a5O+2AZ5nrW
         HanKRLi+STvWe0QCaA1YD/Qe5DPPNWD8xbdYQ2slC504QYsVJwYrnt4z8ghWVIhYwrqt
         Ia+LGkkv4IZyWp/v9c5pNtMMzuCN5n5cc6yVD9xp4//p3aYpOj6OAtfs+SMgl/Q8vROh
         VZYg==
X-Forwarded-Encrypted: i=1; AFNElJ9l+BWRGWlkejFri2PioajNH3ecsN7cpm/skJgk7AOd4REtEkseVTxDc4Kl0dpKBVU9r7qNezepR3E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YybPrBm47lNtTgHCkz1jdF/QW0nrtznTalOm/59BOeuiUlADjhV
	pIN8zbCcMdMQgbYpK8Roh1pPhN4jC5Xgjc+Jo1Zwrocw2uQfbmwTwBIvMqwCv0PXH16rJUvYo5b
	9NiGBgQ==
X-Received: from pfbgv6.prod.google.com ([2002:a05:6a00:4e86:b0:82f:86c3:55ba])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3004:b0:82f:721f:10ea
 with SMTP id d2e1a72fcca58-8415f17de74mr4765703b3a.18.1779470505093; Fri, 22
 May 2026 10:21:45 -0700 (PDT)
Date: Fri, 22 May 2026 10:21:26 -0700
In-Reply-To: <c4b498c401287477402ddd60a0120b0c5a9bf8d3.camel@infradead.org>
Mime-Version: 1.0
References: <20260509224824.3264567-1-dwmw2@infradead.org> <20260509224824.3264567-28-dwmw2@infradead.org>
 <3ad6cd109480772ade3c11f23b9c1d7a9855d67e.camel@infradead.org>
 <ag-Hf2liLSX9q0rS@google.com> <ab84153e33fbe7c25667f595c56b310d4d5a93ef.camel@infradead.org>
 <ahBQ7mXNaTtouT3C@google.com> <c4b498c401287477402ddd60a0120b0c5a9bf8d3.camel@infradead.org>
Message-ID: <ahCQluJj59uWlDAF@google.com>
Subject: Re: [PATCH v4 27/30] KVM: x86: Add KVM_VCPU_TSC_EFFECTIVE_FREQ attribute
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Paul Durrant <paul@xen.org>, 
	Jonathan Cameron <jic23@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, Jack Allister <jalliste@amazon.com>, 
	Dongli Zhang <dongli.zhang@oracle.com>, joe.jin@oracle.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d62444/1779470508-AE95FFF4-7F2A958F/0/0
X-purgate-type: clean
X-purgate-size: 494
X-Spamd-Result: default: False [-0.69 / 15.00];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dwmw2@infradead.org,m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:vkuznets@redhat.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:paul@xen.org,m:jic23@kernel.org,m:Sascha.Bischoff@arm.com,m:maz@kernel.org,m:joey.gouly@arm.com,m:jalliste@amazon.com,m:dongli.zhang@oracle.com,m:joe.jin@oracle.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.808];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 13F385B81A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026, David Woodhouse wrote:
> On Fri, 2026-05-22 at 05:49 -0700, Sean Christopherson wrote:
> >=20
> > Oh, that's just an oversight, definitely not intentional.=C2=A0 Easy en=
ough to fix:
>=20
> Want me to roll that into the series? As you eloquently put it the
> other day, what's one more patch...?

I'll send a standalone patch, along with a selftest tweak to verify the fix=
.
It's technically a fix and won't generate any conflicts, no reason to delay=
 it.

