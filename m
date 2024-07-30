Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EB79410AE
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 13:38:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767636.1178315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYlBD-0005lt-DX; Tue, 30 Jul 2024 11:38:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767636.1178315; Tue, 30 Jul 2024 11:38:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYlBD-0005iw-Af; Tue, 30 Jul 2024 11:38:11 +0000
Received: by outflank-mailman (input) for mailman id 767636;
 Tue, 30 Jul 2024 11:38:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P4le=O6=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sYlBB-0005iq-C8
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 11:38:09 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fb14f7b-4e68-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 13:38:07 +0200 (CEST)
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1722339476675366.8932505596366;
 Tue, 30 Jul 2024 04:37:56 -0700 (PDT)
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
X-Inumbo-ID: 2fb14f7b-4e68-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; t=1722339483; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Jjbtz1/mxkRYC7/0pPTRdgwgzpsVoOSCWgetmM3yKCGOLSm+MLYNH6fKsH2eWNbNnDAD+DreyoAHDElBT4IMR7VdpoIErts2MWPyJXQ89QLzEuAIpiMRrYJh47xpUpPCwufwBy3TK5QM7m9PSetZ5Pa079OBhxszQt4jZp8/vkQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1722339483; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PvnRetwX0f8CpuOHuXbaTB1vKIy4u7RL8rIG58UWOUU=; 
	b=VdCNngthCF+kePiuJVN1k4sol58Wh7uHsQz+DgJnE/EJHMZE+yhfaOkQosqJ+lk0jtPKVhlod59H1nKRta/ohkGS+GB+ZJBtq+KX5hMLumpgKHKAQcQApz9FHxzxb54bSXF0L3CyiWisVG+elGAuQFF1VNJNA5yHfBP/x9jvrhs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1722339483;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=PvnRetwX0f8CpuOHuXbaTB1vKIy4u7RL8rIG58UWOUU=;
	b=de8vYL2q8yuAl9GJtjZG2pL5NBoO+bdVfMLKxp7XG/X8CrdBjRiTgNr2wnsc90gY
	Z/I1I5Y9P+r66y9Ms/KW/hHbA3FzDCpyEOoXhgQJd6FJArQfpQ0qabEdy6mFWst+lIq
	PLspf8rVnBDq3rq0qi9/E1StKP+I5gJ3YarGIHFI=
Date: Tue, 30 Jul 2024 07:37:56 -0400
From: Daniel Smith <dpsmith@apertussolutions.com>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Andrew Cooper" <andrew.cooper3@citrix.com>,
	"Julien Grall" <julien@xen.org>,
	"Stefano Stabellini" <sstabellini@kernel.org>
Message-ID: <191036ec4af.b419d861552194.691516900344490021@apertussolutions.com>
In-Reply-To: <d7289554-258b-4f75-858b-64005e9ae9be@suse.com>
References: <d7289554-258b-4f75-858b-64005e9ae9be@suse.com>
Subject: Re: [PATCH] SUPPORT.md: split XSM from Flask
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

---- On Tue, 30 Jul 2024 06:57:08 -0400 Jan Beulich  wrote ---

 > XSM is a generic framework, which in particular is also used by SILO. 
 > With this it can't really be experimental: Arm enables SILO by default. 
 >  
 > Signed-off-by: Jan Beulich jbeulich@suse.com> 
 >  
 > --- a/SUPPORT.md 
 > +++ b/SUPPORT.md 
 > @@ -768,13 +768,20 @@ Compile time disabled for ARM by default 
 >  
 >  Status, x86: Supported, not security supported 
 >  
 > -### XSM & FLASK 
 > +### XSM 
 > + 
 > +    Status: Supported 
 > + 
 > +See below for use with FLASK and SILO.  The dummy implementation is covered here 
 > +as well. 
 > + 
 > +### XSM + FLASK 

To me it would make more sense to say XSM FLASK Policy than XSM + FLASK.

 >  Status: Experimental 
 >  
 >  Compile time disabled by default. 
 >  
 > -Also note that using XSM 
 > +Also note that using FLASK 
 >  to delegate various domain control hypercalls 
 >  to particular other domains, rather than only permitting use by dom0, 
 >  is also specifically excluded from security support for many hypercalls. 
 > @@ -787,6 +794,10 @@ Please see XSA-77 for more details. 
 >  The default policy includes FLASK labels and roles for a "typical" Xen-based system 
 >  with dom0, driver domains, stub domains, domUs, and so on. 
 >  
 > +### XSM + SILO 

Same here, XSM SILO Policy.

 > +    Status: Supported 
 > + 
 >  ## Virtual Hardware, Hypervisor 
 >  
 >  ### x86/Nested PV 
 > 

v/r,
dps

