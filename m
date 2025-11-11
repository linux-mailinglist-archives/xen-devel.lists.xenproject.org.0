Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5BAC4FACA
	for <lists+xen-devel@lfdr.de>; Tue, 11 Nov 2025 21:10:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159345.1487727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIugq-0007ks-Hu; Tue, 11 Nov 2025 20:10:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159345.1487727; Tue, 11 Nov 2025 20:10:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIugq-0007dZ-CL; Tue, 11 Nov 2025 20:10:08 +0000
Received: by outflank-mailman (input) for mailman id 1159345;
 Tue, 11 Nov 2025 20:10:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiuT=5T=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vIugo-0006ga-Kj
 for xen-devel@lists.xenproject.org; Tue, 11 Nov 2025 20:10:06 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6936e856-bf3a-11f0-9d18-b5c5bf9af7f9;
 Tue, 11 Nov 2025 21:10:04 +0100 (CET)
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 (2603:10a6:10:435::21) by AM9PR03MB7758.eurprd03.prod.outlook.com
 (2603:10a6:20b:3dc::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 20:10:02 +0000
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584]) by DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584%6]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 20:10:02 +0000
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
X-Inumbo-ID: 6936e856-bf3a-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y1IQQZ1r+FmEzWH/eF1Ztj7bzpxozSBpPfDp3wnbup0FWHu26sKFrgwgbNh445EWXjYr854spdt8KoBZ+e2eTK0oQSMvw/aRXgEzcXXOanakulSuLgaf2J/lB+EpCN5yWGQ49RPViCWb1ezBmwwSjH2M5ITqWgTq1lD2ISk9W6oiA1juGxAgUpeSzoSZCGDpYl76ZksROzM2PcqzFVTw7tBVQv8IvYtrab0LCUH9oyzvU0Trx84lq7RIMnFi2x1cSZ+V1yYJPKQba/37hlErfGnRmblif2lkC+hNzdG8stYM0wR0wANTkyeXvYQ1nO6gmk4Tl+42HL/iCzTVCS9kqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3fc8kqULrDlEecW0AMKDiqA+VYZUna5h4+g6PU7mwyI=;
 b=d8EZAOrnw0gdKd/Q9kQCGyLZW6oOKG9lq6q0gkYa2kVxjHCYfVea9fZ+zKEQ+JapO+6qmiP7hus4Uw5EHXpExz1TFgV8AVmQ+qpCkURvifsWFrrdbFKXBBm5sv9O+qamzbqVXLv0QmkmC1xjUjHmI8sSkQ79Ns0LOYkzsDBh1oAS/QMZifbBKN55Ryz0Z3PxmEZ3Cd9StdmMTxqIT+dM60PwfoVCb35KCQFDcX6/2GqwMAM9hP6EOYJ54W/SAevbe934Wlo8wMJfGp89pfkYYoekhDvcIOQHT+d3CFk4b+RTZ+/vLrn0iVZe6FvsrjrKNlteIBydbdGWWcCFDlnf6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3fc8kqULrDlEecW0AMKDiqA+VYZUna5h4+g6PU7mwyI=;
 b=kbZjEuY77xQK4bpxt/23sGo5PuTz/s5WRtJuaOF767/RQzzTSfly0HW071CiC7buMDd2STBTkCwPVrF+FyCm/xcw7aJPUWMR5wqsKnrq7+uuJIX6wbm0qE3BG5AITOax0AofqCi1zRTbYqmG9FP65HxDusKYpD7AeG6lDKmllsAm12n4IDVhpgqgtsXm4w5xg2V/psEdgQEp5XeXt2ZNvypbQlZDpqA8muAM+erlCqSz+hRFMKvEQDyx6rzBPCr+3TRSUdf+CqokggszupVqrPeDdAkeXU17g+ZNyMr5t8YkNVgmemNtxb9+Sw1jFNbU4Smn7TmfOOlkQuzFCFEELA==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Tim Deegan
	<tim@xen.org>, Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie
	<teddy.astie@vates.tech>
