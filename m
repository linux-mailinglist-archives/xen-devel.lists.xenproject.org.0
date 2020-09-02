Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D7125A7EE
	for <lists+xen-devel@lfdr.de>; Wed,  2 Sep 2020 10:43:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kDOM1-0002nI-8C; Wed, 02 Sep 2020 08:42:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aYcJ=CL=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kDOLz-0002nD-JH
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2020 08:42:51 +0000
X-Inumbo-ID: f92ef4e7-aeb6-452a-952b-965e6e1b750b
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.53]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f92ef4e7-aeb6-452a-952b-965e6e1b750b;
 Wed, 02 Sep 2020 08:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sO5ELdwWrmyCHNqIyiBvZIbpt5IabNQyN7wzP46F2Y4=;
 b=a+a1iNGdnqT9jGmaU5zNCSMV2GUr98yXO7Vo9r81lJZf3TgKPZJvgJW4j4My0b9/OWO49r0Zp7nbLoUJ8MhjvyioZu4VWYByhvSwMXY6mD1tZib9NwDYTc5b/Ul81iTsqsmwwHPWUrw0D3IRA2QGWU0BDtM14QeDp1ApLfqMo7A=
Received: from MR2P264CA0138.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:30::30)
 by PR3PR08MB5643.eurprd08.prod.outlook.com (2603:10a6:102:84::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Wed, 2 Sep
 2020 08:42:48 +0000
Received: from VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:30:cafe::54) by MR2P264CA0138.outlook.office365.com
 (2603:10a6:500:30::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend
 Transport; Wed, 2 Sep 2020 08:42:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT059.mail.protection.outlook.com (10.152.19.60) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Wed, 2 Sep 2020 08:42:48 +0000
Received: ("Tessian outbound 7161e0c2a082:v64");
 Wed, 02 Sep 2020 08:42:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 711d606d0448c5c4
X-CR-MTA-TID: 64aa7808
Received: from 34d55fe72c0d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 04917D0A-A478-4FB4-8517-97EB0C67D416.1; 
 Wed, 02 Sep 2020 08:42:10 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 34d55fe72c0d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 02 Sep 2020 08:42:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K7kPwLQSwQopWd7O2DFFT4VS3TUwrNA3lxs0aEqdPdH1mKTlxSan7tVxXs5z+IRK+7TT+oojrfn+6na80Q0V/K0jooiraEfOMUkGzxPiGp79M1W8cTn5tLuAvHnR6sXWt8SfjHt68s0tPOwayIkyB2hIt/U2JWLHRw0j4UuFGN9PPoz/LKPX3Qam3aIVvfXv8EBpR4BmurWoyAoGcluMKQtUnvyBOkuSO/z7snYO8WoQnXvTELqhUWiA4KtTK1xB7Xxes4m/Y8DdZqR7KiupjAoRqIsVw0NqeUKhsnI95d8cNCyxRVu/1ElpT/+D5WCuAfIgfBJ1IzoUCyfXwVhLQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sO5ELdwWrmyCHNqIyiBvZIbpt5IabNQyN7wzP46F2Y4=;
 b=oerE+LsGs4BV5zoy72bhNkwluG8XgsiHYgI1JxrX5eAoGYCAMFVoaM4Y6eox+CLiK9BljmNUupgfifFimGvK8YmcVec8kZJG05WS6+vvxixXNVxnvI+Sym3hme0slS2HJVRfOu0iO53d4LvFlYNX8ZUefpuSHGPoYpiQbfU7pK84ht2XZxXOfGO/TnNl2m35V2Fi5e+nnj2gZ3nOqz0YTqLOQWJ0tqX91RJ0JurQyHbUe+HpSf4FtJaOfrQwVI+2PI69p2zvgnO5CvYXn3Zb3IEarGxn3EUgPUNpb9WdVTUxhlv9Ks3mirkzcoLU4Hrbre2cS1/ey2/Gxniv9KXMgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sO5ELdwWrmyCHNqIyiBvZIbpt5IabNQyN7wzP46F2Y4=;
 b=a+a1iNGdnqT9jGmaU5zNCSMV2GUr98yXO7Vo9r81lJZf3TgKPZJvgJW4j4My0b9/OWO49r0Zp7nbLoUJ8MhjvyioZu4VWYByhvSwMXY6mD1tZib9NwDYTc5b/Ul81iTsqsmwwHPWUrw0D3IRA2QGWU0BDtM14QeDp1ApLfqMo7A=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3257.eurprd08.prod.outlook.com (2603:10a6:5:19::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.25; Wed, 2 Sep
 2020 08:42:06 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3348.015; Wed, 2 Sep 2020
 08:42:06 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Diego Sueiro <Diego.Sueiro@arm.com>, Jan Beulich <jbeulich@suse.com>, Paul
 Durrant <paul@xen.org>, Wei Liu <wl@xen.org>, Ian Jackson
 <ian.jackson@eu.citrix.com>
Subject: Re: [PATCH 0/3] tools/hotplug: Fixes to vif-nat
Thread-Topic: [PATCH 0/3] tools/hotplug: Fixes to vif-nat
Thread-Index: AQHWdt+SjnSsnHDcDkyVepvgy+LYC6lVHB+A
Date: Wed, 2 Sep 2020 08:42:06 +0000
Message-ID: <AE6C8555-5C1A-4042-B7A7-7B962B22D9AA@arm.com>
References: <cover.1597920095.git.diego.sueiro@arm.com>
In-Reply-To: <cover.1597920095.git.diego.sueiro@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.xenproject.org; dkim=none (message not
 signed) header.d=none; lists.xenproject.org;
 dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3d747342-72b7-4c01-0d05-08d84f1c2bb7
x-ms-traffictypediagnostic: DB7PR08MB3257:|PR3PR08MB5643:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <PR3PR08MB564351F9A03CB6AA3DCDED849D2F0@PR3PR08MB5643.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 5+iI3m0CR0EtSrFqdW1mbiDXj1wk+shRE33cTtCWwPllvcilCkVF4SdCohaDtoH9lP40BAJipqRBOOarLoFUGnbh1BV3M9hq8GUHyqzYnycFV1dydJj35X24ej4glss3W8xccun1yq959C6SGMhTR9ATL9fT8OEBceljGDr/OTOcTp8QoPwth32zPf6Gp9Z3EsQzGFjDy7SnGptBTZ064wDGnpMBO8QuyvIly1ziIaeug8EPt1kt2iuAq95MVm2SxV2vTTaCZVhYIs4cK6G61VmL2+Grlablsu+e+/sr1O7Lho3XSlSCXm3oBq930UAiNJWuhirfWjb96o9dQ15MKA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(346002)(136003)(366004)(66446008)(83380400001)(8676002)(6506007)(4744005)(66946007)(5660300002)(316002)(71200400001)(6916009)(6512007)(8936002)(186003)(54906003)(36756003)(4326008)(26005)(6486002)(2616005)(91956017)(86362001)(76116006)(478600001)(64756008)(2906002)(33656002)(66476007)(66556008)(53546011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: SedvDdor3NtwOlTGXc00MFQvxwKgOiInThh/Vo2FpQMEWOd4hvF5N/BJpqZjH72D2+WG/pXpgiFcoh4SgjPMKBn/TbyNo2QfUa+xQkRppQ4zyfG4N+vGbhgjzM3qYFzrb+Exq1PQ9lCupxTs5qYGhGXcpDvy8grE9xUidKMGMIS20QGijeb8Sx5NYaBRlA9or0zDP2rIawdk4Nn4LC1L5G/NKZ2ZvAgm0AK6Y3z1oJP3mBWiA272tjkZy80SXRVEnclekHI6SN/N68m3YMk4220A7Qs/LAleUs/La2fdDjEbCmX878XcnWFvQLB2rmUCFCK54gRistmm+SIwePNezLeuaQKsARax54Bgq6ARg204yY8ZXA3295ndnQsrHhK47pymO61F6MEYNcLx1EXia9C2XhVvzFZMe58A3WAPKHRQeU4HjoIyZ7uNF/txwQftfTrTf47NKHf9h92bl+Dk+2koBhr/C3clvNLuY4lJfX2Xiem+XWtDSZoNS2/+o27VNTTw1ul+EVGwWlSILwnQ2u4j0PWhUTFAbRM/B2zCk8jPkAG9joFw9mo1j8oc6tUFIA74vuehnO5OiIaK7/wv3TvelkDL/Gnp+thlAvJLUP9fY3j4OUzBFcCaa9VXcvHFI9L++KDhSUuUAizaOoTerQ==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B18399D3EEE7334582BE8DCA44BE4FF7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3257
Original-Authentication-Results: lists.xenproject.org;
 dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: e348b9c2-e9d7-4e2c-2e8a-08d84f1c12bf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RBVxDIoKY8FksShC8PwXXfQcZ/FX6s9Wya0jcuBltu7Mit8L8XcqjsrQhuLETZyjaBvN6fgGZEkrgAONOWC6zwlO6xl1BtZzMUqvk6owowi4b+C19oeqtK6D994PnyNqdOuMpxhkuJ4lckLmzjZ2HW4I84hwzE1CvwDPvI98yacI6AxIU1AkN3ihjMDsbsuGP/GjyNy07ZvNIOmZXCnFlCoBMRLL1Of5tqxo34DRDjgji77qIl0LNzYZ/x28s6F2pf10yuznQTzvBUbNJUnZ8pY80lXml4suGhjwWbdVbm1XVa7xrtWfMjqlIfQPar5gjbLakHMc5xg7536CEYCHbd/d87H60r93musciLIDLYk81ACn+wL6+/oyaVwcnYjT6IEaeSevH8qrPz6U4boQcA==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(46966005)(478600001)(6916009)(8936002)(33656002)(186003)(70206006)(86362001)(82740400003)(2906002)(47076004)(70586007)(4326008)(107886003)(26005)(2616005)(8676002)(6512007)(36756003)(336012)(5660300002)(81166007)(316002)(6506007)(53546011)(82310400003)(83380400001)(54906003)(36906005)(4744005)(6486002)(356005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 08:42:48.2887 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d747342-72b7-4c01-0d05-08d84f1c2bb7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5643
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

A gentle ping to have a review/ack on this serie :-)

(Adding some people in CC)

Bertrand

> On 20 Aug 2020, at 11:46, Diego Sueiro <Diego.Sueiro@arm.com> wrote:
>=20
> This patch series fixes issues around the vif-nat script when
> setting up the vif interface and dhcp server in dom0.
>=20
> It has been validated and used in Yocto and meta-arm-autonomy
>=20
> Diego Sueiro (3):
>  tools/hotplug: Fix hostname setting in vif-nat
>  tools/hotplug: Fix dhcpd symlink removal in vif-nat
>  tools/hotplug: Extend dhcpd conf, init and arg files search
>=20
> tools/hotplug/Linux/vif-nat               | 14 ++++++++------
> tools/hotplug/Linux/xen-network-common.sh |  6 +++---
> 2 files changed, 11 insertions(+), 9 deletions(-)
>=20
> --=20
> 2.7.4
>=20
>=20


