Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B142B7D3B
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 13:04:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29753.59402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfMBh-0005rU-SH; Wed, 18 Nov 2020 12:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29753.59402; Wed, 18 Nov 2020 12:03:49 +0000
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
	id 1kfMBh-0005r5-Oy; Wed, 18 Nov 2020 12:03:49 +0000
Received: by outflank-mailman (input) for mailman id 29753;
 Wed, 18 Nov 2020 12:03:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fWLM=EY=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kfMBg-0005r0-Cq
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 12:03:48 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.42]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 54db0103-b2e2-470c-906c-068d1201863b;
 Wed, 18 Nov 2020 12:03:47 +0000 (UTC)
Received: from AM6PR0502CA0043.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::20) by PA4PR08MB6015.eurprd08.prod.outlook.com
 (2603:10a6:102:e6::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Wed, 18 Nov
 2020 12:03:44 +0000
Received: from AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::61) by AM6PR0502CA0043.outlook.office365.com
 (2603:10a6:20b:56::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Wed, 18 Nov 2020 12:03:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT008.mail.protection.outlook.com (10.152.16.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 12:03:44 +0000
Received: ("Tessian outbound 13ed5f5344c0:v71");
 Wed, 18 Nov 2020 12:03:44 +0000
Received: from c2df1611ba3a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 80D730B6-126D-4D0D-9AA9-A786686531EE.1; 
 Wed, 18 Nov 2020 12:03:28 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c2df1611ba3a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 18 Nov 2020 12:03:28 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB7PR08MB3210.eurprd08.prod.outlook.com (2603:10a6:5:20::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Wed, 18 Nov
 2020 12:03:25 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28%6]) with mapi id 15.20.3564.028; Wed, 18 Nov 2020
 12:03:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=fWLM=EY=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kfMBg-0005r0-Cq
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 12:03:48 +0000
X-Inumbo-ID: 54db0103-b2e2-470c-906c-068d1201863b
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown [40.107.21.42])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 54db0103-b2e2-470c-906c-068d1201863b;
	Wed, 18 Nov 2020 12:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVZliGCi+zXs1isdfwA+p59HeIN8KXGv0wVGlmUCX/8=;
 b=g9YaCVtjrfuSLPCnA1LWHJvOBhgNG5Os6zKgP0VmbDkJe8GxJAwQrDnNZ60F/UGRNmXH3ttcZBoEWeQzsVuiOAVzbgKSbxu/h6ymR2NMU28ufkPoXM4r8n0mg3tcYEBgYnbse++xzoPF80NdI3Dzy0DQFMCoVK/Sv/fxbYrBcj0=
