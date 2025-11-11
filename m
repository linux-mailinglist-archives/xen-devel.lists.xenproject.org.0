Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6CEC4FAA6
	for <lists+xen-devel@lfdr.de>; Tue, 11 Nov 2025 21:09:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159303.1487662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIufU-0004Im-4s; Tue, 11 Nov 2025 20:08:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159303.1487662; Tue, 11 Nov 2025 20:08:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIufU-0004Gb-25; Tue, 11 Nov 2025 20:08:44 +0000
Received: by outflank-mailman (input) for mailman id 1159303;
 Tue, 11 Nov 2025 20:08:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiuT=5T=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vIufS-0004GQ-Fw
 for xen-devel@lists.xenproject.org; Tue, 11 Nov 2025 20:08:42 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 378ee571-bf3a-11f0-9d18-b5c5bf9af7f9;
 Tue, 11 Nov 2025 21:08:41 +0100 (CET)
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 (2603:10a6:10:435::21) by AM9PR03MB7758.eurprd03.prod.outlook.com
 (2603:10a6:20b:3dc::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 20:08:26 +0000
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584]) by DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584%6]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 20:08:26 +0000
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
X-Inumbo-ID: 378ee571-bf3a-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fcsQlWhCR44PPbZxswoiXzDPIQOrz0hbzx38fhIEZLMIcKMeOqjRCdIBlZ9fwsmznqPVMkUPY+D+8CCPESrapniBTIvTf0S88j+Ax4CYmD7NKabYlLe3+QtmaenRYyHs6LiKexmvzynNde1Ux/zudtNXCK323qM04s8ugIRppNz8cT1i5o3IGbAsXg7vIha8Td5xjWYvDYIivWxQn+ytsRk2/eJpxpxl+2A3w2NA8DjCXfIyC12OaAvmYKdYe8ueCYkXCbpgm72JU2fhyzexoEpyJuRqh2Lp8f5ccXrC3nHUEp2EwiafKMzMUKQnMHeWR6s+innENhR8CIdpyOgmbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+avs39yG5SK8mfCma+H15nY8tDlKMQPGd027kBE3V08=;
 b=jRCuIVzuINS30gEyPCfMn7DNf1LaFrcyTUi15pO1vkVh/WT0CYLcxwlTAp4h3KkhzieE9Chs3b2t5ingPexpUAgd6iR7zCBkh09kIRqPo26/rSC83keIeunWQXhYzZ3sAkK8Qe7gVWpweKRHj4LnW7NBYM/suLgnIZwUWsb16xMnRF5XhKEv1MuqJqQOySLpIPNsUx/qeLWJhO3saRyLGMysRqqC3PwWBBX8aET4LrIxn6wmGKSy7QAYnA7o7hH+IDwKKCdttVyV2erowoUTvJHttOBC12Ky3s/lNrcCEeAR7aDMllPxRPBl0UbQUpyZROYSddQuQV1gNn9WdZIpuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+avs39yG5SK8mfCma+H15nY8tDlKMQPGd027kBE3V08=;
 b=BjDC8YfYAcxJ1O49Nzg4Upmnn0ky6q8NkqlGe8uu2LWPsq71FhW/QUelhZltPK/q6IiJ1YKrRUcorJ6z56b1Px2Kc6fMezAALhfOlcKgnAIARP8AYDUPHl4G1ILV5opjXO6qdR0i8AYRcHpP/oT4CZ7mygvww1f0gCIMim/WldwUbuylAa9wtut6nh4s+uB0g/qoFr7+u/A6+95psryLxBW3LubJwU4/K5PeXHMWirKgdW68+PBs1/lz3NuO6NVr2LF0Z8mPSzNBxZpd7j1+QCh5PM/KoVgaYwEaLAG9zOvQJZ76uQGPE7XjGOn1nm/rqVMgiqTPVj2OcUcs1f5iJA==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: [RESEND PATCH v2 1/3] x86/hvm: move hvm_shadow_handle_cd() to vmx
 code
Thread-Topic: [RESEND PATCH v2 1/3] x86/hvm: move hvm_shadow_handle_cd() to
 vmx code
