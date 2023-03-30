Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3916D0334
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 13:31:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516654.801136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqV4-000458-2E; Thu, 30 Mar 2023 11:31:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516654.801136; Thu, 30 Mar 2023 11:31:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqV3-00043E-Uh; Thu, 30 Mar 2023 11:31:25 +0000
Received: by outflank-mailman (input) for mailman id 516654;
 Thu, 30 Mar 2023 11:31:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKpO=7W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phqV2-0002FN-5T
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 11:31:24 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20628.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66595093-ceee-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 13:31:23 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8980.eurprd04.prod.outlook.com (2603:10a6:20b:42f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.21; Thu, 30 Mar
 2023 11:31:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 11:31:21 +0000
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
X-Inumbo-ID: 66595093-ceee-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZEAezTPRfpOrOzkIsF8PtVUubNazP3Ic4XJR6GZQMJWEraX0SyOlJi6Ox3kwI1+EORJoiva3YLktEXGPCqlmDZaSRDhvf/+4S8RehFG4CJ9zPnR0XgEP/IPjrLy0pJtNqX5UCtCtkLen0sL502qNxkPQmwdnM+uoHYpYksTSwB2hVv0bxCxEbAGX/7nBLq+gmV5sVCvPGztUS5pFks5We6LY/GnrC9Vokj2BFeQByPguO2rOaRKPgFVhdKwmExbbpyQIxNSbt63WMi3jh/AfZjVlvXzh7Z6N27SY6G1awiRGUdGPq8Hn5P7Q7r6xCt85Qsai4DozL0CGOFl3HnE8cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pm/MJtSEloG9bhupNLw1FgcnGKAOHIGYAu+yof1N0B0=;
 b=iTHvTioKrh+sf5KlqVV7ZCT85hBZzRAAY+jAmogZviG3mp9mgDzBKEpn2zX61Nx8Z0ADKrsqpS1SPhEFKKnh/m2BLLM2VvxlpFErlL69zKuwfyplduJJVPVVmw4Fmq6ZqFBOkAtO0JrqiFedaGrAPdf5LRxyypbwaHj3xmZyO6CP2ZuXfFxtVkXDIoTAj8Qf82kgxS17ZUlKSG0FCV+giPvcC224enuiWzRgiQ44+0giHgv/fka7uvMnsvnQMuqYxJWehcLVZrJYEpGt1MEz6GvzJzHBPpdTlQ7i9GzuKcWAa/D1Oso737mSJdgGN80DDJYwpXep0N2jihCIk1spbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pm/MJtSEloG9bhupNLw1FgcnGKAOHIGYAu+yof1N0B0=;
 b=W7EQWDTe/U0GnY63KDgHt6KDHW1JwyZ5Okv+EQJBCU+yCwkvmlaEti7zxujV52Nu0p6c82XWXmKYlWqPfHt+KLdGukMBVuqksFSqx4yitA1lrdxKq2b8I42vqAdA0CP45/MIYTVGcmPudZVgjUjl6m9VXUtHSkU/wOzLRb3uUKtYOE7+xoPTxQcNh9AX+OLC6hVrFHXNC9RHQLm+2VGMdyCT7PSkRv0VrSzfV91oxwd/eRvl8W8rjenZZcjG3wsb8TzXcdbvNr16x25d7Nm6/7RYpeiJVjILZOlJr0SR9lj1zWOgTgL7ZWpHyOzADld7ANui7hzRrrS/0vxNP6JydA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6b41e44e-282a-6397-a8e1-1d0782ace5c0@suse.com>
Date: Thu, 30 Mar 2023 13:31:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: [PATCH v2 11/13] x86/shadow: vCPU-s never have "no mode"
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <fae14dc0-83aa-4647-6755-dd6913b6dba4@suse.com>
In-Reply-To: <fae14dc0-83aa-4647-6755-dd6913b6dba4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0193.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8980:EE_
X-MS-Office365-Filtering-Correlation-Id: ebf57109-21f5-4f9b-a68e-08db3112493a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	46xan642PeeERT/rLiD0TuQ+k4rZPWDnEdRN9isUjUp7tTEeZ3oZdKcRYRJtaNznc9Qk7Ghydj9Y7LsO2CwJvHviy7mxhA0Wgr8ug4sqEiIYiXNYzrLivBHD9jpAGwcZxKSrfiU0DNPpK84AVN0InqYOCnss8k2Ro4jZ5OIZR9vKujA9ObiOSkLqzr6F09b9tGWlBJfjRMQvrkUFLF4gtZRMtwIG+Wo9in1twWh13xtlESd05w/vqvj9m41WDZ0rfDV3WIEwa+9/IruwWxNHydMtkf5darIh5ye9p8n74XKWaU0ch7m+Njuwydsr4AJWmm2QF0RsIxcc3ItIAvKmCnsUNXEJRc3jEkhxMGG0VEIf6iQ9fr5B3DSMBRbwDn2p/SOtUSq5Xtm1kABXC4U4bTMTcRe0gqb9KGWVXuveWX5q4CnyZqVCANONwv5rk+M5Bgc+4XGH8j6LfHCnuyGapR/Nezs3LRGE7XRKBiUhYMVfFPoC3VNQPX+ozsj2Y+AJYfD92vxHys+LsbVpsG8c+TC8FuJ+gpZFmqrqJJ6giTYt1RyjGe91LCN/ks9F2rsCR7XDpaOz3ssDrGEKop2VhB2sybXUUcK/UhVw1/ilY6YoD45CCZwlzoj0X/r8x+ZMLESWRO+cgqMxHZUjWu3ueg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(346002)(366004)(376002)(39860400002)(451199021)(5660300002)(31686004)(8936002)(2906002)(8676002)(4326008)(66946007)(6512007)(66556008)(66899021)(66476007)(54906003)(316002)(6916009)(36756003)(6486002)(2616005)(478600001)(26005)(6506007)(186003)(41300700001)(86362001)(83380400001)(31696002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWhMbUM0UjVrdTBETGZDd0FJYlExTU1lU1B3c2xIT1MzM1l5RXB5NWRESjE1?=
 =?utf-8?B?a2VrT1RkTXlLRFJManZoWEpMVkV5TXRjWVpSb040V1pYNmx1TE9ya0p4ZTlF?=
 =?utf-8?B?Q2NvZzQ4SjZQUUVKeWZSNWZFVStZeGoyeHdWaDVtVEdkdkQ2bGd5eVpCZmVw?=
 =?utf-8?B?d0xnRFk1NEJxSHRCK1VSeHNxbXFQc01pWmJ6N0htUDBlYXJ5UFNLVTR1a080?=
 =?utf-8?B?TDZGb280K0FOeWM1UTY0SDZ6ODJPZGlPNlMwZUkzcDFsenJjOVdxTjlHRkdp?=
 =?utf-8?B?Qmx6TFpRZWt6VE5UUHU1TVlYZjUwbW9aNXJUZU1EWDMvQnFDRmdjcktLZUs5?=
 =?utf-8?B?dXU0dzN4M0VBQ3ZmRGptU01QQ2hyVFhEclIvUnNUbUxMZzFPWFJZblFmc2JB?=
 =?utf-8?B?TnpoZ0tucmcwbWRzMkNMWlFZbU1xeGtTV3Q3TU40QTBNUVhzYllyUDVHRGN6?=
 =?utf-8?B?aDdLZWo5MXRxdkxMSEkvZG42VzhGTTdFMEZyUjF2dDV1bG5DZ0x0eUFxNlJV?=
 =?utf-8?B?TThuM0RlcHRoRUMxNDJUS0RlTzJUcFQzRHA4R0Z1akIzd1lLZ1BsVzNmM0lp?=
 =?utf-8?B?ZUwxUTZnSmQ4ODlGYUpOdUlBTWRjQ3UybS9idk1kN042REdORFZlRjlid2x6?=
 =?utf-8?B?WC9IS1ZRWW1wT3hZSS94cXVSOVNIck52UWE5V1FZR09JQi9zdnA0eDgvRFZo?=
 =?utf-8?B?Mm5UU2VmRWlXU2laOVFYdmZmcml6cjJxbVYrZkRmcTIxZk9aclZoSzd2cmlj?=
 =?utf-8?B?cnR3Z2g5V01FeGZNWHVpNHExQXF2S2Fjajh1b0xoLzVmaXR4RW1HS1NndW54?=
 =?utf-8?B?bXRjcHMrcTNGSTBKc2lsMXBzb0Q1ZlVkb09meE5aZ2NhUCtQazJMZjZIT1lt?=
 =?utf-8?B?QXVSWFBPQW9tZWV1bW1rMVNlNmY5OXA5cnJDam4rMVA2SHVxblgvZW9LMEF0?=
 =?utf-8?B?eTdzeVZudzRZbUpJajZBYjNkN2UralIwSXIvZ3N5R21BQmdmOUw1U2czR1BW?=
 =?utf-8?B?UVdmT0dBYmtveTI1cVJzUXFQMkZsVHV1QzFRdXV5a3FJOGJNZ29STVFiem1v?=
 =?utf-8?B?Mk1PejRYK0JqejVDZVlvNzdoTzZmdTMyS0JXcXdSQTcvYTdDb2dZNm1FZ3k4?=
 =?utf-8?B?U3dFZCszSG1qV2pXVnR4RmVaL0FsRUJNRXRsbjNqaVJ3dURJQUdUVnVZaXEv?=
 =?utf-8?B?VUtUUmVlL3AwaUsrZ1I5NThiVjdVam0zR3BRYlFLM2dFWjZZMnVvdWk5ZFJK?=
 =?utf-8?B?NmNFWXZFbmQzTUVhUzhrN05QbmVSWTdzNlQxRitFVHN6aUVpWHJIK2VMV0Y5?=
 =?utf-8?B?d2xFOThpVEtITWJnbHlTU2tGNjJ0RmhlWXBMU0NaWlFwSUJmQVl2VVBMWk9L?=
 =?utf-8?B?bGNpb2dmRFdkOXZjNE9hb3hwWnRpazEybFRPM2QwUjhHbTlLWkVJS2puNDN2?=
 =?utf-8?B?WGU5MEU4K281Vk94a3ROUktFc0swUjRxVWZSalNCcno5OXZ1eDFVZmFLeTVn?=
 =?utf-8?B?WmJ2bHBuckxFcGVJQk5scWJ4R3YyQVREVUdFSGd0WG1TRU1xVWhsMFhvcGRL?=
 =?utf-8?B?c011c3ZkOG5IM3FscWhaQldJKzlwaHBSZ05MZ05OandiZGRzNnNDM2E2c2xT?=
 =?utf-8?B?YnJUKzlQb1loSmpMd0U0cVJrYXM0MkdzKy9GT3FnUWFJUEsxcDNNOHV4Z3pr?=
 =?utf-8?B?WDBkYkRBTlZPYUpmZUg4Y3RNVml1aFAxSFZzdEkrWXNRU0Y2UlNsWmRlRHNx?=
 =?utf-8?B?STVmTDFmNHlpWEdiQS9NL0JJMElCOW90U0cwZVozb0VaRWdocjNsYU9CNlJ6?=
 =?utf-8?B?WU1udi9KWjNoQlRsOG03bW8xOUovZzl0bnVCY25uNDZvVG9lZ3QxSzR2OHZ1?=
 =?utf-8?B?dXJrR3NUODlOQmd3R3hnSWV6RDYxSmZOdVliWTdsZElUWnY5TmJaRlNBZmQ1?=
 =?utf-8?B?MC9lR1VLRGwxNytlWnBwMHNkTVNFTlF1RnVaaEpyT0UyZlZnSm42d2lxakgx?=
 =?utf-8?B?OXFpRVJqK1Z2UmJLUGNjVHBidzgyTkxOUURtOVhwUm9FWWNNRGlodzR5NTlq?=
 =?utf-8?B?NHEycnJPZ0RBNS9aSzE5ZEIrMlBZR1lSa2w2NEVlVzdjQmJSRlFtT2FjbjFl?=
 =?utf-8?Q?CFxLQTDm37juATzq2j8TDXBvb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebf57109-21f5-4f9b-a68e-08db3112493a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 11:31:21.3289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U8lRrfegjJ2xUIzWLGmvnl42u+V36Zp82eLEZq9TPxwvf1z1K0dnV4TtSri+CCr9l5CtT7f05pdHntetIN/pew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8980

With an initial mode installed by shadow_vcpu_init(), there's no need
for sh_update_paging_modes() to deal with the "mode is still unset"
case. Leave an assertion, though.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1864,6 +1864,8 @@ static void sh_update_paging_modes(struc
             make_cr3(v, mmfn);
             hvm_update_host_cr3(v);
         }
+        else if ( !old_mode )
+            ASSERT_UNREACHABLE();
         else if ( v->arch.paging.mode != old_mode )
         {
             SHADOW_PRINTK("new paging mode: %pv pe=%d gl=%u "
@@ -1872,11 +1874,10 @@ static void sh_update_paging_modes(struc
                           hvm_paging_enabled(v),
                           v->arch.paging.mode->guest_levels,
                           v->arch.paging.mode->shadow.shadow_levels,
-                          old_mode ? old_mode->guest_levels : 0,
-                          old_mode ? old_mode->shadow.shadow_levels : 0);
-            if ( old_mode &&
-                 (v->arch.paging.mode->shadow.shadow_levels !=
-                  old_mode->shadow.shadow_levels) )
+                          old_mode->guest_levels,
+                          old_mode->shadow.shadow_levels);
+            if ( v->arch.paging.mode->shadow.shadow_levels !=
+                 old_mode->shadow.shadow_levels )
             {
                 /* Need to make a new monitor table for the new mode */
                 mfn_t new_mfn, old_mfn;


