Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D835EC5AD
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 16:14:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412628.656014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odBLt-0008Hp-HM; Tue, 27 Sep 2022 14:14:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412628.656014; Tue, 27 Sep 2022 14:14:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odBLt-0008Eq-DK; Tue, 27 Sep 2022 14:14:25 +0000
Received: by outflank-mailman (input) for mailman id 412628;
 Tue, 27 Sep 2022 14:14:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odBLs-0007b7-IB
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 14:14:24 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130051.outbound.protection.outlook.com [40.107.13.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afdcfa91-3e6e-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 16:14:23 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GV1PR04MB9515.eurprd04.prod.outlook.com (2603:10a6:150:24::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 14:14:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 14:14:22 +0000
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
X-Inumbo-ID: afdcfa91-3e6e-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R2fTe/QbNofTKSWwc7Sz2g6zz0DfcIujJdxsjYR6Icf8h8MT7v0hd6FdXY8WsJB2lU6byhTmFUs1U5r4UOXI0IXJJtRq8P/Z+W1lXDF1iiGGAX6nv5mFxsLVgiZBrSGSVK4xN29jB3zJ4gw47hwf4MDX8R5iSEKZ6byWz5LbEFQH3nZmWuACmWPlh1Wca1kE50+PKCbaaXIBuF4BrR5PgKfRCZuXd2T0b/Ju/aVxvveeacKxH5HOvkwQ8W5/dmxshUVv3Yrw/+ja0pfRNnrDPqjIzg3DLSNs4OlgBkT9uR7/GYZTdHvygZhVBjI5mGpjQZcQxgICiZwTm07fbJFsaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBwtU4JRJ9juidOk2OLyGM7RoZQpHcQkjF5H2maw6Qc=;
 b=dL4CGeqqMuB7RcApM/H6CklxZKkhA4gaD4S3OxVoPTAmlH66xTvaMbYkL40884jicZHGEVI5dmb+kOac0J619OTDKTf7zje6OvxwPfgIFi6DRUeiWWAU38WCpY+cdPRLxcNx8eX0r+T+ieApcBVYGUc6Hn+ljm750cOMyXF8aVvXvFRIhyfDdYisharWe2tieS/SqBynzboz2PFkkYfrqr24lpm1kQ7oss01nJ1Pj+gFlF/W3KP/+XZ6sBDJ/HKcBuM3hK3k11eYjtlvkuXDEYCx3gSJJMYOzrcM5mkwyNTV3YaiLUGTHxjyRRzW88ONjTfvas5G70YAKX5g28oX1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBwtU4JRJ9juidOk2OLyGM7RoZQpHcQkjF5H2maw6Qc=;
 b=oVzaH6eBwGmFYqYVC6rxQkFRCPjLYT9w3A5XpkDDbo6Gpm0zIvqsHJYMTZowMEHN741y9r2coudxjpncG3jlS7FbR8e359kUP0WeNodixzCSiPqEi6hwlvGhHUzH/R17+Q2V2fxaFKi7L4gVqrnaQInvEY9BxsoQ30rzet37WNKdoYDtm48hrVmIl6OmN5oElCCklDA3zfK1xbXyFiVisLVQS2B73nh8zK8XsW6uJYxFaxM5oakRvosk/3eI71CZ4qSk8ggzP+4ROwIFKaEK5BDehXyzJ6slg3lS7EYCbJwDxQ5CkFDQXI9+AwlbA/fv0A1Cc/NgVPSXLjABQZqTQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <adb17b3a-f57d-0a34-73e5-6f32ec60ab5e@suse.com>
Date: Tue, 27 Sep 2022 16:14:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/NUMA: correct off-by-1 in node map size calculation
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Language: en-US
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GV1PR04MB9515:EE_
X-MS-Office365-Filtering-Correlation-Id: 7215f65e-06bc-491c-835c-08daa092932a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RgKrgwDaT1alXZwWNlfwrNVnt1Kll+fx5Qc6VIteku16aiEyksy0m5Gl3fwuH6KKxAWOywgvw3YiTe3+qE0JET6/KmP2dMrTvQSiD0MDQjdw0gf9VltAQwGn9qzMm3ldBU5JIk1iqzrqoliBejwsfeLxZ+pSZ338fUq6oaSDis96gPZ1wiaqBzL0bGZkPDltqYx5BpZhQpAdMuSh5UgbNeYLhc7HD8cwqL2/BZzIfG7RPTRy2uAwpokISHUliAaYLMY3Muu5A5WPpafG2se2SAfajxkylXCSY8Ez+TtygePUcDnNf9vTbQTFNNUD2XXfIUYXrAksjewMRPy8V+bbtfJ92Pn8yRN0s63hMZSeh9WVAjvRlBTnpjkaWl4f8oEfqrokyrkan90GGlfcTRO7lO4khOwdqIlpU2ofhhx11/oI8n0vuurcOn2ItxuiMDPqBcXWeOhEYu+nmS/d2Stg6YAVJF+xLzsOJkEwzEEpOdSzxTaRoI80u7r2bFFrCWBIzVTobkcgGogLlpen8eWmv9ReW0oeAmBmHheE99PueKTEBKK08vaHdIYDOaKCAfYyZ7WrVGY56NKdAl3p3L77NGXmzNQ+sMftV0h8W/B7WFomzfk2E9LuBIziuSEqAoTd8/9NXdvliKBcZNPU++3AbmuFWD9Y4P8yIuoIrgmR8FtrF8eS8Sf5LCl4EDvw3Kx4RY5//oexjfqoIHS0UJ5Dz2qkz4euBsT3PYa2fek0QuDYv5Iqt6Lz4iVokzimqwD8Dl7n7+HxE8CH/MPJqwHQD4UmndVYRxWIa2RuVxMzbCE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(376002)(39860400002)(366004)(136003)(451199015)(26005)(6512007)(5660300002)(41300700001)(8936002)(38100700002)(83380400001)(2616005)(36756003)(186003)(6506007)(2906002)(54906003)(6916009)(31686004)(478600001)(86362001)(31696002)(66946007)(66556008)(4326008)(316002)(6486002)(66476007)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmNBekRVaHQ4SElyT1VFS2JpbkhuUzF5eUhTOUxhSWRBdVVmT1dicW02VStY?=
 =?utf-8?B?OTZ4a2VoVERQM0VFMVdwR0E4NlV6ektMcHRMRklqK3A2TU9Md0VjS1gyaVdC?=
 =?utf-8?B?ZzNza2h3dEV3QjRFbEVLK3UwMGQ5aEJPNEVEOVc3Ny92THBKcFUyK1dzN20z?=
 =?utf-8?B?QUhUdnJJdkU4NUZNcmV0ZTMzWUFhVHhSSERKQ3N1eTFWN0tvaWZGY2dHb2lE?=
 =?utf-8?B?VWdMZ2E1MEx0VHJKU0dPQ2ZhRTFIS1k0MHd0UjRXdmFpaGx3bEI0blpmUm05?=
 =?utf-8?B?ODFvb3ZBaFV6b2lSTXUzVkp1UkhHRWZGc1lHaFJUWDg0dW9YOGduYmtScHFj?=
 =?utf-8?B?Z1VxQTVyZUVCNnltaC8weUE1S0tMYTN4QWNNaWFRZ1VwenNLZnRzbURrY2VO?=
 =?utf-8?B?K21LdmlnYTVxOXZxMW4wNlpCTElIdWFGRzFjMlhUSTlEeEtYdk1pV0p0TnJO?=
 =?utf-8?B?QWEwTVVNU3J3UVplcDlGbGo0dEhadFl5L3FOK1gvbEZsa1FpUXlmcDNhL0N6?=
 =?utf-8?B?NkN1eldJK0dJQVJiMlljRldDYVBoR3VScHJDSWF6Vk01dG03Y3p1L1pYSEZ3?=
 =?utf-8?B?RGNHbWJyL1ZQN0dPMG4zTHJSQ0NrM0F1YytVcHJ6NDg3UFQ1NmwyS0ZXVHZh?=
 =?utf-8?B?N2Qra1dEWXIwMW9Zc2ZZK0JFM1o2NWZ1OWhtcFlicnFtRzVaREVrR3RxQTBG?=
 =?utf-8?B?V1UvUXgwM3Zvcy9SaS9iR2U0R0NiV3RNRTdXUEJmUk1lVkZFVHd1UUtMSUsx?=
 =?utf-8?B?ZytXblFQNnRoelA4NGIrZWhjZ0h4QklmYUw0SWNNWHljd0JVcDhRanBxV3hF?=
 =?utf-8?B?OXlXL3lZcXFyem55c251S3ZoVVY3WVpIOEhmbm9oeFhoamxISmlNMmVtVkpM?=
 =?utf-8?B?UWtPSUNpemI1dUUvaXhXQW1mOFhxSzJ5YStMNFdKQXJpRWxvdm0reFVaRDFh?=
 =?utf-8?B?cXRpZlR3dUQzZ3VQWnhWODVVR011eGwrTlkvenNUSk93aFV6ejd6VWJpam9k?=
 =?utf-8?B?SnFVcTM4ZDF6YWwvRG03NkVpckFKa1dFcTEwR1gvS082bnpzWHpPMWdyT1VK?=
 =?utf-8?B?aDEwcHZON2g2UVdxU1VtaHpQT3Z0QkZSeDIvQXJ1Z214QTFpVVpqZjZabmQv?=
 =?utf-8?B?Tksvb1AzS0J0bmtobkc4cHZpcHFUaXhPMGp0YUNhSmRnR1FNUkhWUExRbG1p?=
 =?utf-8?B?eGZwRFAzQzRwRWN1cW1nQlVKU2xkRzR4WWRIR280dnI2cjA1bmZDMFVFSC9W?=
 =?utf-8?B?TThMenVTNnNYQzNqbVFacDB4ZXU5d0R5SVVLTlFwdnUyZy9tVXNMVFVGOGQw?=
 =?utf-8?B?U1c2OWtmS2RoYXplMVl5RHVoUDZPOE56YVhLMDVhRUdIZDhveEFzQS9kc1ps?=
 =?utf-8?B?WUM2MGJ2STVmZkhBNlV1Z3FkcTZWYW44UUdQMFJUcjd0Zk5jT2xZcFFSSUlF?=
 =?utf-8?B?TkNQYUkxSnZJSVluQkNMdVgvY2JpanZKOTcrNmkxUnBoOU93cExRdWl4VVNQ?=
 =?utf-8?B?UmVwV1JWWHVnbEprSmJEVVh0VjBHeWpvYStMRzgwckhmV2RJUk9JbW5sanJq?=
 =?utf-8?B?S25GYTFVc1pWd2VHanJjV2VteklndlFlOFRKeWVsbkhFb2VRMEViOXpQcXo4?=
 =?utf-8?B?K2YvZ1pGWVI4TlRneG8zN0l6ekkvaDBna2Vub1Q2dFpvdFdwcjRIaExyNUJS?=
 =?utf-8?B?UjArQjZENDdHT0s5OTgxOXFEVEladHZuZnY1dFBHWTB5MDJTVEZBV1ZqdUIr?=
 =?utf-8?B?SG0rUHlrcFY5dnM5RnBZOUJXbXVwNWJibXMrekNEazBjNWNJckZ4cHNPemtB?=
 =?utf-8?B?dE5Ra1ZJQUlISVN3M1dybnRhY2tobHRINjFPYTJwTm01K2pKbTZhcFFrYmRK?=
 =?utf-8?B?b1M1RTdEdEtpM1ZJSWdXQmhMYVhHbFJXeVpTYzZ5WnM1eFBhUWkzSTU5dEVq?=
 =?utf-8?B?cXBsT0htZDY2Mmd2WkFyUDhJWFRHN0NUUE5id05pMkhVbTQyNXFDT0dDSFJT?=
 =?utf-8?B?OVFPaEUzZlJUVEpVclljdmNhRnYxSVRGaWwrdDJvbEVLQzRtM1d3M05OaFMy?=
 =?utf-8?B?cWFCaEZFSURNT3ZmS1o4Q1EwSXo3ZTZFZ2ozQ05zWkVGQzBtS1lDZWVKNDNV?=
 =?utf-8?Q?I+kIeC/8QQJlejd0SP+c9eDfj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7215f65e-06bc-491c-835c-08daa092932a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 14:14:22.3396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2XfmAjAof3JOkBZ2LQ5ZDantaJQ/9MKkQpaA5sflPCti+XZ6VIG1W8MNKAkbochBU4k1S+5pM61mlUtwS9wo2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9515

extract_lsb_from_nodes() accumulates "memtop" from all PDXes one past
the covered ranges. Hence the maximum address which can validly by used
to index the node map is one below this value, and we may currently set
up a node map with an unused (and never initialized) trailing entry. In
boundary cases this may also mean we dynamically allocate a page when
the static (64-entry) map would suffice.

While there also correct the comment ahead of the function, for it to
match the actual code: Linux commit 54413927f022 ("x86-64:
x86_64-make-the-numa-hash-function-nodemap-allocation fix fix") removed
the ORing in of the end address before we actually cloned their code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Really the shift value may end up needlessly small when there's
discontiguous memory. Within a gap, any address can be taken for the
node boundary, and hence neither the end of the lower range nor the
start of the higher range necessarily is the best address to use. For
example with these two node ranges (numbers are frame addresses)

[10000,17fff]
[28000,2ffff]

we'd calculate the shift as 15 when 16 or even 17 (because the start of
the 1st range can also be ignored) would do. I haven't tried to properly
prove it yet, but it looks to me as if the top bit of the XOR of lower
range (inclusive) end and higher range start would be what would want
accumulating (of course requiring the entries to be sorted, or to be
processed in address order). This would then "naturally" exclude lowest
range start and highest range end.

--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -110,7 +110,7 @@ static int __init allocate_cachealigned_
 }
 
 /*
- * The LSB of all start and end addresses in the node map is the value of the
+ * The LSB of all start addresses in the node map is the value of the
  * maximum possible shift.
  */
 static int __init extract_lsb_from_nodes(const struct node *nodes,
@@ -135,7 +135,7 @@ static int __init extract_lsb_from_nodes
         i = BITS_PER_LONG - 1;
     else
         i = find_first_bit(&bitfield, sizeof(unsigned long)*8);
-    memnodemapsize = (memtop >> i) + 1;
+    memnodemapsize = ((memtop - 1) >> i) + 1;
     return i;
 }
 

