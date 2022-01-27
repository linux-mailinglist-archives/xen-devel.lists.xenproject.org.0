Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FCF49DE20
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 10:33:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261378.452487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD19p-0000iF-Ll; Thu, 27 Jan 2022 09:33:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261378.452487; Thu, 27 Jan 2022 09:33:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD19p-0000fV-HS; Thu, 27 Jan 2022 09:33:33 +0000
Received: by outflank-mailman (input) for mailman id 261378;
 Thu, 27 Jan 2022 09:33:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nD19n-0000ev-Ux
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 09:33:31 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 306ddaad-7f54-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 10:33:31 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-CuS1CkAlOCaQhpi4Q1up5g-1; Thu, 27 Jan 2022 10:33:29 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBBPR04MB6028.eurprd04.prod.outlook.com (2603:10a6:10:c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 09:33:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 09:33:28 +0000
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
X-Inumbo-ID: 306ddaad-7f54-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643276010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=e2G6HEvqgyZzbhWrZsOHHJdpAi/p7XJLGVvl/WIrZNs=;
	b=YTz85ygEEeLYsFRhuBm070rIWOcQxtH4m9FAzdopHSnZiAoc/ZMEx32AjGSUQc1vauGrY4
	PcxRNiBFPGXVMcplxYVjxWwUSAvxDwvNl3HhLtM4gbsuMnOxXaQHnfXCM4ZMZovdfec/zI
	A6S2+BZ59cMoNjrNohS88VllNC2F/Ms=
X-MC-Unique: CuS1CkAlOCaQhpi4Q1up5g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZfcmPqcLxcQqGMtf3HZ4j+tro6dXrfs3fFgcqp36uk8EU67ARKwA43GBwM7aNHbXP5jUUUXPblG1ZK+3bXzP7rWdg/QjD5u+woGRXZL+y2PL5H8Avxo8cMj9s124CPl6/PRYZk8KpESW6B6pZFCO1Edop9e3/h/lr6DHMaopzlG6g0W5hvyT/GNqcy7Q9TflqqmW1SZS8MdWKY+DGHHZbHD+oamVAwxpWtozGwG59EeoyF7TxKmI0lyZmM6b/sqTxwqyh5X+RthBxuDT0uMFRWnZPQy0jXjulvcxXOUdmVGoL5zeO6fkQRF5G9CKIi2GhfWAYlX2DEoFASmAY0Bvuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2G6HEvqgyZzbhWrZsOHHJdpAi/p7XJLGVvl/WIrZNs=;
 b=WbtCroGrRbgEeEPvllovmQprbhEwMsISpI8nq5uNizc09yGOq5kk71XI7n4aYiSUdfi/GmPSEXQ/Dy2+ob9p8Tbl8gvZ2ZXQI1a4JdmThDlHUN2hBJM80AXifioMGKW9mI6gf/APrXtWF3a1xROi1U1v0MoprmcdMj7AsijOm6bfgHMhOQf7/WUCc1H7myLMApcqZJqNohXiyxRwtFzBwdTY+mNAaKwTJV02tEAFtPS4R3jNxeubfE3DL4OZ/YJc2/hN+7I2wuz95S0uAOxZT67GfB1tkoO2JRrbRmf5tAAm0r4JViAIWu9Kdqgg3O7wXuJNOhlhZCxPQ6gIznhhzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f1ed128d-839d-c0bb-5a1a-4dc96d65cec7@suse.com>
Date: Thu, 27 Jan 2022 10:33:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] tools/xen-cpuid: drop "amd-" prefixes from strings
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR04CA0019.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acebe687-44ad-42b8-48ce-08d9e17812de
X-MS-TrafficTypeDiagnostic: DBBPR04MB6028:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB60282D48C7EC94CFB33C975BB3219@DBBPR04MB6028.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sgK4MJ1bnMMNSeTc8M21Li5cwtGwiSbBbr1BCA3l9znw3LXXUyKtb3Qe6XhruzQNOY4t4npLOtNu/8HYzGvp4vEmoSB91snojD30HuniSqN09f+Goy0pGgjukdGwR9CLw+3i0ypmRm9DGXCyETSGOiqpisht4vAd6r+uQ6+5LtbWnWn/RjbAeg9jHzyIea4LGx56aN3LmRUXwg0Mk2WB4tpmko8QMu/L1osGLZ/s8pCC6EByKC0kpVgQOZpOfma4Rcx94H7yDpPOvpvDdT2lpj1HeXtOmkBPQMEviwdTpE8zcJ076a0r9ubLOO1XYZng+yeiY4bBH9GxwkbvI1BLIIUmU+eKUQcz8YgFdGu++/R65x9eEQlajHGcvdwmrI4JuPSg+CerX1yQY3I1eswFwwFBJ5jUX2hFB9Hj3kdbr4KW5Ygmw0akpcyV6s0rqQ0n51t7/9Elk1aPGd3pHx8HCsAQy9FvdNs9Gb++nj6XzcXTippRRkYWzFpowY/QcHcx5K0k59JU4N7D9zl+za4uM6x06wh1Mc7lNjWct00xbfzBcXIeCuX551+jevEFcv3/pKCNL1AFgc6OZceRdKsllkeg+NuaQNfZuN1jvoxaV22/bFn+t7vOrYCBgK3ecJUjPq15cEfkTD1MCOrj6v6vh0lPo9D71+rRkDymjbxZ8lTXbOa7l4UD2/fIl9vsUZUu7+TbGLOV7zWI2ZmakRjiVMgvS8RW3Lvac30u5y41wjs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(66946007)(66476007)(6486002)(66556008)(8936002)(31696002)(4744005)(86362001)(5660300002)(4326008)(2906002)(6916009)(2616005)(54906003)(31686004)(186003)(26005)(36756003)(6512007)(508600001)(83380400001)(6506007)(316002)(38100700002)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWVJcWlvdW5SUDJMV05VSDNpZGkrT0phbGthWGFkcnlEVlIwODVhaG9PYW0x?=
 =?utf-8?B?SE5RbHBNL0taSTVGWEt6VkhldVJBNmphVWt4aTBkRDFuSlU3b2NQUkp6STNS?=
 =?utf-8?B?N0hpYlBxd0Zsc1lzTU9BalNUZVRiNVIwd2lvQi8xV3BIb21sanpLeGFKSStC?=
 =?utf-8?B?QjRnNEZMT3FPQmpKWVdTSHFSWFBHY0NCY3dZdGJRZlk0dVBPRzdFa3RQYzhr?=
 =?utf-8?B?ZkRlcmlocWltQVlHY0ZlR24rZ1FMVlJRSHJEaUZuc0dCM1ZYL0JsZ3RXSkhI?=
 =?utf-8?B?OTM5amV3dy9jZlF5NjAvQXZrZkNQWFFaVTk5VzZ4M3BYRnRKMTU1MDh0aFRj?=
 =?utf-8?B?MFloOXQxa1dJUjI1K1pHZUFzYkNRajlSdG9teThaUVh0Y1Vpb2NiQlI0enNa?=
 =?utf-8?B?bklmTkFvRXV2T1dIdXBPTnVMUEZKRktucUVXZVhwSHlpK2h0N1ZMZngvS05v?=
 =?utf-8?B?N0pnWWc2ZHdxYzQvQ0s3dXVYYzdsc1h1M2FBRkZEdURFQ0U5S01BRERDM2tK?=
 =?utf-8?B?aEc1cU9KYmpPSEFiYytDOVpDbzMweHdWVVpCWGJQbTFLbkppMElDaTdPZWMw?=
 =?utf-8?B?QXpmZVZnYytQWnRveklndWZ6Z1B2RTF6L1VwbGQyRmY0bHZUSDFZc1J6Qk9D?=
 =?utf-8?B?RDI2a2l0RVN6dE5JUWZiTjVoL29XUnlJVXl1L2hoU3BXNmllVzZ4YjZwWU1u?=
 =?utf-8?B?TG1MaDhSRm14YVZuTjNFUUo2UVBKcmlDcUNkMGhnekRTSkZMWjVONkN2bDBU?=
 =?utf-8?B?QTB6WWs5Q3VEVkZwVkRDT2JWUWZDQjZyVlYzSUNxSHJkWVkvTFk4YjVZRVcx?=
 =?utf-8?B?eGlPcTJQRSs4dWNySG13V3VqdmtDMnhOSFNPblRLaUd1Y1AvdWpJRHdFbW8r?=
 =?utf-8?B?WUY0VGFSU0hmZHlOUDNCK1h6VFVjNHZmV1pTTkZHeE1XVWxTY0c1MWRjSm9a?=
 =?utf-8?B?MFZQdjRMMyswLy9mSzZHNEN5aDh3bU9ldnJoVEtlano1TVB3LzZYTGpmaVVY?=
 =?utf-8?B?UVk3OTRxamZVdi84dm9ITUxNUERXYnhITnIwTWtIUnEwK0RqeUE5VVgxQzI5?=
 =?utf-8?B?dXhoQmdaand6b3QvbVJ1VU5JMWhrR1ZIVmxDc0EyTjdtTklINytDY1ZUNnpD?=
 =?utf-8?B?Vnozcm1MTmR0YmtIWjFnTU9Ta0txZmVNaHEySCtYMHlMVEUzUENobVd2bGx4?=
 =?utf-8?B?NE1BZDRrdnlpNWVaYlhIeHN3V1pDZ05xNXVIbkVzeWdSWEZvdlZDdkZnNDRi?=
 =?utf-8?B?YlVudFhzWVg2V1ZEV1kwNUV2dTlrOWo1NTE4L0pGblJxcWx3K25yQTRSN2l3?=
 =?utf-8?B?TG1ocE9CWmNoU3B4cWYzVEFuTk11K1cxY0RKbWN6elVsV0I1T2IyTlB5b2w4?=
 =?utf-8?B?dDhDTUcrSWlwdlVxQlN4SFRrWDFpenBJRVFGbzVwRkZYSnZ5VUZVK055dHJw?=
 =?utf-8?B?Sm5KSituaFhPaUVVSG12OVMwYnQ4eWVHVko4c0wyUkJTUEVIOVg4TnV5bWlR?=
 =?utf-8?B?N0Y1c2c3M3IwdkdOdytiZlZERGcrR2dJS1JBb0RJY09ldm9PeUh1Wk9CUUNz?=
 =?utf-8?B?ZTlIcXkxckI0WkNjRzB4a241OG50RlB2cjU5WThwa1FLK0hVdEZwbmxvdkFW?=
 =?utf-8?B?dE5uOGF5Z0VZdUEvL2d3Q1M0TElWQzFLS1p6NHdxdXQ5b3M4NGZXcldJMk01?=
 =?utf-8?B?YXRNbE8wa3c4dHJuS1l2dFhxVjcxZitodS9NMTdtUFUrVVc4YUFKQlRVcFh1?=
 =?utf-8?B?RnNDaEhSZXE3Wm5mSGYwZW1TdXdnWW93VTAxQlltK2ZvSnRFb0NvV1B5dlZ0?=
 =?utf-8?B?SUJZbExraE1YemFBU2VKK3JOZnYrY2hFUkJ1REV0YkFGanBWY2pzamloTUdj?=
 =?utf-8?B?VEZYd1Z3ckx4VXh3SGd2K0dNYnl2cTdXeW9VbnZkM2ZJa3ZXanpaTFFtZ0Rn?=
 =?utf-8?B?a3ptdlFOU2ZoV1pBdWQydUsvYnZLamNFdXhwTlB4K09iMGtBK2Q2c09qUWVn?=
 =?utf-8?B?WFFsc0JYQm45Zy9RTkI5TkpVdEhyWjJUN3RMSC9xbEw1aWQxNk53RGE1MTlN?=
 =?utf-8?B?MzBORG1NNzF1QjVZOVYxWUJINDZDZmlGdnRBdUdkOHRQWFFqRDR1MytLV3Vx?=
 =?utf-8?B?ZXhXT2cvT2h0YnlwaC80QURqMnkyUFZnUHdaTEh4Um5NdXd4WU90TkJuZHNO?=
 =?utf-8?Q?7yjxdg9VLjc0dLY9+IgH/oE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acebe687-44ad-42b8-48ce-08d9e17812de
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 09:33:27.9768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /v2xn2PmGIsMg8/7POj7Z8FyMd5zTe5OHY4jkHFo4dvn4vvpFdMbcKtFU1k/OVRxg8YNMjYw2B9rrNNL8RG/mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6028

Andrew says "Given the AMD MSR_SPEC_CTRL series just posted, use of
CPUID bits will often be symmetrical and it's awkward to have one or
with a prefix and the other without." Let's drop the two prefixes of
this kind that we have.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.

--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -152,13 +152,13 @@ static const char *const str_e8b[32] =
     /* [ 8] */                 [ 9] = "wbnoinvd",
 
     [12] = "ibpb",
-    [14] = "ibrs",             [15] = "amd-stibp",
+    [14] = "ibrs",             [15] = "stibp",
     [16] = "ibrs-always",      [17] = "stibp-always",
     [18] = "ibrs-fast",        [19] = "ibrs-same-mode",
 
     [20] = "no-lmsl",
     /* [22] */                 [23] = "ppin",
-    [24] = "amd-ssbd",         [25] = "virt-ssbd",
+    [24] = "ssbd",             [25] = "virt-ssbd",
     [26] = "ssb-no",
     [28] = "psfd",
 };


