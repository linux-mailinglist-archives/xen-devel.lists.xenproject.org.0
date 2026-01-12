Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F2BD144AB
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 18:16:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200836.1516666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfLVl-00015W-7T; Mon, 12 Jan 2026 17:15:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200836.1516666; Mon, 12 Jan 2026 17:15:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfLVl-000136-4N; Mon, 12 Jan 2026 17:15:25 +0000
Received: by outflank-mailman (input) for mailman id 1200836;
 Mon, 12 Jan 2026 17:15:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j+ET=7R=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vfLVj-00012z-U6
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 17:15:24 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46b8ff98-efda-11f0-b15e-2bf370ae4941;
 Mon, 12 Jan 2026 18:15:22 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB7963.namprd03.prod.outlook.com (2603:10b6:303:270::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 17:15:18 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 17:15:18 +0000
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
X-Inumbo-ID: 46b8ff98-efda-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lMaTElTkJWbHiQviaqaYE4Ntx3Gy6J1b4GvcPxo/KhSbwfa3SLsE7XopA/WwtJmU8EtmzqyjXJBcAI/60lcsx43XJJzixAJOG6k3TSR5eIOBDKIjTaFYV89pwCB6VpO8nckqZx3rPUO6j1QeRepaypMHYM91sAGVBMCoGMPfrP9i5zyaWy8kvwn7Ex+M+Pw1jDnL7bySPFvSTjUCy2OGTdJJ6taqWVJsK9W6XkjJ9dWwU1sp8PLrJaLdWfXoZUAaBAzaIPaFbHTwG9B5BLI74ilYENnCTx1jVr3iML1CPDCFrx+Y1/AkH3MdOpHHOKER/Tu7jgYLR+5dE8M3DLMOeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wdmw36I2Tjr5R9rmVJUMCaGAEE59qwfqkksNPRBCrSc=;
 b=q5J8Ht15IaDUrxAkL3Dv6egfTRA2hnIvw9oGypsgfjsI4yrxTwsAbjjYC+WO8iOpqRcwMtwBPI4X8iUGtu5YsGyyPA/4nfL5+wX9rhvnRGFA3taXLFTmbZG0XqjJ1EKrv/tPK9c+HLcMem4CDRCInmRPxtsT7yY/rxNCzBBougXSD5hEgbLWafqO13dis0x57/KE8aDHv8Dvg1Z/MlqBkSJh098eOx31UOT1eqfE6u1RXCxshH5g8ipUYKUXUDam8oNPKvpn3tTHXK/+NtTW7loOyGF2RZYoqDFxuLT1MSwjSVlEFlakUm79NYWAS+L0xl+2oA2TAZ2qvMtwA+yQUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wdmw36I2Tjr5R9rmVJUMCaGAEE59qwfqkksNPRBCrSc=;
 b=sGulPUJTnPpdZFu9i7sAPogawY7gIAexpKmXeTKp7+/irEmYrqBghNcd7WjUiggqwwNHemYJG0a/RmrSPvWq7Ym04dnsKHcE4KEAkQcCn7NV4mgu+m+BlEXmw19vb7Bgmqd34q32PNYEWzZGqy0RClLTYVO23TwuHM5LIZBdd1E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <96f4f3fe-46c4-4854-af55-d5adea07c847@citrix.com>
Date: Mon, 12 Jan 2026 17:15:14 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v2 2/2] x86/ucode: Add Kconfig option to remove microcode
 loading
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260112150259.74535-1-alejandro.garciavallejo@amd.com>
 <20260112150259.74535-3-alejandro.garciavallejo@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260112150259.74535-3-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0081.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB7963:EE_
