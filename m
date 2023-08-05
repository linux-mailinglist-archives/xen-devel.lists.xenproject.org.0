Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7118770CC3
	for <lists+xen-devel@lfdr.de>; Sat,  5 Aug 2023 02:47:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577383.904504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS5SB-0001Bs-GN; Sat, 05 Aug 2023 00:47:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577383.904504; Sat, 05 Aug 2023 00:47:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS5SB-00019f-CM; Sat, 05 Aug 2023 00:47:35 +0000
Received: by outflank-mailman (input) for mailman id 577383;
 Sat, 05 Aug 2023 00:47:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UuIh=DW=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1qS5S9-00019V-W8
 for xen-devel@lists.xenproject.org; Sat, 05 Aug 2023 00:47:33 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8afb243-3329-11ee-8613-37d641c3527e;
 Sat, 05 Aug 2023 02:47:31 +0200 (CEST)
Received: from PA4PR04MB9487.eurprd04.prod.outlook.com (2603:10a6:102:27c::19)
 by PAXPR04MB8766.eurprd04.prod.outlook.com (2603:10a6:102:20d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.22; Sat, 5 Aug
 2023 00:47:29 +0000
Received: from PA4PR04MB9487.eurprd04.prod.outlook.com
 ([fe80::88a3:6384:ff03:fe99]) by PA4PR04MB9487.eurprd04.prod.outlook.com
 ([fe80::88a3:6384:ff03:fe99%3]) with mapi id 15.20.6652.022; Sat, 5 Aug 2023
 00:47:29 +0000
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
X-Inumbo-ID: a8afb243-3329-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mez3sUVmjJD3FH71QrFU4arTgJVOown5JJcczk+2AEH3DdcxvDhegWjFWvivO4WcgmGf1LvVNk6Thvyo54mY9DKISZjSg7z9gqJFS4c6TYkZ8XpLqA6iEyWHY3EqstxQvJi3mZQR7Oe165LVaqhff7o6FUKwbW9DQbC3ucGaTFw2+35loaEnv0dM0PyBiYMsmZshq/hUamfFfO4K393fS+6TD1DwVNo1fUn58EnhjrXMuCFjA5AtDGi1EXR0sFj/xZnhLJxbQWO2ULqo4vkOt0bqBMNKe7RKXp65ad8bBmoVbqTZXPJGv9YxtZNoHpKtZ2JWdZp3aPsExCWLBwqKWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sHKH1iA1i06D2UfjBIcSDKgRCsJYPHX8MXaxpn0OQ/E=;
 b=MK5NH5cdacK4hKI2N+LlSMwvx0VOUb5vFF+bnZ8Joal4BnlV69fkPBVQJbWBz3rR2MbZCPRBCJEHFAHM0PELhbqKNHxpbG8XcwqHA/E51jgvvz2QGclE0DLeSOxpPChI9xv10YN/emEwh1JubYs1v0SRpH6MvxkiXZxXCqqTF6X3bOGeZ4Jf6TpSHrvMCLCMbXtIhEh6v6W1uMnRG8EK9xqRwEwWF6DemPgvUcCSAeYPoQZW5hb5KWUVOSgg0due4LCbLJ519+z5mMDLGD1Mrtno7nBm4pFExBKNKYPdjrCnLuGKq3jDnHghy79Wu84hoRbtK+k5DOVxcvTR5goqVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sHKH1iA1i06D2UfjBIcSDKgRCsJYPHX8MXaxpn0OQ/E=;
 b=dmEwenPQE3qyEunUjCgzYpUW3z2kd9FUJ6s+QVU6z93XbxLRybuLuSScKSBO+6QjHCP38wtnAxPkQCpU183WpmKucAVdUijGapNpv0PKKgSYOi41UJaokLAwvk3ZMYPNJX0fQ3wdgzQ0i1FBWvEJ5AyxPmZZXdGm7wlXFSiqA6MtWerPgS+Bdy6+frzQ1sTvYmXgvQ9wXY6jJkFVN5YTsGPkCv2J58P4+IuWmpGod5qEp2eozVOlvQhDR91P5GoJztZLsoQt8d2Zn/sDF9Pm6Hmivx06l4zIElUZzTdSKCaHuz6kxKVzXxXa+ydZr5Q/bEjvAargzDjTRwUXlzIb7w==
From: Dario Faggioli <dfaggioli@suse.com>
To: "sstabellini@kernel.org" <sstabellini@kernel.org>,
	"federico.serafini@bugseng.com" <federico.serafini@bugseng.com>
CC: "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
	"consulting@bugseng.com" <consulting@bugseng.com>, Jan Beulich
	<jbeulich@suse.com>, "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH] xen/sched: address violations of MISRA C:2012 Rules
 8.2 and 8.3
Thread-Topic: [XEN PATCH] xen/sched: address violations of MISRA C:2012 Rules
 8.2 and 8.3
Thread-Index: AQHZw6cMDaRGuf0brk+fvTV6KSueEa/UY5qAgAaB6AA=
Date: Sat, 5 Aug 2023 00:47:29 +0000
Message-ID: <dbbbe5394a6fef7291c825deb0d8639f84690149.camel@suse.com>
References:
 <072d163857101f4cdaf61b6336b2d8f2e65d7360.1690800014.git.federico.serafini@bugseng.com>
	 <alpine.DEB.2.22.394.2307311424490.1972086@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2307311424490.1972086@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.48.4 (by Flathub.org) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB9487:EE_|PAXPR04MB8766:EE_
x-ms-office365-filtering-correlation-id: 3f157902-2050-4098-52df-08db954d8be3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 mwKcEc/NpI/RXxrrj/rUVpOSaBUrGn0FhHhyGIg95lLJM2ncjU1M/8/JANAlzwkIgVW3F0aUvoVBXE5lUdWyq2cAnCXNIsK9hNMLRgyl7zy2qZW9ghZWyS+Lx3p+C2hHBvE4PrXyVxt7k1tYd8BeMBy28P+LaITWuRRZHwKertB/xUswzFWuC8EEANzEocujvUMNbYcbeleClpJ42z1Z+iWLnm+T2jrnzN7xsSKwQ01sWBFbC4CmZW8OqPVZ4PQXm0geAOIT0FzK9hIZpiX37el1yZfrtDxMkxpgLSVbWtnlHq2m4l5q0JKKRmOZcXjEXlXQluzku0yo48kOxYszW+hqQmHyBoXxRfCMT57uKpMPVUCxYeRWPxX+QWsIhlHfAmkoTHTw5AcaVnqL8PTsFIP3NPdj3cI22DtRpYcfsV6Xovey3ndfeW/TJ2/vIpREuXliHxMzVBWTIkI0iRZwGOGKGydgmx5+wZIjreGwseXtqSyqu84vogesXpZjrO96QlIz3aFppLBePxvseIlcazjb2US0OZPQIJwX2lwN/8T8hsrAmF9AIFbo8l4I80c42y21nYoBTJJeO2tCxf+rAB1Pc7G4XSEkiNHGI+j9GLM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(376002)(396003)(136003)(366004)(186006)(451199021)(1800799003)(2616005)(71200400001)(76116006)(91956017)(66946007)(99936003)(36756003)(26005)(86362001)(6506007)(4326008)(41300700001)(2906002)(4744005)(8676002)(38070700005)(5660300002)(8936002)(66476007)(66556008)(66446008)(64756008)(316002)(6512007)(38100700002)(6486002)(966005)(54906003)(122000001)(478600001)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K00ydGZaanJ3Ulp0a09oYmtPa0l5STdzdk8vUEdveTlaU2MxTkh3d3Boelc4?=
 =?utf-8?B?WmVFOTYvUlhnWE9uWlJZaGRZb2k3ZmhRZ1Nyb3oyRTdZRXJVSGtwNnJpTkwv?=
 =?utf-8?B?N1VHelkvdHlFUnpQNEIvaWFlN0Z4MWNZb0xFVHRFWlFpdDczc0t4dWNwNVZJ?=
 =?utf-8?B?dmdxbkNGSXNpTVpGS21hR0d0SUJPUlN6UnUxNm5NL1lDSkdqZEJvNzV3TkFn?=
 =?utf-8?B?eUNYSmxhcGMyZEI5eG1uWldyODdaYVgySXRtNVEwK0w3UkxUcXc2Vy9TNkdh?=
 =?utf-8?B?RjdqUHF1QWR6MENxbFFLOUkzZnRvQWtJcGNkWXJnYWUwT3lOWXJJV1lRMTlj?=
 =?utf-8?B?Q2kxUTdGekVEUGhsbjVvblJaTmJ0ME5hVVN5UlV0RzAvYnVjY2xZSlJFMGlp?=
 =?utf-8?B?cFpLUXYvcHg4TXVTcUdUeG5mSGE3VUZyUmNxZmdIa0xZM2xFbll2VURVRW5r?=
 =?utf-8?B?dW00ek9Xc3J1VDFDV0djSnBaYVBHM1ZqRFl6UmZ5VG1jZjA1UURpTmkzZFhz?=
 =?utf-8?B?RW1STzNrWUp3RE9vQjBPMmtGckJheTlZb05XNHFOT3hWVlJuaGxoT1VFeTVB?=
 =?utf-8?B?Z0VWOGZXdG9NbENNRXZVYkVHN3Zpd0V2Z3p2bU5kNEZsaFRxUW9zdnhJNkpj?=
 =?utf-8?B?STVZb1Z1R2phazFpRWZPMkFobDEvZkdTc3ZlbTdLRW1jdDBrTDZhNFVxQmdm?=
 =?utf-8?B?TVp5ZTNTL3JZaFJPaG1CMmVLWkVkeUJCQzQ1cTg0dDFlK1JQR21wTkJsTkFu?=
 =?utf-8?B?UnNIN2k5eFJCYittWXFPL2tWTVJKSmdMenNReEN0UzZHY0hSNFgwZ0ppQ2Nj?=
 =?utf-8?B?VU55OXVQUlQ0T3Z4NlJMWnBqYVZtbGg3ejVncEhwOWxqcFJwUzF6c1hoRU1q?=
 =?utf-8?B?NE1oVnVpazJ5QldVeWo2S1hnc1VXdlVBaytnYlpERkVQbno4Smowa1cybWg1?=
 =?utf-8?B?OUZwMXZPekZWZllDc0JvZ21mNXZwdVJoVEtrTTAwQlpFMGZOcTBSazNvcUFL?=
 =?utf-8?B?OFRjdHZzeEIwYWs0QVJPRTJqRHVXN215dE96SlFMVWJwM2s5T2hlU00yUlpE?=
 =?utf-8?B?MkoyWStZR1RjMnVnK3N1K0hvOE92RXorZWw1NU9FVzdDQUNPRExDTDZQZE5m?=
 =?utf-8?B?SzRXNzVzdFMzK2NjcE1XVGJiaTg3U0gzWnVXNWdKN1duaC9EdE1pKzcrVjVj?=
 =?utf-8?B?bEZjUnRYUU9uOFNDbWduWDkwZ1JDbjROMEw3aDZiYUhSbXVwT3ZTajVUTGtO?=
 =?utf-8?B?bUlRVUlPZGMrTGoyWGliSnZxendLdzEvOEpZU1ZRa2hHbS9mRUcrSEkvYzhx?=
 =?utf-8?B?NFBzbTd6TWMydTdoRktDdkhLUEFkalRoOHU3bnlmdStvclFFY1NEaG5KUkVl?=
 =?utf-8?B?anBSS0VuaS8wTXhyM0hMdXA4cTNJMGF3WUxOZkhIaTYwbElIbDFXUnJyVDhL?=
 =?utf-8?B?NzBibVNOa1pTZ3VRTUJiZExsQVZmNksrWnpaaS9aUis1c2s4MGhZUk1GTlBv?=
 =?utf-8?B?M1FwL2ZlV05CWTZpeFcwc3VVNHZySExyc3IyV2s3UlJHU0p1OW5tNFcvNWF2?=
 =?utf-8?B?b3F5TzdpVEczcGtJZ0dhazljWE5wN3l0d0FBQ3dZZ0p5bnhaQ2ViVFZYL1BG?=
 =?utf-8?B?cXlkYUVGU2N0NFZsWFhLeEE3OWtKelpaMk9xeGs0NS9KMmUwQ2FXaEVNS3Uy?=
 =?utf-8?B?ZENJdVFiZnMvNjZEN2I0UHhhWm9wZG44eFVtRnBjR3ZkNkZ6d2ZnbVdnK3VP?=
 =?utf-8?B?RFFaYjZ1SjJ1MklNRGVON0Z6VllDU2dtdGZTd1ZHa1lHQ1huZHJDakN5eU44?=
 =?utf-8?B?Ri8wcUdZc0kyQ29raWFjWnRXQm5na2ZIZEdzR3VXN25LK3lMTk5qNjFqNWc3?=
 =?utf-8?B?Sm9zS2wzR1VkeHF3dDRzclJBa1JzOFVnZVdBSGREdGw4QTRnWnc3Qk9tVFhx?=
 =?utf-8?B?MmpjcEVFYzBaU051UC9QLzBILzc4Sk1MMEtqY2xMbXQ2MXRQRXk0QkY2N2dy?=
 =?utf-8?B?QjRud2I3bDFhU2dUQ1BoVkxSYTdoZ2w1NG9SRjlGQ0tERUw3TnpMMmVHd0I3?=
 =?utf-8?B?ZnRrbmswUW5aSmMxOWpMODRSdVUxWEdGRVZDblJtZStTU1hmZldoYURlTU9F?=
 =?utf-8?Q?55p+SurC6yIYe0orOECxWQgt8?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-XiJgakgFxx9P1vBaZNdG"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f157902-2050-4098-52df-08db954d8be3
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2023 00:47:29.4792
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rxpTBcLUtucU1oSb27VrBWDfLuSLyYQDMXEC8V/8JYQ3Ue1K70q6pltV2S1N/coV0vz0OtxnpKs3BZPBxBeysA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8766

--=-XiJgakgFxx9P1vBaZNdG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2023-07-31 at 14:24 -0700, Stefano Stabellini wrote:
> On Mon, 31 Jul 2023, Federico Serafini wrote:
> > Give a name to unnamed parameters to address violations of
> > MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form
> > with
> > named parameters").
> > Keep consistency between parameter names and types used in function
> > declarations and the ones used in the corresponding function
> > definitions, thus addressing violations of MISRA C:2012 Rule 8.3
> > ("All declarations of an object or function shall use the same
> > names
> > and type qualifiers").
> >=20
> > No functional changes.
> >=20
> > Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>=20
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>=20
Acked-by: Dario Faggioli <dfaggioli@suse.com>

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-XiJgakgFxx9P1vBaZNdG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmTNnCAACgkQFkJ4iaW4
c+6ythAAvae6nh/Q/Myys+mIY58VDW3lPQp1UdXVADxcNoKjIzBVV7JKrni9uMfI
xD13+agt5t9qP8mLnoR9rmgCcIdoclp8Z0WnjK4rFG7k/X/Rdj49/PuxM57nKHGG
2rhbqwqo7XdyvoJ4rmAJrT8o1DdYfdrB3skyR06eSOZEkvNYl/1NKsDenQNRpH0Y
ZUUIGFIqokv1jjN2CS4ef9JTRqT1K2QRXluuWE82cMpcKjlISVDQhkJtFr0NV3wY
yqSIZYDtsScDJ//W0QEvl6FWvOLEuH+x758YFsYk69DoACc/EQuKmOmGxmX50ckT
GTPHGCk3lpIKAzq8bnE35AM8qL6yjOVFQEp2v7eWBPlYw1OOMiXZ8J0IwwAkcKa7
dn2qFr/8SizxSEKO7mH88pxKtrkzO8WXQKbctyC9nfYzizOT3exQEu2H1DobhF+l
ZJ4nmrPD0SI6IS5T8vept9ys1sMnq+Ylj0NcZf9V7W8oXDuqLzNQPfs2Te+hIKtH
kX/PfqzGSNY8GYoYv/CDnkbRWIUh6FGzmpyXPCbqakiYmT+bTKNRShk4EYFZYy5w
mztRNeD8hhpQF4jndcLQ2vDIPBcZhIgIB/295hk4vasNKJC4JwB6W+NoG2hP7+AY
uuCiDxZHcMeEhV7AWph3myZT98AxPVQqydAsrtEDswim1vxs25g=
=KF8F
-----END PGP SIGNATURE-----

--=-XiJgakgFxx9P1vBaZNdG--

