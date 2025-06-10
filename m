Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EC6AD44E2
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 23:38:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011191.1389545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP6fE-0003TD-SZ; Tue, 10 Jun 2025 21:37:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011191.1389545; Tue, 10 Jun 2025 21:37:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP6fE-0003SZ-N9; Tue, 10 Jun 2025 21:37:48 +0000
Received: by outflank-mailman (input) for mailman id 1011191;
 Tue, 10 Jun 2025 21:37:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ku7P=YZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uP6fC-0003SO-LA
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 21:37:46 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2407::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2189f0f9-4643-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 23:37:39 +0200 (CEST)
Received: from SJ0PR13CA0234.namprd13.prod.outlook.com (2603:10b6:a03:2c1::29)
 by CY8PR12MB7338.namprd12.prod.outlook.com (2603:10b6:930:52::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.27; Tue, 10 Jun
 2025 21:37:36 +0000
Received: from SJ1PEPF00002322.namprd03.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::3b) by SJ0PR13CA0234.outlook.office365.com
 (2603:10b6:a03:2c1::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.17 via Frontend Transport; Tue,
 10 Jun 2025 21:37:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002322.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 10 Jun 2025 21:37:36 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 16:37:35 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 16:37:35 -0500
Received: from [172.27.195.250] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 10 Jun 2025 16:37:34 -0500
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
X-Inumbo-ID: 2189f0f9-4643-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tb9+zvPpFu5+rycppCogNgojcL6xAF5ZcWkj/oV20wKfBpdr3HJvCEKHs+vS8FApW/YO0Xzv4haGQ9n1NZDA7zphI++KwmNgamRNzV2zl8na/UsrbkwR90hy/A88fOFiSUOg5LQDwFqdVVjkjdIg9SS18Hw/Xj45ld0WoAQY8BlQPPNd+4ok2FS7cj07vdb/vbvb0tRFaT2UTm4L4+Dz9rLdWWIIIRkayZGqSIJrKeCY5Ywrp2E651VqRM4lfdUOb5pi8dZDRWoMfZ/mBSwLXNnZEOIMqXlVebL6cyPyHGcsam2rulhIHhpEv1jLzdWRQvrfK0NpAYL8Xmx7Zbpt7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PbxqrnsIriBEvdh9Ma7uJzXr4foBWFsra8GT+/tNARQ=;
 b=vLIpQG5lVLdMO0lhKuS+xa3N7yQ5CHZCQazWJv9+/QTwzTPE3wy+7/t3t1Tg8VkXFZuik0nXaoTXUTH6BRgLIzFV+qtDh1jhoIMEY/g/xGNBdRdG9c1pGBIUN4s/p7QY4r9kDOqnkhAuHwDxWcfKd1qW87EZJQkCB+4uREg5LvI0yqRzBD0Vv76IlFzRNLjqAY51E/+xDCFw0FgDsaHzVyl1dJhIwEL4Ro0VAagtVESNDJU2Qkr3GOziU3R9J4Fw4cyNroNbTzq1C2XECNbqzMhxv5Y4ucpM2XXmWkSMzIhX6pBjuHOule/ohpThR75VRC5R/LD4e1GGXuMwfFmE6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PbxqrnsIriBEvdh9Ma7uJzXr4foBWFsra8GT+/tNARQ=;
 b=wV4TfZL2dSvxVlBVs5Mz/WGggi4c+VTDqPFx97W979WGC4awM5fXt+j0XJOIuQTSO4BNV/d/BJrdZo2JHthZpZSm/s4tJ48Mc+q7j3eYqtodSuqsiEYFXrpJRypkCiNq6VYBxz1xvBjRjA/kO0Wc9qzSZSq4/ZB9OD/vpkZ1xpk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <c6a8d11b-b7c1-4cf5-9c5b-e4c0920c2af0@amd.com>
Date: Tue, 10 Jun 2025 17:37:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] xen/domain: adjust domain ID allocation for Arm
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
CC: <dmkhn@proton.me>, Jan Beulich <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <anthony.perard@vates.tech>,
	<roger.pau@citrix.com>, <teddy.astie@vates.tech>, <dmukhin@ford.com>,
	<xen-devel@lists.xenproject.org>
