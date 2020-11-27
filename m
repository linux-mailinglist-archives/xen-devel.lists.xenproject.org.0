Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 223FF2C67CE
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 15:25:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39485.72416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiegn-0007Vp-FZ; Fri, 27 Nov 2020 14:25:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39485.72416; Fri, 27 Nov 2020 14:25:33 +0000
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
	id 1kiegn-0007VQ-Bv; Fri, 27 Nov 2020 14:25:33 +0000
Received: by outflank-mailman (input) for mailman id 39485;
 Fri, 27 Nov 2020 14:25:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xDXF=FB=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kiegm-0007VI-FC
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 14:25:32 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.47]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id affa1838-25d0-4936-86fc-2d2ea22f2063;
 Fri, 27 Nov 2020 14:25:30 +0000 (UTC)
Received: from MRXP264CA0004.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:15::16)
 by DBBPR08MB6011.eurprd08.prod.outlook.com (2603:10a6:10:209::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Fri, 27 Nov
 2020 14:25:27 +0000
Received: from VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:15:cafe::53) by MRXP264CA0004.outlook.office365.com
 (2603:10a6:500:15::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Fri, 27 Nov 2020 14:25:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT042.mail.protection.outlook.com (10.152.19.62) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.26 via Frontend Transport; Fri, 27 Nov 2020 14:25:27 +0000
Received: ("Tessian outbound 082214a64d39:v71");
 Fri, 27 Nov 2020 14:25:26 +0000
Received: from b2a4441315b8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 788D8F11-D9CC-4765-AD32-A1D866C3175E.1; 
 Fri, 27 Nov 2020 14:25:11 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b2a4441315b8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 27 Nov 2020 14:25:11 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DBBPR08MB6073.eurprd08.prod.outlook.com (2603:10a6:10:1f7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Fri, 27 Nov
 2020 14:25:09 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef%2]) with mapi id 15.20.3589.030; Fri, 27 Nov 2020
 14:25:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xDXF=FB=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kiegm-0007VI-FC
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 14:25:32 +0000
X-Inumbo-ID: affa1838-25d0-4936-86fc-2d2ea22f2063
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown [40.107.21.47])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id affa1838-25d0-4936-86fc-2d2ea22f2063;
	Fri, 27 Nov 2020 14:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqpGUJM4S9eQHH5Ot9fLaepfAzqGMbuWwOB0pNJ9QQY=;
 b=w2rlozCN59atiW7ZSAinHL8nMPhJ01gTiiCPVtuVTnyHBco13P1/p4OXyzDYenLLYquT3I41BP4WTQ/GhK0DdrQY08mlLTH0NKUfPQMmnwEW8iQgMWAdv4nFhUDNAvjasupNhBDC6T/TzfsXasbD4mRMc6yiXmO9za45oFyOVWQ=
Received: from MRXP264CA0004.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:15::16)
 by DBBPR08MB6011.eurprd08.prod.outlook.com (2603:10a6:10:209::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Fri, 27 Nov
 2020 14:25:27 +0000
Received: from VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:15:cafe::53) by MRXP264CA0004.outlook.office365.com
 (2603:10a6:500:15::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Fri, 27 Nov 2020 14:25:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT042.mail.protection.outlook.com (10.152.19.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.26 via Frontend Transport; Fri, 27 Nov 2020 14:25:27 +0000
Received: ("Tessian outbound 082214a64d39:v71"); Fri, 27 Nov 2020 14:25:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e77a87755b240a88
X-CR-MTA-TID: 64aa7808
Received: from b2a4441315b8.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 788D8F11-D9CC-4765-AD32-A1D866C3175E.1;
	Fri, 27 Nov 2020 14:25:11 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b2a4441315b8.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Nov 2020 14:25:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=edMmVdpIo6qrSjJOS8wgXzcM3GFaUJf6OgVAih+4jKPZRQ7ayz/kRy6Sa8jV/oW3mIU0NVr8QHP1ka7hGoebX7p15CMRJHlAP2MeGGYk02Qg5RXlPosSqGzsixXzRUTsC7+HwTOjeE4OMObhGIxJSsddbgY8GYmNL2YXm5E7x1D4JJ8BdDAAlGKr5eej2MpINQVY5mhJlpBsi8clVJBPKKgVnGxyEMA0ODhjObcmXWgGlRki4RnLLN/Un/xkttwtpJxhPAG3gn/n/EhvAPIxNt/S8S5jnykHh+0rZxW8LrP/uiAjBlNzCldBdnh1eONiTbXZh96mEoDjQM7foYgFvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqpGUJM4S9eQHH5Ot9fLaepfAzqGMbuWwOB0pNJ9QQY=;
 b=Oc1TaJ9GoxrQaRHzt5t8RdgiMUQ6w2/cfvlZzf+mC8DdGG9N7AuFJUtD8wqLhtkdG/76Es+Tz018H0c3INv9k7X/2flTVaTEoM5PfdBUUIKWVkHHEXOVOy+oNvIrKyPokBEv6l9K0nwXHDL42pbJsH3GJ4VUpfQzsT54/unu0DTNd/kkOlqn3BaexSC6+uNbXaMOPqc3sL4lNwve9uyhEjZcPk8t8qJBmSS3MduFnKIC1ZuURDzOZ53uKqF0iry23dRN+C4TlFC/b0/4J7kh2ud6XxaTB4zMJYFNIuCViTCPkQ9xndGQTo05A8pfgLAsDRZSo30mYbYLVpsXExFMeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqpGUJM4S9eQHH5Ot9fLaepfAzqGMbuWwOB0pNJ9QQY=;
 b=w2rlozCN59atiW7ZSAinHL8nMPhJ01gTiiCPVtuVTnyHBco13P1/p4OXyzDYenLLYquT3I41BP4WTQ/GhK0DdrQY08mlLTH0NKUfPQMmnwEW8iQgMWAdv4nFhUDNAvjasupNhBDC6T/TzfsXasbD4mRMc6yiXmO9za45oFyOVWQ=
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DBBPR08MB6073.eurprd08.prod.outlook.com (2603:10a6:10:1f7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Fri, 27 Nov
 2020 14:25:09 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef%2]) with mapi id 15.20.3589.030; Fri, 27 Nov 2020
 14:25:08 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 3/3] ns16550: Gate all PCI code with CONFIG_X86
