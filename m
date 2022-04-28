Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A09512DD7
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 10:11:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316140.534899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njzEt-0002Tw-Ns; Thu, 28 Apr 2022 08:11:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316140.534899; Thu, 28 Apr 2022 08:11:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njzEt-0002Ro-I1; Thu, 28 Apr 2022 08:11:03 +0000
Received: by outflank-mailman (input) for mailman id 316140;
 Thu, 28 Apr 2022 08:11:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h8bM=VG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njzEs-0002Ri-8L
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 08:11:02 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bda16243-c6ca-11ec-8fc3-03012f2f19d4;
 Thu, 28 Apr 2022 10:11:01 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2057.outbound.protection.outlook.com [104.47.6.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-h5CcuQbjMz-BNdDQ-iU30Q-1; Thu, 28 Apr 2022 10:10:59 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB4439.eurprd04.prod.outlook.com (2603:10a6:20b:18::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14; Thu, 28 Apr
 2022 08:10:57 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Thu, 28 Apr 2022
 08:10:57 +0000
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
X-Inumbo-ID: bda16243-c6ca-11ec-8fc3-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651133460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OEupg5Z95395Bu7NP1udXgs5eMozR/+GBV8XSa41Mls=;
	b=bo/bMZTwskV3TFx2/gE0YJ3PESQ6a5nvo59CvPE5VD98WaKybRdmAX1m0YVq6yUvbgQ6Y7
	E9EdkoEPMATfDJKj1ryxHYAXno6PwTHlDMI0E8TxORjr+pGugyaVKPN9Y2yCln4g4Bm53o
	09Fu5UXx49MRQsi4SsH3zQA0T0G0Tns=
X-MC-Unique: h5CcuQbjMz-BNdDQ-iU30Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NsYdjTRmD0iGmaIShC3AeUa2jkR2ZvM0B/638BzpuiN5woGE2z9jvRaGRs8BqWsZ0+kZryVfxnZlDhOBDr9+AqycWY1vDDshJzn62cBKEVms/3v0sr/8PGDNhk/3hzOcEruT/pJqwBT3bAoafkaWdf2cNjXWia3e8otHGhrXwQ3Te1RPElrtHk3C9quiB2JLdaatvSC8SIb5sNgfQS/pIuurilC6NLeFvmEA2s3ggnV78Y+5MDnWxrTCzsMSzikD+zNy4e+0+lL6lSh8zZHKw3YRtJ60eNNPe45CpnZYC/PaZ5WdoW9eFpl2Rn7kZ5aQ9hskq1/sp/icsp06qUv4gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8wSzMA2p0/jtSzHmJbmsc7/g1XLR1wYP8xbxa9wmVh4=;
 b=CUW4Oh1X9Nne/4tnxmg3JpDVdtOsSQBkolJnDA5qMomRCb/Aw9pBhj7oLBJtf1F+WgMkQuGNOM49yEwJwd2xCgd756YIGgOntUQ6mk17TQWF59CICydSOBS5+GYLMGV/lCa+mXqBI6OCT1by+HMBINPmL5mCLHZjIfoYJSJC8c8SH2e/gHiEMMEELOG5MTSUHBBUL0jfCqa7Pk4Tgw2KS2cSu3pvFXSlQOIK7dagrTD2M2bH13RLv9RtX1n3dKzJlL87E9T2qMQpW56XTNOzgQb4p4No6AA+cTup/HB+6Foc4hZr+ZwP2t9PFdiiQlHrA8AmWPZBixq7FDjs5sCK+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1114076d-b1d7-8653-0476-9e0e3a7d7845@suse.com>
Date: Thu, 28 Apr 2022 10:10:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 3/4] mwait-idle: add 'preferred_cstates' module argument
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <4eae5ab3-361c-4eac-619c-160147220be4@suse.com>
 <7c15016f-cc57-f128-4b79-79c820f3196c@suse.com>
 <Ymk7BjXdyiMUGoc8@Air-de-Roger>
 <47b50c64-b8bd-df95-9de9-175780c50e0b@suse.com>
 <Ymlb2Wly25k9bF0z@Air-de-Roger>
 <d9e797eb-5075-2c95-cfa9-959586577f98@suse.com>
 <YmlrYNFI75wQlVlg@Air-de-Roger>
 <9a4d1bec-321a-21da-6a11-4b4990c52895@suse.com>
 <YmpLAoORo9uG1+yI@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YmpLAoORo9uG1+yI@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0156.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::13) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99adce60-0737-44e5-495a-08da28ee9fa1
