Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F003FC832
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 15:26:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175740.320046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL3mE-00039W-QL; Tue, 31 Aug 2021 13:26:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175740.320046; Tue, 31 Aug 2021 13:26:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL3mE-00036X-Ma; Tue, 31 Aug 2021 13:26:10 +0000
Received: by outflank-mailman (input) for mailman id 175740;
 Tue, 31 Aug 2021 13:26:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zqic=NW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mL3mC-00036R-Pu
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 13:26:08 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff5b7b50-0a5e-11ec-ad3d-12813bfff9fa;
 Tue, 31 Aug 2021 13:26:07 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-0PNSsjq2PUu1iw3Tg0-5Vw-1; Tue, 31 Aug 2021 15:26:05 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB6916.eurprd04.prod.outlook.com (2603:10a6:208:185::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Tue, 31 Aug
 2021 13:26:04 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 13:26:04 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR03CA0024.eurprd03.prod.outlook.com (2603:10a6:208:14::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.20 via Frontend Transport; Tue, 31 Aug 2021 13:26:04 +0000
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
X-Inumbo-ID: ff5b7b50-0a5e-11ec-ad3d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630416366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FZFQ39lMUMCFjB9FhqaWZgFhIhVmMfr866wHFbv7FQE=;
	b=C6Dxhbc8058vx09CsjsJi82krC3mP9o7Rrcz5amzWa52Y897YU9VPFDh0CoWJfYX/uuTdd
	dsliF7yTMsZRlsMQujrsRVD8sYXLA98Vgx4hLpDBcjNPPHhfaPKoclgVlEimC1PJNV86+z
	7AdetOsjPfYP2lGFzz71aRH9DN6NmlQ=
X-MC-Unique: 0PNSsjq2PUu1iw3Tg0-5Vw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJaoFEfvzQVG9L8MJI4SnMD5bNVnTER/MexaXQqfY/JO4QoUC1ROKP4iI79z/nIuHCm7NJFQMjVL9bxHc1cArfzY/3Tb+h4LjLR46VoGcKqFvi0wBKDDdWnltyuIc70ieFX1lHhsMaDbWR7/R616iMvyvc0blws+epjR9+kct/W8Vr/0TlmuS0HJdfw3xc03Z7MZ3NJS7TkqSdI/PdMmQ0yO6DgtLJ3PQg2V/7PQVMg3sCpPc4naTIsSZcTiy5QZ/1hNr1hPkYM8UIoDgQlkAxEC6BPGkzA/QFjagsqoz2WtU1R47GXfzZ2fB2JGE7rjpiHnMPv6tuugphQoydpxig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJmTzGet/2fMt8nRVo4V2KWla+vZk/pOpQRUr07NXZU=;
 b=RCA7ud8mKOYQqt+jfe+b1QOJUca+ZDblwLir2fDcmVFRRJcv8es8Eebb7ijepOUXn43bABSlUg1GgidCvUsVbHUmlU+0lYBG+GPxe3fcZZH49jbTWyL2a4gaqGu09iGNfZxSMqXSgu67yC4pb7nxIxG6CFfzU6DH0vQcL9+ylj4eRLorxdMBqn6U1PQL9YnNGaEu7K7fuOjWQsp03nTO77YqwS/aLMNKhZ/kZqGFWHjtb5hf5lRefM07B5MpAHB+ykE0ZrLEu/uHRFtehxTRA56vRZE/hnk1Tv+8jhSOKgoJJrPDFKNlI62tMal0WEiUigrC0tGeLsRRNsOiOl64hg==
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f684e203-9967-8653-d59f-ad11f5070aef@suse.com>
Date: Tue, 31 Aug 2021 15:26:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <ad1e33b5-d729-2680-7f9f-aa875c2d9cfa@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR03CA0024.eurprd03.prod.outlook.com
 (2603:10a6:208:14::37) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d48136a5-010d-4bf8-0172-08d96c82e222
X-MS-TrafficTypeDiagnostic: AM0PR04MB6916:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB69169B7F36F1C1480FBE878CB3CC9@AM0PR04MB6916.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	91a014WWb8MGi53HaO63rFYM2UoNM9QaAUTNByGxzYwj8Az/1/pwJAQaMkVYpgEr76hj7acCVnwzxVOeNT/1xcwOs/z4MgENmUlwUFx1ziyUWi9URl+DjFCYHZe9MHshraSLGZZwS3FKtk7i1y1e/MiDCw6ZLeP2vhylMcyEtQ0eitwzY4iAZnERdNRmOR0uk0qiIRzXG/qV3GqCvSaVFXhev3fKhhTciy9YibiC7HdbV40inZv3lwwqJSHe07bkt8Z+xCFTUGtm0CAFt5JcZLbir/jvOctd8HeO1fFc2AvFvtDyA3vL4jauUIEzTKHX+Qo2o8aj8p/dhhIuTSJuPwkaU2Go/bsgiMOb515vcubr2QSA2e7kHUC9hqCrHP+Fw+nZVC70RJ9qXPcIgM2gZRadAFZ1angvD2hGY0bEPXnjNA/JlGvTmUXb1Tig9rW9p4GOp/0ICAodiiwq+s1dWQsjDRLNfBfB6Y8jwYbSowMuIE7fZsKaoHPEcYBWRv5y4j59g/lxdJ7ZF+5+1r1dpsEhAf05l8Mh2MU7JV1JZr1dJisiVGHiwT6S/AVzLYygAgszuvhuY4QRbihUWDyc3eZ51+oof2LIPxFnQXAr6LdsnNn0FgnZ+12mHYg8DhFup7gQqED6NI4ckJWpegBg/gz7CUStD1VwhoZd+hgBH1AwpfD4CwxlJdQWSBQPLXaZrxMa1nj2tlm3iHGvg/Hsy2vDLeVtZ0PZLjiC5Cz2h8o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(39850400004)(136003)(366004)(346002)(83380400001)(5660300002)(4326008)(2906002)(26005)(6916009)(66946007)(316002)(86362001)(186003)(6486002)(16576012)(8676002)(66476007)(2616005)(31686004)(66556008)(478600001)(956004)(38100700002)(8936002)(53546011)(36756003)(31696002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TBCrpqgLKewA2i9/KZGRboHa0K4s1+QMZm/WIOGYsTda5VVvjgcTYLePosR+?=
 =?us-ascii?Q?Cq0x6QpYTEMyvo9A3n0ACLr1JwN2vcj1ei+GfG2FdgNDkR9bG7wB5O/jk1Nm?=
 =?us-ascii?Q?sctHY/8QuDBnXaA1t31Nlj5nyzdjderT5hvF9s+gBLm4pM7BY7EsXJTP570e?=
 =?us-ascii?Q?fLannAACh6i/SEKi+OtL/ZpPmUETl8zF24TmIhxZpUegWihDLGgwIViW/x2f?=
 =?us-ascii?Q?uW8uwlPQPMYQ84VclyZGab6vXJ7SKQD0gCsOXJe6nExCExfhsTjFUxtcAefE?=
 =?us-ascii?Q?Gct5fiC7tXhc2wfe4pvdvdXZfkN1t+5PIz5zeEa3oNyGBr5cmeeiiIc9tOS8?=
 =?us-ascii?Q?Qm0WB4IXeIy3/W1zYVmyFefnp+EzREynoH12pNQp/h59XPgMA7FTPansV8yD?=
 =?us-ascii?Q?yES8b53hLIso1TmIIYZiBGLj4562gpXPNNRcD33AN/3v57a3fndr8OUdl8Du?=
 =?us-ascii?Q?QY6zV8cbg4R/JBWYu0KqrQz3phXMEdZewJdzdZ6MAwfwzFgyWXzPde1NnSP7?=
 =?us-ascii?Q?4tBdnZn9hrx9hBX4RuKI6/C1cEwct8iHGaGKz7uXSnbd/pgizPyMJDaYSMWB?=
 =?us-ascii?Q?Yh8hXPuqW25CwDIkSAHT7x9UZ+YwxovHjFJ1miWYmuEfE6TckSBjA/ARPm2m?=
 =?us-ascii?Q?cxAzpfD8FQn1nPUD1sRwfOElVB5NXAxIyLa4mrwuk6lsI7GDMknEsu9bRzE1?=
 =?us-ascii?Q?hiwazuWjySe+y5bOvJkKIrB3vv9Bp15vj5OLmyQjY5+atI8uSDroPRvaxVD6?=
 =?us-ascii?Q?HtPfGCRPe72ortpknulc8uoLmJi5MAH++DIOi0TFn2HBT85t4kU8Qo63lVla?=
 =?us-ascii?Q?3jlodDx2zqaqvmXH4fqvNTxJYDvNJJdfYDsjaUYu0vXGyC65T9Q3/RJq2mIT?=
 =?us-ascii?Q?A6wpAnBzeU+nMk3efNY8QJr7stp1SAUHylUtY9D8mVois84cWmxJpxaBKq6d?=
 =?us-ascii?Q?45wuiuD8Mzm6Nlhfv+ogNtT2C+jAfQumEJGi7KnYhqXtV2CRNIZ3EEhvH6aU?=
 =?us-ascii?Q?KKvgAGgSEdxLKuuPD6UOTotv+6UuyYQkkbcp9lUEWY4ubkq4Pf+wkGPw6mm1?=
 =?us-ascii?Q?tgQpoq8ZOtAAxwNLISydqb71JbOmdX29yJE9WWkiSVDp88dd8yZ8Fpk/iXXU?=
 =?us-ascii?Q?sLCBPAcsuU9/Ui3Uj2T32UJwHUZOhXqZCi2l9dLRhWQLR81aukVxhpyqLJO4?=
 =?us-ascii?Q?61cQ3/YMuOT8Ud+6M4ZRTfkBGz1529n81MflVE9hD8iGpIGwoXpsSogRwKah?=
 =?us-ascii?Q?oN3hVLC54Nwmev0KMmP9Kb0qfKIj2BI/Vq4YqeRiCp8SBXc0REMxIvspYNxG?=
 =?us-ascii?Q?LDaOpVOP9L81ZiljddSkdZRl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d48136a5-010d-4bf8-0172-08d96c82e222
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 13:26:04.6212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c0B6OHZOtUdFFKw1jJhXwz3c9YfQy9GVsQwUTeOOofeIJTJ8jA72HTYhu3MPLzqroXSHqemPqK8upxUY7U3qpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6916

On 31.08.2021 15:16, Andrew Cooper wrote:
> On 30/08/2021 14:02, Jan Beulich wrote:
>> Further permit "access" to differ in the "executable" attribute. While
>> ideally only ROM regions would get mapped with X set, getting there is
>> quite a bit of work. Therefore, as a temporary measure, permit X to
>> vary. For Dom0 the more permissive of the types will be used, while for
>> DomU it'll be the more restrictive one.
>=20
> Split behaviour between dom0 and domU based on types alone cannot
> possibly be correct.

True, but what do you do.

> DomU's need to execute ROMs too, and this looks like will malfunction if
> a ROM ends up in the region that HVMLoader relocated RAM from.
>=20
> As this is a temporary bodge emergency bugfix, don't try to be clever -
> just take the latest access.

And how do we know that that's what is going to work? We should
strictly accumulate for Dom0. And what we do for DomU is moot for
the moment, until PCI passthrough becomes a thing for PVH. Hence
I've opted to be restrictive there - I'd rather see things break
(and getting adjusted) when this future work actually gets carried
out, than leave things permissive for no-one to notice that it's
too permissive, leading to an XSA.

>> --- a/xen/arch/x86/mm/p2m.c
>> +++ b/xen/arch/x86/mm/p2m.c
>> @@ -958,9 +958,13 @@ guest_physmap_add_entry(struct domain *d
>>          if ( p2m_is_special(ot) )
>>          {
>>              /* Don't permit unmapping grant/foreign/direct-MMIO this wa=
y. */
>> -            domain_crash(d);
>>              p2m_unlock(p2m);
>> -           =20
>> +            printk(XENLOG_G_ERR
>> +                   "%pd: GFN %lx (%lx:%u:%u) -> (%lx:%u:%u) not permitt=
ed\n",
>=20
> type and access need to be rendered in hex, or you need to use 0x
> prefixes to distinguish the two bases.

Will use %#lx then.

> Also, use commas rather than colons.=C2=A0 Visually, this is ambiguous wi=
th
> PCI BDFs, and commas match tuple notation in most programming languages
> which is the construct you're trying to represent.
>=20
> Same below.

Sure, will do.

>> @@ -1302,9 +1306,50 @@ static int set_typed_p2m_entry(struct do
>>      }
>>      if ( p2m_is_special(ot) )
>>      {
>> -        gfn_unlock(p2m, gfn, order);
>> -        domain_crash(d);
>> -        return -EPERM;
>> +        bool done =3D false, bad =3D true;
>> +
>> +        /* Special-case (almost) identical mappings. */
>> +        if ( mfn_eq(mfn, omfn) && gfn_p2mt =3D=3D ot )
>> +        {
>> +            /*
>> +             * For MMIO allow X to differ in the requests (to cover for
>> +             * set_identity_p2m_entry() and set_mmio_p2m_entry() differ=
ing in
>> +             * the way they specify "access"). For the hardware domain =
put (or
>> +             * leave) in place the more permissive of the two possibili=
ties,
>> +             * while for DomU-s go with the more restrictive variant.
>=20
> This comment needs to identify clearly that it is a temporary bodge
> intended to be removed.

Okay.

Jan


