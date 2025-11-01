Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC848C27D2B
	for <lists+xen-devel@lfdr.de>; Sat, 01 Nov 2025 12:57:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1154895.1484571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFAEI-000390-3a; Sat, 01 Nov 2025 11:57:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1154895.1484571; Sat, 01 Nov 2025 11:57:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFAEH-000379-VD; Sat, 01 Nov 2025 11:57:09 +0000
Received: by outflank-mailman (input) for mailman id 1154895;
 Sat, 01 Nov 2025 11:57:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rLmn=5J=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1vFAEG-0002Ar-8Z
 for xen-devel@lists.xenproject.org; Sat, 01 Nov 2025 11:57:08 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e29c865f-b719-11f0-980a-7dc792cee155;
 Sat, 01 Nov 2025 12:57:05 +0100 (CET)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by DBBPR03MB7130.eurprd03.prod.outlook.com (2603:10a6:10:20e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Sat, 1 Nov
 2025 11:56:58 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%5]) with mapi id 15.20.9275.013; Sat, 1 Nov 2025
 11:56:58 +0000
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
X-Inumbo-ID: e29c865f-b719-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VW7JX/eqMNkukstvC1yJm4dJ9FdWthITT2XruADUOr0CAbU1KfoR2sMwwXC189DdILq/vwAHwK9ysqWot2l1mhmMXYwmo9dgN3wsgaN/4jZvcfU8hdjWiUpSSxoa2P3hq5U19lim5ggdFHYF7Ihl6mISp5FakG++7JB1TMgpgBT+NGk3p9ppdcTMonMXnPf7KupmvWiCdApLfCyumnJR1QZSB+RbtnlEEjpYJ788ii4tZxsajI9ci5s3LLxAFjD4FteOHFI5WVjcW/Z0gqY6zFW0p8GJ8oaMUdaek+34xZRuJOnRltx4y9F541n1aOSTL93wMiewtEv37nsc81jU1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJhgedX0Vpjmv8NLnFLtcyoAuFv8Q79conSP7vqx7l0=;
 b=Tl7n8WDFs/IMaqyoGwkz4w3yg+VY20KNAqf5uC/+/AQ9FbE/uY37XrVzCRDcWU4W3YPzzFy7tDsO3FJwwxYAo6UXzqAb5ERrZn2rSM8lGDbmvt6a5lSRHlqkrehL17kx05nYDnsa4NkQvHPrbcfUHwfIaYcJc87/qTaJVVlPGs2Y+XGdUsnmbBTsoOXnluPODH0Q4AEzpBRBtxV7q6gIjJ8BQb0k7VhHr0QQKy9RLaDJ2CnDaM0jNX1awZCvu3KkahOH29a6L44IOe2XG8GWAgUD0RRmjkccDvC/79hB5oVz4GeD1eH8/jLrXWseL8KXnAo14/x6vfMV7dWCShIOnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJhgedX0Vpjmv8NLnFLtcyoAuFv8Q79conSP7vqx7l0=;
 b=EV5wKlXbSvBNrLVdVXZCGyRlThJblrPaEC9eGYVe2P5MYj63Kqt76E5CeR7iQiYFBcRIPJPLk7R/ZlWbmm7VjelzoyVgwM4CpNxoKB22j/mvfzr5O3pBTIhrnCQEBACqwD0FWbg6DeVLO9onPWZkLdyDANmiNs72kAJVxdzBf5BcSMsQ4lV0Wl7wDbJusVQt3dDqCbCvJKxSzRDyAV1J+09rTsX7VNOCnHPLb/+rTZFhINEht0NdHin774sbLAZ5n17uQU/Sy+TDZT0BUkw9sIluSIhd2V2pF2tHmeXnqCShoWqze307BxJaZL3cjc7P9gigLs75tplZt225crpouw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [PATCH v6 4/5] xen/arm: scmi: introduce SCI SCMI SMC multi-agent
 driver
Thread-Topic: [PATCH v6 4/5] xen/arm: scmi: introduce SCI SCMI SMC multi-agent
 driver
Thread-Index: AQHcSyafF7w2yrI9QUiIBj5xG1SGAQ==
Date: Sat, 1 Nov 2025 11:56:57 +0000
Message-ID:
 <ee195eb3a9b04854a6b108da4275877c9a7bb32c.1761998077.git.oleksii_moisieiev@epam.com>
References: <cover.1761998077.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1761998077.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|DBBPR03MB7130:EE_
x-ms-office365-filtering-correlation-id: 923cdd2a-73f9-4477-df8d-08de193dc275
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?q8FSVuF7EZ+hey9qaZKsmhHqOYvdfE04EgbW470v9BE30zIyIeZLQFawrL?=
 =?iso-8859-1?Q?W6N7WyYuifF79I7f054aLs5d8KrcAfdAcP+Lhb77xkOQwim/bFfPT7o0Yg?=
 =?iso-8859-1?Q?VNshvRxUZsf0L9YAS07O1zfPK2iWUZBOzfTT4VvOZeNHWIKEBLF94Af+fz?=
 =?iso-8859-1?Q?mArsD5zMp+YlOB8FHBj9mYRSPGJikBrZVMkTv++i6MEmo8bWLSJY/5YNnX?=
 =?iso-8859-1?Q?JZZiLxqQcaWPSvY7io05l/aK8UPYl/1BfJ1nzBmn1ST+sBlYULbFVuAhDl?=
 =?iso-8859-1?Q?MYlKHAhwKwfBHQBPt9YTvKPi4KRj8ZX+E5efzdk2h/qzW+liHuMLT3+HRW?=
 =?iso-8859-1?Q?qHoLrbsl0Z7QnOO86HfnyeHbcJE8CjEwrqjNAY0F0LdGOkx5lfXEKumzC3?=
 =?iso-8859-1?Q?jgAG82UK9JYEP8PsJJPBiV92wl2H/UHxH1wAH1frl3H1GXG/dOh125/0sk?=
 =?iso-8859-1?Q?GPayTCnBS4dm0RsccPEuYfl/lylTXUmsKfHskei5bCMLD+Im+Q0ieIx52g?=
 =?iso-8859-1?Q?hTUGy+Zimx5ejVX9yyHvgr1U8FjtTZWZxDG1Rb8qNzDzf1f5qt/aubEsb5?=
 =?iso-8859-1?Q?dPvdl5Gbk4eW5ccBHT2StpzWeaCYBqTVAXqt9Ku5Gsra019aTSb0Yroasl?=
 =?iso-8859-1?Q?MP4hwVbHAqZW4Huh26xmZs72tpdKQHXF1sYlRCyAYoPoB+dLc97Leo3FUv?=
 =?iso-8859-1?Q?e2X2f/oHG+rBhinvmRfZUgVpWG8PpTkFC/Skb+XVgsctmG+xojpc6+H4Ns?=
 =?iso-8859-1?Q?TT6Nd0vVZJ6PJcpYATPiO8mIoqosKHJZYPM1YZSFvqsxrlsF4bEEe0vSSt?=
 =?iso-8859-1?Q?MKI+umoedm8Au2ztItCdX6OvRnuOesTE+7ZiRb86rF/e8uL5uV/W3hG39V?=
 =?iso-8859-1?Q?yZWYGa3H+zAIQdqYbs4EEnfvcYTQ5f8CRIEIqy/GSqoH9Ex47+CL0DTr3m?=
 =?iso-8859-1?Q?rj4rYRfy39k7NxIByymWfoTan6RNwovRaK981uHUhBBDo5MqU/eR9S+BAR?=
 =?iso-8859-1?Q?dMjtJw2DStnW17p9dV6VV+1NBPnVJxSRrhC4kFZlfTnC+EIfn30KC4g5ci?=
 =?iso-8859-1?Q?ZIlbs91vv1tpyMZ+pIz3bY7s4T1q/8vZBJReIhotdwih+7SiZiiDvfxVbe?=
 =?iso-8859-1?Q?v444KhR4PO2oTvVV1yWaUIzcLhA3lNFyCdOFAKKPGrB/z/Ea0U6SiQqgkv?=
 =?iso-8859-1?Q?fxfBbw6q2wrX54rNQtF7lbguwMnazoUqLwBzkA0g2LxqIavRG3NU+LitBK?=
 =?iso-8859-1?Q?ySAzUulGkx8j14/Zb2u47Rl6BA/LWwdPgA6zACXV68+aOYQhX10l/dGEPj?=
 =?iso-8859-1?Q?4sMfjgF47ZuN9aIamgQYqh0/Mp3iAHcR8G/I3Fmo2r1r+6apZEY6xm7Dtq?=
 =?iso-8859-1?Q?V+mRQkjnG0AgDOHe/MwaQDoWIs8Y4XzmXl4dAZVa/Z87GQo8FpztQKV5DC?=
 =?iso-8859-1?Q?KwYEB/rR0zDY3MQRmO1c9Cw7yz41l1L+EdVBXWfqdXeNKkLghehpcLbT2R?=
 =?iso-8859-1?Q?kGS2x394XLJwPhGTVrVCiRzJ8KFrX+Pa6UsE/HhHZbiwr8b05djRXN69dq?=
 =?iso-8859-1?Q?nbp5XNWIP1Jnuun6/1qUTYcfpya3?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?3fphoX39BAfJhq+lRjyrYtISAZMZmlXyvUwvEB4Y36/NVZ0+8+VLpxh26i?=
 =?iso-8859-1?Q?eWlk2LU5kn7HTX9Cms7wi3z6UUCdq09R5qTPRrVU9zQYyR6L2deM3nkYbF?=
 =?iso-8859-1?Q?QwnjX7Z9KRaSINbeYQ3v1rH2m0uLKBt/bsKteLmFe2u74ZvBQDENx8gNdm?=
 =?iso-8859-1?Q?BEaMiRxvk0pGVcBg0wYo3S07L4MZRffqwGySsjwoS6ppKDxP9MtpwBFmZm?=
 =?iso-8859-1?Q?ZVFUV5fV/GhRXN7eZRsNMcIpL33Z51qYJoWusPgd8nZnri18Ve4O8hLRha?=
 =?iso-8859-1?Q?IT5px3maVC7SYAi8rDTm3vlxy8CUZoLw8iHy+PkvqV7faNJM08EUh4JIUe?=
 =?iso-8859-1?Q?1QkT4LiVWklEc4idhCig47rgB+fEy7gxChEZwdCsrBrLXKbAXiuHFwhrnU?=
 =?iso-8859-1?Q?N6KXb6T7yDO+KnEQXilBs67vPTJSF+m2+KzcrAV57zLQQczYayXtaD6N1D?=
 =?iso-8859-1?Q?OkZSJMfEEZ0jlePX7MSKe6FuClBF6aganWoHnyAb5v4flRgKJmryz2xlBC?=
 =?iso-8859-1?Q?z6PpNHmWmU7//a5QFFMoIH+5EfDT5nUvtmfKHuSusN+IMb8AGsnWvh8En0?=
 =?iso-8859-1?Q?duk9HNh1D9rWOvJz0xQqcMC70nN5rMtHbrPeNWM2JoQk6yTGjXbgJJqUPT?=
 =?iso-8859-1?Q?4ZAqq29VK91lWQeGP+wH0j83nUGUfq9Z/oo0qrjvBi4YTzAoRdwJMketUy?=
 =?iso-8859-1?Q?pMw2DTma4YbL7D/YJr06eIHNOfAqhtU2CJhfShfmb9mnQv7arxC/wTiCJU?=
 =?iso-8859-1?Q?StV4zHfDZKQRSfsFhBPkp18jtHbIUeUE7W60PrOG+ndjMMQEHcQiFo+XO2?=
 =?iso-8859-1?Q?6tgGzXSr2gbUlVeQd/VCCEfQzQE0o18sfiQDBWxgUN/prIlQVeycxPPCsa?=
 =?iso-8859-1?Q?6aGujfvpp0vYBgzF4NcaNbzXeXZmwYFUZRbxM7c/S3HY56AVTIs7Vu4ecp?=
 =?iso-8859-1?Q?7dPiKlutPhZx8FJiZl0+AS6ZZKyK1ct91HiiIc9kTBHP4vJD91u55JRV+8?=
 =?iso-8859-1?Q?7Es4RDWqSDnLRwDY0eo0c2glDKB+6HN1RRqsTeyr5W+JXx60HrMbw47D0i?=
 =?iso-8859-1?Q?nnuEvMRrmTfzHv1YNoUuyK9EoRGYUUXncFg8v0j7ngU0mnkObXCjMIHJic?=
 =?iso-8859-1?Q?aHnTJATLeSQkube2S6qbSDKu6KekA7sX0Rvlp900JPRMwpKAH0DQsd9iAK?=
 =?iso-8859-1?Q?feV74Dox3oA/85hKLZPa0IGlq+Yl77Ha9HN9uC+WL2i9xArUHB4uaqtOme?=
 =?iso-8859-1?Q?rweX9B91qvXrIYDPntVhf9mZI+aVoiXMgmuxxE5PJpBtI1u1rETsuRPpjT?=
 =?iso-8859-1?Q?DNjErEbCKqQGzvSWpTCEvdsp3orDRjCv3a+hKqd3GtWJU67VbJJktfbCBa?=
 =?iso-8859-1?Q?b5OtfCTpnvOkIDM4umyuZiGQ9M4lRCgFASHU0FZgQGN+mXqrqJOWItC9A6?=
 =?iso-8859-1?Q?WGgfVOOg+wM2otQzmLwIvQIp9da9/GwmAcroRuSxuQjgZQf3ZH65R/UIAR?=
 =?iso-8859-1?Q?oIifWizq2mO5lZEj0+M4UxiccyIBGv/m59CLu9MSZt9vf0C7oJYIc+jLqM?=
 =?iso-8859-1?Q?aOf7N4aFkf+NXme7THPv0kQKGpZ5gFrbau/HgTKv5CGCfKdfTkGT8f/Hmr?=
 =?iso-8859-1?Q?UWj5aT2YhgCx1ybj//rzWG91gnT1GY8RuGtp61DKUT5Jo9xFzNXCU86w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 923cdd2a-73f9-4477-df8d-08de193dc275
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2025 11:56:57.9276
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sQTTJZ+91M+HdaKztKdUKBG/uR4gb/W0Cl/PE2s1LFnVdAEu5yt7t7xvlaZPExJTNn1Lx4GViuRnBsAucxFzr6s1M7/CM6gHdTNl1oNGF9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB7130