X-MS-TrafficTypeDiagnostic: AM6PR04MB4439:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4439ACBBC9616D0049DCE16BB3FD9@AM6PR04MB4439.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PZZx1r1YNMnbgDxFHrKx23/DuoWDOHp4mrbP/LEd5Ei/VSdN/pBVRRb5wequ8eSbcrOe8CSAEJbTcgjtJNutdGbgd3I/6pCJVWHOSBMgXLZYweS8gLo0uIS4JsJJ6UK2UDAOZTwGDhP+ohmv1xWCYDWaYAtIa5O9rJNrnUZWwkCI6mm36HkQ8kdy9suKYaekE2ej7iaFfDzfVP2kpJp2FFcy6lMl01wqX0qJxM8d0pPXKsuIjADX4OlSLkt42tert5uNpSuIK26IsPCMs2yVPUagCM8bnOL/j0odG7/EaBuaJuYYddDo0Ah33WBdXVLmMZ8Vea1mM5Ba0tcqDZf0HVOGFsxmsociJ2YNzICW1L5ilyxJubNjo1y5WoRH3cS1gU54+HEpfZvC2dh6ROXrdi60yevxkhjqV19i56b0yWSJ42teISawLCS5LYqPA6UXxiqkDlLci1CCRVJBF5OWZANNyFYl4flNcmFCWmlvBW9HrR7PDTfj91D1EeAYr4rNwp4AR6wHbRtyYBsPyZnzIn68BcVFsSIIcCtkDTO74qmHzLDEMXPackxR20JAQXGmQtVIuPReTBVjLo7aCp0+8yGBddbgsDOhxbE0476N1+FR51e0JQ1cHSqvP8iJqUFYT6MOu8Vlx+Gb8u6XUkw66jjCwmk5fFohNeHJo8wviALHkX4F0pLlW1a4EiCygl39L20rzuTqA0cztnEcR6WDHpzEIngz/wmIuJkt/hsbOJasT7CyzhgO2SbREWJ0M3ynUnJiZIl9Cm0nQAh50Tic8mgace7Kpg3mIitjhbIWZhVH83fYDT3BsKfyx4EGIsKMq0g6uCxa8/HMJTlYV1h+vw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(53546011)(316002)(84970400001)(54906003)(4326008)(8936002)(38100700002)(66946007)(508600001)(8676002)(5660300002)(66476007)(86362001)(6916009)(2906002)(66556008)(6486002)(31696002)(31686004)(26005)(6512007)(186003)(2616005)(36756003)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?erCooSqDcSPYOJZXE3JDVUhVkKO6IskWnfEq2L4jgKg5ntc+fkhL+cCAKnw5?=
 =?us-ascii?Q?EV6tBPC1d8xna6WpzVCDl7C051/vls6z4BamPc/G65EkUDA0If5tnkm5IeZ6?=
 =?us-ascii?Q?gHsGkZdfW/54q3Ja+yOKxCGT3zo3W58kQkVCoH1XM/PS/mv9ZywZkp632XJh?=
 =?us-ascii?Q?H6+mpaHL5Ae41Y387VwnSW5Qx2AjAmAfl41ndCtMP7O0SfPiZA89+rW8B8rA?=
 =?us-ascii?Q?A20ltoCtva6Aw8OksgzaKs24ByuFn5jIhHR2ULqv5T15ok3jwDP8e4dVnXBD?=
 =?us-ascii?Q?UfSHis721mLaGFv1O3+5/5px0BWu4HvqS1H4qpmUIIc5XAVLWG5VVExElabd?=
 =?us-ascii?Q?E5cQhOk+Mn/GXSoF+pKVNmyGznHx9CiuLQWVneZLyVU5YP/iPonp3mY2b4JH?=
 =?us-ascii?Q?cWip6byqz6dr8iX2cil9juoYx7tbgSauY+965czdNL4fKk9CFipf1fv0LZmg?=
 =?us-ascii?Q?tfnpR5vLdTl6pP7e3eCgpbASU2+63dhldqUAKHpVN3loDeeFSjWOGjvw0pUe?=
 =?us-ascii?Q?50gyhvIIRm4DWXUsiT4F7LR6QgRtkiiumgJZUWXtRL00qBFWXslPdeFixO0n?=
 =?us-ascii?Q?/KFcQUPS6LydJssb4QhPaSUJG27ReYziKVoLTrNJbwoRs6z4KmbNk+Ri5b9k?=
 =?us-ascii?Q?iilBGx5YpUBINE0hZLXXHRyeuNlpmqEPBfFIQdEeI978bRPkr0djvnGokOzM?=
 =?us-ascii?Q?dx5A1A1RdWHDYG3JhEdJBc9xd+IuiTj1/iNt4KLg+xRGt+obgFA7am3KvRO9?=
 =?us-ascii?Q?H5rJrImqyDrL+2EB2uBvCGxTfF+7fWavRCqOVrfEXRMvGdtyznUaqj6FBSzJ?=
 =?us-ascii?Q?NUvmD7UlHd7XI9RtMvAMpI9nUy4s8TEh4PFZonCLDfUZ9UWshQM+9reIelR4?=
 =?us-ascii?Q?9eGZq1Dn0D3cFo8Pkfga4wZ+vaNFP3QerH5+AG+V0n2oziSi6Db3jCdHgl2Q?=
 =?us-ascii?Q?//Be/klLHf5Kg56IzhWFxgFbWbbFLO7OkIIIeGERteWEMsEPo9jcnhJxS5G0?=
 =?us-ascii?Q?AknJud84nY64t378kxHZxKcNDY+qnGB3Y84ivh/xVizLCIMAzdu6vPopkSPB?=
 =?us-ascii?Q?CegZ86NBVC3vzXpzNr9DaYCb9piGc+Ha/B5JR6PTOqy0kHB3uD2ProIdf6bS?=
 =?us-ascii?Q?+0ObwnP8Hd3YwAI3cHd0SI5GqMDBBBqSbplliblwSnD20dGcU8fkfpB4ItFf?=
 =?us-ascii?Q?HvP9pJa71A28gUB0LZ6B64JZQZfhqjwxvrqW3dkp20DmdmIuJ7BkkpGX8wXi?=
 =?us-ascii?Q?tkdPxhn64QOhEWLwyWB1pwMy+uonlgFSWLhu3ovEPAEne+bV0lef87j7uooI?=
 =?us-ascii?Q?uqM/AYYH6N0tmu3yA6VpVjaD5IiPe5nHbBV/qkYb9NF1gOQnvPyGg26rAaj/?=
 =?us-ascii?Q?LXG2EeFu26OJbJM1LlHrAvCpP9/YqenOAd0eTIW74HJ2TQnSJszFBFAyjzCt?=
 =?us-ascii?Q?/0G84mdQTvhk9pAepbpOU1qreyys9wyJPQKfqspMO+iHfr7cFor/25pJrywJ?=
 =?us-ascii?Q?Bjq8vky78/LHcmjMLKvBEhOocv6CuAh1orjO/El1k+Pf7LVrz9KpLtn8CHaf?=
 =?us-ascii?Q?yHaeWWZCvRwtsQu2roUh1/CniOAL/2fKqLWY/g4MZXONZ16zDoSsLtK3QojG?=
 =?us-ascii?Q?BMpBnADGAN+Buz44kPUWeXvnyEc3EbfJIGqKEwn3l902frN0qwh0lsp86gbn?=
 =?us-ascii?Q?T/NlkZzWdkFnsI8N0bvN/qsQJiJpMe+bj/qjibI0voN962KVNH7pNEHfBSQ6?=
 =?us-ascii?Q?fkb1WjBhVw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99adce60-0737-44e5-495a-08da28ee9fa1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 08:10:57.3383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HWfRF6zuGbzWqRwAPdmGYWW+/LKPXO94ZJfzEoRPyuDRqd4nwNi+apgfQxxolC0AtckSEnDhNxXugqjVFvRX/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4439

