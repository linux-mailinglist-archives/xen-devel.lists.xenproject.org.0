Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDA6C9E7EF
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 10:36:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176540.1501005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQjHq-0008NT-Vw; Wed, 03 Dec 2025 09:36:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176540.1501005; Wed, 03 Dec 2025 09:36:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQjHq-0008Lg-Sg; Wed, 03 Dec 2025 09:36:38 +0000
Received: by outflank-mailman (input) for mailman id 1176540;
 Wed, 03 Dec 2025 09:36:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PcFb=6J=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vQjHp-0008La-Rw
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 09:36:38 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8baaca6c-d02b-11f0-9d1a-b5c5bf9af7f9;
 Wed, 03 Dec 2025 10:36:29 +0100 (CET)
Received: from DU2P250CA0012.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::17)
 by VI0PR08MB11325.eurprd08.prod.outlook.com (2603:10a6:800:2fb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 09:36:25 +0000
Received: from DB1PEPF000509FB.eurprd03.prod.outlook.com
 (2603:10a6:10:231:cafe::19) by DU2P250CA0012.outlook.office365.com
 (2603:10a6:10:231::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Wed,
 3 Dec 2025 09:36:25 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FB.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Wed, 3 Dec 2025 09:36:24 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AM7PR08MB5413.eurprd08.prod.outlook.com (2603:10a6:20b:10a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 09:35:20 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::b27c:9593:1074:949d]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::b27c:9593:1074:949d%4]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 09:35:20 +0000
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
X-Inumbo-ID: 8baaca6c-d02b-11f0-9d1a-b5c5bf9af7f9
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=PcPFEEFA4WGRV0rkS8JZu20eJOgpg0OUJmqNcLZi83stXxPR7kRSP8PlVLx3zlYPCEedxB8ESBGIbicI2bBs1SlnVC8aM49PvIr9R2RIJmxtvbyVy1T319U/xSYuU0vmRNOppUCGqaVnQ/YR+IAiEZed+KdINHPkOzo9EBgZs0SnpMEL16Xl+0TQ3eSXRWWK6aldan+PSdoxgzfE2Cl36bNZNVQJQMf9rWg3shzfRmAQeUkLalnsw8G3Pox2ylPyNkwXvTREmZzBUtcWDazStjUi5GkegF8k+UKqTGCUTj17HVwTm4QxwSnfcdf3zGK8jkRBSKpR/tT7AEK9/m9XmQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ssg/oP4Twi0OiA/t1dLEESSaZPP9q6WYl5pjfk8OYjE=;
 b=Iomz9EtnHZfbWt3CZ5ZeZybnbvOAav2Pqw6l1gCI95BdCbbhvMIdQ3pVeXySm3a7GUno0MVxvUthcDGFaDEx065cdL1YCtaaqryW+Jz+sXk4RQ2ieV27HSQMIqtcai4bjV2Z9AchEqaPtfoLjgYa0Zs0mqScmvG1Fer958HJlIO6+qOQdCYIhSzvhCvyOWhQfL3CXIzaI5WlV+pLOl8Owy0G+D5+4e4rrQrsl3S0c3auHGewZ9baJ+e8TAQoP+IJdWc+Vxo0gDXILSHctK8B+Qh8tkBJ2P8IhChi0Ytv7BKcacUCxhyorVdmc+mUWOl90nIcKUrssgzeMXCZG+n3cQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ssg/oP4Twi0OiA/t1dLEESSaZPP9q6WYl5pjfk8OYjE=;
 b=frIhOqRhdr/ThtDQDIIMTex2Dhtmkjx1Yr9rxCy9683E5XafcZHF9h66B0lXMnK6ZdnvhmLEIJ0an43nyluJK6ucBSvXC+Ctbc+oR9NdXfbINo0dOpC8e4Lq5v4iIyW1HfaFy1TKTgfLz9z3R6F4Fu0MQDA+LkjFy53JOk+b22M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qAYVqu0hKJJgG0IH7JZz8QNpG8Dho9CSROVwbB8I3Yfh+U46Znb/wISPOb/8fpBeAoXL9qtq6P/qclMsisZBIVJdaOhRIsNR7UVuUZAal645ROdw5Z+/tPC72h0DpGhSaBH610/uOmhz64N51GaLymsgkTTVu7rKWLwQUEA+YR0gpWM/aNZaMJsv1cAaS8rSejNLQ6q85BSII9Pz3MKE/E5YdHxzzNBBSrmb8UHpLyFAmFxWcx/HSG2IYvHatzegUoJ99jVOk0PTOgLz64R+W7cxQAJgrA0TRTv3eWXQe9qeq8hqNkFX+RhluXG8i3qAjwdeYW5eXDb8EOrH1jfU0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ssg/oP4Twi0OiA/t1dLEESSaZPP9q6WYl5pjfk8OYjE=;
 b=xgubLAnz/gezDHk9sYAhDsg4gTrX8NiDtPQ1yR6hUXSUCwdGEPtECTRoTWtOcRyfNcap9cFx8Tu5Za4Z4wVDhlqZHeiXCfM6VPcquiPhljKkmMCtqF+LYAdNRPtHF5W21+pNVX/tq0i5xOuEzFhrPmr7MSLkJ6IzDZrQvgHlIcWU+Fb2stwGgsPToJncfv9a6Ib6NadlulLRszuBzNn9gSHkiE30H1IK2Pyp8FE472dTaVq726oazoHgsGBMWRQXbE2RbipePqdHbPhCUoY+Ku5fVCr+XGJA3I6rxpFGUAG9fa1ESQS8Yag7VMzhOUqIREcwEPMxlYDQypttbWi7eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ssg/oP4Twi0OiA/t1dLEESSaZPP9q6WYl5pjfk8OYjE=;
 b=frIhOqRhdr/ThtDQDIIMTex2Dhtmkjx1Yr9rxCy9683E5XafcZHF9h66B0lXMnK6ZdnvhmLEIJ0an43nyluJK6ucBSvXC+Ctbc+oR9NdXfbINo0dOpC8e4Lq5v4iIyW1HfaFy1TKTgfLz9z3R6F4Fu0MQDA+LkjFy53JOk+b22M=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH 04/10] xen/arm: ffa: rework SPMC RX/TX buffer management
