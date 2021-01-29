Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1299D308A28
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 17:18:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78281.142339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5WSv-0006gU-4c; Fri, 29 Jan 2021 16:17:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78281.142339; Fri, 29 Jan 2021 16:17:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5WSv-0006g8-18; Fri, 29 Jan 2021 16:17:45 +0000
Received: by outflank-mailman (input) for mailman id 78281;
 Fri, 29 Jan 2021 16:17:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sDuN=HA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l5WSt-0006g3-Ia
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 16:17:43 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3044b83c-d96b-44ca-92dd-24529ac1c1f1;
 Fri, 29 Jan 2021 16:17:42 +0000 (UTC)
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
X-Inumbo-ID: 3044b83c-d96b-44ca-92dd-24529ac1c1f1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611937061;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Lclm+FXcibtWb/ZX9wTP/meuPs9bj5m8+jVcX5Z5tjE=;
  b=KEHV3KdF7mfmqmkPka/LrN1zsid0BH0nWQT7WoIZxHB2zoCq/RhrsvKy
   nvLj4/YXrsAVvzluK5obK6Q+MjFIY85/EUBs9tj1Y5FAkk+97RvBA4y5Y
   3pbDL3tqZlgkPhvKIHC9GF1I0ujfcTlkft+Xxr2TOgHPzy/8hSgWBZZCr
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: rrS97hm0DG3MbEQSIal1Y45RvhvmJHAUkgskkmzYr+KnRFdSnhsX7wJVjeDo1L41fbfb6mgH6b
 pMUgjR9z5Weee9kjtGBIiFWemeUkU/3EFR3ASEBcFdHg6KTwggsiYfKbU4Y26DHF603vG2QTh+
 d0QHxwXKU4GPzxwZ0xYjYqyKcD7qW7sOipUbOLmqEeuZG9qWI61D/iOsssvQMNCDQrKVIxAnPD
 5sMkn6d33tOugaG+nqEpUZIGL6JzzGh7ltoPqtDsIDCQDn4JOUewMT7A4R83mefNFn/yGEIysO
 1fk=
X-SBRS: 5.2
X-MesageID: 36162915
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,385,1602561600"; 
   d="scan'208";a="36162915"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CV/8S6q1i6e12ZqJ5OYLXD1OHtjjeHgrBYp1y7LFc7VWPTbT2GD+ROg2ujQZtfhWbqPt6EPC47m2TfXuXBJSjROKO2BkzJ//cQVdr7vFIf+i5A2GXyCKqglcCZRemQBQlWkbXvyMBEVNSc/nPA0bO1ANjLxuwdDSrArgXROx/5baXUhZJ5BGoKsUwivHnLvye6WpbQcxXDfgJqQHUFmiCYJhrSW8t30xYWsGgVNfau3JcjKGJ8F3N0cg2r1sj3/rMMQaSVlwJR6UPVqzWyy0m7Mnja1Crv8QjYZT7ijGiQrNINEv1Yz3vuncY7b7c+m/7AmppVzZDQqz8/89jBrBaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lclm+FXcibtWb/ZX9wTP/meuPs9bj5m8+jVcX5Z5tjE=;
 b=ix7pBt/WRE6qlQbzYQLlWKrXyJIBkKa0SIORc0umKt5cnw1k33Cl7EY3zA6SRCm0lx/paPNlLFYVsL17giWbjrrC/dqRqLl9QfIbxwme3O+xt/C2PpLfGdRkzHtXjaeMCr6Syln70ol1A00KOAyTnINstduV/89MkZEhrEo3bnFl5ZGvLxXFqFFmzqU5HyaDGkPPKAjJQUYsnu8OYD1KnDlLiD1eJlmjBlI2MMOoUuLHaBuabH26Rw6R5uJ7a8IyXMy4LthRfWLqwgVJUeqgZaUojL+iQ3lkz4HpSUmMSuOEIUKwIHkzo1YFpEjPcFfQKTG0kzU3VLytv+6xrzNCvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lclm+FXcibtWb/ZX9wTP/meuPs9bj5m8+jVcX5Z5tjE=;
 b=bpj7h12ZxmtxLgPwuK4W5ooSnfhdQBD7yComK5eirgHRyt8Lh59FO9gffGmgcnfnztis8l5/LFWPR9BYbIFqRBdPDX3MnHJlYdHddlvtFGgNsg8bA4I1a8orejaYQTmfDnkC0cga1IGq2+wvjOXDaTQlp1jDwlDwfwy6bPG2ETg=
