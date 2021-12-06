Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BFF4698DC
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 15:27:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239087.414410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muExE-0001oG-ON; Mon, 06 Dec 2021 14:26:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239087.414410; Mon, 06 Dec 2021 14:26:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muExE-0001mQ-Kn; Mon, 06 Dec 2021 14:26:56 +0000
Received: by outflank-mailman (input) for mailman id 239087;
 Mon, 06 Dec 2021 14:26:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muEqj-0004et-I9
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 14:20:13 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ffa662c-569f-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 15:20:12 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-YWmGVimnM4GaEqKzmODPNA-1; Mon, 06 Dec 2021 15:20:11 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2333.eurprd04.prod.outlook.com (2603:10a6:800:28::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 14:20:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 14:20:10 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P191CA0006.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.17 via Frontend Transport; Mon, 6 Dec 2021 14:20:09 +0000
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
X-Inumbo-ID: 9ffa662c-569f-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638800412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=juBJGq4ZapzX50bKGD151YensGcEVFSl2L4HTOV0500=;
	b=I3hcgTriyde+o9Kpz0eA7nuclXpFLrxLNbWyvi+5d95TpvVB984po+6jnq2ZgmOy+mTNvI
	dEzUf1oIVDZ58rX2ORd8kr3AKiK0I1JpTjKYgIFP6v5Rat3C2EmTXcF1e0Jx4OG81qO7LC
	tF7esXy9otpL2KTpdEMZXWynfes0EHw=
X-MC-Unique: YWmGVimnM4GaEqKzmODPNA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dSI9SuUMgo/E8SWU9yMqXTF+Mu3lCr0yNu8X9rZkh+g7LjL01aeOEymM8yt+DtGjneJk/TXjKdPzAOjN5Zw+Yg79iHK5uG1jS9ONYYALEjEEviIFkVnBdTR6AVjpGWmU8SWrPQNqnp61qMChzBHbeUgLb+WwNI9u7orPr0SaByEeqDAbjW4ri61Bvz/wHPr+xDeCKlTwgDLLzxKHghFMR9j5kCFyboM+pnsmGp1WMZisnqYDNztQekeORpB6xJ4KvU7nnItr6qx8r8OepsxA41eDe5YzGpti+0Mu8H9M5zUKrBNuJOEWYQcWAK+LNaUB3ebzO/ZfKa8H4xKKwNmb9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=juBJGq4ZapzX50bKGD151YensGcEVFSl2L4HTOV0500=;
 b=HN975pnAwacdR9JVgm4IoOQ5fNSfrBB8hzgh0ZgEHJgJIi2M9gOL6E615uywvt7ibBKtgl8h9lyRJS76rdybjcNyE8OfR/hCfPtUNfvbASQo4PuotvfiPFAwYvYQYhO1TgMPfy14OuJ60VWhT/uXX8ekFdtz7inK2ClqXwrOa5a3sTYfdgjwjHJGSUuJ7kQC2VbBumdcGRJ57KD4IH71zxEtBvm1SkV3oqbTvIqP6Lj+/dFdJF2pzg2mvEHIdyjg3BhQpBuCYOOWs/vHGuvI47SlZBqbzDhTSKbWLvkFXXMlUZmSCiVMuVOCQl+ku4mdwLDxuL9Zz3GyACE28B9W9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8db595d1-a0c7-4a7a-4a06-16689adbf938@suse.com>
Date: Mon, 6 Dec 2021 15:20:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH v3 6/7] x86/boot: fold/replace moves in video handling code
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4af7ce92-8f4b-0be2-2439-a1bfaff59be6@suse.com>
In-Reply-To: <4af7ce92-8f4b-0be2-2439-a1bfaff59be6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0006.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f946c7c7-737c-473b-1091-08d9b8c3829c
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2333:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2333937533AB0095D829B4CDB36D9@VI1PR0401MB2333.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Nis2F3zYkPzKQl4LzPMTLoZh8BP8J+gGlmco6zMRCvt7s8y6J6B2ysj7xF7JdU10flXTbZtfwDSU2lv6SPDpesRV0E/zpSN6fwgEQBWGkLwEZyW4hc8mEi2dsYVA7iBEAB+qcIXBs5M+skVfH87SEloQ/R40n0AY9TjuN4Rfi19qpMLG8DrFilM491rOmsyOMxfMKhXOmIFYneHcdDW6Xd67MR2tHS8iJSfLiZRUplLdBlKDWZpZu7k9dMzQ9B+VEMz3oaNYLnZAifGGRBLmTcEyQrA+4MpeitHwmIU72p5KgXxYRBBt79QYV48OoBCpxYi5WOqSh4iPnKQCtBgCdv2JLUBAXjkH1AzUbtRxoRlSqR//XFv1lcuWBnkghUbju13MQAw27uWDH/FGICUjYYZLpEiWIaMe4zX9v1Pw+4euGVCizn7iDB6OfwuEC4vR0ilbEsBE9Vq+j9mDq4aVCgj2wYxEx3t7zexbEemsPt/A8/PkQYB++QF/KfqHR7rcbfhq1Dx9gwHBDN73dsNWjJgVVzPEsemTx9xWpTcLQt9wnlqo92piEIu7thw2tBERazVuPSMvYmEjzsIAX/PRG/aBt9cqUW2IlovC4/I1HOOWtS761Jt0TDI8y/uatV1fIvZ/xShZrxXD7ZSv08TnuJhYZ87C677XCWtZtndRDUPpMlAhU9h6jdSBHaT0ZRXtGY5Uq3kebWu0tk8yKrmeuichvCg/KYOi2pKGGX11WWA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(54906003)(316002)(16576012)(86362001)(31696002)(66476007)(66556008)(66946007)(5660300002)(2906002)(508600001)(8936002)(4326008)(8676002)(186003)(6486002)(2616005)(956004)(38100700002)(6916009)(26005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWx2Y21oYnJOUVFxdlpkSFRFWFJxZ0dsaFpDSVRYVXU2ajF1SHlseEhhY2dG?=
 =?utf-8?B?dUVzRzZ4blRTaldTZXBrblFTR3ByS3RiemlrblFwNFF6TVpTbFREaWgwVjFw?=
 =?utf-8?B?RHkwTE0zb2xFd1lNVGRMTTBzc21tRUl2RWZRQzk4ZDZ5OGgxazdhZG0vdEFK?=
 =?utf-8?B?cjJYZWlHMFBBVXh4NVBMcHViVGptZ3JYU01PT2ZRZXJlY25FM2dCeDJkc1Jo?=
 =?utf-8?B?TVpVRTFBZS9ybGJzVm9vdXIxdm1zOFMySHNzYWVUc1g1MU56ejBhYUZVTE5p?=
 =?utf-8?B?YVNpK01reG10eFZGcmlucW01MVZRZ24yRWVRTFZkMW5IYjNyRmZGamxuZ05Q?=
 =?utf-8?B?OVNrM3JQYlVzVzFkcnJzZ0VqZ3FyNlFVZzBudjdXL0poZy9WNFJhSXdSbnFl?=
 =?utf-8?B?dFBwMzFEajVOL2RjSFBBalVZSitwMWZ3aTNxaXNZT0VrdW4xdmdXSnNDTUF4?=
 =?utf-8?B?d0FFQTNrdjM5Z2hIQk1URDIrZFd4cXAzeml3MWxOcUM4Rk9kMG9IdGMreGlv?=
 =?utf-8?B?bWlEeVRpbUtmU25tK1RoQVM3N1VtV2hCejVhSHd0cmUyc0xKWWxrbk16U0li?=
 =?utf-8?B?dXI0Sm9DY3FzNWF6WE9JMjR3Ri9vRFF4RExUeXJGdlJheW9LVjhMVmVHekth?=
 =?utf-8?B?K0I3RXRxQzFGMGcvSnNDdy91TXhtbFlmS3BBdHBZRG1aNVFoM2RiRzAvK3BD?=
 =?utf-8?B?WnBDWHllajRoay9VbktuSjAyK0x2ekd3MDRLODNudHlqYng3a1UySzd1bGIx?=
 =?utf-8?B?ZCtTM3VLbWROejR1SllyZHFOamFoMVkzQkdBSnRLWVF5NWtlYXh0VU1UNWdE?=
 =?utf-8?B?QkpDZ2poeEZjV1BIY0hXZkdnR2c5VHUvNGUzZWoyMFpqSWE0aCs1UHR4eDR1?=
 =?utf-8?B?NlA4RkFjUUFFK2kvWnhDcXdiaGhybi8zcjR0dXFMWVRRVisrNHVqTkdpT3M1?=
 =?utf-8?B?SlFiS0ZJaUpDaUwwd3lhN1BJVjA1SlBzejlxRkFCVkpIZ0NKSEpsT3g5WkE1?=
 =?utf-8?B?ZW5PNDZ5aWVWeU1CWk9DU3FyZkI4TytSRElneEp2dnpqOFVHNS9EMmppcEZs?=
 =?utf-8?B?L2lwdXZPVUszRHpBNGdBL3BWdGloakI2SnlvWmdiQTF4UnRsR2VxTFU0aGFo?=
 =?utf-8?B?Z2Q0dkFXeXFkeFVnS2ZwT3ZGWDh3WUJDSi95UThJcWp2aVB5ZzlGZ00rbHlx?=
 =?utf-8?B?V2xjeVdqeFJHTCtob0Jxb0hPcitwdk9pMWpaV2NUdlJBc3cwOUR5VWJwSEFJ?=
 =?utf-8?B?SGhraTlxbC9jd2I1c2pSWlR3c3JEYVIxZFQ5STI2aDY5enBmTU1STGV6RkFM?=
 =?utf-8?B?bXk4Wk1hWGQwbXM0TUZWazlkdHgxa0NSK0wxVGJMQU9lM0JGWEhvZjFoQWpv?=
 =?utf-8?B?anl0YkgxNDFKSElPR3lpS3FYS0lzUHRCbTJJMzdySHdYMUk4WmIrTkhGNzBI?=
 =?utf-8?B?YWZIWFFFL0FjSnNWQ1c2NTBQNWlwWWRvbjVHMHFFWnFRbCswOUVxTGQ0a2lF?=
 =?utf-8?B?bG1BQ3RCM2c3TVV0UHVEWUowd2o3a3U4S3lhdGRadkdLVERlWitVeGVxUnU3?=
 =?utf-8?B?V1ZJbFI2VHJWWm90KzIxTkJUKzdWSFBxVzhkMjBwdkE2R0hadHFheVdLQlAy?=
 =?utf-8?B?T2d2dWZKUUp0L3h1RDJVdzgvbWFOcmIrNDlBZzdZTjZhS1ZReFN5eEVjUE5X?=
 =?utf-8?B?WmgvaEhzcWpid0padDBueGxrbjVWUkpBWlFvZUdHR00vQnpLZWlpNHFBTlZM?=
 =?utf-8?B?ckgwWjNPQVJsYU1KM2dzM2pPNFZlVjV6c1JxRHlGNGd4OHlIcTIwb1pwY2sr?=
 =?utf-8?B?RGRuNnJIN3htN2haNFBZODlSWXY5OEk0MVVxU0JXQkpFYVRqVkNReDh4N3Vl?=
 =?utf-8?B?cU1wRExKbGpkTWYvdHRjR0dpSFhIdjNSU25xWk1WZnhYSzM1enNab2c3dmZU?=
 =?utf-8?B?UFdjOWU2ZWVaYXdtcFlyU2lrMlVDeUhRaVRxVFAzRTd1WTBwbklCbXRVVGgy?=
 =?utf-8?B?WUE4MlB0NWJDeUNxV3h6UlF3SzBUdWdjRm9QbGlKVFJReE9mcHVxTFdmR3JK?=
 =?utf-8?B?Um1OLzdnaHVDc0FVdlhCTCthSkhJRjdqOVVsUFdta2cxaktOSFZvZHZBRkVT?=
 =?utf-8?B?emVYSGJiL2NHNEFMc21qaDhqNCtwQ0pWNTBPZklUNFJ2cnhJSnNWVWV4cE00?=
 =?utf-8?Q?0fwGjgjHpFks1CokeUbiPWQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f946c7c7-737c-473b-1091-08d9b8c3829c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 14:20:10.0434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4c9v+gm6dIaSdFJn3sBVZNX0grqqECno/hEIr/pSgHtU1woHlnSnwPXlpOdXHI90Q3Zf4MitjJtm9WCBtZO7ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2333

