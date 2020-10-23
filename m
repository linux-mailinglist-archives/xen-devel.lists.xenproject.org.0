Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB16B296DCB
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 13:36:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10864.29007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVvLu-0000cf-UP; Fri, 23 Oct 2020 11:35:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10864.29007; Fri, 23 Oct 2020 11:35:22 +0000
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
	id 1kVvLu-0000cG-RE; Fri, 23 Oct 2020 11:35:22 +0000
Received: by outflank-mailman (input) for mailman id 10864;
 Fri, 23 Oct 2020 11:35:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SP8M=D6=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kVvLt-0000cB-3o
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 11:35:21 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.42]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 10b736e6-dc40-4c3d-acd2-b9be89a8fd9b;
 Fri, 23 Oct 2020 11:35:17 +0000 (UTC)
Received: from AM6PR05CA0012.eurprd05.prod.outlook.com (2603:10a6:20b:2e::25)
 by VI1PR08MB3725.eurprd08.prod.outlook.com (2603:10a6:803:b6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 23 Oct
 2020 11:35:12 +0000
Received: from AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::24) by AM6PR05CA0012.outlook.office365.com
 (2603:10a6:20b:2e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Fri, 23 Oct 2020 11:35:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT038.mail.protection.outlook.com (10.152.17.118) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Fri, 23 Oct 2020 11:35:10 +0000
Received: ("Tessian outbound 68da730eaaba:v64");
 Fri, 23 Oct 2020 11:35:10 +0000
Received: from bc053f256823.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C6CB1098-6231-4894-9DB9-81AC5B4F3C16.1; 
 Fri, 23 Oct 2020 11:35:01 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bc053f256823.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 23 Oct 2020 11:35:01 +0000
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com (2603:10a6:208:e4::28)
 by AM9PR08MB5924.eurprd08.prod.outlook.com (2603:10a6:20b:282::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Fri, 23 Oct
 2020 11:35:00 +0000
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5]) by AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5%7]) with mapi id 15.20.3477.028; Fri, 23 Oct 2020
 11:35:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=SP8M=D6=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kVvLt-0000cB-3o
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 11:35:21 +0000
X-Inumbo-ID: 10b736e6-dc40-4c3d-acd2-b9be89a8fd9b
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown [40.107.14.42])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 10b736e6-dc40-4c3d-acd2-b9be89a8fd9b;
	Fri, 23 Oct 2020 11:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AGEHtB9rNId9OdJGuNVRoSMtOawmeS4J9+jlHDhH3iU=;
 b=Vil2alzHlxXLtDXDVYQIxwh1JUb3ozno3ZbTRUldofU0r17MIepfZkYH/+Sw6aOALupeURT8BOF6gBXb45LR881nvb703SHaIRgp/pfvEbYK79+BswDTB5CqmCCyRZ8MI/uPZ6TeFvGEnzVsjhnOn3MMmoxZFPTkgAzCoxqYpEU=
