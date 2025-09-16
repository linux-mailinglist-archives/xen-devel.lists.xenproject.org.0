Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0205B5A18D
	for <lists+xen-devel@lfdr.de>; Tue, 16 Sep 2025 21:36:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124817.1467013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uybSy-0004IV-3T; Tue, 16 Sep 2025 19:35:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124817.1467013; Tue, 16 Sep 2025 19:35:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uybSy-0004FY-0d; Tue, 16 Sep 2025 19:35:52 +0000
Received: by outflank-mailman (input) for mailman id 1124817;
 Tue, 16 Sep 2025 19:35:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=29h8=33=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uybSw-0004FS-B0
 for xen-devel@lists.xenproject.org; Tue, 16 Sep 2025 19:35:50 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58b6e26f-9334-11f0-9d13-b5c5bf9af7f9;
 Tue, 16 Sep 2025 21:35:48 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AS8PR03MB8103.eurprd03.prod.outlook.com (2603:10a6:20b:446::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Tue, 16 Sep
 2025 19:35:45 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%5]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 19:35:44 +0000
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
X-Inumbo-ID: 58b6e26f-9334-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ouGrjqbScgE8Xjgw1XYz+XNpkj/CJehELmsBxI1P7mvlwxP18Mz1+yd4/E7gL//OmmXKh+LYbDr+AlgEX/NBvyhj8aYNHWy9fumCUO4wvzAXR3GYbAPyW4yV7xO+Dsrn3QBtuvUPL73c2RHPdjl+FRccWduFc/FXaJQUBWdSTTt5Pnr1cju5+/Hip61hrYhb5RroiGdcuFRz3zFdoAu/cLCzEKe/XQDjr4PWR8nwdmvrzisYwdZrBE/F+U/7Eh5nMJFJ1KO08fD1my504Hd00dBFDj688gTazpHfyLw63esKBEVVkJcWpcK1sjQv2GgLtMdmOzfZT11QegcVoXiCFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XO9Ci9v8RoygCBNXTpGGWjmCTKLPTHUrEUbQDhQ1Dtc=;
 b=Wzf8IkEKjB8NB6QvQe/ih74P5ZidSGEk+tNCcG41nBam+hzxe3Ow7ByINwI7iDaWsW3OtBnQ/tINhg7hdoufIccRIPa240RFJLwA44Fo2wGCIJzjPibi3CfwpyN6SYeKr/9dcIWgNVFeencjdLbHWdLeafmy0ykRkW1VZJdjvf3EiyBnVxFLhpHTgBVzNXTOX5AqXbXiTSIZpCtPzGJAs7Tx7U4XaTyea5sExQSO3dyhPPdttOaR0b9ASNjyqTRXLyVJbTA7tnJ9dM6cMEldmYpX2dijRFuwVYm/9hZLgmXT2ZvoHdeTSttlvv5v5fcH+B73bdZjAuEVCK7Rel3b3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XO9Ci9v8RoygCBNXTpGGWjmCTKLPTHUrEUbQDhQ1Dtc=;
 b=hSAILHY+6Nth7466yDTcmwqQXwR0FQCz/4q6h3LlJK4BU6ar9vuV8p+azzhBkZQay8n79TLXclL87+AhW/0bz/B0oTrkSMIsajWzAicXbBGUzScqQpo0YUB8DsxR1uhRPquP2YkQEdfBVa2/VDVegbEODuHml42wnz7FifIfoUzrBGzOUaFu7LvzD3RGk+UcJldp8x7hk+JbO+BcHTVkugJwBGah/FutZGolUpVgOKpJPT+EFQD09GcV429s+Eneaz0oUdnKQBOzTgOpB5PgrL5zkBXy41lZYztsXc4MDINEVZc7qzPbDQYN533jdbFsC86aFGA5VfnDHDukmj/Z4Q==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] misra: add deviation of Rule 2.1 for BUG() macro
Thread-Topic: [PATCH v2] misra: add deviation of Rule 2.1 for BUG() macro
Thread-Index: AQHcJwfEWjVU7vF+102YDgRq9OEY77SV3fSAgABWKoA=
Date: Tue, 16 Sep 2025 19:35:44 +0000
Message-ID: <adb1c46b-aa6f-4412-863c-96e95c10b85b@epam.com>
References:
 <0adc0a8f75cb88b0b26d38289d1dd5823386290d.1758024454.git.dmytro_prokopchuk1@epam.com>
 <b20b152d-cc51-491a-ac2b-148ece34efd4@suse.com>
