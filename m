Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E5325DCAF
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 17:02:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEDEL-0006Bm-Pf; Fri, 04 Sep 2020 15:02:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9G2Q=CN=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kEDEK-0006Bh-UY
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 15:02:21 +0000
X-Inumbo-ID: b02350fd-9083-41e9-8aa9-6147a9305c6f
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.69]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b02350fd-9083-41e9-8aa9-6147a9305c6f;
 Fri, 04 Sep 2020 15:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DxmEepi40z3Q58/AsmldKTwcmQ0aeAdnUESh2RS4tys=;
 b=ZesqAvlhyFhCiF6phnYDbdeKmPCy28iVk4sK7dSeiLagvB2qPCMBpdf+m5ZdqViT1QwHUbfKej9doCjikklYOUDvLfGD8yszxY+Pq5r/fiPcYBzdWyTRDnUnepGdeZZiIyfKuuav9kVPWc24xUWrsyQ69GthvXZxZSSLvIVj4Ag=
Received: from AM6P191CA0032.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::45)
 by AM6PR08MB3798.eurprd08.prod.outlook.com (2603:10a6:20b:82::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Fri, 4 Sep
 2020 15:02:16 +0000
Received: from AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8b:cafe::b6) by AM6P191CA0032.outlook.office365.com
 (2603:10a6:209:8b::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16 via Frontend
 Transport; Fri, 4 Sep 2020 15:02:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT010.mail.protection.outlook.com (10.152.16.134) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.16 via Frontend Transport; Fri, 4 Sep 2020 15:02:15 +0000
Received: ("Tessian outbound 195a290eb161:v64");
 Fri, 04 Sep 2020 15:02:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 520b402de349c7ae
X-CR-MTA-TID: 64aa7808
Received: from b782cd2636df.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 10D2DDFC-688B-4C19-BFDF-775AC6FE1121.1; 
 Fri, 04 Sep 2020 15:02:10 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b782cd2636df.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 04 Sep 2020 15:02:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hgsMJfqRegikrbOYhPNrJmdqEFL4Km3YhWOiGjXxnXQUiOWFJsLktMowuGMXEdSxIwyXlk1hEXSqRDrSy6qsNTeuin66dRvbsV64QU3eDCJq1B+QKt2zW/6hQlzCeP4jZHTYo92NeKJYZKLKqFQn/mvsUXhcyezKkFZGqqaNcFr1BXBS36DW0mqyMecI0t5uPow2ZcHxkGI3CZa/xD2nTPaBdn7S36dckG68ZdGhr9NyE7A9GzsICCKDmVujYQcrhYRl7G7qCtGUi0uimveldLee8OxuDQks70WOYXtkcGsy0Q2D5ggGxAABmoTwZLgXrChmWvFHRF4Gm1vmOCh0Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DxmEepi40z3Q58/AsmldKTwcmQ0aeAdnUESh2RS4tys=;
 b=FqPE7KlqRzovYR2qlS0RrIs1lcn75MszGx73Bd4oMTNZD01W8YpxTkdQGIEigovpVnfRHkBGXSwsObnbCJ+ZMwboL7jEFdW7YiysCdN5rieORZXBvLDwJnYE37hYtAJOpPoL/E9MzTZTcDmY4RIMgLJVWOjNlsx5Lujq0HfUtufV+80C07bRSSBdg4muSd8mKaUYrrWPgukz9yH+UjbjKX3Uw7gp0dYJ2gSGjwtACynFTMZk2OxOaV/7rd7DvrVMak3GE7w2cgfDxhBxiWtHKdalQDozcaC7rE0+kTYR9BnTRJSHlvw9NM70eNptdT56pWkc2CGnGszmFyCkMuTClg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DxmEepi40z3Q58/AsmldKTwcmQ0aeAdnUESh2RS4tys=;
 b=ZesqAvlhyFhCiF6phnYDbdeKmPCy28iVk4sK7dSeiLagvB2qPCMBpdf+m5ZdqViT1QwHUbfKej9doCjikklYOUDvLfGD8yszxY+Pq5r/fiPcYBzdWyTRDnUnepGdeZZiIyfKuuav9kVPWc24xUWrsyQ69GthvXZxZSSLvIVj4Ag=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Fri, 4 Sep
 2020 15:02:08 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3348.016; Fri, 4 Sep 2020
 15:02:08 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Paul Durrant
 <paul@xen.org>
Subject: Re: [PATCH v2] tools/hotplug/Linux: don't needlessly use non-standard
 features in vif-{bridge,route}
Thread-Topic: [PATCH v2] tools/hotplug/Linux: don't needlessly use
 non-standard features in vif-{bridge,route}
Thread-Index: AQHWgO/sZ+7xf466l0aAIBsrrJsv4KlYltaA
Date: Fri, 4 Sep 2020 15:02:08 +0000
Message-ID: <28CD291D-A1FD-4952-BB69-7652A0A2F239@arm.com>
References: <a417690e-539c-b1b0-a372-3aea54d5dabd@suse.com>
In-Reply-To: <a417690e-539c-b1b0-a372-3aea54d5dabd@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8591253e-ce41-46e0-90a0-08d850e3830f
x-ms-traffictypediagnostic: DBAPR08MB5798:|AM6PR08MB3798:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3798C56F79E7847C6A7E4E279D2D0@AM6PR08MB3798.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: klWvc4/Vt2zsjykwEhLTt2Wiyif3z1sc349BzIKSbOuYOqwgfkI9yIgVvNgNy/sly74+CXT9e+BCgrf08PxgZdpzBdOa0eV1OQvxRLYWzxNjPVImH6eIDNccbbqtifSsRr91ysha+U/6a1uBsAgrYOBRq6KqT459e5azOPF3HRAoecXGYBlG6Og5f+E/NLRZypskTvcFVJtAB6GLdQR+qaHfzC41f0ezBR7+f/eXdagBFmaAYeL9kjp60/5vnUNRLduE6dHL/eg6TtdBbN/U4e9MM4aujITfpNfSLwP+ntP/js1IEYxbzrpphD4in2zevYVLNGKUK9sB6v0krBsBmpp+Tb7D+vQDTqbZwKIbbY3JNWDCUTXMb7IpRGkza2nN
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(5660300002)(478600001)(6486002)(36756003)(2616005)(54906003)(6506007)(26005)(186003)(53546011)(316002)(83380400001)(86362001)(4326008)(6512007)(76116006)(6916009)(91956017)(64756008)(66476007)(33656002)(8676002)(71200400001)(2906002)(66556008)(66946007)(8936002)(66446008)(142933001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: RHAjAhhru7TuvFNZB+MYTLrtLOSAgqqhSsFg9hjeMRsROvDFzm/AxEreUV01V40uFY/lbYnu6lATagWEdGXAlWr5nG3m9RTPNoeUeF+9Nam3aeINerETNvG9UV290rrJVSCGqX9TeS07c6mdbBhZd1q/acwouQV/0UnI31N9i5prL2SZ0vpd1fQixId2nVAz8AZjkzUX6dcypzW4g34DnHHiVmIpHi9NZ21N4zIxsMEtR+nDgwlJZwPIiXgywcScEdQYTXGUllIFisrveotFXHdcxIUY0F3TsITsjD/fUFeYo1g45bEtz88BFiGcCnfl1GuwosNYahN/pG8/1G4/j7KcvOJjinn/V6xTadVQSPFSGuH7KNxD6/Bn0n0DU075IiaNM9TOqMqgSo8ne79h7wKrkfmKhAUWWxkv3YEqrFnPbhfv93eVkQa6ffEyS35ImTmp3fzLjOzAXiLRQjo84/qQaybWcni1+cBxsT7F9/db+CKjzyUE34lzuAHE1uTzIlWh1AzquqStP9C6k/TM1pUKdKdITZdu3cz2twgf8nhR0MrwKNQbke1bqS60BxeVKArP6uCAgw5Gq7s3lW8wD7A2zXihEsXcnBJBZyVsqjzd2KTennm9rYBxXAAAmO/BAYzFJskTjfEGKV97pUfE2g==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EC0384A02C831D46A9F5025DF740773C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5798
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 64462df0-ee76-494c-9181-08d850e37e94
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZnQeqHKJRslGZX7710OzcKQu3zIaJFA1kvhmtjLxIC5W2RSXiLr6/5fuK3YtrasNTzgdFKdRn6Nqmza5LGJuLIuewZQj/x3SSntLKxDep6UujWZBICqH+rujjVtyKs5LRhhuq76Q2TZtQMgQcEp8VJBrN+0VehSSlRlwbPgz6+QMaIfUqrLNS1s+w2/E50WtuBa75pZWNgKqN1Qx4QkpVImTyrG41jgwCTmdHejhET7/JfpWtly3Wf0SICczZhrYz99nUpmjM2SoVqabnITKi2bdamTRrQeoqLTtPs+TWBOfDnI9ggjt/2rZvKJQUA8q9BOqjSbVHOHpKZqOWmzveAs1xbLUAT8wl7iZBN7IwST8QnQQMZNfqxCnsUdGsHXoeIhWOQKqjKPXF0Ubd61E4P6blmwnIDjmdUuxciwiclQ=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(39860400002)(346002)(46966005)(54906003)(6862004)(8936002)(8676002)(186003)(26005)(82310400003)(6512007)(336012)(316002)(47076004)(82740400003)(478600001)(6486002)(81166007)(356005)(4326008)(36756003)(83380400001)(6506007)(36906005)(2906002)(5660300002)(70586007)(33656002)(86362001)(53546011)(70206006)(2616005)(142933001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2020 15:02:15.8944 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8591253e-ce41-46e0-90a0-08d850e3830f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3798
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



> On 2 Sep 2020, at 07:09, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> We're not after any "fall-through" behavior here. Replace the constructs
> with ones understood by all conforming shells, including older bash
> (problem observed with 3.1.51(1)).
>=20
> Fixes: b51715f02bf9 ("tools/hotplug/Linux: remove code duplication in vif=
-bridge")
> Fixes: 3683290fc0b0 ("tools/hotplug: only attempt to call 'ip route' if t=
here is valid command")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> v2: Also adjust vif-route.
>=20
> --- a/tools/hotplug/Linux/vif-bridge
> +++ b/tools/hotplug/Linux/vif-bridge
> @@ -77,16 +77,12 @@ then
> fi
>=20
> case "$command" in
> -    add)
> -        ;&
> -    online)
> +    add|online)
>         setup_virtual_bridge_port "$dev"
>         set_mtu "$bridge" "$dev" "$type_if"
>         add_to_bridge "$bridge" "$dev"
>         ;;
> -    remove)
> -        ;&
> -    offline)
> +    remove|offline)
>         remove_from_bridge "$bridge" "$dev"
>         ;;
> esac
> --- a/tools/hotplug/Linux/vif-route
> +++ b/tools/hotplug/Linux/vif-route
> @@ -22,17 +22,13 @@ dir=3D$(dirname "$0")
> main_ip=3D$(dom0_ip)
>=20
> case "${command}" in
> -    add)
> -        ;&
> -    online)
> +    add|online)
>         ifconfig ${dev} ${main_ip} netmask 255.255.255.255 up
>         echo 1 >/proc/sys/net/ipv4/conf/${dev}/proxy_arp
>         ipcmd=3D'add'
>         cmdprefix=3D''
>         ;;
> -    remove)
> -        ;&
> -    offline)
> +    remove|offline)
>         do_without_error ifdown ${dev}
>         ipcmd=3D'del'
>         cmdprefix=3D'do_without_error'
>=20