Thread-Topic: [PATCH 04/10] xen/arm: ffa: rework SPMC RX/TX buffer management
Thread-Index: AQHcX7XuY/AW54zALEuMn1h4iIrvHbUOavEAgAAsagCAAQzjgIAADJGA
Date: Wed, 3 Dec 2025 09:35:20 +0000
Message-ID: <4E39091E-8EFB-4C80-8A1C-FB37B07B8AA3@arm.com>
References: <cover.1764254975.git.bertrand.marquis@arm.com>
 <72d6592157a9ec15d4b5de19751186e0ca1680ba.1764254975.git.bertrand.marquis@arm.com>
 <CAHUa44Gq4L95i3wTMEVRoFNFt2PzPCKGAuF4KT3YL9mfmT2FRA@mail.gmail.com>
 <33EF4249-1F82-4DF5-BCCE-0BCBB0F3D157@arm.com>
 <CAHUa44FQ8bCo5cuVR-JW9om+jEqUA8uZAPAmic9GkwnG-OeE7A@mail.gmail.com>
In-Reply-To:
 <CAHUa44FQ8bCo5cuVR-JW9om+jEqUA8uZAPAmic9GkwnG-OeE7A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.200.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AM7PR08MB5413:EE_|DB1PEPF000509FB:EE_|VI0PR08MB11325:EE_