Thread-Index: AQHcU0bwuBVmBHjS2k6n1jYAWQNcbg==
Date: Tue, 11 Nov 2025 20:08:26 +0000
Message-ID: <20251111200754.3575866-2-grygorii_strashko@epam.com>
References: <20251111200754.3575866-1-grygorii_strashko@epam.com>
In-Reply-To: <20251111200754.3575866-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR0302MB8919:EE_|AM9PR03MB7758:EE_
x-ms-office365-filtering-correlation-id: 326c23ee-e286-44ef-ec87-08de215e12ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?kuVn5phmoQY2VNF1W+2UP2YEohAf2aKEdCPsdJiqBaKRZWGep5LC6qixIJ?=
 =?iso-8859-1?Q?jzYf1Z5EnuyQ+ufpHYo60AE4vWXu8a6izhHzhAKILOc7XX+DChJEtTjrIW?=
 =?iso-8859-1?Q?UkwbHO8TVuoknCQVIXv0K/TntLIAq4Z+QHThwinN8BhG16Wbw31c/d+6Gx?=
 =?iso-8859-1?Q?JHD9/jHAFr6zDFObrbnVLri2jm2ilx6etE8ihYgS3E2q2CsOO/Oi65PGvP?=
 =?iso-8859-1?Q?S4GoejK1Nb09pPhmll7D9h9smN2RMBATbq438nvr/y4T3GLNw8UR6GS+lx?=
 =?iso-8859-1?Q?PKm3GPSbHnvJ7txqxySAybM0al5ttBo/nZusyMbEz7Z7kOET/zAihYKROz?=
 =?iso-8859-1?Q?l07O3Sl4C6hqoGQd4Z1xswsRVrjOpQ90E+8JqMq/ZPoq6bxQOa+xxyUFib?=
 =?iso-8859-1?Q?2zWh/T2/9S/AyMM9voNjXuO/+mOHJT0yiXY8cd4emv3lgCq6ODutECYvpB?=
 =?iso-8859-1?Q?0CQXyMNuwiH+I1AOPr1uK+ysmCiIS5hhkLF0uU2SFIdFMjt4/MZzh6KdTj?=
 =?iso-8859-1?Q?KRafLbKPmxXaD8dTeX6hzvCRJ8+kVNT8M5KXM9DE5iW1NzB+uyFqDoBxZD?=
 =?iso-8859-1?Q?SvL4UKUWiokBAjwVPnzrBqRrgQA3+Gi8WZcgOnlswlMA90q/9PnJkubn/h?=
 =?iso-8859-1?Q?+CwYQwUOo8nXDcHcr54XIzpf2RwrZc3X5TwMB853mY4o3GyiBDD+vo0MY0?=
 =?iso-8859-1?Q?qFjyR8aREs2jBbmN9x5KfZKyb7kcWAmXsptVT944QYVqHtmIYv9Q+jpmE4?=
 =?iso-8859-1?Q?0azGDWAP8INcFmRMue0AnWED69e5z6Lyn4B4HVcLjrV8Ox1wIrVBVi1iOa?=
 =?iso-8859-1?Q?LudSCZKsl2caN98iC9vWVdNj1PEzULqanuzMBakEHXmInChoML5uZFFjRb?=
 =?iso-8859-1?Q?OJouh1qpGQ19TfS5D4vKiIaJan9ZEL9vGWfDaB2xMDC6Hh0xLlac5w9rBn?=
 =?iso-8859-1?Q?4Yhcf7yP2EsTj+ahqBPhCMulXjjXyDnstdPk0joya+RgPfksyobLnJsYyk?=
 =?iso-8859-1?Q?Pt7kZAq5UEUUXuC+vvp+BJ0IT4Ud2QLgon1gYZ9VBU517zYiIzsHBORIJ8?=
 =?iso-8859-1?Q?LbunDy3oSDFEEf8u+qY/RZHIbAN4x+Z7JVOjZ2KB8J5dFPCcnGbeDK/o+3?=
 =?iso-8859-1?Q?koukcuAA71AH7aKq5E6ijFzcOPpGMopZi3dVycow+LuGLTLkZoRXJLwOem?=
 =?iso-8859-1?Q?/SQ0OTflNAHxlDDCAKRkDMrOWs2Ie2wMLAHkHLHFB8ykiOzyQO9mI8yFFS?=
 =?iso-8859-1?Q?/+B0kwvy/MFQbsIoxYXpzakesJDwQcpp2NH9sib3j21zOUhIFKsFsjYsWA?=
 =?iso-8859-1?Q?M2dVkSHBqtq7Weh0xYhHqIyrnYP5YJr9YuZCPjl28mkaht+WZLMF2NcoOh?=
 =?iso-8859-1?Q?VfxfGmX0uRYviqqwrJn+ROdEmv4vfrxrhmfiYUJlfaTGnMcGhIgTiSeNYQ?=
 =?iso-8859-1?Q?guqXvlaseoS0yOAD7DZtY3x1O9uAaH5qW1DuyJx7gVhf/bFK9vPBaI80fv?=
 =?iso-8859-1?Q?N0tZag4GyxGSDVUZkdHL0aa7s5d2oj5TV6cs2u+GOLSAOMgP5be7P7m+v5?=
 =?iso-8859-1?Q?Wh1W/CSjLMN7Ln50s1D40Eddx3gE?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB8919.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?XgVI8pLc1NpTvhW9A7uI+8SGrIcbK1suxKVyovI5nh5LGkY+HVCCzHXgWJ?=
 =?iso-8859-1?Q?1VfRKxfIqm37Iyr81BFAffpfQ521Y0vBJEWarPi3Mb+vt/HSiQkYlRuQye?=
 =?iso-8859-1?Q?OGS0u2nQDZ1RbNStrwQri9kqk1AfSLBzWlGRPXIOw+WJH0M2YAxj7HwaZU?=
 =?iso-8859-1?Q?j+RQTrFkJhFThB4qD1HFjFLCAA8A6tLgQEAnagmIVP2c9RZuW6yRQ9kfzO?=
 =?iso-8859-1?Q?f1Qe3AIuerZO1T6nt5zpg7s5AE++Ezicj/KumSdkH/Rqt5wkI5/EFpOdTq?=
 =?iso-8859-1?Q?8TyzVrBZ+Oi9F3Nt0z6pWLFEdnhPtz2Gc7NjW8flc3Y5tSfKW0eh7zT/jj?=
 =?iso-8859-1?Q?i473n6OEvAOunol3zVzZrEpWFgRVvtKRkAC/V4JLroa8jXdpqfgeogdg8w?=
 =?iso-8859-1?Q?y4q0qrmtoldjf6CfcGuFaezCOHnXmZr6vB7iq1aavSUc6DBI6jvcS1zyGB?=
 =?iso-8859-1?Q?wv0e+b0B2XyBemEFFA0W9NELXEN/OiCRG3lcVEjXEdaTx7/eKGUXbM4xzn?=
 =?iso-8859-1?Q?tFOidKL4G0RFD9eEkMcug+2uEDsM0E0RQBechhvCFNqzGQVDbiUd2vFyIa?=
 =?iso-8859-1?Q?7RJY0DutPjFa5/YDTNpH6fT/kexmvp9YFFBJMq3VOgWYGfu4Ldb+TscZdE?=
 =?iso-8859-1?Q?e6nxPh9A97TH+yBiekprLQqgt9iJSe7+pd7LLnjZRRohDRtYaQ+T2rJ8YT?=
 =?iso-8859-1?Q?TTqrqnqmamju6/L9DACM95Hco2dDv2ppMulpN+jrkjA7Sn4jmy51F/BQdH?=
 =?iso-8859-1?Q?S9pGwJkNZo9of/02aZ1H4f5qMa6tWT7C3wkUMSjfcpyROmiWS1AjDQnZLL?=
 =?iso-8859-1?Q?Bgg1gCKIFzxJw5LOku+Tr2wNQalgMhXPIKMHZqLax9hlFrgKU4aR0Zsx4Q?=
 =?iso-8859-1?Q?mzv8n6MEMJi2GJrp5G2iybU6dlZqH1GDZPVTxZ9gAlguKCVhlQefXIUtUw?=
 =?iso-8859-1?Q?qghHCFvHgrfapJoIGHGa7q7ubZyyPAXV2DS2/9gPQikpYpewACZW4wy4J7?=
 =?iso-8859-1?Q?X0uvrsJf0FTIONXigP2RcSriHSJ/qS1NO8PJ0rr1rDbxaq+gWgu0mKwJ9/?=
 =?iso-8859-1?Q?Aam8uYGWVwrkkd1mkCcJwlEJ7fdsOO0Azws02+CJzLGrzjAlL4s67Q6vZp?=
 =?iso-8859-1?Q?Yk7u2jBFhBp/vXQ3Ir65hT2rGzdgqFpMVbcFO37mYjnkd/wKMUG1biUOFP?=
 =?iso-8859-1?Q?B9Dgvvo/G8CL9fQkulGudiQs7QjUyh7pVueibLYuedipg7Ys2yUcPLS5xx?=
 =?iso-8859-1?Q?VfxkVf/b872k6lyC8TzQuf/0gvyuvz76+95VGV/4CXV6pOZIl9ZcME7IOA?=
 =?iso-8859-1?Q?EI7ndFLs1h4/hd9/UdwcgOg3xN4+gSqiNvIdhPXuAAERLMcPBXkH1/1ff0?=
 =?iso-8859-1?Q?twimy2C4Ey++sgGIkZNhlDkcLXwxW7vUVBFIaXuTbBkFGJSy/u8YkBTOwn?=
 =?iso-8859-1?Q?3HDHB9emi1y5T7JrLrp3l9YQiinprVbxHQi0r/hjIwo3Apgu26QW8F12jA?=
 =?iso-8859-1?Q?P2/FOGYmKG/Km4wnI/xC5mqZ37m9cB6/9LiZaM7S8l7owJ+qhvSOfS0Kpe?=
 =?iso-8859-1?Q?MPZT2saYJwC9t4B25jGI/dqzCNrVC1dvrFHZCcjYjWD6hhCWDLVFhEMuyj?=
 =?iso-8859-1?Q?UGlbeQzW2ww30xKjb620eWXT8/tQlmkz+w/yPORw9uunruOp7ksWwOPQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB8919.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 326c23ee-e286-44ef-ec87-08de215e12ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 20:08:26.0972
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EtbRX+k0wJogls3x4WBB1G7UYfKrTxawonxKtui4NEZQ4krM70YrbU529PdtWhznM4luVjxq4nseyw5IpF4c8EVIVCSD5xMPxTQRIOp2RUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7758