Subject: [RESEND PATCH v2 3/3] x86/hvm: vmx: refactor cache disable mode data
Thread-Topic: [RESEND PATCH v2 3/3] x86/hvm: vmx: refactor cache disable mode
 data
Thread-Index: AQHcU0cpl9PlXpLMdEqFkDnu6fI4GA==
Date: Tue, 11 Nov 2025 20:10:01 +0000
Message-ID: <20251111200958.3576341-4-grygorii_strashko@epam.com>
References: <20251111200958.3576341-1-grygorii_strashko@epam.com>
In-Reply-To: <20251111200958.3576341-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR0302MB8919:EE_|AM9PR03MB7758:EE_
x-ms-office365-filtering-correlation-id: e7d1592c-4371-460a-8e6a-08de215e4c5e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?/Sy/b1ofl7T4z1gQbENVqsAe7j/ZEWpojfGFqwiFbegmP04LDy8WI0uE/w?=
 =?iso-8859-1?Q?7HjYYm26eVd9ybrPHT+vpFyI1ZCjrodo7DH5nfSOLKaaJob/LgCj1FAtWA?=
 =?iso-8859-1?Q?BopxqCDD8/uTsGc/8qQtvF31cF7fuSI+fBE4cxuOgUTaqT30CXUIDkCRGv?=
 =?iso-8859-1?Q?OVV1+RbZTQYECEn4eI23GgXLO5BTESgmLXSZ/RATX5Ir37eAaPs0gk1BIv?=
 =?iso-8859-1?Q?1GofNqggKwtDVPzcrcLBqmsES79XdwZ3QopAuJsjr/l1MtVCCOewSAUB/n?=
 =?iso-8859-1?Q?f9q8vKs9aKC0v8rQgHU/rD+rxO82KZefU/pb/ouEp9vbcvbVpE7Ahc/wA4?=
 =?iso-8859-1?Q?iD+Nnzp/nkyWHG+892AcKq99NZC51heWh4CYoDTVVzDIqZnXxiBuhMyIpK?=
 =?iso-8859-1?Q?N+1t1vQxsp5wquTesiXH97L3f+MpvRGj4LTqCW6ST6kTKneP0aZYUiQZ1o?=
 =?iso-8859-1?Q?K70l0DJW6U67Cem1DI+4Tp1IThFP1brj6zhGrqVOH1wHxHQ6cApGimCwd4?=
 =?iso-8859-1?Q?G6P/xv4OEWwEj/V/RgeWunJ0ljJ4SBZyErXX55BYYLIgwjHltllUzk7YPp?=
 =?iso-8859-1?Q?IGqrQBCFWUHEy9BakMGF66pZZJzXTE+kYP/uZw7rNjAQOgb5821DNWHHoX?=
 =?iso-8859-1?Q?ga+ubkinVyRro+XLieVEBAUzF0XLJx3CjP1BC/+LMRMa7Z1Mw4p5tZdSsw?=
 =?iso-8859-1?Q?cYGk3PuEYoDT0+PkW2bAyroX9+iogd0cxdc4aqSEztD7CbIt+9CHsprg6M?=
 =?iso-8859-1?Q?pyflJZj7D4LyHcmCKooxj1uA4A4VPDNF8ME+LRLk8ClPereabzYgPxxvSL?=
 =?iso-8859-1?Q?KREGC0BUSq1iZZ2cL808aHdlChRVX3YVtMngRfnu6+ziBK5WySEFCGOY5Q?=
 =?iso-8859-1?Q?p4Lv2Soajd9/CLasj+3ycVbj0CRGs4WYwiKVknwe0IPCC4bwMHDw9vqRGw?=
 =?iso-8859-1?Q?UuUAgznMQ1rorqjjYppvKGbVJ3NwuCczZyG/XwEtQ/76wfgVjjDxgetO4O?=
 =?iso-8859-1?Q?XxspJxgbn7crfw2sfPf20lkojpUNsayyGNYOb5BtMLicvw8dnieitM6gBh?=
 =?iso-8859-1?Q?obbzuYSnQFmy6N542NhHSQmDDzduxmlEOFvtpmVDdVkQh1ddXoUkVSS3IH?=
 =?iso-8859-1?Q?YwHA+KDOxzKBj/5oO8lQTQEBxiGdxgSocqSlzDhLmwnkbQlMVnQpikFtTa?=
 =?iso-8859-1?Q?0QduhQFAaYKjcYytDPd+RZXkTrgdN6CsdP46o6OBT1Eu7AxtEG2Z+w8Yxm?=
 =?iso-8859-1?Q?7nQdmSJKnApuQ7O2BFRxzUrYvQhXnacIkWTRB8YfKySVC9u9DAMTQFEu+S?=
 =?iso-8859-1?Q?pEHbdG8d58rPkLkORCcWLa5lH0vn97kqiYYvMACKD/wnJp+J16N0pVYvUR?=
 =?iso-8859-1?Q?moLvo74dABJ+pV5acXeLSnevYMK2WcXCjWM9DdASIZnLl1nZeI5rISPVVB?=
 =?iso-8859-1?Q?DZu2kD/PyErC5ufJciAx4E34es/F5hHdbbHMBcY2LA1HsVw0gXEFzMltHA?=
 =?iso-8859-1?Q?TBOuju5MG5wyLjSPESEVbv1eSm3CHeNoVF1MO4h9HSiG/UBlz11WvSCOQq?=
 =?iso-8859-1?Q?1FIdLzBAN2mc52bmc5+5isG6yQkU?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB8919.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?I/GXpMxHUqj2ABUfDs0bmVe+LpOYXNd8dYyCkxFnPxiX6QCvZSOzDXwQ/A?=
 =?iso-8859-1?Q?o29gpVgXvP/FvC44Qx2VndiT/ooLEEgKibEsbuCErsDMCAyufl/SeWvwZO?=
 =?iso-8859-1?Q?UksgvGkbTBgqMEJwJc0+YjVE/KEjrsdQN98/GZuBB/cx2pq01+J0B1HZhM?=
 =?iso-8859-1?Q?uyImrlwIskWEtoOfKKClA9AxWsRZqNyoZRNkTrobWQaPy1JYgpGUyHGRNN?=
 =?iso-8859-1?Q?QShx2k6HxXMiVQxFNNBbtjLsovt0T5tIMxmZfIPuzjBsC1i4d9NkHhygWP?=
 =?iso-8859-1?Q?/1xHtLaCU/Wo3ajNypqP2I3DgsPSvOLjCilsa1jrpQOI0/KAKw+6bGooEm?=
 =?iso-8859-1?Q?lUWZp294qsNLZFkwsH2OjoSMsxDDMHoaElTkniTvRYMLGp9cL/V8cQT18U?=
 =?iso-8859-1?Q?9adg5vZdKwBi20gswbwqPJkICtueztAe9nyniGDegETqG7Ymib8s05iNIB?=
 =?iso-8859-1?Q?eDHdzth04EUe85NkBaGsLU0FiNyPIPfQmHHB4uOxlqP6WsMa7dQo/0/qK3?=
 =?iso-8859-1?Q?Jfj37maDcmakcN8bm71TUfMT/nB5zlxOoMnsgoUb9Qi79fEM5Kipn3MfCr?=
 =?iso-8859-1?Q?Rbb4O++WMi5TQ8v+EblxQC828k17wLaa9n8FjXmawzxXonv3vYllZLJxCY?=
 =?iso-8859-1?Q?QNt3hGjDNu62fkDUptJDgTn629N83FLuouvYb/ISXjFl3fFk0YdsUlk0SS?=
 =?iso-8859-1?Q?7eorZmASvziW2Jec5CBE5dUgv570OU3h5Sxn1qFpLaaZ+9HBNIE6QNfF6m?=
 =?iso-8859-1?Q?D8E1AMpzCmmeRXgevp9Dm2Vs5DiQjjAdFRgx0K2y6RQg28hsVgnh5KJaBB?=
 =?iso-8859-1?Q?yw0DUYm0MD2TB/QDljJ/mh+CYzAR+zP3IRXVLD9NghFX1zET7k+7SYnj+j?=
 =?iso-8859-1?Q?pzzp/Y3FI8mYlUUMvJSQ74YEJJHXQf2oXDZWQyI6RZ0kpcdIucxufM4Oqv?=
 =?iso-8859-1?Q?s5J4B1j1Iepa1TfVx3e6Vdds0WzmkRi3ngJj8BtgYGzxYD5J34r+vD2Ow5?=
 =?iso-8859-1?Q?TOhdXsBN87XdxgTyiVsVNfO6JTzkpnQb16PEzROiTqmH52rUE4dmrSG4q1?=
 =?iso-8859-1?Q?StkEiwAPZAcDznBkYhc88i3wehmj48fIEMb4vk/9NcyVr/z8FoYAGlyKem?=
 =?iso-8859-1?Q?B2Pao/odNrkyBSXgYSIAmzCkY3sL0QixaeL+cBlTkY/zWmkk2uWEHa4W/+?=
 =?iso-8859-1?Q?0qXiGgKVK7hahU5+lIJ1XJGapKNzv5dvzy3mYdJc5jeszcj9F80G51P2jp?=
 =?iso-8859-1?Q?GGPTa3hal0uuXV3dFXRGwF636pIEJZ/+Pr48sVuUXffxchLgdjZhRP6FCV?=
 =?iso-8859-1?Q?8jvVaHJkVsLFr9BMqRZtuXRIlh+sKurXxHWoP9togc3ByGqG5ujcVMIbck?=
 =?iso-8859-1?Q?4h46VoYYBbP0b4f+58aUF73zAtGtV2aYSpfoXqZ4wC4Ds7dpYIAPvrQHwc?=
 =?iso-8859-1?Q?DuvT4nmzxF7oZCy7XJ/yPvLMi4gwLtqpDrEQY0QnmQRPn+jiDUybAWhgHS?=
 =?iso-8859-1?Q?na1m+QuhFiq1MjL42Vt+fJ10JAdEiZYnQrqgwPxXdpTUa3VgoOwxoMEN6o?=
 =?iso-8859-1?Q?QwCMYLMAeaQDOkEb9H69Wyrj2h7w9JTJvXKHieWgZVXCnvW6yKTS4GfFFR?=
 =?iso-8859-1?Q?STEnlDUT/mIq24zpUCPHzOCgnvgXNvuM7STX8CbQQ6ud9loAiMsXAzuA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB8919.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7d1592c-4371-460a-8e6a-08de215e4c5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 20:10:01.6485
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ILHPTK8Dbt8OMMIfS9/ttQDw1/PsoHOzILxRo0x18BgMv1PqKxQBWA58w50yF1k5Ifqhkh1qB0J5EmF8B+RYPozlXV2NR3OSc3IWtIX537k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7758