X-MS-Office365-Filtering-Correlation-Id: bfc87aee-9ec0-4233-fbf8-08de324f6d3e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|10070799003|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?V1dlV3M0ckEzWE9kRzVOelE4K2k2YSt4Tmd0N2preHJFWGgza3VCZW5vcVl0?=
 =?utf-8?B?N1UwOUcxWU45dXFBWFdyQUZlL1pwaGlHS3kvKzE0SkVyU1ZvekxWejdreFZy?=
 =?utf-8?B?d0h3NWRYM1liYnlKaFdMemwwSlZVY1k3OEJLck9paUlwejVBVmM1bGNrS0sv?=
 =?utf-8?B?MldyRDRhK25UdTFnUmg2SXk4NVJ1dkRweEJUS3JlaFo5Zm52ZUFubjYvbjBP?=
 =?utf-8?B?L0VWUktUelVzdG9RUEZDWUVBQjV5QjkzdW9KL3pMelIzMG5rUFJwRlNSZjdF?=
 =?utf-8?B?eDRFak1xTGxlQlkySndDSElpMTlIWWFnaWdUcDczOXV2N0srSzJ5Z012QTda?=
 =?utf-8?B?Um50RVhwcHpXMWdGMkF0ZGhIRjhZd1R6eTdMYmQ1S3EzZWtmYUVRclNxa3pJ?=
 =?utf-8?B?OVkzWUJ0dDJ2QUgwVFErNXdrL0lCekdqM29URmFYaStOUExBbHlOeDRtN2E5?=
 =?utf-8?B?ZmtsZTBvQ3M5a2F3MjRnNGpTNldlWm1Ydm9SaVo1a2ZWZndhdm5EMTNHZzhO?=
 =?utf-8?B?dTVHK3h0QzIwMmxKYTY5Q1RFQkVBNXVmVDk5RHN1UG9weFQrZWx5cTNORHpn?=
 =?utf-8?B?QUJ1TU1RNTZwL3E0eXhNSFpmbTJZVDloZ00ycG5lanJqMTgxREE5Q1V0ai8w?=
 =?utf-8?B?czExOGdHSmxuVG5wYkovU1JhYldSam1scFRTdGl3TGs5QmlONXRtbE4wZVJP?=
 =?utf-8?B?SE5zOExiRDhGTEF1VlhGQ1BoWlNENkhKMmtWSUlpMlFTN2lLZ0xoOVJNM1U4?=
 =?utf-8?B?QXhZZ1J2Qm1BRk1yWXk1dHF3M1Q5cmlFTDJMZEd0bnNHN25TQTNMQm1GeVRH?=
 =?utf-8?B?bStKTmZWbmQrZGhwcW9YMThjc2tYR0NKdlhQUDV4b0RZSnFZSDhseS9XZDM1?=
 =?utf-8?B?Rkc5Ri9QaUZXM0VKV3ZBbTU0V3AwSFBSRjZaRExYTDRLTjdXbjl5eXFkcjhl?=
 =?utf-8?B?Q1hRYTBDb2N1NmhtWXR5cDhycGMyRzdCQzhPNWhXMWtXWTFQRTMvcThZcmdY?=
 =?utf-8?B?RFBkdjRZMDhWb2Jma0g5MWVQVFFYZjdsOFBpY1V5UXF4Yy9FdXZORy91K2RQ?=
 =?utf-8?B?cW9oMXMrYmV1NG9VdWcyaUxRU0c5MVhIYVAxVFdZbE5taUxTRGVSTWFSUXp6?=
 =?utf-8?B?TzNZYWswOC9VZ294cW9pQ1MvK3YwelhQcmRQekUwVzgxbzljdWNMd2JNaVBw?=
 =?utf-8?B?V1lzYUpleFo2TWk1VU5DeUdTdStac3BGZTBwcVJOUEEwZEVKTWZkT2J0OU44?=
 =?utf-8?B?S1BWTjQrUWR2UnNqQlQ2ZStXcGJLeHhHaWtNVGVyWGNVeWg4eHMyTEF3ZnZo?=
 =?utf-8?B?dlMzMVpSRDBGQ3pIR0Irb24vdE9QRllOMTJBUHRVK0IyR1FSYWFBWEtEd293?=
 =?utf-8?B?aEJpSjJjMWEyR21VNEJPT2VUVGN3T05UM09BZ2svOFI1Vmk0UWhoeHcvd1A2?=
 =?utf-8?B?SzZOSmQxc2ZzVlhSVjBwYTJGdGkyQ3gxMjJGNmVqK0JZakpRTDEyMzFGZHlM?=
 =?utf-8?B?dWFwU3JPZDZCZ2l4b3BMZ2NZbVVPVUlMSTZML2tBSnR1MDI3am00OFFKbDRV?=
 =?utf-8?B?L0FLb20raEhMa3MvRzMrcU9TaTdRc1c1QlVOVlRzNlF5SW1NcGFmNnBSUFRJ?=
 =?utf-8?B?TEwvdjVVd24rc2FUTldZUStQbEdTQzNUK0FxdlNwU1E3QStibXF3RE9WdFNx?=
 =?utf-8?B?Q2N2NXY3OWdPUTNKcTJORjhhcVE1ZkI2bnhiZGZlTlc2YlFoc1E1VVErT3Iv?=
 =?utf-8?B?bXo3TEFqaXZDbWZHT2w4NUhvK2J5WEdSMnZoT3FJRzc3NzNLQ2NnV0lYKzF0?=
 =?utf-8?B?UHRIUEIyVHFxZG9TU3VuSGhNOWY3OHYxdVhZcmFGWWxFUnE1UE9aVWViMk9W?=
 =?utf-8?B?WnprVzQxM0lWcGZoVjlVeGh1c0pybHVzVnBoQ3U3MEVIMU16ZDFaM3NlYnZK?=
 =?utf-8?B?dk85eWM1cGFTdXFXMXNCcnpNOUpMM2VjN1crS2tGN2NHaThyTSt3T3U1OERS?=
 =?utf-8?B?YTJ3TWhjeHBWTno2NHVNQ0VmRkYrdmJmVWxsZ1BzLzd0V25Qeisxd3pXaCtt?=
 =?utf-8?Q?rRnMUU?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <739DAC84E8DFFA4B85C9D2C5D65B39A7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5413
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d263e836-0051-4d4f-e226-08de324f46a5
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|14060799003|82310400026|35042699022|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YVNKMVQ3R2lmSkxQZWlJWVRhRksyM1VNdFZZcEZNeEdhc3pmZlE3NWkyeDNm?=
 =?utf-8?B?NTBvQnF3YS9UTlBZNldOY01DWXd6Y3RpM1ZvT2pDa2t4TlpZTkFMY1hvNWMx?=
 =?utf-8?B?VkhOQVVDbWJNZVhHdHFaYXJ1M2ZzYm9qUlB5VHhBT2JkanRxRmhUOGlIMDhF?=
 =?utf-8?B?SXpOTTV6R0IvWCtkamlhWVVYQ1dtSTV3ckdCTGE5bWxHVE9vV3dESGx4RWpE?=
 =?utf-8?B?NE81SEJMQVhFRk9FN3JPUHZOYWxTRlJwUjhNa0xCZHRtVDFCc2hJUVdVWWdq?=
 =?utf-8?B?R0ZZMGpILzhqR2M3S3RCNGZkUjVDZDRjYjF0ZlpST1JLS09MV1hxL296aXJW?=
 =?utf-8?B?VkhxZktTV1B2MWoyL2xjcHIxKzJQUjdhRTdhWlFjRFhmWmxkSUZrL2tweFVv?=
 =?utf-8?B?TDY1TUxPSjFwZmx6SVY0eE54aGtXcG1IRkVCNXQ2TzV1eGZISG5MMFFCQmQy?=
 =?utf-8?B?MStObjBNblBmWFRLNDBrbkJ1RVpjeXYzQ3dzRE9vSDZLdDVwbUplQzBzMjZu?=
 =?utf-8?B?djlxSnNSU0ltS3R1Z3ZBUGRVZC9wVkx0MEJzbHBuMGp4b1g1eEcvV2pueFpu?=
 =?utf-8?B?TmI0Z1MzNmg4NmVIWUZmOU9YR2F6TTB5U3RlR09LOU50Y0N3dVBlaEJobHh2?=
 =?utf-8?B?eSt2dTA2SkY2UjZpRGtURHI4cXdDSzJpcWltYkgyM255cVVUWWZDU05VY2xV?=
 =?utf-8?B?ZGlJSlNoazE1VzAvOVdrUkNHVkU1ajRCYk1GbjF3SnJ6OTl3bzJFS00yVjdt?=
 =?utf-8?B?VmJNak9rYmt4dXBZMFRlbEJ2RU9RcHhvRlI5RG8rM1VzMWJjVFcxaXNZdzM3?=
 =?utf-8?B?cDUyN1NJM3NjVkZ6Z3g0djZ1YVc4VlpZYklRcHhoUUE0bHdld1k4VFh1Nmkw?=
 =?utf-8?B?NG1BK05JRUhwRDdaaWdXRnlTMjJqU3FUYzhtT3hUTjFaNERxczhRb0w2UjhR?=
 =?utf-8?B?OHBwRldoVlIyVnRodDFoc3REZDRPQWlkTDlKeUoyenZ4bmxQMTlWcDByWFV4?=
 =?utf-8?B?YUcyalMvQStBRGo4M2lRVjU2RFhVY1daZktuK1dmMDBoYWNEUlpIVm8weE0x?=
 =?utf-8?B?OHBTd3FVLytkNmljOUpvZHFhc0tDV0xQVWVzTnVhRlJoK0x6eWEyU3NMeHE2?=
 =?utf-8?B?aWRzWExiblBKU3BicExhL05mZUxEUWYyd1UvYnpHUWFJWVQ2UHJGUWo1M1lH?=
 =?utf-8?B?c3RtNE83WGxlcm84L1ZaUmRPWG9rY1h5Rkc4N0ZnK3Z0by9JbGp6TXByREg3?=
 =?utf-8?B?ZjVOTFNENjc4OXRDMlFFZDlZME5KS2liUnlSUTNubkozZkN0ZW9Ha0FUREVo?=
 =?utf-8?B?Q0d2TW1tNEZoaDVqRS9pSzczdjRNeXBxVmRoMVBNM01hS2dwbnNuQXlNYjdI?=
 =?utf-8?B?VHhVK3VQakFnSUcxekZaakVORmdFZzNPcy9DY1BpMEdnRVZHZTY5NDJac0s1?=
 =?utf-8?B?aXBWYWQ3NVZyYUdFbDRqOGpRTDBQQXcwblhNdFhxWWYyMVZkZ3lVN2ZZRkFT?=
 =?utf-8?B?TjRUM0ZKTFVyYlE1WHBjaHNvanVaVjc3UW8vYmdPeTNueGM0QjAxSWNveHFY?=
 =?utf-8?B?clN4a1RZViswTGNTaE5sSDF2bm9QMjFUZnJ5bXp1K3pmNFcrL0JJZzV1UndO?=
 =?utf-8?B?ZU9wMjJUMFJhMXBHSDVUL29VL3JQNnZSaFF5Rkhma0hwREt3eWVBeDJ4cVVh?=
 =?utf-8?B?VWszbFIyTys4UThlQ3NDYS82YVlTaUE5RkEzYnpjK2VOYmo2blBuajJWQmVw?=
 =?utf-8?B?Ykg3YVpoNmZ5cE8rSUNRdlA4Ynp1WCtuamR2YjM2SE9pdzl6ZmtKajV2MVBs?=
 =?utf-8?B?U1BVTHdGSWNqY2tTM0tEZDkwTHlXNHM4TGhmQnliYUt1OXYyeExyaklnOTBR?=
 =?utf-8?B?ZEM0enFPZHBtejJaM2hPb2FmamhzMUppYTVsU3FDdVhFTUJZWmRIbWk5bU1z?=
 =?utf-8?B?Mjk1UW53Nyt4aGVKVWtLSHV5TS9aWGwxeXZZYzZvYmYxMGtDOEM0dElTdzh0?=
 =?utf-8?B?UE1SN1h4YTE2a2RYTkRJWXd4bGcwOWtLSW0wc3p1WXhzNEdHR25CeVJUVVZU?=
 =?utf-8?B?dDJ0ZVdRY0drbUU5ek4wMnhjMTQ2dmFWbFZ4a3dYNlNlMVZqQ2dtcEVrSXdt?=
 =?utf-8?Q?QUTI=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(82310400026)(35042699022)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 09:36:24.8761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfc87aee-9ec0-4233-fbf8-08de324f6d3e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11325