From: Grygorii Strashko <grygorii_strashko@epam.com>

Functions:
 hvm_shadow_handle_cd()
 hvm_set_uc_mode()
 domain_exit_uc_mode()
are used only by Intel VMX code, so move them to VMX code.

While here:
- minor format change in domain_exit_uc_mode()
- s/(0/1)/(false/true) for bool types
- use "struct domain *" as parameter in hvm_set_uc_mode()
- use "struct domain *d" as local var in hvm_shadow_handle_cd()

No functional changes.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
changes in v2:
- use "struct domain *" as parameter in hvm_set_uc_mode()
- use "struct domain *d" as local var in hvm_shadow_handle_cd()
- move code before vmx_handle_cd()

 xen/arch/x86/hvm/hvm.c                 | 58 ------------------------
 xen/arch/x86/hvm/vmx/vmx.c             | 61 ++++++++++++++++++++++++++
 xen/arch/x86/include/asm/hvm/support.h |  2 -
 3 files changed, 61 insertions(+), 60 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index da3cde1ff0e6..9caca93e5f56 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -2168,30 +2168,6 @@ int hvm_set_efer(uint64_t value)
     return X86EMUL_OKAY;
 }
=20
-/* Exit UC mode only if all VCPUs agree on MTRR/PAT and are not in no_fill=
. */
-static bool domain_exit_uc_mode(struct vcpu *v)
-{
-    struct domain *d =3D v->domain;
-    struct vcpu *vs;
-
-    for_each_vcpu ( d, vs )
-    {
-        if ( (vs =3D=3D v) || !vs->is_initialised )
-            continue;
-        if ( (vs->arch.hvm.cache_mode =3D=3D NO_FILL_CACHE_MODE) ||
-             mtrr_pat_not_equal(vs, v) )
-            return 0;
-    }
-
-    return 1;
-}
-
-static void hvm_set_uc_mode(struct vcpu *v, bool is_in_uc_mode)
-{
-    v->domain->arch.hvm.is_in_uc_mode =3D is_in_uc_mode;
-    shadow_blow_tables_per_domain(v->domain);
-}
-
 int hvm_mov_to_cr(unsigned int cr, unsigned int gpr)
 {
     struct vcpu *curr =3D current;
@@ -2273,40 +2249,6 @@ int hvm_mov_from_cr(unsigned int cr, unsigned int gp=
r)
     return X86EMUL_UNHANDLEABLE;
 }
