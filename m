Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5671ACB05D8
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 16:12:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181834.1504816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSzNt-0006O1-D4; Tue, 09 Dec 2025 15:12:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181834.1504816; Tue, 09 Dec 2025 15:12:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSzNt-0006Ln-AL; Tue, 09 Dec 2025 15:12:13 +0000
Received: by outflank-mailman (input) for mailman id 1181834;
 Tue, 09 Dec 2025 15:12:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=snnK=6P=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vSzNr-0006Lh-EC
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 15:12:11 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e24e300-d511-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 16:12:09 +0100 (CET)
Received: from CH0PR04CA0119.namprd04.prod.outlook.com (2603:10b6:610:75::34)
 by DM4PR12MB7575.namprd12.prod.outlook.com (2603:10b6:8:10d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Tue, 9 Dec
 2025 15:12:05 +0000
Received: from CH2PEPF00000141.namprd02.prod.outlook.com
 (2603:10b6:610:75:cafe::7f) by CH0PR04CA0119.outlook.office365.com
 (2603:10b6:610:75::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Tue,
 9 Dec 2025 15:12:04 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00000141.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Tue, 9 Dec 2025 15:12:04 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 9 Dec
 2025 09:12:04 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 9 Dec
 2025 07:12:03 -0800
Received: from [172.29.90.244] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 9 Dec 2025 07:12:03 -0800
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
X-Inumbo-ID: 6e24e300-d511-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aGy7A2gJj6d2KpQQV+YQBk8UKUKF/thU9UBnIHO1s5lEDbzGQvRlkkck/Aygf+LUFIqBCA4HojoqoefjfzXnolfgcDB4BvX7fqRzFc4+r6jcf3TdtuSQlArovFuInYU6AZMP+vBYeKrcSFjSqnHjTO2/2NH1qFeBYD/XEjASh7x/36N4rUk8Q0cee5q2Hj4oIpSdwyXmPUbeV5ZgYdZXaxFh1Q7TGfNEDmWWpmaCQCg4laYmPcD9cSJdRlt3BOSFs0Vg3trSVX8i/qxb6rcx/ZgEWucY9fKc7SZoNnG0HzCmdc6TbTuLD7L5/OqibjXIIS16X9r5XVuaUjJ/BvQcoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zyRqL42Pv9oBW2yOakW5gRYlNvi81x59wZ/DHAsNt5A=;
 b=cpYz7f+63FpXqJR7snP7t+jfP20n2aihgnYYXN0iF39Z7vF5Vb4MAv7vOxdziwZYYrzY9yLIZBu2Y9PvkStQcE/G311BUohCYVMWtXvxmc5w7GkEULm8DSVQLuSZBMtlArDXkwOSFYfV83i4jgYa/wfVQYVWYqw7SGoPGNFaeqMYlMDN8RDan5VPTAqkBdRJkoRB/Owqg4KSeydMvH/I1J7NTrRF61eGM9ZGP3ff9M5zzfJIfXgi2nVjQiHnlFRHmFJiAzNZifFNA8nGr8hwkYtH+SBqlO4v7Wbvv2nvY4C0owE1mOiYMN7FOGk4jNBwkNiuy5UIg/7I61RF4eUk/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zyRqL42Pv9oBW2yOakW5gRYlNvi81x59wZ/DHAsNt5A=;
 b=pRuyUf464htymVnGLscc+eJQEy4TvrTQwCjYhIGqHmiG8iP8P1vSPa/w1gy0k6AQrVmcubicLiplhRo7/BSiW2QS1phhS+A22NczS9pp04Q1vWs7LV4K6hw9qCYcCYOZXhpZub8PM/vcpx2Vu8ojpBODRr8MVl/oH+QTwtV4F7s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <48c3932e-5042-4586-a22f-5ab758e26df4@amd.com>
Date: Tue, 9 Dec 2025 10:12:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RFC: xen/x86: Enable --gc-sections
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Grygorii Strashko <grygorii_strashko@epam.com>,
	<xen-devel@lists.xenproject.org>
References: <20251205222813.277164-1-jason.andryuk@amd.com>
 <6c10dbc4-3247-4a0d-9953-858d09df08a9@suse.com>
 <1675a966-1095-4aba-af74-828e4c68e6b4@amd.com>
 <f922dad3-9e60-47ff-b4f6-f0ae87fd90af@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <f922dad3-9e60-47ff-b4f6-f0ae87fd90af@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000141:EE_|DM4PR12MB7575:EE_
X-MS-Office365-Filtering-Correlation-Id: babd830f-ac53-43de-566e-08de37355006
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZXMyMktqang4Q1NyVkx6RWdXZ1l1bU1VbnJzdTdpeXR2T2E0Slk5dE0rMjE2?=
 =?utf-8?B?STlXOHhYTlpERUZLQUdrSXBIbTRXTW11MzJCT0pmMVB5aVRocjg1NFVvNHlY?=
 =?utf-8?B?UFEvWkJwZlJYMmltREtYdThaTDhmeHdzS3RZYzY4SW5kOFpva1VFQy91aWlE?=
 =?utf-8?B?czZKbU9WQWp5UVd4UEV2WjRzSUI2Y0N1ZXRPeFlUOU5vcS9iN3F0UExzOGx5?=
 =?utf-8?B?S0ltRS9ROEIwSDhodDQ3Q1MzdFdjcnRpdFVPTU9LU0FKcU42dUtGQ0diMUFB?=
 =?utf-8?B?RHp3dHlHYzdhUTY2QkxhWHBRS2x3Z2w1YisvS0UzUms2OCtjclFENCtkRWNx?=
 =?utf-8?B?Uk9hMk5VRENpSDMzTml0SlNEYm1BTjJSSG1zcWZyaVp1ZzhXV3EweGZjMFdr?=
 =?utf-8?B?TXlLYjZUaGp0NEQrMHFCM3V1enhmaTI2a2lJSXk2OVVxaEpXb0FyNjBtdjc5?=
 =?utf-8?B?cWZDaDVjMzRmd2tVWEEvZllINklzZE52MmtaTjRIa3JOMWFpZ05zUkM5WWYz?=
 =?utf-8?B?RVhtVUd5cUpBeUFIK1Z1em1OcnFxaGgrT0h5SFZlODJmOXV4alJpOXRBU3Rs?=
 =?utf-8?B?eW9sQnZ3ZGVIVnFWT2hmRStPMHMrUmZlbjh0eFhzYTZxanFOV3cvRUlxS1Rr?=
 =?utf-8?B?ZGd5NFAyNnBRWndCSUFDSHpqYWprdEtPc0Npb2RVRmNMR2NMS00yQTV6RHJu?=
 =?utf-8?B?ekIvUnVjemcrSkswTldXOGJXUWlOQ2U5ZHNpVUd4V213SmxmWFk1VkJ5eCt6?=
 =?utf-8?B?SWRMNjIySmpJTGthbVdkZUd1ZTkzKzdGeWIrVUc2VFVsQmx0OHV1eHpCUmVT?=
 =?utf-8?B?NXMwNU9BTUwvblg5ZkYrbU02M1J5V3I0SUliSTZBbFBoWVVTT2h3a1ZvNE9m?=
 =?utf-8?B?ZjBnait4SVFtMzN3cEoxR1ZDb2NVZzNjYkc3VEE0eFFNZVN3c0tqZUR4ODNV?=
 =?utf-8?B?K3JYalp0QjBTUXlock50YTZScFBnU3lFeEY1MTNtMzI5ZEg0UjdJYUR5eGRu?=
 =?utf-8?B?STArWlZTYXd5ZCtqZ0ZLa1YzSGRia3d4cnZRK21JQ2lHUnpZczdXSFcwM2lO?=
 =?utf-8?B?QjFNRXl4QXpudWZkcm5EUk1JWHVFVjJCVGZLbzFyUndQNkI3ZlBEZHRPZVQ2?=
 =?utf-8?B?UEgvVC94eDEyOGQxZWhSSkJhTWdpRG1LOHM3SEV1aHNpYUpFSVhnQkxrOC9P?=
 =?utf-8?B?Y3RHZm91NHIzS3lnQTQ5aTJ5MXN3TWp1dEVSVmFEU3VVcjY3SUR4UWZIVkpj?=
 =?utf-8?B?M29sZWljWW5SU21TVHZXMmJhZSs5UUlCVzh4TVJhdTljN3RYbDVaUldYY3JU?=
 =?utf-8?B?ZHlHK2cwUzB2N2Zid0ZMd3cyVHMrWVV2QVNUbjZnVHRsMHV3Q2srT1o1OTZx?=
 =?utf-8?B?S2RhWlpvQ1hIK0FzenFyOE5jOGswcWM4Rlp6N2pTTzlGR1FtSnNkRXZOcnVr?=
 =?utf-8?B?dEV4SUgvTmJtUnl3YnZsbG9zQ2l6WTV2UGFiZXZYQ01YL0NBazE2TktiS2hN?=
 =?utf-8?B?Sk5MVzZwU0hoVVFGWWp4UFplV29uYkRrODVmVXB1WTRTMjN6TXBMNE1Pb08v?=
 =?utf-8?B?bGI0UlN6WnNaNndMTFJOOGdZOHlNNllNZUczejR0MlFFazBmeVE3ejlHTmN1?=
 =?utf-8?B?ajBnbjFNNWVLV0twcGlYS0N1dzNiS0owZzhXdjltWGFKUWpZa2VSdmt4aHk4?=
 =?utf-8?B?d3FEWVhpR2VDa2FBdGRVbmIzeXpLTjhEMGk0NDNTR1kzS0Npc0ZKWjhURXZU?=
 =?utf-8?B?YjJ4UnFzQ095M3BLTjJHOXQ1bWRHL1FRbVQyK3lsSUFDSEtjdzl4SzlNcEc1?=
 =?utf-8?B?cTMweEZoQWpPZTBNMFVJcTUxc0JFekdvd1c4eEhpVmd3WVRxOHF0cmJEYUJL?=
 =?utf-8?B?Rk9aTlpQcGI3QWRScUxlMHQzcitKZkkxRHRsaGV1QktQbTNWMEd0cGxFRzQ0?=
 =?utf-8?B?eWQ2M01XZDFuOEgwOVd3Y0hBeXJONmVHdm05OTRFWnFwRG1VREI4aGUxUnFl?=
 =?utf-8?B?dkhvNnRiNEl6TDRXQXUzL3dxcmE0S2lFRWtpeWppUW9LenFSQ2ZyWktqdzlZ?=
 =?utf-8?Q?mz871t?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 15:12:04.8035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: babd830f-ac53-43de-566e-08de37355006
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000141.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7575

On 2025-12-09 02:36, Jan Beulich wrote:
> On 09.12.2025 00:00, Jason Andryuk wrote:
>> On 2025-12-08 03:56, Jan Beulich wrote:
>>> On 05.12.2025 23:28, Jason Andryuk wrote:
>>>> When linking to create xen-syms, add --gc-sections to garbage collect
>>>> unused stuff.
>>>
>>> What about xen.efi?
>>
>> I tried briefly and it fails to link.  The GCC manual says it is
>> considered experimental for PE and COFF.
> 
> The gcc manual documents linker behavior? Do you have a more concrete pointer?

My bad - it's binutils.  https://sourceware.org/binutils/docs/ld.html 
down at --gc-sections:
"Note that garbage collection for COFF and PE format targets is 
supported, but the implementation is currently considered to be 
experimental."

>> I just added into EFI_LDFLAGS:
>>     CC      .xen.efi.0s.o
>> ld -mi386pep --no-warn-rwx-segments --subsystem=10
>> --enable-long-section-names --disable-high-entropy-va --dynamicbase
>> --image-base=0xffff82d040000000 --stack=0,0 --heap=0,0
>> --section-alignment=0x200000 --file-alignment=0x20
>> --major-image-version=4 --minor-image-version=22 --major-os-version=2
>> --minor-os-version=0 --major-subsystem-version=2
>> --minor-subsystem-version=0 --gc-sections --print-gc-sections
>> --build-id=sha1 -T arch/x86/efi.lds prelink.o  ./.xen.efi.0s.o -b
>> pe-x86-64 arch/x86/efi/buildid.o -o ./.xen.efi.0xffff82d040000000.0 && :
>> ld: kexec_reloc is too large
>> ld: kexec_reloc is too large
>> ld:
>> prelink.o:/home/jandryuk/xen/xen/arch/x86/boot/head.S:60:(.text.header+0x48):
>> undefined reference to `start'
> 
> I see. This then would want mentioning in the patch description. And I've added
> it to my binutils side todo list.

I trimmed, but the output continues for a long time.

Thanks,
Jason