In-Reply-To: <b20b152d-cc51-491a-ac2b-148ece34efd4@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AS8PR03MB8103:EE_
x-ms-office365-filtering-correlation-id: 1219ee55-f0d8-452a-eb2c-08ddf5583abb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?YTI4blYwaitxWjhkRHhZUlR0ME1mYjNzdkNJSXpzSmwrR0crcmpxN1kvNGxI?=
 =?utf-8?B?dzV1eVZ6aVpKa2d5SWovUWVFNkw5SWcwY2xwYVBZNUhkb2FScHE4WjVpK0lP?=
 =?utf-8?B?TnY5ZW1FYkZna1NvQ2hpV3IzMTM0Q1YweVdzMFVKVU5kbWNXbVljNTNUTk1O?=
 =?utf-8?B?QytwMDBUOEhzZGtYbUJldEQ3bjd1a3kxSGdOZ0JDK2lQWkpmVlNSSkx4N1pK?=
 =?utf-8?B?NW51cnNtU3Q1azArMzIvZFo1bHBtbDk4Z3BTM0s1S0I1RXpKQWo2NTQyRnNP?=
 =?utf-8?B?MmhaVkN2dzVoMXlkVWRGaUFWdE1EMHJNMDRNK0ZPUUZXZVNGVHp6K1RIMmdQ?=
 =?utf-8?B?b1RRMld1Q2NiZmhLdjlDNkZmVmJSc3Jwcm5MR1hTK0dyTkhZSzNGNHllZ0c2?=
 =?utf-8?B?MDBqSW9UWlRmUDljRml0MnVWaGN2U3JqZ1BjQUlPUjJFSmhyL1NrRG9ZTWli?=
 =?utf-8?B?STdJYlRSb2VubWZCZURlMDVOK3RGTGxCdEExQVJZakVRMStObDNtTXBKaWg2?=
 =?utf-8?B?MmkvaDJ2ZjJqR3p3aTlrUmJMa05NUXE1S214MDJtNmxwU3hZTnZpM0RZSWI5?=
 =?utf-8?B?SHI0d0VNK0R0VDFDaHM1NmJzQVZHcVBLRFRuOTlWaFNOK21JK1FXV2RBYlBD?=
 =?utf-8?B?NlExcXhxL0tRR1hwa05jY1FtSWVBNzFOR2M2emJ4bUFROHFkaUFkNm1jTms2?=
 =?utf-8?B?N2NKZkpuemQ4R1M3VWpDTWU4U2tJMHZEeUd1Q1RRY2RIbWZwNUk3MTJ4QzN6?=
 =?utf-8?B?SVZIZHRraWY1dExadkM2ejBNZ29YM3dBNkRIKzlmNWJuTGkrQTFjZ2JFZWMx?=
 =?utf-8?B?ak0yTDFibnVjR25XVHdqSUQxSGlUQnNDdC9QVGFuTDdwdHd1YXl3K0NoKzR6?=
 =?utf-8?B?SCt6ZHIwcmpXdmJMaHRhVFBKWFZ3ZUNxcGdNK3Y1MnR2TXh5S1ZMRjVQVFFl?=
 =?utf-8?B?aTVhYVBVcG1GRkI1MGNNTzJpL0VjaVp6Zzd2ek96U1g0bFFNa0ZnMDEzdEc2?=
 =?utf-8?B?VFk1ZjFaYURzb1NCbXVCZmlCTk90OFNhWlNydWc2dW5vdjZBVXNaUWFjNWFE?=
 =?utf-8?B?aVBNa2ZhZFRYZnVpNUtiSHdYMFU5aWdWb2FiNWNzSEtsTGNIQ0ZMY3hrU1BB?=
 =?utf-8?B?cFdQS2FyQWZjaEtuL3RXbjJiL0RXUHJ3QVNqL1oyZEowdTkxbUpBc3pGNHNy?=
 =?utf-8?B?T3ptSzlTOXRnSXBtQ1ZUaG0vZGZOR2prelRvK2ZVL2x1cG4xQktKbkNaYjNz?=
 =?utf-8?B?WWxmVHU1aXdPK2tPYVdtd3BLbFFISnRxcmh6Sml5eHlKZnhKc1Q4Z3pZMFdt?=
 =?utf-8?B?d2dockQxeFRjWlphdmhYaXRiWEg0L0dBQmx1QzVFaXpIM2plclFkcWxWMWIx?=
 =?utf-8?B?M1laNm40TW1IL1VSYlBQZ1pyczdGUEJVZ1BSYlB2VlprcWxrd3JRQXRqT0d2?=
 =?utf-8?B?UEM4R0RwbURwaytTbWNLSnJSZ0hIOElsWk9YeFRWMG55UldOV0g4cElUUW9K?=
 =?utf-8?B?WmRDaEhTSkM0T29Ob1pESGNVc1R5c3diZkkwWk9YanZ2azhiRno4cy8wZVBn?=
 =?utf-8?B?K2FNdjhkRks5Q0FEZlRPVkx1d2tZSDFNNDJQUCtqV1c0RjZNWktJeGhpRGYz?=
 =?utf-8?B?RG56QzdwZHdLZlJDSU01REx2Wkd4MW9JcFNGWVVOaDVtbVFicHpwYmdrVUVt?=
 =?utf-8?B?Z3lCMURXMU1RdGRnZ2JIQkdqb1k4ejY5dExHVlYzTXlWRkJtZ1V0dWV1TFdX?=
 =?utf-8?B?eGZFL3dqMGlZRTNNMjFkTkNROFVVSU1TNzRCQVNkZHlRZHZGc2JYaVNYQ0po?=
 =?utf-8?B?Y3NHUmpNTEdoZWhRQ2FGbzZXNFhiMzdCbGF5YkRraHduejJnY1YrTW9tbVZI?=
 =?utf-8?B?aDE2SDNxT0pYTTQ5Y2tXY01JVnhyaUhUR2tnRE1CaHRBZjFPYkhLeVYyU2ZM?=
 =?utf-8?B?RDJPbnlnaHMzUTRMYmI4YjFndXplVVlaa1FiekpJOHJPM0J1YU5rSnMza1FC?=
 =?utf-8?Q?dNLEiyGTk8I8/Vb2g4O1c6OV5qNBDQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Sjgrb3E3aTlOU2dXNm9TUDlnMy9sNXU0UktZQW1qR1cwWDFkU3FFM3pMTk1p?=
 =?utf-8?B?YzhwKzI4VER0cVVIRjFkQ3dpOWw1SnVWdVN4SG5FZDQrUWZ3bWpEZHpBaSsv?=
 =?utf-8?B?YkdVeWdjWjUxYURiT0pHQmpVN0pxc3lIaXE3M1g5eUdFaFFIYy82eTUxU1oz?=
 =?utf-8?B?QjFNdTBnU21iSS9NOE00eHNoVnhycGF2S3dKWDhybjB4OU4xNm9nTmRxOXAv?=
 =?utf-8?B?VmVIbTllcmdWQUZFQngyLzhhMmFMOGQzMSthVWhmODl2YlVzdjFWbitUeUc5?=
 =?utf-8?B?UklHT2RUTDFnK2dtV3Y2Zy9XTm9HRW5jNGhpY3g0NWoyM1RMdS8ybnNNTXFB?=
 =?utf-8?B?UjZNOGdUQm43UzZHc2MycVNFUXQzVGllWU5FTTVtZGUyeXIyOVRNUk9hZzV0?=
 =?utf-8?B?VWJXWUlBZk0xbjd2b0YxdHZYZGlVWWJydkxPdlFlRTV0dmxoM3ZCOUdPTlhP?=
 =?utf-8?B?MWhYUGNycmhUd1VBQ2x6OEluU3VZOElSZThtSW1FZXV3endNZ1B0N2Nsc05F?=
 =?utf-8?B?ZmM2QTRSMWxuQU5iYW9ZYWxnUmJvc21vbWZCTkUrMSs3L3dZQ2hoYUl4MTg4?=
 =?utf-8?B?YmJTVWZWY242a2x2bHI2OG4vaGtPRU1DdGRNRytxRjhoWVUxbWFyV0pOVGM1?=
 =?utf-8?B?UUoyVCsyby90ZWtTUHAvVGh1L01GR3Z4cC92VW5qRlNQckUxdmIxNis3NTl5?=
 =?utf-8?B?eGplcXJDVGZMKzJ4RnhyQVNrT3FTVFlGcW9BQjJlbjM2Uk9IOVk5SXVkaVBE?=
 =?utf-8?B?Q0lhNlNrS3ZHWnpCRkJsV3U0OHNKQmJMYWh5cUtuK0RWSGh1YVpaS3BUN2Vr?=
 =?utf-8?B?b2t0K2UrL3AxTjRvbjJLNjRWWUtlWWpZQWV2allZbWY4SWdpT245YTRxSFUv?=
 =?utf-8?B?NWRZWWhNdk9iVFcyNDFYMUVwV0NsUmhCZGovazBEUWVTTDc2dXQwV2t3Z3hj?=
 =?utf-8?B?dEZoL1QyL0tUNDhSbXAwaExRLzJJQUg1dTNRWjBRQXN1dUJXelkxM2t4T1VE?=
 =?utf-8?B?clVGVnRPYWtVU2tuSTBIUXpDOSszWGFYZ3dpbkxONGM2TWxKZlRyN3ZnZWN1?=
 =?utf-8?B?MGQremVoQlVCRkFvbWlwcE5OUms4bXJDWmdpeFdYejV5dUdKOTZtQVcwYlRC?=
 =?utf-8?B?TmY1aHhXNGNGRTJ1azMzdkh6NTBVdjVMTU5ZcGg3Z2dLaEpBaFpBWGRibk10?=
 =?utf-8?B?clQwTDRGR1k1U0RjRDFQMk96Tlp6YkRiQkdPMGJYS2FPaGdLa0t0NHBtSnZ3?=
 =?utf-8?B?dkdjM3RWUCs1QTFYckhVVVd3cGdPZDZ2SXRRdG5OaERoRVphamoyM0xBOTl3?=
 =?utf-8?B?TGNRQXBKcm9zaW5RZUx3NnVQZURSMDdYQk44cE5yeVVocnRncW5NREN0L3VN?=
 =?utf-8?B?d1BGTnNPWjF1SllGRmhKRXd4d3lVL1BZNTBtdCtSd1Q4N2NrcGMyZEpzcytr?=
 =?utf-8?B?T2tCU210VXpaTWFHODloT2VwQ1BFVnJCdWlNd1ZhTnp1Q3FubGUrZERUM244?=
 =?utf-8?B?bzhiTDUrVjVWT2RQRlFGNzMrNkhZalRBNWtBRUVkRWREenJWUE16VFY3UVJW?=
 =?utf-8?B?MWxIWWlrQldGZTJkMXFQT2hYQzZqbzh5TXFHRTVBYkY2bnRLandZbkFNb0Jy?=
 =?utf-8?B?ejV0NnZGYUVaUWI1U2dTRlV3ZFhqdk5BMGhTejdwSU5VK2dVeUxZVE1NczJL?=
 =?utf-8?B?NjM4WFo3c0gzZitWcTdzZmsvNnk2OGtsMVdvT3RKVnlYSVJ0Tzl0WkIwbzI0?=
 =?utf-8?B?aE90bmVsYzVORVI4dHB6ZUs1c25oV0l5ay9samphbmJSVTBkL0lZWExNbFlX?=
 =?utf-8?B?RTF6THNBRzBJanQzZExOVkp4MjRFalJNWXJtUSswbXJpNFJjTDBQNFEvUlFl?=
 =?utf-8?B?NXFkYXV6TXBsY1RSbGt3Z1JWeUNydVFMK29Xd3FuWHk5V1hSamhob1IxN2gz?=
 =?utf-8?B?QUJMMkZOa2JncDJ2TXdVREVwL05wNTZYZFVRMHd5emlnMExKMlhPRUhTTTY0?=
 =?utf-8?B?LzBUUmduVHEyWmMvSjh4VUJLa1BUY1BId3dDbmNrSmN5Z3JVYWZwNWZZTnNh?=
 =?utf-8?B?NVQ0Z1lVMHA1RTQ4SU4yN3oyVXZmVjdCcXZpSkZHK09GLyt3TXhVZVVWSkg0?=
 =?utf-8?B?VnRaeHJpT2lqQVU3WmJmQmd4R3ppeUIvaDRqK0xBZ3IxUThtMUx3T1hZdjc1?=
 =?utf-8?B?RWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D8E16645969D6C43B6EE8EFB03EEDD97@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1219ee55-f0d8-452a-eb2c-08ddf5583abb
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2025 19:35:44.7547
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hjwRUzPo6GiwJfO8f8e3E3yt8+LGSpX02J+VgK4AxHtSqJF0rJESSIP+pTEJhxR5ET/EoYCfZJgn16n7w2g+zwfmKR5uzsKBWdO36xsJVws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8103

