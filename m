Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05971AE7847
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 09:16:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024381.1400271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUKNB-0003Yl-0C; Wed, 25 Jun 2025 07:16:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024381.1400271; Wed, 25 Jun 2025 07:16:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUKNA-0003WI-TN; Wed, 25 Jun 2025 07:16:44 +0000
Received: by outflank-mailman (input) for mailman id 1024381;
 Wed, 25 Jun 2025 07:16:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PEPZ=ZI=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uUKN8-0003WC-Nw
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 07:16:42 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2417::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56ebc6cf-5194-11f0-a30f-13f23c93f187;
 Wed, 25 Jun 2025 09:16:40 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by MW4PR12MB7358.namprd12.prod.outlook.com (2603:10b6:303:22b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Wed, 25 Jun
 2025 07:16:36 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8835.027; Wed, 25 Jun 2025
 07:16:36 +0000
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
X-Inumbo-ID: 56ebc6cf-5194-11f0-a30f-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KGbjalnRBi203WN8q4mPFY9SD5pyVecyEx9Y0GZJeY9P3WFQVA2QJhLlI43FehqH+kWleWqaoM6jmKSRqYd6NiB2ldaqC9tdeYdsUroTRJ6bxtsHiBnMHqOm3PCBxGs1A7Mxgqkn6+wh/xt1H4w37Z/AK4dto2fNaaARNwp7Ya+mb6iNCINIVv34d3o+m4B+WOW0W+3htcgvS691RkCZ83bDTSgB5kPjZReofn2fr6bnbu++A4po354yMo09VC4ap+MUKWFtScs4kN8V7gikhVbGLrmGS5AO4gFIKDI1IbIBmDezAk+QNlS/SwhzGO4LvA4Gg5AnjLGZAcmre3wcMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=50UXk7v/g9AC4US9wrzKl3fIkcen8nYuLvGMZhtnf5M=;
 b=VxzTUTY9OBqCEJlAeSK765g2tR5ayqSDADzLDR8opqZQ3OJirDcg72kclWoB+CxLL6YijaZXOhJRpfTIIldEEkBMyEaHuF8Xcah/qR3MjvhydU1YlRtq0YBE8gq3HdDlsaFkAB90jIXymQhvsgirxReqWo5TzpB/4+LtLr/Ty/qSfqGuK3aQa8TUmQ3Dkit8MZy8lDv7Jf0N8C2f90lyiP9RqRa537Z/trYINoU7EYIATq1JEDqKuKt68q9FiqbyxrXjtUjmD/CXnWhcWCoGDvUxEPGdTABpe6oCT9alSACtnBwkc5tR9FMq5nsnrmsGifODFTjsUTgttZ/LrCm24A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=50UXk7v/g9AC4US9wrzKl3fIkcen8nYuLvGMZhtnf5M=;
 b=ynLFrmWi5bcbMgcTBd3FvDPRawuw76DxZLy09Rlvg3S9iKLvrMKTaqs/x3qyWAt+oplCTU4i/CcC1sLwhKo6M3hx0U1xpS1FcrX0rUO/o+f8TICR03BpWAl+qH9CgBZhEY5Iax64gzJYhCaUUMOe8znYYMYFjzUW7Iwm6FbCwKA=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v6 7/8] vpci/msi: Free MSI resources when init_msi() fails
Thread-Topic: [PATCH v6 7/8] vpci/msi: Free MSI resources when init_msi()
 fails
Thread-Index: AQHb23yeMT8YFCMR3kaLDqQP1+DTK7QJCD4AgAme+gD//4QlAIAB4iSA
Date: Wed, 25 Jun 2025 07:16:35 +0000
Message-ID:
 <BL1PR12MB58499585BA47004587A34C93E77BA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <20250612092942.1450344-8-Jiqian.Chen@amd.com>
 <773c448a-d814-458f-ad83-e9740e724408@suse.com>
 <BL1PR12MB584989B1F9DF290C15CD2F9EE778A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <c9cdbb69-4b68-4b77-bcca-feacc800e3d6@suse.com>
