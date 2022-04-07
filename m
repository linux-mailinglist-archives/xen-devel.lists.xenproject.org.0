Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C63FC4F8081
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 15:27:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300801.513174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncSAV-00074A-S3; Thu, 07 Apr 2022 13:27:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300801.513174; Thu, 07 Apr 2022 13:27:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncSAV-00071T-Or; Thu, 07 Apr 2022 13:27:23 +0000
Received: by outflank-mailman (input) for mailman id 300801;
 Thu, 07 Apr 2022 13:27:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/6v3=UR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ncSAT-00071L-UF
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 13:27:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 739a1262-b676-11ec-a405-831a346695d4;
 Thu, 07 Apr 2022 15:27:20 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-CHl0xR3IPmuFYhT2BynHxg-1; Thu, 07 Apr 2022 15:27:19 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB6321.eurprd04.prod.outlook.com (2603:10a6:208:143::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 13:27:17 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%5]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 13:27:17 +0000
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
X-Inumbo-ID: 739a1262-b676-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649338040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BQOVcAGYC8ddiE2/MCQ8tM4DG8UY9B3n/ZS2T6mggZk=;
	b=b1kg0AmOV3JxpmQtAZdgM8eNGCDRxlD8GdA/xNFfqhHJD/koz82MjZVBf5g8ZAh5cuW+eP
	Ta0zoYAx9CiE/XEucvc/XGc14e4B8VYmrlDZ48y3rCfx0YDnVkLzlNUZTnjMKNHvHE23cE
	YDT82M5yjo2sdjxhBQPKTIVPy6Bi6UI=
X-MC-Unique: CHl0xR3IPmuFYhT2BynHxg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MVkMqapOCKKFj63UAk8SxUcqXarXyPm3/0vgizDxwoufv9Hp1bvRDPk94WadBLiBuVcIJZdsxwM7Ua67kuhdQdvMUiW4ESIQ6iN4AtegLqE/mx73tomjCpuVUfxF+U0lIBK4M1HqttUBnGqvzSz5EF5ODbgTrD+c25gsdC4DegoJ+TtlTX/tUUetXOArE8LP1v9P1jjgErnTFvbqlhQHACLenxHuqEsX7tP2E+BNsyjteRiEYOSa64/YeU50HYGffJEY4v+bUKqKcM9f59ttSj/Y9oZOLxe5GA1CDLvK2TeQfLq2988bDgH3WhKEQv5x5T2lnnltWTrE1D54+B+DUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQOVcAGYC8ddiE2/MCQ8tM4DG8UY9B3n/ZS2T6mggZk=;
 b=WGgZwX9y05PnDclLpQ7T9/dJP5/OWOPtHGIeEuj4Q8CQGZJJUZ+NEVOZUn1zl2xu7S15GtZnWyeFbpvgtTHEjfldRQ2U6pslWdqqBNFQoorGBMN1BLEPJFOvX+HZ4mIPs1V2WAqmv87Sdl6dfiC0DcUMJz1VvKMNMBF8WwFSoB02kc/Uu8S6BPn5obGZjgGQG1Z/9qAf9QFSZn9o7fZ84C7BMp0M0HAk3vh2q1U/Jiil1Nh2vEAVwJGXwyQdGCHHQrEFAMyVVQ3JR0CIFCDuQY3CSqdbGhAw1jTRTItPVZEFgPpxPc1LvFJy4l9P2PPjcQDCJyXPFMb3yH9yOTCzeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1617b87a-640f-d235-701d-df2c57314b73@suse.com>
Date: Thu, 7 Apr 2022 15:27:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Olaf Hering <ohering@suse.de>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: make "dom0_nodes=" work with credit2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0008.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::18)
 To DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb084767-a481-492f-eb9d-08da189a55d8
