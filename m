Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAAA770CC2
	for <lists+xen-devel@lfdr.de>; Sat,  5 Aug 2023 02:46:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577380.904493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS5QH-0000e1-3j; Sat, 05 Aug 2023 00:45:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577380.904493; Sat, 05 Aug 2023 00:45:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS5QH-0000cD-0k; Sat, 05 Aug 2023 00:45:37 +0000
Received: by outflank-mailman (input) for mailman id 577380;
 Sat, 05 Aug 2023 00:45:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UuIh=DW=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1qS5QF-0000c7-Px
 for xen-devel@lists.xenproject.org; Sat, 05 Aug 2023 00:45:35 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20600.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62817c2d-3329-11ee-b273-6b7b168915f2;
 Sat, 05 Aug 2023 02:45:34 +0200 (CEST)
Received: from PA4PR04MB9487.eurprd04.prod.outlook.com (2603:10a6:102:27c::19)
 by PAXPR04MB8766.eurprd04.prod.outlook.com (2603:10a6:102:20d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.22; Sat, 5 Aug
 2023 00:45:31 +0000
Received: from PA4PR04MB9487.eurprd04.prod.outlook.com
 ([fe80::88a3:6384:ff03:fe99]) by PA4PR04MB9487.eurprd04.prod.outlook.com
 ([fe80::88a3:6384:ff03:fe99%3]) with mapi id 15.20.6652.022; Sat, 5 Aug 2023
 00:45:30 +0000
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
X-Inumbo-ID: 62817c2d-3329-11ee-b273-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=METKH4gGztuzDBlIXwzbE2q51AFfcallV7LTNxZDuYqEJvFSDWNdSyBlcXk3DaCSxGUtnoOAKrKKj6ibLvQ9/fMSeCbx4RcGZF6G64JciqpkpUkozdlbmBJbTodq2PPUf3lM6oYfsnOE9Fa0FAp/VuIeHcAPyNk3b3rB60Ldj4+nUP2FO+j8dzC3+bs36RYJd3kdd453GsChJJ9zeJ+VCB9aeRYbzojjmMIRbjk9m51RRNrP87q94VQqf7heaiJ5XRxGRnwQDPcret2Tp2qlrX+4btuGrMjTjrumSOYlWEtnVTkCaEcG+oM42SX7GQLmk+fZSmRQ3wDVcXlEStrsXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zio1McbN4iYMuQrjGhQ8+83QINdgWRMixhCYYFsE2iI=;
 b=FeJOiV3QRXovkUwwJraaG7xZG4HPpmtBGe96WXLwMWVQHnpIz7r8RJJ7b7oH1gIeu7fXpIWWnzTXejtzS6PzNgiwxXJpQMh7ZsASL3UbtgdTQiUxvcqD9EfPyhnG8epVbLxcipYf9hX1qBHX7IzSzOwJ8kJ6mWKYtZc+Tsdk23RaiIvtEpYMnbduCmEmvc1CNXNcATy/JAqmzr+yHvYG+youirOS2anlJarCt0iBNapSfKxH/YBiVSsunTHaxlSgHuRsoGQdCaiVNnnP9PEGa3amihpFg+exgi00ycIzKupLqCP6FR8WSoe9bTZGB108KQsvFIvDW/VKSMdn/+Z0hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zio1McbN4iYMuQrjGhQ8+83QINdgWRMixhCYYFsE2iI=;
 b=0tVqf+yrNuWBQqp0NhqTdRNU50dScPSTccyGpL9ZjoQctMtKgvInv9aK+Imxg8WtL/dacsDbToMLpk7xFRTy10HvUPt8Lx7Xb/u/TijTwuSKsMMH6iGHeVUkrqvObZu2jkuX2uLltDic7GXnDNkkHsS+UyqVxZyd0xAhfOjWU2Y/VjimpxeXShUgV/7AUJDDrPap8cqS5w7bezCzvfKeCKH+Kgkd4z1La6jaNGgnNTAtHeyfe+x2PfoTAx54kXdObFcdcefmO7o7d+ak5lUbtZQsIvG3gDdnrnM49JtPC2rEVxM+IVFMBhKhe52hvYwdKDjZhNcrA9qAmVkdutomTQ==
From: Dario Faggioli <dfaggioli@suse.com>
To: "sstabellini@kernel.org" <sstabellini@kernel.org>,
	"george.dunlap@cloud.com" <george.dunlap@cloud.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, "xenia.ragiadakou@amd.com"
	<xenia.ragiadakou@amd.com>, "wl@xen.org" <wl@xen.org>,
	"nicola.vetrini@bugseng.com" <nicola.vetrini@bugseng.com>,
	"consulting@bugseng.com" <consulting@bugseng.com>,
	"ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "julien@xen.org"
	<julien@xen.org>
Subject: Re: ack needed [XEN PATCH v3] xen/sched: mechanical renaming to
 address MISRA C:2012 Rule 5.3
Thread-Topic: ack needed [XEN PATCH v3] xen/sched: mechanical renaming to
 address MISRA C:2012 Rule 5.3
Thread-Index: AQHZwVAxe/bY3KKiHEuQMuUyHr1XI6/P0d4AgASauwCABn0JgA==
Date: Sat, 5 Aug 2023 00:45:30 +0000
Message-ID: <188b4b7611364397ba0f0cf9406bd4ef9ad9cf30.camel@suse.com>
References:
 <12a21bfd59d85c7b8619631edac93d79d7225c60.1690547599.git.nicola.vetrini@bugseng.com>
	 <alpine.DEB.2.22.394.2307281621260.3118466@ubuntu-linux-20-04-desktop>
	 <alpine.DEB.2.22.394.2307311439320.1972086@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2307311439320.1972086@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.48.4 (by Flathub.org) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB9487:EE_|PAXPR04MB8766:EE_
x-ms-office365-filtering-correlation-id: 3c1608f3-390f-433f-3b72-08db954d44ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 C3HMcaLD4+b82tLrCypesx/frRtpnMaGzQ1b14OfkSzgfIQ6oR/qqU7i00cqJlNFjbYz9Wg4z04b4AeWU4h30j8snKGNxKxpbDLgSMA9DxjfGgd6J/O2605fl1CQevK6cYPNWyYjooFn5qurK4iyGaw4x/bt34dEUC/4s+8hVOcTZXk5jcDaEAKoB66X8KiscVAL7pvptQvBwJyqswCdb3v0VXu0m+UQdOShXezXCXqEy/qU8XXwMN6Av6G8Sl1kUbB3PB5AdCfRZFPKI8dioD3hLi0AJTzyPsi720X/uYUM9Qi28bbz8TCJ1zQCa3kQbGgov3MaOi+bXlOa2I9MuGxZi356vSKU9aP99J/2Wa/1LM6tmEEj4PM+uVYsRID6mr5taNtAt2KiFXYnyJqAOW6/051MhY62CCdlv8UOVLK7+W8J6tuVNXNNkrLfTS1MLv21qsCrilxlcTNZLvXECtzPvvZwxgal/Zr2u1Ft4GpYdA/5sQHVqnpHdCV+pINMeBWCRGrWZJXyRGsKBcWtfzpHkLUoP5jeaDFL9ndxURnauTb2QchwfakWqfc5k1CVrE2EUpU+6A6n4mHouqWDzbJ1oim031N0Br8notzkq9Q=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(376002)(346002)(366004)(39860400002)(1800799003)(451199021)(186006)(8676002)(38070700005)(5660300002)(8936002)(4744005)(7416002)(66476007)(66556008)(66446008)(64756008)(316002)(41300700001)(4326008)(26005)(86362001)(6506007)(2906002)(54906003)(110136005)(122000001)(478600001)(38100700002)(6512007)(6486002)(966005)(91956017)(66946007)(76116006)(71200400001)(36756003)(99936003)(2616005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UjB3QXZ0L1ZRUzlXQ3VQNE42bDZXUjg3S2M4OGsvNlZ4K1NQSHgyaDdCdGYv?=
 =?utf-8?B?L0FmQUwwQ2F0eFcvMUpKQ1ZiNEdhTHF2c21oNnNsQXQxSXkxQW5IaGoyVmNr?=
 =?utf-8?B?Yy9JUW04QXYxbEJlNW8zRHgyMEJrc3l6TlJxTmFsdWRzeXBlejJzT1BzUFZU?=
 =?utf-8?B?TEVDWE12b1Y1V2NlQnBQS2w0alBzd1ZWVVU4L2V2Q01WaWo4bEQyWndKcG82?=
 =?utf-8?B?WjcrNVJDRmFiZXMyUkpDK0RZUnNSUklsL0hjZmJHUjVXYVdzSnk5UTl3Q3Ns?=
 =?utf-8?B?QVB3Q3RKaE1RT3BRZllmZzl0TnJRVGFOUThOY0w5TWJXOC9vRk5IS3ZrYnYv?=
 =?utf-8?B?S2NlY3hCSmFITFNVOVJBMll4T1VTNnBvTW93SzJMR1F0SEx4aTQvNllMYmdG?=
 =?utf-8?B?bDZCazluaFY5RHVtNXRqSExrOE9Bd1lOSUhDUERJQ09KNThKdEQ1NGxPOVRz?=
 =?utf-8?B?UWdiQVZoZzdtNUtSblV1T0Y0TXRKS3NYbHMyRjcxQXJ3SnI4Y1J0bVNCYVZE?=
 =?utf-8?B?NWp6RWJlTkRsZTcyYnFNV29FeDdrV1NOZDVqTGtpVUd0RUs0SHFPVHJncGRT?=
 =?utf-8?B?UDBzQTJsM2J4Tm8yOGgzSkJFUWZCRkwxTHpPZU42b1Y4Zm5xdHFadFhsQ0dV?=
 =?utf-8?B?ZGJkOTMyUHJ5YTd3MmU5Y0J1WFFiNzNwQUVGOGJwQ05OcnBqUlZiK1gzVVpt?=
 =?utf-8?B?NU1pcWY0OUt1ZkpkZ2FGWTNZSzhSSnZHeTQ5RG1QUkFwTE8vNCtMdm5OUkNI?=
 =?utf-8?B?cHQ5NkE1WStET1NoYXNVUmZpZDlYc1BaKzVSQzFKZXlDclhNV0FqWVBKaXJ2?=
 =?utf-8?B?cmRRbGpkd2hIT2YrOG05dVpoZ0xuaGRXMmJRZDBsTWtjQTRUWWxOK2xTa2w1?=
 =?utf-8?B?dEVrRGhYM1lubWVtSEFraHFjaVR4OHliOUZsVUU4MGhZZE9qTW9lWm1vU1Zr?=
 =?utf-8?B?TXNtaitPUUJQT2dldS9zTW1YeFJPc3dMYWI2enZrZ2NncTIrdUtOWGFqdmdE?=
 =?utf-8?B?b2xOTXZteFk1bWl2OG9TdWZzaWJvRXp3akFjZFdhZWRyNXNxL1VXTWdxWDdP?=
 =?utf-8?B?T3Mrc1Y1bGpiSDFTalZLZy9HcC9YSVhKaVF4YktTR09qYTNvNHFCUlJhTmpH?=
 =?utf-8?B?dnZIbTY0SjVBVzI0RFJPUVRBZXNaa1J5NlY1M1VldkswQjFWa0FWbVR3YmlD?=
 =?utf-8?B?VVpYZHN1RW9TVC90MkMwNXcwTDd4cVNaYXA5T1ZpT2lQZlVQWCtTeUs3Vy9u?=
 =?utf-8?B?eE5RVEU5Y0VDWHBGekhKVnlSSVd1WnozNHNCSlRYMm80Z3F0MjA5SXQyVFFJ?=
 =?utf-8?B?WFo2eU9kRENPbDhMdzlMcHRpdzZzL0ZCbW5sT3RoM0NXZFpwdzdVc255MFBJ?=
 =?utf-8?B?TVVRc2d3Wjh4WG54c1NVMDExUHlqYWMrS3QyZXRndlpCTGcvMkN5RTFmVnVl?=
 =?utf-8?B?aGVjaTZPcTlPV1l4UHhkTGpjN1k0Y1RFTklndzgrSFpCY0F1RS9HOHl3TXR6?=
 =?utf-8?B?MFAzVjM3UDhKME45cGlBUko2eW9qNjd2dVBrbkc5WVhZU3YrWHRKR0FZT2Zz?=
 =?utf-8?B?QWp6QzdQc2FyYUNVdUlsRllYZ2RRUU1sWUpwZG4zZllIOW9nWGFzeFloK2R4?=
 =?utf-8?B?OHAwK09EU1BUTGR5NzVpVEFrazYxWUdXWjFFbCs2eTQzZjFXREJxaVNQR2RC?=
 =?utf-8?B?TDQralFHeDRoSkNzdVFSNWE3Qkp1aFBCSExBV1hGbzVueWxQeGZQMHljSmli?=
 =?utf-8?B?eVlQbFNub1JyV3BudGFKdjIrUG1TYllXbHRIUGEzS0pYRzhCRytXZWRJSi94?=
 =?utf-8?B?eVExbDc5U2VFejZveVJvNlEweUxXaHdlalBScVNxQjdqa0I1MnFQbWNlNjUr?=
 =?utf-8?B?ZmEyYVNDTHRVbHZydEZ6OEpZbDFYNm9GRkd1SmtBTWRJV2N5bE8xcDRuSnJi?=
 =?utf-8?B?dTVhSVJoYXBQSjR4N0VSb2lOblRnVVFNNVMzVjYxMG10cWxIWmN2MW0yUFZi?=
 =?utf-8?B?M0RhT3BjL2tRM1AydXR3ZStwSzVyQXJIVXhNc3JKL05VSFExNHBUU2tHUGpj?=
 =?utf-8?B?UEVpMDRHVWd0bHVvc0VRZG54Q2VGUUtBVE16V0k3ZWlZL2tURnBsdjhZeEx0?=
 =?utf-8?Q?T0DS1wnB5uZUJTLP47XbuvBiL?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-QIyvlgfvdOhGq2L9HZ27"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c1608f3-390f-433f-3b72-08db954d44ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2023 00:45:30.4074
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +GEThrEQS7RpZxtKgDVkXJYtHzDTGJrQucU+zLOHHUxWuBFG8JHnhFW6y9NTt+YrYdB27+8BCssWpXHcmzOoWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8766

--=-QIyvlgfvdOhGq2L9HZ27
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2023-07-31 at 14:40 -0700, Stefano Stabellini wrote:
> George, Dario,
>=20
> Please ack
>=20
Looks good to me.

Acked-by: Dario Faggioli <dfaggioli@suse.com>

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-QIyvlgfvdOhGq2L9HZ27
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmTNm6kACgkQFkJ4iaW4
c+7C4hAAmbfp3o6m7pMSe4gduvCpm8tUoTPaI+TPqNis17eNO2w/GlEoS9Rxpjjq
9SkEwmLFNJ8rSPm7oa1foJ41m5BNt+S5etnNbd0unJPVXkazHZtnwOhE2oH3l1Nn
fge4juk3Abnwd63JZzlC4wCvMSfAWn5YP5vvp0sPmIYOsB4wjGeF69nI9RqTlGeW
AnN5nK3uKVjh+BWxzKhLpU6xd/0kZ4SpAw3sglfINgggg8C6JwOSyfgJXG9VgYgK
M75KhbgPBuD4YY6ihJeVRLAplBSvdkqzisjf6lmp2KeCFjQhUsVH76SK/mk27BwO
AH6ACWLxF/SG3lNsQzrBpb/G6kM1XhbQG/YQJwtmxVROBkux5ye5BRXSPURAc6Gm
v9eTi/kFu2WpNtR/e1pTa5z0NNZdseWLz4+W8LVOi6n92pkpXfNalds2H9esreUV
q/0l8DM22UcRICDEyn1jV/JGhRW8RlY2ouocccivzdgJxcRJYoKTCgCu2+1eE2kg
2u54GRaiGaj4tHNYT5OAGtMhWd35RjFUjbUz+8UtN8av0YEJOVMB/oRbwzC2fqsm
MCqJs/kISEDVJFZhAnLHtZNGs8asz6/8F/zt5klFzWthdGf9yOPzQ8CIeXSPENpQ
MuV4DNLIOAYq/piOPow3OtG1QUAEozitn64oCXjhd1jhBIMy6tw=
=c+qT
-----END PGP SIGNATURE-----

--=-QIyvlgfvdOhGq2L9HZ27--

