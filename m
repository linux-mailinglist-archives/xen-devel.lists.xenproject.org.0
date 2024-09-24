Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD207983C82
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 07:52:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802345.1212552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssySZ-000884-9J; Tue, 24 Sep 2024 05:51:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802345.1212552; Tue, 24 Sep 2024 05:51:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssySZ-00085G-4J; Tue, 24 Sep 2024 05:51:39 +0000
Received: by outflank-mailman (input) for mailman id 802345;
 Tue, 24 Sep 2024 05:51:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s02B=QW=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ssySX-00085A-9P
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 05:51:37 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20621.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e1aff57-7a39-11ef-a0ba-8be0dac302b0;
 Tue, 24 Sep 2024 07:51:35 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by MN0PR12MB6080.namprd12.prod.outlook.com (2603:10b6:208:3c8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Tue, 24 Sep
 2024 05:51:31 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 05:51:31 +0000
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
X-Inumbo-ID: 0e1aff57-7a39-11ef-a0ba-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q0dXygk5Whu2Ae8c1Z8MLWXD3T4hnHCFiBV7j8/jP5AI3MWTWffAbaGODL7qAjZ8p0vFFCplHMFuWWoRJaNqc52/HXQzSeu83cBKN0zR1hibpHD7iV7E95HmOTkDoPy/PH6Pe32zwjmNcLSm83qkSwHF9zITugM8LRkNWrk1cwAN0XwP5wY/Qqq9mT64IyFLxRlwQjE3v9VSJgdVKnIhtWb47HkJCkOPeKZ/6ehjUiY6VDH2eLoZCOY1pjycokwZ/uQpcHhAkwfyZkTb2MJC5+hSeHtFb6eK7K2zD/Q3vPSDtXsopZxJwXDq+mfxXdFxofDcehfINWvZeQFgPU4Now==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJSy4oH3kWcn1cnHHYEThBsIVo9chggkLQ/Ut9xtudI=;
 b=nFMJtF8G5lXCUEf8mk94luXcOXitsdoA//1Lwi/iwRHlw7PS8OxnDDMeqBD6DcOFQRmX5doZHLmzOR7xAnsV3USLY+XFgqG1+z9kpX5Ioq3KCNzUb+ysZXD1YDeBFqpGokhZ8h3Ms2YpIdvFM6Am3zb8yUWcFkiIw+Kl/dFi8BTz3iKsaqR91qB0MhzYrkU4ltig2gtQFLGudFasjIAIiR20GFQFiEaKHzZ8kTY805cd318tZ13M72luYXbTQJNnaQy0YESNo5qjj3LHfTWUlRO9LpVebpRnbw7SJ4EOI35Br2n7TfJ97TgXUkDOik093binAJxaOOv9XtDPrSfY+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJSy4oH3kWcn1cnHHYEThBsIVo9chggkLQ/Ut9xtudI=;
 b=OqhmpiYoAjaFWe42Xoaf+VjDu0W545tp9K6thfL9pIlyBUP6qFyMguUPhPqJ7eI3Lgeo6qj86eJCCRl//IoBtpEWfrPCNoZHclhHtW2IWHiP2oM5Oj3+fESGhgmzqWnQty1VtjJ9uwO26uGmT5BMcOO3tOw89InwZpBvBiUN/Gc=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [KERNEL PATCH v9 3/3] xen/privcmd: Add new syscall to get gsi
 from dev
Thread-Topic: [KERNEL PATCH v9 3/3] xen/privcmd: Add new syscall to get gsi
 from dev
Thread-Index:
 AQHbBPWV6HQNxY6g2kiLkMH0yIgtQLJeMAAAgALIrQCAAEJugIAEN2gA//+gP4CAAAGmgIAB8s+A
Date: Tue, 24 Sep 2024 05:51:31 +0000
Message-ID:
 <BL1PR12MB58498F3F9B386B371B523647E7682@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240912092352.1602724-1-Jiqian.Chen@amd.com>
 <20240912092352.1602724-4-Jiqian.Chen@amd.com>
 <alpine.DEB.2.22.394.2409181522080.1417852@ubuntu-linux-20-04-desktop>
 <BL1PR12MB5849DFA05D02F1BD9A416122E76C2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <alpine.DEB.2.22.394.2409200959400.1417852@ubuntu-linux-20-04-desktop>
 <BL1PR12MB584987F7DF08909143AC0E21E76F2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <1cc89abe-3744-4c35-9d78-070e58d6836a@suse.com>
 <a7d2a3e8-e2f1-4175-b74c-2e27a909c25d@suse.com>
In-Reply-To: <a7d2a3e8-e2f1-4175-b74c-2e27a909c25d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7982.022)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|MN0PR12MB6080:EE_
x-ms-office365-filtering-correlation-id: ffc07048-6a23-4cc8-e5b8-08dcdc5cf09b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?U2F3V1pJaWNVaThmUE9DcXhQbGxqWGJjVS9qV042cHR3L2s2WU9zSUlxaGRo?=
 =?utf-8?B?aS9kVVNkeFFaU2FZUVdNeFdiaWx1alRleTFVN3ZsbWUvQzRnTW5LbHdiU0gv?=
 =?utf-8?B?bk94VXFhL0lPVXFFVk1qZm9xTXQ5dnZHM0JYTDliWnlXYzlnUmdCQTJqYi9L?=
 =?utf-8?B?RytCZlpwTk5yZHRUK1I5TmtwcmVIZjJpRDNxN1NjTjRyMW54YSt0U2ZQeWpZ?=
 =?utf-8?B?emVzVWRJZTFoaHZUYUhTd2NjYjgrRWF5U2FkM25FdG9vUVcxWmw4MDV3TUhY?=
 =?utf-8?B?Vjd3aG9uRjJLeHBTa3JsVjlLLzh0NGZVZnVPQXI2b29NbitjU2NVZi9hWnRn?=
 =?utf-8?B?Z0hyaGJJUEU2eW51MUFwdG5WRXFuNU1oL3NJTzFPTXBFcWtRQjFkZ3lVM01l?=
 =?utf-8?B?Q0RGUlZ5RGEzT3BPRkk0akl5RjZZV0hVSXRoZ0d6bEhHOU01L3lmdk8xV3Zo?=
 =?utf-8?B?L3NWZXptVEhnY0FzaWhXVzVvb3hRR1JETFlkcTFZZldMbng3K3hzTHZrU2VG?=
 =?utf-8?B?TU5hOUtVNi9uV28wdC81NjJKY2RZcVJXSko2c1pJTTR1blhsUzZrYW0xMnBl?=
 =?utf-8?B?dThlUlJjZDc1dEQ4ZDJBLzJJay93cEpJdEZNekk3OXVWdXRjYit3dXlKak15?=
 =?utf-8?B?WEpqcVpNWnYrRWZxRnMxMGVVenpXQ1hicGpLcHlydnd2a084YVJmUmVlVGdm?=
 =?utf-8?B?bkFqY3NmS2lPcGwxU2Vab09qelRRVG9OcWQ3aGZScWlvRUxiOHNqV1ZvelhV?=
 =?utf-8?B?bkpBUXV4cjZyUmExOTVNY1dVYW12N3hpTkI0N0NNZGxTeXBUQWVDeTVpMVRr?=
 =?utf-8?B?U0syb2NTekZkWnZNNlBaVjNzRHN2VGtOZkZ3ZW9BMWxEaW9qQ1QwOWE4RHlY?=
 =?utf-8?B?c0xrZEU5R2ZBejJqL2FmcENZemxoeno2K25sRHRQYUdzZkVrVmtyR3Y2SllV?=
 =?utf-8?B?VmVQaTlFRVg1blIzbVE0cVNtdkVJcGxtSkZ2NGpwOHNSbEx2Qm9rcVU4eENI?=
 =?utf-8?B?ZDlkd01wUXUxTktCcGdMY0paQ3d0Q3lCS2Y2enNacC9PL3FRcThWOXJ1dU0x?=
 =?utf-8?B?U3FxcEo5Ry9KK3hSKzd0Z1hHMlBTVVdaYjZMMWVLMTJVNHorMlNFSmVpNjF6?=
 =?utf-8?B?VjJlSlh0blZnbGZBc0o5UkloQks5ZndTVkJnUnVpTnB0SSsxQ1l2bnh3Vjhh?=
 =?utf-8?B?VW03Y0JqemVZY1R4ME5vdUxrRktzNGNoQzlOdFNGTzkyM0ZwdTcvOGtyR3k2?=
 =?utf-8?B?YVlpWmh3Z3YyUVVxN0ZRRjJGNXBIZFpEdFlwNjBCTzd1bVd6eWl5RFR3dWFp?=
 =?utf-8?B?cjJCQVhocWtXY2lGdWtFUGNhSjIvM0RIbGZaT2tSVmswa1pJOW5wQ3FtYXlD?=
 =?utf-8?B?YU5nczJ6NHVLOXRrc2F5c3JhU2pYWjdvMWhkdGRGRS9wV2tQZE4zMER5NVBh?=
 =?utf-8?B?TndvNDV5VXVrc2k2YXpzSGhJQUcwczMrMy9iRDBLZVhNaGtqTWVKR2pVdzNQ?=
 =?utf-8?B?RThpbHhJejM1UzlqdHNPb1gyMm55dGpmdHc3MFozYUh0bW85bS9iV1pEVWY0?=
 =?utf-8?B?VTVFTFI2amRxR250S2ZMbG5ZeUozaHV4Y0JBV2V0c1ZnVjZ3aDN4cHgvdTRE?=
 =?utf-8?B?d2cvL3hqbE5wMW90bnlZeDh4TFg4ZHVIeTZjNEZPK0VOY3BQVzFkTmdvVVJY?=
 =?utf-8?B?cWRGQTgvT3AxR0hlYmtFcW1jWUpxMDhLZUtQU3M0aG8xQ1lpak01M1E1clFa?=
 =?utf-8?B?bEpwSVptMmJYQ2huSHcybzUxSjlpZ01vNkp2WC9xMmV2ZENZdnlZZTNhK0Mr?=
 =?utf-8?B?bW91bFFYUkdNRzY1TThNK2t6Z2tCdzhuQlBRUVg5Q1gwSDJVcll2c2oxQk5W?=
 =?utf-8?B?NFRlc3BaZllEdldsaGRGNFNrd3lqWlNPZUQxanJYcUpZdSsydHJmS2I0d2NR?=
 =?utf-8?Q?0/cqewB4CQQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z09NcGxxTHhTUjVpUkYwalZkc0oxejR6RXRaaTZsRUl0aGtpN0VnSGVhZ3gr?=
 =?utf-8?B?SEFLTXU4T3VPdDFxQTNwZTFZR0lUYXE1R3gwMHdzNUhRb2w2SVpsNmVBZWF4?=
 =?utf-8?B?TnQvWS9QL1dOM2crNXI4dW1ubEFuUWJiSHFnRzlIZVh5SXN5RjlISFduL0Yv?=
 =?utf-8?B?b1R3UCtDZFozMjFXS3VIUjZxblV2VjNrKzZBenNPV3REVEpsZFdkZ1dtclhF?=
 =?utf-8?B?dEw3Ym9MZFBJTzdhSUFOeXBrNzhXTU9saVNmRy95aGRyVzR5dnVZOUZsK0RS?=
 =?utf-8?B?MkZEMWRTT1FoeHlMSXc1NzRvWFFtWTNvMmRMbk4rWU5BOFFvSXhJbXRlWmR5?=
 =?utf-8?B?RlliYlZKTWY1TjdNcklHOGEwbmdteHF1WXlPbVJaYWJsKzhqdE9FTEVnUUhv?=
 =?utf-8?B?aDA1OUQwUjZSOEJqcWZiTzF5TlYrUmx0UlM4aEdPOXRURlg2T1lUV2p5MzAr?=
 =?utf-8?B?QU5MNHNSSHZ3dkxQTHI5T01sZldjdXFlcExnRFBNVHFQa20zb0JMemFZSnR4?=
 =?utf-8?B?Q3djM3pZWkVtdGJ1Qm5kc3M1TjFJcS9KZjJqc1h6MTVVdzAwNUl3RVFIaDlD?=
 =?utf-8?B?U3YwTS9tNkNyN2Q5QXZ4NDd2SXBuTlV6S3oyWnZhcDNVOVEyaitsdGIyWXB5?=
 =?utf-8?B?QWxBVFpLUHdaa1BKOVB1Uk5FanI4Ymo5QVRmV1lYaEtqRHVRWGk1TmlTMGM3?=
 =?utf-8?B?YXpQcGYrbWFHMmI3UFprZFlEU0xjSzVvVkNWK1psY2FzbStYN0RMNGVGNXFn?=
 =?utf-8?B?TjNxL3hJMm9yanJsejlXRUZxM2N3RFVybkZkNGx6a09Lb0xwanFHK3NucFZ4?=
 =?utf-8?B?N29JUHcwekRCN0x4YjQ0MC9GTXVsNnNHSkNpNlhlbStVRHFTKzZFdWk3RmNl?=
 =?utf-8?B?WC8rSHhjeURXWiszRHdWM2xwMUxqOTZQSlFlTjNWUitZY3pabExoUWR4N3g1?=
 =?utf-8?B?NFdTcTBFQStOTnhJblAxOVMvU2FaUCtRMHFGbTg4RExZTUx5aHZKSndMMDhN?=
 =?utf-8?B?LzhibWdNcnF3TlFyRURwdmFLWHBxWEhZUThWeUhHUkFOcS91dmd4ZndhVFFM?=
 =?utf-8?B?VFpXdlJiUXpOV1VwaThUajVGb0ZFajdlNW5DNTk2RjBjU3JDTzNST25sSWhl?=
 =?utf-8?B?c3dldEpYV1pEdVR0dFlvRVVBaHlXVUhDMmhibzBEdXJ0QlRLMEE0d1NhVzVB?=
 =?utf-8?B?RzFvdUlYcWo1eUtSaGlFZnBhb3Z5aHVDUWhIK0ZwMTh0Z0tBdmlOMnNTSmFI?=
 =?utf-8?B?cmdvUVl3M1VZTlI0TWxET1NvK3ZTa3FLalVhanowNnBBQWFORFZvdHc1OUI4?=
 =?utf-8?B?bDFBcFREeTVHNnRhbW5PZXRDZktMZVJRUnNlaFk1QkRnNk1zakdWd1dzZFZ4?=
 =?utf-8?B?RzZIRzF3UmVYWkxoR1IxclAvRzNIVmovK1pCVWFMRDJ3YTNmTEg2eDIyRG1R?=
 =?utf-8?B?NnhWcFlTRkhleEo0OEN3M0xvb2o4MUJOQ2lLR2NBWTgrWEUzaGRkcG1mMUNZ?=
 =?utf-8?B?Nk9TWDhRaGh5OGJ2M1A3Q1ordHd4S3hNSEJjM3ZCbXpwYmdBYWE0SXFMajBn?=
 =?utf-8?B?U1lQRVFJRW1udUZyN3NmZm81eGhacXhQZVBkWWxlTy84Sy9YS1pPMXFRRjRx?=
 =?utf-8?B?STNWdUVGZjQyWlVTL0tFeThCMnd4L09TN3o4WTh6ZDA5d2tNcTl4a3FiMFVI?=
 =?utf-8?B?b0VwZm1JQUw4enVidUpoQkJtOHhQUkVGZXpxOEdtUiszWlo3RGc4OGQ1K3E0?=
 =?utf-8?B?UVBUaElXNTBMcjNxeXR3aGNmQXo0dHUzZ1ppQ2RzUk1tUXYzekNFR1lWUW5Y?=
 =?utf-8?B?TGNFbnZFTjI4N2VXRHNyRS9Da3dtMkNyNms2aHV0R3ZFUVVsRkt3VitFMEV4?=
 =?utf-8?B?YVNmc1crVmFUMHNMdXR5OWdsVW93MFd5YWVPVUpXTDlIVFIrTyt1QldYRUJl?=
 =?utf-8?B?VFNQNHZXckU5U21VSUhqNnFsWHBoQ3haSnBxUWdPaEErWHpwRFF1RkJiRFV3?=
 =?utf-8?B?SERQZGJXQUFUK0oxTkZ6d0V0ckwvbGNXU1J2MWxZUGM4ZG9NRVdVaytxcFQv?=
 =?utf-8?B?SUNtZ0FheWdqUnpNUSsvNWFQd29GcCtQMUgzQXhUQnBBMWVYU3dEQkQwRUJw?=
 =?utf-8?Q?ck0g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5BB6FDB573B13042A8F5817A641329DE@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffc07048-6a23-4cc8-e5b8-08dcdc5cf09b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2024 05:51:31.1179
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: srXK/G0vfzwkSMeXXW1N1/ghAnrTvUrNkubpBqfWV4G80oaH8PZiNY7zWuK6vaK1kXPHRxSw8HDvEHbxYjGpHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6080

