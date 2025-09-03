Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 856ACB423B7
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 16:30:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108420.1458577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utoUz-0000On-Ik; Wed, 03 Sep 2025 14:30:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108420.1458577; Wed, 03 Sep 2025 14:30:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utoUz-0000Lm-Ct; Wed, 03 Sep 2025 14:30:09 +0000
Received: by outflank-mailman (input) for mailman id 1108420;
 Wed, 03 Sep 2025 14:30:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rd+t=3O=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1utoUy-0006B7-Be
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 14:30:08 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7be14cd9-88d2-11f0-9809-7dc792cee155;
 Wed, 03 Sep 2025 16:30:05 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by GV1PR03MB10653.eurprd03.prod.outlook.com (2603:10a6:150:203::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Wed, 3 Sep
 2025 14:30:02 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 14:30:02 +0000
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
X-Inumbo-ID: 7be14cd9-88d2-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NFGN6oxP+WQidmqNCIKto45VAjsA8dbbZoEUD90kM5RIE3Wp2naVdv9NcA/Ay4FJCE/0+ED9/mc0Oz/whymCjMQLXQhXo4/Zt6VYLXWQWPxMhzu8tOCXqVSRFH4HnYBAW4ZQpUxtR2uKBY6TcRFMCHW94fwg3gRygFmFujoLeF5s6zyuPGr5ipQIkjqYA2QhMk6U1kGzbd9u/2XxlOfUzbyufWLqkEa0Dhzhfh0MYa657wbWrH4U8rKciewYWWYF0KyTujOU2VAlZQPQn7YxWcdaroUT2Fmbb3FsSndgKLSHKnH/M+SKX4fgJmYZ5up6EeFH6MOmTqb+owH0xMP8Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MhvpXOFtmQxJuVRE9CJhtBXOBydHj3sL4ZVyO2LLm0s=;
 b=Huyq1+oVleO42W3rtzj2+M22ai2bC255VkTYoXDxzhiraeAtQtf+9rDIxXWYSzcJIMXRY+BqzFdhUgUxdG37579dB/8QxZV7ISR9z4G43ijMyiOtubLH25vThsYbtq1XTTIhjEEqPQSy7sQbC4at1hJ+v+5U8TYE94/pTBKtZLtTD+k7tom6/CaVgnCGTXOoSFwsaV/W5G2HVs2Odrq3Y+GYosekqKw7qq6VLBJKBoBBAv2nctA7c2hpZiONlc+Cm0TwC8PQlJ8368JYPVGoy6yz4iRsux9NkfEINLnGRSbXW0EunT5HojLk7EGF5fuIIxTCkatc3eCAABSqk57blA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhvpXOFtmQxJuVRE9CJhtBXOBydHj3sL4ZVyO2LLm0s=;
 b=sDUIPmBps4C20T8aEMjqaVfTNTOClpAIRlGupvArS48gi70Rz+V50SZdmo/ThXbjCsIVloDbvhxtZC3HbHXmUJ6hVBaD30fM3BIXo7Z0D1dFASRddizpZRlgP6+uDIb6stQ8db+OIfCx66h1SvUplQsDo+CH+/ebimXPhzqrDFy36oAqPY9OskQMPn8I9kEm9wKdYWtsVUT3H1Qpo3b/Ul4sZy322KsHp7mmIZXbdCwmdBMSUpPeVJz9m8rAPGejbdpvHbd9BAUO60KIAKs//BlWeqkAydD0TuFd0EsDeeChvndT+xSKMVN7u5+/bYG+o2z+exTfLkh7EhikZhbWaw==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>
Subject: [PATCH v6 05/12] xen/arm: gicv3: implement handling of GICv3.1 eSPI
Thread-Topic: [PATCH v6 05/12] xen/arm: gicv3: implement handling of GICv3.1
 eSPI
Thread-Index: AQHcHN88f5Lxm2g89kebOYUIBUtDZQ==
Date: Wed, 3 Sep 2025 14:30:02 +0000
Message-ID:
 <e8433c8b860c4b8512a57432c61f55dfe629ed07.1756908472.git.leonid_komarianskyi@epam.com>
References: <cover.1756908472.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1756908472.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|GV1PR03MB10653:EE_
x-ms-office365-filtering-correlation-id: bbec0323-2e59-4482-a6b1-08ddeaf65e9d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?dwrhO3qhWArjWi1AqERgtBD8nCiw2M+82rP9VwUfz0mDf97duu56TaxwbW?=
 =?iso-8859-1?Q?uWSZ7oJEyrSKBRNVi1i3l+va/+hUzP/x7CQE2O+a03uY9FByTv4lq8QALm?=
 =?iso-8859-1?Q?w3XbJKflQvcj2besFj9Oqgmqg6G0EfMjAdF7OPP5QXzR8B0wLTpCLpCLTs?=
 =?iso-8859-1?Q?bGw0cz0z9jJbnrBayyLOJfki69NNnxHaA+9dm5In2d4ZWmg+sASpUqEVc+?=
 =?iso-8859-1?Q?z3cUpkj626gcn49movM/wgJD9tXsnYAqhgsJbA6RSrvNSh1xPdsLLyG1YO?=
 =?iso-8859-1?Q?qBXjFyl8HD5uEcu3zeMiClbdnRprl634xG1R8pPzu2e+UP6qTZM5dfViRz?=
 =?iso-8859-1?Q?DJZ7kxX/O55TMC7DL5L63W37dUPUJbrxnipq1ZxFyBrqSt0ihgHnCYULrF?=
 =?iso-8859-1?Q?d7Ljxrkl11+mWD76uy3hJtVZohbn66bvDux+dRsEFxPwvQaGnk3+Gqqh6L?=
 =?iso-8859-1?Q?Q9AXHnh/w1eobAe4zeaj8rmoDkx5l81sPQd6wFcvjUTDkw1nRYMGYigeGY?=
 =?iso-8859-1?Q?fZwH5UbD0mQJwnDqSbBZNUvv2B2SfdwVQPwNvZBqT7JPe9SuLxl4awbCsa?=
 =?iso-8859-1?Q?tkiHs/9beRCRjB7pqyD2VX5wsZTI44XvCTS6LNr1E6Fmsl4PoaQVQCfKOA?=
 =?iso-8859-1?Q?0Qzc+aNKHgQEMfSB44cMJXmWvm5dqpdNJoWCVws+j/g3y2DZVspV96Sfmy?=
 =?iso-8859-1?Q?IslQMgr6q0Cm4G3do3lVHoCrwPPEcY1jOsFr3R7p3kG5qZVKHBcv2jbmK6?=
 =?iso-8859-1?Q?xXLT4QZM5cJrPP2cGGPLedaNbRvXrGcJFGaENbD1CHxnzbi3t1gA5X54am?=
 =?iso-8859-1?Q?oPsC+d8h4RwzVOXou+8gXRSwZgE6FH3RYEQhbAwqAs4erINIb3lHlGBWdl?=
 =?iso-8859-1?Q?yF9h+x+PQQMt5bEkumG8RYsbkpGyjAovNcifTN9pzL36RG5kieAAiLvSWb?=
 =?iso-8859-1?Q?SaU7lpdzzlgxoBDoO3s7wJzkxMcPtetDm4nvFlZFKSqngndaxCiwVOMLCP?=
 =?iso-8859-1?Q?aQqOPzbkiORngwuL8NKUN7NHA6YIDZ8yb6my7ndQ64apoKBqa1V79tqpCT?=
 =?iso-8859-1?Q?OGiO63UtjjMOBd9GpPYaVKX2wwX72ItRZjsxtRfwMG1EqGAPKlNWwu0rpp?=
 =?iso-8859-1?Q?yL6T5XJajLAmfEx/1PbrjLuXqQhj3gEAkhNgWuofNgg/yQKOsquQ6mq/+c?=
 =?iso-8859-1?Q?iUGFw6iziiuS0Y6IUWSJ7dffNINp8nbWL3rZBTvMFMBS29QwOnzqYhdoSP?=
 =?iso-8859-1?Q?xClSBPxnwesP4EZ5uxyoEfI7CqNB3K0+icZFZvOJAbCeU+o5h3eMQEqCCE?=
 =?iso-8859-1?Q?D69jx4RAttQxZhYwsQmk+9rz2Br3CO6xouEz+ZTo3USNtetAstVPtmed7M?=
 =?iso-8859-1?Q?cAu5RYk2lUV/QlchiNoq2h0t0LCyFFWITzQygg87gzHOUyDHzjIOhbMDOq?=
 =?iso-8859-1?Q?0/LlFMvjiqBMMNKTzdrrVbQrnpZiHTonHBpAtfd23iK/9GdkQcLmxxGHTI?=
 =?iso-8859-1?Q?jFOO8kCt6TOg0efeophgYG5kV0SMY7NX3wZW/+cMbL8A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?L8jtYipoQ2lhCiINznNx14DUNwe6EbPXG7Q8bvl0ghzf0RKDEXYqIZytQp?=
 =?iso-8859-1?Q?74+0fUkFkJQoRm5d6U3LNzm7W7bDkeCX9NJAfl/R2bvxEn9wAWzcNC/QRf?=
 =?iso-8859-1?Q?pxll3LcaTzF3FFzwAH8HaMzg8AL8oPtFqFrx3yxT8W7AUGEHZVT+vgUq3W?=
 =?iso-8859-1?Q?sKWL1xFwPp9w5ONIIvhTDU6Xv1VFqipjwFVuQZNNvag7pWAFiVayaFl++B?=
 =?iso-8859-1?Q?AfDO4/bzNpU20eY9sZoY20KEuRNPBqgr1781USMbMmjH4qFbXSco7NNuLm?=
 =?iso-8859-1?Q?roORt0ujS60IiHENT06JbtISlME71YWp49GjXb0YWwG1pVTY6T28q/saJf?=
 =?iso-8859-1?Q?iGiw5obeesI+Dejtqp4c0JxmD41yALZbPmVeZPHr0DDoJkZ6OhPqp3vf0M?=
 =?iso-8859-1?Q?i9poZs2oZBP3BNWMStbnMuoJEW+Q2WCI0zp19vol/tijTVcaYA27bkodCe?=
 =?iso-8859-1?Q?HRyCJ168wdZ2HciAJ0m/MrhgbLHh0how6P8bctC9HMsu0SZI3EglWZ/k9Y?=
 =?iso-8859-1?Q?eJScgZF9Lq6mJIhf7RckAPHZWk2EpKISXl9mrb8bnK4pq9rO67vrdgDdPk?=
 =?iso-8859-1?Q?lkr0oSFB5TPRjkoi5AXw83vZP5x4ydAfbOrPvJ4y7vAIrp9lLGm2JKX2zB?=
 =?iso-8859-1?Q?jTaJX4RxZBOoVkTQcMKUSRPqh22Kj6rqJHT4ZJmrazkX/SBs6d6ZpuMKM9?=
 =?iso-8859-1?Q?qKBP966tjXAGAACspCHSZFrSoRnDuWv46vNe4UwN1MS9wKmDSWK9GttMII?=
 =?iso-8859-1?Q?6DU6YTQim3qXO+BZzg2rZ6+NHNEv4rdj7NyQbSR/qKnIn5ybBysVOx45Tg?=
 =?iso-8859-1?Q?IhMvU+x9zRYiJdQQ9NsMg1p6n0v7NrNY7x9OrDIGm3VnTuMkOwvxhxjPeX?=
 =?iso-8859-1?Q?M1gJEAf62q4g7CTtjogpgWcITY1/pS3rzeje54RS0ZMLlNPquTpP4OgcO9?=
 =?iso-8859-1?Q?IDvJT7UXl7i2riHVN/TmTroQdKJtU/hoEad6+jdWJOQy3L1o+EUYEUr0+w?=
 =?iso-8859-1?Q?v0UPTUesa1GD24IxfielMVsrJ1BfudgZWUxM+0f/JjsoJsuyCKsgcCpwDa?=
 =?iso-8859-1?Q?S5X/5BbLcktb/11j2Im4pqWjRohKf17Mkrn3uGKWh6n/x7k68TS3KpFJys?=
 =?iso-8859-1?Q?tX4bBS1yTwoHBYWnZTfEg6W9GfrDwWsUD1yR76i9edEsrKGHnLIH+xjxmB?=
 =?iso-8859-1?Q?h22bTwx3TMvPvhFTwmCA2L6M5kPJ96h0Bxwc71FfCK9VYTtWKdTmsNzfS4?=
 =?iso-8859-1?Q?Vu+Zky2sU4TD2DRpfycmjGcYzWZ64TKqfl2Q/Z1hzHiEMfTyr1XdlZ4YfB?=
 =?iso-8859-1?Q?1c5fpE9mj5KeTeJR0P61wQihOKG/DPL95GTpo7WI1aX3+rmzk+cjDYeCfL?=
 =?iso-8859-1?Q?h+xAD+mvcEzyegetRJ/DkUD9lc884QU+E6ZIL9OIj4sj4ZL+HjaOxQ5fUb?=
 =?iso-8859-1?Q?LZA+ADYXqJL7frCMpc8dlq6mjVE7vRG+MFxW82ELg/Neti3JfausT7vtCL?=
 =?iso-8859-1?Q?KlsHJfJPVdkM0XAiDe89hmFu+wdTMKiMIaRjFecUzThsxUo0p8rlGJ/C1V?=
 =?iso-8859-1?Q?9+VEBDeyD2ATMISPwofbWanLtj5w+HS98ugWZ05GTErh4heR/cX4DRlsE3?=
 =?iso-8859-1?Q?Y9EzAGr0YoyQoH48xtoC8mAVB60l29eUsBykdYrnlGIk2a5pvnYH3IQ3s4?=
 =?iso-8859-1?Q?okWQL2ke48XfhO5vxqY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbec0323-2e59-4482-a6b1-08ddeaf65e9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 14:30:02.6439
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p2danOuDV2CiYRN85IQDiwG29FXZQODncQn8Q8PYe68AWQwc+7qPhzXJqAAn2LCSvOjSySBUxoAf3rnHCiKXrYPS/ezLpIHZ3IZjpuE7U7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB10653

Introduced appropriate register definitions, helper macros,
and initialization of required GICv3.1 distributor registers
to support eSPI. This type of interrupt is handled in the
same way as regular SPI interrupts, with the following
differences:

1) eSPIs can have up to 1024 interrupts, starting from the
beginning of the range, whereas regular SPIs use INTIDs from
32 to 1019, totaling 988 interrupts;
2) eSPIs start at INTID 4096, necessitating additional interrupt
index conversion during register operations.

