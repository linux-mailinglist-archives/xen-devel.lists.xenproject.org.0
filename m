Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 159DCC24F2E
	for <lists+xen-devel@lfdr.de>; Fri, 31 Oct 2025 13:14:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1154244.1484327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEo1a-0004gQ-8C; Fri, 31 Oct 2025 12:14:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1154244.1484327; Fri, 31 Oct 2025 12:14:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEo1a-0004dn-5W; Fri, 31 Oct 2025 12:14:34 +0000
Received: by outflank-mailman (input) for mailman id 1154244;
 Fri, 31 Oct 2025 12:14:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jqku=5I=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vEo1Y-0004dh-4i
 for xen-devel@lists.xenproject.org; Fri, 31 Oct 2025 12:14:32 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 261f8030-b653-11f0-980a-7dc792cee155;
 Fri, 31 Oct 2025 13:14:29 +0100 (CET)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by DM8PR03MB6213.namprd03.prod.outlook.com (2603:10b6:8:39::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Fri, 31 Oct
 2025 12:14:24 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 12:14:24 +0000
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
X-Inumbo-ID: 261f8030-b653-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q0Ep09GSjqHyCYn68OfLv0yxji0lDm9NBY2sp5avW+omNVIu/GmlzJf7EQsOcNfTQC0hq3wHthcEkZajU0L6yJeiOFiY1hF2w3jxS+SRvsfIp/pS7e7j6cz1eT9G9ttp6wkD/hA4u2JnWpCl6+Qu+98PcKBnLV8WdJ10CdOeOXkTxd7p4o05DDv33OC8BQjpx+lbMiLHCJUOeiJ6HdrRhDJduu+8UkjOsPZg+0Mt64m/dRwKzA2qe4d4wud4iYSWWEVHG5WDtLa9dMF84audBBCBmK5yNLgV4kY0oycCEw6aNtNOlgJT+4f+4M0Zkk+y3MVx3HjHuOdofq4dUmLbDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxKyPXADnKOjXRHFJGDriTZ/voC/jxTDpz6G0aEzp4w=;
 b=LckxKR50exJsU2zRP1Cn1nSjNeHdus7/ZOIhqaTMChbJYTgJiUH0a5sGLHlJiVizijFn7MmX4Ac2aJVqP0hHBL+NCiyTHJeCDB76AWepZDWIX2N9cWbOz0RZkf73i5f8CfvK+qioWOwezYphJDCXCAf6T7IB1ss4UV5N4S3iDmkgZiO7ny22kUf4rNM8dP+gpSDq1/HnQcrzUaGdtQenp8wpmA5T+R2uMohSBA4FU+jhy+SeU7KHneqa3vCPsDLPbdSFusWWsHgwoTbXrLgwnLGAlNZmrmLKIsyuXuIGeH/ckM8W3mwvnDfPGDneFn4RDNVRc7AE+wbUmPS3EQRGcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxKyPXADnKOjXRHFJGDriTZ/voC/jxTDpz6G0aEzp4w=;
 b=c7sRAIi5SBKZSwVt6Cp2F7XUMRfdN9BGV8kzaIOpRhlu8cLj6fqyXe4GOSB98pQDF69mzP+keTNOreN3KTi3CUbUylzX3KUAw71h/JaG8kOW3q85llx8jLPQg7DochjSxiv1m8r2ZWT3dU8MWhs3heggJQQIM/y5CdraIooyLNw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 31 Oct 2025 13:14:11 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2 for-4.21 0/2] x86/AMD: deal with RDSEED issues
Message-ID: <aQSoE8ugCKdNWy9C@Mac.lan>
References: <272093dc-c97c-434a-9977-ad1c26e7e229@suse.com>
 <aQSN3MKxAa_cltld@Mac.lan>
 <68e28e41-e835-4985-80a3-6a99b3d7dc3e@suse.com>
 <aQSVTjh5xiib-u5D@Mac.lan>
 <b7293f69-d9f8-4669-a1fd-eaa468445d68@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b7293f69-d9f8-4669-a1fd-eaa468445d68@suse.com>
