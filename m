Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NF4LjtHBGp2GgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 11:41:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A28530D26
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 11:41:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307741.1579329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN65T-0000sA-ED; Wed, 13 May 2026 09:41:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307741.1579329; Wed, 13 May 2026 09:41:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN65T-0000p7-BE; Wed, 13 May 2026 09:41:07 +0000
Received: by outflank-mailman (input) for mailman id 1307741;
 Wed, 13 May 2026 09:41:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1wN65R-0000ox-ID
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 09:41:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wN65Q-009eUs-RR
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 11:41:04 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6a044720-2eae-0a2a0a5409dd-0a2a4501bc6c-44
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 11:41:04 +0200
Received: from [52.101.70.127]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6a044730-c1f2-0a2a45010019-3465467fe088-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 11:41:04 +0200
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by AS8PR03MB7671.eurprd03.prod.outlook.com (2603:10a6:20b:401::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Wed, 13 May
 2026 09:41:02 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%4]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 09:41:02 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CDbaWv79hCwMPQtNj4o4+iWSgf+Ef/Q8C2bExvuVDnO3KOD/mpBypoXXs4GorFqzMDsEZS7eRNWGIj+1Z8qdDIha5iepGz5azywyJumzyHBQo4WTbw7LriLdTbCoVupQKkKh4KdVpbGdmrj/mbxaCcogqzpw052gzeAFLg6jKtsBIfm06hXMtOk9mZ4eyG4JoMVJyhjnO7+bZP5YI/334wNIlumRlYVDFzkyFbwEaC8Ph8tbRTN+I2HlMaLMl3Rj6MstjoW3WYQYMkuwKB2QUjJt40UPUqRBwWeFV5XOY0+k1QNqySSQvgNm2iB0hB3Y6M1baXs91Qt4+agQQSjAOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9jFPrXpRbrfrR/muoX+iMH2iK5Y9JkVdH1twkdQ0HrY=;
 b=DcAEBFbfhk05he+Jm7+MQMjMosF6+VFIbxuDsgnOXEoBxqpQd6NIk3reNIafSOD1uzMPH0ps7mV7luVo9jny7SPXZCivMYvElFuCz69LodRamP0YPh8XXWa/mEJcbmJKtHnWQqZ7zf5xvW6VggJT5NyE0aDxyeaw4x3KVn/DnnlO3kOJR8jNNBXk3JfSSDHCEuvObXvbJdgaJRSpFLZTPW28t8btHQkJrPu0H+sLgkbdy6Q+R0U6vkU8sj1syVL1qAmxQDG0WxD60qw94VyvnYg32uxSkPlhbQDFrYKpVyBTE7UXQLTE2MedyxCkEKM1gMRSULnvl9MjAwB2f37hNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jFPrXpRbrfrR/muoX+iMH2iK5Y9JkVdH1twkdQ0HrY=;
 b=m1C8EMQtdPAuPdKXbSGQBOgjNepvrz68RhYFf0GGX1Lede5RuF8JP7w97tkVFuYnkaDxQNv1v+Pl1cyIwUfRMRCoHLsebbwdCjnkw2bxDX5E3bgMDrRXoD6dZ4kF0SceDzvbWxIrDikA0YjabWTFj7S6MEtnWqgr8EREyha9TqHvcW7R0QPx06uzemaYD46Rbd69eBxCsGxzLMOASGt1CD5hvhWcgPSl6HCODrhac8CcvLwCmDtUZ0DfBho499pzwgZ/vzy37CZjMVpg+4JkZt2TmCvApHmuMGF4lZ/U72vZa2s0kHoB8Y6jLhBU0O2KgtCDUcLgSabo23jig1Wijg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <dd4ff55e-dced-4146-a2e7-e5819f0a1448@epam.com>
