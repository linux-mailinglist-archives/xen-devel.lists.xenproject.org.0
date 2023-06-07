Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F50A725405
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 08:23:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544375.850114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6mZY-0004FG-Mq; Wed, 07 Jun 2023 06:23:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544375.850114; Wed, 07 Jun 2023 06:23:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6mZY-0004Db-Jl; Wed, 07 Jun 2023 06:23:08 +0000
Received: by outflank-mailman (input) for mailman id 544375;
 Wed, 07 Jun 2023 06:23:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A2EA=B3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q6mZW-0004DU-VS
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 06:23:07 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c275cf5e-04fb-11ee-b232-6b7b168915f2;
 Wed, 07 Jun 2023 08:23:05 +0200 (CEST)
Received: from BN8PR07CA0028.namprd07.prod.outlook.com (2603:10b6:408:ac::41)
 by DM4PR12MB6470.namprd12.prod.outlook.com (2603:10b6:8:b8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 06:23:01 +0000
Received: from BN8NAM11FT083.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ac:cafe::4d) by BN8PR07CA0028.outlook.office365.com
 (2603:10b6:408:ac::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19 via Frontend
 Transport; Wed, 7 Jun 2023 06:23:01 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT083.mail.protection.outlook.com (10.13.177.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6477.24 via Frontend Transport; Wed, 7 Jun 2023 06:23:01 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Jun
 2023 01:23:01 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Jun 2023 01:22:59 -0500
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
X-Inumbo-ID: c275cf5e-04fb-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M9PK/JxVHRcfK554uMNZrqIx9QJLYEqrcL0ayVwOs+R+ZiR+DoKK73B16FN3LrySgduGOxeR7JOAS/sEo37fVh8B7SZemPEuBP/QYzcx7tW758ecb3oaNXjlkt5T9Od+H3+T1fvLErEC+E8BANFiJdTD8c7OoqgOtcXhAYxBR2FKn6y3ZMIJZNrDvKHT00Fh4ipfAwlqDS9DLHIbkNSbl8e9/eg9n7pjMQafTAoXNFcZKu8MRPIJ/8W635/d9S4V0IH0k3pwUlUhyaZ78Gg3bBVkz3WwDslL8wqQImmt+9ThNwplpaGxCQ6mH6MJd5Yp+SP/y4ximjQ/9HY1siMvFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=upMnOKCVzaIaFKEpiAVGbV0GOa0uq9d3oTgjDwd0WHA=;
 b=VsknEwlO3bAGzdEbJqI9Rwo2peYpsabcalx3mGq1sPc4u+a1vlvTMonUN5p5pu8auaqrp2VRkqZSWYrsb83r2uSIwyjak4lsC9GtH+AYudKZ69qz21Ga7ySi+VhkIhvSlOaR+kC8TpzHmFmH7eVHjILiq5P5Vg+y2WHpl/RiFe4fdq7X49bv4B1bu33xEbX2o01xHcU14TVNE7z8E6JyY+lUxyDpve6QKTTjvyUs9DhHLjts4nMHdThG6dv29M7kfi+9n/g7ixn2JzWrETP4eQk+0s54W+6ej34vn8eHqw0MoWoaQPbYvUpXGDpbvx4phngOFp/m05sxss5Il6XZHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=upMnOKCVzaIaFKEpiAVGbV0GOa0uq9d3oTgjDwd0WHA=;
 b=qUQOEZOSELIRFwOBn06SYA1uXJXIys6CS+NNmvxp2Laeg2SyRTf/QT6Zc0BalexLmB+XFOU0tVYMWnt59wYo3KOz6hLCMtFakEIRBGPBBBlHKdIaul5ldR0CkHAidbI1hjiXMUuiCSiAy3Z275w/gYbcihKLz0IoI07pnOtwyBk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <eb266ccb-0621-8de3-1556-638f7f6977f7@amd.com>
Date: Wed, 7 Jun 2023 08:22:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN][PATCH v7 08/19] xen/device-tree: Add
 device_tree_find_node_by_path() to find nodes in device tree
To: Vikram Garhwal <vikram.garhwal@amd.com>, Julien Grall <julien@xen.org>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <jbeulich@suse.com>, <Luca.Fancellu@arm.com>,
	<Henry.Wang@arm.com>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-9-vikram.garhwal@amd.com>
 <d6a40e00-e2e3-81d9-b596-45dcfb2becd6@xen.org>
 <007122c9-1ab2-dd5e-bed4-64333113e55a@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <007122c9-1ab2-dd5e-bed4-64333113e55a@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT083:EE_|DM4PR12MB6470:EE_
X-MS-Office365-Filtering-Correlation-Id: addfdec4-0f17-4d3d-bfbd-08db671fa521
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UgTc8wF/SBVIucuiZdjGd2yrxboubSUMzLukRKk0PVsK2J6suG4KN9/M/Ex9stTakdLb0269JvMEcpHFl/Nu9Sqi0Jm2Be0Bv4j6RgGHNKkPa2e1MoTWli9TokDwWEmELl8WZwrI1VCAYn8HLGK2UY0dd5UUk5MWLEJMQbghn8a3SEuWd5HeDhayc37Lyjqfnw04Ou1HlhoZmUXniPZ5eX6oCZHVV7FuKHvxh/Wa+qk8FkFJKqPixi2uLObm/NbBOVIn/t2xi/rWvVO1DfuBJBUInBliL54eoc94e8sZ3PQSoee8DWSZ1w/UAS7tpUgUfOxZ6Aswk3+SR7Eyw3aTAFwZtBynAlFUgJiGNxGA6v14ELny8wBY+1mx5fQ8KVTUzaH4EegFeak+MhFxseQm2g3vv8TT6aBJoSk09P59WKE7jrQ9HJQIX4soRQPDaNO6tGddXdXoL59xr1Zf1ZB1yO5eTuIINGfZvF0oi/hChPTuoGZ7O5BKk1+fhvVrOavEtkzzJ9nFuVSDuQAo1MdTSqT9yyD+BKqt9v1OtYiocjx6aSbeLgklPb+1n970/Bt4cIbQL/P1sROnnbfrjbTgWXgrkd39EWirNVrNmkZR9FaBiEVB1UrY78OGTUSZ3eHmQ4GpU9O2M446la+OXfM/MwXxQXmpytG+OUh+Rc2EQNws7Mr4tJ7UBPvMJc0t4UwtSdi85c/tb/vqf2REXmJt84b8dFrLEKlGIptBOmBJkJwseM31TBufIZa/1FBnRwXVhCTJeGQiG/8e2p7BLcYYnleiOTH93flFWOwe4ivWv0xZhDG//3RPfuc/V70Oc0++ok+RDMLZNVQyTj6PZNb+pg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(396003)(136003)(376002)(451199021)(46966006)(40470700004)(36840700001)(47076005)(336012)(426003)(82740400003)(44832011)(110136005)(54906003)(16576012)(40480700001)(478600001)(8676002)(8936002)(41300700001)(316002)(70586007)(70206006)(356005)(81166007)(31696002)(5660300002)(4326008)(86362001)(40460700003)(36756003)(2906002)(4744005)(82310400005)(36860700001)(186003)(26005)(53546011)(31686004)(2616005)(37363002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 06:23:01.4687
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: addfdec4-0f17-4d3d-bfbd-08db671fa521
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT083.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6470


On 06/06/2023 22:29, Vikram Garhwal wrote:
> Hi,
> 
> On 6/5/23 12:12 PM, Julien Grall wrote:
>> Hi,
>>
>> On 02/06/2023 01:48, Vikram Garhwal wrote:
>>> Add device_tree_find_node_by_path() to find a matching node with path 
>>> for a
>>
>> AFAICT, the only difference in name between the new function and the 
>> existing one is "device_tree" vs "dt". The latter is just a shorthand 
>> of "device tree", so it feels to me the name are a bit too similar.
>>
>> From my understanding, the main difference between the two functions 
>> are that the current one is starting from root whereas the current one 
>> is starting from a given node. So how about 
>> "dt_find_node_by_path_from()"?
> Thank you for the suggestion. This name was added in v3 as Luca Fancellu 
> suggested to rename this function to "device_tree_find_node_by_path". I 
> am okay with renaming it to dt_find_node_by_path_from().
> 
> Luca, Michal and Henry: Does the dt_find_node_by_path_from() name works 
> for you?
Works for me.

~Michal


