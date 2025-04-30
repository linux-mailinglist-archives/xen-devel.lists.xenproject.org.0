Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AB9AA43D5
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 09:23:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973444.1361571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA1mN-0002Uu-Py; Wed, 30 Apr 2025 07:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973444.1361571; Wed, 30 Apr 2025 07:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA1mN-0002Sl-N1; Wed, 30 Apr 2025 07:22:51 +0000
Received: by outflank-mailman (input) for mailman id 973444;
 Wed, 30 Apr 2025 07:22:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZps=XQ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1uA1mL-0002SM-NO
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 07:22:49 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20631.outbound.protection.outlook.com
 [2a01:111:f403:260c::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea713d44-2593-11f0-9eb4-5ba50f476ded;
 Wed, 30 Apr 2025 09:22:47 +0200 (CEST)
Received: from DUZPR01CA0212.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::18) by PAXPR08MB7671.eurprd08.prod.outlook.com
 (2603:10a6:102:245::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 07:22:44 +0000
Received: from DB5PEPF00014B8C.eurprd02.prod.outlook.com
 (2603:10a6:10:4b4:cafe::78) by DUZPR01CA0212.outlook.office365.com
 (2603:10a6:10:4b4::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Wed,
 30 Apr 2025 07:22:48 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8C.mail.protection.outlook.com (10.167.8.200) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.20
 via Frontend Transport; Wed, 30 Apr 2025 07:22:42 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 AS8PR08MB7838.eurprd08.prod.outlook.com (2603:10a6:20b:529::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 07:22:09 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%5]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 07:22:08 +0000
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
X-Inumbo-ID: ea713d44-2593-11f0-9eb4-5ba50f476ded
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=fwN1pdcaD/G0zG2P4mDSv6FFcSrgUPPK/SgdkvqJ9LehSzyjG/7FOOazusKY2xHGg7GF4XSeCtdFyBsiiDysJWetl0iMJbGHBiF3wHxZ+36s0hoMQMqLlvoRhFdn/Dy4obtK/gKgLSKNYC/Xy33WviPUTkggplX1QaGu4RRzOz4nGTJyHfaThwp9aij5+43zK9limc+ztlDsOBllfC5pS+zRootnzJ+s5A4pMlBXeVG27r9Ng3Aa4u31RY+eyK35CHGYZby/3hx9dVff2/3gBmy6H+kXllJvOSHfw9QbL7LqExxUJ/DNYTLrKUxMCuZU2E7gyTfxBOOdwy025P4/fA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ulub1yCInVWkIRRBQ/MXTgwVWb+nxcubYWvPPGxXHQQ=;
 b=UhhJxYUA7Tv5bYDDNaFhDII0MyV1kmTrUpm9BYSgVj5ziSwcgw8y/2xLkAQKnjprH393LgwT7gKjpun7hhc+xrb7fD+GqPVnI3XxPe9cRs9ONWv7G0joD5ript5hvLHg10s4BDz9vLG1ZoPQITXr3OMUujrayKVE0b1yMig94yOjy9AzUcmcFOxqMsUoAqgbH1RmcUb1suL6eHuNSn572cLXZbpgMN/EoJE6WWo3Qe4rlZ4qgoVEYIcxFgmh51yYNeCRs9It4zmjQOwRUtakRA38/S/KUINJoCcbZQyOjdU8vGy3uMVOWhCwdivxgBEUm1oZMbJcPWQcJQB3X4ugAQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ulub1yCInVWkIRRBQ/MXTgwVWb+nxcubYWvPPGxXHQQ=;
 b=Y93crCthdPLaSO72EiSlTzp/52VMbbxBDUUq7BLnPfWEXbyQx77VImQfBkijiJQ9987DnTCGSJooHCyP7/zr0R5e23YyFLMcP6wMcBN7NtX6ST/DkzEbfVTrniEpIMp4gXlPuN65/JeIT+h7JlyRAeWRViZCc3+mpGxxGJEk+LQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SiU7H/Uu3/d+46+qe4UCO8xBudP81kYagckS/B+8T9/c/EueYydvnRwYAWgaMojAVOVF2VpPfKafgnQCro5+YVrj7/uwd15G3BEAkluMwcJy7bXGbA5ba9GE61B7Ks4m2OEyLScZgjaaS6j7wkgScU/TISCt1KNmTSRiEG6dc8PGmwwB0tWQ0uYdtI7vkFQ2J54OTkTO1JDbNrXjyszSlhAiC5rxih/4Ak4IjKyjEFnAqVQ/r9XZ9fph1YLi9hC6dB3s0vLe5Wbn29UKIeLmVa664KoKbfyWzIWs5sdOXsKAeC8ZJeJ0cH4zOjUYpgu1jEYjs97KOg42aRPn1YH0LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ulub1yCInVWkIRRBQ/MXTgwVWb+nxcubYWvPPGxXHQQ=;
 b=uXDNzfv5W59i5PhXhgvg5F4ao2Ma+OAedzg3ESnlugDDxIAZYq6w385YzG6atnCfo2E6UBMnKztkSjIcRyAqoUMHJaAf+cPUpHCyjm1dGzg1hUF4sf2CPUoAStfjKHzFNtYuvJBu1cjYhe/hk1f3Q8+5cW09I2qLXHSXDQDu/9lv0qXo40GMmsaF/tonLlnPiiMKUAvxWjfxETMpseFwtkI7iJe0i7ZmQg5Uvn8TtJKEAiWqjA6y8ALRDefmq0JZ04pPTy2VOYAgsLFv9qAsAq6qE9k6TbK88Lhhf21TeCggG+jy0U2l4n5rasbYMKKx91Rxxda32aUBagivl8SJhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ulub1yCInVWkIRRBQ/MXTgwVWb+nxcubYWvPPGxXHQQ=;
 b=Y93crCthdPLaSO72EiSlTzp/52VMbbxBDUUq7BLnPfWEXbyQx77VImQfBkijiJQ9987DnTCGSJooHCyP7/zr0R5e23YyFLMcP6wMcBN7NtX6ST/DkzEbfVTrniEpIMp4gXlPuN65/JeIT+h7JlyRAeWRViZCc3+mpGxxGJEk+LQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 1/7] docs/arm: Document Xen booting protocol on Armv8-R
Thread-Topic: [PATCH v4 1/7] docs/arm: Document Xen booting protocol on
 Armv8-R
Thread-Index: AQHbuRpmN9lJogKQoUiVWa6WakCsQrO7wm+AgAAFy4CAAAG8AIAABNmA
Date: Wed, 30 Apr 2025 07:22:08 +0000
Message-ID: <12D73845-62C1-46CD-AA15-376B230F2513@arm.com>
References: <20250429152057.2380536-1-luca.fancellu@arm.com>
 <20250429152057.2380536-2-luca.fancellu@arm.com>
 <a78219d3-4872-42ff-9588-53a65a6bba74@amd.com>
 <BCD1B005-3231-4542-9574-A269F4DDBBF8@arm.com>
 <bc825300-1a9f-4cab-a0dc-f4f354a0cc9f@amd.com>
In-Reply-To: <bc825300-1a9f-4cab-a0dc-f4f354a0cc9f@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|AS8PR08MB7838:EE_|DB5PEPF00014B8C:EE_|PAXPR08MB7671:EE_
X-MS-Office365-Filtering-Correlation-Id: 01eab462-2f58-4e5e-1d80-08dd87b7cbff
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?YXhGVlprdFhoTGVNWWM4NEt4dTdaeHNGaUtHb0t0N3UyMzVLMkR5cVV4M2dL?=
 =?utf-8?B?Tit1ZTJrRXZhc29oNzFUMFBSeHFJRm1aemdrc0gxRHZ6Skx5NU5EMWRIU2Jw?=
 =?utf-8?B?bTFoYm83SzVTaFN2QXU2Mmw0NnRORERFWnUxVDVVMGZSL24wbUpjQXJyOUZ0?=
 =?utf-8?B?WFNyVXEweHZuaHNrTDRJM1VPZ1NrVHNXOVpkZWozOFV1cmVYTmRPUFhFLzNV?=
 =?utf-8?B?TkQraHgxTEliYWp6WDcwZVFGLzJXU1BXeU9nNGMvUGQzZjhXcDdHeVpERFR3?=
 =?utf-8?B?K3lsVWJ3bG9rWDNGUlJZL2VSQzBJNlM2Y1BKbCtwSUUyeUVUTnFITEo5UExE?=
 =?utf-8?B?VERIT0JKZEY5dnBNVGZXWUcrcm50K09DbmhiS1FsZWJ3a1RIQ3c5WXNobHpq?=
 =?utf-8?B?VXF4ZStVd0lKUEMxZDhvYkQzbnRXRkp6bktVSnRtbkZMRHZrbHJNdmk1S2o2?=
 =?utf-8?B?b1FTUTBsMWJ2MVd6SmhLTDRpSVYwOE9zdnl4cFFLMi9yMVdJbzQzcWFFT2kz?=
 =?utf-8?B?RFdhK2c0cUd0eVhERkpjaVUvZ3NCUjlNS0hGRnRER3RUb2ZlTUwwM2k2blFy?=
 =?utf-8?B?ZTY1Q3dmOWt6TkFTR3BrV0RhMml0TFlvYWFTR2w0ZnBhL3hjbjV0L2tQeHYy?=
 =?utf-8?B?dXg3WHQ1OGR5ZDlIZWJJZysxOFJVcmhVMjFjaW84SC9NNHBDbUdMa2VNdFJH?=
 =?utf-8?B?YWpuakZ0cXJ2eG10YlNkVWZpNytBcVRrdk5kWStWVzlyT1h1ajRNdkRzeWQ2?=
 =?utf-8?B?aVdYZWI3Q2dIWVhTcCtIejhFSWNPbmIvNGtqN3hIRGZBcGVhMHM3MVk5Znc1?=
 =?utf-8?B?a2l1SGdtZWtRZFUySkpqVkV0ZFJIdjVzcWF0azZxb0lwaC9wZ2c4djZGYmhn?=
 =?utf-8?B?UksraldSQ085TG0yeW04QlpOb0JseUp5VzlsY2poTWQ0TjJGWkd1TzQrZXdr?=
 =?utf-8?B?NGRHT05heVovcXRzQi80SkFFcTFwa1NCR25uamZuamNHTW54VTNzYWJmMWlR?=
 =?utf-8?B?cHdBSmYwZ0VxMkdyYzd3ZU82Zkp4TkhPN1lHVC9ta3c4MWFhaG9RS0YrSFYw?=
 =?utf-8?B?WHFaUlk5SGhjWVF1N2xiSkQ1M0FDbkExTmh5bzIyYW9jVmo2OUdWTDhNS2ht?=
 =?utf-8?B?SkhCemJYblBVYmhJSXFuRUY5ZjVleFk0M2x2N09xbllkSnNWTjBJZ1lHNXJx?=
 =?utf-8?B?WnI3NVFkQ05GMjlCNWk1Y2Fja2RnazFDTUZWMGluTXFpYTdRbGtwTHdTZVhz?=
 =?utf-8?B?d3BuUlcycTNPRFE2Q0RTbHh6YXloSTRCMjN4VXdpaTFQWlRYZXZRd2xyUjFR?=
 =?utf-8?B?bUFpWk1MNjNDb0lWcVdDRkxCbGNsWTBDYTRLY3l3dVJnTWNFdjI2L25EM2tp?=
 =?utf-8?B?UC9Bd01aM0F0ZkR4OGxsWVpEYVdLYkNOZ0ZlMTNKZm02WVkwVFQ3cElvOThx?=
 =?utf-8?B?L1hTWnpSMDR5TitEQUc2T3JoODRzN216WmJ4dVMweUl1cDAvL3hmem9EM2NY?=
 =?utf-8?B?b2cwS0Vyclo2ajIrWThYSG02N2RXVk5oQitvWlR5QThOUzlnZGZ5VDlvWmRr?=
 =?utf-8?B?YWRraGNzYnl4ZTJQR2xLR3NUZ3dDMW9DR3Z0WkY2b2REUjE1Zm9Rcys2QzEy?=
 =?utf-8?B?dGR6OHMxREQyVHZTMm1WNFNnQzVIMmVRNnFZSWdSU2xvYzJOT0FZQU5SVllY?=
 =?utf-8?B?TTBDWlg5Y2JMSDNCV2ZTSjZ4UElWWmlkMmJSa3E1ZWNXTldiQ2JLQklHQWdr?=
 =?utf-8?B?VlNhMWQvdmZlNjhkYm1Dak41dmZwQTd2emM0bVlGcWZDWkNjVWxvRGVDSnlO?=
 =?utf-8?B?dUtONmx3MWZtWUNnZW52d0JiS2JTTy9HZnFKems3WVIrbTNUZkUvcjBzakFx?=
 =?utf-8?B?MHdoeHFPYTIxMjVuNjUwR2ZIamVlZzFra2ZWVG5uYjI3enFoYi9UQWsweHJ2?=
 =?utf-8?B?bXZseUlVRGVkY3RrQ1hZWlJ3K2FDNjJndTBGQmNmdGszYzN3b0Vyc0lPYkJW?=
 =?utf-8?B?MVp5WmFnaUVBPT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <611CD6E4A1D1C442AFD079B88027495A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7838
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	87d70197-74d1-4832-8600-08dd87b7b7d6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|14060799003|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZE1oOFVWWjFPVWEzcmRESWE2a1l2QWN2VWk1NTZSN2RINGpadEpsU05oZ28v?=
 =?utf-8?B?R200WnF1VjQwcjBqT2tkRDV0SGdYQjhwNktDdmJUb214Vm5PSkIyUmE2Wng5?=
 =?utf-8?B?bkZQdkNoRUVjWGxqRERuRG16dVZYREgyTEl2TDZKWUtlNVVPelJlTEZUTVRw?=
 =?utf-8?B?KzF0NlNtNmlnNjJPSWN0M0c1WEFFREkyYmU2UlNZN3k0dTkrUFQ1c0dXWW5U?=
 =?utf-8?B?ZklGSWM4ejY0NnBzVWN5Q1ltNmdqVmFsbFEzVm9xcWhaV2plMW5XU0hDUW41?=
 =?utf-8?B?dWJCc0V0dEY5dldKci9iVDc5dmNOUHZXcDVLdjhNbW9OT3RKc3g0ZHN1QnhQ?=
 =?utf-8?B?bUZpT2g0ZTNWRmtud2xrRllvVGJFTGRucEo2cGZhSXhwQWp0TnplL3I0M3dy?=
 =?utf-8?B?QjY0OUJuSjk2cEJiaHhTcGRlTXcwdGdNT25pNHVyYmxDcVhzRExUV3QzWHI3?=
 =?utf-8?B?L2pTczJyQno1dWxiVXhlNUtEdTBjakZOT1BhbzZDMUpEK201R2s2VmE0Y0JD?=
 =?utf-8?B?RTA4SFYzTlc5MU5KSTl4WW14bjlhR3dUbnRDek4yYisxbEwraC82MktGZGs0?=
 =?utf-8?B?aDJwS3VOeitUZ3p0blJEL2oyY2VUQStLZzZ6akRDL1R5ZXBiUE9kVHhNK2dN?=
 =?utf-8?B?bDAwTlBLNHdPK2E5VGZqb25KcTM3UEQxUUk5dkRNa242TFFWV1VpYk1hY0ZS?=
 =?utf-8?B?VTF5QzlmQ1JObElwemJCRFQvWHlKcm10Vk53Z1lLaDgxTzgwZW5HbmJ2U1Z5?=
 =?utf-8?B?MEQwQjRMZUs3QWpaMGFiaDlld0lraU96UHFvbTFwWGFxcEZVQjNVK0cyUHk5?=
 =?utf-8?B?K2YzTUhnSXl1YmRkU3RtVEI2RlpxWVRiSUpVMGFxSlh2Y2QxNDJRT3YrckJY?=
 =?utf-8?B?cGFtU2lLSno2b3ZnU3dFYUJwVzVmYVRIdnZpMHNsQjhKTWI0SGRYQUF3Yzhn?=
 =?utf-8?B?c3J0SFZHUVpTOGM0VXNvVkhRR01pa0dEa2FtTzNrT1cvZExSV0ZCVm4yN0d2?=
 =?utf-8?B?R2kyNzR1SnE2ekRxclpZc3ZabnFLSnNuQnB5dEtjTkJLdkFWMEhidXJCVVJE?=
 =?utf-8?B?VmE4OFZLNVNSY2pUTWlRNU41Wk5EN1ZraFVScXlOY0lINCtWVkhmSVVXejRm?=
 =?utf-8?B?N0RFM2tGcndtYk5vMUMrTVpzT3RvRzZMNUl4d1RlajVRNHFmL3J5UlpJdGVS?=
 =?utf-8?B?MVVCQkJzM1JDdVRWUm1laTRQRlVpUmxNVnZFR1orZWd3eGxHMnN2cEM4cHVx?=
 =?utf-8?B?ZjEvemw4WnY2MkVlSHJtWmhLaUdDREZod1d2Qm5Md1RDMEF5ckFJSHpzenpG?=
 =?utf-8?B?UUY5MkpDbDJ5OHpmbGlqZXFBa3o5T2ZzcFE2ZDRIdThPOHdiaEVlNVJ1Vzh6?=
 =?utf-8?B?ZTRmOXd3TnZZbXpqZG4xdS9qb1JKVk95SEk5Qy9DbUc0aXZ2S2J6YXNOZk4y?=
 =?utf-8?B?ZGc0ZzZJYjJha0ZtSHlyUFpKS2svNitZYUI4TjRPYURzRVA0VUlqcEpscXV1?=
 =?utf-8?B?UG9XUkdoWVBLeUFneHI4K3d6cTR1YUkxclZaMkp1UFQvaWlXTDVUWTFxaVZw?=
 =?utf-8?B?ZFZ2Z3huU0F6RHM4RVFXSDJNZTJvZ2RHZG9hdHg5N2dZZkVCTHpNU0hjeExT?=
 =?utf-8?B?cWdaaUpwUUM2UUJGYTU5UHVWZDRHODZaUlpuVUx4c0NBSDZlOS8rVmZVTlRF?=
 =?utf-8?B?K3pjUnFDUkErdXdYYUNiQUFUVXdmeVdSRHVFWFlKWThXM2FmZ0xtcGRyRG5o?=
 =?utf-8?B?NHNhbnAzbWRUT2NCS081V0RWekFFdklZbTZvR3RiMEh2L3FIUFRZbFY0SW1B?=
 =?utf-8?B?S2pvOG4wbFhHRmtyTUxxMTBOQU5tUFNiMnEremFhTDJwOURkd1dBOUxlbE1y?=
 =?utf-8?B?azUrTERXV0pvY1pmUW9jeDJkbXQ1Y0hObWZhS28yTDV1aUREenJCOStXdDNp?=
 =?utf-8?B?WUlEa2NYNTlZM3N5dmFhbExBZG9xQlU0MWJWdzIxdS91dUNKbkNtNnQ3NUM2?=
 =?utf-8?B?NjB4QzgrZWRmdHJRV2s3SUJjK2dFK0JubkVsT1VmeHhjVEFwTW5tRHJ1UjQ1?=
 =?utf-8?Q?bVS3GM?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(14060799003)(35042699022)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 07:22:42.6673
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01eab462-2f58-4e5e-1d80-08dd87b7cbff
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7671

SGkgTWljaGFsLA0KDQo+Pj4gDQo+Pj4gSXMgdGhlIGdvYWwgb2YgdGhpcyBwYXRjaCB0byBvbmx5
IHdyaXRlIGZpcm13YXJlL2Jvb3Rsb2FkZXIgcmVxdWlyZW1lbnRzIG9yDQo+Pj4gYWNjb21tb2Rh
dGUgYm9vdGluZyBwcm90b2NvbCBpbiBnZW5lcmFsPyBBc2tpbmcgYmVjYXVzZSBpbiB0aGlzIGZp
bGUgdGhlcmUgaXMgYQ0KPj4+IHJlcXVpcmVtZW50IHRoYXQgWGVuIHNob3VsZCBiZSBsb2FkZWQg
YmVsb3cgMTBUQiB3aGljaCBhZmFpY3QgZG9lcyBub3QgZml0IEFybXY4LVIuDQo+PiANCj4+IFll
cyB5b3UgYXJlIHJpZ2h0LCBidXQgSSB0aGluayB0aGlzIHN0aWxsIGhvbGRzIHNpbmNlIHdlIHN1
cHBvcnQgMVRCIG9uIEFybXY4LVIgYXQgdGhlIG1vbWVudD8NCj4gTm8sIHRoaXMgdmFsdWUgZGVu
b3RlcyBtYXggUkFNIHNpemUgeW91IHN1cHBvcnQgYW5kIG5vdCB3aGVyZSBYZW4gbXVzdCBiZQ0K
PiBsb2FkZWQuIE9uIEFSTXY4LUEsIHdlIHN1cHBvcnQgbWF4IDJUQiBvZiBSQU0gYnV0IHJlcXVp
cmUgWGVuIHRvIGJlIGxvYWRlZA0KPiBhbnl3aGVyZSB1cCB0byAxMFRCLiBEbyB3ZSBoYXZlIHRo
ZSBzYW1lIGxpbWl0YXRpb24gb24gQVJNdjgtUj8NCg0KVWhtLCByaWdodCwgSeKAmW0gbm90IGF3
YXJlIG9mIGxpbWl0YXRpb25zDQoNCj4gDQo+IH5NaWNoYWwNCj4gDQoNCg==

