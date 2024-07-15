Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6BB931A5D
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 20:32:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759239.1168871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTQUw-0002Wv-6k; Mon, 15 Jul 2024 18:32:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759239.1168871; Mon, 15 Jul 2024 18:32:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTQUw-0002Uo-3c; Mon, 15 Jul 2024 18:32:30 +0000
Received: by outflank-mailman (input) for mailman id 759239;
 Mon, 15 Jul 2024 18:32:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hkUO=OP=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sTQUu-0002Ui-DD
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 18:32:28 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20602.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93a7fd96-42d8-11ef-8776-851b0ebba9a2;
 Mon, 15 Jul 2024 20:32:25 +0200 (CEST)
Received: from SN7PR04CA0015.namprd04.prod.outlook.com (2603:10b6:806:f2::20)
 by SA1PR12MB7152.namprd12.prod.outlook.com (2603:10b6:806:2b2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Mon, 15 Jul
 2024 18:32:19 +0000
Received: from SA2PEPF00003AEA.namprd02.prod.outlook.com
 (2603:10b6:806:f2:cafe::24) by SN7PR04CA0015.outlook.office365.com
 (2603:10b6:806:f2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Mon, 15 Jul 2024 18:32:19 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AEA.mail.protection.outlook.com (10.167.248.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Mon, 15 Jul 2024 18:32:18 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 15 Jul
 2024 13:32:18 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 15 Jul
 2024 13:32:17 -0500
Received: from [172.27.205.14] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 15 Jul 2024 13:32:13 -0500
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
X-Inumbo-ID: 93a7fd96-42d8-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FdoSu3+e4jF0ZhIGWgpb2VrdTEbBqY2AJQtVOw2NNjkdY8vgBjtw+ucalKjUWriWVX55sQUdQDoTbSQq8p9TWddfySJnu8F/AFo5yxEM3lwjOs3vtE+q74c82n45T+CqtrEJX1VGwj8liI0jN69M3vrGqKggnqc2SxKgAfaUHkYDrJwgLbyIguK1ay70c9vPyHKQs0XICI8gHCFtahn/H/cJ5UTQw0jX1XYfTtsSPp6p0D2EcrFlQTAdA5yr9kGv1vvzVBerpHJPqYb5VopqfGqvp0ZrIHAgSWM3+h9MB61++TMnmziVKzP1oOymhPVzcOA4YWjhZCzWSu2PWz3Bww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1C3jnD4YB0+sJlwqntGkTkqicO5a54EUrt+0mMsuqj4=;
 b=IW89/ljgeT9AXMCXTivmqeyXHsdP57070+nq1H+aqC4OZvFSv+c4jlFb6gbx4SDPVP5g/NrfnHf2lfDSTYylsqUO+dJPmK34myjbSgM4e6Op7eBWQQ+2iy3yTG7BhR0t0lBgULUFzvnIAWr8SCz+ut9ZrhWgg8z4Y1QwdPMfI+gRpoDRCRgieFC95eqDy8xIRvKCPVfHAQihXb0JjHbzJUxVtg/ZwaGti8MranaFMAi8IHccmQYz4RV502SfjaXBam6P74/4db5s9UEpXjHIv2O4olUf//Mrn6/aY29c/sa8iPv5gOdMr8+7GNXAgkgRSkni7ZLgaV44tSZ0u52xHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1C3jnD4YB0+sJlwqntGkTkqicO5a54EUrt+0mMsuqj4=;
 b=ciKJ/htOoKEqgDcj8AKNE2JKxn5SuKGLw7uly0iyodenma3dUsyXQPz4RQDHXva5ATJiQyItUvSqqiJ6aW2Kn2293aZqENuMK0EZ58GFnxl2NXkv35KkCZHpNiFL/X2b9vXrkgcwHCetcKyiT0ey/8f15bKbtpGC/kpSr2lUhhM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <c2bc48f1-cdab-4cf5-bd41-f7b4a05a433d@amd.com>
Date: Mon, 15 Jul 2024 14:32:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 2/2] x86/cpufreq: separate powernow/hwp/acpi
 cpufreq code
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>
References: <cover.1720596402.git.Sergiy_Kibrik@epam.com>
 <56f61a1e22ba77fb352d7a18203935c26c815646.1720596402.git.Sergiy_Kibrik@epam.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <56f61a1e22ba77fb352d7a18203935c26c815646.1720596402.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEA:EE_|SA1PR12MB7152:EE_
X-MS-Office365-Filtering-Correlation-Id: 52499c35-d083-4ba4-0f72-08dca4fc756a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q3dROElOQmhWRFV0ZmZwMnlxWlhoZTlwcDE0YVd3VVRaVm9mWnZOR0dwWU9Q?=
 =?utf-8?B?Z1dnaHE4bGFCNXpjVkY1bnZpMldxeDY4RFU4ZkcvZjdyVytpdUxmVGtwcG54?=
 =?utf-8?B?WWJuR0lOdTVwalp6YmRLUXJMSDhNaXlXdDJBVXo4V1NhZEFHVUhqbmFsNGFL?=
 =?utf-8?B?R0hRU24wc0x0KzFBMmdjWktmMmgyb0tqcEJwbU52bXJzU0VUajhWLzZUMkdk?=
 =?utf-8?B?dWZpTGd1Q2hEVWVhZDFpSkd2bjhrWVM2dnNwRzNJOHFtZUZ4ZUh2OUNtSnlY?=
 =?utf-8?B?U014ZUlGakNBZmRWaU1VRHJURHA5VTF5Q0N1NXNBcnZsdm5vZEhUVE96dERM?=
 =?utf-8?B?dDkrVmRRR2M4Y1BtVkZwK216UkpDOFdDcHdKeFc4YkJsR2huY3FkOHAvZEJO?=
 =?utf-8?B?THdwSWtYVnZWU2l4UStnYnBHWjUyWFNSQ2cvOCtjSTd1d3F1RGl2L2QwNyt6?=
 =?utf-8?B?cWtNYzB4OGZFUENhKy9OVm12MVJWTEZNSHByNUwxLy9jd3NINnhqcDVLbWd4?=
 =?utf-8?B?RkdtUk83ZW1va0MrdmZzakJ5YmV6eCt4T1B2ZzhXR1lWSnM2dkJmTUtPU1dw?=
 =?utf-8?B?Zk9CT2pVZ25sczRCVkdzMEtqUWkxcGxhRFNreUw2RjY3TlczNllNVVR6UUFv?=
 =?utf-8?B?OGk3TzMrT0JDU2dKbSs0UDNyY1JMTVlhcUZNczE3OG9GazFpNmh6SXZtS3o2?=
 =?utf-8?B?aksrNmE4Y2tudVJLMklrTmUrZnYwZWJLYzBQU3d6OG40eEluRXFucTV3L2Yr?=
 =?utf-8?B?MHJTbks3bUE2UEJ6SGJaWEMzQmVDQWpQdVcva1ZLbHh4bUFWa0M2UXVlWjFD?=
 =?utf-8?B?M0orVFlCbHB6UzJON254cVA1bkRQd0tqazRJM1lHSmZMZVlxR0hoTnJXNjU5?=
 =?utf-8?B?aEVXY0gzejUwc3UvOUF4ZU5vVWhPRXVJR2tRSzZIOFk1NmFqbTI4NHdBUHdS?=
 =?utf-8?B?N3gwbzVnSEdGSGtROFdWMDBjVGppbUdPN2UxcnYvc1hyZWM1aFlHOElMY2c0?=
 =?utf-8?B?VFU3LzFldVBGa0U2NTQvWFVvbVlCcHpzUHcrSFlKTk1vd2xzYmUyRldENE9h?=
 =?utf-8?B?YWErWkdXZ0VKTHVweVFQL0pQZy9BcHVMTFhzck9mY3dYWmNRcHpSQkpuQ3Iw?=
 =?utf-8?B?MndxdndaQ1U5ZmF5TmdvQ085bVdkbG9uK3NNOVRxUzlRTW9raXUvcjVXVjVi?=
 =?utf-8?B?ajR0VElRL3l0dkt1ZDFnU3FFeGxhN0FmVE91MkU3eFhlR0JMN2UrODVYZ3hL?=
 =?utf-8?B?WDlJNENXVkFMeWJ1RUorU2F3ZUF6aDUrUThXNEZTTUZ6a1NrU25KWWdHZjZt?=
 =?utf-8?B?a04rcWlTbmtuRFBlMnltaXZIOWhGdjF3RFRaRWw1U2NYZDhmdk5lNDRFVXdz?=
 =?utf-8?B?RTdNWS9UbmRkS01LRGJnMmZzdE5neU5LRzdaVTdOeGh3cjY0MUlzMHIvS09V?=
 =?utf-8?B?Nk9OYlB0cG1zTmxDTXJ5MXF4R0UzT3NjbzNManN4NzR6TEVyeTFqMWorT2Vk?=
 =?utf-8?B?ZTYwaE5Rc2h6TzE5QUQzK1NacWVXUHphWk1VWngvM1lIVDBBc2xuMkdiUzFO?=
 =?utf-8?B?YXpFSjIxQ2FpY1Q5VlVFRVZ4cmlENmF1U0xuT2FEaVNBbGplY0pqRUY4anJL?=
 =?utf-8?B?R1diRnh4cmhRN29MT0FSOHVwaGhCMTZmcWQvQUM0OFFCNG1NUjZDcU12RjE2?=
 =?utf-8?B?dWdJMk1Uamk3Sit2bVNrd3NVVitYb1JvblM3NlRvUFp3SnNlZFNyY2p2b2Ro?=
 =?utf-8?B?NzB0WXp4SEtkU0cvR2VDSHAxRVROUGU0ekVqN0dRRmV3YWR5d1RjaG4xbzZM?=
 =?utf-8?B?aE1yTFBhUWlNV3o1NzRCSGxwejUzQVRhcVFHdWdCeDVSdUk3NEE1dG9GWlJj?=
 =?utf-8?B?OVFXVElWUXFRdWNBNHBmWmpqSTZzWE5NRkRWUzJLWmxKNkl6SHZaQkt1Zk5r?=
 =?utf-8?Q?bEXrxyiPyqsP95CPThBudga1RI8EO83u?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 18:32:18.7429
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52499c35-d083-4ba4-0f72-08dca4fc756a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AEA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7152

On 2024-07-10 04:30, Sergiy Kibrik wrote:
> Build AMD Architectural P-state driver when CONFIG_AMD is on, and
> Intel Hardware P-States driver together with ACPI Processor P-States driver
> when CONFIG_INTEL is on respectively, allowing for a platform-specific build.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> CC: Jason Andryuk <jason.andryuk@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

