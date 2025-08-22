Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E0CB3129F
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 11:09:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089751.1447246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upNlq-0000CT-LR; Fri, 22 Aug 2025 09:09:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089751.1447246; Fri, 22 Aug 2025 09:09:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upNlq-00009M-If; Fri, 22 Aug 2025 09:09:14 +0000
Received: by outflank-mailman (input) for mailman id 1089751;
 Fri, 22 Aug 2025 09:09:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1jNg=3C=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1upNlp-00009G-HM
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 09:09:13 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aab11df0-7f37-11f0-b898-0df219b8e170;
 Fri, 22 Aug 2025 11:09:11 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by AS8PR03MB7207.eurprd03.prod.outlook.com (2603:10a6:20b:2ed::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Fri, 22 Aug
 2025 09:09:08 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 09:09:08 +0000
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
X-Inumbo-ID: aab11df0-7f37-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QShMiQIFdz24LIxAj36cT9YNmlPZkBR01sq8Z+hn125XbMMvRLXoY2asXoQ9Dzc+PIDImZSHD98RXAktOFZEDD50LiuZy3yp8CGExuU4TawUR3K+w5M2tdhFxnhyvHnhL1yv7XqPLOQzumTNUfogke8PC6Ljrm5zqPACmTLmUJ5lzBSMkOwN4LbOuJL4wsvDozX/GuNvUjn3BlatNRWLtfc0bwyMfj58j+lVHMmGdq/06UpCc5WAhBdIasDRtMwFJ+maQi5spKz91q4mG7hZc2HPKO8AcWb/x8ethtkBbgaFr1B/CXxvRzI7cS2azLQfwb0EgqJ/ChBDhkcLDB/4lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0WTz+QN61rsmkvkidLnVpAe5TYYAQkwIINgDu6Vw00Y=;
 b=wCM4ssN/pwV0K3OuftW/Cf9vCHSOVcki9y7pTivG7PYu9Q73rv06B4yo8QU5FzeBAMS6TIHW6NGUIdBZ2zkt5hkOm10ywDTZ8Gu1KQlwYooEhVHSKsH5sHwvNaUjkRfFzFO9L4OjV4W3rp5UxhzDX7HF8an5xiAFEQgzC5X7OIuXS4l7uCv3fNg4BUUPi1ynV38wTB01BFHRFcGaFIlgOH6KQff6tfXfpmcqHCKe98UomItuTY0vt8EDUWfpc7ekxWKXnH5uJvITMISe7431iwD5Q5oBmEMZa7FRK0G4lqIeNJTee8y8gLZ6JFCM5OWI/X7rxM4Gi1ivITtu+2yl7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WTz+QN61rsmkvkidLnVpAe5TYYAQkwIINgDu6Vw00Y=;
 b=d24TO5PNIqGab4rzgwz96tpkDBXI8zo+PdChKXE3TqOy4CVWUTeJYJgLeA7ffGPc3nskvid5fD51vnCeNMXiUYibuDc30MfJR6pPt5QAEW++KLlnVXkv1qbt9UdLJsBmX0dsPBKDslxJjaEJXQkuH7XdJ23kugM4wkxTFD8kmFSYhLVBKr6cQIKjg3xCCIkk4NLusaZ2lfHsWx8OneVF7IOa4P3Q3BZaOU0K/EkclUxeoMpnLn4vPhFz6/oOVKW/gcZR3si+h3WehyWq9Q0l8Ha/Y8PGAuxOPlXg2TRqL6LPuAFfyIbN/N+q3t57HdjS5D7n2y8IBwYt0+C6atfFSQ==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 01/10] xen/arm: gicv3: refactor obtaining GIC addresses
 for common operations
Thread-Topic: [PATCH v2 01/10] xen/arm: gicv3: refactor obtaining GIC
 addresses for common operations
Thread-Index: AQHcB5d7cCAQRdJCgUKSzBGsZt4ytbRtXheAgAEbjYA=
Date: Fri, 22 Aug 2025 09:09:07 +0000
Message-ID: <b2b7906c-d810-4162-b700-7f1dc2153f4b@epam.com>
References: <cover.1754514206.git.leonid_komarianskyi@epam.com>
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
 <915641a6-8cc6-45bf-a1ee-d69b286e7d30@xen.org>
