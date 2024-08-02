Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DED945688
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 05:11:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770072.1180927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZigb-0008Kz-PP; Fri, 02 Aug 2024 03:10:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770072.1180927; Fri, 02 Aug 2024 03:10:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZigb-0008IH-MB; Fri, 02 Aug 2024 03:10:33 +0000
Received: by outflank-mailman (input) for mailman id 770072;
 Fri, 02 Aug 2024 03:10:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uPwv=PB=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sZiga-0008IB-RN
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 03:10:32 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c697b911-507c-11ef-bc03-fd08da9f4363;
 Fri, 02 Aug 2024 05:10:31 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SN7PR12MB8026.namprd12.prod.outlook.com (2603:10b6:806:34b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Fri, 2 Aug
 2024 03:10:27 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7828.021; Fri, 2 Aug 2024
 03:10:27 +0000
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
X-Inumbo-ID: c697b911-507c-11ef-bc03-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sin2slZgl7la9FUYFy/2478H5PKVZduxmSTJXGF1qbVF9eMhUIlTePWo/LRxfmrbGFOMB7YohqHRr9N127VZvCIyp1jBLnIGQCTmnNZTVvOGMHRkSyW+8cNcbqK0vNCqde27JC8VgM1jGtV3svh6eLUppBIG5joqRll7/iC/HBtaoD1o6bxg4RX4E9hDVninlEqBImXD8yFxhu5S1JmrISHt7nVVZs6atldj0/VP5quPui9CujMZyYD/DUwushoB4dceDSRGbBKcjyqoTCEd80f3fy/UPjQ/8wlsTTRD+4B16c2QpmWxPXRggcFvTBRBIRuJ3+7YT48aUcDUt++A9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pqel10zEWLS7z0A5ZepGsKakczPNFeoQZAGotMe0GLo=;
 b=u/irJNnmwOK8wrq5Cb2F9qr1yJ3BipWUyRLmAml8CCmQMBqLRtKAarnrea6gFWrAfBsADPxsGsAdOESgrEhv9TKWsXmt+ljVZUQlJB1BTS6OmQZQxU2JYSOUZ5a4BuZNDWM9zFwxgb2khv9h4XeIkdmGxVfC5as553Cm2FLb45nKzORr/dGnxsehGRxgdIIs8ZXCb5GK92qFfysX2u2sNF+XVNXjwnXUQ15hEy0hIQjibG6AFY21xsHZyop9w710p8fSN1g9ZTT+tB/Pni14ZfGrawx6NJBHEde4c6ofH2xK/Sz5oUepUwse6Cd6i+VBnKMyZ1zRGceEY7wQ01H2lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pqel10zEWLS7z0A5ZepGsKakczPNFeoQZAGotMe0GLo=;
 b=YQE0ff5AohgiVFpjagHlmXFr1dQbUkRR/xajwFwlLDDgen6GAN2v+Z19+irFAzc3X94qpSvZjdTSXQ8qKomBY4gt10qGkg5uKk2HIxjqZs6RJqdBxBDHZ+WTbQviazoA3kJaDBzNZqVsw5vrgG7QP6zFYxGsLhtvNGqX/9s67to=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei
 Liu <wl@xen.org>, George Dunlap <gwd@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v12 4/7] x86/domctl: Add hypercall to set the access
 of x86 gsi
Thread-Topic: [XEN PATCH v12 4/7] x86/domctl: Add hypercall to set the access
 of x86 gsi
Thread-Index: AQHa0SvYL4tONjoIyEuzfSK6fk2TK7ISY3CAgAGQQYA=
Date: Fri, 2 Aug 2024 03:10:27 +0000
Message-ID:
 <BL1PR12MB58490598FF7FEAE291DCDAABE7B32@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-5-Jiqian.Chen@amd.com> <ZqtsQwZNyFzflDQt@macbook>
