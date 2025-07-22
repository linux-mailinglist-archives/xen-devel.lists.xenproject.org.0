Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4605BB0E78D
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 02:20:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053161.1421933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueNDJ-00075F-5c; Wed, 23 Jul 2025 00:20:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053161.1421933; Wed, 23 Jul 2025 00:20:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueNDJ-000726-2c; Wed, 23 Jul 2025 00:20:05 +0000
Received: by outflank-mailman (input) for mailman id 1053161;
 Wed, 23 Jul 2025 00:20:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YbeQ=2E=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ueNDH-0006nl-UU
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 00:20:03 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20615.outbound.protection.outlook.com
 [2a01:111:f403:2009::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c62e5c8c-675a-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 02:20:02 +0200 (CEST)
Received: from MW4PR04CA0178.namprd04.prod.outlook.com (2603:10b6:303:85::33)
 by DM4PR12MB7717.namprd12.prod.outlook.com (2603:10b6:8:103::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 00:19:58 +0000
Received: from CO1PEPF000044F8.namprd21.prod.outlook.com
 (2603:10b6:303:85:cafe::e) by MW4PR04CA0178.outlook.office365.com
 (2603:10b6:303:85::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.30 via Frontend Transport; Wed,
 23 Jul 2025 00:19:57 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.1 via Frontend Transport; Wed, 23 Jul 2025 00:19:56 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 19:19:55 -0500
Received: from [172.18.231.84] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 22 Jul 2025 19:19:55 -0500
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
X-Inumbo-ID: c62e5c8c-675a-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y1P1kztIE8RBZYGJnavNgwqgg/PFOKKrQWFCyy3IscK3dU0ZB/fDj866voUdZvOHolXRcAyu3Z08FvIAMaQZRoN1FZslzmbgLX167ic3OfjUaGox3KQ8i8a2Ql8Ewx1b1XsBFa8JFYG1t1t/gJhGY+XAsymU2jwhL2lP+A4L+76rSiu7dZrUo24ZSOdEJqpvtyG77vIKdGPrvHOuo9AiXSMVcTnsrx+/kMF1sjIfL/gM09Njz+PPgsIITUNqyKIf9f3ylagSV4FKuTzhkHuCk1OC7YvQMhLHJ+xrqOyW3PfPuP5ZvfspKMCdIOUr26K4uiwcMfZ8pbB/0nTFadG74g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rYOOPYe75bzyjMben7td9EgcJZLTONVUqCdKjO62jUI=;
 b=d7WSsF0sRBUxtc/feSvxg0+znLkisYZVzpH/aCOGZfG+wNk88/5DfALCkxNJHNV7LsgwTCPl13UsYKr1CKdZja/yADhsfbucvtGISATDYQ1eKKA9RazRUfRzJRTqLxFbUfH+nI3J9DvdJPzgn5u+ztp6sEYrSVMBRHZv9Ol2at6TQRRkXDY/U5+uMLYpUdlx2mmpQgzJZ1KI5QdUj7jbmCnx+oEN0LYGEElHQEMVDwYoJFpchvAww3/II51adPCSJhRlBU18UIASwiV9NiEGOd3/zvVmrAwrr2ikTfqq+Ep17r0CUlLSrZu9xjyXeyrf20pJL3PepcxNR9mZkjd5Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rYOOPYe75bzyjMben7td9EgcJZLTONVUqCdKjO62jUI=;
 b=i9jZbJb1Cw8nLUX8grzq6YdAVEmbOdiSAoWizoP0RKmFMBjSJGwD56G/LLSjtvKd+HdR0pBRq3H4gGNUYXb1WAh5v+xz8KLVIPfj5qUB6wMeddt9VQLIPsygMb8iDtrM5wQUchqPzYNpXqkrgVpEJkEkN32dqd8EsERjigVhgBk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <8e31d4dc-9f20-4af2-a814-d59a40e69fc2@amd.com>
Date: Tue, 22 Jul 2025 08:09:42 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] xen: Add capabilities to get_domain_state
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>
References: <20250722001958.174294-1-jason.andryuk@amd.com>
 <20250722001958.174294-2-jason.andryuk@amd.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250722001958.174294-2-jason.andryuk@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F8:EE_|DM4PR12MB7717:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dd593be-efbb-442a-e619-08ddc97ea775
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U3NFL3VqSWd6RStmUVhNRTNiZURSNmQ4ZC9KSXVGblZKQ1pUU0FReE9IRWF4?=
 =?utf-8?B?UDFTaXF1QTFMVHdQSE5ubXdNTlI4cXI0V2FOdk1TMWJKcWZKVzdiYml3aENz?=
 =?utf-8?B?dW4vMGEvaEVIQXZRR0NEZHA5KzhYR2RYYmw2cUxtbFMrT3NWMy9ISTBmbXNo?=
 =?utf-8?B?Y01ldGgzeGYvelVESng0cjBwdnJta0dKaXdnK0ZUcktZRmdPN1EvTUliMWdR?=
 =?utf-8?B?UzBmVG1SZGNIb0s0dkZhUmphRnZVY0p4MXRBZ0J5K25aRDBSR3V6V0NwOUho?=
 =?utf-8?B?aGNnZmVlUlIzeHFTYTJOamd5Qnhza3haT1ZXc0JDdnoxcEJjYy9sLzNLaS9n?=
 =?utf-8?B?MTF3ZHNabXlQMHFKb285SUFndUV2cGwvNjVEZ1JyblEvaFVwSU5LYzdzMDV5?=
 =?utf-8?B?djdvZHJWSFRRNGowY0p2STZlbGNhYzBjb2RWTysyeGJDL2hNR2FYN3ZVa3VJ?=
 =?utf-8?B?RW1nSXRiMTlyRU14Z1FKM0VOb3dIb3hMRXVRa2ppL2dlR2JXMXZEMVhTWkpa?=
 =?utf-8?B?SDAwZFZheDVXeW1sa2t6aXBOMzFMYnVVZjZFc2gwTC9NeFk5bWpDM1BLTDdu?=
 =?utf-8?B?SE40aUpTUm1aM0h4KytjZFVzNzJXYXZFWm1wYk5JbElxT1FKMWxMeCtJaVpX?=
 =?utf-8?B?VDRVZmhkU3VBY3Y5YXZjZmxzbWtqUHVseDk0M0M2N1k5V3dSK3o4ZzRqc3Nn?=
 =?utf-8?B?TWgyQnRaaitGR3dzSTNGeUhITHpGSGsxNlM1NUFiclJQbWt4WjhUU1lkODN6?=
 =?utf-8?B?L2FGRElTQldqUDlHeEZsSzVnQm5ZYXRIOW1mM2NMdktYU01hYVFtc1dhdXF6?=
 =?utf-8?B?TGtZVzhMeFVWdVN3UHlMWGRDc3dLb01uWktUZDloSVB6cTF5cXlKU081VlJx?=
 =?utf-8?B?U3I0aEk2bTJQVENwZ0lGb3ZxY3FJcXhQK1R6M0p6RXlMSDd6dmZzSzlRNklB?=
 =?utf-8?B?N1R2THpUck4rc0xLS2d1dlN6S0FiQWNFdjUyK05DY1B2V3k3UXA2MEVRcXVo?=
 =?utf-8?B?NVhjalhZa3JKQVpTWitpejZBcVc1Rk1qbU50VGZYN0tOb0pYa0NxUzB4YTF5?=
 =?utf-8?B?UlZHV0pWRDF2dFdNYTMyZzF5ZGRKY3dKQ2Rvc2ppMnVPSmpHUVFCTmNLdFpm?=
 =?utf-8?B?QUNEdUdMYnQ2Ukd2c3ZhZDM1eEI4bEk5WjhzM0tRMDM4ZHZxUzQvaEZGdng2?=
 =?utf-8?B?bUVNNUswWURPZGV5WEZ2VnRqNXp0UU9tOFRqOFFJVVMvV0Z1Nk14SVVEWU1m?=
 =?utf-8?B?cUQzeWtjMUY4QlBCdXNxVkY1VVVPcTRWUlYvTWNuSXA3TzVSeVBKK3lBRFdD?=
 =?utf-8?B?a2xVVWNxc2k5TmpIUkJRV1Q4OFYwYnJoemFKemF0czFrb0YycWRRTDI2cDI4?=
 =?utf-8?B?cnNNZkdUaU5Ycm1sTEw3WGttcTlyS0lYWjI2bGJJZjhqT1VqSVAxQmRBM3M0?=
 =?utf-8?B?R0lZMGZobWgzV2hDK2hxUlFQV2ovMFhYYkFJTkFSZmJRK3RzdklPNDVOMlpP?=
 =?utf-8?B?VkhGUTZUTC83UkNJRVYzbjRNYTZuOXE5M245aHpwejZseUk3bHZxZHBEZVJF?=
 =?utf-8?B?K3lSM0phdThCNDFTTkFNV2NHQlZZMFdZUVRjRmRicGRieHQ2ekpZMUNLNW1t?=
 =?utf-8?B?ODlaYTJFa2NmSzJEMnVJN2RoRUpNTVZRcDFSM1ZKTTdPN0hLVjl1Y3YySXkr?=
 =?utf-8?B?KzRhdGZZQXh0Q24vSmJkZzg3Nzl0OUFseUN3UWpHWDdNY2VESWY4WUg0Q0lF?=
 =?utf-8?B?eHcveEh5bnFjejV3c3RmS3l0eHp6MmNEb1p2QXcxbXk1VmdQR0YvdmttUDNR?=
 =?utf-8?B?b1pHTHVyUEVOMTQxZnoyNlZqSlROd3NTeGR2YW9uMFRKd1o5YS9DNjlhZ2Z0?=
 =?utf-8?B?RkVVQmpFb0RRbE5LMVNSM1FvL0VRTmI1KzdTMjZpaHo4MkhjT2hYak9tWmxy?=
 =?utf-8?B?TnI3cS9BMmlTaGRuQk1nYWFhN0RhSTlRcStpOWV2UjhCYUEvcUNRSVhhQW9k?=
 =?utf-8?B?Qy9va3R6OVNFcXZoRGtpQjJXWlVwZk9yQzJnYVZzMjhETk5aV0MxVFlQbkVL?=
 =?utf-8?Q?dadNSQ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 00:19:56.7716
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dd593be-efbb-442a-e619-08ddc97ea775
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7717

On 2025-07-21 20:19, Jason Andryuk wrote:
> Expose a domain's capabilities - control, hardware or xenstore - through
> stable get domain state hypercall.
> 
> The xenstore domain can use this information to assign appropriate
> permissions on connections.
> 
> Repurpose the 16bit pad field for this purpose.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> Reviewed-by: Juergen Gross <jgross@suse.com>
> ---
> v2:
> Init info->caps = 0
> Remove stale comment on caps field
> Add Juergen's R-b
> ---
>   xen/common/domain.c         | 10 +++++++++-
>   xen/include/public/domctl.h |  7 +++++--
>   2 files changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index c347de4335..bb33b1f1c7 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c

> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index f1f6f96bc2..136820ea5b 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -1269,8 +1269,11 @@ struct xen_domctl_get_domain_state {
>   #define XEN_DOMCTL_GETDOMSTATE_STATE_SHUTDOWN  0x0002  /* Shutdown finished. */
>   #define XEN_DOMCTL_GETDOMSTATE_STATE_DYING     0x0004  /* Domain dying. */
>   #define XEN_DOMCTL_GETDOMSTATE_STATE_DEAD      0x0008  /* Domain dead. */
> -    uint16_t pad0;           /* Must be 0 on input, returned as 0. */
> -    uint32_t pad1;           /* Must be 0 on input, returned as 0. */
> +    uint16_t caps;
> +#define XEN_DOMCTL_GETDOMSTATE_CAP_CONTROL     0x0001  /* Control domain. */
> +#define XEN_DOMCTL_GETDOMSTATE_CAP_HARDWARE    0x0002  /* Hardware domain. */
> +#define XEN_DOMCTL_GETDOMSTATE_CAP_XENSTORE    0x0004  /* Xenstore domain. */
> +    uint32_t pad0;           /* Must be 0 on input, returned as 0. */

I have wondered if we should use some of this padding to start returning 
the valid capability bits.  When the hypercall (and library) will be 
ready in case the number increases.

The other alternative would be to return the bits in some other call, in 
which case this one would not need to change.  And returning the 
unchanging valids bits on each call seems unnecessary.

Regards,
Jason

>       uint64_t unique_id;      /* Unique domain identifier. */
>   };
>   


