Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 912E8A39357
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 07:15:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891086.1300180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkGsd-00087z-K2; Tue, 18 Feb 2025 06:14:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891086.1300180; Tue, 18 Feb 2025 06:14:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkGsd-00085Y-HN; Tue, 18 Feb 2025 06:14:51 +0000
Received: by outflank-mailman (input) for mailman id 891086;
 Tue, 18 Feb 2025 06:14:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6odE=VJ=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tkGsc-00085S-6z
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 06:14:50 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2416::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a691618c-edbf-11ef-9aa6-95dc52dad729;
 Tue, 18 Feb 2025 07:14:48 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 BY5PR12MB4211.namprd12.prod.outlook.com (2603:10b6:a03:20f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 06:14:42 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.8466.013; Tue, 18 Feb 2025
 06:14:42 +0000
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
X-Inumbo-ID: a691618c-edbf-11ef-9aa6-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qg9p7xukCDPK5q35Dj12lgP4MlKPiqkIJcGPAlll1LqLpgX3wLzZ1D7FfJfpGEQg0vQ+5F7d1fjGoYWo/dLkfRgboZFUvYwtrMU1gVjQ6OyGyBociwFMj9UxMQPf/Zubm+2Xvp/kGTTEJk5w8qq/zlNkOtaMcvYDS5NmxrjAN8yzK/gi2nTZiT9HGBPTT+50ijPzmm+82V0W97dOe5K5cLXvWlaw11DUv2kopkjR9LDWWEcecZ+qrkvpOpnUTGLVLAjvb0YHe/P4Rv9Zs9vyvAGwWAqcDJJ/7yKRNtntKqRs53eLpJM4bTQUnJPW9z8kra9g5pvzvSJQY6sRv4HahQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wxH0xjDRCXo+RkHkPD0VXhNICaq8v8E5tNH8xWmGRWQ=;
 b=uOSxRrsSo/VH1BZQotktfk1u+yol6CywTRapOAiGJG/F5eZEizKkhskmXd71ONyOfGG4var/K71aoDhpGNapWLCCg+46YXcD7GlcTQ8gOa6otCtSnVJU+Rw8FR78NgxzhOdSKHs0omUGT5KRtkRgeYR/JtR8wsBIj/9jho5KwZ0VpXQR6iTquckI6Ck0dNgLt0BDSlk1OR2n2QhWAdJ52k5iFiiFgcGXnNoUuhUGYMs9Fx/j0YPc4JS5RY6c56zbhhgi0mviNghZHzOPInphhf4XfgPWPjZfR16so9Pg0GDzJIMISRgYp6a2OvKYkgLeIOiTGBqAQCMfwoOyXNwUAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxH0xjDRCXo+RkHkPD0VXhNICaq8v8E5tNH8xWmGRWQ=;
 b=NjJio/c43EAoBJl+tqQNtd/piXYJRGtAhBiIB82ilL/grswKB58JpbKpVE2LbhIyYc7vSDxIeiNtUR/sM7Otqi8XI0KgsfutzJphDuKDf2+tDxm9+VEPUo3ISC3/bOs0HL2WBT0JVVX44PaZ7Ns8H3dQfj7Aa5uK8wYdEJRr9Nc=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "Andryuk, Jason"
	<Jason.Andryuk@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 04/11] xen/amd: export processor max frequency value
Thread-Topic: [PATCH v2 04/11] xen/amd: export processor max frequency value
Thread-Index: AQHbeHHNz+yPLcfmW0WrRfgDeQNp47NCKNYAgAp8kWA=
Date: Tue, 18 Feb 2025 06:14:42 +0000
Message-ID:
 <DM4PR12MB8451598930C730001060B1DEE1FA2@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250206083255.1296363-1-Penny.Zheng@amd.com>
 <20250206083255.1296363-5-Penny.Zheng@amd.com>
 <5d19f9a6-2be8-4a69-a9c8-19a0e4196e44@suse.com>
