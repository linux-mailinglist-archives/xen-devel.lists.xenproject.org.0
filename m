Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 740D175A776
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 09:12:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566383.885133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMNok-0000Bg-8O; Thu, 20 Jul 2023 07:11:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566383.885133; Thu, 20 Jul 2023 07:11:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMNok-000099-5e; Thu, 20 Jul 2023 07:11:18 +0000
Received: by outflank-mailman (input) for mailman id 566383;
 Thu, 20 Jul 2023 07:11:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Xo+=DG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qMNoj-000093-7c
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 07:11:17 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d18103a-26cc-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 09:11:14 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7692.eurprd04.prod.outlook.com (2603:10a6:10:1f6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Thu, 20 Jul
 2023 07:11:12 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 07:11:12 +0000
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
X-Inumbo-ID: 9d18103a-26cc-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gbcoTjpxPWGkE39TTubxurx/Fj2TrLMRpM2OUrG61Kvp/g+6haHxb4iWNnescCLok5Vw3pIA+wG8vBOt/6BU8NZvNYlyTza+MshFzVB07IGzAKZ5E7AHmkYuXGSBp0f0o8dbCJPGPRvwxRntazl56VuvaJrCNZlY4pEUSZRVDES9RLPoPXVptctJhyKffv4Gs81fZ7B4V4h/nvO8LoHIBPOemXd42IARJwLra9GRegWKNrbCeY6Evk6DS63Lq6DHnrni6uJe3xHFWT3+e6Bm7LPoJSggf/Cfi9Rs6rVyo1I3NBI617uFdAvheA318Vk1LvyZMrnIO/xvHpKMq9gtbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OjeOukCp0k3daKKrD7pGpG70FVirYbBKiZlD/ku4tRI=;
 b=jqQL7ZyiHpnOOv22MK6WIrvMbcsfJF5DLi45+T+ZFNqmqTldQcYMcSum2yiPKTca2V9ZZTl/YkFZ1qnameC+mNsnghg7aCS26IND7H8u+mZjhNxyyO+gBhrRkZxPy+qNB3Wn26tLc2MQIERTU8J4xCdZor6MvWinIoPNpomNiWq7XN8LdKkXgj45VugwiW4IBSIyi/XkEOX8ML4BN2wmt46u4qfZqLMjfaUQPskN2JxBoaHsKFunHzW9FJWNIZfw8vlg5HuKXSsTBNLlTOcJL+diUQxyjoRtcwT89hFnYFWCBNIGwjXKsIJ3v5vGD5lhrHyJU2dxjERTrYYlhjHFFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OjeOukCp0k3daKKrD7pGpG70FVirYbBKiZlD/ku4tRI=;
 b=2UTs1kHZSCKxTLbI1xrISoLhDSgcGcoa4onZvVcR4xzmVMBud/ehkk9DeZ1izSGfLT75XCT5pFgqXIiQtlTeJ5Kkw9UwjV8D4G2qL9ba846LDwMhsWBgonGMmput/bCfO0nHXvtfubXcW4okZbTbyRKFEOwZj/vzv13W/W1Xt9tW43HBvyEEUpsmKbpmpGm8nkLp+skKSwCyR52BFg8QMN+sf527f4/Ijfg9AUSUR75sXJ8yLWRk9rg+hOZnLbfDJZkluxa8/AHvbAq++7ghIpbWC3Ze3Sz25QYO6cXdautbnqTqbL7d0q6em3DcO0hT6v2uwkj8GSVEJ4jHPTah+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e983103a-be32-7a77-4d7e-6d5559443f56@suse.com>
Date: Thu, 20 Jul 2023 09:11:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Federico Serafini <federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/vRTC: move and tidy convert_hour() and {to,from}_bcd()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7692:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fac908e-80bf-4c2f-fec5-08db88f0802a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KdUb1b+JOoAky0NEZIGFiCd006ttjyERf1LzQCE7hhXAYr38vVKyYqhwlbIHNNcK/08QjrUQ47m+aQZxaAD3O1XlL+bkWh3NM9aQA4o//Adr2gcjALlBzd1CuW6TtFUPKNcDea+ipfmX/FDQ6BgpM7A1UGmgfYWs4cp5FowDnyf9K4BjTu+/5JYrwO9SCOQhMyromm+AUoNk6LJI4YpEmGVDuurZlYEyzMM7cKvMt8v1ZuDdyuN4yP6P+YL/jB9vXrI0Fd7652rLheYdmMXAQn63oqjnIWRKwa2bio5pB3ACCaZEPOrMOZ4ib4Q4MxCwCq6L6Fu0IHCmKxM8fY9o20Pi2HS1CZA3jTX86OEFSE3L4j3FvQ7NS2rnOySt8ZwD8FSzJzZf2neNen5nmqS3mdQDH9g6vNJhW8M8zXDK8BPpwlOsSkfgpHpxMeCQlIwq+vvbsWcoIZTESdfQPgR8MqrPJWjqX9xHfyFlNdgHWnmh9lAZm4B3rjR0zqSbzR5HeQ4GyYel1uqFqZC/b6tBMwcNn7lXq2Qi+O4YOo97hlfdcZ/9us/wlttK1cS0oCb2IGpexfvFqRClvainlw0m/ebs9orsuSSeEuNOu9no/jLJlOJgKV+2PKOivdPSZSWvSkxXBUe1YUR9pdZta1usyw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(396003)(346002)(136003)(366004)(451199021)(2906002)(83380400001)(2616005)(36756003)(31696002)(86362001)(38100700002)(6916009)(66476007)(66556008)(66946007)(316002)(26005)(41300700001)(186003)(6506007)(4326008)(31686004)(478600001)(6512007)(6486002)(54906003)(8936002)(8676002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REtxbmZCc0FzRW03Zm5teEphVXRjbUxBMHAzcUc2N1RrNmRPM2lMbWJRc0ZU?=
 =?utf-8?B?Tm9UdmJ5bnhhN3AvUU8waER4UTc3RnJFdGZacVY1Q21wbXZ5YjJqb0I1bG1w?=
 =?utf-8?B?Qnp3RTN1ckZpOXhPTzZGSC96YmUrZDFwL01nYjVYMHc4QmtKWWt3Q1ZuQXZE?=
 =?utf-8?B?c0hnb0U2Tms0dE9jTVVUVzVsUHRrcjk2SGMwVGRrQkcrVXQ2NGg2MExnOCtn?=
 =?utf-8?B?cmxDRUt6S3JYcVB6YUoyMjU4NmtHS04rbnVXR25qVzVlNFh5c25YSUlIeDRn?=
 =?utf-8?B?VVBucEE2b3lkZC9wSTJlbFprTWlScWEyc2E4QnFQalJUQzFuMDZQdE55ci96?=
 =?utf-8?B?U1E0UkZyTDNTWWpWQzlHRjVkQWVISXdROTc4VWdWVGtuTVJzTVZiMVU5bEdR?=
 =?utf-8?B?UnQ5TXljU0pjTkZLdWxyQk5FdFBEQU95c1A3OHBSOFNNV3Jkc3RMQTdxSjJm?=
 =?utf-8?B?VHQzdnpWYjZ1eVlyelBzL3YrNWRkWlQxWWVaWXNLT3plSGFPMjNMTU05WEM1?=
 =?utf-8?B?L0hBM0t5aU1XZHErUk1XS2hubTVKVHF0YUFOWU0xLzJGWnYydE50aTh1N1I0?=
 =?utf-8?B?Q2J2NVhuKzI0c3hSK1BMUmJYeU5yODJhdjZ4UldyeWlPWnJHWDBTWDB4MlhC?=
 =?utf-8?B?TmlMSTdITGE3RHo5MEUvN1J2VTJ3a0szc0tuYzFEZHZPcE9JY294SzJ5d3FO?=
 =?utf-8?B?dUlBQ2NoeDJyMWRyeXF4U2VNcnkwMTBwTXpTUXNYS2lVVUp1dGJ0eUxVSEZN?=
 =?utf-8?B?czFvZjJVMjBsN3RHaE1SeE5TUjZWTEZaT3hWMmRpSzcyaTNrUjdRNUhoWHNj?=
 =?utf-8?B?dnBBZXoyWFdDM3FqcXVISXJMbEs0QjNWMk5JWW9QTHhpTUJPOGZqNlNYOWRU?=
 =?utf-8?B?RTdQM09rVnc3Tk1pR0pxRWRNYy9MK1ppWVk1MEd5WjZhMGdhR0lIRGpjZS9P?=
 =?utf-8?B?L0JCOHlkUEgxb0VjZkUyeEtlQU5sTDlMSE50VDFCV1FZV1BCSDVIKy92cVdI?=
 =?utf-8?B?Y0o3OVRzU1g1YUZGTU9xTzNFZldvMGtxWjM1ZkhpSFJuSHoxQUNnc1Z4ZVNm?=
 =?utf-8?B?Y3NGKzNYa2orVGZnOHFNL1I2L2gwMFhLUDkvVGI2OXdDME5aV2RTR3M4ZGZm?=
 =?utf-8?B?R0JQbysvLy9wYzI5WGN5dm4yeWRTckUzRnZ1YTlOOVpxVm9qcUgzTVBWUXRP?=
 =?utf-8?B?b2x2ZG1Yc2xtcDhPL0pBQnNycTYrY3JHMGFFM3NUVG9XdTRwVDZLblo1aDdD?=
 =?utf-8?B?bzBKMmN3Ym5lem95eFQyQU05QmtaelBjcEt1M1k5c2lKeFVHRWZmcmZCMUFU?=
 =?utf-8?B?NHlINzNIam5sdzFFamJDSEVzcHUrKzRTRWt0cm5URmw3bGhTTXdZcjRDRExw?=
 =?utf-8?B?cXpBRjU1eHpuMFZjTWQvK3BQdHBqWkwyYWdyY2lRR05pako1YWRuRlNNYTAx?=
 =?utf-8?B?cmozU0dIQVQ2bVpnWUFUcHJTMHZEVUVmQVhnRzF3VFp0YWxMcUk0NXZ5T0o2?=
 =?utf-8?B?M3liaFFNR05CSCsydk1UWjRWK2FHSk5PQXZjcFhoMWZqdHU2ZkRFdGNONXRo?=
 =?utf-8?B?VGswVkdMTmNUMWdsbWJtdzBydjFBUzJPZC9HSjlzbjJyd0t5QXpDd3JnNTRi?=
 =?utf-8?B?Tm0zMnNYaVd0Snh3QWNTZy9uY1VzdVR1SS9ZZEkyWCtkV2xNd1lla1FVQkpu?=
 =?utf-8?B?YUdnTCt1NkNPdmdUTnd4d0w2REZ2eGw2b3dENTNRbklNUzFlM1dpSmRXUlRI?=
 =?utf-8?B?T3R3bVVZLzB6RDhuWjVtVjdIc2JZU1c1RFJGY3lWWThLb1YvWDEvanI1VW9B?=
 =?utf-8?B?TnlxZWdHcUtBWERrVFNUeS90bm92U29pUTVqQmdjM0VCTUJIcmRjTEh3bVh4?=
 =?utf-8?B?K1RXTStqKzlkQWJVaTZIZm5YNzBEZkRqY09jdEtvTDNpcXpVVmExeFcvTkpj?=
 =?utf-8?B?cjd6N3R6VHQ3QkJkVGZVYWdBTUtzcnBPM1FYeEc4T1AzMmFhdVJjLzBXek1K?=
 =?utf-8?B?TDlxR0RRRFQyajQ0QmdySWZNcTVLQy9LUFN4ZmFtUHR3dWtvTklscDl0cVpH?=
 =?utf-8?B?UTFZS2ZtUzB3ak5iQmRKUlJQNmQ0b3NVWFBuTkZQNndqcWZ0cW1NQ3VCTUg3?=
 =?utf-8?Q?exh6gHv3RJgNJRcdvGZDo65lE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fac908e-80bf-4c2f-fec5-08db88f0802a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 07:11:12.8273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k9/2XjQnVuCs/rdbTvDWFlFycvudo+jitgyzLkU+8FF/bVHHj8Fa8OcCvSAqWIq6olAjCGA1Ib+/+oeFqNdcxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7692

This is to avoid the need for forward declarations, which in turn
addresses a violation of MISRA C:2012 Rule 8.3 ("All declarations of an
object or function shall use the same names and type qualifiers").

While doing so,
- drop inline (leaving the decision to the compiler),
- add const,
- add unsigned,
- correct style.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/rtc.c
+++ b/xen/arch/x86/hvm/rtc.c
@@ -58,8 +58,6 @@ enum rtc_mode {
 
 static void rtc_copy_date(RTCState *s);
 static void rtc_set_time(RTCState *s);
-static inline int from_bcd(RTCState *s, int a);
-static inline int convert_hour(RTCState *s, int hour);
 
 static void rtc_update_irq(RTCState *s)
 {
@@ -246,6 +244,40 @@ static void cf_check rtc_update_timer2(v
     spin_unlock(&s->lock);
 }
 
+static unsigned int to_bcd(const RTCState *s, unsigned int a)
+{
+    if ( s->hw.cmos_data[RTC_REG_B] & RTC_DM_BINARY )
+        return a;
+
+    return ((a / 10) << 4) | (a % 10);
+}
+
+static unsigned int from_bcd(const RTCState *s, unsigned int a)
+{
+    if ( s->hw.cmos_data[RTC_REG_B] & RTC_DM_BINARY )
+        return a;
+
+    return ((a >> 4) * 10) + (a & 0x0f);
+}
+
+/*
+ * Hours in 12 hour mode are in 1-12 range, not 0-11. So we need convert it
+ * before use.
+ */
+static unsigned int convert_hour(const RTCState *s, unsigned int raw)
+{
+    unsigned int hour = from_bcd(s, raw & 0x7f);
+
+    if ( !(s->hw.cmos_data[RTC_REG_B] & RTC_24H) )
+    {
+        hour %= 12;
+        if ( raw & 0x80 )
+            hour += 12;
+    }
+
+    return hour;
+}
+
 /* handle alarm timer */
 static void alarm_timer_update(RTCState *s)
 {
@@ -541,37 +573,6 @@ static int rtc_ioport_write(void *opaque
     return 1;
 }
 
-static inline int to_bcd(RTCState *s, int a)
-{
-    if ( s->hw.cmos_data[RTC_REG_B] & RTC_DM_BINARY )
-        return a;
-    else
-        return ((a / 10) << 4) | (a % 10);
-}
-
-static inline int from_bcd(RTCState *s, int a)
-{
-    if ( s->hw.cmos_data[RTC_REG_B] & RTC_DM_BINARY )
-        return a;
-    else
-        return ((a >> 4) * 10) + (a & 0x0f);
-}
-
-/* Hours in 12 hour mode are in 1-12 range, not 0-11.
- * So we need convert it before using it*/
-static inline int convert_hour(RTCState *s, int raw)
-{
-    int hour = from_bcd(s, raw & 0x7f);
-
-    if (!(s->hw.cmos_data[RTC_REG_B] & RTC_24H))
-    {
-        hour %= 12;
-        if (raw & 0x80)
-            hour += 12;
-    }
-    return hour;
-}
-
 static void rtc_set_time(RTCState *s)
 {
     struct tm *tm = &s->current_tm;

