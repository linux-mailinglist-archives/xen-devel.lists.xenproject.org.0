Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F0CA77771
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 11:18:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933802.1335648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzXki-000485-2B; Tue, 01 Apr 2025 09:17:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933802.1335648; Tue, 01 Apr 2025 09:17:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzXkh-00046f-V7; Tue, 01 Apr 2025 09:17:47 +0000
Received: by outflank-mailman (input) for mailman id 933802;
 Tue, 01 Apr 2025 09:17:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Br0a=WT=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tzXkg-00046Z-HL
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 09:17:46 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2412::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ae7da66-0eda-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 11:17:45 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SA1PR12MB8641.namprd12.prod.outlook.com (2603:10b6:806:388::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 09:17:40 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 09:17:40 +0000
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
X-Inumbo-ID: 2ae7da66-0eda-11f0-9ea7-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V7Xva29WQPHc1UDrH4oZpwJv7nHB/zIE/vJcIq17VyXb9Wta2YM0uvMlfYNwFtYkSC7Ugm2bQZpqilUwmsF7uODVmXOeuzEP0G8i4r2XIwSphgSZeM9gqcE0bfxqAMpz0ea/rHPFgepjoM6tQTv4/wypBpG9UFIhMV938JPNODFw5mXQJYIqVprbxOHC/sFwoZ1qG5AawJzrGfVYQwjAgYEa6GUEylJHKjCvFdb/1hXQ58NToGk1+dC4hBSfW2DLAC3ODzMoGXbodoDSxTNAQpHcKeWg2yf1Zm3LmM/p2bp4IE8MvqZL2WEfJmDIEU/ks8pqTj94WvzUsTUxm3ioZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m05oKeqOmUwBWuc8B5wEYGYklrb7uaZ6HRfWR+nH6r0=;
 b=Wql0SfYuqdv6Mfvp0XX49irV1UzV3Cx4Pf02eG1xeltzZLCGT1DI/nEVLS0pcXZwswz+WZSLOV6EjUIzsIo30IpzOuf8frSInuo3qWOu7ZAxHSHzKJRsNRQ7qKTwXvXV/BEDpAxlh6SY7n7ktEcxK1JMsT/AR9hTsba9oaEdkmwwFusvZWb+rG1jd+N7qOtAsEB5g78YTIau6YQLkbEeqvAbXwx6fWbqQQ5gWm2Nt6SB03qUSjrtBI2kIgObNomlPsnO7Jkah9RS80qfvILECoEH8tAR4qj6eNH8wrF4eP6L/9l6ELI8EaeFtQo5FaAWC9pHPx7jwe0pxDqvsteE6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m05oKeqOmUwBWuc8B5wEYGYklrb7uaZ6HRfWR+nH6r0=;
 b=5X+3cPxIyxt+79/RcHOyk6AzuhE3GkNTHT2njjaYo8rxz/fCkK6jhrZLWpwlTnNVR4RYPS/KyeRMeWhvAAzdEIDYOG6uHLfKKopVfd8DzH4imGUQaW0Rp8FtJu71Xm//110e1goQvkfMRzg27SxFRvvkYdQNRs0kVF7vVVcfXno=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v1 1/3] vpci: Hide capability when it fails to initialize
Thread-Topic: [PATCH v1 1/3] vpci: Hide capability when it fails to initialize
Thread-Index:
 AQHbnup9DfRmpRg4a0apmzEwGKAL0LOGtpyAgAamp4D//5bVAIAAjtkA//+YpgCAAfg2AA==
Date: Tue, 1 Apr 2025 09:17:40 +0000
Message-ID:
 <BL1PR12MB5849A28F132E9C19F0E6102FE7AC2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250327073214.158210-1-Jiqian.Chen@amd.com>
 <Z-UZm5sTIz4nOt4-@macbook.local>
 <BL1PR12MB5849F1134D9E51E6A0F7B4A7E7AD2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <Z-pVrGLZTCk1ZXb1@macbook.local>
 <BL1PR12MB5849783E854628DC49F9A609E7AD2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <Z-p2zgB2tUtVd7hP@macbook.local>
In-Reply-To: <Z-p2zgB2tUtVd7hP@macbook.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8534.033)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SA1PR12MB8641:EE_
x-ms-office365-filtering-correlation-id: a6262f8f-f971-44b5-c849-08dd70fe0d5a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZFk5WHR1QmJSQ3B2WXpwSjdQV1VGU1p3ck9iRGlJSHJ3czJvbHZEUmV0a0Zj?=
 =?utf-8?B?bTJSRzN2TzA5OVhWYWJLV2dmQlEyNnFVdGNGL0NzMXFOTGloMEttc0FEamxl?=
 =?utf-8?B?QXBmNjFTUlZpd2o4YW15VXZHaE5ra1VpdkFFS2NtZnF0WlBkNjlpWHp1dDFC?=
 =?utf-8?B?NEVaSWM4eldSNk9pNENtTEJmUWdNYnJiUDFudWdBbTN6bDYvdkJqZDE2Q2Zq?=
 =?utf-8?B?U2J0NzkydkU5VHpJVkF5ZzVKK202ZXhQbW8xVktZVDRiRTY3Z3lqaDhRVkI0?=
 =?utf-8?B?d0Z6Vk9Xd05DYWNZWVVpNHVJdWlEaGIrTlJMUWY3Vm4zNkZ6QnJ4YS93VnhJ?=
 =?utf-8?B?a0tqMjU3dkxnUk9COElqanZaYWkrcDNaU2w1aEkzK2htTTR0ZnVGU2MranlN?=
 =?utf-8?B?dlJTVUxIMlJtTUhiSHk4Z0lieEdYSm5uUC9HSk5KS25UaU5tVTJHSEJ2ZXYv?=
 =?utf-8?B?ZGpwR3ZKUUloemRFUE5RWDdVaHZNSVI0WXl6Q1d2cFdtcDN4SmxEa21VZUNt?=
 =?utf-8?B?eUVDQUtCY0R0bFR1cFRDejdEa2F6RVp2RjJXRThYVTU0ZFhWWjFuSmVmL1lZ?=
 =?utf-8?B?VGRyaFV0U2xwcHJHZnhFbXg4bkdqaXJVUUx1ZU5KZ1JKVThJMXBNWm5raGZE?=
 =?utf-8?B?bTE3NmRwN3l5QlE4L0F2QmhuM01jQ3R4WWxyck45TGxSWVI5dWw5aWllVm5P?=
 =?utf-8?B?NzZqd29ncVFBdlZlaXV3UFZrNW9OdC95NUllTmdpVHc1cGNhdHVuOFBCTlc0?=
 =?utf-8?B?cEd0TE9KUmxPY3lyeXZ1WDYzUmFuQ2M5eHBqdmFkL3R2eWY0b1hFZkJkV0k4?=
 =?utf-8?B?ekJWNkJjUURtczdrVEhNYXR5Q2hHakk5VVF6OVVSWkw2dm5MeTNQUW1aWXNm?=
 =?utf-8?B?cmovQy9KZlk1U0N3TlpsNnphSVpGdXRlUmNTWkJYczBCUWJsYmVLOHpONnVI?=
 =?utf-8?B?QXV2cFBCQVFFQ2k4VElJOXlJeDRaTTZ0MnI0SlFucS9YOC9SRGV2cUdNZ0dD?=
 =?utf-8?B?Um1uWGUwUEU3czV5WUJiM3R6T1pNaERkbjBialo5WWJUc1ZmWlZNNnBRKzI2?=
 =?utf-8?B?YjVOZ3VjTjZRYmZUSXZtTkM1N0Z6NkViaWsyYnlHd1dIUStOTUNSK2R4SS9k?=
 =?utf-8?B?MTVxMU1TR0JHVExwekpJWGhEeGlsZEVZSUx4MGowWUo0S3YxRXM4K3hPT1VY?=
 =?utf-8?B?SmYzeXZUSHJhdDVTb2pXWm02dTkya3J1SWRhdWdFQXYzdDQza1RjUm9uaU9q?=
 =?utf-8?B?NU83bHBMVlFmSDR3eHlVelc0WGNTRTNld092MGZJVzFDeWNZWVpWZUhiMEMr?=
 =?utf-8?B?V3h1dnFYZlQrZVJzeVI3MmlOZkFDUkt3TUlYUStDWUR4ZkpVaTNYM1ozOGFG?=
 =?utf-8?B?bENmREhSN3lieldHazNJM3BMTjVDTVMvRGdVZXFZa1N2VktmSTJHc3ZmMUw5?=
 =?utf-8?B?clRObEVGcm5SeXBPbG1tZmE3RHEyVDliTStQdjlQVTlHb0Z0TDNPNkVmSXFC?=
 =?utf-8?B?N3k2K0doK2E4ZkVWdXphMnNyeVVoKzNtR1ZQcWJkTWVrQXhxQzc2ME5jbnk0?=
 =?utf-8?B?SUlPNElvVnR0a3pPMExYaHV4Zzl6NHlHZk95VzQ4MTBDTld4OVM1T2x2cSsy?=
 =?utf-8?B?N1VkS1Ixa3UrRDd2S3FVOGhHRWhzRVdVaUJkOEFUbVFCblN4L1VKWTN6Z0Q3?=
 =?utf-8?B?U0J1QWRpeWNZSmgwekNHa2dLV1daditraUNtRGxBVjM0bkVWZkdCZXNlWWFw?=
 =?utf-8?B?MTJlaWtsMm9MWEh1YUhMbmxwbXptbTYxNE95SXlRdlJKZWhJS2NNbUhLcTJr?=
 =?utf-8?B?QUtVV3R5YU9mVjRVeXhLWU56dHJRMHRxaXJER0VSQTd3RTNBdnlGKzhWV0F4?=
 =?utf-8?B?M3VzQ1ZFU3ZSTHRmM0U0ZlQrNWFIREhMbFVQZEhYU1RnOVExMTNhbzd0RTQ3?=
 =?utf-8?Q?ve7PGp3KTarT3iC4lgoIaYkC5YWFWS+x?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VW9tdEFXa3NBK0NaY0hpZVZYaHFmaG1iRy90bkZzL0xoM1pkMjFhcUF3aE1w?=
 =?utf-8?B?SEZhSEhVdk5HNkgvWjVGTmNVVmlId1RaZXE3U2VjRndKQk5JTzd6M2FaMFlq?=
 =?utf-8?B?Rkw5OU5EUEFIZmFrZFpJSU5rcE1ITHJ0bmdNeVRqYU1qY2xIRFVJeGF4M01w?=
 =?utf-8?B?ajhVVVg3V3pwaXREdFp0ZUd4SXBBVlJvWGtXSHRTUkVXYkpjT0JjbnhDTU9Y?=
 =?utf-8?B?Z0E0TFlrRkRzWVAwNjlSdXY1UVF4aGF2REowSHppLytKNmxQdndraDNjM2hw?=
 =?utf-8?B?L1FkZndIeVdpVjV1S0NTcTg3V0VxT1JRZlVyUlFIVDVSMFZXcUplc2tCU3Jz?=
 =?utf-8?B?L3NxOE91Y1hOa0lRV0dLc3pnWUU4QXFqSWtpZmFxOE4rNEpKL1oxRmh5UTlp?=
 =?utf-8?B?R1kybFA3TFBQYktGZmRjcWNseGdYMVdLMVpqc2FWa0ZneE92YUR0eE1jV3I2?=
 =?utf-8?B?RDlGSVVLUklrRTN6MUdLVElXQ2UzOWxCOTJybHBwanRIYU9kYVBNTEtGRWxN?=
 =?utf-8?B?dEcxTGEwa0VrcGlldjVteHllNzBzR2VFRDl3a2VacmFFK3NmN0ViRXoxeGo3?=
 =?utf-8?B?a241MWZRNVE0a3lISVVuaGFFL3ZPTmdxMTNkSFl5eEZobFk3aDVLQ3BuZUhL?=
 =?utf-8?B?TU1HRDJzUUUwa2s0ZndUaWtUVFRnUk50ZUVkMi8yR045a1NYSVBsdVZDb3hy?=
 =?utf-8?B?V0hqa25lMC8xUHN0T3RNN1k2MWZMTTZGaWhRVVNKdXM1b0xEM2VxS2hLNTRU?=
 =?utf-8?B?RnVoc0FISmlIY2QvcFhWUXM2bFM0TnVjZGl0ZVN1TXJLYmtTd0VnMHplbG9k?=
 =?utf-8?B?aXpVQTAybzFmckpuNGVtcDZiTFF3RjdyUHF4VzhCcjVEN1pWM1duQk1ualdi?=
 =?utf-8?B?OVhicWxmTXpnelQzQmZrdndoSVBwSXd6dDhZMlc0Z0xQckZleENKKzBGL2Rw?=
 =?utf-8?B?NW8veTFXb0NXNDBIM2htVjdjV2FMUzBzblVKREZhQjRhSkRGand3anl6eG56?=
 =?utf-8?B?d3BZMWw0bnlBZ2JGUFZKMEdaSTdoaDU2NmxkUGE1Nzk2R1VZV0tySUdINnlk?=
 =?utf-8?B?ZnpnNW9ZbS9rZ2J5Z1dEMktpWEtNL3l5VHQxM3NNM0RTbnk1cSswSmxZUm0x?=
 =?utf-8?B?U1Bhdzk2QVp5L1huYllPbTJHSDFRY1RnckUwTFN3U3lCeCt3bXo4MW1YOFFl?=
 =?utf-8?B?K2NpdVkrVjNOdEh1blV3WVFhTEh4b0xCc3AxWnp2S0QrRWVMR0dIT2RQZmdm?=
 =?utf-8?B?bTllSjlDNkkxUm9rMTZXeHFTSFVSd01nVVh2WklCMXdNc1V0WGJEVXpLRVpD?=
 =?utf-8?B?bk9seW1Vbi9hbmF4Z2pFV0w2SWwwSkthY0RkMWJqenlwKzZZenluUG5JczJ2?=
 =?utf-8?B?SE9lVWJZVnUwVWE2c3A1SklranlWT09JN1JHd2tENkxsbkhKQUJtbHo5M0p5?=
 =?utf-8?B?Qm9rdk9vbmJFdSsrZzNJczR5SHRJbXZXUWZyOVdEOXlweWtnL2JTR1FIeGh1?=
 =?utf-8?B?NjZWRG83aGlML1pRWDBtYXMySGtrRnl5bHh3d0dYMUpFaTc5aW04cVFaS2JB?=
 =?utf-8?B?RzdGUFB1Q3BaWjBUbFBTWC9JdUFLQ216L2IyZFNkcnFtWk9kNWl1cTdDd2tk?=
 =?utf-8?B?MHNZbXdWaGFDdm1md25Ud3QrcDdJaWwzVkdtbytiNHFZVG5DNVRlSytqRWVW?=
 =?utf-8?B?ZU9sSUZiM3VoakduK01LUWVPZGo5NjRuL3hMbU5wc2RWRWpOMFBEb2xaVEww?=
 =?utf-8?B?aVV6L3RNUUdWQlkzNVJnRythVDZzVUk0dTQ1cm85M0FHWjFReEhwckd0cGVJ?=
 =?utf-8?B?OURJd0dyVHlwMDVkQ3k3MFc5Z3FROUh0SHVZSTF2WnZyQTFPTHovcWVON1JU?=
 =?utf-8?B?NXBlRTJOVkZFSUh5ck9rRDBqeEgxSXE3SFJpOUkrQ3NkY3ptSVFvb1M3T3dK?=
 =?utf-8?B?ZHJEcWNQd2NqU0xtQk5ybjQ4bFAvUTNhRTMzQUZSNk10T1dROWZTandEVkw0?=
 =?utf-8?B?MEVTMWttZ0pTK1JLM2RMdDhGZzZzR1ZLS2FlMStoMHE2S0hZSXNaVmk1K2d3?=
 =?utf-8?B?dkIrWHVpRXpWNG51aFd5dGJTVUc4QmdSZGVQQkpwSk9rR1NseXkzaFRKb3Ba?=
 =?utf-8?Q?kFKI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EA4512F0A46BFC4E9579459B4D8CAF9A@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6262f8f-f971-44b5-c849-08dd70fe0d5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 09:17:40.4263
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nYAv9pxz2B4E1dPT9+SdDKQIxad5cNhBNUKGqpj3gjwWNov3ZQytRHsotuEwbhM6mR6zISgT3pyNjF5Sf0QkGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8641

