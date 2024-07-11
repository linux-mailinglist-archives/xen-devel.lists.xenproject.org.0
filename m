Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE72692E4E8
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 12:39:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757288.1166099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRrCO-0007O6-M1; Thu, 11 Jul 2024 10:38:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757288.1166099; Thu, 11 Jul 2024 10:38:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRrCO-0007Lz-JS; Thu, 11 Jul 2024 10:38:52 +0000
Received: by outflank-mailman (input) for mailman id 757288;
 Thu, 11 Jul 2024 10:38:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NKZT=OL=inria.fr=fonyuy-asheri.caleb@srs-se1.protection.inumbo.net>)
 id 1sRrCN-0007Lt-8L
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 10:38:51 +0000
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1913c4c-3f71-11ef-8776-851b0ebba9a2;
 Thu, 11 Jul 2024 12:38:48 +0200 (CEST)
Received: from zcs2-store8.inria.fr ([128.93.142.6])
 by mail2-relais-roc.national.inria.fr with ESMTP; 11 Jul 2024 12:38:48 +0200
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
X-Inumbo-ID: c1913c4c-3f71-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:message-id:subject:mime-version;
  bh=UVLk+RUdqghV62y8NC2Zv98pz7e4czl94Qe5q9x3OrI=;
  b=sLXEOEqk20LSlKsvnG9QjPtABGXGs4AgUcdp6CT7LblppSk+Q0CrbY5u
   q5kcA53pX+0vmThJYv6xTtoVYlntj7K4THHSb3tzDtf7xZI7XnNEZoCTL
   IyTNlZWkwOCsUO9mzwzUXpxtLx3YuTwGGObgXK4sPAPssajlwZQhpS0/3
   k=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=Pass smtp.mailfrom=fonyuy-asheri.caleb@inria.fr; spf=None smtp.helo=postmaster@zcs2-store8.inria.fr
Received-SPF: Pass (mail2-relais-roc.national.inria.fr: domain of
  fonyuy-asheri.caleb@inria.fr designates 128.93.142.6 as
  permitted sender) identity=mailfrom; client-ip=128.93.142.6;
  receiver=mail2-relais-roc.national.inria.fr;
  envelope-from="fonyuy-asheri.caleb@inria.fr";
  x-sender="fonyuy-asheri.caleb@inria.fr";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 include:mailout.safebrands.com
  a:basic-mail.safebrands.com a:basic-mail01.safebrands.com
  a:basic-mail02.safebrands.com ip4:128.93.142.0/24
  ip4:192.134.164.0/24 ip4:128.93.162.160 ip4:89.107.174.7 mx
  ~all"
Received-SPF: None (mail2-relais-roc.national.inria.fr: no sender
  authenticity information available from domain of
  postmaster@zcs2-store8.inria.fr) identity=helo;
  client-ip=128.93.142.6;
  receiver=mail2-relais-roc.national.inria.fr;
  envelope-from="fonyuy-asheri.caleb@inria.fr";
  x-sender="postmaster@zcs2-store8.inria.fr";
  x-conformance=spf_only
X-IronPort-AV: E=Sophos;i="6.09,199,1716242400"; 
   d="scan'208,217";a="175023717"
X-MGA-submission: =?us-ascii?q?MDFsHK2G5J0TejETsfJH9kAeozKkXVfwoHn7qW?=
 =?us-ascii?q?Jk423uRDTrQja8LFbQwGvPFaXskSb9Cf7d3Af5R85Da6KOvL7FxbPaxK?=
 =?us-ascii?q?C2h79rYWDoFcsTyJmFsD9cT0FzhQVVGqrZcmyFqi0S/YJBOcYjOizij6?=
 =?us-ascii?q?+aVI6kGsPNMgLX1J5OZoWFgw=3D=3D?=
Date: Thu, 11 Jul 2024 12:38:47 +0200 (CEST)
From: Fonyuy-Asheri Caleb <fonyuy-asheri.caleb@inria.fr>
To: xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <60751777.2038091.1720694327760.JavaMail.zimbra@inria.fr>
Subject: Help with Understanding vcpu xstate restore error during vm
 migration
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="=_33499ccc-f973-4df0-b362-0e8b93f78783"
X-Originating-IP: [131.254.23.3]
X-Mailer: Zimbra 10.0.8_GA_4611 (ZimbraWebClient - GC126 (Linux)/10.0.8_GA_4611)
Thread-Index: tAJcECRjqaJf3FM7DVWxG1PgmKGLCA==
Thread-Topic: Help with Understanding vcpu xstate restore error during vm migration

--=_33499ccc-f973-4df0-b362-0e8b93f78783
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello, 

I am trying to understand the causes of the vcpu xstate restore error during live migration. 
I get the following error during live migration: 

xc: error: Failed to set vcpu0's xsave info (22 = Invalid argument): Internal error 

I was able to locate the failure point to the file xen/arch/x86/domctl.c with the following check. 

if ( evc -> size < PV_XSAVE_HDR_SIZE || 
evc -> size > PV_XSAVE_SIZE ( xfeature_mask ) ) 
goto vcpuextstate_out ; 

I know this is related to the number of xstates handled by the source server. Please can 
someone explain to me how these states are computed? 

I earlier thought it was simply the number xsave dependent features on the CPU but it seems 
to be more than that. 