References: <20250528225030.2652166-1-dmukhin@ford.com>
 <20250528225030.2652166-3-dmukhin@ford.com>
 <63087c42-d709-4e53-a2c3-8b812f13190a@xen.org>
 <a4c860d7-1fa0-43f4-8ae1-af59b7c6506f@xen.org>
 <30c01c78-5a5e-435f-9b1c-faca3af04a76@suse.com> <aEfmkMBW7r1KHuV0@kraken>
 <11ea9475-d963-473d-a85b-d1c461e7b213@suse.com> <aEf1Hw+x35Yci/FS@kraken>
 <61e2ae99-041b-4c8c-81bb-c86b5cee936e@xen.org>
 <alpine.DEB.2.22.394.2506101130490.2495561@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2506101130490.2495561@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002322:EE_|CY8PR12MB7338:EE_
X-MS-Office365-Filtering-Correlation-Id: 791c3f28-4787-4b21-d3a4-08dda8670447
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QW84MWR4R2xFcXlYaWZhSHBmdndKcUxGdWlUS3ZNWkQ4SzRZOVRMMFhsV1Bx?=
 =?utf-8?B?a3hXNWcxVEkrY3piMFB5eU9RVmZQNzlLVmtrN1lOWmZkRVY3enZyeVZBSW40?=
 =?utf-8?B?aXNhSUwvZEtkbXVlaE5vTE5NTmVvNWJRVEJhNkZqN1dQck1xRFZ6RU5NeDZN?=
 =?utf-8?B?NWN4UFdBbC9nUW9iajlLYVZFeVFOWVN4b0FwR2JmL0h3SkpkcXAwNDF1K2pu?=
 =?utf-8?B?WUpqeUd2QlRld2pjSi9keHE4MFFqRHdvcVNXQytWODVyZUpRaWpCMCtSck1j?=
 =?utf-8?B?cWFGcWdlaWZQOFlBMFFPRzVsUmFYRHRiU2JWaFgzeW10NFBoN2dYUHJNTTNu?=
 =?utf-8?B?eVNqUVkzeW4veW9aQ1ZySUdBQUgyR3JGUkp2b1pzdWM3QlRweW8xbVJLTkNi?=
 =?utf-8?B?K2RrSXlmOG9CMEMzM1ZiR1FFVDBJNnduME5HaUN4ckFYSmt2c0xHODZEK3Ur?=
 =?utf-8?B?ZkVBNEdOOVp5MXFQWnhDVTRreTRIMDg2TzNLOFZCOGZmMWpFZS9aYTVzOFFa?=
 =?utf-8?B?ampzZWtqWXdrak5BOXZBNTdaNzhXc3JBMnU2S2cza3c3MktNR3NIV2lGSFM0?=
 =?utf-8?B?WVdPUmYyOUxHeDcxTHBqaWtab2J3VE1seVFxOXljTExndi9PdUJpNVl0KytR?=
 =?utf-8?B?TGZuMFdEU1ZsM3J0cXJjaGw4VGxoakdlaUsxZ2JsNlUyVnF0eEwzb0VNU25y?=
 =?utf-8?B?ZFd6VUtuNGNQdWMvTUp3bFl5SkFMY3JOYVZTTWZJME9NU2JZNTJsOXM4Z0ZX?=
 =?utf-8?B?bk45bnUwNm1uMkhoM1VEVDdodE9XenZ1OTJiUXJteVhibitoNzIyd2FZT2JC?=
 =?utf-8?B?WTJJdjVlT0k1RzZ1cGZZOGsrNnFQb2Nuc0ZxblJHWXZKaUFYSS9JQjNGbUxv?=
 =?utf-8?B?ZExVQWdLOEZ1ajhEL1Bta3Erem5EdFB6UVdKRDlTQURCd2ZPRllxS0U4c1Bh?=
 =?utf-8?B?TDBIV3pYcXRBc0JWZFk1UGlKdU1zalRybjRCeGQxejlFelNJaTl4RUFVaHZI?=
 =?utf-8?B?RGRqMG5qWHhjQVkxMmdwcGtyQjFhbE03blppNVRvbFJ4dFMzUzJOZENXYjNH?=
 =?utf-8?B?aWNncklQOXZkbVNteHR5NG9KUmQyd29xZ20rSlpNenJsVkFFbUR1SDVJOTd0?=
 =?utf-8?B?NDNFRkkvdGFUcVliS1JqSUdkeDZKWU1oa3R6ZXkwL2FFTHp5MTNCcDlNTzBP?=
 =?utf-8?B?Tkc3dGdkaUFtNEVHQUVmaVJhem8vNnNqU1NuYkRqK25qL3BiSlNlQUExMFNO?=
 =?utf-8?B?WlZoeXdnZmpLTWZ1SUo3eUpsUjJXaVF0K05zdmZUNmdna0JlaTBTbmU5T0RH?=
 =?utf-8?B?ZUJwRG9wRGxOcEVTa1dVdWlIWWVnYTBLdHFsZzVQd0dZT1ZDTHMzS2VsZ0xL?=
 =?utf-8?B?aTl2UDF5clRtaTRBYnVRQ2ZuWDErdncrMVI3TFRZM3RXK0cySC9hbTkzai85?=
 =?utf-8?B?VHM5S3VoSFpmK1YwL1BiWjNza1RZVXQzUkFKMXIvN2xISFM3a3Z1TlFURnE2?=
 =?utf-8?B?ZVhQODR3ZnFTTmhQMW1IYW5Ub0FTeFdyM085OG9RSjZoY09nN3ltTUd6TnVC?=
 =?utf-8?B?R0JyNWpZZnRzUWluNDBDRDRwSjFkYzF6dFlGOUtoMXFkVGZxUFFIOUxLeE0x?=
 =?utf-8?B?eHJPc3JNMnJUa3ljcnJKaUhtL20vN3NGRXRaaVVxOWEzZkIzN3RuZTVNVEdX?=
 =?utf-8?B?RTVHMEdjcjJ2b2ZhMXA1Qmw2TVViMzFrTWhsLzQzbjFtSjFSaVdkOFdVVzJE?=
 =?utf-8?B?cmV0dFRYODZ4ZXRnZ2MrTUxMY0llWkxzdWtsZ0JDTkNFVHZvRVVtY05yajNX?=
 =?utf-8?B?dG9nTXViQ283aTVKV0EvVVUwelVyYXlLWlk4dWQ5WnZiQ29jaDVnd3B3R0Nx?=
 =?utf-8?B?WnpybUF4eStxbmdOcHU5NTN4ajI4ZXJlNnh3c3hLVGVCbDk2UngyNTVvY3Uz?=
 =?utf-8?B?WklKZW1TQ1E3Qk9PdzdNYzlBQ0xLNzdpY3ZLU1AwQ1g2dlZHUEc2Tmg2VlJR?=
 =?utf-8?B?V1hQUS9MK1dqTXV1VEhpTk1xSFpGQ2ZqMmR4K2JJanFTWndoVVl2aVpvcGpx?=
 =?utf-8?Q?pTt3oP?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 21:37:36.1979
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 791c3f28-4787-4b21-d3a4-08dda8670447
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002322.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7338

