Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF29C6D58D3
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 08:38:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517642.803293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjaII-0001If-4R; Tue, 04 Apr 2023 06:37:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517642.803293; Tue, 04 Apr 2023 06:37:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjaII-0001Gp-14; Tue, 04 Apr 2023 06:37:26 +0000
Received: by outflank-mailman (input) for mailman id 517642;
 Tue, 04 Apr 2023 06:37:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjaIG-0001Gj-Fi
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 06:37:24 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20613.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2642e993-d2b3-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 08:37:20 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6989.eurprd04.prod.outlook.com (2603:10a6:803:131::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 06:37:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 06:37:17 +0000
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
X-Inumbo-ID: 2642e993-d2b3-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kgiPZ83m5kwIHcBbRDEFp48bVUAOOTXKJlxGJP62hYe0uFNRjUzi8SuyN/Wdfp+Ky85EbnKQ8yrRWKZrVRek2Y9EEPaYEm9siYtbUL4MfYgiiUlPrByZzNBOcvzgDS1T7hjv712sn6LMOBeqNsHHWklKwiOhjufT0ELARwpkoI27D4GhnWiZFeQdUStKyVaNVNsZchdH/bIpV9Z3kKgZoE0LUGq5/+fLUF0uYpLLMsMrrjEzfTGZnmDvrSV8aJeidc83nTOlybt6uSs7IjLsMpckYBrzyjQeDb7C3sOm/mc00VAhDcLwRN2sTbb+q19DkT2WwN/aVQwb3ep2QjwXXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCK7+KxNPVlBfCrlOenGmTflrOgFep/xixoemxsHHV8=;
 b=nPf/VyMWmsahspydfceckauCxIwnDIpDHn6ElcXJQrZhMj5ert2z8uS5NdY6moFrBLTS44eivQ85S5/BZp2/uINqnkbZUSaGXL4e8pgp6r5EecBDkMvquH6a7350NVShdCb9xAkAe7A7CQ3eopYfubJhk+4nZTfUFzVRJhJLP+vxBFhKJ6bXLDoTpC/U1vZzv0rjlPd7LzXH/EkcxbN8B/hYxNWJd1Odd4pRIfHNO1xp/p/4e6RY77suVJ2NSrwgaJiuHJMn1F4CE4SwLfT+5H88UzgPXJamP4OKQvKz1Ou+vZNd6E6DYEL8NyyQ2AqybF62seByNM9T2Y1K/3a+Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCK7+KxNPVlBfCrlOenGmTflrOgFep/xixoemxsHHV8=;
 b=wiXbskfFx4wIgpYSY1DL1Vu+JhDBjd1wGekAVbx0f9StkxQeLYuEGdtrauxHC6AROi7hGX5o7I9H/wWNHla46GY6pAVz8XAlM1tXUC2kXwtWRmt9CJkr9LpdEzMkH66ois0Sox8GBQhmG6JMg/VW67F+8zzn0DAePCKhUPafN2TIdlmVb6uCVqd69ncimIsJnqGFDIPKa1AVNWw2K7KwLGuBaeHJjefd/0VJ9azniEe94Bgx0MgBYbqvyKDzu5eyxtrBF5vSHmGCXpLEiYGkt0W2g8hlQggCQYp1dNZiaHcD6zeZdZM+76miVA/5tmZNtar6sXBgHStb8uUpYlQtmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8353df4d-44ef-e39c-9a66-b6a7a73d5ff8@suse.com>
Date: Tue, 4 Apr 2023 08:37:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul/fuzzer: re-arrange cleaning
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6989:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aab12ff-9bb6-49b7-2e32-08db34d708de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hvoakpgHPL6PIg/ap+VB3yl59RzmXC0QzhxXmR1drflj8jN0rnI9ng6klRH8RkffUC+/hHk4HI2fVckZZ2G6OhTssMOD64LjnbHxv3v1f+wLzl+Ejemy5SmGoH0xkGmIwgqMlWihmAyDNQgAkN8ea3+C0ICsztkvnFXPweaTm+6heifLRcva3RMb7WnLHyWNCIrnu5NooY1vwGjJvy7WbCkR8ZQ7PBpICJgX6D1GsyrXL234mFpJgzZBxdwxX7Zj5C1O14X8KkorMKatXGN+AlsBw3dD9Y1FPOS8g20kaCW71jjB1bqR/raKCYFEam4otGtkxt9eKL/UIJGorGrjDXMLzCNfnp14x/Cjxu67wmMvi5D509Yr0LjuLUCm5x/05TF5tZ69oOjH7xZs7mOhuH9Ntk6n3E5nz0p9GTatWTFy+GgUpXR36DaQ21P6AcDobJVi63ShY+rS92iskb2torwu3QGmji4YjHysTtlBiSIknzUA+U7GPCUZLae/332hdmCl9qMx0+kN8q3Gp8ftemH8vdp1VzuA+RILXOZAS8/Y9pFT94mc+NYgWZSjHdiyU5I9NWT+bCKrqF9fImdlRCQCKuoqnjX3RV4fXUPgciGzNTcSqmWAhG0aOF6mawIJedGhDmL2KB0L16rqJh2kLQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(376002)(346002)(136003)(396003)(366004)(451199021)(66946007)(478600001)(66899021)(316002)(54906003)(5660300002)(8936002)(36756003)(31696002)(2906002)(4326008)(86362001)(6916009)(8676002)(66556008)(38100700002)(41300700001)(26005)(6506007)(6512007)(6486002)(83380400001)(2616005)(31686004)(186003)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGQwK1FHQUljWkFRcTl4ZDE5RzFJSmFYSnAwRUdhbnd4WEcwcStVL3ZUQkk3?=
 =?utf-8?B?NmlIZkdsQTlDYm5mQ004WFAzaUtZd0xkeU1lY01EWlJINmFZVHRZdkVFaXhZ?=
 =?utf-8?B?cllFWHJObnVodWNwTjFBSDBYbk4wcjhiQzZPZkwydXFUNGxscVRMaTlLaUZu?=
 =?utf-8?B?a1VtS0dmbGVzb3YrMFhrUHV5ZHgrbnBZRXZYWUcvalRvSEtkRnhQQmlIUXhw?=
 =?utf-8?B?R3o0V2d5QmJRcXBUUW9xRmd0a0YzaTFJOGpBd2pHWitIWmFtSFlHRk56Uitq?=
 =?utf-8?B?WlJZMk5MNml3aVJaejRXUU5WVy9hSlBzbnY2RDIyT2RwU2E4MlZnV1BwWVJQ?=
 =?utf-8?B?RXIyTHgxT1Q3c0UxVURuTHZOajMyWjRsbjNkUXdiSzZkaU5hRG5Id3lvK2ZT?=
 =?utf-8?B?UkpSQlFNWktYekNkcU1DTURWamVKQURpSDA1MkV3Vis3aEdZOXhucGRXYVlJ?=
 =?utf-8?B?b2VtazY1N1dxcUh0cjdqWGFCUHpnZXRFbkkrN0VDbm9TZE5pbE5jbExIL2tN?=
 =?utf-8?B?SXd4bXJqcTcvQ05jdDJtMk9YcFFIVWNFMlFsNGc0OWgzN3dwc0NGY3pVcnlX?=
 =?utf-8?B?SWw4QUNBemhPMGYyWEl0L2JZamV6clBYV3paa1gwRW9Xbmh2MzV0ejlyVTF5?=
 =?utf-8?B?Qm04d3puZTUxSmNjVTUweEkxcnZ2NC9kRnhNcENHNUJZM1RSRGU3RmFEV09L?=
 =?utf-8?B?ckptZFZVUDF2bFpDekFiZUt4c0ZqSnFYckVRS2lZZGo2ZzdWU0MvYkFsZHlG?=
 =?utf-8?B?aEhLSXdkVDJHano4VlNRNVBEOW8vV3d1ZHVKdWdEN3pvY2d0NXM4YkRKdXIy?=
 =?utf-8?B?NC9LbFg0RllOOERDVlU0Mkhtcm1CLzN1OWhySHRQQ3FoRTl1eklvNlQ2dVhj?=
 =?utf-8?B?eWVFUDF0cG1FS2RFV0hHK3ZUZHBKdGUyYTJiYmU5SXl6OGhIbnJxZU1LNUhT?=
 =?utf-8?B?cFJzNVZHelE1dmNPZVgzUDJSeDhkRUcrTTFydnZMRS9vTUZGNk54Y0U0d2JT?=
 =?utf-8?B?VmN3TDhReGt6OVc3QktqQTZ6N1h6TFpFYWhkL0RuQklrRWJtaGFuRlMxdUIw?=
 =?utf-8?B?N3JvRVJ6NHIwc1FXa0xSMkNaMlRwQS8xd2lkMnlGdEZDQTNMVUhGL1pMNmpP?=
 =?utf-8?B?OEpzZkVDenU0OEUxL3MxTlRZYzhSRVVCVmdLMmlvc1VyMUFKQXBkZGtpeGNI?=
 =?utf-8?B?d3JmNlQ5THQxSVhxbXF6UXpkRSsyRnlhUFF1UjBKSjBYOE0wWDh3Wm9leVZy?=
 =?utf-8?B?S2M4bDJwV2cxZzNma1pUUnk0Qmg4MHJ6Mk9uREk5SGNGNzFpYlBzL3FKUUhJ?=
 =?utf-8?B?L2N5UWlhMEoraHFxeERBYXhZR1hGN25DN1RnYjlGejBzMUwwYm9LVE9TaHJX?=
 =?utf-8?B?S1FkQ0hRNjJwTEpLWUtIalNscWxieGZDamNDMytiblB6U0NuVXZhaklNU0Fs?=
 =?utf-8?B?aEZJYlMwcWFCRDJQR0tPdFp5dFJJRkRuVnVRR21JODFyUDhEU1A1Tno0c1pl?=
 =?utf-8?B?S0xUdnRjZFk4MEQ4WHUvV05rWWJMSU0wci81SFBDWmhqT2MrM2NxTjR6YlBI?=
 =?utf-8?B?VnVabG91MS8xV1B5Q0dJZXhDNktpbWFGUDRHMklrQkwwU2dpRldlMEo4Zk02?=
 =?utf-8?B?a0VRMzhBL21RUGVDRzNtZ3BrZnFxMGNKYlZoYU5xa093bnNWZHI3ZTljMmVz?=
 =?utf-8?B?aDJaVkNXamp2Q1BzTlJ1VmFKd0ZyUm9nbDBJbzl5T1VsTm92NlBVQW50emJr?=
 =?utf-8?B?Y0xUTElnYmNlUWIrWEovYStCVnVtMGVxamVlck9tak5vbDlOUjkzY3lSeXR6?=
 =?utf-8?B?dm9Sd3VxUURZV0VVQjFNdzNDZzZibFIwNnR6VmIxZjFMLzhQbXdYcWphODFN?=
 =?utf-8?B?V1Z3RTFqY2FFNmlIOCtlVEM4azAyYmdlbnJ0aHZZOHZrbzQ1M0ptRWhVUmFj?=
 =?utf-8?B?bnpkRlhQYTZ3blBmdjE5OU4vUjBsbXRjL2ZlUjdCMStDLzUySXVJaEM1MXlS?=
 =?utf-8?B?MEtGWDVaVTNTWk1hdzJWVEZGc0szcXZrOFgxdzE3UDByOXZzRGFHZGlRcVBi?=
 =?utf-8?B?aktMenJkZkE4WGozS3cvV2lBeFVRMXlYcDA0SUpwY1lWa09Ma2ZXT3doV1JW?=
 =?utf-8?Q?CJLfO54vEI41kYOrn7M0YvneB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aab12ff-9bb6-49b7-2e32-08db34d708de
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 06:37:17.6602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UUHPJcy7JpkbBQ+uNhXTpuxt8zLGz0Jc9k0bIEkk+bFSIGxoVJsrL5rgu2tROfGDcFCRiOnE2aKSe6W+eEMTpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6989

The latter of the two commits referenced below converted x86_emulate
from a symlinked dir to a real one, holding symlinked files. Yet even
before that the split between distclean and clean was suspicious: A
similar split, removing symlinks only in distclean, doesn't exist
anywhere else in the tree afaics.

Fixes: c808475882ef ("tools/fuzz: introduce x86 instruction emulator target")
Fixes: 9ace97ab9b87 ("x86emul: split off opcode 0f01 handling")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The use of FORCE also looks suspicious to me in the rules creating the
symlinks. Supposedly that's to deal with the source tree moving, but is
that really something we need to care about (and if so, here but not
elsewhere)?

--- a/tools/fuzz/x86_instruction_emulator/Makefile
+++ b/tools/fuzz/x86_instruction_emulator/Makefile
@@ -60,11 +60,11 @@ all: x86-insn-fuzz-all
 
 .PHONY: distclean
 distclean: clean
-	rm -f x86_emulate x86-emulate.c x86-emulate.h wrappers.c cpuid.c
 
 .PHONY: clean
 clean:
 	rm -f *.a *.o $(DEPS_RM) afl-harness afl-harness-cov *.gcda *.gcno *.gcov
+	rm -rf x86_emulate x86-emulate.c x86-emulate.h wrappers.c cpuid.c
 
 .PHONY: install
 install: all

