Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEkROKBjsWnsugIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 13:44:16 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4204B263C50
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 13:44:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1251090.1548372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0Iv0-0003K4-5L; Wed, 11 Mar 2026 12:44:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1251090.1548372; Wed, 11 Mar 2026 12:44:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0Iv0-0003Hg-1q; Wed, 11 Mar 2026 12:44:06 +0000
Received: by outflank-mailman (input) for mailman id 1251090;
 Wed, 11 Mar 2026 12:44:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tK7a=BL=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1w0Iuy-0003Ha-TJ
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2026 12:44:04 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f91415a5-1d47-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Mar 2026 13:43:59 +0100 (CET)
Received: from PH8P223CA0018.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:2db::28)
 by SA5PPF7D510B798.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8d0) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.10; Wed, 11 Mar
 2026 12:43:52 +0000
Received: from CY4PEPF0000EE30.namprd05.prod.outlook.com
 (2603:10b6:510:2db:cafe::82) by PH8P223CA0018.outlook.office365.com
 (2603:10b6:510:2db::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.26 via Frontend Transport; Wed,
 11 Mar 2026 12:43:51 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE30.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 12:43:51 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 11 Mar
 2026 07:43:49 -0500
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
X-Inumbo-ID: f91415a5-1d47-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wn3I7U1/urEkvk3hnqSAyvbIoe+zTfaqoFQlWhvwYwKNYj+gjGdFkTMUtxv3vtK8Z9b/6AWcUqokEmynz8KHqTBRh6PSJwq7JKAPxXDv8ybM+cR7U5lJNlENS/Gbj1AZ1CnYKVeml5X3Tz26s2nv1t6Lez7CdGezPfwtXTe7Mvif4w6HYNvddiVu2ihUa6N0ZvlqqFYx0Vz/eUfKffhvnvTdmZOyxF3UwXUfBLOGyL81LmHLPkvb3M7YZMctdUxhEYmg9R3eBh2CY8omkte++wxQNIe02h0/3vPM2jqloda8GO56L72OWGWP7Wmjezan5PLiFWDlqh64XoGc0MHkpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EG8cZI98ZOM0QjlQOmrqhILQJn7/3KTuPiOq/eLp4m8=;
 b=p1BK2UrC8FSO4ONjUeHYQDqKgilrY0GLRYYGD1j8l0GoizsLWBl2UDT4Lmy3rMfYDuTeBQH3OUt1j3R/JyXMkvKId+Rcw2T+N9llN/797hPGI+Y5VC/3v8Bg4E6ykagWS1eskOMLyic/J2YC1p37KPgF34t3B8s6SzxWRLVKSsu0oSuAr79EOugDNlsj7KBsHstqqGB2LuL3bqhbl97DK7TJajznsi3onGr/juWJ27HIBvQnpeI8Vt64SsKcxL0JoRV6rwhIuUMHoq4xrr+7zZ10qCXYapv7cxULW8Wh8c19f1LVtZw1KRE36BcCxJctPhmNUuiC66bYP+SGGZkbvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EG8cZI98ZOM0QjlQOmrqhILQJn7/3KTuPiOq/eLp4m8=;
 b=BI9un+tZxaJCTPgjb/F4yhXkVSkLWcE8tPxOJczRp8C2W4GdQqs+LDDg43Hnuf9LynPaVAcgzwgJI6XjYSVSGawMc8z/dlJMo8R/NeMLvmJcveeDMvvvIGtGlqgwOWVUA+DlQ0q9q0bN9cYwFQZhHmHXnSer2ZMqlrm0S663YH4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 11 Mar 2026 13:43:48 +0100
Message-ID: <DGZYNBIDOOEB.2IBI060VRIE9A@amd.com>
Subject: Re: [PATCH v3 1/4] x86: Reject CPU policies with vendors other than
 the host's
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20260213114232.42996-1-alejandro.garciavallejo@amd.com>
 <20260213114232.42996-2-alejandro.garciavallejo@amd.com>
 <8ba61374-f05e-45d9-b1b2-0140edbb34a6@suse.com>
In-Reply-To: <8ba61374-f05e-45d9-b1b2-0140edbb34a6@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|SA5PPF7D510B798:EE_
X-MS-Office365-Filtering-Correlation-Id: c4063f4b-cc07-4e68-f80d-08de7f6bd90e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|22082099003|56012099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	Qdsv4Me/1AxVxO0sZ0IOydAJdoUeJeaPbWC045b7C1yQhbU247F0v11WGD0qrtuW8BUCi9e8oe+yZL6VJDQEeL/OTOJ0KwPodf6pvBvhfmJg7WBp1vFl5JqSWZt3PXm6zhhcM2uyHDhmQkzEXuBtARVUBfeEw/Q6mmLr3oKa9PEsKCFnBI0uYV1FIhS6cp+mQ4PeI1cGM55/v2vSbl30u7HAu5hoqXkMZNdlqJZHdS3IZQYYOUjllOqDjZAv9m9CwL3N4VHM5XotLQXW44b0txU2qDDAY3GX2kkNC3pQSwrRAnjc1xgMN/hcayRhnP/ekO1+Wx2vSVcwU032AMg//frnOWcPYMfSan2Z8lDGXNaycU0zOBvA/dHy1BeYnWt8MF8hCtO19iMirIucZZmC64pfeoTBCs9S5PYh+4HmgtWE12baxLeJ0FeHrC40pcrVu479Ul4PeYEczB340ttbyTNSVzFs8UpDWWUCAV77KF/aPvZh4ytKEPv0oiXvTVBI+YU0yljYqpmthrGC0xn5FvnUcjFqcAExC595KxiioAKaLUhn7tYkOmmrw5FpFEzYY11PC/KljBIB3142vWr5m88Zqt8trysAlMetwgc2NstAFEJw6dGSMfVurs13uBnkT+x/VYoz6KTXEJukp5YWxQqppNH8Zyk6suYljZPum746ZfnKifPk3JRs2WQGA1oJ1B+7G5qPHgCNLEzJCZ6n3I/rIk4O61/ZDGwqcoc/Ldw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(22082099003)(56012099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RX/FnzcBSKbmZV/YSMsYrZ98NcXaHqn40PVT8jDTAP+a4C2VMGKyYta1Z1QGHcfUP06htAqKrIhy1GqWb+pf//pWVdDmbZ/fYffbsW6oL9TAqeSxRVAGSLcg+27d4GsEc/aoTcbLETex//QsLhTGodlgKhEd8APa1kRdgf+aem12stNP+UNbgtBOvHKDq/lXLC0JyuDY3CunJ3PtkApvJ8Bx56ebDM+qc3wvz1/+gAWP5hl6EPT5UBKh6R5NJrbfv4cwwW/5l2eTC8860nu6eCI2yXLHNWi1bWJXq0mgFdNAKz0h2iD3EkTqI6DXId4xhKObQIGJmVvZC/YUA/QFECH88/lp0hfCoQIbt2MfG7+LiMfWporWYgWwFCdJb/W4bBoOsPt/C3h9EIxJjrEYow0UU77fO/T+m7gW69I6BuuXpfe0HA8M1o13305v7L0N
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 12:43:51.2185
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4063f4b-cc07-4e68-f80d-08de7f6bd90e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF7D510B798
X-Rspamd-Queue-Id: 4204B263C50
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,xenproject.org,citrix.com,vates.tech,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Wed Mar 11, 2026 at 9:26 AM CET, Jan Beulich wrote:
> On 13.02.2026 12:42, Alejandro Vallejo wrote:
>> --- a/CHANGELOG.md
>> +++ b/CHANGELOG.md
>> @@ -22,6 +22,11 @@ The format is based on [Keep a Changelog](https://kee=
pachangelog.com/en/1.0.0/)
>>     - Xenoprofile support.  Oprofile themselves removed support for Xen =
in 2014
>>       prior to the version 1.0 release, and there has been no developmen=
t since
>>       before then in Xen.
>> +   - Domains can no longer run on a CPU vendor if they were initially l=
aunched
>> +     on a different CPU vendor. This affects live migrations and save/r=
estore
>> +     workflows accross mixed-vendor hosts. Cross-vendor emulation has a=
lways
>> +     been unreliable, but since 2017 with the advent of speculation sec=
urity it
>> +     became unsustainably so.
>
> While the code adjustment looks okay to me, the wording is a little odd. =
What is
> "run on a CPU vendor"? How about "Domains can no longer run on a system w=
ith CPUs
> of a vendor different from the one they were initially launched on"?
>
> Also, nit: "across".

Sure

Cheers,
Alejandro

