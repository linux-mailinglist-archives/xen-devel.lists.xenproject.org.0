Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E41D4038A1
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 13:20:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181791.329099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNvcL-0005vO-JJ; Wed, 08 Sep 2021 11:19:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181791.329099; Wed, 08 Sep 2021 11:19:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNvcL-0005tB-Ex; Wed, 08 Sep 2021 11:19:49 +0000
Received: by outflank-mailman (input) for mailman id 181791;
 Wed, 08 Sep 2021 11:19:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hF9z=N6=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mNvcK-0005t3-1E
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 11:19:48 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ac53af8e-1096-11ec-b14b-12813bfff9fa;
 Wed, 08 Sep 2021 11:19:47 +0000 (UTC)
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
X-Inumbo-ID: ac53af8e-1096-11ec-b14b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631099986;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=aDBidDCC9WuT7tkVMIEbQgAn3Qkxl/NpiZcnYOTXLnY=;
  b=hQ2lYKccmG115exS3eWhAEAa4nDu7aOHzdpRqIw5KrcquQyx8qoOBhD7
   ng4glZaQq+TX9l6iMF89fg7ri5hZleuvqHR2y0sJNloBcB+2LlcHNcI/w
   b/LIqodg8bFlCoCbWohBuvcj1+84liw9yw7f4jngeB9dYqAWMDktnk2A0
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: JpeoATnmWEi63cmMlurSE6BrQFH4lnB6Wf7cykLDMh8c3eDTMrnyd9PZs1tlkiznOcu6kDZ1wA
 iaaD9l3mcOaoIjAz4wsVPkufAHcp1dWTXprbvt+UKEvj54FIckXg3r7iH0Zq3knp3RaoELItoY
 r8rRT1/s1EKXayTp6x6v2AMzG5oZBWK3ShKGeVcwsp9KKcN3HmRTQ2V72hnWHw/3vaSRsG3tZ0
 L3XY6SDCwx7NSwtrPDOrsG1ol/6Fpdo1QB6aD3u9F6zxhyTSTRA6Ksiw3f0ZovA63iZHoTgbKs
 BiHWSv5j8Y0EucHEzOuqCyvT
X-SBRS: 5.1
X-MesageID: 52642355
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:SRh5IazutSZA/iSoI4cJKrPxu+skLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjkfZquz+8L3WB3B8bfYOCGghrUEGgG1+XfKlLbalXDH4JmpM
 Bdmu1FeafN5DtB/LbHCWuDYq8dKbC8mcjC74eurAYfcegpUdAF0+4QMHfrLqQcfnghOXNWLu
 v/2iMKnUvaRZxBBf7LeEXtEtKz6+HjpdbDW1orFhQn4A6BgXeB76P7KQGR2lM7XylUybkv3G
 DZm0ihj5/T/c2T+1v57Sv+/p5WkNzuxp9qA9GNsNEcLnHJhhyzbIpsdrWetHQeof2p6nwtjN
 7Qyi1QcPhb2jf0RCWYsBHt0w7v3HIH7GLj80aRhT/ZrcnwVFsBeoF8rLMcViGcx1srvdl63q
 4O9XmerYBrARTJmzm4z8TUVjlx/3DE4kYKoKo2tThyQIEeYLheocg050VOCqoNGyr89cQODP
 RuNsfB//xbGGnqL0wxhlMfheBEY05DWitvGiM5y4uoOnlt7TFEJnIjtY4idixqzuN6d3FGj9
 60epiA2os+F/P/wMpGdZA8qPCMexnwqCT3QSuvyGTcZdM60k322urKCZUOlauXkc8zvdYPcK
 qoaiIviYd1QTO3NfGz