From: Grygorii Strashko <grygorii_strashko@epam.com>

The Cache Disable mode data is used only by VMX code, so move it from
common HVM structures into VMX specific structures:
- move "uc_lock", "is_in_uc_mode" fields from struct hvm_domain to struct
vmx_domain;
- move "cache_mode" field from struct hvm_vcpu to struct vmx_vcpu.

Hence, the "in_uc_mode" field is used directly in mm/shadow/multi.c
_sh_propagate(), introduce the hvm_is_in_uc_mode() macro to avoid direct
access to this field and account for INTEL_VMX configuration.

While here:
- rename "is_in_uc_mode" to "in_uc_mode"
- s/NORMAL_CACHE_MODE/CACHE_MODE_NORMAL
- s/NO_FILL_CACHE_MODE/CACHE_MODE_NO_FILL

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
changes in v2:
- s/is_in_uc_mode/in_uc_mode
- s/*_CACHE_MODE/CACHE_MODE_* and move them after "cache_mode"
- reorder uc_lock,in_uc_mode in struct vmx_domain
- move spin_lock_init()

 xen/arch/x86/hvm/hvm.c                  |  1 -
 xen/arch/x86/hvm/vmx/vmx.c              | 30 +++++++++++++------------
 xen/arch/x86/include/asm/hvm/domain.h   |  6 -----
 xen/arch/x86/include/asm/hvm/hvm.h      |  3 +++
 xen/arch/x86/include/asm/hvm/vcpu.h     |  3 ---
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h | 13 +++++++++++
 xen/arch/x86/include/asm/mtrr.h         |  3 ---
 xen/arch/x86/mm/shadow/multi.c          |  2 +-
 8 files changed, 33 insertions(+), 28 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 9caca93e5f56..c09fb2ba6873 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -608,7 +608,6 @@ int hvm_domain_initialise(struct domain *d,
     }
=20
     spin_lock_init(&d->arch.hvm.irq_lock);
-    spin_lock_init(&d->arch.hvm.uc_lock);
     spin_lock_init(&d->arch.hvm.write_map.lock);
     rwlock_init(&d->arch.hvm.mmcfg_lock);
     INIT_LIST_HEAD(&d->arch.hvm.write_map.list);
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 67861bc8bccf..0d9a4a17c433 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -590,6 +590,8 @@ static int cf_check vmx_domain_initialise(struct domain=
 *d)
      */
     d->arch.hvm.vmx.exec_sp =3D is_hardware_domain(d) || opt_ept_exec_sp;
