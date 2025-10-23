Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 276A4C03E13
	for <lists+xen-devel@lfdr.de>; Fri, 24 Oct 2025 01:46:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149778.1481279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vC50O-0008EH-Ld; Thu, 23 Oct 2025 23:46:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149778.1481279; Thu, 23 Oct 2025 23:46:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vC50O-0008Av-J0; Thu, 23 Oct 2025 23:46:04 +0000
Received: by outflank-mailman (input) for mailman id 1149778;
 Thu, 23 Oct 2025 23:46:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ct/T=5A=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vC50N-0008Ap-BN
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 23:46:03 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ded15d7-b06a-11f0-9d15-b5c5bf9af7f9;
 Fri, 24 Oct 2025 01:46:02 +0200 (CEST)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 MN2PR03MB5183.namprd03.prod.outlook.com (2603:10b6:208:19e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 23:45:56 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 23:45:56 +0000
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
X-Inumbo-ID: 6ded15d7-b06a-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qT492TYZAVLB8GgBOxtl4adiTkrJn8KKfasUMJs5ON2UkMdYaGwWSmIlw+bl5x6lLnpBL1yv09GlKE3Jxmbw1Gz73YXh0uls5xyFZBRnVXWLgT4UvuJwnFUO1Jkf1XQYtkH5Ovu+DX60t7pKvXS9Uf6Hcq/1YOGuFgzZu9OjE+j2qBPJbl6o78wL7ahZUbpwUDcz5xeSgYPzHG9dSDXrvbRdkHbkDG88LLPUEZtainSPkfWshSgdMTOcVvBNIlFN1ahvKi03P0sTClx8Gp9zcCR39rPpTTDjFg3k6DL4ie3y18qsfHQG+VnoUEKatIGrbvxL9Im1O/O2n3lxKLbGKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sfiaqGUD8Ep+N6lp00WKhZ9MkCPJDxDmGXtlKRUfxBM=;
 b=Q+FZgRXsDaNs9s2dfEybwzSemA72IHmeJQRPgu55Qsn7cJ4UhYtXwgq8sfa0uygsX0prYc5yD+J92ko5ZBNPSCk6Axqf9zP6V8kFFGSzceWTHKbCWv5v0dJEtLmBxukhsuTLcqfu22xnn/eMW1UPuRb+EsvVF2mBi1zGWqs4UT7f/C3H0LKS03zQIbqxTBexXYRpObBwVttXHkhxre0fGjxRxs2sEbc2dBqoEdAzMa6DSY/BWIpD16O1mNq6BJUzE2JTkVyuW1HKGl9dR9WBpYiZ0hxeGgLCcauGe5WKLKjiwYgxdihNYhp9T8GdMrU8FNb9ux3W2S5aMH3u48T6RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfiaqGUD8Ep+N6lp00WKhZ9MkCPJDxDmGXtlKRUfxBM=;
 b=eAfCNUFMRP94s2zy4JGjkC8V1T/OWGBQYhST7Ut33dK/5cIIPzTMUUcePpKO4CGDeLf/4+6cQ2/ez/l1eyhRzVZ+ww9dZB/5Aeo/PQkwytTsjNoCmWMcY+wcAH5+RFROViAmGKxGX9E/XP/aF0XK60mCi7MYKNmTrXe1DbzUg/k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f61d5a29-04f0-44cc-bef6-de05f240bbc8@citrix.com>
Date: Fri, 24 Oct 2025 00:45:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Support of building Xen with Clang/LLVM on Arm?
To: Saman Dehghan <samaan.dehghan@gmail.com>, xen-devel@lists.xenproject.org
Cc: Wentao Zhang <wentaoz5@illinois.edu>
References: <20251023233408.16245-1-samaan.dehghan@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251023233408.16245-1-samaan.dehghan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0063.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::14) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|MN2PR03MB5183:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ab2406c-2c3b-4a7c-86bc-08de128e4fac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ekxVNjFEYTFROVRZNC8vMWNzTVd0cHVCbWRpVHRDb2N0MjFERVRNOE9HeGVk?=
 =?utf-8?B?dWFxRmRlcTV3Ykp5aGhpNXZyKzkyVnlQcHpCME1yb2pQTlRYZjdsak16RTk4?=
 =?utf-8?B?bHRhOFZGaUVxTjBzODBSSVJYZmxRcFU5dEU5YmVEUXRqL2hBeTR3MThjUjdB?=
 =?utf-8?B?azZJUWZ6TDd1azI4ZlRMTTBhVmcrb0puSmxMYjNTQXg3M2wvYngzTDh5SjJ1?=
 =?utf-8?B?VVBkSkJnUGZ2eW14ZDRRUUFaT2NOTmRlYURza3ZvL3c0dnZaZGN2L3RxK0k3?=
 =?utf-8?B?WmExU3RBSHltdGtyZTZLU01aSkdwK0VEU2t0d0VPL2pqMzZ1VjdhUmVBRmJU?=
 =?utf-8?B?YnB3U3EzSVlnWllBWUFub0FuMGdZcGhLNUxYZ2dUcWpHUGdqR0NwMVl6NmRR?=
 =?utf-8?B?RjRURVc2RWtzNllhYXJwRHFuWUlEOWZSekN0dUdSOWlDY3BSMVBDYzV2TnlS?=
 =?utf-8?B?VWsvVXl4VklJdU1TS0Y5T0pJWkFad2s1bGgrcVUyNkhlVlZuaFh6TSt6aERY?=
 =?utf-8?B?ZU9ZTXY4WGlOU2EwSkJPamtMNnhybUIrNW9uWnpIOUxFUXljc3JDald6aGZC?=
 =?utf-8?B?eTVnMlBkQ1NLT1RXUGRJMjNpZXJjcEdWN0tYcGpyTjBHaVZVWVMvdWJrLzBp?=
 =?utf-8?B?ZWo0MTZJZFVqWXp0dHozYUt0aFdjWDhLV0N1ckc3N2lKZDNUSE9pMnNhYjZ5?=
 =?utf-8?B?ZDhqMUpxd0RlN0pYb0FkKzVjR20xWkhtOGszRm50Rm1pdks3a1BMQ0pJeUVM?=
 =?utf-8?B?ZnEzeDNkMGZ5dEUzOGFvQnQ3Y3l2dXlzenFpZnJUbzdjaDhQam5qUmhVM3lZ?=
 =?utf-8?B?dk96RzlDek1KS3pSOTFpOUZZaHdpNjVSQUZzNzJHV21pWE1YTUNCQjdFUzhS?=
 =?utf-8?B?RFJiK1F4WmpoL0lPeEZodWx3N1dkOXd3bFAycEd0VE43ZTVvVnVmeHNmV2Fy?=
 =?utf-8?B?bnlzNUpUTVZMSXA2OE5tMGw5WDNkckwzdE9HMGY3a3NnZm9EanZyTFFPbnMx?=
 =?utf-8?B?UWg1dzJSRVFsTFQxaitONk5Wa25uL1VCUVRSZkdkOGJCbmdGNGluQ3N5cHpB?=
 =?utf-8?B?MGhsVzZzaHhJZTdJSjVTTlJQSUJCdnBWTEpPRmdINTU2ZU5wTlllS1Rhb2Y5?=
 =?utf-8?B?SHR6L1lQY1c1b1VQWjRSZzRzanZUa2JiQXJwWmV5dk5CanNubjhvVEFmbEF5?=
 =?utf-8?B?Q0Q0QjhKVitXaGMvVUlLOWlJZ2RmYWFTUWpRZXRzODRMMmJCcWtnd1dEV3JC?=
 =?utf-8?B?ajlDdVdFS01ROFBHcldqdTI1MldOQXNiQ01CUGt3ZEZZSTZLRTI0NDZwOVVz?=
 =?utf-8?B?Y0ROQjBmQlRwM0k1QVNXSnk0MW1WVzRwRzJRRWY3Q0UwTG1iSm1QeVZGTmFt?=
 =?utf-8?B?UnVQdEh1SGlIaFIwUFpzeXZ3Z0duNTAwTnZ3a1kyK0k4OWpESW9CeGloZ1V5?=
 =?utf-8?B?eGhLUXQ1N3pSd0RqdXUyVUl4UEMzR3RVWE9abnY0VjRGR3ZEWEs3elBBSXU2?=
 =?utf-8?B?Q1pSTGhFNm1vRHpnSUF1SjVaLzM4M2hwbUk1c3p1c285ZVJnMHF3WjVJak54?=
 =?utf-8?B?MG96UzAvUVpiaG1UNEQ4b2o4MmtnZG9iZjhuVE43N2RJREZBMGtSVnVlS0dQ?=
 =?utf-8?B?cWhrR25TVUJKaG9SR216Rzc0NHFEbjlSUHdiS3BiWmNmeTFuUnBrWmhQZzd4?=
 =?utf-8?B?bFREbmZ3MVhJVkNvNTFadzlJNXBWVStiQ25SeFVlTVJkeC9PcnZ5a3ZuYTNh?=
 =?utf-8?B?VHNITUs0ZUJpcVpYZEdMaS9XekZSYklDWjlUcmo4b0pxQ3hPY3RVR1dKTXda?=
 =?utf-8?B?NzlCN3h1UHVZRW1OOUNNeEN1Y211ZHBFNm8wcHJSV3FWczhydGVzSEhGTGM0?=
 =?utf-8?B?SWpDTDZ5cHRyYlp5NXEydjJQMHhtZWw3Ni82RXk0bzZRUGswWitueGVIb2hG?=
 =?utf-8?B?WUlrdk5QNUkvT1N5a2pjeG5pZXcvcE42bkRaenNVNGVRTTQxYjQ0NUlFZnFr?=
 =?utf-8?B?dzFsRHZraXlnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3Q3MzNjQUhuTFZpS0h6MnZpYXRvTDZrVDFRS1dTTEpONktrTzhwOFlSUFhw?=
 =?utf-8?B?aHp3c05QZ2dPNnZDcmdGSDJrMkRZSFB5YzdoSWtPQjhRK09RclllR0ZQQ3d4?=
 =?utf-8?B?aFNPRStNSWpjRHZjaGgxcUdkWTZJVUxUbWlCMUE5aEdpTERNbVgyQTRKdXpt?=
 =?utf-8?B?L1RIYWx6YTlnK21MZUE1THVVckdZQmV3YUw3NkFlRy9SejU4S3hmWXg3R1Fr?=
 =?utf-8?B?UysrOEZpRHY2QjRFZnNGcDA0TGlpK1VGRVhQQTZpYVVVaW0wdFpzYXNLaTZa?=
 =?utf-8?B?aUwvc1dlQjdSSi9FL29ldUlwMkRpb1pJWEpNVHlVczIrUHNBTjVtN0x5WWdB?=
 =?utf-8?B?UEJLV0drUGZCNzJFZm5uK01sRkk0VTJZUDNOVC9adENLTy8xZ2p6N1BzS04w?=
 =?utf-8?B?TDhMWDlLb0ZIYWFnUTdNSmQwZmt2R1JaUXBrcEw0aXBQZzJEV3F4YXBsT2N6?=
 =?utf-8?B?MjlVbndqdHAxT3YzUmRxSzBrWlo5OURpUHVGQ3lkUDJHS2hKaU1xUU9xVi82?=
 =?utf-8?B?TGt0dUtVcWFJWituK0hjR1phRjhRbXd4aU5jeC8xUTRPS3k5akc5NkFLNHJm?=
 =?utf-8?B?MkI2WTdrNUYxancyYU1VL3BiNC9vZnRaWW4ycGxVN3B2Zmg4SnpxQWxKeDU2?=
 =?utf-8?B?VTR2R3BnbDBUVngvL1lTb0lRbmpEekxIblNMWExSb3JtMDE1ZHAwa2xmNGow?=
 =?utf-8?B?U2Z0MkVxNmgyTlZBaHFZZmlDWkNMOTJreWZWZUZQdlE1NWVabnloajBucmJI?=
 =?utf-8?B?cXFOVUlJRThsRG9uaFRkNzlBVGM2S0xTN1dEa0p0Q0NiMjh3ZjV6VzRBRXRK?=
 =?utf-8?B?N1FFSDNLbWFRbXZYSTk5MFFVRHhjNHpKZXh3c0VTTWVTVlFUcDJjTnVUWklR?=
 =?utf-8?B?RGhVak0vdXhuSHYvU01BRFkvMGxLcmhmVkpmWW5UNEVwcSszSVQrU1FWZ2cr?=
 =?utf-8?B?Q0tieXNVcnM4NFMwazVpVWFaV3VrbWpIQ1NBTTd0SVREWWFUY1FXQjFQT25G?=
 =?utf-8?B?ZzRoS3h1S2pLa1RhZUI5MUZGYnpsaUNqcGgzVUZoMU5WcS9RQWFLYUtnWUpV?=
 =?utf-8?B?NDBRdVJiWUoySm9iUFNwblEwRFZvUk5XZTFGZGw3RkVtNE8vcmxDV0dQZHhk?=
 =?utf-8?B?MDQ3TythWGQ3M2wvcXRSd3dXclR3YldYYzdKbTR3WmdXTWp3SndZcmRrYTJk?=
 =?utf-8?B?T2xtZ0J6WHUrT0k1b1I4YkVtcFNlS1VvZ3pmdDFIZHppN3lrek9KbDVDWFBk?=
 =?utf-8?B?VUNpNGhJOGtsT0h5b1JHaVlxQlNIK3RBRUhuc3lrVDJwL0dQWVMya0pGK2du?=
 =?utf-8?B?S0ZTRm04UDNCS3pBV1hhVEZDR2FucUFBaDloS3FyWWdNdGxldjBMZ2JwSUNC?=
 =?utf-8?B?M09uRE1BTVlCS2NlUStWN1Z5UWJKaktkKzNYUVNaRU5jaC9aZkpzemZtTFM1?=
 =?utf-8?B?dDJ0cnpPTVJOZTNPaVBJVVdlampOTTNOQkVpM0RCeVhJNUVqcVJlVkh5OHJO?=
 =?utf-8?B?dXhKenAwZmppcGtpRXUyWVUyNG5FZW9yNm14cFJ2UkhRVXVFSmpHblBvcGM3?=
 =?utf-8?B?VStZNkgwb2daVVM1QTY2WlN3WElIcmtaZzExRWdDd0llMDUwdEQ1Tm1ieHpS?=
 =?utf-8?B?bjN1bjRhbkRSNFd6YWVwNkhUNFMyajBFczFmVkI5ZS9PZGFUaWNDR0s0K0Rm?=
 =?utf-8?B?TlpyL3JrdUxMM29YcW42MndtUWZSWXFIWDRQakJDaHBFQXI0a2VnOGJWd2Q2?=
 =?utf-8?B?NUkrckdOb1FHRzVUWWsyU0VLWUJlZU5ZaTM0SUw0MmMzZS9HSGlBd0dtdXpx?=
 =?utf-8?B?Mi9qTW5TMGRSTmh5RVR1eWF6Zno3NzA3L3BsVG9MdE5tZXpEVzVqZ1NJU1gr?=
 =?utf-8?B?WGRkeklsM0NUNGVINGw0ZytFeVc4WDBSc1dHbnIvSThzN1lBeTYralRxVmdD?=
 =?utf-8?B?NUp5REcrY1U0dEt3SERYQWxHa3JjcFNFeTRMT1B5Z3Y5TndRbHF3SDdlaFQ0?=
 =?utf-8?B?QUIxVlYzWk5VMVhScUpJRVVwVk0rYitMQUU4TDdzY2dzNElsWEY4d0VqQm9k?=
 =?utf-8?B?RmhtaEd5UzdnYTI4OXkxbWFuZkF4d29VSi81cWp0KytHSjJDdG50MTJhc3Za?=
 =?utf-8?B?RGVTMXR3ZGppRWdxT0ErU09heUpnUFEwWjZ4N1BSUTYzZ2dpeFROWlMvMHZa?=
 =?utf-8?B?OFE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ab2406c-2c3b-4a7c-86bc-08de128e4fac
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 23:45:56.6270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: siAGUO4axSS03hwxV784F/ZrfdBkSXcIbSvA0CpFE5p6rADh01d9Rh09RoMhNY3A3A03LDmRdQyb0/MHy/6JtU8tpoH4Zt5jtCbcVrKDw/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5183

