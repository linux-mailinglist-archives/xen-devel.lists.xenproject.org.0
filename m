Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB25B25EE4
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 10:33:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081080.1441208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umTOG-0000ic-8Q; Thu, 14 Aug 2025 08:32:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081080.1441208; Thu, 14 Aug 2025 08:32:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umTOG-0000g8-55; Thu, 14 Aug 2025 08:32:52 +0000
Received: by outflank-mailman (input) for mailman id 1081080;
 Thu, 14 Aug 2025 08:32:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ppuf=22=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1umTOE-0000g2-Jk
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 08:32:50 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2417::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41aff753-78e9-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 10:32:48 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 IA1PR12MB6603.namprd12.prod.outlook.com (2603:10b6:208:3a1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Thu, 14 Aug
 2025 08:32:44 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%7]) with mapi id 15.20.9031.012; Thu, 14 Aug 2025
 08:32:44 +0000
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
X-Inumbo-ID: 41aff753-78e9-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZytBgcuexLNpnmdPse0JZelFZMr7NYOMnjYG1hfdlHnbUOtmJeXHzdT75F8iIc9B/vIboz0w5r2rycqLQNAUXJ2gxMXrLJVBchepN9yvyA4CC5O0l8akTRwg+eyyDmQJkhqszwxrtfQgEAWEdY9zWRllv3X9rPAbufIgwpw80ZY/o4ixOgBXkBCVt9PmgCag0eIu4rfwsoGaMol8+e2xRScMYeM6lBK8Tum1ptVxE1WydSO2JSksMPqs8VcvYqW9SEbGoJL6/gvFGQML0oA/H0qoM27ouKmhttS4lOToi59sSBVpJKl8a7qik0IsfftlnF6BLkUq03EMhRAsBMCNNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVn2cPQ3my/j5GmrZmYpz7wU+rbeI3mUiYx6S0ybkxc=;
 b=wjKLvKMd8IYgkwyce2VXqkfIyx42Fz630p5y4yqMYCdRTAPklXgtxfVQDb1zyYfJHGdrXc2QVwUzw2KSvEIMaHsSnuo8BCqKoOHBUhLk8tblgRy1LI/Q92BdmJx2RbhR6OU1fGX5cHJIVTI8brMxj6kw478yWsl+08cSqCJrxew20i2KKM+DXMdhcKpiTVX/SOoqF9yMN7vCy8mP5dS2tWwGv5KHgloY8YVGvKBvbTYoUexc4lU5fneL3WOWUtIr29n8eK7JJscc2w3JVx93uLzft/WWhAaYoKa4+zq1kgKkXVV0IOQFFj4km1EvLTv2KU+k2WSF4jxVyX0x/K7G3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVn2cPQ3my/j5GmrZmYpz7wU+rbeI3mUiYx6S0ybkxc=;
 b=bVSE7CK0TFER/62YbVzxjcxBtj72RaAVHIG3Js5RI3o5WbhwWoM2tqdM+evSJLrIWRJOIpPwIqdCmzOi8BotMM4DSaR8jgeiatInZ/wsxGWsmyj2weHOoBeSaIRplEPMIa6mQXE1SCPwB+OqS40ExKEI6Km2Ob7dU2GeopGLJAk=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v6 19/19] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
Thread-Topic: [PATCH v6 19/19] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
Thread-Index:
 AQHb8hcuzjUv9QY8PkCazI2v8DQHmbRBbryAgCA3tFCAAEHpAIAADdDQgAAQ4wCAAABlEA==
Date: Thu, 14 Aug 2025 08:32:44 +0000
Message-ID:
 <DM4PR12MB8451303D484F1B5BE57A7192E135A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-20-Penny.Zheng@amd.com>
 <796a9251-8b4f-4266-a31e-828d4da29f54@suse.com>
 <DM4PR12MB845131A7E81BD54B0334E3B2E135A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <98aa5a7b-5268-41ae-a1d5-25028b0704b6@suse.com>
 <DM4PR12MB8451D475AED43F9884C83D53E135A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <99b499fb-cd3b-4afb-85c5-be00be722409@suse.com>
