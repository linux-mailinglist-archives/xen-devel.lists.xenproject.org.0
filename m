Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B41CECCD1E5
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 19:16:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190116.1510748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWIXQ-0003Iz-Uq; Thu, 18 Dec 2025 18:15:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190116.1510748; Thu, 18 Dec 2025 18:15:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWIXQ-0003Gm-SF; Thu, 18 Dec 2025 18:15:44 +0000
Received: by outflank-mailman (input) for mailman id 1190116;
 Thu, 18 Dec 2025 18:15:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6E0R=6Y=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vWIXO-0003Gg-Jq
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 18:15:42 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e40d044-dc3d-11f0-b15b-2bf370ae4941;
 Thu, 18 Dec 2025 19:15:40 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA3PR03MB7444.namprd03.prod.outlook.com (2603:10b6:806:398::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Thu, 18 Dec
 2025 18:15:36 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 18:15:35 +0000
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
X-Inumbo-ID: 8e40d044-dc3d-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RVNdvNBChV68Q+YxzM36Hj4nWj8g28/Xyz4/1oglaEwOSTIufOM21cEe0LU18Vb96BC10gZpuyxZYVY71nFM5+az84akV+CpYk2pbdJlFEqCfAA9kabrcP21pNc4HWvP7fgxGHnYjakPb0EPrL9jjbE0YoajWR2sjR79/lbeq023VEzff16P4sX1sTVIn0cqddDsABQQEmOJusSWndtmoDtxjTRO9NgGXloxLPcbcdjCiHtQC711T1OCatbbfVwucC5eZZQHgoQn23fouqVtwPPyvsGzKIVHU69lCZaTigNUlBWa/WoLJDn0z4fyvyqurF65Bfm4gRUHfBJrd2n3hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvHDDNZkzR0Z7RcznDEj/DWDvWydNrHB/mneOa6Qylc=;
 b=yaHvIk+GJVfatNd+mfEE2v43Jo5UBMoFdB4zCtKVHWas/2RyYdUvWWxeZ01cuNkvtDDkPPfxyMAZzgK6jl5Ede/C+C99Z3zRBLvsgCOk3EUxQ4FXTMcov1mbhxroLOX0D3J0hVWRRRxtunyxEuNnx7pr4dU38CFqDmW+K/2jUQ/vdP6O3htzadgKR5sym4BB+z+PlJsVOz7QdXFOkSVOnyKfZjJ4N2tci9IkGTZYeXjp0wQru/IPUrHAAZRd1foavtCqTF8lY9SAf8jw6f3E8gzhuZbhjobjbklohQaDYn5x1bWQzH9MFy9Xejq6qY6ZpmrGRgqngiuEcr9ANUaXew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvHDDNZkzR0Z7RcznDEj/DWDvWydNrHB/mneOa6Qylc=;
 b=nFNqjFtA3Bp5iPB0/dc3urOGP0tQlEBx/3NEFg5TSThclFwBrSPNvlv77JyRM5PmAZthcZAwPQ0Ps837rtw88dba6jalL7IHAyPuED4L8ZWQwAXUe8nZkPwTC/jEQo8gtbPTEin4dhpbjpiZovJPpTPK0QvhpD+BKSLey9egBWI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ea01af72-c94e-4203-90c4-eaf68174b576@citrix.com>
Date: Thu, 18 Dec 2025 18:15:32 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 1/4] xen/arm: optimize the size of struct vcpu
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <cover.1766053253.git.oleksii.kurochko@gmail.com>
 <946a1c2cfaf4157074470a653bba5baa8561ebbf.1766053253.git.oleksii.kurochko@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <946a1c2cfaf4157074470a653bba5baa8561ebbf.1766053253.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0638.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA3PR03MB7444:EE_
