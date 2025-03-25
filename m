Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 616D9A7076F
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 17:54:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926746.1329579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx7Xj-0004oF-Np; Tue, 25 Mar 2025 16:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926746.1329579; Tue, 25 Mar 2025 16:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx7Xj-0004ln-KF; Tue, 25 Mar 2025 16:54:23 +0000
Received: by outflank-mailman (input) for mailman id 926746;
 Tue, 25 Mar 2025 16:54:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uFHn=WM=epam.com=Oleksandr_Tyshchenko@srs-se1.protection.inumbo.net>)
 id 1tx7Xh-0004lh-Vu
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 16:54:22 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170120003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7e76370-0999-11f0-9ffa-bf95429c2676;
 Tue, 25 Mar 2025 17:54:13 +0100 (CET)
Received: from PR3PR03MB6412.eurprd03.prod.outlook.com (2603:10a6:102:7d::8)
 by DB9PR03MB8448.eurprd03.prod.outlook.com (2603:10a6:10:39b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.35; Tue, 25 Mar
 2025 16:54:10 +0000
Received: from PR3PR03MB6412.eurprd03.prod.outlook.com
 ([fe80::2887:9068:38f6:8340]) by PR3PR03MB6412.eurprd03.prod.outlook.com
 ([fe80::2887:9068:38f6:8340%7]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 16:54:10 +0000
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
X-Inumbo-ID: c7e76370-0999-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g5p84DGApjTGkeA5Ml0tnwKQB34th77zECFFylgRILCRitsJWDOnoa7m+QmyPlPKhb+KBog/vg4UepLybnzCpXP73kOZ5AFbtZJt+kv5wIlpxxNzB2Pzu77El6iQhbvO+2+1+E4l5Pdk6Lz4GE1Fz29g/SMldIzCzUYkvT7Ke2sZl0deFlE3DUk7LVpHhl5JtP8sRUyl5HWUS3KPo7e9mBsHgo9mAjMrJaizE2rbTYwbaKjv1Gr2RMmorTXDVFYs0u2ldYuhAdYahTsDrJO2utzrHaaEWTUPwrYZBBSNL5xkgxKt27WdG0xir3fZwt/v1d6W6aO2kdWO2m5Xa/MIgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wG8UckL0gHwhuH44rb5YCdCnMwuueWPNkaDZBreM5lE=;
 b=er/hktCx2tG1QdCJfXpdpff8Z11EOakKyh1ucSkAPgLYaXKOXftIQudosEvu0PR5A+bz4pXrfRR9D3rAwvRr0vflp+rOsdL4ePKF6pK/zI4HBFiDIfQMdId5llzoE2YYsTvC8AmM1epHBE0IedgYXliLJlr6dfOIzYOhpQMr2TAa0JqkSwRQx6w8i8bQXgkdclRJ+vZMUBCmvTQro8NMy+5d+kFqSr8jUo9GwGJS3Z4nH/KQP9f8vHNMJ61rnYs2IY2uZrJ353b1IsXQ67togsKyPM0pOmWQmPNhXW003/e6JY/x2UeLYDjOhTHgklwBmbm/1MrAjvd0L79QjieV/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wG8UckL0gHwhuH44rb5YCdCnMwuueWPNkaDZBreM5lE=;
 b=RGA5obSpOfNrHnQvw+p2lOk/jVviZXIzSipR+2vn4es7yOZrb1qDAPQSXCZljrwJq0WKmS1ploVeDgiHb1s0p7Ooc8epxejooTDVZa4D5tyGQbozCMYlMywJtK6uGkMPNZUKJuUNVmnYZBH9eCjZdYLty29OUc/nJM9gSKgdqBKFE8sTpRag+2Q6h92BDhi7HF2kZ13imAALunyTPm+tS0sqhE9P0ESxP2JGwqVPldwUx/I4HST407ZA4nd60Iwj7H5zobtN4NgkoyEgNcJV8Wox8yCLcetUAerT5089YWn+9LaYDAesCAyvcERJzx+vSUeqxf0QA6juJtjOjEENWg==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, "Orzel, Michal"
	<michal.orzel@amd.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH V2] xen/arm: Initialize acpi_disabled to true during
 declaration
Thread-Topic: [PATCH V2] xen/arm: Initialize acpi_disabled to true during
 declaration
Thread-Index:
 AQHbnZfMrs+h0o/uEkuTNWO41qxIcLOD+IUAgAADaoCAAAM8AIAABQEAgAABHgCAAAyVAA==
Date: Tue, 25 Mar 2025 16:54:10 +0000
Message-ID: <340d58e8-b4f0-43ce-8925-e509282bccf0@epam.com>
References: <20250325150842.2015968-1-oleksandr_tyshchenko@epam.com>
 <9b96395c-ca88-483b-be06-b7768b552983@xen.org>
 <4e048dad-bd12-4526-ae62-f424bdb8271b@amd.com>
 <db47de86-b2c1-4860-9212-49c051e1bebd@xen.org>
 <24809d8d-5d95-4527-89e1-e82889d58e3f@epam.com>
 <180d0f62-cab1-4fb5-a09f-c82b117ff554@xen.org>
In-Reply-To: <180d0f62-cab1-4fb5-a09f-c82b117ff554@xen.org>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3PR03MB6412:EE_|DB9PR03MB8448:EE_
x-ms-office365-filtering-correlation-id: 4d32b566-2f53-4f7f-d1e1-08dd6bbdaa2e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cmJ2WkdFMW05VlB5VDRaMDFsQURYMkJRSVg5M2kyZ1lqd2s1RnJPS2xVS1Nn?=
 =?utf-8?B?V3VpYmhSdGNrbEtCRGtBRXgxcWR5ZHBoWFd0UEJqeUpTZW9vN3JKbDd0VE9l?=
 =?utf-8?B?cCt4MURXbGYxV3pSdDVqSHNyOE5CVUNOREdtV3VhYXZMRGVHVmtsL3ppT1lJ?=
 =?utf-8?B?dC9mRkxISXUvT2hmNVpPZFE0M1cvM2JZZkZobWpnbXkwTE5JTEQvVDVjQXJi?=
 =?utf-8?B?VXh5Sm5IMXdhYVJNcUltT21MVWswMENiTmNYalVjS0JqVEhueDB5OGllYmJt?=
 =?utf-8?B?dVErSEQ1L2NONzYyVmtTSXJ4WXBqVnp6cXFneW84WC9iTHNZQVJhaURSTVdz?=
 =?utf-8?B?eVNvN0dEMzV5TTJpcGdBVGI1MTFva2I1bzBVWGJLZmhiWkc0UFlGT0FzVjRD?=
 =?utf-8?B?eUxWRHpHdnUvMU04OUtUR1ljYUNWaTNxYlVyNG9mOGR1MDBDRzl2a1VSQU1N?=
 =?utf-8?B?eGN4em05b1c1U0ZLUGpaM2hBMTF0OEZOb0xOZlZNWHZ1K00rTi8ySytLMmZI?=
 =?utf-8?B?N0I2a3dSZHRlczVUZFFXdjU3Qk9sWlVrOEUybGZFTXJJY3dnNkJ5b2ZLVW55?=
 =?utf-8?B?ay9pMlFXazBST25YcHJNaVZXRVN4ZlVkYThBb3dRS2JlNk5BQ0ovU3pTKzJy?=
 =?utf-8?B?TVZ1azdSYmlBdTNQdzlPeVVCY25UelgvU2hjTEdGeWh1RDRrb2s0U05wK0Ni?=
 =?utf-8?B?VUZIOE1jVmhpY2N0dHVORUVIVmEwQ1h3U1B5NTNTZURnd2tqekxackhVcVdp?=
 =?utf-8?B?ZUtSaTZuRUxqZ0ZYaU1TWHVDcm1zdnZIUElmSjFjKzU4QTYwaDdYcFZ2dGdI?=
 =?utf-8?B?MFU0ZXFBMzBDUlVHNlpTSXFmUW80SndKK2VQb3ZQZW1OeDRiVWw4VS9BdU1l?=
 =?utf-8?B?Z3VWbHczamY5clphekxDaXhPRDkzRnAyT2tpM1F6c1FBMldFdFVmKzN4TExa?=
 =?utf-8?B?U0wvOVBlaHhJeUZoMmNTMnYya2k3Yk53VWNJZnltVmhHaFg1VnpId1hnUXpV?=
 =?utf-8?B?RGgveHdtclhFNy9pUWlmNCs3dkp3TFUrS293THlpeWJQQW10bGhIVmhPMWJ6?=
 =?utf-8?B?UVozejFxSEdzVS9qYlNzZFVlN05HUHRyYUtTNlYvRkdTc0x4V3Y4RFg3TlY4?=
 =?utf-8?B?VVJtUk5BTTBQMk9rMWI2ZUdvdVFPYUlZeU1TT3Q1ZDJqRTNYQWNHRTNFRXBi?=
 =?utf-8?B?dXMya21McnF0bkNLU240bzJwUXlLZWRtc2FObC9qc0hwSjdNTHEwRzlZdFNW?=
 =?utf-8?B?UWRZWHF6NlJsSzF4VG1aV1Z6MDZMNVlTSkExSUpKejl6R0pPcVhRNWtPbXkz?=
 =?utf-8?B?Nk5QcC9seGdyRXZPaXBFUzFVQ1FaaFptSmwvSmxYOGpOVHloTkhwakNNSU1O?=
 =?utf-8?B?WFVWVWMyd0VxTVJ1VS93QmNiVDlrZUJWWUJHTjNVTkJCZ0QrMGw1ekwyQWJG?=
 =?utf-8?B?ZUVPcnBJTWd4b2hOTGg5ZlN1U2V6MlB6ZU1hK2UyRlpVOWdkWlRWdEU0MGpN?=
 =?utf-8?B?NUpPYUJnSzh3a0NtYlNWNURyVVI0U1ZEU2NwNm8rMTNraU53S3F1bUdTRlBx?=
 =?utf-8?B?NG1XQUs3ZVFodG1HYVd3L3BiNGVXQkJmZGltUW1pdjF4d3VNYUZlbmRBVnk3?=
 =?utf-8?B?UlQ5Y2c5aFNzeFg2WmtuUnI3dTB6bnpxbXVObUduaWVpQ0V3TVRVR1pndEg2?=
 =?utf-8?B?eHNZTFZ1aE1lVkxDSVVNSTV4MkdZT05MU09WYVk1UVduZEw0OWJoektuTTJV?=
 =?utf-8?B?RTdwalBEOFYvajFTTWtWVFBIWDRCMXZLNlJEZzU1TUVMMWNEQm5rWC93ZHRM?=
 =?utf-8?B?SWtvQXdDZWRpMXo1T1kxaE1pZDREcTVGcWl4cXpNTkpPaFkyZDk2aHo3QXJ6?=
 =?utf-8?B?cE55RXEzT2I3YWlDU2k1azQ0RmNkNEtBUk51SkpGK04xZjF3a0l2c2o3Y3NP?=
 =?utf-8?Q?p+FNWdNK+EWrY4izMQqS5x45qrlQyQMO?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR03MB6412.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N2tsenA5NWo4VHU2SUhXRGtVaE5RZW5wUnZmbEtvcytQVFZSMGlHMnNMamFn?=
 =?utf-8?B?NFArR0F4T2ZFRDZiL1RIYUIwNXh0VSt2ZVVrMzF4T2NRemxIVUNyeEttWHNG?=
 =?utf-8?B?K2RSN3JYMDdidkZoMmw2a1dnS2Z5c0lEd0pvVTNtbjM4WHhLN1R0Sm5CeU1n?=
 =?utf-8?B?NjFVdXhENkhXMldoQnFvMTcxNXErRGhPejZKQVZnWGpVQkZFYkdIMVh3YlYr?=
 =?utf-8?B?SFhsU2Fzc1BCWXpSbWo2WFhpVlhYSUcrN1JJaHBUdWhUNHhXcGRSUHJUbGhL?=
 =?utf-8?B?T1RYYy9FMVcrTFB0cjBwWWlYSjI3TG5WN0FveTBjcGNZVDRUNEw2WmJKNzZ5?=
 =?utf-8?B?citSMTBBQU83R3ZCbnA3TFBldjZNVzNVeDAwbzRMVFZYSFREZHJxZzdlYVdx?=
 =?utf-8?B?aXJlMUFlSk51cDNwampWNEQvbThBM2E2KzBjci80R0tIN25veFVGb0V6cmNR?=
 =?utf-8?B?YXpCRndCb24wYkQvakJ3bkFGWE56dElZZERYSkh1eGowdDhrakF6YnkvS2lX?=
 =?utf-8?B?Y0ZjeXZIRHZRaHJmTWwvR25TZ0V5Q3hXWnhhajVHd21ONUNIMFU0bHMvSUx6?=
 =?utf-8?B?MUxTZGR5VGVEM0F6VjhkOERLR0ladnpmdCt4VVI5RmZPZi9YR1l3NzJTWXlM?=
 =?utf-8?B?TEVMTlg4dy94RnRWblRqREJBRFJkK3owTnJYSHZYeFFKNytqRmFBWHVqNlVk?=
 =?utf-8?B?Mk1TWkZCQ1V1WEp5ejZCN3RMdnpXMC9tdENkUnNpSjNuQkMzbTNRd1FZWmcv?=
 =?utf-8?B?MXF0UUgrYkVFOHFwcG94ODhnWFRKQzZWSHkvbEt1eUQzVzZEZGVBMTVOek9S?=
 =?utf-8?B?OFh3QVNNcnNtVG1FVmdTSjV6d0syOGhSZTY0L1h6M2ZLRE9HNUlxeWk0TlNV?=
 =?utf-8?B?b1lZVlh5d3pKbWg2c0FYeVV0TUtpSzVQeXc0UmdxWXFIckVMV2s2SmhLbGt2?=
 =?utf-8?B?OTFkZDQ3TFJtYUdvbWkxRXRFMTRYeUJjSFcxZzlpZG91ems5eE95OElLWlFF?=
 =?utf-8?B?NmkwdGdCUitBek1yczAvNjQ4ODRYanFxaWRnZFlzeVVSVTNkNk9RbEZNQmJD?=
 =?utf-8?B?K0dWazlJUldwVmM4bDFXS1FvN21NTlNkV3p5RjR4dVhsb3RTc2NMZGJXd2N1?=
 =?utf-8?B?TENVZy9ERXRhcVdjaGE0cS91TE5VNnRpbi8zWHp5aUk2Qm5GTHJnM3pHWDA5?=
 =?utf-8?B?WHJOZWZXcytWUm9kWUlta3draENXczZqZEZENzdRUHROSFIrYkpVOHhOR2Rp?=
 =?utf-8?B?SXZFQ0lKQThEL3JzZlBzbGltK3NCMDhmTzN6T3RPb0F2akZudjk4THlyY1NX?=
 =?utf-8?B?R3RpZldWbGt6UnJLNFFaSUtscVFHZ1lSQzlkYmNaL2JSdm90T243TU1LK2Rz?=
 =?utf-8?B?VUh3R1VDM0xrMWNuaTlvNWx2a0V5L1dIL0N5VG1mOHI0bEx3SUdqQkp1cDg2?=
 =?utf-8?B?ZTNRNEpKRkZua2Z6Zm1CQ1NGTXVaWEdOY2txSnJHS3NzN0VZS3J5am9jWXVi?=
 =?utf-8?B?RTU2cTNQN25kZlMrdFA1NUgxVFBCMjlBMS9DQUV4YWQyOWE0MWE1TGNOa2Y3?=
 =?utf-8?B?MTBlQVY0OEF5M2d5bDBFSjFqREh0TEkyNURCWGczNkErMndxVVAyV2JxV3Rp?=
 =?utf-8?B?T3J2VkQrOEtsQ1k2TjV3dTFJUHBXQ3dpZTUvSWtnd1pDaFR3dUlXNnA2d2Iy?=
 =?utf-8?B?Yks2WXJIa3pPa1ZiY3JqbjFHYk1vVEdWODB3Tk1lcUd6cU5ma3U4NEpXa0VI?=
 =?utf-8?B?WHpZbkVKb012eFBxRWtFeHFQMlNhNVJ0cm1OMzNaZjRjM0tqSkI2M1dabDVZ?=
 =?utf-8?B?R3haM3gzOXVtdENVVENwS0lweVBKN2VjK1JlMEtLeUtXNldoMzBRZEY2NUl6?=
 =?utf-8?B?b0xUd2JqNkV1czQ3R0VGRlg4bWlnaHBYYnRTN0krU1lNMnlYTHQ2cEllaWkv?=
 =?utf-8?B?TkRwV0JwTGhRRU9ZemN3NXArVVd5T29qdVFBMDdKZStyQkUvWkVrckdMaFFx?=
 =?utf-8?B?RXFhWS95b1lYUXh2cVVBNHgvRzRKNFQyK2g1QWVlc0ZsVnpIMFFEcnVYRDdv?=
 =?utf-8?B?blMwMHQvdW1ZSVlWMHlHcjQ0UGRhcXBrMUZZQWhzS3U3dE1Tc01zdC9xYmxT?=
 =?utf-8?B?anV0VWZ3MGQzNXVnNi9tcGhma090M0ovbFRpaGRzdXBRbzdjc3FEK2RDUjlH?=
 =?utf-8?Q?w5vFJmKioZUfLeQmvqEAK4I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E08B633F61897C41A70FE13ECAA697E7@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR03MB6412.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d32b566-2f53-4f7f-d1e1-08dd6bbdaa2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 16:54:10.4353
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 81naxjS9pYMy1IslIQcEFkyBZP7rY0rjB/PiFK30jfb3wt5yqNcGQ7hGoLiAM0Y9Gp9EzxNTbuloQna+tTr2uMlcGe2gcZ55Muz86gMsOYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB8448

DQoNCk9uIDI1LjAzLjI1IDE4OjA5LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQoNCg0KPiBIaSBPbGVr
c2FuZHIsDQoNCkhlbGxvIEp1bGllbg0KDQo+IA0KPiBPbiAyNS8wMy8yMDI1IDE2OjA1LCBPbGVr
c2FuZHIgVHlzaGNoZW5rbyB3cm90ZToNCj4+Pj4+IEZ1cnRoZXJtb3JlLCB3aGF0IGhhcHBlbiBp
ZiB3ZSBkZWNpZGUgdG8gdXNlIEFDUEkgYWZ0ZXJ3YXJkcz8gV291bGRuJ3QNCj4+Pj4+IHRoaXMg
bWVhbiB0aGF0IHRoZSBzdGF0aWMgcmVnaW9ucyB3b3VsZCBiZSByZXNlcnZlZCBldmVuIGlmIEFD
UEkgDQo+Pj4+PiBkb2Vzbid0DQo+Pj4+PiB1c2Ugc3RhdGljIG1lbW9yeSAoYWxsIHRoZSBtZW1v
cnkgaXMgZXhwZWN0ZWQgdG8gYmUgZ2l2ZW4gdG8gdGhlDQo+Pj4+PiBhbGxvY2F0b3IpPw0KPj4+
PiBJIGRvbid0IHRoaW5rIHN1Y2ggaHlicmlkIGNvbmZpZ3VyYXRpb24gaXMgdmFsaWQgKGJvb3Rp
bmcgd2l0aCBBQ1BJIHlldA0KPj4+PiBkZWNsYXJpbmcgcmVzZXJ2ZWQgcmVnaW9ucyBpbiBEVCku
IFNlZSBjb21taXQ6DQo+Pj4+IDljMmJjMGYyNGIyYmE3MDgyZGY0MDhiM2MzM2VjOWE4NmJmMjBj
ZjANCj4+Pg0KPj4+IEkgZG9uJ3QgdGhpbmsgdGhlIGNvbW1pdCBpcyBwcmV2ZW50aW5nIGh5YnJp
ZCBjb25maWd1cmF0aW9uLiBJdCBpcyBqdXN0DQo+Pj4gc2F5aW5nIHRoYXQgdGhlIHJlZ2lvbiAo
d2hpY2ggY291bGQgYmUgYSBzdGF0aWMgcmVnaW9uIGJlY2F1c2UgdGhpcyBpcw0KPj4+IG5vdCBz
dXBwb3J0ZWQpIHdpbGwgYmUgdW5yZXNlcnZlZC4NCj4+Pg0KPj4+IElPVywgd2hlbiBib290aW5n
IHdpdGggRGV2aWNlLVRyZWUgeW91IG1heSBiZSBhYmxlIHRvIHVzZSBzdGF0aWMgbWVtb3J5Lg0K
Pj4+IEJ1dCBpZiB5b3Ugd2VyZSBib290aW5nIHdpdGggQUNQSSwgc3RhdGljIG1lbW9yeSBpcyBu
b3Qgc3VwcG9ydGVkIGFuZA0KPj4+IHRoZXJlZm9yZSB0aGUgcmVnaW9ucyBzaG91bGQgYmUgZnJl
ZSBmb3Igb3RoZXIgcHVycG9zZS4NCj4+DQo+Pg0KPj4gSnVsaWVuLCBJIHNlZSB5b3VyIHBvaW50
cywgYnV0IHRoZSBjdXJyZW50IHBhdGNoIGRvZXMgbm90IGF0dGVtcHQgdG8NCj4+IG1ha2Ugc3Rh
dGljIChyZXNlcnZlZCkgbWVtb3J5IHByb3Blcmx5IHdvcmsgb24gQUNQSS1iYXNlZCBzeXN0ZW0g
KGlmIGl0DQo+PiBpcyBhdmFpbGFibGUgdGhlcmUpLCBjdXJyZW50IHBhdGNoIHRyaWVzIHRvIHNv
bHZlIHRoZSByZWFsIGlzc3VlIG9uDQo+PiBkZXZpY2UtdHJlZS1iYXNlZCBzeXN0ZW0gd2l0aCBY
ZW4gY29tcGlsZWQgd2l0aCBDT05GSUdfQUNQST15IChhdCBsZWFzdA0KPj4gdW5pbnRlbnRpb25h
bGx5KS4gDQo+IA0KPiBJIGFtIG5vdCBhc2tpbmcgdG8gbWFrZSBBQ1BJIHdvcmsgd2l0aCBzdGF0
aWMgbWVtb3J5LiBJIGFtIGFza2luZyB0byBub3QgDQo+IGJyZWFrIEFDUEkgaWYgdGhlIERldmlj
ZS1UcmVlIGlzIHNwZWNpZnlpbmcgc3RhdGljIG1lbW9yeSByZWdpb24uDQo+IA0KPj4gSG93ZXZl
ciwgSSB3b25kZXIsIHdoeSBpdCBoYXMgbm90IGJlZW4gbm90aWNlZCBzbyBmYXIuDQo+IA0KPiBB
Q1BJIGlzIG5vdCBhIHN1cHBvcnRlZCBmZWF0dXJlIGFuZCBnYXRlZCBieSBVTlNVUFBPUlRFRC4g
U28gdGhlIA0KPiBpbXBsaWNhdGlvbiBpcyB5b3UgaGF2ZSBlbmFibGVkIFVOU1VQUE9SVEVEIGFu
ZCBhbnl0aGluZyBjYW4gaGFwcGVuIA0KPiByZWFsbHkgOykuDQoNCkluZGVlZCwgdGhpcyBhbnN3
ZXJzIHRoZSBxdWVzdGlvbi4NCg0KDQo+IA0KPj4NCj4+IEl0IHRvb2sgc29tZSB0aW1lIHRvIHVu
ZGVyc3RhbmQgd2h5IGp1c3QgZW5hYmxpbmcgQ09ORklHX1NUQVRJQ19NRU1PUlk9eQ0KPj4gdHJp
Z2dlcmVkIGEgQlVHIGluIGNvbW1vbiBjb2RlLiBBbmQgaXQgdHVybmVkIG91dCB0aGF0IGl0IHdh
cw0KPj4gQ09ORklHX0FDUEk9eSBpbiBteSBYZW4ncyAuY29uZmlnIHRoYXQgY2F1c2VkIHRoYXQg
Y29uc2VxdWVuY2UgKEkNCj4+IHNwZWNpYWxseSB3cm90ZSBzbyBsb25nIGRlc2NyaXB0aW9uIHRv
IHByb3ZpZGUgZnVsbCBjb250ZXh0KS4NCj4gDQo+IEFzIEkgd3JvdGUgYWJvdmUsIHRoZSBvbmx5
IHRoaW5nIEkgYW0gYXNraW5nIGlzIHRoYXQgbWVtb3J5IGZvciBzdGF0aWMgDQo+IHJlZ2lvbnMg
c2hvdWxkIGJlIHVucmVzZXJ2ZWQgd2hlbiBBQ1BJIGlzIGVuYWJsZWQgbGlrZSBpdCBpcyBhbHJl
YWR5IHRoZSANCj4gY2FzZSB0b2RheS4NCg0KU28gdGhlIGNvbmNlcm4gaXMgdGhhdCBub3QgcmVz
ZXJ2aW5nIHByb3ZpZGVkIGJ5IHRoZSBkZXZpY2UgdHJlZSBzdGF0aWMgDQptZW1vcnkgcmVnaW9u
IGlzIGdvaW5nIHRvIGJlIGEgcG90ZW50aWFsIHdhc3RlIG9mIHRoZSBtZW1vcnkgb24gdGhlIHJl
YWwgDQpBQ1BJIHN5c3RlbT8gT3IgSSBtaXNzZWQgc29tZXRoaW5nPw0KDQpJIHNlZSB0d28gb3B0
aW9ucyB3aXRoIHVucmVzZXJ2aW5nIHRoZSBzdGF0aWMgbWVtb3J5IHJlZ2lvbnMgb24gdGhlIHJl
YWwgDQpBQ1BJIHN5c3RlbS4gSSBhc3N1bWUsIHRoYXQgd2Ugc2hvdWxkIHVucmVzZXJ2ZSBvbmx5
IGFmdGVyIHdlIGRlZmluaXRlbHkgDQprbm93IHRoYXQgd2UgYXJlIHJ1bm5pbmcgd2l0aCBBQ1BJ
IChpLmUuIGFmdGVyIGFjcGlfYm9vdF90YWJsZV9pbml0KCkgDQpjb21wbGV0ZXMgYW5kIGFjcGlf
ZGlzYWJsZWQgcmVmbGVjdHMgdGhlIHJlYWwgc3RhdGUgb2YgdGhpbmdzKSwgcmlnaHQ/DQoNCjEu
IGVpdGhlciBjYWxsIGFjcGlfYm9vdF90YWJsZV9pbml0KCkgYmVmb3JlIHNldHVwX21tKCkgaW4g
QXJtNjQncyANCnN0YXJ0X3hlbigpLg0KMi4gb3IgZ28gdGhyb3VnaCByZXNlcnZlZF9tZW0tPm5y
X2JhbmtzIGFuZCB1bnJlc2VydmUgZXZlcnl0aGluZyBtYXJrZWQgDQp3aXRoIE1FTUJBTktfU1RB
VElDX0RPTUFJTiBhZnRlciBhY3BpX2Jvb3RfdGFibGVfaW5pdCgpIGNvbXBsZXRlcw0KDQpXaGF0
IGRvIHlvdSB0aGluaz8NCg0KVW5mb3J0dW5hdGVseSwgSSBkbyBub3QgaGF2ZSBzdWNoIGVudmly
b25tZW50IGluIGhhbmQgKEFDUEktYmFzZWQgDQooZG9tMGxlc3M/KSBzeXN0ZW0gYnV0IHN0aWxs
IHByb3ZpZGluZyBkZXZpY2UtdHJlZSB3aXRoIHN0YXRpYyBtZW1vcnkpIA0KZm9yIHRoZSByZWFs
IHRlc3RpbmcuDQoNCj4gDQo+IENoZWVycywNCj4g

