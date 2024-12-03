Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 328459E1794
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 10:30:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847606.1262700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIPEt-0001ao-9G; Tue, 03 Dec 2024 09:30:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847606.1262700; Tue, 03 Dec 2024 09:30:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIPEt-0001Ya-6Y; Tue, 03 Dec 2024 09:30:39 +0000
Received: by outflank-mailman (input) for mailman id 847606;
 Tue, 03 Dec 2024 09:30:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x39C=S4=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tIP7Q-0003Be-Jr
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 09:22:56 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2409::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d1fcf17-b158-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 10:22:55 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 PH7PR12MB6562.namprd12.prod.outlook.com (2603:10b6:510:212::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 09:22:52 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 09:22:52 +0000
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
X-Inumbo-ID: 2d1fcf17-b158-11ef-a0d3-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d7PiYMH4sWMrCvlY0GuWpFfyoosfC0jWqlDSc/Uu8UiU+MERTzbf3YF8GxQoB2AYLKrcZVhA5DBJ0leJahnPOqLKnr6dFhomDKMN8xGBkDuL+0ZU8YpytQtRQ4EBKzzc/co1zU+tjvJQOtTmBsxInGJagcCB4C7xtK10+O1n3WUw4agXWEZgvkEnpP10uXQEKdnS2Bb8ONpvbc+4BDpNmCDBNgUqjB3YpI/qsDCVrnDBD2rjT6NmJ1rq5JShPtKTz5vG7wvLww/zQO7b/FoyqNcnYUHey8VxzJzn/u4YAtj1B/PiIoPTF0hOYQ5Z4kBbB3Smo4vFCjNcYZ+gdpKaAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81Ldwl0GqaYchefVU+uRrSQ4FZ9bnLV8Ifjzlr4OwOw=;
 b=ahY9Hfc36WsylW6QclcPT+1wEcZdFTPExq1yAUp/NzsuP5yEMZRAER1UiZ0tc+ZQfwIUvJnCXdYBfqAN81kHMxPHhjLJ98VP7Cp6/mJqKjvHCeXdXwav/8al4LmN+vLNFyprbWrrzll9CYQja/TK6/GObKkGvqWn0p8tFd4fPJr46kI77VVZFe/OgHm0IpGb3SxVgovmurbmT+s5EOT6NuwHcanCkya2bxoiwAwPQ1oZalTC7ae0Dv4CZ4IiW9GjqfyvsbwipCJ0Xi00ym7pzD6H78kUlgb4e7cTWwgm3L/soAYUpyDwkHgB19FsgeIoqoXhb45+r4jz9IyH9UEuTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81Ldwl0GqaYchefVU+uRrSQ4FZ9bnLV8Ifjzlr4OwOw=;
 b=vYMiqNe97cXlOKJpwJT0QQmEjzMlHdZnQ+IBXsetqsKqCuxsqNN6F2p/cnpWEVpgsbkjK6V9tA37g6cN3HG3WcLP4ouPoZzD7ISTtNp+Oz4DoRkVM7K4LFCtDpsaScdX1mMN+8uif+RRTU3y/bsXpBrSkzGlbVpiR9mhYl09j7I=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Stabellini, Stefano" <stefano.stabellini@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Andryuk, Jason" <Jason.Andryuk@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v1 00/11] amd-pstate CPU Performance Scaling Driver
Thread-Topic: [PATCH v1 00/11] amd-pstate CPU Performance Scaling Driver
Thread-Index: AQHbRVunyKYn4ka+eUmYX8UkoWQ2p7LUOQ4AgAAFVxA=
Date: Tue, 3 Dec 2024 09:22:52 +0000
Message-ID:
 <DM4PR12MB845190BF1F187BC2A19FAA61E1362@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20241203081111.463400-1-Penny.Zheng@amd.com>
 <593baee2-9bf1-4db4-86e8-015cae48dc1a@suse.com>
