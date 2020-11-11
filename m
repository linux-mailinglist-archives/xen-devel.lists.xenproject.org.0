Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBCA2AE767
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 05:29:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24196.51336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kchkp-0004MQ-HC; Wed, 11 Nov 2020 04:29:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24196.51336; Wed, 11 Nov 2020 04:29:07 +0000
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
	id 1kchkp-0004M1-E5; Wed, 11 Nov 2020 04:29:07 +0000
Received: by outflank-mailman (input) for mailman id 24196;
 Wed, 11 Nov 2020 04:29:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u/uh=ER=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
 id 1kchkn-0004Lw-On
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 04:29:05 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.71]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 39a8fe24-abbc-4427-b42f-ff739c71b4b9;
 Wed, 11 Nov 2020 04:29:02 +0000 (UTC)
Received: from AM6P193CA0098.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::39)
 by AM9PR08MB6177.eurprd08.prod.outlook.com (2603:10a6:20b:283::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Wed, 11 Nov
 2020 04:28:59 +0000
Received: from AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::76) by AM6P193CA0098.outlook.office365.com
 (2603:10a6:209:88::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Wed, 11 Nov 2020 04:28:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT006.mail.protection.outlook.com (10.152.16.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.22 via Frontend Transport; Wed, 11 Nov 2020 04:28:58 +0000
Received: ("Tessian outbound 797fb8e1da56:v71");
 Wed, 11 Nov 2020 04:28:58 +0000
Received: from 82b69ba6d817.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A57435CF-82EB-43AD-B4BC-275437473E78.1; 
 Wed, 11 Nov 2020 04:28:53 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 82b69ba6d817.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Nov 2020 04:28:53 +0000
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com (2603:10a6:208:105::24)
 by AM0PR08MB4131.eurprd08.prod.outlook.com (2603:10a6:208:129::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Wed, 11 Nov
 2020 04:28:52 +0000
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::257f:eb47:fe85:5993]) by AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::257f:eb47:fe85:5993%3]) with mapi id 15.20.3499.032; Wed, 11 Nov 2020
 04:28:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=u/uh=ER=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
	id 1kchkn-0004Lw-On
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 04:29:05 +0000
X-Inumbo-ID: 39a8fe24-abbc-4427-b42f-ff739c71b4b9
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown [40.107.20.71])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 39a8fe24-abbc-4427-b42f-ff739c71b4b9;
	Wed, 11 Nov 2020 04:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QS7xoR716HkevH42CvyZCMeN8quVhoRGF5711cjYfKk=;
 b=Pdv2VdfbvVCm0gh5QSmv+marAB5hcM83rtqDUKi4VnDj1PyqRNz4d3xbp2fdgqeYY38Z+Z3OxGhBG5chvmtyhcpjUuQ+7gFfEHdwcl12UEU0mP4oIsl4Xg2yIUB6j2IQ7/R8mFzgYv4dxlieKvg2jc1gR4AvKubKqg8pLg9LHKs=
