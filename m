Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7324F618B
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 16:21:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299915.511242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc6XN-0003eK-Ij; Wed, 06 Apr 2022 14:21:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299915.511242; Wed, 06 Apr 2022 14:21:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc6XN-0003cD-Fn; Wed, 06 Apr 2022 14:21:33 +0000
Received: by outflank-mailman (input) for mailman id 299915;
 Wed, 06 Apr 2022 14:21:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nc6XL-0003c7-FM
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 14:21:31 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d984ced8-b5b4-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 16:21:29 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-zFapoJlNNkeWlHg6YZhiVg-1; Wed, 06 Apr 2022 16:21:28 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AS8PR04MB8691.eurprd04.prod.outlook.com (2603:10a6:20b:42a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.19; Wed, 6 Apr
 2022 14:21:26 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 14:21:26 +0000
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
X-Inumbo-ID: d984ced8-b5b4-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649254889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qropIJfSBioGVGimPOasNk80It1ayD289kSkOdTKr/g=;
	b=lWsnWy6CU7wnEmaVbi5HaMQkBoFI0pmwHtaLMLSJkSJ3NzEj1cRvprOFmYx69UCfO31FHH
	geCj7MPxhOwgJXH0g2TbV8P3IYg/cj8alPAXYEmVHKHDJgJrOWaoJdc8EA19V96n6HUJ7I
	LnJzULJIbolrRPseeXCTxbQgB5M/aK4=
X-MC-Unique: zFapoJlNNkeWlHg6YZhiVg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eUR27UYd/0PzS1etrLdxaM9uJxnQBQs55wcuwoIHlQz6+qbnLBpAwHYWqm/61xor1sUkoDSBNSnJMBsE0Mor33H4qIu6gZsjEpc1/E1DbHQFHRw8unLAtsY8LCmt/O69ePmpFW+xAktF/9iZJGLY/GIz1U2JGxIpftjhqKpj5Fd1taXhLKJDCUhgjhNuLFgHsLxFsvgsIIU+hUoD6k0cBhgFwaF8Xx3mT8tsRitPYrpdRKJWG+WxcIqim/3skayQx/DL2AP2Zff/ZuJrTVQZGyAQ5hgXAYr3ep1+5LRmk7SeXQT2kgpXl6Q6aHx+3+LbsutrMVSiXFZvCNr0dB/5PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CmJqBtWVRIOHkmLpNjjpheDJBmNgDG2EX0lawK/FJdo=;
 b=UkCO76csv6pWI4XCxXsYnYebL1yxhZ2495Y2mmNDuPRY7Vi6jVnDWPJ+85NDlNUPX/+0ALCZi5gvBuR3u7MlsT3hWocb26ediXQn4FKMtEd0vn0A54ey8NdhQNDXKcO900x0MmVIpdoUWPmQ6gO0buRlzPiMb+GTqO7JvMTw/sFtbocMADH3qhaDSz41BlUlS6r+FK4FA9JwewvGoomvyAT6RO7fYR672V69e1Ju37CK2xQspqA346bSIiAZNnHP25ZAM5Opl7DXgWQHAJ+hTiIe9D1PpeYA1qO28tuLFtiwdSqUMw9DXFyo6AWVrLOl7vLlMW2iF3BFcgVu5hv8cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5e633888-0344-2737-13cb-ccb802651963@suse.com>
Date: Wed, 6 Apr 2022 16:21:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 3/8] x86/EFI: retrieve EDID
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
 <c11d267f-f6b7-558f-18ce-2b081ae12427@suse.com>
 <YkwZnBIOQ/jwzq9Y@Air-de-Roger>
 <39640fec-de8d-0c5a-c9aa-daf83fb785b0@suse.com>
 <YkxkfbNpR7yfLP7W@Air-de-Roger>
 <17163e1a-6598-5949-47cc-eb9734bc69ac@suse.com>
 <Yk1erGso3rC68m/e@Air-de-Roger>
 <c9186f2c-25a1-6d97-cac6-126bb32bd22b@suse.com>
 <Yk2gRvXUCfKwRBEj@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yk2gRvXUCfKwRBEj@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0040.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::15) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 512b84ed-76a6-4074-579d-08da17d8bbe3
