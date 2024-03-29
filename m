Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC5D890EEC
	for <lists+xen-devel@lfdr.de>; Fri, 29 Mar 2024 01:09:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699207.1091895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpzo5-0002C6-46; Fri, 29 Mar 2024 00:09:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699207.1091895; Fri, 29 Mar 2024 00:09:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpzo4-0002Ah-TT; Fri, 29 Mar 2024 00:09:16 +0000
Received: by outflank-mailman (input) for mailman id 699207;
 Fri, 29 Mar 2024 00:09:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZRsJ=LD=epam.com=prvs=0818e5feeb=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1rpzo3-0002AV-9o
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2024 00:09:15 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9281a502-ed60-11ee-afe3-a90da7624cb6;
 Fri, 29 Mar 2024 01:09:13 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42SN0uDx024084; Fri, 29 Mar 2024 00:09:04 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3x5huq82q0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Mar 2024 00:09:04 +0000 (GMT)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DBBPR03MB10269.eurprd03.prod.outlook.com
 (2603:10a6:10:536::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Fri, 29 Mar
 2024 00:08:57 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::74c9:2488:1dd7:b976]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::74c9:2488:1dd7:b976%3]) with mapi id 15.20.7409.028; Fri, 29 Mar 2024
 00:08:57 +0000
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
X-Inumbo-ID: 9281a502-ed60-11ee-afe3-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SA/jWBmZHc64EXnv8XLJd+QVP2pqKMTY1raKm+rmc0WU00FslGLKj83wXBqJU6y5UirxgW9f1Y1N9OxwVlcNFCq9k6ozPMwjjxJRv16UIJmQ82GLJoqhbtFuSKM/5ToS0s54fAFbv6HOj4HZi2cslrTUNpfYsdl89EFZ8jHXbrPdUxZmnUT45oRo9+8ei7Cz0NuqOnLFbCp+nyjrasPLDLmpuQPzR49zf1Y9QMMRaby56Il6fy3FiDobM76kgPjiYJ+4jc9ocao+6Nde2x74NFZGcf/5ZxysyXUM1yi5Xa+y+x8vjBFisgnNxrOJjk+4yQsl1CoCfOLmt73BLCaxVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNwLL5EFtPErBpKqK/PepsfxNRpo4RG+OPLoy/Mv+t8=;
 b=n5K9sP6r//eKRJxD+VrFl7TBJtUED77goKgOrNf0ALY8yLyVXSHctNU/Lm3YlWu8sKnTEslKG8RLhrY6aFL5rmice+oi314q48g7hpWvZMmzltE53CuIU6oRO3aMBuS58O6iSl28aMa9obf53kma/SY3GF5KzRHpfqyv6m486xM1xUi0eNhkHeVMvwkGfF4FFHxJZnfwz7iIsH2DggaUsjafv41e15L3f3OclOUUVfQTi/v1RYe7a7UarF20G2nl3plPEssbNFRHJYH/zYZyj+OObWBKQRbZN/bnRgduqHRDLrqkr4aQVP92AET+7aC5G8upvrb3rQeMuQgg4BiZMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNwLL5EFtPErBpKqK/PepsfxNRpo4RG+OPLoy/Mv+t8=;
 b=YQpgV3sMUynw2xAZIqaVjc6eYfqOe5+NcJd52SHY1yvJ/jpdPrv+88WWnFJYPCj0V7/ShKuwHWMZkDUya1IvL3uEv4ti1t6fUcMqESXjhIq/zaLDL9SJ8Jugi6RPD3sNn3chi46uMgEoIGcKrPAJuNLNdfEOM34bMckkk84QWj0p8HBD3SCgNrLwpbPGealvIUazimwgkb9S2Q3Mhkrzq8eJ3jjgeTOWSPGZBDIKpy9MFOc3G8k8+q/AJF10l850pZHKSTnH27KYhF5+cnvwgq1UlFtUwFl9vUvwTW8KIEY5zIHzBDyZFj9ZEZFx0g1F+iJOUlulk8m4TeRJFpFa6w==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Julien Grall
	<julien@xen.org>, Rahul Singh <rahul.singh@arm.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Michal
 Orzel <michal.orzel@amd.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap
	<george.dunlap@citrix.com>,
        Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH 0/3] Add experimental support for Qualcomm SA8155P SoC
