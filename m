Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NryNK2lqml6UwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 11:00:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 431C721E56A
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 11:00:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247534.1546109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyRyP-0005gH-DT; Fri, 06 Mar 2026 09:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247534.1546109; Fri, 06 Mar 2026 09:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyRyP-0005ep-A8; Fri, 06 Mar 2026 09:59:57 +0000
Received: by outflank-mailman (input) for mailman id 1247534;
 Fri, 06 Mar 2026 09:59:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kfUi=BG=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1vyRyO-0005ej-IV
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2026 09:59:56 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37f04371-1943-11f1-b164-2bf370ae4941;
 Fri, 06 Mar 2026 10:59:54 +0100 (CET)
Received: from BN9PR03CA0433.namprd03.prod.outlook.com (2603:10b6:408:113::18)
 by MW6PR12MB7088.namprd12.prod.outlook.com (2603:10b6:303:238::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 09:59:47 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:408:113:cafe::17) by BN9PR03CA0433.outlook.office365.com
 (2603:10b6:408:113::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Fri,
 6 Mar 2026 09:59:47 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 09:59:46 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Mar
 2026 03:59:46 -0600
Received: from [10.71.193.38] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 6 Mar 2026 03:59:45 -0600
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
X-Inumbo-ID: 37f04371-1943-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qFIRSb8dOb6VtGdXUpOdD7jrgdiAyBPknFGz/gpKUW7+Xg613+WPw2DdLQNdAYOidBUnkS2prE0r4tj/pDnxd5/M8dBqCY7lbnz6V41H7zmOZ6OOuAuINACrJKB+NMXA3QyAAAV5OFJELVrdx2nTVO93NYkbS6dok1SJJatnoZFv7+PZ/+O07sqiyTH8M/dycEN9yiWKH5Ri7AIPxDpSXwSP+KmLPmbAniRObK5b2ZqS10bSqr8r80M9CxLyVLDwcMmJsk4mJ6hKNOfBMSzwjjHR3/oO6Og8Taj23uO6uPBz6GPOua9T36kik2KE37Gzowwax1KHjeLDMoB3pQq2JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YV9g7yqxFPl36v3hNmUDn+Q7GAWHyxK5zVvi2luVp54=;
 b=jw44Osxk92Ee1Vg7zbFpnnOkcc3+Z99TVvSPs22zjUaZ68/8cQYruN4ypL+elDiL5O+xxYDaD7poc+dQpzy7vDkmpMUZS0VcxYmaeXXgSHGqCdwOeLqsp/bp+YW7BbKBGsSXsrWoZ7y9vB9xz6vbGmv4XJK9RvQFMYkvigs6scKSHzZrk+h6wgWoYS88ctpJdXIrrpE3vwWg6gd4s5PQ4lP/RNQzfRwCP7Mo3xesaugFL8ePkYhH7ff6eXpo1xUAo2QjH2Au6+5ESimBwHxr1tYZXV4FzIGJ9bnwVSJ7wvEKOk6veXQi8NHacssCkj1vY2QtfHsRsY2Gz90En5bGSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YV9g7yqxFPl36v3hNmUDn+Q7GAWHyxK5zVvi2luVp54=;
 b=amF+t4T1YeiEIX2xKPkxeI77IoKsCO1BWGt6dytJRdlLudi7kaxfqGIyXop4Ga9fQmrFCXbn2SJXbU1FbObPIAb6vHsiJOJb4zp9HrJGkf9lOW3U+JYHjXLFxUYdwop7+S5mNXRHpFqdDoBmVCYcZrP4aACtbjZOy4x0aj2tBwU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <a28b7631-f760-44d1-ae66-3f957e9b04b5@amd.com>
Date: Fri, 6 Mar 2026 09:59:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] arm/gic: Optimize lr_mask type based on GIC version
To: Andrew Cooper <andrew.cooper3@citrix.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260305195745.2595017-1-ayan.kumar.halder@amd.com>
 <4d81d177-f1ce-49e6-8a40-fd16c0b4e0b9@citrix.com>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <4d81d177-f1ce-49e6-8a40-fd16c0b4e0b9@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|MW6PR12MB7088:EE_
