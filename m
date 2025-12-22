Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B772CD741A
	for <lists+xen-devel@lfdr.de>; Mon, 22 Dec 2025 23:17:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192361.1511633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXoCv-0000TO-LK; Mon, 22 Dec 2025 22:16:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192361.1511633; Mon, 22 Dec 2025 22:16:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXoCv-0000RR-IB; Mon, 22 Dec 2025 22:16:49 +0000
Received: by outflank-mailman (input) for mailman id 1192361;
 Mon, 22 Dec 2025 22:16:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yff0=64=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vXoCt-0000RI-Pa
 for xen-devel@lists.xenproject.org; Mon, 22 Dec 2025 22:16:47 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5c943ef-df83-11f0-9cce-f158ae23cfc8;
 Mon, 22 Dec 2025 23:16:44 +0100 (CET)
Received: from SJ0PR03CA0334.namprd03.prod.outlook.com (2603:10b6:a03:39c::9)
 by LV8PR12MB9134.namprd12.prod.outlook.com (2603:10b6:408:180::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 22:16:39 +0000
Received: from MWH0EPF000971E8.namprd02.prod.outlook.com
 (2603:10b6:a03:39c:cafe::31) by SJ0PR03CA0334.outlook.office365.com
 (2603:10b6:a03:39c::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.11 via Frontend Transport; Mon,
 22 Dec 2025 22:16:30 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000971E8.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.9 via Frontend Transport; Mon, 22 Dec 2025 22:16:38 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 22 Dec
 2025 16:16:37 -0600
Received: from [172.19.65.57] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 22 Dec 2025 14:16:37 -0800
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
X-Inumbo-ID: e5c943ef-df83-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aULm5CkdeSeXJkQQZoaSyDbchRpZxps+kIdaQYsKNM0CG3MeovWMgiEerWndyAWDeXbB3xT05wqXizVlDAv8/htGAJkQ7n6S6+Ggz25tO/lASikt6slfKPgnU/ey4U3ZlKDS/HK7tKMwXz0A86IuTiPqyyfbuOkehxmVSuUnV51UKG03j37T7CuLf1nlyHDOrSJEZM4Yn8eI4j/vzV7l97o2IX1esmO8Jc7rSMGRbwN6l/t9E823ZjWnfMXv3Fy7Y9Ch3XZPyrQMLTsAsiCXu6od0GS4v1zH7VoVlD1PwmiOs86E1nANOvItPxTpkFzO1O2v0XIonE84RJP3a1/4hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qsIWPT9WDjEvu3Aq4Cc0UHAv0xFUY0brzLwai+P/4VA=;
 b=JA1YBiqtbdpcGYTg7E87tpUO3E4s+11ajqDvfp3wxhMHohNnZ3lLlmTR199U3OvsWPgZUEYW1tllucIis6tpnolkKRpB2ZVO6o/fRZKs3/mle7qAu9xAQH5X7y1MdMREfT1hmq1JyK5y4i/JoQ4oGJXihYRi1LsWvl/j3k92qHeOeTJXyvXnTRu3vPR3C7WaWTppoo9FN7Ho6KxwB2H9up2BNBwUZHERt/4grV2Iiye15Br69F5Iiu7eYppdyOzacL1pua/Nw2mMH1erHPFYA5mGxsRYjb9VtkRXykpQwCRCLh1qMW0p5O2vEC/4cPXrxazUFC736WNHDw4OEp06nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qsIWPT9WDjEvu3Aq4Cc0UHAv0xFUY0brzLwai+P/4VA=;
 b=yHYc/6kOqR9ZsOyWyDsw30dDBSyT7EhuDvRdbw/for7kdCxnmnVt+IMRTDs1Rf9mgjNlVh4eup4+R+BTI9ZoE3AETkBv7LOtBw45oSMM0VfQxvzlhcf/Cujyr43UM/YnjDnjEH4C0o2eB5SHmpYTIzYW1+HCdyTcIDWR9SRtDg0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <8941cf0c-fac4-4406-b2b5-429a55c1d088@amd.com>
Date: Mon, 22 Dec 2025 17:11:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] console/consoleio: account for xen serial input
 focus during write
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Victor Lira <victorm.lira@amd.com>
References: <20251204233211.980862-1-grygorii_strashko@epam.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20251204233211.980862-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E8:EE_|LV8PR12MB9134:EE_
X-MS-Office365-Filtering-Correlation-Id: 328cd818-9ea6-4f98-fe27-08de41a7c6fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MkhUVGk0dXorbTFqTHpzR2RqelF6NE8xTEp1Zk1WZkZVN3RGVlE3WHY2Uk1P?=
 =?utf-8?B?M0pXS3dwNzlEUk8wVUY5bHZuMFNTeHhEcTBCMDViQ2xmN1BYWWdFVnJDUkk3?=
 =?utf-8?B?M3h3cnRMcWc0Vks1SjA5Q1Fha2VwWXEzcElkSmg5RUZMKzVYekJPdlFYbklE?=
 =?utf-8?B?dkN5c0h4U21UVXpPZWI1UnhoSzhmdnhSeGN3WVFSanVEOTFPZjZsUzhOQm1q?=
 =?utf-8?B?MzlHSW4yOUJpK05XUEtOVUdYdU94S0VzSGRqWFpDaHFBeit4V1dSUnpsaTJC?=
 =?utf-8?B?WExzSUg1MXJCSERnL1A0YkU2azdua0tvS1YzaFdoSjFHV1o5dnlQemNWWENS?=
 =?utf-8?B?c0lZWEJuWEtld291QStXR0xaTmlRSi9ySkVoT2JpakI1Q3hXcDBtT1ViQ25U?=
 =?utf-8?B?VGQ0anVucTZiR2lwU2hUemFISmRtVURzTGJaTHE1TVNaOHladDJJdXAyK0Er?=
 =?utf-8?B?Ykdob1g1Tis4elh5V0hqeDZZd0dkckxGVlVvSjVrbmJsM2RGT2ZraU1NdzZj?=
 =?utf-8?B?OXdiSGU4Z3V3MWdIR01NS0RXNkJEREVjMGNpTHRwNy9qT3NwLzZzVkxNY3ow?=
 =?utf-8?B?Nmh5N3o4QVp4emp5TXVoN0QyQ2ZYU0xXdjliaGhBTjgxU3NReU1JY3RYcEUr?=
 =?utf-8?B?TlIzOHFLZnFqTDRZQzd1NHQ5L1pFajlWMm9ycTl2Yk9CMFczRU1ndXF3aWp5?=
 =?utf-8?B?d1B4WmxseUFaZEZZdHNtZVlxVzNiblBDbFBmVThFV1VLSkVnN3pkOTRIOXZk?=
 =?utf-8?B?STlaMFIrQ2FlVFg3OUpLdG5NVjdIeElzU01TWENVdXB6SDhCVHRpcWNPVW8r?=
 =?utf-8?B?OUNkLy94QjdYd2VDUVVUZ1ZoenBudmoxZGdNUWk2NktzSWYzc09pcjQ5bndj?=
 =?utf-8?B?NS9xY2pGWk51QkR2SFRyai95ZFpCOFR6aXYxRFFtQzU2VW9IWFFnOFFmK2ZN?=
 =?utf-8?B?TG5uMUI5R3VpcjFIcTNneE02SmpPbG1CY0xmR2V1UmFIa29mbnZtVk9FZlht?=
 =?utf-8?B?SDhPOU02UjZzNHpDdnoyQVBxZFB1UU55VkNOOWp1VmcxbGVVaVlTcE12UHB4?=
 =?utf-8?B?RzRBR2RpUTZ3VzVjMkF6d1prNDluU3BOdnJJOTkwYXdnU29aeGtwcEwvQW55?=
 =?utf-8?B?Z1U2TGJjOXlXMXhUYUVGcys2bmh0cHlPTGNqOGVscEtRWjJRYzVhOWRvUEtJ?=
 =?utf-8?B?V0E4MWVnbW05d2ZvKzZneE1tWUdEUWFrWDVkZDN3KzVpNWx0UzVWT29ibG0z?=
 =?utf-8?B?ajNHMkwxSkJLWTM5eE4zaDZLNUZnV21aeExnNm9raFJtdTBRZGNHcWdsOWVm?=
 =?utf-8?B?QnROdDVOL3BlNzlQZ3JFY1JVbFRSSmNHNUhXZFN0ei9ZdVBjQ3M3TmVXMytY?=
 =?utf-8?B?SEk4dGlTczV1V2w5ZVJJU3lYREFQQm1pREJJQlBpVnBmUVAwR1BXMFdHd2tk?=
 =?utf-8?B?Z0xFZGMxTytMeHhuOERGWmtiZ2dDTi9GNGpBNXYvQWtRYlRaYTF3ZW1lRTJS?=
 =?utf-8?B?MVovRUJiamxlek9oNFhoMW1yZUsyQ29vbGJRRVVjaXlSQTFoZDl1YWxCanls?=
 =?utf-8?B?TTNUVGwwTUY2RUg2NXJESnJoNEowZzBYR292emNLVFN6Wkp4K2xtK0pWdWky?=
 =?utf-8?B?U3A2OEVVeFV3eERBMkZkL05yR3ovRmkvbHBHTWJWT1k5K3RjcGdFcXNjNHdK?=
 =?utf-8?B?Smd2bEFpd3FvaU5WMVV4ck5OTDVDRUZvRnduazdOTGFmNVZiL0o2Uitjczhh?=
 =?utf-8?B?TTMyekpVRkU5eFJPMjlGOXFKV2IyNlRGTFg4aE1zcFZzMFVMRVVBbnZkNHdv?=
 =?utf-8?B?c1VLUk9kRXNyOFVReVoxVkg1ZkRHek1nMnNERzF4NXlITU1aeWdFaWh5MXB1?=
 =?utf-8?B?WTNXTTJUc1hDTmM1TC96M2dFK05lSS9NVnN0RklhTXJwREZYdG5NVlJEZ3ln?=
 =?utf-8?B?TkNiUUl1SEZOTUVmcnErc2tNUnVRdDhmcFJkcmFEUkwrSTF2cDVIRmNiSjNT?=
 =?utf-8?B?bDZtWWlsWGovbHpFOUNua2hPVGpBK0pZaXo4VTRlQlp4WE80YzBNWFJuNURM?=
 =?utf-8?B?akpkT2dwdnc2MjQ0UzhqMTNkeGhRTkVoOXlRL0dkbWEyR3E0aUwrTlhVNmJN?=
 =?utf-8?Q?kkAo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 22:16:38.5796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 328cd818-9ea6-4f98-fe27-08de41a7c6fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9134

On 2025-12-04 18:32, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> When 2 or more domains are created and:
> - one is hwdom with "hvc0" (console_io) console
> - other DomUs with vpl011 or "hvc0" (console_io) console
> console output from hwdom may mix with output from other domains.
> 
> Example:
> [    2.288816] Key type id_legacy registered
> [    2.291894] n(XEN) DOM1: [    1.016950] DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
> fs4filelayout_init: NFSv4 File Layout Driver Registering...
> (XEN) DOM1: [    1.018846] audit: initializing netlink subsys (disabled)
> 
> This happens because for hwdom the console output is produced by domain and
> handled by Xen as stream of chars, which can be interrupted when hwdom is
> scheduled out and so, cause console output mix.
> The Xen consoleio code trying to mimic serial HW behavior for hwdom
> unconditionally by sending available data to serial HW on arrival.
> Xen consoleio code does not account for Xen console input focus, comparing
> to emulated serial hw, like vpl011, which does the same for domain with
> active Xen console input focus only.
> 
> Switching console input focus to Xen improves situation, but not enough.
> 
> This patch changes consoleio code to account for domain with active Xen
> console input focus - console output will be sent directly to serial HW
> only if domain has active Xen console input focus. For other domains -
> console output will be buffered and sync on per-line basis.
> 
> Example output:
> (d2) [    4.263417] Key type id_legacy registered
> (XEN) DOM1: [    4.658080] Advanced Linux Sound Architecture Driver Initialized.
> (d2) [    4.277824] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
> This causes random multi-domain tests failures due to inter-domain console
> mixing which breaks console parsing checks.

Part of the motivation here is that in a downstream, I've enabled domUs 
to use the consoleio hypercalls with Hyperlunch to remove dependency on 
xenconsoled.  Grygorii can confirm if it also affects ARM sometimes.

> 
>   xen/drivers/char/console.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index a99605103552..391cefc1a7c6 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -733,6 +733,8 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
>   
>       while ( count > 0 )
>       {
> +        struct domain *input;
> +
>           if ( kcount && hypercall_preempt_check() )
>               return hypercall_create_continuation(
>                   __HYPERVISOR_console_io, "iih",
> @@ -742,7 +744,9 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
>           if ( copy_from_guest(kbuf, buffer, kcount) )
>               return -EFAULT;
>   
> -        if ( is_hardware_domain(cd) )
> +        input = console_get_domain();
> +

Maybe remove this blank line?

> +        if ( cd == input )
>           {
>               /* Use direct console output as it could be interactive */
>               nrspin_lock_irq(&console_lock);
> @@ -783,6 +787,8 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,

In between the hunks is:
     guest_printk(cd, XENLOG_G_DEBUG "%s%s\n", cons->buf, kbuf);

So a background dom0 would get a d0 prefix and print at debug level.

For ARM, vpl011_write_data_xen() does:

if ( d == input )
     printk("%s", intf->out);
else
     printk("DOM%u: %s", d->domain_id, intf->out);

I think d0: is okay for background printing, but we'd need to up the log 
level for at least hardware domain.  Maybe we want a properly to control 
the level for each domain?

I think the changes made in this patch make sense.

Thanks,
Jason

>               spin_unlock(&cons->lock);
>           }
>   
> +        console_put_domain(input);
> +
>           guest_handle_add_offset(buffer, kcount);
>           count -= kcount;
>       }


