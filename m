Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9352A0844
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 15:47:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15926.39179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYVgk-0002mF-Sp; Fri, 30 Oct 2020 14:47:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15926.39179; Fri, 30 Oct 2020 14:47:34 +0000
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
	id 1kYVgk-0002lm-OY; Fri, 30 Oct 2020 14:47:34 +0000
Received: by outflank-mailman (input) for mailman id 15926;
 Fri, 30 Oct 2020 14:47:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g2dz=EF=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kYVgj-0002lW-Aj
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 14:47:33 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.84]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d9bc1255-dac4-4970-98e0-124dc979b4b1;
 Fri, 30 Oct 2020 14:47:30 +0000 (UTC)
Received: from AM6PR05CA0031.eurprd05.prod.outlook.com (2603:10a6:20b:2e::44)
 by AM0PR08MB4467.eurprd08.prod.outlook.com (2603:10a6:208:138::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.22; Fri, 30 Oct
 2020 14:47:28 +0000
Received: from VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::79) by AM6PR05CA0031.outlook.office365.com
 (2603:10a6:20b:2e::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend
 Transport; Fri, 30 Oct 2020 14:47:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT033.mail.protection.outlook.com (10.152.18.147) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Fri, 30 Oct 2020 14:47:27 +0000
Received: ("Tessian outbound a64c3afb6fc9:v64");
 Fri, 30 Oct 2020 14:47:27 +0000
Received: from ddbd8eb41c98.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5850C7D8-B858-40E0-91DD-35641FB6C47B.1; 
 Fri, 30 Oct 2020 14:47:22 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ddbd8eb41c98.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 30 Oct 2020 14:47:22 +0000
Received: from AM6PR08MB3496.eurprd08.prod.outlook.com (2603:10a6:20b:4e::31)
 by AM6PR08MB3797.eurprd08.prod.outlook.com (2603:10a6:20b:88::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 30 Oct
 2020 14:47:21 +0000
Received: from AM6PR08MB3496.eurprd08.prod.outlook.com
 ([fe80::dc5:9a53:a6b1:6a5a]) by AM6PR08MB3496.eurprd08.prod.outlook.com
 ([fe80::dc5:9a53:a6b1:6a5a%4]) with mapi id 15.20.3499.027; Fri, 30 Oct 2020
 14:47:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=g2dz=EF=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kYVgj-0002lW-Aj
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 14:47:33 +0000
X-Inumbo-ID: d9bc1255-dac4-4970-98e0-124dc979b4b1
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown [40.107.22.84])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d9bc1255-dac4-4970-98e0-124dc979b4b1;
	Fri, 30 Oct 2020 14:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9mY1Zav2n5R2cchI3Vx35ehTUmsYD9/sV52agvUnWM=;
 b=nSj3uQJnhlKZuCjnaqqZl12eiaVhaTBjs1SYcDRq/8fgJaIPdE2qv5SoXBnWPj+p3RevvQQ9qo5krvftByf35IxOAGPQqAbJ06CJw0Dy5clhWCFa+wjk7E2lQMqcsUspl9RvBVZPrp+VdOkdexLs6vyBwS1VlKrAFgarjHKLK6k=
Received: from AM6PR05CA0031.eurprd05.prod.outlook.com (2603:10a6:20b:2e::44)
 by AM0PR08MB4467.eurprd08.prod.outlook.com (2603:10a6:208:138::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.22; Fri, 30 Oct
 2020 14:47:28 +0000
Received: from VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::79) by AM6PR05CA0031.outlook.office365.com
 (2603:10a6:20b:2e::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend
 Transport; Fri, 30 Oct 2020 14:47:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT033.mail.protection.outlook.com (10.152.18.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Fri, 30 Oct 2020 14:47:27 +0000
Received: ("Tessian outbound a64c3afb6fc9:v64"); Fri, 30 Oct 2020 14:47:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 22ea3b50ea3e25fe
X-CR-MTA-TID: 64aa7808
Received: from ddbd8eb41c98.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5850C7D8-B858-40E0-91DD-35641FB6C47B.1;
	Fri, 30 Oct 2020 14:47:22 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ddbd8eb41c98.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 30 Oct 2020 14:47:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RErhpO5DJN+jrYiho6VSpqb+6FlbgknKzaVp7DVIsqpkqtcmYRDnXJC1fGdd9Lrv+50AXlK91HjBYH8/WBEWV/mDb+C1LcSBpn5qhHaXa3sDLLoSvCRnZFqRmY72zFL2e/ShbxyIdGE+yXWF6kd5lOA9HoIcunjX2u55ELNYzDk4r9BsjyI8HGpyGWY8T+3WcIIbpI+7Iy5y46dSy8ngOMFbUwLTPgqCtqsgV9Yi3XgscPncMSxhyz/8lZQdXhVyciPGgfNiIeTfx/K3CZR5cHGiBFFDmKlcyP/vtVDGIodYael+Kj/ghZylzvnlBN9wdoT/npwxY6IQrllV5FcwQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9mY1Zav2n5R2cchI3Vx35ehTUmsYD9/sV52agvUnWM=;
 b=oHNJFpCd5K1yPsp4FyRPDRXRMPppmxsH3ljNLjKIMp72TUGRWSH+FY14kRfDhxvM0fYCYA4+mbbBNaX+7VIuBskT7eY32nLLMOzZe+6q8MWqT3IHf2PtoMQhEs1IYf8tqslQTF7lD0oLBM/+txgFJ32ezi98ahXAKx7RCO+ll9PEnnIeyszxBvaXzAbOb8Xogl+BU4Djvt92l0sAomWiz5p5lyf5nRVj07dwFFYnuFXiweAXsIx0iI3ynjvZ2PaqVl5G1ZMYw8l2+VrkzpgEKmo+9K3AwHIIvzLPPJsJwckDB74/V57J+QvgXli6i9y6dRDMPGC6tRKt0b87YKUFFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9mY1Zav2n5R2cchI3Vx35ehTUmsYD9/sV52agvUnWM=;
 b=nSj3uQJnhlKZuCjnaqqZl12eiaVhaTBjs1SYcDRq/8fgJaIPdE2qv5SoXBnWPj+p3RevvQQ9qo5krvftByf35IxOAGPQqAbJ06CJw0Dy5clhWCFa+wjk7E2lQMqcsUspl9RvBVZPrp+VdOkdexLs6vyBwS1VlKrAFgarjHKLK6k=
Received: from AM6PR08MB3496.eurprd08.prod.outlook.com (2603:10a6:20b:4e::31)
 by AM6PR08MB3797.eurprd08.prod.outlook.com (2603:10a6:20b:88::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 30 Oct
 2020 14:47:21 +0000
Received: from AM6PR08MB3496.eurprd08.prod.outlook.com
 ([fe80::dc5:9a53:a6b1:6a5a]) by AM6PR08MB3496.eurprd08.prod.outlook.com
 ([fe80::dc5:9a53:a6b1:6a5a%4]) with mapi id 15.20.3499.027; Fri, 30 Oct 2020
 14:47:20 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Topic: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Index: AQHWoVvrkmJwOYERdUOadvid1OghFamwEIWAgABD5gA=
Date: Fri, 30 Oct 2020 14:47:20 +0000
Message-ID: <2AB3A125-D530-4627-A877-EC2BCDCD63DC@arm.com>
References:
 <b085e894773842ac320b818aa6f84289d0a128ed.1602591365.git.rahul.singh@arm.com>
 <09cfc160-3490-0aeb-f872-04fb4ce04364@epam.com>
In-Reply-To: <09cfc160-3490-0aeb-f872-04fb4ce04364@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.38.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e063c534-46d2-4a5e-a7d7-08d87ce2b8f0
x-ms-traffictypediagnostic: AM6PR08MB3797:|AM0PR08MB4467:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB44678934164A84672E557AE9FC150@AM0PR08MB4467.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xJTPK382FQOaGmowDY1eAMSnl+bYG/jz7q1Kk/LauA52g1HCQr0v8cjPLR6pkb/gBkTQ9+F+VfCFVKbP32dBtZRNZJeSbhgCAbii4BFozoOksQwhRufpfHDyrTUTClR0Ntfa+SHYagbiLQ97Snbfq/ZJdSk+Oe9YO1OdAb79z8ho72J2g/MYnwuk9IQeCTBnSyBJU9h/Cax+umcm9GqE8+AfgD12wocCu9OKRXzLbF61nJgnmcsH3u29D0DZpv87DFu2PJUBDh1jgl31R4j+wkwAHM9171OqE3IyMKPZPveYqxqg5CG2dqeq5ety/ujwqkWPg1sjTEPo62+bG/e1FZlnRRY8Fc24oM9rq+y8oGRiJGBvhhZz4w3dxBfUUADOuVSbRYmPQSE5UZY5aL6MrQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3496.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(136003)(366004)(376002)(83380400001)(33656002)(86362001)(55236004)(478600001)(91956017)(53546011)(4326008)(6512007)(8676002)(6506007)(76116006)(8936002)(66446008)(2906002)(66946007)(36756003)(5660300002)(64756008)(66556008)(66476007)(26005)(6486002)(2616005)(6916009)(316002)(966005)(71200400001)(54906003)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 5vgF3TN4+zvBpUi/9zh1CVraF2TPUv/EIREdzuGsRC7AlYNtRzDTYmSgfWGmK5s3rN2RkjvBtHvb81DJnUswR84wpx27IafTaQp43zd2o2lHCG5kZ6MY1CaPRvKG20a1rmajEt73XX1dkUeK0JMA/2h7MDjSf9vIG29hrDNLWq4yXNNqJaf5ZWfq/FdCLeNjdkifdeYImEB6IifANrQRzgMbXWU357wNTyj9ghD4Vfdgw72euPsaBtKM+1qW/nQg7554qLAZuTRBzHckHSWPEKwnOvfqnn1TuY1fGfEvmaKkTU7Tzv8Vl/9CudvSQT9IucfWvBmYH1nwOFRQx2kAUOUF8wqxVKjz/xEkmxhcQ3lpsWos6GtFKKv5nJpps/z1QA3ii08vqKHZfDDXLaXoE2KFs9pPuui7Pg1T06jIQJkupdaq4hBK6M+c6c3g6hR+xc+upiAKWAsbbMfEflll1anEnkiw1fO3YBZyWYu1eTHBBNA3HEOM/jBcwQkOAT/9MwGvP7aQbeC3ySVKBAzZ/YK8StXwbQcv15+jES/ToVncSYsPkzDgRicevgSttIKe+WSoDdVMHRCppIcWA6D6rW297uiO1BvcMoDSYuJ4NZiX242DCP6DdoZ9uTXEemue54SoSBBXIVijSu407L9Aow==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4DFEDFCFC1C5084683CD17C33353DC3E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3797
Original-Authentication-Results: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0ad570fa-030b-459c-a29c-08d87ce2b4bc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CldEWsYM/rGMSbrZIH21ja1z+R94JaLZ4zK0AX1v1r6xEYoF8Bpstupj/Q3rBT+O3cahMjBngAS0h6lRkAwCcZh01gW2Hef+eaJQpDdlb+/EZ9t0PNaxBF4hGF1TJadsWyerveQuIvsIxov0jVXaSB7NaBHo4b7gyuyUbfDMA0r7BZoUrlLuPJMi08ZDDlWa5Aw0fkcT33Eag0xfhhSWr89zedamsN8Z30vEkpUxUkpYd7SYs7M6xvNsZ2161y81pNKBPTR2o7ZzPdKV8OdyGqgFTVmKMQ0j/YYw7JfWdt2mTgoAday728JnMxS6gN6Tu11g+25uIRwAu63vkAxxoJhzy+EH7OwhfSrPwzrbwaXy50+cXrU/UpX96Tce4hfAkpyq8hbZhW/UW5GTW3LDFG/5c4mPspImhTUnNJKP3xe0Q+iRFhDjVGr8edanbJ/x/nkhpeK7fGBalRXMKL8T8SRsOpSPX2piiSLnHNgkcuE=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(396003)(39850400004)(46966005)(6486002)(53546011)(107886003)(5660300002)(55236004)(47076004)(356005)(6862004)(81166007)(6512007)(82740400003)(4326008)(36906005)(478600001)(336012)(186003)(54906003)(6506007)(966005)(33656002)(316002)(36756003)(8676002)(86362001)(2616005)(83380400001)(70206006)(8936002)(82310400003)(70586007)(2906002)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2020 14:47:27.8498
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e063c534-46d2-4a5e-a7d7-08d87ce2b8f0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4467

Hello Oleksandr,

> On 30 Oct 2020, at 10:44 am, Oleksandr Andrushchenko <Oleksandr_Andrushch=
enko@epam.com> wrote:
>=20
> Hi, Rahul!
>=20
> On 10/20/20 6:25 PM, Rahul Singh wrote:
>> Add support for ARM architected SMMUv3 implementations. It is based on
>> the Linux SMMUv3 driver.
>>=20
>> Major differences between the Linux driver are as follows:
>> 1. Only Stage-2 translation is supported as compared to the Linux driver
>>    that supports both Stage-1 and Stage-2 translations.
>=20
> First of all thank you for the efforts!
>=20
> I tried the patch with QEMU and would like to know if my understanding co=
rrect
>=20
> that this combination will not work as of now:
>=20
> (XEN) SMMUv3: /smmuv3@9050000: SMMUv3: DT value =3D eventq

I have limited knowledge about QEMU internals.As what I see from the logs, =
fault is occurred at early driver initialisation when SMMU driver is trying=
 to probe the HW.

> (XEN) Data Abort Trap. Syndrome=3D0x1940010
> (XEN) Walking Hypervisor VA 0x40031000 on CPU0 via TTBR 0x00000000b846900=
0
> (XEN) 0TH[0x0] =3D 0x00000000b8468f7f
>=20
> [snip]
>=20
> If this is expected then is there any plan to make QEMU work as well?
>=20
> I see [1] says that "Only stage 1 and AArch64 PTW are supported." on QEMU=
 side.

Yes as of now only Stage-2 is supported in XEN.If we have any requirement o=
r use case that depends on Stage-1 translation we can support that also in =
XEN.

>=20
>=20
> We are interested in QEMU/SMMUv3 as a flexible platform for PCI passthrou=
gh
>=20
> implementation, so it could allow testing different setups and configurat=
ions with QEMU.
>=20
>=20
> Thank you in advance,
>=20
> Oleksandr
>=20
> [1] https://patchwork.ozlabs.org/project/qemu-devel/cover/1524665762-3135=
5-1-git-send-email-eric.auger@redhat.com/

Regards,
Rahul


