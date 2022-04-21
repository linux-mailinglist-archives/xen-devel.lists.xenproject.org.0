Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAF8509EE7
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 13:48:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310075.526708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhVHq-0003nw-R0; Thu, 21 Apr 2022 11:47:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310075.526708; Thu, 21 Apr 2022 11:47:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhVHq-0003m6-Nv; Thu, 21 Apr 2022 11:47:50 +0000
Received: by outflank-mailman (input) for mailman id 310075;
 Thu, 21 Apr 2022 11:47:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lloE=U7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nhVHp-0003m0-7R
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 11:47:49 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dce4c546-c168-11ec-a405-831a346695d4;
 Thu, 21 Apr 2022 13:47:47 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2059.outbound.protection.outlook.com [104.47.12.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-rJzTY4BvPMubozgDOtq7jQ-1; Thu, 21 Apr 2022 13:47:43 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by PA4PR04MB7952.eurprd04.prod.outlook.com (2603:10a6:102:b8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Thu, 21 Apr
 2022 11:47:41 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 11:47:41 +0000
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
X-Inumbo-ID: dce4c546-c168-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650541666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WMTJN4SIPofYUV6ct57m8nmSHWtqqPK5hlNLoMIg3L4=;
	b=TPNakM56wSDg7kXB29Ff1HMNiCcI487XoO0OujbyHFSXn5n59G9KE9u9VeLaVrsSxXMXeZ
	3vilY9fm5XhdlUw8hobmEnnspgT/Iu5V8XIXLUZCOTSU1hKOVS6lDk/LK1wFwsl67ev53U
	EDxyfY2h2yyno7DCqa31LoiB/rF2sbc=
X-MC-Unique: rJzTY4BvPMubozgDOtq7jQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HLHSacRFvSQ/BLHoTEUZH7C8ziY0kMZCJrVWu2sW/UQvbbNTOgUBI9SdL1JpAMaQBG9EWAyCJLQWLGYKjTiZ0pt9FsaXBDX+zwopp1XJXq+Wegrv+eT/N2vNGz6R8LfexlW37BriTG0+7AMiebXwlL+55rXY2mB8EY+Fafct/HOEvlOR9HcjaS4hsOOG477kegNdzHxJrYF4o1uDPTRPpAEwURWIV49YL12oK6lsrvztkoj5hWv+gPzBQmjNVA/9ehbwC/W8iRSFcXBS9hXmzuv0yqR0vwEL3knGIZtPfcbdE8jhbQflNA5qMZsOtigJfoPa6e8FG6Cn59tRzYqucg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ldsrMJ1vOYDMITcqJ1do5pRntxT9UX/xi9Q6RLrswm0=;
 b=Em5WyOVNAXYOJlhnaRHPiXW+ELBUn9x+uwKM1DLUz0oVqfLSrHpxU12Xl4dTqHLZEUMDyYFu/c+mdgr6SyJkwC6acefV2U48MaP48a9xuoF6bb3BOXyaCd0ztiir+/LYNoQi7QgeCIJn4WzH3oc/ogolMOFaq+4Gel/Bq8mK0lyqRmz2SC7A2wbCAWSG/avqXrXkp4/EDJaxzjviT/IOMxY7lkwCTVcpxFp31AN6kZDXVyRPubzevZWFmiM3iigupvlLZixysgcf7co16y4+5tuZuhcL4FS1W9KAaUWuDWr1qpD5UOrwL4XQ8G/Gia1uFYUu9EuaNk6Vh9AXgFnCwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f97c86b4-e918-0496-c0dc-d7e4a0ebadc4@suse.com>
Date: Thu, 21 Apr 2022 13:47:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Need help to debug Arm SMMU issue seen on guests with passthrough
 devices
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Rahul Singh <rahul.singh@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <022fb545-9295-1f10-6caa-01813cf0a646@xilinx.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <022fb545-9295-1f10-6caa-01813cf0a646@xilinx.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0386.eurprd06.prod.outlook.com
 (2603:10a6:20b:460::33) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: efe8ab49-25ba-4182-aa36-08da238cbdd8
X-MS-TrafficTypeDiagnostic: PA4PR04MB7952:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB79524453690C3C0348F7CF2CB3F49@PA4PR04MB7952.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1RH1DK/ncElkti0kL6OTSDLf5cfzy/P+9nCky5MvlBg1LpBOkZ5DNbuEVpdsfZBFUQzTX1fhGmykFW/Sx5DNeM9GHMnD2KAqRixMbL3A1qR+39Nv0truqpdqMiDkQChy+FPLWAPKeSUklgEhqcP88CWkO8MeXCRE3ApdgSNU/6Cc4lXH2R6qACdnX2Nz9TyJ2vl5/G9eL7QPKNB/kNUns8MjRh5zz90Qz10tyfsvyMgntN3V0n4mYiHoNJ8LgaYuvWgKhgk3LCFHFc+r21LlZDtvJshW2wrc7We52JT4x/1SCtvijmsp/9FVabY+tq8D+WZ6dRFWA+pX/7D95gmuCtOvmgSkvJ6CpfNrvdBlrM0QAS/sb259TpcNMqS2YQhuZzbft6e4/zKm6GAV5mhgatIFziCPZDTH/HT+jQgbHizb+X3Fxf5szvrbERbV5qI0ZL0gO1BycPKFq2WPJtD45oqwbyz/BJFW3/qKh/2F3XAnWxOdT82Daa+7U9fWVFgMpjsPF6xkNCK76TKHI/SVrwBI+jrXHdJoE0NS3jH/LXm4mtG/XrlAJ+k5jItrIjwTRNkFnURupktnlRWhOk3R4Vth1feEncj5cHZLO/GBVlfCxVUW/ITmx2VdIRVXmxKyZn1MFq1sC0noLfSZhrIC5KssPF6wa63NfxFzH7Ss6afA7RobUCgwaG6MlYIalcEmbQ5JHvNIZToPlVBgL+03CujXMy+af7+aJ7FD515fHEA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(66476007)(4326008)(8936002)(66946007)(6506007)(66556008)(508600001)(2906002)(6486002)(83380400001)(5660300002)(86362001)(31686004)(31696002)(316002)(2616005)(38100700002)(186003)(6512007)(53546011)(54906003)(36756003)(6916009)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RVvNxirUvJuVHFOT1i5wJ5jEuHg19g5DltW6BCYHZldBdzrtWqMHnZe38qm4?=
 =?us-ascii?Q?VNM0CrJIs17tepQBh4F/FHvO103W87iE/bIoL1kBYonDx8HS1Mkdmf/Q7j8W?=
 =?us-ascii?Q?I1VFQ2V3X7np7yvTHNZ6vvcBbY7iikaq608wdSyGAPWaHn7skxbTQyOICklx?=
 =?us-ascii?Q?C+ebe5/K8cR4rIP39DW3Se0OzoLMmZPbrlJZP9rTtcRAjN0gYjtonEhozKWr?=
 =?us-ascii?Q?790cS0cMHwPsuKcJ1JsRnstUFL0VppSFWiLXPD6uzytGKgESpfa+FWR85oo9?=
 =?us-ascii?Q?RP7k739eoqRAp0ELFqtqXBYjLMYhauSEkaqt92xw0Jas5fPxuJ/TMaBz6VSe?=
 =?us-ascii?Q?RWFrrl5oZXCZoLjtk3g1SCiFYkh/jXSUkh5UsuRsUjg41J2nC3ss+HKzreQY?=
 =?us-ascii?Q?ABtU4ZCsH0ZWPscqaBPu1FDcI4dTEFXUR0GEvveNdAEbI3m2Sg8IZ7Nb7Vko?=
 =?us-ascii?Q?L7FRKqPDqO7ZLLSRrG1kG99blUXOWbyj9N/AHPv024SV5ipoO4+WevWf+FiY?=
 =?us-ascii?Q?sDF2OUJ86S9Cd3ZnX/og0ZzGJuK1982nhSANeK2TmFROzhho57MN3yozM5Z7?=
 =?us-ascii?Q?fMx3ryvT5FgwMesHNUFgs7yJGWqa/FcG1oisrzfOgnZn/tB2sDkBCelj6lqH?=
 =?us-ascii?Q?tXMbEYW++kenPmrk/egfMp1MEVfb8saOFufrqRp0wXIvlqRExvPm54L7ibgq?=
 =?us-ascii?Q?iDkQrNCtapMg3KMjXZdFGWBrtfKBhM2M0uW785HEjhD83ez0au8YTS6M0FyL?=
 =?us-ascii?Q?E7Iw4iZb2ousASaBiGbJDJNWRn4+5+p7NMQJ6xL4z3aEcpu09H3BLxVSaQr5?=
 =?us-ascii?Q?IYaxnSe5vL46big3x8XHGctlXMbRnvwiKUga+1dipezQ343bELQ3r2yoJVOM?=
 =?us-ascii?Q?zUkpj137PEOMIzyJABsU5lti9r7YlQDhaeNV1Qme+z3GlkDNYQ5L8D+NQA/3?=
 =?us-ascii?Q?cCF8ccJPWtYumjUWAyQWMxboBgreCjGsjYJBtZResWM4O5fsqX2n+k5G1p3c?=
 =?us-ascii?Q?C+hmwobf2b5hTPUGivI5y2pzrf7Zg5TkwFqzDIKm9sNagdoAThtfVE4XG49/?=
 =?us-ascii?Q?8s5CEpZXWiSRNH7acfYk/zIi1o20ThQhSo74Uno8jTCGS8aQ5m17PgkDZ1fZ?=
 =?us-ascii?Q?w2hC3PgAhc86T+K7zXjuoNVOMNIUZrWHpo/8DvU99MoGuUZHRRbbZ3EtjjcI?=
 =?us-ascii?Q?eiVl1W63K/8k8cG+WlI9ImXlggsphwB+VO1DFJC//JKo7d3m2HFDKwy/AJ78?=
 =?us-ascii?Q?LWw0yECVRPnRPhJnujZ+V7LdQ9VlcAyeRwchxxOwz/hfwhzIeB80NVeZDRMF?=
 =?us-ascii?Q?Gopk6gqlzBGYPoS+tWoZhLsBVdWYfayTErGpB+iSkcnS74J/QTg/E36YxqK+?=
 =?us-ascii?Q?/ljVSzojMaAwnWgbmRQ2Bkn2ZvsczPL3SAvv7rVwThhSlVcKtvH3jnnrUExq?=
 =?us-ascii?Q?Tgch6WelimLD0BWqRZubMOefWaey3yKqRNVFVbZG4rohrlA+l50ixNQOODjr?=
 =?us-ascii?Q?ue9ifT5ZTgZ4eFPmnCIXe248E5Gxh4RnvjzRZHDKHs44VpZZfzqs/PjHKCnd?=
 =?us-ascii?Q?ikTw6yU0mlC6yCHAW9oTVn62E1NJx1W3ZEGCxJGoXyoLKHrwheet/XBw7FdZ?=
 =?us-ascii?Q?vluGBWwlanyiarQIuL9BoAn7Gi8apCQP0FYcb38Xl6PoiDDODaWaq8vFfOlf?=
 =?us-ascii?Q?sLKGyaV+1YNrQMr1nJCqd04I1nc47xLSMfU+TbSSvc4AH2lQqmeYHtcfVWhV?=
 =?us-ascii?Q?15OmzuxB7A=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efe8ab49-25ba-4182-aa36-08da238cbdd8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 11:47:41.6489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sptzJCPS/lj0GZQVOOMo80HcTk3bj2czY5kuE4peL4hWVpvQ7vUAu9wkTcWKzCqgl+prL79QtJFzuZVVl8HDEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7952

On 21.04.2022 13:12, Ayan Kumar Halder wrote:
> Hi Arm/SMMU experts,
>=20
> Scenario :- I am trying to assign a device (eg mmc) to a guest which=20
> uses smmu. I start the guest using "xl create -c ...". It works fine for=
=20
> the first time. I am able to access the device.
>=20
> Now, when I destroy the guest and create again, I see this issue
>=20
> (XEN) smmu: /axi/smmu@fd800000:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 GFSR 0x00000002, GFSYNR0=20
> 0x00000000, GFSYNR1 0x00000871, GFSYNR2 0x00000000
>=20
> 0x871 is the stream id used by mmc.
>=20
> We are using SMMU-500. So from the Arm SMMU v2 specs, it is=20
> "Unidentified stream fault" for stream id "0x871".

I have no clue what any of this means. I wonder how I ended up on your
To: list. I'd like to ask everyone to drop me from the recipients list
in their replies.

Jan

> This issue is seen regardless we use 'mmu-masters' or 'iommus' property=20
> in xen device tree.
>=20
> I can confirm that this issue was not seen in xen-4.14.3. It is seen in=20
> our (Xilinx's) latest release ie xen-4.16.1.
>=20
> I am using our downstream fork of Xen. I can't readily use the upstream=20
> as we use lot of EEMI codebase.
>=20
>=20
> Can someone try to see if this issue exists in the latest upstream Xen ?
>=20
> Any pointers on how to debug this further ?
>=20
> Kind regards,
>=20
> Ayan
>=20
>=20
>=20
>=20
>=20


