Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB5F6073B4
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 11:16:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427457.676532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olo8S-00054F-2b; Fri, 21 Oct 2022 09:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427457.676532; Fri, 21 Oct 2022 09:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olo8R-00051A-Vm; Fri, 21 Oct 2022 09:16:11 +0000
Received: by outflank-mailman (input) for mailman id 427457;
 Fri, 21 Oct 2022 09:16:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VH1f=2W=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1olo8Q-000514-KA
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 09:16:10 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70058.outbound.protection.outlook.com [40.107.7.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe35db74-5120-11ed-91b5-6bf2151ebd3b;
 Fri, 21 Oct 2022 11:16:07 +0200 (CEST)
Received: from PAXPR04MB8366.eurprd04.prod.outlook.com (2603:10a6:102:1be::12)
 by DU2PR04MB9113.eurprd04.prod.outlook.com (2603:10a6:10:2f4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Fri, 21 Oct
 2022 09:16:04 +0000
Received: from PAXPR04MB8366.eurprd04.prod.outlook.com
 ([fe80::64e2:acbd:4d56:fcca]) by PAXPR04MB8366.eurprd04.prod.outlook.com
 ([fe80::64e2:acbd:4d56:fcca%5]) with mapi id 15.20.5723.035; Fri, 21 Oct 2022
 09:16:04 +0000
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
X-Inumbo-ID: fe35db74-5120-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VCq46dwvJaXP9/6TjckZ5bqdMSgM5o/XbLN2E6fYfz41AxWrCVy4j44evJobGYC+oyeSkE7azoLJCnYgjj5qnaL6BydVsrDVTQNRw1uCsjl3/jKbe5ZgmXJdkc4grIz4z+S02Q4WYGk3MP6a9veTgVSa2PyTUYVEUpqKgjwamSkS9s0DBQ1ZBV8LxFht7c3KOHtCvG3PUJKSfW3u5rC6afIYCvcjbQjThnNvni49/7E14mi/QQX/apeqhzP2j3plFWeRHrYsrWG0/Q9CLNJxZY37QwWbRwm55NuqBaRhjy9GzmVoR+SSH71dWT3Hc6tGDQtvw+eFItO3gGIRfdicUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yO0j/2y578dOj0tcJr9z1CwMrLdfXmWA9omaP0NToyM=;
 b=WTd1Ahug6EX7Q71wO7qFaWjKBmFevAvJ0GzQ20FXdNghmNSjISv/scoMAFCCdN2g2iMgUb1sXwLAn92Ga/W3FgGGNec3KDlCNqBXAokHx1mrQkhkDWdnftZ49KCW5yxQrYyn9F4vRXHrq93tBAjpwmwbSyH2elfmOEH8K6/v38xiJqCFyccVm0mQqS+yiqcqr7xF7yc6wUlK3kSXofNLfI9Zlp91Jl0kC5sAHRT0geNstT0U3LWVlunkY+U3yq0hP5Km/hCd1sPf58qbY1I9eQ5CfbSijdTDQHEKvmcArdu7CQWfk/fLK+Arq0fyUz27zm6QnKQ8sakvYrrgkgOoxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yO0j/2y578dOj0tcJr9z1CwMrLdfXmWA9omaP0NToyM=;
 b=A12qIZFu1xP7IRlIuJcthyJ0Hnj1JGvVQ/SKmLwhprtWKaBmZNfM2WB1+MApBZFDdMfjnTD6M8+Wt7JCr01afdNIDad/WUvNNWpQFLR/AKLgHwqRJQ6+60UleMi0c6v4uX22SRz3o9vmPuWuQekqn3qsWkJTJN5ILi0kEmDdOiQujxlu+0hBQz6dy19POV4X4VPVdAqa8wiC6woac/0LmBrZ56fMaB8AS83LB7Qd1VSaZjBDhC9L0eIO+aVkiEZlRw++yfUU0uLetJP7cmlic29TbyKvnM5+pD/SeFCpBkElF2R3fg5qeP7bfjGf0h9hdUsl3DdqcI+/GC3qya/Xpg==
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
	"wl@xen.org" <wl@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "Henry.Wang@arm.com"
	<Henry.Wang@arm.com>
Subject: Re: [PATCH-for-4.17] xen/sched: fix restore_vcpu_affinity() by
 removing it
Thread-Topic: [PATCH-for-4.17] xen/sched: fix restore_vcpu_affinity() by
 removing it
Thread-Index: AQHY5Rp63crRdqzTYU65u4+DFjIN7K4YbPgAgAAkTQA=
Date: Fri, 21 Oct 2022 09:16:03 +0000
Message-ID: <c90c17683100b77d614d90e108de0324c2eaf667.camel@suse.com>
References: <20221021065806.14316-1-jgross@suse.com>
	 <6ac5b62c-1679-b55b-e3aa-00ac395ce89c@suse.com>
In-Reply-To: <6ac5b62c-1679-b55b-e3aa-00ac395ce89c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.46.0 (by Flathub.org)) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8366:EE_|DU2PR04MB9113:EE_
x-ms-office365-filtering-correlation-id: d125e30d-00e8-4b7a-749c-08dab344e0fc
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 1I14s8iNhDyF+0NSlokBp4BYBbqNHGbnT6IHmeb5YWWA1n1xq+REVBLke9QX49fQ74LA1jDove3yxm1q8r1eiVUpf7wDI6G9NwyNdgNKaj0bxqvgS1DJpRdcQ7gtN80ISKFL0FfGbEx5yZqPX70cutPRk6kFAfYY6GYH9FDZv45ZwQPxErpY+b8gsgBEx8iDkrZRIyk5k5IMk71ILT6fC6W2kgzbxDGszcZZqm8mpk+DFTjNTXb2MdVF2yeCdbm5035sdlmApkEmCwCnf+X6qH3TeqGps3G2QBs4GItwfc8OphuzYzYP6E40zZwwINWIex1g+Pccit97mw7m1GRgo7IL3TwEywGE/fuZW6JjCBRP2ep25fAIA+dLDh461hJs3rmInMSkMEgt3siRYeCK5WzryBz1GzuTjuHGEqH6WGKcHkh7kUIUdl2IuNyeYaTKEj2F3Bxc7VvhHnj94X63O77EaNhMVMCtnr7nFoFg/X+Xn1G07iX4fr2yMZGi833rwOJYhJ4rFWiJatw8u2QHrHrt6t/hy6cIiudXleh/yK8yu2AqLWPNbzHflVukW+Br5rDEo/9tT8WJC6OdlgL6dSoHl/Z0USFX+RXLdt+BD1sAF+hksAsyNAX3Bgo8RuYxWQaVycvj4Qn+8c5pXCrOlauzd0hvPix4jVFGIL7zhIMiS2Zf99Mtw+aVZPsBQ3x0TkxSdtpoP5j6pjIpHoMgtbJqPzz8uoulwkNSduCFBmL3gtPN6LtzLmh061n+mkhIHc67HAVyI3X5nVZm5XziZQ8H+W5KPTbncCZMuBAxJT09KAQoqc6ZFMAnRQDgUJ5RYAYT1gqWa6tQfarxUG08lw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(366004)(376002)(136003)(396003)(451199015)(53546011)(91956017)(186003)(38100700002)(2616005)(66946007)(6512007)(6506007)(5660300002)(26005)(4001150100001)(8936002)(41300700001)(478600001)(71200400001)(316002)(110136005)(6486002)(66446008)(4326008)(64756008)(966005)(66476007)(76116006)(8676002)(66556008)(54906003)(83380400001)(36756003)(2906002)(99936003)(122000001)(38070700005)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b0ltYnRYR1ArNWpvM2VTQitoZyt3eG14SFJxTFZlOFNObWZ1Zi9TNWhDU2dD?=
 =?utf-8?B?MTE0OFNXYmVzdi9kOGh6UWdWWXNGTXBRMU5vZEJYa3RVQUNSNWp6cU96SytE?=
 =?utf-8?B?VVV0YVRWYVgwek5ZSVNYU0FySXFEN1NQUWd5d2RoMUZjdThvVk5BMmNDTVlU?=
 =?utf-8?B?WGI1ZC8zUkQzemtLYTZHd0UraU91WUYwTDBUY2xKVUxVUFhSZi92MG42Zjd5?=
 =?utf-8?B?SXozcTkyUjZjUS9JY3REVVpkUWg3a3lMUnh5MGlYaEVCVllUYzdSYlVibjhB?=
 =?utf-8?B?VWpxVGRMS000SHl4U2VsMXdKc3ZYc0ticjVrc0FiS3FlWHRSM1pvb2tJcm5j?=
 =?utf-8?B?OUZTMUdmS0hmRDYvcVdyVjdNNVZKNzNXVjEvd1o4aW9hbXNpSDBza3BtYzF1?=
 =?utf-8?B?L1Q3NlI0SzNQUy9JSFJ6M3lmVzR2M3d4TFJudGJKVHUxTXpVZmY5RnJob24r?=
 =?utf-8?B?Z3d1UHl3QWR4ZE9kVmFRTzFiRlBBMTBvYUF5SllqZFNXQ2JhZGxyOFhSWWt5?=
 =?utf-8?B?K2ZHZ2tTWHZxTWZhL0w3RUVYbHBhRmJwV0p1TjdMV1JPUHRNNkQwRkxwZldE?=
 =?utf-8?B?ZmhOR1Nnem0zUUNLMzJBV2tTUHJQdlNpSjB0ZG9tUVVuMGxGVzNQQWl4T1Jr?=
 =?utf-8?B?RzVVbWkvVTdOUEt0Y3pvM2RaVlcwck9oYy90R0VSQ0c0Q09EMjBoR3dSbnlF?=
 =?utf-8?B?YVhYRDFhUU0xdG5FaU5yNUFCcnpIRjhJWnhLQkNSZVhwc0RKaWRtSGM5cVFl?=
 =?utf-8?B?VTNaUnpKSnRVY3JTdjJYSkh0eUoyYTk2Tlg3UkVJQ21HdlZtVE4rWVhTcjhR?=
 =?utf-8?B?VTV3b1M2M00xZyt6enZ2T2JScFJiM0pKbmtzMk5Gb3gxMlR6aXNGeVBZRWNx?=
 =?utf-8?B?Z0NhWUJkakJaZEU5ZWU4ejZzbmtVSlBpVytPVk9Uc1FpbDBkS0NuL0Z1Tzlp?=
 =?utf-8?B?NWdUMWR3L2xyb3kwMWtsNzgyK1g2SGNJT0tUQlM5eVVVWGh4dk92R2wxSks1?=
 =?utf-8?B?ODVJY05rTmNZS3k1S0VYTU41R0RNNWR1SGkrWStlcmpqVTJlQWN5YmJ6dkto?=
 =?utf-8?B?NU9WekI0VWwvVVBvMWpuZTg3MVNCL1hCb09RSjQzTlFGMTU5bkhndzU1Qy9l?=
 =?utf-8?B?NmUzajVDTGJ6cTRvVzF6N2gvWVNFNkpTZ0xrZnBOcXdEZTRaZ3BNNWNub3Q2?=
 =?utf-8?B?RyttU3l5ZkVCbm9ISTE3K3BzazREYU5LaGMxVlkzVmNpdlQzZjBWamY0T0RK?=
 =?utf-8?B?RXk2aVQvUW45bTBNWUVMSHBHSHdWWDlmbmtRbXR1TUJnRjRNV05NOVZzSjhV?=
 =?utf-8?B?WXdEUmF2SjFaMFdVMHJ6bjg4aysycHMzSFZ6cnprYnUvUHVLT1NCSFpJVzFN?=
 =?utf-8?B?S2xYeDJJRlVHbDM0STN2cGtDemFTaGNtamVLUjlianEwdktrOG9iSlVlR29E?=
 =?utf-8?B?L2FkM21NemN0Zk9heWEzNkZETXU2c1Rxd2VBZzJKeUlqdzRDTG5OL0hMbGFM?=
 =?utf-8?B?ZVZqK0IrY2pnMUZCajMxYS9uNHk3dnhaclplSk0reVYyTEJxYlY0SkQwelhi?=
 =?utf-8?B?eTgwaGZ5U2E3Z3c4WGRvNWNWVlJZQ0cwOFEzdThBd0QvZXo0cEhXSHhaVXFm?=
 =?utf-8?B?Qnc2YkNsTG0xa2xBVHBRTXFpRW1LeEplMDBFZC9zeUNGaEpvdFpIaXF4dDhw?=
 =?utf-8?B?Ui9WWGQ5WFNYNTM4M25oellxTFFMN0FDV2lxRWJ5a2cwZ0k1NFlCQ1BnMVNK?=
 =?utf-8?B?RHVXbXRPcEVRUVdtaGVWRTdqVXBlcDJ2dUllK1hhTkx0NEUzSEphSTkycThi?=
 =?utf-8?B?UlNEYnEzdXpxZE9WSVpNcGFrSUhRQWl1R0V6eDViZDh1ZUZMYmdVck9IL2JF?=
 =?utf-8?B?V0FSbURjamtGNzgzc01YeGI2TkQ0VW9ocEpNSTRKTkViWWcxYnd1d0RhelNU?=
 =?utf-8?B?QkJORlRHeWFSakhIaFp5eUFlUnJud1g3Z1hFTU9zUVdFcVE4amZ2Q0RCSGtF?=
 =?utf-8?B?Q2ZndkRGa1FhMnZjZFIzZDZkSjdNWFY2N3JMSlNla05hS1FwNlRPSENkd1I3?=
 =?utf-8?B?T05pL2FGOVlkYzcyQkNEbUxqR3Z1Mkp5bmR3U2RNWGNaUGtxcS80dnlQSE0x?=
 =?utf-8?Q?QwwNbytL8u6KiG1bg+8IrRMGn?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Cy9cMsz9GUKdVKBZA0bD"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d125e30d-00e8-4b7a-749c-08dab344e0fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2022 09:16:03.9979
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P0mQnjti0T3GpckkC3A1wVo70D4P3SBAkVsxmY3UIM//MshE8/0alaO0xbiaOS9W9cmLV1id7/IpZcliTtl6Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9113

--=-Cy9cMsz9GUKdVKBZA0bD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2022-10-21 at 09:06 +0200, Juergen Gross wrote:
> On 21.10.22 08:58, Juergen Gross wrote:
> > When the system is coming up after having been suspended,
> > restore_vcpu_affinity() is called for each domain in order to
> > adjust
> > the vcpu's affinity settings in case a cpu didn't come to live
> > again.
> >=20
> > The way restore_vcpu_affinity() is doing that is wrong, because the
> > specific scheduler isn't being informed about a possible migration
> > of
> > the vcpu to another cpu. Additionally the migration is often even
> > happening if all cpus are running again, as it is done without
> > check
> > whether it is really needed.
> >=20
> > As cpupool management is already calling cpu_disable_scheduler()
> > for
> > cpus not having come up again, and cpu_disable_scheduler() is
> > taking
> > care of eventually needed vcpu migration in the proper way, there
> > is
> > simply no need for restore_vcpu_affinity().
> >=20
> > So just remove restore_vcpu_affinity() completely.
> >=20
> > Fixes: 8a5d50dd0b04 ("xen: sched: simplify ACPI S3 resume path.")
>=20
> This Fixes: tag is wrong. It should be:
>=20
> Fixes: 8a04eaa8ea83 ("xen/sched: move some per-vcpu items to struct
> sched_unit")
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

--=-Cy9cMsz9GUKdVKBZA0bD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmNSY1IACgkQFkJ4iaW4
c+5N5hAAp3PzhaCR8w5rMQo4aDuDxw3ElTgH8+/7BTg8+/byMb4fHCtC693/au6h
WPBfofzgBEU66ruZaOaR04S4Ig8JOi2iawqt0kBDKBjjwTjVCCetNLPi4iC/6ViK
zrP3TMvHYRQth2AIGe5Bb+u9uJRSQvwcL1I4CGdOf7sdznaklgZY2jsOW3fTzPYh
98zFiwyDvAYT65wFOSPwtJ4jngy3ij1byv71AzdaQao2eS9odMoW6jPWz/KNrFXV
k4h4yanprDv3gIXLqbyFJSFNUM/8bmDLrPAPN7YLGzQloObmdDNyhvl7u4iVh/Fv
LeN+zHapdXqyTZpS2dSAhkwLrXOz7ER2zDB+e8sGhQz+fXi777gthOESeZ3AsOSi
rrK/IUlmAt1/vBHyDE7jFP6HaUuLEry0Barj/4WCAXw4HmmARAjmNomqnXfnh3ok
rjn+TFVwHJZPNQ5H4ZpIlhDyQhH6gG3qK8bOBBq6PTXQet7chBcM4Ij+i0tFM8GR
Kyt8t12c1asZ0pMDrKGRsZy0pKTvVPPpijY1JFalrWHmBbhG718hzBuxvOzT9VCU
dGcKdeG+UdrQvXAy2wWFcw0BxUms2PwP8x4zN2p/O3aSR/8azf7ZG+DG93uHSS4Y
AY8E5TSxCQoFiSlPDZad/Aoz3oBnfWq6GX7WY6/uyNS/x16qjeE=
=/p1c
-----END PGP SIGNATURE-----

--=-Cy9cMsz9GUKdVKBZA0bD--