In-Reply-To: <ZqtsQwZNyFzflDQt@macbook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7828.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SN7PR12MB8026:EE_
x-ms-office365-filtering-correlation-id: a7143719-a158-4481-e77f-08dcb2a0a8b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eVV0MlhZY2JMM2NPSlNmbnJMVXMyZE9Ub1Fra2UzaXJLNWI4TStOODdsZWZJ?=
 =?utf-8?B?TXdpaklYcWxHdEpoaEdNYUFyRlg0VmhpcUF6alFWME5qMndVYTNDSkpUTVNp?=
 =?utf-8?B?ZHV0OVNNeXplb0I3YVFzWlNIMlNnOE1vT0RNL1BISEF6bFltT1VMNTluVXVm?=
 =?utf-8?B?b2x4b2duR3JmL1VicXVIUzVkQThiK2lqOWlJTUdjdkxqNk1sVHowRWRWM1hw?=
 =?utf-8?B?V0VvTURkMmxuaDE5NlBqWmlBMXlib0VYY2owZjVJQlBLMkhNaEVVd0lmVzFy?=
 =?utf-8?B?TFJidk0wS1BBb0ljRWs4TzV6ajJGWUpoV1VMRnNRdWJmelNiajYyY1ZldENL?=
 =?utf-8?B?MW9mV2ZEWnhsSWExSFBaTUpDNzlNMVJKck1JSjk3K1h5cE1Md29EY3BjZGNH?=
 =?utf-8?B?TFVlOUE1ZlhXZTRCQmNqeG9ncWgyVkNTcDIwR25OS0wrczVxUVFqZENFbHhx?=
 =?utf-8?B?dzFyM2p1L2dhUTFDcGIxVWhBSDJCaUd1Tm5SYVFCenp4dTA5QkJMNThxaFMz?=
 =?utf-8?B?cFhBZlN2MnhRK2I0YXlTYjdvUUxOZ3FMNFJlTThoUHBoWU95SUNJdG15a041?=
 =?utf-8?B?SFBINGptTXNqZkRZRDVLNmxkUThuVlJzRTNXeVpzQzVHbXhkNEZxMkhGNksx?=
 =?utf-8?B?RXY5aWZIYkVYUHF5Um5RSHVwdEZtMFpIWWRIOHROZHhldFpOOEVHcHcwdjY0?=
 =?utf-8?B?a1VpQnRNNjJxNkdWNmc1TWtBRWhpWnh4T1JJMUd5UXk0UzlMQXVHMGprTEhB?=
 =?utf-8?B?a09pSWZ2VkpTdnE5cndCMlZac280bTZNTEJZb0JJTVhWc3QrV05BNnJ5YkJp?=
 =?utf-8?B?MDNGd1Bud3lNWFpVUXFNUkpxRkdOV0tKaGx2ZVdPOUVmd1hEWWhRUUxISk94?=
 =?utf-8?B?YXhGcmRWZTY3OVVvekFDN3lmOGtNUTVjRHBsRGU2cVl4dURzbkhRcnRCcGtM?=
 =?utf-8?B?cnYzU1hNZHYzMVNzK05Eb1dNVFF0U2FRbzVJWFdwTkJadGNnWHlqdnNkS2xF?=
 =?utf-8?B?UTB5V3pXOHRQeXpJOG42b3IzeFBVbkJWQmdOL3ZRNW9QSEQ5VXJrc2ZpUzVY?=
 =?utf-8?B?N2g1THdQYStzNUpPVWw1Smo4T2Z5cTMxM05SQ2pqS3NzU0R4SEVnMStzWW05?=
 =?utf-8?B?VUYwSFZMNGNTa0xZQ3JRT2RqVXVoTjJSWWwzeXdpNVVqOEdFcHovRjVHd2FZ?=
 =?utf-8?B?MnRmenA5cm45K0h1VmZOek9uQ2R6a0NsOE9MK2taQllWK0w1ZUtyclpHOUhm?=
 =?utf-8?B?R3NrcHR1aFJralJvTWVoTEh5VDFmNk5OWHR6VzhiUWNCOUNhV1ZYS3ltY2Nz?=
 =?utf-8?B?d3lLbHNhWHNBOGVOMEdybm5lR3pNS0tYM2lEaUw0TWJZUkZkZzJ6SFFxcnRQ?=
 =?utf-8?B?VmJveWFvYXdGUHdXdmlqN1hHcC9aYUNpN212SlpHNi8xR2VaUkUvNFJKdlkz?=
 =?utf-8?B?ZjJtL2ZadXZFVmZEU0FQZkNSM1JmTzJUWndZVXJ1cWtCVVJxekZRbStqQnRt?=
 =?utf-8?B?MXh6S1ZFaXRhblFsUm5XK1JGUERhMG5lYXVTeVZvUFF3Tnd0VmVXQWlMMUxN?=
 =?utf-8?B?TmVQNkEzYVloNnA3OEtGR0lpd2traDY0blJ3UUdmTWZrT3BTd2gzNjdpMmRZ?=
 =?utf-8?B?cjRBbGZNMTdKTFRFZ2FNemdpRVgzQm8vcU4zUnQ0Z3FLcXA5NndWc29aYmo4?=
 =?utf-8?B?bngrQk51SjIvdmhXK3NleDlXeXNoTFptTmF1SlFaQXN3eEhoL1lMSlhXU3JO?=
 =?utf-8?B?NWp3L1czc2hoT01OYWQ1UzFqTFlobXlKbjJacnlHUnlvUktmNC9rc0hsbVdF?=
 =?utf-8?B?MFQrZUE4OVU0WHBrbUVIR1JRREhaWFB0eHJ1bEFGVEZ0am5LYUV1bjlWVnRR?=
 =?utf-8?B?ajZrZlJFQmwyQUJQVGNNTXlDbEVCK0VHZVJBQURiZVZIeXc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RE1IeGZCQ2Z4bHJvV3NqOUFQc3c1bklSQzdzeVVIT1JSbm54WWxpTTh2WWF6?=
 =?utf-8?B?SDl0Q25GS0swZGg0OVdXZVQrL2owdmFCdnZmbURFWXNTMEtjeXBrWTZuMEkw?=
 =?utf-8?B?ZFdadzlaTkFCUFAzV1pyblBaakpiNUZOMnk1UUFqT0s3SkNhTWRrQ0hLckNZ?=
 =?utf-8?B?VlVBUko4OEFBRWhWZU55L2tWTVFxVGhZb1dpOHo3Zmt3ZjArUWlpVDBSN2ZQ?=
 =?utf-8?B?VEJxMDVxcmtDTnZTZkQ2REh3b3hsMGphemJHMjIySHFqSUtaZVliMnJVYjNh?=
 =?utf-8?B?U3l3OWlNUUNSbWd1Slg2Qk5wSkQ3RnZuM1psbk1PbnMwYnU0ZmgwNXlUaGpB?=
 =?utf-8?B?eHZRZzVPMk1qY29PMXRodEpUWmZYSk9BVnU4b0dPVStYcEFpdGVtZi85c3Y1?=
 =?utf-8?B?bXZHSHh4Ri83MWFwY25YeTZZUUhodHY4bVR3UWtXSk9lem0wSlhDOHRtQkJs?=
 =?utf-8?B?NThUWVlEd3hVNW1USnhwV3pMbEM0S2JxcUdTbWcrOFZER2wrdm11ZTdSQnhn?=
 =?utf-8?B?akE1SzJyL1BBVjE0RXhEOXNiN2NrN2hSVktWRUhkeTN4TFdNQzk4dytzaTlX?=
 =?utf-8?B?Y3NXY3lFZ1poaXFQSWpFS3JhdFM2SVVqMDRFcS9xL0wxbGQwQnVzWHBPRlp5?=
 =?utf-8?B?WVNkNHBUU21SVm1JQ0NXcDN6NHQ0cG5KV3k5c1dhUUdGd2ZxckJSa2NQam0w?=
 =?utf-8?B?ajk1djlROVBTMnk3bGpmaU9QQ0Y5MDhhMjgrMVUvdHNBaDd4WVprdm9adm9J?=
 =?utf-8?B?VUpQcGZ0MENDbzZTMlZnekcwTVk5NE1VbGNKbzM3RktWY2lEdTc4Z3dtNVVX?=
 =?utf-8?B?ampBbk9jWjcyMmpBOGxsdlhFNVNQMXZYN2dNL1NEY2lmUUR1WnRtWWNEd0V6?=
 =?utf-8?B?VnJKSmNvUTNHRGpZSUFOTUV5SFQ3dzZIMEw1cFVIRFMvRkJTUGpadVRIcEs2?=
 =?utf-8?B?bWFjZ3FiVlZQZW02SWRyQzdZc0tNVzRjdkFCRWVXZ2xBdjBwSzUwdGJnNHlF?=
 =?utf-8?B?aVZUM3gyQ0dYREprT3VKR0dxaFVCbDgwOHE0Z2hjbW1WWHFMWWNla3hoS2Ey?=
 =?utf-8?B?eThMb0hXZlAzeTRwK0NPL0VqNVdHb05CcTg4Q044Zmx5d0tNSE9taDloZmp4?=
 =?utf-8?B?aU4zZlRSTnhwdHpCMkVkVEc3TkY1eCs1QjkwTktNWkEzcitHZ1JzUFdRK2wv?=
 =?utf-8?B?aVpnNFRlUkI2QlJSM1pUNkxMS0lqeDdXbS9EZWtRUkh6V2svR29YbmdGSEtM?=
 =?utf-8?B?WEFZUmViT3VrNWZ1MFhaeldtMUVMb0NVNllqQ0VIMTZPOTMza3NzVHpPWlNX?=
 =?utf-8?B?YXQxREk1eHVFbGJyeHpSVWRBZ3dMMWl5ZUs1eWZMOEt3WjA2RWF1bmh4NDRo?=
 =?utf-8?B?cTNPQktiUjRrdS9yV0RRbUszTElUbEZnZ0JlOEdXdHNIdm50elRDK1d4cGFm?=
 =?utf-8?B?YTZhRFRLa09ybUJJcmtrTDhjb2Q0N0dJakpnVll5eDc2UGZLcGN4ZlhwUGN5?=
 =?utf-8?B?QlNWNzd4N2pMK1hsWG03TkZtazJMZEtNRVUzRzhZcnZ0NkZDMzhuUGJ3cnNl?=
 =?utf-8?B?MldUaVJaNnlmRXZkWUVKdWtsYnFVbXhsbTExbGx2VDh2bC9oR0wxVld4QVUr?=
 =?utf-8?B?RTRCdlI4RjNVVjUycURpVXQ5NEVxTWJ2N0dJaGVQYjc5YmJkRlJoeGJwTEsv?=
 =?utf-8?B?VUVBaFJ4RUorRlh4WXV6cDFDdGVVMmpKdWp5TnlmdUlXS0c3QWxITTVKV29S?=
 =?utf-8?B?UXVuTi9NeE1OSW55dWFrRzF1a3NaRFkwR1N2TDd6bW4yMCtFMkhTMnNVNk5N?=
 =?utf-8?B?Z0NnSXdwL2RKZ3RsV3doN3VQdjBuQnZMSEJyNlpJNlMxamJERnNTMlh2eThn?=
 =?utf-8?B?UGJhdy9MVjcvZXRiQmVkN1pYOWM0eVFJbWJNM2lPdVNMTlFobUw3b2VEVkFG?=
 =?utf-8?B?WWFVN3VIWmozSTc5dnhkT2xscWN5L2J0MXRXQlU4L3kreUwyaklCbTJrelN0?=
 =?utf-8?B?TzZqc3hMUm1KMnBJcG1IMjhPVFVab3BzSUlLMlBnc0NTWXpKTE15ZGFtVUVD?=
 =?utf-8?B?TVhjSnllSjRoaE12U1VuZkMxeXVnRHJGNVJPNXAveG1Wa1JKcFU4SlNtTFhx?=
 =?utf-8?Q?ACCo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4CD2F62FF1081E4C8B4A97ED33A484A4@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7143719-a158-4481-e77f-08dcb2a0a8b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2024 03:10:27.4945
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /ueSGrqksabpEAODNrAngCUcLdZ/KJVZcFo6uKtQUCesb2jnX7IoNC213WUJCOGuRWFe82iiDiLkcslJp2xUUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8026

