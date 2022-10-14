Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E8B5FEB10
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 10:50:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422576.668690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojGOI-0000N8-Bx; Fri, 14 Oct 2022 08:50:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422576.668690; Fri, 14 Oct 2022 08:50:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojGOI-0000Je-8k; Fri, 14 Oct 2022 08:50:02 +0000
Received: by outflank-mailman (input) for mailman id 422576;
 Fri, 14 Oct 2022 08:50:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F+Di=2P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ojGOG-0000CF-MV
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 08:50:00 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2067.outbound.protection.outlook.com [40.107.21.67])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f3fd1ac-4b9d-11ed-8fd0-01056ac49cbb;
 Fri, 14 Oct 2022 10:49:59 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8485.eurprd04.prod.outlook.com (2603:10a6:20b:418::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Fri, 14 Oct
 2022 08:49:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.026; Fri, 14 Oct 2022
 08:49:57 +0000
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
X-Inumbo-ID: 2f3fd1ac-4b9d-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j9pzo7zwr1xe4G/8wybFUI+TjMlpyH/9uQHgK7gWPT3iDube8YrO8mgTd78I5V1wyKMiKDJHatiYLXqsRw3iEVztxldcX3TbovB25O30sIlpa4apI5t3i/56KpZ6XK1og4pY3QoVhZtkx6K6JD+Q4G9ax2b8tRXK9YfKAy4LoDtGFWrzayRjs3WNiN3cuWw6eRTiYV/WBAHa15MTrAHsmGyAA46lz88J/9EUrxo402v7pcNXPa2sDXgPZCLhnyhEUHo1I7AujbdnltBj16W7EAmJVfB6RAYafM13ld8y369JmP/8XfJ+72iqCMkpyvgpznqTyHT/TDszlsTLNMo7aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=poZy3Fj+sfjLDpJyyPbFWFcXUIdvNScSz2arcNdyaZo=;
 b=NEq89zTdHMsue53lv6fMlwfMg2pJqtbXe1rFvelhQ1CheBtnMW6mxFVnQiML1tuUPQeJkyNgjuKduYGP1JhmZLS4crgmD6GmILuIFlHk/VC/vVPRauz0snbmCEkTjXpQk0rwX3zhSipjV9WX3ZdbTEY3LVSsrnyfFEEMeX/osBdyHQNBZhhi9nMRDa/artapubWJbhuaeNWaBCHi39HwOEZG+PuyM9q4zo3dnLTO4pBRW1fIl0gdYAmpaxOe5oNgVj4nAF7BvRVeC1MtSOkVGycaDHfCl5mSuOrqfXOPqd3yd5WWa8WffFhYKczWDXFS/P71V1AKgKvhXmrzdqCaow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=poZy3Fj+sfjLDpJyyPbFWFcXUIdvNScSz2arcNdyaZo=;
 b=CTUYqM6CdZc6O4GEmQJ8CeU4mNkuOo87Ga6qgQpXrIIXnjBTHQXRqe9deBXypYLcKDRBdSUHFCd4kjUF29YKCw7qKPETHeA5kzqlIc89WZF3tJEfV3W/XHN4u6lO/0hBKo8Yt+IDxd8/rWeSykphKe21G6IBM2kqaLBJanyTHSnympyF7bnKuK/pjQ7Ue9JJSjo4QkBcjYGsI221gX+SOUJaEtnTdjxD0qeWsERWn0E/pgmwR0FpWmWY5ME/Kzbaats4OAkKC/2F+Kqn9BVpkO4C4DujqTv6UquFJ/WYc3tRzQEpPvlO6BtjFe2TV6tFXbUcNamW/0kFPWi1TIiPNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e447da22-23d6-d3db-313d-4e4ca009c3df@suse.com>
Date: Fri, 14 Oct 2022 10:49:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, Henry Wang <Henry.Wang@arm.com>,
 George Dunlap <george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH][4.17] x86/shadow: drop (replace) bogus assertions
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8485:EE_
X-MS-Office365-Filtering-Correlation-Id: 4752880f-2031-4015-5037-08daadc11240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nDWITlxl9WE4V2TZQEOU1xGzwI1/lXEMSTc/YwYI8yQomBgilkPAgr5gKYXs82Zz7tgQsszOsYDBjW1ydAzaxaMdHWAG2ytNUJLSRJExLnCOE8SFEsNj6ZXzpPrX9JHmVWExpkTgLLmEyFT7Hk1lZlYyK0np2V/alyxwBJqqOc6DUyWkMdz2D6IM04orr1Nnry49hAXt+TLdBw4Fo7bZjTuttdGkavVdFJDUcnEJRjGjztSUOKdp6VKwFNeg9YqbZOgpjnvup/mq1weKMZ388WVr3rcc9H0x1TRxIBULHOlOlB5hPOkOZER0Mn61aWTHcmU4VlCuvRvKUxHTrJAMdNkLSYbtk0qgELMPGkd5MYV+TYUwNxZl7jT8EvM45XUciDLP8zD+YU6CSkYHAG4s3/xlmffO63sHp00SSHPPFGt7JJ5Bnlgd4jFaFHQIkSltcA+WK88MPak+6zUeHjsjucHnEg6jubdGIXEVIRRtnL26FRoB6w2uM2x2VW9GoIIOm/He8f0QPqSL4fQJSduFdSBotyhZ3xEHCj711hm5vQLZDH/EbTqwwy04TKGHYNgFP7zW/P6Wa2xpFPeq4Ek46nxBSbxnUtUohO1ibpsUSbqI0kQx4Cqhzgo/NZhJxYlzxe4/T0ZlDHbdf7PzvKxFUUnRibmTKMZknftsdv/+w1mwKFveJKoXlkt2XXUAYAl9pqCRZNP4G+9juiaN17dSiCuiXKU3F7G8JnYC3qEEiHQjsAHBXvUsjw6tgYEmnk+4SypHVb5ll4gI7Frzex14XmAqwT0mwhc44ACyoI8vZK8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39860400002)(136003)(366004)(346002)(376002)(451199015)(478600001)(6486002)(54906003)(86362001)(38100700002)(6916009)(83380400001)(36756003)(66476007)(8676002)(6506007)(66946007)(4326008)(31696002)(26005)(66556008)(41300700001)(316002)(186003)(31686004)(2906002)(6512007)(5660300002)(8936002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THdseFBNQlJHSXNCNlNUU3VoK0hKZ3hGRlNLOHNrcHRYNGJLMjY0WVl5cDJm?=
 =?utf-8?B?bHhGSG1DUmJKenVYVVc4N1g5SXEyTGRKaDF1UWYzaWdFUm9NS3VyR01GMFRl?=
 =?utf-8?B?UDZjam8yaFhZMlI3czJKQTRmUkxDUWxiUFJsT3ZHckMrWGFHaFRoWjlZVHIx?=
 =?utf-8?B?STNsTklrYlFMNjZLZXJSNkUzSVo0SEJOY0NuMHlRUXR4U2xGT1YwSGNwMk44?=
 =?utf-8?B?ck5lV2U0UjJZb012cnRBS1Q4cXpTcE5LWTNldW9vbks2cUcyWVRSc3U4cXdB?=
 =?utf-8?B?S3pjV3o2NHZZWUpFUEhhUlhJd3YxbmpON0xHOVRVT0trMmhINFlPaVJjcVlj?=
 =?utf-8?B?TWhOci85VzJqaEJRb1dkYmZFbkdGaFgzRFpyWkxXaHpFTU5OTVptMm15bmsr?=
 =?utf-8?B?QnBPd2g0Vk9veENpYzFTdDdpRytqcWszV1laY1Y2T3RQTXp5cFd5SnUzd09Q?=
 =?utf-8?B?bmFVS3RvYlhuaUZWbzZYb2VrWW94NG9CdTdQa0tiSXArdDk4WXFVRjk2cGJU?=
 =?utf-8?B?cTZjRkJ3cG9CZ2Y2RW5aNkpUcVF1a2ZJblpjTGRHcHBqY2I0V1M0Ymh4RWRr?=
 =?utf-8?B?VzBLZlpSS0draU4yNnRLRk5nT0xaMmM1QWVHcU1UUDhadFAwNTQrNG80Q2Fr?=
 =?utf-8?B?QjRiVnk1VHVPK1JOYzQ4NVA3QTI4Q3ovRHBibjBpOXdjelFlWGFyUUhkcDVN?=
 =?utf-8?B?cHF3Nm5LbXl1SGpzSmNld2FBMDRlSzJwZ0pUaXZHb1JxTUh3QWhMTUxPa1NF?=
 =?utf-8?B?WitsTk95L01rT1R0TWdnbTlWSzNrR3M0Vm44d1djL3NuSnFiN3E2WkF2VWJG?=
 =?utf-8?B?aHRhdk05ZlhVWVZVOTRFMkhVQlNabEZRY2pRTStJZndTaW1Xbk53SjFPaCt3?=
 =?utf-8?B?Q3V5bHN3RVlOeEtnWkc4TjhHTzU4a1lFckZHb010UXBCVXBwb1RDWWdFQUdm?=
 =?utf-8?B?dWR6d25ONE03QzZOQzdpYURtZnNmUllYYk9yblRraXl5YXh2di8xMm5WVmF2?=
 =?utf-8?B?dG9NVGlKVk9zNVJtQ0RwM2k1S3phKzg3T2M4cWNkTVI2SHZOT1JiUlJ4MFR2?=
 =?utf-8?B?K1hnUFY0Sm1TQjJKVzRreTIycFN4eDVnRTFNMnZkcjVGOTZWb3VCaVVVNkM1?=
 =?utf-8?B?TUt3d08zcGtPTW15bGNaaStCWGR6cXlBMkxvWnFpS0E1eERwMUdtSDRPZllv?=
 =?utf-8?B?R1ZIeDk4WENzcmpnU3dNTzlPQ3F5bW9vcHZZM0NCWk95aTJvMFRvVENWL015?=
 =?utf-8?B?TzFyZVYxSEliaFRRL040enVESEQ3Y1VtM1BwWjBGOTJTVjFsaERFWUJicFp4?=
 =?utf-8?B?T2o4R1YyV09ZTGM4WkhXRGYva0xVTUNiM0tRL2VncGxyZEp2bElBNlF5OE5l?=
 =?utf-8?B?NW9CRFMwQWtabFRvNGI2SDJKQ1JQdFZjT3hxVTY5cHY3VEdMZlBhY21WWlBG?=
 =?utf-8?B?N09ONTZxV3dHTjg2NVd2SUJzNWViN005cE1TcWxCQUI0VmgvUTNJcVhaQjVj?=
 =?utf-8?B?SGZxTTlDVnpYVUpPUWxGOVJ2QVBvc2l1bTBQQ01Ua3ZmS29rY1pPakFIVzU3?=
 =?utf-8?B?SVVPRlFZeXVUTEtsU1lWY0FZMEJJYXZnL29jQjkvb2krWHp5VEppNHJqNzlt?=
 =?utf-8?B?VnVaZ05uak1yR0ZyUmNHRm5GZ0pidm14RVovZkljbFV5VGRsSS9UUUpkWUhY?=
 =?utf-8?B?b1diTTdDdm1HMkk4cm11eWwraExsMmh3T1JqL3FFSlk5MUZtMEpzc2ZRL0d1?=
 =?utf-8?B?TkRLSDZtK043TXBUMDN1Tk9hN1AvUk5Sa2hnNFMvNXJmYmg4TUxBWHJldUlX?=
 =?utf-8?B?dkxmTmNUcXZTU2hYbm9lV1NSbGJYVkpTWWt0SEE0MU1hei9udUhEN2k0bDQ4?=
 =?utf-8?B?NVI1M3k0Z2l2d2lpWFkyYWJTdFJmTDhZRENwVXg2clFzaHNmL0JLekRsS0F3?=
 =?utf-8?B?VnNMRHc2S0ZEOHQ2VFZKSkdFVTVFK25iQ1hpd1NQKzZUQjUwbkFoa1VUSUlq?=
 =?utf-8?B?VHg5RkpVZ0N3UEY2aXBYL3F5amlhcHl4ZnRWaHNoNlpPd2NqZ0NsU3Zmak9w?=
 =?utf-8?B?WG80bGFvVk1KSHBEcFNTWVdTWDVxK05aT1ZhSEIzT1NrMUpIaHJxc1ZjalB1?=
 =?utf-8?Q?TI7Vb8kGKHlnQha/u+in+us+F?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4752880f-2031-4015-5037-08daadc11240
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 08:49:57.4094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lGtVTp0nOI5g5YrEXQ6sE7cnj1aBeEPnWXZ8PP10jW/naSMXWvlvRn5IHkosqe/fKkDpYHUwHPddxAYHv0M8Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8485

The addition of a call to shadow_blow_tables() from shadow_teardown()
has resulted in the "no vcpus" related assertion becoming triggerable:
If domain_create() fails with at least one page successfully allocated
in the course of shadow_enable(), or if domain_create() succeeds and
the domain is then killed without ever invoking XEN_DOMCTL_max_vcpus.

The assertion's comment was bogus anyway: Shadow mode has been getting
enabled before allocation of vCPU-s for quite some time. Convert the
assertion to a conditional: As long as there are no vCPU-s, there's
nothing to blow away.

Fixes: e7aa55c0aab3 ("x86/p2m: free the paging memory pool preemptively")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>

A similar assertion/comment pair exists in _shadow_prealloc(); the
comment is similarly bogus, and the assertion could in principle trigger
e.g. when shadow_alloc_p2m_page() is called early enough. Replace those
at the same time by a similar early return, here indicating failure to
the caller (which will generally lead to the domain being crashed in
shadow_prealloc()).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
While in shadow_blow_tables() the option exists to simply remove the
assertion without adding a new conditional (the two loops simply will
do nothing), the same isn't true for _shadow_prealloc(): There we
would then trigger the ASSERT_UNREACHABLE() near the end of the
function.

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -943,8 +943,9 @@ static bool __must_check _shadow_preallo
         /* No reclaim when the domain is dying, teardown will take care of it. */
         return false;
 
-    /* Shouldn't have enabled shadows if we've no vcpus. */
-    ASSERT(d->vcpu && d->vcpu[0]);
+    /* Nothing to reclaim when there are no vcpus yet. */
+    if ( !d->vcpu[0] )
+        return false;
 
     /* Stage one: walk the list of pinned pages, unpinning them */
     perfc_incr(shadow_prealloc_1);
@@ -1034,8 +1035,9 @@ void shadow_blow_tables(struct domain *d
     mfn_t smfn;
     int i;
 
-    /* Shouldn't have enabled shadows if we've no vcpus. */
-    ASSERT(d->vcpu && d->vcpu[0]);
+    /* Nothing to do when there are no vcpus yet. */
+    if ( !d->vcpu[0] )
+        return;
 
     /* Pass one: unpin all pinned pages */
     foreach_pinned_shadow(d, sp, t)

