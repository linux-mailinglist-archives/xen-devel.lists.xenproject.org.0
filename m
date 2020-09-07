Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F26825FC87
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 17:02:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFIeV-0004UU-MT; Mon, 07 Sep 2020 15:01:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t2wO=CQ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kFIeT-0004UO-Ta
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 15:01:50 +0000
X-Inumbo-ID: 9be6ead4-eb0a-4a78-8647-9618148abd81
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.83]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9be6ead4-eb0a-4a78-8647-9618148abd81;
 Mon, 07 Sep 2020 15:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+I8ZUlWj8j0v26G2bSUn3k7DND1aWfmkg22VreE/OU=;
 b=CD2+HBxJwUReEqM08g8PCipxius743xCTAM7acB1z5QZ3VjWr1+79Cs+g0FfSICuHwcl3H4uX/PlfENekRZket4UovlNaK6bXgKfQZKpavFNb0u2j7oXEmqJajpdCpBoWaLzg3obQfBPOrqhERcQ3E6PQPqFCYOvOzWYIZvBYqM=
Received: from DB6PR0301CA0092.eurprd03.prod.outlook.com (2603:10a6:6:30::39)
 by AM0PR08MB5537.eurprd08.prod.outlook.com (2603:10a6:208:148::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.17; Mon, 7 Sep
 2020 15:01:46 +0000
Received: from DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::5e) by DB6PR0301CA0092.outlook.office365.com
 (2603:10a6:6:30::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend
 Transport; Mon, 7 Sep 2020 15:01:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT036.mail.protection.outlook.com (10.152.20.185) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.16 via Frontend Transport; Mon, 7 Sep 2020 15:01:46 +0000
Received: ("Tessian outbound a0bffebca527:v64");
 Mon, 07 Sep 2020 15:01:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ba30bd2d0f5c29ac
X-CR-MTA-TID: 64aa7808
Received: from 0827ef4ac7e8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6FBF9D23-4DDF-4BAF-949E-0FFE023E6E8A.1; 
 Mon, 07 Sep 2020 15:01:40 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0827ef4ac7e8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 07 Sep 2020 15:01:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XslI2KRIoZZKlzXS/A81XqYyUgGPITpoo63o7CeKpXE95r+zfYfm23NXhNSeWJGA8OB9qF3S2iDbS6XXw3BN0ulOlDuaeNCB/QI+IKEF2t6FefolqG1ZXLhWjza8VOE9TKV6L7nEJTFNZuycviGaq8znAvaltVDpy+nT/5UMWcx2vEI3Qit71c1LLZ5LqUBeIKYzP/mJDKi4ZBYPWcCSocLcrPuh/UbhcKI8IWZZ3V3LwSyj/XWxidFgs55xONZ/PTKuE8MA9jqgwa5sdbzkNEgwi+DFMHxUznHUTyuBWdWtrjHfsqJLm6mPuOyYY7ZzjoS6bg7PCmM8tT5i3Gaf0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+I8ZUlWj8j0v26G2bSUn3k7DND1aWfmkg22VreE/OU=;
 b=ZAGg9uJgKKmSkL74wWV0f3ypc3GRLeBRiGaVEABENLzhDKblGOICXD9/OwK5cVKVSh25MIu6lpBel1cQafRIEg+3KnVKS8ktQlPQgBzqF4ktlwQKYzgqUhgN30EP0iDA6n4vB5/KZMVKVWwZ7Au5SVqCHTW5i/sM4VxZ5+GNmGOwICvuJDXU7XF662qmRYzofuhNyBLh5q7TPYZbOAodmdU2+BjHIaeRXFWglfdsDND0rFfhRO/ZicT/H2HdNbpf80EwfY0QMk6FHfyEyxXmTSIEmY2NGQ3f28SMsXb9PfvY37zb3o2XvmGOcLcIx3brI/bwjfIyhb9XgfcNIsfjMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+I8ZUlWj8j0v26G2bSUn3k7DND1aWfmkg22VreE/OU=;
 b=CD2+HBxJwUReEqM08g8PCipxius743xCTAM7acB1z5QZ3VjWr1+79Cs+g0FfSICuHwcl3H4uX/PlfENekRZket4UovlNaK6bXgKfQZKpavFNb0u2j7oXEmqJajpdCpBoWaLzg3obQfBPOrqhERcQ3E6PQPqFCYOvOzWYIZvBYqM=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3516.eurprd08.prod.outlook.com (2603:10a6:10:4f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Mon, 7 Sep
 2020 15:01:37 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3348.019; Mon, 7 Sep 2020
 15:01:37 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Wei Liu <wl@xen.org>
CC: Diego Sueiro <Diego.Sueiro@arm.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, nd <nd@arm.com>, Ian Jackson
 <ian.jackson@eu.citrix.com>
Subject: Re: [PATCH 2/3] tools/hotplug: Fix dhcpd symlink removal in vif-nat
Thread-Topic: [PATCH 2/3] tools/hotplug: Fix dhcpd symlink removal in vif-nat
Thread-Index: AQHWduFzi7tknqNOmkiLnZ0D+vERVqldWqeAgAAHJgA=
Date: Mon, 7 Sep 2020 15:01:37 +0000
Message-ID: <4FA762CA-FAF0-46AC-A634-9F6D93287668@arm.com>
References: <cover.1597920095.git.diego.sueiro@arm.com>
 <3b0efb9fb1ba94922c0ae156c0ab0be6a9f45f25.1597920095.git.diego.sueiro@arm.com>
 <20200907143601.iuuk5yrzgv2stpze@liuwe-devbox-debian-v2>
In-Reply-To: <20200907143601.iuuk5yrzgv2stpze@liuwe-devbox-debian-v2>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 14e9fad6-79df-412d-3e8e-08d8533ef0ac
x-ms-traffictypediagnostic: DB7PR08MB3516:|AM0PR08MB5537:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB5537C62B9854D9858F5B1E0F9D280@AM0PR08MB5537.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4125;OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: FdEsnmGkL3+PeAO1yK1MQp/YJAshhN9qD/HxF/BeYIIJwmu8tlgcp6kUdULyl9Ii6OewqcPEa4MYTX1XhU4IG1WDgeXtgrPEbrj6+itXhYNhG+QhDtQX4EnQqqX5MKJQ7lobLUPDQfLfUaRsgdf4/A+Cdk06iCufm4WvJSWtcUTv3LicQ3kci2pdgZP3fVkvHjQo+uFfIjuvMJRgaaBCcnMtEF/xbAnloT1vZxAYu5H3ek4dj9cE7zInQnP9OvAiYdtjVBIC/iBEflZCiBLiYxhpEU1H3Zl8H6fuueF4JY8jFMb7/daaJ3wjdiquankSUFqL2xuyJeOgS2gsEn4Teg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(396003)(366004)(39860400002)(54906003)(71200400001)(478600001)(186003)(5660300002)(66946007)(66446008)(64756008)(66556008)(66476007)(2616005)(83380400001)(33656002)(86362001)(8676002)(2906002)(76116006)(6486002)(4326008)(6916009)(8936002)(91956017)(316002)(6506007)(26005)(53546011)(36756003)(6512007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: b7DrUImsQ9B4SF2WMZmDLANd1u0TD/W7OJcN+b6ocJ5vP6w1dzi2+aWkKVrhGHOYbg9MN1no7Rmw+NVgepT/Wn96lyrgy9Z1NX5JxZqu56cmwrDzUwm9TG8lqg3Q6/pLoBxkGa2cKEP22ZegmHbmx3FNrdT9nREAoHoPr8b6z+nxLbVK2uxIqtKSkqMpWcZOwy+DuzOkvkfVZMS7Gz5zt6Ny1M2ndB++6HQKX911i3SqovLYnQwN1aEGOMF4N0oX4SoB5sx0Hn115HLCFuYRb6xRRpwxGkUcb9izSisosVW/MAR00Yqtqg9qJ8FISP04+oudoCb+Y59BlT904FdHdkTTYqjfyIJzXEcZMJGldy8JjJxkjCKtpc5SiV6I7jy8oTrIZKWg8HgSXembqqJzXbItFkUf4IwP9FMkELoQaN3KMk9DgXmJ5UUX3QWoUAcvmEMTFxvEKrUQxju/lI881B8pwxiDniCvCzg572dN4O28jq99i8a2goWs33ljn8/OmmKIVKJnakJNR4ugtgSjmOyq47t4VaHsdpVEcjgT5gRKFznF1UiIv7pgvCRzzCJ7kvVoU9WeBNBZ6ICATwe9AIDZ8rvY0pRNs+3R/omjgGYIfQpy0UciMBRoV2c9Sydt62ela+ehvmmZ1i6oqRf7+Q==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <404E19C6AB62F34FBED6326CEB1374CC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3516
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: dc4ab731-d699-4003-5c51-08d8533eeb28
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wdFsLzAxhn0a1WWvnFQDeCAKJanIccbB25YElpSM62Aj0D4jO6mwJht356nrqJ3owmxXxs3GPhhMfYSnkbF74gjwOzeOOO7DVWVzfI9S1hkIVkohfqyeRlDGREVNNfVfHdHzRwo4jfCygtY7zV/Cf6ZNL0dl618DXKeROMyr/O8MWfp1OFqV8ZzxsUW2idZzGAcUgo58ec6gnpX66IBWb8EOKcchOgnsgk0y0d8RH9w53Y/Vbo30n/BIEHO+iaHADA5kjHiiyO0bW6BKADjUryBCi1Y68RYVfFWHNEDmAeljEW9JmlASBEHtqmi5/rN9OhqYd1c62Nral/lZGGFtRyQni7AaeHia3SsCgfolN0lEPRnxSa6C/K0eofGOqECSV8IkCy/k9OkJ+qcsVmfADg==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(346002)(39860400002)(46966005)(6512007)(356005)(81166007)(82740400003)(33656002)(8936002)(86362001)(5660300002)(6486002)(54906003)(36756003)(47076004)(4326008)(6506007)(53546011)(2906002)(70586007)(316002)(6862004)(186003)(26005)(107886003)(478600001)(8676002)(82310400003)(336012)(70206006)(83380400001)(2616005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2020 15:01:46.3753 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14e9fad6-79df-412d-3e8e-08d8533ef0ac
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5537
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

Hi Wei,

> On 7 Sep 2020, at 15:36, Wei Liu <wl@xen.org> wrote:
>=20
> On Thu, Aug 20, 2020 at 12:00:23PM +0100, Diego Sueiro wrote:
>> Copy temp files used to add/remove dhcpd configurations to avoid
>> replacing potential symlinks.
>>=20
>=20
> Can you clarify the issue you saw a bit?
>=20
> Which one of the parameter is a symlink (I assume the latter) and what
> problem you see with replacing the symlinks?

Maybe i can explain here.

If you have this:
/etc/dhcp.conf -> dhcp.conf.real

mv will create a new file dhcp.conf where cp will actually modify
dhcp.conf.real instead of replacing the symlink with a real file.

This prevents some mistakes where the user will actually continue to
modify dhcp.conf.real where it would not be the one used anymore.

Bertrand

>=20
>> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
>> ---
>> tools/hotplug/Linux/vif-nat | 12 +++++++-----
>> 1 file changed, 7 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/tools/hotplug/Linux/vif-nat b/tools/hotplug/Linux/vif-nat
>> index 2614435..1ab80ed 100644
>> --- a/tools/hotplug/Linux/vif-nat
>> +++ b/tools/hotplug/Linux/vif-nat
>> @@ -99,7 +99,8 @@ dhcparg_remove_entry()
>>   then
>>     rm "$tmpfile"
>>   else
>> -    mv "$tmpfile" "$dhcpd_arg_file"
>> +    cp "$tmpfile" "$dhcpd_arg_file"
>> +    rm "$tmpfile"
>>   fi
>=20
> You could've simplified the code a bit here and below now that both
> branches issue the same rm command.
>=20
> But don't resend just yet. Please help me understand your issue first.
>=20
> Wei.
>=20
>> }
>>=20
>> @@ -109,11 +110,11 @@ dhcparg_add_entry()
>>   local tmpfile=3D$(mktemp)
>>   # handle Red Hat, SUSE, and Debian styles, with or without quotes
>>   sed -e 's/^DHCPDARGS=3D"*\([^"]*\)"*/DHCPDARGS=3D"\1'"${dev} "'"/' \
>> -     "$dhcpd_arg_file" >"$tmpfile" && mv "$tmpfile" "$dhcpd_arg_file"
>> +     "$dhcpd_arg_file" >"$tmpfile" && cp "$tmpfile" "$dhcpd_arg_file"
>>   sed -e 's/^DHCPD_INTERFACE=3D"*\([^"]*\)"*/DHCPD_INTERFACE=3D"\1'"${de=
v} "'"/' \
>> -     "$dhcpd_arg_file" >"$tmpfile" && mv "$tmpfile" "$dhcpd_arg_file"
>> +     "$dhcpd_arg_file" >"$tmpfile" && cp "$tmpfile" "$dhcpd_arg_file"
>>   sed -e 's/^INTERFACES=3D"*\([^"]*\)"*/INTERFACES=3D"\1'"${dev} "'"/' \
>> -     "$dhcpd_arg_file" >"$tmpfile" && mv "$tmpfile" "$dhcpd_arg_file"
>> +     "$dhcpd_arg_file" >"$tmpfile" && cp "$tmpfile" "$dhcpd_arg_file"
>>   rm -f "$tmpfile"
>> }
>>=20
>> @@ -125,7 +126,8 @@ dhcp_remove_entry()
>>   then
>>     rm "$tmpfile"
>>   else
>> -    mv "$tmpfile" "$dhcpd_conf_file"
>> +    cp "$tmpfile" "$dhcpd_conf_file"
>> +    rm "$tmpfile"
>>   fi
>>   dhcparg_remove_entry
>> }
>> --=20
>> 2.7.4


