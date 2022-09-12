Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 879855B54B4
	for <lists+xen-devel@lfdr.de>; Mon, 12 Sep 2022 08:47:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.405448.647909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXdDG-0006Yl-GQ; Mon, 12 Sep 2022 06:46:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 405448.647909; Mon, 12 Sep 2022 06:46:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXdDG-0006VW-DI; Mon, 12 Sep 2022 06:46:34 +0000
Received: by outflank-mailman (input) for mailman id 405448;
 Mon, 12 Sep 2022 06:46:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oXdDE-0006VQ-Vo
 for xen-devel@lists.xenproject.org; Mon, 12 Sep 2022 06:46:32 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2080.outbound.protection.outlook.com [40.107.22.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2967975-3266-11ed-a31c-8f8a9ae3403f;
 Mon, 12 Sep 2022 08:46:31 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8347.eurprd04.prod.outlook.com (2603:10a6:10:245::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 06:46:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 06:46:30 +0000
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
X-Inumbo-ID: a2967975-3266-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AMq6+CkqdrAr42k5XudWqiAX90MYDbd32ZXKkzPiPyj3F2th+Mn0XknOH0sIbelcq/n24vwMDn2gJpk6bW5ushYuNVMvzUek9dB1y1gU8ZOljYaBborVHNFhorMRFJAyUzdrtKuUFJlBF5bvAtWP/HbFQ+MOevc6ioq8JOu7bt0l3CeIBdDVOVHTQrUb2c046S+mjQceewejGMKso8WrSOw3OJA7A7vWUJZZpW6CAiqcfxVPgn1nBVRfLEResueJySAFTRFf7Nw/EZ4FWpmb68sgGc0S1dVA3FTl0MjcTNXBaswWSU9poAI0razOnai27aEKaU4o87/7sCXMDuxyhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NbFs4FLfoe7rY9uiZUQIJxZ8jXRz6b8XdHmvqPqvCOE=;
 b=e7qseqA/a5TzRTAaIvkTjDIdPHWD5cSWsDQGWerL+WDWSrKuNDH5B2M8r9hGqQwtnzzkSCMgl/KF0Ewcw15TELULmfFEJ2NzsadzSQZ70bVx23z5bey1GCqkHRF2+6f9gjAzkaB4uJzDS/lM5BL48yXGdKCnWAWOgo9o2Dsq2A+gA0bkT5RngezTOKORFf2GKq0k7wSxYFdweE/kGVDJGsIxXpuzdwUdke23+Ya0kGHgd4jLX2E+Onl7Af2jFeo0z+Q+hddla+BBI6rdgLSrMaE5otc18H5kB2Ik+iqBkb10M7qjTwp/cjVjiyVWpt3WlCR/c9oRybx8FsZp5QxwJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbFs4FLfoe7rY9uiZUQIJxZ8jXRz6b8XdHmvqPqvCOE=;
 b=UCZpuUTb3Bs6wY7qaZKF96/MlST4sBL/apMLbrp02GHmLmlD1sDPmTL7ASBVHGhhMvyeiLTt3/VSAgXwg6GDreoAI5fkPLXLGVwm/Ga6XZKpPxdWnUUoPhOyQ2Wo7YaXbEGzNEojkAH4Y7TMzQkfy94+lPe31mWnWSfRYYs4xSQVNkD5Szhviq5//HkXSj8fg/w9oZIdg5I+NbjjJ72Yc823tQT5DsZzpo3OXHCkyIrjRWHeXo9JO/Oq+vyYwbJaUaZn98pGc1zHtDP2Aylh4NAo/mMEzpxt8IbUdkrJrVwDLDxD3cUaQdUHWIstxORubAItGWhGEt3A3897k3gs/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bae52ede-aa23-4bba-56ae-1c503625cbe6@suse.com>
Date: Mon, 12 Sep 2022 08:46:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] build: correct cppcheck-misra make rule
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Anthony Perard <anthony.perard@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8347:EE_
X-MS-Office365-Filtering-Correlation-Id: 7769b3c2-bdff-4bd6-d38a-08da948a8608
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vvpB80vfdOhGhmZPMcxwlzSpAddGkrnevzuRiUzbJ+vjHJYGMZjSJXlKPPAfa7k/1wNo7kk8Lb7PRPs1DpFH3+3PRuHeXQydSoDjz+glQbwoFNIrNkswoF0Poh8kiNpWsr5XsHPHIfh6mdrOo4TboTY2A1DtKPIbRfepdI4Cq8AwnZX08Ihre649lWPVRA0feBLYkEs4aVI2Qo2KD2girvjY5/dKWBNcYeXtRJCIFhjS6f2CQ3tgYMULsDmmwnLxICd9pYsWnFn7JgdrycI0+sIE4B74onmVK3/0Ler++0+f1FDyyrD4Tvt0bYL/aJHINW7qFs461NQ02rxZ8wUrC/eLfj4vEmu/rQhm583YWEMiVtgrUm6XobKfnGBHMUAJxFgkpPLyifRCXaeFG8GtvGyq0dSlQVPJfASawxlVakwU197JMgAl7d9XQk7CqW16Tj11sErSQv9XOuYS5fB2kH3WsGAhmRVZ0BMbWzn07QwJgyfE8Zrmr9VqbrhghLYZcx6ZIa8p6po9E4lhGTwNTFtbdWJV/PVU2Qaql9bttnH3TzrK2aA9uYQ/DA5cj+hf0VOgAU0gjSZ9v14Ng6RynHa9Lfobt/NkOC1UDNySMgIGqO6Ca7tFPj3gaJWjutkYLMn0JY/4wRqJQ1J3WWaZdEgbxwN7VhadAlD0LKCmsVkXIZfmg+t7O/3C8THIIBEqRAdtggMSiegSAsnMXFzNDFq98TVykXONyFJYs6OCkIYF2oKedUJCQc8zQAsEmd2l5jZZjirEHsFIPCFpO9xqsEGX++KFDpf1m3nHnGPJWqE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(346002)(136003)(366004)(376002)(66476007)(38100700002)(31686004)(86362001)(31696002)(4326008)(8676002)(66556008)(66946007)(36756003)(6506007)(478600001)(83380400001)(2616005)(6512007)(26005)(6486002)(41300700001)(6916009)(186003)(316002)(54906003)(2906002)(8936002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTU2Q25semhld1RQckxlWElCQ1AyaUNSbExGZ3pBb2pGdUVFMlJYdEJCdlI0?=
 =?utf-8?B?Yno1c2VoeFJFRnZDcCtFYWlBeENsNG5ZaUgzYm02NS93ZGdnK3dOMjRHanVI?=
 =?utf-8?B?Zk9wSUlmMnhuRWp5NVRjc3FTU2Z2RCtKcVFxNFpnWENIODVvR0k5N3hUTEY3?=
 =?utf-8?B?VVBQVmwxR3J5dFI5am5VQTdUVTExZXpJWGYvNGFxUFV1eER0TFNiNGx0Zk5N?=
 =?utf-8?B?RGRTaklBWXdCNHhQZlZ4V1Z0NmNFTGxvVGhIQys3ZmpQT241aWlaMWl6b0Nr?=
 =?utf-8?B?UUJ0UHNNdWFmQ2dxZEFFZ1NhUi9Pa2hFTWtZZEVFT0pDcHlTZ0dJSGJ4ZlJM?=
 =?utf-8?B?M1k5L3FobUp2M21JZGE5LzFsWUtEd2V3R1ZpMUdBK1hIUmdYYnpkUUdtT3RH?=
 =?utf-8?B?L2FEbWo4eVRJN29BY3poRW95dXhKbW1YL1BiUTM1NE1ydzFZVnE0c3ljeTl6?=
 =?utf-8?B?MnI3QzlFNk15ZXh6ZHRZWWRBRVJLVkQ4UGpyclZjYUIxNVNDclRIamxOK3hE?=
 =?utf-8?B?N3IyRDM0aUhQZlBkNVBEWVBFT3RXRUptMWRrdndPaGp0Nm1yYzB2cWlIT3gy?=
 =?utf-8?B?SEZHd29qQ004NTNKd0hra0YyR1FNQndCUWlPU1BFYXhUYlhZOHhzUytsL2xQ?=
 =?utf-8?B?bmtCeTFYUFA4YWwvU0FqODEzZDlmakk5WVlyZkV2Wko3MVF3ZVk0QWRQOEJT?=
 =?utf-8?B?eEgxTzV0dmFWd3ZuWnRpVzh6VnFVTVV0SG5kVFM5WlI2MHFVT3ZVWWkzUUM1?=
 =?utf-8?B?UWd1VHJrTFAwZ2dLWWJKUjZGR1kvS0JFaTQyTmtCTzdMSU9nOE13MHhobld6?=
 =?utf-8?B?QUNHQjg4NitCWTJGSGc3d1ZIRWJzTkt0NUdRalpwWFVMc2lJV1RwUmNBQkgv?=
 =?utf-8?B?eEFDMzFWdTM2N0Nia2ZwM3ozQVRzSWZucGtkbHZ6VXlmTVpRZGdwRmIrVDlJ?=
 =?utf-8?B?aG1jeXNVVGYzQnNTRmlFWXRPaFFia1RLRWVEeU1oZUlmTlM4TTJtVkRMK2lB?=
 =?utf-8?B?NkhweVlBM21PSE15eVJBNndZM1F6S1E3SHpHQngrTlhTeEpxZWdiOUJ4Vjlh?=
 =?utf-8?B?c2JmM25xeUg4OGhwTlpkVHkzMlF5d2NjQ3Iwb2hJeStwQ0dCWHdPVXlGaElv?=
 =?utf-8?B?MDQxN3hKRldRa1hpOXF2ZDl5ZmJkaHNlRi9VNnRuZTRjdUZiT3JyTWsreDRN?=
 =?utf-8?B?TXUzU0ZtWUl5NVJrWUtseFFiSlJ0c0NHaWNZTzhUN3NtVjd4U3FxQ2M4ZzZx?=
 =?utf-8?B?bnA0UUwxQnFKYldxaFdHUEhianpYNnR5eDE1NkxiM0NoY05tWWJPWW1GcnRk?=
 =?utf-8?B?NmlEUm1jMWtqZlkxeFd3dTlXRGlsek84VmtOY0ZoejhHaGM0czhqZzlnVmpk?=
 =?utf-8?B?YWNiWERaVUI4QVc0Y3BsemxRaGxOak9Xc3FqU01zMEtlbnRsMXRZRjQyeVBB?=
 =?utf-8?B?VzByRUdKZHg5VWlKRC80M3piYlRDWFRPWHNiV3lFMFVZZXV1bzF3Z0pNYlB2?=
 =?utf-8?B?UXFwR3FhaGJuelpPS2hiOWhWMzl2WGdYZlVPeXBaYmFJQmJabHZiTFVYVWV3?=
 =?utf-8?B?UE4rc21rQTFrY2JWN0lKcWg1YUVaa1VUajBMUE5ERkdIajdVV3pqRVREdVpO?=
 =?utf-8?B?b2xnZFByYjlLejY3cDBydllTNWw4cVJiT3QyM0hJUys1eE8yVmtTamcrSTJp?=
 =?utf-8?B?aHd3aGFTREk3Nzkya0JWVmVlYURjaUlmVXRqRXdMWGFjbjdmVmNMN1FJMFJq?=
 =?utf-8?B?WllWdncyM212akhrUTJ5cDhON0I4Sm1vNjdpVlNYWElWeUY2RUxSemhPUFV3?=
 =?utf-8?B?bWZyNzg5TU9WZ25YY3kyQ2JoVndxbjlyaWZJdlVPYjZ1SnZ6UFFYWU53N0Zm?=
 =?utf-8?B?ZUpNSGpTb3Fmb3ZVNkZxN2Y4clZ2RUhQQW9FajZmVks5UlZjNi92NVJoRUJB?=
 =?utf-8?B?SDBmMjZrT1NVMHVqZ2NPNzhuNEltWkhza2RSRHV1cjBTQ29HU0FVWWkwRFJW?=
 =?utf-8?B?MTRVWnpaZzF1K0hrU2JIVzhOUmpiRjZOczVhM1JQcEx6ZjJ1b2N5ckxzTE04?=
 =?utf-8?B?ZEFQVStFQnVYeUFacUg2R3ZWVUV6K0t1L2N3cWhOVEdjNlV3YWRBMzgzdENa?=
 =?utf-8?Q?Wd1sotAyZAGo16wP4rmWQG0i+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7769b3c2-bdff-4bd6-d38a-08da948a8608
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 06:46:30.2875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L+WO7xJrd5EIMZbRVdhTAL1UzfLtytZ0gieBgJt0FkYURneSnPRPZ+Fwj9IttFOKxOoV0YOq3x4aoQneAwtmEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8347

Having cppcheck-misra.json depend on cppcheck-misra.txt does not
properly address the multiple targets problem. If cppcheck-misra.json
is deleted from the build tree but cppcheck-misra.txt is still there,
nothing will re-generate cppcheck-misra.json.

With GNU make 4.3 or newer we could use the &: grouped target separator,
but since we support older make as well we need to use some other
mechanism. Convert the rule to a pattern one (with "cppcheck" kind of
arbitrarily chosen as the stem), thus making known to make that both
files are created by a single command invocation. Since, as a result,
the JSON file is now "intermediate" from make's perspective, prevent it
being deleted again by making it a prereq of .PRECIOUS.

Fixes: 57caa5375321 ("xen: Add MISRA support to cppcheck make rule")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Add comment. Add Fixes: tag.
---
It has been bothering me for a while that I made a bad suggestion during
review; I'm sorry for that.

--- a/xen/Makefile
+++ b/xen/Makefile
@@ -746,11 +746,12 @@ cppcheck-version:
 # documentation file. Also generate a json file with the right arguments for
 # cppcheck in json format including the list of rules to ignore.
 #
-cppcheck-misra.txt: $(XEN_ROOT)/docs/misra/rules.rst $(srctree)/tools/convert_misra_doc.py
-	$(Q)$(PYTHON) $(srctree)/tools/convert_misra_doc.py -i $< -o $@ -j $(@:.txt=.json)
-
-# convert_misra_doc is generating both files.
-cppcheck-misra.json: cppcheck-misra.txt
+# convert_misra_doc.py, producing both targets at the same time, should be
+# executed only once. Utilize a pattern rule to achieve this effect, with the
+# stem kind of arbitrarily chosen to be "cppcheck".
+.PRECIOUS: %-misra.json
+%-misra.txt %-misra.json: $(XEN_ROOT)/docs/misra/rules.rst $(srctree)/tools/convert_misra_doc.py
+	$(Q)$(PYTHON) $(srctree)/tools/convert_misra_doc.py -i $< -o $*-misra.txt -j $*-misra.json
 
 # Put this in generated headers this way it is cleaned by include/Makefile
 $(objtree)/include/generated/compiler-def.h:

