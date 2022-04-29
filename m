Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AC851478C
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 12:52:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317202.536431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkOEX-00076g-Dp; Fri, 29 Apr 2022 10:52:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317202.536431; Fri, 29 Apr 2022 10:52:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkOEX-00073z-AD; Fri, 29 Apr 2022 10:52:21 +0000
Received: by outflank-mailman (input) for mailman id 317202;
 Fri, 29 Apr 2022 10:52:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7mBs=VH=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1nkOEV-00073t-Vs
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 10:52:20 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 701e2f59-c7aa-11ec-a405-831a346695d4;
 Fri, 29 Apr 2022 12:52:18 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-JBLqOkFDPHe_OhB-Dr5bFg-1; Fri, 29 Apr 2022 12:52:16 +0200
Received: from DU2PR04MB9067.eurprd04.prod.outlook.com (2603:10a6:10:2f2::10)
 by PA4PR04MB8032.eurprd04.prod.outlook.com (2603:10a6:102:ba::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Fri, 29 Apr
 2022 10:52:14 +0000
Received: from DU2PR04MB9067.eurprd04.prod.outlook.com
 ([fe80::249d:2d32:4f2a:f748]) by DU2PR04MB9067.eurprd04.prod.outlook.com
 ([fe80::249d:2d32:4f2a:f748%8]) with mapi id 15.20.5186.021; Fri, 29 Apr 2022
 10:52:14 +0000
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
X-Inumbo-ID: 701e2f59-c7aa-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651229538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EJ7dwpD3/yQ/oMxzERgbv1XefYeW7lPcwO5gGHqHWK8=;
	b=ArRPkJUsRAZqJgm5qx+PHaMeMGt41htCUle977QD8M/l/VapWcMnmAhHYwIia+lfdmYV94
	w1lPV7QGBPpnqTgo1BZXWurpBLSEG7nMi+6hEewz4oayI1x/hnKNrbMssZQLyQwbjodqjr
	lwxk4zUJ3jzzpo0EAzkWWcp0whnUi7Y=
X-MC-Unique: JBLqOkFDPHe_OhB-Dr5bFg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O25d6xmlJpDCQyrLLhWn+2NHC70wNqoTC8TE9tgUVF/3iqYxf2ehFbsdqzFFIdoEQV0ceewsLl5YaimV72bsi1DIicdueHkq46b8GjHuvyFOQg0JV6GpKHLMHlUJhIEhbU+AJLFJy93F3CF6ueCs55Wc9FXhzgz7783WHdUUcNGfXDm64n7auHGLeawYyBixVwRSWkDLuzY1autuP69byD7xo9uA54oBZp4LB4cLb54Bmjx4NEY2PpjYSFRP7MI9LBT5ESJC6Dlt7Vd6wBjsc+pVboaFvhD99kl4pA8ywwb7Pf2uab5O+mliKgfzKpWRiZTZ2WHpvVpryv/6Ry/rTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJ7dwpD3/yQ/oMxzERgbv1XefYeW7lPcwO5gGHqHWK8=;
 b=TgWydtpD2PDMyk4Z/m24l54/2dU/m7fBA8a6xKyyF14QCkWzsLfHHs0FXc2aNkD3wX3JzpMlVjw3TUvJaR2Pr4w0w3LR/Yfk1WCZ4hFpCyMvqVpWXj0oRBhnX/xkUHb5SAjv2Z9NR55E9nr5UuTPh+IaJwsjarkn8j/n6tpxJ4T6AA86EIk/HXPASPh1YcMRDFLBi92RYUou66w8NsCXr3uMvvPGTcJ4jHICp5DAomAWfmmA3LRwE3iiha6yosf+TQqS6wiDKZFPtshgnNq5wcnKiXaw0TOEvmbZk2A6CdK4G73SZARTykczuIyvmX/VGfTt6oqJnqf5Pl3lVLeFtg==
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
 AQHYSoM0M4Zi9SzqTkOjTOtQV+PP7azl4C2AgAAVUwCABn7lAIAABpgAgAEqhACAGTPWgA==
Date: Fri, 29 Apr 2022 10:52:14 +0000
Message-ID: <fd07c28fad352a476544258f2ac4d652062b2701.camel@suse.com>
References: <1617b87a-640f-d235-701d-df2c57314b73@suse.com>
	 <2d56bb1015a263b6d1b196050d088b84c320b808.camel@suse.com>
	 <b41009b4-fea4-826f-f36f-7dd9f4edd1bb@suse.com>
	 <30ac2ce8cca7217775eaa704aab45a62deb1272e.camel@suse.com>
	 <e061a647cd77a36834e2085a96a07caa785c5066.camel@suse.com>
	 <35599105-b441-96cf-7537-ccf9dfac0934@suse.com>
In-Reply-To: <35599105-b441-96cf-7537-ccf9dfac0934@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.1 (by Flathub.org)) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf87798d-a086-49f2-b6f2-08da29ce5225
x-ms-traffictypediagnostic: PA4PR04MB8032:EE_
x-microsoft-antispam-prvs:
 <PA4PR04MB80323E5A596D65943CCDD400C5FC9@PA4PR04MB8032.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 oRemdF/KbmHIFXyjCv78gVTvErWds81p/xNFsA2bgvHiJ+pbStZCqkmgjwEkVRfOZnb7JkQ1uehcljpoZGDb4/t381XWy1EeZ7kA5FUZNJelLkYSCHmowx3+2V9Ji+klcpv+s+OMJGGCFo5soLpbSjbpMLQFdr12rk/yxDjGLv+qNnsPlMqq02J3bjppZfH5YkEet02iMrCRecVNNbv18ni/QBIdaIMwkti+hyFxjkWkxDoQdmFRTh9KwJ1XJd2Ik2dzKf1/mwrjOa3ECH1h3zqUv8jGG/VzlmJoxtuFeeR50i8hcAS0K9ZF0bzebTmiQsgt+PjDsqB5ZT3u9XO1sCUJaYTxJwaFL+bxPHnRT3iKhuoabjbIGOKMnrRC616eN1Zt6lGirVBjGB6m80WU3ZzflVvpNZinAc3dJxhX/PoJh1QRNQZoagWHtqMB8eLuKXD8nanCU+uFdc4hsTk3eu9kg3zhW4gwDgRP6Lt2ZdxVtB/6N4zEW8EU1UxhhiaKDAu2Xv7fSiMfLO8k817QYiEISCZVfq+193rAeNengzeilOsBzbnOUamXOAYI6KSXECExRg5CVEp7R2zBmno9tXzZlFA4k/aW67N8EMacs+uuHZkK8VGE46532kMAJgWGUDcaDFrdG7IqedCDIkRI5rHadYXrh14tp/YT2kAaoSHSghw6t5Nf6EGtOfMzxqjneQKLBaZpcQkgLEGr4uqbuiee8NdevzQ4o9crvkEMvu+69kvDAxp3+R4ArTgL7zks9OPOspnjLjRIvN5O0ELepCToYz+LmLJirUhq2z3UgT4aWTT/eJUxVMBpCNIBCFWm0bvtbUUAKp45USVNSzU/TQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9067.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(8676002)(6862004)(508600001)(36756003)(316002)(64756008)(99936003)(8936002)(91956017)(54906003)(76116006)(37006003)(6636002)(186003)(38100700002)(38070700005)(86362001)(66446008)(4326008)(66476007)(66556008)(2616005)(71200400001)(6512007)(2906002)(966005)(122000001)(6486002)(83380400001)(26005)(53546011)(6506007)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VXF6cHF1Z3NUaUR2RlJKblZDTGVoTXlTcE01Zit6QWlIVWZ1NWI2dDRHWUp4?=
 =?utf-8?B?U1lHTm5NVWxXdndsZi9UVXZXbEYyaTZhbWI0L1FMZEo3TTRDVlFiOVRKck5u?=
 =?utf-8?B?ZWtsUWpZZUNpNFZXc1hHQ3BuVzF6WXpDdnB3ZDhNT0VLdTVLOUh0RmdOWDFK?=
 =?utf-8?B?RXFjWWtpSk1qdWQ5WDJCN0tBRmxFRXlEL1NwRUVPb1pOekMwRGt0akdpUVJk?=
 =?utf-8?B?MXRvRGZxQ0Vac21XRGViK0d3UVBNTkp2N09zSEltMmFCbUZhQ1ZKL3VyODR5?=
 =?utf-8?B?K0xRQVloQ1UxVnY0UWw1MHdUWkVKYjllZW9PU2tYYWpsNmZGVUZlY3FCeTJl?=
 =?utf-8?B?UVo3S2lsVTJaNVFlNm5rYnpyT3hsdFdBckVSQ1NkK096Sk45aDlCNTlrZXJH?=
 =?utf-8?B?TkcvdStBVllzS1QydnpmR1lSeE5pQUtmc1NjMmhLdmhscWRiaFVyc0FyYjFC?=
 =?utf-8?B?QWZvZGZ5dmhEL1FNcGFtZzZsY3lYcm9vNE5XenloTFBYUDBzY1h1WDFXZmFD?=
 =?utf-8?B?dmFBUzFrTU1wSjVIUUROM1hUTEJ1SzFyK3ErQTNuL3czeGVUeEhJdnE5VnFV?=
 =?utf-8?B?Z3BoL29xdnRwS3ZNaXY4ZlpEVWJ1MUpEZnVRVDF5T2M1ZmlmZ0RtVk5XcjFE?=
 =?utf-8?B?TktHUTRyUTd6NHFudGgva1JkZ0VRVHh5SElrMlFvd1pDbWVPZyt4ZE1ZS29C?=
 =?utf-8?B?OUhYWGhEQW51Snd1MnN0a3dhZnZIZ3RsbnhKU0hkTnlGTlZCWHE3S1B5VVdz?=
 =?utf-8?B?RTlhZTZSMXduS2d3b2Uzc2d0UWlqVE1pTVF5a2RSWnVKNkJMdElueXRZWGhN?=
 =?utf-8?B?bGp6ZVRuOWt2UmYvbVVHSlkySnZFbUJ3M2FHSFBoL2pOUkhmeTRtUmdNaFpn?=
 =?utf-8?B?RFZBNnhWMFV5alhkY1pJRGd1MTU1S2Zva1JWQi9KbjU0N3J5RG1RclVVUllR?=
 =?utf-8?B?UWpjYzJCT3BxcUhWKzQ5SmI3S0xERVBsQTdDK0RGU3ZpYkhlOW93dncyUTR4?=
 =?utf-8?B?YWF0dWhvSUZzWFVuSlcvaU9nNm1rQXkwdEdURGhZRmJTWER4R2hDRk5mSnh0?=
 =?utf-8?B?RFdiQW52WUpXNVdRRGJOYXZERnl2UmJqTUR3cTR4c2o2MVprOFJQb0QvVUFO?=
 =?utf-8?B?UlU3S3F0Q0dFeDNHejF6MGN5bHU0Smtmak5NS2FEbUhuTHNnQStPeFQ0azRq?=
 =?utf-8?B?cnIvOE5BcWhKdHR3Y2lTTWd3cjR0Q212WWN4NjdTQWE1QkJSRkVsUUxNSzYr?=
 =?utf-8?B?YXBHRng2TDBBRDhLcGdVVkNxc0xJRTdacWR0VGZ5Um91dDVwZGFmVUd5Q3JK?=
 =?utf-8?B?YXdiWW1kZGdaYmNOLzhjRGZoR3ZtZm0rcXdxR21LcXArWHVCaEtlSmdodmhl?=
 =?utf-8?B?SWx1V3hSc0ZoV0hkWGtienkyclFvTzQ3UmtOT0FodjBWQW9iVFZjYUtXeHZo?=
 =?utf-8?B?TmpuYUo3dnJxSlIvdkViakgrOHc3Zy9FSDFPc25GZlZyWkdMSHFjQ3FsYTZq?=
 =?utf-8?B?Y0ZCSVhtNWZCQWF4dklkYnAzWXhvTmNwKzJ1QmR3TWRjeDljREZlMmQ1WmND?=
 =?utf-8?B?c0pmNW1XMk91c3RibTE2SDJTRmNobXVrNWVXYjg2c2w5WE92bmZoK2w2WUlJ?=
 =?utf-8?B?WkM2R3FGNFRNZlBHd3JqNXR5TkNKNE9vRHlpdjdoZGhQT0VyUnNYNTZWUTJi?=
 =?utf-8?B?NWo5cFNsSzVhQkVrOEMwS2pJK3FINVJ4MkpjazlYYnR3dkUwUzE5RHlFT2hD?=
 =?utf-8?B?TEdJVHNRN2JQNXIwVnpQZEF3R2gyZEpUdmlVZS9TemtyRU5uQ1hBWUhmd3R0?=
 =?utf-8?B?ZEpSV2xIb1pSeWdsaVgxVlBXOWdrT0ZmbnpUclNWVDdDRjQ2bTROM1c1aUd2?=
 =?utf-8?B?K3Q5SVRXNE9wd3IxdVJLQllMMnRqNnVsOU43WWFmd2thZ0xNNG9Dc0U5SmtH?=
 =?utf-8?B?VGpWalo5b3l6bk1yMGdSK1ZVajlFOEZRNW05cjR2U0R6bTZ4WSs5cU4wdkRt?=
 =?utf-8?B?QmtNcjRvTnZaS2RnUEx1b1RvbGx5b01ySVJkT1BFUmcrdWo1aUp1cmxkNUQ0?=
 =?utf-8?B?cXdUd0hJTGUwcnNnQTI1d1lPb09taWl0ZWFFVHlzRktiejF3cWIxOWVUakQr?=
 =?utf-8?B?NUE0ZEJVbjVZUWRucEZDaUdRUWp3VFRJak1KK2F1eDFmTGNHTTE5blg5byti?=
 =?utf-8?B?SktEYVdKcG95Yi96QUt4KzlQY2tFMnlVbi9rWlFNdjAzODlWZHptZDdkVUdE?=
 =?utf-8?B?MHllR1ZuUEhYSkhnc1kzSFdBSjhCSHlnajg1OHM2MnNveVdDSEpuaHRzdHA3?=
 =?utf-8?B?Zkpwa2psNGowWm5yOW5QY3lJRHgzYzRaM2lrSGFmWFExK3h5L2xuUT09?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-D7RItezdWtSVYneCKvpg"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9067.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf87798d-a086-49f2-b6f2-08da29ce5225
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2022 10:52:14.3926
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2klgh05FdoBT55TaYzJdA4ELHOXDBp1H0UoAL/5men1iz9SM7kypb8w1Wk3BDe2hKntONTsbSo79Qovrgdx2PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8032

