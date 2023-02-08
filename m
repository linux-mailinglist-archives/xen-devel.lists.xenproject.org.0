Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE5A68F113
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 15:45:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491868.761206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPlhC-00013i-Io; Wed, 08 Feb 2023 14:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491868.761206; Wed, 08 Feb 2023 14:45:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPlhC-00011J-En; Wed, 08 Feb 2023 14:45:14 +0000
Received: by outflank-mailman (input) for mailman id 491868;
 Wed, 08 Feb 2023 14:45:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/8R=6E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pPlac-0005uV-Hw
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 14:38:26 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0631.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e991945-a7be-11ed-933c-83870f6b2ba8;
 Wed, 08 Feb 2023 15:38:25 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7456.eurprd04.prod.outlook.com (2603:10a6:800:1ac::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 14:38:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6064.036; Wed, 8 Feb 2023
 14:38:22 +0000
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
X-Inumbo-ID: 3e991945-a7be-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A2DhN7QHe7zq7Zsg7u1Bi+z6xTHyas2R9c86qcKo2D5oJFooHYLIvwzMjOO4EtT7h5uD9fvabhnm1fMOw4ZyTRG5FxzU5JbZWrwTwZ0kibQUy8gcSq62CUS9wI07ppulPjy2aqgRimUd6k1l0uu+SNTsCavRwXAVlzNN6tVJtwsjD6J3wMOeeh6uE9qpi6vqMua6d0Jq8ol+XXycZ79e/ntj1nM4amnNS14KStL8fPAfAIGgT9Rlb2euAmMtn7svDO88SQW07cC4yWRSoii+ED25UbPcTzJTRX/h0PHuzmOWdXiI5H2vROzTZXbJH0phqZCXFKM97djYFLYBTFTFew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XKJmP6oShTkiMe9LQzsbVOzIHfIJVktiMOexocp7MYs=;
 b=fy2S+gTW/THUSoE7KvVg/sG/JYzC2AGNiW676RhDe4x39cFzCJXXhzGefBK7A+12rWY1OzhLSr+Lw7t5mCR0PkF4TihiePUSiEKC3DfAyNgz4hi15GRDz7VPg1/vEEoaZo2xG01BPu45me3o6ymoGynWaxN3hVhA3krDkvhwIY9jpYrjeaWO/hx7l9udNE72zT9D2Qe8fjf454nyBUWUmJ84YyxTlSmOLngCddVeZ8L7nRG86wax6IDUDoOcNYQrYyj4lva8mmUelZS3suzvgM4Haj23n6n8CLrGjsFEOcep7kzzdOLR7izohloP0IMecCL0yqgOrJM6wGq4KH6Y2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XKJmP6oShTkiMe9LQzsbVOzIHfIJVktiMOexocp7MYs=;
 b=EWolOIufNmtQWstOjAkal5lY6bl5mOzqequ5Bmm29NL+UXHInuhMuHh4fMj8HJz+FhLptwNNTj5NLQOTS6suNDEsqrDx3TvEAgXwX4i9qPoZ+A1IyE5wwE9IMugII7Ed3w+JY0Ao/5ltA9fOyWFP0CnoVogfdSob9SxJdvlvPyV19aHz6YihtHj65FeZr+EwRsr758UoIieEjf1gMYYWIEaIfbplERWPNmQikYcutEwt53zGqWRiPniztLMHfHSup8yHCkqbqi5/GO0defzIgO1hkI8uI+jnsVhFBXmDw81KFRXNhdO9iJ5mo1XTOw2xfyaBJeHPlZ4beq9MitOrvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7d2dd28a-a821-e906-6245-ab26e5518706@suse.com>
Date: Wed, 8 Feb 2023 15:38:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: [PATCH v3 4/4] x86/shadow: re-work 4-level SHADOW_FOREACH_L2E()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <c8858a19-e89a-c1de-3222-810bb43c3c88@suse.com>
In-Reply-To: <c8858a19-e89a-c1de-3222-810bb43c3c88@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7456:EE_
X-MS-Office365-Filtering-Correlation-Id: 071df123-240e-4793-6b2a-08db09e220df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fwBNcL90U63MLLRc4y8L2x+95daJtqeuWtw/o4hnROkjouBOStc9Y96ehp6cofPc0BvKrhtBpJa9h9Htl6F4fMQvIt0xdjlQLdSOq3Dc4ODfsIu2yjyZQrfNuF66y76HtdWqaHNThuqbf6aZz5Bo8sljj4jQCV9oKwXWtH0OkuIsqKTZMY6LNztKdgrHwPbo/ezK/tJMPBwn4W8dmil4iUEWTISGfAFbErxB+AHA38rEeEWgNxFd8QCo3w/lI9llFAUV3yCDkuy9jSquXymmNGj6sOvsWH0ge/PzIIPJXQ5O3ekq/E0EhRhvD/9jUqqwfxiNXbwU4xTqUskHyXnbDkNXWAViXWB/PLVlwF1DfGMzYfXyOK1c7GS4eJh5AwneEO8dMujdEbnQZnGzKFv0Xmne85ZoTswBiBxbniF/IBXBOw5CoEJCj45gGouDx84SVCGC5ThgHN3jzOLsO4aEXWFzvZBT9s4NEWAb85lUqZxAM4l5YjX6BUx+mig1gt/zDebBUoVm0ABR/pGDcbEQgWXB/teEEwdkuXmFiXy8hIqHzJdyxwTNwL/Db2OjnM5z0vdY0qJpdDFoCFsXB739vH0Xo1rhTAv5oHxHIOc2hOshINKhmkAPRSaExnrz+MlTrAmDzx/y8We+gvEN37UUFjrJMr2iZ24y1z0+u/jm0RkGiwaWZOjtTjwczb910cLG3uykrAxAdgsPZE7FNuEk9zSDsmVZreNfvffFWocISFc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39850400004)(346002)(136003)(376002)(396003)(366004)(451199018)(6506007)(86362001)(5660300002)(26005)(6512007)(31686004)(186003)(66556008)(8936002)(6666004)(2906002)(66946007)(6916009)(66476007)(4326008)(8676002)(38100700002)(41300700001)(316002)(2616005)(31696002)(478600001)(6486002)(54906003)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFU3dkdPMUhMd3dHS1FDYjNFdDRUSThjZEdRWUk0Uk5FVDhjdG9iWWQxaDdV?=
 =?utf-8?B?ZEpMd1AzZTdsUXF1NHdQTkY0WkFWcVlUUnBzUVFjK0ljUHY4bG1lWUZ2dWlC?=
 =?utf-8?B?Nms4dnFRQmtDYWpJRmhNSDNVc2VzQkpPRFBjVjJILzdCcGZmVVJFaWlYV2ZY?=
 =?utf-8?B?QjN6cmNtNWNneFYrcVVmaUovdmFHYUIyT3lrVmQvUW02aDJuOVNlemV0RlJJ?=
 =?utf-8?B?amZCdko0V1hrSkZFaGpyam1WcVBuUjNyMEQ4bmtzM3hSQ240TWw3UmZZSVJ2?=
 =?utf-8?B?RW0rMllIK3AzN2c1aHNSekx5UlpzN29uN0hhN0ZwaEFVd0JzNTRDdE0zQVNZ?=
 =?utf-8?B?bEk5YXg4eFhpYU1Nd3pWWjBhNzVSUU93dG5jSkdqd3ZtSUtBZlpxb0FDVjFW?=
 =?utf-8?B?Q1V6VmpZc2t1NEUzdDlLTk54czRIcEVFY29HQ1krc3MxUzNReTg2TnhCdHNa?=
 =?utf-8?B?U0RWMU95a2w4U05EUWRWNUVJblVVdDNwNk1vSXFOVVhnT0ZoNE5ka0JubDN2?=
 =?utf-8?B?N3JRTndObUU0cXJHNUVQRkNtVTBWOXcrNDBjdWcyVlFoVDFyeTlNclN0SW0v?=
 =?utf-8?B?QlVHZVhvR1ROK0p6UWRMOXlmMFo1VURQT2xLcWszc1VzVkljZWJLdlJoZDZE?=
 =?utf-8?B?elBsS2VoTEhUamxXMFh6QUV4SE5tSjNOazhzZmhkMFVtUXZEcm8yWFk1cUVN?=
 =?utf-8?B?U1JmTURHZk8xRFhLWitxbnlNN0pCaWk4b1hPUGFuL1ljRnR0S21vWm95VERC?=
 =?utf-8?B?dGVvOUxuc1hlWSsyNnUwQ1YySVhXd1JrZ21oUFZhcTJwYlMzalZDSU5CMjVG?=
 =?utf-8?B?MTJ6M1g5OS9sbnllMERLdGYwTk9USVVqVHlpQ3NpejYvRjJGVHVJTzBHV3p1?=
 =?utf-8?B?d2lnT3ArVmNRMmtvMFpQZGcvdHhxTDZrYXI4MllxVzdwSjF5MTBtWm1iMFNO?=
 =?utf-8?B?elBqS1JDbFFBaXBGZnI2M0ZaM1NuSWcxMXJqVVQvUEZjd0hJQ2x6UUJRRTJj?=
 =?utf-8?B?Q2FLU1RIT0lKcG9MMG1mVzNNYkhDUnZTYlNJS3VXalRrUFVTZHpIZE5hYkFh?=
 =?utf-8?B?MDRWdVNGL1hWYUNONTBYUStkNzRMblA2NlZscnc1Q0FlS2ptTXc4TGdwSGRZ?=
 =?utf-8?B?MStZNE1SaDd6L3Bhek1EWDBVTFovUml0eVRTN01OSjZCVjlTcnNJUUx4Y3VL?=
 =?utf-8?B?NTNQWEdGQWN0K1NxWlBha3ZqVUw4dklia3VQRE9QRnc2aE00NGhQbEUzNzRW?=
 =?utf-8?B?VXJYN3hTRnoyMGdLV1IxNDd6QWNTRXFyVXJvRWR1UHhXNHZESm5UenZiZmZZ?=
 =?utf-8?B?ZkRMZkNlSElBcE5XbE5LSzh2aWgvOGRmRVBucWtWNjBmTys4dkFRMnZvZlJM?=
 =?utf-8?B?KzcwNXJDZkpiTGFjZktvUnh3c0tya28rekNQRkUvSjZ5bE5wNWVMRFppSC9y?=
 =?utf-8?B?WTVwSVYxdnJlYzIwdGIxOXE2aXdXTjNadlR4dmlmWEdoaVd2TDl6NnRobk5S?=
 =?utf-8?B?KytIanlTTkFlNm9aYStjdVo4MmwzVlhFT2xqT05HcWNpbnRYOXNpVnJ1YW1S?=
 =?utf-8?B?WFo1K09oMDdtd3VJWFpvVE1yRlp2L1BFWks3Y1gzSzd3bmZaT2tMVUVIOEMw?=
 =?utf-8?B?NHZ5Q2hRVWZsWEdLY1ZYMUVIYnJGa0NlYW0rRXU1M05TajJIMFF5Z1lYc2tm?=
 =?utf-8?B?Mi95MEtVZ3kvbXZmNEJ5cjdIN0RneWVjb0lxVmkyRGQxTDRZSWhkOGE5NFhx?=
 =?utf-8?B?S2dkQ2JTZ3pqRVZlZTlXa3VJT3BDQ1hqL0QxWThTQ0dWVUNjTzJUemh0QjNU?=
 =?utf-8?B?S1dNSFdjR2RrL0hSdnZvQ1VlZDJKdkVMVlRHUE5rQlQyS1ltbENreUFhVG5I?=
 =?utf-8?B?RXU0SDJBa1krTnorUkU2OE80elUwQXZydGY4QS9NblJJbml3VGYyNlNiMDlP?=
 =?utf-8?B?aTFVZ1BvNnpoVmRIV09pOUN5S1pPRVMvdVJidWpYazNHWW93ekZoSG9hZUdq?=
 =?utf-8?B?djNzTndyOGJhZnFTRm9Ydk84K3prVUhlRVNBUTJ6T1dId2NTLzViTG1mYm95?=
 =?utf-8?B?RWFqY2JTeStGTERCdVFkWGgrUVk5MjB1UFlUSG5YK2RISHg0YlZLSi8xMnlC?=
 =?utf-8?Q?TukDCTyClzRyt2rv8cCYKw62m?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 071df123-240e-4793-6b2a-08db09e220df
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 14:38:22.3078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Zc58En/NsA12WA3fRrPtf+x/g2lfS7FHp8d0dCg/zUpemhuq8kzu8LKINKEu8Q33rUuTXFVGrPQwv2zrOHKNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7456

