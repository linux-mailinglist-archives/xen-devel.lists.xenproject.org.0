Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 538D92A074D
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 15:01:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15870.39107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYUxQ-00078G-Js; Fri, 30 Oct 2020 14:00:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15870.39107; Fri, 30 Oct 2020 14:00:44 +0000
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
	id 1kYUxQ-00077r-FE; Fri, 30 Oct 2020 14:00:44 +0000
Received: by outflank-mailman (input) for mailman id 15870;
 Fri, 30 Oct 2020 14:00:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g2dz=EF=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kYUxP-00077m-CH
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 14:00:43 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe09::60c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c720f0b-2cf7-4d61-b69c-b9891112b1b1;
 Fri, 30 Oct 2020 14:00:40 +0000 (UTC)
Received: from AM5PR0701CA0065.eurprd07.prod.outlook.com (2603:10a6:203:2::27)
 by VI1PR08MB3471.eurprd08.prod.outlook.com (2603:10a6:803:7d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Fri, 30 Oct
 2020 14:00:30 +0000
Received: from VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::9) by AM5PR0701CA0065.outlook.office365.com
 (2603:10a6:203:2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.11 via Frontend
 Transport; Fri, 30 Oct 2020 14:00:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT027.mail.protection.outlook.com (10.152.18.154) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Fri, 30 Oct 2020 14:00:30 +0000
Received: ("Tessian outbound ba2270a55485:v64");
 Fri, 30 Oct 2020 14:00:28 +0000
Received: from ebfd1f4ccf4a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 627368C9-2C74-419F-9A90-7250CC7D6124.1; 
 Fri, 30 Oct 2020 14:00:03 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ebfd1f4ccf4a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 30 Oct 2020 14:00:03 +0000
Received: from AM6PR08MB3496.eurprd08.prod.outlook.com (2603:10a6:20b:4e::31)
 by AM6PR08MB3079.eurprd08.prod.outlook.com (2603:10a6:209:45::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 30 Oct
 2020 13:59:59 +0000
Received: from AM6PR08MB3496.eurprd08.prod.outlook.com
 ([fe80::dc5:9a53:a6b1:6a5a]) by AM6PR08MB3496.eurprd08.prod.outlook.com
 ([fe80::dc5:9a53:a6b1:6a5a%4]) with mapi id 15.20.3499.027; Fri, 30 Oct 2020
 13:59:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=g2dz=EF=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kYUxP-00077m-CH
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 14:00:43 +0000
X-Inumbo-ID: 2c720f0b-2cf7-4d61-b69c-b9891112b1b1
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown [2a01:111:f400:fe09::60c])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2c720f0b-2cf7-4d61-b69c-b9891112b1b1;
	Fri, 30 Oct 2020 14:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBR1mSaVq1AGjPqPcYHqftLodwa4oX7xnw31LeL3eWI=;
 b=W+DBKV/VfnNPUsh22RZOyLiReM/+gsOzO/Pvxc3UfmmKU4RNbjxASi5lOehGer095GXOqn0AGSygVAouZtCBheKK9SQmilipnsJyS81HVws0eylmUi69BHywYxT1UwnYL43NeMSAbwMR6vh1146eA+GPDT+p25jo/HW9fpgtXQM=
Received: from AM5PR0701CA0065.eurprd07.prod.outlook.com (2603:10a6:203:2::27)
 by VI1PR08MB3471.eurprd08.prod.outlook.com (2603:10a6:803:7d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Fri, 30 Oct
 2020 14:00:30 +0000
Received: from VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::9) by AM5PR0701CA0065.outlook.office365.com
 (2603:10a6:203:2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.11 via Frontend
 Transport; Fri, 30 Oct 2020 14:00:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT027.mail.protection.outlook.com (10.152.18.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Fri, 30 Oct 2020 14:00:30 +0000
Received: ("Tessian outbound ba2270a55485:v64"); Fri, 30 Oct 2020 14:00:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7fbeee8f48a57f05
X-CR-MTA-TID: 64aa7808
Received: from ebfd1f4ccf4a.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 627368C9-2C74-419F-9A90-7250CC7D6124.1;
	Fri, 30 Oct 2020 14:00:03 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ebfd1f4ccf4a.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 30 Oct 2020 14:00:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e3w7gak5Qcq/FZ//DsFYrgOKR4jlZDBFOC/N1899/THr1PjD8lROb1zHlrj/sqKL7FEJl29WSoHb+M+lEuJtmtvpfCJVgzK6R7Lx4guD4oys+iPotwu8uBiYh1VqeisOyzihQ15nwJ3bDfBFW9eMFojuvHki64Jugwa83iEalk5YEdFF7x1/gtmGt9UXAKI61QhLiIwc8bOKK5OJYZL+HkzMV/bl3otGNUwULjobIHo3e2oeF6bbRMLQU/hSTuLpUnHo/tPKaULPe911V30ws8lQ1bH0CyhwaB0XRR6dg6moLpmuayp+08/DSGl4DsG8rPYz1Dqs0rACxgDqyY3dIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBR1mSaVq1AGjPqPcYHqftLodwa4oX7xnw31LeL3eWI=;
 b=D7oZP4mmTUIc0+j3Nek2lu2lo7NXKeWiIYL729Vsn5VeEglmxy5nwDadn7wj/1ZLHUsHlmsvAVhWleBPwAbNf7yJfxrPwmE7stAWSAJUM2c+so2LLR9MBs+BqOAItLy3sS2HIa0SGRJasQt2QknGBmOjUaNU3FSIxgvAfpedH7m+aSALldRz6MxomN8yNbOFxPJzHjD0tM8PvQE6JtxKf3Rf/29yTBxSPMPbIiBswZPdEK+XenqvFBntkDc6IzsgrZ3ve06wOmol9zbAxyqxCrU7PY9Z22sMKfOD/Ye2RSo7yNS6a4+msxRf0xt0FKhN2y25pDkNNkvZMLVvMrUOTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBR1mSaVq1AGjPqPcYHqftLodwa4oX7xnw31LeL3eWI=;
 b=W+DBKV/VfnNPUsh22RZOyLiReM/+gsOzO/Pvxc3UfmmKU4RNbjxASi5lOehGer095GXOqn0AGSygVAouZtCBheKK9SQmilipnsJyS81HVws0eylmUi69BHywYxT1UwnYL43NeMSAbwMR6vh1146eA+GPDT+p25jo/HW9fpgtXQM=
Received: from AM6PR08MB3496.eurprd08.prod.outlook.com (2603:10a6:20b:4e::31)
 by AM6PR08MB3079.eurprd08.prod.outlook.com (2603:10a6:209:45::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 30 Oct
 2020 13:59:59 +0000
Received: from AM6PR08MB3496.eurprd08.prod.outlook.com
 ([fe80::dc5:9a53:a6b1:6a5a]) by AM6PR08MB3496.eurprd08.prod.outlook.com
 ([fe80::dc5:9a53:a6b1:6a5a%4]) with mapi id 15.20.3499.027; Fri, 30 Oct 2020
 13:59:59 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 4/4] xen/pci: solve compilation error when memory
 paging is not enabled.
Thread-Topic: [PATCH v1 4/4] xen/pci: solve compilation error when memory
 paging is not enabled.
Thread-Index: AQHWq7wn1E1TPrUt3EyifJVqFrVmIams60gAgAA3GICAAa+LAIAABQGAgAFbgwA=
Date: Fri, 30 Oct 2020 13:59:59 +0000
Message-ID: <497FB9DE-F4AF-4110-9B48-5CA2CAA26F6C@arm.com>
References: <cover.1603731279.git.rahul.singh@arm.com>
 <dc85bb73ca4b6ab8b4a2370f2db7700445fbc5f8.1603731279.git.rahul.singh@arm.com>
 <b345b0d4-8045-1d5d-b3c9-498311cfb1ac@suse.com>
 <14328157-D9C5-428E-BD1C-F4A841359185@arm.com>
 <77495A6D-D1D8-4E62-B481-6AE59593CFAD@arm.com>
 <e6b24649-3621-6403-6fd7-de5814922197@suse.com>
In-Reply-To: <e6b24649-3621-6403-6fd7-de5814922197@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.38.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 26be8884-9ebc-4eaa-de09-08d87cdc2978
x-ms-traffictypediagnostic: AM6PR08MB3079:|VI1PR08MB3471:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB3471EE0E203104D5EA962CEFFC150@VI1PR08MB3471.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IPCP7RWusULK34LA3WlIAFPFiYAdFF8dJV8kidrESLNAhoLBLuLLweagJDa093y8vgzl1I8bLcTc+wtP/gHhLoxJACjyb3RZkhEP5ynHDYN+duUKsOVTjPB7EvUJn9PxiC/VGX9e0zWj0iPlUjipQEV+5r+tP7laWtaVzd/dQTPleDcEo7vaWOHy1QILgaH++epELfJ6oLWwIuOBajObNbNq82fHkWX358xPOrCDKCrlw/1D3RCeTSf22B8dXHwDGna6mLXEMVv3Ta/QqjoGljiXM4pIZrOf/To81ItGK56kF3cx2RbExLJr49/MKoSp3iaDqukg3jfFrxK69oM9XQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3496.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(346002)(376002)(136003)(396003)(2616005)(478600001)(76116006)(6512007)(5660300002)(91956017)(2906002)(71200400001)(86362001)(66946007)(8936002)(66556008)(8676002)(64756008)(66476007)(66446008)(54906003)(6486002)(4326008)(36756003)(33656002)(55236004)(316002)(6916009)(53546011)(6506007)(186003)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 u8a6OJ1k+9KiftMe0OBnv6R4GCP6pbxk1Erk1g4jHVFa3eD+tKmpWymj1yC31os1vTX3Hj5LpjRr+Q1/YXrl8N0kCxT+lhbeOQzT7t9BKUHUBYG+U8XnmrKVRRo1qOudI5gE1zncC7hAt7DC4qOA9I81lNfFmhEVlFDPErvYW1UprVBFks1Cc+EwISDRxjtI5isqxmxrDf32SyUjnemLG2RrHdysmHpUEh0UN+GXsntt1DfZNEYArOziIyN85TS8qkXGReEMwEtPzL1LE+XEzVWV8oG4oxuw+ASLa2qS5gFo15ZSCuNxD7ejCf2lBc0ZqsKy+rolR8iRR7OvcE+utiIyI4mSxeuaoOWnsOabPiU0UwyQtyXpuJUpg414FO9HAd0S93MM7I/IQ+XOinNDvw6Z31N85AgkXWsj7nCdK75TFtSZlSchOtmlovU/+UAf+gwxKEzI8qFnPwbuzUtqoD5H9BeqDQIUJpx1zpHaE231iBCws8cO8Aema/DrEP54Wv4xGZmT1gA4bJrdiPWepy06mxQP72PrtrP5Jz9sU6IaPuqmrUCFtYghzjpkIatmDhlpowZMdWBzBV1CkhXptJLqPmyT4M0bQiFW44m+ZvRkmSTWIlzWQk5J/UdEqJE1/6Bu/JmP1O9kWQko/JJkNA==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D03F42363DC2B04CBD8561C2DD0E186F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3079
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	776cb35a-f964-41bd-ddc3-08d87cdc16fc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yOSzbThKqFuCvP0I0XwL5Trc8eWxOn5kU92PdE8x5LIgqfMsy6a0CajXmW/rlmBRcfofvpT60KV64WqYDglPnqaU30PoA5Gzg7OinBhON2+uWcnScZO7mhoL87ciJE9hIz7IbQSQxbCn5yDHmBd0yeGq1i2XPIfIvyD2MNqOvkAq7oXyYDgzupEIIWagKBNPoFR8LYNSWGbzSluOMkSmbS/DXBgfD5rbr19yXw8jdOvQ+VDBF3q8HzfOl54/KvVmJ1UO2MKlliafleiMcaYHCNC2o+M/891hxR9Kht3D7d8t74YK6UWNr8OAUifSZ9uxzV6J8aueDD9k76HFXgmCe+6ZL6Xsgf78VUXVAPgLCtZ8RaGZdRV7hQURGN4goCJXatMlFjAh1J3a0Ap6IZcwlw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(346002)(376002)(46966005)(336012)(4326008)(5660300002)(8676002)(33656002)(54906003)(53546011)(82310400003)(6506007)(6512007)(8936002)(36756003)(6486002)(82740400003)(316002)(36906005)(55236004)(47076004)(186003)(2906002)(26005)(86362001)(70586007)(70206006)(2616005)(6862004)(356005)(478600001)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2020 14:00:30.2348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26be8884-9ebc-4eaa-de09-08d87cdc2978
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3471

Hello Jan,

> On 29 Oct 2020, at 5:16 pm, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 29.10.2020 17:58, Rahul Singh wrote:
>>> On 28 Oct 2020, at 3:13 pm, Rahul Singh <Rahul.Singh@arm.com> wrote:
>>>> On 28 Oct 2020, at 11:56 am, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 26.10.2020 18:17, Rahul Singh wrote:
>>>>> --- a/xen/drivers/passthrough/pci.c
>>>>> +++ b/xen/drivers/passthrough/pci.c
>>>>> @@ -1419,13 +1419,15 @@ static int assign_device(struct domain *d, u1=
6 seg, u8 bus, u8 devfn, u32 flag)
>>>>>   if ( !is_iommu_enabled(d) )
>>>>>       return 0;
>>>>>=20
>>>>> -    /* Prevent device assign if mem paging or mem sharing have been=
=20
>>>>> +#if defined(CONFIG_HAS_MEM_PAGING) || defined(CONFIG_MEM_SHARING)
>>>>> +    /* Prevent device assign if mem paging or mem sharing have been
>>>>>    * enabled for this domain */
>>>>>   if ( d !=3D dom_io &&
>>>>>        unlikely(mem_sharing_enabled(d) ||
>>>>>                 vm_event_check_ring(d->vm_event_paging) ||
>>>>>                 p2m_get_hostp2m(d)->global_logdirty) )
>>>>>       return -EXDEV;
>>>>> +#endif
>>>>=20
>>>> Besides this also disabling mem-sharing and log-dirty related
>>>> logic, I don't think the change is correct: Each item being
>>>> checked needs individually disabling depending on its associated
>>>> CONFIG_*. For this, perhaps you want to introduce something
>>>> like mem_paging_enabled(d), to avoid the need for #ifdef here?
>>>>=20
>>>=20
>>> Ok I will fix that in next version.=20
>>=20
>> I just check and found out that mem-sharing , men-paging and log-dirty i=
s x86 specific and not implemented for ARM.
>> Is that will be ok if I move above code to x86 specific directory and in=
troduce new function arch_pcidev_is_assignable() that will test if pcidev i=
s assignable or not ?
>=20
> As an immediate workaround - perhaps (long term the individual
> pieces should still be individually checked here, as they're
> not inherently x86-specific). Since there's no device property
> involved here, the suggested name looks misleading. Perhaps
> arch_iommu_usable(d)?

Thanks. I will modify the code as per suggestion and will share the version=
 v2 for review.

>=20
> Jan

Regards,
Rahul


