Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DE2A742EE
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 05:09:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930099.1332787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty10a-0006U8-NY; Fri, 28 Mar 2025 04:07:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930099.1332787; Fri, 28 Mar 2025 04:07:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty10a-0006R6-IU; Fri, 28 Mar 2025 04:07:52 +0000
Received: by outflank-mailman (input) for mailman id 930099;
 Fri, 28 Mar 2025 04:07:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jzi5=WP=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ty10Y-0006R0-W8
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 04:07:51 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20611.outbound.protection.outlook.com
 [2a01:111:f403:200a::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32a6b7e0-0b8a-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 05:07:44 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 BN5PR12MB9511.namprd12.prod.outlook.com (2603:10b6:408:2a9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 04:07:40 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.8534.045; Fri, 28 Mar 2025
 04:07:40 +0000
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
X-Inumbo-ID: 32a6b7e0-0b8a-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dn6c6DOCcdP2BcvrsjGPDqvdqYdB7eFbR0gjv5RP9+q0r6Bg8pjI9AIIeml/LUFtRO5ZqG778zAXL2G2E2QbUC89e7CJXuVSMKOeG1zvjqnCS+zRpcT6RPgw6SIzgJzDZjWq9Iqp8qWuHcaMbwIyIBMpoeSf0cwDrZcGI+K9u+eo/uE4WwSbSp3BM2Jb0lC6ElYblP+JV/x36almuDD7YnYMaFcA6f9Wnw57sL8aMq7aS3lUb4JZz5bcrNPWxd7D8fGgwZ3vVMd0rjLWav6gjlEcHHWnbGrbJV3nqT2TqkzuVYhaaJpP6AIzOL5ok2NRVVUHeVXTkDEl3q+8ImQTGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQSlC99XyvYFe23k9iMi3/zaIS67YlyF6ERlEJQsjI0=;
 b=Xv/O+MgO/ywSvtK2vJpcZD3bkRvBNMopFOeM3nce0yrsVi34ayYVax2buLbhJHYNK5ZEqvKCdDRCFTxAvlr2LbaAsILWXiuKWFNPHa9BlaNjym2eM+21V+6kKGA8dbiFfmwBmESKCOo4wPRdmdkyXrzcCB0D2Y2ZYkYtf5/NtUlM/GXLspvu10j1xvnU4NfvDQrqXnvyx8nwXMykWzpMY32I8DBWAmCXKcNfHdK2US6aT2K0ISEOcrANVQ09OnBvTCdh9oYAYooLpq3FAtEgPf8Vpwx66w0xs1cJOeHX6CQoO1NXMpGgL+j9+5BvnPEsxdwyV4phqMXj4x13ZzxORw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQSlC99XyvYFe23k9iMi3/zaIS67YlyF6ERlEJQsjI0=;
 b=gZgUndUkxqjD2oi0bjEBL1aN2LtLW7BDGLvrGlLC7CDjonsgCiwrDn3xpv03RyU15kEHuX5Gy1Jj3F2gnmqOi5M4vbU8Iwn909GkItiNY515kXxdbl0HEvRqjPYcln2RtRi8dawZxt5LAzH4/NY9BaQVgrOoUCx2rIClyI4GOZY=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 12/15] xen/x86: implement EPP support for the amd-cppc
 driver in active mode
Thread-Topic: [PATCH v3 12/15] xen/x86: implement EPP support for the amd-cppc
 driver in active mode
Thread-Index: AQHbjnN37UHiYLzXuU6NGNUDEkiF17ODyhuAgAMeFYA=
Date: Fri, 28 Mar 2025 04:07:39 +0000
Message-ID:
 <DM4PR12MB8451472692B00DAE0A909954E1A02@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-13-Penny.Zheng@amd.com>
 <6bcd0903-7406-4105-b471-85b5eb0bccc0@suse.com>
In-Reply-To: <6bcd0903-7406-4105-b471-85b5eb0bccc0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=78f8ddd7-f389-475c-9a8d-63322fe85ebb;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-03-28T04:07:32Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|BN5PR12MB9511:EE_
x-ms-office365-filtering-correlation-id: d91c3132-a8a9-4e41-c331-08dd6dae14f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bWdGTy9ydmIxS1l6MFAxL1VzamJ5bHUra2IwS3FENmtRTDdaTlVTcms4UER5?=
 =?utf-8?B?TzBpMnhWMEFZZXJsMjkwVXhhcXoxQjU1amlMR2NMdll4V21pZVZEeTNlZXdi?=
 =?utf-8?B?b2FIS1hDZzRMRFNBUVoxRVRmamFVVTNIUk9kY2k2d0xNcXpRdFM4eW5jTDNZ?=
 =?utf-8?B?NUNpMUtXazdRNEFCWFl4WXdtRFhjeE5hUWIwK0Z5TEdiZkVoVmsxdmtYVXNV?=
 =?utf-8?B?cWNSNldJQ2ZLWnREV09MNFZpQzViTDNCNzRiMG1PUk9KblNNSVdpV0pCaUht?=
 =?utf-8?B?YWtXOFF4UHJMYVgxN0V1Y3ZDR0g2Qjk5K0tQYlM3a2pzWXdtaXR1V0dZOUsz?=
 =?utf-8?B?bC81M0tuMXhxaGxMdWwyQy9VQVpxTlhKTitBUFZWU0NpOU1xRE1SZDFVdVUw?=
 =?utf-8?B?c0poUHhQRE1Sb0I5NmZKZVVIR0I1UGZaVTAvZUtHeWZmUWk2OEtLSVBTTG0w?=
 =?utf-8?B?dUVUUnB0RnFQdURWVHIvMWxpWVhPVzJXdjRSZjg0YmQrRm4xM3FrYkhwQzdZ?=
 =?utf-8?B?bFFMQ3lqdmZCZ1JjdWxRQnNUc1ZwZWp0WTJOckcyVnNLVmJwTGZYQ1BVQXll?=
 =?utf-8?B?UTFtbVdXdk9vUnJ1RzlqRlR2OG9SSTYwVXdJdktveTJUSlZPR0x5TmxoUDhj?=
 =?utf-8?B?YXFmd3J5NWhsSGFCT0dRcXR5cFhrWThLb1pNYUw3Sy9KS1V1WW9yUzR1Qk5R?=
 =?utf-8?B?VkVEYmc0elpLc1g4UDRGcmx5L3NhRlZNSzFXUXdwYTN3NVRndEhnQXluTi9I?=
 =?utf-8?B?eWcwMzJrM1BnTkVjK25iWjY4SnY5RkluL1IyMVBSTzJ3RUlGdEEzd3hQd3E4?=
 =?utf-8?B?dDV6VmNkWUIwSWZqakNwZTc4eHVqYUhwcFIxeGxUb09LcVk2V1M1NGxST0JS?=
 =?utf-8?B?RG1QNm5DMDltRXZPcVNuKzNPaTlPUkRPeU1tbm5pT05XUlJ0emdFSWozMEFs?=
 =?utf-8?B?RTFqRjVvdklpSnEyWEdRQ0ZZWTFmcWtocEZVdmJsakdvcHhZWDdhS1R1b1VM?=
 =?utf-8?B?UnNMMThaS2o0VkFYR242b1lWbXRaN2FRRTl1RkwxZlhxbUFQcG12RmhKZExD?=
 =?utf-8?B?YXZXWWhkM2xoN2FPOXBJS1prNkM3QmlWRC9XZWNLK2UwbE1odk9JM2dPRlFX?=
 =?utf-8?B?NkdTT1luSG1oUnZySkFjNVJDM05VZEtFQmNnTFUxNlprR0tnVVVGck1CVXNG?=
 =?utf-8?B?ZTBLdlpiYk5ONTdGeXZGY1lBZVRoSzNCUm1Ob1FoZlBYQW0zRE5LTTRQODRM?=
 =?utf-8?B?MkFXdmxjT1MrR3ZFbVNOY2QvdUpBSVN2OG1oMklRREFjN3puT0RndC9BclJz?=
 =?utf-8?B?MjZvT1UyUWpSRWsrb1JLbVk0YnJvR3d2SU52R2grQ1BVbkE2MmRKQlFlM2Nz?=
 =?utf-8?B?d3RrUUo4eWxUVjhWMTI0ZEtjbnpvRXpHbmFBaTNkZkVyUjAyNWM3N1ZQVzk2?=
 =?utf-8?B?TVlTMDFscVpsdUJoaWFyOUhPSlVKaEtzbDlLTWh0Z216d1VnOWE2U0NSaGtv?=
 =?utf-8?B?SmxlamdVVjh5dXRleGJScXhXRWpTdHBEVzdlWG81N1pMajJZQUUyc1FjcXd2?=
 =?utf-8?B?YjFGYTdsSzl4RUQ1VmU2OE9GNXlHRWd5cFpnUVRHTTlrNXRoVG82T1IyS1FD?=
 =?utf-8?B?NDQxWCtnRVdIYlk4YVh1cEVjbE9BYmdzQlBReldXWWZMRE1uQTd4VmNoa0dH?=
 =?utf-8?B?YjAweXdXcEY2UldmaUZXbkZXaVlFZ3h5T3kyeXRCVHlLakt2S3MrUmJkcGpM?=
 =?utf-8?B?eGxYTG91WXBxN1ZlZklxaFpweis4UzloNFJ6cU5oNyt0MUg1SG5yRjl0UTBj?=
 =?utf-8?B?a3VZYjUxZTYwLzQ2NFROZFZCZTRZL2RraW1jeWhCVmwyRnZqT0xwMWc5WWRq?=
 =?utf-8?B?Y2RtSitTcFloU252OXUvdEhqblFEOS9kNnNpQlU2eHRHRTFmQWhSMkF3ZW5h?=
 =?utf-8?Q?H9DuqNgEQmPjd909J6VCDQaYU2Wwmx8X?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WEx0VitacEpvWGN2dVRnWE11YjkyV3diNWxiWXpjVVhYcERNMmx3OXZLeEpJ?=
 =?utf-8?B?dHhsNEpoZlg1WmdVMkdkV2tjdGJCbmlyQ1lLcS9rL3ZYc0dnaEc1d3Y4Z0cw?=
 =?utf-8?B?bVFnSkc3WmdOcjRqZ3l5bVc5c0hHd1NYSndrbk93bmhDVVVTYitSUkVjR1Za?=
 =?utf-8?B?eTV1RWtpbkdITDNtcjRpbTdOdXUxUDYrK2pxNFZnTG5nWnZoS0hVWnpWQ1Fy?=
 =?utf-8?B?VmxrcERnN3FDWnBJcURwTnBFVXQrOFg3OVpNUjJTNEZObEN5T29KelBLY3RK?=
 =?utf-8?B?WHZPbGFZKzhFRVFYSklSa2VqcFU3Y1lVUTRIVEV2dk45bktkcmJMN01KMDF2?=
 =?utf-8?B?V05DdkpQZDBtRXFWSWxDTnhGTU4yOGxhbnJRVHNCbDdpd0YwbWlYR3FOTXQr?=
 =?utf-8?B?aWI4M1dGRVF4em4yZ0dsMTZMUWJTbVJiNERXajFmak9XTlUyckpGbGcraGNp?=
 =?utf-8?B?d2hRbEgydUtUaElhOHlxbjAySW1kdDBLdjJmczEySVpidnV5Z3AxU05hcGtx?=
 =?utf-8?B?Q2k1Q1hSMW1qNXBWN3J6WTI3d1gvQThIR1pzcGJ4bnZuV0VsM2MrRERhSkVx?=
 =?utf-8?B?UFJnOElDWk5zTXRheTNxWm1DcHNqc2pKWWJabEZQMnQ0WGhSR1pwZ2phUmtP?=
 =?utf-8?B?Yk1NRjJ4TFA5TVRyc05YRzNEcFI3Y01YeWI0U2ZoMU1sa1JOZXlCbjBNRVla?=
 =?utf-8?B?aWdERHVIMm1xTG5PV09JUmFNMmg5WE80eGdreTc4ei83UjVPWmtGYXlEOE9x?=
 =?utf-8?B?aEV4aHNET1Q1Z2xGYndwOWZ5a2t3SU1sUXJQRklMcXFkTzFsNU1SZlhxb0oy?=
 =?utf-8?B?eWQwS0srZEkyVDdldzZBTWR5SjNPSjFDTWl6UHFwWGFHQW5aUkpvN2VNb3NR?=
 =?utf-8?B?RWxtSFVudXRmZlBoOEVyNXMxWlVLenBRMTYzczl5RDh6Ny9UVzZ1UkxWRnhX?=
 =?utf-8?B?ODhudHlwTDQ5dGVGK21aWTFJSDhja29WSHhEamNMUXZ3SzZ4QlBVOWJTaG1j?=
 =?utf-8?B?eFhpaXVVeEFZdFBRbVVBcjBEazNYd1p3dm5jRXVEVGh5UnNiaVBZV2dmSFhi?=
 =?utf-8?B?bXBvTFlTdThlY1hDb0w3SVc0LytIN1BTWVdoN25ZZGtqb1hlYTZFZGxxaGVs?=
 =?utf-8?B?WHlPOG9Id2VzU2M4TytvaVNTd3FhR2lMZm1uaWNWS2FFK1hPQmw4YWtaemxj?=
 =?utf-8?B?bkd3R1AwSUJVM3ZPdnQzQml6Tk5LbTAzem80aXhWTUVIaVV1SWJuQXAwOEVm?=
 =?utf-8?B?cDIyZnNmQkllS2hLUmlNZkRiU3N3RmxOYXdvaXhpSXBtMFJObEg5bXQ3amtx?=
 =?utf-8?B?eHI1YjJoMWpFa2J3VDJ5SzlSaW1yY1ZMM1paOGprekkwaThEMkxGdlMraVlL?=
 =?utf-8?B?R2J1d3JINVFZMEZJMFg4ZmdTMW9XZmVVRXBCcWVCVS81ejFoNXNqMlBrMXpq?=
 =?utf-8?B?Z1FzNzZ2OTFxekFqQUFTTTk5ckJQWHRiZVl6Z0lLUFVsQzVPWGJ3ZFlKYjVK?=
 =?utf-8?B?bkVoSy9ENFovanZxa3JXY1JyZ3NxQXd4VlFOY003ZC9PUGVudHhXZGE4aG1w?=
 =?utf-8?B?ZHlKN0h6RXBPUHN2SnVScFJnUmJIUllJZlUwNXhDVzkxNkRRbmZOWXlraEk3?=
 =?utf-8?B?VitFNXRWQmFKUmJocXZiUGdyZWtxdHpMRlpPS1R3bkdVVnJOL3JrOFFoVFVD?=
 =?utf-8?B?V1Qxb2xlVUdtNWRVY1Q2dFFqLzhiam1ObjJFUzd5Si9LdThJSTErRGlTOHRl?=
 =?utf-8?B?dnNGbnZXU256QjhOdFpEWG5sNHQxOThwRCtDZWFqUFBMTWtXNmlCZ2g3SzRX?=
 =?utf-8?B?WnZTSHZ3L3UwaER0Zm1naGtjL1c0eHlVY2lKc0hHNVFubGpNU3dJdWV2SDF6?=
 =?utf-8?B?YzVWc28yVGxlb05LT0Z1UXVpOW10eXVHYkJ6cVM0a25adm9TVkdCZTVaTDJz?=
 =?utf-8?B?amwzbmZQSnMyMnY5akl0WXRFdU94ZjRJQkQxa1FSaHRQMmRUUnpkUEZYbmFm?=
 =?utf-8?B?SHRzNGxZZ2lNTDFiVk9naUxLYXlHSlZDdzh4Sk5TQk5WWFhnRGxiMlpOSE9m?=
 =?utf-8?B?SUROQXNsZU1zbVRZY3pvQ0ovOUd3RHd0bjFXaSt1cjVDbUsrY1lsSEpYSUdr?=
 =?utf-8?Q?t7xc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d91c3132-a8a9-4e41-c331-08dd6dae14f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 04:07:39.9679
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sborr5pePhxpW/3eMF+Oy8jekcd6yfmq0aTq8tszarljqh96Uvzzig3sEvygeyjK08rOyd4xJFvl/OB1mE8QJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9511

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBNYXJjaCAy
NSwgMjAyNSA2OjQ5IFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+
DQo+IENjOiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFuZHJldyBDb29wZXINCj4g
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJh
cmRAdmF0ZXMudGVjaD47DQo+IE9yemVsLCBNaWNoYWwgPE1pY2hhbC5PcnplbEBhbWQuY29tPjsg
SnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFJvZ2VyDQo+IFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPjsNCj4geGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjMgMTIvMTVdIHhlbi94ODY6IGltcGxlbWVudCBFUFAgc3VwcG9ydCBmb3IgdGhlIGFt
ZC1jcHBjDQo+IGRyaXZlciBpbiBhY3RpdmUgbW9kZQ0KPg0KPiBPbiAwNi4wMy4yMDI1IDA5OjM5
LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiBhbWQtY3BwYyBoYXMgMiBvcGVyYXRpb24gbW9kZXM6
IGF1dG9ub21vdXMgKGFjdGl2ZSkgbW9kZSwNCj4gPiBub24tYXV0b25vbW91cyAocGFzc2l2ZSkg
bW9kZS4NCj4gPiBJbiBhY3RpdmUgbW9kZSwgcGxhdGZvcm0gaWdub3JlcyB0aGUgcmVxdWVzdGQg
ZG9uZSBpbiB0aGUgRGVzaXJlZA0KPiA+IFBlcmZvcm1hbmNlIFRhcmdldCByZWdpc3RlciBhbmQg
dGFrZXMgaW50byBhY2NvdW50IG9ubHkgdGhlIHZhbHVlcyBzZXQNCj4gPiB0byB0aGUgbWluaW11
bSwgbWF4aW11bSBhbmQgZW5lcmd5IHBlcmZvcm1hbmNlIHByZWZlcmVuY2UoRVBQKQ0KPiA+IHJl
Z2lzdGVycy4NCj4gPiBUaGUgRVBQIGlzIHVzZWQgaW4gdGhlIENDTEsgRFBNIGNvbnRyb2xsZXIg
dG8gZHJpdmUgdGhlIGZyZXF1ZW5jeSB0aGF0DQo+ID4gYSBjb3JlIGlzIGdvaW5nIHRvIG9wZXJh
dGUgZHVyaW5nIHNob3J0IHBlcmlvZHMgb2YgYWN0aXZpdHkuDQo+ID4gVGhlIFNPQyBFUFAgdGFy
Z2V0cyBhcmUgY29uZmlndXJlZCBvbiBhIHNjYWxlIGZyb20gMCB0byAyNTUgd2hlcmUgMA0KPiA+
IHJlcHJlc2VudHMgbWF4aW11bSBwZXJmb3JtYW5jZSBhbmQgMjU1IHJlcHJlc2VudHMgbWF4aW11
bSBlZmZpY2llbmN5Lg0KPg0KPiBTbyB0aGlzIGlzIHRoZSBvdGhlciB3YXkgYXJvdW5kIGZyb20g
InBlcmYiIHZhbHVlcywgd2hlcmUgYWl1aSAweGZmIGlzICJoaWdoZXN0Ij8NCj4NCg0KWWVzLCBp
dCBpcyBub3QgdGhlIHBlcmYgdmFsdWUuIEl0IGlzIGFuIGFyYml0cmFyeSB2YWx1ZSBvbiBhIHNj
YWxlIGZyb20gMCB0byAyNTUNCg0KPiA+IEBAIC0yNjEsNyArMjc2LDIwIEBAIHN0YXRpYyBpbnQg
Y2ZfY2hlY2sgYW1kX2NwcGNfY3B1ZnJlcV90YXJnZXQoc3RydWN0DQo+IGNwdWZyZXFfcG9saWN5
ICpwb2xpY3ksDQo+ID4gICAgICAgICAgcmV0dXJuIHJlczsNCj4gPg0KPiA+ICAgICAgcmV0dXJu
IGFtZF9jcHBjX3dyaXRlX3JlcXVlc3QocG9saWN5LT5jcHUsIGRhdGEtDQo+ID5jYXBzLmxvd2Vz
dF9ub25saW5lYXJfcGVyZiwNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGRlc19wZXJmLCBkYXRhLT5jYXBzLmhpZ2hlc3RfcGVyZik7DQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBkZXNfcGVyZiwgZGF0YS0+Y2Fwcy5oaWdoZXN0X3BlcmYsDQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBQcmUtZGVmaW5lZCBCSU9T
IHZhbHVlIGZvciBwYXNzaXZlIG1vZGUgKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHBlcl9jcHUoZXBwX2luaXQsIHBvbGljeS0+Y3B1KSk7IH0NCj4gPiArDQo+ID4g
K3N0YXRpYyBpbnQgcmVhZF9lcHBfaW5pdCh2b2lkKQ0KPiA+ICt7DQo+ID4gKyAgICB1aW50NjRf
dCB2YWw7DQo+ID4gKw0KPiA+ICsgICAgaWYgKCByZG1zcl9zYWZlKE1TUl9BTURfQ1BQQ19SRVEs
IHZhbCkgKQ0KPiA+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPg0KPiBJJ20gdW5jb252aW5j
ZWQgb2YgdXNpbmcgcmRtc3Jfc2FmZSgpIGV2ZXJ5d2hlcmUgKGkuZS4gdGhpcyBhbHNvIGdvZXMg
Zm9yIGVhcmxpZXINCj4gcGF0Y2hlcykuIFVubGVzcyB5b3UgY2FuIGdpdmUgYSBoYWxmd2F5IHJl
YXNvbmFibGUgc2NlbmFyaW8gdW5kZXIgd2hpY2ggYnkgdGhlDQo+IHRpbWUgd2UgZ2V0IGhlcmUg
dGhlcmUncyBzdGlsbCBhIGNoYW5jZSB0aGF0IHRoZSBNU1IgaXNuJ3QgaW1wbGVtZW50ZWQgaW4g
dGhlIG5leHQNCj4gbG93ZXIgbGF5ZXIgKGhhcmR3YXJlIG9yIGFub3RoZXIgaHlwZXJ2aXNvciwg
anVzdCB0byBleHBsYWluIHdoYXQncyBtZWFudCwgd2l0aG91dA0KPiBtZSBhc3N1bWluZyB0aGF0
IHRoZSBkcml2ZXIgc2hvdWxkIGNvbWUgaW50byBwbGF5IGluIHRoZSBmaXJzdCBwbGFjZSB3aGVu
IHdlIHJ1bg0KPiB2aXJ0dWFsaXplZCBvdXJzZWx2ZXMpLg0KPg0KDQpDb3JyZWN0IG1lIGlmIEkg
dW5kZXJzdGFuZCB3cm9uZ2x5LCB3ZSBhcmUgY29uY2VybmluZyB0aGF0IHRoZSBkcml2ZXIgbWF5
IG5vdCBhbHdheXMNCmhhdmUgdGhlIHByaXZpbGVnZSB0byBkaXJlY3RseSBhY2Nlc3MgdGhlIE1T
UiBpbiBhbGwgc2NlbmFyaW9zLCBzbyByZG1zcl9zYWZlIHdpdGggZXhjZXB0aW9uDQpoYW5kbGlu
ZyBpc24ndCBhbHdheXMgc3VpdGFibGUuIFRoZW4gbWF5YmUgSSBzaGFsbCBzd2l0Y2ggdGhlbSBh
bGwgaW50byByZG1zcmwoKSA/DQoNCj4gRnVydGhlcm1vcmUgeW91IGNhbGwgdGhpcyBmdW5jdGlv
biB1bmNvbmRpdGlvbmFsbHksIGkuZS4gaWYgdGhlcmUgd2FzIGEgY2hhbmNlIGZvciB0aGUNCj4g
TVNSIHJlYWQgdG8gZmFpbCwgQ1BVIGluaXQgd291bGQgbmVlZGxlc3NseSBmYWlsIHdoZW4gaW4g
cGFzc2l2ZSBtb2RlLg0KPg0KDQpUaGUgcmVhc29uIHdoeSBJIGFsc28gcnVuIHJlYWRfZXBwX2lu
aXQoKSBmb3IgcGFzc2l2ZSBtb2RlIGlzIHRvIGF2b2lkIHNldHRpbmcgZXBwIHdpdGggemVybyB2
YWx1ZQ0KZm9yIE1TUl9BTURfQ1BQQ19SRVEgaW4gcGFzc2l2ZSBtb2RlLiBJIHdhbnQgdG8gZ2l2
ZSBpdCBwcmUtZGVmaW5lZCBCSU9TIHZhbHVlIGluIHBhc3NpdmUgbW9kZS4NCklmIHdlIHdyYXAg
cmVhZF9lcHBfaW5pdCgpIHdpdGggYWN0aXZlIG1vZGUgY2hlY2ssIG1heWJlIHdlIHNoYWxsIGFk
ZCBleHRyYSByZWFkIGJlZm9yZSBzZXR0aW5nIHJlcXVlc3QgcmVnaXN0ZXIgTVNSX0FNRF9DUFBD
X1JFUSwNCmludHJvZHVjaW5nIE1TUl9BTURfQ1BQQ19FUFBfTUFTSyB0byByZXNlcnZlIG9yaWdp
bmFsIHZhbHVlIGZvciBlcHAgaW4gcGFzc2l2ZSBtb2RlLCBvciBhbnkgYmV0dGVyIHN1Z2dlc3Rp
b24/DQoNCj4gPiArICAgIHsNCj4gPiArICAgICAgICAvKiBGb3JjZSB0aGUgZXBwIHZhbHVlIHRv
IGJlIHplcm8gZm9yIHBlcmZvcm1hbmNlIHBvbGljeSAqLw0KPiA+ICsgICAgICAgIGVwcCA9IENQ
UENfRU5FUkdZX1BFUkZfTUFYX1BFUkZPUk1BTkNFOw0KPiA+ICsgICAgICAgIG1pbl9wZXJmID0g
bWF4X3BlcmY7DQo+ID4gKyAgICB9DQo+ID4gKyAgICBlbHNlIGlmICggcG9saWN5LT5wb2xpY3kg
PT0gQ1BVRlJFUV9QT0xJQ1lfUE9XRVJTQVZFICkNCj4gPiArICAgICAgICAvKiBGb3JjZSB0aGUg
ZXBwIHZhbHVlIHRvIGJlIDB4ZmYgZm9yIHBvd2Vyc2F2ZSBwb2xpY3kgKi8NCj4gPiArICAgICAg
ICAvKg0KPiA+ICsgICAgICAgICAqIElmIHNldCBtYXhfcGVyZiA9IG1pbl9wZXJmID0gbG93ZXN0
X3BlcmYsIHdlIGFyZSBwdXR0aW5nDQo+ID4gKyAgICAgICAgICogY3B1IGNvcmVzIGluIGlkbGUu
DQo+ID4gKyAgICAgICAgICovDQo+DQo+IE5pdDogU3VjaCB0d28gc3VjY2Vzc2l2ZSBjb21tZW50
cyB3YW50IGNvbWJpbmluZy4gKFNhbWUgbmVhciB0aGUgdG9wIG9mIHRoZQ0KPiBmdW5jdGlvbiwg
YXMgSSBub3RpY2Ugb25seSBub3cuKQ0KPg0KPiBGdXJ0aGVybW9yZSBJJ20gaW4gdHJvdWJsZSB3
aXRoIGludGVycHJldGluZyB0aGlzIGNvbW1lbnQ6IFRvIG1lICJsb3dlc3QiDQo+IGRvZXNuJ3Qg
bWVhbiAiZG9pbmcgbm90aGluZyIgYnV0ICJkb2luZyB0aGluZ3MgYXMgZWZmaWNpZW50bHkgaW4g
dGVybXMgb2YgcG93ZXIgdXNlDQo+IGFzIHBvc3NpYmxlIi4gSU9XIHRoYXQncyBub3QgaWRsZS4g
WWV0IHRoZSBjb21tZW50IHJlYWRzIGFzIGlmIGl0IHdhcyBtZWFudCB0byBiZSBhbg0KPiBleHBs
YW5hdGlvbiBvZiB3aHkgd2UgY2FuJ3Qgc2V0IG1heF9wZXJmIGZyb20gbWluX3BlcmYgaGVyZS4g
VGhhdCBpcywgbm90IG1hdHRlcg0KPiB3aGF0J3MgbWVhbnQgdG8gYmUgc2FpZCwgSSB0aGluayB0
aGlzIG5lZWRzIHJlLSB3b3JkaW5nIChhbmQgcG9zc2libHkgdXNpbmcNCj4gc3VianVuY3RpdmUg
bW9vZCkuDQo+DQoNCkhvdyBhYm91dDoNClRoZSBsb3dlc3Qgbm9uLWxpbmVhciBwZXJmIGlzIGVx
dWl2YWxlbnQgYXMgUDIgZnJlcXVlbmN5LiBSZWR1Y2luZyBwZXJmb3JtYW5jZSBiZWxvdyB0aGlz
DQpwb2ludCBkb2VzIG5vdCBsZWFkIHRvIHRvdGFsIGVuZXJneSBzYXZpbmdzIGZvciBhIGdpdmVu
IGNvbXB1dGF0aW9uIChhbHRob3VnaCBpdCByZWR1Y2VzIG1vbWVudGFyeSBwb3dlcikuDQpTbyB3
ZSBhcmUgbm90IHN1Z2dlc3RpbmcgdG8gc2V0IG1heF9wZXJmIHNtYWxsZXIgdGhhbiBsb3dlc3Qg
bm9uLWxpbmVhciBwZXJmLCBvciBldmVuIHRoZSBsb3dlc3QgcGVyZi4NCg0KPiBKYW4NCg==

