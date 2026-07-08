Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gNWvOVwTTmp9CgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 11:07:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 741CB723753
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 11:07:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=hu3tdCtu;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1356690.1611235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whOEs-00006P-Ph; Wed, 08 Jul 2026 09:06:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356690.1611235; Wed, 08 Jul 2026 09:06:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whOEs-0008WF-N1; Wed, 08 Jul 2026 09:06:42 +0000
Received: by outflank-mailman (input) for mailman id 1356690;
 Wed, 08 Jul 2026 09:06:41 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ayan.kumar.halder@amd.com>) id 1whOEq-0008Vz-OG
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 09:06:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whOEo-009DIS-V6
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 11:06:38 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6a4e130a-2eae-0a2a0a5409dd-0a2a450aa240-38
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 11:06:38 +0200
Received: from [52.101.57.53]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6a4e131c-e40e-0a2a450a0019-34653935216b-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 11:06:38 +0200
Received: from BLAPR03CA0112.namprd03.prod.outlook.com (2603:10b6:208:32a::27)
 by PH7PR12MB7428.namprd12.prod.outlook.com (2603:10b6:510:203::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 09:06:31 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:32a:cafe::8c) by BLAPR03CA0112.outlook.office365.com
 (2603:10b6:208:32a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Wed, 8
 Jul 2026 09:06:30 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 09:06:30 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 04:06:30 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 04:06:29 -0500
Received: from [10.71.198.170] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 8 Jul 2026 04:06:28 -0500
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RKbza9WoJxPBVBZ86/fIWDlcKc7NBJFs6P2kl+0t1xDTBM4aa4nb93iByvRSza0W/xu1YZMuTfg7LyEez1Mlqj2oT9bHUsWfj9dmn4hgPwEh3eNW9psTi1/HGMtI2v52FohnUrdN+G/6WGvGMgKUpPCpl63hrXripz5F20ToRojDmh8vPFE7Ywbf0clIeiUcpAYz7O0I+dy2CHQmrGrl17KlBjurRsjmJXtOigYCTbQNt4Tlih9ceJGZawTVAE49AETG0XMyQTo+oRKGfncTV94SMkyAHyb6rPikSBvT9oPErpIC+JY3AqT2FxjSZ4FWbvi4BSJs+o4ZatKqhIE6Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcNKVrYsl3s9tz6Ol52S5/2c325b4b5xNy65t5Q2OLc=;
 b=ypU5apBB6RnaY9tPqnjwVPNpn3T84oozxK9PbpWuGX3EVOewZtqFThRv1QYMmIzUG9Y19D2lNA+Jj1cyLBOP/FnAqoN7LmPjnLb4WY2tYTyY8xT+5aGRxjLoKkgdu461Z/465VSaYyFdTNXrE625OeHp9OI5hcYqp2oF7+82RpjwVykat+hXKKE91vS+X3FtE2PzyLdFKcuk6QmiKbRPotC7oU6+f7JjOMwBz8VSrQIKt6RnTnoLaFTRPXEYxulxm9SGm4OLKLRcAAh+UU7M5lD1jxGvoLwm1jlUNg6LCD6GH3CGBnxYpvPEcxB0XTfda6uAnCbZncu83VHk0dJ6YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcNKVrYsl3s9tz6Ol52S5/2c325b4b5xNy65t5Q2OLc=;
 b=hu3tdCtu9kcweucn0So+hxdPIHq2aYekh5UeamHM9lhzK8wBTcAKf3BKBS3gxvC7a4WPeM+zNjeRI2S0FHxTMbrh9ep15ich43qy9bAdIeTWYzvVVGvOJYNPSYBrB+qqU+oLWkKp3N/vjTSIjvfjF4ew1biZ25toKuo0GaiDQrA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <197f5208-b9ca-424d-a7e6-0b872e6511f1@amd.com>
Date: Wed, 8 Jul 2026 10:06:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for-4.22][PATCH] xen/arm: Fail domain construction if a
 secondary vCPU cannot be created
