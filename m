Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C37845098A
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 17:22:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225982.390376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmejl-0007iQ-0O; Mon, 15 Nov 2021 16:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225982.390376; Mon, 15 Nov 2021 16:21:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmejk-0007gZ-SG; Mon, 15 Nov 2021 16:21:40 +0000
Received: by outflank-mailman (input) for mailman id 225982;
 Mon, 15 Nov 2021 16:21:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mmejj-0007gT-VA
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 16:21:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c0ba4cd-4630-11ec-a9d2-d9f7a1cc8784;
 Mon, 15 Nov 2021 17:21:38 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-byVaktqYM3qjZngpB6Bwdw-1; Mon, 15 Nov 2021 17:21:37 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6670.eurprd04.prod.outlook.com (2603:10a6:803:120::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Mon, 15 Nov
 2021 16:21:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 16:21:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0120.eurprd06.prod.outlook.com (2603:10a6:20b:465::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Mon, 15 Nov 2021 16:21:35 +0000
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
X-Inumbo-ID: 1c0ba4cd-4630-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636993298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hFeAu/k6nst9+U4QH7SL0wExW/7C84MqbPEgIgEXKSI=;
	b=nnoDxFzZGC4NAvE8BTi7xcmMAZ0bnjna/lGrAMFIz0xMuFGctVCJU9fwijVRcOuLqXhfgv
	L6jM0MKYByJXXnUUniIIJVIxn/ALnTFo/MHnb3QLWCOwqxSh0M6e/5jUBLhMin9v5FjaIc
	Ygfu2mSGrHK5wDEcuBdwaXO7pg+0E6A=
X-MC-Unique: byVaktqYM3qjZngpB6Bwdw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hsNf5qBfRiIj4LlaFcTgGaBtkWGw/jjiX2OtZYysoZxF0vY6Y90amp1kSsZFVn5wTDQhYixMVFPT1HgNzg4GHwPhr+cmBuca0kR0OYftfcu0GWr3AEt9uYHAiNSPN/Z3/CK/W2agPia7wD08BZU0syRyRb9wUTtEu22xIhA96yPgHLyZsUrmMJygRphNpqt9VZFwf7UCKJBxVFKZdxxn+uriZvRvaLdjr7w4FSBufd8NsxModKi3PJjVBaSURjVsHR1WlK0HJ6t72nfe2Yz517/x1BjixnMP1GuRPscnrtUNtu2kyc2gSh5kS974LnNasjmilEC5uINOldO9CYlLIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQaKEobEC1SD5fnmPFlVOyw6Li6YOZJ6uXH4bR60K1w=;
 b=Tp7dUR8Rgpu399Pmv5hE4Iq76k4OPhgSDLLMyhljhbX93dicb7Ww8km2qQUd+JSwA6dJy1FLXL3b1xhAegCbH9GmS6EyY7TYUzLV8xHLanJaMpMtlHR/Xemi/OeH+dOhjhfCjsad6zXNTGzr1BuN6eZcBiQof6hEWOJIa27RsQFU05dqO/q1Xtc5dOWJfy/2nNFRE+3r8hLG9E4MXqjgdweWBI9D0BIJE75nNItaGIukG+aQaaU+agLWOYK/G6n76lY2QCZ082Y1YxsBHULoDoOnGbPWL/tiydnmNku7t5sDRh4P6cpF2ssAb8CbrhbgKJSLf7+9VAwWT4B+Aq/rHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <628731e2-fa81-4f75-3806-900e70988f53@suse.com>
Date: Mon, 15 Nov 2021 17:21:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] xen/cpufreq: Reset policy after enabling/disabling turbo
 status
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
CC: Ian Jackson <iwj@xenproject.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Jane Malalane <jane.malalane@citrix.com>
References: <20211110091935.16906-1-jane.malalane@citrix.com>
 <d1978235-f025-19ac-707c-c2e411a5a005@srcf.net>
 <008467ea-75af-acb5-62af-bd1db03ccc68@suse.com>
 <790bf907-8c6e-b8cc-6832-b8fe21af536b@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <790bf907-8c6e-b8cc-6832-b8fe21af536b@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0120.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c11e011-dcc1-4fb7-2eb7-08d9a853fef8
X-MS-TrafficTypeDiagnostic: VE1PR04MB6670:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6670EA21BB52B0FABBD6163FB3989@VE1PR04MB6670.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m6WSJ6crQrtczmL1UI4DiUtUIXhE4Y9jeYyxEmiE5rXcssIJPUSDOFIDaupDCSMNmeAc6doypLyRCYWFhm/xJjMmJ5rbhjHjyE0HlaQ8PWQInmo/7D/0+HCkiQHd/AfHnpldmr+MXw7tVVt5gxm7BzjGgt/dL1U71zJqLvAWlRnFhkrzpfDnXSW3PGDY3u1jAnrGBt86mr4r9D1IBHdmt6RHzsgGxWf4a/PoZuFdgBQDUGa0y9ftY3Ra7hz6+Mqh3+V3SZxDhs8V5vrbm6/I+BOzE9v1C0R+daw1TG9Fu+9GwPxEly1XwMC4Hv0VsFB7PfkBIcEI7KiTSyGOEzvkcPrIbFr/CljvbkKfHO+rDifuVjhCdgit1se7isNiQmQHizfpuBhaeNGjF2nWCHatiLzyv/PH4qTyMaUL8GDCEN4L97uojx0ACAQlT3/HCtMLcFGkVqYXJpZ4jXpeOEUumTI2QXJ2y0UV/ngqxdR2CP8XWObIOF7o3kDL5ZWh1Bij0jx6HcEFWJFso2pibSx/za69avYw4p/Qajx0wem9O2iEcvvMAryvj/Vcc4pPQX2i+D62B+ly2xXYu0It8V8GHeZVS0B3Bvlq+EVPhAiy1BEuFA2W/1KflWE3OT26Tl7nmOsFj5r0MM7q/EiGP5LS3po93qKYUmBig8iSxVZeAFtFVoY744SeYj+oO81fkARcLvbzY7Hu1BlmTCvAObw0Bcu1hFAo0QPLg7K4A/tsUrA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(66476007)(66946007)(66556008)(2616005)(86362001)(956004)(5660300002)(186003)(26005)(31686004)(53546011)(508600001)(38100700002)(6486002)(4326008)(31696002)(8676002)(316002)(54906003)(83380400001)(2906002)(8936002)(6916009)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QU0pjwUpBvW7enuANHP+V+khePQlmAjuiKYIW+BUVdOTQAXArvj7LKoaqxFd?=
 =?us-ascii?Q?MAHB5bOjZQI92vv478hXGDjet4dVgkDb7KjL0lXdOPuiYj/XPhuGWZYmYvP8?=
 =?us-ascii?Q?/EXk1DuUiNBB7IDSODGQk4o3oK/uBkcAGY1MfGsymwQBgGe7ZdNXB4HoR0c4?=
 =?us-ascii?Q?A0wuqV27DAJ9Ye5XXOrh7hdQSUKQssEd5ojYx92mUOcWtr2nD3vOuzvsKsTs?=
 =?us-ascii?Q?SSpF4GpkXxVDLu2bB67cwgghCAC200HRwv2O7jjGCEriLT8nkmiNtZ03u4IN?=
 =?us-ascii?Q?x3wahy+wAKepvNdYMExDJC3yXIn8m5skmdOnLNaAoPxgDdCvbFXRwTAIGe42?=
 =?us-ascii?Q?JhSfJyZKrMdHeE1qTi/2XldFQ37GcsoJfwXv5EL+ozk4wZHztFStWMWwxC1T?=
 =?us-ascii?Q?Ed+4RF6D4aK+4o5qvhgBAvid+qdMe0YBfIPAnB0nDv3hHcvANyFBT/c+hbII?=
 =?us-ascii?Q?tIUZLcHS9Is1AA0MAB3kfSZSPeB6JHEyX8afGzYy67YvQ5vyOnxvenSfJq6C?=
 =?us-ascii?Q?9m3m/LU1YXcub0P24Jrr9PpSShZvl66htAi16PO0xUCOELFYJ1z9oWcxqdS4?=
 =?us-ascii?Q?hnutha1/dY3yMOyAOkYLvc73YNJbqmOT8/HLXMoumQDBjMz/X+sACYIsEruX?=
 =?us-ascii?Q?Oy/kkK+cSRzwUKtLOa6qPovEZ9xyRfCTm5+QM5v4Vu4PkFm6w2bBzdbSqsGr?=
 =?us-ascii?Q?7KaVrpzGVq3wRmwuEOsfaAgmIGMcc1/7FsYmoXR7n7Ngvxw/Inqv+yVgwwCG?=
 =?us-ascii?Q?StcaCR6pAvJF70I9oa21cZCb1awwjuXaVZialqGcajnnCzdVWyuri18sfKY8?=
 =?us-ascii?Q?GWgCw8/uPJPp/aQd7f6ieQPa61vkV/+qhvM74ScWQI8NuM3Nf9sdPCiAJs9f?=
 =?us-ascii?Q?k0DSCkufax7qMp6snHTNV3CI4FnoMK7E2mHeyyAjnsToP4O5LpfJ+75TNSTJ?=
 =?us-ascii?Q?EgQo7NmEqQOrEnowAXZ8EQxUjc6SDzRPMRQX+fvtg52g7QpvRgGdv4Lm0fvy?=
 =?us-ascii?Q?bdTsCpMm0sMdHGLtBtxhIO6lt4a+u8b5VKMrBLKv2CQuUnyT82F8JnEWbWGs?=
 =?us-ascii?Q?lRtYlafyk4c07gQ9RyuWBoZlGJ4zqUBd+/nOCdK5pP8X5MQILYvVjCYGegX4?=
 =?us-ascii?Q?3hTtuj8cFf+op+2NpbD4aweuELYGod6n/yz+9hD/gNcYdZVaSjyDzCadT4uD?=
 =?us-ascii?Q?mjyHBmWojNCj6q447Z/0VWKBdXXmGvfSMWUm23ZckVKk4jloMql44Tmto1Oh?=
 =?us-ascii?Q?0zRf7SeBKIPJAyBq0ghps0vF+Z+KkDR6jCrRrEIfrsvxyeq0VVUGVTMZvUUq?=
 =?us-ascii?Q?FrZs4EQvDSGK6my7bOix9+uyX6qJaP7Sj8PUYUMraFZM6gomAuZpsf0+9kPn?=
 =?us-ascii?Q?d0Kbgn/edCvub3wt4/K1o7CXCe7FuHgh0+jO6jhaxS+6jcXWjxGwHUaojHwb?=
 =?us-ascii?Q?4i/PMHPuNwKPJdMBqlvHNELFLMoPJT6XgzTfHXcCN+zlPnTIqb8jQD32gEHB?=
 =?us-ascii?Q?sg6A9pQNuE5ZQLXPWVgpmqSeRXtmPYglvZt2Nft2U/6pOo3wzZxPYRfqCAuZ?=
 =?us-ascii?Q?dkKJQmrN3n1JXnYrEZVxF9SI+TseCEgcbfmYfcfYrxX5jIT92XLtIsuiPCpD?=
 =?us-ascii?Q?aVJePGESqFdQir7oMh65zA4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c11e011-dcc1-4fb7-2eb7-08d9a853fef8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 16:21:36.4015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZqFK1jq3pUABk8qqIEzncHy5GqSQQYwD1Wdn0Rx9+D5Uu/r0yBc+hf0K4tAkFG9o1k3h29ikJ6K19+ftQF21eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6670

On 15.11.2021 15:33, Andrew Cooper wrote:
> On 15/11/2021 10:53, Jan Beulich wrote:
>> On 12.11.2021 19:51, Andrew Cooper wrote:
>>> On 10/11/2021 09:19, Jane Malalane wrote:
>>>> Before, user would change turbo status but this had no effect: boolean
>>>> was set but policy wasn't reevaluated.  Policy must be reevaluated so
>>>> that CPU frequency is chosen according to the turbo status and the
>>>> current governor.
>>>>
>>>> Therefore, add __cpufreq_governor() in cpufreq_update_turbo().
>>>>
>>>> Reported-by: <edvin.torok@citrix.com>
>>>> Signed-off-by: <jane.malalane@citrix.com>
>>>> ---
>>>> CC: Jan Beulich <jbeulich@suse.com>
>>>> CC: Ian Jackson <iwj@xenproject.org>
>>>> ---
>>>>
>>>> Release rationale:
>>>> Not taking this patch means that turbo status is misleading.
>>>>
>>>> Taking this patch is low-risk as it only uses a function that already
>>>> exists and is already used for setting the chosen scaling governor.
>>>> Essentially, this change is equivalent to running 'xenpm
>>>> en/disable-turbo-mode' and, subsequently, running 'xenpm
>>>> set-scaling-governor <current governor>'.
>>>> ---
>>>>  xen/drivers/cpufreq/utility.c | 6 +++++-
>>>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/xen/drivers/cpufreq/utility.c b/xen/drivers/cpufreq/utili=
ty.c
>>>> index b93895d4dd..5f200ff3ee 100644
>>>> --- a/xen/drivers/cpufreq/utility.c
>>>> +++ b/xen/drivers/cpufreq/utility.c
>>>> @@ -417,10 +417,14 @@ int cpufreq_update_turbo(int cpuid, int new_stat=
e)
>>>>      {
>>>>          ret =3D cpufreq_driver.update(cpuid, policy);
>>>>          if (ret)
>>>> +        {
>>>>              policy->turbo =3D curr_state;
>>>> +            return ret;
>>>> +        }
>>>>      }
>>>> =20
>>>> -    return ret;
>>>> +    /* Reevaluate current CPU policy. */
>>>> +    return __cpufreq_governor(policy, CPUFREQ_GOV_LIMITS);
>>>>  }
>>> So, having looked through the manual, what the cpufreq_driver does for
>>> turbo on Intel is bogus according to the SDM.
>>>
>>> There is a non-architectrual dance with IA32_MISC_ENABLE bit 38 (per
>>> package) for firmware to configure turbo, but it manifests as another
>>> dynamic CPUID bit (which I think we handle correctly).=C2=A0 It has the=
 same
>>> semantics as XD_DISABLE and CPUID_LIMIT so we might want to consider
>>> adding it to the set of bits we clear during boot.
>> This is quite confusing in the docs - at least one of the tables calls
>> the bit "IDA Disable", while other entries at least also refer to the
>> effect of disabling IDA. I'm afraid I have trouble connecting turbo
>> mode and IDA disabling, unless both are two different names of the
>> same thing. Maybe they really are, except that SDM vol 2 uses yet
>> another slightly different term for CPUID[6].EAX[1]: "Intel Turbo Boost
>> Technology".
>=20
> SDM Vol3 14.3 uses IDA and turbo interchangeably in some cases.=C2=A0 It
> reads as if IDA is the general technology name, and turbo is a sub-mode
> for "doing it automatically without software involvement".
>=20
> On CPUs which support IDA, the CPUID bit is !MISC_ENABLE[38], with
> further adds to the confusion of which is which.
>=20
>>> However, the correct way to turn off turbo is to set
>>> IA32_PERF_CTL.TURBO_DISENGAGE bit, which is per logical processor.=C2=
=A0 As
>>> such, it *should* behave far more like the AMD CPB path.
>> I'm afraid public documentation has no mention of a bit of this name.
>> Considering the above I wonder whether you mean "IDA engage" (bit 32),
>> albeit this doesn't seem very likely when you're taking about a
>> "disengage" bit.
>=20
> It is that bit.=C2=A0 Despite the name given in Vol4 Table 2-12, it is "s=
et
> to disable".
>=20
> Vol3 Figure 14-2 explicitly calls it the "IDA/Turbo disengage" bit and
> the surrounding text makes it clear that it is disable bit, not an
> enable bit.=C2=A0 Also, that's how the Linux intel_pstate driver uses it.

Okay, then I agree with the proposal you've made.

Jan

>>  If it is, we'd still need to cope with it being
>> unavailable: While as per the doc it exists from Merom onwards, i.e.
>> just far enough back for all 64-bit capable processors to be covered,
>> at least there it is attributed "Mobile only".
>=20
> Honestly, the number of errors in those tables are alarming.=C2=A0 The MS=
R is
> has been around longer than turbo, and I'm told that the interface has
> never changed since its introduction.
>=20
> Looking across Linux, there's a mess too.
>=20
> acpi-cpufreq and energy_perf_policy use the MISC_ENABLE bit (which is
> package wide)
> intel_ips driver uses PERF_CTL (which is logical processor)
> intel_pstate uses MISC_ENABLE || max_pstate =3D=3D turbo_pstate
>=20
> I'm certain I've seen "one pstate being special" WRT turbo before, but I
> can't locate anything about this in the SDM, which possibly means it is
> model specific.
>=20
> ~Andrew
>=20


