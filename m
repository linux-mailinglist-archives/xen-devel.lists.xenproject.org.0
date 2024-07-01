Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF31D91D8DB
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 09:23:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751264.1159159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOBNc-0000Cc-AA; Mon, 01 Jul 2024 07:23:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751264.1159159; Mon, 01 Jul 2024 07:23:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOBNc-00009v-5r; Mon, 01 Jul 2024 07:23:16 +0000
Received: by outflank-mailman (input) for mailman id 751264;
 Mon, 01 Jul 2024 07:23:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Yp2=OB=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sOBNa-00009f-M8
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 07:23:14 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20621.outbound.protection.outlook.com
 [2a01:111:f403:2414::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6735a21-377a-11ef-b4bb-af5377834399;
 Mon, 01 Jul 2024 09:23:12 +0200 (CEST)
Received: from SJ0PR13CA0221.namprd13.prod.outlook.com (2603:10b6:a03:2c1::16)
 by PH8PR12MB8431.namprd12.prod.outlook.com (2603:10b6:510:25a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Mon, 1 Jul
 2024 07:23:09 +0000
Received: from MWH0EPF000989E6.namprd02.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::5c) by SJ0PR13CA0221.outlook.office365.com
 (2603:10b6:a03:2c1::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.21 via Frontend
 Transport; Mon, 1 Jul 2024 07:23:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E6.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7741.18 via Frontend Transport; Mon, 1 Jul 2024 07:23:08 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Jul
 2024 02:23:07 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Jul
 2024 02:23:07 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 1 Jul 2024 02:23:06 -0500
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
X-Inumbo-ID: c6735a21-377a-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iG0txPOfVT2yfB5sxU5X562irZmKR1Z/yy9Ptf1a2XRCbJ3DH11+8x/6jnRoXzG1/knIbp7cGLxaC7+rkuI3SvP2lksboTS3P/VwPKhHDR9LyUwHhlH6rm+YPVgKoLa1RBOpwApfutkr7h/BXNEy8DRg4kbeN6sME/aYCrrsrVcL1tY925H93ivkDV+vIuW6BD+PKlmvV+byLsY56V+5dGAMVvj5FvAqf1Da+xV50JR3eo99V33lCrHDRo7qEKohyiQHyt4aP4/8RzdBHvbOApqqT4Xzst34d9S+pBQgFL7JnyYbEnwN7SukNJhEzphSPAncoHEfsKpfDzwvGWr3EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08HJ77tSgDOBOa1xuE2ClWZn+GiCr8E/WjS3yuoIMEc=;
 b=MN4R8WqVXMB1hXKQsd1YB0sPeaUmb/FB9ZYu8Q5IGTXjzhtktr6zvGvmgz0bmGyEVnZkvSIrNRpdJJihgD9GJAk8ng0HqWAre3a4osJfz+fLcVE3KUjUlJwxKLmclioWc0WuLq3rdT2GxsIXF8xHaH+Z8kuJJ44imM24YTfAjtx+k+zulc0jDjQzLMJtvUIPZYjADfot5QWtagq82BaOWDllKUUZhe6vgwyyLDn1IBZm1dt+TM54evZdA3uCeR3W+VDanOsJ9RCRCPjhnKHVX1TEw77pUJrbPA3LMQ2a3S77JiLGktJl6AQipr5jE6pqfqMkmap8QZEVzXXYLQs2pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08HJ77tSgDOBOa1xuE2ClWZn+GiCr8E/WjS3yuoIMEc=;
 b=TWH6IW91pTbDmsQIhQ+6KXgjqxU8BTtFgKIOmYhMUkRlqWF1hf0EQ2w2ljUjT795bZ4G97UKw4VqqApyT5BqVDRE/X83+jWogKCeuOiToG0kuv8Hx8JpIkm1kDV/FbWYk/6HulJueYlvS34U3Sz8EHHp+vgaom7yDBK1PnYOcZc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <1f35e857-0ecf-420b-850a-e5694bda49ec@amd.com>
Date: Mon, 1 Jul 2024 09:23:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] ARM/vgic: Use for_each_set_bit() in
 vgic_set_irqs_pending()
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>
References: <20240625190719.788643-1-andrew.cooper3@citrix.com>
 <20240625190719.788643-6-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240625190719.788643-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E6:EE_|PH8PR12MB8431:EE_
X-MS-Office365-Filtering-Correlation-Id: d826716d-4322-4dd6-9fca-08dc999ea867
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aXJIb2FnZ0VnMTJBK2Q1dWE0NExzcithM0gwYXZrb29KNlZ4SU9xNVJVbzRF?=
 =?utf-8?B?d3gvZDhBVzJFOHppTjJIV3VnckYzamMwazlvNEhnZE15SXd0ckE5aThjNFAv?=
 =?utf-8?B?TTYrZzJMVGgxbTYrQ0Q5MXRSeGVaR3VjTG82MWJuN2ZJUzB3QmN1WjFKVGJu?=
 =?utf-8?B?VHBTakp6QWI3WkpaZlE0NG1jeXVHRUpFRzFtdG9OYnpqVkJxVGt6SE5FcXdI?=
 =?utf-8?B?K0JFN01oekFRWGhoUUdwdmdGWjRwWk9QN012TTIxUlhxYnJOOTdSUWVjZUM1?=
 =?utf-8?B?OEsrL3pTQ0RjZ2ZlWGpqYk9IRmlhYWppRUczR0IrUVpmN3cyL3JuOVVtNWdl?=
 =?utf-8?B?NFdvTENwcjJKUWc0Z2F0MVRPOWQxR2tuZzkvTVJkcENRbGdibEt4WHlxay9z?=
 =?utf-8?B?S0VLWDJ4MUQ5RFJES3VPTGlybUt6MnpsT29VUGFjNDhQdlpYbDAwSkpIcGhn?=
 =?utf-8?B?MGVrYjhJS0NmcGg0djQvU25pYVhiQmZDdkZHVFFqWGRXUzBrZ1ErNnZJQWg1?=
 =?utf-8?B?R2d6S0VmUzdiVWxOc3hWZFhkakp2QjlpblYxVnVPK0drV3BBbWdpZ2FWT0NF?=
 =?utf-8?B?MHFhYXlnZFBnelJmdTl4WmgzaHQ2cWU3UlBSR1pHU1hvVFVXZXIreHZFbWxW?=
 =?utf-8?B?T051T1c4VnlUeGFPeGRPTXEvSnVkMWFNRUlsTmR2SW9raVl1VEJIKzMyeW1W?=
 =?utf-8?B?ZjMrbld3bTlCK0RGczljRWpZWFRueGJHclhja3hiOXVpSUxqVTAvbzU5Q3Vo?=
 =?utf-8?B?d1FIVVdDdmtDbzNzcGhYdWlLMjcyekhJcXV3ck80QzFUNk5XVWV6NUg5WXc3?=
 =?utf-8?B?UHdmblFqc3hHWUtOREFaNURjajA4YlY4cDdtcnFjd2JwcnphRWMxSG5jaWxz?=
 =?utf-8?B?aTdUbng5WHN5YkNKcnd1cUdkQ3BvV3ZzRzR1MXFESTFzZlRSRTNhTVVrSzFo?=
 =?utf-8?B?V1VmQm03MStKLzZ4ZlZpNFFHSllSVTdpNTZIWVZ4UmNFclliOGhuN1VZTzVX?=
 =?utf-8?B?czgrLzdLbXRFeUdNUU5tcTd4SS9oMTNoNTNKdWFKa2J5QXNsYUtmQVQzbkR6?=
 =?utf-8?B?dlZRZENzSXVHdXlwZTUxZXd6bWdZMzVwWXBOVTR1N0diU2pwQUl2Vkk5WVlo?=
 =?utf-8?B?UDB6MkxpempGOFQvRWREbTYrWGZNWEpWeGdYRFNTd0J5NHk4ZWpZM0t3NEF2?=
 =?utf-8?B?MlM2M25jS2VmNzVMSUpuU09KeEdKa296aEhrbHd1MUYvdkVISGtSaldGdDRq?=
 =?utf-8?B?eEpQY0g5TFEreFhBcFc0RHFHVTQvT3ZvQTE0Z0daZFhVbmxOTnN2VWhabExr?=
 =?utf-8?B?K2Rwd1pRTWFMOFdDS01WZFdPZlVoa1ZLUHBnVitOc3RWRE1hQ1F5b2F1bXRT?=
 =?utf-8?B?QldoeXVpZVFtakhQZDVER1U4NWRjZjhWOUxTVWRwYjdNdzg3UkJoT1ZDbTF0?=
 =?utf-8?B?R2gyRXdSa0tsRm5VcmR1L050eUwxY2ZiMVVOMHViYmJvWE1HS2QvMlgyaldH?=
 =?utf-8?B?S2VxSzZuQ2tRaThWYjlwWng0WkxoUW9YbWw1MjRFbnRjeklEenc4Y2ZmNzFC?=
 =?utf-8?B?QWJoZzd2Tk1VUVJnM1REQ09FQVBnUmFwQXpGT1NRTlVja1VvMmNjcDFVTmJO?=
 =?utf-8?B?NTRjREU5NGZRQmZpTUs1UE9sQWpIZG5rcmg4NXF4K2FoVU5pUUZvWFRwbXdE?=
 =?utf-8?B?U0hnMXVJWEJWTHVUVjUzQlZMc1h6aUN0Z2xaVlRIR0VZeGk4U2hXcW9tcGRB?=
 =?utf-8?B?bm12UUpxamgvd2hzUjhma0xIbG1nWnZGem10K2JBeGVOdGpucnVBcG5RUDVu?=
 =?utf-8?B?WFBCYlVvN2dkbUVrSGFaUnhSSUFSa0ttbXlPYlplTFkrL01IUkpkaVFmOXVC?=
 =?utf-8?B?NU1HUUhxMVVVc1hTQlEwZlg4bDhKemxaTDE4VXhMZU1weDkxdEtCMFVFOXlz?=
 =?utf-8?Q?kt4WTEQRqp2tYj/fBJC8TCMVEOjAdNiw?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 07:23:08.7451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d826716d-4322-4dd6-9fca-08dc999ea867
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8431



On 25/06/2024 21:07, Andrew Cooper wrote:
> 
> 
> ... which is better optimised for scalar values, rather than using the
> arbitrary-sized bitmap helpers.
> 
> For ARM32:
> 
>   add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-16 (-16)
>   Function                                     old     new   delta
>   vgic_set_irqs_pending                        284     268     -16
> 
> including removing calls to _find_{first,next}_bit_le(), and two stack-spilled
> words too.
> 
> For ARM64:
> 
>   add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-40 (-40)
>   Function                                     old     new   delta
>   vgic_set_irqs_pending                        268     228     -40
> 
> including removing three calls to find_next_bit().
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


