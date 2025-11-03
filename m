Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E932C2BFAA
	for <lists+xen-devel@lfdr.de>; Mon, 03 Nov 2025 14:10:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155317.1484815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFuK8-00014n-1I; Mon, 03 Nov 2025 13:10:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155317.1484815; Mon, 03 Nov 2025 13:10:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFuK7-00013L-UZ; Mon, 03 Nov 2025 13:10:15 +0000
Received: by outflank-mailman (input) for mailman id 1155317;
 Mon, 03 Nov 2025 13:10:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mu17=5L=siemens.com=haseeb.ashraf@srs-se1.protection.inumbo.net>)
 id 1vFuK6-00013D-Eh
 for xen-devel@lists.xenproject.org; Mon, 03 Nov 2025 13:10:14 +0000
Received: from OS8PR02CU002.outbound.protection.outlook.com
 (mail-japanwestazlp170120003.outbound.protection.outlook.com
 [2a01:111:f403:c406::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b090845-b8b6-11f0-980a-7dc792cee155;
 Mon, 03 Nov 2025 14:10:08 +0100 (CET)
Received: from KL1PR0601MB4588.apcprd06.prod.outlook.com
 (2603:1096:820:87::11) by SI6PR06MB7269.apcprd06.prod.outlook.com
 (2603:1096:4:245::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 13:10:00 +0000
Received: from KL1PR0601MB4588.apcprd06.prod.outlook.com
 ([fe80::3f19:282d:5fe2:f523]) by KL1PR0601MB4588.apcprd06.prod.outlook.com
 ([fe80::3f19:282d:5fe2:f523%3]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 13:10:00 +0000
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
X-Inumbo-ID: 6b090845-b8b6-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vg1GBNIOllAjla5Z5QuItxQY3lCdq8KCPQv28II73FlCtEtyJjkzE4CQHv4FVXS0Ol0ZXAA7jcLAtCJerBDmLuOLbjFuuWFSFUdcZyF+a5o4hMJQhBr4hHbfBiVVwwNzJIz9TWM+bD7LTJQM+nv7zLSuOzGX0EqqR4yHviXS/HBwVs0+tE+1/mLuFg6Vmpf/uHXCUw3bvmdKjpDVNVmqBm697UVYZVOZIjAq0372rhLrgNaOc+TlMFbmGQN1+jWRqKzpGfvU3RkbRHkMdZc2R1jfhqu9l94aogFmf6UxANG4G10AaEKNx+qmdNg0hopPGGodG5Dq5gHKCfwXZzO1Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sg7KT3nkexCZILYzqD2htHGlVY1KzhF9/rVFt844FwE=;
 b=UiA9smRzyPQtouqPUbH1nU9eXw0/ccBLJ7KKzw8jodE+oXK2DgiZcpyksS9ncKmRs3oR9YxDoUJXIR50fkl81IE5wsC/17Dnp4xuDcOzP9j02gjyIyrdJ07qCeptFDshujf0s20qegunu1/F3J2be8brZDnMDjejqrfZ2v8ey50dOKT533/IuY2yqr60FfxTtaAeZbfbuBWwjDTLJYbDAjwwFpiLL1fiWEEMudqWFvQS4Z4ODumMvVqsxkpNM/eVtG2opYUBrmGdvw9CynV2sxLToA3OR8DU9pjZ6nExvfJ9hYJRleVmd7TJDH4l0auD6Mwt1D2go66134uO+ji01w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sg7KT3nkexCZILYzqD2htHGlVY1KzhF9/rVFt844FwE=;
 b=TU3xxjS+ifOyngU9jg9PAyu+poa9GeSEZm+exP/B5+EG1c0bahapyJt0ogRaaxynUh7SAB9qDYJzd6yBpz7bREYkiYev2yYA6Mv0juLCM87oJXpbDgenelQNz3TmBds8rf7CF0+ewpc7PWIhL64GEuVaIyUbOTg2PXCActy3HDt8a0uQeIvmFUDe+888UFMqY9saRCfz2FGqbdtvfl9Im5j/SBGK42tXz6OKY7FKETsHbrHGxRwexoP6kDR1YMbnyTmPeJBjV3nUXa/P8YaO7PWZ+kSVGnLz8WPJF3DMuljZEoO4lFXcsUe0POG192CZkih6jY7s35rgtsWAEwUD/Q==
From: "haseeb.ashraf@siemens.com" <haseeb.ashraf@siemens.com>
To: Julien Grall <julien@xen.org>, Mohamed Mediouni <mohamed@unpredictable.fr>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, "Driscoll, Dan"
	<dan.driscoll@siemens.com>, "Bachtel, Andrew" <andrew.bachtel@siemens.com>,
	"fahad.arslan@siemens.com" <fahad.arslan@siemens.com>,
	"noor.ahsan@siemens.com" <noor.ahsan@siemens.com>,
	"brian.sheppard@siemens.com" <brian.sheppard@siemens.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>
Subject: Re: Limitations for Running Xen on KVM Arm64
Thread-Topic: Limitations for Running Xen on KVM Arm64
Thread-Index:
 AQHcSVi3paxtnyIgIkOf6jhuJCbvfrTalv6cgABtkgCAAFoJgIAABxcAgACWJ4CAABonw4ACEJkAgAKjdLQ=
Date: Mon, 3 Nov 2025 13:09:59 +0000
Message-ID:
 <KL1PR0601MB45883069D3725975B49761D0E6C7A@KL1PR0601MB4588.apcprd06.prod.outlook.com>
References:
 <KL1PR0601MB4588D25A95D680640A80F2CAE6FBA@KL1PR0601MB4588.apcprd06.prod.outlook.com>
 <KL1PR0601MB45885505ECBBE9262C2B25E0E6FBA@KL1PR0601MB4588.apcprd06.prod.outlook.com>
 <FC5C66FD-8554-4F46-8546-B27DE76C8EEF@unpredictable.fr>
 <2b00a98f-6fee-4341-92bd-25909ebb6e36@xen.org>
 <CA753BD2-31FA-480D-B32A-2125F0F4981D@unpredictable.fr>
 <fc181349-d743-4ef0-bcd2-01c04d2a463e@xen.org>
 <TYZPR06MB4580126B98C6A38AA710F597E6F8A@TYZPR06MB4580.apcprd06.prod.outlook.com>
 <01527182-ccef-43a5-be55-a5450eb7919f@xen.org>
In-Reply-To: <01527182-ccef-43a5-be55-a5450eb7919f@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=True;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-11-03T13:09:59.089Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=C1
 -
 Restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=1;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0601MB4588:EE_|SI6PR06MB7269:EE_
x-ms-office365-filtering-correlation-id: 3993c0c8-18d2-4c15-284f-08de1ada4b38
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?7AYV0/4Qh4rxW7VclQ78Y90nJ0YohuRBskCw9Ekt+aOnBX32nPePwhhh?=
 =?Windows-1252?Q?BtmiraXr6IpqW/wOp9IeklpV0ZOrZqTXBpveb82kF6Sws474fWTBRD75?=
 =?Windows-1252?Q?0RAICD5Tzb3e8nJZPwUbqEzPscKMQQylLXxJCuD4DD1PE9WFjQXdowdu?=
 =?Windows-1252?Q?eVO2alKt+jXYenD/yCNdSWqLiO/nZ4R51LtMXpqQZnUTy33X4QVm0AJN?=
 =?Windows-1252?Q?T70LmAKG4kl8t7m1YTZ+CtrA+PF7VxOlrrUb0BpWmjrek7hxXMVtPSeO?=
 =?Windows-1252?Q?+hPM1YIuWQy993H2ukukfn4odl8CUeUuWfK88eUwujFvsWwV9OHJZdvY?=
 =?Windows-1252?Q?15K72ZlG6fuL/KaDWp/s1+u9T2e0XjNkrZ0WRpNa1kkIKvW9hktT7UQl?=
 =?Windows-1252?Q?gHuWCgbvTqHIHTPm2FmGf1JrFXLewzvi7bq3a9OV5vhmhpoTN/eczEzV?=
 =?Windows-1252?Q?qFN97p/2fMM0+BVS+DBeI26TtIeVJf564UvTVBrwRX3HUDltWdT3Z1mX?=
 =?Windows-1252?Q?6Z81Pj7Taoi/3ByGLwe/ApXFm28Px/QOgEuFOKkzoTzE26VcvvxaLoQO?=
 =?Windows-1252?Q?2cjhMgKARkGXdf2It6VXT+Of/49xA20EvtOJUVUXcIxM57jZuZi5P0Wj?=
 =?Windows-1252?Q?OkgE4ddZlooitBdkGISb6savt+2RquZugz/vA7a0RNZqdoJx8DF9A3VV?=
 =?Windows-1252?Q?kHLzo3Y2tGUaYUV6bCk9AnCesp5oOBKd2cFNodNm/yWDWruDInQv1dDl?=
 =?Windows-1252?Q?yYjFp8nJlCR6n0DFAyeaXHEsNqmOjwONpwB5gdhxHggTboxRRIY7UMGz?=
 =?Windows-1252?Q?LgLejr8wpQK8qrN1kFvxaMR7CbRfZNQNDgOveFTOHjb4b2bI48zjJxLM?=
 =?Windows-1252?Q?j2V6JBNA6Ob+yvQc6U92neAjhRnIP64qFASa7EUQPcWMIt2kk2qgUBEu?=
 =?Windows-1252?Q?S7OljAy89cTHE4L5y2HyPtIvDHomtpxWN42HYViPDb9BDm656T/H/T1M?=
 =?Windows-1252?Q?Kqi8dSldp+iMT2vUhwNntQb/hYE9fUAQmqgEnrEjFW53nzG0SUb6z70T?=
 =?Windows-1252?Q?sPZ4LihDXewr/slvvjoqgWhtzUYzxx6BVLKgmYdvjDJWbY9b7OJBKEWL?=
 =?Windows-1252?Q?OFNssveJGVkc8ZAGR2skEefhhd7J6fkA8U5lK9YuorYlhDO948/wvpht?=
 =?Windows-1252?Q?L+DcTS/LL8dIvZw96gQ/f7mUVMiWhxKE/I8GCo30XFOz4MzfmEzOvjSN?=
 =?Windows-1252?Q?YSRknL14vTxcIwRummlhQYxZqlamFp+FWFp2VqAx7pVQkUd/YNSlflYl?=
 =?Windows-1252?Q?p+Pzv08CqsBIopvYgBnDaOEMC00rACMagMuP6MEtn1OsSGdvAwSzYyo1?=
 =?Windows-1252?Q?jlKglg1/gQdl2yFOJyiyCpoiOm1xBlIi+o61ZBmawSlDW8d9bwHr3TbQ?=
 =?Windows-1252?Q?gzPMF6X0wkAqOvzpZ6ssALcxYPJKcPyruuacbY+Eif27DPvhdsw7j+EF?=
 =?Windows-1252?Q?zFIB9xJ3JqZlJOXjlpT8mLzIk06I6c3VRxe75jy7j8JbVQ4fIBGEE7p9?=
 =?Windows-1252?Q?yHOCSS6sn2ixN6DRSehlI7tZFcrJoX892s9mqQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB4588.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?7xtYTtCS7phKB6up4jYnSjfhNEWstLtmg8B9/CLx32fupPEQLtYaZftE?=
 =?Windows-1252?Q?iBjEsXtLPmbM5Y4IzYVifja7K1B6ga4L5jRgnnMvVqfKKirh8kobZhj2?=
 =?Windows-1252?Q?ulLIn/x7/JZw4FxOw8HxILprr5MQn/GHHNsKXHP3yJEvrLqT2LTrfGy8?=
 =?Windows-1252?Q?xjE5HfNEf2ivmCi1mhHakEH4Almf3HS3+hpaKZxCSTIG1f1NhNgCirh3?=
 =?Windows-1252?Q?aJDTqqqeGiNPolCcOTubICvKqS7l6mebxQLun+5Hcx/wdLp3tyBtJHrj?=
 =?Windows-1252?Q?lJzlghYCDpbWod/+7DtpN3rRmJW+4DqKsHSW7CvVd1SB204QjdhnWj+Z?=
 =?Windows-1252?Q?uB9q8Hvq28uOj6MkfxrvvZ6pEIv9mBbaFP7zTsGRZsC2He7jki/mThpU?=
 =?Windows-1252?Q?qRePxzlJ5aF3WIIyhVIaxorlCluEfqTIFsQxCUrz2WL55E/IDHpbTQC+?=
 =?Windows-1252?Q?wZzwEOehxoaiGy7m580iL7zqd54nliqLZT6WiVMtohwHlp/LJfhpNQqf?=
 =?Windows-1252?Q?JiSEQCAunyI50vM6WwgW3A2B5HCyTUc8FEF4Jvw7yvFcMOJXALDcGluq?=
 =?Windows-1252?Q?fH0Rw310MpZpE9L0AYu6rmcpR0rnREQMTYIuwIcLpnQgmspB4yyy+bFT?=
 =?Windows-1252?Q?EnBpwzxHo0e7lfwDr8vidnJG3uerU3ZE+1ytnxLLgTU/gBHKgskUyqw7?=
 =?Windows-1252?Q?z8+Bl9zoX7kOgkVnr7XPbCllLhjxsqzmTWZZzljfhfdbl6h7+0g5MEPo?=
 =?Windows-1252?Q?t4LQwfrCKZiResAGWDjycUXaqkDLHByYblkszBhnW180gZcJaWkt/YE6?=
 =?Windows-1252?Q?jeg52I7LZybFygPN9z+/iC1z0jiLYX2d4AjdJjAWncTR0rDD5RTb9Pa/?=
 =?Windows-1252?Q?t/xpBxthOzp+HSG/l27ZC36dpZpmeWI8KaYFR3Lr2JiSXn0I5Mg8N9kH?=
 =?Windows-1252?Q?XomgUcrAP6zY3nl8bkI9/as2XnMs64TpDHdWiHVZLDPDE82BcI2DLbwT?=
 =?Windows-1252?Q?ej9KrE9sfUXBsr7EWUTncLmwnT3okn1bNHhM9Sh75H+UieIjkJ8v7+l8?=
 =?Windows-1252?Q?IKNnTUQRfTz2tlvwjsBUfGhLKNfOJ0b3PpZJkM8e9Pg28oGQxoUpSVwH?=
 =?Windows-1252?Q?wr5JusFhtGkkoLJ0TP5R5GTqjn/EaPS+srptDHu9bxLHFoK0t9/HC+2x?=
 =?Windows-1252?Q?d38VE7LWIk9/diOgoIkUeN6ypf1HqTfcqzQj4CVcP8g7l7htgoOQNSBJ?=
 =?Windows-1252?Q?Emb8poYezyTx6wUwi3ipnEQiOEekQbSzcRwqpTrCIa96L8BT/TltJ/gU?=
 =?Windows-1252?Q?bOQ02OwMfqdxvgA69kD+FL02sQ+N/EDAX6qldZLtC7zqpms2F8ngfvvW?=
 =?Windows-1252?Q?IwOngGy29MmOyfB4SLcUs1QpLylc6tZWhGqc3gYfbQznWhDsdeoTz77q?=
 =?Windows-1252?Q?ry+bE80RjPH9upKtW7+baTJazN43PlNdZrmHcgwXpry44+Ts4EzXXdJZ?=
 =?Windows-1252?Q?4en2aw19kjlGT9FUpqCo8qD+8DtF1s2WhoIgdDRgZiCqtLned36sT4TB?=
 =?Windows-1252?Q?zMVAszAYczHqczkRBZsKp+vCXFSqGDpcf+O3TV431oEzB8/3Ip3PsESh?=
 =?Windows-1252?Q?RwhI9oMpAYvnjPIuSgu5KncL6qub+PFHS/OcP5Awyzps5tKnSGtWDLSH?=
 =?Windows-1252?Q?TbTwrvwFwZu/fQxwzlUXilH/Y/GgJWVn?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4588.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3993c0c8-18d2-4c15-284f-08de1ada4b38
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2025 13:09:59.9938
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BG7wIiK50vhWE5BZOoujh6NxgTYGEHsaYQ/pHOyyuas9g8tcqO7P/1h/J8lvPZnhUSXpj+wHgOz1Fu05OVjN0GXkwEkr2bivYdor7lJTchE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI6PR06MB7269

Hi,=0A=
=0A=
> To clarify, Xen is using the local TLB version. So it should be vmalls12e=
1.=0A=
If I understood correctly, won't HCR_EL2.FB makes local TLB, a broadcast on=
e?=0A=
=0A=
Mohamed mentioned this in earlier email:=0A=
> If a core-local TLB invalidate was issued, this bit forces it to become a=
 broadcast, so that you don=92t have to worry about flushing TLBs when movi=
ng a vCPU between different pCPUs. KVM operates with this bit set.=0A=
=0A=
Can you explain in what scenario exactly, can we use vmalle1?=0A=
=0A=
> Before going into batching, do you have any data showing how often XENMEM=
_remove_from_physmap is called in your setup? Similar, I would be intereste=
d to know the number of TLBs flush within one hypercalls and whether the re=
gions unmapped were contiguous.=0A=
The number of times XENMEM_remove_from_physmap is invoked depends upon the =
size of each binary. Each hypercall invokes TLB instruction once. If I use =
persistent rootfs, then this hypercall is invoked almost 7458 times (+8 app=
rox) which is equal to sum of kernel and DTB image pages:=0A=
domainbuilder: detail: xc_dom_alloc_segment:   kernel       : 0x40000000 ->=
 0x41d1f200  (pfn 0x40000 + 0x1d20 pages)=0A=
domainbuilder: detail: xc_dom_alloc_segment:   devicetree   : 0x48000000 ->=
 0x4800188d  (pfn 0x48000 + 0x2 pages)=0A=
=0A=
And if I use ramdisk image, then this hypercall is invoked almost 222815 ti=
mes (+8 approx) which is equal to sum of kernel, ramdisk and DTB image 4k p=
ages.=0A=
domainbuilder: detail: xc_dom_alloc_segment:   kernel       : 0x40000000 ->=
 0x41d1f200  (pfn 0x40000 + 0x1d20 pages)=0A=
domainbuilder: detail: xc_dom_alloc_segment:   module0      : 0x48000000 ->=
 0x7c93d000  (pfn 0x48000 + 0x3493d pages)=0A=
domainbuilder: detail: xc_dom_alloc_segment:   devicetree   : 0x7c93d000 ->=
 0x7c93e8d9  (pfn 0x7c93d + 0x2 pages)=0A=
=0A=
You can see the address ranges in above logs, the addresses seem contiguous=
 in this address space and at best we can reduce the number of calls to 3, =
each at the end of every image when removed from physmap.=0A=
=0A=
> we may still send a few TLBs because:=0A=
> * We need to avoid long-running operations, so the hypercall may restart.=
 So we will have to flush at mininum before every restart=0A=
> * The current way we handle batching is we will process one item at the t=
ime. As this may free memory (either leaf or intermediate page-tables), we =
will need to flush the TLBs first to prevent the domain accessing the wrong=
 memory. This could be solved by keeping track of the list of memory to fre=
e. But this is going to require some work and I am not entirely sure this i=
s worth it at the moment.=0A=
I think now you have the figure that 222815 TLBs are too much and a few TLB=
s would still be a lot better. TLBs less than 10 are not much noticeable.=
=0A=
=0A=
> We could use a series of TLBI IPAS2E1IS which I think is what TLBI range =
is meant to replace (so long the addresses are contiguous in the given spac=
e).=0A=
Isn't IPAS2E1IS a range tlbi instruction? My understanding is that this ins=
truction is available on processors with range TLBI support, I could be wro=
ng. I saw its KVM emulation which does full invalidation if range TLBI is n=
ot supported (https://github.com/torvalds/linux/blob/master/arch/arm64/kvm/=
hyp/pgtable.c#L647).=0A=
=0A=
> On the KVM side, it would be worth looking at whether the implementation =
can be optimized. Is this really walking block by block? Can it skip over l=
arge hole (e.g. if we know a level 1 entry doesn't exist, then we can incre=
ment by 1GB).=0A=
Yes, this should also be looked from KVM side. I think to solve this proble=
m, we need this optimized on both places in Xen and in KVM because Xen is i=
nvoking this instruction too many times and unless KVM can provide performa=
nce close to bare-metal tlbi, this would still be a problem.=0A=
=0A=
Regards,=0A=
Haseeb=

