Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D1C9BC09F
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2024 23:10:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830123.1245042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t85GL-0000Ro-JR; Mon, 04 Nov 2024 22:09:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830123.1245042; Mon, 04 Nov 2024 22:09:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t85GL-0000PZ-FD; Mon, 04 Nov 2024 22:09:29 +0000
Received: by outflank-mailman (input) for mailman id 830123;
 Mon, 04 Nov 2024 22:09:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Hjm=R7=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1t85GJ-0000PT-Vr
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2024 22:09:28 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2416::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7020a965-9af9-11ef-a0c5-8be0dac302b0;
 Mon, 04 Nov 2024 23:09:20 +0100 (CET)
Received: from BLAPR03CA0023.namprd03.prod.outlook.com (2603:10b6:208:32b::28)
 by DM4PR12MB6134.namprd12.prod.outlook.com (2603:10b6:8:ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.24; Mon, 4 Nov
 2024 22:09:14 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:32b:cafe::33) by BLAPR03CA0023.outlook.office365.com
 (2603:10b6:208:32b::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30 via Frontend
 Transport; Mon, 4 Nov 2024 22:09:14 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Mon, 4 Nov 2024 22:09:14 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 4 Nov
 2024 16:09:12 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 4 Nov
 2024 16:09:12 -0600
Received: from [172.25.174.226] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 4 Nov 2024 16:09:10 -0600
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
X-Inumbo-ID: 7020a965-9af9-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNjo6NjBkIiwiaGVsbyI6Ik5BTTExLUNPMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjcwMjBhOTY1LTlhZjktMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNzU4MTYwLjg5MTI5Miwic2VuZGVyIjoic3Rld2FydC5oaWxkZWJyYW5kQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YsiDcP9oW4pMWesUVfjvU4erIZAL0Isz8tVDAdWDHcUzGOCY6WsWtFR2IcGaFwkCkkk3wU/Ov1YLgT3WUaaktnvPQIFqp2e5sxm5p23Eg8t+d8/GLkG+KZImobsVBF2fVBipADmM1YmiJvdUXx1Y636FzropT1m2IxHf1gL2wG2a5Ors+Z08h1o6JSZrEdbDed9fuJJIiRrLfCynAKsxFWtrTAVUBlNZ4Bh+ckyc1H/ZjIfVYDKl4PfJH8qtV/HK5tHOyTM0Pm1bhQXxD10EnafaFEb+J0dGaJR7lcng0Km46pVV+co6rfXo+vSJrjn55qGQmSXEWi5nh92Psal9dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e+CTe0DuLRxVNwagvnEk52+IwGebyG5Mudi65S8b6hs=;
 b=k/DBrfGkdMwlAi0kyA9fSMhHnLMIcpxW94i5hWVJvvozKkp55/xT2jTtXCRAnCOYbFp+Ga/BVRD6fyT+8L98YFQ/q66e0TP0MfRWqBjbjWtZkPSPAQWUXzmMOt8+tFMyDCuKmri2LlYybIpaMCFgCSUibT4jFVgIzN3wLQuxZeuojUWh80NiT3QJaejUTXErcvNnn3m4XdILBUo9m5geMpZcM5QRmql8s76kAXfZXvgqhFerl+SuaLezHoGzZA1+90U7mFv1VsJD92nZ3SUIA+jzF1bQpzRhsTUb0/b904x3zHBCxnfk+6dA0FhcYVnLl2FugvsC9ARTsp43vIAMtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e+CTe0DuLRxVNwagvnEk52+IwGebyG5Mudi65S8b6hs=;
 b=KXLr3a7Zel41mLZ7uoqYiJUSbrqApaOmN+ErVPrKu34KAsSLg4ta+U9o2QtWH8fZrAbkUVW3I25bDbvnYElTHbQNBCVw0pOIUpWLKkbzLVGg64fZOH7qFua6aemeZMATCJHT5FVLICCM909D6ra9S3QKNMZzrDw+XSkAqT91SSY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <64d8f920-8dbc-4d98-9b1d-535d1413caf8@amd.com>
Date: Mon, 4 Nov 2024 17:09:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [QEMU PATCH v9] xen/passthrough: use gsi to map pirq when dom0 is
 PVH
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Paul Durrant <paul@xen.org>, "Edgar E . Iglesias"
	<edgar.iglesias@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Marcel
 Apfelbaum" <marcel.apfelbaum@gmail.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Huang, Ray" <Ray.Huang@amd.com>
References: <20241024090629.1944820-1-Jiqian.Chen@amd.com>
 <356652df-b5b4-4c28-9c5c-4bfc4f36813f@amd.com>
 <BL1PR12MB584985EF3C4F3D482A3F8E95E7512@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <BL1PR12MB584985EF3C4F3D482A3F8E95E7512@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|DM4PR12MB6134:EE_
X-MS-Office365-Filtering-Correlation-Id: 7881d0e1-0cef-4a2c-e9fb-08dcfd1d5171
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VW03YytzemVMM0QyMTJib2ZCRFNHYmR2SmNld24xVGY3MFNIQUozYWdMQnVL?=
 =?utf-8?B?WHYrVVhON0t0OC8ycXVFRm11Z3Y2cHEyOEZFVjJaeEdtZnVJZDgrRFJxQjVW?=
 =?utf-8?B?NHNPcjJDeFY5VlRYM3RYTmtCUEVOVUIvQlUvUnpVbnQxa1ljaVlGU1YvK01s?=
 =?utf-8?B?N3BIbzdRRXZBY0MyVnpRa0cvZE9BMWZRVHdnWjFpMjQwSnpGLzBkWUNsNVVs?=
 =?utf-8?B?enRWMzhMbVJhbzVoeEtibkZac1M0bnVPbGFDd3RmRG1tRmp4L0RrMWl4Ymtl?=
 =?utf-8?B?ZmVIZ0EvRFVvd1JGcjFPWEN5aTcwRmN5MGlIQ1lXNjJZZGY0OTBJalpRWENZ?=
 =?utf-8?B?UzZpbEtmOHIwN2ZIanl1MmRML1pnYUNmYkZYZEQxeTQ1SmFhTU96TnZTdFB1?=
 =?utf-8?B?eFZmZDZTTHd3Z1FWaEVYWi9icFQ4NEtuMEVrSmxIQ3hDVjJUSmtUTmJ0a2dk?=
 =?utf-8?B?Q3lmS3hSOUp5dWZzcE1YNjJZS0RnemlQVkQ2bUFLZGx3Yk9WUjJmVDZwNStG?=
 =?utf-8?B?akFSRkxzc3lLTkRucVFKTFNyWks0UzBvNEN2dWl2cHZiZ1dYYzVkWm1CZzh1?=
 =?utf-8?B?UWYxMFAwMVNKZkE1YWg3M3d1c2FOOXgwUkxpZU1FMjRoSTBFd0Iwb1JIaG5n?=
 =?utf-8?B?dWJaMW9aWlZEVXh5QzVqRmZLOSs4UUptblpENnhyc2preWg4MHJDdzgxZlFW?=
 =?utf-8?B?NnRFYXU4cE5sVkRRWjNCdGJxVkp6ZllRR2NpbHRWOTR2M2NYT0RkS0dZaGU3?=
 =?utf-8?B?eFhDZG1QWklJL1Ryb0syT2lUUGRpbVpQNHZ6VUNwSVpGV1gxRWE4cVp0WWF2?=
 =?utf-8?B?RTRoOXNzZVVFRE5TRnhzb1lDZWdBbWJjQTRxMmZEVCsrRnJIemRXeXc0c1hi?=
 =?utf-8?B?WlJMQVJMdXlOcU0wUk9vUTF6U2JKSTVybUg4R0lQbGU2cGV5TU8zMmgwdXp5?=
 =?utf-8?B?T3ZwZHhuaVNvUm95UkpSU0x5RnNFNUlGd0pYcE5RaHBtZzRpR3JLbTdVZlhJ?=
 =?utf-8?B?K3EwWjVGRGJ3OE5qaUt1ZmkzM1I3SG0zUDgwWGNyMFRyem1sZ09HZ2dIcXE2?=
 =?utf-8?B?cjNUakhkUmk0ZWVNeUdYSWludTU3TG5Zemh5L05LNjRsNG5RVlRndklsblVC?=
 =?utf-8?B?dmlOL0hyUEl2emJITi92ZFRMTTdvdyt0bFhBZU5qamVQM3JqaTl3L0hyT1Fl?=
 =?utf-8?B?Zm5FZjVvYU5ud1cvNk45b2tUNzJ3TGRYR2grWE9tUGFXSzVOMWVROFVCZjBr?=
 =?utf-8?B?ZjVJdmVOTXZydjBlOTJNVTZLVWR3NE1MWm9mVGo2SUxVNjBnYzgrNGR5UjY1?=
 =?utf-8?B?cmMreC81TWwxSU9DbG5obTBHWHQ5OEkxQUc3cTl4bHFzcXVwVnVsem5nbXdG?=
 =?utf-8?B?RWhvTXBPcm1hMEtnZFQ4OEIraTAyUXFzY2hpOXlOUm9HclRPSXViZjRSbUh2?=
 =?utf-8?B?bGlnaDRaUFNsdXc0cmlJM0FaZHJxUHY1THZ2elZiSnNiZ2pEK1dNSE1oMjJl?=
 =?utf-8?B?ZVYxdHRuSmppUzI0WitBd0RxdlFzdDJYUUU1VG5zb3ZsNW52emswaUI2RUV2?=
 =?utf-8?B?U3NodWI2Nlp4UUlRZnZlZU9BdWU2d1N3cHBNZ09qbWNpeHVRZ0MwUmlOVU5m?=
 =?utf-8?B?a2lHOVorUDdjejZVN0Z4M3llQ1JsL1hpYytrK2d5WDRxSFkxRmtNajF4Vzhs?=
 =?utf-8?B?QWVXS0RFdnFLL3ZFQWc1aUl3M2dCOXVaWlUyNWtzOEF0dWF2QlFPNWhXRk9j?=
 =?utf-8?B?S2JFUHBYNDZKUUwrdmFYVE10emdnSmJibm92ZzB4Y0p3VUJMQnFXSk9jN1lX?=
 =?utf-8?B?S2l3Zmh2SFNtcnY3TWtwaFhDblQrdlNrbEtqTTZlbStleVZCa24vTk93VExD?=
 =?utf-8?B?RUJPd1l0MEEvQXFQcmV0TEMrWU45RklPQUkrQjVvNUxnY2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 22:09:14.1285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7881d0e1-0cef-4a2c-e9fb-08dcfd1d5171
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6134

On 11/4/24 01:03, Chen, Jiqian wrote:
> On 2024/11/1 21:09, Stewart Hildebrand wrote:
>> On 10/24/24 05:06, Jiqian Chen wrote:
>>> diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
>>> index 3635d1b39f79..5b10d501d566 100644
>>> --- a/hw/xen/xen_pt.c
>>> +++ b/hw/xen/xen_pt.c
>>> @@ -766,6 +766,50 @@ static void xen_pt_destroy(PCIDevice *d) {
>>>  }
>>>  /* init */
>>>  
>>> +#if CONFIG_XEN_CTRL_INTERFACE_VERSION >= 42000
>>> +static bool xen_pt_need_gsi(void)
>>> +{
>>> +    FILE *fp;
>>> +    int len;
>>> +    char type[10];
>>
>> A brief in-code comment to explain how you arrived at 10 would be
>> appreciated.
> The max number of characters in the description of the "guest_type" is 4 ("PVH" plus line break).
> I set it to 10 to prevent longer description types in the future.
> Do you have another suggest number?

No, I think 10 is a good choice. I'm just looking for the rationale to
be documented.

