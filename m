Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6DDB3D3F0
	for <lists+xen-devel@lfdr.de>; Sun, 31 Aug 2025 16:51:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1103807.1455181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1usjOL-0002EM-F2; Sun, 31 Aug 2025 14:50:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1103807.1455181; Sun, 31 Aug 2025 14:50:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1usjOL-0002Bq-CF; Sun, 31 Aug 2025 14:50:49 +0000
Received: by outflank-mailman (input) for mailman id 1103807;
 Sun, 31 Aug 2025 14:50:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I8wL=3L=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1usjOK-0002Bk-36
 for xen-devel@lists.xenproject.org; Sun, 31 Aug 2025 14:50:48 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:200a::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df25211a-8679-11f0-8dd7-1b34d833f44b;
 Sun, 31 Aug 2025 16:50:45 +0200 (CEST)
Received: from BY5PR04CA0004.namprd04.prod.outlook.com (2603:10b6:a03:1d0::14)
 by DM6PR12MB4435.namprd12.prod.outlook.com (2603:10b6:5:2a6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.24; Sun, 31 Aug
 2025 14:50:39 +0000
Received: from CY4PEPF0000EDD3.namprd03.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::5a) by BY5PR04CA0004.outlook.office365.com
 (2603:10b6:a03:1d0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.26 via Frontend Transport; Sun,
 31 Aug 2025 14:50:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD3.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Sun, 31 Aug 2025 14:50:38 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 31 Aug
 2025 09:50:38 -0500
Received: from [172.17.238.12] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 31 Aug 2025 09:50:37 -0500
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
X-Inumbo-ID: df25211a-8679-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F7gI3qNemXGRB2bqJxjsrqeH5HYTiEWUuld/KpL+BKpMUyHIFmTgUmAR2PWcLhYi9B3tXXFN1f53wTIvdJI38WluaVHnpX126F2G1J6wtPpLnRIXXLArebdDD6tt7PmqDvo/XuuCPC2n37HUWXEVfXeKk9FCzffPOzk0XgDtgtd7aGvCVigXMuV/pVT06T76xofTmFz02aKgqtTAKtS9FiiPB4/T/rFJFBwh5816PH9WZoVLtVAUdRNtvWijCWDXsSk7EzKqygzCV4gB4yZOapnfTp7NDiqtQxXquRyNB3bc3ySKGdnxy8ZPdPSvL2NVvWNjM2TJoID7BAr3i9mCtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQrwRSFuZyVTm74HHYgPMFaRrJ+/Y+/gkfu9DmhIhzY=;
 b=Td8ggeMAaCXbXTaydEeDFAxFkx6dRUIOgxxCVnpdCe9ZOlWQw5SnAwFnSgjEr0505IckN5HF0kH0esiaP3DKM4qPQFx+uNDux4Glk/A9oa6+AGxm4LlBAKXy8XBMzqiyVu5wYWFcVA/gtpNJWmwTFMHeDJrK6kA5ha2E5AyAZWMTznugKv3Vuj0G06g/Tvvf29016CSzlLS0+7Ee+MX5Fng2LmOhPgS3jfFTeOuks/MonUdV48G80BFOOTKg2KIsMuqQ1D9UrIv1rXQQRxNnK0w29Tp5kigfsM+Xvt+KZGXLXBBgBbxvmMoK4+Aj6IOD/ozcwtc1nx87j3TQSvhVoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQrwRSFuZyVTm74HHYgPMFaRrJ+/Y+/gkfu9DmhIhzY=;
 b=g3aO7mKQnX8z5K0WAygEdm6n4apZyGnMnjNWIvha24Ezf8WD5PN9RZCvnj+X6kd7WN3tePtmOBVLxHcwKH5j6Imn3rc4HBBfmvBEsMHhUV9AZKNx7UQzXi0m9ADsXQlWMvQJIb5WQVm0jlSQIgkioLzvo9IHMkccxVhiL3xlkJY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <b6939634-1338-4979-a351-cdd8eba5614b@amd.com>
Date: Sun, 31 Aug 2025 10:50:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] symbols: arrange to know where functions end
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ceef1876-8759-465c-9a74-309b6b92f773@suse.com>
 <10e116c5-5a62-4abc-a52a-e2ca12118cfe@suse.com>
 <24fd00b5-3053-43ae-8342-887eee94869a@amd.com>
 <d934d8a8-93c0-4cb6-baa4-f2aedb719f25@suse.com>
 <e9eaf331-4a32-4c80-8b0a-5f36d8fd9022@suse.com>
 <773a5f4e-2f73-4b84-bc56-90aee660acd2@amd.com>
 <289851bd-95c5-485c-8b3c-d31452ad204f@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <289851bd-95c5-485c-8b3c-d31452ad204f@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|DM6PR12MB4435:EE_
