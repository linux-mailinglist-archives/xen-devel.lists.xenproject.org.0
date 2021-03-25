Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA260348C28
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 10:05:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101320.193705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPLvU-00069d-Dz; Thu, 25 Mar 2021 09:05:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101320.193705; Thu, 25 Mar 2021 09:05:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPLvU-00069A-9o; Thu, 25 Mar 2021 09:05:12 +0000
Received: by outflank-mailman (input) for mailman id 101320;
 Thu, 25 Mar 2021 09:05:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gXFl=IX=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lPLvT-000691-5u
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 09:05:11 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34607c0c-4d3f-43b1-b7fe-73069ee272ce;
 Thu, 25 Mar 2021 09:05:09 +0000 (UTC)
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
X-Inumbo-ID: 34607c0c-4d3f-43b1-b7fe-73069ee272ce
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616663108;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=dMD99dj36c5TTh9lHrhGCe5pFdWHoZJ8rJcPuK0wv9o=;
  b=Sa7HT8jpry8Hiw4kfR52hJXTgcmLxC94G6iD0A6T/aaTuViYqNkTbvDu
   B9rRtTfJ14JkvRGJAtGl8FMliTUXoRJyjIr0AqpqumF/1gJ5XgEz0FLw8
   2QrICCMluZO5YhR5ackCmcrEYmmKMj3rS3J4TlTbx5Yemcd8uIZJmXVr+
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: CTbfdcf/fACsiVi7YDd6doIee/5wwl0vAi1DdLV8in0J1TnYAphpAaEWqxxrqGMwR88WtwmVAH
 obigVlrdHMszCxRBdmGAYTN241ttM829lMHu/7YUpwCqPOJJW7d+qesBnTYXlSLcJdxxBdsLLv
 TiRtQqRzPi80aEVklQpjKCFMUYWpeOOfAlZL0Wnf2l4uX4K2FgEccWvNdJbzlA6ADEmJT8FqUT
 G2eluaza0KFDyIx3/Fq1v3yyveiWacK94yPquRpvvXws6rp4HROVf/iiFu67FLmuJlxVgdAm7d
 0Wo=
X-SBRS: 5.2
X-MesageID: 40103150
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:3X2oX6u3AigWZOmb8wbyEh4A7skCDYcji2hD6mlwRA09T+WxrO
 rrtOgH1BPylTYaUGwhn9fFA6WbXXbA7/dOjrU5FYyJGC3ronGhIo0n14vtxDX8Bzbzn9Qw6Y
 5JSII7MtH5CDFB4PrSyAOzH888hPyO9661jenTpk0dMD1CQYsI1XYdNi+wFEpqSA5aQboVfa
 DsqPZvjTymZHgRc4CfDn4KQ+DMq7Tw5e7bSDQBAAMq7xTLsCih76T0HwPd8hAVVT5OxrlKyx
 mFryXS4KK/v/anjiLNzmO71eUYpPLN6PtmQPaNhM8cNyn2hm+TCrhJdrWesFkO0ZiSwXkwlt
 2kmWZCA+1S7DfrcnixsV/R3WDboUwTwlvD7XPdvnf5u8z+Q1sBeop8rKZUaAHQ5UZlnPwU6t
 My40uju5BaDQzNkU3GjrCiPXALqmOOrXUviuIVhXBEOLFuE4N5loAD4FhTVK4JASOS0vF8LM
 BVEMre6PxKGGnqC0zxg2h1zNSgGlQ1ExuWK3Jy3PC97jlMkHh1i3Yf3cwU901wk64Vdp8s3Z
 WnDo1Y0JV1CuMGZ6N0A+kMBeGtDHbWfB7KOGWOZXz6CaAuIRv22t3KyYRwwNvvVI0DzZM0lp
 iEekhfr3QOd0XnDtDL9IFX8yrKXH62UV3Wu4Njzqk8noe5aKvgMCWFRlxrudCnue8jDsrSXO
 v2H55KHfn5Ly/LFZxS1wPzH7leQENuFfE9i5IeYRajs8jLIorluqjwa/DIPofgFj4iRyfxGX
 0GUD/vJNhR70yiV3Pi6SKhHE/FSwjax9ZdAaLa9+8cxMwmLYtXqDUYjly/+4WKJFR5w+oLVX
 o7BImivrKwpGGw82qNxX5uIABhAkFc56ilV3tLoAQNIl7laLprgaTHRUlimF+8YjNvRcLfFw
 BS435t/7isEpCWzSc+T9S9MmybiHMXrGmQT4gVn7CC4cuNQOJ9Mr8WHIhKUSnbHR18nghn7E
 1ZbhUfe0PZHjTyzbm+gIcMH+HZfdlkiAKtKcpZwEiv7Xm0lIUKfD82TjSuWcmYjUISXDJSnE
 R26LJaqqGHgyyTJWw2h/kYPFVAZH+MOq9PCB2Iaexv6+vWUTA1aV3PpDSBzzkvZ2Lh9iwp9x
 PcBBzRXcuOP31wlTRz1L3w/FZ9a2OHFngAFExSgMlaDmTJunF6zOmRQLG8ulHhN2cqyv0BMT
 3DfDsZKh5vwdfyzxKOhDOeDxwdt+UTF/2YA7I5f77J3HSxbIWOiKEdBvdRuI1oLdb0r4YwIK
 +iUh7QKDv5Du8zsjbl10oNKW1xqHM+l+nv1wCg5G+k3GQnCf66GiUse5gLZ9Wd5XPjXfCGzd
 Fwis80p/K5NiH0ZsSdwa/aKz5FJRW7mx/9c8g47ZRVt7k1rr19At3SVibJzmhO2FEmN9jv/X
 luNphT8fTEIMtibsYScyVW8h4gk8mONlIitkjzDvUldV8ggnfHN7qykvb1gKtqBlfEqBr7OF
 GZ/SEY5fvDUieZ3bMRCq47Iw1tGQABwWUn+PnHe5zbCQ2see0G4UGzNWWldqRBDKeCArcdo3
 9Bkqa1tv7SczC93g/evTF2eP0Tt2mmRN6/GwKKF6pD9cegNVGFn6ut54qygV7MOE6GQlVdgZ
 cAc0oaKtlHgH0lioY81yCpUKz5ok4/iTJlkHhav0+o3pLj+XvRGEFNLBbQjZpXVyRCK3Tgt7
 W2zcGIkHDmpCVf0ZbNFE1MbshDFtgZQI/wNTpvI6ErzcqV1rtqhD9CbhcoB3M9jz643/oO58
 bL5Mnv
