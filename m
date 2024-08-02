Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD7E945656
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 04:38:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770047.1180896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZiAi-0001UP-Km; Fri, 02 Aug 2024 02:37:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770047.1180896; Fri, 02 Aug 2024 02:37:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZiAi-0001Sl-Hp; Fri, 02 Aug 2024 02:37:36 +0000
Received: by outflank-mailman (input) for mailman id 770047;
 Fri, 02 Aug 2024 02:37:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uPwv=PB=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sZiAg-0001Sf-Tc
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 02:37:35 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2405::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29e5bdad-5078-11ef-8776-851b0ebba9a2;
 Fri, 02 Aug 2024 04:37:31 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH7PR12MB8178.namprd12.prod.outlook.com (2603:10b6:510:2b3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Fri, 2 Aug
 2024 02:37:24 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7828.021; Fri, 2 Aug 2024
 02:37:24 +0000
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
X-Inumbo-ID: 29e5bdad-5078-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vzaAcs+Xfny8lZDk/4ocCF0f3rsVJYsH6/Eo4smHsq5iaJHFAVttIvOA7ck0ZYPBTdmVOQC3SI1cnv8Dm8QADl7vvFprcmWrdsgY3xkzUUIEvrLVYhqtglIEspuyJEs4gTSzNut+pmkL6gMNSXrD69v5ZydtJ5qIjzL62aIwttR5i34R5AYwWeYv2xlSfwsjema0jmPUZIWW5ubFu1QZhbxKPcWob+DpYLwL+rQ138Mr46Ei2w0vtLrBPuiXv8cVxKxXF7mBYdwQ5WSQgl6NtAHuy+p/AomwMnXd5fs6FmNMEPA2fqyqI3eFBA3pvuBYLswy4OHnvMOUGj/kRdCzkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eh1FYrO+8XedR9ax4UMoUCZggEJujSgs1wf1T2Avt7A=;
 b=cd7Tz64I9KuXVTQ3UWLoi1WSzbafXcV4nq1K32jXbQR+e05bLH2rudum2YU9EhTp7YYdz+ezsYfBN0/WJXVbgd2LaSVGF3NKdlBcFUjyKdzYw0OewrPBwmE7juetUwDWaHh/PRoI+DgMCcIHJFVC8ZqzO5GB3fQHpP5bN+lV+Y+pgTKWSBh9MsoeckEm5Kv1jp2aAl5XkcGDVXplaemqeYIbXkIxFXhMDxnorAC0RycnyAyA6lHMwObTj5VuVe0hZ2d/kxs3hKIdxu6QgUOOBr+aKoiCIFqFtz57QxO9i1qXy1vJcarvIQQ/hf1fqukKBsLKL0P042AEzwx+ypUiCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eh1FYrO+8XedR9ax4UMoUCZggEJujSgs1wf1T2Avt7A=;
 b=l+qbYDSfKTzWBHN70SEl7ynhf1IlnYKfjAuqawsvjJeiTXgnaxn+6kLuGwwwpkIFanxAoxpEHQPe1i8cxP45qlJyaBZ3wzv/ibsVoL0kktb347dfDY7lQ0ekM5R1IBktkUAa05z2QqiMOzMRtebLwdu8pHeKzAhbyUHXPNqEhRA=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<gwd@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, Juergen
 Gross <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v12 2/7] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Topic: [XEN PATCH v12 2/7] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Index:
 AQHa0SvUYCKIEvNO4Ei/mjm7Qit34LIQmkQAgAACPwCAAAdkgIAABG0AgAADDACAAALkgIAACfqAgAAE/oCAABpKgIAAAsoAgAAXhYCAAvm8AA==