In-Reply-To: <99b499fb-cd3b-4afb-85c5-be00be722409@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-08-14T08:31:28.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|IA1PR12MB6603:EE_
x-ms-office365-filtering-correlation-id: 8c5fcac3-24f4-4d31-91cf-08dddb0d2400
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?anIvZ2ZJaEhNWkdUb3ZKZTV0S0xuMUc0T3NmQ0FJT1cvQS9JTFRNeGNJSE1R?=
 =?utf-8?B?ZGJWeVA1N2VnNU5Uc044Q2YvUGVrRTJvTUNJZmw4eEFJRVh2NFpPUWtqSFJZ?=
 =?utf-8?B?dDFrSUJhbG96aHZNdktqMHRFM2RqbHE1WEJJM2dHcFpzeU5taldkNEEycUE2?=
 =?utf-8?B?Y1hmbHYzbFNZTU9FR3RIcU9WMUd1dmFjcStnV3QxNFZkMG5tckdLUWhQOHB4?=
 =?utf-8?B?eWdYdEsxdjk4UU96aHFZbXpDakt0aEhOaEF5c3Vab2ExQVVRWmJHNWxOZk0w?=
 =?utf-8?B?QUtpMVJjeUlPdTBJZzIydlBQUjEvVWRITWgrNHpMUzIwVVA5TUp0NUtOOERo?=
 =?utf-8?B?V0pQb0JqNWIvaEo5dUNkL21Wd0hoM2ViYUVIUXlzOTllV3JBb0tZdjJnMmo4?=
 =?utf-8?B?QUw1azJUa252TzdZNVorVzNQbEpYczBqS1NnQ29MaERmbElvUFBZcEsrYTZG?=
 =?utf-8?B?NDd2eFBxRmp2eGMyNXUrT1c3Wm1US25LdmJRZ2J0ZXZRSDhFNE9ZbUpkQ1FD?=
 =?utf-8?B?S3RKMnVxOW1ZR0x4SGhiMFNacktHdjgzejczaTQxbDRONG1kZEZUNDIxSW9Q?=
 =?utf-8?B?VG5Nb1A1eTBpdDZMV3JVR29aRUdOTjRDaTc2S2RVVjFabVBBWEQ5UENOU2Jn?=
 =?utf-8?B?dXYvamVBRGd1Z1JnWkJlMkxIWE1qK0c1cHFtMGNpMHRlYlpiUzNuT2syWmRM?=
 =?utf-8?B?czA0c0pzKzJDcmlVVThpUFBmcnRuV2taN283RDRqYWptcEhJbEUrQW5uQWZR?=
 =?utf-8?B?Tm5uSUlEY29DNUhqM3pNSGVUaEptWWxodGRHeTEwNmh5ZEFWTGlXNGgyMDJ3?=
 =?utf-8?B?OVF2dk1EUUZzNXpkQkd1VGtNbjNtcXZJY3Q5SGNncVlmckE3anQwbG83VHRX?=
 =?utf-8?B?dVVVTVNJMmM2M0JiWDgzYnVmUDVyY2tESFUrWVJZL3VibFFScVNLMzE2d09x?=
 =?utf-8?B?M3dNV2ZCaXdsTXVjZkU0RGtUZktiVFdseHdRUm8zam9wVDZHWVJyVHM3WkJj?=
 =?utf-8?B?RFcyajhCUUxaUzZsTlkyeDA4QmdLWDZveUt6ODRrNTNRK05paTlOZk5nQThl?=
 =?utf-8?B?cWkzSjV5OVFWcXUzZjVXSjJ1aFY3S3lUa2R3dEZWckVHUmxzZXZlTU5HREdV?=
 =?utf-8?B?d21pVzJIVlBjNkM2RDVBUnhJMzQwMEZvYitXbUcvbzNXdlpMTkhTYmt0QVFV?=
 =?utf-8?B?bU1hWFBpWVB4MGRWOXAweUhoblM3cEhTalF4YUpMck04Wk94V1NaYU5UVE8v?=
 =?utf-8?B?cFNETll2dTZObUxaZVZQSS9OQml0MkgvRGs0djExY0lEaDBDK25lVWc3Wlh5?=
 =?utf-8?B?aVFHMEtYN3FacXBrQjdma3U2V0lrZkErNXdLcEhQK3p5QXQ1RlRVNHZMeGd5?=
 =?utf-8?B?K3ZoZWZmSXdXK2FUK0lwVGNRQ04zcVVpNXBwR2VrVnpmZ2phb3BQTkl4eTZD?=
 =?utf-8?B?aW9ERkUrek1wNFdKcjdTaE0vRlgrUDdXVUVidzVKdlJlMUI0VlZvZXJNWWEx?=
 =?utf-8?B?UmxmcWFPcXlHUDN1VUtkZ3lkQWRVbGRHR1VhemtOa2hnalV0dkpqS0tCMFAx?=
 =?utf-8?B?bmROMzk5TjFRaEtzSU1SOW1VczlZN29hZy9vOFNxNkZuTm83RlF4RngrcHQy?=
 =?utf-8?B?YW9pNStzdEhBNm9uS0RNalgxeHU0RjVWSWVwbTh1R1BNd2ZaVlhIYWFmdHpP?=
 =?utf-8?B?N2psL0sxaEJkRjYwNjNWOUtFQUJTdEhBa21zbmpwekZYU0h6T2RsOHFDOHVG?=
 =?utf-8?B?ZTFMQ1lYSzRlRFVETlcrbGpIR1BlZUtodTkwc2NOUlVjUmgveXhwL2I0cXRN?=
 =?utf-8?B?NC9za1ZwSVlwd0swZmNOcGx2Q1dteldCTXRnZDBLK00vSGlSUjRGenJLeU5k?=
 =?utf-8?B?SGkzandVWkNvUlNabmlqazhkK0pFZitlSS9WS29GQUI2blp3cERnUlQ1ZUN6?=
 =?utf-8?B?RjREbTI4ZUtCeWIvVWhIYyt3WXBBSDhWV1c1VWpORW5iaEQyWWVRSzlOQnpX?=
 =?utf-8?Q?5TGqSOGpM+yXUj5AM48OqZ+2k5uY/I=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MWxpQ0NrYnh4cHhaclV5MUQ4MkdUd2I2ZFpXRTU1QWphN2xGcHpwTWdJMThJ?=
 =?utf-8?B?Rm1LUkRpQWpWK0J6bHBJTzFRUXU0SzFwQjhSM293aG1LSDBDZk5sd0dDWUVH?=
 =?utf-8?B?ZEU2a1JpTm1BWkE5TlNSTXBaTlJDQjM4VndFbU80U2VrcXFoOTFucGkyOWlY?=
 =?utf-8?B?MDJNZDJHWEg2Z3pwekh0UmI5cXdHTVJOVHFEVEp5eDJPVGIvRDFuaURaRnZt?=
 =?utf-8?B?TnpFemlTT3FVeHovbHdOcHNWNmErREVZTGNzSEkvVE8vNDBIWDgrZUw5V3B4?=
 =?utf-8?B?Q1Fobmg5eVdQWGJOeW5paWpLeDE5MDR0U0NjK3ViRktpWXd4RGp0SW9ZQnJV?=
 =?utf-8?B?MFpSZzlMNUxsbENGc2k5T0xTUG5Td2FvMkQxdzhBMzM4cW9MYjkvY1ZMdkVl?=
 =?utf-8?B?eWc3NHRJMGs4Z0htUWMyQzV3bGlmZHJtVlVkREpRSzBxY3BrWituS2pzWEJM?=
 =?utf-8?B?Z3Awb09kbjBFNlVxemxVVStNVXp2bzJLM2FwY0ZaRWdqTVd1ZEtkT01wOG5L?=
 =?utf-8?B?Rk1qak1MbTZiTWJ4SEVSeE1OZFhCbk80emlFZFFSRnA2dEd2c2wwODNMeEdE?=
 =?utf-8?B?cTFXU1QxUG1MSXpWU2lRaGVMOVFzUnNrWWI1ZVBPZHArN1dXRXl6UFN1QVpT?=
 =?utf-8?B?TkRWYjhzU1lmSTZYTFVFajg2VEY4b3I4cXRtSkxmSmhDOWUybVBLTXRTVHVk?=
 =?utf-8?B?U3JlajlCWWorVXZmUDg1WXQ2VFdPb2JsRVR2OUFBenhQZkN6ZnBIb2tqZzl3?=
 =?utf-8?B?alRrVTh0WVlRaW8yZVNXbVlzWGtFN2dLaXNzdldBazNKQ3p5SGtKMU1CVVgz?=
 =?utf-8?B?YkR6VFduMlQ3VlBqeGR4dGxRUGVzTFNpY2h2TW5ESVRLQTVseXl6Qm45RE5I?=
 =?utf-8?B?UWVNN1pPOEMvem9UUHpDZWRWbnYwTnZac2UyNUhuTWdMckZ2V1JvY25Xby8v?=
 =?utf-8?B?bWJrSmpiT0ZLb0I0QW9LQkVxN1lZK3NWK09VUExWSlBuYmN6c0FjL3k3SHN5?=
 =?utf-8?B?UTdmaUxaeXY0N2RTd1Vmd3V0Q1NoTkpzVlVzd0x0NkVJeG10THIzUmI3K2pi?=
 =?utf-8?B?MzFmLzRLY2x5RExZa0tVWWpWd3FIREVIZkx5S2xVeS9XbG8xdXVBR0E3STRk?=
 =?utf-8?B?WkxlU0xmY045ZDFEWFJrTWNWMGFLUVJaa3NPSElJakxFMjhaa1RoNnlSbzl6?=
 =?utf-8?B?VE4wamN4blJQZW52aTFxZGRhQnMyMHZXZzNzdHZha3F4dnZBNWtUY0pVRUhI?=
 =?utf-8?B?R2hLQkxFc2Y5Y2FrMXZUSVNKQ3h4a3NGYjdSbFAyTXJKanJVcWkxUnZ3TEFE?=
 =?utf-8?B?dTlrdTRQSitLS3F2SmljRmpjL3ExL3Ayc2VtNUFxeE5VbCs0UjVHSVlkYnJL?=
 =?utf-8?B?Q0YyN0FTeTduVmthRWx6bm4rYTlDS1gvdmFQdkNVb2xtcElzWHk4d2hjOTJS?=
 =?utf-8?B?dy9TNmxqQzVaekh2alI5dkVZUTNzNmJPOXRHaW5YWWVmSVlKNWd3OFRkYkJn?=
 =?utf-8?B?YnVvMTFEVW42TGk3bU9nY2lTQllTcDgza095c2d0R1BISkRGaVpCQmtUenZX?=
 =?utf-8?B?STd5SEh5RlAzclBJaG9zOXlCSnU5STFaYkVOYW1ra0syNCtwM0lKVExXQUIx?=
 =?utf-8?B?ekQwY3Rmc2dlVHNiVWJyT0RYRXF5WFpQTEp0dWs0UUg2L2sxN21XWVBqRUhO?=
 =?utf-8?B?ZldFcFlkTk1Qb1UwZjdFek4xUjhEWkc3Q3VyYmU2YmhvOE1QNEI1S0w2Qll5?=
 =?utf-8?B?RFZuc1lpdTNKNE9UNjhlQW9SSXVtTTJNR2pyVGNWTTlzRjk4TnJ2MFpXZXox?=
 =?utf-8?B?Mkw3L1pBYmpiOWhOZkFRaC8xUkJHaGFyZEZUN0E4MkRSbFdkSUVVSDE2U0Y1?=
 =?utf-8?B?bTdoRkh5NTJrb0Q4WUhrMGVHRVd5WFlQaE05azNNa3Rid3R2aGNxTEVpZGdW?=
 =?utf-8?B?cDUwQ05RclZFeVlZYi92d0VlNzVjcFpGamJrV2xkR3poU0p5eUMvMjBUbllH?=
 =?utf-8?B?QjkzTVJwR0J4aUozMCtwVE4xUEh0N2pWVmtOa05lSGdLMEYvZXU2LzVzR09q?=
 =?utf-8?B?S0lxMGlkY3J6UmRNRDE3T1dFbzRWRENUZThLZitLTERsU3l3czFrRklXQjJw?=
 =?utf-8?Q?IjlY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c5fcac3-24f4-4d31-91cf-08dddb0d2400
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2025 08:32:44.1104
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eO0U4+LPD87efgxtp0gopVJn29nz7/nb/dHDN3I27SHshqUBf2W751W5wVK6GAM1QgVrz0L4kxbC2s+cEwaKzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6603

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBBdWd1c3QgMTQsIDIw
MjUgNDozMCBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiBD
YzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBBbnRob255IFBFUkFSRA0KPiA8YW50
aG9ueS5wZXJhcmRAdmF0ZXMudGVjaD47IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+Ow0KPiBPcnplbCwgTWljaGFsIDxNaWNoYWwuT3J6ZWxAYW1kLmNvbT47IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBSb2dlciBQYXUNCj4gTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47
IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2NiAxOS8xOV0geGVuL2NwdWZyZXE6IEFkYXB0IFNFVC9HRVRfQ1BVRlJFUV9DUFBDDQo+IHhl
bl9zeXNjdGxfcG1fb3AgZm9yIGFtZC1jcHBjIGRyaXZlcg0KPg0KPiBPbiAxNC4wOC4yMDI1IDA5
OjM0LCBQZW5ueSwgWmhlbmcgd3JvdGU6DQo+ID4gW1B1YmxpY10NCj4gPg0KPiA+PiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+DQo+ID4+IFNlbnQ6IFRodXJzZGF5LCBBdWd1c3QgMTQsIDIwMjUgMjo0MCBQTQ0KPiA+
PiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiA+PiBDYzogSHVhbmcs
IFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBBbnRob255IFBFUkFSRA0KPiA+PiA8YW50aG9ueS5w
ZXJhcmRAdmF0ZXMudGVjaD47IEFuZHJldyBDb29wZXINCj4gPj4gPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+OyBPcnplbCwgTWljaGFsIDxNaWNoYWwuT3J6ZWxAYW1kLmNvbT47DQo+ID4+IEp1
bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBSb2dlciBQYXUgTW9ubsOpDQo+ID4+IDxyb2dl
ci5wYXVAY2l0cml4LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz47DQo+ID4+IHhlbi0gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gPj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2NiAxOS8xOV0geGVuL2NwdWZyZXE6IEFkYXB0DQo+IFNFVC9HRVRfQ1BV
RlJFUV9DUFBDDQo+ID4+IHhlbl9zeXNjdGxfcG1fb3AgZm9yIGFtZC1jcHBjIGRyaXZlcg0KPiA+
Pg0KPiA+PiBPbiAxNC4wOC4yMDI1IDA1OjEzLCBQZW5ueSwgWmhlbmcgd3JvdGU6DQo+ID4+PiBb
UHVibGljXQ0KPiA+Pj4NCj4gPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+
IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPj4+PiBTZW50OiBUaHVy
c2RheSwgSnVseSAyNCwgMjAyNSAxMDo0NCBQTQ0KPiA+Pj4+IFRvOiBQZW5ueSwgWmhlbmcgPHBl
bm55LnpoZW5nQGFtZC5jb20+DQo+ID4+Pj4gQ2M6IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQu
Y29tPjsgQW50aG9ueSBQRVJBUkQNCj4gPj4+PiA8YW50aG9ueS5wZXJhcmRAdmF0ZXMudGVjaD47
IEFuZHJldyBDb29wZXINCj4gPj4+PiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IE9yemVs
LCBNaWNoYWwgPE1pY2hhbC5PcnplbEBhbWQuY29tPjsNCj4gPj4+PiBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPjsgUm9nZXIgUGF1IE1vbm7DqQ0KPiA+Pj4+IDxyb2dlci5wYXVAY2l0cml4
LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA+Pj4+IDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
PjsNCj4gPj4+PiB4ZW4tIGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+ID4+Pj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2NiAxOS8xOV0geGVuL2NwdWZyZXE6IEFkYXB0DQo+ID4+IFNFVC9HRVRf
Q1BVRlJFUV9DUFBDDQo+ID4+Pj4geGVuX3N5c2N0bF9wbV9vcCBmb3IgYW1kLWNwcGMgZHJpdmVy
DQo+ID4+Pj4NCj4gPj4+PiBPbiAxMS4wNy4yMDI1IDA1OjUxLCBQZW5ueSBaaGVuZyB3cm90ZToN
Cj4gPj4+Pj4gSW50cm9kdWNlIGhlbHBlciBzZXRfYW1kX2NwcGNfcGFyYSgpIGFuZCBnZXRfYW1k
X2NwcGNfcGFyYSgpIHRvDQo+ID4+Pj4+IFNFVC9HRVQgQ1BQQy1yZWxhdGVkIHBhcmEgZm9yIGFt
ZC1jcHBjL2FtZC1jcHBjLWVwcCBkcml2ZXIuDQo+ID4+Pj4+DQo+ID4+Pj4+IEluIGdldF9jcHVm
cmVxX2NwcGMoKS9zZXRfY3B1ZnJlcV9jcHBjKCksIHdlIGluY2x1ZGUNCj4gPj4+Pj4gInByb2Nl
c3Nvcl9wbWluZm9bY3B1aWRdLT5pbml0ICYgWEVOX0NQUENfSU5JVCIgY29uZGl0aW9uIGNoZWNr
IHRvDQo+ID4+Pj4+IGRlYWwgd2l0aCBjcHVmcmVxIGRyaXZlciBpbiBhbWQtY3BwYy4NCj4gPj4+
Pj4NCj4gPj4+Pj4gQWxzbywgYSBuZXcgZmllbGQgInBvbGljeSIgaGFzIGFsc28gYmVlbiBhZGRl
ZCBpbiAic3RydWN0DQo+IHhlbl9nZXRfY3BwY19wYXJhIg0KPiA+Pj4+PiB0byBkZXNjcmliZSBw
ZXJmb3JtYW5jZSBwb2xpY3kgaW4gYWN0aXZlIG1vZGUuIEl0IGdldHMgcHJpbnRlZA0KPiA+Pj4+
PiB3aXRoIG90aGVyIGNwcGMgcGFyYXMuIE1vdmUgbWFuaWZlc3QgY29uc3RhbnRzDQo+ICJYRU5f
Q1BVRlJFUV9QT0xJQ1lfeHh4Ig0KPiA+Pj4+PiB0byBwdWJsaWMgaGVhZGVyIHRvIGxldCBpdCBi
ZSB1c2VkIGluIHVzZXIgc3BhY2UgdG9vbHMuIEFsc28gYWRkIGENCj4gPj4+Pj4gbmV3IGFuY2hv
ciAiWEVOX0NQVUZSRVFfUE9MSUNZX3h4eCIgZm9yIGFycmF5IG92ZXJydW4gY2hlY2suDQo+ID4+
Pj4NCj4gPj4+PiBJZiBvbmx5IHRoZXkgaW5kZWVkIGhhZCBYRU5fIHByZWZpeGVzLg0KPiA+Pj4+
DQo+ID4+Pj4+IFNpZ25lZC1vZmYtYnk6IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0BhbWQuY29t
Pg0KPiA+Pj4+PiAtLS0NCj4gPj4+Pj4gdjEgLT4gdjI6DQo+ID4+Pj4+IC0gR2l2ZSB0aGUgdmFy
aWFibGUgZGVzX3BlcmYgYW4gaW5pdGlhbGl6ZXIgb2YgMA0KPiA+Pj4+PiAtIFVzZSB0aGUgc3Ry
bmNtcCgpcyBkaXJlY3RseSBpbiB0aGUgaWYoKQ0KPiA+Pj4+PiAtLS0NCj4gPj4+Pj4gdjMgLT4g
djQNCj4gPj4+Pj4gLSByZWZhY3RvciBjb21tZW50cw0KPiA+Pj4+PiAtIHJlbW92ZSBkb3VibGUg
YmxhbmsgbGluZXMNCj4gPj4+Pj4gLSByZXBsYWNlIGFtZF9jcHBjX2luX3VzZSBmbGFnIHdpdGgg
WEVOX1BST0NFU1NPUl9QTV9DUFBDDQo+ID4+Pj4+IC0tLQ0KPiA+Pj4+PiB2NCAtPiB2NToNCj4g
Pj4+Pj4gLSBhZGQgbmV3IGZpZWxkICJwb2xpY3kiIGluICJzdHJ1Y3QgeGVuX2NwcGNfcGFyYSIN
Cj4gPj4+Pj4gLSBhZGQgbmV3IHBlcmZvcm1hbWNlIHBvbGljeSBYRU5fQ1BVRlJFUV9QT0xJQ1lf
QkFMQU5DRQ0KPiA+Pj4+PiAtIGRyb3Agc3RyaW5nIGNvbXBhcmlzb25zIHdpdGggInByb2Nlc3Nv
cl9wbWluZm9bY3B1aWRdLT5pbml0ICYNCj4gPj4+PiBYRU5fQ1BQQ19JTklUIg0KPiA+Pj4+PiBh
bmQgImNwdWZyZXEuc2V0cG9saWN5ID09IE5VTEwiDQo+ID4+Pj4+IC0gQmxhbmsgbGluZSBhaGVh
ZCBvZiB0aGUgbWFpbiAicmV0dXJuIiBvZiBhIGZ1bmN0aW9uDQo+ID4+Pj4+IC0gcmVmYWN0b3Ig
Y29tbWVudHMsIGNvbW1pdCBtZXNzYWdlIGFuZCB0aXRsZQ0KPiA+Pj4+PiAtLS0NCj4gPj4+Pj4g
djUgLT4gdjY6DQo+ID4+Pj4+IC0gcmVtb3ZlIGR1cGxpY2F0ZWQgbWFuaWZlc3QgY29uc3RhbnRz
LCBhbmQganVzdCBtb3ZlIGl0IHRvIHB1YmxpYw0KPiA+Pj4+PiBoZWFkZXINCj4gPj4+Pj4gLSB1
c2UgImVsc2UgaWYiIHRvIGF2b2lkIGNvbmZ1c2lvbiB0aGF0IGl0IGxvb2tzIGFzIGlmIGJvdGgg
cGF0aHMNCj4gPj4+Pj4gY291bGQgYmUgdGFrZW4NCj4gPj4+Pj4gLSBhZGQgY2hlY2sgZm9yIGxl
Z2l0aW1hdGUgcGVyZiB2YWx1ZXMNCj4gPj4+Pj4gLSB1c2UgInVua25vd24iIGluc3RlYWQgb2Yg
Im5vbmUiDQo+ID4+Pj4+IC0gaW50cm9kdWNlICJDUFVGUkVRX1BPTElDWV9FTkQiIGZvciBhcnJh
eSBvdmVycnVuIGNoZWNrIGluIHVzZXINCj4gPj4+Pj4gc3BhY2UgdG9vbHMNCj4gPj4+Pj4gKyAg
ICAgICAgIChzZXRfY3BwYy0+bWF4aW11bSA+IGRhdGEtPmNhcHMuaGlnaGVzdF9wZXJmIHx8DQo+
ID4+Pj4+ICsgICAgICAgICAgc2V0X2NwcGMtPm1heGltdW0gPCBkYXRhLT5jYXBzLmxvd2VzdF9u
b25saW5lYXJfcGVyZikgKQ0KPiA+Pj4+PiArICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPj4+
Pj4gKyAgICAvKg0KPiA+Pj4+PiArICAgICAqIE1pbmltdW0gcGVyZm9ybWFuY2UgbWF5IGJlIHNl
dCB0byBhbnkgcGVyZm9ybWFuY2UgdmFsdWUgaW4gdGhlDQo+IHJhbmdlDQo+ID4+Pj4+ICsgICAg
ICogW05vbmxpbmVhciBMb3dlc3QgUGVyZm9ybWFuY2UsIEhpZ2hlc3QgUGVyZm9ybWFuY2VdLA0K
PiA+Pj4+PiArIGluY2x1c2l2ZSBidXQNCj4gPj4gbXVzdA0KPiA+Pj4+PiArICAgICAqIGJlIHNl
dCB0byBhIHZhbHVlIHRoYXQgaXMgbGVzcyB0aGFuIG9yIGVxdWFsIHRvIE1heGltdW0gUGVyZm9y
bWFuY2UuDQo+ID4+Pj4+ICsgICAgICovDQo+ID4+Pj4+ICsgICAgaWYgKCBzZXRfY3BwYy0+c2V0
X3BhcmFtcyAmIFhFTl9TWVNDVExfQ1BQQ19TRVRfTUlOSU1VTSAmJg0KPiA+Pj4+PiArICAgICAg
ICAgKHNldF9jcHBjLT5taW5pbXVtIDwgZGF0YS0+Y2Fwcy5sb3dlc3Rfbm9ubGluZWFyX3BlcmYg
fHwNCj4gPj4+Pj4gKyAgICAgICAgICAoc2V0X2NwcGMtPnNldF9wYXJhbXMgJiBYRU5fU1lTQ1RM
X0NQUENfU0VUX01BWElNVU0NCj4gJiYNCj4gPj4+Pj4gKyAgICAgICAgICAgc2V0X2NwcGMtPm1p
bmltdW0gPiBzZXRfY3BwYy0+bWF4aW11bSkgfHwNCj4gPj4+Pj4gKyAgICAgICAgICAoIShzZXRf
Y3BwYy0+c2V0X3BhcmFtcyAmDQo+IFhFTl9TWVNDVExfQ1BQQ19TRVRfTUFYSU1VTSkNCj4gPj4g
JiYNCj4gPj4+Pg0KPiA+Pj4+IEhtbSwgSSBmaW5kIHRoaXMgY29uZnVzaW5nIHRvIHJlYWQsIGFu
ZCB3YXMgZmlyc3QgdGhpbmtpbmcgdGhlICENCj4gPj4+PiB3YXMgd3JvbmcgaGVyZS4gSW1vIHN1
Y2ggaXMgYmV0dGVyIGV4cHJlc3NlZCB3aXRoIHRoZSBjb25kaXRpb25hbCBvcGVyYXRvcjoNCj4g
Pj4+Pg0KPiA+Pj4+DQo+ID4+Pj4gICAgICAgICAgIHNldF9jcHBjLT5taW5pbXVtID4gKHNldF9j
cHBjLT5zZXRfcGFyYW1zICYNCj4gPj4+PiBYRU5fU1lTQ1RMX0NQUENfU0VUX01BWElNVU0NCj4g
Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPyBzZXRfY3BwYy0+bWF4aW11bQ0K
PiA+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6IGRhdGEtPnJlcS5tYXhfcGVy
ZikNCj4gPj4+Pg0KPiA+Pj4NCj4gPj4+IFRoeCwgdW5kZXJzdG9vZCENCj4gPj4+DQo+ID4+Pj4g
V2hpY2ggYWxzbyBtYWtlcyBpdCBlYXNpZXIgdG8gc3BvdCB0aGF0IGhlcmUgeW91IHVzZSBkYXRh
LT5yZXEsDQo+ID4+Pj4gd2hlbiBpbiB0aGUgbWluaW11bSBjaGVjayB5b3UgdXNlIGRhdGEtPmNh
cHMuIFdoeSB0aGlzIGRpZmZlcmVuY2U/DQo+ID4+Pj4NCj4gPj4+DQo+ID4+PiAgbWluaW11bSBj
aGVjayBoYXMgdHdvIGJvdW5kYXJ5IGNoZWNrLCBsZWZ0IGJvdW5kYXJ5IGNoZWNrIGlzDQo+ID4+
PiBhZ2FpbnN0DQo+ID4+PiBkYXRhLT5jYXBzLmxvd2VzdF9ub25saW5lYXJfcGVyZi4gQW5kIHJp
Z2h0IGJvdW5kYXJ5IGNoZWNrIGlzDQo+ID4+PiBkYXRhLT5hZ2FpbnN0IHJlcS5tYXhfcGVyZi4g
QXMgaXQgc2hhbGwgbm90IG9ubHkgbm90IGxhcmdlciB0aGFuDQo+ID4+PiBjYXBzLmhpZ2hlc3Rf
cGVyZiAsIGJ1dCBhbHNvIHJlcS5tYXhfcGVyZi4gVGhlIHJlbGF0aW9uIGJldHdlZW4NCj4gPj4+
IG1heF9wZXJmIGFuZCBoaWdoZXN0X3BlcmYgaXMgdmFsaWRhdGVkIGluIHRoZSBtYXhpbXVtIGNo
ZWNrLiBTbw0KPiA+Pj4gaGVyZSwgd2UgYXJlIG9ubHkgY29uc2lkZXJpbmcgbWF4X3BlcmYNCj4g
Pj4NCj4gPj4gSSBzdGlsbCBkb24ndCBnZXQgd2h5IG9uZSBjaGVjayBpcyBhZ2FpbnN0IGNhcGFi
aWxpdGllcyAocGVybWl0dGVkDQo+ID4+IHZhbHVlcykgd2h5IHRoZSBvdGhlciBpcyBhZ2FpbiB3
aGF0J3MgY3VycmVudGx5IHNldC4NCj4gPg0KPiA+IEl0IG5lZWRzIHRvIG1lZXQgdGhlIGZvbGxv
d2luZyB0d28gY3JpdGVyaWE6DQo+ID4NCj4gPiAxLiBjYXBzLmxvd2VzdF9ub25saW5lYXIgPD0g
bWluX3BlcmYgPD0gY2Fwcy5oaWdoZXN0X3BlcmYgMi4gbWluX3BlcmYNCj4gPiA8PSBtYXhfcGVy
Zi4gSWYgdXNlcnMgZG9uJ3Qgc2V0IG1heF9wZXJmIGF0IHRoZSBzYW1lIHRpbWUsIHdlIGFyZSB1
c2luZyB0aGUNCj4gdmFsdWVzIHN0b3JlZCBpbiByZXEubWF4X3BlcmYsIHdoaWNoIGlzIHRoZSBs
YXN0IHNldHRpbmcuDQo+DQo+IEhtbSwgSSBzZWUuIFlldCB0aGVuIHdoYXQgYWJvdXQgdGhlIGNh
c2Ugb2YgbWF4IGJlaW5nIHNldCB3aXRob3V0IGFsc28gc2V0dGluZw0KPiBtaW4/IE92ZXJhbGwg
SSdtIGV4cGVjdGluZyBmdWxsIHN5bW1ldHJ5IGluIHRoZSBjaGVja2luZyB0aGF0J3MgYmVpbmcg
ZG9uZS4NCj4NCg0KT2gsIFRydWUsIEkgZm9yZ2V0IHN5bW1ldHJ5IHNjZW5hcmlvLCB3aWxsIGFk
ZC4NCg0KPiBKYW4NCg==

