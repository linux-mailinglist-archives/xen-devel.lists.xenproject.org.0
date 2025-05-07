Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 401FBAADBED
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 11:54:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978480.1365268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCbTd-0001yX-Iq; Wed, 07 May 2025 09:54:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978480.1365268; Wed, 07 May 2025 09:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCbTd-0001sE-G7; Wed, 07 May 2025 09:54:09 +0000
Received: by outflank-mailman (input) for mailman id 978480;
 Wed, 07 May 2025 09:54:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=owRi=XX=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1uCbTc-0001ot-Kc
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 09:54:08 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37d7500b-2b29-11f0-9eb4-5ba50f476ded;
 Wed, 07 May 2025 11:54:08 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DB9PR03MB9758.eurprd03.prod.outlook.com
 (2603:10a6:10:453::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Wed, 7 May
 2025 09:54:04 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%6]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 09:54:04 +0000
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
X-Inumbo-ID: 37d7500b-2b29-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k+TfH2WvxBU9zIjWbjHpwrysohK17VGiTwN4w8/vNFSqLe8g4cIBHVJqmYTP72rIZMhbJzFfAL9QlZdBMDn5O0eYCLBwOIxHHuHGYuQ9EDBIsgwuk3fUDwFvtyUtU/dRBwJ2PH8pG8fgiZcmg2om9nMI7txfVz4VMn3joUMvjkHE0FvA3xAJ0UmA315Z6OgPOhwELdPk+B39lTdWG04nqBNPjcpdWR4U+BAinIjRtmPmRcp0itbm7E0iG+fFYwyWGctDOADuJSkU0HI8hlud6ZE7+ydH1UFUx/1Mfo3UyCXKhkVSThPvU15WVuRz3cAdLYjU0/YaDo7AcROxfTD5Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrgxLnq+1M27/FdxfIrcQlXl+0orAj7TnE3PgbZ7Cq4=;
 b=N1qY03Z1XNIBfox+fcWYAUBd2cm+U1EBkRURnkiN/hf03n+X8O5HloaFj4kkKWyY9KlEx64vn4Ao7IqhfGrGpHE6X1r5VkER4IQeJAg+4yFdc6zBJuew6T+uGistWxuVvEUJizOSCWmA9Y9J6cyaFYVakKPebIvWbeyDC34GtSXGrK/9zzFEcsBcAQUiFOTm8U9Ff+Ms9yz3X7xcH1sdRP7KO1ZVgSJw793ryJBnQtlUAyxXieAmoXvS7OomHTVuZ7N+FJNl9C8glXmKce+L8N9MbbfYSMZa8HtZa6iocQv3esHoWch2MEqttWSg2MskWCkHK7DoTreIjd4Ua3gYWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrgxLnq+1M27/FdxfIrcQlXl+0orAj7TnE3PgbZ7Cq4=;
 b=SF8kKXUjDCeAeXD77DQuthn4q+g4uLiQAoBt3U5H0PO3vFj8aB5k+8zFsmpx40BQZyYh4RGCyrkXZSfQF5kxiCnJxmDsckzrNnDoDESL9ECvhJfQFvELCvODkQGo0yi6C1WWUc3zcJjEAjx3tS94XvBI9ibYjZyGbyFbZ0PAjxxvh9Wy+7ajZ7DIlRnTMesP6wFTdcCz59FwT3C7ZR9QKhAbTqghf7lk00mVQl593pZOCQapLF1TvoUUPwhpRkrPa2fXhmFMG6ZdI02aLVbXQNLxcYcPXXNIYRrOSGj/7oratFzS/T0JHjhHeMw9uWIgaSPEO3ujPNosrO+pp/TMTg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC PATCH v3 2/2] ci: enable fuzzing for arm64
