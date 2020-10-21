Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 926FB294AB9
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 11:45:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9906.26178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVAg7-0000l1-85; Wed, 21 Oct 2020 09:45:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9906.26178; Wed, 21 Oct 2020 09:45:07 +0000
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
	id 1kVAg7-0000kc-4w; Wed, 21 Oct 2020 09:45:07 +0000
Received: by outflank-mailman (input) for mailman id 9906;
 Wed, 21 Oct 2020 09:45:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xrJA=D4=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kVAg5-0000kX-Hr
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 09:45:05 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.84]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 193dcfd1-875a-4b44-bf67-037341ba42fe;
 Wed, 21 Oct 2020 09:45:03 +0000 (UTC)
Received: from DB6PR1001CA0041.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::27)
 by HE1PR0802MB2489.eurprd08.prod.outlook.com (2603:10a6:3:d8::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Wed, 21 Oct
 2020 09:45:00 +0000
Received: from DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::e1) by DB6PR1001CA0041.outlook.office365.com
 (2603:10a6:4:55::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Wed, 21 Oct 2020 09:45:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT023.mail.protection.outlook.com (10.152.20.68) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Wed, 21 Oct 2020 09:45:00 +0000
Received: ("Tessian outbound ba2270a55485:v64");
 Wed, 21 Oct 2020 09:45:00 +0000
Received: from a933d3d9eb81.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2E47A783-C000-4BD8-A6A3-05D9ECF98971.1; 
 Wed, 21 Oct 2020 09:44:54 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a933d3d9eb81.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 21 Oct 2020 09:44:54 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0802MB2566.eurprd08.prod.outlook.com (2603:10a6:4:a2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 21 Oct
 2020 09:44:52 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.028; Wed, 21 Oct 2020
 09:44:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xrJA=D4=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kVAg5-0000kX-Hr
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 09:45:05 +0000
X-Inumbo-ID: 193dcfd1-875a-4b44-bf67-037341ba42fe
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown [40.107.20.84])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 193dcfd1-875a-4b44-bf67-037341ba42fe;
	Wed, 21 Oct 2020 09:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQRXNdeNhZJ+HP9AUpIowYt4o9AC864aJmcwQyxp1Aw=;
 b=3Bdbrrf+1nI3MuUGHgc7nnTtQCMH4yZrRQdeXZo1B7DYTk1zcdJovDdaLC+1s7CMoWaeg2Ivf9kvTMeoveDKi6OSs0yoXwNw7yoP0n2C3eeNpGCxpY1E2CWZKEIjNNsjD9bbwZSaYuo0VB6G5KqWQNMarG4bDGBQohq/wN8sulo=
Received: from DB6PR1001CA0041.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::27)
 by HE1PR0802MB2489.eurprd08.prod.outlook.com (2603:10a6:3:d8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Wed, 21 Oct
 2020 09:45:00 +0000
Received: from DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::e1) by DB6PR1001CA0041.outlook.office365.com
 (2603:10a6:4:55::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Wed, 21 Oct 2020 09:45:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT023.mail.protection.outlook.com (10.152.20.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Wed, 21 Oct 2020 09:45:00 +0000
Received: ("Tessian outbound ba2270a55485:v64"); Wed, 21 Oct 2020 09:45:00 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3f1322966e593602
X-CR-MTA-TID: 64aa7808
Received: from a933d3d9eb81.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2E47A783-C000-4BD8-A6A3-05D9ECF98971.1;
	Wed, 21 Oct 2020 09:44:54 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a933d3d9eb81.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 21 Oct 2020 09:44:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=baCO6QASQsu16i3fTmemANkcqOYKsLU1sfzm51GGTjz90H2LQePtdPKVMy0OZlk0oLsfYCFH/GnHyTRKzWuFYASkMwHdGupQXLMrTOw77JNe0BVuRetWZQ/Ic453WglOu3WZZl8WTXiHsmuGJctyUe8C6jLS3KPqcnLGGsPdqToCYhg1YS5D7FqVwU+K2OGX5zy9jKfypqHrxFIj03jdaniNf2N6lqloY8HHvkMWLiJacwF4esxjY1NFZCDn6uxKaFEMK+xqgkidlLtZnHdhpXqKlDvQ+T4bfrYtPGNM+z6UdLujhUZoGjxOxksKqqDo5QWrNjVzVt2B6CUHTnI8hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQRXNdeNhZJ+HP9AUpIowYt4o9AC864aJmcwQyxp1Aw=;
 b=QkCnZpJBIWhQJR59fJQbAHIEGSZx2RFO4uVFgQwoxFz/Rm1s3GDZhroSxoblgQz41x5YodxFTtaudiKNB0ntaZnKboueZrFZbeuAUE9cyrWUUfdm8ue1Yj3r3Zwqb1culP4aFb6LCTed3lIlNACuKJKHhoE7s/PD+4W8bcDB2gUQFY0mywFTijItYaXHbOpnRUl5PPv8o5rTxhRwf/XEflmxS3+Fjywsd2gg1JIY9ggMxzm0vYEkftAoMqFW+REGGfVO+jCB+rmG+B7Y6cZOvo2vo6jGy5eljqkqLdJwbAOfuWvBVggRvvpdRwpsieEKJWLAulkSu0BPqUdFxlyY2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQRXNdeNhZJ+HP9AUpIowYt4o9AC864aJmcwQyxp1Aw=;
 b=3Bdbrrf+1nI3MuUGHgc7nnTtQCMH4yZrRQdeXZo1B7DYTk1zcdJovDdaLC+1s7CMoWaeg2Ivf9kvTMeoveDKi6OSs0yoXwNw7yoP0n2C3eeNpGCxpY1E2CWZKEIjNNsjD9bbwZSaYuo0VB6G5KqWQNMarG4bDGBQohq/wN8sulo=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0802MB2566.eurprd08.prod.outlook.com (2603:10a6:4:a2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 21 Oct
 2020 09:44:52 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.028; Wed, 21 Oct 2020
 09:44:52 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, "open list:X86"
	<xen-devel@lists.xenproject.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Warn user on cpu errata 832075
Thread-Topic: [PATCH] xen/arm: Warn user on cpu errata 832075
Thread-Index:
 AQHWohbM+uoR14U9oEmwJFjy+kmnIqmW9/2AgABK1ACAABYOAIAAQVGAgADYZ4CAAITigIAI1nwAgAALgoA=
Date: Wed, 21 Oct 2020 09:44:52 +0000
Message-ID: <DFD23AC6-9F7A-4591-96B3-29F2A04718FF@arm.com>
References:
 <f11fe960a111530501fd0c20893bec4e32edf3cb.1602671985.git.bertrand.marquis@arm.com>
 <26742825-25fc-0f82-2b20-d536e8380b2a@citrix.com>
 <90BC5355-EB52-469F-B0A6-ACAAB9AD9EF5@arm.com>
 <f49d478f-4efe-955e-c378-f2fa5fbc6a71@xen.org>
 <alpine.DEB.2.21.2010141350170.10386@sstabellini-ThinkPad-T480s>
 <C07DA84A-6527-4480-99CC-F6B26553E3FE@arm.com>
 <alpine.DEB.2.21.2010151104200.10386@sstabellini-ThinkPad-T480s>
 <a418ff3a-0476-203c-d3d8-add3706eea14@xen.org>
In-Reply-To: <a418ff3a-0476-203c-d3d8-add3706eea14@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 418578cf-11c5-4ecd-9b3a-08d875a5fa72
x-ms-traffictypediagnostic: DB6PR0802MB2566:|HE1PR0802MB2489:
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB2489E0DBAD010C95712D187B9D1C0@HE1PR0802MB2489.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 zkAjFfM/YV8+NG9Ur8oiFKjHlBxRlC5gqAQRlCx4jPn0K48BcQROwHMhtmO0CA3NuqPdsT9Hxi/IGOLuhwlNSMc8JSVXgoRuLxSZ5D2FOwNPJTpWHiEetA9gYqY7uXA3KdmUeLjwrNcropZ+KhYUj+eqAS+8pO3YOztAneXrs9ogf7vNUsLxPePOYJDRSfLdf16nqmZuxYYl+XHaf2vXRhFT0wPH8x76ROfHlMWaF395LMcLFqKfL3vperhE6UXMGqEKZgvDCgKMq4T8e06Iq3TPnistdkoeJJBRqdjR+kKczHI9IpLZAjYyPkndittQIy1m5EkNRlpuYq1leQB/uw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(366004)(136003)(376002)(346002)(86362001)(33656002)(5660300002)(186003)(8936002)(6512007)(64756008)(26005)(76116006)(91956017)(66476007)(36756003)(66556008)(6916009)(66946007)(316002)(6486002)(53546011)(6506007)(66446008)(2906002)(8676002)(4326008)(54906003)(478600001)(83380400001)(2616005)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 MltQyhl9tb9m5p0eQgKcrApUYgUxu3f1/OVeNSC8L1Vxz3bXHsvzi6v3p9ZOqu7T3TO/fZlcFNzsP2slCn4uc89mCjpR4vVZbqF53CK9vuwE/kII1Z2ObnIg9tUA3PgUMMMTb0ZkpSjM+6H7DhyXZRuD2Ekm3d7v44tXSfVNnQejFj/XlD5EYWGbHQduEBsewMI2337P24KHw3KAJcWM9lKCFGg54TEVVsmuvCyQTNtOJ5t8elrFhLuNSzKgX2HsprXsAy9JdK/EE7xNyWLTXYxpaD9QA+/pFiDQ7+qyrYliNppZUtH5/4gS9gIfpVPPToqoO16TOlAfQRNaXLeclGnwU8aoFwjvFl16+3LvS8SJaZW5j0vRAEJYnnhnMkgEombnfqEBYtu6ZIQa0TQpG2txNdimw3JjdBnpyNmH9HSN4Jh+PzvI5tK5h4Czb+E3LlEMNPKHH9Anehs6E7AOP+rHfD8Yj0Y1p+Ch9KpXW9fszWtlGe/NxmWT7LbCUvI5XD0Z1pnb1g6RylSQKN+nago/fsoXwOGmuDy/qAnTZoP+yIfPbg3BDRmm2U6UYtpOnQZcluYHPOPVQ9ahEGqBZJx0/xITrFS2WsFa1QTHC/kRxvuvrAJgHx7WVLNgJ75kPFnceUls8He5QR2BLEjmcw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <372C236FB0E258498F6923893038A749@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2566
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	41348e52-dbf7-4366-5146-08d875a5f5a9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Hi22ZvTr/fOy9pp+Pz6tapIZQB4/I+RMozZVOwbiPY58Mm98+H/62QCATeqO/+Ba9BkfboNxY5Ohv+DLm2W9vThiB/imsgK80DBgrzRYn6JvNTZTSyde5KFSW1R4FbOLvXpuc86xZUzdvi9uq63Pr1CUNGz9Hepzn4vh80SxhCvC9fKHyeXZ8iD/YHiJ/kTezgWhnRP67W3EXGt4SISTbl1QwTq95WHS4DQGUky+mzEyX2lLyn30DIVo7BszbmJKoCCEohT1DE9K7cmr2DqmoR+DLMtpAAUNPKxZE/2yvi0kSe9Ht5JU1ny8APRxh/BKYOadCxDOaXx/pTpkqMiyEceVtIcvPV4rVvxXejAOTxzi3BMox1mGatnCws/vD//I3+Hb8yLqC8dcgdpUGfsa7A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(346002)(376002)(46966005)(8676002)(26005)(356005)(6862004)(2616005)(83380400001)(6486002)(186003)(82310400003)(6512007)(107886003)(54906003)(336012)(86362001)(316002)(36756003)(70206006)(478600001)(8936002)(4326008)(70586007)(33656002)(2906002)(53546011)(6506007)(81166007)(47076004)(82740400003)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2020 09:45:00.4723
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 418578cf-11c5-4ecd-9b3a-08d875a5fa72
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2489

SGksDQoNCj4gT24gMjEgT2N0IDIwMjAsIGF0IDEwOjAzLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEhpLA0KPiANCj4gT24gMTUvMTAvMjAyMCAxOTowNSwgU3Rl
ZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4gT24gVGh1LCAxNSBPY3QgMjAyMCwgQmVydHJhbmQg
TWFycXVpcyB3cm90ZToNCj4+Pj4gT24gMTQgT2N0IDIwMjAsIGF0IDIyOjE1LCBTdGVmYW5vIFN0
YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPj4+PiANCj4+Pj4gT24g
V2VkLCAxNCBPY3QgMjAyMCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+Pj4gT24gMTQvMTAvMjAy
MCAxNzowMywgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+Pj4+Pj4gT24gMTQgT2N0IDIwMjAs
IGF0IDEyOjM1LCBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90
ZToNCj4+Pj4+Pj4gDQo+Pj4+Pj4+IE9uIDE0LzEwLzIwMjAgMTE6NDEsIEJlcnRyYW5kIE1hcnF1
aXMgd3JvdGU6DQo+Pj4+Pj4+PiBXaGVuIGEgQ29ydGV4IEE1NyBwcm9jZXNzb3IgaXMgYWZmZWN0
ZWQgYnkgQ1BVIGVycmF0YSA4MzIwNzUsIGEgZ3Vlc3QNCj4+Pj4+Pj4+IG5vdCBpbXBsZW1lbnRp
bmcgdGhlIHdvcmthcm91bmQgZm9yIGl0IGNvdWxkIGRlYWRsb2NrIHRoZSBzeXN0ZW0uDQo+Pj4+
Pj4+PiBBZGQgYSB3YXJuaW5nIGR1cmluZyBib290IGluZm9ybWluZyB0aGUgdXNlciB0aGF0IG9u
bHkgdHJ1c3RlZCBndWVzdHMNCj4+Pj4+Pj4+IHNob3VsZCBiZSBleGVjdXRlZCBvbiB0aGUgc3lz
dGVtLg0KPj4+Pj4+Pj4gQW4gZXF1aXZhbGVudCB3YXJuaW5nIGlzIGFscmVhZHkgZ2l2ZW4gdG8g
dGhlIHVzZXIgYnkgS1ZNIG9uIGNvcmVzDQo+Pj4+Pj4+PiBhZmZlY3RlZCBieSB0aGlzIGVycmF0
YS4NCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQmVydHJhbmQgTWFycXVpcyA8
YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPg0KPj4+Pj4+Pj4gLS0tDQo+Pj4+Pj4+PiB4ZW4vYXJj
aC9hcm0vY3B1ZXJyYXRhLmMgfCAyMSArKysrKysrKysrKysrKysrKysrKysNCj4+Pj4+Pj4+IDEg
ZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspDQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+IGRpZmYg
LS1naXQgYS94ZW4vYXJjaC9hcm0vY3B1ZXJyYXRhLmMgYi94ZW4vYXJjaC9hcm0vY3B1ZXJyYXRh
LmMNCj4+Pj4+Pj4+IGluZGV4IDZjMDkwMTc1MTUuLjhmOWFiNmRkZTEgMTAwNjQ0DQo+Pj4+Pj4+
PiAtLS0gYS94ZW4vYXJjaC9hcm0vY3B1ZXJyYXRhLmMNCj4+Pj4+Pj4+ICsrKyBiL3hlbi9hcmNo
L2FybS9jcHVlcnJhdGEuYw0KPj4+Pj4+Pj4gQEAgLTI0MCw2ICsyNDAsMjYgQEAgc3RhdGljIGlu
dCBlbmFibGVfaWNfaW52X2hhcmRlbmluZyh2b2lkICpkYXRhKQ0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+
PiAjZW5kaWYNCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gKyNpZmRlZiBDT05GSUdfQVJNNjRfRVJSQVRV
TV84MzIwNzUNCj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+ICtzdGF0aWMgaW50IHdhcm5fZGV2aWNlX2xv
YWRfYWNxdWlyZV9lcnJhdGEodm9pZCAqZGF0YSkNCj4+Pj4+Pj4+ICt7DQo+Pj4+Pj4+PiArICAg
IHN0YXRpYyBib29sIHdhcm5lZCA9IGZhbHNlOw0KPj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4gKyAgICBp
ZiAoICF3YXJuZWQgKQ0KPj4+Pj4+Pj4gKyAgICB7DQo+Pj4+Pj4+PiArICAgICAgICB3YXJuaW5n
X2FkZCgiVGhpcyBDUFUgaXMgYWZmZWN0ZWQgYnkgdGhlIGVycmF0YSA4MzIwNzUuXG4iDQo+Pj4+
Pj4+PiArICAgICAgICAgICAgICAgICAgICAiR3Vlc3RzIHdpdGhvdXQgcmVxdWlyZWQgQ1BVIGVy
cmF0dW0gd29ya2Fyb3VuZHNcbiINCj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICJjYW4g
ZGVhZGxvY2sgdGhlIHN5c3RlbSFcbiINCj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICJP
bmx5IHRydXN0ZWQgZ3Vlc3RzIHNob3VsZCBiZSB1c2VkIG9uIHRoaXMNCj4+Pj4+Pj4+IHN5c3Rl
bS5cbiIpOw0KPj4+Pj4+Pj4gKyAgICAgICAgd2FybmVkID0gdHJ1ZTsNCj4+Pj4+Pj4gDQo+Pj4+
Pj4+IFRoaXMgaXMgYW4gYW50aXBhdHRlcm4sIHdoaWNoIHByb2JhYmx5IHdhbnRzIGZpeGluZyBl
bHNld2hlcmUgYXMgd2VsbC4NCj4+Pj4+Pj4gDQo+Pj4+Pj4+IHdhcm5pbmdfYWRkKCkgaXMgX19p
bml0LiAgSXQncyBub3QgbGVnaXRpbWF0ZSB0byBjYWxsIGZyb20gYSBub24taW5pdA0KPj4+Pj4+
PiBmdW5jdGlvbiwgYW5kIGEgbGVzcyB1c2VsZXNzIGJ1aWxkIHN5c3RlbSB3b3VsZCBoYXZlIG1v
ZHBvc3QgdG8gb2JqZWN0Lg0KPj4+Pj4+PiANCj4+Pj4+Pj4gVGhlIEFSTV9TTUNDQ19BUkNIX1dP
UktBUk9VTkRfMSBpbnN0YW5jZSBhc3NlcnRzIGJhc2VkIG9uIHN5c3RlbSBzdGF0ZSwNCj4+Pj4+
Pj4gYnV0IHRoaXMgcHJvdmlkZXMgbm8gc2FmZXR5IGF0IGFsbC4NCj4+Pj4+Pj4gDQo+Pj4+Pj4+
IA0KPj4+Pj4+PiBXaGF0IHdhcm5pbmdfYWRkKCkgYWN0dWFsbHkgZG9lcyBpcyBxdWV1ZSBtZXNz
YWdlcyBmb3Igc29tZSBwb2ludCBuZWFyDQo+Pj4+Pj4+IHRoZSBlbmQgb2YgYm9vdC4gIEl0J3Mg
bm90IGNsZWFyIHRoYXQgdGhpcyBpcyBldmVuIGEgY2xldmVyIHRoaW5nIHRvIGRvLg0KPj4+Pj4+
PiANCj4+Pj4+Pj4gSSdtIHZlcnkgdGVtcHRlZCB0byBzdWdnZXN0IGEgYmxhbmtldCBjaGFuZ2Ug
dG8gcHJpbnRrX29uY2UoKS4NCj4+Pj4+PiANCj4+Pj4+PiBJZiB0aGlzIGlzIG5lZWRlZCB0aGVu
IHRoaXMgY291bGQgYmUgZG9uZSBpbiBhbiBvdGhlciBzZXJpZSA/DQo+Pj4+PiANCj4+Pj4+IFRo
ZSBjYWxsYmFjayAtPmVuYWJsZSgpIHdpbGwgYmUgY2FsbGVkIHdoZW4gYSBDUFUgaXMgb25saW5l
ZC9vZmZsaW5lZC4gU28gdGhpcw0KPj4+Pj4gaXMgZ29pbmcgdG8gcmVxdWlyZSBpZiB5b3UgcGxh
biB0byBzdXBwb3J0IENQVSBob3RwbHVncyBvciBzdXNwZW5kIHJlc3VtZS4NCj4+Pj4+IA0KPj4+
Pj4+IFdvdWxkIGJlIGdvb2QgdG8ga2VlcCB0aGlzIHBhdGNoIGFzIHB1cmVseSBoYW5kbGluZyB0
aGUgZXJyYXRhLg0KPj4+PiANCj4+Pj4gTXkgcHJlZmVyZW5jZSB3b3VsZCBiZSB0byBrZWVwIHRo
aXMgcGF0Y2ggc21hbGwgd2l0aCBqdXN0IHRoZSBlcnJhdGEsDQo+Pj4+IG1heWJlIHVzaW5nIGEg
c2ltcGxlIHByaW50a19vbmNlIGFzIEFuZHJldyBhbmQgSnVsaWVuIGRpc2N1c3NlZC4NCj4+Pj4g
DQo+Pj4+IFRoZXJlIGlzIGFub3RoZXIgaW5zdGFuY2Ugb2Ygd2FybmluZ19hZGQgcG90ZW50aWFs
bHkgYmVpbmcgY2FsbGVkDQo+Pj4+IG91dHNpZGUgX19pbml0IGluIHhlbi9hcmNoL2FybS9jcHVl
cnJhdGEuYzoNCj4+Pj4gZW5hYmxlX3NtY2NjX2FyY2hfd29ya2Fyb3VuZF8xLiBTbyBpZiB5b3Ug
YXJlIHVwIGZvciBpdCwgaXQgd291bGQgYmUNCj4+Pj4gZ29vZCB0byBwcm9kdWNlIGEgcGF0Y2gg
dG8gZml4IHRoYXQgdG9vLg0KPj4+PiANCj4+Pj4gDQo+Pj4+PiBJbiB0aGUgY2FzZSBvZiB0aGlz
IHBhdGNoLCBob3cgYWJvdXQgbW92aW5nIHRoZSB3YXJuaW5nX2FkZCgpIGluDQo+Pj4+PiBlbmFi
bGVfZXJyYXRhX3dvcmthcm91bmRzKCk/DQo+Pj4+PiANCj4+Pj4+IEJ5IHRoZW4gd2Ugc2hvdWxk
IG5vdyBhbGwgdGhlIGVycmF0YSBwcmVzZW50IG9uIHlvdXIgcGxhdGZvcm0uIEFsbCBDUFVzDQo+
Pj4+PiBvbmxpbmVkIGFmdGVyd2FyZHMgKGkuZS4gcnVudGltZSkgc2hvdWxkIGFsd2F5cyBhYmlk
ZSB0byB0aGUgc2V0IGRpc2NvdmVyDQo+Pj4+PiBkdXJpbmcgYm9vdC4NCj4+Pj4gDQo+Pj4+IElm
IEkgdW5kZXJzdGFuZCB5b3VyIHN1Z2dlc3Rpb24gY29ycmVjdGx5LCBpdCB3b3VsZCB3b3JrIGZv
cg0KPj4+PiB3YXJuX2RldmljZV9sb2FkX2FjcXVpcmVfZXJyYXRhLCBiZWNhdXNlIGl0IGlzIGp1
c3QgYSB3YXJuaW5nLCBidXQgaXQNCj4+Pj4gd291bGQgbm90IHdvcmsgZm9yIGVuYWJsZV9zbWNj
Y19hcmNoX3dvcmthcm91bmRfMSwgYmVjYXVzZSB0aGVyZSBpcw0KPj4+PiBhY3R1YWxseSBhIGNh
bGwgdG8gYmUgbWFkZSB0aGVyZS4NCj4+Pj4gDQo+Pj4+IE1heWJlIGl0IHdvdWxkIGJlIHNpbXBs
ZXIgdG8gdXNlIHByaW50a19vbmNlIGluIGJvdGggY2FzZXM/IEkgZG9uJ3QgaGF2ZQ0KPj4+PiBh
IHN0cm9uZyBwcmVmZXJlbmNlIGVpdGhlciB3YXkuDQo+Pj4gDQo+Pj4gSSBjb3VsZCBkbyB0aGUg
Zm9sbG93aW5nIChpbiBhIHNlcmllIG9mIDIgcGF0Y2hlcyk6DQo+Pj4gLSBtb2RpZnkgZW5hYmxl
X3NtY2NjX2FyY2hfd29ya2Fyb3VuZF8xIHRvIHVzZSBwcmludGtfb25jZSB3aXRoIGENCj4+PiAg
IHByZWZpeC9zdWZmaXgg4oCcKioqKuKAnSBvbiBlYWNoIGxpbmUgcHJpbnRlZCAoYW5kIG1heWJl
IGFkYXB0aW5nIHByaW50IHRvIGZpdCBhDQo+Pj4gICBsaW5lIGxlbmd0aCBvZiA4MCkNCj4+PiAt
IG1vZGlmeSBteSBwYXRjaCB0byBkbyB0aGUgcHJpbnQgaW4gZW5hYmxlX2VycmF0YV93b3JrYXJv
dW5kcyB1c2luZyBhbHNvDQo+Pj4gICB0aGUgcHJlZml4L3N1ZmZpeCBhbmQgcHJpbnRrX29uY2UN
Cj4+PiANCj4+PiBQbGVhc2UgY29uZmlybSB0aGF0IHRoaXMgc3RyYXRlZ3kgd291bGQgZml0IGV2
ZXJ5b25lLg0KPj4gSSB0aGluayBpdCBpcyBPSyBidXQgaWYgeW91IGFyZSBnb2luZyB0byB1c2Ug
cHJpbnRrX29uY2UgaW4geW91ciBwYXRjaA0KPj4geW91IG1pZ2h0IGFzIHdlbGwgbGVhdmUgaXQg
aW4gdGhlIC5lbmFibGUgaW1wbGVtZW50YXRpb24uDQo+PiBKdWxpZW4sIHdoYXQgZG8geW91IHRo
aW5rPw0KPiANCj4gQmVydHJhbmQgcmVtaW5kZWQgbWUgdG9kYXkgdGhhdCBJIGZvcmdvdCB0byBh
bnN3ZXIgdGhlIGUtbWFpbCAoc29ycnkpLiBJIGFtIGhhcHB5IHdpdGggdXNpbmcgcHJpbnRrX29u
Y2UoKS4NCg0KU2hhbGwgaSBhbHNvIGtlZXAgdGhlIC5lbmFibGUgaW1wbGVtZW50YXRpb24gPw0K
QXQgdGhlIGVuZCBoYXZpbmc6DQogaWYgKCBjcHVzX2hhdmVfY2FwKEFSTTY0X1dPUktBUk9VTkRf
REVWSUNFX0xPQURfQUNRVUlSRSkgKSANCmluIGVuYWJsZV9lcnJhdGFfd29ya2Fyb3VuZHMgaXMg
cXVpdGUgY2xlYW4uDQoNCj4gDQo+IEkgYW0gYWxzbyB3b25kZXJpbmcgaWYgd2Ugc2hvdWxkIGFs
c28gdGFpbnQgdGhlIGh5cGVydmlzb3IgKHZpYSBhZGRfdGFpbnQoKSkuIFRoaXMgd291bGQgYmUg
aGVscGZ1bCBpZiBzb21lb25lIHJlcG9ydHMgZXJyb3Igb24gYSBYZW4gcnVubmluZyBvbiBzdWNo
IHBsYXRmb3JtLg0KDQpHb29kIGlkZWEgeWVzLg0KSSB3aWxsIGFkZCB0aGF0IGFuZCByZW1vdmlu
ZyB0aGUgY29yZSBmcm9tIHRoZSBzZWN1cml0eSBzdXBwb3J0ZWQgb25lcyB0byBteSBwYXRjaC4N
Cg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo=

