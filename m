Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E011E7BB7D7
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 14:38:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613568.954168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qok6M-0000ei-Iw; Fri, 06 Oct 2023 12:38:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613568.954168; Fri, 06 Oct 2023 12:38:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qok6M-0000cR-G6; Fri, 06 Oct 2023 12:38:42 +0000
Received: by outflank-mailman (input) for mailman id 613568;
 Fri, 06 Oct 2023 12:38:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5b7L=FU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qok6L-0000cL-Gw
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 12:38:41 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7e88::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45ea4020-6445-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 14:38:38 +0200 (CEST)
Received: from CH2PR03CA0028.namprd03.prod.outlook.com (2603:10b6:610:59::38)
 by CH2PR12MB4165.namprd12.prod.outlook.com (2603:10b6:610:a4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.38; Fri, 6 Oct
 2023 12:38:33 +0000
Received: from DS2PEPF00003439.namprd02.prod.outlook.com
 (2603:10b6:610:59:cafe::9d) by CH2PR03CA0028.outlook.office365.com
 (2603:10b6:610:59::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.29 via Frontend
 Transport; Fri, 6 Oct 2023 12:38:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003439.mail.protection.outlook.com (10.167.18.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Fri, 6 Oct 2023 12:38:32 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 6 Oct
 2023 07:38:31 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 6 Oct
 2023 07:38:13 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 6 Oct 2023 07:38:11 -0500
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
X-Inumbo-ID: 45ea4020-6445-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cDbKLz+eU98NuM+eE8PcJz1vwJGAXY4s8ZXBoRJ2Hb3Sn1e22r9b8ymuofFm0K9Dos58zJ5ET2sU1tE1LM3RXKhaxJ15hMpZyNakqvFKFej2901vJwswutlei/ZqEr/9P920XE9d9wvqQ4adDDwMUMezoVF12GE515AjwBi0VfekPsLoUsC2mxZBhTE06pZseUUTMT4zB0mfQCUENwc5HUio7GUd45dgB2aHrV3XMp6Cvolsm2tFowGXk4xiPlsRB9L9260YKs4RYkTrCg3sL+1PgAKHdBxlqN8c3fRIsQEPcauPjvVvclHUrT5Ob5xREUDSYYw6bte+s0CVxDqCsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OnovF2ihUuBGtv88M6SFxNgqJn3YmjWQ9awzZ6cApT0=;
 b=ByBnFHTfk2lbmq+qiR3TuGvLWPrcA3mIuoJZIduG23QzbXKWrwxsOhCc/7aV/VUzO5kkiiJK7loFCbQL1ASvPahPnKeco97H0ri/lL1MBnd4KE04ii95FY4sftL8tHfG1qaYcYHd9PxJNuppCSRKtJtjY47MGZ94NOgn0qq7bEhJuYzX+rsmCnFm5EgCZan1B/hg9vEJWhwKGGUqjevkbogVggSudyZrn/+4zXR9iI1dOxXBZDTO4l3MJ1K7BGAamhRBRZOkim5ffWRzk3ouFhe6sdBNVTgdOsCWS8jgORcIQswCk0vGJenjgWOrdltnyxV1/xfO0eBrv8/y+5+w5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OnovF2ihUuBGtv88M6SFxNgqJn3YmjWQ9awzZ6cApT0=;
 b=L7TGFZGpmp+XPi3FUO90Adw+akBRVzJRbHtwzmiu68l/OOxmUU9UdOc/1COyc9XgqZiCGBiA+NSku8SI4+mFDh2g2f2aOfL+2uMcMqkXn1xzs+Ky0uc1dxMbHA9jEqZ5fz/tx9gSnxAqfXR131InDMR0R6MxaCIkY12m7BzchXY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <215ce137-0b0f-4804-b500-548e16f0cca2@amd.com>
Date: Fri, 6 Oct 2023 14:38:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for-4.18][PATCH 2/2] xen/public: arch-arm: Update list of
 supported hypercalls
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, <Henry.Wang@arm.com>
References: <20231006075142.9803-1-michal.orzel@amd.com>
 <20231006075142.9803-3-michal.orzel@amd.com>
 <b9d30cbc-255f-473c-974d-6dd262f22325@xen.org>
 <40878a29-d681-485b-8d58-0187ec586a2b@amd.com>
 <64feb572-6799-4d9c-a66e-94d5828081fd@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <64feb572-6799-4d9c-a66e-94d5828081fd@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003439:EE_|CH2PR12MB4165:EE_
X-MS-Office365-Filtering-Correlation-Id: 040d7c3e-41b3-4a85-2992-08dbc6692685
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xIQLsiVEFouHb4XuPG1QZTAbRTFh6XpbkV3jSviRIBjvpv+MVScZ/vsXKA4UWDetiEq5Yj8Sm8bLa0624ifW8E/FEyygAQ9ZysGucKwKcOSjRhj7Z+NlDTbWRIXq2crS2uFMbmISPl0G+lxSe2c+7TUYmbsv8Q9xmM52pComKCRi2Ks8j5BEIvLU4RrrHTehb6drMKku79P2gZCqoIAs8VpzRzxwH+f5U5myB1+elG0zd6+MHD5EBBXjmnTi1vSE8a3QEyAiWoyKZ1lQ6KCfrOTYAVljfwthiwrSdk0cXVF/q5XlAncrx+qBA82qcqaxF0bHpGn7JVZxQk3IVOIU0dACQi0bF4ME1j/CTOzcVhNIQZ4qMbrjUY2/uok9OYpQlwKt0LnZYvz+N6ddR1DFl/Jva2OOAcrGBOfglltueIg7YvVrSzUCndcE4Y1CV5c9AKBClderJ1YulWARAwStNmBWGU4ZeBrb3gyUOju5jLS42ACiwBXY4ydb1fkV35y+6PLn0KbWuGARsbSeOio+X8RX62uYDTSb2snLOZMDW21XMDnwSd6CTkWmPmI0OQpKNi1kP7KvNDZXFnAiAwTgFQ4fVS2ozwWyvo120uXNrTNbQK36A5jE98oyjxZ/0zgGKpFCq5As3x+LeAECpCIOTR6KQqrlJpWJaAaGVd9Pu9FTuvnYUY4SW7Jgbqe9r91N2Tu1GM7n6S0sM97NfvJyfK4zI/zz4NeMo1Jb+Iy2RXuQCSATNUNMrNSWHOLPckSxd9V7ieWOd2OBZ7Cbo9JdHug96ULRF8ggjSCDG8PhQtxM/8A8wiSGoTcuhvNeUHvf
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(136003)(376002)(346002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(82310400011)(46966006)(40470700004)(36840700001)(40480700001)(40460700003)(31686004)(53546011)(478600001)(82740400003)(36860700001)(86362001)(81166007)(31696002)(356005)(2906002)(15650500001)(47076005)(83380400001)(426003)(336012)(26005)(2616005)(36756003)(70586007)(8676002)(316002)(8936002)(70206006)(54906003)(44832011)(110136005)(5660300002)(4326008)(16576012)(41300700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 12:38:32.2402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 040d7c3e-41b3-4a85-2992-08dbc6692685
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003439.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4165

Hello,

On 06/10/2023 14:31, Julien Grall wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On 06/10/2023 11:20, Michal Orzel wrote:
>> On 06/10/2023 12:11, Julien Grall wrote:
>>>
>>>
>>> Hi Michal,
>>>
>>> On 06/10/2023 08:51, Michal Orzel wrote:
>>>> The list is out of date and does not specify all the hypercalls/sub-ops
>>>> we support, so update it.
>>>>
>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>> ---
>>>>    xen/include/public/arch-arm.h | 21 +++++++++++++++++++++
>>>>    1 file changed, 21 insertions(+)
>>>>
>>>> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
>>>> index 6a4467e8f5d1..263b1e182eb3 100644
>>>> --- a/xen/include/public/arch-arm.h
>>>> +++ b/xen/include/public/arch-arm.h
>>>> @@ -104,6 +104,7 @@
>>>>     *   Exactly these sub-operations are supported:
>>>>     *    * HVMOP_set_param
>>>>     *    * HVMOP_get_param
>>>> + *    * HVMOP_guest_request_vm_event
>>>>     *
>>>>     *  HYPERVISOR_grant_table_op
>>>>     *   All generic sub-operations
>>>> @@ -116,6 +117,26 @@
>>>>     *  HYPERVISOR_argo_op
>>>>     *   All generic sub-operations
>>>>     *
>>>> + *  HYPERVISOR_hypfs_op
>>>> + *   All generic sub-operations
>>>> + *
>>>> + *  HYPERVISOR_platform_op
>>>> + *   Exactly these sub-operations are supported:
>>>> + *    * XENPF_settime64
>>>> + *
>>>> + *  HYPERVISOR_vm_assist
>>>> + *   All generic sub-operations
>>>> + *
>>>> + *  HYPERVISOR_dm_op
>>>> + *   All ioreq server sub-operations are supported as well as:
>>>
>>> I interpret this sentence as all the hypercall with 'ioreq' in their
>>> name is supported. But, for Arm, we at least don't support
>>> XEN_DMOP_map_mem_type_to_ioreq_server.
>> What I meant is that we support all sub-ops from ioreq_server_dm_op (ioreq.c).
>> XEN_DMOP_map_mem_type_to_ioreq_server is only accessible on x86 and not part of ioreq.c
> 
> 
> The header is a public interface and meant to be read by OS developper
> which may not be familiar with the source code. How about listing the
> subops we support?
> 
> This will avoid the developper to go through the source code to find out
> if a sub-op is implemented in ioreq.c or not.
Sure, I fully agree so I will then send a v2 with:
 *  HYPERVISOR_dm_op
 *   Exactly these sub-operations are supported:
 *    * XEN_DMOP_create_ioreq_server
 *    * XEN_DMOP_get_ioreq_server_info
 *    * XEN_DMOP_map_io_range_to_ioreq_server
 *    * XEN_DMOP_unmap_io_range_from_ioreq_server
 *    * XEN_DMOP_set_ioreq_server_state
 *    * XEN_DMOP_destroy_ioreq_server
 *    * XEN_DMOP_set_irq_level
 *    * XEN_DMOP_nr_vcpus

I will also skip x86 patch given that Andrew wants to extend it.

~Michal

