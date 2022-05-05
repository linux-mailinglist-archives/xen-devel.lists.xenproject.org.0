Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBE851BE5A
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 13:45:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322031.543221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmZu9-0006T3-8o; Thu, 05 May 2022 11:44:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322031.543221; Thu, 05 May 2022 11:44:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmZu9-0006PY-5j; Thu, 05 May 2022 11:44:21 +0000
Received: by outflank-mailman (input) for mailman id 322031;
 Thu, 05 May 2022 11:44:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmZu7-0006PS-Uh
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 11:44:19 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aff3a505-cc68-11ec-8fc4-03012f2f19d4;
 Thu, 05 May 2022 13:44:14 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-8-EELKo-5nPNOTOVEolQlI8g-1; Thu, 05 May 2022 13:44:17 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DU2PR04MB8757.eurprd04.prod.outlook.com (2603:10a6:10:2e0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Thu, 5 May
 2022 11:44:15 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Thu, 5 May 2022
 11:44:15 +0000
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
X-Inumbo-ID: aff3a505-cc68-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651751058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qXjhfAx+ngtQyxYpNNyRHM9koDR7MpOhQ9Ev2hHU3DY=;
	b=kFGIcR9OpbXPzSw5f93qaK/3FE3CNZ17oPLzBNXFlR5sT7uRiMq/xdWjHEtnfxnMRMKmw3
	f3wxTprhFm9ZeDSGfO1+xMNPKiks1ts2R5csipapWqwCawC4CsjE6Xf4dee1aNlxlz/d0K
	rqwpXpNMP05orkVehIJNKNUfu6Dve3M=
X-MC-Unique: EELKo-5nPNOTOVEolQlI8g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N7/E1HqGS4RywRK9/BHN1nbYja8ZWU+/DrIx4IbcE/AWKLKWp2mqTYUtdmachSm+6gnLO3UXK9huqhFtp/zEo0bVylmxIGmiO8Q62k2EEGRGnN8UBXHM8i/ykL6m7euwZYRGe1cI3RWVk1tiKZvWBta5WNb4uabF4Ky3AaL2YRVEdXs76UgLQKAV/aS5euVWvynkCcf3y7hw5qOCLPzUHqtdqQzKxLduxst5nayk1KkNGU9KpGilY8MAy4GKF9vpuocJz1YBSEaT6S5EsMYhtwcwShbZT15tO4Uq8j3mUYx4/J1GNkLelu0qGo5M+5hbAWMBUXpfg3g46dttkNoDyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YzAUuUk5ZHPwsHZGXAwqO9Q/Yk3SDydaDJ7ipfYDrYM=;
 b=asbRIRmD5oMLn5mLCuQ20DlA7S32ZqV1gYuxAhJ1Oe2ELEi+dkzE/bTJw8+blCmaskOH5AR6/+hFZ8eMMBc2frEhUJcFaTb4sCuUaScyMqgQadiLrnIYIlAsVlpZ3QDYUdZiqJmkmdSlF/OpK+JVqMq/I9lo1cdezVhR0Qb2RrYqkU3OYvHBG7iL8CF4l7cW84t/A9cjYiV23+IjNPoVwmrDNCSYyGl/2QslV9e5IpWuErwJum+GXMxz52gL/GXfpvfvfKxETOFbgYDpZkb7wCd3qCnGruHYcFjQgSPgd0ckPP3fjFXkm6PBzllemui+CY4uhQF2wD5PDSPUKCjrUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1073709a-08bb-7795-63ca-dc4055c0b9fb@suse.com>
Date: Thu, 5 May 2022 13:44:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH RFC] x86/lld: fix symbol map generation
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220502152020.19768-1-roger.pau@citrix.com>
 <a8313955-98ff-d941-00a4-c5e318761c67@suse.com>
 <YnONKdIU7G1gOuPZ@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YnONKdIU7G1gOuPZ@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0398.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::17) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15327202-5eae-4d35-cf48-08da2e8c947b
