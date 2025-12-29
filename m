Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19211CE6867
	for <lists+xen-devel@lfdr.de>; Mon, 29 Dec 2025 12:27:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194007.1512512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaBPX-0003lp-2x; Mon, 29 Dec 2025 11:27:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194007.1512512; Mon, 29 Dec 2025 11:27:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaBPW-0003jx-WD; Mon, 29 Dec 2025 11:27:39 +0000
Received: by outflank-mailman (input) for mailman id 1194007;
 Mon, 29 Dec 2025 11:27:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DabL=7D=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vaBPV-0003jr-GJ
 for xen-devel@lists.xenproject.org; Mon, 29 Dec 2025 11:27:37 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ed67c06-e4a9-11f0-9ccf-f158ae23cfc8;
 Mon, 29 Dec 2025 12:27:35 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH7PR03MB7956.namprd03.prod.outlook.com (2603:10b6:610:24a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.13; Mon, 29 Dec
 2025 11:27:32 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 11:27:32 +0000
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
X-Inumbo-ID: 5ed67c06-e4a9-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HzLVUInNWm4Qe3P34sKlG2KvGuX252OGMJ08v3RW3ja3NPCCOxyqYjbgEU4fAaGX1dNAQWqdrwy2VP/l1xJs8PE/OX2cN3WpxXv6NkoE7etrefWfLmXZ+DXv7dNpZPTjJ47vY/RpHifSA+My7ivCPGYLdxm1A9TjMIjzuTFxq5qrnNyESEiLsdQxmm2PZkMNOQ/bWj7h2O4MGBFfb67zI6QJ3zDTyp6OS1hDYlbTfHB/kCTHPFG9c1mciczAfsP/IBfS+CfPyszRfxNSWJQrMkIbhfZhEyg025BQU2uVPhJXsdZCmfRMB87wvVmDi5TGT1ryXcYkpXxPOsa/uJP06Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EqZyFhyNsQetKcGvUKjoour08w8x+Jyj2xRZXGX780Y=;
 b=XhVAH8Lmcua3VTTCfDpn97pmPNt6YeVSnFNgm/1UYbhwtVyV5w6N7KW7I1O88Gu7G5PslkGt72w4321x7AjWP4AXedce9GUPJsKt51m276CRJEd6n1c42pzuyA3W5jjyemU+a7hi0cr51OKKq5rucs+4Aq71KLawb3XPfkPi9v5yLfDDeiSQJB9byGF0NA03qXhhQkz5XPpaIEtPsc4MkMbpa/6IH/xGKw0iE2RCy7xyL4ceI8ktRrUE2IafgCXATpSg1+Z22dh4Wy9/1qXij4BmPMYloAqCyOyFUccsUOduswe4zuY3AQepO5mk463Iev5O0lYvd+ZDqEUVK+Qabw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EqZyFhyNsQetKcGvUKjoour08w8x+Jyj2xRZXGX780Y=;
 b=wEaGGPqF8mkqnmBUX3OqQi5Q8WbnLON5U1RK3PICZKfMgdpQTArU82Ee9VhYmpkzWBBw7Ls/C2sRKD0cJC4CvIWMuyGBz+7U0RmWNg9OTc8tLQ1nTVBDbk//OYzLv7xTHRGQmjcR3Nh8VE6m47VAUngi8RFFETg7L2CrCPQxY8g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <8962e97f-d410-44a5-8ae5-e0fde600a0b8@citrix.com>
Date: Mon, 29 Dec 2025 11:27:27 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 2/4] xen/arm: optimize the size of struct vcpu
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1766504313.git.oleksii.kurochko@gmail.com>
 <0756ee97dd47f6acdefe593694b743eb6bfefacb.1766504313.git.oleksii.kurochko@gmail.com>
 <9f2c9e4a-64e3-4e5e-b5da-976ab433f6cd@amd.com>
 <9f343323-2743-4bd6-82de-afe3b48adb70@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <9f343323-2743-4bd6-82de-afe3b48adb70@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0280.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::28) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH7PR03MB7956:EE_