=20
-void hvm_shadow_handle_cd(struct vcpu *v, unsigned long value)
-{
-    if ( value & X86_CR0_CD )
-    {
-        /* Entering no fill cache mode. */
-        spin_lock(&v->domain->arch.hvm.uc_lock);
-        v->arch.hvm.cache_mode =3D NO_FILL_CACHE_MODE;
-
-        if ( !v->domain->arch.hvm.is_in_uc_mode )
-        {
-            domain_pause_nosync(v->domain);
-
-            /* Flush physical caches. */
-            flush_all(FLUSH_CACHE_EVICT);
-            hvm_set_uc_mode(v, 1);
-
-            domain_unpause(v->domain);
-        }
-        spin_unlock(&v->domain->arch.hvm.uc_lock);
-    }
-    else if ( !(value & X86_CR0_CD) &&
-              (v->arch.hvm.cache_mode =3D=3D NO_FILL_CACHE_MODE) )
-    {
-        /* Exit from no fill cache mode. */
-        spin_lock(&v->domain->arch.hvm.uc_lock);
-        v->arch.hvm.cache_mode =3D NORMAL_CACHE_MODE;
-
-        if ( domain_exit_uc_mode(v) )
-            hvm_set_uc_mode(v, 0);
-
-        spin_unlock(&v->domain->arch.hvm.uc_lock);
-    }
-}
-
 static void hvm_update_cr(struct vcpu *v, unsigned int cr, unsigned long v=
alue)
 {
     v->arch.hvm.guest_cr[cr] =3D value;
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 6f2cc635e582..d7efd0a73add 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -44,6 +44,7 @@
 #include <asm/processor.h>
 #include <asm/prot-key.h>
 #include <asm/regs.h>
+#include <asm/shadow.h>
 #include <asm/spec_ctrl.h>
 #include <asm/stubs.h>
 #include <asm/x86_emulate.h>
@@ -1451,6 +1452,66 @@ static int cf_check vmx_get_guest_pat(struct vcpu *v=
, u64 *gpat)
     return 1;
 }
