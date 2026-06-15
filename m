Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QUXcH0JTMGpmRgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 21:32:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6911689721
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 21:32:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=DzqKEtzP;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1338550.1599611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZD2M-0003R5-Ey; Mon, 15 Jun 2026 19:31:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338550.1599611; Mon, 15 Jun 2026 19:31:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZD2M-0003ON-C5; Mon, 15 Jun 2026 19:31:58 +0000
Received: by outflank-mailman (input) for mailman id 1338550;
 Mon, 15 Jun 2026 19:31:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wZD2K-0003O1-Mz
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 19:31:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZD2K-007ABX-3b
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 21:31:56 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a305325-2eae-0a2a0a5409dd-0a2a4503974a-8
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 21:31:55 +0200
Received: from [52.101.85.27]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a30532a-672d-0a2a45030019-3465551b0da2-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 21:31:55 +0200
Received: from SJ0PR03CA0053.namprd03.prod.outlook.com (2603:10b6:a03:33e::28)
 by BY5PR12MB4164.namprd12.prod.outlook.com (2603:10b6:a03:207::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 19:31:49 +0000
Received: from SJ5PEPF000001EE.namprd05.prod.outlook.com
 (2603:10b6:a03:33e:cafe::a8) by SJ0PR03CA0053.outlook.office365.com
 (2603:10b6:a03:33e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 19:31:49 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001EE.mail.protection.outlook.com (10.167.242.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 19:31:48 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 15 Jun
 2026 14:31:48 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 15 Jun
 2026 14:31:48 -0500
Received: from [172.21.53.33] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 15 Jun 2026 14:31:48 -0500
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
 b=Q16iGFgKWYQnmdhkXpFJsSS2XvH0MtSS+HJQvKfQzhWSZFVsLHUyvWsHhWDZWIZvMPRZHhayGM/1ijBp4Q2oVsHDJqbeo2hU4ZGdOE5avBSQZJcxXbXDDnMXel7YbfnIAL9Ek7a6TR0wOOe6IcSG0Nof4xcXmXUBvpU8MUJYiaU77O+6RjHH14oHhuXaGZ2i6umZSgfX8R1Vj2c0/oaKr84Kt9rNzk0+0wl5nTXWPQSC+zcahS5BlpHPKe3QXomrzt6EHoRcZKNK6OxMNWhI9UB1qEYTeFAZTLspFQV3xSjQD+QJWK/tSymeCaYPL3oDoy3TSMv154AetUxyok/k+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32/HDYwV3U+rT5UP/W3xk6EvChPv0wrqIhFs5/uVG/Q=;
 b=skoxoBD/s0THAyjJl3MjQ0AAVx9BioTDIpgr0wFAjZflclTYvNXnh2R6kvM8+tRLiXPo9RJeYPM4ZvZ1Uz7YvHH8OkIYATDeJ5eVhkKu9QuC7E6uSsiLz7r2q5HigLiYm0o8Wxf5joOz9F11yPNAlroRedgq9tspbydHNQ2xU67FNNEeSa9cggUya223Xd8Qyd/3gyFKUnrlsK4tULrMB/vTpZ77YX1QPCB55EY2cDwGq3LeEjdQAlLbZxRhkAl4Y4Z59W7BMt2fsd/hp44YYNJV5qkRXe1KK10r5KGBvjal/U4JTPVsuOAXDyyS2jYJ/QOhXTExbvBAmxHBeFUMBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32/HDYwV3U+rT5UP/W3xk6EvChPv0wrqIhFs5/uVG/Q=;
 b=DzqKEtzP7C5NFtQg4/fiuCxVi4PElIWp2+4AsS6NOcS11S6pr6T3+jwGSghGfPgMWwQezEd8bKEtYKS/+D0/43Bo7aW+6bb05uKep1N/Nlzg0e2Y9s2vvA5ZHdyWXOs3Hm+eHjbFpQxQ/fjvWR16Z/D/IawnzehoXoxZ2bPNcMA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <35b84d51-6942-4d2d-ad07-e9d464013ef4@amd.com>
Date: Mon, 15 Jun 2026 15:31:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/cpufreq: fix usages of align_timer() in the
 on-demand governor
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>
References: <20260227073259.1200-1-roger.pau@citrix.com>
 <20260227073259.1200-3-roger.pau@citrix.com>
 <d00f8d01-33c2-4b43-9ca5-c7aa98488ff2@amd.com>
 <ajBFYYY83dmeM4Kp@macbook.local>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <ajBFYYY83dmeM4Kp@macbook.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EE:EE_|BY5PR12MB4164:EE_
X-MS-Office365-Filtering-Correlation-Id: c97d2ff4-b6c5-473e-d558-08decb14be9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|22082099003|18002099003|6133799003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	gCJs1I+Ey/h4Y8PwJMYH0FxZrT7QB6xyozuiUUTBax6vEJWazEpTLRCS/okZw7/AG8V8BhkKvU9wARHlafHvlBR0U3ryC1xqjeJTCjqn+M5dFbGk2yjOXb8LtxSF9t0QlCMXmsae2zFg7TuLZP/ZqwwZcLMgcP07PC6vB9pYhNNVttOqRwFzQP41eWUBm3P1O0o5SO+pN/vlxDY6SuiodmVaqAF6vk9hIauLe8eUkaHTJ3LcoFtjpFzQYxUt2e/yp8kISJ4aH8i03CrcXQXQT0nvoW68/vNywfOQYZdXNRwcnpX15HQwKTmyf/KSl4O+tsyxxB+KoLcN9kPTpuC2KINqsIhbolCLAPbh2Vyfl7PaVAujSWBNYL7jM9dX0tZGgnJwwZt7lMgbU/fuuqNUdgl+r4s/11iDQhgP9PG6R3FFFmNE7K7ZGClrzEqavYFGdDMRELveZvIITSVOqf1sQ2/yZLfxeRbSGS1YNWic1yjLjrrMP7F2fAHJzCYwe525O60BioV9wDJsWyBcGkTq9j9hIunBKW9uKfyLp1kvOje91SMZFzZ5BFtneUxO4eMvEhbFhXFr07Oj0u37VRbycu27yTuQorvaNbMUhrzGVHgDGG2iMGPTNe15KOx4cPS1tk0us3WAVIS1yi8TINQ+vH2Ta2RILTm34a3wOOhHlSbtYIyUZx4VRWUc0Yd3NHXGH2RFAOlNzYaorQLibDu/dTKl97y1CM6CZ9QrWUniaxs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(22082099003)(18002099003)(6133799003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	q6xx96yAbnVNAE+q68ncEmeb7cksbKNcZ4YopT8yrP+RXD5Ey99l3oyshhbpy//NSP50fChdIoy+kZCIS8XqT65ky7kfRAKQ26GrW9pb/Y58Kbs4K06kXqUItRKViVzbSnvcoVGj3WBhyHUJAZ9U/WfifxYjmE5mDsfCR5O0+TVd45mKPr7UXZTJ2sN3TZeFJBKD0wYkRdnYEm0eROBW9bdh7Xxe7+gFUhSnEOrZ8KRVWkO/Dhl3waURcKX6Z5jRTfM2PZkofZopnHn9+RfNMkVDX2Hqp9hcuPNgbo+Kp74Ma2fKGJau02jsi7OPDGn01rNmjh1F2rTZ2DDG4V51g8h15mE1yNUb6/M+n7JGRapUXUpRCGvm6/94vVXS5M/Rn1I/9/ZCN9wnE+hugYUmlAdKVolecE/q0NvwFEds07scQBevUb2fLxGRBiNmOcr6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 19:31:48.9714
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c97d2ff4-b6c5-473e-d558-08decb14be9a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4164
X-purgate-ID: tlsNG-33051d/1781551915-3B56F938-733C8CC6/0/0
X-purgate-type: clean
X-purgate-size: 4008
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
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,amd.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D6911689721

On 2026-06-15 14:33, Roger Pau Monné wrote:
> On Mon, Jun 15, 2026 at 01:44:54PM -0400, Jason Andryuk wrote:
>> On 2026-02-27 02:32, Roger Pau Monne wrote:
>>> The first parameter passed to align_timer() is the timer expiration, not
>>> the current time.  Adjust the calls to align_timer() in the on-demand
>>> governor to pass the expected timer expiration as the first parameter.
>>
>> Internally, we have a report of a benchmark regressing ~6% with this change
>> on 4.20.
>>
>> s_time_t align_timer(s_time_t firsttick, uint64_t period)
>> {
>>      if ( !period )
>>          return firsttick;
>>
>>      return firsttick + (period - 1) - ((firsttick - 1) % period);
>> }
>>
>> The code rounds firsttick up to the next period:
>>
>> align_timer(0, period)          -> 0
>> align_timer(1, period)          -> period
>> align_timer(period - 1, period) -> period
>> align_timer(period, period)     -> period
>> align_timer(period + 1, period) -> 2 * period
>>
>> With the change of this patch adding the period before calling
>> align_timer(), the timer is set for two periods in the future.  The only
>> exception is when firsttick % period == 0.  I think that is unlikely to
>> happen since NOW() will always be a little after the period.  Even if it did
>> happen, the timer would fire immediately, but the next timer would be set
>> for 1 period later.
> 
> Hm, I see.  So this is explicitly done to never exceed one period
> between sampling, even if that implies using a smaller period and
> over-sampling.  That's kind of different from how the other caller
> uses align_timer(), where it's expected the timer to fire after the
> period has expired, not before.  I think create_periodic_time() is
> fine, because it's only the first tick that might be delayed,
> afterwards the next tick should be aligned to the period already.
> 
>> So I think we want to revert?
> 
> I think we want to revert the first chunk...
> 
>> Regards,
>> Jason
>>
>>>
>>> Fixes: af74e3a15a83 ("cpufreq: align dbs timer for better package C state residency")
>>> Fixes: 382b95f627a9 ("Fix cpufreq HW-ALL coordination handle")
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>>    xen/drivers/cpufreq/cpufreq_ondemand.c | 5 +++--
>>>    1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/xen/drivers/cpufreq/cpufreq_ondemand.c b/xen/drivers/cpufreq/cpufreq_ondemand.c
>>> index 537695eaab19..0d94c0e464a6 100644
>>> --- a/xen/drivers/cpufreq/cpufreq_ondemand.c
>>> +++ b/xen/drivers/cpufreq/cpufreq_ondemand.c
>>> @@ -185,7 +185,8 @@ static void cf_check do_dbs_timer(void *dbs)
>>>        dbs_check_cpu(dbs_info);
>>>        set_timer(&per_cpu(dbs_timer, dbs_info->cpu),
>>> -            align_timer(NOW() , dbs_tuners_ins.sampling_rate));
>>> +              align_timer(NOW() + dbs_tuners_ins.sampling_rate,
>>> +                          dbs_tuners_ins.sampling_rate));
>>>    }
>>>    static void dbs_timer_init(struct cpu_dbs_info_s *dbs_info)
>>> @@ -400,6 +401,6 @@ void cpufreq_dbs_timer_resume(void)
>>>                (void)cmpxchg(stoppable, -1, 1);
>>>            }
>>>            else
>>> -            set_timer(t, align_timer(now, dbs_tuners_ins.sampling_rate));
>>> +            set_timer(t, align_timer(t->expires, dbs_tuners_ins.sampling_rate));
> 
> ... but possibly keep this as-is?  Thinking about it, t->expires
> should already be aligned, and hence we could drop the align_timer()
> call here?  It should be equivalent to aligning NOW() to the next
> period boundary, so yes, we could revert this chunk also and
> timer expiry should be the same.
> 
> And maybe we want to add an extra align_timer() in dbs_timer_init() to
> align the first call also in a separate patch.
> 
> Do you want to send the revert, or should I?

I'll send out a straight revert soon.  Additional changes can go on top 
(though probably not for 4.22?).  Thanks for the feedback.

Regards,
Jason

