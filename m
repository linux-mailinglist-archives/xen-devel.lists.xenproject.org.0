Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5563FD9F5
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 15:08:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176373.320951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLPyN-0001xk-VF; Wed, 01 Sep 2021 13:08:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176373.320951; Wed, 01 Sep 2021 13:08:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLPyN-0001ui-Rl; Wed, 01 Sep 2021 13:08:11 +0000
Received: by outflank-mailman (input) for mailman id 176373;
 Wed, 01 Sep 2021 13:08:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=18Fz=NX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mLPyM-0001uc-1j
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 13:08:10 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a906c2b8-1a14-4c4a-bd88-808982da25ca;
 Wed, 01 Sep 2021 13:08:08 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-28-LBB-0BR0M1afRj73yfeIcw-1; Wed, 01 Sep 2021 15:08:06 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3934.eurprd04.prod.outlook.com (2603:10a6:803:1b::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Wed, 1 Sep
 2021 13:08:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.019; Wed, 1 Sep 2021
 13:08:04 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0077.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Wed, 1 Sep 2021 13:08:03 +0000
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
X-Inumbo-ID: a906c2b8-1a14-4c4a-bd88-808982da25ca
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630501687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kKOJUpvcTFM8hyAhhxDP25PXxQ/V9ZW9KDvbc9qzjtc=;
	b=W3SGPKuwsFly/nRvsu+u7cKqF0qou50X72FHXDJ7LZ+4HvCgWfvhYhxzhacFnAk4h7ElyK
	rePzS95B1Q0B8n6KEbiMduapheNoEoI9NE4esCvAFnrM7O5PNsqVAlyWMheWX3UfU3YuA4
	ZrxhtW6VQ3lONXnHa3Nxt7iXKqwkKRA=
X-MC-Unique: LBB-0BR0M1afRj73yfeIcw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SDDSdJLfPuegCUeDLRclJQFt4Tt4PDzQ9+wMnf9KuHABi1KthxETQzUrDvSbDAIrpWuean7z1HtUYAHbSOsKG7tP+grvxbqvChoQc935X92UXv/jRbZLg38VvBsW037bcayDBAiKyRagRLwqZcHcFEL3Lv40r0ytdv5qrWVDFPqYZtGE9G4f7j4iozq5vhwLIm4hWSaP5bBWhof0yNuCtUhXl4pmPmsyfdmJPrqNI/8mNRx5GH5sT99jBDAdSqYoqhQkAibdTvopdqFdYsCl3yl4WyvA+nfsfO0JcmKjY9Y1Qf4nSvGTQFOovi7xvefYT7kQsnd9gS1vk/6O2BJX/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zj3a51YS0sJYi/JgKZoY15y3HvCrl4xmlsN+RSvg7T4=;
 b=KaRX+6TnU6ZH7U7+J7j0O8V5NYN/X67Q5Kb3gLKgTtQ7T5gbuzl/MD9h5OUQ9tGn/U2t/g7wI1EqhK8ue6RFm46PHxtCgUF8az8/kfTkjOmlA59mh+R2hVRK6AohMZiuY2MDEwppvyWWHuYXrb42WKoAnxHM3xESEzO6LRju4ns3t3+3onTqfDOUU3MdnKDT0gQuO3TTP+B3rPwbOxSIGGiPd/muM5gOWH0ncX/w0tcLYv7EW3OCwKhyA6bmCjMRZA1R8OMnr85ylEuY5yk5HNTNsh1IUfhkXYPdSNJdynNofbBMXprqKpS5tq3GkQHjLjy2Cz/pWdshP88uv0tyBA==
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <818cc08e-8372-35c4-935f-86a87cceec75@suse.com>
Date: Wed, 1 Sep 2021 15:08:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <62cb78c9-f4fd-76e7-225d-bc575f10850f@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR3P189CA0077.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14109199-61f2-43d9-12a6-08d96d498897
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3934:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3934AF505D929EFDC4E1217BB3CD9@VI1PR0402MB3934.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ehrCuRY1QnwLcCPSjdSepu4DdseauyPFCyw+m/luUE1ynD1v5dFPWyosTDBwUH1UsZKpJhXu1ywDxI0ab4XPf6BY5ySC8j0c/TED8cizNgaCdbeWSvKSbkj+AZoJA8fgimVO4IR6UGx42RtCddjf6h/JWU59zY0+Qs+xQbch6Nj4YgzFiao+wqMc3eHPUlpsh7CCLqbHDTpwS9OCCuVNtczqagOrBn6C4k1poW6noLX0jFJ0QJhfh5xG7i+T9p3M9gxknVevPvN6a9IYuBDt5Mx0wOMg+lychpBInvDVUqpVMFz7BkWUAwbSPbRtZju9sChsgjQrphP1ZDkAica+ufjmOqRMj4qDU/ryrrVFxsTImr/purj3OCzkHpKKf9ew9IvdNfXmFySdWF7nVPFh7IOwOzVTuzQNQV1abVgPcdFUazLXp6eleIjJgUUnkrDBSRsHbNI2J8pnY9Q5Pag1G4w8dINQ2ZFLdpTM3RkCbJ5gvmic200wG9inFC2tiotnqmn+uJOKztIq9SfRv1z4ZNwSP796GwYfm16I1aEBBxWc/ajlX3/F03wmImHO+fdHGWLEC8eUtdgEEWUS+PmuxEOG95o09r2yp+KRU0OQ+e/HPcnHo1EgIEYGtAeyNENM2LM+v4sHMFUnsgbS8TZ2BeA98hX2ip8tbiE01nbpoNGXxG9saZL4YPmTyL27cvFjHvtnXZv8LIMfW3d5eNeubGOzkUHqq3aGuaECUXQ+TEQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(39860400002)(396003)(136003)(366004)(54906003)(6916009)(36756003)(38100700002)(4326008)(31696002)(5660300002)(31686004)(83380400001)(26005)(316002)(66946007)(53546011)(2906002)(66556008)(8676002)(66476007)(6486002)(16576012)(956004)(8936002)(478600001)(86362001)(2616005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5tq/BWyhVfmd1Z3Bt6/LnQkS8XkSR8ALSkf5dBRb2DlAoLK8+jqiLyh4d3nW?=
 =?us-ascii?Q?f3r9wgOkyGoiFlzLmOUv4gJkRks/s+Oi6BnJyuYtxH41vzIpu91EuIrd9rkw?=
 =?us-ascii?Q?ruUtuVKtJFF5qibtirW+SLJ4CnoCDlmFhODMkYz0SYVpnuTB2bRrlGN5h0Bn?=
 =?us-ascii?Q?Ve+MXURaMXLeH7tLZN3pCSVdwyemAmL9wdrXytBJV2G0xcKzlo/MP2M9b3Fl?=
 =?us-ascii?Q?IxkHuaoFHnqa7I7f+oBC/fwtX5biNK/3qot+x5tfvfU80Vd8CiIaEx0Nhmmp?=
 =?us-ascii?Q?4zNFjI7b0Bi/xBnxYz8Om+1bargQ6+yb7c5A9pANSFOIsyI80yTPOPBy1+8n?=
 =?us-ascii?Q?YWwvp91L85gjhrGJWAW441xdrT4/Ry+nsI+colizqJB0wKY3DFBNgkA+YtAc?=
 =?us-ascii?Q?bF+oyTnHm68SkFTjgIzEPVGfFdgI7jyIDLd2jtzIy8rITdq8LgDqlslXTNbw?=
 =?us-ascii?Q?Ym2pqn2iqbq9E661AuMZYHiA8hGL330tOiRhm7a+/rv29tcwBSUAnCEkM8yL?=
 =?us-ascii?Q?qBA7P71piVAbtfCzQtXZYM495iVoPYuJRmpHbYLtiEojewLzAaDoMzhv5AAy?=
 =?us-ascii?Q?iCouckIyECw/3AqY9fw1QC+Km+0EheDetXDispyDJqCq6VKnKh/r2C9hplj0?=
 =?us-ascii?Q?8OfVER3QKwUgRDSEo4W5Tx3arjIg1bJpUEGEHkcXPQBZk2LpoK4ULXXpK7b7?=
 =?us-ascii?Q?v9BEzaRQ6l9GAV2vG3aYLETcvQlF0uzmxdcwWX6u4Atvaa6i+WAsNO48/tTa?=
 =?us-ascii?Q?Nnv6+zO2266HaqJAO5d1PzKEjVnFp6Dadol9XAeSCdo7EzKNa9SEfoYKaS+n?=
 =?us-ascii?Q?ZvYDd+q1MBbxBOYDpgu0arD9zNwMka0zf0MjTr8PXxeJ4RuSwIlE1oVPcpW9?=
 =?us-ascii?Q?1gj5QYt8wwPYx6FmJiYs1YhMEFMYrn+IqY3HbCh9PxrT4gnUkYzbj4KcYk0s?=
 =?us-ascii?Q?SSJGLOusQ08m1MVHsuanbm+zbkGpbWs0THsw6zoJ3t6PK986veczVHj2erwY?=
 =?us-ascii?Q?+Hh016a5NN7JKbADRlNkXFuekexECRwT4ZnDpmJ8AlPFQ+ZtC/ncU3Z7Q51j?=
 =?us-ascii?Q?Anh0+/b8JmIUjoaFUk2JGbJbNUlSdHboja4NdmHv7iHntNxxGww+NwWweA6q?=
 =?us-ascii?Q?yDpyjFFKl9CvgBmAhwv3ELm8FrSAGWszQPf4zV4HcRxzmWUoch7A9uu6szjy?=
 =?us-ascii?Q?AfzQFbOyReoorxqrgDXhUAHA4FA6uan+hR8qmxiFSjGrC7ZHnyxAlNK33w/9?=
 =?us-ascii?Q?7HMUU72fkCzrnYnmDCaDUK4wsbgr/3ysS1NCs3kjZ9dvFTjns/tWvS69zI8g?=
 =?us-ascii?Q?iJ0sjqkVWZWQiTeHdY3vDjCZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14109199-61f2-43d9-12a6-08d96d498897
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 13:08:04.5705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rn+5t6xCfAYqUfx/0xwYygrvSZA139ZK7GgMLpEEWtvUgBVcr8w46iWrUN18FHA3slZiiH3xMEpEtndDLD691g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3934

On 01.09.2021 14:47, Andrew Cooper wrote:
> On 31/08/2021 16:38, Jan Beulich wrote:
>> On 31.08.2021 17:25, Andrew Cooper wrote:
>>> On 31/08/2021 14:26, Jan Beulich wrote:
>>>> On 31.08.2021 15:16, Andrew Cooper wrote:
>>>>> On 30/08/2021 14:02, Jan Beulich wrote:
>>>>>> Further permit "access" to differ in the "executable" attribute. Whi=
le
>>>>>> ideally only ROM regions would get mapped with X set, getting there =
is
>>>>>> quite a bit of work. Therefore, as a temporary measure, permit X to
>>>>>> vary. For Dom0 the more permissive of the types will be used, while =
for
>>>>>> DomU it'll be the more restrictive one.
>>>>> Split behaviour between dom0 and domU based on types alone cannot
>>>>> possibly be correct.
>>>> True, but what do you do.
>>>>
>>>>> DomU's need to execute ROMs too, and this looks like will malfunction=
 if
>>>>> a ROM ends up in the region that HVMLoader relocated RAM from.
>>>>>
>>>>> As this is a temporary bodge emergency bugfix, don't try to be clever=
 -
>>>>> just take the latest access.
>>>> And how do we know that that's what is going to work?
>>> Because it's the pre-existing behaviour.
>> Valid point. But for the DomU case there simply has not been any
>> pre-existing behavior. Hence my desire to be restrictive initially
>> there.
>=20
> But you're conflating a feature (under question anyway, because I gave
> you an example where I expect this will collide in a regular domU
> already),

I don't think your example fits: hvmloader moving RAM will first
convert the p2m slot to non-present. Then a ROM page can get mapped
there quite fine. A direct transition (without going through n/p)
would not work independent of the change here: The MFNs would
differ, as would the p2m types.

> with an emergency bugfix to unbreak staging caused by an
> unexpected interaction in a security hotfix.
>=20
> At an absolute minimum, this patch needs splitting in two to separate
> the bugfix from the proposed feature.

Well, okay, I will split the patch, despite not being convinced this
will do us any good - we'd backport just the part you consider a bug
fix, but not the part you deem a feature (and which I consider part
of the bug fix).

>>>>  We should
>>>> strictly accumulate for Dom0. And what we do for DomU is moot for
>>>> the moment, until PCI passthrough becomes a thing for PVH. Hence
>>>> I've opted to be restrictive there - I'd rather see things break
>>>> (and getting adjusted) when this future work actually gets carried
>>>> out, than leave things permissive for no-one to notice that it's
>>>> too permissive, leading to an XSA.

Actually I think I was missing an important aspect here: The code in
question gets used not only for PVH, but also for HVM, where pass-
through is a thing. Hence I'll restrict the "feature" part to Dom0
for now.

>>> Restricting execute permissions is something unique to virt.=C2=A0 It d=
oesn't
>>> exist in a non-virtualised system, as I and D side reads are
>>> indistinguishable outside of the core.
>>>
>>> Furthermore, it is inexpressible on some systems/configurations.
>>>
>>> Introspection is the only technology which should be restricting execut=
e
>>> permissions in the p2m, and only when it takes responsibility for
>>> dealing with the fallout.
>> IOW are you saying that the calls to set_identity_p2m_entry()
>> (pre-dating XSA-378) were wrong to use p2m_access_rw?
>=20
> Yes.
>=20
>>  Because that's
>> what's getting the way here.
>=20
> On a real machine, you really can write some executable code into an
> E820 reserved region and jump to it.=C2=A0 You can also execute code from
> real BARs is you happen to know that they are prefetchable (or you're a
> glutton for UC reads...)
>=20
> And there is the WPBT ACPI table which exists specifically to let
> firmware inject drivers/applications into a windows environment, and may
> come out of the SPI ROM in the first place.
>=20
>=20
> Is it sensible to execute an E820 reserved region, or unmarked BAR?=C2=A0
> Probably not.
>=20
> Should it work, because that's how real hardware behaves?=C2=A0 Absolutel=
y.
>=20
> Any restrictions beyond that want handling by some kind of introspection
> agent which has a policy of what to do with legal-but-dodgy-looking actio=
ns.

IOW you suggest we remove p2m_access_t parameters from various functions,
going with just default access? Of course, as pointed out in another
reply, we'll need to split p2m_mmio_direct into multiple types then, at
the very least to honor the potential r/o restriction of AMD IOMMU unity
mapped regions. (FAOD all of this isn't a short term plan anyway, at least
afaic.)

Jan