--=-D7RItezdWtSVYneCKvpg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2022-04-13 at 12:00 +0200, Jan Beulich wrote:
> On 12.04.2022 18:11, Dario Faggioli wrote:
> > --- a/xen/common/sched/core.c
> > +++ b/xen/common/sched/core.c
> > @@ -572,11 +572,41 @@ int sched_init_vcpu(struct vcpu *v)
> > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 /*
> > -=C2=A0=C2=A0=C2=A0=C2=A0 * Initialize affinity settings. The idler, an=
d potentially
> > -=C2=A0=C2=A0=C2=A0=C2=A0 * domain-0 VCPUs, are pinned onto their respe=
ctive physical
> > CPUs.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * Initialize affinity settings. By doing this=
 before the unit
> > is
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * inserted in the scheduler runqueues (by the=
 call to
> > sched_insert_unit(),
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * at the end of the function, we are sure tha=
t it will be put
> > on an
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * appropriate CPU.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > -=C2=A0=C2=A0=C2=A0 if ( is_idle_domain(d) || (is_hardware_domain(d) &&
> > opt_dom0_vcpus_pin) )
> > +=C2=A0=C2=A0=C2=A0 if ( pv_shim && v->vcpu_id =3D=3D 0 )
>=20
> I don't think you can handle the shim case first, as then you'd also
> have
> its CPU0 idle vCPU take this path. The difference _may_ only be
> cosmetic,
> but I think it would be odd for CPU0's idle vCPU to have a soft
> affinity
> of just CPU0, while all others use cpumask_all.
>=20
Ok, yes, I didn't think to that. I'll reshuffle the if-s order.

>=20
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * The idler, and pote=
ntially domain-0 VCPUs, are pinned
> > onto their
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * respective physical=
 CPUs.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sched_set_affinity(uni=
t, cpumask_of(processor),
> > &cpumask_all);
> > +=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0 else if ( is_hardware_domain(d) )
>=20
> ... here I wonder: Shouldn't this be limited to Dom0 (for the
> purposes here
> !=3D hwdom)? Any special affinity for a late hwdom ought to be
> specified by
> the logic creating that domain imo, not by command line options
> concerning
> Dom0 only.
>=20
I think this makes sense. I'll add a patch for changing it.

> I also have a more general question here: sched.h says "Bitmask of
> CPUs
> on which this VCPU may run" for hard affinity and "Bitmask of CPUs on
> which this VCPU prefers to run" for soft affinity. Additionally
> there's
> soft_aff_effective. Does it make sense in the first place for one to
> be
> a proper subset of the of the other in _both_ directions?=C2=A0
>
I'm not sure I'm 100% getting what you're asking. In particular, I'm
not sure what you mean with "for one to be a propper subset of the
other in both directions"?

Anyway, soft and hard affinity are under the complete control of the
user (I guess we can say that they're policy), so we tend to accept
pretty much everything that comes from the user.

That is, the user can set an hard affinity to 1-6 and a soft affinity
of (a) 2-3, (b) 0-2, (c) 7-12, etc.

Case (a), i.e., soft is a strict subset of hard, is the one that makes
the most sense, of course. With this configuration, the vCPU(s) can run
on CPUs 1, 2, 3, 4, 5 and 6, but the scheduler will prefer to run it
(them) on 2 and/or 3.

Case (b), i.e., no strict subset, but there's some overlap, also means
that soft-affinity is going to be considered and have an effect. In
fact, vCPU(s) will prefer to run on CPUs 1 and/or 2, but of course it
(they) will never run on CPU 0. Of course, the user can, at a later
point in time, change the hard affinity so that it includes CPU 0, and
we'll be back to the strict-subset case. So that's way we want to keep
0 in the mast, even if it causes soft to not be a strict subset of
hard.

In case (c), soft affinity is totally useless. However, again, the user
can later change hard to include some or all CPUs 7-12, so we keep it.
We do, however, print a warning. And we also use the soft_aff_effective
flag to avoid going through the soft-affinity balancing step in the
scheduler code. This is, in fact, why we also check whether hard is not
a strict subset of soft. As, if it is, there's no need to do anything
about soft, as honoring hard will automatically take care of that as
well.

> Is that mainly
> to have a way to record preferences even when all preferred CPUs are
> offline, to be able to go back to the preferences once CPUs come back
> online?
>=20
That's another example/use case, yes. We want to record the user's
preference, whatever the status of the system (and of other aspects of
the configuration) is.

But I'm not really sure I've answered... Have I?

> Then a follow-on question is: Why do you use cpumask_all for soft
> affinity in the first of the two calls above? Is this to cover for
> the
> case where all CPUs in dom0_cpus would go offline?
>=20
Mmm... what else should I be using? If dom0_nodes is in "strict" mode,
we want to control hard affinity only. So we set soft to the default,
which is "all". During operations, since hard is a subset of "all",
soft-affinity will be just ignored.

So I'm using "all" because soft-affinity is just "all", unless someone
sets it differently.

But I am again not sure that I fully understood and properly addressed
your question. :-(


> > +=C2=A0=C2=A0=C2=A0 }
> > =C2=A0=C2=A0=C2=A0=C2=A0 else
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sched_set_affinity(uni=
t, &cpumask_all, &cpumask_all);
>=20
> Hmm, you leave this alone. Wouldn't it be better to further
> generalize
> things, in case domain affinity was set already? I was referring to
> the mask calculated by sched_select_initial_cpu() also in this
> regard.
> And when I did suggest to re-use the result, I did mean this
> literally.
>=20
Technically, I think we can do that. Although, it's probably cumbersome
to do, without adding at least one cpumask on the stack, or reshuffle
the locking between sched_select_initial_cpu() and sched_init_vcpu(),
in a way that I (personally) don't find particularly pretty.

Also, I don't think we gain much from doing that, as we probably still
need to have some special casing of dom0, for handling dom0_vcpus_pin.

And again, soft and hard affinity should be set to what the user wants
and asks for. And if, for instance, he/she passes
dom0_nodes=3D"1,strict", soft-affinity should just be all. If, e.g., we
set both hard and soft affinity to the CPUs of node 1, and if later
hard affinity is manually changed to "all", soft affinity will remain
to node 1, even if it was never asked for it to be that way, and the
user will need to change that explicitly as well. (Of course, it's not
particularly clever to boot with dom0_nodes=3D"1,strict" and then change
dom0's vCPUs' hard affinity to node 0... but the user is free to do
that.)

> > --- a/xen/common/sched/credit2.c
> > +++ b/xen/common/sched/credit2.c
> > @@ -749,10 +749,12 @@ static int get_fallback_cpu(struct
> > csched2_unit *svc)
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * This is cases =
2 or 4 (depending on bs): v->processor
> > isn't there
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * any longer, check i=
f we at least can stay in our
> > current runq.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * any longer, check i=
f we at least can stay in our
> > current runq,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * if we have any (e.g., we =
don't yet, if we get here when
> > a unit
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * is inserted for the very =
first time).
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( likely(cpumask_interse=
cts(cpumask_scratch_cpu(cpu),
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 &svc->rqd->active)) )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( likely(svc->rqd &&
> > cpumask_intersects(cpumask_scratch_cpu(cpu),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 &svc->rqd-
> > >active)) )
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 cpumask_and(cpumask_scratch_cpu(cpu),
> > cpumask_scratch_cpu(cpu),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 &svc->rqd->active);
>=20
> This change is not covered by anything in the description, and I
> wonder why
> you're making the code adjustment. If svc->rqd was NULL, wouldn't Xen
> have
> crashed prior to the adjustment? I can't spot how it being NULL here
> could
> be the effect of any of the other changes you're making.
>=20
It was crashing on me, with the above changes applied, but it's not any
longer. It's certainly something that, whether it's related or not,
should be addressed in its own patch, so I'll get rid of it and keep
looking.

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-D7RItezdWtSVYneCKvpg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmJrw10ACgkQFkJ4iaW4
c+48aBAAi/uUqg/uL1InvU+g0/Gz3SHq+KVpoEH06n8cFi0k9bfS1tPjk7wLliJv
EfVOcaihflM+mE+qGAPvkAJK5C2T0fJ8yLLxF4PMIghdtTh90wIGk9bU08ZUrr4S
at/mHiEVi2j4C62AER+XLcPbXuseL/wpFIlx0MGoXxUAIT8STycEwPyMB4+n5JpL
mXbUCrf1RXy8CYSIM1WlpFSWRME8xgIoXdWQ7ZNqi2xL8jJtfrWmXJxZtpNyQb6S
JyO8XkSKPeVEeNDqL8f96XYUAn1N6OjQ8urjk7xxtngzQ1qnNP7p89M06L8sO4eE
uuYJ8XJpLNUDoQeqFc9SUdf0t+GpQbSFSVYSfoP6CIC3KmAJseHy3whn1JHJK0B4
dJ+N2g/HLZojv0s0ACYbN28KNS+xvkuHCpJkFXb8K+40zooSI3eH/NKoEEvTUsNV
Dr3IoI26NvPKMWqZBYZ6+tro6rJoRNiRsYemZBNZ/AFDrQzpeKO5rgLm8LEvPKka
nq3733/UqmJTwZTnb+Mop/xThihLi+RLJsegn5NjFRTCLrfyEuMCEMtG+gAxvzAk
RX+rVe+fuvrczZnoZRxHanUWsB6YhNciSlXQraQQ8ZlmVq87fG6M7rhXVVPg820h
8+poiXlH8x0lH3HHQ2PhB4NBoScGhhGVkxXzEvKQYMswbqNt+IA=
=04yJ
-----END PGP SIGNATURE-----

--=-D7RItezdWtSVYneCKvpg--


