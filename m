Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABBE29CF8B
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 11:39:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13503.34167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXird-00043x-67; Wed, 28 Oct 2020 10:39:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13503.34167; Wed, 28 Oct 2020 10:39:33 +0000
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
	id 1kXird-00043Y-2u; Wed, 28 Oct 2020 10:39:33 +0000
Received: by outflank-mailman (input) for mailman id 13503;
 Wed, 28 Oct 2020 10:39:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7zZT=ED=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kXirb-00043T-Gk
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 10:39:31 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.66]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7c68d8b-b53c-4231-aa4d-3fc93ce6a709;
 Wed, 28 Oct 2020 10:39:28 +0000 (UTC)
Received: from AM6PR08CA0028.eurprd08.prod.outlook.com (2603:10a6:20b:c0::16)
 by DB8PR08MB5338.eurprd08.prod.outlook.com (2603:10a6:10:111::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 28 Oct
 2020 10:39:22 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::73) by AM6PR08CA0028.outlook.office365.com
 (2603:10a6:20b:c0::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Wed, 28 Oct 2020 10:39:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Wed, 28 Oct 2020 10:39:21 +0000
Received: ("Tessian outbound c189680f801b:v64");
 Wed, 28 Oct 2020 10:39:21 +0000
Received: from a014cbc6987a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 09DA498F-1D35-4C61-9DE5-4F39688986DA.1; 
 Wed, 28 Oct 2020 10:38:44 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a014cbc6987a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Oct 2020 10:38:44 +0000
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com (2603:10a6:208:e4::28)
 by AM4PR0802MB2131.eurprd08.prod.outlook.com (2603:10a6:200:5c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 28 Oct
 2020 10:38:42 +0000
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5]) by AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 10:38:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=7zZT=ED=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kXirb-00043T-Gk
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 10:39:31 +0000
X-Inumbo-ID: a7c68d8b-b53c-4231-aa4d-3fc93ce6a709
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown [40.107.2.66])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a7c68d8b-b53c-4231-aa4d-3fc93ce6a709;
	Wed, 28 Oct 2020 10:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LcCdlXMvph6wqbVohNV4iRafpnaYadc/lEWrqMb/Hgw=;
 b=RDL9HdV0VaRh5d6ZWzGjMFfsMf7frSSdzvet0oJykdeZ2JinipaYxu86OyQlqGNguFZAhhym/tlYDJHjQaTUhDzoVi5UbUgFEZD4DBW1Q+EYDef2r8O/mkwf5wcTJjGyrpfy02kFOwQz8tpxjdzFhT3Ldqykjo6DPhPcNU8AujM=
