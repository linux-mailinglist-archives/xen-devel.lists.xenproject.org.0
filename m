Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E42024091FD
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 16:05:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185707.334404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPmaK-0004BM-LA; Mon, 13 Sep 2021 14:05:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185707.334404; Mon, 13 Sep 2021 14:05:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPmaK-00049Z-He; Mon, 13 Sep 2021 14:05:24 +0000
Received: by outflank-mailman (input) for mailman id 185707;
 Mon, 13 Sep 2021 14:05:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mPmaI-00049T-M0
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 14:05:22 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e0bf23b-5308-4252-8ba7-2126b1970795;
 Mon, 13 Sep 2021 14:05:21 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-1-OhnX9NYZPhu7dVWADy-BaA-1; Mon, 13 Sep 2021 16:05:19 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2702.eurprd04.prod.outlook.com (2603:10a6:800:b4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Mon, 13 Sep
 2021 14:05:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 14:05:17 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3PR09CA0018.eurprd09.prod.outlook.com (2603:10a6:102:b7::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.15 via Frontend Transport; Mon, 13 Sep 2021 14:05:16 +0000
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
X-Inumbo-ID: 6e0bf23b-5308-4252-8ba7-2126b1970795
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631541920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CQviCSMPM0iLMcGOFi/gWQRrDdQP8OM6s1oLKQzotR0=;
	b=Xkbdflcf7hiEYMhwxC17cmnFTEWs8jRFX5TFjeHv4y3WlZVipNaaz2K7sBejd3m0noeuis
	KRGWO/k5iznaHLdCKiKn0IQcJ5dyT5bG/baLdYfmo1nTF7vGHkc/ay/6RUA0WFRr3YRnB7
	KJVsNXm6W+csjdu95LlO8VsP2E4efPE=
X-MC-Unique: OhnX9NYZPhu7dVWADy-BaA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TugzH6qATNlpLlNU4WLuiHgTup/rxjpFpdxlO857h+z/L/eLn7JIzrCWWI/FfJndNoeim90X1mHF5iHvmRmVd6Mw+axlW0aQ6aQDH3LPTQDFlSAEFAwiuBn7EsFi5TSAHs9tTPdSC2kOQ8IV5Mx3AMpuoyFQXRy8hfLw/wwzDmone1sMVehZrk8GzkbtHQSiQHX30qVHUz/TqJl1t+BKFERp9GJR6M1U5HSpWEZYH6j8nsEIuXceSqnbnfCN2xVbTgd+o54vZH5PT5V32O9kQC01eByQoXE6g9FtmKIteQT0bVB0x5nWqitkqW3NyTPPkBTnnK68c2jE61i+pOEECw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=NqcZ/JCvhiTM7eTgRBPnzioJbrgL+70KR0DQ93eXPLc=;
 b=nTQvQkDCT6BLQ1QZLsWu01fdqg1ycmI9vaCKIWvkS/WhRAGqCLJCb+5FubZi9sy45oGJ1a20+ORFEB8meFvYrGxmqsvO54HyLRZMchJIoYUlTVXbo5oXny8lDd4Wg+VgZJMU2Ax/52lqX0xxrsJHc6WpLExTMSmJcPZHE6DhGZYKl0pXIQUL7idC5WFnHVzWDJY+lRYpUD0HoicvPaD9MPEz5mk06OvOjGxuA3du5/FWC3xDsd4YUIDMVgE/EDZ67l010bTO8E4f+KBMFmNw/fPeSHK4BsHjkYaa2uDORcCzrWZqXHt7revLUPb7rETn/1v5UHEoOb/WNQxmZiII8g==
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7c97de87-9687-a088-406b-33faf037244a@suse.com>
Date: Mon, 13 Sep 2021 16:05:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YT9UADtkz00JJkuB@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR3PR09CA0018.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 522ff334-8dcc-44c3-1571-08d976bf8392
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2702:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB270287F7CA9A182CA3CDF9B9B3D99@VI1PR0402MB2702.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	re/Lss0HkttCEje1vrnO29VicXeae0IilSLD4ayIm4oYyXzcKAqZbB5vsc8CxyNnfQ/fUbBspZNlppWI7/Qy4DFn4Hs0m5haA75qGTyCbB9NGZ3NmCDVycLPiDZLxLmMFnLP9OcffBdxx/jblUgkYQDM7WKrnuPkYEGvcvklMoBC7YRh8VUkICeqQZzIiTW6CJdLbkBjC5pAHQLlHsIBu62a7tmkK+64m3H3mw9qo5Uhbt/R3fH+jko5oE2Cc/4Gc3VFqSS1h0pO1JsQvalkktrD6NbPrd0HoiyVziX4+8BiCAtEITVvuy+JL9+TVHk/QE6xf5fQn2tavvIgqnfYmUVrzzvVRqSqix589CCYzN/q/A5py/56ExV1HfbeCwZJZ9dRmxNlOytJ8PfVQ3uQ5S1WEaqkphQxGupyfZbBcSeoyIuso8WF/Lo82WzD/nUtq1FXY553E+CDsgDpxAk5B4IeUpqY949pYLA25iICMhM0ADp/XGiassRTJ9Io8YKXHuorgtPa2+7o/NoSPMmEDjPtW1RuI7wvXomltZ3+K4FXOgNLSDHaokx9xUVGCXl3XYHkpDAdVlFNlY+L7M62cKxhUgi//vXdi9qTyIqk5EUUhKxmygjesGDgDL7u3i5VnkwNap86E4XGLp7ir2y8G4Ag/2vh6WtT9Fq4blMRdhWUIhk7mZf0thZd0c9Woa0Qyl511YPUmFopc24hxIEk7cGnniu7/6ph/95hUhiEjJI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(136003)(396003)(39860400002)(376002)(53546011)(8936002)(66476007)(31686004)(4326008)(66946007)(36756003)(186003)(2906002)(8676002)(478600001)(2616005)(956004)(66556008)(54906003)(6486002)(86362001)(83380400001)(26005)(5660300002)(6916009)(38100700002)(316002)(31696002)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Bj4cm0VHXETEUb16+tgJvibTWvKdW8b9Uq9T0OuPE2HqjEn8j8klGHLtb00h?=
 =?us-ascii?Q?vRKxJ+7D9Y2cbGMaEOhPJtY9NoQpnbBSe+g7B+idvE/zD3biUiteerqxG2F8?=
 =?us-ascii?Q?jzTiogt+Igk1dVrzfXUqUMrdowmcQUoXZS8fXlGsh3W0r2C/SLleTs0jSHbJ?=
 =?us-ascii?Q?7OkGgIxiqm24he9LzCa7+HoOIlIWSqOzGcqMkwMKW5vkIpFk/g21/gwkkmWV?=
 =?us-ascii?Q?qDDNDbg4hh2y/sWbQBzobwe9V9z9BEeSw6QHqXukK4oTn5OQfB+X1ssuMBAu?=
 =?us-ascii?Q?xGb7G7m6SHGL1Q6x7ljRU6qXaupA5CFq4wKYUAVHVTViZpNU3vJBExfDHHXR?=
 =?us-ascii?Q?Y4zG4M/GZVw1QEJyWU2cqXO8DZ6CL6g85At6diu5OFlADVxryhEiaRN3bPwa?=
 =?us-ascii?Q?Ag7J2ZlSg13yBdI74+lsyAW8lFpJXUxzEf5DSkCYRPUgsrAZdcL99lOyIw+m?=
 =?us-ascii?Q?ruo3M9ZC+5eawxnQ35SVXe1+kjQFac7kumCYyhqeEYEx/nbPXRKvTFrAkucN?=
 =?us-ascii?Q?aBOMfgC7KxZf5X4CevW5eV/VWLQYdVEdJsnuLf0iVzDu6cfM7vr1qaYn4pXb?=
 =?us-ascii?Q?b/ANT8kx28mjg9EIV7/wJDo8Ot9B0Eh0C8cazwafAH6tygSw41C1gcxJ7fWh?=
 =?us-ascii?Q?Z39yvcgpTVIAEsyioy7rJcjU8Yl5/ncbH+F/DJBZ145bG1imcLb3XQAXNnaW?=
 =?us-ascii?Q?XQXQlwKjJWbkjsDjIwsBDOpYf/gczDPdQ/1dJillov68JWXYSt5xQSiMnp5P?=
 =?us-ascii?Q?JKrowWoH7sBOX3V1u0dasPjIGLEK2Qk8byOsax5bnc6/jFPedZFC5LVdlJ/d?=
 =?us-ascii?Q?L/yFEizhpFIPb4tAo5ZrRP5iC60xpRnz3PYDzYS5AeGY+boKug7/OywxJMhO?=
 =?us-ascii?Q?u5+x3xbvp533PEnz04F0As3fJfXRqZtXVV0irvpJ/s31DKi/vTuRD4HTKzqa?=
 =?us-ascii?Q?DsE+y6z4x7NmGlCfOsnOQWu3zDUlz9XTxqQgVRTQVl8zeKmpwTawXMRuGpFt?=
 =?us-ascii?Q?1zAv60320KLNEiGl9GiOgXuPUUqZDFipaXPB/Sh7Eh2MTfThq1VkMzmn8AOn?=
 =?us-ascii?Q?2rXO6LBNG6WvTDOEzadex2PdShUfX+siG5ZbdQe3t6GNL4eG64KmGoJIQJyE?=
 =?us-ascii?Q?cIhWItXW57U2Q8h7Njzl0w1rEA2z7bEBPcRKV7mhicR3uUJ+2PILhIwjQ3r9?=
 =?us-ascii?Q?KzyjhkzXisVn2pk/kqC8cynwIg0HnscVKew25o5kP9KUfRHKw1Ep8ok+Z27J?=
 =?us-ascii?Q?J/lHQCO0LEHwe1s+d05kQlEDVeXDJFCxjNmzIMaUmXq1zMY4Vk/Ada53Kp8c?=
 =?us-ascii?Q?4zxfU6Kt2uV/1INr0aFWWjQW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 522ff334-8dcc-44c3-1571-08d976bf8392
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 14:05:16.9664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8fo1tgVLscpmzJjTrV0MWikAhlpkICD0xiq2ojWhlCJHxYbAsB9u3sRq3Dqn9ggycLuc+A3MtcBRE7YFRV8hHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2702

On 13.09.2021 15:37, Roger Pau Monn=C3=A9 wrote:
> On Thu, Sep 09, 2021 at 04:35:49PM +0200, Jan Beulich wrote:
>> I haven't been able to find an environment where I could actually try
>> with lld (ld.lld); all testing was with GNU ld (ld.bfd).
>=20
> Thanks for fixing this. I've been able to test with LLVM ld and the
> workaround is fine.

Oh, good, thanks for trying this out.

>> --- a/xen/arch/x86/Makefile
>> +++ b/xen/arch/x86/Makefile
>> @@ -92,10 +92,16 @@ efi-$(CONFIG_PV_SHIM_EXCLUSIVE) :=3D
>> =20
>>  ifneq ($(build_id_linker),)
>>  notes_phdrs =3D --notes
>> +# Determine whether to engage a workaround for GNU ld 2.37.
>> +build-id-ld-good =3D $(shell echo 'void test(void) {}' \
>> +                           | $(CC) $(XEN_CFLAGS) -o .check.o -c -x c - =
2>.check.err \
>> +                           && $(LD) -T check.lds -o .check.elf .check.o=
 2>>.check.err \
>> +                           && echo y)
>=20
> Do we want to make this a Kconfig option (ie: LD_UNQUOTED_DASH) and
> then use is here?
>=20
> We already have compiler and assembler checks in x86/Kconfig, so it
> would seem more natural to place it there.

The question of whether to record tool chain capabilities in .config
is still pending. I'm not convinced this is a good idea, Andrew keeps
shouting me out for that, and an actual discussion doesn't really
happen. Yet unlike back at the time when I first raised my concern,
Anthony meanwhile supports me in at least the question (to Andrew) of
when such a discussion would have happened: Neither of us is aware,
yet Andrew claims it did happen, but so far didn't point out where
one could read about what was discussed and decided there.

For the few uses we've accumulated I gave (if at all) an ack for
things happening under some sort of pressure, with the request that
aformentioned discussion would happen subsequently (and, depending on
outcome, these would be converted to another approach if need be). I
have meanwhile realized that it was a mistake to allow such things in
on this basis - the more of them we gain, the more I'm hearing "we've
already got some".

>>  else
>>  ifeq ($(CONFIG_PVH_GUEST),y)
>>  notes_phdrs =3D --notes
>>  endif
>> +build-id-ld-good :=3D y
>>  endif
>=20
> I also wonder whether we need to make the quoting tied to the usage of
> build-id. I guess we don't add sections with dashes and instead
> use underscores, but it might be prudent to always quote to be on the
> safe side if dashes are not supported.

If quoting was uniformly supported, I might have considered that. But
it not being uniformly supported is the reason for this change in the
first place. Hence I'd prefer to generalize this only if really needed.

>> --- /dev/null
>> +++ b/xen/arch/x86/check.lds
>=20
> I would maybe name this check-dash.lds, in case we need to add more ld
> build tests.

I sincerely hope it was a one-off that a binutils release got cut with
this sort of a supposedly prominent bug. Considering that the dash is
merely what we're after in this specific case, but breakage was wider
(presumably about any printable char that's not alnum or underscore),
I'd consider check-dash too specific a name. You only say "maybe"; if
you were sufficiently convinced, this is an adjustment I'd be willing
to make. Yet even better would be if I / we could just be done with
this.

Jan


