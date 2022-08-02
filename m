Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B09D4587577
	for <lists+xen-devel@lfdr.de>; Tue,  2 Aug 2022 04:15:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379177.612431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIhR2-00029p-OH; Tue, 02 Aug 2022 02:15:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379177.612431; Tue, 02 Aug 2022 02:15:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIhR2-00026Z-LA; Tue, 02 Aug 2022 02:15:04 +0000
Received: by outflank-mailman (input) for mailman id 379177;
 Tue, 02 Aug 2022 02:15:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MHYI=YG=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1oIhR1-00026T-Ei
 for xen-devel@lists.xenproject.org; Tue, 02 Aug 2022 02:15:03 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50040.outbound.protection.outlook.com [40.107.5.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9be0756-1208-11ed-bd2d-47488cf2e6aa;
 Tue, 02 Aug 2022 04:15:01 +0200 (CEST)
Received: from DU2PR04MB9067.eurprd04.prod.outlook.com (2603:10a6:10:2f2::10)
 by PA4PR04MB7904.eurprd04.prod.outlook.com (2603:10a6:102:c3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Tue, 2 Aug
 2022 02:14:59 +0000
Received: from DU2PR04MB9067.eurprd04.prod.outlook.com
 ([fe80::61d5:254b:6ed7:edf5]) by DU2PR04MB9067.eurprd04.prod.outlook.com
 ([fe80::61d5:254b:6ed7:edf5%4]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 02:14:59 +0000
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
X-Inumbo-ID: e9be0756-1208-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJjOvy38MKOXDUQz4yom2PuwkQ9ADf2sDoC7xWR+YmB06WAn31+J3N2mAthrSrLk0jM144iDMbnJxrJPE7cYV90JMvyND/HBAmKOk+Ki8mxcCa8LmF4uFMpBSU7qZ1DHLvHKr5TLG4vXi6OQ0CfQ5itL+SqX/NG12VjRPfc6udm9/ZTKNKAmcMXkVJRPC7SsiMYLS5r8daQOSZT9uKsaafl1gOR+fZQa2s529MrV2mjrQqtUrpaTLbDF8gtN2T1KvyNzmdbek4VLnunmXknT+O1uthtqFaKxdl77DE2+LGRTQcnij00wCGXoh7T3xZZSz5RGmYTk/qSplLcGMbyapw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CeqCW4J6V6zqRNDvvLFKqogAuC5lXlM59xAIAbFfLVE=;
 b=eDD9DGu59poX/7o52ELuqZgW3d7Zmml4aNgdToDlIHuFxEM3gT/UXsBhPAzJxlXrLxj23d86Ky0W+LATqvjTJEs/xk7uE/67IAGr5j0q+uS8dNJUFiyZhmC/Ch+hdSP1oKWadAWeSp2mo09myZ+zmPLMM8ykh8CdB6IQQFpKEW6KM8dllsS15430GII9DsbFHbtuj7mOSX3n95zRZaIk4kC8vFzJ+NGFxj2T3qPaFq1kJsiInVOTMd9uiOVtGhS8fvbxmZJeA4//6/rk+2/qPS2LH0vLgLq7yQ2DYBlrHTQ3+4Bxau069L2YJOINbfbOFd2ZmbGrxkRBq1mhraivZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CeqCW4J6V6zqRNDvvLFKqogAuC5lXlM59xAIAbFfLVE=;
 b=yxsOZcZTaAc0UjtGbD9hvgXPme6NZ+4/+DtjhMCxy7d6BY2jM61irlrqWEkbmB/UmQHbq0zn1sMn547/pPfeLlxtXMuoefbsX/Ybvn9/sK10mKgbyzxHP8ybqXKjbDKyI6Rug5EKfGvklocyb2nwAM58Sz/wj/65TRzbhytFc/GzM5EiQ+At5wBOnT+wSJ8vcMJJrIEI1YNlcg5mcRiK2pv5a+igvtxx6p1rl1wL5mWaomgk4a5/WOBFLPsj1MSGTR5wtIQYRk2b41DhIOgtk1/ou0/4DPNTguHzCkglywOSKmLlNHG6qguMYR9uUgPYkjEgQ8yu4+ADefVb/+FWhQ==
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "roger.pau@citrix.com" <roger.pau@citrix.com>, "ohering@suse.de"
	<ohering@suse.de>, "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86: make "dom0_nodes=" work with credit2
Thread-Topic: [PATCH] x86: make "dom0_nodes=" work with credit2
Thread-Index:
 AQHYSoM0M4Zi9SzqTkOjTOtQV+PP7azl4C2AgAAVUwCABn7lAIAABpgAgAEqhACAGTPWgIAAF2gAgAAfzYCAi1wnAIAJKZoA
Date: Tue, 2 Aug 2022 02:14:59 +0000
Message-ID: <b6b09e35f69fa22ce6e827d3fa6e0648a2bf7c97.camel@suse.com>
References: <1617b87a-640f-d235-701d-df2c57314b73@suse.com>
	 <2d56bb1015a263b6d1b196050d088b84c320b808.camel@suse.com>
	 <b41009b4-fea4-826f-f36f-7dd9f4edd1bb@suse.com>
	 <30ac2ce8cca7217775eaa704aab45a62deb1272e.camel@suse.com>
	 <e061a647cd77a36834e2085a96a07caa785c5066.camel@suse.com>
	 <35599105-b441-96cf-7537-ccf9dfac0934@suse.com>
	 <fd07c28fad352a476544258f2ac4d652062b2701.camel@suse.com>
	 <85c55676-b21f-1eb4-0471-19ca9b6de39f@suse.com>
	 <a8ce120ee64165ac7b08de90e6786bb871541af3.camel@suse.com>
	 <1c810532-8d2f-58ce-ca6b-a9f70ea083ca@suse.com>
In-Reply-To: <1c810532-8d2f-58ce-ca6b-a9f70ea083ca@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.3 (by Flathub.org) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b04dc37-59ac-44cb-b6f8-08da742ccd03
x-ms-traffictypediagnostic: PA4PR04MB7904:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 WvwvWnn0zyXoUYN9SqHuIUlWvFF57qDy4H6kY3mSfWj5R0oxZn7N7ZLJUw7bFeK+3VAVxzeGVCEkuYbUdvmyQRB/glg26rztSUoxlO+rsEMSKt69DWPOdcYyOKUfr6b+rHexNy3Pms1GROO9HhcANCw6e5sZwEQyzR/1WiGAkpijr4RZ0SPPuhsvAVdza3jDCkSsZQj6Lx6shALCAewpiQ7thCJerZgazqmfWUIRsBPPzTVViwPURNmh8TGz7crMKNcL4Nf6av1sGKWdZcCNoA9bUAKlt+TEHmF19uuoVQUzv8/fGBPZitR66ggsNDMbUxMTX15Ny6Y5OjfXIZvxy3WSjvSK6Fibn2FVnV2vmSx3RT4QnknHC9c4lYrpi2YLA+zMXT4EQ8W4b5ebKAjDfbUKEixeMdPoK19AEFwB8nrE8+gwMA7gEY2/w34wnBgVu0hINw0NwvMrWHf5i/NA1IV6xDk389N9fzipRW6nCS5g5waJEz7sEaWiAJ7mpKDZdXtGYxdeIcFhFnQezqsDzfKczn1Ja4MFKQ8W5CEO/MIFupWVnfEe1oN+tsJpNKDm9mYR+6ua9+G4V00WWvjkNqdeA8RnN8pY4IjLPKUPhR5NZLFqXCjK9Yvg7C4YhPC3F0cq3M9MPFqSFq0dD1R25Vt9WhEffCOjGD0lWNmGI0m78maMpG3RHpdQgUafV506Bt0zmBONNNpKNGgtSX9Zu5kJ6WrTU9BygPsfKl3hK9gzPr1kUvDr45YTbXEZBQ1jOojcVOZuh5sfIKjxncAhBEAwZCP7fuaik0VHXxr4EH+2KCLeellxnNFVecRIpRGO+yPw7B31TraI7uKhREfWkekGeb1H2sO8wN+vdjrpirHWTsrbfyok+S0cuZQKx1US
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9067.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(346002)(136003)(376002)(396003)(39860400002)(6506007)(6512007)(26005)(99936003)(122000001)(38100700002)(38070700005)(5660300002)(76116006)(186003)(36756003)(966005)(83380400001)(6486002)(478600001)(71200400001)(91956017)(66946007)(86362001)(2616005)(8676002)(4326008)(66556008)(66476007)(66446008)(64756008)(41300700001)(4744005)(6862004)(8936002)(6636002)(316002)(54906003)(2906002)(37006003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N0l2VE9GVEpKMC9xSlpkclFvSWNTdTA5RG1COVNIZmZ1SGt6SlZVcXl2SW5Y?=
 =?utf-8?B?dlBYS0dkUXhUbWJsQ0ZpL2Z0M2huRXZScmVLQ0lwNmlKN1RCMlhwajZSQXha?=
 =?utf-8?B?UXJtUUE0akhLWUxQaXZPTC9WZHRFRTFwbGo4YXBPa2N4KzN4czJ1ZGNLdFda?=
 =?utf-8?B?bThRc1BnOVd3UU84SjdBQ0ZUMUlUcW1QTVJEVGFUd0pONy9CWW9Rbko1UHpZ?=
 =?utf-8?B?OCtib2t2TU5oWkdkU215Z0VJWnYzOU9nR01QVmhTOUhrMVM3OFdibzdnS0Vv?=
 =?utf-8?B?K3ZmalRNSDdaRnUzUERNVDBkbnBWQkRCZzZMc1RtZStSR1YxS2Y5ZGx3eG56?=
 =?utf-8?B?cDd5UVdFVUtMT2paN2dlaWx2U3U3N085eGI4bGJ1UXBsSU5JNUZWaisyM0FI?=
 =?utf-8?B?VWxjTWxOcy9kejlQbUQ2UUVzSkNiRGk0NitrclpQb0xWS0FBM1NuR0JXSURW?=
 =?utf-8?B?MlE3ZXhYWWtIZ2FMeE0wSzFmYnc3MXpra1JCcWJNRGQrZGt3WHU2MjBBeFU4?=
 =?utf-8?B?aloxTGtCNVpadzBPYXFITXFlWktZNHJRakxuTk5iVk5lVFVnejMxSWwyTnJj?=
 =?utf-8?B?U2Q4WVZEN251NHFnMnY4MmxtVk8vdGtiNkY3UkZ0YldOcnVKWGVoeXJOT2JF?=
 =?utf-8?B?c0E4bXlKbkdqODJvd2YraHJMU1czamRJeU5ZMklqSThhKzZBUHQwOUo4Mkd2?=
 =?utf-8?B?a1M3eVBUTnZmS0FUZDg3bHVVVXRYRmp3azE5TlFTcVM2ZlVkZnVQNXBiNm0x?=
 =?utf-8?B?OHpMQSt4azkzVm1zK1dzQ20rR2lnNFVFRThrSXJiL3JwdFIxbzVyYkxLYW5F?=
 =?utf-8?B?dGtVTzJJbXRxSTh4QzBtcDVsa0UrNjBtODJzekliRER2UENtbGN0YmFib3hH?=
 =?utf-8?B?UXNkOElaK1BFbkJQVkhoMUFpTUFnanNWQlo3UHAvc2RLOUEwUEp2S01NdDFK?=
 =?utf-8?B?dmM0VUVCUkFJQ2Urb1g1VGtXb0dFdm40WjdZZjAwQitDbklzUDlaZW5MWmdM?=
 =?utf-8?B?NExHV2JhR0pJelo2TTJCTFNVUGtqcW5Ja2xBZFlrKzNDUzhuMSszZVBHQ1Vt?=
 =?utf-8?B?TmxMM3R2d1UyUDJJVWtORHpvMkx0bWVKRmpJSmx5OHk0SldhZnl0RHhVUDR0?=
 =?utf-8?B?RFh6U0xJa0lrTlNqMDM2eXNUdU1NSWN3YklPV1BzODN4QktDSGlWaEVKNk8r?=
 =?utf-8?B?U1BZRVpneFdCMTloVjk5MTVnc1hLQjg3cUgzVlpwd2t3Tk1DeDdPK2lCVmdB?=
 =?utf-8?B?UDNtV0Vqb3lYM1dzMzF2ZjB0Y24wenB3Myt2M1l2TG1XWnBGTDdTRTBCcXFR?=
 =?utf-8?B?RUpGN0p6YTdoTTU0Yi9SWnM3N0ZzUVBkS3FuZHExUWZLeHk1RTdjSmY3QWF0?=
 =?utf-8?B?V1ZUNTk5Wm1yT1J2THdXYnpkUmtMSnFVVXFmT2F2RnJVVkdmVkQ1T0Nna3BB?=
 =?utf-8?B?Z0ZLMlZUYXlLNER1aUtoSzRBaW5iQkVUU3RKNTdBSSsrSlJXSk5kUHladzZQ?=
 =?utf-8?B?UTR3aFVrSTYvWE5uNW1SZDdKOFpYTmE2VVpSdDg0TjRReTRjV2lRaFdDTU9k?=
 =?utf-8?B?Mml3N1YxTS9hRjc0TXRsMGxpUWFnWXEwSmtWazZQTzhPSXJYS29PZTZnMWll?=
 =?utf-8?B?N0xWYjBrSlZWR1NvUVRzYVh0ejc2L0NKOUwxLzFNYmt3N0g5M3ZVOHA3bGpa?=
 =?utf-8?B?U2YzN2IvYWJMMFgyWHN0dGhHQ0RmeUxZNW1adjQramlFYWp6NDdHaUZXYmIv?=
 =?utf-8?B?TThTTXcrU0R2dkx4SDVJVmR0b290UlVqclhvVFRWMXBlK3Uxck11WXp4M3E4?=
 =?utf-8?B?R1M4VVRQNXlGTHlNTisxZnFXMDRGWnZTR0d6ckNrcTV5WFBXWEM2YjJBY3Z2?=
 =?utf-8?B?aWpHd3pETXIyaG1md2ZSZW85OFRYQ1ViZ2thRG1MNjVWbzFhcWgrQVk3eHhp?=
 =?utf-8?B?cG9JUTJ2SmZyaVNMZS9BK0ljamF5YlVZaU5kclIva0lyTGlYWC9yd0VoOCs3?=
 =?utf-8?B?Tkt3cXdTUTBKTThLVktPbWxGZmFiM2ZOcytlaVFzSDVhWkZ1bWFYWXZ5U2tP?=
 =?utf-8?B?ejhKR2htaWFwY0FQL1Q4Tk5JRVhhWFFoSjlCOFprZFJQNndYS2p6di9PQjhJ?=
 =?utf-8?Q?0scz1n98t4NTXW+x/TzhmJOFk?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ohEJqe4LzWt2syMcFD0A"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9067.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b04dc37-59ac-44cb-b6f8-08da742ccd03
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2022 02:14:59.3145
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gKVTHX18k3QpyvZKMmjD4yUp3+eDg04/TlzrhP8gUzHVjHEnIpxqSlUAR7wIAbyKWV2knEk+6mezw+9bzfakiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7904

--=-ohEJqe4LzWt2syMcFD0A
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2022-07-27 at 08:19 +0200, Jan Beulich wrote:
> > I notice this issue is still open. May I ask what the plans are
> > here?
> >=20
Yes, you're right.

I have the patch that I sent in this thread and that we discussed a bit
in a local branch. Let me see if I can rebase it, re-test it and send
it before disappearing for a couple of weeks for vacations...

Sorry it's taking so long.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-ohEJqe4LzWt2syMcFD0A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmLoiKIACgkQFkJ4iaW4
c+4fLQ//cFdt9dKAhsnZ/N63apOo4kVDfXKujiu9jNwdqDCjPxKjySpduk8eDMuJ
ep7XErRJIj5tL7BgI70b734K7npCarjxaSw/L6ny5SmuLcaSsgvTINYrCDKat8zv
cJUUCeBT/YOlQSWPUio3sJbs89kdI/QYyYRQSOUxfgR5BOrmbbe4Vs5qsSETaYMh
NE6uccDjYte3f2Oy8Ds/ui+ARKn5nYnW+iSM+0QkMFBSABImUvPPomDvWdKP92Jt
eabq3XBMwY6nKIMZMXPjrbYnc5o0nv/b7pZIgkqaAQ2lF1rr8nBIjqNzDm197Jbb
shOUBZ3TDt8Tdu7JeNnOyCC6pVjU8WifwLlb1Bn3e3yoDsIM1kpUCdyTI23lemqb
snoPWVHdIPqREliXGfVrVv6QSfG8rBiWvFzEunLcG5OqoCGfQ8hMHl/7sWNkkORc
GOyLixLvsBWuSTU6xSxDtQV0nKUTRkp5zfmbVvMTO+EP+pgJpAn8Zne4bkdCF0Re
iohpIpvtutx2lT8jcsaeLrHOF2LpaKMJ5l9qTec8+2cgWhVNgv6kO36AAIElVyDT
j9N3AgE9tNtjt5TfOnrE84leRKvcv69uOvo8knWfb3a7ekxhw2wm8xHT1dDN8u1Z
n6HF3U44nE8IA6a6F3UQ/+V0b48qIeZjx7rZEtLAP4CG5SKwqzg=
=HaDy
-----END PGP SIGNATURE-----

--=-ohEJqe4LzWt2syMcFD0A--