=20
+    spin_lock_init(&d->arch.hvm.vmx.uc_lock);
+
     if ( (rc =3D vmx_alloc_vlapic_mapping(d)) !=3D 0 )
         return rc;
=20
@@ -1431,7 +1433,7 @@ static void cf_check vmx_set_segment_register(
 static int cf_check vmx_set_guest_pat(struct vcpu *v, u64 gpat)
 {
     if ( !paging_mode_hap(v->domain) ||
-         unlikely(v->arch.hvm.cache_mode =3D=3D NO_FILL_CACHE_MODE) )
+         unlikely(v->arch.hvm.vmx.cache_mode =3D=3D CACHE_MODE_NO_FILL) )
         return 0;
=20
     vmx_vmcs_enter(v);
@@ -1443,7 +1445,7 @@ static int cf_check vmx_set_guest_pat(struct vcpu *v,=
 u64 gpat)
 static int cf_check vmx_get_guest_pat(struct vcpu *v, u64 *gpat)
 {
     if ( !paging_mode_hap(v->domain) ||
-         unlikely(v->arch.hvm.cache_mode =3D=3D NO_FILL_CACHE_MODE) )
+         unlikely(v->arch.hvm.vmx.cache_mode =3D=3D CACHE_MODE_NO_FILL) )
         return 0;
=20
     vmx_vmcs_enter(v);
@@ -1462,7 +1464,7 @@ static bool domain_exit_uc_mode(struct vcpu *v)
     {
         if ( (vs =3D=3D v) || !vs->is_initialised )
             continue;
-        if ( (vs->arch.hvm.cache_mode =3D=3D NO_FILL_CACHE_MODE) ||
+        if ( (vs->arch.hvm.vmx.cache_mode =3D=3D CACHE_MODE_NO_FILL) ||
              mtrr_pat_not_equal(vs, v) )
             return false;
     }
@@ -1472,7 +1474,7 @@ static bool domain_exit_uc_mode(struct vcpu *v)
=20
 static void hvm_set_uc_mode(struct domain *d, bool is_in_uc_mode)
 {
-    d->arch.hvm.is_in_uc_mode =3D is_in_uc_mode;
+    d->arch.hvm.vmx.in_uc_mode =3D is_in_uc_mode;
     shadow_blow_tables_per_domain(d);
 }
=20
@@ -1483,10 +1485,10 @@ static void hvm_shadow_handle_cd(struct vcpu *v, un=
signed long value)
     if ( value & X86_CR0_CD )
     {
         /* Entering no fill cache mode. */
-        spin_lock(&d->arch.hvm.uc_lock);
-        v->arch.hvm.cache_mode =3D NO_FILL_CACHE_MODE;
+        spin_lock(&d->arch.hvm.vmx.uc_lock);
+        v->arch.hvm.vmx.cache_mode =3D CACHE_MODE_NO_FILL;
=20
-        if ( !d->arch.hvm.is_in_uc_mode )
+        if ( !d->arch.hvm.vmx.in_uc_mode )
         {
             domain_pause_nosync(d);
=20
@@ -1496,19 +1498,19 @@ static void hvm_shadow_handle_cd(struct vcpu *v, un=
signed long value)
=20
             domain_unpause(d);
         }
-        spin_unlock(&d->arch.hvm.uc_lock);
+        spin_unlock(&d->arch.hvm.vmx.uc_lock);
     }
     else if ( !(value & X86_CR0_CD) &&
-              (v->arch.hvm.cache_mode =3D=3D NO_FILL_CACHE_MODE) )
+              (v->arch.hvm.vmx.cache_mode =3D=3D CACHE_MODE_NO_FILL) )
     {
         /* Exit from no fill cache mode. */
-        spin_lock(&d->arch.hvm.uc_lock);
-        v->arch.hvm.cache_mode =3D NORMAL_CACHE_MODE;
+        spin_lock(&d->arch.hvm.vmx.uc_lock);
+        v->arch.hvm.vmx.cache_mode =3D CACHE_MODE_NORMAL;
=20
         if ( domain_exit_uc_mode(v) )
             hvm_set_uc_mode(d, false);
=20
-        spin_unlock(&d->arch.hvm.uc_lock);
+        spin_unlock(&d->arch.hvm.vmx.uc_lock);
     }
 }