X-MS-Office365-Filtering-Correlation-Id: c7187746-fde6-4da4-fe77-08dde89dc039
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|30052699003|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dlZkaEdHcjgrRnJxbTJmRWdKTWw4VFlGa3dHUTI1VWtYMzJkSStiL1dqdTJa?=
 =?utf-8?B?bGVNKzlYTTJWWlZNdWJqcVpZWUVNSlNUVkJqbEtFdFRWbzFDY1NjMTdwdll6?=
 =?utf-8?B?clVHOXhDQmF4VjJRSjM3M0pIcTFuOXBPb1NHTm9UMFdLUzVEelVSWWsvTDY1?=
 =?utf-8?B?NDBWU3lvREI5VVcrL2dzb3NkaDF2RFhmZWEwTys5TW9HVVBCNTM3eWhWQm5u?=
 =?utf-8?B?blZUSXhuNDhDblZ3aEltTXRjWUJmSVpBSjg5K3ptMXBTZENTUUV1TGZoYW1G?=
 =?utf-8?B?MjlBSmhna1BLSnpaelNCeVdXdTEzVlVBNXd5Z0FtREc0NitoWWFyVnlGMkdK?=
 =?utf-8?B?ZGlpVG50Qm16Y2h2SFVGWjJldUhJTzZyWnRDT1BBNjdCUFVJcS9tR2tuYkdu?=
 =?utf-8?B?K3V0WFJ6Nnd6aE9TUGtxY3dsWXkwMmU4ajJMbjhuRFhIOEZrbThMV3V5Wlky?=
 =?utf-8?B?UHdyclhtZ3VSZ3dFT3phcDkzbkR1N3M3UitjcGVVMDd0RWE1WUp4dk5PV09a?=
 =?utf-8?B?SmQwU0hVYVBueitKaXpqQzQvcm9HM2JmKzYyUEMweVRSYzJacm9YdTlDbE45?=
 =?utf-8?B?cVJSSVI0RWNFbTZqbjBEWWF2cVRpNG5Ga0d6Q1VFK1lLd1BqVGVWNWZvbS9s?=
 =?utf-8?B?d0pHeWN2Y3BuaXc5aVVqU25mTnFVcEVjYVNkc0tOZFd0QW9UK0tYQythd0lD?=
 =?utf-8?B?RUNYay9VQ3hzdG53RU5saGgrbzF1c1ViNjY4UU4xalI5cU5keWRxbGhGbjg2?=
 =?utf-8?B?WE5sR0RVWUFyT0I2MHlNbThuOWRUSnJEY1JiZ0tkbG9oYUgyN0xwOXhGWS9Q?=
 =?utf-8?B?ZnlCbnNsY0JBT1B1M3phd2tOUE9WS3NoS2RkVWNhNmgrS21hL0wvWHJ2b0J3?=
 =?utf-8?B?SVdYcDVEOVhJMkUxeUdyRmV0TlRodjFIb3NqUFdocFljQXpGaGR0amozSjEy?=
 =?utf-8?B?M0F1cGxzYit1N2laSzczQVg4RFREcnpoOFlLRzJ5K2d3b0ptNzNqSUxlc3VK?=
 =?utf-8?B?YUNmM2FkM3d1enQydFQ3TzU4V1ZCYkZKMjh0eStaK3FmQWVxWEZQQ1pnVmhu?=
 =?utf-8?B?RW50aXcwbWFhUzdzalJNZWVIWDFZSmFadGxTTnR5Qk52KzNiV1dhQWhVazNE?=
 =?utf-8?B?b3RLa3RxSDdzSVlhMlRPVWxXQ1NTTzA1Uk1ZMEJHV0lXblRvOEhnRmlkWjQw?=
 =?utf-8?B?alBIcHpMVEw3dCtOWjBvSTlQemdXYzhvSGRzWGo2ZzUrVEhaakc0WVp0RTJG?=
 =?utf-8?B?MWZFcm9nQWcvdFJuTmRwWS9FMm9ZL2hMUWhnMGp0dGI5UEdzWnpEZ3VGM0gx?=
 =?utf-8?B?b3B2R1JtZWFQMDBSRzVzaXRNbVdkTkxDYUdDaFlwSmZubExMVUpoYXNlLzFQ?=
 =?utf-8?B?QUVlTTVna2E0MUw1ZlBsVU05T2VVeWsxTUliYi9mU2dQNkZlNXZNTDNOV1pP?=
 =?utf-8?B?VlI2bDFsVGhRbFRqN0JaN25JOEJTNlhnUDYzOHo3NkxNM1ZPTXRUQUxWZ3Ja?=
 =?utf-8?B?a3ZMa0VLV3dUMlNMVThIeXQ0NDFmUGtKS0FoWUFtSUM2WlVoTEFXeTdYS3FB?=
 =?utf-8?B?QlNCYkVkVzVFaUZtM2xHMmZ6dFpzblptdGF2Um8yWlZ0c1FHeGRaLzljQzZD?=
 =?utf-8?B?STJzVmNBdEZmNURabkRYOEVQcHJvc1c2Zm96dEdzL1FJSUJhSisvZmZ4K0pP?=
 =?utf-8?B?TU5xMXIrbHRHUEYvN1NkclVUMnpyYVBaNEZGWktDd0RBeUFpdFJycGZ3ZCt5?=
 =?utf-8?B?YzlpOVVTTXpjYjM5eTFkVUVKemtTQWdJaGFoS2FLUWpvK1VkWFpqcDd6MG1M?=
 =?utf-8?B?OTN1SUNpYTdxMEx5bE9VeXlDZWFSUDFnMVJmb3N5MndrazYxT0FkVnI5bFFU?=
 =?utf-8?B?ZUFReEp4OTU0UUNiNVhKYjFTckJ3YmZQN3pIQytKYU9ZVkZLOUZ2OFkwYSt5?=
 =?utf-8?B?RFBIMmRtVllZOFRXMUIzMzNiQ1BCdkJaMTVvZ2ZOZUtHdk5TaHpJRUk1NHkv?=
 =?utf-8?B?YW1uUFZKUEQwUTZDdHY3V29LVFJxZkwweE9kR0lUV1ZkZ2dQSFpoRzRSRzhn?=
 =?utf-8?Q?d8dgpU?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(30052699003)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2025 14:50:38.8134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7187746-fde6-4da4-fe77-08dde89dc039
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4435

