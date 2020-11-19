Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3330E2B9606
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 16:23:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30947.61168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfllv-0001Me-1w; Thu, 19 Nov 2020 15:22:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30947.61168; Thu, 19 Nov 2020 15:22:55 +0000
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
	id 1kfllu-0001MF-Uf; Thu, 19 Nov 2020 15:22:54 +0000
Received: by outflank-mailman (input) for mailman id 30947;
 Thu, 19 Nov 2020 15:22:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zZym=EZ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kfllu-0001MA-0c
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 15:22:54 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe08::630])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89588174-f36d-420f-989d-9620037c39e8;
 Thu, 19 Nov 2020 15:22:51 +0000 (UTC)
Received: from DB6PR0601CA0022.eurprd06.prod.outlook.com (2603:10a6:4:7b::32)
 by AM9PR08MB6306.eurprd08.prod.outlook.com (2603:10a6:20b:2d6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Thu, 19 Nov
 2020 15:22:49 +0000
Received: from DB5EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:7b:cafe::67) by DB6PR0601CA0022.outlook.office365.com
 (2603:10a6:4:7b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Thu, 19 Nov 2020 15:22:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT051.mail.protection.outlook.com (10.152.21.19) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Thu, 19 Nov 2020 15:22:49 +0000
Received: ("Tessian outbound 082214a64d39:v71");
 Thu, 19 Nov 2020 15:22:49 +0000
Received: from eb3633972789.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DDFD69C8-98C9-4B4B-B9F3-198F645219F8.1; 
 Thu, 19 Nov 2020 15:22:43 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eb3633972789.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 19 Nov 2020 15:22:43 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3851.eurprd08.prod.outlook.com (2603:10a6:10:7a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 19 Nov
 2020 15:22:41 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737%7]) with mapi id 15.20.3564.028; Thu, 19 Nov 2020
 15:22:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zZym=EZ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kfllu-0001MA-0c
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 15:22:54 +0000
X-Inumbo-ID: 89588174-f36d-420f-989d-9620037c39e8
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown [2a01:111:f400:fe08::630])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 89588174-f36d-420f-989d-9620037c39e8;
	Thu, 19 Nov 2020 15:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmMDQElag4nHhxSq8mZBMLKt7NRFoLGlfCL5DYtdbGI=;
 b=sU84WCVm1DzBRt7ZSmf/vtia+oYfLPXnx96BghkwRPtEvsl5hn+LrFAFQPg4MXzw102ptVLxOJKjCW4U39SPLaVDnvuoq0GeAeZg+B48ASObDwb3i4mh+/p7/F/VNwr/sMF8Xs8DnF/7vNvxwB9jucszKOURWpPGUPRcruz1SEc=
