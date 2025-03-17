Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84312A650A4
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 14:22:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916855.1321872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuAPr-0000HV-PG; Mon, 17 Mar 2025 13:22:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916855.1321872; Mon, 17 Mar 2025 13:22:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuAPr-0000FW-MM; Mon, 17 Mar 2025 13:22:03 +0000
Received: by outflank-mailman (input) for mailman id 916855;
 Mon, 17 Mar 2025 13:22:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Z1w=WE=boeing.com=Anderson.Choi@srs-se1.protection.inumbo.net>)
 id 1tuAPp-0000FQ-V8
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 13:22:02 +0000
Received: from clt-mbsout-02.mbs.boeing.net (clt-mbsout-02.mbs.boeing.net
 [130.76.144.163]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd3b739b-0332-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 14:21:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by clt-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 52HDLt5Z003796; Mon, 17 Mar 2025 09:21:56 -0400
Received: from XCH16-11-07.nos.boeing.com (xch16-11-07.nos.boeing.com
 [144.115.66.34])
 by clt-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 52HDLnjN003728
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 17 Mar 2025 09:21:49 -0400
Received: from XCH16-07-08.nos.boeing.com (144.115.66.110) by
 XCH16-11-07.nos.boeing.com (144.115.66.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Mar 2025 06:21:49 -0700
Received: from XCH19-EDGE-C02.nos.boeing.com (130.76.144.198) by
 XCH16-07-08.nos.boeing.com (144.115.66.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44 via Frontend Transport; Mon, 17 Mar 2025 06:21:49 -0700
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.150)
 by boeing.com (130.76.144.198) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 17 Mar
 2025 06:21:32 -0700
Received: from BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:19b::17)
 by BNAP110MB2128.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1a6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.31; Mon, 17 Mar
 2025 13:21:29 +0000
Received: from BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM
 ([fe80::394b:7a34:da07:485d]) by BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM
 ([fe80::394b:7a34:da07:485d%6]) with mapi id 15.20.8511.031; Mon, 17 Mar 2025
 13:21:29 +0000
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
X-Inumbo-ID: cd3b739b-0332-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1742217716;
	bh=YaLa3FJtxYSc5gdlxg1oOBwg9ku9Z6qD3QNnVOisFZg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Mxz7PJ4DwoR9i4SQ5F5Jr76hk+05a3SxxygUIqvgOv8JdC/NBmnH0VElVC02ua20Q
	 T4esqe93gr41l8gC4pKx3E3BOMwlaXGetEKK3ZXW4iU70pkB9RdMPwtrn7NS2lWLAx
	 zZUqmhJixhcZlxAPlw3XAcVhs/4eCHW1t9INLCmkuQnkegOqhYVG+Xe4NO1TFULDpa
	 XNop5KNIhaHmFSBvk9O4fXRIaeZ+Lue9xdTLA4kfZcX5AS5xDdsCZNvbef7ZlesLjh
	 p/y+5BZMSmjTbtEfL1HE8xkAeKR8ToCnC/Uz6M5d2VQDIaN8zXmDpYIbScR533I83a
	 teshYieHE9iRQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=n3MY/ONuOGbplmAeFt7W2q2hZht64BDpvzS+G9HvsWSxu09R0Uudm3fAmNWMwTDNHdkjpAg5jwpiyUlN5XUwMpYIN1Fn9wSD7p5G6v9asImpqbJAhFt28TeB4/xLKeTzlXPCNXfplJA7MbZ3i5U6CgC8Wk6acbqw8URZlthARe3MQkbqLRPqdJvknVuA0Q4QdRALCMNiIEDeweIxswN+51fQCaKVwMfYj+uPbrr/6AE4S88cQy/5W2xocTLlSrVLOZfKEOjXgkJbI2GnWAMTU5Rh3Q0hobU0QF8B0T/PwkAU5FSGpWKL4/p1IlBagv0aeYkbD3gm4ztOHoOc0mU1fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YaLa3FJtxYSc5gdlxg1oOBwg9ku9Z6qD3QNnVOisFZg=;
 b=O8HivnHkQb15pE9wI7u/qOc4hLfQqBlC7fGDo3soF29M9y6RtPRGJ36xVx3dQ9zTL6xzPLyIyXtYJS5JHrmIEF6ZhowWrYBqgdjfxRSvrKYRJKkbI4Vvqo+EtrtaRBKCPSHrivyuREPkRZsLUY08ndCVQdtnhq+fGUO+GcvVRMjt/KltcJ3ncQks0mSLiRLFxsH5LI3FQQ0aX/77X4tcTTojmQiYib/rdgqUBlUkgg5iTpNyRRPZ9IdTIs+vtImq+tgHts3gHA855et0lffh/oQ8eq3F8n39qEuth33PMgYmD5XhT0YGFdhmWCFq9XFIubOeP3QzAWt0STQYfFc37w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=boeing.com; dmarc=pass action=none header.from=boeing.com;
 dkim=pass header.d=boeing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.onmicrosoft.com; s=selector1-boeing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YaLa3FJtxYSc5gdlxg1oOBwg9ku9Z6qD3QNnVOisFZg=;
 b=EU6/fO2Lz/03Bve/t4apS653IVyuUGG0g5RExd1dy1rEAry25eWtcyypIDAxkINwfYU0FxCLX/erTb6l+vkq6WBanrgWCfEiSG6KSzd6VMR47uVh9T5teR7rIwVGwnxJuLlV8r0zJLU4YNfpEuTNJ38XDiz5/zW8nXucoXeEAZo=
From: "Choi, Anderson" <Anderson.Choi@boeing.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "nathan.studer@dornerworks.com" <nathan.studer@dornerworks.com>,
        "stewart@stew.dk" <stewart@stew.dk>,
        "Weber (US), Matthew L"
	<matthew.l.weber3@boeing.com>,
        "Whitehead (US), Joshua C"
	<joshua.c.whitehead@boeing.com>
Subject: RE: Xen panic when shutting down ARINC653 cpupool
Thread-Topic: Xen panic when shutting down ARINC653 cpupool
Thread-Index: AduW+TkPYPhh1TXsRdStDrK0/zWwnAAGRhuAAAtC5eA=
Date: Mon, 17 Mar 2025 13:21:28 +0000
Message-ID: <BN0P110MB21482540CB855953D54BAB1090DFA@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
References: <BN0P110MB21487F77F8E578780A3FE44490DFA@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
 <fd4fe44c-6c8d-402c-8b0f-466cf596f8af@suse.com>
In-Reply-To: <fd4fe44c-6c8d-402c-8b0f-466cf596f8af@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=boeing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB2148:EE_|BNAP110MB2128:EE_
x-ms-office365-filtering-correlation-id: b27e9d66-a1c2-481c-1d22-08dd6556a077
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Q3RMd29SUmhiYi85WWsxeDNHSGgzRk5idjdYMWlDN3pRVkd4L3ZMNmlRMGN3?=
 =?utf-8?B?QmkyVkJvMGRpdDExMjdSaDBZOEE1REkycm1vVFFXcnhMTEFhSUF1YUNxOFJ5?=
 =?utf-8?B?RnJOVmtNWDk3dlRyQ0duUlhOWEI3QmJBdVM2aTNXYkNRVWJtaldHNDh3Mmg0?=
 =?utf-8?B?bFRFaUIyWW92N3FzOTMwTHZsQkprY1RtSkoyTE1HbVNEdWlGVld3ZDlJVFNr?=
 =?utf-8?B?eHZsR1JENmFDWFFRakNFTVJtNlpYaUxqTXFUcVB5YmxHNllFMzZ1dEdYS0FO?=
 =?utf-8?B?cHZNSzB0Q01kckRWTk8yNnIrMmpiVjcxVnBuUGg3ODNoWm5OYkdXeHpBb1JZ?=
 =?utf-8?B?QUt1VVhNVzhxMzNONzkwdWh2d0VVTldCdzNOSmNDWjRseUFOaGg2MHRMcDAw?=
 =?utf-8?B?QzhJS3BSMHBhSzY4SmpaR3YrUnlER2FEdTdhZDlGOWZITzNEczg3T1lJbVV1?=
 =?utf-8?B?VEtxdWZHb0hPek1YZzFiTTk1RDA0MVA1RkN5bndKVEQ1endWMk9sdUNIQTJC?=
 =?utf-8?B?NzlzQVlWc3VqQlBhL2Vjc3liM1B1c0ErdVJEZ05yZzFJcms3RnkzdFFwUXp3?=
 =?utf-8?B?cnVFSGlPM1VrdE43TDZqdzhJQ2dOdzZ5bCs1anAxTDlTaWRjZHZnYk9mZkhL?=
 =?utf-8?B?MThKRnhhNWZvdUhCcWY5ZWlQelREZ25UamhzS2w4SUlhM3RmdkpJelJOdTVR?=
 =?utf-8?B?elc2MjlXZUFYeXJOaUZyZExTVEFKbEx0RWxQQWtkZXdwM1VpV1dRcWxaSWVG?=
 =?utf-8?B?RjZhUTN0QU5tZkhmdzczTkdlTWF1OWFkYnpGTnJXMDZmSHY3SUxwMmRXSzgz?=
 =?utf-8?B?NGhIbTZsa20vUVlZSDlpTHVvUE1tcjM2eU84NjBFWlZ5aURXMW9uei85VGFv?=
 =?utf-8?B?eGFIYi9QNGxySEVXTDdXM1BHbk1zdU04b05LNHBBY3VnVHJjNTh4cDdhWDE5?=
 =?utf-8?B?dDEwWmRiNVA3MjJweXFMeU03TmZrWERxSGQxMG4weFZLRW53M0ExS0hjNG5I?=
 =?utf-8?B?Q3h4QkE3cXQzVklzeW9RV3lRVHlOMHN2Y1RlUmtPMWZUSDZSbml5UzJsWnRB?=
 =?utf-8?B?TGRJRGFSeTJuZWFocHJWVW5hQzRnbXpRZTNBMWFMb2swYm0rdGQydG1oTGVF?=
 =?utf-8?B?TjFXcGJOa0h6QW9tV3RjQ3JzaDVlOXYzMW1rM1Y0UXNjTlpEaWlTZG83czRp?=
 =?utf-8?B?NElvTkVNQUF3cTAvYVdnOTRSRDBJbUhWTlVOc0hXRXdNekJyamptblZnWEJ5?=
 =?utf-8?B?UVV2VzJyUkV1L2VJUVl4Myt3MVJoZUxJVUM4TzlpUThtRmhod2dwZ3VGWlYy?=
 =?utf-8?B?YUtaeCtVSE1uU0dkRDl4WmxQNkNlVlhGeXNSVmNZckc5cVdvaks3NXRBMVdU?=
 =?utf-8?B?Y2tHSHVvdTY3NzI4aWlHN2hYVnlqa3VsN0pZdy8xQmtYV1lXbTExQ3BZdlZJ?=
 =?utf-8?B?aXFTUDRIcDNGeWJJTXcrS0NHclpGYWtCR2txWFpFVjVVSXVXNkdDZ1lnT1Fv?=
 =?utf-8?B?eGt5eWZjNzRuR2QySmE1dEQzUXluelJxS0ZzS1A0WEdWblh5S01aNmhucytt?=
 =?utf-8?B?cjZvNHczQVByTE5oS1NwVEpzSmJObUNBa0g4SHJwcnh6YnFZYzFROFJ1eEN0?=
 =?utf-8?B?Wk9kMGFZUTZKSnJCaDFZZml1dVZWYm5zdTcyc2Nabnh2LzJYT2dKaUtnZDVx?=
 =?utf-8?B?Qm85aGMvM0VnT1VGRHpENWp3YzJ4RVFlZ092VFhyTjNMVk1aQm5TMWtXNGYx?=
 =?utf-8?B?TTBxdHVaVEdFcFNKZ1RrSi8yL1MzQWM4WEpQYmFIRTVtT2t0ZVR3R3ZHb25W?=
 =?utf-8?B?ZEx1Qmxyc3h1eDFvNmI3NlNGVWNjTlpjam1RRlRGaWdCNGxNcFY4OVVONDl6?=
 =?utf-8?B?SSs3ZFhXMmczTkQ0OE5JQ0pQakZyeWMzWWJpRk92L2FMOHc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MkFPWEZBSWtQUzFoK0RXMStLaXdnT3dIZzdveE9zLzd5c2h5QXk0dCttblVa?=
 =?utf-8?B?eGNHRnJhMHdhWU40cUZQNlFWNExDRXQ0QzBwaHhVcXJCM3NuRzY0cEFhUkFq?=
 =?utf-8?B?V1l3cWJvUnJMN05jekFwUENjbytHUDdqZ05YWkFZL3FZSXdVam9ndjNkTk84?=
 =?utf-8?B?V2d0L0crRXpFM2VXRC8wZUtqNGtWZHFoT2Z2SHROcHZGOGNWUzJ4R1J0d3BE?=
 =?utf-8?B?eVlJQUowWXBBazN0Yy9vQkpmYzZHMXgvQUR3TXUwQUtORWtzVFBnWnZXaEtI?=
 =?utf-8?B?SjZPcGM5UDRMdDhhMVBkOFZtUnpFV0pld2g5aVcra285Q0VISTVNSTgwZWdj?=
 =?utf-8?B?MFY2RWpDTEFQNEdTSzhqY1BzTWtWZkMzZkpPOHFPanUxQmIzZjk3L29JcDRo?=
 =?utf-8?B?QWRVZHZ4SFQ5QVpaOTg1RmdISG01c1FlRzVHc1JTMGMyL2Nxb3dITzdma3Rp?=
 =?utf-8?B?ejFQQkt3bkNFU3JaalhqVEV1Q3RsYit1RWpEbDVlbUFQWHQ4UHQ2UDlrSUFR?=
 =?utf-8?B?dlY1V0p6T3pqZ1NpbGtqQmRseHRESWxTOEhETE1ncktXMi8zQ1pPTHBnZ1gr?=
 =?utf-8?B?TnF6VS8xOThSbHViVEdZTTNIM3p1a2tSejdaa1pGd1BQMmxkVGErd3M4VWkz?=
 =?utf-8?B?SjJFUWFVdGpOR1VjZnhKaytGUXN1N01naTJ6TlJoaWdKeXNJY2s5TFY4Zi9l?=
 =?utf-8?B?ZEpCRFdRY2hxTWJteVAydDNMZnY2dk1KdG9UeE42enZBZU5wUWowS0c0cXdS?=
 =?utf-8?B?M09YUkxCbWpjSkttNTg5T05maWFYZkFVNW0zdklDWlByNTRiR1hSczFDQXcz?=
 =?utf-8?B?aDVrcmh0bFMyRWc4STNpSG9oTUh4RVk1OEtCTk85YTZSZ3ZWYUJEeE5HejdO?=
 =?utf-8?B?dW1uQUlFL2EwTE9QbGllZUl0ZE5Na2gzNjFpNWFTdEUxNUUvN3FQWU9wR1dP?=
 =?utf-8?B?cnZxLzkyMXhMWjFzYVVMNVBxOHliRUlmSlYvekxzTVJySW11bnBGcmszbUYx?=
 =?utf-8?B?UDIzQnFHL1Rja3dlUkNkeStvcVlWTlAreTVrOTllT0dUVWdSRGduOE9NOEJy?=
 =?utf-8?B?c21kRjJQQ2RDbWIyNVk1RlRMMzBNMnp2TGdvaVM5bzlMdjJ1L0pueFhBRHFp?=
 =?utf-8?B?cStYMWR2UGxVSHF5THp1WFMvSEV2TFB2dVYvbzdVYVFpbEpuVmZQd1FXZmFW?=
 =?utf-8?B?NTgvYm5wM1RaQzZqZVlVbWVhQlplOW1UcVAreFkzd25mdmIzUmlXWmVBZWto?=
 =?utf-8?B?eG5YSjdXNWt4YjJuT01kRHg3S2llVnBERzRibTE2cG9FVE9wREhlT2RDMjNi?=
 =?utf-8?B?N3JMZHBJdjIvRFpqMnpnd21xMC9VTGlISXU2TXc1TS9FWEt2THNrblhlNDNG?=
 =?utf-8?B?Uk85eXJvMlRTSHpXSlh0LzdkaDh1WW9HdUtWRjBDbVBzVUNTcGE4dDUzVkRk?=
 =?utf-8?B?Qjk4OWk4Tjl0VUxtak8vR1RZYU1EVVpPS1lwemgwTm82WXRqaDEvaW5Xeisz?=
 =?utf-8?B?TzdNejdIRXRZS0lGbmM4RmVlMm9KTUdtOTZVMlgvaHpXdEllNEVhamVONnhn?=
 =?utf-8?B?dWRBcjJxKzdNQ0RWQy9jNWxFVW83K3prNmVqUkxjeUxjcENpeXQwaFRkL0Yz?=
 =?utf-8?B?YTAvWTQxL293d1RQeGVrRnpXZFE2N3JLUkxZL0RlU0xWQ0lGTlVjZUN4VEdD?=
 =?utf-8?B?WWx1YmR5ZlpBUUUzdDUvRWl6R3JiNCtSa1lUa3BBMzNnSjdNVWhZMS9GU1Mw?=
 =?utf-8?B?aXhCTndRY0hNM2FaemRvSEl0THM1VXdMY2tEb1huZFAyVG5ITUEyZzVaWklM?=
 =?utf-8?B?WlBPL2FESmZJTXhzeERHKytYWVQ0TmJlWjhlam1xUUs2ZXNQT0dtSWUvbkxC?=
 =?utf-8?B?SmhuVHdPejdTSmhWdG54NVA5a2llVnBsZWZ0R3JDUUJkWVN1SnN1ZGl5OW80?=
 =?utf-8?B?VXN0S05tTmcwMzBMRmZiTTcrSWlwcTc0UCt3TmRDVCt6QUwwQWRBZFZFdlBs?=
 =?utf-8?B?dFYyUk9DeFR1NVdWbFpyNEdMSkQ5WVdpQkRXYk9uMHUvMitiK2lUcEpOOXlG?=
 =?utf-8?Q?ypukqe?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b27e9d66-a1c2-481c-1d22-08dd6556a077
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2025 13:21:28.9740
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcf48bba-4d6f-4dee-a0d2-7df59cc36629
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BNAP110MB2128
X-OriginatorOrg: boeing.com
X-TM-AS-GCONF: 00

SsO8cmdlbiwNCg0KPiBPbiAxNy4wMy4yNSAwNjowNywgQ2hvaSwgQW5kZXJzb24gd3JvdGU6DQo+
PiBJJ2QgbGlrZSB0byByZXBvcnQgeGVuIHBhbmljIHdoZW4gc2h1dHRpbmcgZG93biBhbiBBUklO
QzY1MyBkb21haW4gDQo+PiB3aXRoIHRoZSBmb2xsb3dpbmcgc2V0dXAuIE5vdGUgdGhhdCB0aGlz
IGlzIG9ubHkgb2JzZXJ2ZWQgd2hlbiANCj4+IENPTkZJR19ERUJVRyBpcyBlbmFibGVkLg0KPj4g
DQo+PiBbVGVzdCBlbnZpcm9ubWVudF0NCj4+IFlvY3RvIHJlbGVhc2UgOiA1LjA1DQo+PiBYZW4g
cmVsZWFzZSA6IDQuMTkgKGhhc2ggPSAwMjZjOWZhMjk3MTZiMGZmMGY4YjdjNjg3OTA4ZTcxYmEy
OWNmMjM5KQ0KPj4gVGFyZ2V0IG1hY2hpbmUgOiBRRU1VIEFSTTY0DQo+PiBOdW1iZXIgb2YgcGh5
c2ljYWwgQ1BVcyA6IDQNCj4+IA0KPj4gW1hlbiBjb25maWddDQo+PiBDT05GSUdfREVCVUcgPSB5
DQo+PiANCj4+IFtDUFUgcG9vbCBjb25maWd1cmF0aW9uIGZpbGVzXQ0KPj4gY3B1cG9vbF9hcmlu
YzAuY2ZnDQo+PiAtIG5hbWU9ICJQb29sLWFyaW5jMCINCj4+IC0gc2NoZWQ9ImFyaW5jNjUzIg0K
Pj4gLSBjcHVzPVsiMiJdDQo+PiANCj4+IFtEb21haW4gY29uZmlndXJhdGlvbiBmaWxlXQ0KPj4g
ZG9tMS5jZmcNCj4+IC0gdmNwdXMgPSAxDQo+PiAtIHBvb2wgPSAiUG9vbC1hcmluYzAiDQo+PiAN
Cj4+ICQgeGwgY3B1cG9vbC1jcHUtcmVtb3ZlIFBvb2wtMCAyDQo+PiAkIHhsIGNwdXBvb2wtY3Jl
YXRlIC1mIGNwdXBvb2xfYXJpbmMwLmNmZyAkIHhsIGNyZWF0ZSBkb20xLmNmZyAkIA0KPj4gYTY1
M19zY2hlZCAtUCBQb29sLWFyaW5jMCBkb20xOjEwMA0KPj4gDQo+PiAqKiBXYWl0IGZvciBET00x
IHRvIGNvbXBsZXRlIGJvb3QuKioNCj4+IA0KPj4gJCB4bCBzaHV0ZG93biBkb20xDQo+PiANCj4+
IFt4ZW4gbG9nXSByb290QGJvZWluZy1saW51eC1yZWY6fiMgeGwgc2h1dGRvd24gZG9tMSBTaHV0
dGluZyBkb3duIA0KPj4gZG9tYWluIDEgcm9vdEBib2VpbmctbGludXgtcmVmOn4jIChYRU4pIEFz
c2VydGlvbiAnIWluX2lycSgpICYmDQo+PiAobG9jYWxfaXJxX2lzX2VuYWJsZWQoKSB8fCBudW1f
b25saW5lX2NwdXMoKSA8PSAxKScgZmFpbGVkIGF0DQo+PiBjb21tb24veG1hbGxvY190bHNmLmM6
NzE0IChYRU4pIC0tLS1bIFhlbi00LjE5LjEtcHJlICBhcm02NCAgZGVidWc9eSANCj4+IFRhaW50
ZWQ6IEkgICAgICBdLS0tLSAoWEVOKSBDUFU6ICAgIDIgKFhFTikgUEM6ICAgICAwMDAwMGEwMDAw
MjJkMmIwDQo+PiB4ZnJlZSsweDEzMC8weDFhNCAoWEVOKSBMUjogICAgIDAwMDAwYTAwMDAyMmQy
YTQgKFhFTikgU1A6ICAgIA0KPj4gMDAwMDgwMDBmZmY3N2I1MCAoWEVOKSBDUFNSOiAgIDAwMDAw
MDAwMjAwMDAyYzkgTU9ERTo2NC1iaXQgRUwyaA0KPj4gKEh5cGVydmlzb3IsIGhhbmRsZXIpIC4u
LiAoWEVOKSBYZW4gY2FsbCB0cmFjZTogKFhFTikgICANCj4+IFs8MDAwMDBhMDAwMDIyZDJiMD5d
IHhmcmVlKzB4MTMwLzB4MWE0IChQQykgKFhFTikgICANCj4+IFs8MDAwMDBhMDAwMDIyZDJhND5d
IHhmcmVlKzB4MTI0LzB4MWE0IChMUikgKFhFTikgICANCj4+IFs8MDAwMDBhMDAwMDIzMjFmMD5d
IGFyaW5jNjUzLmMjYTY1M3NjaGVkX2ZyZWVfdWRhdGErMHg1MC8weGM0IChYRU4pICAgDQo+PiBb
PDAwMDAwYTAwMDAyNDFiYzA+XSBjb3JlLmMjc2NoZWRfbW92ZV9kb21haW5fY2xlYW51cCsweDVj
LzB4ODAgKFhFTikgIA0KPj4gIFs8MDAwMDBhMDAwMDI0NTMyOD5dIHNjaGVkX21vdmVfZG9tYWlu
KzB4NjljLzB4NzBjIChYRU4pICAgDQo+PiBbPDAwMDAwYTAwMDAyMmY4NDA+XSBjcHVwb29sLmMj
Y3B1cG9vbF9tb3ZlX2RvbWFpbl9sb2NrZWQrMHgzOC8weDcwDQo+PiAoWEVOKSAgICBbPDAwMDAw
YTAwMDAyMzBmMjA+XSBjcHVwb29sX21vdmVfZG9tYWluKzB4MzQvMHg1NCAoWEVOKSAgIA0KPj4g
WzwwMDAwMGEwMDAwMjA2YzQwPl0gZG9tYWluX2tpbGwrMHhjMC8weDE1YyAoWEVOKSAgIA0KPj4g
WzwwMDAwMGEwMDAwMjJlMGQ0Pl0gZG9fZG9tY3RsKzB4OTA0LzB4MTJlYyAoWEVOKSAgIA0KPj4g
WzwwMDAwMGEwMDAwMjc3YTFjPl0gdHJhcHMuYyNkb190cmFwX2h5cGVyY2FsbCsweDFmNC8weDI4
OCAoWEVOKSAgIA0KPj4gWzwwMDAwMGEwMDAwMjc5MDE4Pl0gZG9fdHJhcF9ndWVzdF9zeW5jKzB4
NDQ4LzB4NjNjIChYRU4pICAgDQo+PiBbPDAwMDAwYTAwMDAyNjJjODA+XSBlbnRyeS5vI2d1ZXN0
X3N5bmNfc2xvd3BhdGgrMHhhOC8weGQ4IChYRU4pIA0KPj4gKFhFTikNCj4+IChYRU4pICoqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKiogKFhFTikgUGFuaWMgb24gQ1BVIDI6
DQo+PiAoWEVOKSBBc3NlcnRpb24gJyFpbl9pcnEoKSAmJiAobG9jYWxfaXJxX2lzX2VuYWJsZWQo
KSB8fA0KPj4gbnVtX29ubGluZV9jcHVzKCkgPD0gMSknIGZhaWxlZCBhdCBjb21tb24veG1hbGxv
Y190bHNmLmM6NzE0IChYRU4pDQo+PiAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqDQo+PiANCj4+IEluIGNvbW1pdCAxOTA0OWY4ZCAoc2NoZWQ6IGZpeCBsb2NraW5nIGlu
IGE2NTNzY2hlZF9mcmVlX3ZkYXRhKCkpLCANCj4+IGxvY2tpbmcNCj4gd2FzIGludHJvZHVjZWQg
dG8gcHJldmVudCBhIHJhY2UgYWdhaW5zdCB0aGUgbGlzdCBtYW5pcHVsYXRpb24gYnV0IA0KPiBs
ZWFkcyB0byBhc3NlcnRpb24gZmFpbHVyZSB3aGVuIHRoZSBBUklOQyA2NTMgZG9tYWluIGlzIHNo
dXRkb3duLg0KPj4gDQo+PiBJIHRoaW5rIHRoaXMgY2FuIGJlIGZpeGVkIGJ5IGNhbGxpbmcgeGZy
ZWUoKSBhZnRlcg0KPj4gc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgpIGFzIHNob3duIGJlbG93Lg0K
Pj4gDQo+PiB4ZW4vY29tbW9uL3NjaGVkL2FyaW5jNjUzLmMgfCAzICsrLQ0KPj4gICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pIGRpZmYgLS1naXQgDQo+PiBh
L3hlbi9jb21tb24vc2NoZWQvYXJpbmM2NTMuYyBiL3hlbi9jb21tb24vc2NoZWQvYXJpbmM2NTMu
YyBpbmRleCANCj4+IDdiZjI4ODI2NGMuLjE2MTVmMWJjNDYgMTAwNjQ0DQo+PiAtLS0gYS94ZW4v
Y29tbW9uL3NjaGVkL2FyaW5jNjUzLmMNCj4+ICsrKyBiL3hlbi9jb21tb24vc2NoZWQvYXJpbmM2
NTMuYw0KPj4gQEAgLTQ2MywxMCArNDYzLDExIEBAIGE2NTNzY2hlZF9mcmVlX3VkYXRhKGNvbnN0
IHN0cnVjdCBzY2hlZHVsZXIgDQo+PiAqb3BzLA0KPiB2b2lkICpwcml2KQ0KPj4gICAgICAgaWYg
KCAhaXNfaWRsZV91bml0KGF2LT51bml0KSApDQo+PiAgICAgICAgICAgbGlzdF9kZWwoJmF2LT5s
aXN0KTsNCj4+IC0gICAgeGZyZWUoYXYpOw0KPj4gICAgICAgdXBkYXRlX3NjaGVkdWxlX3VuaXRz
KG9wcyk7DQo+PiAgICAgICANCj4+ICAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnNjaGVk
X3ByaXYtPmxvY2ssIGZsYWdzKTsNCj4+ICsNCj4+ICsgICAgeGZyZWUoYXYpOw0KPj4gICB9DQo+
PiBDYW4gSSBoZWFyIHlvdXIgb3BpbmlvbiBvbiB0aGlzPw0KPiANCj4gWWVzLCB0aGlzIHNlZW1z
IHRoZSByaWdodCB3YXkgdG8gZml4IHRoZSBpc3N1ZS4NCj4gDQo+IENvdWxkIHlvdSBwbGVhc2Ug
c2VuZCBhIHByb3BlciBwYXRjaCAocGxlYXNlIGhhdmUgYSBsb29rIGF0IFsxXSBpbiANCj4gY2Fz
ZSB5b3UgYXJlIHVuc3VyZSBob3cgYSBwcm9wZXIgcGF0Y2ggc2hvdWxkIGxvb2sgbGlrZSk/DQo+
IA0KPiBKdWVyZ2VuDQo+IA0KPiBbMV0NCj4gaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIv
P3A9eGVuLmdpdDthPWJsb2I7Zj1kb2NzL3Byb2Nlc3Mvc2VuZGluZw0KPiAtDQo+IHBhdGNoZXMu
cGFuZG9jDQoNClRoYW5rcyBmb3IgeW91ciBvcGluaW9uLiBMZXQgbWUgcmVhZCB0aHJvdWdoIHRo
ZSBsaW5rIGFuZCBzdWJtaXQgdGhlIHBhdGNoLg0KDQpSZWdhcmRzLA0KQW5kZXJzb24NCg0KDQo=