Received: from AM6P193CA0098.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::39)
 by AM9PR08MB6177.eurprd08.prod.outlook.com (2603:10a6:20b:283::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Wed, 11 Nov
 2020 04:28:59 +0000
Received: from AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::76) by AM6P193CA0098.outlook.office365.com
 (2603:10a6:209:88::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Wed, 11 Nov 2020 04:28:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT006.mail.protection.outlook.com (10.152.16.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.22 via Frontend Transport; Wed, 11 Nov 2020 04:28:58 +0000
Received: ("Tessian outbound 797fb8e1da56:v71"); Wed, 11 Nov 2020 04:28:58 +0000
X-CR-MTA-TID: 64aa7808
Received: from 82b69ba6d817.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A57435CF-82EB-43AD-B4BC-275437473E78.1;
	Wed, 11 Nov 2020 04:28:53 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 82b69ba6d817.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 11 Nov 2020 04:28:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gecXuaWo07v9AA1MeaqH7jFzplMtQiBfcY/pWIoRITt8LSBzcfjk34QTrr7Vu127aPQxbFaD8BPfxlKgmj6bnXYdevMY9fAwjDsFKnYq1e4AyjFq18SDNHMG9n8Cwdp3kImgq4anIYcBZtzVWccm7DBa0jz8ttoU3zHAfEIQ+zvjLAg5EodEvg2F0qfzEn3pAfLQYProIX8da4alKkmmQxEbrR941rt72pepDd9xaxorjkCk/t5UCVq57+Jq7nFGAQtjuhstQ1u9Z43a9ZQkAQrVI3P5hMz0mEQ+QmAcvxuM4W4KZDrk4VvJK8eRiumnEJqKaPSK/rDiGkacaEBe8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QS7xoR716HkevH42CvyZCMeN8quVhoRGF5711cjYfKk=;
 b=HgggEgP6ajZjsl9yDGjtdoKHjcz1RQWKE6AiWjJbWqQfdKDzILoNmahbFLXPQrdbE1/tpvDxCELzPAfD+xDK9oWoLbQ+TtDrUBEb6BzNBum2f5gAu+bmCbPMjNULuRY2s2kakh++Ep2Sn/hR0do1ECrRckmE3jqXRm0O8jhBbPv7+jq7Yp0PEUrs8WUJVuswM8KyJxk4yaKFqAsSnFh0MuEFnthDgE5UpXOciSr8KcLika2URuPNbWNX27wofZ9tWYgc9FSn4qM9Jn7TeIqqR3AFX44ogeiEgu3u97ZfQZB0s3cdyOaLop4mu278Qc73ZX5G3vPAGvXHCzYhIr3F7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QS7xoR716HkevH42CvyZCMeN8quVhoRGF5711cjYfKk=;
 b=Pdv2VdfbvVCm0gh5QSmv+marAB5hcM83rtqDUKi4VnDj1PyqRNz4d3xbp2fdgqeYY38Z+Z3OxGhBG5chvmtyhcpjUuQ+7gFfEHdwcl12UEU0mP4oIsl4Xg2yIUB6j2IQ7/R8mFzgYv4dxlieKvg2jc1gR4AvKubKqg8pLg9LHKs=
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com (2603:10a6:208:105::24)
 by AM0PR08MB4131.eurprd08.prod.outlook.com (2603:10a6:208:129::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Wed, 11 Nov
 2020 04:28:52 +0000
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::257f:eb47:fe85:5993]) by AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::257f:eb47:fe85:5993%3]) with mapi id 15.20.3499.032; Wed, 11 Nov 2020
 04:28:51 +0000
From: Wei Chen <Wei.Chen@arm.com>
To: Oleksandr <olekstysh@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: RE: [PATCH V2 23/23] [RFC] libxl: Add support for virtio-disk
 configuration
Thread-Topic: [PATCH V2 23/23] [RFC] libxl: Add support for virtio-disk
 configuration
Thread-Index: AQHWoxPDW60DxIWT4kuneyvO4zzD5qm/gHcQgALDY4CAAC0d4A==
Date: Wed, 11 Nov 2020 04:28:51 +0000
Message-ID:
 <AM0PR08MB3747DB347ED64AF7DF99C5A19EE80@AM0PR08MB3747.eurprd08.prod.outlook.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-24-git-send-email-olekstysh@gmail.com>
 <AM0PR08MB374735F747FFF1A3016F37329EEA0@AM0PR08MB3747.eurprd08.prod.outlook.com>
 <99636dd8-4c90-bb84-b96f-6c7a9ad31b63@gmail.com>
