Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A371ADFF57
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jun 2025 10:02:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019788.1396296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSADa-0004X4-Vr; Thu, 19 Jun 2025 08:01:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019788.1396296; Thu, 19 Jun 2025 08:01:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSADa-0004UO-SA; Thu, 19 Jun 2025 08:01:54 +0000
Received: by outflank-mailman (input) for mailman id 1019788;
 Thu, 19 Jun 2025 08:01:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L+aO=ZC=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uSADZ-0004PD-7a
 for xen-devel@lists.xenproject.org; Thu, 19 Jun 2025 08:01:53 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20628.outbound.protection.outlook.com
 [2a01:111:f403:2417::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a77b3dc2-4ce3-11f0-b894-0df219b8e170;
 Thu, 19 Jun 2025 10:01:51 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SA1PR12MB8859.namprd12.prod.outlook.com (2603:10b6:806:37c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Thu, 19 Jun
 2025 08:01:47 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8835.027; Thu, 19 Jun 2025
 08:01:47 +0000
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
X-Inumbo-ID: a77b3dc2-4ce3-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M/b3UtQ45g2dmbUctY2HSDyMXdL5RRfAHfmdYFuTrLmiRn6at7RtNkkPO2vbxT68AdTctpVCyXe2cdiYcdSI9RPMsAmzbCuz3RT0kPp4GbNQbQRvZnwNOgR1jtaXErdnASAhbOFSY19AeRsv6HAjts7nUwr/WzTUz1kQf+/dG0wlhKT+LsKOSmZj9ozC5eoqpLURFkVM1hPHikHpoV0IY9p3YgcYEzFnzIildn1M7/3nR+aw/BxKxzme6RK5wGCWunAa4Pwghy5JgiqsxM0DaX4n8wypnR/0aJHk3aIsT5y4FpNFZ8wJZ/ppx7KAboapPnmWq0uOMcSU/VHNbktAxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zGBSG5Cv4iPoOUtagzQJJy3P/dyWB4ohs1B182hoTdo=;
 b=FbeRm/QngRuIWdOva1wlI4qmqBSPie6tczXzjhOPtaiQLjm7ntjY2q/SuGOugtuYJ//KaqdhUR72LfkhpWCURUGqwEYzJYjvXXnnCw6yyUO0vuCOnCriEAWZFKL+veXZIdbHtMZHyHN1q7wti+PBdc11P5FD+QbTQWtVRN/RdPPWiVX9g4f6nX/P3cURkgDK4wkDu8NhvtCu5kEnJiyrZX3stJb3tT9+U5I5mvk3o5LY0qLK2resEGZXktAVtgR52KQCvqSbVbXY7jw7VeDrO8p7E6eA0YheuUBjph5FPeLyaKCsduH7gxM1eilzRvxgCT4oJy+dR+l4WxCoqtEW4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zGBSG5Cv4iPoOUtagzQJJy3P/dyWB4ohs1B182hoTdo=;
 b=E5IBrpwadjWBdD/YxlLvMZhTS//K1riL3990y3NzDe7EOaaoMe/RAYEjr6cqViqFws/CtDGLZFilz+XgKsBeZrF6F0nIVv5ErWfxZqxh7lm7nk+x10I+tsEptZ1WBihKs5jicF7m7qICqKzwFH2SJ18xOYqj7D4uxnXMPOaiQQY=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v6 7/8] vpci/msi: Free MSI resources when init_msi() fails
Thread-Topic: [PATCH v6 7/8] vpci/msi: Free MSI resources when init_msi()
 fails
Thread-Index: AQHb23yeMT8YFCMR3kaLDqQP1+DTK7QJBi8AgAGktoA=
Date: Thu, 19 Jun 2025 08:01:47 +0000
Message-ID:
 <BL1PR12MB58491F85006CAB9FDD286243E77DA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <20250612092942.1450344-8-Jiqian.Chen@amd.com>
 <2d5a5abc-9fc6-4412-9a70-7b12ba46d80f@suse.com>
In-Reply-To: <2d5a5abc-9fc6-4412-9a70-7b12ba46d80f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8835.025)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SA1PR12MB8859:EE_
x-ms-office365-filtering-correlation-id: af6c3477-12f7-4f9f-c92d-08ddaf078a0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OGNpbURTU1ZmYnJzcE5kamVzTDNQb1NYVmlPQXQxY3BOdXYvVklsMUY5Zkpm?=
 =?utf-8?B?VDZWaHcvaGFJUnpDb01nZUh6SldnMEoyQUMxalFtMGhUN25tWGQyMjZ0TFFl?=
 =?utf-8?B?b2J1OVJQVnVrbDZLcFZWMTBKQVFpMkFjSVhJQlhtZnB1UVlXT0wreEFyNVZz?=
 =?utf-8?B?TWVxZmRPMXNzem5abkVWSnU1aDNSMGpNYlArNUZRZGZMdEZVSUgyckovcTN6?=
 =?utf-8?B?eDRJb1V6ci9QL3NmQlg1ODhPZVFKRDNxVkRSUEtzRCtPL1BGYWhLNDlXRzZx?=
 =?utf-8?B?Z1FCSE5zQldlVU9DR0R2eXIyZ1NoejdxMGwxSUhwdUo0a3l0MHRTL2YzOElt?=
 =?utf-8?B?YnRtcndPNXNUWFZWbDlvZGdRSzlLQ0hzRmNxUGJvQStDTm1EOTlSVWhURUdw?=
 =?utf-8?B?dFZ4WGlZNHlyQTVoM0pqN2hHUlZ1ZWtFb2hIeHVoZ3YvdzhNaVRlWFJNbHdK?=
 =?utf-8?B?QjB5MDYzdEg5TUpSMUllR2VWRkVyL2Q1ZC9RV1RMSXR1Qk1XMFZUN3NIVzJY?=
 =?utf-8?B?MGY4WUZ1d3dRNXFJcklMYUJsakVsWmUyNnBxakFFaEtac1VIRW5UYUx0NGpw?=
 =?utf-8?B?UC9xb2RScVYrbjJwcFk2bTlqSlJvcms0UjBnclArTkZhTHFzRFdaTEYwRWdF?=
 =?utf-8?B?d0ZyN2FTU0ZuYVBpR3RINnd4RUsvZlp0QjUxV28yTVl0cnRVNUdTVm40RTMy?=
 =?utf-8?B?cHBxQitHSHdzakFZVytFS0JzRm0xUWgxWnlZaWR1d0ViMlora1p1dXg3dFpl?=
 =?utf-8?B?TFpMVVYwTXR1WW5SWm16VWhncmlpSzg3RnFLZmVsTyttd08xd3pDKy9YZTA5?=
 =?utf-8?B?SXoyQUx2bERpeXJhWGdnRklOaVZrS093VWx0d0cvNEttS0s3MWlwYWthU1Jv?=
 =?utf-8?B?Tmo0YnNQckhoQW1VSjhDZFMxOGd0SmtRc0xURVlCVjNieHF6TEtBUkVHMTh2?=
 =?utf-8?B?UVBabHJ3bkY0UFFBNTdic3dmaEVLQlBSRTBPaTZkSmRHTCttSnQ2Z0FBS3JB?=
 =?utf-8?B?YmRTRlZGZ2grNDJyM1FvRnNUYVE4SHVwS3dkZ2lER096Zkc4WUk3cU5FMER5?=
 =?utf-8?B?SWtKNFl1dmtKZjhabWZNMVEvbEcyTDdhcWpWSWZXMUloTDdQcEF6aXlqdndl?=
 =?utf-8?B?bzJsbnU3b1FBYjVtd2dGVis4NnRtNW9NWkJQY3h4RFRMY0NTcUUwZ1RONzh1?=
 =?utf-8?B?UytudlNuV2JSckJZNjFCS3hVSG1IM2dzVnJKdGduTE5QTnpvelRMSzVoT3hh?=
 =?utf-8?B?UzRDbXhXZzF2T1VaWUpkQitKcDFMdGFOWEtsQndrLy8zeTlhNXhLamRxVDFX?=
 =?utf-8?B?ekRmdlhJNXdxay80eG5QWjBMUDhQbjAzeFVpc3dQTjA0cmhRemFydk9LMThD?=
 =?utf-8?B?YWZoZXJNNlZoSkxyYTQrS2ZyM0o4a0oyd09ZZ0s3YjBWVmJCUXRldFhCOStm?=
 =?utf-8?B?ckF0ODB1SDZMWFN3TjVrVE9mV1FqdFI4N0R0UkhNL0Vkd1hja3k4Qmg3bWYx?=
 =?utf-8?B?VS9JamtuZnh4OXRzT21sTHJrUnkzQ0dsZ0poRTF0bGxUaEJEV21xa1ZoMDdr?=
 =?utf-8?B?dU5YWm5ndXVkOUc0ckhSa1FBYXNITTJQKzdEcnZzRHVDZXRxMjU4dEJtU3hD?=
 =?utf-8?B?SXJyREdWUHlqTWk1Sk04MXhlTGFqQlZ1VTZXUEFraWJpR2Q5bVRZTUczMTVY?=
 =?utf-8?B?UnlUWStuTlNTZVc5eU9LeTVJbmJxSzFzV01ScGxocXB1bjNISHhWWWdZZUV5?=
 =?utf-8?B?V3Z3alhFYlpOcEdrTEtHNWlNbGlBZXJ2ZUwzQnlWS2h2MDU4ZzBjVXFoeXVN?=
 =?utf-8?B?UVdyYWQ4Umt5OFQyVEtYWHczeEJVb3doU2tnbHNYdTY3WEZaUmc4YmNSeHJG?=
 =?utf-8?B?MnJNUEtqQVkvR2FPSjgvZ3plK0ExcFk1dHdwWFRwNHdpLytBUjl0d1VyYzhk?=
 =?utf-8?B?cWVzaEVFM0FNYjZCa1lCSjdpRFZHZzVkS3pkNGo3eCtIaDM2RXhualAwa1lF?=
 =?utf-8?Q?NQkmFgaehkF8WNFVJYqLDAF1v5OemU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NkNIWmw2TW1vd0lLTlArUmJuSWFIOS9UOEFxOXE0eDhhSDJQTkJPaWYxZ0dy?=
 =?utf-8?B?WUR3Y1luNzI3YjBqSmlDYjVaUjNsSTAyU2tjTXZCSllBZTFQUDI1YlptZXM5?=
 =?utf-8?B?ZXhMbDlPT25BbkIwT240QXlCVWROLzhvcm1oVUxwS2pZL2Z2MENGSi9MZ1Ev?=
 =?utf-8?B?STVCNk9zbkh5MHl6TGxpbVRGOFNvZHFRa0xiakI0d2FFb1N5SG1PL2prWVRS?=
 =?utf-8?B?eFZVeWNNZFJTTWJGcjY1OHRVckZkSzZBT1JmcS8wRVpXdkQ3NnpOM2h0bnlZ?=
 =?utf-8?B?Y2xGNEQ1cWF3aDIxWm9FWFBsb3AyNUNsektJMmRKZHZkM2hCL0ZiQW1jWW9D?=
 =?utf-8?B?YldhbFpOYmZHRnA1VXpxRW9xS285SmdreEVvYWZCRERsdWdjQ2cyUUZGaWxL?=
 =?utf-8?B?WUU0Sk4zNDNhZHYrUEZ2QVNiN0x4RVF1VTFBbXpyTUVTaXB1cUMxeXgzU0dP?=
 =?utf-8?B?MmpLTE9UOGQ1blAwbHU3eGlvWUJOM25Oc3dydk1XbmRuVU11SDRldzQ4T3l2?=
 =?utf-8?B?YktDNzgvRCszYXFGSlE0ZGhrbUc1T1NudjVVTnJqWGNMVmk4OXF6SWtVbjJM?=
 =?utf-8?B?cnBtYUNLcG4wWjBQK3krUlZrcmtKMTRDVGJkY3hnRHY5eXYybVdCV3dZdmhI?=
 =?utf-8?B?cE8ra3JhZVVLNllzaDNZYVZUM0NYc0VGa0JndHp3a3hhbzdoQ3Iwc3NiVS9X?=
 =?utf-8?B?dVo5NmVSZkw3M2RVZUpTRnQ0cEI4Uml1RmhyMVdHMEgrZHFBQ2YzcHFlNHlz?=
 =?utf-8?B?M3BXRjlnWUdEZzBNemFKclNzOEdkQnkxRXBSWEJ5b1k1b0hueW1XZXpHVWJr?=
 =?utf-8?B?L0Q0ZnZMVDZINFlJWmlHbkJLalJVRlAxWGpZY2crdFYvZldkblNzWG9KZS9L?=
 =?utf-8?B?Y2d4MTAwdFhVVWswaFdSTlRqZ2gwYnNhM3lVclcvR21hT1c1QW9wTmd4ZExD?=
 =?utf-8?B?STVnT0RNUTZsa3QyZTkxSmlQWVpuUUJ6bWUyUExpK3V1TktoM3JITXgwdHNC?=
 =?utf-8?B?VkdkL2JZamhvQXdtTW1FUXM1Sys2NVQ5UnZZOXBDOWlUaENkSnZRMHBmWDlO?=
 =?utf-8?B?ZFZVODdyNXF3eG1nSXc4QmNqcVZucG1xd0xBaDBhN05zOGpPdDlMMGlTWDlp?=
 =?utf-8?B?ZEtWWHl4T1FHTDZoK2N1M2l3MkpJeGo5WHpBSWJxTGpUSStKaEo2aXZqOGd0?=
 =?utf-8?B?MGdSUko4M3o1WTdnTjdqRXJMdDhrWnpaQ29VMnFMQnFhVkVLUDltL0JHcW1P?=
 =?utf-8?B?ZDdjbnhoSW9rc3R0c2U0UzVFeWhNVVlKaUMwV0xhaENUMm5ZeEVTT2dSOEk2?=
 =?utf-8?B?cmRYdXFIVWVrcitWck9oUGc5SkFtOEVHRCtuSWpzeFpHOHkya3pjNDlmN21O?=
 =?utf-8?B?SnRObkV2RzVwN2ZRcTRoeW5PZ3cxd1dNWDVBRnBoU1FMUCtXcjljWUorT1p4?=
 =?utf-8?B?bzRtbnMxK2pxUXM5SFczNVJZckZGQTZLZWtZVzJOSEFyQ1FRalNHNythb1RQ?=
 =?utf-8?B?N2hsS0wzeVhzOGwxRXpsRzZkaXR2SXFudXY3alBVUzIvSEZpR2twMnQybTh1?=
 =?utf-8?B?Y2J2UE9TVkRuYldVOURYd0R2aFgrdG1obFp4YVVZdTZuRlNhSVduY0NSWWR2?=
 =?utf-8?B?cWJ3U3o4cllneDRKQWdlUXpncExSODhXSldKSEFLeVpReTdNUVlpQ2MzKy9X?=
 =?utf-8?B?amdLaW0rYnlET080MkVkb25hUmJ0aE1RQWVodUYxS3p0MmNaYlEvRzVYMnln?=
 =?utf-8?B?U1VnTW96QWtGZ3F5QWZFRi82ZW9yd29pNmdkZXFNVnIzMWY3MUgxSmJUL05n?=
 =?utf-8?B?aGZhYzVxMkRXZFdoZms5VmI1K2lySHh0TEhoRFJqQWowendTODhIQ0c2WFBJ?=
 =?utf-8?B?ZVVRWENlM3NFZ3dwNFFIdzZyVi9tZWJPNmNscVhLaVdhaEVhQUdmTUhQWHBm?=
 =?utf-8?B?Tmc3TUlXRzVZdG1HRVJKZGJTeWJPZTNvZzRreGg5TGpVTTc0aFhrbTRNNndB?=
 =?utf-8?B?OE1aYkVTSkwwdDlhbjlIcUIrdmdJM1BldTV0M3B3bDNlQktpSDRueGJseTh2?=
 =?utf-8?B?RHVNNkZnVlFzOXFSL0V1Z0tvVGQrMkpLVEVCVnFjZG5WaFQyY0s2T20zbWp2?=
 =?utf-8?Q?rG7M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <59B240469752B342A22BEB2BDAC015B4@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af6c3477-12f7-4f9f-c92d-08ddaf078a0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 08:01:47.1872
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VzJ3vCJdm8lVek70LX4fnoWb4O4uLHDyIa451rs02XUYYUqc/7p/mkG09ZgM4I+p8B8exKl3bnHlGjhFnLmimg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8859

T24gMjAyNS82LzE4IDIyOjM3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTIuMDYuMjAyNSAx
MToyOSwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL21zaS5j
DQo+PiArKysgYi94ZW4vZHJpdmVycy92cGNpL21zaS5jDQo+PiBAQCAtMTkzLDYgKzE5MywzMyBA
QCBzdGF0aWMgdm9pZCBjZl9jaGVjayBtYXNrX3dyaXRlKA0KPj4gICAgICBtc2ktPm1hc2sgPSB2
YWw7DQo+PiAgfQ0KPj4gIA0KPj4gK3N0YXRpYyBpbnQgY2ZfY2hlY2sgY2xlYW51cF9tc2koc3Ry
dWN0IHBjaV9kZXYgKnBkZXYpDQo+PiArew0KPj4gKyAgICBpbnQgcmM7DQo+PiArICAgIHVuc2ln
bmVkIGludCBlbmQsIHNpemU7DQo+PiArICAgIHN0cnVjdCB2cGNpICp2cGNpID0gcGRldi0+dnBj
aTsNCj4+ICsgICAgY29uc3QgdW5zaWduZWQgaW50IG1zaV9wb3MgPSBwZGV2LT5tc2lfcG9zOw0K
Pj4gKyAgICBjb25zdCB1bnNpZ25lZCBpbnQgY3RybCA9IG1zaV9jb250cm9sX3JlZyhtc2lfcG9z
KTsNCj4+ICsNCj4+ICsgICAgaWYgKCAhbXNpX3BvcyB8fCAhdnBjaS0+bXNpICkNCj4+ICsgICAg
ICAgIHJldHVybiAwOw0KPj4gKw0KPj4gKyAgICBpZiAoIHZwY2ktPm1zaS0+bWFza2luZyApDQo+
PiArICAgICAgICBlbmQgPSBtc2lfcGVuZGluZ19iaXRzX3JlZyhtc2lfcG9zLCB2cGNpLT5tc2kt
PmFkZHJlc3M2NCk7DQo+PiArICAgIGVsc2UNCj4+ICsgICAgICAgIGVuZCA9IG1zaV9tYXNrX2Jp
dHNfcmVnKG1zaV9wb3MsIHZwY2ktPm1zaS0+YWRkcmVzczY0KSAtIDI7DQo+PiArDQo+PiArICAg
IHNpemUgPSBlbmQgLSBjdHJsOw0KPj4gKw0KPj4gKyAgICByYyA9IHZwY2lfcmVtb3ZlX3JlZ2lz
dGVycyh2cGNpLCBjdHJsLCBzaXplKTsNCj4+ICsgICAgaWYgKCByYyApDQo+PiArICAgICAgICBy
ZXR1cm4gcmM7DQo+PiArDQo+PiArICAgIFhGUkVFKHZwY2ktPm1zaSk7DQo+PiArDQo+PiArICAg
IHJldHVybiB2cGNpX2FkZF9yZWdpc3RlcihwZGV2LT52cGNpLCB2cGNpX2h3X3JlYWQxNiwgTlVM
TCwgY3RybCwgMiwgTlVMTCk7DQo+IA0KPiBXaHkgbm90IHVzZSB0aGUgbG9jYWwgdmFyaWFibGUg
InZwY2kiIGhlcmU/DQpUaGF0J3MgbXkgZmF1bHQsIHdpbGwgY2hhbmdlIGluIG5leHQgdmVyc2lv
bi4gQW5kIHRoZSBzYW1lIGluIG1zaXguYw0KDQo+IA0KPiBJIGFsc28gdGhpbmsgdGhpcyAocmUp
YWRkaW5nIHdhcnJhbnRzIGEgY29tbWVudCwgYXMgdG8gd2h5IHdlIGRvIHRoaXMuDQpJIHdyaXRl
IGEgZHJhZnQgYXMgYmVsb3csIGNvdWxkIHlvdSBoZWxwIHRvIG1vZGlmeT8NCiAgICAvKg0KICAg
ICAqIFRoZSBkcml2ZXIgbWF5IG5vdCB0cmF2ZXJzZSB0aGUgY2FwYWJpbGl0eSBsaXN0IGFuZCB0
aGluayBkZXZpY2UNCiAgICAgKiBzdXBwb3J0cyBNU0kgYnkgZGVmYXVsdC4gU28gaGVyZSBsZXQg
dGhlIGNvbnRyb2wgcmVnaXN0ZXIgb2YgTVNJDQogICAgICogYmUgUmVhZC1Pbmx5IGlzIHRvIGVu
c3VyZSBNU0kgZGlzYWJsZWQuDQogICAgICovDQoNCj4gDQo+IEphbg0KDQotLSANCkJlc3QgcmVn
YXJkcywNCkppcWlhbiBDaGVuLg0K

