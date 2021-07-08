Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ABE3BF634
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 09:22:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152913.282500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1OLn-0006YT-LU; Thu, 08 Jul 2021 07:21:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152913.282500; Thu, 08 Jul 2021 07:21:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1OLn-0006Wa-HY; Thu, 08 Jul 2021 07:21:35 +0000
Received: by outflank-mailman (input) for mailman id 152913;
 Thu, 08 Jul 2021 07:21:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XUKi=MA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m1OLl-0006VD-HE
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 07:21:33 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 108ebf69-5d7d-4b64-868d-284b5e8d8c7a;
 Thu, 08 Jul 2021 07:21:32 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-14-y-afDG7AM46Vq-UqVCcZmg-1; Thu, 08 Jul 2021 09:21:30 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2605.eurprd04.prod.outlook.com (2603:10a6:800:57::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Thu, 8 Jul
 2021 07:21:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4308.022; Thu, 8 Jul 2021
 07:21:28 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0051.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.21 via Frontend Transport; Thu, 8 Jul 2021 07:21:28 +0000
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
X-Inumbo-ID: 108ebf69-5d7d-4b64-868d-284b5e8d8c7a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625728890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZZpAvKtmohzarK4azDYvQ9FxhhTmCdU3uZXkZyb9qg8=;
	b=lA0Z1vaft3YlxuFjkNkXdfw2T0VyaAllMwMurP3VUX4RqLDFMJ8B8FQvmxBTg3C9n3wwn9
	whenGkSVIrk6wo9j85x75WGbw2UeU0gVQKEFU/8tPp6YLCqHxrmPuV1GXZC59tnLQ16H0f
	8UxIbRo1eoaWeabzucuJEO6AFOr5TLA=
X-MC-Unique: y-afDG7AM46Vq-UqVCcZmg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wva8rqJuInerYX0AeSLayJeRQRyYIOLXF5AcUGZ6CH7By6UE3RcIIDTcaLjWrT1HhTd0Rx8Cj2sWvNf/oKzwaVsb2xG9HLBfu3EOvAV9p79l5R6wka9CWsKRzmWwbrRZSTAGSUGyiLcYMC8W8bjmQOEBS2MQv3Jwd/BvNkzI3hPgH+88N3FcRpRkJojcZwemOLr9dlR52YX5Dq0e2OAkzGvhPoPiSxCy4pRVLhKmTIuXgNOmYAJJtpYJWNV8s8Z4r3wNVsL/RtYK4IEB8QYFx3p0NeLv2LgNllEuE61WmJAvERAXXW6walyvR3CV5Z1PwYP6TY6ZWjgX4WgJ3d/FnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZpAvKtmohzarK4azDYvQ9FxhhTmCdU3uZXkZyb9qg8=;
 b=YVYGn3YSiYodBqUUtLQyxUBQ8zdaMlZoHpfva+yseyWG7m1J6b83Sm4oWI6zCR/WDX8axS2jqBu76OBK6vVidLxEDF68YkbWSuAmBezpGauNZ7wDaSeRU44r4gYj0r++rdSFCOAOosv3WhHrTVliSXbCFrdAuT5tCLsA6TJ/bXCeNQk2nMfvzlTUHuKV1XfAl5XmMuUymakHs6pAo6JrBIvTjybSOvsCqSKJSCe+6B3dTXOo89lMMNq+v8nIvooeUoEKfAsjtpuGpTuYyD4bxQ6oS+2ueo4h6RA48yf+zeM8KUpSJ8Gf0+69rJ6rlOMgrEWV7UYFNhIGNIKLL8ZWzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: qq.com; dkim=none (message not signed)
 header.d=none;qq.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Rroach <2284696125@qq.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/PV: address odd UB in I/O emulation
Message-ID: <b9bbc584-db3c-0b03-0314-3dd907f645bc@suse.com>
Date: Thu, 8 Jul 2021 09:21:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0051.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22a18163-c9e6-4573-28bd-08d941e100a2
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2605:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB26058CDC3DBCF69C684AF90CB3199@VI1PR0401MB2605.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xgYJbeM9nFRly+TJ4pH6A07O1biOJbL7UfZlz749mA9NMq39zvRPZr5ttDXm02+bl+lvubtAiwAnky1+hyH47S+sPc1pke5IxT16D5tjjBzgzCtl0A6/nwGZJ7dMhtj5o0+sOqbRlEJ7A2NrUTBD73YiUoOSUzcbsCPagzdGesuZ0jY3E3H7CxU9jWHggtvgyDoX6E15WKD5rDlXFJeQbi1qfMq16uZcBizV5NWVEVgIRYZIhuskZ8lAaMY4jMOw4rSoZAF+9z7mDCmsO0tWs+k6+o1/V3Qhg80O/9uuAQE1C+ko/QjBPgTJwP9Brc8DNNIAntL+kftnzzYpRvO2w174ZDFvbr6TTgS2Ye5S8FxeOnSjmEFH2+RJpReRDpYp31ogj6PLynfFflEKNjbi+mOikSNSBB3gWNmeHkAHOiGKKhCLmwPYERlUOQAyQCc99ns1hXaLBRyQt3NhG7ldcOr/Bc2yF5wN5jhTdYEq5fmzLJzhcZD+dSlPkFqryHZtvngIGD/n3ZlUzJMlKGymyIR+ETgONEvqJFDl3eAzIRU8svOoNUzyLl/UW5csUUWEC1VUpQq2a7JIuiBm4uNe9e3ZVjJn2kw2jUPlGrXu9TlcCd6FVV/tyqWBw1dW2VcrtNypI2GJ1yK5cM9KbHIwPQpL5dLOXdwA7G4ipzMP5hHrn06xH1i9y32Bkcw1cSxek8s+bvQ1i+1cFgNAuVdyR5B7xIBCaeFcp8Crm6p8QGI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39860400002)(396003)(376002)(136003)(366004)(31686004)(66556008)(186003)(36756003)(38100700002)(83380400001)(86362001)(66476007)(478600001)(6486002)(4326008)(2906002)(316002)(8936002)(8676002)(6916009)(5660300002)(2616005)(16576012)(54906003)(66946007)(956004)(26005)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?am8xTjl4bE95YVlWY0pXbWhlS0tFb0NJaU41dm9qTzBpdmhiNnRzZ1dGb1JB?=
 =?utf-8?B?bldGTmlRUk5YTUZwRG1qZkhObW95MC9sWUhNeXVJb1VmVXF5L1Urb1REamxD?=
 =?utf-8?B?OHdQaUtRNTIvMFU0clN6ZmpLRWIwQ0djenZ0WG5GdzBjZDg0ejF4Qmo3TllK?=
 =?utf-8?B?eENWS3JvQk1tQ29TZlFMeHcrcHBKcEtHakJGS1pHK0UzaUlOcVN5MzdKUUZP?=
 =?utf-8?B?MEduenRXV1d2Ulc4MDdycWhEY09hcE8yaDhnZDhXdWk0ZTEvZ2RvZDlMMDRw?=
 =?utf-8?B?SVFOU3RUelZ6VGhXL0pFNWcxdU5MWk1YbEV4YWF2UEZpVFlFQWhHNFBRZU5w?=
 =?utf-8?B?b2F6TEszQlVuU0dmcFBqK3VBRkJKOWQ0RDhIZGQraXZsOXU3ZTJHSkdQZWV1?=
 =?utf-8?B?N3Z3UTlMbkhxdG5PaHQ0Vll5QnRkWmlmSmtITFJuN1NDSVpHYlRuTXNDS3BR?=
 =?utf-8?B?VEFyOC80MFBUVEVsTG1mTGFRTXVCeko4eWNKczR1d0w5eHgyZ3UxUnZJZlB2?=
 =?utf-8?B?TW9laks1SzRaYmpiNFBpalpsZ1Q3elcyVnVwUWg2TlJwVlZmNi9kZU5vaE9T?=
 =?utf-8?B?dEFUVnJ4Z0t0eHVocEFnZmRvQ0hIblJjMjZWb1VOZGlMRFVoY2c1QWwwL0xB?=
 =?utf-8?B?V0VMamZjbDl6R3dUQmxMMVd4QW8wRVRTU29jNkVuWXlzUXgweEdIa3VvdzY4?=
 =?utf-8?B?Z2xQR0IvRS9wUU9rdHRMN28zY3Z4NnZFaUNnQk9CajY4WUQxY1pjWndrdW1U?=
 =?utf-8?B?Y3pnL0NSNDdFY0NyeVViSDB1dzVoQS9YWGZvclIxdC80dHNXSEY0ZHQ5M1NZ?=
 =?utf-8?B?YmpTelhlWVBQYk4xaWhPTU1neVpNb0tqc1prMlpuL2JrK01MWjU4TjRWZkov?=
 =?utf-8?B?WlFZWW0zVzRtWC9SOHJXVmd2bnRRRFBtVy9rcFlwVTZTNUZFbTUyWktpYitI?=
 =?utf-8?B?WEY1QUVrUjhLRGs5cGYwa3JFZ2RrSGZ2TFVVMWk2a1dFUkkwTkRRYll5Q2pm?=
 =?utf-8?B?SDRQU0xBN1dTUy9Mc2Z0a1Z4bkhra2gzNEF5c3E0b1Y3aUUybDU1SXJtd3FM?=
 =?utf-8?B?eTMwM3E3U3VZZ3N6R1pocGFMRS9BL3o1dEJ1MUpScUNJb3NJaWRTOExUdWE5?=
 =?utf-8?B?MjF3Q3o0MlR3dm1vRXdvZjZQbElrMlFDQnRqMi9mOW1aZG1FQzhWV3BpRU51?=
 =?utf-8?B?MDJJM1YvalE0QnV0SG5yL213QTQzOHF5SlNEbitQeUtmU2JPazVuNGdPZWdi?=
 =?utf-8?B?TDQxYkJUdmMyVFNMbHpTS1pKZWtIdjg1VlVXdmVHQTVKeEdodHZuc3VIYStx?=
 =?utf-8?B?Zm1Sb2paLzNsaDdkWGpKdG1xa0dBUHFTMW15VFVLbWJQeU5ETHZaa0ZuUDhG?=
 =?utf-8?B?YjFSVmwxZk9TVVhyZ29CZXdZQnoyeFNjbTNpUGd5TllZaFdHUldrZEp0cmJj?=
 =?utf-8?B?NURuSkxlL2MyblF5WVVFNHE0cXJtTXZkOU11VDFNeGpWTDBWdmZrRVVERE5U?=
 =?utf-8?B?TjdERjhGZUxROTdvSXNUZU82clBWVTV2VzlsOVZmb1d2eGE0QUM3L3h6NUpk?=
 =?utf-8?B?RDduNHM0N01KN1Z0czVzQXFKNkRzQm1QcDJQMXVNelUzTEN0WWlEYTdYaStZ?=
 =?utf-8?B?QWljaVlHSEpKN0JWcTM3ODZnUVRLeDdHYm1lOGtXdEJZVWNMKzFiTVJ4ZktL?=
 =?utf-8?B?WlA4RzFqUFlGNHVxV0pjVmk0NHF5eVV3SEpLQ1hXMWQyTUR0NmliVmJwb3JN?=
 =?utf-8?Q?l7DrL3QHZjhXbGQftplZ2h0iPYpSlbNqOUkzlyG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22a18163-c9e6-4573-28bd-08d941e100a2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 07:21:28.4569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8g9KXORZDCd1dvLuxZlfR/s4W2dXj/iJi42a94p+t5u2BVJBz2q9eCStd/zl0DFDu6MUaFEpVMP+CtwbTl6Bsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2605