Thread-Topic: [PATCH 0/3] Add experimental support for Qualcomm SA8155P SoC
Thread-Index: AQHagW1KwAubBrJ/1UWKSSJWd4T4nA==
Date: Fri, 29 Mar 2024 00:08:56 +0000
Message-ID: <20240329000822.3363568-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.43.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DBBPR03MB10269:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 dJsUJl/endb+JG5VMeNBXAnO8XOFNIsY2JtyPWKaCXmREraIkSX3iLZKk3jqa34rpBfA7Bt8h2HFP1gAnHssO7EgLsRCS7f3gV5+TummA7jk3dToAS2tupI7HtMhhL/ib1Xgy7Nawbpk9ZSsrcmdtfGcWeRMTn3I0HdPqKd0A9UIDjOX9QgbAP73x1QQGdXiOXTYme9LNLvPbyU2vSh60Q9h9EI5akM2/2OwJ6B7/yeQbKIExQ3jmlG4ulPSMGATXPrvVr3QW4qCHwpQpiMGipdwN1jJWMyfn4jxCzf2zX7C1EjzxhvmQS7iE1HU/q3ZyP4N8v2QTTsACsdKqDV4mwbJhwCA0CCRAaWK9zYKZ0NbWLr5Fn658txpbwbknmoyfBLIpvpeacH0CQlSnDeq6WSSkvaDiWLLAs3X8YJQoh0m5db1my2TO/Rd6OGl03PeN5ddn7kbPwsAOxRNWU5PmWAtj45F8N8tmmU7sYQ9pxBMXWuK/naj1h5txOS3mOkt+1RG9WDw/NBfJOMh9n9jxADdwIYqCSJTHZAJKBjI8eYbqD6cWMCj33Ie1euTXtS8G6DQoCimJC/T/hgjhWQKqOz+ZhZE2PfwW4SG81GdzBlpY/1F2HnypLpWiw+jj3arMHKZBZtlKu+NTKoMzEM4gqp7WW7Zpy/ooEuXIwsdcF4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?oYzTQY32RXyAWB/AjKjzP+i7C8wtXpKBy9KEWqTUZgF6jnfTHn/YufuI8o?=
 =?iso-8859-1?Q?572P6YfFy+EGmd/tGeNf5H91pwT2dvgHfjQoBvFEPG3cjIfJOl/JmEfYqX?=
 =?iso-8859-1?Q?OWqh638y4rU32RXBDcuBxXD5rASZnlfl2c1DlnYrBDTFZ8LBzoxT2PtDyp?=
 =?iso-8859-1?Q?LRdes7gzGw8Znu4eK76n+x6uag06Ky7lU1AI3n6oTz7XU83JBd6OZ1tdxe?=
 =?iso-8859-1?Q?UHKOMdXDFpB61sstF73hvb/3D38zBdB/m0EkBIq9nW7fQUIYxcAiTHvMjU?=
 =?iso-8859-1?Q?N7LCxfuXLbUO86dsnXbUvv1Z0LuDup0amur/Cd5OIaRU6P97J5IS6jGR0y?=
 =?iso-8859-1?Q?1oRDBZsu8vdZ8blZF8PPmy+1hnUSLl5+X7xkbMtcTvBbJW+SvMpAke/yca?=
 =?iso-8859-1?Q?NG1buuPz6imFOEg8RRVqnsXjptq4pTP5C4tK5U8Cl3oTuFh31hp5B1nwGV?=
 =?iso-8859-1?Q?wMuq1ZDzUPge1Db3hbEctg84wB2xVhRIj4kiidQIxo4kTAlEnsJY6zv+QT?=
 =?iso-8859-1?Q?CrSA64AJlS192ZqcJyE2kI0PFDkJvd0LnzUKd3LTCXwPqFYKGB7wj/+xF7?=
 =?iso-8859-1?Q?aBE7xZZKmzC+OObvEUSiJ/PKvmcbFw49EYM+J97Ihw/xi98ALYVEF95bq/?=
 =?iso-8859-1?Q?prfuJpomUgE0wlSWd7Bj4QVGyavu/J6zek8qmGSgm7VlnTQEjUo24tEeTT?=
 =?iso-8859-1?Q?7tWDi0kR/4uUesGF3ZCdLzXy3tRtC9uXi6EZfM0nIMjszSwUGx4lwZbgKF?=
 =?iso-8859-1?Q?Ue2byEJEnCeI7L+H/HCLVjvhHGST7PeJOL78KOFJdDDaFBCcElBtsgwd3H?=
 =?iso-8859-1?Q?RME8npwLXLKQnJZyrXKvskoUnvu0EZfO8MZLoABwGRnINvGjlVk/tqqzR4?=
 =?iso-8859-1?Q?cPclkYCDYHcGi84UDseqYtmw35UmfKw+D9eOmnTZk5LkA2STCdbB+ZmzP2?=
 =?iso-8859-1?Q?h/SCuP/H8TavDY9zkgxmudtm+ZbKkRyvXhF/1CfRJUvsTd0QUA1Lv1DaYE?=
 =?iso-8859-1?Q?JRHKlpSiWTJmTtdvOOiByuvu2EZKv9+vaUC48fFT6q3g92ZJ+iEMHEb+qG?=
 =?iso-8859-1?Q?OZHa1X1gJrAqfEe8+erS1r75Q+NL6B6PByfQOPbI4AYDoJYOXiFFkP76jx?=
 =?iso-8859-1?Q?4aLzZylujOyDqdnCIN2J6nYVywzv2zh7OdM8IPc2W0NqqSUcdPb+fDlmcH?=
 =?iso-8859-1?Q?i///U6Oz+ZF2HRgwT048sQb9P7SUEilFhZI1aEjHZJSc5ul+m66XCO6JWl?=
 =?iso-8859-1?Q?eeBB81J/os2i0jsUuAgTfYvTvDHuFjTappPeAyPjVAG7Gm+bGwtuRRsQdz?=
 =?iso-8859-1?Q?At+BNfGs6r4O8sSXDDdTHBoz1At7b4P53ZEVvy0TMVLnZFhL678th+SWWj?=
 =?iso-8859-1?Q?6PnPrrVT/YyOUrE8xIychtzRutAVkW7MzkhjnrmX7btw40Y8pXyqXZ0Cmc?=
 =?iso-8859-1?Q?XmdIKbE9SZgvnBa22VhwJekodUg9cvmpKOugLz88qCiSufeZKsIJLzGg+N?=
 =?iso-8859-1?Q?LfqMHa51YO21utegmxyeyy99uP4e/rfp7x/U3m1VXFli/f6b3Vdrj9y6d2?=
 =?iso-8859-1?Q?rh+0QH02emFKiDEWfFpliyZ51fuatG2cEenFjnlACZ9eilby2BRhqy6TKj?=
 =?iso-8859-1?Q?dqp4RWQzO47Ct74VRiRiLLSH9xok14+MEStdbpzpxbTtW07C8PsHYstw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8947ea38-cfe1-4d2b-cbad-08dc4f846d6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2024 00:08:56.9659
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4sP7qo9fFOV08c3hqivrQDFUmMcsOytlQeZOQ3KdByNrsVh6QKCdqcG3LY0prZa4NkteMV2lqeAd0Yu4qmJs8vmih4uxtj8Dmy4/2l3Hogo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10269
X-Proofpoint-ORIG-GUID: 6lC2D0-zenb9ZxxizFSYELvLOOEFJOXL
X-Proofpoint-GUID: 6lC2D0-zenb9ZxxizFSYELvLOOEFJOXL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-28_18,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 mlxlogscore=657 suspectscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1011 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403280176

