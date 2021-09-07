Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B9F402370
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 08:28:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180413.327068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNUZz-0005V5-2r; Tue, 07 Sep 2021 06:27:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180413.327068; Tue, 07 Sep 2021 06:27:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNUZy-0005Sa-Vg; Tue, 07 Sep 2021 06:27:34 +0000
Received: by outflank-mailman (input) for mailman id 180413;
 Tue, 07 Sep 2021 06:27:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNUZx-0005SU-8J
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 06:27:33 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ae3d6b16-0fa4-11ec-b0d6-12813bfff9fa;
 Tue, 07 Sep 2021 06:27:32 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-FrpMNNnVMK6I20FejC95iQ-1; Tue, 07 Sep 2021 08:27:30 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM9PR04MB7634.eurprd04.prod.outlook.com (2603:10a6:20b:2d5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Tue, 7 Sep
 2021 06:27:29 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::ac:a0be:c26c:908b]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::ac:a0be:c26c:908b%5]) with mapi id 15.20.4478.026; Tue, 7 Sep 2021
 06:27:29 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0064.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.6 via Frontend Transport; Tue, 7 Sep 2021 06:27:28 +0000
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
X-Inumbo-ID: ae3d6b16-0fa4-11ec-b0d6-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630996051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4X413M352Bz+g6WOu/MmDm2tizrfnb8E3vuzxpYuBgc=;
	b=BmMXInTDOy5p81/giVQd3TednnXNdaBxj/99my+eCh3W0eB4Xtasu+yO4FXK65j5MuvE2o
	SdQuRrrvebU8yCPhgcub9RiSa83HkECG9AORPHmeBucH/zNVsqZJ4m4BhHg3hhN3EJP/65
	x2CPZudmWVcsmEUMKKhwqYnXHqUH1AE=
X-MC-Unique: FrpMNNnVMK6I20FejC95iQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JeeNiYH+ScbJodh/gqcrJpJbzdLR1nzFOS6uj5bNaf1TFAyrG7wGfjZuLzMAd8onABRPTLhZrny/En5D4v08IKWJLqNTTexCcIpzXtHd7aHfTVDYRLO+kxSpYHiMqbQpnoIyPsGey5t7mwMgCOCoonxfXrmOgBB0kXlHb+Pe0Jbl5A5E6kAnqrHhrIqSnc4aSp63EJ3jcTf4mHiPdrrx2g8Vb1Au7hkihJzWhZu0RK9k+xFiTJcnFmi3LEDC+7FSJfcPV3JYjhIjQJ6ELWY8zEYQW3Xv341H/TeyzIVXXwmUUcUoB36KEU+BTEixXpogqn5IjoUEU8SKD0dL0ukvlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=oLQFaWi4QB5p7y9edaTmQxOxvVOecW8XZ9bI4P+cP6Q=;
 b=YVxfm+fb5paYsyeS1VBZUWKjRkDDM4pjVW0Pnz0G8PFshgrr6KF6CExIS/w8NuGEaH3yhsp4ty1oTJifc75RhQSJ100727l5qfv4B4vGH0iv89kuy39r4ByvkEu3OHjTGXtixqF3XvZaV5PkzpdY5Qy199nTxVW6XHn6fKgrYthW7898NC/7VOZESqXls6K9VG5gN3Z8yZgyxZKP6xuny4T8i89jntqDyl96ejartMxiIV58FJBBk8rfzpgT4vK/IZRECufg0pXe6p8MaZXNls8hky3KqWP/19RPFihdE1T8T460XmMTMtc5Fe6XKABO6XYFBQKupLwlflXsTzOCJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 2/4] x86/P2M: relax guarding of MMIO entries
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
 <93ecc397-1293-69b1-e70d-3c5f9317229a@suse.com>
 <ad1e33b5-d729-2680-7f9f-aa875c2d9cfa@citrix.com>
 <f684e203-9967-8653-d59f-ad11f5070aef@suse.com>
 <7f56c625-eee6-31c4-2d6f-bd7334867d83@citrix.com>
 <5d69d4c0-7a04-c3da-f971-616363c6d63d@suse.com>
 <62cb78c9-f4fd-76e7-225d-bc575f10850f@citrix.com>
 <818cc08e-8372-35c4-935f-86a87cceec75@suse.com>
 <bf091ebc-95e7-b357-9f84-4ec3a6346fac@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8a45ba41-e659-c472-dbd0-56bbe92bb5c0@suse.com>
