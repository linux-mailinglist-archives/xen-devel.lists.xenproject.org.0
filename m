Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D250254693
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 16:14:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBIfl-0003Cx-AE; Thu, 27 Aug 2020 14:14:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fcIR=CF=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kBIfk-0003Cm-9h
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 14:14:36 +0000
X-Inumbo-ID: 2d3b4e78-19c9-4c60-9483-8257f841e746
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.84]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d3b4e78-19c9-4c60-9483-8257f841e746;
 Thu, 27 Aug 2020 14:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvqSDfb/1ccgvyttqkh2Es9aEGtk3LSw8rl8fA4C1F4=;
 b=unewYC5g01GgInhWeq133DJvtTkR4GfxBAYv22Gfx0UoTpKMMSk7hkqN95F6PBVQ8Md4ae5AZE/8F0vQtIX7iAJXnVX/BPnFA1pq1Y7yL8ZffWJliaSZl8qMiMuAhKxiOA60rmhFGK8DdTZW8Qmnbwl+T2zp6263LEDl4tYWvdA=
Received: from AM6P194CA0091.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::32)
 by DBBPR08MB4773.eurprd08.prod.outlook.com (2603:10a6:10:d9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Thu, 27 Aug
 2020 14:14:32 +0000
Received: from VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::60) by AM6P194CA0091.outlook.office365.com
 (2603:10a6:209:8f::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.20 via Frontend
 Transport; Thu, 27 Aug 2020 14:14:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT046.mail.protection.outlook.com (10.152.19.226) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Thu, 27 Aug 2020 14:14:31 +0000
Received: ("Tessian outbound 195a290eb161:v64");
 Thu, 27 Aug 2020 14:14:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d4eddb78ccc9614d
X-CR-MTA-TID: 64aa7808
Received: from 22a71ea6eb20.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FE22870B-6351-4A96-8250-F468570FF438.1; 
 Thu, 27 Aug 2020 14:14:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 22a71ea6eb20.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 27 Aug 2020 14:14:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tuq7mRmDXLTDJBc7W/xm1So5nLpMseJrt7JwQ8xhwtNmCwzvagrHnYmH+2OJOoWm1v8RmHrepuCoTontsdljpm9hHOWawuSLgFaJtM4e9jaEab6MRc5ILdwCzm/WPEBfCbqgJN0rjbe8+zDt1hlz0rkz7ASa6MzVzxK2KOc6/3pg5GcPVne7mjHFtmns/NORbpHriTBEBgv094o1vSk9BtQjwAFIrE12aoOHsxyKUtBVE39+iXW+TMlFTK0liLtFhwbYlw6FNLI5tq+IKmAf5DUvoVYsbPxhwyYAQS5Idm/asQ3BmAW+PdwwM8Cjk+OMiP70P2d90lu5eU+RWWjFxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvqSDfb/1ccgvyttqkh2Es9aEGtk3LSw8rl8fA4C1F4=;
 b=Lf1xY+oHvLPrtcMY6GX1lgyNfjb1EXtQ7teqYNxA5Bs9D2bzb7wDpDhfH5oLxLR4cUdiyGyLuK+FTKrgsUIkgyAAIuS56+c+C5Wf90/Bra39rvWuqEcd83SVHlThExBDufwJlrXThMUYRDZdk4/a8KmxuFy9OJO2YiXFinQnM17TZhVlv7OY8lOVvH9SF/JpVwO2uGnqbV0XdPMphr3LDYiKSugaORpkgJFA9FstemiXVBR0nGu/83AJSZvy/mAyEQNGSfRz9jZOAo2X2RhNCj79rwL9XZswpJHJ079mAUWxmE5Ncl/vNmKpwNZnj/jwhRTn9MpSXQeL3dH7ainw6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvqSDfb/1ccgvyttqkh2Es9aEGtk3LSw8rl8fA4C1F4=;
 b=unewYC5g01GgInhWeq133DJvtTkR4GfxBAYv22Gfx0UoTpKMMSk7hkqN95F6PBVQ8Md4ae5AZE/8F0vQtIX7iAJXnVX/BPnFA1pq1Y7yL8ZffWJliaSZl8qMiMuAhKxiOA60rmhFGK8DdTZW8Qmnbwl+T2zp6263LEDl4tYWvdA=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3164.eurprd08.prod.outlook.com (2603:10a6:5:24::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Thu, 27 Aug
 2020 14:14:24 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3305.031; Thu, 27 Aug 2020
 14:14:24 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Diego Sueiro <Diego.Sueiro@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>, Ian Jackson
 <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/3] tools/hotplug: Fix dhcpd symlink removal in vif-nat
Thread-Topic: [PATCH 2/3] tools/hotplug: Fix dhcpd symlink removal in vif-nat
Thread-Index: AQHWduFzi7tknqNOmkiLnZ0D+vERVqlMCvgA
Date: Thu, 27 Aug 2020 14:14:24 +0000
Message-ID: <366F6B06-73ED-4C2B-8FB4-A2208D5080E3@arm.com>
References: <cover.1597920095.git.diego.sueiro@arm.com>
 <3b0efb9fb1ba94922c0ae156c0ab0be6a9f45f25.1597920095.git.diego.sueiro@arm.com>
In-Reply-To: <3b0efb9fb1ba94922c0ae156c0ab0be6a9f45f25.1597920095.git.diego.sueiro@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 67897a3c-9a05-4d0b-9abf-08d84a938470
x-ms-traffictypediagnostic: DB7PR08MB3164:|DBBPR08MB4773:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DBBPR08MB47734F0CD2C7D037B8A01ED99D550@DBBPR08MB4773.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:644;OLM:644;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: sJSq0+ELttdcv6HUMh+Lf8jVYOYkyVw2KAEQ0KkTtI8Q6jb35q/W5n12ycf/BObDrbyJ7Xmp4ob4rj5g6sThwtSwz44OyTPQCqzpRb6IBP1I7cceB6fISp4i9cQUhGGmSM82XIMa85nKftIRttCPDzbEjTnZjnZotce8eJxwVUU4JSxg/MRtBalYYWP4XNmfhFf0SeMK941XmyFk2jXnFGgFikIK9afFAcaiwW7+xhnoJoerYXbK5qbov65w9tTCJwVcpBg0u5I8Q6vly+NwkUx8GSnjZrBT68QMc7uu/Jkp7qflG1R0ZSdQX1MCk1zO46xnEhoMjDkDdaqDc1VQ6g==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(136003)(366004)(396003)(6486002)(6506007)(316002)(54906003)(186003)(37006003)(53546011)(36756003)(83380400001)(71200400001)(2616005)(26005)(86362001)(66446008)(66556008)(76116006)(64756008)(33656002)(66946007)(66476007)(6512007)(91956017)(2906002)(6636002)(8936002)(8676002)(5660300002)(478600001)(4326008)(6862004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: +1dahJ5iq5onXD7knNx05/ujjMQE0bIUQzigHrrTqblx0Adshfrt0z+1/6kVo1nYdA0ulh+jhDfy+Fyhetc7fiDm9pq9KMWpI+SEad0V7CjA6de0Y5BfJUdogJjSJRDI2asIIBuT50mtT6gYgtDs8C89ZrTZKUbSEDcKF2usjLsR6k0zKB9hbIDqGa3DYpCsj8iyl/Urq+VxaBZD5OYhO6EYtWrhbLwkuz72kLOMgE7azaCy2GNfK8FQFtkQAbzKGl/S3Jav6ruPODhdEItRpZetRim7AmI7dSFT+3zGejhbuxV3A70S7lEb/HSXOaUlKaCv9nvKLdNYeHqUnewksZkp/AGR5FZ8BX3QLSXjso/rVAKzKiwuzn4dHKQ2/tBYgmlVbVWY/Pk5Wjd3JayPm75h8XzgJKn/lZeV5agewSgeKrMglu478TbVgeV5vtJv1Gcued7ad8j5opSueTiUjFqOVXRn34pxyWoBHg46HxRjqU07mZJN0G4jgvDcyaWyvDR2TWhpENHMWPEEX8tIj2gvxGVAKFMMR7qygGlAve++kD5PymNuDRbp9HEapvq4CnrVLBWAIF2Q4yqB90BdeFErJYHyW9FY+I5OnkBfa+V4DsscIo50DfUlY+lI/fialJ8pQvPBXgRHa3l7vkipqQ==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4AD7F9187FA4F84CB8545F300A345DF3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3164
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1f8efc90-69fe-498c-267b-08d84a938047
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gtqs5ZImt4frC7MrvZTThy3xhO3EmonaXbyC8OV/v6wx/7YD5eO1GZOG3TePn+oCTWSQxP/QVfHaMycLqwtW36kt0NDVr7WWJEa+51ZmlqOq+1puP7PR0oQ5k74hIPvYoGjNumdtWfQvQmSAVwgZx9MqOfjPrgnRqSHvYO9IMEz3U7Zx6lOKrvY1AILw4jkgJriJZpxhwboojFu3T/0tyCpL/cO+OsWkCFc7LjU7MbM+QWzJjr2vZnZ2Mi3h3O+iJbDliFVVxXvmFeINAfOALQoiHvRyAX2zbTqsBBYU9JYvC2alH3Lnp6+m3q7RSIlZrQG3KFJkNaBmUrTzUav5NNM21Egc5SiQtZi2QbkehFZvEc42sYnFv2UBbjzQ7RYXIgkbpbNlclynYkmPB3zeew==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(46966005)(5660300002)(82740400003)(6512007)(316002)(2616005)(36906005)(47076004)(6862004)(4326008)(6486002)(36756003)(8936002)(81166007)(336012)(70206006)(356005)(86362001)(6506007)(70586007)(186003)(83380400001)(33656002)(82310400002)(8676002)(53546011)(6636002)(2906002)(37006003)(54906003)(478600001)(26005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2020 14:14:31.3995 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67897a3c-9a05-4d0b-9abf-08d84a938470
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4773
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



> On 20 Aug 2020, at 12:00, Diego Sueiro <Diego.Sueiro@arm.com> wrote:
>=20
> Copy temp files used to add/remove dhcpd configurations to avoid
> replacing potential symlinks.
>=20
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> tools/hotplug/Linux/vif-nat | 12 +++++++-----
> 1 file changed, 7 insertions(+), 5 deletions(-)
>=20
> diff --git a/tools/hotplug/Linux/vif-nat b/tools/hotplug/Linux/vif-nat
> index 2614435..1ab80ed 100644
> --- a/tools/hotplug/Linux/vif-nat
> +++ b/tools/hotplug/Linux/vif-nat
> @@ -99,7 +99,8 @@ dhcparg_remove_entry()
>   then
>     rm "$tmpfile"
>   else
> -    mv "$tmpfile" "$dhcpd_arg_file"
> +    cp "$tmpfile" "$dhcpd_arg_file"
> +    rm "$tmpfile"
>   fi
> }
>=20
> @@ -109,11 +110,11 @@ dhcparg_add_entry()
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
> @@ -125,7 +126,8 @@ dhcp_remove_entry()
>   then
>     rm "$tmpfile"
>   else
> -    mv "$tmpfile" "$dhcpd_conf_file"
> +    cp "$tmpfile" "$dhcpd_conf_file"
> +    rm "$tmpfile"
>   fi
>   dhcparg_remove_entry
> }
> --=20
> 2.7.4
>=20
>=20


