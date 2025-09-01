Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F996B3E61D
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 15:52:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104843.1455892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut4xI-0007eT-4L; Mon, 01 Sep 2025 13:52:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104843.1455892; Mon, 01 Sep 2025 13:52:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut4xI-0007ax-0D; Mon, 01 Sep 2025 13:52:20 +0000
Received: by outflank-mailman (input) for mailman id 1104843;
 Mon, 01 Sep 2025 13:52:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5fby=3M=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1ut4xG-0006av-B2
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 13:52:18 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id defd040d-873a-11f0-8dd7-1b34d833f44b;
 Mon, 01 Sep 2025 15:52:16 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AS8PR03MB8345.eurprd03.prod.outlook.com (2603:10a6:20b:509::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Mon, 1 Sep
 2025 13:52:09 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.9052.014; Mon, 1 Sep 2025
 13:52:09 +0000
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
X-Inumbo-ID: defd040d-873a-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ufV1vh22QzNBZooJmDcZhXw4ltTasjg8jveipCB7H/TdLkd7gqoGv33ZWIizcvTmu82xSPFIx7z3+AiK9HVthDWZAX607h2kAWzdauWVpeXPtxsQhY1u1cMVjx/8WJlrT8dNK6AaZoTeg9ALZU3mZ9AvzmIxW9bVCiSf9aXmy1burh/RMiAl7ykz5dVT/5rF4o0+zDsDXa6MUrBaN22qmjjyZxL0VGi4Fj0BZsLuAn8gvQ9Sz4Yf4gQ45heBwx4RRugljCfkruxDa9sAgY7fW4XQ+tJRDgjQSgmYkzzb+9ZpPAHxe2Kp11aOaEYhSl6kP99Stvo2XfjzBLdv97DEvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3mH/Q+UIe71a21ipIJ6DBTYyhkE/5yqBk24pjbzPWL0=;
 b=EgFbRRZbeJldyLcmf72PnTy9GSoc19T2UMrzdQoVCSsukGsL76mR2YuutX9A9qzFNVqh4En2/dIY5wJfQVrNo6hq6+vWdr5q3EBeuO3/ZOnx78aAWJ2tZ8dwADKjXAdkXbnporjjYxgJ/vSKA0ODOXkTRAY3TUIxJkSonJvWk3EUEe3tC0aGA6tQU1sey0Lh4XdrPF3xYc2jei1JrJX60JwAhCstl+WT5ct14eqY2yVey3lDwHVHPLU68/P5I9dPofZtbkuVXc8oQ1dULEpjKZLuMKtHOLfLqCdihHH5sWFPNqmbJ6g4qqdK8Q35mDRZ1g8y8YQK/58lQK4EamSlvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3mH/Q+UIe71a21ipIJ6DBTYyhkE/5yqBk24pjbzPWL0=;
 b=AiN9hlgv96W7NpvyvLSJ1PuI2lp4xJ6nrJ5DrfxhutDwHH19Ajz5r4vh+PQkVYjbyqRBVSAotvcSBDjBhbE3poEy8fIIKHGaXPkLdzYVv3ZdsqrWL27czAvqUG1YJihBC7E88wKOmr9Qh7CZPAIBXT+OAv25MskucIABvbdHNScFMkTI08n7u4PgLm2cq2U4ArmCD2cnAy2tyJkDamfJdyhipIK40e4oFbvkpfQpznmiuSeEu/yE9GnmMaqYtFnjGnpdAOKZcUA3ACCajSIkPdVgZElwQrIwXN9pT7Dzm1HIV/S5H9ZrdVnMRcA9bfbdj1H6qgm8I2RLlRGnDJQMDg==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [PATCH v7 0/4] xen/arm: scmi: introduce SCI SCMI SMC single-agent
 support
Thread-Topic: [PATCH v7 0/4] xen/arm: scmi: introduce SCI SCMI SMC
 single-agent support
Thread-Index: AQHcG0ebYanbJEa5qUWsxxb4FhV7ug==
Date: Mon, 1 Sep 2025 13:52:08 +0000
Message-ID: <cover.1756734682.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AS8PR03MB8345:EE_
x-ms-office365-filtering-correlation-id: 4f53a574-5e2b-426c-7b6c-08dde95ebe82
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?pzqLBh44GP13ZjR3r1SR+ZzR/WJKvOJcKQLprBsgnUtdyG2F885d1py8tA?=
 =?iso-8859-1?Q?FMvQXHjALTXK3aclAm+7oP38YI58s9vgN3+M4XDXj/4Zxi7WAA4Rz4N4eS?=
 =?iso-8859-1?Q?8298AbCtmL3+jgKafhvGIAjxWwbI/tVIx3OeVaxS09+MXcPfBab1tH4CD2?=
 =?iso-8859-1?Q?ifeSiCzy4NS9/HoHt/RN66qP/Zhl0SJz3K+seEusAjiImaeJoih1PUvwuz?=
 =?iso-8859-1?Q?fnKfOZfbMkqiedWIZD6Zdxf5sszUhqvk0zJ3gq20iwxR+v2JAcgdocFyws?=
 =?iso-8859-1?Q?2hQKZxy/Dvyop5+EMzBunjdQfuzNPF63rdh8ImTqjGhSnZBEh6lQuedkIs?=
 =?iso-8859-1?Q?tGuan5fY/KYQXqmWZqTLJG4uSQ0rMLpE2Te2Y0thJBHkk2AxokoUXU88ZQ?=
 =?iso-8859-1?Q?Na4Nt0xGzw3thrlzafNuEh48s2o0ntxNh8Y7f9lDAJHLTmS+rCQb7UWGub?=
 =?iso-8859-1?Q?Qk5uFYFPWs/cdLwIKn6akVmyxEW2IC1SVVHuSxWeBMPoSuSTB5xlKPGFDO?=
 =?iso-8859-1?Q?z8cPCuM7GksdCLf7LkwLbMWMTm0Vz+ipmCtDdTvA8WPONiTjLd+yYrO3Cb?=
 =?iso-8859-1?Q?S63qDOeAUpqUXbJCn093IQ4PNn9zrRlrjf8U8vNiehka8Fs89YOlwBQfaY?=
 =?iso-8859-1?Q?pU72A15jRZL34G40eau8XRA3H5wrkve4/MPPPTgnMEf7liLBNwXQq1Hbz3?=
 =?iso-8859-1?Q?W733AUFYOawxMQ+4/cc7LJW4zRiGVV3vlbbjzZY5gg3+zUxJYtgGMSWKE5?=
 =?iso-8859-1?Q?bPZnzRj7IeeMarueuvCPBihL0I+BFBUhRRKYlrltcoNt47qZOivwQLxROw?=
 =?iso-8859-1?Q?Xg6tsVu1Ox6j5VhiP6ADePIYViliN1+bBswIhtyfJXwGSaXgfZ7hVnxhsx?=
 =?iso-8859-1?Q?/KKL67mfHkOMyRzF4e9rT5+Rrd7XAnvpEnXqwV/iHen4rQeOpdRkzcQhvb?=
 =?iso-8859-1?Q?TcHBlCy5T7GEJPsIcf+LqpkHwdjh8I6CQlA4aQYlebv92oQnpsKiogTeE1?=
 =?iso-8859-1?Q?5ENOHFqbNvBV7Oic3Ecfq51ApDe8OP1+H9alZKNKQYKTxy8Cj2//fRuJn4?=
 =?iso-8859-1?Q?yka+wNbr9v5bfoPgf2MCoShDgvtniwWfr+woXE2MIXTOdKeE5phFoaCqDn?=
 =?iso-8859-1?Q?Y4LwX7gSMw7wiSm97OwExqx80L3Uyk8EJRjaS5w9qM8pKz/imVVvv4s33/?=
 =?iso-8859-1?Q?4TevXolEPKyhCYnAzgPO4BtjNUY8pfZE5ga1f95yzFmDK7KZHwSlLLqaLO?=
 =?iso-8859-1?Q?tt27gyC6SAfK+TsYaiMoZ1FGTR25eT3yJ6+XuMHl5D8swhu+dB5XlvHwxn?=
 =?iso-8859-1?Q?0ZCxBTwgl8902vHwPY76FAuMubUlpjuDhuzWPDLmt3KZRXmKHx8xbeOLdk?=
 =?iso-8859-1?Q?UrYG8fKhePPp33Pe7yLB69QIq06ja25JRdJzQ5fTap+Tb9mb1CF82o4rN1?=
 =?iso-8859-1?Q?XwGRE1FOXXtSopH71vpb9ZauwAMj/CSAgG/NN1Jh+Xs8mOCvetBEy9P2V2?=
 =?iso-8859-1?Q?U=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?sydxVOt9hOjDQ94HWJSDe5iRt8Q6CJ/wfAHEW7pE1SoHnaX7ItxvpubtX4?=
 =?iso-8859-1?Q?1/8seUtZonVeMEAnjt7tmDNXlAUJXTv5/Uy7+Sy3AC13iW5sYtDGebxoqZ?=
 =?iso-8859-1?Q?65NkSeNEas3bfe6rvS1t9BTQcOiWDpxRxDFtqDlJmKuyWBg5R3k9qLWo23?=
 =?iso-8859-1?Q?Xf4OsdTwwJe9gSnGCGxL5o5UCsXvIzigDuEJ/qzfuRhk3sNp1A3OfkYCe1?=
 =?iso-8859-1?Q?8pn4eyhXLuo76fxSUQuZj2C+S43Xb7B7eUUxGRpCJFPDU+JkzsvaGiuq+4?=
 =?iso-8859-1?Q?svhAl05FEund+Wi6jkZ/wMia4SfncvU4q/+ZLLps86JBfPO9/Wz0cAqAee?=
 =?iso-8859-1?Q?L0eMqDeH5+5HbJ432N+yD0f4/y69hbEQPsDTCO21UFVRaO6ElOWM+GXjZk?=
 =?iso-8859-1?Q?niYBJP0iiK+K+fBP65TACR3GbmG2i7YNb4nZfgi3l/+dA0xn5RKdSx757G?=
 =?iso-8859-1?Q?LzrWg2+Mn2rlsT/hRzyQ/QhCuam11u6CoCiXnl5W+AvFtKhH0kpfOoNzoC?=
 =?iso-8859-1?Q?yM8X0bJ7AGZwq0bJAjwjGC2mhob3Wl3jqTvAbNUCeVtneFMitGT3tINCzO?=
 =?iso-8859-1?Q?rzflksUM+oaBj5XKyl7lFypei5KUAM1sZuO1VAzXkeiRvtdom4963sAsOb?=
 =?iso-8859-1?Q?xKilqQZ6GTkF91dkl4G7ogOOZFFoVWumyziMl5iKbXheeekrTPdStlb+X5?=
 =?iso-8859-1?Q?5La7A8cEIjeQyhKUPNBpg134FSz2KRx7nasQQaNJA/CkCjkwvz0k4Mtykv?=
 =?iso-8859-1?Q?B5WsoxUcULxs5ICZRzay/z5avJ4AyQZQN368SmpKAVyD3o8jzVOBppgkkX?=
 =?iso-8859-1?Q?4oLAPKlX84S4dpE/Jnb9y8rS1KOpF7W5CwgAOsvQjkMdYIPyffHijeDHzM?=
 =?iso-8859-1?Q?o5zQoRyThYKDt1JMzJyV2gT7H27YrbWRQ6fnmT2eKjy35+lZNB24EOigua?=
 =?iso-8859-1?Q?ynV9U2WGkxQKzQA41ys3mnYYDRt+pSVBlIvo+ELhXdp/8Dja/A/PGX7vdA?=
 =?iso-8859-1?Q?3dS/k64sSX8fDZYSRj/FN6ZKRSj65DfFq32LsPe3KoZ2IADFCRf1mrRmrA?=
 =?iso-8859-1?Q?xdaMD5LhQXCWeJK8Ip23jGg/T3o293AmZIgWLOgkEimavj2dXIbMsUK/DU?=
 =?iso-8859-1?Q?RQKCm28zUakKRqq6o+ikOOk8bWk+RPIII3lRcMzS9ZmAMOyYbNkXRwP7co?=
 =?iso-8859-1?Q?E/TkAu/tDMUFG0jFEMJlAAF9yLhiqpc5h4sQGfbXSJsGyYeqyihCvdwcnm?=
 =?iso-8859-1?Q?mft++QsxAJGRs+3lKi8Yckuo9pj3DFAGcnEtgsdi6ZWLIIYt+MRv1bEiBP?=
 =?iso-8859-1?Q?MDPjhcl9tDYZ1L5Poo0/ZpdONf20hVD0Pt63byfXoP+0l+rm2P9w2WGiaf?=
 =?iso-8859-1?Q?8vw3p9Ga480Cqsz1wWqoAqEyUf2wJ48WTu7ncmoDfldRec4gDRmLjvAc8F?=
 =?iso-8859-1?Q?wxy1eob0dzxy+Ezqw9UZFAx8rvFfC7WYLhYol//YNV1+On8qp8LZBNdUjW?=
 =?iso-8859-1?Q?IdwA/Z8kmLqZckRjhOi+Hc2SfGiNqwpDZIjeLFq+Dji2w8InpbQivBe48V?=
 =?iso-8859-1?Q?AUPJVoYgVtgF7DUlQwmxQjdFh+RxlslzbL08Pps02W0mPaiT7fUVeToccn?=
 =?iso-8859-1?Q?GrPP9INEcYnO1JrIumRoLAV1hR14rZJaKlmgtoqhv8jLSLJa2kZlzCXQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f53a574-5e2b-426c-7b6c-08dde95ebe82
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2025 13:52:08.8597
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PHpA/HVaDeQqOyB9YYgQfQkSEdD0EJ25vVthiwLv/u5qGz5fDGyneDhL27cTfn+VJ4YArzoIjBJPXznnEl7QJI8ECaTvz7rkPFjGZLyoNSU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8345


Inroducing V7 patch series  on top of the Xen version 4.20-rc2
which includes implementation of the SCI SCMI SMC single-agent support.

This patch series is the first chunk of the
"xen/arm: scmi: introduce SCI SCMI SMC multi-agent support" which can
be found at [0]

SCMI-multiagent support will be provided as the followup patch series.

[0] https://lore.kernel.org/xen-devel/cover.1753184487.git.oleksii_moisieie=
v@epam.com/

Patch 1 "xen/arm: add generic SCI subsystem"
- rebased and refactored
- introduced DEVICE_ARM_SCI DT device class and used for SCI drivers probin=
g
instead of custom,
  linker sections based implementation.
- added SCI API for Dom0 DT handling, instead of manipulating with ARM arch
dom0 code directly.
- RFC changes in XEN_DOMCTL_assign_device OP processing
- Introduce arch_handle_passthrough_prop call to handle arm specific
nodes

Patch 2 "xen/arm: scmi-smc: update to be used under sci subsystem"
- update driver introduced by commit 3e322bef8bc0 ("xen/arm: firmware: Add =
SCMI
over SMC calls
handling layer") be used under sci subsystem.
- no functional changes in general

Patch 3 "xen/arm: scmi-smc: passthrough SCMI SMC to guest domain
This is new change which allows passthrough SCMI SMC, single agent interfac=
e to
guest domain
cover use case "thin Dom0 with guest domain, which serves as Driver domain"=
.
See patch commit message for full description.

Patch 4 - docs: arm: add docs for SCMI over SMC calls forwarding
driver
- add documentation section for Simple Arm SCMI over SMC calls
forwarding driver.

Code can be found at:
https://github.com/oleksiimoisieiev/xen/tree/scmi_upstrv5

[1] RFC v2:
http://patchwork.kernel.org/project/xen-devel/cover/cover.1644341635.git.ol=
eksii_moisieiev@epam.com/
[2] RFC v3:
https://patchwork.kernel.org/project/xen-devel/patch/20250311111618.1850927=
-1-grygorii_strashko@epam.com
SCMI spec:
https://developer.arm.com/documentation/den0056/e/?lang=3Den

SCMI bindings:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/devicetree/bindings/access-controllers/access-controllers.ya=
ml

Reference EL3 FW:
RPI5: https://github.com/xen-troops/arm-trusted-firmware/commits/rpi5_dev/
Renesas v4h:
https://github.com/GrygiriiS/arm-trusted-firmware/commits/rcar_gen4_v2.7_v4=
x-scmi_upd/

base-commit: dbe60f244c (Update Xen to 4.21, 2025-02-21)

Changes in v7:
- fix sci_handl_call to make changes more readable
- fix build error when DOM0LESS_BUILD is disabled (removed
 arch_handle_passthrough_prop from the header)
- sort headers in alphabetical order in sci.h
- sort headers in scmi-smc.c file
- Fix commit description.
- Move scmi-smc-passthrough definition to match alphaberical order
- remove unneeded initialization with NULL
- changed u64 to uint64_t
- Send warning if iomem permit access was failed
- fixed typos

Changes in v6:
- rebase on top of the latest master
- fix return value of sci_dt_finalize() call
- add R-b tag
- added generated helpers and types go files
- rename cmdline parameter to scmi-smc-passthrough
- fix goto tag in parse_arm_sci_config
- add link to the scmi bindings used in the doc
- remove mentions about HVC calls from doc
- rename cmdline parameter to scmi-smc-passthrough

Changes in v5:
- update Maintainers file. Set role as a Reviewer
- rebased on the latest master branch
- Introduce arch_handle_passthrough_prop call to handle arm specific nodes
- rename dom0_scmi_smc_passthrough to scmi_smc_passthrough
- rename dom0_scmi_smc_passthrough in documentation

Changes in v4:
- fix SPDX-License
- rename DEVICE_ARM_SCI DT device class to FIRMWARE_DEVICE
- move XEN_DOMCTL_assign_device code in separate patch
- Add documentation for SCI SCMI drivers
- xl.cfg doc
- fix comments from Stefano Stabellini
- fix toolstack code as sugested by Anthony PERARD
  - use MATCH_OPTION()
  - move arm_sci struct and cfg params in "arch_arm"
- add SCMI passthrough for dom0less case

Grygorii Strashko (3):
  xen/arm: scmi-smc: update to be used under sci subsystem
  xen/arm: scmi-smc: passthrough SCMI SMC to domain, single agent
  docs: arm: add docs for SCMI over SMC calls forwarding driver

Oleksii Moisieiev (1):
  xen/arm: add generic SCI subsystem

 MAINTAINERS                                   |   6 +
 .../arm/firmware/arm-scmi.rst                 | 180 ++++++++++++++++
 docs/hypervisor-guide/arm/index.rst           |   9 +
 docs/hypervisor-guide/index.rst               |   1 +
 docs/man/xl.cfg.5.pod.in                      |  34 +++
 docs/misc/arm/device-tree/booting.txt         |  15 ++
 docs/misc/xen-command-line.pandoc             |   9 +
 tools/golang/xenlight/helpers.gen.go          |  41 ++++
 tools/golang/xenlight/types.gen.go            |  12 ++
 tools/include/libxl.h                         |   5 +
 tools/libs/light/libxl_arm.c                  |  14 ++
 tools/libs/light/libxl_types.idl              |  10 +
 tools/xl/xl_parse.c                           |  36 ++++
 xen/arch/arm/device.c                         |   5 +
 xen/arch/arm/dom0less-build.c                 |  40 ++++
 xen/arch/arm/domain.c                         |  12 +-
 xen/arch/arm/domain_build.c                   |   8 +
 xen/arch/arm/firmware/Kconfig                 |  25 ++-
 xen/arch/arm/firmware/Makefile                |   1 +
 xen/arch/arm/firmware/sci.c                   | 154 ++++++++++++++
 xen/arch/arm/firmware/scmi-smc.c              | 194 +++++++++++++----
 xen/arch/arm/include/asm/domain.h             |   5 +
 xen/arch/arm/include/asm/firmware/sci.h       | 200 ++++++++++++++++++
 xen/arch/arm/include/asm/firmware/scmi-smc.h  |  41 ----
 xen/arch/arm/vsmc.c                           |   4 +-
 xen/common/device-tree/dom0less-build.c       |   4 +
 xen/include/asm-generic/device.h              |   1 +
 xen/include/public/arch-arm.h                 |   5 +
 xen/include/xen/dom0less-build.h              |   3 +
 29 files changed, 989 insertions(+), 85 deletions(-)
 create mode 100644 docs/hypervisor-guide/arm/firmware/arm-scmi.rst
 create mode 100644 docs/hypervisor-guide/arm/index.rst
 create mode 100644 xen/arch/arm/firmware/sci.c
 create mode 100644 xen/arch/arm/include/asm/firmware/sci.h
 delete mode 100644 xen/arch/arm/include/asm/firmware/scmi-smc.h

--=20
2.34.1

