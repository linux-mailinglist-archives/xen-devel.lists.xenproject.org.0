Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D0FA712BE
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 09:36:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927282.1330038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txMEW-00023e-BF; Wed, 26 Mar 2025 08:35:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927282.1330038; Wed, 26 Mar 2025 08:35:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txMEW-00021G-8G; Wed, 26 Mar 2025 08:35:32 +0000
Received: by outflank-mailman (input) for mailman id 927282;
 Wed, 26 Mar 2025 08:35:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hi9g=WN=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1txMEV-00021A-1z
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 08:35:31 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20619.outbound.protection.outlook.com
 [2a01:111:f403:200a::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43fb583a-0a1d-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 09:35:27 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 SN7PR12MB7204.namprd12.prod.outlook.com (2603:10b6:806:2ab::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.42; Wed, 26 Mar 2025 08:35:23 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 08:35:22 +0000
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
X-Inumbo-ID: 43fb583a-0a1d-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8kQyj9LvmgXzvqcTV+U7lgWC0j4jBhFwc5Qxp01RJE1W/PCHCE1euIBjH2xtzV+Wy1mokTjR6pQEZc1l4+qvIkQBl8ZXfNRNhhlTfzOl/womxaB6pFvSLxmIuIcK9IsJ25V6hGK4/BjOrH/JZNFJVyQXyQ4BEbDKvuwRhy6Dd5RJXPcGfTEFowlbjLKejIPR2p7cchlEOPePcIreajQQh9pfLz4bQBU0iSc9mwzYdzRZZq/IBRoxmgvT0JMNrw22C5t/XrVDmQq18ShlnI/N1cBaGtZ3CIjzmo6dbfEXSMbk1ngiOTgwUMSaZkk1EO2pzbw4S4clbe046imnphnrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r7kdUMyMGkmNQx68SCoyQmxC+avRXFgBXHq1YormSNA=;
 b=hRhWsud0WBIwGHfYAECJ/hGpHG41jPkSmxninr6UmpzN+l6ifVl0aRKCOwJTrn12R5J2KRUr6tBKNqLSNqLiMdRznugMOU3Rw56s7Il6N6ARylqFlMcSsS+XHiX9yuXjUckuLLauxpyTWmL58KZHcDK+0KNvoUltyFcWjIuW4cfCmSW6Z4vhQ0SvxTbM1KZB4ZvyLCegTfZcEhdApKtmG93f131Ww2eAvZQf6NKiZ3G6SBF5IWI/lJH7C2uV7HsfpHgnLxkKOoXzZwgvF3gpEOMcQvJh0rP9vdrP5/wEq8uFuno7gs8tPtoi1h6uCZtf7SbnW08143gB9lVZqqIYeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r7kdUMyMGkmNQx68SCoyQmxC+avRXFgBXHq1YormSNA=;
 b=WrQkGzeIKInpUqRKJkzPN1XXI+oHibNEQhWWURzGwGjHxvzwfMnya4pT1OQl4dnTmpReng7erdQMoiEX8evTLCEk21fPkeUkTBiw9BIgxgaw7T84O2BYV4XucgzmFwAMe+HElp3nn8/xTJWgMXG6aBKiSbvyQojSYqInHpfhKMM=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 05/15] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline
Thread-Topic: [PATCH v3 05/15] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline
Thread-Index: AQHbjnNu8gKP+BdRfUqUIswSBCp7ILOChUeAgAKrd/A=
Date: Wed, 26 Mar 2025 08:35:22 +0000
Message-ID:
 <DM4PR12MB84519AF2B72DDDF50CA8BF18E1A62@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-6-Penny.Zheng@amd.com>
 <5498f98e-f3c5-4cb4-9a3d-793239a4339d@suse.com>
In-Reply-To: <5498f98e-f3c5-4cb4-9a3d-793239a4339d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=ad648b72-93ae-42b1-90de-791dcf865c1c;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-03-26T08:35:16Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|SN7PR12MB7204:EE_
x-ms-office365-filtering-correlation-id: 6bd9e954-fb53-406e-fd90-08dd6c412624
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?d1pHYWY3T2ZHb2d6Kzk4QTBFbTNQODNZaTM3b0piazU0ZUxPNWRPSWVTV205?=
 =?utf-8?B?Zm9EWFViRWlsZnJXOFpaUEozaTdpczVHTjFkTUFkWjViVTc4NmVOWlBJdmJH?=
 =?utf-8?B?bFF1aExOdXI2WmgwSlZoSlBsOEF4OWk2b2I5WWF0a2hXSWM4STNKK2dTK1Y4?=
 =?utf-8?B?RUdUZkVxYmlVUUthUi9JcytnSEVtZjdpMG4yYk1aTlJZVnRFd3Z6YXFvWnM3?=
 =?utf-8?B?TkZ0UkR5OGthNzRCeVlUWnJWck51cU45VC94M0Q0R2RTeVh3MSs3bVRUamxQ?=
 =?utf-8?B?aUhMR3ZiN2hHVHdObzE4ZngzU3VPZ0c1MTBISUt0WXRuOVhQSS8xdHFCYk1N?=
 =?utf-8?B?bi9obVhhU0UydjNSVEl6RjJUdkxDSFdjK20vbjZQY3hLZmtIOUlVNmJnY1o0?=
 =?utf-8?B?TkJvdys4cE9ZcDB0cFRYd3BDWUkra2FaUmE1Vk9hRWlsazBzZ1NGdE05c3FB?=
 =?utf-8?B?U3pjUWNUa2pwRmpkeVE1cjlTVkZIbm9LTTdiZGN3SGRsMTZqUTd4dnRDUy9K?=
 =?utf-8?B?SFBQYXFESTZqckRvdmNoMTEveUFVazhJemFUWHRHZFRTcG82Y0htdWdDbm82?=
 =?utf-8?B?aEUxNlE1M01DRCtKbFN6eGJ4K2txeE05S0l3Rm82YVNidlU3bjFPd1lwQVBl?=
 =?utf-8?B?WTN2TVhBeTI5NEFROHQ3UUdwM0dBR0pUTzdtbzlacDlkQXI5bmcwZUJucEdu?=
 =?utf-8?B?clp2U1FpSy9nVVlrYTI3VmNTc1hLZEZBZUlnbGwzSGFOVkhtK3pLUmpxNmRk?=
 =?utf-8?B?UVEvU3hxckpXTExRT25iQ0VZdnFONnBTdldnMnJ6UWllS2k4b2JjWnp6dHpv?=
 =?utf-8?B?cDR2NVJRUTNnT1VEZ242WTJnaS9qSGF1M2lUZitsQlJwK1VoQ3Job1lYeUs1?=
 =?utf-8?B?M3NmZ2NuSStpeVpMUFo4LzNBOHFhZGpFQTdzN0tvbDU5bEZhK0FEVGZBZ3E5?=
 =?utf-8?B?UGVTY3g3MTV6TnFBeWpLbkpxL0dYSlFuTFV3L1NXNnc1QndJUUpuTlVCcVhO?=
 =?utf-8?B?NnJsU2VLeTZoaTN6S3FWcVhadVJhTy8wVjZJWFNoQWtCRE5KTjBJRHh3dHQ3?=
 =?utf-8?B?Z0dLVzJ2cjZKbVFVdCtxcXZpSE0zRHUwTTN2eFovNllmYjFTbDVqcFIrWXZa?=
 =?utf-8?B?cCs0aXRsdFdDSm5OaXUzQ1F2T0hsOUN2YzFQVDc4NTZoMkhYMHBqSTJaVWJ1?=
 =?utf-8?B?NC9TQU9VaUNYR1hvV0hGRGd3aE5yNGpac3VpWWpqT2RaeVp5Vi9UOXNxMFRG?=
 =?utf-8?B?VkE0K1BUQmt6ZytHS3kyc1RMRGZ2V0NtVUdtSnRhK0FKY1pKK0FLRVVtbUcx?=
 =?utf-8?B?TnZ1NGRPTGkrWlFYZXc5QVRnWDZqOFJqUVhvVzVxUDY2S2NIM1dGSkYyU0Jt?=
 =?utf-8?B?Y0RDb1NjVDZTbkNxb0JWb3EzWnhmTHV1cmxCQlNjUFEzdkkzVGwzTXRlMXZJ?=
 =?utf-8?B?SHc2clRIckhyYUhETE1mSmNFa2dxRjNqQlFpbzh5S2g3TklWWDN3WWliZGwr?=
 =?utf-8?B?V29KTHUyb28xNzd4aWxGSWg3SmhrcDBCLzloYlZFY1ZpbS9qeUREYmZQSnZa?=
 =?utf-8?B?bzdHSUhhaDFtQzVlYXlDR0VhUENDd20yUUhuWUp0N3UxMnBaYmltUkFsTTVk?=
 =?utf-8?B?OU5hZVh4T1JNaFU0VHNjK1FBRHN2NmI5TjM4ZTYreG4xeHlYYkVqS242TDRK?=
 =?utf-8?B?Uit1aGdTTXFGaTdraThIUUpqSFR2c21SejdmaGY3UjlhdnExb0pwSUxxNFZJ?=
 =?utf-8?B?di9TV3FPUGdkWmtUVXNITUhLd1Rva2ZyWkxvekh6N2pIemhNeE9zY0wyc214?=
 =?utf-8?B?dXlkM0xoWnJrbjNRWE1qbloxTkRSL0JsSDV0SjdCNGdKcG9UM3VYWEM2NjBC?=
 =?utf-8?B?d1p6OEx0UHEwRm1KVFBZTGNsL09YcDZBVEJydVFMUDcrY1MrT2p0ekxrZU53?=
 =?utf-8?B?TWh2bENQT1QxVHRrSDBnQVQ4d3g5dzVmUE8zY0ZYaU5wZTgwWHRXc1pobkJK?=
 =?utf-8?B?aDF0R2E3MmJBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aGtVVWRrRjZPdjZXc1RyQXlNby9OYmpuOVVpVkhjSUF5UklKQWtISXpERWkx?=
 =?utf-8?B?WnltVURrcG1NZVZuaEZ0YmhveDdaMHBWU2dGTUUwZU90SDRxRVpqNFMwY2Fq?=
 =?utf-8?B?Skt2SG95Zlh0Zjl5aVhpQk1HWktPT2x0dGVmbEQ0S0l3T1lGcGRMOUR5RHA0?=
 =?utf-8?B?NTlFdFdQelZ3S3hDVGtjb1BkS3J5WmJDc2xOSHNMTVRxVzJoU1Z6bE04SHQz?=
 =?utf-8?B?MGIvbzJBZEF1dTljeHJsMDRna1pJcjBNUDVHYWJSNit2SWRta25VeENNNUpR?=
 =?utf-8?B?eUNMSmYrb09MUzY4aEdwY3FrWXQwZEJpQ2gyZ2NUN0o4UlVpakcrclRPUDlu?=
 =?utf-8?B?SG5ncDFSRy90OFRZZDRobXNvb1lSdGdHOTE0RFR5dlNMc1VkbFhBWXROQlZt?=
 =?utf-8?B?aE5NbkJiTmpyS0dYbEJMM21scWVYdUJXbGx6cHNkQUxhMDhReTVWTnlvSEo2?=
 =?utf-8?B?QlNmVEtGMTZxNEpnTkptK3MwT0J6ZFBGbHR3bVFON3pIbGEvSFgwUGFJWmNX?=
 =?utf-8?B?Rmt3K200VFNTUUI0aVZOWHhEZkd6bjR1ZEwzd0QvSCtkQUxFay9TZG80dWpU?=
 =?utf-8?B?Wm9qWDlyN0xYcXRZNTRKc3R5b2xnbkdXWXYxbmp3OWZCZEhLbE11NFc3Mld0?=
 =?utf-8?B?TEpORVVMNS9NVk41bENoSjNqVUtQcFVJUWxtaWhTTy90OHZwZmF1dVhuYWxL?=
 =?utf-8?B?RHpGWU9xQjNhSVROck1VVTcweXE3d3RVY1p5eXMyTStldHhLK1FwRTE5Z0Nx?=
 =?utf-8?B?QXdhaWQ4UG5LOXo4Zmd1YXFNUGJKdldTZHZpdk5JYXZUNHc5ZkRuQkRmYURI?=
 =?utf-8?B?dFdUeXlGOUt2SnJzelFoL3NadlU1SUc4M1loZXlzQ2wyeHY5VjlZd1BkMHdS?=
 =?utf-8?B?MjczY21mbzdWeDB3V2J1Nlc1OGFDcktzdXVaOFM1M2xYelJmRHdEQmFsZ2l4?=
 =?utf-8?B?TFZCSFpETTZoSXRVV05DYXF4ZU94TDYwQ2RmSHl6ZEJTZURFcCtGSkhiSCtU?=
 =?utf-8?B?T094aDRjajhjVmtGN1NFNGdVMlJ4a2Fta2EzcDNieEVMSG05aG9adzN4ZGg5?=
 =?utf-8?B?WUhWdm1pMExxSkRJbTJWWXBBRFJ3UjREbkZkcUp3cXkvVVBiTDdCSm1oWVMw?=
 =?utf-8?B?VWpGbUUrREdtcjF6WFhYUlNGeS9PbkxBZXc3d3A0UUFrazNCejdmSzQrZVUy?=
 =?utf-8?B?TS90eUVWRzdjcXJtY1lXbG9zQVlsODhGazBGTXc5cTJudzhFbS9qa2MwTXBo?=
 =?utf-8?B?ZHdXbitsU3k5VUZVYjkxV0hhekpKeTAxSGJvd3JiZzlvZzhsVzhqVmJYZ3Ar?=
 =?utf-8?B?TVZUaUgyL01qQTFmV3p6c0txUHEvVlp0M2ZzYXJvY0dVaFFlRUFzN0F6SE5C?=
 =?utf-8?B?WlBGYVN2QUZuWXEvR2JEc0tiRWRnbjFwVUs0cEUwU09ESzJKUkdHN1NDMzVC?=
 =?utf-8?B?aUNTbm5ybXVQN0JUSnVWd2N1YXZpc0NKVzZxTVZxTTdKMCtBYUVyR3BXNDg3?=
 =?utf-8?B?eTZnLzJxUi9QMTQ5TytDaWtGSUp6dDF4elNyNG0vdzcrQlpIRE9kdjlBc2hx?=
 =?utf-8?B?QXRqTm4wODYyekswUUlISGpMbk9RdW1lZlBGa2tmR3lhTUVXVDgvbUl6dEpx?=
 =?utf-8?B?ZExDTWV2RjR2cm9KOE5UdFZvVXdvTTJWMnEwdmlnNFBlSzJoMGRKUnhLOHRp?=
 =?utf-8?B?akZyak1RcWJHeDlHMFB3L1pOajl2NEtnYnpmSjlqS3dBMVdiWGxtZ2gwU3kv?=
 =?utf-8?B?eWpqNFFFT01MNm5jaSszNUpxdThQUS9BdEREbG9YQzB0c3doYTJtR0MreGsy?=
 =?utf-8?B?TUtHSmxQdlVkeGoxeFFqOW13bTRTV05GdW9CdytOOStiWWhBaCtxWDhUUWxi?=
 =?utf-8?B?eHRwTEVnQzRXNHRXK2VMenB5WlFzRGthMHFXVmN1RjdBOXlHU2E1SCt4Y2lN?=
 =?utf-8?B?eEhDVHpnSG1ZNDVhd085YkY1NXJQWWlPcHYyRUY0Vk5mRHQxS1RVT1RsYjRl?=
 =?utf-8?B?MnVScFlLQjRYZ1hTclpOTUo4TDRldnFES09oNTNQRHZvcEdvTXA4aWZmNEEx?=
 =?utf-8?B?dC8zb1ZiWEY1bFphTTBVNVBPYUJwMFRwL05kWStheFdSWTNxWjcrREtpR05X?=
 =?utf-8?Q?cBDk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bd9e954-fb53-406e-fd90-08dd6c412624
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2025 08:35:22.4593
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AoOdq1Sc3Z0s1KTzYjoBeG9QNSiBkLe5l3ACQ/ZPR03F0R2Uuk/Wa3NzS5tUrtcE+orUiuiKZR4D51vEDfdYeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7204

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBNb25kYXksIE1hcmNoIDI0
LCAyMDI1IDExOjI2IFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+
DQo+IENjOiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFuZHJldyBDb29wZXINCj4g
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJh
cmRAdmF0ZXMudGVjaD47DQo+IE9yemVsLCBNaWNoYWwgPE1pY2hhbC5PcnplbEBhbWQuY29tPjsg
SnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFJvZ2VyIFBhdQ0KPiBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPjsgeGVuLQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIHYzIDA1LzE1XSB4ZW4veDg2OiBpbnRyb2R1Y2UgImNwdWZyZXE9YW1kLWNwcGMiIHhl
bg0KPiBjbWRsaW5lDQo+DQo+IE9uIDA2LjAzLjIwMjUgMDk6MzksIFBlbm55IFpoZW5nIHdyb3Rl
Og0KPiA+IEBAIC01MTQsNSArNTE1LDE0IEBAIGFjcGlfY3B1ZnJlcV9kcml2ZXIgPSB7DQo+ID4N
Cj4gPiAgaW50IF9faW5pdCBhY3BpX2NwdWZyZXFfcmVnaXN0ZXIodm9pZCkgIHsNCj4gPiAtICAg
IHJldHVybiBjcHVmcmVxX3JlZ2lzdGVyX2RyaXZlcigmYWNwaV9jcHVmcmVxX2RyaXZlcik7DQo+
ID4gKyAgICBpbnQgcmV0Ow0KPiA+ICsNCj4gPiArICAgIHJldCA9IGNwdWZyZXFfcmVnaXN0ZXJf
ZHJpdmVyKCZhY3BpX2NwdWZyZXFfZHJpdmVyKTsNCj4gPiArICAgIGlmICggcmV0ICkNCj4gPiAr
ICAgICAgICByZXR1cm4gcmV0Ow0KPiA+ICsNCj4gPiArICAgIGlmICggSVNfRU5BQkxFRChDT05G
SUdfQU1EKSApDQo+ID4gKyAgICAgICAgeGVuX3Byb2Nlc3Nvcl9wbWJpdHMgJj0gflhFTl9QUk9D
RVNTT1JfUE1fQ1BQQzsNCj4NCj4gV2hhdCdzIHRoZSBwdXJwb3NlIG9mIHRoZSBpZigpIGhlcmU/
DQoNCkFmdGVyIGNwdWZyZXEgZHJpdmVyIHByb3Blcmx5IHJlZ2lzdGVyZWQsIEknZCBsaWtlIFhF
Tl9QUk9DRVNTT1JfUE1fUFggYW5kIFhFTl9QUk9DRVNTT1JfUE1fQ1BQQw0KYmVpbmcgZXhjbHVz
aXZlIHZhbHVlIHRvIHJlcHJlc2VudCB0aGUgYWN0dWFsIHVuZGVybHlpbmcgcmVnaXN0ZXJlZCBk
cml2ZXIuDQpBcyB1c2VycyBjb3VsZCBkZWZpbmUgc29tZXRoaW5nIGxpa2UgImNwdWZyZXE9YW1k
LWNwcGMseGVuIiwgd2hpY2ggaW1wbGllcyBib3RoIFhFTl9QUk9DRVNTT1JfUE1fUFggYW5kIFhF
Tl9QUk9DRVNTT1JfUE1fQ1BQQw0KZ290IHNldCBpbiBwYXJzaW5nIGxvZ2ljLiBXaXRoIGFtZC1j
cHBjIGZhaWxpbmcgdG8gcmVnaXN0ZXIsIHdlIGFyZSBmYWxsaW5nIGJhY2sgdG8gbGVnYWN5IG9u
ZXMuIFRoZW4gWEVOX1BST0NFU1NPUl9QTV9DUFBDIG5lZWRzIHRvIGNsZWFyLg0KDQo+DQo+ID4g
QEAgLTE1Nyw3ICsxNjEsMzUgQEAgc3RhdGljIGludCBfX2luaXQgY2ZfY2hlY2sNCj4gPiBjcHVm
cmVxX2RyaXZlcl9pbml0KHZvaWQpDQo+ID4NCj4gPiAgICAgICAgICBjYXNlIFg4Nl9WRU5ET1Jf
QU1EOg0KPiA+ICAgICAgICAgIGNhc2UgWDg2X1ZFTkRPUl9IWUdPTjoNCj4gPiAtICAgICAgICAg
ICAgcmV0ID0gSVNfRU5BQkxFRChDT05GSUdfQU1EKSA/IHBvd2Vybm93X3JlZ2lzdGVyX2RyaXZl
cigpIDogLQ0KPiBFTk9ERVY7DQo+ID4gKyAgICAgICAgICAgIGlmICggIUlTX0VOQUJMRUQoQ09O
RklHX0FNRCkgKQ0KPiA+ICsgICAgICAgICAgICB7DQo+ID4gKyAgICAgICAgICAgICAgICByZXQg
PSAtRU5PREVWOw0KPiA+ICsgICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4gKyAgICAgICAgICAg
IH0NCj4gPiArICAgICAgICAgICAgcmV0ID0gLUVOT0VOVDsNCj4gPiArDQo+ID4gKyAgICAgICAg
ICAgIGZvciAoIHVuc2lnbmVkIGludCBpID0gMDsgaSA8IGNwdWZyZXFfeGVuX2NudDsgaSsrICkN
Cj4gPiArICAgICAgICAgICAgew0KPiA+ICsgICAgICAgICAgICAgICAgc3dpdGNoICggY3B1ZnJl
cV94ZW5fb3B0c1tpXSApDQo+ID4gKyAgICAgICAgICAgICAgICB7DQo+ID4gKyAgICAgICAgICAg
ICAgICBjYXNlIENQVUZSRVFfeGVuOg0KPiA+ICsgICAgICAgICAgICAgICAgICAgIHJldCA9IHBv
d2Vybm93X3JlZ2lzdGVyX2RyaXZlcigpOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgIGJyZWFr
Ow0KPiA+ICsgICAgICAgICAgICAgICAgY2FzZSBDUFVGUkVRX2FtZF9jcHBjOg0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgIHJldCA9IGFtZF9jcHBjX3JlZ2lzdGVyX2RyaXZlcigpOw0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+ICsgICAgICAgICAgICAgICAgY2FzZSBDUFVG
UkVRX25vbmU6DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgcmV0ID0gMDsNCj4gPiArICAgICAg
ICAgICAgICAgICAgICBicmVhazsNCj4gPiArICAgICAgICAgICAgICAgIGRlZmF1bHQ6DQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19XQVJOSU5HDQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICJVbnN1cHBvcnRlZCBjcHVmcmVxIGRyaXZlciBmb3IgdmVuZG9y
DQo+ID4gKyBBTURcbiIpOw0KPg0KPiBXaGF0IGFib3V0IEh5Z29uPw0KPg0KPiA+IC0tLSBhL3hl
bi9pbmNsdWRlL2FjcGkvY3B1ZnJlcS9jcHVmcmVxLmgNCj4gPiArKysgYi94ZW4vaW5jbHVkZS9h
Y3BpL2NwdWZyZXEvY3B1ZnJlcS5oDQo+ID4gQEAgLTI4LDYgKzI4LDcgQEAgZW51bSBjcHVmcmVx
X3hlbl9vcHQgew0KPiA+ICAgICAgQ1BVRlJFUV9ub25lLA0KPiA+ICAgICAgQ1BVRlJFUV94ZW4s
DQo+ID4gICAgICBDUFVGUkVRX2h3cCwNCj4gPiArICAgIENQVUZSRVFfYW1kX2NwcGMsDQo+ID4g
IH07DQo+ID4gIGV4dGVybiBlbnVtIGNwdWZyZXFfeGVuX29wdCBjcHVmcmVxX3hlbl9vcHRzWzJd
Ow0KPg0KPiBJJ20gcHJldHR5IHN1cmUgSSBwb2ludGVkIG91dCBiZWZvcmUgdGhhdCB0aGlzIGFy
cmF5IG5lZWRzIHRvIGdyb3csIG5vdyB0aGF0IHlvdSBhZGQgYQ0KPiAzcmQga2luZCBvZiBoYW5k
bGluZy4NCj4NCg0KSG1tbSwgYnV0IHRoZSBDUFVGUkVRX2h3cCBhbmQgQ1BVRlJFUV9hbWRfY3Bw
YyBhcmUgaW5jb21wYXRpYmxlIG9wdGlvbnMuDQpJIHRob3VnaHQgY3B1ZnJlcV94ZW5fb3B0c1td
IHNoYWxsIHJlZmxlY3QgYXZhaWxhYmxlIGNob2ljZXMgb24gdGhlaXIgaGFyZHdhcmUuDQpFdmVu
IGlmIHVzZXJzIGRlZmluZSAiY3B1ZnJlcT1od3A7YW1kLWNwcGM7eGVuIiwgaW4gSW50ZWwgcGxh
dGZvcm0sIGNwdWZyZXFfeGVuX29wdHNbXSBzaGFsbA0KY29udGFpbiAgQ1BVRlJFUV9od3AgYW5k
IENQVUZSRVFfeGVuLCB3aGlsZSBpbiBhbWQgcGxhdGZvcm0sIGNwdWZyZXFfeGVuX29wdHNbXSBz
aGFsbA0KY29udGFpbiBDUFVGUkVRX2FtZF9jcHBjIGFuZCBDUFVGUkVRX3hlbg0KDQo+IEphbg0K

