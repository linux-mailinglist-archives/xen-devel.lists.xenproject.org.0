Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C032178CAF7
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 19:19:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592409.925129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb2MI-0006mc-EG; Tue, 29 Aug 2023 17:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592409.925129; Tue, 29 Aug 2023 17:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb2MI-0006jp-BV; Tue, 29 Aug 2023 17:18:30 +0000
Received: by outflank-mailman (input) for mailman id 592409;
 Tue, 29 Aug 2023 17:18:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6b+0=EO=nureva.com=anthonychan@srs-se1.protection.inumbo.net>)
 id 1qb2MG-0006jh-J3
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 17:18:28 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20710.outbound.protection.outlook.com
 [2a01:111:f400:fe59::710])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fea28f1-4690-11ee-8783-cb3800f73035;
 Tue, 29 Aug 2023 19:18:26 +0200 (CEST)
Received: from DM6PR20MB2779.namprd20.prod.outlook.com (2603:10b6:5:140::30)
 by BN0PR20MB3782.namprd20.prod.outlook.com (2603:10b6:408:122::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.18; Tue, 29 Aug
 2023 17:18:21 +0000
Received: from DM6PR20MB2779.namprd20.prod.outlook.com
 ([fe80::c3:998a:f69:190e]) by DM6PR20MB2779.namprd20.prod.outlook.com
 ([fe80::c3:998a:f69:190e%7]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 17:18:21 +0000
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
X-Inumbo-ID: 0fea28f1-4690-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aUA02Eq4AvyOmeFSPG4zGQmJH6S02OwDL0+f6bfqwXO2V7O5acwMK71ECcmvYypb2ytpe2WHWP7tYcdCyezrGlYPez3sv1R1m4o0f+FZk+2HtyLMDO9WwT2g2fRqSUWvjhRt+x7bs0yqogO+72bO826JF52s0IWbkGdn6TpLa5X+Ra9ypDYjepAD+CBShr6eh371MWEM4YK3xgec7XTFyVkFpLd2R7O9dLf93I3wDGEiB7DzgrHhhWmHVy+aRSfn0rgSqrHDR66B6u/CgC9ZQcN5vq9z9bAdTVnNpo4TqNL0alFRnWSlcf2Z35lmATsKDcCmHqZaLz+78AzEofKbHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hk1Ga2xqhLC3Nr6HSOq4w0JF70qwQ6hTTTc72LioLE8=;
 b=l0qvXAzvCoPDfHJxnCOmJGBMoUOta3SRQM7/4TR3Q2OA1AVsbtqbwiMgMCiMALBS21lnB8LhqYSucfER8Ka/uHAfKElR0x4OfVNms9Mb+9X03LxlZAl5CF10p0B5/JmpDqB26v0nWW6Z+KO26tbDEYk17nK/usZdVoJsCypBWPu3ODGtpYIzGXPEPGUOLdh5M7VyHAKaSsXvW7KWFi+0HwPybz0MW3KEs70NBHIYIjiLTWVek3sU8O5jxZU0ntOg7gHEUlBJbjzAG6/cOeQTHw8ZKg4uQyPvu2XgyI1+E9mA7LU/tMk2dD3yr5A5SzFOFW2yQqxBTx3gIIOUVc8a7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nureva.com; dmarc=pass action=none header.from=nureva.com;
 dkim=pass header.d=nureva.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nureva.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hk1Ga2xqhLC3Nr6HSOq4w0JF70qwQ6hTTTc72LioLE8=;
 b=CWmI2GloI20yioUI4qBC6rf7jMztpAr1gFZfJk5SDbNVhLN6JJ2ypTcDlrugWHtjxef3bVnu2awphzao4PL7/sg2d4t+OC1ZOxoj7e4AOdCaf4ALCiqYFZ28qZYIU7e66VlRXBL+IDgMzguywT1vbGDOaZhRnuEmcUxKi40mn+4=
From: Anthony Chan <anthonychan@nureva.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: xen arm64 low power sleep support
Thread-Topic: xen arm64 low power sleep support
Thread-Index: AdnanCj70Orzia5aQfSER7H0AUNnzg==
Date: Tue, 29 Aug 2023 17:18:20 +0000
Message-ID:
 <DM6PR20MB277971712E5415CB231AEB37C1E7A@DM6PR20MB2779.namprd20.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nureva.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR20MB2779:EE_|BN0PR20MB3782:EE_
x-ms-office365-filtering-correlation-id: bcf82bbe-f4d4-4175-4cdc-08dba8b3f1a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 R3W46cDGqXNfGK0yRMKYWyPMEkx4kxL5oLKXEIBtjEoqZpBUoN0Ud+LlvQGwqJglTxN2jcBap7X5XKKD1lbu8K//D+ZHZL7dvXDJio9ErvqY28+g7ELZKVvcqYOofL1B/qXEIp/5bjxUqf1shvotwVUp4iRiNoGchC/ViwDrFyfzaGiXy2D5idTVYEk0EfWSx7YL7WNzZwR5ZDFmvc3LUJWqInZW5PZQMIB+gcrq5LEfc8JtwN6GFvU1+NdN4ADDlcbAhhHOSizl4j8p+TCbYbXZMleia5TthHTFclU9pr0Y0SOxlcrjygvp77DvW6SR5W7kGdiEQdgjDxl4+Qx7fNQAM5eQ0+pmzdAs9o8fYx2tT0KZo+UFXKL6JnYJjfP8Mdcg3nsN6McZlTSiqaE14LagHB+4YDUXXK+f55tK7HgrgZdMKc3rCEyDd/PJqOIUlGQ+t5B+nQ+f1eMNDmo8bTkvGQbzPzX+WClEc6XXIMJgZF1cJr6N8jxvZjfE57EywmHgsFHX5az2lKzR3Ewtd6KLxPPLiiodwlWPzTmSJir/WHJKCkkuOt2nmCYsZHmqF4sqYkqRgqyKCEvq3OHq8aoQlT/inS9vSU3sYob40riRu/xaQyG8cXzc+Rr5LNA805taJrmUiJg3ejfcVsu9mg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR20MB2779.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(346002)(366004)(39840400004)(1800799009)(186009)(451199024)(8936002)(122000001)(478600001)(76116006)(7696005)(6506007)(71200400001)(66556008)(66476007)(64756008)(66446008)(66946007)(6916009)(38070700005)(316002)(38100700002)(41300700001)(9686003)(5660300002)(8676002)(83380400001)(2906002)(52536014)(86362001)(55016003)(33656002)(36394005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?gVmpBEmlQYVNv+zueR+SrRwMtY+4zWIL1gd5hb8PaNnxVczoNZhnx9UCQD3l?=
 =?us-ascii?Q?mnFgJ9DXrXkY15CvqQhelr6ROE+w2hQRndVZfJTVoTgFK95etX6CDdpZ56rW?=
 =?us-ascii?Q?dtXP2TRXlqiGHOUwXuf20a2NhSOQi6ldfPmShbm50Fv5/VokR/11nLgDFiRv?=
 =?us-ascii?Q?laXoag/4PPA1qwrFIJXBq7WmfYhyyFZBWaA1RQw2uF83DEEYUgrUKUJmbm66?=
 =?us-ascii?Q?5132k88vGJzo6nV8kF4dfnaOh2EhdpdyuImRmnHOBULLEYd+Aydwac5PzZTw?=
 =?us-ascii?Q?JtbwgofthynpMvQjks0f35hUZwN1AJcjlIaoo3/uIzG48H2TD+tjYaxMc08f?=
 =?us-ascii?Q?ckp0Q21aBThXdieGMOQCc764nyNxEm36oQ5JAjuMgat04kCaJtpkhsqsnA7L?=
 =?us-ascii?Q?PPA/HaMLrdrk09gW4ODZr80ziLK7ylUkjtEz5zBqkiSgSjDinR8SzSdT0TiZ?=
 =?us-ascii?Q?YI9PSkFvkeMDLg56vFTqUivKQKeRP1JruOMZFxG0u711SrvkNIp+Zg6Yn+RT?=
 =?us-ascii?Q?ZDVZhEtCvpU/ikd/U8Dqql+mTcN9uuacBINZFWxk01VwTjvo0M8BOTELuH3P?=
 =?us-ascii?Q?6ITJWQqHXTg2GCdUg7qoJNDF+EwoTetkl8CB4iEtsGnQjI6pj7nqZcf5i3Lw?=
 =?us-ascii?Q?8cDDmLmJyu9UNIX1W0NUxio0mJAKpC4QyRXFenmMC/VV6zKXbTD8sT8F/Dx5?=
 =?us-ascii?Q?NK4RFM1mwxH9vi1dXTdUiEZPIVFVvxvi1cVkPIAO/KGeLgRiTZ87UI3Hh/H9?=
 =?us-ascii?Q?P8egJmPt/UZMCVSnlwSqgnXRDH0MUWz9r3e8GrxO83FNXYLdS41zBWpDqa1O?=
 =?us-ascii?Q?HXWkbQKjOD31VLhmoSSZBzbDHxHnBP4SzxRGn/PuwMp+JK1blwnyQkrQPqen?=
 =?us-ascii?Q?N+sbfjRiJ56ADMDPheNpe8QkH4AvKsSKdB77GlJJfCtnEihInyW5sNBvk+0I?=
 =?us-ascii?Q?7EToLyjd32PkZoy1z7pO5SYSIax2tyPvb2M+LVw+hkibB5MQNPFOs/AR/kdA?=
 =?us-ascii?Q?BeBbm4ETJFBocxnBdXuXY/IqUcrs7CnaD2FDUq1Hd/ass4RwZ72eQJ1sOqQu?=
 =?us-ascii?Q?+z3yvMpbwMGJ84mP6GuMrvxS2wFUFo6dQQYfLhrTBnHpxhryCvM6vBfF5Egv?=
 =?us-ascii?Q?uKELgfVEq78Ccm+jGdZi7cNEeEyMQbDA1w0isOR1HUOkYMdlR09S7Zo5XYMw?=
 =?us-ascii?Q?qK+/O1FDHYqUazXZL40aA7+OfxKg09r17FS4tAhBAcNnL4T0zGET+EvVb6c0?=
 =?us-ascii?Q?kJOiCDK9bfaS1Eu36qzT2yF9NYUOJJi5KIlDRgtfCjRmpPz0yOmhkHRwLWRp?=
 =?us-ascii?Q?HIkMzuASn393caDh/npVkc8Tq21mFIwR0wLC7gaU7JPflGZacSyTQuRak/C0?=
 =?us-ascii?Q?rHSJsQv6EYsk/zjlUNMfCcP/BNomCnDdAJ4v2UfUr8iLIQoiiArUqOG/rd/P?=
 =?us-ascii?Q?k12roPcDrmiSLctheooEfA3PbcKS+IJr0TLc4wOVIx7AxywBqVeLtUAPlWn1?=
 =?us-ascii?Q?CNiH+snAVkM2SnQ+Fl3bat4kn3LHf+D350jCUTLDmwRPha4S56lg6XGFuHog?=
 =?us-ascii?Q?KvezrrzWg6gi3iNTbHuefJcGqtwaQoz+6+THNS1RJXy+twhlzDYCBoQLT89J?=
 =?us-ascii?Q?9WFJyo1HVtE57UL1YCOqXd6y8EfY+1SUuMT+V6Q2Sf0V?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nureva.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR20MB2779.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf82bbe-f4d4-4175-4cdc-08dba8b3f1a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 17:18:20.9807
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5aeb77fa-643b-473e-aee0-cb54a11ccba3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V6znysuKwaqK9uCpQlxxbnIfGXJ4XNCPjcqHpT1HtocuprqQEcwX5AwaqvHRKDFuL+sfIucOoWtke/FYcU7A6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR20MB3782

Hi all,

My name is Tony and I've been researching/developing using Xen for potentia=
l upcoming uses in our embedded systems.  I started with Xen using Xilinx t=
ools about a year ago and still have lots to learn about what it can to do =
in the embedded space.  So far, I've managed to integrate Xen and Linux int=
o an existing product that exclusively runs bare-metal code on a ZynqMP SoC=
 and migrate some of the functionality into custom Linux driver/userspace.

I'm now looking at low power support, for now at least between Xen (4.16) a=
nd Linux (5.15) dom0.  I've tried a few different Linux kernel configs arou=
nd power management and each time I try to suspend from linux dom0 (via sys=
fs or systemctl), Xen will watchdog on dom0 guest.  AFAIK, Xen should trap =
on a 'WFI' from guests, but from what I can tell debugging through the linu=
x suspend process is it's spinning in a 'suspend-to-idle' loop before it ca=
n get to issuing a 'WFI' or using PSCI interface to notify Xen.  I'm beginn=
ing to suspect that 'low power' support for embedded arm64 just isn't quite=
 there yet, or am I missing something in the configs?

I realize this could very well be a Linux 'issue' but checking here first. =
 I know Xen presents a flattened device tree to Linux without CPU idle-stat=
e nodes and maybe this is causing the linux guest to only do the suspend-to=
-idle mode?  I should mention that I'm booting up using dom0less feature if=
 that matters.

Appreciate the help, thanks.


CONFIDENTIALITY NOTICE: This e-mail, including any attachments, may contain=
 information that is confidential and privileged. Any unauthorized disclosu=
re, reproduction or use of this e-mail is prohibited. If you are not the in=
tended recipient, please notify the sender by reply e-mail or telephone and=
 permanently delete this e-mail and any reproductions immediately.

