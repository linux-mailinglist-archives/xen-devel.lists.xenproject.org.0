Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHxVB6uxiWndAgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 11:06:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5F310DF98
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 11:06:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225113.1531582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpO9m-00056W-Jw; Mon, 09 Feb 2026 10:06:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225113.1531582; Mon, 09 Feb 2026 10:06:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpO9m-00053P-GA; Mon, 09 Feb 2026 10:06:14 +0000
Received: by outflank-mailman (input) for mailman id 1225113;
 Mon, 09 Feb 2026 10:06:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EeIc=AN=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vpO9k-00053E-Tz
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 10:06:13 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efc7615a-059e-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 11:06:02 +0100 (CET)
Received: from SJ0PR13CA0156.namprd13.prod.outlook.com (2603:10b6:a03:2c7::11)
 by SA3PR12MB8803.namprd12.prod.outlook.com (2603:10b6:806:317::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 10:05:55 +0000
Received: from CO1PEPF00012E60.namprd05.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::76) by SJ0PR13CA0156.outlook.office365.com
 (2603:10b6:a03:2c7::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.5 via Frontend Transport; Mon, 9
 Feb 2026 10:05:54 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E60.mail.protection.outlook.com (10.167.249.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 10:05:54 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 9 Feb
 2026 04:05:53 -0600
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
X-Inumbo-ID: efc7615a-059e-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DCGeROPW6+ZWzqOsPYI4wfSIsNupsiSe3qw+SsaVpXFHmNgpXlBmJ0lYzS9cg3DBHfzfFpbNU5/OQLQCLMCIBrL4qhsZquX1fmdsoFaN1EY4FPhkdnfuzXM88FUX4VoV8yf0gSLHvqATyFfmEw12d22q63Lbv0uKuKvJc4hnUJ+IKjVHG4FQr1WJ9lwSfsWLwsNMGQzxEfXVGSIr7SJEf4ZIdMmmZP3G54/7GxenKJ5nQRX8UpiWAG9/+4cYg2lWqgo+t0F+h7woO4nrscjMEiX3MyEg2ePFCfy87rZtzjOZshe9qyldiuhext1wJu+AHSqFF4BY18LRTvWj5kmMWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ghaL8GcdRVpjK0JlWhyMVuHmqlJ6wrPR7AlENbBTfI=;
 b=L4J/BSo2ISRQQt+lE2S78xHimJWywlW+kHn5UzkEOm84aDPRU+4bOwe+9pni0o1+F6cuS9eK1FOLeHqVkzo2MXoKXwVOgjfoo2lXglUFh/q9pv6K3X8gMTnBonXU2GOmZXNdqfkYG0GBTIpD1v2rLBlmQnqxLejip21AiW3lKmJQ5EVtDKl0kAhWYftLg8VHrL6yGR6UuWkvdvKoDD0gFzHCoATDkU1visrQ2R43XFAn92oZerunTNCk1HP6ghACh/i9QinJZ+pf+Kk2dOHmv4SJBIShweswMa5aQ3eKIpTvEQq0nn3ywISFdvKiTYjkE/t4v10k0xn7Y9KPKcV1vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ghaL8GcdRVpjK0JlWhyMVuHmqlJ6wrPR7AlENbBTfI=;
 b=qH4pVK/WwPxHJ3t6W9S6rgKVYReOI+LwxbgTj6moBsiEfiXRAZWHT6+m+GUdjM4NtytVzGutf0y89sFCSlZ8mT1AaS9LTpSnIID2qtcpAlPjJSeQ4zTU0FGD/b9EGm6Jz8yXN92d0ku5U2wjPpQOf+FK2D4pzI2uftB22SNlW74=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 9 Feb 2026 11:05:52 +0100
Message-ID: <DGACI1R7MGDO.1SB7OMQQZ1NC3@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 00/12] const-ify vendor checks
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <608472d0-517c-4bc5-b5c1-c278c4f6620b@suse.com>
In-Reply-To: <608472d0-517c-4bc5-b5c1-c278c4f6620b@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E60:EE_|SA3PR12MB8803:EE_
X-MS-Office365-Filtering-Correlation-Id: c921effd-259c-48aa-6b47-08de67c2d04f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eXUxOFBXbW1yYnMzT2Mwb1lPMFFnWnRtVXRpcGZ6ajFFVDJIQnAwNWtoMzVy?=
 =?utf-8?B?ZmFpZzRDTFRmeXdVd294T2x3cEd3M2lDZHNQQ25FUEljdHJidkgzU0xjcU9L?=
 =?utf-8?B?WXFJN3dNZ2NvTTB4MmlPNWp0ZDRvd1BVYkpPVGIvQ2dpcGdibk9kQjZIQm5J?=
 =?utf-8?B?N2xMNVZPM0pDMkZ0MVJudEtHWGpNTW5CVURyaXBVYzR5c2FzOEZiK2pFNlVF?=
 =?utf-8?B?RktLSWNxeXlFNlBTMDJmUFIrdzZGcVR0ZURHUlJaM1BJOCsxYXBJWHlEeXVI?=
 =?utf-8?B?YjduM2RVUXZEeGlXUC85ZytkTk9mNzZwK3VyeFRoV1g3MytoTDBOVWZYY0tN?=
 =?utf-8?B?VHgzQnlNKzMrRks5K2tMOWQ4UXViVXdpQ2RkcllOUmxhUjR4Rlh6U2ZEMFMv?=
 =?utf-8?B?RVorMm92K1ZkNUZXeWg3T1JwaFQxY1lJMjl4eFdxRkd0NlBXYzh6aEdtcXVs?=
 =?utf-8?B?Zkh3Y0hsZlo0cmY3WTRFbWhJa2JxTHo3RHBCTFJEbTYvcHZYQUZSRlVyOGVs?=
 =?utf-8?B?Lzg2Q0U0aEZHVmhyKzlZL1U4L1dqblZ1cWlrMEpaRHlWQlUrZnc2ekQwQWxl?=
 =?utf-8?B?NGlFblJTUXk1S2lqMkJuaWhZa1JQaVV1WEprVEIwcVFkaEtzZFMvWVBWYmlN?=
 =?utf-8?B?UzlUazkvNWwwSEdWL0M1MXlUOWNqditIUzhHeFA2SXViU0Z5VkxQSTZSSS9o?=
 =?utf-8?B?WFZPWTJNdkVsaWdBQVJJdUJrSUcrSm1BbDB3THUzcUVNZmc3a1NMcDE2WUFO?=
 =?utf-8?B?U3EvbzZnNlQ0ZVZLTzdOVXhGRmlTemE1TUsrRlQwV0JGY1JIcitMRnlueTg5?=
 =?utf-8?B?SGxDcjNOME9uNk1YNkdlM3N4R0UyQ2ZXNE5xTmkrVmlXOHdGU0s2eXYvbmM3?=
 =?utf-8?B?NXo0VWNnYXhIc1hRajVuSmQvUEZBaFFjdS80OGlsRS9UdWNNSUt6Q2VxTlBX?=
 =?utf-8?B?NTc0MlQrcDRiVEk5ZlZFY1hpM0hPQjlGc0JISEhtZG5wNGY5WDVEUnVJUi9m?=
 =?utf-8?B?MnUvck1TWmRIT3lNVkNETHBHY0c3QlhPUVVrR1k0dUF0ZEpHcHRBT214U3V0?=
 =?utf-8?B?SXZUZ0U0Skg5VnNTRCsvN1lUNGd5ZUg3eHl2OTJ5ZDdkSWpEKzh0dmtzN1c4?=
 =?utf-8?B?Z3hqSmw0eDR1MVZxR1pzOEdDV253dTZqdS9JdVA5R2t4QWZ6eXZNUVpITERL?=
 =?utf-8?B?WVZxN29aTEZXOU5TZXJKaUhkOGF6MjgycldibE1aSEE3Vk1YamRoUVY0VmZC?=
 =?utf-8?B?QXR4NWpSeU0ycE5Dd0M0cXFYU1lrQkpCb3NPK01XVEV0RFJ0R0d4dW9wYm56?=
 =?utf-8?B?OHUxc2ZmSXZ1dUMrS3BnZVNYUEYydnoxamZrTitiZnRZaGlmTmkwN2hJZ084?=
 =?utf-8?B?NEtDajlmbEtwSmVvODM3RDBla3JQZ3kvNG5NV0QrR3ZDUXFPUFRXTXdodUV1?=
 =?utf-8?B?cy9ZeVF4Z0R0VjRHUVIyVDNWY1pZdFA0Zm0yZEpCbHk5VnRaYk84cjZKWlN1?=
 =?utf-8?B?T2I0WHlGUWdQTVZSR3pnOVJ4Z1JWQ2VmM1dsVUdEMTV2ekErZE9sU083Skpy?=
 =?utf-8?B?dVFuZVhuZE5UYkM3YnUyT2VyRjJlQzFZdTRjQjZQUDY0SEgyRnJKLzIwZkRz?=
 =?utf-8?B?NGpvdWpWQlU0bkRQQkptZS85SmhnZndkZ0d0MWVqN0phYk0ydSs3REhCRVZs?=
 =?utf-8?B?WnE1UkxkYyszVjdFcktRSzdacEhvUnFqY3hUcEpldG00eHpxdUVLQTRSaHhJ?=
 =?utf-8?B?WDB1WWNId1VJMzdmZGR1ekFudVppMUl1WDhQRXFRa1YvejBLVUlsZkFZNHdK?=
 =?utf-8?B?NTBSblc2V2svajZXR1FLcHcyc0J2b3dCZkFwTVB1aDV2aEwrbXdwRlVqOExZ?=
 =?utf-8?B?bHhwWDRkOUk1dXkrVzdaOGdFNkZPZjlmZGQwVTdBa3phNFJtcWFDNXkxUjhl?=
 =?utf-8?B?RUllaHNNT0Q2TElqQkp0bVA5djFpMzRQNStrdlA3c2lsVTluaTRPazhPcnlp?=
 =?utf-8?B?Q0dKWDJwQ3lSYllQeVBwbGp2ZW83MDB0T2Y3V2hxaVh1bjdSODZ6S1VGZ3Zz?=
 =?utf-8?B?K085V0FQcGJVdzRWUVQ2dDZ6MGY2eXpleEhpM08xcmdVcDRmSmU4VmpqaXlu?=
 =?utf-8?B?dnBYdXMvanlIVFJkcTlEcTh4cjRrRVpScFRxVmkyb3I5QUllVU5jQjY1SDZl?=
 =?utf-8?B?bzRyaURZVVJUYVV6bS9tVC8wOVFiZ2lVdVJpMzErdmtCdHc4Kys4aWZoSW9k?=
 =?utf-8?Q?GOY49uH1LL7PMa3cJ2rZO4h8pyNmHSbkDn5TGrFApY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hQBgicOgCGU7Key60JEx7mWw31zoLuVkhBxvcPUM8Yj1GBDka6/xEhkuX0epm/Tsn15ApkVipGJZvPr5IklUpN8zCQNOWDICDVGe8wLYaFdBVbDreuVXVspc1aAD3hVOcQBixbAzVRbzPCiIPl8ymTBugNt8EpdKRaYvXu8icgO5UATRS/WJo9Z7KgRhb1Qgs3aGhoDAiVyEkRxW8DoX3fbTAJtvYQKRZWK8a3cFBYLzNZc5V8JO8L4DyEFDMfx6aHaZn2vMySLKoBehKSpQVmdkaRJmNVY+llv0icZ/iowjRRGx9LTiVi+krfKSK7WL1fduMF0BlL113vIcnuPusdDqnsm1q/ZWH8CP3oTb2et3YUvf63RvHKyKDDigvF/ExiRdESxN3utRwV9F6hwOGMBKPERviI4x7Ov7zm+OJahJutwCmr/BzhUmgF1GRuJk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 10:05:54.8070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c921effd-259c-48aa-6b47-08de67c2d04f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E60.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8803
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.981];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7F5F310DF98
X-Rspamd-Action: no action

