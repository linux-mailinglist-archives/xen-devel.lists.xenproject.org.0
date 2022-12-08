Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7223B646ACD
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 09:42:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456894.714746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3CU6-0005nV-1X; Thu, 08 Dec 2022 08:42:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456894.714746; Thu, 08 Dec 2022 08:42:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3CU5-0005lf-UH; Thu, 08 Dec 2022 08:42:25 +0000
Received: by outflank-mailman (input) for mailman id 456894;
 Thu, 08 Dec 2022 08:42:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UkKA=4G=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p3CU3-0005lZ-OH
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 08:42:23 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7e89::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38c1841d-76d4-11ed-8fd2-01056ac49cbb;
 Thu, 08 Dec 2022 09:42:19 +0100 (CET)
Received: from BN9PR03CA0711.namprd03.prod.outlook.com (2603:10b6:408:ef::26)
 by PH7PR12MB6810.namprd12.prod.outlook.com (2603:10b6:510:1b4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Thu, 8 Dec
 2022 08:42:17 +0000
Received: from BL02EPF0000C403.namprd05.prod.outlook.com
 (2603:10b6:408:ef:cafe::6f) by BN9PR03CA0711.outlook.office365.com
 (2603:10b6:408:ef::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Thu, 8 Dec 2022 08:42:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000C403.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.8 via Frontend Transport; Thu, 8 Dec 2022 08:42:15 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 8 Dec
 2022 02:42:15 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 8 Dec
 2022 02:42:07 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 8 Dec 2022 02:42:06 -0600
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
X-Inumbo-ID: 38c1841d-76d4-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jNaS9tQzphEne63eoIrU5u15iOJdzKp+ihIS41RjsC8I0LkUWfJmZNfoGREAOiV5G71DMhLjQGhicMZgJB4VFEHs31Dl4nBOW0nKC9NWD5oa0aENw70FfmMg159ST/R9FfEaHQe/bk5dY19SpZuCsHfO/807L5c+9vGkev0eXX64gByhhUKpjZS8JGtgNciYg1A5RWu3QqUQiuOd43XEISgMLpMkqr7SQtuWGF5XjWWcWACcodzxnKCEZ9tLI4zyKuqZtRuEM9TMwzs/ckthwVSxGmOc3d4cvipCvko7DAO6E4SCOzTk4mWGLXcMXgihzh/k+4DXUkLLeLCc4NpStg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aw9jkc/STrOn0ZeERl9Onfdrp9d+22WAt+7ky8mzvdw=;
 b=HilFCeAhOVrirzR9BVCEPf5zUogpdjff9pCY24YqQB5GmBTmBvVxEHJa+wafaHARaHo+6a/i5apH25EzaX8kDzwBwSAWgc0JshCCdmuUcaMSF9SOyLbb7nqxlD4pHeIUGI5KoQvZEZp4YrEZFXqp5ti3fiRzXLlywV2LtfeAOsnMnFc0hN9nMhk7JkUcPP0tKOF2URM2rKxKHJfyoHgGhJpN7jqXCptBGajER203Y+rIzRDk9w3ASuQ7rOtjz2mRSrVd5NPD4m4yj7ErgsdyvOG3b8Qo3dpzzlU2OSi6TvFv3HAiMBzwRhLNgRzqivV/kePg0f9M7IKP4C+gh5kUOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aw9jkc/STrOn0ZeERl9Onfdrp9d+22WAt+7ky8mzvdw=;
 b=u+CkoDCfmCg+v+R+Q/W9ubInLX9mukfc1GJpf7zMXU3bNvA+04to1TU3Y9RRmrOvD0Tizg8FpcnbUmzQBd/uMeTvNFVfIm6MCFsJIjPTwtKpqrAZIewySGQhNDrgEMKyKLI3EeDdT78RGf9Dytnd+ge9gAhu/e09lf3gxb+joBc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <bb7e505c-a358-ad32-0643-bb579e6fc9ca@amd.com>
Date: Thu, 8 Dec 2022 09:42:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] xsm: misra rule 8.4 fix
To: Jan Beulich <jbeulich@suse.com>
CC: <dpsmith@apertussolutions.com>, Stefano Stabellini
	<sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>
References: <alpine.DEB.2.22.394.2212061808570.4039@ubuntu-linux-20-04-desktop>
 <d9ea8f69-8cbe-abda-4ca5-b71b502a3fb7@amd.com>
 <1a1a478e-76bd-2744-4a74-25e8af76d051@suse.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <1a1a478e-76bd-2744-4a74-25e8af76d051@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C403:EE_|PH7PR12MB6810:EE_
X-MS-Office365-Filtering-Correlation-Id: f7880db9-1497-404f-c5ec-08dad8f81c05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qjByWpUW5tiNhGFwd39q4pCvHCIVgy1E0bts7XCgKKOBZRve1rwIstSIZ+5pikclaF4N/4W2DxHJ50fn4OQS8d0y5F3Q2AxTH1SgSAHhWvSiG+qR7v+kHaFWUyFsI4tG5Gcy7/UG1VcHOATjpibyYBCyWIdHM7r77JUrtJgUO2cstnkWhG0u3sB1h8XIo3No5qMF1BlrQ7YcvtbS9tvggrd4Fbg+0pVwClirmhxrJ7QGGARxiXYFobFNt2eQi7oadRv2VFxbLUZX14rstmOfy2p+DizpXErnkvxAwTW4HewB6iXTxgzku3JjlQx/Cc4w3RR+cZiPoMuoaOMa9JRzl1cf2Ewh2tQGUgxvy2N7gx5fb6RDERoy/fQq1+3IgyAvj7bzl2ECgBbdFRshxKgQePkxANps9LGjdgJ7iss7fWndlgfz2MEFk49bewMYD2SxTcTh6imsM5858WwdV6rYON4ovqax5escNSJAZ+kHFl5hsKewld2PcvLS7/r4n5384aL3DSBRQg86wHFHSZsjaFHAukn9mHcfiAp02Q232uG8uhJI42IKQhQzTq3BnMWz/GdYJn9xmeRfC79/YTrstqt4rkXdXyTeYUFPhVj3ebayw6HSVrIxAmAKd7XO1XHDuU0KRUs1pil006qT6uPxqgF/2IrU+sPokowDpWaaSjhrYCo/yyQu9H8kvctsMgoSIKumac4CCV5IJ7KjsM1zaAM6XG94/ujLDNXVnbYTVJMaHWItSv4MNIHj8U0gJpY2HJBPhjFfU12Ri1xNt44kzw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(136003)(346002)(396003)(451199015)(36840700001)(46966006)(40470700004)(40480700001)(81166007)(31696002)(82740400003)(356005)(83380400001)(86362001)(36756003)(40460700003)(6916009)(54906003)(478600001)(5660300002)(2906002)(70206006)(8676002)(8936002)(70586007)(44832011)(4326008)(36860700001)(41300700001)(26005)(82310400005)(47076005)(2616005)(426003)(53546011)(16576012)(316002)(186003)(31686004)(336012)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 08:42:15.9507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7880db9-1497-404f-c5ec-08dad8f81c05
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0000C403.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6810



On 08/12/2022 09:14, Jan Beulich wrote:
> 
> 
> On 07.12.2022 13:33, Michal Orzel wrote:
>> Hi Stefano,
>>
>> On 07/12/2022 03:12, Stefano Stabellini wrote:
>>>
>>>
>>> Fix two MISRA Issues Rule 8.4 ("A compatible declaration shall be
>>> visible when an object or function with external linkage is defined")
>>> found by cppcheck affecting xen/xsm/flask/ss/services.c.
>>>
>>> Fix the first issue by making policydb_loaded_version static and the
>>> second issue by declaring ss_initialized in a proper header.
>>>
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>
>> cppcheck also reports findings for rule 8.4 with regards to the following functions:
>> - security_get_bools
>> - security_set_bools
>> - security_get_bool_value
>> - security_get_bool_name
>>
>> The prototypes for them are stored in xen/xsm/flask/include/conditional.h,
>> but services.c only does:
>> #include "conditional.h"
>>
>> This include refers to xen/xsm/flask/ss/conditional.h and not to xen/xsm/flask/include/conditional.h.
>> This means that we should also explicitly do:
>> #include <conditional.h>
> 
> And Misra has no rule disallowing such use of two different, identically
> named headers, for being potentially ambiguous?
I could not find such rule/directive related to filenames; only \wrt identifiers.
But all in all, we do not need MISRA to modify the filenames to get rid of ambiguity
if we really want to.

> 
> Jan

~Michal

