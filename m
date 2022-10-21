Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB03D607469
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 11:46:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427512.676647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olobX-0004uI-RR; Fri, 21 Oct 2022 09:46:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427512.676647; Fri, 21 Oct 2022 09:46:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olobX-0004sB-O7; Fri, 21 Oct 2022 09:46:15 +0000
Received: by outflank-mailman (input) for mailman id 427512;
 Fri, 21 Oct 2022 09:46:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VH1f=2W=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1olobV-0004s5-Rm
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 09:46:13 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2050.outbound.protection.outlook.com [40.107.103.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f0c5aeb-5125-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 11:45:13 +0200 (CEST)
Received: from PAXPR04MB8366.eurprd04.prod.outlook.com (2603:10a6:102:1be::12)
 by DU2PR04MB8824.eurprd04.prod.outlook.com (2603:10a6:10:2e3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Fri, 21 Oct
 2022 09:46:10 +0000
Received: from PAXPR04MB8366.eurprd04.prod.outlook.com
 ([fe80::64e2:acbd:4d56:fcca]) by PAXPR04MB8366.eurprd04.prod.outlook.com
 ([fe80::64e2:acbd:4d56:fcca%5]) with mapi id 15.20.5723.035; Fri, 21 Oct 2022
 09:46:10 +0000
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
X-Inumbo-ID: 0f0c5aeb-5125-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FXr0xneFeqF7t5efilawGLaNeFH72IvwwVoPsrpOT0ZTOflJVBz/NDjwNv7G5g2gV4k5aD8v30H5IjW//6OIFMWUrbNKi5g5EOlYrtSnOBtHv0xEHBzuDkpmdy9zpLAARBC2Hw7jK0UFGbijBDn+TXnTp867XDKGjDUQ0EHq5LscoMptkRJKoFd+zagDo/Ys96dw/9Gggrf/2gYQgQaYHkee219PL2PRLaskdMiYcWPr2vFtoSPww3khwcX9RDgfLu4iG4ihFTd+QZWqdheg47HfLVq4iEgwJf1S9CMXL7Jdf7WaFwUAL5DlHxlcwha3p3lCwntUVKAglxktW9pj9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pbaUhrPzOyoQfGzuUbY90ly4Jm7GEJnjoyzzbmaYVYY=;
 b=D84scHj+hcFQ1TaxrIIouHbjtjBBQAWGAyUfsAobBPJtKFewWplBDVFY0khyBJzUacYVv8euJPuYu/sDG9dSGfRgEax88PqJV0wZBUSqpXi/h2eKysowUta8X0Mk2LJms9xocgCjpbbSn6pnHDYg7Mkyyv1NsjBEZRI8fMRzounX9Rb2aHJCw+fTQZ2Q6+C3RuZzQhHBMDMh8uKR/zbpTWDy3kwGt109OSkEYcvtFAhKnvSRHQPLKTftZK3A6yhYBzu9cXe/HDOaJP8s9rOx7YD6IJIt7QoY2G6G8KBdytx/LaGUkCJwjwe1xileLucQk9gWYDhCwlTCgkITIfUGVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbaUhrPzOyoQfGzuUbY90ly4Jm7GEJnjoyzzbmaYVYY=;
 b=aBHfG1stdPXdgMRFaNTSJsJzbCRw0hgwi+hbCJcZLtgQkWC4ZGjLrIWtI9Kq2c4Dj/AymvATu2aQ5pETMbvsSh12J8WYcM/anMtGsSoncQLACI8tnsQ1mRugVkzxUu6QY/0/3Kh1emJznrHfUqNHZi9VRY4XA/y5VpHtfeoewKeXD1N19ZIxYfY6BQlr7R5Lxh6urCdDtZVDqqvxMyaaLXoeCHEg3k9wJ0RBYjOtEOEbX2A7v6LeyQLyde0CYfJCUNhZQcr/djcQalCkOyup9qIkyxBsWqQKBepiwnQQ8HfGCAJ1R55S2hql+O5+n2WHzFMwjwMgm5L5v7SutdegUw==
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, "Mykyta_Poturai@epam.com"
	<Mykyta_Poturai@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>,
	"bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, "julien@xen.org"
	<julien@xen.org>
Subject: Re: [PATCH 17/19] xen: don't free percpu areas during suspend
Thread-Topic: [PATCH 17/19] xen: don't free percpu areas during suspend
Thread-Index: AQHY2jgm2f/PHlobT0esfUs820FvA64CyFEAgBXnIgA=
Date: Fri, 21 Oct 2022 09:46:10 +0000
Message-ID: <ce5af168d2889aca8e4475da9103f3718213836c.camel@suse.com>
References: <cover.1665137247.git.mykyta_poturai@epam.com>
	 <37f0f84cdaf47b1efda59f0368998183dff88a3b.1665137247.git.mykyta_poturai@epam.com>
	 <87437234-02ce-b18e-8442-c081de259ed9@suse.com>
In-Reply-To: <87437234-02ce-b18e-8442-c081de259ed9@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.46.0 (by Flathub.org)) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8366:EE_|DU2PR04MB8824:EE_
x-ms-office365-filtering-correlation-id: 3fb7b11c-c8c6-40f4-588c-08dab34915b4
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 wPgd9+KXZ7FiPGylkM5puNy2hHAUHrj0ELjN0eD/3AyJin4arZ/Cpaf36NfzHGVtTly8xV0tkhyQ9F1XZna/xG5AYCclTqP5/UyfpAI++ARShlKr3gi+Rb06qD3bMTHcQ4TvQvyhBJ08V2p4babhifEyvmKGRl3uBQrmqLDb598CQEHwHA5NOXxTffwLvCTdLpXo8030Vr5ACKrPl0iFs5kacRm8X/g2bL2wxxmUV9b69lV6RYF8DwcAAA5lxeOBK6YFAN0YsLIFoKBsYlffhFlFTyMhs/uwHxT6CUb2P+1Esd8pzWxC1U47Osj8DFWNggXVo8yFtpWys6Yv/HsqPvHwZtU7JuS0Caofiinm04mhbT4YVThnP6ZBWObBM26EvT8GT9dm5uaZlziChtKIhl0v51xKlUq3lQw34DYAVjjjk07/m73dy9TyFCYHMl8rDX/4vhytYDpJlsSxLh41iswNAx1XUAJAaXEEt+vfH8KziJse8OfkEBwmPjvUAnWVZY7WQOcd60DqAf64L1fHXeQNEh9vdM3vg8QOVbr1MPcBtGMYpsUtTGcGx9XFhFwFQxWJX7BZsBnaSqmk/3FrwX94H3JBZBv7gy8S7Kh1HtBL7pvHzYoKFAkt4drqqPKM//13crtYF+EJjIUy6Wa3A7TkfMMVIMh4VSnhcRHpSNSW3wKt9klwYbMjQXBq50RRfFSqttBL9RgwJIxhm6SBpfpp4GfkRnlCH9ENpdl2qzT7iMWPUH6LX+HwSFSaeo544dUnp/lwNhLrxkILrbeqJSl84Czf5Aafyljo+aW8ujuHn4cXj+ryAQS29MsJ5RsqNoedzKwLUN2h7YmPaZPLAw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(396003)(376002)(136003)(366004)(346002)(451199015)(86362001)(54906003)(2906002)(38100700002)(6512007)(26005)(5660300002)(4326008)(66476007)(8936002)(41300700001)(91956017)(53546011)(8676002)(64756008)(66946007)(66446008)(66556008)(76116006)(6506007)(110136005)(4744005)(38070700005)(316002)(186003)(2616005)(71200400001)(36756003)(966005)(6486002)(478600001)(99936003)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aFAyMlhzWG5WMjJZU0x2RU5OdTZlanVUN2lucjhmVDVRR2grTldWOWhhVldh?=
 =?utf-8?B?SEpGZkFhNFR5WVZaQW02a0xjSFh5MWpYZFNkZnRFUWl3cWJUZjhkQllhL0Rn?=
 =?utf-8?B?S3cwYm1FM3BJOFhpRUF5TUdvbmtlY3ZPU0ZRQ1hKWDh0Ull5ZnJEZmoxODZn?=
 =?utf-8?B?WVYzRDd1OW1EUzl0OUs0Q0RWZkNpZHE2UWJVUFJ6MVcxSFhmMjRlbWFwRWEv?=
 =?utf-8?B?TkJmTlhXaTJhSlhMcFE2UVhPQ2hGUitkaktKTFo3clA3N0RQT1EyR1FrOEdZ?=
 =?utf-8?B?VVVsR0w3aUFaSHdlNkNvYS9kTEZxSmlPa2hzWjdzUUZ3YS8rRkpRYllzc1li?=
 =?utf-8?B?RlFqRy84bWt2NXIxVXdHQ1N5TXJiUlhCTHFVTFR4cGpHTjFETGk1ckl5OUFk?=
 =?utf-8?B?eEhBZS9jdldDK0l0MVk2UnA1T1d0NUxBVVQzNDhEbGVmejdSeUZhSGF3V3BI?=
 =?utf-8?B?T3BpOTBFZm5zbVpJOUVtWnNzWFoyRUMwaitBRkVEcGJxcktBZERvNGZIL21P?=
 =?utf-8?B?eEh3VFJBbURCOGhmYlRsOXZkczJDVFZUUDhTbk9FblUzd0MvUEZRR2NzZ2ho?=
 =?utf-8?B?NFNpNitBZmtxelY3N3ZQWTRUek12RlU5Q1ZWRy9LR2FZd04xNENRMHpXV2pI?=
 =?utf-8?B?MHVCZjlQZ1g1U2ZQbjNqNm1VNGZjMmZMZVVuM1ZDWnZ4MHRNbWhYYnIzYllX?=
 =?utf-8?B?Q29JblMrZGFxdEo5QjFjM1dBWnpDSUU1V1AzNG9sNk9VeHJycEtHTHBoNzNm?=
 =?utf-8?B?ZXNJeE5UckY1ZTRHQ1FVbFlBT2phQzIvOTBzaE44ZG1iQ1AwRVErUGlwQVhp?=
 =?utf-8?B?VlpCNUI4VG42dWxEbmlPRUdqS1l3NExZS3o2WGFEdmQzY1VWRlNISFBvRERF?=
 =?utf-8?B?UW5kbmc3cXZUaVVNQU5Kcll3RlJWZnFJNG11Vlk2SUpwdGR2eUU0L1pOT0NG?=
 =?utf-8?B?dTd4SWthWUlVL3FmYkErTkRmMC8raDZFU2tYWkloQTB1QjZoVk9HQ1FMMnA0?=
 =?utf-8?B?VkpQcUNwQk0vVnUrc29ONWVUeHpVbGZmekdpUTJTSzRTV2xUZElzVWl2aEJs?=
 =?utf-8?B?ckZQaTBoMzByZVF0SDQzUnBPa3N1YXFWTXB1bzRZbmJGRnQ3V0RTZTY1dUtH?=
 =?utf-8?B?cmM4YW80ZzF5VFpRRnZya2o1c2pQVzdCTXBBR2tjS2RWL3RYQXFtamY3eW5Z?=
 =?utf-8?B?TkM1VU5EbHM5cC81ZlBWMTVMdE9BdU5VODZsTEVlTUltQ1JvS2Z0ci9FV3ow?=
 =?utf-8?B?ZURBb3lLVUlpVklLZyt0MFRrQWJoUG81blNrK1l1aUw1bVdScGxMUGFqODZW?=
 =?utf-8?B?V21URVNwMnc4SmVCcHIvdnI0OXo5S2hmSDNLcVNXWkZrQjVUZ0tYUEM5bWY2?=
 =?utf-8?B?dEJUc0g2bDBaYzBrdWV3cjg4VGpaZWZBYzJSUXpYd24rZGxKOG5yRHBhNFEv?=
 =?utf-8?B?ZkdNamxsQ2tGRXlUK0t2TlRQQUd4R3IxQ3lQZC9icnNWTXVFNjdLOHZDRFVP?=
 =?utf-8?B?T1hlekIzaDRMaDVkRlFDT3gxcmlPQUpwcGR6d3ltcE1ZRTArMTBNcXJiRUti?=
 =?utf-8?B?THdRZDZhSC9UT0JheGFGWFYzRVVtdzQ0eENLYXpQUDR3Yi9tbkRTWnh5LzJK?=
 =?utf-8?B?UXBOVmVIb1EzQ0J6dE80ekVkT3F4OEZVOXJybmlWdDlzY2t4cVNKd0xmeUd6?=
 =?utf-8?B?a2REb1NrQVdmaDQwM3VhRDRlOS9kclZlTlQ4R0pIbUNDT2YwTXNaeVdHTklt?=
 =?utf-8?B?SmRIR0VMeU5yTnMwZlo3NFEwSFhzTXBOTHFJSmV3Wi9selJDSDVnYU5jUlVl?=
 =?utf-8?B?VTU0djRtNitTVk03dmxrZEh0aVY1cW00K1hpOTN1K2dmd2docGozUXRCNVNJ?=
 =?utf-8?B?ZFI2UVQ0TlFETnJrc25QOEZVNSt6MzJLTElieWlYcExrak1JQ2Q0cmhjbEFQ?=
 =?utf-8?B?N3RtTmJpVThLMmhFTlljaVpMT1VKWndscTRCUTZhL1h1dkZ4NWVXVjVycFRE?=
 =?utf-8?B?REJFZGQ2Z1pGR3V0WitkWjUvZ09VbVJSQ3BiVk5vNkNQUENmQmFRY01kZkRT?=
 =?utf-8?B?cWF6bFFBK05aVTJ1ZVk5dWM2NlQ0L3RsMnJtZ2JEZDdFUjY0bEY2ZFh0ZmRM?=
 =?utf-8?Q?D0+MsoCrG347rMQQEGwzgCzoh?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Fivi7lOC3uudUZC7hjLu"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb7b11c-c8c6-40f4-588c-08dab34915b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2022 09:46:10.4471
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nf+Czuk2hVn11LJWlDi0p/IL8QdbW55OYC6YGznegsa7Ue7o9d/h070NO2nAzejt/phudGxoy59RtHsncKFK4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8824

--=-Fivi7lOC3uudUZC7hjLu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2022-10-07 at 13:17 +0200, Juergen Gross wrote:
> On 07.10.22 12:32, Mykyta Poturai wrote:
> >=20
> > Signed-off-by: Juergen Gross <jgross@suse.com>
>=20
> I can't remember having written this patch. The one I remember was
> for
> x86.
>=20
> > Reviewed-by: Dario Faggioli <dfaggioli@suse.com>
>=20
> I doubt that, reasoning see above.
>=20
Right. In fact, I can't find any records of having sent an email with
such a tag... Or to have ever even replied to any patch sent from this
email address, for what matters.

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-Fivi7lOC3uudUZC7hjLu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmNSamEACgkQFkJ4iaW4
c+6wAw/9F+ahc27QyR1p1WBN5DC0eDHukQpPt+zcA11klyZTlrfKWgFEuXTYnGFD
azjILH486qV5VHHmV5EFG57wavRiGuxp5+Sk62FzGWfkwJWq5nqUC0+PZAzZGMoJ
5K/4nxaKKawgKEw1FmL3BQaIWjpvAbVTca5Crb2y+u+7q2co1JIOfO7VisEDYIrK
oRgSEMOEyEu9ShtUB1exZScrNUhgOD9JHaMNMEWW0ZFxtpvE/mxydwZopHmHIcKh
D8Pz1REhXUFEyiJPlWHgdWIiehdZbgCxYQMsqsMKHsrw27hdmzRQfexDOjsTclYe
vUs4H4sEyv+lNxP6GP0gc9omcknnEr2li5FvYpB6CFezb3h59B/3r42k8nAzYpy1
b8dVEsWbrodBr3JhC8mmDV2m/tV8vJ6s9ApUvkCBguca1YS95pH0sV66xBudRvn9
IWLB7qGx1FCvBDR7Me7gp8mT6hBoAeXpGffYwpusO4L4WPoJR6nfkxmEE8ctt3QB
8yrUsR46Gi01Qeslu5LtotiGTWHl3gdhkkxA+Xm9vLPNG6188FAQbIdkxaeYOt4q
OwkJfldxOVWbv7X2+j2GNevFqdTw+w/wnGIpwc5saf/FAc9ui0z/38hzXTqgFk6I
tELrqBUFsDMskUpu+p9vqO3osjMqkh+ty9I011xyAwoqf6sRkFM=
=Z8zG
-----END PGP SIGNATURE-----

--=-Fivi7lOC3uudUZC7hjLu--