On 24/10/2025 12:34 am, Saman Dehghan wrote:
> Hi xen-devel,
>
> When preparing and testing another of my patch for LLVM coverage [1], I
> encountered a few problems with Clang/LLVM build on ARM 64 platforms.
>
> The first two are clang errors.
>
> I observe the following errors when building the Xen master branch
> for ARM 64 with Clang 19 and 20. If I comment out 
> "CFLAGS-$(CONFIG_ARM_64) += -mgeneral-regs-only" in "xen/arch/arm/arch.mk"
> the error is gone but the build fails during linking (see the third). 
>
> Error message:
>
> arch/arm/arm64/vfp.c:9:18: error: instruction requires: fp-armv8  
>     9 |     asm volatile("stp q0, q1, [%1, #16 * 0]\n\t"          
>       |                  ^                                        
> <inline asm>:1:2: note: instantiated into assembly here           
>     1 |         stp q0, q1, [x8, #16 * 0]                        
>       |         ^                                                 
> arch/arm/arm64/vfp.c:9:46: error: instruction requires: fp-armv8                                                                    
>     9 |     asm volatile("stp q0, q1, [%1, #16 * 0]\n\t"          
>       |                                              ^            
> <inline asm>:2:2: note: instantiated into assembly here           
>     2 |         stp q2, q3, [x8, #16 * 2]                         
>       |         ^                                                 
> arch/arm/arm64/vfp.c:10:46: error: instruction requires: fp-armv8
>    10 |                  "stp q2, q3, [%1, #16 * 2]\n\t"          
>       |                                              ^           
> <inline asm>:3:2: note: instantiated into assembly here
>     3 |         stp q4, q5, [x8, #16 * 4]
>       |         ^
> arch/arm/arm64/vfp.c:11:46: error: instruction requires: fp-armv8
>    11 |                  "stp q4, q5, [%1, #16 * 4]\n\t"
>       |                                              ^
> <inline asm>:4:2: note: instantiated into assembly here
>     4 |         stp q6, q7, [x8, #16 * 6]
>       |         ^
> arch/arm/arm64/vfp.c:12:46: error: instruction requires: fp-armv8
>    12 |                  "stp q6, q7, [%1, #16 * 6]\n\t"
>       |                                              ^
> <inline asm>:5:2: note: instantiated into assembly here
>     5 |         stp q8, q9, [x8, #16 * 8]
>       |         ^
> arch/arm/arm64/vfp.c:13:46: error: instruction requires: fp-armv8
>    13 |                  "stp q8, q9, [%1, #16 * 8]\n\t"
>       |                                              ^
> <inline asm>:6:2: note: instantiated into assembly here
>     6 |         stp q10, q11, [x8, #16 * 10]
>       |         ^
>
> Reprroduction steps:
>
> $ git clone https://xenbits.xen.org/git-http/xen
> $ cd xen
> $ git checkout eff32008be0d2718d32d60245650ff6f88fb3d13
> $ make -C xen menuconfig clang=y
> $ make xen clang=y
>
> Tested with the following setup:
>
> - Clang version: Ubuntu clang version 19.1.1 (1ubuntu1~24.04.2)
> - Host: Ubuntu 24.04.3 LTS /  aarch64
>
> Second, for Clang 18 or below there are another set of errors despite
> commenting out the "-mgeneral-regs-only" flag:
>
> arch/arm/arm64/mmu/head.S:288:13: error: expected writable system register or pstate
>         msr TTBR0_EL2, x4
>             ^
> arch/arm/arm64/mmu/head.S:509:13: error: expected writable system register or pstate
>         msr TTBR0_EL2, x0
>             ^
>
> Tested with:
>
> - Clang version: Ubuntu clang version 18.1.3 (1ubuntu1)
> - Host: Ubuntu 24.04.3 LTS /  aarch64
>
> This works with GCC. It also works with Clang on x86 builds.
>
> Third, if I specify "LD=ld.lld" with Clang 19 and 20 after commenting out
> the "-mgeneral-regs-only" flag. I got this linking error:
>
> ld.lld: error: common/device-tree/static-evtchn.init.o:(.rodata.str): offset is outside the section
>
> As I read from the project README, under "C compiler and linker - For ARM",
> only GCC is listed. So my general question is whether Xen supports building
> with Clang/LLVM on ARM platforms.
>
> Let me know if you need more details or a patch attempt.

Clang/LLVM is only supported for x86.

Personally I think the other architectures would benefit from using both
compilers, but it's up to the relevant maintainers.

~Andrew

