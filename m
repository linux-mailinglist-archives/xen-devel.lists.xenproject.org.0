Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFB0C4FAA0
	for <lists+xen-devel@lfdr.de>; Tue, 11 Nov 2025 21:09:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159304.1487668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIufU-0004NL-Df; Tue, 11 Nov 2025 20:08:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159304.1487668; Tue, 11 Nov 2025 20:08:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIufU-0004Io-Af; Tue, 11 Nov 2025 20:08:44 +0000
Received: by outflank-mailman (input) for mailman id 1159304;
 Tue, 11 Nov 2025 20:08:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiuT=5T=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vIufT-0004GQ-5C
 for xen-devel@lists.xenproject.org; Tue, 11 Nov 2025 20:08:43 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38356c6b-bf3a-11f0-9d18-b5c5bf9af7f9;
 Tue, 11 Nov 2025 21:08:42 +0100 (CET)
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 (2603:10a6:10:435::21) by AM9PR03MB7758.eurprd03.prod.outlook.com
 (2603:10a6:20b:3dc::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 20:08:25 +0000
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584]) by DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584%6]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 20:08:25 +0000
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
X-Inumbo-ID: 38356c6b-bf3a-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pRAeooyAsCeYSRv/h/YNEnXoMyuondtk0jwR+mTEroXAofXdjAfjk8rYC0YyL9rnTjB2bJmkSMVIrRnIScHjqJ5Qlz1hGUdmLaxTkbZzWYvkJIt7fErKyV9/2dJcgNQHKnMjrMlfV63xizzNAdRRyWvex/ozZUNWuAL0R2xcd3XcEdQQB8NaH2dwYHMh1hq1N69wGLhvUeBuqVVRwPMvM4tSQTWJ9iNgZgAtqSHZV2lBQhepgpcsTEK3tOm6CJIEE3x1iMTfZoaRAAiZ3AuK7c31BF2mMjzWZ9NhsEbKnIAy3BCjiv6g/bRQcozuTZvb61tUMVhHSV2BPBqHcgPtmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avySyVoUNnEQXlDAooPk+JX3+HVzZzILNmAQk4gwOnc=;
 b=q6iXZv8uoQ3ALV2PMTYA+pKQBE68CAwbbbfda4fUiG/7wiOE4a3H6RIKmpnMCMhKFnARin7htXNn6XF6yd92vHbzK7oIuDEiNqcdhE0gJ59Qz3uLaETLqB0YkUSs8otRn5FHOoACBqBDrS5wsRZFuT/Ifoxz1Yxd+MUzRijphoEO6sFPFnNZG3kqFeXMTfgOjOisVJjL9zjGcYMPMr4lli0M8TdPjMwyrjul1NT8GGfpoWfiIRiY23U1d19k/N4Xehwyon5lzSNkKE4MRxaL0prpyV+UDyNujNaPIBr31XiED5+3MI58BTPnCxeb0KR7XLb2KsJumtzFeQqSta62KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avySyVoUNnEQXlDAooPk+JX3+HVzZzILNmAQk4gwOnc=;
 b=AOCkTYR+CaTcLSefsXjPbRa7LarXcZ7JLhh+7dBncM5bqAXy7VnYlag2fcKbBjORXXwtgzUE9RTrJkgqApYEXejFofF1SlulSsTOn+CC/cQF1z1oGPg6q5ulsGIdwdxm+4WI1nkLwDx57maXCbppx6daBZO4IGiwG+GASLy0A0thzJHCOD3pcMseNCooZDZh2BKZL4L3akGvJGexAoyaldSgltrF6B5laSsPIcn1JI8v0pj2M41nNIuUpT6l7+wD8QwIdKgY/ytqTnkSOz0tpHYivyTiCOpGV5XgdvLEWGjcCoEieNAvwrjg+RKpOdMh276xF5u0PGnDpqGit8TBlg==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: [RESEND PATCH v2 0/3] x86/hvm: vmx: refactor cache disable mode code
Thread-Topic: [RESEND PATCH v2 0/3] x86/hvm: vmx: refactor cache disable mode
 code
