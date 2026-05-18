Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNnZJW18C2pYIQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 22:54:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 427D2573938
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 22:54:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312231.1582375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP4xP-0005Wo-IZ; Mon, 18 May 2026 20:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312231.1582375; Mon, 18 May 2026 20:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP4xP-0005UZ-FR; Mon, 18 May 2026 20:52:59 +0000
Received: by outflank-mailman (input) for mailman id 1312231;
 Mon, 18 May 2026 20:52:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3JXwLagYKCaIUGCPLEIQQING.EQOZGP-FGXGNNKUVU.ZGPRTQLGEV.QTI@flex--seanjc.bounces.google.com>)
 id 1wP4xO-0005UT-32
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 20:52:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wP4xL-00AEpq-OM
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 22:52:55 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3JXwLagYKCaIUGCPLEIQQING.EQOZGP-FGXGNNKUVU.ZGPRTQLGEV.QTI@flex--seanjc.bounces.google.com>)
 id 6a0b7c19-5cb7-0a2a0a5109dd-0a2a450bc028-10
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 22:52:55 +0200
Received: from [209.85.214.201] (helo=mail-pl1-f201.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3JXwLagYKCaIUGCPLEIQQING.EQOZGP-FGXGNNKUVU.ZGPRTQLGEV.QTI@flex--seanjc.bounces.google.com>)
 id 6a0b7c26-212f-0a2a450b0019-d155d6c9b030-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 22:52:55 +0200
Received: by mail-pl1-f201.google.com with SMTP id
 d9443c01a7336-2bc977e6aedso25217935ad.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 13:52:55 -0700 (PDT)
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
        d=google.com; s=20251104; t=1779137573; x=1779742373; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WgO1KNL8/U9E/DVqPyF+7ERcgH8vwTkrChGAMO4svKA=;
        b=B5+wKvp5rItNKPs4txYNbzzO0jR7F+aH10rptYuucBflYIaHiDPe1rIrOXz+5wVsTf
         YucJRX1e5TGw/rPbGPMPpKGQTvQckCu8oqp+ix0VxAddATAHC75nFRC5p/HBSOlNoJzg
         ZjypzIzsgC7nDBCzG8CcWb0yPu9CSq02x6v253xpt8shRVDOOoMoB/1s7/0K6R6+YWIp
         zitnExt8P3R2KI36I1YDcry5mkKFYpL96MRIVMUTv1ubPug7nkMYlX72ju1HbDaYkG9P
         bz0sL8mu1Y+dJfp2TF+k3AVcIP++nNBDQl2ad8YiyN3V5FXNUO+Ffc39lzsgNI3gChLl
         ErUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779137573; x=1779742373;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WgO1KNL8/U9E/DVqPyF+7ERcgH8vwTkrChGAMO4svKA=;
        b=Zn//JhRlH+9y/chgwJwOFQQ+qzB87kfXHVYz6dCyFcHOIY4+JGLaUTbssAI06+q3C6
         9Pmz7L9ePgN18WVvySfodgVukXAYen5ciztdu07za+guNStm/NRI0RS0d96RZ4oat3sZ
         p0OTouZj405cgCx1XkO7q6Lol0aYve6w9qTVy+yEojlhA6bEBKBVza3IbCYAb+iKVwZ8
         8PimRFjA5HC6EJUrJsZZRRe+tUnjooDXWhng3tUczLQBZtQ9VMxmpjWPJKkleoYV4e/e
         1mL3xAaN50yuy+c+lVNAZqMHOlWEtfyivK0KGPJdpyo0yBw4El1Sx0CH7V+G7qt7r3w+
         CgNw==
X-Forwarded-Encrypted: i=1; AFNElJ/kjjpHEI7fqik5FY099Dve03JZXDSSeZgJVjuKFQgTZQb+uK0d7q0AkOgO/5WO+HFEoq88wm1hOL0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yysl/fIp0O+iTGdzm2CcenS/yl1FC15qd6K0p+JgSWjOAGW3GWt
	hGcur2bsR6rJgbPv8W+jPplVbliRjbuw1d+GjN0XH4s2QWQaKxynzxrPR/vvyhDt1Jy7gppGlxf
	tZ8aDUg==
X-Received: from plje19.prod.google.com ([2002:a17:902:ed93:b0:2bd:3dba:a4c5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:230d:b0:2bd:9803:9304
 with SMTP id d9443c01a7336-2bd980394b5mr139925665ad.39.1779137573153; Mon, 18
 May 2026 13:52:53 -0700 (PDT)
Date: Mon, 18 May 2026 13:52:52 -0700
In-Reply-To: <d3c461415e05345a9b82e6f995828c1ae64a4e61.camel@infradead.org>
Mime-Version: 1.0
References: <20260509224824.3264567-1-dwmw2@infradead.org> <20260509224824.3264567-5-dwmw2@infradead.org>
 <0ae8e471-db7a-4842-aca4-8ef643acde8b@oracle.com> <d3c461415e05345a9b82e6f995828c1ae64a4e61.camel@infradead.org>
Message-ID: <agt8JM43BlLPU-kr@google.com>
Subject: Re: [PATCH v4 04/30] KVM: x86: Add KVM_[GS]ET_CLOCK_GUEST for
 accurate KVM clock migration
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Dongli Zhang <dongli.zhang@oracle.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, x86@kernel.org, 
	Marc Zyngier <maz@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Paul Durrant <paul@xen.org>, 
	Jonathan Cameron <jic23@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>, 
	Jack Allister <jalliste@amazon.com>, Joey Gouly <joey.gouly@arm.com>, joe.jin@oracle.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
X-purgate-ID: tlsNG-42698a/1779137575-21780F3B-DB1EF56B/0/0
X-purgate-type: clean
X-purgate-size: 460
X-Spamd-Result: default: False [-0.69 / 15.00];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dwmw2@infradead.org,m:dongli.zhang@oracle.com,m:kvm@vger.kernel.org,m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:hpa@zytor.com,m:dave.hansen@linux.intel.com,m:vkuznets@redhat.com,m:x86@kernel.org,m:maz@kernel.org,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:paul@xen.org,m:jic23@kernel.org,m:Sascha.Bischoff@arm.com,m:jalliste@amazon.com,m:joey.gouly@arm.com,m:joe.jin@oracle.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_SENDER(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	ARC_NA(0.00)[];
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
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 427D2573938
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026, David Woodhouse wrote:
> On Mon, 2026-05-18 at 00:52 -0700, Dongli Zhang wrote:
> > On 5/9/26 3:46 PM, David Woodhouse wrote:
> 
> Huh, I didn't write that then; it isn't September yet. Did you mean
> 2026-05-09? We aren't all in the US... 
> 
> Strictly speaking, you just misattributed a quote of mine, which is
> very poor form :)

But also pretty darn hilarious given that the thread is all about accurate
timekeeping :-)