This patch introduces SCI driver to support for ARM EL3 Trusted Firmware-A
(TF-A) which provides SCMI interface with multi-agent support, as shown
below.

  +-----------------------------------------+
  |                                         |
  | EL3 TF-A SCMI                           |
  +-------+--+-------+--+-------+--+-------++
  |shmem1 |  |shmem0 |  |shmem2 |  |shmemX |
  +-----+-+  +---+---+  +--+----+  +---+---+
smc-id1 |        |         |           |
agent1  |        |         |           |
  +-----v--------+---------+-----------+----+
  |              |         |           |    |
  |              |         |           |    |
  +--------------+---------+-----------+----+
         smc-id0 |  smc-id2|    smc-idX|
         agent0  |  agent2 |    agentX |
                 |         |           |
            +----v---+  +--v-----+  +--v-----+
            |        |  |        |  |        |
            | Dom0   |  | Dom1   |  | DomX   |
            |        |  |        |  |        |
            |        |  |        |  |        |
            +--------+  +--------+  +--------+

The EL3 SCMI multi-agent firmware is expected to provide SCMI SMC shared
memory transport for every Agent in the system.

The SCMI Agent transport channel defined by pair:
 - smc-id: SMC id used for Doorbell
 - shmem: shared memory for messages transfer, Xen page
 aligned. Shared memort is mapped with the following flags:
 MT_DEVICE_nGnRE.

The follwoing SCMI Agents are expected to be defined by SCMI FW to enable S=
CMI
multi-agent functionality under Xen:
- Xen management agent: trusted agents that accesses to the Base Protocol
commands to configure agent specific permissions
- OSPM VM agents: non-trusted agent, one for each Guest domain which is
  allowed direct HW access. At least one OSPM VM agent has to be provided
  by FW if HW is handled only by Dom0 or Driver Domain.

The EL3 SCMI FW is expected to implement following Base protocol messages:
- BASE_DISCOVER_AGENT (optional if agent_id was provided)
- BASE_RESET_AGENT_CONFIGURATION (optional)
- BASE_SET_DEVICE_PERMISSIONS (optional)

The SCI SCMI SMC multi-agent driver implements following
functionality:
- The driver is initialized based on the ``xen,config`` node under ``chosen=
``
  (only one SCMI interface is supported), which describes the Xen managemen=
t
  agent SCMI interface.

scmi_shm_1: sram@47ff1000 {
          compatible =3D "arm,scmi-shmem";
          reg =3D <0x0 0x47ff1000 0x0 0x1000>;
};
scmi_xen: scmi {
        compatible =3D "arm,scmi-smc";
        arm,smc-id =3D <0x82000003>; <--- Xen management agent smc-id
        #address-cells =3D < 1>;
        #size-cells =3D < 0>;
        #access-controller-cells =3D < 1>;
        shmem =3D <&scmi_shm_1>; <--- Xen management agent shmem
};

- The driver obtains Xen specific SCMI Agent's configuration from the Host =
DT, probes Agents and
  builds SCMI Agents list. The Agents configuration is taken from "scmi-sec=
ondary-agents"
  property where first item is "arm,smc-id", second - "arm,scmi-shmem" phan=
dle and third is
  optional "agent_id":

chosen {
  ranges;
  xen,config {
    ranges;
    scmi-secondary-agents =3D <
                  0x82000003 &scmi_shm_0 0
                  0x82000004 &scmi_shm_2 2
                  0x82000005 &scmi_shm_3 3
                  0x82000006 &scmi_shm_4 4>;
    #scmi-secondary-agents-cells =3D <3>; <--- optional, default 3

    scmi_shm_0 : sram@47ff0000 {
        compatible =3D "arm,scmi-shmem";
        reg =3D <0x0 0x47ff0000 0x0 0x1000>;
    };

    scmi_shm_2: sram@47ff2000 {
            compatible =3D "arm,scmi-shmem";
            reg =3D <0x0 0x47ff2000 0x0 0x1000>;
    };
    scmi_shm_3: sram@47ff3000 {
            compatible =3D "arm,scmi-shmem";
            reg =3D <0x0 0x47ff3000 0x0 0x1000>;
    };
    scmi_shm_4: sram@47ff4000 {
            compatible =3D "arm,scmi-shmem";
            reg =3D <0x0 0x47ff4000 0x0 0x1000>;
    };

    // Xen SCMI management channel
    scmi_shm_1: sram@47ff1000 {
            compatible =3D "arm,scmi-shmem";
            reg =3D <0x0 0x47ff1000 0x0 0x1000>;
    };

    scmi_xen: scmi {
        compatible =3D "arm,scmi-smc";
        arm,smc-id =3D <0x82000002>; <--- Xen management agent smc-id
        #address-cells =3D < 1>;
        #size-cells =3D < 0>;
        #access-controller-cells =3D < 1>;
        shmem =3D <&scmi_shm_1>; <--- Xen management agent shmem
    };
  };
};

/{
    // Host SCMI OSPM channel - provided to the Dom0 as is if SCMI enabled =
for it
    scmi_shm: sram@47ff0000 {
            compatible =3D "arm,scmi-shmem";
            reg =3D <0x0 0x47ff0000 0x0 0x1000>;
    };

    firmware {
        scmi: scmi {
            compatible =3D "arm,scmi-smc";
            arm,smc-id =3D <0x82000002>; <--- Host OSPM agent smc-id
            #address-cells =3D < 1>;
            #size-cells =3D < 0>;
            shmem =3D <&scmi_shm>; <--- Host OSPM agent shmem

            protocol@X{
            };
        };
    };
};

This approach allows defining multiple SCMI Agents by adding Xen-specific p=
roperties under
the ``/chosen`` node to the Host Device Tree, leaving the main part unchang=
ed. The Host DT
SCMI channel will be passed to Dom0.

The Xen management agent is described as a ``scmi_xen`` node under the ``/c=
hosen`` node, which
is used by Xen to control other SCMI Agents in the system.

All secondary agents' configurations are provided in the ``scmi-secondary-a=
gents`` property with
an optional ``agent_id`` field.

The ``agent_id`` from the ``scmi-secondary-agents`` property is used to ide=
ntify the agent in the
system and can be omitted by setting ``#scmi-secondary-agents-cells =3D <2>=
``, so the Secondary
Agents configuration will look like this:

chosen {
  xen,config {
    scmi-secondary-agents =3D <
                  0x82000003 &scmi_shm_0
                  0x82000004 &scmi_shm_2
                  0x82000005 &scmi_shm_3
                  0x82000006 &scmi_shm_4>;
    #scmi-secondary-agents-cells =3D <2>;
  };
}