In-Reply-To: <915641a6-8cc6-45bf-a1ee-d69b286e7d30@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|AS8PR03MB7207:EE_
x-ms-office365-filtering-correlation-id: 4f77e7bc-952f-4072-dbb7-08dde15b8cf2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WWFZRGxzZTRwclpVc3RQY1BQK25qcTcwZUZSRzZiTE9ZYjdSLzVTdHYzMkZx?=
 =?utf-8?B?SG04ZzZyRktMM2k3aGRJdlB1cFVRMUdSajVhNEc5aFkxZVhHNE12QkM4NEIy?=
 =?utf-8?B?SDVpYTh3QlZKQ0E1YXhKS2lCeWc4cjhJUEV4RS9NV0thb3N4TlhTRFBPMHBH?=
 =?utf-8?B?TGFZVmYzMEcvNzdmc3FRSXN5RnI5NUZnZjJjN3FkclMydjhOM1pqRDUxT2RT?=
 =?utf-8?B?bzFvWlI0a29qYk5yV0tFSG9tbmdmWkRhMnJYbG9nWHFjU0wxd25KMmdweWpx?=
 =?utf-8?B?TWg3NmptZWo4UmNZYWlzN3B6U2cvbTNtRUVmZm5mU1kyT29nWnJWQkdYaGd1?=
 =?utf-8?B?NnJLNS95by94TWcyeXlabFcvend3NmY2d0tlSXVNN1o4ZTVuWjhNYkxyeHow?=
 =?utf-8?B?SzVONjhIMWZSdEU0ZXBPWlZkajZNNG5YMmJ4UnF0VlBFS2hKWmppaGFpMjU4?=
 =?utf-8?B?bFhZVmdzVWVBMk80Z0VpbS9ySk00U2dZL3RFZWNzTmtiOEJ2LzdockljTlp3?=
 =?utf-8?B?VzRINFBTSjVkd2s4WlplRjU5WXpkT0FQL3ZSTERYcmIyMTZlWDRoNU5VSUI5?=
 =?utf-8?B?U2pXSnBOMXJjMDZORnNEMysyL2pIMzdjQ3NaV3JKaTBBYW9scThkakpEMjJY?=
 =?utf-8?B?dTJBT3dDd0JxUGMxUXl2RktJKzduazR0QWE2OUpVM0R6cnlWSTBKVUZUNWhn?=
 =?utf-8?B?STdvYnREQzM5N2wwQ3BSd2pvVW9VWEJJYmR3VzN6dm1lUkttMldUSW91MVpp?=
 =?utf-8?B?TzhoVGt1VTdVTnVsbStRVWNBekExNWRLMmIvU1NZQ2NZc0NKS2tDTWxuZDQr?=
 =?utf-8?B?azMvSEtaWndIU3JGcFBVaVpBQWJuNXp3NWJtNk0rZ0hXcytTbjZSc2wwYyto?=
 =?utf-8?B?blJJQVNEODhkdUI5dmNsTEFscHk0VWJwUlRWSy9xek8yRjNDT2k5S25ZNnpJ?=
 =?utf-8?B?SDl4Q0lBSFYrVE9aUHZNVzNqNVdvMmM2eFVYbUVhUzM1WUpsZFJreTVDanhM?=
 =?utf-8?B?ekU5NEhKeEoraTRFakZUZG9BVlYxa1hyMUNiazZqQmJFNzQxb2svRlMvc2cv?=
 =?utf-8?B?dnIxb1pXazhQWEcyT3diMjYvTVB6VUZ5aXoybmNCcmljSWlEd0p5b09SOFZC?=
 =?utf-8?B?Zk9BMFJKaHNkQVJQUFdNNnhEekdPd2lESnFiME1PTEh5RWJsUXQyeVJTVDNK?=
 =?utf-8?B?ZjdVdkxCU3g3b294MEZVYVEyc0R0eWVORzAraFlkemh4UzdZaWZteitXbWIx?=
 =?utf-8?B?SlpQOTY4OXVJY0oxS201R0dRME53ODNJV1ptR2x6ZlhaYVlSOXYxNm9xczVF?=
 =?utf-8?B?Rm14S0UxU2JuUmVOZjBsRVV5NWZ2ZDdZN1AvWTVlYXpWRXF4R1RoKy9sRzRL?=
 =?utf-8?B?Yit2LzdZeFUzQVRWZWlQanpsSkRoVXFmeERQZVpRKzE5emxURnJFU20rdmF0?=
 =?utf-8?B?eGd4cFlOdjVqR3dNcDdDeFJPM1A1a2xwTXlVcGgxNUUrRlQ5c1pIanhXYnF1?=
 =?utf-8?B?ZnlyWno2WUZlZ3QzR3gyRTM4b3FKNkdLaEMxMkJZYlZhbTk0Vjl4c1BWRGVz?=
 =?utf-8?B?U09ZMXc2b25mVms3SGdmRGhDbXhoSHVlNGZkTFl4dHZDN25xVXBobjZkQmtT?=
 =?utf-8?B?K3pmNVR2dVA0OWNISGd6dmxFZG9zaXdMTkpteVJGeVp2SEZrRHVzVHRRQnI2?=
 =?utf-8?B?RzZ2M3o2bTJIb0E4STF1aXB5aFAwMlNDU3U5NGNjSGxUQXZQL0xCb01xdVZS?=
 =?utf-8?B?RE1xVTNFdzFuZDdpYm92MXRpaCtKNkMyYTJBQStzbVM5NDZWa1BrdGliSmRo?=
 =?utf-8?B?WmdyNWo2NlBYWkQrbExFU0ZGSXNzNFA1SlVGZ3hEOUo1V05KUHE0K3hSMCtQ?=
 =?utf-8?B?YzB4MnhEMTVzSFA1LzVCSitVS21xR21kZ29FMUYwVDZ5OWtybS83NGJ2Vlg4?=
 =?utf-8?B?OXozaTJxbGZBWkpzczBpUjdnYVQ2eW52VFpaSDNQdnN1WXU0WmlnMzQ0WHNm?=
 =?utf-8?B?YlozQ3NOdFVnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VGlkd3ZCOWdSbFJhTW5ScVVjMHBlRG1JQVJxWDNGNzQzM3IwQmZzK29TVVM2?=
 =?utf-8?B?MGQ2YTdBTUpQUXVDY1JrTjF4N1czdUNKRTBuNDdLZ0RvWXFDTEUrS1krTVR0?=
 =?utf-8?B?NTUyVTRaWVlmQVZPYUl5amtlM0pSYzFUU3FRWmszZXRWc3BpVjFWODJwdFpj?=
 =?utf-8?B?dVFQUWEwTWptbWdEY2w5cGZJOWpuTk9GVUZnRGt5bWZQWm02blJHa1pkby9R?=
 =?utf-8?B?eUdEbVl6UW1PSDBiT09MVG04Si9semJxRGNmMWlFT3VFT2loSTltcjROYUpl?=
 =?utf-8?B?L3JBNGdycktWVWU3K2NTdUM3M0Njd0ROMFUzQUxtMnlaMzNucG04WmJSMHB2?=
 =?utf-8?B?Qm5CVVRxajNYNlZjcUE2TGtUbTVwRFJmQi9rUm5OV0RVbjdVNU8zRjMvL1Jo?=
 =?utf-8?B?OTlqQmZQTEZVR1N2dUIyNzZrTkxQc25GOVhCWmQzQndGSXg0SnFXSk5pTlp5?=
 =?utf-8?B?czZWS0FFZkcwRkg1dk9iWHZoMmxObWZzWWVNYmNvODIrbnhVa2xsUEF2YTQv?=
 =?utf-8?B?WnBFaW02Smh4cFltVTVRYS9VN3htcW5aSEFTUndwRWRJT1ZaenZSQW1HNlFl?=
 =?utf-8?B?V1FSblk4VzVTdzRvYXRFVWZoQ1N3QnBWVGE1c1prcVhVSkdBbGhQYU80Z0xD?=
 =?utf-8?B?TTc1bEVPK095WkJ4alZPNkcwNXhLdkFaMUgyMVFqeVIvZDFlb1VzNzVFTGsr?=
 =?utf-8?B?c3pOcktWdnRvcGxGZmZBN3F1eUQ4TEpQWC9pWi9XdHVEUHdENlBKeGFWbERC?=
 =?utf-8?B?bGkwelJMK3o2VHhEQVhTTnRLcGNHZHNFVVBJMVpNTHhOSmd1ZGRxbFRrekJz?=
 =?utf-8?B?U2VhMGxFMHdzZFEvN1NLS0JDV3M0N0kwMUV3a0gxSTRKK3ZUb0FaRzExY3FY?=
 =?utf-8?B?cmFad2xtdk5ybmRKb2YrQnNsaGFOVDUyL0wwelRjUUtxNitxaDVxSWRTK29W?=
 =?utf-8?B?SEN2VEFXdVQwUGZjZk10V2VIK1NueEszWXlRWXBqckdhSmN2ek9HK0k0TGtl?=
 =?utf-8?B?Q0RHUGx2UUVKRzZXcU1kZWs4empUbCtXL0dERjJ0UldzaUZPUmtGRHF3NVpF?=
 =?utf-8?B?bXNxVkRNVEprOElQUk1pdGkwWlhZREhvREg1RTRHL2xvcHQ4WGZKYUV0b09t?=
 =?utf-8?B?RFZKdGdUWEFkVlBZVUVGMnVJeTUrNWw3M01heUE5MEpHaW0vaW1XVnlEK0xT?=
 =?utf-8?B?Mzlvb1R3MkJwQW12d2NZZ3RqaG1UU0xBMm5CN2s3TEhKT1lDQ1pRTTg3QkpU?=
 =?utf-8?B?V0MzRDFzQlpzWko3Sng5UE9STHFpMUlWeCtVMEkwa1JQVDRJNHdDdnJHMkNI?=
 =?utf-8?B?UHFaWElkSHhDZ1lPSzhwcmxkWEdDemNkY2txS0VhNGZqcmpKWm9XcnYraEVY?=
 =?utf-8?B?L2tPMWxCWFczKzFoUkcxaTd2dnl5bFlPcTlzU1MxK2dQVWduUTUvMkFHNkgy?=
 =?utf-8?B?TTdzQ2ZBRHFzMUx4RDlySXpIeDRUM3BzeFBqa3g4S0ZKQXFEbnNxMnNmQ1Vz?=
 =?utf-8?B?bXFNSkJkTktYMU1yaGZGMDBwOUd0T1VZS0VlWEtJQ3A3TDcweEZSVXFFU3ZG?=
 =?utf-8?B?NFV6TWpBWHdHcFErOXN2aHQybjdPeVBOb0pTUXJ0TmNMbVgxV0VkSStWRnZv?=
 =?utf-8?B?NkdDYnplTG1RYXlHaER6eEEvZnovV2EvNThVaENzTStBZlZPUWtyaktJbGkw?=
 =?utf-8?B?emRnMkNva1dzZktxU0kxSE8wNzQ4Z2I1T2I0VGpWVExnVXQwTm8zRm45MmNn?=
 =?utf-8?B?UjZsSmxkNTVadVZkajc4dUgwN3E0ejBjZkh5b1pjdWxDK3NJaHFhRjZVQTR3?=
 =?utf-8?B?M2VSdUhBcktlQkFrdkpRSHJQZlc0VGx0dFI3dXpCZThzNDRxZWtwc3RsY3Zp?=
 =?utf-8?B?VTZFVWxjbloraEZENkxmYnVPcVA5T24rL2c5a0VVeTY0NSs1ZVJENUpsT3Ft?=
 =?utf-8?B?b1Jlazh5MERHeXg4aUxSU1NjYkNrekhLRE9ocWJ6MzA2dFkvNkhna0l3THov?=
 =?utf-8?B?TXh5V3lUSzlxQlZhQThhaXNhaHlQcjlSR0U5MHI1ZVFicXlTZk1lUklzVTZi?=
 =?utf-8?B?TW5kdVMvd2FjOFVsZCszSHNMMFNFbFJXTUl6RkI0cDZjUGh5Z09CWHdNbkN5?=
 =?utf-8?B?ZWVWVVlWcDd6MGdTeUVmaU1LSW9LVnNrQUQvNHM4K2ovMHQ1R0p4bUNST0NO?=
 =?utf-8?Q?4A4KjN8xsKo0sb2xGyN22S0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <897E0769ED134D4A9BF3C0A17F879B1A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f77e7bc-952f-4072-dbb7-08dde15b8cf2
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2025 09:09:07.9332
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lAZ/SuafqwZhUnm4uQR1DOt+YnbEt9Tu/dxMRjlkPP1nfnVwEe+JeqYEf1jj4mriq852nVQbOWbEabrPt8onFVAprq5Hya7ZbZWWCUMNrLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7207

SGkgSnVsaWVuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgY2xvc2UgcmV2aWV3Lg0KDQpPbiAyMS4w
OC4yNSAxOToxNCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBIaSBMZW9uaWQsDQo+IA0KPiBPbiAw
Ny8wOC8yMDI1IDEzOjMzLCBMZW9uaWQgS29tYXJpYW5za3lpIHdyb3RlOg0KPj4gQ3VycmVudGx5
LCBtYW55IGNvbW1vbiBmdW5jdGlvbnMgcGVyZm9ybSB0aGUgc2FtZSBvcGVyYXRpb25zIHRvIGNh
bGN1bGF0ZQ0KPj4gR0lDIHJlZ2lzdGVyIGFkZHJlc3Nlcy4gVGhpcyBwYXRjaCBjb25zb2xpZGF0
ZXMgdGhlIHNpbWlsYXIgY29kZSBpbnRvDQo+PiBhIHNlcGFyYXRlIGhlbHBlciBmdW5jdGlvbiB0
byBpbXByb3ZlIG1haW50YWluYWJpbGl0eSBhbmQgcmVkdWNlIA0KPj4gZHVwbGljYXRpb24uDQo+
PiBUaGlzIHJlZmFjdG9yaW5nIGFsc28gc2ltcGxpZmllcyB0aGUgaW1wbGVtZW50YXRpb24gb2Yg
ZVNQSSBzdXBwb3J0IGluIA0KPj4gZnV0dXJlDQo+PiBjaGFuZ2VzLg0KPj4NCj4+IFNpZ25lZC1v
ZmYtYnk6IExlb25pZCBLb21hcmlhbnNreWkgPGxlb25pZF9rb21hcmlhbnNreWlAZXBhbS5jb20+
DQo+Pg0KPj4gLS0tDQo+PiBDaGFuZ2VzIGluIFYyOg0KPj4gLSBubyBjaGFuZ2VzDQo+IA0KPiBJ
IGFtIGEgYml0IHN1cnByaXNlZCB0aGlzIGlzIGp1c3Qgc2F5aW5nIG5vIGNoYW5nZXMgZ2l2ZW4g
dGhlIGRpc2N1c3Npb24gDQo+IGluIHYxLiBJIGZlZWwgeW91IHNob3VsZCBoYXZlIHBpbmdlZCBv
biB0aGUgdjEgdG8gY2xvc2Ugb2ZmIHRoZSANCj4gZGlzY3Vzc2lvbiBiZWZvcmUgc2VuZGluZyB2
Mi4NCj4gDQoNClNvcnJ5LCBteSBiYWQuIEkgc2hvdWxkIGhhdmUgcmVhY2hlZCBvdXQgdG8geW91
IGFuZCBjbGFyaWZpZWQgdGhlIA0KdW5maW5pc2hlZCBkaXNjdXNzaW9uIGluIFYxLiBJIGp1c3Qg
d2FudGVkIHRvIHB1Ymxpc2ggdGhlIGNoYW5nZXMgaW4gVjIgDQp0aGF0IHdlcmUgYWdyZWVkIHVw
b24gaW4gVjEuIEJ1dCB5ZXMsIEkgdW5kZXJzdGFuZCAtIGl0IHdhcyBhIGJhZCBpZGVhIA0KdG8g
cHVzaCBWMiB3aXRob3V0IGNvbXBsZXRpbmcgdGhlIGRpc2N1c3Npb24gaW4gVjEuIEkgYXBvbG9n
aXplIGZvciB0aGF0Lg0KDQo+IFdoaWxlIEkgdW5kZXJzdGFuZCB5b3VyIHBvaW50IGFuZCBjb3Vs
ZCBhY2NlcHQgd2UgY29uc29saWRhdGUgdGhlIGNvZGUuLi4NCj4gDQo+IA0KDQpUaGFuayB5b3Ug
Zm9yIHlvdXIgdW5kZXJzdGFuZGluZyBhbmQgYWNjZXB0YW5jZSA6KSBJdCByZWFsbHkgc2ltcGxp
ZmllcyANCnRoZSBjaGFuZ2VzIGluIHRoZSBuZXh0IHBhdGNoZXMuDQo+PiAtLS0NCj4+IMKgIHhl
bi9hcmNoL2FybS9naWMtdjMuY8KgwqDCoMKgwqDCoMKgwqDCoCB8IDk5ICsrKysrKysrKysrKysr
KysrKysrKystLS0tLS0tLS0tLS0NCj4+IMKgIHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9pcnEu
aCB8wqAgMSArDQo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDY3IGluc2VydGlvbnMoKyksIDMzIGRl
bGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZ2ljLXYzLmMgYi94
ZW4vYXJjaC9hcm0vZ2ljLXYzLmMNCj4+IGluZGV4IGNkM2UxYWNmNzkuLjhmZDc4YWJhNDQgMTAw
NjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vZ2ljLXYzLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2Fy
bS9naWMtdjMuYw0KPj4gQEAgLTQ0NSwxNyArNDQ1LDYyIEBAIHN0YXRpYyB2b2lkIGdpY3YzX2R1
bXBfc3RhdGUoY29uc3Qgc3RydWN0IHZjcHUgKnYpDQo+PiDCoMKgwqDCoMKgIH0NCj4+IMKgIH0N
Cj4+ICtzdGF0aWMgdm9pZCBfX2lvbWVtICpnZXRfYWRkcl9ieV9vZmZzZXQoc3RydWN0IGlycV9k
ZXNjICppcnFkLCB1MzIgDQo+PiBvZmZzZXQpDQo+PiArew0KPj4gK8KgwqDCoCBzd2l0Y2ggKCBp
cnFkLT5pcnEgKQ0KPj4gK8KgwqDCoCB7DQo+PiArwqDCoMKgIGNhc2UgMCAuLi4gKE5SX0dJQ19M
T0NBTF9JUlFTIC0gMSk6DQo+PiArwqDCoMKgwqDCoMKgwqAgc3dpdGNoICggb2Zmc2V0ICkNCj4+
ICvCoMKgwqDCoMKgwqDCoCB7DQo+PiArwqDCoMKgwqDCoMKgwqAgY2FzZSBHSUNEX0lTRU5BQkxF
UjoNCj4+ICvCoMKgwqDCoMKgwqDCoCBjYXNlIEdJQ0RfSUNFTkFCTEVSOg0KPj4gK8KgwqDCoMKg
wqDCoMKgIGNhc2UgR0lDRF9JU1BFTkRSOg0KPj4gK8KgwqDCoMKgwqDCoMKgIGNhc2UgR0lDRF9J
Q1BFTkRSOg0KPj4gK8KgwqDCoMKgwqDCoMKgIGNhc2UgR0lDRF9JU0FDVElWRVI6DQo+PiArwqDC
oMKgwqDCoMKgwqAgY2FzZSBHSUNEX0lDQUNUSVZFUjoNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiAoR0lDRF9SRElTVF9TR0lfQkFTRSArIG9mZnNldCk7DQo+PiArwqDCoMKgwqDC
oMKgwqAgY2FzZSBHSUNEX0lDRkdSOg0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IChHSUNEX1JESVNUX1NHSV9CQVNFICsgR0lDUl9JQ0ZHUjEpOw0KPj4gK8KgwqDCoMKgwqDCoMKg
IGNhc2UgR0lDRF9JUFJJT1JJVFlSOg0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IChHSUNEX1JESVNUX1NHSV9CQVNFICsgR0lDUl9JUFJJT1JJVFlSMCArIGlycWQtPmlycSk7DQo+
PiArwqDCoMKgwqDCoMKgwqAgZGVmYXVsdDoNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJy
ZWFrOw0KPj4gK8KgwqDCoMKgwqDCoMKgIH0NCj4+ICvCoMKgwqAgY2FzZSBOUl9HSUNfTE9DQUxf
SVJRUyAuLi4gU1BJX01BWF9JTlRJRDoNCj4+ICvCoMKgwqDCoMKgwqDCoCBzd2l0Y2ggKCBvZmZz
ZXQgKQ0KPj4gK8KgwqDCoMKgwqDCoMKgIHsNCj4+ICvCoMKgwqDCoMKgwqDCoCBjYXNlIEdJQ0Rf
SVNFTkFCTEVSOg0KPj4gK8KgwqDCoMKgwqDCoMKgIGNhc2UgR0lDRF9JQ0VOQUJMRVI6DQo+PiAr
wqDCoMKgwqDCoMKgwqAgY2FzZSBHSUNEX0lTUEVORFI6DQo+PiArwqDCoMKgwqDCoMKgwqAgY2Fz
ZSBHSUNEX0lDUEVORFI6DQo+PiArwqDCoMKgwqDCoMKgwqAgY2FzZSBHSUNEX0lTQUNUSVZFUjoN
Cj4+ICvCoMKgwqDCoMKgwqDCoCBjYXNlIEdJQ0RfSUNBQ1RJVkVSOg0KPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIChHSUNEICsgb2Zmc2V0ICsgKGlycWQtPmlycSAvIDMyKSAqIDQp
Ow0KPj4gK8KgwqDCoMKgwqDCoMKgIGNhc2UgR0lDRF9JQ0ZHUjoNCj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiAoR0lDRCArIEdJQ0RfSUNGR1IgKyAoaXJxZC0+aXJxIC8gMTYpICog
NCk7DQo+PiArwqDCoMKgwqDCoMKgwqAgY2FzZSBHSUNEX0lST1VURVI6DQo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gKEdJQ0QgKyBHSUNEX0lST1VURVIgKyBpcnFkLT5pcnEgKiA4
KTsNCj4+ICvCoMKgwqDCoMKgwqDCoCBjYXNlIEdJQ0RfSVBSSU9SSVRZUjoNCj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJldHVybiAoR0lDRCArIEdJQ0RfSVBSSU9SSVRZUiArIGlycWQtPmly
cSk7DQo+PiArwqDCoMKgwqDCoMKgwqAgZGVmYXVsdDoNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGJyZWFrOw0KPj4gK8KgwqDCoMKgwqDCoMKgIH0NCj4+ICvCoMKgwqAgZGVmYXVsdDoNCj4+
ICvCoMKgwqDCoMKgwqDCoCBicmVhazsNCj4+ICvCoMKgwqAgfQ0KPj4gKw0KPj4gK8KgwqDCoCAv
KiBTb21ldGhpbmcgd2VudCB3cm9uZywgd2Ugc2hvdWxkbid0IGJlIGFibGUgdG8gcmVhY2ggaGVy
ZSAqLw0KPiAgPiArwqDCoMKgIHBhbmljKCJJbnZhbGlkIG9mZnNldCAweCV4IGZvciBJUlEjJWQi
LCBvZmZzZXQsIGlycWQtPmlycSk7DQo+IA0KPiAuLi4gSSBzdGlsbCBxdWl0ZSBjb25jZXJuZWQg
YWJvdXQgdXNpbmcgcGFuaWMgaGVyZS4gV2UgbmVlZCB0byB0cnkgdG8gDQo+IGhhbmRsZSB0aGUg
ZXJyb3IgbW9yZSBncmFjZWZ1bGx5IGluIHByb2R1Y3Rpb24uDQo+IA0KPiBDaGVlcnMsDQo+IA0K
DQpJIHdhcyB0aGlua2luZyBhYm91dCB0aGlzIGFnYWluLCBhbmQgbWF5YmUgaXQgd291bGQgYmUg
YmV0dGVyIHRvIGNoYW5nZSANCnRoZSBwYW5pYyBpbnRvIHNpbXBseSBwcmludGluZyBhbiBlcnJv
ciB1c2luZyBwcmludGsoWEVOTE9HX0dfRVJSIC4uLikgDQphbmQgYWRkaW5nIHByb3BlciBjaGVj
a3MgdG8gZW5zdXJlIHRoZSByZXR1cm4gdmFsdWUgaXMgbm90IE5VTEwgaW4gdGhlIA0KY2FsbGVy
cy4NCkFsc28sIGluIHRoZSBjYXNlIG9mIGdpY3YzX3BlZWtfaXJxLCB3aGljaCBtdXN0IHJldHVy
biBhIGJvb2xlYW4gdmFsdWUgDQooZHVlIHRvIHRoZSBnZW5lcmljIEFQSSBmb3IgZ2ljdjNfcmVh
ZF9wZW5kaW5nX3N0YXRlKSwgd2UgY291bGQgcmV0dXJuIA0KZmFsc2Ugd2l0aCBhbiBhZGRpdGlv
bmFsIHdhcm5pbmcgbWVzc2FnZSB0aGF0IHdlIGFyZSB1bmFibGUgdG8gcmVhZCB0aGUgDQphY3R1
YWwgdmFsdWUgZHVlIHRvIGluY29ycmVjdCBwYXJhbWV0ZXJzOyB0aGVyZWZvcmUsIHdlIHJldHVy
biBmYWxzZS4NCldoYXQgZG8geW91IHRoaW5rIGFib3V0IHRoaXMgYXBwcm9hY2g/DQoNCkJlc3Qg
cmVnYXJkcywNCkxlb25pZA0K

