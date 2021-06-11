Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAFA3A3F37
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jun 2021 11:39:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140319.259300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrddR-0004yG-Bt; Fri, 11 Jun 2021 09:39:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140319.259300; Fri, 11 Jun 2021 09:39:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrddR-0004vW-8c; Fri, 11 Jun 2021 09:39:29 +0000
Received: by outflank-mailman (input) for mailman id 140319;
 Fri, 11 Jun 2021 09:39:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0bEB=LF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lrddP-0004vQ-My
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 09:39:27 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fde5dec2-cbdd-4450-a2d5-0021c32a2572;
 Fri, 11 Jun 2021 09:39:26 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-enljtwdaNdeLgcMk78rXlg-1; Fri, 11 Jun 2021 11:39:24 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3933.eurprd04.prod.outlook.com (2603:10a6:803:24::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Fri, 11 Jun
 2021 09:39:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.022; Fri, 11 Jun 2021
 09:39:22 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0112.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Fri, 11 Jun 2021 09:39:22 +0000
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
X-Inumbo-ID: fde5dec2-cbdd-4450-a2d5-0021c32a2572
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623404365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5tcyDQtqV243Vt1Pu4MZc3Wx8qSzPD4ZzLi6EoT2Pmo=;
	b=QcJQtAxxh7LMdnNMvMG7pzqOWLopVzB9xK4SdHWAW9kbvRKyMxLPV1LdRJHBgKXiZqzX72
	9fDVL08M6kGyh1vMUWw7emXUK3eLF21iC/VYcoC0va2hRULkHKWxFGY5HS60Ou0Q2SxzBx
	KYAd1QnPET+SjakRm1wwe9YXDvEBpUc=
X-MC-Unique: enljtwdaNdeLgcMk78rXlg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GcfAy0q1nbDEoq7+LPviz3cpfGEekELTZGCVL2T/rgBIDhjPQBSwxG3Bn2yPE/IhCtWsUDrWw1EQOUgd2DCon35d3Q54OGG8O3U04at/6rDEVZYkWLnTilU85CV+9UTQ8yeofqY+Alw+yIT/C1q0B6EylMoSyiPaZkKcNRok32WrsPaJXKPtrGIG11xNVt8g6d7a+WzDuVtH2+tHY+k8MeIJLh0K562BweTUfqgOVqOCRyFMf7nksSi164ONmS1bSIpIDTIHvEaefeQ4cO71keXjtHqdNKErZhURbT4X4l0869x8/U382Mp/A0TUHbst/JTUoOItm6ySfWh3UwF+5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5tcyDQtqV243Vt1Pu4MZc3Wx8qSzPD4ZzLi6EoT2Pmo=;
 b=mBwroHljrUJAN69Mq04M+Rw3/wWKn5/5nBmaN3554EbjkAUViUqW1FN3wHLk9X48WZrFicMQRsNLAWWf3vzpPYjE2bHiNSku/3E/MXGQ5cxAduTkUPEITNPtfiJnWeTnkiDKVfIV3+3iENsII2MML6SfB9bcGYigkKFUDKn0IwJznEL/XkCrertEznf9Y8oqzPLjYSSdGddeW/BmtipesUp2g7iRnLxN3L83Btdh/Wxk8eQdDM0vjcXMYjtyh2mXvYX9wO3tgZ8HvjqUD47ey5FoNUJVdqoZdueXccHIwqnu0DW+sQKZy65jIs8zEFQcv8jWijCOhnx7bvVjP9ThYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Arm: avoid .init.data to be marked as executable
Message-ID: <6837f903-14f6-4438-ed05-b373149984f3@suse.com>
Date: Fri, 11 Jun 2021 11:39:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0112.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e8b4353-761f-40ed-d1bd-08d92cbccb5b
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3933:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB39338FB33B0A46CC626749E5B3349@VI1PR0402MB3933.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6ao2bmoqV+PhJW+nZDP2uUEvfGRV2xXSrrq+OX1RL/bFizkiV6zsjnutVQxI8QGZHAMZUsWJ9jKNKiotllVFscMjZUGzJMA3HRgWJmqTzOXZR8t0zgUPMDDyAyhXPUAxbkF8B4TyHSKuHkeVPbGnJggTDxo0EXamTHCjcESlCJ+gvMgzneNaAZBcEVt2qsdcZka6EzJIATK+zs2vbErEabhrXtZtny2SVS/26yh39ox8AxmIXi7GgZH/2lczEO6acFHKsjOQjZtQ14jMxq3Pwamra8MBMjFkAB7jZZp7m5OXIB4opm02gKOIqECZQE+RjACwgCBRTb0hZH8LmmMt3VJya3bkvFYt9x6BD5+kI7h5QY5uoAbF5jq4VxpEb3ZlBVRHFLKw4Id9DD8MsZWUbFGmA03sLddv5/vHhqh/tngE54K1E6GhEz2aCxMnSMMx5hFLta61QFK/9brnbOQwsvW7JJSf1S2/bEmnngviedMNoJ4ZEU3bofPM5m1hK9N9sqcWsnmpKONLgwU6BMG4hOGvrErjCqaUlLpJ7AgM2JsDhaaFG5T65GVOzDc8R/KAP3wGUxCjWXDvPfxKONg8uYKsgBNDlcl5UmmiaaibXe4Rq0ZC6mXjA6ysQ1/sczQf8QdDNnV2Zk2eslPsw3R26/wNJJlw2HYROvReOJ/1ejf+F1hzzYsC8ujqU8I+sWReMJyMSEurI0SWX2rzc3FhOw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39850400004)(136003)(366004)(346002)(376002)(86362001)(31696002)(66556008)(2906002)(66946007)(478600001)(26005)(36756003)(316002)(54906003)(16576012)(16526019)(2616005)(6486002)(6916009)(4326008)(956004)(83380400001)(8676002)(8936002)(38100700002)(186003)(31686004)(66476007)(5660300002)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3RYZlptdlZ6dUMxeUJsQzZTNGZPSlVWbW91NXRiWXVIYU9LNExqY2JMZ2Jy?=
 =?utf-8?B?WUpYNE00TW0rZm1aYlVjbXZOQ3JhMDNNNDJGaHdyOVdzYXcyeklMTUpXWlRO?=
 =?utf-8?B?SHptS3hpdVlwdFlydFl0bmdxdEdwaXhrbzdoQVVuSkVqTE5vNW8zZTVCK2po?=
 =?utf-8?B?dEdpdXFNS2Q3aXBzYkZudnMvS0dqN3o3M29xU0R2MmJxQ2lyVkxFQk9qSEFy?=
 =?utf-8?B?QlpUTWhhS0VOa0pJV3JaQ21scVI4RER2KzEzSzViSlVuYlNoLzFCU2NUMmxX?=
 =?utf-8?B?VzEzdStFSHR1OElhWmc1T2NCeVNLMW9xZGNEL2FGYU5wT3N2OXUwTUdkRzlU?=
 =?utf-8?B?d0xrZkN2TjFFam42ZnlqOXg3T0hQK0VYY1JJa05nQkZkY0ZPbG9IQWNYYzRN?=
 =?utf-8?B?c3I5V2dOWDluMUZ5T3BOZTVCNHR3UnBHa2ZVM2dUZ1B5NkhFcDRpRFV4Y2hQ?=
 =?utf-8?B?VkoyN3M1cy84TCtKNnlWUXdtdHowZFFWYXhuVXIxSmdGN3VVQ0lreXdoRmN2?=
 =?utf-8?B?MVpYMzFDSUJhZUFlZVlIS3ZRVGFJOXdCbkdIakdwNGJ5RnhNQXh4MTB3WGI5?=
 =?utf-8?B?cFNBVFRvM3JMVzh0dFg5S2VXejBVQmkzenhjbzhGOFpTci8rR1dGZXJsdUNH?=
 =?utf-8?B?Y0IzajZtSEpzYzloR24wajVUZyswNWV1VUV0cmFHNDBzRVR1Ni95SFhVaDhv?=
 =?utf-8?B?enZUdzM4RkR3WU9ud1k3d3VnWU9sRE1WRFh1dytUQUJ6Qjdmcklwak9CSVJL?=
 =?utf-8?B?aFExVVRFVEFzaXdoSTV6QlV4ZHZJRzBBNnhjaEVTdTdhQkxYditxZ01UUEll?=
 =?utf-8?B?V1I3cGFRcGVoL3JFOHlBc0V4Ni8zcVRMZVQza0dxT2cramtBTVpqQldCM2h3?=
 =?utf-8?B?SXNFK3QrOHZ6a2hvL3dRSTkvVHFYQUROcHl4Vmk2U1kreS9iQmcxRHNUNmRw?=
 =?utf-8?B?Q1ZpaXJqTjRuYnI5NHpJalU4VFBVWURyZjVlWnpkdnQ2bzdQQmpiMlpxc2k0?=
 =?utf-8?B?dWdXREhrZ2lOYnZmc2JmQVJTSW1CMThIT0tWNHVJbFl2R2U1YkFMZ0VQZ25K?=
 =?utf-8?B?aE41RExmYTBZYlpQUS91R2p0RFlqb0dibjJEM2p4akZsUDF1L1pWVy9mZG1X?=
 =?utf-8?B?Zjg0RHA0aXovOS9zT3gvUWJodGRZYzJYL1RHVlVua1BzSHZRSzVOTEE0dHlX?=
 =?utf-8?B?RXdaRC9zTFJMaTJjYm1RVElROW9hWUtDM0FpeS9wWDg3VENaUTRtU01iYUJW?=
 =?utf-8?B?YVBkb25yOXZEemlKcjA3aVNiOU1RWTZHSnMxS3RWWUxpT3BVTkFTVHI0MENT?=
 =?utf-8?B?L1FlOFlYYWZ4RmE4U0syZVRmNnYyZmQ1OVZmYXdQc0RESnZ2ZHlPeDdLTFBm?=
 =?utf-8?B?ZTRZRlhVYWJWdmlUMEJqL1ZxdHhwaE80S1JjQi9zbmVzcWJTSkFuamxQZ0k0?=
 =?utf-8?B?NExudENLNUtTS2I5MHFqREZneHpRcW1LSUFMNHBKYWY5c3VYQmJiYmk2d2JO?=
 =?utf-8?B?VUR1UW0vZ0Y3b3l3QWkwRjB5UkxiM09OcEVNT2dXYTRnMUEyZ1lvQUpnMTBS?=
 =?utf-8?B?TzRHSUVYQm8vSFhabi9sSWQvTEFjajUzcnlZTnh3dzVINzhydkIwOFNrM0po?=
 =?utf-8?B?aEFta2ZhSHE5U2NwbnBrd0VjZTdIT2pRY2RpMGtQa2tQczcwKzFudVZHNVZC?=
 =?utf-8?B?R01TcEpXRlVUQkRtL3Mra2RCMW10Z2lEbXdzdHVoLzBnUUVxN3UvMy9VeXBV?=
 =?utf-8?Q?J8SDIR4eD8l41xB2HQW8BZdvVE/90I3s2CUB2LB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e8b4353-761f-40ed-d1bd-08d92cbccb5b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 09:39:22.8581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Q4TXC3y3ljy2kr11Qaspk6kogf/LBAYzBsWObz8XaN4rY1PXeh8Jil03aTaTDpuYyUSJXn7J23athmDLWyFEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3933

