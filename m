Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 929CD2B7F55
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 15:28:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29874.59571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfORJ-0003q8-Us; Wed, 18 Nov 2020 14:28:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29874.59571; Wed, 18 Nov 2020 14:28:05 +0000
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
	id 1kfORJ-0003pj-Rc; Wed, 18 Nov 2020 14:28:05 +0000
Received: by outflank-mailman (input) for mailman id 29874;
 Wed, 18 Nov 2020 14:28:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1xcH=EY=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kfORH-0003pe-NS
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 14:28:03 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.54]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57ea5a96-17db-4626-b543-f65c6f3f2e92;
 Wed, 18 Nov 2020 14:28:02 +0000 (UTC)
Received: from DU2PR04CA0045.eurprd04.prod.outlook.com (2603:10a6:10:234::20)
 by DBBPR08MB4329.eurprd08.prod.outlook.com (2603:10a6:10:c7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Wed, 18 Nov
 2020 14:28:00 +0000
Received: from DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:234:cafe::80) by DU2PR04CA0045.outlook.office365.com
 (2603:10a6:10:234::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Wed, 18 Nov 2020 14:28:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT007.mail.protection.outlook.com (10.152.20.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 14:28:00 +0000
Received: ("Tessian outbound 814be617737e:v71");
 Wed, 18 Nov 2020 14:28:00 +0000
Received: from 4600c2a73ea4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 32DA263E-D50B-4B28-90E6-495DD5DA4FFA.1; 
 Wed, 18 Nov 2020 14:27:54 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4600c2a73ea4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 18 Nov 2020 14:27:54 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0801MB1799.eurprd08.prod.outlook.com (2603:10a6:4:3a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Wed, 18 Nov
 2020 14:27:52 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737%7]) with mapi id 15.20.3564.028; Wed, 18 Nov 2020
 14:27:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1xcH=EY=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kfORH-0003pe-NS
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 14:28:03 +0000
X-Inumbo-ID: 57ea5a96-17db-4626-b543-f65c6f3f2e92
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown [40.107.15.54])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 57ea5a96-17db-4626-b543-f65c6f3f2e92;
	Wed, 18 Nov 2020 14:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eoa5f+8TE4fAfZ8cqc7+v3IXwmgM2gUOr40kRT67MSE=;
 b=m1H8HP7zGWueOD1xsQoIkXMisirvClLeRTUWB4KbmGkAViRkdSKuD4Odr6cZF2DcMszq4D8RI1u439jHrItkbkXNUaUoIzMO4C1+ez6c4SGb89+oVEUVMsOVAtCM7gkMi0ZiMNGdUFndAm0SWOzNq05JxTzW4MvJbpC6dEAA7IQ=
