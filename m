Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A336E4096CB
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 17:11:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185768.334494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPnbq-0007Vp-Mr; Mon, 13 Sep 2021 15:11:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185768.334494; Mon, 13 Sep 2021 15:11:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPnbq-0007Sk-Jt; Mon, 13 Sep 2021 15:11:02 +0000
Received: by outflank-mailman (input) for mailman id 185768;
 Mon, 13 Sep 2021 15:11:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mPnbo-0007Se-L0
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 15:11:00 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 011c690e-9a43-44a4-a732-f5aab73ed942;
 Mon, 13 Sep 2021 15:10:59 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-5-DJ4C9hkdPYy5QWpvKEyCmg-1;
 Mon, 13 Sep 2021 17:10:57 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4942.eurprd04.prod.outlook.com (2603:10a6:803:59::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Mon, 13 Sep
 2021 15:10:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 15:10:55 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0230.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 15:10:55 +0000
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
X-Inumbo-ID: 011c690e-9a43-44a4-a732-f5aab73ed942
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631545858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x0Nix/BQty3d4hMsYGdJoWyAd7PiBki7IBpOlUEVDe0=;
	b=ckEyi77AUO4wS9DalKaGZGEHWb01V5TKucVgMofcfyxRWKZCVEOKGe8AvStrmCSOKrHbXm
	NKsKzuPMJ2b4w1tG2uhBTM3z8MfgIDR69S0lAu2EH/aeAAFFrVRow/nnxcnEVcwbG4cKIA
	h6C7NORh1zJEPN6jDjVR61d9ImnOIvs=
X-MC-Unique: DJ4C9hkdPYy5QWpvKEyCmg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JkOhk5Dn296LSPUGuiRH4SHmk9LRIgkQLY2WkXSesWJu9wTRPtbAzblCqw8sDccD30xvhbqejeUn9c0avgc4lfS0syIN6aTsire0nftMeT0Vuyam/UTXvBwckINlGcxyA+F3oPP0w5d69IUdsh1du6BP5lZOoMWjosGOtHWd7MVtLiSEybbad1bO+OqQgxNRD65XlWwFq5VUrwZp5i1T15qUB8149WY1u/5KltM9/RaSflGMfxc4xJMxysiwUdO/JGixPgQY+SCX0LY4XgvUP4UOZY8RUX36Mr91uPBx+KVb6g/PEYzg2uk8XXPK/PO0lxJsOJUcFabMS8bbp5kbZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=rMX6OAGq30Sj46LFCENaQfupOkDxkPlF1839vkmC/+Q=;
 b=ZzYGWi6bCmzhtVMWCWWyTUAkUXcT+5keo/npTvKT0iTuyxyCQrXbe7MQiXe2JyQGCwYVmiLLxIUxqCnP3Kr6hesazQgaP9HU6luOOe6CVQnWxVYGX3P5v5mfY/lT/Kaq6z3o9XKCkRCnRABgDtK308Aj/8Fuk9m5VCFl6/KYyA/9JhISgkKr7mOKt7YJsQRBbXfmMMW32nU6WSSvQQOx/GrsVuK/glfWiMv+MRvd0mWeLNcVDabHtBKpxUH0afS5Vx7/zj+7kAFFcGPR+MlRHNxndmWyW6SSBacsVQEJBe6bmVsuHrAjQMnfmgriphPdv6iwk5bEdpWFizstKiO5gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] x86: conditionalize workaround for build issue with GNU
 ld 2.37
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <4efe38f8-16a7-ad66-04dd-d55aadd57166@suse.com>
 <YT9UADtkz00JJkuB@MacBook-Air-de-Roger.local>
 <7c97de87-9687-a088-406b-33faf037244a@suse.com>
 <YT9hHPpt+SRU/Cv0@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2959d91e-1048-a4dd-7f79-ec1d14b81d02@suse.com>
