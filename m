Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4DF30296E
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 18:59:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74243.133405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l468w-0001Ks-4M; Mon, 25 Jan 2021 17:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74243.133405; Mon, 25 Jan 2021 17:59:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l468w-0001KR-0M; Mon, 25 Jan 2021 17:59:14 +0000
Received: by outflank-mailman (input) for mailman id 74243;
 Mon, 25 Jan 2021 17:59:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F5Bc=G4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l468u-0001KK-SC
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 17:59:12 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ab8d42d-5a6b-410d-b2bc-aedd2748a981;
 Mon, 25 Jan 2021 17:59:11 +0000 (UTC)
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
X-Inumbo-ID: 9ab8d42d-5a6b-410d-b2bc-aedd2748a981
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611597551;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7oor4WSttdgqgfmJHFltiV8nncWX5IH/D45bE5zwbhg=;
  b=Kg6k+zvI15L14v6/FPlQfRwYQPelVHu+uqPYNSYNXdflHDajIdJS91y6
   dXqy/K11bGvPFyNYnjrm2R3n3nJnl2W80teL/iYxCSjg2fvV07ZmOsRYZ
   BS5LUeGgVakiVnde+se6rlJf/ccDZA9vD0rNPHkXvtUjbCDYGXVz51v7B
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qsBeJ5z774Ajkvi7nyUysousjv3pLHJWqRoSg0TW/yAE6In9JJiCaMWzthQ7STVH03/enx4B45
 ilfl2baRFG/B4pMhLf4/Zhv9YgAKC66kUIzIYz03nSG02OWMC0VtZu9Ga8MJCk3iJ4U6SSPf8e
 CROXY5yt0iFuQXKFKnsYBaPy3BRKIK+FsYyFcwmggdkV9yuLsNmbgUq+g35PbsdVtL+809xlZO
 /RdDIbeeSTXf07vk6KNYuGDVV+vFP7k0ziALQhqbom+PwX9IzMjJPuviRxRFs9Mqa/exkxTsm1
 0/0=