In-Reply-To: <5d19f9a6-2be8-4a69-a9c8-19a0e4196e44@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=b752dbff-f84a-4445-abea-2c00795a0ae1;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-02-18T06:05:44Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|BY5PR12MB4211:EE_
x-ms-office365-filtering-correlation-id: 5f769519-2b32-413d-d25b-08dd4fe38887
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?azViVlVGN3ZjK1NQZnRaRUlDTGI5a1pGc013NkY1OCtzUEVVTUJCM0gwL2ZP?=
 =?utf-8?B?bzJDNXNTYmVRUlZEenZoRmR1K0l1V2p6Q1FxYytyZVZTSitEWE9nK0c1bEpS?=
 =?utf-8?B?YUo0cENIVWE4dVE1Wm5wY0xWdDRsMmpHWGVhZlAvaktDYm9tVFBmSS93cE5U?=
 =?utf-8?B?V1lMU0hKbU9NRGtWeWdLQW40eGlBSlcxeFFDZ28zSmVCdXBGdVgweldaOHdM?=
 =?utf-8?B?d2R2Vjc4dSsxenVOcHhDditKUkN3YmJsem8rV0xUV0hXcVlXWlpERTdNeFdZ?=
 =?utf-8?B?aWM1QXJnVGdCZjVCczB2RGRVMWdqYTZJWjFKN0Z2MEJObmFuTHZHUGE2Q2Nv?=
 =?utf-8?B?RkREV1R5c1YzV3I5emp6RjBWR3plYkV6eUI5clg2by9yKzR4U0cyZmlYUnlQ?=
 =?utf-8?B?ajYweDhleXUyMnRrYkRUd3FwWjNna2lERlRqRmE2aWo4WmV6VmRDaGVkZXdw?=
 =?utf-8?B?RG9aN2g5QVdNcmxPakw0M3dpZXVGT2hqTGpzNWsxWVppMnowSmMyTEpqVjRR?=
 =?utf-8?B?THVFZjdUOG9IWDIrQlJFZWNZd3RUUStRUUFpUnlFNmJXR1ViZmhESGUvakZP?=
 =?utf-8?B?WFNPQ3RhYytqYjJOODcvWnVmN09leEpBUWpRSnVRUm9RVUQwNldSbUpoU1hq?=
 =?utf-8?B?TGR3cGJOK29CUnZ6REdyRkdLZ0FtankzbkN4aEUvS0hIcDJCOU5JUSthTnlo?=
 =?utf-8?B?a21BbjRKK1B2SzU2NThNNlNTQWVQQ2dQM1lrMkkybnNzRngxelRHNUxVT1B5?=
 =?utf-8?B?aG5KVE56YWpITldFY2VvUHhWWEtTK0tydXFEM3E0OFhxR0xuMmgydVE4THR4?=
 =?utf-8?B?T1BzOG1Lc3dablA5Qng1Q2RRdFNyR2VwWDV3RDVPQVMxcHpCVGhZT1RUT2RX?=
 =?utf-8?B?VXZwM0dMOU5DK2oxZlN2dktXSEx5Q3I0WlNBTjFYSjNCTFcxYjFxWVVGOERo?=
 =?utf-8?B?cUxFM1BnclhUK1FZajQvVm9qNEV3bFh5eDBVbW9pdW15azBZUDkzR3h0OWhn?=
 =?utf-8?B?dUExVzdDa3dLMVhXamRITlRwOTV0a0FjZEE3emhEck5KeXZnUmdrZEkyZzJo?=
 =?utf-8?B?LzN0SjZ6VnJoM0FjZ3VPNjdoNEFCU0UzOTI1U2JLK1hONXJYVGdCWGhzejVB?=
 =?utf-8?B?QzRHNFlJVTM0aEFxWHIwUk1BV3A0eXU3VndOa2w1VWkzVnVUbElvMWhWRHpl?=
 =?utf-8?B?NGFlN21DR2RsQWQ0OEJVSC9FVU9sa2Fwc2x5c0YxNWphckQzMm8xVm9oa3px?=
 =?utf-8?B?VXhkSk9uVWxHZS8xclFjdHdDYzNpYmllWUhlK0FGUkpKalQvSE9IT1JsWGlY?=
 =?utf-8?B?OVh1RG01TitycDJSNktXYkxSeWIxY1BYTTgwZXd5SzVLTlF6YkRKakJHQWl6?=
 =?utf-8?B?RFVyOTJMUDZ4N0MzN0F4Yjh5SjhKeXFkL2tiVFJGWC9ISkJSZ2gyRHhKUHM4?=
 =?utf-8?B?ZTZnbnVjRm92L0dIc1RucE1EcVJ3SDFlNGJqRDFwQk9RS3FPV1I1OE9VOTNF?=
 =?utf-8?B?d1UxYXAyYnpUMVdEOW5ZcUh3bGRNYm9WODdoZ045NDBacUFXZlpjbmQxVndU?=
 =?utf-8?B?LzV4V2gxUWNUY2hSU2diWUxVUHZ3YytPQXV0MUR5TXI5K29IOTdwcllsMlVK?=
 =?utf-8?B?UkJGL2pHa0FYOVR1NUxBbkhMa0t2NkRnRitiQkJMUktaQWNxUnNOb2UzbXB1?=
 =?utf-8?B?ZlBzZVlGSmJZWUU5YTJiNXZNeDd5dHNXNU1xaFdOcXdOdUNGUDdWZU9oVGRa?=
 =?utf-8?B?QjgxbTRtOVRKQXRjZnZDMDlEYXpGaVhlMVlQcUtJa1cvMFUzRWQ3R2pFZjYv?=
 =?utf-8?B?Vkxtb3dZOGYrdzN3SE5vWk9xdERNekFVeTY4UHZVZS9ldGZPb25VNFFyZTBv?=
 =?utf-8?B?UjRya241UDB0ZHhUTVd5M1YwOUNMOFhnRVhERGhFcjBWWFdyTS9ZTTBLS3Rn?=
 =?utf-8?Q?zK8sTjsFK/ZxkISa+YuZh8xqWgb8hvjy?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a0lqOUFKejgxTER3aGUxYjVQT2d3UmJud2JpcGY0MFpTZEtZdjVWQWJHK1I3?=
 =?utf-8?B?VkNiVTRGSTM5b1JMMnZkaEZRRnM5ZVlXQWhjME94RFpJYm9YdmJ4ZXhrbHor?=
 =?utf-8?B?bkRKVjJua2FKWFFNclcycE1ncVZkMTgvN3EwSFVEZWlka3IvcmlXUy9ObGlO?=
 =?utf-8?B?dXF6L2VObUZWS3lnZXFwVElqaWw5SzRIYTQ4aFN5S3pvU0ZmUmVNcWt2RUdY?=
 =?utf-8?B?UGVZYVA1azR3OC8rL3dZMmJxcXlnZXU0RmxGcmVXaEJ3WXZCUnFwM1ltSXFy?=
 =?utf-8?B?VTUwbHV2Q2xWZ3ZhcGlQU1JnWFRFMGs0dGNvNDVLSE5RdUhiblpUVm8vNGc1?=
 =?utf-8?B?Z2VSQ3BaZDR6d21peW9zY2N1d2xJU3ZKd1gzd09pN24vSzUvRTFSK1JXNmh0?=
 =?utf-8?B?MDB3RDV0c0loclc4cGt6STAwN0ZHbzVOSzlyemVCRlZuay82Y1RUNEpVSTRM?=
 =?utf-8?B?Ly9IMU5lVVFrMWlOZjN4ME5pK3h5ZWJVbFRiejhEVWFYYjNJaUFBb0I5Z29a?=
 =?utf-8?B?RXY2WDgvU1B3b0FFUVN2TjhJNFFjc0VXZDF0alpmNnhZR0N6OWxhM3NRckZT?=
 =?utf-8?B?RTVxY0lnNGhkZHdHaURXc05MakYzdVR0d1VoUWRhK0huVlR3YTlNTkszWGpK?=
 =?utf-8?B?Y0xDcHZ0VXJLeG40RnZnVS94cjdxZlhrczJFbVQ1cktCVTl0WEJPZk1RNzB2?=
 =?utf-8?B?UG5tc1pOTllpRDVKeDV5Ylc4Y1I2WjhsVDBWblVsVW9sbk1CWTROMHJUaGhG?=
 =?utf-8?B?TWI3UU10RkJ2OXV5TTM3VXYvY1FRdXVkRURuUndZOXR6c3ZsVUNlL0duYlY0?=
 =?utf-8?B?a3k5UGVkUmZWZnp5eVluR1RzR3pkVmtENk1SU3B0bHBlc1ZSS3ZOcHRkQXY5?=
 =?utf-8?B?UU05Z2ZJdDVYRFM4TUdTem0zMTdRcml2ZGUyWVVGSUxmUnNsbC9ZanVMR0Y3?=
 =?utf-8?B?U1BVZ1RFbGlQM09jTTNMTHdqTTR3eXZmQXkyZC9FM3F4dVgwQ1hqL0c3NndL?=
 =?utf-8?B?d2I4QkZzcEJpRGRzNC93YWFWelpKU1Zrbk9oQUxYazFMcUFiYXhCM0JZclpw?=
 =?utf-8?B?Z25aR29WSy91N0NIVFJwb2FObGU3eWg4WGhhamdaejh4MUU3bDVSMWtkaXNl?=
 =?utf-8?B?M3g1bVRsdm1POGEraThLbWJqdEppcVQ3SFdWTGJHTFJ5aE1seUdxOWpDZXBM?=
 =?utf-8?B?RVQvZFhpOTZicXFCaDNvNUIyVkI2Y0tDYTc3bldnd3VFQ0RCU2lBWXJKY202?=
 =?utf-8?B?ZTdjMFdObk5CMnYwUk1TbkVYdTVlRjF1bjFvMG1yRWNIc2ZJUnRKM0pMbE9a?=
 =?utf-8?B?VEcwVmJRRXdGOUthL3dzRTNxQVNJNjY3RkVkRFRaVkxzcUMwRlo2VkNrTXZw?=
 =?utf-8?B?aVo5dHhtbEdKU0swbVdwSEFXT2NxT3FSNEFCQ1hmSXVzZE9WSjdtOE1hVllU?=
 =?utf-8?B?ODZvMUdzRXAxdysyNG1IeG8wd0tobFRyT1NXNmswdXB1K0dHL1g4YkdaNGtU?=
 =?utf-8?B?TzBFdHFTYzRDWTVRUmF6bVFnSkV6Y1duN1NLUk4vZGE4Zlc0VXFtRzRXamlQ?=
 =?utf-8?B?NjJaZXpQS1ZZMFVtT3UzUnNKU1graXVOV0xNSlF2SVBoaFQyTk5MaXB3Q0NQ?=
 =?utf-8?B?QS8vb1hKRFNRazd0WTRCVGV4UVdXaDNEZnIvbUdyZnJpYlBNbGVROW5pemhV?=
 =?utf-8?B?U3hQaG4wRWY3YWM3R1pKL0RyTWZZUk1SUFJBQ3I1ZjBkTEpieVBOYngyQWJu?=
 =?utf-8?B?bmVRRUozcHYvaUV5a0pUQzZWNzlwbkhQcnpzUWFNUUczVjBjcnhHQ0h3dTYv?=
 =?utf-8?B?VHh6OERoZGw5QTg2OEdTbjFKRlRqejUvNVZGZy9aS1lSNmdXWFNsT01GeWd1?=
 =?utf-8?B?blQvVDBTUENVKzIxRitRVjRTMU9Eclp6RW9DZkp3V21vYWc5M3dJSWZxQkgy?=
 =?utf-8?B?MUY5NUwraGdsZjgxVFBEakpCM3Z5VmNzbzFzbDZLa1YxQkhyOUN6Nzc4TDdC?=
 =?utf-8?B?UmQyWll2clNzaE5ldy95TWJrUGZ3TVNOMHJOaEw2aHAwQWZjdW9hZWtGa2lD?=
 =?utf-8?B?OC9VVXhPMjh5bG0xSnBicHpmcW04T1VwWGtTOTFGeHdFRGpBM1Z3N1JPODU2?=
 =?utf-8?Q?ebOw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f769519-2b32-413d-d25b-08dd4fe38887
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2025 06:14:42.2907
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RbIm/XtXzf/vHO9ozjpymHXPR+7Y2/Mlmrs/UDu17FKA6JugNrGFZ25j56WvUz+R2KTTusWAqtxH2gjXfA8ilg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4211

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBGZWJydWFyeSAxMSwgMjAy
NSA5OjU3IFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+DQo+IENj
OiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFuZHJ5dWssIEphc29uDQo+IDxKYXNv
bi5BbmRyeXVrQGFtZC5jb20+OyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPjsNCj4gUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyB4ZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAwNC8xMV0g
eGVuL2FtZDogZXhwb3J0IHByb2Nlc3NvciBtYXggZnJlcXVlbmN5IHZhbHVlDQo+DQo+IE9uIDA2
LjAyLjIwMjUgMDk6MzIsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9jcHUvYW1kLmMNCj4gPiArKysgYi94ZW4vYXJjaC94ODYvY3B1L2FtZC5jDQo+ID4gQEAgLTU2
LDYgKzU2LDggQEAgYm9vbCBfX2luaXRkYXRhIGFtZF92aXJ0X3NwZWNfY3RybDsNCj4gPg0KPiA+
ICBzdGF0aWMgYm9vbCBfX3JlYWRfbW9zdGx5IGZhbTE3X2M2X2Rpc2FibGVkOw0KPiA+DQo+ID4g
K0RFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZKHVpbnQ2NF90LCBtYXhfZnJlcV9taHopOw0KPg0K
PiBTdWNoIGFuIEFNRC1vbmx5IHZhcmlhYmxlIHdvdWxkIGJldHRlciBoYXZlIGFuIGFtZF8gcHJl
Zml4Lg0KPg0KPiA+IEBAIC02NjksNyArNjcxLDEyIEBAIHZvaWQgYW1kX2xvZ19mcmVxKGNvbnN0
IHN0cnVjdCBjcHVpbmZvX3g4NiAqYykNCj4gPiAgICAgICAgICAgICBwcmludGsoIkNQVSV1OiAl
bHUgLi4uICVsdSBNSHpcbiIsDQo+ID4gICAgICAgICAgICAgICAgICAgIHNtcF9wcm9jZXNzb3Jf
aWQoKSwgRlJFUShsbyksIEZSRVEoaGkpKTsNCj4gPiAgICAgZWxzZQ0KPiA+ICsgICB7DQo+ID4g
ICAgICAgICAgICAgcHJpbnRrKCJDUFUldTogJWx1IE1IelxuIiwgc21wX3Byb2Nlc3Nvcl9pZCgp
LCBGUkVRKGxvKSk7DQo+ID4gKyAgICAgICAgICAgcmV0dXJuOw0KPiA+ICsgICB9DQo+ID4gKw0K
PiA+ICsgICBwZXJfY3B1KG1heF9mcmVxX21oeiwgc21wX3Byb2Nlc3Nvcl9pZCgpKSA9IEZSRVEo
aGkpOw0KPg0KPiB0aGlzX2NwdSgpIHBsZWFzZSwgb3IgbGF0Y2ggdGhlIHJlc3VsdCBvZiBzbXBf
cHJvY2Vzc29yX2lkKCkgaW50byBhIGxvY2FsIHZhcmlhYmxlDQo+ICh0aGVyZSBhcmUgZnVydGhl
ciB1c2VzIGluIHRoZSBmdW5jdGlvbiB3aGljaCB0aGVuIHdvdWxkIHdhbnQgcmVwbGFjaW5nKS4N
Cj4NCj4gVGhlIGZ1bmN0aW9uIGhhcyAibG9nIiBpbiBpdHMgbmFtZSBmb3IgYSByZWFzb24uIERp
ZCB5b3UgbG9vayBhdCB0aGUgY29uZGl0aW9uYWwgYXQgaXRzDQo+IHZlcnkgdG9wPyBZb3Ugd29u
J3QgZ2V0IGhlcmUgZm9yIGFsbCBDUFVzLiBZb3Ugd29uJ3QgZ2V0IGhlcmUgYXQgYWxsIGZvciBG
YW0xQQ0KPiBDUFVzLCBhcyBmb3IgdGhlbSB0aGUgbG9naWMgd2lsbCBmaXJzdCBuZWVkIGFtZW5k
aW5nLg0KDQpTb3JyeSB0byBvdmVybG9vayB0aGF0DQpUaGVuIEkgc2hhbGwgYWRkIGEgc3BlY2lm
aWMgYW1kX2V4cG9ydF9jcHVmcmVxX21oeiB0byBjb3ZlciBhbGwgc2NlbmFyaW9zLi4uDQpGb3Ig
RmFtMUEsIEkgY291bGQgdGhpbmsgb2YgYnJpbmdpbmcgYmFjayBlYXJseSBETUkgbWV0aG9kIHJp
Z2h0IG5vdy4uLg0KTWF5IEkgYXNrIHdoYXQgaXMgdGhlIG1vcmUgYWRkcmVzc2VkIHNwZWNpZmlj
IHJlYXNvbiBmb3Igbm90IGFwcGx5aW5nIHRvIEZhbTFBPw0KDQo+DQo+IEphbg0KDQpNYW55IHRo
YW5rcywNClBlbm55DQo=

