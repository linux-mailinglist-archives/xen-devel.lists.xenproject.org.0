Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8A64315CA
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 12:18:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211948.369647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcPip-0005vT-7M; Mon, 18 Oct 2021 10:18:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211948.369647; Mon, 18 Oct 2021 10:18:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcPip-0005sz-4F; Mon, 18 Oct 2021 10:18:23 +0000
Received: by outflank-mailman (input) for mailman id 211948;
 Mon, 18 Oct 2021 10:18:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcPin-0005st-Tj
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 10:18:21 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3ddcc9b5-bd0b-4aab-93b8-efadd696cbb4;
 Mon, 18 Oct 2021 10:18:20 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-2yzOZs4UNrK_8a9lTIf0Gg-1; Mon, 18 Oct 2021 12:18:19 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6301.eurprd04.prod.outlook.com (2603:10a6:803:f1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Mon, 18 Oct
 2021 10:18:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 10:18:17 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0078.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.10 via Frontend Transport; Mon, 18 Oct 2021 10:18:17 +0000
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
X-Inumbo-ID: 3ddcc9b5-bd0b-4aab-93b8-efadd696cbb4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634552299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zxtQAX819G1D8ae8PYpvuBt4sY416LeEYZYLW+TtmXM=;
	b=E9JJHEN6+Jnrdbtx6rLoNgnf9TAlOSyrJgBbAnyXiUlBU6GKLdBjZ2oZBUkgZwdZfpkXYW
	/ysQEEnmPXCswuvsuMCcf8GQvtcgfiIMwaVd9h1zxODk2iH5QUlnaBFkzDMsUK8l0JBR5f
	Gn5TVvaoNVIr+0atCtza6NldRZkrRYw=
X-MC-Unique: 2yzOZs4UNrK_8a9lTIf0Gg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IU5sNb/K23oAIPB4nhm+OzqiOB4fKlvyAbebXnw4Bb1sQOjjSmuNSkli5ZNjyoB8HnCLi1Ml0BafxqxDBCfuUv/23by+w+DyhhFbydvSEzvvsMkO+xaXc/NHqvvgibIfgQAbUm2NedMWGUGD5CAMNNZd/f90sQ62lRKl9+ODq6KrP5IAyL3W5434Y+GUgvtPPQ9ymHwBRX/c/wq5OZvS7JbDJMlmsgJNKZCK34AHAIbW9TMu5NWUX8p8M7nPXFXng8RF1XA/ALJoBLnrqNfckCuu9T/QdULxcRbFLaPyPOphlIwWA2fAJGzYDumrpbpG3Rmagf1YZxBwoYwv9Wv92g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u6LTlBc0e5UBgET8ydGAKpIk5JvRbtdu72PHc+hjqpo=;
 b=lZITTVj8APfLKqgTCvCEzWLnAFUgEV4iGtOnNy+te9xvOVTKHGNvHKqvaFoy+1GjBRa+Axk9y3sNrXsHhZZ7ckirXcL3oGei7Mi2S/AOoKmDOR1QQ1zCWg/LTJ98vkzFdOuXmycpsuuy2UE/AWPpAH8SFcde7DkuZ5E376K+3k73B+So5JKdaw1OOC0r3e8ReNeEvEDPEg2IVrLPy1VzfFPf8mkJxpp/Qoha6YkDrfsMNX8X+tTXlgvMa6cjKNf+sANrnxsz+C0a7age/CLHogHYsVxjy3aekSVfFGA0uZYxhl+pqqxGAkwe4GQRrTXEFFn83LRbR1BIi0cUg+MMyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v2] x86/AMD: make HT range dynamic for Fam17 and up
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
References: <36df1141-5c3b-6f8a-3a83-1f954b1e27a6@suse.com>
 <YW1BPPVNAVm6EPQp@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3f08e2bb-d80a-3336-d379-a9d76a689586@suse.com>
