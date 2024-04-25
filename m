Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5268B1B71
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 09:07:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711842.1112114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rztBU-0002Dc-Ii; Thu, 25 Apr 2024 07:06:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711842.1112114; Thu, 25 Apr 2024 07:06:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rztBU-0002C2-G4; Thu, 25 Apr 2024 07:06:20 +0000
Received: by outflank-mailman (input) for mailman id 711842;
 Thu, 25 Apr 2024 07:06:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HNrt=L6=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rztBT-0002Bw-0t
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 07:06:19 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f0df3d5-02d2-11ef-909a-e314d9c70b13;
 Thu, 25 Apr 2024 09:06:17 +0200 (CEST)
Received: from BN1PR14CA0018.namprd14.prod.outlook.com (2603:10b6:408:e3::23)
 by DM6PR12MB4219.namprd12.prod.outlook.com (2603:10b6:5:217::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.24; Thu, 25 Apr
 2024 07:06:14 +0000
Received: from BN1PEPF00004687.namprd05.prod.outlook.com
 (2603:10b6:408:e3:cafe::54) by BN1PR14CA0018.outlook.office365.com
 (2603:10b6:408:e3::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.34 via Frontend
 Transport; Thu, 25 Apr 2024 07:06:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004687.mail.protection.outlook.com (10.167.243.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Thu, 25 Apr 2024 07:06:14 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 25 Apr
 2024 02:06:13 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 25 Apr
 2024 02:06:13 -0500
Received: from [172.31.124.47] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 25 Apr 2024 02:06:12 -0500
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
X-Inumbo-ID: 4f0df3d5-02d2-11ef-909a-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NKsLMbvdfrybg9RYuL9VBoKlx89SwztLebzQrrkpMRRF6mouRGptBekeAtAZ3Mq2BllEsVXTGk+jh7jnoIB9RlI/NLY2aHaLOB8wmA1e8RpdUjQlVtvZMABr9yB9AuDRAjaoGHin4QLztGBmDjNfEjmg2GvnMbOWsDAaKa5NcW0H1wV7IIBM55AHhXSXuEb/D4rkuAdvM8/c8osG9mPfX/+Mls7t8BLc9JuLbETJf2KynrlsAVLJssPDRlhxEBf5wwdF+NbW2Cl/yObTNpeGgCO+deFJrXa4Jew2S2kuUWaajPCiHu31iuve8kC71QTHpOx31VUqR3ViwgjxMbcAxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PXjGL7lJXT02xBwDMDKp3kG74nEPKvDE5g07BoIyiDM=;
 b=AKTTwG22vZhzVjQvDWuRktidZm/QVa+6I+6YsrPnxhFke+Snm3Qn7Fjp4by5wi9VtJ9YCMqO/g1aO+b0yWwR8PsE8z6cL67Y3k2RPHjYqdWypvNr0e6p1MyCMiSKG4QO1xFRFUMwS1YcXlDRE/QXgOVlR5jnm+ksu/F/FRjHnOs5C0pO2MqanI2qfqNw/Xn2Y/4clmdgXdlQYx2+7ApZ60f5CsIwdf3J8VSsxvkhvT15NRDKXA2VkWD1c/55t9uaTZ09gFkZXiGj60pnuqbINYr+BkgolOa+vAxne3Z3Gkr2egDP/MCfKMxEAIuUAZipFlaA3dhhEPZgdCduCoq8Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXjGL7lJXT02xBwDMDKp3kG74nEPKvDE5g07BoIyiDM=;
 b=g5ndjRaktQV+eX8t7V+PNU7NKodBFpxMAgvchFe++BdbPeo0iq0xMZH3wzG7oyLQpGTLvnaem7OStx5xl07MjZp0UyTz2V7yeqQQqDeRSAXP7VhEJl8ymm0cqnRCQo3gbg58oRyiFm8yYEGy8mKrR5q306cg1d2VQVJfhsIjlYY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <11f711a6-e6b2-495c-a16c-98dd3d8b4f28@amd.com>
Date: Thu, 25 Apr 2024 15:06:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/15] add a domU script to fetch overlays and applying
 them to linux
To: Jan Beulich <jbeulich@suse.com>
CC: Anthony PERARD <anthony.perard@citrix.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, <xen-devel@lists.xenproject.org>
References: <20240424033449.168398-1-xin.wang2@amd.com>
 <20240424033449.168398-15-xin.wang2@amd.com>
 <bc2aab70-08c5-4dfe-91ab-c1c24163cd46@suse.com>
 <8071fb8c-4df8-4905-b203-cc1119038675@amd.com>
 <adc3564e-3049-4239-9994-b6d59ac3d9fb@suse.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <adc3564e-3049-4239-9994-b6d59ac3d9fb@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004687:EE_|DM6PR12MB4219:EE_
X-MS-Office365-Filtering-Correlation-Id: a532ce62-ec3e-44db-413e-08dc64f631ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|1800799015|82310400014|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YVdQMDhWUFVmaW0rcVJXcWRlRHJiNkpIMUNZenprRVFPQ2dxVUp4a0wvSWkr?=
 =?utf-8?B?ZXd1dm1JMUk4dEtsL1c5amRXQzhGanRQWUdMZ2EzU1MxbnJTVnpXRnpFWFVF?=
 =?utf-8?B?Z1B5MVFYRFU4Y0Q3amNjQzZsMjhjeVE2ZU4vc1JMWGpxc3kvYk1zVjRNdTAr?=
 =?utf-8?B?anlCUVFGa0ZmQzhmQkw1dFgyRWxBVXF5VkxQVXR4UzV1VnpIODMwYVRsQzRX?=
 =?utf-8?B?QlNxdWZaZXRCRkhnQjlDTUFZQ1p4ampxMGRVSnZneE9ZajNsS01RUnhHZkNR?=
 =?utf-8?B?MHdyY2t2ZncvSVNqU2tEM1VzRHMrZXFtb1c4dmFsYjRaMWM5eVkzaDlRamJx?=
 =?utf-8?B?dWN1blNwdmE0WUNYeTdsdE5ncWFLR0R0dHExNnVYZUFsV1R6ZEptM0d0UDJ0?=
 =?utf-8?B?ZGF4NTAwY1l2ZHdMdzVjMlNwT3dtT1hUS01zL0Y1L2lFSG5jdkRGYzZ0Q1Iv?=
 =?utf-8?B?ZjM1R2dGaHIvRjNsSkxJajNCM0dhbHBkT1d4WWlIVFN3elRraHBXUVZzRDM5?=
 =?utf-8?B?TDFtUy9LTGlOdld4SUxsQ2c3TTNCQ2VzNWU4T3g0a28zMTk1eFJQMU9uMjVi?=
 =?utf-8?B?SGZUT0NoUmwyaDVnV1l2R09INFdOMEVtN2xIcmVSQWtkb2RWaCtBd1pQUm9n?=
 =?utf-8?B?NGVtZzB5N0hzbTdaZ2w2K2ZvMEVZUSsxRFRHMUUxZ1ZHZFdBVlJBanFDQi9l?=
 =?utf-8?B?Tlp2SGl0QUoxa2RmckNkdHZrTWpITXdlN2FNRW40WEpjNXVueWxiYkVzVVA1?=
 =?utf-8?B?Z01VNFFvRVA2R2tRYUI5UmVMRWdBWDJHck5CRUM1RlZxVTh1SVR4TFhpbVlN?=
 =?utf-8?B?bktOczdBSWtKSlcrdVlwdlRqTVlGNE1XRUhPRzgyTWhRSW9vaEpwbU1WNWxq?=
 =?utf-8?B?WmFjdmVGZTl3bU5wUUF6eTk3Smh0eFZuTEJBOGpYaDhsZEsxSFp6R0JLeXVK?=
 =?utf-8?B?LzdHMmIvd0t1Ylh6RU5aZUY5VnQ3alI1cHpXRy9UNC82MVhzL3pYOE5IVkg5?=
 =?utf-8?B?ZzFiZk10Wmk2Mk9ucnB4WkJ0QUZpVzYyNUZBK3gwYXIxd1UzM0RDZTRJcnhD?=
 =?utf-8?B?aGx5dDFZZWEwZXZHZ25qbnN0SGs1dlAwVEluUkdYeWcxNlhQTWFSSDBTTEw1?=
 =?utf-8?B?OWlHQ09TWnJMUVVGUWFoSURsc0pRd0h4YitpQlBFekZBdk1XOXZQNDFLdUNY?=
 =?utf-8?B?QVhVSDdicjVZd3YwalZaVTBaRTBERmhCSE5uMVcrUG5FU2xRZ1NRL3lFL0c5?=
 =?utf-8?B?QnVFK3hTSmdHb1hTbWxGVGpPSVNZM2p2M3RzNjg5TkY1SHA5T1F5ZUZoK3p5?=
 =?utf-8?B?S2RCNjJvWWhsYXpLL2ZjVDBncnFwL3c1L3RUQ0NoNVdJSHUzeWtCRktlZlV4?=
 =?utf-8?B?K2hoc0JuZ2JPT1krVEZ1WFl6RGw2djZLUG5HNldKSXRFYTM0TzNZSmEwSmhU?=
 =?utf-8?B?VUZJRys4WUJoWDNjcFpiYmZWdml1cmp1VGpScWp4b2l0ejJxQ0MyT29zVEx3?=
 =?utf-8?B?TGJEaE5XRitFeGxMZUNFaFVuNEQ0Zk9qRXpjRVJvaUlnejJ3cG95bkpGbDJn?=
 =?utf-8?B?YVNKTStHeG1KYTZaNDBlZXFNWnA2RU5XSFBmTW05N0Z1Mm1IV1pZS2dIMTlX?=
 =?utf-8?B?TjhTS0FFc2Jnek1DYW04YVpUbWw4R3NUZUlURldHd0tIT2VkZktxS0RHdVVP?=
 =?utf-8?B?K2dSbnBiNzA1ekFUai83Nk1pYjBLTDJvdXBVU2xzL2xrSm1TMWdTNmJxbVcz?=
 =?utf-8?B?ek4rS1JoVVB4bWtRSi9qMnZGOXhpQkJmdlBRaVVNaFFqZjBVbTBEcHNIOVBr?=
 =?utf-8?B?YlVjZHh5eHFtUzhVc3E1SG5XeVJlTHhPMk9YOGZWaHZ0V0MrY1FlRTcwOFBN?=
 =?utf-8?Q?kkBwIneg9umtA?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(1800799015)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 07:06:14.1598
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a532ce62-ec3e-44db-413e-08dc64f631ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004687.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4219

Hi Jan,

On 4/25/2024 2:46 PM, Jan Beulich wrote:
> On 25.04.2024 02:54, Henry Wang wrote:
>> On 4/24/2024 2:16 PM, Jan Beulich wrote:
>>> On 24.04.2024 05:34, Henry Wang wrote:
>>>> From: Vikram Garhwal <fnu.vikram@xilinx.com>
>>>>
>>>> Introduce a shell script that runs in the background and calls
>>>> get_overlay to retrive overlays and add them (or remove them) to Linux
>>>> device tree (running as a domU).
>>>>
>>>> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
>>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>>> Signed-off-by: Henry Wang <xin.wang2@amd.com>
>>>> ---
>>>>    tools/helpers/Makefile       |  2 +-
>>>>    tools/helpers/get_overlay.sh | 81 ++++++++++++++++++++++++++++++++++++
>>>>    2 files changed, 82 insertions(+), 1 deletion(-)
>>>>    create mode 100755 tools/helpers/get_overlay.sh
>>> Besides the same naming issue as in the earlier patch, the script also
>>> looks very Linux-ish. Yet ...
>> I will fix the naming issue in v2. Would you mind elaborating a bit more
>> about the "Linux-ish" concern? I guess this is because the original use
>> case is on Linux, should I do anything about this?
> Well, the script won't work on other than Linux, will it? Therefore ...
>
>>>> --- a/tools/helpers/Makefile
>>>> +++ b/tools/helpers/Makefile
>>>> @@ -58,7 +58,6 @@ init-dom0less: $(INIT_DOM0LESS_OBJS)
>>>>    get_overlay: $(SHARE_OVERLAY_OBJS)
>>>>    	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenvchan) $(LDLIBS_libxenstore) $(LDLIBS_libxenctrl) $(LDLIBS_libxengnttab) $(APPEND_LDFLAGS)
>>>>    
>>>> -
>>>>    .PHONY: install
>>>>    install: all
>>>>    	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
>>>> @@ -67,6 +66,7 @@ install: all
>>>>    .PHONY: uninstall
>>>>    uninstall:
>>>>    	for i in $(TARGETS); do rm -f $(DESTDIR)$(LIBEXEC_BIN)/$$i; done
>>>> +	$(RM) $(DESTDIR)$(LIBEXEC_BIN)/get_overlay.sh
>>>>    
>>>>    .PHONY: clean
>>>>    clean:
>>> ... you touching only the uninstall target, it's not even clear to me
>>> how (and under what conditions) the script is going to make it into
>>> $(DESTDIR)$(LIBEXEC_BIN)/. Did you mean to add to $(TARGETS), perhaps,
>>> alongside the earlier added get-overlay binary?
> ... it first of needs to become clear under what conditions it is actually
> going to be installed.
>
>> You are right, I think the get-overlay binary and this script should be
>> installed if DTB overlay is supported. Checking the code, I found
>> LIBXL_HAVE_DT_OVERLAY which can indicate if we have this feature
>> supported in libxl. Do you think it is a good idea to use it to install
>> these two files in Makefile? Thanks.
> Counter question: If it's not going to be installed, how are people going
> to make use of it? If the script is intended for manual use only, I think
> that would want saying in the description. Yet then I couldn't see why
> the uninstall goal would need modifying.

Checking the code again, I feel like this is a mistake actually. I think 
this script should be installed together with the get-overlay 
application as the script actually calls get-overlay. The uninstall goal 
should remain untouched. I will fix this in v2.

> As to LIBXL_HAVE_DT_OVERLAY - that's not accessible from a Makefile, I
> guess?

Yes.

Kind regards,
Henry

>
> Jan