X-MS-Office365-Filtering-Correlation-Id: fbd884c1-c503-4904-03b0-08de51fe28fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z1VmQytJZnNGYXNBUXdBSjRtSlM3dVlqUDljS3pyQkU5dlFURmEyQzdiWlBZ?=
 =?utf-8?B?ZGxZclRXSVkwQVpkTFZyS0FodkRBZFA1d3lmM1hkT2xoZlFTUm5zOE5BckRv?=
 =?utf-8?B?WnRJMTZ6U2dNMUZSMEVIZGhDd1BDS0ZyRmljMCtGTEVaS2RrS095alNISU9P?=
 =?utf-8?B?Q3hrQ0Y3Wm1TQi9hSStBa3Z5amUyR2xkYzdvZHg1ZmE0Y2kvaXNQYllzQUZq?=
 =?utf-8?B?SFVvS1FIVGxaVVF1cUVPdU5sbWFWOVBucGgxU3pKcmtwMXBncHMxYzJrd2Fj?=
 =?utf-8?B?ZjBFZnB2Y28yQkhYNGd1OGZJRHc3eFh3eW8waEszd0t3dnFhaXFNRndsZmhR?=
 =?utf-8?B?dGlZbWFOZ2hqck50ckpxQXF5cEVyb1VhMVQxaDNCOE5BU3NOcURsdWJseDF5?=
 =?utf-8?B?aHpvbmkxL1o1SVFFSVovbVpkQkpWK3k4RU5vMGM5SUZWN3NnNzc3RlM5K2ZD?=
 =?utf-8?B?dkNQTUlqUVdoTDBLbzMzZmt1M3lzY0pqYVNVeW5QTVBSVjhxbjVXTTBDVm5o?=
 =?utf-8?B?WnpCWU5VVitTcVBCRFpyY29RK2lDNS85WGR1WmlOZ3JYTkM0cXdLeHdQYjFS?=
 =?utf-8?B?S0hYOVVGNndkUUVpTHFuUUdSTURpR0wxV3ZJR0oxTHo0VGxtMFNPaXY3Y1V5?=
 =?utf-8?B?WXRVRkkzdjBFU2Q0K0Z0OUNQUzByaFI0cXlQL1ArVk5ycFNldUEzSVdlNmNE?=
 =?utf-8?B?N2xXZElXZ0lEVGJQRk5WZDlpS29QUjRUODZpcUFpdkpoLzI4b3F5dTM3Mk9O?=
 =?utf-8?B?Q21paHhRNlBOdHl0dHZ1MFpjRytXOTUrZEd5ZzRQZHZiNlkyM0ZycnkvYzFW?=
 =?utf-8?B?SDlpZjU5SjUxWXgwUENxcW9EeGpIODdCL3d1alkvSE05dVF2bThYTExkYXFV?=
 =?utf-8?B?WHJjSStPNDhGRXI0YU9FdnF4bGZGaEppbS9TaTh3K09ZSlozZS9YWDd5Uysx?=
 =?utf-8?B?WEhxSlNrSnVibldrcndpNmE5V3RLM3o2MnkvQkNMRXZxWG8wUDZDVERDRHVl?=
 =?utf-8?B?VjVnZldIVlJXSjdqNHJlSVJtTWI3MGc5Q25IUE1Va2xobWEzRlpNalRKckRI?=
 =?utf-8?B?MDI2cEhIZkxJMFUwWi9Vbm85RlBjNGhGcFh2MzlHYi9Kenpxc3ljT3dDKzZk?=
 =?utf-8?B?YXQzOHdteWZ6VGdnNnhJek5FYWpmUjFES1EvQjFnUFlJY1BjUXpaZkFUK0VY?=
 =?utf-8?B?cGt1T1hWSTViQzk4UHhJNG84VWYraUJEZyt1YnhTL2ExZ3djTmhsUVp0ZWZi?=
 =?utf-8?B?dmdTYnBLS2Z0M1FVRTZiaG9oc3ppQlhJdmdtYnY4ZWpENUZtL1h0aDlDc1Yw?=
 =?utf-8?B?QVRXSjErend6ZHpKQnJOajlIeHJLRStid3dnYTRhcGU1L3BKTEx6WHZjRjI3?=
 =?utf-8?B?MVlPRTdkbGlPY3FoMG5ORm4wKy9QS2F1NnIzcWlObGRacDlUb3RSNk04U0Nk?=
 =?utf-8?B?S1U5ZERjWHFXWHp3QkpDU0NuUHovWE9yZGFXYmlRLzBVRlhEQXZibURWRmdx?=
 =?utf-8?B?N3RrSzRRbEd5TkZZSkp6ZG96SW9FTXJTUllIZHlCZjlVN0FSRXNzZGcrczdG?=
 =?utf-8?B?dzJZMU9FWi9YU25kSkNacUFTK1NReTJIbmNFS1JUcXM4ZHRJQ1QyOVd1M0lQ?=
 =?utf-8?B?VXZGV3VpdXlpSWVCUGNtbDl4ZjdhYmRSL3ZRZjREMzFWSnZIMkJOODRJRG1I?=
 =?utf-8?B?QXkvVGNKYk5hOFNxWlJMNGtnZlc3NlBPa25wa3oxZldRdDVCQ1J1ZzdRYmlO?=
 =?utf-8?B?R0FRaW5WdldHZzNhN0g4ZWVVNVg5TWZRZDBONngvQ04zNXlLd0NUeEh4WDFO?=
 =?utf-8?B?aEYveUQ0UkIzS015NVYzdWNFUnhxNzR1R3czNXlnWmFHL2hyMHlRRnBJSE83?=
 =?utf-8?B?OHNJS0YzTnhOOW9JOU9iTTdOVjBodkY4RG5Rc2MwcHBjUHR6UTRNSXN0MVhB?=
 =?utf-8?Q?krH+ziPCGAk21m5q9qmXW6N4Xaj11+7g?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXVmTy9EQ3NrOTZpNGZkRktTNXR5TlNXN0FESmtpZWQyd3d2Z2hRSjBENm94?=
 =?utf-8?B?aitXbEYzd3A0ejd4aWsvS2lRTExIVGVjV0JkLzJvZWlkUzRPSUpXYS9iRkFp?=
 =?utf-8?B?MzdhRVo3VjIwd2Y4Lzgza29ja1VHSTJEYkZaMGkwT29JWkd6S2VRT2pTblhJ?=
 =?utf-8?B?YytvK1hOQjNQdXI0YnJYazZjY2JkVVBwMTFJN1VzVWRNc3Q5WGlqRWY1bEQ5?=
 =?utf-8?B?WHI5QkgxRXVjNlVZZm1jNWdTbWZmNkw2ZlBxT211OVEvSkg5UjZzZVhJYnIr?=
 =?utf-8?B?bUxWZUNrR2tQUG16WWQ1R0x1N2hueW1EKzgraWszTlh3VGc0bE1OYWp4Qity?=
 =?utf-8?B?YUhjeVZxUTVEQzVwcURUNEtOVEo4RHhOdFRaUVdJQUZGdlNzLytRb3pnVWxF?=
 =?utf-8?B?STlzTHZBYVBXc0hkdWphdkQ4dHNGeU9BNDA1Tm5JL20vSGVzZmxUMGxxYjlp?=
 =?utf-8?B?amVNRGRhV2ZMbHdYaXBCSWdGNllRQk5Pak5VazNyYUd0Smc3VXZjQWQ2c2x4?=
 =?utf-8?B?eEc1Q2lSNENaMW9mU1RQMENMK2t1N1lvRW0rd2EyMmlIa0xEeTZnZU5FVkNp?=
 =?utf-8?B?ditHbmZRL2wwc2VhZkZDSHd5eU1NVTZyWlo0dENuVjRjZ2FtQktUemZkaHpi?=
 =?utf-8?B?OXFab0dBeVN2SVB0eE1SbUJZLzBRMmVwWldickNiSkluRWMwWXpEZUpSODJC?=
 =?utf-8?B?ekN6TFNISFBjWkg3WHBoVWo5c0J3N29laDFSa1ZVaVZCYjk0QWRXMXQrMGJU?=
 =?utf-8?B?Y1pvdVZOTW9kRlZudVlTaTh5NHRFZUhpUlhoMlNJaFVyTXFBaTdPYk5KY1Fi?=
 =?utf-8?B?SlJ2TUhTQlRGSW9aRFpRY3Zyd0dCckRMVUJaVXA3Vzg5SnRjZCtYVWIwWloz?=
 =?utf-8?B?aXpSb0pzT3plRVlPc1l4ZWh5TzkybTdsb2dqdmFqaWdoaVROWmNYM0tsWGdo?=
 =?utf-8?B?c1RoSHFUSEtVaHJ3M3R6RmFLQUtFQ0lqMnpKZGN0L1UxRU85NkVsVzV1NWJu?=
 =?utf-8?B?S2JDZ2pJa1hsaHAvT1ViV3djdytzTlJqRXRRQlpGN3FQS09JWkJudmt6SmZn?=
 =?utf-8?B?UThSWnI1aEVtT0QyUVBEMVdXam5JdWE0WlIvSzdudWJUWGZFZU80TVVuc2Jz?=
 =?utf-8?B?TWJrc2F0ZDNmZ2htS3UxTGpsVFJxcE9FbWdHZXdRdWRYL0F6d3BnRmN5R1VE?=
 =?utf-8?B?YXdMcG00R3dJbUpHRTNlMjNTV3dQS3VjWnNrVU44aURqMmplZ09Xek11dmZj?=
 =?utf-8?B?OTZ1THpMbWJQeDBwOGNUMWtmZHdaS20xUDlMV1RSUUtqQVhBSFU4MXREK2lO?=
 =?utf-8?B?ajhNbmxCY3hzUzhzaXVzR2hoeEx2cEQ1WjlqWTIyTmZsVEpOY1BBckdWakt1?=
 =?utf-8?B?T3VpdmcvMG16ZTZ2WEFnQ3ljc1NOVU5URVJ1TGczVk1iOUx6MjgxV3VITTQ3?=
 =?utf-8?B?Rkx6aTUvclY5dnlRcEVqeGpoOFNTRjcxUnhyNmFlaURhcHl5R3VncDV2OVdn?=
 =?utf-8?B?VWx4Z1hSTjJiakprcVJlZXJWWG9LOVJ4d21jM01CUmpUNVdCRWVnV0NxMVhL?=
 =?utf-8?B?MUdMS29jNSthTkVhK0U3cThScUxxU1k3MS8rVTBCY0d1d3Q4UE1tOTNXdTBC?=
 =?utf-8?B?Myt1LzhITlROUDRwZVZBUFlLS3JuUTErdGVnYmNVYjhXenJkbUdTRmJac0F6?=
 =?utf-8?B?RmhOYlBqWjYzaSs2bVlscjdFQ2pPNHdGbVhzdUJkSkJhN0JuYjhqQjZxNFhS?=
 =?utf-8?B?QVVJL2RRZGM5ME9iaXp1MVgzTXpPSjlqZ2tXY2UzZXFtdGJacGpjZGlNQjNJ?=
 =?utf-8?B?VHJQazN1VUovV3FFNmlQZkhveW9Ieks2bGY5WjhlaUUwWGlZSFdVV3RkK0lo?=
 =?utf-8?B?bm83T3ZJNUo3cXVodmxaMXg2a0VhSmMrTThWZmFmS3hMcTBIZ21kK2Urb2Nn?=
 =?utf-8?B?SmpVTnVQWWVsRjJQSXIyVXZoaW1XckoyWHhzQTU3cUs2d0JjSHFzNkVLdysz?=
 =?utf-8?B?TFhSQy8rNngvaW4rUFdTdWFjdnRpU0hDaDNLWnFHU0JCVEZSNWZ2QXR0ZVpO?=
 =?utf-8?B?UksyY3BrUUs4TWlmcWQyenRCRVpnZSt3UFpTcWZINDJrYXBlK2ppV2VBU0Z6?=
 =?utf-8?B?M0MrSElNM0VCR3BhaXpRdUpGcmFVd1Y1MXhLWlF1Uk0xVnBvU1VEMUpvRmpt?=
 =?utf-8?B?K0ZxTmtEUHl2OWsxU1pGTEE4ZTI2RzFDaFBBUWszWitNZTAxZjdTeHZSMFlF?=
 =?utf-8?B?VmdhZkZmZDdGRVFyMzVNcjRneHVRQVpSN2pKVTBMVEhyaWxoSXN5MTJmSzlk?=
 =?utf-8?B?NWQvenEzZm5oRnRheVprSHdmMFVhM3ZsVTZJd3NXV0JPMFNMY0ZNUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbd884c1-c503-4904-03b0-08de51fe28fb
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 17:15:18.5968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iUbG6NhKWlHo9g+qjmzhiuIlISpcKS1O7dPVgzw2zE16LTgkepIMdjpp3q+N3f6FiGifJz+GldIr6JH5mYgEcwZAc5xm3aDVS5thVs4pP0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7963

