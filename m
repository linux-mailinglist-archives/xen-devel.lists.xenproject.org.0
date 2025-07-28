Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB71B14249
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 20:58:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061889.1427492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugT3U-0006qg-5d; Mon, 28 Jul 2025 18:58:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061889.1427492; Mon, 28 Jul 2025 18:58:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugT3U-0006pB-2B; Mon, 28 Jul 2025 18:58:36 +0000
Received: by outflank-mailman (input) for mailman id 1061889;
 Mon, 28 Jul 2025 18:58:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l9gA=2J=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ugT3S-0006p5-BA
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 18:58:34 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db1a9ac5-6be4-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 20:58:32 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AM0PR03MB6195.eurprd03.prod.outlook.com (2603:10a6:20b:159::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Mon, 28 Jul
 2025 18:58:28 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 18:58:28 +0000
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
X-Inumbo-ID: db1a9ac5-6be4-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NRecdes8axyy9x+HrjYuGZKMyAQFYuHwJcU83rhDIVhT3XZm4KAZcNP+s/9ay5QXJEvUSKq7xgJXqKyaEAwncfVbADsb7UkAtWxzHOY+NwxM3Q0eQGRD/U6gxWnJZFRYSI7Xs6brbaCdITADZo53Azx1hJN6BIROnBMgSdeIf5Kbsvwj4IiX1NX68EFDPf2gQ8Usu56/5UPnopKxnGDnPfhd62gS/KH3StsFoYhhh2mySj2rJxSB1vfZ7OpK/jyaIxNlRaDykB1/PkbgEkVY8gM1e+xrcru6bx/rxkSneWgbelUKm/ECBzsqxUCoMH59Fj951e7DA76sZ5BLYsR+CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4k4DttnZ5TvZJEYl6WdJafyMQt9GDiEZ812ADnOJnhI=;
 b=IG3OGP0ocBtQ3FjAD8/SCYwFhUPPRNURfRG91EoXA/YYk/id9ZNz4quRehOnPrhQ61lecIaq7+c8HG9knM2X+2PpTeUnhVoH5aSAFVQzzTCfM6apeS6CZAxrOcT7QENaf3F4+AqvyP6nZIOW6/MnW8Ilg2NSXkixhC5Bj9Jx2FFj/Uzrae7ssv8WBQW9JmsRR7wJTAl915LeQwvetziThivyTt//qBgfZVLo+Qr+LKqYbvwG821zO3FlTbjhDBpHdre7rEeA9cNqHq0suDEfu2R9EFwqceivjcK4po1RJrgwT9mFHeQNqMRGcvtvYGu34Jr0vXvAOzr/OmDEeG+Hiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4k4DttnZ5TvZJEYl6WdJafyMQt9GDiEZ812ADnOJnhI=;
 b=kCuIttzKI/8zpH8NldO7cAQHgRWOwQJyHv3JomE04PjhJ3OQt2miB39UdkjGDc4wqsDhOQ8vMfN4ihbqIzg+OVDDG88RufyMmyjf63zeIr6NZJ+Kt89j9WmQU+hRbPmghkWYeQF5x/ph8lbfGRtIqxEXdILC9YgyjDY0iuvokXn3GHIU5UpWt88AV3fGGwG+o32A4XWnE+6AZpEwWLldjGHwHbE5+I4hC88vsjdlksKP6YwsiVtQovN6n/iPD2LqrDDe5frXuKoCCh6tz2plsl2bx2zRaHOnPe5pLJ6Jf17da4dS2EH2TIDTEcaM6TGwD+eRXzFaX4PPmfR/jCs8HQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: Jan Beulich <jbeulich@suse.com>, "consulting@bugseng.com"
	<consulting@bugseng.com>, Anthony PERARD <anthony.perard@vates.tech>, Michal
 Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] misra: deviate explicit cast for Rule 11.1
