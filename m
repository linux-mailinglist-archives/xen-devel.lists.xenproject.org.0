Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 856716E3D53
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 04:09:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521714.810518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poEIr-0005vW-5K; Mon, 17 Apr 2023 02:09:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521714.810518; Mon, 17 Apr 2023 02:09:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poEIr-0005sC-1u; Mon, 17 Apr 2023 02:09:13 +0000
Received: by outflank-mailman (input) for mailman id 521714;
 Mon, 17 Apr 2023 02:09:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nDUx=AI=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1poEIp-0005s6-OF
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 02:09:11 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20605.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5dc9e91-dcc4-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 04:09:09 +0200 (CEST)
Received: from DM6PR21CA0023.namprd21.prod.outlook.com (2603:10b6:5:174::33)
 by CH3PR12MB8994.namprd12.prod.outlook.com (2603:10b6:610:171::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 02:09:04 +0000
Received: from DM6NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:174:cafe::7d) by DM6PR21CA0023.outlook.office365.com
 (2603:10b6:5:174::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.1 via Frontend
 Transport; Mon, 17 Apr 2023 02:09:04 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT004.mail.protection.outlook.com (10.13.172.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6319.17 via Frontend Transport; Mon, 17 Apr 2023 02:09:03 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 16 Apr
 2023 21:09:03 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 16 Apr
 2023 21:09:03 -0500
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Sun, 16 Apr 2023 21:09:01 -0500
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
X-Inumbo-ID: d5dc9e91-dcc4-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CcsjSlD7LX4uFfsrzEa5N+uB3KTNt3QpX+FAiI6i9VRRS7xEwD7XC8iA7tbhNXD4bGh9WRTV+VMSsbsBAOxlR6veUym71oUYFtMPoG8Qdc7NTeTu14FeqzX+sah3qe55uh+cgUKod3E0JhMsZq9h1zzz4d8EjmechdtORHiYSWtYjl8+EVI+ro3zLdHBNYhz3XZ6v+MNjJj5Sq1JZDPITygo6gBVjeMkIitDTU5ie5QwZg9rZEnp08xv7ajO+y7Iub/OBCYo+bEtU8935AyXCT5r+ApLRBXDJuriAGCjGeCq4Zh6d3h0CXhT2QdEHrgxHLJkE4/eGjHY3N7CIXOqCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mt+pcXhEBYCYbjFfwCuuM/w86R2K52bxIB0y1/nzKsI=;
 b=UyGjzJWszHnwpngIrdzeVQXMfv3PrmxIyZp8XCJSAI11UNZ3gC829Obj067werdtTzxPVKCB6AUovMRnOIHRUVGnl3vGG4Y1un4LTpGWU893QDzCWbEdzGUxYc4Aj7plazF93wog+FokF75RpfzYLW4VnVFjHiEgBTbGyfVFQFdDgJqGhbLAb/VbDCYbvHqjmAwVU9NqdffaAfvUhyuU+znn8ZjNSBLtqfGOScDfb+pFEsh3R0bFb6c0wbTBzrmQM5tcywJfk2x9kE8kz+rz4dfdNS/Wfpib/xW3HvtVLPHlrY5lmE3WPmutiq5Epk9Gl5MsWKa3Qa1OnfCtGpBWeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mt+pcXhEBYCYbjFfwCuuM/w86R2K52bxIB0y1/nzKsI=;
 b=vu66MG++HG7z1p0RQVzPEo+Lh93N9h01NpTBwNvSkiuzDMWaNKIcSZl3KSMSMRAq4zcd5j0YjDf2G0WeHyADnwAALQezUfBBAxE2yBVp4ll02EU6TxiGnJ5+3OsqaT2eW2zDM1sGSSZ1wQ+4L5n3La1TXNW9dBuhTAZATRMjHFU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <b779a5cf-1421-086b-f7f3-188fcb9af3db@amd.com>
Date: Sun, 16 Apr 2023 22:08:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/3] xen/arm: fix unitialized use warning
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230414185714.292881-1-stewart.hildebrand@amd.com>
 <20230414185714.292881-4-stewart.hildebrand@amd.com>
 <5fb567c5-1e82-a048-1cfe-f6f69e0b5ebc@xen.org>
 <3833c906-8d88-d35d-b9dd-b70d5f7a9fa7@amd.com>
In-Reply-To: <3833c906-8d88-d35d-b9dd-b70d5f7a9fa7@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT004:EE_|CH3PR12MB8994:EE_
X-MS-Office365-Filtering-Correlation-Id: ae44a865-8572-42b0-b33a-08db3ee8b7cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	up8bxXglL6G1Q10kjkRndJQwrUoRzEzs+eGAXBMQQjfg46TPagPnksRLaKXEefR/YCy3+FI+mcVrT9Cg0bRaLYOrYu7f6X4c008VXHCmjCNNhB7XSJ5w8o9UWPP6xF/+S24iP0ClX+8WqnAEVWp0ckoLf/Y7UIxPcAR5PU6DnTwu37/q9aBkABBg4X+ldZYWjBoHWOM5tBy/MC20OmaiR5d8ExRF5dWB5IOThO4XB8MXxDGI+3wxrH2oacef1PoBP9MwthoAX41idDIBe9abJdYK5oDFZBWFrfkbOEDQnX5FbFKniqtjxZf5roSEJY0G294CsjJG7w8zcjKTxbaP2YCJdTCqZnAnKjHyzTFyn0OEC29ChgfH7LQ6XnO7Vz+g5wvayBimG3S6cyIQoopIV1OgbxMDfzf78LSE+qrcQVl4LYuQjM/vgFYaJFla5wLEBkZSq/4l3tBAD83I90ocYDyiKnvDjilkRMomTB1uEKAwpoyBqL6Vrd6kXI3iL6h10qFoYN1MIY3OX7gBnXYD1BEOrphXWWMckpvGCWx5b87ifgCD7JJufDDhTShly92nHmLFuDAmRiHm1pC2Uf9zCqgJ7t3lmt39kbgTtawI3tvl+RvM/bpA/X3ooN6UyKL+MCUGfGSHTNAJkGIcfyanuUPN3X8mGt+WE877Ps0ijpgRJGWaAVOsnd0AqTaNKhod61ZtU/9xYOK/zggCQTQ4z0L3dItnu5QL9OAPIbUCdyqdvM7ecjw6b4azr/5DVZ/u
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(376002)(39860400002)(451199021)(36840700001)(40470700004)(46966006)(86362001)(31696002)(426003)(336012)(83380400001)(36756003)(53546011)(26005)(47076005)(82310400005)(186003)(40460700003)(2906002)(31686004)(44832011)(2616005)(36860700001)(966005)(16576012)(5660300002)(6666004)(8936002)(8676002)(478600001)(54906003)(81166007)(356005)(110136005)(41300700001)(82740400003)(316002)(70206006)(40480700001)(70586007)(4326008)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 02:09:03.9256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae44a865-8572-42b0-b33a-08db3ee8b7cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8994

On 4/16/23 22:03, Stewart Hildebrand wrote:
> On 4/16/23 08:53, Julien Grall wrote:
>> Hi Stewart,
> 
> Hi Julien,
> 
>> On 14/04/2023 19:57, Stewart Hildebrand wrote:
>>> When building the hypervisor with -Og, we encounter the following error:
>>
>> Is this with GCC 12 as well?
> 
> Yes. If my memory serves me correctly this particular one occurs with both GCC 11 and 12.
> 
>>> arch/arm/domain_build.c: In function ‘make_cpus_node’:
>>> arch/arm/domain_build.c:2040:12: error: ‘clock_valid’ may be used uninitialized [-Werror=maybe-uninitialized]
>>>   2040 |         if ( clock_valid )
>>>        |            ^
>>> arch/arm/domain_build.c:1947:10: note: ‘clock_valid’ was declared here
>>>   1947 |     bool clock_valid;
>>>        |          ^~~~~~~~~~~
>>> cc1: all warnings being treated as errors
>>>
>>> Fix it by initializing the variable.
>>>
>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>> ---
>>> See previous discussion here
>>> https://lists.xenproject.org/archives/html/xen-devel/2022-10/msg00741.html
>>> ---
>>>   xen/arch/arm/domain_build.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index 4f9d4f9d8867..18b350734a8e 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -1944,7 +1944,7 @@ static int __init make_cpus_node(const struct domain *d, void *fdt)
>>>       /* Placeholder for cpu@ + a 32-bit hexadecimal number + \0 */
>>>       char buf[13];
>>>       u32 clock_frequency;
>>> -    bool clock_valid;
>>> +    bool clock_valid = false;
>>
>> NIT: I would add "Keep the compiler happy with -Og"
>>
>> I am happy to add it while committing if you agree.
> 
> Yes, please do. Thanks.

One more thing, there is a typo in the subject, if you are willing to correct it while committing. s/unitialized/uninitialized/

>> Reviewed-by: Julien Grall <jgrall@amazon.com>
>>
>> Cheers,
>>
>> --
>> Julien Grall
> 