In-Reply-To: <c9cdbb69-4b68-4b77-bcca-feacc800e3d6@suse.com>
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
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|MW4PR12MB7358:EE_
x-ms-office365-filtering-correlation-id: 823f758a-10e7-4967-d8b4-08ddb3b8387d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WUIyUmU0YjFpQSsrWW5GMzVzL3lCc3dydWllemtIb2JXS2g1WlIxczZhaWhp?=
 =?utf-8?B?dlFXQ1FwcUR4bzU5RjYzNitFSFozTVF6djVpM3RFU3pLZHl5ZjJpOExoTUJU?=
 =?utf-8?B?SHlyN0oxUXU4MG9mQnBhS09majhTc09LeTAzd1V1UDJ2TTJOOUFGTG1QekQ4?=
 =?utf-8?B?N2xrUndGbGI3bWpXZWNiWklXbGxreGpWRms0NFJJaGc0WHV2V283TXF5dlNj?=
 =?utf-8?B?cWJSK29iRE5Nak0ybzlpVGx6bkozUWp6Zi92a0ZNVE83ZlB2RncxeUdXelVv?=
 =?utf-8?B?T05aY1pDS3BnZGR1eEx1akFPRGhjeE05ZEdVdGttK21qS1BnVXJtb04wcE43?=
 =?utf-8?B?TEoybmpkZzJ2MU5hYnlrL1ZOL0tRSlpyTzBvclY5S0g4VGIyUkw5LzNnU25L?=
 =?utf-8?B?eVZWNno2NXVpOUpjNEJrd2JrNHplR0RRZVBvWFMyMU43V2NwZXhQclhFV1Vm?=
 =?utf-8?B?bUljZDVZUTZ0QVlVVkxNejl2RDI1TEQ5TmY5eEl3UEg1Vmo3UlhhOUxIdGhR?=
 =?utf-8?B?cjg0b1BvUDdadUNONGF3YWVjV1UyWGhnS3BXRmtYRUpHa1U2NndxTWdTS0VT?=
 =?utf-8?B?WU9jNXhyV0E4U3B2QjdhVWtYY3UrMUU1MW9KdVdRZzVwRFoyQk93SGpwejVu?=
 =?utf-8?B?TU5QNGFUdWFNcXlqaHhWWE5sSndEMXpjL1RLa1NQbnhicW5McFRTUkhrYkIx?=
 =?utf-8?B?bE9qckdRZzlkYndzVStMK2lsOW8rMEpJaGZDYUdMR2pWV3Z3OTdMWFNNRlJB?=
 =?utf-8?B?WE1aZE5vZ3V0aW90QlVUU0dJKzBqMlVDZGxiczlkeDRiQWxOM2RNeURCWDFE?=
 =?utf-8?B?T2lXK1p3VktPOVFoOEJsOUtSOHQwcXVYd0IvYnQ3dCtVUXFvOGc4OXhCN3cw?=
 =?utf-8?B?ajVkUVQweGZTR2lkZjR6SDk3Q2VrbjhJSDFQa3poRjUrTXdNWkR0WEFHdms4?=
 =?utf-8?B?bzZENEw4S1liM3Jacyt2ZUZlYlo5Q1Q2YmxWN3phakZ4a1UzcllVNEJCWDNt?=
 =?utf-8?B?Z21Kbm9KTTZFREJHc0hqMFdHTFkrUVh2Y3FPb2Z5NElOalNuTGlmZGFZMkxx?=
 =?utf-8?B?MWtEdUx2UUh2Vmp2K1FrYUZsYzZ5OE1HZC9WdW5ybjFxc2lxMWxQeFJkUm84?=
 =?utf-8?B?MERHaWp6N0V5T2lkVjJOUkZWTytvVW5vd2VzVWZOd2NBNWN0WWVvWTZobDJH?=
 =?utf-8?B?OVpGWlA2NlFoMmdZMzVRaWc5ejdtbEZCemRXenArWVVoNUpqQTBqWkVvcnE5?=
 =?utf-8?B?d3ZCdmxuVFNwUVNtL0tnclF2MlVQNXZrNG9McURiZ1VSeVNSdXZxSFpXWmNZ?=
 =?utf-8?B?cU1Od0ZnaWNZcCszV1VURHdUYVN1MjBCTGMwYUZib1QybXNISUdTY3IzR1da?=
 =?utf-8?B?TjkxdFJ2czZoZnhlaE1LNUtzRlRaUnk2RURiRDFlMmpacVRmWGJqZVI3Mm5S?=
 =?utf-8?B?ek4zKzFRY2lFUnFJZDdWOE1GT3krcGE3Y2toaUdvMytQa054UXRJbjkvQnpl?=
 =?utf-8?B?OVZiM0lsSDVpUDVydXZIelpwOS83TEwzbXNrenR2ZFZJazZMaHcxbHhqMzZq?=
 =?utf-8?B?MGhZTEwvNjNTYVc4TXVON0xWNWkrcU10L3NNanMyYmJrNDVKdU5oL2xWQ3A4?=
 =?utf-8?B?OENzWDBnSDIyRTA5Q0VQVkxkVjBIY3pPMnJ3Qm9XYndwajJRQm4xRDQvdmVS?=
 =?utf-8?B?UlNQSEJ6WDB3U2tra25YeG5SNVUydDZMU0FLTWp1ZmY4RWhTNDNkOFZML0Vz?=
 =?utf-8?B?ODA3MURNdTdzY09BRmFlQnArQWw2NHE3S1FZUHNVNjNpOElKUGxsV28wRnVP?=
 =?utf-8?B?ZmQwVGtVTUNTUllUZ2lzbE9BRGxqWUI5MEo0WVpkU1FnOHBSK2dwVVFLQUIy?=
 =?utf-8?B?eUpqaHY3RlQ2bDgxdXMvdFh0RWdzbVNjUTIrK0ErUk1QZlZWdU5pam4rME1P?=
 =?utf-8?B?NG9OSnBhdmgyUnVuSVBWVGJaUkR6Q0lSNWVqRjkrZitkQXowSDRxcXB4dlRE?=
 =?utf-8?Q?Mws0Q9xMVqO7ESk6RtBM9brOmbrt08=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MnB1aVR4cVovbmdWQWFVUkNwNHp2UTBmeFZMYlBsZ2gxVWRlUnVtM0pXcVFG?=
 =?utf-8?B?bWp0cmpwMVhHUEpwOE5VcTZJRnJpenV3WWdjeHBha1JzZW52YlFMK2IwYTdj?=
 =?utf-8?B?RnVOMW1obFVqMVc5S2JnQmhYa3VUVmYwbzZCNkJpcHk0RWxZbHpwUXlzNmpm?=
 =?utf-8?B?RmcxaFd2aEFEMnhVWXRBVnlSWVNOVGl4RklOQW5vMVJFY3hWOEo5UHA1ZTNt?=
 =?utf-8?B?UThkalZ1U2FvdXU3RVM2ejA2SjRwYktuQjdoUnFSSVVMQnJCZDZzNkVzb0d6?=
 =?utf-8?B?akZJNzBHcWVETEhXVmtFZW5pbjFyZ3VRUGo4Ti9JR2pjRS9majZsNUJQQ0E3?=
 =?utf-8?B?QjhvN21tVDdVU2tsbEdjTjZ0ci95UkhMdzZ1c1ZnWlk2MEdEWUtSMmNPZVhj?=
 =?utf-8?B?ZVpLNWZnMlNXVDdscTkzWlMyWVBNZUtQUkNhek9GMlRLZjBwMnVzV0tqSGpQ?=
 =?utf-8?B?bUs2ZDJrU0pMSUdDNEJDVStyM092RXFETkJLc3FtQmlSKzZIU0ZmOWhMZFdB?=
 =?utf-8?B?ZW85Undwby9YN2t0N3VHTU0wM2pDeXNRcGlCZkpHUE9LLzFDMGIrdzlBbG5M?=
 =?utf-8?B?YVRrUVJFQUt6VDhQQUFZYW5LMVVKZ0tXc2YzUnlCc0diM3lxQ1V5aDBqamt0?=
 =?utf-8?B?N0tsMXlNRW9Sbm9rNzV1MytEQUJTNE04NHJJbjZIbWJEcjBuNWdVRUhQZmVw?=
 =?utf-8?B?OVp6MlJMeFRla3ZubnI5MUgrcFkvcndGNWVKWDdka1hnUnRpV3FRN0FuVGk1?=
 =?utf-8?B?Q0tQWXlQb3U1ZGtlcUtWT1QzdFdVOUZCekE5a09EbnFhdTAxMVdzNStZbWx0?=
 =?utf-8?B?TFJ6ZlNUa1owc0VtNTJnQjNUblc2bERTa0lSMGJuTGlCVXJxRFQ0OG5iRHJa?=
 =?utf-8?B?VGFxcGpnZS9tdFEwNGFjQWhYMlRJUkRsbExpdXU4MGdWR0lwL1Q4QW53ZWlB?=
 =?utf-8?B?TTduRDZvOEV0RGFMaHQyK1lkdXhDQUtsOHpqblRXUmUra1lITGJzdnZkeGpK?=
 =?utf-8?B?bHF1bXJIT1Y4QURrczg3VENJZ3MzZWd3SmJtVWZBeTZTOUM1U3FkaW5LTk5U?=
 =?utf-8?B?ZHlydmJLMmJrMHJHWGRHQXpsK3pDYU1IRmw5c3RQR3lxVXFEeEhadUQ4cGcx?=
 =?utf-8?B?eDR1MmZrSDZXSktpdDU2TzZra0pIWWFwZmtYUDNqRzUxZlF3cnJCMUpIdFBk?=
 =?utf-8?B?d3dtaDR2dkEwdzRwTHY1U0dLaWEwcnhTS0J4M2xwSVVoamlMaGdyWEhvN3Zk?=
 =?utf-8?B?ZUQ3RURqeFRJUHcwMmhXU05pTUZORXBLK0pQQ0YvQzRhZFFDWXhHQ1dtbW40?=
 =?utf-8?B?SzBSdlFzem9pYnhpZUJqM0FGWk1zL2Y2c3duNTBlVVFjV2ZnTU9QUjVHdkNN?=
 =?utf-8?B?blJ3b0ZOSlBwRTZ2MVhGSGdreHl0WER5WkhrTEdZYUIwU3hlemF2R0ZmU2Uw?=
 =?utf-8?B?OU9hMURvSlV6c0k0YmgyRWRyanhJbzVDZ1ZxRCt6OWxmSmlmQWcvYmJnTW5s?=
 =?utf-8?B?YU56RlBqNHNiMDdsenkxeEl3VTYvK09FZHNrZzh5Ui8rNVYweHZLb1JmUllK?=
 =?utf-8?B?QVZFclY3NkxkVWVyekc4Q0FqTzhhUzgrT1FZc0xyVWlsaEk1RTJnbUlDdmIx?=
 =?utf-8?B?RTRMQTg1UWc4Q0wrSWQvRnlQbTJHT2kwbTVKVFQ5dlBqTUJSWjB6Mzd2OVMx?=
 =?utf-8?B?QWFWeVNIVkZXbXhIdWpGNkNVN1VVd01PUFh1MmQvenpielo3Z2p0L3BSMGkz?=
 =?utf-8?B?OVB6aHF6QXN5NUhCcE8zSU5zcHRJeHhhd2NsN0ROVDA0RDhLN2dORXNmM1Ji?=
 =?utf-8?B?eHEvUk0vR0xYWTZpVWo5aUtJTW5IUDIxc3hQcGlIRHN5R1k1RFFnbTFKa042?=
 =?utf-8?B?cE9HWWlkUUR0NjdXSWZUQjhIc0toTTdRdU1uUTRnS3hXTm1zZS9LaG9wb2Zo?=
 =?utf-8?B?N2lnMWdPKzE5VnZRQkthZnNwRWJjQzFHSk1KQUtncFBJMm10dFNnakJpNjEx?=
 =?utf-8?B?RTNEam5tdERYRHp3cEZqTUFhRXlpV2hGbmw4MWcyRWxHZENNemRrbkFvNVlX?=
 =?utf-8?B?ZG50VG1FeXBJeVBmUEpEbVJiZlR6MXNnUk4wWG1EcVgrYXdhdXhieUJaaEdF?=
 =?utf-8?Q?x45A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B924DD1E380C34B9F2923A9AB94F622@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 823f758a-10e7-4967-d8b4-08ddb3b8387d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 07:16:35.9127
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LLLsMC2qjBYcD9zLmdFUYOImaj3JqnI6P63Hi75FVcOFe69Cvm1ulGtVakrRytCNfc4mnqSx36nlyUKd8US37A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7358

