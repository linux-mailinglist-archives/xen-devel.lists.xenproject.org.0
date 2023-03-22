Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE3C6C4683
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 10:34:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513233.793954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peuqu-0000kd-Tg; Wed, 22 Mar 2023 09:33:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513233.793954; Wed, 22 Mar 2023 09:33:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peuqu-0000in-Qw; Wed, 22 Mar 2023 09:33:52 +0000
Received: by outflank-mailman (input) for mailman id 513233;
 Wed, 22 Mar 2023 09:33:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peuqt-0000ia-Lt
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 09:33:51 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061f.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a70011cd-c894-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 10:33:50 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7526.eurprd04.prod.outlook.com (2603:10a6:20b:299::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 09:33:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 09:33:47 +0000
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
X-Inumbo-ID: a70011cd-c894-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SBuxzecA0NkWJKAp/RM2UyYtDqeyoMPTjyo1P0Z8RmAu0iKNTyDz+Bp2ancdTCbHsxSGkuYBJTOo2t3fAXk7X6rBZ5ycy4Y4JIeEMYWD0r9AYSWv61XoEqU0Y6rfTCIaatUUaYxjYSIpL7CCtnAN9N6VF/IRqryOGngK7h2lORu2GPXKrGcG88XkKNPa3tG4IPgQ3XMp+bD5BogOfasVZYpmCpFUbOKnqx34Ch3pvgpzksXlXVfbThjOkniPZwhdPIqyhB4UBGlv4a9iiyPGI9JMFf1lodA/X2z8P774fGOmirqNuftfY6vkF8eiN0ndCtd9lY9c6DrA0Uk84KnbDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2tWy5kxwOmE8Z2wFPJZdCsRPw6lxbt7ejpBm5kqUhA=;
 b=mBtu9VxUXRwebVWE/GZ66pDUGKLXjhiTbDIQh4v0AguD9mL1Wxc5oFhLGNNnn0i4G/gmMaNTjDENbtPsdkbntVw6w4xE0LRR5fCoAH3n/TLjQ0dUZTQ/bmMFSzzAP0FUVkkdxz34CZWFm1nYGHqnMfYcS44d1/egex9yxo5/uz+JBXUOwYqkXx9wZIMV7f677FPQcfhSth+YppGVQtYAES9Oy5K0ThJZwO3+kb1m2i0k0mWKBqoo/8Orks7bFVwzh/tWOzMi+12wbneHiEFALkDRYsRfdL4hq+MNW2ZaJtzgxha4t52qV+Pebn6l1+mhbl9D4sxVkJQHc6ZlJwF1uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W2tWy5kxwOmE8Z2wFPJZdCsRPw6lxbt7ejpBm5kqUhA=;
 b=E5dzPowDwy5PQ+xx62IWeaPzzi0n0ZSKu5/FW2WRGND07j9EMCidab9BEhTo7IocSh7xXcxtPdcNltjvxgN/Iwd/AZ3f5QHy52X+ZT203iZ1WXQv+p31dm3+C0dLQbujuJdnsgsLRzUTtLYUrCvta/2RRrSle6zTc9qrayEE/C5I/GjLnLwuJEfXjdBjJIYqI7hlW6i2UCoJSuzqJqKGtlyCBEJiGa39EK2+hG6Xn5BhVOgv8xfmnAp5hMHz7RjP3F9DOlibib2kIw7PKgEMFms61YW8QQxXdSa+SFFJ60ntH8dD8CK2IgGKuQvyyHg394qiwNWxDOlFah4NE/Qyrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <69304929-de84-04db-04f2-8faffc12ef0f@suse.com>
Date: Wed, 22 Mar 2023 10:33:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: [PATCH 07/16] x86/shadow: call sh_update_cr3() directly from
 sh_page_fault()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
In-Reply-To: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7526:EE_
X-MS-Office365-Filtering-Correlation-Id: bc923ac5-cb9b-48bf-99fb-08db2ab889c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EysTtd/3pgeo1ZYoLYIwHcoO04x5hn8AIzocWZI2rvxSmh1c0J1Flf1abOO/3zymQIEmf89QLX92NTbM61NnZA44qusu/KomDz+tHe8dqW6A1dzlVJVKdvluPWGqbJNGVa+KxSBZW632rkSAoZ6QfS2yuyOETRJ8Na+Y3/AGlFbltDYqnhaXE0sLshFU7fo3MVttK+8nNNFYjS5b/JcMDNhTiuFu12A3UCFsH5Z2RNVRajEf/5T+VR3UKP6iunb8nxG5i3cCWrOMH6qfVo9yTarRSFq3Ab6xdNAINVL3zauk2hST2aRD+Xzy/TCoD/9bsVT4pfAdCJMjMpcUFks7orS6anMPstxdbfomXluC9rvhakNSxrBez5rS4+d1ZGmyYGBAOGDKxI72h9yXxR27QE70UV8smPTtdDmw25xDHNTG2/UjTFaEMwoG9rlJiiHVR7DnqbXf+J6P0bQ4UbBNUuRbF2i3dvTFuroyqX3XfK1Myp0jQsT2qgg2rhofgqs4a/8DmDO6CCWjKMDi5IZa75CgEuvPFy7XzQYSbM+pis1qMrEUMnLccR++1b4I0jjuuSIvA620YpcOhcPruko4XDHTT6qMzBHSaDuxN21AzqdXOx1GSP7sv6vJIXNM5yGfxu1SmTTTaf1uT3JitnROfDwaYh6wmexa/HMGFANlXKYYgVBMIvgI5fqdjPCXcN5yf24iimCK84Cg6DIziuQJbXSm5O2ZhCgpf8nj4kT30OM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(39860400002)(396003)(376002)(136003)(451199018)(5660300002)(41300700001)(86362001)(38100700002)(8936002)(31696002)(36756003)(2906002)(4326008)(6486002)(83380400001)(478600001)(2616005)(186003)(6512007)(26005)(6506007)(54906003)(8676002)(31686004)(316002)(66946007)(66556008)(66476007)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUFFSGlPNTZMcjJrRWdObERJQlFVenNmdmxmMmx2dk0rcStsR01SaXVGRyt0?=
 =?utf-8?B?Vld3aDYzMzl3Tzg5UEhyV3MrbERzZFFWMURNZHN0QUhKN05QbXZpT2pOSTZM?=
 =?utf-8?B?NUQ3ZE1ZR21HWWdiT0xlQ3hQdk1xdGt4dTVLKzNjSGxVNXBKTklyOVFXRjJZ?=
 =?utf-8?B?SHpENVRiZFZJbXpYNW1pOVJYd3pORkdxZjhndUhJaCtzVXJGQy9ia04xTVZl?=
 =?utf-8?B?MmxWMHE4R1NhVDI3TGJKYjRSaXBvUEdGVVR5Rm4zWkt0RUM4eGxic1hzSDRY?=
 =?utf-8?B?dHZzVHNMV2FWR1pFZWhqbitCVlpIM0xsWXJ5MGM2N1c1Y2tnbWpPOVZnT0Nt?=
 =?utf-8?B?VGQ0YmxidmRMbDFqYVNITGxOSHFPbGxoWlJSV2lCbUxzbTFaV1hTeEx6L0JY?=
 =?utf-8?B?TjRuZWIwSFZuWW9oUUdhRDVDRTFDNWgxNi84L1diMjgvSVRwdEprbG02V0d6?=
 =?utf-8?B?djFuMWprTmJMRStUNDBPMnhZMmNnNXJVUkV5bmRpU2xpL1FQSUFEYmRuSnRC?=
 =?utf-8?B?K2tiUWFHZGlmRHNXL3JDb21aWkVpekpvR1pMZk9oMWhuVFhlM2tiQzMwWUZD?=
 =?utf-8?B?Q2tmYklaeXR0WjJMbWlYbmZYSmV4NkhPalVFNk5oOEVEVEtTcmJCNS9IZzlX?=
 =?utf-8?B?M2lZb3h4ZDYreGNwQkVCaWIzZVJManh0Q3Nib0hXR1hHUlhseCtaeHFTZnVO?=
 =?utf-8?B?SFBVbUVIMjNxTW5sT25IQ1VNL3NSTHVmendBd1doK2JVZHNmTDBCNWd4SFcv?=
 =?utf-8?B?THQ2ZEE1UUZTSC9vdVFhYVpZMk9VUllBYUQ5b2E2blFGSnZuQzBreWNoeW5G?=
 =?utf-8?B?d3VXL01sNXVYWTRrZGhia3JVS1J1Zm9BeFQ2Z3orM25Lc0FzOGdpdk50eXBH?=
 =?utf-8?B?M0I0Q1NPcXVpNnJaaDBnS1BGUmdkaEhyeU1GWUZBbjNYL1hmQndTalhhbnNw?=
 =?utf-8?B?c3FjMzlkbW0yQVRIR3dlcnBYVzdVMU9yUHdNNldXb3NtTGFCakh6bDFEKzRV?=
 =?utf-8?B?T2lZcE9RM3FhZHZxN2ZpK1Z0NGRVQm1jemx1bDhzNXVIVWJNRnJjdDRhUHla?=
 =?utf-8?B?eHNaTHlDbEJkbHVLd0ZnU09ZTWtNMTltVVphUkovSXE1dWwxcnFBTG4xUVZs?=
 =?utf-8?B?eEZBb0NLLzNpSlcvSzJpWm4xWkZRVElmdFJ3VnNsdWpIcTVDaXFJbG1lUkdr?=
 =?utf-8?B?QTZIUWM2Lzl5djZqd0dWYllxdVdZeElzZ3dkZnVUU29ROC9jOEtjbEJ3bDNt?=
 =?utf-8?B?bTNBSXRxdEhobGZwNDBEV0hlWXYyU3NNaThTNlRXMWhSTXM4NDk0cVBoK0VZ?=
 =?utf-8?B?V2dPSFhFOFV1aGxxSmZ2Q09EME5yaitlM2F3Z3ViUFJKUjU5NkoveE91bXl4?=
 =?utf-8?B?Qjg2UU0xbjJSZGxmTk9jOS9vL2k3NXRIR0JBQjVFN3B6UWN3YmJWN0FLQWdF?=
 =?utf-8?B?UENTMGN3SXovS1VVSHBISzVza0YzcWtUSVJOS1lWSXhESWVWazZWVjA0aU80?=
 =?utf-8?B?WU1nb3pxZko0YXlZUFNSUmVVekFFL09iVXhaSXQxSUhuN2o0WVdsUTFHQkh0?=
 =?utf-8?B?WUhsUUhYZ1FTR3ZEaDQwYUFmSlFpb2RpWDJIcEN5QWJhSlh0S2hycUtSSTBv?=
 =?utf-8?B?WFRhd21KYUc1VWd4Qks4Ynh3RDNpRVFJMkVzQW9ydzVWUkRkc3JyZytJUDc1?=
 =?utf-8?B?aXBqWVpEMUtrbUo2QU82QXJmY05IMFllc1FSYmdtUW9JSlhoalNWU1htUkhS?=
 =?utf-8?B?b2xKcDFHV3RiS2F2R1hQRkcvYS9nbFBqUE16aHBRWEhkblRZcmR1WXp0TzZi?=
 =?utf-8?B?OThwa3c4bU9mK1hhcmdSdDlmVUlGWkhMdXJkaVQyaTlBc09pZlpMbFZCUnls?=
 =?utf-8?B?U20yZzg5T3FVU3J6UTZTV3BiU2RPV0NsZ1hwVEdyWWZkWnhEUlE0RmFTRDc4?=
 =?utf-8?B?SDVseTBnUkZpMUhDNnVLWFJ4WVFVbGZ0a1FKcnhYNVEweFNIajJ0M2kycnRB?=
 =?utf-8?B?V1p2Q0xoNU4vMmRnSUZhSE5weE12L2FCZExVSVZ3RElsa3gwMnFFOUdBQmxM?=
 =?utf-8?B?UUZGL3pabnZneW9tdUh6NnAwdEpVR3ZnRnYrWGhPbTBzaEc3WmZuS0szamRY?=
 =?utf-8?Q?PgLdfmttPkGRQglTJWaSQVQnM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc923ac5-cb9b-48bf-99fb-08db2ab889c1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 09:33:47.7978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JReScfU8v4w5d6SKwFoG+32g/OMulO4ZyH77TdSbXvcEoqAEd3D8DoWleNB/quWDJxswgmiVlrLbf4JpYHJupw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7526

There's no need for an indirect call here, as the mode is invariant
throughout the entire paging-locked region. All it takes to avoid it is
to have a forward declaration of sh_update_cr3() in place.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I find this and the respective Win7 related comment suspicious: If we
really need to "fix up" L3 entries "on demand", wouldn't we better retry
the shadow_get_and_create_l1e() rather than exit? The spurious page
fault that the guest observes can, after all, not be known to be non-
fatal inside the guest. That's purely an OS policy.

Furthermore the sh_update_cr3() will also invalidate L3 entries which
were loaded successfully before, but invalidated by the guest
afterwards. I strongly suspect that the described hardware behavior is
_only_ to load previously not-present entries from the PDPT, but not
purge ones already marked present. IOW I think sh_update_cr3() would
need calling in an "incremental" mode here. (The alternative of doing
this in shadow_get_and_create_l3e() instead would likely be more
cumbersome.)

In any event emitting a TRC_SHADOW_DOMF_DYING trace record in this case
looks wrong.

Beyond the "on demand" L3 entry creation I also can't see what guest
actions could lead to the ASSERT() being inapplicable in the PAE case.
The 3-level code in shadow_get_and_create_l2e() doesn't consult guest
PDPTEs, and all other logic is similar to that for other modes.

(See 89329d832aed ["x86 shadow: Update cr3 in PAE mode when guest walk
succeed but shadow walk fails"].)

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -91,6 +91,8 @@ const char *const fetch_type_names[] = {
 # define for_each_shadow_table(v, i) for ( (i) = 0; (i) < 1; ++(i) )
 #endif
 
+static void cf_check sh_update_cr3(struct vcpu *v, int do_locking, bool noflush);
+
 /* Helper to perform a local TLB flush. */
 static void sh_flush_local(const struct domain *d)
 {
@@ -2487,7 +2489,7 @@ static int cf_check sh_page_fault(
          * In any case, in the PAE case, the ASSERT is not true; it can
          * happen because of actions the guest is taking. */
 #if GUEST_PAGING_LEVELS == 3
-        v->arch.paging.mode->update_cr3(v, 0, false);
+        sh_update_cr3(v, 0, false);
 #else
         ASSERT(d->is_shutting_down);
 #endif


