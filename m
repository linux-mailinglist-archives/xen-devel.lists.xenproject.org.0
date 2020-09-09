Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA36E262F33
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 15:32:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kG0Ca-0006TO-Bk; Wed, 09 Sep 2020 13:31:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TE5G=CS=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kG0CY-0006TH-6F
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 13:31:54 +0000
X-Inumbo-ID: 8fbf51d4-bf84-46f3-abc9-9e34f3c1f4cb
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0e::60b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8fbf51d4-bf84-46f3-abc9-9e34f3c1f4cb;
 Wed, 09 Sep 2020 13:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkpJUbze06xi+6+RKGfWhJNn196+Ov88gxyXTtn9pKQ=;
 b=bx+me3fI8swQovzXJyhPMKkzNuiXfM0hOttZLLetguD9ZlHExCPPAxCEVN3+qNCD31VA8qe1KEIZ0oc5hIFAHYD7isYrIoEKYGruRZEf9QkjSkdG8uguD3z9ObfgihUyVrOMTw2CsEgbghBuWup6b6WkQUVhA50PNLC+xV34NUQ=
Received: from AM5PR0202CA0024.eurprd02.prod.outlook.com
 (2603:10a6:203:69::34) by VI1PR0802MB2607.eurprd08.prod.outlook.com
 (2603:10a6:800:b9::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Wed, 9 Sep
 2020 13:31:50 +0000
Received: from VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:69:cafe::aa) by AM5PR0202CA0024.outlook.office365.com
 (2603:10a6:203:69::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Wed, 9 Sep 2020 13:31:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT007.mail.protection.outlook.com (10.152.18.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16 via Frontend Transport; Wed, 9 Sep 2020 13:31:49 +0000
Received: ("Tessian outbound 7161e0c2a082:v64");
 Wed, 09 Sep 2020 13:31:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 496068048ef77d2a
X-CR-MTA-TID: 64aa7808
Received: from 0c202438d19b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B7D6F903-08BA-4239-A171-D4E0FA092D6B.1; 
 Wed, 09 Sep 2020 13:31:44 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0c202438d19b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Sep 2020 13:31:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iBt1EVruHaXkGjreLhryIoMJ2B7tWBO2TWjRcMUgiLzvtpayg8B4c6lr2Dc+ItrY2LopB58Kelt/2f6rgo1s1WwwKb0Q1uwDg2P9DyL6aD0vfzpYk16CPhJOWkWc1was3WeowZgmdYQ6ljdWCcoG1F4/y/3MvhNy4/Iu7gGSeJ95XMQG8vNac04Uc72upELhRGZoeOmi+IPPGAFD8a/5IZ+q9YfDFRiDm3MePbI7UUEoFBxwkxQ/TT5D2vzLM7CpUURhHCow/Q3Hb00dQAVzwZdIJCpVsCmHjZ8UH0LxLaGnSGLQ0bSy+SFdekyTxzHhZ6g+ktb+EgdMr4G+Y8vIpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkpJUbze06xi+6+RKGfWhJNn196+Ov88gxyXTtn9pKQ=;
 b=Quq2Om+S8SeCA44qr5LpyYjpOp30O3fWdU5n7qz1QVBNGUY8Oz+sOZI3aZgh3KGsFaP/vJY1FIjrj52vMvNGZzv1pnH1orKnMXHYp7iuCPgHyyJkE5eOF39vJ0d8/10EZtYOB7aqRi72N3bDvVft3j/f7DBT/akcOrvYB/uhNnCrww21oL5GlTHZQ9tlgCuKqtFOvdiMUVJ01oE09LjW4cFpxfpj9gOM5kRI+QjmO6KrFnxjSWViDdJQ94LJ6c0q43U13wntM5hgSJ7MB9Bb2o0Flv8zd3xaAS4W4I3EwJiYswL1dlrzMs3oqy3+jChMh2Z0qaHI3t1z22Xj7f79ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkpJUbze06xi+6+RKGfWhJNn196+Ov88gxyXTtn9pKQ=;
 b=bx+me3fI8swQovzXJyhPMKkzNuiXfM0hOttZLLetguD9ZlHExCPPAxCEVN3+qNCD31VA8qe1KEIZ0oc5hIFAHYD7isYrIoEKYGruRZEf9QkjSkdG8uguD3z9ObfgihUyVrOMTw2CsEgbghBuWup6b6WkQUVhA50PNLC+xV34NUQ=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0801MB1654.eurprd08.prod.outlook.com (2603:10a6:4:3a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.17; Wed, 9 Sep
 2020 13:31:42 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3348.019; Wed, 9 Sep 2020
 13:31:42 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Diego Sueiro <Diego.Sueiro@arm.com>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, nd <nd@arm.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] tools/hotplug: Fix dhcpd symlink removal in vif-nat
Thread-Topic: [PATCH v2] tools/hotplug: Fix dhcpd symlink removal in vif-nat
Thread-Index: AQHWhqYja4pY5XRPLkWmrPgjNz9n1algTc6A
Date: Wed, 9 Sep 2020 13:31:41 +0000
Message-ID: <9739DD18-150F-413B-A657-D5B60C0D9AC3@arm.com>
References: <401e31a2c521a34502461336b4e65468e7394e01.1599654067.git.diego.sueiro@arm.com>
In-Reply-To: <401e31a2c521a34502461336b4e65468e7394e01.1599654067.git.diego.sueiro@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9041cb7c-9484-4008-0ddb-08d854c4b4b8
x-ms-traffictypediagnostic: DB6PR0801MB1654:|VI1PR0802MB2607:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0802MB26074838FE441A31B6EC86429D260@VI1PR0802MB2607.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: QW6XmskwxAKf9Cu4TMZH2xJpwFsDqF3YBmzLyLiiS8I5OE7FITg5EZT9qz5gjY4MQWHZ3AVJ8Awgy0i6C8idGtC0jNm0wEvy2rCjxgZ4c865pn3wVV4Ucn6exK7dC+piukp07qDm+W7PHZHz8gAAZeqSUjfZa9+RaIF0vNL7+gnVrel1YXMoJGfvgBU5560XhIbe5mhVrCVn4L6owsIKeQcL15W/ncTBwo5U78l7sYaU2xEdomVuge8Ic9bMNkRnnpEulG47CX5LcDwhYDcCXlA4JLqsVKveyCVGzQ8DYGzPBxmF66ZPW4p251+4w3AWeLN886KQbLP/EiK/U/Umog==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(8936002)(186003)(36756003)(37006003)(54906003)(478600001)(33656002)(5660300002)(86362001)(6506007)(26005)(2616005)(71200400001)(53546011)(316002)(6636002)(2906002)(6486002)(66476007)(8676002)(83380400001)(66946007)(6512007)(66446008)(66556008)(64756008)(76116006)(91956017)(6862004)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: XPGfsm1DB92/35Aw+lkt5FnSP2dyAxDuOnimvG/sEKjeB6dFyhWYJBKYlTa1vkjmOJ1BIB2E+buuWgmJlLBFep0iYly8LWxgGsX88oWHXY0AGiN2ZN3B5REgw+URqnGV9PkP28YNtF2aHnRCaYqjLYJhTF32s77Pjl82pdm/BwkOHEIKAPAXxK7Muoc/+KIZppdmgEEHbJj0jGZIA9jfujcgspQ0n5RmTWKpBcgXUkL4xjrLfu9xDnZKZ96KyxUGI3aMtvXtQTNYVcWWMdtKA7rua77811GaZDIhrhr1uRJWrL1S8XmuheYnlPn/64R4wG6S6zjFe+EYG8jl6x43KKy+/lcze1v1GyrG+DgIOUv9URENhYcfKZyLn8jqG9ZbsHk5ta9y2wyxRCn8tu+CJEt+S7kHdPZgHbggBTPUTKOP852Yb1ybI22KHaYamYDX/edLw+sd13yNd4JsE8Raszr/T4XuJtIxMmZzOGAA9Q96vObe0WqO9K/Xt9ymlPLfnQqwXTxm2qx1i3r77FJ3K4R+lotWStJiVF3KflNcawFkDd4bwbi5Gx0uAGQ5fJNAR1JFdp5/+9tRvT0rcqmcGt2v7R0oE0zJsBeV8H472XHzgOZr5wdKZNUfe1xiaNDeIolmv9jLMvM6f798K8nYLg==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6C4DC59553C45942BC0C08D5C3D36127@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1654
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: d3b192c2-3056-4f6a-7bde-08d854c4b03e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PwspJuVBADzwy9ELqSiTy9LRiE65k3xy8ck++8NW7NF9v9kaqcC9v5mj2CcQwf+JIi5cAg153v6rm1k/f1lWWSOdi5W2jAnPOc8jRV1Tf+KsgvtaldN9r4BTcgfqeRdoqXSYxQRnYzYJBz80lidUtoPrOqSs8+pnsUI0ZwQ5f4vsrSf5mVEDsSJ+7PebeTWZHMePwwqHly+5WwbpbMTdTb0w9seEDdqOMlAjwo7VgsVzveibv1Tf+Kxc3HhPVPDiAaHHb6nHDDZ976vWZclQF+cTRjNxGHiwOCq4pLfcV3Nr5WZs9NJyS9Ypoprc6/CXdtYYNRgQ4QdXlyohbRRijnojRKeM4IRduvJ5C/tuv9E9x2zvkEzlVx9XPCYF8wECWFO+dgQha4J3rCbHgbxbIw==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(396003)(39860400002)(46966005)(6506007)(36756003)(54906003)(53546011)(82310400003)(33656002)(47076004)(356005)(6486002)(81166007)(26005)(37006003)(478600001)(6636002)(86362001)(36906005)(83380400001)(70206006)(316002)(8936002)(4326008)(82740400003)(8676002)(6862004)(186003)(6512007)(2906002)(70586007)(336012)(2616005)(5660300002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2020 13:31:49.4089 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9041cb7c-9484-4008-0ddb-08d854c4b4b8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2607
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



> On 9 Sep 2020, at 13:35, Diego Sueiro <Diego.Sueiro@arm.com> wrote:
>=20
> Copy temp files used to add/remove dhcpd configurations to avoid
> replacing potential symlinks.
>=20
> If dhcp.conf is a symlink pointing to dhcp.conf.real, using 'mv'
> creates a new file dhcp.conf where cp will actually modify
> dhcp.conf.real instead of replacing the symlink with a real
> file.
>=20
> Using 'cp' prevents some mistakes where the user will actually
> continue to modify dhcp.conf.real where it would not be the one
> used anymore.
>=20
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> Changes in v2:
>  - Update commit message
>  - Simplify the code when removing the temp file.
> ---
> tools/hotplug/Linux/vif-nat | 20 +++++++++-----------
> 1 file changed, 9 insertions(+), 11 deletions(-)
>=20
> diff --git a/tools/hotplug/Linux/vif-nat b/tools/hotplug/Linux/vif-nat
> index 2614435..fd34afb 100644
> --- a/tools/hotplug/Linux/vif-nat
> +++ b/tools/hotplug/Linux/vif-nat
> @@ -95,12 +95,11 @@ dhcparg_remove_entry()
> {
>   local tmpfile=3D$(mktemp)
>   sed -e "s/${dev} //" "$dhcpd_arg_file" >"$tmpfile"
> -  if diff "$tmpfile" "$dhcpd_arg_file" >/dev/null
> +  if ! diff "$tmpfile" "$dhcpd_arg_file" >/dev/null
>   then
> -    rm "$tmpfile"
> -  else
> -    mv "$tmpfile" "$dhcpd_arg_file"
> +    cp "$tmpfile" "$dhcpd_arg_file"
>   fi
> +  rm "$tmpfile"
> }
>=20
> dhcparg_add_entry()
> @@ -109,11 +108,11 @@ dhcparg_add_entry()
>   local tmpfile=3D$(mktemp)
>   # handle Red Hat, SUSE, and Debian styles, with or without quotes
>   sed -e 's/^DHCPDARGS=3D"*\([^"]*\)"*/DHCPDARGS=3D"\1'"${dev} "'"/' \
> -     "$dhcpd_arg_file" >"$tmpfile" && mv "$tmpfile" "$dhcpd_arg_file"
> +     "$dhcpd_arg_file" >"$tmpfile" && cp "$tmpfile" "$dhcpd_arg_file"
>   sed -e 's/^DHCPD_INTERFACE=3D"*\([^"]*\)"*/DHCPD_INTERFACE=3D"\1'"${dev=
} "'"/' \
> -     "$dhcpd_arg_file" >"$tmpfile" && mv "$tmpfile" "$dhcpd_arg_file"
> +     "$dhcpd_arg_file" >"$tmpfile" && cp "$tmpfile" "$dhcpd_arg_file"
>   sed -e 's/^INTERFACES=3D"*\([^"]*\)"*/INTERFACES=3D"\1'"${dev} "'"/' \
> -     "$dhcpd_arg_file" >"$tmpfile" && mv "$tmpfile" "$dhcpd_arg_file"
> +     "$dhcpd_arg_file" >"$tmpfile" && cp "$tmpfile" "$dhcpd_arg_file"
>   rm -f "$tmpfile"
> }
>=20
> @@ -121,12 +120,11 @@ dhcp_remove_entry()
> {
>   local tmpfile=3D$(mktemp)
>   grep -v "host $hostname" "$dhcpd_conf_file" >"$tmpfile"
> -  if diff "$tmpfile" "$dhcpd_conf_file" >/dev/null
> +  if ! diff "$tmpfile" "$dhcpd_conf_file" >/dev/null
>   then
> -    rm "$tmpfile"
> -  else
> -    mv "$tmpfile" "$dhcpd_conf_file"
> +    cp "$tmpfile" "$dhcpd_conf_file"
>   fi
> +  rm "$tmpfile"
>   dhcparg_remove_entry
> }
>=20
> --=20
> 2.7.4
>=20
>=20