Replace (mainly) MOV forms with shorter insns (or sequences thereof).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Of course there's more room for improvement. For example there look to
be a number of LEAs which really could be MOVs.

--- a/xen/arch/x86/boot/video.S
+++ b/xen/arch/x86/boot/video.S
@@ -121,8 +121,7 @@ mopar_gr:
         movw    %ax, _param(PARAM_LFB_WIDTH)
         movw    20(%di), %ax
         movw    %ax, _param(PARAM_LFB_HEIGHT)
-        movb    25(%di), %al
-        movb    $0, %ah
+        movzbw  25(%di), %ax
         movw    %ax, _param(PARAM_LFB_DEPTH)
         movl    40(%di), %eax
         movl    %eax, _param(PARAM_LFB_BASE)
@@ -135,8 +134,7 @@ mopar_gr:
 
 # get video mem size
         leaw    vesa_glob_info, %di
-        xorl    %eax, %eax
-        movw    18(%di), %ax
+        movzwl  18(%di), %eax
         movl    %eax, _param(PARAM_LFB_SIZE)
 
 # store mode capabilities
@@ -144,14 +142,11 @@ mopar_gr:
         movl    %eax, _param(PARAM_CAPABILITIES)
 
 # switching the DAC to 8-bit is for <= 8 bpp only
