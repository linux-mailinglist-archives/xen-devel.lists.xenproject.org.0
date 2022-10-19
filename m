Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 552BF6039DE
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 08:39:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425491.673341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol2ie-0000TH-Vs; Wed, 19 Oct 2022 06:38:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425491.673341; Wed, 19 Oct 2022 06:38:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol2ie-0000R0-SQ; Wed, 19 Oct 2022 06:38:24 +0000
Received: by outflank-mailman (input) for mailman id 425491;
 Wed, 19 Oct 2022 06:38:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=illN=2U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ol2ic-0000Qu-Mt
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 06:38:22 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80080.outbound.protection.outlook.com [40.107.8.80])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f9c483b-4f78-11ed-8fd0-01056ac49cbb;
 Wed, 19 Oct 2022 08:38:21 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8124.eurprd04.prod.outlook.com (2603:10a6:10:246::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.28; Wed, 19 Oct
 2022 06:38:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 06:38:19 +0000
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
X-Inumbo-ID: 9f9c483b-4f78-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FocO9eVA675ctE4tdSaMkSRkICtpiec0Ye9WrOGv3+V0VSnzXhLLZ54UTVUkem4sM9KRxv74fc3pJ09e42lrBjFJr5B8wFgdOYr1lfucc+NVtgbFc9+xkV7MXMBM2mKnUDBAI4Tygdk9evJVx1deeoywxvIBDKoqgfo2DRfHRDq3C0+upV5PAi1WaztfLhg+/LkIpItqSlLR+gwnWT17RSDNr38ko8Tg2kQXV1v0ARWZv9Z3FskwJjeiJyln/ucwcMyIHfYcmAK9EzvWgNZmumFZPuIVADPt8IGPn0botAtNCDApWuu22B0Xs0NfSpojaHuBvGwdBFyPV3OXPsDuIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aYuLN5bgvnF5RnwrWpONTqY08xWFtrkzfXj+k9tmKkQ=;
 b=hxmOhuQRwp9VukyfVrY1tgyFd92zoP55Y3QpCK8HMKqKutwW2hPsHtFoDF2UjLBhH4ot6oA7oPU/rbmCySTq2wl70YAp+yRc/FOvxOdOCO4O1Q4FhqSSfLl5Sl3q+fsMBFmUGxjxQMGOnc12mdCrRp1Vj12ClH7G1GJVZnEejen+pmjMk8Ro1YpnH/H/FtmpbfCOw5DIuRN/vo1qOv37OsI+CY32RvLxppqQe0H0bKhmRhz48OhGsowOyH4LobKjdzzPUZDcL/xzuBG8RDyvzPiOiy3Ec4vm80OZ3YfYGgvzZE9aHLtidZF02Ens+u3mgzEZ+AC1n1JlqBPjzWQZmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYuLN5bgvnF5RnwrWpONTqY08xWFtrkzfXj+k9tmKkQ=;
 b=0QSk2h8Y1XBNyrZlQKTgdKf/fHULd6Doe+Ha5onbi2I6xlTamGUDJ75/XohLeLG4y5xn/ZT6Vd9L2dg8sr53tc9mudOZAc42NQOUgEsgQYWm+Ey0B6c4AyWn5FxvMNC3uqoyVJ7Qli0IZ0DiWcQJj5KSqgzKy+1nGmT9iW5AdMDqNTZ2PaGYoKtDaTj4TLNhOahzFpF2CMmnflT3r1NcfWx1FrYs0FDAf3IY3v0keX0yKNLr+azH2eV86GQ/W5uyBGwaBj3yDDQQtCSRrLL0emvv7qUKpKCat1VHNIGDdagvXFDtWHCBai6Q8gdZSpmB2l9e7cWK/2sjUEpkZncb8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9b113db9-4dce-d300-9393-a8572ee4fdcd@suse.com>
Date: Wed, 19 Oct 2022 08:38:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: Proposal for deviations in static analyser findings
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <EBCDE6CE-A84A-48C7-B3C2-7856E5D2392B@arm.com>
 <ddc5039d-e312-326a-b71c-8d08d04100e0@suse.com>
 <186C83D7-6C7A-4319-86E4-69F7FDA7FDA5@arm.com>
 <559a3d4c-08ea-ef8c-9a56-2b53db3d51e4@suse.com>
 <E00E3AE4-7863-4231-9DB7-A7B66C8F6791@arm.com>
 <233a9356-b64f-37f7-d7ee-3d6223224497@suse.com>
 <A906FDB6-7DA5-4900-A6DE-1140231E69AE@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <A906FDB6-7DA5-4900-A6DE-1140231E69AE@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8124:EE_
X-MS-Office365-Filtering-Correlation-Id: dd1ed2be-5bf3-4023-29bc-08dab19c82a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YQDBzVWRDzk1PiTTAr/B/XI9LNks6tQ2bETjIMIIpQyTA4umpjbN5pb4DnXQOnnBVDAmNwnHCpZCaVjsuB1W5BDBWbqe0ExEwoobR17osBmWQJxHSYjhB46o9OLqpl3bmMyq9wT9lxwdhELVi9TCNH/kt5ojzU38HJez62FQT4CDOFI3iRO2duG1tFebtWftSNlxtj8g/6A5qVRiBA0qPixB023clbb0RNGnVY8zHdOZ3OydAOn32pPQTSVxNVExkqJuQtSSebxZkj2UDygYYrju3wdUK+odv8UexL9PCBDyWVnG3b50buUCKXY+DhLnlCqTm1J19SnA3hENFuEZrdqRC8Jdddac+Kh8Rw6QfJsVHn3B3S2qh0YQGvnvy+kqT2c/ZlayJ+Weav4g3KVnOg6tO+Sw+fMt3K89mE9fyEb3Dw0DEE2366OTS9/POvLKnf6Aq9fcvJxBK2e8j28ldadsfxQ8k7dXxr54u9+nAAVIzJ4g/7N2tkKwL46Wm0VaQ/xitw1EYKlvavnhCaYSgn0amq/GpfjBNuF7iqR1AWKlVytimqDwNPhER4XPc3QmQS16XdLByZXdRFPmZ0Zfi4gXD1wB3e/rjQRfdV7/on530Q7tUDsZHqAvzcbGWZyGVo/56D1G6wWQeh1HBHISGZtC2mYxlQLLNxgEXIRez9pTMLoZrgH0X58peeAHXTf9mJFUufH68jLxX8OV/WFI0l9vkWpmLjPH+Bsk1Juv74TcC9YiQKpXrlAgEWp0NRN7XmIPb60/xjGGRuHtL8V/GYxVCLNJpu1RKCQH0BiCQUU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(376002)(136003)(39860400002)(366004)(451199015)(54906003)(8676002)(6916009)(66946007)(66476007)(4326008)(2616005)(316002)(66556008)(6506007)(186003)(5660300002)(2906002)(86362001)(31696002)(83380400001)(26005)(41300700001)(53546011)(36756003)(6512007)(8936002)(31686004)(6486002)(478600001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlhxdHl4ODZOaDB1UXh6NWRsVVBnYU9CTUFyQndqUXVuakw0M0FscXoxZVBX?=
 =?utf-8?B?dFZIVGlSNDdlUUNGV1R1cittTUVwZ1FxcXQ3WHlmYXJMZmxRclRjazJJWFgx?=
 =?utf-8?B?eUpJd0piaXhhNVdWK041amFWQjVmT2ptYUQvOWRmclEyN2ptb0I3UFNUeTBE?=
 =?utf-8?B?MTBVMElEc0k4WkdIckduaFM0ZFBaeVRQWXhZU2NvRVdtTE9JV1c2S1dUZ3pw?=
 =?utf-8?B?RUdZcHR4N1JvMFlJNm9YY3oxMVJLL0RWL00yUFN4TGptWVhLb2VJYkhheDda?=
 =?utf-8?B?c281azZXVDRucG44QjZjODZrQlVwdXVVSE1lNnowLy9naVJMMGFMQStJcUFp?=
 =?utf-8?B?SHgwdXcxT1pXMmcrNGduR040azJMeEJtTWNmbU1aaVhVVWlkS1BsTVorSTli?=
 =?utf-8?B?V3Q5eXZzT3dhUENYUkVmNjArVXNHMVRnU3Vsdnp5dlltTEV6ZVZGZFZkcXhi?=
 =?utf-8?B?S0lWeDltQVI3bzJYb0NNWnp6aE5CbGRLTFphaVRwNDN0MHBUUUxzeW14T0g5?=
 =?utf-8?B?TmNubGhqRGk2QVA3TFBHTUpUWi9OUFFzM3lzTnpmQnRwa0E5YjNpbXJLYUxN?=
 =?utf-8?B?OWlBUFNCTzIzV3grbnVQRlpmMzZTcy9jcmpFZnZ3SzErcnBsekJ5c2Q1ZEky?=
 =?utf-8?B?amJsYmpTN3dsK295M2p3dVhtZUR1cGVjSXk5dHRuT1A5MzlUWjlwaCtCRVdV?=
 =?utf-8?B?dUloSU1hc1B4NnBrSkk5dDlwUkVBNFNYUXlMbjFSeUNUa20vbGRXWWhHWjUw?=
 =?utf-8?B?SGRDTXBLTEw2QkMwK0JyZHBwSmttNDhtekZueXp5dlExVTVta0RvTU4wVGdK?=
 =?utf-8?B?ZjRyVlFldElZSzArK3crOW5pd2ROSC9UV0dwTVRXR3ZjTzlWY0tXbjVYZ2pr?=
 =?utf-8?B?d0RmZWk0aWxpbjJlQ0xIOXFpMFIvb0hzMjl2Vko1dEdsaVhZaWZDWms2L2xj?=
 =?utf-8?B?T1JSc2hBNWJRRk9TMlpscFlzajF3SHVVNWFRWndsZlFLZ0lVUElMWE1xNEJC?=
 =?utf-8?B?dzl1U2Y3RHhoMCtIZTRWY3lZQ1RUam1VK1FBR2poaFZyMzdYRk9jWTczZ0hD?=
 =?utf-8?B?VFhFYU1mYW5JR29qUVB1OGVtYnExLzc1UGEyZ2ttVW8zbnVEUUlFemlTdUtr?=
 =?utf-8?B?TENCZGZlN05oeC9uRzhaSFoyQnpQeWl6MDdlNGRVMUtuL2p6VkIyODVQcVo3?=
 =?utf-8?B?TlU2cldvVytrb1k5Qkh0emlaY00xa3JwTEJQbFJVU09ZUElldjJGaUwrQmxN?=
 =?utf-8?B?cFNENUxhd05FZTcwWjFhbkVPYUNMaC9QSkozYmZmWEhHUE53UC96dlN0U3NO?=
 =?utf-8?B?U1RoVU13QStqbExYQktGdUN4T0s1WDlwMVRJS1dJNHo2a1RzcXlDd251ZHVs?=
 =?utf-8?B?YlROMkk5c2pIYzlIVnM1UFc0ZDN3OHIvSURnbGdVb0lPYVFQS3pGcHVPU2dX?=
 =?utf-8?B?VGU4MGtJSDVBRkx2aTRLUzFaM3NPeDM3VmtqS1ZaclVEa3p4Znp2V0kzOUU2?=
 =?utf-8?B?REJ1MFZyck40K0ZGMGNGNGI4OFMxVGJ3ano3NHQyTGxJN0tVTElSWU9kaElY?=
 =?utf-8?B?UlVxdHF2TWlsTng2dlExWVFONkt2VGd0Slp3Um95OUJjaHEvb1JrNlZ0THZV?=
 =?utf-8?B?VXpuVGRqK3V3NkJhWEFxNnQwMHNiTWh5cTNUUDM0Yk84eDFTVTBxMmhBdWJ1?=
 =?utf-8?B?STFPVUpaUU91OTRrL1F3cGtvRFM4Rlk3QUhmSTBxdHVYYUI3YUFGR0ZuVWNF?=
 =?utf-8?B?d1k2TTRSaWZIRFZKZzJNQlJQNE1wUU9sUFEvTkthTkhBNHA1L2VGOVhkRTEx?=
 =?utf-8?B?ZFpDWDEvck1HMVdCeUlJWXh5OFdaOUVDRXhPTi9OWVh3amJLQ2xhUnlmaTMw?=
 =?utf-8?B?dURtMkhIZGtVYlJraUdTUVJUbHBiY1Y1MGU0QU5Cb3NWc2l0U1J2QzhQelN0?=
 =?utf-8?B?SmFPMkU2RGt3TEJ6M3dSdWNOSzAwMHFYcTBpa3ZvM1NWdmlOWENkdS9uVTdN?=
 =?utf-8?B?Mk9KUEs3bzZKeUQreFVWemhkQVNnbVNLVTFHV2Z0RTZ3ckJjQzRKQkJzUWpI?=
 =?utf-8?B?Q2ZaZGw5di8vODRvdFd0RHp5Y3MxWDVQNlAwajIwam1vRVVUWis5UXgzMnUr?=
 =?utf-8?Q?A4zkQQEKBn+IFsJXHFqYQNG2R?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd1ed2be-5bf3-4023-29bc-08dab19c82a0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 06:38:19.2457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +CTR8lfi7YDCUTtCI0vUyVxMnoOU1c89JhTO+wUT0rWpL2cJYjwxzjq4Y16/Wo0/HtFjSTcuZPAJLMcdhVhoNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8124

On 18.10.2022 18:11, Bertrand Marquis wrote:
>> On 18 Oct 2022, at 16:29, Jan Beulich <jbeulich@suse.com> wrote:
>> On 18.10.2022 17:17, Luca Fancellu wrote:
>>>> On 13 Oct 2022, at 12:34, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 13.10.2022 12:11, Luca Fancellu wrote:
>>>>>> On 13 Oct 2022, at 08:50, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> On 12.10.2022 18:00, Luca Fancellu wrote:
>>>>>>> Entries in the database should never be removed, even if they are not used
>>>>>>> anymore in the code (if a patch is removing or modifying the faulty line).
>>>>>>> This is to make sure that numbers are not reused which could lead to conflicts
>>>>>>> with old branches or misleading justifications.
>>>>>>
>>>>>> Can we add provisions for shrinking such entries to e.g. just their "id"
>>>>>> line? Or is the intention to be able to re-use such an entry if a matching
>>>>>> instance appears again later?
>>>>>
>>>>> I prefer to don’t shrink it, the name itself is not very long, even using many digits of the incremental
>>>>> number, it removes also the dependency on the file name.
>>>>
>>>> Name length isn't relevant here, and I have no idea what dependency on a
>>>> file name you're thinking of. My question is a scalability one: Over time
>>>> the table will grow large. If all entries remain there in full forever,
>>>> table size may become unwieldy.
>>>
>>> Ok I misunderstood your question, now I understand what you are asking, we could remove the content
>>> of the “analyser” dictionary for sure, because if there is not anymore a link with the current code.
>>>
>>> Regarding removing the “name” and “text”, could it be that at some point we can introduce in the code
>>> a violation that requires the same justification provided by the “orphan” entry?
>>> In that case we could reuse that entry without creating a new one that will only waste space.
>>> What is the opinion on this?
>>
>> Well, yes, this is the one case that I, too, was wondering about. It's not
>> clear to me whether it wouldn't be better to allocate a fresh ID in such a
>> case.
> 
> For traceability and release handling I think it is important that:
> - we never reuse the same ID in any case
> - we keep IDs in the database even if there is no occurrence in xen code as this will prevent adding a new ID if an existing one can be reused
> 
> In a certification context, when a justification has been validated and agreed it will make life a lot easier to not modify it and reuse it in the future if it is needed.
> From our point of view, having a clear and simple way of handling those will make backports a lot easier.

Isn't validation of a justification connected to the affected code? If so,
every new instance will need validation, while an orphan entry is entirely
meaningless.

>>>>> After the analysis, the source code will return as the original (with the SAF-* tag).
>>>>
>>>> While you mention something similar also as step 3 in the original document
>>>> near the top, I'm afraid I don't understand what this "return as the original"
>>>> means. If you want to run the tool on an altered (comments modified) source
>>>> tree, what I'd expect you to do is clone the sources into a throw-away tree,
>>>> massage the comments, run the tool, and delete the massaged tree.
>>>>>>> if the object doesn't have a key-value, then the corresponding in-code
>>>>>>> comment won't be translated.
>>>>>>
>>>>>> Iirc at least Coverity ignores certain instances of what it might consider
>>>>>> violations (fall-through in switch() statements in particular) in case
>>>>>> _any_ comment is present. Therefore may I suggest that such comments be
>>>>>> deleted (really: replaced by a blank line, to maintain correct line
>>>>>> numbering) if there's no matching key-value pair?
>>>>>
>>>>> Yes the line won’t be altered if there is no match. This to ensure the correct line
>>>>> numbering is not affected.
>>>>
>>>> "won't be altered" is the opposite of what I've been asking to consider:
>>>> Observing that comments _regardless_ of their contents may silence findings,
>>>> the suggestion is to remove comments (leaving a blank line) when there's no
>>>> entry for the targeted tool in the table entry.
>>>
>>> Why? The tag comment won’t do anything, it would act as a blank line from the analyser
>>> perspective.
>>
>> The _tag_ won't do anything, but as said any _comment_ may have an effect.
> 
> I am not sure I follow this one but in any case we can choose to anyway substitute the tag with something like /* Not applicable */.

That's still a comment, which hence may still silence a tool:

    switch ( x )
    {
    case a:
        ...
        /* SAF-<N>-safe */
    case b:
        ...
        break;
    }

is no different from

    switch ( x )
    {
    case a:
        ...
        /* fall-through */
    case b:
        ...
        break;
    }

nor

    switch ( x )
    {
    case a:
        ...
        /* Not applicable */
    case b:
        ...
        break;
    }

Only

    switch ( x )
    {
    case a:
        ...

    case b:
        ...
        break;
    }

will make e.g. Coverity actually point out the potentially unintended
fall through (based on past observations). Whether that behavior is
fall-through-specific I don't know. If it indeed is, then maybe my
concern is void - in the long run I think we want to use the pseudo-
keyword there in all cases anyway.

Jan

