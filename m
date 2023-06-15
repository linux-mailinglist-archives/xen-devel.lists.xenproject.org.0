Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32457731BE9
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 16:56:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549668.858331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9oOl-0005oH-6Z; Thu, 15 Jun 2023 14:56:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549668.858331; Thu, 15 Jun 2023 14:56:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9oOl-0005lN-3j; Thu, 15 Jun 2023 14:56:31 +0000
Received: by outflank-mailman (input) for mailman id 549668;
 Thu, 15 Jun 2023 14:56:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tInE=CD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q9oOj-0005W0-8g
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 14:56:29 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2070.outbound.protection.outlook.com [40.107.7.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce0c15c5-0b8c-11ee-8611-37d641c3527e;
 Thu, 15 Jun 2023 16:56:27 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9665.eurprd04.prod.outlook.com (2603:10a6:102:240::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Thu, 15 Jun
 2023 14:56:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Thu, 15 Jun 2023
 14:56:24 +0000
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
X-Inumbo-ID: ce0c15c5-0b8c-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUcQj1qOv7HNY3eMDYdW05BLEG/ESx3BkhHfS4jNWZ7LUEnlLj/VTAWB8s8K64bjqhGyUr7qAGq7/hOZRhNsWeUQoJWeYc8VJesKYlxjpVbYxOZ83BKIv3ohuAmPAsyQ68YSHuA/nL94gdjBgwZh2DnOsk1ZrbXguObdJ7xvW3nbIlS0AfA7q1fu+YaKXY/PqWtdPpWvM3cDDja+2c8u0V2FKFfkD7QJYNa+1+WDJ2njFK6BORYC7gwLet0tyg1v033mt0C7h6N98qkTTW/Blhu5+r9ZLaXb4FS1VwfHu/pJvbecqSVO7v/nuTu6xYIn6EdOhhYu2+NdFzcKv1s1oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qmhhqca6YSZa1ppylCiI9prpDFctF1Vhnvq7mhVxCUw=;
 b=b92FX2AgB5hpeOnmU1CDspK0Yo/Mk0jLIcUOqLahk3zHfV9od7xq6jpGYoqNzyrgNQKhD+aZVRWmtLpTIYJDYzmefEMlPz+t8NYCVt6/mr3LY1YUKKaAjycIlwZjsTXyiV1keOye0A+CTEUjFsNdWgxzIWVv74TVFq/zIxpLgoLtnbYC+Us97Y9iVO4Wq95aR5fn6YWoI+qegamPzbZA01lmyGt3AYGRMeCzuv5hCBHCpcRNkAYY6LGKb/veZYPIm0+9/XAPOvhgbki3L6WdAuNY2bprfi73Gb50VS1v+ZZzsjgtaAOKdIX6vqaSbQ6Yf9fiax0Gwt6TGtaPmMasMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qmhhqca6YSZa1ppylCiI9prpDFctF1Vhnvq7mhVxCUw=;
 b=psUQHWrfzYwdZ6a6SvOiGbFOc2f5XAF54bsarsSg10vG2uWtuO4xg7ymK7l/7yA/04STBn2cvI1xFLFRbTKta0FJ8nIiWbegcg5CYPJ5ASlR4Mp2TRdPjBcyj5dgP6do93kmrHYMGXVMUXeoqjxQcBkkQk2ilmugvuZiAJfBOwH6u8sXaChAI8lRrxpwYnVl0HQylm3OVdfzZkHFf8u94P4DXwbbsD8mqVOCSs3ILjWOivjgU/q3zeFvZCUD3HfyEf6woMKm7lVu5ZG4zSblGEh8g2LUPedFm3bzyQ0g+SLW/379JjjLN+/6mFV6SlLAjeWfYvcHIP54fXx7dt8jLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7b69e322-bc37-a1bd-444d-b2cbe1d76b39@suse.com>
Date: Thu, 15 Jun 2023 16:56:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: [PATCH v2 2/2] x86/vPIT: account for "counter stopped" time
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <eaac83a2-8254-76b4-9bab-411e1e323851@suse.com>
In-Reply-To: <eaac83a2-8254-76b4-9bab-411e1e323851@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9665:EE_
X-MS-Office365-Filtering-Correlation-Id: ffbab607-6f5b-4e6d-16f0-08db6db0b019
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U0hkV3Agd5s3ahA+d7w0qReNESaVtSORPlCDkGD1eKrXlou2t+z84enR+uJ9jnszvsAPqFyGpum77kqBjzjoV1+AXV5/cLlUnIP1L+beZtGwc3XnAjPP1HSZ7tr5mndcc7u39R38+DRleaCTqTSxBUN1tBKJhqSV06v9JEwJ8oFv6omy7D/NwklwhePKau/MPUWMEGZhWlW57j/GosJm83p2PMdz0awZ7yfBACNx0FpTmBLfcviv1/kUQlMIAhzXMQJ3se6VlfVMyH18NcQxEuf1Ey2u2mN1TskKd+ZgEnkQPWamlfKRuL9q/GqMzorBbocMOgjYZeLdvA20rJBVCN2c01Rq+us3uSfZEIhZDvL79WvMY/KkKnMbIE/rCZ8jC9mnddU38VKXUNaIoSc5Qz9JTNfUGsPzMau7riP7yAEddprEdonAi8fXGxfn3kMbqhPJStmn2ANkrtJ3FbwzqHAypb3pO8yE3QYWV02pazr/UnuzG7kNYqdRSrg2mW6abs+FfJn39lNAQvdltUIh2wzMVsfiqFiMlcQQcVWu45fPqepmVznBquMqxwjzviKilpFwbepQ8lQTTxhiKYmLNyhL35gQWS2mrxdnj4nfaOyq8qD+K3uDTDiDDapZRngdCpiLfL+Z5WiIVHzvXeK51S+qnbDSHdK2Q0h5fjjPTj4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(346002)(366004)(396003)(39860400002)(451199021)(5660300002)(966005)(38100700002)(2616005)(83380400001)(6506007)(186003)(2906002)(15650500001)(26005)(6512007)(478600001)(66556008)(6916009)(66946007)(66476007)(316002)(8936002)(6486002)(8676002)(41300700001)(86362001)(31696002)(36756003)(4326008)(31686004)(54906003)(66899021)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjNZbEdJbVNFWTEvaXBhTEZoR256QTRNNW9nSnVrVkNmak52bVRYZUYySmtF?=
 =?utf-8?B?NVVubk9BUnBTNy9mUEEvZ2NBYVY0dTljeUE2Y2pOTVU3dFkrUktMenZvaS9G?=
 =?utf-8?B?cHRQM3Bib0lib2ZJckVqZEVJckxkSmRra0NvZkUySnhNcVB5VEtWZUJPQ1p1?=
 =?utf-8?B?YjdFOGpCTU4xMjhSUVZtTWFvaC92WHY3LzdhOS9yYU03bjNNRGNIYUdSazFs?=
 =?utf-8?B?eWlhWHNuc1dxT3JHNlBlaEdsbVhmaVRnWjB2VGFyZmVPTmgydkJGSUtkY1FN?=
 =?utf-8?B?MnZIbTR4YStXQ2NsTXhGTTBPU29JckxQR2lMZ3ErU0NROWE1aGJCaUdIeElW?=
 =?utf-8?B?dktvaFRyb3VzSWUwUHIvaS83cU9YR0Njd2JPbEpyQkkxd0FORGFUZkw0Unp5?=
 =?utf-8?B?c2dMRG94L04rSmhmNzZySkUvYXZLd1ZHWTlNM083eWRTTnNKSTByekdHUGgy?=
 =?utf-8?B?UXErMGMvQWZUOWhJRWRRcHVuVHpGcEMvc2ZvdmpvazJHRjd2TUFIaXdKdXZm?=
 =?utf-8?B?TFBKeG91cER6RmV2STdzV3BwRXpMR2cxYVM1NjFjMitJR01zSURFSW9ac0lx?=
 =?utf-8?B?YkFNVys1R3g5dzBZclJsajkvMlBUYVVqNXdKaCtQcG13ZkladDdEc1ZVMWFi?=
 =?utf-8?B?UVFjUHZCYTFMNjZGS2hieG82bGVua1pYeWFZSGpEanprUzFDN2RPUHRpVWxx?=
 =?utf-8?B?S1pzZmhXUFkvSDdRWFZNSGZiaU43L0xrY0kwcFNpL1lHV2pXMGprajNPQ2Z3?=
 =?utf-8?B?bkdwUSs5L3hZV0JxNzhpbGVlYnY4R0JacWFhYTc2dmdXcDdKYjUyMzVGc091?=
 =?utf-8?B?QkV0ZStqT2d5NTcyZzMrNXVwWUM3NlBmYjlJVWgxZ0N0ZXU5dEZiWWg4WUND?=
 =?utf-8?B?Q2ZoakN4SzZzM3lQL1RhaURzQkpVVFROV2tTZFlhYjAwT3RPSFB0TVJYVk5W?=
 =?utf-8?B?ZTR0Nm9zRzMyTW4yT0RQRzVueVhabUhaQTZub0JaL05WQURqejhtczVzckdt?=
 =?utf-8?B?SjFBOEdmNHkvREFLR1ZzN3FrQkhjV0xPWWJkbmUrQm9Uc08wZm1NWmNkaHZG?=
 =?utf-8?B?dlNJaG9PRW90bHQ4Y2J1czFYTlBTdDJjdEZYUkVFclh0eU9TK29qRUI5dktN?=
 =?utf-8?B?L0w3ZEtFcjJLWjVQSkRTNko1djJGd1dQUmVnRjFKdDJBRU9OazlGQ1lMclpj?=
 =?utf-8?B?ZVBFQmZ4OUQzTUNadU42eHh1d1dNditUZVpiN1puRlRFOVRzZ2hla05SblRT?=
 =?utf-8?B?VWVKV2dGVWRlWW5GNE1CNWpkOE1pdlNWT3VDZ3c1UitpSVZMU2plSGNrNGlF?=
 =?utf-8?B?VTNndTVTa1psbTRqRmJhakJJaEcwZ294NUR0WVZzOGJ2MGxGZ09ZeVFhOFUr?=
 =?utf-8?B?b250Nmd5NytTL0NML1pxZjJORVcwRnJPZjZESC9oQzV3bjRwb2pWTjZGVmNy?=
 =?utf-8?B?K3hNUkEvU1RLbnpjRWJMc2hOWkxwNEtvUE5QVXZQNERkUEE1M3Naempmd0xi?=
 =?utf-8?B?RnZkQzhoTEVJSTFIQUR1eFc4R1JHR0ZSQWJOczNRL3d3OGRGdWhZc0g4bkRa?=
 =?utf-8?B?Y2FuTEQ0TkhkS1htWk96N2k5VlZuNnViKzRxWlJhcWtNSWpZMUI2TmYwN1Zn?=
 =?utf-8?B?QkVud1hNTnI5Y3JVeUxFcUI3WkZydHpManQrU3paMmRsODJOVjJ6M09MZ3NX?=
 =?utf-8?B?Sms0Mlh1NEdrZHAycnlsOU5ncnZrZzdHYzEwQVBndFFBWkw0UElxUGx1SnRY?=
 =?utf-8?B?VktWNENKK3lDZnp1cUVTdWEzZjY2ZzBGZituTlZNVmN2cis3dnFBYTZ3ZXhh?=
 =?utf-8?B?Z3I5SnFqRU03RE1wNzkxdU53b0VtTzdFQkYyc2ZSeGNVYTJuSEhpMVZTZHVp?=
 =?utf-8?B?V0dEWE5TNjBwWDI2Y25MenR5eTgyTnhnQWpMYUZyZmZtU0tOWHpwVVFnemF0?=
 =?utf-8?B?cE9telNCZDRaaUVqMDk3bkJFa3QxZGxleUEzUHYvRUwyZ01PSENQU05MWjZv?=
 =?utf-8?B?cElPNGJaMS9rLzRTTFBLK0I2RzZMTG9ySStnRmVCeXEzb0RkN0FSRlk1UTBs?=
 =?utf-8?B?bVMzd0RjWG1nQmdadnNyODRpb09SSDkzUURyUXJxTzZnejNjNWNGdWQxTi83?=
 =?utf-8?Q?sLJSsa00WhEYzhvnl7qp7f0ft?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffbab607-6f5b-4e6d-16f0-08db6db0b019
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 14:56:24.0340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: msB07mKMwl8RtGOFAnfIL7+3yvjBgcvr4fh+qpyFAANkKkMtDmHYDhYZQliutUnncDPFIP7dYgE26Uw8oowv6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9665

For an approach like that used in "x86: detect PIT aliasing on ports
other than 0x4[0-3]" [1] to work, channel 2 may not (appear to) continue
counting when "gate" is low. Record the time when "gate" goes low, and
adjust pit_get_{count,out}() accordingly. Additionally for most of the
modes a rising edge of "gate" doesn't mean just "resume counting", but
"initiate counting", i.e. specifically the reloading of the counter with
its init value.

No special handling for state save/load: See the comment near the end of
pit_load().

[1] https://lists.xen.org/archives/html/xen-devel/2023-05/msg00898.html

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
TBD: "gate" can only ever be low for chan2 (with "x86/vPIT: check/bound
     values loaded from state save record" [2] in place), so in
     principle we could get away without a new pair of arrays, but just
     two individual fields. At the expense of more special casing in
     code.

TBD: Should we deal with other aspects of "gate low" in pit_get_out()
     here as well, right away? I was hoping to get away without ...
     (Note how the two functions also disagree in their placement of the
     "default" labels, even if that's largely benign when taking into
     account that modes 6 and 7 are transformed to 2 and 3 respectively
     by pit_load(). A difference would occur only before the guest first
     sets the mode, as pit_reset() sets it to 7.)

Other observations:
- Loading of new counts occurs too early in some of the modes (2/3: at
  end of current sequence or when gate goes high; 1/5: only when gate
  goes high).
- BCD counting doesn't appear to be properly supported either (at least
  that's mentioned in the public header).

[2] https://lists.xen.org/archives/html/xen-devel/2023-05/msg00887.html
---
v2: In pit_load_count() also set count_stop_time from count_load_time
    (in case the counter is stopped). Correct spelling in comments.
    Correct calculations in pit_get_{count,out}().

--- a/xen/arch/x86/emul-i8254.c
+++ b/xen/arch/x86/emul-i8254.c
@@ -65,7 +65,10 @@ static int pit_get_count(PITState *pit,
 
     ASSERT(spin_is_locked(&pit->lock));
 
-    d = muldiv64(get_guest_time(v) - pit->count_load_time[channel],
+    d = pit->hw.channels[channel].gate || (c->mode & 3) == 1
+        ? get_guest_time(v)
+        : pit->count_stop_time[channel];
+    d = muldiv64(d - pit->count_load_time[channel] - pit->stopped_time[channel],
                  PIT_FREQ, SYSTEM_TIME_HZ);
 
     switch ( c->mode )
@@ -110,6 +113,10 @@ static void pit_load_count(PITState *pit
         pit->count_load_time[channel] = 0;
     else
         pit->count_load_time[channel] = get_guest_time(v);
+
+    pit->count_stop_time[channel] = pit->count_load_time[channel];
+    pit->stopped_time[channel] = 0;
+
     s->count = val;
     period = DIV_ROUND(val * SYSTEM_TIME_HZ, PIT_FREQ);
 
@@ -148,7 +155,10 @@ static int pit_get_out(PITState *pit, in
 
     ASSERT(spin_is_locked(&pit->lock));
 
-    d = muldiv64(get_guest_time(v) - pit->count_load_time[channel], 
+    d = pit->hw.channels[channel].gate || (s->mode & 3) == 1
+        ? get_guest_time(v)
+        : pit->count_stop_time[channel];
+    d = muldiv64(d - pit->count_load_time[channel] - pit->stopped_time[channel],
                  PIT_FREQ, SYSTEM_TIME_HZ);
 
     switch ( s->mode )
@@ -182,22 +192,39 @@ static void pit_set_gate(PITState *pit,
 
     ASSERT(spin_is_locked(&pit->lock));
 
-    switch ( s->mode )
-    {
-    default:
-    case 0:
-    case 4:
-        /* XXX: just disable/enable counting */
-        break;
-    case 1:
-    case 5:
-    case 2:
-    case 3:
-        /* Restart counting on rising edge. */
-        if ( s->gate < val )
-            pit->count_load_time[channel] = get_guest_time(v);
-        break;
-    }
+    if ( s->gate > val )
+        switch ( s->mode )
+        {
+        case 0:
+        case 2:
+        case 3:
+        case 4:
+            /* Disable counting. */
+            if ( !channel )
+                destroy_periodic_time(&pit->pt0);
+            pit->count_stop_time[channel] = get_guest_time(v);
+            break;
+        }
+
+    if ( s->gate < val )
+        switch ( s->mode )
+        {
+        default:
+        case 0:
+        case 4:
+            /* Enable counting. */
+            pit->stopped_time[channel] += get_guest_time(v) -
+                                          pit->count_stop_time[channel];
+            break;
+
+        case 1:
+        case 5:
+        case 2:
+        case 3:
+            /* Initiate counting on rising edge. */
+            pit_load_count(pit, channel, pit->hw.channels[channel].count);
+            break;
+        }
 
     s->gate = val;
 }
--- a/xen/arch/x86/include/asm/hvm/vpt.h
+++ b/xen/arch/x86/include/asm/hvm/vpt.h
@@ -48,8 +48,14 @@ struct periodic_time {
 typedef struct PITState {
     /* Hardware state */
     struct hvm_hw_pit hw;
-    /* Last time the counters read zero, for calcuating counter reads */
+
+    /* Last time the counters read zero, for calculating counter reads */
     int64_t count_load_time[3];
+    /* Last time the counters were stopped, for calculating counter reads */
+    int64_t count_stop_time[3];
+    /* Accumulate "stopped" time, since the last counter write/reload. */
+    uint64_t stopped_time[3];
+
     /* Channel 0 IRQ handling. */
     struct periodic_time pt0;
     spinlock_t lock;


