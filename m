Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 892E8557917
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 13:54:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354864.582200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4LPL-0006Gj-MX; Thu, 23 Jun 2022 11:53:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354864.582200; Thu, 23 Jun 2022 11:53:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4LPL-0006EX-IA; Thu, 23 Jun 2022 11:53:59 +0000
Received: by outflank-mailman (input) for mailman id 354864;
 Thu, 23 Jun 2022 11:53:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CRa/=W6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o4LPJ-0006EL-Vj
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 11:53:57 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2070.outbound.protection.outlook.com [40.107.20.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29649367-f2eb-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 13:53:57 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR0402MB3523.eurprd04.prod.outlook.com (2603:10a6:208:1b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Thu, 23 Jun
 2022 11:53:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 11:53:55 +0000
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
X-Inumbo-ID: 29649367-f2eb-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jCfSS+LhFVbqkAUPNerbQkZbB/w2U0/qDxrRFdliNEFR/kszo8fN2L8srDYbV5THeSHF9II4lpGNFuZDFsdhS6ka8qhVUehFSrNZzuTE+ZVP5SvlB9R79BRWTxpBacsdxQOeTGJXN3qmnQTqYPE1h9whCQggaMF9qk4Dyox9fdfbUs8tZII4cGYVmlTwPIfhD56qSLofG2uGUTiHC6CFv5beHR2uN0fhqydhGKocJRQnplzb2Pbg1wGqsnkjmni47ISj6t1/nkKP8/O9Oev4O36QYzDT+/BVzRQbo7LHI/jjfC4yayUaO6FbU0MbnvBkb5t0QFIDJDs0uQjJS1X/bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1OxswrBk4M276hwZgUxG9p4J92lXbotQZzLwSqRbrQw=;
 b=i4VtSc0tB0S01PX+o/ytf1Jd/RxgiQiOyn26bTKYMe0HnguaZM3eF+/yzfjpx8ZyNlj/Gi3lBhffOyutt450oCgs+CtfC2FLkXgUNuN1hpXNvI6/1iVdFP6k9oX1Qo5dmAsrq+uEs5wECqRlI8ZwKoZ+FViwclyAJI1mF7NO5dQh3SjF5Tg2jdvXNi4to24/iZX0RvAcHIOlSoEEbUiWyrnUo9gCrZO0a2euqsfyKUCoVuBoVCR4MaWlDwlhtEza8j8/0uZ7IyRslgphZH8psFh9gbrxXB97p1NWz4yWiiFQkzNlLQdgu9Yz5qZHtUftUNwSYut/EMaQE/1AkSIGPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1OxswrBk4M276hwZgUxG9p4J92lXbotQZzLwSqRbrQw=;
 b=M0dZi/2Jyo34wcpjhgSpqvsVJfZlKMyvy+/rYIf7gh3arU1hPtB3G+4Foc7GKG6rviAwE/C2PI49Xt8RHEYKGp1HzN2nwr7YsSAKdgkfG1vWEA/cFV4PhiwCcDr7tPChHE1MPgO3aqEB0wbCrA1GlVYwImGy1Vt4vA7RJL+5SOhnavktyclm7KXkvrNqkg9v7SdVACoUk6Jt4Pp4sG9InZC/+Vl8QQ9kk2wKZkDVMvj67mzgBGcPJY2PxOcOMNIi2iH+qMQCWiZbco+lqJLyHnIC+rriZcJ9DP/6V+H3YEBNSVqKEBxdlaqFre3iMs6uAJEaiOF4XqfsTuJKeIE1dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8d5df1f4-74ca-27cc-99f0-7e7a82050de1@suse.com>
Date: Thu, 23 Jun 2022 13:53:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [PATCH v2 1/2] x86/p2m: make p2m_get_page_from_gfn() handle grant
 case correctly
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <5d6c927e-7d7c-5754-e7eb-65d1e70f6222@suse.com>
In-Reply-To: <5d6c927e-7d7c-5754-e7eb-65d1e70f6222@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0485.eurprd06.prod.outlook.com
 (2603:10a6:20b:49b::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66850d2c-4dc5-489d-a561-08da550f0ccc
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3523:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB3523D6F26CB535BAB75C1DDFB3B59@AM0PR0402MB3523.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LYUjyYv3ny/fnpTKu7GHOqPVlcwTPUXoqu5sE1mNxJjiW5008YnEroANnYgWE2EaeOJ+aBj8cnwFkTSUX1O9T8t/mZZnjCNCBIs5XqJ6ht9/GClJUg8j24sjz9/dJcEzxcW5XQ6z2w3dXrMGZYXgamaE8vtbXIGgqx3+cd7KH2vK5IIFAebdIi7GJ2IIYT9w2LJrj0eW9qM8GXvQzf8EOgcFSsKJBTv02VA+23vn2+wJPweCG4UZqTKIiVpi9s+tfUORD3f7fXbYEQqfcEBnPtxVFQ/7yjRu7jC6/CxreViPqFhfYMqh6uIighq4k3pfHFOSO1kTkHreUbdzrye4w+LgG+AqpXakWk/jbJhqqPsJaU/7pvyXGnDPwnTet1uoJBl/jtrecKgF29FKYILqW5XxJ4+lTDGg2tcFo8jf2jP6OckmVD0zrLCf1V/sElC1l8ybn2+0KY4p4SwwCvZIXl8NOA3gB7OvdrQ1nX0pm3N7rFiGbJL7G9y7RDApRs6GQNVg0ug4ccP24BlSOX3X0dGxvFBRR76xuPiVeut4WNcCd6Y5DWilSRmgMyQk+pj1/d4xsS3c47pPeJxdIgBHNfDHru0UWYwyzMdvglhok+oERyMAiQq0XGC+mUCMGRFG6ZikNUxmKT3MoWNl8ddGcUldcOmjYEzIINJmqlm6ta0SBkW7Tq8BPSngD+P9fcTKSQsp/uPQUyX9W9j2qKoK+BF8yPdJORXSAzINlW+l+24qi0L1L9AHtpO3lZTLl5yBiZBSWg5kijHux2kInMhezfCnkNlFOaOOiD2S1NdmKFs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(136003)(39860400002)(396003)(366004)(83380400001)(186003)(2616005)(4744005)(5660300002)(38100700002)(8936002)(4326008)(66556008)(8676002)(6486002)(66946007)(41300700001)(2906002)(478600001)(6916009)(6512007)(54906003)(26005)(6506007)(31686004)(66476007)(316002)(36756003)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejg5N015bTk4L2dQL1FUZW4wZGlUdENOb1dqVkRvRWJaclpUdHU3SExVWCtD?=
 =?utf-8?B?L01oMU9BSlYrYnhnM3NhRFpnd21rKzlaaVR0WFlMV01iYUlpbzE0U1VML29q?=
 =?utf-8?B?YlVWcWgrWjdGUG9yVzlmYzEyMUVJWDFLZ25WRUMxcHdlQjR0c3hSMnpQK1do?=
 =?utf-8?B?MUYzOWgvZUwvN2xOR0ExdDk1VExqYVpDT1lDSzNSRS92dXVLUDIxSDZiZkpk?=
 =?utf-8?B?TE5reHpFNVZTSGxUaFFTQ1MxYTEyS1ZiSlgxRE1xbkVNSXdMVTRXbm1rSE1v?=
 =?utf-8?B?dE9Jd3QzREluTVpGQ2dIQXZFOFFaSnNzQ2x1NzE1R3BKVmFJVXF6VWlpenQx?=
 =?utf-8?B?UmhsenZjdzRyeEludlo3d2h4V1NnT1RNTUhlQkN5K2s5TkQrbVpRdHduSDR3?=
 =?utf-8?B?WmN4SXJsZXU0UkhqMUhoczU5alpON0tBNmtvaWszZ0Ixc2NjN3FUdVdtMURh?=
 =?utf-8?B?aWxBZHNGZlhQVEhWS0ltODY2QVArT1ZSUEdLUEdqYkZPZThhSVh2aFdGdXZM?=
 =?utf-8?B?TmdpenMwS1JmbzBpT3puRStjejRVSDZIOU4vVEh2V3AwcENTTUlKelpHSmtF?=
 =?utf-8?B?WE5zQXJReVdqaTgvS09VRnlkanJRZ3ZsYmIzZjBFVlEzaXRSVGhHZzU2KzR6?=
 =?utf-8?B?VlJ3MWJEYUU3Zkc5TjlBUjBabi9OTlNnZ0g0Mld2YTRReC9RNlVwTDk4R1I2?=
 =?utf-8?B?YUluc05Jd1hsY082ejhDQnhzWEVpVUtaK0FGL3V0TWl4NFBES3lBKzBDV0pj?=
 =?utf-8?B?cnd6Um93UVY1RDVFemlWdlNoTTV2bnNhNC8wSk1jRjVoRlQ3VERVeUxzcjZG?=
 =?utf-8?B?cjRlSCtERW9tc1JoQytOQTdUazdjRllzZUV5ZlY4WHcyZ0FlSUFMUEVUVlR0?=
 =?utf-8?B?RWdhbTQrZitiakZtNzVSLzRKNHgvcVIxTVVUbDYwSzdBMUtiQUJ0Vnh6RzJL?=
 =?utf-8?B?OHdHSEpoeWFGVzdKUy9ISDk0REtTRHpKbWI3MlZJajBPYnVNcmRPTEFMZVJ3?=
 =?utf-8?B?a0FJbGdRWEwzV2NBblU4TkNsb1poUFJEb25SK3BueEVRc1ByM3BUQnIxT2Uy?=
 =?utf-8?B?c2FNWFhGcnZyWE5UNTR1OUhRR3ZDUXJMTlZtN3k0TUdSVVNsZHczK0V1NlRj?=
 =?utf-8?B?N1JyTE4rYVEyU2VBMUNmd2ZGaXVLdkdCU0s5WEI2L1F1VHlaMVQ2a1l5VU4z?=
 =?utf-8?B?amxCbjhnYkM4d3dUMlJKRUZBRW9JTDhMbVB5OHpOUEFwUGZDMnhYYWE0eTNp?=
 =?utf-8?B?YTJjbUJMUmJNTlNmc2pUbkFNeVVPRGJYalZxN2k1K2kvVW1xY3o5aHFpSzVh?=
 =?utf-8?B?N0JONEtwNlBtN01OWGdHUDdXeDJVdjFOZkMyek5kNEt3NVBMS1hFbldoeWlT?=
 =?utf-8?B?aFNOMHpkUktPUDdOUitNY2ZRa0syeXdMU09vNW83T1VHZnFtQXkvTG9ZdTVz?=
 =?utf-8?B?cjcwVSs2cTBocFgrMjF2SzRGNkEwUGEybXg5OGQySjRhODRGemlDZjdXc3VD?=
 =?utf-8?B?Um8xeVlEOGJreEJtazF0cFlzdEtJTlVoa2pUZUxIeE13eG1zOUEvMU1XTlRJ?=
 =?utf-8?B?SDN0ZEhLVTgweERDYWNPZWRmaWt6d0FIWFRWU3grMnVNdkFYWWxOK0hwUEpB?=
 =?utf-8?B?bSsvYnNRTHRCRU1wSFlrQ2tiRER4OGwwc09KOStyZDM0UFNvMHBaNmtOcnBm?=
 =?utf-8?B?QmJkaEpTZTg1SFRLNEFDWUxYcEh4cmphNmJJVVNMWXA1bjRIVnUvM3N4ckFJ?=
 =?utf-8?B?bEQ2S3FialFMWXVuY3FjSnIwK1Y1d0lFSUM2T2tVd2ljTFVBV29YWVNUdys5?=
 =?utf-8?B?b2NwclN6Y1VoOFN4VEs2L0h2OTRCK0x0dko2dXNhN0kxTFd2d0pIT0V1WEdS?=
 =?utf-8?B?TFZKWHJXS0l1S3VwL241dHJaaFI1cDBiYVlTK3E1YkFBa1Z3M1BvNkNhM2g5?=
 =?utf-8?B?VlljRlBuMzZJRG9IV3dEbzBkZndKWldGZHpjNFVJdTRsL1U3bGtKT1ZRV05l?=
 =?utf-8?B?NUlpVlU2THdaOFRhTjI2czhPV3E4Z3lKY0FYbmFzbm1lUkFEWlVlWFpyZTVr?=
 =?utf-8?B?bElIL21ZdDBRTTQ4RjVnMWlrcE1XbnZLbTJCM0lTMndUa1FuM1h6c2lzQUNi?=
 =?utf-8?Q?4lLfD2jEvA7sLgoriMLoI13+4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66850d2c-4dc5-489d-a561-08da550f0ccc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 11:53:55.5517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5aHkPNK36qpXPqLD2/IjVr+yRyzz27gjoFmULnbP3d5noA31iD17vrbtcSydhv9renqEM+mBiSLvQzErU5XvPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3523

Grant P2M entries, which are covered by p2m_is_any_ram(), wouldn't pass
the get_page() unless the grant was a local one. These need to take the
same path as foreign entries. Just the assertion there is not valid for
local grants, and hence it triggering needs to be avoided.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Using | instead of || helps the compiler fold the two p2m_is_*().
---
v2: The shared case was fine; limit to grant adjustment.

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -357,11 +357,11 @@ struct page_info *p2m_get_page_from_gfn(
              && !((q & P2M_UNSHARE) && p2m_is_shared(*t)) )
         {
             page = mfn_to_page(mfn);
-            if ( unlikely(p2m_is_foreign(*t)) )
+            if ( unlikely(p2m_is_foreign(*t) | p2m_is_grant(*t)) )
             {
                 struct domain *fdom = page_get_owner_and_reference(page);
 
-                ASSERT(fdom != p2m->domain);
+                ASSERT(!p2m_is_foreign(*t) || fdom != p2m->domain);
                 if ( fdom == NULL )
                     page = NULL;
             }


