Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9E5514C6F
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 16:10:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317383.536681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkRJm-0003du-B2; Fri, 29 Apr 2022 14:09:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317383.536681; Fri, 29 Apr 2022 14:09:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkRJm-0003c5-7w; Fri, 29 Apr 2022 14:09:58 +0000
Received: by outflank-mailman (input) for mailman id 317383;
 Fri, 29 Apr 2022 14:09:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7mBs=VH=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1nkRJk-0003bz-9S
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 14:09:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b12c012-c7c6-11ec-8fc4-03012f2f19d4;
 Fri, 29 Apr 2022 16:09:54 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-dQOIlikzNAmDMx1vPnB7TQ-1; Fri, 29 Apr 2022 16:09:53 +0200
Received: from DU2PR04MB9067.eurprd04.prod.outlook.com (2603:10a6:10:2f2::10)
 by VI1PR04MB3199.eurprd04.prod.outlook.com (2603:10a6:802:3::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Fri, 29 Apr
 2022 14:09:51 +0000
Received: from DU2PR04MB9067.eurprd04.prod.outlook.com
 ([fe80::249d:2d32:4f2a:f748]) by DU2PR04MB9067.eurprd04.prod.outlook.com
 ([fe80::249d:2d32:4f2a:f748%8]) with mapi id 15.20.5186.021; Fri, 29 Apr 2022
 14:09:50 +0000
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
X-Inumbo-ID: 0b12c012-c7c6-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651241394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zZ2JvjYipBvzOZWaySmotetEPlbA3iJbOqtDc/S9194=;
	b=WGPlI7KKAKPksNJ7klW7tq4QwjFdbdtAYygFB8NUgWoaouoAx4FnBI2z4BHP/R+AVbsHTo
	84puIU1x0yipGd1GMJtK6ghnT/DVO/K+FfwYKznLpc7HFN41skUdzEoPig+E6/apbraRZh
	+Dinlv5sHPN6s7Z+fFmaucxXkNvOY6k=
X-MC-Unique: dQOIlikzNAmDMx1vPnB7TQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qgtqz/eBEW2a0IuHTkfaUJ+PeFp5qFhvrN4bGRlD0+7c+QHQVyxdUgJAWgw05JskgGGTtg+PuezDDNgPwem233L3ZfgR+PZmaPhr8YDNPi0+COEOWvz+KgnaXuTuN7YUSdp+k4BjMTWmIkuDKzS8LIvlsY9hYnTY0NOVNNPx3dfLm77TBQevlFiMiGanb7wrOnpG2osjMHIUU1kaKTqDH9I5AifmwqHxIOZ0evuUrM5qxO7Dvl+k7d9y62c2UPuKh0lNW6UhkOK7CpdQAOM9J9aaxmiPOfmg7jIIPLYLrQBKhsgSRZ+wuIfea1m9pUNJySCRZG2+g0BViKdpczcqBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZ2JvjYipBvzOZWaySmotetEPlbA3iJbOqtDc/S9194=;
 b=lvWCF7Cn8L/Ok6fHM1NcAKpYuDCTjthDs75HKe1RyQ5IfkDtCSvB60wzF86lUJnizYa2sg321Hsuy3OFgeQk2OAH91hubkg/YmrcVABVgxByI7TjjXpD23b7qQ3t8Uq0aRcc2K8yz3pR1ltI2uLBvM9hKkvz4OwnzdSoHkKWy/En8TSK1QRNqPJ+Ij5I0IjY5BxP5i03U+dlOct6GWVU0nyi+AldcjYOhXF+PSbhs+ufG5THEyr7J6r/2WKGoOqOLQi4WQgB540F4sD525HDpV7gnZzAifPV9Y8G+TO9Diq9a/I6SHCv39SqeRvSjllhHRZ9k5EQkXopU2q3qfHPeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <JBeulich@suse.com>
CC: "roger.pau@citrix.com" <roger.pau@citrix.com>, "ohering@suse.de"
	<ohering@suse.de>, "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86: make "dom0_nodes=" work with credit2
Thread-Topic: [PATCH] x86: make "dom0_nodes=" work with credit2
Thread-Index:
 AQHYSoM0M4Zi9SzqTkOjTOtQV+PP7azl4C2AgAAVUwCABn7lAIAABpgAgAEqhACAGTPWgIAAF2gAgAAfzYA=
Date: Fri, 29 Apr 2022 14:09:50 +0000
Message-ID: <a8ce120ee64165ac7b08de90e6786bb871541af3.camel@suse.com>
References: <1617b87a-640f-d235-701d-df2c57314b73@suse.com>
	 <2d56bb1015a263b6d1b196050d088b84c320b808.camel@suse.com>
	 <b41009b4-fea4-826f-f36f-7dd9f4edd1bb@suse.com>
	 <30ac2ce8cca7217775eaa704aab45a62deb1272e.camel@suse.com>
	 <e061a647cd77a36834e2085a96a07caa785c5066.camel@suse.com>
	 <35599105-b441-96cf-7537-ccf9dfac0934@suse.com>
	 <fd07c28fad352a476544258f2ac4d652062b2701.camel@suse.com>
	 <85c55676-b21f-1eb4-0471-19ca9b6de39f@suse.com>
In-Reply-To: <85c55676-b21f-1eb4-0471-19ca9b6de39f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.1 (by Flathub.org)) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 87cca63e-8f30-4cb8-dad8-08da29e9ed1c
x-ms-traffictypediagnostic: VI1PR04MB3199:EE_
x-microsoft-antispam-prvs:
 <VI1PR04MB3199F983324FA932A78E2E32C5FC9@VI1PR04MB3199.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 0cEkQnYygalFm7b+Lv7gk1M398z1tLMr40ujm3YbFAVrvslkJgFma7s7l+QayqGOYc7z+/ZOEfrFqZeRp1yajxwYcVTm/zylAP6/VCTOj20cWD2WUJ03T5S+wgVR/EZyw6VzwdM32ky7bO98csQHBj0V649s4sqkfeWDGtD5x8M/eHYOCBJkGn7NizXBacYpuJmdeBKj5N8XiBj9IeV3hE4xU2thF/Y6HdZR9JuKRCriGpTWlYzcMM+vDu/WX2fPiK3e6fPtTWQr2M0AJzVrYPLjaXffHAx3IkdoaaOH+YJfJHhYtSmneilI4PmPt3qjKLpdjkmwPFJAGkROd91BLjIqU5hvCuPHi3BYDJE3+cAvTR+WFFyrohgXOhHOkQIeqdNYdvy7WqYtFKXFqUCIWGnpoWPxVIEo7c+Kn+ty0fwrudPHluDJiD/tpFfHksP5qfzTuN3tHo+QMf0ilSNX9u6wgkK/rG5M2TahsN9oLBBxM61AkRILCGhMwD7N7zDm2X+U0RaIOUjTn4eeO7rNiUhwzdm0yQQu5sJgsfN5pL+4tsXBTk41NhO0Qkod86oLO40bgdAbrUqCENOQm8x6N5w8AfNNNnTvw7zW7KhHImWBMTlF3rM/kbjNwmOxLzWSkfdoamYR/sHVhOWWmDsOuto5N50PaU59/OsnUsG7PlgKu3n9hZBUKBIsr4m65bDucgaFWmId1N/jWrecsXgLJM2hlTT5sK+dDz9Pc/PA0B51gfXakQ5mVQZ4VhDvhNFpexw40J8g9yVLWVRZZ3muvw+/IoE2N5BQq9sZgA1L/QNoW6t21E3kn3rpl7RP1oio4V2aVpp5a9/LOrFrQbD0kg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9067.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(6506007)(5660300002)(86362001)(83380400001)(2906002)(53546011)(91956017)(64756008)(66556008)(8676002)(66476007)(76116006)(2616005)(66946007)(4326008)(6862004)(66446008)(36756003)(186003)(8936002)(38100700002)(38070700005)(71200400001)(6636002)(37006003)(966005)(498600001)(54906003)(99936003)(6486002)(122000001)(6512007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NFVWUFUvWmhoOXNZdEY3WjNZa2tFSWFuMnE0d3Vobk56RHloTXhaSzNWeDN1?=
 =?utf-8?B?cEFNZldWUzBBN3VXM2JmVG1SQWdsRXpIYk9GbndzSVltUFRyWVlYR0xKYVNl?=
 =?utf-8?B?YkdjM0dGZTRIMTVmYnBwMlM1dTdHanB3L21DL0lZUytDUVpVSUoyZXhxSS82?=
 =?utf-8?B?YjZEbjcxb1dOaWxTL1NoZDBQSW9pd2kza2dKb2hYc2FoV0xTYnIyVlZtNkRS?=
 =?utf-8?B?d3NRa2hKV2dOQTNzb2hMRm5XK2plaDVnZDVpdzZYNUxnMUJUb1JLdUhiYmxT?=
 =?utf-8?B?UU9kU21JUEZqMXhMOXZLN2VjbDlaejdHaDhBakREUFhtYVljQ2VjNHptOUkx?=
 =?utf-8?B?ZXVQdTZmc05neHJMVFVScnVoOXZFdW12YnkrTmFvbzVTQWhTWHN0Y1lMODA0?=
 =?utf-8?B?RSsyVU45NlMvbzc2S1d1cGhqRTZyejFZNXpJNWhVNmM4a3VnYjFkYlFQdWVX?=
 =?utf-8?B?WmZLTm1NTUpMZDYwM1ZNRHZ5WXovOFVrcG9YNHZrMy9vcEJOZEpETHZPdWg4?=
 =?utf-8?B?a1R5L2RSSlM1OEFqVFZObEhWOFNaMkhsN25KODd3SXZGNDl5eWkvY3RPMnpJ?=
 =?utf-8?B?Z2EzN3RNcy9ZVTljV2FhMjUraW1qTFhlM0d3Q05VS05JbmxoazJNdGxPWnk0?=
 =?utf-8?B?Z3JhUnVBS2VkTG81NE5qTDBsUUJQY2VDdkNRNnEzVE1rb2xic25WcE5HMUxr?=
 =?utf-8?B?L1gwMHZqQU91Um4wOGNsMG9HRXJaNWdyMy83RExxOCtUbUcxT2RoUW41K2Z3?=
 =?utf-8?B?TnQ4bCt5YW1EUVdwcTRiNDZpOVFsbXY1MUxvd00wdEd2Yk5ENXlFRldjUDgz?=
 =?utf-8?B?RE9BaWlsOFkwa1k3aTV6bHhYYjY0blZLaXJtSkVqR3AvMlJoeHVJN3Zaam5x?=
 =?utf-8?B?dnJ3WTFsOEQ5TFg4T0tIcFEwenhFQ0djNm96NDNGUXZxcmZXQXg5dmNQVWI2?=
 =?utf-8?B?ZlJkYm0yZWVYTDlpajM4U2NHQ09oaEFraVJDTXdUOVh1OXB1MjhzQkx1Z2M3?=
 =?utf-8?B?ZXlkeVlkVTNWTnpxZDdKVm1tNnhub0pZY0lzZ3I5aDNiRUxnR21GZG9Ob0xJ?=
 =?utf-8?B?MVluTmRLNU56V04zTW9Ud252OXVFTEwyWldkbHRWWjdCWEFPYkFHNDQ3anNK?=
 =?utf-8?B?WlVhazhOT2lVb1hWM09NL2h1ZTZudlNzY0RaU055M2JhdVRaeWU1eGRDNXJW?=
 =?utf-8?B?ZEQ1MjREWXFZeERtaTNmSzQ0OGFsTGxKbU8rUGtmbGlxZ015bHZGSWNBVCtJ?=
 =?utf-8?B?TUJwZkJRbmk4a3hubjhtV2tTeU9WQXVCelpINDgzSE0xOFJqY2VEd3RvMkw5?=
 =?utf-8?B?TnN5eDdFM2dPbGFOMnI1bmxQTmFiQ2UyY2l3eVBIMDJ0eC9WOGRnQWtsdjJO?=
 =?utf-8?B?Qm9GdEFsOWh5V1cvQjNvT1pQZVJpUy9xR0trRGUrQWQ0aGdHaStKWWJwNjJR?=
 =?utf-8?B?SzB4QjFXbHJTSHd5YlEzc1hwVVN4MUY3UFZEOWVya1VkZHYxMFhpdzduZjZm?=
 =?utf-8?B?cmg0T2p1eWprQkxLODgwaFVRbHZHcklaRGZzeVdydjFjWTZkUVh2RWhVNXRV?=
 =?utf-8?B?SE51azAxM0VXMENYTWNROXA1Z29BbWl4UTZPTTgxUlkxbWJoWThKNS9KRHlF?=
 =?utf-8?B?TkFhOWxwZ2lZdlBpenJOWHdFQjZTcjlxR0Fta2NZR0JpbVNCMG1BU09jWnJ5?=
 =?utf-8?B?c1VobFZlTUU0RGZGdnlubjRUUDUvWm9VVXNBZWczRmhKd0xmSHA3T29nLy9N?=
 =?utf-8?B?VHpkNVBqVXU3RmpoZTJTcm5CcHFlVWZZMitzamJ5ekNaT1M5ZU9MWUhaQlNa?=
 =?utf-8?B?R1F0cnk5TUZVMWVFZEdGOEdtYnlBaU56T0Evc0UvRktCdmsxTXQzUGtjZ2Ri?=
 =?utf-8?B?WDhKNC9Yb3l5WCt3Yk83MG5oblpMS2FPVWxUdms2b09abjM3Z2JqM1NCSHlC?=
 =?utf-8?B?UnhhY1ZwRmtEcFhXN0FBeldSaGkrWVpNVWU4dG9xQjkweFl5dE9uSTVPSkdT?=
 =?utf-8?B?cTVjSld6b3hPUkJkUjRmd0FTbFNoeW43dHRPNndJUFdHbDZXaWlpZkF1ZkYv?=
 =?utf-8?B?MU1ERGg0QVhSMVZteEcxSS9XL0hMcVZhUXNON0tzamdEQ2NVYlNlNWtCV0lU?=
 =?utf-8?B?am1yZ01TL05GTXpVVDlTS29hL3dpN2l3Y1B1Y3JzbFd2YVovWWw4NFFCR2tI?=
 =?utf-8?B?bVlOaEtsaHByVEFCUWxmMUpKR01CQkpjTUdDNDFFTjg2Ymp6TkRtTGVjdUxz?=
 =?utf-8?B?N0dIRU9reU5SdHZhOTZZaVBCT1ZrSE5DZ3B4Sjk4SWJIOGNZRytqWjJzeCtU?=
 =?utf-8?B?TFNoczhTWVRPK1Z6N3JnbjNJVC83TXJaRFhHYmNIRTc5TnIwQXRxQT09?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-7/4pZg/mM9KmhfVVd3SQ"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9067.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87cca63e-8f30-4cb8-dad8-08da29e9ed1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2022 14:09:50.7931
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HYjU7ko4DjEO5z2anNBDVXOVbjt1/omc29eMcQA0busisZoX/rOYoFSy1kybmMmEMH2PL6DlpKm8Iv9aUjlAXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3199

--=-7/4pZg/mM9KmhfVVd3SQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2022-04-29 at 14:16 +0200, Jan Beulich wrote:
> On 29.04.2022 12:52, Dario Faggioli wrote:
> > > Is that mainly
> > > to have a way to record preferences even when all preferred CPUs
> > > are
> > > offline, to be able to go back to the preferences once CPUs come
> > > back
> > > online?
> > >=20
> > That's another example/use case, yes. We want to record the user's
> > preference, whatever the status of the system (and of other aspects
> > of
> > the configuration) is.
> >=20
> > But I'm not really sure I've answered... Have I?
>=20
> You did.=C2=A0
>
Ok, great! :-)

> >=20
> > If dom0_nodes is in "strict" mode,
> > we want to control hard affinity only. So we set soft to the
> > default,
> > which is "all". During operations, since hard is a subset of "all",
> > soft-affinity will be just ignored.
>=20
> Right - until such point that all (original) Dom0 CPUs have gone
> offline. Hence my 2nd question.
>=20
> > So I'm using "all" because soft-affinity is just "all", unless
> > someone
> > sets it differently.
>=20
> How would "someone set it differently"? Aiui you can't control both
> affinities at the same time.
>=20
Yeah, the argument here is basically the one that I put below, and that
you say you understand. I guess I could have put it a bit more upfront,
sorry about that. :-)

> > >=20
> > > Hmm, you leave this alone. Wouldn't it be better to further
> > > generalize
> > > things, in case domain affinity was set already? I was referring
> > > to
> > > the mask calculated by sched_select_initial_cpu() also in this
> > > regard.
> > > And when I did suggest to re-use the result, I did mean this
> > > literally.
> > >=20
> > Technically, I think we can do that. Although, it's probably
> > cumbersome
> > to do, without adding at least one cpumask on the stack, or
> > reshuffle
> > the locking between sched_select_initial_cpu() and
> > sched_init_vcpu(),
> > in a way that I (personally) don't find particularly pretty.
>=20
> Locking? sched_select_initial_cpu() calculates into a per-CPU
> variable,
> which I sincerely hope cannot be corrupted by another CPU.
>=20
No, not by another CPU, hopefully.

And this is probably fine, during boot, when there should be no (other)
scheduling activity. However, during normal operation, a vCPU being
scheduled on CPU X, or in general having X in v->processor, could be
using the scratch cpumask of X already. So, if we use it without
locking, we'd risk using the wrong mask.

Therefore, we require the scheduler lock to be held, for playing with
the scratch cpumasks:

/*
 * Scratch space, for avoiding having too many cpumask_t on the stack.
 * Within each scheduler, when using the scratch mask of one pCPU:
 * - the pCPU must belong to the scheduler,
 * - the caller must own the per-pCPU scheduler lock (a.k.a. runqueue
 *   lock).
 */
DECLARE_PER_CPU(cpumask_t, cpumask_scratch);
#define cpumask_scratch        (&this_cpu(cpumask_scratch))
#define cpumask_scratch_cpu(c) (&per_cpu(cpumask_scratch, c))

And sched_init_vcpu() (and hence sched_select_initial_cpu()) can be
called during normal operation.

In fact, sched_select_initial_cpu() does pcpu_schedule_lock_irqsave()
before starting using it.

>=20
> > And again, soft and hard affinity should be set to what the user
> > wants
> > and asks for. And if, for instance, he/she passes
> > dom0_nodes=3D"1,strict", soft-affinity should just be all. If, e.g.,
> > we
> > set both hard and soft affinity to the CPUs of node 1, and if later
> > hard affinity is manually changed to "all", soft affinity will
> > remain
> > to node 1, even if it was never asked for it to be that way, and
> > the
> > user will need to change that explicitly as well. (Of course, it's
> > not
> > particularly clever to boot with dom0_nodes=3D"1,strict" and then
> > change
> > dom0's vCPUs' hard affinity to node 0... but the user is free to do
> > that.)
>=20
> I can certainly accept this as justification for using "all" further
> up.
>=20
Good then.

Do you think some of this exchange we had should end somewhere
(comments? changelogs?), to make it clearer to both future us and new
contributors why things are done this way?

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-7/4pZg/mM9KmhfVVd3SQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmJr8a0ACgkQFkJ4iaW4
c+5F4RAAo3Frs1dSt1I4avpihybWRPGs1GXdDTsEAJyHz03Tf/GSV81+viO5pcA8
hzQGO5fVxT6JZXMp016zBzcCd6DsaBFYvPj4FxowBWFMjW4Prcs750q91GD1jdOW
Bko4vKFqgnpF8qF7oZMEpleXC4rUdI07XEi1Cj4sAaT7HE2dnXdKol6k/2c7RhOY
CFG8boYrInllmTFJTUf5g5yHqwdFjNSSIezS7w40BkHT9kWZOmgNTuzfOVNdoHHQ
gVgCWzR1aQPpYebyGuT7eo2CDhHLE6wJks/EAj74YBuJ3FTt6E0RlZmgH3sp2rht
+1gBjakubdf0bdBWM1iD/cADrzoE4xJ7c3j/drwN9bzTpoLS6bflQuzObo3+zmZI
mu8weG2DqNSTvtR44u7UBVV5wSiIkO2P1/1xwlQyHNsPi+4qIe2t8dhp6KZTv2/P
8DYnOZPwWi40WAxRVj76nS6xeXkXMeCpQ6K2BD6odVs7w2JV6OwMsbJMS7PUYNV9
Fv8I3g1uM8Z0iwFR/GbgtugqSZj+rIriEgsw6cKRh2ERV++RnBY1bjNppkOCCjSK
Fbk+/mjvjlfJg/d48Kr0QOoV6ieGa9BJ939Hzr7Ctli+Uc1D4Ud9u2swV3SWcsEe
hhdMHtpXlMYXCP8NUrjQVCrbkIu9wuoJ/IxiOPgTw8aNYdb6fZ4=
=zetz
-----END PGP SIGNATURE-----

--=-7/4pZg/mM9KmhfVVd3SQ--


