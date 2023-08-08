Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9E2773A02
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 14:03:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579714.907807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTLPr-0000Nv-89; Tue, 08 Aug 2023 12:02:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579714.907807; Tue, 08 Aug 2023 12:02:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTLPr-0000Lr-5P; Tue, 08 Aug 2023 12:02:23 +0000
Received: by outflank-mailman (input) for mailman id 579714;
 Tue, 08 Aug 2023 12:02:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTLPp-0000LA-E2
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 12:02:21 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d23dc5a-35e3-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 14:02:20 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7285.eurprd04.prod.outlook.com (2603:10a6:10:1ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Tue, 8 Aug
 2023 12:02:18 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 12:02:17 +0000
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
X-Inumbo-ID: 6d23dc5a-35e3-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sneue+UY5J8HTHSuni2y+o4Hsz8BYG5who5PLvAhUdd33Bld8LOKC7ruqbJlRNjNaLvR8PGWwzB0oCZRcNv0gjoYeqr2FgfxCVm7c7f0k6nBcQZlXw4nO8kK4VmtYYe2CABHxWxfcAtpDoOx8KygDC3VCYOfgvsVMaN6NcFuz5ysk4p5ZV7lZy94Xs3H1RQVD84epP5hP/WmyGMWDjE1bxi8AbHeT2169MpFKAwci2kOuADUPbE1lW9T6BxZTpZ6+NqkCLlulTXzwXFDjNGUO7dm7hiC5lofkpnWAKp0Ss0NUMxLvm9Q00lMZuEeC8xlqqWCjLpCDLIQb6sIllGWPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDsmnaGASxToYZZz1o3iNQdkmcA5nYpDQhCG+xL1ORA=;
 b=T8vf/wmIe5U2DwfiUQfZ0WmcAMRjjmxOC4oRi0XNuSlQ0tiVgg8Vj4DvYQewjFdlcXoh831pdwl/doUuYddl0tCMYVhH93qEfS36jFrVB5IEnkeC+5h+J0hkEuf4ZFGbqS/emwm0R5kJq/ZDVUNQ4cdlSPyS6vuV+p0sus+dYWxIrdE/v/MeRDK4sswxVtkauHVbLQl4Z2suB/NBJVy04kfgmaOPZS7/ssvOBxtayWy9/dUXQSI77YP8KVG29pBhg6QhM1uhEdz/4JPkzOwf7QUa88aVftzuiFlloHuE8leeFmFoOxvNQEurWfDxLk17igdra+amn9D2gp0ipIxy6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDsmnaGASxToYZZz1o3iNQdkmcA5nYpDQhCG+xL1ORA=;
 b=GKgx4frY/KyieoFM6q/wGk/7MgzhIyD2BhVqdHgoLwGVVOpN7bIAX6+KjNeHY/Q6HLdLKWrLrctsstUo/vr+Ml4GTfjtNYeDSpWotxpdxzDCH+8JynQANhS6NvsGCsd4FrIcmybYN8/NR68xareF5VHQ4vJKVMF8k7HDLBDx0EA8afc8/jBs46IVvjrHWkJ2l699fE4vyHy4RvQOsv18YsbQznIfOQmPyWMzrXg0uYIvJfRN67xOXut5+YsWemmFB/dN4M3LvjGNscUaZ7hshfpxTK0S5gkplTYznYMsfr9HKwlcrBLSssXFh0GfjTa+MWqQwkgt6V+A2CbFU0jlcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b0a49d20-8e82-8264-8241-86a108139682@suse.com>
Date: Tue, 8 Aug 2023 14:02:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] mem-sharing: move (x86) / drop (Arm)
 arch_dump_shared_mem_info()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7285:EE_