Thread-Topic: [PATCH v4 3/3] ns16550: Gate all PCI code with CONFIG_X86
Thread-Index: AQHWw1cvjUPnGDPA302zQ9SdCrcARancBA0AgAAHeoA=
Date: Fri, 27 Nov 2020 14:25:08 +0000
Message-ID: <2E5C1B9B-FB45-4566-9DA9-FE7D00B5AE16@arm.com>
References: <cover.1606326929.git.rahul.singh@arm.com>
 <6d64bb35a6ce247faaa3df2ebae27b6bfa1d969e.1606326929.git.rahul.singh@arm.com>
 <bacfe1c3-d86d-95b2-c52a-4bb86f1338ea@suse.com>
In-Reply-To: <bacfe1c3-d86d-95b2-c52a-4bb86f1338ea@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 29223fb9-992b-4739-f787-08d892e0495b
x-ms-traffictypediagnostic: DBBPR08MB6073:|DBBPR08MB6011:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB6011C594F2518A421938A5C7FCF80@DBBPR08MB6011.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hoWju5HdNVcjStV1ANG1QyQBplXXqcPHcUR/5v7JfpKjXniArRtVNNyaTcbn4lc8I5STXR9YRp3IUo5fl0QIJnj+/Kd3FGuGJI6Da0SOxiM2M3CRRjA4svxCeti5Q/Mxr9ErKgudc9xXPHkiLUmitqKFQwuOkVe8kjneMK/NrJssEBZirK69BR9H7phkap9tRHLQWR65z+TzK+XlsaP6Yd4q4WiIQJpB0mzXKZY3QB8Or51+canox8n2QanwomBvbgZ658C9J/XbAiviex5lkSoTYt3IFP6d+qMOrqvrhpzZEtbcFsz+sLIzZkpRhSXppLt0wHOgyYhA/u8L0gxvMg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(396003)(346002)(39860400002)(136003)(36756003)(86362001)(33656002)(478600001)(71200400001)(6512007)(2616005)(4326008)(54906003)(8676002)(5660300002)(26005)(2906002)(8936002)(186003)(53546011)(6916009)(91956017)(6486002)(316002)(76116006)(66476007)(6506007)(66446008)(66946007)(64756008)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?jUMMd7jQA7Q/bwoKzrvA2668oPOeumluMxdu7whg5HmJcGxG5XzM2BeAGQMK?=
 =?us-ascii?Q?y0PGe2rqVubeqg4F+A8zQgf8ePBwxX5TuRetvulVrflxMlOOYJzKC6kTcUa/?=
 =?us-ascii?Q?/M9d1pBlOBexkaKGm6zqgvQBMlf9A8linVEG0cBmH2awUfW67U5pDFopvZte?=
 =?us-ascii?Q?xIozXtZgTX661ViZ41M7UB2LIF488WENXCRCTg7KOxgKoi9zuhoqT5KzrI31?=
 =?us-ascii?Q?C9EoUe0UUBVmvMTblZUXZGn8H4Dmlo5NiNxoywbGKUKYak3OT+42HwXkPi6g?=
 =?us-ascii?Q?CEkWMyKmlxb7lBVgYg41cIuRfHrnTF7YFKS/RW321oicuIXeh2gLgt4HL3sy?=
 =?us-ascii?Q?mwqUYtDb+Oi2zKNTIK0wT4/j271Yo6HvAK9DKhxo0aKHfD7xGIk2Q88ONH47?=
 =?us-ascii?Q?7zHjL4e0GRUPwrs/52awdlueJC7aft0IY8y1AbwZUCWws/P5aRFeHOXhO0i3?=
 =?us-ascii?Q?0lKLy8X2AQXwHaxDWyZtKVRWZtrS/avJNBUNm35ZTwGeUuA9N7fJwWSg/ipE?=
 =?us-ascii?Q?eMrieAweaoXz+rcT/CDxTr8jece6cBC9uRRl4V4pSC39B864XIgb0C+rXb1W?=
 =?us-ascii?Q?Kog6djD01z0Rx/rluCioVIkl3JC5/pVhVAr/UZNMbsRWHz9psoiwGvJM58Rr?=
 =?us-ascii?Q?IK4udm4F3hipYJnqG3tq34cE28D2dbS11/46dQBeeF0mCVNgo4Yn3qZuQz1F?=
 =?us-ascii?Q?netwjP/ieMJENsS6fHGOdhweInfBjUsTOJAHxcNyHQpYYbUEJgHBiJL0YrHu?=
 =?us-ascii?Q?gonzob947zKpgk5p93hWry0znKhjdVG3lxjzhZ7ntHUT0HfeeLpDM/BAvRUJ?=
 =?us-ascii?Q?Q5OZkAKtIrA+M3WZ+Phb5/wm1PGQn4IpULMI+tiliqP7Jx/Z6z1oEzFJ/54d?=
 =?us-ascii?Q?zgDoDLN/o7+eQyoph350C6PGuDqCx7pEShQ1avIX4SCrNC7QjhZf917BWDyB?=
 =?us-ascii?Q?svf+Jxua79wa0Bwlos7SnXk5t2jLKT7iWatijPe/4OVPmfXImDXD63hsIA7h?=
 =?us-ascii?Q?H8nj?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5C1951913E8B5C45BFA8B5916A5C7B39@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6073
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	00c16ae8-ebd8-4666-cba2-08d892e03e31
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U2d8ob+37NeLQ/ogTIoHYq8SgqJ6VAun7J/I2YcdmoV//i0MrVfekCO9ZXi7P7K7arTBxYIYXllbDLdaEnH+Vsg3jk+W+cMm7fpeR8aA0GiaaSk/0x3UvJa27r04wrcQoTKa5ktatce9iwMZKonk3wD6lF2RKq/qXQ08Byk82OyyVc/5GrLZfq2N8AkM2LV6IJNsr4p99V2YKCJE+DemzXosNVdrolY0o4lLe8rxIKYxH1eFO2WXfvm4JvVCHq/MDsIqUGUIlBFwR1CYTLxlMy7igNzszMkkfF+ItdFdGcCichFjmb9BxAfn2QksCQcgqKn/3SU6Iual3OAPita2fwE9h0+ElJaWb+FxPKj8Po84L/PEHvndU1af6M02UkG08lAyixaw0w+0EDyYIfTHMQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(396003)(376002)(46966005)(70206006)(86362001)(70586007)(478600001)(8676002)(26005)(186003)(6506007)(53546011)(82310400003)(6862004)(54906003)(316002)(4326008)(36756003)(82740400003)(33656002)(5660300002)(356005)(47076004)(2616005)(6486002)(6512007)(336012)(8936002)(2906002)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:25:27.2659
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29223fb9-992b-4739-f787-08d892e0495b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6011