In case if appropriate config is disabled, or GIC HW doesn't
support eSPI, the existing functionality will remain the same.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

---
Changes in V6:
- removed unnecessary parentheses in gic_is_valid_espi()
- updated gic_is_valid_line(): it now verifies the condition irq <
  gic_number_lines() first, as it is more likely that the irq number
  will be from the non-eSPI range
- minor change: changed the macros ESPI_INTID2IDX and ESPI_IDX2INTID
  into appropriate inline functions introduced in the previous patch
- added reviewed-by from Oleksandr Tyshchenko

Changes in V5:
- fixed minor nits, no functional changes: changed u32 to uint32_t and
  added a comment noting that the configuration for eSPIs is the same as
  for regular SPIs
- removed ifdefs for eSPI-specific offsets to reduce the number of
  ifdefs and code duplication in further changes
- removed reviewed-by as moving offset from ifdefs requires additional
  confirmation from reviewers

Changes in V4:
- added offsets for GICD_IGRPMODRnE and GICD_NSACRnE that are required
  for vGIC emulation
- added a log banner with eSPI information, similar to the one for
  regular SPI
- added newline after ifdef and before gic_is_valid_line
- added reviewed-by from Volodymyr Babchuk

Changes in V3:
- add __init attribute to gicv3_dist_espi_common_init
- change open-codded eSPI register initialization to the appropriate
  gen-mask macro