X-MS-TrafficTypeDiagnostic: AS8PR04MB8691:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB86915362A0AEBFDE606C82D6B3E79@AS8PR04MB8691.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kGc26os5+9jQ3h6siNHUSW9//W1WKqv4w2ZFZ1xP6kbq6nW5uqkpoJAYORe4mC9TkJg5GOdRUO/eUZbV3Y2YuuNKHhwc2ROT8/0gNNLQI963h6jrlUyaOF13qOIg3ilNkXtRO/Meqz6aLcRjAvPmjNUcOOS5JMvhTBpKTy4UcnM4P+YkpK0qI6XEJYZCP9AhZvK8KIBMJ+RTQPZ6LLlCwCH/957YnT373QkiP+sC08heGKjzryPJ01QTJVFP6OtVwHR5GOQqeA9nOqo4ZaV5dxs+FPeE8q4AXzLqdRatX/SqIkWDAQYCooOvShxiQImliJpxYyy+T5QaiL46DpWmZ9PMhEX1VbpTEyTqfU3CjYp6barGhZNzlWGGh4SJDxoEZe73TK2Y8NnZI9lQavLhc8KN9uZpO95cA4hcXUnTsRQ70wlOYxCVeURhiM5AeAxbcESLdc47eFFRovcHaCMMLJ1C+d5YbkGQqm0jWOMjsBxdfcw0CaDanNVU0pRRMEC+xlX19G9CQPyHceorCbmt/zTbyDBM4UqwFLiVT6osVzTdJDVzME1nbIR0L7ZjSiPZamG5a1V0enGkXS4p/E/eZDKvC9v+3VtIa6djU4o3jn3ii5Og1P0vCsKMcETGdfIrAxFjpz7q3AciFxDZGZybyn/MeON9ICOJKK04UbEwZfzdzRjp9e+Am88Hbl09j4kWIWvfUguPQbCpy0RdR5bvBqDWASQjvF8xM8yLxaYB7R8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(186003)(5660300002)(508600001)(54906003)(83380400001)(6916009)(31686004)(2616005)(316002)(36756003)(2906002)(6506007)(66476007)(53546011)(6512007)(31696002)(66556008)(26005)(38100700002)(66946007)(8936002)(8676002)(86362001)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m2ipoib3TFR0Eo6aXCdhFdFyWyGrB83D8ww4wmgQqtNZ6fAVBNWDweYtVyTY?=
 =?us-ascii?Q?poJ8rKU1D4bK8o1B/jjwPSb82ETRyEYEjN8RjsSpjprlKER7Zq8RRFHdAckN?=
 =?us-ascii?Q?vKto1D6ZvWUOxTF/H2sM5QVD+rC6bzK6PhxP5fC0MseFZPnX37VWNC6MsWIs?=
 =?us-ascii?Q?fyRu0jo6F9OZna/aszb8oX21iytVV7iHce1Isb/Vf5qwCYNxT7ccPh8lH5DC?=
 =?us-ascii?Q?k5m1/5py8uVsrhRxwVjpfVoSG7Ncbo0R4vUSCLgfEs9xwYqtW6o6boX321KL?=
 =?us-ascii?Q?/JPo5IFVnwnKOLyfsyxrR69jTSQiu7v1tJXvnWgT6V3vWiblQ4AdZWCjdDiY?=
 =?us-ascii?Q?g+GMO6ghfMUOk2UUxnsZ6Si1SvwMAr91A6A535RGSOTDlPPiaBeNzvJLYwfO?=
 =?us-ascii?Q?zpqdbKsqY3fFAYDOCaG0ApnHClmcJ68JPiYjAk2DV37JyM6CfHD/9XISl0VL?=
 =?us-ascii?Q?r5Kznvag3hr6HwxPa2+nXWGT7CHbD8s6JYzjdXtPYY8ICKdy/Q4+wiIOUQy4?=
 =?us-ascii?Q?2oF63uZiO5XLMRYo39xsMe7tmXwK1o6aXo6qTE0HPIsT+l+lvq0caECCZJOz?=
 =?us-ascii?Q?mUK99fB8ZIEgl+597/UisrSH80Zg7HTfBjxtdrszTk0wsptjxoVdJ1YvLBYI?=
 =?us-ascii?Q?fySYdFatMqxCMmjw/2vgcUtolx4u6V8q0V5G4ls4QUzKs6Uy9gBeJzYrb+XW?=
 =?us-ascii?Q?uArm2778Eh54zg7+gAdURrlLOASu6sWF8ozn9V2GJOEz/SUt/xjoftY6jqbU?=
 =?us-ascii?Q?GS4oU6l63b70vt8JNKm2oHicnCpJdInHN6/4pTZLthv0sGnpdWAa0An2qpHI?=
 =?us-ascii?Q?xGutzX6ZBC31fRG9zLoeiMt4NP7xWVtxn58dyrCxLbY+eGg/EtVWxYNrLwJj?=
 =?us-ascii?Q?oX/Z73do2CVSgddN2ZtEc3hgdeYjO+u3W6goWu5k/0zTastQOMDNT6oOxfwn?=
 =?us-ascii?Q?gQwlsjkVvmbedq4ICDB5kVwI9tujNHRW/DP/xBLztAzYcasA1tK+rMB5udz0?=
 =?us-ascii?Q?1Ykf/i03EgYcBSGnMIvFE4TXt6FECIUHdWhOHbGgyQNTzDBaaAdl0SDNvWAJ?=
 =?us-ascii?Q?fVwFhZqtvDzUwh9BPZecyzIPOJKbonDBOiTnYtrd1kYfzOdhu6hc6LqcNay2?=
 =?us-ascii?Q?JaCtNkIo/HOUdGCS4RQu8fC+AmfgRT8ZT8IgY2dZHcg8dgdnuYrasyb5ZAFi?=
 =?us-ascii?Q?b20WaK7YhoWXrAuLk31xW2j/tpNeNX3XwBa/7oba7E/c/uM/XqQ0uEsguTR7?=
 =?us-ascii?Q?Qd4aI/3W/JuXOtdWYCnQZiSu7CIsdnRrlIkjCe2RfBK0O/qCHjuC2MPbt/RR?=
 =?us-ascii?Q?nVMxwEXN5ibfUUcAzjIx3hRD8YdYsWL6HAIk3DtWkYRwvhDQRp1eImliVFRB?=
 =?us-ascii?Q?7/h2UdGcIZy3vx2oHkrb6s/PjopYZi3zG2RkJifxepGbe9iQyaazg/92gNv3?=
 =?us-ascii?Q?a6KfZiCMqfzGfnMoY21WPcYAE+z3yvCqgonTvkRcmnGU+MaATC7bNQklCzUf?=
 =?us-ascii?Q?dTWR2pblj1SYvY99vt5wyxHkxj3BIGY3duHJwzRfHmq8BBkEmgiDGMGxWlTv?=
 =?us-ascii?Q?GC9r/i2feQ7RVJhEYV2xFFOjg0gwzhBhPo353Up9TWDNeLLmUshG/DlD3T/k?=
 =?us-ascii?Q?+kLHYG3FU1JT+/xJ2gdvFPur/dKRnCbi+7XHM1mEEvR/YmPAfk2sK2drBzVk?=
 =?us-ascii?Q?pVNJQflIp+943wzlAc2Z4pvbkvNaOE/7Qn6RnEGaQJ8LJdFc9zsj/wZyFc33?=
 =?us-ascii?Q?tYy6ipz2Fw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 512b84ed-76a6-4074-579d-08da17d8bbe3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 14:21:26.0365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yT97GLS+Z7XCvNBUd+yVU7YQs+6Lsh9HK4+VBaWsyHShmzFdsS56kSsKh5tbimxXGCc8Jv4YDOcvfrFQ4XqN7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8691