On 12/01/2026 3:02 pm, Alejandro Vallejo wrote:
>  automation/gitlab-ci/build.yaml    |  2 +-
>  docs/misc/efi.pandoc               |  2 ++
>  docs/misc/xen-command-line.pandoc  |  4 ++--
>  xen/arch/x86/Kconfig               | 14 +++++++++++++-
>  xen/arch/x86/cpu/microcode/amd.c   | 22 +++++++++++++---------
>  xen/arch/x86/cpu/microcode/core.c  | 25 ++++++++++++++++++-------
>  xen/arch/x86/cpu/microcode/intel.c | 16 +++++++++-------
>  xen/arch/x86/efi/efi-boot.h        |  3 ++-
>  xen/arch/x86/platform_hypercall.c  |  2 ++
>  xen/common/Makefile                |  3 ++-
>  10 files changed, 64 insertions(+), 29 deletions(-)

Much nicer in terms of (non) invasiveness.

First, please split the rename of CONFIG_UCODE_SCAN_DEFAULT into an
earlier patch.

> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 50d7edb248..866fa2f951 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -2748,7 +2748,7 @@ performance.
>  ### ucode
>  > `= List of [ <integer> | scan=<bool>, nmi=<bool>, digest-check=<bool> ]`
>  
> -    Applicability: x86
> +    Applicability: x86 with CONFIG_MICROCODE_LOADING active
>      Default: `scan` is selectable via Kconfig, `nmi,digest-check`