In-Reply-To: <593baee2-9bf1-4db4-86e8-015cae48dc1a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=bf334407-ae71-498b-82b3-c71c1a6f3b0b;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-12-03T09:20:12Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|PH7PR12MB6562:EE_
x-ms-office365-filtering-correlation-id: 5eea3dec-093c-4de1-643b-08dd137c0fef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?a1p3WnFxRllRVmdiN1YwYkdpUUI4R1ZReUFNQlc4azl5L2pKbitXV0VFeWZ2?=
 =?utf-8?B?T29lTDVkb04rOGZtYjBScmZqM3AvWXo4Y2hpeFhTeFIrWndWSGl3Rm5ESW93?=
 =?utf-8?B?OHZoM3ZLLy9jekVmWXQ3UnRBZTFhQVc5cDRMdEV4ZGZRc2RDb0R6M3phZkdF?=
 =?utf-8?B?L3FsTWh6UkFETGF3UWFzN2gxcWd5R2pQaVdQbjhGSm93Tmw0T2xFd3FxWHlx?=
 =?utf-8?B?d25iWFJ4ZzlWU3JUZUVIZmJ1amxYUVptRFcxVjcvaTd4UHE1WFQ1YXZhSEVm?=
 =?utf-8?B?N0RiZVhQWWFjbUozRlpkMVc0c0VrSHg5SjQyb2NzL1FIRCtIeFJHMlVxRFAy?=
 =?utf-8?B?c0JXYS9aVlhXK0hlMDg3YTUrOWtsY25LY1VDVWZhM2RrTis5TUJDYkM0emkx?=
 =?utf-8?B?WDMzNEFmYUNnY0FiaWlyL0VpNHFkd3lEOEVQblE0WmdlUmljZ0dncmJESmc1?=
 =?utf-8?B?VllWQWF6WDUveFJwZjl6R3VVVjI2NnNhUnJrcWxxMHd3UkdsSmE2VkU1VVl1?=
 =?utf-8?B?TEhJK09QeXhxM0NYZlVPOW12ZjVOQk5RMWFvVW1kZk1ibWVXWWkvK05HQTQ1?=
 =?utf-8?B?MzRWL3UzaldXV1VUaTd0ZUl2dVl1dTNOYU1HOFhOR0ZKMVlZYXRVWkpSbCtF?=
 =?utf-8?B?Um5WMnFPTjNjTm8zVGRNYW1iRVpqUUF0bEg1RWRoQmdBLzlPUjBrSUtyL1Rj?=
 =?utf-8?B?d0x4RFFSNURYcG9QOTU2YjZIUUZRVVBwQk8rUnd4akZORmRLQ3Zla1V5bEJZ?=
 =?utf-8?B?TytkNThpV0xSb0ZEblIxaysrdlJxeGJtS0FkeTNUdDR0K0JWSXNnU3h3M1JJ?=
 =?utf-8?B?dUF1QWhyLzB4N1NyazA0c0FMRC82bFhMZVhOZEVtTFlDcVpoSzlmSjlGRFI0?=
 =?utf-8?B?ZTYrYzVkUkhiMm5qMFhMTEUxRitYcm50QW44d0tXNlV2ckhSakp6ZTNDQXZI?=
 =?utf-8?B?QUNFMENWOXpHcWpYWDBINWEzeG5lQjlkR1Bxb0J1T2ZBSE5uT3lpMXFySmdV?=
 =?utf-8?B?R0pieUtPeEJ3VHh3eStrWnA2VjJ2U2tYUFR0YjdrQTJqdzlIRy9TRzRJNENq?=
 =?utf-8?B?U3ZDUTIrcmQvRmVjaDNjOEw4NkRKWVNpMmpKdnB3YjFpZmNYL1NVcmlscUc2?=
 =?utf-8?B?a0laVDNsK2ZVMXZqZ0dNdUI4VDRudWhpUkVlL29Xc0hZUU9zK3dHWUsxTStW?=
 =?utf-8?B?Q1AzZjdkZnVmUnRIMlRsQ3JESVphY0JsZWhxN0RZM0dWTlN0YnRJSERQd1lx?=
 =?utf-8?B?dy9kcnFZOXFhcWpJYjVDcUNJazdMSDFmTXFGRmRMNktvMXluRG9tM1l3N0hL?=
 =?utf-8?B?a1RRbGpzaWlHS29raHhhbE81ZmNOTHVkaHhZRExaaWNZL1FNYi9ocS8xMGhp?=
 =?utf-8?B?SzNsMy91K2ZzWnpRSFVnWksvZjFkQkQyUG5JTkxWdDE2L1p4eXdONlprSmNX?=
 =?utf-8?B?TzNWU3VvQ2NPM3ZrSFZPNVU1Snh0L3cxenFQSkFZS1RTZ0xCYnFLdkNIQlVh?=
 =?utf-8?B?L3RLMS9FdkdvK25sRGh4cFVjdURLUy9rRkFFSGJ2T1k5WGRIeXdZVXdhbUY4?=
 =?utf-8?B?WFJxcU5jN0o3UnZjUmtDWXFqcU1FaHFmRVl4NWJPK2YwdjQ4dVZ4SVlzVXI1?=
 =?utf-8?B?cWtROG9mVDNVaTVWSEFrREZMcGRHNVA3ZVBIV2dFSE9GeG4zRFlCbUhaOFgy?=
 =?utf-8?B?T1EwQmVReTNDYllMdGk4N0VPK0dYb3E1Y2V5QXZ6QWh0SHNVTEh2S00yamo1?=
 =?utf-8?B?MFdxNTNCVE9ydUtrcUxIYWJteUJPRVl6RG5jSTJGRmM4b3JaUVZRM2pveXJO?=
 =?utf-8?B?ZzRoM1BtNUtNVDVBSzdmOGY4TDRZZzhUenR0UUxuZW5zdE9WWjM1b090U01D?=
 =?utf-8?B?QXF3bFEzTittNGJ3MUswbVhCMmpOWEIzVVNMeGlWQzAyWnc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WEp6UnRMV0RZYTk5V3ExQW5MdWJqNmZuNVVNK2NsUXZlTTkyVjdlbTJqbmpy?=
 =?utf-8?B?bC9JVVkrV2RZd2xQUzlWV2s0dnduRGsvQ3BBTkFqZi9tZnZHYkZSZG5wZi9k?=
 =?utf-8?B?TDRqNXNCWEF6OWJ0SHJXaG8ydjRYVmVyYSt5bXU3NnF4TUlscFdHWTltL2F5?=
 =?utf-8?B?cURiUEl6SkVoNitvUHlWYzRsYndrY0s0cytQSXMvNkMwa2VwOWZOZUVrUlAv?=
 =?utf-8?B?bndZei84dmxpVUVWNFVSbFYzakFtdWNsVFJjVUpjcjRLM2JORU1CWXdKZ0dm?=
 =?utf-8?B?dEtBRFpwYUlQcEtuWEhxd3dhNUkvOC9Bb2ZsQXNVdm9XUVhxMmRVeXpuVDFH?=
 =?utf-8?B?TmEyaDI3KzNKaEUrTWJReGt6NCszV0ZsMC8wdEVUY0VLWlFWdkkvNkN2c0pO?=
 =?utf-8?B?WmgvY2dDRVQzcXYzbkZNMDdlZTVXKzlQQWFBbjlMVUUrdElmWjNoYVZJM2Y2?=
 =?utf-8?B?YXhkYWtnWlE0NkNWYTU2ditFckpCVVhwb25lYUZueUNvLzBGYk45QWY0bWc4?=
 =?utf-8?B?SWtQWVdKakdTRFluM3dndVN1anpYbjZ2Q21heHJsOTNwaHR3OVpsNlBmdW5R?=
 =?utf-8?B?M3RvUGdXRkVpVEorWCt6ZjZtU0ZobTFGd3ZiLzVhRTVrWHdBV1pNV2U0emlQ?=
 =?utf-8?B?ZGc5aXFLNVFvMkxwVzBidWYzbTBSWndqd0VSdGIzVDg2TFRDWlJWNlMrdGNN?=
 =?utf-8?B?KzdHSlpka2RyZTFlQVpDbUovcDdQR3B2TXUxRXN5YWhmNEZnZXI5dDRpclZ3?=
 =?utf-8?B?aFM5d3A1RHcyUCtnYTdWUkkvdmhkM1VLekhRZ3B4TTlRQmRqalVPS0d5akNG?=
 =?utf-8?B?dmRFVlB3VmNFN1gvMXJBNXRZS1c2RUpMUTZ1UUVyRllDREk0dnJteko3QTlY?=
 =?utf-8?B?bldDWkRnNHUvaWR3eWZTVDR6Wk56QVhidTQ0ZVBLUUV0YWM4U1VlRnY1WUM0?=
 =?utf-8?B?WDhoVHczRkhiWll3Ynl1bklnZ3dFb0RwaTBwZ2RMQ2lGcTlOb1BySDFreVl5?=
 =?utf-8?B?Y0xBYU9mMllTSDhzVmNWbWFBUWxNQkJkMkc0VXFHYjhiY3gxdmwvN3Bha1Zr?=
 =?utf-8?B?QnZkM0xlQnlzVjlpc2FHOTdLRkZPSUxXQ0JCdGZuWlpXaWlza2lsYVF5TFpP?=
 =?utf-8?B?aFU2bXBjeEVCNmdDaXkyVXFjRjh5UU1tdXJad1dWMVZ1NG90VEFTSHc4K1ZN?=
 =?utf-8?B?UXZEdG53ZnNMbmZwbG9qUnIrQ1JBbTZaaWFoVGRkWDYxT0EvWEtraUZ2Wlcw?=
 =?utf-8?B?SmFuRTlxeGlDTGNieFQ4SXE4MjA1N3RrUXhOQS9BcElpWnloR3VuQmZXRHRq?=
 =?utf-8?B?REVtODU3MDFUSlVFaWtHUHZmZ3VpeTdRQXd2cTFVTWF4QXJjeGU2eWJCWTdp?=
 =?utf-8?B?VlJrclpPQTVNZGNJTytNYlhtL2hyWFF1clg5T3FubDlYWEIzQkI5N0JBZWU5?=
 =?utf-8?B?RUZoUGRoTTBPV0NMWXprRnl2eThjaloxMWd3MjdLSXpTM1lnWUthTEFFZTZ2?=
 =?utf-8?B?ZzIwek9zelZvU3Jwd2htREJuenpQcURVZzYzbU1rYkd6eEZZYmhHZGY0V3pk?=
 =?utf-8?B?UC9MMkxVWHZhMmxoQWZVeGE0bVdYQkhaYXVUaXVvdmxFU0hoK3BsWjdMWGFj?=
 =?utf-8?B?OU5MMy9aSWlKUktHSnArT3N2azR0Mm5qeUlSc0piM29jUE5IclZGVVpVN2pl?=
 =?utf-8?B?K1hqdDZYVzJvemhyb25mV3MrM2RRNTlHMS8yUU0wOU42QmNwdTRjalVWZmxD?=
 =?utf-8?B?MWJHZDBLM3BLYmdTY0tQb2MxYjA5WG1zMlFsbXZ6c3FIa3p3NGFOYnlBaTZa?=
 =?utf-8?B?UjhPTEFPLy83Sm1ubk1GSy9Kdm5aR1ZJR0QxWnA3RTFsa0FaZzB2ZjRNK040?=
 =?utf-8?B?SUl0OG9xc3c4WGlXdEhSYTYwbnV0UnhvOFlHanZoZTZuUEVSbHpLejNZWTB3?=
 =?utf-8?B?YkpwL0JzWVU2RnRnY1daYTd2aUx2bldvb0s4RUdTdjBjQmQvTVZudlRLVHZF?=
 =?utf-8?B?SWl5TVZsb0dxZ0N6MXNjVlFKdFNJcWRhcTNsR3NETkFoaDNXVzNTYlpEdURT?=
 =?utf-8?B?QjlFMkF3aE4vMnI1TG40U2hFbVg5eUc5Q2d4b3hVQStPYlB3bytOMjI2bjRZ?=
 =?utf-8?Q?kkQk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eea3dec-093c-4de1-643b-08dd137c0fef
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2024 09:22:52.0164
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MQ9qDKwXtsMdhA//c0GJstjMQZBlB9RkrwkQ0UhOzYOjF5gD6oR8OUs+hHlxld3sIxK5VVY5LGwd4U7CFT6hGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6562

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBEZWNlbWJlciAzLCAyMDI0
IDU6MDEgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4gQ2M6
IFN0YWJlbGxpbmksIFN0ZWZhbm8gPHN0ZWZhbm8uc3RhYmVsbGluaUBhbWQuY29tPjsgSHVhbmcs
IFJheQ0KPiA8UmF5Lkh1YW5nQGFtZC5jb20+OyBSYWdpYWRha291LCBYZW5pYSA8WGVuaWEuUmFn
aWFkYWtvdUBhbWQuY29tPjsNCj4gQW5kcnl1aywgSmFzb24gPEphc29uLkFuZHJ5dWtAYW1kLmNv
bT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IEp1bGllbg0KPiBHcmFsbCA8anVsaWVu
QHhlbi5vcmc+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBB
bnRob255DQo+IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAdmF0ZXMudGVjaD47IHhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYxIDAwLzExXSBhbWQt
cHN0YXRlIENQVSBQZXJmb3JtYW5jZSBTY2FsaW5nIERyaXZlcg0KPg0KPiBPbiAwMy4xMi4yMDI0
IDA5OjExLCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiBhbWQtcHN0YXRlIGlzIHRoZSBBTUQgQ1BV
IHBlcmZvcm1hbmNlIHNjYWxpbmcgZHJpdmVyIHRoYXQgaW50cm9kdWNlcyBhDQo+ID4gbmV3IENQ
VSBmcmVxdWVuY3kgY29udHJvbCBtZWNoYW5pc20gb24gbW9kZXJuIEFNRCBBUFUgYW5kIENQVSBz
ZXJpZXMNCj4gPiBpbiBYZW4uIFRoZSBuZXcgbWVjaGFuaXNtIGlzIGJhc2VkIG9uIENvbGxhYm9y
YXRpdmUgUHJvY2Vzc29yDQo+ID4gUGVyZm9ybWFuY2UgQ29udHJvbCAoQ1BQQykgd2hpY2ggcHJv
dmlkZXMgZmluZXIgZ3JhaW4gZnJlcXVlbmN5DQo+ID4gbWFuYWdlbWVudCB0aGFuIGxlZ2FjeSBB
Q1BJIGhhcmR3YXJlIFAtU3RhdGVzLiBDdXJyZW50IEFNRCBDUFUvQVBVDQo+ID4gcGxhdGZvcm1z
IGFyZSB1c2luZyB0aGUgQUNQSSBQLXN0YXRlcyBkcml2ZXIgdG8gbWFuYWdlIENQVSBmcmVxdWVu
Y3kNCj4gPiBhbmQgY2xvY2tzIHdpdGggc3dpdGNoaW5nIG9ubHkgaW4gMyBQLXN0YXRlcy4gQ1BQ
QyByZXBsYWNlcyB0aGUgQUNQSQ0KPiA+IFAtc3RhdGVzIGNvbnRyb2xzIGFuZCBhbGxvd3MgYSBm
bGV4aWJsZSwgbG93LWxhdGVuY3kgaW50ZXJmYWNlIGZvciBYZW4NCj4gPiB0byBkaXJlY3RseSBj
b21tdW5pY2F0ZSB0aGUgcGVyZm9ybWFuY2UgaGludHMgdG8gaGFyZHdhcmUuDQo+ID4NCj4gPiBh
bWRfcHN0YXRlIENQUEMgaGFzIDIgb3BlcmF0aW9uIG1vZGVzOiBhdXRvbm9tb3VzIChhY3RpdmUp
IG1vZGUsIGFuZA0KPiA+IG5vbi1hdXRvbm9tb3VzIChwYXNzaXZlKSBtb2RlLiBXZSByZWdpc3Rl
ciBkaWZmZXJlbnQgQ1BVRnJlcSBkcml2ZXINCj4gPiBmb3IgZGlmZmVyZW50IG1vZGVzLCAiYW1k
LXBzdGF0ZSIgZm9yIHBhc3NpdmUgbW9kZSBhbmQgImFtZC1wc3RhdGUtZXBwIg0KPiA+IGZvciBh
Y3RpdmUgbW9kZS4NCj4gPg0KPiA+IFRoZSBwYXNzaXZlIG1vZGUgbGV2ZXJhZ2VzIGNvbW1vbiBn
b3Zlcm5vcnMgc3VjaCBhcyAqb25kZW1hbmQqLA0KPiA+ICpwZXJmb3JtYW5jZSosIGV0YywgdG8g
bWFuYWdlIHRoZSBwZXJmb3JtYW5jZSBoaW50cy4gQW5kIHRoZSBhY3RpdmUNCj4gPiBtb2RlIHVz
ZXMgZXBwIHRvIHByb3ZpZGVzIGEgaGludCB0byB0aGUgaGFyZHdhcmUgaWYgc29mdHdhcmUgd2Fu
dHMgdG8NCj4gPiBiaWFzIHRvd2FyZCBwZXJmb3JtYW5jZSAoMHgwKSBvciBlbmVyZ3kgZWZmaWNp
ZW5jeSAoMHhmZikuIENQUEMgcG93ZXINCj4gPiBhbGdvcml0aG0gd2lsbCBjYWxjdWxhdGUgdGhl
IHJ1bnRpbWUgd29ya2xvYWQgYW5kIGFkanVzdCB0aGUgcmVhbHRpbWUNCj4gPiBjcHUgY29yZXMg
ZnJlcXVlbmN5IGFjY29yZGluZyB0byB0aGUgcG93ZXIgc3VwcGx5IGFuZCB0aGVybWFsLCBjb3Jl
DQo+ID4gdm9sdGFnZSBhbmQgc29tZSBvdGhlciBoYXJkd2FyZSBjb25kaXRpb25zLg0KPiA+DQo+
ID4gYW1kLXBzdGF0ZSBpcyBlbmFibGVkIHdpdGggYSB0b3AtbGV2ZWwgY3B1ZnJlcT1hbWQtcHN0
YXRlIG9wdGlvbi4gSXQNCj4gPiB3aWxsIGZhbGxiYWNrIHRvIGNwdWZyZXE9eGVuIGlmIGFtZC1w
c3RhdGUgaXMgdW5hdmFpbGFibGUuDQo+ID4NCj4gPiBXaXRoIGBjcHVmcmVxPWFtZC1wc3RhdGUs
YWN0aXZlYCwgV2UgZGlkIGEgNjBzIHNhbXBsaW5nIHRlc3QgdG8gc2VlDQo+ID4gdGhlIENQVSBm
cmVxdWVuY3kgY2hhbmdlLCB0aHJvdWdoIHR3ZWFraW5nIHRoZSBlbmVyZ3lfcGVyZiBwcmVmZXJl
bmNlDQo+ID4gZnJvbSBgeGVucG0gc2V0LWNwdWZyZXEtY3BwYyBwb3dlcnNhdmVgIHRvIGB4ZW5w
bSBzZXQtY3B1ZnJlcS1jcHBjDQo+IHBlcmZvcm1hbmNlYC4NCj4gPiBUaGUgb3V0cHV0cyBhcmUg
YXMgZm9sbG93czoNCj4gPiBgYGANCj4gPiBTZXR0aW5nIENQVSBpbiBwb3dlcnNhdmUgbW9kZQ0K
PiA+IFNhbXBsaW5nIGFuZCBPdXRwdXRzOg0KPiA+ICAgQXZnIGZyZXEgICAgICAyMDAwMDAwIEtI
eg0KPiA+ICAgQXZnIGZyZXEgICAgICAyMDAwMDAwIEtIeg0KPiA+ICAgQXZnIGZyZXEgICAgICAy
MDAwMDAwIEtIeg0KPiA+IFNldHRpbmcgQ1BVIGluIHBlcmZvcm1hbmNlIG1vZGUNCj4gPiBTYW1w
bGluZyBhbmQgT3V0cHV0czoNCj4gPiAgIEF2ZyBmcmVxICAgICAgNDY0MDAwMCBLSHoNCj4gPiAg
IEF2ZyBmcmVxICAgICAgNDIyMDAwMCBLSHoNCj4gPiAgIEF2ZyBmcmVxICAgICAgNDY0MDAwMCBL
SHoNCj4gPiBgYGANCj4gPg0KPiA+IFBlbm55IFpoZW5nICgxMSk6DQo+ID4gICB4ZW4veDg2OiBh
ZGQgQ1BQQyBmZWF0dXJlIGZsYWcgZm9yIEFNRCBwcm9jZXNzb3JzDQo+ID4gICB4ZW4veDg2OiBp
bnRyb2R1Y2UgbmV3IHN1Yi1oeXBlcmNhbGwgdG8gZ2V0IENQUEMgZGF0YQ0KPiA+ICAgeGVuL3g4
NjogaW50cm9kdWNlICJjcHVmcmVxPWFtZC1wc3RhdGUiIHhlbiBjbWRsaW5lDQo+ID4gICB4ZW4v
eDg2OiBnZXQgcHJvY2Vzc29yIG1heCBzcGVlZCBmcm9tIERNSSB0YWJsZQ0KPiA+ICAgeGVuL3g4
NjogaW50cm9kdWNlIGEgbmV3IGFtZCBwc3RhdGUgZHJpdmVyIGZvciBjcHVmcmVxIHNjYWxpbmcN
Cj4gPiAgIHhlbi9jcHVmcmVxOiBpbnRyb2R1Y2UgcG9saWN5IHR5cGUgd2hlbiBjcHVmcmVxX2Ry
aXZlci0+c2V0cG9saWN5DQo+ID4gICAgIGV4aXN0cw0KPiA+ICAgeGVuL2NwdWZyZXE6IG9ubHkg
c2V0IGdvdiBOVUxMIHdoZW4gY3B1ZnJlcV9kcml2ZXIudGFyZ2V0KCkgZXhpc3RzDQo+ID4gICB4
ODYvY3B1ZnJlcTogYWRkICJjcHVmcmVxPWFtZC1wc3RhdGUsYWN0aXZlIiBwYXJhDQo+ID4gICB4
ZW4veDg2OiBpbXBsZW1lbnQgRVBQIHN1cHBvcnQgZm9yIHRoZSBBTUQgcHJvY2Vzc29ycw0KPiA+
ICAgdG9vbHMveGVucG06IFByaW50IENQUEMgcGFyYW1ldGVycyBmb3IgYW1kLXBzdGF0ZSBkcml2
ZXINCj4gPiAgIHhlbi9jcHVmcmVxOiBBZGFwdCBTRVQvR0VUX0NQVUZSRVFfQ1BQQyB4ZW5fc3lz
Y3RsX3BtX29wIGZvcg0KPiA+ICAgICBhbWQtcHN0YXRlIGRyaXZlcg0KPg0KPiBKdXN0IHRvIGNs
YXJpZnk6IFdoaWxlIGNlcnRhaW5seSBmaW5lLCBpdCBpcyBhIGxpdHRsZSBzdXJwcmlzaW5nIHRv
IHNlZSBzdWNoIGEgc3VibWlzc2lvbg0KPiBqdXN0IGFmdGVyIHRoZSBzdWJtaXNzaW9uIGRlYWRs
aW5lIGZvciA0LjIwIHdhcyBwYXNzZWQuDQoNClNvIHNvcnJ5Li4uLiBGb3Jnb3Qgd2UncmUgaW4g
ZmVhdHVyZSBmcm96ZW4gd2luZG93DQoNCj4gVGhpcyBpcyBpbnRlbmRlZCBmb3IgNC4yMSB0aGVu
LCBJIGV4cGVjdD8gT3IgZWxzZSBoYXZlIHlvdSB0YWxrZWQgdG8gdGhlIHJlbGVhc2UNCj4gbWFu
YWdlcj8NCg0KWWVzLCBpdCBpcyBmb3IgNC4yMQ0KDQo+DQo+IEphbg0KDQpNYW55IHRoYW5rcywN
ClBlbm55LA0K