Date: Fri, 2 Aug 2024 02:37:24 +0000
Message-ID:
 <BL1PR12MB584914D078416A5F0ECA0AE0E7B32@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <Zqnswi7ihOhMxPsi@macbook>
 <0aa0982a-30b3-43cd-9a9e-4542d7cb583f@suse.com> <Zqn014wCEfWhyo1-@macbook>
 <8ff685a6-0cbd-45cd-a818-4535a040c478@suse.com> <Zqn7HEuooChgRCuf@macbook>
 <d65ae152-22ee-4a57-8ff4-43ef0c234f5f@suse.com> <ZqoF55yapMxGN_WM@macbook>
 <fa33fbf8-32b6-48dc-a30c-dd76b021a76d@suse.com> <ZqogJVHV36ytYVP1@macbook>
 <ff922c7a-aa66-4b23-8b9f-63b0b403ff14@suse.com> <Zqo2N7CDshL7ZoMK@macbook>
In-Reply-To: <Zqo2N7CDshL7ZoMK@macbook>
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
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH7PR12MB8178:EE_
x-ms-office365-filtering-correlation-id: b089425e-8944-4b8c-2a4e-08dcb29c0af4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?N1ZOU0o1TVR2dzFCTE9JdTJDQnJKeTZHR0VNY2FLMmFNWVdmNVYzSDdwOHc5?=
 =?utf-8?B?OVhUT09QalJndUZuZzYxY2pwK2ZnWTdyN3lYbTM2NnR2RE56WGJLemp2UjZs?=
 =?utf-8?B?S1gzR1pZNHEzemg1UlU5TWQxdkNOVVkvN1YwdkF1VFRGbzhzWE9HZlFNZTdk?=
 =?utf-8?B?SUtiUWxzdGM4dno3WGcvbW5FbFQ1aXBqSUk0NUxWelpnSm9xZmlBUWlaU0Fx?=
 =?utf-8?B?d2ZnYkJUSmdIZTNRRVViUUtVVlJJRjFiQnJTMUM2ZFc4M1c5NDdZK2g3NE9I?=
 =?utf-8?B?WkNVcFdZQzV0ZjZBNUZaSUxFREZseGdXSHhwWHdldnhiUEszd0FnUHJoay94?=
 =?utf-8?B?VEFrR081d3A3OU9hQ2tIcHg2ZzRxa0ZIdkVMaGprZXpVdWhibGFiVkRZQmFN?=
 =?utf-8?B?SXQvaGUxRXdORmNtZ3hoK1NrNlJFV0FLZTUwR1BxS2xWbVJWRGN5L0JNVnhH?=
 =?utf-8?B?M3BhU2NEYWd4M0NhdzNVT3o5TGtYZVdKRGxvek55MzNQSURwNmtzMGNjTDJ2?=
 =?utf-8?B?anNMQTNhY2Q2bzQxd3VPQVE2SmdlVUtqdHlZMFRlYmExQzA5REh6MXF2R2dU?=
 =?utf-8?B?UXNYMTRjcWRQRDUyZHVsbjdWLzV1b2xXdGpHeEtvSmE3YnB4NVkvRUp1ZUdn?=
 =?utf-8?B?eCtqdCsvck1SU2tqdk9oWmpUbE0xNUlZZHRpay9WbG51SXFvNWNxZjk5SWpZ?=
 =?utf-8?B?aU1STmp5N1h4L2ZBL05pc2ZmUEhRanM1RE5yVkpoUHBsejlIZlNJSlhDeTlW?=
 =?utf-8?B?R3FDQ2ZUVENhbTZ0R01mS1BKY2dSU2x6SlgyK01GOTJLWDgzWFR6RVc4dGo3?=
 =?utf-8?B?cjkvTk9GSkovSnVNQllmMVcxOVhvazJoZjM3bm9PMTdXTW5MTW54clFmVTJQ?=
 =?utf-8?B?OFBOcGMxelpaYkVqWGpQVjFRU2xmZ2dBSVVsTk9FMmhMVkF6WGttVm5rVjJL?=
 =?utf-8?B?bUZ4Q093NE5VTmxaRk9BaFJnSDBWWG5taUlIMVd5YWZRcW5kSnh2ZFAvMFFF?=
 =?utf-8?B?UU9vMkluR1R2YTdhb1I5dDcrZHFmVW5VTElZTVVXS01zY2YxUjRUZ2lla0J5?=
 =?utf-8?B?ZG8wcHczWnJiU0NqSWxmZGJEOTZPQjVDeGpUM0JBVFFsVElFSmM3UC9LNmVz?=
 =?utf-8?B?MWUrOUFZMzlDRTQvaERMVzk4Q0VPWUtUTittMlB3YUxaWXJyVjMrTGc4R3hk?=
 =?utf-8?B?SlFkUUNmZkR3YzAxaE9xN3l2cG1LWnF0U0c3cmZXeWxLekxIMEFCVEJhekdM?=
 =?utf-8?B?Z0Uya1lnQmpqeDBnVnlVV0JsRExGRFd1Wmd1NE13VHpPMFBaLzZSb25NZWtD?=
 =?utf-8?B?a0gvZlBMTmQ0U0VWL01TT2g5VHk0c2FWWTJHYWVjQTI2eG00c0FhdE92N09x?=
 =?utf-8?B?cHEyRUs0a3BJRnQzd3pDSlJ5ek1Pd0ZSaWRyMTFHdHVtOTdOajZwVVk4Q2VE?=
 =?utf-8?B?aVpBRWlqakZSdlE2SktKNWg2VFFYRXVLWGhmYVFNdXdhVjVKVTRXWUl4bkx2?=
 =?utf-8?B?OXY2WGRvbkNCUmJhcDlncHVmc2l0bUZDU1U3Qy9Rek9LZjNiNHhwait1NkFD?=
 =?utf-8?B?YmJhYnFzZ3JHMDh0S3c5anNLMCtBcG5WODFyamgvTk5jN2hVNzVsN0t6RHFn?=
 =?utf-8?B?L2xEMVYvcW95WUlmeXpobHY3czlYRHVLZGxWNmxBZWttUGRjRE9MR3VNS3B3?=
 =?utf-8?B?S1ZzRFYydDh1MVl3KzZHMDdEWnNNNS9ER3JDTVBUMEc2T3pIYzBpTVlyWDIw?=
 =?utf-8?B?blpWZmliYVFrNy82aW1OUUl3WmZJbjZ2TXRrbWJKZ0JBdUtpOFZMYWJvRU5p?=
 =?utf-8?B?eURSK1dSVklzQVZJN0pqTmJ1bEsxZ1BjanJWRnV0S2VDZ1dNdHpyZVNOMHY1?=
 =?utf-8?B?VU1wSUdjK2ptWXVVYVFOVUhRS3pxZkdSb0VKaTFTb2J2cXc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cmkvWlVTRkpZTEsrdkQzMnpkemgxTWhtRzhVZ01HZDdjd0hzMExYYmw3VzJU?=
 =?utf-8?B?RUsxc3Z1cGdxdWtNQ0tlM3puL3d1Mk94U052dUZtd3BRdkNOUG9wTTlYWnZU?=
 =?utf-8?B?MWg0NnEyWnVTV1dTM2x6ODVabktROU1vQlAxOGFqT29WeWZNOVNBdGxHakxP?=
 =?utf-8?B?UWswbnRxTzdhazdHMnlUVTZKczhGN3M1Mk1vTmM4NmxRbm9wckhuZUZzcno2?=
 =?utf-8?B?RzQ1MUh2ZEkreHl5aHBrYjduWnVHS213VDJSQTRBYjJNWmcvN3AzUjZITkIx?=
 =?utf-8?B?WjN1TlNmd0RrMkFoaVlBZnB3MWNVVG41L3RnNnVLNDJnUmtGWGRORmdsZENK?=
 =?utf-8?B?a0FyQmdLK256bFY0MEh4VHl1Vld3cHJ5K05lZnl6a1NPRi9FN08zMTRITm1F?=
 =?utf-8?B?K0ZicTQza3pxSlhZb1NjMkhnUGRoRXRyNWJSMFA4V1Zva1JrbjlmOUV1cjd0?=
 =?utf-8?B?VHBMZTFqbkZFWHRiQU9HdnB2aWFnWDhVZ2s1WE95WnoyRitsZ1RxRHhXdGZL?=
 =?utf-8?B?dGpWOTY3eFBiRE44ZG9VR1lQRnRnWGZNSjgvOUhnN3lORHhzRjcvaG9NTUVv?=
 =?utf-8?B?ZG9NYnUwbUJlT0R3NElvUjNmNnFaOVZwUWVCaDVrdGZxNCsxdm9LWWVBR1dr?=
 =?utf-8?B?RHpUd2dXRkwyd1FBZEhneDFHMVVtL2FrWlUxTG1BbnA0MVlsYzRqRlQ3U2tl?=
 =?utf-8?B?alhtck1EY1ZhanJPSnFaNWREYStJQUhYUWhkR0g1eklWNGkwOWxMTjgzemJ3?=
 =?utf-8?B?d0xHUmVkNmx3LzAxZ3FHbDA5bWhxSERHMmM2d09JWlVMZVFrTTlIOEo2WmFE?=
 =?utf-8?B?YmlzS3M3aVVYM05rT2pFVmhvTkMwc2ZVNHQvOHdxeVlQblkrd0V6ckdaNWxl?=
 =?utf-8?B?NVo0UXBsVlIyKzJyQmJPZmZValNyYVo3MnZuZEZmSGx3aHBGRWgxdG9ra3ZM?=
 =?utf-8?B?WjlnZEtSYlJPMCtCUUNCU2g4Q2lYdFlZL3NXbHExRUVDVlRIZTBZZm1jMitz?=
 =?utf-8?B?Q0FMTDdqazgvWnhFNFZGN0syRFpCUENsajR2SXRyMHg1OGZRbkZZczl4VUJB?=
 =?utf-8?B?SExXMVNWc0lBOXVidmZKN1J4L0NYM1E0S1VZaVF4SDQ5UGVPOTlUZkRTNGJY?=
 =?utf-8?B?RnZHVGllYmo4UGtjZmRnWXdyMHY5NjV6UXB3NERlRmNXT1BBZTRYR3VuZytz?=
 =?utf-8?B?SVdMdWlTaW5lSG4yR0N5aWlmR0hJc3V5em0zTDF4MnBpbHJVa3M4Y1RqM0pi?=
 =?utf-8?B?d3NBdk44RzAwUVBZQ2pwVnl1azQ1eDA5R1ZoNkJPK2NXZmhBU0xvUTV0UUVr?=
 =?utf-8?B?TGd2aDNWK2VLL0k2RDJsYTIwQTVNK0hidjRaa0ovVXE2TElCbHRXb1B4dGor?=
 =?utf-8?B?c0p3NU5lZWlxUzRJd3lnMDBnWThBbU9sME5IRUp4NzQrb1RsaG5NTklmR0tI?=
 =?utf-8?B?QSttL0pDRzQvWm9JV3ZhRHRTN0g1dktoekpiQkVkQmhFenMySG5TMmdUMUlZ?=
 =?utf-8?B?a3lGaElMN3RMa1VZLytHWC9RbzRad3praVh3Z3pkcEN5L0RNOEdWZnZyY3Np?=
 =?utf-8?B?V3ZMcS80RFQ3ZmVCT0tMVytsL2trcEZYNnJDUGFHdEFRUnF0UWl2WW5qMC82?=
 =?utf-8?B?d2g5T2dSa3kzVkZSVW5NNVdSMkNjM3JRcEtIcERXYUhwZHV5RWhMZDZNa0Fx?=
 =?utf-8?B?RlluQWZFNzh4S0p2RURISHZTeGVPUzd4c3BZZ3BKdWtITmErakw4UXhHalkx?=
 =?utf-8?B?Q25uN0hscnZpTXFhTW9aYTZEb2tXMklUVkwzMEtlYjVkbUR5YlRhcEFmUFB5?=
 =?utf-8?B?ZkE3T3BLdmFNVmIvNWhGR3pCbTZBMmY3VU00MVFWK2V5a3dwNXF1dnRqd1o5?=
 =?utf-8?B?bVY1S0FuemlVT2JaZm01OHVERFIxVE9FNHN2anpVakNaMWlGUzZVZFdMLzhQ?=
 =?utf-8?B?ODBvUDArT0QwQ29nUmhhSStFS05vZDlmbnNjeVdEcHcyZFBrN3M3VzQ3OFVF?=
 =?utf-8?B?K1Nwd3RIK0Y0R1Y0bSs0Qnk2d0NiMFNQUExLU3lteGNuazU1K3dJREZKdFVD?=
 =?utf-8?B?Tk9FSEZXdEorbWRGT25JbGx1bGhJQmRlS3hNNG80ZW4zWjNpNXd6YmlDSC9Q?=
 =?utf-8?Q?0qPk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1C4604973203C242A56CB919931403BD@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b089425e-8944-4b8c-2a4e-08dcb29c0af4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2024 02:37:24.7624
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OJHF9RR+g4QfV7Ig1lqIfv1OqWZ2RfUzi9T9tewOc4J/4MRpCtNgL9vByN4eegfxTue2jO1Y2T0S7pH1mrF1Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8178

