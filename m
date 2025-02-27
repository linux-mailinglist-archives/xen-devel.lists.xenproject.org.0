Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEE7A473A5
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 04:37:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897775.1306413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnUhb-0001a1-04; Thu, 27 Feb 2025 03:36:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897775.1306413; Thu, 27 Feb 2025 03:36:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnUha-0001Xw-Sx; Thu, 27 Feb 2025 03:36:46 +0000
Received: by outflank-mailman (input) for mailman id 897775;
 Thu, 27 Feb 2025 03:36:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ocwy=VS=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tnUhZ-0001Xq-FU
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 03:36:45 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20604.outbound.protection.outlook.com
 [2a01:111:f403:2412::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ec27ab9-f4bc-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 04:36:42 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SA1PR12MB8886.namprd12.prod.outlook.com (2603:10b6:806:375::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Thu, 27 Feb
 2025 03:36:38 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%6]) with mapi id 15.20.8489.018; Thu, 27 Feb 2025
 03:36:31 +0000
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
X-Inumbo-ID: 0ec27ab9-f4bc-11ef-9aaf-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NVIx4a2kwxmA8l9y+uoIrmpP4MnfaJGs1PscW85ibt1nIa1BbwGTH2dAawk5FdfixZgNyUBh6S8922jBEZjsMAMP74ppNPhtZ5tWTA2GywWAIGq/SJFba/GKA5wfTuupoflsFnbeQAc+0zX3Zb1zKaZCYqzmVjIEMbpiAO9gYw6vhuOcD5wuCDGln4ndNCiIE1l6Oj3vIfbRNeSzlhqpVl7TqSEp6dLxcrLvO9XxGb07l4TrK9HW1HrQeicCmHdNuA3OXxfrDBjNR1+e6L/M+gTEaIJr1T1hDVIijQhC2b1457VcMVP3GpdVM0seFh/E/AybRIN9yOdhSN65qtSgnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/vCG/CWAtF8MCcLgmOqylWjUjnMLN4k9a8sduJVEGU=;
 b=qeGVKWCdqHqnK+pWNduE1/j8JflhPkpmtqJdty3X/XtAhSGKWZLDLMtkGOxMS4/zaJ97Pnbng5BuUAbZn1MIAlLi6Cnl0+osjXpilYswHJNHyCV/MLe/Q6yypZJ7/C6Nbbz8DatOZkO8KrSkR734h+hSn/MTs39dMnTqyfso2xsAd49pw3HiLNuZQONb5pF6jWQyuUa9/hPulq9WBbtC2BzqWPzgZHlzcttANptoFl8RqT8gCJ1T5S0jOKc1jwh1wuOgLhVEGfv9+rm1uJeV4ICCzYny+O/i7Ii3Sff9dXJfngdObur29iLQcrsgyB5anTcU70kgkyUMe/AaxbB44A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/vCG/CWAtF8MCcLgmOqylWjUjnMLN4k9a8sduJVEGU=;
 b=GiT8/wgAPs3rFq+iZmss0NdwVDfrfsF5vImdG/KtEOfIAeHHY32SZTIvW6n1zeAsj0A05l6GLQFadFj1v8RYF8osR3e3ZKHyq16/rYxDb87lsq/6cgzecgwIIqy6aSA1swHswcH+0yKuoP+o++WhQiNp8V+/i1qRclx3HHhhcLc=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: "Andryuk, Jason" <Jason.Andryuk@amd.com>
CC: "stable@vger.kernel.org" <stable@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Juergen Gross
	<jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Oleksandr
 Tyshchenko <oleksandr_tyshchenko@epam.com>, "Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [PATCH] xen/pciback: Make missing GSI non-fatal
Thread-Topic: [PATCH] xen/pciback: Make missing GSI non-fatal
Thread-Index: AQHbiIkn9vQzyeCkwEWig/PgIzKlvLNbBOGA
Date: Thu, 27 Feb 2025 03:36:31 +0000
Message-ID:
 <BL1PR12MB58498AC8C41605DD4E288F4BE7CD2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250226200134.29759-1-jason.andryuk@amd.com>