- fixed formatting for lines with more than 80 symbols
- introduced gicv3_dist_espi_init_aff to be able to use stubs in case of
  CONFIG_GICV3_ESPI disabled
- renamed parameter in the GICD_TYPER_ESPI_RANGE macro to espi_range
  (name was taken from GIC specification) to avoid confusion
- changed type for i variable to unsigned int since it cannot be
  negative

Changes in V2:
- move gic_number_espis function from
  [PATCH 08/10] xen/arm: vgic: add resource management for extended SPIs
  to use it in the newly introduced gic_is_valid_espi
- add gic_is_valid_espi which checks if IRQ number is in supported
  by HW eSPI range
- update gic_is_valid_irq conditions to allow operations with eSPIs
---
 xen/arch/arm/gic-v3.c                  | 83 ++++++++++++++++++++++++++
 xen/arch/arm/include/asm/gic.h         | 21 ++++++-
 xen/arch/arm/include/asm/gic_v3_defs.h | 38 ++++++++++++
 3 files changed, 141 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index a1e302fea2..a69263e461 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -485,6 +485,36 @@ static void __iomem *get_addr_by_offset(struct irq_des=
c *irqd, uint32_t offset)
         default:
             break;
         }
+#ifdef CONFIG_GICV3_ESPI
+    case ESPI_BASE_INTID ... ESPI_MAX_INTID:
+    {
+        uint32_t irq_index =3D espi_intid_to_idx(irqd->irq);
+
+        switch ( offset )
+        {
+        case GICD_ISENABLER:
+            return (GICD + GICD_ISENABLERnE + (irq_index / 32) * 4);
+        case GICD_ICENABLER:
+            return (GICD + GICD_ICENABLERnE + (irq_index / 32) * 4);
+        case GICD_ISPENDR:
+            return (GICD + GICD_ISPENDRnE + (irq_index / 32) * 4);
+        case GICD_ICPENDR:
+            return (GICD + GICD_ICPENDRnE + (irq_index / 32) * 4);
+        case GICD_ISACTIVER:
+            return (GICD + GICD_ISACTIVERnE + (irq_index / 32) * 4);
+        case GICD_ICACTIVER:
+            return (GICD + GICD_ICACTIVERnE + (irq_index / 32) * 4);
+        case GICD_ICFGR:
+            return (GICD + GICD_ICFGRnE + (irq_index / 16) * 4);
+        case GICD_IROUTER:
+            return (GICD + GICD_IROUTERnE + irq_index * 8);
+        case GICD_IPRIORITYR:
+            return (GICD + GICD_IPRIORITYRnE + irq_index);
+        default:
+            break;
+        }
+    }
+#endif
     default:
         break;
     }
