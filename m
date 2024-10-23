Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7999AC9DE
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 14:18:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824573.1238722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3aJE-0005rF-Gq; Wed, 23 Oct 2024 12:17:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824573.1238722; Wed, 23 Oct 2024 12:17:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3aJE-0005of-DM; Wed, 23 Oct 2024 12:17:52 +0000
Received: by outflank-mailman (input) for mailman id 824573;
 Wed, 23 Oct 2024 12:17:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fY0y=RT=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t3aJC-0005OV-On
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 12:17:50 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d12b29f1-9138-11ef-a0be-8be0dac302b0;
 Wed, 23 Oct 2024 14:17:50 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729685863937207.6817537583679;
 Wed, 23 Oct 2024 05:17:43 -0700 (PDT)
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
X-Inumbo-ID: d12b29f1-9138-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729685866; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lXmJwkS5saeVVXA/7500vEy+1vlwGtharkgdZrnnU5YrV+WtDFplX495+C61y+FIM6mhU6fd06iHwrgh0wGWfufLPv1WeoE5lhpepIUbC8Xk5KfbedlJFcAP0A7nBH2+Goy4qbaS+fk9RKI23hTE9Y2Svkp7PZp02F9t45oIOc8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729685866; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nsYRcxEwQNvIFdBbeHj5AUDgtQYtwh7S25UWp9VhVV8=; 
	b=O4k5NFAqVcwwB9nyGMEQNK3YTyP+Fbj8fJ8+nOFwon4mVftkO5lCIX9r/lCXSlzn1ULpZ/pl95hgHfxaagBmHhVs71Q9bvcbA7CLJl3YWfjUi+GvREutfBQpFFBnzB1Pfjr9m4IMBDnpQndUXUTme6KHpS5giP3K0+KMh/n3ucs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729685866;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=nsYRcxEwQNvIFdBbeHj5AUDgtQYtwh7S25UWp9VhVV8=;
	b=J2FNvzS8HTurMcAuA0B8MjQAuWguig6q5ZDMDbUW2mHZXNdAcaPaSdRpsxQw6O6A
	W6wzDlebVEco82ExbdORFOlovLzhsokYgEqYqZGzJezSG00SKJulG8ARp35XXjybERa
	BwjojV5ydK1+AeBduQYS96+KR+yyMvd8wyzLIlL0=
Message-ID: <34241ea1-001d-40d8-98f1-babf7566d287@apertussolutions.com>
Date: Wed, 23 Oct 2024 08:17:42 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/boot: Fix XSM module handling during PVH boot
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241023105756.641695-1-andrew.cooper3@citrix.com>
 <20241023105756.641695-4-andrew.cooper3@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20241023105756.641695-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/23/24 06:57, Andrew Cooper wrote:
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
> 
> As detailed in commit 0fe607b2a144 ("x86/boot: Fix PVH boot during boot_info
> transition period"), the use of __va(mbi->mods_addr) constitutes a
> use-after-free on the PVH boot path.
> 
> This pattern has been in use since before PVH support was added.  This has
> most likely gone unnoticed because no-one's tried using a detached Flask
> policy in a PVH VM before.
> 
> Plumb the boot_info pointer down, replacing module_map and mbi.  Importantly,
> bi->mods[].mod is a safe way to access the module list during PVH boot.
> 
> As this is the final non-bi use of mbi in __start_xen(), make the pointer
> unusable once bi has been established, to prevent new uses creeping back in.
> This is a stopgap until mbi can be fully removed.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