-        movw    _param(PARAM_LFB_DEPTH), %ax
-        cmpw    $8, %ax
+        cmpw    $8, _param(PARAM_LFB_DEPTH)
         jg      dac_done
 
 # get DAC switching capability
-        xorl    %eax, %eax
-        movb    10(%di), %al
-        testb   $1, %al
+        testb   $1, 10(%di)
         jz      dac_set
 
 # attempt to switch DAC to 8-bit
@@ -164,17 +159,17 @@ mopar_gr:
 
 dac_set:
 # set color size to DAC size
-        movb    bootsym(dac_size), %al
+        movzbw  bootsym(dac_size), %ax
         movb    %al, _param(PARAM_LFB_COLORS+0)
         movb    %al, _param(PARAM_LFB_COLORS+2)
         movb    %al, _param(PARAM_LFB_COLORS+4)
         movb    %al, _param(PARAM_LFB_COLORS+6)
 
 # set color offsets to 0
-        movb    $0, _param(PARAM_LFB_COLORS+1)
-        movb    $0, _param(PARAM_LFB_COLORS+3)
-        movb    $0, _param(PARAM_LFB_COLORS+5)
-        movb    $0, _param(PARAM_LFB_COLORS+7)
+        movb    %ah, _param(PARAM_LFB_COLORS+1)
+        movb    %ah, _param(PARAM_LFB_COLORS+3)
+        movb    %ah, _param(PARAM_LFB_COLORS+5)
+        movb    %ah, _param(PARAM_LFB_COLORS+7)
 
 dac_done:
 # get protected mode interface information
