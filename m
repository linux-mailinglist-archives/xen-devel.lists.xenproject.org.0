Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 104E32810D1
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 12:57:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1887.5730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOIkX-0007zI-IN; Fri, 02 Oct 2020 10:57:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1887.5730; Fri, 02 Oct 2020 10:57:17 +0000
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
	id 1kOIkX-0007yt-F0; Fri, 02 Oct 2020 10:57:17 +0000
Received: by outflank-mailman (input) for mailman id 1887;
 Fri, 02 Oct 2020 10:57:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3+am=DJ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kOIkW-0007yn-0s
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 10:57:16 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe07::624])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08491e15-78f9-4871-8f44-d0dd4b6841d8;
 Fri, 02 Oct 2020 10:57:14 +0000 (UTC)
Received: from AM6P195CA0104.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::45)
 by PR3PR08MB5785.eurprd08.prod.outlook.com (2603:10a6:102:89::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Fri, 2 Oct
 2020 10:57:12 +0000
Received: from AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:86:cafe::59) by AM6P195CA0104.outlook.office365.com
 (2603:10a6:209:86::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.36 via Frontend
 Transport; Fri, 2 Oct 2020 10:57:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT059.mail.protection.outlook.com (10.152.17.193) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Fri, 2 Oct 2020 10:57:12 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64");
 Fri, 02 Oct 2020 10:57:12 +0000
Received: from 341fb1d3e8ae.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4FC73809-D430-445D-A3FB-AA6DF07289FD.1; 
 Fri, 02 Oct 2020 10:57:06 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 341fb1d3e8ae.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Oct 2020 10:57:06 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3388.eurprd08.prod.outlook.com (2603:10a6:10:41::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.37; Fri, 2 Oct
 2020 10:57:04 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e%6]) with mapi id 15.20.3412.029; Fri, 2 Oct 2020
 10:57:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3+am=DJ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kOIkW-0007yn-0s
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 10:57:16 +0000
X-Inumbo-ID: 08491e15-78f9-4871-8f44-d0dd4b6841d8
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown [2a01:111:f400:fe07::624])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 08491e15-78f9-4871-8f44-d0dd4b6841d8;
	Fri, 02 Oct 2020 10:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFx1hvLj5u5NPzRr2Sqx1W5LO2zEcHYNaQEfD4/FiiA=;
 b=pXEbPZaK+Nbd2HE2P492JeTREQxgd75yoiXJhM5hBijBmuf4PiTY4dLZv5tMza5AFCCSiZrVKBYHxEtuv1pyDNgSMuPN74zCHesXkFZxO7jer7vz2nqpnt9a99dv+lPZwgnlj65fn+GyA+yTssBWyLdkfzoC3s++K96Aae7c+3A=
