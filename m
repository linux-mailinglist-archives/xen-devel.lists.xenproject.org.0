Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C924E256B
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 12:47:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292943.497522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWGVa-0004XE-Pd; Mon, 21 Mar 2022 11:47:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292943.497522; Mon, 21 Mar 2022 11:47:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWGVa-0004V8-ML; Mon, 21 Mar 2022 11:47:34 +0000
Received: by outflank-mailman (input) for mailman id 292943;
 Mon, 21 Mar 2022 11:47:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=svEr=UA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nWGVZ-0004Ul-Fs
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 11:47:33 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b16aadce-a90c-11ec-a405-831a346695d4;
 Mon, 21 Mar 2022 12:47:32 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2053.outbound.protection.outlook.com [104.47.9.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-PheLPJhUPCOcfr8i1XwSoQ-1; Mon, 21 Mar 2022 12:47:31 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by HE1PR0402MB3468.eurprd04.prod.outlook.com (2603:10a6:7:82::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.22; Mon, 21 Mar
 2022 11:47:28 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a%6]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 11:47:28 +0000
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
X-Inumbo-ID: b16aadce-a90c-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647863252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/C9gNQQ/WXeRHWoD/77+2fPAAXlkvuCCam48qLYjwoc=;
	b=LarrRN+Gg4f/gQ2dOCB6sGnbTs4dL7qEhz7M/gR61jQyCMeQ3n6ZCGj5EPLQWKsTtljZsK
	+0cjoZZiQAHaw2vMNa7MGI+o3EKnAoPNBfftY488QPbgn3vzS3dW1uelQK8HABBXRx2o9z
	Pyyn7NTfbOwNtduTRU/zuu89o71lBBc=
X-MC-Unique: PheLPJhUPCOcfr8i1XwSoQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z2GVPNzvrG64AvvIZ/uMB5rTb6yHk/YCkRftcE7tzKZLsbEOFkznbpuYPaeDTSZKxt0jckixIbTwKPJ61/nTEEqfFFj56xW3Yt/XUG/cp6JCSFoUXZdQLnwrxXMsggfLJ+cjHc65RPyj/mLNxRZwNrxf4kRhAcM78LFmFwuEtj0lz8eNAhqGxMMNr7xzADNcCn6P8MXpb88KkxcxEPUvm5L7Kz2Yhh+9lI1dRB3U4Zc5ZgBgPHTywZ+RmvfYMgeUtpX0ljySH8dSBc6o/oWvZK868YecnOxC6qVamgsXNgMxqZu8Cf4jQcjk9wyVL5pYSEWG4YUtf5Aw75VTkJIdog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/C9gNQQ/WXeRHWoD/77+2fPAAXlkvuCCam48qLYjwoc=;
 b=NP6sn1jaRoCY6kOufIeXs3bWoZ32xCLBHDO3otMJwhHO9wEDOU8rPZbfJWHS5IRVINdLIOFGwDDjBV9r3vk3dmFoClLWHhsKk4OOGFctXWWVpJ8tY1KGmbZUp5bXdYwyv2zAAyrxC/XoHyUpyJ8CUZ+CPK0YV/Gbq5DTeZMQOPyyInzXF2L3PSky4hv5bI71rBEveuFjgrA4C0Cl71ovmbOMMg9nWVHNdkEwiDQ7XnQRTR8mrQnURUG8vIQ1UloJgOoqH6Atnfb3jwPjbDRJT+uf3tsZNQcdAcSVFtCioBxXoIDS3fZ5AwUyqmTO9nIrGemjisN0+EZZRmcPjHobkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1eaec57f-7a6a-bfd2-82f1-df25f86b69d6@suse.com>
Date: Mon, 21 Mar 2022 12:47:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/build: also handle .comment.* in linker script
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0070.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::21) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a972abe4-607f-418d-9a18-08da0b309379
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3468:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB34687848BCA0B7D12CD65ED6B3169@HE1PR0402MB3468.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wlgDW7a47vUIdRIngqNO7dSjYQ/67ovX1D9ILZ91XKSORZjrzrbvQ/ERTsybJUIS+LGuAkAOfaQzM+y695jX5KVfh122yryTdn63ZRPUJdNmUc15J/fmsxTFaGwGDu8paJoYLc5A1O3ayeeD/S19axsrTe7bWsa+2IfIk1UFLO1SphmcckK7boSaojJWE5CZQLOC8QcrOCrOBnLR0LFqFHRV0RJ3GzT+XnHGvg5Z6nZ6gs8pN7RQA7o5ysje8AYP+9uzXp2N8eybNl5QjZv1RPQs6+HeF3maMKTLTqFayLOS9nYRh5WbYsIOxmmoZ0NHNOtdFlF7ZC8IKMh7GOV/1wbYLqm+1yAAgtoNQs00Dp5ewFxhtzM/3uMiswrqkElpS65iTVYzmryNCwmnRxdUOezxJ57EmNL1unjvBMIoL70uVZ0oBzYtyBKPcqCLLQo5UaNMweZUVoTHHqfI/tP4h1BGLl1GqI/qRRN4x8Tv287IVeP3BzL4qICdooBVRIqEDsmDVOepN5ctcKBz0ehI68z0O7PBJksc6fRtCjLZOnf81+ANCaNrO+KShASvfrleyhtasur7iS/Yr8saFyEFQ51MBgAQuOLRgJrA7NAZhE2GCJu61Q8yzaRmGxtNpsWoHZwbYyO+lkcgYBatnLlQ06PQ+U8PwamcQg6AIiBkG5upUfXPyfjogO4BqbA6pQCqQcDPtjnkK3DfB0SxMS43BO2gAoPLB+inWayAd+9uXalvfpwQAHj9I+SJ6uXRyqF352/A/eM4R0wSj9omNhApaQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(508600001)(6512007)(86362001)(31696002)(2906002)(6506007)(8936002)(4744005)(5660300002)(38100700002)(186003)(26005)(2616005)(31686004)(4326008)(8676002)(6916009)(54906003)(66946007)(66556008)(36756003)(316002)(66476007)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzczT1ltMnEwQW8vWkQvUjBVNWRhTW9DalU4OElIMlRhV0lNRXRUWTFQbHkx?=
 =?utf-8?B?SnBicU5KSC83RnA1QlRDOE5nMUpkSmRCWnpIaTFJQTY2ZmU5K3dMQXhYMWJl?=
 =?utf-8?B?cEFDV2JWclQyZ3FlejhpSEpoZ1FDbjYySVVtZHE3M2ZGY3JqTVhVb2FtWEFl?=
 =?utf-8?B?R09wcDNrendzcDVVRCswd1hWMkFzaHp4dXQyT0Iya3VibmNHVG1LOUtPbzVO?=
 =?utf-8?B?TXFZL0xDSU4yVkFtMFVvUExTZWt1WU8wcFZJUGZjaFI0cXkzWUdoRUN3UW1n?=
 =?utf-8?B?ZGxUcCtLR3M2VkltTFNQb2NscGdMNG1KUERsbVdDM2xML05mQlVxcVJKejlq?=
 =?utf-8?B?MWJzVVd6YVRWcUJMTER3MjJRY3RUcXBnUkRDb1VDK29NdElyeWJMWDFINXF2?=
 =?utf-8?B?NnBiRUFtajZWT3ZFcXFGWWF5SjliTVBxSGpIbVZ1ZXN6YTRNclFQdGpFMDd2?=
 =?utf-8?B?WGtlc2N1QzM5Zi9LcGlIRHNaSEwvQzV1aERLVEpjNlc4UUJMSkc0R1MyT0pZ?=
 =?utf-8?B?ZzlaMHc0S1IwLzdienp0T3dLMXVveTFvc28reVFjR3RVaWltTHVyRCs5Nk1Y?=
 =?utf-8?B?b0VlVlVXdEx5TUMveWUzTzM0bjFxQVQ0aU1MODlLSHVaWEUxdm1qdnN1Mklm?=
 =?utf-8?B?V3M0YkQzT0ZDUGk5TzlIYWd1RE5CaWNkNHUwVWNjalhQNWRLZGRTM2gvY0Nq?=
 =?utf-8?B?UTZSVjVUbGtUcW5wOTIvK3FSRjBJNGRWWS9jNk9jbEZiOWpxYjllSUpoTzh6?=
 =?utf-8?B?TWo3NUV6NWlMSUJSZFVPd1V2dXBiTXZXMi9TQmlZM2UrS3JjUjJxZEhQejB6?=
 =?utf-8?B?MFRpTXYwelBYMWkyUUVkWEo3dklESitLUWpCaExWWUFieGh0K2NkbmF1SHpu?=
 =?utf-8?B?RlVVQXkwaEN2RWdqVzFCbHQvK0pWOW0rRXNpU2xxR3RQandRVWNMWldzdUFs?=
 =?utf-8?B?Y1crdzhLZmIxVmszdGhleXEwRWJrTi9BNVdrTEV3NGE2VHZGYWVNWUJ5MGlt?=
 =?utf-8?B?SnA2REZaTjBNOXQzZE5ISTlZRk9EOERwcWF6RXc1eTNRYVFHd3VMdjJrRmJU?=
 =?utf-8?B?c2g2dlVvVkVOODNPMi9BVUJ6eGxVYmZ5RHBmK1ZtQkNsb0hEZHNXMUIzUlZw?=
 =?utf-8?B?NVMwd1N2ZU9iRWhYazFrdXlMSWpMakxHbjlIQmhjZXlPWDB6QVFIYWxOcDRY?=
 =?utf-8?B?RTFWV2RvMGFHdGg3a1gyNW9RbGx1NHdCeERteDRnSFNYRjZGemYySWtMZlJy?=
 =?utf-8?B?NVdxNHMxOWVTa3VabDY3czJINVNORzRaMGdVdEw4RmJiaUtoVjZmeUw0bzZD?=
 =?utf-8?B?cnFUWU13aWZ1SFVVTGVmK1BjTnVzYzU5aTBJbjdER0pTbmEvSVlPczBuejdx?=
 =?utf-8?B?UVJ4dllXR2xFd0MrbFMwT1N3L1A4aGF0UDd2cDBSMTZXeC9PaFgwcFE5MDhz?=
 =?utf-8?B?bE9uVi81K0Uvd09QcEtNVmJhaTVFcjJBMStWMVVKSGtYKzNldmQvbXVrbEM1?=
 =?utf-8?B?VWNNb1R4aFdGN2dsZW5kblJnVHBRMW5aYVduZ2ZOTlRkU0pQbXlSS3BSMkhT?=
 =?utf-8?B?V1o5NisrclJRMG1jRWZuM3ZyUlpVNUR5Z1oya0ZFUHdJSEJ1bTlaZzNOcWJv?=
 =?utf-8?B?aXNNakpXRVZYZlNPU3lEM3RXbVJqTXl4TlY2OHVzQU9XVXpZM2xRdmJOK1c4?=
 =?utf-8?B?QVI4SHJDMlZGVzBURjdONkNKbnBTNTdDSWdOVVFvUjYvYnYrMzk4R0x0bm5M?=
 =?utf-8?B?ZlVKU0J6S3dVdTBPRWw5bEZZeE1HQzV5NTdRQlRIRGxMY05xc21zWC9JRita?=
 =?utf-8?B?UFBQWFM5SUtPNDR4YUUwY0FYcVVZaVFiek1IRGxlYlFvaHVOcnVPR3JONVpu?=
 =?utf-8?B?ZUd6RDZPN1JiNWVYVXlTaDRuQk5tVFBYUmYwcnBqRXNIYzZWY2EyWVhCZDRY?=
 =?utf-8?Q?L3qqs4u/egELO5Q02YUku7pSHeopKWqo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a972abe4-607f-418d-9a18-08da0b309379
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 11:47:28.7995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9U1uCZaRiNqsnlVEPLBhD7y7ymtQRDLMkt1ohZWGDLRlNRDk8e46S5DfSVRUxu9/NPGb6X+7zXCUOLrOebqLaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3468

Oldish SUSE compilers generate .comment.SUSE.OPTS sections. Just like we
already discard such for xen.efi, fold them into .comment for xen-syms.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Just like for .comment itself I also wouldn't mind discarding these also
for the non-EFI case.

--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -454,7 +454,7 @@ SECTIONS
   .stab.exclstr 0 : { *(.stab.exclstr) }
   .stab.index 0 : { *(.stab.index) }
   .stab.indexstr 0 : { *(.stab.indexstr) }
-  .comment 0 : { *(.comment) }
+  .comment 0 : { *(.comment) *(.comment.*) }
   /*
    * LLVM ld also wants .symtab, .strtab, and .shstrtab placed. These look to
    * be benign to GNU ld, so we can have them here unconditionally.