Received: from DB6PR0601CA0022.eurprd06.prod.outlook.com (2603:10a6:4:7b::32)
 by AM9PR08MB6306.eurprd08.prod.outlook.com (2603:10a6:20b:2d6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Thu, 19 Nov
 2020 15:22:49 +0000
Received: from DB5EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:7b:cafe::67) by DB6PR0601CA0022.outlook.office365.com
 (2603:10a6:4:7b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Thu, 19 Nov 2020 15:22:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT051.mail.protection.outlook.com (10.152.21.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Thu, 19 Nov 2020 15:22:49 +0000
Received: ("Tessian outbound 082214a64d39:v71"); Thu, 19 Nov 2020 15:22:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b4d66dddee9df59c
X-CR-MTA-TID: 64aa7808
Received: from eb3633972789.3
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DDFD69C8-98C9-4B4B-B9F3-198F645219F8.1;
	Thu, 19 Nov 2020 15:22:43 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eb3633972789.3
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 19 Nov 2020 15:22:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gLICRvFSnlWGqdoKykGLFIGhlni2t3Qd5bPU+Y1v+QQXdDgwS3uQdTp1jQ8W9immuCEonL877k+ZN5chbfrtKVzMwiOAloqkEr3TUDXRiJUkkyD5ydKPM8M6pS4zDgObZFwwD5FNkhboYN+Ph1l8zmRHv5sXrymH9O8W2GB2SqSZA05gDNCjgkkJ9hno56bp98VJ2KNX78iJvZ+eL3s2u4inaaLaXy0dwQ2Gct9sHtsJa5veG9IG1mh976/hXcCPezjEKClKyYzk6FRSjWpsU9JbPumJkg4csCaNwdiSM5aQuRtDkay42PC10wjMZ14EnKmlopoplmzW598LvmAGFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmMDQElag4nHhxSq8mZBMLKt7NRFoLGlfCL5DYtdbGI=;
 b=SFsJ4/BcFqslDKJxZIJjMDh6QotMtTQLRruuyqq8Or4biWpp1xNIUo9MZqlY+oJSudz+znQ//zHYOEb1DTPr4OPawMBbaZH5WkWhYlCdVDWqcwnfjry+giQZKEIXXdG21ai9ZKIIKlR15RasUgnRL9GHH7FMXQnxqIbbhbvTWVxZjG64aeCLG9bvHwGxBsre+T4HkuPf9EEYEUmOlqUxjYu7kL03SBNgGU3OQ1yTzZMfu+2jw7h619dfrVBkqIsr3SERcj9BTeqOQwGKy+M7v2SaXLUCuaV0P/cC7GWWNRmrmBqEGebVihz7q58XrGfA2vMOeyWSZWzEMJ06fsdvbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmMDQElag4nHhxSq8mZBMLKt7NRFoLGlfCL5DYtdbGI=;
 b=sU84WCVm1DzBRt7ZSmf/vtia+oYfLPXnx96BghkwRPtEvsl5hn+LrFAFQPg4MXzw102ptVLxOJKjCW4U39SPLaVDnvuoq0GeAeZg+B48ASObDwb3i4mh+/p7/F/VNwr/sMF8Xs8DnF/7vNvxwB9jucszKOURWpPGUPRcruz1SEc=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3851.eurprd08.prod.outlook.com (2603:10a6:10:7a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 19 Nov
 2020 15:22:41 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737%7]) with mapi id 15.20.3564.028; Thu, 19 Nov 2020
 15:22:41 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, "alex.bennee@linaro.org"
	<alex.bennee@linaro.org>, Andre Przywara <Andre.Przywara@arm.com>, Rahul
 Singh <Rahul.Singh@arm.com>, Julien Grall <Julien.Grall@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v3 1/2] xen/arm: gic: acpi: Use the correct length for the
 GICC structure
Thread-Topic: [PATCH v3 1/2] xen/arm: gic: acpi: Use the correct length for
 the GICC structure
Thread-Index: AQHWvm1700AF8zQgzEuZU87Ez2FU9KnPksgA
Date: Thu, 19 Nov 2020 15:22:41 +0000
Message-ID: <890D41B9-D3F3-498F-89E4-8BB997B45D6F@arm.com>
References: <20201119121347.27139-1-julien@xen.org>
 <20201119121347.27139-2-julien@xen.org>