X-IronPort-AV: E=Sophos;i="5.81,277,1610427600"; 
   d="scan'208";a="40103150"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJYJ+pfv4S5RhEonyIOjqhLfsoOSsBGYWwyvSkC6I0VsWdUiFel7Iorr+dEPXSivZyowfngjv60yqIwfTydxK1KaUh9tt6GsTMIMLBFEYOAafuyuhbYqTuHc5p4EVhs6OLSy8a4ivuNW3U4Cvel1YAi2SYUtEqkeSAKB4yiW0IMP91/HwNyt1A6eoFwQX1gfAHNKPo0Td7iJY+nMsPHTOTlviS0RHiU6dV6r2GMAVo+Iv9kXyv5VzoTwYITPQr/3rjzVbtxRJBBRQDVu524XCcGe9+euG5KRDpMeIZSdKJOM1GAqsKjr2v5EHWfVpbeFvhhdy6PPafyPhVubJzIm1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGJ2MHLAuNbs5BP8/NYIRG+tPK/zZRcQEYN5KT3udDs=;
 b=Bh6/KbBx9gV8oO3BKrsAoqXN9Ap3wgWER3VeeNVsbbi0/uJQYKuh0IHwSOGQxN7yp3OG9s7HFamtG5ISQEOolw8JCFrHRgpl2U7VVuj5Gqw82CFIyzJ4hxTIDVnGimwGO7igAXA6suEZan8NRy+Ny9h2KmbSlcOvAlIZo6nVwWHIMqWYx2bpUT9ecz5P77nPD4gfVfhEg4ZEauQsgXJJvzOVejqa0BzjlzDo3XVvc2YKG4sYutiZVR1u1KShgg4VwWkDmWQmIcBL5vlWZFNm3+BJbuegG9Jvq/jICkMiwQqhDFkTWWBkWvaBV2HuV6mjvPQfIAFzfnOiWMxc9O3VQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGJ2MHLAuNbs5BP8/NYIRG+tPK/zZRcQEYN5KT3udDs=;
 b=lHpUOlInbfxhehMIiGMpv8aXVaBDXK6NbqDvrrWah2fgDHVjT2ayBp5B+QddcTJMmliRAIext/5o6pEM+mBsdzM1fDsJx1wY2pJf4sKp5D1RmfFBMf2SKizrt4taHb3UO2lqZxEEsFJxhE35z9sf0EwHGkSzKwDAl7sbFnxkims=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>, Ian Jackson
	<Ian.Jackson@citrix.com>, Tamas K Lengyel <tamas.lengyel@zentific.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/6] Intel Processor Trace Support: Add CHANGELOG.md and
 SUPPORT.md entries