@@ -655,6 +685,55 @@ static void gicv3_set_irq_priority(struct irq_desc *de=
sc,
     spin_unlock(&gicv3.lock);
 }
=20
+#ifdef CONFIG_GICV3_ESPI
+unsigned int gic_number_espis(void)
+{
+    return gic_hw_ops->info->nr_espi;
+}
+
+static void __init gicv3_dist_espi_common_init(uint32_t type)
+{
+    unsigned int espi_nr, i;
+
+    espi_nr =3D min(1024U, GICD_TYPER_ESPIS_NUM(type));
+    gicv3_info.nr_espi =3D espi_nr;
+    /* The GIC HW doesn't support eSPI, so we can leave from here */
+    if ( gicv3_info.nr_espi =3D=3D 0 )
+        return;
+
+    printk("GICv3: %d eSPI lines\n", gicv3_info.nr_espi);
+
+    /* The configuration for eSPIs is similar to that for regular SPIs */
+    for ( i =3D 0; i < espi_nr; i +=3D 16 )
+        writel_relaxed(0, GICD + GICD_ICFGRnE + (i / 16) * 4);
+
+    for ( i =3D 0; i < espi_nr; i +=3D 4 )
+        writel_relaxed(GIC_PRI_IRQ_ALL,
+                       GICD + GICD_IPRIORITYRnE + (i / 4) * 4);
+
+    for ( i =3D 0; i < espi_nr; i +=3D 32 )
+    {
+        writel_relaxed(GENMASK(31, 0), GICD + GICD_ICENABLERnE + (i / 32) =
* 4);
+        writel_relaxed(GENMASK(31, 0), GICD + GICD_ICACTIVERnE + (i / 32) =
* 4);
+    }
+
+    for ( i =3D 0; i < espi_nr; i +=3D 32 )
+        writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPRnE + (i / 32) * =
4);
+}
+
+static void __init gicv3_dist_espi_init_aff(uint64_t affinity)
+{
+    unsigned int i;
+
+    for ( i =3D 0; i < gicv3_info.nr_espi; i++ )
+        writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTERnE + i * 8)=
;
+}
+#else
+static void __init gicv3_dist_espi_common_init(uint32_t type) { }
+
+static void __init gicv3_dist_espi_init_aff(uint64_t affinity) { }
+#endif
+
 static void __init gicv3_dist_init(void)
 {
     uint32_t type;
@@ -700,6 +779,8 @@ static void __init gicv3_dist_init(void)
     for ( i =3D NR_GIC_LOCAL_IRQS; i < nr_lines; i +=3D 32 )
         writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPR + (i / 32) * 4)=
