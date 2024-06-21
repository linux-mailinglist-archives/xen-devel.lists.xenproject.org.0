Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBA6911E75
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 10:21:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745112.1152272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKZW1-0003W5-Ug; Fri, 21 Jun 2024 08:21:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745112.1152272; Fri, 21 Jun 2024 08:21:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKZW1-0003Uc-Rn; Fri, 21 Jun 2024 08:21:01 +0000
Received: by outflank-mailman (input) for mailman id 745112;
 Fri, 21 Jun 2024 08:21:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YYc3=NX=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sKZW0-0003UW-MB
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 08:21:00 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2417::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f81a30e-2fa7-11ef-b4bb-af5377834399;
 Fri, 21 Jun 2024 10:20:58 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by IA1PR12MB8080.namprd12.prod.outlook.com (2603:10b6:208:3fd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Fri, 21 Jun
 2024 08:20:55 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7698.020; Fri, 21 Jun 2024
 08:20:55 +0000
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
X-Inumbo-ID: 2f81a30e-2fa7-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kkfscPzWM9aqX/2PmRMwC6XI7Cr6xz79aEwZGsnkmC0sTVQ77LYbz5l8xe+OZilEqTZWAXUf6j/xMglHfXxu+LZ0CRwlOXrZYomUD8MIOIIU96na4h2s5qoLuDXPvoP9xXu7zTLwemx4k3a8eCIyAtpyNxGqtM/UtY+cuuItLyhDxr4wHKfMQvUAzhykaFERmfKBcu0vh8t28mDecr8mJ9vMN/3aDV3mIvtCJG2rujkyxYPdBfsMTlSJUrXilVUMD+1oTitE8irISJnCXE023ppxDzUYpNgT1pBrhioF54oReLA9/UC/Phqpv1A/tEqUoAtRj2hfOokdQPruAQWLLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tAiDK23Vbh7epmgmoeEaPSJV1lCroCVaYqf9+hyzIDE=;
 b=Jy944lNfA1SbMZSwRYX/FOqw3MSnLM7OOAcO4yEOP8eoiGcnvTSlRIuwa0x493jMS4ct5/28vcKI6etetCE0AKFYYx7SbxOSItoFs1WYPFgFjmEYuoqvaykcjISEdyEERk2h1MhS5+bOJSrvNbLM3uPoH7OmFNqLjnsTogALIstS9Mgogig+X8C4UF4x9MpOKRKMQe9+MXNgdQwPK/c4DhgMttns8FznoKe0t0YOoySy9e7BsEpMLZm+xiEZXxYleEiWlsb76OW3dzWHfOJo9KAxdDkPefpFN0fSP4yr5/HmbUJBh1vAq/6Qcg6FG8R4rn3RGR291qf/030UIjKb9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tAiDK23Vbh7epmgmoeEaPSJV1lCroCVaYqf9+hyzIDE=;
 b=Y9Xs8b+aWxC0psgE8RmMO9XPEeKVtdcq+iU5ZxGh0LoMUC5gtaAetOFuuVCY02BdNsp1qiJ0Og+vVw4ml8B7sColo5Ip0PUsJHypH8cEyNITr0fZK0UJvvbgbWUIBcVb8BIvQ0REcb2dhWTnfnlrlSCbyxJ8J+qQVzMLw4fPoxw=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Anthony PERARD <anthony@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
	Keir Fraser <keir@xensource.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
	<jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v10 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Topic: [XEN PATCH v10 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Index:
 AQHawJTqXyg3PMEiVUiLHPQ86aZkYrHMFeyAgAGdTwD//43bAIADi4UA//+vaICAAe+IgA==
Date: Fri, 21 Jun 2024 08:20:55 +0000
Message-ID:
 <BL1PR12MB58493B55E074243D356B0CAAE7C92@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240617090035.839640-1-Jiqian.Chen@amd.com>
 <20240617090035.839640-6-Jiqian.Chen@amd.com>
 <b4b6cbcd-dd71-44da-aea8-6a4a170d73d5@suse.com>
 <BL1PR12MB584916579E2C16C6C9F86D1FE7CE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <b6beb3f3-9c33-4d4c-a607-ca0eba76f049@suse.com>
 <BL1PR12MB58493479F9EF4E56E9CB814FE7C82@BL1PR12MB5849.namprd12.prod.outlook.com>
 <96ba4e66-5d33-4c39-b733-790e7996332f@suse.com>
In-Reply-To: <96ba4e66-5d33-4c39-b733-790e7996332f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7698.013)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|IA1PR12MB8080:EE_
x-ms-office365-filtering-correlation-id: 8be1abac-5b5c-4b7c-3ba5-08dc91cb124e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230037|1800799021|366013|376011|7416011|38070700015;
x-microsoft-antispam-message-info:
 =?utf-8?B?RHdEOVN0SGNZbGJIcUVuRTZBR0FxUllIL0VOU3h3Q0l5S0xxRWIwcGxYK1hL?=
 =?utf-8?B?eWxvWjFDOXhweTIzc1VKMGsxc3pOVUJDN1VTV3djOUZqcGdNYWhzd1pWeXFR?=
 =?utf-8?B?Uk41T2dqdHErcUMzM0tMdWJyTC9GeDREanU3cFUzN291Y1Azeng3OFJ0RFA4?=
 =?utf-8?B?bm1uK0dKU2lpRTdBZkVWNmE0aWRMWFlKb3hpK0dZblpoQ1Y0WjZjeVR5S2k2?=
 =?utf-8?B?RkNSQ2VEc1BnMzBhVDJyNHZyM2s4ZEtFaFlBT0lPUXVKRVFGc2FNcjJyY29h?=
 =?utf-8?B?bk1EODRpd0ZxWlUvbGpEelFqeTdmeVV2MlNLTyt1RjhsdWdzOVMxVkNpd3NU?=
 =?utf-8?B?M2lUYnZkSU1XLzlCYXpvWXNGNnZPZnc1S2tqQWNla1N5Ylh5d1dFMXNoVUpS?=
 =?utf-8?B?cUVhZUpucEVlQkpEQ0t4a3FsRldhNVc0K0p5cXVOVDR6UGYyWm9XUDFrZHFl?=
 =?utf-8?B?clR4dHNmM2szSTE4UFZMMUwySVd2b2Z6YXNMUVYxcmFGN2JyZ1NWeE9TZitZ?=
 =?utf-8?B?YWlKV1VFbDBYaFJtS1Z3bnZ4Uk9ESS80OVVHa1EvWk5FSHFKV0xVWGFXelVo?=
 =?utf-8?B?Q3ZWb1VVbVZUMk5BNkFiZlE4N1diTWYzY0ZPWWY3NHB5NVlGM0dSdldXM09l?=
 =?utf-8?B?ZGQzOGlSOTByc0hBaFdlZW5Obk1xZU1QeDIxMlloWWZCVS9UY2lmdFpzclAr?=
 =?utf-8?B?WjFnOVZXdGNoc3MxV2dNeGdmeVgrN2p1SW1ldVpPbWM4Vm4yNWdsRDQ2Sy9u?=
 =?utf-8?B?SXphZTlFa3hJOXhsOWl5QyswWW5HZXg5OVhPbnBZZEZvektKK1ZWb0JlQmZk?=
 =?utf-8?B?b0dpOVRGRWJRVkhiRHZhWEhkdERySU0yRG1GMjVaRnNiTWxUMVJEaUVhRFNX?=
 =?utf-8?B?eThiZW9jN0JOaFhaN0E2VDRhTlFJajJXYkNMa09NeWY0eGY1WFhxVmUzOTNu?=
 =?utf-8?B?SzdiZjhla3o4Z25YTUVMRElrUW9TV0hoSlJZOERubnZ1eENCR0V1MWNnbkM3?=
 =?utf-8?B?Zkl5SERiT3FwdndqTzFaeEdTMTdueS9yS0pNZVpKNW1zc0srUHRoWWhadUJR?=
 =?utf-8?B?V0U1S0JJM0NDQWRCTkRuNFpqcENDQUt0a3Q5NkdMM0FRRVpPYWtyNDhPaUF3?=
 =?utf-8?B?UXdhTnpZZlBHTFpHY0hGRGkxdzd3Z0JCakpUZmRBTG01RW5xSGs0dkpaakI3?=
 =?utf-8?B?a3dDUVFxT2FBZVVBZmh5emhDQVdpNnY2UWtDamExUHpOVkN4L283QTFGYmVV?=
 =?utf-8?B?RENmMXVJdTQxZ2RBUVhjQVJwQWREQXJGWWtDZ0t1cEMyam1YMlAyV0pCK2pJ?=
 =?utf-8?B?OTJrclNLSkt0dk9COVRTTWZRSGJ1dXk1Uy9aRWtSQ0tvV3llMU4xOFRGZmwr?=
 =?utf-8?B?Ymo3VnNVdEZiNUV2UENJUk56bWFMU2dSZDhXZnlmdXhHSkFtQTg3RnArWU05?=
 =?utf-8?B?RVY3bFpTQ3UwTE5wZGFLVjN6MXU3amMvd2wvUU00MnE5R3BTR1dyNEptWS9F?=
 =?utf-8?B?NFlmYXJmZU9DSHYxS09TRms4N2VOTTUxdE5lMkNwUUFxTHRzSFBVNkRBQzIr?=
 =?utf-8?B?aHNJdCtjaFlBTFo2ZW5OMldOMXYvdXBONGE3azNJOEU0dnZnZXB4cEY1RFpi?=
 =?utf-8?B?dU9wUjhQK1poclRMUWE5ZW5QTFBaS3pxMHR4ZzhlVDBkRzVVMUtmeWxld2dZ?=
 =?utf-8?B?ZEhnOU51N2ZRYnNaNlJ2cTdmTGhlVFdFRTNPV1U0a2IvSDJwQm9NZ0t0Qlhy?=
 =?utf-8?B?VmFnMmRTREhaV0dmbXBCRHhPSkVaME1uWUxmN1htS1IwVmRwRlE5b1lnSDNw?=
 =?utf-8?Q?mxf1Rpkx/mF2alTh1ruRFyLQy6D2y9eOmFx9k=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(376011)(7416011)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UmlJNW5BSFQySjY2clhzR2YyOGdBVXUvb1BXTlFCL0JuWG9LdXB5UGgrS0xx?=
 =?utf-8?B?YzFZRDk3QjlpNDAreVdNYnVDRHVNTkhOUHR1dEhNT0dXendyZ0VRZzk2VHJh?=
 =?utf-8?B?QUZFeUNRTkZkMkdkWW5ZZ0FqN2hjOEIyL2wxTUxwZGhiM0VsZXVuUlpYV25Z?=
 =?utf-8?B?akFqeER5RURaa09DK05KaHlNNnY2Z0dQS0lFcVAyRGtHTU9NVk5KeU5kWHFl?=
 =?utf-8?B?ZGFoOGliVGVYdm5OUE1hb2RBSnd1Q2w0K2dhalg1TW5PNkRHZE1ZTVBYalZ4?=
 =?utf-8?B?LzVWRkNNZjZMUW5xdnVncytySHRwTFpLd1dZY21JTnpObThUanh2dzJxbElw?=
 =?utf-8?B?TlRzUjJ5aG4vZWxTQWFsdFdCd2d5eEpvc2srT1ViRVE2dnFCa1VuYm5VZjN1?=
 =?utf-8?B?Q2d1SDRPcWF1c0w5aVlOd2llNU1hVks4VllWUmRnSEx5ZlJMT3dlUjBJaDRj?=
 =?utf-8?B?K1doNXpsdENMUmMycnpHUjQ3TGZ2ejU3akNLR3U0RC9iYTd5bWl6UDMrcXJF?=
 =?utf-8?B?VjZMZEZzTFJQMFZwc1ZEbCtHRG9BSVR0ak5LUVdsdjRGNlBnZ2hjZFhXMnJZ?=
 =?utf-8?B?M3BMaFltaW9yMlRBaXFCN3l5SzZzYjFnV0hrRC9QQ3Bnd2N5cHJhVXNtQzlV?=
 =?utf-8?B?R01icm1BUThwTGY3dmY5NlBwaVZXUFJIQ3FIQ1VhWjdGV3lKeUl4S0FRaE9v?=
 =?utf-8?B?dUlBUzFVVG02V2JnRXg0U1ZuTkp3UjFjN3A2U2pvWUJVanIvTGVwVzZRVGIw?=
 =?utf-8?B?Zm16c1laWmFrZXVIZlFVRjJ2bzAzbXdOL2NrWFVUbEJ3QzlNWE5UaGIxdEMv?=
 =?utf-8?B?TFZiV0tpdVgzNkhlWmtLTmhIZXdVV0NmUXZQWVBULzVWbGcvU2I1Z0ZCRTV1?=
 =?utf-8?B?aW8wUlQzenRLL1RNVnYyV21iaWViTG1ERzFRRm1yZ2dMOWNtQ00zMEVDZDBS?=
 =?utf-8?B?T0h0Z2JmUmJ3Z3RYblJERDQ0QmRIY0VQY0FMZWEyRm1RcEtTMkhpUlg5eUlH?=
 =?utf-8?B?djlyTlZRaGRwM3lHekxoMTJHZzZ3ZFFQeGM3WkJVTDRTSFRQbHlta2xON3pL?=
 =?utf-8?B?WkJPc0p6YWx1N0J3bi96NnBJNU9GakJaNVhQRTMwYUlCeUNlRytHYXVTVmF3?=
 =?utf-8?B?Y1BQeGNGV25DbU14L3ZiZmU3ZjJWaFhWZ3Z4WTJBUWh5YUpFTXhsRXpXS2JX?=
 =?utf-8?B?NkQ3Y1JwSno4YmNTd3Bpb2ZJSVhyZVFuTW0zaHJKMUMyZ1pOZ0tvdlI0cldD?=
 =?utf-8?B?TzQyc2k0VHVjc3B6bWRNOWtjNVlCaE50S2NWUkIwZ3pkRXc4Z2xvWDBNSkZX?=
 =?utf-8?B?M2pLQ2FFK0ZkNnJVeHZLa1dXZ0F0UUd2VjhxTXlRYW9TbUNkTDRMcHRQUC9t?=
 =?utf-8?B?aHIwQ0VCaXJWN2VJb0lNcEZyVnAreDZVRVV3enBsR0ljTzZZbk4rQlhQNmNr?=
 =?utf-8?B?bFFqQ2sxTENTdTZCNTQvNEdRd1ZlQTlkc3ZvTWRFcVFTekIyRlJwN3dSRGlM?=
 =?utf-8?B?eXJ5RlZEZWFHTW83N09RU2Q0Ym9mWEc5RkxFT0E3L2hUUUVyaGNVVTNpblBV?=
 =?utf-8?B?R1hmNm8yZ290M001OW9yL0hBNUVhQmdHWWtmZjJxMGh1Y3grclY5S2RqS0xR?=
 =?utf-8?B?QnNTQzB3UFdSTFVVWUVZNWNTYkQxNDZ6T1lHengrbCs1L2JHTm14Sk1LbWtV?=
 =?utf-8?B?Y0t6ZGt1V3FzRytYa05vMkp4TVY0UEdLa3NaUkZMSGtUNDMrcTZuM05lSHN3?=
 =?utf-8?B?U1FXM01FZXUzV2ZweU1mTDlRMHFENWtGQ3VTUjFkd1R1VVN6V3REOEowU1RR?=
 =?utf-8?B?WlljaEM2RHExSFpGZHFCb2JXc3lNbmFENFVtSTVYRWFPcndpRVJ3bC9QYXJW?=
 =?utf-8?B?M01TbFlzQWY3dkNFbDVnLzI1NXBLeldsR0lkSzZLM05XM2NBd09KZ2NvWmdQ?=
 =?utf-8?B?Snp2Wm5vWFV0czFQL2pjRVBSWjgvb2I5T0xtQjJsaHNQRzRCVmw4VXFFTTd3?=
 =?utf-8?B?V1dUbm0zUlY2NTNmN3RmNjRrN2pHTmhveWkremROVVhQckdxTVhJVk8vRlN3?=
 =?utf-8?B?VDJGRTBwZVZOUnZURGhtcms0MWVaTk1mT3B6bUQrVUFMbTdTend4bGpDWjJ6?=
 =?utf-8?Q?sniU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <301EC31FE2250247BF7BF4B5FF9B4F79@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8be1abac-5b5c-4b7c-3ba5-08dc91cb124e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2024 08:20:55.0994
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PzGHNurSAbLFr7H1/yv6xJYXLtSKz91sejlHOMT+lY7i9Q80U/KWoVyo7eTwetXIYU5ClGd3A3bBM0+QKmKM5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8080

T24gMjAyNC82LzIwIDE4OjQyLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjAuMDYuMjAyNCAx
MTo0MCwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNC82LzE4IDE3OjIzLCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAxOC4wNi4yMDI0IDEwOjIzLCBDaGVuLCBKaXFpYW4gd3JvdGU6
DQo+Pj4+IE9uIDIwMjQvNi8xNyAyMzozMiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAx
Ny4wNi4yMDI0IDExOjAwLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+Pj4+PiBAQCAtMTUxNiwxNCAr
MTUxOSwzOSBAQCBzdGF0aWMgdm9pZCBwY2lfYWRkX2RtX2RvbmUobGlieGxfX2VnYyAqZWdjLA0K
Pj4+Pj4+ICAgICAgICAgICAgICByYyA9IEVSUk9SX0ZBSUw7DQo+Pj4+Pj4gICAgICAgICAgICAg
IGdvdG8gb3V0Ow0KPj4+Pj4+ICAgICAgICAgIH0NCj4+Pj4+PiAtICAgICAgICByID0geGNfZG9t
YWluX2lycV9wZXJtaXNzaW9uKGN0eC0+eGNoLCBkb21pZCwgaXJxLCAxKTsNCj4+Pj4+PiArI2lm
ZGVmIENPTkZJR19YODYNCj4+Pj4+PiArICAgICAgICAvKiBJZiBkb20wIGRvZXNuJ3QgaGF2ZSBQ
SVJRcywgbmVlZCB0byB1c2UgeGNfZG9tYWluX2dzaV9wZXJtaXNzaW9uICovDQo+Pj4+Pj4gKyAg
ICAgICAgciA9IHhjX2RvbWFpbl9nZXRpbmZvX3NpbmdsZShjdHgtPnhjaCwgMCwgJmluZm8pOw0K
Pj4+Pj4NCj4+Pj4+IEhhcmQtY29kZWQgMCBpcyBpbXBvc2luZyBsaW1pdGF0aW9ucy4gSWRlYWxs
eSB5b3Ugd291bGQgdXNlIERPTUlEX1NFTEYsIGJ1dA0KPj4+Pj4gSSBkaWRuJ3QgY2hlY2sgaWYg
dGhhdCBjYW4gYmUgdXNlZCB3aXRoIHRoZSB1bmRlcmx5aW5nIGh5cGVyY2FsbChzKS4gT3RoZXJ3
aXNlDQo+PiBGcm9tIHRoZSBjb21taXQgMTBlZjdhOTFiNWE4Y2I4YzU4OTAzYzYwZTJkZDE2ZWQ0
OTBiM2JjZiwgRE9NSURfU0VMRiBpcyBub3QgYWxsb3dlZCBmb3IgWEVOX0RPTUNUTF9nZXRkb21h
aW5pbmZvLg0KPj4gQW5kIG5vdyBYRU5fRE9NQ1RMX2dldGRvbWFpbmluZm8gZ2V0cyBkb21haW4g
dGhyb3VnaCByY3VfbG9ja19kb21haW5fYnlfaWQuDQo+Pg0KPj4+Pj4geW91IHdhbnQgdG8gcGFz
cyB0aGUgYWN0dWFsIGRvbWlkIG9mIHRoZSBsb2NhbCBkb21haW4gaGVyZS4NCj4+IFdoYXQgaXMg
dGhlIGxvY2FsIGRvbWFpbiBoZXJlPw0KPiANCj4gVGhlIGRvbWFpbiB5b3VyIGNvZGUgaXMgcnVu
bmluZyBpbi4NCj4gDQo+PiBXaGF0IGlzIG1ldGhvZCBmb3IgbWUgdG8gZ2V0IGl0cyBkb21pZD8N
Cj4gDQo+IEkgaG9wZSB0aGVyZSdzIGFuIGF2YWlsYWJsZSBmdW5jdGlvbiBpbiBvbmUgb2YgdGhl
IGxpYnJhcmllcyB0byBkbyB0aGF0Lg0KSSBkaWRuJ3QgZmluZCByZWxhdGUgZnVuY3Rpb24uDQpI
aSBBbnRob255LCBkbyB5b3Uga25vdz8NCg0KPiBCdXQgSSB3b3VsZG4ndCBldmVuIGtub3cgd2hh
dCB0byBsb29rIGZvcjsgdGhhdCdzIGEgcXVlc3Rpb24gdG8gKHByaW1hcmlseSkNCj4gQW50aG9u
eSB0aGVuLCB3aG8gc2FkbHkgY29udGludWVzIHRvIGJlIG91ciBvbmx5IHRvb2wgc3RhY2sgbWFp
bnRhaW5lci4NCj4gDQo+IEFsdGVybmF0aXZlbHkgd2UgY291bGQgbWF5YmUgZW5hYmxlIFhFTl9E
T01DVExfZ2V0ZG9tYWluaW5mbyB0byBwZXJtaXQNCj4gRE9NSURfU0VMRi4NCkl0IGRpZG4ndCBw
ZXJtaXQgRE9NSURfU0VMRiBzaW5jZSBiZWxvdyBjb21taXQuIERvZXMgaXQgc3RpbGwgaGF2ZSB0
aGUgc2FtZSBwcm9ibGVtIGlmIHBlcm1pdCBET01JRF9TRUxGPw0KDQpjb21taXQgMTBlZjdhOTFi
NWE4Y2I4YzU4OTAzYzYwZTJkZDE2ZWQ0OTBiM2JjZg0KQXV0aG9yOiBrZnJhc2VyQGxvY2FsaG9z
dC5sb2NhbGRvbWFpbiA8a2ZyYXNlckBsb2NhbGhvc3QubG9jYWxkb21haW4+DQpEYXRlOiAgIFR1
ZSBBdWcgMTQgMDk6NTY6NDYgMjAwNyArMDEwMA0KDQogICAgeGVuOiBEbyBub3QgYWNjZXB0IERP
TUlEX1NFTEYgYXMgaW5wdXQgdG8gRE9NQ1RMX2dldGRvbWFpbmluZm8uDQogICAgVGhpcyB3YXMg
c2NyZXdpbmcgdXAgY2FsbGVycyB0aGF0IGxvb3Agb24gZ2V0ZG9tYWluaW5mbygpLCBpZiB0aGVy
ZQ0KICAgIHdhcyBhIGRvbWFpbiB3aXRoIGRvbWlkIERPTUlEX0ZJUlNUX1JFU0VSVkVELTEgKD09
IERPTUlEX1NFTEYtMSkuDQogICAgVGhleSB3b3VsZCBzZWUgRE9NSURfU0VMRi0xLCB0aGVuIGxv
b2sgdXAgRE9NSURfU0VMRiwgd2hpY2ggaGFzIGRvbWlkDQogICAgMCBvZiBjb3Vyc2UsIGFuZCB0
aGVuIHN0YXJ0IHRoZWlyIGRvbWFpbi1maW5kaW5nIGxvb3AgYWxsIG92ZXIgYWdhaW4hDQogICAg
Rm91bmQgYnkgS291eWEgU2hpbXVyYSA8a291eWFAanAuZnVqaXRzdS5jb20+LiBUaGFua3MhDQog
ICAgU2lnbmVkLW9mZi1ieTogS2VpciBGcmFzZXIgPGtlaXJAeGVuc291cmNlLmNvbT4NCg0KZGlm
ZiAtLWdpdCBhL3hlbi9jb21tb24vZG9tY3RsLmMgYi94ZW4vY29tbW9uL2RvbWN0bC5jDQppbmRl
eCAwOWExZTg0ZDk4ZTAuLjVkMjk2NjdiN2MzZCAxMDA2NDQNCi0tLSBhL3hlbi9jb21tb24vZG9t
Y3RsLmMNCisrKyBiL3hlbi9jb21tb24vZG9tY3RsLmMNCkBAIC00NjMsMTkgKzQ2MywxMyBAQCBs
b25nIGRvX2RvbWN0bChYRU5fR1VFU1RfSEFORExFKHhlbl9kb21jdGxfdCkgdV9kb21jdGwpDQog
ICAgIGNhc2UgWEVOX0RPTUNUTF9nZXRkb21haW5pbmZvOg0KICAgICB7DQogICAgICAgICBzdHJ1
Y3QgZG9tYWluICpkOw0KLSAgICAgICAgZG9taWRfdCBkb207DQotDQotICAgICAgICBkb20gPSBv
cC0+ZG9tYWluOw0KLSAgICAgICAgaWYgKCBkb20gPT0gRE9NSURfU0VMRiApDQotICAgICAgICAg
ICAgZG9tID0gY3VycmVudC0+ZG9tYWluLT5kb21haW5faWQ7DQorICAgICAgICBkb21pZF90IGRv
bSA9IG9wLT5kb21haW47DQoNCiAgICAgICAgIHJjdV9yZWFkX2xvY2soJmRvbWxpc3RfcmVhZF9s
b2NrKTsNCg0KICAgICAgICAgZm9yX2VhY2hfZG9tYWluICggZCApDQotICAgICAgICB7DQogICAg
ICAgICAgICAgaWYgKCBkLT5kb21haW5faWQgPj0gZG9tICkNCiAgICAgICAgICAgICAgICAgYnJl
YWs7DQotICAgICAgICB9DQoNCiAgICAgICAgIGlmICggZCA9PSBOVUxMICkNCiAgICAgICAgIHsN
Cg0KPiANCj4+Pj4gQnV0IHRoZSBhY3Rpb24gb2YgZ3JhbnRpbmcgcGVybWlzc2lvbiBpcyBmcm9t
IGRvbTAgdG8gZG9tVSwgd2hhdCBJIG5lZWQgdG8gZ2V0IGlzIHRoZSBpbmZvbWF0aW9uIG9mIGRv
bTAsDQo+Pj4+IFRoZSBhY3R1YWwgZG9taWQgaGVyZSBpcyBkb21VJ3MgaWQgSSB0aGluaywgaXQg
aXMgbm90IHVzZWZ1bC4NCj4+Pg0KPj4+IE5vdGUgaG93IEkgc2FpZCBET01JRF9TRUxGIGFuZCAi
bG9jYWwgZG9tYWluIi4gVGhlcmUncyBubyB0YWxrIG9mIHVzaW5nIHRoZQ0KPj4+IERvbVUncyBk
b21pZC4gQnV0IHdoYXQgeW91IGFwcGFyZW50bHkgbmVnbGVjdCBpcyB0aGUgZmFjdCB0aGF0IHRo
ZSBoYXJkd2FyZQ0KPj4+IGRvbWFpbiBpc24ndCBuZWNlc3NhcmlseSBEb20wIChzZWUgQ09ORklH
X0xBVEVfSFdET00gaW4gdGhlIGh5cGVydmlzb3IpLg0KPj4+IFdoaWxlIGJlbmlnbiBpbiBtb3N0
IGNhc2VzLCB0aGlzIGlzIHJlbGV2YW50IHdoZW4gaXQgY29tZXMgdG8gcmVmZXJlbmNpbmcNCj4+
PiB0aGUgaGFyZHdhcmUgZG9tYWluIGJ5IGRvbWlkLiBBbmQgaXQgaXMgdGhlIGhhcmR3YXJlIGRv
bWFpbiB3aGljaCBpcyBnb2luZw0KPj4+IHRvIGRyaXZlIHRoZSBkZXZpY2UgcmUtYXNzaWdubWVu
dCwgYXMgdGhhdCBkb21haW4gaXMgd2hvJ3MgaW4gcG9zc2Vzc2lvbiBvZg0KPj4+IGFsbCB0aGUg
ZGV2aWNlcyBub3QgeWV0IGFzc2lnbmVkIHRvIGFueSBEb21VLg0KPj4gT0ssIEkgbmVlZCB0byBn
ZXQgdGhlIGluZm9ybWF0aW9uIG9mIGhhcmR3YXJlIGRvbWFpbiBoZXJlPw0KPiANCj4gUmlnaHQs
IHdpdGggKGZvciB0aGlzIHB1cnBvc2UpICJoYXJkd2FyZSBkb21haW4iID09ICJsb2NhbCBkb21h
aW4iLg0KPiANCj4gSmFuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

