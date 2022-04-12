Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 612574FE595
	for <lists+xen-devel@lfdr.de>; Tue, 12 Apr 2022 18:12:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303724.518159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neJ7R-0004kR-GM; Tue, 12 Apr 2022 16:11:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303724.518159; Tue, 12 Apr 2022 16:11:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neJ7R-0004i4-DA; Tue, 12 Apr 2022 16:11:53 +0000
Received: by outflank-mailman (input) for mailman id 303724;
 Tue, 12 Apr 2022 16:11:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vUK/=UW=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1neJ7Q-0004hy-HI
 for xen-devel@lists.xenproject.org; Tue, 12 Apr 2022 16:11:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 430b29b7-ba7b-11ec-8fbc-03012f2f19d4;
 Tue, 12 Apr 2022 18:11:51 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-a_Y94KaaPUyL243ah4gZ6Q-1; Tue, 12 Apr 2022 18:11:49 +0200
Received: from DU2PR04MB9067.eurprd04.prod.outlook.com (2603:10a6:10:2f2::10)
 by DB8PR04MB5817.eurprd04.prod.outlook.com (2603:10a6:10:a3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.30; Tue, 12 Apr
 2022 16:11:47 +0000
Received: from DU2PR04MB9067.eurprd04.prod.outlook.com
 ([fe80::249d:2d32:4f2a:f748]) by DU2PR04MB9067.eurprd04.prod.outlook.com
 ([fe80::249d:2d32:4f2a:f748%6]) with mapi id 15.20.5144.030; Tue, 12 Apr 2022
 16:11:47 +0000
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
X-Inumbo-ID: 430b29b7-ba7b-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649779910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ngNkXe9ZAZvV8eAIl13VX/nZiyJuRCXIKxcAeBaVggg=;
	b=BVSbP/0cebO80XALAwK+S07A/Rnk9sdKqoCs/A1pN7ABEf9D26AdBVSGyhf/ay4dyZMn2j
	LxGaqtuCzKrPfdUBXCJf9QpQRB9r5sumdotQPkloSHYNhNKqR/5G9Q0AO2+cAgoFg0HL8G
	3EnFoVdPJ54lpwkDhnXlejfZlx6jMIQ=
X-MC-Unique: a_Y94KaaPUyL243ah4gZ6Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OxqVN3+phbfgp1ydfnyTnoThUh6eWkiTfKLvhlWCw7SiMAxlGm4u90mQL/QUkU1pGlHGiGF3rgG07I3UxvPTBDk7WsULPBZIkpdEtqvjlagloq8jWCT7DuvQtGpb+Lm931x2dzElo8tBcQ4528+ZQujhWy8+nppKh6MsZ2mhQT1xDBVKWggl/9mdCn68Ic4OBVwp27aEe2Ayz2ODYTFfWUKxFMFDZlZqOPc6lA2GlSe5lO9HOUjQxQbKdlt1Ji/B+333nOuERtXb+Xc9mPFVJihYnrvt545mriMbYXb1o65BztadGmqEFTq0iyipSd0kUViAXPESMchVa8yghKZnKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ngNkXe9ZAZvV8eAIl13VX/nZiyJuRCXIKxcAeBaVggg=;
 b=dbcv0DwvLUFiqrcYG8kAjkORMY2cnF0esZQNBRnV8aUWgtES0RfHYA/IBCLWl2AqnULPBe4ffbfx2lrTa4kOsdez5Vt6wHYyLkw8Vh8xtqpkA8Nd42lNy2crag8oRvSp1oDa7IyjTizOzW2r4VEmNAiOgisXISDhDnpqHgby1f4lIVy7vKSeeOPJ+FqrxgSsjGDbjOVQdzThO884WED/JaDcNopS4ue+Zk/nu8prv1Y5e8cF7j/CyV3rTx/YfohTcC229sz/FWvS02e77U5YSdXImLSgpp2aFSby6b9zt72TRQzPdmTySu8tSJrD7rdE+GSGvJkKz+n9o9Q9crVQ8g==
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
Thread-Index: AQHYSoM0M4Zi9SzqTkOjTOtQV+PP7azl4C2AgAAVUwCABn7lAIAABpgA
Date: Tue, 12 Apr 2022 16:11:47 +0000
Message-ID: <e061a647cd77a36834e2085a96a07caa785c5066.camel@suse.com>
References: <1617b87a-640f-d235-701d-df2c57314b73@suse.com>
	 <2d56bb1015a263b6d1b196050d088b84c320b808.camel@suse.com>
	 <b41009b4-fea4-826f-f36f-7dd9f4edd1bb@suse.com>
	 <30ac2ce8cca7217775eaa704aab45a62deb1272e.camel@suse.com>
In-Reply-To: <30ac2ce8cca7217775eaa704aab45a62deb1272e.camel@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.0 (by Flathub.org)) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b89f8c8-b379-4f60-725c-08da1c9f24f1
x-ms-traffictypediagnostic: DB8PR04MB5817:EE_
x-microsoft-antispam-prvs:
 <DB8PR04MB58178FFF95188D127AF15A1CC5ED9@DB8PR04MB5817.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 lYIehLY5fSKDylWzt1y05J9CdHVApFKVx6VPMoApYuuEqZ5xucpE/K7SdGCEVXvUkCtdDm6j2YH6aTS5oG3XzZleEsUei3ewRLH7tlJpUunrXQLvp/N9L3BD0g2eWLaQETxx48O0HaM/DY3Nz49DKI7+IgzhlOR+p3Bv2mxAqb11pZb2rwMmOwlAlEK5CAgUdNPdsLNSgrz+X/3blHeP/H6yflvNaTgPM363pZQ5YKGn/Lk1Hyed0+yWq4FH+hZqr4jJN/TADnpaZcdoVYl6w1bd/TL3IDaHjPaHJMK3gWPYn5g7yI55sGs4achw7t0lcBC9i5yd5lLor+uAFq0c1t5HRm0vbDdmIQhFHqVEZssZhuMyKyDhsI3iGb8MOoRX2K7Bhd/m6aHZuyflSoRTnm98BVG85X2uUW4Vsp5LmZCMsCExqlpOioAxAk4oA3p/mvyQfx8L+3nP9Sj2QkVwQtnyuSYZH3VMdUt2vLEaL8/kBo1s7mDnRoPOjeV9NyuAXqycm32fdleEgy/d8nnJOF9N8bMU3YitEHj27is4yevOk+0ZUms8ZEj35+nFht7feJIAC4Q7n6P5KuNCAVeJWtMoAc3yGHV603SrG4/P2p37eiwqqrCfH+8PYGMVBL6BXTGzDJKs8YB8e36WfLVf/HhBl+D49HtSGPezuzCG47CuUhufHmyim1c/CUX3mHfT1G+Xi1XKGTnqiAl7+Mv0qmQa+cy9OqzwHoqv5Noq0zXXYjGErJlQdAXv+j/zVOTHyuIRwo9lLLeroOZnfCZwZ174r0ZrAGjbZ8TFhCbC9hLIeEWhs972VR2iphjeNA0Um1a4NXW3vWpT5DK0DvSimQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9067.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(37006003)(54906003)(6636002)(6512007)(316002)(36756003)(508600001)(186003)(38100700002)(122000001)(26005)(38070700005)(2616005)(83380400001)(6506007)(8936002)(4326008)(6862004)(8676002)(64756008)(66476007)(66446008)(66556008)(76116006)(99936003)(5660300002)(66946007)(91956017)(86362001)(71200400001)(966005)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dUlGUURFY28zSzhERUFVMWNzUElFN25VcTREK0g4Rk0vQTRhVVJqTzUwV1Js?=
 =?utf-8?B?RVk4R3U2ck5nZDROV1JmTUlxVVlxZmk4Umc3bk5IUERSMW1CR2VVWm1QeDZU?=
 =?utf-8?B?dDA3TFJ3N3NVZ05zOHErK2EzSENTcmxINExUbEg5YXdRNldoNEdwU2xlcG1U?=
 =?utf-8?B?WWhLemJieFIzZllGWi9lVWw1VFc5NlRxN1hnbXNNZVdKRUNVQ3cxUVdIajlN?=
 =?utf-8?B?bTF2U1hUZ1h4RXI3d0RZdmJCa0VNbnJJUWtNazNUUENEdW5qZVpzRjVGVTMw?=
 =?utf-8?B?WFdncUNvN2ZnaTdNTytKTWNwbDlkc1IvTW5qZTlTK0d4bEs5MlFLWU1YeWJ4?=
 =?utf-8?B?WnVWK2R2OXBCc1MrNjN3eUZSV0plMktXZEdwWW52aWNYUDBJcFMrZkNEZEpT?=
 =?utf-8?B?ZENtQ3pnc0Z4cVRoOWd6WFRMVTVaMVVsQll0QmdsK2pzbDZJc0IzMWU3RFVQ?=
 =?utf-8?B?Rk8yNWNkTkEyZGN2aml6YWYxL0tOajREWnkrTE8rWU9CR0ZVWVFoUUc0Tnla?=
 =?utf-8?B?NnI2cG1xWVJNSk1lSTBvNlhrVkY2SmR1N1VLcFhzYTVaT2lLR2U2Um1UM05r?=
 =?utf-8?B?aHVmWTI0V3FBTkp0R0RkMGR3eU9kcVJZdS9mMHA5dmVRSng3cHpGZjQyVFVY?=
 =?utf-8?B?akxaZ3FXYVV5RGROMVlWU3RMWkc4ZDlWYXcrTVd4czc0cmZ5YTFTd0tMdm03?=
 =?utf-8?B?ZXcvODhaUzZHQU13ME9hOGVZdHNNTlhWQWlSWlo3ano1M1ZQNkUvS25EZFJV?=
 =?utf-8?B?Nks0VGwrUmtRQ3pqRkdDVXJ6ZU56eDhoVzUrK1p3cnpyK1A2akFTK3FZdElu?=
 =?utf-8?B?YlNRbFFQS0RIQ3dJUDE3c3pyTHVQNzNBSXNBTUg0RER5QXgrcUhEMUxabHYy?=
 =?utf-8?B?SGRhYXhPdUFkcC81eTJjZ3owTzFvbzE2ajlTT3BpRkFQQnNHQUtlTXRjOHhj?=
 =?utf-8?B?TDJHcmJ5SkpuU0JqeGJaM1JkLzJtTDU2S3pJelkxSjFHU0pQR2kzM1dDTkdU?=
 =?utf-8?B?ak5xL0tzQmVmaVpUc2dsVjRFYTRpZWhGOE1FaTJvbVFwUmFOYmJ5NlBReWJz?=
 =?utf-8?B?Z3EvN3RnQkhXVDI5NUFJbExkbzB2d2lzaTlIenE3UUUxZ09NR2xaSmJyUkg3?=
 =?utf-8?B?cGtkQTRybWFjd3I4QlEyOUc0SHFUbkNJNUwrcU9DK1cxSzlVYmMyRWoxdDZL?=
 =?utf-8?B?VnEyVGRYVUpJN01mWUoycVdubDlWQkhjQjhsTEg1em5hdFh4czJjU3dKVDRE?=
 =?utf-8?B?Nkd5dDlaejZ3Rno4V0pxV3owMlBaeExISjZTQlBGVnNRK0hweWVreGZCUGxI?=
 =?utf-8?B?OWhFeDYzWU1iWDF5Q2FDc1FDekdQaHd4bHRlS2FBenVSeENsZmNZR2s1RFhQ?=
 =?utf-8?B?VlhYNWY0RStKdnh2ejNka21zNkFPekh0QS9Zdzd4ZldKMHNtUmZJWisxSEo0?=
 =?utf-8?B?TUpob0Q5U2NWVlRWTlA4NVJrYm1DUUpYVm4ybHRKSkRnZVA2T0JEQ3FBTTM1?=
 =?utf-8?B?L0VaM3NRNnZ5cVFkVnR2OUc2UFJiMTVvc09RTnRwS2VIZHhUR0kxTFRLam51?=
 =?utf-8?B?cXgrNkpaV2cySExIZWtpbVRaOWE2OVdYZGpGSXJTRHlleUFndnNSOUE4MWwv?=
 =?utf-8?B?NzNEMTdZazVkbm9tV0FuUEFnYTFMdGhpb1VVSDMvTERUMHNwcjNiRHJaa3Y2?=
 =?utf-8?B?MVhZeDk1bTQwMnRLU1B3a0tlUVo4bU40MEJ1dUNrS0ptc1l1cEE2MWJYeTJP?=
 =?utf-8?B?Q2p1aFRIT0dWWFhJQUE3Qzg5aTNyZkRscEZLR3puSkg4b3hkdXpHOG0yMndZ?=
 =?utf-8?B?TzU4aWw5WVVob1JGTXRxb29lVjEvTTBtU2JvMkRRWCtHTjRrbVpUZGU2ZEo4?=
 =?utf-8?B?Q1ZucE5sbmU4K0YzaFRJbjg5TmlrUEdKM091ZEhHTEZaaDM3V0M5VWszODda?=
 =?utf-8?B?Nm5tWWMwTks3REY0bkswdXhwMnBwU29sMnE5Q083SHFmczVwK29CeGwyWWY3?=
 =?utf-8?B?SFBVeTVsTzYvUnVLamU4L2dQNThKYitmSW01aHJVejNqbzNiSFBqR3YrQjJQ?=
 =?utf-8?B?Z3pjNmg5S3lHS3UwTmpTR1o3Q204NytVRVd5MTN1MWVLa2c5eWlDOG02Qmoy?=
 =?utf-8?B?ZVhmeVEzcG9PWmdXaW9IbzJZS3VseHZGQUdXbGkxYVE2SUF1ZFR4QkJwclFr?=
 =?utf-8?B?R3hIWEl6Q1FaUzNLcWRIQ1llYWc4SUMreUFVMHNMRTdPMFlKZWp1WGVpSGlI?=
 =?utf-8?B?dEFxSTFNOVFscnNTRk5EUWVURTJPMFpUUnpyUUVkVURqYmdPWDk0OU9QV0U3?=
 =?utf-8?B?TVRFaDBaYlpFZnlWWVo2d1BNNlhXZ05oblMvdnZNbzg1MXhKdXkxdz09?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-B2+MTmvZU1CvTA2Hu5uY"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9067.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b89f8c8-b379-4f60-725c-08da1c9f24f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2022 16:11:47.0433
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BqqkCHLH6IfUzNlx6t8UVIZ63LFLxhuyi0/sCm2I4VHA16nU+h8YQMvqzJru2Zne+hJnzg5X9FLWYAzfrKqMJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5817