X-ClientProxiedBy: PA7P264CA0235.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:372::13) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|DM8PR03MB6213:EE_
X-MS-Office365-Filtering-Correlation-Id: 507c94ce-5ecb-40d9-652f-08de1877024b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a0gxeXJ1bmxVNjFJVzF4anNwRmE2WStTL3lnenFYTGZyanE5MHpyNzBxcElm?=
 =?utf-8?B?eVRxRmRUUzhCK293MkNmc1NPcnhmMmV2Rk91Q1BUanJmSmhvQmpucUdPS3p5?=
 =?utf-8?B?UVZDVkNHSVZpSUJRR3Y4U29KckkrQkJLSFBKMkg4OGYyT21QTTZUaGY1a0lC?=
 =?utf-8?B?VkVTbnlBZjB6NDFSUWVhUU1JRzc3UTlBYmgyTk8wWmc4aHlPc3lTNGdSMFov?=
 =?utf-8?B?TVZEOTBBelZZMFk5Nm0xOExtdVl6V1NJWXJSZlNpSTdpcXMyT1hUcXhOeC9F?=
 =?utf-8?B?V3lWUUUyT0hLZ2lUOHR1Z01LWjFRbi9la0R4ZHhpamlIUmNhVlJLc3NTSlN3?=
 =?utf-8?B?eHJYZWphK1dtUmdoajg5WXMwRjcrMTNWaXZJN2hpWWNYMTYvbFh0eUhSME9N?=
 =?utf-8?B?MU9vdEZKOFd3akxWMTFDVkpzdkRpQkNMQTJIaExHcXd2ZEd1T0wvTzNIRXNq?=
 =?utf-8?B?cU05SjFiVGdzMzZYNFJrMFQ1WWtTd1dGTHNNa0c1TFIreU96dkQxaElHdEVB?=
 =?utf-8?B?UmxHMlF4RVNQcjk3RUlHaUpMSGdTQ3Jpdjk3YW5ESkFLZGtQK1pMWDFObFEv?=
 =?utf-8?B?UGJtUWhDeHd4YVZGMDd2U2wwNHI5TWZ4TVdzYzltNU9Cd1NBZm9ja0xNd1FT?=
 =?utf-8?B?b3pTTm9LT1czVlVFWFg1SWxPbUo1c1ZiVFZmOVVhN3gwTmRKVUxUbzhpQTFa?=
 =?utf-8?B?WnRGbHJwUmVQNW5USFpobkQxYjUvVFZJd2h1cDNndzRqK09qcUllNDVsb3JT?=
 =?utf-8?B?UVZkWFR3aEw2L2dZUUpuZDhyd2VEUDE4bDJpS0ZRdThwdDRBVUhUMTVZL0w5?=
 =?utf-8?B?S21zd2d4UzJsK01oR2F5UFZ1ZWVydDhlOUNTZ0ZxQkFsMUhJa2RhQVpXdHJa?=
 =?utf-8?B?TVhIcG9iRE5XK2NxdFpFVHVMQVBVcmhjbE9ITjVpdEIrY1V6cXREUVg0QUlJ?=
 =?utf-8?B?VjR4aXNZY1lxaWIrcStPcWpSZ2I3VXBYYmVpN1BPZUEwZzlTL0RBZG5nZmNj?=
 =?utf-8?B?Q2FpMjI2Z0VlTDV2T0I4K3RsSzhwdzFiRHVJWlZaVkMya1JDbk9BMmFIcXkw?=
 =?utf-8?B?RUFhVjloWFpEejBSbG13empvVDlyb25kZS8wNW94MkJIVWpwVXgyL1h1NGF1?=
 =?utf-8?B?SDVxckF2T0pBVVl5aW8vODJBL2ExK25RWEVRbjFHQ2JmOUpvWitGU3phZnBx?=
 =?utf-8?B?eUtYVDlDRTR2SURWTHFrR25vcGFZQ1RHL3hrM3gyaG5PSnB5K2NsMWZSR0VZ?=
 =?utf-8?B?YUtsUXcxaWN1SkZmZWNNTFFhSWJnSnVFR3l1b0VOQVhlcDJZR0VOUklKK3FI?=
 =?utf-8?B?c2RsREtYMGZwc1RhTXJSd252am13VlBncVZnRkdMdkhIdmRxdDIzOTZNclYy?=
 =?utf-8?B?ZkVKSUVzQnFMazFhOUJLblZlMVhZYmx4TU9pdVJZNU8rdTJRWi80ZmljMlRG?=
 =?utf-8?B?WWxtSytPS3lYUWdPTVZ0eFo0ZnNjNi85T0xIemFpRGE5clBjeFpnN3NPK09l?=
 =?utf-8?B?R2pvZjJJeURuQXBjVFN2b0dveWNIMk5yRldES3lUdUllWXpJc3h2YU05TmpM?=
 =?utf-8?B?YXA1S1hIeDEybG8wbmllS0loOCtXaTBLc1hZZUFXQmg1aHR3WXJ0UmR3cnJz?=
 =?utf-8?B?Y2tRRUk3Nk5xVjBGOERubDhhZjhBYlNIUXdDSTl3cDNQVnk3MjNLdzRUMWZB?=
 =?utf-8?B?QjVUMHVUV2dPb21OKzBwbUh6UVhqT2IyVzZoakIwWk1QN0NjMUlvd2w1USs3?=
 =?utf-8?B?S0F3UXdyYm5FYUM3TXZ6WHZ1RWx2RitteC8zZlF6UTkxbFU4SDNUcHVCcU96?=
 =?utf-8?B?R2g0VG1pcFFJdDdqQWxvbmZFVDFsQndTbzJsQXE3R25pOXE2VjdBSHp4Nnoy?=
 =?utf-8?B?ZERPdUYxNEpXcmFuc2dqRU93eWtaNHlyRFZlTEEzVCtnNTQ1VFBLOEpoY1Ji?=
 =?utf-8?Q?/8qqVi3v7LS28C4NcsfWUDkBhEsweGjd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzhlL081MFNPQk9wNlk2eCtFd1hQZ0xyWHVRUkwzbm52T2VqUU8rLzFKRklo?=
 =?utf-8?B?WGplVjU5bGJvbVhwTDRlTFdwNU5mODcyM0xYbGYzUkViaVkzMno1LzNaU0xM?=
 =?utf-8?B?Nm5pQnBOMVZNbXZLMkhaR3lnVmtsRHh2d2l5SGJKNktZd3FvSVNBU3BDdHp2?=
 =?utf-8?B?VGdOZmNiTVlOK0dFSzFsRVlsOEt2UWJJTjhpM0RQRnJXWUN5aGV5ejRVSFV1?=
 =?utf-8?B?bS9tSk9ZTXVDb2pXT0EzUk0yS1phOVNXczZrZFhaZVMxNjdUa0dCalpvSmRT?=
 =?utf-8?B?N0kwT0NUUGVldHlIVDdSbTNBcnpUUC8rbCtydkxFM0dSNGNXUE1sYXJxZXcx?=
 =?utf-8?B?My9yalBORlgxbCtLNHNzc3RNcHQ5RGNZZndzZDJxRjI3WERsWmdBMDFBYjk4?=
 =?utf-8?B?Szk0UE05VTlHQS9lT1VhK3ZMYWVzTEtrazBxOWVXeGNyQjNrdDVzUHdIS1lI?=
 =?utf-8?B?UG1rMElGNDlKY3ZmY2JKM0xNTUpKcGJmVktXYVJMVldPVTk1ZHZjNGFQZ0Zp?=
 =?utf-8?B?L1VYZlNyWFl5TVd6YkliV05jaW5nbWhVemhOMWp1Wmd5UFk1ZXdpNlhIQnNj?=
 =?utf-8?B?YWJyTncyalRNU0Q0aGJoVi85OFJuVkllK0JtUEk3L0czZjhvNWphcWs5d3RW?=
 =?utf-8?B?czFTQUdkYXdxZDZlY21HTXlNaGs2T1BDNmhHc3FkcGVJTUpMNFl1M3g0S1Fh?=
 =?utf-8?B?RXl4ajdzMEZkS0JsRkFNbng4SXo5SnN4L2hmZC9sd2Nma0VJeWRyUzc2enZP?=
 =?utf-8?B?MUJTdkd4NTAyYmV0d0JnUnBHUUZBSGdXVWRHS2tBSXEvaHB2WjhkRTE4QlNX?=
 =?utf-8?B?VVdzd294RUxFbzl0N3ZFMStpQkFLSm91SWNacXZSNGsvVnlUNlVnNG4vcnZx?=
 =?utf-8?B?R3BmSFpDZVE2UThnOU5UNHllaENmMVVtMXpjRldIdVJuWC80QUVZczhDNElI?=
 =?utf-8?B?Rjljam9TcXRUWTd5Tis3bjdrOWRSWFNJUFZxUTdyQUR5aUx1aDZJOUJoS1Y5?=
 =?utf-8?B?S3h3Q1IrSFZuTHM4c2JlNXpoT2pFNE5MUEp4cW51aXZJZlNHcHlGdmpQemNK?=
 =?utf-8?B?TEx2Si9OZWZJMUlsSm1TNGtyR1lwVjVYWUd3Z2ozQ2c4UEMxSkg1TXJqb01j?=
 =?utf-8?B?YWM3ZUxJOER5QlBZRzN4aFJIcit3M2hIY096TGxqK3d2YWlQMFZXVzZQOEpD?=
 =?utf-8?B?UkhWYmwxZW9YN28rZzIrYWE3VWowc1ZFa2k0b3NYdXpaSHFoUFRWekY0eUdm?=
 =?utf-8?B?bFRwSkpyb3pRcFRuTDQ5bXhhK29hTVY2VHNWU2NUdlo5UEd3K05mV2lkN25j?=
 =?utf-8?B?R2RVTjNoUVhha0kyZjhELytPTFdJMENPc2FSc3M4Z0ZnN3JIakxPZnlSTFlT?=
 =?utf-8?B?RXdPWEhObW4wTjdsWjdlbG9MT0xTZzU2WFpZSTBOcXJZZi9IdE5BZjcwSnh1?=
 =?utf-8?B?YXl0MWJ3YzNFMHFpRnlhRDQvVUtSTVl3VnF3Ti8wRUxNaEZYL3YxTFZpeUx3?=
 =?utf-8?B?YU1HM0xVZ1c4RlVRMk5qQm52SVhvY0Jqd1U3a3kvOHlXVEp6cGJQaHdEOVI0?=
 =?utf-8?B?UXJoQXdpY3B2dTVmNXJYcnJrelBJQ1lnNHY0THhOTE04YUNBT0hleXUydUho?=
 =?utf-8?B?SjczaFAwbjZITUlzUjJxb0l1TkRaU1V5Nk92VldMT20xUkNweTZYVEVZU2dK?=
 =?utf-8?B?blFsUnNMWnBQRS8xcDVxYmwxUG4xV25uNHY4RUxML0M0dFlTejdkMXZNakhK?=
 =?utf-8?B?cjh2bnNrU1ZZdkZuRGNOZ0gzdFlaUTkrUDN3cHdaVTQ3RW5wVEpvMm1kc0Vw?=
 =?utf-8?B?NWlON2kyQ1p0bmJSMXZIOG9XSDRjVHhRUEFsakxRdmdudHBBSWt6MTF4NjU3?=
 =?utf-8?B?NHp2SEpGOXZnYTMvT0pPTUVSWi9SYVNudkxmZUhGWkpVWHlqYTN5QjFpcGlY?=
 =?utf-8?B?czFBSG5vamNIVEY5NzRwKzU2NXNFekZENE9SSXhSSllWeExPQVJkdHV2Z1Z2?=
 =?utf-8?B?Um45MlhBQkh6WG5ic0w3Zm43RDJVVnpveGsxekloSnJuNDU3ci80eEJvS2g1?=
 =?utf-8?B?aG83VkpuZ20rdE5OQVppa1pwZS9LY3dJdE5rbXd6TUpCTktrRWpIcjhGZmxB?=
 =?utf-8?Q?DE7EHxH9/NIgiJyTBU7tDhU3B?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 507c94ce-5ecb-40d9-652f-08de1877024b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 12:14:24.3385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YILfKEHT9v2Z9TqAitdp1N8y//LtIaKcSG1GF182LU+DSF4YfleY2cW5xSxURT41palO3y33CTg+2lgkTQKtug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR03MB6213

