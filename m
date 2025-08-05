Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8DFB1B7CC
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 17:53:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070695.1434315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujJyC-00033t-H1; Tue, 05 Aug 2025 15:52:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070695.1434315; Tue, 05 Aug 2025 15:52:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujJyC-00030m-EO; Tue, 05 Aug 2025 15:52:56 +0000
Received: by outflank-mailman (input) for mailman id 1070695;
 Tue, 05 Aug 2025 15:52:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tjfC=2R=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ujJyB-00030f-Rg
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 15:52:55 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2418::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f1c6909-7214-11f0-a321-13f23c93f187;
 Tue, 05 Aug 2025 17:52:54 +0200 (CEST)
Received: from MN2PR20CA0066.namprd20.prod.outlook.com (2603:10b6:208:235::35)
 by DM6PR12MB4140.namprd12.prod.outlook.com (2603:10b6:5:221::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 15:52:51 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:208:235:cafe::f) by MN2PR20CA0066.outlook.office365.com
 (2603:10b6:208:235::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.21 via Frontend Transport; Tue,
 5 Aug 2025 15:52:51 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Tue, 5 Aug 2025 15:52:51 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 5 Aug
 2025 10:52:50 -0500
Received: from [172.17.35.128] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 5 Aug 2025 10:52:49 -0500
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
X-Inumbo-ID: 3f1c6909-7214-11f0-a321-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zm82b/39gOzGp0RTPS+lH2VubtERniWI6QRT+Chjtb+5ffpiDPYPF7VBFuf0ro89qIyyz4AWlO8yIKXTqFMGb+uB+Ho7/3hEvl4F1n6UtU4kAluwiVToMmXw/blQdiltq5Qn5hd85PYgfkJRwag92FLWW1KyntTuTqTpSfiAZjWVRZI4Wu1mUL+JigvJVgEjDJd2fOLTz8rAN/vut8XEs3rDzAuCVtYziAd0pQJsOFhmMaGMDLeuHY7LjT4kQUWhsCfMFOGF9BFpIcVtbolnyY7bxyWa/lObM1bQ93JaKOiPiW7tkDUfIOUUfNRe7V1/Y+OfLGd2dJF0dfNC10S/Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RUahBH58Kz0fNc27h/j5WSk2zjAIPnsRjrrcmBsfVAM=;
 b=pvVMf8DLC1Swc4NcR6dan7uSlYWdIAbnS1sICzsLPLeCJ6/Y/R5FbhFuKleHuOulZBEAlQzV7B0/4Z1fwDvnwwdev2GkiKDtMsozSI6koroF3XnzeLUCxSpAes5Md+B5XTr+kJ7SAX64BQ0RlBN9ZmEARwO8fVi8VeDoe9qML8oIWtKX+6jL7QckQNrhSV9Qn0cYnUrW4xkSCLOVEkVoyc9bWYguYBtz9DiyqlXWsB+KwvvZmOTiTvAWVjg+k/LaLuTa5Pg1fTSu1Js8/2Mt/4xZ65B7GO/YborleXE8z05q+eo/zCMcF9I2wYmit3L+jRALKftVuhVHSGncjMqZ8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RUahBH58Kz0fNc27h/j5WSk2zjAIPnsRjrrcmBsfVAM=;
 b=yg8ac700tE1QzYRe7KGvCDne26Gv28uPWg32R/Qg2b6KPBbAvyiKtR4NELI8Nn8QzRDNALNA9GZgIpTQy1e6JgcEPTXicg8pXFhO9/Y/Sy6Nvcg0b6CQHLht4iKUzMHtZ+2g+ZglbinwMg8mv/pnLN+uSkPw5O5s4DTlQPOhL/g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <38e31126-5540-4224-ab4c-0bd9e31b49af@amd.com>
Date: Tue, 5 Aug 2025 11:52:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] console: make printk_ratelimit_{burst,ms} const
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <5fcd1c68-6c18-4a1d-8a1d-f056bdb6cde9@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <5fcd1c68-6c18-4a1d-8a1d-f056bdb6cde9@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256E:EE_|DM6PR12MB4140:EE_
X-MS-Office365-Filtering-Correlation-Id: 47fac8f0-c65e-431c-1476-08ddd438221d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0ZxOGFsM3I2aXFBQi9sa2lxWEU0N0IvWXlRaHd1ZG44anhYUHJTZERCUW11?=
 =?utf-8?B?SFNVWHVVSkNGYXc1Zml1eUtiZ2MxV3JWZjVtcm5ZdzZKYlFPd2lrREZta2hv?=
 =?utf-8?B?b2V0VzJzY2Vsanlwbzl1dmF4UDRxaERkb3hadkVnck1kTndhWkdOblpWNkRR?=
 =?utf-8?B?T2pPWDdHNkYrR21QZWVVaWExYzVRZUVQKzEzbUpqRG1SamtsbTE4MHhKYXVL?=
 =?utf-8?B?NTl1OG5SSTJVSlgwWW5mckltRElRTlJWSlp6dTN6UGJHblR5ZDFhMlJsTUhU?=
 =?utf-8?B?ZTB3cGF4cG15WWVHeTlEeWFlRzRSdkx0a1R2a0tSbnUyUjdrNlhkM3lmdlJW?=
 =?utf-8?B?VXhERmhwU1VqQ2p3bUQyYk1lL3FCRm0rR2pwZmc2eGlkNzZIS3pseEZXdmhW?=
 =?utf-8?B?cTdMdi80WjZrNi9pTnRHV3pnWEpRYzhEeHZxWEJYb01IaE1hbVZtbElSbFZX?=
 =?utf-8?B?dTlZMkV4dTlKT3B1c3FDRHBRcDcxc3NFUTlSbWVMNXE1Um05aEtsK29RWU0z?=
 =?utf-8?B?UFdyUUY4aEhNWVYzQWdVcm1BcDc3V1RyTG9oZVAxQkk1NjB2ZThrUC9oeEgz?=
 =?utf-8?B?Z3NJdVRveFhXMUNETTNuYmpIU0F5WHJCOUZYRlhmSWp4VTFtTlhmYUsrRkpX?=
 =?utf-8?B?Qjgyd2xoYWFrNjk0VXc0ZjVHTXFpN2Y0b1Znc0svdUJaenZLZFI3V0psREZv?=
 =?utf-8?B?MHprN1Bxd2R2NnFoc0U5S1ROK2FIOG9jMlNXdnhYOFhXa2ZZZGkrc3h2TG9Z?=
 =?utf-8?B?R1cvVkQySXRuaHkwSzMxdGVoUEJVQldOZmtNL3A4eXNnL3lWUldpUk9KWmxr?=
 =?utf-8?B?OFdZY082dXRqeGRSTzBYT1UxZEQvNUh2SWJZdVVKTVNFTDlvcUt3R2dyajNC?=
 =?utf-8?B?SlY5MjVmYmdZdkxQYmJxNThjc2w0cjhKdWNCZ3Z1SzVEd2luR3Z5UWxJZzl3?=
 =?utf-8?B?U25EVXV2TVltMy80a2tKMXJsMDY0MXJNUHBOMS9CZGsyTmpPbTdRUlA1NlNu?=
 =?utf-8?B?ajZ0dmpRd3BVMC9MaFNVOHk4SnVFZTVYcDNsWXlPanR2azRKcjk2TUtScmpE?=
 =?utf-8?B?c21tUlJMcGd6aWdRdjZQeG9UZ1dmUjN2WU1xRE44VmRuQk9ualhlVjFpNWkx?=
 =?utf-8?B?ZVgvcFhnYUFwdGtVL0dYN0pid0gyWE1XVlpDc2VPaTRucGZyMllGUXovU0w5?=
 =?utf-8?B?KzVISmNQVnlwSE5XRlVveHZ6dm1lQzRDSlFvS3VVOHd6QmF2NVNzWEJGTmRV?=
 =?utf-8?B?REY1Y2pEMk9JaXNCcXBMaXJlM01BZGlhMkZnS1ZIc0JOa01XcTBnWmsramlH?=
 =?utf-8?B?VmJrcGFZSXdtOU9oUWlaUUZoaU92UlByTmdmV0hHRVdOREltYWNpTlVlQWFC?=
 =?utf-8?B?djVYaU1IalBkMjdXYTNJRUlwa0VMUENIL2habExTVWFLOUhTNXFZM25LcFJM?=
 =?utf-8?B?RHZuazFONk1ybEt0TitPSGdoMXFwMTQ3eGZabnJjeUtrVEw5OFI5Y2NGd3Yx?=
 =?utf-8?B?dnFFdFFDQWNMbVZIUWswTWJoNXRicHBCTElGNzkyV3NFci9LTVVubkxXVWtP?=
 =?utf-8?B?V0psVlV1a1JHejltZkZZU1l3Ym45YkhPVWtOVXpDWm9OYk5TbUJoak5ZQmZl?=
 =?utf-8?B?RHZLMm1WdnJRckVCTkdPZHBqUEUxc2d1bVc5eFhHMlZGUHpFbnE3MWlXeEd4?=
 =?utf-8?B?QzR3ZnUrbEt3YVZLd1BCTGRud1hpZ2dhZWFKLzE0VUNlTVJvNklDVUNMS0ZZ?=
 =?utf-8?B?dmNsczZVMExzM1NuYzdkeDhBV0Nsa1dkRmI5Q2hmSldQd2ZGUmlHVEo1R1RW?=
 =?utf-8?B?ZVg2NlNJNHk1bVF3dGtVNmx2SExaUGVneXlhaURLS2RrTTI4QnNnbU9TS29S?=
 =?utf-8?B?bUJaUEk0TVIySUVoU2pydENtUENVWFZBT0orcllycnJrWVFIVnIwcEFnNWFY?=
 =?utf-8?B?dXJWTEZGVEJHYmFRU01Ed29HWFRXVzMxbW9HZWxJOEFadlk4bGk4bDdEdmJt?=
 =?utf-8?B?MUFWNU44MlRqTXMxL3dZSFNWNXdpWFI0TFh1clJPcW9MK092UEx3OU1xdXNz?=
 =?utf-8?Q?YObiHs?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 15:52:51.1617
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47fac8f0-c65e-431c-1476-08ddd438221d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4140

On 2025-08-01 03:30, Jan Beulich wrote:
> Them not being altered by any means, their __read_mostly attribute is
> actually counter-productive: It causes the compiler to instantiate the
> variables, when already with just the attributes dropped the compiler
> can constant-propagate the values into the sole use site. Make the
> situation yet more explicit by adding const.
> 
> Also switch the variables away from being plain int, and have the
> parameters of __printk_ratelimit() follow suit. While there also
> similarly adjust the type of "missed" and "lost", and - while touching
> the adjacent line - increase lost_str[] to accommodate any unsigned
> 32-bit number.
> 
> Fixes: a8b1845a7845 ("Miscellaneous data placement adjustments")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

