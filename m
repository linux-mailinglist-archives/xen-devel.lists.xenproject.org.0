Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2005DB0A411
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 14:22:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048641.1418855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uck63-0007jg-V4; Fri, 18 Jul 2025 12:21:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048641.1418855; Fri, 18 Jul 2025 12:21:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uck63-0007d6-Ro; Fri, 18 Jul 2025 12:21:51 +0000
Received: by outflank-mailman (input) for mailman id 1048641;
 Fri, 18 Jul 2025 12:21:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tfz2=Z7=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1uck62-0007Zl-Gn
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 12:21:50 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c72f1b79-63d1-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 14:21:49 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PAWPR03MB10182.eurprd03.prod.outlook.com
 (2603:10a6:102:334::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Fri, 18 Jul
 2025 12:21:44 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 12:21:44 +0000
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
X-Inumbo-ID: c72f1b79-63d1-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EcaizMG4KhTmNFgIS7BDh/nvCXNRAoqDbNqF85Yi1xziWZzQU07Rxmht60x5Hi34nBITAZosKw3wbWsk31kiI1moP/YWIPodIMBcKR1SQpMJyu1LzvSPPPOT9GXmX39c5fEKHfbHlUgyrh71UKdZLkrcuKtjrEnKf3nYdtuIE365Ke7Svt2ZTBmbTNVMfBlOZiDwx4zq1SdlKCYAU1OVZwTAGhhtw07+E7FI7jp2d4wuFCNipgQ9Ae4iabVNIYrwokpw/p6eRXK9Qry/8kKt0ObwvCr8hySXGmFSOqNKJm2QlK0eDYWboCDSJnFTcCTC/y73NPK0uBm9lVItopcggA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/IIGVo/I46aL3h0NnJg70k5evgO2/fNQmmnj11214gM=;
 b=XZrQCd6ZZEthX4I2GLKbdnFZp5c1nJKGI07mB7q5aQsag6isCQGHXmj6RzywKvhp8ICkeoqpO+NbsCVX8VZqSLPghX2KZCrpO+m46vp9mA53BcclM9FBLzXxwMxxWJt0u3hZityOkcTipyWeoZ0mNnDU1XKLZ9j7FvJ68oB4IvlN9q1zasTEDekpHhp+7ndS/3s+UTvxgPzV/h9EnJwrO/KbgKNiRX619iY2Yff5fk0+NF0FxBYQLxH83jddAmJOpl78j+2QxUBDbWmuwJtPqCVIiyIkh4hBLcaZ8fMRFC1M/b6eGLbDTfNu967gWgCDVswyQsmpaZRx5+hOyOHg+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/IIGVo/I46aL3h0NnJg70k5evgO2/fNQmmnj11214gM=;
 b=TFMXVX+6e2XAO+MeBb48hu3uzJ4sFNWH3r6U3KjzqIJ2/2LRxZkVvtZqJlvzsb6AgE0XMS0OewkjcCxAPmIsr3hlt2+hHZIprbmKO03Ns3UKGEe97qTbj1E/V9OIm2wSaSHyIFoYcrm+zTQvPdS6m5aF+3ZOpAC17b48rNyezuyIQMF3g81V+L7ruTUMfjt30puVUTMi+7smPXZbRIOs29pUrFJUSXXAoMexXNkIZnCPpC9IkGdhER/KY9Jv7+MQvRk+XTyDNZr+8H/phDvwQipdSx3zcO6+LmtJ9lxW5fSB7A1nZWnjEFlHSIYxRZmp7yg531Wquzi/xzlHNMOv2Q==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH v4 2/2] ci: enable fuzzing for arm64