On 28.04.2022 10:06, Roger Pau Monn=C3=A9 wrote:
> On Thu, Apr 28, 2022 at 08:37:58AM +0200, Jan Beulich wrote:
>> On 27.04.2022 18:12, Roger Pau Monn=C3=A9 wrote:
>>> On Wed, Apr 27, 2022 at 05:25:35PM +0200, Jan Beulich wrote:
>>>> On 27.04.2022 17:06, Roger Pau Monn=C3=A9 wrote:
>>>>> On Wed, Apr 27, 2022 at 03:41:24PM +0200, Jan Beulich wrote:
>>>>>> On 27.04.2022 14:45, Roger Pau Monn=C3=A9 wrote:
>>>>>>> On Tue, Apr 26, 2022 at 12:05:28PM +0200, Jan Beulich wrote:
>>>>>>>> --- unstable.orig/xen/arch/x86/cpu/mwait-idle.c
>>>>>>>> +++ unstable/xen/arch/x86/cpu/mwait-idle.c
>>>>>>>> @@ -82,6 +82,18 @@ boolean_param("mwait-idle", opt_mwait_id
>>>>>>>> =20
>>>>>>>>  static unsigned int mwait_substates;
>>>>>>>> =20
>>>>>>>> +/*
>>>>>>>> + * Some platforms come with mutually exclusive C-states, so that =
if one is
>>>>>>>> + * enabled, the other C-states must not be used. Example: C1 and =
C1E on
>>>>>>>> + * Sapphire Rapids platform. This parameter allows for selecting =
the
>>>>>>>> + * preferred C-states among the groups of mutually exclusive C-st=
ates - the
>>>>>>>> + * selected C-states will be registered, the other C-states from =
the mutually
>>>>>>>> + * exclusive group won't be registered. If the platform has no mu=
tually
>>>>>>>> + * exclusive C-states, this parameter has no effect.
>>>>>>>> + */
>>>>>>>> +static unsigned int __ro_after_init preferred_states_mask;
>>>>>>>> +integer_param("preferred-cstates", preferred_states_mask);
>>>>>>>> +
>>>>>>>>  #define LAPIC_TIMER_ALWAYS_RELIABLE 0xFFFFFFFF
>>>>>>>>  /* Reliable LAPIC Timer States, bit 1 for C1 etc. Default to only=
 C1. */
>>>>>>>>  static unsigned int lapic_timer_reliable_states =3D (1 << 1);
>>>>>>>> @@ -96,6 +108,7 @@ struct idle_cpu {
>>>>>>>>  	unsigned long auto_demotion_disable_flags;
>>>>>>>>  	bool byt_auto_demotion_disable_flag;
>>>>>>>>  	bool disable_promotion_to_c1e;
>>>>>>>> +	bool enable_promotion_to_c1e;
>>>>>>>
>>>>>>> I'm confused by those fields, shouldn't we just have:
>>>>>>> promotion_to_c1e =3D true |=C2=A0false?
>>>>>>>
>>>>>>> As one field is the negation of the other:
>>>>>>> enable_promotion_to_c1e =3D !disable_promotion_to_c1e
>>>>>>>
>>>>>>> I know this is code from Linux, but would like to understand why tw=
o
>>>>>>> fields are needed.
>>>>>>
>>>>>> This really is a tristate; Linux is now changing their global variab=
le
>>>>>> to an enum, but we don't have an equivalent of that global variable.
>>>>>
>>>>> So it would be: leave default, disable C1E promotion, enable C1E
>>>>> promotion.
>>>>>
>>>>> And Linux is leaving the {disable,enable}_promotion_to_c1e in
>>>>> idle_cpu?
>>>>
>>>> Iirc they only have disable_promotion_to_c1e there (as a struct field)
>>>> and keep it, but they convert the similarly named file-scope variable
>>>> to a tristate.
>>>>
>>>>> I guess there's not much we can do unless we want to diverge from
>>>>> upstream.
>>>>
>>>> We've diverged some from Linux here already - as said, for example we
>>>> don't have their file-scope variable. I could convert our struct field
>>>> to an enum, but that would be larger code churn for (I think) little
>>>> gain.
>>>
>>> Hm, OK, could gaining the file scope variable would make sense in order
>>> to reduce divergences?  Or are the other roadblocks there?
>>
>> I don't recall. It might have originated from a change I decided to not
>> port over, or I might have dropped it while porting. To be honest I'm
>> not keen on putting time into researching this, the more that I would
>> generally try to avoid static variables.
>>
>> What I would be willing to put time in is making a more user friendly
>> command line option, but as said - I can't think of any good alternative
>> (except perhaps "preferred-cstates=3Dc1e" or "cstates=3Dpreferred:c1e", =
with
>> internal translation of the strings into a bit mask, as long as (a) you
>> would think that's an improvement and (b) the further divergence from
>> Linux is not deemed a problem).
>=20
> I think (b) won't be a problem as long as internally the user option
> is translated into a bitmask.
>=20
> Regarding (a) I do think it would be helpful to express this in a more
> user friendly way, I'm not sure whether it would make sense to keep
> Linux format also for compatibility reasons if users already have a
> bitmask and want to use the same parameter for Xen and Linux, ie:
>=20
> preferred-cstates =3D <string of c1e,c1,...> |=C2=A0<integer bitmask>

Yes, I would have been planning to accept both (but probably reject
mixing of both).

> What I think we should fix is the naming of the two booleans:
>=20
> bool disable_promotion_to_c1e;
> bool enable_promotion_to_c1e;
>=20
> I would rather translated this into an enum, as right now it's
> confusing IMO.

Okay, I can certainly do that. The more that I did consider doing
so already, breaking ties simply based on the "less code churn"
argument.

Jan