On 2025-08-29 02:59, Jan Beulich wrote:
> On 28.08.2025 19:16, Jason Andryuk wrote:
>> On 2025-08-28 12:11, Jan Beulich wrote:
>>> On 28.08.2025 09:28, Jan Beulich wrote:
>>>> On 28.08.2025 03:03, Jason Andryuk wrote:
>>>>> On 2025-04-02 09:58, Jan Beulich wrote:
>>>>>> --- a/xen/tools/symbols.c
>>>>>> +++ b/xen/tools/symbols.c
>>>>>
>>>>>> @@ -318,24 +334,42 @@ static void write_src(void)
>>>>>>     	printf("#else\n");
>>>>>>     	output_label("symbols_offsets");
>>>>>>     	printf("#endif\n");
>>>>>> -	for (i = 0; i < table_cnt; i++) {
>>>>>> +	for (i = 0, ends = 0; i < table_cnt; i++) {
>>>>>>     		printf("\tPTR\t%#llx - SYMBOLS_ORIGIN\n", table[i].addr);
>>>>>> +
>>>>>> +		table[i].addr_idx = i + ends;
>>>>>> +
>>>>>> +		if (!want_symbol_end(i)) {
>>>>>> +			/* If there's another symbol at the same address,
>>>>>> +			 * propagate this symbol's size if the next one has
>>>>>> +			 * no size, or if the next one's size is larger. */
>>>>>
>>>>> Why do we want to shrink the next symbol's size?
>>>>
>>>> First (see related post-commit-message remarks): In principle section symbols
>>>> could come with a size, too. That would break everything as long as we don't
>>>> strip those.
>>>>
>>>> The main reason though is that imo smallest granularity is what we want here,
>>>> together with predictability. One symbol with a huge size could cover
>>>> multiple other symbols with smaller sizes. We could omit that part of the
>>>> change here, but then the processing in the hypervisor would need to change,
>>>> to fish out the "best suitable" symbol when dealing with multiple ones at the
>>>> same address. Other changes may then also be needed to the tool, to have such
>>>> symbols come in a well-defined order (to keep the then-new code in the
>>>> hypervisor as simple as possible). Look for "aliased symbol" in
>>>> common/symbols.c to see how simplistic respective code is right now.
>>>
>>> Furthermore remember that we can't record sizes, but instead we insert fake
>>> symbols. Obviously there can be only one (at least in the present scheme).
>>> If we used too large a size, chances would increase that the end symbol (in
>>> the sorted table) would have to live past some other symbol, thus becoming
>>> that one's "end".
>>
>> The scenario I thought about is something like:
>>
>> a 0x100-0x10f
>> b 0x100-0x1ff
>> c 0x200-0x2ff
>>
>> If you shrink b, you are creating a hole that would otherwise be
>> assigned to b.
>>
>> But I agree avoiding huge sizes covering multiple small variables would
>> better be avoided.
>>
>> Do you have concrete examples to help illustrate the problem?
> 
> a 0x100-0x1ff
> b 0x100-0x10f
> c 0x110-0x11f
> 
> If we inserted an "end" label based on a's size, that would effectively be
> c's 2nd end symbol (and there may not be two "end" symbols in a row, unless
> we want to further complicate the symbol lookup logic).

Ok.

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

