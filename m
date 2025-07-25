Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8044EB119B9
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 10:22:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057510.1425418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufDhF-0005BI-2o; Fri, 25 Jul 2025 08:22:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057510.1425418; Fri, 25 Jul 2025 08:22:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufDhF-00058B-06; Fri, 25 Jul 2025 08:22:29 +0000
Received: by outflank-mailman (input) for mailman id 1057510;
 Fri, 25 Jul 2025 08:22:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Yx3=2G=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ufDhD-000585-JT
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 08:22:27 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20610.outbound.protection.outlook.com
 [2a01:111:f403:2417::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ef8b709-6930-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 10:22:25 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DS7PR12MB6072.namprd12.prod.outlook.com (2603:10b6:8:9c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Fri, 25 Jul
 2025 08:22:22 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8964.019; Fri, 25 Jul 2025
 08:22:22 +0000
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
X-Inumbo-ID: 7ef8b709-6930-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y83QrIOLtbwZCmmhCrvZkSyFTT8nS7BEdxm42p1YObeDBBwgWYUhe61nFr29wvhnvwGrrG/7H+pXlrxgGt8/hWnZqFXwh3LOupC9B1YISUWotPa0R5+/8RECXTMLz3d78yCZG3QzdRyjrIBgLqAEAHbIAeX7vqfPfsrGqR2kOwCydfIltnhGUf8lmYV0Iu6sCU5sl3GIYZELaaeyS84gVfR2JEh6q/qzLzmQMGZMWYB54Eq5sNqm5vxaplzz3F9W/H2yBAbWac2RRoZQakfYK6kAI6PA3Q9u/SicqNK+MEQTrpQidEsuxVzjfE2tXEZtvphDyUNqgpKGhy9wG2Pdbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rH/f+CHGD2JdLy9n3HnDpEupUsb6wHrsO4LdtTflagM=;
 b=gyTIMVCEvMLCtJ076NPjS7OSXMluzlGbOt0Wgel1vdi2PTVeeyjKGSiuc8OtBYIb5lcPM5+SxshrAaUVuYSLOM+GmLqzqytvIUMTcEV56sH1GWaKiwam7c6n+ZhKtLkwEqWw+SAU+JNsvQYul+F4ABGEBv4mGVaalcKxLA1tfwjOL5T74VuqxjjCb1LUAIklrKE8O3KmmZfZYs+cO6ewkmKu4XtF7rz1yPsKZaqWG0P6wIILg6l5yfa5PYyZqaqclx2Z6VvDXP3fd+Z4RjQ6Qh+vrfLq92JGCI+Ywn9sGpGwq/gCBnQH/xw6mnjHKPgF9tW9CdVspb5Hw6qsfrAgNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rH/f+CHGD2JdLy9n3HnDpEupUsb6wHrsO4LdtTflagM=;
 b=CwkgwreVz4mOdc7oL5RuwtqdFA30qv9fs1P2dafOt2vEqAGh9ASBhf5W0VABXKDWVRJUyt1VckEk6MXmgd0xgT2v7l538cHiGwlXEhAju+GHQxdh2KayPsff7r+t68wE/4CSzKPHmCfVoMPsg0hvMP4pzHXl2BeeUTR4BiwChIA=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony
 PERARD <anthony.perard@vates.tech>, "Orzel, Michal" <Michal.Orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v8 2/8] vpci: Refactor REGISTER_VPCI_INIT
Thread-Topic: [PATCH v8 2/8] vpci: Refactor REGISTER_VPCI_INIT
Thread-Index: AQHb/F7fplPhQ29B9EqC0EGcIo+cSrRBVZQAgAFbywD//8xpgIAAiZ4A
Date: Fri, 25 Jul 2025 08:22:22 +0000
Message-ID:
 <BL1PR12MB5849732724DFEE4FF52F364DE759A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250724055006.29843-1-Jiqian.Chen@amd.com>
 <20250724055006.29843-3-Jiqian.Chen@amd.com> <aIJC8qqJM_P-hEAb@macbook.local>
 <BL1PR12MB58494358468BFF892A892879E759A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <aIM7a8fa0XT-nuUI@macbook.local>
In-Reply-To: <aIM7a8fa0XT-nuUI@macbook.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8964.019)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DS7PR12MB6072:EE_
x-ms-office365-filtering-correlation-id: fe3f091f-2b84-4ea0-5966-08ddcb54610e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZDBJd0hJZU5iWGVndldYSXhlNVZiSWpKaE1FWEtqTWZmNHNtREFFNGFtZSt4?=
 =?utf-8?B?RVdtSmdsa21TUWNRL042cnd3cmVVSEdIc1FRZkh2aHlWeG5CREdFQnI5emgr?=
 =?utf-8?B?T3V3c1JoMmNXMjN4dWJ4Q0RPV1dkc0pRQnowYUZtaUZNN21qbEM4MnJENWts?=
 =?utf-8?B?TEU1YWJ2cEtybTY2NkJoczhtczRqWjNkWkdSbDJPcHUyVjRad24rQmhNaUJh?=
 =?utf-8?B?eWU3K0tZVHk1QWxxVDk4WDBBK2JhZG5pY0lwcnB2VkN3bU5HZjdydEFib0lI?=
 =?utf-8?B?S1JWNHhxalFGNTFVY2w2cjEva3E0dFRCTTEzN2FZSlpmQjVvSjdBemlkeTJK?=
 =?utf-8?B?ZStqMHN2NHFIb3FncytNb1RhQ2NjdFJ3MVZlUVU2NVh1dE9IK1BacEdWaUZk?=
 =?utf-8?B?N25SUW5yS0tMZUE2dHp5QmR6djAxYXBNYkNEUHZKUmcyZENSZGlBa1pyOS9z?=
 =?utf-8?B?WUo1T3FOalgvRFdMT0dxNmxGbzhOSkw1NEIvQ1hPajUyaU1VSzR4ZVpXL21V?=
 =?utf-8?B?Z3R6RGpaRFY3Vkp4c0YvVW1rdk55bnJUUGRMZWdUaVJPdTc5MkJHRjZxeDFX?=
 =?utf-8?B?MTBTUE9pTi8zMkM0MVhBeWpqZm1SNFh0NmR4Qi9rODU0L3lTYVhCU2tyb2NI?=
 =?utf-8?B?YTByaVptbThtZlB6djY3UUNqeGFEd085MGFKWlR4NEs4bUc0czNpemJpL0VU?=
 =?utf-8?B?NVhQdVlTOEUyS01KQis4aE9KT0lvdnRqb2YzUHRoOUtDREdrNUNLSnNrbUpS?=
 =?utf-8?B?V2tVZTNvQ0Q1d3dKMmluTHE0SGg0UDBtN2VXWmM2N3h0VGEyT25XYmVlQmxG?=
 =?utf-8?B?Z3kzeGxyQUU2SFcxcU9wRGVKQXYzR1NWYUMwWSs5M01wRzBJRmE0eXBkZGI0?=
 =?utf-8?B?YlBYYzVlNU5YdStjUHpvcU9vZW9mdWg0cG4yd09jS1JWVzRhNXlMcWMvQVFk?=
 =?utf-8?B?cTNxZFQ2VndQcXE3dDdBTXZFb29oS0x5bTJYSmdlbEJGQkdqaVJSdEZPZ0d3?=
 =?utf-8?B?Q3BRM0dQdHowYnhuMjlrTUMvVHdBV0h2UWM2N1VYWDVtQkI1djYzZ0trblpF?=
 =?utf-8?B?N2NHTkdwRTQ1K0ZaQi80RkQ4eFA4dzRNa09GTlYyd1g3dlZCZVZsTzQyWWU5?=
 =?utf-8?B?aHdjWVNNVWhoZExHSkttODFuRDJwZG9wYzlVSkRXaklkY3U0SUhVVVVzY09h?=
 =?utf-8?B?SjVNMUhEQWovT3prbFB3RlZYbFlDK05IeTRUVzJiQ0FTdmptYkd0THR5WnVy?=
 =?utf-8?B?bmMvSkJLdmF1OUxNdnp4MEFOVDhqay9kRnNYVUFUUnExb2tycnp0cXpzdHM2?=
 =?utf-8?B?RUlUUkkwSTNqaWxpeGM1dEhXYjZ0cFBWaFlSL0pRSnpKVGQzR0lIWGJmUEN0?=
 =?utf-8?B?SDg1UzFIbHpXOUI1ckxHbGxCdC80OUcxaVlPUzV6d2VPcm0vTklXeFg3WWFa?=
 =?utf-8?B?OUNXMjYxWXVCZGtXS25kb05qM0liaHh3SGxSUklYUTQ3NjVoZEg3QTFTckV1?=
 =?utf-8?B?bVl6Tk9lSGRmWDRDQXY0a0Z3WmJxdThkbG1sd0huVERkTzZSdkNrRUIvK015?=
 =?utf-8?B?R1dvNjdONnhhc3FodHhxdmZKZUlFcldOSWJPR3JwL0FBR2Q5SERrVlFITFA3?=
 =?utf-8?B?b04ySXVvYlVKZmpyY1Jyc2oyTDFZaGhPUXNGUWdGRVJFay9VVGpHUE1wNXMr?=
 =?utf-8?B?cEFCaG96U2NWWlV3U24vQ1RHdW1UdCs5aUxWOFlhVXMxRFRRMS9ZYmFKWE5x?=
 =?utf-8?B?djF6a0d4Wm1udVE4TzdxRXlFczVxbGhlendSTDRVTXhnNmF6V055TmpQSVpy?=
 =?utf-8?B?ZVJhelFYYTRnNkJqdk1TZXlVYnJUbFBSQ0hYajUrNFlPbnk2Y1pmRFNWd04y?=
 =?utf-8?B?bFlkbVZzU3ZsYmFjVUluTU8yaktQeHBOdDgzL0lkcENyVWtEYVdlc1pWaHdl?=
 =?utf-8?B?RU9vWkV4dUQrL2kvbVVtcHMyYkh2bkJLeVVoSVp0aDRQSlZjS1lyUkdsalVy?=
 =?utf-8?Q?ZMkgvvbGDItlHdkl0SRxWiJz95qPlk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dStyM3c2RmRpVWE1N1JLMXErMW9ybGVaMkdTbEJpS0RKcWFYK0wvd3ZnRllB?=
 =?utf-8?B?Zlp1YWd5NzZqU3g5QzFUcFROUFRhc2VDSmI0Z3MrcWs0bjR6V1dpeHN6enE4?=
 =?utf-8?B?cEltb0pwQnJwNXpac250azRWSlI3bGQ1eWl6R0F3c1RTUXR5UjMvdVh3TjJl?=
 =?utf-8?B?MmFzTGxFTVk0ZE9KVGZERnRLbVJ0ZXBVQzlQdFBVWjF3T2NwaXFOQ1ZtV0Vj?=
 =?utf-8?B?TmkvOGVjbWZCWVIzWE55RlNVTUxITW9HRElUaGhNMWd6SVZvTHpvQkF4UnNw?=
 =?utf-8?B?eVRkUUViakpZeDQzRWtWNHRwRWNkMXBEWUxzb0Q1b3kyK0oxcHcrK0YyY0Yx?=
 =?utf-8?B?SG9IbFlieTFyNERabXdZT2VYM2lTUE8vc3FQdDFBTEZmN2JJVHRScTZFOXc5?=
 =?utf-8?B?dDZoZExuWndER0Zla0ZEK01jTEhSazE2dlhSb0lFU0FiWXlhTlN3NDNya0lE?=
 =?utf-8?B?MjBnTm1WaGhXSmNGU1VCMnd4enpaUEw3SHFjbEJNdkJ2TnQ0RDl0YW03YzJS?=
 =?utf-8?B?cUZQYmZoMzFZWmRkdnF0VXFxdy9oYUdZbWZHL3QxRUdwVjgxaG1TcFRZRUJr?=
 =?utf-8?B?TVdWejJuMXNIcXRLdWhFL3hSNlQ1QmNqNEZRdEtsWFY1QnRtMHcraVByZzN5?=
 =?utf-8?B?WENPTkU5RDBkNFc3Tmw0c3IyaXZCaElNNDhneS83VDdHNzNFWEZUQ3lLaWlp?=
 =?utf-8?B?cGY3SkhvOS9TMVFoajJzWVIwUG9qRE8xb2lxa3FNUXZPN0NkcVhNMnF3M1dw?=
 =?utf-8?B?UTBYMlUrb1Y4WVE0MTFXS2xwZStXZXpGSWhxeUd3KzRZQm9LaXZHZzJuR1Jo?=
 =?utf-8?B?Ky9jTHhWZEtYWUhnQitWdUpmbmpiY1JRMUxtR2tVaTRua2NScy9nYlFNK1hm?=
 =?utf-8?B?WjlmYitKVC91dWNteUQ0V2VrYzk1cGRnNlg1SXJZcVN5NDcwYTI3L1FYbENx?=
 =?utf-8?B?UlArVm1aVmFCK3IvQ1lYRWI2cEI0THM2ZlhyWmhWV2ZyMWRTTWVlUUxlYlhY?=
 =?utf-8?B?N2pBSHQ5TTNmZy9qN1MwQkhsSHNWQXhIaXlTRmdhSndCZmN6Z3ZVL2dEQndV?=
 =?utf-8?B?Ry9HcWx2aGc1MTNHZXB4c2VVSFBRWndhckc3VzRzZU5mWE4vNVlOMzhTblUz?=
 =?utf-8?B?VGJFMWFvVFZKNDBkRGYwVFVxaW1EOHYxWEdqWmVMT3g4ak9vdFBVeWtuZjM4?=
 =?utf-8?B?MVl2aU1mMUpqUGpwNTdwcUpKZXlsV1lPbFNmSE0wN3JRUDhJcm9oQmZuVjlw?=
 =?utf-8?B?Z3h5emRCdmU1bzBnKys1NXp0ODdKMEtHMlQvSjIzcTYrOThueFl4cjVIbTdS?=
 =?utf-8?B?aXpFa3R4VjZUZldxbnZCZUhWdms3U0gwOElabktPeXI5UzAraHdoVmlFeGJE?=
 =?utf-8?B?d3VicEM5VXJHR3JWeG9UMUZSRmRYUTVGNTFRNG1GdTMvaVFYOGlGL0FkVDlv?=
 =?utf-8?B?YmRKcXYycUkyTHFvRjB6V1FaSHBYRzRmS1JNZXFxbGYyNU5XMlkremxNNUpP?=
 =?utf-8?B?cTkvd1hnNW53NVpoaWFVQ0plVG9HYUFFQTNoUU82NFVGaGw2T2tQVFF3bFlO?=
 =?utf-8?B?b3BtM3lybTBEUEJ4UzYvRkxkSWFZeHZKc09FUmYwc2FZY0s3MlNQR1E5bFd4?=
 =?utf-8?B?c2QyUklVWG1uS0FVZ284Y3M2N3dmWUhTMTFJMWxVWlhvYjZKbUxWUzlQNEdU?=
 =?utf-8?B?V3V1cnJKUU14di9TS1k4QXJxTnZMdTZRVzdaQzRRRnRONkRIL1pzcUsyOU4x?=
 =?utf-8?B?YVNucWR2YkFpWlAxaXVJNWtlOFJ3NHhtRTVTQ09YcGc3cHRpTHVvalNHK1Bw?=
 =?utf-8?B?VFRXZ3VmTzhkMDNoUnNvZis4bUtaV2x4Y1lGRXlmSzNDNXlTN0kwMWQxWjVs?=
 =?utf-8?B?UnBjWWtrcUpXTnpUc0NyMkRuSEJVTG1EVXJrYmV2L2NmRyszMjUxcVdvVlZY?=
 =?utf-8?B?eVkyV21jRUhZSVM0TVd2NUI4R05kbmpVZ1FjeSs2M3FIcHlFd2p2WHJ6am4y?=
 =?utf-8?B?aVIvbUVqR0N5UjU3RHJqTk9Ob3k1cGZMSXNMTGFjVlVpc3dCRWpsTlRyOVpW?=
 =?utf-8?B?cGh2clVCM1hBWXluZG9YZk9zRGZZb21Wa1FUSmtRZElIdmp6TisycEJQaUtZ?=
 =?utf-8?Q?THE4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A33AADFC60E73748BE91F52F17FC7C0B@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe3f091f-2b84-4ea0-5966-08ddcb54610e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2025 08:22:22.2464
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gf+shKhKSyt6VEcDSHMEwzw7GhEZFumPbXiNG8DZXXPaLCPHCEyaprI213la/WNf+k5XhyAyNSUG6TWym+Cj+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6072