On Mon Feb 9, 2026 at 10:21 AM CET, Jan Beulich wrote:
> On 06.02.2026 17:15, Alejandro Vallejo wrote:
>> Hi,
>>=20
>> This series is a big revamp of vendor-checking to enable it to perform D=
CE.
>> It improves all configurations useful in practice at minimal cost in the=
 full
>> build, and at a massive advantage for the single-vendor case. Many ifdef=
s can
>> go away as a side effect of the series.
>>=20
>> This series depends on cross-vendor removal:
>>   https://lore.kernel.org/xen-devel/20260205170923.38425-1-alejandro.gar=
ciavallejo@amd.com/T/#m4c3d318f37e4f24d0f8c62b104221aa5d428cebc
>>=20
>> Patch 1 in this series matches that of cross-vendor removal. It's logica=
lly
>> required, but that's the single requirement.
>>=20
>> High level description
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>=20
>> When compared to the RFC this makes a different approach The series intr=
oduces
>> cpu_vendor() which maps to a constant in the single vendor case and to
>> (boot_cpu_data.vendor & X86_ENABLED_VENDORS), where X86_ENABLED_VENDORS =
is a
>> mask of the compile-time chosen vendors. This enables the compiler to de=
tect
>> dead-code at the uses and remove all unreachable branches, including in
>> switches.
>>=20
>> When compared to the x86_vendor_is() macro introduced in the RFC, this i=
s
>> simpler. It achieves MOST of what the older macro did without touching t=
he
>> switches, with a few caveats:
>>=20
>>   1. Compiled-out vendors cause a panic, they don't fallback onto the un=
known
>>      vendor case. In retrospect, this is a much saner thing to do.
>
> I'm unconvinced here. Especially our Centaur and Shanghai support is at b=
est
> rudimentary. Treating those worse when configured-out than when configure=
d-in
> feels questionable.