Thread-Topic: [PATCH] misra: deviate explicit cast for Rule 11.1
Thread-Index: AQHb/zTS/PoTkNo+DkioPyw1aNE6A7RHTViAgAAOt4CAAHPhAIAABWuAgAAPboA=
Date: Mon, 28 Jul 2025 18:58:27 +0000
Message-ID: <efcda932-633b-4140-b869-e22d552b3aea@epam.com>
References:
 <181a03d5c7625d42c06cf9fa0cf48a9bc6825361.1753647875.git.dmytro_prokopchuk1@epam.com>
 <093601d7-691a-48ee-a0f4-2e86a0f2015e@suse.com>
 <43bea8dd-fbd3-4a64-ad9c-aac5813c15a9@citrix.com>
 <f1fa4da171fd7b6dbfed06cff3d4771b@bugseng.com>
 <a5781ddf-d353-470b-a072-1e0b4e6931dd@epam.com>
In-Reply-To: <a5781ddf-d353-470b-a072-1e0b4e6931dd@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AM0PR03MB6195:EE_
x-ms-office365-filtering-correlation-id: 63e2a2f7-ddb5-4894-689b-08ddce08bce0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|42112799006|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VTBRK2kvWnl0ZXFIOGRPWURjMWVIaTlScWFxMVRaWHdwSmNWL3ZrK1VRMjVi?=
 =?utf-8?B?ZDE0NG16N2ZldUF6ZUF1b0tQTElNOFpFOUZaS3BLWXIyMFg5TSthYUhxcnQ3?=
 =?utf-8?B?cXJmdS96a1kvMGs1Z2ozQ0FnZjVMekRpNXJIZ2ovWFM0WDhZWGZPODdpVStK?=
 =?utf-8?B?RFlyeVU5VW40ODVIU01WK1U4eUlQMlhGdlpRYjcxaUJYcW5ORTZuWFlnbytI?=
 =?utf-8?B?UXVtTlN3ZDVSVVAzWStQVUhBSENCQ29GOUszNTZlOE5PNlRQem1kMHcwR0N6?=
 =?utf-8?B?WFFTV1NPWWVTMkxibVQxcTAxVWRLeGxzb2RubE1zL2FoTDNTV1dXd2FTSzYz?=
 =?utf-8?B?SnptZVRXK3Q0Z1puWVd1dVVxc2V2eTZnRFVCTlMydit0WDBpNWtNWnVDZnpC?=
 =?utf-8?B?d29XMjl1U1hFdlVzT0ZTTERHTnhLbm1Mc2ZzNWZ6OEZCQWI1ZmV4THFyblpN?=
 =?utf-8?B?VkFnTmo1YWpkSWxwOExPdHp0ZWdxeWhPUk85U1dyRno5L2l5TnRibk5ETG9m?=
 =?utf-8?B?TWhDRFQrSTg0OG10TFlMZWpjUEx0dkVRdmxuNExLQng4T21XeGZQYXlOVFVG?=
 =?utf-8?B?REJ4QzlwRm5qMDlVNnBna21xTmJCNk9aTjdyMThGKzVuZ0dXeHlRL1phR0NF?=
 =?utf-8?B?Y0F0NnRTaUxRRmZVR2YySGM1bmJkL01zTFV4QUh2YmtFQW9pNUVuS1pUWDVJ?=
 =?utf-8?B?cGVDcExuZjJodHREalZxb3JiZGdaWEhXV0tWemNKNjdEOUVYUkRFZmxpSkJS?=
 =?utf-8?B?c2toUDV2QXJOY2NIZzBTczJQaTJuaHJxVGJKZDV0RlNxWXVxZ21CdUxvMWVD?=
 =?utf-8?B?bVVKMi9VT09vT3pBM0xKdmFaajZ5UGNUbUtFaHhnY2dsbWp3VDRFWVZKR0Ra?=
 =?utf-8?B?REhsODYvZ1RvWFBIQ0xVTnBsbVVreVRaQnhVcys4bldEK0N2NU5lZFg1M3Nt?=
 =?utf-8?B?OFpUM2J4SFBsSVE1Nm1sRUVRcmtXZ3prRWN4OEswWnJCVzZHT1UvbjdrS1Fv?=
 =?utf-8?B?V2g2RXkrWFN0QWJVbnRnVS9obXJseEcrSnZ4QWFnVVV5RWp2QzVuSjhhcFBy?=
 =?utf-8?B?a1RDZEpZT1p4bVVNWFYvQ3Brbm84MDdySHU2dHpkN0NIOUI1QkRrTlZpZk1u?=
 =?utf-8?B?SXFBdWZ6a0VxOVZKanVHTS9OMys3V3Z3bUpCQ1plWEFyVVJydm1qZ0xpbURX?=
 =?utf-8?B?c0phaElseDkxSzNvbUg0eGlzVHJuODROSkg2SW83RWtTYUMvdUQ1UmNLTXEr?=
 =?utf-8?B?QXNnVW5IKzhWRXRJdVJrZGduMElZZXVrRUlBWm83U2gxMnpFVmRlOTZFb0pT?=
 =?utf-8?B?MWxwK3JkUzBSeWFIM0RBcVNKV0NxQ0pBYUZoTm8vRWl5SWFGekEwcDdUcDBv?=
 =?utf-8?B?MlNTV20wWGNrZHgxcG9ncFkwNk43M0swQktBYmQrWnpUMk9ma012cHdnVWhT?=
 =?utf-8?B?WElyNzNOaHhmb3crWFBlSlZpVHBLc0tIdUN5NTNTdHJidy9BWTBJcHk4blJ4?=
 =?utf-8?B?TWxaeGx6eGoxTFV5aUR5U21CYWhjajZaL29tNGZ0K2FySW42MzQxb2ZXbk81?=
 =?utf-8?B?cG1UVm5VVDNkWWdCRGpucFUzdnZ6SzZCaUpIWkV1bmNPaU5XUEtaUHBDRW1h?=
 =?utf-8?B?dXRXVGx1VWJKaUFQU3ZDS0liVFhQeHVGN3NjMy92VzJhMk9xR0k2M0x1SjFw?=
 =?utf-8?B?dzBrNEw5SXlLOERqRCtVUDhlRnUxbWpwVnFNTzNIZndjQ2JLanJZVkU3dWVh?=
 =?utf-8?B?cnIwcnJZZ3VsRXpscnhDTkh2Z3lvVDQ5K2QxcGZJQmV3eGpKaG9uVWw2aDND?=
 =?utf-8?B?Y1AwTUF4OTRsVVVWb05vd2ZPcTZqNW1yNU5zYXdETzVTOUx6dHpCM3hGekIz?=
 =?utf-8?B?MHVwSlJoK2p6Q210cW54U205dDJzczl3blpSaDJHSzNlVGpwVDRINDJ1N2hw?=
 =?utf-8?B?MjJ4MjZrNm5INDRJOWRHS3A4blhwOUQ1MjJjNWpyVnBuS3BJbjM2OEpVclRi?=
 =?utf-8?B?aGo1V2tCUmFRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(42112799006)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dHoxbVM3MUw5T0tiQTFCUTJoVDZpWHVBaFBCYURkd3dPV0dIUjh3NnNkV2NB?=
 =?utf-8?B?QzZ4WVprOUtuNTVGKy9GTlVDRDV4RlBOR1Fwbmtnbys5MmpDL0I4a2s5ZkJv?=
 =?utf-8?B?UjlpNW5TY05TZXdsL2ZHSlJIYTVON0ZJMjZYL3NiTUNxS0dwdkNpc0RkYTdZ?=
 =?utf-8?B?YkVHUDBOYWpOTGU4NUpWT2c4MHR3c25TL0NNOW8wVGRyK0ZtcE1jQUhDR1pI?=
 =?utf-8?B?cFZ5NDExWkw1bDFKbWxJeGNEcXdtN2dSdkVNT2ptT2FDeUJneW91SWs5Tkdp?=
 =?utf-8?B?M0llNVFCalQzK0x5MExhdTJGSTBYN1AySG5PMXpxNzZPc0thb1FtR3pWMzND?=
 =?utf-8?B?czFzbUlack1WMEdhTVpNMzNBL2V4QjFXNnpza2lKREJRMWk1S0hNMFl0d2d2?=
 =?utf-8?B?M0RuZjB6TTFsQ2t2MWhENnk1TzV4aUFEWSs4Z2xoY044S2dJamhBWTJOd3FN?=
 =?utf-8?B?NkhZVjQ3TjRWbmhUc3NHV3hxVzhtRWo5RUNvLzF4cG1ubGNwMC84WlkyUGNJ?=
 =?utf-8?B?bm94dkNmTHNhYnZ5UGF5TkZibzhDWDFNcHlyekdFdVFRS2U5VlJaT2oyeElF?=
 =?utf-8?B?cjRWTlFhQzh3cUVNL1BGYUhJdSt6QWdkU3JuUGpvUFJKV1F5NUN4RWZQcFp0?=
 =?utf-8?B?dWtrQXJDNGJPLzM4RzJReHBnSFN4Y0pIa2hXeVMxOW5WQ2tySCtrZU43ZUFj?=
 =?utf-8?B?Z25XV2h5L2djcjJ2clV1UXRpNHBzVWlBdWtvQkFFYnQ1UFhUTVVDUitabGQv?=
 =?utf-8?B?bUJTOHhML1FjK0NyR2pVR3JGeXRCYW1TVFhGNXZNN0FqdWdiaVdsUUNKZXdj?=
 =?utf-8?B?cW9jZGhUTXV4NC95MTZVL0V6SVBWTno5b0I3MG1iZ1pISVNJRFM1bUJySGc1?=
 =?utf-8?B?SUlnTldNYit3czl4Ykd5MTBlYi9PYUtTUXJRUUsyblZpeURpZ1c5NzM1cWpD?=
 =?utf-8?B?VHlUMW55YkJGYVZNQlExV2w0MEdSUzM4YktPZDNOK2p2aFdDK0tpZkVMMjll?=
 =?utf-8?B?a0ZLVlJ3VGVHWnA1N0NrbWlqOVFraUdnYnlnRkZBQU1sczlVbjhzVENzUGlm?=
 =?utf-8?B?WWhxU1c3NytJb3plUXpheE1sMHU2dDcrT3daRFBWb0tSMHZzYU1MMnZ5bHQw?=
 =?utf-8?B?M1djbTZ2ZWwxR3Q4WUo0K3NnbTNiY1I5ZDc5dzRlOHdNN2lxMTVBWFBtL3pV?=
 =?utf-8?B?Z0VOQ214R2NwWHBDNXJZOEZDOExpbG4zeEgwK2pVUFpzVDBLUGRFcHVVVXpt?=
 =?utf-8?B?NGtFS0lxSFV5WnJJTFN4cDhkWjZWaFBTS3FFQTBHY0QzZk1hMGxoN2JJQjZU?=
 =?utf-8?B?cUw1aG9iR3gwZVlvUjJ6RDNYQVU4dHZQSFEySkpSRi9QK3N2MTI3NUxXMEFl?=
 =?utf-8?B?cG9QMFNWNWxMeklSczc4ZjV2akRxUHd1OUFZUFFYcXJJMWl0WVdnN0w5b1dX?=
 =?utf-8?B?eE5ldGZpdXdvbzJwTW9FTEM4Ym9DL0NGajRiZjI1MlJwc09uaUdKVHVvNXRS?=
 =?utf-8?B?TGk3RDNZR0NwdnBsd1UyR1NNQW9FZkYwbXhmYlRmTWZzS0NxcTU4VlZHckE4?=
 =?utf-8?B?OXZGZUdxaWFTNlVWQnozQUpVSE1uZHllOUp5bzJrTEdheFdVeWRCL1ZiRENw?=
 =?utf-8?B?QVpEanZjWGZzNk9vQ1piMWdQM0VtZnZSVkI1SEVLay9SMDR6TXB4Um5nSEo4?=
 =?utf-8?B?L01wb0o3QUtUYmREQ0FMaEZWODZXMWVoQzQ2dGRiektSOUpNTWxISlAvc1VV?=
 =?utf-8?B?d3ZSZ21oTW16OWtyYzE0QjIzK25aeXpONTF2bEVKaFIrcnFpb09tanpqYmJY?=
 =?utf-8?B?OXFCWmFnTUZPUlVrdWlISWJDalorcTgrOU8zVVk3VnVycG12elVsVWFyQ2Js?=
 =?utf-8?B?UTQvWDAxR0JOK2FLZzBkT0FNSmdJaGVmaC9yeEcrZWg0ZnM4NzZEbW5xQS8r?=
 =?utf-8?B?cHdrWEN4eTFHcW9xRWZSK3BYVS9KQzVZY3pIN01TUW1YblY2R09JS1AzNEhU?=
 =?utf-8?B?RmNJcFRFVWZjQndhd2lBM1ZvZWhXYU9mOXBWUE5sZEJnaGVjblMyZVR2MFk1?=
 =?utf-8?B?NGprYVFsMnFDTmRwWUt2Nm9jUklHR0pycjFlaFJRN2IyM2lSVTF6bE9IN28z?=
 =?utf-8?B?anp1OXpGUC9idElaQjZ5V1JFT3pmbGV6MHdNRzRNL0Zwa2hoWlkzSlVGNEps?=
 =?utf-8?B?TUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8BE0202DB331FB4AAACB76B352A70E25@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63e2a2f7-ddb5-4894-689b-08ddce08bce0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2025 18:58:27.9944
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kRMgPAW6EndxDYpI29d8xHDcRwl75Zs/SrbhtYBytnXoD4TDdcnUF42x/ucJfPVnwhWEfg8R3Hyf73uC0/SgXOodWRMLdIGKC1C6viAoFvw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6195

