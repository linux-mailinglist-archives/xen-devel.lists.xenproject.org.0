Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57373B14D2C
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 13:50:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062553.1428268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugiq0-00087k-Nk; Tue, 29 Jul 2025 11:49:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062553.1428268; Tue, 29 Jul 2025 11:49:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugiq0-00085E-Kf; Tue, 29 Jul 2025 11:49:44 +0000
Received: by outflank-mailman (input) for mailman id 1062553;
 Tue, 29 Jul 2025 11:49:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oL40=2K=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1ugipy-000858-NI
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 11:49:42 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a77c138-6c72-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 13:49:39 +0200 (CEST)
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1753789767340736.1698463000428;
 Tue, 29 Jul 2025 04:49:27 -0700 (PDT)
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
X-Inumbo-ID: 1a77c138-6c72-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; t=1753789775; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kWdy7iARI8IaVrrQVxPpTGBdYmDA3m8jKt6oI8Uybp++UvnSHB2SdwrPDcFOmCW61SMb5qn/P2zEAWw/0PazA7QlVpqMA58tTJsMUTK8MyjHDDdIlvISxjNgT5nGwcOdMTf9QN9Z6PJb1Y3qAd8YUzOkh88dDM3jDZAzmP2S/9A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753789775; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RhBaSr9Wg6eoEIHwbBwvDAgUVK9Mri66ax95Sq9VOZ0=; 
	b=A2goidLBesXIjSgIoR3SEyAQsjXAC3zcDSV2/gHwVa1Abc+2mr67Do4wo28chL1ZbjUICyMGNSjlwqc/1nF3TP+uvToLwdjcGp1DamRECDcBKsFWjmD3xtI/K3ns7nXfee0wLbwcTD20B/oixVwAMGIjOSpPDmvSBvvQPu3IXPc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753789775;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=RhBaSr9Wg6eoEIHwbBwvDAgUVK9Mri66ax95Sq9VOZ0=;
	b=ofcKKBoS3Wcuw2BKhGt6ztBqPL6UyTpf3OVxGY2vuz+A3+FDgquc105NNT+UiFiP
	TMGgm/jvHesZs7LYwfiSwKUas51TKaVP4pFhv+Ia9ydAI0Z4+ZXA1pvo6IS+zf6ojix
	ArHZcS6rc81lIIHc0D7xRSTJNAugOy72/sp3LC0w=
Date: Tue, 29 Jul 2025 07:49:27 -0400
From: Daniel Smith <dpsmith@apertussolutions.com>
To: "Xen-devel" <xen-devel@lists.xenproject.org>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>
Message-ID: <19856041e0d.eb7d35a733490.6468480893266904954@apertussolutions.com>
In-Reply-To: <20250728175548.3199177-2-andrew.cooper3@citrix.com>
References: <20250728175548.3199177-1-andrew.cooper3@citrix.com> <20250728175548.3199177-2-andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/3] tools/flask: Strip trailing whitespace
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

---- On Mon, 28 Jul 2025 13:55:46 -0400 Andrew Cooper <andrew.cooper3@citrix.com> wrote ---

 > No functional change. 
 >  
 > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com> 
 > --- 
 > CC: Daniel P. Smith <dpsmith@apertussolutions.com> 
 > --- 
 >  tools/flask/policy/modules/modules.conf           | 2 +- 
 >  tools/flask/policy/modules/vm_role.cons           | 4 ++-- 
 >  tools/flask/policy/policy/mls                     | 2 +- 
 >  tools/flask/policy/policy/support/misc_macros.spt | 2 +- 
 >  4 files changed, 5 insertions(+), 5 deletions(-) 
 >  
 > diff --git a/tools/flask/policy/modules/modules.conf b/tools/flask/policy/modules/modules.conf 
 > index 6dba0a3d9172..1b6975551ab4 100644 
 > --- a/tools/flask/policy/modules/modules.conf 
 > +++ b/tools/flask/policy/modules/modules.conf 
 > @@ -42,7 +42,7 @@ xenstore = on 
 >  all_system_role = on 
 >  
 >  # Example users, roles, and constraints for user-based separation. 
 > -# 
 > +# 
 >  # The three users defined here can set up grant/event channel communication 
 >  # (vchan, device frontend/backend) between their own VMs, but cannot set up a 
 >  # channel to a VM under a different user. 
 > diff --git a/tools/flask/policy/modules/vm_role.cons b/tools/flask/policy/modules/vm_role.cons 
 > index 3847ec1afa4e..ac38217f4641 100644 
 > --- a/tools/flask/policy/modules/vm_role.cons 
 > +++ b/tools/flask/policy/modules/vm_role.cons 
 > @@ -3,7 +3,7 @@ 
 >  # 
 >  # constrain class_set perm_set expression ; 
 >  # 
 > -# expression : ( expression ) 
 > +# expression : ( expression ) 
 >  #         | not expression 
 >  #         | expression and expression 
 >  #         | expression or expression 
 > @@ -17,7 +17,7 @@ 
 >  #         | t1 op names 
 >  #         | t2 op names 
 >  # 
 > -# op : == | != 
 > +# op : == | != 
 >  # role_op : == | != | eq | dom | domby | incomp 
 >  # 
 >  # names : name | { name_list } 
 > diff --git a/tools/flask/policy/policy/mls b/tools/flask/policy/policy/mls 
 > index 9290a76ae9bc..c4b74c10cda7 100644 
 > --- a/tools/flask/policy/policy/mls 
 > +++ b/tools/flask/policy/policy/mls 
 > @@ -1,6 +1,6 @@ 
 >  ifdef(`enable_mls',` 
 >  # 
 > -# Define sensitivities 
 > +# Define sensitivities 
 >  # 
 >  # Domination of sensitivities is in increasin 
 >  # numerical order, with s0 being the lowest 
 > diff --git a/tools/flask/policy/policy/support/misc_macros.spt b/tools/flask/policy/policy/support/misc_macros.spt 
 > index 3116db92fbed..4c3be036c6e9 100644 
 > --- a/tools/flask/policy/policy/support/misc_macros.spt 
 > +++ b/tools/flask/policy/policy/support/misc_macros.spt 
 > @@ -21,7 +21,7 @@ define(`ifndef',`ifdef(`$1',`$3',`$2')') 
 >  # 
 >  # __endline__ 
 >  # 
 > -# dummy macro to insert a newline.  used for 
 > +# dummy macro to insert a newline.  used for 
 >  # errprint, so the close parentheses can be 
 >  # indented correctly. 
 >  # 
 > -- 
 > 2.39.5 
 >  
 > 

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