In-Reply-To: <20250226200134.29759-1-jason.andryuk@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8489.017)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SA1PR12MB8886:EE_
x-ms-office365-filtering-correlation-id: 2c191fda-931e-469e-1a1c-08dd56dfed29
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TXh1cnd5WHMvSjNjMnZvVTA0TDMrQ044M1dKTkZkQVRpY3Q3RUJtNGdlcjhT?=
 =?utf-8?B?cnN4dHZQUm11UWlSMUxDMGpKOEV4cUp1SjJPd2VwbFZHU0Yrak5zRmNqVHd1?=
 =?utf-8?B?OXhUakRJWjZqenJBUmowUVp5MUs1ZFNheUpmQ2IvckFKU1hkS2lhLzdaS3Js?=
 =?utf-8?B?UFBsSHl5NVhIMnVhVGxJZ1I4aVFTUjBBR0crcHlpRXlTY1Z4cGZQdWp4STJm?=
 =?utf-8?B?dXFReDArcWs1SDhvanNsYkQ3N0Y1TnNqY0xtc1daMGJDWndDalQ1eXFBL0l5?=
 =?utf-8?B?V0dDNmJEQllDZEZ1cFh2NUZiVEU3QVV2QTZsRFFpbTRFVVRHSzJER08xL3Y1?=
 =?utf-8?B?NFljeWhsQ1JKSkM2SVpVRnlwUWx4ZWVubXY2cmt1VnhSSTlKMW8zeUV1czM1?=
 =?utf-8?B?aUtJbFQrYUh3ZzRqc2VNek40RFltaDIvblRQZnpSL3I5WWtCbG1IU1ZPS0o2?=
 =?utf-8?B?TzBlVDhkdGNrdEVQVkR6SC9rTnJZR0d4NUZGejBkUGltOU5YOXN4SVp6RG1h?=
 =?utf-8?B?SVY1SzJZQnRQM0l6WUtrVFhWMEZ1UkxZUkJIYkpLK09TUi9oK0JyeE1ENWxr?=
 =?utf-8?B?T1J5NnNZa1lHT2NqSHJkZnhIcnRWbUpMaExhVExNSDZlZENJOFVPMmZydm1T?=
 =?utf-8?B?Z29sU3FpNHVBRGJVbnpOZ3pGMGNhY2svMXVUYlBEV0NTbVp0ZGN5eDJ3WGVx?=
 =?utf-8?B?YXFDd1l1R2h2RlU1REovMjh3ZkY5c2VzaktYRldRcUVMSnJjKzRCSUVEYUkv?=
 =?utf-8?B?a09JN0ZkSzAyVlhnVHVmcjhvT2YrSkJtdnlQZFNuQVZoN0lUQVRxWUY4YUZl?=
 =?utf-8?B?MVJYQnZFdksyYWR4dFhBSlRXblZHYnpHVXdXSDc2NG5wVHN3RTZnNUk4aGZV?=
 =?utf-8?B?TVY4d1FQdW9aRXNsVXJYK296NkRmT29nTXJLOWdSQjhhbjY1cTYvbCtHNDRn?=
 =?utf-8?B?a3NyU3BnaFJoUzE4UjgxRUY5b0hENjZveHFsR2RtZzladTZueU5aclpOaG1W?=
 =?utf-8?B?aWZmcTBRZ1pFeUlRUkQ3cmhuZG0vRDNNazZpMHBPUWhnS3NiVFZwbURXV1R2?=
 =?utf-8?B?OXFCeW9zYjZJQmJ2VDBhQnFzQWQvdTFxK2JwaWk0WURtdUFjeGtYdG53d1NE?=
 =?utf-8?B?dEV3cnhpWEViRjF1dE9FUCtjVkE1Tmc4dUI2Y0Vhb2E0T2RSWUM3VXBndGs1?=
 =?utf-8?B?Z1ZYWk1BZDZpeW15RStjSWtKVTJzZi9vSE5uc2dGclZWREMrMTNnTVE5WWcr?=
 =?utf-8?B?OTBCRTV3UW90SnZPMTNmVm5FNFpySlZPQlJieWpqUDVud2szWFhEKzRIa1lG?=
 =?utf-8?B?V01JNTIvOXM1cndIL0VCSTZJeFNiTnV0S1hmdnJiMnRPajAxY1pwejBZMldj?=
 =?utf-8?B?eHdhakUzTUhwbGQzeUtMa3dKT2VuaXVVdmJuMmZkbFpiVWZDa3Yxa0pQc3Jr?=
 =?utf-8?B?SXp1TGRrdVI2TFFaSHZ1cVEwUTlENUVBQkFzMVAyek5aNXV2cFV2Q2JkbS9j?=
 =?utf-8?B?TExmellBU1o1Q1ducnJ6LzhyZkhKVFZPbGVDMmxWRk9rNkRWNUJORk1aeTZh?=
 =?utf-8?B?RCtnMkM0NFZydEZIMUJKT0ZqQ3NqTzVwU3NYT3pzWnI5cjYrS21qcGFCRU5R?=
 =?utf-8?B?OEQ4b1JRS2xUbTE5RHBIanVQeW44blVTclo5RDVsb1BCazg5ZDVrRWtzWGJB?=
 =?utf-8?B?R1dGTlZZMFNlZ0h1djh4Wk1xQUhKU3hWNkVCR2FhUXRHQ21RMm9ITjdpYXJE?=
 =?utf-8?B?akFDMDZmU3dka3MzejYrdy9TVmtFY0oyRjQ0eFR3TW9vTFp5dEtzVmh2cWFO?=
 =?utf-8?B?SmxEUFdWUDI3a2hleHU3b2hzMDBjbTczMGRaM0ZYUjU3dFN3M3VnT1ZpYXZY?=
 =?utf-8?B?cDVDOUVZYzRYdlNzQkVFWG1DemV3VGJjMGxZZnEvNnV4VWppTi9zcTJNa3M0?=
 =?utf-8?Q?RkCrufkJPuCqdi+kOZBnlO+vXcLYx8n/?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K3JRc25WVzE4NkRiTW13Ym5hWmlTdk1BRjVzdnVoc3lCNGFUbWNIWmNQbGxM?=
 =?utf-8?B?T0hvSGVnVFJaV1creHFvUDlOamJuS3ZvZDJwL3FFWW9lMXlsWGRPU1ZWSTVE?=
 =?utf-8?B?SUdGTitXb1cxM0FUL0UvNGRjY1hzdEdKU2wvLzRySFZ6SHZwRU91SzZ3NUN5?=
 =?utf-8?B?QlN6WXdJUTZOTjBESU5FbWZmd0pTejU3RUI5MWkwd0V5VkI2eEt5RlU3eG9q?=
 =?utf-8?B?MldsQkoxVm1QN21hQnZuNEdVakhRbEdNTWZGZzh4Z2V1L0g5eU0yQW1DcmVE?=
 =?utf-8?B?NE9vMnBPWjNBcXNBcHhldmpJMTF0cW1DVFd5YnBHM3l0UkZHVktBdmFGcFFX?=
 =?utf-8?B?aWM5WHczZ01icXhZb1BpVXlNbk1DanBuZW5SaVRITDhTRnNtQXBVSHZPSkxu?=
 =?utf-8?B?MHRGd2NjSFllT0lwNU5TbG41STdoRm4vR3VqREx5YnJ2U3puTGNlZEl5YXla?=
 =?utf-8?B?YXFLM3RDNzcrbjdFc1ZZMDZtTWNYdi92bklmWFFsQ3AycWxEcGdRMDhGMTRu?=
 =?utf-8?B?UVMrcXBKVWlEZi9adEpwaExwYThDdTN3ZkxWajRWNjhzY1JUaExVWFdaUmds?=
 =?utf-8?B?Uzc1cFVpb1ZmS0NDeEk0THp3UWVNK0lXclRMUUhmUGV6SVcwM2JJTWZFN1c4?=
 =?utf-8?B?NWVSeU5iYytXL1NtL0M0MXIxTnBQRDl3dXk1dWNmb1c4UnNvdDZ4RzdNSm4z?=
 =?utf-8?B?Qm44TVkrdVJsRld6K1Q0VERQYjJHamFkZjhNWDRWOTVSaEprdXZGaTlxS2RH?=
 =?utf-8?B?cmcydG11V3JXTzVvOVJMaWd2WnNSTUM2K3RwTW5nSVp4U01MTHFRMmpmem5F?=
 =?utf-8?B?a2lrdnhJRzFCWUNaMFp3Z1liemZmZUV3L0llcWY4QnhpNlg4TjFBWGF3V3d3?=
 =?utf-8?B?STVCSVJxaTBQNjFqTkR5U3BTa0ErSnNoK3Z4MjExUzh6SXhXSlE5M0tuOWxW?=
 =?utf-8?B?emxkSnFMd09JZmNBZUxoUnEvM2VUczRhVlVYZXcvRUM4eXE3RXBldUdJWjJU?=
 =?utf-8?B?S1JvYTg4Zkh2bXFISFVlRC8xK1Z1WTl4Y0Ewamp5VE5obWozV1dWSVo0eGhD?=
 =?utf-8?B?WFcwazlTSk1KWVVTaGtvS3VMWnpMKytLd0tqSDRKQ3hOem82T1lXcmpiNUZn?=
 =?utf-8?B?RUlsUXdNejlNNlFvNjNqcG9FSGZscmZ2Znh3cGxRdFpKcW54b3huR3RueDJE?=
 =?utf-8?B?a0ZlZ1ltQm9QWTJjVGpTQ0tLMURRbThPMFh2V1ZtdFVMWEVwanFScDRqbmdL?=
 =?utf-8?B?Z2tINEIrS0RrTDByamY4K2NVV3h1bTF3OEtOVjg3V0lSaW1DeGtmM3ZMWmRs?=
 =?utf-8?B?bFExYlhZaUxKZXEyK3RBT1V2OHR4OURKNG5vTEtEUUhWM2ozVGtRMElZOWZj?=
 =?utf-8?B?SGtXUit4cG9YUUU5ZUp1cys1TlRCcnA4QUozU3YwcjVFM0UvSytZa21BTVlH?=
 =?utf-8?B?SFhBY2d2Z0dJbUN6Y2cvVEt3QVV1djBEQUhPWWkwbnJvV0l2N2Y0Vk5JdCt1?=
 =?utf-8?B?Qi9rT3ZZYTdrcG92OUtLWDF4eVBQbmZFdTcxUWttRi9ZQUJUOWMvRDVndDg5?=
 =?utf-8?B?MkhUOVBkN1FsdldCdWxMK2c3cmZuTVJGTEI2WXhhQWhMZGJ3RWh2Y0FCMU43?=
 =?utf-8?B?Y0ZoRDZtMUw2cmNQaGFreVRGa042SmtZZFZEVUcwT2M1cVNXbDBGN2lCVzRB?=
 =?utf-8?B?aFByTnpEV1hHc2Q5UGVhOFN5ZnE3WWhjdGd5K3Avcm0zZDh6eG0yZzYzWUVo?=
 =?utf-8?B?U2ovVmFCYVh5eWtmaUFiUWlRYXNmUitCS0hmQlFEZGVrVHFZQTVqTitkUzhu?=
 =?utf-8?B?anVHRGx6aEdKSmtKOGFURmx6Wnk4QURRTzliREZYNTlqS0hHZEVaQmJqL2tQ?=
 =?utf-8?B?OVQvdDBvYkhPQmt2clVvd0FNZkRacnZGakdnZWZTSHlGcFBlN1BBTUZtYXBX?=
 =?utf-8?B?UG9vOXFiUmZLMk9tZ1VKZmNZZ2NiMEtxUGUyQWxDS3VsY041RlFkNTErVnlN?=
 =?utf-8?B?SGNFYjRZNjl2dlpSM3NKNkUrVVJWZVZ5bUY4ZTVsUUdxc05yZ29aR21ZVTBI?=
 =?utf-8?B?cHhsOXpCMmZua2pyaUhSV1R4TlZJSUlLVFM1VUZxMVJRZ2ZpRjdzYStFS1pU?=
 =?utf-8?Q?Kl8g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C346D086CEEF5A41974AB5B7C01D5910@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c191fda-931e-469e-1a1c-08dd56dfed29
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2025 03:36:31.2972
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K4QwrP897C3fBydL4tYUOd3xJ3aWphPVhYPmPZv1sbAb3elfVHiL9i/QkUAAVuljpLAu5YPsfPRPljzDMOD3gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8886