DQoNCk9uIDcvMjgvMjUgMjE6MDMsIERteXRybyBQcm9rb3BjaHVrIHdyb3RlOg0KPiANCj4gDQo+
IE9uIDcvMjgvMjUgMjA6NDMsIE5pY29sYSBWZXRyaW5pIHdyb3RlOg0KPj4gT24gMjAyNS0wNy0y
OCAxMjo0OSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+PiBPbiAyOC8wNy8yMDI1IDEwOjU2IGFt
LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4gT24gMjcuMDcuMjAyNSAyMjoyNywgRG15dHJvIFBy
b2tvcGNodWsxIHdyb3RlOg0KPj4+Pj4gRXhwbGljaXRseSBjYXN0ICdoYWx0X3RoaXNfY3B1JyB3
aGVuIHBhc3NpbmcgaXQNCj4+Pj4+IHRvICdzbXBfY2FsbF9mdW5jdGlvbicgdG8gbWF0Y2ggdGhl
IHJlcXVpcmVkDQo+Pj4+PiBmdW5jdGlvbiBwb2ludGVyIHR5cGUgJyh2b2lkICgqKSh2b2lkICpp
bmZvKSknLg0KPj4+Pj4NCj4+Pj4+IERvY3VtZW50IGFuZCBqdXN0aWZ5IGEgTUlTUkEgQyBSMTEu
MSBkZXZpYXRpb24NCj4+Pj4+IChleHBsaWNpdCBjYXN0KS4NCj4+Pj4+DQo+Pj4+PiBTaWduZWQt
b2ZmLWJ5OiBEbXl0cm8gUHJva29wY2h1ayA8ZG15dHJvX3Byb2tvcGNodWsxQGVwYW0uY29tPg0K
Pj4+PiBBbGwgeW91IHRhbGsgYWJvdXQgaXMgdGhlIHJ1bGUgdGhhdCB5b3UgdmlvbGF0ZSBieSBh
ZGRpbmcgYSBjYXN0LiANCj4+Pj4gQnV0IHdoYXQgaXMNCj4+Pj4gdGhlIHByb2JsZW0geW91J3Jl
IGFjdHVhbGx5IHRyeWluZyB0byByZXNvbHZlIGJ5IGFkZGluZyBhIGNhc3Q/DQo+Pj4+DQo+Pj4+
PiAtLS0gYS94ZW4vYXJjaC9hcm0vc2h1dGRvd24uYw0KPj4+Pj4gKysrIGIveGVuL2FyY2gvYXJt
L3NodXRkb3duLmMNCj4+Pj4+IEBAIC0yNSw3ICsyNSw4IEBAIHZvaWQgbWFjaGluZV9oYWx0KHZv
aWQpDQo+Pj4+PiDCoMKgwqDCoCB3YXRjaGRvZ19kaXNhYmxlKCk7DQo+Pj4+PiDCoMKgwqDCoCBj
b25zb2xlX3N0YXJ0X3N5bmMoKTsNCj4+Pj4+IMKgwqDCoMKgIGxvY2FsX2lycV9lbmFibGUoKTsN
Cj4+Pj4+IC3CoMKgwqAgc21wX2NhbGxfZnVuY3Rpb24oaGFsdF90aGlzX2NwdSwgTlVMTCwgMCk7
DQo+Pj4+PiArwqDCoMKgIC8qIFNBRi0xNS1zYWZlICovDQo+Pj4+PiArwqDCoMKgIHNtcF9jYWxs
X2Z1bmN0aW9uKCh2b2lkICgqKSh2b2lkICopKWhhbHRfdGhpc19jcHUsIE5VTEwsIDApOw0KPj4+
PiBOb3cgdGhpcyBpcyB0aGUga2luZCBvZiBjYXN0IHRoYXQgaXMgdmVyeSBkYW5nZXJvdXMuIFRo
ZSBmdW5jdGlvbidzIA0KPj4+PiBzaWduYXR1cmUNCj4+Pj4gY2hhbmdpbmcgd2lsbCBnbyBlbnRp
cmVseSB1bm5vdGljZWQgKGJ5IHRoZSBjb21waWxlcikgd2l0aCBzdWNoIGEgDQo+Pj4+IGNhc3Qg
aW4gcGxhY2UuDQo+Pj4NCj4+PiBJIGFncmVlLsKgIFRoaXMgY29kZSBpcyAqZmFyKiBzYWZlciBp
biBwcmFjdGljZSB3aXRob3V0IHRoZSBjYXN0LCB0aGFuDQo+Pj4gd2l0aCBpdC4NCj4+Pg0KPj4+
PiBJZiBNaXNyYSAvIEVjbGFpciBhcmUgdW5oYXBweSBhYm91dCBzdWNoIGFuIGV4dHJhIChiZW5p
Z24gaGVyZSkgDQo+Pj4+IGF0dHJpYnV0ZSwgSSdkDQo+Pj4+IGJlIGludGVyZXN0ZWQgdG8ga25v
dyB3aGF0IHRoZWlyIHN1Z2dlc3Rpb24gaXMgdG8gZGVhbCB3aXRoIHRoZSANCj4+Pj4gc2l0dWF0
aW9uDQo+Pj4+IHdpdGhvdXQgbWFraW5nIHRoZSBjb2RlIHdvcnNlIChhcyBpbjogbW9yZSByaXNr
eSkuIEkgZmlyc3QgdGhvdWdodCANCj4+Pj4gYWJvdXQgaGF2aW5nDQo+Pj4+IGEgbmV3IGhlbHBl
ciBmdW5jdGlvbiB0aGF0IHRoZW4gc2ltcGx5IGNoYWlucyB0byBoYWx0X3RoaXNfY3B1KCksIA0K
Pj4+PiB5ZXQgdGhhdA0KPj4+PiB3b3VsZCByZXN1bHQgaW4gYSBmdW5jdGlvbiB3aGljaCBjYW4n
dCByZXR1cm4sIGJ1dCBoYXMgbm8gbm9yZXR1cm4gDQo+Pj4+IGF0dHJpYnV0ZS4NCj4+Pg0KPj4+
IEkgZ3Vlc3MgdGhhdCBFY2xhaXIgY2Fubm90IGtub3cgd2hhdCBhbiBhcmJpdHJhcnkgYXR0cmli
dXRlIGRvZXMgYW5kDQo+Pj4gd2hldGhlciBpdCBpbXBhY3RzIHRoZSBBQkksIGJ1dCBpdCB3b3Vs
ZCBiZSBsb3ZlbHkgaWYgRWNsYWlyIGNvdWxkIGJlDQo+Pj4gdG9sZCAibm9yZXR1cm4gaXMgYSBz
YWZlIGF0dHJpYnV0ZSB0byBkaWZmZXIgb24iPw0KPj4+DQo+Pg0KPj4gSSdtIGNvbnZpbmNlZCBp
dCBjYW4gZG8gdGhhdC4gUGVyaGFwcyBzb21ldGhpbmcgbGlrZQ0KPj4NCj4+IC1jb25maWc9TUMz
QTIuUjExLjEsY2FzdHMrPXtzYWZlLCANCj4+ICJraW5kKGJpdGNhc3QpJiZ0byh0eXBlKHBvaW50
ZXIoaW5uZXIocmV0dXJuKGJ1aWx0aW4odm9pZCkpJiZhbGxfcGFyYW0oMSwgcG9pbnRlcihidWls
dGluKHZvaWQpKSkpKSkpJiZmcm9tKGV4cHIoc2tpcCghc3ludGFjdGljKCksIHJlZihwcm9wZXJ0
eShub3JldHVybikpKSkpIn0NCj4+DQo+PiB3aGljaCBpcyBhIG1lc3MgYnV0IGRlY29kZXMgdG8g
dGhhdCwgbW9yZSBvciBsZXNzLg0KPj4NCj4+IEkgaGF2ZW4ndCB0ZXN0ZWQgaXQgeWV0LCB0aG91
Z2gsIGJ1dCBvbiBhIHRveSBleGFtcGxlIFsxXSBpdCB3b3Jrcy4NCj4+DQo+PiBbMV0NCj4+IHZv
aWQgX19hdHRyaWJ1dGVfXygobm9yZXR1cm4pKSBmKHZvaWQgKnApIHsNCj4+IMKgwqAgX19idWls
dGluX2Fib3J0KCk7DQo+PiB9DQo+Pg0KPj4gdm9pZCBnKGludCB4LCB2b2lkICgqZnApKHZvaWQg
KnApKSB7DQo+PiDCoMKgIGlmICh4IDwgMykgew0KPj4gwqDCoMKgwqAgZigodm9pZCopeCk7DQo+
PiDCoMKgIH0NCj4+IH0NCj4+DQo+PiBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpIHsN
Cj4+IMKgwqAgZyhhcmdjLCBmKTsNCj4+IMKgwqAgcmV0dXJuIDA7DQo+PiB9DQo+Pg0KPiBUaGFu
a3MsIE5pY29sYS4NCj4gSSB3aWxsIGNoZWNrIHRoaXMuDQo+IA0KPiBEbXl0cm8uDQpJdCB3b3Jr
cy4NClRoZSB2aW9sYXRpb24gIm5vbi1jb21wbGlhbnQgY2FzdDogaW1wbGljaXQgY2FzdCBmcm9t
IGB2b2lkKCopKHZvaWQqKScgDQp0byBgdm9pZCgqKSh2b2lkKiknIiBpcyBnb25lLg0KDQpEbXl0
cm8NCg0K

