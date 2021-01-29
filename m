Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 021C2308B4B
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 18:18:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78367.142593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5XPO-0006J9-77; Fri, 29 Jan 2021 17:18:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78367.142593; Fri, 29 Jan 2021 17:18:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5XPO-0006Ij-3s; Fri, 29 Jan 2021 17:18:10 +0000
Received: by outflank-mailman (input) for mailman id 78367;
 Fri, 29 Jan 2021 17:18:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sDuN=HA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l5XPM-0006Ic-JA
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 17:18:08 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b836d668-99c5-4843-95d4-d01c1695c8d0;
 Fri, 29 Jan 2021 17:18:07 +0000 (UTC)
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
X-Inumbo-ID: b836d668-99c5-4843-95d4-d01c1695c8d0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611940687;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=P/WziYJlfW5rOVVxK2h87Ia/8Zm3rIGwzLaZyARQu7s=;
  b=Gya655kwIfcD0pChIDnTq37Kz/O6d8eDoSMzu5cZ+Sp2FLajkICflV1S
   esDyUdHbEtG+Q77IjsoWLdiVY6pU1qGlE/10sx4fJit/CwcCl7FGvE3MG
   jByN/lHpsh1cPY73+i3iUi2KbMaDq4TBpY/k00CeslLCchiYTH1jTGlaL
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qRnyIQ4HBN0O+f3NXWjipA4ukToS4tpefb5NGx5gnMH3KBS3Yw+C8zSXrTqTxWU/gl2anTbtQJ
 9rHQJ0z2HgSCjvFPMCzOtH32CyL/ECrfEb59yyr2hkSgGsVO4/6BO0OF83yf5tDMHAdo3yjSO5
 T0jqepL2ktAokrHb8FqubdoUgjFL58LMSUh2BqhCNdZj7bNCGEyGjx4NDM7W++wIr0JZsTIoH8
 +5gQtI3ANwiKylIyO2YP2kOLF4g67aBxyVBG8GMX4OdhAZ53dr7TSS4+cwudWN6g+DcxXB5yGG
 5Yk=
X-SBRS: 5.2
X-MesageID: 37496419
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,386,1602561600"; 
   d="scan'208";a="37496419"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oSih3rvMCcolKhNoAfeQB1ja63Gbe9OqYILd1KSeXbwV1KT3MOnPGQdIlEFV5xN3Gjcsc77Mx8BsDllsTY7QBTWhvWsGNAt6oedDNxTNQgYvBmjVRmoWxqmeN7b1XAwDOhTlDbtQPTGUdBOHVrxqipcwx+vWknfErXhIDOhnsgJsjTMhwB1rB5UlhvYMGEuQtRXseoIhCvGct6QFdGC6rRIh4KR0cyCFJVwvR1PK3wnwToQpOtxG+P9K8FhqeDI0w31T8JJfhU5LEKq15AYtOre+WQZ9N02YEKGpeIrF77Usn4+sndvaL5DIf1XMh4wqvc/wkEJoLQeMmnhC9ntdpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/WziYJlfW5rOVVxK2h87Ia/8Zm3rIGwzLaZyARQu7s=;
 b=D9uEPJnJjxaYz+JDqqf1w6+imXVqJII06VMupxcSQQ2Zs1QeQkPCaa+nlw5k5J8X4pMUH3+kA3swx1hHVAw3bTxyrw+8zzC9E8XjuFxFFTLJvyMOqCmjRxMVCh0wfMlMLdWrxsgbIvPq38gEHxjx7PFZ8ePT4zDqI2IYztfFGs7O7pL79mWehLk//cTRIS59oBWj6hztOBE0+UrM8h1WliIVkT3XMS55R+8nH4rHAGfLkQgzutdtuGgn9+DfdXZBoR5NrbYQWId4W13EFfXN6u1DbrX/nbv1Zro5vriesXzbxXz8/c5pdkPD8xA8pnZIr5kEEU1oos+psFxEqVpuzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/WziYJlfW5rOVVxK2h87Ia/8Zm3rIGwzLaZyARQu7s=;
 b=JoxSiBjjX9yE0cP2yex+jDCAaxFuOixKF94qkrXgKAUbllXZhcXXqxAVOAS+8CAgZTgLWw5/6Dij0kXlO64xZ5ByO1nHHU1dQNzV+eQjNSAkfUWM9OSfA6JYBmXZoTvmo9Ep49skhnT1BBxHjPLXl9YSZQrPRvKAVKhd6uohFWk=
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
 <a0456589-4626-fc51-d585-9159d6ea3010@citrix.com>
 <d0fc73c7-3dde-b303-dba0-7cf65e1ef0e8@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6fb91ae1-4b91-f76a-1d38-1c528ab43a9c@citrix.com>