Thread-Topic: [RFC PATCH v4 2/2] ci: enable fuzzing for arm64
Thread-Index: AQHb996Fa52N0oLJmk6363S0gI/5Yg==
Date: Fri, 18 Jul 2025 12:21:42 +0000
Message-ID: <20250718122115.2448874-3-volodymyr_babchuk@epam.com>
References: <20250718122115.2448874-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20250718122115.2448874-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.50.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PAWPR03MB10182:EE_
x-ms-office365-filtering-correlation-id: 8190e046-c86d-4a6d-8fab-08ddc5f5a87c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?/Q/aFfdox8cejfciV6+9hIwrT/zyyJRkmC0tQPb+X0PzzYlszFzIsnHp+I?=
 =?iso-8859-1?Q?+SHA73+pZn3qTWIOl4SM1SomTTGFpiPPHJJVsGVSTJjNIb2McfpHhPG8TY?=
 =?iso-8859-1?Q?BrDeW97VdE85fu/VdvD3WZi7k2WVQcHOSXRfDsD4FraBxiWfAeZ2vCQXaT?=
 =?iso-8859-1?Q?7LL+EDkBQdXifGDWQHvL0nhnU3vkAhtM/n6vZpasL3cI/myTkJaEVU33Hd?=
 =?iso-8859-1?Q?MMo5ReBi0l5F9ckRWohqmrrs8uK3OTzSRTNH6viU6kv9qaFjLcN95UG9H0?=
 =?iso-8859-1?Q?zqwcbLhtgIo3COiuZH4tsJVpf1r4+GJGdzcrl7CSrB+q56rOJKZcuuhSi1?=
 =?iso-8859-1?Q?dqIwbumm3P5YdnC8iN3V5hFHtZwcKuwGsTF9pkJSURKM0yb9s+MoHVgC7z?=
 =?iso-8859-1?Q?qtljmBrhP0J9oiSd1YpGtx7YwSbBmvO4YnHRmufuqXLYptx1qD+VnC2Hm3?=
 =?iso-8859-1?Q?CmzufDAPHrIrSmJqLHEi4BvbKIP0sI08s7Q+WFH1HMrr+VT9VBrGcZulAi?=
 =?iso-8859-1?Q?3ir+OiavnT8B7Kmh7m3hsUDGV51NXmJ6PHxJlTHf7sXz3qG8ARn9dYWk+k?=
 =?iso-8859-1?Q?uWoxtSBceypnnbnuA8If44jRhKIU9viElV0ChQpoNDjpjpN1vNmKOjTCGi?=
 =?iso-8859-1?Q?lv0TYuhAF07SUil9s9IZHf6W+N66Uw3n7q0ZsRJWyK7CiHcWwPLWlZ/2Z2?=
 =?iso-8859-1?Q?QBVejUEcsdg8mwTOJxYVdcIrvu+v0l62Rfiny4pm8yvyplpsHDWv80kvDq?=
 =?iso-8859-1?Q?Gw9iS3IqIhqhzEZz7qaCb0y46uI5a4Iv4A1B82bfTREMHM4pKJG9/BEMeC?=
 =?iso-8859-1?Q?W/0aEjppXNERmN+tUsRnDtmYUt4TpPy737sVjzGPCQ06BeJAvNpmFAQoQT?=
 =?iso-8859-1?Q?8sKMl/n9rX1Ia/VVzVKxuj7OQMSEbY1/CAmRtKwLvEnRMkHmc9dPm/a1ul?=
 =?iso-8859-1?Q?KmGjGZh/fnfbSTYs/MeO9xNocpzbxuwyPLeMCzt8mfDm6zl+jqVQLB20OB?=
 =?iso-8859-1?Q?69xE6ZWSCUYRiVfq4WO6RTS4y86nEnEmnugX6YswDcLfIrklFRwgzSWFuU?=
 =?iso-8859-1?Q?Gjp8RbYCohnNDpS29sKSGlD3mwWd/OgghoSyhcPVd5Qhp1e1wtx6xG0I/U?=
 =?iso-8859-1?Q?wiqK/kTNKSyc89CIjVvYgaGhhJHRTP/6h+Q0RvOPAh5pG+XLhoxIiQyFBO?=
 =?iso-8859-1?Q?I4eQQc59GtD8HCaVoHTG3SKMTx/PKPqOpvv5Zz7IJtvS5hC5ATrpp5S7b9?=
 =?iso-8859-1?Q?aYtrBEUvjmEY006xd7Pt6h7aC/gBCfADhHO8G6GwB+jbYxYZkzdGEY44em?=
 =?iso-8859-1?Q?Wnel0U81EhG6Dd2/lbYbicCY0F6LK0i2aLQrtRgdR0EjNYM6z8zbhzzciu?=
 =?iso-8859-1?Q?j8grckDb/OxUbQVBdBh49dJaf6A2ARXHG7+RCk0jObUg6e7LvRmt9xuDcm?=
 =?iso-8859-1?Q?aqBe0soAvNC4kfHd3qnB0pTgaE4QG5byFTBnGYSbTFHbUiqWEkGWbaAOX6?=
 =?iso-8859-1?Q?Q/6rE0gDcN9XwPwYCAHCNI2vB+XcOn6Sfgnjwz3xN0yQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?KuJOzDaex+CAKqNFxxZlKR/NLBElEn59L96vVnesVDHSgkK/JJA/PLHPPY?=
 =?iso-8859-1?Q?neLiE8Nh1Q+RZQVKrnxz3Ew3X5JMeZS+pcgCu23aoMLBdWTWwrC//41kCX?=
 =?iso-8859-1?Q?+eEEiNsjXvtEBXg6egP/LW/7Rg3KQZ1L4H6mKfDR9lX9e7EeVy5LaFK3hI?=
 =?iso-8859-1?Q?CF7FNUjbFBaZjb5P4UeCIrwVfS5bvtaHLIGZEkmpKOxI7/Bb8D2yfmGD+E?=
 =?iso-8859-1?Q?qoIsJINTbDvzNUh239fqRqzibOeSl6VrJNwylBdxlBnNZDN5drvoX6Xqld?=
 =?iso-8859-1?Q?v30AJCMg+ahHjz05Kvvu4NjLFuN3Zi2XCJsiot1Y1We4U0sQ7eZHmxioDM?=
 =?iso-8859-1?Q?/4RpGKSxGx4OFoVhaVFyTpQWgRRq+QdwXPa22U6/270ZJG5I+aqtEu8VKF?=
 =?iso-8859-1?Q?Njyxg0R8r8Pt8V/hMBLV25UnYx4vtRfhD3+FMcQnyb0y0mW4xJYm6F5s6U?=
 =?iso-8859-1?Q?Ss/Ji3KSzk7XvP9lTYzPvmbXZ3COp/QgQ1AznO2uQKCspfW38DhshwkKsV?=
 =?iso-8859-1?Q?2i0k83UL8cEZozFMb5s8zPej6mbBEV0xS7dSN20P1Y327a7fmMdSE/k0GJ?=
 =?iso-8859-1?Q?6IfxmdvMaMgTzA/89lz6vkDuTquEtg9QgIE1ifpeQPk22Li4zlQtIkVtuX?=
 =?iso-8859-1?Q?JGORxR3cQCR7CBTwF0KqopbCmE0ub60TGO11Z0crbZyYKMYE0K/lAA1OBz?=
 =?iso-8859-1?Q?48TQWa3pEt41XUpo/JA0XvkByDrKpRnD/SuKR/DLXvw9uhoR1ifn+lDoS4?=
 =?iso-8859-1?Q?GmQ0DCwnImID7MAA+NlMNx9fXuL/Bn1MQ1IIYn5mK1PNbg4b2YBt8f7kiV?=
 =?iso-8859-1?Q?fV/ozyplrMpHI+oQVvhAl/BNr2Lzxhg6sYZVpP5v9CDq+1mYp5asnjlhP1?=
 =?iso-8859-1?Q?69ydfhIsKKslZllQDkLs+nCapAhrNuvh88gZRU7AFgP5hQaaqdi/+jPKpb?=
 =?iso-8859-1?Q?PSJg8UUirDjM51T9+71K9BH6RBZUrj/3HnBedjM6mNnNGN4cmsgj7xwWEp?=
 =?iso-8859-1?Q?6Tv9VaMYdicBc9ZfLkLHleixDxpMZNk3qc+NM7vZEC2NktBPqxj3Xhte0L?=
 =?iso-8859-1?Q?9EEcwsDjkBWZB3jRcvZm1JJjPug5YGfjvh5cHPouJeCNzje6rGIqpwZI0q?=
 =?iso-8859-1?Q?NKfc48qAU6BcnIDP/NwKcbxREDdFIkN004vIiowp6XIv6hSDIzYYhLtlUh?=
 =?iso-8859-1?Q?GvYuJ2SmKh8+iEpcRtAx11RCcwmKngHh3m35VOp0Wt6zvCWIjF/qyFCroO?=
 =?iso-8859-1?Q?WMvkCA+aHQis9bNCCsCdiCaP4UsRR5OWCOL6CAvgmlCpUugYFv61i5h+Hb?=
 =?iso-8859-1?Q?i+DT66Bn1rGIJID0RKW2xqH7pmtgvpMtVM9/0Zfd0m4nDTIDwQTpll2wit?=
 =?iso-8859-1?Q?F57CRZtknW8LXYWTeaB0SB1PdL2PoUl9WK5ZDlhmF7ygOe9kzA6ggwYykQ?=
 =?iso-8859-1?Q?3by2aMWLFGuQHgvs2mEOefgf2PS1H8rFg/Cc44X7N4vSbntIO0EmLCvTme?=
 =?iso-8859-1?Q?O7OdezKhMBch4uS9WAab3Yy7Mv4RYbCMS8U55Bs4mr1O+L9ctLm8VnUHEf?=
 =?iso-8859-1?Q?EHr3G/uo4c/xwtvshAFsuaXdmjRNTvSjT9PGNvxBrerpOxb/4gCvzctmOm?=
 =?iso-8859-1?Q?QyliRFF/i/7dqR/q2RIIZvuM1tCLU9eCYSuewfnfA/c76D+scvTT6gyg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8190e046-c86d-4a6d-8fab-08ddc5f5a87c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2025 12:21:42.8943
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J/y75mrAFG0KZ2NHLuPKBc/adiNE/L8YV0Y3nThh1TThrdXWimmFYGoFbbwhHQ/H5xjev12XunppY8mzeodI5ZhrWCfnkzbkkY+ELxLAzEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB10182