Compilers are certainly right in detecting UB here, given that fully
parenthesized (to express precedence) the original offending expression
was (((stub_va + p) - ctxt->io_emul_stub) + 5), which in fact exhibits
two overflows in pointer calculations. We really want to calculate
(p - ctxt->io_emul_stub) first, which is guaranteed to not overflow.

The issue was observed with clang 9 on 4.13.

The oddities are
- the issue was detected on APPEND_CALL(save_guest_gprs), despite the
  earlier similar APPEND_CALL(load_guest_gprs),
- merely casting the original offending expression to long was reported
  to also help.

While at it also avoid converting guaranteed (with our current address
space layout) negative values to unsigned long (which has implementation
defined behavior): Have stub_va be of pointer type. And since it's on an
immediately adjacent line, also constify this_stubs.

Fixes: d89e5e65f305 ("x86/ioemul: Rewrite stub generation to be shadow stack compatible")
Reported-by: Franklin Shen <2284696125@qq.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I'm not going to insist on the part avoiding implementation defined
behavior here. If I am to drop that, it is less clear whether
constifying this_stubs would then still be warranted.

--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -89,8 +89,8 @@ static io_emul_stub_t *io_emul_stub_setu
         0xc3,       /* ret       */
     };
 
-    struct stubs *this_stubs = &this_cpu(stubs);
-    unsigned long stub_va = this_stubs->addr + STUB_BUF_SIZE / 2;
+    const struct stubs *this_stubs = &this_cpu(stubs);
+    const void *stub_va = (void *)this_stubs->addr + STUB_BUF_SIZE / 2;
     unsigned int quirk_bytes = 0;
     char *p;
 