Thread-Index: AQHcU0bwuQvBODsdvUmnszqCxPJRGA==
Date: Tue, 11 Nov 2025 20:08:25 +0000
Message-ID: <20251111200754.3575866-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR0302MB8919:EE_|AM9PR03MB7758:EE_
x-ms-office365-filtering-correlation-id: 2d998cad-9a8d-47bf-4eda-08de215e12a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?NSC2DJ/v+a5ztusy/VaunIIgsFhEm95kouWdrURO8krbEoNSRcn6bKiAiP?=
 =?iso-8859-1?Q?nj2HBvhV9tH/WdHQ78psByHr8TqJ/vZ+K75ShtCNboLS2Qms747ATs6CjA?=
 =?iso-8859-1?Q?txmhwsGlylvQVzLE14tqV19yNraWSNsw4s63ktEgCQDztguM/u0aIbqtWq?=
 =?iso-8859-1?Q?oqMKhHvWvQ2ADiZxKd+gKvkgRnoNHGcoKm2BOw2b0OpbMwpUcAypuD0Hto?=
 =?iso-8859-1?Q?JFhkMy6g+jQDWXxsN0EfcJSRDEMID2csWchWC+XsJEdDXU6nh02RaRNH4k?=
 =?iso-8859-1?Q?+g1fcy3Q7Mjuw9VljD1jD1J3UxQ65AWePEcl1I/27dmTER1l/Iy+W+WsXZ?=
 =?iso-8859-1?Q?EowT+F75f/7V5Zemrsa2AjjTp+FB1nhC4US7Em78r3C+mTLTi0PBdkCDSD?=
 =?iso-8859-1?Q?Y4pTlmZ+5wpD0NTerOaDhX/dUey0z89pJlAmVSrgqsUKrqu+dEQ0p7BtFI?=
 =?iso-8859-1?Q?RHJSUhfC2yIve+kaZIQj/eu/KbkCdeNLydXyBAnayXBrwCjeWGLCgb39jQ?=
 =?iso-8859-1?Q?/nU0g1kSZtftNnomooAlYXdX0ahXQocIG2gn1OtXbaygG9H2OjME4egagW?=
 =?iso-8859-1?Q?UHVkTgQaaLjKSjyJlymayECjsPE3RX/3T/nc8XR6639bZ73ZOAPbwq/sOL?=
 =?iso-8859-1?Q?y7h5rV0aMtgYYVwC/bUi1lx5eABWLF3DSj/+t7Fy8cH7Qd/ExJjd7RnN2x?=
 =?iso-8859-1?Q?j9zGCepTSrbvbYyKhBPP4faWT8mRoWpHJV2EZjHDpvdKvDjYZK+sAcGF2C?=
 =?iso-8859-1?Q?hUhQkIuDNz9CrYhqsuvs/LDAm7nHvqn4EXsTTKXuSqq22eqS+hhb5RMUOp?=
 =?iso-8859-1?Q?loEyIoNpEbw78GDGzTkFgamPlYRCRsIbqxsTr7K/rS9IjRFrUJ5XCZjCZk?=
 =?iso-8859-1?Q?QKyDTorJ1zZ4Wd5RnG62qZb7FAle1bTzjA/H5nFqvceyAoGwamcws/EuJj?=
 =?iso-8859-1?Q?KPdwvkNr8iYynLGoKYIXP5Agdx4DvqGYOhWVHYEM0b0n62ehAkwY5uhEFK?=
 =?iso-8859-1?Q?E8fna2Yai1w+vzdh/EtDlkMMw7WJkoqELu7MAYfFnYYM6gj3UbDGt/QAlw?=
 =?iso-8859-1?Q?TWPNd/cuGwL1mBGUAMDj+tYVuVa0brnepcLek91D5M7V8PZSiPrXcqGf3+?=
 =?iso-8859-1?Q?D0koQPWQOI40Qb5sqnfkeEdBnx41bVN7EqCVxWlGcIglcwRNXEHFfNvIGu?=
 =?iso-8859-1?Q?EZJKjv4OVkXsQ6JRfNKE2QehN1sDcV38bY+keEeTwyc/Xil0DYguU6R8wq?=
 =?iso-8859-1?Q?LH+QJaoIxdlQkhGJzOY/S/qcHAtjNNyMZKHELe/cHXCBxKRYZoSilvS/CZ?=
 =?iso-8859-1?Q?Z7g2P7FQ+1yTySDBN87KErTiZvB/JETU93RqMH3NIcn3vKokmnxZIloDLw?=
 =?iso-8859-1?Q?LG5Rlf/YOMfnliHaXnzYkJPW/mSNkT3qL5g4VyWLOgdbJ8i7LSL3wmnwF1?=
 =?iso-8859-1?Q?PDWHILasrhEHFHE2/Mg/v/yr364Hcd1e3ejGMEOfQJQ7pgSMQTatOm22cn?=
 =?iso-8859-1?Q?8mZcatcQNy0fgV8mps/CysCJzQ8/63sGw2NQ8zo360QiCpt2uVNO0wtYDA?=
 =?iso-8859-1?Q?0AJVxOQewb4YndMWAwawxaf0k5ro?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB8919.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?mPc7h5VwtwBS+ljxFzxZ68Xp5Tb1Ju6wSCDZL6o2jsCyywye+EsZuSu8BJ?=
 =?iso-8859-1?Q?tpdHhEZG5mAOb7/r5NGyaMK4Y0Zhc6uPjc5iTG8GjHLY8aEw32DEMMTMVv?=
 =?iso-8859-1?Q?L/Jg0uRPdYF0uibhWS0zbLJsOXyjf6P2LbVdvSGPfUwuIS7auKJGL+wU7t?=
 =?iso-8859-1?Q?7j1GPNgKW0FNaR32xTd7ci+Soj26+42rMXyggyKBv+c/Iy+o9ID97E3PKj?=
 =?iso-8859-1?Q?Ti+MPjBeKaitPoxoHRse1VSvvONo5RgCqOutn4JpWkfb7oaWMyCYX00D12?=
 =?iso-8859-1?Q?WHPfRjy3UFO1UMjVbTCK3hrx0QgH8VzMgYOd4DD7tZLoCmnSOiVD+vRTRr?=
 =?iso-8859-1?Q?F+R+kS25ljRbVPswMy9go7d/o3n6dVw/rIy94QXUBuKkGgIn9IhDsKzvyv?=
 =?iso-8859-1?Q?qWoxPep9v3YRlHaPPQhmdq5WkckIP6S+ln/yiMq6ulBuDrFP0SzqeBcQii?=
 =?iso-8859-1?Q?gWbJwocMlDDhjs+2XRO9FifjAigKRuGyqwhHqZXNYfCCHRnAg+jJzxpLQ/?=
 =?iso-8859-1?Q?YcxtryszIZH2cY6qXOAARYe+qgLcwuDS4S4eM9uY29hAf8KlURh8cG8hwi?=
 =?iso-8859-1?Q?zw1k6vZLkUlp3Gjpbis4yqN320Ef1wDCkSZyMUFt9e9BekNcRuxtLpzBgz?=
 =?iso-8859-1?Q?ccFI0Kd3/kAxocHeSsEf2WYjhn+3emffBPxTrgVtkgjKgHqzlC4fUNLC3x?=
 =?iso-8859-1?Q?L60C3WmrEf/vPsqdH+evi4pq6rDJp1pRsCicZNSH88OwDDxcja8rPuPE/G?=
 =?iso-8859-1?Q?RABnvLDBD3F7xaPpIpIiwaei9+hLZiawaYV6H8odBbmzMDck30gJ+3A8Fr?=
 =?iso-8859-1?Q?XJfy1fL8LTeYI09ZByIMCmbVojXNDjvsIgO4x+bIgyTfl4raG6a3mO2H8l?=
 =?iso-8859-1?Q?OIXAQlPqeXAhCqsmjOMehE2rXYfnj9C3Qgfo0rfU6p/13QbRQgEcBkNVz6?=
 =?iso-8859-1?Q?ekkrAZYOo8bM9xHXV1WNJbuDHeUTYLYuCtXwIgBo5ZI40lNNjnnHhgzgUu?=
 =?iso-8859-1?Q?utU0uoJsEaV8Ix/u1pk6BRC6fP7elSDjDqsLLIi4A2+u6o1R1nAY+7E3uB?=
 =?iso-8859-1?Q?xPnoNZ6l3B4wixPUosWFpHp4YE2SWGzAAjQzk3TAq8jgnAw7wTJ7vvTFPK?=
 =?iso-8859-1?Q?B+XW1csicfUxhiHXh80/Qy1nC99UlF5nG6UlLhko8tVE2GTFMEmr2nXvgX?=
 =?iso-8859-1?Q?e9CGs4nuy8UtCmys1IUtg6jSIuYGuh0p1kihhblzQvWHxze4uOdHobuRj5?=
 =?iso-8859-1?Q?a9Kr5Ei/Xz2B2/YiNCfnqY62xQ9C1jwESQLikeV7BmlPAN97HFH//QWKSx?=
 =?iso-8859-1?Q?Z93hhx25YrejR7gYsIUKxlFrXL8eeB+hg1BZOs2sDCymEhO/ZCWhnZ6jyo?=
 =?iso-8859-1?Q?77KWBeNqL95sQMsGThFODqRTeGGLpwARe/TSYlVBYhvLJ39Htia3X2NOpn?=
 =?iso-8859-1?Q?TiVx1O0eloowJar+nieNVHn5IfK9ry7jR5qEyUG16JPExlgu1DoV3MucuC?=
 =?iso-8859-1?Q?mKNS0cwrryiFqE6+gRmdfuVU5Cax4Nbab5PaorcUt0ymyxzaGOp425aAaC?=
 =?iso-8859-1?Q?EHa++ouCllDWb7Gyp5O95sfUnPMEe3FVaLBo3Wj+BVxyqHQJ4V/OnWeoom?=
 =?iso-8859-1?Q?r0rXLy+MFys3mR/aqtBTBAgJwW94gQVXoFgGZqoQNaDXmgWGyRqxtn8w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB8919.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d998cad-9a8d-47bf-4eda-08de215e12a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 20:08:25.6492
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vIpXLHFiGTm/TtI/4fe8VP7HGZjLZALSL6bTDTFJrBhm+cLoAOUcJkYfPJ3ufwD4c8aaa5roxRfC2A8BxyAwzRPHL6+ck7zWo3lRltHDies=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7758