You want to include this too:

diff --git a/docs/admin-guide/microcode-loading.rst b/docs/admin-guide/microcode-loading.rst
index a07e25802fab..91668e6f9b3f 100644
--- a/docs/admin-guide/microcode-loading.rst
+++ b/docs/admin-guide/microcode-loading.rst
@@ -23,6 +23,9 @@ TSX errata which necessitated disabling the feature entirely), or the addition
 of brand new features (e.g. the Spectre v2 controls to work around speculative
 execution vulnerabilities).
 
+Microcode loading support in Xen is controlled by the
+``CONFIG_MICROCODE_LOADING`` Kconfig option.
+
 
 Boot time microcode loading
 ---------------------------


while changing the docs.

>  
>  Controls for CPU microcode loading. For early loading, this parameter can
> @@ -2773,7 +2773,7 @@ microcode in the cpio name space must be:
>    - on AMD  : kernel/x86/microcode/AuthenticAMD.bin
>  When using xen.efi, the `ucode=<filename>` config file setting takes
>  precedence over `scan`. The default value for `scan` is set with
> -`CONFIG_UCODE_SCAN_DEFAULT`.
> +`CONFIG_MICROCODE_SCAN_DEFAULT`.
>  
>  'nmi' determines late loading is performed in NMI handler or just in
>  stop_machine context. In NMI handler, even NMIs are blocked, which is
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index c808c989fc..1353ec9a3f 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -331,8 +331,20 @@ config REQUIRE_NX
>  	  was unavailable. However, if enabled, Xen will no longer boot on
>  	  any CPU which is lacking NX support.
>  
> -config UCODE_SCAN_DEFAULT
> +config MICROCODE_LOADING
> +	bool "Microcode loading"
> +	default y
> +	help
> +	  Support updating the microcode revision of available CPUs with a newer
> +	  vendor-provided microcode blob. Microcode updates address some classes of
> +	  silicon defects. It's a very common delivery mechanism for fixes or
> +	  workarounds for speculative execution vulnerabilities.
> +
> +	  If unsure, say Y.

