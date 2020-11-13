Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B7C2B14C6
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 04:39:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26143.54318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdPtz-0006kw-8j; Fri, 13 Nov 2020 03:37:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26143.54318; Fri, 13 Nov 2020 03:37:31 +0000
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
	id 1kdPtz-0006ke-4L; Fri, 13 Nov 2020 03:37:31 +0000
Received: by outflank-mailman (input) for mailman id 26143;
 Fri, 13 Nov 2020 03:37:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A7JU=ET=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
 id 1kdPtx-0006kZ-KE
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 03:37:29 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.61]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9af8360e-87e7-4442-b76b-7cdd86fab588;
 Fri, 13 Nov 2020 03:37:25 +0000 (UTC)
Received: from DB8PR09CA0015.eurprd09.prod.outlook.com (2603:10a6:10:a0::28)
 by VI1PR08MB3438.eurprd08.prod.outlook.com (2603:10a6:803:82::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Fri, 13 Nov
 2020 03:37:22 +0000
Received: from DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:a0:cafe::3d) by DB8PR09CA0015.outlook.office365.com
 (2603:10a6:10:a0::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Fri, 13 Nov 2020 03:37:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT049.mail.protection.outlook.com (10.152.20.191) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.22 via Frontend Transport; Fri, 13 Nov 2020 03:37:21 +0000
Received: ("Tessian outbound d6c201accd3c:v71");
 Fri, 13 Nov 2020 03:37:21 +0000
Received: from a18beaaadc77.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5F0C8A1A-858E-49D6-B966-86CA4C778116.1; 
 Fri, 13 Nov 2020 03:37:16 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a18beaaadc77.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 13 Nov 2020 03:37:16 +0000
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com (2603:10a6:208:105::24)
 by AM4PR0802MB2194.eurprd08.prod.outlook.com (2603:10a6:200:5c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 13 Nov
 2020 03:37:14 +0000
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::257f:eb47:fe85:5993]) by AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::257f:eb47:fe85:5993%3]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 03:37:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=A7JU=ET=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
	id 1kdPtx-0006kZ-KE
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 03:37:29 +0000
X-Inumbo-ID: 9af8360e-87e7-4442-b76b-7cdd86fab588
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown [40.107.6.61])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 9af8360e-87e7-4442-b76b-7cdd86fab588;
	Fri, 13 Nov 2020 03:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zR0mUZEINPlIFc+O7RnwFQBxekV/jcU5KdwgczRi60M=;
 b=v9JxjQLSHyP4nIODSBzlRT8vCrO6QHuh4E/aOZ3prVZSIqE7DWZiTytniRnHwMlTG3cA9kL6wW1eXSQCctHcdKvHGhsq5Zq+sBKBawXFMfKMfFVCuqTPskVKcdgZtx+sNroBMIS+jlmKTuuOlu3Y7CM+NpDvSgO12vrWB6qF3YY=