X-SBRS: 5.2
X-MesageID: 37120642
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,374,1602561600"; 
   d="scan'208";a="37120642"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KqJxvNS6exAM1P9tDNi527rBRu20f+5WwxYFk9Q3NMQdKj1IsxwAoiAgotK0SpP8fyi+6MY0wjJoyP4BV4Fc6gEybffDTFnb7vgLQ9wnOf6n67bw0ekj6kaogQ8bvH1MYR8intp2xRWx1zRhAlt+e5pzkey242PgR481WdvZg/CCJBExZN4LNUaAyvyms2L3mmKp2HlHyiaR6ZtK5Gto/5p3zGyg2dEkUyTUH6eE3EnTIo3JbJyEnqX1GrVkn1lt7ZCX7czJxBRZVuRZfM2VbqD8VT/VBMguUWPruJTeGqJrDuXSb856SC+3I27vSlHeEqsSLqS7xMeYfZ9GOZ22Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7oor4WSttdgqgfmJHFltiV8nncWX5IH/D45bE5zwbhg=;
 b=mMcU6Y28f7ZVs4qpZC3qBefxAoaD0QxFn66JGGo0eZ9FseYKY/UkCbf+4qT3Ml4ZDOnjaeAtv6v3EzuzZsHA2ZMm+5ro+ZZu4/smVSluDc4UKHcxyIz1lwBFdv5fSjCJUpREPCI6mYCiCK2y5Uh8O0IJ3b7kLNd/fv1d7duopHw9TjbWlPOzh1goXzaBwm2B6h4RqJ0WUKjA4G4/grbVs/ghIUgmZRbxy0l4eUKlXOzZIoF5j2JThjHdb/ThT4pCWJDSb8sJJh1Dp2HdxHpH/zYWIE3NKpnhI/7RSjEjoz1wyahNu6FUQ3HTvSPrB3GBbVQKayUsdaw/JAS/jqClaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7oor4WSttdgqgfmJHFltiV8nncWX5IH/D45bE5zwbhg=;
 b=k+PkAzw78hzTt6wMoc/sOvA4rPSD0DSncOwzmH4jSekorZNeF0mDFFqnFAY856lj/+zCV6E+kiZG0ewZIs0+Gqt0LuhA1+EMMtknQEl/iJP9deAWG4idRYHc6eYXsNNXpLD8KkK/PSmkPpZzbYKBREKbZd0s/u8NlD9/VlgfcjY=
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
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0c279f99-e74e-ced0-4947-b9a104160671@citrix.com>
Date: Mon, 25 Jan 2021 17:59:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <dd59ad75-c0f1-4d14-a0b6-06dd9e095b36@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0496.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::15) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 906466ce-7770-4921-dc94-08d8c15ae9da
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5424:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5424446CCA2898694A69A653BABD9@SJ0PR03MB5424.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OLC8UPCYcaOT3kOBpydn6F7uUOzaaJwS56iTsH52FAyvzgjTr5Xl96514IPXeUGOX1hXVTzQXJMdjeRSy9Yhz52cWOXzkU2M/QyA4khKx+QVDM6/kPOX4OwO6AcO102o9TnA21dhCYKBLwtCeiy6hSPKDvcQo4TdXWAAT4QXuAU4gbmkH0ZWrr9pS4aSq38Dbqz8M7rq9qVQCLaYTaNKBt/1hhmiCB+/pY97eIgqlwndKo4Jo/6gXcrtT3si4sPGJm1ToiN0qylG2wXFCwVJWDUr5SjVUTD6V6d6Xun2uwB9Izz3Jwxde/H4R7B/eAwO87rjDUJSAT92HrprcREFg4MqHf/TkGf4hChvnfrpPZJMe7ShnIz7CLvc+uJJQoqEqfO+DYfGwX+tUDDR4GwkxQ+BxG+TEm/ks+GrlKRLDuU+HoUX2RfBYjvxfhATaWaK0DVPm3AwNx/h+51C5ZJoM5MQEziFslp2PQwSxhHp9bY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(346002)(396003)(366004)(83380400001)(6666004)(478600001)(66946007)(6916009)(316002)(31696002)(66476007)(186003)(54906003)(8936002)(5660300002)(2906002)(26005)(2616005)(956004)(53546011)(36756003)(8676002)(66556008)(31686004)(6486002)(86362001)(4326008)(16526019)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UVVKTWF4OEYvZmxac29SbEtvdmIzNE9wYXI1SUlIWGliZzA3THgyUGVNMkpH?=
 =?utf-8?B?VWFma1J6aHE4YU5xUTdlUXUrRWpnWWJPTS92dHVjUmYwdW1ucUFLODhRcCtX?=
 =?utf-8?B?SVVTSDFuZy9uRjY5TERTcXMwUGJVVjB0OWloN0ZieitKLytHVm5teWxaM1pk?=
 =?utf-8?B?MU5xRXBBYXRzbm9hcmN2RTRGWE1KUnh0WWtCaTU5V2VIYWdUVXZoM1RVQXo0?=
 =?utf-8?B?U2ljcjBrbEVURGFzMTE0cnhHUFBvYXp4VzJ0bW9HaFBhOGRjYlZlZEVZakhx?=
 =?utf-8?B?QzZNajdWQWFZQ2NpUTlSZzFNMHZiZm9nR2tKcnVOQ1NpRXRJaVVGazhXcHZX?=
 =?utf-8?B?RnJSTkNLSmxBZE5BelNIYWxqeVpMVE81cVZXTnNGbEwwVUlFOFo4WEtiR0hh?=
 =?utf-8?B?dEdzbFVOYmZaN3VLSEZjb1FQZjJaWm5JYTVuRGVzakVXM0hQTWtnU1NkRWJn?=
 =?utf-8?B?RXVXcFQ3S0NXNTJPZGZNT2xTcXZhU1ZDeE42amM3RGcyL3RGOEhXOHJYYUhJ?=
 =?utf-8?B?Zm5zYWI2NXR4YmFER3VzVHJhendVNGp5T21SOXl5ZzZJazBZWWU0NFFWaVFQ?=
 =?utf-8?B?eS9zaXkrcjVJUkFKNkdXS2tCcGtZWWF0dW0rZWFpbitiNUNsR1VNUG5qTFVa?=
 =?utf-8?B?REdxdXdpZmlDRXZ0YUwvVm1TQmxvS2tLUkIwN0FmYTBoK0NydnhZR2toVzh5?=
 =?utf-8?B?YU8xMnJUTitzU01SNnVWM1hFM1luM1Q0bWxyWFdlTXBWaUtzeEU1QW51SDJr?=
 =?utf-8?B?YnNhRmFqcGVQUGpqaVV6TXBkYTFCZlJKVnNjRXAxaW12UE5HRzNmZGJhV0lw?=
 =?utf-8?B?T3h4bzMzM0FTQ21CeXNMaW5sNnFPQ1lVUW54L29Ba1pRWXZFVDZsRkd2SDAy?=
 =?utf-8?B?WTV4Mlgya2I2TDBIYXU1ZWFYeWsxazZQNG9LWTdDNlgweEVlUUJBa2ZRVHh3?=
 =?utf-8?B?dWJYZTR4Qlp6d0lIM3VBOFR5UHlqSWpWUFRKN1Z1V0pHN3FpQXRud2pLYjBQ?=
 =?utf-8?B?czNEK0Rpd1FhLzJNRS9nQ3Y2SXlZUU9HQVlCUU1kUTczbGFqdzBGb3pKb25R?=
 =?utf-8?B?QTkrc3hiaDkxOSszeEgzZnRlTUtqK0p6bjdwbEU3ZldwTkhJdEljSXN3Q1VX?=
 =?utf-8?B?UTF5S05rdDdFM2pFVVdqQytNMThiLzZvU2xGOW1YQjQrSnZFZmV5RitsZWw1?=
 =?utf-8?B?RUtWVW5pRW9PeXpCVyt2RXlpbEh4VmNod2o4MUxQZEluTERpc0JucGY2emF3?=
 =?utf-8?B?ZVVTczhHbFpkd0ltblJYMGNraXJhMFdtcXo1d0JBOHFEWHh3blc4T0FmTmlJ?=
 =?utf-8?Q?cf0fQuZivrycqujb14Q4EBKqr+03JUIocH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 906466ce-7770-4921-dc94-08d8c15ae9da
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 17:59:08.8976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2hhNm4hrbDQC+zfp713GJRMM59wYYHJQAowVPFhBbhYC8F2nfMaLwBG8zR98k0kM3r1XX+HWutIWo9qF0OU8+aiFPwlTxbX0JIKvna4gBzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5424
X-OriginatorOrg: citrix.com

