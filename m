Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F84F5A5CA0
	for <lists+xen-devel@lfdr.de>; Tue, 30 Aug 2022 09:12:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394829.634388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSvOp-0003oK-Uk; Tue, 30 Aug 2022 07:11:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394829.634388; Tue, 30 Aug 2022 07:11:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSvOp-0003m8-Rk; Tue, 30 Aug 2022 07:11:03 +0000
Received: by outflank-mailman (input) for mailman id 394829;
 Tue, 30 Aug 2022 07:11:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bSYc=ZC=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oSvOo-0003lz-Ci
 for xen-devel@lists.xenproject.org; Tue, 30 Aug 2022 07:11:02 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e604d2cf-2832-11ed-bd2e-47488cf2e6aa;
 Tue, 30 Aug 2022 09:11:00 +0200 (CEST)
Received: from DM6PR10CA0014.namprd10.prod.outlook.com (2603:10b6:5:60::27) by
 MN0PR12MB6077.namprd12.prod.outlook.com (2603:10b6:208:3cb::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.19; Tue, 30 Aug 2022 07:10:56 +0000
Received: from DM6NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:60:cafe::5e) by DM6PR10CA0014.outlook.office365.com
 (2603:10b6:5:60::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15 via Frontend
 Transport; Tue, 30 Aug 2022 07:10:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT026.mail.protection.outlook.com (10.13.172.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5566.15 via Frontend Transport; Tue, 30 Aug 2022 07:10:56 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 30 Aug
 2022 02:10:53 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 30 Aug
 2022 02:10:42 -0500
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Tue, 30 Aug 2022 02:10:41 -0500
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
X-Inumbo-ID: e604d2cf-2832-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VAlOeHbF62y4YAbcOZuMngzitiiCgtXAd0bEGhvixZZtI7U1i+fHnXlngeIqzVunlaFiM2me457X3R1WUGqk95Luw0UgoZuvaPOXt0jlVf8H/TmnDud4fWf6icQPilRccOkMKyG+AznFlgKH0swnr0cS/HnTP97+3tWaCmCXh26mu7zEbHth8WFNiZe/sMnGWE2LT8plW8TyF6RHXaz/c79HuK4Or+1wATmmuYKIRI5IYCVjdQsu3zXFdfmDcM5JR7ZTt0zgfZkRw7f+qlDf3aWKFT8gchVxck0jpu3WqCYkwckN4ztomGeDbn5uUBYd23BcquZ3GVOorL+lSiyyNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ECVxWzbQf30V0mfSPDDiyEcG2uJMSylwj6gohYM28v0=;
 b=FURrR3sgpwVks212SVAW1ImRxSisQsHOOvMb52F1jmyzUz0z4bSrHMlMU57tk76/6W+PNNcQSCLyND2mnpsKTSgFAKaXKy1dLYkgj08R7PXiQ//HXntXA5TlYrvsLQr1kC/wzLqvpGRLCg4sbDy6DkAdm7G7Rn+S9w02hGtNecfmZ6ALncAdPN/o6UZSFXNYh/bfGcwWUk/T7r6jooU+8xbUfbh6/AJi9ro/CyfZdd+5bRwYtd84tKiCLc+bjKIsmdGt7/juKkoo8rQI7kMyE4jQDFDU+AeAhO7oNo3KS7beWpTwCm31/sVYt8qelweu//oDV2JbCQAjOCO+oNGIVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECVxWzbQf30V0mfSPDDiyEcG2uJMSylwj6gohYM28v0=;
 b=WQpf9RQdMLGe2d5aFkzSJ0iz1qVwjFbrzBCkiSHNZN9mP26f+A8eR7Mw8XJRA5o4xpD17uObnw9UYkcGvkr+AEELomhZe7QIy1vwziu4lp5urw58JBLl9wZs2QXlm7j7iYKfXIMB7fCAxQ+YWiRFvGyMdMzi/StTFvQxDMX3HRw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <9dd32db7-19af-a88c-b09b-fe94828cab93@amd.com>
Date: Tue, 30 Aug 2022 09:10:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 1/2] docs, xen/arm: Introduce reserved heap memory
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
To: Henry Wang <Henry.Wang@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei
 Chen <Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Penny Zheng" <Penny.Zheng@arm.com>
References: <20220824073127.16762-1-Henry.Wang@arm.com>
 <20220824073127.16762-2-Henry.Wang@arm.com>
 <af2f8888-7223-429e-cc7e-b0950f759608@amd.com>
 <AS8PR08MB7991A2A6EF808136FBF090F392729@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2208291745550.1134492@ubuntu-linux-20-04-desktop>
 <AS8PR08MB7991EC7FAD3D1EDBD379D9C892799@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <e02175e4-0930-012e-8e79-d4ac8d3be78b@amd.com>
In-Reply-To: <e02175e4-0930-012e-8e79-d4ac8d3be78b@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03776931-2e5c-4b4f-c849-08da8a56c8bd
X-MS-TrafficTypeDiagnostic: MN0PR12MB6077:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uhiwSpzul4lhNUQs6SQIxmhvWm+zHwlJN4qCGGlfQVIN3MuBvRcLMtUM8TG8BjdXlaiyx+JnD/xf8VvUsnHJoRqdTI089eafIEkPb4TKjqaNSHjbSpx8MIaZttANatlmBzwZeID208muS1PJrnp6rwRUZ0wz9vrsp9vXThdAOyqBsYGhvn/z2F1jpc8PvwH2vZKRxq6vWjU6E8uptgbOGCzDrJvOg52XjvKEXBx8qqcXWmDSj9hZpGaWBYJXtzKLn+eyCf+rVE3T32JuXIRJPf8Rwq6quoBJOmtfrfGnZbTCJu9ZOBnaGapmaSVXglL7I4QFidOnYltWd7mbjc4XPtsiqJljO/Nc0xntmjy8Cl0Qga5vm7IPuZqjuEPCMGHF0Zh3dusViMjMSjyfgaART03cAI36aghBxENDx/mmejv0iZpV7MLkxklnau0ATNpGY3MeHtlPRQUIlrImnzxhLbCWHXNUWS9wToYhelUQn6CQq9WO8/nP4cISYS3Gn0fHLEmUo2KMJMlyrhEb12UIDEqKg1QznglBkVoQcJVaWLfKFsrituzpM6ePlBTyoJ/8Dd6g6HpmEpLPsydD/RhO9RQEqygJImUL+0S4uE9t75aSmtF5d+m76AJ7R4cOrktxR+Ev4nwQkJP7KmkvBDGCN/yUrwNkkHyrzTvnfW4FGpFBisSjVLTi/PfokjKyaqinXPQVNtPB+fD4l1Mgfyj6wGuvNRFTWKm+6t80EB3HKB/SgNwc4ijM0v3IeT9Nv5mjiLOmkITlKmRd/eF2Gl6c1jJzlkwzVBorViW30T7xGzw/PWMBHCbGni6wL9UeHVZLId3s+0Lpyo2QTRf3AKD3rQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(346002)(396003)(376002)(46966006)(40470700004)(36840700001)(31686004)(356005)(36860700001)(81166007)(36756003)(82740400003)(110136005)(4326008)(16576012)(70206006)(44832011)(5660300002)(70586007)(54906003)(82310400005)(8936002)(8676002)(83380400001)(40460700003)(31696002)(26005)(316002)(336012)(40480700001)(186003)(53546011)(2906002)(2616005)(478600001)(426003)(47076005)(41300700001)(86362001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2022 07:10:56.4954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03776931-2e5c-4b4f-c849-08da8a56c8bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6077

On 30/08/2022 08:29, Michal Orzel wrote:
> Hi Henry,
> 
> On 30/08/2022 02:58, Henry Wang wrote:
>>
>> Hi Stefano and Michal,
>>
>>> -----Original Message-----
>>> From: Stefano Stabellini <sstabellini@kernel.org>
>>> Sent: Tuesday, August 30, 2022 8:47 AM
>>> To: Henry Wang <Henry.Wang@arm.com>
>>> Cc: Michal Orzel <michal.orzel@amd.com>; xen-devel@lists.xenproject.org;
>>> Stefano Stabellini <sstabellini@kernel.org>; Julien Grall <julien@xen.org>;
>>> Bertrand Marquis <Bertrand.Marquis@arm.com>; Wei Chen
>>> <Wei.Chen@arm.com>; Volodymyr Babchuk
>>> <Volodymyr_Babchuk@epam.com>; Penny Zheng <Penny.Zheng@arm.com>
>>> Subject: RE: [PATCH 1/2] docs, xen/arm: Introduce reserved heap memory
>>>
>>> On Thu, 25 Aug 2022, Henry Wang wrote:
>>>>>>                                         const char *name,
>>>>>>                                         u32 address_cells, u32 size_cells)
>>>>>>  {
>>>>>> @@ -301,16 +303,40 @@ static void __init process_chosen_node(const
>>>>> void *fdt, int node,
>>>>>>      paddr_t start, end;
>>>>>>      int len;
>>>>>>
>>>>>> +    if ( fdt_get_property(fdt, node, "xen,static-mem", NULL) )
>>>>>> +    {
>>>>>> +        u32 address_cells = device_tree_get_u32(fdt, node,
>>>>>> +                                                "#xen,static-mem-address-cells",
>>>>>> +                                                0);
>>>>>> +        u32 size_cells = device_tree_get_u32(fdt, node,
>>>>>> +                                             "#xen,static-mem-size-cells", 0);
>>>>>> +        int rc;
>>>>>> +
>>>>>> +        printk("Checking for reserved heap in /chosen\n");
>>>>>> +        if ( address_cells < 1 || size_cells < 1 )
>>>>> address_cells and size_cells cannot be negative so you could just check if
>>>>> there are 0.
>>>>
>>>> In bootfdt.c function device_tree_get_meminfo(), the address and size cells
>>>> are checked using <1 instead of =0. I agree they cannot be negative, but I
>>> am
>>>> not very sure if there were other reasons to do the "<1" check in
>>>> device_tree_get_meminfo(). Are you fine with we don't keep the
>>> consistency
>>>> here?
>>>
>>> I would keep the < 1 check but it doesn't make much difference either
>>> way
>>
>> I also would prefer to keep these two places consistent and I agree Michal is
>> making a good point.
> I'm ok with that so let's keep the consistency.
Actually, why do we want to duplicate exactly the same check in process_chosen_node that is already
present in device_tree_get_meminfo? There is no need for that so just remove it from process_chosen_node.

> 
>>
>> Kind regards,
>> Henry
>>
> 
> ~Michal