Date: Mon, 18 Oct 2021 12:18:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YW1BPPVNAVm6EPQp@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17ab434f-6289-4eb6-77cd-08d992209a4a
X-MS-TrafficTypeDiagnostic: VI1PR04MB6301:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB63015A4973ED1FED064ED427B3BC9@VI1PR04MB6301.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J0qm1FSr4qmlgzd1hfnj/rN31D8ut/h8vEIRKkKtDghJ+XXf5/TxvLtXM78xR5FvOUTFpDsAFtg+aBJecVZtNrJWt1AQGagEeBUes/gumKHDmv6+LljcnEvk/iAupQNmGXahGJccEXTlgLQG9XJr7L04oSjDGwV9+Y4yDq4pXLYDe7LJqMEP7ecXy+he2qpwZSNAJG/6xICYiYOhXgce1QUGPFAu1lyD0QJFkM3r3bN6kkTtHr39Mvcm6awDmLBRREE91Z/aQ7B2zvZGm3XYmdbxwxwUJw/V2lGetGk0dCm1USub8TJZJv4axpybI3/kSm86MMA5V3h0fYhyLekn/zmkX8CRVG0xEROTzDIoyJFku4bXREeTo3VudHb/0PLyUoyoxl0fKNT7sJS6wm/WdoWxAh03gpbWpenoHbpIWJp6V1n0FcuabWXTpfu7uVf/uqCyGOkVjEStjfBD05lQmUBjTSoAvZHWjdsWOJVcnQzEyfa/Kj45UA7zg3gJ9sJv146NYmfOUBVXa/zIzFc7pfYiEkFNSZv+H5Gsy1INHgra+0lfxbUof0QJOLn2fgZotm7GabJcxOYvIS2+5d6oHW3q2hrk4redh1tGus1ufhJF4gVXXwywiMFenmBYew/+6GbxDOvyzocmQe28K46/oVUL6ANSTvom76KlmgyAoSmxKiI30GcsI7oz2RYqjfiCY+S3hpiu9PAsA0SjAOfrz8k/s/bJZhR7P7A/ZC8T8xQX0sTr+4JBPgMpOCVDazbP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(86362001)(31696002)(5660300002)(66476007)(26005)(53546011)(508600001)(31686004)(956004)(186003)(66556008)(8676002)(66946007)(316002)(2616005)(83380400001)(8936002)(6486002)(2906002)(110136005)(36756003)(4326008)(16576012)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9sDshtZMJT7LHA8/+3PVnBNZ1WrkdpRbROdx+AXSqFScVqz+Yp7YO0A8ai+2?=
 =?us-ascii?Q?VgjeJGwZfDto1s37iBD18a47AJbs0wDeOcWTE8qzD2KdszQATPDwZ74hrAid?=
 =?us-ascii?Q?YOYvU/JpT4bqxFCb5CALWy4NKJ7tmck5LgqQF2rGC3uN+EV3QjGDODYRsxaZ?=
 =?us-ascii?Q?v8RQ9fGjHKSW6shxFXhdqfWtA8CIeGHI/ML4MCFb02HISMLDHuE8UoVuAdA7?=
 =?us-ascii?Q?3jnh9piTKb5B5lvYtF/we1+EIPRRGVc0p3NUpkIDdmb9mtesSpgoSRZfabBa?=
 =?us-ascii?Q?zj1kVsTQkTZfegLzYcHc3eSg011wItWFQs6rHTMb08hz3PFmZje2mbtGDSfz?=
 =?us-ascii?Q?9HBOWLqX2tpjJ9nXWUQ3taL5p9x3n6lDHNvRturtvuCncrDpRzEQD7GgbOAJ?=
 =?us-ascii?Q?+FawHExZCVw4ozEKiYCa4TlgIHlTrD6sytReCQf6IbrPacnDk1Ad9s+WIg4s?=
 =?us-ascii?Q?Mvxl6yKeL/QbjZk7VNHd89DEIQrUVezPxo1whtwU2ehawPp6aqS2xfqvhGiG?=
 =?us-ascii?Q?6RHxfuyQdDXXJf7xsUApTi44lwvKKvREyjwSi4h7j1G8CgzBJYkJ6JWLPfmL?=
 =?us-ascii?Q?4RdWNCoD3zMp/GKgaQY1aUZdRN3+KC7G4lJzp3kelWCdYtVACTfmaP4vjIH/?=
 =?us-ascii?Q?n4IIAJoBAIqsrXbTjwLuIa+RGMdFw0/+1ZtwX9tXAQ5HrrVp3VXFkhWB0/5p?=
 =?us-ascii?Q?AK5I2VeDZbgf1pBpIfks737ACmxcI6BSCCbUD6FVQftC0xfCu/K/e55s145Y?=
 =?us-ascii?Q?YAQOhdBOMBvVF4dG78BN6FwMr46QqsWlANplRmR4hefsQeZT4uFd3WAru7kV?=
 =?us-ascii?Q?pc+NmHEvyaOYHz/m/dsL5BtMrO8ORDOHahLM06i64dbNL9j27KzTOChtsqJg?=
 =?us-ascii?Q?3zMBpB8CSuGM5q70bSkOImsXR+zUeVosl18VZLSe7Mii5ZkhrfcrZSdxDbcL?=
 =?us-ascii?Q?Va9q8okL6qhVM1o8NB/T4/SdItzz8pwvs0XH7bh3ATN2R7/Y/NUq2KNSli2h?=
 =?us-ascii?Q?Du+oq1i8PE+clioJskBfZKwGXwedBHhSWcEI8izdnErjSmzGsUuB3DVfN9sn?=
 =?us-ascii?Q?vQhNZ29GS6/Zwgud5idnTvGJUnpPvfX/TU94qdbzY62at0BngsygZRlvx/Uh?=
 =?us-ascii?Q?E2kN3ncl+R77L9p2mNNhMr8sRifnDfHskTyxUkOjx5YN0IhypycdO9QHJwyi?=
 =?us-ascii?Q?x+CW/xIeA/pIWIpgKoO88fuYlVmrbhFAgrxV1YAQHKGllbPANFJFFpVpaOOl?=
 =?us-ascii?Q?EqSmIL/wW12LX3lpmSh9TnVfBZtrGDPYid5cAKCXvJtIT0pYBTEXnSylmMTh?=
 =?us-ascii?Q?zJ5NSFJ5eFNW+plbv95bdMbt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17ab434f-6289-4eb6-77cd-08d992209a4a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 10:18:17.5855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /MSXEg+isD8Lh2zAZ2cMCMoESOOTAzaW5KGdm+iT5b9ytR/ZTn07Iis+3KPFHYHx8RsF/b1GI6/zIixRyOWUEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6301

