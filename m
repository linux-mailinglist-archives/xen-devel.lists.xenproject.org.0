Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CF3CCD249
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 19:21:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190140.1510769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWId9-0005XW-Ug; Thu, 18 Dec 2025 18:21:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190140.1510769; Thu, 18 Dec 2025 18:21:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWId9-0005W4-Rm; Thu, 18 Dec 2025 18:21:39 +0000
Received: by outflank-mailman (input) for mailman id 1190140;
 Thu, 18 Dec 2025 18:21:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6E0R=6Y=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vWId9-0005Vx-3M
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 18:21:39 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63e903e1-dc3e-11f0-b15b-2bf370ae4941;
 Thu, 18 Dec 2025 19:21:38 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA3PR03MB7444.namprd03.prod.outlook.com (2603:10b6:806:398::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Thu, 18 Dec
 2025 18:21:35 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 18:21:34 +0000
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
X-Inumbo-ID: 63e903e1-dc3e-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xmj50usCK579155BvuNi4ShxVOF2KpXl+e+2Am9dHrm2+BlKCjCHxNGayvmCNx3tamNcC/Ha5ccaf37Bbqa3iN8SHkppWF/nv2DY/tTk8qrIk4m7B+YJiHUV51pmWHjbXoLNdtvS2YYbEEDBzm11htOxRnCPY3VnfYsN5ItSZ6gCVl6cxLiHx1gg7olXMjs1VDv/bwNprE/BwQ1tB7gnYLGJVCM6JfN3JEKLjbtx6MxLiK89aJ0I+sOOdboUFp1rajp+A1Vzbn7DL2G/z45w32siEgzHrb2rFT4gNXptAf6uwkrUo9ea83P+Lz8aUxK2WDEPCcOvJMJkRjvoNlY5ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4P6w5B9cN7T0jqCh86A/IzlgKRvUwpqmyy1Mp7l32nQ=;
 b=YQoqfpdj6IYxSxQWuLwkhewUHUONFInu4QIEcXRwucdbhO+UGI04KBjXFSZhZveuMx/wqppoU2lCeyEme/JCCUzZii3UvaWgbvWSn2uDg4pA3/0sOh3ksV+8nG+D3tVi0h1CPEjlte7u+n8nVx7EcHbQ0Q2bKsOa4yH0dE0LAQWNVB9mDdBxPOVeO5ZRlZuAmof6KreBx7xzsukvyU6Kfb5/FXwsNJwOJgZDWpK7kKax6B6XrLThDdFqShPofExAIwS3dsSiacLhHkxNAmNwQ7H3bKTRRovrMMa8HzxhLjlUaZ6FbgweS++HV/o62qnemhFWQzC3S8sFS8BYJXvwEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4P6w5B9cN7T0jqCh86A/IzlgKRvUwpqmyy1Mp7l32nQ=;
 b=nLHfMpPJbWdLAeDd65qy6TQsqD2gr7pBRt5JN41ZmmusupWEIz/O2BEwSt0bGbrM6if9UG22v73Gzy4rJvyqIK4G+DEntA4L2HwhYH3WndTED6yQXwygMFxCewfOORIsSNdiwsr4emhPOogiqGbZWNbsYDIdbChioAIz4ZexT8I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <69b3249f-220d-49bc-a1c6-e517ae5f3b68@citrix.com>
Date: Thu, 18 Dec 2025 18:21:30 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 4/4] xen/common: make {alloc,free}_domain_struct()
 static
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <cover.1766053253.git.oleksii.kurochko@gmail.com>
 <439f6e9dc1f35736024023d70ed7e1daf1ec294b.1766053253.git.oleksii.kurochko@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <439f6e9dc1f35736024023d70ed7e1daf1ec294b.1766053253.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0096.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::36) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA3PR03MB7444:EE_