--=-B2+MTmvZU1CvTA2Hu5uY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2022-04-12 at 15:48 +0000, Dario Faggioli wrote:
> On Fri, 2022-04-08 at 14:36 +0200, Jan Beulich wrote:
>=20
>=20
> And while doing that, I think we should consolidate touching the
> affinity only there, avoiding altering it twice. After all, we
> already
> know how it should look like, so let's go for it.
>=20
> I'll send a patch to that effect, to show what I mean with this.=20
>=20
Here it is.

It's tested, with a few combinations of dom0_nodes and dom0_vcpus_pin
being there or not, and it survived (and behave as I would expect it
too) all of them :-)

I haven't tested yet (and can't test easily) the pv_shim case. I think
it's fine, but I'm adding Roger, to see if he can confirm that...
---
From: Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH 1/2] xen/sched: setup dom0 vCPUs affinity only once

Right now, affinity for dom0 vCPUs is setup in two steps. This is a
problem as, at least in Credit2, unit_insert() sees and uses the
"intermediate" affinity, and place the vCPUs on CPUs where they cannot
be run, resulting in the boot to hang, if the "dom0_nodes" parameter
is used.

Fix this by setting up the affinity properly once and for all, in
sched_init_vcpu(), called by create_vcpu().

Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
---
* Changelog is RFC!
---
 xen/common/sched/core.c    | 59 +++++++++++++++++++++++++-------------
 xen/common/sched/credit2.c |  8 ++++--
 2 files changed, 44 insertions(+), 23 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 19ab678181..dc2ed890e0 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -572,11 +572,41 @@ int sched_init_vcpu(struct vcpu *v)
     }
