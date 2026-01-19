Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD499D3ACC3
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jan 2026 15:50:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208178.1520421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhqaG-0003vL-0P; Mon, 19 Jan 2026 14:50:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208178.1520421; Mon, 19 Jan 2026 14:50:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhqaF-0003si-TJ; Mon, 19 Jan 2026 14:50:23 +0000
Received: by outflank-mailman (input) for mailman id 1208178;
 Mon, 19 Jan 2026 14:50:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9b5m=7Y=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vhqaE-0002nZ-2B
 for xen-devel@lists.xenproject.org; Mon, 19 Jan 2026 14:50:22 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d208132-f546-11f0-b15e-2bf370ae4941;
 Mon, 19 Jan 2026 15:50:21 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by IA1PR03MB8090.namprd03.prod.outlook.com (2603:10b6:208:594::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 14:50:18 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 14:50:17 +0000
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
X-Inumbo-ID: 2d208132-f546-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iial/55kvX3iqcNy6X2B5haAeG/dSYTVUhO8z3MwXv8/2rxTmjKhV5qIjbyZ0ZGAUqocH4knG3uDgGhKZh5Sb6Hlbjy0xgiq3jKy4Rcsey9xuKRHGzJ0/Njp81zKl5qYUo/1hX7TIXqWVLp35JBddNrvRSPbV7nmY9UISI6x7pRVDhJxCg+J0ZiuQt0E6q5WwzNplTSCx0hEzLgnx969w85rj6meCAJOPOfQKYMAVrO4V8DnOUy5mf86ankbHbu2CS8OfnHeuVdqwRI6+tQphpLo0xaAXvoDPyGd2OXlNkw1AB2QYucLoSMbo8zQpVwYjtETe6iGi/8ogzQCUZzPhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Fs/v6FMEFoHGhIoGW+MRaIfJSOLH2/2aN0qF1qYgRI=;
 b=t4Xy4Fz/tZFU/xmS4GMOp+SbJ3PTCbDbduZr4WUFskv935/NQSp8g3oFmULs+rM930PIb7yBdZW+ozVsqkAUuAYmhtdWPNq8tqoWAie1RYUdJaqkiFEyc3S3FYx4JRFWc/b9iYvcHA2nBotSvvVj96ef1soa+iqH3IK4bSdDlijE4UeQM/EP22texJ0ZQFK/2AgmWg2sN2HFd7iGr2LlnmnIN2xeniE3QJeQCo0SAbSsMnVHwlNmaRK5pAs9uQlISXHJFEh8UkPoe6Viro+B5BM4CFk7Dws7/ltB24jTL6b5NlO+Id1TUD1R7pVD7EbCjBENI819BErzZwz1OHWMcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Fs/v6FMEFoHGhIoGW+MRaIfJSOLH2/2aN0qF1qYgRI=;
 b=VtATmX4Ny9tdxZ0EDkqiwhsrTm8HjuTpc2yrEATZtOnHAETtKmz60BdLBWUWN6QPwXOgXU+C38aUTphQTZ4HADz6qMfVxALo9RRaE/W2xMUcXgwlPZONYX4MNj+RvpZff7EXlvRuMItD0cxUXH/bSVUGoSHvyFiAgIbsz/T1lfg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <791d4bfb-7203-4d7b-ad32-657b70b03150@citrix.com>
Date: Mon, 19 Jan 2026 14:50:13 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Luca.Fancellu@arm.com,
 Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>,
 Hari Limaye <hari.limaye@arm.com>
Subject: Re: [PATCH] arm/mpu: implement setup_virt_paging for MPU system
To: Harry Ramsey <harry.ramsey@arm.com>, xen-devel@lists.xenproject.org
References: <20260119105022.3616126-1-harry.ramsey@arm.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260119105022.3616126-1-harry.ramsey@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0274.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|IA1PR03MB8090:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f533e66-a603-419b-e93a-08de576a0fcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NzZpNmx4NXFTbW1EVVc3YjJaM2xTRjZUWXQwd0JCc2VzRDgwMno1aDlzMnVY?=
 =?utf-8?B?UDRreXRNTitYdHFkVjVQbVNaTjV0YXdKYmx2S0hXaS9lUzJUdzNUcTBvbTcx?=
 =?utf-8?B?VVFjZmtOYmp3cVlLK1JpVXdMSE00YzhGdDR5RnlBcTJCYm5aMnJMVkJGL0VU?=
 =?utf-8?B?d2dkNmhzcUV1UGczSXRXV1k0Nk9lZTJSeHBiYW1XR0FwbWNxcHlTeTNEdXRi?=
 =?utf-8?B?V3lpWGVheC9XQlJCMWZDcjE4ZHQyV250WVljS2RIUVJQOHBVMDEvSllRc3VR?=
 =?utf-8?B?YmdTUUFXSHMzTnozZ0JzWWhSUjVwa3hPQWk1UWdoaDNTSzJQdDl0ek40RU1E?=
 =?utf-8?B?bGdLQWxZTnpvSmN5VnBMWmFKcHJ5ZG5ZaFpNaitOZEE3UjhZOGIrd2JKalJt?=
 =?utf-8?B?ZkYwQmJNMzhSQjR5ZFo0a1dGMnQvY3VhaGR1N3lFbldXS0tTVTE2QW51ZHVs?=
 =?utf-8?B?Ni93RmwxNXhraFRkMUVNRkZ4QXpSWVNSVVlBdzByS3Z3b2dzTjlSZUJVWE1E?=
 =?utf-8?B?YUlPQm93UVJKY0Yxa0dFcmJBejZQdEFwRGVSNVMrOFZqeFJhT1JhVGxSc0hU?=
 =?utf-8?B?dklNazY4enZBQ29mcjlESEhYOC9KcXhCM3ArNTVhVmpnN1dVdGhtQTQwRktI?=
 =?utf-8?B?OW9XMVNLd3h5MnM3UkNtVmJHN1c0WHpLZ3RFclJZcjExVCt5TGZBQkhwcElL?=
 =?utf-8?B?a3lrbzQ4SEtHU01iV3BxYWdydlpZZFNvenRIU1RPTHVFZUJ2bzhOZFVOSHVk?=
 =?utf-8?B?RGY5OGZkTkNaS3JJQkxmVHNIazdxM0lpMDdjb3FzRTJrK0ZxYk44ckpxV25K?=
 =?utf-8?B?dTduZHF5MjZGYzExYzFPKzdDU0QrVXRzOTd3WWZqRFh6OGhvTms4QVlybG5U?=
 =?utf-8?B?OUF4RDNXN3REQlZpZG1sSjlJeVd3dGlKUmhyL1hwR1FMTVBtWUZZNFRDdWcy?=
 =?utf-8?B?OE1rK2huSUdjaGtKcFIxSnlSaFNBVEdTTTd0Qkh5Y21PdWV1ZnNsMWhjWGlp?=
 =?utf-8?B?QUNWS042d25HU3VxQ2VTYzEvM2RGWjZYQ0d6N3pWRHlmNTNjMFh0eW1YMTY0?=
 =?utf-8?B?YmZzV2RPcXhhVDUzTlhMR0tlV1l3dFZkVDRLMnpEL0hiT3dpaTcrNjN3ZHAw?=
 =?utf-8?B?b0F2ZkVJWDB3aTBLRjdXWVFScm9oVTQwQW9BNW9zUlFUQkJ1b1RXL052Tjcz?=
 =?utf-8?B?SUU5NG1aeFJVaFBFWHkxZXkzRzZlc1ZEdjY3eDRMM0hLcUs0Z3o0a3JXWndw?=
 =?utf-8?B?b0hCMkkzdDNMengzNkVaa21VaSt6MFJIUUNkdHZ1MGRGb0dEM2ZJb3lyZnd5?=
 =?utf-8?B?RjlydWxqQytJUksxMnRGTWNlcDBaWTFyYzF0NGhJV2RLYnN6WmFPdmNNRjhu?=
 =?utf-8?B?MzBlRk84SEZ4UlFrSUNod0pxYWRzb0NRZnQ1TkxOemltOGpMVkpCQmhMWkpx?=
 =?utf-8?B?L1pTd0hLYlp2aU12cnNqMmJKcEdRY3hMQVZEbi9leFZsREhBMGJPY0huU01j?=
 =?utf-8?B?bDN1cHgvbmY3cmk4bU1jUzB4Rmd4TkR2L3hGQnB1NFJkaDREMk84NVlMTVRX?=
 =?utf-8?B?TmE2UTVrWXJLRkFaSVdBZ1A1RFRyMk5VTm1UOUIwZGNmZGhxWDJmRlpTUmI2?=
 =?utf-8?B?dUwrT1RBQ2FzaVI0c1YxSkNFRVJLWit0Q3h1RFZHd01MYlA5TkwyOWgzNkpa?=
 =?utf-8?B?Nnkrb1NYWURpUXZrbTBRdkJEYm5JYWVENWNCTVpqa3cxT0JseDRmR3F3Wm9G?=
 =?utf-8?B?REllWG9IMDgwblR4bnp2aU1UL0hEZVdkdjFDb0UwaWZZMk5oWVd6VzlncXgx?=
 =?utf-8?B?NkhLSTBlTkU4bVFsSTNaOFFkVmovcktaWXRmOHkyRmJ6SXhqK2ZvNDM1VU9D?=
 =?utf-8?B?emlrVWlydjEwaHltOVlqUUE0cW9QUmovRnVFbDN1Ukh5dUc4czI2bzJLQ2Zz?=
 =?utf-8?B?eGJ1cXNiMnBmd0JnZmVUMlg3QWo4Q2g1ZzVDUm1UcVJsNTU4enkyNnA5dTJ6?=
 =?utf-8?B?VHZlb2U2NGtvLytEcmREU2p4NjUvR1BUbEhzQUp2YWFwS2hKNHhBRjBqZWM2?=
 =?utf-8?B?SFVTMjRnUWZKeGh6S2dYSzBWaFVBWjU0QXpBRnFYUVo4Zm9VUFlHU0JKTlpC?=
 =?utf-8?Q?icW8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFVWeWQ3djFuSGI3aVplMHZrTnJtb1dhYzZqRVUwZUJleVZ2M0c3ZnhNZkJM?=
 =?utf-8?B?OTloV1ZndEdoTCtZWll3S2tmeEhzN2VSQmJtVFhMc3pIc1N6R1VibXlyRHRQ?=
 =?utf-8?B?S2FsRGRnTjg1YlBTMFJLUktDT0wydGtEK09vai90UnhOcnh1K2hBdElZNlg3?=
 =?utf-8?B?S0l1dm1zQUtPYXhsVzU5Z0lNblZkYnhkK0dLa2hYVlRNdVA4b0hTZURhajZm?=
 =?utf-8?B?TU1ONGUxZTJOS0hXSG0zQ2NJSjFHaHI4Y3BTeFltZDZUVnBLeUJQbk5aS08w?=
 =?utf-8?B?b0lXVm5vT3hjZUszdG5lcU54enhONFhpdmZqTTNVeU5FMVZIWWlCSkVGSWRM?=
 =?utf-8?B?UUM2YVUyV1VaUXNvU0tQZTNNU1Bnc2FQMENOcmZpc1h4emdxbmtwQThHVlZr?=
 =?utf-8?B?ZDB5TlNxRDhTQXEzZXpsUWp1Q2pXZ1RHZ0pONlMzYlgrcC8vWTZjS2xnRGV2?=
 =?utf-8?B?NGZySEpVRzJVUndsU3gwRnJwTVBGQTJlcDRpVFlmTmxPREtpQ01YL1NoM05I?=
 =?utf-8?B?d1JkcllzVXRJK3VTVUhTcHVPeXl0SnVPZ3l3QWVMZElRTndxU3dGS3hiYTg5?=
 =?utf-8?B?WmRRazc3a3o2OVRqaWh2NU1QS1R0ZlRnSEdsSjI3QXFhMkhpbUVBVW1pRGF1?=
 =?utf-8?B?cVZvRklnTU04ZElIQTJ3QmpadldrR1NzbnFSS2N3NkhteTFOa2Z2K243dHlY?=
 =?utf-8?B?MWJwaTJPaUFNNnhTRDVhQ2JiUXJCbU5adHZncE1jSEtTdThKTTVzbWhabEJZ?=
 =?utf-8?B?SldLN09BNlNmQ3hrZDJrTW85djY4dzF3REthczQyaHFlVjJZRzBOdkR2KzIr?=
 =?utf-8?B?RWVmMXJIUW1MZWw5YjZNZWZPb25hMCtFNnBidTZxcFlCQU94bXVtSTJBaU01?=
 =?utf-8?B?L0R4RzRoMjlCdGhLdWdHbzR4bWR0QXJhcGcvaWRCSllhMXRHcUdPNC81ZW0r?=
 =?utf-8?B?Uk1hcUFuQ09BQkJlN040enE2aTRaNTFDTE84NThTWWpwUkFKRmpramV0U1dB?=
 =?utf-8?B?UWNNekJJWVl2dWp2Y2toSlh6YXdmaE1TajFhVUN2YXorV0ZiSVZUSmd3cFlB?=
 =?utf-8?B?MUhERC9KUDJQbElRU2dISjR5K0JVTmcwc2NjVGhJTFFDZzJjazNqeEFtamt0?=
 =?utf-8?B?U25PK0dBRFBYelRhbmQ4QmZ6VnRLOEZxdVNVcVgwL2ZLODB5eGtXWU8xVzdk?=
 =?utf-8?B?amNjOGwwL1Rsck5yajViaHVmemQ0VUhhYXliRkpNdUJueHFSV1ZCVzlORkdk?=
 =?utf-8?B?R20vRXlyWFlyV0hzeFNKZTlnUmt3enJOMCtGeGRoOXRobTNwUCtYS3hzZm5E?=
 =?utf-8?B?OXRmNE82Y1JmaGVhQklYS29LeWpYV3BJUDM0WGVOTy9leTJMbmNZM3V5YSt0?=
 =?utf-8?B?L3kzUk96R1ZQYlorZ3kwU09SOFBKWGFXRnRqeENqanFLeHU2NkRmUXVFRUNN?=
 =?utf-8?B?cWIrcEZJdklqRWl5VmZUY0pEOHpYZjZMaHJUb01qZW8wV0o4cVI0Z1JXdnRS?=
 =?utf-8?B?b0prbUpKdjNsbnNQVCtFS1dsdEtoVHRReTlvUzBoTmlTbEZDYUhxZnRzanNm?=
 =?utf-8?B?TWZ6dURuYU5NMm5USHNCV1hyNHNrTVVQdmNNbFE2OFVZWHViYit3VXl2RWZq?=
 =?utf-8?B?bjVaUXlrWUwzMFpvL2FjdjJjbVdZZDJWc05mcjg5Z2VWR2IzSGFiTXhPS0lE?=
 =?utf-8?B?NTZKK0p5Z2t5WlJadEQwb2thRjJZem5JWFJYZTVvbDdxNkpoVWVQQ1JLeGtY?=
 =?utf-8?B?RlF5eDBld2N6b21RUWd2NjJ1R0ZxaTFxYlF6OG1pSnYrbk9vcGNoRERZK0dP?=
 =?utf-8?B?TVpyNUZaM096RVRZS296UXJwd0FnK0FQNHZ3YWJCaUs2MlVSdjhINHFsZXl0?=
 =?utf-8?B?aVBPMFoxWFl1eldnWmR5K2NYMlRqRkhLeUFGZk5odjQvR2dzMEh1Tms0eFpE?=
 =?utf-8?B?VExpcjhsSDhUcGM4VTByWm9uQ2YxL05qY2ptL3EvMW9mN0twcWovL20zTDR3?=
 =?utf-8?B?L0p1RW5XN1o2S0M5eUtlNzNJU2Y3V2xrWDNjelZVWTYybWJvRFFRV0F3WEt4?=
 =?utf-8?B?bmJZQTJBMmNBb1p3U3VCd2JITnhybjFLb3FWa21PUHJuNGlFODZHb29td2Vn?=
 =?utf-8?B?MU5wR1F6Rzd3YXh1VG9KMmJFWFRFSVRaUGVudkxFQ0RtT2wzdUVOQ3FVOUwx?=
 =?utf-8?B?eDBJUE9ycm93dlpNRGthWFAvdWNLQTZHWWNrVDVIVkdGZmVuQ1RwdUF6YkIy?=
 =?utf-8?B?eWM4dENpakJxNk1sdTFLMVRWaTdmMWpScXJvS1llczBXLzR0R29SODcrbFo3?=
 =?utf-8?B?MnhRUzJBY0dpMjNQV0N2SEVlclBrL3dyWXZGRy91Vzk0ZFlFYTVtdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f533e66-a603-419b-e93a-08de576a0fcd
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 14:50:17.8064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cOO5lAA6ldows1cBD0Yb0YNKrgQjx5QsLXqtje/r3zgWcAEFTAAjyxatJuH4GoGT4v6fJmu1Z0q2w3lTNXtN7N+v4a4at1NcQf49Srvtqc0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR03MB8090

On 19/01/2026 10:50 am, Harry Ramsey wrote:
> diff --git a/xen/arch/arm/include/asm/mpu.h
> b/xen/arch/arm/include/asm/mpu.h
> index 72fa5b00b8..55011e3d96 100644
> --- a/xen/arch/arm/include/asm/mpu.h
> +++ b/xen/arch/arm/include/asm/mpu.h
> @@ -87,7 +87,12 @@ static inline bool region_is_valid(const pr_t *pr)
>      return pr->prlar.reg.en;
>  }
>  
> -#endif /* __ASSEMBLER__ */
> +static inline register_t generate_vsctlr(uint16_t vmid)
> +{
> + return ((register_t)vmid << VSCTLR_VMID_SHIFT);
> +}
> +
> +#endif /* __ASSEMBLY__ */
>  
>  #endif /* __ARM_MPU_H__ */
>  

You've got a rebasing error here.  __ASSEMBLY__ doesn't exist any more.

~Andrew

