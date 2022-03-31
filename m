Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E384ED74E
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 11:50:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296857.505463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZrRQ-0007nn-Bf; Thu, 31 Mar 2022 09:50:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296857.505463; Thu, 31 Mar 2022 09:50:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZrRQ-0007lx-7q; Thu, 31 Mar 2022 09:50:08 +0000
Received: by outflank-mailman (input) for mailman id 296857;
 Thu, 31 Mar 2022 09:50:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TTh1=UK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZrRP-0007le-1H
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 09:50:07 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f190cfb4-b0d7-11ec-8fbc-03012f2f19d4;
 Thu, 31 Mar 2022 11:50:06 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-Upvu56G9M9SPSt_Bp4NJDw-1; Thu, 31 Mar 2022 11:50:03 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AS4PR04MB9650.eurprd04.prod.outlook.com (2603:10a6:20b:4cd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Thu, 31 Mar
 2022 09:50:02 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.021; Thu, 31 Mar 2022
 09:50:02 +0000
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
X-Inumbo-ID: f190cfb4-b0d7-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648720205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=juBJGq4ZapzX50bKGD151YensGcEVFSl2L4HTOV0500=;
	b=RClEyANyI7gWsL37BhRxyCrBl/h0O70WZ2eUoPmlLGxa+w8vC+gbclGy0SmLUss3Q03yag
	dtvCvQTku32+ab2u1f1zpjH1RbvHTR9L9IVUQjoY/eWSiEM4XS7tSmcDAkzYbIOjdS1b/5
	XPxJRx/yyufOpQ7uYmg/4mH/bFO/KzQ=
X-MC-Unique: Upvu56G9M9SPSt_Bp4NJDw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xqd+qw58Q/VJExivereJhYcTpxmmB2iJa5o2xUKA46HvNbv9m69CxCqcWey9a2tqXjzGg8BsJxSqrXJRh4pwNo5ZJqeLwYI8f6ofATmcb8yqzIDXsxzq2m5101YfDW0/N8cutkYcrqhClzMjkAURgYNXeYswNx9lYwAwSGntG10hgXYJY4Usx/8HqmoVHZjUelL48xIWWFnX41UqaskwcNdZmOLc9CIdKwyoWOlobaUZ886KUd9XXmzTCGi+WCkpc8LAFVw3vyiQBcCxRteQYOx6HM4jIHTqOt/t09rxzA/HgKrXIk3k4R7fXuyQH6nQNjrPZGcujQ4CHPe9JnUN6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=juBJGq4ZapzX50bKGD151YensGcEVFSl2L4HTOV0500=;
 b=eF7JoghCr9UiYn0FMVy7CXJFqXKq41aj/uW3Z0ev74gutwzg2krTD0V3VI/w9eJKNVC3ogqWbzaH5XIWFU9K3MWGwMT3trjigHiUqFcDQ+GteM2Z5OnUHuuQ1jVSkvdKOvMb+Alj9oFbgu3FpVMhLXrDKWQ8mAo+aMhx88DHCg+xK1i5BhPZIIibHir/V2athC6KqBacTgaVryUE7fiPW7EjZiiiZrEYixOezChx1w9nR8s43Om48SQ37Rd62IW8hKmyOqNmlrmUYpleB5/rcC7CcXM+hKtKOJMJ3P6jsEI6yZMwQxLz+jGOUyaU6ZBUu3+6S2ls7HiQWKFXIgbLcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8b66f631-18be-7819-7982-c56c03220595@suse.com>
Date: Thu, 31 Mar 2022 11:50:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: [PATCH v4 6/8] x86/boot: fold/replace moves in video handling code
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
In-Reply-To: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0002.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::7) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: efc601af-a35c-4b40-466a-08da12fbd363
X-MS-TrafficTypeDiagnostic: AS4PR04MB9650:EE_
X-Microsoft-Antispam-PRVS:
	<AS4PR04MB965037A70F4036A949DDC9A6B3E19@AS4PR04MB9650.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x+DERFW5Zqkod6Cj5ofwWLSEL1c8gTPULkgcgEQJ2WJaLgjI0s5/WeW4Ng6OXKFKLs8biV5eo/uNoELq1KapeZyDsvDckMpnxv8iuB6Dti6Qv9C2BqG6Z5pvWoVXmHkzPV35NUrCddFnh/5F+mRLyOX4Jo7E19o8VnC49T4Bmko7qFmeeV9bej5DV6mjMCMKeeBT0RolV5a32B0ksf39+kKvDbry8qPLT0+t0Sl0AoT+invfgfrXv8rLeUPijYoB6ixoW4XQRzLkmefAJoKf5obw5hmLbMOezkO8Ib+yuvL/px0Y7IWQD6imbS/d6reVYs2d+PhVmxdBHZDPGzKk72xWh+xI819RVwsrh55bC2Jhr3mFNBqxIpntdyCTc9GIKsCm35SXgCnlPuRWXBhBqocE+hf4Wn2WNxF4j+axrbZQh1KaX8GngJJcNKr+iP8S2KMWSjCpub8O7AIwqf4suS0TLlTL1kLkul/wFnWEiJ5NHXOxPK+BC+rv5kTMaWubhfzt/3Ayiko1ikfsKXl8/Gc13v3DLGEFg3UNz/53LoPs18THiLXHaWHfSyNOQaZ3PVM6XlTGNLqz2hCVWVh6hG+4DN101IqmCd9PNgE/HMmfGiH7cNPCpfXs5EhriZw9URnABD+hC9zzgymuAPY0go6KOQBdiBzaZsyzaW7pEFFw/kNRrA21/z8ESrC/bU9bCLQikY5+tZhEakdq0/FuGuUskm6X1btKIJtKsiemmFWWqqbYPF3ttRRDPvoHqP0e
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(508600001)(66476007)(6916009)(26005)(36756003)(2616005)(66946007)(186003)(54906003)(316002)(8676002)(31696002)(86362001)(66556008)(8936002)(6486002)(4326008)(2906002)(6512007)(6506007)(31686004)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGJJWTVaaDZnSEYzTU0yMy9LZkQzd0ZPbG1QNzZsWWRkRkdsNG5XSkhiYlNh?=
 =?utf-8?B?YllKZlBkSEU2R0dnUUdqQkUwSFlIeEZ3Qlh4U2RXNUpvMDQvSndiZFdCV29E?=
 =?utf-8?B?Y2l0S2ZZbFVFRHZmS2drNUJEVUhXQ2pJVks3TzJCUTlJTFJqVWRnTnRRSVdl?=
 =?utf-8?B?Z0kxYjJNSmxCNXVLRTJodFBaNHhmSHdieDhzRFRESERiRlkrY0tHSmErOVlr?=
 =?utf-8?B?WERESmRDQ3c5UkxTV0tEdEN6cDNIR3kzZzdpVklsbG5KVFc0bnE0TXdRNmEv?=
 =?utf-8?B?RVQxMFBVbHdJb3NMWXk4RFl4OStBQjZqbDYwdGcraXRMZVZZMnJkNlA1V0NP?=
 =?utf-8?B?TWN1TTF4RDFoRTdJMnFrQmhpaXFlM0JTSHN0SVU3QUpCV1V3dkVBYTRVTHlx?=
 =?utf-8?B?N2JSSjZaUVpIaTFYUDFYYjYyL1ZFR2FLbllQalRoQXNlYWxieXA4bHBWSllY?=
 =?utf-8?B?YlFJV3B0L2VvZDZBemlGQ2N3Umt3b09EVFl4SjYyL21Ga2txaUlLbXo0NTQ3?=
 =?utf-8?B?QzVTVGJOVVhxOHZsSFh4aXAzbjZTMnZvOTNCMldyNFNxWnV3U1Bna1hneHMy?=
 =?utf-8?B?OXJWQk45TWdvaWpHSm8wSitsLzV3ekhOTktLWSszaS83THFIVHlyUHl2dEpK?=
 =?utf-8?B?ZFBPUlA3ejVQamxFUzlJMU1KNEpLZzQ3alhwMkVNeDJORWNmekZIUlpGb29l?=
 =?utf-8?B?ajJPU21ZbndYbUtSanNQajRQdjJEUHNMZ250MW9MSCsvZXVmNlRSQ2cwNEVx?=
 =?utf-8?B?Nkd4MXF2ZmdYb2JsQlpxTFRwdmFCTElyQ2RsNW5DQ2FWZWFTSzNQSnliMDMv?=
 =?utf-8?B?K0l4OU9EbkU3Szg1MmdYWjJaWTB5RW9KMzdLZzBRVFY5UUxOdERMM0hFWUtl?=
 =?utf-8?B?Zmx5eUJmU21NOWhjU3BmakgyT2VNdTB2MzI1elAzZG03cHBYbXRBb1NCM2Mw?=
 =?utf-8?B?aTkrWGZxN0pvT3lNVGtveGtKTnp6NnFmRmN3b0Qxb0NxUXd2V0IrRjhNcFg0?=
 =?utf-8?B?bk9FOFlJbWFlN21GdmpZNjNJdGNYV0dHYmsrRm5STk4yNy9EOWxRU0wxbHBa?=
 =?utf-8?B?NEZSUElqQ1dUYWNZRlR3dzIvVEtxRzVwOXJZTGlyL1hITnFlZGs1dFZLWHZQ?=
 =?utf-8?B?Y1VxUTJHb2pyNmo5YS95cVorOEIwdUNvd1pySG1JbEllYUtibGFzcUVVQlF4?=
 =?utf-8?B?NjNXcm50c3FxeDlrUm9sazI1Nml1R2tTTnh4c1dhZWk5eUE2SWJrQmhMbVhM?=
 =?utf-8?B?dEhuQ3hKN21BMGsyMWV4TFdvbWdqUkhjdm4rMnhwbEEwVG4xOVNTRGFxNlQ3?=
 =?utf-8?B?Y2RUSjVMbGxIcStUVDBJS3B6S1lSSlgvK2hVTjhXMUlJM0ZUQm1QS0xrcWc3?=
 =?utf-8?B?ZW1oalVLNnpNa3dFZzd5a21QZENVZzlHcDNhUWgzZ3lNK1lPam80dGh6byti?=
 =?utf-8?B?S2xMRTNHVUE4NFFyQ3VNQnlpekhiYWx2OGlMZU5MUVVGMFBSL2xxY2x5SzRZ?=
 =?utf-8?B?ZVFhNzFrRVJ2VSt1a0hhalV4U0FLZHo0R3FoM3d4ckVxc2dCM1Y5NXg2a0ZL?=
 =?utf-8?B?dDVKQ3pBc08wZzZHdHZCM1pLWTZLMVJicmJBcllwZzBqYlNtVE5pQzcvRUd3?=
 =?utf-8?B?SytPT0F6TzQvTHgycVhhTmpCd3dKdGJGUTlrVjBWc0dvRlNvV3d0VXFpanFW?=
 =?utf-8?B?YmQzZVIxU0xkcXBHZWcwUzc5UmRJb0hyNHR5eFZ5a2lGb1d2VnVyS3VnZWJY?=
 =?utf-8?B?RThKMHBPalJMeGsvMm1MZkMxUGFiakJBUDROMHJBS1l6Umh5bEdIY0k5bnBs?=
 =?utf-8?B?NTFHY2lQYUUyZUhKakw4L0RtcWFCNUJwbVNtRlBwRGV0R003ZUl1THo2R3dL?=
 =?utf-8?B?azVzRlkzM0hxb0htNmJsZXFZMUZVV3N1L3NFV1dreVVUVWZwaHZxeE4rSW55?=
 =?utf-8?B?bWlhL3plSVZSRUVjU25SdDdScE00YitYWVExQ3NyQ1lFZHN4UEZrZDJHTGJu?=
 =?utf-8?B?OGRQLzBiZG51QTd5NWhEa3RaVGxrdGpKNVJjYjczVGtqdXlBMEZjeXQwUmJU?=
 =?utf-8?B?anFITm04aFdKbCtoREFaWENxTnVNN3JkalNQM1VjQ1hGdDI3RjhjMy9WUTAv?=
 =?utf-8?B?c3ZhL2s3Y1NnTXVSK0puK2NjVnFYVDhhS3Q5QitaY254cFhTM3doTlgzQ0tN?=
 =?utf-8?B?alZZM0dQcEhzZ3hHK09wVXZCaW41TXJhVkZ0SWViYXN4R2QzQ1N0YTk2eFBS?=
 =?utf-8?B?ZW9tRG5SWkN6bythOVVsWFB0Q2JFbWYwRzdxZU1oRW9IYXJnQXJFWG5kTVVM?=
 =?utf-8?B?aThBWHh6STQ1VTh3UVM4UC9uS1I3L1luSFRJQXp1RDNwVkordGgvQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efc601af-a35c-4b40-466a-08da12fbd363
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 09:50:02.1748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BKzQJXXLNLYMhdzrvC3bLnKcWKvUpeTDLHuAqcGV1MzaO4HPxIB3W1RsuzMHxWOYsQtJV/gMQa50nvqc/bn1QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9650

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
 