=20
     /*
-     * Initialize affinity settings. The idler, and potentially
-     * domain-0 VCPUs, are pinned onto their respective physical CPUs.
+     * Initialize affinity settings. By doing this before the unit is
+     * inserted in the scheduler runqueues (by the call to sched_insert_un=
it(),
+     * at the end of the function, we are sure that it will be put on an
+     * appropriate CPU.
      */
-    if ( is_idle_domain(d) || (is_hardware_domain(d) && opt_dom0_vcpus_pin=
) )
+    if ( pv_shim && v->vcpu_id =3D=3D 0 )
+    {
+        /*
+         * PV-shim: vcpus are pinned 1:1. Initially only 1 cpu is online,
+         * others will be dealt with when onlining them. This avoids pinni=
ng
+         * a vcpu to a not yet online cpu here.
+         */
+        sched_set_affinity(unit, cpumask_of(0), cpumask_of(0));
+    }
+    else if ( is_idle_domain(d) || (is_hardware_domain(d) && opt_dom0_vcpu=
s_pin) )
+    {
+        /*
+         * The idler, and potentially domain-0 VCPUs, are pinned onto thei=
r
+         * respective physical CPUs.
+         */
         sched_set_affinity(unit, cpumask_of(processor), &cpumask_all);
+    }
+    else if ( is_hardware_domain(d) )
+    {
+        /*
+         * In absence of dom0_vcpus_pin, the hard and soft affinity of
+         * domain-0 is controlled by the dom0_nodes parameter. At this poi=
nt
+         * it has been parsed and decoded, and we have the result of that
+         * in the dom0_cpus mask.
+         */
+        if ( !dom0_affinity_relaxed )
+            sched_set_affinity(unit, &dom0_cpus, &cpumask_all);
+        else
+            sched_set_affinity(unit, &cpumask_all, &dom0_cpus);
+    }
     else
         sched_set_affinity(unit, &cpumask_all, &cpumask_all);
