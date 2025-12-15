Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9252FCBF80F
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 20:15:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187550.1508917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVE26-0006MW-9M; Mon, 15 Dec 2025 19:14:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187550.1508917; Mon, 15 Dec 2025 19:14:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVE26-0006L2-5P; Mon, 15 Dec 2025 19:14:58 +0000
Received: by outflank-mailman (input) for mailman id 1187550;
 Mon, 15 Dec 2025 19:14:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6GmU=6V=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1vVE25-0006Kw-Dh
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 19:14:57 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54c9d847-d9ea-11f0-b15b-2bf370ae4941;
 Mon, 15 Dec 2025 20:14:55 +0100 (CET)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BFJC7JH2885738; Mon, 15 Dec 2025 19:14:33 GMT
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b1015tm4v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Dec 2025 19:14:32 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 5BFHWgZk024823; Mon, 15 Dec 2025 19:14:32 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com
 (mail-northcentralusazon11012041.outbound.protection.outlook.com
 [40.107.200.41])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 4b0xk9af25-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Dec 2025 19:14:32 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by CH3PR10MB7808.namprd10.prod.outlook.com (2603:10b6:610:1ba::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 19:14:29 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::312:449b:788f:ae0e]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::312:449b:788f:ae0e%6]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 19:14:29 +0000
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
X-Inumbo-ID: 54c9d847-d9ea-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Vjb5lhhVrSYvN17SAYzLSKWeOVy4KIGYjZGrKUtjRhY=; b=
	BFi/98btISljahesY6J7e/l1gFc/HZMN4XYE5DMf58aa4iMHuYsmBPT6Wb1xyFdX
	iHQ6XKB6B+qeVVT5HuTK/pEEzOnfIjMGK1caLU5O5d1dvXCgaDXsg71DiRWux8A6
	iDzlv7r+E98hhV0MPzCibtnGgQ10Bim7rKvqGqtYsAr2CEHDazi7GtY+bh9yCup/
	EY1I3oSK4ryPZIgcmv9PIHIvaWEEbO98poFMojzro535+yF86CGH10LieeSv2UKz
	fJKNM9LqvacDikMn1YQ3ycpPZmfVpbI+bR74jVbnmLGbiEWyyVMjHeZ9CZDlxY71
	KfaTmveCuF4QUFkN1xAF8A==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yig/kDIHDBweHrJvekw1kA3l+XfLQoJx3MAUPK1FpJjoynKwlAOcTZKe0EiadMd0OEcPxDs6Gh61cq7RE4c/WTPlH7370Zbf4Ut3UFbUc9VoUTmjDbGc2oTuiAyYnIezdVCv87XU56fZei2SpNb9J6p6K+PP0uNwqxsEGGYj41WrUAB83uJ3pWAN5naJvitE2aoD4CNLHitbG3O99SFohs/SBlcDNJ1QQiGQHdUoLhahDF1q1uCyzb/LsaKotRpw8JalLAs1DHYDxXRUIBOs4JlIE+BaLM1qYCT+0OdQqAG6IY3KfY0koj8FXQLjTOuwNWdOvro0uvS2Hub6O58seA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vjb5lhhVrSYvN17SAYzLSKWeOVy4KIGYjZGrKUtjRhY=;
 b=Yf8TnNRAw0t+fSs06pnXS5d4nYpgy5pdGrMYAZzGjCDvtNkaD6pR3biFnwSXJ9FP9uUm27f34nJsNpVV2imqDXv/r6eSCJszzB2lTxJxYV/D8mUDIm8/ujZNjKnw92K/aypdS1Jx0RiPL9Rdq1EUFn1RLgonNy5SCU8F56ldDo9Und+WXw10yCv3XkbUBv9XvNOkxrGAHoNnTNPlvBlyChgNnBIliN73c3ujv+iDc699FEMwn7HfVy5yEqJnwF3wzrghgPRavjmTVt3uT+MbOpUaU4Aejl6+VxBc6VCeiRtyxgCoY/bZlD0fzNy16F9k9mEefLH9iomLWgqpK+tHGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vjb5lhhVrSYvN17SAYzLSKWeOVy4KIGYjZGrKUtjRhY=;
 b=YCwgKt/PzGmg+bIqIsarI3vr77yebjbKmnMFSQyCPHwR5I5+gCixNzPfrdrmHFvOukuA7N0YT1w5zajrvKkZYxEJ7suv4Lf0JNGcVxubBYWeRhApE25pJQYmyjUuyBfw1Qv2Ipt4Zaj9F4y8ahUfuyLbWTKL58kiJJLgvSEl3L0=