Received: from AM6PR08CA0028.eurprd08.prod.outlook.com (2603:10a6:20b:c0::16)
 by DB8PR08MB5338.eurprd08.prod.outlook.com (2603:10a6:10:111::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 28 Oct
 2020 10:39:22 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::73) by AM6PR08CA0028.outlook.office365.com
 (2603:10a6:20b:c0::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Wed, 28 Oct 2020 10:39:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Wed, 28 Oct 2020 10:39:21 +0000
Received: ("Tessian outbound c189680f801b:v64"); Wed, 28 Oct 2020 10:39:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ccaa350e2fb60b1d
X-CR-MTA-TID: 64aa7808
Received: from a014cbc6987a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 09DA498F-1D35-4C61-9DE5-4F39688986DA.1;
	Wed, 28 Oct 2020 10:38:44 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a014cbc6987a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 28 Oct 2020 10:38:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQJys9oEMHoM9stshN4uC0T/06g1GnFqw8HrguyCryg5eVb32OBN4voD5qhYwTqwdAy4GH7wnpl+XnQWlXhqU8BuTLiLB1Nb8DTA3evrj/2LLnzOBJ1YUjLe4nAXJ69wX3p0qSo5xwptkpeKeMbFPqBcOZIEp0u1nm55S2FZ7YwkW7jn0VR/w923qw0sWuCgCohxZlAaCx5qVCsXcTUrXnKXSG0yglF/vNfONlK700HPBgXVLLMig08BkZ6rZ1E9MfHpfQ3Ls20I9aHkmU3jZivBCZll+vn3m9gQozJfGMcXxZr0pfoID7/g6Kc7K9l279DvSgqQU6+jkeoeWrtYMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LcCdlXMvph6wqbVohNV4iRafpnaYadc/lEWrqMb/Hgw=;
 b=mIH7J7B6iKuRXBR/Dvm4zIBP29V40DazqAxl7czqDYY6wL/fChsn/jvf26/aNDgDETlRy85dy6odHnNTpZohQCjppF3IB/kpJpuxXSSfwHIm4i9N1t6AMbwybGF9SBPNIB2VGj7razZz7ZzAccRORJb/iy1Lx1tbuZoyf9bvXo1/m0wgdoe3cnPIHtXPvBTP9OuX1Kf/jW+QxGzzUMNCO9Vsh4edNOpZl7eHtiWDjE4Y7wq+8ugMFFSJbYKJPsc3DuIn8yc3kZZQl9rqvsWBxqo8RC9rvHESuKOYlJN7BbkS37fqnQK5jIY2sJrabXqyCpPVUStySH5OZst/v8r21w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LcCdlXMvph6wqbVohNV4iRafpnaYadc/lEWrqMb/Hgw=;
 b=RDL9HdV0VaRh5d6ZWzGjMFfsMf7frSSdzvet0oJykdeZ2JinipaYxu86OyQlqGNguFZAhhym/tlYDJHjQaTUhDzoVi5UbUgFEZD4DBW1Q+EYDef2r8O/mkwf5wcTJjGyrpfy02kFOwQz8tpxjdzFhT3Ldqykjo6DPhPcNU8AujM=
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com (2603:10a6:208:e4::28)
 by AM4PR0802MB2131.eurprd08.prod.outlook.com (2603:10a6:200:5c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 28 Oct
 2020 10:38:42 +0000
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5]) by AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 10:38:42 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v1 1/4] xen/ns16550: solve compilation error on ARM with
 CONFIG_HAS_PCI enabled.
Thread-Topic: [PATCH v1 1/4] xen/ns16550: solve compilation error on ARM with
 CONFIG_HAS_PCI enabled.
Thread-Index: AQHWq7waQtOOhLtUwkWCA6LhLv3lTamsG2AAgAC6JoA=
Date: Wed, 28 Oct 2020 10:38:41 +0000
Message-ID: <84A4BE33-5886-469C-87DE-7F73208E3ADE@arm.com>
References: <cover.1603731279.git.rahul.singh@arm.com>
 <d1df24d48508c0c01c0b1130ed22f2b4585d04db.1603731279.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2010271621480.12247@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2010271621480.12247@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.38.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2b84b869-fa8e-4e2d-6e04-08d87b2dbb4d