=20
@@ -3386,29 +3416,18 @@ void wait(void)
 void __init sched_setup_dom0_vcpus(struct domain *d)
 {
     unsigned int i;
-    struct sched_unit *unit;
=20
     for ( i =3D 1; i < d->max_vcpus; i++ )
         vcpu_create(d, i);
=20
     /*
-     * PV-shim: vcpus are pinned 1:1.
-     * Initially only 1 cpu is online, others will be dealt with when
-     * onlining them. This avoids pinning a vcpu to a not yet online cpu h=
ere.
+     * sched_vcpu_init(), called by vcpu_create(), will setup the hard and
+     * soft affinity of all the vCPUs, by calling sched_set_affinity() on =
each
+     * one of them. We can now make sure that the domain's node affinity i=
s
+     * also updated accordingly, and we can do that here, once and for all
+     * (which is more efficient than calling domain_update_node_affinity()
+     * on all the vCPUs).
      */
-    if ( pv_shim )
-        sched_set_affinity(d->vcpu[0]->sched_unit,
-                           cpumask_of(0), cpumask_of(0));
-    else
-    {
-        for_each_sched_unit ( d, unit )
-        {
-            if ( !opt_dom0_vcpus_pin && !dom0_affinity_relaxed )
-                sched_set_affinity(unit, &dom0_cpus, NULL);
-            sched_set_affinity(unit, NULL, &dom0_cpus);
-        }
-    }
-
     domain_update_node_affinity(d);
 }
 #endif
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 0e3f89e537..ac5f8b8820 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -749,10 +749,12 @@ static int get_fallback_cpu(struct csched2_unit *svc)
=20
         /*
          * This is cases 2 or 4 (depending on bs): v->processor isn't ther=
e
-         * any longer, check if we at least can stay in our current runq.
+         * any longer, check if we at least can stay in our current runq,
+	 * if we have any (e.g., we don't yet, if we get here when a unit
+	 * is inserted for the very first time).
          */