Message-ID: <4c295607-909e-4a7e-abde-60a71c88702e@oracle.com>
Date: Mon, 15 Dec 2025 14:14:25 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/21] x86/xen: Drop xen_cpu_ops
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
        x86@kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, xen-devel@lists.xenproject.org
References: <20251127070844.21919-1-jgross@suse.com>
 <20251127070844.21919-17-jgross@suse.com>
Content-Language: en-US
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <20251127070844.21919-17-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::10) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5009:EE_|CH3PR10MB7808:EE_
X-MS-Office365-Filtering-Correlation-Id: cda93cc0-f5e9-43f5-9172-08de3c0e2bcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R1VJR3dQTXNnbVNiUGZ5MUcyelBLSGJqSHI2WnpjamtKM1BYZS9uYlg5bmRj?=
 =?utf-8?B?NDh1THoyQ2VZVHo3TVYvb2lReTVuSUFvNW9UblAwbDJFQ3R0SVBmV1MxSjFG?=
 =?utf-8?B?TFpUM0Erd1pTejZ5ajhSSDFicjFkQVVxV3hHZnVwTm8zUWFMSzJBcnpDMzJr?=
 =?utf-8?B?TEpRWUVhUmpuQUJ2QzZpWFlCUDBMMG5US2F1RDcvKzhxbEQxbVZFRGJ5akhh?=
 =?utf-8?B?V1Q5MWc4YnZoNlUzZitXV2NvNzI0czFDemNiZ3IxVkJJV1YxMUo4UlJhT25T?=
 =?utf-8?B?S3F1a2k1b3ZRa2hOQ2NRTkJKeFd1T0VxZjFJYlVrQzNqcldGKzdRNmNxS2U3?=
 =?utf-8?B?SVRnOTN5ZTZYbmxIWG55cXZhWnVScldPY3MyWUNoK1F4VWZudGlzNUFTUTZo?=
 =?utf-8?B?ZloxMHFHcE43dVBhSmdaN0doRExkcVdJdzFUNWIzb0JFNVpUdi9ud21zTE5D?=
 =?utf-8?B?YityaTBGdFdHb0ZKWklWTlNtcHZ4NnNic2RpK25QWWRxa1N3Vm9MRjRKMmdw?=
 =?utf-8?B?U0N1QnNzOVltbllzZDlQdS9GRCtOa0VzK2tmY3N2L1dRTEpCaUpvdjh3NGVV?=
 =?utf-8?B?SnRkNFhtUGhqTzVqMXJnbzc0SG5ualZjb1dQbU9mOEREUi9JanlneHpZbnoz?=
 =?utf-8?B?OHJPSmQ3cHZmd1NLZ2NSalQrWjQraE8yYVN3ZnhBNG43dUx1eXJyWEVGVmoz?=
 =?utf-8?B?aHF5a2MzR0Q4QjlzZGMwL29xWVNIRjZQRTVUKzJ3MXFZOHR1eGx5Z0hHUHEv?=
 =?utf-8?B?SUhxV2txcnByTjdsNXM4R0Y5Y2Q0a2ZrSXBjSGVPNEZzVUtLV2Nlc1YwNXVt?=
 =?utf-8?B?YnlEWDBuL2krMHNEMnBBY016aytuaS9rOERjYnZCTmJ6c3ZWamhjZVBiTUtS?=
 =?utf-8?B?Q1NmdXNhSU5FaXFIamJyMVUyd0E4VXZRODl4Y2VSN3NvZDNQZzA4bGxJQjlM?=
 =?utf-8?B?SkVBTk9ndk9hTVR6U0lOR0lNMXJXdGgweGVuYnB4Zm1sNlhkNTErbG5saVlw?=
 =?utf-8?B?Z1ZqUXFabXFzUFlidTZNZkVvRm9Lc3dXUHFtV05LOVQ1b2ZXWTZjcERpTDF5?=
 =?utf-8?B?cURXS0JSVlRYRXNiaWpuSVdhblQ1RXViRUlDbG9QUFlLVzJzTnBIQklMSzZn?=
 =?utf-8?B?cWxoM0Y5TUNleWJxaUJNUS9HcXVhVjF4eHpSUElvY2dMdFZWL1ZtRzcyQW4x?=
 =?utf-8?B?cHNJd2tSc0dQdkwySzJUZGtPby94TU1XVktYTkpnbklmV1VaRkRyUzdTMU9l?=
 =?utf-8?B?bE9kL2R3dlVwNXZuR3dsTEYzaVhNV1Bta1drbUtmNlZzQ0VSL0JUcFdrK1dU?=
 =?utf-8?B?UStxemtZbG5RenA2UDdOalh4T3RjUnA3VkNLTU1xSUJWOHhIMlNKdnkweE4z?=
 =?utf-8?B?YTB4eHN5dHBEbGsrMzN3ZEsrakxGc3hmYlcxekIvWDdxRnZzeTNnYmxQV2g4?=
 =?utf-8?B?TVplUjZTamlXN29FVWxITnVZMmZGWlVtZ2hJbmZpY2pzRFZGRVFVTkFWNERO?=
 =?utf-8?B?dk9oMkNENVZSWkNCdTJkZUoxbXlScURXREFsZklnb2tENTdSNTRHa2FBTnpT?=
 =?utf-8?B?V0sxaGwzd2QyUkNzcHJnbno0MnVSZUNqUEJNVU0rUlBhcXVwRnU3a0V6eHNz?=
 =?utf-8?B?Sk15TWRYbHk1N1pyci8vanpUZkp5ekNsMnk1MHdZcXNJQmZ2bE9POGp4clZw?=
 =?utf-8?B?S0NXclU0dlNqSzZXZExvY2xFTFNGa0ZCajlReHFLWC93ZE1Zbk9nUHIwTGpB?=
 =?utf-8?B?VDYybXdYOCsyQmVFRG5hU2lnM2ViaklYZGxZV3NOVXdKeVdkZXlvWUdzS2RR?=
 =?utf-8?B?RzdkMjB4T2VxZUZJWXgvQkxTOEVHQSt3WklpRVFOTVRFUjVHKzJYNjVuTnJ4?=
 =?utf-8?B?Q0hVaUFMTFIyekdLcmIwcDJObHBzN3BvWlJxL3BkdnBESGdvRXYyUmtqNHpn?=
 =?utf-8?Q?MfVktfPm9AOCpZ5AU0Jsslhgm7Sfi1vp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlBzcUY5aDgyYXY4OVpPUzZrZVl2aEhaSEUxMW5zakVkblNzdURvcWRKSGJR?=
 =?utf-8?B?T1ZTYjBDTzNGUmtOOFlvNW9vbElOaCtydGdpWmxQRmJjUFAzYnV3aDJyc3hL?=
 =?utf-8?B?THBYMUpEbWJEYW1qRWtFNC82OE9JMjdRRUl2RFh5aDhUbUt0NXpJcFFXYVhG?=
 =?utf-8?B?aUJnTnhoY1RZU3hCRmM0dUV3RzIvUlp3WkhGZ3EvVTdVU052QTE4cFJGalIr?=
 =?utf-8?B?RXJxNDd4SjQzaWtwdUphamRRdmxVOWZXVXRiYlVKaFNqaW1TNHZHcng0My9T?=
 =?utf-8?B?Qkt1ME9BRGxNQnBNRUJMenp3QlAxcW5yUitpVzYzV2RQdWcydW5mengwbWlR?=
 =?utf-8?B?WlNQVmJMa0d5UXFMRG1xcDFNTnhYQlVWVmdzS3Y2ejhZYVpyckJnTFF4V3JR?=
 =?utf-8?B?TEtvUElxMm9xbS9sb3JtVFFEdmhhdnBnVEs4dklCSXNIS1dLTHJ2dSsrenc3?=
 =?utf-8?B?RFJVM3kwc2hyR3A2UHpGa3BFWFVMQ2tpWUNuWUdENU5UVFZhczVHSmJaSzIv?=
 =?utf-8?B?bWYrZTV4QUpnN3hTL3pCK3lDbkNuZFB3Sk9zdy9sa0o5QnMxbHoxdjJmeFEx?=
 =?utf-8?B?SndsSTFXWTdncW5PdW03aWJTNVFubWN4VmZZdlVFSytIY2RjNXlXRHVDKzds?=
 =?utf-8?B?ZW5wdVdzN3RJTlFIQ0YxQWgzSmlZamNPL2FUazM3NXBEQzJ5RnB3MzVuc1pa?=
 =?utf-8?B?QmFjN05OL25QTHU4VUYyUjBEbXZSTVRyM2ZTZnVKOUhvNjlqQS92VFk1MXNu?=
 =?utf-8?B?TlVPVnJ3T1lrcUxsWlRFY1JQVVhiMGFMSmxjUUFXbDBOakRYS0wrOFY0TElz?=
 =?utf-8?B?VWVBa0MwUmczQmRtNDc5TldMOFBrbzU1S2cxUS9iTmhhb3d0YzMyTm1KMGJr?=
 =?utf-8?B?MkkwdlFXS0JxLzREdVllT3UxTnI3TVV4VHBESWM3enJvaWJwVVVPeU9VTVNW?=
 =?utf-8?B?MVBjaGNCekVhVEQ5eDlNNlcyYktyODA5R0Nrb3ZPWktFNVo2M1dTS2ZNcXUz?=
 =?utf-8?B?YS9USHlxekhpaitidVY5TS83TEw3Z2JsUVM1MjBEYU52bWRZWERHNWpUY3g0?=
 =?utf-8?B?Y1J6bzh0WFppVDJRdmFYL05DMlFaUzBhak5TVUMvTzhqUzExdU9rL1ZsTDM0?=
 =?utf-8?B?U1NxQmlkdEdLRFBaOFVaQXlORnAwTVBQZ1lSaWpmSUJDOC9VdEQ2UzJiWmFx?=
 =?utf-8?B?R2hnMmN3TVVVUjhXQUZmS0E2T3dRRENGTldpaTREZk5ObDZmRE5PVm9xRnlY?=
 =?utf-8?B?RnJ4RElIQWtCV2hseFBXMnozMktRZUdya0xqYnJvRUFqelRmc2F5TEFoNkIz?=
 =?utf-8?B?eTdneFRxZ05FejhqU2wrcFppL3VQKzZRYVFWa2JKcFc1U1FVcU9qSmJDVlNT?=
 =?utf-8?B?YTJ4NU9EWnpBbGYvR3U3allRWkwvQnI4M3owVlpCTFlLa0VIT0gvcjc2QUtu?=
 =?utf-8?B?aWdlVDZOb2h5VkdWL1hxamFnMyszTzFscUVJZlBMaE5rcXZKZEVzUkJ6eWlI?=
 =?utf-8?B?ak1SaG1mU0hRdkhNaVZYN2NLWk9Ldi9IRFlSNUZxTDNuaVFuS1lBWmt5eUVD?=
 =?utf-8?B?OHphNldJc3ZsUDZzTU1XVCsvT0lGNjlLT2k2Y1Zwb1hWMXlqSGp3aGVMUDhy?=
 =?utf-8?B?VEVoTDdDcEtweTJBbit3cm5YSXlpbUhBSGRkZ1R3UFR0NzdtTXdRc3Erdm81?=
 =?utf-8?B?R0x5VUZsK1E3dTFqZzFmS3RuR0lXS1ZkSE85U3VZMnA2TFJvU2JFekt6akN5?=
 =?utf-8?B?Vk9PVXMxUXoyYXIya3pabVhUaExKM2NuMkxpZnhWZHFFTDBhYnRIbURhbkZE?=
 =?utf-8?B?Wm0wRTk1N0I1L3JwQkNPMU1oV1hBOFRWVmtVSlZ1RVd6V2dYZHlrS0pCV1h0?=
 =?utf-8?B?UUlSbEVjMWN5QzFLa2JpM2Q4YXh0bGJpWkNVSkZIQmQ2OHkzMXRSK003RzBW?=
 =?utf-8?B?K3IwdDZYOHc0RWtWb2dSbTAwYmdtaEdIWnQ3QXB1QWdhMC9jWDJoNnRITi82?=
 =?utf-8?B?NUg1R0QvcXlpdjV0RUI0b0pmRUJUVFFkZjVRTjV3b2UyS2hIN3ZYMVdOV2ZQ?=
 =?utf-8?B?OURWR2syaFZ2UHFIT0Uzc0tyV2ZmZDdsQTJzcjVrcjNIbHd6SlJ0NlRUZlpk?=
 =?utf-8?B?OURuRUJMdGg2UE5PZWtoVlRsQ0ZaMkNDM29RVnpZemJkZ3R0em9MZlFMeWUr?=
 =?utf-8?B?YUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7fYA+9dm/d+AcrfuNdF2OrGQ+Nm8e/MkSLJuijJjR1J6yvnK/s7yvQs6bIy4VzJgR+RBjUhzMDNHUcZat3W7DbeWHaRv2oNKlacAtKlT6ygKrDBoq4UH6TVndnfeYORs3xJc9hWDonETl6g53bCLxyNmJa0ymcKM8983zVPjRQ4iT+Ceh7sKFyPbQqDA8hseUoEgd44o8elNmFOvLdg6l7/LSDLHDRbTNn9NbkHTwmWpaAO9qaKGGLQHk91oMMbQKJQgwpFXuBi4ZkAOCtPqJ/ZV8gM5gH1hgQxMXYA4t+uxxz62DIl3kwaYnIuQ+jB3MjMrqXVXdELgOqfU6Xau53yzN76sqfHShJ2eNk19FJ84dMjwToKayX0SLGKTpwR/aQu6buixOFNHUnruf3gFlnTnC90jIa5xnkwHTCVJUYXxj+ywUGhsl7vqokIspzGgkTyAEYCescMJ3mrt693rAmSpghkVixDq54Tgvy0+k4p6VUTejEWj3TvwZ1stX1ECKA2tf1W5yeDqNP9NjCWayPiBSZVthK9sfN02zMDMKcWhIO2XmiY0ymepJw8O1zYQjWGQUtrE+zpupPDtELdXMYA2kD3warayLIN3BV8fJLA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cda93cc0-f5e9-43f5-9172-08de3c0e2bcc
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 19:14:29.6584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TbGwWgTW0wHp9eQD59pGvq8cVdfYD0r4L/WiF9TVixE/699BNrARsFubVKbwUwt4b79FCYY8ml6WnpAFkCRqAmdRfG18VXV0kQx4xPvPoNk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7808
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_04,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 spamscore=0
 bulkscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512150167
