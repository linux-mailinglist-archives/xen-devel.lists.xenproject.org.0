Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1930A3AA02A
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 17:43:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143449.264391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltXhE-0000fI-VJ; Wed, 16 Jun 2021 15:43:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143449.264391; Wed, 16 Jun 2021 15:43:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltXhE-0000dR-R5; Wed, 16 Jun 2021 15:43:16 +0000
Received: by outflank-mailman (input) for mailman id 143449;
 Wed, 16 Jun 2021 15:43:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vOo1=LK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ltXhD-0000dL-2k
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 15:43:15 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a1431fd4-a4a5-4fd0-93cd-361daaf22b1f;
 Wed, 16 Jun 2021 15:43:13 +0000 (UTC)
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
X-Inumbo-ID: a1431fd4-a4a5-4fd0-93cd-361daaf22b1f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623858193;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3qlFCcCVUZQNy7jAPqgTvE3VdNIeqftGoCfJPtivP3Q=;
  b=Xszm2k7YufyEAw9pLJ/WJXYPfzqX/XcR93aM+9vDCD9JG6NHBPyH1tsn
   N7YkGcHOIHR6jVZqeSM3hQtavLFOSaTUP3/C4FYAGmPMicgN7L2OEZr3c
   K+lgFjxe/fYnV+pVBGbJ8XWW1nyy1z/loMpspJZOgQeFTlOktSiNYylaK
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ohFkRoilwqXOXeg3BAoXD1Peau5PjDIjWrRgQv6k4UwpzIYxnZn7If1RN1AwJlkKlztv6C9p9c
 FQCqlfd6YIyfwOvKooaqGE8QKMRlCFuWnzFQBh2HVEVAbMLCXOjlskGPObFR5o6QF2dEFf3iw/
 AC0Hp/6BeN7bVkPGEP2I8OkN3Nmjr7ySdzhEQdKC0qzStYUKTPsnlrgdnoGnvbYagRC3Q9z/+U
 1LK2VTBa8Iciawz4/8sq4+EHfjVauNQxFhhRd6MZ6t51nmb7NP3zpiwRUb3jllWfUx9sTtmtlp
 YKI=
X-SBRS: 5.1
X-MesageID: 46280069
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:GAGdA60LDssbaF2gf3nyqgqjBEgkLtp133Aq2lEZdPU0SKGlfg
 6V/MjztCWE7Ar5PUtLpTnuAsa9qB/nm6KdgrNhWItKPjOW21dARbsKheffKlXbcBEWndQtt5
 uIHZIeNDXxZ2IK8PoT4mODYqodKA/sytHWuQ/cpU0dMz2Dc8tbnmBE4p7wKDwMeOFBb6BJcq
 a01458iBeLX28YVci/DmltZZm4mzWa/KiWGCLvHnQcmXGzsQ8=
X-IronPort-AV: E=Sophos;i="5.83,278,1616472000"; 
   d="scan'208";a="46280069"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AoUFc12oDpbmTTca4EPdGqL4TCjVhGVmFC0UxqQiTFQaluJPCP8QuPs6rU7MYDhdok5rH+1LEgobAIYqXqRVaANZFD8hBJlAH9KMJ28MqLVrgy9QTXqyVBj0kTnQGI3+F+Hiw+nuqIY9oJabShsFlCcyz0zhPTp1NwsxNINViuueMNfdD/0pPntqj+vWSdcfFgDoI+Jt+ZDUWEB+O4meZ7yD8gr40gC2bUoH/D7OJrXBQc9cgWcVduabFGb8su6dAp5rFCj5y6G1/nMVrCxOOX0DB5ufhDKyN3HQyYNIUydbyIdPJDBOH4fGX882x+w7yXXPF82dlg7eEUvCgg5/Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0mZ1lbsU7yf9CgkDPRlTbyZCvhu9rRsQqF5qrUkQ2t8=;
 b=c3WqLsTSa1mojrHxL1C4JTAL01DbhJul38QqS91r5bsshZenkYnU1xolwNOl+TnkRPo64blZBWh4fdYW2mfYGQ1PhYyHacShdgLI+qVgJx1YjAQu39DuIk3e2iN150GIcLIS+3NMavX5Ob1Lb6kdHk4UI6pz/QD7e9vXDymqznENUoqO3t75You8ndSECcOtrgd+In/ENv1SexOrWDlwqZb0eZqzY0pkWbloCq3+Xy13JWqKgkRjvJn3ahsR07uNGI3FRYRLE6uZLHhA/jX/gfwzBCodxhCMoQyZpOpsV4S1HF2sJTHoI1wro0PPVcmHbaLHCj9xwPfWnSqBGem4kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0mZ1lbsU7yf9CgkDPRlTbyZCvhu9rRsQqF5qrUkQ2t8=;
 b=EU7q3LiSBjkVFhBvgLve730nACAxYfGPU0K2YbpN/9v2fv753Voe8ZrxlVDNohWxetksxtttK+L65HiLOxZ8yxZnY1A2eCPF2sl/zF6Fk+aqh64HPyciG6wt2HMj1x8EztzHMIeUT/3mDUpccuwSGyfgbT/W7n4Ta6Si4qx2QyY=
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, "committers@xenproject.org"
	<committers@xenproject.org>