On 18.10.2021 11:41, Roger Pau Monn=C3=A9 wrote:
> On Mon, Jun 28, 2021 at 01:48:53PM +0200, Jan Beulich wrote:
>> At the time of d838ac2539cf ("x86: don't allow Dom0 access to the HT
>> address range") documentation correctly stated that the range was
>> completely fixed. For Fam17 and newer, it lives at the top of physical
>> address space, though.
>>
>> To correctly determine the top of physical address space, we need to
>> account for their physical address reduction, hence the calculation of
>> paddr_bits also gets adjusted.
>>
>> While for paddr_bits < 40 the HT range is completely hidden, there's no
>> need to suppress the range insertion in that case: It'll just have no
>> real meaning.
>>
>> Reported-by: Igor Druzhinin <igor.druzhinin@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks, but before applying this I'd prefer to resolve your concern
voiced below.

>> --- a/xen/arch/x86/cpu/common.c
>> +++ b/xen/arch/x86/cpu/common.c
>> @@ -349,16 +349,23 @@ void __init early_cpu_init(void)
>> =20
>>  	eax =3D cpuid_eax(0x80000000);
>>  	if ((eax >> 16) =3D=3D 0x8000 && eax >=3D 0x80000008) {
>> +		ebx =3D eax >=3D 0x8000001f ? cpuid_ebx(0x8000001f) : 0;
>>  		eax =3D cpuid_eax(0x80000008);
>> +
>>  		paddr_bits =3D eax & 0xff;
>>  		if (paddr_bits > PADDR_BITS)
>>  			paddr_bits =3D PADDR_BITS;
>> +
>>  		vaddr_bits =3D (eax >> 8) & 0xff;
>>  		if (vaddr_bits > VADDR_BITS)
>>  			vaddr_bits =3D VADDR_BITS;
>> +
>>  		hap_paddr_bits =3D ((eax >> 16) & 0xff) ?: paddr_bits;
>>  		if (hap_paddr_bits > PADDR_BITS)
>>  			hap_paddr_bits =3D PADDR_BITS;
>> +
>> +		/* Account for SME's physical address space reduction. */
>> +		paddr_bits -=3D (ebx >> 6) & 0x3f;
>=20
> Does it make sense to check for 0x8000001f[eax] bit 0 in order to
> assert that there's support for SME, or assuming that the reduction is
> !=3D 0 in the other cpuid leaf is enough.

Documentation doesn't really tie them together afaics, so I thought
I wouldn't either. I was reading into this lack of an explicit
connection the possibility of address space reduction to also,
hypothetically at this point, apply to other features.

> It's possible for firmware vendors to disable advertising the SME
> support bit and leave the physical address space reduction one in
> place?

I don't know if it's possible (I'm unaware of e.g. MSR-level control
allowing to modify these independently), but if it is I'd consider
it inconsistent if one but not the other was zapped. I'm unconvinced
that we really would need to deal with such inconsistencies, the
more that it's not really clear what the inconsistent setting would
really mean for the placement of the HT range.

While writing this, there was one more thing I came to think of:
Should we perhaps suppress the iomem_deny_access() altogether when
running virtualized ourselves?

Jan