X-MS-TrafficTypeDiagnostic: DU2PR04MB8757:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB8757555C4C420364D9230E9AB3C29@DU2PR04MB8757.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Qmt9is1T0OJRb3P3RZz2TGe07ZYwX9dZWupujPj8Q1kbj9G6A6vvfM4sVzGmnrBKhaWFUy2O6vj5JSZZZfVlFL01aGKPdQehj34iY7s2j6Pp8OtsUuB1BkcMv9IbdlZaeEZ9r1Q9IQRG5NfU77CMTv6EIvaeKL5P/H2J5M2LeIjU5/nDUHEoDj51BjQ+lIQ3Kdq7HuaMeQt7WXc2qm2mQRhEGTU6mtZvDsuptWzi6wVBpujvDCzYNd4fUZSp/R9GCHzeJATV9t6GnyNn/gP07lQI2eWnKHwSYlauZDOLarI7zS4gmh2Dt0IRcJnA1yM6OBukSMUr2vPe7Gtnk0xXfkKdYeIv3Ty8odjBwrG1wBE9KcJaYxDWrdlL2TrP2/MMvP6o4/mjputqLrO4SwqXvSzVjmM4Ym9C7MKtIur34heLGXXid98+DM177A1BDjavwCUmy6jMtnDHReTHihDiXdtmRIwXyP+hxLxlHwBh5fxx7eem0b6lp/dfOUYPy5vUHoVNESGajBkc3PSmEwuXLsY8ZXVexe7QaW7pLKnqrRoTNmnprb5/sB9Sm8mwDcrcL3XMBA6w9rGETexe96kSmeaKUK2RqE0QQ0CeHpQIDZRaoE2+eIeDTc8sxJvuF/QKsADaUbDOgLVibVxkNgzuW/y48MmSfRCgconqhXf05ZAlm42kKrkwKO3QXvf8QEa/elA990QkmqkbdQpnS0Ar2yV2crp0l9AKJW6WgTl5yb+9oWqqZtuZWKwvQGHu4HuE6/IKqNDB6pqkFv76M2n7HAnTpD+je+XIOKFUVOG4Q9PPd1mqv69PPmzqf1bw52St
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(66556008)(316002)(38100700002)(5660300002)(8676002)(2906002)(66476007)(54906003)(6916009)(8936002)(4326008)(83380400001)(6506007)(53546011)(6486002)(966005)(6512007)(508600001)(2616005)(26005)(186003)(31686004)(86362001)(36756003)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BMIcZKWSZdMPf/+Z9hLbR5Sm5PiaM6D8YrIm5kkupYVQ7RZUbVo75yM8OHIg?=
 =?us-ascii?Q?cPD9ldyR89nFn1dRYmKuzbVqqrjxNoNwbd9gW1oCKVmVLEe/KukQDNAEeejg?=
 =?us-ascii?Q?9ipdkTfUY7P5uMq5VIkDhog96ocyS1nQsvDl0xRD44ugofq+glMBTIQdrrIL?=
 =?us-ascii?Q?c29HoLxXoJPDLSyDfUCA+qgniTDcBenoNLd0y1KvzF54RUTyln9GnbCVZXh/?=
 =?us-ascii?Q?uxQRotaQfEUv39116yUqYKr5GxHaz5oyS5jGlpCwh0HML8ih7IKg6CyzGtNb?=
 =?us-ascii?Q?jmFvJxzEAya6qBLgKELh7wY7/eE+jwc97GBf5CXt8mlVCxd84CvcdibOYH7L?=
 =?us-ascii?Q?z2kM/5N3w3OjZv4ZXBjspJhrkfCFEJgs+xiWl9FQp1URGhxjEwb6VvSzaKv5?=
 =?us-ascii?Q?0djgNA3AUhknb3lVCacF2NPr/rmHxMBTCBnBwzF6MYiojae1mUCkRMZ/Dv05?=
 =?us-ascii?Q?D6K0QWwwEuXHEStcIFlv1mJGT8NidV6P5RKNpFMgjkbMPygG/08NVc5H5KLc?=
 =?us-ascii?Q?vW/zxbD2dBgRaCs5pFnpIHPfjvX7Y2o52kS3SVmoiS3F+f/doWllonkxyjQq?=
 =?us-ascii?Q?4RXJxz96T4UloI7tFXDI2TCjldbFWf6XCRPCkHDz4tlDWRX/6oTsLSDqrWBG?=
 =?us-ascii?Q?e0wDHyqQEkQjlyuYt/U5lStARzYVbUyTLOMzOLI77R9WW18pvjBeMsjaHCv6?=
 =?us-ascii?Q?PRaW1hqeD+RCAVvKQNdfUs5gLX7tvDqA5FojTKQkBICUcXKrcyQps8agbzTo?=
 =?us-ascii?Q?VeEMaS50lnC2fZjhO2Is+h0QJ3u5k6eeocR3yz55uBGwCA/ix8avDh3GtfBX?=
 =?us-ascii?Q?+IApFRU6JQjwjGaixXFo3hYm/p3gsw1P1edBQMoK/+VxbfHjqAYQHHp/xKGN?=
 =?us-ascii?Q?qSy/OgVjIh4CDqP9L/BXTpfGfA8kI5cDTWzHhM3QIlVxnQGQ3Y4HLsvNAH0t?=
 =?us-ascii?Q?sMRzIBQqlgeuOZpwjoMoIqMgI8nEj3GzAZYiz9Ljz+NQx4e3F3KzN2a/xxiV?=
 =?us-ascii?Q?m6rYMrjUr9j7uG07/JHC5OWLiMHJrCUkiZrDkfkU/JEB40gc15Suj+Yf3ogr?=
 =?us-ascii?Q?VVIBRchHk1qwHefbMvzalOfs93Xu58WKv0jrjrC5LZ1UXjZAvOxeFUv5z5vG?=
 =?us-ascii?Q?Bx+Z2Ojr5nuQ/s+/P/+fGepBUUq+2/CZvb8gACH2w7QZ3cWicqbr/BvS+aII?=
 =?us-ascii?Q?GAF6UilVzzbIv+HETtEhiUdzBlxROcTKZGyL5zNkTjx8irws9LsJD91vUWhx?=
 =?us-ascii?Q?zbQZfY8tlGOuF/i/3WCP5per61NlrFLmu2BMnRXyjY6+I93jOCUwrq38/rFd?=
 =?us-ascii?Q?JDklkVmh41xRILZCe9FWBDIrssD0q25PmstfzgwfkH26BUFalcM0Ypi3nwLK?=
 =?us-ascii?Q?aUo74weggQlqIllCWiLqrtuw6xzGLWtHTwQy2x3OpaLEQXL6OqPRDCywt9s6?=
 =?us-ascii?Q?xDZc/zrLKe5uU4jJTiR0t4F9XPFHXXypEZfG/Bj7voP4Fu3VjfqQCTfUFMV5?=
 =?us-ascii?Q?vP5swJIkkfvaAhUlrLpZW6llvfR9GGJiWroi+Ngbd9k0ygTDHXGBnfdkh64a?=
 =?us-ascii?Q?79a+ZfgvwoifBAwdm+PCibGncj+fgo6nRFAkvbyAAwb+8JBymeJ4cXxxuFgG?=
 =?us-ascii?Q?FrnRw2nN4WxAKiIQDIzz0MgW8Scp7AdBRL7UNm4fGcN+kWB3929ROP7iisRx?=
 =?us-ascii?Q?DUuxJHxiJ+NjkTNQjzloNfD17e0Ao6s/XAubKwsQQEmtRzW7ygLKcXonuP5C?=
 =?us-ascii?Q?YHeGNMDotQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15327202-5eae-4d35-cf48-08da2e8c947b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 11:44:14.9193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SPxFe/sOxNDNvou80vJobxPNAxn/6XlInK7lMJMHbQLHqBjtvSzNrOz7KoepJ7dbOtxA+BQE6/IL+fOjewXgsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8757

