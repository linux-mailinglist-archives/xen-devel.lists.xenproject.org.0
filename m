Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7104B08884
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 10:55:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046430.1416769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucKOU-000163-Fi; Thu, 17 Jul 2025 08:55:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046430.1416769; Thu, 17 Jul 2025 08:55:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucKOU-00014M-Cc; Thu, 17 Jul 2025 08:55:10 +0000
Received: by outflank-mailman (input) for mailman id 1046430;
 Thu, 17 Jul 2025 08:55:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XlL5=Z6=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ucKOS-0000qS-O8
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 08:55:08 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc25fea1-62eb-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 10:55:06 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AM9PR03MB7076.eurprd03.prod.outlook.com (2603:10a6:20b:281::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.24; Thu, 17 Jul
 2025 08:55:04 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8901.028; Thu, 17 Jul 2025
 08:55:04 +0000
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
X-Inumbo-ID: bc25fea1-62eb-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FO1w8Tng84y0jq7bIfac6VdTE4bB4W/3cQEVTv9SEQ4rJZEq3+6LihtS+U/Y51qqojLd7uIS6+Yu2j4aYD5bCTAVuC0qgSJOHxcv5F1unecQcy7FyFaeiXfjD5M6EVzXLjl8fSDqofjk7RUfOpnZ6hUhYALFqmLacacqL3SuaCD0yoRFdGTruSW6TvAnQTlIz7ZiCbOM+i9IIfT32YZ3z0oIjrMndFAPeOIr6nBhysO6p61VwIJYKBQF1XKaeXZF7Y0kIJU6qbOOykfHguqiEdxokKyHG2FxK7iBZGaPbuyn1w+79dBJQ1WgzBuuqqfAj+OMQ/ioOrwguO94lP2BIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I2zHv1/6a68qFfzDrraCK1/l1C7WPXJIVfQCjKFw9ws=;
 b=Eay9kf7PuTY0xEhWmgeG+5nR3u5Y5VtSQS3qGEIm5gCUanOcvkNUVkTB/NStX/xO+BdPjbEn+H6q4cHYHzDMFa9jzw4dxmRe9mwOpND9dipKWNCSow5QlSxAHuKnyvq8E1bK/mTU2Wp2Phi7zBLOnjHAn05R3kKkfFMCIwSZC/V7pcDA2Z3wXWx6Yi5Du8rRS6KurNhEy6jhYxIQiCmdJbpgsOBQY+o+M8Am0L+dSdhRA0k8bc32iRYjAW1xtxKkpBXBOV1tL5JftqQftCnV7zAJOl92Ry7PJo6oPWwT3gNak1hwsSdi9xjLz+jHq94dOlFEm4dkYnMEE0K+ICnR3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2zHv1/6a68qFfzDrraCK1/l1C7WPXJIVfQCjKFw9ws=;
 b=gAq/7S0MZawTa4dsnOWynh1qhJiyhx/xo6CDYvE61lj4pP+gXZyAFsn337OjbW1aBt9f5NP95wmm0AuwSxi+NBCbjxgJlztyXxjRidz/rrdiKxUlPexBgOpRWMEuE6P5Y6rZHSjID9M1vvdPzMlSUfpeQm/siwSmzFQZoB5Wgl630JKTTt9AoeVZ2hS2xXhgzTqqNdAacXYNFM3hJL7RWt5fK3+sGPs+DjMSRmJUf12l4eQ4JUqQVtOOshDqYdm8vUHNcEt2gzPyaWz3D2cPMnaGi3kQhDwXTNML0GVLXPz0BZ3E6/mji+3qvx8wACH1QtqQ/PWgN2nSWLSTYDPrug==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Nicola
 Vetrini <nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] misra: tailor the definition of Rule 12.2 to C standard
 types
Thread-Topic: [PATCH] misra: tailor the definition of Rule 12.2 to C standard
 types