X-MS-Office365-Filtering-Correlation-Id: 848e0304-45f9-4a2c-10f3-08de3e6170b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bzQ5YktDVi9KUlVqcFhuYThWZ3V3SVNzVHVYNTRuT1hOVmxwRlhyVXF4Yk5s?=
 =?utf-8?B?RlFxT1ZLbDMrU3lNSWNQUTJTRFNrMnZnY2ZCTkJWTnhFWmtyOW1kU1NOakVS?=
 =?utf-8?B?Zi9QQzdiekYzVTdpKzZveFVON1NtY3Q2S1R5Wk43MzVGYWVPMmo5Z0g1L2tK?=
 =?utf-8?B?S1lKa05WSlZoeFgzVHd5UmU2UXJBaWZiRk9xNCthNFdyT3JoZEZFZ1gvbmxi?=
 =?utf-8?B?QThvdTdJZDFFVjRTWExBTWFTOTNoWk9lVVhqbnJuSmVsd3A2T0c5cExkaDZi?=
 =?utf-8?B?czhIRndKSllPMXk0T01KVWJMa3lSOTZzL0ZHVGJjQWJxbHVKNmtvRVNhMEZN?=
 =?utf-8?B?REhwSXdIYzZvTTluanJzQXVxT2dXSnVlR2RQenZmVDVxKzJ3YlRrYXdZeDB4?=
 =?utf-8?B?ZmpVL3J5RE9tcU9YSmhTL1M5cFBqc3JDQUNZczFkS0ZNb3FFYndHL2pMVm82?=
 =?utf-8?B?bW1zK2NoTEVEc3FIM0JtbXFTR0h0SEJWa1hUNUFIbUVnV0RKWElyYnBSQmtP?=
 =?utf-8?B?cTN2ZzEwM3FFUjVGbks4RzRCbm1qc1NOS3hTczRQN1I5MzMzMlVnSXJwUDZN?=
 =?utf-8?B?d3RrYVF1YWpSZno5eFJnRlVCa1FIclpabGpqQ0oxQjM4cDhodjAyM1VvVVMv?=
 =?utf-8?B?RjVEWDVlU2hlNHVlQ2t6VGgzUEV6WTNGL0N3MFc2S1hlZmJYZFBaYVRGVUVh?=
 =?utf-8?B?a3BWMjVYK253Yi9iOUlyQ2t1L3N6L2tNWHduMUd4NW1RdTJNY0FnUlZzV29O?=
 =?utf-8?B?M1UrcDdHOW1IOGZHakR4aGJ1YWROMVJqbHlmUitadVFUQmVhMTRhL2lxbDZH?=
 =?utf-8?B?RjFMcXBIL1QyWisyOXIvYzNGWWxwSDFWVW1UamNadjBmZXpnTXo1VGdHVEJL?=
 =?utf-8?B?YzB2SDRiUlBjZjJjbnJPMFdqSysveTAwTk1zbE5FK2NhNzhLNU8zTG9wQU4x?=
 =?utf-8?B?dXRUWXhRQ25BS1U4WCtQOEhzMXNTMGo0YzFzZnpsaDZEQ2tscXhwN2N4UXV2?=
 =?utf-8?B?TnYvYW0zcDcya1l0MXZQY1RDeVNZU1Rvc3RvQkxnYWMvSkhNbFp3YzhCc0ph?=
 =?utf-8?B?dXliaGY3Nks5VGRmN3Jpek1xV0RoUmNDUVpBN3J2NnVyV3FPY3lKd3BnWmh6?=
 =?utf-8?B?Z3RmVFdLTjlURUFrdGRLem9OMTRIbDBxYitPazh2UzhLTHg1ZmNYWmt0V3c0?=
 =?utf-8?B?dWNLcjFCN215NGY2ZTQrenVWMWEyTU9jam9QVFY2cmZVNVFqcDdyQlpZTDhS?=
 =?utf-8?B?MXZrd0lBSzNJdSs3SVd0MXpjVW9URnJpbVQyOXl5aDJqeXduSTN2c0EyQUxW?=
 =?utf-8?B?VE5IWCtGbk1mSHZVV0Y1Z2JVd0RFK0MxZDhKY1JmU2cvMm5Lbms0Z0w1emIr?=
 =?utf-8?B?N2dBcGMyZEVsY1J3bElZbWovbU9scktsOTdUME8vblRrVG90L1Fmakh0SmFU?=
 =?utf-8?B?dWczRDlzTXV5RWZRMU9PUTlGNnNxVVNJTE14TjF1dEdZYkNaRXE0ZFdLQWt6?=
 =?utf-8?B?dXB4RjZHTTFZZENWazM0Vi94RHk3bnBmRVIvVGJ6WWtuNFFJNlVzcVBCeFBG?=
 =?utf-8?B?L3piaXJZMmtVUjhHZUZJaVNTcTd0VlcrMUZaK05YeHBUMmNDN08zWFIvbmZi?=
 =?utf-8?B?aks4TG9tQnlRQ1hhZXBmMWt0QWlIajVkeGJJS0Y5Q2xKdmZBNzZMVWtpcG84?=
 =?utf-8?B?c3dwQWlJc21oRDZ3T1hIcXVQNlIvVXI4T2xtbmxxOTVxNFhGZEw2STBvSC95?=
 =?utf-8?B?TkxBeVVwSFlSUzB0bFdjM3NWTzJ4bFNHUUJMWXhINUgyU0FMNHdhb08rdldo?=
 =?utf-8?B?MGVWRGpvbnRuMmRDaUZub3RLYk1uMURhblA4OHF5Y1poaXZWZ3UwVVRnb2c1?=
 =?utf-8?B?dDVJT3A0YXBvT0JVSUZUY3pyYmJWSGpibGtqTy8rd0dZU3ZqYnFvRys0UlNH?=
 =?utf-8?Q?1cf40mGox7pARtgX0rbq9H0fPBvoNgyi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M05DNHVvVm5MWmVVaWdkOTNUbjZ3SHNaS3Noclk2Mzg0cXBBeTY5anFYVWNq?=
 =?utf-8?B?MnZ4Y3phdnhFaDRURmtyb1NzM1Z0aXFRVmVmQ0ZyZUhVK1IzMVJxVC9iYnBj?=
 =?utf-8?B?Z0oveGdlWGU0aXF1N253ZlhySkt1VHkzcUFTWmo3N3Q4d0p2V1hPTGdJeFlN?=
 =?utf-8?B?RVFTelpXOVBUTHU0ZU1SZHhudElhYm5QdXFmUVliRlRKcEc2bmptbm5FVlpy?=
 =?utf-8?B?cjhBTnhXblZub0s3R0xJS2F5N3dmdzhtYXJrNXhzZWdXN29mQ3Rpa2xYanhM?=
 =?utf-8?B?TXJjMTU5V1lyYldKMWVJOTl2N09ES1lnYW5rRHVWQ3hKeGpwZFdHTWtzTW5l?=
 =?utf-8?B?Vnhac21PQWVuU0VLbDV6cEhQWENvdmZYcW4wWnBxNG0zYWxuVy9landzdkpT?=
 =?utf-8?B?ekROQ1J6ZmpBWFNmS0pyV1RmRjg4WE8wa21lYXJDVkJEY2FLRHRuMHk0WG9h?=
 =?utf-8?B?L2RDbXZCWHlwN0RtcWxzTlBEOGFLVkJPVXdISEV4OUF5RjI5TThjeFJ4TDVQ?=
 =?utf-8?B?d3JwVUdWSDhNcUh3Y3d2OW94S1FXRUIxNUswTzlxdVFhTkVLcWZ1NmhwUHVh?=
 =?utf-8?B?U21RbFpEaTZTODRpeUhOYmYzYWJ5NHdXUjIwdFhUcHpPdHMzZ3dJMGFNV01Y?=
 =?utf-8?B?NG1nVFcxeGl5dHc1bXJJZVpsTGRzNWJBS3laV3huSGQ3cy9ReHRTY3dCMU0r?=
 =?utf-8?B?Vm94Z3BlVWxhalNaQ2gxbS9jNFZXVXpnL1lFMDZGQTl0cHVXWUtjYVNLL0cz?=
 =?utf-8?B?UlpPZTRZTEJxTmdXREQ3UEYyTnkwSFBQbVl5L0RvSUNiV3VuamJJQkx6QlRl?=
 =?utf-8?B?aXRINkNESnlsZFNyekVUUGI4M3Z0VXlITlU3cWVuOGk0RndEUXVWajJNTGtn?=
 =?utf-8?B?K2lrOHJxelh2MEdsVFdtN2JUNXNrNnFXeXdzZGphcDBXY1c2d0xycjBlMkRv?=
 =?utf-8?B?MEtnVXdabXVWZGlSREhXOE81dTYvQkl3U1JucVQ0TFJYSW5TNmNDWFFnSlF0?=
 =?utf-8?B?bVZXdlJRMUZGYy8xWG93WlZJK1dONjd3RGtyYWRCdXZVSFgyaVRZL1lsM1M4?=
 =?utf-8?B?ejBLT243OU1IZHJjdUJSdDlYS1FLUEliWW1URUJQdDY4Zm5nNlpZOGJXSDlE?=
 =?utf-8?B?d2JzcDBQaVJEMGo1L3BlZjZrTHNDcGliWkRFNXZQUGQvdG9sUE1kS0owNXoz?=
 =?utf-8?B?N2xzdkp5cEovcXFlV1pCRVkxa3BQNUZ4blhMbVFTWXkvTFBBVUhXcHFJdXlB?=
 =?utf-8?B?amJlSHNlVWJwejh2dW02Z05LRnpvZEhKY2wzelUxd0VGUHF5Z2VxQnRqaCs0?=
 =?utf-8?B?RUdZYnZRcGQ1QjdQUC9wakFDOTEvWkwwcWtFbU5rU05KekJaUkdFdDU0Znow?=
 =?utf-8?B?MXg1Z1dIR2VOa0pScExkSkpqSmdDNG0wczMrU2R1WkpWOHlVWGRQQkxIT3pl?=
 =?utf-8?B?L2hFbWVlbEpLSW9XNjhML082aXNMZ09OczN3QmdFK0FZOUdaVnFOSjdFTEZx?=
 =?utf-8?B?NXV4cFFtSWd5RUl6QVZJaGZSODUvaXJuS25DdkZ3MHltSG1jTXgxWjFpUjdD?=
 =?utf-8?B?bFVIUWIzQjFUR1ViZkFjazBtbm9FMDNWUUZ5V3VSZkIyYkliUWVzSlJqU2dS?=
 =?utf-8?B?QWwzbnpqNTNtZk84MENydTlnc011cUk0MnNVd1pNWlQveTJEeFZhNTNRZmdw?=
 =?utf-8?B?K0ZmQ083eTkxdFZlSUY4S1JRZlZmNTVacDZXTHdTWElGODZzNjg0RENIZW83?=
 =?utf-8?B?ZlVTOFBHeDhTWGdtUWJnUjVXb0c5QjN6TmhnV0dabDJ5c1BZTnZwWmN2VnMx?=
 =?utf-8?B?dGM0Qm93dXBqL2NnaE02L2M1ZCtHL3RKUmFGSXkzZEFwNlErQlpnLzNERDNN?=
 =?utf-8?B?SDFzSTlPdGlER2hENGQ1QzJ5OHBFbGxWVi9RRHI3NGh0SkhXRlZObWl6bkRI?=
 =?utf-8?B?eU1neXJHUDRsSDFQbVhJTTJuMVduTDhxRHBpanlGd1VjTHZjT1dmVThMekVB?=
 =?utf-8?B?Q3hLa3FPWDFBNVh4S1NFZW9Ta01RU0ppWGd4eFhWZmtpMDhoSXNhcG9CYVE4?=
 =?utf-8?B?R0lBUGJNbzQzTUJYdGd1bk5DaVliUG10eGUyMHJoQWxFQWdjZlY4b3FQY0Z2?=
 =?utf-8?B?TndBVUlIblZmaEMvM2tpaUxmMWNyZHgvbTZlZFNLT05XTklubjE2eU03MHo3?=
 =?utf-8?B?VWtVV1pJTWR0U2xHWjdka0hsTUo3bkliajAyOHUvaWdFUmxIL1RtUW1xeG93?=
 =?utf-8?B?cU1sVFZseVF4b3NFVnJjbEIveWE0ZmtlQi9qNCt0TWZobWRZWk81OWVQTTI3?=
 =?utf-8?B?RUsrNUVjTU96RUQ1M2pYUWVycHhjcWpBc2o4QzRzQStzejlKNnNSZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 848e0304-45f9-4a2c-10f3-08de3e6170b4
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 18:15:35.8369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RyA+Z4GXqwtD987psr6Uwq/19QLkAoZIK7Cu37RaIGue6xVxdyF11uh2hFwkArfBVCpyveuNb1CmoqdRgYP6hhe3gXpe9cKja9T0fAkT/sw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7444