Received: from AM6PR0502CA0043.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::20) by PA4PR08MB6015.eurprd08.prod.outlook.com
 (2603:10a6:102:e6::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Wed, 18 Nov
 2020 12:03:44 +0000
Received: from AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::61) by AM6PR0502CA0043.outlook.office365.com
 (2603:10a6:20b:56::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Wed, 18 Nov 2020 12:03:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT008.mail.protection.outlook.com (10.152.16.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 12:03:44 +0000
Received: ("Tessian outbound 13ed5f5344c0:v71"); Wed, 18 Nov 2020 12:03:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 53cd0060d0584fea
X-CR-MTA-TID: 64aa7808
Received: from c2df1611ba3a.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 80D730B6-126D-4D0D-9AA9-A786686531EE.1;
	Wed, 18 Nov 2020 12:03:28 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c2df1611ba3a.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 18 Nov 2020 12:03:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GSV/h4OtVCV6BwJZbY3aqOFih66AYeTpDi+Xkcr3J7FEinMkZAmfucy083kz+fv0T9DeGl8e+wzXgdTtYr5I6Ejr2TyfT4WmZ1b6qraxpevrf+k2kv/p16tGqTprTB/ndCY/PZbq7rmMp3Kk52T3e8DO1tDVfmoPVH5G+fcUMk2EsVXrtDHIW8a8MxQ4zXYrfUDE2Ae5R8cGGPJGmEnLPz+F4r++PoBQhT3V7PM76ZRXXEgEW7V6XmmbqzwnM2J8Ul/zgI5xM4gX0KjrdHT2rTDFphCn8g5xgAx0V9fE4aQX2GvcFtQGDO83GKoqqEOLLWaW5iRB04zBb6YuH3octQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVZliGCi+zXs1isdfwA+p59HeIN8KXGv0wVGlmUCX/8=;
 b=nAKlFtmRGurAUjEPwwgHiiBLYttlqUAD05oxTfdZsMH9j2RWpmCjVbJMfzQVjod1rzmiCPRbRvmt+MtQzR0n8cXcI81x9SWg/GZfPu2Io+pRt6Ihb2xSVoEf+s1Q0fM5LLJrDjwgdqTydC05qQgVDqG1yE74XsdIZbEVQYSuIXJDkmjc5VH5jHTrkbDQKQuCv2HvGOft5nj/sadHbsnU7ihUfv+zggwDC5Uf9rwcaDqFXCwUGI0cjeWHpHMxT5oi+j+JYva6yIz9vN5r409suQy5DtxOID03kbUYxhBwB2K09Lp2J9AvxIJ6LZGa+2D03nEQyrCfyv3Gns8AcU6vhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVZliGCi+zXs1isdfwA+p59HeIN8KXGv0wVGlmUCX/8=;
 b=g9YaCVtjrfuSLPCnA1LWHJvOBhgNG5Os6zKgP0VmbDkJe8GxJAwQrDnNZ60F/UGRNmXH3ttcZBoEWeQzsVuiOAVzbgKSbxu/h6ymR2NMU28ufkPoXM4r8n0mg3tcYEBgYnbse++xzoPF80NdI3Dzy0DQFMCoVK/Sv/fxbYrBcj0=
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB7PR08MB3210.eurprd08.prod.outlook.com (2603:10a6:5:20::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Wed, 18 Nov
 2020 12:03:25 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28%6]) with mapi id 15.20.3564.028; Wed, 18 Nov 2020
 12:03:25 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <stefano.stabellini@xilinx.com>
CC: Leo Krueger <leo.krueger@zal.aero>, Peng Fan <peng.fan@nxp.com>,
	"brucea@xilinx.com" <brucea@xilinx.com>, Cornelia Bruelhart
	<cornelia.bruelhart@zal.aero>, "oleksandr_andrushchenko@epam.com"
	<oleksandr_andrushchenko@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "julien@xen.org" <julien@xen.org>
Subject: Re: Xen data from meta-virtualization layer
Thread-Topic: Xen data from meta-virtualization layer
Thread-Index: AQHWvaLRh1nbYfhrCUytfKaPqimIIA==
Date: Wed, 18 Nov 2020 12:03:25 +0000
Message-ID: <B8CEC628-41EB-44F4-BF72-540C42BFA119@arm.com>
References:
 <AM4PR0501MB2227089FDDF0209EF6E215D9E6100@AM4PR0501MB2227.eurprd05.prod.outlook.com>
 <AM4PR0501MB22274E52A5A3BE912D477D8CE6EA0@AM4PR0501MB2227.eurprd05.prod.outlook.com>
 <HE1PR05MB47941E23CE053CE72F18867C8BEA0@HE1PR05MB4794.eurprd05.prod.outlook.com>
 <alpine.DEB.2.21.2011091858010.21307@sstabellini-ThinkPad-T480s>
 <HE1PR05MB4794B5C57A54A29A48EE8EAE8BE90@HE1PR05MB4794.eurprd05.prod.outlook.com>
 <alpine.DEB.2.21.2011101842500.21307@sstabellini-ThinkPad-T480s>
 <DB6PR0402MB27608A03EC717053E392A92988E80@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <HE1PR05MB47940ED4E5FDC0BADC54C8E78BE80@HE1PR05MB4794.eurprd05.prod.outlook.com>
 <DB6PR0402MB2760CEEABA9F52CDEB27C1DB88E80@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <HE1PR05MB47944761ED6A26D3E2CE15868BE40@HE1PR05MB4794.eurprd05.prod.outlook.com>
 <alpine.DEB.2.21.2011161656080.20906@sstabellini-ThinkPad-T480s>
 <HE1PR05MB4794569AC67109AF8B6517268BE20@HE1PR05MB4794.eurprd05.prod.outlook.com>
 <alpine.DEB.2.21.2011171544380.438@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2011171544380.438@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 687d43f3-772a-4d89-7b8e-08d88bb9ff85
x-ms-traffictypediagnostic: DB7PR08MB3210:|PA4PR08MB6015:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB6015E9EA9A1FAC7D04E61996FCE10@PA4PR08MB6015.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4502;OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hpsjHzNM/HGEhIBctM54HQlskJaARh6Hk4NJMuijgpukuL3Qh3o1c2oBnlXNunagCe2bGxxgmtpMElf6axQGbxNsF0v91VzUtUYhheNnaJw5dLca2OO/SlnWJaoqjB/lw68ws4VnzE004+a/G7cofkV8Eb2Mm24ORQoUy1ilR+6ioc6YwAhQ//ikgazQCt7TUKPYeFAfT2Fk/NgFk8/GbKgqGekw7fYv5S7Pg2m228wbrcinDWIdLX3R1fC2KudPdPnhYKD40EixbmoEfBcWcxykIfFFkA5ouuDEOHu5zai5CAG4vozk8lk4LnFE121HUgaPyecqd7D7v9XOIZLLNw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(376002)(136003)(366004)(66574015)(26005)(2616005)(8676002)(53546011)(36756003)(6916009)(33656002)(83380400001)(8936002)(316002)(4326008)(2906002)(5660300002)(6512007)(66556008)(54906003)(66476007)(76116006)(6486002)(478600001)(71200400001)(91956017)(186003)(66946007)(66446008)(64756008)(86362001)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 EXjd+hWPoe7Vp5cOz0oYT+qd0IuO036hRrtVLS8K1BbAr/HTmlEkZwnxdi30bB4ozcU2wmLlb3sr4i3zzqRQyrJ3xTYar3n0RPZLCDVMufKAdtl4Kn0z6Vk01HAxuXlRBGAmZOZbJH5WQ2a/V44cLBcq7VufimFtWamGwvGIekMiWtcZXWdnF2HYDQom3iy9YZNMJ/Zl7ja+mYoj6PeMQVBcO9sHyolXcMbebJjPuP0ojVKdeoAhNMwiijp3H6tj4UxBCdg8oCx4I2AYGJQPtawbrqO6H4lilLHlgjpMcUYV5FtpmsFmJNLlPe2fA+krq3cw0+LKd//RwyW28IgFcXWZBdQk+Ab7pohYJNJ5vZHSfaGRqSikk/8h9hUdt3WkP7kNrKhILfnbudaq8PZGtx3nortkyEMqCk7YfdCkr17a2WsolZLP2n6JCIuLi2UuGfzz7TOA0Dx5WBvJYxQcyw0v1XAOc/V1FM65/L7nHDHPx7DOv+3vxr0f9LLHEfSFn9QruQWW78hDZsvSYHn7CRyRYieFE+Q1eLpA6+sjvjivwNg9mlkRNXiRxCdsCcFYF5PyYKcZzoo7e1HVF+/+QiYESUMS48FYUbN7vn7Z6zDkmpcD/g+zkUeco/yxeteFGlwjS1BV3oO+3e1R3ia1rPXXshtYRhcYV+SFTkKX2+tRxic22VherM1njklPogpr08sXnJM11Q0RJYLMwi1M1pBJx7qqruOLrLxLI0p0XvqRDWxeUjMBjM9wl/3U+iPHzML720cerl5fPTgWpx4e4y9sdjmY1ghYZX8VAav+DjB7bWpn7MvfR7wVEgi3ojghAv0ZNG5q7O/+BRkYSKfkFm7TNlA/ZhoF9/EvFgMiqlIqGgD988lDtr5wUuYUPqz/HyhWL0PjsGfoESpTyksIyg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <35FEF3807D2A8144AC78CCAEC86711ED@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3210
Original-Authentication-Results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3385e386-90bf-486c-187b-08d88bb9f409
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	07JrVhIQX2V5BcY5vTsx+KhQtU/eXQFpQBUdZATfhrlFPZ8QlPUJjxiX3qldw2iq2mlAnAuInghP7J0gTPxV1vaeFec2fdrrIRuPyl3gfKXYuvhGag89v38YsODpbBY3BZ9xIkf+1qHV/xGPNvhGRUvI0Lu3BN4rmZ1wWkirYuiPzi57aO1CVqCdSNz6F8ThqYZn4mnJAx26HEWaoIVtl/L7MDGLmiTbbfYmCwSDxoeV9SK0EAHIvw7YgkmSyd+a6ILDXaKveyd11KvPLYueSfCLzckGXOetaBC4snXmqqdMW6xTKzUUY8v+oVvRQ7fbtBlgeQa7g950alj6YGaZ5aEPAXK8rfiI37uV4zQeJcl6KKRlO7qFmQp1dapxmiRGpKW4Ihd4ZCZMAFZAjUzUXg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39850400004)(396003)(346002)(376002)(46966005)(54906003)(5660300002)(86362001)(66574015)(478600001)(53546011)(70206006)(6506007)(8676002)(70586007)(26005)(82310400003)(81166007)(186003)(6512007)(47076004)(82740400003)(8936002)(356005)(336012)(83380400001)(2906002)(316002)(6486002)(2616005)(36906005)(33656002)(4326008)(36756003)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 12:03:44.4334
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 687d43f3-772a-4d89-7b8e-08d88bb9ff85
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6015

