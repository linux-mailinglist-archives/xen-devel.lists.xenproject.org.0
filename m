Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB77F285B63
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 10:57:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3344.9699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ5Fg-0002GX-Tf; Wed, 07 Oct 2020 08:56:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3344.9699; Wed, 07 Oct 2020 08:56:48 +0000
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
	id 1kQ5Fg-0002G8-QX; Wed, 07 Oct 2020 08:56:48 +0000
Received: by outflank-mailman (input) for mailman id 3344;
 Wed, 07 Oct 2020 08:56:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MWE0=DO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kQ5Ff-0002G3-Su
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 08:56:47 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.88]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 93aea2a4-3a21-4b9e-8083-551a3076f43b;
 Wed, 07 Oct 2020 08:56:46 +0000 (UTC)
Received: from AM5PR0502CA0017.eurprd05.prod.outlook.com
 (2603:10a6:203:91::27) by DB8PR08MB5467.eurprd08.prod.outlook.com
 (2603:10a6:10:11b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Wed, 7 Oct
 2020 08:56:44 +0000
Received: from AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::e5) by AM5PR0502CA0017.outlook.office365.com
 (2603:10a6:203:91::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21 via Frontend
 Transport; Wed, 7 Oct 2020 08:56:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT060.mail.protection.outlook.com (10.152.16.160) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Wed, 7 Oct 2020 08:56:44 +0000
Received: ("Tessian outbound 195a290eb161:v64");
 Wed, 07 Oct 2020 08:56:44 +0000
Received: from b616885e88c4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9D54FE8E-8B8E-4137-A182-3BE27843BA29.1; 
 Wed, 07 Oct 2020 08:56:38 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b616885e88c4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Oct 2020 08:56:38 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4821.eurprd08.prod.outlook.com (2603:10a6:10:d5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38; Wed, 7 Oct
 2020 08:56:37 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3455.023; Wed, 7 Oct 2020
 08:56:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MWE0=DO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kQ5Ff-0002G3-Su
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 08:56:47 +0000
X-Inumbo-ID: 93aea2a4-3a21-4b9e-8083-551a3076f43b
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown [40.107.7.88])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 93aea2a4-3a21-4b9e-8083-551a3076f43b;
	Wed, 07 Oct 2020 08:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wVAFq+QOJ1tkIEAjC9X3y8rUyU+ebC1a1YakVtFN3FI=;
 b=Ih9+rDLyRLP9k9RVrr+Q3lvu86RgH4jPPH05NItSiW8ZOCB6q3+T3ykswUBaFnx7jLriJPXMjaz9NFKVahoDfdpG4jpDG7r3UAE2e1YiHTh/TIVz7tJ7nMxwME82cWZ0PQc+nK2bVlWqGu+lK/4O3fcDpPym7w/fP9bB1VeO3FM=
Received: from AM5PR0502CA0017.eurprd05.prod.outlook.com
 (2603:10a6:203:91::27) by DB8PR08MB5467.eurprd08.prod.outlook.com
 (2603:10a6:10:11b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Wed, 7 Oct
 2020 08:56:44 +0000
Received: from AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::e5) by AM5PR0502CA0017.outlook.office365.com
 (2603:10a6:203:91::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21 via Frontend
 Transport; Wed, 7 Oct 2020 08:56:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT060.mail.protection.outlook.com (10.152.16.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Wed, 7 Oct 2020 08:56:44 +0000
Received: ("Tessian outbound 195a290eb161:v64"); Wed, 07 Oct 2020 08:56:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a7692d0ec485f16c
X-CR-MTA-TID: 64aa7808
Received: from b616885e88c4.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9D54FE8E-8B8E-4137-A182-3BE27843BA29.1;
	Wed, 07 Oct 2020 08:56:38 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b616885e88c4.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 07 Oct 2020 08:56:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KGPoKwhlNg+t38j564yB5vgfDSOSVcoRPkQkwLDAqZUAt1UUxh68b6g4G23XRgfpzEehR3VUQ0sIQAiWC4cfyPzqM6o6wTgZPDAOHhbqe7mhIFKsPyuOyn1rHGAjlbLz5HvRCbqus6uO+A5KkOl0YI/7I+wpcz8UtIByqGdA7ikH4JzAkPd9hQcVjUBYFh83huf2X/+Qx8BXSh5Gq5/veR2o5FpVO96uiO4PQFcQFN/gaXAtvu6WsjCfZ+NoPXejUKe2s3DPu9qhCQgjzwgtUqWv54kywFmFVyWolcolUiN4RGNuywhYj92s9G3sP5Q8maMQmJoI4glsPxVWVQ9mpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wVAFq+QOJ1tkIEAjC9X3y8rUyU+ebC1a1YakVtFN3FI=;
 b=Nx90mLlpZ7frrZm9nDncK0ksoQ53SikFb8yf3itkSMkAIkJKIWhbSC71L85xbj4QylTGwEJUvXcMGr0jpwhYTc7NnJYWurE3k0XqvPbj2E+5vmXMwKGSZwhuocNZ26+aFAY56wnLwixR7M60O6T3l6vKy/NRW7eqDpYOQm2Hobel3Aur8KaSakRzaUvk9DUpfEeSUmR2kyKUobrRxzYZukaJmqSZWTBUcK93gOdfOfiPdR8bbqTlAsGGl8i/QCi93hWs3RMTaTirFOoRxG//H7JcC9BrEvvXD60+wFdEFr/4XUZihFIUWcTAgdFUh7k6+PPhq6TX5enSObEcQAaXOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wVAFq+QOJ1tkIEAjC9X3y8rUyU+ebC1a1YakVtFN3FI=;
 b=Ih9+rDLyRLP9k9RVrr+Q3lvu86RgH4jPPH05NItSiW8ZOCB6q3+T3ykswUBaFnx7jLriJPXMjaz9NFKVahoDfdpG4jpDG7r3UAE2e1YiHTh/TIVz7tJ7nMxwME82cWZ0PQc+nK2bVlWqGu+lK/4O3fcDpPym7w/fP9bB1VeO3FM=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4821.eurprd08.prod.outlook.com (2603:10a6:10:d5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38; Wed, 7 Oct
 2020 08:56:37 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3455.023; Wed, 7 Oct 2020
 08:56:37 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/2] tools: use memcpy instead of strncpy in getBridge
Thread-Topic: [PATCH v2 1/2] tools: use memcpy instead of strncpy in getBridge
Thread-Index: AQHWnIQKr7DQ0C+zLEGkNYhGKt2Q8KmL0a8AgAAEzgA=
Date: Wed, 7 Oct 2020 08:56:36 +0000
Message-ID: <B3E4C5D5-5999-4D92-8F56-FFA7019CD9BA@arm.com>
References:
 <bc191370356c300f84a16d10345d4a0d646f5bae.1601977978.git.bertrand.marquis@arm.com>
 <30a4ddc0-9443-ab02-341c-ae08af7fddea@suse.com>
In-Reply-To: <30a4ddc0-9443-ab02-341c-ae08af7fddea@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 75e22858-57ae-4e8b-8962-08d86a9eea9d
x-ms-traffictypediagnostic: DBBPR08MB4821:|DB8PR08MB5467:
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB5467D109776853A2D1BAE7329D0A0@DB8PR08MB5467.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3631;OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 BSJsjAuInXfMY+6kVNbzeCbMPt3I3DG0E6kBZP8XlVX1a+0gAW0UK6hNyU3lJ6Mzv5AQ0YJpOLAakKjf4rPqKh9OmZ5yvoH54XP3yFAfmRptA52hyMZDP6jwHIlf/PJE3FazkouNWkVZBET3AKxDz3SjvEPjp0+DTHvTWyCyLcFQazNPhIdXeNuzF78wX8oQX9VmzazH4a880QUzeqmnGLOuA35fT5W350ZXWcZgKac6oKFoW9lskcPliguMstJ8Mn1VIGK4uHf7FOo9WviEo9IgL8/80LI5CkaaA43bXcKkd54PTpuyth/m2xI6jQL/GeD6sCD2fl2lD5kw4Mtw8A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39850400004)(8676002)(4326008)(6486002)(36756003)(2616005)(186003)(6506007)(71200400001)(86362001)(26005)(53546011)(478600001)(33656002)(64756008)(66574015)(66446008)(6512007)(8936002)(6916009)(5660300002)(54906003)(66556008)(2906002)(91956017)(66476007)(66946007)(316002)(76116006)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 d80+1FdvQFkBc5NFBrZMKayyjNy4QvyJ4zM8A2bewiOLLQHWCBxFy+79X7UhYi5M+/9XNrfQr0uGdkb+jKiDoVZBovr3YmRLiHMJSI3f1f3+shpe5bJ94ch8nvZkC8GIoxUTgdSyfwgmiq4KYj/0IwtIJjrLNz33TRFVTJpFM95mahUqC2B0SItkx1Qh4HvKfpEzGGW1787uF85Are1kAlNzFOAvlFbqT1nDo4aY2a7nBVSeLkxsidmyWDHgXONKThrUCrejaZlQZOfMZUYpHpK3rbecq+2JbXdbIhG4Y2K13SnNxRPQKKHie51OMIrJ5djssYAos2675y5TcH/yXT8NVvcfXpHMlnbudD2sRIAnZe3LFPETDsAVk7l2BYgRyJzhBZmvm5q9ssMrflev77xc7y2KuNR4ffe9x56xDJTO4Wh5QkmlMV9j7EhMvwWz3ty3zLTNLdFfqXnMnHcFBNv3ESy04wmGKur66hI+OZGuMjhga6GkuS40oRLuqLgSDz3qStAflAafWNQKNXfKGpIcXBcpBQ6Q4sWdEzNodUd23ycPtGBRdlZXUHpBOgGEcVxzkg1iEb34p7tZZTrMFUHZuecV8r5WEf6IebUbvP4glqT8TVjWInHDtRYouEvWZYKcBCC0owHC6u1i3ZAWmA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <404D573332400E41A0F44255F3FD5EA1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4821
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	663a989f-522e-49f1-d2cc-08d86a9ee618
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QkqMdzIVefGEt+0zpXJBnu/BOY2TG8oOFZqJjozKqQyj3yav0tUI/O+Fd/HmO6s5Acgh8PjeZj3+NdwfVdLv96kqvXwJqPsiNkpsjiwwtcbfseeqy+aAvsEQlX6syjr6u6GMGzxyb7tPmfj79mpsuPVlCOi0AokAY3tfnyqiKuKij2MyPszBCrmZL9c0xtBnvyK9MVk3owgGvhhejx3rl6tv9rJSEgAAHox6pn/TMhwFS8frnuHgnYd2J1Z7Oci6ZvBAOUtT6jSbLT+8SBCRJGgZr6NUtx27KDp4SJE+nN3Ep+DsGAEditXvaCFy1eClzaTLKmJjxD/NFL3oPOK0B7qLMIVf6gtwZLLxwPZRuvK7YdXQyVgjvYL/Wfhth+vspNlwr4WJyKvKWN0lhB/hCA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39850400004)(396003)(376002)(136003)(46966005)(36906005)(81166007)(6512007)(6862004)(6506007)(47076004)(70206006)(6486002)(356005)(8676002)(53546011)(4326008)(8936002)(5660300002)(26005)(2616005)(86362001)(33656002)(2906002)(83380400001)(36756003)(336012)(82310400003)(82740400003)(70586007)(478600001)(66574015)(186003)(54906003)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2020 08:56:44.5881
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e22858-57ae-4e8b-8962-08d86a9eea9d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5467

SGkgSnVyZ2VuLA0KDQo+IE9uIDcgT2N0IDIwMjAsIGF0IDA5OjM5LCBKw7xyZ2VuIEdyb8OfIDxq
Z3Jvc3NAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMDcuMTAuMjAgMTA6MjgsIEJlcnRyYW5k
IE1hcnF1aXMgd3JvdGU6DQo+PiBVc2UgbWVtY3B5IGluIGdldEJyaWRnZSB0byBwcmV2ZW50IGdj
YyB3YXJuaW5ncyBhYm91dCB0cnVuY2F0ZWQNCj4+IHN0cmluZ3MuIFdlIGtub3cgdGhhdCB3ZSBt
aWdodCB0cnVuY2F0ZSBpdCwgc28gdGhlIGdjYyB3YXJuaW5nDQo+PiBoZXJlIGlzIHdyb25nLg0K
Pj4gUmV2ZXJ0IHByZXZpb3VzIGNoYW5nZSBjaGFuZ2luZyBidWZmZXIgc2l6ZXMgYXMgYmlnZ2Vy
IGJ1ZmZlcnMNCj4+IGFyZSBub3QgbmVlZGVkLg0KPj4gU2lnbmVkLW9mZi1ieTogQmVydHJhbmQg
TWFycXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPg0KPj4gLS0tDQo+PiBDaGFuZ2VzIGlu
IHYyOg0KPj4gIFVzZSBNSU4gYmV0d2VlbiBzdHJpbmcgbGVuZ3RoIG9mIGRlLT5kX25hbWUgYW5k
IHJlc3VsdExlbiB0byBjb3B5IG9ubHkNCj4+ICB0aGUgbWluaW11bSBzaXplIHJlcXVpcmVkIGFu
ZCBwcmV2ZW50IGNyb3NzaW5nIHRvIGZyb20gYW4gdW5hbGxvY2F0ZWQNCj4+ICBzcGFjZS4NCj4+
IC0tLQ0KPj4gIHRvb2xzL2xpYnMvc3RhdC94ZW5zdGF0X2xpbnV4LmMgfCAxMSArKysrKysrKyst
LQ0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+
PiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlicy9zdGF0L3hlbnN0YXRfbGludXguYyBiL3Rvb2xzL2xp
YnMvc3RhdC94ZW5zdGF0X2xpbnV4LmMNCj4+IGluZGV4IGQyZWU2ZmRhNjQuLjBhY2UwM2FmMWIg
MTAwNjQ0DQo+PiAtLS0gYS90b29scy9saWJzL3N0YXQveGVuc3RhdF9saW51eC5jDQo+PiArKysg
Yi90b29scy9saWJzL3N0YXQveGVuc3RhdF9saW51eC5jDQo+PiBAQCAtMjksNiArMjksNyBAQA0K
Pj4gICNpbmNsdWRlIDxzdHJpbmcuaD4NCj4+ICAjaW5jbHVkZSA8dW5pc3RkLmg+DQo+PiAgI2lu
Y2x1ZGUgPHJlZ2V4Lmg+DQo+PiArI2luY2x1ZGUgPHhlbi10b29scy9saWJzLmg+DQo+PiAgICAj
aW5jbHVkZSAieGVuc3RhdF9wcml2LmgiDQo+PiAgQEAgLTc4LDcgKzc5LDEzIEBAIHN0YXRpYyB2
b2lkIGdldEJyaWRnZShjaGFyICpleGNsdWRlTmFtZSwgY2hhciAqcmVzdWx0LCBzaXplX3QgcmVz
dWx0TGVuKQ0KPj4gIAkJCQlzcHJpbnRmKHRtcCwgIi9zeXMvY2xhc3MvbmV0LyVzL2JyaWRnZSIs
IGRlLT5kX25hbWUpOw0KPj4gICAgCQkJCWlmIChhY2Nlc3ModG1wLCBGX09LKSA9PSAwKSB7DQo+
PiAtCQkJCQlzdHJuY3B5KHJlc3VsdCwgZGUtPmRfbmFtZSwgcmVzdWx0TGVuKTsNCj4+ICsJCQkJ
CS8qDQo+PiArCQkJCQkgKiBEbyBub3QgdXNlIHN0cm5jcHkgdG8gcHJldmVudCBjb21waWxlciB3
YXJuaW5nIHdpdGgNCj4+ICsJCQkJCSAqIGdjYyA+PSAxMC4wDQo+PiArCQkJCQkgKiBJZiBkZS0+
ZF9uYW1lIGlzIGxvbmdlciB0aGVuIHJlc3VsdExlbiB3ZSB0cnVuY2F0ZSBpdA0KPiANCj4gcy90
aGVuL3RoYW4vDQoNCldpbGwgZml4DQoNCj4gDQo+PiArCQkJCQkgKi8NCj4+ICsJCQkJCW1lbWNw
eShyZXN1bHQsIGRlLT5kX25hbWUsIE1JTihzdHJubGVuKGRlLT5kX25hbWUsDQo+PiArCQkJCQkJ
CQkJc2l6ZW9mKGRlLT5kX25hbWUpKSxyZXN1bHRMZW4gLSAxKSk7DQo+IA0KPiBZb3UgY2FuJ3Qg
dXNlIHNpemVvZihkZS0+ZF9uYW1lKSBoZXJlLCBhcyBBRkFJSyB0aGVyZSBpcyBubyBndWFyYW50
ZWUNCj4gdGhhdCBkZS0+ZF9uYW1lIGlzbid0IGUuZy4gZGVmaW5lZCBsaWtlICJjaGFyIGRfbmFt
ZVtdIi4NCj4gDQo+IE15IHN1Z2dlc3Rpb24gdG8gdXNlIE5BTUVfTUFYIGFzIHVwcGVyIGJvdW5k
YXJ5IGZvciB0aGUgbGVuZ3RoIHdhcw0KPiByZWFsbHkgbWVhbnQgdG8gYmUgdXNlZCB0aGF0IHdh
eS4NCj4gDQo+IEFuZCBhZGRpdGlvbmFsbHkgeW91IG1pZ2h0IHdhbnQgdG8gYWRkIDEgdG8gdGhl
IHN0cm5sZW4oKSByZXN1bHQgaW4NCj4gb3JkZXIgdG8gY29weSB0aGUgdHJhaWxpbmcgMC1ieXRl
LCB0b28gKG9yIHlvdSBzaG91bGQgemVybyBvdXQgdGhlDQo+IHJlc3VsdCBidWZmZXIgYmVmb3Jl
IGFuZCBvbWl0IHdyaXRpbmcgdGhlIGZpbmFsIHplcm8gYnl0ZSkuDQo+IA0KPiBUaGlua2luZyBt
b3JlIGFib3V0IGl0IHplcm9pbmcgdGhlIHJlc3VsdCBidWZmZXIgaXMgYmV0dGVyIGFzIGl0IGV2
ZW4NCj4gY292ZXJzIHRoZSB0aGVvcmV0aWNhbCBjYXNlIG9mIE5BTUVfTUFYIGJlaW5nIHNob3J0
ZXIgdGhhbiByZXN1bHRMZW4uDQoNClNldHRpbmcgdGhlIHJlc3VsdCBidWZmZXIgY29tcGxldGVs
eSB0byAwIGFuZCBkb2luZyBhZnRlciBhIGNvcHkgc291bmRzIGxpa2UNCmEgYmlnIGNvbXBsZXhp
dHkuDQoNCkhvdyBhYm91dDoNCmNvcHlzaXplID0gTUlOKHN0cm5sZW4oZGUtPmRfbmFtZSxOQU1F
X01BWCksIHJlc3VsdExlbiAtIDEpOw0KbWVtY3B5KHJlc3VsdCwgZGUtPmRfbmFtZSwgY29weXNp
emUpOw0KcmVzdWx0W2NvcHlzaXplICsgMV0gPSAwDQoNClRoaXMgd291bGQgY292ZXIgdGhlIGNh
c2Ugd2hlcmUgTkFNRV9NQVggaXMgc2hvcnRlciB0aGVuIHJlc3VsdExlbi4NCg0KQ2hlZXJzDQpC
ZXJ0cmFuZA0KDQo+IA0KPiANCj4gSnVlcmdlbg0KDQo=

