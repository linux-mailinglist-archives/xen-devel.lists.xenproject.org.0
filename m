Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C3729067E
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 15:44:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8094.21565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTQ1c-0000Gm-3f; Fri, 16 Oct 2020 13:44:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8094.21565; Fri, 16 Oct 2020 13:44:04 +0000
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
	id 1kTQ1c-0000GP-0R; Fri, 16 Oct 2020 13:44:04 +0000
Received: by outflank-mailman (input) for mailman id 8094;
 Fri, 16 Oct 2020 13:44:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wl+D=DX=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kTQ1a-0000GK-2A
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 13:44:02 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.59]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e8f0548-fdc3-458c-9cc4-fa363a163964;
 Fri, 16 Oct 2020 13:44:00 +0000 (UTC)
Received: from AM6PR04CA0047.eurprd04.prod.outlook.com (2603:10a6:20b:f0::24)
 by AM0PR08MB5250.eurprd08.prod.outlook.com (2603:10a6:208:160::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Fri, 16 Oct
 2020 13:43:58 +0000
Received: from VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::8d) by AM6PR04CA0047.outlook.office365.com
 (2603:10a6:20b:f0::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend
 Transport; Fri, 16 Oct 2020 13:43:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT016.mail.protection.outlook.com (10.152.18.115) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Fri, 16 Oct 2020 13:43:56 +0000
Received: ("Tessian outbound e6c55a0b9ba9:v64");
 Fri, 16 Oct 2020 13:43:56 +0000
Received: from d2702fef3c45.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7685BBA7-6028-4D58-8EF1-D222E626ACDF.1; 
 Fri, 16 Oct 2020 13:43:50 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d2702fef3c45.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 16 Oct 2020 13:43:50 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4540.eurprd08.prod.outlook.com (2603:10a6:10:c1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Fri, 16 Oct
 2020 13:43:48 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.021; Fri, 16 Oct 2020
 13:43:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=wl+D=DX=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kTQ1a-0000GK-2A
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 13:44:02 +0000
X-Inumbo-ID: 2e8f0548-fdc3-458c-9cc4-fa363a163964
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown [40.107.5.59])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 2e8f0548-fdc3-458c-9cc4-fa363a163964;
	Fri, 16 Oct 2020 13:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YBwo7/KnBKZGR/GafM7NrcqA6CevgypttbbL0iwk1w=;
 b=6nL1UqXzEEp+L6D4Sk90xTLgQ8VmPm4qI+2qwuX6zB2opcBgvAW9Ymh1uSaEZWEORkkIOHeCXm3WbtaTnrc3O9P5buB+GB8BtbScbqfqcGWyWLarq3yNIWDs39KmdKWbBomVMH195y9wurU1EXs1JDPUDIUJJX+z5ppb0DqaJ8s=
Received: from AM6PR04CA0047.eurprd04.prod.outlook.com (2603:10a6:20b:f0::24)
 by AM0PR08MB5250.eurprd08.prod.outlook.com (2603:10a6:208:160::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Fri, 16 Oct
 2020 13:43:58 +0000
Received: from VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::8d) by AM6PR04CA0047.outlook.office365.com
 (2603:10a6:20b:f0::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend
 Transport; Fri, 16 Oct 2020 13:43:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT016.mail.protection.outlook.com (10.152.18.115) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Fri, 16 Oct 2020 13:43:56 +0000
Received: ("Tessian outbound e6c55a0b9ba9:v64"); Fri, 16 Oct 2020 13:43:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 508a43c2fb0d6a21
X-CR-MTA-TID: 64aa7808
Received: from d2702fef3c45.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7685BBA7-6028-4D58-8EF1-D222E626ACDF.1;
	Fri, 16 Oct 2020 13:43:50 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d2702fef3c45.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 16 Oct 2020 13:43:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3EALQsx5mFS6mMBkEIjXXFu3bSYTJQRE3tmYLMQL/vTszw6NMbqYuivEdw0fxzL1DxSIXVBCl1+YaznnK+AW+MMXtiHeTQ+1TUlXe6HP1HUDAa0yHm5+5ad8Rb2MeDqRGuUvLtt7KXYaM5eCQYUWCemSRk8rJRdGak5TEqUfC+LaA2L+AIrgkF7BAJzzZ04wMQJBJAdahW+wZVAdRgTywQamI881/qMJzSdozyplhI27rERBgwTzcVZp4xtovtZZO8MOdLhJJMWQ/M78mcetDwM8ZLQwsiCNKNrkoQV5WlMn2pnkB+QByLsBZLUSmq4pTOULO4wCRZj/j34SXTvAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YBwo7/KnBKZGR/GafM7NrcqA6CevgypttbbL0iwk1w=;
 b=A2dQQMGy1JXBzHp31NsVWOfl5zzDejPxU1/XzlFodQzAKjTJa0SWld3DS111Eda3J0AxT0e05V492ec6I/3zV3SwbjGHj2kAsA1RZLEIdY8wsIENvjNLYy9ulWas+96BG5pB0HCR+cxTjhsHp1a29IH+3zm51rNYLgbeNEOzhDj53jnHUTXSNkQDpUxInaSge54d21uR/wa7N9ZTCIisJlS9LWXjk1brkoYGAJ2+J8TA+1bkJSRbEzwSAy2a4uSh6O886+KJEjVIO3tcDj81rI2JAXFZKHOWQkMTAGgvRoBY2kRVU/jDsqWac4Zej8QUmBBoGpRlcW/ty6NwJlg8XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YBwo7/KnBKZGR/GafM7NrcqA6CevgypttbbL0iwk1w=;
 b=6nL1UqXzEEp+L6D4Sk90xTLgQ8VmPm4qI+2qwuX6zB2opcBgvAW9Ymh1uSaEZWEORkkIOHeCXm3WbtaTnrc3O9P5buB+GB8BtbScbqfqcGWyWLarq3yNIWDs39KmdKWbBomVMH195y9wurU1EXs1JDPUDIUJJX+z5ppb0DqaJ8s=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4540.eurprd08.prod.outlook.com (2603:10a6:10:c1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Fri, 16 Oct
 2020 13:43:48 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.021; Fri, 16 Oct 2020
 13:43:48 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Wei Liu <wl@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian
 Jackson <iwj@xenproject.org>
Subject: Re: [PATCH v3] tools/xenpmd: Fix gcc10 snprintf warning
Thread-Topic: [PATCH v3] tools/xenpmd: Fix gcc10 snprintf warning
Thread-Index: AQHWotP5wvQAAnPEZ06mRJYSlYfV46maOtSAgAAEQoA=
Date: Fri, 16 Oct 2020 13:43:48 +0000
Message-ID: <E8ECEA42-842F-4F66-BF86-1FB5F787D906@arm.com>
References:
 <14ac4900dcf4fb9b45ce4f5e3d60de7f7e3602ab.1602753323.git.bertrand.marquis@arm.com>
 <20201016132833.fadg2dtj2q6pshrj@liuwe-devbox-debian-v2>
In-Reply-To: <20201016132833.fadg2dtj2q6pshrj@liuwe-devbox-debian-v2>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1b00998b-c334-4197-8a43-08d871d98785
x-ms-traffictypediagnostic: DBBPR08MB4540:|AM0PR08MB5250:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB5250430E033C3F934E8E5FE39D030@AM0PR08MB5250.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5236;OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 y0V7kXjSCOCeYCY7tHHpUKWOF/mCJ/rCIjx8DdQNKvUsssZT+aAHxlDbGJULB4zxOAAbhQ75YcKhwizo5DbWjJQLoZFzODR42Ey66NprHTMneyj5NlHL0gNhgYLXBbVBris2qxFFOmps0A1QsdBmi8eA7SJqoiFGu/8npXZ180y67Q5UXTLLLj6fge3mbufXA/PHTrmnkOYQ6G+KW1xx39e3ZmV9ibH945pTqJlNmnYMQPjntjGpFwpfCZqLX1/99FdmgDAz66wvO9cpRC3T0cqQHgGx4cK5rZZVT2kXSz+b6jcuQVpQbaEjBlznCy/Z+PmIjjdqnIla3PdsAGsTlpICsjFImplW00OUFthRvasl2n4x4pc8TrJ0JmQckSEcUJVJ28leDWPlP+t4iN0p1Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39860400002)(346002)(376002)(396003)(6506007)(54906003)(478600001)(36756003)(966005)(53546011)(4326008)(316002)(71200400001)(8936002)(26005)(2906002)(8676002)(4744005)(5660300002)(66946007)(91956017)(33656002)(76116006)(64756008)(66476007)(186003)(83380400001)(6486002)(86362001)(6512007)(6916009)(66446008)(2616005)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 BsLhek1evqpJDcl2vVghsfaua4utROSCWDGwSyspO52cgdxSSCUBgPZPvUyDiIm8Ohxbv1eXi2w78VTE+c14OeRJ7RHaSXxDuOOjvrZSSf+u0kpouQmXJfsXZWsuoa4OAZA39ebdFXotn4jtDSbh/EyYn3ND9XBZllsm4Np3kvNIQcJ6wqtsZM7ow14TxX55FU7Zi9L+hnV6QhdIQelmlijFkTodbqFrv3iFiSouDh2tfIg8SRvIsI5Z/4hGD1HDlkku31eQVW5dGGQnw8fbnSEioidqS5ngvqxJwCOtYvUTZkJt8Fh0HpSgqG1GSErrwz2cxMLoPD1u7tUBinFJHLYq91avwuarj7CLSXDjCsiIgtBso0tsVW2ghrmJ5X3BkyyHTdUoyfPN1jEmIq5RQHI1SkOAyJm1BdqwEMn1SXZgdGPE7uj8cRzWRLYGR54iFabON3tQ4V/OxOevu79K1rS+Ej98kA3p98cB3UQkPBHqd6M1ex716dxSlSYBQUwIYdUzRzpaUH28ljK3b1K9OHUEXbYauqrn9Yie+WqyJHp9y5bOdnGGnKHNDyWCsgDjcBS6GUMq00ScfynuAOs1fep4xjdyRJkcRWd1MSRbUXl9nge/i3azFVi52ZoWJyUt+481CFIlKHnyaaTbwRuFcg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <47CBC0C6CC6F3A46BFDBBD44B2C26578@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4540
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3357a7dd-4440-41a4-9464-08d871d98267
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iuS8IkjfZCPKsZtAgDlBEdZz1iRYFcu9nZDoOASzpxa3l/KnGpL1leneH58e1qFUqinKZJbkPwnh3idXvnzJF+pntRvBPeE9SCr3UHdKPTvGADfCVEJJJbODV7V8bkwmgXUovqkHOpsgp/fDMBLt9pkF6ecpyQJFaoSvLSg3rii0JZPrIOtq9EM7U+5B0AqHQUhoqgeEuufiu0dLksagmjqfv9eqNfsppgCAxWHb1qR+RjAAzTEF7+D9OFeuvTUu+D2J/RbunIcP6CaP6qN56FnUiywZZQ0Bz7aEIsrgby8kyL0k+NObDCxVhr0nU5SR855BZ0YErXs1DHtVkCSGEShVHnwmmJ2GtXuIzi0l98uzDcU2T9Un1ceFc1aVmcahBv6awQXALc5lvLHXX0iE/T9lQVMpVjcEhELBdX72VtR7O7JlyXBLIAx5N/qUaTIgEUIKEP4vg5PZ62wX3SaSskDq1qHM/8fbGiap87joX5M=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(376002)(346002)(46966005)(54906003)(316002)(47076004)(336012)(2616005)(2906002)(478600001)(86362001)(4326008)(966005)(6862004)(70586007)(70206006)(36756003)(6486002)(53546011)(6506007)(186003)(26005)(33656002)(8936002)(6512007)(8676002)(356005)(82740400003)(81166007)(5660300002)(82310400002)(83080400001)(4744005)(36906005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2020 13:43:56.6943
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b00998b-c334-4197-8a43-08d871d98785
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5250



> On 16 Oct 2020, at 14:28, Wei Liu <wl@xen.org> wrote:
>=20
> On Thu, Oct 15, 2020 at 10:16:09AM +0100, Bertrand Marquis wrote:
>> Add a check for snprintf return code and ignore the entry if we get an
>> error. This should in fact never happen and is more a trick to make gcc
>> happy and prevent compilation errors.
>>=20
>> This is solving the following gcc warning when compiling for arm32 host
>> platforms with optimization activated:
>> xenpmd.c:92:37: error: '%s' directive output may be truncated writing
>> between 4 and 2147483645 bytes into a region of size 271
>> [-Werror=3Dformat-truncation=3D]
>>=20
>> This is also solving the following Debian bug:
>> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D970802
>>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>=20
> Acked-by: Wei Liu <wl@xen.org>

Thanks :-)

Bertrand