Thanks in advance. 

Caleb 


--=_33499ccc-f973-4df0-b362-0e8b93f78783
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"font-family: arial, helvetica, sans-serif; font-s=
ize: 12pt; color: #000000"><div>Hello,&nbsp;</div><div><br data-mce-bogus=
=3D"1"></div><div>I am trying to understand the causes of the vcpu xstate r=
estore error during live migration.</div><div>I get the following error dur=
ing live migration:&nbsp;</div><div><br data-mce-bogus=3D"1"></div><div>xc:=
 error: Failed to set vcpu0's xsave info (22 =3D Invalid argument): Interna=
l error<br data-mce-bogus=3D"1"></div><div><br data-mce-bogus=3D"1"></div><=
div>I was able to locate the failure point to the file xen/arch/x86/domctl.=
c&nbsp; with the following check.</div><div><div style=3D"color: #cccccc; b=
ackground-color: #1f1f1f; font-family: 'Droid Sans Mono', 'monospace', mono=
space; font-weight: normal; font-size: 14px; line-height: 19px; white-space=
: pre;" data-mce-style=3D"color: #cccccc; background-color: #1f1f1f; font-f=
amily: 'Droid Sans Mono', 'monospace', monospace; font-weight: normal; font=
-size: 14px; line-height: 19px; white-space: pre;"><div><br></div><div><spa=
n style=3D"color: #cccccc;" data-mce-style=3D"color: #cccccc;"> </span><spa=
n style=3D"color: #c586c0;" data-mce-style=3D"color: #c586c0;">if</span><sp=
an style=3D"color: #cccccc;" data-mce-style=3D"color: #cccccc;"> ( </span><=
span style=3D"color: #9cdcfe;" data-mce-style=3D"color: #9cdcfe;">evc</span=
><span style=3D"color: #cccccc;" data-mce-style=3D"color: #cccccc;">-&gt;</=
span><span style=3D"color: #9cdcfe;" data-mce-style=3D"color: #9cdcfe;">siz=
e</span><span style=3D"color: #cccccc;" data-mce-style=3D"color: #cccccc;">=
 </span><span style=3D"color: #d4d4d4;" data-mce-style=3D"color: #d4d4d4;">=
&lt;</span><span style=3D"color: #cccccc;" data-mce-style=3D"color: #cccccc=
;"> </span><span style=3D"color: #569cd6;" data-mce-style=3D"color: #569cd6=
;">PV_XSAVE_HDR_SIZE</span><span style=3D"color: #cccccc;" data-mce-style=
=3D"color: #cccccc;"> </span><span style=3D"color: #d4d4d4;" data-mce-style=
=3D"color: #d4d4d4;">||</span></div><div><span style=3D"color: #cccccc;" da=
ta-mce-style=3D"color: #cccccc;"> </span><span style=3D"color: #9cdcfe;" da=
ta-mce-style=3D"color: #9cdcfe;">evc</span><span style=3D"color: #cccccc;" =
data-mce-style=3D"color: #cccccc;">-&gt;</span><span style=3D"color: #9cdcf=
e;" data-mce-style=3D"color: #9cdcfe;">size</span><span style=3D"color: #cc=
cccc;" data-mce-style=3D"color: #cccccc;"> </span><span style=3D"color: #d4=
d4d4;" data-mce-style=3D"color: #d4d4d4;">&gt;</span><span style=3D"color: =
#cccccc;" data-mce-style=3D"color: #cccccc;"> </span><span style=3D"color: =
#569cd6;" data-mce-style=3D"color: #569cd6;">PV_XSAVE_SIZE</span><span styl=
e=3D"color: #cccccc;" data-mce-style=3D"color: #cccccc;">(</span><span styl=
e=3D"color: #9cdcfe;" data-mce-style=3D"color: #9cdcfe;">xfeature_mask</spa=
n><span style=3D"color: #cccccc;" data-mce-style=3D"color: #cccccc;">) )</s=
pan></div><div><span style=3D"color: #cccccc;" data-mce-style=3D"color: #cc=
cccc;"> </span><span style=3D"color: #c586c0;" data-mce-style=3D"color: #c5=
86c0;">goto</span><span style=3D"color: #cccccc;" data-mce-style=3D"color: =
#cccccc;"> </span><span style=3D"color: #c8c8c8;" data-mce-style=3D"color: =
#c8c8c8;">vcpuextstate_out</span><span style=3D"color: #cccccc;" data-mce-s=
tyle=3D"color: #cccccc;">;</span></div></div></div><div><br data-mce-bogus=
=3D"1"></div><div>I know this is related to the number of xstates handled b=
y the source server. Please can&nbsp;</div><div>someone explain to me how t=
hese states are computed?&nbsp;</div><div><br data-mce-bogus=3D"1"></div><d=
iv>I earlier thought it was simply the number xsave dependent features on t=
he CPU but it seems</div><div>to be more than that.&nbsp;</div><div><br dat=
a-mce-bogus=3D"1"></div><div>Thanks in advance.&nbsp;</div><div><br data-mc=
e-bogus=3D"1"></div><div>Caleb</div><div data-marker=3D"__SIG_PRE__"><div><=
br data-mce-bogus=3D"1"></div></div></div></body></html>
--=_33499ccc-f973-4df0-b362-0e8b93f78783--