Thread-Topic: [RFC PATCH v3 2/2] ci: enable fuzzing for arm64
Thread-Index: AQHbvzX0DP4RwWsFtkCwrnnT9nV/Vg==
Date: Wed, 7 May 2025 09:53:59 +0000
Message-ID: <20250507095338.735228-3-volodymyr_babchuk@epam.com>
References: <20250507095338.735228-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20250507095338.735228-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.48.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DB9PR03MB9758:EE_
x-ms-office365-filtering-correlation-id: e660225e-bb95-4451-2ede-08dd8d4d19d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?tOP918BPqxIgCrNFZb34sfST1Bc84Xoq9p0gAuK9oCPzAjZ8eq1IBScJ9A?=
 =?iso-8859-1?Q?YQkQCnqKNquMrcUBHX+RrVhzIps4j6sfLkMOx8/FU+/yGbj36hxnutGSd+?=
 =?iso-8859-1?Q?Jq3hGgb/tMVHzMbhTjOVyvzmVfzjaxv3uSMmsPCFrWgwNy8qEEAaSunDSk?=
 =?iso-8859-1?Q?O1dga3KcKV1ORIiZXk47UfZa9ll6McvTxCWAIui52wCTuLJ/Co6ygrYDmZ?=
 =?iso-8859-1?Q?Dd5mEXSiAeSgtiIQaRZEkJVSD6slS7UTrvhttuMv1HkWtZKZ8hUg+yuGpm?=
 =?iso-8859-1?Q?D6oDzJnCxM6mVEqCJH4UwbRVQ5GgDHiXp+X5V7yM6qBeLh0/xBMjr6v8t9?=
 =?iso-8859-1?Q?esus7YdVlOqbBQYDMM5lcJ0+QtxzWQQxoyUasxibgJ0hOEC3GjoqAPJRDs?=
 =?iso-8859-1?Q?Hh5BLcbXD8XHknbDnwDzy/gKep20J9LfikfYS9fBLcEv+pmFXX4fnhhkVp?=
 =?iso-8859-1?Q?jTSQPLAXGi8pMLFcuEbdc9+AUZdnZMrcRpQPK7Ts4T57UraR0Ksflsz2XS?=
 =?iso-8859-1?Q?vJWWcNA9zajUXvv+UCSZ0iiT/56gu6kFZeKTCqK/cwyvM9aMl9C7jaul94?=
 =?iso-8859-1?Q?E9VPE/I3Iphjd5gI12OIFbQYD+BYN4Xu2fBNYau6LYU3WQPSv1lZNylVl0?=
 =?iso-8859-1?Q?FoorBuhfh4/8aZ5K/wj5bsRlWB57s8kaOGF+k/T6PCZtuO+6NKltRZUKn6?=
 =?iso-8859-1?Q?eui7rtAV76RbY86vLQ1Lgfd1gRXr3xhMRMlVfcX3K7J7XH8+fa558h4pOS?=
 =?iso-8859-1?Q?m1y8+r7kTJthUCWaMbqyw50EfpMPMsyz96BolHuMEoDiM22WujVbasn2qj?=
 =?iso-8859-1?Q?UjALs+EH58qT3vJVftmAY+Z+I+ZRShUnZyuF+zniPqUVt78bLIP7MBAEoG?=
 =?iso-8859-1?Q?fRzcfgWfQqdfV8JHiviwT73Mmxde7H9FMU3c07CT+F471mD1/CwJfdQJ6f?=
 =?iso-8859-1?Q?SWTUeC8rcb5Ef6cP4TYgPlNYQVAYk4VlOb/QN2y0oRNdp4Ck5EcV3vxtMo?=
 =?iso-8859-1?Q?REyz689KfFPhudhDCEcGZ+cXwLqJzm8DbL4wjJAKl2ttrRrghR9fF3CjXB?=
 =?iso-8859-1?Q?uNwVz+gdTIi/Xr3ZWEfBkI2/m3vuuNjwvZq+DPCUfPfjNutDGv6wz3WljK?=
 =?iso-8859-1?Q?GaRrhqefy1CH451ogFMc5N8UW+ERIFsJmZyc7HH7W4SmW4OFPSfMSMSRpF?=
 =?iso-8859-1?Q?zmYdgdMMJVzB7uIu+LKUzyMBFEZzEomBk9z08N/uva+3Rtr7s6WjvliaiI?=
 =?iso-8859-1?Q?RmRX8HpD6spD461tKJScse16M+nNlVo42OpsDsMGyYdJu8Ck4mqLszU1WV?=
 =?iso-8859-1?Q?Ne7JpDDGDvTL+vateCJ6gYesIxFacK7KwkpY2jMz7pDiNVcmDs6+/6JFjG?=
 =?iso-8859-1?Q?Ds76DOfFYGMNRl+JDZxHloBuI3xqYV/OQckovP/cgAXyckMnakQ48HvWVn?=
 =?iso-8859-1?Q?JAl8uv77j4Vz/4kohwnHHwLwHs2FjdM3bFvJT/XIBhDg07J/SA2qoM59qb?=
 =?iso-8859-1?Q?QlU5buDezh8+We2fTTxee7fixBTfmCsB8kg+dcDY3jXw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?fRlIpoNV7jYmLxLAuVPS3H9yQU/oonA4a1xsc9E8Ne/k6ZBCHDr1VL5bjf?=
 =?iso-8859-1?Q?hx4jH8uNJrEK9WAWo4UNi5Y39cmkTunAIEUW0y23MgMjOCbHAMFOE23Rjt?=
 =?iso-8859-1?Q?B/WZsPrBav9a5duJ+hmrWNzXOTGDn/krsmVkkV+n738RjW6nNjDBf+Ir6B?=
 =?iso-8859-1?Q?yU2iX/T3NhEWgdqxStoK1g5DbiiLgKEVMnnhkZxaBgaG85lLhdhfabXm6r?=
 =?iso-8859-1?Q?KD3bLd3YyB8UTPn2lAEw90vh19jJ2VO6HXoQnzx9gYvRi1N1/ctW3fKjuc?=
 =?iso-8859-1?Q?VjJLlrFdoSS89v+4ijyFIuoFECdH0HaCeDqj+5sbzefoA5RYo7OPcxMrwV?=
 =?iso-8859-1?Q?UE9jbH6wSJX1OjnC5eryi3N44qtXpuckbMRRJFPoTfMcpKQur1tKc55eE1?=
 =?iso-8859-1?Q?ObA0rTpCAUPbTOg7J/Ecc7HyACcHvk3wvjLP0gkWWyvcmOHsql3dpwR4AO?=
 =?iso-8859-1?Q?XD1vxNqwgbbMLFlS0rVw5CwQyb7PAFBCLYJMRcb8LsPGFm7GqJu3gr8yI6?=
 =?iso-8859-1?Q?zDq/CGgtp2u/jte7QT0RtDVrNfmoQ5XENcajhyCrZLFQu9UC0Cy+pgZcXI?=
 =?iso-8859-1?Q?rFADFEMSOgtxFkwR72HdKL/SX6ctBSFaNoiG/Qm1ZFP9qlzbdL93b0gEux?=
 =?iso-8859-1?Q?Rkk1rjjj/uk/HoR+1d+hpC+xanLO9DLg1P5qRcXJghq949nStya86q7Urq?=
 =?iso-8859-1?Q?jQp4zzxC72thZ8ub47gC50stkLvNlJsYv+sErkkPhx6ln8hw9eO3jjEMOx?=
 =?iso-8859-1?Q?Z8Qt9tUafBGdEXMR6l0/fnvfdptdHWTYVEdw+f20eKC1qOvB9PY3QS1022?=
 =?iso-8859-1?Q?HaKHTs9WV75Ux9BSzwC4aYHleEOoEsG+9uNQyxs/gr1RlTX6nXS1Jzusun?=
 =?iso-8859-1?Q?N3feOHyuxlUzV4ppEovOej7HpqdsldBk6fNTtAXwiqOI/bu7a8FRxlL4aC?=
 =?iso-8859-1?Q?3H6n+fg/MugU9h+soPiuTL/7z1hsd7mnhdvwaUuZIGxBcga1VJ+cayKAq7?=
 =?iso-8859-1?Q?nU+n4Y3tbXbiyjimaxTCmzrzjeNumpGV5WPjxYIylfX4pE6rKfAFsZYQgT?=
 =?iso-8859-1?Q?b7YtpvOIifTjRtKqdMmfw9lwYT2xwv9daRAlry4wwgGOjWtjW2toJceAFP?=
 =?iso-8859-1?Q?uimvbVX1pn6ul0qH5ay8LXDrWyB82q/MgRdjvWwkot7ujyxdbZxPpwXKmE?=
 =?iso-8859-1?Q?FGeviE5mt1d3FdldVA8rb2iVauHWUcOOMlW2UT3wvV19ERq74R9k+O13Bv?=
 =?iso-8859-1?Q?+Gf4cPV0cCfJDmRiHpKBCkGao22yvki8m7OduHfMtps6I3idRXM0beAjbP?=
 =?iso-8859-1?Q?MgdZ1XbDcsKMDAEH6JtwD0ynFFiRUAb8bRIEo25fM2Wc5hCOfTPesQwO2+?=
 =?iso-8859-1?Q?66nEZC1FMqVTcyDWqP6D9b0/R13Bf4Nc+wytNmRGz7AN0OBNcgLIvq5HCx?=
 =?iso-8859-1?Q?XcD0NDLYU05hRYnIJVsjJBLStFexuZwWAdEJjF9mkbgMwNAz9OviJ7oWlM?=
 =?iso-8859-1?Q?CyGwuexKHA154DsEAg/0MnISVLjRB3gyEoe50mBd2MHPlMIt6F3djhEDNZ?=
 =?iso-8859-1?Q?RqHSBVgpO+2ytwdWBSLXrPDretCd0aFCdeEyhbN3AC/ht5rOrVZM50wJC6?=
 =?iso-8859-1?Q?tE0qeCQI997VeXySwud35UM8k8jTUOdXYr8ezGkuCkpmC+ZpSirTe9oA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e660225e-bb95-4451-2ede-08dd8d4d19d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 09:53:59.5086
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q2HOYe3d3aylT+9UPv2kseogI44xiLxjbHG+jaH5mYVWK54KubggD1H+WupUVF/WvDWcqoFYKLNKAsBCinexa231hARm1UlJwHLa3qxdGOQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB9758

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
---
 automation/gitlab-ci/build.yaml | 11 +++++++++++
 automation/gitlab-ci/test.yaml  | 34 +++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.y=
