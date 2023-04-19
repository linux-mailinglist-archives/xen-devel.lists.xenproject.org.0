Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 777536E7F0E
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 18:01:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523608.813830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppAFB-00088F-0u; Wed, 19 Apr 2023 16:01:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523608.813830; Wed, 19 Apr 2023 16:01:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppAFA-00084s-Tz; Wed, 19 Apr 2023 16:01:16 +0000
Received: by outflank-mailman (input) for mailman id 523608;
 Wed, 19 Apr 2023 16:01:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ifGd=AK=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ppAFA-00084m-4Y
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 16:01:16 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20626.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67cc0629-decb-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 18:01:13 +0200 (CEST)
Received: from MW2PR2101CA0005.namprd21.prod.outlook.com (2603:10b6:302:1::18)
 by IA0PR12MB8693.namprd12.prod.outlook.com (2603:10b6:208:48e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Wed, 19 Apr
 2023 16:01:09 +0000
Received: from CO1NAM11FT087.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::71) by MW2PR2101CA0005.outlook.office365.com
 (2603:10b6:302:1::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.8 via Frontend
 Transport; Wed, 19 Apr 2023 16:01:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT087.mail.protection.outlook.com (10.13.174.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6319.22 via Frontend Transport; Wed, 19 Apr 2023 16:01:08 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 19 Apr
 2023 11:00:22 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 19 Apr
 2023 09:00:20 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 19 Apr 2023 11:00:18 -0500
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
X-Inumbo-ID: 67cc0629-decb-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lKFXGndJakPwVwcqWTjcZfCEJRw0nmGbatqukqCg0ISANFEHgCKlqZL7CxMHoBKSL2W0DwXNUVdCUCo8YNBGkkRnIWGimiTKueilDvMfcmUYINUlFn2CflkSIMDOlbI2/9nKMr6vfom37crCG40gAzWWEGKEk52c0gssvg4VBRoiXlEIhnwpmfKGizAsHpYAqOkPLqJQskWz0kA1Y63mkN0p9g/8MdMiUv5NVlSmsTe8Cy1OYa+zN0yUJO3uy36c694gxU+SqMvfpyVPrG0LVeDhtuZxaoSVr6+d+PYpZsoFx+3p3MgCu7EgkwlNqs+U2mXzi7JKUkPYuhUmw/JfXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y6Kh9SVHgRW+NFSRH3uXf1Z891SUPvWW+uA5beSDbuY=;
 b=XKJhau+jVA42qvGa52LNxQUrl7deNM0uMOm+sd2ljxS4UbVblGqmoERUD5oejbGQm6p5CjjZoFCHQeebrSeQE+Wku0J74nDlC14aS2pF0lEb+kflvtzt4Xe7MwgPuPHfuDSmcF2LP5yfsjr6XWUkU5YuJjRk1XKb1ODnSssg8WKlfdkYcX6uxP7sWJGWhTi+fILu85MWItYJwJlcXRkTZx6vR+2AKF9pYOK2EF0Ddtg7aZuTIqDKw/7L0Lbh6ST+U0O/yftzJBxeV16OoCyfz2nHesFtUMlDa1rzz/B4YbSQHA1pvG69Xip5iPsi23Ic6Zs/7Hr6oHzhK6UtOCeZDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6Kh9SVHgRW+NFSRH3uXf1Z891SUPvWW+uA5beSDbuY=;
 b=46NTGojBGC7XF6arQnW519kYOR21ilYRhc95JjARrLv+iAz1TOS02o+LLKTXAjWLEUg5z2VE5dcezBSPmahJ0SLuDhNoEqLhW/tUlXyOOSrkj562CZKRdWR4nx7el212JuUpWIFZ8Lc+aYBvI9P3mpSO+PDAPhd9pLi6ix8rigU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <46daf4f9-ef43-b4fa-9246-c81ee3d8f13c@amd.com>
Date: Wed, 19 Apr 2023 18:00:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [XEN v5 02/10] xen/arm: Typecast the DT values into paddr_t
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>
References: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
 <20230413173735.48387-3-ayan.kumar.halder@amd.com>
 <458367fe-1781-7751-230c-8a43cecbfca6@amd.com>
 <f6c88703-a3bf-94e6-246e-ab0d0582eb7a@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <f6c88703-a3bf-94e6-246e-ab0d0582eb7a@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT087:EE_|IA0PR12MB8693:EE_
X-MS-Office365-Filtering-Correlation-Id: e1062344-89c7-411e-91dd-08db40ef4a23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/UIWEDDAWZiGk9gKjtUl2CrW6Ql9LVsDfGEhdS7qirLWgLQ+JapVggf69DzsdlOf8+cvoXkLBFzV6239P3pHz/I3M33IJO90rvOaSEYCY3FK42d/MSpWMOUGTu1/5ZhY1YFV+VXLcVKxJZnAqx/a5IP4fQ4VDs8/psRC0t96sg6PQ3hd8sMQUtu+KqWZINSdGKgOHWtM1HrsuoDHkvT/peEhYR8b/7gi66Kr3BKNDmdFiLzVYwm/bD1jxf8lARBPbOPKG0Ck9Kbe8kBxMXEPUqkKhWV3kHCf3UVG1yGG3eXFCeF13dsuW9WXg4loJyyw/bc2m0oKM54P4oVMs7ZXp6wvs6G7hBBD/ygrfYFDBsRFxIaak5DRZlaxf6rohbk5QtZwKygWPf76ALKvk2WwyawqS6RkBJF7FSoduymm5VhfMwZkptdi0lO/BA7S8LKf0EipF33L5qCfjwQwJVbfbAnWZ7dvJUiB4kAa4aFqnymwyR1DpvnF6iXnzp8oIgChr5Q4Kfs88n7HEllIyYpQdxxeKIdGlyzJJnsaTCzNnX6xtMXXpB6nOkhLQz3/09Qso3nTkTZTf9OzdrwdgWmEQFoyyqeCfhYh4iHrlZKHkfF84sTGPOqai5AXhLn+LooBZsSlNCMYWNOva5Q4Gip+Wz03YPLM3IgnOsq9K87H4mkUO7R2WjrayzcxwK1TaG1EtY90ofCU1/nYoi+JItuZDbgttUCKwd7MV2XdWmWSeoGELIEv4AM3P9rbfbvw1QK44IAwmr9bGv/9uPXggRl5yQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199021)(36840700001)(46966006)(40470700004)(36756003)(186003)(70586007)(4326008)(16576012)(110136005)(54906003)(316002)(70206006)(478600001)(40480700001)(8936002)(82310400005)(41300700001)(8676002)(5660300002)(7416002)(44832011)(82740400003)(2906002)(86362001)(356005)(81166007)(336012)(426003)(2616005)(26005)(53546011)(40460700003)(36860700001)(47076005)(31696002)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 16:01:08.6701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1062344-89c7-411e-91dd-08db40ef4a23
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT087.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8693

Hi Ayan,

On 19/04/2023 17:12, Ayan Kumar Halder wrote:
> 
> On 19/04/2023 14:19, Michal Orzel wrote:
>> Hi Ayan,
> 
> Hi Michal,
> 
> ...
> 
>> --- /dev/null
>> +++ b/xen/include/xen/libfdt/libfdt-xen.h
>> @@ -0,0 +1,55 @@
>> +/*
>> + * SPDX-License-Identifier: GPL-2.0-only
>> Our CODING_STYLE says:
>> New files should start with a single-line SPDX comment, ..., e.g.
>> /* SPDX-License-Identifier: GPL-2.0 */
>>
>> For me it would be perfectly fine to do as you did but it is not what our docs state
>> (i.e. single-line comment). It might be that we need to modify CODING_STYLE instead.
> 
> Just to be clear, this is what we should have (as Julien had earlier 
> suggested to use **GPL-2.0-only** )
I used GPL-2.0 just for example. We want of course GPL-2.0-only.

> 
> diff --git a/xen/include/xen/libfdt/libfdt-xen.h 
> b/xen/include/xen/libfdt/libfdt-xen.h
> index 3296a368a6..cad7ad3bfb 100644
> --- a/xen/include/xen/libfdt/libfdt-xen.h
> +++ b/xen/include/xen/libfdt/libfdt-xen.h
> @@ -1,6 +1,5 @@
> +// SPDX-License-Identifier: GPL-2.0-only
You should use /* */ style instead of //

>   /*
> - * SPDX-License-Identifier: GPL-2.0-only
> - *
>    * xen/include/xen/libfdt/libfdt-xen.h
>    *
>    * Wrapper functions for device tree. This helps to convert dt values
> 
> - Ayan
> 

~Michal