To: Michal Orzel <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, <ayan.kumar.halder@amd.com>
References: <20260708074919.33381-1-michal.orzel@amd.com>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <20260708074919.33381-1-michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|PH7PR12MB7428:EE_
X-MS-Office365-Filtering-Correlation-Id: 787c9b82-8cf7-4f6b-8653-08dedcd03352
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	14TsYVlJbI71KBndwwQLt2hnP3eij0ptuXXwFq7+fggmxqouy/IxQZcPe79r7E2tpRwCfJ1+FVJz+co56hWWoDEjHdL2ECsbSQ4yPqKljPCCsyei8jsoksVilartlZFyw1rSTDMq8ihPAX8m+CljsnnQV8Xk6TCSBi3iszMte+tEIeynj6/vbmK7k824V+r7+Vtubk55ABhkXsvxzRae0TMYdlDbrHtOAU2KMGS/dR2j8wZPLbCvTBG2eqnpXXNljoHK/DQZ+Nv2e0ureVBdV8tzhAFcMER9iNtlC6GJm56NR2oW+O7HVjdH8FuoZ64hRU/PFgBFcd83Sl5KDI5shEZkGOcmHRVk3tJEDjYnjUumPqiMWEWTEmib9Bv0Wv3/yOksAqMOnHChW8VQE7a5j3qGycZlkj2XY60ia9+CmPLuDkzP8qeFvWZgZqxLt0RFzKqdWO+TKMYkwiAkJ2GkTl+b6kjLt3bMD91coItQpDoi3fntwRctPozA6Ehw+bzrAXvv9t4u89wjUafHzLaBTYNIV1L6L4kSwnNFui0fTuTuA1o/Yaa6rsmsAKPR2yXUXQBqPRf3cvySyz3W5OymB6fP4gMukP5n98mIrvv6j7wyN2ur0Ns8zZh5CTy/ohtOh6y1lTwY0QQRf4A4+JYHJvshcWFTd5mI6dUiEauzCUv8xXEKIMvff4frRGglfqddCGuIA62i2yuA8srV7hoafw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sSa+5hUYaL3lveyAjSa7J6GoCx4kuDeKS0tbSibRfV030MqSczIxeHBE5YVX6CE3cGNnKhT6RKg7zEV41T7DiMZET+YupHffqbIjzo752KKA/1kLnjZJ/g+W78VWl/wP5f4OBqwhfZe/ZM+K4uXRqx4BY0EYO92RkN53hRh1ndqrkuw+sITPETEsJig/inr+XuolOnbmOZCXfCILek7w1i+/4U+ijHt6sF8ZP5c42Nfr4Vk19H/k7yTuXCFGFr6PQF7vjg6bSY2y86xhRUASg6WJUkoHzMfEb6ukqrnkasn4K+9Omfubpo/RvFiPe6eRjaN8CfHg8/rUOnp+zU6+roPYPLJsWhHzSlR43nHJ+Zgpx6najk/0i1EbCgweBH8h3xLO9r1sm9pnHjmRNlC/QfncNvJSAxGhwd4vBAY91OIs7jnHcSUpWAgT0OTumqTg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 09:06:30.5156
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 787c9b82-8cf7-4f6b-8653-08dedcd03352
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7428
X-purgate-ID: tlsNG-4011c0/1783501598-D4D2BDDE-10443BFE/0/0
X-purgate-type: clean
X-purgate-size: 2220
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:ayan.kumar.halder@amd.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:from_mime,amd.com:email,amd.com:mid,amd.com:dkim,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 741CB723753

Hi MIchal,

Nice catch. Few questions.

On 08/07/2026 08:49, Michal Orzel wrote:
> construct_domain() creates the secondary vCPUs in a loop, but on a
> vcpu_create() failure it only prints a message and breaks out of the
> loop returning success. As a result the domain can be constructed
> with fewer vCPUs than d->max_vcpus, leaving NULL holes in d->vcpu[]
> below max_vcpus.
>
> When the guest probes the redistributor of a vCPU that was never created,
Shouldn't the guest check how many vCPUs were created and probe the ones 
that were created ?
> get_vcpu_from_rdist() only checks vcpu_id against d->max_vcpus and then
> dereferences the NULL d->vcpu[vcpu_id], resulting in a data abort.
>
> Return an error instead of breaking out of the loop. Both callers
> (construct_domU() and construct_hwdom()) already propagate a negative
> return value and fail domain construction, which is the correct
> behaviour: a domain that cannot provide the requested number of vCPUs
> should not be brought up.

I see your reasoning.

Alternatively it can be a design choice. Xen does not commit to create 
the max_vcpus that was requested.

If Xen is unable to create any vCPU, it should abort domain creation.

If Xen creates lesser number of vCPUs than requested by max_vcpus, it 
can just print a warning and carry on.

In that case it should be the guest's responsibility to check the number 
of CPUs that it has.

- Ayan

>
> Fixes: 6b0e8e43348a ("xen/arm: allocate secondaries dom0 vcpus")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>   xen/arch/arm/domain_build.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 550617f152bb..b46574fd32aa 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1847,7 +1847,7 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
>           if ( vcpu_create(d, i) == NULL )
>           {
>               printk("Failed to allocate d%dv%d\n", d->domain_id, i);
> -            break;
> +            return -EINVAL;
>           }
>   
>           if ( is_64bit_domain(d) )