In this case, Xen will use the ``SCMI_BASE_DISCOVER_AGENT`` call to discove=
r the ``agent_id``
for each secondary agent. Providing the ``agent_id`` in the ``scmi-secondar=
y-agents`` property
allows skipping the discovery call, which is useful when the secondary agen=
t's shared memory is
not accessible by Xen or when boot time is important because it allows skip=
ping the agent
discovery procedure.

  Note that Xen is the only one entry in the system which need to know
  about SCMI multi-agent support.

- It implements the SCI subsystem interface required for configuring and
enabling SCMI functionality for Dom0/hwdom and Guest domains. To enable
SCMI functionality for domain it has to be configured with unique supported
SCMI Agent_id and use corresponding SCMI SMC shared memory transport
[smc-id, shmem] defined for this SCMI Agent_id.
- Once Xen domain is configured it can communicate with EL3 SCMI FW:
  -- zero-copy, the guest domain puts SCMI message in shmem;
  -- the guest triggers SMC exception with smc-id (doorbell);
  -- the Xen driver catches exception, do checks and synchronously forwards
  it to EL3 FW.
- the Xen driver sends BASE_RESET_AGENT_CONFIGURATION message to Xen
  management agent channel on domain destroy event. This allows to reset
  resources used by domain and so implement use-case like domain reboot.

Dom0 Enable SCMI SMC:
 - pass dom0_scmi_agent_id=3D<agent_id> in Xen command line. if not provide=
d
   SCMI will be disabled for Dom0 and all SCMI nodes removed from Dom0 DT.
   The driver updates Dom0 DT SCMI node "arm,smc-id" value and fix up shmem
   node according to assigned agent_id.

Guest domains enable SCMI SMC:
 - xl.cfg: add configuration option as below

   arm_sci =3D "type=3Dscmi_smc_multiagent,agent_id=3D2"

 - xl.cfg: enable access to the "arm,scmi-shmem" which should correspond as=
signed agent_id for
   the domain, for example:

iomem =3D [
    "47ff2,1@22001",
]

 - DT: add SCMI nodes to the Driver domain partial device tree as in the
 below example. The "arm,smc-id" should correspond assigned agent_id for th=
e domain:

passthrough {
   scmi_shm_0: sram@22001000 {
       compatible =3D "arm,scmi-shmem";
       reg =3D <0x0 0x22001000 0x0 0x1000>;
   };

   firmware {
        compatible =3D "simple-bus";
            scmi: scmi {
                compatible =3D "arm,scmi-smc";
                arm,smc-id =3D <0x82000004>;
                shmem =3D <&scmi_shm_0>;
                ...
            }
    }
}

SCMI "4.2.1.1 Device specific access control"

The XEN SCI SCMI SMC multi-agent driver performs "access-controller" provid=
er function
in case EL3 SCMI FW implements SCMI "4.2.1.1 Device specific access control=
" and provides the
BASE_SET_DEVICE_PERMISSIONS command to configure the devices that an agents=
 have access to.
The DT SCMI node should "#access-controller-cells=3D<1>" property and DT de=
vices should be bound
to the Xen SCMI.

&i2c1 {
	access-controllers =3D <&scmi 0>;
};

The Dom0 and dom0less domains DT devices will be processed automatically th=
rough
sci_assign_dt_device() call, but to assign SCMI devices from toolstack the =
xl.cfg:"dtdev" property
shall be used:

dtdev =3D [
    "/soc/i2c@e6508000",
]

xl.cfg:dtdev will contain all nodes which are under SCMI management (not on=
ly those which are behind IOMMU).

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
[2] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/Documentation/devicetree/bindings/access-controllers/access-controller=
s.yaml

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

Changes in v6:
- updated scmi-shmem to use io.h from generic location
- update scmi_agent_id parameter to be provided inside dom0=3D parameter
list and have the following format "dom0=3Dsci-agent-id=3D0"
This change was done as a response for Stefano comment and
requires a lot of code changes, but produces much cleaner solution
that's why I've added it to the code.
- fix file comments and return codes
- fix lenght checks in shmem_{get,put}_message to use offsetof
- remove len member from scmi_channel structure as it is not used
- set scmi-secondary-agents property to be mandatory since if no
secondary agents were provided then there is no sence to enable scmi
when no secondary agents are populated to the Domains
- update documentation in booting.txt, added xen_scmi node to the
example
- adjust d->arch.sci_enabled value in scmi_domain_destroy
- fix lock management in smc_create_channel call
- avoid extra map_channel_memory command for Xen management channel
because collect_agent_id call unmaps memory if DOMID_XEN is not
set. So for Xen management channel we can init domain_id ad DOMID_XEN
before calling collect_agent_id so memory shouldn't be unmapped.

Changes in v5:
- fix device-tree example format in booting.txt, added ";" after "}".
- update define in scmi-proto.h
- update define in scmi-shmem.h file
- scmi_assign_device - do not ignore -EOPNOTSUPP return
code of the do_smc_xfer
- remove overwriting agent_channel->agent_id after
SCMI_BASE_DISCOVER_AGENT call
- add multi-agent files to the MAINTAINERS
- add SCMI multi-agent description to the SUPPORT.md
- handle ARM_SMCCC_INVALID_PARAMETER return code and return -EINVAL
for smc call
- updated collect_agents function. Set agent_id parameter as optional
in scmi-secondary-agents device-tree property
- introduce "#scmi-secondary-agents-cells" parameter to set if
agent_id was provided
- reanme xen,scmi-secondary-agents property to scmi-secondary-agents
- move memcpu_toio/fromio for the generic place
- update Xen to get management channel from /chosen/xen,config node
- get hypervisor channnel from node instead of using hardcoded
- update handling scmi and shmem nodes for the domain
- Set multi-agent driver to support only Arm64

Changes in v4:
- toolstack comments from Anthony PERARD
- added dom0less support
- added doc for "xen,scmi-secondary-agents"

 MAINTAINERS                                 |   4 +
 SUPPORT.md                                  |  11 +
 docs/man/xl.cfg.5.pod.in                    |  13 +
 docs/misc/arm/device-tree/booting.txt       | 103 +++
 docs/misc/xen-command-line.pandoc           |  19 +-
 tools/libs/light/libxl_arm.c                |   4 +
 tools/libs/light/libxl_types.idl            |   4 +-
 tools/xl/xl_parse.c                         |  12 +
 xen/arch/arm/dom0less-build.c               |  11 +
 xen/arch/arm/domain_build.c                 |  26 +-
 xen/arch/arm/firmware/Kconfig               |  12 +
 xen/arch/arm/firmware/Makefile              |   1 +
 xen/arch/arm/firmware/scmi-proto.h          | 164 ++++
 xen/arch/arm/firmware/scmi-shmem.c          | 115 +++
 xen/arch/arm/firmware/scmi-shmem.h          |  45 ++
 xen/arch/arm/firmware/scmi-smc-multiagent.c | 794 ++++++++++++++++++++
 xen/include/public/arch-arm.h               |   3 +
 17 files changed, 1338 insertions(+), 3 deletions(-)
 create mode 100644 xen/arch/arm/firmware/scmi-proto.h
 create mode 100644 xen/arch/arm/firmware/scmi-shmem.c
 create mode 100644 xen/arch/arm/firmware/scmi-shmem.h
 create mode 100644 xen/arch/arm/firmware/scmi-smc-multiagent.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ecd3f40df8..4ad1d818a6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -532,6 +532,10 @@ R:	Oleksii Moisieiev <oleksii_moisieiev@epam.com>
 S:	Supported
 F:	xen/arch/arm/firmware/sci.c
 F:	xen/arch/arm/include/asm/firmware/sci.h
+F:	xen/arch/arm/firmware/scmi-smc-multiagent.c
+F:	xen/arch/arm/firmware/scmi-shmem.c
+F:	xen/arch/arm/firmware/scmi-shmem.h
+F:	xen/arch/arm/firmware/scmi-proto.h
=20
 SEABIOS UPSTREAM
 M:	Wei Liu <wl@xen.org>
diff --git a/SUPPORT.md b/SUPPORT.md
index 491f9ecd1b..7c8951d67b 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -956,6 +956,17 @@ by hwdom. Some platforms use SCMI for access to system=
-level resources.
=20
     Status: Supported
=20
+### Arm: SCMI SMC multi-agent support
+
+Enable support for the multi-agent configuration of the EL3 Firmware, whic=
h
+allows Xen to provide an SCMI interface to the Domains.
+Xen manages access permissions to the HW resources and provides an SCMI in=
terface
+to the Domains. Each Domain is represented as a separate Agent, which can
+communicate with EL3 Firmware using a dedicated shared memory region, and
+notifications are passed through by Xen.
+
+    Status, ARM64: Tech Preview
+
 ### ARM: Guest PSCI support
=20
 Emulated PSCI interface exposed to guests. We support all mandatory
diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index ad1553c5e9..4fc3e12939 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -3156,8 +3156,21 @@ single SCMI OSPM agent support.
 Should be used together with B<scmi-smc-passthrough> Xen command line
 option.
=20
+=3Ditem B<scmi_smc_multiagent>
+
+Enables ARM SCMI SMC multi-agent support for the guest by enabling SCMI ov=
er
+SMC calls forwarding from domain to the EL3 firmware (like Trusted Firmwar=
e-A)
+with a multi SCMI OSPM agent support. The SCMI B<agent_id> should be
+specified for the guest.
+
 =3Dback
=20
+=3Ditem B<agent_id=3DNUMBER>
+
+Specifies a non-zero ARM SCI agent id for the guest. This option is mandat=
ory
+if the SCMI SMC support is enabled for the guest. The agent ids of domains
+existing on a single host must be unique and in the range [1..255].
+
 =3Dback
=20
 =3Dback
diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-t=
ree/booting.txt
index 977b428608..6fd7e4a16b 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -322,6 +322,20 @@ with the following properties:
     Should be used together with scmi-smc-passthrough Xen command line
     option.
=20
+    - "scmi_smc_multiagent"
+
+    Enables ARM SCMI SMC multi-agent support for the guest by enabling SCM=
I over
+    SMC calls forwarding from domain to the EL3 firmware (like ARM
+    Trusted Firmware-A) with a multi SCMI OSPM agent support.
+    The SCMI agent_id should be specified for the guest with "xen,sci-agen=
t-id"
+    property.
+
+- "xen,sci-agent-id"
+
+    Specifies ARM SCMI agent id for the guest. This option is mandatory if=
 the
+    SCMI SMC "scmi_smc_multiagent" support is enabled for the guest. The a=
gent ids
+    of guest must be unique and in the range [0..255].
+
 Under the "xen,domain" compatible node, one or more sub-nodes are present
 for the DomU kernel and ramdisk.