Subject: Re: [PATCH v3] x86/mm: Short circuit damage from "fishy"
 ref/typecount failure
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>, Tamas K Lengyel
	<tamas@tklengyel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210119094122.23713-1-andrew.cooper3@citrix.com>
 <20210119130254.27058-1-andrew.cooper3@citrix.com>
 <98f64276-ec5d-7242-f10f-126fe7ee1f7e@suse.com>
 <45f5d1f0-1a89-706f-f202-91ddb1d8b094@citrix.com>
 <dd59ad75-c0f1-4d14-a0b6-06dd9e095b36@suse.com>
 <0c279f99-e74e-ced0-4947-b9a104160671@citrix.com>
 <a2ea0bc0-3644-a2c1-c0b2-f3085b1aa0b5@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a0456589-4626-fc51-d585-9159d6ea3010@citrix.com>
Date: Fri, 29 Jan 2021 16:17:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <a2ea0bc0-3644-a2c1-c0b2-f3085b1aa0b5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0333.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::14) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2e8916d-db71-4644-e18b-08d8c4716514
X-MS-TrafficTypeDiagnostic: BYAPR03MB4725:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB47250AC6FC12D91B7A777D8FBAB99@BYAPR03MB4725.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KVULnFiUS8BHW7kMjP53nepWtUgLR3SWcpBpLzuAU/v6DO3DMulPSH/8NEvqVxLLOC4DRYKAjqRD78ky8CrW0COqScg5yvkDJrEKy+DJFJbslX5vZqkzpEOBVgkBoHRdpKRBdVg96XnCzXOiL09AwjAuKXVDJgQmJHq7yZvpjPQswDyzuyelYhppj8f0i7g4kv479TcQLb3+1w4XoJId3LcryNGKMNqb5c/wolbUdEW6CtUazTXXjqpD8iZp3wvL6z6ebx+nI+9MN+HUW0sevHAKsaGmeLq1nr87U+NlRHhnFE/L1VYUuQY5IiloOU++cm9kfhyXuA+tQzuqWTQCb0VG70ES/0i7SCx1Agz76MYilvmRH4qXaCxeXOVJvn6wkIKgu0HhcSt1pRlzOwS+i1JAf4cbiB4V4jTwDRTuw5Iil7V2uDO8mpd4r9L+ksMW3FWFPMUOlyP7AJu1vW31eR1Ol0XcWv/OsLuMh/yjTFrUNXeugq05lZx9ss5kr+yvxFWjhBklDPtMK3+Nn5X7UsFZV5bvtSC/LXJPmG95fZeZUQYkVGzin7M8Mn6TSFnVPqLprL21ryX5sXEBiJsFaegw2XKlqMKU6dEeMZFbShY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(136003)(39860400002)(376002)(6666004)(36756003)(478600001)(31696002)(8676002)(6486002)(8936002)(53546011)(5660300002)(83380400001)(186003)(6916009)(16526019)(4326008)(66946007)(54906003)(26005)(316002)(16576012)(86362001)(31686004)(66476007)(66556008)(956004)(2616005)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OXFWQmIxZTNiRlBFMWMzQm80YUdnRVNlaWIwZFcrZThNbnBMRS80RUVTUmtn?=
 =?utf-8?B?bVB6MFFMU0hoZmxIWjlPTHpQTEVjbDFVL0RRbGNlMmpqc25yeFp2L3JRUDFV?=
 =?utf-8?B?dWJCL0t3bkQ1bEg4a1ZsbXc4QjVmZExIOFhESGRCNi84K3NNK1Njckt1SDVS?=
 =?utf-8?B?QjFvSjlQTnQ3VGhRZzd5cDRtTGVWNTdUZ2NkaHNUWlFFanN1b2thK3lCL0xt?=
 =?utf-8?B?VFk4d2VNOE5uS1kvcUh5S1VzUzIrWVAyVFFNZ0pJUkxEM0QwUEhRRHcxci9Y?=
 =?utf-8?B?dmg4a0hCeHFZQjR3TC9Ddy9YYU80emJINTlNdG9FNkFKOURaMk9GcjN0QnBa?=
 =?utf-8?B?SWdhWXUrWnhQdE5XcHN6eTk3dWlIbkU3WmRyb3hDVFFUWVoxRkFoRFQ3TXhJ?=
 =?utf-8?B?VzVuOGF0c2VOaldaMWxidm0xbkxpcWh6UHBiTXZaR3QyQWx1b0daK3czdDM4?=
 =?utf-8?B?N0owcnpvRloza2RuYzcvRG4wWVl5YVZFaVVYZ2gzUXJSY1hFNG5Gb1A4UHVr?=
 =?utf-8?B?OHJQdEhveXQwTFYxQUU4cW4zRmVSSjdvS0M3bGw2RWQvS09qTXZwQXZrM2xV?=
 =?utf-8?B?SUJXUytVME9UMURvRkRndGJiMFRQb1VLS3kxL1R2RDRvdE15SGlDc09nZ2pZ?=
 =?utf-8?B?V3NxTkJhSzBJaVlaVVVSS20vZUcrTmRrZEVJSEVLNDlQTGlZUHZlVGQvb0dw?=
 =?utf-8?B?empuM3ZEVnVjTks1aWloQmlPV3RqeVNpQW9KdU1hcEwvNmc4YWtRSFl6SXg2?=
 =?utf-8?B?VTRDT2ZlRk43SW9XclE1UktyYVBYaUZjZXVYZ3EyWURlVURSR05zUDRsKzFK?=
 =?utf-8?B?eWh2Wmt4Sm1uZk1kOTUyVnJLSktIOExkTnlqRThzVzdHMEg1NHlPeWpuMWhQ?=
 =?utf-8?B?SWN4ZHVDWVlkUDdWbm9ieWdIcklxQ05DWGEwSW16enFoMlVLZGs0TmV0SUJW?=
 =?utf-8?B?ditIdkNTaVd2N0hGOFp1QlZqd2V1MEx0NTR5dVpSTEwwMzhvMHBuTXRJcFlr?=
 =?utf-8?B?akdwY2k2bWM1b0dZdnJoOHRHcTBLZVZsMEtyTEtqcCtlalgzTXhaM1NQaWdo?=
 =?utf-8?B?Z1FlRUJLWGdaMDB3eHF4cVVMenZ4MmtRVmhna1MxOHV3dUVTRG1hN1R1MG5X?=
 =?utf-8?B?eFg1YmtJbjFJdTBVOTF3aVBBWjhYNlNIT0JuMWRyQk50VDYvQkpoWDMvUE1z?=
 =?utf-8?B?ajJJMzRKeS93OEplRXJHY0s2eUNsYmdqV1BycWMwdTdXa05WaTJjcmdTeTJl?=
 =?utf-8?B?emdPbXpFb0ZmWGVmSVpyWVBPNWxIZHEvWXhTTUZES0h3ck9VTmc0TGtPaXYr?=
 =?utf-8?B?SWNnRmFoMFJ2M1kwaG9jUEdmaTdoQm84Q1NRQ0d4ZzNiVmpuNjJ2WUVZekJy?=
 =?utf-8?B?Z3dFVXpiREFYZXNES0lPQTFHejhwbWZLWVBybHduRk1ZTXVNVUU4N2ZEaC9D?=
 =?utf-8?Q?F1oNm5aK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2e8916d-db71-4644-e18b-08d8c4716514
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 16:17:38.1289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VuC2gOVPIPERMoxyam2N1s3Z05aNna+Dnzt61YMlz2bax7KkpY8iB6cXZ6cnm1SNcsKDkC2N8Q8Y2CqJSLVaSoDaqGJyh9FqQi7Tfjbs5Nw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4725
X-OriginatorOrg: citrix.com