On 05.05.2022 10:39, Roger Pau Monn=C3=A9 wrote:
> On Tue, May 03, 2022 at 10:17:44AM +0200, Jan Beulich wrote:
>> On 02.05.2022 17:20, Roger Pau Monne wrote:
>>> The symbol map generation (and thus the debug info attached to Xen) is
>>> partially broken when using LLVM LD.  That's due to LLD converting
>>> almost all symbols from global to local in the last linking step, and
>>
>> I'm puzzled by "almost" - is there a pattern of which ones aren't
>> converted?
>>
>> Also "last linking step" is ambiguous, as we link three binaries and
>> aiui the issue is present on every of these passes. May I suggest
>> "... when linking actual executables" or (still somewhat ambiguous)
>> "... when linking final binaries"?
>>
>>> thus confusing tools/symbols into adding a file prefix to all text
>>> symbols, the results looks like:
>>>
>>> Xen call trace:
>>>    [<ffff82d040449fe8>] R xxhash64.c#__start_xen+0x3938/0x39c0
>>>    [<ffff82d040203734>] F __high_start+0x94/0xa0
>>>
>>> In order to workaround this create a list of global symbols prior to
>>> the linking step, and use objcopy to convert the symbols in the final
>>> binary back to global before processing with tools/symbols.
>>>
>>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>> ---
>>> I haven't found a way to prevent LLD from converting the symbols, so
>>> I've come up with this rather crappy workaround.
>>
>> Perhaps a map file (like we use for shared libraries in tools/) would
>> allow doing so? But of course this would want to be machine-generated,
>> not manually maintained.
>>
>> Have you gained any insight into _why_ they are doing what they do?
>=20
> So after raising this in the LLVM LD forum, I was told this behavior
> is due to the spec:
>=20
> "A hidden symbol contained in a relocatable object must be either
> removed or converted to STB_LOCAL binding by the link-editor when the
> relocatable object is included in an executable file or shared
> object."
>=20
> Then I did some search myself and found that you raised the same with
> GNU ld not doing the conversion:
>=20
> https://sourceware.org/bugzilla/show_bug.cgi?id=3D12374

Hmm, interesting. Too long ago to remember, but yes.

> So it seems LLVM LD goes a bit further than GNU ld and also changes
> the binding of symbols in the .symtab.  I'm not sure I would consider
> the behavior of either linkers wrong.

I agree (taking into account Alan's comment in the bug report above).

> As a test I've attempted to disable the hidden visibility setting we
> set in compiler.h, just to realize that parts of our code do rely on
> having hidden visibility.  That's the bug and alternative constructs
> that use the "i" asm constrain with function pointers.  That's only
> possible in the absence of a GOT or PLT table:
>=20
> https://godbolt.org/z/jK3bq4fhe

Right, -fpic would then also need to go away.

> So I think the way to fix this would be to set the visibility to
> protected instead of hidden,

Originally, when we introduced the use of hidden, it was pretty clear
that protected would suffice, but using hidden seemed more logical.
Now that we have a reason where hidden ends up being too strict, I
agree we can switch to protected.

> and then to also make the setting of the
> visibility unconditional: the compiler not supporting -fvisibility and
> Xen not setting it will just lead to compiler errors further on during
> the build process.

I guess this being conditional pre-dates our requiring of gcc 4.1,
as that version looks to support both the command line option and
the pragma we use. So switching to making this unconditional ought to
be fine.

Jan