On Fri, Oct 31, 2025 at 12:47:51PM +0100, Jan Beulich wrote:
> On 31.10.2025 11:54, Roger Pau Monné wrote:
> > On Fri, Oct 31, 2025 at 11:29:44AM +0100, Jan Beulich wrote:
> >> On 31.10.2025 11:22, Roger Pau Monné wrote:
> >>> On Tue, Oct 28, 2025 at 04:32:17PM +0100, Jan Beulich wrote:
> >>>> Both patches also want 'x86/CPU: extend is_forced_cpu_cap()'s "reach"' in
> >>>> place.
> >>>>
> >>>> 1: disable RDSEED on Fam17 model 47 stepping 0
> >>>> 2: disable RDSEED on most of Zen5
> >>>
> >>> For both patches: don't we need to set the feature in the max policy
> >>> to allow for incoming migrations of guests that have already seen the
> >>> feature?
> >>
> >> No, such guests should not run on affected hosts (unless overrides are in place),
> >> or else they'd face sudden malfunction of RDSEED. If an override was in place on
> >> the source host, an override will also need to be put in place on the destination
> >> one.
> > 
> > But they may be malfunctioning before already, if started on a
> > vulnerable hosts without this fix and having seen RDSEED?
> 
> Yes. But there could also be ones coming from good hosts. Imo ...
> 
> > IMO after this fix is applied you should do pool leveling, at which
> > point RDSEED shouldn't be advertised anymore.  Having the feature in
> > the max policy allows to evacuate running guests while updating the
> > pool.  Otherwise those existing guests would be stuck to run on
> > non-updated hosts.
> 
> ... we need to err on the side of caution.

While I understand your concerns, this would cause failures in the
upgrade and migration model used by both XCP-ng and XenServer at
least, as it could prevent eviction of running VMs to updated hosts.

At a minimum we would need an option to allow the feature to be set on
the max policy.  Overall I think safety of migration (in this specific
regard) should be enforced by the toolstack (or orchestration layer),
rather than the hypervisor itself.  The hypervisor can reject
incompatible policies, but should leave the rest of the decisions to
higher layers as it doesn't have enough knowledge.

Thanks, Roger.