aml
index ab5211f77e..6fc11fffe6 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -407,12 +407,23 @@ alpine-3.18-gcc-arm64:
     CONTAINER: alpine:3.18-arm64v8
=20
 alpine-3.18-gcc-debug-arm64:
+  extends: .gcc-arm64-build-debug
+  variables:
+    CONTAINER: alpine:3.18-arm64v8
+    EXTRA_XEN_CONFIG: |
+      CONFIG_UBSAN=3Dy
+      CONFIG_UBSAN_FATAL=3D
+
+alpine-3.18-gcc-fuzzing-arm64:
   extends: .gcc-arm64-build-debug
   variables:
     CONTAINER: alpine:3.18-arm64v8
     EXTRA_XEN_CONFIG: |
       CONFIG_UBSAN=3Dy
       CONFIG_UBSAN_FATAL=3Dy
+      CONFIG_FUZZING=3Dy
+      CONFIG_FUZZER_LIBAFL_QEMU=3Dy
+      CONFIG_FUZZER_PASS_BLOCKING=3Dy
=20
 alpine-3.18-gcc-arm64-randconfig:
   extends: .gcc-arm64-build
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yam=
l
index a603d4039a..bb8670026f 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -197,6 +197,30 @@
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
+    - cd ${CI_PROJECT_DIR}
+    - mv /root/crashes .
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
@@ -704,3 +728,13 @@ qemu-smoke-ppc64le-powernv9-gcc:
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
2.48.1