First of all move the almost loop-invariant condition out of the loop;
transform it into an altered loop boundary, noting that the updating of
_gl2p is relevant only at one use site, and then also only inside the
_code blob it provides. Then drop the shadow_mode_external() part of the
condition as being redundant with the is_pv_32bit_domain() check.
Further, since the new local variable wants to be "unsigned int",
convert the loop induction variable accordingly. Finally also adjust
formatting as most code needs touching anyway.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Drop shadow_mode_external(). Switch back from using trailing
    underscores. Convert style to be fully conformant.
v2: New.

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -861,23 +861,22 @@ do {
 /* 64-bit l2: touch all entries except for PAE compat guests. */
 #define SHADOW_FOREACH_L2E(_sl2mfn, _sl2e, _gl2p, _done, _dom, _code)       \
 do {                                                                        \
-    int _i;                                                                 \
-    int _xen = !shadow_mode_external(_dom);                                 \
+    unsigned int _i, _end = SHADOW_L2_PAGETABLE_ENTRIES;                    \
     shadow_l2e_t *_sp = map_domain_page((_sl2mfn));                         \
     ASSERT_VALID_L2(mfn_to_page(_sl2mfn)->u.sh.type);                       \
-    for ( _i = 0; _i < SHADOW_L2_PAGETABLE_ENTRIES; _i++ )                  \
+    if ( is_pv_32bit_domain(_dom) /* implies !shadow_mode_external(_dom) */ && \
+         mfn_to_page(_sl2mfn)->u.sh.type != SH_type_l2_64_shadow )          \
+        _end = COMPAT_L2_PAGETABLE_FIRST_XEN_SLOT(_dom);                    \
+    for ( _i = 0; _i < _end; ++_i )                                         \
     {                                                                       \
-        if ( (!(_xen))                                                      \
-             || !is_pv_32bit_domain(_dom)                                   \
-             || mfn_to_page(_sl2mfn)->u.sh.type == SH_type_l2_64_shadow     \
-             || (_i < COMPAT_L2_PAGETABLE_FIRST_XEN_SLOT(_dom)) )           \
+        (_sl2e) = _sp + _i;                                                 \
+        if ( shadow_l2e_get_flags(*(_sl2e)) & _PAGE_PRESENT )               \
         {                                                                   \
-            (_sl2e) = _sp + _i;                                             \
-            if ( shadow_l2e_get_flags(*(_sl2e)) & _PAGE_PRESENT )           \
-                {_code}                                                     \
-            if ( _done ) break;                                             \
-            increment_ptr_to_guest_entry(_gl2p);                            \
+            _code;                                                          \
         }                                                                   \
+        if ( _done )                                                        \
+            break;                                                          \
+        increment_ptr_to_guest_entry(_gl2p);                                \
     }                                                                       \
     unmap_domain_page(_sp);                                                 \
 } while (0)


