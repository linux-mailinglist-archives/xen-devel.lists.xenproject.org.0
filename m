Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 867FAA879F5
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 10:15:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949360.1345923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Ey0-0002Y5-Q3; Mon, 14 Apr 2025 08:14:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949360.1345923; Mon, 14 Apr 2025 08:14:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Ey0-0002VQ-Lk; Mon, 14 Apr 2025 08:14:56 +0000
Received: by outflank-mailman (input) for mailman id 949360;
 Mon, 14 Apr 2025 08:14:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XA/R=XA=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1u4Exz-00025y-FF
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 08:14:55 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20613.outbound.protection.outlook.com
 [2a01:111:f403:2606::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ac6ea49-1908-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 10:14:53 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by GV1PR03MB8431.eurprd03.prod.outlook.com (2603:10a6:150:5a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.31; Mon, 14 Apr
 2025 08:14:50 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 08:14:50 +0000
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
X-Inumbo-ID: 8ac6ea49-1908-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=goWX3scS/uJIWX+opt1fYrmORsLL59s3dkIdIzBCUql/Q60f/4Aiz35LVqJtC/P+JSMb2Y4cbfl5+mokhe5pTYhBPPkhDWgHVsOh26hjSfjEoP4F4BxBbqtYtTxv2BVMU/YuwsgmTXr7BQON320yvmKTdOKjc6cPl4IQYnKaqm/p8M/z1xdPPTjja9JqibhS398k/BkUvjSUuWsrMkt1M9KVMJh4DQDmr6bLmhOe8XEQtiG4E8MwNUkX39TwavXgmXMDwLsacfJnTqfz4mbkRSgfaeQ4nIXvJ3d5pkc2lGXbxFzRsDzkszIfhBpPiLkTw5fW8k9mg0aZQX5YvkRAQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cOE4dEhBTz83BtPEP7EAznFRjuPweK6MpHYue0uewNg=;
 b=zIEfXB8hmGIxjVbG2EFI+zdfx2WF8Knzi01MeooL6EC35yG5FPMZ3tI6Jp13LUrw0fviS8oKMD3QqP+82UOj3ibmFlg+DF3Yud9MxxQYP5IWfQsyh0d3c2eLwMU7Qj1pnEWm2CywezYSDbjdYxXjPl3948xalPcKPrHXMue4BVAefbmBiMt+Y+2VyLUizpGO+mylP9okWdnqKquoXHVZJwYOyMudreugNqI4K5HOdsCIJKnbiSwGOMTCWDvQIOgrqJ/d4GDKq+XZH5Lk1FnAvoRpxj8HM62wmx4BT3jOkvXzhkQ91wjnUw5rv5na3eAW6N7JKQ3xjftWprX0xDW/jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cOE4dEhBTz83BtPEP7EAznFRjuPweK6MpHYue0uewNg=;
 b=Huf6yf3zeYvBUBg8Cl2vg/tbKS6BtWXBFb9n1E3knQ41cGdUFlB8tsZJzbIJTfQPIp1nJlBdwV7CkHy7e0dKHFwDSgSig7x4jIilCT/MgE5M0Z5JFqws3HltoaKQttCvyIWd7K97TmBtrVP3snLSz8o1mIaEQWz9VqiC2/aLXpTFhliNvlzgJzlH8jDOhpXHQ429rLy61RpHvhCEF4B61yz3XErZy5LdCBjbqze3GtwVL1uh8xAx2cQlBsJAGz7QXGyH2o/Pz/ENNVQ2k5VX6TSSVmXaVG1xm0pw5UddeZ9wVsevxXwnVwzj6n1EgB0cUgV8cyx9Hcz8UzaFTNOCuw==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [ImageBuilder] uboot-script-gen: add xen xsm policy loading support
Thread-Topic: [ImageBuilder] uboot-script-gen: add xen xsm policy loading
 support
Thread-Index: AQHbrRVLbOHOtwYZX0m+iXoOaHec7Q==
Date: Mon, 14 Apr 2025 08:14:50 +0000
Message-ID: <20250414081449.1763962-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|GV1PR03MB8431:EE_
x-ms-office365-filtering-correlation-id: 6760401c-7ba0-4a42-d37c-08dd7b2c6d8d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?nHoA6WklNg0bpOBSL5M/YL5x8gsTMQtv6zI0xaM2HxyoaEZBHr9Ym+UKej?=
 =?iso-8859-1?Q?DW+MBiavWxZltEqTMS5InkN50HgdJzFvFKfKFGabRP7mI3NDvrlLEjEfZt?=
 =?iso-8859-1?Q?AunUrq3JlQJ1udfCojqs441qWBkLd0B3la6sdI0FrTAM9TjVAsCKZZK4FK?=
 =?iso-8859-1?Q?1xGoEAIGtjBdOsDGwueUhxpnE5VrhRAzhnfnkhuTf9fgOn62ROXBZRkERP?=
 =?iso-8859-1?Q?+jHGoYnpQVM64/mZv+dB0v+WscQbzbWaqa5LLCIrDSbemN97H8HSu3apuO?=
 =?iso-8859-1?Q?E97v7Ryc3aRZahx05tzRym5JG1miRCfZBfw9oolMiTgV0l1UmKd0wjwtUf?=
 =?iso-8859-1?Q?nqH8Vw9nNw8x+1ucLzXe1PrwlXB6yp3CVsvkTxzaj1SuJGf1XhOcoxbsWg?=
 =?iso-8859-1?Q?Jqj2FJ0dR5vwD8PpZzWFgrtSZdK+nWRwDDWsSJQUAiixzyQx4F0ApHuHwG?=
 =?iso-8859-1?Q?BSGAYgB7MeA/MTVUVx6+rYVKRr83UrmXshuQfOlNBQqKtPB/yNJNX9inFH?=
 =?iso-8859-1?Q?vzhetBqEtbOL/G/TxFL4e6gkNkVC8D0432YzTGrw5DQN88jIyy71Hja2ed?=
 =?iso-8859-1?Q?nDrluCpsZsSx7fR0w9DzYfvhV+Ni8zcXkRYrwBDoU3mXhc/a7q6n2ugKBK?=
 =?iso-8859-1?Q?2jQCpCADFGGLx/XKkcbNWDoVThJhoM8aTsRVBSgTOFTVs290CIDq4pXg/0?=
 =?iso-8859-1?Q?cgfvsYKDAHMi9iFzm9WSWn0V6AVkQKYzsDlCcPeEcip3eQWNGYRu1SSjNA?=
 =?iso-8859-1?Q?V+DxJXaXL1u9RtyzNvb1ujuYxEkmygbWUstLqsW7xBz9dcd9TEJz9VDsv7?=
 =?iso-8859-1?Q?fS3b6zbjGm+/ueMRlHcFu4VKqjBpF6kQ2w3zV/z+LNjkUsf1h6bV2wjTsh?=
 =?iso-8859-1?Q?X8/6z0zmgZ88itweSxKbbrdup6218gMmaovMwk5UtkCZ9fHigl6haZVUfM?=
 =?iso-8859-1?Q?cbjzdvc5PnXdheO1S3LKlvmfibbX62nYsNodygu2IThWME3YGz6GIUrlAV?=
 =?iso-8859-1?Q?3D0ew946fDq0IOtu3pDnB5uQO8Iry86ieT6cQ13kc5zaPWIez+nIhiJDDx?=
 =?iso-8859-1?Q?8GoyKEW0Ku2RUwdGiRljxqVSBYPA0XE+UIp7lnHodZhmbk3gEtqVVD/KbW?=
 =?iso-8859-1?Q?Rf5oC0obt370cZq4aRHx5/RXoGuY8bjZj2GH0lrlEXlHdoQJOhghK2lLYd?=
 =?iso-8859-1?Q?bO3P6OuhwvrNWyVIOYyPcp0lqcrf6n/jmokWjDOQUANehuiqBRGnVNnYjy?=
 =?iso-8859-1?Q?NQ8qj+DqwCEcx9Ur3SExGACX3W0WoVlLkH3fdnUlsXEJ5/L3QxHlNSswJO?=
 =?iso-8859-1?Q?nsfRDnDmxJzhqyU+ZPLldYgQ3AVRaWeFQDSZD5fUhMp8jd6WhZd2pH4FdA?=
 =?iso-8859-1?Q?l+QR54n+QyeldwRAnSYopTkMCYnl2c58hcRfojohbPL5yfVi2gIaTeGtPD?=
 =?iso-8859-1?Q?fSOo01bx9Kjy0tZE5q8XomhaTcEeTVop2tPv+OWaqu/vDEivBYuJbdUySZ?=
 =?iso-8859-1?Q?QYnVll99XK3ofuSom1ZbNV5BePmbLmUYV0qaEmkA4vIQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Ze8ZpmrnWhr7KgKkr5EDERsD+xoRujy1eimRAUOVOjAfHvefznHlvu0T4v?=
 =?iso-8859-1?Q?W+mXWXAAdCwagNq3dRsc45e6exicuyHC7eLPEq2MXwGXQSEx12thnjqBwt?=
 =?iso-8859-1?Q?Z+MpDNWML2q5zk7oAJRnzKWnouLCQHGu36V/p57BoVzuMmFFflt9XePeya?=
 =?iso-8859-1?Q?oX02d0CI4vcOX3GN96LWvrsGgxgLi/u65O1jZgW8j3ECXHzqv481aEAvpb?=
 =?iso-8859-1?Q?soYJQ5tMfPzye5lc2e+O/BZjBnnt5yO1fAWun1QijWKRWG7Av9TMtne4YV?=
 =?iso-8859-1?Q?PTXvaOn5nzxjhEPA5OtAny8VgTBPQGLUU4+RADihVQNk6V69CrxQac447y?=
 =?iso-8859-1?Q?PHtMCxu95g78uzvuPt5BweCe5dAaeFVWL7jrOGXZKXZfg6XTmSe20g303b?=
 =?iso-8859-1?Q?OI5yIMjRA9b7RwAYIWpiRGBamQzBWGJHbGtxdqBXh7EualhFCwCPiz+SCu?=
 =?iso-8859-1?Q?vtVzcDRe7HF4Et3aK0HI9ISJTJKOVts+KUpyq0Hj6YHW6iOf805Fod9xbU?=
 =?iso-8859-1?Q?0bQthNNLA0QXASHplZ2Asc+5EqQy7wo/epv9vDvsiKMxhgRzZvRyY0SVAo?=
 =?iso-8859-1?Q?aNEgHUu2RaP2XV5WEaegrZgNEVkh2S9TnOFJEKvTuwcbetVA07QpSxgcxy?=
 =?iso-8859-1?Q?JXlZ2xVzPi83Sl0lJXTMNWuoBTghHPM3SQt+nFuDSA1OG12C2HPkWfgZRR?=
 =?iso-8859-1?Q?dyHmyHfxL1JvhybTd5p2JgkmeO3zECdKutFE7lYxRLnaS1oIEygRX8Fo9X?=
 =?iso-8859-1?Q?UnZz6PHghSCIP/MgSnbH2AjWPAnnu05BHsuP2Irfpdsyp2eS9KUBk5y8jI?=
 =?iso-8859-1?Q?yyapeMKBoxw9Q3YRIMwkjSZ77K+1AKUlZ7ypMzhq7rwUg4C91CPBc8iUbC?=
 =?iso-8859-1?Q?jVGIqi4VrB9iqY23gCs+VDsU5NGzl8lgSvxlJ4c99fY5HZUoIwHBYLXflj?=
 =?iso-8859-1?Q?emkPNNKP6eYUnkaZgD4GE1RJXPczDRqCRxHsPwI1goNINi1tJQo3GJ65U1?=
 =?iso-8859-1?Q?5a4m9kqfUZQ2UUWHj4Fpv7VbNTinCTlSz9VS9dWVJrBi1a2eoR2g+zWgiS?=
 =?iso-8859-1?Q?Hk6ajdu7VVuAIiLnIoVoJG2tszpsICuf9K2cdIpuVsrkY4nen20tgJbsve?=
 =?iso-8859-1?Q?zN4oCQY72pzBeAW359praO6im6HOVbtJVFmjdngE6l2SyCl/cve+RL7Jx4?=
 =?iso-8859-1?Q?mFd9BhDgn5n4CS5SG2+CDB5Mv7zDL1Ur8DnzqE1AaZHAxTuG9fjZy4/Czg?=
 =?iso-8859-1?Q?VnYL0tYDnf27pB0RliF/teHxkez5t8A5+LIn12iHTzEVzQdTFXpOj8YYTS?=
 =?iso-8859-1?Q?FEgpXe90wJi7KZmAHAQXMWD4pX+kyHrlgIwCUlLbk4ZfA8hGDmAf+rfLdw?=
 =?iso-8859-1?Q?YHMoBO1QfIgbYZrVR/235Ba0ulpJy5J7zkvn7vouwNnWaDPaB/+hRPXDqQ?=
 =?iso-8859-1?Q?I5f+R8XcjwoVO8Zptvc8SQ3W8Nco6h5zRtbiOoDoQMaCV9vGbiw41VV+Nu?=
 =?iso-8859-1?Q?YYnZ6Cv+TgzR3+JF/kkv1j63d1zAmLsLHxHomUWFsgcxyL372TbunSK/TZ?=
 =?iso-8859-1?Q?mdebhBhDB7Ufb2SzAcITdFSXoJuRn4BCoDz+LFOcFtdMh/wVsbEmpjk+pD?=
 =?iso-8859-1?Q?vgrWGSpxcALQE3L1tSFPyg0Mz38x8CaN2v9DF29Xv4qCiaP/XnSmEOvw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6760401c-7ba0-4a42-d37c-08dd7b2c6d8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2025 08:14:50.2800
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QJTqWsw+1osbQOgVv2338NCC/rczgdPC+5mnXxvVY1jHNSF+euFrHMWnSlY/gwUvHjpEJWMfr9U2cnMH8OhFHa+V81VcYUO3WKNfx2qPusA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8431

From: Grygorii Strashko <grygorii_strashko@epam.com>

This patch adds Xen XSM policy loading support.

The configuration file XEN_POLICY specifies Xen hypervisor
XSM policy binary to load.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 README.md                |  2 ++
 scripts/uboot-script-gen | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/README.md b/README.md
index 137abef153ce..9106d2a07302 100644
--- a/README.md
+++ b/README.md
@@ -91,6 +91,8 @@ Where:
 - XEN specifies the Xen hypervisor binary to load. Note that it has to
   be a regular Xen binary, not a u-boot binary.
=20
+- XEN_POLICY specifies the Xen hypervisor XSM policy binary to load.
+
 - XEN_COLORS specifies the colors (cache coloring) to be used for Xen
   and is in the format startcolor-endcolor
=20
diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index c4d26caf5e0e..343eba20e4d9 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -315,6 +315,15 @@ function xen_device_tree_editing()
     dt_set "/chosen" "#size-cells" "hex" "0x2"
     dt_set "/chosen" "xen,xen-bootargs" "str" "$XEN_CMD"
=20
+    if test "$XEN_POLICY" && test $xen_policy_addr !=3D "-"
+    then
+        local node_name=3D"xen-policy@${xen_policy_addr#0x}"
+
+        dt_mknode "/chosen" "$node_name"
+        dt_set "/chosen/$node_name" "compatible" "str_a" "xen,xsm-policy x=
en,multiboot-module multiboot,module"
+        dt_set "/chosen/$node_name" "reg" "hex" "$(split_addr_size $xen_po=
licy_addr $xen_policy_size)"
+    fi
+
     if test "$DOM0_KERNEL"
     then
         local node_name=3D"dom0@${dom0_kernel_addr#0x}"
@@ -900,6 +909,14 @@ xen_file_loading()
     kernel_addr=3D$memaddr
     kernel_path=3D$XEN
     load_file "$XEN" "host_kernel"
+
+    xen_policy_addr=3D=3D"-"
+    if test "$XEN_POLICY"
+    then
+        xen_policy_addr=3D$memaddr
+        load_file "$XEN_POLICY" "xen_policy"
+        xen_policy_size=3D$filesize
+    fi
 }
=20
 linux_file_loading()
@@ -939,6 +956,22 @@ bitstream_load_and_config()
=20
 create_its_file_xen()
 {
+    if test "$XEN_POLICY" && test $xen_policy_addr !=3D "-"
+    then
+        cat >> "$its_file" <<- EOF
+        xen_policy {
+            description =3D "Xen XSM policy binary";
+            data =3D /incbin/("$XEN_POLICY");
+            type =3D "kernel";
+            arch =3D "arm64";
+            os =3D "linux";
+            compression =3D "none";
+            load =3D <$xen_policy_addr>;
+            $fit_algo
+        };
+	EOF
+    fi
+
     if test "$DOM0_KERNEL"
     then
         if test "$ramdisk_addr" !=3D "-"
--=20
2.34.1

