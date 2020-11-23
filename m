Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 062332C04FE
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 12:54:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34086.64941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khAQS-0005gm-Kk; Mon, 23 Nov 2020 11:54:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34086.64941; Mon, 23 Nov 2020 11:54:32 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khAQS-0005gN-H2; Mon, 23 Nov 2020 11:54:32 +0000
Received: by outflank-mailman (input) for mailman id 34086;
 Mon, 23 Nov 2020 11:54:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKME=E5=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1khAQR-0005gI-36
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 11:54:31 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.86]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 374306a6-4143-48a4-b376-bfaefafa5202;
 Mon, 23 Nov 2020 11:54:28 +0000 (UTC)
Received: from AM5PR0202CA0019.eurprd02.prod.outlook.com
 (2603:10a6:203:69::29) by AM6PR08MB4215.eurprd08.prod.outlook.com
 (2603:10a6:20b:90::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.30; Mon, 23 Nov
 2020 11:54:22 +0000
Received: from AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:69:cafe::21) by AM5PR0202CA0019.outlook.office365.com
 (2603:10a6:203:69::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Mon, 23 Nov 2020 11:54:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT055.mail.protection.outlook.com (10.152.17.214) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Mon, 23 Nov 2020 11:54:22 +0000
Received: ("Tessian outbound 39167997cde8:v71");
 Mon, 23 Nov 2020 11:54:22 +0000
Received: from 57e2c3b58326.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 381B64E1-8FA9-4B68-8594-5453DF850408.1; 
 Mon, 23 Nov 2020 11:54:16 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 57e2c3b58326.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 23 Nov 2020 11:54:16 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB8PR08MB5242.eurprd08.prod.outlook.com (2603:10a6:10:e8::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.30; Mon, 23 Nov
 2020 11:54:14 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef%2]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 11:54:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sKME=E5=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1khAQR-0005gI-36
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 11:54:31 +0000
X-Inumbo-ID: 374306a6-4143-48a4-b376-bfaefafa5202
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown [40.107.3.86])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 374306a6-4143-48a4-b376-bfaefafa5202;
	Mon, 23 Nov 2020 11:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94dE/Vdt2QNAbG4KO6BqSxenWzr86t/S2QxJ/IFq3vs=;
 b=jFBdv2GWmXNeTROOmAU4+HWXXwIfmOdZL8z8wgDMeT9WLehXO8rWoRr+PHzav7tj08fnkamM5maOUMRr7HpSW9CTPilZulEUR5x42Vk5l9qnbyvV7ye43xZaraXzftIa9MMEId46dM/4j0RobrdU0j1PedZSzJ4alLF6ysAQ86w=
