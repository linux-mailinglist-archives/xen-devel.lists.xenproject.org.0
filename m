Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD83A5972D
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 15:12:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906504.1313928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trdrx-00015Z-VK; Mon, 10 Mar 2025 14:12:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906504.1313928; Mon, 10 Mar 2025 14:12:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trdrx-00013M-Rt; Mon, 10 Mar 2025 14:12:37 +0000
Received: by outflank-mailman (input) for mailman id 906504;
 Mon, 10 Mar 2025 14:12:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vjn7=V5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1trdrw-00013B-7g
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 14:12:36 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20607.outbound.protection.outlook.com
 [2a01:111:f403:2418::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b636b081-fdb9-11ef-9ab8-95dc52dad729;
 Mon, 10 Mar 2025 15:12:35 +0100 (CET)
Received: from SN7PR18CA0025.namprd18.prod.outlook.com (2603:10b6:806:f3::29)
 by CH3PR12MB8355.namprd12.prod.outlook.com (2603:10b6:610:131::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 14:12:25 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:806:f3:cafe::89) by SN7PR18CA0025.outlook.office365.com
 (2603:10b6:806:f3::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.27 via Frontend Transport; Mon,
 10 Mar 2025 14:12:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 10 Mar 2025 14:12:25 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 09:12:24 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 09:12:24 -0500
Received: from [172.19.213.155] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 10 Mar 2025 09:12:23 -0500
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
X-Inumbo-ID: b636b081-fdb9-11ef-9ab8-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wQ+cYJ7Yo4yTqKP/6HnAy/a2kq7zw2uJD7O1BmTVGzUr90RUoeIewBdrRpqKuDo3tv7rtbLCRMbFCE3jQkjLQNrP6DDQxNoJ7j1ZNdrXXKSmyPBfze1vnzVmp0z9iJxZSY+tk6EhZdvjFw+JoLxOzfn0h56E0n3i9SUA34kwEiSJKtOtVsuJXbf029Z3gUlyd++xFijwGT623ZhQGfG6mfjIlboRAr7Us3gTLh55xb+i/dWBnqk5BnGtedcz/Hc3cTWrf3oJ4ymhTN6ZbPtf224tPJR1nu6pdc2Anf89cEZSNgx9YDIdb2CaVUa+EX1cYIqrYEsmicrX9DjpDU+yoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1Mf68D1nxUB0NHlNKf0e3ivA18nJLQbFdwBqlgWvSs=;
 b=JFqRzKsIVgMCpNxHqbarqX9PFlF/sMEgULDLR6UHmzAuhT3uqWl3e0pbe5yIB0o4O6fgFgferA893/DC20dnHRX6hsf7e+wqyJcRinKW6s0SWJZC4QrpbVoSoqik/ajZx2yMe+p0edrvzkgj7l4Mcn8N+LufykmpRJg657eUgQqFY5aftukQgEGAwSOuPNtaRb9FCA0VmzRJLtZvgtCDUNAKq3Lydm1WxYEh9sH1dixksWdR1oco/xqqk8KizVEpGqB7OjquWZcfLwOgyDU/VohGtk7LVT6AeOGFmCpEWUWDsgoCsAK/JUdQPaVQYNh6kAxWS/1hn/H2me+wh4QpHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1Mf68D1nxUB0NHlNKf0e3ivA18nJLQbFdwBqlgWvSs=;
 b=JQF6k8R2zYVQhaflgZX9m/dBl6MFsWyv3xqtEqdz3jRDJPIX+L2fnczrtxvtCnb17R4Bcoyz1xciUTECSqZcqsgOtF0ZVuIahHckM1qtfR90Ed+IoDKeWvwH4ApdPvCgvMLj2s5DBdGqX90oNpCFKUmWKsb20ozwGiOuLEzCPPw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <6e994193-7761-4fb9-b4d3-ae784080e45a@amd.com>
Date: Mon, 10 Mar 2025 10:12:27 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/23] xen/arm: dom0less seed xenstore grant table entry
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-9-jason.andryuk@amd.com>
 <8be2b25d-7a2c-40a5-bbdb-0f7aade2bbd2@xen.org>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <8be2b25d-7a2c-40a5-bbdb-0f7aade2bbd2@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|CH3PR12MB8355:EE_
X-MS-Office365-Filtering-Correlation-Id: 279f5c9d-23bc-49ea-c554-08dd5fdd9558
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UnM5YzhBbTFrUVVIRW1RV240UFFIaGVWbnlYc0Z6R3pzY1VIREo5cy9wczNl?=
 =?utf-8?B?UlJ1K3h2emVvbmNSc084dXU1RGRPOWtWVlhqVzJkWlhEbWVSMTNRKzQ0R1l1?=
 =?utf-8?B?dThxUU5OT0tMTEtsajBWN1BpUXQzNi8zQis1UnF1Y1RocE10WWVlWVhnNXRh?=
 =?utf-8?B?U1hwamw2TWdEWXNUb2NXNGlDVGpZZDdnTWlQNVNkNG54cEcvZHI2WVBEdFVk?=
 =?utf-8?B?MXJ3WEI2OStXTTgwYzJWZXByOWtsRk1aelkxaGlrelVLZmZXeVlOanZCcDhN?=
 =?utf-8?B?ZHdORFhEUU9Ec0JDSkdDQzFJV3pSOVFod1l4eFUwNWhTOG5iNnBnQzJMdE04?=
 =?utf-8?B?aDVzd0JmOHdJZ05DN2VUKzJSeEU5V3FkQnhDT2x2VHR3MFBxS0NNYlBkNEYv?=
 =?utf-8?B?bUFQczkzdUtjR3BXSi9KOTZXSExUWVhNNEJkOENSUHhicGYwTFRDelQrL29X?=
 =?utf-8?B?c2JzdkVuT3hYVGVCdzFWZ2tzVkppY29sMU1hODNHNUVURHlJZ0FjZGtxd3Vh?=
 =?utf-8?B?NUtzNVFMcEY1U25pampKY2VaQTdvYkx4Wm5KYkxVZlJybzZXZkp6eVloOFZi?=
 =?utf-8?B?aWpDOVliYkdabWtpb0ZkTWppUUdpbFJJWG1pdy8zbkwwZ2ExWkNyMlVCSE1t?=
 =?utf-8?B?cEZQV2tVNnVPQlBCakhyZGRYdXZKcC9FUXhlcC80VDA1TEdXcHpsV3l3NW9M?=
 =?utf-8?B?VC9wa2tVRkRrQWgzL1RCMFV3MkRaZU5Kd1VYQllyUzNxMHBFSmtpbWV6TU5y?=
 =?utf-8?B?MEhoVElxNkFuTURQWnFtQVB1dEh0SWRNd2RLZUcrOFFYSUJ3RGZQMU5ZVlRu?=
 =?utf-8?B?TVdwQTVLWFh4bDgrQTlvcVlCQmtPT2U0VTg0dEVJNmdwWFEwdURMNkRmTnRZ?=
 =?utf-8?B?Y09OajVYejBZN3ltdVVZSmNndzNtRGJFekNzOGpOUGI2SDBsYzR0SEJOM3JO?=
 =?utf-8?B?TGw0S2hzcnNxSWFaRi9iWG5HeXVCVmJvMnN5U1d0Tk9JV3hDbVFyL3NCdi83?=
 =?utf-8?B?bWlzblFSNlEzb0QyOVRXTzBaNHlrTjlpbFVtalNOMm40RGE2SnFYTnQ4N05Z?=
 =?utf-8?B?U2psQ0RNb2NzQTRsa0tUR1NkR0V2ZE1LQjVvZzRrN0luVG9hb1dhbVRCRkdi?=
 =?utf-8?B?U2ZyWFJlVkV5Z0hncSs2SUdlMi95L3BhZUhoc0R1cSs3MUhRQTdNaWZNR0px?=
 =?utf-8?B?ZmQ4UFNzUDcrRlZrTlJ6eHpYbHdsQ2E0Q0pxRjV0ZWhwRFJ1MHJDMXBLaWV5?=
 =?utf-8?B?Y1kzNUZhNmVQNjY1Vk5xclZjekZ4ZysrZGFtaDhwQTcyY29ITFRQWUxiS0pF?=
 =?utf-8?B?OEtOd0xTNkwzTmpKM1VhamJiODhaSnZ2Vk84YTc1UDFHSGRCOER4QjVPblJw?=
 =?utf-8?B?VUVqdkpIUTdxYnFDbEJFQytLMGt0QlhPR2hLMXlQakZTS1hqV3d1aGxNaFBo?=
 =?utf-8?B?d1NMMlFEVkhUc1owQVdwQ1lhM1FIL1BmcmNvWFIzak9GdlA4Zlp5RU4reEhn?=
 =?utf-8?B?UzZ5NldSeGg2MDVoRHJrb3YzSzVZYXk0ZU1qdjRMRmh6dVUrd2tsZlFUdjJ0?=
 =?utf-8?B?bnY2R1lRZWxJL2RRZjMzLzlnQzBnWXBDa2tFbDlIc0NFMjdBbEovaEQ5MTdB?=
 =?utf-8?B?Y2VZVWpEekJwd2dmN3pORnZpUU1sM1ZKc3p0ZitsejVKa1FxUXhxR01Cc0Fl?=
 =?utf-8?B?NkVyYW9IVjVVbFEvWWNybjJGTWpwUzNHSmQ0MHBuSFFzcTNER3kvU00zbG5I?=
 =?utf-8?B?UFFxWHVpRWMvdzJSZXJSYjl3Ymw5RXhwdWxDQjNDQnV5WnRrKzBsZ0QxNVM5?=
 =?utf-8?B?a2JvZHZQMmpHazA0aFcrYlRScXFjMWVhamR4cHV0bGkwbm5Nei9BUGk4Mkxu?=
 =?utf-8?B?YzRXOEdMaTE0UFBucllPZzY3amJnMWo3UUdMM21iNXhMd2cwdk95UTVPbUpm?=
 =?utf-8?B?SEs4SS9BNVdHeEp3VlNNQ2VwNkxMK3oxVkNPbmRETUF4MnlwVVVCUHhNWGlh?=
 =?utf-8?Q?6IxaAib8rVQvwBByl48GED3i4x9p5U=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 14:12:25.3574
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 279f5c9d-23bc-49ea-c554-08dd5fdd9558
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8355

On 2025-03-10 05:32, Julien Grall wrote:
> Hi Jason,
> 
> On 06/03/2025 22:03, Jason Andryuk wrote:
>> With a split hardware and control domain, the control domain may still
>> want and xenstore access.  Currently this relies on init-dom0less to
>> seed the grants.  This is problematic since we don't want hardware
>> domain to be able to map the control domain's resources.  Instead have
>> the hypervisor see the grant table entry.  The grant is then accessible
>> as normal.
>>
>> This is also useful with a xenstore stubdom to setup the xenbus page
>> much earlier.
>>
>> This works with C xenstored.  OCaml xenstored does not use grants and
>> would fail to foreign map the page.
>>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>>   xen/arch/arm/dom0less-build.c |  9 +++++++++
>>   xen/common/grant_table.c      | 10 ++++++++++
>>   xen/include/xen/grant_table.h |  8 ++++++++
>>   3 files changed, 27 insertions(+)
>>
>> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less- 
>> build.c
>> index 068bf99294..f1d5bbb097 100644
>> --- a/xen/arch/arm/dom0less-build.c
>> +++ b/xen/arch/arm/dom0less-build.c
>> @@ -21,6 +21,8 @@
>>   #include <asm/static-memory.h>
>>   #include <asm/static-shmem.h>
>> +static domid_t __initdata xs_domid = DOMID_INVALID;
>> +
>>   bool __init is_dom0less_mode(void)
>>   {
>>       struct bootmodules *mods = &bootinfo.modules;
>> @@ -753,6 +755,10 @@ static int __init alloc_xenstore_page(struct 
>> domain *d)
>>       interface->connection = XENSTORE_RECONNECT;
>>       unmap_domain_page(interface);
>> +    if ( xs_domid != DOMID_INVALID )
> 
> Looking at this patch again, is this guarantee that the xenstore domain 
> will be created first? If not, then I think your series needs to be re- 
> ordered so patch #10 is before this patch.

Yes, you are right.

>> +        gnttab_seed_entry(d, GNTTAB_RESERVED_XENSTORE, xs_domid,
>> +                          gfn_x(gfn), GTF_permit_access);
>> +
>>       return 0;
>>   }
>> @@ -1173,6 +1179,9 @@ void __init create_domUs(void)
>>           if ( rc )
>>               panic("Could not set up domain %s (rc = %d)\n",
>>                     dt_node_name(node), rc);
>> +
>> +        if ( d_cfg.flags & XEN_DOMCTL_CDF_xs_domain )
>> +            xs_domid = d->domain_id;
> 
> What if there is multiple domain with XEN_DOMCTL_CDF_xs_domain? Should 
> we throw an error?

Before this series, there was no restriction on its use, but only 
init-xenstore-domain used it.  The XEN_DOMCTL_CDF_xs_domain flag allows 
the domain XSM_XS_PRIV, which grants a few more operations to an 
otherwise unprivileged domU

With the use of xs_domid (only during construction), maybe it should be 
limited to just 1 to avoid surprises.  Otherwise the last built xenstore 
domain would be configured as the backend.  Nothing would break - it 
would just be surprising.  I'll restrict to just 1.

Thanks,
Jason