Please don't re-iterate the default.  It's a waste.  As to the main
text, that's not great for the target audience of a distro packager /
power user.  How about:

--8<--
Microcode updates for CPUs fix errata and provide new functionality for
software to work around bugs, such as the speculative execution
vulnerabilities.  It is common for OSes to carry updated microcode as
software tends to get updated more frequently than firmware.

For embedded environments where a full firmware/software stack is being
provided, it might not be necessary for Xen to need to load microcode
itself.
--8<--

> diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
> index fe47c3a6c1..aec99834fd 100644
> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -44,6 +44,9 @@
>  
>  #include "private.h"
>  
> +#define can_apply_microcode(ops) (IS_ENABLED(CONFIG_MICROCODE_LOADING) && \
> +                                  (ops).apply_microcode)

I don't think this is a useful macro.  It's used 3 times, despite ...

> @@ -613,6 +618,7 @@ static long cf_check ucode_update_hcall_cont(void *data)
>      return ret;
>  }
>  
> +#ifdef CONFIG_MICROCODE_LOADING
>  int ucode_update_hcall(XEN_GUEST_HANDLE(const_void) buf,
>                         unsigned long len, unsigned int flags)
>  {
> @@ -622,7 +628,7 @@ int ucode_update_hcall(XEN_GUEST_HANDLE(const_void) buf,
>      if ( flags & ~XENPF_UCODE_FORCE )
>          return -EINVAL;
>  
> -    if ( !ucode_ops.apply_microcode )
> +    if ( !can_apply_microcode(ucode_ops) )
>          return -EINVAL;
>  
>      buffer = xmalloc_flex_struct(struct ucode_buf, buffer, len);
> @@ -645,6 +651,7 @@ int ucode_update_hcall(XEN_GUEST_HANDLE(const_void) buf,
>       */
>      return continue_hypercall_on_cpu(0, ucode_update_hcall_cont, buffer);
>  }
> +#endif /* CONFIG_MICROCODE_LOADING */

... this use being redundant.  Just expand it for the two other cases
and consistently use IS_ENABLED() in view.

> @@ -907,10 +916,12 @@ int __init early_microcode_init(struct boot_info *bi)
>       *
>       * Take the hint in either case and ignore the microcode interface.
>       */
> -    if ( !ucode_ops.apply_microcode || this_cpu(cpu_sig).rev == ~0 )
> +    if ( !can_apply_microcode(ucode_ops) || this_cpu(cpu_sig).rev == ~0 )
>      {
>          printk(XENLOG_INFO "Microcode loading disabled due to: %s\n",
> -               ucode_ops.apply_microcode ? "rev = ~0" : "HW toggle");
> +               !IS_ENABLED(CONFIG_MICROCODE_LOADING) ? "not compiled in" :
> +               ucode_ops.apply_microcode             ? "rev = ~0"        :
> +                                                       "HW toggle");
>          ucode_ops.apply_microcode = NULL;
>          return -ENODEV;
>      }

Don't complicate this messy printk() further.  Just exit early; it's not
interesting to read "not loading microcode because it's not compiled in".

This is a rare example of a subsystem where it remains partially
compiled in, and it's even possible to write such a printk().

> diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
> index 281993e725..d9895018b4 100644
> --- a/xen/arch/x86/cpu/microcode/intel.c
> +++ b/xen/arch/x86/cpu/microcode/intel.c
> @@ -404,21 +404,23 @@ static bool __init can_load_microcode(void)
>      return !(mcu_ctrl & MCU_CONTROL_DIS_MCU_LOAD);
>  }
>  
> -static const char __initconst intel_cpio_path[] =
> +static const char __initconst __maybe_unused intel_cpio_path[] =
>      "kernel/x86/microcode/GenuineIntel.bin";
>  
>  static const struct microcode_ops __initconst_cf_clobber intel_ucode_ops = {
> -    .cpu_request_microcode            = cpu_request_microcode,
>      .collect_cpu_info                 = collect_cpu_info,
> +#ifdef CONFIG_MICROCODE_LOADING
> +    .cpu_request_microcode            = cpu_request_microcode,
>      .apply_microcode                  = apply_microcode,
>      .compare                          = intel_compare,
>      .cpio_path                        = intel_cpio_path,
> +#endif /* CONFIG_MICROCODE_LOADING */
>  };
>  
>  void __init ucode_probe_intel(struct microcode_ops *ops)
>  {
>      *ops = intel_ucode_ops;
>  
> -    if ( !can_load_microcode() )
> +    if ( IS_ENABLED(CONFIG_MICROCODE_LOADING) && !can_load_microcode() )
>          ops->apply_microcode = NULL;
>  }