On 29/01/2021 11:29, Jan Beulich wrote:
> On 25.01.2021 18:59, Andrew Cooper wrote:
>> On 20/01/2021 08:06, Jan Beulich wrote:
>>> Also, as far as "impossible" here goes - the constructs all
>>> anyway exist only to deal with what we consider impossible.
>>> The question therefore really is of almost exclusively
>>> theoretical nature, and hence something like a counter
>>> possibly overflowing imo needs to be accounted for as
>>> theoretically possible, albeit impossible with today's
>>> computers and realistic timing assumptions. If a counter
>>> overflow occurred, it definitely wouldn't be because of a
>>> bug in Xen, but because of abnormal behavior elsewhere.
>>> Hence I remain unconvinced it is appropriate to deal with
>>> the situation by BUG().
>> I'm not sure how to be any clearer.
>>
>> I am literally not changing the current behaviour.  Xen *will* hit a
>> BUG() if any of these domain_crash() paths are taken.
>>
>> If you do not believe me, then please go and actually check what happens
>> when simulating a ref-acquisition failure.
> So I've now also played the same game on the ioreq path (see
> debugging patch below, and again with some non-"//temp"
> changes actually improving overall behavior in that "impossible"
> case). No BUG()s hit, no leaks (thanks to the extra changes),
> no other anomalies observed.
>
> Hence I'm afraid it is now really up to you to point out the
> specific BUG()s (and additional context as necessary) that you
> either believe could be hit, or that you have observed being hit.