X-IronPort-AV: E=Sophos;i="5.85,277,1624334400"; 
   d="scan'208";a="52642355"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aUgw24THEqNdg6LUGQw6mkalO/20JrQU52VSIghftCoVZ0iTkVo3Y4U7ql5gft/4yA1ROA27USR6eNgaVtgZ3LXZOCzLFVrtAW1Jim9och2Aol9Z/Pu8aFBBFqbgmgZX7iJmKvhGl7VxpVMTkcIgzKA30YlHzlsNTVqD+vPbYEdr0mLEOJPgjtbNG1vtdyfgIYwVcKW5LMUPuM8veo8SkNAXq8Ci3KNkCsGJZey4LQOQKsMK4pLqWvhceP4zeZBsigkz11TTZyPc1m40+kMLZ+ohKGrZUfx6yaT9Ee/mFuNiVOy3HcwU95vEi10/ADvZIQTPKUgLyr/vUPfFcpGfOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=eub7v+WpEf0gP0zssA1hcLQX+YwwrFfIgLHvmvV0DNM=;
 b=XyHB77aSplRQbQx46al6tmq6Zju3qimfmdamozmWTRJk4k38yw1/SCBID708n1W5+RIuEO3Ny0We35fOZKW52AOj5Ck3F5mBDJasYy9eAYZO0HWW/JpKS6b/CUpAfZj0/1r5Q8+KQU/SfYPVpE0qLU3h+Suf7KTi8Ck/OM9DyrwbU4cokx6zCQoTJB6LmK1OD3EpKQ2GsYkH9I33yU376JUyaqnn2OVYZRN493Jtg3KY+Y4HAMOLwglgFYOSoQPP8vi4S350N2OjBRt+LvuNRU9oy6vQXtCJSpCTaukygasp+ixnA3D5UW70n4I8zX4coQT9HxoSxesmYoLq3wXYoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eub7v+WpEf0gP0zssA1hcLQX+YwwrFfIgLHvmvV0DNM=;
 b=sZ4sGona6ueRIROEiVffo5qXz7RyN/qMEBIQ7M/XIcosgQKio67M743xuJoUR625UezF3St9g5EE8KomoyfrDWWOAXw6hB3KjH9MNVGg73NfGYha+zAH+gilpb+Q/ZmNEqTCWJ438jSl1Is2RjIGwrWPr/pgiFFBv6RbWOgB60Y=
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wei.liu2@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210817143006.2821-4-andrew.cooper3@citrix.com>
 <20210907161908.17402-1-andrew.cooper3@citrix.com>
 <1fa45e94-ecd8-8920-1f08-027b348a71e1@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 3/3] x86/amd: Use newer SSBD mechanisms if they exist