Date: Mon, 13 Sep 2021 17:10:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YT9hHPpt+SRU/Cv0@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR0P264CA0230.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8173aff4-b3e2-49de-192a-08d976c8af4a
X-MS-TrafficTypeDiagnostic: VI1PR04MB4942:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB49427EE39D329711316AF379B3D99@VI1PR04MB4942.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KxjmM49fmlBtFL5IDm89PVcvP5rvgsBa7VmxDzxXT+12sTKjyheFb+peM6ASbG016S8LjmW6gsOx2wjhRLJpSNKockGDrYWjG+PirXLMHf0cHM0y5XnNJ5AE3uvkyS8StUJNPcGiMC0f742KATuvlc/yYaRPOTkI+1mJfyO7UEJUrnbxQC1cPI+yp4PYchodelwEkQ5UHYfPDl2byHjHVlRrgkmD6GNvDcuNgH1zS+9P/5XTNxP20U1SWuT/xW09CuOfR0IIgvLYAaRHVd+UeYoRm41n6wp9JLqw2Ya9gV7x4HxJP7JOfz7uS6u7d4pwYYxDJ7+l4/6Gl/wEtQAWTV9M/AWf9sQgs/Tqgc1qTd8HW8i8dYrR0jJOYiSVG3c5DFPAuYSiDk/m35+ldUrv4VFT9L0TegizzRVofzbtosJpFghgRrYJuwTzzDmdIh2QNX5W30q8JnZVGKsGKEpasVIyxq8AwlZOFtqQ6hDApe6y5Qz8UEeHcY2EH/+mK11aqMooAypJJBgfZge0HFqdcEOvlKTQd3V3BYqAE1WD9UySzdWLs9cdBQdbJMY99ULHa7yf+3jJx6WNsTnxn+IjZxq9WOVH3nI7BhzaZcDQuRQ8H6ACifQzQpY2x0dZQACZRY+DzN4g4bBYGeQUo+URn+FVCcQI2gRtrkmWzoNhQazGNjivh4/UH9Vc2m7jzHsO/4G3JTPXqyw6Arl9TsDy/Yhypz4AbFpp1aycgmQOkwVEBptKkPn9yJS0MoPXjBFj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(396003)(376002)(366004)(346002)(186003)(478600001)(38100700002)(2616005)(956004)(36756003)(86362001)(8676002)(4326008)(54906003)(66556008)(66476007)(16576012)(316002)(53546011)(5660300002)(8936002)(31686004)(2906002)(26005)(6486002)(66946007)(6916009)(83380400001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EiMO4y6vQ+WHZMNeKHkWQdww+QVWyRx6HHVtYiOYnnwNvIhlZhSZRGotKYHY?=
 =?us-ascii?Q?6EM6pUuRnMtww2QjnOw3z/HtjjVc3d4XzfTJk5cUEb2zRbdPQWOCbwgFzPMJ?=
 =?us-ascii?Q?U3ArO46SnEB8s7goUgFVDDwfFiicfo/dcOONHRnk3Bhkj7hWes6yZ4e50lhi?=
 =?us-ascii?Q?RQLv2H0D9CFbjlZTO4a/4YpNitZzhgM/rXEquBIo6OL2NDXDaIxSmslnPzdB?=
 =?us-ascii?Q?hXC4lSr8qRpWdZvHiTIH7UXvIXp0c2XsIrBr3ZOax5oPQVqVCJTz7sUb2/RM?=
 =?us-ascii?Q?YJTd0qdKpJ7AyIj/NpDRPpdLUaAux42kGNp10Fr0BJ22nYudApHGlcBeqW7y?=
 =?us-ascii?Q?pTcQm+NIjz6Cxb6IEi9TDTaOOzF1EVSzlmmbg2GnpdYW/TFBukGXLXtAehmP?=
 =?us-ascii?Q?SccZum494dPYrK9b0c2G0FikbC1p7VmA8at1gmyjdR1tdIJZ2ZqfpYulG4eK?=
 =?us-ascii?Q?0fNF18IcHPWsJD+DEBr3OmVi4bxLUKS35Z9OwALDXwInWdWS3KfqYupCUKvD?=
 =?us-ascii?Q?4eH8IWGEUN80QUDr1+esCebhh9e/dKe8/WIxj5leYbCW9kSXr3gSRouoxRoB?=
 =?us-ascii?Q?r0anireWUMUy6FoxX7p4q+jYrlKIRQnM8RDLZ/bQr4lp9/+Bj3EjtQMMdPeg?=
 =?us-ascii?Q?TDZ1SSVxhC+NTPgQwovxreXihMysSegXqXShYoGDEwF0BhrIsHdOGXCWZkwa?=
 =?us-ascii?Q?mWaVq8ttQFP6xILqw9nboX8VzcCaaVYur7u3F0xSrzqDt+S5RqxlfZ3yJrLK?=
 =?us-ascii?Q?jwQzLda8hU5PyDqyIoJCqvHN2OBxjDA1TkmtC3KidML5d0qi1Fhj6mSmyyov?=
 =?us-ascii?Q?JU6VJSdfDPtaPnl9sA4cM9efKL7Kj2UtdvURDfbrCSCJqzLKNdkojrLbrUas?=
 =?us-ascii?Q?AD/PRBP9FHgMu+RviseNo4o8HDzMLKU9n2Wc5i3L4/Znq2s9j/pk2nnopp/h?=
 =?us-ascii?Q?51HhK/K2YgNnSK+Ryq4tHWtQp8JmW5NlyRiPg/7QYRAKDdnu6nu/Qw+fV4H4?=
 =?us-ascii?Q?fGfDrvYxVPTY5PTCMGWMY6rerQjDg+2XkHTEKnJEqiTGiy5X1MuBPgpURTxH?=
 =?us-ascii?Q?6qGvcRwxxhpQfJi2aYDZ0jLUN6iVmmGVzHPnnXME2aHvBqDDqstL7YkeVbpy?=
 =?us-ascii?Q?t3CX4FGOTRFPulwKF726q11/XEh8EZkT9NeGufPMofZOaQjNiDr3UD7sCxNN?=
 =?us-ascii?Q?Pl+egIrl7PTTjUfnJKymsdK1sBevr0q0UKV3owm0K99KiyjKyrzvOvYrKJMc?=
 =?us-ascii?Q?ow4xZa1ssxPRyGB1MN7SxkAhck1QjNqjUvYg5N1FPoO8JoX0M7BsmxKtPBCO?=
 =?us-ascii?Q?y2uhk9EVIBKWSlViwf29jVdF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8173aff4-b3e2-49de-192a-08d976c8af4a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 15:10:55.7100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PpQmkxqBW7Yry2TFjD33wsBvv66CvEXeK7uqJoTfb8AqzFdDkZLWI7+WK9R7w83zaq9dsyJuIf3ptN7ciq/n0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4942

On 13.09.2021 16:33, Roger Pau Monn=C3=A9 wrote:
> On Mon, Sep 13, 2021 at 04:05:15PM +0200, Jan Beulich wrote:
>> On 13.09.2021 15:37, Roger Pau Monn=C3=A9 wrote:
>>>> --- a/xen/arch/x86/Makefile
>>>> +++ b/xen/arch/x86/Makefile
>>>> @@ -92,10 +92,16 @@ efi-$(CONFIG_PV_SHIM_EXCLUSIVE) :=3D
>>>> =20
>>>>  ifneq ($(build_id_linker),)
>>>>  notes_phdrs =3D --notes
>>>> +# Determine whether to engage a workaround for GNU ld 2.37.
>>>> +build-id-ld-good =3D $(shell echo 'void test(void) {}' \
>>>> +                           | $(CC) $(XEN_CFLAGS) -o .check.o -c -x c =
- 2>.check.err \
>>>> +                           && $(LD) -T check.lds -o .check.elf .check=
.o 2>>.check.err \
>>>> +                           && echo y)
>>>
>>> Do we want to make this a Kconfig option (ie: LD_UNQUOTED_DASH) and
>>> then use is here?
>>>
>>> We already have compiler and assembler checks in x86/Kconfig, so it
>>> would seem more natural to place it there.
>>
>> The question of whether to record tool chain capabilities in .config
>> is still pending. I'm not convinced this is a good idea, Andrew keeps
>> shouting me out for that, and an actual discussion doesn't really
>> happen. Yet unlike back at the time when I first raised my concern,
>> Anthony meanwhile supports me in at least the question (to Andrew) of
>> when such a discussion would have happened: Neither of us is aware,
>> yet Andrew claims it did happen, but so far didn't point out where
>> one could read about what was discussed and decided there.
>>
>> For the few uses we've accumulated I gave (if at all) an ack for
>> things happening under some sort of pressure, with the request that
>> aformentioned discussion would happen subsequently (and, depending on
>> outcome, these would be converted to another approach if need be). I
>> have meanwhile realized that it was a mistake to allow such things in
>> on this basis - the more of them we gain, the more I'm hearing "we've
>> already got some".
>=20
> I see, that's not an ideal situation from a review PoV, as we don't
> have a clear placement for those and that will just cause confusion
> (and more work since there are potentially two places to check).
>=20
> What's the benefit of placing the checks in Kconfig instead of the
> Makefiles?
>=20
> As I understand Kconfig is run only once, while the Makefile could run
> the check multiple times.
>=20
> The downfall of having them in .config is that .config could suddenly
> change as tools are updated or as it's moved around different systems
> (yet .config already contains specific compiler version information).

I should have added in the earlier reply: Besides the pros and cons
there is, to me at least, also the abstract question of whether such
information belongs in .config in the first place. To me this file
has always been a record of build-meister decisions only. Quite
different from the output of userland ./configure, where checking
various aspects of the environment is the primary goal.

Jan