DQoNCk9uIDkvMTYvMjUgMTc6MjcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNi4wOS4yMDI1
IDE0OjQ1LCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiAtLS0gYS9kb2NzL21pc3JhL2Rl
dmlhdGlvbnMucnN0DQo+PiArKysgYi9kb2NzL21pc3JhL2RldmlhdGlvbnMucnN0DQo+PiBAQCAt
OTgsNiArOTgsMjMgQEAgRGV2aWF0aW9ucyByZWxhdGVkIHRvIE1JU1JBIEM6MjAxMiBSdWxlczoN
Cj4+ICAgICAgICAgIGV2ZW4gd2hlbiBkZWJ1Zy1vbmx5IGFzc2VydGlvbnMgbGlrZSBgQVNTRVJU
X1VOUkVBQ0hBQkxFKClgIGFyZSByZW1vdmVkLg0KPj4gICAgICAgIC0gRUNMQUlSIGhhcyBiZWVu
IGNvbmZpZ3VyZWQgdG8gaWdub3JlIHRob3NlIHN0YXRlbWVudHMuDQo+PiAgIA0KPj4gKyAgICog
LSBSMi4xDQo+PiArICAgICAtIEluIHRoZSBzcGVjaWZpYyBidWlsZCBjb25maWd1cmF0aW9uICh3
aGVuIHRoZSBjb25maWcgQ09ORklHX0FDUEkgaXMgbm90DQo+PiArICAgICAgIGRlZmluZWQpIHRo
ZSAnQlVHKCknIG1hY3JvIGlzIGludGVudGlvbmFsbHkgdXNlZCBpbiB0aGUgJ3ByZXBhcmVfYWNw
aSgpJw0KPj4gKyAgICAgICBmdW5jdGlvbiBpbiB0aGUgaGVhZGVyIGZpbGUgJ3hlbi9hcmNoL2Fy
bS9pbmNsdWRlL2FzbS9kb21haW5fYnVpbGQuaCcNCj4+ICsgICAgICAgZGVmaW5lZCBhcyAnc3Rh
dGljIGlubGluZScgdG8gdHJpZ2dlciBhIHJ1bnRpbWUgZXJyb3IgaWYgQUNQSS1yZWxhdGVkDQo+
PiArICAgICAgIGZlYXR1cmVzIGFyZSB1c2VkIGluY29ycmVjdGx5Lg0KPj4gKyAgICAgLSBUYWdn
ZWQgYXMgYGRlbGliZXJhdGVgIGZvciBFQ0xBSVIuDQo+IA0KPiBJIHJlc3BvbnNlIHRvIG1lIG91
dGxpbmluZyBhIGRldmlhdGlvbi1sZXNzIGFsdGVybmF0aXZlIHlvdSB0cmllZCBpdCBvdXQNCj4g
YW5kIHNhaWQgaXQgd29ya3MuIFRoZW4gd2h5IGlzIHRoZSBkZXZpYXRpb24gc3RpbGwgYmVpbmcg
cHV0IGluIHBsYWNlPw0KDQpZZXMsIHRoYXQncyB0cnVlLg0KSSBzdGFydGVkIHdpdGggdGhhdCBw
cmVwYXJlX2FjcGkoKSBmdW5jdGlvbiBhbmQgSSB0cmllZCB0byBtb3ZlIGl0IGludG8gDQp4ZW4v
aW5jbHVkZS94ZW4vYWNwaS5oIGhlYWRlciBmaWxlIHVuZGVyIGFwcHJvcHJpYXRlICNpZmRlZjoN
Cmh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wZW9wbGUvZGltYXBya3A0ay94ZW4vLS9j
b21taXQvZDE1Y2Y5MWRlOTJmMWY4ZWM2NzkxMWM1MWExM2U3ZjA5NWMxYmNkZA0KDQpUaGUgRWNs
YWlyIGRpZG4ndCByZXBvcnQgdmlvbGF0aW9ucyByZWxhdGVkIHRvIHRoZSBwcmVwYXJlX2FjcGko
KS4NCkkgd2FzIGNvbmZ1c2VkIHdoeSBFY2xhaXIgY29udGludWVkIHRvIHJlcG9ydCBvdGhlciB2
aW9sYXRpb25zLCBhbmQgDQpkaWRuJ3QgcmVwb3J0IGZvciB0aGUgcHJlcGFyZV9hY3BpKCkuDQpB
ZnRlciBhIHdoaWxlIEkgcmVhbGl6ZWQgdGhhdCB0aGlzIGhlYWRlciBmaWxlICd4ZW4vaW5jbHVk
ZS94ZW4vYWNwaS5oJyANCndhcyBwbGFjZWQgaW50byBleGNsdWRlIGxpc3QgJ2RvY3MvbWlzcmEv
ZXhjbHVkZS1saXN0Lmpzb24nLA0Kd2hlcmU6DQogICAgICAgICB7DQogICAgICAgICAgICAgInJl
bF9wYXRoIjogImluY2x1ZGUveGVuL2FjcGkuaCIsDQogICAgICAgICAgICAgImNvbW1lbnQiOiAi
SW1wb3J0ZWQgZnJvbSBMaW51eCwgaWdub3JlIGZvciBub3ciDQogICAgICAgICB9LA0KDQpTbywg
YWxsIHZpb2xhdGlvbnMgZnJvbSAgdGhlICdpbmNsdWRlL3hlbi9hY3BpLmgnIGZpbGUgd2VyZSBp
Z25vcmVkLg0KSXQgd2FzIGp1c3QgYSBjb2luY2lkZW5jZS4NCg0KPiANCj4+ICsgICAqIC0gUjIu
MQ0KPj4gKyAgICAgLSBJbiB0aGUgc3BlY2lmaWMgYnVpbGQgY29uZmlndXJhdGlvbiAod2hlbiB0
aGUgY29uZmlnIENPTkZJR19IQVNfSVRTIGlzIG5vdA0KPj4gKyAgICAgICBkZWZpbmVkKSB0aGUg
J0JVRygpJyBtYWNybyBpcyBpbnRlbnRpb25hbGx5IHVzZWQgaW4gdGhlICdnaWN2M19kb19MUEko
KScNCj4+ICsgICAgICAgYW5kICdnaWN2M19pdHNfc2V0dXBfY29sbGVjdGlvbigpJyBmdW5jdGlv
bnMgZGVmaW5lZCBhcyAnc3RhdGljIGlubGluZScNCj4+ICsgICAgICAgaW4gdGhlIGhlYWRlciBm
aWxlICd4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZ2ljX3YzX2l0cy5oJyB0byBjYXRjaCBhbmQN
Cj4+ICsgICAgICAgcHJldmVudCBhbnkgdW5pbnRlbmRlZCBleGVjdXRpb24gb2YgY29kZSB0aGF0
IHNob3VsZCBvbmx5IHJ1biB3aGVuIElUUyBpcw0KPj4gKyAgICAgICBhdmFpbGFibGUuDQo+PiAr
ICAgICAtIFRhZ2dlZCBhcyBgZGVsaWJlcmF0ZWAgZm9yIEVDTEFJUi4NCj4gDQo+IFRha2luZyBi
b3RoIHRvZ2V0aGVyIGFuZCBjb25zaWRlcmluZyB0aGF0IHJlYWxseSwgd2hlbiB3ZSBubyBsb25n
ZXIgbGltaXQNCj4gTWlzcmEgY2hlY2tpbmcgdG8gc3BlY2lmaWMgY29uZmlndXJhdGlvbnMsIHdl
IGFyZSBnb2luZyB0byBoYXZlIG1hbnkgbW9yZQ0KPiBvZiBzdWNoICJwcm9ibGVtcyIsIEkgZmVh
ciB0aGlzIHdheSBvZiBkZXZpYXRpbmcgdGhlbSBzaW1wbHkgZG9lc24ndCBzY2FsZS4NCj4gSW1v
IHRoaXMgbmVlZHMgYSBTQUYtc3R5bGUgZGV2aWF0aW9uIHRoYXQgY2FuIGJlIGFwcGxpZWQgd2l0
aG91dCBuZWVkaW5nIHRvDQo+IGFkZCBhIG5ldyBzZWN0aW9uIG9mIHRleHQgZXZlcnkgdGltZS4N
Cj4gDQo+IEphbg0KDQpJIGFncmVlLiBBY3R1YWxseSwgSSBzYXcgc2ltaWxhciBmdW5jdGlvbnMu
IEl0IGNvdWxkIGJlIHRyaWNreSB0byANCm1haW50YWluIEVjbGFpciBjb25maWdzLg0KDQpJIHdp
bGwgY3JlYXRlIFNBRi1iYXNlZCBwYXRjaC4NCg0KVGhhbmtzLA0KRG15dHJvLg0K

