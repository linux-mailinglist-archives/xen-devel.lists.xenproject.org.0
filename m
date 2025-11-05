Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AFEC35E11
	for <lists+xen-devel@lfdr.de>; Wed, 05 Nov 2025 14:40:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156248.1485479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGdjo-0005GF-C8; Wed, 05 Nov 2025 13:39:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156248.1485479; Wed, 05 Nov 2025 13:39:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGdjo-0005EA-8W; Wed, 05 Nov 2025 13:39:48 +0000
Received: by outflank-mailman (input) for mailman id 1156248;
 Wed, 05 Nov 2025 13:39:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eIH/=5N=siemens.com=haseeb.ashraf@srs-se1.protection.inumbo.net>)
 id 1vGdjm-0005E4-IE
 for xen-devel@lists.xenproject.org; Wed, 05 Nov 2025 13:39:46 +0000
Received: from SEYPR02CU001.outbound.protection.outlook.com
 (mail-koreacentralazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c40f::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfb32088-ba4c-11f0-980a-7dc792cee155;
 Wed, 05 Nov 2025 14:39:40 +0100 (CET)
Received: from KL1PR0601MB4588.apcprd06.prod.outlook.com
 (2603:1096:820:87::11) by SEZPR06MB5919.apcprd06.prod.outlook.com
 (2603:1096:101:ea::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 5 Nov
 2025 13:39:33 +0000
Received: from KL1PR0601MB4588.apcprd06.prod.outlook.com
 ([fe80::3f19:282d:5fe2:f523]) by KL1PR0601MB4588.apcprd06.prod.outlook.com
 ([fe80::3f19:282d:5fe2:f523%3]) with mapi id 15.20.9275.015; Wed, 5 Nov 2025
 13:39:33 +0000
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
X-Inumbo-ID: dfb32088-ba4c-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O297pGzk0pfx6dod8SFsnAgfHH2EMEk4ZC07Nc6PiVz8zKuRNJd6OFPUFIun3EK2TgPJ7bLXutEoaMm8I9QywDe6LKhG58S9ePSh/s4XfDReIsU+VDcWFKajjOsMYkpYRK1qoQOful18pXU2thvJ41x0BozgmKTYUWq2VJuEMZj3QR96yh9JWa0MysDsN+s6PUT+SPRFRdTOKj/4AEcQcND/cHZQgel2jxwlPliBwA2XBt1/vTFMf4RaRzlxJJze92iUpASLEw8SGTmJaDj4SzyYEyECOiqK/bqmXfOkUxQE6WnxXo3hQqgeIFUZRqtBp/Yb5NH2oge5uRjfd+FCIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HBdoUnBFTYdqfZaHh9SgfeSv12uYNIWkb5hMhg+9dAQ=;
 b=Dx0zrqOlfChiirFK5LBpOhNjlwFpJrneJT/N14qrrXAzcSiJmiwcnO4PrRglyjW6BNo+SRqM2pYH9xLoDGWPQ/bzGAwOuO6GTuB1plm4zTLsjtnM/0GpcWAzZdDe5UKMFZqfeN0Wv3LxI04GBbGRR8O2LdrvSckgfgA4CR00Un13aZZ+RuBiT6MK3mQKF/iwwlVFYj1qlc4D1Nc3ByItWpInImqEgen5WWE+QQf0B1+jBbfqn0YwCS9QVrVCn8PqqZzjEu3ORTvMSYZWQ+mlEwPdqMv6hdWcYtxTx0gG9cYDG0sCh7EgW8uK+q9WjJWR8lwPTcqtHP5BeIsup4Wbpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HBdoUnBFTYdqfZaHh9SgfeSv12uYNIWkb5hMhg+9dAQ=;
 b=l0TWpzhmQOAd1jipcOYTYLOB/+zAB7LW/VnygL+hdv6/dZtkTgPpSuQ7UbJzVAb1riifB21IXYJjD+XZ+gGD32PoyisxI0VSUsiuzR/AFigYrKZrOVy9zq1IrUr63reb4ecNrcHBHKbIbjELvXwJCvvV5kp8RXePhc5En2MiKZUzwqOdrndD6cHrnscZPqth2P87v8KUKSmWDrN+r3wy8gzgnNjY9pRidD+r48gYuxuNzVu6ZPeZ+boKdAKSiFZeRo6pbI/nG871a57zhq5RvILPaqoV8/qOTnJgbTQTa9M5opPwjwgaRm5HjRIYJ95zcmSVHqL9V0k9s4Rj15VL5g==
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
 AQHcSVi3paxtnyIgIkOf6jhuJCbvfrTalv6cgABtkgCAAFoJgIAABxcAgACWJ4CAABonw4ACEJkAgAKjdLSAAEALAIABEzaEgAIAPuE=
Date: Wed, 5 Nov 2025 13:39:33 +0000
Message-ID:
 <KL1PR0601MB458825063113CD4CB2F9440FE6C5A@KL1PR0601MB4588.apcprd06.prod.outlook.com>
References:
 <KL1PR0601MB4588D25A95D680640A80F2CAE6FBA@KL1PR0601MB4588.apcprd06.prod.outlook.com>
 <KL1PR0601MB45885505ECBBE9262C2B25E0E6FBA@KL1PR0601MB4588.apcprd06.prod.outlook.com>
 <FC5C66FD-8554-4F46-8546-B27DE76C8EEF@unpredictable.fr>
 <2b00a98f-6fee-4341-92bd-25909ebb6e36@xen.org>
 <CA753BD2-31FA-480D-B32A-2125F0F4981D@unpredictable.fr>
 <fc181349-d743-4ef0-bcd2-01c04d2a463e@xen.org>
 <TYZPR06MB4580126B98C6A38AA710F597E6F8A@TYZPR06MB4580.apcprd06.prod.outlook.com>
 <01527182-ccef-43a5-be55-a5450eb7919f@xen.org>
 <KL1PR0601MB45883069D3725975B49761D0E6C7A@KL1PR0601MB4588.apcprd06.prod.outlook.com>
 <0fd2b8e4-bdea-4d01-a2dd-8d2e4b37090d@xen.org>
 <KL1PR0601MB4588FE9914010324E0CFE328E6C4A@KL1PR0601MB4588.apcprd06.prod.outlook.com>
In-Reply-To:
 <KL1PR0601MB4588FE9914010324E0CFE328E6C4A@KL1PR0601MB4588.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=True;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-11-05T13:39:32.545Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=C1
 -
 Restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=1;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0601MB4588:EE_|SEZPR06MB5919:EE_
x-ms-office365-filtering-correlation-id: 98b46ed0-855b-4ee6-bfc2-08de1c70c0ec
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|31052699007|39142699007|1800799024|366016|38070700021|8096899003;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?N9TbLd/UCwnEsYQCir/cqT7qA3bhIYP0WQgoxJg9C2ysx7X6AAw36ZgvQl?=
 =?iso-8859-1?Q?8CDVro1R11PyycnItHYNiHC9gtgNO3C4TcvdQ3KRg3xDaaXgqnr/IqaSUj?=
 =?iso-8859-1?Q?L3RxalKPkpHJynB7aDbCNwFFKaOhwa5nK7wE0sYJLy1tVy33DHLeZfCHGm?=
 =?iso-8859-1?Q?EcfG1fCZvesvHE9gbwhgD7qWxEaewaVpuweIcs5MGqXZZRsNYs1I0zAeth?=
 =?iso-8859-1?Q?FjomiDsw5U1qznlNr98XY5waqr7G/fQ3dhUI0MEJ3iPv/fUe1FCBKoHqyv?=
 =?iso-8859-1?Q?fev73rcK1VMhG5XIEvrQkrKm0qQPiDO9TgnCA6LD4JXAbaAAWX9lLMuOFS?=
 =?iso-8859-1?Q?XLSz1tMsssn5AryCDbUeazEnlvM9FMDlZsFFfdiKOJA2A/2D6xzQVhXBYr?=
 =?iso-8859-1?Q?MwPy0WL9PEqwap+pQw18yaOaV1jduB/tX+bqlzJNd/QCBquspW+Lvbg0hO?=
 =?iso-8859-1?Q?SRIC240QyAV6+dkE/ezwzQhGAdlpGK9WAs8kbc+/2h3jPnJvoHmNhyabbI?=
 =?iso-8859-1?Q?n2QXNLcrY5V2jrOqw8TZiDR8//S4jm+TmMYmia+Oi1aVSwh2H0e4QeImzp?=
 =?iso-8859-1?Q?+JW37uPJJ5UbjciCYUIbxWk7v49sFqsC2Tg1Za+jgxUYk9lHBGtYjVC00O?=
 =?iso-8859-1?Q?1qN2l2U0+BTD0D4qArVqxAtSKmSqzprCkpb5NU4Z5fTPQW/J/q6AwlmupV?=
 =?iso-8859-1?Q?F4KIxSzq8FBPGaMaa46Jak8sekXonyBSbzcfHpOAOtVEaURkvQOHMtj70n?=
 =?iso-8859-1?Q?H1WJPFcrUB9gLlCD8Ko6yv17R8RLE1ANIjB5UOH9RCcylq70LUv9lTu4aL?=
 =?iso-8859-1?Q?DJSK1ehVNSQY/XOm3CzNZ2Dejp7Ib9dW15Fg3dprbHN7WSZHgXY/Gbscz8?=
 =?iso-8859-1?Q?tejiaU0uWPzGLQo3qovMVKBvaILWhWcacT4/zkP3SiuHgPI9YeCYNCMgMR?=
 =?iso-8859-1?Q?n8KtYoH1e/UBiy7A5wvBu7LJxaSCFLqvY0pKV+psNmstYozTTl8Pbr94gg?=
 =?iso-8859-1?Q?W6KW+C8JYTM/xNMcDnQ3qhEoqW8G5bANomLcqlplez+buzCPHDcHv7jnmW?=
 =?iso-8859-1?Q?aAl+2p++kiSU+hRpKZ6sFUIPfXvMKOgn0HVLg4yY41CyKnLLKiMZn1lISA?=
 =?iso-8859-1?Q?krAa4FOaFGTArqTTsD8KRLbZEpN5GjsL0YjsnSbGmm318SpUCFFa3m9BUI?=
 =?iso-8859-1?Q?sME3lpcBBBCRq7rpDta7GFGeIxKbfsWdQF1k9VfEoV3UXV1v3+OMIizVsh?=
 =?iso-8859-1?Q?W4f94DMNXzGA1flG858S9kwzYozU8xJtJY/jeSPA0H+RHW5/ZKVeKQgmOb?=
 =?iso-8859-1?Q?DQ3H0aVZ/+ogHQQudrmwSdoqw0ddB1HLcPYtsbLhEV6jdVEb9b8SR9FN7W?=
 =?iso-8859-1?Q?yQ3bxQjdmxw4W4j25G5jqvAuQwRKv5nKRv5Gs8LmTOSD4pWMANSX+Zwr2d?=
 =?iso-8859-1?Q?FYDUSsz9vOOe10XUOWHMlrtLEjkQrKvynk92o22W/UCVbY4n9CM5Tpuv8s?=
 =?iso-8859-1?Q?Xu5gkKmsZM2opqAv3qif0rG34VXJjqoIMOsNEYVHoZJGRLaMzart3S4UPz?=
 =?iso-8859-1?Q?qHJWsNlfqQLAWFplO7YKcH/S6qmJ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB4588.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(31052699007)(39142699007)(1800799024)(366016)(38070700021)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?/mcUM8kriw3JeMqz+Z8P2gzXhtg6/va0aC74uqCfEOjOvfyXIHpxKFAL+i?=
 =?iso-8859-1?Q?dLry0JZ9n14s2fA/lB5+zOO4ZCEAzF/JhTlFBMEkUgHzZ8nQ0z21Lup/0V?=
 =?iso-8859-1?Q?s1pu8NvaoE4GzbPrzuVWOKwgH/cpQyDO0b8bMynGgpXdXjTRFINJwcYfDM?=
 =?iso-8859-1?Q?/tXxRlyUwf7duzmdDzlK4F0gaJ8U0Vy7L0WHNZujRp/IYvKsyaHZIaW89H?=
 =?iso-8859-1?Q?rKgkh4DJa0FjdDnoh00h8IuuJO0smQSMIpKD3Bnm/4CIdjqE3qwT7GwxAr?=
 =?iso-8859-1?Q?r39YF5lowXpmwcxeCcRugvpVPlNnWId3vAz7Yj9jM0BQDq45IFsLlPgD2i?=
 =?iso-8859-1?Q?WJyFNqW0EwNAvsD4s9C53BRjmJFVdAYb9Z/zX2X4BFhp5zMgMN2eKYehzk?=
 =?iso-8859-1?Q?IGBcZ9kmWGu/ShBUCXC3mkcw/HIh9VvqLxnordNwzxHfVV9OBd1P0amLSo?=
 =?iso-8859-1?Q?7tpeou93Yae7mz+9jlPigABJ0m399DfGD6JFmUGJSfqprQtuavzwDZAqBL?=
 =?iso-8859-1?Q?AA6r+mmEg21trYG8WwLorGLus2kpMVARSsI6U2t8qIws//Dd6bYCQ8Wq8G?=
 =?iso-8859-1?Q?3OlocGBzJwjF08qS2SvUqwUpibVn0bvc+qmO4vhrDnWRjhXE54vw7M0Nou?=
 =?iso-8859-1?Q?knuHXoOPx5EmIzinG0WttwF4Se3t7I5xkEKoe+37ZTeuHPC7V6MNC8r1FH?=
 =?iso-8859-1?Q?+zwruKInzz7fsGIVi1U8iS82twwfm1tUdU/vEViovspug+eh4qaC/jkgpy?=
 =?iso-8859-1?Q?k+d25r2+zsrzseqKP8peZIW3m+lHce6a3/DvJBD6+y8blwQcnRaXnqjMan?=
 =?iso-8859-1?Q?sgXHWSpXTjDP/BKziRGktbPLRdNPA2k0kbUVzCF8C1oIhCB5co6DZFq2MU?=
 =?iso-8859-1?Q?JZlVe5bJZUf+tQYQz7uc6CbcZGfKFGrWDROfuvlQnS9sm3RwREOwrhfBB3?=
 =?iso-8859-1?Q?lJfKxip74RadwmmzGeJHaFIrhauNpt4soPeec4di6qmHuMGg9b3b0HhDDE?=
 =?iso-8859-1?Q?o10qqRDY2O8LORVwhvP2YIAoRf4k+hEU2uL2Xuf/wqHCVaUVX6lmc21bs5?=
 =?iso-8859-1?Q?SZkCQTZXI/Rv3AJEh1jvK2K+JNe87ZfFzeHsKrBdpYctZdaVo2W1i8wBIv?=
 =?iso-8859-1?Q?2eazzzsF347f5Vy1VR+MbvU552NZ4htWMxDTlSI+aCDX+J7YZIIAk87/xV?=
 =?iso-8859-1?Q?0w/AyWp3PqKfal6j7Vn53xX6gCe+zSX7KaXcJ7gOLj5DSM+SreBI/YVm2P?=
 =?iso-8859-1?Q?7AjwOemT2A+lYwh4q5EDqMcC1Z+ykvVoKp3n6Ycby4R29XPfWZ+3qv17SE?=
 =?iso-8859-1?Q?tRDj10lJ8zHnsm+VQh4GfuM7uotSIfRk7p0KFpRMd7CwwVGJE4R35SMb/z?=
 =?iso-8859-1?Q?B3LHKcC07hi1uebG+YHfmnQxj4gMyTHr2QNYBPj29ZnAPpk5B1KdXvwr1q?=
 =?iso-8859-1?Q?GWBEDhj++ac5nEsjYqeDkvU11INdm6GYvRtkHoyV+lxlZsKIoraR4BHHY0?=
 =?iso-8859-1?Q?vxH+wMsb/Cv2SRQNF62FFVrQ+uQVer10jZjn9KTNUpPM+2kPoQSa9LTZYn?=
 =?iso-8859-1?Q?VWrHAUuQHBJEhJ1O83KfYGBV0oJaRVW5hn+Z/JvHEA+dC+qRjLx5jCNZVZ?=
 =?iso-8859-1?Q?b59FdR0QIz9EzOLULCumhqYx8qd9pg4SlT?=
Content-Type: multipart/alternative;
	boundary="_000_KL1PR0601MB458825063113CD4CB2F9440FE6C5AKL1PR0601MB4588_"
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4588.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98b46ed0-855b-4ee6-bfc2-08de1c70c0ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2025 13:39:33.1694
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X+RukgQNa7y4dkP9nZni9LWWFDMICC0WlGBdbMOKX7zCxvbkmH1XOl0kpIYzgI2UepDAR0UPmdSspkcziUShyJ5Wq0ARM21Y5xn/ScIzcvU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5919

--_000_KL1PR0601MB458825063113CD4CB2F9440FE6C5AKL1PR0601MB4588_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I have sent out a patch using IPAS2E1IS. The R version RIPAS2E1IS would onl=
y be helpful if we have to invalidate more than one page at a time and this=
 is not possible unless a batch version of hypercall is implemented because=
 otherwise there is only one page removed per hypercall. Although IPAS2E1IS=
 can be used and the number of invocations is still same as VMALLS12E1IS, b=
ut the execution time is much smaller. With Ftrace I got:
handle_ipas2e1is: min-max: 17.580 - 68.260 us.

Thanks again for your great suggestions. Please review my patch, you should=
've received an email.

Regards,
Haseeb

--_000_KL1PR0601MB458825063113CD4CB2F9440FE6C5AKL1PR0601MB4588_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);">
Hi,</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif;" class=3D"elementT=
oProof"><span style=3D"font-size: 10pt; color: rgb(0, 0, 0);">I have sent o=
ut a patch using
</span><span style=3D"font-size: 11pt; color: black;">IPAS2E1IS. The R vers=
ion RIPAS2E1IS would only be helpful if we have to invalidate more than one=
 page at a time and this is not possible unless a batch version of hypercal=
l is implemented because otherwise
 there is only one page removed per hypercall. Although IPAS2E1IS can be us=
ed and the number of invocations is still same as VMALLS12E1IS, but the exe=
cution time is much smaller. With Ftrace I got:</span></div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; c=
olor: black;" class=3D"elementToProof">
handle_ipas2e1is: min-max: 17.580&nbsp;- 68.260&nbsp;us.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; c=
olor: black;" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; c=
olor: black;" class=3D"elementToProof">
Thanks again for your great suggestions. Please review my patch, you should=
've received an&nbsp;email.&nbsp;</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; c=
olor: black;" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; c=
olor: black;" class=3D"elementToProof">
Regards,</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; c=
olor: black;" class=3D"elementToProof">
Haseeb</div>
</body>
</html>

--_000_KL1PR0601MB458825063113CD4CB2F9440FE6C5AKL1PR0601MB4588_--