On 18/12/2025 5:28 pm, Oleksii Kurochko wrote:
> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> index 3ebdf9953f..8b17871b86 100644
> --- a/xen/arch/arm/vgic.c
> +++ b/xen/arch/arm/vgic.c
> @@ -370,29 +370,35 @@ int vcpu_vgic_init(struct vcpu *v)
>  {
>      int i;
>  
> -    v->arch.vgic.private_irqs = xzalloc(struct vgic_irq_rank);
> -    if ( v->arch.vgic.private_irqs == NULL )
> +    v->arch.vgic = xzalloc(struct vgic_cpu);
> +    if ( v->arch.vgic == NULL )
> +        return -ENOMEM;
> +
> +    v->arch.vgic->private_irqs = xzalloc(struct vgic_irq_rank);
> +    if ( v->arch.vgic->private_irqs == NULL )
>        return -ENOMEM;

This error path needs to free v->arch.vgic.  (If we continue down this
route.  See below.)

>  
>      /* SGIs/PPIs are always routed to this VCPU */
> -    vgic_rank_init(v->arch.vgic.private_irqs, 0, v->vcpu_id);
> +    vgic_rank_init(v->arch.vgic->private_irqs, 0, v->vcpu_id);
>  
>      v->domain->arch.vgic.handler->vcpu_init(v);
>  
> -    memset(&v->arch.vgic.pending_irqs, 0, sizeof(v->arch.vgic.pending_irqs));
> +    memset(&v->arch.vgic->pending_irqs, 0, sizeof(v->arch.vgic->pending_irqs));
>      for (i = 0; i < 32; i++)
> -        vgic_init_pending_irq(&v->arch.vgic.pending_irqs[i], i);
> +        vgic_init_pending_irq(&v->arch.vgic->pending_irqs[i], i);
>  
> -    INIT_LIST_HEAD(&v->arch.vgic.inflight_irqs);
> -    INIT_LIST_HEAD(&v->arch.vgic.lr_pending);
> -    spin_lock_init(&v->arch.vgic.lock);
> +    INIT_LIST_HEAD(&v->arch.vgic->inflight_irqs);
> +    INIT_LIST_HEAD(&v->arch.vgic->lr_pending);
> +    spin_lock_init(&v->arch.vgic->lock);
>  
>      return 0;
>  }
>  
>  int vcpu_vgic_free(struct vcpu *v)
>  {
> -    xfree(v->arch.vgic.private_irqs);
> +    xfree(v->arch.vgic->private_irqs);
> +    xfree(v->arch.vgic);
> +
>      return 0;
>  }