=20
+/* Exit UC mode only if all VCPUs agree on MTRR/PAT and are not in no_fill=
. */
+static bool domain_exit_uc_mode(struct vcpu *v)
+{
+    struct domain *d =3D v->domain;
+    struct vcpu *vs;
+
+    for_each_vcpu(d, vs)
+    {
+        if ( (vs =3D=3D v) || !vs->is_initialised )
+            continue;
+        if ( (vs->arch.hvm.cache_mode =3D=3D NO_FILL_CACHE_MODE) ||
+             mtrr_pat_not_equal(vs, v) )
+            return false;
+    }
+
+    return true;
+}
+
+static void hvm_set_uc_mode(struct domain *d, bool is_in_uc_mode)
+{
+    d->arch.hvm.is_in_uc_mode =3D is_in_uc_mode;
+    shadow_blow_tables_per_domain(d);
+}
+
+static void hvm_shadow_handle_cd(struct vcpu *v, unsigned long value)
+{
+    struct domain *d =3D v->domain;
+
+    if ( value & X86_CR0_CD )
+    {
+        /* Entering no fill cache mode. */
+        spin_lock(&d->arch.hvm.uc_lock);
+        v->arch.hvm.cache_mode =3D NO_FILL_CACHE_MODE;
+
+        if ( !d->arch.hvm.is_in_uc_mode )
+        {
+            domain_pause_nosync(d);
+
+            /* Flush physical caches. */
+            flush_all(FLUSH_CACHE_EVICT);
+            hvm_set_uc_mode(d, true);
+
+            domain_unpause(d);
+        }
+        spin_unlock(&d->arch.hvm.uc_lock);
+    }
+    else if ( !(value & X86_CR0_CD) &&
+              (v->arch.hvm.cache_mode =3D=3D NO_FILL_CACHE_MODE) )
+    {
+        /* Exit from no fill cache mode. */
+        spin_lock(&d->arch.hvm.uc_lock);
+        v->arch.hvm.cache_mode =3D NORMAL_CACHE_MODE;
+
+        if ( domain_exit_uc_mode(v) )
+            hvm_set_uc_mode(d, false);
+
+        spin_unlock(&d->arch.hvm.uc_lock);
+    }
+}
+
 static void cf_check vmx_handle_cd(struct vcpu *v, unsigned long value)
 {
     if ( !paging_mode_hap(v->domain) )
diff --git a/xen/arch/x86/include/asm/hvm/support.h b/xen/arch/x86/include/=
asm/hvm/support.h
index 2a7ba36af06f..9e9fa6295567 100644
--- a/xen/arch/x86/include/asm/hvm/support.h
+++ b/xen/arch/x86/include/asm/hvm/support.h
@@ -119,8 +119,6 @@ void hvm_rdtsc_intercept(struct cpu_user_regs *regs);
=20
 int __must_check hvm_handle_xsetbv(u32 index, u64 new_bv);
=20
-void hvm_shadow_handle_cd(struct vcpu *v, unsigned long value);
-
 /*
  * These functions all return X86EMUL return codes.  For hvm_set_*(), the
  * caller is responsible for injecting #GP[0] if X86EMUL_EXCEPTION is
--=20
2.34.1

