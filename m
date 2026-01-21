Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPkpD5PscGk+awAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 16:11:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B3258FA6
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 16:11:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209879.1521765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viZqp-0005U3-Vm; Wed, 21 Jan 2026 15:10:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209879.1521765; Wed, 21 Jan 2026 15:10:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viZqp-0005Ra-S2; Wed, 21 Jan 2026 15:10:31 +0000
Received: by outflank-mailman (input) for mailman id 1209879;
 Wed, 21 Jan 2026 15:10:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6Gw=72=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1viZqn-0005RP-U2
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 15:10:29 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51501b5e-f6db-11f0-b15e-2bf370ae4941;
 Wed, 21 Jan 2026 16:10:28 +0100 (CET)
Received: from CH2PR07CA0053.namprd07.prod.outlook.com (2603:10b6:610:5b::27)
 by IA1PR12MB8538.namprd12.prod.outlook.com (2603:10b6:208:455::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Wed, 21 Jan
 2026 15:10:22 +0000
Received: from DS3PEPF0000C37D.namprd04.prod.outlook.com
 (2603:10b6:610:5b:cafe::be) by CH2PR07CA0053.outlook.office365.com
 (2603:10b6:610:5b::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 15:10:21 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF0000C37D.mail.protection.outlook.com (10.167.23.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 15:10:22 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 21 Jan
 2026 09:10:20 -0600
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
X-Inumbo-ID: 51501b5e-f6db-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iyr+U0S1klq0P0K9s2y60wn8dUsDuoEXlRs4Q0dGBqA8mp8plQP5fNC0NrUHUaPCQsejzdbvkDvwhzu8wBM9tiRegVsAELhhPdpSjKkOydLcQn4+G9CAafnL/o3G5JJ04uDzdMsMsVFEmuwHWQ97eQfN3BIxNbPQlfLcgw7K97z/HG57Gv2L6mKOl2cThm0FIkmw7BWrmBpA4KppLH2UkUEc4kojSpF+AkNOh8s3+wc4dSMWbNRQoEOk25QINaa2NeuYumIv6D8GqrwwZ/x0jUaOz8gcuR1qAMStJ98u7TTQHh86veI7bC7mduhuE6cuORpIR0S42OF42VyOYqWK7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9c5l+oGHnTXRL1LappdvbRkqqUgTw/8u1ICx4VqNYU=;
 b=jdRpv6GxnFPc+gjN2LigS/dQ6Qo0w8IPcwM6FNNPEB0O5F6gsmuVSHZJn85H7jn6Ypbrohlc24r9VCHCacPjAGjnbap9C6kxjRl+8GY02JiAc3dg0dYXsV9N+bFjYNgWhHVRKZmjvLIZseS4ej3mYWphkg3awsGx5AMVphE33hiFuhb7xhfI4yT4PGASoWjGiy2orR4YPwTh0Zzh+pNrEJpsb0Qdh2UTC1y6tgBXbRgb8ps3dBrUZO61f2t1v2sOqxj+CCqnfvscXkBNaEO6V9SB65yXIx9RFksAAG18KsRNstRE8IggYQ9jLkfC1DKMF+nQ+bq14AXpXDnKHuZmtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9c5l+oGHnTXRL1LappdvbRkqqUgTw/8u1ICx4VqNYU=;
 b=H9bQsP03hAoOR8ix0YgWDreI/DhdmBbnUAw/LIE1SMAL1hA8a43NCIuLIupnWriRoMfZAMZtFEKRXRn01D2rsc1k+QKvAuq3C7wHQjojQV0h0nTa8k1+ssj8STxxp6nJziCDDTIkwykzt3639o8HPV1t+1prhb2s50HkwaMH6pM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 21 Jan 2026 16:10:18 +0100
Message-ID: <DFUD2SFW5QFR.FLQRD7H4T5Z4@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 1/2] x86/svm: Add infrastructure for Bus Lock Threshold
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20260120095353.2778-1-alejandro.garciavallejo@amd.com>
 <20260120095353.2778-2-alejandro.garciavallejo@amd.com>
 <9097240c-a892-41e8-a686-b89d84d0c03f@vates.tech>
 <dd7404b4-7f31-4189-937a-0278eb54bb2a@suse.com>
 <DFU9WAGCWK27.1UYPR2JSWZHKF@amd.com>
 <8d627df5-5de5-49bd-ad15-abe2bad486f7@suse.com>
In-Reply-To: <8d627df5-5de5-49bd-ad15-abe2bad486f7@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37D:EE_|IA1PR12MB8538:EE_
X-MS-Office365-Filtering-Correlation-Id: c6b64272-4204-46ab-b365-08de58ff32a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UEdXb1liNW1YUVNLMSs1S1pNUU9NaGtHWndrUlFMTSttdUczWVgvb0tFWkJR?=
 =?utf-8?B?bHN4d0FKZkw5Y0dMTW9uWmIzenlEN1FLQklzaC9zQVRoV2dqL2krOHkrRk81?=
 =?utf-8?B?OTN2TGZDTjlPZ1dRUGdaekdpVFlGVjUzU092QjdxektFb2Q3b0doNnJyZisr?=
 =?utf-8?B?Z2VTK0xhY24zYXQ3VHFUYXRmZFdoeU9UeEJ1U2NUaFVaRGdhK2lDRFZKRksx?=
 =?utf-8?B?dEpndDErWld1SVJQYVFEZEMvMGhwS1N4aGRkMFRQMkp1czl4WjlBaFNMenZQ?=
 =?utf-8?B?Q2N4Y1FqL1kwaEt3UE5KVXIzTmlnWFBYTlFYRnVEUEQzOWlWWGwvUDdqamxY?=
 =?utf-8?B?STZWdmovUDAvK3pvK3YvWUh2RzlOT1FYMzYrdGRHK3BwVE1XS1pnMlh2Ulg0?=
 =?utf-8?B?TVFvczhZZzdDSldKaHVWSDVUeVpPcENBWitJaVBPa2NTUS9QaCtrZ1M0Yloy?=
 =?utf-8?B?MitVZUpDOFE3Y1E3bHViYmpjSkIxY1hIVHNZK2ltd25JVk04amhmV1FPajkx?=
 =?utf-8?B?UHNUYmRFaTVXNnZzYjVZWnFZcWhmVGFETTkrcUgyMFZJbnpVbERPbE45c0tq?=
 =?utf-8?B?OWxtNW1MZmRQS3hKQ1VGOXVRWnc5bStpeExQTGo0QlRhckQ4ZzF3ZUNFKzVu?=
 =?utf-8?B?di9JK0VIU2pLV2lFcjdESVBwc0VoUUQ1MjQxRGNKdjRLb3A5endhRVNvY0lv?=
 =?utf-8?B?L3lmN3Nhb0thYWJldHRnZUkvcDNDUU55NkxHVG1iME55MnNxaGZGbnVXTkQ2?=
 =?utf-8?B?N2tVMHgydWMxd1M1N3FRc0g5KzVGS3N1dzFCTXRqaG5EQllESWRNK1htZjFO?=
 =?utf-8?B?NzdlMkxZV3ZIbGRua2t4eTdtMElZbzJkZStMV0YySWZ2VDJVQVZNOXl4QU5S?=
 =?utf-8?B?WWljQ002SUdUL3FQRW16NmNRTjR5WTRTQUNKRTMxRzJjQTl4Nm9wdlFyN1VN?=
 =?utf-8?B?ODhpeGUvTE1RZ1p3clRXaEp1RmN4UWRoYk12SVpQRDh0UC9BL3dha1Q5OTJ2?=
 =?utf-8?B?OE1qQ3V3dUpVNlRUeW5FN0VkRmRWZlFrSmtjcUZmN1luVC8zamtZYVYxcWtD?=
 =?utf-8?B?UUxYOEc3clE2Njh0TzhaV01tejNnVjRsbldqVXJlcWdmYWxFSjFYeWYxM3or?=
 =?utf-8?B?U0R3OURhSHdFRDZYKzdiQkQ4S2RvTkU1b00wTHk0YTl5MFB0aWNXQWNQajBI?=
 =?utf-8?B?bDZTam1WZkYxbE1QM3h3WVM5T0NObzlZOGR5T3g2RHovQnA0bmVxd3VibWQy?=
 =?utf-8?B?bjRYc2lMT0szQUs2a3BsNGhUb25SaVZxQlBxMWFLcGRnVmJTaU5xWmlzVGR4?=
 =?utf-8?B?bE5DRERieXluQkMzeXVNdTI2dk9SZkp1a2JQRE83V0ZxSm5xR2tqUlNoei9M?=
 =?utf-8?B?YmdEVzI3MTNVdFRraDFtVmVoRm44VzZ0ZmJMbjJvS1ZLWHhzR3VQT2tjWTBm?=
 =?utf-8?B?ejJab0ZlakY5STMwUG1EZDdyd0tReG56WERPNFU3T2grQXdFYU1icGgrdjNE?=
 =?utf-8?B?Rm5VTy9XNXo3Sk9oejU0VGZvVEhqaFgzdkFRakFHSkdHY3Bhc0N1Y010Wmph?=
 =?utf-8?B?ZUQ2bS9KRk8zbVlNMGNDSHNtUUdBUWw5cHNJZGVrTjRxVzQya3VGVEtWcEhi?=
 =?utf-8?B?S1NPVkdTOWRuNXM3a2k4UXY4SVhtUi9EQjlXM3lmV1hMeXFHNDlXbE9BaU53?=
 =?utf-8?B?bktUV2xUR2w5UVc0VVdUMHNBNDY1MzBtd1IwZm00S1RSWmdiNm5mZmR2WlAz?=
 =?utf-8?B?MW5xblFJY3BYekdBS09NRFpoeFRnamZFUVEvWjhiNzd6L1dNUEY2T1FuTVhZ?=
 =?utf-8?B?TUUxZ2JmdWovdTRrSWd5QkppWTV4YzNZdWM1M0dLM05Ea2dOQmQ3T3Z2ak5E?=
 =?utf-8?B?SDFCZCswWnlFT3ROc0VkZFE0aHJ6SkoyUXFnWHdtbkxTb1hEWE5UYk1nTmZh?=
 =?utf-8?B?Q3QzNW5NckNGTTVHZ2Z0a3dLTnB3TFRtdTFrbEsycm1uS0pMK1dDSytKcXNo?=
 =?utf-8?B?UGMvMlJrUS8rbWRSb2p6MDE0bWE2bEFKcUx6VlkvSGVNZDEremM4Qi9peURF?=
 =?utf-8?B?ZEVRdFdTZGljVG80eVcydGRnWDJHYWlXQjByd0Fobkd1NnFKREJBc2pXM3Z6?=
 =?utf-8?B?Q3pFSTJxQVhWcjh5L1BSbGg4YjI4NDJRUjczOXpXV3g1NkhHNm42OGJDNmZG?=
 =?utf-8?B?cThBaENzQ29IUzd1KzdkK0t0amFqWnlFTXNwQm82R015cmE1cldBNkVrd1dH?=
 =?utf-8?B?UVBrV0FiZTlRNWJZcGl6eXJzV2NnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 15:10:22.1762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6b64272-4204-46ab-b365-08de58ff32a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8538
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 92B3258FA6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Jan 21, 2026 at 2:07 PM CET, Jan Beulich wrote:
> On 21.01.2026 13:40, Alejandro Vallejo wrote:
>> On Tue Jan 20, 2026 at 2:30 PM CET, Jan Beulich wrote:
>>> On 20.01.2026 14:19, Teddy Astie wrote:
>>>> Le 20/01/2026 =C3=A0 10:56, Alejandro Vallejo a =C3=A9crit=C2=A0:
>>>>> --- a/xen/arch/x86/hvm/svm/vmcb.h
>>>>> +++ b/xen/arch/x86/hvm/svm/vmcb.h
>>>>> @@ -65,6 +65,11 @@ enum GenericIntercept2bits
>>>>>       GENERAL2_INTERCEPT_RDPRU   =3D 1 << 14,
>>>>>   };
>>>>>  =20
>>>>> +/* general 2 intercepts */
>>>>
>>>> nit, you want to says general 3 intercepts
>>>
>>> And then, further nit, also get comment style right.
>>=20
>> What do you mean by comment style? it's a /* ... */ oneliner that matche=
s
>> what the other general intercepts say. What am I missing?
>
> Quote from ./CODING_STYLE:
>
> "Multi-word comments should begin with a capital letter."
>
> Jan

Ack. Though also from CODING_STYLE:
    "In general you should copy the style of the surrounding code."

and intercept groups 1 and 2 also start in lowercase. I'll correct both as =
well.

Cheers,
Alejandro