T24gMjAyNS82LzI0IDE4OjE3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjQuMDYuMjAyNSAx
MTo0OSwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNS82LzE4IDIyOjQ1LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAxMi4wNi4yMDI1IDExOjI5LCBKaXFpYW4gQ2hlbiB3cm90ZToN
Cj4+Pj4gLS0tIGEveGVuL2RyaXZlcnMvdnBjaS9tc2kuYw0KPj4+PiArKysgYi94ZW4vZHJpdmVy
cy92cGNpL21zaS5jDQo+Pj4+IEBAIC0xOTMsNiArMTkzLDMzIEBAIHN0YXRpYyB2b2lkIGNmX2No
ZWNrIG1hc2tfd3JpdGUoDQo+Pj4+ICAgICAgbXNpLT5tYXNrID0gdmFsOw0KPj4+PiAgfQ0KPj4+
PiAgDQo+Pj4+ICtzdGF0aWMgaW50IGNmX2NoZWNrIGNsZWFudXBfbXNpKHN0cnVjdCBwY2lfZGV2
ICpwZGV2KQ0KPj4+PiArew0KPj4+PiArICAgIGludCByYzsNCj4+Pj4gKyAgICB1bnNpZ25lZCBp
bnQgZW5kLCBzaXplOw0KPj4+PiArICAgIHN0cnVjdCB2cGNpICp2cGNpID0gcGRldi0+dnBjaTsN
Cj4+Pj4gKyAgICBjb25zdCB1bnNpZ25lZCBpbnQgbXNpX3BvcyA9IHBkZXYtPm1zaV9wb3M7DQo+
Pj4+ICsgICAgY29uc3QgdW5zaWduZWQgaW50IGN0cmwgPSBtc2lfY29udHJvbF9yZWcobXNpX3Bv
cyk7DQo+Pj4+ICsNCj4+Pj4gKyAgICBpZiAoICFtc2lfcG9zIHx8ICF2cGNpLT5tc2kgKQ0KPj4+
PiArICAgICAgICByZXR1cm4gMDsNCj4+Pj4gKw0KPj4+PiArICAgIGlmICggdnBjaS0+bXNpLT5t
YXNraW5nICkNCj4+Pj4gKyAgICAgICAgZW5kID0gbXNpX3BlbmRpbmdfYml0c19yZWcobXNpX3Bv
cywgdnBjaS0+bXNpLT5hZGRyZXNzNjQpOw0KPj4+PiArICAgIGVsc2UNCj4+Pj4gKyAgICAgICAg
ZW5kID0gbXNpX21hc2tfYml0c19yZWcobXNpX3BvcywgdnBjaS0+bXNpLT5hZGRyZXNzNjQpIC0g
MjsNCj4+Pj4gKw0KPj4+PiArICAgIHNpemUgPSBlbmQgLSBjdHJsOw0KPj4+PiArDQo+Pj4+ICsg
ICAgcmMgPSB2cGNpX3JlbW92ZV9yZWdpc3RlcnModnBjaSwgY3RybCwgc2l6ZSk7DQo+Pj4+ICsg
ICAgaWYgKCByYyApDQo+Pj4+ICsgICAgICAgIHJldHVybiByYzsNCj4+Pg0KPj4+IFRoaXMgaXMg
YSBkaWZmaWN1bHQgb25lOiBJdCdzIG5vdCBhIGdvb2QgaWRlYSB0byBzaW1wbHkgcmV0dXJuIGhl
cmUsIHlldA0KPj4+IGF0IHRoZSBzYW1lIHRpbWUgdGhlIGhhbmRsaW5nIG9mIHRoZSByZWdpc3Rl
ciB3ZSdyZSB1bmFibGUgdG8gcmVtb3ZlIG1heQ0KPj4+IHN0aWxsIHJlcXVpcmUgZS5nLiAuLi4N
Cj4+Pg0KPj4+PiArICAgIFhGUkVFKHZwY2ktPm1zaSk7DQo+Pj4NCj4+PiAuLi4gdGhpcy4gVGhl
cmUgbWF5IHRoZXJlZm9yZSBiZSBtb3JlIHdvcmsgcmVxdWlyZWQsIHN1Y2ggdGhhdCBpbiB0aGUN
Cj4+PiBlbmQgd2UncmUgYWJsZSB0byAuLi4NCj4+Pg0KPj4+PiArICAgIHJldHVybiB2cGNpX2Fk
ZF9yZWdpc3RlcihwZGV2LT52cGNpLCB2cGNpX2h3X3JlYWQxNiwgTlVMTCwgY3RybCwgMiwgTlVM
TCk7DQo+Pj4NCj4+PiAuLi4gdHJ5IHRoaXMgYXQgbGVhc3Qgb24gYSBiZXN0IGVmZm9ydCBiYXNp
cy4NCj4+Pg0KPj4+IE1vcmUgZ2VuZXJhbGx5OiBJIGRvbid0IHRoaW5rIGZhaWx1cmUgaGVyZSAo
b3IgaW4gb3RoZXIgLmNsZWFudXAgaG9vaw0KPj4+IGZ1bmN0aW9ucykgbWF5IGdvIGVudGlyZWx5
IHNpbGVudGx5Lg0KPj4gRG9lcyBiZWxvdyBtZWV0IHlvdXIgbW9kaWZpY2F0aW9uIGV4cGVjdGF0
aW9ucz8NCj4gDQo+IE5vdCBzdXJlLCBzb3JyeS4gQnkgIm1vcmUiIEkgcmVhbGx5IG1lYW50ICJt
b3JlIiAod2hpY2ggbWF5IGp1c3QgYmUgY29kZQ0KPiBhdWRpdGluZywgcmVzdWx0cyBvZiB3aGlj
aCB3b3VsZCBuZWVkIHdyaXRpbmcgZG93biwgYnV0IHdoaWNoIG1heSBhbHNvDQo+IGludm9sdmUg
ZnVydGhlciBjb2RlIGNoYW5nZXM7IHNlZSBiZWxvdykuDQo+IA0KPj4gICAgIHJjID0gdnBjaV9y
ZW1vdmVfcmVnaXN0ZXJzKHZwY2ksIGN0cmwsIHNpemUpOw0KPj4gICAgIGlmICggcmMgKQ0KPj4g
ICAgICAgICBwcmludGsoWEVOTE9HX0VSUiAiJXBkICVwcDogcmVtb3ZlIG1zaSBoYW5kbGVycyBm
YWlsIHJjPSVkXG4iLA0KPj4gICAgICAgICAgICAgICAgcGRldi0+ZG9tYWluLCAmcGRldi0+c2Jk
ZiwgcmMpOw0KPj4NCj4+ICAgICBYRlJFRSh2cGNpLT5tc2kpOw0KPiANCj4gQXMgSSB0cmllZCB0
byBpbmRpY2F0ZSBpbiBteSBlYXJsaWVyIHJlcGx5LCB0aGUgZnJlZWluZyBvZiB0aGlzIHN0cnVj
dCBpcw0KPiBzYWZlIG9ubHkgaWYgdGhlIGZhaWx1cmUgYWJvdmUgd291bGQgbm90IGxlYXZlIGFu
eSByZWdpc3RlciBoYW5kbGVycyBpbg0KPiBwbGFjZSB3aGljaCBzdGlsbCAod2l0aG91dCBhcHBy
b3ByaWF0ZSBjaGVja2luZykgdXNlIHRoaXMgc3RydWN0Lg0KSG1tLCBidXQgYWxsIGhhbmRsZXJz
IGFkZGVkIGluIGluaXRfbXNpKCkgdXNlIHRoaXMgc3RydWN0Lg0KU28gaXQgZG9lc24ndCBleGlz
dCB0aGUgY2FzZSB0aGF0IHdoZW4gYWJvdmUgdW5hYmxlIHRvIHJlbW92ZSBhbGwgaGFuZGxlcnMg
YW5kIHN0aWxsIHJlcXVpcmUgeGZyZWUgdGhpcyBzdHJ1Y3QuDQoNCj4gDQo+PiAgICAgLyoNCj4+
ICAgICAgKiBUaGUgZHJpdmVyIG1heSBub3QgdHJhdmVyc2UgdGhlIGNhcGFiaWxpdHkgbGlzdCBh
bmQgdGhpbmsgZGV2aWNlDQo+PiAgICAgICogc3VwcG9ydHMgTVNJIGJ5IGRlZmF1bHQuIFNvIGhl
cmUgbGV0IHRoZSBjb250cm9sIHJlZ2lzdGVyIG9mIE1TSQ0KPj4gICAgICAqIGJlIFJlYWQtT25s
eSBpcyB0byBlbnN1cmUgTVNJIGRpc2FibGVkLg0KPj4gICAgICAqLw0KPj4gICAgIHJjID0gdnBj
aV9hZGRfcmVnaXN0ZXIodnBjaSwgdnBjaV9od19yZWFkMTYsIE5VTEwsIGN0cmwsIDIsIE5VTEwp
Ow0KPiANCj4gWW91J3JlIGxvc2luZyB0aGUgZWFybGllciBlcnJvciBoZXJlLCBpZiB0aGVyZSB3
YXMgb25lLiBJZiB0aGlzIG9uZQ0KPiBzdWNjZWVkcywgLi4uDQpCdXQgaWYgcmV0dXJuIHRoZSBl
YXJsaWVyIGVycm9yIHRvIHRoZSBjYWxsZXIsIHRoaXMgZGV2aWNlIHdpbGwgYmUgdW51c2FibGUs
IHRoZW4gc3RpbGwgYWRkaW5nIHRoaXMgaGFuZGxlciB3aGVuIGFib3ZlIGZhaWxpbmcgdG8gcmVt
b3ZlIGhhbmRsZXJzIGlzIHVzZWxlc3MuDQoNCj4gDQo+PiAgICAgaWYgKCByYyApDQo+PiAgICAg
ICAgIHByaW50ayhYRU5MT0dfRVJSICIlcGQgJXBwOiBhZGQgZHVtbXkgbXNpIGN0cmwgaGFuZGxl
ciBmYWlsIHJjPSVkXG4iLA0KPj4gICAgICAgICAgICAgICAgcGRldi0+ZG9tYWluLCAmcGRldi0+
c2JkZiwgcmMpOw0KPj4NCj4+ICAgICByZXR1cm4gcmM7DQo+IA0KPiAuLi4gdGhlIGNhbGxlciB3
b3VsZCAod3JvbmdseSkgZ2V0IHN1Y2Nlc3MgYmFjay4NCj4gDQo+IEphbg0KDQotLSANCkJlc3Qg
cmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