T24gMjAyNC84LzEgMTk6MDYsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIE1vbiwgSnVs
IDA4LCAyMDI0IGF0IDA3OjQxOjIxUE0gKzA4MDAsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4gU29t
ZSB0eXBlIG9mIGRvbWFpbnMgZG9uJ3QgaGF2ZSBQSVJRcywgbGlrZSBQVkgsIGl0IGRvZXNuJ3Qg
ZG8NCj4+IFBIWVNERVZPUF9tYXBfcGlycSBmb3IgZWFjaCBnc2kuIFdoZW4gcGFzc3Rocm91Z2gg
YSBkZXZpY2UNCj4+IHRvIGd1ZXN0IGJhc2Ugb24gUFZIIGRvbTAsIGNhbGxzdGFjaw0KPj4gcGNp
X2FkZF9kbV9kb25lLT5YRU5fRE9NQ1RMX2lycV9wZXJtaXNzaW9uIHdpbGwgZmFpbCBhdCBmdW5j
dGlvbg0KPj4gZG9tYWluX3BpcnFfdG9faXJxLCBiZWNhdXNlIFBWSCBoYXMgbm8gbWFwcGluZyBv
ZiBnc2ksIHBpcnEgYW5kDQo+PiBpcnEgb24gWGVuIHNpZGUuDQo+PiBXaGF0J3MgbW9yZSwgY3Vy
cmVudCBoeXBlcmNhbGwgWEVOX0RPTUNUTF9pcnFfcGVybWlzc2lvbiByZXF1aXJlcw0KPj4gcGFz
c2luZyBpbiBwaXJxIHRvIHNldCB0aGUgYWNjZXNzIG9mIGlycSwgaXQgaXMgbm90IHN1aXRhYmxl
IGZvcg0KPj4gZG9tMCB0aGF0IGRvZXNuJ3QgaGF2ZSBQSVJRcy4NCj4+DQo+PiBTbywgYWRkIGEg
bmV3IGh5cGVyY2FsbCBYRU5fRE9NQ1RMX2dzaV9wZXJtaXNzaW9uIHRvIGdyYW50L2RlbnkNCj4+
IHRoZSBwZXJtaXNzaW9uIG9mIGlycSh0cmFuc2xhdGUgZnJvbSB4ODYgZ3NpKSB0byBkdW1VIHdo
ZW4gZG9tMA0KPiAgICAgICAgICAgICAgICAgICAgICAgIF4gbWlzc2luZyBzcGFjZSwgYW5kIHMv
dHJhbnNsYXRlL3RyYW5zbGF0ZWQvDQo+IA0KPj4gaGFzIG5vIFBJUlFzLg0KPj4NCj4+IFNpZ25l
ZC1vZmYtYnk6IEppcWlhbiBDaGVuIDxKaXFpYW4uQ2hlbkBhbWQuY29tPg0KPj4gU2lnbmVkLW9m
Zi1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEpp
cWlhbiBDaGVuIDxKaXFpYW4uQ2hlbkBhbWQuY29tPg0KPj4gLS0tDQo+PiBDQzogRGFuaWVsIFAg
LiBTbWl0aCA8ZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbT4NCj4+IFJlbWFpbmluZyBjb21t
ZW50IEBEYW5pZWwgUCAuIFNtaXRoOg0KPj4gKyAgICAgICAgcmV0ID0gLUVQRVJNOw0KPj4gKyAg
ICAgICAgaWYgKCAhaXJxX2FjY2Vzc19wZXJtaXR0ZWQoY3VycmQsIGlycSkgfHwNCj4+ICsgICAg
ICAgICAgICAgeHNtX2lycV9wZXJtaXNzaW9uKFhTTV9IT09LLCBkLCBpcnEsIGFjY2Vzc19mbGFn
KSApDQo+PiArICAgICAgICAgICAgZ290byBnc2lfcGVybWlzc2lvbl9vdXQ7DQo+PiBJcyBpdCBv
a2F5IHRvIGlzc3VlIHRoZSBYU00gY2hlY2sgdXNpbmcgdGhlIHRyYW5zbGF0ZWQgdmFsdWUsIA0K
Pj4gbm90IHRoZSBvbmUgdGhhdCB3YXMgb3JpZ2luYWxseSBwYXNzZWQgaW50byB0aGUgaHlwZXJj
YWxsPw0KPiANCj4gRldJVywgSSBkb24ndCBzZWUgdGhlIEdTSSAtPiBJUlEgdHJhbnNsYXRpb24g
bXVjaCBkaWZmZXJlbnQgZnJvbSB0aGUNCj4gcElSUSAtPiBJUlEgdHJhbnNsYXRpb24gZG9uZSBi
eSBwaXJxX2FjY2Vzc19wZXJtaXR0ZWQoKSwgd2hpY2ggaXMgYWxzbw0KPiBhaGVhZCBvZiB0aGUg
eHNtIGNoZWNrLg0KPiANCj4+IC0tLQ0KPj4gIHhlbi9hcmNoL3g4Ni9kb21jdGwuYyAgICAgICAg
ICAgICAgfCAzMiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+ICB4ZW4vYXJjaC94
ODYvaW5jbHVkZS9hc20vaW9fYXBpYy5oIHwgIDIgKysNCj4+ICB4ZW4vYXJjaC94ODYvaW9fYXBp
Yy5jICAgICAgICAgICAgIHwgMTcgKysrKysrKysrKysrKysrKw0KPj4gIHhlbi9hcmNoL3g4Ni9t
cHBhcnNlLmMgICAgICAgICAgICAgfCAgNSArKy0tLQ0KPj4gIHhlbi9pbmNsdWRlL3B1YmxpYy9k
b21jdGwuaCAgICAgICAgfCAgOSArKysrKysrKysNCj4+ICB4ZW4veHNtL2ZsYXNrL2hvb2tzLmMg
ICAgICAgICAgICAgIHwgIDEgKw0KPj4gIDYgZmlsZXMgY2hhbmdlZCwgNjMgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2RvbWN0
bC5jIGIveGVuL2FyY2gveDg2L2RvbWN0bC5jDQo+PiBpbmRleCA5MTkwZTExZmFhYTMuLjRlOWU0
YzRjZmVkMyAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9kb21jdGwuYw0KPj4gKysrIGIv
eGVuL2FyY2gveDg2L2RvbWN0bC5jDQo+PiBAQCAtMzYsNiArMzYsNyBAQA0KPj4gICNpbmNsdWRl
IDxhc20veHN0YXRlLmg+DQo+PiAgI2luY2x1ZGUgPGFzbS9wc3IuaD4NCj4+ICAjaW5jbHVkZSA8
YXNtL2NwdS1wb2xpY3kuaD4NCj4+ICsjaW5jbHVkZSA8YXNtL2lvX2FwaWMuaD4NCj4+ICANCj4+
ICBzdGF0aWMgaW50IHVwZGF0ZV9kb21haW5fY3B1X3BvbGljeShzdHJ1Y3QgZG9tYWluICpkLA0K
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHhlbl9kb21jdGxfY3B1X3Bv
bGljeV90ICp4ZHBjKQ0KPj4gQEAgLTIzNyw2ICsyMzgsMzcgQEAgbG9uZyBhcmNoX2RvX2RvbWN0
bCgNCj4+ICAgICAgICAgIGJyZWFrOw0KPj4gICAgICB9DQo+PiAgDQo+PiArICAgIGNhc2UgWEVO
X0RPTUNUTF9nc2lfcGVybWlzc2lvbjoNCj4+ICsgICAgew0KPj4gKyAgICAgICAgaW50IGlycTsN
Cj4+ICsgICAgICAgIHVuc2lnbmVkIGludCBnc2kgPSBkb21jdGwtPnUuZ3NpX3Blcm1pc3Npb24u
Z3NpOw0KPj4gKyAgICAgICAgdWludDhfdCBhY2Nlc3NfZmxhZyA9IGRvbWN0bC0+dS5nc2lfcGVy
bWlzc2lvbi5hY2Nlc3NfZmxhZzsNCj4+ICsNCj4+ICsgICAgICAgIC8qIENoZWNrIGFsbCBiaXRz
IGFuZCBwYWRzIGFyZSB6ZXJvIGV4Y2VwdCBsb3dlc3QgYml0ICovDQo+PiArICAgICAgICByZXQg
PSAtRUlOVkFMOw0KPj4gKyAgICAgICAgaWYgKCBhY2Nlc3NfZmxhZyAmICggflhFTl9ET01DVExf
R1NJX1BFUk1JU1NJT05fTUFTSyApICkNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XiB1bm5lZWRlZCBwYXJlbnRoZXNlcyBhbmQgc3BhY2VzLg0KPj4gKyAgICAgICAgICAgIGdvdG8g
Z3NpX3Blcm1pc3Npb25fb3V0Ow0KPj4gKyAgICAgICAgZm9yICggaSA9IDA7IGkgPCBBUlJBWV9T
SVpFKGRvbWN0bC0+dS5nc2lfcGVybWlzc2lvbi5wYWQpOyArK2kgKQ0KPj4gKyAgICAgICAgICAg
IGlmICggZG9tY3RsLT51LmdzaV9wZXJtaXNzaW9uLnBhZFtpXSApDQo+PiArICAgICAgICAgICAg
ICAgIGdvdG8gZ3NpX3Blcm1pc3Npb25fb3V0Ow0KPj4gKw0KPj4gKyAgICAgICAgaWYgKCBnc2kg
PiBoaWdoZXN0X2dzaSgpIHx8IChpcnEgPSBnc2lfMl9pcnEoZ3NpKSkgPD0gMCApDQo+IA0KPiBG
V0lXLCBJIHdvdWxkIHBsYWNlIHRoZSBnc2kgPiBoaWdoZXN0X2dzaSgpIGNoZWNrIGluc2lkZSBn
c2lfMl9pcnEoKS4NCj4gVGhlcmUncyBubyByZWFzb24gdG8gb3Blbi1jb2RlIGl0IGhlcmUsIGFu
ZCBpdCBjb3VsZCBoZWxwIG90aGVyDQo+IHVzZXJzIG9mIGdzaV8yX2lycSgpLiAgVGhlIGVycm9y
IGNvZGUgY291bGQgYWxzbyBiZSBFUkFOR0UgaGVyZQ0KPiBpbnN0ZWFkIG9mIEVJTlZBTCBJTU8u
DQo+IA0KPj4gKyAgICAgICAgICAgIGdvdG8gZ3NpX3Blcm1pc3Npb25fb3V0Ow0KPj4gKw0KPj4g
KyAgICAgICAgcmV0ID0gLUVQRVJNOw0KPj4gKyAgICAgICAgaWYgKCAhaXJxX2FjY2Vzc19wZXJt
aXR0ZWQoY3VycmQsIGlycSkgfHwNCj4+ICsgICAgICAgICAgICAgeHNtX2lycV9wZXJtaXNzaW9u
KFhTTV9IT09LLCBkLCBpcnEsIGFjY2Vzc19mbGFnKSApDQo+PiArICAgICAgICAgICAgZ290byBn
c2lfcGVybWlzc2lvbl9vdXQ7DQo+PiArDQo+PiArICAgICAgICBpZiAoIGFjY2Vzc19mbGFnICkN
Cj4+ICsgICAgICAgICAgICByZXQgPSBpcnFfcGVybWl0X2FjY2VzcyhkLCBpcnEpOw0KPj4gKyAg
ICAgICAgZWxzZQ0KPj4gKyAgICAgICAgICAgIHJldCA9IGlycV9kZW55X2FjY2VzcyhkLCBpcnEp
Ow0KPj4gKw0KPj4gKyAgICBnc2lfcGVybWlzc2lvbl9vdXQ6DQo+PiArICAgICAgICBicmVhazsN
Cj4gDQo+IFdoeSBkbyB5b3UgbmVlZCBhIGxhYmVsIHdoZW4gaXQganVzdCBjb250YWlucyBhIGJy
ZWFrPyAgSW5zdGVhZCBvZiB0aGUNCj4gZ290byBnc2lfcGVybWlzc2lvbl9vdXQganVzdCB1c2Ug
YnJlYWsgZGlyZWN0bHkuDQo+IA0KPj4gKyAgICB9DQo+PiArDQo+PiAgICAgIGNhc2UgWEVOX0RP
TUNUTF9nZXRwYWdlZnJhbWVpbmZvMzoNCj4+ICAgICAgew0KPj4gICAgICAgICAgdW5zaWduZWQg
aW50IG51bSA9IGRvbWN0bC0+dS5nZXRwYWdlZnJhbWVpbmZvMy5udW07DQo+PiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL2lvX2FwaWMuaCBiL3hlbi9hcmNoL3g4Ni9pbmNs
dWRlL2FzbS9pb19hcGljLmgNCj4+IGluZGV4IDc4MjY4ZWE4ZjY2Ni4uN2U4NmQ4MzM3NzU4IDEw
MDY0NA0KPj4gLS0tIGEveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL2lvX2FwaWMuaA0KPj4gKysr
IGIveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL2lvX2FwaWMuaA0KPj4gQEAgLTIxMyw1ICsyMTMs
NyBAQCB1bnNpZ25lZCBoaWdoZXN0X2dzaSh2b2lkKTsNCj4+ICANCj4+ICBpbnQgaW9hcGljX2d1
ZXN0X3JlYWQoIHVuc2lnbmVkIGxvbmcgcGh5c2Jhc2UsIHVuc2lnbmVkIGludCByZWcsIHUzMiAq
cHZhbCk7DQo+PiAgaW50IGlvYXBpY19ndWVzdF93cml0ZSh1bnNpZ25lZCBsb25nIHBoeXNiYXNl
LCB1bnNpZ25lZCBpbnQgcmVnLCB1MzIgdmFsKTsNCj4+ICtpbnQgbXBfZmluZF9pb2FwaWMoaW50
IGdzaSk7DQo+PiAraW50IGdzaV8yX2lycShpbnQgZ3NpKTsNCj4+ICANCj4+ICAjZW5kaWYNCj4+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaW9fYXBpYy5jIGIveGVuL2FyY2gveDg2L2lvX2Fw
aWMuYw0KPj4gaW5kZXggZDJhMzEzYzRhYzcyLi41OTY4YzgwNTU2NzEgMTAwNjQ0DQo+PiAtLS0g
YS94ZW4vYXJjaC94ODYvaW9fYXBpYy5jDQo+PiArKysgYi94ZW4vYXJjaC94ODYvaW9fYXBpYy5j
DQo+PiBAQCAtOTU1LDYgKzk1NSwyMyBAQCBzdGF0aWMgaW50IHBpbl8yX2lycShpbnQgaWR4LCBp
bnQgYXBpYywgaW50IHBpbikNCj4+ICAgICAgcmV0dXJuIGlycTsNCj4+ICB9DQo+PiAgDQo+PiAr
aW50IGdzaV8yX2lycShpbnQgZ3NpKQ0KPiANCj4gdW5zaWduZWQgaW50IGZvciBnc2kuDQo+IA0K
Pj4gK3sNCj4+ICsgICAgaW50IGlvYXBpYywgcGluLCBpcnE7DQo+IA0KPiBwaW4gd291bGQgYmV0
dGVyIGJlIHVuc2lnbmVkIGludCBhbHNvLg0KPiANCj4+ICsNCj4+ICsgICAgaW9hcGljID0gbXBf
ZmluZF9pb2FwaWMoZ3NpKTsNCj4+ICsgICAgaWYgKCBpb2FwaWMgPCAwICkNCj4+ICsgICAgICAg
IHJldHVybiAtRUlOVkFMOw0KPj4gKw0KPj4gKyAgICBwaW4gPSBnc2kgLSBpb19hcGljX2dzaV9i
YXNlKGlvYXBpYyk7DQo+PiArDQo+PiArICAgIGlycSA9IGFwaWNfcGluXzJfZ3NpX2lycShpb2Fw
aWMsIHBpbik7DQo+PiArICAgIGlmICggaXJxIDw9IDAgKQ0KPj4gKyAgICAgICAgcmV0dXJuIC1F
SU5WQUw7DQo+PiArDQo+PiArICAgIHJldHVybiBpcnE7DQo+PiArfQ0KPj4gKw0KPj4gIHN0YXRp
YyBpbmxpbmUgaW50IElPX0FQSUNfaXJxX3RyaWdnZXIoaW50IGlycSkNCj4+ICB7DQo+PiAgICAg
IGludCBhcGljLCBpZHgsIHBpbjsNCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbXBwYXJz
ZS5jIGIveGVuL2FyY2gveDg2L21wcGFyc2UuYw0KPj4gaW5kZXggZDhjY2FiMjQ0OWM2Li43Nzg2
YTMzMzc3NjAgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvbXBwYXJzZS5jDQo+PiArKysg
Yi94ZW4vYXJjaC94ODYvbXBwYXJzZS5jDQo+PiBAQCAtODQxLDggKzg0MSw3IEBAIHN0YXRpYyBz
dHJ1Y3QgbXBfaW9hcGljX3JvdXRpbmcgew0KPj4gIH0gbXBfaW9hcGljX3JvdXRpbmdbTUFYX0lP
X0FQSUNTXTsNCj4+ICANCj4+ICANCj4+IC1zdGF0aWMgaW50IG1wX2ZpbmRfaW9hcGljICgNCj4+
IC0JaW50CQkJZ3NpKQ0KPj4gK2ludCBtcF9maW5kX2lvYXBpYyhpbnQgZ3NpKQ0KPiANCj4gSWYg
eW91IGFyZSBjaGFuZ2luZyB0aGlzLCB5b3UgbWlnaHQgYXMgd2VsbCBtYWtlIHRoZSBnc2kgcGFy
YW1ldGVyDQo+IHVuc2lnbmVkIGludC4NCg0KVGhhbmtzLCBJIHdpbGwgY2hhbmdlIGNvZGVzIGFj
Y29yZGluZyBhYm92ZSBjb21tZW50cyBpbiBuZXh0IHZlcnNpb24uDQoNCj4gDQo+PiAgew0KPj4g
IAl1bnNpZ25lZCBpbnQJCWk7DQo+PiAgDQo+PiBAQCAtOTE0LDcgKzkxMyw3IEBAIHZvaWQgX19p
bml0IG1wX3JlZ2lzdGVyX2lvYXBpYyAoDQo+PiAgCXJldHVybjsNCj4+ICB9DQo+PiAgDQo+PiAt
dW5zaWduZWQgX19pbml0IGhpZ2hlc3RfZ3NpKHZvaWQpDQo+PiArdW5zaWduZWQgaGlnaGVzdF9n
c2kodm9pZCkNCj4+ICB7DQo+PiAgCXVuc2lnbmVkIHgsIHJlcyA9IDA7DQo+PiAgCWZvciAoeCA9
IDA7IHggPCBucl9pb2FwaWNzOyB4KyspDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVi
bGljL2RvbWN0bC5oIGIveGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oDQo+PiBpbmRleCAyYTQ5
ZmU0NmNlMjUuLjg3N2UzNWFiMTM3NiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9pbmNsdWRlL3B1Ymxp
Yy9kb21jdGwuaA0KPj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oDQo+PiBAQCAt
NDY0LDYgKzQ2NCwxMyBAQCBzdHJ1Y3QgeGVuX2RvbWN0bF9pcnFfcGVybWlzc2lvbiB7DQo+PiAg
ICAgIHVpbnQ4X3QgcGFkWzNdOw0KPj4gIH07DQo+PiAgDQo+PiArLyogWEVOX0RPTUNUTF9nc2lf
cGVybWlzc2lvbiAqLw0KPj4gK3N0cnVjdCB4ZW5fZG9tY3RsX2dzaV9wZXJtaXNzaW9uIHsNCj4+
ICsgICAgdWludDMyX3QgZ3NpOw0KPj4gKyNkZWZpbmUgWEVOX0RPTUNUTF9HU0lfUEVSTUlTU0lP
Tl9NQVNLIDENCj4gDQo+IElNTyB0aGlzIHdvdWxkIGJlIGJldHRlciBuYW1lZCBHUkFOVCBvciBz
aW1pbGFyLCBtYXliZSBzb21ldGhpbmcgbGlrZToNCj4gDQo+IC8qIExvdyBiaXQgdXNlZCB0byBz
aWduYWwgZ3JhbnQvcmV2b2tlIGFjdGlvbi4gKi8NCj4gI2RlZmluZSBYRU5fRE9NQ1RMX0dTSV9S
RVZPS0UgMA0KPiAjZGVmaW5lIFhFTl9ET01DVExfR1NJX0dSQU5UICAxDQo+IA0KPj4gKyAgICB1
aW50OF90IGFjY2Vzc19mbGFnOyAgICAvKiBmbGFnIHRvIHNwZWNpZnkgZW5hYmxlL2Rpc2FibGUg
b2YgeDg2IGdzaSBhY2Nlc3MgKi8NCj4+ICsgICAgdWludDhfdCBwYWRbM107DQo+IA0KPiBXZSBt
aWdodCBhcyB3ZWxsIGRlY2xhcmUgdGhlIGZsYWdzIGZpZWxkIGFzIHVpbnQzMl90IGFuZCBhdm9p
ZCB0aGUNCj4gcGFkZGluZyBmaWVsZC4NClNvLCBzaG91bGQgdGhpcyBzdHJ1Y3QgYmUgbGlrZSBi
ZWxvdz8gVGhlbiBJIGp1c3QgbmVlZCB0byBjaGVjayB3aGV0aGVyIGV2ZXJ5dGhpbmcgZXhjZXB0
IHRoZSBsb3dlc3QgYml0IGlzIDAuDQpzdHJ1Y3QgeGVuX2RvbWN0bF9nc2lfcGVybWlzc2lvbiB7
DQogICAgdWludDMyX3QgZ3NpOw0KLyogTG93ZXN0IGJpdCB1c2VkIHRvIHNpZ25hbCBncmFudC9y
ZXZva2UgYWN0aW9uLiAqLw0KI2RlZmluZSBYRU5fRE9NQ1RMX0dTSV9SRVZPS0UgMA0KI2RlZmlu
ZSBYRU5fRE9NQ1RMX0dTSV9HUkFOVCAgMQ0KI2RlZmluZSBYRU5fRE9NQ1RMX0dTSV9QRVJNSVNT
SU9OX01BU0sgMQ0KICAgIHVpbnQzMl90IGFjY2Vzc19mbGFnOyAgICAvKiBmbGFnIHRvIHNwZWNp
ZnkgZW5hYmxlL2Rpc2FibGUgb2YgeDg2IGdzaSBhY2Nlc3MgKi8NCn07DQoNCj4gDQo+IFRoYW5r
cywgUm9nZXIuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