;
=20
+    gicv3_dist_espi_common_init(type);
+
     gicv3_dist_wait_for_rwp();
=20
     /* Turn on the distributor */
@@ -713,6 +794,8 @@ static void __init gicv3_dist_init(void)
=20
     for ( i =3D NR_GIC_LOCAL_IRQS; i < nr_lines; i++ )
         writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTER + i * 8);
+
+    gicv3_dist_espi_init_aff(affinity);
 }
=20
 static int gicv3_enable_redist(void)
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.=
h
index 3fcee42675..3947c8634d 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -306,9 +306,24 @@ extern void gic_dump_vgic_info(struct vcpu *v);
=20
 /* Number of interrupt lines */
 extern unsigned int gic_number_lines(void);
+#ifdef CONFIG_GICV3_ESPI
+extern unsigned int gic_number_espis(void);
+
+static inline bool gic_is_valid_espi(unsigned int irq)
+{
+    return irq >=3D ESPI_BASE_INTID &&
+           irq < espi_idx_to_intid(gic_number_espis());
+}
+#else
+static inline bool gic_is_valid_espi(unsigned int irq)
+{
+    return false;
+}
+#endif
+
 static inline bool gic_is_valid_line(unsigned int irq)
 {
-    return irq < gic_number_lines();
+    return irq < gic_number_lines() || gic_is_valid_espi(irq);
 }
