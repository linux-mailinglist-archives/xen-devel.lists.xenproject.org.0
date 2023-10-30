Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3827DBA7B
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 14:19:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625098.974013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxSAp-0002JS-8V; Mon, 30 Oct 2023 13:19:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625098.974013; Mon, 30 Oct 2023 13:19:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxSAp-0002Gu-5R; Mon, 30 Oct 2023 13:19:19 +0000
Received: by outflank-mailman (input) for mailman id 625098;
 Mon, 30 Oct 2023 13:19:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hhfi=GM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxSAo-0002Go-CX
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 13:19:18 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7d00::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed88ae7e-7726-11ee-98d6-6d05b1d4d9a1;
 Mon, 30 Oct 2023 14:19:17 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8312.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Mon, 30 Oct
 2023 13:19:14 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Mon, 30 Oct 2023
 13:19:14 +0000
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
X-Inumbo-ID: ed88ae7e-7726-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bjQNCXKmNj4mro9ba8eH5pvt2Jr/AxynQ4QoNH+xLReAN1b4O72580yYoYsYsjxTIF2/SgRe/MvjGGSoyhEEFRli2/G8uJWAjFw2tj9OTMtJiT4hFF4nVTRb9ntv4aa0NMB3VNE6Z/5TEeLpL2tND7j23DOaxK1SOFupXjsIBaUdLKDduarmtZvGvSkfoJYcD0nJUKMyWSzwcsk8RowHM4uqhijD+ZfB23ZLsC3PD60fCjX0u9uGmOOvZ2qwj/kv/WKoi8F2qwlKWIBLjmPPSV2slTcL8ja7lVKm6vHD0FAIs/gWB0fHIbB4OaFZynFXKzMyOLSBtWD0F2+wc8MKzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5RS7ML3zUGduWIOpMzIYiW9tDyouZkunpiHrgT+gfaE=;
 b=QYy66vO8D5sMfQxaKemYNfWnndLG7TN557Lq8fB8ueFY0Q8hefcBK63+s8apMx5IUlDzkVuNP+EFo9wOy38rIqWMFlEUIMiuQMThgiyflRT5YANYU+WAb3cISQh5gpGugbfxktNDoEHnxFFJezFr/UnqLDxX6SuUMwmofvf/b9KecDogsQI1ojRn4R1aDDnChhkKKFHIWWw70HGif9WSlpB8K5N9qWAjOrxTi8/o5ebXdQ6VzAJv5LEJ8bNDJ8CvwVWhTqIXhmxVPIi6wOQxa4RUfNyHCO4xCDNK5eNq8qa7m0EHLqhmBPLiv2aTs5ENttW0CuwK/vLtzxjijcDw3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5RS7ML3zUGduWIOpMzIYiW9tDyouZkunpiHrgT+gfaE=;
 b=z2ssQhIz3b3HCNG1YdampZGwmQ05AbCFQhi6p50GGLUl0cYuE+Y62hJNLuJjBv5e0++cAIWmMA9qxk/uMJvukXwTuHg2nz1npwLH3NM76xMeXHJ8JOaWGXqb3UwH1P/4xaf2mNq0aL9JCMjcfbacbim8a1GzxFA5FeZznt0bO5zoDSrQzIHbsR12OKEcH1zjR7QXUuz0olRDtZH3spJfFoqPNWQeGKaqzzeexqNAs64jsFJMrnM2Ab1EK8nfxbySOV1XuCB4eF6LthhDv9gMsaiQYh/ldjoCxetV4+K/o5tZMATfIkPhfnOaBaz+Dl4LGK0+DWCe3Raq0uwfqka1vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4fda4793-6fdc-70e6-575d-062f72c8c0dc@suse.com>
