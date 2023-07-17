Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A58755FA3
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 11:44:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564340.881797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLKls-0005jT-PC; Mon, 17 Jul 2023 09:44:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564340.881797; Mon, 17 Jul 2023 09:44:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLKls-0005gY-Ly; Mon, 17 Jul 2023 09:44:00 +0000
Received: by outflank-mailman (input) for mailman id 564340;
 Mon, 17 Jul 2023 09:43:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hD51=DD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLKlr-0005gS-Dj
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 09:43:59 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2078.outbound.protection.outlook.com [40.107.7.78])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73a69dfd-2486-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 11:43:58 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB6916.eurprd04.prod.outlook.com (2603:10a6:208:185::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 09:43:28 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 09:43:28 +0000
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
X-Inumbo-ID: 73a69dfd-2486-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MmKEmda/RnE6S7CzNwixU458Dds0wbfHiRMjAT1ZBPGNFe7fiMwPCozK8Ru17ogj59ZzG3vQ7ktfJIgkMucksoWALzpps/iQLz67jdLbTd0HbYnScEKQK+sMlCo4LGj/fX06DOEBTDNFeo9tb/4arhd9QUvKxtDPQzny+k7q+78ohg1pq+ZsHdBUOoRLgPwLouZVLvghEFFdSqLidpnVJPzpSvkjsR1UL12VJwfBuX1d3+Cpl5K43BHXeIxfRvYERXYZcaCev9d/Jn9k2Dj9VjUnCpq4mqw0ahMzBATKx8BdceN1knUFUVJWDn2VzYoCFfwYw8pI34kV6Q/HlM41+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qEj9eXO7lsrKeTJfCmJD/7oAg8dzzkd/vp3P4GDAS0=;
 b=mxR5AKqKd7IvBTu8neEgRsWyH5jCPm8xiZebqlEzF+5ezT0AQAqKAko/eSb0WdeLMC6Did7W329JYaXGqwzDR1InlHJ536+LFZTAq++x54EF7NSIxAdLkkUuCh+SyXIFUMBBF8NQKUCSS8f9J+mdN4uypppO9i/SQIwzlMtECxVAs93t8Y98VYcB2WAXxmI72q/66Z9tqxEqfEb9qGGdDZ/mZG42cbBPXTKwazWkJ3DGz5sylZtHHCUBOdAGtqN7pFboMcCXfMwbu7YddM/7ak90zzgXklyJuu6td2dE69vFmrHCfyz5UZKD5LaGuXvDt6w+atFKrvZ3blhJDw92PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qEj9eXO7lsrKeTJfCmJD/7oAg8dzzkd/vp3P4GDAS0=;
 b=msZebKGH2sUYbJ8+1vMB00JM8i/tN1QhuO94VzoiN147g4lMPipz9LdbJP0M/dg2c/kQaY6f7EVW5I7iyJGyTQlBKI0WfCkHpiN3m90ZSTwVV8oHTjxgbr/djbvawBVMs7hHrhx5lyxaZAp01ZN/+4xk8OUJcwEKdGTl+MZUQklESyKqQE0uNhiHmSy81GqU72gLR/BQ6a7Jurm25+cNHNJMMZNRCXkxmV/wxDBHuykLQOBxzqDGaKOLoxp/1lQR6T2YKKtyg/JBht6bs1UqKxlgYoBuJxbnqpwFBoMyVhXP+LdwU/9Px/2fm8XF3GoA2PvrXXelvdOGM95G6I2HUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <93646ba2-ca84-755d-290b-d7470827ef46@suse.com>
Date: Mon, 17 Jul 2023 11:43:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/ACPI: correct off-by-1 in SGI MMCFG check
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Gianluca Luparini <gianluca.luparini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB6916:EE_
X-MS-Office365-Filtering-Correlation-Id: b2ba0480-5a72-4694-680d-08db86aa4638
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nw/PQgzl7t1Hykb7mI2wPA0SpBMkh/dbzIzW6nRubT/5ESINe6JUbzTxwXeBY1hSjKwfE+s8Lna1Shfgs+qksBL1Zjpj97LafLqb4ZHz6sg7WD1ftFolt8yq+ABY63YIEagZ58lLyFFXCQKHVlB132ylhdhswF2RkLzwd/M8Y4J9QLW4XEy79HEA83CMJcXXeIeTzNLKBreEIFg1lYt1gdfI5wvX839ne7Ne6kzO4I4Rp2KZIvqHTVLjMdKtcHRUsi0bUt//EIH2j/c2tBbwPuNJQklZTPTO7g4/EuRchZ/YybOdjffNhQe+1If8HBEUKqvnnY7uiYspKunbIQRoDp3ZyTIDQyOXSWhQcx2Q3sl72GgYuvddcmEVGnHb2bjIi7xAYsZtaKM+U4xCmgT7tKze5SIC3LkprdegTSU4vUHxMj3J3YXREwmUex8eft8vizEIr/ey6YKNgmggfeUDCrjTPZjizXQ8FJqWI/zTQXx1rySpERHkNxmy4uZ2MvhQ8M3BZPcfkdkMTNoDY/1suluqA+GDgYY3MWyowLezFCi5F2ICT1kWQdiQbCeCe0DL3ETG9h+tUeJIQPpFaWzEjpNEIUpDoahiJ+Vqja336B5ZTy6JwmEEAZO6T2kHzOGJEg6l/2KokwQlgieDJUM92A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(376002)(366004)(396003)(136003)(451199021)(31686004)(478600001)(6486002)(54906003)(31696002)(86362001)(2906002)(36756003)(186003)(6506007)(2616005)(26005)(6512007)(316002)(38100700002)(66556008)(4326008)(6916009)(66946007)(66476007)(41300700001)(8676002)(8936002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUtPUlVYZjFoU0VyOFRQeXRRdWxqZnpDN1J4K1dwSFZOVXZKR0NDNHBtNkJP?=
 =?utf-8?B?Yk9wRWdWOEFoWVJGUTNzRkl5NzBjWmNmYzhaWWJkbXU1SjA3dnVoWWNNcjFk?=
 =?utf-8?B?N3RnaDdRblU2d1IxVld6MDFMbER5NEFGdjFOMWJNZ1dsMEh0TTRrZEdoWWlL?=
 =?utf-8?B?enhXZzc4VlpleDVDUjVkRDJzQXhweDVuUS9IbURwclZJSlZhV1ZNd3VtSjVo?=
 =?utf-8?B?WWtIVE5JejQ3bE9XUDJ1QjVRZHJyQ3JIVHRoVkhac3RtRXpKYzBkdTE4Y215?=
 =?utf-8?B?Z2VYUHk1QnJqcWZzOU5xMmhPdWdadE9zbzdYbldxeHlEczlpb1kzNEtIRm54?=
 =?utf-8?B?bGFHREVQYjZFcGtZM0E3NjRmeGY0UmpBTkJLM09uYWtJbHdrUkN0dE1YUDh0?=
 =?utf-8?B?RStqZWtKTFFtMFM1NEdxaFdjNEE5RTBNWTcxeFQ2dWFiT0hJSGkwRGo2Tng3?=
 =?utf-8?B?ZER6cTg2R1dxV3pnT2Jacko2bUIvVVVjb1pLU2NucmtVRTJUbzNjSzRNRXdN?=
 =?utf-8?B?Z1gvUklveW1JM04wYU1mc2dITW1TTDRJT0xSYXBMdThWWDNVZFBidnk5SXRY?=
 =?utf-8?B?TytPQTY2dW5raElqdWhBY0hBYzhuV3l2UmhrcnE1KzVBZG4yNytpN0lWMWZx?=
 =?utf-8?B?Zm9IYU5PQmNBVndURkxFMFhDVys1aEJDWHl0UmMvOUhLQWtyU2lVK2R4d05i?=
 =?utf-8?B?ajVpZkJtZ2o1cUpNTkdCejhNQzgzY0c5bCtLZ1I4Y3FlUDRsaW1CeU1sQzdQ?=
 =?utf-8?B?U3hJOXpGK3BydVZYcGxNZ2pTUS9GY3g3VTRITlV0c2R3dEY1RDFBc3FQSGJX?=
 =?utf-8?B?OXhvdW8xVS9kUDhpMzFWblA1UHBRQjJtTDh1cHRpbzJOaWNWeWFWRzJXekFG?=
 =?utf-8?B?UEFFWTMrSFZST0NQYTgvNFVvOENPODFVYTQvcGo3ME1rM3diTW5kcUwzOW1K?=
 =?utf-8?B?UllQUmhTTnJzRU93MWw5K3MzZ0hEQ0xHcUxKZTRvWHREWnJGczZUYnNwSDRq?=
 =?utf-8?B?MlUzY0p6VklkR25KKzZGMlpzc2NDeEEzeE9qOWNBcFB5c1NrY2l3N3FxM1U4?=
 =?utf-8?B?RFVFK3A1dlQyVU5kdTZJVGZaRFdRWFBOdzA5VHROL3FBNGEwL3BhTlZVTG5X?=
 =?utf-8?B?SXl6TzV0bW5SUkdsN0FzSXg5K0Y5bk8wN25mOGdHMkFrSXpNdDMzb05xdGxR?=
 =?utf-8?B?aS9obm9kRUFLZ3VQVEk4TmF1RFM0SXEyWmlwSzhrYlZlT2NFajRNM0FxU3pR?=
 =?utf-8?B?WHF0UFUvdDBYaElTeEFRTEh4aVMvZnVjZ3ZNa3ZOMjhvalZTQ24zMUI0SFV3?=
 =?utf-8?B?cUl2SkZFOExDcW80ZzgxT0tiNkptYWRNckFDeCtWc2VIc1pyaXNkNnhuMnBL?=
 =?utf-8?B?U0dLTFVBKy82NUxWUmwzQ080NEVIYUU1bFY3N0RxZVMxaHUrUjRsZXlvT0xN?=
 =?utf-8?B?Z0JnaXNUZ1B4a1lwd2pYZGU3cWswT3lmQWlnUDRHTkppQUF6eDVrRmVlQlRY?=
 =?utf-8?B?UFQrSXZ4Y3dVMWN4WnQrNHNjVmNBdWJwUGpTUWlvQWgxL3VsK1c1T05Ldm5G?=
 =?utf-8?B?WTE0a0pEUW1tRzRsUFFwTExmYjZHYm1aM0pNcnd0azVDZW9UMmU1SGVOc2d6?=
 =?utf-8?B?K3E5K2p3NlNnaHVmRTRZbE15N1RxRXU0bENmQ291THl5MSs3eGdzMTNwbVFr?=
 =?utf-8?B?cCs4UzBWUTVYR05QSDlGUW91eXA4azBzUzJaeEZNODVoOUNKZm00MnBUSTI0?=
 =?utf-8?B?Y3dLZDA3SWxuektidEY4UmJtL3loMm05NFF1SC9MTjdTVnpTOUF3MTR2VHYz?=
 =?utf-8?B?OGkvbmgvRkUrZEI5d1NxQjF2UlBpUVJySGdHMjgxWWFlV3ExaWlUWUpaSXRL?=
 =?utf-8?B?eU1oN21pbGk4clJTeUNQYjdaMjBhbjRTZDBLMEJXYi96Z1V2aTVRbDJhQ2w0?=
 =?utf-8?B?Nzd1eW5GOG5mdXVOa09nSUx1RGYxM3lPZ1IyeWNlaU5mM2hLZmxxcHJLcmJj?=
 =?utf-8?B?dEx2K1hWUFNoSjJKbmFGZ09MbmRkcytZaXhTQnVISjBKbjduUXNUcndLYTl6?=
 =?utf-8?B?bUE4dUJFMXVDQmlMWjlaNndlaXczYXJBMEpydCtrL0lCRmR1ckhvUXJvNE1h?=
 =?utf-8?Q?PWTkdCF6fYHCZFjulrriIsNtj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2ba0480-5a72-4694-680d-08db86aa4638
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 09:43:28.4625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CnC+ck1CyM0JSMEfYfiEI0Sm1ObkEsrNoozls7f7ptkc5x35U1pENLqKclfIT2PzX7spogIkppCgKS2RL+rj3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6916

As supported by the printk() (deliberately made visible in context by
also correcting a mis-indented return statement), "above 4GiB" is meant
here. Avoid comparison with a constant to "escape" Misra rule 7.2
complaints. (Note however that even up-to-date Linux, which is where we
"inherited" this code from, still uses the very same off-by-1 check.)

Fixes: 94ea0622c5b8 ("x86-64/mmcfg: relax base address restriction")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_64/acpi_mmcfg.c
+++ b/xen/arch/x86/x86_64/acpi_mmcfg.c
@@ -50,7 +50,7 @@ static int __init acpi_mcfg_check_entry(
 {
     int year;
 
-    if (cfg->address < 0xFFFFFFFF)
+    if (cfg->address == (uint32_t)cfg->address)
         return 0;
 
     if (!strncmp(mcfg->header.oem_id, "SGI", 3))
@@ -59,7 +59,7 @@ static int __init acpi_mcfg_check_entry(
     if (mcfg->header.revision >= 1 &&
         dmi_get_date(DMI_BIOS_DATE, &year, NULL, NULL) &&
         year >= 2010)
-            return 0;
+        return 0;
 
     printk(KERN_ERR "MCFG region for %04x:%02x-%02x at %#"PRIx64
                     " (above 4GB) ignored\n",