=20
@@ -824,3 +838,92 @@ The automatically allocated static shared memory will =
get mapped at
 0x80000000 in DomU1 guest physical address space, and at 0x90000000 in Dom=
U2
 guest physical address space. DomU1 is explicitly defined as the owner dom=
ain,
 and DomU2 is the borrower domain.
+
+SCMI SMC multi-agent support
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
+
+For enabling the ARM SCMI SMC multi-agent support (enabled by CONFIG_SCMI_=
SMC_MA)
+the Xen specific SCMI Agent's configuration shall be provided in the Host =
DT
+according to the SCMI compliant EL3 Firmware specification with
+ARM SMC/HVC transport using property "scmi-secondary-agents" placed in "xe=
n,config"
+node under "chosen" node:
+
+- scmi-secondary-agents
+
+    Defines a set of SCMI agents configuration supported by SCMI EL3 FW an=
d
+    available for Xen. Each Agent defined as triple consisting of:
+    SMC/HVC function_id assigned for the agent transport ("arm,smc-id"),
+    phandle to SCMI SHM assigned for the agent transport ("arm,scmi-shmem"=
),
+    SCMI agent_id (optional) if not set - Xen will determine Agent ID for
+    each provided channel using BASE_DISCOVER_AGENT message.
+
+As an example:
+
+/{
+chosen {
+    xen,config {
+        scmi_shm_0 : sram@47ff0000 {
+            compatible =3D "arm,scmi-shmem";
+            reg =3D <0x0 0x47ff0000 0x0 0x1000>;
+        };
+        // Xen SCMI management channel
+        scmi_shm_1: sram@47ff1000 {
+                compatible =3D "arm,scmi-shmem";
+                reg =3D <0x0 0x47ff1000 0x0 0x1000>;
+        };
+        scmi_shm_2: sram@47ff2000 {
+                compatible =3D "arm,scmi-shmem";
+                reg =3D <0x0 0x47ff2000 0x0 0x1000>;
+        };
+        scmi_shm_3: sram@47ff3000 {
+                compatible =3D "arm,scmi-shmem";
+                reg =3D <0x0 0x47ff3000 0x0 0x1000>;
+        };
+        scmi_shm_3: sram@47ff4000 {
+                compatible =3D "arm,scmi-shmem";
+                reg =3D <0x0 0x47ff4000 0x0 0x1000>;
+        };
+        scmi-secondary-agents =3D <
+            0x82000002 &scmi_shm_0 0
+            0x82000004 &scmi_shm_2 2
+            0x82000005 &scmi_shm_3 3
+            0x82000006 &scmi_shm_4 4>;
+            #scmi-secondary-agents-cells =3D <3>;
+        };
+
+        scmi_xen: scmi {
+            compatible =3D "arm,scmi-smc";
+            arm,smc-id =3D <0x82000002>; <--- Xen management agent smc-id
+            #address-cells =3D < 1>;
+            #size-cells =3D < 0>;
+            #access-controller-cells =3D < 1>;
+            shmem =3D <&scmi_shm_1>; <--- Xen management agent shmem
+        };
+
+    };
+};
+
+- #scmi-secondary-agents-cells
+
+    Defines whether Agent_id is set in the "scmi-secondary-agents" propert=
y.
+    Possible values are: 2, 3.
+    When set to 3 (the default), expect agent_id to be present in the seco=
ndary
+    agents list.
+    When set to 2, agent_id will be discovered for each channel using
+    BASE_DISCOVER_AGENT message.
+
+
+Example:
+
+/{
+chosen {
+    xen,config {
+        scmi-secondary-agents =3D <
+            0x82000003 &scmi_shm_1
+            0x82000004 &scmi_shm_2
+            0x82000005 &scmi_shm_3
+            0x82000006 &scmi_shm_4>;
+            #scmi-secondary-agents-cells =3D <2>;
+        };
+    };
+};
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line=
.pandoc
index 34004ce282..5541c4a4ed 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -835,7 +835,7 @@ Specify the bit width of the DMA heap.
                 cpuid-faulting=3D<bool>, msr-relaxed=3D<bool>,
                 pf-fixup=3D<bool> ] (x86)
=20
-    =3D List of [ sve=3D<integer> ] (Arm64)
+    =3D List of [ sve=3D<integer>, sci-agent-id=3D<integer> ] (Arm)
=20
 Controls for how dom0 is constructed on x86 systems.
=20
@@ -923,6 +923,14 @@ Enables features on dom0 on Arm systems.
     option is provided with a positive non zero value, but the platform do=
esn't
     support SVE.
=20
+*   The `sci-agent-id` integer parameter enables ARM SCMI (System Control =
and
+    Management Interface) functionality for Dom0 when `CONFIG_SCMI_SMC_MA`=
 is
+    compiled in. This parameter specifies the SCMI agent ID for Dom0.
+    A value equal to 0xFF (or omitted) disables SCMI for Dom0, which is us=
eful
+    for thin Dom0 or dom0less use-cases. Values from 0 to 254 specify the =
SCMI
+    agent ID. The agent IDs of domains existing on a single host must be u=
nique.
+    Example: `dom0=3Dsci-agent-id=3D0` to enable SCMI with agent ID 0 for =
Dom0.
+
 ### dom0-cpuid
     =3D List of comma separated booleans
=20
@@ -1107,6 +1115,15 @@ affinities to prefer but be not limited to the speci=
fied node(s).
=20
 Pin dom0 vcpus to their respective pcpus
=20
+### scmi-smc-passthrough (ARM)
+> `=3D <boolean>`
+
+The option is available when `CONFIG_SCMI_SMC` is compiled in, and allows =
to
+enable SCMI SMC single agent interface for any, but only one guest domain,
+which serves as Driver domain. The SCMI will be disabled for Dom0/hwdom an=
d
+SCMI nodes removed from Dom0/hwdom device tree.
+(for example, thin Dom0 with Driver domain use-case).
+
 ### dtuart (ARM)
 > `=3D path [:options]`
=20
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index e4407d6e3f..be0e6263ae 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -240,6 +240,10 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
     case LIBXL_ARM_SCI_TYPE_SCMI_SMC:
         config->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC;
         break;