In-Reply-To: <99636dd8-4c90-bb84-b96f-6c7a9ad31b63@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 59D392A2A9911740BCC0CA5B760E3456.0
x-checkrecipientchecked: true
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [218.82.77.130]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 029ad72d-21e2-4ca3-456c-08d885fa4f1d
x-ms-traffictypediagnostic: AM0PR08MB4131:|AM9PR08MB6177:
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB6177F705FB0CB115B7385A099EE80@AM9PR08MB6177.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 SEz3YLvgmPPcuDNfIQBu7c62diE7KNEe8NN42vjja4W/KUTFrJrPzuyJaTKMW+Mt4/4/uc8UQ6hViTQIDdzuReK2xy3WIJ/6VIPEsnsoDcBAUwIj/yiTy4Xqqbep2hMsvzms5FQz2irdp0ISVFypLnmo5wAYuMKow3GwxZ15aAmMre2VzaxtiYIapVAJvSlOghCy/fYaSAP3VRP3jecLR1AHhwb+w9zQEqCwIFxurqfVkmfAkUtvqIuU2C4ThaUgh0OhIqPllN1ZWQbZagcx6ka5oMjMYITZN9B/yImHqNfsQXvrKBzAo3ZljobZLGYkpo2rsFLoEH4D01JW4IBXhA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3747.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(39850400004)(376002)(346002)(186003)(55016002)(66446008)(64756008)(66556008)(66476007)(53546011)(9686003)(76116006)(26005)(7696005)(5660300002)(6506007)(52536014)(66946007)(83380400001)(2906002)(478600001)(54906003)(110136005)(316002)(86362001)(8936002)(4326008)(8676002)(33656002)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 pumtL2/frRmLbSOGsvQyR8v+rizyfJkKzVPQaF+xHo/xhWfLShak5T4sTfA/fE8F1uqQx64jHcy9KzBPXfp3mfg2uICQ+wyuTxmQAQiwpC0KkWVv8Pp05eYOTsnY8qryL9qjnh5PBtNPKkRiIAk6vCJoT/Tllv5f20J0omaOe/4vSan0wIF4hFQdfntzvqSYLHvRCwLl8I0QgaGpVmg4bJmMeiiTVt18j4ZP2PIg1OKu2wPEPkOy3K95dHoKdSHj+U1Rzlwx/WUSkzWMm9sUUBkrbEtZp/EMGD2jnLIHUhBMcoPOgcBtypOabVP5Xdd96qbiMAMyNNVXtnrvxZjx4JpSB1wzBOaeOHuXiJ05z33VJ5z+6nYVhnMmmXTKELHtcTRhGgI18+MXUBADxLTOmIZEtYvg3jDo7mDpTi/L/HFjYEyXkrvw4iZNYy+AdL6aBRkQIaontAjVFtVTfydxYevA7a6dH1sY1FPmgvm1gGDBUoY7j5r36nIdR73ey/EhexmTT4Zq6Po1+OaCCHuWSeDPXWjfruRk/zZKfvYyXYvhc3TdhRcgJ62yWGujYHN2vNwElw1EaSaDNcRZsM62iwTdWCSzXq/HKtdOy1i+DcLY6Ldny9zCadH6AMc8MYMtL3s+v+kN3S4S+XkIbia80g==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4131
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9f92384c-e403-4c40-7b9e-08d885fa4b01
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8L8sTMNtcpW1wTnHH96/1oYwBOm9N5mJsqCkOY9nUdn4dEWL5goFnCcrrx3efNTyp9BkdaSRao2OzkE4cExJ3oJSUDR6GCJJvr+AFEoduKfj9u9cujvUQLPS2wBFjuLE4eYJuPia/Wk7JPI1Gw395a2LtA4EC+GvaMNtuoqm3tNIlYSLRcHL0975+KVN60GeUyX9l7qss8VeL3T5Iq/LPa0SjKVv+lPX2ymk5OqozEaHWgnGx1jBC8h/DP1dr4GP+9Bkc5tTnq1OfQLxX8qm+hq6XKHwCQb/SgY6mjRE+QLOQe2Ri+I/lxg/IWepVOHwo+2H+cBvlvkJH8rf3MdkxIzp7hEVDCAsnGDRlmRwD9IN432rq/31oHyn1Is6/h48822qKZMiO+NgyCAVgA93oQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(39850400004)(376002)(396003)(46966005)(70206006)(70586007)(356005)(110136005)(54906003)(336012)(82310400003)(478600001)(26005)(186003)(316002)(36906005)(6506007)(107886003)(53546011)(8676002)(81166007)(33656002)(8936002)(2906002)(7696005)(9686003)(82740400003)(47076004)(5660300002)(52536014)(55016002)(4326008)(86362001)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2020 04:28:58.7812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 029ad72d-21e2-4ca3-456c-08d885fa4f1d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6177