Received: from AM6P195CA0104.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::45)
 by PR3PR08MB5785.eurprd08.prod.outlook.com (2603:10a6:102:89::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Fri, 2 Oct
 2020 10:57:12 +0000
Received: from AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:86:cafe::59) by AM6P195CA0104.outlook.office365.com
 (2603:10a6:209:86::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.36 via Frontend
 Transport; Fri, 2 Oct 2020 10:57:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT059.mail.protection.outlook.com (10.152.17.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Fri, 2 Oct 2020 10:57:12 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64"); Fri, 02 Oct 2020 10:57:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ae4ca4db6ca62e1d
X-CR-MTA-TID: 64aa7808
Received: from 341fb1d3e8ae.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4FC73809-D430-445D-A3FB-AA6DF07289FD.1;
	Fri, 02 Oct 2020 10:57:06 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 341fb1d3e8ae.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 02 Oct 2020 10:57:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=noL26mWYVgZ62JlSkAYF5LcuDPMnaNp0wiebMrGli/uKWWlZh2k2AqaC8LLWoLGsEw7unh1JXohRd7ehm219lwL7DsRPHI/MIE/nEodXQf6ad48teO5sIJli6X+poWbTzhhW97BB/p7D/ZaiSQhbh799O2cw2il3v0e8PVPyk3IKYzp9ADi3wn8sGl9MODWm/92ScJrIturcWt3eiKYj1Qq6YC8cq1AWBHblKd/EQpxCpqdI6x5tmhaj3z7UVc86dK4KAAteb7CeMdCqYH+LNJYCHhyarMTHYvPkuv1D+wIuODXAQcj5hn4I2zRGl3EdLP9pt1MSGN7i5kQcV0TvSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFx1hvLj5u5NPzRr2Sqx1W5LO2zEcHYNaQEfD4/FiiA=;
 b=SNQSAsTFU23EUKCZHDq1vu4wnL5qDz70jlzBrvI4aqwINyeHVwuAKxXgkRHl2OO261EtMbANquigPZiUtrcBwDyvs/Jnrc3bqV2rZuh7TVzfWgLq481Zcfwj8IESs7WtRXqr8XPqbEz7NwiE31bvOeFgpx0LcTWsXpT0FS3oyX/lD4N3xv/7mGbhyGSe2070gYCCykAX5kJlegxVfDw5l2XyRt35AyBcFeq/Z08wXfe6HsR5h9psbC4I83I3N/ncaRyUUgnGS3XDQJvgRmgawi59dtIKZxxqbl8piVSrHSCrcS05DqYgY1F2SAzqQ+SANcIJ/DwtCMwONpmC3SMWBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFx1hvLj5u5NPzRr2Sqx1W5LO2zEcHYNaQEfD4/FiiA=;
 b=pXEbPZaK+Nbd2HE2P492JeTREQxgd75yoiXJhM5hBijBmuf4PiTY4dLZv5tMza5AFCCSiZrVKBYHxEtuv1pyDNgSMuPN74zCHesXkFZxO7jer7vz2nqpnt9a99dv+lPZwgnlj65fn+GyA+yTssBWyLdkfzoC3s++K96Aae7c+3A=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3388.eurprd08.prod.outlook.com (2603:10a6:10:41::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.37; Fri, 2 Oct
 2020 10:57:04 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e%6]) with mapi id 15.20.3412.029; Fri, 2 Oct 2020
 10:57:04 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: George Dunlap <george.dunlap@citrix.com>, "open list:X86"
	<xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@citrix.com>, Wei
 Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Rich Persaud <persaur@gmail.com>
Subject: Re: [PATCH RFC] docs: Add minimum version depencency policy document
Thread-Topic: [PATCH RFC] docs: Add minimum version depencency policy document
Thread-Index: AQHWlylr89SNNL419USyeHY3I7qFNKmC0KsAgAEKroCAAEvZgA==
Date: Fri, 2 Oct 2020 10:57:03 +0000
Message-ID: <3679A867-715B-4C74-89B2-6E347F59708F@arm.com>
References: <20200930125736.95203-1-george.dunlap@citrix.com>
 <683E2686-1551-493B-A3AE-D0707C937155@arm.com>
 <CACMJ4Gac-rtoWqV=A-LT8VLU=SZQogSR009FjJiH3fF6rju5PQ@mail.gmail.com>
In-Reply-To:
 <CACMJ4Gac-rtoWqV=A-LT8VLU=SZQogSR009FjJiH3fF6rju5PQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 06033e38-0be6-4b02-9ebd-08d866c1eab6
x-ms-traffictypediagnostic: DB7PR08MB3388:|PR3PR08MB5785:
X-Microsoft-Antispam-PRVS:
	<PR3PR08MB5785B6190E58F25C266C3E009D310@PR3PR08MB5785.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 n1tLTgEQflQTTsrFgY/bFsCPRez4/RFAO07CKTb8d8MKq826TslXXg7TsFCsi+WOa4Qg8b/UVwYfF9roEsejws2IaHYl/YgPHLD3HTGg9qm70LkxRqvCr//C/Zmpl3iEtASJCZZHhEWW7FFwt+6GdmTnc1STfv9GVrW9D1gg8EUMyz3njI5HlQMWmO3I3pJZ+5RQtDQNJ+atEr56LmHXvGstrXZScldSw8Lwu8SyIAcGSGwoeshv3YxSSWmnq6XDSFMR05QFm9rr4fJsb0jQj0ExJ7+DkR28xDtX9c0vYtqO/nrMPUu/u3VmuknsLKkbD9Hb0rFD+1W73g9AYQhMZzjplXeaGUslo6rymZQV9aN34v97/y1BMQgqcIjVZ303kMb2/fRJO5OpD7qbicfCk/t4cG4jcjVm3DqDkmRlDrALK7ErhrJ3Pes81pNL4yaC8UNojN9EiwSqzdBEQfQckg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(396003)(366004)(346002)(136003)(64756008)(76116006)(66946007)(91956017)(66556008)(66476007)(6506007)(53546011)(966005)(86362001)(2616005)(83380400001)(478600001)(33656002)(7416002)(2906002)(36756003)(6916009)(8936002)(6512007)(186003)(8676002)(4326008)(316002)(83080400001)(66446008)(71200400001)(6486002)(54906003)(26005)(5660300002)(266184004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 HicB9/grW8tJ4683TKqL9B0eSMQ5xhQvyTdLqx+c3C8ums9WQ9PfVZRfDU/EsphSfvhGuHvtjlOejmJdlIDr/PPF+UHf70WMVf5jjaDP7gaQKPszqSx8F1VmP4kmRJcztPGJpUmIWoCUu8FuQ8ns2CI4W5xig2GZsAD7cDJHKamh3xvj4B5g0EhUpcsKlkHmel/BsKyENpc0ry8JHoi1Va5g6W/LQ56o1i0brWdsnx+j8Ybr1SiJQCajuJTrplMV/lDeLLrqShkpLq5Ac7IKHyZAvEvTrEV/8++/mnpD0M4lTV5klfyNUCunSgoR+8vTvT1dScDkfeFBAwoojEmolE0eULAD1t39NazIJsizEWrklVJSYSQCy98Yl4SSYGc2iLAAO01EPBibsoPPGWC1gL8g8N4ciXzamjwnH+GkBxxZ5epkhSKTlmEAbsnDG3sQJPibYlLyT9azJ79fn69clQ6nSFXjgAE3zdKoyZXUZK/y0fvca2mnMGdC5vCzKrUmXGaPp6pcgNS4eX9ds7gHmwYNo6puz7uG+QDoh8Go+JMJIDm5B/jOcjcC4H1vO3dz9hXKp7eqfzvcLOGKq6YonMiUwIBPbKw6Qw0E4wmrfjkqIIbB3s3iYlifV46gdWV5GWYzc4i/uJT6HD42ASl7Ig==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E5BDB9D54BE0A742AAA0C2518088FA42@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3388
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d81d2d84-ef7b-4e69-aea6-08d866c1e5aa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YaI8A7Xo+z7xgmarpM9TJU1YhRhabmlsAJfiBQEk7F6ig1PS0lZb66X+kj7N8GB71YBPm7mLRhNTSE8YR1J/4W33g+wQkWzS89UKVCv6O2L6UNXQ1+H1cBa5EpJET5i5OVjUCX+0NZoKQFbCFYWGNopwTMPJKZ7zqqOJgnei8pkgD+jxlXpvlXvLWJIDTqD9Y1IFLEkI7CHwinxMfLN6IYGb1ivSlEbNuOWx/6jgjgvrMOYZXeF9Bn/hNwPQyIwkQsWdViH4RSuD2XwUichLz5DAp6AIHyo/zsBxaiBafFHIwhs9enyaNs/1HRrI/GzbF5XatV3l9fC2/U2DK6b7VIMi3elc5xDhoEGcA1wCaQU5ly/Wt4CUCAMllhvaqIaBwUfCOxYQKoZBn3NW1aXdaVfzH+IhNsMHKrN1ZiyZrodL8FEfuKGhcwyVLNa6jf8JCv+UXwzU5xyq23pOklH1XKJzjg/RK6QMqs0wlwPFgnq1NLvNsFuB45xHjK2iKFOX
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(39850400004)(136003)(396003)(46966005)(5660300002)(478600001)(81166007)(8676002)(966005)(26005)(82310400003)(54906003)(186003)(316002)(4326008)(36906005)(83380400001)(2616005)(70586007)(70206006)(6486002)(6512007)(33656002)(83080400001)(36756003)(8936002)(356005)(6862004)(107886003)(82740400003)(53546011)(336012)(6506007)(2906002)(47076004)(86362001)(266184004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2020 10:57:12.4553
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06033e38-0be6-4b02-9ebd-08d866c1eab6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5785

Hi Christopher,

> On 2 Oct 2020, at 07:25, Christopher Clark <christopher.w.clark@gmail.com=
> wrote:
>=20
> On Thu, Oct 1, 2020 at 7:38 AM Bertrand Marquis
> <Bertrand.Marquis@arm.com> wrote:
>>=20
>> Hi George,
>>=20
>> + Christopher Clark to have his view on what to put for Yocto.
>>=20
>>> On 30 Sep 2020, at 13:57, George Dunlap <george.dunlap@citrix.com> wrot=
e:
>>>=20
>>> Define a specific criteria for how we determine what tools and
>>> libraries to be compatible with.  This will clarify issues such as,
>>> "Should we continue to support Python 2.4" moving forward.
>>>=20
>>> Note that CentOS 7 is set to stop receiving "normal" maintenance
>>> updates in "Q4 2020"; assuming that 4.15 is released after that, we
>>> only need to support CentOS / RHEL 8.
>>>=20
>>> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
>>> ---
>>>=20
>>> CC: Ian Jackson <ian.jackson@citrix.com>
>>> CC: Wei Liu <wl@xen.org>
>>> CC: Andrew Cooper <andrew.cooper3@citrix.com>
>>> CC: Jan Beulich <jbeulich@suse.com>
>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>> CC: Julien Grall <julien@xen.org>
>>> CC: Rich Persaud <persaur@gmail.com>
>>> CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
>>> ---
>>> docs/index.rst                        |  2 +
>>> docs/policies/dependency-versions.rst | 76 +++++++++++++++++++++++++++
>>> 2 files changed, 78 insertions(+)
>>> create mode 100644 docs/policies/dependency-versions.rst
>>>=20
>>> diff --git a/docs/index.rst b/docs/index.rst
>>> index b75487a05d..ac175eacc8 100644
>>> --- a/docs/index.rst
>>> +++ b/docs/index.rst
>>> @@ -57,5 +57,7 @@ Miscellanea
>>> -----------
>>>=20
>>> .. toctree::
>>> +   :maxdepth: 1
>>>=20
>>> +   policies/dependency-versions
>>>   glossary
>>> diff --git a/docs/policies/dependency-versions.rst b/docs/policies/depe=
ndency-versions.rst
>>> new file mode 100644
>>> index 0000000000..d5eeb848d8
>>> --- /dev/null
>>> +++ b/docs/policies/dependency-versions.rst
>>> @@ -0,0 +1,76 @@
>>> +.. SPDX-License-Identifier: CC-BY-4.0
>>> +
>>> +Build and runtime dependencies
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>>> +
>>> +Xen depends on other programs and libraries to build and to run.
>>> +Chosing a minimum version of these tools to support requires a careful
>>> +balance: Supporting older versions of these tools or libraries means
>>> +that Xen can compile on a wider variety of systems; but means that Xen
>>> +cannot take advantage of features available in newer versions.
>>> +Conversely, requiring newer versions means that Xen can take advantage
>>> +of newer features, but cannot work on as wide a variety of systems.
>>> +
>>> +Specific dependencies and versions for a given Xen release will be
>>> +listed in the toplevel README, and/or specified by the ``configure``
>>> +system.  This document lays out the principles by which those versions
>>> +should be chosen.
>>> +
>>> +The general principle is this:
>>> +
>>> +    Xen should build on currently-supported versions of major distros
>>> +    when released.
>>> +
>>> +"Currently-supported" means whatever that distro's version of "full
>>> +support".  For instance, at the time of writing, CentOS 7 and 8 are
>>> +listed as being given "Full Updates", but CentOS 6 is listed as
>>> +"Maintenance updates"; under this criterium, we would try to ensure
>>> +that Xen could build on CentOS 7 and 8, but not on CentOS 6.
>>> +
>>> +Exceptions for specific distros or tools may be made when appropriate.
>>> +
>>> +One exception to this is compiler versions for the hypervisor.
>>> +Support for new instructions, and in particular support for new safety
>>> +features, may require a newer compiler than many distros support.
>>> +These will be specified in the README.
>>> +
>>> +Distros we consider when deciding minimum versions
>>> +--------------------------------------------------
>>> +
>>> +We currently aim to support Xen building and running on the following =
distributions:
>>> +Debian_,
>>> +Ubuntu_,
>>> +OpenSUSE_,
>>> +Arch Linux,
>>> +SLES_,
>>> +Yocto_,
>>> +CentOS_,
>>> +and RHEL_.
>>> +
>>> +.. _Debian: https://www.debian.org/releases/
>>> +.. _Ubuntu: https://wiki.ubuntu.com/Releases
>>> +.. _OpenSUSE: https://en.opensuse.org/Lifetime
>>> +.. _SLES: https://www.suse.com/lifecycle/
>>> +.. _Yocto: https://wiki.yoctoproject.org/wiki/Releases
>>> +.. _CentOS: https://wiki.centos.org/About/Product
>>> +.. _RHEL: https://access.redhat.com/support/policy/updates/errata
>>> +
>>> +Specific distro versions supported in this release
>>> +--------------------------------------------------
>>> +
>>> +=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>>> +Distro   Supported releases
>>> +=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>>> +Debian   10 (Buster)
>>> +Ubuntu   20.10 (Groovy Gorilla), 20.04 (Focal Fossa), 18.04 (Bionic Be=
aver), 16.04 (Xenial Xerus)
>>> +OpenSUSE Leap 15.2
>>> +SLES     SLES 11, 12, 15
>>> +Yocto    3.1 (Dunfell)
>>=20
>> Yocto only supports one version of Xen (as there is usually only one xen=
 recipe per yocto version)
>=20
> I'm not sure that's totally accurate: the Yocto Xen recipes are
> written to support backwards compatibility with older versions of Xen.
> In general, care and effort has been expended to support building with
> multiple versions of Xen with the same recipes, via variable override
> or bbappend, and it is expected to work.

I agree when the latest version of meta-virtualization is used (at least
for now).

>=20
>> which can make the version here a bit tricky:
>> Yocto 3.1 (Dunfell) supports only Xen 4.12
>> Yocto 3.2 (Gategarth) support only Xen 4.14 but has a Yocto master recip=
e which should actually be used
>> by someone who would want to try Xen master.
>>=20
>> So I would suggest to put Yocto 3.2 here only.
>>=20
>> @Christopher: what is your view here ?
>=20
> Thanks for asking. I don't quite agree with that recommendation: I
> think Dunfell does belong, with an indication that it requires
> Gatesgarth meta-virtualization. Dunfell is the LTS release, so a
> compatibility statement about it is important. ie:
>=20
> Yocto 3.1 (Dunfell + Gatesgarth meta-virtualization)

Agree this is what we should say and add:

Yocto 3.2 (Gatesgarth)

>=20
> Effort has already been made within Yocto to make the Gatesgarth
> meta-virtualization layer compatible with Dunfell open-embedded core,
> specifically to allow newer Xen to be used with the LTS Dunfell
> software from the core layers. I would hope that any issues that are
> found with that configuration will be posted so they can be fixed.
>=20

I must admit i never tested the combination that way but I will check
if such a scenario could be added to the tests we define internally at arm.

Thanks for the answers

Cheers
Bertrand

> thanks,
>=20
> Christopher
>=20
>>=20
>> Cheers
>> Bertrand
>>=20
>>> +CentOS   8
>>> +RHEL     8
>>> +=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>>> +
>>> +.. note::
>>> +
>>> +   We also support Arch Linux, but as it's a rolling distribution, the
>>> +   concept of "security supported releases" doesn't really apply.
>>> --
>>> 2.25.1


