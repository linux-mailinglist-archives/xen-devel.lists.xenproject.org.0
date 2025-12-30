Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B57AECE9D5D
	for <lists+xen-devel@lfdr.de>; Tue, 30 Dec 2025 14:57:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194256.1512715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaaEC-0001nV-IL; Tue, 30 Dec 2025 13:57:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194256.1512715; Tue, 30 Dec 2025 13:57:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaaEC-0001lV-Fi; Tue, 30 Dec 2025 13:57:36 +0000
Received: by outflank-mailman (input) for mailman id 1194256;
 Tue, 30 Dec 2025 13:57:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jMxH=7E=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vaa8e-0004Hp-6x
 for xen-devel@lists.xenproject.org; Tue, 30 Dec 2025 13:51:52 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0cefed2-e586-11f0-b15c-2bf370ae4941;
 Tue, 30 Dec 2025 14:51:51 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM6PR03MB5194.namprd03.prod.outlook.com (2603:10b6:5:24c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 13:51:48 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 13:51:48 +0000
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
X-Inumbo-ID: b0cefed2-e586-11f0-b15c-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XhQn5BUb1heFXnIWFvQyrxn6LMz1INFQeeRrfvCFdjT0ryuL4VRCJS+5HxQ0TgavA61ubdvvQyUDHgnfYlymjRzYHRcqmvB4RztzV12d368sTc2udYkcB/v//dnE8qaqbBAbrFx/jYqsWIqiwnxxHo3QTloLRsnIQDHBDozcMYoqC3PB569IDyXjurtc4Fg0Oo9K2Jbdee/znceBQr/K1LpiNcNz2AHay0E+v8i2j25ErYTnq4exPk3LgReRceXdCutqcxNLeLuDDbUOYi3+jQ8jFCpTUCnL455KZq0mjC0+otxdfHCq/fSHrOmWl/bmXMW/kSxPjHWsE3MtyeZB7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=foobvr7qFQfX2w637ND+wjsBAvv+WwCG9mo2e3maVuE=;
 b=pQbkk10jZ5TTOUQykq5dO/xMDS1pDsySK2Dn8iXtNufn5HGvEyUxAq99CLgg6ehDxEEkmQ4jJDxinkeAnLUFIuCD+n7/CDU9BOT3/Cwbew1PcyDaA7ly5WU7fFGG7n2uBAmcaydYuF0GXzR2Of5wA+pMwvKuEaxMR/FmP/14AHh4jBGuBngNsKWb0fmLaMbja+Ji9mOXYDFmFgjVAgPnn/oOrIhJiSae3CmWDZ1ERyuSdYGULb0vikaUMORQoFx+zKBmsvFhsk1Yn1XJ0z1jIq9E9ekOUYdhvGly0SrhmFjRXCAIJzripi/bTMidQ6djqoEo3jyzSYKTRWohHgxZFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=foobvr7qFQfX2w637ND+wjsBAvv+WwCG9mo2e3maVuE=;
 b=qwnBH5/QMIvx8qmtrgOxpfkkktyObRrd8yG23Ah/F2xpVMzIpleU4pVAjFBK5VkigIRPN59V/pBwwvgZSsXTTCURrrn5Rflm1HNlzri2D4UkBE+/pEBw9XO7ixKJ56MjyP80lsb2cRNVgyX++rCz8cZDOr52kLD1VzXlnXl/b/0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <47508916-128a-4bc2-b73f-ddb1924a2123@citrix.com>
Date: Tue, 30 Dec 2025 13:51:43 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH] xen: Move x86-ism out of muldiv64.c
To: Xen-devel <xen-devel@lists.xenproject.org>
References: <20251230135026.188162-1-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251230135026.188162-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0082.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM6PR03MB5194:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e9fb0a8-1a40-43fc-f4da-08de47aa93c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YzRHTUhLR0ZNQmN3Q1BuYnJmcHkyWFhPei9ja04rWmU3WWRGazNpR3NDaFk2?=
 =?utf-8?B?c0J6RGxMTUNEMGJaanNteit6N1NPenlNanBNR29mL0M1UnphclNCaHV2YkhY?=
 =?utf-8?B?NXJ1bnF6bE9iM2VTNzF1dFROd0ZaZkZiNXp4cm0zbnB6WTc3L29nL2VoT2tG?=
 =?utf-8?B?bERTZTNKdFpDMVdkR3hmWTQ3bDdHSnNzUkNyVTA2QjdRQVFQVHZWQWpiT3Rp?=
 =?utf-8?B?SVVrY0oydlZWYmlabGRhdjE2dHNIcXdzTWJ4dTYySjhHTHk0WVA1Rk5IYzVh?=
 =?utf-8?B?SjJuK0NLYnZmQ2JSOFNRNWxYemZjbDJpOU1Edko2bFlZR3paMmRnN25xMDRq?=
 =?utf-8?B?MExqZFpsQ1RyOXFTUEN1WVlaNjVrY3dJSWRQQjdVMll6WUx5M0tzQktaS1Jk?=
 =?utf-8?B?dCtyL1EvY29tb3BDYm5ZNUZzSHp6SGV4ZHlZTENZbm5DdkVrMlNycFVpVjM2?=
 =?utf-8?B?U1p5Y1pZZndQVWNZQmQ3NGszZ0NvSy9FRk1Nb3JuV3NpZXlGWG53K1VsaXVE?=
 =?utf-8?B?NU10c0JSV3RreEliUTQwV2VGeVhOQThnK0lVY1ZQOGZTVWZXUG5kblY3M3BF?=
 =?utf-8?B?Nmo4T3VTb3lmVEQ1QitEWUhwMGFiU0c3TFlKaGZyT0YySTlFY3VZUytUK3Fi?=
 =?utf-8?B?WmVFdDNyL0xvZ1lFUEFVU0thdTVjRnFPa2k0VVVtQ3hCZEdrWU5XQzhFOHNO?=
 =?utf-8?B?RmtMOStJeFlWRVhld2RXRkhwRVdwd0dGR2NJYW8yWks3VDJBNDZzRm93MXFG?=
 =?utf-8?B?SUQ1NEZ3TWVPdk5BTmdPRG1YR1NCR0ErL3pjZml6Yyt6NUJtMGwzRzFyL3Mv?=
 =?utf-8?B?TnFhMmFZNUxqSThtV0QrNkpSL3N3bmJZeGJFdTJEcG1kMkJmYlpHU01qTkFC?=
 =?utf-8?B?SmtLWnVrb3ZLWCt0Z3RyM0IvcmhPcjVkSnM3RHlRdXFCT2xTeUthZ3lsZXpR?=
 =?utf-8?B?UlpiWFhiLzdMU29UbWZWaDY2RDRCZ05Cc2VXTGhlOU55R3pvODQ5eUVVQitW?=
 =?utf-8?B?eE4wb08xUFNkanJVVXdDNHV1UWdlT21iSGNkQzBySjJWQzRkWGtxaWJuVnpG?=
 =?utf-8?B?NVVDOHVHTjR5ZXlMOFhFWjh3SDQ5M3k1RU1RVXJFUkNIeVFYa2tPaDIzNngw?=
 =?utf-8?B?UGJ5eGQ0MC9rclIvaGVIbThZM1VtVk9GQUdyMDM2UjUwSTVZWjdIM3o4VWNm?=
 =?utf-8?B?a0pHa0hyeGNwT2ZoMm9aemVra0xjbEQ2WmNwZ2piYTQyQldLOEdwWkFETEJr?=
 =?utf-8?B?T2Vzd3RwWjZkbm9jZjg4LzBqWmZab1NHZklDUW1CSm85SW9yUjFUanM2eldh?=
 =?utf-8?B?RG5xMHQ3bjQ0RE16d0FSL0x6eHNUZU1sY2l5eVZDNEdxSXB6TjU4UzU1NmJT?=
 =?utf-8?B?VWdzZGZrMlJ5SHpyenkzZ1pTN0FiUG1FYWhaN1pYaWZPVnJLZTlQVERvYXZF?=
 =?utf-8?B?SEtrYnU0QmdEUktCOCtIa1Z3azZlMm4vUVZCK3RnMGhuMnlWYzNtVGY2bWMw?=
 =?utf-8?B?TU9CSlpjRXh3ZnlvRCt2YVIrdnJjQ2JXa0s4eExzTlR6VU92d3IxbFErSmdX?=
 =?utf-8?B?OTRrNjVmWnBOY1NYdTlESElpVUNwRC9DQWhZNTBmQkl4QXFCUEhrZlRraVJk?=
 =?utf-8?B?TnlLbHN3Qk1MMkpaOHRGOGRGc1hIUGFuSUVaeElrelpPQmREL21jNGExWUYx?=
 =?utf-8?B?K1AxREVzb1pHYTZHbmpMLzZVZ1JiYXQyM3dKNFFGNjhzdjNwYkx4VGMyQU5t?=
 =?utf-8?B?ckYrYk5LajNBMTVSQWFCR3RNdnhTSUpsTVdWb3ZoSU5hL3Brb0pvbkR4WHZJ?=
 =?utf-8?B?dlp1cTFCc1VJL3BzN0NHUmhiaEpVOGJpR0IwMkVqVTg5SzJBR3N4ekdJdXNC?=
 =?utf-8?B?U0NCZEJKSDZweDdwMTlvUGVjS0VLZzFBaHVrZFhWbWJiNUNzeTErbG8ra2hl?=
 =?utf-8?Q?Klqs7HFbDxavObMqEAxd2wqVZH/3Qji6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkhWNzJnTmlsS3laR1VEdEtsTFo4TXpMVkdVV3VLYzZUY2x3eUV6NUUvdG1m?=
 =?utf-8?B?MDQyZkIrcVBmVGJxQ0MrTnptL1JXeU9BYUVlY0ppbVIveDZ5Z253UDRpQzhG?=
 =?utf-8?B?OVlOT3NGSTBHZlJRaTBQOFh4akUxdWZtUnFDdTIrS0RTd3FweFpOTGVXbmZi?=
 =?utf-8?B?OWZORTduQ3FSRWZqcktuc1JWQ2daVnFZSFJoVWZRWWhPUGswc0tObFNwdUZK?=
 =?utf-8?B?YnFSRWZaZFNTMjBzT2F1M3hHV0lydUk2cU1WOVhYWHFKbzNOblR3YTc2ZE4r?=
 =?utf-8?B?TEJ4OW9lYXhLRDFOMzdIT2ZwcWR4d1g2U2FsN1Bnd1RQbGJPcVZEeTJzR0or?=
 =?utf-8?B?b21vRGRNUXhsQjhCcHZySDJZejE5RHRzNWVmc3cxd3hZb0Y3UzFjZkNoZUlI?=
 =?utf-8?B?YnRhNng3R2k0azJoWTEySDhZTGNBNGM1dEVsU0YvdkxoTVQ5QzNZTmJxcWoy?=
 =?utf-8?B?VjZJZlFCc010UStjdzhwK3A1UXI3ZkVJbHBrNUhZNllyRWJCOG9BalN5d3Np?=
 =?utf-8?B?YlZmSHhUS1NQc2hIK0tjR01JTUtMd3FMV2ZBNlhDeE4wQTl6eXQreXBTSDk4?=
 =?utf-8?B?R2dyNThnbTFNNEFtYzZoOGVDdU9HYkhnREl1enJ4NXVoMDR2bm5Ld0VZZDFE?=
 =?utf-8?B?SEViQjlrdU9acy8wbzB6SXlHc0pkbzlPazRjOEhBcjV1dlQrSnlUODJrRjYz?=
 =?utf-8?B?YnhFc0c5Ti9wVWZHckpRQkdKL05sNEN6bjNHS2EyS2FQdFk2S3pmOFJOcjlK?=
 =?utf-8?B?bFRJZmhxZnVUbXp3WGxrK0xEL1hDRzlwR3JuSk1TTWV0bE1ndFdOMmpqa2VF?=
 =?utf-8?B?azlCSkJZRjByNkhINDlEVHNRcDhnTlNUbW5rV0ZSUDZZTDlONWVzVnhMYlJW?=
 =?utf-8?B?cWtKWW90Q1BKN3JUUkdwTEIxcGlxRHh5MFlDamtsamJORk9WYVRYYWpVUWlT?=
 =?utf-8?B?SVVuS3k5dGN3dUMrVThWU0lyVmNrYmhGTUhIaGJnUVJQQ2FrMG5lNGFDaTkw?=
 =?utf-8?B?bk5RNFQ4TTVtc1RwOG5mc2dDbldNTVVrVEV3Q1g1ZTc5aTNCR3dFeDZ5Y2pw?=
 =?utf-8?B?UkplVGEwZ2dYVk93aXFxVnlMdWVCMDJpbXdXZ01uNFRTcllGYlk3dWRlZ1V1?=
 =?utf-8?B?c21lM3kxdHloc3B1bk04UHE3Nmg2YVljS0xMekR1NDV3eTUvQUxxWkxoeElx?=
 =?utf-8?B?YUpHdFF0V0kwWFZOeVgzWjdSZElpd1psU3BpZFpKbXloQmdVWW9wbUhjZzll?=
 =?utf-8?B?RmdSdkhmcnh2YTcxOWdDOTZoaTcrTkw2SExvOGZDcWMxYVdjUWNYMDdnMys3?=
 =?utf-8?B?T05vL3RjcWkvNUJ5cGt4UkR4QmpJQ0QweGJieVdDdStsbEg2NnlyWFpTZUZi?=
 =?utf-8?B?dUkveUo3M0dxZU1qUnhja2d6NWZiUWFWZ0JNUGRJdWNMWUFnQThaRlZ2d2ds?=
 =?utf-8?B?d2JmeC9UdTdrcWplR3NtWXJPam1WK01Wa0tkQnRhcmRNZWRJZEVTNmRaRWJW?=
 =?utf-8?B?Z2xKTFRFY3lwVVpYZWlyWlAzbTg1RmhoRzB2S0VVVWxXWTB3dWYyQzk1bE8y?=
 =?utf-8?B?c3FjdjV1aTBtK2FuNC9tQzlDRUtEUVE4ajUvSk1GQklPbCtiWHZMK2NLNWtO?=
 =?utf-8?B?ek1sUU9pS1duMzg2T3ZuVDhxUVI0NjRLckk1VDMxWHRQeVFqelM1VWpkNURT?=
 =?utf-8?B?YTlmN1p6djJpZk1WZVVsRWhXVzZhNWR2VThDaUFoVUtIdU54OUxxVmdXTkRt?=
 =?utf-8?B?UEhqM3NuVlA4Z1JMNk9zbFpIMFFpWVIrTU9DR1RmU2lXeWU0R1ZpNE1HZ3Bw?=
 =?utf-8?B?WmpycjZSSkppbWdXL1U4L3VZY2tnV1BQVDRoVkVMTTF3WnFvZUtmV1NqWDVX?=
 =?utf-8?B?SVFXNmdqVjN4ZU12MkdSOTZsU2tDcEdweTU1Qi9zcmoycWVxVUNvNG12SlV5?=
 =?utf-8?B?dUlMTmhTVFNucktCTkZWTG5lUVhzbld2WEt0WVhST2xsSjgxMnY5czVxYWJT?=
 =?utf-8?B?RzhyZFM3a2JNTTE5ODYyL091eGNLd0tSR3ByTjlMWnNkWE84TmFrV2lyYW1z?=
 =?utf-8?B?R2hEOWpjSXpkTURIcmNLbXdwazByb0g1L0srYU9YVEFoTUpyOXFEVUZ5RHk2?=
 =?utf-8?B?WW9vUlhKRmdVOUtvY3lWcm9kYWlVMDgvWkhlMEo0aGlKQi9Xc3BObjdkMlBD?=
 =?utf-8?B?OFQ4eUI2dGIxL09KL054akR1ZUlHQXArTFF4TXQ0TkJYelczRjdqTWRNWGl1?=
 =?utf-8?B?dXRYUnM2a0lwSy9RZ3JpRGEvVzgvKzJMOE5lMG9RK3UxRXp5UXY0aS9qVU1G?=
 =?utf-8?B?VmdJNWx2RURlQXFUU2s5RmJOK3BHV2pRS0xTZTVZRTZ2dHQwdFpCQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e9fb0a8-1a40-43fc-f4da-08de47aa93c1
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 13:51:48.4270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S3DmQV6rsLL5HVz+Pp5QRL1D3SlD5ZU/FVIMkpcfzPJvPah8NkQFQ74x2FL8bHvIjA2NEY2o9Yl2F7UqJMTlgI0Ygw+GokoLobG2LKAdrtU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5194

Sorry, please ignore this, and see the version which is 5/5 in a series.

~Andrew