! ||, surely?


> diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
> index 79bb99e0b6..5e83965d21 100644
> --- a/xen/arch/x86/platform_hypercall.c
> +++ b/xen/arch/x86/platform_hypercall.c
> @@ -307,6 +307,7 @@ ret_t do_platform_op(
>          break;
>      }
>  
> +#ifdef CONFIG_MICROCODE_LOADING
>      case XENPF_microcode_update:
>      {
>          XEN_GUEST_HANDLE(const_void) data;
> @@ -327,6 +328,7 @@ ret_t do_platform_op(
>                                   op->u.microcode2.flags);
>          break;
>      }
> +#endif /* CONFIG_MICROCODE_LOADING */

You mustn't #ifdef out a case like this, because it causes the op to
fall into the default case, and some of the default chains go a long way
and make unwise assumptions, like hitting a BUG().

Always use this form:

    if ( !IS_ENABLED(CONFIG_MICROCODE_LOADING) )
        // EOPNOTSUPP

and leave the case intact.

>  
>      case XENPF_platform_quirk:
>      {
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index 92c97d641e..1e6c92e554 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -65,7 +65,8 @@ obj-y += wait.o
>  obj-bin-y += warning.init.o
>  obj-y += xmalloc_tlsf.o
>  
> -obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo unlz4 unzstd earlycpio,$(n).init.o)
> +obj-bin-$(CONFIG_MICROCODE_LOADING) += earlycpio.init.o
> +obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo unlz4 unzstd,$(n).init.o)
>  
>  obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o memory.o multicall.o xlat.o)
>  

In a prereq patch, please move earlycpio out of common/ into xen/lib/. 
It shouldn't be tied to CONFIG_MICROCODE_LOADING like this, and it can
simply be discarded at link time when it's librified and unreferenced.

~Andrew

