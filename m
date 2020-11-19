Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CF52B9706
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 16:55:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31009.61207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfmGg-00056r-Bd; Thu, 19 Nov 2020 15:54:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31009.61207; Thu, 19 Nov 2020 15:54:42 +0000
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
	id 1kfmGg-00056S-7k; Thu, 19 Nov 2020 15:54:42 +0000
Received: by outflank-mailman (input) for mailman id 31009;
 Thu, 19 Nov 2020 15:54:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ihJE=EZ=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kfmGe-00056N-LC
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 15:54:40 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.53]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fb6d8f88-2605-4f08-9b81-69b23e05d5dc;
 Thu, 19 Nov 2020 15:54:38 +0000 (UTC)
Received: from AM5PR0402CA0002.eurprd04.prod.outlook.com
 (2603:10a6:203:90::12) by VI1PR08MB3837.eurprd08.prod.outlook.com
 (2603:10a6:803:ba::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Thu, 19 Nov
 2020 15:54:35 +0000
Received: from AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::ff) by AM5PR0402CA0002.outlook.office365.com
 (2603:10a6:203:90::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Thu, 19 Nov 2020 15:54:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT032.mail.protection.outlook.com (10.152.16.84) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Thu, 19 Nov 2020 15:54:35 +0000
Received: ("Tessian outbound 797fb8e1da56:v71");
 Thu, 19 Nov 2020 15:54:34 +0000
Received: from 28cd6dbeeba3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D65C6FB2-09D3-4ABC-BC74-306EDB20DAF9.1; 
 Thu, 19 Nov 2020 15:54:28 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 28cd6dbeeba3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 19 Nov 2020 15:54:28 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DBAPR08MB5685.eurprd08.prod.outlook.com (2603:10a6:10:1ad::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 19 Nov
 2020 15:54:27 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28%6]) with mapi id 15.20.3564.028; Thu, 19 Nov 2020
 15:54:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ihJE=EZ=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kfmGe-00056N-LC
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 15:54:40 +0000
X-Inumbo-ID: fb6d8f88-2605-4f08-9b81-69b23e05d5dc
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown [40.107.14.53])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id fb6d8f88-2605-4f08-9b81-69b23e05d5dc;
	Thu, 19 Nov 2020 15:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rX0k+1xCoJslVDuaQwtuf9eHFT1B8y3RnVG0KwyuWng=;
 b=EhBK6XP6RdoKGr3cNVig3nJfjOvi4gFi5uO0saVyhiJp/HM5OGBdFIW3n5iAC9Sguf/D6YMx4XU5UxsZlNngkDx4aMS35AXm+hv+EQay7sDmLQLt9jgglJwf7fLxERnNNTJvZkzK2hx7nDs1pruWaOOfBi8Zq+dBlz4axIHZdB4=