Received: from DB8PR09CA0015.eurprd09.prod.outlook.com (2603:10a6:10:a0::28)
 by VI1PR08MB3438.eurprd08.prod.outlook.com (2603:10a6:803:82::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Fri, 13 Nov
 2020 03:37:22 +0000
Received: from DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:a0:cafe::3d) by DB8PR09CA0015.outlook.office365.com
 (2603:10a6:10:a0::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Fri, 13 Nov 2020 03:37:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT049.mail.protection.outlook.com (10.152.20.191) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.22 via Frontend Transport; Fri, 13 Nov 2020 03:37:21 +0000
Received: ("Tessian outbound d6c201accd3c:v71"); Fri, 13 Nov 2020 03:37:21 +0000
X-CR-MTA-TID: 64aa7808
Received: from a18beaaadc77.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5F0C8A1A-858E-49D6-B966-86CA4C778116.1;
	Fri, 13 Nov 2020 03:37:16 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a18beaaadc77.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 13 Nov 2020 03:37:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b1Ru7VTtiEUSGEeOqAi0ZkotkkGXew2wlvI4liyRbuMewFTWlmo8/0cfuNC8M/e4zlZmSJMdCmru35h7xowWh5m53DqMjZ28g1BxfxAg6Fz9HcSpcnrNw/G5k8ovoxiEvFrzlN8qv3iWSsT4sDqF+xNxQvuKd2EDWvIvNMpTlAy59PrnQMrdgVqM64CUC3rYIDLPnSKOB4G53AiOnr7lRXTpuoRSUXHTlQmc9NTdxYmkWgHG2weFumDVrOgTlVdXOgSwiOfV59i44/wKjWaocC4owIGVlFEPIYrud8NhddK1NvUrPxtSzaSlqVzAB6v4QGdjs2kn/0Q0oWECNy/gcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zR0mUZEINPlIFc+O7RnwFQBxekV/jcU5KdwgczRi60M=;
 b=jz/11U3/membc8fytqg7Q0FrwwxzZZseC/RsEtWlyuNTO6LG+EjRlwFqqGOTB6oZnP/IWnaH6wUQdYz0dul8WAPx813Ru5j7ztF0IBf+AIGURg9IMcZ6PJ7KN4RAR4WgKJYEAGUHkPC95rlF/y0aJF+9J5uTU+4Au/gbebKw1NjNITRblPju7gSafKyhJrCQisJMhulJu4aVSm9q5KgrZc1G5IhVRlEuHGJpiQvyVltVSQNPxf26xIzsfgvt027SooEUvk4wEL2ekI60KyYtAc6peqPXX36tqrAnB0MPJ9NHaSzHp3cxGSMCECsvsQhRy1FUKSdnGpRU6AGhSkIzPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zR0mUZEINPlIFc+O7RnwFQBxekV/jcU5KdwgczRi60M=;
 b=v9JxjQLSHyP4nIODSBzlRT8vCrO6QHuh4E/aOZ3prVZSIqE7DWZiTytniRnHwMlTG3cA9kL6wW1eXSQCctHcdKvHGhsq5Zq+sBKBawXFMfKMfFVCuqTPskVKcdgZtx+sNroBMIS+jlmKTuuOlu3Y7CM+NpDvSgO12vrWB6qF3YY=
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com (2603:10a6:208:105::24)
 by AM4PR0802MB2194.eurprd08.prod.outlook.com (2603:10a6:200:5c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 13 Nov
 2020 03:37:14 +0000
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::257f:eb47:fe85:5993]) by AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::257f:eb47:fe85:5993%3]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 03:37:14 +0000
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, Penny Zheng <Penny.Zheng@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>
CC: Andre Przywara <Andre.Przywara@arm.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Kaly Xin <Kaly.Xin@arm.com>, nd <nd@arm.com>
Subject: RE: [PATCH] xen/arm: Add Cortex-A73 erratum 858921 workaround
Thread-Topic: [PATCH] xen/arm: Add Cortex-A73 erratum 858921 workaround
Thread-Index: AQHWtnF2jWNIb4RgFU+PRE0mwpdPDam/tA6AgAW2ODA=
Date: Fri, 13 Nov 2020 03:37:14 +0000
Message-ID:
 <AM0PR08MB3747B42FC856B9BDF24646629EE60@AM0PR08MB3747.eurprd08.prod.outlook.com>
References: <20201109082110.1133996-1-penny.zheng@arm.com>
 <cfa63398-8182-b79f-1602-ed068e2319ad@xen.org>
