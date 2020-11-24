Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FC42C2FD2
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 19:14:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36768.68800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khcpC-00055L-1O; Tue, 24 Nov 2020 18:13:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36768.68800; Tue, 24 Nov 2020 18:13:57 +0000
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
	id 1khcpB-00054w-Tl; Tue, 24 Nov 2020 18:13:57 +0000
Received: by outflank-mailman (input) for mailman id 36768;
 Tue, 24 Nov 2020 18:13:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tuHM=E6=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1khcpA-00054r-K0
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 18:13:56 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.84]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e16f5e5c-fd8e-49f3-b65d-87c05e538f6a;
 Tue, 24 Nov 2020 18:13:55 +0000 (UTC)
Received: from AM6P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::17)
 by HE1PR0802MB2153.eurprd08.prod.outlook.com (2603:10a6:3:c2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.28; Tue, 24 Nov
 2020 18:13:52 +0000
Received: from VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8b:cafe::8b) by AM6P191CA0004.outlook.office365.com
 (2603:10a6:209:8b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Tue, 24 Nov 2020 18:13:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT056.mail.protection.outlook.com (10.152.19.28) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Tue, 24 Nov 2020 18:13:50 +0000
Received: ("Tessian outbound 39167997cde8:v71");
 Tue, 24 Nov 2020 18:13:50 +0000
Received: from e99faebd3ed0.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F06836F8-0498-4F8A-AA86-CF71AF11E4B6.1; 
 Tue, 24 Nov 2020 18:13:44 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e99faebd3ed0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Nov 2020 18:13:44 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0802MB2565.eurprd08.prod.outlook.com (2603:10a6:4:a1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Tue, 24 Nov
 2020 18:13:41 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0%7]) with mapi id 15.20.3589.030; Tue, 24 Nov 2020
 18:13:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=tuHM=E6=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1khcpA-00054r-K0
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 18:13:56 +0000
X-Inumbo-ID: e16f5e5c-fd8e-49f3-b65d-87c05e538f6a
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown [40.107.6.84])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e16f5e5c-fd8e-49f3-b65d-87c05e538f6a;
	Tue, 24 Nov 2020 18:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mo49gPnktvMoGOWA9mm8DBmQwJW+1slbJowKXFbEobw=;
 b=38yk/7WulUCtrcBoR7OcQXM72Y/pvrzcnpiN7UUg8v/dfHyzgiCWsBCJ1yOQIPvwL/lftQrKExO7KwBSYW6UyaUp31Ckcn8ohWEQTbsn6ejSTrhviyyHO4keF9IAcwtdUUAStHRGZtAVrjqQloWWJYrjFtnWx7OHFjcgarwVv8Y=
Received: from AM6P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::17)
 by HE1PR0802MB2153.eurprd08.prod.outlook.com (2603:10a6:3:c2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.28; Tue, 24 Nov
 2020 18:13:52 +0000
Received: from VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8b:cafe::8b) by AM6P191CA0004.outlook.office365.com
 (2603:10a6:209:8b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Tue, 24 Nov 2020 18:13:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT056.mail.protection.outlook.com (10.152.19.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Tue, 24 Nov 2020 18:13:50 +0000
Received: ("Tessian outbound 39167997cde8:v71"); Tue, 24 Nov 2020 18:13:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2eb8af3956ac4211
X-CR-MTA-TID: 64aa7808
Received: from e99faebd3ed0.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F06836F8-0498-4F8A-AA86-CF71AF11E4B6.1;
	Tue, 24 Nov 2020 18:13:44 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e99faebd3ed0.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 24 Nov 2020 18:13:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VXoio1DngWVoWFZ6138Fc59yUQ1+DSfq7dI5Q1/BEAIr1t1UUvE81n0sXMVvd6ww3gqUj1jpNHopGWvw6H1RtYVhrd7gPUiw4vdPshP3WFjDGjnC4810o0may2CYADjZ7QI1C1j/OX4YRxAsoLrk2YF2EX3qYmqwgtL+wuTzAdxkI4ohHaqQsUOGhaC/AGMuY4nYW3cPoOkV9Fc1sme/CGE7+OcL5C6Nv6QdwG2CS1QQNiDRZN72irCvGarL5i8j1EyuXe8GiMxr0X2ywCB4kSTOxAS0+/XdJMZsjvmdR5JDoBrrUsKRyfA9BP0H5F0YHmPMqZJg0gsV3aPmYTbSvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mo49gPnktvMoGOWA9mm8DBmQwJW+1slbJowKXFbEobw=;
 b=MM+vGCy9lox1eypCxaKc7IDG7h4T+Ljw4MPI9IJwskMLBbytYq/dsabB/B2WKWRCWR6rZRmLHQDOpNYIcTxxgnUGrg09taShyMHyjYrIw/t4BWGEalf64iSq+s0jlEgasGuWAhEKIgpIRHe0pdla9cVr/gWmseLXST8LwFKm9FS3d6AV0gQWRmfLiEx6dnjld7FEO6PFb2nlQzFw3wiKaOrYpi64xMhaAAR6vi8sGVATyh5LGXDuqnhlp4tenURZWvzSIaMwQz8hXBJeM7jd9HPToSSFvO4pny8DB4xfsYQt4E8PJ7w/iMR8ljqjsa80vJttZAo8KXuErlKwa0iIsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mo49gPnktvMoGOWA9mm8DBmQwJW+1slbJowKXFbEobw=;
 b=38yk/7WulUCtrcBoR7OcQXM72Y/pvrzcnpiN7UUg8v/dfHyzgiCWsBCJ1yOQIPvwL/lftQrKExO7KwBSYW6UyaUp31Ckcn8ohWEQTbsn6ejSTrhviyyHO4keF9IAcwtdUUAStHRGZtAVrjqQloWWJYrjFtnWx7OHFjcgarwVv8Y=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0802MB2565.eurprd08.prod.outlook.com (2603:10a6:4:a1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Tue, 24 Nov
 2020 18:13:41 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0%7]) with mapi id 15.20.3589.030; Tue, 24 Nov 2020
 18:13:41 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Julien Grall
	<Julien.Grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH RFC 4/6] xen/arm: mm: Allow other mapping size in
 xen_pt_update_entry()