Received: from AM5PR0402CA0002.eurprd04.prod.outlook.com
 (2603:10a6:203:90::12) by VI1PR08MB3837.eurprd08.prod.outlook.com
 (2603:10a6:803:ba::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Thu, 19 Nov
 2020 15:54:35 +0000
Received: from AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::ff) by AM5PR0402CA0002.outlook.office365.com
 (2603:10a6:203:90::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Thu, 19 Nov 2020 15:54:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT032.mail.protection.outlook.com (10.152.16.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Thu, 19 Nov 2020 15:54:35 +0000
Received: ("Tessian outbound 797fb8e1da56:v71"); Thu, 19 Nov 2020 15:54:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d9a489cd1dc698e8
X-CR-MTA-TID: 64aa7808
Received: from 28cd6dbeeba3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D65C6FB2-09D3-4ABC-BC74-306EDB20DAF9.1;
	Thu, 19 Nov 2020 15:54:28 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 28cd6dbeeba3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 19 Nov 2020 15:54:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BHNC80N3Q46BpNCt/5qQP9c91KzvGSOqShGlu42hksXwzvObHdFbSZfbGlNwa7SW6wOivQLZV8MmLwRW/bY79uzhUtpirtRdGVPok1VXfBj3iaktWRxlKLJXMj7DS4WehcHefFuCa67feaobMkVPA7K+bzzzRCdn2huGlBy/I+p2+WSuxwem+y61sQvq9y9aJg8ZI7/7xnpAbv4hot1n+K679XlTII3rK07N+xtHLHtmznhiW1b2qADsPXOushVGITg+1fuASAMk+kcAfOlf+VeT00ShrLdY6MVKZlNx6PouKzxVud1wLnYy+x3yONjlLMwG3g50PrVupuhPy8VTsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rX0k+1xCoJslVDuaQwtuf9eHFT1B8y3RnVG0KwyuWng=;
 b=CUcv/nzT8MBHsvxFyLVAD1THrfNAViyHhan+ecs2e7H1/4HxvzKKTRdLBdU/J5H941Y9/4Wx34LbhVymQ6laDeM2f5CGB+IWzTHnbcepqyOMGesWO6nEJ6UTLoxGEEIr5asB/S14W3kjw6vXY1YavLlMTvIojojQNm/aKCmOop/izemSE+tQgZqmqRqIioP3Dxjdree8BhbjdJWYhF8WwQaE2ojQOI76zE6zp1eHuXPJ+VUy/VqZVz1w+dPcaBMz79++URrDsz7egD1MG6txfUWsqgKeQC+uGtlT3PUlu92mBnV8or9KBpHVt7oHc+KE2clCutPnSNhJhuUZN58CKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rX0k+1xCoJslVDuaQwtuf9eHFT1B8y3RnVG0KwyuWng=;
 b=EhBK6XP6RdoKGr3cNVig3nJfjOvi4gFi5uO0saVyhiJp/HM5OGBdFIW3n5iAC9Sguf/D6YMx4XU5UxsZlNngkDx4aMS35AXm+hv+EQay7sDmLQLt9jgglJwf7fLxERnNNTJvZkzK2hx7nDs1pruWaOOfBi8Zq+dBlz4axIHZdB4=
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DBAPR08MB5685.eurprd08.prod.outlook.com (2603:10a6:10:1ad::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 19 Nov
 2020 15:54:27 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28%6]) with mapi id 15.20.3564.028; Thu, 19 Nov 2020
 15:54:27 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/3] xen/ns16550: Make ns16550 driver usable on ARM
 with HAS_PCI enabled.
Thread-Topic: [PATCH v3 1/3] xen/ns16550: Make ns16550 driver usable on ARM
 with HAS_PCI enabled.
Thread-Index:
 AQHWvBOve/67EvsNk0ODGsWoVvEIcanODQaAgAEhKgCAAARQAIAACQ0AgAAGfYCAAF5RAA==
Date: Thu, 19 Nov 2020 15:54:27 +0000
Message-ID: <89F35B3F-FAAD-4C58-B3FD-F93CA3290A49@arm.com>
References: <cover.1605527997.git.rahul.singh@arm.com>
 <955996aa8cd7f17f9f39c60bd3b9b74ffaa5c5f7.1605527997.git.rahul.singh@arm.com>
 <3740e147-719a-4e97-bb0e-fe9bd2ec2aa5@xen.org>
 <aa256a44-8f8f-d4f1-f5f4-12529f45d8c8@suse.com>
 <9007e08f-6d90-88ed-ba64-2f0b3c21cb50@xen.org>
 <8531a99d-3c54-36c7-0cd4-2e4838f96eb0@suse.com>
 <ba26fdfb-34f8-c4d3-e082-f1f49c768981@xen.org>
