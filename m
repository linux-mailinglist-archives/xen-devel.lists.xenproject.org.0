Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E63A782EB
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 21:51:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934778.1336375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzhdQ-00085A-Gc; Tue, 01 Apr 2025 19:50:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934778.1336375; Tue, 01 Apr 2025 19:50:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzhdQ-00082q-CB; Tue, 01 Apr 2025 19:50:56 +0000
Received: by outflank-mailman (input) for mailman id 934778;
 Tue, 01 Apr 2025 19:50:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dkoz=WT=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1tzhdO-00082i-R8
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 19:50:54 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20602.outbound.protection.outlook.com
 [2a01:111:f403:2415::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d54ec39-0f32-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 21:50:52 +0200 (CEST)
Received: from BL1PR13CA0255.namprd13.prod.outlook.com (2603:10b6:208:2ba::20)
 by CH2PR12MB4135.namprd12.prod.outlook.com (2603:10b6:610:7c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 19:50:47 +0000
Received: from BN2PEPF000044A8.namprd04.prod.outlook.com
 (2603:10b6:208:2ba:cafe::42) by BL1PR13CA0255.outlook.office365.com
 (2603:10b6:208:2ba::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22 via Frontend Transport; Tue,
 1 Apr 2025 19:50:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A8.mail.protection.outlook.com (10.167.243.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Tue, 1 Apr 2025 19:50:46 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Apr
 2025 14:50:46 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Apr
 2025 14:50:46 -0500
Received: from [172.23.214.75] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 1 Apr 2025 14:50:45 -0500
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
X-Inumbo-ID: 9d54ec39-0f32-11f0-9ea7-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A52KvFicwJiha5U+m7c55RZhVdCDvY4WyReusIlVDHt9kvLB0ynIFGwmgkGH7qyPK9Qblv49rf9ldzh7CV2Xxewd30l69eKHddmA7xO9FD6/ZkFM6cnsZw+runUFiFoso0fO3C5DvUz2CbLEyM5GW6YQpLSl81GHykwPnmt7bVUoI20r1g3y6aGrXRsCU45Q5ymOSbnC1h8zQL2HkpOZEC3rXI3tpV4hF0YAL66vMkt0Ghdk5Xh1PwZLn3UO3raJ+1/nY9Gj4ozzHKEcCTk7AX9eo/CsWmtDlHih7UphMNGSwI8WUZf04YB8xgXnc4RDdXU/SUgO4RBweBbtyF9jvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78rzobEEHDiCGVLMc8M5TlNFbWs0btjXkBRBmrKoM3U=;
 b=B4ydmfrCI60LwRIXaXZaz/Q7CyUzBzFuB0EZJ6AHyKtOMQi/oIVTuVPm7hKJj8CkID/b9fwTVAuonqIINO9gUFh7rGtW45iVQk9BDArqlpFjDxoTLFi2Um+EPFP+DOrCYgN9O67Kw/ONETkz4bRgE9N7fZGa5fHrxnjl4l8V/X5OvE04/yLWL1sMXng5y6jtq6Pz+rEbU6ssJYnnGES5K6UXEMkH3Knrp3r32S/2yfB/Rvb0OVLlwm3EbiXZa2TfV4uVf45hRMKmzun7rdOcXmCtFwrELLWkP6BB4xYRLEyfrec50DBvB++PoPV9FwuR1p+lyEAiw6CgJmkeE4iIjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78rzobEEHDiCGVLMc8M5TlNFbWs0btjXkBRBmrKoM3U=;
 b=J3W3hGNquvl22Msn5gxkybqWCurVXd1F5Izr/Y/mUaZ8w4BDhT2+IVc3uaL4YDl+15E2SK3arK4x0LOKqwWKpYE6dyFg5K0LbHTeJP4iIOAaA4S68XrJpgaHfg0BFir+pnjfzpN9PQxdRiWxUmV17kyxIsYRWH/M4dtRYYpcaq0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <1870766f-9dab-49bf-927b-043c14fba381@amd.com>
Date: Tue, 1 Apr 2025 15:50:44 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 2/2] xen/arm: check read handler behavior
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20250325172727.600716-1-stewart.hildebrand@amd.com>
 <20250325172727.600716-3-stewart.hildebrand@amd.com>
 <bfe213a6-9dd8-4ac9-9552-46090517e224@xen.org>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <bfe213a6-9dd8-4ac9-9552-46090517e224@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A8:EE_|CH2PR12MB4135:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f57c787-3fd0-4db7-12e5-08dd71567ee4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QkR6Y2MwV1VqY3p5V0RQRHNuWjVTd0c2M0NGSERiZytkVlJDeWkxdWc1SUJN?=
 =?utf-8?B?L2xkK0RTRGZtaWdRWGNFaldxSHlVVWhzcTYxR0dzTlZZTDRFNkEybnJWa21j?=
 =?utf-8?B?eGREQ1BBcjJtRnBNbGZRZVRiQVhZNlZtU01DcDhTVGFCMVBkdmNCdWEvOTdq?=
 =?utf-8?B?alN2cGd6enFXVmJlSnhnRGgrWXRDcW5iazdVZ0NYendUTHpBZ0ZRc1hwankx?=
 =?utf-8?B?bWtXaVFIK2NMdGtmNzdsV2JmWkIyY0hxSzB0ZTBoZWsxa2ZMeUZqODFzd2hr?=
 =?utf-8?B?Ty9SK29oN1hpMWg5MXN1ZUNaeHBIMXNwK3FSSHN4SE9qOFJzZXo0WC82WjdH?=
 =?utf-8?B?MVNUeXNNcHFQTGNFZVRmNTdCdzJDTm1IN0lkaW5GZmxtdmtpaFdpM20wM0pF?=
 =?utf-8?B?bzhxVWNIQVljajFGRDA3RkRQL0xYZEtSd3VQSkhTQzhBYk1tZWJleVBzNU1p?=
 =?utf-8?B?VHJWWHVrUlA5dlVOcXpUUXFvR2ZwdlFscGY4eVIzSDBzUG8rY1kwVVZXY2I0?=
 =?utf-8?B?aGIrZGxBc2gwdTd0RC83MnYxWGhYS0dWNmp5bzZDY0kyU3UrM0ZId0c4KytJ?=
 =?utf-8?B?M1pXSnNkNlhpVWJIaWVoUUNjWDNMS3Nqc1RXZTB1YmxtaDNMWlJ1V3luVTlx?=
 =?utf-8?B?SE1Cek1iQUV1cXJ3aE5jTXF4d1owRC82dzRSN0x4TVZGQlNtVUdHRTJqY1Fp?=
 =?utf-8?B?MVFsZ1VYSFRUcE5sUFBLR2w3N05XWEdPSWFpTEUyczdpOUhiM1dRcnlVMzFm?=
 =?utf-8?B?SlRaeWpMNU5xa2JlL3MxOHduMDZOZVIzRjVXZy9SaFRNYXg3bEdVaS9Dc0cr?=
 =?utf-8?B?RjZtVjd2VCtOT2pURXhJZ2R3WWpXYUtrdWNiVk9WR2J5bUIrUVpyVDdubjgz?=
 =?utf-8?B?bENGMjdpRmRjUHg5Y0pLU3MrakJQTjdBWmx4N1BBQ1NVejY3V3dFM01aZ3hX?=
 =?utf-8?B?OFRSTHNKUDdLcGlpbHlHY0dzczZkU29DWG85eG54amZDN041WEh2d3RyUzFZ?=
 =?utf-8?B?bzBSVjVDVUcycHNhNXRvSVZiRXU1QmdtbFpqdXJXUG45TTFZRjBjNkJ6K2I0?=
 =?utf-8?B?WmVFaXdjM1RlMkZQdURiV1Zwa1BMNUtNaDhBRDVqMW9hOUs0TWJ1Ly94WW9X?=
 =?utf-8?B?Q2g5YVBaRStJemRBNkhMR1grd3pYemxYU1R5bVQzeGlMVFMyWEExUVV1WEVG?=
 =?utf-8?B?ZjJBZUp6eVduYkpUVnNydVFsaHRmVXFKV2JoZ3A3Y2ExcDF6VzRHLys2Z0dS?=
 =?utf-8?B?azAvWjIzTWtaRUd6ZFdzdk94bHI1bHhrZzlQcGZLU0duNEp5K2pGbEM0amNs?=
 =?utf-8?B?UjZmMWl1VkpJS1JsS0E0aSszUlZYSHVPZUF4K2lTbWZYVkViaFBSN3BIR3lw?=
 =?utf-8?B?ZDhnTkRDeXpMeHRrcmZRd0tSQW5obldXWjV1YUEzMjNCZEd4d0dlZnVzMUxp?=
 =?utf-8?B?b1BjdVl0dGcwMzNsbitOU0FaTW92VVJrVkxjUU5JN3piWEFmV0JQOXNheXVQ?=
 =?utf-8?B?ZmEyNVhhYmtqUGVwam5sOG1GMkZrTXdkNnZabDdmTTUwMjVCOTV2NmFsTEVH?=
 =?utf-8?B?aUI3M2FBK1ZkS2RZSmpjc3J5YTlQN3NXWDQzc25iaDJPcmZraEhCelBKQjQ2?=
 =?utf-8?B?TVlGQm1WTFpYbTBjYVVMVGFyUDZJZFpFRnZZR2kybiswdFJ4amJmMjBiNElE?=
 =?utf-8?B?aEs2aUUrSVBIQnppZis4aFlzQ2wyWllHV3JqaG9oSlRqNmxXcEtIS3NXZFo3?=
 =?utf-8?B?cFliVjVNcENHN0ZDc2h0NlcvdkUrSTU3NnZQckYwSkxqd1JYWXNqbE5xeStx?=
 =?utf-8?B?bE9SSnFFVlZ3UG8xWU55ZkdJZ1plekh1YnlMd2pVdmpRdXFOZVBQdnE4aHdi?=
 =?utf-8?B?bFN2Q2hIVEhrelJPSVBLMWRMaHQ2WHZOZCs4L0xBbFF5UTRZSkpFTlpNUFZx?=
 =?utf-8?B?N2ExRHJ6M3QwUmd4SENRWU4rbFgrd0hxbzJwSmlHZmdaNlRHQ3UrdDBuekpO?=
 =?utf-8?Q?SIhV0X2pU8OxxuD2dObfVhOWUBkUpw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 19:50:46.6012
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f57c787-3fd0-4db7-12e5-08dd71567ee4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4135

On 3/30/25 18:08, Julien Grall wrote:
> Hi Steward,
> 
> On 25/03/2025 17:27, Stewart Hildebrand wrote:
>> We expect mmio read handlers to leave the bits above the access size
>> zeroed. Add an ASSERT to check this aspect of read handler behavior.
>>
>> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> With one question below:
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

Thanks!

>> ---
>> v17->v18:
>> * no change
>>
>> v16->v17:
>> * new patch
>>
>> See https://lore.kernel.org/xen-devel/bc6660ef-59f1-4514-9792-067d987e3fbc@xen.org/
>>
>> Also see 7db7bd0f319f ("arm/vpci: honor access size when returning an error")
>>
>> Also see xen/arch/arm/ioreq.c:handle_ioserv()
>> ---
>>   xen/arch/arm/io.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
>> index 653428e16c1f..68b5dca70026 100644
>> --- a/xen/arch/arm/io.c
>> +++ b/xen/arch/arm/io.c
>> @@ -37,6 +37,8 @@ static enum io_state handle_read(const struct mmio_handler *handler,
>>       if ( !handler->ops->read(v, info, &r, handler->priv) )
>>           return IO_ABORT;
>>   +    ASSERT((r & ~GENMASK_ULL((1U << info->dabt.size) * 8 - 1, 0)) == 0);
> 
> OOI, I was expecing GENMASK to be sufficient because "r" is effectively an "unsigned long". So any reason to use GENMASK_ULL?

Only reason was that I took inspiration from Roger's suggestion at [1].
However, I agree that GENMASK is indeed sufficient. Feel free to fix up
on commit. Lastly, this is OK to commit out of order as there is no
dependency on the first patch.

[1] https://lore.kernel.org/xen-devel/Zk72jPtd9iXhChbc@macbook/

