Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8B7B3839C
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 15:20:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096014.1450833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urG3f-0000fW-64; Wed, 27 Aug 2025 13:19:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096014.1450833; Wed, 27 Aug 2025 13:19:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urG3f-0000dx-36; Wed, 27 Aug 2025 13:19:23 +0000
Received: by outflank-mailman (input) for mailman id 1096014;
 Wed, 27 Aug 2025 13:19:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n4tM=3H=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1urG3e-0000dr-2S
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 13:19:22 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2418::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f697f89-8348-11f0-aeb2-fb57b961d000;
 Wed, 27 Aug 2025 15:19:19 +0200 (CEST)
Received: from BN1PR10CA0012.namprd10.prod.outlook.com (2603:10b6:408:e0::17)
 by DS0PR12MB8503.namprd12.prod.outlook.com (2603:10b6:8:15a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Wed, 27 Aug
 2025 13:19:14 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com (2603:10b6:408:e0::4)
 by BN1PR10CA0012.outlook.office365.com (2603:10b6:408:e0::17) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.20
 via Frontend Transport; Wed, 27 Aug 2025 13:19:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.0 via Frontend Transport; Wed, 27 Aug 2025 13:19:12 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 08:19:10 -0500
Received: from [172.31.63.243] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Aug 2025 08:19:10 -0500
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
X-Inumbo-ID: 6f697f89-8348-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UGagWUl5drSypdrutre4kNzMKwShZeuzofNAOipfcwLlOEoAkBz0um/bUhOJt/PU4dkykddGM7W6VFssrMvI6laYsRPe9JQPNVWLgcB19Tb9UOPnigpzClENcoXFCzw6+B/XDkqx7x3z0t81REffTlg2XF0NRC/Ln3PPGa8/iewNyCD3NB/h/Fw3AlFeCJIWJC4LszDcDi6LpaGTc8JWYQgf74AlYIQBE8394c65atwX2y4+Ni776qo1CBUn74bsdGT9ws7w4375YIyi12vfKsMxoprFxj3+u0UMV5luH/Iwy4mFs7iP2wcP2vmOtAk3xLqV4vOGr5cmdocbiT63Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KyjzUob1uy0Vqyna53Q1B04376b7ib8w6l4RLlZvr3I=;
 b=ZRdrTOdaN7TaOjGUAMEfhawrAccSLiTYSfEGPwDd3KytL88gTHN/aiDrkQbcifWebg1yGAArL+4OQLtqwNjy9037VQJwTZ9DG4r27aXIR4yNdbIjLTh5XV2vMzSsdKtI7CjhU6kJ7rZE/CnHL63acNqF/zfUmOcvcX3sWBhzn5nxRk8YsV0gfuAj7fhbgr0VsS3HK74yIPSJFnW8KOtu9G6ZJYYz8Jhd1MUM5HSZ0IyM3Zc77vLumX349guQFojfbvcT4sgDKa099lIhOLkykfX1LJeM9O+BfuuFYsBH/NMaF8dnBt+v9LwEgvdZ+dX32v1gWBagig+iqq4vh7jPsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KyjzUob1uy0Vqyna53Q1B04376b7ib8w6l4RLlZvr3I=;
 b=LpooXRmJgg6XseuU963V9EVZWRCM3Ou4CbUEFmA1U1KxvkpxYl7Y8lSVV9Qd338/0/9SalpCGfKDqPZ+0dU9Itreijkz20Ygpz7pUyb+XnTaOqtTelcFk9r7J8tRtrlG2PbeZ7AWUpw7bDhhmhCwrl4dFiDuGBwnxXAPAeP87CI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <efe407de-87e5-4434-a434-4d513b50f52c@amd.com>
Date: Wed, 27 Aug 2025 09:19:42 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] xen/dom0less: store xenstore event channel in page
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
References: <20250826210847.126015-1-jason.andryuk@amd.com>
 <20250826210847.126015-9-jason.andryuk@amd.com>
 <609d686e-a41c-47f4-9e5d-3733e9ec7723@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <609d686e-a41c-47f4-9e5d-3733e9ec7723@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|DS0PR12MB8503:EE_