X-MS-Office365-Filtering-Correlation-Id: 14e4a09d-b155-4465-984d-08de3e6246b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OEZGVVRac0Z3c0xtRUpkYW1neGNvK01aY09IV2RsZk12RE0zNC8zOVpYZlJQ?=
 =?utf-8?B?VUZzMW9zbVFnRGY1QmtzdWVrb20zQjJFMVNDT2VkMjJJMDFxT004UENQRHRq?=
 =?utf-8?B?N2xuT3hyMnVqSnd1clBLRXUwUkhzRjVDNDgwY3lMQ2NmZ2xOd1BtWlhGRkU1?=
 =?utf-8?B?NlRHT05ncUVNTEhHNVVTTEJ0VllvbzZqOUFaWkl4NUdjZUFaUmh3QTRPVVNs?=
 =?utf-8?B?aU5ib0pQRE5CRUdDNFpDNUVua0t6TkpEZWh2WXkxZmFjUkw0emhtZW9nY1Vp?=
 =?utf-8?B?V0h3TWQwT0ZsT1d6MDN5ZnhlNVlLRzZQTjcxL0VNRHd3YTRxdWtIVGw0cFQy?=
 =?utf-8?B?Z2xVYUFnbFFZVEFkUWhjTG9zc3JaOElmYVU2VzZISktVMDF6am5TQS9oeHFx?=
 =?utf-8?B?QUpXbStMOHg5eTIyYUY0T2F5WUJFaTQ2ZGVKaDlKcmhob1IyTVJOL29oMS9a?=
 =?utf-8?B?OGxkTEV4QUw5bUZhUEY5YnlOa3ZBRzlqS1FTRWNpVjgwOGQxeVI5eUs3UnR4?=
 =?utf-8?B?dGRpWWcwU0FYMGxwVVo0aVBxdnJGb2NhUE83cjBEeC9qWHpQVlVYa2pndUNm?=
 =?utf-8?B?YURiVFRLMk5iN0taZWVqVGxoNHFuZDlWaU0rRWRJT2gwSmJGdTNTQlFjNUVB?=
 =?utf-8?B?ZXVyV0g1dldtRU4ydnkvQzArYlVJWmJ5NkNPYjZnVVE3Wmc5QnVtQkxFbzQ1?=
 =?utf-8?B?dFEyYUpXb3psUWdjZnVLckt5ODU2MVpWVkpCNDc0aEhDaWlPWDFETTJ3Z2x3?=
 =?utf-8?B?a3puR0lYRUgwVDkwZUZEM2ZXdDhtWWl4QUc0anUvMTVESE9WVWlSMnhZYkhx?=
 =?utf-8?B?T0xKUnRGQlg1Vkd6NU5EcEZzQUJSdVJmcXpYNXp1ZXRQc3c3VjhmenAwNU9H?=
 =?utf-8?B?R2NCSTlUS01kcExSQWxMekZZM2U4VThQSk5ZNXpDMmR6MHNqdm96NzZWOTN4?=
 =?utf-8?B?VmdrTnRiOWU2YXhTbWRvMk5wSjZzY3N0S3AyNG1XcEJDNFlwZk9LY2VhOThJ?=
 =?utf-8?B?QmhQajZ2RS9FSGxpRjUydDg2alV6ZVNQWDFaVUpHa3dXQWlLeTNzVnNCNHdI?=
 =?utf-8?B?MWdxNHBidURRMGR4QzBCUUVNTnQzdi9ia0szVU5ocmo2NnpaUXRRRVhvTkRy?=
 =?utf-8?B?c0swZGtpamJNdWE3bTE4T0QrY2piK0xaYUlQa1lTV0FJNXNWaE00azdRZzRO?=
 =?utf-8?B?M0huYVlMcnNKL2Z5MjZPeE9DbnBPbFYvSFFKT2tRYlpjWnhyck1uVC9KdGc1?=
 =?utf-8?B?OTRFMWdLdUN4UkdNTklZMkljRHZOY2VlanRPMEZQQnJWeE1obUtSVE1TcnRO?=
 =?utf-8?B?VUZKbGhkN0NVYXJYY1dEcU5nREhOSmlvREhSTFVGc0s5RUpjb2t2cjRWcDA4?=
 =?utf-8?B?VHZ2djEyZmhLQk1nN1NaY1FqT1JrcUoxQzJuT3dxaGQzY0p2M3JuSkNKWHhh?=
 =?utf-8?B?VitDMEY4RlFPNjZLbDdvTFBWREtpMXBJY3dHNk1GcFU1OHVmUWtrcUZCTHJZ?=
 =?utf-8?B?QWZIWUdaeUcvQkJMNlpNOW1tTk5scDRHLzRPM2d3K0hUdHk3NE9JS0lYa3RI?=
 =?utf-8?B?clNyM3JJamdJWHFENnppa1ZPUVZCL092bE9wOGxEcldoWC96UmVhbHZPdm9X?=
 =?utf-8?B?TThLV010Y1h2ZTFXRHJMYW1vQ3gwV1YvZWpkL0xsSVpNbkZObkF1SGRqZVZX?=
 =?utf-8?B?ZmhBTkNNSk5SZEF2c05La1FkU3dtZENnQWI0eUFFcnNxVVgxdWNpcmRwWTMr?=
 =?utf-8?B?UldrSkE2Rkd6TmVWZE5GeHRFbU0yVjRqakwxeHRhQ3VpbFdZNnF3cjZaaEZ2?=
 =?utf-8?B?NGkxKzkxMTFBcDhRb1JIQ1YzMlFRSll1RW9mZTA5bFhPa1ZVRlJzVDJSU0lE?=
 =?utf-8?B?VFJYVFZ1d3p1VkZGR3dYdFExbkVZYWF0U2RYNGVEaW9mOVlVZkhqZWl0Q3pl?=
 =?utf-8?Q?4Ufv58wBptLMLQSHYRRM/0TmF9GeOQXk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHB2MkpodEJ2TDRVOVRMOW9ZVG1WTG5FNHR6aTRoajZIdzR4THlnQ3RiZUEw?=
 =?utf-8?B?Y2lGMDFieFRWenQ5NVRkbXErRnU5M1FwMG5HN0V6QlNNdVhNTkt2MzNJN25o?=
 =?utf-8?B?R3VwcTZqUDE1RFFwU3NreFp4aXBLZ3VkcWFYWCtLeUxZMHRpRExWOThMK0J5?=
 =?utf-8?B?bHVUY2IzRDlqemJKQ3ZpMjV3eUE2RWJRRUVEeDUzY1FsNWdhYkY5VjZKemdw?=
 =?utf-8?B?SVU0YkZCbTQ4aFJsOTM2aENTSThiOUw5a01CZ1ljUmQ4SEVmb3BtMmdodjZu?=
 =?utf-8?B?aU1mUnFobnI2Z2p1QXphYnBIbFV0dGNtWWVHd1JNNDlyYndEcGVkWEFQMi9Z?=
 =?utf-8?B?WXdJRE03ZjluOStITUNmZ0FFbmFMRDJidENmb205ZGRnN1FrdSs5ZTUxNEVx?=
 =?utf-8?B?UTJRMThxa1hmek9SNHBrNDdiOXNGelVtcHMxaHBKRnJpa0hTVmxDbi80eEpm?=
 =?utf-8?B?OVpuYktUZzZKaGszemZuNWZlZklyVW9CSnBBRWNnNFBvQVRQNTZpMk9kdWlL?=
 =?utf-8?B?NlhwbVdhK2Q2NzMvNXd3QW9RRndzQ0lSVHBLR3V0NW5EWG5vWXZFSE5jN0FZ?=
 =?utf-8?B?eGtLc1o1VEFlVEV0Z01rbVVyYWJyeUJyZ0JjRUJXUHF1TEhKOG5iMi9JODNQ?=
 =?utf-8?B?NXVZTm5naW9pL0R4N1lTVE1ST3Mvc0pFbXY4NFBmVWg0OVRKWHhaREJ5Ylp6?=
 =?utf-8?B?bHJqREFlRVp6VGJrMlRtNHRkS3hWOEhmM0JXVGhuMEhIRkx2dDJrMlJRZmJW?=
 =?utf-8?B?OXZMWWY0VGJMM01qQU0zY1Yvdkg1dlQ3WWg4bHVPRWl1cUkrRlQxVm1RQmJM?=
 =?utf-8?B?dTFKSk1KRGUrQXV1ZFhDamc0ODFUUTEvNmtZRTRTL3hsTHN6MzEreFNRMHM5?=
 =?utf-8?B?bFNTdk1yTEk5WjdLNDdVdUswMXZ4YWdhU3p4U0wwaW5YWnhpUThUbzQ3UVNT?=
 =?utf-8?B?OTVwZnR5RjBvQjJzdW4zdUdjRmZOTEZQbmE0cFE3Q09Td3hoUDNEckpXSnBx?=
 =?utf-8?B?RDZtV3hWeUhUZUY0RG9qdUZEdzBVbzB6MnIvUkt3Qnloc1ZnTWRCUEw3Z1k5?=
 =?utf-8?B?ZFBpWkZSQ2E5b3JtbWVJbXdlMHpkbmF3SHVjT0swYWJBMjd5M011cHBoY0Nv?=
 =?utf-8?B?VnpJbkJTazk1ODdLdmlmQW9Wa0lEWHkxc1Fsb0xIcmFnT1dXM2Y4aGgvTTNk?=
 =?utf-8?B?Q01CRm5YY0VZTGlRb2gySnhCTEw5UmJ0UjNrUkM4L25hTklvZWVhMFl1cVNP?=
 =?utf-8?B?eTd4RE5JanExdUpnL1ZoR1dUS2w0bCt6TXp6NmlFYzNQUEphTkNOOUM0ejAx?=
 =?utf-8?B?aVE3SmthcFFQa0I1bHQwcjFRdmRLY0tPeEp6UTFLM0NyNE9GbkpVYTEyT3Zx?=
 =?utf-8?B?Q3Exejg4MDRsak03QVZ2eHZDSWhpYjE3cWNxaXdXVXRwUHJHdWxtVU5Ka0dP?=
 =?utf-8?B?b0pBdExoa2xva2VJM2RnUXUwT3BsTTFLeFRrSkhONVVyNWlEKzlEU3piaWFG?=
 =?utf-8?B?blZ3QWROWnM3dDhPOFlvWEhnMVAzM3c0aFgvOTkrejlsdk1sbExuRC85TW91?=
 =?utf-8?B?NHNhcGFhSjh5Rll5VFZELzZrODkyc2NreDg1YWVBZFRCQ1JTVTI3aSt4bjdT?=
 =?utf-8?B?WlBBTEpkUGVFWUt2QzNoTVBDOGk3SzV1VEZqd0lpTDBBWE14Y0V0VG9JTkpQ?=
 =?utf-8?B?OXpYbmliWTFaYTZrZ2lncTdiczdoUGRvUCt3MEs5YzJySUFuOG5jRndjME1D?=
 =?utf-8?B?STBySWIwRVRCc2tpaGU0NnppMHo4cVR2a21NeHBJSHVlVGQ2QkJIZjRsMTI4?=
 =?utf-8?B?d1FYWFhNM1A1NS9hRmVTNjVSbHpkM2I4Y0RYYUlCSEsrSmRHU2wzNERKMWIr?=
 =?utf-8?B?bjJrUTIwdllPaHpFdS9YOE9lRU5NMnRQazZhb1F4RDl3Z25Eb21Famh2YVZC?=
 =?utf-8?B?cTBjNTF3UitraWtKOElaQk1ITEE2ZHVpdllHL1J0emM0dzNEb3RpTEVOdk43?=
 =?utf-8?B?L0prZ0h3MHB5elhBVkxiWUQycVBwM1FxMWhpbi9Qb2RkZmc3eTl4Z3BuMGZl?=
 =?utf-8?B?UW9XNTlrdmhCUUdINGtmTmZZWVJnOVpxQ09lRkJQRHJOVjc2dzhSTzg0bmF5?=
 =?utf-8?B?U25HNWtuZEdzRmxSWlVXSWF3Qzc3UXlmQ1E4bmlJWnFNYnYzd3pwN2NFaFdN?=
 =?utf-8?B?WDR2dkxmaE41WU8xaEN5bCsvd0E0aWFRZWRSRndXYU10QmlUd0R6bHJObEZq?=
 =?utf-8?B?c1pXM1dUVUZOWWRXV09EZUp6OXRlK25FakVwaWpTT1NaSlhadWZQbTJLR1Vi?=
 =?utf-8?B?ZkFGRW43c0o3NWNFN1dQOGJva3p0WXJHT1g4SG1hUnFWN3pLQkRPdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14e4a09d-b155-4465-984d-08de3e6246b3
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 18:21:34.8564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BI09m+wT8Tr4WwmzP2YLG9LUfmZdnOldtP6bUFUQzK+i1M1xXycvYdeA+bPnhsvDv8UWn6LVXvgkqJ0uWAGRr2ATpAD1BGeqCGv30QZZCGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7444

On 18/12/2025 5:28 pm, Oleksii Kurochko wrote:
> As {alloc,free}_domain_struct() are used only within domain.c,
> they can be declared static and their declarations removed
> from xen/domain.h.
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> Changes in v2:
>  - New patch.
> ---
>  xen/common/domain.c      | 6 ++++--
>  xen/include/xen/domain.h | 4 ----
>  2 files changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 92fc0684fc..7509dafd6f 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -690,6 +690,8 @@ static int domain_teardown(struct domain *d)
>      return 0;
>  }
>  
> +static void free_domain_struct(struct domain *d);
> +

Another option would be to move them both up here, and avoid the forward
declaration.  It's a bigger patch, but results in domain.c being
slightly less complex.

~Andrew

