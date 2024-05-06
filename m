Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F23828BC5AA
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 04:03:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717165.1119128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3ngR-0002H2-Md; Mon, 06 May 2024 02:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717165.1119128; Mon, 06 May 2024 02:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3ngR-0002Ex-Jo; Mon, 06 May 2024 02:02:27 +0000
Received: by outflank-mailman (input) for mailman id 717165;
 Mon, 06 May 2024 02:02:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pn4q=MJ=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s3ngP-0002Er-Rq
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 02:02:25 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:2409::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ada0973a-0b4c-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 04:02:24 +0200 (CEST)
Received: from CH0PR03CA0236.namprd03.prod.outlook.com (2603:10b6:610:e7::31)
 by DS7PR12MB8203.namprd12.prod.outlook.com (2603:10b6:8:e1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.39; Mon, 6 May
 2024 02:02:18 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::39) by CH0PR03CA0236.outlook.office365.com
 (2603:10b6:610:e7::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.39 via Frontend
 Transport; Mon, 6 May 2024 02:02:18 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Mon, 6 May 2024 02:02:18 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 5 May
 2024 21:01:52 -0500
Received: from [10.69.48.49] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Sun, 5 May 2024 21:01:49 -0500
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
X-Inumbo-ID: ada0973a-0b4c-11ef-909c-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n7p0sa8JZr9MVBCGnuDn4lD19SEzb0ll7CmD5VVEwsD5hqYEWbggQ3jUQI18/FYfNQVqFBWnGMSanGkxC3PCo2hqe7kGsw2S0QtJqt0xCaZyavhFdwzS3UxN6yyKhKWTM3PitEJCY0ytJtHDpNo7AERx11yjJNweaIgx++B7McyzAJqLQENpmLXVQ8l4QxEfhdoQFLab3R2rPZUvaoC9ptPW7OEYkNTPpt0kNbLi1pXkFBGK7FiURw9AzoBNrNnqKOYmSoGs1c5eRK2pDKDSH8irlF1BWK5fhlnfDYoJAGv/eT5DwzUb5/zNhWficcM7ogS3VorlhMMUz2rD5R9lTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqkhaQ3j8+Kjb2g9lCV7+HCsqiGSl3S6Y6XiGdv9440=;
 b=nAVu5d5jowJw/6RpDK88drrTP6UU9UXeqqqVZplNJRLh3r30e1ZdvLZ7jUESCZVZZX66yoLtisxBHkLVhVqJzl+I+kVLa5qsDwHdtpN23yz6iZS8atXJ7AuzgOhJZMe9fkD5ujxOiL/oeUmsFR4D//P6i1XIfRdtzPuuMu5NZlB1QEufYwmm8mqre7Ufub99kDZg6r4PNoqVLqs8PSpTHFWG8AnQXvZN+XzmZDBB5Wk2PASnruUQTnIv1rzqYXDhhsngyfJXMxg+tmPCTf6afw+6S13gl++xrDBwe6pEz6gLJG7z2jFaqfsHuAjyzzTp++Z6TfGGLpc80AydSQT0JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rqkhaQ3j8+Kjb2g9lCV7+HCsqiGSl3S6Y6XiGdv9440=;
 b=2xrVqG48jpB+IU3gEVGpEVC2uJcKmQ7/875aj4MwRFzspvV6foBj9uaQ+TKKk7xTcEH4cKRAVqUwUc1APK2uchgG8nxKKn0PI5HI2K3KnQqJJatHDalqB6FHNu6Q8qQQ3TBNTruVbNw7pfOT7yqfQpsjHCMKjhSJNTkXvYkHZ3w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <6d877f4c-b4a1-4f0e-9588-b035aaa71b4f@amd.com>
Date: Mon, 6 May 2024 10:01:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/arm, tools: Add a new HVM_PARAM_MAGIC_BASE_PFN
 key in HVMOP
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Alec Kwapis
	<alec.kwapis@medtronic.com>
References: <20240426031455.579637-1-xin.wang2@amd.com>
 <20240426031455.579637-3-xin.wang2@amd.com>
 <alpine.DEB.2.22.394.2405021104390.624854@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2405021104390.624854@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|DS7PR12MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: 47951bdf-12e1-47ce-c24a-08dc6d708ef1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|7416005|1800799015|376005|36860700004|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VGhuSWNNbmRMNit3VXJOQ2U0RUNaaE0vTEFkWXRJQ1pJcDRPU1l1WjFCSStH?=
 =?utf-8?B?TG9XdllmUWI1aElkZ1VheU85UEExZ3J1SkdKN1F1TkRBZjEvWHNjUHlxL25m?=
 =?utf-8?B?THJxWmtiZnlZZ0FrYWNMVGNtc1ZqL1FEblRwWlVuUEVJYTE3akNxQW9IMXZ0?=
 =?utf-8?B?K2VCanJ2QXZIU1NiVE1CK0I3MFl2M1VvRVUveUQ2ZWVrcUY0WXQwYTIzd2FD?=
 =?utf-8?B?cGxHUC9XWlIvb3RieTNhdkE3WXBCVXI3QUxrYXNNc2ZlOW5JcWpZdmxNZWgz?=
 =?utf-8?B?QnpiRG13ZXZRS1VyZ04xOTJNOUh6b1N2QVpqVlFtTUhDRU1YQ1hNNU4vdFJY?=
 =?utf-8?B?Q2ZsTk04RjJCZ3lHdVRxak5Kc2ZTWEZueFpPT21NL1psU1NCT2gxQndDMXRn?=
 =?utf-8?B?TWZ6akdidnMzVFA0TStoWGFVOFBLc1BkTWhqbTNpbThLMGxhVHN5ejhkVWVF?=
 =?utf-8?B?SStaNjBMT25YQ1Jxb3kyQmtldzJVOHByelRBSmNac3FHaGhvbEpGblBnUGtR?=
 =?utf-8?B?MmQ3WVBzSFFKTERxeEJMb2FEZXl2SUVoc1J0ejRUNE95aGdzdnMxd1dxS25p?=
 =?utf-8?B?QkdXUWxpUG02RmJoa0xKazhJY1BMYlhrcDNiVVBUYVB5YjFjZ0x5Mm91SjR6?=
 =?utf-8?B?bk12RUZsV0ZnekdWMFFZUTlQMTJkYmlhMDhpL29Nd0RSSVZuQ2FZaXRVMjhH?=
 =?utf-8?B?VGQ0MG9kL2g0NDF1cWpJQzZVRFlzY3htSWduYnFFdW1IalFzUTRzekptUWJh?=
 =?utf-8?B?R0Z0SVpJRUZmclZuQ0QwRDlBcG5NTmd5ZWRCa1RsQ29NQ3hvTkYyNVRlVFRE?=
 =?utf-8?B?SzhSMFNmVHBUY0s4UWJqSmxiaW9SRGlMTFp1QjNrUFFoaU1hZTd2dlIrWkN0?=
 =?utf-8?B?eTJ4N2JkeXFyckhnLzlBZEVGOU55eDJvQW03WE9zaDBjdVZNWG9lQUZsVlZ3?=
 =?utf-8?B?M1Vha1hnS2JxWWU2NWdwL1VrVHBid0g1T1k4aDExWk1yaGpuVjVWcjBIanJP?=
 =?utf-8?B?cDBHMTZLWi83Q2R2dncxOHJMdUo2OUxmZEZLaytpdHFBTXRQRWlKMjQzR0dt?=
 =?utf-8?B?QVNacG1uT1YwM1JMVXpZQjZmR21UTHpEeUhjVGc1UXRLaHFOcFl4a3RHZjU1?=
 =?utf-8?B?TndxWkd5MDZnamdPeHo3Nk9OYllWN0JERGkrTlBtZTM2ZU1DMjFLTEFoZFgw?=
 =?utf-8?B?bnJraDFjWGV3Szc5VVJEVEl5RFRCRnFseUlWTFUweEorRFAyNGpsRDhCdEpB?=
 =?utf-8?B?aE1IdWU5eTBGci9KM2J5RUpjcVROMVdHUUNzaG5tZ0ZpbDFEN0RTR0ZjaTU4?=
 =?utf-8?B?Q3lEK0VhWGRtNFZ3LzdpUlpSTWg5RGRUeFJrZ0FKTGI5K2dVNDQ3TUh6dSt5?=
 =?utf-8?B?L0k3eUxRTTNrOGdmK2gzOWdXZ2NXQ2wySEwrR0FjWnV1ejZkUXYwaWtvTGNk?=
 =?utf-8?B?Q1NYcERXbUVSMUZBOVNtYWpZV0FqeEJ6c215MWJDT1A2MEhRY0NOSEpGc29C?=
 =?utf-8?B?STNnUHQrcnpUalBpdXArelVtcldXUCtLOVJqUC9rd1ZSU0E0bVYzV3d3bUJC?=
 =?utf-8?B?ZURWR2htSGdtc0syUnlyTkwxZEZ0V3lvdzNyVElTS0NnOVJqZ1BHU0FOSUJL?=
 =?utf-8?B?ODNYNjNybGZhSlpxZ1Q4Wk1KcEo1NWNQbmJ4ODBUcVJUVVhwVnFSTUdsK0x0?=
 =?utf-8?B?VFNBRTU5K3dYTEJFSEE2MEcxdEtsT1FscmZoRUlFY0FuNjVsUW5wS2NvM1RG?=
 =?utf-8?B?blBtYmNHMUp5bFpyNXVtUlhMa3Q3bGZjcUxDbGVFOWNKVHR6RGV6VUxBZjFN?=
 =?utf-8?B?eVdkekZpcnJMTXpWelRpb3V5TnQwalo5N0grditLaWRvWmR4WC84b0I2VlF3?=
 =?utf-8?Q?7R+i35vGxEXOi?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(376005)(36860700004)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 02:02:18.1116
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47951bdf-12e1-47ce-c24a-08dc6d708ef1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8203

Hi Stefano,

On 5/3/2024 2:08 AM, Stefano Stabellini wrote:
> On Fri, 26 Apr 2024, Henry Wang wrote:
>> For use cases such as Dom0less PV drivers, a mechanism to communicate
>> Dom0less DomU's static data with the runtime control plane (Dom0) is
>> needed. Since on Arm HVMOP is already the existing approach to address
>> such use cases (for example the allocation of HVM_PARAM_CALLBACK_IRQ),
>> add a new HVMOP key HVM_PARAM_MAGIC_BASE_PFN for storing the magic
>> page region base PFN. The value will be set at Dom0less DomU
>> construction time after Dom0less DomU's magic page region has been
>> allocated.
>>
>> To keep consistent, also set the value for HVM_PARAM_MAGIC_BASE_PFN
>> for libxl guests in alloc_magic_pages().
>>
>> Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
>> Signed-off-by: Henry Wang <xin.wang2@amd.com>
>> ---
>>   tools/libs/guest/xg_dom_arm.c   | 2 ++
>>   xen/arch/arm/dom0less-build.c   | 2 ++
>>   xen/arch/arm/hvm.c              | 1 +
>>   xen/include/public/hvm/params.h | 1 +
>>   4 files changed, 6 insertions(+)
>>
>> diff --git a/tools/libs/guest/xg_dom_arm.c b/tools/libs/guest/xg_dom_arm.c
>> index 8cc7f27dbb..3c08782d1d 100644
>> --- a/tools/libs/guest/xg_dom_arm.c
>> +++ b/tools/libs/guest/xg_dom_arm.c
>> @@ -74,6 +74,8 @@ static int alloc_magic_pages(struct xc_dom_image *dom)
>>       xc_clear_domain_page(dom->xch, dom->guest_domid, base + MEMACCESS_PFN_OFFSET);
>>       xc_clear_domain_page(dom->xch, dom->guest_domid, dom->vuart_gfn);
>>   
>> +    xc_hvm_param_set(dom->xch, dom->guest_domid, HVM_PARAM_MAGIC_BASE_PFN,
>> +            base);
>>       xc_hvm_param_set(dom->xch, dom->guest_domid, HVM_PARAM_CONSOLE_PFN,
>>               dom->console_pfn);
>>       xc_hvm_param_set(dom->xch, dom->guest_domid, HVM_PARAM_STORE_PFN,
>> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
>> index 40dc85c759..72187c167d 100644
>> --- a/xen/arch/arm/dom0less-build.c
>> +++ b/xen/arch/arm/dom0less-build.c
>> @@ -861,6 +861,8 @@ static int __init construct_domU(struct domain *d,
>>               free_domheap_pages(magic_pg, get_order_from_pages(NR_MAGIC_PAGES));
>>               return rc;
>>           }
>> +
>> +        d->arch.hvm.params[HVM_PARAM_MAGIC_BASE_PFN] = gfn_x(gfn);
> I apologize as I have not read the whole email thread in reply to this
> patch.
>
> Why do we need to introduce a new hvm param instead of just setting
> HVM_PARAM_CONSOLE_PFN and HVM_PARAM_STORE_PFN directly here?
>

Yeah this is a good question, I aIso thought about this but in the end 
didn't do that directly because I don't really want to break the current 
protocol between Linux, Xen and toolstack.
In docs/features/dom0less.pandoc, section "PV Drivers", there is a 
communication protocol saying that Xen should keep the 
HVM_PARAM_STORE_PFN to ~0ULL until the toolstack sets the 
HVM_PARAM_STORE_PFN.

I am open to change the protocol (changes might be needed in the Linux 
side too), if it is ok to do that, I can set the HVM params here 
directly and change the doc accordingly.

Kind regards,
Henry