Add new alpine-based build that enables LibAFL-based fuzzer.

Use this new build to run two fuzzing sessions: hypercall fuzzing and
gicv2 fuzzing. Currently, this is all the fuzzing modes supported by
xen fuzzer. Every fuzzing session will run approximately 10 minutes.

Fuzzing session will provide fuzzer log and any crash input data as
artifacts. This crash data can be used later to replay the input to
reproduce the crash.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---

This patch is demonstration on how xen fuzzer can be integrated in
CI. With this setup, it can serve as smoke test, because 10 minute
fuzzing session is not enough. While there is no strict rule on now
long fuzzing session should run, most widely accepted time is 24
hours. This will require additional rules (weekly tests?) and separate
runners (probably).

Right now this patch uses docker container build by me that is hosted
on docker hub. Of course, in the final version, this container should
hosted together with other Xen CI containers.

Also, that container is built based on xen-fuzzer-rs project that is
also hosted on Xen-Troops GitHub repo, along with custom XTF
fork. These components also should be moved to gitlab/xen.

Changes in v4:

 - Minor change to crash artifacts handling
 - Skip UBSAN options for alpine-3.18-gcc-fuzzing-arm64 build
---
 automation/gitlab-ci/build.yaml |  9 +++++++++
 automation/gitlab-ci/test.yaml  | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.y=