Thread-Topic: [PATCH RFC 4/6] xen/arm: mm: Allow other mapping size in
 xen_pt_update_entry()
Thread-Index: AQHWvqdUIaSB2fElrE+qcehs9C8Fz6nXncMA
Date: Tue, 24 Nov 2020 18:13:41 +0000
Message-ID: <9F95F565-8D59-400B-9F15-9ABA0B1FB7FC@arm.com>
References: <20201119190751.22345-1-julien@xen.org>
 <20201119190751.22345-5-julien@xen.org>
In-Reply-To: <20201119190751.22345-5-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0b0f87b1-963b-4d21-b0fc-08d890a4b1d0
x-ms-traffictypediagnostic: DB6PR0802MB2565:|HE1PR0802MB2153:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB2153FC921D0882C60B31B7D99DFB0@HE1PR0802MB2153.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ymIvltsuyvlYNSV7hurg7qvheICkcgdzrsS6TLk8CXA3nYWZ39pPrky6NC8nn9nnOdkYceRIbkAAtLtf+4yCz7kJX9yUbCrIhfCD0hg9TuWTuWtS4U9SAR8Ikqp4rE15NpuFvfL5eXRbHzsqQXBtGopYXfTPi3TuwDBjIcfcrn8TEwFdRtsKgRNRo1FPtt+/g0lyVpHnPci32J4b85qE2Dzp72TopcHSVQOybqqceV7zTWnSb32xfN+V5YTFMk1vsoYSUN1qp7jdl58ZxD+hJ+H3j28F8SQYApKBAc5YgW4yaWJvZUTeOlItAOMm0oEL8dx4r7/fhMawmT89/BlR9eNO4fL0PynEZT0qyrvCPR/Q7mbwZ/Kd7upuf+LBGI6i
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(316002)(54906003)(53546011)(6506007)(6486002)(6916009)(66946007)(91956017)(76116006)(66556008)(64756008)(33656002)(26005)(71200400001)(66446008)(66476007)(6512007)(83380400001)(5660300002)(8676002)(4326008)(2906002)(36756003)(478600001)(186003)(86362001)(2616005)(8936002)(21314003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 YMkSOZpf3JBQWES0s/ylSXV14KpKZlWtCAtNZa1ZyIT07e+6gaGE774rxGrD5/qSrMncG40zQMQhGG8WX2l7wODs91EJ7Z4vtpDnCsbuXhvYoxijp6V5yBcDrXxXkks7TDFdGqoLA4DqnL5uPMxdcjsmeQoQLGzGpVyeSL6iwv0brjMwl79TJlJVoY8PVliKK3/vJrYFDtjhjIq+qCn0MVFE5fDz1vPjvfGqO7vJXRR89LBmXL1o3Tkhe435xKc1FHgNxgWIUXZpI5Wn+Efr/mFEdG/f3KimHOdJbpIajMBtApB20tRzNP5/TzN1lgnlAICI1Pchxb5AQVKiWPzJWIf/1/5GtVxygcv17F8wASKidL/29Cyjvd0Ao3bTupxk4uUDZI7/YB65Rb38yCN09uFw5X7wKUDzJ02Qw2aqzTiMZPWzTSVAGZMNzU756uzavb3dN1EeFNNm+bxYF81Exn1D9Z3jJcw0Ak8sgmcZJ51ldd1PNL5vLxa1nTuZtuFt/RzYbdmye3NMMBnUd+WdT/E1CXf9+Ps393KApVTl/xIdx0n1ebjq0/MyU/na5x0mf1JvxyLJ1cskTXkJwWZ0jt9zwU3OjkX0zfLsdIP6zrM27GFDeVqiO8nFNFXOBLavgdGIMdA8WXcIqAx/Tf3DJD6i+jEAscSuWpdwu5Dg4Pz/wTFgaBKxkm78qOPs5MY5p/sbUGfPYtL7AyjYEVGsF0ncSEkuhkUUU+u+bhRQfzdvJko7sn075uoA6lujDZeaFnR4XjL1UrA+99uQP3jPyegz1FBWL4mNo6VDeC3lFRKpEkhuHKFFYfU7YhZ+yVUAyXFit8LLf7jUF75N1ups6P1fSEn7LYk3t55k5xaVrJ3a47gdkBPi0oWrPNjnv3Fu82vUzxqoj6806jmKGLtLrA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <9F8C37525B6D6345954DCD26514125DD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2565
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	10fbd648-94eb-4d79-b088-08d890a4ac79
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	26IZWwWU4CPz45/xqrTrl8Q9g4eWWEy/gkOmUbntPQJbqKkTm3X3bC4VjYVJqN+6n+Z9YU5lAlj0GrcXWlT9AviOF4g88bDdoOtaB3tcyI+tXGAbS3Sc/dUviMZJb14rLvTxQnpAc/TqeilPFMP+C2vEuZNAk9tM/25y2Nu7VlL4QI971n+ZLsUfhIG8NDuDmqHu2JAdlPEhw8GDxa6Yge8RXKEi+E+Uicd8lBSiEqEuausGoM6EiiiMUv8We1BKs4dVutJj29yqVzX4mdHqFl5V27wPGzYOMH+N/MZr4u3LvIEIQDAKDu92MtBASEkmst/DxdDXYRq3JUl6A9o/10yo71WlYB/A46y6bWzXnKZvGWyoIncNQdRV0FA1TvJvYkBJfMIcvpqmYmAkcLXBOX6W6XgxT/vSKLh5Tcryehk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(39860400002)(346002)(46966005)(356005)(70206006)(4326008)(8676002)(26005)(6862004)(47076004)(86362001)(336012)(82310400003)(2906002)(82740400003)(6506007)(6512007)(36756003)(8936002)(53546011)(107886003)(33656002)(316002)(5660300002)(2616005)(81166007)(70586007)(54906003)(83380400001)(6486002)(186003)(478600001)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 18:13:50.2704
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b0f87b1-963b-4d21-b0fc-08d890a4b1d0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2153

SGkgSnVsaWVuLA0KDQo+IE9uIDE5IE5vdiAyMDIwLCBhdCAxOTowNywgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5n
cmFsbEBhcm0uY29tPg0KPiANCj4gQXQgdGhlIG1vbWVudCwgeGVuX3B0X3VwZGF0ZV9lbnRyeSgp
IG9ubHkgc3VwcG9ydHMgbWFwcGluZyBhdCBsZXZlbCAzDQo+IChpLmUgNEtCIG1hcHBpbmcpLiBX
aGlsZSB0aGlzIGlzIGZpbmUgZm9yIG1vc3Qgb2YgdGhlIHJ1bnRpbWUgaGVscGVyLA0KPiB0aGUg
Ym9vdCBjb2RlIHdpbGwgcmVxdWlyZSB0byB1c2Ugc3VwZXJwYWdlIG1hcHBpbmcuDQo+IA0KPiBX
ZSBkb24ndCB3YW50IHRvIGFsbG93IHN1cGVycGFnZSBtYXBwaW5nIGJ5IGRlZmF1bHQgYXMgc29t
ZSBvZiB0aGUNCj4gY2FsbGVycyBtYXkgZXhwZWN0IHNtYWxsIG1hcHBpbmdzIChpLmUgcG9wdWxh
dGVfcHRfcmFuZ2UoKSkgb3IgZXZlbg0KPiBleHBlY3QgdG8gdW5tYXAgb25seSBhIHBhcnQgb2Yg
YSBzdXBlcnBhZ2UuDQo+IA0KPiBUbyBrZWVwIHRoZSBjb2RlIHNpbXBsZSwgYSBuZXcgZmxhZyBf
UEFHRV9CTE9DSyBpcyBpbnRyb2R1Y2VkIHRvDQo+IGFsbG93IHRoZSBjYWxsZXIgdG8gZW5hYmxl
IHN1cGVycGFnZSBtYXBwaW5nLg0KPiANCj4gQXMgdGhlIGNvZGUgZG9lc24ndCBzdXBwb3J0IGFs
bCB0aGUgY29tYmluYXRpb25zLCB4ZW5fcHRfY2hlY2tfZW50cnkoKQ0KPiBpcyBleHRlbmRlZCB0
byB0YWtlIGludG8gYWNjb3VudCB0aGUgY2FzZXMgd2UgZG9uJ3Qgc3VwcG9ydCB3aGVuDQo+IHVz
aW5nIGJsb2NrIG1hcHBpbmc6DQo+ICAgIC0gUmVwbGFjaW5nIGEgdGFibGUgd2l0aCBhIG1hcHBp
bmcuIFRoaXMgbWF5IGhhcHBlbiBpZiByZWdpb24gd2FzDQo+ICAgIGZpcnN0IG1hcHBlZCB3aXRo
IDRLQiBtYXBwaW5nIGFuZCB0aGVuIGxhdGVyIG9uIHJlcGxhY2VkIHdpdGggYSAyTUINCj4gICAg
KG9yIDFHQiBtYXBwaW5nKQ0KPiAgICAtIFJlbW92aW5nL21vZGlmeSBhIHRhYmxlLiBUaGlzIG1h
eSBoYXBwZW4gaWYgYSBjYWxsZXIgdHJ5IHRvIHJlbW92ZSBhDQo+ICAgIHJlZ2lvbiB3aXRoIF9Q
QUdFX0JMT0NLIHNldCB3aGVuIGl0IHdhcyBjcmVhdGVkIHdpdGhvdXQgaXQNCj4gDQo+IE5vdGUg
dGhhdCB0aGUgY3VycmVudCByZXN0cmljdGlvbiBtZWFuIHRoYXQgdGhlIGNhbGxlciBtdXN0IGVu
c3VyZSB0aGF0DQo+IF9QQUdFX0JMT0NLIGlzIGNvbnNpc3RlbnRseSBzZXQvY2xlYXJlZCBhY3Jv
c3MgYWxsIHRoZSB1cGRhdGVzIG9uIGENCj4gZ2l2ZW4gdmlydHVhbCByZWdpb24uIFRoaXMgb3Vn
aHQgdG8gYmUgZmluZSB3aXRoIHRoZSBleHBlY3RlZCB1c2UtY2FzZXMuDQo+IA0KPiBNb3JlIHJl
d29yayB3aWxsIGJlIG5lY2Vzc2FyeSBpZiB3ZSB3YW50ZWQgdG8gcmVtb3ZlIHRoZSByZXN0cmlj
dGlvbnMuDQo+IA0KPiBOb3RlIHRoYXQgbnJfbWZucyBpcyBub3cgbWFya2VkIGNvbnN0IGFzIGl0
IGlzIHVzZWQgZm9yIGZsdXNoaW5nIHRoZQ0KPiBUTEJzIGFuZCB3ZSBkb24ndCB3YW50IGl0IHRv
IGJlIG1vZGlmaWVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4u
Z3JhbGxAYXJtLmNvbT4NCj4gDQoNCkZpcnN0IEkgZGlkIHRlc3QgdGhlIHNlcmllIG9uIEFybSBh
bmQgc28gZmFyIGl0IHdhcyB3b3JraW5nIHByb3Blcmx5Lg0KDQpJIG9ubHkgaGF2ZSBzb21lIHJl
bWFya3MgYmVjYXVzZSBldmVuIGlmIHRoZSBjb2RlIGlzIHJpZ2h0LCBJIHRoaW5rDQpzb21lIHBh
cnRzIG9mIHRoZSBjb2RlIGFyZSBub3QgZWFzeSB0byByZWFkLi4uDQoNCj4gLS0tDQo+IA0KPiBU
aGlzIHBhdGNoIGlzIG5lY2Vzc2FyeSBmb3IgdXBjb21pbmcgY2hhbmdlcyBpbiB0aGUgTU0gY29k
ZS4gSSB3b3VsZA0KPiBsaWtlIHRvIHJlbW92ZSBtb3N0IG9mIHRoZSBvcGVuLWNvZGluZyB1cGRh
dGUgb2YgdGhlIHBhZ2UtdGFibGVzIGFzIHRoZXkNCj4gYXJlIG5vdCBlYXN5IHRvIHByb3Blcmx5
IGZpeC9leHRlbmQuIEZvciBpbnN0YW5jZSwgYWx3YXlzIG1hcHBpbmcNCj4geGVuaGVhcCBtYXBw
aW5nIHdpdGggMUdCIHN1cGVycGFnZSBpcyBwbGFpbiB3cm9uZyBiZWNhdXNlOg0KPiAgICAtIFJB
TSByZWdpb25zIGFyZSBub3QgYWx3YXlzIDFHQiBhbGlnbmVkIChzdWNoIGFzIG9uIFJQSSA0KSBh
bmQgd2UNCj4gICAgbWF5IGVuZCB1cCB0byBtYXAgTU1JTyB3aXRoIGNhY2hlYWJsZSBhdHRyaWJ1
dGVzDQo+ICAgIC0gUkFNIG1heSBjb250YWluIHJlc2VydmVkIHJlZ2lvbnMgc2hvdWxkIGVpdGhl
ciBub3QgYmUgbWFwcGVkDQo+IC0tLQ0KPiB4ZW4vYXJjaC9hcm0vbW0uYyAgICAgICAgICB8IDg3
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tDQo+IHhlbi9pbmNsdWRlL2Fz
bS1hcm0vcGFnZS5oIHwgIDQgKysNCj4gMiBmaWxlcyBjaGFuZ2VkLCA3MyBpbnNlcnRpb25zKCsp
LCAxOCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbW0uYyBi
L3hlbi9hcmNoL2FybS9tbS5jDQo+IGluZGV4IDU5ZjhhM2YxNWZkMS4uYWYwZjEyYjZlNmQzIDEw
MDY0NA0KPiAtLS0gYS94ZW4vYXJjaC9hcm0vbW0uYw0KPiArKysgYi94ZW4vYXJjaC9hcm0vbW0u
Yw0KPiBAQCAtMTA2MCw5ICsxMDYwLDEwIEBAIHN0YXRpYyBpbnQgeGVuX3B0X25leHRfbGV2ZWwo
Ym9vbCByZWFkX29ubHksIHVuc2lnbmVkIGludCBsZXZlbCwNCj4gfQ0KPiANCj4gLyogU2FuaXR5
IGNoZWNrIG9mIHRoZSBlbnRyeSAqLw0KPiAtc3RhdGljIGJvb2wgeGVuX3B0X2NoZWNrX2VudHJ5
KGxwYWVfdCBlbnRyeSwgbWZuX3QgbWZuLCB1bnNpZ25lZCBpbnQgZmxhZ3MpDQo+ICtzdGF0aWMg
Ym9vbCB4ZW5fcHRfY2hlY2tfZW50cnkobHBhZV90IGVudHJ5LCBtZm5fdCBtZm4sIHVuc2lnbmVk
IGludCBsZXZlbCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBp
bnQgZmxhZ3MpDQo+IHsNCj4gLSAgICAvKiBTYW5pdHkgY2hlY2sgd2hlbiBtb2RpZnlpbmcgYSBw
YWdlLiAqLw0KPiArICAgIC8qIFNhbml0eSBjaGVjayB3aGVuIG1vZGlmeWluZyBhbiBlbnRyeS4g
Ki8NCj4gICAgIGlmICggKGZsYWdzICYgX1BBR0VfUFJFU0VOVCkgJiYgbWZuX2VxKG1mbiwgSU5W
QUxJRF9NRk4pICkNCj4gICAgIHsNCj4gICAgICAgICAvKiBXZSBkb24ndCBhbGxvdyBtb2RpZnlp
bmcgYW4gaW52YWxpZCBlbnRyeS4gKi8NCj4gQEAgLTEwNzIsNiArMTA3MywxMyBAQCBzdGF0aWMg
Ym9vbCB4ZW5fcHRfY2hlY2tfZW50cnkobHBhZV90IGVudHJ5LCBtZm5fdCBtZm4sIHVuc2lnbmVk
IGludCBmbGFncykNCj4gICAgICAgICAgICAgcmV0dXJuIGZhbHNlOw0KPiAgICAgICAgIH0NCj4g
DQo+ICsgICAgICAgIC8qIFdlIGRvbid0IGFsbG93IG1vZGlmeWluZyBhIHRhYmxlIGVudHJ5ICov
DQo+ICsgICAgICAgIGlmICggIWxwYWVfaXNfbWFwcGluZyhlbnRyeSwgbGV2ZWwpICkNCj4gKyAg
ICAgICAgew0KPiArICAgICAgICAgICAgbW1fcHJpbnRrKCJNb2RpZnlpbmcgYSB0YWJsZSBlbnRy
eSBpcyBub3QgYWxsb3dlZC5cbiIpOw0KPiArICAgICAgICAgICAgcmV0dXJuIGZhbHNlOw0KPiAr
ICAgICAgICB9DQo+ICsNCj4gICAgICAgICAvKiBXZSBkb24ndCBhbGxvdyBjaGFuZ2luZyBtZW1v
cnkgYXR0cmlidXRlcy4gKi8NCj4gICAgICAgICBpZiAoIGVudHJ5LnB0LmFpICE9IFBBR0VfQUlf
TUFTSyhmbGFncykgKQ0KPiAgICAgICAgIHsNCj4gQEAgLTEwODcsNyArMTA5NSw3IEBAIHN0YXRp
YyBib29sIHhlbl9wdF9jaGVja19lbnRyeShscGFlX3QgZW50cnksIG1mbl90IG1mbiwgdW5zaWdu
ZWQgaW50IGZsYWdzKQ0KPiAgICAgICAgICAgICByZXR1cm4gZmFsc2U7DQo+ICAgICAgICAgfQ0K
PiAgICAgfQ0KPiAtICAgIC8qIFNhbml0eSBjaGVjayB3aGVuIGluc2VydGluZyBhIHBhZ2UgKi8N
Cj4gKyAgICAvKiBTYW5pdHkgY2hlY2sgd2hlbiBpbnNlcnRpbmcgYSBtYXBwaW5nICovDQo+ICAg
ICBlbHNlIGlmICggZmxhZ3MgJiBfUEFHRV9QUkVTRU5UICkNCj4gICAgIHsNCj4gICAgICAgICAv
KiBXZSBzaG91bGQgYmUgaGVyZSB3aXRoIGEgdmFsaWQgTUZOLiAqLw0KPiBAQCAtMTA5NiwxOCAr
MTEwNCwyOCBAQCBzdGF0aWMgYm9vbCB4ZW5fcHRfY2hlY2tfZW50cnkobHBhZV90IGVudHJ5LCBt
Zm5fdCBtZm4sIHVuc2lnbmVkIGludCBmbGFncykNCj4gICAgICAgICAvKiBXZSBkb24ndCBhbGxv
dyByZXBsYWNpbmcgYW55IHZhbGlkIGVudHJ5LiAqLw0KPiAgICAgICAgIGlmICggbHBhZV9pc192
YWxpZChlbnRyeSkgKQ0KPiAgICAgICAgIHsNCj4gLSAgICAgICAgICAgIG1tX3ByaW50aygiQ2hh
bmdpbmcgTUZOIGZvciBhIHZhbGlkIGVudHJ5IGlzIG5vdCBhbGxvd2VkICglIyJQUklfbWZuIiAt
PiAlIyJQUklfbWZuIikuXG4iLA0KPiAtICAgICAgICAgICAgICAgICAgICAgIG1mbl94KGxwYWVf
Z2V0X21mbihlbnRyeSkpLCBtZm5feChtZm4pKTsNCj4gKyAgICAgICAgICAgIGlmICggbHBhZV9p
c19tYXBwaW5nKGVudHJ5LCBsZXZlbCkgKQ0KPiArICAgICAgICAgICAgICAgIG1tX3ByaW50aygi
Q2hhbmdpbmcgTUZOIGZvciBhIHZhbGlkIGVudHJ5IGlzIG5vdCBhbGxvd2VkICglIyJQUklfbWZu
IiAtPiAlIyJQUklfbWZuIikuXG4iLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICBtZm5f
eChscGFlX2dldF9tZm4oZW50cnkpKSwgbWZuX3gobWZuKSk7DQo+ICsgICAgICAgICAgICBlbHNl
DQo+ICsgICAgICAgICAgICAgICAgbW1fcHJpbnRrKCJUcnlpbmcgdG8gcmVwbGFjZSBhIHRhYmxl
IHdpdGggYSBtYXBwaW5nLlxuIik7DQo+ICAgICAgICAgICAgIHJldHVybiBmYWxzZTsNCj4gICAg
ICAgICB9DQo+ICAgICB9DQo+IC0gICAgLyogU2FuaXR5IGNoZWNrIHdoZW4gcmVtb3ZpbmcgYSBw
YWdlLiAqLw0KPiArICAgIC8qIFNhbml0eSBjaGVjayB3aGVuIHJlbW92aW5nIGEgbWFwcGluZy4g
Ki8NCj4gICAgIGVsc2UgaWYgKCAoZmxhZ3MgJiAoX1BBR0VfUFJFU0VOVHxfUEFHRV9QT1BVTEFU
RSkpID09IDAgKQ0KPiAgICAgew0KPiAgICAgICAgIC8qIFdlIHNob3VsZCBiZSBoZXJlIHdpdGgg
YW4gaW52YWxpZCBNRk4uICovDQo+ICAgICAgICAgQVNTRVJUKG1mbl9lcShtZm4sIElOVkFMSURf
TUZOKSk7DQo+IA0KPiAtICAgICAgICAvKiBXZSBkb24ndCBhbGxvdyByZW1vdmluZyBwYWdlIHdp
dGggY29udGlndW91cyBiaXQgc2V0LiAqLw0KPiArICAgICAgICAvKiBXZSBkb24ndCBhbGxvdyBy
ZW1vdmluZyBhIHRhYmxlICovDQo+ICsgICAgICAgIGlmICggbHBhZV9pc190YWJsZShlbnRyeSwg
bGV2ZWwpICkNCj4gKyAgICAgICAgew0KPiArICAgICAgICAgICAgbW1fcHJpbnRrKCJSZW1vdmlu
ZyBhIHRhYmxlIGlzIG5vdCBhbGxvd2VkLlxuIik7DQo+ICsgICAgICAgICAgICByZXR1cm4gZmFs
c2U7DQo+ICsgICAgICAgIH0NCj4gKw0KPiArICAgICAgICAvKiBXZSBkb24ndCBhbGxvdyByZW1v
dmluZyBhIG1hcHBpbmcgd2l0aCBjb250aWd1b3VzIGJpdCBzZXQuICovDQo+ICAgICAgICAgaWYg
KCBlbnRyeS5wdC5jb250aWcgKQ0KPiAgICAgICAgIHsNCj4gICAgICAgICAgICAgbW1fcHJpbnRr
KCJSZW1vdmluZyBlbnRyeSB3aXRoIGNvbnRpZ3VvdXMgYml0IHNldCBpcyBub3QgYWxsb3dlZC5c
biIpOw0KPiBAQCAtMTEyNiwxMiArMTE0NCwxMiBAQCBzdGF0aWMgYm9vbCB4ZW5fcHRfY2hlY2tf
ZW50cnkobHBhZV90IGVudHJ5LCBtZm5fdCBtZm4sIHVuc2lnbmVkIGludCBmbGFncykNCj4gfQ0K
PiANCj4gc3RhdGljIGludCB4ZW5fcHRfdXBkYXRlX2VudHJ5KG1mbl90IHJvb3QsIHVuc2lnbmVk
IGxvbmcgdmlydCwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtZm5fdCBtZm4s
IHVuc2lnbmVkIGludCBmbGFncykNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBt
Zm5fdCBtZm4sIHVuc2lnbmVkIGludCBwYWdlX29yZGVyLA0KPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGludCBmbGFncykNCj4gew0KPiAgICAgaW50IHJjOw0KPiAg
ICAgdW5zaWduZWQgaW50IGxldmVsOw0KPiAtICAgIC8qIFdlIG9ubHkgc3VwcG9ydCA0S0IgbWFw
cGluZyAoaS5lIGxldmVsIDMpIGZvciBub3cgKi8NCj4gLSAgICB1bnNpZ25lZCBpbnQgdGFyZ2V0
ID0gMzsNCj4gKyAgICB1bnNpZ25lZCBpbnQgdGFyZ2V0ID0gMyAtIChwYWdlX29yZGVyIC8gTFBB
RV9TSElGVCk7DQoNClRoaXMgaXMgbm90IHJlYWxseSBzdHJhaWdodCBmb3J3YXJkIGFuZCBpdCB3
b3VsZCBiZSBnb29kIHRvIGFjdHVhbGx5IGV4cGxhaW4gdGhlIGNvbXB1dGF0aW9uIGhlcmUgb3Ig
Li4uDQoNCj4gICAgIGxwYWVfdCAqdGFibGU7DQo+ICAgICAvKg0KPiAgICAgICogVGhlIGludGVy
bWVkaWF0ZSBwYWdlIHRhYmxlcyBhcmUgcmVhZC1vbmx5IHdoZW4gdGhlIE1GTiBpcyBub3QgdmFs
aWQNCj4gQEAgLTExODYsNyArMTIwNCw3IEBAIHN0YXRpYyBpbnQgeGVuX3B0X3VwZGF0ZV9lbnRy
eShtZm5fdCByb290LCB1bnNpZ25lZCBsb25nIHZpcnQsDQo+ICAgICBlbnRyeSA9IHRhYmxlICsg
b2Zmc2V0c1tsZXZlbF07DQo+IA0KPiAgICAgcmMgPSAtRUlOVkFMOw0KPiAtICAgIGlmICggIXhl
bl9wdF9jaGVja19lbnRyeSgqZW50cnksIG1mbiwgZmxhZ3MpICkNCj4gKyAgICBpZiAoICF4ZW5f
cHRfY2hlY2tfZW50cnkoKmVudHJ5LCBtZm4sIGxldmVsLCBmbGFncykgKQ0KPiAgICAgICAgIGdv
dG8gb3V0Ow0KPiANCj4gICAgIC8qIElmIHdlIGFyZSBvbmx5IHBvcHVsYXRpbmcgcGFnZS10YWJs
ZSwgdGhlbiB3ZSBhcmUgZG9uZS4gKi8NCj4gQEAgLTEyMDQsOCArMTIyMiwxMSBAQCBzdGF0aWMg
aW50IHhlbl9wdF91cGRhdGVfZW50cnkobWZuX3Qgcm9vdCwgdW5zaWduZWQgbG9uZyB2aXJ0LA0K
PiAgICAgICAgIHsNCj4gICAgICAgICAgICAgcHRlID0gbWZuX3RvX3hlbl9lbnRyeShtZm4sIFBB
R0VfQUlfTUFTSyhmbGFncykpOw0KPiANCj4gLSAgICAgICAgICAgIC8qIFRoaXJkIGxldmVsIGVu
dHJpZXMgc2V0IHB0ZS5wdC50YWJsZSA9IDEgKi8NCj4gLSAgICAgICAgICAgIHB0ZS5wdC50YWJs
ZSA9IDE7DQo+ICsgICAgICAgICAgICAvKg0KPiArICAgICAgICAgICAgICogRmlyc3QgYW5kIHNl
Y29uZCBsZXZlbCBwYWdlcyBzZXQgcHRlLnB0LnRhYmxlID0gMCwgYnV0DQo+ICsgICAgICAgICAg
ICAgKiB0aGlyZCBsZXZlbCBlbnRyaWVzIHNldCBwdGUucHQudGFibGUgPSAxLg0KPiArICAgICAg
ICAgICAgICovDQo+ICsgICAgICAgICAgICBwdGUucHQudGFibGUgPSAobGV2ZWwgPT0gMyk7DQo+
ICAgICAgICAgfQ0KPiAgICAgICAgIGVsc2UgLyogV2UgYXJlIHVwZGF0aW5nIHRoZSBwZXJtaXNz
aW9uID0+IENvcHkgdGhlIGN1cnJlbnQgcHRlLiAqLw0KPiAgICAgICAgICAgICBwdGUgPSAqZW50
cnk7DQo+IEBAIC0xMjI5LDExICsxMjUwLDEyIEBAIHN0YXRpYyBERUZJTkVfU1BJTkxPQ0soeGVu
X3B0X2xvY2spOw0KPiANCj4gc3RhdGljIGludCB4ZW5fcHRfdXBkYXRlKHVuc2lnbmVkIGxvbmcg
dmlydCwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgIG1mbl90IG1mbiwNCj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIG5yX21mbnMsDQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgY29uc3QgdW5zaWduZWQgbG9uZyBucl9tZm5zLA0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgdW5zaWduZWQgaW50IGZsYWdzKQ0KPiB7DQo+ICAgICBpbnQgcmMgPSAwOw0K
PiAtICAgIHVuc2lnbmVkIGxvbmcgYWRkciA9IHZpcnQsIGFkZHJfZW5kID0gYWRkciArIG5yX21m
bnMgKiBQQUdFX1NJWkU7DQo+ICsgICAgdW5zaWduZWQgbG9uZyB2Zm4gPSBwYWRkcl90b19wZm4o
dmlydCk7DQo+ICsgICAgdW5zaWduZWQgbG9uZyBsZWZ0ID0gbnJfbWZuczsNCj4gDQo+ICAgICAv
Kg0KPiAgICAgICogRm9yIGFybTMyLCBwYWdlLXRhYmxlcyBhcmUgZGlmZmVyZW50IG9uIGVhY2gg
Q1BVcy4gWWV0LCB0aGV5IHNoYXJlDQo+IEBAIC0xMjY1LDE0ICsxMjg3LDQzIEBAIHN0YXRpYyBp
bnQgeGVuX3B0X3VwZGF0ZSh1bnNpZ25lZCBsb25nIHZpcnQsDQo+IA0KPiAgICAgc3Bpbl9sb2Nr
KCZ4ZW5fcHRfbG9jayk7DQo+IA0KPiAtICAgIGZvciAoIDsgYWRkciA8IGFkZHJfZW5kOyBhZGRy
ICs9IFBBR0VfU0laRSApDQo+ICsgICAgd2hpbGUgKCBsZWZ0ICkNCj4gICAgIHsNCj4gLSAgICAg
ICAgcmMgPSB4ZW5fcHRfdXBkYXRlX2VudHJ5KHJvb3QsIGFkZHIsIG1mbiwgZmxhZ3MpOw0KPiAr
ICAgICAgICB1bnNpZ25lZCBpbnQgb3JkZXI7DQo+ICsgICAgICAgIHVuc2lnbmVkIGxvbmcgbWFz
azsNCj4gKw0KPiArICAgICAgICAvKg0KPiArICAgICAgICAgKiBEb24ndCB0YWtlIGludG8gYWNj
b3VudCB0aGUgTUZOIHdoZW4gcmVtb3ZpbmcgbWFwcGluZyAoaS5lDQo+ICsgICAgICAgICAqIE1G
Tl9JTlZBTElEKSB0byBjYWxjdWxhdGUgdGhlIGNvcnJlY3QgdGFyZ2V0IG9yZGVyLg0KPiArICAg
ICAgICAgKg0KPiArICAgICAgICAgKiBYWFg6IFN1cHBvcnQgc3VwZXJwYWdlIG1hcHBpbmdzIGlm
IG5yIGlzIG5vdCBhbGlnbmVkIHRvIGENCj4gKyAgICAgICAgICogc3VwZXJwYWdlIHNpemUuDQo+
ICsgICAgICAgICAqLw0KPiArICAgICAgICBtYXNrID0gIW1mbl9lcShtZm4sIElOVkFMSURfTUZO
KSA/IG1mbl94KG1mbikgOiAwOw0KPiArICAgICAgICBtYXNrIHw9IHZmbiB8IGxlZnQ7DQo+ICsN
Cj4gKyAgICAgICAgLyoNCj4gKyAgICAgICAgICogQWx3YXlzIHVzZSBsZXZlbCAzIG1hcHBpbmcg
dW5sZXNzIHRoZSBjYWxsZXIgcmVxdWVzdCBibG9jaw0KPiArICAgICAgICAgKiBtYXBwaW5nLg0K
PiArICAgICAgICAgKi8NCj4gKyAgICAgICAgaWYgKCBsaWtlbHkoIShmbGFncyAmIF9QQUdFX0JM
T0NLKSkgKQ0KPiArICAgICAgICAgICAgb3JkZXIgPSBUSElSRF9PUkRFUjsNCj4gKyAgICAgICAg
ZWxzZSBpZiAoICEobWFzayAmIChCSVQoRklSU1RfT1JERVIsIFVMKSAtIDEpKSApDQo+ICsgICAg
ICAgICAgICBvcmRlciA9IEZJUlNUX09SREVSOw0KPiArICAgICAgICBlbHNlIGlmICggIShtYXNr
ICYgKEJJVChTRUNPTkRfT1JERVIsIFVMKSAtIDEpKSApDQo+ICsgICAgICAgICAgICBvcmRlciA9
IFNFQ09ORF9PUkRFUjsNCj4gKyAgICAgICAgZWxzZQ0KPiArICAgICAgICAgICAgb3JkZXIgPSBU
SElSRF9PUkRFUjsNCj4gKw0KPiArICAgICAgICByYyA9IHhlbl9wdF91cGRhdGVfZW50cnkocm9v
dCwgcGZuX3RvX3BhZGRyKHZmbiksIG1mbiwgb3JkZXIsIGZsYWdzKTsNCg0KbWF5YmUgaXQgd291
bGQgYmUgZWFzaWVyIGhlcmUgdG8gcGFzcyBkaXJlY3RseSB0aGUgdGFyZ2V0IGluc3RlYWQgb2Yg
dGhlIHBhZ2Ugb3JkZXIuDQoNCj4gICAgICAgICBpZiAoIHJjICkNCj4gICAgICAgICAgICAgYnJl
YWs7DQo+IA0KPiArICAgICAgICB2Zm4gKz0gMVUgPDwgb3JkZXI7DQo+ICAgICAgICAgaWYgKCAh
bWZuX2VxKG1mbiwgSU5WQUxJRF9NRk4pICkNCj4gLSAgICAgICAgICAgIG1mbiA9IG1mbl9hZGQo
bWZuLCAxKTsNCj4gKyAgICAgICAgICAgIG1mbiA9IG1mbl9hZGQobWZuLCAxVSA8PCBvcmRlcik7
DQo+ICsNCj4gKyAgICAgICAgbGVmdCAtPSAoMVUgPDwgb3JkZXIpOw0KPiAgICAgfQ0KPiANCj4g
ICAgIC8qDQo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL3BhZ2UuaCBiL3hlbi9p
bmNsdWRlL2FzbS1hcm0vcGFnZS5oDQo+IGluZGV4IDRlYThlOTcyNDdjOC4uZGUwOTZiMDk2OGUz
IDEwMDY0NA0KPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL3BhZ2UuaA0KPiArKysgYi94ZW4v
aW5jbHVkZS9hc20tYXJtL3BhZ2UuaA0KPiBAQCAtNzksNiArNzksNyBAQA0KPiAgKiBbMzo0XSBQ
ZXJtaXNzaW9uIGZsYWdzDQo+ICAqIFs1XSAgIFBhZ2UgcHJlc2VudA0KPiAgKiBbNl0gICBPbmx5
IHBvcHVsYXRlIHBhZ2UgdGFibGVzDQo+ICsgKiBbN10gICBVc2UgYW55IGxldmVsIG1hcHBpbmcg
b25seSAoaS5lLiBzdXBlcnBhZ2VzIGlzIGFsbG93ZWQpDQoNCnRoZSBjb21tZW50IGZvciB0aGUg
Yml0IGlzIG5vdCByZWFsbHkgbG9naWM6IGFueSBsZXZlbCBtYXBwaW5nIG9ubHkNCldvdWxkbuKA
mXQgaXQgYmUgbW9yZSBjbGVhciB0byBuYW1lIHRoZSBiaXQgX1BBR0VfU1VQRVJQQUdFX0JJVCBh
bmQNCmNvbW1lbnQgaXQgYnkgc2F5aW5nIHRoYXQgc3VwZXJwYWdlcyBhcmUgYWxsb3dlZCA/DQoN
ClJlZ2FyZHMNCkJlcnRyYW5kDQoNCj4gICovDQo+ICNkZWZpbmUgUEFHRV9BSV9NQVNLKHgpICgo
eCkgJiAweDdVKQ0KPiANCj4gQEAgLTkyLDYgKzkzLDkgQEANCj4gI2RlZmluZSBfUEFHRV9QUkVT
RU5UICAgICgxVSA8PCA1KQ0KPiAjZGVmaW5lIF9QQUdFX1BPUFVMQVRFICAgKDFVIDw8IDYpDQo+
IA0KPiArI2RlZmluZSBfUEFHRV9CTE9DS19CSVQgICAgIDcNCj4gKyNkZWZpbmUgX1BBR0VfQkxP
Q0sgICAgICAgICAoMVUgPDwgX1BBR0VfQkxPQ0tfQklUKQ0KPiArDQo+IC8qDQo+ICAqIF9QQUdF
X0RFVklDRSBhbmQgX1BBR0VfTk9STUFMIGFyZSBjb252ZW5pZW5jZSBkZWZpbmVzLiBUaGV5IGFy
ZSBub3QNCj4gICogbWVhbnQgdG8gYmUgdXNlZCBvdXRzaWRlIG9mIHRoaXMgaGVhZGVyLg0KPiAt
LSANCj4gMi4xNy4xDQo+IA0KDQo=