This confuses disassemblers, at the very least. Move
.altinstr_replacement to .init.text, dropping the redundant ALIGN().

Also, to have .altinstr_replacement have consistent attributes in the
object files, add "x" to the one instance where it was missing.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I'm uncertain whether having .altinstr_replacement inside or outside the
[_sinittext,_einittext) region is better; I simply followed what we have
on the x86 side right now.

--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -147,6 +147,7 @@ SECTIONS
   .init.text : {
        _sinittext = .;
        *(.init.text)
+       *(.altinstr_replacement)
        _einittext = .;
   } :text
   . = ALIGN(PAGE_SIZE);
@@ -169,8 +170,6 @@ SECTIONS
        __alt_instructions = .;
        *(.altinstructions)
        __alt_instructions_end = .;
-       . = ALIGN(4);
-       *(.altinstr_replacement)
 
 #ifdef CONFIG_DEBUG_LOCK_PROFILE
        . = ALIGN(POINTER_ALIGN);
--- a/xen/include/asm-arm/alternative.h
+++ b/xen/include/asm-arm/alternative.h
@@ -67,7 +67,7 @@ int apply_alternatives(const struct alt_
 	ALTINSTR_ENTRY(feature,cb)					\
 	".popsection\n"							\
 	" .if " __stringify(cb) " == 0\n"				\
-	".pushsection .altinstr_replacement, \"a\"\n"			\
+	".pushsection .altinstr_replacement, \"ax\"\n"			\
 	"663:\n\t"							\
 	newinstr "\n"							\
 	"664:\n\t"							\