Thread-Index: AQHb9kpD31dTcYF/7UCF8hLOSjEN6rQ1gkOAgABeDICAACQUgA==
Date: Thu, 17 Jul 2025 08:55:03 +0000
Message-ID: <3276745d-fe9b-4fe1-ab72-71bc6afb04b1@epam.com>
References:
 <f486aa4ac823085afb7e068f6e84ea6be3cab19b.1752667611.git.dmytro_prokopchuk1@epam.com>
 <alpine.DEB.2.22.394.2507161809120.15546@ubuntu-linux-20-04-desktop>
 <a6fcdb51-8bd1-4595-8f28-deafcc15ef86@suse.com>
In-Reply-To: <a6fcdb51-8bd1-4595-8f28-deafcc15ef86@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AM9PR03MB7076:EE_
x-ms-office365-filtering-correlation-id: 29e5b6b2-a6a3-4d04-1c23-08ddc50f9f05
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|42112799006|376014|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cUdPaHFpZ29mMmtoVXN0OXZnSWVCbzlwTkRSRXZkYU9PWEx5bDBiNjFuS1Fu?=
 =?utf-8?B?ZGk3bDFWa0xXZVpiSzA3Q2VyUGljUnJtYXl0Q2hmcERaeTFiYzVsZGNOdWtI?=
 =?utf-8?B?Um9nOWpQNDBUK3NLWG9Cd3pXRFhlZGMrRmtidktCS3lDWFVhNU1BSW41NlRM?=
 =?utf-8?B?eU1KOE1ZSkk5SE1JODlYakFXRnN5NTdEUVo4QVl4TE5qRnJKVWJCSFV3YnpP?=
 =?utf-8?B?azZOK0swZzU1RGE3K0Nkck1pTUU3bVdZSHdPaFluNTNjNHFBdXBSRERHcXZp?=
 =?utf-8?B?TFVvOXRyb3NyWmtyclp5K1RrWFNobXJiTkkxbm9jSWRSTnpxa05Kc0lobnN4?=
 =?utf-8?B?S01KMEJnWlVtNGRPSHhkMzh0VHRKekdRS1pHNVdzUit5SkxqY0ZZYzVXMmk3?=
 =?utf-8?B?cmYvT2M5bUlDYytJRkFXRlJPc05MNTVWYkJJN2I2NkN5T2V6c2srMEc0eWpZ?=
 =?utf-8?B?aUdUZW1SOWlHMVQ0SmtwRms3UWNJRUpjU0ZOY3hNRjQvKzYxbHk0NUJ3UUl5?=
 =?utf-8?B?ZEV1UmxLY09JdVpXT3hxWnB3WVlEakxKRHpTb3dCZVBRcWhmeFQ5aG5sU0dV?=
 =?utf-8?B?azhyMHhDZURiMVhLUXpRWndCNVMwSjMxcGVVbGY2Rkc2WDB1MWxkcTcvSGlR?=
 =?utf-8?B?cVZ3S0dVNzNYN1JIR3ZCbTNWL1RIcjdKVDhSSnUzSXF1TFRIbjB6K0lzMEtu?=
 =?utf-8?B?L2twWTFNazl1Y0lyVnpSa3FhRTk1KzUvNitKbDNMVGFJczY4NWx4bGsxU3Jy?=
 =?utf-8?B?M2g0aDNJTkdSS29TYUVwU2x1UjBuZ01rUVFkcUxYUmtzeVJBS293cENPN1B4?=
 =?utf-8?B?dDlXZXFsc0pMcnA5NHN4aUdhTkYxSkh0dy9tYjNrK1IwOUZnSlp3d21aWndK?=
 =?utf-8?B?WFZZbU12anF3amVIa1JPVGRsNmlVQ09vNGlRMFdsMVhvVmE5NnJ3L3djYnpR?=
 =?utf-8?B?NEFLMXJRaEV4VTRTankvbVhyUDZUS0MyWkVUOGJUeS9nbjlWL2FGNDNCTlhq?=
 =?utf-8?B?dWs5djJSQXgzT2drcWNyM05HQm9TRnBYTnJuNmNSSjZLMVdVdS93eDNHRlZY?=
 =?utf-8?B?N2wrYVJvMkl6bnA2L2QwdGZFNktMeDFCLzhuWHNCZWlaelAyL0tlUHVRNUtp?=
 =?utf-8?B?UjV2M2VoSFRaKzQ2RTJyYUxWVDZRY24vL2VOaHpPL1YxWXRoRDEwa1Y1YmFG?=
 =?utf-8?B?R1p4aFlNbk1oUjczNC9US0N5VEMxVUtFWGNaOHlyV1h1aU4yVkQ1SU4rblhG?=
 =?utf-8?B?ZDRXRVJmVjJkUVJSNnU5OTJhTXRNZDkveXlkSWt2a2x0R3hDNUFYc2RzSzRa?=
 =?utf-8?B?Y2hic0dvMGtzZjBwdVRZSXdYNDZUZ0VUS2UvRkNZV1oyaEpxdkFNQzh1UExK?=
 =?utf-8?B?ZmNyL2g1TFQ5NU5mdGYyV3hOMEduRzByeXMvajBqamcyZng0M2hqV0Ftc0tv?=
 =?utf-8?B?QnV1eTNtbUdqMkwzVHRkWkc5Wll4MHhYRXVwbzlMWHVMNExnV2ppUk51L3c1?=
 =?utf-8?B?NXpGZlVPTDJUS0RsTXZtSWEwRUpFNTRTL2QranJZK3pXdThsQ3NiaHNxdU1v?=
 =?utf-8?B?a2JIbHZtRjRyQkxJdGwwOURQSEJzRWc1d082Mi9TNXpBQVlncG1MODBOSXZk?=
 =?utf-8?B?NUhsVVA5YzVzNy9aUU41QlFjVnRVWFRLclozNFBod2xPNjZqZGkwUTErZnNW?=
 =?utf-8?B?NWVkeDdtZnNuR2FXREs2dERKdEVucUZEQkdNWXdPRC9TY3dtaG1keWZmUUQw?=
 =?utf-8?B?ZmRzdUNMcHVQT3h4VHpWblhHT29Wd1V6NW9zR3dHTHBwVFBUSS9JRlFCU0hO?=
 =?utf-8?B?eW80bnY4ZFpLa01yRFpHdEg4YUE0eWM2ajFMZnE0dEZPNzZ3dEhYeHVkSFEw?=
 =?utf-8?B?cVFVb2ZWc1plbUJEeGpKM0VVTk1qamlsM0R2TG1uTGt4RVVFMGhGWW03cEhZ?=
 =?utf-8?B?TVBzQ2M5bUFrbm51ZmtBZk81WU8zK0VScTBGNTlqZXlwVTRhVERoRUNkbEFN?=
 =?utf-8?B?Y1lFaVlLSlJRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(42112799006)(376014)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UHpXTkdDaUZPekZlMk1md0hVanJDWm8xMzh0ZlB5cmd2bkFVWE1lcHdobTRH?=
 =?utf-8?B?cXpPb2VCVk8wcm04bldXTGZwRVFiY1FIMzhmc3NDMzRIRFpHVHNWai9yNVFU?=
 =?utf-8?B?TjVlT1AxYTJaang3THlOZnVnWGVkS0x1bUg5Q0N0M1UrdXVTN0RVcDg5VE9S?=
 =?utf-8?B?WDB3azRKWlFjb2tLUC8vVzRTTjI2c2hGSUpPWW5BWDdETW01MGZLOXZqY1U5?=
 =?utf-8?B?aEhsZkRtOTRGYzNqMmdXZFFQM2dQNFhrVUhPeE5ja2NEc2pmNWpLOW4rZGdu?=
 =?utf-8?B?L3BIQjdiWGkwR2haVHByTXpTWEU4VjBBOUREQXRYbTRoMFE0Z01kZEZQK2NK?=
 =?utf-8?B?R01jQ2ZYN3VUN1FkbXMxSDVyb3VTV1pBNnFRdkVSUjd2NzVlNzdsL1dJWVJV?=
 =?utf-8?B?ZnMwN3BHd1VUY2hFZUVOMFUyTEMrVXA3NFBLYjllOEZaVEFzWHVvMnhnNjRi?=
 =?utf-8?B?RGhQWFFBRnRPQWxuemI3MERLUlFoV3NIemJxSmRPa0lJMEp4OXE5ZTNFS2hi?=
 =?utf-8?B?bW1NeHJsQ0VUelYzV1RGTEFsMTNUaFh5ZVZYaE9hN2Y1aVM2K2wzamlDRVVS?=
 =?utf-8?B?WWpFa3B1TmlTT2dUWlNsUEYydjY1Q1ZFVUJrT295Z2dFQ2NKUzRMV2puUDZI?=
 =?utf-8?B?d3ZMYlVEakcyRGFrUUtvMXZVR05wRkc3MkdlVGlodmtodHpVNzVFeUJxVGJx?=
 =?utf-8?B?RWREYTFJTWZDd2RmZlVmR0FBRTNnMlQ4cnpiMThoRGErcklySmswclllbE5F?=
 =?utf-8?B?UVUwWTlCSVpZS2lOUkgyTlZDaGZobndVRCtCYnBzYy9iYTFVRGV6LzZTYk05?=
 =?utf-8?B?Y0cwK3NCbUlCUktUQ2hITUJZZjVhR2FDOUV6ZTVnMTBaUDVpSVFINUR1YmFB?=
 =?utf-8?B?elg0Yjd6dU1TLzBkbVZIMDdyQUUrWGt6aGpCWEZTZDh2aHlKK21HTjl4VzdS?=
 =?utf-8?B?SlVwUVZ0RzVFM2NSdThkUmhKNlJvUU5IMFptWGdvZE5LbE9mekszMG1kZUNT?=
 =?utf-8?B?YWUyNkgxblppYVppTWxhdTRTWm9RN3hRaWhQSEsvdTBBOWh1eWtMSllDdjN3?=
 =?utf-8?B?b2dxczl4OENOZ0gvZjN1eUJwU0xIVzBBL3JqR0x1a2RlaElnQjhQdG1BYlZE?=
 =?utf-8?B?blNBWks1ZVRVWUhPZzlqQTZzd21sei94VHhFMU5UOTUzV1NweTRObzl5WnUx?=
 =?utf-8?B?bGdzeEtleTVPYmhIVDZGV2JWSzcyR2xxWU5GTnJqSndzWUl4blpZeDFPdDRT?=
 =?utf-8?B?TzVXaW5CKytPM2QxTTh1WVNoNGlXR1d5VzJpL3VrMEhQMGtMZERGa3hzQUxp?=
 =?utf-8?B?RnJxQWM2UXdweWptaGs3VUNKUUNEMWZ3NTlNZTJQY3ViVFgxYnlTL1ZLUHo5?=
 =?utf-8?B?bVErS2pxVFNxU2FqWTYwcVNwbitQWHBCYkhZY0RBSWlWaFJvNUFvZ25COFZY?=
 =?utf-8?B?TERObGxCZ1pRZi9vcm92UnUrV2NDZUZFNWd1TlU3SWV3dTl1OG85R20vUk40?=
 =?utf-8?B?d1NMMndXNm8ySlV1cXEwSXMrZGFhQ21JdWJUNEJtbWM5SEFVZ2tNSkc0TzZz?=
 =?utf-8?B?bUV2d2xwTk5qVmNhbk02S3E2ZThucXlCUkZUN29idnJ5OG9yc3p2aGZMNGlT?=
 =?utf-8?B?Q1BzSXhCck0zT1VIbW5xbzlmdU5uQkhoTWNRdUluY0c1aWZJckRMRHp3a0cy?=
 =?utf-8?B?T25LUDJFRk9YVXd2WWdHOTJzejN1WERuTnN5YUpORlFpQ2pFeS85VndsdzVz?=
 =?utf-8?B?cUtjYW1JOFlmOTFheldMMFJLcVJRd1FRR0tpN2RoOTlNTWl5WFpxQzVyOVU2?=
 =?utf-8?B?RHRLUEVaZVhnc3picnJJSkloVjgyRlY1RXZCaHJ0UFlZSEFjU2R0cnpHZUhW?=
 =?utf-8?B?cEtLU3JpQWVhc05uQ2svZDZFWTRTVlVBRkx3WStxWXdzTTNZUUlGc2VoWFMy?=
 =?utf-8?B?ZFVXY0R1ZDdiWW9Zd043S2d6NzhnbEd3QTNNakRhOVBTWiswMERlZnR3cTBZ?=
 =?utf-8?B?dUJjRVB5VFYwTmYzTUtzTVRsVGJDOEZKRW0vOUFPV1pjR1FFVHNEdWxPazgr?=
 =?utf-8?B?dHkrMlRjZ0dDdHFzbVJnaEdicU81M0pwL2VCcGRFd2R2cU5wME91eXh5ak1i?=
 =?utf-8?B?d01jZXlSRTRXdVVnRU1yZmJaZ2JiQ3ZvWUlBYkoxbnEyWFp2WjYreVhPOGtj?=
 =?utf-8?B?NUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CEDFB8A78E8DBF4A96053D59DDD36E89@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29e5b6b2-a6a3-4d04-1c23-08ddc50f9f05
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2025 08:55:03.8883
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +burNH0RYuNFLZrBZmR1SJKzY+USlSh98gA3W77k/G+C+uVqDDDkyOmocqttA+PlUThxXS2rEPfJv+QD4/MUnKX6gIKlUUxUIKV6r7NHscw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7076