+    case LIBXL_ARM_SCI_TYPE_SCMI_SMC_MULTIAGENT:
+        config->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC_M=
A;
+        config->arch.arm_sci_agent_id =3D d_config->b_info.arch_arm.arm_sc=
i.agent_id;
+        break;
     default:
         LOG(ERROR, "Unknown ARM_SCI type %d",
             d_config->b_info.arch_arm.arm_sci.type);
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_type=
s.idl
index 4a958f69f4..9bfbf09145 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -554,11 +554,13 @@ libxl_sve_type =3D Enumeration("sve_type", [
=20
 libxl_arm_sci_type =3D Enumeration("arm_sci_type", [
     (0, "none"),
-    (1, "scmi_smc")
+    (1, "scmi_smc"),
+    (2, "scmi_smc_multiagent")
     ], init_val =3D "LIBXL_ARM_SCI_TYPE_NONE")
=20
 libxl_arm_sci =3D Struct("arm_sci", [
     ("type", libxl_arm_sci_type),
+    ("agent_id", uint8)
     ])
=20
 libxl_rdm_reserve =3D Struct("rdm_reserve", [
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 1cc41f1bff..0c389d25f9 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1306,6 +1306,18 @@ static int parse_arm_sci_config(XLU_Config *cfg, lib=
xl_arm_sci *arm_sci,
             }
         }
=20
+        if (MATCH_OPTION("agent_id", ptr, oparg)) {
+            unsigned long val =3D parse_ulong(oparg);
+
+            if (!val || val > 255) {
+                fprintf(stderr, "An invalid ARM_SCI agent_id specified (%l=
u). Valid range [1..255]\n",
+                        val);
+                ret =3D ERROR_INVAL;
+                goto out;
+            }
+            arm_sci->agent_id =3D val;
+        }
+
         ptr =3D strtok(NULL, ",");
     }
=20
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 4181c10538..ddadc89148 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -299,6 +299,17 @@ static int __init domu_dt_sci_parse(struct dt_device_n=
ode *node,
         d_cfg->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
     else if ( !strcmp(sci_type, "scmi_smc") )
         d_cfg->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC;
+    else if ( !strcmp(sci_type, "scmi_smc_multiagent") )
+    {
+        uint32_t agent_id =3D 0;
+
+        if ( !dt_property_read_u32(node, "xen,sci-agent-id", &agent_id) ||
+             agent_id > UINT8_MAX )
+            return -EINVAL;
+
+        d_cfg->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC_MA=
;
+        d_cfg->arch.arm_sci_agent_id =3D agent_id;
+    }
     else
     {
         printk(XENLOG_ERR "xen,sci_type in not valid (%s) for domain %s\n"=
,
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index fb8fbb1650..794ea1aa42 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -55,6 +55,10 @@ boolean_param("ext_regions", opt_ext_regions);
 static u64 __initdata dom0_mem;
 static bool __initdata dom0_mem_set;
=20
+/* SCMI agent ID for dom0, parsed from dom0=3Dsci-agent-id=3D<value> */
+#define SCMI_AGENT_ID_INVALID 0xFF
+static uint8_t __initdata opt_dom0_scmi_agent_id =3D SCMI_AGENT_ID_INVALID=
;
+
 static int __init parse_dom0_mem(const char *s)
 {
     dom0_mem_set =3D true;
@@ -83,6 +87,16 @@ int __init parse_arch_dom0_param(const char *s, const ch=
ar *e)
 #endif
     }
=20
+    if ( !parse_signed_integer("sci-agent-id", s, e, &val) )
+    {
+        if ( (val >=3D 0) && (val <=3D UINT8_MAX) )
+            opt_dom0_scmi_agent_id =3D val;
+        else
+            printk(XENLOG_INFO "'sci-agent-id=3D%lld' value out of range!\=
n", val);
+
+        return 0;
+    }
+
     return -EINVAL;
 }
=20
@@ -509,7 +523,8 @@ static int __init write_properties(struct domain *d, st=
ruct kernel_info *kinfo,
                  dt_property_name_is_equal(prop, "linux,uefi-mmap-start") =
||
                  dt_property_name_is_equal(prop, "linux,uefi-mmap-size") |=
|
                  dt_property_name_is_equal(prop, "linux,uefi-mmap-desc-siz=
e") ||
-                 dt_property_name_is_equal(prop, "linux,uefi-mmap-desc-ver=
"))
+                 dt_property_name_is_equal(prop, "linux,uefi-mmap-desc-ver=
") ||
+                 dt_property_name_is_equal(prop, "xen,config") )
                 continue;
=20
             if ( dt_property_name_is_equal(prop, "xen,dom0-bootargs") )
@@ -2067,6 +2082,15 @@ void __init create_dom0(void)
     dom0_cfg.arch.tee_type =3D tee_get_type();
     dom0_cfg.max_vcpus =3D dom0_max_vcpus();
=20
+    /* Set up SCMI agent ID if specified in dom0=3D command line */
+    if ( opt_dom0_scmi_agent_id !=3D SCMI_AGENT_ID_INVALID )
+    {
+        dom0_cfg.arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC_=
MA;
+        dom0_cfg.arch.arm_sci_agent_id =3D opt_dom0_scmi_agent_id;
+    }
+    else
+        dom0_cfg.arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
+
     if ( iommu_enabled )
         dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
=20
diff --git a/xen/arch/arm/firmware/Kconfig b/xen/arch/arm/firmware/Kconfig
index 5c5f0880c4..972cd9b173 100644
--- a/xen/arch/arm/firmware/Kconfig
+++ b/xen/arch/arm/firmware/Kconfig
@@ -29,6 +29,18 @@ config SCMI_SMC
 	  driver domain.
 	  Use with EL3 firmware which supports only single SCMI OSPM agent.
=20
+config SCMI_SMC_MA
+	bool "Enable ARM SCMI SMC multi-agent driver"
+	depends on ARM_64
+	select ARM_SCI
+	help
+	  Enables SCMI SMC/HVC multi-agent in XEN to pass SCMI requests from Doma=
ins
+	  to EL3 firmware (TF-A) which supports multi-agent feature.
+	  This feature allows to enable SCMI per Domain using unique SCMI agent_i=
d,
+	  so Domain is identified by EL3 firmware as an SCMI Agent and can access
+	  allowed platform resources through dedicated SMC/HVC Shared memory base=
d
+	  transport.
+
 endchoice
=20
 endmenu
diff --git a/xen/arch/arm/firmware/Makefile b/xen/arch/arm/firmware/Makefil=
e
index 71bdefc24a..37927e690e 100644
--- a/xen/arch/arm/firmware/Makefile
+++ b/xen/arch/arm/firmware/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_ARM_SCI) +=3D sci.o
 obj-$(CONFIG_SCMI_SMC) +=3D scmi-smc.o
+obj-$(CONFIG_SCMI_SMC_MA) +=3D scmi-shmem.o scmi-smc-multiagent.o
diff --git a/xen/arch/arm/firmware/scmi-proto.h b/xen/arch/arm/firmware/scm=
i-proto.h
new file mode 100644
index 0000000000..49f63cfc0a
--- /dev/null
+++ b/xen/arch/arm/firmware/scmi-proto.h
@@ -0,0 +1,164 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Arm System Control and Management Interface definitions
+ * Version 3.0 (DEN0056C)
+ *
+ * Copyright (c) 2025 EPAM Systems
+ */
+
+#ifndef ARM_FIRMWARE_SCMI_PROTO_H_
+#define ARM_FIRMWARE_SCMI_PROTO_H_
+
+#include <xen/stdint.h>
+
+#define SCMI_SHORT_NAME_MAX_SIZE 16
+
+/* SCMI status codes. See section 4.1.4 */
+#define SCMI_SUCCESS              0
+#define SCMI_NOT_SUPPORTED      (-1)
+#define SCMI_INVALID_PARAMETERS (-2)
+#define SCMI_DENIED             (-3)
+#define SCMI_NOT_FOUND          (-4)
+#define SCMI_OUT_OF_RANGE       (-5)
+#define SCMI_BUSY               (-6)
+#define SCMI_COMMS_ERROR        (-7)
+#define SCMI_GENERIC_ERROR      (-8)
+#define SCMI_HARDWARE_ERROR     (-9)
+#define SCMI_PROTOCOL_ERROR     (-10)
+
+/* Protocol IDs */
+#define SCMI_BASE_PROTOCOL 0x10
+
+/* Base protocol message IDs */
+#define SCMI_BASE_PROTOCOL_VERSION            0x0
+#define SCMI_BASE_PROTOCOL_ATTIBUTES          0x1
+#define SCMI_BASE_PROTOCOL_MESSAGE_ATTRIBUTES 0x2
+#define SCMI_BASE_DISCOVER_AGENT              0x7
+#define SCMI_BASE_SET_DEVICE_PERMISSIONS      0x9
+#define SCMI_BASE_RESET_AGENT_CONFIGURATION   0xB
+
+typedef struct scmi_msg_header {
+    uint8_t id;
+    uint8_t type;
+    uint8_t protocol;
+    uint32_t status;
+} scmi_msg_header_t;
+
+/* Table 2 Message header format */
+#define SCMI_HDR_ID    GENMASK(7, 0)
+#define SCMI_HDR_TYPE  GENMASK(9, 8)
+#define SCMI_HDR_PROTO GENMASK(17, 10)
+
+#define SCMI_FIELD_GET(_mask, _reg)                                       =
     \
+    ((typeof(_mask))(((_reg) & (_mask)) >> (ffs64(_mask) - 1)))
+#define SCMI_FIELD_PREP(_mask, _val)                                      =
     \
+    (((typeof(_mask))(_val) << (ffs64(_mask) - 1)) & (_mask))
+
+static inline uint32_t pack_scmi_header(scmi_msg_header_t *hdr)
+{
+    return SCMI_FIELD_PREP(SCMI_HDR_ID, hdr->id) |
+           SCMI_FIELD_PREP(SCMI_HDR_TYPE, hdr->type) |
+           SCMI_FIELD_PREP(SCMI_HDR_PROTO, hdr->protocol);
+}
+
+static inline void unpack_scmi_header(uint32_t msg_hdr, scmi_msg_header_t =
*hdr)
+{
+    hdr->id =3D SCMI_FIELD_GET(SCMI_HDR_ID, msg_hdr);
+    hdr->type =3D SCMI_FIELD_GET(SCMI_HDR_TYPE, msg_hdr);
+    hdr->protocol =3D SCMI_FIELD_GET(SCMI_HDR_PROTO, msg_hdr);
+}
+
+static inline int scmi_to_xen_errno(int scmi_status)
+{
+    if ( scmi_status =3D=3D SCMI_SUCCESS )
+        return 0;
+
+    switch ( scmi_status )
+    {
+    case SCMI_NOT_SUPPORTED:
+        return -EOPNOTSUPP;
+    case SCMI_INVALID_PARAMETERS:
+        return -EINVAL;
+    case SCMI_DENIED:
+        return -EACCES;
+    case SCMI_NOT_FOUND:
+        return -ENOENT;
+    case SCMI_OUT_OF_RANGE:
+        return -ERANGE;
+    case SCMI_BUSY:
+        return -EBUSY;
+    case SCMI_COMMS_ERROR:
+        return -ENOTCONN;
+    case SCMI_GENERIC_ERROR:
+        return -EIO;
+    case SCMI_HARDWARE_ERROR:
+        return -ENXIO;
+    case SCMI_PROTOCOL_ERROR:
+        return -EBADMSG;
+    default:
+        return -EINVAL;
+    }
+}
+
+/* PROTOCOL_VERSION */
+#define SCMI_VERSION_MINOR GENMASK(15, 0)
+#define SCMI_VERSION_MAJOR GENMASK(31, 16)
+
+struct scmi_msg_prot_version_p2a {
+    uint32_t version;
+} __packed;
+
+/* BASE PROTOCOL_ATTRIBUTES */
+#define SCMI_BASE_ATTR_NUM_PROTO GENMASK(7, 0)
+#define SCMI_BASE_ATTR_NUM_AGENT GENMASK(15, 8)
+
+struct scmi_msg_base_attributes_p2a {
+    uint32_t attributes;
+} __packed;
+
+/*
+ * BASE_DISCOVER_AGENT
+ */
+#define SCMI_BASE_AGENT_ID_OWN 0xFFFFFFFF
+
+struct scmi_msg_base_discover_agent_a2p {
+    uint32_t agent_id;
+} __packed;
+
+struct scmi_msg_base_discover_agent_p2a {
+    uint32_t agent_id;
+    char name[SCMI_SHORT_NAME_MAX_SIZE];
+} __packed;
+
+/*
+ * BASE_SET_DEVICE_PERMISSIONS
+ */
+#define SCMI_BASE_DEVICE_ACCESS_ALLOW           BIT(0, UL)
+
+struct scmi_msg_base_set_device_permissions_a2p {
+    uint32_t agent_id;
+    uint32_t device_id;
+    uint32_t flags;
+} __packed;
+
+/*
+ * BASE_RESET_AGENT_CONFIGURATION
+ */
+#define SCMI_BASE_AGENT_PERMISSIONS_RESET       BIT(0, UL)
+
+struct scmi_msg_base_reset_agent_cfg_a2p {
+    uint32_t agent_id;
+    uint32_t flags;
+} __packed;
+
+#endif /* ARM_FIRMWARE_SCMI_PROTO_H_ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/firmware/scmi-shmem.c b/xen/arch/arm/firmware/scm=
i-shmem.c
new file mode 100644
index 0000000000..c681e3c476
--- /dev/null
+++ b/xen/arch/arm/firmware/scmi-shmem.c
@@ -0,0 +1,115 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * SMC/HVC shmem transport implementation used by
+ * SCI SCMI multi-agent driver.
+ *
+ * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+ * Copyright (c) 2025 EPAM Systems
+ */
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/err.h>
+#include <xen/lib/io.h>
+#include <asm/io.h>
+
+#include "scmi-proto.h"
+#include "scmi-shmem.h"
+
+static inline int
+shmem_channel_is_free(const volatile struct scmi_shared_mem __iomem *shmem=
)
+{
+    return (readl(&shmem->channel_status) &
+            SCMI_SHMEM_CHAN_STAT_CHANNEL_FREE) ? 0 : -EBUSY;
+}
+
+int shmem_put_message(volatile struct scmi_shared_mem __iomem *shmem,
+                      scmi_msg_header_t *hdr, void *data, int len)
+{
+    int ret;
+
+    if ( (len + offsetof(struct scmi_shared_mem, msg_payload)) >
+         SCMI_SHMEM_MAPPED_SIZE )
+    {
+        printk(XENLOG_ERR "scmi: Wrong size of smc message. Data is invali=
d\n");
+        return -EINVAL;
+    }
+
+    ret =3D shmem_channel_is_free(shmem);
+    if ( ret )
+        return ret;
+
+    writel_relaxed(0x0, &shmem->channel_status);
+    /* Writing 0x0 right now, but "shmem"_FLAG_INTR_ENABLED can be set */
+    writel_relaxed(0x0, &shmem->flags);
+    writel_relaxed(sizeof(shmem->msg_header) + len, &shmem->length);
+    writel(pack_scmi_header(hdr), &shmem->msg_header);
+
+    if ( len > 0 && data )
+        __memcpy_toio(shmem->msg_payload, data, len);
+
+    return 0;
+}
+
+int shmem_get_response(const volatile struct scmi_shared_mem __iomem *shme=
m,
+                       scmi_msg_header_t *hdr, void *data, int len)
+{
+    int recv_len;
+    int ret;
+    int pad =3D sizeof(hdr->status);
+
+    if ( len >=3D SCMI_SHMEM_MAPPED_SIZE -
+         offsetof(struct scmi_shared_mem, msg_payload) )
+    {
+        printk(XENLOG_ERR
+               "scmi: Wrong size of input smc message. Data may be invalid=
\n");
+        return -EINVAL;
+    }
+
+    ret =3D shmem_channel_is_free(shmem);
+    if ( ret )
+        return ret;
+
+    recv_len =3D readl(&shmem->length) - sizeof(shmem->msg_header);
+
+    if ( recv_len < 0 )
+    {
+        printk(XENLOG_ERR
+               "scmi: Wrong size of smc message. Data may be invalid\n");
+        return -EINVAL;
+    }
+
+    unpack_scmi_header(readl(&shmem->msg_header), hdr);
+
+    hdr->status =3D readl(&shmem->msg_payload);
+    recv_len =3D recv_len > pad ? recv_len - pad : 0;
+
+    ret =3D scmi_to_xen_errno(hdr->status);
+    if ( ret )
+    {
+        printk(XENLOG_DEBUG "scmi: Error received: %d\n", ret);
+        return ret;
+    }
+
+    if ( recv_len > len )
+    {
+        printk(XENLOG_ERR
+               "scmi: Not enough buffer for message %d, expecting %d\n",
+               recv_len, len);
+        return -EINVAL;
+    }
+
+    if ( recv_len > 0 )
+        __memcpy_fromio(data, shmem->msg_payload + pad, recv_len);
+
+    return 0;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/firmware/scmi-shmem.h b/xen/arch/arm/firmware/scm=
i-shmem.h
new file mode 100644
index 0000000000..7313cb6b26
--- /dev/null
+++ b/xen/arch/arm/firmware/scmi-shmem.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Arm System Control and Management Interface definitions
+ * Version 3.0 (DEN0056C)
+ * Shared Memory based Transport
+ *
+ * Copyright (c) 2024 EPAM Systems
+ */
+
+#ifndef ARM_FIRMWARE_SCMI_SHMEM_H_
+#define ARM_FIRMWARE_SCMI_SHMEM_H_
+
+#include <xen/stdint.h>
+
+#define SCMI_SHMEM_CHAN_STAT_CHANNEL_FREE  BIT(0, UL)
+#define SCMI_SHMEM_CHAN_STAT_CHANNEL_ERROR BIT(1, UL)
+
+struct scmi_shared_mem {
+    uint32_t reserved;
+    uint32_t channel_status;
+    uint32_t reserved1[2];
+    uint32_t flags;
+    uint32_t length;
+    uint32_t msg_header;
+    uint8_t msg_payload[];
+};
+
+#define SCMI_SHMEM_MAPPED_SIZE PAGE_SIZE
+
+int shmem_put_message(volatile struct scmi_shared_mem __iomem *shmem,
+                      scmi_msg_header_t *hdr, void *data, int len);
+
+int shmem_get_response(const volatile struct scmi_shared_mem __iomem *shme=
m,
+                       scmi_msg_header_t *hdr, void *data, int len);
+#endif /* ARM_FIRMWARE_SCMI_SHMEM_H_ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/firmware/scmi-smc-multiagent.c b/xen/arch/arm/fir=
mware/scmi-smc-multiagent.c
new file mode 100644
index 0000000000..8e532798a6
--- /dev/null
+++ b/xen/arch/arm/firmware/scmi-smc-multiagent.c
@@ -0,0 +1,794 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * SCI SCMI multi-agent driver, using SMC/HVC shmem as transport.
+ *
+ * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+ * Copyright (c) 2025 EPAM Systems
+ */
+
+#include <xen/acpi.h>
+
+#include <xen/device_tree.h>
+#include <xen/init.h>
+#include <xen/iocap.h>
+#include <xen/err.h>
+#include <xen/libfdt/libfdt.h>
+#include <xen/param.h>
+#include <xen/sched.h>
+#include <xen/vmap.h>
+
+#include <asm/firmware/sci.h>
+#include <asm/smccc.h>
+
+#include "scmi-proto.h"
+#include "scmi-shmem.h"
+
+#define SCMI_AGENT_ID_INVALID 0xFF
+
+#define SCMI_SECONDARY_AGENTS "scmi-secondary-agents"
+
+struct scmi_channel {
+    uint32_t agent_id;
+    uint32_t func_id;
+    domid_t domain_id;
+    uint64_t paddr;
+    struct scmi_shared_mem __iomem *shmem;
+    spinlock_t lock;
+    struct list_head list;
+};
+
+struct scmi_data {
+    struct list_head channel_list;
+    spinlock_t channel_list_lock;
+    uint32_t func_id;
+    bool initialized;
+    uint32_t shmem_phandle;
+    uint32_t hyp_channel_agent_id;
+    struct dt_device_node *dt_dev;
+};
+
+static struct scmi_data scmi_data;
+
+static int send_smc_message(struct scmi_channel *chan_info,
+                            scmi_msg_header_t *hdr, void *data, int len)
+{
+    struct arm_smccc_res resp;
+    int ret;
+
+    ret =3D shmem_put_message(chan_info->shmem, hdr, data, len);
+    if ( ret )
+        return ret;
+
+    arm_smccc_1_1_smc(chan_info->func_id, 0, 0, 0, 0, 0, 0, 0, &resp);
+
+    if ( resp.a0 =3D=3D ARM_SMCCC_INVALID_PARAMETER )
+        return -EINVAL;
+
+    if ( resp.a0 )
+        return -EOPNOTSUPP;
+
+    return 0;
+}
+
+static int do_smc_xfer(struct scmi_channel *chan_info, scmi_msg_header_t *=
hdr,
+                       void *tx_data, int tx_size, void *rx_data, int rx_s=
ize)
+{
+    int ret =3D 0;
+
+    ASSERT(chan_info && chan_info->shmem);
+
+    if ( !hdr )
+        return -EINVAL;
+
+    spin_lock(&chan_info->lock);
+
+    printk(XENLOG_DEBUG
+           "scmi: agent_id =3D %d msg_id =3D %x type =3D %d, proto =3D %x\=
n",
+           chan_info->agent_id, hdr->id, hdr->type, hdr->protocol);
+
+    ret =3D send_smc_message(chan_info, hdr, tx_data, tx_size);
+    if ( ret )
+        goto clean;
+
+    ret =3D shmem_get_response(chan_info->shmem, hdr, rx_data, rx_size);
+
+clean:
+    printk(XENLOG_DEBUG
+           "scmi: get smc response agent_id =3D %d msg_id =3D %x proto =3D=
 %x res=3D%d\n",
+           chan_info->agent_id, hdr->id, hdr->protocol, ret);
+
+    spin_unlock(&chan_info->lock);
+
+    return ret;
+}
+
+static struct scmi_channel *get_channel_by_id(uint32_t agent_id)
+{
+    struct scmi_channel *curr;
+    bool found =3D false;
+
+    spin_lock(&scmi_data.channel_list_lock);
+    list_for_each_entry(curr, &scmi_data.channel_list, list)
+    {
+        if ( curr->agent_id =3D=3D agent_id )
+        {
+            found =3D true;
+            break;
+        }
+    }
+
+    spin_unlock(&scmi_data.channel_list_lock);
+    if ( found )
+        return curr;
+
+    return NULL;
+}
+
+static struct scmi_channel *acquire_scmi_channel(struct domain *d,
+                                                 uint32_t agent_id)
+{
+    struct scmi_channel *curr;
+    struct scmi_channel *ret =3D ERR_PTR(-ENOENT);
+
+    spin_lock(&scmi_data.channel_list_lock);
+    list_for_each_entry(curr, &scmi_data.channel_list, list)
+    {
+        if ( curr->agent_id =3D=3D agent_id )
+        {
+            if ( curr->domain_id !=3D DOMID_INVALID )
+            {
+                ret =3D ERR_PTR(-EEXIST);
+                break;
+            }
+
+            curr->domain_id =3D d->domain_id;
+            ret =3D curr;
+            break;
+        }
+    }
+
+    spin_unlock(&scmi_data.channel_list_lock);
+
+    return ret;
+}
+
+static void relinquish_scmi_channel(struct scmi_channel *channel)
+{
+    ASSERT(channel !=3D NULL);
+
+    spin_lock(&scmi_data.channel_list_lock);
+    channel->domain_id =3D DOMID_INVALID;
+    spin_unlock(&scmi_data.channel_list_lock);
+}
+
+static int map_channel_memory(struct scmi_channel *channel)
+{
+    ASSERT(channel && channel->paddr);
+    channel->shmem =3D ioremap_nocache(channel->paddr, SCMI_SHMEM_MAPPED_S=
IZE);
+    if ( !channel->shmem )
+        return -ENOMEM;
+
+    channel->shmem->channel_status =3D SCMI_SHMEM_CHAN_STAT_CHANNEL_FREE;
+    printk(XENLOG_DEBUG "scmi: Got shmem %lx after vmap %p\n", channel->pa=
ddr,
+           channel->shmem);
+
+    return 0;
+}
+
+static void unmap_channel_memory(struct scmi_channel *channel)
+{
+    ASSERT(channel && channel->shmem);
+    iounmap(channel->shmem);
+    channel->shmem =3D NULL;
+}
+
+static struct scmi_channel *smc_create_channel(uint32_t agent_id,
+                                               uint32_t func_id, uint64_t =
addr)
+{
+    struct scmi_channel *channel, *curr;
+
+    spin_lock(&scmi_data.channel_list_lock);
+
+    /* Check if channel already exists while holding the lock */
+    list_for_each_entry(curr, &scmi_data.channel_list, list)
+    {
+        if ( curr->agent_id =3D=3D agent_id )
+        {
+            spin_unlock(&scmi_data.channel_list_lock);
+            return ERR_PTR(-EEXIST);
+        }
+    }
+
+    channel =3D xmalloc(struct scmi_channel);
+    if ( !channel )
+    {
+        spin_unlock(&scmi_data.channel_list_lock);
+        return ERR_PTR(-ENOMEM);
+    }
+
+    spin_lock_init(&channel->lock);
+    channel->agent_id =3D agent_id;
+    channel->func_id =3D func_id;
+    channel->domain_id =3D DOMID_INVALID;
+    channel->shmem =3D NULL;
+    channel->paddr =3D addr;
+    list_add_tail(&channel->list, &scmi_data.channel_list);
+
+    spin_unlock(&scmi_data.channel_list_lock);
+    return channel;
+}
+
+static void free_channel_list(void)
+{
+    struct scmi_channel *curr, *_curr;
+
+    list_for_each_entry_safe(curr, _curr, &scmi_data.channel_list, list)
+    {
+        list_del(&curr->list);
+        xfree(curr);
+    }
+}
+
+static int __init
+scmi_dt_read_hyp_channel_addr(struct dt_device_node *scmi_node, u64 *addr,
+                              u64 *size)
+{
+    struct dt_device_node *shmem_node;
+    const __be32 *prop;
+
+    prop =3D dt_get_property(scmi_node, "shmem", NULL);
+    if ( !prop )
+        return -EINVAL;
+
+    shmem_node =3D dt_find_node_by_phandle(be32_to_cpu(*prop));
+    if ( IS_ERR_OR_NULL(shmem_node) )
+    {
+        printk(XENLOG_ERR
+               "scmi: Device tree error, can't parse reserved memory %ld\n=
",
+               PTR_ERR(shmem_node));
+        return PTR_ERR(shmem_node);
+    }
+
+    return dt_device_get_address(shmem_node, 0, addr, size);
+}
+
+/*
+ * Handle Dom0 SCMI specific DT nodes
+ *
+ * Make a decision on copying SCMI specific nodes into Dom0 device tree.
+ * For SCMI multi-agent case:
+ * - shmem nodes will not be copied and generated instead if SCMI
+ *   is enabled for Dom0
+ * - scmi node will be copied if SCMI is enabled for Dom0
+ */
+static bool scmi_dt_handle_node(struct domain *d, struct dt_device_node *n=
ode)
+{
+    static const struct dt_device_match shmem_matches[] __initconst =3D {
+        DT_MATCH_COMPATIBLE("arm,scmi-shmem"),
+        { /* sentinel */ },
+    };
+    static const struct dt_device_match scmi_matches[] __initconst =3D {
+        DT_MATCH_PATH("/firmware/scmi"),
+        { /* sentinel */ },
+    };
+
+    if ( !scmi_data.initialized )
+        return false;
+
+    /* skip scmi shmem node for dom0 if scmi not enabled */
+    if ( dt_match_node(shmem_matches, node) && !sci_domain_is_enabled(d) )
+    {
+        dt_dprintk("  Skip scmi shmem node\n");
+        return true;
+    }
+
+    /* drop scmi if not enabled */
+    if ( dt_match_node(scmi_matches, node) && !sci_domain_is_enabled(d) )
+    {
+        dt_dprintk("  Skip scmi node\n");
+        return true;
+    }
+
+    return false;
+}
+
+static int scmi_assign_device(uint32_t agent_id, uint32_t device_id,
+                              uint32_t flags)
+{
+    struct scmi_msg_base_set_device_permissions_a2p tx;
+    struct scmi_channel *channel;
+    scmi_msg_header_t hdr;
+
+    channel =3D get_channel_by_id(scmi_data.hyp_channel_agent_id);
+    if ( !channel )
+        return -EINVAL;
+
+    hdr.id =3D SCMI_BASE_SET_DEVICE_PERMISSIONS;
+    hdr.type =3D 0;
+    hdr.protocol =3D SCMI_BASE_PROTOCOL;
+
+    tx.agent_id =3D agent_id;
+    tx.device_id =3D device_id;
+    tx.flags =3D flags;
+
+    return do_smc_xfer(channel, &hdr, &tx, sizeof(tx), NULL, 0);
+}
+
+static int scmi_dt_assign_device(struct domain *d,
+                                 struct dt_phandle_args *ac_spec)
+{
+    struct scmi_channel *agent_channel;
+    uint32_t scmi_device_id =3D ac_spec->args[0];
+    int ret;
+
+    if ( !d->arch.sci_data )
+        return 0;
+
+    /* The access-controllers is specified for DT dev, but it's not a SCMI=
 */
+    if ( ac_spec->np !=3D scmi_data.dt_dev )
+        return 0;
+
+    agent_channel =3D d->arch.sci_data;
+
+    spin_lock(&agent_channel->lock);
+
+    ret =3D scmi_assign_device(agent_channel->agent_id, scmi_device_id,
+                             SCMI_BASE_DEVICE_ACCESS_ALLOW);
+    if ( ret )
+    {
+        printk(XENLOG_ERR
+               "scmi: could not assign dev for %pd agent:%d dev_id:%u (%d)=
",
+               d, agent_channel->agent_id, scmi_device_id, ret);
+    }
+
+    spin_unlock(&agent_channel->lock);
+    return ret;
+}
+
+static int collect_agent_id(struct scmi_channel *agent_channel)
+{
+    int ret;
+    scmi_msg_header_t hdr;
+    struct scmi_msg_base_discover_agent_p2a da_rx;
+    struct scmi_msg_base_discover_agent_a2p da_tx;
+
+    ret =3D map_channel_memory(agent_channel);
+    if ( ret )
+        return ret;
+
+    hdr.id =3D SCMI_BASE_DISCOVER_AGENT;
+    hdr.type =3D 0;
+    hdr.protocol =3D SCMI_BASE_PROTOCOL;
+
+    da_tx.agent_id =3D agent_channel->agent_id;
+
+    ret =3D do_smc_xfer(agent_channel, &hdr, &da_tx, sizeof(da_tx), &da_rx=
,
+                        sizeof(da_rx));
+    if ( agent_channel->domain_id !=3D DOMID_XEN )
+        unmap_channel_memory(agent_channel);
+    if ( ret )
+        return ret;
+
+    printk(XENLOG_DEBUG "id=3D0x%x name=3D%s\n", da_rx.agent_id, da_rx.nam=
e);
+    agent_channel->agent_id =3D da_rx.agent_id;
+    return 0;
+}
+
+static __init int collect_agents(struct dt_device_node *scmi_node)
+{
+    const struct dt_device_node *config_node;
+    const __be32 *prop;
+    uint32_t len;
+    const __be32 *end;
+    uint32_t cells_per_entry =3D 3; /* Default to 3 cells if property is a=
bsent. */
+
+    config_node =3D dt_find_node_by_path("/chosen/xen,config");
+    if ( !config_node )
+    {
+        printk(XENLOG_WARNING "scmi: /chosen/xen,config node not found, no=
 agents to collect.\n");
+        return -ENOENT;
+    }
+
+    /* Check for the optional '#scmi-secondary-agents-cells' property. */
+    if ( dt_property_read_u32(config_node, "#scmi-secondary-agents-cells",
+                              &cells_per_entry) )
+    {
+        if ( cells_per_entry !=3D 2 && cells_per_entry !=3D 3 )
+        {
+            printk(XENLOG_ERR "scmi: Invalid #scmi-secondary-agents-cells =
value: %u\n",
+                   cells_per_entry);
+            return -EINVAL;
+        }
+    }
+
+    prop =3D dt_get_property(config_node, SCMI_SECONDARY_AGENTS, &len);
+    if ( !prop )
+    {
+        printk(XENLOG_ERR "scmi: No %s property found, no agents to collec=
t.\n",
+               SCMI_SECONDARY_AGENTS);
+        return -EINVAL;
+    }
+
+    /* Validate that the property length is a multiple of the cell size. *=
/
+    if ( len =3D=3D 0 || len % (cells_per_entry * sizeof(uint32_t)) !=3D 0=
 )
+    {
+        printk(XENLOG_ERR "scmi: Invalid length of %s property: %u for %u =
cells per entry\n",
+               SCMI_SECONDARY_AGENTS, len, cells_per_entry);
+        return -EINVAL;
+    }
+
+    end =3D (const __be32 *)((const u8 *)prop + len);
+
+    for ( ; prop < end; )
+    {
+        uint32_t agent_id;
+        uint32_t smc_id;
+        uint32_t shmem_phandle;
+        struct dt_device_node *node;
+        u64 addr, size;
+        int ret;
+        struct scmi_channel *agent_channel;
+
+        smc_id =3D be32_to_cpu(*prop++);
+        shmem_phandle =3D be32_to_cpu(*prop++);
+
+        if ( cells_per_entry =3D=3D 3 )
+            agent_id =3D be32_to_cpu(*prop++);
+        else
+            agent_id =3D SCMI_BASE_AGENT_ID_OWN;
+
+        node =3D dt_find_node_by_phandle(shmem_phandle);
+        if ( !node )
+        {
+            printk(XENLOG_ERR "scmi: Could not find shmem node for agent %=
u\n",
+                   agent_id);
+            return -EINVAL;
+        }
+
+        ret =3D dt_device_get_address(node, 0, &addr, &size);
+        if ( ret )
+        {
+            printk(XENLOG_ERR
+                   "scmi: Could not read shmem address for agent %u: %d\n"=
,
+                   agent_id, ret);
+            return ret;
+        }
+
+        if ( !IS_ALIGNED(size, SCMI_SHMEM_MAPPED_SIZE) )
+        {
+            printk(XENLOG_ERR "scmi: shmem memory is not aligned\n");
+            return -EINVAL;
+        }
+
+        agent_channel =3D smc_create_channel(agent_id, smc_id, addr);
+        if ( IS_ERR(agent_channel) )
+        {
+            printk(XENLOG_ERR "scmi: Could not create channel for agent %u=
: %ld\n",
+                   agent_id, PTR_ERR(agent_channel));
+            return PTR_ERR(agent_channel);
+        }
+
+        if ( cells_per_entry =3D=3D 2 )
+        {
+            ret =3D collect_agent_id(agent_channel);
+            if ( ret )
+                return ret;
+        }
+
+        printk(XENLOG_DEBUG "scmi: Agent %u SMC %X addr %lx\n", agent_chan=
nel->agent_id,
+               smc_id, (unsigned long)addr);
+    }
+
+    return 0;
+}
+
+static int scmi_domain_init(struct domain *d,
+                            struct xen_domctl_createdomain *config)
+{
+    struct scmi_channel *channel;
+    int ret;
+
+    if ( !scmi_data.initialized )
+        return 0;
+
+    /*
+     * SCMI support is configured via:
+     * - For dom0: dom0=3Dsci-agent-id=3D<value> in Xen command line
+     * - For dom0less: xen,sci-agent-id in device tree
+     * The config->arch.arm_sci_type and config->arch.arm_sci_agent_id
+     * are already set by domain_build.c or dom0less-build.c
+     */
+
+    if ( config->arch.arm_sci_type =3D=3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE )
+        return 0;
+
+    channel =3D acquire_scmi_channel(d, config->arch.arm_sci_agent_id);
+    if ( IS_ERR(channel) )
+    {
+        printk(XENLOG_ERR
+               "scmi: Failed to acquire SCMI channel for agent_id %u: %ld\=
n",
+               config->arch.arm_sci_agent_id, PTR_ERR(channel));
+        return PTR_ERR(channel);
+    }
+
+    printk(XENLOG_INFO
+           "scmi: Acquire channel id =3D 0x%x, domain_id =3D %d paddr =3D =
0x%lx\n",
+           channel->agent_id, channel->domain_id, channel->paddr);
+
+    /*
+     * Dom0 (if present) needs to have an access to the guest memory range
+     * to satisfy iomem_access_permitted() check in XEN_DOMCTL_iomem_permi=
ssion
+     * domctl.
+     */
+    if ( hardware_domain && !is_hardware_domain(d) )
+    {
+        ret =3D iomem_permit_access(hardware_domain, paddr_to_pfn(channel-=
>paddr),
+                                  paddr_to_pfn(channel->paddr + PAGE_SIZE =
- 1));
+        if ( ret )
+            goto error;
+    }
+
+    d->arch.sci_data =3D channel;
+    d->arch.sci_enabled =3D true;
+
+    return 0;
+
+error:
+    relinquish_scmi_channel(channel);
+    return ret;
+}
+
+int scmi_domain_sanitise_config(struct xen_domctl_createdomain *config)
+{
+    if ( config->arch.arm_sci_type !=3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE &&
+         config->arch.arm_sci_type !=3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC=
_MA )
+    {
+        dprintk(XENLOG_INFO, "scmi: Unsupported ARM_SCI type\n");
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+static int scmi_relinquish_resources(struct domain *d)
+{
+    int ret;
+    struct scmi_channel *channel, *agent_channel;
+    scmi_msg_header_t hdr;
+    struct scmi_msg_base_reset_agent_cfg_a2p tx;
+
+    if ( !d->arch.sci_data )
+        return 0;
+
+    agent_channel =3D d->arch.sci_data;
+
+    spin_lock(&agent_channel->lock);
+    tx.agent_id =3D agent_channel->agent_id;
+    spin_unlock(&agent_channel->lock);
+
+    channel =3D get_channel_by_id(scmi_data.hyp_channel_agent_id);
+    if ( !channel )
+    {
+        printk(XENLOG_ERR
+               "scmi: Unable to get Hypervisor scmi channel for domain %d\=
n",
+               d->domain_id);
+        return -EINVAL;
+    }
+
+    hdr.id =3D SCMI_BASE_RESET_AGENT_CONFIGURATION;
+    hdr.type =3D 0;
+    hdr.protocol =3D SCMI_BASE_PROTOCOL;
+
+    tx.flags =3D 0;
+
+    ret =3D do_smc_xfer(channel, &hdr, &tx, sizeof(tx), NULL, 0);
+    if ( ret =3D=3D -EOPNOTSUPP )
+        return 0;
+
+    return ret;
+}
+
+static void scmi_domain_destroy(struct domain *d)
+{
+    struct scmi_channel *channel;
+
+    if ( !d->arch.sci_data )
+        return;
+
+    channel =3D d->arch.sci_data;
+    spin_lock(&channel->lock);
+
+    relinquish_scmi_channel(channel);
+    printk(XENLOG_DEBUG "scmi: Free domain %d\n", d->domain_id);
+
+    d->arch.sci_data =3D NULL;
+    d->arch.sci_enabled =3D false;
+
+    spin_unlock(&channel->lock);
+}
+
+static bool scmi_handle_call(struct cpu_user_regs *regs)
+{
+    uint32_t fid =3D (uint32_t)get_user_reg(regs, 0);
+    struct scmi_channel *agent_channel;
+    struct domain *d =3D current->domain;
+    struct arm_smccc_res resp;
+    bool res =3D false;
+
+    if ( !sci_domain_is_enabled(d) )
+        return false;
+
+    agent_channel =3D d->arch.sci_data;
+    spin_lock(&agent_channel->lock);
+
+    if ( agent_channel->func_id !=3D fid )
+    {
+        res =3D false;
+        goto unlock;
+    }
+
+    arm_smccc_1_1_smc(fid,
+                      get_user_reg(regs, 1),
+                      get_user_reg(regs, 2),
+                      get_user_reg(regs, 3),
+                      get_user_reg(regs, 4),
+                      get_user_reg(regs, 5),
+                      get_user_reg(regs, 6),
+                      get_user_reg(regs, 7),
+                      &resp);
+
+    set_user_reg(regs, 0, resp.a0);
+    set_user_reg(regs, 1, resp.a1);
+    set_user_reg(regs, 2, resp.a2);
+    set_user_reg(regs, 3, resp.a3);
+    res =3D true;
+unlock:
+    spin_unlock(&agent_channel->lock);
+
+    return res;
+}
+
+static const struct sci_mediator_ops scmi_ops =3D {
+    .domain_init =3D scmi_domain_init,
+    .domain_destroy =3D scmi_domain_destroy,
+    .relinquish_resources =3D scmi_relinquish_resources,
+    .handle_call =3D scmi_handle_call,
+    .dom0_dt_handle_node =3D scmi_dt_handle_node,
+    .domain_sanitise_config =3D scmi_domain_sanitise_config,
+    .assign_dt_device =3D scmi_dt_assign_device,
+};
+
+static int __init scmi_check_smccc_ver(void)
+{
+    if ( smccc_ver < ARM_SMCCC_VERSION_1_1 )
+    {
+        printk(XENLOG_WARNING
+               "scmi: No SMCCC 1.1 support, SCMI calls forwarding disabled=
\n");
+        return -ENOSYS;
+    }
+
+    return 0;
+}
+
+static int __init scmi_dt_hyp_channel_read(struct dt_device_node *scmi_nod=
e,
+                                           struct scmi_data *scmi_data,
+                                           u64 *addr)
+{
+    int ret;
+    u64 size;
+
+    if ( !dt_property_read_u32(scmi_node, "arm,smc-id", &scmi_data->func_i=
d) )
+    {
+        printk(XENLOG_ERR "scmi: unable to read smc-id from DT\n");
+        return -ENOENT;
+    }
+
+    ret =3D scmi_dt_read_hyp_channel_addr(scmi_node, addr, &size);
+    if ( IS_ERR_VALUE(ret) )
+        return -ENOENT;
+
+    if ( !IS_ALIGNED(size, SCMI_SHMEM_MAPPED_SIZE) )
+    {
+        printk(XENLOG_ERR "scmi: shmem memory is not aligned\n");
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+static __init int scmi_probe(struct dt_device_node *scmi_node, const void =
*data)
+{
+    u64 addr;
+    int ret;
+    struct scmi_channel *channel;
+    unsigned int n_agents;
+    scmi_msg_header_t hdr;
+    struct scmi_msg_base_attributes_p2a rx;
+
+    ASSERT(scmi_node !=3D NULL);
+
+    INIT_LIST_HEAD(&scmi_data.channel_list);
+    spin_lock_init(&scmi_data.channel_list_lock);
+
+    if ( !acpi_disabled )
+    {
+        printk(XENLOG_WARNING "scmi: is not supported when using ACPI\n");
+        return -EINVAL;
+    }
+
+    ret =3D scmi_check_smccc_ver();
+    if ( ret )
+        return ret;
+
+    ret =3D scmi_dt_hyp_channel_read(scmi_node, &scmi_data, &addr);
+    if ( ret )
+        return ret;
+
+    scmi_data.dt_dev =3D scmi_node;
+
+    channel =3D smc_create_channel(SCMI_BASE_AGENT_ID_OWN, scmi_data.func_=
id, addr);
+    if ( IS_ERR(channel) )
+        goto out;
+
+    /* Mark as Xen management channel before collecting agent ID */
+    channel->domain_id =3D DOMID_XEN;
+
+    /* Request agent id for Xen management channel  */
+    ret =3D collect_agent_id(channel);
+    if ( ret )
+        goto error;
+
+    /* Save the agent id for Xen management channel */
+    scmi_data.hyp_channel_agent_id =3D channel->agent_id;
+
+    hdr.id =3D SCMI_BASE_PROTOCOL_ATTIBUTES;
+    hdr.type =3D 0;
+    hdr.protocol =3D SCMI_BASE_PROTOCOL;
+
+    ret =3D do_smc_xfer(channel, &hdr, NULL, 0, &rx, sizeof(rx));
+    if ( ret )
+        goto error;
+
+    n_agents =3D SCMI_FIELD_GET(SCMI_BASE_ATTR_NUM_AGENT, rx.attributes);
+    printk(XENLOG_DEBUG "scmi: Got agent count %d\n", n_agents);
+    ret =3D collect_agents(scmi_node);
+    if ( ret )
+        goto error;
+
+    ret =3D sci_register(&scmi_ops);
+    if ( ret )
+    {
+        printk(XENLOG_ERR "SCMI: mediator already registered (ret =3D %d)\=
n",
+               ret);
+        return ret;
+    }
+
+    scmi_data.initialized =3D true;
+    goto out;
+
+error:
+    unmap_channel_memory(channel);
+    free_channel_list();
+out:
+    return ret;
+}
+
+static const struct dt_device_match scmi_smc_match[] __initconst =3D {
+    DT_MATCH_PATH("/chosen/xen,config/scmi"),
+    { /* sentinel */ },
+};
+
+DT_DEVICE_START(scmi_smc_ma, "SCMI SMC MEDIATOR", DEVICE_FIRMWARE)
+        .dt_match =3D scmi_smc_match,
+        .init =3D scmi_probe,
+DT_DEVICE_END
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 095b1a23e3..30e46de6d7 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -329,6 +329,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
=20
 #define XEN_DOMCTL_CONFIG_ARM_SCI_NONE      0
 #define XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC  1
+#define XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC_MA  2
=20
 struct xen_arch_domainconfig {
     /* IN/OUT */
@@ -355,6 +356,8 @@ struct xen_arch_domainconfig {
     uint32_t clock_frequency;
     /* IN */
     uint8_t arm_sci_type;
+    /* IN */
+    uint8_t arm_sci_agent_id;
 };
 #endif /* __XEN__ || __XEN_TOOLS__ */
=20
--=20
2.34.1

