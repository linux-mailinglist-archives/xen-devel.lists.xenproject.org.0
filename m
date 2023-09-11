Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF87E79A396
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 08:38:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599042.934277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfaZA-0005ku-6d; Mon, 11 Sep 2023 06:38:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599042.934277; Mon, 11 Sep 2023 06:38:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfaZA-0005iJ-37; Mon, 11 Sep 2023 06:38:36 +0000
Received: by outflank-mailman (input) for mailman id 599042;
 Mon, 11 Sep 2023 06:38:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xbw8=E3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qfaZ8-0005iD-Ul
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 06:38:34 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d41b2491-506d-11ee-8784-cb3800f73035;
 Mon, 11 Sep 2023 08:38:34 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by DB9PR04MB9889.eurprd04.prod.outlook.com (2603:10a6:10:4ef::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Mon, 11 Sep
 2023 06:38:30 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 06:38:30 +0000
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
X-Inumbo-ID: d41b2491-506d-11ee-8784-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rej/j+ttGNxbennkffBqXtGngTHoKx8d7v01k0FNUlmM8AkP6UxbzRROVkOXiA37X2FHK/quVONilcz4TYIx1vwmnpO8Swv3PNHAcrXXycE+qESvxJd/FnjrwFVT7PUTkU7L0yrI99uPthqg3uali5noG0708qBcq9SoUhbX/B1I+CYhJFjLiFPxfAYxc9Tp3tmBc6AhNvZoFAKaiYe0xzAS1oXht54bvZh4iiZAkPDaomw5V8hCvUBE4LlkPOLVs+o2xGuLcvePibpNHum34wKtNO1q2KwSWB9pDn8Eyu5fUUP6QJdfaetpDoLc44CjCMKZIp5hlyoZeIJA3kQWWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DFADsLsb1kDVyT8qTXZJEa8z+dCBZPheDsPwAKar0tI=;
 b=ZcBMW1LtTfdCK8YGwonELF/53/QJzmd2vrk/pGQ3KXvyrYIU/hXqVELeFD6Ojr1ZPaN5EkJouhOPxzGB6jO+OuomNz9MmVAyDsjWH0Lspbm13Gt90j8Y9+9rQblIxnxdbqeOg6MaSp/wgceqRdgho+EuktUqPNtTtXA9QOzAiaKcHmiTIpWF1GwJ4yCuUh7WZGAUIXMSRCiuMljLolwWyseGKvnaljgxO4EI10O+84kRCFXcwrp+EIHQ7w3ypeBXIY2F7U/ywIOZSsJWmrJ55Wwn87v8u5zDHnLkmE1682H2HHUtiPdfZidBAlBBf4tZkBpDJZCc4Kpy6yC5RxOUbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFADsLsb1kDVyT8qTXZJEa8z+dCBZPheDsPwAKar0tI=;
 b=tuT+C1gSa0Ag7JUMexKVurn55frHjK0hH/kA2AD/tOkSdjLn7vPUAZ9On8BACeTtx8F5NIVeBCRqjcb1RgLVrOWxkrYC0ydVP1npmBGMmTsDLKofAdb69e23cWXmNFgxNMhv0i0lbAOrJGQz8hSOo+SiloXV8d4Eu6nT85eDe1dG2kGSS/4CQPlipypXX+s+07H9REBt7BUvi0DcmjXaljhjTHxoYbtbJ4O3H5Bgb8mNSh4mtXyrjVSjMkPtlb80KWrMw/UoQvJkOLMqNel1+GRTi9uLf1hm4qagc2wku/GSPjwQuJ5d38IqMn+4wP6GIiGGGJcaFVWh99fH/z94dQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9b5d517b-fbc0-d9ce-d6be-d4b8e3c0cc35@suse.com>
Date: Mon, 11 Sep 2023 08:38:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] include: make domain_page.h's stubs properly use type-unsafe
 MFN <-> virt helpers
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::20) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|DB9PR04MB9889:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aa9abaf-9a02-4fd4-816c-08dbb291b66b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5g7b7RscvI30KbUT9JHX9Fjb6sDK6LYXOcxU8x+3G4Zh4mcE9S9QXxvuvMNjdoWKppup9hTxH6hCKd2sk7uDhag/UBt2npshsAR7W6lFsfYiDo903j7KT3k3nhnTyVN+GmaQ2AhXI2NcUz/xkK2njJrrSuYi4+VHdSXOpcEQEh0Ykf6+B1RDKSMAWiPUFvWJYJS7/Oi+jMCnRyJomXzbtWG2rzlyW+wR4PGeQRED+WIHBl6UjTX1Q0O4CVZj8LFobSwPFYityW954naXvIjZMzhxKTgI/AL4Zy21k5HyemGiRvzcgiOaQFQcIUatOy+Lr/1EiP641ab4pVwmxOnlyn7BAwtswdOqClCzrxZeKAwzuV7hvRFcRHijxHgGb9+6gkwvRHISjWD/Rbd3QAOiaeUv5euFO8/C1tAOBwUmlTHS8MRZBar4EanyLTDSgIeAlq8CYqLAzb3jIst3URnszH9eeM1D5heSdABm17R1GJ1guFI65klszeqysj6nAL+fONfJo6SOj8icQ78KSy4o7BtBbKqkKPYkLaSAxsQC/RuUwCDoV30mvC99lX8hKR1nVA3EuD/WkmwDYTm5mBj12qa7nNsSNpWKt06WAJrRZ6S3x366adKBimoaYg+RdXrEbp19ydPDNTtSelRgDeNWgA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(39850400004)(396003)(366004)(186009)(1800799009)(451199024)(31686004)(6486002)(6506007)(86362001)(36756003)(31696002)(38100700002)(2906002)(26005)(83380400001)(6512007)(478600001)(41300700001)(66476007)(8676002)(4326008)(8936002)(5660300002)(54906003)(316002)(6916009)(2616005)(66556008)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1M2dXFSQVZlV2h6NmpwRXUyaWNvcjZMR050R3BoK082NWgveGpWYTZJQkNM?=
 =?utf-8?B?M3JBYjdDeWZpRWMxSmJJV2FXTUxjTXZTb1AyZGViSWh5dkxYdFFvMUVpbHJ0?=
 =?utf-8?B?MUdYb1hrUm9FbXNjYzU4dGZkS0ZtQUlvZHpyVFBWTkRwLzZVblQrb2xucmhT?=
 =?utf-8?B?NHRQVTE0TjNHcmRRdGwrNzFGUEwxNWFxaTV6TTNCTUo1YUxiaEhFUE9pMUNn?=
 =?utf-8?B?bFRBMzg2MGR6bm85N3VRU0tJVCs3MzJXTXoxbk9PTUxOZW5Ld2RITk4xWlhQ?=
 =?utf-8?B?QXU3aXdUd2NyQzViL1JTV1VjMHNlYURLVUxBQkx5U2RmeitDNDNQVWpRM0xy?=
 =?utf-8?B?RlZ3d2huOG9oTE5UVDhaOWFYVHo5VnFLWjVPNnQyWVdqWktINXVWd1NPcXVK?=
 =?utf-8?B?QS90ZEV3RkZyaVVHZzVTSFNOaE5rZWpKdWhua3Vya1N5N0J5Sk5qZjRBbDk2?=
 =?utf-8?B?SDNPalhGS0ZFOUgzd3dZc05GZEdxNlVUdXQ4MnRZenJNTXE4WndOWko0T0dj?=
 =?utf-8?B?ellDb05MQVhZUDZLYk4xWXl6OGJiV21FRTdPcVRTRVZkOTYwN2lVM2lSdzFW?=
 =?utf-8?B?SnpISVBKWm5YdUk5MDdFZnFOVjFnZmdQaStHMHFqWWRmcnNRNUdxYnZKVWZW?=
 =?utf-8?B?QmRrUU9HcXdvQXBocnBwalFQc01jRklXQ1ZHY2ZvdlVwWDJSeXgvQ09pc0RB?=
 =?utf-8?B?WWh2WldzR1ZSc2VLeWtyVHRqQmtFSmVOQmYvdEQ1aWU0N3pva1hIcjN2K1kw?=
 =?utf-8?B?SFgzZjkvd01JNk5iOGI2NVBwWms4cll2Mmxrd0d2OSt2L0IvMkF5WTlCMlJG?=
 =?utf-8?B?VDdFODlFM08yamduZ2l2bmJEY1YxREtSTGNBZlNJbDk0Zkh0dVpxRlYzK1Vv?=
 =?utf-8?B?QUJkdm1OZExGbVZEL0xQZ05CSlk0endZTENTU1Iwd0FaZHZTcUtXZmVxdGVp?=
 =?utf-8?B?TWUxUThsa0Z1bTF0VFYwS2kwSXZHd0hNQmFzdUtWMTZsd2RlTVVDbDlta0s4?=
 =?utf-8?B?aTVSNDVWdGJwd1BRTU9xbS92dEdWdXVKSjBQQThrR09BcjF4QUpLUHBGVHlX?=
 =?utf-8?B?a0VWSkk1OWI2RXJvOFVlaEZpd0QwWDZWRUVtQ0JxNHhtOVRTQ05kT1RUcVQw?=
 =?utf-8?B?MmFxKzIra1dVMlhEc1NDZXVFVDFCSjc5MnF3aHZTZzdaZjVic09OcnJjUHdu?=
 =?utf-8?B?dy9jV01Vb0twZi9SWFIzcUE5cHRzYkRmVDVObmJ3YUhaUHRsYkVVYVJXVlc3?=
 =?utf-8?B?UmViMHNqNGp3eGZyTmxiVTNtc1ZLdk9UYjdYTG1vOWFCWUV5QTFVbzg0YTRF?=
 =?utf-8?B?SHA3bFhvSnY0Zk1leWd3S2JETVJPZ1Baa0pmL1FYakNJanN4cTkzS2dDbm5S?=
 =?utf-8?B?cDU1cTFGRlNIYUhhSURXWS90MUl6REE3K1BSeENZWTdkK2E3emorUWhLek92?=
 =?utf-8?B?NWkwOFozbG4wSG5mcXcyYS9NQWpqNTVvd01pSkFHT2RVZXRGVlVtNFFsT01I?=
 =?utf-8?B?dUdvSkJWRWgyZ3hqM0N4RlNlNldRb21uNmdaUWh5ZS9kdytNWVBjMDJMVk1r?=
 =?utf-8?B?M1YwcEQxbEF5SzJSNjZQWDUwMTlsNW02WkMvNHJRV1grYnJjUmlFYWluS1du?=
 =?utf-8?B?WFFFYTRNb2h6TVhldzhlbjZWNlBsYmdPK2Vsc1FQWTRzUjdOTE9INFZuNDNr?=
 =?utf-8?B?aU1BRUs1cGQ4UXY3WXVLRFJSWXF1dTRaNi90ajJld2s5RDRtZFhkNWw4Qi84?=
 =?utf-8?B?R2dJYVpXdnR5Znc3WmxRMks1OHZGaEFHSFVCWE9KVSt3em5yTmlRa2JtUjhD?=
 =?utf-8?B?cUpTWEs2UDdmdVFnRWtyL0Y2Um9RazY1ZlljajNROVN1WjV4eGgrbXZ6eW5M?=
 =?utf-8?B?cGU5UTNyQ2Mza1J0Qi9yWDJsL0g4bTZWRGpja2xhc2VOM0lqMUkycjgrME1V?=
 =?utf-8?B?UEZCeEhKc1crYUljZ3RnZGFHdEZPSVpNT1gyaVZHbmd3aGw1V1Jzcy84UlBp?=
 =?utf-8?B?SUhhNENBQXVWQWoyL3liV2R4YnVuRWRUNnZHWHB4Sys1bnhXckIrd2tWbUN6?=
 =?utf-8?B?UkUraGdHWGRtRXB1S0kvUXV0ZCtzNG9xU0FnL3JIejFXS3RwalZLUGJvWWQ4?=
 =?utf-8?Q?HSRFczW6z9gRYv/tvELKlJGVH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aa9abaf-9a02-4fd4-816c-08dbb291b66b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 06:38:30.4609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9BkthNkDrEkVEdVeEEnP7G81iVFLiMuAnOV4tCHKIEN7ecH1sEbZvv8FJlT23UHo0A7clUv6D69O8uoXz50jcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9889