On 2025-06-10 14:33, Stefano Stabellini wrote:
> +Jason
> 
> On Tue, 10 Jun 2025, Julien Grall wrote:
>> But even if we are ok to break compatibility, I don't see the value of
>> "control_domid". The implication of setting "hardware_domid" is you will
>> have a separate control domain. At which point, why would it matter to specify
>> the domain ID?
>   
> I just wanted to say that while we (AMD) are looking for a hardware
> domain / control domain separation for safety reasons, I don't think we
> have a need to specify the domid for either one.

Specifying domids isn't really necessary, but it can be convenience or 
usability improvement with dom0less/Hyperlaunch.  But I don't think 
control_domid is necessary.

hardware_domid is not used for dom0less/Hyperlaunch with split control 
and hardware domains.  The "capabilities" device tree (DT) property 
specifies the role of the domain.

Hyperlaunch lets you specify a domid in the DT - there is some 
auto-allocation logic, but I haven't use it.  dom0less doesn't allow 
specifying a domid today, but it could.  dom0less domains are assigned 
domids sequentially, so you can determine it from the order in the DT.

Knowing the domids can be helpful for configuring userspace, and that 
only really matters for dom0less/Hyperlaunch.  e.g. xenstored wants to 
know which domid is control.

I think it's nice to have a domid property so that you know when 
configuring the system which domain is which.  You can explicitly read 
the domid out of the DT and know what it is.  Since dom0 userspace needs 
to refer to domids, this make it clear which domain is which for, as an 
example, connecting disks.

hardware_domid= is the way of enabling later hardware domain 
functionality.  dom0 boots as dom0.  When it creates domid == 
hardware_domid, that new domain becomes the hardware domain, and dom0 
loses hwdom and becomes just the control domain.  It's a legacy feature 
and was a workaround for when Xen could only create a single domain at boot.

Regards,
Jason

