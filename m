Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1A4599688
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 09:59:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390081.627295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOwuk-0003N9-49; Fri, 19 Aug 2022 07:59:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390081.627295; Fri, 19 Aug 2022 07:59:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOwuk-0003KK-0T; Fri, 19 Aug 2022 07:59:34 +0000
Received: by outflank-mailman (input) for mailman id 390081;
 Fri, 19 Aug 2022 07:59:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iUym=YX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOwuh-0003K0-Tv
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 07:59:31 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130058.outbound.protection.outlook.com [40.107.13.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id daf8eab9-1f94-11ed-bd2e-47488cf2e6aa;
 Fri, 19 Aug 2022 09:59:31 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6864.eurprd04.prod.outlook.com (2603:10a6:803:138::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Fri, 19 Aug
 2022 07:59:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Fri, 19 Aug 2022
 07:59:28 +0000
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
X-Inumbo-ID: daf8eab9-1f94-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWbfvqxR/1iF7uhxjRX/rKzI21okdRgmYeDotACwkgRDunBaQ4K2Ha6A9wDeTVwn/8aiU/C469yWVxe2AJehGNlY4FuCRUIN6EwVbJHVNstypGm/vYAkgaKD6wsyTxAk/wWRK3Hml40gc77zWvNn9IYUrHLTShmV9kyq96C5MDZ3IkDjWlcBiK0k1qIMENt99y9ph0UldL4nCzRWi/e0tGPUAJqpMQsG01ktHCvMYNX1Pdh68p0owKWNj4oCsQK882eSI2MckJ9dS+ZCs7zuDAZvIhMLx7S7oiRVsC2aIpf2Wb/FV4Oo8IJ5vsni9f7FjD5oU1AbshfqD1MTIwnlTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Ve5o4lLxkQ+Thb31feEDXDXRKgB/+dn8OOmJlU4ZWY=;
 b=CAyKl6wxzNLUranOyf0Ar1STx3aZItAMkjKkiprz9qf8Uyl78krTPZX4e6BlhwrpA1JQyzU5STyIzV5d1FQxWH/qVGE2H1vU5pQnVyxmJRaDOOgbeApE2B4oji2IcFsPqiYOY8wedwOaR1mNC0P+kZ2sJ5YliLP5GQ+XEITXDZibseVsI2KBbimGFYKQbGcuEzJVbpDgT/IAa0UIqYi0ciSetmptHGqPzNgRb4PYuje6JRsMN3Fvf+OhG3RUQoMw6apwdqjh8Oiwis9Du1w6sJZkTwza56xdHXpjvvIedqaSYYq6u5RtSllHEGTTCMYZrsrBVAYFaDgFSDuXKF7H9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Ve5o4lLxkQ+Thb31feEDXDXRKgB/+dn8OOmJlU4ZWY=;
 b=VXOtlrB1XQOD3QFYy0Ea3bgYY7755oetWDmDZyneJXrUCttcvmFHxvfsLei9af210pC5FokhsUswnjLjkkdf4f4CZGbTGK/7YipOCkEYCh8kdTBVdtD+r25/rr+GV/+EPcEiqfFZ4BV67+YrCdNDbXNdtDa3u7pUAUcG6TBN+X5ohhqhwq/UETnJiqMlZ+LlOJksL9y8XRzGkRyJXDLL/uOO3l9xXtjgt0gSHS7e6AEQ8gh68TW4U+21WDKsrng1EEpfM2uLaXWHDYzfJXofC9gw4B8sUhLXfbsvdxxD5c5F3GZHUdwpyLBUJCV51m8jzpXCPhAdX4ORQHZVuXVR3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c3b8c742-928f-80af-3cf4-4962b96721e1@suse.com>
Date: Fri, 19 Aug 2022 09:59:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] xenbaked: properly use time_t in dump_stats()
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
References: <68e71e3b-19a7-e062-9ebe-2e6f6aae0549@suse.com>
Content-Language: en-US
In-Reply-To: <68e71e3b-19a7-e062-9ebe-2e6f6aae0549@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6349b19d-1b86-4d85-5cd6-08da81b8bde5
X-MS-TrafficTypeDiagnostic: VI1PR04MB6864:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KOEyULXbOIIMQGcAPjo/QE1o1BJQ2oezr7z1VN3ETjeWuTNzSYjv9gWxm0C67jw+XoXAfUcFeL37JqvuR6nNnqw4OKD71aJYNwj8LPORZBizbgM3bruM0QT49kJGNVIuiTewVRKosiXYA+dn0QU0GDbhYB+NAnTjaI2DHuk5mY2pOEoNKSS/ZBU9tLafoYOautOHgoVHg4bgQgS9s0aYxM03lAUp8NfHg1NU90hJanxv4cCV4KX3zKtaMstZ4q3F97YMt5Oma8cwoTZ55chHJQdPXb4WZkmqzJKE1Egm8AJmwgcUHLG5psZ9NkHi2Q3rEOqxWE5ylSY06tvSkXMZ54anbwtyTjszYp1i1dTj8tdTqj6ecItdEx1Sq99hUFzEhwBHwt/P0x30FUpt/Rm2AVMu/yWN4rW8hUq4VD0hTf6HwhxVJVxs28ZTRB+CEwILJw7KudFJhpZkfETofp65ZP4Y4t0EDRHerJzhL3SU9tno3v1UiCC0QOU0TVrvzlW6mV3aBYGaSe9zujQUnWe0gqs5l8tluB3jJAwin9izPPYicnpmBmEvDGHXVKe0F+14Ll16bpCmxcEYAiPm5w4G/HOELIR0Ogr9U5WczBY9E+W1YnYyHeGO5i2IAXQK1ehkMpJpB4hDK+iDi7qingva1zkq8dJOrNHpZqg6XmAF0yavkKOQXioc24KUkNi8LqBW1oiNLyQJlezoAr7Wg99cPiEhwGxeNXNfq04IG8ahsFqGJKQBUXglkGr4T5/1I6k6BH5o2/EcKyrtacHErPrrrRdtPJU7SVkqNzFwHYnP5CA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39860400002)(366004)(136003)(376002)(346002)(478600001)(41300700001)(6506007)(86362001)(31696002)(36756003)(26005)(6512007)(31686004)(2616005)(6486002)(186003)(66946007)(66556008)(8676002)(4326008)(54906003)(6916009)(66476007)(316002)(5660300002)(8936002)(38100700002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHlWNFp0SDF6Y3gwNURFTnNWc3JkYlZLUmY3YndWQnNpOWJHK28rOVlVeWpp?=
 =?utf-8?B?aFB0Rk1aQ28rUzVuQVFmb0s2aDd0TUwwZENaZ1Q3amNVd0VZa3JPZWpCdm41?=
 =?utf-8?B?SDZ5ZWgrWHNCR0l0WWZOS2IrU1dOR0IwdU9ld1ptUXB2Yk5INlFPK0Q4bHNF?=
 =?utf-8?B?aktBcm9ld2RaMnVLWWh6Mm91Tms1eFpOclNFbGVLMVBwNUlENG9hOGZJSWhw?=
 =?utf-8?B?bElnZ3VibXJSdGo1VmRhUkRxRk9qNmZTdWRmU0h4SnFqeWowV2hoSUFmdi84?=
 =?utf-8?B?cXRLSk1teW9vWE53c3BTOGRVR0tERkxKQ0tXTDRxTmVKNkVZbEdWT0JNS2Nz?=
 =?utf-8?B?RitidmhwQ2wreFpLMlh3bmhlSnJ5Z1VuUUhybVd1ZVNOak5LVElLV3JwRGVZ?=
 =?utf-8?B?QTNWQzBQbm1keHdmMjQzL1VIbmxkb2Ftc2RxUmdSOGQ0VWxucW1KOWdTMlN2?=
 =?utf-8?B?NHZvNFBvTFhqb3RlWkRzSE43UUpYcHZYckw3OTZtbFFiUHVNbmFtMnllSGtC?=
 =?utf-8?B?NUJIVUs3Ny9mNEVFeStuUi9IY3JIS0ZYY240MWRaaUQ1L0JENXN3aWtqRGNy?=
 =?utf-8?B?eEpIcUdtc24vTzRLNE5mUlRVSk9YRUpTdFVQYjZ5RkFCRUk1bGVJTDNUQjBG?=
 =?utf-8?B?UWF0VjQzaTlOVG5aa2cyMFlCOVZXMTBDTWw0SFJUR1JtcFMxdjJDUVZZWkE2?=
 =?utf-8?B?UmlYVXZhcEY4bkdMUmpTQVNYWkZ6WFJYN09nQTZNVE1MTXlTRSt2N2NjN1Ey?=
 =?utf-8?B?aGJNcGh3RDlkb2JWcXlEVjdqWGlvREsrdTZNTDVrRCtVTnRjRVVlbmZIeHZD?=
 =?utf-8?B?Q0Z0czU5enJiSEZBZjd4cTg5d3VHR3VoL202OGNPUVp4Wnc2bmkzRVBxNFdW?=
 =?utf-8?B?bXNDUVBDYUc5Rm4vbnFmYkVQY0MzY0dHaXliSVY5OHpjYllxZTNZWnVlZ0NZ?=
 =?utf-8?B?MGlkTzVkdE1jV3RmcGw2ZkVPN1BEUTlmNFFwQWRabkZiSDNqSDArOUZpZmNS?=
 =?utf-8?B?dHpaK1pyaDA3UVRhZUpGSHViejN0Y3FSd0RzdXNIZUtxNFl3MGkxZE5sQnA5?=
 =?utf-8?B?MUVhWFJkN1h3L0xyM2oxUXM5NXRkem5aOVlkajlUWEFZNHJFUWJ0YTFyeUdR?=
 =?utf-8?B?SnhoZzB0V0IzOTZ2RkZtUERpTjVGTWcwRm5STG9adDBnWW9kSVJXaXV4QzNB?=
 =?utf-8?B?WERTeTVhM1M2eHhsWUJkSkNoV3lHK1FKcVpybW1Ycjc1RldhN3dzV1NqNXRS?=
 =?utf-8?B?c01wOVlZdjJHZW5IUVZXcTZtQjZJWmVjQjJoUnA2VDJ4TUxJbGVIN3hWUHJM?=
 =?utf-8?B?RTZYRHFKMGhvNk8wU0FvOWlPTHNLWHJuMzEyMlF0dXp3VEdjZGRwTjNmLy9s?=
 =?utf-8?B?QXFsQ2VmcitYWHdVai9lRDA2RHd3MHU0YUJNWkNOV2ovVGt6RWZ0WGpXc3k2?=
 =?utf-8?B?NDhxMFhUbTBpZnRmelBVeEV6Tk5sZHJDZE5pRTRFUDBoMXhJZFI0dVRrc2VX?=
 =?utf-8?B?R0ZUSVlIWVBaL3Jpd3hLVk80cVpZRWJiZ3BmOHBoeHBTV3E1cmJPRld5R0Y3?=
 =?utf-8?B?ZmgzbkdKZWRzQm9mWDhZbFBJWUxGRnd3WmdHNHd4V2tnMERWaWxkU1FoZmE0?=
 =?utf-8?B?QzhHZDRNRjVwVmVhUlBDZkR1d0VLdXBPajVXczdtbnBtUStIdzR3S1lGZ0hy?=
 =?utf-8?B?VGdkT0dNc2xYbVp4OURYQXloVW1OMUtNU0I1R0loTXh1STZOTCtSVzFPWGJD?=
 =?utf-8?B?QjU1RGxKMlhJVmxnenpmN1FWYnExY2p5R3dDanBGQnA4Ukk4RWNvdmE0KzVs?=
 =?utf-8?B?OEQ0U2hENTExam1LMXlib1ZzSWt3QkY5YlVRcThnTk1rTEkyVEd6cVhVSm9D?=
 =?utf-8?B?bnVTdVhITFpQMVlVd0VISWFRNk92dFhRY1NUa1pjdHNVVlNPR0J5M29uOVUz?=
 =?utf-8?B?SSt1U3hBZkVxc3JOZmQrSi9KYTRSVjZVeHhyRlkwYjIyNFpmenZXTkt0N2Ez?=
 =?utf-8?B?RUZRSDFRYm4yRnJiVTRlWW5aZ3U4SjVDWE1uRXJKbm9jSEpPazc4Q0RQNnBV?=
 =?utf-8?B?VTkrSXVUUlBEN0xFdlJ0OTQ1STA2SFhSQ2pWa2RzdG1MeGErdXVXenBZM2kz?=
 =?utf-8?Q?NsxpSEkQRIq9rPxSNhjgJhv65?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6349b19d-1b86-4d85-5cd6-08da81b8bde5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 07:59:28.7331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WvaFI2gEqVbijgzUa9uCwnSi7CcSqknjmVtiVvFKpsrUJSl12kPRQxheJ/gTqvoAS21s5lpDWvD5M2AQEiXVqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6864

"int" is not a suitable type to convert time()'s return value to. Avoid
casts and other extra fiddling by using difftime(), on the assumption
that the overhead of using "double" doesn't matter here.

Coverity ID: 1509374
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Properly use %.0f everywhere.

--- a/tools/xenmon/xenbaked.c
+++ b/tools/xenmon/xenbaked.c
@@ -230,11 +230,7 @@ static void check_gotten_sum(void)
 static void dump_stats(void) 
 {
     stat_map_t *smt = stat_map;
-    time_t end_time, run_time;
-
-    time(&end_time);
-
-    run_time = end_time - start_time;
+    double run_time = difftime(time(NULL), start_time);
 
     printf("Event counts:\n");
     while (smt->text != NULL) {
@@ -242,13 +238,11 @@ static void dump_stats(void)
         smt++;
     }
 
-    printf("processed %d total records in %d seconds (%ld per second)\n",
-           rec_count, (int)run_time,
-           run_time ? (long)(rec_count/run_time) : 0L);
+    printf("processed %d total records in %.0f seconds (%.0f per second)\n",
+           rec_count, run_time, run_time ? rec_count / run_time : 0);
 
-    printf("woke up %d times in %d seconds (%ld per second)\n",
-           wakeups, (int) run_time,
-           run_time ? (long)(wakeups/run_time) : 0L);
+    printf("woke up %d times in %.0f seconds (%.0f per second)\n",
+           wakeups, run_time, run_time ? wakeups / run_time : 0);
 
     check_gotten_sum();
 }

