Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E050C254692
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 16:14:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBIfZ-0003Bf-Vo; Thu, 27 Aug 2020 14:14:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fcIR=CF=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kBIfY-0003B1-Q3
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 14:14:24 +0000
X-Inumbo-ID: 8dc835f5-f127-43cf-85d8-a344e83b1224
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.78]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8dc835f5-f127-43cf-85d8-a344e83b1224;
 Thu, 27 Aug 2020 14:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/rKuChLtIkK7FwNL/12YP9ISlGT+cZVv3o1dbEmCa4c=;
 b=vJwHENoBCz1DWlM0IuJAbqiFKY+QN7T1RVeKU0jbb5ejoSpwuw0p/o85cGtKL1mIFfc1sR8z4rTGW3nfRE97P2OOjTFRGs1jDgxPnFQAIjIu3yWBwhIfJOI/cU0cwjmNCahX6fnNjmL0FD+GCQacFIO/CH/u67VZ7gOAF19SvHI=
Received: from AM7PR04CA0025.eurprd04.prod.outlook.com (2603:10a6:20b:110::35)
 by AM0PR08MB3060.eurprd08.prod.outlook.com (2603:10a6:208:5f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Thu, 27 Aug
 2020 14:14:17 +0000
Received: from AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::d4) by AM7PR04CA0025.outlook.office365.com
 (2603:10a6:20b:110::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend
 Transport; Thu, 27 Aug 2020 14:14:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT026.mail.protection.outlook.com (10.152.16.155) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Thu, 27 Aug 2020 14:14:15 +0000
Received: ("Tessian outbound 7a6fb63c1e64:v64");
 Thu, 27 Aug 2020 14:14:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b9186d04b0251a5b
X-CR-MTA-TID: 64aa7808
Received: from bcd314cf9520.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4718CA50-379D-4FAB-B2A8-1CA4C974113B.1; 
 Thu, 27 Aug 2020 14:14:05 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bcd314cf9520.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 27 Aug 2020 14:14:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hcZ/zBjfnY1KxPcsARA4/PGsXlYSpEunz9XUs6WdCfWAAS7ctxkC6kvwx7N9/4tk+9LoNZcJnGv+1/AUViYdJmL+DDX6Z/WWybNn65/deIii+0MBqNbUMEaPkrPCoUlj0X9yS710H/B6svJVKyrCORxiEFm3iMEoz+Qah0th6BObB52C1nAKsMKb9X70WYynCUKvIK2bceUYJefVTRvWgWF8J4VIHbmQkALuUWk7ZjmESLsSTxmsSQnAwgV5EeFr8c90xKRcW4GCN1Jx8dk4l4hsjJw7b5XUcxvC06uXZa6pjOC72JdFpw2dfVzMxKhfCYRSCFesaLYqNysBcJPDVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/rKuChLtIkK7FwNL/12YP9ISlGT+cZVv3o1dbEmCa4c=;
 b=DAwZ8hWP+SmanA0nqMCUQAW8GyTD90UXLuT46G5QXgGGc6J9kqBtsBuSD+XIYvmrisiKq748avKOr3Ib5Uq35i0OLCBDgNT7RD2N1Hekve6KsDyq1WGn431t28vZEwu13m5wD4GhXRytd4d6ld2KoN3REYai6+nV/dghp5MUI4hM/oyHroWv7g8ab6LunnoIE/wY3t+qHu0OHrm5sYPATq7hQdV5y8x8SNmFRzOXJoVL77OnKRY9PzsriPWHsfK0GD6A8o0fM1S2zFOVUAOv7xZYe3A5I+EUss8/3UZSb3ghVXWzuPLGdgImtBFkqP27I/uYxjzvQmHkoWJsib1b+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/rKuChLtIkK7FwNL/12YP9ISlGT+cZVv3o1dbEmCa4c=;
 b=vJwHENoBCz1DWlM0IuJAbqiFKY+QN7T1RVeKU0jbb5ejoSpwuw0p/o85cGtKL1mIFfc1sR8z4rTGW3nfRE97P2OOjTFRGs1jDgxPnFQAIjIu3yWBwhIfJOI/cU0cwjmNCahX6fnNjmL0FD+GCQacFIO/CH/u67VZ7gOAF19SvHI=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3164.eurprd08.prod.outlook.com (2603:10a6:5:24::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Thu, 27 Aug
 2020 14:14:04 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3305.031; Thu, 27 Aug 2020
 14:14:04 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Diego Sueiro <Diego.Sueiro@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>, Ian Jackson
 <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/3] tools/hotplug: Fix hostname setting in vif-nat
Thread-Topic: [PATCH 1/3] tools/hotplug: Fix hostname setting in vif-nat
Thread-Index: AQHWduEpaa1KU+77L0a6GO/oAi93H6lMCt+A
Date: Thu, 27 Aug 2020 14:14:03 +0000
Message-ID: <8C6DB9DF-3DDA-45B7-A137-701E26C718E1@arm.com>
References: <cover.1597920095.git.diego.sueiro@arm.com>
 <689b543715a858ad0fb0c1d849dd8ec70b3d20be.1597920095.git.diego.sueiro@arm.com>
In-Reply-To: <689b543715a858ad0fb0c1d849dd8ec70b3d20be.1597920095.git.diego.sueiro@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c78f3124-1968-4cd9-2b0f-08d84a937b2b
x-ms-traffictypediagnostic: DB7PR08MB3164:|AM0PR08MB3060:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB306044C29577433FB88874CE9D550@AM0PR08MB3060.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3513;OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: slHhPQXhNISO90Z358pBncedkdZ7MqPB745e/302StHon7GlQeP6QY2AufQSYw57zqxLR72yipHijjtTRopu15rCT7o1OolNyi2/BSUGRVPK1bHdfm+SoxwN1f+k4BS/v2HuJ2ASeFcPnZit9bMJas8mWmicB1cvvlQJ71k5UQnxJtJZObeFkXvHY/7p+DtFT9KfqijbzeTyatuUJCsHIhNPxlp1MUkQlayuEfIfJY/Z3v+k8sH/5FOQn2mRnqxeisZndGVHLQzMcja2Ua9tlMAlzCRV0w3J1jib9RvamYqg9RBgTDU17/IlWQCKhGR7A5OKQ4WrWjTEkmcgpSbezw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(136003)(366004)(396003)(6486002)(6506007)(316002)(54906003)(186003)(37006003)(53546011)(36756003)(83380400001)(71200400001)(2616005)(66574015)(26005)(86362001)(66446008)(66556008)(76116006)(64756008)(4744005)(33656002)(66946007)(66476007)(6512007)(91956017)(2906002)(6636002)(8936002)(8676002)(5660300002)(478600001)(4326008)(6862004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: sIpbEv4TZQNbA6H3qbRxToVcLGeFi9DnhzZdeHOb5GPWzF1Aj2XKoOEXzPyH/gqFYhIuSs/uNXsVFSR5q36T002qRdgc9VDGMuGwLqDdIZMAZSoginWjlf5LNxHjj0+/SDcxczxd0elMvwUm2kryK/LrnA+BLC6I98JXoQ0+EMKnIrusSA0Qlk9RJzY7pf89K74FpTFTEJDYSQK9yfaKDY3gfWlTKUzjDNubv4LluYcVC9XjWkkg0v3pP7G+8244hqWRsQOCK6AfER8+yoDf6MtMdsA4GHWLftF40nRZ9YPJPHhyuHWe2es6Y2sfsTYjhH9ldUfv4P8MfWwSO7DzWN9TCLTbv8EmM+O7Fsy1gD/kxgLUtC+2FzGfegRcAIcY9PjoGSEPiP2etX+qYIwlCO9CnIcIu8j2cRHxA8ilZ9jqKu3PkoZRnfdui9vOq2v9CHyvR1Oqiy0oJo46RzEBu/xjY6ML5avIXN32eYwEaEdoXKTF2OXl9Whj/hDGTDxpq+gzrF5LaQWq+T27+MRVbMkKCI9wQ+Zb0qY3o/b4bBbytV5aR+mKC/lMn1gX9q8EzuVLgK8BENMoMA+3DnCOYOIY69k3Q/s6ojHlb3uWEAh9TOa78f2W6Ttq7GqDzQLQakuoQ3aHfPWQtjyxuII5HA==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <39F210A7E7ADA94795E1FA398A4E9838@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3164
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 256dedd2-7840-4860-a7d5-08d84a93740a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6tqXvDozQmiAQ4Z/YMRVfmR4imR/ahQYburdFtCcsjMjghA0hzRIfcBBwtdsXr1DT4jtp8yUquVfHBYIEwOUWP+45VjBEzqxcJLEBxg7BmXxFjuX0d7pN+wlXtdL3uNT8AqaOBI6cO/WPFIx5rcrjr5GALqw/Y9kyJfeuiuqWuBZ68NqINV3EfSafgkOvSbGgqv/qVq2N1DBLD85UesB2IRmgRxZWTf24PT7fs0pyANu0KOxRnDxqpOdYcruPHyshoLzOOhidtjFUOt88+MWZ4nh8zY2y8luFjgHuppAJkXaGCo4F2RPI9TNZVWIBtAnaJdO93jCBctYEKHtu2eDry3gBh4nMkHVo+AeOfB3NMoaDYSmucGakvnhvhVZ8zlhEKepWvlIUHKuAPTF8UShWw==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ErrorRetry; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(46966005)(186003)(36756003)(86362001)(47076004)(66574015)(70206006)(33656002)(4744005)(70586007)(26005)(8936002)(36906005)(336012)(6486002)(5660300002)(6506007)(53546011)(478600001)(6862004)(356005)(2616005)(2906002)(6636002)(82740400003)(83380400001)(4326008)(37006003)(54906003)(8676002)(81166007)(82310400002)(6512007)(316002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2020 14:14:15.9395 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c78f3124-1968-4cd9-2b0f-08d84a937b2b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3060
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



> On 20 Aug 2020, at 11:58, Diego Sueiro <Diego.Sueiro@arm.com> wrote:
>=20
> Setting the hostname is failing because the "$XENBUS_PATH/domain"
> doesn't exist anymore. To fix this we set it to dom$domid
>=20
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> tools/hotplug/Linux/vif-nat | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tools/hotplug/Linux/vif-nat b/tools/hotplug/Linux/vif-nat
> index a76d9c7..2614435 100644
> --- a/tools/hotplug/Linux/vif-nat
> +++ b/tools/hotplug/Linux/vif-nat
> @@ -85,7 +85,7 @@ router_ip=3D$(routing_ip "$ip")
> # Split the given IP/bits pair.
> vif_ip=3D`echo ${ip} | awk -F/ '{print $1}'`
>=20
> -hostname=3D$(xenstore_read "$XENBUS_PATH/domain" | tr -- '_.:/+' '-----'=
)
> +hostname=3Ddom$domid
> if [ "$vifid" !=3D "1" ]
> then
>   hostname=3D"$hostname-$vifid"
> --=20
> 2.7.4
>=20
>=20