X-MS-TrafficTypeDiagnostic: AM0PR04MB6321:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB6321BB40A891C0198358BE79B3E69@AM0PR04MB6321.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iuRtJnqYNY6jQX0WBDRlvIFQuJXcAc/O44Bk96r7M16sjTA5CVAu6Q2yhogtQNQD23XyVALUbxCgl0NQ+AkeN2cNb5gqY15Ahjmo53VUnYe6aoZlbOHbQDnb0XQahV5GyMHc4bXBngIx3SXHXyD/5r+9SUsMCbUAUdU3uzWdm7v7v9thG1JsZUlOxacQLR4B59BA/uqSMJSLrTTPRhO6ohian0M79APP/zH5mM4eW9MMHsgtYayVX2uev56f51AaxrBas+445UgHoLN/0yfPVxuHHGKjKOfON7AF8cq6hra6VYUohob4AJLYrh2BkurFyVZSE1d8jafEyBsmoZ75wmKa3u3TE+9WAEXB7DcGRV0nVOJZqBiKI4/lfIJiBQ6BK4y5FGuMCIPShkZSOUUDN1i5QSIaxptKeOunxYM6P2WykkTzugRQDrfvNybYfqdQHSWn1ICyhovZ/+iVQ7NZGe7pN/XOsgL6UbuDlf2XjTVTxwocJOFoH+2vzQesz2L5+SkfY8jh+Z8iG3/nTzkiwVzIZHtnv/nEcFnho73i5pRm4ec4lbvzVNkBGucZujlcpZ35NaZ8Y32o+0T2Ze2vF3pR6HAZZPtPRYAesekjWJsDL08bmWWE/oDLfFlCup6g5H+yKrBqA4oF2KO9gCkOkoddx8r2FdAwhKtL339Mlus6ZOBXogjlHjxuRw9CfINI8HmtTT+Z5AXQDoTpeBRSYhJl4qP36gVPtm3t5f8WPPI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(508600001)(8676002)(31686004)(36756003)(8936002)(6506007)(6486002)(38100700002)(66946007)(66476007)(66556008)(2616005)(6666004)(31696002)(26005)(6512007)(86362001)(54906003)(186003)(316002)(5660300002)(83380400001)(6916009)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2tPdTN4Z0lTdlE4Z0xaSG5kWHVnOUpzaWVRK2xNZUkvbkg3Zk9EMlBuT0JV?=
 =?utf-8?B?bFB2dWxjVjhCNFRKdUIxOW1DdVgxKzBJbnNnd3FxNUVFL1pvZng1ZlB2MVJN?=
 =?utf-8?B?YVk5bFpaYkNIb20wSzZrVEMyWUMrck5FNlFPQTlzSHc1MkcxZUFySW9RYm9B?=
 =?utf-8?B?dnNPYlNXOFYyR0VoaDZiaGk2NUpEblB6TVdrK2I2cVUza0g0QVJPcHFYZmtq?=
 =?utf-8?B?VTRrWmVIRVFiZWw4b3dMSVNJRGhkUmc0bFJMbEdyTTdtb1ZBNlRvcUlUdW5q?=
 =?utf-8?B?ZVg5U09oSnVjR2tiQU8vZzdqbk5FRFZMQ2xSbnBBa1dJemMvTCtsZTRnUGRN?=
 =?utf-8?B?T1BRVTE4U1pEZVdoUzlmUXYydFNxNVJ0SmFCcEVXdTcwVEQwanpoZEl3MTJT?=
 =?utf-8?B?SXczZmEzeGVhY1VjN1h3Qm9oc0Z6YlBiNnBCc25CVFV4S0hFNXV2dmp1NXU5?=
 =?utf-8?B?eDJvRTNXcmdrdUVCd0RORVVzRUJPeE9SWGNvWktNQjZ3ZkhPQ0lzMEFvcFFH?=
 =?utf-8?B?dmtnQUNMWGJVRXpwNDhYNTZzV1Q2d1gxYnpQeXFOb01BNlE2eUg0L0o5aGlP?=
 =?utf-8?B?UkE0Q2dZNTBnTHYwcXo1ekw4bGZIK2VIVEtzYlhZOSt4MnF1YkcxTkxPQkgr?=
 =?utf-8?B?WXdIT04wbVgxSnV5ajBMMTQ5VURBT1JWSHg3MHJRL0cybnIzOGlHbGFkaC9T?=
 =?utf-8?B?WVVhY3VKcVZCdk5HOTNQQW41eS9EL3JvMHdOWk9GdnFqY2VvVGdGUERmSFBB?=
 =?utf-8?B?Vnd3N1dhT0lSUGQydVE5ZDdkL0FQeXl6bDFEUmFGYjlkbjgwV1h0ZXJ0Y0NR?=
 =?utf-8?B?aVlrakkxNUFOM1ZhYmhWQ1V2ZmY3MmlGWUtkQ1MrYTFWTk5aOEk5QVVuaHN1?=
 =?utf-8?B?QVJmQTlVR284R0tTc0xoejNZenNPL0VsSkMrckJmamMxZC9UYjczcFM1LzNF?=
 =?utf-8?B?ZkF0RE1TcThVK3Q4ZmNrTHBIZUFvcldVcmdubnZCQXpuSXpNNUFlT1haSC9a?=
 =?utf-8?B?UDRLWWV6bnFYN21jRUUyY3U2YWRMeG5IdFV1M2NLRFRERXhqVDh0VEo0dXpO?=
 =?utf-8?B?NERkTmh6a1U1c1NEdElBeEgxOXJZRjZjWGQzUCtyZHlGUjdhQVlQS3ZuUWFs?=
 =?utf-8?B?YmVnMkp6Y1lkZVE3MVl2aFF2U2hBaWJVMUtmdVJQTU5hdmNYVVJNb3VoOFJL?=
 =?utf-8?B?L0pkOW83eEg4QXVnUkc0am5SZm9HYjQwQ09iZlp6MEwrNXRtMGg0S3VZeTA3?=
 =?utf-8?B?VlFSNFAwc0QvT1N2OVdHK0drdDFwOG11VlY1RVNzNC9DQ3ZsZlVwaEN6dHdu?=
 =?utf-8?B?MDJDbDNZQkVROHFYcnl6TWNMWDZrNlpiQTlTSHlUZjVWL0FqdnhEM0NOQUJY?=
 =?utf-8?B?OWdrM2FNS0pSMXNOMjR6bUgyV3ZxV2ZkZEVWR2MwMmwrSzA5UmFKbTg1ZVNp?=
 =?utf-8?B?MDhwMEhDNTNiQS8zMFAxeXBxYVhPbVZyd0E3M0ZJVlZSM3V4ckJLaGhCQ3pL?=
 =?utf-8?B?cGo0OERwM2dONmt0dDJNQ0lvU0V5NVo4dHVxYUFBRS9LejgvM3ZydWJULzBz?=
 =?utf-8?B?cVRPUlFOa092Vkp1Q0laZ09kWFlJYk01K2c2cVBUbnhOUlNoT2tlVndJb1d3?=
 =?utf-8?B?VTQvWUNCNlBDMXRIcGNMWUJGQUZTbFVacWpHZERiWGRGcWI4UHFlSjlKWGpR?=
 =?utf-8?B?ck94cFVLRVhTaGIxWUJSZ05LaHVob2U2RThaVWhCcXUwbE14dzV2WnVKbW0w?=
 =?utf-8?B?bHMrMVdONXpnLzhzalJMNGYwTnBwV3dSemJjSHhwS01PdEgrZjgwYjU4cGhW?=
 =?utf-8?B?TFR3QnROcytncWU2Q1ZnNVpQRmM5NDRweVhIck5vMTVBd1loYThXakFmTlYx?=
 =?utf-8?B?Wk1DandwcDArL0tkWk9CbEt0ZXh0UHgrU2VrVWN1VTNpQmZlVlRSeWY4dGZP?=
 =?utf-8?B?U1hveUdua3llVVkvQmFEUGN0QUM3VVdYQmVJZGdrWEZxWDU1Q0pGVlVhcUoz?=
 =?utf-8?B?TXVPTitlN2M3Y21PWFB5aGUxMXdITTZna2U0M2xOdk5US01FUnJqZjZHUmc0?=
 =?utf-8?B?SVNQVWhWdWt0a0laekkxdGU2QlBzSDRGQUovdUJGK2RONVZKSVFwWWF6SERH?=
 =?utf-8?B?L0ZPOW0zbEpSUjFYdWxLclB3a1NtOEs1YzFYTnhETExCeDJ4ZFVGYnJxeWsy?=
 =?utf-8?B?ckJWdGgzK2xvejFGZ2FzMDUyVHRpT0N6bW8zdlN0TThvd2RDRlZ5TG1oQUJm?=
 =?utf-8?B?YmFydnNEU2NsUTNDemN3TlgwU1k4b2lYa0FTY2hWcHZVWUhFdWt5WmpFOEFT?=
 =?utf-8?B?M25pNFhGN2U1OVJHSmdaQWpvNDJmU3pxYlVnSjY1enBzZFR4RjJXUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb084767-a481-492f-eb9d-08da189a55d8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 13:27:17.1905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G0AJPc4/3UqgLNHiUKKerSeJZcay9F9sogIXyS29Nec0lfrzO9uAr2BSptPnie43YXKefzNu7Szoz6S6FZgFBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6321