Received: from AM6PR05CA0012.eurprd05.prod.outlook.com (2603:10a6:20b:2e::25)
 by VI1PR08MB3725.eurprd08.prod.outlook.com (2603:10a6:803:b6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 23 Oct
 2020 11:35:12 +0000
Received: from AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::24) by AM6PR05CA0012.outlook.office365.com
 (2603:10a6:20b:2e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Fri, 23 Oct 2020 11:35:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT038.mail.protection.outlook.com (10.152.17.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Fri, 23 Oct 2020 11:35:10 +0000
Received: ("Tessian outbound 68da730eaaba:v64"); Fri, 23 Oct 2020 11:35:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0797d5f54955c7d6
X-CR-MTA-TID: 64aa7808
Received: from bc053f256823.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C6CB1098-6231-4894-9DB9-81AC5B4F3C16.1;
	Fri, 23 Oct 2020 11:35:01 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bc053f256823.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 23 Oct 2020 11:35:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aOsPaO781USbVjFuCN3O882eDeSVE73gr3L6BheiN8xoM8RdTABCmbVoZPepjG0JtfEXuK2Rl8PEasdbRAh1CJRqVzkwDAG0FjBN+7sM4XXaRXH5EUpITBvcjdzCL5gYKiy8h9lzKZOg/S9zeT1ckDjJcWi2d0UvaLZpQ2D+cUrYr89HSOmTKNmNEHcHppVR72sWF5t8MfJ0YrfDpawCr1d2AkycTT4EPtx9QSWwHmk1ksBj4shulM2ZgwCOGi4FuQXlVgBk8muM3+ZCAP+Ng33BjAu4ZFHT3PQYtQAAxx9HuOZEx+2HeMCgIAhJhWveeIXObrkny1oSXu6KAxlx4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AGEHtB9rNId9OdJGuNVRoSMtOawmeS4J9+jlHDhH3iU=;
 b=dzZsgL4X8O5/QJJ9L5j5+CxfcKTxwt3OjtVXZcF9tGviQKgcEA/xdgKCQJxvQ9haQcyajrpaIVyEPirfOiP7tJWqfzmj6F+dITl08/JEhJ/r3jXqR5+JbJlJmOj6M+6lGoizgE5qdkMdPJq4g7AI8h0ktG3SLjypGcorh8KjmZoP3YC5fjS3xCshk7Yul6ILAId7DjEkQ4BFo0vkWIzelFfcWo5jT9I8uzsLWgMxajHcawh7t8xLmlXRYKxxRvgX5adz7XPRf1M8RwxMiov1qqRtnrVDAMBry7nNo11SXpb/NAAX80cx0nMJlnOVhK30PYuVDYN9TsU8mFkXa90LSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AGEHtB9rNId9OdJGuNVRoSMtOawmeS4J9+jlHDhH3iU=;
 b=Vil2alzHlxXLtDXDVYQIxwh1JUb3ozno3ZbTRUldofU0r17MIepfZkYH/+Sw6aOALupeURT8BOF6gBXb45LR881nvb703SHaIRgp/pfvEbYK79+BswDTB5CqmCCyRZ8MI/uPZ6TeFvGEnzVsjhnOn3MMmoxZFPTkgAzCoxqYpEU=
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com (2603:10a6:208:e4::28)
 by AM9PR08MB5924.eurprd08.prod.outlook.com (2603:10a6:20b:282::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Fri, 23 Oct
 2020 11:35:00 +0000
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5]) by AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5%7]) with mapi id 15.20.3477.028; Fri, 23 Oct 2020
 11:35:00 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>, Paul Durrant
	<paul@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Topic: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Index: AQHWoVvrkmJwOYERdUOadvid1OghFamgw0AAgAEzsQCAAWIugIABA+CAgADBXIA=
Date: Fri, 23 Oct 2020 11:35:00 +0000
Message-ID: <D8EF4B06-B64D-4264-8C86-DA1B5A1146D2@arm.com>
References:
 <b085e894773842ac320b818aa6f84289d0a128ed.1602591365.git.rahul.singh@arm.com>
 <cd433f0a-ed0b-ce82-c356-d6deaa053a30@xen.org>
 <BBF09ABE-29A6-4990-8DA2-B44086E9C88C@arm.com>
 <1082f30e-0ce8-00b1-e120-194ff874a9ba@xen.org>
 <alpine.DEB.2.21.2010221631440.12247@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2010221631440.12247@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.38.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 28eddf09-9d51-4162-da2a-08d87747b3f9