Received: from AM5PR0202CA0019.eurprd02.prod.outlook.com
 (2603:10a6:203:69::29) by AM6PR08MB4215.eurprd08.prod.outlook.com
 (2603:10a6:20b:90::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.30; Mon, 23 Nov
 2020 11:54:22 +0000
Received: from AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:69:cafe::21) by AM5PR0202CA0019.outlook.office365.com
 (2603:10a6:203:69::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Mon, 23 Nov 2020 11:54:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT055.mail.protection.outlook.com (10.152.17.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Mon, 23 Nov 2020 11:54:22 +0000
Received: ("Tessian outbound 39167997cde8:v71"); Mon, 23 Nov 2020 11:54:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 807cf874092e0f2a
X-CR-MTA-TID: 64aa7808
Received: from 57e2c3b58326.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 381B64E1-8FA9-4B68-8594-5453DF850408.1;
	Mon, 23 Nov 2020 11:54:16 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 57e2c3b58326.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 23 Nov 2020 11:54:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SjodCmwVFRuORotAIp6KQb7tH48Xt1UY4eCmtH5snc69ZIHyUGsvUp5LkA7yZhXdNuTjqlw9DwwoUFip1hYNMbmxf4uvpP7dKEmgvy2FnvH+skcqiaOiCaiCC09bf0nLmAfWrfjOYcqMi5BrhhzaOwM+nfisMXo3zzJ49joO32+vs80xhBgoW5TYzyf06DHNIrgDS8VEzby+9uwKiaWD9qZuAua4qjwUNivBAQpvGFUNBNrnX1ix+YZJMiMnxHQdkkv05zU9IraHgkjrcIuHFGuS8uK//JtnqOQn8YMtztx+/kDMREQSvXHjHQP+p/71xA7LtgyAbVXaq+BnUZpFjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94dE/Vdt2QNAbG4KO6BqSxenWzr86t/S2QxJ/IFq3vs=;
 b=d4eLFJoMRoZIi1joApcorPo3qEdt54qm+w2yg5ynzWlgu9+9nQcv/8JRiht9/F+KHbgfKmNSyC/G27ANETHfexf3xyZpU/lwZLPaqeYX3thVV5mcDmEoVlmJtm1KDtXodan7/w52+YoNrlCUx+bcjU15usmu5UDDgPdpx/9RAI55Q4H0JhlyExBXY3URBmGeVI/0qRqY4+Wheg9bvwKMVHtK+H0Gd8+R8x5uWhbVq+b/c1bD6gyttcfhAqH2WwdbscYM7FhWragh1RHanc593QT4hZeftZfM8vuigpB8Fj2qzi/IxNP/Zz4XNfXEC8sMpu/6rtbMD/hRiVk+AuzREg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94dE/Vdt2QNAbG4KO6BqSxenWzr86t/S2QxJ/IFq3vs=;
 b=jFBdv2GWmXNeTROOmAU4+HWXXwIfmOdZL8z8wgDMeT9WLehXO8rWoRr+PHzav7tj08fnkamM5maOUMRr7HpSW9CTPilZulEUR5x42Vk5l9qnbyvV7ye43xZaraXzftIa9MMEId46dM/4j0RobrdU0j1PedZSzJ4alLF6ysAQ86w=
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB8PR08MB5242.eurprd08.prod.outlook.com (2603:10a6:10:e8::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.30; Mon, 23 Nov
 2020 11:54:14 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef%2]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 11:54:14 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien.grall.oss@gmail.com>, Jan Beulich
	<jbeulich@suse.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/3] xen/ns16550: Make ns16550 driver usable on ARM
 with HAS_PCI enabled.
Thread-Topic: [PATCH v3 1/3] xen/ns16550: Make ns16550 driver usable on ARM
 with HAS_PCI enabled.
Thread-Index:
 AQHWvBOve/67EvsNk0ODGsWoVvEIcanODQaAgAEhKgCAAARQAIAACQ0AgAAGfYCAAF5RAIAAgX4AgAADeICAAAbGgIAFenqA
Date: Mon, 23 Nov 2020 11:54:13 +0000
Message-ID: <37511625-C475-497B-BA83-B762687148BF@arm.com>
References: <cover.1605527997.git.rahul.singh@arm.com>
 <955996aa8cd7f17f9f39c60bd3b9b74ffaa5c5f7.1605527997.git.rahul.singh@arm.com>
 <3740e147-719a-4e97-bb0e-fe9bd2ec2aa5@xen.org>
 <aa256a44-8f8f-d4f1-f5f4-12529f45d8c8@suse.com>
 <9007e08f-6d90-88ed-ba64-2f0b3c21cb50@xen.org>
 <8531a99d-3c54-36c7-0cd4-2e4838f96eb0@suse.com>
 <ba26fdfb-34f8-c4d3-e082-f1f49c768981@xen.org>
 <89F35B3F-FAAD-4C58-B3FD-F93CA3290A49@arm.com>
 <alpine.DEB.2.21.2011191534060.7979@sstabellini-ThinkPad-T480s>
 <CAJ=z9a0aS1G0F1jAtKNEe4r3tyBoxy1xJ9AV7pYgifsL62iqww@mail.gmail.com>
 <alpine.DEB.2.21.2011191551510.7979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2011191551510.7979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f39e4ec0-4e41-44a3-a5f0-08d88fa684a1
x-ms-traffictypediagnostic: DB8PR08MB5242:|AM6PR08MB4215:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB42153BFBFF453E119D567E58FCFC0@AM6PR08MB4215.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mgZU0KBV7KMJrhgjTqlRdJE3xya0Wh7WSuIh1jwR9c5j1lUrQKINarJU2iF6jGvdzQYkyMPLRfIj1n7i4Xcu+LpaMH8p/2gPi3lWkXU8oE39Kh+dbwFdW9PuNFZ7gys14il4JjitIN/c5nsrknRxTSSvRJ9opna43XfEEE/VrQfbqbq+LQYMxXcdYbWpAIbLJOH7thwWzCtqReIVvrLSQmK2R/VGVo0S6voV182g833zNpaR4CZcgmFntFaCcsWF7fndN+A5ExmPoVnNILRc3jgKT4031bfhZLgYCVC1ykod6nvDd0crnR5gWOEAbmgrMLVb38fCf5n610IFpXYmdQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(366004)(376002)(39860400002)(8936002)(53546011)(64756008)(66476007)(91956017)(6512007)(66446008)(66556008)(6506007)(66946007)(26005)(8676002)(71200400001)(186003)(478600001)(5660300002)(83380400001)(76116006)(6486002)(2906002)(86362001)(2616005)(54906003)(316002)(36756003)(6916009)(33656002)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 EJKfnqc4Wfe8ct9ZOm9bL8mFmC9ngjGxZLrUIKP2jiIFbf2gnAbvCCBNxGLj5OR+zDzTPXNtz+h0qcKapCFVjenuMDXYeuWSW7/DxAufoJtN9wYnce5u4U5Ggwnm8gAEFGw3m6cFYyAjcIQvNl0G0TyzC2dN+YCuyMhRkUIXyHU+T0Zd5uBaKZdEgnZAIlM1ihGN8bm/Ubo8lX+pt34d9+z5Jij0IEbHO7MvLAcv2ccw5npwedGHjGFI3ovLjIkT6NPnUPwRTMNX17IOR4mPcvzUy6MAiWIakZ7Ggi07KIrkSeD4YzS7mj+T6TG33GVrAvWyKnDPJ+dYouFd80tJ5+U+rV0uq2s0gIxY6eAvRzkeOR8bGbb7H8srfA+YoL7a/M7laet5r0qIsj5hDbbqA1ZWDaxPKBRhUvnHIMSuFM5CT8Y6gdIYqvxjcVPZJl0mC1HKZK9aK8ImD4vKIrSkhiXTyoJIIhTKT99wWsHn8ZPVGWVv0DpTRAVWzaDPXnsK/deIUjZF5tC9n3qhF1Djc/ZqSuSf8tjeE/Zc1LOG12HsTQbkk4VhAGHETOgXVASsQQfXuz6YParGMctqHTVgzr+cHMepsZSU5W8eL0oJkaebnwoneHhPmRj/czk6hRsUZAtKC2GiUE2c3SxKTi9BoX60OigrFqVFxoqKZH9dcR4+G0qhyw78CwkyNTfOYOora6blVDPjkWFKf7Cw8HILQ1o5fnm6N0ZQyZnBXMFGepMNuqXa3ioANgIgfUjPVJlDaM6QQGEvPjgXVAekawwtqeToYs7KIq7pcIECfv6yVKtSFHjbdajCCjtd0FqLKKI4NglPWJSvHqwbHjPm7WuLLBrnyUVyp8ciQgJcPfemGw7dtW+wwzgKEAbzqed8N2r/VemJ0OeFmf+3pmYTcaI51g==
Content-Type: text/plain; charset="utf-8"
Content-ID: <4BEAF2DB5E47A84BAC890A603CB67BB4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5242
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9c2cb5f6-48a1-46b1-5696-08d88fa67f92
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kgUXq3hIITwiuQZaP8MrTYh44AgBRsTFNNmUTyWCmfAeJkQ3ifsxuyaur0vB1gNMjc7bof7O9kT11cy1/emTUmXb787H89q1bh4AlQVrkyw6WNB2b1dyu8+X7WmK7Lpc3Xjsq07wuXL3fXM1UiZfmbJfY7Wk2ggU2hDZLErsnBm1fcZ0RFikVzsLu6rAkMY5niNEUJnCna3jBLLFmRUrpY0YlaUF6gMoX5dQmxoSoOfg/MjEJkuY/FHesf9YHpZFyFurHZfbuzIwc8zsKKWKFdm7/8ocxJGanGFv5LHHH+DkHoYsN28ruEfE1aeRt3Wm4awQ+T/533xM24hIvXWFIJIM3xXwqHMwhtUiHFw50qRgSRPCh/jA3jWzMVVPSPWpuvPU2/X1ezHj9cscXg6rNg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(376002)(39860400002)(46966005)(70586007)(33656002)(186003)(70206006)(82310400003)(81166007)(6862004)(336012)(4326008)(47076004)(82740400003)(6486002)(54906003)(83380400001)(36906005)(316002)(6512007)(26005)(5660300002)(86362001)(478600001)(2906002)(53546011)(356005)(8936002)(2616005)(6506007)(36756003)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 11:54:22.4445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f39e4ec0-4e41-44a3-a5f0-08d88fa684a1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4215

SGVsbG8gSmFuLA0KDQo+IE9uIDIwIE5vdiAyMDIwLCBhdCAxMjoxNCBhbSwgU3RlZmFubyBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToNCj4gDQo+IE9uIFRodSwgMTkg
Tm92IDIwMjAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+IE9uIFRodSwgMTkgTm92IDIwMjAsIDIz
OjM4IFN0ZWZhbm8gU3RhYmVsbGluaSwgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0K
Pj4gICAgICBPbiBUaHUsIDE5IE5vdiAyMDIwLCBSYWh1bCBTaW5naCB3cm90ZToNCj4+Pj4gT24g
MTkvMTEvMjAyMCAwOTo1MywgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAxOS4xMS4yMDIw
IDEwOjIxLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4+Pj4gSGkgSmFuLA0KPj4+Pj4+IA0KPj4+
Pj4+IE9uIDE5LzExLzIwMjAgMDk6MDUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4+PiBPbiAx
OC4xMS4yMDIwIDE2OjUwLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4+Pj4+PiBPbiAxNi8xMS8y
MDIwIDEyOjI1LCBSYWh1bCBTaW5naCB3cm90ZToNCj4+Pj4+Pj4+PiBOUzE2NTUwIGRyaXZlciBo
YXMgUENJIHN1cHBvcnQgdGhhdCBpcyB1bmRlciBIQVNfUENJIGZsYWcuIFdoZW4gSEFTX1BDSQ0K
Pj4+Pj4+Pj4+IGlzIGVuYWJsZWQgZm9yIEFSTSwgY29tcGlsYXRpb24gZXJyb3IgaXMgb2JzZXJ2
ZWQgZm9yIEFSTSBhcmNoaXRlY3R1cmUNCj4+Pj4+Pj4+PiBiZWNhdXNlIEFSTSBwbGF0Zm9ybXMg
ZG8gbm90IGhhdmUgZnVsbCBQQ0kgc3VwcG9ydCBhdmFpbGFibGUuDQo+Pj4+Pj4+PiAgICA+DQo+
Pj4+Pj4+Pj4gSW50cm9kdWNpbmcgbmV3IGtjb25maWcgb3B0aW9uIENPTkZJR19IQVNfTlMxNjU1
MF9QQ0kgdG8gc3VwcG9ydA0KPj4+Pj4+Pj4+IG5zMTY1NTAgUENJIGZvciBYODYuDQo+Pj4+Pj4+
Pj4gDQo+Pj4+Pj4+Pj4gRm9yIFg4NiBwbGF0Zm9ybXMgaXQgaXMgZW5hYmxlZCBieSBkZWZhdWx0
LiBGb3IgQVJNIHBsYXRmb3JtcyBpdCBpcw0KPj4+Pj4+Pj4+IGRpc2FibGVkIGJ5IGRlZmF1bHQs
IG9uY2Ugd2UgaGF2ZSBwcm9wZXIgc3VwcG9ydCBmb3IgTlMxNjU1MCBQQ0kgZm9yDQo+Pj4+Pj4+
Pj4gQVJNIHdlIGNhbiBlbmFibGUgaXQuDQo+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4gTm8gZnVuY3Rp
b25hbCBjaGFuZ2UuDQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+IE5JVDogSSB3b3VsZCBzYXkgIk5vIGZ1
bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkIiB0byBtYWtlIGNsZWFyIHRoaXMgaXMNCj4+Pj4+Pj4+
IGFuIGV4cGVjdGF0aW9uIGFuZCBob3BlZnVsbHkgd2lsbCBiZSBjb3JyZWN0IDopLg0KPj4+Pj4+
Pj4gDQo+Pj4+Pj4+PiBSZWdhcmRpbmcgdGhlIGNvbW1pdCBtZXNzYWdlIGl0c2VsZiwgSSB3b3Vs
ZCBzdWdnZXN0IHRoZSBmb2xsb3dpbmcgdG8NCj4+Pj4+Pj4+IGFkZHJlc3MgSmFuJ3MgY29uY2Vy
bjoNCj4+Pj4+Pj4gDQo+Pj4+Pj4+IFdoaWxlIGluZGVlZCB0aGlzIGlzIGEgbXVjaCBiZXR0ZXIg
ZGVzY3JpcHRpb24sIEkgY29udGludWUgdG8gdGhpbmsNCj4+Pj4+Pj4gdGhhdCB0aGUgcHJvcG9z
ZWQgS2NvbmZpZyBvcHRpb24gaXMgdW5kZXNpcmFibGUgdG8gaGF2ZS4NCj4+Pj4+PiANCj4+Pj4+
PiBJIGFtIHlldCB0byBzZWUgYW4gYXJndW1lbnQgaW50byB3aHkgd2Ugc2hvdWxkIGtlZXAgdGhl
IFBDSSBjb2RlDQo+Pj4+Pj4gY29tcGlsZWQgb24gQXJtIHdoZW4gdGhlcmUgd2lsbCBiZSBuby11
c2UuLi4uDQo+Pj4+PiBXZWxsLCBzZWUgbXkgcGF0Y2ggc3VwcHJlc3NpbmcgYnVpbGRpbmcgb2Yg
cXVpdGUgYSBwYXJ0IG9mIGl0Lg0KPj4+PiANCj4+Pj4gSSB3aWxsIGxldCBSYWh1bCBmaWd1cmlu
ZyBvdXQgd2hldGhlciB5b3VyIHBhdGNoIHNlcmllcyBpcyBzdWZmaWNpZW50IHRvIGZpeCBjb21w
aWxhdGlvbiBpc3N1ZXMgKHRoaXMgaXMgd2hhdCBtYXR0ZXJzIHJpZ2h0DQo+PiAgICAgIG5vdyku
DQo+Pj4gDQo+Pj4gSSBqdXN0IGNoZWNrZWQgdGhlIGNvbXBpbGF0aW9uIGVycm9yIGZvciBBUk0g
YWZ0ZXIgZW5hYmxpbmcgdGhlIEhBU19QQ0kgb24gQVJNLiBJIGFtIG9ic2VydmluZyB0aGUgc2Ft
ZSBjb21waWxhdGlvbiBlcnJvcg0KPj4gICAgICB3aGF0IEkgb2JzZXJ2ZWQgcHJldmlvdXNseS4N
Cj4+PiBUaGVyZSBhcmUgdHdvIG5ldyBlcnJvcnMgcmVsYXRlZCB0byBzdHJ1Y3QgdWFydF9jb25m
aWcgYW5kIHN0cnVjdCBwYXJ0X3BhcmFtIGFzIHRob3NlIHN0cnVjdCBkZWZpbmVkIGdsb2JhbGx5
IGJ1dCB1c2VkIHVuZGVyDQo+PiAgICAgIFg4NiBmbGFncy4NCj4+PiANCj4+PiBBdCB0b3AgbGV2
ZWw6DQo+Pj4gbnMxNjU1MC5jOjE3OTo0ODogZXJyb3I6IOKAmHVhcnRfY29uZmln4oCZIGRlZmlu
ZWQgYnV0IG5vdCB1c2VkIFstV2Vycm9yPXVudXNlZC1jb25zdC12YXJpYWJsZT1dDQo+Pj4gICBz
dGF0aWMgY29uc3Qgc3RydWN0IG5zMTY1NTBfY29uZmlnIF9faW5pdGNvbnN0IHVhcnRfY29uZmln
W10gPQ0KPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBefn5+fn5+fn5+fg0KPj4+IG5zMTY1NTAuYzoxMDQ6NTQ6IGVycm9yOiDigJh1YXJ0X3BhcmFt
4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV2Vycm9yPXVudXNlZC1jb25zdC12YXJpYWJsZT1d
DQo+Pj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IG5zMTY1NTBfY29uZmlnX3BhcmFtIF9faW5pdGNv
bnN0IHVhcnRfcGFyYW1bXSA9IHsNCj4+PiANCj4+PiANCj4+Pj4gDQo+Pj4+Pj4+IEVpdGhlciwN
Cj4+Pj4+Pj4gZm9sbG93aW5nIHRoZSBwYXRjaCBJJ3ZlIGp1c3Qgc2VudCwgdHJ1bHkgeDg2LXNw
ZWNpZmljIHRoaW5ncyAoYXQNCj4+Pj4+Pj4gbGVhc3QgYXMgZmFyIGFzIGN1cnJlbnQgc3RhdGUg
Z29lcyAtIGlmIGFueSBvZiB0aGlzIHdhcyB0byBiZQ0KPj4+Pj4+PiByZS11c2VkIGJ5IGEgZnV0
dXJlIHBvcnQsIHN1aXRhYmxlIGZ1cnRoZXIgYWJzdHJhY3Rpb24gbWF5IGJlDQo+Pj4+Pj4+IG5l
ZWRlZCkgc2hvdWxkIGJlIGd1YXJkZWQgYnkgQ09ORklHX1g4NiAob3IgYWJzdHJhY3RlZCBpbnRv
IGFyY2gNCj4+Pj4+Pj4gaG9va3MpLCBvciB0aGUgSEFTX1BDSV9NU0kgcHJvcG9zYWwgd291bGQg
YXQgbGVhc3Qgd2FudCBmdXJ0aGVyDQo+Pj4+Pj4+IGludmVzdGlnYXRpbmcgYXMgdG8gaXRzIGZl
YXNpYmlsaXR5IHRvIGFkZHJlc3MgdGhlIGlzc3VlcyBhdCBoYW5kLg0KPj4+Pj4+IA0KPj4+Pj4+
IEkgd291bGQgYmUgaGFwcHkgd2l0aCBDT05GSUdfWDg2LCBkZXNwaXRlIHRoZSBmYWN0IHRoYXQg
dGhpcyBpcyBvbmx5DQo+Pj4+Pj4gZGVmZXJyaW5nIHRoZSBwcm9ibGVtLg0KPj4+Pj4+IA0KPj4+
Pj4+IFJlZ2FyZGluZyBIQVNfUENJX01TSSwgSSBkb24ndCByZWFsbHkgc2VlIHRoZSBwb2ludCBv
ZiBpbnRyb2R1Y2luZyBnaXZlbg0KPj4+Pj4+IHRoYXQgd2UgYXJlIG5vdCBnb2luZyB0byB1c2Ug
TlMxNjU1MCBQQ0kgb24gQXJtIGluIHRoZSBmb3JzZWVhYmxlDQo+Pj4+Pj4gZnV0dXJlLg0KPj4+
Pj4gQW5kIEkgY29udGludWUgdG8gZmFpbCB0byBzZWUgd2hhdCB3b3VsZCBndWFyYW50ZWUgdGhp
czogQXMgc29vbg0KPj4+Pj4gYXMgeW91IGNhbiBwbHVnIGluIHN1Y2ggYSBjYXJkIGludG8gYW4g
QXJtIHN5c3RlbSwgcGVvcGxlIHdpbGwNCj4+Pj4+IHdhbnQgdG8gYmUgYWJsZSB1c2UgaXQuIFRo
YXQncyB3aHkgd2UgaGFkIHRvIGFkZCBzdXBwb3J0IGZvciBpdA0KPj4+Pj4gb24geDg2LCBhZnRl
ciBhbGwuDQo+Pj4+IA0KPj4+PiBXZWxsLCBwbHVnLWluIFBDSSBjYXJkcyBvbiBBcm0gaGFzIGJl
ZW4gYXZhaWxhYmxlIGZvciBxdWl0ZSBhIHdoaWxlLi4uIFlldCBJIGhhdmVuJ3QgaGVhcmQgYW55
b25lIGFza2luZyBmb3IgTlMxNjU1MCBQQ0kNCj4+ICAgICAgc3VwcG9ydC4NCj4+Pj4gDQo+Pj4+
IFRoaXMgaXMgcHJvYmFibHkgYmVjYXVzZSBTQlNBIGNvbXBsaWFudCBzZXJ2ZXIgc2hvdWxkIGFs
d2F5cyBwcm92aWRlIGFuIFNCU0EgVUFSVCAoYSBjdXQtZG93biB2ZXJzaW9uIG9mIHRoZSBQTDAx
MSkuIFNvIHdoeQ0KPj4gICAgICB3b3VsZCBib3RoZXIgdG8gbG9zZSBhIFBDSSBzbG90IGZvciB5
ZXQgYW5vdGhlciBVQVJUPw0KPj4+PiANCj4+Pj4+Pj4gU28gd2h5IGRvIHdlIG5lZWQgYSBmaW5l
ciBncmFpbmUgS2NvbmZpZz8NCj4+Pj4+IEJlY2F1c2UgbW9zdCBvZiB0aGUgaW52b2x2ZWQgY29k
ZSBpcyBpbmRlZWQgTVNJLXJlbGF0ZWQ/DQo+Pj4+IA0KPj4+PiBQb3NzaWJseSwgeWV0IGl0IHdv
dWxkIG5vdCBiZSBuZWNlc3NhcnkgaWYgd2UgZG9uJ3Qgd2FudCBOUzE2NTUwIFBDSSBzdXBwb3J0
Li4uDQo+Pj4gDQo+Pj4gVG8gZml4IGNvbXBpbGF0aW9uIGVycm9yIG9uIEFSTSBhcyBwZXIgdGhl
IGRpc2N1c3Npb24gdGhlcmUgYXJlIGJlbG93IG9wdGlvbnMgcGxlYXNlIHN1Z2dlc3Qgd2hpY2gg
b25lIHRvIHVzZSB0byBwcm9jZWVkDQo+PiAgICAgIGZ1cnRoZXIuDQo+Pj4gDQo+Pj4gMS4gVXNl
IHRoZSBuZXdseSBpbnRyb2R1Y2VkIENPTkZJR19IQVNfTlMxNjU1MF9QQ0kgY29uZmlnIG9wdGlv
bnMuIFRoaXMgaGVscHMgYWxzbyBub24teDg2IGFyY2hpdGVjdHVyZSBpbiB0aGUgZnV0dXJlIG5v
dCB0bw0KPj4gICAgICBoYXZlIGNvbXBpbGF0aW9uIGVycm9yDQo+Pj4gd2hhdCB3ZSBhcmUgb2Jz
ZXJ2aW5nIG5vdyB3aGVuIEhBU19QQ0kgaXMgZW5hYmxlZC4NCj4+PiANCj4+PiAyLiBHdWFyZCB0
aGUgcmVtYWluaW5nIHg4NiBzcGVjaWZpYyBjb2RlIHdpdGggQ09ORklHX1g4NiBhbmQgaW50cm9k
dWNlIHRoZSBuZXcgQ09ORklHX0hBU19QQ0lfTVNJIG9wdGlvbnMgdG8gZml4IHRoZSBNU0kNCj4+
ICAgICAgcmVsYXRlZCBjb21waWxhdGlvbiBlcnJvci4NCj4+PiBPbmNlIHdlIGhhdmUgcHJvcGVy
IHN1cHBvcnQgZm9yIE1TSSBhbmQgUENJIGZvciBBUk0gIChIQVNfUENJX01TSSBhbmQgSEFTX1BD
SSBlbmFibGVkIGZvciBBUk0gaW4gS2NvbmZpZyApIEkgYW0gbm90IHN1cmUgaWYNCj4+ICAgICAg
TlMxNjU1MCBQQ0kgd2lsbCB3b3JrIG91dCBvZiB0aGUgYm94IG9uIEFSTSAuSW4gdGhhdCBjYXNl
LCB3ZSBtaWdodCBuZWVkIHRvIGNvbWUgYmFjayBhZ2FpbiB0byBmaXggTlMxNjU1MCBkcml2ZXIu
IA0KPj4gDQo+PiANCj4+ICAgICAgSXQgZG9lc24ndCBtYXR0ZXIgdG9vIG11Y2ggdG8gbWUsIGxl
dCdzIGp1c3QgY2hvb3NlIG9uZSBvcHRpb24gc28gdGhhdCB5b3UNCj4+ICAgICAgZ2V0IHVuYmxv
Y2tlZCBzb29uLg0KPj4gDQo+PiAgICAgIEl0IGxvb2tzIGxpa2UgSmFuIHByZWZlcnMgb3B0aW9u
IDIpIGFuZCBib3RoIEp1bGllbiBhbmQgSSBhcmUgT0sgd2l0aA0KPj4gICAgICBpdC4gU28gbGV0
J3MgZG8gMikuIEphbiwgcGxlYXNlIGNvbmZpcm0gdG9vIDotKQ0KPj4gDQo+PiANCj4+IFBsZWFz
ZSBkb24ndCBwdXQgd29yZHMgaW4gbXkgbW91dGguLi4gDQo+IA0KPiBTb3JyeSBKdWxpZW4sIEkg
bWlzaW50ZXJwcmV0ZWQgb25lIG9mIHlvdXIgcHJldmlvdXMgY29tbWVudHMuIFNvbWV0aW1lcw0K
PiBpdCBpcyBkaWZmaWN1bHQgdG8gZG8gdGhpbmdzIGJ5IGVtYWlsLiBJdCBpcyBnb29kIHRoYXQg
eW91IGNsYXJpZmllZCBhcw0KPiBteSBnb2FsIHdhcyB0byByZWFjaCBhbiBhZ3JlZW1lbnQuDQo+
IA0KPiANCj4+IEkgdGhpbmsgaW50cm9kdWNpbmcgSEFTX1BDSV9NU0kgaXMgc2hvcnQgc2lnaHRl
ZC4NCj4+IA0KPj4gVGhlcmUgYXJlIG5vIGNsZWFyIGJlbmVmaXRzIG9mIGl0IHdoZW4gTlMxNjU1
MCBQQ0kgc3VwcG9ydCBpcyBub3QgZ29pbmcgdG8gYmUgZW5hYmxlIGluIHRoZSBmb3Jlc2VlYWJs
ZSBmdXR1cmUuDQo+IA0KPiBJIGFncmVlDQo+IA0KPiANCj4+IEkgd291bGQgYmUgb2sgd2l0aCBt
b3ZpbmcgZXZlcnl0aGluZyB1bmRlciBDT05GSUdfWDg2LiBJSE1PIHRoaXMgaXMgc3RpbGwgc2hv
cnRzaWdodGVkIGJ1dCBhdCBsZWFzdCB3ZSBkb24ndCBpbnRyb2R1Y2UgYSBjb25maWcgdGhhdCdz
IG5vdA0KPj4gZ29pbmcgdG8gaGVscCBBcm0gb3Igb3RoZXIgYW55IGFyY2hpdGVjdHVyZSB0byBk
aXNhYmxlIGNvbXBsZXRlbHkgUENJIHN1cHBvcnQgaW4gTlMxNjU1MC4NCj4gDQo+IFNvIHlvdSBh
cmUgc3VnZ2VzdGluZyBhIG5ldyBvcHRpb246DQo+IA0KPiAzLiBHdWFyZCB0aGUgcmVtYWluaW5n
IHg4NiBzcGVjaWZpYyBjb2RlICphbmQqIHRoZSBNU0kgcmVsYXRlZA0KPiBjb21waWxhdGlvbiBl
cnJvcnMgd2l0aCBDT05GSUdfWDg2DQo+IA0KPiBJcyB0aGF0IHJpZ2h0Pw0KPiANCj4gDQo+IE15
IHByZWZlcmVuY2UgaXMgYWN0dWFsbHkgb3B0aW9uIDEpIGJ1dCB0aGlzIHNlcmllcyBpcyBhbHJl
YWR5IGF0IHYzIGFuZA0KPiBJIGRvbid0IHRoaW5rIHRoaXMgZGVjaXNpb24gaXMgYXMgaW1wb3J0
YW50IGFzIG11Y2ggYXMgdW5ibG9ja2luZw0KPiBSYWh1bCwgc28gSSBhbSBPSyB3aXRoIHRoZSBv
dGhlciBhbHRlcm5hdGl2ZXMgdG9vLg0KPiANCj4gSSB0ZW5kIHRvIGFncmVlIHdpdGggeW91IHRo
YXQgMykgaXMgYmV0dGVyIHRoYW4gMikgZm9yIHRoZSByZWFzb25zIHlvdQ0KPiB3cm90ZSBhYm92
ZS4NCg0KDQpDYW4geW91IHBsZWFzZSBwcm92aWRlIHlvdXIgc3VnZ2VzdGlvbiBob3cgdG8gcHJv
Y2VlZCBvbiB0aGlzIHNvIHRoYXQgSSBjYW4gc2VuZCBteSBuZXh0IHBhdGNoLg0KSSBhbSB3YWl0
aW5nIGZvciB5b3VyIHJlcGx5IGlmIHlvdSBhcmUgYWxzbyBvayBmb3IgdGhlIG9wdGlvbnMgMy4N
Cg0KVGhhbmtzIGluIGFkdmFuY2UuDQoNClJlZ2FyZHMsDQpSYWh1bA==