=20
@@ -1549,11 +1551,11 @@ static void cf_check vmx_handle_cd(struct vcpu *v, =
unsigned long value)
=20
             wbinvd();               /* flush possibly polluted cache */
             hvm_asid_flush_vcpu(v); /* invalidate memory type cached in TL=
B */
-            v->arch.hvm.cache_mode =3D NO_FILL_CACHE_MODE;
+            v->arch.hvm.vmx.cache_mode =3D CACHE_MODE_NO_FILL;
         }
         else
         {
-            v->arch.hvm.cache_mode =3D NORMAL_CACHE_MODE;
+            v->arch.hvm.vmx.cache_mode =3D CACHE_MODE_NORMAL;
             vmx_set_guest_pat(v, *pat);
             if ( !is_iommu_enabled(v->domain) || iommu_snoop )
                 vmx_clear_msr_intercept(v, MSR_IA32_CR_PAT, VMX_MSR_RW);
diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/a=
sm/hvm/domain.h
index 95d9336a28f0..83be2bd1c29c 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -97,12 +97,6 @@ struct hvm_domain {
     /* VRAM dirty support.  Protect with the domain paging lock. */
     struct sh_dirty_vram *dirty_vram;
=20
-    /* If one of vcpus of this domain is in no_fill_mode or
-     * mtrr/pat between vcpus is not the same, set is_in_uc_mode
-     */
-    spinlock_t             uc_lock;
-    bool                   is_in_uc_mode;
-
     bool                   is_s3_suspended;
=20
     /* Compatibility setting for a bug in x2APIC LDR */
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/=
hvm/hvm.h
index 20b373cea6fb..728b9624522f 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -394,6 +394,9 @@ static inline bool using_svm(void)
     return IS_ENABLED(CONFIG_AMD_SVM) && cpu_has_svm;
 }
=20
+#define hvm_is_in_uc_mode(d) \
+    (using_vmx() && (d)->arch.hvm.vmx.in_uc_mode)
+
 #ifdef CONFIG_HVM
=20
 #define hvm_get_guest_tsc(v) hvm_get_guest_tsc_fixed(v, 0)
diff --git a/xen/arch/x86/include/asm/hvm/vcpu.h b/xen/arch/x86/include/asm=
/hvm/vcpu.h
index 9ed9eaff3bc5..eae9ac53767b 100644
--- a/xen/arch/x86/include/asm/hvm/vcpu.h
+++ b/xen/arch/x86/include/asm/hvm/vcpu.h
@@ -168,9 +168,6 @@ struct hvm_vcpu {
=20
     u8                  evtchn_upcall_vector;
=20
-    /* Which cache mode is this VCPU in (CR0:CD/NW)? */
-    u8                  cache_mode;
-
     struct hvm_vcpu_io  hvm_io;
=20
     /* Pending hw/sw interrupt (.vector =3D -1 means nothing pending). */
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include=
/asm/hvm/vmx/vmcs.h
index 53aa9e3556d3..d28a2682e9df 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -46,6 +46,7 @@ struct ept_data {
=20
 #define _VMX_DOMAIN_PML_ENABLED    0
 #define VMX_DOMAIN_PML_ENABLED     (1ul << _VMX_DOMAIN_PML_ENABLED)
+
 struct vmx_domain {
     mfn_t apic_access_mfn;
     /* VMX_DOMAIN_* */
@@ -56,6 +57,13 @@ struct vmx_domain {
      * around CVE-2018-12207 as appropriate.
      */
     bool exec_sp;
+    /*
+     * If one of vcpus of this domain is in no_fill_mode or
+     * mtrr/pat between vcpus is not the same, set in_uc_mode.
+     * Protected by uc_lock.
+     */
+    bool in_uc_mode;
+    spinlock_t uc_lock;
 };
=20
 /*
@@ -158,6 +166,11 @@ struct vmx_vcpu {
=20
     uint8_t              lbr_flags;
=20
+    /* Which cache mode is this VCPU in (CR0:CD/NW)? */
+    uint8_t              cache_mode;
+#define CACHE_MODE_NORMAL  0
+#define CACHE_MODE_NO_FILL 2
+
     /* Bitmask of segments that we can't safely use in virtual 8086 mode *=
/
     uint16_t             vm86_segment_mask;
     /* Shadow CS, SS, DS, ES, FS, GS, TR while in virtual 8086 mode */
diff --git a/xen/arch/x86/include/asm/mtrr.h b/xen/arch/x86/include/asm/mtr=
r.h
index 25d442659df2..3a5b4f5b6eec 100644
--- a/xen/arch/x86/include/asm/mtrr.h
+++ b/xen/arch/x86/include/asm/mtrr.h
@@ -7,9 +7,6 @@
 #define MEMORY_NUM_TYPES     MTRR_NUM_TYPES
 #define NO_HARDCODE_MEM_TYPE MTRR_NUM_TYPES
=20
-#define NORMAL_CACHE_MODE          0
-#define NO_FILL_CACHE_MODE         2
-
 #define INVALID_MEM_TYPE X86_NUM_MT
=20
 /* In the Intel processor's MTRR interface, the MTRR type is always held i=
n
diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.=
c
index 7be9c180ec43..03be61e225c0 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -559,7 +559,7 @@ _sh_propagate(struct vcpu *v,
         if ( !mmio_mfn &&
              (type =3D hvm_get_mem_pinned_cacheattr(d, target_gfn, 0)) >=
=3D 0 )
             sflags |=3D pat_type_2_pte_flags(type);
-        else if ( d->arch.hvm.is_in_uc_mode )
+        else if ( hvm_is_in_uc_mode(d) )
             sflags |=3D pat_type_2_pte_flags(X86_MT_UC);
         else
             if ( iomem_access_permitted(d, mfn_x(target_mfn), mfn_x(target=
_mfn)) )
--=20
2.34.1

