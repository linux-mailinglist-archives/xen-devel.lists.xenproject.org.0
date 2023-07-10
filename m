Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E148D74D09C
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 10:52:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561088.877394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qImcY-0005MV-Vt; Mon, 10 Jul 2023 08:51:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561088.877394; Mon, 10 Jul 2023 08:51:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qImcY-0005JC-SZ; Mon, 10 Jul 2023 08:51:50 +0000
Received: by outflank-mailman (input) for mailman id 561088;
 Mon, 10 Jul 2023 08:51:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=72qR=C4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qImcX-0005Iv-Qk
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 08:51:49 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0616.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01668577-1eff-11ee-b239-6b7b168915f2;
 Mon, 10 Jul 2023 10:51:48 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AS4PR04MB9315.eurprd04.prod.outlook.com (2603:10a6:20b:4e6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.29; Mon, 10 Jul
 2023 08:51:46 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Mon, 10 Jul 2023
 08:51:46 +0000
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
X-Inumbo-ID: 01668577-1eff-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=boDeWuly+CArVxcmaeYsFzKsPDXCvc5MRTx6r1Ccapry0XZHNmgdMumajk9xRITRvNAHB1GnWOnxzrGpLzs0XJvyw3sjw9vdYYtbTrNJP7gqIfKlojLsFJLqGJbc81qoAaQWLzE/MShv2YsKTysxKY6VaYd36HkBPTpbxiwNkDoAxl61wQhsmBILzGfZcJxFVkjd2GbhYh8gI6v/G9qrzdCIiL0VIKFw3wg8rfSynRsDtphc591zU6ja5+rHoDxS9vzKn7bCK/r69X3/3TYS0YeKJ3Dafb1yLBGYL+Fz8YqAY4Sq1CsjC3rR735bbLa+L4+IRRai+mK4SZzcI9BtXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tEZqfEecVCoAUXwOun3bnx9/68WK0/jJ2cWnhbpIMB4=;
 b=PF6xwndGerjT8tw/LkfWcGZvKVmwzQie0114bTUZj1VOlqH/bmAz7HYgWW7hMmiBgFgU0tIkO/yjTtQ358Zn+CRzKjKolvGvcG6PDMhB6uHp5sttfM2YB/uZXhq81+H2Z+Ng6uoBIs35PfnmcFN9js25yqRz09qpkkOKW2IZEgUvl1mDLUtzE8XOnvjZTsNUZMOrOQEXe9W1EzZ8ZnbwAjchIlOuKuAEH0lt+LMl0tcKWlku9TWSADxgD5TDfU7LNeHUKpYADYQfTWgjx5ME+SeN9pYypJlLYTBlWpvrzuJc84bwCSdHAt6LOyhRzmke56Hl14N9XNRjYs7gwdmXuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tEZqfEecVCoAUXwOun3bnx9/68WK0/jJ2cWnhbpIMB4=;
 b=r4HjOhRjApcM5FmymXKsMvObQOvyu9f13oaaqCEnXaLo12sIz4mFmAUwqcut376jyD2Zef5UFdeyWArb5fAdMj0mZusmkCyWV8sBHj8rAALwvcu4wXRdKR4u//uyIjLiqgaYThrsefLdsToNTJ7sfWDivXD5bd4/hdJpQHK9N6MaiKV0bngpY7sahg7kMBgRlb0W3ZUJECrAMG8hDcoUB2NbvM5i56zRKkpNYdjUANl66vAl+idvrLu4xzf4aO9zZJpHqMzusu2K9Eu18UKdwWvn6iFjSsIhLM86PNBE7Bv5r4ZQ06CSWyeUzkRZYhNkPqI39iMlOy3Lv6fhZFcG+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <109efb43-a519-73f6-2a26-2b420090ab2b@suse.com>
Date: Mon, 10 Jul 2023 10:51:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: [PATCH v3 1/8] common: move a few macros out of xen/lib.h
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <a4907ba1-a247-f96d-54e4-090f27665b20@suse.com>
In-Reply-To: <a4907ba1-a247-f96d-54e4-090f27665b20@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::7) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AS4PR04MB9315:EE_
X-MS-Office365-Filtering-Correlation-Id: 29d5f7fb-262d-4b15-2534-08db8122e498
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6vWreUL6Zd5iA+zK4pxxSyIOGGKfsuQt5MUGif/pKDea0KefKenLB8eieNCWIa9MK2fUTQTWvYrWtY2OByGhlxs8dqr0gjcI93WO0GArl6nC4/gYTo6RXrIHDiGTmqQGNaZkGXUv+3ztpXA77ADopESSgC2mVy0AzxKXuI4WJLUrmW5aDvFQ/Q33twwyq6CPGFfyLZXJ1GxhNY29jMu1y03RO+X8Rm/x/G6XiIU5FN+CUc9oed2PFrD2Vzm06Sg1HhyHDE3l8fEZu06rIW2o4kVvBnoa5D+KF3STwT9s8YBCvNY5ftAs5oDUwSTisiPcoFNtyeWJR+9zGQmc/31EjWmdyGYwBisVAORtCt/6TT6PIHDT/38RbvivDqq3FSHBAmVubZhU8q+DDbtfboIYJkI5cpoNL0jDDfR5HFZlcZge6DODQJU8LHpyLITqOb5W7D62Cp8F4+ljq9xp7qJBNaKeVyOqbbVAtYe7Xnu6AtTY0NPQAzs49m+b6brlYmRGqMAkaNbWKzt4VWKmUW8nVxBklw3ZLqYgQp/reqjhuhZmjThahQRQLjxsMPCrhrixzTMzfuzR0KySJ/xai5PzvVJc+9TbH3kXA+I7avtyM1Nga3cVxJtF3e3SUC0UiohHhVySUs+bD2/D5IcNf4Y6UA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(346002)(39860400002)(136003)(376002)(451199021)(31686004)(478600001)(4326008)(54906003)(2616005)(86362001)(31696002)(36756003)(2906002)(26005)(6512007)(6506007)(6486002)(186003)(38100700002)(66556008)(5660300002)(316002)(41300700001)(8936002)(66476007)(66946007)(8676002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEhxZ2UwMW1WVnBDVFl2Z3FxNTBGTTk4NmJnZ0IwajNmeENsZjQ2MjhxM0hi?=
 =?utf-8?B?Wlo0eGd1MVN2UU9oU3o2M3FEZ25CNkdKRVFmYUdBMmVJSERETm5nWm81MVdL?=
 =?utf-8?B?M1ZhekhVUWkrOS95cGorTllxa3ZTM24wTWI5b0FPM1pIbkdRaldKWWJnYSs3?=
 =?utf-8?B?OSt4NEovbHBjQ2J1ZjQ4U3ZMeXFFV1ZncU0vUGszL09iYUFHT3RUUWFhK1pI?=
 =?utf-8?B?ekdwUklaYitkSmJRRmdpenoxTjYyMmFVUjg4T05hUVg5UnRQRGp3NjE4WUxG?=
 =?utf-8?B?RXJ1ZGQ0VnFFZENmdE5BTTJoUWdxWFdLUGx4SkFFcEdWQ2VVVzFhV2JzT1Vi?=
 =?utf-8?B?M09QZGFPckRXY1hHRmdaMHp3ZFBjTFdxRWxRTy9RMU1BU2lHd2pxR0NZNWV5?=
 =?utf-8?B?SStKTmhjbUMxQTFCWnVhVE9mVGRRMWw3dWl4ZXJHQVJRZEllZDcwRXBZUTNl?=
 =?utf-8?B?dkpuUlBlOHN4dmRPb2ZHN1M3VmxzTCtuNHZodTVoWS90LzJCNk9SOTlpQ3pk?=
 =?utf-8?B?Rk90YjZzTUt6dEZKS1gwUDRmbWJtV2hwNnU2aUVQMWNISHI3L1FXWllJaDFm?=
 =?utf-8?B?amxxUXlnL0pXazRHdndMeklBcWVnNEwvekR0Z3lpN3RFV1FwU2IxZjd5Y0Q5?=
 =?utf-8?B?U1Q2TXNkczNZTU1wN3BXazJuOHVaZ1Q1Ykkvczc0VXdXU1NPaFNZbnJhRi9s?=
 =?utf-8?B?SWtrVzBUUXNKa1BYaGZ6djJENERGZ1F6Mkh1bURZOTQ2azBzcWJ4RnNDc3Uy?=
 =?utf-8?B?NnJZOEk1ejlKUm1GUUhXOS9URnU2M3VpQUFQeHU5NXg4YTVnRXpuVHgxY2N4?=
 =?utf-8?B?bndNR2lPZHErRTRvK2dHNUdYQW1rK2JObTRFTDRTMHdJVmdzc1B4d3UyTk9s?=
 =?utf-8?B?b3l0dllzTDVnSUZySEN5bHl2S3BobWErN3FXTkNickVvNVFWcjhsQjUwMkI1?=
 =?utf-8?B?MkhxR2poQWlDTHdZMmJ2b1lMVklwOGZkWFpvSGIrd0Fibm5penVjblpZaG95?=
 =?utf-8?B?b05lWmoxdURCYzB3TDZIK1NvMCtheWNuK05JQ0VxTG83MGlOaEhUdnhjQUp2?=
 =?utf-8?B?WDFvTHhWa2diNVdaajlJUkdabk85d3dmck9yQ1U5VzE5alJ4SkN3VEFKVEVY?=
 =?utf-8?B?ay96cUNzQ3AvMWJiaEx2TG1RVmR0ZFpEOXVURUMyQW5SL3lBcFBhN00xOEJi?=
 =?utf-8?B?UHVzUUU5eTVFWHBhQStsK0VSWEtlOXI0ODFMK2xleHIrcllGVVFpYWV0clIy?=
 =?utf-8?B?STI4djV3YkRHeStwVUJmZHZsOGpHMDlON3k5c1NsU2ZPSk5peDdQR0cxdmhy?=
 =?utf-8?B?R1BHVUZuanBpNFZXN0ZGMTdEdHVEMWxDY3gxUUwrTDBPSHdGYzNTdmpBem5F?=
 =?utf-8?B?WklwM04vVk1Td2VBTUF3a2c1REVUdHpRWmdmdjFPNFUxUlIveVFKcSttbTYw?=
 =?utf-8?B?dE1UMnZpaDRUQnIzYWFiekY3L21YZllwT0F5a0JJV2p0V0ZENkEwaDhuRFYv?=
 =?utf-8?B?UDFGN2xJYVhqS0FWR1pYR1pwM3NGRUpiUUp2R25melJ3c1orUWJPeFZKYTU2?=
 =?utf-8?B?aVNNczNvWWJRaVloQmRnWXFmN0hxRGFrOXRvZXp4cXdaTDQ0NC9PdUM4U1Nz?=
 =?utf-8?B?cGQ4ZHpYQkJtY1NKVEorMVUwanNGM1lxMFAzZ1JENUwvRDN5VTc1Sy9Wc3N3?=
 =?utf-8?B?OVBTa0FYVmkrNnU0VkVJaDE5WXJuMkh5a21XYUF4SFpqNnptR05vb1E5ckdT?=
 =?utf-8?B?S1hsbVpvRFlpWUFnOTIycDgyQ3p5ZTRvUDF3ckdPU09MY3o5dnIycHVoMmFY?=
 =?utf-8?B?RllRR1grV3Y2dnBnZ3BhS29Tc0ZEc2puc3ZYUGRVUm1XKzJWUmZ0WklOUGdK?=
 =?utf-8?B?Q0RadWRzZmprT2FveGFELzdGc2EraktmUkcyZjRuZkpzZWJUQU1vWUtXMDNX?=
 =?utf-8?B?ZzEwT0NIRk96dE16QXhOSVQrRkdGait6bEYyV2ZWMnNnc0ZMMnR3WFUrSm5N?=
 =?utf-8?B?cXN2OEIydk1XcUJwdDlnM1J1Nk5CVmxBSDVzZGp5K0NsV01saFR0UmhsR3Iv?=
 =?utf-8?B?cXEzd0hURkppWnhjcE9ZV0NtOTA5RnBCV3gvazhZaVd3ZTQzOUlZd2Zvb2VH?=
 =?utf-8?Q?5QVs45ZtjnzMd9r7XRju62ZQT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29d5f7fb-262d-4b15-2534-08db8122e498
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 08:51:46.7935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U4v3w9ptASt+7jWppW4uYPuHow5qQtkVuzmJ5TMXeVoUFksc8KOPnyma5aa8aDjk/EQoc2H4YtJ4+1aHvsiMoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9315

Introduce xen/macros.h for this purpose. For now xen/lib.h simply
includes xen/macro.h, until consumers can be suitable cleaned up.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.

--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -1,26 +1,7 @@
 #ifndef __LIB_H__
 #define __LIB_H__
 
-#define ROUNDUP(x, a) (((x) + (a) - 1) & ~((a) - 1))
-
-#define IS_ALIGNED(val, align) (!((val) & ((align) - 1)))
-
-#define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
-#define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
-
-#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
-#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
-
-#define count_args_(dot, a1, a2, a3, a4, a5, a6, a7, a8, x, ...) x
-#define count_args(args...) \
-    count_args_(., ## args, 8, 7, 6, 5, 4, 3, 2, 1, 0)
-
-/* Indirect macros required for expanded argument pasting. */
-#define PASTE_(a, b) a ## b
-#define PASTE(a, b) PASTE_(a, b)
-
-#define __STR(...) #__VA_ARGS__
-#define STR(...) __STR(__VA_ARGS__)
+#include <xen/macros.h>
 
 #ifndef __ASSEMBLY__
 
--- /dev/null
+++ b/xen/include/xen/macros.h
@@ -0,0 +1,34 @@
+#ifndef __MACROS_H__
+#define __MACROS_H__
+
+#define ROUNDUP(x, a) (((x) + (a) - 1) & ~((a) - 1))
+
+#define IS_ALIGNED(val, align) (!((val) & ((align) - 1)))
+
+#define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
+#define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
+
+#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
+#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
+
+#define count_args_(dot, a1, a2, a3, a4, a5, a6, a7, a8, x, ...) x
+#define count_args(args...) \
+    count_args_(., ## args, 8, 7, 6, 5, 4, 3, 2, 1, 0)
+
+/* Indirect macros required for expanded argument pasting. */
+#define PASTE_(a, b) a ## b
+#define PASTE(a, b) PASTE_(a, b)
+
+#define __STR(...) #__VA_ARGS__
+#define STR(...) __STR(__VA_ARGS__)
+
+#endif /* __MACROS_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */


