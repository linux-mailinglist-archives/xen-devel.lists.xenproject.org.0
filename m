Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9B24FE5A5
	for <lists+xen-devel@lfdr.de>; Tue, 12 Apr 2022 18:15:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303730.518171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neJAQ-0005Ow-2Z; Tue, 12 Apr 2022 16:14:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303730.518171; Tue, 12 Apr 2022 16:14:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neJAP-0005MS-V1; Tue, 12 Apr 2022 16:14:57 +0000
Received: by outflank-mailman (input) for mailman id 303730;
 Tue, 12 Apr 2022 16:14:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vUK/=UW=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1neJAO-0005MM-4m
 for xen-devel@lists.xenproject.org; Tue, 12 Apr 2022 16:14:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b05cc9b9-ba7b-11ec-a405-831a346695d4;
 Tue, 12 Apr 2022 18:14:54 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-3EryQONNMhOiboyN2Wu0Pw-1; Tue, 12 Apr 2022 18:14:53 +0200
Received: from DU2PR04MB9067.eurprd04.prod.outlook.com (2603:10a6:10:2f2::10)
 by AM0PR04MB5810.eurprd04.prod.outlook.com (2603:10a6:208:125::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.28; Tue, 12 Apr
 2022 16:14:51 +0000
Received: from DU2PR04MB9067.eurprd04.prod.outlook.com
 ([fe80::249d:2d32:4f2a:f748]) by DU2PR04MB9067.eurprd04.prod.outlook.com
 ([fe80::249d:2d32:4f2a:f748%6]) with mapi id 15.20.5144.030; Tue, 12 Apr 2022
 16:14:50 +0000
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
X-Inumbo-ID: b05cc9b9-ba7b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649780094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IIrKmEUjX6Eol6BqaFjqIGGwrzSg8BGGyIv99BLINxo=;
	b=XU6ZpneK/BhyPcFKtIxgdnscE//8Du0H3ts+YCA2F3sCoDeS8cXkxMFIEfPNBRx2h9zxys
	4Y4eZKyJ6+sLXmtqYFBvDiK0HEd5MPEY3TC629AtanGr6Qw8bvGJ4ZmLI8WVTFDKg+FlCi
	EVdkFigP53BzKMj4z1W3z/7CuWz8rQQ=
X-MC-Unique: 3EryQONNMhOiboyN2Wu0Pw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQu62mF9/NL4F4EiB4DdO/fOvt1/qHeHmXutAqaQjQ/tOmBAdh4DgVGV1JSpE+OMItwt+I4+h6HKaZUDAsau+1ScpLgKuCPOe4YXdpZW8OA6sJ6/Qy6yIavq3M1Y7xpua62hHkbmzZwOhPGz+k4sSvlFHABN0UDHXHa7Qc+g3c2SeJIuszOuTLnrTxJVZcAoIMMDFYPVYPxGJ2YfN+3TunSBtt046W1tM66QtuGJc/VlCCHxCsn+g3ti/106Kcdp/SZxHVDpTvAMugWfhJ6xe6vfFA7S+6PZNk+iKr3NkXRoMcnD/69oiD2LNiXxVdwtQ5/GoFkmy8DXbdNsLY/C7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IIrKmEUjX6Eol6BqaFjqIGGwrzSg8BGGyIv99BLINxo=;
 b=ERYpfqlPyyzUC+yqisMjspAkvxS9y+qrQvXLpTaw5ktPv7i0WiyX75PFwyqY9NFcEvRxpzODfm4Z3AjeBTfUQyCKLyskF4L1GYJjBRa5i3HoSCREVA7KJCmie8BCF/7CdpKxMG6qxfMYH9G1J/WA4oPSpU0z7T7u11YEeUiX1Kmi6KQUYF/gQSK/2JulMAbNaymav+spiaih0PE2bOWKzwVWr3BWGfmdbNQ83M+C7x2O6kPu9W0NQ7Kgo6L2AdSqvi3ufJDWZ1RPsa8vKq/T82urkabxVvqIxVOiivlKd3jHzzxX6Or5xG5lPi/RD9I6gmkpUywpTY2R+K7LxWF3Pg==
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
Thread-Index: AQHYSoM0M4Zi9SzqTkOjTOtQV+PP7azl4C2AgAAVUwCABn7lAIAABpgAgAAA2wA=
Date: Tue, 12 Apr 2022 16:14:50 +0000
Message-ID: <46feb71a14c70d24e894311e7ef9390064d6f437.camel@suse.com>
References: <1617b87a-640f-d235-701d-df2c57314b73@suse.com>
	 <2d56bb1015a263b6d1b196050d088b84c320b808.camel@suse.com>
	 <b41009b4-fea4-826f-f36f-7dd9f4edd1bb@suse.com>
	 <30ac2ce8cca7217775eaa704aab45a62deb1272e.camel@suse.com>
	 <e061a647cd77a36834e2085a96a07caa785c5066.camel@suse.com>
In-Reply-To: <e061a647cd77a36834e2085a96a07caa785c5066.camel@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.0 (by Flathub.org)) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba8b8b73-cd1d-48fa-4acb-08da1c9f9285
x-ms-traffictypediagnostic: AM0PR04MB5810:EE_
x-microsoft-antispam-prvs:
 <AM0PR04MB58107D57FF45D987BE6C7236C5ED9@AM0PR04MB5810.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 fxEaXSweP/jWZjdPCqzKhKjJtKP/+5ogRuH4uU3kIk56J3pYy0TbWdX7tQy0wIT6P2VOxCFWwwsrct8eoMlJL8MUbD6nI0PEJLZUtYmTmXgC7Jb2qiYKBFKErzPm4mAm7ttq8Zdb6tdPMEJ2sgwQDQ6sFCc3w2LChbY4mikcsC3rOJCucSTVaQtb4QfI5sUOdUx9FwWzrveOQDw5XparWHmCi5RFNu8qrrRZq/k07RurSMsdQ8tzmHJkyEN5ANVakHfhoHqFz2/r/VVR0DiJbDqnBUvkpYMlwV9nhZBZKDfJ6D1aWCaGgRQnuG0oeR+jfbzTAXoxsHnsdOA5hDZB6eroNALxKFopipRTwV/EUS3KS68c2cV0s+b/gIcBFfRSbr6JsQk/wXzo8SAKc1plCQphlUakqZXJOmJHzKR1i9VV2L8NJep100Nmdo7IxtkN7ZV2trC3qMribxkRu2L1CzlI4f9tvOhAW95BcCZaqeHK/9H088boSOoGieZqoOfMrbbFl93AHiCqNC09xkvzUjuTBGxICGRSMa8hltjHNfU3P0262YB7mW7fqoJiv9REGMNMJQ0wE3nAOnpbpZIh0DVm8ZvHGvqFnM2rvWlv4JWYdPei0i+WOi5KV4iLGg5sWgkONUldyfCJPNKfRN8pFIgARcbpqWD1RN1gVAKr6i7K3YSKNlLguROT7CXigMNu8VLoXTstgV8ewmOFxZYE3bSfzPRK5sc+W761oUr5AsxXMQ1dx8fBMySown6yHFR3cnvJzexMT8PNNKX0hfNErHStSMEprbBNAWvNYSeLDl4q0SZ/PECqgxf9XVMfz3KY+DZ7LNEG89QDo6RMLzR6Pw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9067.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(966005)(6486002)(76116006)(66446008)(186003)(2616005)(36756003)(498600001)(6636002)(37006003)(54906003)(71200400001)(38100700002)(99936003)(91956017)(26005)(86362001)(64756008)(66556008)(8936002)(66476007)(8676002)(6862004)(66946007)(83380400001)(6506007)(6512007)(2906002)(5660300002)(38070700005)(122000001)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q2t0WjBIWkJrKzlxQ3JydE9RUk1OWm5BZFlkN01IbEtiUDJ5SXBiVC9aeTIv?=
 =?utf-8?B?eXBYZG9EN210ZVpqS2Y0MjQ4Qjl3WFk5YW9ZNjVQdWNrcGNDT2ROVkZOUm1H?=
 =?utf-8?B?WHZZMjRRcWZMeGt0TU9VRjhqVjFqYnNNdjc4ZDBZUU42eXAxc25pODVPUHNO?=
 =?utf-8?B?NnEzaHNXTlB4VUMvd21GVWtJWlRoZUZHOWZYaDNJc0Q3ZUNTaEwzeStqbmZT?=
 =?utf-8?B?VHFGMTIySjBXRW9MRUkrRmFTZm50Rml0bHo0MDBpMDZVWk1XejdKQXlHYVRv?=
 =?utf-8?B?Qm5tWlZlODNCVEpYWXNzR2Y5Z2c3azB1QmZHQ1d4dVR2UGZyd1B6akhOZm44?=
 =?utf-8?B?MnRHOVB3NlM0NERkQjE0Q0J1Y2pLQm5OK0E4TWhZL0ZHd0daZkR5bjYxYmZ4?=
 =?utf-8?B?OU1mOFZTVTd6eUlLaEZWaVh1ZHRjNUtvYnJERGhzQ2ozR0ZBdHcrbVRWU05s?=
 =?utf-8?B?UHVwaE42RXdoVlRoOUt1ZzdYbmZEWG84OWRpc3JsbG5MUlZUdEFRQ0cxRm5K?=
 =?utf-8?B?cmgyRkNHanpMNlFtcmxkQTdmM1hUZzBDVnJyNFNLekJrb0JrTnRqOHYvTGd2?=
 =?utf-8?B?NWNRRkl2WmZ5a3NCNHBsNXhJNlRMTnh0eUdnTFJxdjFISHZtVTBJQ2FmeHM0?=
 =?utf-8?B?VWlYUkgwNW1TRjRuQkg1d3Vsc3lUM2hkaU1haUxrNEdxWGg2dllkSkJoeGE3?=
 =?utf-8?B?emRpaHFqaVcyaXRZeXdOeDlFeUszWWF3OXpTeVJIQ3ozNmpVQ0gyc3hOUXFZ?=
 =?utf-8?B?ekxoSmZOTU1LS2lscUdCcEltNnFRV09RcGpkZTZrWlQ2bVpyd1lWdUdGZEMy?=
 =?utf-8?B?bHplSVFaamMzZnAyY2NvZDJWbEsybWY0elZGeFB2ajV5azd0bEhHQmNTUGhE?=
 =?utf-8?B?WUcwejFsaG5QSlNYRjlYZ1RXZXRCUXVSRVo4cG5ZTWd1aThyMkYzaTBRM2Rh?=
 =?utf-8?B?dzBuM1c0QmhTQ0VrWkhHSGh6Y1ZGS2p3RkhLUTZYY3hxT0xmeElWdmYyUTBw?=
 =?utf-8?B?RmFOOXBxeDRZakdKY0pnSDJReXY1SG5DdUJmVjAxVFZUUHVyUEVqSDE1OTI5?=
 =?utf-8?B?V0psV2JoVFA2cU9QZldqd0cvNUxsd2dMVVd0L2lOTkUrK1JHS2pzSUZZaDdu?=
 =?utf-8?B?bjB1UlV6Y3FHQnRsdFM1cHZLOUlkSVk1Und5M3NEL2VJbjAyTVQ2Z3J2NzAz?=
 =?utf-8?B?aG1JRTVyWFZpbGhDVmxhNWZzeFVQS29Qb2JSbFFFcUVqRzFIZnFYemtlM2dk?=
 =?utf-8?B?RWljTXNnVkMxaFZGR0VwOEdyUEFoTjFtNDNhYW5kRTFLWEM3MDRONGFHOHpy?=
 =?utf-8?B?bk85M0tJSUNrMUJ4UlI3U2dYc2pmRlVmT2YrOHd6MlVFTnNHK0xHd0kvdkdD?=
 =?utf-8?B?UHhySVdFMG0zVUMwYWVYOEd3STk0U1VDVHV3VE1YSkRtTUM1Vlh3T1h4UXVE?=
 =?utf-8?B?azJFVk5zdm5aU2FWVjVBWWh2QS8vZnVBWDBYWkhSdEEvc0tLMmc4TjhLREJL?=
 =?utf-8?B?bm1Yc3FacG9MS0xuNnliZm15bXphYWhDWkZPOVc1WjNTbEFOcHlONlpwYUty?=
 =?utf-8?B?SzlrU0tMWGpoYTNnWVNNZUsxRjlHQ2R3SnI2N2xxQVpCY0V6YUlTeU1FS1JJ?=
 =?utf-8?B?OWliVktCTEl6a3g1NDVuYUNYaDVCV1JncVBlWWZLSEhUTGRUckFWNjEvSGZy?=
 =?utf-8?B?amNWWFdtd3FjTnBaR1ZEK2p2dVAxbWg2bU42bEV3L3F5dmVTTUlkK1V2SHlP?=
 =?utf-8?B?V2hCRS8zSS9pUHo5TXpiT2FoMG80UXB0MjZRT2x0cTExV1dmTVUyUEQxZzZq?=
 =?utf-8?B?QTBKMEFObERpT2xROEFKMy85K3JmK21wMUVIWFB2NWRQbG9CR1hhMjB6VXZk?=
 =?utf-8?B?ZDBQN0wrWDFxM0tJeXBiNUpvYjJLTzNGZjc0T1BRYXVlM3F0Z1FEeHU5dk8v?=
 =?utf-8?B?Q0tNcThUVldXRkNBdUo2NjJVcEpnYS9qcmFUTjJFaHlyNHpNQ291amdxQlBw?=
 =?utf-8?B?RmJtNDFuM1N3VjJZT1pKMWszZ2FuT1J5V3pDeEtPYWpaV2FMNDlCbkRpV0du?=
 =?utf-8?B?ZEpQeldQK2RuZ1lueGxZaXpMbk1IMVMrOTRERTZkdTRJcEdQSkNDZ0N3S3Zx?=
 =?utf-8?B?T1JxSkNCeW9tMmFYWEU1VUI5Y285Y1NuSkhwZXd5ZDBrNHpQTXJkSVB6WlRR?=
 =?utf-8?B?c2VPVHpBQWhaQWdWYUQ3TmdWZjUvdUllQmQzL3RGMTY1OENJNkt5Snpwcmpz?=
 =?utf-8?B?ck8wdXFYY0xQZXJzeTZYc2plZ04xNDF0SkJmS3Y2NmZTZWVBMHplZ0RaN0Fo?=
 =?utf-8?B?OEJ2ckdkV2NoKzRyVm1HYVJWNUxvY29TUzBxWGsyK1pKUWxzSVROQT09?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-uUlL9OzGyMEhyAQEl215"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9067.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba8b8b73-cd1d-48fa-4acb-08da1c9f9285
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2022 16:14:50.8527
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /HpG6WAG9Qdo9kvcMtsKWsgNJJ5RKIvEd6Spwxgb4bX1cslYc6/1l44vnk3NxlKvzoIwO7YRdeYcoKj4asxo0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5810

--=-uUlL9OzGyMEhyAQEl215
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2022-04-12 at 16:11 +0000, Dario Faggioli wrote:
> On Tue, 2022-04-12 at 15:48 +0000, Dario Faggioli wrote:
> > On Fri, 2022-04-08 at 14:36 +0200, Jan Beulich wrote:
> >=20
> >=20
> > And while doing that, I think we should consolidate touching the
> > affinity only there, avoiding altering it twice. After all, we
> > already
> > know how it should look like, so let's go for it.
> >=20
> > I'll send a patch to that effect, to show what I mean with this.=20
> >=20
> Here it is.
>=20
And here's Jan's patch, ported on top of it.

As for the one before, let me know what you think.
---
From: Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH 2/2] (Kind of) rebase of "x86: make "dom0_nodes=3D" work wi=
th credit2"

i.e., Jan's patch, on top of the commit that unifies the affinity
handling for dom0 vCPUs.

Although not technically necessary any longer, for fixing the issue
at hand, I think it still makes sense to have it in the code.

Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
---
* Changelog is so much RFC that is not even a changelog... Jan, if we go
  ahead with this approach, let me know how you prefer to handle the
  authorship, the S-o-b, etc, of this patch.

  I believe it should be From: you, with my S-o-b added after yours, but
  I'm fine being the author, if you don't want to.
---
 xen/common/sched/core.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index dc2ed890e0..e11acd7b88 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -3416,6 +3416,7 @@ void wait(void)
 void __init sched_setup_dom0_vcpus(struct domain *d)
 {
     unsigned int i;
+    struct sched_unit *unit;
=20
     for ( i =3D 1; i < d->max_vcpus; i++ )
         vcpu_create(d, i);
@@ -3423,11 +3424,20 @@ void __init sched_setup_dom0_vcpus(struct domain *d=
)
     /*
      * sched_vcpu_init(), called by vcpu_create(), will setup the hard and
      * soft affinity of all the vCPUs, by calling sched_set_affinity() on =
each
-     * one of them. We can now make sure that the domain's node affinity i=
s
-     * also updated accordingly, and we can do that here, once and for all
-     * (which is more efficient than calling domain_update_node_affinity()
-     * on all the vCPUs).
+     * one of them. What's remaining for us to do here is:
+     * - make sure that the vCPUs are actually migrated to suitable CPUs
+     * - update the domain's node affinity (and we can do that here, once =
and
+     *   for all, as it's more efficient than calling domain_update_node_a=
ffinity()
+     *   on all the vCPUs).
      */
+    for_each_sched_unit ( d, unit )
+    {
+	spinlock_t *lock =3D unit_schedule_lock_irq(unit);
+        sched_unit_migrate_start(unit);
+        unit_schedule_unlock_irq(lock, unit);
+        sched_unit_migrate_finish(unit);
+    }
+
     domain_update_node_affinity(d);
 }
 #endif
--=20
2.35.1
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-uUlL9OzGyMEhyAQEl215
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmJVpXoACgkQFkJ4iaW4
c+4ZSw/+JH8ZtZN+e0Fc8Wb8upIBWThFSmfTbgrYKuQdAhDCAuPZz114lNxGVzNY
B+4y7ZHqsNk0ZjChcLbr2x6RUcu6NooQt32JKmr4kBpaGdclb1E/T/bYVW3Hhkd0
/OPJEGLuqPxQ4sVZqK0VEkASketFhfP+UFn65Y1KeLsRub63n4QpWaEojr19X2Dg
kgGJlwl8+w6C7Qeu8W5oBUu3xh7kJ9lVobtZ9YkPflOcUQBnZjpM7xENoO8qTVxK
HM5erz0WkiOSjPMcXI6h65GnHAubg6EiUpZ4lpDwesIkCnT3yCG9lWrBcAvpO+S1
ik3iUxFGpdLEx5YEg7pUSAALulEiudXIL3cDdJFX81nQ+b9IggCfVGYfGIJ/+L+w
Np5bnY3Hkmw7ALxvdsWTH18Zpey66yXlZrm+GtEv6m1Z6Nd1FPIlvPXJz1Z6pVII
hLLCRQBVLJ5OcGD7msyBz2Ej8a8rpFyEDM69KdS1eO7yd768Ty0etXEjNEfTYFvy
UtOgqL3T1SxnVwUhiDi3sRFm7ETXeyM1t6X9vTGeM/tiqVPnUytRR/asPiFIU+TX
pwmZVM5LiFaI6oD5CrSO0aMaNbmvoYREN6SqsMh9nDrwIs3jXAm9MhZqMmlzVWKg
kPILtfzk01di+Xie30xantNawHh16XL5gge2XsmdKo6bnoQcZL0=
=wtkS
-----END PGP SIGNATURE-----

--=-uUlL9OzGyMEhyAQEl215--


