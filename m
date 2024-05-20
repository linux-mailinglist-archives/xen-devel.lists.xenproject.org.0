Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D5A8CA3A8
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 23:07:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726361.1130633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9ACh-0007aC-V8; Mon, 20 May 2024 21:05:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726361.1130633; Mon, 20 May 2024 21:05:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9ACh-0007YV-SR; Mon, 20 May 2024 21:05:55 +0000
Received: by outflank-mailman (input) for mailman id 726361;
 Mon, 20 May 2024 21:05:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l4Ei=MX=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1s9ACg-0007YP-Th
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 21:05:54 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2405::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcf79b9c-16ec-11ef-b4bb-af5377834399;
 Mon, 20 May 2024 23:05:52 +0200 (CEST)
Received: from SJ0PR13CA0138.namprd13.prod.outlook.com (2603:10b6:a03:2c6::23)
 by LV3PR12MB9258.namprd12.prod.outlook.com (2603:10b6:408:1bb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 21:05:47 +0000
Received: from CO1PEPF000066E9.namprd05.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::27) by SJ0PR13CA0138.outlook.office365.com
 (2603:10b6:a03:2c6::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.16 via Frontend
 Transport; Mon, 20 May 2024 21:05:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066E9.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Mon, 20 May 2024 21:05:46 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 16:05:45 -0500
Received: from [172.21.89.32] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 20 May 2024 16:05:45 -0500
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
X-Inumbo-ID: bcf79b9c-16ec-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ERN8D9mU+kVbO/1d2c+Vz7TEWRAnhj/etc7AmtIkbTyV/b88ojE8QW6jvbQQciRqh/RTz+WGKQuHw47DO6W17aVgfes3zhUin1ZuwKBUN8bZDeSUTBGX0UMHLGw2i2k84ilZv60UvSIIcrq621tEE9KLANxRnkyprbGCG3Vm9rscXovY40wSj/LdCf6cbhwzviU4iGUX+yOClq03g5uVRIovKI3jcs3XeXP6eQv2TTnv+ucdwvYku8qOerbgICd5suOSWLnENWMe0dy0QMO6FJxaE9IeEiU6UaP+cE/Tk/3/ivVyo44JJVfNFwkW94yZdMKwn2Ss7QYOtLM9TaVZIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1Dh8SCd+uOTZ2/DoKJPBehNZMUCC4Bg5NtdqbgxHj4=;
 b=i4YHsLAhs+FIx85IE6n1IaGjyDMLuYVzpiPtOh8v+t2v2YzYtFbVXxJunGdUFeQ8zuZ0NjW//tLoiETwkVva/xWKI1Ioppg3FNESYRUml88uqhq73nf8fvatOfTZS2AvzkpixrR/oSBHeayDmdac7InEhsLgguYZeLuDSUNpHgnw8/tq3Dz2FlRukOazT8SLRhjeS2WkpwpfyA8WnHUahS9O1XuRAAGWjvo6Qtvj5SsszxjF+7562MiYvMbAix41I45WTOwTeVaI0CmOgNhFWQJ2pqEb9bdQ40VzYZK/HFlsvJrVH0rZBItGUcipyTC40OIsM1lYrKnv+QqgBAZThA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=rabbit.lu smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a1Dh8SCd+uOTZ2/DoKJPBehNZMUCC4Bg5NtdqbgxHj4=;
 b=kxWVcElWhlizgrEem+JbHT1Wo270N3RJmeEn6Gxe0fyR0UE2ZIp4P+b7S2F+9rNIEBXGLbDeISmo60aTZMc4+kGTjVcizPtU2EPDpN66NIpLY6bThGa7RJplNAUhpwFZZK1oAKcX83spgGOsZkTrxwLrsyWpJ6z0I+Ngs50GMf4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <c23b7593-0ead-4ff7-8032-052269fe82e5@amd.com>
Date: Mon, 20 May 2024 17:05:44 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xl: add suspend-to-ram and resume subcommands
From: Jason Andryuk <jason.andryuk@amd.com>
To: =?UTF-8?Q?zithro_/_Cyril_R=C3=A9bert?= <slack@rabbit.lu>,
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
References: <4e9f3590be9f19edb87e05c7b7c2efeae8863109.1709190010.git.slack@rabbit.lu>
 <d3c9ea82-ff33-4211-9e76-f2e599f21a8b@amd.com>
Content-Language: en-US
In-Reply-To: <d3c9ea82-ff33-4211-9e76-f2e599f21a8b@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E9:EE_|LV3PR12MB9258:EE_
X-MS-Office365-Filtering-Correlation-Id: 16d09114-d41d-49ca-186b-08dc79109ed5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|1800799015|376005|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWFneXZYLy9oUGduMlJaUUoxN0ZqZnZJUmFuRTFHWnNVYXhjWTZxNXdsOHpw?=
 =?utf-8?B?OWVMSHJxUnlTcW9TdmxxRWVHc0VsZkozM01YWm1IVjZmdEJhWjlodERzNWo0?=
 =?utf-8?B?WnBJbFgvNnZQUWRXK2pkeVo1NXY4dEJGbDhqblpTb3B1eVErWW0wZnZTWjhk?=
 =?utf-8?B?U1RaVkZ5Uldhdmhoc0tWMzltMkozdUJBRlEwbXJpTmgrRWNKbGoySWZrRjlv?=
 =?utf-8?B?Skg0dUZOa0ZUbVJUYkQzcitySUo1SHpMU0dwdENrV3pzT3NpaUswNkZ2VmVZ?=
 =?utf-8?B?T1lRM2UrR1YwQlBBZmw1b2c5TFo0ZjFsN3pzRzhrNkhpVi9KbEdZYm9xOEVP?=
 =?utf-8?B?S2dIWGpkam9CUXhvdkJNZ1UxSHVyUTZ6M0hrZ2twL3VuZEtsMUxNMFVqQStV?=
 =?utf-8?B?bWV5MWlZSXZFYjl3UXZaWEQrSDQ0SU1qblAzSzhlU28zYmVVVW96YkFzRHky?=
 =?utf-8?B?U2I3bEdsaW5xVlVoS3dTWkF1MEZGNWRZOHBCU1h4Wmg4QWhiSHRTL3ZJUWFD?=
 =?utf-8?B?dzIxWmN1N2R6WG9HMkVhamJ2YnZUbHJoYVNJZHRrQ3hKQXFJVExWNUJkL0FU?=
 =?utf-8?B?TjRSRTI5NG9WbXNtZnQxcEsxRHY4MTY3TktRZDVmQ2U5bWlYTXZYOXJieVZt?=
 =?utf-8?B?aW5mMlZsTEdORjl0aWdsMElqV25uL3lDTU13YVhoNkgwbXAzVjUrZGpqdEor?=
 =?utf-8?B?ZmY0WkNyQ285cFhTazh3cnJiU1VxVFNMWjVSZ2RQTzIvQUlXQVR1Zk9XU2NX?=
 =?utf-8?B?MzAzb3JpUEdnKzlFb211MzB0aTR5dTk0YXEwOFMxZUt6Yys4M3kyenpwbWtU?=
 =?utf-8?B?b2Yvams0YkJrTUwwQzZjaTVnZ3l5ZkdVMDBBV1RyT2tWRStsaHAxVnY2L1By?=
 =?utf-8?B?RGdTdzRnNy9XZzBjL2tDSGE3aEl1R005YkFocmZGaFlIQWhSNWFJKzlGeFUz?=
 =?utf-8?B?aW95MGZJeHhsZDhsOC9hbDI5OEFETFNXOU8vVlVLdlY2R0NKUTA0UGd4SWd5?=
 =?utf-8?B?K0pkRFZrWllyWXRYbTlscVpJREVFTUd4RDlGUHl4YXZvSTBaQ04xNGd5TmpI?=
 =?utf-8?B?TEYwSzZMVFNIQWd4OUg3d3BkaW1WUUNhVm12SkRJTzlKaXZHNUJ0ZU5DZmlr?=
 =?utf-8?B?LzNKM3lKMG9uOGR0cmRHanU3RDQ0TG1mR2ZINldFOEM3TVdiSUNZdWNCODE5?=
 =?utf-8?B?Nm1hV1NtcWtoU0Fqc2xKUUhhM2doUlJ4K0xlV1Z5NVVreHhDN0I4Q0dGeHp3?=
 =?utf-8?B?aitzaXlGazMwRUVVVzRRRVdtOXBDdlJFR0JuUTRwdmNSeVBBZURIaGF1UTNW?=
 =?utf-8?B?VDE5TC9yR3l0ZWs4ckJ2N1dESFV1bDFVSzZQalNDOHQrMTRsVWpaUFdib3hD?=
 =?utf-8?B?RERDQTVnWkh4bzhxV1lGK3VyTFVMd2VSVGVUeFFZeU4yL0RMa1h5Uis2Rlla?=
 =?utf-8?B?c2dXWW5HdEhxR01Kc0tYVGVCa1JMcERkWGlLdGZMTVFpMVlqNXlqSFp1OWpZ?=
 =?utf-8?B?MU9NZW9VbG5CN0VyakFZTHBXVE5aZ0tZck1RNUVsWWQvSTJGcHhENVVBZ3VM?=
 =?utf-8?B?dXcvb0hFQ2ZRcnZHcWNQR1k0NTM1ZWV0ZUVzdDRVL2pjb20wZWJaWnJTWkoy?=
 =?utf-8?B?N0xMYmNOV2h1bU51ME5Hc3RBandtUlY3eTZkakMvZXpFc25uR2t0TW5vTGVJ?=
 =?utf-8?B?a3BPbnlJVzd6Y1Nxd3lMWGdzV05DNG5hdCt6ZlRsbHJHQlg3cXpIS291Nm5v?=
 =?utf-8?B?WGFNc3JKVy9GN0hOSEJtR20vaHc0TzNaS0hWZHc0M2dvRStlbGJHSEpNTTV5?=
 =?utf-8?B?UTBYbTdZd3lDS1kvNFBCb1BsL1RjWWVEZmZ3Qno3UlhoZWlvMUY2VmdSYnNy?=
 =?utf-8?Q?svWHz6to0/saQ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(376005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 21:05:46.9564
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d09114-d41d-49ca-186b-08dc79109ed5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9258

Hi Zithro,

On 2024-04-24 10:03, Jason Andryuk wrote:
> On 2024-02-29 02:00, zithro / Cyril Rébert wrote:
>> The xl command doesn't provide suspend/resume, so add them :
>>    xl suspend-to-ram <Domain>
>>    xl resume <Domain>
>>
>> This patch follows a discussion on XenDevel: when you want the
>> virtualized equivalent of "sleep"-ing a host, it's better to
>> suspend/resume than to pause/unpause a domain.
>>
>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Suggested-by: Marek Marczykowski-Górecki 
>> <marmarek@invisiblethingslab.com>
> 
> You should include you S-o-B here to certify your patch under the 
> Developer's Certificate of Origin.  You can read what that means in 
> CONTRIBUTING.  tl;dr: You are stating you can make the open source 
> contribution.

I'd like to re-submit this while retaining your authorship.  Are you 
able to provide your S-o-B?

I'll do all the follow ups, but I need your S-o-B for me to make the 
submission.

> I tested this with a PVH and HVM guest.  suspend-to-ram and resume seem 
> to function properly.  The VCPUs stop, but the domain & qemu remain. 
> Resume works - the VCPUs start running again.
> 
> However, the domain destruction seems to hang on poweroff.  The VM 
> transitions to powered off - state shutdown - but the domain and QEMU 
> instance are not cleaned up.
> 
> If I power off without a suspend-to-ram, everything is cleaned up properly.
> 
> Have you seen this?  It's not your code, but I guess something with 
> libxl or qemu.

I've found the issue.  xl exits when the domain suspends.  When the 
domain finally shuts down, xl isn't there to perform the remaining cleanup.

>> ---
>> - Tested on v4.17, x86
>> - the function "libxl_domain_resume" is called like libvirt does, so
>>    using a "co-operative resume", but I don't know what it means (:
>> - there may be a problem with the words resume <-> restore, like
>>    for "LIBXL_HAVE_NO_SUSPEND_RESUME"
>> - for the docs, I only slightly adapted a copy/paste from xl pause ...
>> ---
> 
>> diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
>> index 98f6bd2e76..ba45f89c5a 100644
>> --- a/tools/xl/xl_vmcontrol.c
>> +++ b/tools/xl/xl_vmcontrol.c
>> @@ -42,6 +42,16 @@ static void unpause_domain(uint32_t domid)
>>       libxl_domain_unpause(ctx, domid, NULL);
>>   }
>> +static void suspend_domain_toram(uint32_t domid)
>> +{
>> +    libxl_domain_suspend_only(ctx, domid, NULL);
>> +}
>> +
>> +static void resume_domain(uint32_t domid)
>> +{
>> +    libxl_domain_resume(ctx, domid, 1, NULL);
>> +}
>> +
> 
> I would just inline these functions below.

I see you were following the existing style, so this may remain as you 
wrote it.

>>   static void destroy_domain(uint32_t domid, int force)
>>   {
>>       int rc;
>> @@ -82,6 +92,32 @@ int main_unpause(int argc, char **argv)
>>       return EXIT_SUCCESS;
>>   }
>> +int main_suspendtoram(int argc, char **argv)
> 
> Maybe main_suspend_to_ram to be closer to the command line suspend-to-ram.

I'm thinking we may want to just use "suspend" for the command name and 
all the functions.

Thanks,
Jason

