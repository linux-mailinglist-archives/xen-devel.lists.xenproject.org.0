Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C10E54510C
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 17:39:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345592.571262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzKFx-00066v-RE; Thu, 09 Jun 2022 15:39:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345592.571262; Thu, 09 Jun 2022 15:39:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzKFx-00064I-O7; Thu, 09 Jun 2022 15:39:33 +0000
Received: by outflank-mailman (input) for mailman id 345592;
 Thu, 09 Jun 2022 15:39:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jWvP=WQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1nzKFw-00064C-0r
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 15:39:32 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on061f.outbound.protection.outlook.com
 [2a01:111:f400:fe07::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a801793-e80a-11ec-8b38-e96605d6a9a5;
 Thu, 09 Jun 2022 17:39:31 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB3964.eurprd04.prod.outlook.com (2603:10a6:5:17::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Thu, 9 Jun
 2022 15:39:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 15:39:30 +0000
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
X-Inumbo-ID: 5a801793-e80a-11ec-8b38-e96605d6a9a5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RUH5oqs7pFPbC8PJof2LCId/UAdxg3EyF6x1zjPGrrITy7M8ZovqG3u4P8MjraPiP6yGcKN5hhH7A2GyAeuOG8eUBt9OgjOmbTkQ92GA/cyja9c3qNQLkYDvCUBgAQJ76JV5tVEZR8GXEKy793fkTaj9JjfxxXcuN4JgXSJk1hKtBhaidQt6GRya4p883ZgjvEocZXU43O1p3KuLeXyBvuO878bi/8jg3MZyOdzKMx+wO9cmGAoxL+veqRGukV02RsUtxYTpCr1bp5o5Kiuy8ja9fDCsGTSoNO5KO94ylxzf3lPOmXIEfHwoFU+OHuOC+TxJvkOAQuSivS69hx+3LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KqPCUXPxC/LvcetQHGK7A6OTL9d/F0npFli+zI/opfM=;
 b=mzMjKjj5N/ID2CyeahjFFwm0UAJxecqg24mvEL8wyF2dVVrrvmxfwzCfRZJKz2+fih0d1dKosvdGZl8i7mamqP/SUOZNL3egN+2PN8XPPfzlHlIQq5CXQXTRmq7K2QKn9p1LLidB+PqZMJIUzVS1ub8sBqX3XCgYBq7/ZLssMDF9PxIr8Sk3el3f7FYptWthj5Ha8c2vj5cMT+X980XsyJveIvaIeMUw+g2Y8g+XJnVExBHOZFg9wQvim21ub9+iMXJoxqWrCiJNJbKLljLdcvHafXAqVKVJbjbwYbQAYDbqg+MJLkMcVOZc8N5tM5oUcEEsBF+RxLHff0pqRtx4Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KqPCUXPxC/LvcetQHGK7A6OTL9d/F0npFli+zI/opfM=;
 b=U77Z/QvIvxy7Yvv+y3o1QfQX2wKPVKI/iYtRxSM6CecU53o5ulwCRePp1Md+HdY7/fdgToK1vPZvDZK7BsKD98V6e+0ouDNZ9S6pQEYgn+5eSWfruPmR1jHZ7YEl/VRi8XbJMoxlFBjgs8ZjnD1oNI5jj2g/CMFiCW1A+szPz5DFE59ck/HVG1FOXhFQeMTHr2gsT3x8e0VWl669o4U2HNBSZHBgJVbU1H1UN0arLGqclfPNfZfuSO9Auvi50duYQjRGjdev5x4G2WTELf+yAVRabPlVYhykiN7OgSzjn2Pe/TA/P0uiaGWopNpl43pNDauD0kkGlDbOnv/IKZn5jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <56d16bba-05db-cef1-0746-1591a6744afc@suse.com>
Date: Thu, 9 Jun 2022 17:39:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/mm: further simplify cleanup_page_mappings()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9P251CA0012.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:50f::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ef5e3fc-31d7-4ebc-f616-08da4a2e3e2f
X-MS-TrafficTypeDiagnostic: DB7PR04MB3964:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB3964797BE6BB90AD19366CA7B3A79@DB7PR04MB3964.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dgqA7CW8l45UoHUeJgdiTe5OlAHxzUyVbpkT2OIWihT+Nb18iuV1H1cxV6nJJaGq3rZSb40k0Z7mYRX+PAKxIktpCNeBV9mRpsaXtxQk0J+K3XN3JTrVn6otYHKhnQXAtU2Y7ZOqWPghOMsf+AwMqoOG+LxPT2W0kh4DMX8ZEBDz0/IoKLcK8/mJjnKFbBM3klGxW0suuekjArbcLLruEO05U72QeVEkBMl9PRA8xCy059AxdI4ULC3QPUJ3k3PDWQgeN+B+r7Zn+CXiT9fqmJqttlPSiNtp6lUSNmj7UwuIdZNSbyiQIVyOo3DTOXj1IZn4wJqDtqBBLc/qvwusORoKqUGbqh7B85OkEdyvO7E4zOUubNKyEohgPdxwZ8giffhdS93RoGrgqCUdlDQbhBIJDTbmYvQz91D47sYPVTtaJ1MyRZJ1xu5H4PlqHaR8ySkWndsMZM8dreWgTFlZh3dfKsgKf0NXUIvA1eKQdTtP6vKzTJewoSLH6GfrnljS+S8jG14HM3+Yz+gh9/rSEaOoZogrW6XhinX4Kh6pfXuYdfpZ4mRZCNinPLWe0fqX3KHPeAyKW2uREv162DkxtbuEiDGnY5Ez4R1sBsCNtrbX4bIEyiDBwO4ZzKY5OTglj0AM25gXdzxn05J1l0OiSOiX70wpPMLjc93Mf0JETjBlcLfIChevKSChXA5divHB+4ICyfWzrhv1WjGiUgv0MYzj6kyFDJr+m8h+n0P170ALeuviibZrm1siBQIkh9V1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(6506007)(6486002)(2616005)(6666004)(6916009)(54906003)(186003)(316002)(8936002)(38100700002)(31696002)(36756003)(83380400001)(4744005)(86362001)(508600001)(5660300002)(4326008)(8676002)(6512007)(66476007)(66556008)(26005)(66946007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2lOSXdIOFVxeE5kWUhZNzdvSWs1d0J1bjNvZ0FLQ25WT1V0WThtL2JQQmNh?=
 =?utf-8?B?L3kvVzBJQVhxTDMwV2Z4UFRvN0dSWUZHYUdPY04vS0JiU3ZZMGpoTWhiTml1?=
 =?utf-8?B?RGdEY09KRC9FU2FDZlJyYmN6SjJGNE5mckY1M3c4dnVQZTBWY09IWmoxZjdt?=
 =?utf-8?B?NU5qelg4Z2pyeVA5cUpKUnkva2Nub1Q5aTRJdnhFbEpQZmpRWGNNRXVYb3Z5?=
 =?utf-8?B?SzU0VmtGcFUrQk05ZlZQbmxXSWtPMlZOVTMwOGNqTnl2YmNyUktxSEc0bXFI?=
 =?utf-8?B?ZGkvanJlTjIvMlJPdXhYc0dXY1pRZWd4RndsYVl3NnlhVDFkN3lGTTlQMDdn?=
 =?utf-8?B?MjZrc2ZOUWpTTDlUYWxoQytyNVB3ckYzWFIwbEFkUFVuWXY2eDhXTC9CM2JO?=
 =?utf-8?B?amZOL2Z1OGxZZnlEa3hWMzFrMi9GNkhLWnFtbnpNOHhYckNkam0xck96bVRp?=
 =?utf-8?B?T1ZhMlF2b0lkazhLcDdoVUl0TzlFcHdrdGZqKytEOFdCK3ppcDdIbjMzdFNj?=
 =?utf-8?B?eUNRV0pBdzdOZTg3dDUyYWxRWW1KN1NFN0kwUEF5RkYrNjlmS0pqK250ak9n?=
 =?utf-8?B?WHpxMkRKKzZsOXF5VjFFVFltenpCSnFPeElDaUhtU3o2WS9ib2JMdDlIdW5r?=
 =?utf-8?B?dWN5WStpbEhPL1pGT1hlUW9pRHFJVHhyMy9uL1ZpdlVpeWhuM2VmcE95S2g3?=
 =?utf-8?B?R0FRRW5SSEN2eVdHb0E2TFgrME5NaVJoV3ZudEdqUFVER3ZFbWpIQm1Kb0Q3?=
 =?utf-8?B?WW5sR2hCTStFbTQ5WXMzSy9yb1R0K0JKU2ZEZ3RjNlA1MnNrUndQVW9WQXJa?=
 =?utf-8?B?b2RzTVY2OUFvQTBUMk5rdHV5OWVicjBjeDg2ZXZSVjVUcUhyZm02TzB3L2lm?=
 =?utf-8?B?UzlYd2ZibDMzZjBMbk5SZjk3ZHA2eTFZb2Nab0k2Q2l4QkNvOFdKVi9QZFJZ?=
 =?utf-8?B?R3lTYlEwdFc0RFJrV01XVUZ0TnVpTkNYa3dKTXN0aXRkQzhlaVorT1ozdGJk?=
 =?utf-8?B?WEVnNTJJdTl0OEtWKzRKbjJRSGxzcUZZaEZ6SVo5dzJaakdWR0xabUYxN3BN?=
 =?utf-8?B?ZmpvSDYwODV2bFIyRFpxcDJEQTNYSWtDZktES3dveHJ2RkhOd0swUFBWNDZJ?=
 =?utf-8?B?V0dzSGk4dEtWNmZKek9HMjFaNHgwWGVqaGxxamJpWjN4bmxnUEtzckI1V214?=
 =?utf-8?B?YmtGRnhHZHl3QkZmTzJZWUx4M2dlVlc4NDEzUzlqcVhMRlNOVXZaQzAyYWRJ?=
 =?utf-8?B?T1dXdjdYMDBMVHJaWWtaQlNxcFAvclliWU5MTUJJMDRaRHZ1R3I4T1lvRzFM?=
 =?utf-8?B?cEhrK2VCNmlSZ3krTnM0SDVEdC9IeTFIcE5qMmhwOTltaXJmQ0RHeWc3VnZK?=
 =?utf-8?B?T1pxdWd6cUx1SHVwUWFiSXFFSkZrYXdoamdTM3JzcVRLeWRKMlJXT0VyVjRo?=
 =?utf-8?B?TWhXYk8rVFBZMVhCWXRlT2NXck1yRmNsUVByd0ZKRjJ5N0tlTms0M0tDQlBm?=
 =?utf-8?B?RDdBNE9WZG4rYzloMy9qZVNxTW1DbW5nZmgvc1R4Vk1XRHM5RWpxYmRvd1Jh?=
 =?utf-8?B?eWZubFJoU0tRdndML0t4cFlSV0RJWXdxZjRyRzlrY3FMS0VleG9Qc24xWU9T?=
 =?utf-8?B?TklpKzVBcEFnNlJLQjhFNllMQUt5V1k0MHhFc3duQkhvU1BCajM4Sm5iZE5m?=
 =?utf-8?B?SW1kb3pjdGxGdnJSck9VWWVSTGNhV295UE5xZmFIRG14ZERyZXFwVEJCZTM5?=
 =?utf-8?B?K0JLZFgzZytRQWN3T0xCVHlDY3hBWisrd1J0ZDZoc21HWGZNVlo5SGdKWEox?=
 =?utf-8?B?eUY0N3daNlAwL0R0YWM4cTNDVkhEWTd5K3JzYnl2NnlCR29GaU03cTJaUkUx?=
 =?utf-8?B?NjlZWWtXTjViR2ltVGtVRlBGd0NWODFRQWV0Q25SdVlScktYU28zK3NwSGNs?=
 =?utf-8?B?b3d5cldoTWVuTE53RXpITEZFdUV2STZXd2xZSThCbGdJZ0xIR3J6ZDNrZk9S?=
 =?utf-8?B?dHU0VVRjV3NZd1ZCckRYTmNESGNaTk9HcUhTWUhSVW8zeXFGa0NpbGg0UUdI?=
 =?utf-8?B?VW4yWi9zSmU3WkJ2czlhbXFVR0pUQXJrR0RRNFpnL3FVZFBxd0dROHh6QU1z?=
 =?utf-8?B?SjNjc01OVWM5clRtblhpTlMzUFppVkRkSVVVSTIwMDJzajZXejAxRXQyQ1Vt?=
 =?utf-8?B?Uzc5NWlxRDk3QmF3Q0RiR1ZWNmM2OStYWWRWOW9MQzJxNFVmR1Fxc0dqeHpa?=
 =?utf-8?B?YmhIRldWK2JyTEk1djVRZDh4YU9FVnBOd3ZYWCtQaDJZLzZFbFIrUTkrR3RM?=
 =?utf-8?B?a3hGQVpOZG1yOUtsRjdoZXhOZEluRzk2aS8yeTg2bjJMWURtdE5CQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ef5e3fc-31d7-4ebc-f616-08da4a2e3e2f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 15:39:29.9878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: svo3/M00rfo6WCkSkWcfSaWcwp6pgHn92ZIYGWWalOrktFIbOkDH0d3MfPX3CqelVushbLsIQfuik/F7LMkAXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB3964

With the removal of update_xen_mappings() there's no need anymore for a
2nd error code variable to transiently hold the IOMMU unmap return
value.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I have to admit that I was tempted to get rid of PAGE_ORDER_4K at this
occasion, as it feels awkward to me to have such in clearly x86-only
code.

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -2470,12 +2470,7 @@ static int cleanup_page_mappings(struct
         struct domain *d = page_get_owner(page);
 
         if ( d && unlikely(need_iommu_pt_sync(d)) && is_pv_domain(d) )
-        {
-            int rc2 = iommu_legacy_unmap(d, _dfn(mfn), 1u << PAGE_ORDER_4K);
-
-            if ( !rc )
-                rc = rc2;
-        }
+            rc = iommu_legacy_unmap(d, _dfn(mfn), 1u << PAGE_ORDER_4K);
 
         if ( likely(!is_special_page(page)) )
         {