References: <osstest-161917-mainreport@xen.org>
 <7cfa28ae-2fbe-0945-8a6c-a965ec52155f@citrix.com>
 <b57c2120-2f86-caa7-56ec-e215a7ad0529@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Regressed XSA-286, was [xen-unstable test] 161917: regressions -
 FAIL
Message-ID: <637ff3c7-afeb-aae4-0f1d-5ae168e01e01@citrix.com>
Date: Wed, 16 Jun 2021 16:43:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <b57c2120-2f86-caa7-56ec-e215a7ad0529@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0419.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::10) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbd24b8e-871b-480d-ada9-08d930dd6fa9
X-MS-TrafficTypeDiagnostic: BY5PR03MB4997:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB499763B94AA8178F7E14E454BA0F9@BY5PR03MB4997.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N6Iv1TRRA0idh5HbYWXCeIcciq19CeC84qYsTpmBMcGVyGMApeh0boWrCD1pJFHhWkGFKt3Sv+xD3OVnS/vmqQgLzyOizXPOe65Lni10qckY8bXWhQkZiPhB1Xht0EI83YyZoku9TXNDr4oiRDHiJZZmxmrR5P+CJ2D2G8W6eTyOvUigjhDublOrDIRMFRvYcIONIsJwoEN0svtSNSPHeIVPsU9+U8UILcY14VRWVysDdkcI8P/8kZXfbVRy7+QmcZ2qOnQG+VSoIIUY8Z7J8BBBWXcLKs99d3s6dLaF7SxIB1HR4jk92VanjjmxlEeTm7R1rdETwFd9XeUUOnYH3YnIupy00lRijELHPTeGTxTr1ix94AfgX0+2Vp/UMPVAwKQlM0DgoHF7pchUyrJ030SqY7nkHcoyj28TEKWty78L1hBn3niM9zMo4FSiTUYdSuLjegEeWpAuV8aVUvN5FVVtWaSgd+HMVSSW+TvsMcfh1L7z8ldxC/kYAaxxtzNPgDxqU3oIjCqg9ecPkYk3ske5z3eh4AMrdtWfIz5avRPnD4asPMiPQJGc9CmodCGUx1pH8rkQr7KM+AFwDo/xYXsBdBakbGdgKcbiZwRi7fJCgdb5pFoPflfKcuAhoG1ztjTyWIWnswzuPDV193XdPgzUf6Z4le/mfTVQ0ZPwdQ8Hwd7WrNj6k7bgMfxm6qJumkWRxllhGkGd59+Mkm05PiEUyVslu618HXzkzgbdqQx1ch/RfU9VLcJWxwtHgZmEREB+lfXKxns4xp/oX5NuPkdibL5anjKewUi8DX5nUFQKSOze2wCrLnzcpUM9Aa4c
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(66556008)(66476007)(66946007)(4326008)(966005)(16526019)(956004)(478600001)(53546011)(26005)(8676002)(83380400001)(186003)(8936002)(2616005)(16576012)(6916009)(54906003)(5660300002)(2906002)(36756003)(6666004)(38100700002)(31696002)(86362001)(6486002)(316002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YU4vVmN1ZHVqSHBQZlRObEptU0M2VW42TXNZclhyRHQ3MTdocWEzZnovRlFM?=
 =?utf-8?B?dWV2dStWaldVZFNxZHVBbkRWUEh6QUxHOGNHeDQvNDRQbHNXSzJELzN5NWpJ?=
 =?utf-8?B?WTZjaGRxWFVqcE1wY3lXTkpIK0xWclpHMy95MUhxN0dncVNxbUJ0OUp1MFpu?=
 =?utf-8?B?R2RPNkU2NjRoc3VIdFdWNFpyZnpjdjJOdmY1MmJZTHhYM3huVU5EK01tRmNl?=
 =?utf-8?B?T2FSNWMrUy84N2pKZFd3OFlEZExxV0p0bjhBVEllM3Y4Y0JJcFliNzZncStz?=
 =?utf-8?B?bENDR3MrdXREWk5rY1JBK29EcmtKWWlTWGNQWTJOZFZZWnJieU5PSWtPQnZS?=
 =?utf-8?B?UzdUTjBoNlBqV2t3bS9lRlY0bHBQSXZBd3JsQmNrK3A4ZXNvME9KbVdXRGVM?=
 =?utf-8?B?T0NLU2ExcHlRL1lkZUVkVkdSV2I3aTFEWDE1K0R0QjExdG5iTWxqM21DWkpV?=
 =?utf-8?B?WGxXN08xV1BJK3FNZ0FuVzFvMG4xUVZsd2ZJOUZUakErWTJzZ1pDZi82OXpr?=
 =?utf-8?B?MmtET3pvQkRuWFpCZ3BGRWwwVWJ2bVBNZXkweG4vejFnT1ZROG53OUVXYmJV?=
 =?utf-8?B?WVVod3FzOEpFMWM4UjVQN3hCRVc3OTU5WXhJU2diQVlBRE96RERGcG4wQ3Zw?=
 =?utf-8?B?OEtiMjExazBwNFkwV3NwRk9tMDIrckdMR0JkdUpxdFFZbDdiWWdiaHNtL1A3?=
 =?utf-8?B?akdNZXZ5OWxyWHBqbXNSbFNVU1NGY2h4NnpKVWRFMFRoVWw3bkN3L0prRFkv?=
 =?utf-8?B?dzdHMGlySU1DRFpGUllpYmlVc0N6cTU4cW9Xa0FId002WTBGTDJWSGxZUmlo?=
 =?utf-8?B?TzJMRldQYzdzNzR6VFJWSVRkeEFNNFZpRkpZb0dDUzAvQkV6SlVNdlFGajhm?=
 =?utf-8?B?VFd4QWx5dHdaaW15eVdaV3FjM2tqQjJDNkZ1eGlkNXZQR1RSVEJrZXJjTm0r?=
 =?utf-8?B?Zm40SGUrWnRLWGppZzhBaFNudTJIbEk0QWRtUEl2ZjVOWUI2RCtzd3dBb2Fm?=
 =?utf-8?B?NW1CZVMxN1BGZXo4RGlpWGVpRzN1blExMS85dEF5UmRKcjFyMytkbjJ4UXdZ?=
 =?utf-8?B?dzk5TGhNcWlXV2wrNVNUOXg1OU1Sb1d6NEVUSWRTSzRnVTBxSVA2L1dpQ21J?=
 =?utf-8?B?ZEtGb3I3SEZKSDRrZzNGVDNLdG1CS2hab2hzQ3NwWGRwbWJudE1SVHhCOGlK?=
 =?utf-8?B?QnZFUGd3WnFSa2QwcWt1dDlueUd5Nzd1N3h0MXEvTHNnazBqWE1MWUcreVNC?=
 =?utf-8?B?OEV1aW5BenlFbVkrcVk1V0FaT2RZVWplUmxNSC9ydzMzVEtRSkdTakZCWUky?=
 =?utf-8?B?Q2xqWG93TGp5T2dvandVekovY0lBUDQ5R3Q1aThCUXlSbUdwMDllU0dGSUox?=
 =?utf-8?B?RW1QU3hQcUdUbUQ2dnI3NVdXV1NTZmdZTnNaRTVNN2ZUZXovMTZqMlRiVjRl?=
 =?utf-8?B?QXNvUUNMSFZwR0tYYk91V1J2dU00TGpWM2M5YWFNdzZpeWk5dkh5cHgwQWFH?=
 =?utf-8?B?NlB3b3BGdnI3VW9lazNscEYydURaNnhORVJCcEhCajlKelBRZmRKeXJxWFZP?=
 =?utf-8?B?VUs4RkZ6VXRpZzdJUlVTT0pIUVNsUnlZNC9WK0lhWGgycWx0MHprclJBUVJ1?=
 =?utf-8?B?SlU1bFVPb3Irb3lRZFU5RS9oWWZhN1Z3RzNDM3pUVDF3QS8rNmxNRFV2ZzBL?=
 =?utf-8?B?WURNMkxuZS9ob25SR3VFRmxiYlV5TytBL1ZOeGlseEhpVURJclRqRHhYajBE?=
 =?utf-8?Q?iQng3nC83NLNjCVAfDz/7EIKFQqn0fFVml/bKi1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cbd24b8e-871b-480d-ada9-08d930dd6fa9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 15:43:07.2600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MgX1+pwVAACVD0sTq9NulDYhqSs4ABIwGnP56zWIw1kq7IqxHQWpWtcQTdguJskiR7yirUqRuADY/oWEpEthWAl7ftx8BFNiH0eLHMPE1gQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4997
X-OriginatorOrg: citrix.com

On 16/06/2021 09:48, Jan Beulich wrote:
> On 13.05.2021 22:15, Andrew Cooper wrote:
>> On 13/05/2021 04:56, osstest service owner wrote:
>>> flight 161917 xen-unstable real [real]
>>> http://logs.test-lab.xenproject.org/osstest/logs/161917/
>>>
>>> Regressions :-(
>>>
>>> Tests which did not succeed and are blocking,
>>> including tests which could not be run:
>>>  test-arm64-arm64-examine      8 reboot                   fail REGR. vs=
. 161898
>>>  test-arm64-arm64-xl-thunderx  8 xen-boot                 fail REGR. vs=
. 161898
>>>  test-arm64-arm64-xl-credit1   8 xen-boot                 fail REGR. vs=
. 161898
>>>  test-arm64-arm64-xl-credit2   8 xen-boot                 fail REGR. vs=
. 161898
>>>  test-arm64-arm64-xl           8 xen-boot                 fail REGR. vs=
. 161898
>> I reported these on IRC, and Julien/Stefano have already committed a fix=
.
>>
>>> Tests which are failing intermittently (not blocking):
>>>  test-xtf-amd64-amd64-3 92 xtf/test-pv32pae-xsa-286 fail in 161909 pass=
 in 161917
>> While noticing the ARM issue above, I also spotted this one by chance.=
=C2=A0
>> There are two issues.
>>
>> First, I have reverted bed7e6cad30 and edcfce55917.=C2=A0 The XTF test i=
s
>> correct, and they really do reintroduce XSA-286.=C2=A0 It is a miracle o=
f
>> timing that we don't need an XSA/CVE against Xen 4.15.
> As expressed at the time already, I view this reverting you did, without
> there being any emergency and without you having gathered any acks or
> allowed for objections, as overstepping your competencies. I did post a
> patch to the XTF test, which I believe is wrong, without having had any
> feedback there either. Unless I hear back by the end of this week with
> substantial arguments of why I am wrong (which would need to also cover
> the fact that an issue was found with 32-bit PAE only, in turn supporting
> my view on the overall state), I intend to revert your revert early next
> week.

It has frankly taken a while to formulate a civil reply.

I am very irritated that you have *twice* recently introduced security
vulnerabilities by bypassing my reviews/objections on patches.

At the time, I had to drop work on an in-progress security issue to
urgently investigate why we'd regressed upstream, and why OSSTest hadn't
blocked it.

I am more generally irritated that you are constantly breaking things
which GitlabCI can tell you is broken, and that I'm having to drop work
I'm supposed to be doing to unbreak them.

In the case of this revert specifically, I did get agreement on IRC
before reverting.


In your proposed edit to the XTF test, you say

=C2=A0 L3 entry updates aren't specified to take immediate effect in PAE mo=
de:

but this is not accurate.=C2=A0 It's what the Intel SDM says, but is
contradicted by the AMD APM which states that this behaviour is not true
under NPT under any circumstance, nor is it true on native.

Furthermore, any 32bit PV guest knowing it is running on a 64bit Xen
(even from simply checking Xen >=3D 4.3) can rely on the relaxed
behaviour, irrespective of what the unwritten PV ABI might want to say
on the matter, due to knowing that it is running on Long mode paging as
opposed to legacy PAE paging.

If these two technical reasons aren't good enough, then consider the
manifestation of the issue itself.=C2=A0 XSA-286 is specifically about Xen
editing the wrong PTE, because of the use of linear pagetables, in light
of the guest not flushing the TLB.

If you were to remove linear pagetables from Xen, the issue
(do_mmu_update() edits the wrong PTE) would cease to manifest even on
legacy PAE paging, demonstrating that the problem is with Xen's actions,
not with the guests.

~Andrew