@@ -504,7 +499,8 @@ setvesabysize:
         call    mode_table
         leaw    modelist,%si
 1:      add     $8,%si
-        cmpw    $ASK_VGA,-8(%si)        # End?
+        movw    -8(%si),%bx
+        cmpw    $ASK_VGA,%bx            # End?
         je      setbad
         movw    -6(%si),%ax
         cmpw    %ax,bootsym(vesa_size)+0
@@ -515,9 +511,7 @@ setvesabysize:
         movw    -2(%si),%ax
         cmpw    %ax,bootsym(vesa_size)+4
         jne     1b
-        movw    -8(%si),%ax
-        movw    %ax,%bx
-        movw    %ax,bootsym(boot_vid_mode)
+        movw    %bx,bootsym(boot_vid_mode)
         jmp     check_vesa
 
 # Table of routines for setting of the special modes.
@@ -773,8 +767,7 @@ vesa2:  pushw   %cx
         movw    %bx, 2(%di)
         movw    0x14(%di), %bx          # Height
         movw    %bx, 4(%di)
-        xorw    %bx, %bx
-        movb    0x19(%di), %bl          # Depth
+        movzbw  0x19(%di), %bx          # Depth
         movw    %bx, 6(%di)
 
         addw    $8, %di                 # The mode is valid. Store it.
@@ -901,8 +894,7 @@ gettime:
         movb    %dh, %al                # %dh contains the seconds
         andb    $0x0f, %al
         movb    %dh, %ah
-        movb    $0x04, %cl
-        shrb    %cl, %ah
+        shrb    $4, %ah
         aad
         popw    %cx
         ret
@@ -959,8 +951,8 @@ store_edid:
 .Lforce_edid:
         movw    $0x4f15, %ax            # do VBE/DDC
         movw    $0x01, %bx
-        movw    $0x00, %cx
-        movw    $0x00, %dx
+        xorw    %cx, %cx
+        xorw    %dx, %dx
         movw    $bootsym(boot_edid_info), %di
         int     $0x10
 