DQoNCk9uIDcvMTcvMjUgMDk6NDUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNy4wNy4yMDI1
IDAzOjA5LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+PiBPbiBXZWQsIDE2IEp1bCAyMDI1
LCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+Pj4gRnJvbTogTmljb2xhIFZldHJpbmkgPG5p
Y29sYS52ZXRyaW5pQGJ1Z3NlbmcuY29tPg0KPj4+DQo+Pj4gVGhlIGRlZmluaXRpb24gb2YgTUlT
UkEgQyBSdWxlIDEyLjIgKCJUaGUgcmlnaHQgaGFuZCBvcGVyYW5kIG9mIGEgc2hpZnQNCj4+PiBv
cGVyYXRvciBzaGFsbCBsaWUgaW4gdGhlIHJhbmdlIHplcm8gdG8gb25lIGxlc3MgdGhhbiB0aGUg
d2lkdGggaW4gYml0cw0KPj4+IG9mIHRoZSBlc3NlbnRpYWwgdHlwZSBvZiB0aGUgbGVmdCBoYW5k
IG9wZXJhbmQiKSBpcyBjb25jZXJuZWQgd2l0aCB0aGUNCj4+PiBlc3NlbnRpYWwgdHlwZSBvZiBh
biBleHByZXNzaW9uLCB3aGlsZSB0aGUgQyBVbmRlZmluZWQgQmVoYXZpb3VyIGlzDQo+Pj4gcmVs
YXRlZCB0byBDIHN0YW5kYXJkIHR5cGVzLCB3aGljaCBtYXkgYmUgd2lkZXIgYnV0IG5vdCBuYXJy
b3dlciB0aGFuDQo+Pj4gdGhlIE1JU1JBIEMgZXNzZW50aWFsIHR5cGUuIEZvciB0aGlzIHJlYXNv
biwgaXQgaXMgc2FmZSB0byBjb25zaWRlciB0aGUNCj4+PiBDIHN0YW5kYXJkIHR5cGUsIHJhdGhl
ciB0aGFuIHRoZSBlc3NlbnRpYWwgdHlwZSB3aGVuIGNoZWNraW5nIHRoZSBydWxlLg0KPj4+DQo+
Pj4gVG8gYXZvaWQgcmVncmVzc2lvbnMsIHRhZyB0aGUgcnVsZSBhcyBjbGVhbiBhbmQgYWRkIGl0
IHRvIHRoZQ0KPj4+IG1vbml0b3JlZCBzZXQuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBOaWNv
bGEgVmV0cmluaSA8bmljb2xhLnZldHJpbmlAYnVnc2VuZy5jb20+DQo+Pg0KPj4gUmV2aWV3ZWQt
Ynk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gDQo+IEkg
d2FzIGFib3V0IHRvIGNvbW1pdCB0aGlzLCBidXQgRG15dHJvIC0geW91ciBTLW8tYiBpcyBtaXNz
aW5nLg0KPiANCj4gSmFuDQpTb3JyeSBhYm91dCB0aGF0LiBBZGRlZC4NCg0KRG15dHJv