T24gMjAyNC85LzIzIDE2OjA0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPiBPbiAyMy4wOS4yNCAw
OTo1OCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+IE9uIDIzLjA5LjI0IDA3OjQ5LCBDaGVuLCBK
aXFpYW4gd3JvdGU6DQo+Pj4gT24gMjAyNC85LzIxIDA1OjE3LCBTdGVmYW5vIFN0YWJlbGxpbmkg
d3JvdGU6DQo+Pj4+IE9uIEZyaSwgMjAgU2VwIDIwMjQsIENoZW4sIEppcWlhbiB3cm90ZToNCj4+
Pj4+IE9uIDIwMjQvOS8xOSAwNjo0OSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4+Pj4+
IE9uIFRodSwgMTIgU2VwIDIwMjQsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4+Pj4+PiBPbiBQVkgg
ZG9tMCwgd2hlbiBwYXNzdGhyb3VnaCBhIGRldmljZSB0byBkb21VLCBRRU1VIGFuZCB4bCB0b29s
cw0KPj4+Pj4+PiB3YW50IHRvIHVzZSBnc2kgbnVtYmVyIHRvIGRvIHBpcnEgbWFwcGluZywgc2Vl
IFFFTVUgY29kZQ0KPj4+Pj4+PiB4ZW5fcHRfcmVhbGl6ZS0+eGNfcGh5c2Rldl9tYXBfcGlycSwg
YW5kIHhsIGNvZGUNCj4+Pj4+Pj4gcGNpX2FkZF9kbV9kb25lLT54Y19waHlzZGV2X21hcF9waXJx
LCBidXQgaW4gY3VycmVudCBjb2RlcywgdGhlIGdzaQ0KPj4+Pj4+PiBudW1iZXIgaXMgZ290IGZy
b20gZmlsZSAvc3lzL2J1cy9wY2kvZGV2aWNlcy88c2JkZj4vaXJxLCB0aGF0IGlzDQo+Pj4+Pj4+
IHdyb25nLCBiZWNhdXNlIGlycSBpcyBub3QgZXF1YWwgd2l0aCBnc2ksIHRoZXkgYXJlIGluIGRp
ZmZlcmVudA0KPj4+Pj4+PiBzcGFjZXMsIHNvIHBpcnEgbWFwcGluZyBmYWlscy4NCj4+Pj4+Pj4g
QW5kIGluIGN1cnJlbnQgbGludXggY29kZXMsIHRoZXJlIGlzIG5vIG1ldGhvZCB0byBnZXQgZ3Np
DQo+Pj4+Pj4+IGZvciB1c2Vyc3BhY2UuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IEZvciBhYm92ZSBwdXJw
b3NlLCByZWNvcmQgZ3NpIG9mIHBjaXN0dWIgZGV2aWNlcyB3aGVuIGluaXQNCj4+Pj4+Pj4gcGNp
c3R1YiBhbmQgYWRkIGEgbmV3IHN5c2NhbGwgaW50byBwcml2Y21kIHRvIGxldCB1c2Vyc3BhY2UN
Cj4+Pj4+Pj4gY2FuIGdldCBnc2kgd2hlbiB0aGV5IGhhdmUgYSBuZWVkLg0KPj4+Pj4+Pg0KPj4+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKaXFpYW4gQ2hlbiA8SmlxaWFuLkNoZW5AYW1kLmNvbT4NCj4+
Pj4+Pj4gU2lnbmVkLW9mZi1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4NCj4+Pj4+
Pj4gU2lnbmVkLW9mZi1ieTogSmlxaWFuIENoZW4gPEppcWlhbi5DaGVuQGFtZC5jb20+DQo+Pj4+
Pj4+IC0tLQ0KPj4+Pj4+PiB2OC0+djkgY2hhbmdlczoNCj4+Pj4+Pj4gQ2hhbmdlZCB0aGUgc3lz
Y2FsbCBuYW1lIGZyb20gIklPQ1RMX1BSSVZDTURfR1NJX0ZST01fREVWIiB0byAiSU9DVExfUFJJ
VkNNRF9QQ0lERVZfR0VUX0dTSSIuIEFsc28gY2hhbmdlZCB0aGUgb3RoZXIgZnVuY3Rpb25zIG5h
bWUuDQo+Pj4+Pj4+IENoYW5nZWQgdGhlIG1hY3JvIHdyYXBwaW5nICJwY2lzdHViX2dldF9nc2lf
ZnJvbV9zYmRmIiBmcm9tICJDT05GSUdfWEVOX0FDUEkiIHRvICJDT05GSUdfWEVOX1BDSURFVl9C
QUNLRU5EIiB0byBmaXggY29tcGlsZSBlcnJvcnMgcmVwb3J0ZWQgYnkgQ0kgcm9ib3QuDQo+Pj4+
Pj4+IENoYW5nZWQgdGhlIHBhcmFtZXRlciBnc2kgb2Ygc3RydWN0IHByaXZjbWRfcGNpZGV2X2dl
dF9nc2kgZnJvbSBpbnQgdG8gdTMyLg0KPj4+Pj4+Pg0KPj4+Pj4+PiB2Ny0+djggY2hhbmdlczoN
Cj4+Pj4+Pj4gSW4gZnVuY3Rpb24gcHJpdmNtZF9pb2N0bF9nc2lfZnJvbV9kZXYsIHJldHVybiAt
RUlOVkFMIHdoZW4gbm90IGNvbmZpZ2UgQ09ORklHX1hFTl9BQ1BJLg0KPj4+Pj4+PiBVc2VkIFBD
SV9CVVNfTlVNIFBDSV9TTE9UIFBDSV9GVU5DIGluc3RlYWQgb2Ygb3BlbiBjb2RpbmcuDQo+Pj4+
Pj4+DQo+Pj4+Pj4+IHY2LT52NyBjaGFuZ2VzOg0KPj4+Pj4+PiBDaGFuZ2VkIGltcGxlbWVudGF0
aW9uIHRvIGFkZCBhIG5ldyBwYXJhbWV0ZXIgImdzaSIgdG8gc3RydWN0IHBjaXN0dWJfZGV2aWNl
IGFuZCBzZXQgZ3NpIHdoZW4gcGNpc3R1YiBpbml0aWFsaXplIGRldmljZS4gVGhlbiB3aGVuIHVz
ZXJzcGFjZSB3YW50cyB0byBnZXQgZ3NpIGFuZCBwYXNzIHNiZGYsIHdlIGNhbiByZXR1cm4gdGhh
dCBnc2kuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IHY1LT52NiBjaGFuZ2VzOg0KPj4+Pj4+PiBDaGFuZ2Vk
IGltcGxlbWVudGF0aW9uIHRvIGFkZCBhIG5ldyBzeXNjYWxsIHRvIHRyYW5zbGF0ZSBpcnEgdG8g
Z3NpLCBpbnN0ZWFkIGFkZGluZyBhIG5ldyBnc2kgc3lzZnMgbm9kZSwgYmVjYXVzZSB0aGUgcGNp
IE1haW50YWluZXIgZGlkbid0IGFsbG93IHRvIGFkZCB0aGF0IHN5c2ZzIG5vZGUuDQo+Pj4+Pj4+
DQo+Pj4+Pj4+IHYzLT52NSBjaGFuZ2VzOg0KPj4+Pj4+PiBOby4NCj4+Pj4+Pj4NCj4+Pj4+Pj4g
djItPnYzIGNoYW5nZXM6DQo+Pj4+Pj4+IFN1Z2dlc3RlZCBieSBSb2dlcjogQWJhbmRvbmVkIHBy
ZXZpb3VzIGltcGxlbWVudGF0aW9ucyB0aGF0IGFkZGVkIG5ldyBzeXNjYWxsIHRvIGdldCBnc2kg
ZnJvbSBpcnEgYW5kIGNoYW5nZWQgdG8gYWRkIGEgbmV3IHN5c2ZzIG5vZGUgZm9yIGdzaSwgdGhl
biB1c2Vyc3BhY2UgY2FuIGdldCBnc2kgbnVtYmVyIGZyb20gc3lzZnMgbm9kZS4NCj4+Pj4+Pj4g
LS0tDQo+Pj4+Pj4+IHwgUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwu
Y29tPg0KPj4+Pj4+PiB8IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxk
LWFsbC8yMDI0MDYwOTA4MjYud2hsNkNiN1ItbGtwQGludGVsLmNvbS8NCj4+Pj4+Pj4gLS0tDQo+
Pj4+Pj4+IHwgUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPg0K
Pj4+Pj4+PiB8IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8y
MDI0MDUxNzExMTMuVDQzMVBDOE8tbGtwQGludGVsLmNvbS8NCj4+Pj4+Pj4gLS0tDQo+Pj4+Pj4+
IMKgIGRyaXZlcnMveGVuL3ByaXZjbWQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMzAg
KysrKysrKysrKysrKysrKysrKysrKysNCj4+Pj4+Pj4gwqAgZHJpdmVycy94ZW4veGVuLXBjaWJh
Y2svcGNpX3N0dWIuYyB8IDM4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQ0KPj4+Pj4+
PiDCoCBpbmNsdWRlL3VhcGkveGVuL3ByaXZjbWQuaMKgwqDCoMKgwqDCoMKgwqAgfMKgIDcgKysr
KysrDQo+Pj4+Pj4+IMKgIGluY2x1ZGUveGVuL2FjcGkuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoCA5ICsrKysrKysNCj4+Pj4+Pj4gwqAgNCBmaWxlcyBjaGFuZ2VkLCA4MSBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPj4+Pj4+Pg0KPj4+Pj4+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy94ZW4vcHJpdmNtZC5jIGIvZHJpdmVycy94ZW4vcHJpdmNtZC5jDQo+Pj4+Pj4+
IGluZGV4IDk1NjM2NTBkZmJhZi4uMWVkNjEyZDIxNTQzIDEwMDY0NA0KPj4+Pj4+PiAtLS0gYS9k
cml2ZXJzL3hlbi9wcml2Y21kLmMNCj4+Pj4+Pj4gKysrIGIvZHJpdmVycy94ZW4vcHJpdmNtZC5j
DQo+Pj4+Pj4+IEBAIC00Niw2ICs0Niw5IEBADQo+Pj4+Pj4+IMKgICNpbmNsdWRlIDx4ZW4vcGFn
ZS5oPg0KPj4+Pj4+PiDCoCAjaW5jbHVkZSA8eGVuL3hlbi1vcHMuaD4NCj4+Pj4+Pj4gwqAgI2lu
Y2x1ZGUgPHhlbi9iYWxsb29uLmg+DQo+Pj4+Pj4+ICsjaWZkZWYgQ09ORklHX1hFTl9BQ1BJDQo+
Pj4+Pj4+ICsjaW5jbHVkZSA8eGVuL2FjcGkuaD4NCj4+Pj4+Pj4gKyNlbmRpZg0KPj4+Pj4+PiDC
oCAjaW5jbHVkZSAicHJpdmNtZC5oIg0KPj4+Pj4+PiBAQCAtODQ0LDYgKzg0NywyOSBAQCBzdGF0
aWMgbG9uZyBwcml2Y21kX2lvY3RsX21tYXBfcmVzb3VyY2Uoc3RydWN0IGZpbGUgKmZpbGUsDQo+
Pj4+Pj4+IMKgwqDCoMKgwqAgcmV0dXJuIHJjOw0KPj4+Pj4+PiDCoCB9DQo+Pj4+Pj4+ICtzdGF0
aWMgbG9uZyBwcml2Y21kX2lvY3RsX3BjaWRldl9nZXRfZ3NpKHN0cnVjdCBmaWxlICpmaWxlLCB2
b2lkIF9fdXNlciAqdWRhdGEpDQo+Pj4+Pj4+ICt7DQo+Pj4+Pj4+ICsjaWZkZWYgQ09ORklHX1hF
Tl9BQ1BJDQo+Pj4+Pj4+ICvCoMKgwqAgaW50IHJjOw0KPj4+Pj4+PiArwqDCoMKgIHN0cnVjdCBw
cml2Y21kX3BjaWRldl9nZXRfZ3NpIGtkYXRhOw0KPj4+Pj4+PiArDQo+Pj4+Pj4+ICvCoMKgwqAg
aWYgKGNvcHlfZnJvbV91c2VyKCZrZGF0YSwgdWRhdGEsIHNpemVvZihrZGF0YSkpKQ0KPj4+Pj4+
PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FRkFVTFQ7DQo+Pj4+Pj4+ICsNCj4+Pj4+Pj4gK8Kg
wqDCoCByYyA9IHBjaXN0dWJfZ2V0X2dzaV9mcm9tX3NiZGYoa2RhdGEuc2JkZik7DQo+Pj4+Pj4+
ICvCoMKgwqAgaWYgKHJjIDwgMCkNCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiByYzsN
Cj4+Pj4+Pj4gKw0KPj4+Pj4+PiArwqDCoMKgIGtkYXRhLmdzaSA9IHJjOw0KPj4+Pj4+PiArwqDC
oMKgIGlmIChjb3B5X3RvX3VzZXIodWRhdGEsICZrZGF0YSwgc2l6ZW9mKGtkYXRhKSkpDQo+Pj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVGQVVMVDsNCj4+Pj4+Pj4gKw0KPj4+Pj4+PiAr
wqDCoMKgIHJldHVybiAwOw0KPj4+Pj4+PiArI2Vsc2UNCj4+Pj4+Pj4gK8KgwqDCoCByZXR1cm4g
LUVJTlZBTDsNCj4+Pj4+Pj4gKyNlbmRpZg0KPj4+Pj4+PiArfQ0KPj4+Pj4+PiArDQo+Pj4+Pj4+
IMKgICNpZmRlZiBDT05GSUdfWEVOX1BSSVZDTURfRVZFTlRGRA0KPj4+Pj4+PiDCoCAvKiBJcnFm
ZCBzdXBwb3J0ICovDQo+Pj4+Pj4+IMKgIHN0YXRpYyBzdHJ1Y3Qgd29ya3F1ZXVlX3N0cnVjdCAq
aXJxZmRfY2xlYW51cF93cTsNCj4+Pj4+Pj4gQEAgLTE1NDMsNiArMTU2OSwxMCBAQCBzdGF0aWMg
bG9uZyBwcml2Y21kX2lvY3RsKHN0cnVjdCBmaWxlICpmaWxlLA0KPj4+Pj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgcmV0ID0gcHJpdmNtZF9pb2N0bF9pb2V2ZW50ZmQoZmlsZSwgdWRhdGEpOw0KPj4+
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+Pj4+Pj4+ICvCoMKgwqAgY2FzZSBJT0NU
TF9QUklWQ01EX1BDSURFVl9HRVRfR1NJOg0KPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0ID0g
cHJpdmNtZF9pb2N0bF9wY2lkZXZfZ2V0X2dzaShmaWxlLCB1ZGF0YSk7DQo+Pj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoCBicmVhazsNCj4+Pj4+Pj4gKw0KPj4+Pj4+PiDCoMKgwqDCoMKgIGRlZmF1bHQ6
DQo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsNCj4+Pj4+Pj4gwqDCoMKgwqDCoCB9
DQo+Pj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi94ZW4tcGNpYmFjay9wY2lfc3R1Yi5j
IGIvZHJpdmVycy94ZW4veGVuLXBjaWJhY2svcGNpX3N0dWIuYw0KPj4+Pj4+PiBpbmRleCA4Y2Uy
NzMzM2Y1NGIuLjJlYThlNDA3NWFkYyAxMDA2NDQNCj4+Pj4+Pj4gLS0tIGEvZHJpdmVycy94ZW4v
eGVuLXBjaWJhY2svcGNpX3N0dWIuYw0KPj4+Pj4+PiArKysgYi9kcml2ZXJzL3hlbi94ZW4tcGNp
YmFjay9wY2lfc3R1Yi5jDQo+Pj4+Pj4+IEBAIC01Niw2ICs1Niw5IEBAIHN0cnVjdCBwY2lzdHVi
X2RldmljZSB7DQo+Pj4+Pj4+IMKgwqDCoMKgwqAgc3RydWN0IHBjaV9kZXYgKmRldjsNCj4+Pj4+
Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgeGVuX3BjaWJrX2RldmljZSAqcGRldjsvKiBub24tTlVMTCBp
ZiBzdHJ1Y3QgcGNpX2RldiBpcyBpbiB1c2UgKi8NCj4+Pj4+Pj4gKyNpZmRlZiBDT05GSUdfWEVO
X0FDUEkNCj4+Pj4+Pj4gK8KgwqDCoCBpbnQgZ3NpOw0KPj4+Pj4+PiArI2VuZGlmDQo+Pj4+Pj4+
IMKgIH07DQo+Pj4+Pj4+IMKgIC8qIEFjY2VzcyB0byBwY2lzdHViX2RldmljZXMgJiBzZWl6ZWRf
ZGV2aWNlcyBsaXN0cyBhbmQgdGhlIGluaXRpYWxpemVfZGV2aWNlcw0KPj4+Pj4+PiBAQCAtODgs
NiArOTEsOSBAQCBzdGF0aWMgc3RydWN0IHBjaXN0dWJfZGV2aWNlICpwY2lzdHViX2RldmljZV9h
bGxvYyhzdHJ1Y3QgcGNpX2RldiAqZGV2KQ0KPj4+Pj4+PiDCoMKgwqDCoMKgIGtyZWZfaW5pdCgm
cHNkZXYtPmtyZWYpOw0KPj4+Pj4+PiDCoMKgwqDCoMKgIHNwaW5fbG9ja19pbml0KCZwc2Rldi0+
bG9jayk7DQo+Pj4+Pj4+ICsjaWZkZWYgQ09ORklHX1hFTl9BQ1BJDQo+Pj4+Pj4+ICvCoMKgwqAg
cHNkZXYtPmdzaSA9IC0xOw0KPj4+Pj4+PiArI2VuZGlmDQo+Pj4+Pj4+IMKgwqDCoMKgwqAgcmV0
dXJuIHBzZGV2Ow0KPj4+Pj4+PiDCoCB9DQo+Pj4+Pj4+IEBAIC0yMjAsNiArMjI2LDI1IEBAIHN0
YXRpYyBzdHJ1Y3QgcGNpX2RldiAqcGNpc3R1Yl9kZXZpY2VfZ2V0X3BjaV9kZXYoc3RydWN0IHhl
bl9wY2lia19kZXZpY2UgKnBkZXYsDQo+Pj4+Pj4+IMKgwqDCoMKgwqAgcmV0dXJuIHBjaV9kZXY7
DQo+Pj4+Pj4+IMKgIH0NCj4+Pj4+Pj4gKyNpZmRlZiBDT05GSUdfWEVOX1BDSURFVl9CQUNLRU5E
DQo+Pj4+Pj4NCj4+Pj4+Pg0KPj4+Pj4+IFRoaXMgYnJlYWtzIGNvbmZpZ3VyYXRpb25zIHdpdGhv
dXQgQ09ORklHX0FDUEkgYW5kIHdpdGgNCj4+Pj4+PiBDT05GSUdfWEVOX1BDSURFVl9CQUNLRU5E
Lg0KPj4+Pj4+DQo+Pj4+Pj4gQWxzbyB0aGVyZSBzaG91bGQgYmUgbm8gZGVwZW5kZW5jeSBiZXR3
ZWVuIFBDSURFVl9CQUNLRU5EIGFuZA0KPj4+Pj4+IHBjaXN0dWJfZ2V0X2dzaV9mcm9tX3NiZGYu
DQo+Pj4+Pj4NCj4+Pj4+PiBJIHRoaW5rIHdlIHNob3VsZCBzb2x2ZSB0aGUgYnVpbGQgaXNzdWVz
IHRoaXMgd2F5Og0KPj4+Pj4+DQo+Pj4+Pj4gLSBwcml2Y21kX2lvY3RsX3BjaWRldl9nZXRfZ3Np
IHNob3VsZCBoYXZlOg0KPj4+Pj4+ICNpZiBkZWZpbmVkKENPTkZJR19YRU5fQUNQSSkgJiYgZGVm
aW5lZChDT05GSUdfWEVOX1BDSV9TVFVCKQ0KPj4+Pj4+DQo+Pj4+Pj4gLSBoZXJlIHdlIHNob3Vs
ZCBoYXZlICNpZmRlZiBDT05GSUdfWEVOX0FDUEkgYXMgeW91IGhhZCBiZWZvcmUNCj4+Pj4+Pg0K
Pj4+Pj4+DQo+Pj4+Pj4gQXMgZmFyIGFzIEkgY2FuIHRlbGwgdGhlIGFib3ZlIHNob3VsZCBiZSBh
YmxlIHRvIGFkZHJlc3MgYWxsIHZhbGlkDQo+Pj4+Pj4gY29tYmluYXRpb25zLg0KPj4+Pj4gVGhp
cyBjYW4ndCBwYXNzIGEgY29tYmluYXRpb24gdGhhdDoNCj4+Pj4+IENPTkZJR19YRU5fQUNQST15
DQo+Pj4+PiBDT05GSUdfWEVOX1BDSV9TVFVCPXkNCj4+Pj4+IENPTkZJR19YRU5fUENJREVWX0JB
Q0tFTkQ9bQ0KPj4+Pj4gUmVwb3J0ZWQgYnkgcm9ib3QgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
b2Uta2J1aWxkLWFsbC8yMDI0MDYwOTA4MjYud2hsNkNiN1ItbGtwQGludGVsLmNvbS8NCj4+Pj4+
DQo+Pj4+PiBBdCB0aGlzIGNvbWJpbmF0aW9uLCBwcml2Y21kX2lvY3RsX3BjaWRldl9nZXRfZ3Np
IGNhbiBjYWxsIHBjaXN0dWJfZ2V0X2dzaV9mcm9tX3NiZGYgYmVjYXVzZSBDT05GSUdfWEVOX0FD
UEkgYW5kIENPTkZJR19YRU5fUENJX1NUVUIgYXJlIGJvdGggInkiLg0KPj4+Pj4gQnV0IHdoZW4g
dGhlIGNvbXBpbGVyIHRyaWVzIHRvIGZpbmQgdGhlIGltcGxlbWVudGF0aW9uIG9mIHBjaXN0dWJf
Z2V0X2dzaV9mcm9tX3NiZGYsIGl0IGZhaWxzIChsZDogdm1saW51eC5vOiBpbiBmdW5jdGlvbiBg
cHJpdmNtZF9pb2N0bF9wY2lkZXZfZ2V0X2dzaSc6DQo+Pj4+PiAvaG9tZS9janEvY29kZS91cHN0
cmVhbS9rZXJuZWxfdGVzdF9yb2JvdC9saW51eF94ZW4vYnVpbGRfZGlyLy4uL2RyaXZlcnMveGVu
L3ByaXZjbWQuYzo4NTk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYHBjaXN0dWJfZ2V0X2dzaV9m
cm9tX3NiZGYnKSwgYmVjYXVzZSB0aGUgdmFsdWUgb2YgQ09ORklHX1hFTl9QQ0lERVZfQkFDS0VO
RCBpcyAibSIgKGZpbGUgZHJpdmVycy94ZW4veGVuLXBjaWJhY2svTWFrZWZpbGUgc2hvd3MgIm9i
ai0kKENPTkZJR19YRU5fUENJREVWX0JBQ0tFTkQpICs9IHhlbi1wY2liYWNrLm8iKSwgc28gdGhh
dCB4ZW4tcGNpYmFjayBpcyBidWlsdCBhcyBhIG1vZHVsZS4NCj4+Pj4NCj4+Pj4NCj4+Pj4gVGhl
IGF0dGFjaGVkIC5jb25maWcsIHdpdGggdGhlIGFwcGVuZGVkIGNoYW5nZXMgb24gdG9wIG9mIHlv
dXIgcGF0Y2gNCj4+Pj4gd29yayBmb3IgbWUuIEkgaGF2ZSBDT05GSUdfWEVOX1BDSURFVl9CQUNL
RU5EPW0uDQo+Pj4gVXNpbmcgeW91ciBhdHRhY2hlZCAuY29uZmlnLCBpdCBhbHNvIHdvcmtzIGZv
ciBtZS4NCj4+PiBUaGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHlvdXIgLmNvbmZpZyBhbmQgdGhlIGNv
bmZpZyByZXBvcnRlZCBieSBSb2JvdCAoaHR0cHM6Ly9kb3dubG9hZC4wMS5vcmcvMGRheS1jaS9h
cmNoaXZlLzIwMjQwNjA5LzIwMjQwNjA5MDgyNi53aGw2Q2I3Ui1sa3BAaW50ZWwuY29tL2NvbmZp
ZykgaXMgdGhhdCB5b3VyIENPTkZJR19YRU5fUFJJVkNNRD1tLCBidXQgUm9ib3QncyBDT05GSUdf
WEVOX1BSSVZDTUQ9eS4NCj4+Pg0KPj4+IEl0IHNlZW1zIHRoYXQsIHdpdGggbXkgcGF0Y2ggY2hh
bmdlcywgcHJpdmNtZCB1c2VzIHRoZSBmdW5jdGlvbiBpbXBsZW1lbnRlZCBieSB4ZW4tcGNpYmFj
aywgc28gaWYgdGhlIGNvbmZpZ3VyYXRpb24gaXMgIkNPTkZJR19YRU5fUFJJVkNNRD1tICYgQ09O
RklHX1hFTl9QQ0lERVZfQkFDS0VORD1tIiBvciAiQ09ORklHX1hFTl9QUklWQ01EPXkgJiBDT05G
SUdfWEVOX1BDSURFVl9CQUNLRU5EPXkiLCB0aGUgY29tcGlsYXRpb24gaXMgT0ssIGJ1dCBpZiB0
aGUgY29uZmlndXJhdGlvbiBpcyAiQ09ORklHX1hFTl9QUklWQ01EPXkgJiBDT05GSUdfWEVOX1BD
SURFVl9CQUNLRU5EPW0iLCBpc3N1ZSBoYXBwZW5zLg0KPj4+DQo+Pj4gWW91IGNhbiBjaGFuZ2Ug
Q09ORklHX1hFTl9QUklWQ01EIGZyb20gIm0iIHRvICJ5IiBpbiB5b3VyIC5jb25maWcsIHRoZW4g
eW91IHdpbGwgZmFpbCBhdDoNCj4+PiBsZDogdm1saW51eC5vOiBpbiBmdW5jdGlvbiBgcHJpdmNt
ZF9pb2N0bCc6DQo+Pj4gcHJpdmNtZC5jOigudGV4dCsweDY2NWU0Mik6IHVuZGVmaW5lZCByZWZl
cmVuY2UgdG8gYHBjaXN0dWJfZ2V0X2dzaV9mcm9tX3NiZGYnDQo+Pg0KPj4gWW91IGNhbiBkbzoN
Cj4+DQo+PiDCoMKgwqDCoMKgaWYgKElTX1JFQUNIQUJMRShDT05GSUdfWEVOX1BDSURFVl9CQUNL
RU5EKSkgew0KPj4gwqDCoMKgwqDCoMKgwqDCoCByYyA9IHBjaXN0dWJfZ2V0X2dzaV9mcm9tX3Ni
ZGYoa2RhdGEuc2JkZik7DQo+PiDCoMKgwqDCoMKgwqDCoMKgIGlmIChyYyA8IDApDQo+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJjOw0KPj4gwqDCoMKgwqDCoH0NCj4+DQo+PiBT
ZWUgRG9jdW1lbnRhdGlvbi9rYnVpbGQva2NvbmZpZy1sYW5ndWFnZS5yc3QgaW4gdGhlIGtlcm5l
bCBzb3VyY2UgdHJlZS4NCj4gDQo+IE9oLCBJIHRoaW5rIHRoaXMgd2lsbCBuZWVkOg0KPiANCj4g
wqDCoMKgwqBpbXBseSBDT05GSUdfWEVOX1BDSURFVl9CQUNLRU5EDQo+IA0KPiBpbiB0aGUgQ09O
RklHX1hFTl9QUklWQ01EIEtjb25maWcgZGVmaW5pdGlvbi4NCg0KVGhhbmtzLCBKdWVyZ2VuLCB0
aGVzZSBjaGFuZ2VzIGNhbiB3b3JrIHdpdGggdGhlIGNvbWJpbmF0aW9uIG9mIFJvYm90Lg0KSSB3
aWxsIGNoYW5nZSB0byB0aGVzZSBpbiBuZXh0IHZlcnNpb24uDQoNCj4gDQo+IA0KPiBKdWVyZ2Vu
DQo+IA0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