T24gMjAyNS8yLzI3IDA0OjAxLCBKYXNvbiBBbmRyeXVrIHdyb3RlOg0KPiBBIFBDSSBtYXkgbm90
IGhhdmUgYSBsZWdhY3kgSVJRLiAgSW4gdGhhdCBjYXNlLCBkbyBub3QgZmFpbCBhc3NpZ25pbmcN
Cj4gdG8gdGhlIHBjaWJhY2sgc3R1Yi4gIEluc3RlYWQganVzdCBza2lwIHhlbl9wdmhfc2V0dXBf
Z3NpKCkuDQo+IA0KPiBUaGlzIHdpbGwgbGVhdmUgcHNkZXYtPmdzaSA9PSAtMS4gIEluIHRoYXQg
Y2FzZSwgd2hlbiByZWFkaW5nIHRoZSB2YWx1ZQ0KPiB2aWEgSU9DVExfUFJJVkNNRF9QQ0lERVZf
R0VUX0dTSSwgcmV0dXJuIC1FTk9FTlQuICBVc2Vyc3BhY2UgY2FuIHVzZWQNCj4gdGhpcyB0byBk
aXN0aW5xdWlzaCBmcm9tIG90aGVyIGVycm9ycy4NCj4gDQo+IEZpeGVzOiBiMTY2YjhhYjQxODkg
KCJ4ZW4vcHZoOiBTZXR1cCBnc2kgZm9yIHBhc3N0aHJvdWdoIGRldmljZSIpDQo+IENjOiBzdGFi
bGVAdmdlci5rZXJuZWwub3JnDQo+IFNpZ25lZC1vZmYtYnk6IEphc29uIEFuZHJ5dWsgPGphc29u
LmFuZHJ5dWtAYW1kLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL3hlbi9hY3BpLmMgICAgICAgICAg
ICAgICAgIHwgIDQgKystLQ0KPiAgZHJpdmVycy94ZW4veGVuLXBjaWJhY2svcGNpX3N0dWIuYyB8
IDE3ICsrKysrKysrKystLS0tLS0tDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMo
KyksIDkgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vYWNwaS5j
IGIvZHJpdmVycy94ZW4vYWNwaS5jDQo+IGluZGV4IGQyZWU2MDVjNWNhMS4uZDZhYjBjYjNiYTNm
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3hlbi9hY3BpLmMNCj4gKysrIGIvZHJpdmVycy94ZW4v
YWNwaS5jDQo+IEBAIC0xMDEsNyArMTAxLDcgQEAgaW50IHhlbl9hY3BpX2dldF9nc2lfaW5mbyhz
dHJ1Y3QgcGNpX2RldiAqZGV2LA0KPiAgDQo+ICAJcGluID0gZGV2LT5waW47DQo+ICAJaWYgKCFw
aW4pDQo+IC0JCXJldHVybiAtRUlOVkFMOw0KPiArCQlyZXR1cm4gLUVOT0VOVDsNCj4gIA0KPiAg
CWVudHJ5ID0gYWNwaV9wY2lfaXJxX2xvb2t1cChkZXYsIHBpbik7DQo+ICAJaWYgKGVudHJ5KSB7
DQo+IEBAIC0xMTYsNyArMTE2LDcgQEAgaW50IHhlbl9hY3BpX2dldF9nc2lfaW5mbyhzdHJ1Y3Qg
cGNpX2RldiAqZGV2LA0KPiAgCQlnc2kgPSAtMTsNCj4gIA0KPiAgCWlmIChnc2kgPCAwKQ0KPiAt
CQlyZXR1cm4gLUVJTlZBTDsNCj4gKwkJcmV0dXJuIC1FTk9FTlQ7DQo+ICANCj4gIAkqZ3NpX291
dCA9IGdzaTsNCj4gIAkqdHJpZ2dlcl9vdXQgPSB0cmlnZ2VyOw0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy94ZW4veGVuLXBjaWJhY2svcGNpX3N0dWIuYyBiL2RyaXZlcnMveGVuL3hlbi1wY2liYWNr
L3BjaV9zdHViLmMNCj4gaW5kZXggYjYxNmI3NzY4YzNiLi45NzE1YzJmNzA1ODYgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL3BjaV9zdHViLmMNCj4gKysrIGIvZHJpdmVy
cy94ZW4veGVuLXBjaWJhY2svcGNpX3N0dWIuYw0KPiBAQCAtMjQwLDYgKzI0MCw5IEBAIHN0YXRp
YyBpbnQgcGNpc3R1Yl9nZXRfZ3NpX2Zyb21fc2JkZih1bnNpZ25lZCBpbnQgc2JkZikNCj4gIAlp
ZiAoIXBzZGV2KQ0KPiAgCQlyZXR1cm4gLUVOT0RFVjsNCj4gIA0KPiArCWlmIChwc2Rldi0+Z3Np
ID09IC0xKQ0KPiArCQlyZXR1cm4gLUVOT0VOVDsNCj4gKw0KPiAgCXJldHVybiBwc2Rldi0+Z3Np
Ow0KPiAgfQ0KPiAgI2VuZGlmDQo+IEBAIC00NzUsMTQgKzQ3OCwxNCBAQCBzdGF0aWMgaW50IHBj
aXN0dWJfaW5pdF9kZXZpY2Uoc3RydWN0IHBjaXN0dWJfZGV2aWNlICpwc2RldikNCj4gICNpZmRl
ZiBDT05GSUdfWEVOX0FDUEkNCj4gIAlpZiAoeGVuX2luaXRpYWxfZG9tYWluKCkgJiYgeGVuX3B2
aF9kb21haW4oKSkgew0KPiAgCQllcnIgPSB4ZW5fYWNwaV9nZXRfZ3NpX2luZm8oZGV2LCAmZ3Np
LCAmdHJpZ2dlciwgJnBvbGFyaXR5KTsNCj4gLQkJaWYgKGVycikgew0KPiAtCQkJZGV2X2Vycigm
ZGV2LT5kZXYsICJGYWlsIHRvIGdldCBnc2kgaW5mbyFcbiIpOw0KPiAtCQkJZ290byBjb25maWdf
cmVsZWFzZTsNCj4gKwkJaWYgKGVyciAmJiBlcnIgIT0gLUVOT0VOVCkgew0KPiArCQkJZGV2X2Vy
cigmZGV2LT5kZXYsICJGYWlsZWQgdG8gZ2V0IGdzaSBpbmZvISAlZFxuIiwgZXJyKTsNCkkgdGhp
bmsgaGVyZSBuZWVkcyAiIGdvdG8gY29uZmlnX3JlbGVhc2U7IiBzaW5jZSBpdCBpcyBub3QgRU5P
RU5UIGVycm9yLg0KDQo+ICsJCX0gZWxzZSBpZiAoIWVycikgew0KPiArCQkJZXJyID0geGVuX3B2
aF9zZXR1cF9nc2koZ3NpLCB0cmlnZ2VyLCBwb2xhcml0eSk7DQo+ICsJCQlpZiAoZXJyKQ0KPiAr
CQkJCWdvdG8gY29uZmlnX3JlbGVhc2U7DQo+ICsJCQlwc2Rldi0+Z3NpID0gZ3NpOw0KPiAgCQl9
DQo+IC0JCWVyciA9IHhlbl9wdmhfc2V0dXBfZ3NpKGdzaSwgdHJpZ2dlciwgcG9sYXJpdHkpOw0K
PiAtCQlpZiAoZXJyKQ0KPiAtCQkJZ290byBjb25maWdfcmVsZWFzZTsNCj4gLQkJcHNkZXYtPmdz
aSA9IGdzaTsNCj4gIAl9DQo+ICAjZW5kaWYNCj4gIA0KDQotLSANCkJlc3QgcmVnYXJkcywNCkpp
cWlhbiBDaGVuLg0K