The first of the commits referenced below didn't go far enough, and the
2nd of them, while trying to close (some of) the gap, wrongly kept using
the potentially type-safe variant. This is getting in the way of new
ports preferably not having any type-unsafe private code (and in
particular not having a need for any overrides in newly introduced
files).

Fixes: 41c48004d1d8 ("xen/mm: Use __virt_to_mfn in map_domain_page instead of virt_to_mfn")
Fixes: f46b6197344f ("xen: Convert page_to_mfn and mfn_to_page to use typesafe MFN")
Reported-by: Shawn Anastasio <sanastasio@raptorengineering.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/xen/domain_page.h
+++ b/xen/include/xen/domain_page.h
@@ -56,11 +56,11 @@ static inline void *__map_domain_page_gl
 #define map_domain_page(mfn)                __mfn_to_virt(mfn_x(mfn))
 #define __map_domain_page(pg)               page_to_virt(pg)
 #define unmap_domain_page(va)               ((void)(va))
-#define domain_page_map_to_mfn(va)          _mfn(virt_to_mfn((unsigned long)(va)))
+#define domain_page_map_to_mfn(va)          _mfn(__virt_to_mfn((unsigned long)(va)))
 
 static inline void *map_domain_page_global(mfn_t mfn)
 {
-    return mfn_to_virt(mfn_x(mfn));
+    return __mfn_to_virt(mfn_x(mfn));
 }
 
 static inline void *__map_domain_page_global(const struct page_info *pg)