x-ms-traffictypediagnostic: AM4PR0802MB2131:|DB8PR08MB5338:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB5338F2A5C036E20DC0F200B7FC170@DB8PR08MB5338.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 j8Ku/Dw6K15SmFESinGISaYR7lqc89Rqc/lGfFuYMpeHHeH5mErB2AMOWvDFzLwoLV8ek5Xd2RqI4auibrlGk6Eg3H5nv8RLEDOrTm46LycJsidK3g3YZDojk6ukuZTKDjv1ndUL8ZMVJMByliQ+1IcKh6DKrGb5Ye0bQ+S/D9OrIgIVI87wRcsKfAnvb0+WWQMVPpxDkkxPSsQte1f/BNx1b7iRGcjQXUuC658bnXZjxyOyOal1ByPoR/K2NLK8b6Myt5zdfZa31LzklgiIuhoNLe2RiMtS2VyHGZM0zGWgHCHUzIjj01e4PutFmpXua4FTFLG3uTEheCnGwTtHRA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3490.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(66476007)(83380400001)(6512007)(86362001)(8936002)(478600001)(316002)(33656002)(55236004)(6506007)(53546011)(54906003)(2616005)(5660300002)(2906002)(26005)(8676002)(76116006)(71200400001)(36756003)(64756008)(6916009)(91956017)(4326008)(186003)(66446008)(66556008)(66946007)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 orhsE//ACXqHFp5m3LVjVORM44FWGu5mwZNZ/OrYDJU+sO/YhwKS4HcPa7pkI3nZeJZpqulW1ZCWmdIW30MD0Pukg/iEAPoCElKy5ma56D77yfYEz/vFZjQcMFq5t74vg5wxcGoJdweEaowMAMydia8uYAUnysT83qh7Fl88sBTcKxBPfAWRKUGO+ptjIC7RrTo6LwCEqN3wBYxsVCjeQmos7sJHdkoKl4Y2ZVgXav98C9IZl4hiXi3ciDhLTfbZOPa5drDDmZxctiPL2XJPR8nJEZuzDlub1yK9zF9CHwtcTkbH29Y7Ekjf3HGwxMbwju2HFQMkl6cMTNS3tf0DhE7qvmwXqrQaZOiMbJ31G7P34F4Azdl/SulcrKuHTzpD6sTwKx4QZjhoK2ytpg8r3krIiG45nLIArt76XnohiSmJ9pN44Xymj4lMaApthi+nMg4oqhQFhz+1iF5zSlx/zb6ZPAy4jqyTFVClxH/mrRrZ/QVGYmYX6N2S6D97koeuLs2rFDU1eSjxSJ0vly4391U+jO1i/A7tjNX8FW2nFXwB70RNp8kelSnJEGusHhtMWMZsxGpSxKgOnq/tSUPU8MviDOPWhOua4NJIyG2bTQ+vnJcbPbX2BWrvRGd/DtQgKaVW2RtCwvqEMLYUIprQMQ==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7CEDBA91850A7F44BD3EC12709C74E72@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2131
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a358bb6d-b788-41b4-161f-08d87b2da3d6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UR9fid7IA4p1bJVMyQVObJf2x1BS+V1NP4LXFdK1WbK1Qawn4X9KP+ULyH92DwO25oThuFed3SmwinmBQOCI7412MIlnHemdUuLHKS0Uz3715+dpHy0GaLNmdnQ8cJenR0tsK97wSjlVQU4IZoJ3tVeOFZifDlarpiyF3ZfPzEXNe/F4jagmhFexl3eIj6NiEMSmSjEK2KWbOD4N7cZxyAWPY97U627dpVotg/Bk7Kt+ekgZ3PjblYL1QTMnXbP34+OhlDu2B9zDJ01+bvcUv/BujwMFM5yRNSkYjP1YTZZE9txKPCf9Ycbjh4xMbSNcfE2/NvzaJ4q/YoHvbInQcxOoG8JMeEhrHeyNPPqHaExA1sf8mbcKO2as7EM5VGbZAxyQ+KK2OADsNw+7cpjpug==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(46966005)(186003)(26005)(6512007)(8936002)(316002)(6862004)(6486002)(70586007)(5660300002)(70206006)(2616005)(86362001)(8676002)(54906003)(55236004)(33656002)(81166007)(336012)(36756003)(82740400003)(36906005)(82310400003)(478600001)(47076004)(6506007)(4326008)(83380400001)(2906002)(53546011)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 10:39:21.7654
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b84b869-fa8e-4e2d-6e04-08d87b2dbb4d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5338

Hello Stefano,

> On 27 Oct 2020, at 11:32 pm, Stefano Stabellini <sstabellini@kernel.org> =
wrote:
>=20
> On Mon, 26 Oct 2020, Rahul Singh wrote:
>> ARM platforms does not support ns16550 PCI support. When CONFIG_HAS_PCI
>                ^ do

Ok I will fix that in next version.
>=20
>> is enabled for ARM a compilation error is observed.
>>=20
>> Fixed compilation error after introducing new kconfig option
>> CONFIG_HAS_NS16550_PCI for x86 platforms to support ns16550 PCI.
>>=20
>> No functional change.
>=20
> Written like that it would seem that ARM platforms do not support
> NS16550 on the PCI bus, but actually, it would be theoretically possible
> to have an NS16550 card slotted in a PCI bus on ARM, right?
>=20
> The problem is the current limitation in terms of Xen internal
> plumbings, such as lack of MSI support. Is that correct?
>=20
> If so, I'd update the commit message to reflect the situation a bit
> better.
>=20

Yes you are right on ARM platforms PCI is not fully supported because of th=
at=20
I decided to disable it for ARM. Once we have full support for PCI device w=
e can enable=20
it for ARM also. I will modify the commit msg to reflect the same.

