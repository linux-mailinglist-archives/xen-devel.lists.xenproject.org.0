Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB78BB6717
	for <lists+xen-devel@lfdr.de>; Fri, 03 Oct 2025 12:29:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136541.1473089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4d1u-0002Ux-C1; Fri, 03 Oct 2025 10:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136541.1473089; Fri, 03 Oct 2025 10:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4d1u-0002T5-9D; Fri, 03 Oct 2025 10:28:50 +0000
Received: by outflank-mailman (input) for mailman id 1136541;
 Fri, 03 Oct 2025 10:28:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=04fq=4M=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v4d1s-0002Sz-R9
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 10:28:48 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be547fa2-a043-11f0-9d14-b5c5bf9af7f9;
 Fri, 03 Oct 2025 12:28:47 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by DM6PR03MB4987.namprd03.prod.outlook.com (2603:10b6:5:1eb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.17; Fri, 3 Oct
 2025 10:28:38 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 10:28:38 +0000
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
X-Inumbo-ID: be547fa2-a043-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tNw3m66SqcGCiXLq0swa0we4kbH7ftDTfkr9T8x6jp86h+0jssnnN3RkryX2kzjEhNFZIqYbra5WcNGU5pUZj9hOH39kDgCca07Gu60XUHf1UcpXJrNMhDiGoqZAFZfH7N4Raz4+3HM4JByscasrQKxHfBNTXUGZcVfyUTjEzAApjIZRy70TOg/IIXCL+l1viEFaEcZgUwBDTXrgJtEEJjhV6uXRaAcdF4+bl3kO/Y3GbLjcy8a3eWIVjtPY2DI1Ke3eZtDIHlsclJmRAOzOzaKOC3Fmv8P9EziexOaxwLIfhsWwmxPX7yivz9GYCw0z+Ytkjng5+yRAGtyQyZDFsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmBfm5DqS7dBua8Z+OdeFkiiJzV/rhm4OOyJjxNfybg=;
 b=gbPNhjR3QV96qpSw/sL8hFvxG/LglDgsQuqP39sohTOnd/hTn5HCfSSFIGEqckn3GtS/tu57ft+3wpM23NolHGx0UulL7ZjGgtEk6HlzZQvUPiLFnY2vBfsZjsgaGwTsD7wA4vn97f03cE0my12wEAOBar/uBlkSm2meuRp6QprejwqJigpVx1ebwqd41HLxrZgkSP0gWrvalB6YL8wSL36xdYP23o8gWXZUz+f+gS4iZFLM1VZ24FjvDtSK5oPCR3aRNyjqct8gqFxvnwYrW7ALirO0050Zz+nH5tyWk7ViizPeMgQFCqNRwPSl6VziCkyE83ucfl6ySThVqt7OKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OmBfm5DqS7dBua8Z+OdeFkiiJzV/rhm4OOyJjxNfybg=;
 b=K/uDn/bRfx6UX3foCZOrAKSDU7fHQwG3+B0xU3Wj4wdzcrjiDy45dhYXBN+Gpnau7hQLZURZqxnaWbqyCuQykBcrxrED00pQUe7aezyOj1mltDmJugXPB0sAFyFHZhfcBXEK2YyGMI6ef8CrdDB6b3SXdKWclC/uFYvIcpiWQJg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 3 Oct 2025 12:28:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Frediano Ziglio <frediano.ziglio@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH livepatch-build-tools] Treat constant sections as string
 sections
