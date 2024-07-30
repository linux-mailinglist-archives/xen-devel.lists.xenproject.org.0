Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 202A29411ED
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 14:32:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767728.1178425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYm0Y-0008NL-Q3; Tue, 30 Jul 2024 12:31:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767728.1178425; Tue, 30 Jul 2024 12:31:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYm0Y-0008Ke-NV; Tue, 30 Jul 2024 12:31:14 +0000
Received: by outflank-mailman (input) for mailman id 767728;
 Tue, 30 Jul 2024 12:31:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P4le=O6=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sYm0X-0008Ip-Ix
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 12:31:13 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a02044f-4e6f-11ef-bc01-fd08da9f4363;
 Tue, 30 Jul 2024 14:31:11 +0200 (CEST)
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1722342663090791.3026533651047;
 Tue, 30 Jul 2024 05:31:03 -0700 (PDT)
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
X-Inumbo-ID: 9a02044f-4e6f-11ef-bc01-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; t=1722342669; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Y0/N8YyMTs8ZjF0NNSKwdnhQv0c80A0Y6uaICWaKRnLOu1/07r4YBLBBNVq2UFKRHyF2a5uJU8Vr/MU6FnvXptiHd6FjbxVRFvrlxDmKDCn5Or8SbkwcqMOXCZ1Xqa0LLss8UEqHsb1fvWEdaSwst0x3Oay+ibkZKxTboR287FU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1722342669; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cvlg50xaFD2o0cJz53Xj8OtdSE306ZvU7oCopCMp1Gs=; 
	b=n5IC93js5BAs7hW61GT7Hi1B3N9pqmiVTOIbrSnqjM8VUUiNaUtsppc36M5KZHVX1sEZFL0i/bBS+AOFvJcrDMWGsMtjdsvTHCGSy8cyqGmLtGe2XC7GZBPq6URIyvLgkdlj3p2LsUwgKEPEdC2BoMpeCF1wA97m5b+rpZzgshI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1722342669;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=cvlg50xaFD2o0cJz53Xj8OtdSE306ZvU7oCopCMp1Gs=;
	b=K9WZL53TrdTSEfNV7SifnFrNmH9aTA9G0WvVoYIpNHhUZUVVH2bWGLmK0+YDStz1
	vGrvbhAvH/u3nzzuSRi31SSdr4Q6cHVAkPodd+cU4n7uDtpi0XYBBL+5WstCL9j6/gv
	nWEJOcCQN9eP6aP72K2vPBaSn2wRfNzCPB+Q2D8g=
Date: Tue, 30 Jul 2024 08:31:03 -0400
From: Daniel Smith <dpsmith@apertussolutions.com>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Andrew Cooper" <andrew.cooper3@citrix.com>,
	"Julien Grall" <julien@xen.org>,
	"Stefano Stabellini" <sstabellini@kernel.org>
Message-ID: <191039f639c.eee6b8a8560183.5020758529681496430@apertussolutions.com>
In-Reply-To: <67f1bcb7-8924-413f-a8ec-6a01f90e7836@suse.com>
References: <d7289554-258b-4f75-858b-64005e9ae9be@suse.com>
 <191036ec4af.b419d861552194.691516900344490021@apertussolutions.com> <67f1bcb7-8924-413f-a8ec-6a01f90e7836@suse.com>
Subject: Re: [PATCH] SUPPORT.md: split XSM from Flask
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

---- On Tue, 30 Jul 2024 08:04:09 -0400 Jan Beulich  wrote ---

 > On 30.07.2024 13:37, Daniel Smith wrote: 
 > > ---- On Tue, 30 Jul 2024 06:57:08 -0400 Jan Beulich  wrote --- 
 > > 
 > >  > XSM is a generic framework, which in particular is also used by SILO. 
 > >  > With this it can't really be experimental: Arm enables SILO by default. 
 > >  > 
 > >  > Signed-off-by: Jan Beulich jbeulich@suse.com> 
 > >  > 
 > >  > --- a/SUPPORT.md 
 > >  > +++ b/SUPPORT.md 
 > >  > @@ -768,13 +768,20 @@ Compile time disabled for ARM by default 
 > >  > 
 > >  >  Status, x86: Supported, not security supported 
 > >  > 
 > >  > -### XSM & FLASK 
 > >  > +### XSM 
 > >  > + 
 > >  > +    Status: Supported 
 > >  > + 
 > >  > +See below for use with FLASK and SILO.  The dummy implementation is covered here 
 > >  > +as well. 
 > >  > + 
 > >  > +### XSM + FLASK 
 > > 
 > > To me it would make more sense to say XSM FLASK Policy than XSM + FLASK. 
 >  
 > I thought about using "policy", but then deemed that wrong. The "Flask 
 > policy" is what you load into Flask. Whereas here we're talking about the 
 > code actually carrying out what such a policy says. 
 
The main issue I have is the "+", so I checked how the different security models/policies are referenced under LSM. The documentation I reviwed lists them as modules or security modules, e.g. AppArmor module. How about one of these combinations, FLASK Module, XSM FLASK Module, or FLASK XSM Module? And similar for SILO.

dps