Date: Tue, 7 Sep 2021 08:27:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <bf091ebc-95e7-b357-9f84-4ec3a6346fac@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::12) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 222932d7-0b7e-4832-27c2-08d971c89116
X-MS-TrafficTypeDiagnostic: AM9PR04MB7634:
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB76342EFCC1CFF098346B5939B3D39@AM9PR04MB7634.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5C5wzyRBWgnLYYb/a7R1EJ2jPYH6HVDgTNTHOKgRmrJI9jcv7GI8y/FzSAMxYmA1BoWxdz9UgOH8qJtOLtrp3Ogou31ZeaYfE3Ew5o76UhBGrZ1aOhJ/DvwW8t6MwpW57m2YK9ZLq4IKG1R+up6VgRVmD01+18hqRNkdpa4YA5psB/MdlbBSHRp6+YrbMmaFxQpX7YWOmE+JuRKkwHTtE2KUmJ9pTc+XrGJQjQLdinuAir92nWzit2e8ik9YbPnh0QCLVqYpUn76MGGYQ+9hQAfejC0dA3S1PEUb76WyU9KMiWqLNvHW0LYRxtJYtfdXoQqc1Sr/2945rzgnSL6tQd6ecKVdI3o5jaq+97DEH1UIOFKqaJxATSmjaJYUL7k0snySt9hgHPx7+zlgxXiMnzhhzFrk8tRGpyGQqxuZSAQGA/LoZgjjkoOd9ICXttVqT8NZRZ0nVUYdEKM79OsMq9NNhnFpsu2YIHdPkm6wPPcCVsGWFV3/WqZIMM1hpYdtN2yxcLE+Mnj0BlOhAw25mMutPKbfbTaIIk7FhzGCZ/JXhjMLxrXUIFAD3qiRCv0+wt3oHPvaj5ZaK1rVcztULKi0w22MSrlfIn3vz25Qhw04yQHJpxlPoXj9B40iAu5SgZVx2lLxGWsAN3JHrCKmU4ZGJDykS6hhtCZqy1OKFRQXpis7lSwhi4eGGAGRwkGLGOYxyDnGvjA984wHiwzNoxoxG6bBIGWU3YQ9+9uCeOA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(39860400002)(376002)(396003)(346002)(2616005)(5660300002)(478600001)(66476007)(38100700002)(8676002)(83380400001)(8936002)(31686004)(956004)(6486002)(6916009)(53546011)(26005)(2906002)(316002)(31696002)(4326008)(16576012)(54906003)(36756003)(186003)(66946007)(86362001)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OxAcRGvYer51QZlj8wC/p8tFLFQAqRGQxoJYLjFj1aAPHVNoy0IV6hB911vt?=
 =?us-ascii?Q?LBSrF9NLqXb3kyZ7gZ0EhANdt28shbwMcnwEU0TFbDJXZOldA2Ww+XZ9JJNm?=
 =?us-ascii?Q?Y811A6cwA2vExlmULFs4Ln+C30YiSjSWpWpRTGNB5AIb0kEvDgsccx2rkpSl?=
 =?us-ascii?Q?6EpB+4XGYHnbcAUz2RLPuIKu1vVmzvdc316FYumSP6XaKvCW7OiRw6YK0UBo?=
 =?us-ascii?Q?Ol61t4UkwEl4GOkRrxJVWndPstnRoG5RaFKOs8/zx9lE7xe9uuRbJPbtkEx4?=
 =?us-ascii?Q?n3FTtGVr06sRnLU/ak9DGZHjCgbosCoT5KWGKbl0NpIP/ZE8n3CXMlj4eeex?=
 =?us-ascii?Q?fDEJcrebDfc8cGcK2RgDvMhJh/mH0sAa+N7DoA1PBx5CmjbR8jj1nXEkX8tA?=
 =?us-ascii?Q?d+MVKofXjH/W1yTZeuOK/9Xcy0tvJHlpbXpCUCSqgrZditPXgisfQ/PcjX18?=
 =?us-ascii?Q?KkQhcmBYwVZqRWhoHwJ0D9TMK4e1wE6837EiPt/dyYd3gIIBhFsiNPX4CtGy?=
 =?us-ascii?Q?hfhxH3wwBIb1lf7otxWKvfg5wVBrsWQM4eZqhAlbbAdeQB35wsXW8cl5ZdF6?=
 =?us-ascii?Q?wKsZu4xG7Puc9nWIXSVScjl9pRDBf9gW7ExTPtEkM3/s6gu29/0KdOVi5wqD?=
 =?us-ascii?Q?FS6/p/wweUakq14P1BDI5inEDD9cxC3VEyFHgsXbL/Z1CTwUGdGJPOPCA8Zr?=
 =?us-ascii?Q?EXf5RIBFGT0PY1f9vr2SYr5pA8E5K7cU57TxIRiUoOILABlgild0seH/fskS?=
 =?us-ascii?Q?zoiV3el4QT7dwNeB3mSE/oBTczmL4R8Hprj4iQrOobLXaQzmciDQeTnkGhwt?=
 =?us-ascii?Q?zRqoSQLLFxpS/MD8JzaIOIDEfQOBgRwQjPK2ECCnLNZ+f3bKXYUijItsD2pv?=
 =?us-ascii?Q?/DdgUYdN3rQ+n/ucd6ztMvarP3K9Xv66vp0M7OcjWR8qphA8jMbPLD/JqHy1?=
 =?us-ascii?Q?FqUqRr9YP/qYze5KextykAxw+SXZ3zZtcLTz7EswtvJsQjUrvCiCgfvV1uqo?=
 =?us-ascii?Q?AuIR747tNSvoqySOI3zN6nmYLV1fwHM4ullteZaTw9e+EoXub3k0lwjzmICk?=
 =?us-ascii?Q?LKwNLNq366DvLpOzwiOTCRDCdX2JTccXR6sARx1Zp1mJ6SkLp2uFZ25cjIxH?=
 =?us-ascii?Q?C8UTsBiCR6pV9CqzYqqDmZ4fCKr9so+xGoVuP6cwPREBy/+zYfMif5KGpt33?=
 =?us-ascii?Q?oeH9Up++lpw2en5I0bR7iQQtCLA2l3ngpQ0JRRI2Vn1Ee63M4eDF5jo8m+n8?=
 =?us-ascii?Q?cJQ4NZdtb/1NPU/P09XFpBxq0Qbk/VPVAaJ6mKNhhke3OU2r3Wk+du1GQCeg?=
 =?us-ascii?Q?L58Z3Cjx/dsotAPkVGd5mt35?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 222932d7-0b7e-4832-27c2-08d971c89116
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 06:27:29.2381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +p2OT2AkhIzDgWeuNVG0v8g6e4TGNpq/hrt8hfNK5Qd2G3uOJbWei7JTwheOSvekvs0IITbZys+72oJxpJgIBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7634