On 06.04.2022 16:14, Roger Pau Monn=C3=A9 wrote:
> On Wed, Apr 06, 2022 at 02:40:50PM +0200, Jan Beulich wrote:
>> On 06.04.2022 11:34, Roger Pau Monn=C3=A9 wrote:
>>> On Wed, Apr 06, 2022 at 10:44:12AM +0200, Jan Beulich wrote:
>>>> On 05.04.2022 17:47, Roger Pau Monn=C3=A9 wrote:
>>>>> On Tue, Apr 05, 2022 at 04:36:53PM +0200, Jan Beulich wrote:
>>>>>> On 05.04.2022 12:27, Roger Pau Monn=C3=A9 wrote:
>>>>>>> On Thu, Mar 31, 2022 at 11:45:36AM +0200, Jan Beulich wrote:
>>>>>>>> +    EFI_EDID_ACTIVE_PROTOCOL *active_edid;
>>>>>>>> +    EFI_EDID_DISCOVERED_PROTOCOL *discovered_edid;
>>>>>>>> +    EFI_STATUS status;
>>>>>>>> +
>>>>>>>> +    status =3D efi_bs->OpenProtocol(gop_handle, &active_guid,
>>>>>>>> +                                  (void **)&active_edid, efi_ih, =
NULL,
>>>>>>>> +                                  EFI_OPEN_PROTOCOL_GET_PROTOCOL)=
;
>>>>>>>> +    if ( status =3D=3D EFI_SUCCESS &&
>>>>>>>> +         copy_edid(active_edid->Edid, active_edid->SizeOfEdid) )
>>>>>>>> +        return;
>>>>>>>
>>>>>>> Isn't it enough to just call EFI_EDID_ACTIVE_PROTOCOL_GUID?
>>>>>>>
>>>>>>> From my reading of the UEFI spec this will either return
>>>>>>> EFI_EDID_OVERRIDE_PROTOCOL_GUID or EFI_EDID_DISCOVERED_PROTOCOL_GUI=
D.
>>>>>>> If EFI_EDID_OVERRIDE_PROTOCOL is set it must be used, and hence
>>>>>>> falling back to EFI_EDID_DISCOVERED_PROTOCOL_GUID if
>>>>>>> EFI_EDID_ACTIVE_PROTOCOL_GUID cannot be parsed would likely mean
>>>>>>> ignoring EFI_EDID_OVERRIDE_PROTOCOL?
>>>>>>
>>>>>> That's the theory. As per one of the post-commit-message remarks I h=
ad
>>>>>> looked at what GrUB does, and I decided to follow its behavior in th=
is
>>>>>> regard, assuming they do what they do to work around quirks. As said
>>>>>> in the remark, I didn't want to go as far as also cloning their use =
of
>>>>>> the undocumented (afaik) "agp-internal-edid" variable.
>>>>
>>>> Actually it's a little different, as I realized while re-checking in
>>>> order to reply to your request below. While GrUB looks to use this
>>>> only "just in case", our use is actually to also cope with failure
>>>> in copy_edid(): In case the overridden EDID doesn't match the size
>>>> constraint (which is more strict than GrUB's), we would retry with
>>>> the "discovered" one in the hope that its size is okay.
>>>
>>> Hm, the specification states in EFI_EDID_OVERRIDE_PROTOCOL.GetEdid that=
:
>>>
>>> "Returns EDID values and attributes that the Video BIOS must use"
>>
>> I'm tempted to say "We're not the Video BIOS." ;-)
>=20
> I think UEFI expects this to be exclusively used by legacy Video BIOS
> implementations but not OSes?
>=20
>>> And since EFI_EDID_ACTIVE_PROTOCOL will return
>>> EFI_EDID_OVERRIDE_PROTOCOL if present it makes me wonder whether it's
>>> fine to resort to EFI_EDID_DISCOVERED_PROTOCOL if the problem is not
>>> the call itself failing, but Xen failing to parse the result (because
>>> of the usage of must in the sentence).
>>>
>>> I think it's fine to resort to EFI_EDID_DISCOVERED_PROTOCOL if
>>> EFI_EDID_ACTIVE_PROTOCOL fails, but it's likely not if the call
>>> succeeds but it's Xen the one failing to parse the result.
>>>
>>>>> Could you add this as a comment here? So it's not lost on commit as
>>>>> being just a post-commit log remark.
>>>>
>>>> As a result I'm unsure of the value of a comment here going beyond
>>>> what the comment in copy_edid() already says. For now I've added
>>>>
>>>>     /*
>>>>      * In case an override is in place which doesn't fit copy_edid(), =
also try
>>>>      * obtaining the discovered EDID in the hope that it's better than=
 nothing.
>>>>      */
>>>
>>> I think the comment is fine, but as mentioned above I wonder whether
>>> by failing to parse the EDID from EFI_EDID_ACTIVE_PROTOCOL and
>>> resorting to EFI_EDID_DISCOVERED_PROTOCOL we could be screwing the
>>> system more than by simply failing to get video output, hence I
>>> think a more conservative approach might be to just use
>>> EFI_EDID_DISCOVERED_PROTOCOL if EFI_EDID_ACTIVE_PROTOCOL fails.
>>>
>>> As with firmware, this should mostly mimic what others do in order to
>>> be on the safe side, so if GrUB does so we should likely follow suit.
>>
>> But they're careless in other ways; I don't want to mimic that. I would
>> assume (or at least hope) that a discovered EDID still fits the system,
>> perhaps not as optimally as a subsequently installed override. But then
>> I also lack sufficient knowledge on all aspects which EDID may be
>> relevant for, so it's all guesswork anyway afaic.
>=20
> Yes, I'm afraid I don't have any more insight. I'm slightly concerned
> about this, but I guess not so much as in to block the change:
>=20
> Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

> I would word the comment as:
>=20
> /*
>  * In case an override is in place which doesn't fit copy_edid(), also
>  * try obtaining the discovered EDID in the hope that it's better than
>  * nothing.
>  *
>  * Note that attempting to use the information in
>  * EFI_EDID_DISCOVERED_PROTOCOL when there's an override provided by
>  * EFI_EDID_ACTIVE_PROTOCOL could lead to issues.
>  */

I've extended it like this.

Jan