T24gMjAyNS83LzI1IDE2OjA4LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBGcmksIEp1
bCAyNSwgMjAyNSBhdCAwMzoxNToxM0FNICswMDAwLCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+PiBP
biAyMDI1LzcvMjQgMjI6MjgsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4gT24gVGh1LCBK
dWwgMjQsIDIwMjUgYXQgMDE6NTA6MDBQTSArMDgwMCwgSmlxaWFuIENoZW4gd3JvdGU6DQo+Pj4+
IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy92cGNpL21zaXguYyBiL3hlbi9kcml2ZXJzL3ZwY2kv
bXNpeC5jDQo+Pj4+IGluZGV4IDc0MjExMzAxYmExMC4uZWIzZTdkY2QxMDY4IDEwMDY0NA0KPj4+
PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL21zaXguYw0KPj4+PiArKysgYi94ZW4vZHJpdmVycy92
cGNpL21zaXguYw0KPj4+PiBAQCAtNzAzLDkgKzcwMywxOCBAQCBzdGF0aWMgaW50IGNmX2NoZWNr
IGluaXRfbXNpeChzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+Pj4gICAgICBwZGV2LT52cGNpLT5t
c2l4ID0gbXNpeDsNCj4+Pj4gICAgICBsaXN0X2FkZCgmbXNpeC0+bmV4dCwgJmQtPmFyY2guaHZt
Lm1zaXhfdGFibGVzKTsNCj4+Pj4gIA0KPj4+PiAtICAgIHJldHVybiAwOw0KPj4+PiArICAgIC8q
DQo+Pj4+ICsgICAgICogdlBDSSBoZWFkZXIgaW5pdGlhbGl6YXRpb24gd2lsbCBoYXZlIG1hcHBl
ZCB0aGUgd2hvbGUgQkFSIGludG8gdGhlDQo+Pj4+ICsgICAgICogcDJtLCBhcyBNU0ktWCBjYXBh
YmlsaXR5IHdhcyBub3QgeWV0IGluaXRpYWxpemVkLiAgQ3JhdmUgYSBob2xlIGZvcg0KPj4+PiAr
ICAgICAqIHRoZSBNU0ktWCB0YWJsZSBoZXJlLCBzbyB0aGF0IFhlbiBjYW4gdHJhcCBhY2Nlc3Nl
cy4NCj4+Pj4gKyAgICAgKi8NCj4+Pj4gKyAgICBzcGluX2xvY2soJnBkZXYtPnZwY2ktPmxvY2sp
Ow0KPj4+PiArICAgIHJjID0gdnBjaV9tYWtlX21zaXhfaG9sZShwZGV2KTsNCj4+Pj4gKyAgICBz
cGluX3VubG9jaygmcGRldi0+dnBjaS0+bG9jayk7DQo+Pj4NCj4+PiBJIHNob3VsZCBoYXZlIGFz
a2VkIGluIHRoZSBsYXN0IHZlcnNpb24sIGJ1dCB3aHkgZG8geW91IHRha2UgdGhlIHZQQ0kNCj4+
PiBsb2NrIGhlcmU/DQo+Pj4NCj4+PiBUaGUgcGF0aCB0aGF0IEFTU0VSVHMgdGhlIGxvY2sgaXMg
aGVsZCBzaG91bGQgbmV2ZXIgYmUgdGFrZW4gd2hlbg0KPj4+IGNhbGxlZCBmcm9tIGluaXRfbXNp
eCgpLiAgSXMgdGhlcmUgc29tZSBwYXRoIEknbSBtaXNzaW5nIGluDQo+Pj4gdnBjaV9tYWtlX21z
aXhfaG9sZSgpIHRoYXQgcmVxdWlyZXMgdGhlIHZDUEkgbG9jayB0byBiZSBoZWxkPw0KPj4+DQo+
Pj4gVGhlIHJlc3QgTEdUTS4NCj4+IFNvcnJ5IHRvIGZvcmdldCB0byBkZWxldGUgdGhpcy4NCj4+
IEZlZWwgZnJlZSB0byBjaGFuZ2Ugd2hlbiBzdWJtaXQuDQo+PiBPciBJIHdpbGwgY2hhbmdlIGJ5
IHNlbmRpbmcgYSBuZXcgdmVyc2lvbi4NCj4gDQo+IENhbiB5b3UgZW5zdXJlIGl0IGFsc28gd29y
a3Mgd2l0aG91dCB0aGUgbG9ja2luZz8gIEkgdGhpbmsgc28sIGJ1dCBJDQo+IGhhdmVuJ3QgdGVz
dGVkIG15c2VsZi4NClllcywgYmVmb3JlIEkgcmVwbGllZCB0byB5b3UgbGFzdCBlbWFpbC4NCkkg
aGF2ZSB0ZXN0ZWQgbG9jYWxseS4gTVNJLVggYW5kIG90aGVyIHRoaW5ncyB3b3JrIGZpbmUuDQoN
Cj4gDQo+IFRoYW5rcywgUm9nZXIuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4u
DQo=