Date: Fri, 29 Jan 2021 17:17:54 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <d0fc73c7-3dde-b303-dba0-7cf65e1ef0e8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0283.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::18) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad4f6b59-de39-4047-e56b-08d8c479d49a
X-MS-TrafficTypeDiagnostic: BYAPR03MB3975:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB39759847EC169B308AD0D0DFBAB99@BYAPR03MB3975.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 94Ioz6WHs0tNLP5JPV9WAgDZ/GG16LMAulUWMpVco4YrT+NqZX6iyKbBPDolum9EomTGV5CYg/tXJSFAM1aQHpwku6lAbthgdYaud5DpAOOSTIx3ntcN61KmjKA3HAiDFoqNCj4/Vemm+TaKfaBPgaMnD0J8wfLNe0oQO0yqUzoq6KdRydz/cxp/+CdgzLdz1hjd2nEklOSVITBMj0O28PCExHk4TJqCDX1oHpoZ+/qmZ2qrirEoFlRnn/W+SSUXnZUbpodF/SFaB5bh44wesraJ4zJWM7JXmIqLZzIvZV+n59N90xc+8j7/Jt1Wek6/ROobJykjjzdER1E9HLQLMI5axAz8JxOQin2iwg9K/k68n5UQInhMscvyuA//ACaozeE5wA8JbOOyx9SAXiW9hCfJmoPIsMc4Jdx24FMmWJMqFoOX3DBLjtQ+z5o/RJZnMserafAalTXAWi/Z5roEl74Lr1CWuKNPsPzV5kE5lfZMez/wqcDi2Kd/nkJ/hzq2IcWlUIb7In2YkWd0vVegL/JephrR0/JnzvlXoQcLw2Yamy4QAP7OTMOHJFdWMGpQJGHDwsQBQeQUHOzlVICaQYbhrkLW2npMxdMP2NPwLLE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(39860400002)(396003)(136003)(16526019)(956004)(2616005)(6916009)(31696002)(53546011)(2906002)(26005)(186003)(86362001)(316002)(16576012)(54906003)(31686004)(8676002)(8936002)(83380400001)(478600001)(6486002)(4326008)(6666004)(66556008)(66476007)(5660300002)(66946007)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bDZYQXJTSG5xT09HNng0aTZ4V2x3QkhyRGx2L2dpbG9QMEhkSEhkZTdHMUt6?=
 =?utf-8?B?bVdYZkRqVTJINFFIZXduVWpJQVdqaDhET1prS0dScjB3YWV6TE1rL0tWMWJU?=
 =?utf-8?B?cHltM21HSWVVZ2pGSG9WUFlpd3R1bm8xMTVKUm1VbGlTRE9Gb0JCY0FJWlE4?=
 =?utf-8?B?ZEw5VDM0MjNmdzUxR1lIbENaaE9QVGl6WlhxS3I0ejBCbUJwMm80dDRreG9y?=
 =?utf-8?B?TUxuS0hyUzVDeWRsbGhPeGtWY3VZTWFMTkl6Mnp1Y0JUdnZQQ3dvWGVqN2cy?=
 =?utf-8?B?UndiMW02REJTZklRMkNJWFUwcURHV0JZUkdzSk5SQm5HQTRMbVFHSlpISHJB?=
 =?utf-8?B?MDJGOW1IdjJNVk5DS09nY1FiQW9CbGRtb29sMGl3NmRGejBWZ0lNZmIvZHhI?=
 =?utf-8?B?MnBDVmdZbzJ3STJtVFV4UVErOFlyek9RZ09Ld041VUZMeTQ4SG1MQVpRQndq?=
 =?utf-8?B?Y2ZaNDdQdHowSnRaUzBjYVVYbzBBOWN6emFWYWNFZEJrY0kvMmd4YlZFZDVU?=
 =?utf-8?B?Nlc3N1NQNWQ2VUNJQ2VzZXcrVkl4ZDBzWWxSUEoyOTFXQ3pxMGVmYmtHZGt0?=
 =?utf-8?B?bGJiNTNDNmhRM0xrYm5haTY1MlJoWEFqb2tvYXpSS21BaDBrQ2lTTVFjV0l0?=
 =?utf-8?B?MUFCbHo2NGhTYWM5U3VMUnZ6R3VjSHc5MXFTMmNJaGtxOU45OWpCTmRBT05X?=
 =?utf-8?B?blJyY1NwK01vYy9SWVRjak5kN3RRRFFSQXU4bzhZUmhGdUdIWnVQRkZSdTN5?=
 =?utf-8?B?WDExZkJSNGs3anYrUnR2Z3JqMmNRcnFtakIzRzVYWE56UGcxRDBIQm0rTzkx?=
 =?utf-8?B?Rjl6VnZUbHVZbDRXNlFnWGkwSm9lcXdpVGxEWU9WMkRmclNZRUpKRVdRaW9k?=
 =?utf-8?B?TlV0anIwV1dqZy9MSHI3OEJoZzFIRE5DZ3RQaFFacnExcW1ZSTVHcUdDWEhy?=
 =?utf-8?B?S0Myb2xQQzdYQ1JNeUVUQ284c1NnMGJaMm1oY1hteGVzeERCS1J2SGFQdDdR?=
 =?utf-8?B?Ry94dFlIZm1TTGN4YVoxUjBrbk05RkJQeXIvQXdBZmlGQ0ZKbHNjTzM1elNq?=
 =?utf-8?B?eTVpb3l5dTJnNUZCZ002ODAzL2tYeW5adzErVXVkbWlBbVk2SmN1OURrOE5T?=
 =?utf-8?B?MUZwTWhwLzJLS2FwcndBNlJ3UE9mTXNKQkJ4QWEzRHJQemVXYW5VbDhTclZh?=
 =?utf-8?B?TlRmaWRjaDJydDNkUWtxQnpRem5yUFhRV3dFdnNnc3NwMlhBNXJjcmJkSWFk?=
 =?utf-8?B?SVVDam93enQwTkdYc0dOYS9Lb0hBQmhZdEp6K0tjL2RkL1kvcEhBVnE0czlK?=
 =?utf-8?B?NmJvM3RhZVh4OHpRbGhVTDJSQnlRL1Y1dkxtbWk0RzFqYTc2MDduRmhYSDZP?=
 =?utf-8?B?WTR4U2wvQURZWmV1ZzFGcnI2L1lFaEIzSUNBcUdZcDRGOU5VeCtnV2lodUlF?=
 =?utf-8?Q?UkthskQJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad4f6b59-de39-4047-e56b-08d8c479d49a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 17:18:01.1932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xSfdJNr/MagS9uWdtrqMszNo/H9EV2w6Ilp/5hX4kHRLZO33cL5FKvJ0MZKE2h/IrKPOQbdNVQ02ukGwLFUJQPbYR/1JiR96OlImfffinhA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3975
