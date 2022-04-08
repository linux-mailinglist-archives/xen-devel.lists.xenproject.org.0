Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 031294F9321
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 12:37:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301348.514268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nclz9-0000dF-QW; Fri, 08 Apr 2022 10:36:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301348.514268; Fri, 08 Apr 2022 10:36:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nclz9-0000aG-NX; Fri, 08 Apr 2022 10:36:59 +0000
Received: by outflank-mailman (input) for mailman id 301348;
 Fri, 08 Apr 2022 10:36:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rWku=US=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1nclz8-0000aA-GL
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 10:36:58 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d062d2c8-b727-11ec-a405-831a346695d4;
 Fri, 08 Apr 2022 12:36:57 +0200 (CEST)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2059.outbound.protection.outlook.com [104.47.5.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-EVXCirVYMP2302s_yuqJ1A-3; Fri, 08 Apr 2022 12:36:55 +0200
Received: from DU2PR04MB9067.eurprd04.prod.outlook.com (2603:10a6:10:2f2::10)
 by AS8PR04MB8231.eurprd04.prod.outlook.com (2603:10a6:20b:3ff::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.25; Fri, 8 Apr
 2022 10:36:53 +0000
Received: from DU2PR04MB9067.eurprd04.prod.outlook.com
 ([fe80::a4bc:f02c:559e:8afa]) by DU2PR04MB9067.eurprd04.prod.outlook.com
 ([fe80::a4bc:f02c:559e:8afa%4]) with mapi id 15.20.5144.026; Fri, 8 Apr 2022
 10:36:52 +0000
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
X-Inumbo-ID: d062d2c8-b727-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649414216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pxr2FxyNIlWpLU43N2xrobkIYb4Dr4GMzwO2XMKzp34=;
	b=bY9k2cO4/3qzAC8OFtKjqj2DFOYyVVx6X4RB4G88tQsi+FKe9O6j+9biRCiTIIugWeXULW
	bc5uA9PX+JSjs2AYBvrb4C0wenEAI65HmZn++QcCRz4ZgStHk3pE3XJ7QKG3KiE2RYhFTu
	xujcCe0X9jCnVVePb0zEFCO7o2XBowI=
X-MC-Unique: EVXCirVYMP2302s_yuqJ1A-3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cUqdgOQXPuSI1oXr2pkuwiQniPve/4ZuV/jsDt5BxZz5ScgCvnvyFBjGBQCFe39jwtvCSId765GDeNmDDM13/MeP7JVB/dOIIEBx7UEyCT97ShrX+xuYyT2GnP/sPFA+gTVQ8pPsLNolzhSUStk3LsovaFgw6wVgiTPlVlIGnyRY9Wp0mVfgiKU/5RIN3vu3kUScMb/YHzfCYBB17EmT4nOFATiQLo6O+NR27dh7sY1D3ntFdwHGrwOSkxCLq0n2rHxdpPeC5j8I44oJ673UwpEbI183kppGlTqECHlEF2ScDS+FsC0RUiozcDz2IXi8UxGfwNgcbYVo347xCRjnrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pxr2FxyNIlWpLU43N2xrobkIYb4Dr4GMzwO2XMKzp34=;
 b=LM/Eor/qQSaDH4EHlIjm8FjkuYxgGm0WfwbBnZh1xORKqygfxZRoZkTmpfLmD4M+1J5vlq6cI9gJHvEDZ/pUCrR9lT5XCH9CcUKqRKNeJ7dEnfOMDq31ePfYWLY2VeQ1i7tM9ihn8A9s9Pn1bc5l+waG+LnQ8WRw3H9uHjJMq0xfzdCZDEooSK531IkX2mIk47jFl8tI5na4Magsk2+cxdSzccJQqcxaBDXg2o1UUmBIqHnhizIsYvaF8GKcxcLlyLmmxr3RRjivRygmU8QnZc+XPymqVVUzIuNlAnqYa5QixcE5RxVtgnujQU9LuHm9qSlMev3Sx9eIqg0+pVeguA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <JGross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
	"wl@xen.org" <wl@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>,
	"dgdegra@tycho.nsa.gov" <dgdegra@tycho.nsa.gov>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "dpsmith@apertussolutions.com"
	<dpsmith@apertussolutions.com>, "teo.coupriediaz@arm.com"
	<teo.coupriediaz@arm.com>
Subject: Re: [PATCH v6 9/9] xen/x86: remove cf_check attribute from hypercall
 handlers
Thread-Topic: [PATCH v6 9/9] xen/x86: remove cf_check attribute from hypercall
 handlers
Thread-Index: AQHYP4e1Btli+fX6E0anyJstROAZBqzl6g2A
Date: Fri, 8 Apr 2022 10:36:52 +0000
Message-ID: <85a8542e3eb6d5c8aa182fd291faca45d1c0ae9b.camel@suse.com>
References: <20220324140139.5899-1-jgross@suse.com>
	 <20220324140139.5899-10-jgross@suse.com>
In-Reply-To: <20220324140139.5899-10-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.0 (by Flathub.org)) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0937b406-08ef-4a92-6423-08da194bb23c
x-ms-traffictypediagnostic: AS8PR04MB8231:EE_
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-microsoft-antispam-prvs:
 <AS8PR04MB823126810822BBCB83E23447C5E99@AS8PR04MB8231.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 IUEUWG2JRktRrWXajgo3fONp/4nMlw+yBFZdUsWDIrw7WW3Go5mRBag4M/RraZnIvMbz/OlboFBuYs0P3JiN2p9Dt/rdQaYRIOHmrL2INMbQ5AdLyDHPvNpQuxJZ5xkNfQCDH8NeulOk0c5egYRfhJq5Sor9jh85N3tg4xl++sL8NbozkfkTwqZ+0aZm5vn9/HaRoxO2V1XV1pK8Npu6O1IngS04rSLa7QsZKnOpOsL9O2STBfECK1JiLrK97ebZK0ZP7szMCMmHHjtHLz3J38+IPncrlYlW/S+dEwoKFtIEfSiFNINubXrcnjF2CZLmKJJvrrbmnvnwTEI/TkSNFiRKzdHz/tMfaIQ+hoVOx12bgTSLL9bec/pZTkG3MSA5ejJMHnyUYQebY9aNcOuDPPdrgSCuTd0XVemV8ckChEu54VhqoUsKH+lg1WgAPm2f6bggpJKRe6XiGWgYkNTZrOZC23Bw5Q9kfXohMU3+wIyOxvRKw028WVHMSfy7f5Gjvt7gK6ofJ8Nph/bvlT83ojKEt8JlQpugQldCZ1lVNR2AwzT48s8h//WO9ZDrN0uWGwZrR4QefSuk5Y9HaoW7vkJxUi+2HTHejn6B2YkU4p8qh06mS3ne/JQAnDYTasvKqt3tRPtXPrXZ4vaR2lISGvznchmRj1WLA0BVmE956mTnu4RJqkWkMObcqfHi9R4ip9uWF75e+kbGJbN/J2/vcPrn3j26dnZr4mdX1xA65o+ZovLUXLaJFspSdrXdX33IZQJB1ersN2Jdral5lfuWqL84Hb+55LHCyl0YG7vOFCejDbsFUbOxTe8BEy3UC7CvMwsDVE3WgSX8ZEoRltP7Xw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9067.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(7416002)(4744005)(8936002)(966005)(508600001)(5660300002)(86362001)(66476007)(38100700002)(66556008)(66446008)(4326008)(8676002)(76116006)(91956017)(38070700005)(66946007)(110136005)(64756008)(54906003)(316002)(99936003)(122000001)(2616005)(186003)(26005)(6512007)(6506007)(36756003)(71200400001)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dkxGYUxJM3JkcStEK1dvNmI3Q1RYa2t5Mkh3cGNBNi81NXYzRkh0Z3psclpT?=
 =?utf-8?B?S1Q2ZmNXbjBrd0RMV3VYMFJ6eU1WSGtqd2VTaWJkeVhiUHhvOTZrcDlaVEk1?=
 =?utf-8?B?TTZlVXBzNm4xTEdWZm1ZZEFDVzJXdHcyN2c1NVlZNkFSTlpZRlcxVWJOeTBV?=
 =?utf-8?B?dllHNllucHdQSnRncXVHbVJURmhyQUlhN2hTVzhJT3k2L3AxTTVSRGJCMnA5?=
 =?utf-8?B?LzZRMENiRmxsZElhOS9FMFJ4UXQwRkNqMmw3RFplV25YNzNCV0lMQ1MyUk1Q?=
 =?utf-8?B?ZGVKMHFWM3VGU2Uzdi94RmZDWG0xcHJwOVpYS1VLVTEzU20rZFhQbS9qZE50?=
 =?utf-8?B?R2tER25yQXFIdXllSXpmdVVyUFA0RHZkdXVScTRxQk5nelpSOUFzNlp0d2Ny?=
 =?utf-8?B?S3BHVlpESWNyMUErQmZPOVNBZ3N1bXgxeFN0YUwwMlJkMzg1NEl6dTllVU1a?=
 =?utf-8?B?SzUrNlg0a3M2emFVUVB3Wjd0NXdKMUtyN3lxeWY1bG51L0tkTVhRUmpoYjcr?=
 =?utf-8?B?c3RhdzZVazI0aDd6bjI2RHFOVlEwckxPYU4yWkRGN3N3NG9IZHF6aTFsRE5q?=
 =?utf-8?B?NTcrM05zbG9UNFdoMjI1cWEzR1NBc1hYSFNxWldZUUdFeFhXMFJoR24xSDhE?=
 =?utf-8?B?NVFZdVlmNXB1WEhSNk9kSWV1WTI1S1JmanV2aDJFcDhrdTUzUzhsZEVpUlZr?=
 =?utf-8?B?dllwWTF3NW95VUl5Ujh4RmhrNTFVUGl4UE85RHdMNXZ2UTQwdHNGaEcvZ0tE?=
 =?utf-8?B?aUlHZFZKRkNQN0JGWE5kYjArRVFzVU9pR3JYU0VoOHZrQ0lOMmtGQVUzQ3Ri?=
 =?utf-8?B?NTg1cCtTd0c0Q1JRbmovL25RY2E3cmNIZWdva1c1ejhza3pEZTBjZ3Nvc0p2?=
 =?utf-8?B?eWozT1lUNmVDU1NWT1N6RjBlN3NJa1IzcVVCK3ExSUxkeEFQSUxmV2xSMkFp?=
 =?utf-8?B?OGY2dVJJTHBORWFiUUpnVGZDNllSb2ZiaEJFeGlCSjVDMit4VEpIanViN3Nx?=
 =?utf-8?B?V3FsZElidWlWZFVwSHdGR2Yza1FnYmpOa250eS91eHovOUJZYlZsdjNpN3U4?=
 =?utf-8?B?OEFGNjVzd0Z5aXdLMk9lamh5K1RHWUdJZ3ZTUU5qTW9rZkpPMCs5dGc2RGlE?=
 =?utf-8?B?cHcwWnZwalVYTDloRXZlc0ovaXJaTWdFdWowVTIvdEM1QmZKRC9VUUwwYnMr?=
 =?utf-8?B?OUVHQjRWWEVRNUNVOEJ1d2gyS3huZC9QYUVHQ1dtTnY5UDgrZHVnNEM5bHZ0?=
 =?utf-8?B?N2VwL2NBQ3h4T0RKaThlTDU3REpCMG9aVXdQNU0valh2VXlSTGcxTjZZM1lT?=
 =?utf-8?B?NGwwTC9RV0FUNW1BTUl6cHVVVXFwejVPdGluL2VXSjlnQWxvbStCdU84c3pD?=
 =?utf-8?B?VEZYVlFGWENBTm1lU002S0h3ZzZTRXh6Y1F0a2lpQWxiWFVOZ2REbE9QZlZt?=
 =?utf-8?B?Rzc5UVRHZ0lkbUt1eUVjZ1c3NlJNeUNuZ2xpcGVkczJObnlOT05leGhMK2VP?=
 =?utf-8?B?YU81blc4cEowV0lsV0x0bkRTUUVja25lS3pDWTBvMXVmNjM5eTkvQ0VyMTBN?=
 =?utf-8?B?Z2dkRlhsM0lKS2tsVnB3ckV3MGh6WnpUN1l3Wjg1SkhZRGxJMFpLNnZkdXRO?=
 =?utf-8?B?SUxFZFI5SXNxbEJjZVpjVEZKakxKemU5SnU5bVFnREtITnJnVVNsWlp1RUJq?=
 =?utf-8?B?WlNseXp3L0llU2wzNS9Ja0xNYkJWNEsxQ29EN08yMXYzVGVTWUI0L2Nod1Mz?=
 =?utf-8?B?TDU3cERLTHltYkQyUlNlY2xzN1FCMEd1c2ZXNG83bFMyakRHU2VwRmMya2pq?=
 =?utf-8?B?ZmdRYm5HUjBjWkZsNHQ0eWlZcGM1bENyZ0FDdGxVQVlTU1pZL2cwZVBSZWli?=
 =?utf-8?B?aDA4c2N1N2pTZWpXK1JpTC9xNjhhZWlkOExRRDdrbFZOWHlzZnhiOSs0bVQ4?=
 =?utf-8?B?MjR5bnMzYkI5QkJCcFE1eHFSbVZ5bWhPMnhjeS8yNlFCVm90Ykp1ZGs1dnFX?=
 =?utf-8?B?U3ZIekRsZnI1NTA0Mk44TWIrZEJjRUlBUXlxekY3cFdwM2QzYTU0TU90ckRo?=
 =?utf-8?B?SnpXTDNDandiUkJSd0RZSVRpRUlEdmF3Rkw0U2w5cytMRE5lakRUS21ORkx5?=
 =?utf-8?B?dGozNnVhSlpod2ZoKzRTMmw5UUZaRzNLQ1o2N1NhSW5MYXBwT3UxSS9tTkFU?=
 =?utf-8?B?R2RTOUdvSVR3c3R4M3hWQWZQTGpwZ0h2S0sxdXJoeGNEUUdCWmR6UktvT2xW?=
 =?utf-8?B?U05aQ2F2Q2JsWE8rRnZWeHY5RS9BLzYxT3pQcU1ZdDF6S1Q3V0hPd05vNjUx?=
 =?utf-8?B?MjQvdVBqSk90UHFwdWxIclpNRGh4VU1iNUgwQndnQ2ZrT0taSWtOZz09?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-FkS4YUeNE10+g+qGb+wv"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9067.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0937b406-08ef-4a92-6423-08da194bb23c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2022 10:36:52.8953
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9TPz7Sxoqrq8sJ6a0NjEtlf51DRG4qljKcbBPdTjIPX+gUbq7mEtbRjrUl+Ee91oA8DRxiPPzy/qPVAzd+BLgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8231

--=-FkS4YUeNE10+g+qGb+wv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2022-03-24 at 15:01 +0100, Juergen Gross wrote:
> Now that the hypercall handlers are all being called directly instead
> through a function vector, the "cf_check" attribute can be removed.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com> # xsm
> parts
> Acked-by: Jan Beulich <jbeulich@suse.com>
> Tested-by: T=C3=A9o Couprie Diaz <teo.coupriediaz@arm.com>
>
Acked-by: Dario Faggioli <dfaggioli@suse.com>

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-FkS4YUeNE10+g+qGb+wv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmJQEEMACgkQFkJ4iaW4
c+75bw/6A7+0qUlVCN/KNSm41aY85S+FDRTzAV4C639E4MomzYztlBoOs5pNkMa7
MA9IXgsKV+0hfPGzTLrHd1xwLfA8JOzD7t/dzQR0XYchxVRi6+GVPtb0dwzrlmq+
bS5ho+94qXcashqfMwvpip83lP8n57n0N1Otm6yEMPUr2RoBieGWu1mgf2gZ10Yf
av2IDY5TCT5Q2NPkeqjESv04yXhpRYVBUFGnWKEx/YF9puEYoXYgREgEseJeBmhY
9czpaSvNafAodpir833UnUCQRVn2nqhqxGVTWc0xjoYqLUyfTb5wJ0OGfWpDuib6
RpQfDEahMVqKxzIA5DRoawjiFpKt4NUt024BDGzN+Dm3WNRRX3G8iMgtxCroSVEC
fDShvM0Xeg8kF9e14wmXzTdOpk2cznvr3+J5QVfK50vm71WEbap962u4/AbwZFVF
b4Qag1DgZgpqWULnEM89YPtEkBuaS57MIZw7pDu2ry44O8DuTjsP/4PQgTugi4lY
Nc3TGA8DmGxx76bgxFeuWnrfmMJAoBbsYm3emWp0wYxZMrHsw8O52qY+HvoiFfl2
/S2VD++OqfQ8jMNmeD2oRlH8wvBxW7xaVc5fiQDd6wksC7+/ymvW9MDarWocXz/o
DAKS5AWI52JcK+9BmPuPyH4RjjQMktDD7rbuu6nz3hmFeFNrbJE=
=eD2D
-----END PGP SIGNATURE-----

--=-FkS4YUeNE10+g+qGb+wv--