Received: from DU2PR04CA0045.eurprd04.prod.outlook.com (2603:10a6:10:234::20)
 by DBBPR08MB4329.eurprd08.prod.outlook.com (2603:10a6:10:c7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Wed, 18 Nov
 2020 14:28:00 +0000
Received: from DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:234:cafe::80) by DU2PR04CA0045.outlook.office365.com
 (2603:10a6:10:234::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Wed, 18 Nov 2020 14:28:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT007.mail.protection.outlook.com (10.152.20.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 14:28:00 +0000
Received: ("Tessian outbound 814be617737e:v71"); Wed, 18 Nov 2020 14:28:00 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: fb476fa74cef82f5
X-CR-MTA-TID: 64aa7808
Received: from 4600c2a73ea4.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 32DA263E-D50B-4B28-90E6-495DD5DA4FFA.1;
	Wed, 18 Nov 2020 14:27:54 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4600c2a73ea4.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 18 Nov 2020 14:27:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IhrNqNa9ts72/BfQrcfGfXk52PiRk88ojUk7FBNlO4iZn1XChWRW2CkqE5CNWbGuWRg650ZhybDOhbPs7QO+a4JPYHqBFFrYYYFmORTfcBkNKb2TvBE1jgZgRhw6r4hz/fpIroYr/w1BQ+a+R2H16EGtAzzU5UlkeUGrwoAXpQLeuHSpH1MWOnTkcwJ7+7aSRZoP+VrbuGIKo6lyCyCu+mDD7HuGs5ELiYy2D2FBNWkyyQvwILis85HqlfGRtdM3dDm5p8kDAcUMcaWZDlpthrJ53iO6GC/AoCqY3UwNnjF9PwBTduTqvHdCg2bTzbc59dxtH77J7CvxB+4vjvqK6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eoa5f+8TE4fAfZ8cqc7+v3IXwmgM2gUOr40kRT67MSE=;
 b=AXs4vLL8kkeYzjzqOESvbJvFhBrfBCegZyllwQoM2eJFSpfAi49Z2Q9yNWTfh0OYccUiX+099NNPZXgA3c2R0CjQeTJspT+G3gAZOF242YHl4TJaKJQiOMEZwLS3crAR6xsU53lvjU7VKTJQkkjscdRNaHDlbl7GIKr3EZ8EOqTsFgRMsYdZTTEVCTTzK+eLDj/LeB7W8QjMt0kFURuULND8W1msw2QUgqkxTDVKg5Wpsxzz+OgS2bZljaMoC5VNmnhzdVhZsdWa4kJcjS6f2jq9ppqkgW/EO+CBy+2pN15+XsQROtBFedHSIfkYp7XV8CHVOCHMcsqDbBZiBG8DAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eoa5f+8TE4fAfZ8cqc7+v3IXwmgM2gUOr40kRT67MSE=;
 b=m1H8HP7zGWueOD1xsQoIkXMisirvClLeRTUWB4KbmGkAViRkdSKuD4Odr6cZF2DcMszq4D8RI1u439jHrItkbkXNUaUoIzMO4C1+ez6c4SGb89+oVEUVMsOVAtCM7gkMi0ZiMNGdUFndAm0SWOzNq05JxTzW4MvJbpC6dEAA7IQ=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0801MB1799.eurprd08.prod.outlook.com (2603:10a6:4:3a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Wed, 18 Nov
 2020 14:27:52 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737%7]) with mapi id 15.20.3564.028; Wed, 18 Nov 2020
 14:27:52 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Olaf Hering
	<olaf@aepfle.de>
Subject: Re: [PATCH] libxenstat: avoid build race
Thread-Topic: [PATCH] libxenstat: avoid build race
Thread-Index: AQHWvMYUgIctYS6LB0S1NxEfdujSB6nN9HIA
Date: Wed, 18 Nov 2020 14:27:52 +0000
Message-ID: <6CDFEFFF-368E-467B-970A-4CDFA7978A2E@arm.com>
References: <273da46e-2a56-f53c-f137-f6fc411ad8db@suse.com>
In-Reply-To: <273da46e-2a56-f53c-f137-f6fc411ad8db@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d901c296-130a-40c6-933d-08d88bce26a3
x-ms-traffictypediagnostic: DB6PR0801MB1799:|DBBPR08MB4329:
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB4329F1F2ADE909571DD321F09DE10@DBBPR08MB4329.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HFrAisWBunTjVRXXalobRtABIMFhKoGhvRDxpiNRDl37uSgNlWyEP8CjVt6bB8r16lqO2xtwePeOHSflPhcqIJ6wXRVL7KRrZchskzCx3jVNZtc5DGM0UhK4xCfIXjAMvA8+NnTWadZu2rnsbM/AkPPUgIF6intFvwhZu+z4WYHOCJvBaaKKx1k1zPFTQ7L9B5bcVL0FthOAwY5jU6+AT+sUAV04UfWtxgtJSHAaduRL2DmPrixlVk4fqrWNO0d4TJUmYjGk6AshIGofKrZwXUxn4RHuOOsqf1VxRVplslyeOzOU3Lx0yHrjNXTfmqXAaAEpSO6U3jLsHxB58HY0zg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(366004)(6506007)(316002)(8936002)(33656002)(4744005)(8676002)(2906002)(6486002)(54906003)(86362001)(6512007)(2616005)(36756003)(76116006)(53546011)(26005)(478600001)(5660300002)(66946007)(4326008)(66446008)(64756008)(91956017)(6916009)(66476007)(71200400001)(186003)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 ZPWQfIcNl8jj/SSNd1ENiM9MiELq3UNnWPQLOLmi95ZHVUf59FdIiJUPZcmDAAfLvWxCv4Of5D1BgCp5C/TJTNBi52hhWtJkJTWjypq9VhWeMDwPFufl+k9Ml3hLro83xUP5v/bsahEBhZ7FAnbmQ3AkZEJEnEuvl58f7oW2DGvvGBh57RIeOXZCCfUBfCQI3SSPDMEJCuV9TgtnUsne1pEhIobJMJnmPWAkem195H00inNYcJ19X79AVUzMGceGxjJoCni+Ugn53mUMjvIHWVFfgyQm12N4e4TG1LGvtcrFF8CVV2mxdK1ABkJzYUP8sK2YGm5Pdt0XI4RxvTdimnYog82DLN9BKwc1EiaOcsyMTf9g3HFbWWy+ZYZiZiQFPw4YfGpm20JGXcIJlIYXAcizrV6v+NY6m5/6eWa/b2uwkShodmKru1NxR2y0DQ2xPipk/aL9JSJaUg435YT44VaVhXV1VC+VHPgI6hkaBcpUFdna2pkCDedmpnRpfA+nRjCIU2JoNVtfiuBMT7eCePQA4DNrwleQ+Kt8FpDhG7zu2T+pm3tlOdsSQW31WAnlmeEqm2U7PaqN+k604RlUldLtQEATykw9qLXAJS+KtEjP49FO0iVBbhU3BfU4IBtg9OoooxjmWpBItYh3rM1vMw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <5CC88706503C754D9E93CE4F76963B4D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1799
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c0c6f7c6-d3ec-444c-ccd7-08d88bce2240
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0OMAbQpu6tUja8ja0xHgxPPArDCYRJVyy55PXDMqqyjVvWsbPQryADiQ7YD44+623pE3WxE+OCAl78sFukCpxDlHNfZTidAcwHZ0k1/LuSu/FBMsWZY96DmQKFCuIJPRunAJtnfFO0t4I2m8+mrZnRscAj4vtNV1NqNog4hdeyxJ8QWy29QSLJ6uztaWKORGwv6hDrgnhcxgV3AKdz3Rbzk+k6bplafG7evkf38y3BzzLVECbKrlKsv7wYNohLs+/sSc2w0X76x8iZNZnLhxeD81X6oAliq7VLnadDu2UX+JeT6bGy5qwkZsGdxeQFxD3gO2v4LSwmlYuCrx3HLWQh96odmqiqb6RXZ17GgUG1l+cjpLDiFsKJoba2rjrM5izyu0j7S/h1kRFiWHqq2a3Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(39860400002)(376002)(46966005)(47076004)(186003)(316002)(2906002)(54906003)(478600001)(82740400003)(6512007)(86362001)(70586007)(336012)(70206006)(356005)(81166007)(107886003)(2616005)(33656002)(6486002)(6862004)(5660300002)(8936002)(6506007)(4326008)(36756003)(8676002)(82310400003)(26005)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 14:28:00.0643
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d901c296-130a-40c6-933d-08d88bce26a3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4329

SGksDQoNCj4gT24gMTcgTm92IDIwMjAsIGF0IDA5OjQyLCBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT2xhZiByZXBvcnRlZCBvYnNlcnZpbmcNCj4gDQo+IHhl
bnN0YXRfcW1wLmM6MjY6MTA6IGZhdGFsIGVycm9yOiBfcGF0aHMuaDogTm8gc3VjaCBmaWxlIG9y
IGRpcmVjdG9yeQ0KPiAuLi4vdG9vbHMvbGlicy9zdGF0Ly4uLy4uLy4uL3Rvb2xzL1J1bGVzLm1r
OjE1MzogeGVuc3RhdF9xbXAub3BpY10gRXJyb3IgMQ0KPiANCj4gT2J2aW91c2x5IF9wYXRocy5o
LCB3aGVuIGluY2x1ZGVkIGJ5IGFueSBvZiB0aGUgc291cmNlcywgbmVlZHMgdG8gYmUNCj4gY3Jl
YXRlZCBpbiBhZHZhbmNlIG9mIGNvbXBpbGluZyBhbnkgb2YgdGhlbSwgbm90IGp1c3QgdGhlIG5v
bi1QSUMgb25lcy4NCj4gDQo+IFJlcG9ydGVkLWJ5OiBPbGFmIEhlcmluZyA8b2xhZkBhZXBmbGUu
ZGU+DQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NClJl
dmlld2VkLWJ5OiBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+DQoN
CkNoZWVycw0KQmVydHJhbmQNCg0KPiAtLS0NCj4gQSBzaW1pbGFyIGlzc3VlIChhdCB0aGUgdGlt
ZSBvZiB0aGUgcmVwb3J0KSBpbiB0aGUgYnVpbGRpbmcgb2YNCj4gbGlieGVuc3RvcmUgd2FzIGFk
ZHJlc3NlZCBieSBKw7xyZ2VuJ3MgOWFmNWUyYjMxYjRlICgidG9vbHMvbGlicy9zdG9yZToNCj4g
ZG9uJ3QgdXNlIHN5bWJvbGljIGxpbmtzIGZvciBleHRlcm5hbCBmaWxlcyIpLg0KPiANCj4gLS0t
IGEvdG9vbHMvbGlicy9zdGF0L01ha2VmaWxlDQo+ICsrKyBiL3Rvb2xzL2xpYnMvc3RhdC9NYWtl
ZmlsZQ0KPiBAQCAtMzAsNyArMzAsNyBAQCBpbmNsdWRlICQoWEVOX1JPT1QpL3Rvb2xzL2xpYnMv
bGlicy5taw0KPiANCj4gaW5jbHVkZSAkKFhFTl9ST09UKS90b29scy9saWJzL2xpYnMubWsNCj4g
DQo+IC0kKExJQl9PQkpTKTogX3BhdGhzLmgNCj4gKyQoTElCX09CSlMpICQoUElDX09CSlMpOiBf
cGF0aHMuaA0KPiANCj4gUFlMSUI9YmluZGluZ3Mvc3dpZy9weXRob24vX3hlbnN0YXQuc28NCj4g
UFlNT0Q9YmluZGluZ3Mvc3dpZy9weXRob24veGVuc3RhdC5weQ0KPiANCg0K