Hello,

This three patches are all what is needed to run Xen on Qualcomm
SA8155P. At the time of writing, I have a working setup with
(almost) mainline Linux kernel in Dom0, where basic features like UFS
and networking are working fine, but more advanced things like GPU are
not supported yet.

Volodymyr Babchuk (3):
  arm: smmu: allow SMMU to have more IRQs than context banks
  drivers: serial: add Qualcomm GENI-based serial driver
  arm: platform: qcom: add basic support SA8155P SoC

 xen/arch/arm/Kconfig.debug           |  19 +-
 xen/arch/arm/arm64/debug-qcom.inc    |  76 +++++++
 xen/arch/arm/include/asm/qcom-uart.h |  48 +++++
 xen/arch/arm/platforms/Makefile      |   1 +
 xen/arch/arm/platforms/qcom.c        |  77 +++++++
 xen/drivers/char/Kconfig             |   8 +
 xen/drivers/char/Makefile            |   1 +
 xen/drivers/char/qcom-uart.c         | 288 +++++++++++++++++++++++++++
 xen/drivers/passthrough/arm/smmu.c   |   2 +-
 9 files changed, 518 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/arm/arm64/debug-qcom.inc
 create mode 100644 xen/arch/arm/include/asm/qcom-uart.h
 create mode 100644 xen/arch/arm/platforms/qcom.c
 create mode 100644 xen/drivers/char/qcom-uart.c

--=20
2.43.0