>=20
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>> xen/drivers/char/Kconfig   |  7 +++++++
>> xen/drivers/char/ns16550.c | 32 ++++++++++++++++----------------
>> 2 files changed, 23 insertions(+), 16 deletions(-)
>>=20
>> diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
>> index b572305657..8887e86afe 100644
>> --- a/xen/drivers/char/Kconfig
>> +++ b/xen/drivers/char/Kconfig
>> @@ -4,6 +4,13 @@ config HAS_NS16550
>> 	help
>> 	  This selects the 16550-series UART support. For most systems, say Y.
>>=20
>> +config HAS_NS16550_PCI
>> +	bool "NS16550 UART PCI support" if X86
>> +	default y
>> +	depends on X86 && HAS_NS16550 && HAS_PCI
>> +	help
>> +	  This selects the 16550-series UART PCI support. For most systems, sa=
y Y.
>=20
> I think that this should be a silent option:
> if HAS_NS16550 && HAS_PCI && X86 -> automatically enable
> otherwise -> automatically disable
>=20
> No need to show it to the user.
>=20
> The rest of course is fine.

Ok I will fix that. I will do the same as done for HAS_NS16550 ,=20
x86:  silent option depend on HAS_NS16550 && HAS_PCI
ARM: user can decide to enable or disable via menuconfig depend on  HAS_NS1=
6550 && HAS_PCI.