X-MS-Office365-Filtering-Correlation-Id: 904d0655-39d5-4101-3659-08de7b671950
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	UOZEYcZvcHZJkq1Cj+5RkdSldx9NvVcb+0f16/ZJZMpUyWNWFqyAxCjfN3iY+vOyoaiXvg7ooZ51CJrExJ03GDVSZOs3m61I1P/ArLnz9KBFlmU94i7x3190S5HD9YhZwjJJTGWdOOnLNsIY1OVJxdc+FWx78PJoJ/y4L1KB3L2bwSyuMKpqDS5UmUlwuCwT8vNDRW3IDQBK1ivI/01nkKdl8cEIpa+Xx9IhNLqufxsfZur7suarSiytzTJ1DpftpTg99muJo4m3BGf1vjeQwaBAiD9BtX76MaWLpfrdrF06oj9lRTop2Ggr+ipj31IgQ5+GXI/hu+GI6D1Jv+NFArQ5c0cVE89sx5nr48qUeqVr/B31kwR9auTsXQ0IM631mAVuUa/7CxRVlbAhnotKXmWn+c1mQ1LoVSXKRlF/Hw5q36JX9fqizTTR3RB8IJOomUcAvjdqgoxqB62IHjJWkQSWskTCjPeC9dg5yvGnH4Z9E8kOa+jX0USO+k8OW5P031lkatI6EFHPqut4KINkcm3aGyQOlLR2s+BGUCwF3zC2xbAoA5RCew0RYuchoNVIc2uzXA91yvD3iiKGiD93mRNCQDPEsUN956jINdBQyAZb6AZqqKpxBY9dwKfIicnpdG9808ZClKsFcLECAVMxSaNlkJ/ze2gXfn5PbT8ALLoAPpbwQasrfJlUg8qQjXNddJ/qEI1Zjqd8ENZdrSMbcrHw14/MUtMWJbvxl6Dj0vHhN+9bha0eGkC2eN1HAnFKeqdBVQ4fRGyVJq424MPEOw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uh65oRktFDWH0LCBwlAYQTiWWG1VXDU3L7Ik9hxztVnrD6QLgsnvlFUH/E0eYLsJMhfedFLz5JjOazGwcEt/IbpONAt1ejhiBgrcy++k1eKC+a+duLl6LSLsIwQy5I2XWMvyazdQiBvkE5XzYk3Ei3T2QT+bhu4JwH4Du2I5Vo7Ml9NsQ2I62nwHOgeJ24C93RjthdxWh0tjxKSeeho3OD3IfnU7Z0NbUeipSlvgUGu8didc4l3ltR+Vl7Gk31lWNLyiQwdEJxIV68wTY4ADPvz170TE9mIXXgGE5TzECFphx5w53tBxY6HJ8V9TFTVWXcBevcmGCtORjY+LE4004OEtdoxn9rFZObVCA15h9qG1bYXARRC/SM9hIhs4yXFZU6R7G/fugPM6X0UwdU2MM1qT0kGd+VoMPY9Az9cerP78SoRh0KekgVvu8LbTlIlJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 09:59:46.9301
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 904d0655-39d5-4101-3659-08de7b671950
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7088
X-Rspamd-Queue-Id: 431C721E56A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:ayan.kumar.halder@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Action: no action

Hi Andrew,

On 05/03/2026 23:01, Andrew Cooper wrote:
> On 05/03/2026 7:57 pm, Ayan Kumar Halder wrote:
>> The lr_mask bitmap tracks which List Registers (LRs) are in use for
>> virtual interrupt injection. Previously, lr_mask always used uint64_t
>> (8 bytes) to support the maximum number of LRs across both GIC versions.
>>
>> However, GICv2 and GICv3 have different hardware limits:
>> - GICv3: ICH_VTR_EL2[3:0] encodes LR count -> max 16 LRs (4 bits)
>> - GICv2: GICH_VTR[5:0] encodes LR count -> max 64 LRs (6 bits)
>>
>> This patch introduces conditional compilation to optimize lr_mask size:
>> - CONFIG_GICV3=y: Use uint16_t (2 bytes) - sufficient for 16 LRs
>> - CONFIG_GICV3=n: Use uint64_t (8 bytes) - required for 64 LRs
>>
>> With this, parameter 'lr' in gicv3_ich_read_lr(), gicv3_ich_write_lr()
>> cannot have a value > 15. Thus, it should not possible to hit the
>> BUG() in the default case.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> What does this actually get you?
>
> Because it doesn't actually eliminate the BUG()s you reference.

As lr is obtained from lr_mask, see the snippet from gic_find_unused_lr()

         for_each_set_bit ( used_lr, *lr_mask )
         {
             struct gic_lr lr_val;

             gic_hw_ops->read_lr(used_lr, &lr_val);
             if ( lr_val.virq == p->irq )
                 return used_lr;
         }

If lr_mask is 16 bits, then used_lr should not exceed 15. That is my 
thinking.

>
> If you really want to go ahead with this patch, then make a  lr_mask_t
> or the right type and don't double-code everything.

Ack

- Ayan