@@ -98,7 +98,7 @@ static io_emul_stub_t *io_emul_stub_setu
 #define APPEND_BUFF(b) ({ memcpy(p, b, sizeof(b)); p += sizeof(b); })
 #define APPEND_CALL(f)                                                  \
     ({                                                                  \
-        long disp = (long)(f) - (stub_va + p - ctxt->io_emul_stub + 5); \
+        long disp = (void *)(f) - (stub_va + (p - ctxt->io_emul_stub) + 5); \
         BUG_ON((int32_t)disp != disp);                                  \
         *p++ = 0xe8;                                                    \
         *(int32_t *)p = disp; p += 4;                                   \
@@ -106,7 +106,7 @@ static io_emul_stub_t *io_emul_stub_setu
 
     if ( !ctxt->io_emul_stub )
         ctxt->io_emul_stub =
-            map_domain_page(_mfn(this_stubs->mfn)) + (stub_va & ~PAGE_MASK);
+            map_domain_page(_mfn(this_stubs->mfn)) + PAGE_OFFSET(stub_va);
 
     p = ctxt->io_emul_stub;
 
@@ -141,7 +141,7 @@ static io_emul_stub_t *io_emul_stub_setu
     block_speculation(); /* SCSB */
 
     /* Handy function-typed pointer to the stub. */
-    return (void *)stub_va;
+    return stub_va;
 
 #undef APPEND_CALL
 #undef APPEND_BUFF