SGkgSmVucywNCg0KPiBPbiAzIERlYyAyMDI1LCBhdCAwOTo1MCwgSmVucyBXaWtsYW5kZXIgPGpl
bnMud2lrbGFuZGVyQGxpbmFyby5vcmc+IHdyb3RlOg0KPiANCj4gSGkgQmVydHJhbmQsDQo+IA0K
PiBPbiBUdWUsIERlYyAyLCAyMDI1IGF0IDU6NTDigK9QTSBCZXJ0cmFuZCBNYXJxdWlzDQo+IDxC
ZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPj4gDQo+PiBIaSBKZW5zLA0KPj4gDQo+
Pj4gT24gMiBEZWMgMjAyNSwgYXQgMTU6MDgsIEplbnMgV2lrbGFuZGVyIDxqZW5zLndpa2xhbmRl
ckBsaW5hcm8ub3JnPiB3cm90ZToNCj4+PiANCj4+PiBIaSBCZXJ0cmFuZCwNCj4+PiANCj4+PiBP
biBUaHUsIE5vdiAyNywgMjAyNSBhdCA0OjUy4oCvUE0gQmVydHJhbmQgTWFycXVpcw0KPj4+IDxi
ZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPj4+PiANCj4+Pj4gUmV3b3JrIGhvdyBY
ZW4gYWNjZXNzZXMgdGhlIFJYL1RYIGJ1ZmZlcnMgc2hhcmVkIHdpdGggdGhlIFNQTUMgc28gdGhh
dA0KPj4+PiBvd25lcnNoaXAgYW5kIGxvY2tpbmcgYXJlIGhhbmRsZWQgY2VudHJhbGx5Lg0KPj4+
PiANCj4+Pj4gTW92ZSB0aGUgU1BNQyBSWC9UWCBidWZmZXIgYmFzZXMgaW50byBmZmFfcnh0eC5j
IGFzIGZmYV9zcG1jX3J4L2ZmYV9zcG1jX3R4LA0KPj4+PiBwcm90ZWN0IHRoZW0gd2l0aCBkZWRp
Y2F0ZWQgZmZhX3NwbWNfe3J4LHR4fV9sb2NrIHNwaW5sb2NrcyBhbmQgZXhwb3NlDQo+Pj4+IGZm
YV9yeHR4X3NwbWNfe3J4LHR4fV97YWNxdWlyZSxyZWxlYXNlfSgpIGhlbHBlcnMgaW5zdGVhZCBv
ZiB0aGUgZ2xvYmFsDQo+Pj4+IGZmYV9yeC9mZmFfdHggcG9pbnRlcnMgYW5kIGZmYV97cngsdHh9
X2J1ZmZlcl9sb2NrLg0KPj4+PiANCj4+Pj4gVGhlIFJYIGhlbHBlcnMgbm93IGFsd2F5cyBpc3N1
ZSBGRkFfUlhfUkVMRUFTRSB3aGVuIHdlIGFyZSBkb25lDQo+Pj4+IGNvbnN1bWluZyBkYXRhIGZy
b20gdGhlIFNQTUMsIHNvIHBhcnRpdGlvbi1pbmZvIGVudW1lcmF0aW9uIGFuZCBzaGFyZWQNCj4+
Pj4gbWVtb3J5IHBhdGhzIHJlbGVhc2UgdGhlIFJYIGJ1ZmZlciBvbiBhbGwgZXhpdCBwYXRocy4g
VGhlIFJYL1RYIG1hcHBpbmcNCj4+Pj4gY29kZSBpcyB1cGRhdGVkIHRvIHVzZSB0aGUgZGVzY3Jp
cHRvciBvZmZzZXRzIChyeF9yZWdpb25fb2ZmcyBhbmQNCj4+Pj4gdHhfcmVnaW9uX29mZnMpIHJh
dGhlciB0aGFuIGhhcmQtY29kZWQgc3RydWN0dXJlIGxheW91dCwgYW5kIHRvIHVzZSB0aGUNCj4+
Pj4gVFggYWNxdWlyZS9yZWxlYXNlIGhlbHBlcnMgaW5zdGVhZCBvZiB0b3VjaGluZyB0aGUgVFgg
YnVmZmVyIGRpcmVjdGx5Lg0KPj4+PiANCj4+Pj4gU2lnbmVkLW9mZi1ieTogQmVydHJhbmQgTWFy
cXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPg0KPj4+PiAtLS0NCj4+Pj4geGVuL2FyY2gv
YXJtL3RlZS9mZmEuYyAgICAgICAgICB8ICAyMiArLS0tLS0NCj4+Pj4geGVuL2FyY2gvYXJtL3Rl
ZS9mZmFfcGFydGluZm8uYyB8ICA0MCArKysrKy0tLS0tDQo+Pj4+IHhlbi9hcmNoL2FybS90ZWUv
ZmZhX3ByaXZhdGUuaCAgfCAgMTggKystLS0NCj4+Pj4geGVuL2FyY2gvYXJtL3RlZS9mZmFfcnh0
eC5jICAgICB8IDEzMiArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQ0KPj4+PiB4ZW4v
YXJjaC9hcm0vdGVlL2ZmYV9zaG0uYyAgICAgIHwgIDI2ICsrKystLS0NCj4gDQo+IFtzbmlwXQ0K
PiANCj4+Pj4gDQo+Pj4+IC12b2lkIGZmYV9yeHR4X2Rlc3Ryb3kodm9pZCkNCj4+Pj4gK3ZvaWQg
KmZmYV9yeHR4X3NwbWNfcnhfYWNxdWlyZSh2b2lkKQ0KPj4+PiArew0KPj4+PiArICAgIEFTU0VS
VCghc3Bpbl9pc19sb2NrZWQoJmZmYV9zcG1jX3J4X2xvY2spKTsNCj4+PiANCj4+PiBJcyBpdCBp
bnZhbGlkIGZvciB0d28gQ1BVcyB0byBjb25jdXJyZW50bHkgdHJ5IHRvIGFjcXVpcmUgdGhlIFJY
IGJ1ZmZlcj8NCj4+IA0KPj4gTm8gdGhlIFJYIGJ1ZmZlciBvciB0aGUgVFggYnVmZmVyIHdpdGgg
dGhlIFNQTUMgc2hvdWxkIG9ubHkgYmUgdXNlZCBieQ0KPj4gb25lIENQVSBhdCBhIHRpbWUgYXMg
dGhlcmUgY2Fubm90IGJlIGFueSBjb25jdXJyZW50IG9wZXJhdGlvbnMgdXNpbmcgaXQuDQo+IA0K
PiBXaGF0IGlmIHR3byBndWVzdHMgY2FsbCBGRkFfUEFSVElUSU9OX0lORk9fR0VUIGNvbmN1cnJl
bnRseT8gQm90aCBjYW4NCj4gc3VjY2VlZCBpbiBhY3F1aXJpbmcgdGhlaXIgUlggYnVmZmVyIHNv
IHRoZXkgY2FuIGNhbGwNCj4gZmZhX2dldF9zcF9wYXJ0aW5mbygpIGNvbmN1cnJlbnRseSwgYW5k
IHRoZSBhc3NlcnQgbWlnaHQgYmUgdHJpZ2dlcmVkLg0KPiBXZSBoYXZlIGEgc2ltaWxhciBwcm9i
bGVtIHdpdGggRkZBX1JYVFhfTUFQXzY0IGFuZA0KPiBmZmFfcnh0eF9zcG1jX3R4X2FjcXVpcmUo
KS4gQ29udGVudGlvbiBvbiB0aGUgc3BpbmxvY2tzIGZvciB0aGUgcnggYW5kDQo+IHR4IGJ1ZmZl
cnMgc2hvdWxkIGJlIHZhbGlkLiBJZiB3ZSBjYW4ndCBhbGxvdyBhIGd1ZXN0IHRvIGJsb2NrIGhl
cmUsDQo+IHdlIHNob3VsZCByZXR1cm4gYW4gZXJyb3IgYW5kIGxldCB0aGUgZ3Vlc3QgcmV0cnku
DQoNCmkgYW0gbm90IHN1cmUgaSBhbSBmb2xsb3dpbmcgYW55bW9yZS4NClRoZSBhc3NlcnQgaXMg
anVzdCB0aGVyZSB0byBlbnN1cmUgdGhhdCB0aGUgbG9jayBpcyBub3QgYWxyZWFkeSB0YWtlbi4N
ClRoZSBmdW5jdGlvbiBpcyB0aGVuIHRha2luZyB0aGUgbG9jayBhbmQgbm90IHJlbGVhc2luZyBp
dCB1bnRpbCByZWxlYXNlDQppcyBjYWxsZWQgd2hpY2ggaXMgZW5zdXJpbmcgdGhhdCBvbmx5IG9u
ZSB2Y3B1IGF0IGEgdGltZSBpcyB1c2luZyB0aGUNCnJ4IGJ1ZmZlci4gRGlkIGkgbWlzcyBzb21l
dGhpbmcgaGVyZSA/DQoNCmZvciByeHR4IG1hcCB3ZSBkbyBjYWxsIHR4X2FjcXVpcmUgc28gd2Ug
bG9jayB0aGUgYnVmZmVyLg0KDQpOb3cgd2UgbWlnaHQgaGF2ZSBhIHJhY2UgY29uZGl0aW9uIGJl
dHdlZW4gaW4gcnh0eF9tYXAgYW5kIHVubWFwDQp3aGVyZSBpIHNob3VsZCB0YWtlIHRoZSByeF9s
b2NrIGFuZCB0aGUgdHhfbG9jayBvZiB0aGUgZ3Vlc3QgdG8gcHJldmVudA0KY29uY3VycmVudCB1
c2FnZSBvZiB0aGUgdm0gcnh0eCBidWZmZXIuIEkgd2lsbCBmaXggdGhhdCBvbmUuDQoNClBsZWFz
ZSB0ZWxsIG1lIGZvciB0aGUgc3BtYyByeHR4IGJ1ZmZlcnMgYXMgaSBhbSBub3Qgc3VyZSBpIGFt
IGZvbGxvd2luZw0Kd2hhdCB5b3UgbWVhbiB0aGVyZSA6LSkNCg0KQ2hlZXJzDQpCZXJ0cmFuZA0K
DQo=