SGkgT2xla3NhbmRyLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE9s
ZWtzYW5kciA8b2xla3N0eXNoQGdtYWlsLmNvbT4NCj4gU2VudDogMjAyMOW5tDEx5pyIMTHml6Ug
ODo1Mw0KPiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcNCj4gQ2M6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlz
aGNoZW5rb0BlcGFtLmNvbT47IElhbiBKYWNrc29uDQo+IDxpd2pAeGVucHJvamVjdC5vcmc+OyBX
ZWkgTGl1IDx3bEB4ZW4ub3JnPjsgQW50aG9ueSBQRVJBUkQNCj4gPGFudGhvbnkucGVyYXJkQGNp
dHJpeC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgU3RlZmFubyBTdGFiZWxs
aW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIFYy
IDIzLzIzXSBbUkZDXSBsaWJ4bDogQWRkIHN1cHBvcnQgZm9yIHZpcnRpby1kaXNrDQo+IGNvbmZp
Z3VyYXRpb24NCj4gDQo+IA0KPiBPbiAwOS4xMS4yMCAwODo0NSwgV2VpIENoZW4gd3JvdGU6DQo+
ID4gSGkgT2xla3NhbmRyLA0KPiANCj4gSGkgV2VpDQo+IA0KPiANCj4gPg0KPiA+PiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3Vu
Y2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YNCj4gPj4gT2xla3NhbmRyIFR5
c2hjaGVua28NCj4gPj4gU2VudDogMjAyMOW5tDEw5pyIMTbml6UgMDo0NQ0KPiA+PiBUbzogeGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+ID4+IENjOiBPbGVrc2FuZHIgVHlzaGNoZW5r
byA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+OyBJYW4gSmFja3Nvbg0KPiA+PiA8aXdq
QHhlbnByb2plY3Qub3JnPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IEFudGhvbnkgUEVSQVJEDQo+
ID4+IDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVu
Lm9yZz47IFN0ZWZhbm8NCj4gU3RhYmVsbGluaQ0KPiA+PiA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz4NCj4gPj4gU3ViamVjdDogW1BBVENIIFYyIDIzLzIzXSBbUkZDXSBsaWJ4bDogQWRkIHN1cHBv
cnQgZm9yIHZpcnRpby1kaXNrDQo+IGNvbmZpZ3VyYXRpb24NCj4gPj4NCj4gPj4gRnJvbTogT2xl
a3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPg0KPiA+Pg0K
PiA+PiBUaGlzIHBhdGNoIGFkZHMgYmFzaWMgc3VwcG9ydCBmb3IgY29uZmlndXJpbmcgYW5kIGFz
c2lzdGluZyB2aXJ0aW8tZGlzaw0KPiA+PiBiYWNrZW5kIChlbXVhbGF0b3IpIHdoaWNoIGlzIGlu
dGVuZGVkIHRvIHJ1biBvdXQgb2YgUWVtdSBhbmQgY291bGQgYmUgcnVuDQo+ID4+IGluIGFueSBk
b21haW4uDQo+ID4+DQo+ID4+IFhlbnN0b3JlIHdhcyBjaG9zZW4gYXMgYSBjb21tdW5pY2F0aW9u
IGludGVyZmFjZSBmb3IgdGhlIGVtdWxhdG9yIHJ1bm5pbmcNCj4gPj4gaW4gbm9uLXRvb2xzdGFj
ayBkb21haW4gdG8gYmUgYWJsZSB0byBnZXQgY29uZmlndXJhdGlvbiBlaXRoZXIgYnkgcmVhZGlu
Zw0KPiA+PiBYZW5zdG9yZSBkaXJlY3RseSBvciBieSByZWNlaXZpbmcgY29tbWFuZCBsaW5lIHBh
cmFtZXRlcnMgKGFuIHVwZGF0ZWQgJ3hsDQo+IGRldmQnDQo+ID4+IHJ1bm5pbmcgaW4gdGhlIHNh
bWUgZG9tYWluIHdvdWxkIHJlYWQgWGVuc3RvcmUgYmVmb3JlaGFuZCBhbmQgY2FsbA0KPiBiYWNr
ZW5kDQo+ID4+IGV4ZWN1dGFibGUgd2l0aCB0aGUgcmVxdWlyZWQgYXJndW1lbnRzKS4NCj4gPj4N
Cj4gPj4gQW4gZXhhbXBsZSBvZiBkb21haW4gY29uZmlndXJhdGlvbiAodHdvIGRpc2tzIGFyZSBh
c3NpZ25lZCB0byB0aGUgZ3Vlc3QsDQo+ID4+IHRoZSBsYXR0ZXIgaXMgaW4gcmVhZG9ubHkgbW9k
ZSk6DQo+ID4+DQo+ID4+IHZkaXNrID0gWyAnYmFja2VuZD1Eb21ELCBkaXNrcz1ydzovZGV2L21t
Y2JsazBwMztybzovZGV2L21tY2JsazFwMycgXQ0KPiA+Pg0KPiA+IENhbiB3ZSBrZWVwIHVzZSB0
aGUgc2FtZSAnZGlzaycgcGFyYW1ldGVyIGZvciB2aXJ0aW8tZGlzaywgYnV0IGFkZCBhbiBvcHRp
b24NCj4gbGlrZQ0KPiA+ICAgIm1vZGVsPXZpcnRpby1kaXNrIj8NCj4gPiBGb3IgZXhhbXBsZToN
Cj4gPiBkaXNrID0gWyAnYmFja2VuZD1Eb21ELCBkaXNrcz1ydzovZGV2L21tY2JsazBwMyxtb2Rl
bD12aXJ0aW8tZGlzaycgXQ0KPiA+IEp1c3QgbGlrZSB3aGF0IFhlbiBoYXMgZG9uZSBmb3IgeDg2
IHZpcnRpby1uZXQuDQo+IA0KPiBJIHRoaW5rLCB0aGlzIG5lZWRzIGFuIGFkZGl0aW9uYWwgaW52
ZXN0aWdhdGlvbi4gSW4gZ2VuZXJhbCBJIGFncmVlIHdpdGgNCj4geW91IHRoYXQgaXQgd291bGQg
YmUgbmljZSB0byByZXVzZSBleGlzdGluZyAnZGlzaycgcGFyYW1ldGVyIHNvbWVob3cNCj4gcmF0
aGVyIHRoYW4gaW50cm9kdWNpbmcgbmV3IG9uZQ0KPiBmb3IgdGhlIHNhbWUgcHVycG9zZSAodG8g
aGFuZGxlIHZpcnR1YWwgYmxvY2sgZGV2aWNlKHMpKS4NCj4gDQo+IA0KPiBPbmUgbm90ZSwgYWx0
aG91Z2ggYm90aCBhcmUgdXNlZCBmb3IgdGhlIHNhbWUgcHVycG9zZSB0aGV5IGFyZSBkaWZmZXJl
bnQNCj4gaW4gYXQgbGVhc3Qgb25lIGltcG9ydGFudCBvcHRpb24uDQo+IA0KPiBGb3IgZXhhbXBs
ZToNCj4gMS4gZGlzayA9IFsgJ2JhY2tlbmQ9RG9tRCwgcGh5Oi9kZXYvbW1jYmxrMHAzLCB4dmRh
MScgXQ0KPiAyLiB2ZGlzayA9IFsgJ2JhY2tlbmQ9RG9tRCwgZGlza3M9cnc6L2Rldi9tbWNibGsw
cDMnIF0NCj4gQXMgeW91IGNhbiBzZWUgZXhpc3RpbmcgImRpc2siIHBhcmFtZXRlciBjb250YWlu
cyB4dmRhMSwgdGhpcyBtZWFucyB0aGF0DQo+IGEgbmV3IGRldmljZSAvZGV2L3h2ZGExIHdpbGwg
YXBwZWFyIGF0IHRoZSBndWVzdCBzaWRlLCBidXQgInZkaXNrIg0KPiBkb2Vzbid0IGNvbnRhaW4g
YW55dGhpbmcgc2ltaWxhci4gU28gd2l0aCBYZW4gUFYgZHJpdmVyICh4ZW4tYmxrZnJvbnQpDQoN
ClllcywgSSB1bmRlcnN0YW5kIHlvdXIgY29uY2VybnMuIEJ1dCBJIHRoaW5rIHNwZWNpZnlpbmcg
YSBkZXZpY2UgbmFtZQ0KZm9yIHZpcnRpbyBkaXNrIGlzIG5vdCBhIG1hbmRhdG9yeSByZXF1aXJl
bWVudC4gRXZlbiBpZiB3ZSdyZSB1c2luZyBwaHlzaWNhbA0KZGlza3Mgb24gYmFyZSBtZXRhbCBt
YWNoaW5lLCB3ZSBjYW4ndCBndWFyYW50ZWUgc2xvdCMxIGRpc2sgaXMgYWx3YXlzICdzZGEnLg0K
U28gbW9zdCBtb2Rlcm4gT1MgYXJlIHByZWZlciB0byB1c2UgYmxraWQgdG8gbW91bnQgZmlsZXN5
c3RlbS4NCg0KPiB3ZSBhcmUgYWJsZSB0byBjb25maWd1cmUgYSBkZXZpY2UgbmFtZSwgYnV0IHdp
dGggVmlydElPIHNvbHV0aW9uDQo+ICh2aXJ0aW8tYmxrKSB3ZSBhcmVuJ3QgKGF0IGxlYXN0IEkg
ZG9uJ3Qga25vdyBob3cgZXhhY3RseSkuDQo+IA0KDQpKdXN0IG15IHVuZGVyc3RhbmRpbmcsIG5v
dCBleGFjdGx5IGFjY3VyYXRlOg0KVGhlIHZpcnRpby1ibGsgY291bGQgbm90IGdldCBWREVWIGlu
Zm9ybWF0aW9uIGZvciBhIGJ1cyBsaWtlIFhlbi1idXMuIFNvIHRoZSBkaXNrDQpJRCBpcyBhbGxv
Y2F0ZWQgZHluYW1pY2FsbHkgaW4gYnVzIHByb2JlIHByb2dyZXNzLiBUaGUgZmlyc3QgcHJvYmVk
IGRpc2sgd2lsbCBnZXQNCklEICdhJy4gQW5kIHRoZW4gdGhlIElEIGtlZXBzIGluY3JlYXNpbmcu
IElmIHdlIHdhbnQgdG8gc3BlY2lmeSB0aGUgZGlzayBJRCBmb3IgdmlydGlvDQpkaXNrLCBvbmUg
cG9zc2libGUgd2F5IHRvIGRvIHRoaXMgaXMgdG8gY29uc3RydWN0IGEgcmVhc29uYWJsZSBwb3Np
dGlvbiBvbiBidXMNCihmZHQgbm9kZSBwb3NpdGlvbiBvZiB2aXJ0aW8gbW1pbyBkZXZpY2UsIFBD
SSBGdW5jdGlvbiBJRCBvZiB2aXJ0aW8gcGNpIGJsb2NrKSBmb3INCnZpcnRpbyBkaXNrLiBCdXQg
aXQgaXMgbm90IGFsd2F5cyBzdWNjZXNzZnVsLCB3ZSBjYW4ndCBza2lwICd2ZGEnIHRvIHNwZWNp
ZnkgYSB2aXJ0aW8NCmRpc2sgYXMgJ3ZkYicuDQoNClJlZ2FyZHMsDQpXZWkgQ2hlbg0KPiANCj4g
DQo+IA0KPiANCj4gLS0NCj4gUmVnYXJkcywNCj4gDQo+IE9sZWtzYW5kciBUeXNoY2hlbmtvDQoN
Cg==