X-MS-Office365-Filtering-Correlation-Id: 6605eee5-37bd-4eac-9575-08db98074fda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0NM4se0FX4ZVODYYXkFmQDkmgeH2UpKk6xcCEFyDdRxnc7Zmd+lu9CWVZQcluk/CthHCr+r0BXra5B/lmk+1/AkYPMZIYTTR1NMTwSKdT9cJsniC0tF9veVyaDFhZaDtfeCE61YaqCPumn61QyaCVI6sK75IyN7tMppDu1SFmV5K1tGaTb6hbw8qSiQXvQdYJfRaDnxDWyjxTAHpytbzin550+jy5L2qa3XLFLjpK49ysJULCjlGnn4uQzSES9Dq74tNrTKxWxBklqjl+zFthfrSKhkDvsXfH6PyY0HOW+iCTEBL/ZztVU8WxQKnHBrzKCFB7RgBA7bn2JI6/xE7P6KxNCLHDEYQ3C/1kKRKRInU80bE9jqBiYwJqY8lZDQNiWPwtWqT2SYfUxtkxSfUFfu1IwICx/eW0+Z2axXVibwAOS7sqvYCiSI4YHwA9vnHcU3wSlvq95jE8nvQclJAfi5GjUeihLrhKHLi6pFmxKx+OFP0/U+inm32hxYznwBOuqR7kKqTYWhL4tG4V5X+vyWBL24guJurYsMUgDqJ+fHp6+VjUyFA9v1ABlMk+dtNJXwOU5Zwub7ZiIjVsRUMUVF+asUjIVTxrCaWPH4p11exY6FMgf3UpWNfsyUMzNoc+1m62DF36ZuoCQvkXtCq6A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(39860400002)(376002)(366004)(136003)(451199021)(186006)(1800799003)(6512007)(26005)(6506007)(66946007)(54906003)(38100700002)(36756003)(41300700001)(7416002)(86362001)(5660300002)(31696002)(4326008)(2906002)(6916009)(66556008)(66476007)(316002)(8936002)(8676002)(478600001)(2616005)(6486002)(31686004)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amt5Nzc4Qk1XSHNKd1BFWmNSLzh1TU4vZTdPdEpoclIyL2EzaTFnbHFERVBB?=
 =?utf-8?B?SjBzelhIdWNwbEc2ZnVMTVA5SFJEVzJlalhIeEd3TFFPZlJtdUoyMnZDbFpr?=
 =?utf-8?B?b3lsa2piN0FmZGZWL3JjenRoWmNGQm5WdFNndmhtRVdpWTI2L1dBZFl0TzE2?=
 =?utf-8?B?YXBqdkVIdG5tbE00MWlpT1NSbFE1K3B0SHJpSmE3RjlhYWdjNkljdCs2Wkha?=
 =?utf-8?B?ejZ2dThMaXIyeDRzNlYrQ2xLYjV0RHZsOGI0TXczVmJUVEx3R3luNTdZM2pn?=
 =?utf-8?B?NFVQNG4rUXJnbm41Tzg1RUtvc3gwanU0TDkyd0N3Ky9JU05BelBhWFlKMmhT?=
 =?utf-8?B?bDFNZUVST2MrZnFIUHlwa3FuZkpzMGJrTFE5akJNMklCK3Y3TkEyNHRBYVJO?=
 =?utf-8?B?aEM2dTgvY3ZESVpJSkhwZUxJZFhqVENzNEpUSzlER1J4WjA3RTVFQlFkUnBF?=
 =?utf-8?B?ZEpsdHpKQU83Qmo0T2c2d0RnVlM3SDBHanRJUG82OElzVDZneHJWZDRNcDVG?=
 =?utf-8?B?a2RYRFhHZm5BeVpoTlE2V2RkUjQ4aEVwU1BKYTdQV2x0UzhXemFTejlaaG04?=
 =?utf-8?B?VHBaOFdHdkFLRTYrSWdxWHlQdDEvcDl4QXdwU0JIeHFKMEZZaDFyelUvT1F5?=
 =?utf-8?B?cmNUY2dhajYybVE2VndMMjErMnVZQVgyM3FHVlU2ZUo1MW05TWVDb012MUR0?=
 =?utf-8?B?WGE4Rnpadm5xeG5tc0pjVjFISjJxQXczOWN2aFVnc0N6R0lDNXlqbUtmQzNZ?=
 =?utf-8?B?b0pudEZWN1AzNHZVRysyalM5bnk4bjF6OVZuclh0Y3RaeUxCcnoyTjBjdEZr?=
 =?utf-8?B?YUxjTUJvWXB5UFZER09CcXlpWElQdC9ZVXdnQkpjaWxZMUtmb0lGTndEUnRG?=
 =?utf-8?B?Z1cwK2JFYi8wT2FiRVBBbkZQTjcvSDEzOFovZlN6ZSsrNHZmZlJpUmRoQ3V5?=
 =?utf-8?B?d2RlVG1vSWxUUzVVY0huWVNRWVJBeFg1MGpEU0Q5YlcwQUhqN3hsclo1N1lz?=
 =?utf-8?B?blhqSlVvckN5VU1ZMDB1MExMbW95bi9XdUJrREVZOU5zN2FMd0ZUcVNqRm5q?=
 =?utf-8?B?R28zdWlmeVkwem41UytQaEIyRWNpWHIySjNkUjVoREZrSm5TdTU3NnBPYkRp?=
 =?utf-8?B?bkZGaThJMFQzcUtmeCtZcHM5VEUrVXYrb3oxTWRuaWVjUWlBclptRWJoYlo3?=
 =?utf-8?B?SUxWNGJGVVdyY1BMUThFYzA1UlZ4ckowZmFST1pEaEtEYkFnTnNsNmJxRHJ2?=
 =?utf-8?B?bXNIb1VJaVd3ekE3WDBjbWptNTdlUWN0cGsxN2wyQldpL0l5TXNNdU56TWY2?=
 =?utf-8?B?VzVndVNvaFNnUXY3RHFKUGVaczFZVW9nZUlzd0FmeDU4M0U3Z3QydXVPZGk1?=
 =?utf-8?B?Z3NnVWlZdkFvMUkzN1g0OWt4SXdtUm16ZmY1NXJsa2xLNGZMT1FFU3FyZXNy?=
 =?utf-8?B?RmkzZ2RuZTlCMkt0ejJOWGgwZkxUN25TOTBZbVJmQUdEWDh5ZW1rUFNPb3Ax?=
 =?utf-8?B?OGFpTU93ek5JQ1ozbk5tOG94aUFuZllQcmM5QkhURjVPdlpQOHB6bmFvZms3?=
 =?utf-8?B?aFl1QXhOeGFtcUJyWUhNSExUdVlWL1VoSW9IajJReUNhUkFQMHZrU3BBTkx5?=
 =?utf-8?B?dDByMXcwb3Zaa3F5eXRzMlZscnVVazQ2b2p4VEsrVnBhelVFZWFTWm0xcjAx?=
 =?utf-8?B?SitHdmptcWlpYlZtN3pybEJMVndRdkR2V2ZMZUdoV1lZRFg3RXR2a1pRSFZt?=
 =?utf-8?B?bUljKzloWnFGSzdXMjBuMW9jMVFjVWp2OHl6aWY5bzYxWHR1Q3EvU1I3aVEz?=
 =?utf-8?B?RW55anpESFNVcmJ4UkRvRDZ2Tkcrc2w0NG9sekVuTHJFalVpcjRySWxXM2Z4?=
 =?utf-8?B?L1ZxeDBIYUp0RXpRTkxZeWNqeU9TWXRWNndYNXZMc0RpQ2Y4NWN0eEtUVUdO?=
 =?utf-8?B?RzFpWnlyT01sMlArQmltWDZXTkIrT0pTTkRKdHJvdTNtMG0zOEpXN3dLdDIx?=
 =?utf-8?B?ME4wWkpzOFZ2ZEI1YXNFeTlrU2NJaGRheWczdmJjV1cwZWtVNU9uY0ZNVHdJ?=
 =?utf-8?B?OGtGbVZuenZUYjBXcDUwcjJjZTN5bGJQenV6OGhDTnIwUS9jYitWa0tvUVhG?=
 =?utf-8?Q?rq0ZIO/RjFaOPxO6qNY/hYFzB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6605eee5-37bd-4eac-9575-08db98074fda
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 12:02:17.6843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H2oUN6fAZvDOQQccBUJcmeDVAFR2J5svzMg5RepdB/TitLE6IudiXE3APF+MuV6ySx4yCP79J/Gsq1mOvFkUJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7285

