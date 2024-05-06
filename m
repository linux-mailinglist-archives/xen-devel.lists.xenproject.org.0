Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE7A8BC88B
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 09:47:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717273.1119314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3t3v-0007Z0-OO; Mon, 06 May 2024 07:47:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717273.1119314; Mon, 06 May 2024 07:47:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3t3v-0007XR-LJ; Mon, 06 May 2024 07:47:03 +0000
Received: by outflank-mailman (input) for mailman id 717273;
 Mon, 06 May 2024 07:47:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Q7K=MJ=inria.fr=fonyuy-asheri.caleb@srs-se1.protection.inumbo.net>)
 id 1s3t3u-00071b-0d
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 07:47:02 +0000
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1a303e0-0b7c-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 09:46:59 +0200 (CEST)
Received: from zcs2-store8.inria.fr ([128.93.142.6])
 by mail2-relais-roc.national.inria.fr with ESMTP; 06 May 2024 09:46:59 +0200
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
X-Inumbo-ID: d1a303e0-0b7c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:message-id:subject:mime-version;
  bh=Odxatie3Hdqs5x7nve4Krl7bVieqJ8Cx2jixE3fO7pg=;
  b=bt+PDPkn2gBNxqy1v1R33U7rNofFjAYhWNpyKhcPpc2EThZ3UbAXa6bE
   V58Pdw8Edoh8f1ax1ZyrkvtP+dA2lP8mS4EC4xqWtb57WOvSmRte79sFG
   81tX3zpS5Gm1d4dRwQkYjKSoUmr2oS/SXkfY+N5KWnCJCQaCs5Y0/peq4
   w=;
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
X-IronPort-AV: E=Sophos;i="6.07,257,1708383600"; 
   d="scan'208,217";a="164611360"
X-MGA-submission: =?us-ascii?q?MDE54H6sFu4LecgeLOfnLcNkdwMj+lYbAHQ4O1?=
 =?us-ascii?q?l6X0G6tlqFtEOrhZNSumeiwB0yvzRZ31vlHIg0HNXiRmZ4RU4c3SCCRr?=
 =?us-ascii?q?7I6pnPSVwio6yFbUgLjSmHnI+7MmHfMOZDbCaYv17x/OBsV2jHLvCOMj?=
 =?us-ascii?q?1ywXKXrrihGH0KVV98v6rcpw=3D=3D?=
Date: Mon, 6 May 2024 09:46:58 +0200 (CEST)
From: Fonyuy-Asheri Caleb <fonyuy-asheri.caleb@inria.fr>
To: xen-devel@lists.xenproject.org
Message-ID: <2066842119.4829764.1714981618946.JavaMail.zimbra@inria.fr>
Subject: file xen/include/xen/lib/x86/cpu-policy.h: Meaning of CPUID
 constants
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="=_5971adc4-77e8-49f7-ba82-ae59d490cabd"
X-Originating-IP: [131.254.23.3]
X-Mailer: Zimbra 10.0.8_GA_4611 (ZimbraWebClient - GC124 (Linux)/10.0.8_GA_4611)
Thread-Index: 9o3XUyoiP5VQRv5KMMDzNA7BwO9FFw==
Thread-Topic: file xen/include/xen/lib/x86/cpu-policy.h: Meaning of CPUID constants

--=_5971adc4-77e8-49f7-ba82-ae59d490cabd
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi, 
I am currently doing a study on the way xen handles CPUID information. 

I came across these constants in the code (xen/include/xen/lib/x86/cpu-policy.h file) but no explanation of why they have been set that way. 

#define CPUID_GUEST_NR_BASIC (0xdu + 1) 
#define CPUID_GUEST_NR_CACHE (5u + 1) 
#define CPUID_GUEST_NR_FEAT (2u + 1) 
#define CPUID_GUEST_NR_TOPO (1u + 1) 
#define CPUID_GUEST_NR_XSTATE (62u + 1) 
#define CPUID_GUEST_NR_EXTD_INTEL (0x8u + 1) 
#define CPUID_GUEST_NR_EXTD_AMD (0x21u + 1) 

Please can someone explain to me why we have these constants or point to a documentation which explains it? 
I am particularly interested in the CPUID_GUEST_NR_BASIC given that for intel processors for example, we have 
basic leaves running up to 0x21u already for recent processors. This value sort of forces a particular max leaf value. 


Caleb 

--=_5971adc4-77e8-49f7-ba82-ae59d490cabd
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"font-family: arial, helvetica, sans-serif; font-s=
ize: 12pt; color: #000000"><div>Hi,</div><div>I am currently doing a study =
on the way xen handles CPUID information. </div><div><br data-mce-bogus=3D"=
1"></div><div>I came across these constants in the code (xen/include/xen/li=
b/x86/cpu-policy.h file) but no explanation of why they have been set that =
way.</div><div><br data-mce-bogus=3D"1"></div><div><div>#define CPUID_GUEST=
_NR_BASIC&nbsp; &nbsp; &nbsp; (0xdu + 1)</div><div>#define CPUID_GUEST_NR_C=
ACHE&nbsp; &nbsp; &nbsp; (5u + 1)</div><div>#define CPUID_GUEST_NR_FEAT&nbs=
p; &nbsp; &nbsp; &nbsp;(2u + 1)</div><div>#define CPUID_GUEST_NR_TOPO&nbsp;=
 &nbsp; &nbsp; &nbsp;(1u + 1)</div><div>#define CPUID_GUEST_NR_XSTATE&nbsp;=
 &nbsp; &nbsp;(62u + 1)</div><div>#define CPUID_GUEST_NR_EXTD_INTEL (0x8u +=
 1)</div><div>#define CPUID_GUEST_NR_EXTD_AMD&nbsp; &nbsp;(0x21u + 1)</div>=
<div><br data-mce-bogus=3D"1"></div><div>Please can someone explain to me w=
hy we have these constants or point to a documentation which explains it?&n=
bsp;</div><div>I am particularly interested in the CPUID_GUEST_NR_BASIC giv=
en that for intel processors for example, we have</div><div>basic leaves ru=
nning up to 0x21u already for recent processors. This value sort of forces =
a particular max leaf value.&nbsp;</div><div><br data-mce-bogus=3D"1"></div=
><div><br data-mce-bogus=3D"1"></div><div>Caleb</div></div></div></body></h=
tml>
--=_5971adc4-77e8-49f7-ba82-ae59d490cabd--

