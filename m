Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iI5rCvMKimnKFwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:27:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC09112801
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:27:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225741.1532308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpU6V-0000lh-Jd; Mon, 09 Feb 2026 16:27:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225741.1532308; Mon, 09 Feb 2026 16:27:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpU6V-0000if-Gu; Mon, 09 Feb 2026 16:27:15 +0000
Received: by outflank-mailman (input) for mailman id 1225741;
 Mon, 09 Feb 2026 16:27:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EeIc=AN=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vpU6U-0000iN-6P
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 16:27:14 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2df235dc-05d4-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 17:27:10 +0100 (CET)
Received: from SA1PR02CA0008.namprd02.prod.outlook.com (2603:10b6:806:2cf::13)
 by MW4PR12MB7168.namprd12.prod.outlook.com (2603:10b6:303:22d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 16:27:00 +0000
Received: from SA2PEPF00001504.namprd04.prod.outlook.com
 (2603:10b6:806:2cf:cafe::2c) by SA1PR02CA0008.outlook.office365.com
 (2603:10b6:806:2cf::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 16:26:59 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00001504.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 16:26:59 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 9 Feb
 2026 10:26:56 -0600
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
X-Inumbo-ID: 2df235dc-05d4-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VwuDeEBFjZD1jOoSSiwMO2yI/Q6CpT5O0yCBa2PkOYjViBp73QqXfvexCj0qrttrbdzGTcqSq38lq/zN06XEiMV4+CaI3kpTL862kH1CBiSc7ukQZwgbSa29utfaX1ywJoX//165OYpYCOyxEhRHOZw1+iU8CWFEDmCyvXi6O75pwVm6wWFuF2GNHOaPJbyKXPTmN0x1uG+h57zTt1+OwsrIba/GaQUwXmqK6/hVLr35gun2hBKa4uXQX2oQjnDT09bFXDijU6B6jxW8jmDLx6HleIJTkr1oLmhB0idLf0jdKAE907Vr79mxA4gjkbu+9/ztpWNDJ/P9RkzE3ZEtsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0lVqEgne2CCU604ZviDZqPCpqQufrPW3RonEOcw48o=;
 b=vlU2WPWNCCGdRv+QAREUPuQ6Wqcgfa6bZDCoqO+PIGDYIsQYqyoMEe/jQ9mrXaRPhM3DGx9JDUfUrkKgZnqvabKJCK7bEa7Q6vF2l4ZK+xR/6lhc7dW+0qSPDvollFcbWs1lMDAigVwsm7sZ7aGtt+j2TRuPJwnpHvSREb2/X7EQ/P3EbFeKFOFrCwxW2iZ/6Av8yqsbEx/zwk77snJjoMMdA5wlYgmk5c98wKzOw/VYYIUaACfrTASLTMIG+DuVTUpMTPPV86D6UUCHmeczKFx0xM+6hU3aXtAO0oKr/0cxxyEG5irW/dBeHNtqLOkdIp0BNa4xNv9W8cqqJlVqqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0lVqEgne2CCU604ZviDZqPCpqQufrPW3RonEOcw48o=;
 b=wADm73/OPPxaP4VWOD42u6r/l0V5C8W7CyYyvv5Hn1JgwPV90XvQCxd5EA8KGqYosa4udZOHZb/EArk7jhbP0FhUH94+hTYx/kiEENHm/1XPSisInNnGytzEm05vEFspTtraSVndx13gkOofPMRYNEHUZhCAUxu352y+M7jIZFI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 9 Feb 2026 17:26:54 +0100
Message-ID: <DGAKLSGGUD3Z.36NW0SSYZ8ZW4@amd.com>
Subject: Re: [PATCH] x86/hvm: short-circuit HVM shadow guest creation
 earlier
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20260209144049.86535-1-roger.pau@citrix.com>
 <DGAK325RDOQA.3QQFQYK6R0KWP@amd.com> <aYoHO2WDnVR4wIL5@Mac.lan>
In-Reply-To: <aYoHO2WDnVR4wIL5@Mac.lan>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001504:EE_|MW4PR12MB7168:EE_
X-MS-Office365-Filtering-Correlation-Id: d303d922-cfd0-449c-d8a6-08de67f80c97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VUk5eGY1Ujd4clNyTnJOYXBLNGx6L2JSRTVQcHhJY1lUajZndnRRV2lqWXFm?=
 =?utf-8?B?SkZvcDRaTzZTdkJUWDRzTXpkREVGSzEzeTJHZE00WUtZSVZTbmN2cXB1ajZG?=
 =?utf-8?B?ZUpvL2tIMlRxamRRRndsTVhkaTU1T25iTHlueTVORjAwcVlyb29ENndRTkN6?=
 =?utf-8?B?SzYxTDFEQlRvZ1pXbVZRQmVkVDA0bzF1L2lad3BmWDBNakl0S1lab2VlcVpF?=
 =?utf-8?B?eVdzeDEwaGxucGp1MFRDa0lRT3BrNnJsM1d4MnJzM1UveXI1TjZkV2NFRnho?=
 =?utf-8?B?UEdpTDQrNTc3Z3ZmUVlCdHRSZTJscURQOHJJT293eFkxU25kOExub2VhNm0z?=
 =?utf-8?B?c0VYME9VajQ4emJHd2xoZmxXa0RqQ2FzQlpoR3J0YlZDYzhxbU15N1ExWHFQ?=
 =?utf-8?B?WVBYa0pTbk5aQ2FhcWFLWVI5OEQ0K2M2Y2NUN1p2R05acXErYkZIdXhLRU1X?=
 =?utf-8?B?aUNNb2ttSVB3YkF0OElmU0hRMnhLL2MzOUtQTUVVOTBJN2xkcnBreUpEay9C?=
 =?utf-8?B?RmdQQSs3b2xFRm1rMVZQcVZEWk0zU3NZY0thRU1qRjV6Q1dUdkdFZ2hxWkgw?=
 =?utf-8?B?TkNmTE9CQS83WUVyNXVhRzErYTAxbDNoajVWd2ltcXFYREdvUFhlNkcrUUk3?=
 =?utf-8?B?emx2cGRrd3FDN2V6cUpmRzZpN01ia2tza1lDZE44MzZLOFE0T212UlVsZ0I5?=
 =?utf-8?B?N2NldW5TMjFCWlhBUmZISU5rdWtCRGgrTnZxcURzMm8vbnVzeWlHalVidlUx?=
 =?utf-8?B?MDh3SVFtaWhSL3dPcjBnVVlxV0tDLzRQWndhYUUvN3o1Z2lXMHdZTW4vM1pu?=
 =?utf-8?B?S2d6RGhjNytCWmtrdi94dzkrWUFqY0p1QjdpYkJZaHQ4bTh2dk5RamNCWks1?=
 =?utf-8?B?OGZtNVFnRHdkaWtWREdMbmh1ZFVLUDA2OW5jQ05ocDhwYlBDSkxvZi84aEV2?=
 =?utf-8?B?eGpoRjZEY3BUV0FUL01UU3NoZUZkcTFXdXRFZTA4TnduaURDOFExZVJya01S?=
 =?utf-8?B?dWs1WllpdU85cFJNNW83QjFjVnlub0pYWkVvNUpaZWpvcUJ4UVhRVDZxeC94?=
 =?utf-8?B?dXRPRCtyaWpkL3RVV0ovalN3VzNCWVMxeTVpNnhYT1I5eHZiZ3h1SzVCd0wx?=
 =?utf-8?B?ODNwM2xHNkFjT1oxdVVYcUptMXhqSTVGRSsrZ203UFlTZTR0MTNjSWV1S0cv?=
 =?utf-8?B?Qit3YlBraU5yV0ZiVGZyd0pyRzR5d0hvQ2VueFV1NW81Sk4vTU1tQ2FQOVQv?=
 =?utf-8?B?OGxGYUxuVXFScGcvRXRpd21iMllRb1JIMzBRYUVFNTlXTzBzQkdtTmgzdTZY?=
 =?utf-8?B?VmJOU2U5SjJDbk5kcTk4S3pUWm5uUnFmMFIxcmJoemhKSTJQVzdtSm41bDVL?=
 =?utf-8?B?VHI4c0JGUitjaDlJWGdUNitKNjVUVHg3N21DZXRiclpkcWd2WENGQnk0ZzBI?=
 =?utf-8?B?SmpMWGw2Qi9YSGtpc3c5QWlDUUt3MWhSRDlRSE1rY0dINWl5TDRXMzI4MkYw?=
 =?utf-8?B?cnF1MFZ5cHNhQk5wUTNCS3NxOStMaUFNUHlXM0RqdFZHWUZHaDZrbzZhVE4x?=
 =?utf-8?B?ZjJjWWZiMlQzL1pxbjJzRjhlT3RQc1p2QklMMlBBTVlMbTVBdXRyekZ0YnhP?=
 =?utf-8?B?Q1phMFVWa0xSeElnenR6bzMyVkpVUVROZnhsaDdBd3AwWlNSMENycFU0YTZp?=
 =?utf-8?B?Q0drdFNHMlE1U3p1YUYvSVNPSXczSklKT21nZkwzc3lvNGdpWk12WFQ0K2tL?=
 =?utf-8?B?R2VRTWsxUTBhMEVzd1RIQ1p3aFQxSHhvcklTN1F4K0JHdFc0Um1ZYnViUnRu?=
 =?utf-8?B?UHdkTkVEZ2NrU1pKcjBGaVAxUWNFcDBGR0lnS3RRUkJyeUxPWlltM1U5MlJD?=
 =?utf-8?B?VE5jL2VMdGw0K2FoMWJVdUZEcmNDS1NPNUJqeVkzbEJCS3hvN2hRaHRTMnZy?=
 =?utf-8?B?VC9nVkQrNk80dXhDcFBJR0lxSURFdTZDcXlaRTNkbDU0Z3MxWER1NlprVTFL?=
 =?utf-8?B?bmRKRkpTc2JncVBsd0I5Q1BwZVQ4RXdJM2NCdFY4Rmt6enF1dnpEM2hEekZj?=
 =?utf-8?B?dm0vK2txaVhWZ2lUR0EzS1pUK1F2NU5OMWV6b0NkMnR2NGp6L1FkR3BFRzlR?=
 =?utf-8?B?d1owcUJ3RDByV3ZjOVczVXlCUlF6UjI5TlZwL2QwY3lsSUJsNERjS1VNVlYv?=
 =?utf-8?B?VVBnNmNpMlJ4TnhCdUk2QUlRR3ZVYVIySXFPdDBDM01FbmRRZHh3aXR0YWJx?=
 =?utf-8?B?dmlZckdXV2dMOFYyVWhtbkxRbkNBPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HyyYZU19RrMBK4A4DwN67EMRTVdZIEB7zRyVEt5RFVJpC2yGxtuMSvtt/LH0XcPv6XwNki3anwyWywlTQuH9hKzrJqZ29g//aPiY/fxMoCznn7f6OVb+kp+77RqYId2WZArGaSPfPJ7oHoQoxEW/XYRVnfvqHWweFX0AVoxfQPvXCJH3PHWujmV5vkT83VZLta7EK4zCHedWm6vP4f3QpJjlTVcuXkP3hRBSzacuJxggRaJMzejUweDxwJYvvIy5QFEpjscGecE9xrJc+ji6la2P2XlOoolmTeqG6m7BUUt3w+InTBJj0n/KHqxigkTJ6BuLy+16rglz/5U3xyvY4jQA9h1DEfgD4ZoXuQiZCAQnWKjbLPDYKk4jHkhusmetBY8pgjXYNUR6rsX/mNWXSgjm+WAk4lh/eOBC2lNsOWOqAjsGShjD699gYmasPCcl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 16:26:59.3370
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d303d922-cfd0-449c-d8a6-08de67f80c97
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001504.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7168
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:xen-devel-bounces@lists.xenproject.org,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8CC09112801
X-Rspamd-Action: no action

On Mon Feb 9, 2026 at 5:11 PM CET, Roger Pau Monn=C3=A9 wrote:
> On Mon, Feb 09, 2026 at 05:02:26PM +0100, Alejandro Vallejo wrote:
>> On Mon Feb 9, 2026 at 3:40 PM CET, Roger Pau Monne wrote:
>> > If shadow paging has been compiled out short circuit the creation of H=
VM
>> > guests that attempt to use shadow paging at arch_sanitise_domain_confi=
g().
>> > There's no need to further build the domain when creation is doomed to=
 fail
>> > later on.
>> >
>> > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>> > ---
>> >  xen/arch/x86/domain.c | 6 ++++++
>> >  1 file changed, 6 insertions(+)
>> >
>> > diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
>> > index 8b2f33f1a06c..8eb1509782ef 100644
>> > --- a/xen/arch/x86/domain.c
>> > +++ b/xen/arch/x86/domain.c
>> > @@ -627,6 +627,12 @@ int arch_sanitise_domain_config(struct xen_domctl=
_createdomain *config)
>> >          return -EINVAL;
>> >      }
>> > =20
>> > +    if ( hvm && !hap && !IS_ENABLED(CONFIG_SHADOW_PAGING) )
>> > +    {
>> > +        dprintk(XENLOG_INFO, "Shadow paging requested but not availab=
le\n");
>>=20
>> nit: s/requested/required/, maybe?
>
> The wording matches the rest of the messages in
> arch_sanitise_domain_config().  I'm not saying that makes it correct,
> but if we word this differently we should also change the others
> IMO.

My point is rather that HAP, or relaxed MSRs, or other settings are activel=
y
requested via createdomain flags. Shadow is instead the consequence of not
setting HAP. You don't request shadow, you either requested something else =
or
you hit the error.

It's not terrible wording, just imprecise.

>> Also, with this in place can't we get rid of the panic in create_dom0() =
that
>> checks an identical condition?
>
> Hm, I would possibly leave that one, as I think it's clearer for the
> dom0 case.  Otherwise someone using a build without HAP or shadow and
> attempting to boot in PVH mode will get a message saying: "Shadow
> paging requested but not available", which is IMO less clear than
> getting a "Neither HAP nor Shadow available for PVH domain" error
> message.
>
> Just my thinking, both checks achieve the same result, but the error
> message in the create_dom0() instance is more helpful in the context
> of dom0 creation.

Fair enough. It doesn't matter much anyway. With or without the adjusted pr=
intk.

  Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Cheers,
Alejandro