On 20/01/2021 08:06, Jan Beulich wrote:
> On 19.01.2021 19:09, Andrew Cooper wrote:
>> On 19/01/2021 16:48, Jan Beulich wrote:
>>> On 19.01.2021 14:02, Andrew Cooper wrote:
>>>> This code has been copied in 3 places, but it is problematic.
>>>>
>>>> All cases will hit a BUG() later in domain teardown, when a the missing
>>>> type/count reference is underflowed.
>>> I'm afraid I could use some help with this: Why would there
>>> be a missing reference, when the getting of one failed?
>> Look at the cleanup logic for the associated fields.
>>
>> Either the plain ref fails (impossible without other fatal refcounting
>> errors AFAICT), or the typeref fails (a concern, but impossible AFAICT).
> In principle I would agree, if there wasn't the question of
> count overflows. The type count presently is 56 bits wide,
> while the general refcount has 54 bits. It'll be a long time
> until they overflow, but it's not impossible. The underlying
> problem there that I see is - where do we draw the line
> between "can't possibly overflow in practice" (as we would
> typically assume for 64-bit counters) and "is to be expected
> to overflow (as we would typically assume for 32-bit
> counters)?

Ok fine - I was treating 54 bits as "not going to happen in practice".

A PV guest needs 2^43 pages of RAM to turn into pagetables to approach
the general refcount limit.  This is more RAM than most people can
accord, and this is way in excess of our security supported limits.


Errors in this area are already hit BUGs in loads of cases, because that
is less bad than the alternatives.

In principle, and as previously discussed, some issues in this area
could be fixed by porting refcount_t from PaX/Linux KSPP which will turn
refcount overflows into memory leaks, which is an even less bad alternative.

>
> Also, as far as "impossible" here goes - the constructs all
> anyway exist only to deal with what we consider impossible.
> The question therefore really is of almost exclusively
> theoretical nature, and hence something like a counter
> possibly overflowing imo needs to be accounted for as
> theoretically possible, albeit impossible with today's
> computers and realistic timing assumptions. If a counter
> overflow occurred, it definitely wouldn't be because of a
> bug in Xen, but because of abnormal behavior elsewhere.
> Hence I remain unconvinced it is appropriate to deal with
> the situation by BUG().

I'm not sure how to be any clearer.

I am literally not changing the current behaviour.  Xen *will* hit a
BUG() if any of these domain_crash() paths are taken.

If you do not believe me, then please go and actually check what happens
when simulating a ref-acquisition failure.


What I am doing is removing complexity (the point of the change) which
gives a false sense of the error being survivable.

If you want to do something other than BUG() in these cases, then you
need to figure some way for the teardown logic to identify which ref
went missing, but this would be a different, follow-on patch.

> But yes, if otoh we assume the failure here to be the result
> of a bug elsewhere in Xen (and not an overflow), then BUG()
> may be warranted. Yet afaic these constructs weren't meant
> to deal with bugs elsewhere in Xen, but with the
> "impossible". So if we change our collective mind here, I
> think the conversion to BUG() would then need accompanying
> by respective commentary.

BUG() is, and has always been, Xen's way of dealing with impossibles,
particularly when it comes to memory handling.

This isn't a "changing minds" occasion.  Removals of BUG()s elsewhere
pertains to logical error based on guest state, which is indeed
inappropriate error handling.

~Andrew

