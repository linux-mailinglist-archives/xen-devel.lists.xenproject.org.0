Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBMpIa7veWnG1AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 12:14:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FF8A0216
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 12:14:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215466.1525654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl3VW-0006RX-78; Wed, 28 Jan 2026 11:14:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215466.1525654; Wed, 28 Jan 2026 11:14:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl3VW-0006PE-3A; Wed, 28 Jan 2026 11:14:46 +0000
Received: by outflank-mailman (input) for mailman id 1215466;
 Wed, 28 Jan 2026 11:14:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pnMD=AB=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vl3VU-00069J-Hn
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 11:14:44 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a9409e6-fc3a-11f0-9ccf-f158ae23cfc8;
 Wed, 28 Jan 2026 12:14:42 +0100 (CET)
Received: from BN0PR04CA0011.namprd04.prod.outlook.com (2603:10b6:408:ee::16)
 by DM6PR12MB4330.namprd12.prod.outlook.com (2603:10b6:5:21d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Wed, 28 Jan
 2026 11:14:35 +0000
Received: from BN1PEPF00004682.namprd03.prod.outlook.com
 (2603:10b6:408:ee:cafe::8a) by BN0PR04CA0011.outlook.office365.com
 (2603:10b6:408:ee::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Wed,
 28 Jan 2026 11:14:32 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004682.mail.protection.outlook.com (10.167.243.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Wed, 28 Jan 2026 11:14:34 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 28 Jan
 2026 05:14:31 -0600
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
X-Inumbo-ID: 8a9409e6-fc3a-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eh1wdTRv+p7bqlN7cbGK7V1mOQscwOiLwNoDA10MZSkhqb7S2zCrVuq4aMvjRD2AbbRAk1D6KXcuzxXa8LfmqQ6RbymippEevWU3Znaq83FyWcYN56tTby+109F2H0o15b2CtJSmkBgj8ey2AmZS+wdbxByByNI8ELjbd6LWgpxydr7rYbgwnJ5lHpDsUYenkHI3RwATmhhF1xLmRaQ0C6mlmERpeQ8794WAo5+g3cRoxTjf737zf3VKA1SrCcXznPaiF+EORwBNy1TYbEg3gIvCby58y/ETpIqFld/7CRy3LPmY8tiCDxSZpSxQ408oBh1ttQ3hleJ6et6nUiXbBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nmdln9IfYbE3xS7x6S1pNzejttN4bY3xIazqICmNh3g=;
 b=rBqZblKK3UZLvZ9g3ggq1yW7qbrCgYm+bYc+Ep0pl4nUHxi/ogBhsBwU2AhGqTT/CeJ/J4FyR0Up9zeSyfMAwPHv/wI9/6+3pGMIEUlsiSJTRrdru8CZEHPYsoU7C6LmTCV5IczLhJXcRrGXWMxwnMvgFqqqFbnuGZGLNKCLbIlkLw69hoV8jzAUAt8u52wAEpU7v9DvKFIGwMgt7BkWFB+CVyaZWQwuwrJGAdU6cQSljc1Ji35adC9+JyKQ1NgiHPY1tAsIQumM1hAf/vTGXfAWG1KG4IYr1m1B2yqDsvXbRbp0CxDn8/coaUjcXFIbtvh3R117yYq0WN8fnYhaIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nmdln9IfYbE3xS7x6S1pNzejttN4bY3xIazqICmNh3g=;
 b=J96MmjEE9oaaVflqckcLFSbIF9acLigZ6bK9u89986QasB2Us8OhLj649Wt7KK+MF7MImgLmqTZkfDUHQczjAlSSFsXT3QeW+aGEx3SYPcyIJy6u1u3QAeKoCoHSG+UEm+LwyM+1llx4ur6Ie2xTYoxLi9q+YjLWeJwXeblMLao=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 28 Jan 2026 12:14:28 +0100
Message-ID: <DG06G1H3WX20.3FREYPRRAMSEG@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH] CODING_STYLE: Establish a policy with regards to
 copyright notices
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20260127182403.141459-1-alejandro.garciavallejo@amd.com>
 <b42af5a5-6237-47d2-9b74-0154ef8c2020@suse.com>
 <DG03S6HP7OIO.18ACUNFC24X1Y@amd.com>
 <ace6c97f-aeeb-40c9-9c0b-d6ad45fe09d6@suse.com>
In-Reply-To: <ace6c97f-aeeb-40c9-9c0b-d6ad45fe09d6@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004682:EE_|DM6PR12MB4330:EE_
X-MS-Office365-Filtering-Correlation-Id: 6382b589-2115-48e6-9d6f-08de5e5e6ae7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UU1WRGoybUtSbnJxVXJ3dVlsRlZ5Zis2UFJ5Y2dNZTRDWWZDcVZBWDZoL3Rw?=
 =?utf-8?B?S2pqUDhockhLVkVFR25GeS9rZTZNbUdMaTlUVzduUHdNRjdRMUJnaE02cU1T?=
 =?utf-8?B?a0l0bW9yc1c5SDgwa3BvM0VSZVY0cWZ4aVZYMzZQdWRuUjRsNTJXbXRPeXZv?=
 =?utf-8?B?dS94RXg3WFNIRndtZVFoc0pqSXR2T2F1eXNQVnlkejZ0K2VnYWl0Z3dPb2Fh?=
 =?utf-8?B?MHNHcWlVaS9WVXJ1Vk42UUY4Zjd1R0x4NXhBcHFRUGQ5c0pJTVhuUlhkMFlC?=
 =?utf-8?B?Mmd4Qjg2ODk2RmxSekhQKzFna0c3c3p1emdSUHBVN0VtWHJuVytXTjllNXpW?=
 =?utf-8?B?eTQ0Z0xJdlRSdmJXSkJyODlqaTZPRmNJRGRkZ0g5WGViL1RuaGk1TUhKVTRt?=
 =?utf-8?B?anJVYXFEOWN4VEcxUUZ1WmhRT1pTNEJSZjRrNklyekZBV25aWDdnbnVheHRl?=
 =?utf-8?B?ZVdBMVlTdUdiSE50bTB0U2kraUltckwwc1pOWDlYQ2xrMjQwUVBSalY3b0VJ?=
 =?utf-8?B?TFFJMEh1Y1FDQlIyeDcra3ZuY3NSYzR1eHkydHNHdndlcjcyNkZ5NWVxU29y?=
 =?utf-8?B?REl5ZXhLS3B4RU5JRWRSVUlUYnl2bGdUcjREb0JNRVBKYUpCaHVMTlF1d0RS?=
 =?utf-8?B?ZUJhak9mQXk1a3d0ZEZFWXYwaFpLY2swOFh5d3VoOGJwTXVNSTYvZkQ4TE1S?=
 =?utf-8?B?aDMzU1ArenBaTDM1b0lHTU5QK2UzNlhuMCtVZ3JNOFBtazkwaUhkendRZXdz?=
 =?utf-8?B?bGo2TjNEK1dYejVCYllwdEdtT2hwUG9za1NuS0xkT1JQK2VmZzJRK0FtN0hB?=
 =?utf-8?B?L0c2eks4dFZCcUZoQmhRSG44T2FYaTl6em00VSsvSW5aTEFWaVk0RTViVFQ2?=
 =?utf-8?B?T2FqYkIwOFBGdldZUlhEaktSV1RoVDRuYUdoaVQ3TzhlVGlWVzRES3FwUWpi?=
 =?utf-8?B?aW9qL0QyS0QwcUVqRGZ4amY5ek9BSmFKeUZxazV0V2c5Nm1SYjJMYW1UbEdV?=
 =?utf-8?B?dFdtODFLQzJEcmd4OUNzVW1Rc1VNandCVHNURWVhTUZialU2bk84cS9uWWNq?=
 =?utf-8?B?MHlpQWw3WTA2aVhPY2N3VFVaQlZLU25keFFCMXpYMkdTSDlmaHJHalJHeUlF?=
 =?utf-8?B?UHQwU283ZkpPNlFmZlZ2VGFPUlpHdUJydmFPa3BVTWxHN05nS3NJTlk2enFP?=
 =?utf-8?B?dmtPeDdMUnQ2bDU1Q2M5VGhueWhYVGpKMjR6byttUUs4SWJSbDNMN0NLYUZC?=
 =?utf-8?B?NFVFWDFBTlJsODk0cmhjc2xya1ZTZWlJbkhoa3FmTTNnbXh6UHNTZFJ5V3VS?=
 =?utf-8?B?QXk3MWNqbkNKMThBakhkWHkvOGUweEV1THJPU1AyRURKd2hQV1FvTEZzMWha?=
 =?utf-8?B?eWR2ME95bmpjeUV5SDBpV1lySFhuYjExSHQ1UnlIV3dIdUxZdGtnV0VOSDd6?=
 =?utf-8?B?bGpXWk9HR0k4c2pNLzJDQWFCRXVSeU5SbnpmMVhMa2Zhc055TjA4UVZ2N0xR?=
 =?utf-8?B?TjIvOFBUUENiZlV3QWJzY3dUK0M1REp5SytEV0JiNGw3NXJldUVuRVJSS3hD?=
 =?utf-8?B?eWtwaldLNTNZYkVjei9ja2t2RnU3bU9LWlp2OGx3d3lMai9zK2JFTHFrWmVp?=
 =?utf-8?B?TmFEZHBJRU5CQ1hiTTVKdXVaQ0xKSlFjYVNTeE5ZT29KNm80THhoRmJLN0tI?=
 =?utf-8?B?eFJjWkZ6RUdRZmt2cXM2bjBkOE5CTEgraXhucmdYWFN0UTgxSzNvcjhDWEZk?=
 =?utf-8?B?bVUrcDloV2hNVGJVaE81RjRCcHdmdTgwODNEZ1dWblN5MWY1aDF0UGdDcXF1?=
 =?utf-8?B?UkVFRjRpK1ZHcFRoREs3NUhIUjdzTTdjOHhzdWkzTWxHRjFrMkxacUovd0Rn?=
 =?utf-8?B?Uk0rQzdlZzVtSXd1ejJud1p6bGM2dmtVNXFjMFpjL0p4cW45Q0F0NFNLSmFY?=
 =?utf-8?B?bkFzR3NzeFlRZGY5RVN3cWZNcjFxcHhlcUlGK1htYUhmOEFxUFNNbFdXSVRM?=
 =?utf-8?B?bVdaY0tCR2ZHejhWY0FGZWdUQWVFL2FHbk83TnVZcUt0VTlDc1UwSHJ6ZXdW?=
 =?utf-8?B?SGRydExQRytQeUxwMDVNMWpiNGxKSnMzOTJCTjZIQU1Sd3QzZTVDUE9ic1JP?=
 =?utf-8?B?NGQ4QmUwL0hIM2pIVVYvQmgxM3BFbzFlVjUwMWdWN0NUOE9pOEVxYW1LaVMy?=
 =?utf-8?B?dWc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 11:14:34.6211
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6382b589-2115-48e6-9d6f-08de5e5e6ae7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004682.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4330
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 06FF8A0216
X-Rspamd-Action: no action

On Wed Jan 28, 2026 at 11:45 AM CET, Jan Beulich wrote:
> On 28.01.2026 10:09, Alejandro Vallejo wrote:
>> The refinement also applies to the second bullet point, so I can add it =
as a
>> separate paragraph stating existing notices are to never be modified and=
 only
>> removed with the express consent of the current holder(s).
>
> That's interesting, as it may be getting increasingly difficult in practi=
ce.
> Often you can't get hold of the holder(s), to the degree that - as we're =
all
> growing older - at some point they may not be there at all anymore. Yet i=
f
> not having such notices is going to be a goal of the project, retaining s=
ome
> indefinitely can't be the intention either.
>
>> Do you have a take for/against moving all existing notices to a separate=
 NOTICES
>> file (a-la Apache). The existing file for them (in httpd) looks like thi=
s, so
>> they took the liberty to rewording the banners to be more digestible in =
single
>> file inclusion.
>>=20
>> 	Apache HTTP Server
>> 	Copyright 2026 The Apache Software Foundation.
>>=20
>> 	This product includes software developed at
>> 	The Apache Software Foundation (https://www.apache.org/).
>>=20
>> 	Portions of this software were developed at the National Center
>> 	for Supercomputing Applications (NCSA) at the University of
>> 	Illinois at Urbana-Champaign.
>>=20
>> 	This software contains code derived from the RSA Data Security
>> 	Inc. MD5 Message-Digest Algorithm, including various
>> 	modifications by Spyglass Inc., Carnegie Mellon University, and
>> 	Bell Communications Research, Inc (Bellcore).
>>=20
>> 	This software contains code derived from the PCRE library pcreposix.c
>> 	source code, written by Philip Hazel, Copyright 1997-2004
>> 	by the University of Cambridge, England.
>>=20
>> It'd blur the scope of existing holders, but code moves and so do their
>> contributions. Keeping a banner on a file after a refactor is just
>> misattribution.
>>=20
>> ------------------
>>=20
>> In short. There's 1 question in 2 forms I'd like to have an answer to fr=
om a
>> core maintainers.
>>=20
>> Would you be willing to ack a change along these lines?
>>   1. to a Copyright Notice policy within CODING_STYLE.
>
> Likely, once we've agreed on suitable wording.
>
>>   2. to the relegation of existing notices to a NOTICES file in the styl=
e of
>>      Apache. Apache in particular mandates the file not be touched unles=
s
>>      absolutely required for legal reasons.
>
> Very unlikely. While likely I wouldn't veto it, I don't like such moving =
around
> of things. If we want to get them out of the source files, they should be
> dropped altogether.

Ack to both, thanks for the input!

Cheers,
Alejandro