Thread-Topic: [PATCH 1/6] Intel Processor Trace Support: Add CHANGELOG.md and
 SUPPORT.md entries
Thread-Index: AQHXIMzvmFyPoyKUIUaoJhxXt5+/SqqUVl6AgAAT7IA=
Date: Thu, 25 Mar 2021 09:05:05 +0000
Message-ID: <0B436FE6-2C3C-40B9-A19D-275C3F46530B@citrix.com>
References: <20210324164407.302062-1-george.dunlap@citrix.com>
 <1fe59844-d512-805d-fefe-8522cccd59ca@suse.com>
In-Reply-To: <1fe59844-d512-805d-fefe-8522cccd59ca@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.20.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38fa6b1a-4e17-4598-0b7d-08d8ef6d1542
x-ms-traffictypediagnostic: PH0PR03MB5879:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR03MB5879DCB35CE1FE6E7CF2502799629@PH0PR03MB5879.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LbY2xOlva0iDjUmZxhMlaBSNjCUSrywoyBCn1FEarzk+bMzzVxwgQK4iSheRnND/OFwL+BA59wenTDh9qIxWrs44k3AMZ90yY7ARxi0HL/h0rUe8RdWMm80/JCfVT5Af+nXu9fQsV2Q750BbaqSYo5lZAF5ZG4ADd7RfOSyOlYghTMRqtYgTpq5Y6iPcvWsq9eeqSTM5bzFhWNKXuDNZZyD+BP70sG8rEnMbDxhRg+0tf6zubipL6ZPC3dOoMyUSRi4pPI/Pi3Wv8wVV9jjo0960PGDO7HKJnosCPV9s+6d0TmnVIP3C4Tc6u9HwbX+HxW3u6BnQrON5Q5dgRqUJqxIdoikfomXck8P4YWq2T9Ks/6P4vChh/bDT+2dYzjEYkiPCEQwRw8yKRwuioNVBj/Isw0cUY2WPo0fMtBaE3vQDH1BF1MheTaM8jWkBL41UoMKrMTH1A2Y5lDCTg+IXI8TZgBw3qgQmt8KWAu32dM1x6k0F0GsFgLvEB1ModR3q3f3BfRnHnR6AQMn04xgX4KmX+KdFqXkDrk5krfOosgopP+AKSkGbxVM1Nz57yMSgcR3VaacjotvqjvDQ+k0jJ35sBKNCbyl9rz24+wAWK2k7DjMhtm3B6H1SeTyvR42oJK+3pNjR7o4wyPJMsoUZrBJlVpCZ8tdCW0LBDWqi1vUlPgcde9ORDvNZ97G7eZd67T+sKmHqqG+CxlcENToBpoy1UDJJ9LeSmj9B1pfe/Z+TuRF5kPJX9feSg+MS35WD
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(396003)(136003)(366004)(4326008)(91956017)(6916009)(83380400001)(6506007)(6512007)(66446008)(5660300002)(33656002)(53546011)(86362001)(38100700001)(478600001)(76116006)(66476007)(66556008)(64756008)(66946007)(8936002)(8676002)(71200400001)(4744005)(26005)(2616005)(2906002)(316002)(186003)(54906003)(36756003)(6486002)(219803003)(207903002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?OEG2tPq0N/dqHVmSJNaNkda3JZ7BGZba6rYJRTwbL2KQSG2EtptF8EPUI7J+?=
 =?us-ascii?Q?j3SdQ7E24oVbJxg22NP8cph/2BGQgmK4XcKVe5P09eq/xgH3lDfnHgBdp4Pg?=
 =?us-ascii?Q?C2dZxPT/aLoCQEvcIcBDrJmLVgkVGTGdGjmgL463y2H75zj6hqDpkIRbMbVs?=
 =?us-ascii?Q?pxFKDTiZOtc03E5uDbIZuirRQSvUtT9QMlX0jyQEDZYV7ORhniIR9jU9mTnb?=
 =?us-ascii?Q?x9dE1A83qsHwQlNU0VdCcSaKe17GlHvYJzw8RMSTPsghAtFcCkDIwxIJVK1t?=
 =?us-ascii?Q?nk+L512Zzep1+g1dZAKkJHHZehsJwfF+39TWLhRwEcdt85eZE3+TdQB/uNml?=
 =?us-ascii?Q?5a0p0DkiXNNsf2oz54Qg0TAZvzdE/67MGgQUSAYWp1pqqb/ZBTp0VAwZxrpR?=
 =?us-ascii?Q?fgv46Ykfj7/1sWfqhc6C53dgLhcJnnmxZVJ3cUmQPPNGZjdirunslwVADU0B?=
 =?us-ascii?Q?MnpmjF+Ishn3Yorg0Z0jXl4zslyiDPSstxCcnOdqdbi4bpZkFdbpZ6YnPdEl?=
 =?us-ascii?Q?sVlkWU2ehJvs0QQYZuM+jTWnD2S4uka00nCzvfRzrpknVNjfRoOhqnQ1MG3f?=
 =?us-ascii?Q?MvyYvGGmaa4ydoCLAPRF/Fi4W2h3YtcVetP5qj401EIOde+osKlcT4aZsnx4?=
 =?us-ascii?Q?u3pn8W9EhqlwuQH5rFFefu30xPhkyGPqRBTkivPIwpYNXlv6+Mh+xPyrz3F5?=
 =?us-ascii?Q?gCKBPx8yCeYOgKcqjyQNSVNdbuKryX1sVDSRHtzTPhX9dpEXSeyMRXLWRWpB?=
 =?us-ascii?Q?ZeIX3quRZkphAKsNcfU1rGRphrt2jjMp+lBZBfK9A1W868wuKDaV7pLmteDV?=
 =?us-ascii?Q?UuAHNMZzdHdr6yuEy3473Yenv7VyOqTa58x/VlUZ88NPdN1XkTwif/DQ1C1m?=
 =?us-ascii?Q?8nXRp1owYBpO40rsZh+GzeP77OdA8sT1HLRttCNOjGJ/0gq42RivzrADP+aL?=
 =?us-ascii?Q?kIIlGEl3hc1fM1VQ/l3IYCG2XTE61JEGjwG7xg/jKnsbiNdOdmRalF2YX7s+?=
 =?us-ascii?Q?guaBfIMUkU++uj4KboDm4NdnylIijBvxdCL3cvA6IHD8991+eFaqkJ4mIEkY?=
 =?us-ascii?Q?K4IZmwhJ0ARvW8C1i7a55vDR21OdHIxWB/fWJohRDMZxcik/HyTNolHl8U2d?=
 =?us-ascii?Q?P03YLqdsG88AIfjdE7OkMPMb+e79WXwk3zLo65YI6EtaVHRhg46cTQQWnRgU?=
 =?us-ascii?Q?T2tZjA/zrOU6+dpaSp/164ucQxmdVbDVfAiMgFvHfZQi/TPwK3SU4qFJWb5L?=
 =?us-ascii?Q?irm1bl7/0fb+boiLTGtTPn9BiuUUuTIQbqnS9jR+ul7SX9jSUnndLHgS1Gf/?=
 =?us-ascii?Q?6FNc5UvOVlC6aUnxg4h5YS+ihev5O/YJGMPS8rdnD8YglQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <20F39B63AC951C4E91FA34B1197EFE59@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38fa6b1a-4e17-4598-0b7d-08d8ef6d1542
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2021 09:05:05.8366
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bKFZsssQ6S7MsnuH7uiVtL9zLT2tZxt9zkBql4oOA0S9xI234GYMTmdqP14a7puE6mKU57sk5DIH8G2QnEzNh+VXRBcfWU2vqoobJfav9g8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5879
X-OriginatorOrg: citrix.com



> On Mar 25, 2021, at 7:53 AM, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 24.03.2021 17:44, George Dunlap wrote:
>> --- a/SUPPORT.md
>> +++ b/SUPPORT.md
>> @@ -247,6 +247,13 @@ Export hypervisor coverage data suitable for analys=
is by gcov or lcov.
>>=20
>>     Status: Supported, Not security supported
>>=20
>> +### Processor trace support
>> +
>> +Support for using Intel Processor Trace technology to trace guests
>> +from dom0.
>> +
>> +    Status: Tech Preview
>=20
> While it may not strictly be needed here, perhaps for consistency with
> other entries
>=20
>    Status, x86: Tech Preview

Yes, that sounds good.

 -George


