Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7225E599654
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 09:50:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390056.627251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOwlw-0000nk-Es; Fri, 19 Aug 2022 07:50:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390056.627251; Fri, 19 Aug 2022 07:50:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOwlw-0000lr-BP; Fri, 19 Aug 2022 07:50:28 +0000
Received: by outflank-mailman (input) for mailman id 390056;
 Fri, 19 Aug 2022 07:50:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iUym=YX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOwlu-0007vW-15
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 07:50:26 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130044.outbound.protection.outlook.com [40.107.13.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95a11e3f-1f93-11ed-bd2e-47488cf2e6aa;
 Fri, 19 Aug 2022 09:50:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7655.eurprd04.prod.outlook.com (2603:10a6:20b:292::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Fri, 19 Aug
 2022 07:50:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Fri, 19 Aug 2022
 07:50:23 +0000
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
X-Inumbo-ID: 95a11e3f-1f93-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B46+e6JIEynXpj2p6Bbt4Dy3Fx34r9h/JKIBe7czepM3fBPBow76H0Y0DAQyNr3snu0c9e1VfqkIHrVcx85OD8Bp7iM9Uwbp4S54ssWUJ+xqzryBJieultmZ1QgZoGgk8CZJMOIb8MSnerCmID/m1ggNWAPcgsEdyKFdCSFSXc4+O8vEIx2A1/cjlZtL0G80a3BuWVKRRILXCg4lY4fIf4fb5+CQPLQXsixSfiaYnO4Dtg1ksD0k44tSpdYXQjZvR922SjNopLcNJBOEzCMMeR4QcJmF1AMhVszeWk0/bgiCrQ/jtgZdN/wjJnjZjOVkWFCOHC/kLNTjf61iW5Xm3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bflGzSbGwtVrTpLswCHuwtkvvy0efCiqZEXeFBXqy0E=;
 b=kVY3FQs8KXWB/lgbjdkR8FMrNbxHUX/GqBaSa2/+i+4aEwcq0evnv6jj7i7gN5Ugd+BkaPGftKl+VtzfPKjx/QACfW5bjc9FVNC6CmfNpA/alyuCEw4r22TZDFy/R+Wcet5GQv/WPj2kqf2ircPxwPeNlvvr6BU4k+yjs/nO/L/Rz46SJkdxGJctKRkGaq4AMCiTVauMio5VSO/rzSOq8Obnp5Z53qm66GYQVqdsjRTgsHaSVwn0ahmPX0SHVNcfD7lqnZL/ZyR2/YNXPu/cx7ePAyAOzaRfTnh86Xbf+RspuFoQrOykIcMI6m7B3PAURjkJyYbpM4H9Friy3ErkIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bflGzSbGwtVrTpLswCHuwtkvvy0efCiqZEXeFBXqy0E=;
 b=pDW2YXkVqDFKeLkmOdDhe5QnFXFYAyde5DiYIdgv8HT0uHNzVeBdybAt0LSBXkDblBWsgoYt1perTxL8RdMBWQRl/qOsM9utNAskqlDuyYl9n4us5CSuPOOj3QSGKNjC1tBhgEXNtr5/c3oIe0WkmFA7DMzGOT91Y9tLrjGut4S97SSM/EZTisnB/J5/KuOH/4vvlJIP1qWstltkkYoLxVZSPlCBBTYBqv6NjUpwoOvPrZA0BOUJmX0Ahm4RxeMSb5HnVtRt/y3CZ9E5HEaRXsjWSrI+L9H7cH9VY6G6bpfFt0dZ2QbvnOT+9H8eM20FU9wcQQayaIr3tfOs+lVm5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <80abb94d-67d1-ef71-afbc-4d0bd9d8a557@suse.com>
Date: Fri, 19 Aug 2022 09:50:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: [PATCH 2/2] Arm32: tidy the memset() macro
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <8e5df72f-2ed8-3bec-18ff-3da228ab9ee0@suse.com>
In-Reply-To: <8e5df72f-2ed8-3bec-18ff-3da228ab9ee0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0143.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b181504-47f8-4ac5-3c00-08da81b77912
X-MS-TrafficTypeDiagnostic: AS8PR04MB7655:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1r9bfw6x3k78h2TlnQ1Bb+RdrhLC5o+sLHxkY7ONxK8Xe7zov2f+3N2ZvfU3lVSXlUHd57soRKczzijtU0mElWMvdRnnhrPqNHM2ulxkk69fcR/XOl7kC/8zPC5jtBf97mDmqn/BCs9XM8U1oB+M1STWOtsTXqtu6y2VZGCwIxl3liGnwnivhPd1ZBsyusd+1BITa0B+QQ5bZsnEjIi0HWYr+CGNmiPDc8AMLxzzbQsTvpbeSWo2wkoHLCtVaYdIixLgdlDCGKiwFn7bfbkIXhAxxPKB4GKE2b8gJMv3bBIoCxHIOeDcNaTP4u5Dmiko2XiyeKrI0qUsIpW6nxMJBA791BU+Ej/JJBgfHkd17fhIDPS3giSCwFA1BOKwZYvwvrMRV2baPBaElbzLK4ES4yg74z5bqmK6ua0wrpniby2MxcLneoq6D1WzCzocG3+1zZI1Frqqa0bq7OaVPIna2+miaB4f5zaXvtiZiEdlZfgO1nDJthZ8gxaWk7xV6/7Lzcvoe0b16+a8FkzpyJXWOO9geDlTwt0VQcNJfnVrrN+a8x+AvWCi9vh7Wbk0IDrfsjxJR1XzHAsZkxuuPupM4wKO/sqcbCHE6TjC4YU9GenheeuznQZSrk7DoexuxEffA9jhEN9my+AgNIZye6XV5vLCzz4EZPcwNGfCRWaxcjrF7a0HUYzVSuKJ7GrXlFE4ttzCRoOPdDBjE6rD3qV05IkrYzAVVDQA89dOz0NIwZeW7fg40HDlletRIfIfi6rzQmHHdc3V/0FO8FCYSZ6XDqSktW8XIEQUJJtr96e31GM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(346002)(39860400002)(376002)(366004)(6506007)(26005)(6512007)(86362001)(31696002)(41300700001)(6486002)(38100700002)(478600001)(2616005)(186003)(66476007)(66556008)(66946007)(54906003)(6916009)(5660300002)(8676002)(4326008)(316002)(2906002)(31686004)(36756003)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckF4TTh5NHpkc3QwZGZqeTh0Mi95MmdiU0d1S2J0K0xtVVJUVGNJNFNmYk40?=
 =?utf-8?B?cng4UVM5Zm14Z3l0TnRFRzZxbndRVlRXSlJsN2thLzAvRjJQMU43THpCaEtv?=
 =?utf-8?B?Ulo5SUw2UkROcGhHWUlvL2o1ZDNIaVB5eVBoaitwQlFtZnpkRWVYVWFmNnBr?=
 =?utf-8?B?K3l2OUhsTWZtTFpSTmRmb2g3MEtEN3gwaW9IZ2dwMFNCYzZmU0NCd0wyMi9o?=
 =?utf-8?B?S3JOcHZ0cmFFK1QrYlVTVDA5NUZnek9lVFlKZmQ0OWN5Y1NvRUNCRUN3Tysr?=
 =?utf-8?B?ekZqMWs4S1cvUHlwTnF1ZHRNQlRQQzNzN1dsZnlSdmNFY3NCbFpNWGoraFB0?=
 =?utf-8?B?WjhOYVI4eW0wNEkvQmVpS0Z0R0dmYjIvVjVzMFNuRTZ4Rkh0Q0VaY1paaUJL?=
 =?utf-8?B?c2RMWlZ0TXpGdmlwd1BkdkVNd2tqUzJjU1RhS3ZtNm9XV0ZtNE1LS1pnYllB?=
 =?utf-8?B?MVhrS3FpWlh3bUEvYUVjZVZvcDdSY1l0UjdUajdwYTZ2T0FGcWlOYlhYNzc2?=
 =?utf-8?B?ajhkb2VaTHRGbjJFNy9sS0tJK1dENVdkNVovcjh6WGVYZlY4QmowNmZmVW1S?=
 =?utf-8?B?aFFSaG1DVFdDei9lekc2MG1lVzUxRFZrbWR4Wk5oQVppQ3J5dlJIcU1BTng1?=
 =?utf-8?B?SFU5enhMRzhtdSs0TUhwMHNjcHRFUm1xWWdaU0o2eVJOaTRyQlVWUzExKzFj?=
 =?utf-8?B?R0VXb2h4S1pTMkgxcm02TE9WbkJ4RzNaTnRrVXl4ZE5BRnNoR3F1SGNHNVl2?=
 =?utf-8?B?dEZVSytlUlQreko3VTh5cU40Z0tpekFIVWt5elg1Z1IwYjdjajJBdHg1bmh5?=
 =?utf-8?B?bm1RVkFUZFV5bUNXMXFiN1VoQzhkVllRaEE1elgrenQ5SUZtMXF5K3NWcUEx?=
 =?utf-8?B?aTV4cTlpNWxjOUhQbkJCQWJLVTVQYUQ5SlVkUFZRRWdSSU9zQmtJVGplNVU5?=
 =?utf-8?B?c3ovVkdrNHN3RGN5QnRPZXlPdDNOZDRVdWx1eE1wb3BrNGtwVlQ0M053dGRY?=
 =?utf-8?B?ZmhUOTVzbVpXQlJkZEtic0dIbGd3aWEwZlkxMGVDK3hVMWd0aUd3cnEvZEs4?=
 =?utf-8?B?cVc2UWdld01SMVhiUU1YdUZqa0Z6K0NJSU5JYXp1L0lHa1VZYjE5ZGJrTTVy?=
 =?utf-8?B?REsxN1g5Mzh6M1ZhRllBdHoyMmlSbkF3eUgxNGZ2dytaRGZRTUV4YXpzd0k3?=
 =?utf-8?B?M1R2b0RwWHUvemUza2FERmg3dmFHb0NHdFEyL01sYmhaVXV3M01kRThSMDV6?=
 =?utf-8?B?dWZPaG85Ung1SGlOdzUrY3pOTmZodGs0QnpBZkx1YmxsQjF0NTVSNUE2Vmg4?=
 =?utf-8?B?ZzNzMU5KT1AzdmRrS2Z3Y1ltQTlMakNZeUdrNU9Ud1lKTzlFZW1zZ2hsc1pm?=
 =?utf-8?B?R1hOQ3ZsRVpaWEoraEsreGo2WUZCb01hUk4vOEIvUHRHVlNFVHd2aFZGeE8w?=
 =?utf-8?B?b3owOUg5RmxVTGlqM21BMWJ2Mk9abnIvUGU0OW5PNy9iVEZheVRwb3VNUzhn?=
 =?utf-8?B?R2d1QVFHSWpWa0V3ekpHRWJJd3JuV1lDME5yMzlvRUgzZEZ4R3MwdXBWN1FH?=
 =?utf-8?B?bnE5akJLbEYweVJDRDBLV2NtUjdIQWswSVN5THYxNGZlblJtVmxWQzlpcndL?=
 =?utf-8?B?YnZuVEw3NXpYUXRKcEsvWGs4WGFBZEdyTFhadVlLWWgwZU82ZnpzWkZHbUYv?=
 =?utf-8?B?NGFVR09OYnhNN3RHVy9lWFVKa0plSXdJY016dThEQVAzb09EaTR1bkh2Y0cz?=
 =?utf-8?B?VkkyUm01WmV6TGVaenRZQ2RZQmpEZTQ1SCsrUjNhNUt2bHpLNHdZZkpHVVRR?=
 =?utf-8?B?MmFFTEdvWUhZL2VkMklPY1lHQlVwNjdPeTdPelp6M3BTK1Z1QmlRaFBKWUx4?=
 =?utf-8?B?SkwwU2lydFNnS2pXNzBXSGt0OXZvbUxaMkxnWkhKT1ZmQWp0MmpqN2NJcWVk?=
 =?utf-8?B?U3J5NkJkQnhVNVVqSkVuVjQ4Vk5KeGtuSFFYZnpjU2tyelNsM1VYaVZoclph?=
 =?utf-8?B?akN0Ky9RS29TVzhwUXVYbkI3Ny9HMWtMb0xUYXpvOVRBKzVGc2RsbERqNnVI?=
 =?utf-8?B?VGZYN1NMRVdDZjZIaWZoYTZtMEtGMEpxbk81VTRKcFh4cFhQNkl5Mi9LcC9n?=
 =?utf-8?Q?0/2ga6YfZA0zn3g+VAMKwkeei?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b181504-47f8-4ac5-3c00-08da81b77912
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 07:50:23.7989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /4R+5+5gycNrM7NpsEOJFu+cQTSk6MDyxYih7NePqJaoTi0ZwyjYUzpZtC6R+Mh0NXCEhmakqnUBKpJPa2vIEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7655

- add parentheses where they were missing (MISRA)
- make sure to evaluate also v exactly once (MISRA)
- remove excess parentheses
- rename local variables to not have leading underscores
- apply Xen coding style

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I wonder whether "if ( n_ )" is really helpful: It's extra code in all
callers passing a non-constant size, just to cover a pretty rare case
which memset() is required to deal with correctly anyway, and which
__memzero() also handles quite fine from all I can tell.

--- a/xen/arch/arm/include/asm/string.h
+++ b/xen/arch/arm/include/asm/string.h
@@ -28,17 +28,19 @@
 
 void __memzero(void *ptr, size_t n);
 
-#define memset(p, v, n)                                                 \
-        ({                                                              \
-                void *__p = (p); size_t __n = n;                        \
-                if ((__n) != 0) {                                       \
-                        if (__builtin_constant_p((v)) && (v) == 0)      \
-                                __memzero((__p),(__n));                 \
-                        else                                            \
-                                memset((__p),(v),(__n));                \
-                }                                                       \
-                (__p);                                                  \
-        })
+#define memset(p, v, n)                                 \
+    ({                                                  \
+        void *p_ = (p); size_t n_ = (n);                \
+        typeof(v) v_ = (v);                             \
+        if ( n_ )                                       \
+        {                                               \
+            if ( __builtin_constant_p(v) && !v_ )       \
+                __memzero(p_, n_);                      \
+            else                                        \
+                memset(p_, v_, n_);                     \
+        }                                               \
+        p_;                                             \
+    })
 
 #endif
 