X-OriginatorOrg: citrix.com

On 29/01/2021 16:31, Jan Beulich wrote:
> On 29.01.2021 17:17, Andrew Cooper wrote:
>> On 29/01/2021 11:29, Jan Beulich wrote:
>>> On 25.01.2021 18:59, Andrew Cooper wrote:
>>>> On 20/01/2021 08:06, Jan Beulich wrote:
>>>>> Also, as far as "impossible" here goes - the constructs all
>>>>> anyway exist only to deal with what we consider impossible.
>>>>> The question therefore really is of almost exclusively
>>>>> theoretical nature, and hence something like a counter
>>>>> possibly overflowing imo needs to be accounted for as
>>>>> theoretically possible, albeit impossible with today's
>>>>> computers and realistic timing assumptions. If a counter
>>>>> overflow occurred, it definitely wouldn't be because of a
>>>>> bug in Xen, but because of abnormal behavior elsewhere.
>>>>> Hence I remain unconvinced it is appropriate to deal with
>>>>> the situation by BUG().
>>>> I'm not sure how to be any clearer.
>>>>
>>>> I am literally not changing the current behaviour.  Xen *will* hit a
>>>> BUG() if any of these domain_crash() paths are taken.
>>>>
>>>> If you do not believe me, then please go and actually check what happens
>>>> when simulating a ref-acquisition failure.
>>> So I've now also played the same game on the ioreq path (see
>>> debugging patch below, and again with some non-"//temp"
>>> changes actually improving overall behavior in that "impossible"
>>> case). No BUG()s hit, no leaks (thanks to the extra changes),
>>> no other anomalies observed.
>>>
>>> Hence I'm afraid it is now really up to you to point out the
>>> specific BUG()s (and additional context as necessary) that you
>>> either believe could be hit, or that you have observed being hit.
>> The refcounting logic was taken verbatim from ioreq, with the only
>> difference being an order greater than 0.  The logic is also identical
>> to the vlapic logic.
>>
>> And the reason *why* it bugs is obvious - the cleanup logic
>> unconditionally put()'s refs it never took to begin with, and hits
>> underflow bugchecks.
> In current staging, neither vmx_alloc_vlapic_mapping() nor
> hvm_alloc_ioreq_mfn() put any refs they couldn't get. Hence
> my failed attempt to repro your claimed misbehavior.

I think I've figured out what is going on.

They *look* as if they do, but the logic is deceptive.

We skip both puts in free_*() if the typeref failed, and rely on the
fact that the frame(s) are *also* on the domheap list for
relinquish_resources() to put the acquire ref.

Yet another bizzare recounting rule/behaviour which isn't written down.

My bug really was setting v->vmtrace.buf too early.  Furthermore, this
pattern is not safe for use in the domain_create() path, because it
currently depends on the domain being put on the domain list and
relinquish_resources() being called to avoid leaking memory.

I still argue that a typeref failure in these circumstances is the same
kind of impossibility that we use BUG for elsewhere, and therefore that
is what we should be doing.

~Andrew

