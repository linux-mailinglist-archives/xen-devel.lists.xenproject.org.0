Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D266E7CA0
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 16:29:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523522.813643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp8oC-0005N6-4Q; Wed, 19 Apr 2023 14:29:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523522.813643; Wed, 19 Apr 2023 14:29:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp8oC-0005Kt-1k; Wed, 19 Apr 2023 14:29:20 +0000
Received: by outflank-mailman (input) for mailman id 523522;
 Wed, 19 Apr 2023 14:29:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ifGd=AK=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pp8o9-0005Kn-UG
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 14:29:18 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20614.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f104cff-debe-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 16:29:14 +0200 (CEST)
Received: from BN9PR03CA0394.namprd03.prod.outlook.com (2603:10b6:408:111::9)
 by BL0PR12MB5009.namprd12.prod.outlook.com (2603:10b6:208:1c2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 14:29:10 +0000
Received: from BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:111:cafe::fa) by BN9PR03CA0394.outlook.office365.com
 (2603:10b6:408:111::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.47 via Frontend
 Transport; Wed, 19 Apr 2023 14:29:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT017.mail.protection.outlook.com (10.13.177.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6319.22 via Frontend Transport; Wed, 19 Apr 2023 14:29:10 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 19 Apr
 2023 09:29:10 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 19 Apr
 2023 07:29:09 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 19 Apr 2023 09:29:07 -0500
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
X-Inumbo-ID: 8f104cff-debe-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BX4NlSJfUQZL6A9Baa9+U61yjvbXc9ipY8wq06jPbhAaH39QM8JI4UtGiARoq0ZyJOHTcP+zNg2iR3SiSsQMej3zONBh/mWArLxGTGaATZCR7zCXRo8AoLjmWTX3UTZvqGTo3pO/OHWc9dzLhoBGI64mjSn+c4TD56mQa6/BU3i2Vl12yxQ6DY0tyiWO3r6d5yRnanKwjLsElpOB95MrjYWhcxR6atXQJOLl5rkIHx7bKpPt90G6S0iuM6UFdLgdShLgBhGXj+iwfd6JHt7rgpZvPd93iG/Qk8jme/LkUdQMFnRq33qCA9VZrhVPF8o0Og9hm9/FWRUz3LGxQqFOYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BTbDgP5w/WjI39w2xuG1k38dsw3CiWoafhOH97Jjcuw=;
 b=aPyB1Xc1wNoVz7g2bSQ85Lw5XAHVnA0pJpaEMErMc7q1UklGdzNF2AJiEjxXdU/9odGbvwfqlPIEA+GZs7Yha9sDRNXwxYy3AzcuXzZYCcWACCQynAtqwKcuMO2lmz+R1AzLsNBk6MtSXgoN8LC9IGBnEz8eVMaaFNGj/VwUcAJ2qL4eSLkS+q6NBhXAZvq1K+Xr+FHlAmwRDk2OU53phnhEJGttaIulLfTaK58tffSVQYRV50KW3/vTfLS7h31oGEaSA90UTezY0W92Fndff7evJULEcogmEQw/+fA/SwQZekW1e3J1WPysfRMnwAmKFWG/xFuKBarFeCpoDQxyeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BTbDgP5w/WjI39w2xuG1k38dsw3CiWoafhOH97Jjcuw=;
 b=Gpyygrg7rsLLZ9V1/xLSassOY46TNvdVviOovT3adqKjReyWN5svVH6bUsbvR7f1oGT/AfoBWAX5502d+pn/mSyI5xQTl60JT6XBpmkP4xee8sO2sqR2WoUOOuMdgQSqZupdekeP2KFW4/x6tHRcd9EYgxoPIrXvS3jRj6mMKLo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <0a1246d2-092a-2767-4c1e-0db4ddf71013@amd.com>
Date: Wed, 19 Apr 2023 16:29:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [XEN v5 02/10] xen/arm: Typecast the DT values into paddr_t
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>
References: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
 <20230413173735.48387-3-ayan.kumar.halder@amd.com>
 <458367fe-1781-7751-230c-8a43cecbfca6@amd.com>
 <752ce1ba-8c23-e397-3f6a-15c93ac6cee0@xen.org>
 <5915f963-97d9-19f3-e797-3fd02b6fb406@amd.com>
 <fcb46556-c729-df8a-1db1-820f7400e429@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <fcb46556-c729-df8a-1db1-820f7400e429@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT017:EE_|BL0PR12MB5009:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a58a53c-0875-456a-250d-08db40e270eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dY/eujwzoAgv4k8c12mO+HOORAXVDbxC37f2Ts299FLuSaS3k7cNVhrFCk5slqg45A8hfPp8W7kHewcFv6wjafA5AvP9MJN0cwriqZE55MEy8McfWw7TALNQGxQ1BgXESTqe3nlssveccOMq7VvKnF4fjZtBNiVRe28GNAe7do3FrbvLqj5N/G085x9GwADwrhG+n7h4Raqcte9eOTpCbttHHkU6Bm17VvJH1fQpyOIUih2fxjh2A550eWYvDpuE258x5EVjC/fGtP7mvf/njDhDNX4ZPhAPpHPhLhBSsgt3V6XHMuwEktK4e7OzyXZBvtLLI+N6uSSfOl3fUHcvuVUkZTXyDFFlQwYEkVzwPOGxFS9GpWNl7HsyMN/RRjCuBu88t3B9u+T7oL07Q0H755m94dD1yHbF5pSgbfvdkAtpp+pnZiySvxRsmYYAy/G1gW4z/lFmjLZJvVw+uXTc0Hfc0i9LjabZODZ0SoaNGbawxX6NsmhtGd2qG0Ac+fk68Nlrm8lJAPvODlyL3BeQEv2nzV/hzM3VS3kmd87PAzdrizQKbMW9+U0+jd6kIxNwNA3uGn1FEsILoNdb54jE6xboFmsZt2ApE+89W1U4iTS9VydZVgU4ocEIcLsb6ti0O4F577EWHYh3J8JDhO+CVrjxI99I2CGoGgm3qv71PRuPIbytHdFFAjAn6fDCJAz5toq4FWWOnXQCzPOTF5keFTVH351V1c1ZihDvqVkYXMWMa6gGjsAcTSH1AvhoXpEH
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(396003)(376002)(451199021)(40470700004)(36840700001)(46966006)(44832011)(40480700001)(40460700003)(16576012)(110136005)(70586007)(82740400003)(478600001)(4326008)(316002)(5660300002)(8676002)(7416002)(81166007)(41300700001)(8936002)(70206006)(356005)(54906003)(53546011)(47076005)(336012)(83380400001)(426003)(2616005)(186003)(36860700001)(26005)(966005)(82310400005)(31696002)(2906002)(86362001)(36756003)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 14:29:10.3833
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a58a53c-0875-456a-250d-08db40e270eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5009


On 19/04/2023 16:20, Julien Grall wrote:
> 
> 
> On 19/04/2023 14:39, Michal Orzel wrote:
>> Hi Julien,
>>
>> On 19/04/2023 15:26, Julien Grall wrote:
>>>
>>>
>>> Hi,
>>>
>>>>> diff --git a/xen/include/xen/libfdt/libfdt-xen.h b/xen/include/xen/libfdt/libfdt-xen.h
>>>>> new file mode 100644
>>>>> index 0000000000..3296a368a6
>>>>> --- /dev/null
>>>>> +++ b/xen/include/xen/libfdt/libfdt-xen.h
>>>>> @@ -0,0 +1,55 @@
>>>>> +/*
>>>>> + * SPDX-License-Identifier: GPL-2.0-only
>>>> Our CODING_STYLE says:
>>>> New files should start with a single-line SPDX comment, ..., e.g.
>>>> /* SPDX-License-Identifier: GPL-2.0 */
>>>>
>>>> For me it would be perfectly fine to do as you did but it is not what our docs state
>>>> (i.e. single-line comment). It might be that we need to modify CODING_STYLE instead.
>>>
>>>   From my reading of https://spdx.dev/ids/#how, what you suggest would
>>> not be a valid SPDX-License-Idenfier as everything in needs to be in
>>> *one* (including the begin/end comment).
>> I said what is written in our CODING_STYLE and what we did already for lots of files, i.e. having 2 comments:
>> /* SPDX-License-Identifier: GPL-2.0 */
>> /*
>>   * ...
>>   */
> 
> My comment was about your suggestion to update the CODING_STYLE not what
> it is currently written. Sorry if this wasn't clear enough.
> 
>>  > In the link you provided, the "*one line*" requirement refers only to
> SPDX short form identifier
>> which does not contain any other information like author, description, etc..
> Right because the SPDX block is intended to be in own block and there is
> a another block for the author, description, etc.
> 
> I am not in favor of changing of the CODING_STYLE and I thought I would
> express it right now to spare the round-trip of writing a patch.
Sure thing :)
So, all in all, we agree that SPDX comment must be a single line comment on its own
(which is also stated in our CODING_STYLE) and not like it was placed in this patch, right?

If so, somehow the wrong placement sneaked into recently added RISCV files:
arch/riscv/include/asm/csr.h
arch/riscv/include/asm/riscv_encoding.h

~Michal

