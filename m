Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C498652A17E
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 14:27:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330761.554144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqwHq-0008DZ-9I; Tue, 17 May 2022 12:26:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330761.554144; Tue, 17 May 2022 12:26:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqwHq-0008Ac-69; Tue, 17 May 2022 12:26:50 +0000
Received: by outflank-mailman (input) for mailman id 330761;
 Tue, 17 May 2022 12:26:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qAxi=VZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nqwHo-0008AW-2y
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 12:26:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9dae5524-d5dc-11ec-bd2c-47488cf2e6aa;
 Tue, 17 May 2022 14:26:46 +0200 (CEST)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2059.outbound.protection.outlook.com [104.47.5.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-3dcvZGLeMMCn5MUllOHytg-1; Tue, 17 May 2022 14:26:44 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR0402MB3551.eurprd04.prod.outlook.com (2603:10a6:803:a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Tue, 17 May
 2022 12:26:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 12:26:42 +0000
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
X-Inumbo-ID: 9dae5524-d5dc-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652790405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RigtmVJAaj7LtgR2N5DASSS8x7PC3xBRyj1auGWA05I=;
	b=ac8MzmpoDweZJ82ZzUtaFhxousq9t2XWIXyl7kp25ndLZCW+h1Wq10TQVhNcX2J7r6R9ru
	/g3Ne/jvDzN+Z5+zfIV5QYQ8pnWkezQsWC4bHV7IngA4KTO4kqH7YudR9U7WzjSs7XO/0K
	1EvE0vxahPSs/ixnoZysz5f8VfBsFoY=
X-MC-Unique: 3dcvZGLeMMCn5MUllOHytg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m42NSX0aThIhXtgKlEJPJIxMI0sIJoBeW9MSccWBAUpWPXwTBUbuPzCV5ObwbTnn/ewDYSLWerZcAS9Ynj/eyXdSoTuxmCc3u1+2eCsQFxFEmuWvbCDUSY72GriOIJuCmy1x28k7HLhevJLLGdhOgfrufo5bi4DhVxb5smOP3+pv0K6Vegfa11npgbybymmQ6sptXEsc7oKibuJOh6zW6Lud6A5BIZOeuj/GUBlT4LknweNZ0qyP63oDmerkN1AeJ1Vhh91NQePH/o9NBX2S+rLGSqWea93IQYONeKkZoaQCXU/kPDXxUbjcp7JEsGOv9MmUXu8pLI4pK4ioTPeGrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvCzcvsTO1Q780HB0rcV6T6FU8XbCKVcE6SdRiW7EG8=;
 b=HkhGSVxvATQtNTVzfcX5A1hLBXW8TJatBuT6zwpyOV+Fxw2wa3ZTubJSxtDX4E7YBezxUzEbSz+023ofSW5LWJuKKSVYgi5WbNZYjMxSciMyJ/hX9/SN15+XlOSLZa3T5x9KwgQKsnhq2SIDSsyN3/NjrINmDGAAdQVUZfvZ/hhARpzehAG2hHS0XlsYV1W1gDFAAQ2WYisAxGyMv2fBeqn1eVyY4nhhvA+OMvsTnWcRT9rT0dCdUn/HII9Mqo+FUDJnkQs/BEPXnj3x4Sxyr6MlcdHufOJsCZ86ads5Yc+LqiK+vFQmDvVvRRSzwBszLroGua/GtTdpZuTqrFPrYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cd957386-060c-7921-22cd-36676cf209a2@suse.com>
Date: Tue, 17 May 2022 14:26:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] build/xen: fix symbol generation with LLVM LD
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220505142137.51306-1-roger.pau@citrix.com>
 <cc494c68-787a-3cb9-f192-48511d5577cc@suse.com>
 <YnUjICUinDIiNJ3p@Air-de-Roger> <YnVAPMZ0+dd9jLF9@Air-de-Roger>
 <5cb23441-d8c1-5640-d630-30881841db0c@suse.com>
 <YoIE0eI9vvAHNMlc@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YoIE0eI9vvAHNMlc@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR04CA0049.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::34) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ca22ac5-f86e-4720-a7b5-08da38007f61
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3551:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3551D0BEAD6918157AAE6721B3CE9@VI1PR0402MB3551.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XVOZk3on0+IISkOvaVRj/YXbrAknVy9kRyVLlCw0N0r+7ZHU0ctGtWTTywK2FCJCfDbLpBSxwpa/u2scbFF0f66M25AnxPxjLAJelRLw74Os4iVeTdMJEJDDRooHoF5T8H4iK4D8RSryToPharpO/Biw38eif+yaF5o+3SyRa0xhUSSzePWb+deL/StSh7xvtZukv3PxS0CXKS4rxOXylD9WE8G4eIBwVQo7XAgg/qxwzZSJn+5lu9vujRnbT7FWBkHcY14478UFK2emdY3sU4iTQNF1Gci1Bk1EyGPHISL8o6aSHRdpN87cSHYYeZ+CHYq00qW65TeZ+n3NdeJiOglM1pkuDX3UhhKBvObFEe3gG9ySQoNYSmPPP1kMtt6ftQdgMAiU83UY1TSzOKO5mCKtwMI3A+RsweTQjDgS7uLSiOdcQmOjxJAkoeolTmbIlJEenyOPVv/Dp4WFBeuODCU+cW+KZln45IlxQrAebvMNeCBNN3fzDmzLbZIC1xw3/l2WTMh9hV7oTJZlFoyvZlurP1JLF/DI3Cu/SrnJIMDabCQem05Jhdm5K+F84XEj0fHIuHsrVSfyK7lK+LAphBCIxEeQz3WGlj17FzieveDUaI7aHqrkVtoT1J3EXg6OegvuGUGmsyLvROrAvPVpzZcwyhJZNwzTZuAtk51Iz86rz0Y95N2uEE3PiJBgVYBiHiHGzVnBWpzk9B0etB31AazP1uKd1MDopRdJMvLOjnJs086t2Kq4cBI6KHqNRV9O+OA3xV0LTN3ANs+KVLuaf1cjLzcXlO2Bra9MfiyFaSlstHCbf47UUM9EkDVlDZdgM+twO6GhzR/1klRPLv78Gw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(66556008)(4326008)(36756003)(2906002)(186003)(2616005)(66946007)(54906003)(31686004)(86362001)(53546011)(966005)(508600001)(83380400001)(26005)(8936002)(6486002)(5660300002)(316002)(8676002)(31696002)(66476007)(6916009)(38100700002)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YrFBAkwRYf1ltqh7Ra/Rntxf+fYLq9bhXzGWGOjKrQbUwYrtS5k/C7d9itnj?=
 =?us-ascii?Q?1i94mafvmGCCw9xqrdmQC5FJclz8r08OYiiqK3dcHaK1bjpFsE3QoIUEr45W?=
 =?us-ascii?Q?guTIS+0VsdyJrBHefkY76IxnSDO20BY3jiucYuGVpHGAMmvBcciDy+lotQol?=
 =?us-ascii?Q?04xZr+jgl+KDymxBHmqMC6UN2S9x1sc9/L9ysV4YLmVkOoPastf0nPIqlT7y?=
 =?us-ascii?Q?6rA1qgGMZLmYQvzKuTaWZYFO+PzfUTZoHn8mHU9EXSiAafrmeW319p/+Qslh?=
 =?us-ascii?Q?veL7EN3dBpaUB8VDULU8fRxhAdUUajwq6dTYp4ROkIzLGzI1js6BHMor0GEl?=
 =?us-ascii?Q?nEgTRTM4czUJ3BdP5QGBy/pp8JiclWSjrTq7Y2LXBezU3gSA+Oa8afhcOHh/?=
 =?us-ascii?Q?bg+1NUC+cp89lx97xPQjuEa03OyGUHckbffApEGYpzB30BR2u0qbICDCD/Pt?=
 =?us-ascii?Q?uNsbkjMzg/HYnA2UN6WXfJrRrE46MzlTmcQCCp/49oWDJB1ukydzd+lTLqV8?=
 =?us-ascii?Q?lADrqES/EUdxcONf80VN5k6mT+Lrq/IbvB/o+BLIcWecYT57Fp1OVaCusaHK?=
 =?us-ascii?Q?cuOZ+w5p4x7ZvH2cPBE21QFgsMFNnfSx+ev//sZlZI3RWZBTMM6TsPIfGZCj?=
 =?us-ascii?Q?vSzzrSA1ibQlolCSQ9AyhC1NuJP2Z18j47AbTtbiEv2XhzmcQdHrMNAlC6tT?=
 =?us-ascii?Q?siDsdBBTuix1ww4x3GTP6oMILRd02LD5bBco3WTl/9zF6BUB84FJZo/5saIg?=
 =?us-ascii?Q?EBCxjcdmiLPDcQVBbxUM/xHs/w06z8tT75aYLyVyd3no/cl/+UGLJO/9q+S7?=
 =?us-ascii?Q?ms6Yjm3GGZHpLsa9UZKNTJN+jhDMfJpHZkneZzsohoI4B+9hbNekQpImmu6U?=
 =?us-ascii?Q?rW5kepY7SvEx1NhdV6EJdYdm7nOJjk/68xxZFQ5/3kU5y29S+cJp6Bbf6/Vi?=
 =?us-ascii?Q?PA2aho/k3Nfw9Cwet5tKP+LVoO95JndGgD6Qg8pV4ILb52nOXpPsaOd6CLW9?=
 =?us-ascii?Q?e7QdGpWKwrD3PYKVibmFHcwvZB9fa6EGZ9yESjKIVbUwMmSV7WlwM/RgxAiB?=
 =?us-ascii?Q?J1D//NwTMH7Cmleje8YMRMFqbCZPHK1G3fiRBzTOh9nlqudC3xND75Cg82FF?=
 =?us-ascii?Q?bitevwgP/vxiFlw3X9Fe5d+dQLEmzloYkWSd1q2UNWVEGteNK87ffMyhVJbt?=
 =?us-ascii?Q?rJT9mxWVMok01MFr5e6Tl+hlZIDQotO7etENuQlj/P3Y3P3ZAcF/2HJp+YKR?=
 =?us-ascii?Q?1PxegYfod8I6LWwNZNzAa2j+r68karXkokHlggcO3a+vqCrawW/kFkCK7e0Z?=
 =?us-ascii?Q?0E0DIM6rFan8SHzh/cfPdjlt+VidyENN61anbU2W8eQ9pLJ5F/+kZOPWPOmU?=
 =?us-ascii?Q?rmagE7q7MqU9fnZfie1zmYvBC839dgsFIaxLD+nCbNJBb2oataCnK/tF3U9X?=
 =?us-ascii?Q?xzSlbuIyFFZx1X2LzSvVob8FC3IxJ31Cy6NdPEq3cOzhQq1AvJRRXvWEAqGa?=
 =?us-ascii?Q?TVng4/nEksfT/A00fRWH9mroYhHOCxSeOZzPAyGhcncX1qiOkMgms0ztX/aj?=
 =?us-ascii?Q?sFluPVWcrPXh9ks/puG6tCqsqSfitrmEz+tE3tE2aVjvz20A4iEY/bDk+fvN?=
 =?us-ascii?Q?M/y6z2Zpw+fW7s7ywsV7cZc+7gg7+Lybr38ahjK5owNngErlV+DuNrFYkYCL?=
 =?us-ascii?Q?hOrQAwAANBnejfyCXLP9V9V9MT2kYGeuJQkGUmnKUSE91rcIKlkympH2cDwa?=
 =?us-ascii?Q?fX9tJw9WNQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ca22ac5-f86e-4720-a7b5-08da38007f61
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 12:26:42.1170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CjhOfH4M+rdRVzqFQ8/jGmuw7ytOVnjzfm4iy43amt2ThzUuLYGZUs6LeNS4O6ew0K0J9heit1j7Aa/1AG32Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3551