=20
 static inline bool gic_is_spi(unsigned int irq)
@@ -325,6 +340,10 @@ struct gic_info {
     enum gic_version hw_version;
     /* Number of GIC lines supported */
     unsigned int nr_lines;
+#ifdef CONFIG_GICV3_ESPI
+    /* Number of GIC eSPI supported */
+    unsigned int nr_espi;
+#endif
     /* Number of LR registers */
     uint8_t nr_lrs;
     /* Maintenance irq number */
diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/=
asm/gic_v3_defs.h
index 2af093e774..3370b4cd52 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -37,6 +37,44 @@
 #define GICD_IROUTER1019             (0x7FD8)
 #define GICD_PIDR2                   (0xFFE8)
=20
+/* Additional registers for GICv3.1 */
+#define GICD_IGROUPRnE               (0x1000)
+#define GICD_IGROUPRnEN              (0x107C)
+#define GICD_ISENABLERnE             (0x1200)
+#define GICD_ISENABLERnEN            (0x127C)
+#define GICD_ICENABLERnE             (0x1400)
+#define GICD_ICENABLERnEN            (0x147C)
+#define GICD_ISPENDRnE               (0x1600)
+#define GICD_ISPENDRnEN              (0x167C)
+#define GICD_ICPENDRnE               (0x1800)
+#define GICD_ICPENDRnEN              (0x187C)
+#define GICD_ISACTIVERnE             (0x1A00)
+#define GICD_ISACTIVERnEN            (0x1A7C)
+#define GICD_ICACTIVERnE             (0x1C00)
+#define GICD_ICACTIVERnEN            (0x1C7C)
+#define GICD_IPRIORITYRnE            (0x2000)
+#define GICD_IPRIORITYRnEN           (0x23FC)
+#define GICD_ICFGRnE                 (0x3000)
+#define GICD_ICFGRnEN                (0x30FC)
+#define GICD_IGRPMODRnE              (0x3400)
+#define GICD_IGRPMODRnEN             (0x347C)
+#define GICD_NSACRnE                 (0x3600)
+#define GICD_NSACRnEN                (0x36FC)
+#define GICD_IROUTERnE               (0x8000)
+#define GICD_IROUTERnEN              (0x9FFC)
+
+#ifdef CONFIG_GICV3_ESPI
+#define GICD_TYPER_ESPI_SHIFT        8
+#define GICD_TYPER_ESPI_RANGE_SHIFT  27
+#define GICD_TYPER_ESPI_RANGE_MASK   (0x1F)
+#define GICD_TYPER_ESPI              (1U << GICD_TYPER_ESPI_SHIFT)
+#define GICD_TYPER_ESPI_RANGE(espi_range) ((((espi_range) & \
+        GICD_TYPER_ESPI_RANGE_MASK) + 1) * 32)
+#define GICD_TYPER_ESPIS_NUM(typer)    \
+        (((typer) & GICD_TYPER_ESPI) ? \
+        GICD_TYPER_ESPI_RANGE((typer) >> GICD_TYPER_ESPI_RANGE_SHIFT) : 0)
+#endif
+
 /* Common between GICD_PIDR2 and GICR_PIDR2 */
 #define GIC_PIDR2_ARCH_MASK         (0xf0)
 #define GIC_PIDR2_ARCH_GICv3        (0x30)
--=20
2.34.1