Free functions should be idempotent.  This was buggy before, even moreso
now.  It wants to be:

void vcpu_vgic_free(struct vcpu *v)
{
    if ( v->arch.vgic )
    {
        XFREE(v->arch.vgic->private_irqs);
        XFREE(v->arch.vgic);
    }
}

Given the type change, this probably wants splitting out into an earlier
patch.

Given the fact that the single caller doesn't even check the return
value, you're fixing a MISRA violation by making it void.

> diff --git a/xen/arch/arm/vgic/vgic-init.c b/xen/arch/arm/vgic/vgic-init.c
> index f8d7d3a226..67f297797f 100644
> --- a/xen/arch/arm/vgic/vgic-init.c
> +++ b/xen/arch/arm/vgic/vgic-init.c
> @@ -241,10 +245,12 @@ void domain_vgic_free(struct domain *d)
>  
>  int vcpu_vgic_free(struct vcpu *v)
>  {
> -    struct vgic_cpu *vgic_cpu = &v->arch.vgic;
> +    struct vgic_cpu *vgic_cpu = v->arch.vgic;
>  
>      INIT_LIST_HEAD(&vgic_cpu->ap_list_head);
>  
> +    xfree(vgic_cpu);
> +
>      return 0;
>  }

Not in your part of the change, but this is bogus.  It's not remotely
safe to init the list head like that.