In-Reply-To: <20201119121347.27139-2-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c0ff3728-acf8-41c5-d981-08d88c9ef9a9
x-ms-traffictypediagnostic: DB7PR08MB3851:|AM9PR08MB6306:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB63069A22CA8F0D6FC497E2659DE00@AM9PR08MB6306.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2958;OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8P0Fc1prU3beyKxbj984hkAJuIop976+x2n6doW8FWzkqg5GKWh8Uyd3Dil3G1OIwQQUsr9EKqEebY3Roy7BXriSAgiqcSxQaKTQbSZoMXlIg5VVNIuuZ1HQ+ktKWrJJaw6ZLH1GNJ9ZqtFJRJJA3HTYn6WmCj3kzaY7Wcy+kG1uSsj6ECMwla0bObgzsOrXFGPgADbehFHC+97JnmpFrdrTCdtvjHeJZ6obnisaGvEwlnxfo0UfUCSSsTLMCuf5JcmCEebNSR4z0OMKwQqotacsk63d1KzjiUB9paId4rq01RPW2AQT9xs1Pz6IaU1iqgzhR/dCriMg1zC1RT7XhQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(376002)(39860400002)(366004)(33656002)(6486002)(6916009)(2616005)(53546011)(6506007)(64756008)(8676002)(83380400001)(2906002)(66556008)(54906003)(8936002)(66446008)(478600001)(71200400001)(26005)(86362001)(36756003)(66476007)(76116006)(5660300002)(66946007)(186003)(91956017)(6512007)(4326008)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 FfELrDswEXPI/TYJPG4nsTex+kRRo+i/tia10+goJkkDTyVzuThBDdxD1XmPH98BSABbud8wwhecGASy18WlrnWBokD3MqdZb99mHYY3gVPbhFc7SEGqeDB7bQ2Jz5+SAgu70V2mVCkHAAQ9sn79cmUbOHVGGkXMZikbZooxVHP/I6u2wTmVtYandDUtGp/c6n8WYAuXOtXyLfDm8hlRXM+wNVfPIB8ZMbB/G+oRq742i5rV1d9vLXJ6poypOOcRi++UC84Uvm7jKQvnciX/r4t5f9bNoRzTKBxLrVPDzhmsSTwaXkaYotlAHlZOgcirzBOe/QZS+YT1aVY4juJ7srKeXu/H+8Oh7+AVhra7rGDDW9QVB8pAM95ctLETGGuBXD9jWgazBszNr0CCP6VqTQUOhsij0MOipTYzsBQZ8CrbrGH8b7c0PP1d5TDw9oowO4Z76Is8qCo/GIWDx5/QuLRNXMrJT6T9dLrSwi9VM0Vf6zWuk4O0mznOlkTESgaHIe9yEcnZi2sDC3s0Bx0NK72oGLly7aUHHnIYx34NkkqoPHEDM9c13ixGpi1JOksj+6LXiBDHwximc9Z5St5OSFA1yOPam80es4YENHZzUCwQwG6MduoT3zpuNvJdXEJJUh9ueKo1XntFOV/2X0KXgA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B1FFCF60BF6A244A1841AB87C335BC4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3851
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	efccea10-f129-45bb-e71c-08d88c9ef505
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JYanPQ76m4g+0cIOWnQKeM2y/9q0AjddSv0xIRKZjm8UxZFVTz9BKqJXB37DJdpNxT6VCUf2AA4KAT8DLYXTv4xkJYCL8N03V9QaP84qwNd4TeALgsYF4YH6kCZekChEOAmdHY8MKMC9ZIz3oOWgIuqZdbKp7OGPM/m1bpCBNZ3eiZ2upTFk7ak45qS/00SDRnO/4XQ9jGVKixtGXc6iEtIZMVq/2wa/PD4J0Zt9v2R++EVGwPi+jbpWS77akisZIc+elhQqtF/7/w/YGiviQ/kIcy4FmWIKWJeuApXBAecG4bnNNowFt0V5ADAzpLHWqZ4xSs+lZXbPBcDAuNdfF9m5JHh4Y3PD0HsliMrKg+35Vu2jfv5W3j9y77yCBSNdhfNr/ligzUk5s6w+NI+tXg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39850400004)(346002)(396003)(136003)(46966005)(478600001)(36756003)(6486002)(6506007)(53546011)(8936002)(316002)(8676002)(107886003)(2906002)(5660300002)(70586007)(33656002)(70206006)(83380400001)(356005)(82310400003)(26005)(86362001)(186003)(81166007)(6862004)(336012)(54906003)(4326008)(2616005)(47076004)(6512007)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 15:22:49.4239
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0ff3728-acf8-41c5-d981-08d88c9ef9a9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6306