aml
index ab5211f77e..ee79e65eb9 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -414,6 +414,15 @@ alpine-3.18-gcc-debug-arm64:
       CONFIG_UBSAN=3Dy
       CONFIG_UBSAN_FATAL=3Dy
=20
+alpine-3.18-gcc-fuzzing-arm64:
+  extends: .gcc-arm64-build-debug
+  variables:
+    CONTAINER: alpine:3.18-arm64v8
+    EXTRA_XEN_CONFIG: |
+      CONFIG_FUZZING=3Dy
+      CONFIG_FUZZER_LIBAFL_QEMU=3Dy
+      CONFIG_FUZZER_PASS_BLOCKING=3Dy
+
 alpine-3.18-gcc-arm64-randconfig:
   extends: .gcc-arm64-build
   variables:
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yam=
l
index 842cecf713..2b0d418d03 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -197,6 +197,29 @@
   tags:
     - qubes-hw11
=20
+.fuzzer-arm:
+  stage: test
+  image: xentroops/xen-fuzzer:v1
+  variables:
+    HARNESS: hypercall
+    FUZZING_TIME: 600
+  rules:
+  - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =3D~ $SELECTED_JOBS_ONLY
+  - if: $SELECTED_JOBS_ONLY
+    when: never
+  - when: on_success
+  script:
+    - cd /root/
+    - ./xen_fuzzer -t ${FUZZING_TIME} run ${CI_PROJECT_DIR}/binaries/xen t=
est-mmu64le-arm-${HARNESS}-fuzzer 2>&1 | tee ${CI_PROJECT_DIR}/fuzzer-${HAR=
NESS}.log
+  after_script:
+    - mv /root/crashes ${CI_PROJECT_DIR}
+  artifacts:
+    paths:
+      - fuzzer-${HARNESS}.log
+      - crashes/
+  needs:
+    - alpine-3.18-gcc-fuzzing-arm64
+
 # Test jobs
 build-each-commit-gcc:
   extends: .test-jobs-common
@@ -704,3 +727,13 @@ qemu-smoke-ppc64le-powernv9-gcc:
     - ./automation/scripts/qemu-smoke-ppc64le.sh powernv9 2>&1 | tee ${LOG=
FILE}
   needs:
     - debian-12-ppc64le-gcc-debug
+
+arm-hypercall-fuzzer:
+  extends: .fuzzer-arm
+  variables:
+    HARNESS: hypercall
+
+arm-vgic-fuzzer:
+  extends: .fuzzer-arm
+  variables:
+    HARNESS: vgic
--=20
2.50.0