T24gMjAyNS8zLzMxIDE5OjA0LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBNb24sIE1h
ciAzMSwgMjAyNSBhdCAwOTozMjowMkFNICswMDAwLCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+PiBT
bywgSSBuZWVkIHRvIHJlZmFjdG9yIHRoZSBlbXVsYXRpbmcgUENJIGNhcGFiaWxpdHkgbGlzdCBj
b2RlcyBvZiBpbml0X2hlYWRlcigpIHRvIHNlcnZlDQo+PiBmb3IgYWxsIGRvbWFpbihkb20wK2Rv
bVVzKSBmaXJzdGx5LCBzaW5jZSBjdXJyZW50IGNvZGVzIG9ubHkgZW11bGF0ZSBQQ0kgY2FwYWJp
bGl0eSBsaXN0IGZvciBkb21VcywgcmlnaHQ/DQo+IA0KPiBZZXMsIHRoYXQgd291bGQgYmUgbXkg
dW5kZXJzdGFuZGluZy4gIFRoZSBjdXJyZW50IGxvZ2ljIGluDQo+IGluaXRfaGVhZGVyKCkgbmVl
ZHMgdG8gYmUgZXhwYW5kZWQvZ2VuZXJhbGl6ZWQgc28gaXQgY2FuIGJlIHVzZWQgZm9yDQo+IG1h
c2tpbmcgcmFuZG9tIFBDSSBjYXBhYmlsaXRpZXMsIHBsdXMgYWRhcHRlZCB0byB3b3JrIHdpdGgg
UENJZQ0KPiBjYXBhYmlsaXRpZXMgYWxzby4NCk9LLCBJIHdpbGwgdHJ5IHRvIHJlZmFjdG9yIHRo
ZSBsb2dpYyBpbiBuZXh0IHZlcnNpb24uDQpIb3BpbmcgdGhlIG5leHQgdmVyc2lvbiB3aWxsIGJl
IG1vcmUgaW4gbGluZSB3aXRoIHlvdXIgaWRlYXMuDQpUaGFua3MhDQo+IA0KPj4+DQo+Pj4+DQo+
Pj4+Pg0KPj4+Pj4+ICsgICAgLyoNCj4+Pj4+PiArICAgICAqIENhcGFiaWxpdGllcyB3aXRoIGhp
Z2ggcHJpb3JpdHkgbGlrZSBNU0ktWCBuZWVkIHRvDQo+Pj4+Pj4gKyAgICAgKiBiZSBpbml0aWFs
aXplZCBiZWZvcmUgaGVhZGVyDQo+Pj4+Pj4gKyAgICAgKi8NCj4+Pj4+PiArICAgIHJjID0gdnBj
aV9pbml0X2NhcF93aXRoX3ByaW9yaXR5KHBkZXYsIFZQQ0lfUFJJT1JJVFlfSElHSCk7DQo+Pj4+
Pj4gKyAgICBpZiAoIHJjICkNCj4+Pj4+PiArICAgICAgICBnb3RvIG91dDsNCj4+Pj4+DQo+Pj4+
PiBJIHVuZGVyc3RhbmQgdGhpcyBpcyBub3QgaW50cm9kdWNlZCBieSB0aGlzIGNoYW5nZSwgYnV0
IEkgd29uZGVyIGlmDQo+Pj4+PiB0aGVyZSBjb3VsZCBiZSBhIHdheSB0byBkaXRjaCB0aGUgcHJp
b3JpdHkgc3R1ZmYgZm9yIGNhcGFiaWxpdGllcywNCj4+Pj4+IHNwZWNpYWxseSBub3cgdGhhdCB3
ZSBvbmx5IGhhdmUgdHdvICJwcmlvcml0aWVzIjogYmVmb3JlIG9yIGFmdGVyIFBDSQ0KPj4+Pj4g
aGVhZGVyIGluaXRpYWxpemF0aW9uLg0KPj4+PiBJIGhhdmUgYW4gaWRlYSwgYnV0IGl0IHNlZW1z
IGxpa2UgYSBoYWtlLg0KPj4+PiBDYW4gd2UgYWRkIGEgZmxhZyhtYXliZSBuYW1lIGl0ICJtc2l4
X2luaXRpYWxpemVkIikgdG8gc3RydWN0IHZwY2l7fT8NCj4+Pj4gVGhlbiBpbiB2cGNpX21ha2Vf
bXNpeF9ob2xlKCksIHdlIGNhbiBmaXJzdCBjaGVjayB0aGF0IGZsYWcsIGlmIGl0IGlzIGZhbHNl
LCB3ZSByZXR1cm4gYW4gZXJyb3IgdG8gbGV0IG1vZGlmeV9kZWNvZGluZygpIGRpcmVjdGx5IHJl
dHVybiBpbiB0aGUgcHJvY2VzcyBvZiBpbml0X2hlYWRlci4NCj4+Pj4gQW5kIGluIHRoZSBzdGFy
dCBvZiBpbml0X21zaXgoKSwgdG8gc2V0IG1zaXhfaW5pdGlhbGl6ZWQ9dHJ1ZSwgaW4gdGhlIGVu
ZCBvZiBpbml0X21zaXgoKSwgdG8gY2FsbCBtb2RpZnlfZGVjb2RpbmcoKSB0byBzZXR1cCBwMm0u
DQo+Pj4+IFRoZW4gd2UgY2FuIHJlbW92ZSB0aGUgcHJpb3JpdGllcy4NCj4+Pg0KPj4+IE1heWJl
IHRoZSBpbml0aWFsaXphdGlvbiBvZiB0aGUgTVNJLVggY2FwYWJpbGl0eSBjb3VsZCBiZSBkb25l
IGFmdGVyDQo+Pj4gdGhlIGhlYWRlciwgYW5kIGNhbGwgdnBjaV9tYWtlX21zaXhfaG9sZSgpPyAg
VGhlcmUncyBhIGJpdCBvZg0KPj4+IHJlZHVuZGFuY3kgaGVyZSBpbiB0aGF0IHRoZSBCQVIgaXMg
Zmlyc3QgZnVsbHkgbWFwcGVkLCBhbmQgdGhlbiBhIGhvbGUNCj4+PiBpcyBwdW5jaGVkIGluIHBs
YWNlIG9mIHRoZSBNU0ktWCByZWxhdGVkIHRhYmxlcy4gIFNlZW1zIGxpa2UgdGhlDQo+Pj4gZWFz
aWVyIG9wdGlvbiB0byBicmVhayB0aGUgZGVwZWRlbmN5IG9mIGluaXRfbXNpeCgpIGluIGJlaW5n
IGNhbGxlZA0KPj4+IGFoZWFkIG9mIGluaXRfaGVhZGVyKCkuDQo+PiBZb3UgbWVhbiB0aGUgc2Vx
dWVuY2Ugc2hvdWxkIGJlOg0KPj4gdnBjaV9pbml0X2hlYWRlcigpDQo+PiB2cGNpX2luaXRfY2Fw
YWJpbGl0eSgpIC8vIGFsbCBjYXBhYmlsaXRpZXMNCj4+IHZwY2lfbWFrZV9tc2l4X2hvbGUoKQ0K
Pj4NCj4+IFJpZ2h0Pw0KPiANCj4gWWVzLCBJIHRoaW5rIHRoYXQgd291bGQgYmUgbXkgcHJlZmVy
ZW5jZS4gIFRoZSBjYWxsIHRvDQo+IHZwY2lfbWFrZV9tc2l4X2hvbGUoKSBzaG91bGQgYmUgaW5z
aWRlIG9mIGluaXRfbXNpeCgpLg0KR290IGl0LCB3aWxsIGRvIGluIG5leHQgdmVyc2lvbi4NCg0K
PiANCj4gVGhhbmtzLCBSb2dlci4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4N
Cg==