SGVsbG8gU3RlZmFubywNCg0KDQo+IE9uIDE3IE5vdiAyMDIwLCBhdCAxMTo1MyBwbSwgU3RlZmFu
byBTdGFiZWxsaW5pIDxzdGVmYW5vLnN0YWJlbGxpbmlAeGlsaW54LmNvbT4gd3JvdGU6DQo+IA0K
PiBBZGRpbmcgQmVydHJhbmQsIE9sZWtzYW5kciwgSnVsaWVuLCBhbmQgb3RoZXJzIC0tIHRoZXkg
aGF2ZSBhIG1vcmUNCj4gcmVjZW50IGV4cGVyaWVuY2Ugd2l0aCBHSUN2MyBJVFMgdGhhbiBtZSBh
bmQgbWlnaHQgYmUgYWJsZSB0byBoZWxwLg0KPiBJIGFtIGF0dGFjaGluZyB0aGUgZGV2aWNlIHRy
ZWUgTGVvIHNlbnQgYSBmZXcgZGF5cyBhZ28gZm9yIHJlZmVyZW5jZS4NCj4gDQo+IA0KPiBUeXBp
Y2FsbHkgd2hlbiB5b3UgY2FuIHNldCB0aGUgZXRoZXJuZXQgbGluayB1cCBhbmQgbm8gcGFja2V0
cyBhcmUNCj4gZXhjaGFuZ2VkIGl0IGlzIGJlY2F1c2Ugb2YgYSBtaXNzaW5nIGludGVycnVwdC4g
SW4gdGhpcyBjYXNlIGEgbWlzc2luZw0KPiBNU0kuDQo+IA0KPiBCZXJ0cmFuZCwgSSBiZWxpZXZl
IHlvdSB0cmllZCB0aGUgR0lDIElUUyBkcml2ZXIgd2l0aCBQQ0kgZGV2aWNlcw0KPiByZWNlbnRs
eS4gSXQgaXMgZXhwZWN0ZWQgdG8gd29yayBjb3JyZWN0bHkgd2l0aCBNU0lzIGluIERvbTAsIHJp
Z2h0Pw0KPiANCg0KWWVzIHdlIGFyZSB1c2luZyB0aGUgWEVOIEdJQyBJVFMgZHJpdmVyIGFuZCBN
U0kgaW50ZXJydXB0cyBpcyB3b3JraW5nIGZpbmUgaW4gRE9NMC4NCg0KMjA6ICAgICAgICAxMTIg
ICAgICAgICAgMCAgICAgICAgICAwICAgICAgICAgIDAgICBJVFMtTVNJIDE1NzI4NjQgRWRnZSAg
ICAgIGV0aDANCiAyMTogICAgICAgIDQ0MSAgICAgICAgICAwICAgICAgICAgIDAgICAgICAgICAg
MCAgIElUUy1NU0kgMzY3MDAxNiBFZGdlICAgICAgZXRoMQ0KIDIyOiAgICAgICA0Mjg2ICAgICAg
ICAgIDAgICAgICAgICAgMCAgICAgICAgICAwICAgSVRTLU1TSSA0MTk0MzA0IEVkZ2UgICAgICB4
aGNpX2hjZA0KDQoNClJlZ2FyZHMsDQpSYWh1bA0KDQo+IA0KPiBPbiBUdWUsIDE3IE5vdiAyMDIw
LCBMZW8gS3J1ZWdlciB3cm90ZToNCj4+IEhpLA0KPj4gDQo+PiBJIGVuYWJsZWQgQ09ORklHX0hB
U19JVFMgKHdoYXQgYSBzdHVwaWQgbWlzdGFrZSBieSBtZSB0byBub3Qgc2V0IGl0IGJlZm9yZS4u
LikgYnV0IHRoZW4gaGFkIHRvIGFkZCB0aGUgZm9sbG93aW5nIG5vZGUgdG8gbXkgZGV2aWNlIHRy
ZWUNCj4+IA0KPj4gCWdpY19scGlfYmFzZTogc3lzY29uQDB4ODAwMDAwMDAgew0KPj4gCQljb21w
YXRpYmxlID0gImdpYy1scGktYmFzZSI7DQo+PiAJCXJlZyA9IDwweDAgMHg4MDAwMDAwMCAweDAg
MHgxMDAwMDA+Ow0KPj4gCQltYXgtZ2ljLXJlZGlzdHJpYnV0b3JzID0gPDI+Ow0KPj4gCX07DQo+
PiANCj4+IHRvIHNvbWVob3cgY2hhbmdlIHNvbWV0aGluZyBpbiByZWdhcmQgdG8gdGhlIElUUyBh
bmQgTVNJL01TSS1YDQo+PiANCj4+IChYRU4pIEdJQ3YzIGluaXRpYWxpemF0aW9uOg0KPj4gKFhF
TikgICAgICAgZ2ljX2Rpc3RfYWRkcj0weDAwMDAwMDA2MDAwMDAwDQo+PiAoWEVOKSAgICAgICBn
aWNfbWFpbnRlbmFuY2VfaXJxPTI1DQo+PiAoWEVOKSAgICAgICBnaWNfcmRpc3Rfc3RyaWRlPTAN
Cj4+IChYRU4pICAgICAgIGdpY19yZGlzdF9yZWdpb25zPTENCj4+IChYRU4pICAgICAgIHJlZGlz
dHJpYnV0b3IgcmVnaW9uczoNCj4+IChYRU4pICAgICAgICAgLSByZWdpb24gMDogMHgwMDAwMDAw
NjA0MDAwMCAtIDB4MDAwMDAwMDYwODAwMDANCj4+IChYRU4pIEdJQ3YzOiB1c2luZyBhdCBtb3N0
IDU3MzQ0IExQSXMgb24gdGhlIGhvc3QuDQo+PiAoWEVOKSBHSUN2MzogMjg4IGxpbmVzLCAoSUlE
IDAwMDExNDNiKS4NCj4+IChYRU4pIEdJQ3YzOiBGb3VuZCBJVFMgQDB4NjAyMDAwMA0KPj4gKFhF
TikgdXNpbmcgbm9uLWNhY2hlYWJsZSBJVFMgY29tbWFuZCBxdWV1ZQ0KPj4gKFhFTikgR0lDdjM6
IENQVTA6IEZvdW5kIHJlZGlzdHJpYnV0b3IgaW4gcmVnaW9uIDAgQDAwMDAwMDAwNDAwMWMwMDAN
Cj4+IA0KPj4gWyAgICAwLjAwMDAwMF0gR0lDdjM6IERpc3RyaWJ1dG9yIGhhcyBubyBSYW5nZSBT
ZWxlY3RvciBzdXBwb3J0DQo+PiBbICAgIDAuMDAwMDAwXSBHSUN2Mzogbm8gVkxQSSBzdXBwb3J0
LCBubyBkaXJlY3QgTFBJIHN1cHBvcnQNCj4+IFsgICAgMC4wMDAwMDBdIElUUyBbbWVtIDB4MDYw
MjAwMDAtMHgwNjAzZmZmZl0NCj4+IFsgICAgMC4wMDAwMDBdIElUU0AweDAwMDAwMDAwMDYwMjAw
MDA6IGFsbG9jYXRlZCA2NTUzNiBEZXZpY2VzIEBkYzg4MDAwMCAoZmxhdCwgZXN6IDgsIHBzeiA2
NEssIHNociAxKQ0KPj4gWyAgICAwLjAwMDAwMF0gSVRTQDB4MDAwMDAwMDAwNjAyMDAwMDogYWxs
b2NhdGVkIDMyNzY4IEludGVycnVwdCBDb2xsZWN0aW9ucyBAZGM4MjAwMDAgKGZsYXQsIGVzeiAy
LCBwc3ogNjRLLCBzaHIgMSkNCj4+IFsgICAgMC4wMDAwMDBdIEdJQzogdXNpbmcgTFBJIHByb3Bl
cnR5IHRhYmxlIEAweDAwMDAwMDAwZGM4MzAwMDANCj4+IFsgICAgMC4wMDAwMDBdIEdJQ3YzOiBD
UFUwOiBmb3VuZCByZWRpc3RyaWJ1dG9yIDAgcmVnaW9uIDA6MHgwMDAwMDAwMDA2MDQwMDAwDQo+
PiBbICAgIDAuMDAwMDAwXSBDUFUwOiB1c2luZyBMUEkgcGVuZGluZyB0YWJsZSBAMHgwMDAwMDAw
MGRjODQwMDAwDQo+PiAuLi4NCj4+IFsgICAgMC4wNDAwODBdIFBsYXRmb3JtIE1TSTogZ2ljLWl0
cyBkb21haW4gY3JlYXRlZA0KPj4gWyAgICAwLjA0MDEzNl0gUENJL01TSTogL2ludGVycnVwdC1j
b250cm9sbGVyL2dpYy1pdHMgZG9tYWluIGNyZWF0ZWQNCj4+IFsgICAgMC4wNDAxODFdIGZzbC1t
YyBNU0k6IC9pbnRlcnJ1cHQtY29udHJvbGxlci9naWMtaXRzIGRvbWFpbiBjcmVhdGVkDQo+PiAN
Cj4+IA0KPj4gU3RpbGwgSSBhbSBlbmRpbmcgdXAgd2l0aCB0aGUgIiBGYWlsZWQgdG8gYWRkIC0g
cGFzc3Rocm91Z2ggb3IgTVNJL01TSS1YIG1pZ2h0IGZhaWwhIiBsb2cgbWVzc2FnZXMgZm9yIHNv
bWUgUENJIGRldmljZXMsIGJ1dCBhdCBsZWFzdCB0aGUgb24tYm9hcmQgZXRoZXJuZXQgcG9ydHMg
KGZzbF9lbmV0YyApIGFyZSBpbml0aWFsaXplZC4NCj4+IEkgY2FuIHNldCB0aGUgbGluayB1cCBh
bmQgYSBsaW5rIGlzIHN1Y2Nlc3NmdWxseSBlc3RhYmxpc2hlZC4NCj4+IA0KPj4gQnV0ICghKSBJ
IGNhbm5vdCByZWNlaXZlIG9yIHRyYW5zbWl0IGFueXRoaW5nIChubyBlcnJvciBtZXNzYWdlLi4u
KSBhbmQgdGhlcmUgc2VlbSB0byBiZSBubyBpbnRlcnJ1cHRzOg0KPj4gDQo+PiAyOTogICAgICAg
ICAgMCAgIElUUy1NU0kgICAxIEVkZ2UgICAgICBnYmUwLXJ4dHgwDQo+PiAzMjogICAgICAgICAg
MCAgIElUUy1NU0kgODE5MiBFZGdlICAgICAgcHRwX3FvcmlxDQo+PiANCj4+IChmcm9tIC9wcm9j
L2ludGVycnVwdHMpLg0KPj4gDQo+PiBBbnkgaWRlYSBvbiB0aGlzIG9uZT8gSSBrZWVwIGRpZ2dp
bmcgYW5kIGNoZWNraW5nIHdoZXRoZXIgbXkgZGV2aWNlIHRyZWUgbmVlZHMgc29tZSBhZGRpdGlv
bmFsIGZpeGVzLg0KPj4gDQo+PiBLaW5kIHJlZ2FyZHMsDQo+PiBMZW8NCj4+IA0KPj4gLS0NCj4+
IExlbyBLcsO8Z2VyLCBNLlNjLg0KPj4gU2VuaW9yIFN5c3RlbXMgRW5naW5lZXIgRGlzdHJpYnV0
ZWQgU3lzdGVtcw0KPj4gSW50ZWxsaWdlbnQgRGlnaXRhbCBDYWJpbg0KPj4gDQo+PiBaQUwgWmVu
dHJ1bSBmw7xyIEFuZ2V3YW5kdGUgTHVmdGZhaHJ0Zm9yc2NodW5nIEdtYkgNCj4+IEhlaW4tU2HD
ny1XZWcgMjINCj4+IDIxMTI5IEhhbWJ1cmcNCj4+ICANCj4+ICs0OSAoMCkgNDAgMjQ4IDU5NS0x
NTQNCj4+IA0KPj4gemFsLmFlcm8gfCB0d2l0dGVyLmNvbS9aQUxUZWNoQ2VudGVyIHwgZmFjZWJv
b2suY29tL1pBTFRlY2hDZW50ZXIgDQo+PiANCj4+IFpBTCBaZW50cnVtIGbDvHIgQW5nZXdhbmR0
ZSBMdWZ0ZmFocnRmb3JzY2h1bmcgR21iSCANCj4+IFNpdHogZGVyIEdlc2VsbHNjaGFmdCAvIExl
Z2FsIERvbWljaWxlOiBIYW1idXJnIA0KPj4gUmVnaXN0ZXJnZXJpY2h0IC8gUmVnaXN0cmF0aW9u
IENvdXJ0OiBBbXRzZ2VyaWNodCBIYW1idXJnIEhSQiAxMTAyMzINCj4+IFZvcnNpdHplbmRlciBk
ZXMgQXVmc2ljaHRzcmF0ZXMgLyBDaGFpcm1hbiBvZiB0aGUgU3VwZXJ2aXNvcnkgQm9hcmQ6IFN0
UiBBbmRyZWFzIFJpZWNraG9mDQo+PiBHZXNjaMOkZnRzZsO8aHJ1bmcgLyBCb2FyZCBvZiBNYW5h
Z2VtZW50OiBSb2xhbmQgR2VyaGFyZHMNCj4+IA0KPj4gRGlzY2xhaW1lcjoNCj4+IFRoaXMgZS1t
YWlsIG1heSBjb250YWluIGNvbmZpZGVudGlhbCBhbmQvb3IgcHJpdmlsZWdlZCBpbmZvcm1hdGlv
bi4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCAob3IgaGF2ZQ0KPj4gcmVj
ZWl2ZWQgdGhpcyBtYWlsIGluIGVycm9yKSwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVk
aWF0ZWx5IGFuZCBkZXN0cm95IHRoaXMgZS1tYWlsLiBBbnkgdW5hdXRob3Jpc2VkIGNvcHlpbmcs
IA0KPj4gZGlzY2xvc3VyZSBvciBkaXN0cmlidXRpb24gb2YgdGhlIG1hdGVyaWFsIGluIHRoaXMg
ZS1tYWlsIGlzIHN0cmljdGx5IGZvcmJpZGRlbi4NCj4+IA0KPj4+IC0tLS0tVXJzcHLDvG5nbGlj
aGUgTmFjaHJpY2h0LS0tLS0NCj4+PiBWb246IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFuby5z
dGFiZWxsaW5pQHhpbGlueC5jb20+DQo+Pj4gR2VzZW5kZXQ6IERpZW5zdGFnLCAxNy4gTm92ZW1i
ZXIgMjAyMCAwMTo1OQ0KPj4+IEFuOiBMZW8gS3J1ZWdlciA8bGVvLmtydWVnZXJAemFsLmFlcm8+
DQo+Pj4gQ2M6IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPjsgU3RlZmFubyBTdGFiZWxsaW5p
DQo+Pj4gPHN0ZWZhbm8uc3RhYmVsbGluaUB4aWxpbnguY29tPjsgYnJ1Y2VhQHhpbGlueC5jb207
IENvcm5lbGlhIEJydWVsaGFydA0KPj4+IDxjb3JuZWxpYS5icnVlbGhhcnRAemFsLmFlcm8+DQo+
Pj4gQmV0cmVmZjogUmU6IEFXOiBBVzogQVc6IFhlbiBkYXRhIGZyb20gbWV0YS12aXJ0dWFsaXph
dGlvbiBsYXllcg0KPj4+IA0KPj4+IFJlcGxpZXMgaW5saW5lIGJlbG93DQo+Pj4gDQo+Pj4gDQo+
Pj4gT24gU3VuLCAxNSBOb3YgMjAyMCwgTGVvIEtydWVnZXIgd3JvdGU6DQo+Pj4+IEhpIFBlbmcs
IGhpIFN0ZWZhbm8sDQo+Pj4+IA0KPj4+PiANCj4+Pj4gDQo+Pj4+IHNvcnJ5IGZvciB0aGUgbG9u
ZyBzaWxlbmNl4oCmDQo+Pj4+IA0KPj4+PiANCj4+Pj4gDQo+Pj4+IEkgdHJpZWQgdGhlIGNoYW5n
ZSBzdWdnZXN0ZWQgKGFuZCBob3BlIEkgZGlkbuKAmXQgZG8gYW55dGhpbmcgd3JvbmcNCj4+Pj4g
d2hpbGUgZG9pbmcgc2/igKYpIG9uIHRvcCBvZiBYRU4gNC4xMy4yIChiZWZvcmUsIEkgYWx3YXlz
IHRyaWVkIHdpdGgNCj4+Pj4gNC4xMiBidXQgd2FudGVkIHRvIGdpdmUgNC4xMy4yIGEgdHJ5IGFz
IHdlbGwpIGJ1dCBJIGRvIG5vdCBzZWUgYW55IGRpZmZlcmVuY2UsDQo+Pj4gc3RpbGwgdGhlIHNh
bWUg4oCcdW5oYW5kbGVkIGNvbnRleHQgZmF1bHTigJ0gbG9nIGVudHJpZXMgcG9wIHVwIGFuZCBJ
IGNhbm5vdA0KPj4+IGFjY2VzcyBteSBzZGNhcmQuDQo+Pj4+IA0KPj4+PiANCj4+Pj4gDQo+Pj4+
IEFzIGl0IHNlZW1zIHRvIHdvcmsgd2l0aG91dCByZXNwZWN0aXZlbHkgZGlzYWJsZWQgaW9tbXUs
IHRoYXQgd291bGQgYmUNCj4+Pj4gZmluZSBmb3IgbWUgZm9yIG5vdy4gV2hhdCBJIGFtIHdvcnJp
ZWQgYWJvdXQgYSBiaXQgbW9yZSBpcyBQQ0llIG9yDQo+Pj4gTVNJL01TSVggdG8gYmUgZXhhY3Qu
DQo+Pj4+IA0KPj4+PiANCj4+Pj4gDQo+Pj4+IEhlcmUgaXMgdGhlIGdpYy12MyBhbmQgaXRzIG5v
ZGUgZnJvbSBteSBkZXZpY2UgdHJlZToNCj4+Pj4gDQo+Pj4+IA0KPj4+PiANCj4+Pj4gaW50ZXJy
dXB0LWNvbnRyb2xsZXJANjAwMDAwMCB7DQo+Pj4+IA0KPj4+PiAgICAgICAgIGNvbXBhdGlibGUg
PSAiYXJtLGdpYy12MyI7DQo+Pj4+IA0KPj4+PiAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDB4
Mj47DQo+Pj4+IA0KPj4+PiAgICAgICAgICNzaXplLWNlbGxzID0gPDB4Mj47DQo+Pj4+IA0KPj4+
PiAgICAgICAgIHJhbmdlczsNCj4+Pj4gDQo+Pj4+ICAgICAgICAgcmVnID0gPDB4MCAweDYwMDAw
MDAgMHgwIDB4MTAwMDAgMHgwIDB4NjA0MDAwMCAweDAgMHg0MDAwMD47DQo+Pj4+IA0KPj4+PiAg
ICAgICAgICNpbnRlcnJ1cHQtY2VsbHMgPSA8MHgzPjsNCj4+Pj4gDQo+Pj4+ICAgICAgICAgaW50
ZXJydXB0LWNvbnRyb2xsZXI7DQo+Pj4+IA0KPj4+PiAgICAgICAgIGludGVycnVwdHMgPSA8MHgx
IDB4OSAweGYwOD47DQo+Pj4+IA0KPj4+PiAgICAgICAgIHBoYW5kbGUgPSA8MHgxPjsNCj4+Pj4g
DQo+Pj4+IA0KPj4+PiANCj4+Pj4gICAgICAgICBnaWMtaXRzQDYwMjAwMDAgew0KPj4+PiANCj4+
Pj4gICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYXJtLGdpYy12My1pdHMiOw0KPj4+PiAN
Cj4+Pj4gICAgICAgICAgICAgICAgIG1zaS1jb250cm9sbGVyOw0KPj4+PiANCj4+Pj4gICAgICAg
ICAgICAgICAgIHJlZyA9IDwweDAgMHg2MDIwMDAwIDB4MCAweDIwMDAwPjsNCj4+Pj4gDQo+Pj4+
ICAgICAgICAgICAgICAgICBwaGFuZGxlID0gPDB4ZD47DQo+Pj4+IA0KPj4+PiAgICAgICAgIH07
DQo+Pj4+IA0KPj4+PiB9Ow0KPj4+PiANCj4+Pj4gDQo+Pj4+IA0KPj4+PiBBbmQgaGVyZSBhcmUg
c29tZSBrZXJuZWwgbG9nIGV4Y2VycHRzIHJlbGF0ZWQgdG8gR0lDIHdoZW4gYm9vdGluZw0KPj4+
IHdpdGhvdXQgKCEpIFhFTjoNCj4+Pj4gDQo+Pj4+IA0KPj4+PiANCj4+Pj4gWyAgICAwLjAwMDAw
MF0gR0lDdjM6IEdJQzogVXNpbmcgc3BsaXQgRU9JL0RlYWN0aXZhdGUgbW9kZQ0KPj4+PiANCj4+
Pj4gWyAgICAwLjAwMDAwMF0gR0lDdjM6IERpc3RyaWJ1dG9yIGhhcyBubyBSYW5nZSBTZWxlY3Rv
ciBzdXBwb3J0DQo+Pj4+IA0KPj4+PiBbICAgIDAuMDAwMDAwXSBHSUN2Mzogbm8gVkxQSSBzdXBw
b3J0LCBubyBkaXJlY3QgTFBJIHN1cHBvcnQNCj4+Pj4gDQo+Pj4+IFsgICAgMC4wMDAwMDBdIElU
UyBbbWVtIDB4MDYwMjAwMDAtMHgwNjAzZmZmZl0NCj4+Pj4gDQo+Pj4+IFsgICAgMC4wMDAwMDBd
IElUU0AweDAwMDAwMDAwMDYwMjAwMDA6IGFsbG9jYXRlZCA2NTUzNiBEZXZpY2VzDQo+Pj4+IEAy
MGZiODgwMDAwIChmbGF0LCBlc3ogOCwgcHN6IDY0Sywgc2hyIDApDQo+Pj4+IA0KPj4+PiBbICAg
IDAuMDAwMDAwXSBJVFM6IHVzaW5nIGNhY2hlIGZsdXNoaW5nIGZvciBjbWQgcXVldWUNCj4+Pj4g
DQo+Pj4+IFsgICAgMC4wMDAwMDBdIEdJQzogdXNpbmcgTFBJIHByb3BlcnR5IHRhYmxlIEAweDAw
MDAwMDIwZmI4MzAwMDANCj4+Pj4gDQo+Pj4+IFsgICAgMC4wMDAwMDBdIEdJQ3YzOiBDUFUwOiBm
b3VuZCByZWRpc3RyaWJ1dG9yIDAgcmVnaW9uDQo+Pj4+IDA6MHgwMDAwMDAwMDA2MDQwMDAwDQo+
Pj4+IA0KPj4+PiBbICAgIDAuMDAwMDAwXSBDUFUwOiB1c2luZyBMUEkgcGVuZGluZyB0YWJsZSBA
MHgwMDAwMDAyMGZiODQwMDAwDQo+Pj4+IA0KPj4+PiBbICAgIDAuMDAwMDAwXSBHSUM6IHVzaW5n
IGNhY2hlIGZsdXNoaW5nIGZvciBMUEkgcHJvcGVydHkgdGFibGUNCj4+Pj4gDQo+Pj4+IA0KPj4+
PiANCj4+Pj4gSG93ZXZlciwgd2hlbiBib290aW5nIHdpdGggWEVOLCBvbmx5IHRoZSBmb2xsb3dp
bmcgdGhyZWUgbGluZXMgYXJlDQo+Pj4gY29udGFpbmVkIGluIHRoZSBrZXJuZWwgbG9nOg0KPj4+
PiANCj4+Pj4gDQo+Pj4+IA0KPj4+PiBbICAgIDAuMDAwMDAwXSBHSUN2MzogRGlzdHJpYnV0b3Ig
aGFzIG5vIFJhbmdlIFNlbGVjdG9yIHN1cHBvcnQNCj4+Pj4gDQo+Pj4+IFsgICAgMC4wMDAwMDBd
IEdJQ3YzOiBubyBWTFBJIHN1cHBvcnQsIG5vIGRpcmVjdCBMUEkgc3VwcG9ydA0KPj4+PiANCj4+
Pj4gWyAgICAwLjAwMDAwMF0gR0lDdjM6IENQVTA6IGZvdW5kIHJlZGlzdHJpYnV0b3IgMCByZWdp
b24NCj4+Pj4gMDoweDAwMDAwMDAwMDYwNDAwMDANCj4+PiANCj4+PiAibm8gVkxQSSBzdXBwb3J0
IiBpcyB2ZXJ5IHN1c3BpY2lvdXMsIGl0IGxvb2tzIGxpa2UgRG9tMCBkb2Vzbid0IGZpbmQgYW55
IElUUw0KPj4+IHN1cHBvcnQuDQo+Pj4gDQo+Pj4gQ2FuIHlvdSBkb3VibGUgY2hlY2sgdGhhdCB5
b3UgaGF2ZSB0aGUgSVRTIGRyaXZlciBpbiBYZW4gYnVpbHQtaW4/IFRoYXQgd291bGQNCj4+PiBi
ZSBDT05GSUdfSEFTX0lUUy4gSWYgeW91IGRvICJtYWtlIG1lbnVjb25maWciIGFuZCBlbmFibGUg
IkNvbmZpZ3VyZQ0KPj4+IHN0YW5kYXJkIFhlbiBmZWF0dXJlcyAoZXhwZXJ0IHVzZXJzKSIgeW91
IHNob3VsZCBnZXQgYSBuZXcgb3B0aW9uICJHSUN2Mw0KPj4+IElUUyBNU0kgY29udHJvbGxlciBz
dXBwb3J0IiB1bmRlciAiQXJjaGl0ZWN0dXJlIEZlYXR1cmVzIi4NCj4+PiBNYWtlIHN1cmUgdG8g
ZW5hYmxlIGl0Lg0KPj4+IA0KPj4+IExldCBtZSBrbm93IGlmIHRoYXQgd29ya3MhDQo+IDxkZXZp
Y2V0cmVlLmR0cz4NCg0KUmVnYXJkcywNClJhaHVsDQoNCg==