x-ms-traffictypediagnostic: AM9PR08MB5924:|VI1PR08MB3725:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB37253439B98A295F08C97D7AFC1A0@VI1PR08MB3725.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 zenOi7UX8txCp5r+UGKnZGn23WNBUbwaGRfNMYaszw4hvFT5DfbnBOKGN6pRdhWKqQAIQgcgUkqoVuqDDOBds4FAWQ7ErNymtezNmA+VVktBKgdwRLwOfO3Iy2exLBWB6NMQWN8NqIhHe3Ui/O3jZivEMZqh9/tOgn77Xr4dgD9x4UzVjyJqpegJjF/AH8A+O3b0hId2LQZVJ1cbDW5wap6BgiMtuK0ybmqqtpNFW531dkqcGzBe4b0eS70CvRVLvvFf8XUB1Zj+Yt2u/fbKm5J09gQvCMjDtwHW5c/a3dlN3h5PpGmQqoGYBWLQBNzpx4/lMaIWXmucY853zv+pEw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3490.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(53546011)(478600001)(55236004)(5660300002)(6506007)(26005)(6486002)(4326008)(86362001)(66946007)(2616005)(36756003)(8936002)(6916009)(6512007)(71200400001)(54906003)(33656002)(8676002)(64756008)(316002)(66476007)(91956017)(2906002)(76116006)(66556008)(66446008)(186003)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 wxEclyfqX38bYbvMpxq06yXhFZw4rx1bXI4mPeomPttdJtPUyt8X64UFPQMXtIDHRVX99QLMpI0tEfrP7T7+YmvNOq02jFyNXQ4XRn3RoSh6qpfFkJrjZ5yhza3SPSnG46KiwGlw/hlil+7Ubv2XccNs/7keqScYNZWEAp78+5M3S3cCaiWY2XZfzhjuahUK9ELhCR62g++hDuwam+qFnE4AKGbQc3+rc9K5Xe5cn+QpR+HK3iKY31chQR0S8AeAau9YEERZTFQpYPewyAckHfQm30iXN+xSfYBGhgLRvoJyAl6PtEBoQZ0E8pWx++bSLReKhEyQUQhPEsMynlLrYXxA8XDDksUiXFkl6VEkxFFS4I1apQHxoDKnws7LKXGEk+nP9KDbaBgSCeliyuXTpICIr5CtwQxtsGtpPCk6Pna61dRQTTUuEL+bOEbNreSprhxwQ0QucU6DeiyJuok+BAjHRM8yQj8bUSBTdLBwZPFGZVSBZIFIrNRSb099tGgUApNZeOfYl3EvV7o92f2F25krWeJ+DwtHhnVxH+T/xsiqgGiWNWtfiedjgofLnUAF1Tn/w0pkn2BvaXJMavMd2V4eJqHgRPJW34AXhaQ2/BzT1l7CHplhKuJHB8D9UJ3S6LtW1sGpb6+zXQzFXzBGog==
Content-Type: text/plain; charset="utf-8"
Content-ID: <F61CFFE78466DD448CA390CAB2DE2E31@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5924
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8071d114-283d-4083-0217-08d87747ad63
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zJtFGYVSIo79HgMjfAklV0IH6g46i60+utolX631pP2oKEQ7psrOD+lnPTp/LfkkjXCPVpTlWFP4Pf1BReP9H+G+fh46tllqqmSHCoF+z5/a4B659avMUaSeb92z3yP0NO/Zl9E1r/AU6owYUWdJ01iKCWNzU/DodFUEtyCHQ4o9n+Qw2eRMsxK2o62Yf+Q23l1EjwsJfVbo1hOu+VgAlImVF6mIQ59QCUHBtq9lFr9AtzbXPC4YmfkbEcLYfBYZo8NcahTvDi8S8K0y0EZ9dAgNg6OQKrjOOYQGOwoMsic4EUVBZo1b27HnX65a3tIucaQuduc0uQas3WcoI8XS/QSztJUCXQ+WQzGjV3ZGLiJn43Sp5Zl7sbgpWHUusx4GvgTj0HTRinhqOrsCH+OKpQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(46966005)(36906005)(81166007)(54906003)(316002)(336012)(8936002)(478600001)(33656002)(86362001)(2616005)(55236004)(8676002)(36756003)(26005)(186003)(53546011)(6486002)(2906002)(107886003)(6506007)(6862004)(6512007)(82310400003)(356005)(5660300002)(4326008)(47076004)(70206006)(82740400003)(70586007)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2020 11:35:10.7424
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28eddf09-9d51-4162-da2a-08d87747b3f9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3725