-        if ( likely(cpumask_intersects(cpumask_scratch_cpu(cpu),
-                                       &svc->rqd->active)) )
+        if ( likely(svc->rqd && cpumask_intersects(cpumask_scratch_cpu(cpu=
),
+                                                   &svc->rqd->active)) )
         {
             cpumask_and(cpumask_scratch_cpu(cpu), cpumask_scratch_cpu(cpu)=
,
                         &svc->rqd->active);
--=20
2.35.1
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-B2+MTmvZU1CvTA2Hu5uY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmJVpMIACgkQFkJ4iaW4
c+7jqxAAmHr6nXFy1JoGLBFR1v5eoU3mk5Sp8A9lSat1Wjn2AVykse4W7VabJjKL
cdFA26FNzjw4v2CqTDxrhcIMFhNYrDkrCsp+hqUH5E8hM8tZ+iDkeARVVzxqw5BO
lX8GzAi/sZ56R4YBRRkGByrUrgxljgqlVZFLvUWUjTMUxgvCCSOXyO/PRKXMlTa4
LetP125vZhemFbd31QduxLi17e/fqdAiABJniLgL5Fccn+wkmMgd82Wz7HNS/MzE
e1zT4T+zCcZKcVGqhVwmZWQPhYkT0Ym7DbKZMUOWUWkS86DzmVeX9eLeYkxKkkvT
O5HNldYNkcFL15s3CQoOg/h38BvZjEeOUKEa5P14ZqFMXztp7OoMpZXzOsLyl9wP
HxzICXoEYI/6eaqsBHwKMAeug6y/6EvGunC7qQ54YvsYq0UOPsS2uBy+v0vuS08A
GG8/okYkUTr9UobcXa5PqaAvP4xJek78zzNZm7YvfOgCQf4wErsyHyMxFIzaIPgU
JJoH67JnaBRCV767laGfJBTXDDV4z/Evff5ZOrQBBY+E2I/irnhLbiygTo/3fXRV
CkBnYT6nEfEJprdQJ1PPnl7kPj6QSTzsRcQR6jFajVWGpwQJoxY2Jmh6AgoOgp9f
YRs5Mhgf7nCM8A1Su1PmpOb+z9pPM1ttXNF1HPgzrDoqwrfZrWw=
=wJk6
-----END PGP SIGNATURE-----

--=-B2+MTmvZU1CvTA2Hu5uY--