X-MS-Office365-Filtering-Correlation-Id: d72ebb20-4d4b-4808-c5c8-08dde56c5089
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QjhGNVpjdUlSZ0p0WWVzTzRSQUpVUFJhTlg5djFwUDlZYzdneU1va054OHY1?=
 =?utf-8?B?MURFSUtEVzRmWXFpVStLNkhZeHcrQVFxbklnUTI3STFNOHNwMWZzVjBwcWNW?=
 =?utf-8?B?c2VPMUpMYjhUK0h5V3c5dTdNOHF4d29CZkpvTDNCbWRyS2pMMXFVMFpHN1Mx?=
 =?utf-8?B?cmswSkFGSnViMHJPVTZqRW40Qnorb3pkR1lHT0FRKzZNWnZwc2JRRWFwVExy?=
 =?utf-8?B?bGJOUFZRc3BFSEF5bmJKVnFISzVtTDNyNGN0RGRVYW1MM0pKaWg0SE5TdnJC?=
 =?utf-8?B?bEtnL2VHZG5Cc3lmNTVWYW5wSm1PRjVnQzdYMkJBVWlCZ25EVWtkZGp6US90?=
 =?utf-8?B?OWFLNHNvSTNQRU9ERTZId1k2QUN3SDNUKytHVmMrWkdxVERlck5jTnl2SXB5?=
 =?utf-8?B?S2lQVlhjT3JvQ1NiQ3pHc0dkSXdaaXExczZ6TFdZVnFicm14M3oxa2M5SFRi?=
 =?utf-8?B?clMwS1VCK1ZYVFZzU3RUYkNRcklpQnM2blgrcVRKVGxTazRVdndMS1ZkdHR0?=
 =?utf-8?B?bFJJTXlDM25TcTFqMWZ5UHorTHJvckQvM1lORERLNks3WjlTTWJ6eDYyZ3dU?=
 =?utf-8?B?bXZETUR3WjFNUEJPb3dBRXlseEpJOVJ3czN0SnBldGp5TmhxK09RaVJEOVVx?=
 =?utf-8?B?S2loR2FnSnVRN2FnQXJKOUpEZkxYRW5qaENVT1pncWd0d1F5UUlTc2FNR2FE?=
 =?utf-8?B?R0ZOWDFna2dJTGJUNyt0a3VsMHM2enNnVVlqUHNTTmptUXgrNWxuYTFQQWYx?=
 =?utf-8?B?VXJhS1ArR3JVRE9XUHR3R3BLL05EQ0pEOVFEMEUvMXB5RHlia3dTUEdZUlFu?=
 =?utf-8?B?RDhuRW9NSXE2OXo4bStxak1BM0tUbDdxOCsrdnRRMk9JWmpVMHkyNklIOTZo?=
 =?utf-8?B?TEJTbEhTWlZueXJ1ajRpTkhxQlFhVHVzd2dsL0JIMEtjaVp5MXp2VVFDYlg4?=
 =?utf-8?B?OE5WTEd1NTRQWTJ1U3dFZUhjVmY2RGtqejhGRys5cGZxd3R1QUM2UWdvRlJv?=
 =?utf-8?B?YVlaVUtId3VtaXdxcnJDbjlacHpwMzhCT0o3cUZnQUgvQlYzMXNySGtTcy83?=
 =?utf-8?B?T0FZNG4vMWM2UGE2a0s1OXhHSG00QysyMlgrVHhHNHJPWU40OXdzUUZxb3hT?=
 =?utf-8?B?REgraHhJUUF3aXRCM05rckVBbFhiMjdwVUJMOVZLZ29FajIrUWc2ajRkM3o2?=
 =?utf-8?B?R0NBWVlsVkloRXZvQkg1UjgrQjRwNkNSUm9zL2pMOWRlM2Rod2FIMnBINzhK?=
 =?utf-8?B?RWJCdmo2U291U2ZBSitFRG1WM1NmNHRzTFZGKzlOc29Yb3IxWXpwNzAzbm1B?=
 =?utf-8?B?RDNBY1U0akZKSGJma1ZzZ0o3Q1BYUzZrRVJ6TkgwU2taRy9VcElUOUlWSEFY?=
 =?utf-8?B?SzV4UDdmc2tKV2lIYUhUbU1VbXZUWld4VVpJb2g2ZFlmN3h2WDN3WFZsWElB?=
 =?utf-8?B?MitsVEkyekhvSUhrS3o0MUI1akJ4SVY4YTVwRGE2aXBpaGxtRWFGYUxQQnNW?=
 =?utf-8?B?eXdZcUYxRHVLemEvM2tLUmc4L2RYY3BrbGk3WE50a01VSTExa1FJQU1xYkZi?=
 =?utf-8?B?THpPZjAzNGVkQWt4NktZUEZ1WlFXUlVvOTFkM0pWRUlCY0lDbzlSTkVpY0hT?=
 =?utf-8?B?bGZ3NkZLcXJWUUVHS1ZoTjBpdkl6OHRzMGxiUlMvMEF4Znk2U2l6cXpvd0Jt?=
 =?utf-8?B?Y0tzUXk4SWpkSkdPb3lvUFRLb2wvMytyRVhPWXV1MVlVYWhzemcyUHg1UUlD?=
 =?utf-8?B?QkJLVld6cUhBZXpqQVhSMTBHK2pUQVIxUTdyWHc1Z1h5SmpONnphSGJNTkdH?=
 =?utf-8?B?V0lGMjVHZHc3SUw1RUtQSGovcFo5Q3JnTUJ4K2xGVnN0UzZMY3ljNjFrSmRm?=
 =?utf-8?B?ZGowUlQySGlza3JMeHFsODdaZWFwOVlhU0gxMXFLdlV6SE4rWnU3OUxLR1JK?=
 =?utf-8?B?c3puRnRVdTBManJIaTNnRDlORFQ4M3V0MkdoNGQzblJTSWZHWjlObEs0UHVG?=
 =?utf-8?B?OXZQR09IblhCa054bzhTNnA0MXdia2czRzNHc0JQTDJEclJlV2V4WXJvTDJu?=
 =?utf-8?Q?xRFVM7?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 13:19:12.6502
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d72ebb20-4d4b-4808-c5c8-08dde56c5089
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8503