From: Grygorii Strashko <grygorii_strashko@epam.com>

The cache disable mode code (hvm_shadow_handle_cd()) is relevant only for I=
ntel VT-x (VMX),
hence:
- move hvm_shadow_handle_cd()/ hvm_set_uc_mode()/domain_exit_uc_mode() in V=
MX code
- account for SHADOW_PAGING when use hvm_shadow_handle_cd()
- move cache disable mode data into VMX specific structures

Based on discussion [1].

[1] https://patchwork.kernel.org/project/xen-devel/patch/20251023151903.560=
947-1-grygorii_strashko@epam.com/

v1: https://patchwork.kernel.org/project/xen-devel/cover/20251029235448.602=
380-1-grygorii_strashko@epam.com/

Grygorii Strashko (3):
  x86/hvm: move hvm_shadow_handle_cd() to vmx code
  x86/hvm: vmx: account for SHADOW_PAGING when use
    hvm_shadow_handle_cd()
  x86/hvm: vmx: refactor cache disable mode data

 xen/arch/x86/hvm/hvm.c                  | 59 --------------------
 xen/arch/x86/hvm/vmx/vmx.c              | 73 +++++++++++++++++++++++--
 xen/arch/x86/include/asm/hvm/domain.h   |  6 --
 xen/arch/x86/include/asm/hvm/hvm.h      |  3 +
 xen/arch/x86/include/asm/hvm/support.h  |  2 -
 xen/arch/x86/include/asm/hvm/vcpu.h     |  3 -
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h | 13 +++++
 xen/arch/x86/include/asm/mtrr.h         |  3 -
 xen/arch/x86/mm/shadow/multi.c          |  2 +-
 9 files changed, 85 insertions(+), 79 deletions(-)

--=20
2.34.1