On 06.09.2021 21:53, Andrew Cooper wrote:
> On 01/09/2021 14:08, Jan Beulich wrote:
>>>>> Restricting execute permissions is something unique to virt.=C2=A0 It=
 doesn't
>>>>> exist in a non-virtualised system, as I and D side reads are
>>>>> indistinguishable outside of the core.
>>>>>
>>>>> Furthermore, it is inexpressible on some systems/configurations.
>>>>>
>>>>> Introspection is the only technology which should be restricting exec=
ute
>>>>> permissions in the p2m, and only when it takes responsibility for
>>>>> dealing with the fallout.
>>>> IOW are you saying that the calls to set_identity_p2m_entry()
>>>> (pre-dating XSA-378) were wrong to use p2m_access_rw?
>>> Yes.
>>>
>>>>  Because that's
>>>> what's getting the way here.
>>> On a real machine, you really can write some executable code into an
>>> E820 reserved region and jump to it.=C2=A0 You can also execute code fr=
om
>>> real BARs is you happen to know that they are prefetchable (or you're a
>>> glutton for UC reads...)
>>>
>>> And there is the WPBT ACPI table which exists specifically to let
>>> firmware inject drivers/applications into a windows environment, and ma=
y
>>> come out of the SPI ROM in the first place.
>>>
>>>
>>> Is it sensible to execute an E820 reserved region, or unmarked BAR?=C2=
=A0
>>> Probably not.
>>>
>>> Should it work, because that's how real hardware behaves?=C2=A0 Absolut=
ely.
>>>
>>> Any restrictions beyond that want handling by some kind of introspectio=
n
>>> agent which has a policy of what to do with legal-but-dodgy-looking act=
ions.
>> IOW you suggest we remove p2m_access_t parameters from various functions=
,
>> going with just default access?
>=20
> p2m_access_t was very obviously a bodge when introduced, and I doubt it
> would pass today's review standards.
>=20
> It is definitely a mis-design, given its ill-specified and overlapping
> semantics with respect to the p2m type.
>=20
>>  Of course, as pointed out in another
>> reply, we'll need to split p2m_mmio_direct into multiple types then, at
>> the very least to honor the potential r/o restriction of AMD IOMMU unity
>> mapped regions. (FAOD all of this isn't a short term plan anyway, at lea=
st
>> afaic.)
>=20
> I don't think that will be necessary.
>=20
> IVMDs are almost non-existent, and given how many other areas of the AMD
> IOMMU spec are totally unused, I wouldn't be surprised if r/o unity
> mappings were in that category too.=C2=A0 There's no obvious usecase for =
r/o,
> as anything critical enough in the platform to have an IVMD in the first
> place will also be non-trivial enough to require bidirectional
> communication somehow.
>=20
> The unity mapping only says "this device requires read-only access".=C2=
=A0 It
> doesn't say "this must be mapped read-only", and it is legitimate to map
> a r/o unity mapping as r/w.

Well, imo that's extending what "Write permission. 1b=3Dwriteable, 0b=3Dnot
writeable" and "Read permission. 1b=3Dreadable, 0b=3Dnot readable" in the
spec say. "Permission" to me doesn't mean what you say.

Nevertheless I would perhaps not insist (as I've already made clear I
don't see a strong need to support w/o mappings), if ...

> If such a case actually exists, there's clearly one agent in the system
> with r/w access into the r/o range, and mapping it r/w is equivalent to
> the "IOMMU not enabled in the first place" case which is the default
> case for most software for the past decade-and-a-bit.
>=20
> In other words, I don't think the r/o unit maps on their own are a good
> enough reasons to split the type.=C2=A0 If we gain other reasons then fin=
e,
> but this seems like chunk of complexity with no real users.

... there wasn't already a 2nd use for this: The IO-APIC mappings (see
my respective pending patch).

Jan


