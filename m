Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70800254695
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 16:15:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBIgD-0003I3-LE; Thu, 27 Aug 2020 14:15:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fcIR=CF=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kBIgC-0003Hq-7o
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 14:15:04 +0000
X-Inumbo-ID: 043fd00a-44cb-47d5-a3a0-55563a707491
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe07::624])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 043fd00a-44cb-47d5-a3a0-55563a707491;
 Thu, 27 Aug 2020 14:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jp2GJ9xZQfOf9QC/QIB01tTS5MnjO3CMPjF5y1G3yc=;
 b=cnVgkUElooCDXx4Tkk+UfIXkUnSWM7NulqEFbCdNIt/5RUuhCr7vZ8IY8WmI+SLoRT077y2yvz6vVQE23+BcvmtAuB7vGn6ZIzmCXV1VBJ6f1lS5xj/ed9TkFJCvNkZfCGvleD4oW3VGxLsJCV27fUypp/KA+xOqMPHU7IHsr0o=
Received: from AM6P191CA0022.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::35)
 by VI1PR08MB3999.eurprd08.prod.outlook.com (2603:10a6:803:ea::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Thu, 27 Aug
 2020 14:15:01 +0000
Received: from VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8b:cafe::7c) by AM6P191CA0022.outlook.office365.com
 (2603:10a6:209:8b::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend
 Transport; Thu, 27 Aug 2020 14:15:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT012.mail.protection.outlook.com (10.152.18.211) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Thu, 27 Aug 2020 14:15:00 +0000
Received: ("Tessian outbound a0bffebca527:v64");
 Thu, 27 Aug 2020 14:15:00 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cd71cfe6b8c6e7f4
X-CR-MTA-TID: 64aa7808
Received: from a560f5ee81ee.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2C7C4659-E804-4F77-A158-65B381063459.1; 
 Thu, 27 Aug 2020 14:14:35 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a560f5ee81ee.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 27 Aug 2020 14:14:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=edSNPNayjDBE3AV8XQt0WSG7fgK/Pa40/tEGrZygi9epktm4xppGN/pRNcCTeCgXJvV/+5lrJxrktNEn/yQ9M/xFyIbt6EFKfAFxl8EEHT17/OBkmtjyg7VgILLTHUEluamezzUnlVXEPCf7rZ+qLFjmj8FowG85Obr6Zv2+JbqnehJM5UoMULABwwh0gZ7654O0HCJrCyTHboGBLdEZ606O8J42LHtFM6Apqn1myNtDIJQLhTor4PQr6gV0TtWJWfcoKK++YVJulqxmixpiPeWH+6PIAOb2RL3npCjdpV5oGeMC8L08TrfEtVq5xztZ65RMVd4gmyhM+TsEuVb6jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jp2GJ9xZQfOf9QC/QIB01tTS5MnjO3CMPjF5y1G3yc=;
 b=d9MqfwCTwNu/o4trDmhtAdXugm6FOG/f6e+ivGaOuJ3DDqavz+u6lmm9cLV0UCsoplQS/SdHN+p8PVvMWZiVqbxFpOha3Coyo5t7eJCFa8jdt+0cz4ES5EZZ758IOi3B0rMAPouBY2zFRKXiVPomKWMnThT/TId88fRwRP+zrLvkURLmeKK5BCsp4UZs7AwhVncdY9OD0OKf80azUbh8hlJWYo8BdFgLa2BbIKG6VghWMmxtLBMfwhRDIW7XkMoEgwoFEUB9fTrOVkHIstuWXUrpqgYvincbe2eDxA2MFGJRtw8yHBxVMrJMkbgflTu8kIAvVqULYEP4A/zgluaG3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jp2GJ9xZQfOf9QC/QIB01tTS5MnjO3CMPjF5y1G3yc=;
 b=cnVgkUElooCDXx4Tkk+UfIXkUnSWM7NulqEFbCdNIt/5RUuhCr7vZ8IY8WmI+SLoRT077y2yvz6vVQE23+BcvmtAuB7vGn6ZIzmCXV1VBJ6f1lS5xj/ed9TkFJCvNkZfCGvleD4oW3VGxLsJCV27fUypp/KA+xOqMPHU7IHsr0o=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4364.eurprd08.prod.outlook.com (2603:10a6:10:c9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Thu, 27 Aug
 2020 14:14:34 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3305.031; Thu, 27 Aug 2020
 14:14:34 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Diego Sueiro <Diego.Sueiro@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, nd
 <nd@arm.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/3] tools/hotplug: Extend dhcpd conf, init and arg files
 search
Thread-Topic: [PATCH 3/3] tools/hotplug: Extend dhcpd conf, init and arg files
 search
Thread-Index: AQHWduGMroN03EFTHUKgnG7TjUTaS6lMCwMA
Date: Thu, 27 Aug 2020 14:14:34 +0000
Message-ID: <E4FE2D2B-07E4-4293-890A-AD680B2C61DE@arm.com>
References: <cover.1597920095.git.diego.sueiro@arm.com>
 <c4fc61f8e5549565a853c5cd2371e68a9f48a258.1597920095.git.diego.sueiro@arm.com>
In-Reply-To: <c4fc61f8e5549565a853c5cd2371e68a9f48a258.1597920095.git.diego.sueiro@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 18536ddb-3653-41f6-104d-08d84a939608
x-ms-traffictypediagnostic: DBBPR08MB4364:|VI1PR08MB3999:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB39992299CB1A05B73F0FB01F9D550@VI1PR08MB3999.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3276;OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: n9r9X6NTGD6RJlTxWMD6RT0WjfjiCrLxj2D84M5ox1IhkQtq7IJaXoqrzJ14P4gWquabXT8BG365nxlN5TcVYuLlWt0XP2y9CsUajiO5Cu/BEEIBvJviGqHLZbKCMAlONPGr5jcbrXPLHHFQgqJmheDEkeHlqZMbZ4QVTEVCcuOIJWv4RudA4fQCQI5oqvaW0ZisuORhLEvkDhZcmCAuk5qLKZS9RQOBeiyLRrcgAQIc/0XcqH7Eqv59EHMF4M5tnLjE5BPHqga9XkotyxM5Ds8kH3LWRhSdURkvdEUqb2BRAlwkBlFbb4KEDcEkcJcLy2qnqoEFg8I0SN9cmTIp+w==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(186003)(6506007)(83380400001)(6636002)(53546011)(54906003)(6486002)(4326008)(71200400001)(37006003)(86362001)(8936002)(2616005)(26005)(6512007)(66556008)(66476007)(66446008)(64756008)(316002)(36756003)(478600001)(91956017)(2906002)(33656002)(76116006)(8676002)(5660300002)(66946007)(6862004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Iw1mp98E/WzxEnkEk/je5/0zw52YjJ+iZ06hV2jwwhG0Gbv9pph5s47cn58D1p2Rw01APNxdu9Ot0GD4D0fhXOadp4M1zWr4lvFdQhUBIUcZ2oxW+djRe+4/JJEaF4wGtI3Q2IifqnpnwXRHcHsyV00u91E6Xh2cLd1bU6YUbn2sltgbUHVKiNbmwXAy8O4uiTYz3Djhzro5OMta7AHyeKrblhtcZBFU0+UN/UIlJzsFzsdhK9tA7V0rw0iut/2KspZHBV//5M8jyhJ3RZMCb/oPONz/aV1EPfYL831IbNC2B/4oef7N9hHfQ2TJQXrGIxyLdoS8SBAlxWtp3rcQjKmNX4muLMnaSscBz9oLvPGO2ZR1CTjKuHG7Kchp79UxN5KkRnBb61ynm1ut3Omc4yL3kicbxU5IVpcfv4FO8L4M1fmznp5TZyYOYsBA9mDf+IL+rVoL/P4SfQl00n9nsSAWVNE5Lf2T67gYIiDA31x9Oj+uiCHyhSAt7T2kzavYjVWp3XvhglhjArpCWe5iURHUhKGsuBDnjLLfnvBKbTbN69Q3dWPxW3kO2o5YVZGv5CiC8yyhS4lWTxQUSGeGaLwOXW3avqN+BkjPKZVsvtG9orTTNe9VC69wQh5vCRcv6uE7RM63zksZyGRr1v756A==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <24995A7C6586BA46B45985B843AA465F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4364
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 06de64e5-59e3-403f-1d7c-08d84a938637
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U0pnB7IaEKEmPyyi7jw0IGvgThZUvSiWk/kUYZ4ftydJilWsORf9X1kjQo8jYJfywMNcFr2MAqUXGiVmVEZfP0nNo2RnLyKedRCPHh+g0/C8gI4I45HPR92QyxPD6r2aB3Ir5BtbhvX9vySMDjoMDskr/rs4kOdG/t1KYpmSsnjN7MPa62bFrvzNokz9GXEoWoi1Pp0o6w+nDj1afd+jCFjuc0ENYuq7HjbEqsxXOaqSR9FzHv4yCiXHB7b86Kec8MceA4Q8JkYXrn40zvr8Go36PN96AC7aPMUTZBhMxBAoV7+46WI0Ox2nOLYK5mVa4JoUckhAJRGTW/4nuut5a8jP7VE0YBVDGw9q6y04w7IkfLR8HmqhILqkLfQIBeqeiksTbze9uxxQvXwQD4qT5A==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(346002)(39860400002)(46966005)(186003)(336012)(82740400003)(6512007)(81166007)(6486002)(70206006)(70586007)(6862004)(47076004)(26005)(6506007)(53546011)(478600001)(356005)(54906003)(36756003)(316002)(33656002)(8676002)(6636002)(2906002)(2616005)(37006003)(5660300002)(36906005)(83380400001)(82310400002)(8936002)(86362001)(4326008);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2020 14:15:00.9324 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18536ddb-3653-41f6-104d-08d84a939608
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3999
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



> On 20 Aug 2020, at 12:01, Diego Sueiro <Diego.Sueiro@arm.com> wrote:
>=20
> Newer versions of the ISC dhcp server expect the dhcpd.conf file
> to be located at /etc/dhcp directory.
>=20
> Also, some distributions and Yocto based ones have these installation
> paths by default: /etc/init.d/{isc-dhcp-server,dhcp-server} and
> /etc/default/dhcp-server.
>=20
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> tools/hotplug/Linux/xen-network-common.sh | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/tools/hotplug/Linux/xen-network-common.sh b/tools/hotplug/Li=
nux/xen-network-common.sh
> index 8dd3a62..be632ce 100644
> --- a/tools/hotplug/Linux/xen-network-common.sh
> +++ b/tools/hotplug/Linux/xen-network-common.sh
> @@ -64,18 +64,18 @@ first_file()
>=20
> find_dhcpd_conf_file()
> {
> -  first_file -f /etc/dhcp3/dhcpd.conf /etc/dhcpd.conf
> +  first_file -f /etc/dhcp/dhcpd.conf /etc/dhcp3/dhcpd.conf /etc/dhcpd.co=
nf
> }
>=20
>=20
> find_dhcpd_init_file()
> {
> -  first_file -x /etc/init.d/{dhcp3-server,dhcp,dhcpd}
> +  first_file -x /etc/init.d/{isc-dhcp-server,dhcp-server,dhcp3-server,dh=
cp,dhcpd}
> }
>=20
> find_dhcpd_arg_file()
> {
> -  first_file -f /etc/sysconfig/dhcpd /etc/defaults/dhcp /etc/default/dhc=
p3-server
> +  first_file -f /etc/sysconfig/dhcpd /etc/defaults/dhcp /etc/default/dhc=
p-server /etc/default/dhcp3-server
> }
>=20
> # configure interfaces which act as pure bridge ports:
> --=20
> 2.7.4
>=20
>=20