Isn't that the point of configuring out?

Besides the philosophical matter of whether or not a compiled-out vendor
should be allowed to run there's the more practical matter of what to do
with the x86_vendor field of boot_cpu_data. Because at that point our take
that cross-vendor support is forbidden is a lot weaker. If I can run an
AMD-hypervisor on an Intel host, what then? What policies would be allowed?=
 If I
wipe x86_vendor then policies with some unknown vendor would be fine. Shoul=
d the
leaves match too? If I do not wipe the field, should I do black magic to en=
sure
the behaviour is different depending on whether the vendor is compiled in o=
r
not? What if I want to migrate a VM currently running in this hypothetical
hypervisor? The rules becomes seriously complex.

It's just a lot cleaner to take the stance that compiled out vendors can't =
run.
Then everything else is crystal clear and we avoid a universe's worth of co=
rner
cases. I expect upstream Xen to support all cases (I'm skeptical about the
utility of the unknown vendor path, but oh well), but many downstreams migh=
t
benefit from killing off support for vendors they really will never touch.

>
>>   2. equalities and inequalities have been replaced by equivalent (cpu_v=
endor() & ...)
>>      forms. This isn't stylistic preference. This form allows the compil=
er
>>      to merge the compared-against constant with X86_ENABLED_VENDORS, yi=
elding
>>      much better codegen throughout the tree.
>>=20
>> The effect of (2) triples the delta in the full build below.
>>=20
>> Some differences might be attributable to the change from policy vendor =
checks
>> to boot_cpu_data. In the case of the emulator it caused a 400 bytes incr=
ease
>> due to the way it checks using LOTS of macro invocations, so I left that=
 one
>> piece using the policy vendor except for the single vendor case.
>
> For the emulator I'd like to point out this question that I raised in the
> AVX10 series:

There's no optimisation shortage for the emulator. For that patch I just
ensure I didn't make a tricky situation worse. It is much better in the sin=
gle-vendor case.

>
> "Since it'll be reducing code size, we may want to further convert
>  host_and_vcpu_must_have() to just vcpu_must_have() where appropriate
>  (should be [almost?] everywhere)."
>
> Sadly there was no feedback an that (or really on almost all of that work=
) at
> all so far.

It sounds fairly orthogonal to this, unless I'm missing the point.

In principle that would be fine. the vCPU features whose emulation requires
special instructions are most definitely a subset of those of the host anyw=
ay.

I agree many cases could be simplified as you describe.

I do see a worrying danger of XSA should the max policy ever exceed the
capabilities of the host on a feature required for emulating some instructi=
on
for that very feature. Then the guest could abuse the emulator to trigger #=
UD
inside the hypervisor's emulation path.

Cheers,
Alejandro