In-Reply-To: <ba26fdfb-34f8-c4d3-e082-f1f49c768981@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 71e0f658-804e-43ca-449c-08d88ca369a1
x-ms-traffictypediagnostic: DBAPR08MB5685:|VI1PR08MB3837:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB3837818A03A543E0655F22CFFCE00@VI1PR08MB3837.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 qVFYSd7+maUCTIyGo2XNwuZgtytKWLomG3+LIScaaOLJF52+abCPUiTHKds6SX+fbdarsu3Vq3JMSKFWCudVC6ndelUcx3jxenGGTeEjSDgDxdezqIVzSlQd1ZD4LuhZFfjfG79y0if56f1wGy7BCWigC1G4eUz9+HMqbHrf2Dj+QSTero0Jg0MRiPF8lxvImcauSDLBP0Uac5b2adClLy5KQ4LmxGYv5bnDZ4lAOeZNNaWAmQIbpaaCdiYstXgS+Pyv5jxMkOx5k4nAMuiDGvZeyOfm/Qa44mnOuQN4CxdXaw6adJzO6eQW2Ap18cMd6pgOZo4JNfy0A9dJ4WjvzA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(346002)(39860400002)(376002)(316002)(6506007)(54906003)(2616005)(2906002)(83380400001)(26005)(53546011)(186003)(86362001)(36756003)(71200400001)(5660300002)(6512007)(76116006)(91956017)(33656002)(66446008)(64756008)(66556008)(66476007)(478600001)(66946007)(8676002)(8936002)(6486002)(4326008)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 p8gLi6If9ectoO07s0/OUqv1L8hsEwpgRf08q1Ul6daBlPzful1SYsEt83fanKCk3aKOhKIEjDQk4ijxsXxHdAvt5JMHs6enDTndgGDT+0mgZXAjJPK3ySSYIrlZTRAQONifISYuy3Pxd60qDrTEmNIgK8QewALN8ZubtpW+QqZrCD4ovDJyxQCVm5+x00C/kNAHScg8IRM/aSsTlI0cZ/sJl6uDPI4cQ2o+p5pIM2I7I1+sxRrIW1+jye7LYnWsJinvuWtzE/R9gXGAE4BUQGiqNg7kmpMtmsRBGIuQL9ndLtD81qyVWvHj2QEJD1/TbW2VVh90VftQbnSVFiI9K0Q93Vla3DO4gLVVX36RU8PjcRlcm2RP42tpZC10beVsSDEdTReBI5gtpViyYYCLRSNp9LUOH0PeDguszVaahhTj8x5WcXM8B7hPJOIQ3aqhCklJGqbwa96qpWc9+F4Li64izx7xetAN7HRf1uhAY/rYXMxkQEoRESS+mDiI7Oko3kpi6skXGAofK2LBU4itQ+4oNLVhClmJmTppa0Ne/BU3erTL3nYolX9jbci2jXUhOGFpF5DlugBqvHGws2whP0gbkblY0jGk77xpmGFZwcOCENH0w4Wpli86Nxgl+ePm4bV8hXAIycPaE9wlZkB4+soynpaSL4itHBGQ2d6EOIJfI2/gdLpYHAKE9QUzFRo2RsA7QkomNvMe76jINACJfiPLZNBtSfDVcAjh9ph0LnJwCWm7s/N7gk/B3LkpgGs1xFzLvXDKqKvz47jYg225dT94aXeesRQRWufEVKalFG4DpNtlvQuSFVtdy4I50NeRFKYsJQKnrsMRkjGV6eC618x/+gqTcmEnpLFfnsAtfizJFfJ8yQiKQxjA1TBEL9OfcnXGg9pjAeOMqKgeGD5kCA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <04ED262D099E124ABC2ED99A4E12CFCC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5685
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	69256941-f3a6-4408-9171-08d88ca364e8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VvifpvYyCpEpV+upi6sAt4oLGYxjXLrtWl5v2IWBZarklcEi87PjPSQf8PxCOmtL9M1mbxrbJB0hfk+y7wguhHJR2f1yyIsSkDkXANQAoGXdflb+EUNVk7U99xVsY89s/RRnzgaCUnGUsZb+7WxDUtuaOj82+1qe1svsZjbk1K1wcTnIcdNMwXVSoxfuzfUUP7gG93OL+GJVn3WBCvUO0RkSe5CU/FNU0M1xU4kVFyl+CQI2wzFqNRV7EcqxawUIo6R5oRwhfBM9kQK21bc3JKqUsTbJEVcvG773PdM5ZrJdEL5VhPiWKaKeol2N8YvF8/dkwPm2Cb1KNh6JzHTcFXeeb2bbf1bYImeoCccLSULHmLefHlaikCOrpnukI69ub2m9pSsGe0fJjEm+sWUhog==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(39860400002)(396003)(346002)(46966005)(82310400003)(8676002)(336012)(26005)(82740400003)(53546011)(186003)(47076004)(8936002)(316002)(36906005)(6506007)(33656002)(2616005)(54906003)(83380400001)(36756003)(5660300002)(478600001)(81166007)(70586007)(4326008)(356005)(6862004)(70206006)(6486002)(6512007)(2906002)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 15:54:35.2009
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71e0f658-804e-43ca-449c-08d88ca369a1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3837

