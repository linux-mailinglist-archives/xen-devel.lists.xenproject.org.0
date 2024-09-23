Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E437C97EA1A
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 12:46:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801894.1211950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssgaR-0000rX-T4; Mon, 23 Sep 2024 10:46:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801894.1211950; Mon, 23 Sep 2024 10:46:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssgaR-0000p7-PX; Mon, 23 Sep 2024 10:46:35 +0000
Received: by outflank-mailman (input) for mailman id 801894;
 Mon, 23 Sep 2024 10:46:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WbMn=QV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ssgaQ-0000ni-E6
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 10:46:34 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20629.outbound.protection.outlook.com
 [2a01:111:f403:2412::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1876fcec-7999-11ef-a0b9-8be0dac302b0;
 Mon, 23 Sep 2024 12:46:33 +0200 (CEST)
Received: from DS7PR03CA0082.namprd03.prod.outlook.com (2603:10b6:5:3bb::27)
 by BL1PR12MB5875.namprd12.prod.outlook.com (2603:10b6:208:397::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 10:46:28 +0000
Received: from DS3PEPF000099DD.namprd04.prod.outlook.com
 (2603:10b6:5:3bb:cafe::6d) by DS7PR03CA0082.outlook.office365.com
 (2603:10b6:5:3bb::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Mon, 23 Sep 2024 10:46:27 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099DD.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Mon, 23 Sep 2024 10:46:27 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Sep
 2024 05:46:26 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 23 Sep 2024 05:46:26 -0500
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
X-Inumbo-ID: 1876fcec-7999-11ef-a0b9-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T84wAyDE50qqW//P2WckfZZBEkesPdXw5I88kLW4SHJgMzTAX07NTSqqwJzkFywwN+37onb2s/qz591/n84t9vwRYbFoaL7l05FdJG3XYJSUiC/Tml2i4GYeNbChlzs2j/M3ga8oR30Vbdq+7wEeAdP2w6x46mUGptcQdkE1ddw1vBEZj0bn2nPkhrdjxvC7iJKCjYO/x6vV/N19DL67Gq/nuUce043BBdwZMUzYiKyzRL6dBirrUUy0EDpqT/h3L+2zhRRozVlzN4lFUwG94zYQre6tKIesbtwA3PnsNv8bvsITsTp67Fn20P4ytuszWoNesRs/iy+vF+od0HMVlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Kd44UCtEgezqrfF3C7O/Fj9QkNgjdTU3MD7b7VcG3E=;
 b=UdAEgGvdRibJmbCoHStJVvgkJA/spvhFl7s7tZUtm3eDf40HB1AqJMm7+4MJISHKFThIstFnXNueQEXbptwFdGAF5Diu0I+f9SIWbU5WSkCWf5QlfBqLAjt/TlaPXxUZCkxDBTGqbD+PkN3rrfmfnAR48h0vTDIUqJEi6k88CeNywv7MKpCMgR9broI/khAGDNxZBuOaEaeeVy64faKYGFTY958F3AZZcbSHrgRXaun/XT4nkgj3T82yVRHbTDio4LMQuud5EX7Mjn1p5eeykHQc7PCp1E/yuj1dnTgs9LLeS/spt1ZTdz/w2VqyrKbtjxXEywfhITV3p3zJv7mTQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Kd44UCtEgezqrfF3C7O/Fj9QkNgjdTU3MD7b7VcG3E=;
 b=iJ+9dUZNm1o+WZlbV0TOy8tU0v3rPecvzy9LIhHiJEDjvx05B/Dlt4Yck+MdxOcIbITks/WGxR1QCX8qIfH8V8ag1e1V2vEbCHioOeHXWwM83EEl9TfSXTw1ZF1c/R66jfH+sekw6wCNEFW/29TJHbR9IxQ0nRj4NZ8E1LRZLUk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <98d3818a-969b-4e1f-8a56-1de8a3d314a5@amd.com>
Date: Mon, 23 Sep 2024 12:46:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] dt-overlay: Support target-path being root node
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>
References: <20240919104238.232704-1-michal.orzel@amd.com>
 <20240919104238.232704-5-michal.orzel@amd.com>
 <alpine.DEB.2.22.394.2409191503580.1417852@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2409191503580.1417852@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|BL1PR12MB5875:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c5d4c91-ec27-42d4-363c-08dcdbbcfa26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TithMzI2SktvWWwzSUJDVk9oUmxQTm5ZQzJ6SzRhWGYwcnJTMlFjY2JVdmk5?=
 =?utf-8?B?NzAxUFFSb0IrY3JRQk1CNXQ5ZGJhZmlsamhmUDcrTGE5YkpnMzFJM1NLS01M?=
 =?utf-8?B?VjhnT0JHd1BPTXJ6bDlYN09kVjZjazdYNGxJSlNJbVJTQkZQdmZyeXdEL3FV?=
 =?utf-8?B?K0llZ3pZa1d2bDA0TVV1d3Q1TWR4dWNXY09Ldkx0MVpMSlU3bVVnVC9RbDBC?=
 =?utf-8?B?TUd0WWYycG5jbFl0ejd1OE81ZDFZRlBqNW5lMWh3eU04Yy9wcWd3dHJCazIw?=
 =?utf-8?B?cG5BeHRJYXJHSkxXVDVLRi9aMEcrY21xZzNLV1FPVVlUUUVRclpYVkdnL0Nu?=
 =?utf-8?B?SW5ld1p5SlNnaVF1TlBwaEp1NVFVRllNYzBhbTJsTGtDdVdkQXdxbjh5d1Yx?=
 =?utf-8?B?bkNEODN3THFRcm41a25UalYzNTgxemp0MXhPSWpzM2NCTmhpVzYzbGtVSXlG?=
 =?utf-8?B?K0Z1ZDlET3N2dkN5K20vSDRGeHFWS0wyalc0Y1RhaGtsZ0ljVzBYeHNOaEJS?=
 =?utf-8?B?WFNrZG9laUk3WVVJc2tOQVJNd1VTZVF6c1dvSkUzWFMxRzRMelgrNUF3cG1Z?=
 =?utf-8?B?T0FReEp3Sm1TZmxaTFFTMkFMdnQ3RkhEeElkRENucWJUd05KWWhVNUJRL2ZW?=
 =?utf-8?B?VndhNXdxcklLN2VpSTkrRHhkdWRkQmtIVXFWeHpkMGdRUWRQcCtFTjkyK0ht?=
 =?utf-8?B?UmhNU01zN0NzN2cyNFNhY0kzdVN1UVUxMU9BMWhCWWJUL3hVRXpuclRLTlFh?=
 =?utf-8?B?YWRzR0pNbFpraWJKUHNOQlY2dGVvQW54WFUyQzY2OTd1VnFzSDhGOG01aGpk?=
 =?utf-8?B?ZWZzQTRnYitzbTRxbEpUZThzaWxKQTFhUlRDNVZCd3hBK0FUOVRIcFNVQ0Z2?=
 =?utf-8?B?bkdiNEd3TGFwblZpRTFxajFqckNYRWlUZ3Jydmo1b085UnlBVEhtSFdTZkRz?=
 =?utf-8?B?M1dYNWl3RUluNlUrZzA3ZmRTWHVGVm1MaTM4RFh2dlNUQVhMdUFPQjVPRXps?=
 =?utf-8?B?STZaZkJEZVlXNFVoWkp6a2NkeVQvZjFRdXhFd2RSWlN3YXF5bnJtTXo2LzNB?=
 =?utf-8?B?cTV6MFNWZWlzd1NzaHMvL2p4TThxTDJPUnVhUmxBZ2V0MTVOMDE0Tk5oTG9n?=
 =?utf-8?B?QzZvNGJyWlZyV2MvY0orYXVjanl4MWQ1L0xoeXIrRmszTWFUQUpWMDY2M3Y3?=
 =?utf-8?B?a05hRzRydFRERkZoWjExNGNpb1hydFVsZ05mZng1UW1ySmxzOVcvbjJoaDM0?=
 =?utf-8?B?Ykg5R1NmZkFMMmlvdElSdHFQZkxKNzdMT2kxSEo1K096ZWV3ejhtM2dtNllo?=
 =?utf-8?B?RldBYy9JYXcxU3dyQ2tnVUpFQWZOWnFzNlBzZ3ZwcDU3KzlRNEVCQk92RlVI?=
 =?utf-8?B?Y0daMUVmR2xIbTJ5andWUlc1NGxxOHFWY0N5S2VoK2lLOGNsTWJ4Y2hwMzht?=
 =?utf-8?B?ckp0SllVSHdGNXlwT1MxM01MK1N2TnhETTRUUU95MlF5QlhMOFZ5QnV2TXpo?=
 =?utf-8?B?cFE0YUJ4ck5FaHIxNXYyWmxZZzNta1J6VE5EZG5KSFZYaXk0eGk5ZlZ6OStq?=
 =?utf-8?B?WEtha0Q3MzZON1pxWWpGZUxFZkpXTXNnWVRTRmtmVmc1aUFOOTZISkRLQkM0?=
 =?utf-8?B?MmVjQVkrWVVnd0RNQ0h6N29jSmJrK2t1L29PWWliU2haWERKU1dpRmtiZFhB?=
 =?utf-8?B?c0xIbTRLNHR6aTExYWZEdW1vbTMydDRsSkU2Yk1xWXYyL1FPRm1vUUFmTVY0?=
 =?utf-8?B?R0NIV0hDbWxXVjZJY200ZE9aODY1Tnc4cEVaSkVNN1RnVEdmWFg3bWdRSnhD?=
 =?utf-8?B?NGF3OXpKL0c5NzFuVDk5ZU9tVWk5WjlOQ1JmMlRJSXdDL3k0UURFWnlyNTE1?=
 =?utf-8?B?NFB2VnNVYzFsSFJRZnorZEtYSmR4UnRsNENKSXVBdjAwWWdKRVpNbzFzMW1Y?=
 =?utf-8?Q?jXXmr8vQOBm96cwcqTQ1sguqZdpm21Bh?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 10:46:27.5816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c5d4c91-ec27-42d4-363c-08dcdbbcfa26
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5875



On 20/09/2024 05:54, Stefano Stabellini wrote:
> 
> 
> On Thu, 19 Sep 2024, Michal Orzel wrote:
>> Even though in most cases device nodes are not present directly under
>> the root node, it's a perfectly valid configuration (e.g. Qemu virt
>> machine dtb). At the moment, we don't handle this scenario which leads
>> to unconditional addition of extra leading '/' in the node full path.
>> This makes the attempt to add such device overlay to fail.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>>  xen/common/dt-overlay.c | 16 +++++++++++-----
>>  1 file changed, 11 insertions(+), 5 deletions(-)
>>
>> diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
>> index d18bd12bd38d..63b28889de90 100644
>> --- a/xen/common/dt-overlay.c
>> +++ b/xen/common/dt-overlay.c
>> @@ -325,6 +325,7 @@ static int overlay_get_nodes_info(const void *fdto, char **nodes_full_path)
>>              int node_name_len;
>>              unsigned int target_path_len = strlen(target_path);
>>              unsigned int node_full_name_len;
>> +            unsigned int extra_len;
>>
>>              node_name = fdt_get_name(fdto, subnode, &node_name_len);
>>
>> @@ -332,10 +333,13 @@ static int overlay_get_nodes_info(const void *fdto, char **nodes_full_path)
>>                  return node_name_len;
>>
>>              /*
>> -             * Magic number 2 is for adding '/' and '\0'. This is done to keep
>> -             * the node_full_path in the correct full node name format.
>> +             * Extra length is for adding '/' and '\0' unless the target path is
>> +             * root in which case we don't add the '/' at the beginning. This is
>> +             * done to keep the node_full_path in the correct full node name
>> +             * format.
>>               */
>> -            node_full_name_len = target_path_len + node_name_len + 2;
>> +            extra_len = (target_path_len > 1) + 1;
> 
> I'd prefer to avoid the implicit bool to int conversion. I think it is
> mandated by MISRA R10.1, we have a bool exception but I don't think it
> would cover this type of usage. For instance:
> 
> extra_len = ((target_path_len > 1) ? 1 : 0)  + 1;
> 
> or
> 
> extra_len = (target_path_len > 1) ? 2 : 1;
Ok, will do this version.

~Michal

