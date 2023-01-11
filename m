Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4617F665D2E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 14:58:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475386.737080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFbc8-0000aY-FD; Wed, 11 Jan 2023 13:58:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475386.737080; Wed, 11 Jan 2023 13:58:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFbc8-0000Y5-Bh; Wed, 11 Jan 2023 13:58:00 +0000
Received: by outflank-mailman (input) for mailman id 475386;
 Wed, 11 Jan 2023 13:57:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1UMm=5I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFbc6-0008Co-5B
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 13:57:58 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2068.outbound.protection.outlook.com [40.107.6.68])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3a98656-91b7-11ed-91b6-6bf2151ebd3b;
 Wed, 11 Jan 2023 14:57:57 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8073.eurprd04.prod.outlook.com (2603:10a6:10:24d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 13:57:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Wed, 11 Jan 2023
 13:57:56 +0000
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
X-Inumbo-ID: f3a98656-91b7-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TSRKM4oRF64gC77pPF7nUVgW9tf0uMUPNbvDdzwKSND6YmoJUfF0iuVSTtzSaYmNkSCX8TEHXa68Pm+0oRj5ciyS3hRsvNMdR30ao483g5gPf0bv8VwRtd1qWPszc7w9Sx47PS8kzY37oluYMRNkVQR243c0L7F+z+063GgedLF5tncE9JUitRgzKj0gAftE5TG1HmoDiJcdPEsrmUDYHyVTRlIc5bKCiojTWN8S//Pi4enidjmE5yxRv5TCt3lbi19HZnTkGrgaVZp8xvbGrmsl5vtYE6vvs/fTuqN4vHT9bRAKZsZ0F9DvEnXZ4FP75tVihJVYkZgsAudVgKZM4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bY7YXGCVxaLa3//TMr+/cVinLxzirB14/tYwJGkYJjk=;
 b=hNLalCz4m6o2ykOlQQqlaXVOBukHG/SzuXvBpL6I5w0hkkZ8sND+rODYbJhiH9fxxfgQ/JDfZdI1Jb/uXidSrHCMLL/J68l3rxrOaYX+e04eKqR1WRMiU52Bw3/ezmfgpcKdbBBzD9M0+TYeYyknAx/uHbPpLAVxjHhNSwvgPPT2PfDvp0Y/A0mO13PFupLAeVeMNEOA2cI0n1fEsjr8BluLqHsOXlQm/SPKilIAdpbNIMJ542CfeV0x6x0DvQ9Wz1Io2X8U7TamTKAf+w1bxySpLgQ/rDQo0iHKZZ9OlmCZkpObocl2jBmameezeLH9uSUbAQiLlzaq1AWGH5QUFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bY7YXGCVxaLa3//TMr+/cVinLxzirB14/tYwJGkYJjk=;
 b=N15A5ATS7ywjuhcOKx2GNBO/I77JMKDUY5NiRnwW0ihxCok6GzCNdKVxNM+UKRew7PFspHLI6Ke7RKwxnEAXRxrcDhh90l2HIk1ez3oVS4BmNYys3Quna7BcUZGlW/rPUbh9xX/1nz7jkEVw/KwMrpuKLJQymjoAmxq+qtdyaVnP0aD6h2bTGiFbEATGwNDQMaVVIis+CA0L5gFTygdC5MJQc/9Pyi+M62Pm3GnEwaqKpPoXWKIscq4OymCv+OVllyrvZos45eYzSOt6NDQenUy2e56RQWu+mVAmyh5YBZ5HmBrUcTmnwzVIUKwHX031ShxldS7rDUbcfOEoGgLfrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9bea51eb-4fbd-b061-52d7-c6c234d060a1@suse.com>
Date: Wed, 11 Jan 2023 14:57:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH v2 9/9] x86/shadow: harden shadow_size()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <f17d07b3-2558-70b8-9d1b-b599a54a2d59@suse.com>
In-Reply-To: <f17d07b3-2558-70b8-9d1b-b599a54a2d59@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8073:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e217842-588d-493e-9601-08daf3dbd751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VZsiGfwYLcPJVSOfMGpKtPDMqAtgpCG3tRjXgraxkoxOwP/vfVnUVrOWXD7eA7crR7rcnHAJsbW6QxV49Y29YxfC51Eez7ATGuh8k7UclifmXlunV8HIHe9tdMWqEjQ/FkPVz3zGBI64PRG/uS6ae6U4/aT80Ck+D9fsnoaolM1HxUk7hNZYZQbXyTtK+zIocV5MIjvcvsbvCyKB8vLZQXVrmh6WFMFiunp16NHmlTnTzM42pRoZlOVNBFmzm38ajohznsS10rEomS6bL4nZWbUC6JcbYtHhef/TBapRrYGubtJCkJYryaGBiBh12QmB/QzeWMReX+16YhQgzXknWnskOsJBN75ogglRB7TSwi+7jjBGT4cVmcFUMuQe3PeM4Wr+OWmeN/ywSxdgLsc0d51P87UwAIPoISZ/OA1bEGJJu4NH8qP3AwBVmSt17+wI7Y9WvUsQKgfx2/rK8+TA+NEpvnUt9FRdEjV7hD32TNTUMUKxF0sTJknXaVsW/AH4I6CfHOnNFs1STYQybiVRhYmq81dNEl8832LKn0Nh1SVsotRpyuboolVqf2+I4pQxJgHCH5Po752CQ0f7V50ZRRaMXveI+ejZ77OUDAdCIqEttnFcx3eqgtjG1OTj6QEP2SyMqPDWcJK9WPhcZIudEq7mch0/xLfRKcngvOGoX870MgMCZ4HERAZVI0+hw5U3/p4bc7D5O8kmLi93aVMNbZNeV7PaqWLI7asoaooh1Nk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(39860400002)(366004)(376002)(396003)(451199015)(8676002)(66946007)(31686004)(41300700001)(2906002)(8936002)(5660300002)(36756003)(4744005)(6916009)(66476007)(316002)(6512007)(66556008)(54906003)(478600001)(6486002)(6506007)(4326008)(26005)(186003)(2616005)(31696002)(83380400001)(86362001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SklXSXNLMGNmSFRWYUdoNmt4NFJRb01aYVNVVjlTaXdRMmliYUY4VHdNZElj?=
 =?utf-8?B?dFBnY042d05EQ0xNUzRxcSt4Mml3aVY1Q0xaeVJFWERoUHpqQjViVFZBN2ts?=
 =?utf-8?B?VUZrcjNIOG1LZzlleFEyZm9RMG9DL0ROckRTaXpOQm5DbmhieEEwVEFxVjhj?=
 =?utf-8?B?WENpSHVKRmpaZE5CeUd0RWNxdmR3WEFDZG1IUDVVK3AvT3djbGcxMVJFcWI2?=
 =?utf-8?B?TC9WbnhRWjJrNEwyZTdOWU9pNjZFRlJGVmJxbS9TUHlCUndBK1RBdGRnTUFG?=
 =?utf-8?B?Smd1T0paR2xXNkdLWmpqTWQ0cUcrR3lMaXoyR2Y4aGdkT2Vrd3FWeXNRRzN4?=
 =?utf-8?B?aXhMcjEraGE4QTRmaDNpdFdjVWJmbHN5bTNEdTZPSWpxR3Y0QVQ1Y2NlZWxs?=
 =?utf-8?B?ekNmcHNVaHMvSVVmRFBENXI1Y05wd1ZFQWxWVWZCaEp1MUxDN0xodkZiV0xW?=
 =?utf-8?B?RHowRU4zM1ZsT1FRbkZGZ1drVHlrenhKbVVuaEg0SE1jc21ZNFVMd1BYK002?=
 =?utf-8?B?Mkc3N1Y0MjQzVXhEd3haSlptS0JxV2hBaHp5NnJuR2Eva2FXc1hRbXNSS3dW?=
 =?utf-8?B?d0JVdmVWSXZMaldBQ3lvSW9MVW1LSjh4M3RFNXV1OHZZN0p5VzdCdG1ySXhG?=
 =?utf-8?B?eEhxYkd0NmNzVlUvV3FSS0dNRmw3N0xQQ3h5ZmZGazNIMVJQTk93TDFnYXdo?=
 =?utf-8?B?NFRFdmFkeUhyTit2ZXZPbUM3Szh3aDZ1VkthT3VRcGlleWlsZlFzdjY2MW1j?=
 =?utf-8?B?SzRYd2xGdHJtTW83alFHZWVRdEJha0hvQ2NxMjgxaFdIVVhuQ215SDVtcFoy?=
 =?utf-8?B?ZUVwMnh1RGZFaVpTZUEyRlBhUXVXaGRialo2Yk1SSnhaendSTlBJS1Z0K29w?=
 =?utf-8?B?Y3BDL0htTkJPWFZ3bURxdlRzYzlyTlFjaUlZM0R6MC90clAxSXRxTVJmNzJ6?=
 =?utf-8?B?cnVNZFJ1azhHK2tSOGdrWExYSm5uQm1UcGhnc1JWZWxOR2sveXJqRnQ5QVQ5?=
 =?utf-8?B?dFZFZVg1VEtXSlFIYW9zTFMxb2J2WTdTRS9rS3lVMmdaSXBGQU9UVmMwN09H?=
 =?utf-8?B?c0c5cDV3ampSMWZ4eHgrRFNpeEFlSDJWM1N4aW9PL1RFWjEyMGE2SDdQbDQy?=
 =?utf-8?B?dWhkWXFWL0M1MDFrRzRXKzgvTHo2WHVUWGpFNnhMYzBpU0t2RTdVMFBUSWYr?=
 =?utf-8?B?UFpoTFFtbXVDcnB3U3Y1RlJxWEd3eE9NUUxVWHg3RjJBS2FiUWx2ZFFxZFlw?=
 =?utf-8?B?Q0hnbXhqb3Vad3A2c0EvVFUyNm5pWlRoYWFIRG9xL3BvNTYzTzdSOEdqY2x4?=
 =?utf-8?B?bm9NWWRKY2FSN1c2bkV2c0RrZ0hmNDk0NmtRQ1VQaVIvYWFIS3l0UGVmQnY5?=
 =?utf-8?B?d2VjOTIyaXBQdWczSWt6Z1lGZG9wbXJ2a0IvWjJPMXNxTDBmT0xidFlXR0l0?=
 =?utf-8?B?bkdUTm85ZGZOd0cyUXBuYXhEalFJZ2FzRkRiSWNlRDhyL3RVeGphM2d6NS8z?=
 =?utf-8?B?bk5yc1ZjZnFTL0Z4WXg5WHV5QldHM05ZK0ZpRXhwSzk1SHVrSjBKWUdreGUz?=
 =?utf-8?B?bkhiTmhhMElzUWs5T1VPUGczZEVKM1prclZaWlBzWGRuS3JWYXVKSmc1bG9q?=
 =?utf-8?B?VXlmSFJIRlR1TXk1NU13blNRWXRhaWFKekZRRWhFWVFXaUgzdU9LTE9KeENq?=
 =?utf-8?B?cXB3djBHbCtvZ2swajhuV0V1YXdtTDZHZHhZZ0hzckpnUTRDeDFVTXdoT2JP?=
 =?utf-8?B?VlRJaDRFMEUvQVdTVDd5dEE4YnFIcmQ4QXAweU4wNnp5a1dnVWZPbmpydXhN?=
 =?utf-8?B?a1daN1FLZmtOeEFCOWdjRzZzWVdhVHJHdTlXRTdMOFpCanRUekJ0OERlLzF2?=
 =?utf-8?B?Zm96a2I5aHhURWJyRjJ2YWkyaG9ldVQ1czVhZFc0Y1gwS1p0dzI0cjlrQng4?=
 =?utf-8?B?dEFlZGlFOVVXaVc2c1Jpd2ZraGZhaWluY3ZKWUhiV2pYQWpoSkdOOTRNZHlk?=
 =?utf-8?B?THV3bGZqZzNwT0NJNWZRWkNoUXAxblYwbFQ2MWRGbWJnbGt3dGVmSEhaUjND?=
 =?utf-8?B?cUhFcUhTalZOM3NQTzVzSjZGMDJvNGdkVUxiQlEwLzl1SXc0eEtrbGRVL1R6?=
 =?utf-8?Q?YLX1ZvyxHW57hGX7+O2wCHpOf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e217842-588d-493e-9601-08daf3dbd751
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 13:57:56.3119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pNl8/x3onggPgJYTTXZSXr9YCczCD1KgrwhkC/lBGac3cJeF+R61O/ju2UbgrjpkCx/Jb9QOq1oFBgqWWxTkVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8073

Make HVM=y release build behavior prone against array overrun, by
(ab)using array_access_nospec(). This is in particular to guard against
e.g. SH_type_unused making it here unintentionally.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -27,6 +27,7 @@
 // been included...
 #include <asm/page.h>
 #include <xen/domain_page.h>
+#include <xen/nospec.h>
 #include <asm/x86_emulate.h>
 #include <asm/hvm/support.h>
 #include <asm/atomic.h>
@@ -368,7 +369,7 @@ shadow_size(unsigned int shadow_type)
 {
 #ifdef CONFIG_HVM
     ASSERT(shadow_type < ARRAY_SIZE(sh_type_to_size));
-    return sh_type_to_size[shadow_type];
+    return array_access_nospec(sh_type_to_size, shadow_type);
 #else
     ASSERT(shadow_type < SH_type_unused);
     return shadow_type != SH_type_none;


