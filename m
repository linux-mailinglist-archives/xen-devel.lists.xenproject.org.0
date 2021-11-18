Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A702E455B18
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 13:00:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227363.393220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mng4W-0006EH-8Z; Thu, 18 Nov 2021 11:59:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227363.393220; Thu, 18 Nov 2021 11:59:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mng4W-0006BB-4e; Thu, 18 Nov 2021 11:59:20 +0000
Received: by outflank-mailman (input) for mailman id 227363;
 Thu, 18 Nov 2021 11:59:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nol9=QF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mng4U-0006B5-VT
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 11:59:18 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4a5a93a-4866-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 12:59:18 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-3Cz3lhkeOS-lSc6F6OjD6A-1; Thu, 18 Nov 2021 12:59:15 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6176.eurprd04.prod.outlook.com (2603:10a6:803:f6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Thu, 18 Nov
 2021 11:59:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.019; Thu, 18 Nov 2021
 11:59:13 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P194CA0006.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.21 via Frontend Transport; Thu, 18 Nov 2021 11:59:13 +0000
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
X-Inumbo-ID: f4a5a93a-4866-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637236756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4H8f2KQLVi+GNJQIZb64/6x21piCuM4EH/czGViIVx0=;
	b=LmmyyFbvxs/HF4NxkeuGFjyoBtG0fuzdvq51lIc3V8X20IfcKhVrlQ3ePVGPy5lsWHRZ86
	LeQjnmXqtwBn8IbhlLcFx8r4uQDQbymiWZYjv5pTUMMAMdeF02VpO1SF7f1+q7Dgrqa8wA
	XCIswoR153WFnH6yCMssqgH2f/4SMRQ=
X-MC-Unique: 3Cz3lhkeOS-lSc6F6OjD6A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mYWkwFSH90baTQ2QwHyRZgvwRdNKKqh6IVMnOfENnzWdPM9dxevSXIH0TVysZ6IursjGVES7+pLRutFWGv3Gj1Vo7wIFYVO47hxLZQQYzWCTp5XRRJlKMna0RG8Ajp8zKU4MEvSW0dXDVz3rVEdVR0T1/uOQYGEJtYtDrGoUbP5j4hxCPRixwXGxV/hh00c+imRm89aZ8p7envrDV/mj4hRpNVA1yYHaqmBneI/UAAoFMWHEEAij03oRgc3JoPbCBVowm64M07GM8WA3zLHNSEvVC2aNlRNlFDgdhag6jfnyBkIP84lQZKzy4pHw8sHG66NWwEHxg89K41BcEeG5Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEIAbidNzS608OXD69nwjT0U5nhqnovo34e2SLoW5lc=;
 b=YQNrb2zYImw8/+LiahL0mKMh4msLfzruEHxfLPUajzzQYH/f6EJOFgyraPD4prIV72xzwthFfC7gdo/AYE1/+FNJCfEyyYfQxRHIzihE8XZEKU7c/Qhbueuw5qgyxg6RQOplmeOuB/bp+S6aTtTvsqNRhodfQ+9I9r9fLMs8UmFJI9NFuvmBIZ7CEEQIiG4IhQpFXMy8wMqCohKC+7qbDPta7iDmU2BrA1G85oJfikMHaMPGpwVizMGfw5D2uhUupPQwUlw7Kwhmoh+pfy506XqcNQXC3nNgGTzyXsypZPPv+XFe7s26N3Uf3nxZqBDuJdeoWzzr8sVY63CXNpWbTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4c3b8d67-70e6-294b-5fea-a63b5a5eb77b@suse.com>
Date: Thu, 18 Nov 2021 12:59:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 4/5] xen/xsm: Improve fallback handling in xsm_fixup_ops()
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211105135555.24261-1-andrew.cooper3@citrix.com>
 <20211105135555.24261-5-andrew.cooper3@citrix.com>
 <e2a68ed1-e7b3-0862-65d6-0f0e1ca454c3@suse.com>
 <1a9aae9f-fbe0-7c12-3a3c-222583a52b00@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1a9aae9f-fbe0-7c12-3a3c-222583a52b00@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P194CA0006.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b9a529c-102f-44fe-e764-08d9aa8ad6d9
X-MS-TrafficTypeDiagnostic: VI1PR04MB6176:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6176389DF9CD635D812D1CB6B39B9@VI1PR04MB6176.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qAI2pH0dIRmVnjsNVmU/hIJf9tA9ODmJWTotAs5Wfmw7I7dMXpXA745Vv1iEosyIOgMCJuSXhc3tUOYc7qSduZvyImVo3vDriQ3w6CMSAJLUYHnARKA2OHP6FzwgXhKj04s/X2pVFxi6hQeWLT5WWQXNOsgmjDEj+sc16d4YW9pj6wCWWsKR5b7vKwFkORdnVEmXJ61r5xXS44arZaMit1qLSnJn8E+qzxe3PZLKHBId3ROk+Lo1ww8WLvAVGytO7ShbvxPoYkTvHYO0000Mr6G/pMQaZUTFddRXelZtDgoKQsMvhlsZ4e0PrZrtexZjMsjpxjVnWzVAIDndwB7oOws2rrH9zBEZ/BA4Jo0h4YX4uFabY7nwsVAlRL2s80ER2w7RE1E6AuDQVmwKtiqAovQnuPnODm2cnRbRwa6ZCRx9i8oNteA3xKZZ6h0O2egUitfOAXtS0SY75GOZCta6vncyU1skoTfT0BgiZq/5BLNhmqk0uPFBBnSQIMiinJpvYAFCKpJYx/BVJVvXzpQRKKhjs8QEaFuWRNqB0lnTJK6C90JNm0JYatUF2S5XyMJsNnhiAlcyKjkMWzcXGIkuSpt8pjx/wXwjX+v2aFtmcJsuBC6exgf0wWGufxHY83EljXZfDUZFhtMckWUF1tKSMmjVRIbd5towmGrWhzkbAkp6+HDkiSgHI0hHOFYPMR6oqbQoq8CVzLHVpcS7hq4JVqEqPHmbx8tw604pa4X8mvEepf6IS9ymZEDA9aghW2xw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(2616005)(31686004)(956004)(26005)(38100700002)(8936002)(8676002)(31696002)(54906003)(66476007)(186003)(16576012)(66556008)(2906002)(36756003)(110136005)(5660300002)(66946007)(53546011)(86362001)(316002)(6486002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sMtwYmEAFnGwjsqVwFxHdLd2L2R72Vt/E98wZV4Hjb0s6phjClqUgDRljyu2?=
 =?us-ascii?Q?D7iS5ioYs+5Q8pTZEr6dsgXERqIC84EwvZtZA7D/mmh9H2cyEzAxZ3Hjg39j?=
 =?us-ascii?Q?llNQ5EIef/7MatcCQZp5n86EnmAFHc39mcbPcTpENkHhB/sYkLLgAn6EEMBa?=
 =?us-ascii?Q?6ukHXAYErRGI4XgiG2LmV1zOliPY0AiufHg6wXZzrwkjiwvr6RTnNiQ8TrUA?=
 =?us-ascii?Q?YMkUQDZZ5aChF+vOUjeg8T2VnDRVLmOms2vvPqCwmQzIHakmer83CQ+wrCws?=
 =?us-ascii?Q?++tjPaNRyxEJuhO4dlkA6PXy0FqnKVacj1UXxTZH+h6+ckvmVw70xo7ZzTHW?=
 =?us-ascii?Q?dQp4xQy/mmTljWSIfs1OorXR258pvJmc1UXKSy7YplwNkAq873T/kB/AdTC1?=
 =?us-ascii?Q?T9myfU9Vugn0TCfyvVqDtsqWnq8Vf8IejBT5bnS6FBUT/O5LXTCzzmVK/P0b?=
 =?us-ascii?Q?w+DBCkL4PARvEzji0PNr2sv24knGq/UNkkOzxTVkUZzMW1ZV6ufd/VNg3xF/?=
 =?us-ascii?Q?kd21aJUWWNnAUCTdu5YmpQ6xc/iqE2wmNs8bklS6MbwnslOzjDKXYdF1lNdw?=
 =?us-ascii?Q?dkeYwzF73/euUK5bNpnZ1Z2okmhEI6ZTmw9mzuhGlygkRpCqP5BAJy6lUmI7?=
 =?us-ascii?Q?07pQ25LekEfE5IIZnYgkwO4Oq6/upG4ICjN9EbPSm8yrZx3d6GCMgRAvbNzj?=
 =?us-ascii?Q?jAPsw96Xl91/j/jWt5b2lJJzRc/BCXlB5gvPZxgAMQKXhhFHiCzIO1Gb85p4?=
 =?us-ascii?Q?X3MKHolfRwImkEVdUycIA1NtqbanEslvDJWExtTsdZziVW4Bg1DZjTUTUMkY?=
 =?us-ascii?Q?rL96Ow2ScergTFAbu0aEkrfg2EHUc5P49hiFmvRd0xAu1hrrnyN+rp/nI/pd?=
 =?us-ascii?Q?u3YBSk5Dc+97DWU9o2Zf8NzfZ2R/ZHSZdOj/SuS19qSJax9Hs47+NrLsZ0hs?=
 =?us-ascii?Q?kCaJKNJDJuI4QVgRR6N5ckxhUOwmYeKFlkkxy1dqFI2w+JChmOmGSyL5DyJ+?=
 =?us-ascii?Q?xyF4htt3T9zYrirdoy10C+0ZeDSaVHwKJA0nP6BG8948wBASU1lnfh1aRKyk?=
 =?us-ascii?Q?C9n3w1BKM1WTQhE6gkJA+F+b9O9TZsE1exD6h7H17gsNSaxmbN6d4AC45UFi?=
 =?us-ascii?Q?OEo5xFWIyg95mFdtEeNQqKvxxRSWdkHZpNWJZVP2Ox0JD6mrN6fZqwhUovqE?=
 =?us-ascii?Q?e0T6ixl48Vg8FkTemDqgSwGCmRV/Thkz5dv4OC31s9BCGU+CT8VU9n9lIDny?=
 =?us-ascii?Q?4UF3vWiDPjroOznKUHUNHdPWj3t9m7JDqU/pQgpv9NfbRkg9NWawjCuX1nZH?=
 =?us-ascii?Q?SSm4vg0zE9GlvEnrjvNI1wNxNZpjthsF2GcQV8bUChqmpwIrfeFSqw/AM8C3?=
 =?us-ascii?Q?iass3by/od/VimyYzua7YBq42YdLAeHY8h3GUP4cTUSjPfR78kdx1P/vAPZi?=
 =?us-ascii?Q?/Mj6BrsifzsKCOmEs45yKxVGgUPqHPWSwqwK6sekql4ph7ADfqsr85u827kQ?=
 =?us-ascii?Q?Ltgw6objaasT9T4hxwXPCdzK9vfUDThgeyGOkJ9yabvpKfNXkvBDtV6+etII?=
 =?us-ascii?Q?3Nfy7Ffn+aH+8dPv7PlZLiUpd1wJc2ibkOf2J8esQ5LXD2+II4X6zNklo5sd?=
 =?us-ascii?Q?B2LxbEVAqI06pZyAaBjNr7I=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b9a529c-102f-44fe-e764-08d9aa8ad6d9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 11:59:13.8178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9J0es1qRlAJ4ZSSYUucylkXhsLojURssarChRbkT/Q2wpy1Zy66oAfZ+va052+EtYwobSaR4S8LdWgdxE5KNVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6176

On 17.11.2021 23:37, Andrew Cooper wrote:
> On 08/11/2021 09:04, Jan Beulich wrote:
>> On 05.11.2021 14:55, Andrew Cooper wrote:
>>> +void __init xsm_fixup_ops(struct xsm_ops *ops)
>>> +{
>>> +    /*
>>> +     * We make some simplifying assumptions about struct xsm_ops; that=
 it is
>>> +     * made exclusively of function pointers to non-init text.
>>> +     *
>>> +     * This allows us to walk over struct xsm_ops as if it were an arr=
ay of
>>> +     * unsigned longs.
>>> +     */
>>> +    unsigned long *dst =3D _p(ops);
>>> +    unsigned long *src =3D _p(&dummy_ops);
>> I'm afraid I consider this an abuse of _p(): It hides casting when
>> that would better not be hidden (and there's then also a pointless
>> step through "unsigned long" in the casting). I suppose this is
>> also why "src" didn't end up "const unsigned long *" - with spelled
>> out casts the casting away of const might have been more noticable.
>=20
> I've changed to a const pointer, but opencoding _p() wouldn't make it=20
> any more likely for me to have spotted that it ought to have been const=20
> to begin with.
>=20
> But ultimately it comes down to neatness/clarity.=C2=A0 This:
>=20
> unsigned long *dst =3D _p(ops);
> const unsigned long *src =3D _p(&dummy_ops);
>=20
> is easier to read than this:
>=20
> unsigned long *dst =3D (unsigned long *)ops;
> const unsigned long *src =3D (const unsigned long *)&dummy_ops;
>=20
> Fundamentally, I can do either, but I have a preference for the one=20
> which is easier to follow.

One option would be to at least make _p() cast to const void *.

Jan


