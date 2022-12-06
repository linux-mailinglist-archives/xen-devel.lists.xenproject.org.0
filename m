Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 866276445AB
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 15:31:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454994.712605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2YyL-0001l4-Tq; Tue, 06 Dec 2022 14:31:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454994.712605; Tue, 06 Dec 2022 14:31:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2YyL-0001ip-Q5; Tue, 06 Dec 2022 14:31:01 +0000
Received: by outflank-mailman (input) for mailman id 454994;
 Tue, 06 Dec 2022 14:31:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2YyK-0001UP-9C
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 14:31:00 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a3d264c-7572-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 15:30:59 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7777.eurprd04.prod.outlook.com (2603:10a6:20b:236::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Tue, 6 Dec
 2022 14:30:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 14:30:58 +0000
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
X-Inumbo-ID: 9a3d264c-7572-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JeUB6TRMxLE1kqMmMMiGHWEtfugNz5w9KjGusNNijIZJDr5NzsO7S9wTwU9WpXWDtD4opSSGn/OYI3sqcszLq8R+Kqp2B1Yws3pY2iX7upt3GKiNBkj43tuHCMuDX+6UXoE32HyOBvHl5UM87Bvev+zE46bkj4efleU08grJ5ll48Hc6lCPrDV/DmsHVTrrsqcu7dRFe7ZaLsprJqFeYBclm30xriMvje+ScEZz5xdx4UbyeZ2PTb3SqCysTyaR7L5cPQdRtmQwAB04NC7erGMcliWNzqal9oCebEwfr64WAfJ03MsiCdunZNltBxPnsJJoyuPaAaNdPFoMj+fZRpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQ0cKDf1wQu9lbiq2UBIF0gkVWSNaxD+TG1S5rB1UXU=;
 b=AMIx2dgtP1NRreexgM2LfFssu0O3+36f2sX3YAd/iZw+g4A0MHgXdwR7V2QCTuotK4AUX/wC2fKQHPj0WexbS/1ZA58jKn918oAodVmec6qc6m2LAliJbqpDIsZdNFyIyxDXYYC5QGSjwR93y7GgWJVGqCiS9DQSawlxnwG6UH54REQMCeOO98uno0B9e5o2W5CqBisbcrT8KcJnlay3r9tN8tVoCXRqmLL1+F2PFgkXl6HiinzIZ1VyQ7JRBZMn2QOwrxjn8HQVTrMSbgs/Ngfz19+Ib7tmTldUS6byjs8W563WpwKQoXfAWJJKEw7enxbfcksIZaxhzS1HzIQOQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQ0cKDf1wQu9lbiq2UBIF0gkVWSNaxD+TG1S5rB1UXU=;
 b=eq9MdmrupY/+wctkyBni/S2A5h+KN6PCzYYdeeFk5DPeZqvDBnxsLS2dFIx1S2B/NZan5T5dpT9ck672D6MX1FWa1qqbFCDCa9dp//LSenxOeY6XV0QkrzfiSvOSrk2f1DpsBixPkSlSJuacIgIFjmCSdJKQaEW14OviDjLTJqgqphv7xKpm2UKjtr7kXTNnyl4HbtWl38SatKMte3wz5c43GEalZreHyXhSvCJ/czunbLEKBJRkj+uAZA3qCd/XttUbFt3qohy0GhoJD6pOTCav2oJW12jnvbJRrXjcXCaD3D53S8zW9Vrm6ev/NklM1twNY7IXouP92JF9HAQCDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <958b3fc2-705b-ac93-9a3a-ab1bdeecf752@suse.com>
Date: Tue, 6 Dec 2022 15:30:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: [PATCH 3/3] x86/pv-shim: suppress core-parking logic
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <e5833b09-0ce3-b991-111e-07e64dfcc85a@suse.com>
In-Reply-To: <e5833b09-0ce3-b991-111e-07e64dfcc85a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7777:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ff10567-edd9-4614-f6d5-08dad7967dc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xVc2xtXrbY6p40IsJtFB2gdfy84rd82FGKeNnIdDug8HoUmuVCQg7OHDvVVWYr8sD7JsLhINJ5Gn5xcUnwAzmfVoXu64l7XQqbsX/xLF3E2htbqF4K3X/I8ki5smn0DxyTM1fG0KmFQ80Wy/sAOUe9nNyiRHcUj6JakHqpTMoywaF5JhlwuOkfo18JDBqCHCbXTwJGiDnT+CNrrAsFXXmsCRD1wnVchDRpCMwFAkNFT3sD3tGHXNYmROdj3IEnlNQoX7GJvhvWb9HA91ZyzA2lVrVkU8v7H4JDwrTU9f1k8SpFXCRialT+QMK+R+sy/nJ+uYSoTT1eXYoIzS8TMYJ9BtsDbNkyCa0oXdAmbHCkHoo0peFJw3prv0MPyOsSQv0JHi6idfluBGdEgGZT0YgZpL6lFSKRmne2Qo19ZuiNA0FhLKjN3sST6m+NIlg78RPTQ7G0aLtVfCAyyCO2XWKmc6VKugO75AK55TO1SoKvQzPLzsRs5lI9/4PIJzpyUqzF7gqxCtmg+pkQ1bBXeqR9dAAAP9woR8O2Zr4SIOedre+jYJElYrQZ1h9yZM1DUKTbpKsF+nCmZadakbV3ysfenwNHDnaSblJ4ZwhSODkvFOIEppEJ19gjNGZlG0CtdulYJtRyps5p6pK7HTBMkbpN7uy4voAKvvHL1a8ltHL6BbMf/uKyW3WYktLR5sY1AnRviS/5tkoW7UEBX31qj0Tcf4GY/wEeNdXeUIkmUbn6U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(396003)(346002)(39860400002)(136003)(451199015)(8936002)(41300700001)(38100700002)(5660300002)(31686004)(4744005)(66946007)(4326008)(66556008)(8676002)(66476007)(186003)(6486002)(2616005)(36756003)(2906002)(26005)(31696002)(6512007)(6506007)(316002)(478600001)(6916009)(86362001)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1pBTzJiWC91dk1WbEFMRTUzYUEveGxJV3JMTUlVRW9sTzVSUHhyMklXYThY?=
 =?utf-8?B?SllyWWNKQU5HYVIzTXhNU21TWEs0TjhTa1lTQXhiMUcxRG9BakUrazRsT2lE?=
 =?utf-8?B?ekZlVnBsVzRyamduY1k0MmgxQVRzTUM0NkJia1Q1cjFWWlI2SHhEbDJXbGVE?=
 =?utf-8?B?aTY2NCswWGlxeEticDVSRzhIZC9PN1BKZ2pxQXQrRldlQUw4NUtISjZhMEdB?=
 =?utf-8?B?ZlJHRm5VaUlLT2c3eXg1MkJmd1Y2SWpaOGZnbDNqUUxUUWhUd3h4OGlSeW1v?=
 =?utf-8?B?dW5iYWkwRFhueVJIWndXdEFBS3NpV3V1dk9YMllhWk1KYm5CVkMyZnBGUExt?=
 =?utf-8?B?ZGtGc2NOV29yckhNaUVZZFNxcW5jbUFRcCtGVEU5Z0xldS9DRXI1OGhFOFRF?=
 =?utf-8?B?RG9kajJ3QlhRYWdUQVBuZDd5c3dhd09JZ1NSWDR5eHFodnpaT09HV0JoTThn?=
 =?utf-8?B?YUh2NnVEVDZRdkJud1FhTWNtTXRoTldEbzIwSGdMT05jWjErWDlOQnJsRGdU?=
 =?utf-8?B?LzlkeXRGUXJwTVZsT2c3Z0t1eWZwVFF6NkFiMkQzRVk2RmFRTlQvbmc5bGlU?=
 =?utf-8?B?VjVINmN2N0FCSHNwWGpPNEhzdy9HRThYQ3FmRzc0NjhpdGtDNDNySW5LSDMx?=
 =?utf-8?B?VnNCVy9vSDhjRG93SFBSKzAvYUFCdHkrMXpuQW9RbkwzU3JmcW9xTEc5SWFR?=
 =?utf-8?B?M2huWE04WDJtT0NNTnNQSityMVRtRFFEbVBEVHc1UmxMNjZIVmtaT3pXYTNU?=
 =?utf-8?B?TFN2VEpNSEc2aDFCWmR5UExuNnh3VFBJeWZFaVNiVU0zRjBnMGQ3TGJkSzdo?=
 =?utf-8?B?MlZ6UU44ZnE3YzZQYUxkYVZqaFljciszM3YxU3NUNHk5K2lJTVNSb0luZGRM?=
 =?utf-8?B?aTFIQ1dnWVRTalpuNnVWelpSTkJtdlRUWXEyVVhlL3lkU1J5VUY3YmJxcnBm?=
 =?utf-8?B?a1d6a2FIUXJaditkUnI5SkpQNjNJRU1yZWdaWTR4WTIwWnFObDBJeWt3cUdY?=
 =?utf-8?B?bi9RUmNhQmo3OWxTTWd2SXljZkN4bHA0ZXNrakpwcjhqbFdXNWJmNlZObXZX?=
 =?utf-8?B?RndmbmFVeExkWUtPc3d3dFVMU0p5ZENrbS92Q21xTUdES2hsRFJxZ2FOd25r?=
 =?utf-8?B?VlRhVFdnYytXc0ZkbUNwU2ZmbExROVM3Wk9SOHZDaWNHNTlpVExKY09wSk9G?=
 =?utf-8?B?MElldmpheTBQT2o5SCtoNGoyNHFwTkFReDdkYVBaK2xnTVNlbXBKc09vekZF?=
 =?utf-8?B?ZG5IYnFmRTBGVHRPOVJ1dDZLc3BQbSt0WUJaQ3BhbXhscEZ2emtXa0hFa3pC?=
 =?utf-8?B?RHdVVjZ2Y3lQejdsYm9QdnNscGQxTk83SEJ5aUtSOGJQR2JVZC9jZ1dLaTlz?=
 =?utf-8?B?Q08zWllIcFRUTHJhSmllaGQvUzdjazN6bVdKc1czYmNNbUNKdVdLdTl2V1ZG?=
 =?utf-8?B?ZVlYaEk0ZEpaOE1ZMUFlb05sdGt5VVBmaUdxMXhKSHVPRGU5a3VRZjBvSm54?=
 =?utf-8?B?WU5TcTh1dDFaUk13aWExaUdONk13ZDIrdy9PVGIycmNkMlFjM1dieHJlLzhY?=
 =?utf-8?B?djFRcitxM3VyTW9qK0hLaVZNZGN2RkVrUEVTNFo1N3JtZXBLRWpmY0VwRDYy?=
 =?utf-8?B?RmU0UVBGaEtabWJRSzJXTnpPZVN5Nk9ldUU5WjFnbXlWMDJidUJ1Q2NkV2dh?=
 =?utf-8?B?M1ZhZkY0TlNNb29DWTVzUlJpK1IwYmlVV2tIeXdTdHFZMm9CWGVYN2FpN0FP?=
 =?utf-8?B?cjM3cjI2TEZmNkptZktXSGVYbW9ONXo0dHY0REhNRy9kelRtSFphS2J3VW1C?=
 =?utf-8?B?QmU4bXlyUjg0dEcwV0J3MDRXMGxFRnZkdEk0cy8xaGRZK2plOWZvdlc3S0N3?=
 =?utf-8?B?Q1B2SnlBZkhybzNVcGE3MklQUjJzTVV5YzZmK2doK24xMkd0Z0JyWnpTbkN0?=
 =?utf-8?B?S0p0UDFUM1FoSVZqeWpPYTZvM2hmRGJhcXYzbzBFYTM1WnR0VHZRL2NwdjEw?=
 =?utf-8?B?UmgwL1M1M2w4aDFBT2tCZHBqUWs3QngvTGVDMzQ4c3RFclllVmczVkNDMHhq?=
 =?utf-8?B?Y2VyVytDb1pGaUcwQ2FPZlNhOU5vT2lnMWJjOUZ6cCtVUE0wekR1eXdZUGx2?=
 =?utf-8?Q?6zoW46RfRvcd/QJ33gxT3MW2L?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ff10567-edd9-4614-f6d5-08dad7967dc6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 14:30:58.3166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sGD/m3FaPbyhiB5IT41RqeQOOX210ApIsFZ9csvmn/GO0c4sQL6y3V3TcK8bIZS8SrTOol3t7Lwxm3kRMJnDNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7777

This is all dead code in shim-exclusive mode, so there's no point in
building it.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Contextually depends on "core-parking: fix build with gcc12 and NR_CPUS=1"

--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -10,7 +10,7 @@ config X86
 	select ALTERNATIVE_CALL
 	select ARCH_MAP_DOMAIN_PAGE
 	select ARCH_SUPPORTS_INT128
-	select CORE_PARKING if NR_CPUS > 1
+	select CORE_PARKING if NR_CPUS > 1 && !PV_SHIM_EXCLUSIVE
 	select HAS_ALTERNATIVE
 	select HAS_COMPAT
 	select HAS_CPUFREQ


