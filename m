Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPNmOMfYpmnHWgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 13:49:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEA21EFB37
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 13:49:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244709.1544096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxPB7-0002Fz-Vk; Tue, 03 Mar 2026 12:48:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244709.1544096; Tue, 03 Mar 2026 12:48:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxPB7-0002Cs-Sm; Tue, 03 Mar 2026 12:48:45 +0000
Received: by outflank-mailman (input) for mailman id 1244709;
 Tue, 03 Mar 2026 12:48:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BYu4=BD=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1vxPB6-0002Ck-0z
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2026 12:48:44 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d6b52c3-16ff-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Mar 2026 13:48:41 +0100 (CET)
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1772542104120512.1902581757903;
 Tue, 3 Mar 2026 04:48:24 -0800 (PST)
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
X-Inumbo-ID: 4d6b52c3-16ff-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1772542111; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kSootYNw6kLlF3qln49RAi0hJOcu5bDganrft/zuENJwNNugvywqjtfRLt6Ux44VSnt85UAMVlKNytgGax+AfNut9/7QZiFTyry/8RTeMjmIKjPMAUUZj2Us2wVGQtrGqTSZFVhqGYuzYFZEwwP3du8H/ZanbvEanJ0+hB+UC1I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772542111; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gzfEYy7bTKSUp73SM9YS+gSsfJ+9m4GvrnOgrRT6tQU=; 
	b=MjcdfKVw1PYICKdwW2GlcC5bKoy114/M/D+efHAIwIFD7tnIlNasY9uES9igeqiOgem4QMHBWBhiDZPJTYb9VGtt+Hdaq79qOEzhJtufbKk4eirkkmvoPE9Ira5TGn4PzIMU7qCpp/OcTm3e3+MCyYWmesUWboctjTGHI8Di/Ik=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772542111;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=gzfEYy7bTKSUp73SM9YS+gSsfJ+9m4GvrnOgrRT6tQU=;
	b=fiVA6q5eTqjiuj9ZP/aXxooQkAhzFECrenBzXXO5OL1OdlOMdE19JEHBVMhPFwam
	EfTOXEAUQhoYBaNAThZJ5KXOwdES9DQVwB3fs/0I6BLsWs0fu4L67S4bvwLx4VJFNbS
	lnrSVbf+1ZNL/Wz0pdC+5at58RwImOW8b/ipjlu8=
Date: Tue, 03 Mar 2026 07:48:23 -0500
From: Daniel Smith <dpsmith@apertussolutions.com>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?=22Roger_Pau_Monn=C3=A9=22?= <roger.pau@citrix.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>,
	"Julien Grall" <julien@xen.org>,
	"Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>,
	"Michal Orzel" <michal.orzel@amd.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	"Nicola Vetrini" <nicola.vetrini@bugseng.com>,
	"Xen-devel" <xen-devel@lists.xenproject.org>,
	"Christopher Clark" <christopher.w.clark@gmail.com>
Message-ID: <19cb3be119e.107e51fe338081.8287475850457408935@apertussolutions.com>
In-Reply-To: <aad02d36-5b26-4a59-ac67-99757fe13679@suse.com>
References: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
 <20260220214653.3497384-4-andrew.cooper3@citrix.com> <aad02d36-5b26-4a59-ac67-99757fe13679@suse.com>
Subject: Re: [PATCH 03/12] xen/argo: Fix MISRA violations around function
 parameters
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-Rspamd-Queue-Id: 6EEA21EFB37
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.18 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	R_DKIM_ALLOW(-0.20)[apertussolutions.com:s=zoho];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:consulting@bugseng.com,m:nicola.vetrini@bugseng.com,m:xen-devel@lists.xenproject.org,m:christopher.w.clark@gmail.com,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[apertussolutions.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[apertussolutions.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[citrix.com,kernel.org,xen.org,epam.com,arm.com,amd.com,bugseng.com,lists.xenproject.org,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


From: Jan Beulich <jbeulich@suse.com>
To: "Andrew Cooper"<andrew.cooper3@citrix.com>
Cc: "Roger Pau Monn=C3=A9"<roger.pau@citrix.com>, "Stefano Stabellini"<ssta=
bellini@kernel.org>, "Julien Grall"<julien@xen.org>, "Volodymyr Babchuk"<Vo=
lodymyr_Babchuk@epam.com>, "Bertrand Marquis"<bertrand.marquis@arm.com>, "M=
ichal Orzel"<michal.orzel@amd.com>, "consulting @ bugseng . com"<consulting=
@bugseng.com>, "Nicola Vetrini"<nicola.vetrini@bugseng.com>, "Xen-devel"<xe=
n-devel@lists.xenproject.org>, "Christopher Clark"<christopher.w.clark@gmai=
l.com>, "Daniel P. Smith"<dpsmith@apertussolutions.com>
Date: Mon, 23 Feb 2026 04:15:55 -0500
Subject: Re: [PATCH 03/12] xen/argo: Fix MISRA violations around function p=
arameters

 > On 20.02.2026 22:46, Andrew Cooper wrote:=20
 > > For the ARM build only, Eclair reports a R8.4 violation because do_arg=
o_op()=20
 > > cannot see its declaration.  This means that x86 is picking hypercall-=
defs.h=20
 > > up transitively while ARM is not.  Include xen/hypercall.h explicitly.=
=20
 > >=20
 > > Eclair also reports a R8.3 violation because of arg3 and arg4 differin=
g in=20
 > > name with a raw_ prefix.  Because hypercall-defs.h generates both do_a=
rgo_op()=20
 > > and compat_argo_op() from a single description, it's not possible to s=
imply=20
 > > rename to raw_ in the declaration, as that would force doing the same =
rename=20
 > > in compat_argo_op().=20
 > >=20
 > > In do_argo_op(), drop the split parameter handling, and perform the 32=
bit=20
 > > range check via an explicit cast.  While adjusting the surrounding log=
ic, drop=20
 > > unnecessary casts to void * for already pointer arguments in argo_prin=
tk().=20
 > >=20
 > > No functional change.=20
 > >=20
 > > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>=20
 > =20
 > Reviewed-by: Jan Beulich <jbeulich@suse.com>=20
 > =20

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>