In-Reply-To: <cfa63398-8182-b79f-1602-ed068e2319ad@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 7D0166FA7B196B4598FBD5E8DBA35998.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [218.82.32.45]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 026a6021-6e2a-46ab-db0d-08d887856dd3
x-ms-traffictypediagnostic: AM4PR0802MB2194:|VI1PR08MB3438:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB34387C65945CD0C2B0590EA29EE60@VI1PR08MB3438.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2150;OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 I+4mKJdh5SFu4PsgkHxWw4htiFROvPjE+sqTZjITt6GEbW6eD89/HJtawl1XjvUxe8sMRMBJJkgn4fEO8BPEXGp38oCMwlmQcJTNktl6QwyDJACYM2tKvh/RQf4xq1gaEXTRIP+3Tj4rmPzgRPcCgM/Y4fSly9uX7Z6eNCke32cXfoCppwAPqmyjY4MVWzM1atqubzUXXiVCLq8x5wX3juCqFzP/OGQ3CogpLoa0HbkU2iUlD+o0mNmMiJNY3FIrmMQLD6AFo1D4HUuXQMhIuCs6URuS4SZwxH66qIsZahlbC7ZioNHCFpLVHiqMXqs/YuyTbKarEnaxzzGGenOE+A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3747.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(366004)(346002)(376002)(478600001)(2906002)(86362001)(33656002)(71200400001)(8936002)(110136005)(8676002)(66446008)(186003)(66476007)(66946007)(66556008)(52536014)(7696005)(4326008)(26005)(76116006)(9686003)(64756008)(5660300002)(316002)(54906003)(55016002)(83380400001)(6506007)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 bORqsTBdORe6sXnhUNaSB+JYs/jqZsQbJX0iWEqJQGMCd9NfCXXA4HrJ9vXCX98SYQ4jImDFDhRjLdM0eafC890Zym4lHGC9EIL3DhNVtAxiHtkY8jwguE5SYXRlJ8HLLw5cxHXcZRsNBagTU7J1YLLzD2QVgQ1C40kRJu86Kx9wnnSfmZnss5gNgtQr5U64Plz+qGcYpc7+i2CE0tb9MdwQFJQ/p3hHqfQq137k20OdFLV73Ke24j2JDfFs6MxGKoFVvw37tw+3os6Tz3K2z6bfX3o3jq84nuhSLt3lmWe8SkArHI91QojssX6kT/qrhKDST7wqz87tTAjwUXjDADONjsOgbEwNwCLSlGTSWChn9tO11MlXcGomWoNSAU9TW0hUmQK368+j1M5jPpXGCkk+uD2uFRXgMTAC+Ulb/hJIHc7ihqn9awLZfjMtOlMI5tigISqC8d2Edd3Sg65tCyNEjXAmtE1XTjDBSWfRNRcstAtON/mLPtPtcEOVJEaaRa8TVp2lrkIzDuq4vZJeqNMAhW0rdYjJzjVQNmaJMTTeT+zyMht5ABQKDPpKmaN+GRxs5huNXMlN9zDejkb4Np5ttT2ituD4B8qgGuUbNNnSXWkJB6g24EetAORgvSVrzssjOEdwvTA5HQSV/1t470IaBDGyhfFzxB8u2HYRqE0pN+TCXmRhKqH3oeAj+ea3jKAorPRsCnde426yRgGSKWCQTeuoOpooJz0T2XTYF4J18pznI6LK25+16xIidfT2grVdfGthedcGSXhyTjk6655IubGv8Pmshncmw4wiI7HfbgwZSeBbzHNUZiQoP/ve/ps6+ApqCFCGzy/3jxTEejrdBA3n9UTfA9CCz/j9OaBf6viRLnmTCVNY/Zbs/DQ56Pr4c9s+xH1rLWw1WDaqtw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2194
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	990f2e78-8a7f-46ff-8a28-08d887856983
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bIxonP7Ae7aEm04vQcamyhG0iHmF8ugh/PLgPIgJ89hK7/kndg4BhTTC9J5r9Oh20e4pdYi2RWxFtRpYbynv+BgS//M9dyQv8yMGfEsAThvN+YOit+cLK7jo/ZCPcizx0uFoiufIu+LgbHZ2WSdHfIMPfkcbAWXfR/u50aMQB8yNPzNGkncUe2ctjNQYujf/w6P63LUxfUxoRmSC33K8dZVeUhTp+Hnym+j+8tWc5BE62ecDt1DsgcsjptMuhOyx3Djw0TttwamiTNRhg40eVo4ZWiYloWCapfELck+CAW+XnSyleOjDNnXClFsnw1tOfOWa4yJJTc12tu7yBHPqoDsWk3Riqo3thAv9UM0NyQanm8k2dcS5cDoVSUyYiWrdLoYaqznkLfD/9wyzsArO3w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(46966005)(26005)(5660300002)(7696005)(110136005)(54906003)(47076004)(316002)(83380400001)(4326008)(186003)(82310400003)(52536014)(336012)(82740400003)(33656002)(356005)(2906002)(8936002)(53546011)(81166007)(70206006)(478600001)(55016002)(70586007)(6506007)(9686003)(8676002)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2020 03:37:21.5796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 026a6021-6e2a-46ab-db0d-08d887856dd3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3438

SEkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjDlubQxMeaciDnml6UgMjA6MDQN
Cj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnDQo+IENjOiBBbmRyZSBQ
cnp5d2FyYSA8QW5kcmUuUHJ6eXdhcmFAYXJtLmNvbT47IEJlcnRyYW5kIE1hcnF1aXMNCj4gPEJl
cnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgS2Fs
eSBYaW4NCj4gPEthbHkuWGluQGFybS5jb20+OyBuZCA8bmRAYXJtLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSF0geGVuL2FybTogQWRkIENvcnRleC1BNzMgZXJyYXR1bSA4NTg5MjEgd29ya2Fy
b3VuZA0KPiANCj4gSGksDQo+IA0KPiBPbiAwOS8xMS8yMDIwIDA4OjIxLCBQZW5ueSBaaGVuZyB3
cm90ZToNCj4gPiBDTlRWQ1RfRUwwIG9yIENOVFBDVF9FTDAgY291bnRlciByZWFkIGluIENvcnRl
eC1BNzMgKGFsbCB2ZXJzaW9ucykNCj4gPiBtaWdodCByZXR1cm4gYSB3cm9uZyB2YWx1ZSB3aGVu
IHRoZSBjb3VudGVyIGNyb3NzZXMgYSAzMmJpdCBib3VuZGFyeS4NCj4gPg0KPiA+IFVudGlsIG5v
dywgdGhlcmUgaXMgbm8gY2FzZSBmb3IgWGVuIGl0c2VsZiB0byBhY2Nlc3MgQ05UVkNUX0VMMCwN
Cj4gPiBhbmQgaXQgYWxzbyBzaG91bGQgYmUgdGhlIEd1ZXN0IE9TJ3MgcmVzcG9uc2liaWxpdHkg
dG8gZGVhbCB3aXRoDQo+ID4gdGhpcyBwYXJ0Lg0KPiA+DQo+ID4gQnV0IGZvciBDTlRQQ1QsIHRo
ZXJlIGV4aXN0cyBzZXZlcmFsIGNhc2VzIGluIFhlbiBpbnZvbHZpbmcgcmVhZGluZw0KPiA+IENO
VFBDVCwgc28gYSBwb3NzaWJsZSB3b3JrYXJvdW5kIGlzIHRoYXQgcGVyZm9ybWluZyB0aGUgcmVh
ZCB0d2ljZSwNCj4gPiBhbmQgdG8gcmV0dXJuIG9uZSBvciB0aGUgb3RoZXIgZGVwZW5kaW5nIG9u
IHdoZXRoZXIgYSB0cmFuc2l0aW9uIGhhcw0KPiA+IHRha2VuIHBsYWNlLg0KPiA+DQo+ID4gU2ln
bmVkLW9mZi1ieTogUGVubnkgWmhlbmcgPHBlbm55LnpoZW5nQGFybS5jb20+DQo+IA0KPiBBY2tl
ZC1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCj4gDQo+IE9uIGEgcmVsYXRl
ZCB0b3BpYywgZG8gd2UgbmVlZCBhIGZpeCBzaW1pbGFyIHRvIExpbnV4IGNvbW1pdA0KPiA3NWEx
OWEwMjAyZGIgImFybTY0OiBhcmNoX3RpbWVyOiBFbnN1cmUgY291bnRlciByZWdpc3RlciByZWFk
cyBvY2N1cg0KPiB3aXRoIHNlcWxvY2sgaGVsZCI/DQo+IA0KDQpJIHRha2UgYSBsb29rIGF0IHRo
aXMgTGludXggY29tbWl0LCBpdCBzZWVtcyB0byBwcmV2ZW50IHRoZSBzZXEtbG9jayB0byBiZQ0K
c3BlY3VsYXRlZC4gIFVzaW5nIGFuIGVuZm9yY2Ugb3JkZXJpbmcgaW5zdGVhZCBvZiBJU0IgYWZ0
ZXIgdGhlIHJlYWQgY291bnRlcg0Kb3BlcmF0aW9uIHNlZW1zIHRvIGJlIGZvciBwZXJmb3JtYW5j
ZSByZWFzb25zLg0KDQpJIGhhdmUgZm91bmQgdGhhdCB5b3UgaGFkIHBsYWNlZCBhbiBJU0IgYmVm
b3JlIHJlYWQgY291bnRlciBpbiBnZXRfY3ljbGVzDQp0byBwcmV2ZW50IGNvdW50ZXIgdmFsdWUg
dG8gYmUgc3BlY3VsYXRlZC4gQnV0IHlvdSBoYXZlbid0IHBsYWNlZCB0aGUgc2Vjb25kDQpJU0Ig
YWZ0ZXIgcmVhZGluZy4gSXMgaXQgYmVjYXVzZSB3ZSBoYXZlbid0IHVzZWQgdGhlIGdldF9jeWNs
ZXMgaW4gc2VxIGxvY2sNCmNyaXRpY2FsIGNvbnRleHQgKE1heWJlIEkgZGlkbid0IGZpbmQgdGhl
IHJpZ2h0IHBsYWNlKT8gU28gc2hvdWxkIHdlIG5lZWQgdG8gZml4IGl0DQpub3csIG9yIHlvdSBw
cmVmZXIgdG8gZml4IGl0IG5vdyBmb3IgZnV0dXJlIHVzYWdlPw0KDQpSZWdhcmRzLA0KV2VpIENo
ZW4NCg0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

