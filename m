Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Cm5E+Vmi2kMUQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 18:12:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DADD11DA88
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 18:12:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226749.1533241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vprGV-0000ZU-Hk; Tue, 10 Feb 2026 17:11:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226749.1533241; Tue, 10 Feb 2026 17:11:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vprGV-0000WR-Ex; Tue, 10 Feb 2026 17:11:07 +0000
Received: by outflank-mailman (input) for mailman id 1226749;
 Tue, 10 Feb 2026 17:11:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iBUt=AO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vprGT-0000WG-UJ
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 17:11:06 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7765d430-06a3-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Feb 2026 18:10:59 +0100 (CET)
Received: from MN0P220CA0015.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:52e::13)
 by MN0PR12MB5739.namprd12.prod.outlook.com (2603:10b6:208:372::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.17; Tue, 10 Feb
 2026 17:10:53 +0000
Received: from MN1PEPF0000F0E3.namprd04.prod.outlook.com
 (2603:10b6:208:52e:cafe::77) by MN0P220CA0015.outlook.office365.com
 (2603:10b6:208:52e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 17:10:52 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E3.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 17:10:53 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 10 Feb
 2026 11:10:42 -0600
Received: from localhost (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 10 Feb
 2026 09:06:38 -0800
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
X-Inumbo-ID: 7765d430-06a3-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bfWYo31uYAqXLWynwInYvtlNsXdZRJ6zYfepDQgmVFf08chtt3YfTduzhQ7WGsDL31cCRcdvdC26s23LSHPMrPAo6TP+XW+js3S/UCyVmnH2tZnUZ0VsgvZL8H9bbB7Hz42TEI4m1PU6OUz6WGjMRGAUNHs9VD1NLi9cGpFTLXOjZPSpMLI7UbY2t3zUEpD5yaHY70b4pr6SR6a6derQCArGhNBqVXPA3TUgeg4QcHunk+9R3l5w7+AHsFGrPZjAyjfu2FiWpMkG/xajn6RWYvkjtcYpjNQIy9hAweanubi7XLmtIo3zzSx7R45u17byF+2Piq89aiLLIx12uoHE/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LsPgQMSQ/Ud3LiqV7TLiHwOqf0ZsclNkla8xSgflwro=;
 b=cLF2uW/kzwlMsxlSVxAagdjHlNA3lyp9QLwRClU7Fk8Zo0GIq0BfCfpvwgZmjmxNysfU2JccH65grVUtRW5C48oxlRkfQuEhHVtGaWIVx1ULHWkl1sj9cehMlgFpPvl3DX4VWwdbHA4vk27AdtmiUNdB1GCNV0WDKBje8hpZAC/YHieWzqWJtVqIfvFX5iPq6uVQtNGZMY8h1EttJG9u07Wsq0PE0xXM9opipVhwFUO+/lqZAXy+BQHPkZDpXiEoPYW78dlPSzhHyfaKLPM5ZiA8990vwuLzkhNKFZHYENi2d6zmfPMHObNuSPJVPdJuDr4ADcpqZ9he095o9sjt7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LsPgQMSQ/Ud3LiqV7TLiHwOqf0ZsclNkla8xSgflwro=;
 b=NZs4R1YXqnko3m6CiUQD1Z5CWWhPNsheBRu/Byjb4S3l4zBZ7dU3HQnDTiZ9l13t8mLb0kgh0FLD6XfWqrPkVMEKj6L/C2paeoocF15csE5mX1q0X7JiRopoLU0PLLBHafJZs8wz1oU2zLZ1tis1wWQlHK4/PF2yR9LU3GkpemU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 10 Feb 2026 18:06:36 +0100
Message-ID: <DGBG2QGWJQCR.KCWQYCR1R5BP@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/domctl: Conditionalise x86 domctl using DCE rather
 than ifdef
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20260210151008.217830-1-alejandro.garciavallejo@amd.com>
 <6152fc3a-0169-4cbe-b1fb-a392901db34e@suse.com>
In-Reply-To: <6152fc3a-0169-4cbe-b1fb-a392901db34e@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E3:EE_|MN0PR12MB5739:EE_
X-MS-Office365-Filtering-Correlation-Id: 6024214c-6d5d-48c0-82c7-08de68c75902
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OEpaWHllMlJ0bVRZdWVrY1p2WHVOOWN0MHhuUWh5WWJBSFZ5ZDJKWG9sYVQ0?=
 =?utf-8?B?Y2tDdkN4T3U1Z1FzU0VPS0ZJcVNNL0huNmR0ZngyVFgvQlBBR3F6U2pWRlVI?=
 =?utf-8?B?WE1YbjUrWXNtdjdoV3FpWDZ4NnhPWFZDSHdHbWpwVGcvUE45eFYzTkxJY1BW?=
 =?utf-8?B?RG5DQ2dBM1pTWXppL3ZtdHVSYWkyOWQzSzhld3hESS94cUIwbE5PRWZZcktp?=
 =?utf-8?B?VmpBV0V1REFlQytNUlhQdmxpdStzbTh1dGlleWZ1WTYxL0ozSXpWWWdYZlY0?=
 =?utf-8?B?UVNrZU84ckRlV1lvcllyWm9zbXIzN0ppK3VBTWs2N1c1dmFxTWlpOEtmcXhP?=
 =?utf-8?B?OFU1STdSZm1kZG1yMUQ0M1ZGNXFnYm9yaW1zd3poR255Z0RJRUhCbzJQK0ti?=
 =?utf-8?B?cVdZSS9Lbm04M0NEYkFKZ3piMXo1L2V5enQ1VkdlMjdtTEVFSm5SV1M5b3lQ?=
 =?utf-8?B?QVVuRXFVZGtpd1YySnhYYzFPMHdSV0ExUlVjWmpnT0YvRDEyTmJqc1BXTmxS?=
 =?utf-8?B?N1lJZkd2SFlwUTlUOWlCZjY3RW94OVM0dkRBSzMzTFhVOUZHQkR6VnZqVEFn?=
 =?utf-8?B?c1JlYVIrdE9jcENnYnB2TjRVclAwYnNrNmhGZzRjSzdqbHIxdTBqblBZbEZS?=
 =?utf-8?B?YTRmckpzcHJpUnVhbVR5UHNkcXg2b2JSUU5ncUVXVDlPSEoybDZyTzRqWDJ2?=
 =?utf-8?B?ai9TMm02ZUs1K0FjUDUxT0MrUzd2bUo0MEhpeXpGeDl5d0JEMkxpaWFQOVdY?=
 =?utf-8?B?VTc4a3RCNS9mZVJnSisweHJBRUNuMkNneTdxdGNIVjVBZ092ZWYzTlM5TWl6?=
 =?utf-8?B?Tzl4Ni8yQ1BJK3NJd2FYVkIxb09pdTlBRzVRNjQvbTFwMExqci9UV2VBRnVy?=
 =?utf-8?B?aUtXUk1yRytkd25pVnhRd2QxRWExWVlod3haRHpieVpEQXZaRVRjbkV2aDh4?=
 =?utf-8?B?eG1uMkVSNDJ2MVkyVXhQUzR4RU9MVW9nc0VzN3QxSXpOMjRBRWZZTFV2Zkdw?=
 =?utf-8?B?LytYQXlGQ2d4YitHQzFxTmdpb0V6WHo4Sjk5b2VodjdqMGx0SlFrUUhzekJ5?=
 =?utf-8?B?cFMxMk5DbGQ3ZGhNZ0xKSmFnQlFBeVFrWVE0VFNQSkw5cmhCSzBpai9ZZE9r?=
 =?utf-8?B?SS9QNnY5bWt1MTRyQ2dFR20zcjBIdXE3Y1Badlp2SDBKOWxIa3cyc1ZzTHEx?=
 =?utf-8?B?Y0pJbnh5djFjMURxdGxjTi9aYW1aeWNVZUdNVVlzQjIyTXphVnd0WGN4VFpp?=
 =?utf-8?B?SXZUMFNJTENMREtUMzlMWWdwMTQxY2ZqWWFSZGtxRnBQMXRSNjJxQUFkaWh6?=
 =?utf-8?B?NVo5UzRleFg2L1oxTkpaa3dzYW9RNThQeU9UYTdKWGhrUDBFVGg1VVhGaDB4?=
 =?utf-8?B?V2FjZllSbzBXTzdhTFZXMWxJZURpUkVpWmJKd0pXUDZSeFJpeXdsOXFpd29m?=
 =?utf-8?B?Rm16WFI4VEdpTnRCL2g2Z05xZXcvby9QbFVyTWRXamozUVZWT1BjQ2JZVFpn?=
 =?utf-8?B?Um5wRThzNUZpOVY3cHhWSnpJcVQyOUdXcHFRbGViRFBoWjdpYkpPQ05VNlpw?=
 =?utf-8?B?TG5SQkhEOTRuOGNnWWJ2a2l4dDhOeVZWV084bkxCSDFRRW8zNzRzUUJNWjh1?=
 =?utf-8?B?cEhPUDRuY2FOekdGTVhNdnpuR2xtVEZQalljamFqNHl3bzA2cEJTb0t1R2Y2?=
 =?utf-8?B?ZjN0T3Bpc1ZwN1FsV3F3VitWRjd4V3NSRDYwR1NoMmdmbEo0ZEIyMW0zTllF?=
 =?utf-8?B?ZUdUbmlvZ0t2UnlOR1lGM21QWGNLZnVWVmd2aGxtbEh5L2JySHRUWEFlTHVJ?=
 =?utf-8?B?ZnFSeTBFbmUzTXp1VWxaaFBkWXI5dFNzZXQ5NGxnb3BLQkhUOFF5NlBvb0ox?=
 =?utf-8?B?N2RXbWk4VTloWllyUFltREdHdHN0Y0MzMzk4VjRXZklyMWI1TXNnR0ZTM2xT?=
 =?utf-8?B?dkRKNWNVbnRQYU5hUCs5UjVsLzZWMnlzTkZWMGxiQWNncXYreEdpUUV3Zkdm?=
 =?utf-8?B?Q3dOSnc5Z3lQTEx1a242cGRNTDE5bWV6SDdTQkNFYnFqNWFiZVNaNkJLZ09Y?=
 =?utf-8?B?Q3ZncUlSVi9ESGRvTUthUldPSldZZTVDdUNRaDN6aWlPRUxJbnFkWUg5ZVpU?=
 =?utf-8?B?NHl5ZFJ4YVJYZW9vQ1RwR3lUK0RkNUpKbmRxYTdHWklVdElIa1ZBRS92Sngw?=
 =?utf-8?B?RklvdFRPRXJhZG8yMGNYeG5QdjExOGV5WHRaQ3JSUTgvcGllWko5dlM1N0cw?=
 =?utf-8?B?WFhuTk93SnpyNkMxaC9tWDRaMHpnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vKXhjF+5z4gxCnlwC4GwWZqVbmcxI8cxZRIKuRaOHGOjGSf/O9D+dheZkA6EMhFpsMlwfhgMUulPzzjiTcdwyLfn6+mh/lc1ESkW4SfytSCn/pA6K+isZ0+7rIIvyew/zqpf7AJJaBh6Rh0fc4rlflHNepHuW2GbXOyrAqBBSv1hXy5nZrIs+PzWUrbzi0IoLopOsTh19YuIKqLGTYyAsd03MRSFtmlrc7cXFYv9IyjoO5qM+6ZGf0L8KURKcHZV1ptvSXQIJ9NarBO+npTfeuRhJ6o1FkYY0EP+XkPU6toCI3dP2bzB8G1rvLo8+TJfTHZ66C0r7kiRdFQq2I5WED9LdbfSly3zDTU1paye7ar3IOYmmjtUW0MFCMDFBTp5ccPqa15NHL3mRJkf9w328jmJNbvG8uWKx12mr24wuxpylO0pHUT7eENgPwrwdfA8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 17:10:53.3866
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6024214c-6d5d-48c0-82c7-08de68c75902
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5739
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 9DADD11DA88
X-Rspamd-Action: no action

On Tue Feb 10, 2026 at 4:39 PM CET, Jan Beulich wrote:
> On 10.02.2026 16:10, Alejandro Vallejo wrote:
>> @@ -1033,11 +1035,13 @@ long arch_do_domctl(
>>          break;
>>      }
>> =20
>> -#ifdef CONFIG_MEM_SHARING
>>      case XEN_DOMCTL_mem_sharing_op:
>> +        ret =3D -EOPNOTSUPP;
>> +        if ( !IS_ENABLED(CONFIG_MEM_SHARING) )
>> +            break;
>> +
>>          ret =3D mem_sharing_domctl(d, &domctl->u.mem_sharing_op);
>>          break;
>> -#endif
>> =20
>>  #if P2M_AUDIT
>>      case XEN_DOMCTL_audit_p2m:
>
> What about this #if, though?

It missed the grep. Should've been changed too.

>
>> --- a/xen/arch/x86/include/asm/mem_sharing.h
>> +++ b/xen/arch/x86/include/asm/mem_sharing.h
>> @@ -9,8 +9,13 @@
>>  #ifndef __MEM_SHARING_H__
>>  #define __MEM_SHARING_H__
>> =20
>> -#include <public/domctl.h>
>> -#include <public/memory.h>
>> +#include <xen/sched.h>
>
> As it looks this is for mem_sharing_is_fork(). Can this then please move =
...
>
>> +struct xen_domctl_mem_sharing_op;
>> +struct xen_mem_sharing_op;
>> +
>> +int mem_sharing_domctl(struct domain *d,
>> +                       struct xen_domctl_mem_sharing_op *mec);
>> =20
>>  #ifdef CONFIG_MEM_SHARING
>
> ... inside this #ifdef? The mem_sharing_domctl() decl may then want movin=
g to
> the bottom of the file.

Sure.

> Otoh I wonder whether supplying a stub wouldn't be
> neater for the single use site.
>
> Jan

Stubs make it really awkward to read the headers. I'd rather not make an
already overcomplicated one worse.

Cheers,
Alejandro