SGVsbG8sDQoNCj4gT24gMjMgT2N0IDIwMjAsIGF0IDE6MDIgYW0sIFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBUaHUsIDIyIE9jdCAy
MDIwLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4+IE9uIDIwLzEwLzIwMjAgMTY6MjUsIFJhaHVs
IFNpbmdoIHdyb3RlOg0KPj4+Pj4gQWRkIHN1cHBvcnQgZm9yIEFSTSBhcmNoaXRlY3RlZCBTTU1V
djMgaW1wbGVtZW50YXRpb25zLiBJdCBpcyBiYXNlZCBvbg0KPj4+Pj4gdGhlIExpbnV4IFNNTVV2
MyBkcml2ZXIuDQo+Pj4+PiBNYWpvciBkaWZmZXJlbmNlcyBiZXR3ZWVuIHRoZSBMaW51eCBkcml2
ZXIgYXJlIGFzIGZvbGxvd3M6DQo+Pj4+PiAxLiBPbmx5IFN0YWdlLTIgdHJhbnNsYXRpb24gaXMg
c3VwcG9ydGVkIGFzIGNvbXBhcmVkIHRvIHRoZSBMaW51eCBkcml2ZXINCj4+Pj4+ICAgIHRoYXQg
c3VwcG9ydHMgYm90aCBTdGFnZS0xIGFuZCBTdGFnZS0yIHRyYW5zbGF0aW9ucy4NCj4+Pj4+IDIu
IFVzZSBQMk0gIHBhZ2UgdGFibGUgaW5zdGVhZCBvZiBjcmVhdGluZyBvbmUgYXMgU01NVXYzIGhh
cyB0aGUNCj4+Pj4+ICAgIGNhcGFiaWxpdHkgdG8gc2hhcmUgdGhlIHBhZ2UgdGFibGVzIHdpdGgg
dGhlIENQVS4NCj4+Pj4+IDMuIFRhc2tsZXRzIGlzIHVzZWQgaW4gcGxhY2Ugb2YgdGhyZWFkZWQg
SVJRJ3MgaW4gTGludXggZm9yIGV2ZW50IHF1ZXVlDQo+Pj4+PiAgICBhbmQgcHJpb3JpdHkgcXVl
dWUgSVJRIGhhbmRsaW5nLg0KPj4+PiANCj4+Pj4gVGFza2xldHMgYXJlIG5vdCBhIHJlcGxhY2Vt
ZW50IGZvciB0aHJlYWRlZCBJUlEuIEluIHBhcnRpY3VsYXIsIHRoZXkgd2lsbA0KPj4+PiBoYXZl
IHByaW9yaXR5IG92ZXIgYW55dGhpbmcgZWxzZSAoSU9XIG5vdGhpbmcgd2lsbCBydW4gb24gdGhl
IHBDUFUgdW50aWwNCj4+Pj4gdGhleSBhcmUgZG9uZSkuDQo+Pj4+IA0KPj4+PiBEbyB5b3Uga25v
dyB3aHkgTGludXggaXMgdXNpbmcgdGhyZWFkLiBJcyBpdCBiZWNhdXNlIG9mIGxvbmcgcnVubmlu
Zw0KPj4+PiBvcGVyYXRpb25zPw0KPj4+IA0KPj4+IFllcyB5b3UgYXJlIHJpZ2h0IGJlY2F1c2Ug
b2YgbG9uZyBydW5uaW5nIG9wZXJhdGlvbnMgTGludXggaXMgdXNpbmcgdGhlDQo+Pj4gdGhyZWFk
ZWQgSVJRcy4NCj4+PiANCj4+PiBTTU1VdjMgcmVwb3J0cyBmYXVsdC9ldmVudHMgYmFzZXMgb24g
bWVtb3J5LWJhc2VkIGNpcmN1bGFyIGJ1ZmZlciBxdWV1ZXMgbm90DQo+Pj4gYmFzZWQgb24gdGhl
IHJlZ2lzdGVyLiBBcyBwZXIgbXkgdW5kZXJzdGFuZGluZywgaXQgaXMgdGltZS1jb25zdW1pbmcg
dG8NCj4+PiBwcm9jZXNzIHRoZSBtZW1vcnkgYmFzZWQgcXVldWVzIGluIGludGVycnVwdCBjb250
ZXh0IGJlY2F1c2Ugb2YgdGhhdCBMaW51eA0KPj4+IGlzIHVzaW5nIHRocmVhZGVkIElSUSB0byBw
cm9jZXNzIHRoZSBmYXVsdHMvZXZlbnRzIGZyb20gU01NVS4NCj4+PiANCj4+PiBJIGRpZG7igJl0
IGZpbmQgYW55IG90aGVyIHNvbHV0aW9uIGluIFhFTiBpbiBwbGFjZSBvZiB0YXNrbGV0IHRvIGRl
ZmVyIHRoZQ0KPj4+IHdvcmssIHRoYXTigJlzIHdoeSBJIHVzZWQgdGFza2xldCBpbiBYRU4gaW4g
cmVwbGFjZW1lbnQgb2YgdGhyZWFkZWQgSVJRcy4gSWYNCj4+PiB3ZSBkbyBhbGwgd29yayBpbiBp
bnRlcnJ1cHQgY29udGV4dCB3ZSB3aWxsIG1ha2UgWEVOIGxlc3MgcmVzcG9uc2l2ZS4NCj4+IA0K
Pj4gU28gd2UgbmVlZCB0byBtYWtlIHN1cmUgdGhhdCBYZW4gY29udGludWUgdG8gcmVjZWl2ZXMg
aW50ZXJydXB0cywgYnV0IHdlIGFsc28NCj4+IG5lZWQgdG8gbWFrZSBzdXJlIHRoYXQgYSB2Q1BV
IGJvdW5kIHRvIHRoZSBwQ1BVIGlzIGFsc28gcmVzcG9uc2l2ZS4NCj4+IA0KPj4+IA0KPj4+IElm
IHlvdSBrbm93IGFub3RoZXIgc29sdXRpb24gaW4gWEVOIHRoYXQgd2lsbCBiZSB1c2VkIHRvIGRl
ZmVyIHRoZSB3b3JrIGluDQo+Pj4gdGhlIGludGVycnVwdCBwbGVhc2UgbGV0IG1lIGtub3cgSSB3
aWxsIHRyeSB0byB1c2UgdGhhdC4NCj4+IA0KPj4gT25lIG9mIG15IHdvcmsgY29sbGVhZ3VlIGVu
Y291bnRlcmVkIGEgc2ltaWxhciBwcm9ibGVtIHJlY2VudGx5LiBIZSBoYWQgYSBsb25nDQo+PiBy
dW5uaW5nIHRhc2tsZXQgYW5kIHdhbnRlZCB0byBiZSBicm9rZW4gZG93biBpbiBzbWFsbGVyIGNo
dW5rLg0KPj4gDQo+PiBXZSBkZWNpZGVkIHRvIHVzZSBhIHRpbWVyIHRvIHJlc2NoZWR1bGUgdGhl
IHRhc2xrZXQgaW4gdGhlIGZ1dHVyZS4gVGhpcyBhbGxvd3MNCj4+IHRoZSBzY2hlZHVsZXIgdG8g
cnVuIG90aGVyIGxvYWRzIChlLmcuIHZDUFUpIGZvciBzb21lIHRpbWUuDQo+PiANCj4+IFRoaXMg
aXMgcHJldHR5IGhhY2tpc2ggYnV0IEkgY291bGRuJ3QgZmluZCBhIGJldHRlciBzb2x1dGlvbiBh
cyB0YXNrbGV0IGhhdmUNCj4+IGhpZ2ggcHJpb3JpdHkuDQo+PiANCj4+IE1heWJlIHRoZSBvdGhl
ciB3aWxsIGhhdmUgYSBiZXR0ZXIgaWRlYS4NCj4gDQo+IEp1bGllbidzIHN1Z2dlc3Rpb24gaXMg
YSBnb29kIG9uZS4NCj4gDQo+IEJ1dCBJIHRoaW5rIHRhc2tsZXRzIGNhbiBiZSBjb25maWd1cmVk
IHRvIGJlIGNhbGxlZCBmcm9tIHRoZSBpZGxlX2xvb3AsDQo+IGluIHdoaWNoIGNhc2UgdGhleSBh
cmUgbm90IHJ1biBpbiBpbnRlcnJ1cHQgY29udGV4dD8NCj4gDQoNCiBZZXMgeW91IGFyZSByaWdo
dCB0YXNrbGV0IHdpbGwgYmUgc2NoZWR1bGVkIGZyb20gdGhlIGlkbGVfbG9vcCB0aGF0IGlzIG5v
dCBpbnRlcnJ1cHQgY29uZXh0Lg0KDQo+IFN0aWxsLCB0YXNrbGV0cyBydW4gdW50aWwgY29tcGxl
dGlvbiBpbiBYZW4sIHdoaWNoIGNvdWxkIHRha2UgdG9vIGxvbmcuDQo+IFRoZSBjb2RlIGhhcyB0
byB2b2x1bnRhcmlseSByZWxlYXNlIGNvbnRyb2wgb2YgdGhlIGV4ZWN1dGlvbiBmbG93IG9uY2UN
Cj4gaXQgcmVhbGl6ZXMgaXQgaGFzIGJlZW4gcnVubmluZyBmb3IgdG9vIGxvbmcuIFRoZSByZXNj
aGVkdWxpbmcgdmlhIGENCj4gdGltZXIgd29ya3MuDQo+IA0KPiANCj4gTm93LCB0byBicmFpbnN0
b3JtIG90aGVyIHBvc3NpYmxlIGFsdGVybmF0aXZlcywgZm9yIGh5cGVyY2FsbHMgd2UgaGF2ZQ0K
PiBiZWVuIHVzaW5nIGh5cGVyY2FsbCBjb250aW51YXRpb25zLiAgQ29udGludWF0aW9ucyBpcyBh
IHdheSB0byBicmVhayBhDQo+IGh5cGVyY2FsbCBpbXBsZW1lbnRhdGlvbiB0aGF0IHRha2VzIHRv
byBsb25nIGludG8gbXVsdGlwbGUgZXhlY3V0aW9uDQo+IGNodW5rcy4gSXQgd29ya3MgYnkgY2Fs
bGluZyBpbnRvIGl0c2VsZiBhZ2FpbjogbWFraW5nIHRoZSBzYW1lIGh5cGVyY2FsbA0KPiBhZ2Fp
biB3aXRoIHVwZGF0ZWQgYXJndW1lbnRzLCBzbyB0aGF0IHRoZSBzY2hlZHVsZXIgaGFzIGEgY2hh
bmNlIHRvIGRvDQo+IG90aGVyIG9wZXJhdGlvbnMgaW4gYmV0d2VlbiwgaW5jbHVkaW5nIHJ1bm5p
bmcgb3RoZXIgdGFza2xldHMgYW5kDQo+IHNvZnRpcnFzLg0KPiANCj4gVGhhdCB3b3JrcyB3ZWxs
IGJlY2F1c2UgIHRoZSBzb3VyY2Ugb2YgdGhlIHdvcmsgaXMgYSBndWVzdCByZXF1ZXN0LA0KPiBz
cGVjaWZpY2FsbHkgYSBoeXBlcmNhbGwuIEhvd2V2ZXIsIGluIHRoZSBjYXNlIG9mIHRoZSBTTU1V
IGRyaXZlciwgdGhlcmUNCj4gaXMgbm8gaHlwZXJjYWxsLiBUaGUgWGVuIGRyaXZlciBoYXMgdG8g
ZG8gd29yayBpbiByZXNwb25zZSB0byBhbg0KPiBpbnRlcnJ1cHQgYW5kIHRoZSB3b3JrIGlzIG5v
dCB0aWVkIHRvIG9uZSBwYXJ0aWN1bGFyIGRvbWFpbi4NCj4gDQo+IFNvIEkgZG9uJ3QgdGhpbmsg
dGhlIGh5cGVyY2FsbCBjb250aW51YXRpb24gbW9kZWwgY291bGQgd29yayBoZXJlLiBUaGUNCj4g
dGltZXIgc2VlbXMgdG8gYmUgdGhlIGJlc3Qgb3B0aW9uLg0KPiANCg0KWWVzLCBJIGFncmVlIHdp
dGggeW91IGFzIHRoZSBzb3VyY2Ugb2YgdGhlIHdvcmsgaXMgbm90IGEgZ3Vlc3QgcmVxdWVzdCBp
biB0aGUgY2FzZSBvZiBTTU1VIEkgdGhpbmsgd2UgY2FuIG5vdCB1c2UgdGhlIGh5cGVyIGNhbGwg
Y29udGludWF0aW9uLg0KDQpBcyBzdWdnZXN0ZWQgSSB3aWxsIHRyeSB0byB1c2UgdGhlIHRpbWVy
IHRvIHNjaGVkdWxlIHRoZSB3b3JrIGFuZCB3aWxsIHNoYXJlIHRoZSBmaW5kaW5ncy4NCj4gDQo+
IA0KPj4+Pj4gNC4gTGF0ZXN0IHZlcnNpb24gb2YgdGhlIExpbnV4IFNNTVV2MyBjb2RlIGltcGxl
bWVudHMgdGhlIGNvbW1hbmRzIHF1ZXVlDQo+Pj4+PiAgICBhY2Nlc3MgZnVuY3Rpb25zIGJhc2Vk
IG9uIGF0b21pYyBvcGVyYXRpb25zIGltcGxlbWVudGVkIGluIExpbnV4Lg0KPj4+PiANCj4+Pj4g
Q2FuIHlvdSBwcm92aWRlIG1vcmUgZGV0YWlscz8NCj4+PiANCj4+PiBJIHRyaWVkIHRvIHBvcnQg
dGhlIGxhdGVzdCB2ZXJzaW9uIG9mIHRoZSBTTU1VdjMgY29kZSB0aGFuIEkgb2JzZXJ2ZWQgdGhh
dA0KPj4+IGluIG9yZGVyIHRvIHBvcnQgdGhhdCBjb2RlIEkgaGF2ZSB0byBhbHNvIHBvcnQgYXRv
bWljIG9wZXJhdGlvbiBpbXBsZW1lbnRlZA0KPj4+IGluIExpbnV4IHRvIFhFTi4gQXMgbGF0ZXN0
IExpbnV4IGNvZGUgdXNlcyBhdG9taWMgb3BlcmF0aW9uIHRvIHByb2Nlc3MgdGhlDQo+Pj4gY29t
bWFuZCBxdWV1ZXMgKGF0b21pY19jb25kX3JlYWRfcmVsYXhlZCgpLGF0b21pY19sb25nX2NvbmRf
cmVhZF9yZWxheGVkKCkgLA0KPj4+IGF0b21pY19mZXRjaF9hbmRub3RfcmVsYXhlZCgpKSAuDQo+
PiANCj4+IFRoYW5rIHlvdSBmb3IgdGhlIGV4cGxhbmF0aW9uLiBJIHRoaW5rIGl0IHdvdWxkIGJl
IGJlc3QgdG8gaW1wb3J0IHRoZSBhdG9taWMNCj4+IGhlbHBlcnMgYW5kIHVzZSB0aGUgbGF0ZXN0
IGNvZGUuDQo+PiANCj4+IFRoaXMgd2lsbCBlbnN1cmUgdGhhdCB3ZSBkb24ndCByZS1pbnRyb2R1
Y2UgYnVncyBhbmQgYWxzbyBidXkgdXMgc29tZSB0aW1lDQo+PiBiZWZvcmUgdGhlIExpbnV4IGFu
ZCBYZW4gZHJpdmVyIGRpdmVyZ2UgYWdhaW4gdG9vIG11Y2guDQo+PiANCj4+IFN0ZWZhbm8sIHdo
YXQgZG8geW91IHRoaW5rPw0KPiANCj4gSSB0aGluayB5b3UgYXJlIHJpZ2h0Lg0KDQpZZXMsIEkg
YWdyZWUgd2l0aCB5b3UgdG8gaGF2ZSBYRU4gY29kZSBpbiBzeW5jIHdpdGggTGludXggY29kZSB0
aGF0J3Mgd2h5IEkgc3RhcnRlZCB3aXRoIHRvIHBvcnQgdGhlIExpbnV4IGF0b21pYyBvcGVyYXRp
b25zIHRvIFhFTiAgdGhlbiBJIHJlYWxpc2VkIHRoYXQgaXQgaXMgbm90IHN0cmFpZ2h0Zm9yd2Fy
ZCB0byBwb3J0IGF0b21pYyBvcGVyYXRpb25zIGFuZCBpdCByZXF1aXJlcyBsb3RzIG9mIGVmZm9y
dCBhbmQgdGVzdGluZy4gVGhlcmVmb3JlIEkgZGVjaWRlZCB0byBwb3J0IHRoZSBjb2RlIGJlZm9y
ZSB0aGUgYXRvbWljIG9wZXJhdGlvbiBpcyBpbnRyb2R1Y2VkIGluIExpbnV4Lg0KDQoNClJlZ2Fy
ZHMsDQpSYWh1bA0KDQo=