When !MEM_SHARING no useful output is produced. Move the function into
mm/mem_sharing.c while conditionalizing the call to it, thus allowing to
drop it altogether from Arm (and eliminating the need to introduce stubs
on PPC and RISC-V).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I wasn't really sure whether introducing a stub in xen/mm.h would be any
better than adding the (further) #ifdef to dump_domains().

We could go further and also eliminate the need for the stub variants
of mem_sharing_get_nr_{shared,saved}_mfns() by moving the
XENMEM_get_sharing_{shared,freed}_pages cases in
{,compat_}arch_memory_op() into the already existing #ifdef-s there.
Returning an error for those sub-ops may be slightly more appropriate
than returning 0 when !MEM_SHARING.

--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1297,10 +1297,6 @@ void free_init_memory(void)
     printk("Freed %ldkB init memory.\n", (long)(__init_end-__init_begin)>>10);
 }
 
-void arch_dump_shared_mem_info(void)
-{
-}
-
 int steal_page(
     struct domain *d, struct page_info *page, unsigned int memflags)
 {
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6265,13 +6265,6 @@ void memguard_unguard_stack(void *p)
     map_pages_to_xen((unsigned long)p, virt_to_mfn(p), 1, PAGE_HYPERVISOR_RW);
 }
 
-void arch_dump_shared_mem_info(void)
-{
-    printk("Shared frames %u -- Saved frames %u\n",
-            mem_sharing_get_nr_shared_mfns(),
-            mem_sharing_get_nr_saved_mfns());
-}
-
 const struct platform_bad_page *__init get_platform_badpages(unsigned int *array_size)
 {
     u32 igd_id;
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -2329,3 +2329,10 @@ int mem_sharing_domctl(struct domain *d,
 
     return rc;
 }
+
+void arch_dump_shared_mem_info(void)
+{
+    printk("Shared frames %u -- Saved frames %u\n",
+            mem_sharing_get_nr_shared_mfns(),
+            mem_sharing_get_nr_saved_mfns());
+}
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -365,7 +365,9 @@ static void cf_check dump_domains(unsign
         }
     }
 
+#ifdef CONFIG_MEM_SHARING
     arch_dump_shared_mem_info();
+#endif
 
     rcu_read_unlock(&domlist_read_lock);
 }

