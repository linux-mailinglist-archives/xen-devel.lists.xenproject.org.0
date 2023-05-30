Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E108716718
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 17:31:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541239.843782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q41JB-0003lZ-6F; Tue, 30 May 2023 15:30:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541239.843782; Tue, 30 May 2023 15:30:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q41JB-0003j3-36; Tue, 30 May 2023 15:30:49 +0000
Received: by outflank-mailman (input) for mailman id 541239;
 Tue, 30 May 2023 15:30:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q41J9-0003i8-Uv
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 15:30:47 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061f.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f251c4a2-fefe-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 17:30:46 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9507.eurprd04.prod.outlook.com (2603:10a6:20b:4ca::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 15:30:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 15:30:42 +0000
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
X-Inumbo-ID: f251c4a2-fefe-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EeUJXB7Hxu9nClLUT5qqeakN+ZVjjNK6Pr+Xqaaf8SAHsoQhgTGiP3xpB43YtBIC0+V33giY8Ru4RSSxiegVLMlOpkxnaPQXmM+lRV4eI8QrYRkNze720HPSjeWNb24XlrZzt47iX62KtBHvvzHkdz5w0RplS8rHxL1HuQvQOgUAgys/tEY3X0FUHhSRuoBGDtFZDdQkWJV6H6NzYNrPGLm5is7TnD56ttandTnb97Y85R5ldZ5Zixi6pWs7S5OCvA6eF1IcmakmFoNh8LMXdV6z5wL+F/r6gNCVFzMvX5RGPVSVP24lPGYpmiXCguFkTu3gSLzYX48oP7kXVaLY1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aunSS5Nrb6KWs1AKnO9tx17OTd48iXWiBzukoYas7WI=;
 b=m0P0jlLbNwk+sXDhcTFqPPOUZVokbTsXQfQZg7TKIy/77dH9QpfguAUqli4dgoECuafR99aPYY9PUG3mrrJ61HtI0ELkqPGFp95mU7nrI0QpfSQrOqIWAo/P66TtJcUd7xRCAtRs8Q4W/RBTPYTvSl89b/NdI3mMqPYi6GzcHsLiXRbYG1c83T1o90DyJhZ/WFQd92sa1T4YdaaVAF/6WwbPrmJEu5hc3GXjwCaKbWs+29ILtLVS/lxtnbYnNTTL24oC9bo0aeEUt1dpqPB/ftPOXpoQJKVUKbwxtJbOBZRiIZYjHDpmeWyRaMtaFpT4CIEUupdkkJxC084GM2VTNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aunSS5Nrb6KWs1AKnO9tx17OTd48iXWiBzukoYas7WI=;
 b=Z8fIuuWO9EIsUKyUqSnDEFdjE9Y83usJ+1NewKo3zTyT61Ed2+vgl2ysPljux1emMmI2M74iOgEAc22ceaWII7st7KxaDJn4o9njwoLyw9adgOBbv2ShfXKaFfC56NOAeaePq6YFbfoZ84iR0Zhs1wEWk83Lfm+mkUdxJO6vZaYlwclxdVuuRBN8s7C7XjjqwM6JFc46V0hbEhfWDNLgfb9i/8c62JVQ19b25oJxynFMR97IqFgB+9MK3wQxvsN9Q5i+hnUTQWSyvoRrI/2t1Y1L2l4MAv2hj78q7O5VS+PwcYSG38QdAbh4oWkC+M8sLrN5unMV+RHzy3NmBL9ApA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <355c5379-ea9e-582c-0131-816204eb3ace@suse.com>
Date: Tue, 30 May 2023 17:30:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: [PATCH 2/2] x86/vPIT: account for "counter stopped" time
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <fd113adc-6d66-5a4f-78ee-766c197ced93@suse.com>
In-Reply-To: <fd113adc-6d66-5a4f-78ee-766c197ced93@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9507:EE_
X-MS-Office365-Filtering-Correlation-Id: 723ce213-4386-4277-ebca-08db6122d42a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vXYFg0yQlOzJCKUvGJ3uK4K9bWi5Ey+9UOutKdyCqowqgwJS3WCLfDwNmf+7/jL7yKfDeHq9nJElpQGQuXyoqqUR/PASHwFUoZQE8v+201OTOoZyN4eZ4vVBQhEVuHDUj9VdEu2v/FY7BR6m0Kk7w4YY5GhokDCOB/BVcRszkVYnx19R8a8rzbnvAYyWtQVr3viuj8GlGK+HdiY4qDaiglGg0ZVGt9RDuMyuahyZdI72JageLRlyY/jqoN3CYkdA7xfghXUMpk2Cj6jYndUQXYtucHrPmtyhdLcg7Vd/IYQdkFyUYuXwL2bObA4Gxd0vB0B0gbJIpv8UdnOidUt6bNsJQku1AtBWoB7vIkcZCPW9Ig+Kz8CTKuehhCtBWs+wPHuaaH65RAKUPiK+z8po4k8/REhkJBUdIHrVaPcIZIp35gv4UHj8R4sZLaqD3uYwE4PctrTd5KDT/RU29KDng2ZGTFm3Pva75WVdd4HyjjtLYhySOgjNe6xCpLbRBnGfse0cKQl+2FFdRVQzb+bat/QKpO7wDHkI/Djn6UrJw6x/Pp7+HDZcu8pA9AUGIPEcQ2u7U52iUNRgPwrMiRnowMso6G+dCrcx6AhbZbDDLCq3dyfk76f8dG1awQFRZuyV/nupplM9Usv9to+ul7eGzCxmmd9uphnHBwfeas4LpaAqMtfAqztv8mscBPm+KsDFWPXVyzT+SJ3Ro5U6x66G4w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(136003)(376002)(366004)(346002)(451199021)(86362001)(31696002)(36756003)(4326008)(54906003)(6916009)(66946007)(66556008)(66476007)(966005)(316002)(478600001)(6486002)(5660300002)(8936002)(8676002)(41300700001)(2906002)(15650500001)(38100700002)(2616005)(6512007)(6506007)(26005)(186003)(83380400001)(66899021)(31686004)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFUySVVGN3NmTEZseTlPa0NtNUdiVWpuT2xrYUEyMWlOWlZ6Q0tVV0hFNTBQ?=
 =?utf-8?B?TGVoUzlmR1NoTTJJdng5Mm43L1R4VUljWFVQNDM5N082LzROdmV1NHVZa0dr?=
 =?utf-8?B?OGpkT0QwdGQrU1RaNWtTL1Q5TUwyaHozTmE3VDZTeXJLUkZRNlhSM0Nxb1hC?=
 =?utf-8?B?Q1UrMUttN213dFJHd1BLUU41SSszeVJLYkhGajBzcUdHTEczSC8vL1VNd0Ra?=
 =?utf-8?B?cERLank5VEhydVhBMUFrdUcvaS80YVVmKzZLWmxnTU0vS0hWRGlHRjBmZXZl?=
 =?utf-8?B?aEladDQ4di9STldjajh5ZG8vbEZ5Rm93NTBIdytBSlFNRmxPVnZMYy9BZ21Z?=
 =?utf-8?B?K2NFOENESi9OT3dFWFlZd1d6ZklCQy9NUGNVdFNvMG9iMmtESlJweFlmdzdT?=
 =?utf-8?B?TnJlMHpQS3V1bWhtaTRheUsrMDRoblJQM0J2dTFKeWpKczdEek51aStNbCtP?=
 =?utf-8?B?cThVcW9VNVYrOXZWT0p6VVpuYm0wbi9tZURGNXlwbUF5ZlVSckltQWpob3ZC?=
 =?utf-8?B?R09MNUhyN2JwSHJUVy9pMkF3SjNvSlFpdVJwVGVNM29tb3pZQUI2TTFCQmVV?=
 =?utf-8?B?SlE5ZjZpKzdrSTVncWd1YXpDNEdmNG1GdG1QSnI5aDBTWG5sbVN5U1Y3YVJq?=
 =?utf-8?B?RVlpSkxzQUZtMWhSbXlHWmw2a2xZajVUSE55UUMrd3NUUXhlNGFWTC9CMnlt?=
 =?utf-8?B?Ymt5cWhrVzBZNVQyaHM2eFJ5M3prOGkxOWZldTFlUUc0N2JicXdTWHEvT1FD?=
 =?utf-8?B?bjJhaXBOTE9lVDdBUVAwTUhIM0JnUUlDOXRLRDErUXFxY3ZrN2RaM1dlWDdZ?=
 =?utf-8?B?czlPWXdWbVBEL3o1NDJXRXMvNXdSb3FpbVoveGRMU2x3ZXZSNVJVU0dXWkU4?=
 =?utf-8?B?Rm9CVURYREVZMjdsUmdvV3ZKTHhKNEw3bG1obmtkOXdYTXBXSmQ2dVowazRP?=
 =?utf-8?B?b3NSSEtBMmRIYmdVY2s2SjdEMng4UmFFWW1td0UzeVp0bjZXa25RZWpuei92?=
 =?utf-8?B?b2R2aS95QStveVpGbjhYbU85dElMQUVGMlV5bldaanRzQ1VESWlIejdWWDZl?=
 =?utf-8?B?RVVUMG9DYlNsODJBK3ZOaXdUZW11ajdwL1QyZWtnNnNWRU5UTkVOWDFDWHZl?=
 =?utf-8?B?dTZ5R0I5YzByQTUyMUFOTmRDMFhPUnJRT1drbjY1M2VEei9pUVVWMFlpVnZ2?=
 =?utf-8?B?SE1ERFp0Vno4S1pUeENlZlZBL01COG9sSDJNdXlnbkVpTzRYaXd6N3dWdlc2?=
 =?utf-8?B?a2luR1BPdEs1U1BXK3R2RjlYaXlTVmMrQjlCdVphQmEwUEN0Vk0rUGt0Zldt?=
 =?utf-8?B?Z2Flb2FjWnc3SGVzZ3p1Ky9iME1MdGp6eTlleUdaU3piQjRoSUhMS084TGpw?=
 =?utf-8?B?aHBDNXZ5Q1h1SG5PTnFZNW1MRitObzVCTWQwOEFsYkU3NUhxUVZOZk9kZVVp?=
 =?utf-8?B?VlRhOUlSVksvYnlia3c0R1I3RFpMbThYbzBTS0tpeGM5alFKTy9VUm84Q25T?=
 =?utf-8?B?U1ZNaC83VFp4TWl6VVBNOEU1YlloYlMraUN1SnFxV2J5VWFybVZRcFVNVnNW?=
 =?utf-8?B?bXZWaEFSU3ZLb3RXVERhWE5IR0taT0RoY29JcldHaDNNOUpkL2J0Ukl0MmQy?=
 =?utf-8?B?MVdPbmVIQlAwQndUVGxlUHYzTzNTN01TOVhWMDlPT0NlZmE4ZUw1V3lXTlRU?=
 =?utf-8?B?VzFqYmVWdzNMRjV4Vm9XdEVkS1RMYW1TaHJleHpOam1TRnlGZk95YU90dVpu?=
 =?utf-8?B?aCtWMEdmbUpncGpBZlNZTm96ZHJLYTRLYk02YTJpdUJvcWpyS3NsNWVyditG?=
 =?utf-8?B?Nm51dWpxM2xkRElyYVRWNXVkRlF5bGRpN0ROWmd3WndlRlNKNDBvdi9NMk1q?=
 =?utf-8?B?WEhFbit4cTVpa3ZGNFFWazZKYkdlTXBJY3lML09vT0dKMVpIYUJqSjhHeHhw?=
 =?utf-8?B?ZlMxZXZiaTdrN2xkWnJRdW5zQ3I0V0hla0pld1psQjhQNTJNVnMvNzRBRnEz?=
 =?utf-8?B?OTUxc3pldGFEU1Z5YUFpUy9EcTlzYmxoUG9STFFpV3kzTGRucnRyNXRUY2hL?=
 =?utf-8?B?azhSR0Exc1I1V1ozK1hEYmRUSGpxQmpRSWVNQXhrU1M3L3J2Njk4eC9kWHJy?=
 =?utf-8?Q?Npn/j7A2EyNkxy420cOQw2n6D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 723ce213-4386-4277-ebca-08db6122d42a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 15:30:42.0772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JW10tIzEMhVCB2CSklc+v8fl+bENzBULQELbEmDiq06F0gI2nwJiGCHiswlvR38qEh9GwUtSv0ZDI+qEJTUKpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9507

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

--- a/xen/arch/x86/emul-i8254.c
+++ b/xen/arch/x86/emul-i8254.c
@@ -65,7 +65,10 @@ static int pit_get_count(PITState *pit,
 
     ASSERT(spin_is_locked(&pit->lock));
 
-    d = muldiv64(get_guest_time(v) - pit->count_load_time[channel],
+    d = pit->hw.channels[channel].gate || (c->mode & 3) == 1
+        ? get_guest_time(v) - pit->count_load_time[channel]
+        : pit->count_stop_time[channel];
+    d = muldiv64(d - pit->stopped_time[channel],
                  PIT_FREQ, SYSTEM_TIME_HZ);
 
     switch ( c->mode )
@@ -109,6 +112,7 @@ static void pit_load_count(PITState *pit
         pit->count_load_time[channel] = 0;
     else
         pit->count_load_time[channel] = get_guest_time(v);
+    pit->stopped_time[channel] = 0;
     s->count = val;
     period = DIV_ROUND(val * SYSTEM_TIME_HZ, PIT_FREQ);
 
@@ -147,7 +151,10 @@ static int pit_get_out(PITState *pit, in
 
     ASSERT(spin_is_locked(&pit->lock));
 
-    d = muldiv64(get_guest_time(v) - pit->count_load_time[channel], 
+    d = pit->hw.channels[channel].gate || (s->mode & 3) == 1
+        ? get_guest_time(v) - pit->count_load_time[channel]
+        : pit->count_stop_time[channel];
+    d = muldiv64(d - pit->stopped_time[channel],
                  PIT_FREQ, SYSTEM_TIME_HZ);
 
     switch ( s->mode )
@@ -181,22 +188,39 @@ static void pit_set_gate(PITState *pit,
 
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
+
     /* Last time the counters read zero, for calcuating counter reads */
     int64_t count_load_time[3];
+    /* Last time the counters were stopped, for calcuating counter reads */
+    int64_t count_stop_time[3];
+    /* Accumulate "stopped" time, since the last counter write/reload. */
+    uint64_t stopped_time[3];
+
     /* Channel 0 IRQ handling. */
     struct periodic_time pt0;
     spinlock_t lock;