On 16.05.2022 10:01, Roger Pau Monn=C3=A9 wrote:
> On Sun, May 08, 2022 at 10:34:43AM +0200, Jan Beulich wrote:
>> On 06.05.2022 17:35, Roger Pau Monn=C3=A9 wrote:
>>> On Fri, May 06, 2022 at 03:31:12PM +0200, Roger Pau Monn=C3=A9 wrote:
>>>> On Fri, May 06, 2022 at 02:56:56PM +0200, Jan Beulich wrote:
>>>>> On 05.05.2022 16:21, Roger Pau Monne wrote:
>>>>>> --- a/xen/include/xen/compiler.h
>>>>>> +++ b/xen/include/xen/compiler.h
>>>>>> @@ -125,10 +125,11 @@
>>>>>>  #define __must_be_array(a) \
>>>>>>    BUILD_BUG_ON_ZERO(__builtin_types_compatible_p(typeof(a), typeof(=
&a[0])))
>>>>>> =20
>>>>>> -#ifdef CONFIG_CC_HAS_VISIBILITY_ATTRIBUTE
>>>>>> -/* Results in more efficient PIC code (no indirections through GOT =
or PLT). */
>>>>>> -#pragma GCC visibility push(hidden)
>>>>>> -#endif
>>>>>> +/*
>>>>>> + * Results in more efficient PIC code (no indirections through GOT =
or PLT)
>>>>>> + * and is also required by some of the assembly constructs.
>>>>>> + */
>>>>>> +#pragma GCC visibility push(protected)
>>>>>> =20
>>>>>>  /* Make the optimizer believe the variable can be manipulated arbit=
rarily. */
>>>>>>  #define OPTIMIZER_HIDE_VAR(var) __asm__ ( "" : "+g" (var) )
>>>>>
>>>>> This has failed my pre-push build test, with massive amounts of error=
s
>>>>> about asm() constraints in the alternative call infrastructure. This
>>>>> was with gcc 11.3.0.
>>>>
>>>> Hm, great. I guess I will have to use protected with clang and hidden
>>>> with gcc then, for lack of a better solution.
>>>>
>>>> I'm slightly confused as to why my godbolt example:
>>>>
>>>> https://godbolt.org/z/chTnMWxeP
>>>>
>>>> Seems to work with gcc 11 then.  I will have to investigate a bit I
>>>> think.
>>>
>>> So it seems the problem is explicitly with constructs like:
>>>
>>> void (*foo)(void);
>>>
>>> void test(void)
>>> {
>>>     asm volatile (".long [addr]" :: [addr] "i" (&(foo)));
>>> }
>>>
>>> See:
>>>
>>> https://godbolt.org/z/TYqeGdWsn
>>>
>>> AFAICT gcc will consider the function pointer foo to go through the
>>> GOT/PLT redirection table, while clang will not.  I think gcc behavior
>>> is correct because in theory foo could be set from a different module?
>>> protect only guarantees that references to local functions cannot be
>>> overwritten, but not external ones.
>>
>> Right, since there's no way to tell the compiler that the symbol will
>> be resolved in the same "module".
>>
>>> I don't really see a good way to fix this, rather that setting
>>> different visibilities based on the compiler.  clang would use
>>> protected and gcc would use hidden.
>>
>> If gcc's behavior is indeed correct, then moving to protected with
>> clang would set us up for going through GOT/PLT there - either right
>> away (if the implement this like gcc), or once they correct their
>> behavior. I don't think we want that. Therefore I think we want to
>> alter visibility between compilation and linking (i.e. presumably
>> right in prelink.o), going from compile-time hidden to link-time
>> protected. That would likely be closer to what your original patch
>> did (sadly there's no "convert <visibility1> to <visibility2> option
>> to objcopy, and making it have one wouldn't really help us here;
>> it's also not clear to me whether llvm comes with its own objcopy,
>> or whether they re-use GNU's).
>=20
> So I've raised the difference in protected behavior between gcc and
> clang:
>=20
> https://discourse.llvm.org/t/gcc-vs-clang-differences-in-protected-visibi=
lity-implementation
>=20
> It's no clear to me whether clang would switch it's implementation,
> but it also seems fragile to rely on global protected function
> pointers not going through the GOT.

I agree, and I don't view it as likely that they would change their
code. GNU objcopy offers a separate step for that conversion
(--localize-hidden), but ..

> Do you have any recommendation as to how to change symbol visibility?
> I've been looking at objcopy, but I don't seem to find a way to do
> it.

... kind of unexpectedly doesn't offer means to alter visibility.
So I guess you/we need to turn back to your original RFC approach,
no matter that it wasn't really pretty.

Jan