SGVsbG8sDQoNCj4gT24gMTkgTm92IDIwMjAsIGF0IDEwOjE2IGFtLCBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IA0KPiANCj4gT24gMTkvMTEvMjAyMCAwOTo1Mywg
SmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAxOS4xMS4yMDIwIDEwOjIxLCBKdWxpZW4gR3JhbGwg
d3JvdGU6DQo+Pj4gSGkgSmFuLA0KPj4+IA0KPj4+IE9uIDE5LzExLzIwMjAgMDk6MDUsIEphbiBC
ZXVsaWNoIHdyb3RlOg0KPj4+PiBPbiAxOC4xMS4yMDIwIDE2OjUwLCBKdWxpZW4gR3JhbGwgd3Jv
dGU6DQo+Pj4+PiBPbiAxNi8xMS8yMDIwIDEyOjI1LCBSYWh1bCBTaW5naCB3cm90ZToNCj4+Pj4+
PiBOUzE2NTUwIGRyaXZlciBoYXMgUENJIHN1cHBvcnQgdGhhdCBpcyB1bmRlciBIQVNfUENJIGZs
YWcuIFdoZW4gSEFTX1BDSQ0KPj4+Pj4+IGlzIGVuYWJsZWQgZm9yIEFSTSwgY29tcGlsYXRpb24g
ZXJyb3IgaXMgb2JzZXJ2ZWQgZm9yIEFSTSBhcmNoaXRlY3R1cmUNCj4+Pj4+PiBiZWNhdXNlIEFS
TSBwbGF0Zm9ybXMgZG8gbm90IGhhdmUgZnVsbCBQQ0kgc3VwcG9ydCBhdmFpbGFibGUuDQo+Pj4+
PiAgID4NCj4+Pj4+PiBJbnRyb2R1Y2luZyBuZXcga2NvbmZpZyBvcHRpb24gQ09ORklHX0hBU19O
UzE2NTUwX1BDSSB0byBzdXBwb3J0DQo+Pj4+Pj4gbnMxNjU1MCBQQ0kgZm9yIFg4Ni4NCj4+Pj4+
PiANCj4+Pj4+PiBGb3IgWDg2IHBsYXRmb3JtcyBpdCBpcyBlbmFibGVkIGJ5IGRlZmF1bHQuIEZv
ciBBUk0gcGxhdGZvcm1zIGl0IGlzDQo+Pj4+Pj4gZGlzYWJsZWQgYnkgZGVmYXVsdCwgb25jZSB3
ZSBoYXZlIHByb3BlciBzdXBwb3J0IGZvciBOUzE2NTUwIFBDSSBmb3INCj4+Pj4+PiBBUk0gd2Ug
Y2FuIGVuYWJsZSBpdC4NCj4+Pj4+PiANCj4+Pj4+PiBObyBmdW5jdGlvbmFsIGNoYW5nZS4NCj4+
Pj4+IA0KPj4+Pj4gTklUOiBJIHdvdWxkIHNheSAiTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5k
ZWQiIHRvIG1ha2UgY2xlYXIgdGhpcyBpcw0KPj4+Pj4gYW4gZXhwZWN0YXRpb24gYW5kIGhvcGVm
dWxseSB3aWxsIGJlIGNvcnJlY3QgOikuDQo+Pj4+PiANCj4+Pj4+IFJlZ2FyZGluZyB0aGUgY29t
bWl0IG1lc3NhZ2UgaXRzZWxmLCBJIHdvdWxkIHN1Z2dlc3QgdGhlIGZvbGxvd2luZyB0bw0KPj4+
Pj4gYWRkcmVzcyBKYW4ncyBjb25jZXJuOg0KPj4+PiANCj4+Pj4gV2hpbGUgaW5kZWVkIHRoaXMg
aXMgYSBtdWNoIGJldHRlciBkZXNjcmlwdGlvbiwgSSBjb250aW51ZSB0byB0aGluaw0KPj4+PiB0
aGF0IHRoZSBwcm9wb3NlZCBLY29uZmlnIG9wdGlvbiBpcyB1bmRlc2lyYWJsZSB0byBoYXZlLg0K
Pj4+IA0KPj4+IEkgYW0geWV0IHRvIHNlZSBhbiBhcmd1bWVudCBpbnRvIHdoeSB3ZSBzaG91bGQg
a2VlcCB0aGUgUENJIGNvZGUNCj4+PiBjb21waWxlZCBvbiBBcm0gd2hlbiB0aGVyZSB3aWxsIGJl
IG5vLXVzZS4uLi4NCj4+IFdlbGwsIHNlZSBteSBwYXRjaCBzdXBwcmVzc2luZyBidWlsZGluZyBv
ZiBxdWl0ZSBhIHBhcnQgb2YgaXQuDQo+IA0KPiBJIHdpbGwgbGV0IFJhaHVsIGZpZ3VyaW5nIG91
dCB3aGV0aGVyIHlvdXIgcGF0Y2ggc2VyaWVzIGlzIHN1ZmZpY2llbnQgdG8gZml4IGNvbXBpbGF0
aW9uIGlzc3VlcyAodGhpcyBpcyB3aGF0IG1hdHRlcnMgcmlnaHQgbm93KS4NCg0KSSBqdXN0IGNo
ZWNrZWQgdGhlIGNvbXBpbGF0aW9uIGVycm9yIGZvciBBUk0gYWZ0ZXIgZW5hYmxpbmcgdGhlIEhB
U19QQ0kgb24gQVJNLiBJIGFtIG9ic2VydmluZyB0aGUgc2FtZSBjb21waWxhdGlvbiBlcnJvciB3
aGF0IEkgb2JzZXJ2ZWQgcHJldmlvdXNseS4gDQpUaGVyZSBhcmUgdHdvIG5ldyBlcnJvcnMgcmVs
YXRlZCB0byBzdHJ1Y3QgdWFydF9jb25maWcgYW5kIHN0cnVjdCBwYXJ0X3BhcmFtIGFzIHRob3Nl
IHN0cnVjdCBkZWZpbmVkIGdsb2JhbGx5IGJ1dCB1c2VkIHVuZGVyIFg4NiBmbGFncy4NCg0KQXQg
dG9wIGxldmVsOg0KbnMxNjU1MC5jOjE3OTo0ODogZXJyb3I6IOKAmHVhcnRfY29uZmln4oCZIGRl
ZmluZWQgYnV0IG5vdCB1c2VkIFstV2Vycm9yPXVudXNlZC1jb25zdC12YXJpYWJsZT1dDQogc3Rh
dGljIGNvbnN0IHN0cnVjdCBuczE2NTUwX2NvbmZpZyBfX2luaXRjb25zdCB1YXJ0X2NvbmZpZ1td
ID0NCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+
fn5+fn5+DQpuczE2NTUwLmM6MTA0OjU0OiBlcnJvcjog4oCYdWFydF9wYXJhbeKAmSBkZWZpbmVk
IGJ1dCBub3QgdXNlZCBbLVdlcnJvcj11bnVzZWQtY29uc3QtdmFyaWFibGU9XQ0KIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgbnMxNjU1MF9jb25maWdfcGFyYW0gX19pbml0Y29uc3QgdWFydF9wYXJhbVtd
ID0geyANCg0KDQo+IA0KPj4+PiBFaXRoZXIsDQo+Pj4+IGZvbGxvd2luZyB0aGUgcGF0Y2ggSSd2
ZSBqdXN0IHNlbnQsIHRydWx5IHg4Ni1zcGVjaWZpYyB0aGluZ3MgKGF0DQo+Pj4+IGxlYXN0IGFz
IGZhciBhcyBjdXJyZW50IHN0YXRlIGdvZXMgLSBpZiBhbnkgb2YgdGhpcyB3YXMgdG8gYmUNCj4+
Pj4gcmUtdXNlZCBieSBhIGZ1dHVyZSBwb3J0LCBzdWl0YWJsZSBmdXJ0aGVyIGFic3RyYWN0aW9u
IG1heSBiZQ0KPj4+PiBuZWVkZWQpIHNob3VsZCBiZSBndWFyZGVkIGJ5IENPTkZJR19YODYgKG9y
IGFic3RyYWN0ZWQgaW50byBhcmNoDQo+Pj4+IGhvb2tzKSwgb3IgdGhlIEhBU19QQ0lfTVNJIHBy
b3Bvc2FsIHdvdWxkIGF0IGxlYXN0IHdhbnQgZnVydGhlcg0KPj4+PiBpbnZlc3RpZ2F0aW5nIGFz
IHRvIGl0cyBmZWFzaWJpbGl0eSB0byBhZGRyZXNzIHRoZSBpc3N1ZXMgYXQgaGFuZC4NCj4+PiAN
Cj4+PiBJIHdvdWxkIGJlIGhhcHB5IHdpdGggQ09ORklHX1g4NiwgZGVzcGl0ZSB0aGUgZmFjdCB0
aGF0IHRoaXMgaXMgb25seQ0KPj4+IGRlZmVycmluZyB0aGUgcHJvYmxlbS4NCj4+PiANCj4+PiBS
ZWdhcmRpbmcgSEFTX1BDSV9NU0ksIEkgZG9uJ3QgcmVhbGx5IHNlZSB0aGUgcG9pbnQgb2YgaW50
cm9kdWNpbmcgZ2l2ZW4NCj4+PiB0aGF0IHdlIGFyZSBub3QgZ29pbmcgdG8gdXNlIE5TMTY1NTAg
UENJIG9uIEFybSBpbiB0aGUgZm9yc2VlYWJsZQ0KPj4+IGZ1dHVyZS4NCj4+IEFuZCBJIGNvbnRp
bnVlIHRvIGZhaWwgdG8gc2VlIHdoYXQgd291bGQgZ3VhcmFudGVlIHRoaXM6IEFzIHNvb24NCj4+
IGFzIHlvdSBjYW4gcGx1ZyBpbiBzdWNoIGEgY2FyZCBpbnRvIGFuIEFybSBzeXN0ZW0sIHBlb3Bs
ZSB3aWxsDQo+PiB3YW50IHRvIGJlIGFibGUgdXNlIGl0LiBUaGF0J3Mgd2h5IHdlIGhhZCB0byBh
ZGQgc3VwcG9ydCBmb3IgaXQNCj4+IG9uIHg4NiwgYWZ0ZXIgYWxsLg0KPiANCj4gV2VsbCwgcGx1
Zy1pbiBQQ0kgY2FyZHMgb24gQXJtIGhhcyBiZWVuIGF2YWlsYWJsZSBmb3IgcXVpdGUgYSB3aGls
ZS4uLiBZZXQgSSBoYXZlbid0IGhlYXJkIGFueW9uZSBhc2tpbmcgZm9yIE5TMTY1NTAgUENJIHN1
cHBvcnQuDQo+IA0KPiBUaGlzIGlzIHByb2JhYmx5IGJlY2F1c2UgU0JTQSBjb21wbGlhbnQgc2Vy
dmVyIHNob3VsZCBhbHdheXMgcHJvdmlkZSBhbiBTQlNBIFVBUlQgKGEgY3V0LWRvd24gdmVyc2lv
biBvZiB0aGUgUEwwMTEpLiBTbyB3aHkgd291bGQgYm90aGVyIHRvIGxvc2UgYSBQQ0kgc2xvdCBm
b3IgeWV0IGFub3RoZXIgVUFSVD8NCj4gDQo+PiA+PiBTbyB3aHkgZG8gd2UgbmVlZCBhIGZpbmVy
IGdyYWluZSBLY29uZmlnPw0KPj4gQmVjYXVzZSBtb3N0IG9mIHRoZSBpbnZvbHZlZCBjb2RlIGlz
IGluZGVlZCBNU0ktcmVsYXRlZD8NCj4gDQo+IFBvc3NpYmx5LCB5ZXQgaXQgd291bGQgbm90IGJl
IG5lY2Vzc2FyeSBpZiB3ZSBkb24ndCB3YW50IE5TMTY1NTAgUENJIHN1cHBvcnQuLi4NCg0KPiAN
Cg0KVG8gZml4IGNvbXBpbGF0aW9uIGVycm9yIG9uIEFSTSBhcyBwZXIgdGhlIGRpc2N1c3Npb24g
dGhlcmUgYXJlIGJlbG93IG9wdGlvbnMgcGxlYXNlIHN1Z2dlc3Qgd2hpY2ggb25lIHRvIHVzZSB0
byBwcm9jZWVkIGZ1cnRoZXIuDQoNCjEuIFVzZSB0aGUgbmV3bHkgaW50cm9kdWNlZCBDT05GSUdf
SEFTX05TMTY1NTBfUENJIGNvbmZpZyBvcHRpb25zLiBUaGlzIGhlbHBzIGFsc28gbm9uLXg4NiBh
cmNoaXRlY3R1cmUgaW4gdGhlIGZ1dHVyZSBub3QgdG8gaGF2ZSBjb21waWxhdGlvbiBlcnJvciAN
CndoYXQgd2UgYXJlIG9ic2VydmluZyBub3cgd2hlbiBIQVNfUENJIGlzIGVuYWJsZWQuDQoNCjIu
IEd1YXJkIHRoZSByZW1haW5pbmcgeDg2IHNwZWNpZmljIGNvZGUgd2l0aCBDT05GSUdfWDg2IGFu
ZCBpbnRyb2R1Y2UgdGhlIG5ldyBDT05GSUdfSEFTX1BDSV9NU0kgb3B0aW9ucyB0byBmaXggdGhl
IE1TSSByZWxhdGVkIGNvbXBpbGF0aW9uIGVycm9yLiANCk9uY2Ugd2UgaGF2ZSBwcm9wZXIgc3Vw
cG9ydCBmb3IgTVNJIGFuZCBQQ0kgZm9yIEFSTSAgKEhBU19QQ0lfTVNJIGFuZCBIQVNfUENJIGVu
YWJsZWQgZm9yIEFSTSBpbiBLY29uZmlnICkgSSBhbSBub3Qgc3VyZSBpZiBOUzE2NTUwIFBDSSB3
aWxsIHdvcmsgb3V0IG9mIHRoZSBib3ggb24gQVJNIC5JbiB0aGF0IGNhc2UsIHdlIG1pZ2h0IG5l
ZWQgdG8gY29tZSBiYWNrIGFnYWluIHRvIGZpeCBOUzE2NTUwIGRyaXZlci4gIA0KDQoNCj4gQ2hl
ZXJzLA0KPiANCj4gLS0gDQo+IEp1bGllbiBHcmFsbA0KDQoNClJlZ2FyZHMsDQpSYWh1bA==

