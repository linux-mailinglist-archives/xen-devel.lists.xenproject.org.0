Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DFA94107D
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 13:30:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767627.1178305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYl2y-0003Vq-Jk; Tue, 30 Jul 2024 11:29:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767627.1178305; Tue, 30 Jul 2024 11:29:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYl2y-0003Ta-Gq; Tue, 30 Jul 2024 11:29:40 +0000
Received: by outflank-mailman (input) for mailman id 767627;
 Tue, 30 Jul 2024 11:29:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P4le=O6=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sYl2w-0003S4-Ej
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 11:29:38 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fed7585d-4e66-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 13:29:35 +0200 (CEST)
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1722338963377848.0522511693326;
 Tue, 30 Jul 2024 04:29:23 -0700 (PDT)
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
X-Inumbo-ID: fed7585d-4e66-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; t=1722338970; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Rgq9EhtoexiuQDu1Fbnu8DGiodgcmVVjR5NbtTJHC+wgGChb7KVzuBvGohQRcwF/3jdNodpnLFY7gO4BCgwW5AVTvKxs9OIoke8p+Pfh8ovFuTd95D/IrPOtyDchyGbB4E6T5Cwr5heZ4FrYpGY6NpeJ3B0V25m6+A1kjHrgB/I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1722338970; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3n0fFlr23F33EHRPuG52P3Z9RgdRTwzGTNI2w+2PThs=; 
	b=Ax/BKP3OP72pqMfv/3C0rPb1xBatb4B7owOEAy9catvZ9XPrVZm62328JdGh7MDUE+LJj9Z/OceQ9J2Elb/iOhGn3rArhOs029KqDBHCYw3VsPpP9QPfP/i+kvc84Yu29lC/T7goCn77Y4tn84wdO7VX3YrCEjHRflnHguVXwv0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1722338970;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=3n0fFlr23F33EHRPuG52P3Z9RgdRTwzGTNI2w+2PThs=;
	b=nFexUMmr2L/a+oijKOzxMBfF74GIDT5bP8T91fo8wlr+2wCJArJP6czPV/Dg0Y93
	BzF/wvCrxKceTKDuSuX+W1mpcLFaxcK7z1zZib5rSRxqoK3mfOBdVSEi2XhfGls5UWN
	/lssIk7ArHdnZ5IrYw9/Zb1DE0vDYM0E+Kg4GJPg=
Date: Tue, 30 Jul 2024 07:29:23 -0400
From: Daniel Smith <dpsmith@apertussolutions.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
Cc: "Xen-devel" <xen-devel@lists.xenproject.org>,
	"Ross Lagerwall" <ross.lagerwall@citrix.com>,
	"Jan Beulich" <JBeulich@suse.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>,
	"Julien Grall" <julien@xen.org>
Message-ID: <1910366ef2d.eeaec081551070.1936079822786945233@apertussolutions.com>
In-Reply-To: <20240729162651.571991-1-andrew.cooper3@citrix.com>
References: <20240729162651.571991-1-andrew.cooper3@citrix.com>
Subject: Re: [PATCH] XSM/domctl: Fix permission checks on
 XEN_DOMCTL_createdomain
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

---- On Mon, 29 Jul 2024 12:26:51 -0400 Andrew Cooper  wrote ---

 > The XSM checks for XEN_DOMCTL_createdomain are problematic.  There's a split 
 > between xsm_domctl() called early, and flask_domain_create() called quite late 
 > during domain construction. 
 >  
 > All XSM implementations except Flask have a simple IS_PRIV check in 
 > xsm_domctl(), and operate as expected when an unprivileged domain tries to 
 > make a hypercall. 
 >  
 > Flask however foregoes any action in xsm_domctl() and defers everything, 
 > including the simple "is current permitted to create a a domain" check, to 
 > flask_domain_create(). 
 >  
 > As a conseqeuence, when XSM Flask is active, and irrespective of the policy 
 > loaded, all domains irrespective of privilege can: 
 >  
 >  * Mutate the global 'rover' variable, used to track the next free domid. 
 >  Therefore, all domains can cause a domid wraparound, and combined with a 
 >  volentary reboot, choose their own domid. 
 >  
 >  * Cause a reasonable amount of a domain to be constructed before ultimately 
 >  failing for permission reasons, including the use of settings outside of 
 >  supported limits. 
 >  
 > In order to remedate this, pass the ssidref into xsm_domctl() and at least 
 > check that the calling domain privileged enough to create domains. 
 >  
 > This issue has not been assigned an XSA, because Flask is experimental and not 
 > security supported. 
 >  
 > Reported-by: Ross Lagerwall ross.lagerwall@citrix.com> 
 > Signed-off-by: Andrew Cooper andrew.cooper3@citrix.com> 
 > --- 
 
Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