Apart from setting the affinities, vCPU-s / units also need to be
migrated off of CPUs which aren't part of the affinity. Otherwise, for a
reason I haven't been able to determine, credit2 won't actually schedule
them, resulting in the Dom0 boot process to hang (either right away or
when bringing up "secondary" vCPU-s).

Fixes: dafd936ddd ("Make credit2 the default scheduler")
Reported-by: Olaf Hering <ohering@suse.de>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The Fixes: tag isn't very precise - it's rather the commit exposing the
issue by default. I haven't been able to identify the actual commit
which did introduce the problem; it may well be that it has always been
there since the introduction of credit2.

Credit2 moving the vCPU-s off of their initially assigned ones right
away of course renders sched_select_initial_cpu()'s use of cpu_cycle()
pretty useless. But I guess that's still useful for other schedulers.
I wonder though whether sched_init_vcpu() shouldn't use the CPU map
calculated by sched_select_initial_cpu() for its call to
sched_set_affinity() in the non-pinned case, rather than setting "all".
(I guess doing so might mask the issue at hand, but I think the change
here would still be applicable at least from an abstract pov.)

--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -3403,9 +3403,15 @@ void __init sched_setup_dom0_vcpus(struc
     {
         for_each_sched_unit ( d, unit )
         {
+            spinlock_t *lock = unit_schedule_lock_irq(unit);
+
             if ( !opt_dom0_vcpus_pin && !dom0_affinity_relaxed )
                 sched_set_affinity(unit, &dom0_cpus, NULL);
             sched_set_affinity(unit, NULL, &dom0_cpus);
+
+            sched_unit_migrate_start(unit);
+            unit_schedule_unlock_irq(lock, unit);
+            sched_unit_migrate_finish(unit);
         }
     }
 