Hello Jan,

> On 27 Nov 2020, at 1:58 pm, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 25.11.2020 19:16, Rahul Singh wrote:
>> --- a/xen/drivers/char/ns16550.c
>> +++ b/xen/drivers/char/ns16550.c
>> @@ -16,7 +16,7 @@
>> #include <xen/timer.h>
>> #include <xen/serial.h>
>> #include <xen/iocap.h>
>> -#ifdef CONFIG_HAS_PCI
>> +#if defined(CONFIG_X86) && defined(CONFIG_HAS_PCI)
>> #include <xen/pci.h>
>> #include <xen/pci_regs.h>
>> #include <xen/pci_ids.h>
>> @@ -51,7 +51,7 @@ static struct ns16550 {
>>     unsigned int timeout_ms;
>>     bool_t intr_works;
>>     bool_t dw_usr_bsy;
>> -#ifdef CONFIG_HAS_PCI
>> +#if defined(CONFIG_X86) && defined(CONFIG_HAS_PCI)
>=20
> I'm sorry to be picky, but this being a hack wants, imo, also calling
> it so, by way of a code comment. Clearly this should go at one of the
> first instances, yet neither of the two above are really suitable imo.
> Hence I'm coming back to my prior suggestion of introducing a
> consolidated #define without this becoming a Kconfig setting:
>=20
> /*
> * The PCI part of the code in this file currently is only known to
> * work on x86. Undo this hack once the logic has been suitably
> * abstracted.
> */
> #if defined(CONFIG_HAS_PCI) && defined(CONFIG_X86)
> # define NS16550_PCI
> #endif
>=20
> And then use NS16550_PCI everywhere. I'd be fine making this
> adjustment while committing, if I knew that (a) you're okay with it
> and

Thanks for reviewing the code.I am ok with it.

> (b) the R-b and A-b you've already got can be kept.
>=20
> Jan
>=20


