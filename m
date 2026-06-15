Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jk1dJ0c6MGqxQAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 19:45:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E963A688EFD
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 19:45:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b="vJ43lr/K";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1338475.1599508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZBMt-0008Nh-6n; Mon, 15 Jun 2026 17:45:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338475.1599508; Mon, 15 Jun 2026 17:45:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZBMt-0008Ku-3V; Mon, 15 Jun 2026 17:45:03 +0000
Received: by outflank-mailman (input) for mailman id 1338475;
 Mon, 15 Jun 2026 17:45:01 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wZBMr-0008Ko-FE
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 17:45:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZBMq-00DTLi-RJ
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 19:45:00 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a303a02-5cb7-0a2a0a5109dd-0a2a450cc536-18
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 19:45:00 +0200
Received: from [52.101.43.30]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a303a1a-62f1-0a2a450c0019-34652b1e1d4f-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 19:45:00 +0200
Received: from SJ0PR05CA0187.namprd05.prod.outlook.com (2603:10b6:a03:330::12)
 by LV2PR12MB999095.namprd12.prod.outlook.com (2603:10b6:408:353::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 17:44:56 +0000
Received: from SJ1PEPF00001CDF.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::54) by SJ0PR05CA0187.outlook.office365.com
 (2603:10b6:a03:330::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.7 via Frontend Transport; Mon, 15
 Jun 2026 17:44:55 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00001CDF.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 17:44:55 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 15 Jun
 2026 12:44:54 -0500
Received: from [172.21.53.33] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 15 Jun 2026 12:44:54 -0500
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
 b=SztQJkYgErYujOXzf8AglqY/F2/BffSmZk7L9PUl20pfcUEKIQuNu4rc53DwPH/icMMNB+DacEKdbEC+ns8RM1dv656VC/R29Ldhkq54U2I7ES2wBu+9pVvLPUKJHPA7q8DnqPfHBybCvcnfHu8V9Fzn1/co1RpQ2l8eg/4ayYqkl8uPmPp9royY06Dd8BOskpmj+Meojf0TmGExQHDY8NihLVwwgFoh/CtTJvPK2pCevNAl/1DKdCU/MB0kAy4hKXWFryn3r4+sYJ9/qZOdcxIrh6j1zQkWTfh3qqvoHK44EpFlT4np+uWu7XNKnScUN1b5grxyu9nlvzqrxeMAUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDoPIxv9i7O13kXGh5GBrpXz05kp6T5/s6TDbkxue/8=;
 b=b5CeMDNIHGDZzakeoH2GRbHNAmdLZ1nPDzAoCLW1y50gYt5/O40TH5hapOi6LdWFIkbEGuJkEk1M07wrknps1Mr3N4ffXgYwigFZuxeeJ0Qk46V6ii2O6RolotVKcNZjuNNi3bEwKtMQSoMHVd6ddHFmD9jzzVeymPP0tcbcvcnBQxbvuM0T9iuGg6IsTvVJZr35g90ZVNwgGSIiyJ9b4jAIFyYgPvjXnJ+kiRwUqmy/a4IHGL5q4A9G8ABXeTA0OBWDAUmlVVnNuoROaTRKLaU+WigMcwwzviBE720tOtHEwqp4hM3ZzW+cRBiQA+DKfUl5lytcs1z0PpJ0ZM5kAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDoPIxv9i7O13kXGh5GBrpXz05kp6T5/s6TDbkxue/8=;
 b=vJ43lr/KVhHeOZWawEGkTipvuWwMYmaiV/H9731j/G3NBnJrcsnshenOch7xuI29RHaTBzaeNabqfYA3kqofNR2ERYNkM6qIKXzcw7UP70FrV6Qs6Le2/mBt1epQwLMRi7SjdY5P8QwEijZDM1Kcimpal5do1jEH7OzuBccBS+I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <d00f8d01-33c2-4b43-9ca5-c7aa98488ff2@amd.com>
Date: Mon, 15 Jun 2026 13:44:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/cpufreq: fix usages of align_timer() in the
 on-demand governor
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>
References: <20260227073259.1200-1-roger.pau@citrix.com>
 <20260227073259.1200-3-roger.pau@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260227073259.1200-3-roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDF:EE_|LV2PR12MB999095:EE_
X-MS-Office365-Filtering-Correlation-Id: bb9de9e6-909c-4550-25ac-08decb05cfbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/rNZlHyi3HU4ZHOm7VYiYO6hP/VTrgiKR+raL9uYmR/yXN8orxE1MIslkYWTgLlYDmxKY+OaQc6H4TIDcBvZaSLNBgFd2RwQOEG8KjzYCYGK9FgZiZmEb5ShuxhzZuqqRfKhgLvFeGNphLAYv6Qe4CpGtBduZ74W+t6NKy+mg4ubAsiPDZUGXHDFpwn1eOGYhBECPmEW3yTVfCcHR+Ti38MrjKdLZt3kpFp4RMndu8DDRPIY02H1LF4oND+l4ZSmRXory/0EV2d+01zZ4XOx2rlR4APJWNielIBGdqAikT3v+Lu8o925HLtjOVG5wjtjcnRYQ5tvjti1iIB1VlHJGUftRsr5NwjBY6HCbuOCDNAGuAI/MlbOC8d3JL+Vx2vVPcoDAsOmCf/Q4NG5ujal4ELlCXhVh5iT1y0+3i/jIp/xwP5wX34DRoBgSx4/PLYWeYYoPgicdzwSYeBsUom3EN21Oii9y/FcMB+bHeoMXAeFuHJ6P8r5MLts8WX26ecijkgIvWN5Rrrxdw9DMPxKB0UvEZeGTqfY+jGJsWnZgbCbuTc8QD3+DwMJgG0g6UFx/Yha1CO80chCez30UzzBbH+idodf6Su48BDAK0KJS9iK2LXD5SpYevxbij0/HMqtPXBwWtr7gOyrtWhwe13YHrE0hErxDsriZhPs1+Wwct2uld+xHY1Q2Zyu/Z6NVqECqRwnIlqyXRmn5ablUy6xfyExxA+seBgRBnk+SQMXl/4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8oQkASVHnassggRKX5cW6Ii8Ja+ypcUhd2NedQosU3xErUzyObi1Czm8qOsgM4buuSjfxZAPaQe6VZFA54302GeDuKRfrVKI2cR+NrQBvxz9pd3OO24eS8QmTiBOn8nMPwd6d61hvPELNl84bXlINvC8N78RfKlhYyemYQsJrfHArJiFkBomTNuOx/N5ZqS+x+lSMOmwGag84EaaO289zsUnLw84Q0HWg7CjejJotJxwx4jiVd8xn6M9MSEcMgWa9cY65WqyzWU4uPjRETKka26JzhmJWnFTLB2FUBjn8KiRfThb8UVbfMbnmHpq+UqtpTFs/fOrkQk4p4h8XfsaW5yY8Li39/ppIm0wL+YMAgfl5Q4qmkxcoJtnvrZ9PcTEK7JQOOdbvXf0bvRzsI8xi/qBJ15hDATxsu9VQz/vXudYBSxtEd1YyUoDKPFpd6pt
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 17:44:55.2917
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb9de9e6-909c-4550-25ac-08decb05cfbb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB999095
X-purgate-ID: tlsNG-d25034/1781545500-E0159CF5-714F70FF/0/0
X-purgate-type: clean
X-purgate-size: 2592
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,amd.com:dkim,amd.com:mid,amd.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E963A688EFD

On 2026-02-27 02:32, Roger Pau Monne wrote:
> The first parameter passed to align_timer() is the timer expiration, not
> the current time.  Adjust the calls to align_timer() in the on-demand
> governor to pass the expected timer expiration as the first parameter.

Internally, we have a report of a benchmark regressing ~6% with this 
change on 4.20.

s_time_t align_timer(s_time_t firsttick, uint64_t period)
{
     if ( !period )
         return firsttick;

     return firsttick + (period - 1) - ((firsttick - 1) % period);
}

The code rounds firsttick up to the next period:

align_timer(0, period)          -> 0
align_timer(1, period)          -> period
align_timer(period - 1, period) -> period
align_timer(period, period)     -> period
align_timer(period + 1, period) -> 2 * period

With the change of this patch adding the period before calling 
align_timer(), the timer is set for two periods in the future.  The only 
exception is when firsttick % period == 0.  I think that is unlikely to 
happen since NOW() will always be a little after the period.  Even if it 
did happen, the timer would fire immediately, but the next timer would 
be set for 1 period later.

So I think we want to revert?

Regards,
Jason

> 
> Fixes: af74e3a15a83 ("cpufreq: align dbs timer for better package C state residency")
> Fixes: 382b95f627a9 ("Fix cpufreq HW-ALL coordination handle")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>   xen/drivers/cpufreq/cpufreq_ondemand.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/drivers/cpufreq/cpufreq_ondemand.c b/xen/drivers/cpufreq/cpufreq_ondemand.c
> index 537695eaab19..0d94c0e464a6 100644
> --- a/xen/drivers/cpufreq/cpufreq_ondemand.c
> +++ b/xen/drivers/cpufreq/cpufreq_ondemand.c
> @@ -185,7 +185,8 @@ static void cf_check do_dbs_timer(void *dbs)
>       dbs_check_cpu(dbs_info);
>   
>       set_timer(&per_cpu(dbs_timer, dbs_info->cpu),
> -            align_timer(NOW() , dbs_tuners_ins.sampling_rate));
> +              align_timer(NOW() + dbs_tuners_ins.sampling_rate,
> +                          dbs_tuners_ins.sampling_rate));
>   }
>   
>   static void dbs_timer_init(struct cpu_dbs_info_s *dbs_info)
> @@ -400,6 +401,6 @@ void cpufreq_dbs_timer_resume(void)
>               (void)cmpxchg(stoppable, -1, 1);
>           }
>           else
> -            set_timer(t, align_timer(now, dbs_tuners_ins.sampling_rate));
> +            set_timer(t, align_timer(t->expires, dbs_tuners_ins.sampling_rate));
>       }
>   }