X-Proofpoint-GUID: F3uIxiesGuJExbanj64mEUtItBN9MDy5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDE2NiBTYWx0ZWRfX7iXNK/6O/4OC
 d03hbKNC3nwjpYr/0l0vzJr6/owPZCakaC7W32tOjydCOaKXRUUbvkpv/Re05VT6iMywtzQAnWV
 qmWa0VqEKVfXWgpBMugzVbDf3FBQlT+rhNBQs1bp9qNwcVwbs29yhLZutGDqUtJs+nruuMhCycu
 USiF8o8r+e1z5UlxidhTDjOawmKZsMsHMqkbQT3E9adAGuIihBLhHXn80gGrjptLmxwA5Izj7yE
 BRmukVKuFUamVgUAtWSwGwlvE0+Uqk9+xGDI1IKefkpKozfL2iJSTn3h0NJhk/qT1m8T++oaEjy
 6bm0uvXrcm40Vt7nBqmUVs8+x/a98djekpRxg6zS6c83s8DUNr0NpMTMQ9wzz+tYSho9094znsw
 3QFGj3/RnhDNksoOEUVmmd4aPWhypw==
X-Authority-Analysis: v=2.4 cv=GbUaXAXL c=1 sm=1 tr=0 ts=69405e18 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iox4zFpeAAAA:8 a=yPCof4ZbAAAA:8 a=AoAeTN9Xs-P516mdDt0A:9 a=QEXdDO2ut3YA:10
 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-ORIG-GUID: F3uIxiesGuJExbanj64mEUtItBN9MDy5


On 11/27/25 2:08 AM, Juergen Gross wrote:
> Instead of having a pre-filled array xen_cpu_ops for Xen PV paravirt
> functions, drop the array and assign each element individually.
>
> This is in preparation of reducing the paravirt include hell by
> splitting paravirt.h into multiple more fine grained header files,
> which will in turn require to split up the pv_ops vector as well.
> Dropping the pre-filled array makes life easier for objtool to
> detect missing initializers in multiple pv_ops_ arrays.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>