>=20
>=20
>> config HAS_CADENCE_UART
>> 	bool "Xilinx Cadence UART driver"
>> 	default y
>> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
>> index d8b52eb813..bd1c2af956 100644
>> --- a/xen/drivers/char/ns16550.c
>> +++ b/xen/drivers/char/ns16550.c
>> @@ -16,7 +16,7 @@
>> #include <xen/timer.h>
>> #include <xen/serial.h>
>> #include <xen/iocap.h>
>> -#ifdef CONFIG_HAS_PCI
>> +#ifdef CONFIG_HAS_NS16550_PCI
>> #include <xen/pci.h>
>> #include <xen/pci_regs.h>
>> #include <xen/pci_ids.h>
>> @@ -54,7 +54,7 @@ enum serial_param_type {
>>     reg_shift,
>>     reg_width,
>>     stop_bits,
>> -#ifdef CONFIG_HAS_PCI
>> +#ifdef CONFIG_HAS_NS16550_PCI
>>     bridge_bdf,
>>     device,
>>     port_bdf,
>> @@ -83,7 +83,7 @@ static struct ns16550 {
>>     unsigned int timeout_ms;
>>     bool_t intr_works;
>>     bool_t dw_usr_bsy;
>> -#ifdef CONFIG_HAS_PCI
>> +#ifdef CONFIG_HAS_NS16550_PCI
>>     /* PCI card parameters. */
>>     bool_t pb_bdf_enable;   /* if =3D1, pb-bdf effective, port behind br=
idge */
>>     bool_t ps_bdf_enable;   /* if =3D1, ps_bdf effective, port on pci ca=
rd */
>> @@ -117,14 +117,14 @@ static const struct serial_param_var __initconst s=
p_vars[] =3D {
>>     {"reg-shift", reg_shift},
>>     {"reg-width", reg_width},
>>     {"stop-bits", stop_bits},
>> -#ifdef CONFIG_HAS_PCI
>> +#ifdef CONFIG_HAS_NS16550_PCI
>>     {"bridge", bridge_bdf},
>>     {"dev", device},
>>     {"port", port_bdf},
>> #endif
>> };
>>=20
>> -#ifdef CONFIG_HAS_PCI
>> +#ifdef CONFIG_HAS_NS16550_PCI
>> struct ns16550_config {
>>     u16 vendor_id;
>>     u16 dev_id;
>> @@ -620,7 +620,7 @@ static int ns16550_getc(struct serial_port *port, ch=
ar *pc)
>>=20
>> static void pci_serial_early_init(struct ns16550 *uart)
>> {
>> -#ifdef CONFIG_HAS_PCI
>> +#ifdef CONFIG_HAS_NS16550_PCI
>>     if ( !uart->ps_bdf_enable || uart->io_base >=3D 0x10000 )
>>         return;
>>=20
>> @@ -719,7 +719,7 @@ static void __init ns16550_init_preirq(struct serial=
_port *port)
>>=20
>> static void __init ns16550_init_irq(struct serial_port *port)
>> {
>> -#ifdef CONFIG_HAS_PCI
>> +#ifdef CONFIG_HAS_NS16550_PCI
>>     struct ns16550 *uart =3D port->uart;
>>=20
>>     if ( uart->msi )
>> @@ -761,7 +761,7 @@ static void __init ns16550_init_postirq(struct seria=
l_port *port)
>>     uart->timeout_ms =3D max_t(
>>         unsigned int, 1, (bits * uart->fifo_size * 1000) / uart->baud);
>>=20
>> -#ifdef CONFIG_HAS_PCI
>> +#ifdef CONFIG_HAS_NS16550_PCI
>>     if ( uart->bar || uart->ps_bdf_enable )
>>     {
>>         if ( uart->param && uart->param->mmio &&
>> @@ -841,7 +841,7 @@ static void ns16550_suspend(struct serial_port *port=
)
>>=20
>>     stop_timer(&uart->timer);
>>=20
>> -#ifdef CONFIG_HAS_PCI
>> +#ifdef CONFIG_HAS_NS16550_PCI
>>     if ( uart->bar )
>>        uart->cr =3D pci_conf_read16(PCI_SBDF(0, uart->ps_bdf[0], uart->p=
s_bdf[1],
>>                                   uart->ps_bdf[2]), PCI_COMMAND);
>> @@ -850,7 +850,7 @@ static void ns16550_suspend(struct serial_port *port=
)
>>=20
>> static void _ns16550_resume(struct serial_port *port)
>> {
>> -#ifdef CONFIG_HAS_PCI
>> +#ifdef CONFIG_HAS_NS16550_PCI
>>     struct ns16550 *uart =3D port->uart;
>>=20
>>     if ( uart->bar )
>> @@ -1013,7 +1013,7 @@ static int __init check_existence(struct ns16550 *=
uart)
>>     return 1; /* Everything is MMIO */
>> #endif
>>=20
>> -#ifdef CONFIG_HAS_PCI
>> +#ifdef CONFIG_HAS_NS16550_PCI
>>     pci_serial_early_init(uart);
>> #endif
>>=20
>> @@ -1044,7 +1044,7 @@ static int __init check_existence(struct ns16550 *=
uart)
>>     return (status =3D=3D 0x90);
>> }
>>=20
>> -#ifdef CONFIG_HAS_PCI
>> +#ifdef CONFIG_HAS_NS16550_PCI
>> static int __init
>> pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
>> {
>> @@ -1305,7 +1305,7 @@ static bool __init parse_positional(struct ns16550=
 *uart, char **str)
>>=20
>>     if ( *conf =3D=3D ',' && *++conf !=3D ',' )
>>     {
>> -#ifdef CONFIG_HAS_PCI
>> +#ifdef CONFIG_HAS_NS16550_PCI
>>         if ( strncmp(conf, "pci", 3) =3D=3D 0 )
>>         {
>>             if ( pci_uart_config(uart, 1/* skip AMT */, uart - ns16550_c=
om) )
>> @@ -1327,7 +1327,7 @@ static bool __init parse_positional(struct ns16550=
 *uart, char **str)
>>=20
>>     if ( *conf =3D=3D ',' && *++conf !=3D ',' )
>>     {
>> -#ifdef CONFIG_HAS_PCI
>> +#ifdef CONFIG_HAS_NS16550_PCI
>>         if ( strncmp(conf, "msi", 3) =3D=3D 0 )
>>         {
>>             conf +=3D 3;
>> @@ -1339,7 +1339,7 @@ static bool __init parse_positional(struct ns16550=
 *uart, char **str)
>>             uart->irq =3D simple_strtol(conf, &conf, 10);
>>     }
>>=20
>> -#ifdef CONFIG_HAS_PCI
>> +#ifdef CONFIG_HAS_NS16550_PCI
>>     if ( *conf =3D=3D ',' && *++conf !=3D ',' )
>>     {
>>         conf =3D parse_pci(conf, NULL, &uart->ps_bdf[0],
>> @@ -1419,7 +1419,7 @@ static bool __init parse_namevalue_pairs(char *str=
, struct ns16550 *uart)
>>             uart->reg_width =3D simple_strtoul(param_value, NULL, 0);
>>             break;
>>=20
>> -#ifdef CONFIG_HAS_PCI
>> +#ifdef CONFIG_HAS_NS16550_PCI
>>         case bridge_bdf:
>>             if ( !parse_pci(param_value, NULL, &uart->ps_bdf[0],
>>                             &uart->ps_bdf[1], &uart->ps_bdf[2]) )
>> --=20
>> 2.17.1

Regards,
Rahul