Date: Wed, 13 May 2026 11:41:00 +0200
User-Agent: Mozilla Thunderbird
From: Milan Djokic <milan_djokic@epam.com>
Subject: Re: [PATCH v3 07/23] xen/arm: vIOMMU: Add cmdline boot option "viommu
 = <string>"
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Rahul Singh <Rahul.Singh@arm.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <5d86efa38ca99439153822fa19064bda6843fdc2.1774918270.git.milan_djokic@epam.com>
 <461C3828-5BCB-4F53-9B39-AB7FC8517039@arm.com>
Content-Language: en-US
In-Reply-To: <461C3828-5BCB-4F53-9B39-AB7FC8517039@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P191CA0007.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::17) To AS2PR03MB9587.eurprd03.prod.outlook.com
 (2603:10a6:20b:595::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB9587:EE_|AS8PR03MB7671:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b07a8a8-98e6-403c-f102-08deb0d3befd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|18002099003|56012099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	Km4HFbYX9pprWvUP4yYzWBVQMYbRz6ojL4qMSOk0SWqXSsDbnoqC6teUdavA/ldWuoe+xUUI1B/bR6NhKeVdOT4a5XJwQbDyKI98mcvIH2ie90czf5BkcyVxb5rNXV8UB/q3ogVkrAPurkBFMcaC9MQWREUJn2YCzDYmlKA1r1RM/gFZUBg/cLdrNVNRXlOysLcjVSeMvDlmsWq29l236qhYsgASCrgAP+WfLOJ+ZSDHU9hBeq3WUzBpE35pPtictnxQwOHR3N1w4XYO4yNraJVE9mQO1QeBhuhmaKL3xUiC+m5c12YejXo3HliNpJfWn9GuQ4dQzl6Nkn1xwIcoS/Udx7AVIM417vu65dhqB+RWyXGzGMajAAX4hNBLPRsECJgVFoEDi7un6+1oIRW5dJV4kJpsgx5dWLNvJV+lzOL6iubVFZZcPRrhS2B2x50TWAsYHCvqRln6Je2l09nonEO5BLLMb3vYmnsLM9S+wqm/yOfyRfRab+f9ZDnMnJSXAqd0SoQ4EbuLlHYElu4epTxyHdQK8MLMITscHG6RDoSF8iDu5AzI+d6huR5gProy0ZNdLrJ4DZm+4zJemhIAXO39kkKlL1hGPTcfCcuG2CoSQsUjhAw+FwcVRPUUWhbof1EgmG4AMpa9SZnnC+Lh5bg4gsL8dmz+9NLRarTJBrB6T6ApZAaykEKFKYbh4qyP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(18002099003)(56012099003)(22082099003)(11063799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RG9VQWdpZVluUUxxZEJXVnBnUU1kUHBQN0ZxUjdiVlhQRERIbEcxc2paK3Vk?=
 =?utf-8?B?NzV5cUpoYTVob0haUjVDQ2dqM3RvUm05Q2t4NlYrQUF5U2RVTm8yMEpEVy9r?=
 =?utf-8?B?NnIzWUY0VVlWdHFEOFR5di9vMnFFUktKOVNQRVZ4Nkt0WDl1bXF3ZVpmK2Zm?=
 =?utf-8?B?NHBsMFNzSVFuYVdwZ0ZjeTBjTnVPNnJmK0tCeHp2N1ovQVZOd2VmYlYxczBq?=
 =?utf-8?B?a1ZkcVRNeU1IQnlvQktNMk5pNDhEb0tjK0Zpellsa3NmYmllWThMRU1rVGxI?=
 =?utf-8?B?WTB3V1RWZjJlWFRMNy9lZ0o4RGZRam02RTBranRxTGhOcVJqUUpOdWhiNzdx?=
 =?utf-8?B?WkJyeDFkdFE1Wi9LYWNSb056NlNiUm4xSXpsNUJKa2R5REsrM0xjR01VUkhs?=
 =?utf-8?B?RHF3L291SC9JRjRVS1Z3cGUyUm9qcTBoNHhTMzZzSldKMklBVTJ6TDUxdmdz?=
 =?utf-8?B?Rm90WGhEK2k4cC9JYjA4cEhwR1ZiSUtWbmJ2eGo5YVkxcHl0M1dhci9hbFR4?=
 =?utf-8?B?aTdWOGx5Y0JVb0poVUpvdTMvTXg0TTIvVXZSQXpNQjl2UmQ5WlZOeHFVUG42?=
 =?utf-8?B?V0FERHRkTXFPeUdoenpMdWZleEF3THpCOVkwVE9EV0VNUGdzUGJIb1ZXbDZP?=
 =?utf-8?B?Tk1mbEhyK0FJK0NobVB1R2swQ2djblN4UjlmOVBtSlZCY20zSVFvQVp1SU1u?=
 =?utf-8?B?bEJLdUdmejN2K2F0OEtnUElKK3ZVNVkxT2p1TzFUZjF2Vy9IY2FOODEyU3lY?=
 =?utf-8?B?TE0yakp0VWs1VjBUbmFpaTVNamhNaGlpbzQ2UlA4VXVxRWg1RmQ2MFZ0ZnJh?=
 =?utf-8?B?NDZaUkxWbDZLcDlBdWNieTJjRDNFZzJuOGZjMmlJajlPOWJYaFVvYm5CV3Zq?=
 =?utf-8?B?Q3lYSWYrTCs1Ym1Qbkg4czA5Ry9YN1JVT0JWU0JJOGZSQ3VHRnNUeFBtUTM4?=
 =?utf-8?B?aGRJN2pUckkxL0hPeG1zMmJNVEZTOUVLYjhINXVIWGJQUDFWNzFDUFhEcmUr?=
 =?utf-8?B?dXZ3elZZVnFLdVNRTFpwazl6STRsbnN6VFhBNDMvTjRhTkF2WS93aXd4MTNL?=
 =?utf-8?B?U0t1NUw3UDZ6QmxzYmIrYTJLbFhsZytleTAyT05qVWMxcytsYmZFNmZWRWNp?=
 =?utf-8?B?clcxdi9UVFdMcHhybmhqYTcrQ2tFY3NTTWZURDdzTmQxTllQRlc1S1hSRjFD?=
 =?utf-8?B?NDd0ZUd2RHgzYXRjRm5UWkJxYjdRM0o2YlozUVEvdGFYZDNWTlFESWppTjJr?=
 =?utf-8?B?d3VMc1cxbCtBWTZGdVh2UmdVSlpjc0szaHErNUF6elgrZkRMK1lMaUhtVk9G?=
 =?utf-8?B?Nlk1NTZLSHZrRDdXa0hZMVk0S2VRTnRpL0dzd2phOTd3TmprTHNHT3hwUzh0?=
 =?utf-8?B?MUoxdGtsdWEvQTBsR1hVU3grSUtmK2FrL2hTN3E4dnFPSmNRUVhUZUphT216?=
 =?utf-8?B?SEt0U3NSR2hEK2srYU1XNW9OeXN4TUlLbStMY0xuSFVUMVJnZUFSTC90WnUr?=
 =?utf-8?B?NkNiUkMxYW5YQ3BNOUk0ckk4L0Zxd0Zkd0p3VTl3clNBNnZId09MK250b0RF?=
 =?utf-8?B?M2RmRWtwTmoydmtSaTljMDVoSlFmTUx0dW01MnB4SEFTTGpGbTNJZ2EzRUVZ?=
 =?utf-8?B?RjAycHdaMTNJNk9nR3lBRm1IWnloM204TEo0ZEhxMUV4TGhEYVI2RG16T2RC?=
 =?utf-8?B?OW1BU3ZBWjhqdkMxREVuZmtVR2VZV0xVWThPVEt3Q2JTMXJjQU84a0J5K1ls?=
 =?utf-8?B?Ym1wWStkY1Q2ZDY2MkdrQi8yVUZGVytwdVNDQ2x2bWhLMGxjS1p4aktNREFm?=
 =?utf-8?B?Y0hETmdUZGtpOVh6Q2hONjJiRy92Rjg2VTdYS0hGYXFURzBGdUJ4TTdvQzky?=
 =?utf-8?B?Z01FNXpZTnZSaUkzV0lhRFU5UytNNWdLOFovNHBQaVUvb21BR25ITS8vclV5?=
 =?utf-8?B?Mmx2YlVxRnRHNEN4Ui9pVlFFZThueGZSbnpZVmFQNS9KVVpobGlxT2JYMzI5?=
 =?utf-8?B?MGFDcEdleXA0VUdxOVd2dmF3TTF4WFpRL3M3SlBXK0M3L1lTMHdSZlFualZ5?=
 =?utf-8?B?NVNvMm5OOFFheVZ6OXdMR3ArZnZ2Y2lBcW41aUlmN0dia1NRbW9SUlgvRCtK?=
 =?utf-8?B?YzkwbTgwWDRRckpaekZMZWl2bjdUSGs5ZzZaYkVqQ2NIdWJsckh5OVZwTGlz?=
 =?utf-8?B?di9XcWxsYjFTd2Z4b2xoQkl4Rk9vZUVYbmpCTW9HcDlsb1BzVkRSQnBWMlNL?=
 =?utf-8?B?MjJBVjZOL1JGelFOYWgxVytuV01ieDV5Z0F0MHJ2L0lna09nRzEzVXQ4V2I1?=
 =?utf-8?B?UUlCbjJsM0wvTzZiZ2pVbVBMc3psWWlsR21xcGxEaVVzN3RJN3BDQT09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b07a8a8-98e6-403c-f102-08deb0d3befd
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 09:41:02.4086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1v7Eln3swaw7gJNQp6vFbi+DAaqh1DPXzT/3myKEwHccp5qAtGyEth62UiOmIXvfrHF7JALyYvZ8kDEVSjtDSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7671
X-purgate-ID: tlsNG-d62444/1778665264-B4173FF4-E05E8ED7/0/0
X-purgate-type: clean
X-purgate-size: 1367
X-Rspamd-Queue-Id: 17A28530D26
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:Rahul.Singh@arm.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Bertrand.Marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:mid,epam.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Hi Luca,

On 4/10/26 16:28, Luca Fancellu wrote:
> HI Milan,
> 
>>
>> diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm/viommu.h
>> index 2a6742de73..ed338fe0ec 100644
>> --- a/xen/arch/arm/include/asm/viommu.h
>> +++ b/xen/arch/arm/include/asm/viommu.h
>> @@ -10,6 +10,7 @@
>> #include <public/xen.h>
>>
>> extern struct list_head host_iommu_list;
>> +extern char viommu[];
> 
> As far as I can see this one is used only in this header by ...
> 
>>
>> /* data structure for each hardware IOMMU */
>> struct host_iommu {
>> @@ -50,6 +51,12 @@ uint16_t viommu_get_type(void);
>> void add_to_host_iommu_list(paddr_t addr, paddr_t size,
>>                              const struct dt_device_node *node);
>>
>> +static always_inline bool is_viommu_enabled(void)
>> +{
>> +    /* only smmuv3 emulation supported */
>> +    return !strcmp(viommu, "smmuv3");
>> +}
> 
> this function, it seems cleaner to me if viommu is static inside xen/xen/drivers/passthrough/arm/viommu.c
> and this one can be defined there as well, so here we will have only the declaration.
> 

I will remove this patch, including the additional boot option and 
is_viommu_enabled(). Relying on the existing vIOMMU config options 
should be sufficient for vIOMMU enable/disable control.

> Cheers,
> Luca
> 

Best regards,
Milan