Message-ID: <3895db85-d5cf-dff3-0877-684b4bc3d718@citrix.com>
Date: Wed, 8 Sep 2021 12:19:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <1fa45e94-ecd8-8920-1f08-027b348a71e1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0349.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::25) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 509c5b08-113c-4e30-cba3-08d972ba8eba
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5663:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB566373431EB090F4A9896EE9BAD49@SJ0PR03MB5663.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XV7vKGv66v1UQZf6jXeTrGYs4hxcdKJXJHfPF8xc5wBkBDY158yUk3lTze0pzpShDJ2vwznCPSwl/CMYF39nD6DVL18aKOhayd4aWnSkmBgXu9sy5hxhN/3dDsBHcT9GNbZWss1+Hki5UcqesLdoSkykwhQTYo1SDY6XiJCy7Kl200Qq/Tbwuo+3FAPuPCQaEoHcsnHXHl8javxMxTW9d7wCaN2j1Ah5PiSSUO/GQVALq+yniiSnax/NGTrPoda7GlXCbQmOkKs6TCYiwlyxkTrxm8BXzIzVZ3wieXi70M1Foe9lXDYBGWnoShHvMzXWcWqsgfxtokF2CVhmAx1Xwi618TN7m6Npatx8AkP50PFbtre8XjPg4IN+EjBzuLilI5PyWC7hLTub7WSb5vEesBMSd+SipNAyiNeczoFgis8uRStgHXklSb+z51Hf1brQzdY/HgBbyXXuaGP8sbyk0eZaVuaCS54IcYjMeZ3rqq6Z5rT02vkZkxgdEgvmoJRwCbWtwPlemZ5+ky2P1k/guKTZK+djvnRWxgQGEg4VlTnMxynGUdsgGofy2BgaEz1sp5dt9JrTYMO15mdjb/4cond/FscPbZ21op1e8RzsLmBVUJBZVnc4ZW1zmurcn2djeyJcX96/t46hIS8yEWLFOztLVNDvmm/4fxivb1vlTq596aRPWIT/CZw4+VJBg/gdBeXgoNmbNNjzYMyw9osJdCDP/4jiBsA+mpD/MZD6hhQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(39860400002)(136003)(346002)(5660300002)(2906002)(31686004)(53546011)(6666004)(8936002)(36756003)(38100700002)(956004)(4326008)(2616005)(8676002)(6916009)(16576012)(316002)(54906003)(186003)(478600001)(26005)(86362001)(55236004)(66476007)(66556008)(66946007)(31696002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVdGTDBpNWRjVDdXM01naTVwa3c1cmp5bmYrM2ZMUTBLL2FVMWxkQUs3NFdy?=
 =?utf-8?B?OVVSTmFPWEd3Y3FxcnduOTdtcHduMEZaN0hOVGFJcTRuUUxqTlVILzRlL1Zm?=
 =?utf-8?B?Zkt5MG1WcXc4b1dEeHoyRU1MRmt1L0k0WlR1N1hEWTNZYmVJd2RDVnpYVG5E?=
 =?utf-8?B?eE1kOGdzS1VGT0k0eUY4cHNOZCtQbDJNQTFDUkIrcTBKR1BjTDc2OEU4b1gx?=
 =?utf-8?B?d3FmRVhBNW9LTXdhbERBbzFtbnRhNWR5MmRpTkIvZlpEU0tqVzBmVWpiKzNv?=
 =?utf-8?B?clVRaWgrSDZsdjVHWXZtRFFPRjZRVkh3cE9KKzIxKzhMUkpEVDdNbWpjb2xv?=
 =?utf-8?B?RC9mVTc2NmpDMXpUeDMwRS8rQjBKYXRJQmRJbWtyWnV0VzQvazB5cVY0VnpQ?=
 =?utf-8?B?RkRUUVJFWkRHZ3JRRWIwbnhYNXJwU2JVM093TlFZTHBmUnVkOVZ3Wkd6cTFk?=
 =?utf-8?B?WUN3Rjk2aTdtdUZEZXFQem9MK3RyQVVIYzVMYlcyK2RjZDRlYXlDOVZSL3lU?=
 =?utf-8?B?Wk1CakZjQ1RpU1d4VmJ4TWpuRW9hUzlrUDdhYk1LZzVJZmVkSlMrODUwYktY?=
 =?utf-8?B?OVoyQUlLWDNOQzNMM1cycFZZMjhKM0p4OHVITXZYYWJPMW5FWHRpa29reVpX?=
 =?utf-8?B?eUxOOHJsSTFsT1NlZkxkb245cnpkQVRUaW1GRUhjbnpRM3NhbHpEMDA0cHlO?=
 =?utf-8?B?MFpJZUJBY1J2UWVoU015ckxsT3dISjhuOTZXMTVnNTI1a1dQVGxQSklXcVVE?=
 =?utf-8?B?YlNYaFV5SGpxVnVMeGE4d2FTWEFyYzVvUlhUbFdCNGY3akNqNlRoWXptZlFp?=
 =?utf-8?B?Y2FuU3lmZ0drejMyUTlad1dReVFpN09WLzdxdkN4WFBDdDJMMFhJUUx3YWx0?=
 =?utf-8?B?aVlEeEovMmJyYlJJSnVyU2NvTGoveGtsc3F0ckYxWXpHWDVDNE5VUURaTTV0?=
 =?utf-8?B?SzJXVVdxRllTUFlXeGRNYjZTcjMwek5OazFaQjdabVBQNFJVKzRGcUVsUGV0?=
 =?utf-8?B?aGZSL0ZYR3JpYnhqRGxHK1pFRXRnZE1HYTlweE9XME9EcWF6VVUwb1UxU0tW?=
 =?utf-8?B?MFdxUEJNWmd0VWkvUWNSUXFic2NFck50bDZJcXJGV3BSK054RGtMSlovWTg5?=
 =?utf-8?B?YWtTenhRaURrT3pqYTFNd2lQZHE2RGpTZXVHMHdEUERNcVVoeWNTUjFkdnZX?=
 =?utf-8?B?NVNYQ3pNcFJJV2UvM0lDSGFpVUhKYjgvNXh3dGIwWWFRYTVvcnZrNW9kcWxJ?=
 =?utf-8?B?NnFrS0VSSVdPUnlJUnNDMk8xVWc3OW05TTh0Q2lHQlZLZVE1cHEwT3lBUUlo?=
 =?utf-8?B?eHJkSG9oZnErWjIveWY1K3JyOXBicjZ6ZmRpMGlReXhwdVdWSVhTa0hMSjFa?=
 =?utf-8?B?TzZ4MDB0WlNLZWtSaythR3ZNVFdOanRnSWNqWFlvYUswbTZacEhMdGxuTEx4?=
 =?utf-8?B?a3FuaG8zVUdpYWYyZGE1Z0R3bXNldVdldEQ4dk1GMWVqSTY4QklGL2JJREhY?=
 =?utf-8?B?R202T01KRkVIbUtoZnJqeTZ4WXFyb2ZkbGJFMCtSOTdPZ1praFlRV0hwamVC?=
 =?utf-8?B?RktlVGV6ZytSYVZ1Y1JMcWZpY1VFaEoxRDlzK2tSWGFXelZoVFJ0NnZSUXVo?=
 =?utf-8?B?SzVUQSs5Zm5zaEhiS2JYWFp4YWxLVldDQjdQMnJBWUFxc2VvNXBJRHh4Y1dj?=
 =?utf-8?B?ZVd5N1pzL2hRSGdSSGlMKzZLbWJZM0VTTTZvK0JacHhRNnR1WU55R0hLMmJF?=
 =?utf-8?Q?S1RT0hO1zSf6tcDczLzCn6VCiiVJSRmErOX72ky?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 509c5b08-113c-4e30-cba3-08d972ba8eba
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 11:19:43.4875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hgAZm0I3ZKpnUbdJOncACtXe1FUan7ZUNRPpYSNDTTSOKgF2r2+dhjJ1ye7stszNXjVvdOjTi3l8Zu6uSoLlMwSfV4blHupozss/ffBJfCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5663
X-OriginatorOrg: citrix.com

On 08/09/2021 11:43, Jan Beulich wrote:
> On 07.09.2021 18:19, Andrew Cooper wrote:
>> The opencoded legacy Memory Disambiguation logic in init_amd() neglected
>> Fam19h for the Zen3 microarchitecture.  In practice, all Zen2 based syst=
em
>> have the architectural MSR_SPEC_CTRL and the SSBD bit within it.
> Don't you mean Zen3 in the 2nd sentence? Otherwise there's a missing
> connect between both sentences.

No.=C2=A0 Zen2/Rome has MSR_SPEC_CTRL.

The point is that Zen2 and later shouldn't be using MSR_AMD64_LS_CFG in
the first place.=C2=A0 I'll tweak the wording.

>
>> Implement the algorithm given in AMD's SSBD whitepaper, and leave a
>> printk_once() behind in the case that no controls can be found.
>>
>> This now means that a user explicitly choosing `spec-ctrl=3Dssbd` will p=
roperly
>> turn off Memory Disambiguation on Fam19h/Zen3 systems.
>>
>> This still remains a single system-wide setting (for now), and is not co=
ntext
>> switched between vCPUs.  As such, it doesn't interact with Intel's use o=
f
>> MSR_SPEC_CTRL and default_xen_spec_ctrl (yet).
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~Andrew