X-MS-Office365-Filtering-Correlation-Id: fd1a933e-26df-4264-e9c6-08de46cd41ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bW1aeVAxcEEvOXozcENQY1hlM0hrOFB6R0NRcjBaM3FrUUltMllsL3ZyQ0VC?=
 =?utf-8?B?MWlSelJFRGRBY1puS3JuQ04vdkNlVkNENnpsemtpRStRaWpPZVdPYklONW1T?=
 =?utf-8?B?NlJBYll3MmtzY3JrcmlQbVl1SGI0OXlUT2NWeG9YZ1hDdFRtZGl3cEFPYUNu?=
 =?utf-8?B?dTFiSFkxVXdrNEdld2xTcnZxTEJFVG9YK1NROWtpckNyWFJHRjhPUy9mbUZD?=
 =?utf-8?B?ZFBwdHA5OTZQTWcwU2FSNFlUOHB5b0pnV3FmOTFkeTJaUk9wY2JKTHZ4c0lB?=
 =?utf-8?B?RVgwY1VrRUNNZFo5NU1PUC9vZU1lekhIS1JkU0hmM2x4OGNRRHBzZWhYbGhK?=
 =?utf-8?B?dmZPM21BSjBEenlWQ3RXMGd5Mk03UW9CMXNsNEFhUHlNZDVYeGJyT2NNcjRY?=
 =?utf-8?B?bVh1ZyttRkpkTTQ3aW9wYUUzNXVSdXdWeXFXZTRpR2NCV0ZsMkdmcG9zWDJJ?=
 =?utf-8?B?WWN3NFRKbjJZQ0w5RzBwU0FwVFFZQ05hTzVrQUpISEFJUGZhSlVORGhsYzAy?=
 =?utf-8?B?QUhBUFFjTnhVMFgyK3dTZEV4NERpZGFoNkExallKSUlWS0phVmFWT1RuK1Ar?=
 =?utf-8?B?dXFyQmhZeDJjaW83eU9USFlJaHRra24wbTlGNXJtT1p6ZmpNVVNvZ0JSZTQv?=
 =?utf-8?B?Y0FOY2o3UXVnNjViN29tUkdYbjIzcWRGMERXTVV4bHNmb05PNVJrVU05b2Jr?=
 =?utf-8?B?MTVPanZrcWZFZDZlWXVCd0l6MGNrTVFtYUx6ZnNFSktQWUVVdGRSSDZsZmZL?=
 =?utf-8?B?eFNNY0c5RFhBRkppRkt0c3hJSGxrdW9lNHIrTEdBVW10RWRzeFU2Wk9SRzJl?=
 =?utf-8?B?Q1pHQUUxWFBaWldnRTFuMm1hMnl4Z3IrK0J2QkwvajJEYm9uekpTckNzdzZ2?=
 =?utf-8?B?TVgxQUlBMDZIZWRDRGU3b05wWVRTanZOQml4K0RWTkswN1ZkTzdQK1NuSUlZ?=
 =?utf-8?B?Z3FGSm16anBwZjRXK0ZkMG1peVpkZCtTeFFOc2xSK0VuaEp0UysxcU5ueFBQ?=
 =?utf-8?B?MjIxRnJiWVNXRFBkNm1ma09vUkh2L1NqNmdZZGJpYjVxdUQ0UzVZdzJGQXUv?=
 =?utf-8?B?Yk1LVGdSZEdGMjR2aG5aQm9lVTM5eVNLMHBJNG54SmsxZnN6N25DQ0w0dVVQ?=
 =?utf-8?B?TGlXRks3SnNTM1FsQVRyNU5BZ21jVFN1ZnNINWVmckUwYXdieFlMVk96VkVB?=
 =?utf-8?B?MkQrOThGZTFpeElObCtqMml2MmkraU9tU25NajNDdXVUMmR6MUdXWG0xV2Qw?=
 =?utf-8?B?THZkUktsajZUOERSMnhFaDVWbjNJSVdxR2pTbC9HVUtWNWx1N2d2OGZWdysz?=
 =?utf-8?B?OC9BdUVScWhtWVVJOHhOUmc4MEJSNTVFTVVuOWtJRnVCc1lBOXEvUGZKeHg2?=
 =?utf-8?B?T1IyZUxvZGVuek41MFdGNVY1M1dpSjlOWmx4TFgzSlNrQjlXZmV6QVgvcm56?=
 =?utf-8?B?cW0yRkUyaERzL2dpdlRyVzhOS25jUnV4Z1g2MGxFNHRTa2xNUjdXVTNFSlgx?=
 =?utf-8?B?dzJoUzdVdHZ3aUZ1U0pZVFNVcVAwWjhGTXdjSWdoWWY0M2FmWlhJcDNSMm9h?=
 =?utf-8?B?T3ZLMERwNnBYRmZuYmw1MU51ZFJiWUJ2cUk4T1UwTWpXTERlR2FPRG9DL1NB?=
 =?utf-8?B?Q2NkSVZGeFpRVGR0aDN1eVQrK3FYMGlkNDI3ek4wRzYwckdtcTNmYXl2emVG?=
 =?utf-8?B?d3dnblI3eUpIcGtIdS9mUXVaQjAvUXRrUnd4VThGL21VTFFpMGdLYmlCU0RQ?=
 =?utf-8?B?Z3BseUFJalA1NzJRVjRQRFlYb2dDQkNnTFNEc3p1R2JQcnpqdUVjNU9pYzBr?=
 =?utf-8?B?Qjl0dXc1bEJibG5IVWVYd3EyVWx5UGtFd0J4dm9iZENoQ1BBbzZMMmVKUHJ2?=
 =?utf-8?B?WEhjREpOREdFUmE1T2NQdEJTK0g2OUF4ZFArR3g5d1RkT3pYZklBZFJwTHk2?=
 =?utf-8?Q?BcU4evQxCBQ7CFhRCtfQHKq0dHWzWIId?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3gzaDhLNVpSUFRSbHI4UVJXNnJicXRlOFA0OEFCUTlKN3Y4c2crdjgyT29Q?=
 =?utf-8?B?aHJXN0ZzUlBkd3BPaDRiSHdoK1pWYmxQUXBUbG16U2lPZURVUGdxb05ZMk9J?=
 =?utf-8?B?QkgvTWhiVm16NUo1QjNHVkV6OUFuUTRhK0VuSTJnemlDUWlDaDBObWNkTm5n?=
 =?utf-8?B?WjFBQUVOMHB0ZkN6a0lGNnFZNlNoR1RoTW1QcEM1dXI2bVN2QTZuL3U5cy9y?=
 =?utf-8?B?V0h3MTh3M2RRYmZmK3JSbFh4RFBmQXoxTjA2MGJ1YVhEMnFGNWh1ZHR6NWdY?=
 =?utf-8?B?eUd6VUtlclhZaVpwVUtBVGJIa0hFRjFkRTdheTZsVUl2Z3BEWGFtUXNOS2dm?=
 =?utf-8?B?RHVub0NZU25ubmcvdk1tUW14bUUzT0ZtUlY5OG9idWpEOFR2M0FVKzJpUHk3?=
 =?utf-8?B?eUJTcGlMWDZIVGRxYXFKMG9YUFZOT1lZWkY2TWFRNDJuQnRLYjh1MWhKZjVC?=
 =?utf-8?B?ZEgwMVZEbE5Vd3l5ejFGSFgybzJYQkhVbnltQTJUSzJXVmxRZ0dWcGVYZE0v?=
 =?utf-8?B?VUJZaDJpb1ZSOWZXRGJNbDRiTUFQeXpLQkVaQUZaMHFHZ1ZhOE0rZGdWK0JL?=
 =?utf-8?B?THRkcUkwd3IvKyt5bGIySzAvcnJjMmRZKzI4dW1GeC9tc3hnZWoybU9teVdH?=
 =?utf-8?B?K05pdGFES2piM04rc0RhQkNiZGN2MVR0S2RkbXJXOWh5U1hTSTlqWkdmRFFX?=
 =?utf-8?B?bHZQZTNieWcwNUFjWXE5c1JBY0xyMjhCcjhWMUhUTzlxT1RwOGJCS1BXTVc5?=
 =?utf-8?B?Z2VwcnVsU01yVDNXbUdxZzFJam5DTkg1bmsrVGRDYnVHc2o5N1o4eFQ3ekIr?=
 =?utf-8?B?OGRldlZFT3FGcWc1TklWdURFaXR4UWNhWG5hSnRmSm5sUjEwcStSY3hpSVdW?=
 =?utf-8?B?dUk4M2syZFFyK05MeW1VVHB4allsKzF5N0RnanF5MFNpa0cxbUp1cTVRc3Zh?=
 =?utf-8?B?ZVZKM1FPYUFHN09jVU91dzlmN1dHbFZzenpkWlh5cXpSd2FhcmRXRHRJNFhR?=
 =?utf-8?B?R1JGYjNzd2lJNUZVQ09zMWU0WFZZdlBCTkxibGR2SDdYaW81SFczWEZZdTl3?=
 =?utf-8?B?Vk10elJ3K3Jha1dXaE5ITk9OTGdIUno3STlTWGcyWWJkdmN4ZitUUklHNFAz?=
 =?utf-8?B?YStDMnR0MTQ0MHR1TzhzVkdPMFExNkZjZ245NEczL0VOQWlzaVdNaXI5aU9S?=
 =?utf-8?B?V0VsMWROV0ZhMktuR3ExTkpaV1VuSUZsb0lnMk9rRlZOQ09WQzVKckFJZjZw?=
 =?utf-8?B?Y0RFamhmMHJndVVGOXFVd2o4N1RwQVd0dnA5aVRFUWJtKzBuci92L2F5b2h3?=
 =?utf-8?B?SUxyRENuTUs4QS9KUkNtRmtqSUMrbkpBNEVWQ0ZIZXZPQkhnN29HNDJCWk0z?=
 =?utf-8?B?SkU0WStFOHFXeUtQVHliRVZoS0JPVVgybGhtemk1bTV6R3QwK2pSV2loaHNu?=
 =?utf-8?B?VW9GR1VFSjM3Y2ZRWUp1RVdDTUhGOC9FR1diSVcyL2k0OFcyVVdZYm9Rbzdy?=
 =?utf-8?B?UTgzZDIrKzNjNnpYT2NpT2dEM25sdytZWTdRNXJ6L2trYUw0RXFiUm9tWlVr?=
 =?utf-8?B?OHp5OGpZQlJxcWJydDcxMlhXZXZkWmtmWGxZY3F4RGduTXhuRWtMU1gzbnJF?=
 =?utf-8?B?Nmlld0MyYUhBdjhSditaTjJ6ZmRuL1Q3RlVBRjh0aXpHV3dWQm9OdElJNTk4?=
 =?utf-8?B?UXJ4T2VHZnpUL1NCbVpCZzlqRVpFemlvS3F3ckFLdDVuaUNGOTJJREZkSjlS?=
 =?utf-8?B?VG1QSW51dzRZV002SFp1N3VxM05HTExJMmdHcUdLVFBlRVZrY1JMQmRydExz?=
 =?utf-8?B?dGI0RUZISjFLNzJUVjVpZHYrZktaVXdhdmxVaFlHeVp6WEdHdW5CZkVmNWlG?=
 =?utf-8?B?VE5sRnd4VnRzMDVWWXhXWWxKQ1BDMnpKTFNvRjloN1dSQXpmVDFUNW16d1Jm?=
 =?utf-8?B?UkE4anFJakRtTjRqVEZCb092Z3ZrOGEwZnlabjZQejZEZFpydmRTNWpDdEU0?=
 =?utf-8?B?cERjSjA5SmJWMmMrUGUvQm9KM3FEd0pjN0xlTWxKMGJmWnJNT2hoR05zWFd0?=
 =?utf-8?B?UTJoOE52SExCYjlkK1lEenZLS1Z6THErU1BNTk5DMjY0R2crNmVvTi9adDR1?=
 =?utf-8?B?YnhyMDlvQVVoanBPdjg4eHpabTRzQTM5Y1pMWG9UWXdLSGg4VzZ0TDJoNllI?=
 =?utf-8?B?MVBPNXRpazFieTlzNm5jSzN0TW1lbHVFL0swNGlkdU02Wk9GOXBjTW1MSnV4?=
 =?utf-8?B?V0NlVEV2c2ZvRWtRODQvVzFvMCtxL2hqOFZwVW5FaWxibWI2VzJabUNGTjJL?=
 =?utf-8?B?a1lFU2MzNU13Yy9HNC82cTJyZ1hrVkIwSS9vekk1Umhsa0RMMDRwY0lNMzVv?=
 =?utf-8?Q?XBt+CU6yl7XcSLz0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd1a933e-26df-4264-e9c6-08de46cd41ca
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 11:27:32.0622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YpGOec401t3HxUHhg+SH3Bs+8lh+GWdfEWJhXpNuEZfUx4McNpnW/rGb40uZyocH5ler+2VfnhbcPDEhjfxezfu3GChiB0Aa+6dpKASi/sE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH7PR03MB7956