Message-ID: <aN-lUnRe7rbHdSED@Mac.lan>
References: <20250918095203.19421-1-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250918095203.19421-1-frediano.ziglio@citrix.com>
X-ClientProxiedBy: MA3P292CA0027.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::13) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|DM6PR03MB4987:EE_
X-MS-Office365-Filtering-Correlation-Id: 485902ce-9c07-498d-ed09-08de02679db2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?emVEOWxYWUFXaURLZ0NlL2YrTXFYMjlQOTNGUFlDK0k4WGI0Vkh3VmpLa1NI?=
 =?utf-8?B?M1RXMlQzUjRlcVV6bW1QTXhCM24zZXVYenphNkpZOFhYeUxhMjJkZnltUVkv?=
 =?utf-8?B?a0drVnJ3ZENwR1p3WWpNaU8zSUJzbkZlbVovZmVPMHZUMVhUTm5vSHk1dkxv?=
 =?utf-8?B?VGxFWTRDQTlabkFGa0JBbVg3VkQ2ZE4wRTk0QUZ3aGRGSktHejFQZkptSWo5?=
 =?utf-8?B?cDZZNU9sNTI5a1NlZzRDMGFrN3BEWXRBRmdhMmtUZWlab3FtQzVqMklkd1hP?=
 =?utf-8?B?TE5IRDMyTksvRm4rNnliQ09IM29qSUNYZ0RQd1dJUXl1by9hRUE3UFd5V3g2?=
 =?utf-8?B?WmZGeXliYUtIcG0vOWVmTXNFY1VtQmJEVU1NMnZWQ2dUOWdoS01MblNCeHR5?=
 =?utf-8?B?djV2cTR1eUdiaERscEw0ZzR0U0lQVFdveStxKzFKbVZIZDZnY1IxZHRITFBx?=
 =?utf-8?B?RFFERG5WdlE1bDd4S1A1QTJUTkZRTnQ3M3N0OXlKeDg2T0IyWE9pelhHNi9S?=
 =?utf-8?B?clJDNkY4WU5sUUk0eG1HNFV1eS9aMS9ONE5JbHJpMUNFbEV4ZitNcTU0T09J?=
 =?utf-8?B?dDRTdVgzQVBub05tWFF1TVlRYS9nOTVaczNaMnR3WXpaQVFWcWxIdDZNM1ZP?=
 =?utf-8?B?aEE4T1RRMUhDTGQybjBHenozc3dveVpoYkpkTkhKMi9xNk9rNFcvakt5OGMy?=
 =?utf-8?B?ZjJ0eXg2LzZIV3dDSHhIamMvVVcrR1BEQWxPdUxjcFNrUlBXbFFWK0p4Qm1k?=
 =?utf-8?B?VUwrdmV4KzN6MXZzbnJnWEZkLzNtTExTSlJTWmJWZ2ttMFpqVHozUnhabUlO?=
 =?utf-8?B?V1ZiQlkxMFFkN0Jla3ZUTk9XT0tuYVhnaFhYNUIrRmFvSDdBMXJlTUY4NzdC?=
 =?utf-8?B?ZWplOU41YXJ4aEZYbmxjQ3FHaEhmaU9yMjdPditGdWFUdmovWllQRE5FNk53?=
 =?utf-8?B?S013MnVHamp0UFEwc1l6Q0lMVWpVYmpSdWZ3bkM5enpEdmxDcGNHYm5BdldV?=
 =?utf-8?B?d1FWZUlCVG9qdWV1ZlRrbzFkdXFGUkNQSmQ4dzgwZWR5eHMralByRUFWVHQr?=
 =?utf-8?B?T2JSbFZqY3FEOVA0dCtCTTBmdG9VdmYxdDdkOE9ZWTE0V09Cdm1mMW90N0VZ?=
 =?utf-8?B?VEF2S2M3d2hyNEFMS2szbHQrMTltMXlhdHpQR05IRzdUWVhKdWYxTkc1bHgv?=
 =?utf-8?B?SHJ5c2pneitwVWozTkZUZFFyVk93V2doUVprdnFnaDVHYmdKR3YyYlF3TjBK?=
 =?utf-8?B?OXVEZ2UzZ0ZzbXlNMmNNSXhQWjR1VjBxTDVtY1pqSjltNjNGWEo3ZFRnYm5O?=
 =?utf-8?B?cDNpOVhiU1I1ZlhBd3NiQnFtQWEwN083bjJLVC9UVHJ0cngxZkVVNVJKRWtn?=
 =?utf-8?B?TkkxRk0zQ0dnTEZSZ2o0aW5Eb3M5Q2ZsTDg4S0J3am11Ky9MK3pIVERyeTAr?=
 =?utf-8?B?Z1lmK28zdnR6QUpnd2RxQzNnZkxSNENvMFdxU3U4ZVRIUEoycDVNR2svSW92?=
 =?utf-8?B?N3NVRVJ0dUVQZi9oZXExaUxsYk56TDZDYXNMcEJVcUN0dlBVMmpGdkpqaDZz?=
 =?utf-8?B?K0xId2F4ZUY4VGdvd09UaTY4cEprQkRwYW1ZZUJNL3N2cHBKb3ZabE1UVEM2?=
 =?utf-8?B?NWU1YmIwZmpBMEFMMkF2c1JEdTNZaDNydmh4UkFSd1ZCRUVSVnZoeU9qbFl2?=
 =?utf-8?B?WlRIVytxRy9GNmJRMElEOWJReDIxaXM5QTJYWlNQTzFudGNjVGFoQ0lHZzZL?=
 =?utf-8?B?bkFaazR1aGZueW9SdCtKcHJIc01JakNkV0JyakJOR1VmMEpkZzdndS9Mdjcy?=
 =?utf-8?B?TnRSUUo2d3pIclVUVUp6bDVDZ1RKUS9IaTd6eGxBcURMNFo3ZWljOWFiMDNL?=
 =?utf-8?B?UnZsUGRlL01sQ3BBZ3lHNFFSdjA1bUlkYXFYbGtiZ3NUL3NzRHpYbWRPdHdi?=
 =?utf-8?Q?JG66gJ5cpExSCLo3mPqyhKrpLeTiOGuM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L25wTUYvMjl3eWg4dUJwRjhjUVJwOGx2eFpqYS9Md281WHROVC9heEtocFVy?=
 =?utf-8?B?bjJrRDBocjhwNVZ1My9aU2tPMGtYbkVpT0R3T0FyVFg0SlpKUkZTM0NBWXNJ?=
 =?utf-8?B?RjJGMXo5Mml1SzcyRGNmcllyL0dybGVyblRnbkIxMERxTDI0OCtFV2cwbXdw?=
 =?utf-8?B?bEtXVjFhTm9vMUVjL2YxWDFaSnhLeXg4bXFjUVdSZjdCcXE4dkU0VFJPc0E1?=
 =?utf-8?B?UkduajhieVpjNHJrbXk5NUJCaUpPQkhIdDh4SFhtcTdhb1FIV3dhNjVYbVNS?=
 =?utf-8?B?RmhYWHpwcjc2dXh2dlBmb3VwbTRsdlhvQnVHa3VzcXI3NDRuS2krbEV4Y0RT?=
 =?utf-8?B?U3hLcnV4dnNZWi9DRTFGY2Q0d3c0WkZuYTJmY3ZPY0IwTjNKcDBQVWlGK2hN?=
 =?utf-8?B?bDFycWs4cnR1aDJ4L0UwYWZmQ29GL3dyY1JlM1N2RzBNUkM1NXdqRkNGYVY3?=
 =?utf-8?B?a1l3RHV3WSt0cFhJYVQ4VnF4cE9kUDZ3VGVHYUlrV0dWMUt4Vlh5YUdsTmlC?=
 =?utf-8?B?eGNRYUtPTWcrbnR2bFlHY25WRTZlWUROREFIcU9qYmhGWnRtQXluNjRlYU1P?=
 =?utf-8?B?T3JRSm9ycDIwbmlOTDFLdkd5TitHelp0TjA0NVZOekVhdllJZkt4aXBBRXRI?=
 =?utf-8?B?blFhN3c1ZVprSTFuQS8zODhuWHZBMlVESWY3dDNNOU82TXhSbllGQ2RDM2tw?=
 =?utf-8?B?ZElkZ1J2QnRDNlVHYWh4b29lOVAyWmFucm9jaFZvQngrWkJqVHZHVGIzYmZT?=
 =?utf-8?B?Z1hZZGs0TGF1Y3ROOTBmTzdhWjdJUFRZZmhSQlJIOW9jRHBwUjZjWGgvWjdP?=
 =?utf-8?B?MG9yQ2VUSmRFZ0NnQmxNYjdTVElsdlpSSGZ1YXRoUERqbjVaSXNJL3hwS2xu?=
 =?utf-8?B?U0FVa1UrVU0yeTk5UWtpd3oyYWF1WTlNcG9BRW1wNWVoYTRlR1lGbWdnZTlr?=
 =?utf-8?B?dktZQXo3ci9KMmszRU1Gd3dYejZydSs3bTJNaE44U25ib1FVMEhDWE9vUVZr?=
 =?utf-8?B?UWZ6RCtuZnpDNTYyR28wWmx0emJtLy9Ha2RjQ29xOTcxa0VmL1pQODNjdlkx?=
 =?utf-8?B?V1ZsS0REN0FDUFl3ZkZ1cittSDc1bWRXVTUzSUN6ZGNBTkJIZjdnRm9EUTE1?=
 =?utf-8?B?RTdxTzRqeDBTRzhZeVJhQmNRUUxFVTNRNmcwajdkQzVRT1Q1MUZjS1hDNWFr?=
 =?utf-8?B?Y0FvMVJBWXJHQ3FzdmlhQjFXd0NEKzY3TERiRk01aVBkTnZMWStwdWJscllH?=
 =?utf-8?B?cFlEaVJ5cXFQU05iSnc4WVpTTjl1enlUTy9ucWRrYUZ0UjIwK0EzQ1Aya3M1?=
 =?utf-8?B?NllVWFNyVWZTL2NvQXRmeERMTCtTUFR0MTB6YUNDYTBOU0g4ZmZjMnRrZW9V?=
 =?utf-8?B?c21FakdMTE1UNzJFd2dnRHJvU05Hd2JYNkVPS0xCL09zWmcwWUhQT3ZseDc5?=
 =?utf-8?B?NGF4M05BSWVHNDVzZ0VKVXRqSXpUTXFpTWRKLzJpQzFKNW51R1ZCMUx4RmVI?=
 =?utf-8?B?RDVXMDlJRE5pK1J5WFNETmlCUmttNmY5Und0aHJlLzZvaWJPcG5aMnZvcXNS?=
 =?utf-8?B?ZEtvV25wKzM0OU9LMGdjSXJneTVsODhvTGg1ZndhbGdQaUVqcndXeDlnMmxR?=
 =?utf-8?B?dXR4MDRQZ2h4c1RKZUJITWtvVjZMa3pBUGFDL3Njb3FCTGNMUm9Qa1k4R1Nt?=
 =?utf-8?B?a1pWZGVNK3NXcHFnT0h5R0g2aDQvd2pMTGFvRW04eXJGdjVCWjNzNVRmbG1J?=
 =?utf-8?B?bTBiYy9MZkkrYXFzV1VWelFhaUtnZXlRNzJPcjF3MjNWL0lOODdpL0hUcWR6?=
 =?utf-8?B?d0ROQ2J5d21IdXFTN2dzS1lWbzUvQjdidWdOcGZ3eFA5MEszRDVtYndCK0tU?=
 =?utf-8?B?cm1QenEyYTcvaEtxNmFqUFNnalpadTFsZVVGUE1xd3diWmRkRHd6VENONllZ?=
 =?utf-8?B?Mzc1NzRvc0taQW9CNXR6eTNVK2s1cUhVSElBMkV1ZG9KelVTazhSWlBLeUU3?=
 =?utf-8?B?cGlKdzVHcjFqTDJJRURmM1NENXBMUWlZOHQ0MGttWmNWTmFhWEE1bTV0UFB5?=
 =?utf-8?B?NzRFWk1PYkgxejdaVC9KT3FQSVVLcTM0ZXJsbjg1STBwSmdScHJMUWYyQUpM?=
 =?utf-8?Q?YB5SAM61ioHqC7pCptFP9ZqGZ?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 485902ce-9c07-498d-ed09-08de02679db2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 10:28:38.7633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c3mO4DHkA9Q31xo/8MTh27T8Pa3u1/uyjqeU5ljszxQ5n+CCjGwJJfNLP2NN3qSt8wUOmvC1oBdLSG18p99ggA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4987

On Thu, Sep 18, 2025 at 10:51:58AM +0100, Frediano Ziglio wrote:
> Newer compiler can put some constant strings inside constant
> sections (.rodata.cstXX) instead of string sections (.rodata.str1.XX).
> This causes the produced live patch to not apply when such
> strings are produced.
> So treat the constant sections as string ones.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

