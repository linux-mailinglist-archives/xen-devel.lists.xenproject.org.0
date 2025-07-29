Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F902B14D31
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 13:50:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062558.1428278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugiqV-00015f-Vz; Tue, 29 Jul 2025 11:50:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062558.1428278; Tue, 29 Jul 2025 11:50:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugiqV-00012g-T7; Tue, 29 Jul 2025 11:50:15 +0000
Received: by outflank-mailman (input) for mailman id 1062558;
 Tue, 29 Jul 2025 11:50:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oL40=2K=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1ugiqU-0000J6-AM
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 11:50:14 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e5bfbfa-6c72-11f0-a31e-13f23c93f187;
 Tue, 29 Jul 2025 13:50:12 +0200 (CEST)
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1753789801162931.3000812041274;
 Tue, 29 Jul 2025 04:50:01 -0700 (PDT)
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
X-Inumbo-ID: 2e5bfbfa-6c72-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; t=1753789808; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Mf+9yjxIxx0iDhtiJSNcBsx6qFLc0C39gj/Ev0kYOCr5gVMXBjgPsGfi+8YF1HYYDE2cv5Pj3Vj0u9gLAoGSS1qJHfEVMQMqfHlgNlY/kfRgEMzK6OmqrDBPIe6Vi+YSVQ2KtPmMYLFmyEl3Y84Y3lvXw4Z19k1VMsGH9SdyCwE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753789808; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+otM7J7Q6D11QZQDrexjucgvnI6wC6/XFPkg5ip/o4A=; 
	b=RcxJgZ7csI06rou7BlKgaq6gXiw8cgy7mGp8Ur7431BZnQr4F9M7Q+ZFauKrtfiDI73Fz8SjLgF8gQHxaQTSV8xwqzQzhyksG+xYcq79jFgoHySovEB29cOnc9AdDwdtNTHJx9oPOmANYM8rbf29FhQhk2HnRJjv5uHuFUURxG0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753789808;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=+otM7J7Q6D11QZQDrexjucgvnI6wC6/XFPkg5ip/o4A=;
	b=HUtJnDK921nvNCbUrrqCwTQdNuyW833MAJUuF8RFybRdAQDc+xGsv8xIgeVL85gP
	T5lTLlCA7OKToqgzY0+IbY3WuJYqMMB/gFtiArBUAeXlhgVv0JjRNhVWrPj4ArbIrOJ
	jikyaQqNc4kZiiWdc/ephk65nAav1pr4gg7D5U34=
Date: Tue, 29 Jul 2025 07:50:01 -0400
From: Daniel Smith <dpsmith@apertussolutions.com>
To: "Xen-devel" <xen-devel@lists.xenproject.org>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>
Message-ID: <1985604a2af.cf55e6cc33532.4694018676843781612@apertussolutions.com>
In-Reply-To: <20250728175548.3199177-3-andrew.cooper3@citrix.com>
References: <20250728175548.3199177-1-andrew.cooper3@citrix.com> <20250728175548.3199177-3-andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/3] tools/flask: Use tabs uniformly
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

---- On Mon, 28 Jul 2025 13:55:47 -0400 Andrew Cooper <andrew.cooper3@citrix.com> wrote ---

 > Most indentation is with tabs, but a few spaces have slipped in.  Switch them 
 > back to tabs. 
 >  
 > No functional change. 
 >  
 > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com> 
 > --- 
 > CC: Daniel P. Smith <dpsmith@apertussolutions.com> 
 > --- 
 >  tools/flask/policy/modules/xen.if | 28 ++++++++++++++-------------- 
 >  1 file changed, 14 insertions(+), 14 deletions(-) 
 >  
 > diff --git a/tools/flask/policy/modules/xen.if b/tools/flask/policy/modules/xen.if 
 > index cff51febbfdf..cfa11b27b786 100644 
 > --- a/tools/flask/policy/modules/xen.if 
 > +++ b/tools/flask/policy/modules/xen.if 
 > @@ -95,7 +95,7 @@ define(`manage_domain', ` 
 >              getaddrsize pause unpause trigger shutdown destroy 
 >              setaffinity setdomainmaxmem getscheduler resume 
 >              setpodtarget getpodtarget getpagingmempool setpagingmempool }; 
 > -    allow $1 $2:domain2 { set_vnumainfo dt_overlay get_domain_state }; 
 > +    allow $1 $2:domain2 { set_vnumainfo dt_overlay get_domain_state }; 
 >  ') 
 >  
 >  # migrate_domain_out(priv, target) 
 > @@ -182,9 +182,9 @@ define(`make_device_model', ` 
 >  #   Allow a device to be used by a domain 
 >  #   only if an IOMMU provides isolation. 
 >  define(`use_device_iommu', ` 
 > -    allow $1 $1_self:mmu exchange; 
 > -    allow $1 $2:resource use_iommu; 
 > -    allow $1 domio_t:mmu { map_read map_write }; 
 > +    allow $1 $1_self:mmu exchange; 
 > +    allow $1 $2:resource use_iommu; 
 > +    allow $1 domio_t:mmu { map_read map_write }; 
 >  ') 
 >  
 >  # use_device_iommu_nointremap(domain, device) 
 > @@ -193,30 +193,30 @@ define(`use_device_iommu', ` 
 >  #   interrupt remapping. 
 >  #   Allows acceptance of (typically older) less isolating hardware. 
 >  define(`use_device_iommu_nointremap', ` 
 > -    allow $1 $1_self:mmu exchange; 
 > -    allow $1 $2:resource { use_iommu use_iommu_nointremap }; 
 > -    allow $1 domio_t:mmu { map_read map_write }; 
 > +    allow $1 $1_self:mmu exchange; 
 > +    allow $1 $2:resource { use_iommu use_iommu_nointremap }; 
 > +    allow $1 domio_t:mmu { map_read map_write }; 
 >  ') 
 >  
 >  # use_device_noiommu(domain, device) 
 >  #   Allow a device to be used by a domain 
 >  #   even without an IOMMU available. 
 >  define(`use_device_noiommu', ` 
 > -    allow $1 $1_self:mmu exchange; 
 > -    allow $1 $2:resource { use_iommu use_iommu_nointremap use_noiommu }; 
 > -    allow $1 domio_t:mmu { map_read map_write }; 
 > +    allow $1 $1_self:mmu exchange; 
 > +    allow $1 $2:resource { use_iommu use_iommu_nointremap use_noiommu }; 
 > +    allow $1 domio_t:mmu { map_read map_write }; 
 >  ') 
 >  
 >  # admin_device(domain, device) 
 >  #   Allow a device to be used and delegated by a domain 
 >  define(`admin_device', ` 
 > -    allow $1 $2:resource { setup stat_device add_device add_irq add_iomem add_ioport remove_device remove_irq remove_iomem remove_ioport plug unplug }; 
 > -    allow $1 $2:hvm bind_irq; 
 > -    use_device_noiommu($1, $2) 
 > +    allow $1 $2:resource { setup stat_device add_device add_irq add_iomem add_ioport remove_device remove_irq remove_iomem remove_ioport plug unplug }; 
 > +    allow $1 $2:hvm bind_irq; 
 > +    use_device_noiommu($1, $2) 
 >  ') 
 >  
 >  # delegate_devices(priv-domain, target-domain) 
 >  #   Allow devices to be delegated 
 >  define(`delegate_devices', ` 
 > -    allow $1 $2:resource { add remove }; 
 > +    allow $1 $2:resource { add remove }; 
 >  ') 
 > -- 
 > 2.39.5 
 >  
 > 

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