On 29/12/2025 11:10 am, Orzel, Michal wrote:
>
> On 29/12/2025 12:08, Orzel, Michal wrote:
>>
>> On 23/12/2025 18:01, Oleksii Kurochko wrote:
>>> When CONFIG_NEW_VGIC=y and CONFIG_ARM_64=y, the size of struct vcpu
>>> exceeds one page, which requires allocating two pages and led to the
>>> introduction of MAX_PAGES_PER_VCPU.
> Also, I think it would be better to drop MAX_PAGES_PER_VCPU in this patch.

Or at least shrink it to just 1, which would be minimal churn.

>
> ~Michal
>
>>> To remove the need for MAX_PAGES_PER_VCPU in a follow-up patch, the vgic
>>> member of NEW_VGIC's struct vgic_vcpu member private_irq is changed to a
>> s/vgic_vcpu/vgic_cpu/
>> s/private_irq/private_irqs/
>>
>>> pointer to struct vgic_irq.
>>> As a result, the size of struct vcpu for Arm64 is reduced to 2176 bytes,
>>> compared to 3840 bytes (without these changes and with CONFIG_ARM_64=y)
>>> and 4736 bytes (without these changes and with both CONFIG_ARM_64=y and
>>> CONFIG_NEW_VGIC=y).
>> You only touch new vGIC, so there should be no size reduction without it but the
>> paragraph reads as if the change affected both old and new vGIC. Also I would
>> mention that probably you provided the numbers based on a defconfig target.

I think that was stale from v1, where this patch was far larger and more
invasive.

~Andrew