The list is either already empty, in which case it's a no-op, or it
corrupts the list.  It appears that the list mixes entries from other
vCPUs, and from the domain.

I think this is further proof that NEW_VGIC should be deleted
wholesale.  It's clearly not in a good state, and I get the impression
that a badly timed evtchn sent to a domain in the middle of being
cleaned up will cause Xen to trip over the corrupted list.

>  
> diff --git a/xen/arch/arm/vgic/vgic-v2.c b/xen/arch/arm/vgic/vgic-v2.c
> index 6a558089c5..e64d681dd2 100644
> --- a/xen/arch/arm/vgic/vgic-v2.c
> +++ b/xen/arch/arm/vgic/vgic-v2.c
> @@ -56,8 +56,8 @@ void vgic_v2_setup_hw(paddr_t dbase, paddr_t cbase, paddr_t csize,
>   */
>  void vgic_v2_fold_lr_state(struct vcpu *vcpu)
>  {
> -    struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic;
> -    unsigned int used_lrs = vcpu->arch.vgic.used_lrs;
> +    struct vgic_cpu *vgic_cpu = vcpu->arch.vgic;
> +    unsigned int used_lrs = vcpu->arch.vgic->used_lrs;

vgic_cpu->used_lrs.

Taking a step back, I think the patch could be much smaller if you only
made private_irqs in NEW_VGIC be a separate pointer, matching the "old"
VGIC code.  Or does that not save enough space in struct vCPU?

~Andrew