On 2025-08-27 03:58, Jan Beulich wrote:
> On 26.08.2025 23:08, Jason Andryuk wrote:
>> --- a/xen/common/device-tree/dom0less-build.c
>> +++ b/xen/common/device-tree/dom0less-build.c
>> @@ -26,6 +26,7 @@
>>   #include <public/event_channel.h>
>>   #include <public/io/xs_wire.h>
>>   
>> +#include <asm/guest_access.h>
>>   #include <asm/setup.h>
>>   
>>   #include <xen/static-memory.h>
>> @@ -120,8 +121,14 @@ static void __init initialize_domU_xenstore(void)
>>   
>>           if ( gfn != XENSTORE_PFN_LATE_ALLOC && IS_ENABLED(CONFIG_GRANT_TABLE) )
>>           {
>> +            evtchn_port_t port = d->arch.hvm.params[HVM_PARAM_STORE_EVTCHN];
>> +            paddr_t evtchn_gaddr = gfn_to_gaddr(_gfn(gfn)) +
>> +                offsetof(struct xenstore_domain_interface, evtchn_port);
>> +
>>               ASSERT(gfn < UINT32_MAX);
>>               gnttab_seed_entry(d, GNTTAB_RESERVED_XENSTORE, xs_domid, gfn);
>> +            access_guest_memory_by_gpa(d, evtchn_gaddr, &port, sizeof(port),
>> +                                       true /* is_write */);
> 
> Isn't the use of an arch-specific function going to pose yet another issue
> for making this code usable on x86? Can't you use copy_to_guest_phys() here?
> Which may in turn need to be passed in by the caller, see e.g. dtb_load()
> and initrd_load() (i.e. cache flushing may also be necessary for Arm).

Yes, that could be done, but it's not my preferred approach.  Using a 
function pointer to pass a compile time constant seems to me like a 
misuse of a function pointer.

I'd rather each arch using dom0less define:
unsigned long copy_to_guest_phys(struct domain *d,
                                  paddr_t gpa,
                                  void *buf,
                                  unsigned int len);

Which does the correct thing for the arch.

Alejandro was able to re-work things to re-use the dom0less parsing code 
(dom0less-bindings.c), but he has so far kept the x86 domain 
construction separate such that it does not use dom0less-build.c.  So I 
don't know how that will shake out.

But, yeah, I can just pass in a function pointer if that is what is 
agreed upon.

Regards,
Jason