Date: Mon, 30 Oct 2023 14:19:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xenoprof: move asm/ include
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8312:EE_
X-MS-Office365-Filtering-Correlation-Id: 65c10bf9-4e13-43d0-9603-08dbd94ad024
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gy133bWC/77N70i+llbpcboTicUHyiUo/GMdfVEopWzHPBPKwFRue8UXt7LnavGIRQGuMtDyUmOk8BbWP6xrklxA+o5RbI5uz5VExDbm/M32uebesCMvKsr0uMoPHMK9MtLR168qlBKpvIVeLkNvrCHp+LnAtG0HK7O5LcM7gMniYI9jo4dh9D1tsSamH/OQkX2pUSWCAqWr6zQRfetoqRwwgKHkJt3UAEqx0Hoi+AakCGSWXokqILpYe6+yjw4sZTd+Ul1fY4+ATjvozGy7K6D2pkgm/etkJOu5uNMDE2VO2xXoXDJ4d6mJeXM3VaIHxqorP/gHEwb8EeaEbIpcp6+F0F/E8vvUzwYbDJ+I8s+IVPlcV8NfFWe7Xi5mws27XEfS4hFYBhmJt0ujBpgRgsyIga6GNzKMbipo+2d+ykymfKnXG0cNOVn2Jpa8nnpw7dzN8SUzC9usThyg5XeJSRrgPSsQqGDfLcmHSvwep9k6XvfGWTMBJURXjWMWb/2vnnEC3bIhgUto2Df0oAm1Wph+cd90JQwPCwocnNA6gApEwIUIp3mZerO0eRUr4bpvlQbPTxEmSyCT6OmPomPffODibts8c8PPcsDchL8rgJWOo85kSANHi5nu4XCrvsj3LX2/8JVfnlX0LcOLWrWr6A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(39860400002)(396003)(376002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(31696002)(6486002)(8936002)(8676002)(31686004)(54906003)(66476007)(66556008)(478600001)(7416002)(66946007)(86362001)(4326008)(41300700001)(5660300002)(316002)(6916009)(2906002)(6506007)(38100700002)(36756003)(2616005)(6512007)(26005)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ak9hUEExbENXdkZGYzI4Z0JuZFZuMUxXQ1diWW5DdlQ0VlJmV2JmMWhTb3lo?=
 =?utf-8?B?L2IzcGZaenNwcDZBZVAxdVJaazd2dlE2V3Z2TTF3YTYxTG9TNlBIQkF6NkpD?=
 =?utf-8?B?OXNWRWgrS1doYTBnUWMxN3NNQVg1RE5BbGpzbTViOTN5MndhYnhFNjJDNmZL?=
 =?utf-8?B?RWwxSWtlenJoKzZmZ0d1cyttMGdTaEl4Yk4xV2crRkw1NkRhMXFnQW82ZmFo?=
 =?utf-8?B?cDN6SmxKT3pZQnpmV0gvVzFUTWxzQmQ2T2xsZld6SC9EUjJ3NlZ0Qi9XUFV1?=
 =?utf-8?B?VW9hQnBBeFFJcG5FS0JNSkw2TmpsK0ZsWE9LdHBtMXN6RGIvRU9Damh3L0cr?=
 =?utf-8?B?Ry9JRVdRMFoxMnBJdGJUd3h4NVVHOU1venRmRDN0ZUtXTFY2QmllV1NXRWpK?=
 =?utf-8?B?bkR0c1hQdEZyQVN4ZTgralByVVpKZStLTVR6MGF2aSs4VHpTVFFCRXRScUlC?=
 =?utf-8?B?S0ZtTmhYNTQxcDNhWnBJZzcyN0VjNjZITlh4TGVWRE9NdWFldWNCcEZzYkRp?=
 =?utf-8?B?YVJ2UklKRnY0cjFpYWM5NkxmdTdXT3BuWFdTY1BIYlVYQU1laFZOb2phVTlV?=
 =?utf-8?B?ZGlPOUFaMXVIakpGYzZjY1BWQ1UvVU9xaDRoY0JXMjY3V0tqU3pDYjBjTUhF?=
 =?utf-8?B?QnhVTmorN2tGcksyZ3R1MGZZa3NPdXhVY0hIdFVvU0d5UnFEYXJmRGRoU21a?=
 =?utf-8?B?b1gzZ25zZzZMWk5zSWZWV0x2OCtNTXE4L1hlaXB4L25jMk9qWDA4QWJacnBl?=
 =?utf-8?B?T1RZSHkwYnZsVFhveGlhVXc2M09wM1BiYXFnT0RWVDR6cnk0RlNvVW1aVmJE?=
 =?utf-8?B?dHR0TWh1K1o1Umg3R1ovRnZoM0liSy9aL2gzSUFBRndPU0hEeWp2QkZ0a2lB?=
 =?utf-8?B?cW5mK3ZQNndFeGw1T01zNUJHK29xNnc5TlFBL3Q3cDN6Q002bnc0MTIwd1M2?=
 =?utf-8?B?V3ZGb0tEVm1aaEY4cFJRdU52Nm8zOUJaWk1aVVpzUjJ4d1lERWFxK3ZQaXQ3?=
 =?utf-8?B?OTFnNHNMQzBLSThMVjhFcS9GR1p1ZG02aFZ0cmVhZXd3enY4aW9DYUthdkEv?=
 =?utf-8?B?bDNOaStVNy9rMUIvQUZCUTFjSFBMejkzMG1TVloyWnAwVy8yanJ4VmdZNXJH?=
 =?utf-8?B?SXFON0VEZVlaM1l2ZUFNOTA4bk1QZGhnL3ZjSEYvNEVCYkQzZUsraXFmVEhE?=
 =?utf-8?B?QkNzd2s5YnhZdU02c2ZVTVB3K1A5ci8wMXVOcmIxcXZTSlltcFNSN0M4a3NV?=
 =?utf-8?B?cDF3UWg3bWYvaWRRSEozVE1lSG0wVnMvWm1IOGtDYlZ5VktINXZaVTFPanA3?=
 =?utf-8?B?VWZOQzVoZmw5NVAvbEFwa29vcnh2ZUo5U3JMcGFzMTNGZzlDaUlCbjF1OTVQ?=
 =?utf-8?B?NUpJKzdNczBGK2FZWXlhdk9HYWkydEpRc0FOam0wUjhrVkFTMWptcS82bmxD?=
 =?utf-8?B?eFMyMDhFWWNWZThnS2c3cC9VWGtPZmtDcS9OZlc0VW1LNTFsZVlHNE9FZm15?=
 =?utf-8?B?VEZCcXNkaXZmdVZrODE0Q0grUmlaYXU4YmY4TC9FOEZxclhCVU9Xci9IWHlV?=
 =?utf-8?B?UXVxQjc2ckM4Mk5vdDkyTmNKMjgyOVhaR2oybG9WbDBNc1BOd3JzZXVlTHVp?=
 =?utf-8?B?MGRTdmdqb3ZIRmxMS1RVZDNBdXNpbXFkNHhnMXNLK2t5MXROdFJXOG9aQ3k5?=
 =?utf-8?B?U1FvWk9sek54ZTFqaS93M2daajg2VktmQWN2Q0pkKy9QeGxVRGdzQms1OGZO?=
 =?utf-8?B?NDZsTDFjNGtZUmVVdjJjYmJrZ0JwT3RqZWVaSklXWkZXNm1vbzN6ZHIva2Zx?=
 =?utf-8?B?TFZyY3EzcUU0aVcwcG1Bbk1ZaWxnWG4rOHluVkxCWFVFTnpkWk1OdEliQWN5?=
 =?utf-8?B?aVByWU9wVDV2dVBieWpDaGF1QzBiaG5aNzZDYmlMZjhYQXdiL09ZSzY4RDQw?=
 =?utf-8?B?Q0w1VTltWXdwclZSajIwSUZScVZzeUFFMzJlbmgzMjdGVC9VMWRWdG51R2Rm?=
 =?utf-8?B?SzlrL1c0aVpReWh0NnNhMUsvc0I1Yi9zcVRWdjZjWVlVM1hPZnBnUWdmUlRF?=
 =?utf-8?B?U2hmSnpwbGhTdGI2czR2ZWU1cEViN0VhNDEvaThJbXFrek5VOUxVR3h2UzlJ?=
 =?utf-8?Q?nlNdibYQoTz6JZkfzzanXIgHS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65c10bf9-4e13-43d0-9603-08dbd94ad024
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 13:19:14.7123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8rga3Q4mQquvG/Z2IGgAp9isEeYdHmH5EGwasYNMeV6xZ2vXxnwE5EWiFlIsryJuZuWhMvbHazEG677RCXTnmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8312

There's no need for xen/xenoprof.h to include the arch header when the
respective config option is off. The only compensation needed is for
svm.c to explicitly include the arch header instead of the common one
(matching what vmx.c and traps.c do).

With that Arm's header can be deleted, and neither RISC-V nor PPC will
need to introduce one.

While there also adjust and move the (prior) inclusion of inttypes.h.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/include/asm/xenoprof.h
+++ /dev/null
@@ -1,12 +0,0 @@
-#ifndef __ASM_XENOPROF_H__
-#define __ASM_XENOPROF_H__
-
-#endif /* __ASM_XENOPROF_H__ */
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -12,7 +12,6 @@
 #include <xen/lib.h>
 #include <xen/sched.h>
 #include <xen/trace.h>
-#include <xen/xenoprof.h>
 
 #include <asm/amd.h>
 #include <asm/apic.h>
@@ -38,6 +37,7 @@
 #include <asm/processor.h>
 #include <asm/p2m.h>
 #include <asm/x86_emulate.h>
+#include <asm/xenoprof.h>
 
 #include <public/sched.h>
 
--- a/xen/include/xen/xenoprof.h
+++ b/xen/include/xen/xenoprof.h
@@ -10,15 +10,15 @@
 #ifndef __XEN_XENOPROF_H__
 #define __XEN_XENOPROF_H__
 
-#include <xen/inttypes.h>
-#include <asm/xenoprof.h>
-
 #define PMU_OWNER_NONE          0
 #define PMU_OWNER_XENOPROF      1
 #define PMU_OWNER_HVM           2
 
 #ifdef CONFIG_XENOPROF
 
+#include <xen/stdint.h>
+#include <asm/xenoprof.h>
+
 struct domain;
 struct vcpu;
 struct cpu_user_regs;

