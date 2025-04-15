Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F98A89460
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 09:01:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952106.1347656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4aIe-0005eS-33; Tue, 15 Apr 2025 07:01:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952106.1347656; Tue, 15 Apr 2025 07:01:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4aIe-0005bN-07; Tue, 15 Apr 2025 07:01:40 +0000
Received: by outflank-mailman (input) for mailman id 952106;
 Tue, 15 Apr 2025 07:01:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ubua=XB=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1u4aIc-0005XY-S1
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 07:01:38 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20605.outbound.protection.outlook.com
 [2a01:111:f403:2606::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7662acb9-19c7-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 09:01:33 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU0PR03MB9397.eurprd03.prod.outlook.com (2603:10a6:10:418::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 07:01:30 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 07:01:29 +0000
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
X-Inumbo-ID: 7662acb9-19c7-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qFuYu+mJ3TNgxWIPAu1pgtw4VyVNQSKm7IvOIdRc3o9Tt3Y6quHV3ZswYoWUUPOiR9gkBJZAyep8Cs2qBHZFiOaPrqEhenAxFX2JhOzop+6kkltYG5gEIY+VAfPx9nEBn/A+1fddf86n5Sv+bhIMnizeSmynjQAirk5eyFug9dSAWbpHLBYP80Z98BR4Kiu+k/IYWw+osTC3JJ3RbKKukfd12tJ9b7fmVRMYqmvNtdB4fqQyVOfVMd9sZOPmAsi4doy+XRMQMhhENPjR5kHhahrea+Zi9Xeo+LB3vW33sANSTULqxtKwA0SMsMq28VsnXL+KP+PLIvJhMctpqw0jew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ed65JedvtLixGMrjW7VTHPtzpGPSaax4H5aGaB13iL8=;
 b=DHFDAikZ1TREnnO+SgGkYdTxrfPds6hluL0qtpV6Av+ZqKdprEWh5JIeGqh5+pR4vsopP9Ia8yAJq+c5EeiR2AsGYQnaXkMemlV+/I1B4YlVCC9hoVXb3ZGY67HFVoI45vLR/bkJf20Pd55MdEOTes0JhU0bjj7PbHb1z4XQFKFJ9oNpOBMEGzD2A4JX+bMcdnVGQEnT0EvCA7C4DrTms465KI7/MtdME04PkfYAmTmOpV/5cuhcvogKroyNOrBoQl3k+NhOxgbHDdcKCvevNFv+RcrWCsLx6SN1oHdGDLMcSA5b4Yxuz0Y2ujhhWjYwJ+RwbLEUKTSLof/sr4Ijtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ed65JedvtLixGMrjW7VTHPtzpGPSaax4H5aGaB13iL8=;
 b=eLFwanCq82qhMOtpmCltIvq0xTvedAmEIVosBwGtKb21WLny7xKPpo9pxGjoc2jBjhB4Y4eFVj6YrFEeD+XT5NJcBUapLQ7I/LH1UNkxSnv710kL9nxfOuf/xQaPR7aCGlR45zjghQtAktlWd3cMWPPCHXf7DRzarRf+Q8s9v3N5P9dC72lGMP1jforaQDzI8V0faxd4ZPv3+mxfSs3PdCH+7B+GFRpw381Y7uoBtcVBLnIeOtiF52g3ObS5oYP1iA3b+qoMsau54goILcMfhc5sK0/feqtTMsPtlj6psVs1ZwQFoC2UaVS/yTPkZJL/AYtOqrPwV4DuOXzo5/QNEQ==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Alejandro Vallejo
	<agarciav@amd.com>, Grygorii Strashko <grygorii_strashko@epam.com>
Subject: [ImageBuilder v2] uboot-script-gen: add xen xsm policy loading
 support
Thread-Topic: [ImageBuilder v2] uboot-script-gen: add xen xsm policy loading
 support
Thread-Index: AQHbrdQ23X0WxR72F0K7gBcSDAVLlQ==
Date: Tue, 15 Apr 2025 07:01:29 +0000
Message-ID: <20250415070128.1938253-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|DU0PR03MB9397:EE_
x-ms-office365-filtering-correlation-id: 62cc0094-2b32-4269-bb2a-08dd7beb58c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?d1Et/N3d6paRx4ppl0asyM/l2FLyb3TF5f9X5DTb1HYHXY2zmCydm1f6Fn?=
 =?iso-8859-1?Q?kaHTnCz8poJu+oKn2/CtNyN122uVnXyv2T7M+Pp52WlTP83xJWRGbqBs82?=
 =?iso-8859-1?Q?z8YLLVylGwKj6gJPNGnyUoRKTRaYXm4nN5SWceD1A4UFMrGTsZJj9tBHQ+?=
 =?iso-8859-1?Q?/6sTYmvsZRtzeyWl/XdPTj397I8O077IKxevzHYZU9nOLBXT1SlXOQECfb?=
 =?iso-8859-1?Q?jHaukfKyLF1+GsUUd8A9nIj89xMVVF9ofeOm3fhf211ZOSPPthrWKwfec4?=
 =?iso-8859-1?Q?E2AO7mXdz4W9ifqZ5RPgeg/2FunF9QKdTk8/eAiTGS9fOerWID2QhWGL9Y?=
 =?iso-8859-1?Q?faZCrFAVzjeHM65S6YvrIVcqY+Jpekdu5X+eQ9Z/RjCW0HCT6m3wimUvtv?=
 =?iso-8859-1?Q?xGPhEAgqSjye3/70zP/aJyV61/XEo+p01MI3SeGEcCSso5NVcpogctMvbQ?=
 =?iso-8859-1?Q?+pz6OvPoBWNNGlt79BQJvCrX0xEkrk71+GS6HJX3TqNlFI2gdZdX7djFNi?=
 =?iso-8859-1?Q?0e6UZ5rD/vxO9PKzniG/nrfhtJqfvZWcc6x79gD4kILUESQKi6FPiLSYjv?=
 =?iso-8859-1?Q?HnOclgr4grkOPPaQobZdkRsgwFYX4cW9nAmYzL+bcVYMX1U2gfWC6mvIvv?=
 =?iso-8859-1?Q?4568MDiPM4Z2EVcEkvvhWWhDG9MDPQQr7NJzBAnrmcEP8DeeF7WTIAHXMu?=
 =?iso-8859-1?Q?A8yX9yjMhEA3NOdYp47kenb5QzhDhz9mkffqMyyHNiZEbf4xAOn0bGtezJ?=
 =?iso-8859-1?Q?7eKH6fIS9GfVW6jNPaOYzaP25zyhFtwo3dYe/ZRB/w0+ST0ZQz22mSYO9W?=
 =?iso-8859-1?Q?V2eRbTXZCtguLpjYFxj+/xIKt8cpcKPjCcWVgC4nG/wUTetskGucpIe+dB?=
 =?iso-8859-1?Q?cZQmYY6fAQvNzVmjmLo5CBSfIf3IxT0QhvA1oDksBg/6v3HlDCU+lecDXg?=
 =?iso-8859-1?Q?UsnBhkXDjjEfnSyz7bh3CU1/UhEJj2ERaEHTW+27pbnvQkUV2RHb9RKT1L?=
 =?iso-8859-1?Q?bZLqJM4BXWcckLI4L+wto0OXUOM+N7C3L2zLWpCD+Qk1wLMq+SXh9xDicQ?=
 =?iso-8859-1?Q?az5FGy0OcXcgnUKvB8QJnoUR1fT+UTlxwio5O13KZWfUv/PEMfp4oLDANd?=
 =?iso-8859-1?Q?iF9hpBo+uP40VsWVcrFGZQRnNC9AkQKpdMPLGEHUkx0Gius1MagvSnVOvr?=
 =?iso-8859-1?Q?hRLly1IZVWdopvhnWO7Sb5OqvMXBs1rXL5UNwgaqCRnsULclOjWWkLEhX6?=
 =?iso-8859-1?Q?+BEyewRT8uoDUAIe4L2xL07vDrcHboAjUQV97k7CoW6meGYYWlZS3SJ7Vw?=
 =?iso-8859-1?Q?3sHzM6e/4P/0TiaPf+XbT61+sVm0Lw+7zx7TH7ynxVKZIXEDkt/FYLE6Gh?=
 =?iso-8859-1?Q?l+1z7UO9rS4vGwyXPcmSd4Vmyb2RpwzCHiARBP2fKvSegVEiO8l/bdE5mk?=
 =?iso-8859-1?Q?GgjPVjLaPIFzXVfzYq6I+u/FJVKkzD7Giqlvp1o8KqnG/RqeHw6dx93HGe?=
 =?iso-8859-1?Q?LtG3SZ1jNQxn+EWKCTW4JMPbVpr9/IRRzeRfZFrBqoww=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ltJctMfObRdkSzBynK76gqpMex0P8be+corhUYMqDTAcRqxURQSashTyer?=
 =?iso-8859-1?Q?FNyTc3+1sGLr4IbSgy3E7pfjJQ+oDl+CzZQY01R71RUwld22avGRB9RIpo?=
 =?iso-8859-1?Q?5C5sUEEdZywNUPLbRg2ubCdAEN7JKfcYHkWwTlqGCI517eVUg5XbuAywUK?=
 =?iso-8859-1?Q?Rm1dE+AREZtS54LDEtxu3Vt0h4vRbqXc5pUHom6VkrEk98jVTajN1r6lRg?=
 =?iso-8859-1?Q?TlhVh+Y/z0Qy+ttosYzxYVKSuMJGaVP4i0vRNRdIBkHE7aGFGgFRjedqT1?=
 =?iso-8859-1?Q?Q4Auo2aHQcEY5xSsgiW+zxaqleozvQxg7hMGg8vRM4HIOmfrNy/zzM6RdI?=
 =?iso-8859-1?Q?GoCATv1c0MVdKiq+4SQmQ28RfsJ92gfST2iU521yW7O/fKse523AJzcLGQ?=
 =?iso-8859-1?Q?+i2M70S7KUZgcvLiQHYR1pL9cvPoZNl2RH/UoInFo2EWI+LsW5OWSuui9N?=
 =?iso-8859-1?Q?tpJRuiKayeCfGfIAJmbHqwvDvIlyftiQItjVSpm3qQvcI9Nz3wpUmW83i4?=
 =?iso-8859-1?Q?GL/0yF+cH1DPHCDnV5K5mqT333YLHSCaECIHvWrwhXYIcWwKGBLet9++b/?=
 =?iso-8859-1?Q?4YetdA1e3lSPJ4Us2218tEHrRi1oPNmJjwI9PRJIkUdKPvtjabDtHVYZv1?=
 =?iso-8859-1?Q?HEPTc2NLDx7Txt/FNejyIjNsriAEHXCREZZmCk41H3qAQjcyIriuBOD95/?=
 =?iso-8859-1?Q?Xy+4cJIUYDs+m41azCYqumRU33Kavlp7bCw+dL526W0s6wvvMXOudl4m0R?=
 =?iso-8859-1?Q?uam0Xc4I2AwdhbzWcjmdPiA1EQklDm9aT912HFcRt4Az1nUGuSdvlA1ul3?=
 =?iso-8859-1?Q?3bRT0L8SQRjqY+XllXyfS2lUzUxYfe4yLW/XmRrlGbJpXCwi+FEQsTKUKL?=
 =?iso-8859-1?Q?xKxfTAPqm4MKuvlMwPwomWlwkJySbbv85Exv+fdwZjsDK0yhuTDz+OZo1a?=
 =?iso-8859-1?Q?DLAiVuer0xUYtxheEL+Ylo9/tD5UE5Vt7tYhuOdJXGEGcv1a1vwvhz9fKC?=
 =?iso-8859-1?Q?HSSVZyZvBqBud/1fE9p5OS0mfETiJY8ubO+guzSM43ydMNhbRrsdsCHfH2?=
 =?iso-8859-1?Q?Nyw5wK/CDGKX+ZM+wo46+fCmBgpo1FvqnoJkAtifwLnJl5Qg5b+cvNs0zX?=
 =?iso-8859-1?Q?sgTTXTRdnj+KAEFVzYJ4SkRsAlIxNiEf1gGp1ihgyi8Mz99xjec6ANI5EH?=
 =?iso-8859-1?Q?DegLQDUeYc1s/9NTzmJkdWgXkJs9MEQjO0KQYvaUbBPgLtjvBMC+HZ5iZz?=
 =?iso-8859-1?Q?wcJakD63YqrEozru7DpmEbuSIXvwONs6CYiP87WYOd8FP5jK9Fb5hIlqqQ?=
 =?iso-8859-1?Q?mbI+h7W+RhmSHAnqC47FmAwAuD2Xd24vJmR8f3uu7isU8xgghHAeKo1+C8?=
 =?iso-8859-1?Q?BG7FB/RT8Bbcn9/zkBR8jMmX8J8HqB0vWysKo9eRhqqb3Rwr/MUo7ScEog?=
 =?iso-8859-1?Q?SYQvAuOYo/8nPq5EY6K9dqr57wpR75t5A1i0kIUDPq1c6YLhWt2o84eWF5?=
 =?iso-8859-1?Q?PDfPZUajVF7PTgdCYGtNtlCwdsQVO0lSP2zx79wMS069Ed/BHoYRmSzbTA?=
 =?iso-8859-1?Q?Kz3QL63KKsje0EuECRd+avlx6yFnHQMB88o6DcJX7eV8xd1BK5NNPdTRYK?=
 =?iso-8859-1?Q?FCtQwNt3tPn0PK3K90qj6r2e2RlOcJcnfMj1bOB0Zt0sPF6tbHLc2oxQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62cc0094-2b32-4269-bb2a-08dd7beb58c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 07:01:29.3279
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: teOZMG27cE4PWvZeNXqnF3bvWkhlDXcsnQUjyZ64nEI4xmeGHxHLhN/XfqtFFheJGF9eh+O7cfacMXqvv5J8mhr/gxUtWIB3oqXv4sWkxxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9397

From: Grygorii Strashko <grygorii_strashko@epam.com>

This patch adds Xen XSM policy loading support.

The configuration file XEN_POLICY specifies Xen hypervisor
XSM policy binary to load.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
changes in v2:
- fix conditional statements for XEN_POLICY
- add XSM policy binary check

 README.md                |  2 ++
 scripts/uboot-script-gen | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

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
index c4d26caf5e0e..208eafdecfeb 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -315,6 +315,15 @@ function xen_device_tree_editing()
     dt_set "/chosen" "#size-cells" "hex" "0x2"
     dt_set "/chosen" "xen,xen-bootargs" "str" "$XEN_CMD"
=20
+    if test -n "$XEN_POLICY" && test "$xen_policy_addr" !=3D "-"
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
@@ -900,6 +909,15 @@ xen_file_loading()
     kernel_addr=3D$memaddr
     kernel_path=3D$XEN
     load_file "$XEN" "host_kernel"
+
+    xen_policy_addr=3D"-"
+    if test -n "$XEN_POLICY"
+    then
+        check_file_type "${XEN_POLICY}" "SE Linux policy"
+        xen_policy_addr=3D$memaddr
+        load_file "$XEN_POLICY" "xen_policy"
+        xen_policy_size=3D$filesize
+    fi
 }
=20
 linux_file_loading()
@@ -939,6 +957,22 @@ bitstream_load_and_config()
=20
 create_its_file_xen()
 {
+    if test -n "$XEN_POLICY" && test "$xen_policy_addr" !=3D "-"
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