The refcounting logic was taken verbatim from ioreq, with the only
difference being an order greater than 0.  The logic is also identical
to the vlapic logic.

And the reason *why* it bugs is obvious - the cleanup logic
unconditionally put()'s refs it never took to begin with, and hits
underflow bugchecks.

For specifics, a simulated regular ref failure:

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 1051d86a20..314d258e31 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -171,9 +171,14 @@ static int vmtrace_alloc_buffer(struct vcpu *v)
     v->vmtrace.buf = pg;
 
     for ( i = 0; i < d->vmtrace_frames; i++ )
+    {
+        if ( i == 0 )
+            return -ENOMEM;
+
         /* Domain can't know about this page yet - something fishy
going on. */
         if ( !get_page_and_type(&pg[i], d, PGT_writable_page) )
             BUG();
+    }
 
     return 0;
 }

and the simulated typeref failure:

diff --git a/xen/common/domain.c b/xen/common/domain.c
index db845ccc81..bd810157f4 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -172,8 +172,16 @@ static int vmtrace_alloc_buffer(struct vcpu *v)
 
     for ( i = 0; i < d->vmtrace_frames; i++ )
     {
+        get_page(&pg[i], d);
+
         if ( i == 0 )
+        {
+            put_page(&pg[i]);
             return -ENOMEM;
+        }
+
+        get_page_type(&pg[i], PGT_writable_page);
+        continue;
 
         /* Domain can't know about this page yet - something fishy
going on. */
         if ( !get_page_and_type(&pg[i], d, PGT_writable_page) )

both yield:

(XEN) Xen BUG at /local/xen.git/xen/include/xen/mm.h:610
(XEN) RIP:    e008:[<ffff82d04020423e>]
common/domain.c#vmtrace_free_buffer+0x57/0xc1
(XEN) Xen call trace:
(XEN)    [<ffff82d04020423e>] R
common/domain.c#vmtrace_free_buffer+0x57/0xc1
(XEN)    [<ffff82d040205497>] F vcpu_create+0x245/0x32b
(XEN)    [<ffff82d04023ae5b>] F do_domctl+0xb48/0x1964
(XEN)    [<ffff82d04030c6b2>] F pv_hypercall+0x2e4/0x53d
(XEN)    [<ffff82d04039045d>] F lstar_enter+0x12d/0x140

~Andrew