SGkgSnVsaWVuLA0KDQo+IE9uIDE5IE5vdiAyMDIwLCBhdCAxMjoxMywgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5n
cmFsbEBhcm0uY29tPg0KPiANCj4gVGhlIGxlbmd0aCBvZiB0aGUgR0lDQyBzdHJ1Y3R1cmUgaW4g
dGhlIE1BRFQgQUNQSSB0YWJsZSBkaWZmZXJzIGJldHdlZW4NCj4gdmVyc2lvbiA1LjEgYW5kIDYu
MCwgYWx0aG91Z2ggdGhlcmUgYXJlIG5vIG90aGVyIHJlbGV2YW50IGRpZmZlcmVuY2VzLg0KPiAN
Cj4gVXNlIHRoZSBCQURfTUFEVF9HSUNDX0VOVFJZIG1hY3JvLCB3aGljaCB3YXMgc3BlY2lmaWNh
bGx5IGRlc2lnbmVkIHRvDQo+IG92ZXJjb21lIHRoaXMgaXNzdWUuDQo+IA0KDQpUaGUgc2VyaWUg
aXMgYnJha2luZyB0aGUgYnVpbGQgb24gYXJtNjQgaWYgQUNQSSBpcyBub3QgYWN0aXZhdGVkOg0K
YXJjaC9hcm0vZ2ljLmM6NDU2OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBhY3BpX2dibF9GQURU
4oCZDQoNCkNoZWVycw0KQmVydHJhbmQNCg0KPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwg
PGp1bGllbi5ncmFsbEBhcm0uY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZSBQcnp5d2FyYSA8
YW5kcmUucHJ6eXdhcmFAYXJtLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxq
Z3JhbGxAYW1hem9uLmNvbT4NCj4gDQo+IC0tLQ0KPiAgICBDaGFuZ2VzIGluIHYzOg0KPiAgICAg
ICAgLSBVcGRhdGUgdGhlIGNvbW1pdCB0aXRsZSBhcyB3ZSBhbHNvIG1vZGlmeSBHSUN2MyBjb2Rl
DQo+ICAgICAgICAtIFVzZSB0aGUgY29ycmVjdCBsZW5ndGggaW4gbW9yZSBwbGFjZXMNCj4gDQo+
ICAgIENoYW5nZXMgaW4gdjI6DQo+ICAgICAgICAtIFBhdGNoIGFkZGVkDQo+IC0tLQ0KPiB4ZW4v
YXJjaC9hcm0vYWNwaS9ib290LmMgfCAyICstDQo+IHhlbi9hcmNoL2FybS9naWMtdjIuYyAgICB8
IDUgKysrLS0NCj4geGVuL2FyY2gvYXJtL2dpYy12My5jICAgIHwgNiArKystLS0NCj4geGVuL2Fy
Y2gvYXJtL2dpYy5jICAgICAgIHwgMiArLQ0KPiA0IGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9u
cygrKSwgNyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYWNw
aS9ib290LmMgYi94ZW4vYXJjaC9hcm0vYWNwaS9ib290LmMNCj4gaW5kZXggMzBlNGJkMWJjNWE3
Li41NWMzZTVjYmM4MzQgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL2FybS9hY3BpL2Jvb3QuYw0K
PiArKysgYi94ZW4vYXJjaC9hcm0vYWNwaS9ib290LmMNCj4gQEAgLTEzMSw3ICsxMzEsNyBAQCBh
Y3BpX3BhcnNlX2dpY19jcHVfaW50ZXJmYWNlKHN0cnVjdCBhY3BpX3N1YnRhYmxlX2hlYWRlciAq
aGVhZGVyLA0KPiAgICAgc3RydWN0IGFjcGlfbWFkdF9nZW5lcmljX2ludGVycnVwdCAqcHJvY2Vz
c29yID0NCj4gICAgICAgICAgICAgICAgY29udGFpbmVyX29mKGhlYWRlciwgc3RydWN0IGFjcGlf
bWFkdF9nZW5lcmljX2ludGVycnVwdCwgaGVhZGVyKTsNCj4gDQo+IC0gICAgaWYgKCBCQURfTUFE
VF9FTlRSWShwcm9jZXNzb3IsIGVuZCkgKQ0KPiArICAgIGlmICggQkFEX01BRFRfR0lDQ19FTlRS
WShwcm9jZXNzb3IsIGVuZCkgKQ0KPiAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiANCj4gICAg
IGFjcGlfdGFibGVfcHJpbnRfbWFkdF9lbnRyeShoZWFkZXIpOw0KPiBkaWZmIC0tZ2l0IGEveGVu
L2FyY2gvYXJtL2dpYy12Mi5jIGIveGVuL2FyY2gvYXJtL2dpYy12Mi5jDQo+IGluZGV4IDBmNzQ3
NTM4ZGJjZC4uMGU1ZjIzMjAxOTc0IDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC9hcm0vZ2ljLXYy
LmMNCj4gKysrIGIveGVuL2FyY2gvYXJtL2dpYy12Mi5jDQo+IEBAIC0xMTM2LDcgKzExMzYsOCBA
QCBzdGF0aWMgaW50IGdpY3YyX21ha2VfaHdkb21fbWFkdChjb25zdCBzdHJ1Y3QgZG9tYWluICpk
LCB1MzIgb2Zmc2V0KQ0KPiANCj4gICAgIGhvc3RfZ2ljYyA9IGNvbnRhaW5lcl9vZihoZWFkZXIs
IHN0cnVjdCBhY3BpX21hZHRfZ2VuZXJpY19pbnRlcnJ1cHQsDQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgaGVhZGVyKTsNCj4gLSAgICBzaXplID0gc2l6ZW9mKHN0cnVjdCBhY3BpX21h
ZHRfZ2VuZXJpY19pbnRlcnJ1cHQpOw0KPiArDQo+ICsgICAgc2l6ZSA9IEFDUElfTUFEVF9HSUND
X0xFTkdUSDsNCj4gICAgIC8qIEFkZCBHZW5lcmljIEludGVycnVwdCAqLw0KPiAgICAgZm9yICgg
aSA9IDA7IGkgPCBkLT5tYXhfdmNwdXM7IGkrKyApDQo+ICAgICB7DQo+IEBAIC0xMTY1LDcgKzEx
NjYsNyBAQCBnaWNfYWNwaV9wYXJzZV9tYWR0X2NwdShzdHJ1Y3QgYWNwaV9zdWJ0YWJsZV9oZWFk
ZXIgKmhlYWRlciwNCj4gICAgIHN0cnVjdCBhY3BpX21hZHRfZ2VuZXJpY19pbnRlcnJ1cHQgKnBy
b2Nlc3NvciA9DQo+ICAgICAgICAgICAgICAgIGNvbnRhaW5lcl9vZihoZWFkZXIsIHN0cnVjdCBh
Y3BpX21hZHRfZ2VuZXJpY19pbnRlcnJ1cHQsIGhlYWRlcik7DQo+IA0KPiAtICAgIGlmICggQkFE
X01BRFRfRU5UUlkocHJvY2Vzc29yLCBlbmQpICkNCj4gKyAgICBpZiAoIEJBRF9NQURUX0dJQ0Nf
RU5UUlkocHJvY2Vzc29yLCBlbmQpICkNCj4gICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gDQo+
ICAgICAvKiBSZWFkIGZyb20gQVBJQyB0YWJsZSBhbmQgZmlsbCB1cCB0aGUgR0lDIHZhcmlhYmxl
cyAqLw0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2dpYy12My5jIGIveGVuL2FyY2gvYXJt
L2dpYy12My5jDQo+IGluZGV4IDBmNmNiZjYyMjRlOS4uNDgzZWMxNTk4ZjM3IDEwMDY0NA0KPiAt
LS0gYS94ZW4vYXJjaC9hcm0vZ2ljLXYzLmMNCj4gKysrIGIveGVuL2FyY2gvYXJtL2dpYy12My5j
DQo+IEBAIC0xNDk5LDcgKzE0OTksNyBAQCBzdGF0aWMgaW50IGdpY3YzX21ha2VfaHdkb21fbWFk
dChjb25zdCBzdHJ1Y3QgZG9tYWluICpkLCB1MzIgb2Zmc2V0KQ0KPiANCj4gICAgIGhvc3RfZ2lj
YyA9IGNvbnRhaW5lcl9vZihoZWFkZXIsIHN0cnVjdCBhY3BpX21hZHRfZ2VuZXJpY19pbnRlcnJ1
cHQsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaGVhZGVyKTsNCj4gLSAgICBzaXpl
ID0gc2l6ZW9mKHN0cnVjdCBhY3BpX21hZHRfZ2VuZXJpY19pbnRlcnJ1cHQpOw0KPiArICAgIHNp
emUgPSBBQ1BJX01BRFRfR0lDQ19MRU5HVEg7DQo+ICAgICBmb3IgKCBpID0gMDsgaSA8IGQtPm1h
eF92Y3B1czsgaSsrICkNCj4gICAgIHsNCj4gICAgICAgICBnaWNjID0gKHN0cnVjdCBhY3BpX21h
ZHRfZ2VuZXJpY19pbnRlcnJ1cHQgKikoYmFzZV9wdHIgKyB0YWJsZV9sZW4pOw0KPiBAQCAtMTU1
OCw3ICsxNTU4LDcgQEAgZ2ljX2FjcGlfcGFyc2VfbWFkdF9jcHUoc3RydWN0IGFjcGlfc3VidGFi
bGVfaGVhZGVyICpoZWFkZXIsDQo+ICAgICBzdHJ1Y3QgYWNwaV9tYWR0X2dlbmVyaWNfaW50ZXJy
dXB0ICpwcm9jZXNzb3IgPQ0KPiAgICAgICAgICAgICAgICBjb250YWluZXJfb2YoaGVhZGVyLCBz
dHJ1Y3QgYWNwaV9tYWR0X2dlbmVyaWNfaW50ZXJydXB0LCBoZWFkZXIpOw0KPiANCj4gLSAgICBp
ZiAoIEJBRF9NQURUX0VOVFJZKHByb2Nlc3NvciwgZW5kKSApDQo+ICsgICAgaWYgKCBCQURfTUFE
VF9HSUNDX0VOVFJZKHByb2Nlc3NvciwgZW5kKSApDQo+ICAgICAgICAgcmV0dXJuIC1FSU5WQUw7
DQo+IA0KPiAgICAgLyogUmVhZCBmcm9tIEFQSUMgdGFibGUgYW5kIGZpbGwgdXAgdGhlIEdJQyB2
YXJpYWJsZXMgKi8NCj4gQEAgLTE2MjgsNyArMTYyOCw3IEBAIGdpY19hY3BpX2dldF9tYWR0X2Nw
dV9udW0oc3RydWN0IGFjcGlfc3VidGFibGVfaGVhZGVyICpoZWFkZXIsDQo+ICAgICBzdHJ1Y3Qg
YWNwaV9tYWR0X2dlbmVyaWNfaW50ZXJydXB0ICpjcHVpZjsNCj4gDQo+ICAgICBjcHVpZiA9IChz
dHJ1Y3QgYWNwaV9tYWR0X2dlbmVyaWNfaW50ZXJydXB0ICopaGVhZGVyOw0KPiAtICAgIGlmICgg
QkFEX01BRFRfRU5UUlkoY3B1aWYsIGVuZCkgfHwgIWNwdWlmLT5naWNyX2Jhc2VfYWRkcmVzcyAp
DQo+ICsgICAgaWYgKCBCQURfTUFEVF9HSUNDX0VOVFJZKGNwdWlmLCBlbmQpIHx8ICFjcHVpZi0+
Z2ljcl9iYXNlX2FkZHJlc3MgKQ0KPiAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiANCj4gICAg
IHJldHVybiAwOw0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2dpYy5jIGIveGVuL2FyY2gv
YXJtL2dpYy5jDQo+IGluZGV4IGQ2MjNjNTdjYjlmYS4uYjEwMGM4NWVmMzE0IDEwMDY0NA0KPiAt
LS0gYS94ZW4vYXJjaC9hcm0vZ2ljLmMNCj4gKysrIGIveGVuL2FyY2gvYXJtL2dpYy5jDQo+IEBA
IC00NTMsNyArNDUzLDcgQEAgdW5zaWduZWQgbG9uZyBnaWNfZ2V0X2h3ZG9tX21hZHRfc2l6ZShj
b25zdCBzdHJ1Y3QgZG9tYWluICpkKQ0KPiAgICAgdW5zaWduZWQgbG9uZyBtYWR0X3NpemU7DQo+
IA0KPiAgICAgbWFkdF9zaXplID0gc2l6ZW9mKHN0cnVjdCBhY3BpX3RhYmxlX21hZHQpDQo+IC0g
ICAgICAgICAgICAgICAgKyBzaXplb2Yoc3RydWN0IGFjcGlfbWFkdF9nZW5lcmljX2ludGVycnVw
dCkgKiBkLT5tYXhfdmNwdXMNCj4gKyAgICAgICAgICAgICAgICArIEFDUElfTUFEVF9HSUNDX0xF
TkdUSCAqIGQtPm1heF92Y3B1cw0KPiAgICAgICAgICAgICAgICAgKyBzaXplb2Yoc3RydWN0IGFj
cGlfbWFkdF9nZW5lcmljX2Rpc3RyaWJ1dG9yKQ0KPiAgICAgICAgICAgICAgICAgKyBnaWNfaHdf
b3BzLT5nZXRfaHdkb21fZXh0cmFfbWFkdF9zaXplKGQpOw0KPiANCj4gLS0gDQo+IDIuMTcuMQ0K
PiANCg0K