T24gMjAyNC83LzMxIDIxOjAzLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBXZWQsIEp1
bCAzMSwgMjAyNCBhdCAwMTozOTo0MFBNICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9u
IDMxLjA3LjIwMjQgMTM6MjksIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4gT24gV2VkLCBK
dWwgMzEsIDIwMjQgYXQgMTE6NTU6MzVBTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+
IE9uIDMxLjA3LjIwMjQgMTE6MzcsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+PiBPbiBX
ZWQsIEp1bCAzMSwgMjAyNCBhdCAxMTowMjowMUFNICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToN
Cj4+Pj4+PiBPbiAzMS4wNy4yMDI0IDEwOjUxLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+
Pj4+PiBJIGFncmVlIHdpdGggKGEpLCBidXQgSSBkb24ndCB0aGluayBlbmFibGluZyBQVkggZG9t
MCB1c2FnZSBvZiB0aGUNCj4+Pj4+Pj4gaHlwZXJjYWxscyBzaG91bGQgYmUgZ2F0ZWQgb24gdGhp
cy4gIEFzIHNhaWQgYSBQViBkb20wIGlzIGFscmVhZHkNCj4+Pj4+Pj4gY2FwYWJsZSBvZiBpc3N1
aW5nIFBIWVNERVZPUF97LHVufW1hcF9waXJxIG9wZXJhdGlvbnMgYWdhaW5zdCBhIFBWSA0KPj4+
Pj4+PiBkb21VLg0KPj4+Pj4+DQo+Pj4+Pj4gT2theSwgSSBjYW4gYWNjZXB0IHRoYXQgYXMgYW4g
aW50ZXJtZWRpYXRlIHBvc2l0aW9uLiBXZSBvdWdodCB0byBkZW55DQo+Pj4+Pj4gc3VjaCByZXF1
ZXN0cyBhdCBzb21lIHBvaW50IHRob3VnaCBmb3IgUFZIIGRvbWFpbnMsIHRoZSBsYXRlc3QgaW4g
dGhlDQo+Pj4+Pj4gY291cnNlIG9mIG1ha2luZyB2UENJIHdvcmsgdGhlcmUuDQo+Pj4+Pg0KPj4+
Pj4gSG0sIG9uY2UgcGh5c2Rldl9tYXBfcGlycSgpIHdvcmtzIGFzIGludGVuZGVkIGFnYWluc3Qg
UFZIIGRvbWFpbnMsIEkNCj4+Pj4+IGRvbid0IHNlZSB3aHkgd2Ugd291bGQgcHJldmVudCB0aGUg
dXNhZ2Ugb2YgUEhZU0RFVk9QX3ssdW59bWFwX3BpcnENCj4+Pj4+IGFnYWluc3Qgc3VjaCBkb21h
aW5zLg0KPj4+Pg0KPj4+PiBXZWxsLiBJZiBpdCBjYW4gYmUgbWFkZSB3b3JrIGFzIGludGVuZGVk
LCB0aGVuIEkgY2VydGFpbmx5IGFncmVlLiBIb3dldmVyLA0KPj4+PiB3aXRob3V0IGV2ZW4gdGhl
IGNvbmNlcHQgb2YgcElSUSBpbiBQVkggSSdtIGhhdmluZyBhIGhhcmQgdGltZSBzZWVpbmcgaG93
DQo+Pj4+IGl0IGNhbiBiZSBtYWRlIHdvcmsuIElpcmMgeW91IHdlcmUgYWR2b2NhdGluZyBmb3Ig
dXMgdG8gbm90IGludHJvZHVjZSBwSVJRDQo+Pj4+IGludG8gUFZILg0KPj4+DQo+Pj4gRnJvbSB3
aGF0IEknbSBzZWVpbmcgaGVyZSB0aGUgaW50ZW50aW9uIGlzIHRvIGV4cG9zZQ0KPj4+IFBIWVNE
RVZPUF97LHVufW1hcF9waXJxIHRvIFBWSCBkb20wLCBzbyB0aGVyZSBtdXN0IGJlIHNvbWUgbm90
aW9uIG9mDQo+Pj4gcElSUXMgb3IgYWtpbiBpbiBhIFBWSCBkb20wPyAgRXZlbiBpZiBvbmx5IGZv
ciBwYXNzdGhyb3VnaCBuZWVkcy4NCj4+DQo+PiBPbmx5IGluIHNvIGZhciBhcyBpdCBpcyBhbiBh
YnN0cmFjdCwgaGFuZGxlLWxpa2UgdmFsdWUgcGVydGFpbmluZyBzb2xlbHkNCj4+IHRvIHRoZSB0
YXJnZXQgZG9tYWluLg0KPj4NCj4+Pj4gTWF5YmUgeW91J3JlIHRoaW5raW5nIG9mIHJlLXVzaW5n
IHRoZSBzdWItb3BzLCByZXF1aXJpbmcgUFZIIGRvbWFpbnMgdG8NCj4+Pj4gcGFzcyBpbiBHU0lz
Pw0KPj4+DQo+Pj4gSSB0aGluayB0aGF0IHdhcyBvbmUgbXkgcHJvcG9zYWxzLCB0byBlaXRoZXIg
aW50cm9kdWNlIGEgbmV3DQo+Pj4gaHlwZXJjYWxsIHRoYXQgdGFrZXMgYSBHU0ksIG9yIHRvIG1v
ZGlmeSB0aGUgUEhZU0RFVk9QX3ssdW59bWFwX3BpcnENCj4+PiBpbiBhbiBBQkkgY29tcGF0aWJs
ZSB3YXkgc28gdGhhdCBzZW1hbnRpY2FsbHkgdGhlIGZpZWxkIGNvdWxkIGJlIGEgR1NJDQo+Pj4g
cmF0aGVyIHRoYW4gYSBwSVJRLiAgV2UgaG93ZXZlciB3b3VsZCBhbHNvIG5lZWQgYSB3YXkgdG8g
cmVmZXJlbmNlIGFuDQo+Pj4gTVNJIGVudHJ5Lg0KPj4NCj4+IE9mIGNvdXJzZS4NCj4+DQo+Pj4g
TXkgbWFpbiBjb25jZXJuIGlzIG5vdCB3aXRoIHBJUlFzIGJ5IGl0c2VsZiwgcElSUXMgYXJlIGp1
c3QgYW4NCj4+PiBhYnN0cmFjdCB3YXkgdG8gcmVmZXJlbmNlIGludGVycnVwdHMsIG15IGNvbmNl
cm4gYW5kIHdoYXQgSSB3YW50ZWQgdG8NCj4+PiBhdm9pZCBvbiBQVkggaXMgYmVpbmcgYWJsZSB0
byByb3V0ZSBwSVJRcyBvdmVyIGV2ZW50IGNoYW5uZWxzLiAgSU9XOg0KPj4+IGhhdmUgaW50ZXJy
dXB0cyBmcm9tIHBoeXNpY2FsIGRldmljZXMgZGVsaXZlcmVkIG92ZXIgZXZlbnQgY2hhbm5lbHMu
DQo+Pg0KPj4gT2gsIEkgbWlnaHQgaGF2ZSBzbGlnaHRseSBtaXN1bmRlcnN0b29kIHlvdXIgaW50
ZW50aW9ucyB0aGVuLg0KPiANCj4gTXkgaW50ZW50aW9uIHdvdWxkIGJlIHRvIG5vdCBldmVuIHVz
ZSBwSVJRcyBhdCBhbGwsIGluIG9yZGVyIHRvIGF2b2lkDQo+IHRoZSB0ZW1wdGF0aW9uIG9mIHRo
ZSBndWVzdCBpdHNlbGYgbWFuYWdpbmcgaW50ZXJydXB0cyB1c2luZw0KPiBoeXBlcmNhbGxzLCBo
ZW5jZSBJIHdvdWxkIGhhdmUgcHJlZmVycmVkIHRoYXQgYWJzdHJhY3QgaW50ZXJmYWNlIHRvIGJl
DQo+IHNvbWV0aGluZyBlbHNlLg0KPiANCj4gTWF5YmUgd2UgY291bGQgZXZlbiBleHBvc2UgdGhl
IFhlbiBJUlEgc3BhY2UgZGlyZWN0bHksIGFuZCBqdXN0IHVzZQ0KPiB0aGF0IGFzIGludGVycnVw
dCBoYW5kbGVzLCBidXQgc2luY2UgSSdtIG5vdCB0aGUgb25lIGRvaW5nIHRoZSB3b3JrDQo+IEkn
bSBub3Qgc3VyZSBpdCdzIGZhaXIgdG8gYXNrIGZvciBzb21ldGhpbmcgdGhhdCB3b3VsZCByZXF1
aXJlIG1vcmUNCj4gY2hhbmdlcyBpbnRlcm5hbGx5IHRvIFhlbi4NCj4gDQo+Pj4+IEkgdGhpbmsg
SSBzdWdnZXN0ZWQgc29tZXRoaW5nIGFsb25nIHRoZXNlIGxpbmVzIGFsc28gdG8NCj4+Pj4gSmlx
aWFuLCB5ZXQgd2l0aCB0aGUgbm93IGludGVuZGVkIGV4cG9zdXJlIHRvICFoYXNfcGlycSgpIGRv
bWFpbnMgSSdtDQo+Pj4+IG5vdCBzdXJlIHRoaXMgY291bGQgYmUgbWFkZSB3b3JrIHJlbGlhYmx5
Lg0KPj4+DQo+Pj4gSSdtIGFmcmFpZCBJJ3ZlIGJlZW4gbGFja2luZyBiZWhpbmQgb24gcmV2aWV3
aW5nIHRob3NlIHNlcmllcy4NCj4+Pg0KPj4+PiBXaGljaCByZW1pbmRzIG1lIG9mIGFub3RoZXIg
cXVlc3Rpb24gSSBoYWQ6IFdoYXQgbWVhbmluZyBkb2VzIHRoZSBwaXJxDQo+Pj4+IGZpZWxkIGhh
dmUgcmlnaHQgbm93LCBpZiBEb20wIHdvdWxkIGlzc3VlIHRoZSByZXF1ZXN0IGFnYWluc3QgYSBQ
VkggRG9tVT8NCj4+Pj4gV2hhdCBtZWFuaW5nIHdpbGwgaXQgaGF2ZSBmb3IgYSAhaGFzX3BpcnEo
KSBIVk0gZG9tYWluPw0KPj4+DQo+Pj4gVGhlIHBpcnEgZmllbGQgY291bGQgYmUgYSB3YXkgdG8g
cmVmZXJlbmNlIGFuIGludGVycnVwdC4gIEl0IGRvZXNuJ3QNCj4+PiBuZWVkIHRvIGJlIGV4cG9z
ZWQgdG8gdGhlIFBWSCBkb21VIGF0IGFsbCwgYnV0IGl0J3MgYSB3YXkgZm9yIHRoZQ0KPj4+IGRl
dmljZSBtb2RlbCB0byBpZGVudGlmeSB3aGljaCBpbnRlcnJ1cHQgc2hvdWxkIGJlIG1hcHBlZCB0
byB3aGljaA0KPj4+IGRvbWFpbi4NCj4+DQo+PiBTaW5jZSBwSVJRLXMgYXJlIHBlci1kb21haW4s
IF90aGF0XyBraW5kIG9mIGFzc29jaWF0aW9uIHdvbid0IGJlDQo+PiBoZWxwZWQuIEJ1dCB5ZXMs
IGFzIHBlciBhYm92ZSBpdCBjb3VsZCBzZXJ2ZSBhcyBhbiBhYnN0cmFjdCBoYW5kbGUtDQo+PiBs
aWtlIHZhbHVlLg0KPiANCj4gSSB3b3VsZCBiZSBmaW5lIHdpdGggZG9pbmcgdGhlIGludGVycnVw
dCBiaW5kaW5ncyBiYXNlZCBvbiBJUlFzDQo+IGluc3RlYWQgb2YgcElSUXMsIGJ1dCBJJ20gYWZy
YWlkIHRoYXQgd291bGQgcmVxdWlyZSBtb3JlIGNoYW5nZXMgdG8NCj4gaHlwZXJjYWxscyBhbmQg
WGVuIGludGVybmFscy4NCj4gDQo+IEF0IHNvbWUgcG9pbnQgSSBuZWVkIHRvIHdvcmsgb24gYSBu
ZXcgaW50ZXJmYWNlIHRvIGRvIHBhc3N0aHJvdWdoLCBzbw0KPiB0aGF0IHdlIGNhbiByZW1vdmUg
dGhlIHVzYWdlIG9mIGRvbWN0bHMgZnJvbSBRRU1VLiAgVGhhdCBtaWdodCBiZSBhDQo+IGdvb2Qg
b3Bwb3J0dW5pdHkgdG8gc3dpdGNoIGZyb20gdXNpbmcgcElSUXMuDQoNClRoYW5rcyBmb3IgeW91
ciBpbnB1dCwgYnV0IEkgbWF5IGJlIGEgYml0IGJlaGluZCB5b3Ugd2l0aCBteSBrbm93bGVkZ2Ug
YW5kIGNhbid0IGZ1bGx5IHVuZGVyc3RhbmQgdGhlIGRpc2N1c3Npb24uDQpIb3cgc2hvdWxkIEkg
bW9kaWZ5IHRoaXMgcXVlc3Rpb24gbGF0ZXI/DQpTaG91bGQgSSBhZGQgYSBuZXcgaHlwZXJjYWxs
IHNwZWNpZmljYWxseSBmb3IgcGFzc3Rocm91Z2g/DQpPciBpZiBpdCBpcyB0byBwcmV2ZW50IHRo
ZSAodW4pbWFwIGZyb20gYmVpbmcgdXNlZCBmb3IgUFZIIGd1ZXN0cywgY2FuIEkganVzdCBhZGQg
YSBuZXcgZnVuY3Rpb24gdG8gY2hlY2sgaWYgdGhlIHN1YmplY3QgZG9tYWluIGlzIGEgUFZIIHR5
cGU/IExpa2UgaXNfcHZoX2RvbWFpbigpLg0KDQo+IA0KPiBUaGFua3MsIFJvZ2VyLg0KDQotLSAN
CkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

