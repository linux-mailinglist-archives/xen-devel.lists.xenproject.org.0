Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GZloFp2bjGmPrgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 16:09:17 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E565212571D
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 16:09:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227787.1534209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqBpu-0004nb-AD; Wed, 11 Feb 2026 15:09:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227787.1534209; Wed, 11 Feb 2026 15:09:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqBpu-0004ko-7a; Wed, 11 Feb 2026 15:09:02 +0000
Received: by outflank-mailman (input) for mailman id 1227787;
 Wed, 11 Feb 2026 15:09:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IPmF=AP=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1vqBps-0004kc-KA
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 15:09:00 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93f5c1af-075b-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 16:08:54 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1770822527410693.8196586983516;
 Wed, 11 Feb 2026 07:08:47 -0800 (PST)
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
X-Inumbo-ID: 93f5c1af-075b-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1770822531; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=k7pcYTGnbN799BoMgNeDWB8q4tr5fiAxeKOCPGfnNg3I3qkchi3vn9wpfu/TeR7eeWgzaZ0oD19gaBkYydAvmK5aNuFhioz3VK2b8GJs08ruuNIINTjErOxUTlTo7bufvL+kKp97fNiZCs/TbnYg2PN6fj0GBn4t7ftA6AtjiII=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770822531; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1ahHpP31MwpRsY5QW3laABbm6TfJ8CRyHZKtBKrmJIc=; 
	b=UPAP6NghrVkB6N5V3OIBhnZa39KNEdxZdJXAKb3D+17pNQGXkaoPoadpQpKkJxQJoZDSbCCv84iAhNj1Tnz76AtXApnaR1ulekZggMJ9oOQB+bykWMqW5SOL0cniKA1vbyI0chYH1L/NOA5ni+kA7veU9qSbCqI/jxjfjwMpOZU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770822530;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Date:Date:From:From:To:To:CC:Subject:Subject:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=1ahHpP31MwpRsY5QW3laABbm6TfJ8CRyHZKtBKrmJIc=;
	b=rUVc9HwNerWb/jtHebEAX/DDJ5CH891uIi49/3HGGE7RuC69AN1FP4+bc1i/qqMu
	NIY/ILRzUTswuLltz6zxCkmgWro0oE3mwZlU4K1xh2MrYU0IZ1sDyYQsoO0pkdtZ93R
	V+65KJtWft1c0xRR/djwpr5qMLs33kBOCqIB6GZM=
Date: Wed, 11 Feb 2026 09:55:05 -0500
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: =?ISO-8859-1?Q?Marek_Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
 xen-devel@lists.xenproject.org
CC: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] EFI: Fix relocating ESRT for dom0
User-Agent: Thunderbird for Android
In-Reply-To: <20260211001650.1592239-1-marmarek@invisiblethingslab.com>
References: <20260211001650.1592239-1-marmarek@invisiblethingslab.com>
Message-ID: <4BF5BA76-396A-473B-841E-29AA6DBAC9E7@apertussolutions.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.68 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[apertussolutions.com:s=zoho];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[apertussolutions.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[apertussolutions.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E565212571D
X-Rspamd-Action: no action



On February 10, 2026 7:16:42 PM EST, "Marek Marczykowski-G=C3=B3recki" <ma=
rmarek@invisiblethingslab=2Ecom> wrote:
>Fix calculating the table size - it consists of a header + entries, not
>just entries=2E
>This bug caused the last entry to have garbage in its final fields,
>including LowestSupportedFwVersion and CapsuleFlags, which (usually)
>made fwupd to detect firmware update availability, but refuse actually
>installing it=2E
>
>Fixes: dc7da0874ba4 ("EFI: preserve the System Resource Table for dom0")
>Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab=2Ecom>
>---
> xen/common/efi/boot=2Ec | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/xen/common/efi/boot=2Ec b/xen/common/efi/boot=2Ec
>index 5b84dbf26e5e=2E=2E45015a0dd583 100644
>--- a/xen/common/efi/boot=2Ec
>+++ b/xen/common/efi/boot=2Ec
>@@ -675,7 +675,8 @@ static size_t __init get_esrt_size(const EFI_MEMORY_D=
ESCRIPTOR *desc)
>     if ( esrt_ptr->FwResourceCount > available_len / sizeof(esrt_ptr->En=
tries[0]) )
>         return 0;
>=20
>-    return esrt_ptr->FwResourceCount * sizeof(esrt_ptr->Entries[0]);
>+    return offsetof(EFI_SYSTEM_RESOURCE_TABLE, Entries) +
>+        esrt_ptr->FwResourceCount * sizeof(esrt_ptr->Entries[0]);
> }
>=20
> static EFI_GUID __initdata esrt_guid =3D EFI_SYSTEM_RESOURCE_TABLE_GUID;


With Andy's suggestions,=20

Acked-by: Daniel P=2E Smith <dpsmith@apertussolutions=2Ecom>

