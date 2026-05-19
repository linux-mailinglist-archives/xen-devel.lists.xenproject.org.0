Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kP5rHmaQDGp1jAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 18:31:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C44DB582697
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 18:31:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313258.1583480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPNLp-0005FC-4Z; Tue, 19 May 2026 16:31:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313258.1583480; Tue, 19 May 2026 16:31:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPNLo-0005Cd-Vw; Tue, 19 May 2026 16:31:24 +0000
Received: by outflank-mailman (input) for mailman id 1313258;
 Tue, 19 May 2026 16:31:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1wPNLn-0005CV-P6
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 16:31:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPNLn-00CwQx-4z
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 18:31:23 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6a0c9057-e002-0a2a0a5209dd-0a2a450a9c92-12
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 18:31:23 +0200
Received: from [40.107.130.110]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6a0c905a-56b3-0a2a450a0019-286b826eae54-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 18:31:22 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by DB4PR03MB9508.eurprd03.prod.outlook.com (2603:10a6:10:3f4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 16:31:19 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%6]) with mapi id 15.21.0048.013; Tue, 19 May 2026
 16:31:18 +0000
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
 b=D3LP6j/WfkSRT25rsp6q1FavxCzD3/tmYAYdQcCv0GGtCMk7kvY1V6TRaR3cYJTb+4ciEr3K4qu0KqQM5dC1XkNFpTTa+LBZroKChdsnRRLYb87tebY97LhQukqMFquZggTIVnMATAL5Oh4q8NeYHN0d7lGPt4oFS06lNXQqm4Eyv0eWgv07nizLuf/L+WeoK4YzezzG9v7LgKzwfpoqnr6rWNIGT9mrEXQoywvqa6WFa0IlcSoZyuoCQ9jqeJY/k/os94bkW+Xcsc+2+2dLkJ3DhTXG6ws5kfPmKulPvcm1zypBIK+0uOqD4/rnyVvZZolHG/g8eMSTe019ZpxWZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WonWStXbPXKpK/5+hWfiJKnMISdxhPwRH7T5EZ/MGa4=;
 b=KmqIqOivU27QyrZF2+KYpQGYN+qnZvAvnWImMEzneNfIyAfVlNnWaRc9MZECWf+OytXqWDqnG1ScCIRp0atslNsFd1sq1hEx4XLyFgx11ysWMsXQ+ANJN04NZxS6FG6tx+KGOR9OMV5mXY8Yy/nQsN7QmM2d2Wst6GrPHI3S/8IDswreM3h/AVZ8SlCc35wtWXNvUOUQXOQF73Wg6/Sw7RXAevLIbOffll0bLsqNejxusvjwC9SriXSRMVWSBQeQM8k6dQcXe6SBb+D4r1Am/xEawYGkeIyHKVD2UcUIRD/HKDf2PTD4ud4yIuuMxvXOyauLmyLXLAzqUMhSfXLpDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WonWStXbPXKpK/5+hWfiJKnMISdxhPwRH7T5EZ/MGa4=;
 b=R1vUdP0P9N7Fjn3gUfI8V/ZLc0y3sZ0LQg7L3DW/fOKe2XEQX10YlkbCQ8G++ocp4szgw7cx1GwsBsoWuyuTuYLv82uFL3LaJpuS95VVB8QDW2kxsmqdYbaGdBe5F3iBlLSnyYsYuciwSfWKzvqxAPttKuDyLpI1UnB4enAn8zZEP/RBzvRMym2cKHlup4VhgGomY7BhO9e4Wb8qgxc9nG0FWiDrLgNerFwML0s+nVITNm/HLufJ1Tg45VZA5aJYF4sjMqBuS+WM64AZDSs9hjK7QQvP4Y6xEGyInb73c2srkXqt74pQwqDdwhd2JuGkTF0bvMlRMyAY0Bzvhm6P4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <26f52f4a-a830-4430-b0c1-9ca7f761515e@epam.com>
Date: Tue, 19 May 2026 19:31:15 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 0/6] xen/arm: scmi: introduce SCI SCMI SMC multi-agent
 support
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Juergen Gross <jgross@suse.com>,
 Anthony PERARD <anthony.perard@vates.tech>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Michal Orzel <michal.orzel@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <cover.1775493499.git.oleksii_moisieiev@epam.com>
Content-Language: en-US
From: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1775493499.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0404.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::6) To DU5PR03MB10263.eurprd03.prod.outlook.com
 (2603:10a6:10:519::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU5PR03MB10263:EE_|DB4PR03MB9508:EE_
X-MS-Office365-Filtering-Correlation-Id: c0f88bd2-f2de-4b3e-a390-08deb5c40ddd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|22082099003|18002099003|56012099003|11063799006|4133799003;
X-Microsoft-Antispam-Message-Info:
	EjcLMLcsy6DfQvMfHfZhDyT9faw3be0wne+H4pilc3mSkWIjkA7TR6/bfnRGMHKETZh8aT9aeE4RROGirB1ed2uoBuGUd9Mx7EQzKPMDjisH24ab+YrTJ3gnaKBwCp7jKLAc6zLXPgh1w2imzV9q2ilL9rQEtzNI8657bUpMat2nWsX8Pqmj5PTnGSr0SJOCzg9xc0AweT2YQ1GngDg9uXoC9D/2ngxjWhmEun1tw0YNOSzXuFI01JIgAARKNFXEvl4I/Qv0mxCZuAySW3GNmVzr9fDLDdaI+yw6E2NDNUHgLfkQd5sEiCAJJARkvqINnduDcaXlot2x+8deUPz047yWQM5aFkDAShEB3xma+I6EzLO87qR4ZEq2BYs3F+zUzVMBx596qSEyNoz373N7Lf9t98oPClKhGC8D+QD83YscCa5PVms2xTFkRJJqJYe9a9rLOXrEK5iXTtNPvSHUmrADf9zqd1W3j2PuTSOBaK8518MaYCs1Sme6wJ1LUIvfhs/t00Kt1HfO4VZJNKTAr1WwGYPfiG1WdNdczoTleZUY7Z2YPMP/YpYHSjERuuwYV6sJo+vCG4sJFL0PhkEkHv8BY9jYBYXN6eOdMYuXvCT5onL1oeN94yjrJbaPihTfGlODJXIVgp7Jeb/eqNCFTC4CnuUOnNoDOOlU2CQf1ANhXzMP5L1MMIRPy4msxbMrlSff4MP9CE7lm3aXQ6OW2Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(22082099003)(18002099003)(56012099003)(11063799006)(4133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dytyTnVNaHRjczRJdmNxMnlNY0czQWZ1SGFRTEFvaEV1MTRIRVoxcU54Nm4y?=
 =?utf-8?B?WllvR3BubUZvMHhTRjZFRzJPUW1VU01tZDdXYXVGT3doeEJ3K1ppZWVWajl0?=
 =?utf-8?B?enQ3cW1tMEU5RTdMK3BMVFdPYVc1OFI4TTlFNzN2bkdPWmVDeVY5TUhBeWhj?=
 =?utf-8?B?NVU2R3BMeldaUTgxejFsQkphdkVHN1JKbUE0MlBDdHllT0pwbjVKK2EwQnVy?=
 =?utf-8?B?QXNRaXhGd2RPREJTNTBzUzBFbXhodDNFRStXdEJHME5TOGcwZWthdENRNXNs?=
 =?utf-8?B?OXNmSHcyemVaa3ZmZFhQNlFSZElXN0YrZHNuamdIeTY3VldWcVFqaXpQVGdE?=
 =?utf-8?B?VGNIN0tKWlRWUEFYaUJFQTR1WXhDQ1Z4THpkdysvVGdWSXB3SnA1VnVoeW5Z?=
 =?utf-8?B?c0YxWEd0ZXRrQ0gxcTh5OUtmRWFyQzNFQ1RKb0paU2MyTHNVcWRXZ0Q0Um8v?=
 =?utf-8?B?a3lXemY4U2NnRzZRSHluUy80Qkk4OHh3N2MwNUJhUDBocWorNnVZZXdDWlpW?=
 =?utf-8?B?WkQ0NUY1d2JaVG56dDAyTVVISzd4N0pOOWw4TFlPWGVock12OW10TU5XaHN0?=
 =?utf-8?B?aFN2TEhQdHFvRGJTSkRRa2lvTTFPT29kM2h5WjNmd0lzMTZrK1R1TkNNLzBy?=
 =?utf-8?B?bGFDOGZwNzRsalBQZDkyS25tRkFnT0tSUVZubFlwcUsrT0FvQitmbHZlOHJI?=
 =?utf-8?B?cVluRElhZkNxSUJSNTBjWnJsNGpDZ2xXU09tenMvYmRyVVZIMHFRSFAyelRt?=
 =?utf-8?B?TlZnSjR2R2NBTTR6L0dwaGJlZ2R1N3BOY2I1OGVSRlhISExmSXdVWjNCL2dh?=
 =?utf-8?B?K1RORkRwZWcrekEvTXRNZWRVTjQ2REw1ck80OXU3U2VQKzJWZE9kMXhHUlNO?=
 =?utf-8?B?THJid3A5SEJjbXlyb0VySS8ycjU3bGZWVEJqMFNHbHc3djNpTkRsRlNTc3gy?=
 =?utf-8?B?YnN4U0Y4Vk51OHBoMU5WZkRRa3B6NHUySUV2cEZ4Q2o4WW5KYXVway9TMTdy?=
 =?utf-8?B?TTRKTy9XWmtqUDZTbStET0FJYzk4NTcwS3NXK3JrdlNaUnNiT2xuWGp5NTVC?=
 =?utf-8?B?eGI4QXF2WSsvTnQ5clhqd3Z5cTdQOGdTOWNhY1FjUHZoejNQcS8wY0F5dnlO?=
 =?utf-8?B?M1BUd2hFKzhPTlpkQlBPRVYxYzN3Q2hySkN1TTdQZnNPYVBpUnRHK0tLUDBE?=
 =?utf-8?B?eU9Jd1hNRU1tKzFpVk5hM2dPT3dqM0dMWHFpK25qcmswTzN0V2V4dTYwK000?=
 =?utf-8?B?bzRGdDFWbGtaWFVmQTlZaFpZc3J1RGVyZmUzb042OVBLbmViOXFuSTdGWDV3?=
 =?utf-8?B?UEhZRWJOQ1RHcGpLQVBNblRhUGNzZXZuWXNYbFpPWTRxbEE1WWprSldSYUlR?=
 =?utf-8?B?bFVsajdnMUYzWiswWHBLQXp5Yk5LU3Q4RVFtT1hFZ3lndlU1SVNGUk13VG5G?=
 =?utf-8?B?SnJPd1lMT0dNSVFxMmwrdXhKcWVNWHpLc21kc2ptSjlSOVhnUk5LQnlLclAr?=
 =?utf-8?B?UkM2Zis1SG5DcXpWTGFvbTRVSjRUaWZkclQ5aGJtSnN5NUhVV3BQVFJBRkZ3?=
 =?utf-8?B?N3MwZnJsbzhaSmk5ekNqU2pUUDVUMGtUcUxUU3V6SFNDVDB5T1ZVUzRlQUVR?=
 =?utf-8?B?c0JoVjMxNXFpRnptQVR3WW0vZkFLYWZadlVPbUYyMys1d1B3c3NYeVZIU1M4?=
 =?utf-8?B?SUxMeGZvUUNjdFNYbHZ1Q21xRXZQVWJ0UGNwNVFuTVp2dnF1OWFST2kySW1t?=
 =?utf-8?B?MnVSUG9KV0tUWGlkZFIyeHAxODkrWmVKS2M0bExsTC9MTXBuUFVSZkxJcGdn?=
 =?utf-8?B?cFNBdlRnanJNcWtlUEMzQ3FsRUZWUmxMQnk3eS9ubHZmcTVxOVJJMnBCODJk?=
 =?utf-8?B?QWFtTVZhQnZVNXA3VDhkektIQzVrU3VHOEhPeWlEWGpPamxBdmc4Q0tkS0d3?=
 =?utf-8?B?cmg5WFIyNkYxQ1NXMnFFSUNram5QVzhhamlTSUhRSDdPaGlTSXdGN050R1FD?=
 =?utf-8?B?SUVXS016cm9heXpmdjY0L1RhbkhnL3VoWGVXS2hteFQ3QURMdTlJWUduQUlj?=
 =?utf-8?B?TmVQcEs2MHlaNkVaaTNPdXZ6NktCMXcrRFViZktPSnRPUWlOL0puWG5hSm9E?=
 =?utf-8?B?VGt1Y3FwZStJbXgrWklMRVNyRDBuSlVXNWZ6TnlobnBSUW14YU1hL1NyM2hS?=
 =?utf-8?B?UTZyRWlWd1lVTERBUU5KUjVZaStzSjk4MEtvSmVLM210Y1pxOHdVbHo5Q3RW?=
 =?utf-8?B?MXFEQWJTZUc0Q0hoSHBPaDBHWWlRWG15VElwc1ZYR0s4dERaS1hOZDE3MHpL?=
 =?utf-8?B?VjZXaTI5REVpc3JQNHFGQjkxVW9CK0hNSVpqaS9tK0dUZG16R3BacytUYkVR?=
 =?utf-8?Q?TwO/3kK0R9gX2P4Y=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0f88bd2-f2de-4b3e-a390-08deb5c40ddd
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 16:31:18.7585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zdxp4bLjXniSPOx/7oLlTpolDD2XIQ/ZYB2CYk4j/FzqrkHqdLkGUr2CRNRx35ygtS1mXCPzQMHr2hefnR57vgtdm8WoKL1MUx5XosMG4s0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB9508
X-purgate-ID: tlsNG-4011c0/1779208283-7D3858B7-975A755E/0/0
X-purgate-type: clean
X-purgate-size: 16952
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sstabellini@kernel.org,m:julien@xen.org,m:jgross@suse.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:bertrand.marquis@arm.com,m:jbeulich@suse.com,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:Volodymyr_Babchuk@epam.com,m:grygorii_strashko@epam.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,epam.com:mid,epam.com:dkim,arm.com:url,support.md:url];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[oleksii_moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksii_moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C44DB582697
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Gentle ping for this patch series.

On 06/04/2026 19:39, Oleksii Moisieiev wrote:
> Inroducing patch series which includes implementation of the SCI SCMI
> SMC multi-agent support.
> This patch series follows RFC v5 [3] series which was introducing both
> SCMI single-agent and multi-agent support. After the discussion it was
> decided to split features and upstream singe-agent support first. This
> feature is merged for now to v4.21-rc2.
> I'm starting this patch series from v6 to save the discussion history
> and don't break changes log.
>
> Patch - xen/domctl: extend XEN_DOMCTL_assign_device to handle not
> only iommu
> - add chainged handling of assigned DT devices to support
> access-controller functionality through SCI framework.
> Change was done in two parts:
>   - call to sci_do_domctl() to do_domctl()
>   - update iommu_do_dt_domctl() to check for dt_device_is_protected()
>   and not fail if DT device is not protected by IOMMU
>
> Patch - xen/arm: scmi: introduce SCI SCMI SMC multi-agent driver
> - add Xen-specific SCMI container compatible `xen,sci`
>    under `/chosen/xen`; Xen binds only to the `arm,scmi-smc` inside it and
>    ignores other SCMI nodes (e.g. under `/firmware`).
> - add `scmi-secondary-agents` and `#scmi-secondary-agents-cells` to describe
>    func_id/shmem/(optional agent_id) tuples for secondary agents.
> - each guest using SCMI supplies its agent_id (dom0 via
>    `xem,dom0-sci-agent-id=` parameter in xen,sci compatible node,
>    toolstack via `arm_sci = "type=scmi_smc_multiagent,agent_id=..."`, dom0less
>    via `xen,sci_type` + `xen,sci-agent-id` in `xen,domain`).
> - factor out SCMI generic definitions and shmem code.
> - passthrough configuration for SCMI guests mirrors other HW passthrough.
>
> Patch - docs: arm: add SCI SCMI SMC multi-agent driver docs
> - document the Xen SCMI container under `/chosen/xen/xen_scmi_config` and the
>    mediator’s binding rules; update examples accordingly.
>
> All Xen-specific SCMI configuration now lives under `/chosen/`
> to keep host DT changes isolated while leaving the host `/firmware/scmi`
> untouched for Dom0 consumption.
>
> Code can be found at:
> https://github.com/oleksiimoisieiev/xen/tree/scmi_ma_upstrv6
>
> [1] RFC v2:
> http://patchwork.kernel.org/project/xen-devel/cover/cover.1644341635.git.oleksii_moisieiev@epam.com/
> [2] RFC v3:
> https://patchwork.kernel.org/project/xen-devel/patch/20250311111618.1850927-1-grygorii_strashko@epam.com
> [3] RFC v5:
> https://lore.kernel.org/xen-devel/cover.1753184487.git.oleksii_moisieiev@epam.com/
> [4] SCMI single-agent:
> https://lore.kernel.org/xen-devel/cover.1756995595.git.oleksii_moisieiev@epam.com/
> SCMI spec:
> https://developer.arm.com/documentation/den0056/e/?lang=en
>
> SCMI bindings:
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/access-controllers/access-controllers.yaml
>
> Reference EL3 FW:
> RPI5: https://github.com/xen-troops/arm-trusted-firmware/commits/rpi5_dev/
> Renesas v4h:
> https://github.com/GrygiriiS/arm-trusted-firmware/commits/rcar_gen4_v2.7_v4x-scmi_upd/
>
> base-commit: dbe60f244c (Update Xen to 4.21, 2025-02-21)
>
> Changes in v11:
> - Fix agent_id documentation: clarify it applies to SCMI SMC
> multi-agent support only, not plain SCMI SMC (reviewer feedback)
> - Remove "non-zero" from agent_id description to match accepted
> range [0..254]
> - Remove "UINT8_MAX (255) is treated as invalid" from user
> documentation as unnecessary implementation detail
> - Add LIBXL_HAVE_SCMI_SMC_MULTIAGENT feature macro in libxl.h to
> advertise the new scmi_smc_multiagent type and agent_id field
> - Add agent_id validation in
> libxl__arch_domain_build_info_setdefault() to reject invalid values at
> the libxl level, not only in xl
>
> Changes in v10:
> - remove unused sci_do_domctl stub from sci.h
> - removed extra include in memcpy-{to/from}io.c files
> - Fix tabs in MAINTAINERS file
> - remove duplicate SPDX tag from scmi-shmem.c
> - add cast to ARM_SMCCC_INVALID_PARAMETER to settle the sign since
> ARM_SMCCC_INVALID_PARAMETER is -3 which is part of the spec and resp
> is the default smccc call structure.
> - update free_channel_list. Add spinlock to avoid race condition and
> a comment with a description of the function work
> - preserve error of smc_create_channel in scmi_probe
> - check scmi shmem address alignment as wel as it is done for size
> - check for d->arch.sci_data != NULL in scmi_handle_call
> - use SCMI_SHMEM_MAPPED size for iomem_permit_access
> - change len type to unsigned in shmem_{get|put}_message
> - rename shmem_channel_is_free to shmem_channel_status
> - add comment about skipping message status when getting message response
> - Set correct agent_id ranges for dom0less and a toolstack. Agent_id 0
> is not binded for dom0 so can be reused. Also mentioned that
> UINT8_MAX (255) is treated as invalid agent_id.
> - Split hypervisor and toolstack changes into separate commits
> - move init list and spin init after initial checks in probe call
> - fix typo in comments
> - clean resources when sci_register returns an error.
> - Split hypervisor and toolstack changes into separate commits
> - rephrase section about /firmware/scmi. Mentioned that this node is
> taken from Host DT and copied unmodified.
> - fix xen,reg address for secondary domains for Dom0less configuration
>
> Changes in v9:
> - treat SCI as a gate for XEN_DOMCTL_*assign_device: abort before
> IOMMU if sci_do_domctl() returns an error other than -ENXIO, instead
> of trying to propagate SCI errors after a successful IOMMU
> operation. This avoids partial success and the need for IOMMU rollback.
> - remove early return from do_domctl() in the assign_device
> path to keep RCU handling intact.
> - change IS_ENABLED(*) to #ifdef in sci_do_domctl quard
> - reword commit description to refer to memcpy_fromio and memcpy_toio
> - ordering obj-y in Makefile
> - rename ALL_LIBS to ARCH_LIBS
> - drop io.h and move definitions to the common header, fix comments to
> be arch neutral
> - update comments for memcpy_{from/to}io implementation
> - sort and refactor MAINTAINERS enties
> - remove Spurious changes
> - add extra check to avoid ASSERT when calling unmap_channel_memory
> from assign device method
> - set correct tx flag to SCMI_BASE_AGENT_PERMISSIONS_RESET when
> freeing resources. Flag should be set to 1 according to the
> section 4.2.2.12 [0].
> - fix dt node copmaring
> - moved channel->shmem check from ASSERT in unmap_memory_channel to
> "if" statement. This will prevent firing ASSERT if
> unmap_channel_memory was called twice on the same channel.
>
> Changes in v8:
> - check for CONFIG_ARM_SCI to be ebabled instead of COMFIG_ARM before
> calling sci_do_domctl
> - rework sci_do_domctl call to avoid extra checks, improved error
> handling.
> - do not propagate ret1 if sci_do_domctl returned positive ret
> - updated comment in domctl.c code
> - switched to ordered accessors to address the ordering and barrier
> concerns.
> - updated the documentation to match the implementation and explicitly
> state the supported access sizes and granularity.
> - rename memcpy_* implementation files to memcpu-* to follow naming
> convension
> - fix indentation to match Xen style
> - fix intendation to match Xen style
> - move memcpy-{from/to}io to more convenient library place
> - update xen_scmi func_id in commit description
> - updated documentation with the new DT format
> - updated opt_dom0_scmi_agent_id setting to avoid it to be equal
> SCMI_AGENT_ID_INVALID.
> - changed SCMI_AGENT_ID_INVALID from 0xff to UINT8_MAX which makes
> code more clear showing that UINT8_MAX is theated like invalid
> agent_id and couldn't be used. Also excluded SCMI_AGENT_ID_INVALID
> from acceptable value range
> - remove outdated xen,config property ignore, added xen,sci compatible
> to skip_matches in handle_node
> - add documentation for pre-existing scmi-smc-passthrough command line
> option in alphabetically correct location (in 's' section)
> - add note to commit description about documentation for previously
> undocumented scmi-smc-passthrough
> - Fix SMC IDs in DT examples (Xen management uses 0x82000003, Dom0 uses 0x82000002)
> - Add explicit note explaining why Dom0 and Xen channels do not conflict
> - Document dom0less multi-agent configuration example (xen,sci_type / xen,sci-agent-id)
> - Add scmi_xen node to agent-discovery example with #scmi-secondary-agents-cells = 2
> - Drop dom0=sci-agent-id command line handling; Dom0 SCMI is now enabled via
>    xen,dom0-sci-agent-id in the xen,sci DT container
> - Refresh docs and examples to mention the DT property instead of the cmdline option
> - update documentation to match the last DT format
> - fixed RST: "... code-block:: dts" -> ".. code-block:: dts"
> - update documentation with dom0less configuration example
> - update documentation with new param xen,dom0-sci-agent-id
> instead of the command line parameter
>
> Changes in v7:
> - update domctl to build on both Arm and x86 platforms
> - move ret1 declaration to the top of the function as required by code
> style
> - x86 guidance: removed the speculative note; header now just says
>    each arch supplies its own implementation or macro.
> - name spacing: dropped the double-underscore; the helpers are now
>    memcpy_fromio / memcpy_toio. The header also explicitly allows an
>    arch to define these as macros before including it.
> - updated io.c to keep 32-bit transfers safe on arm32
> - moved to __raw_read*/__raw_write* accessors to avoid endianness conversion.
> - split the helpers into separate compilation units
> - rework scmi nodes for xen to match on compatible string instead of
> the direct path
> - update documentation in section of the xen_scmi configuration which
> is matched by "xen,sci" compatible instead of the direct path.
>
> Changes in v6:
> - change iommu_do_domctl and sci_do_domctl command order and
> call sci_do_domctl first which will produce cleaner code path.
> Also dropped changing return code when iommu was disabled in
> iommu_do_domctl.
> - sorted objs in Makefile alhabetically
> - added newline at the end of Makefile
> - used uint{N}_t intead of u{N}
> - add comment about why 32 bit IO operations were used
> - updated cast opertaions to avoid dropping constness which is wrong
> - move function definitions to generic place so the could be reused by
> other arch
> - add SPDX tag to io.c
> - updated scmi-shmem to use io.h from generic location
> - update scmi_agent_id parameter to be provided inside dom0= parameter
> list and have the following format "dom0=sci-agent-id=0"
> This change was done as a response for Stefano comment and
> requires a lot of code changes, but produces much cleaner solution
> that's why I've added it to the code.
> - fix file comments and return codes
> - fix lenght checks in shmem_{get,put}_message to use offsetof
> - remove len member from scmi_channel structure as it is not used
> - set scmi-secondary-agents property to be mandatory since if no
> secondary agents were provided then there is no sence to enable scmi
> when no secondary agents are populated to the Domains
> - update documentation in booting.txt, added xen_scmi node to the
> example
> - adjust d->arch.sci_enabled value in scmi_domain_destroy
> - fix lock management in smc_create_channel call
> - avoid extra map_channel_memory command for Xen management channel
> because collect_agent_id call unmaps memory if DOMID_XEN is not
> set. So for Xen management channel we can init domain_id ad DOMID_XEN
> before calling collect_agent_id so memory shouldn't be unmapped.
> - remove all HVC mentions from the multi-agent doc
> - update sci-agent-id parameter description in the documentation
> - add missing Sign-of
> - minor fixes across the document
>
> Changes in v5:
> - return -EINVAL if mediator without assign_dt_device was provided
> - invert return code check for iommu_do_domctl in
> XEN_DOMCTL_assign_device domctl processing to make cleaner code
> - change -ENOTSUPP error code to -ENXIO in sci_do_domctl
> - handle -ENXIO return comde of iommu_do_domctl
> - leave !dt_device_is_protected check in iommu_do_dt_domctl to make
> code work the same way it's done in "handle_device" call while
> creating hwdom(dom0) and "handle_passthrough_prop" call for dom0less
> creation
> - drop return check from sci_assign_dt_device call as not needed
> - do not return EINVAL when addign_dt_device is not set. That is
> because this callback is optional and not implemented in single-agent driver
> - move memcpy_toio/fromio to the generic place
> - fix device-tree example format in booting.txt, added ";" after "}".
> - update define in scmi-proto.h
> - update define in scmi-shmem.h file
> - scmi_assign_device - do not ignore -EOPNOTSUPP return
> code of the do_smc_xfer
> - remove overwriting agent_channel->agent_id after
> SCMI_BASE_DISCOVER_AGENT call
> - add multi-agent files to the MAINTAINERS
> - add SCMI multi-agent description to the SUPPORT.md
> - handle ARM_SMCCC_INVALID_PARAMETER return code and return -EINVAL
> for smc call
> - updated collect_agents function. Set agent_id parameter as optional
> in scmi-secondary-agents device-tree property
> - introduce "#scmi-secondary-agents-cells" parameter to set if
> agent_id was provided
> - reanme xen,scmi-secondary-agents property to scmi-secondary-agents
> - move memcpu_toio/fromio for the generic place
> - update Xen to get management channel from /chosen/xen,config node
> - get hypervisor channnel from node instead of using hardcoded
> - update handling scmi and shmem nodes for the domain
> - Set multi-agent driver to support only Arm64
> - rework multi-agent driver to leave Host Device-tree unmodified
>
> Changes in v4:
> - toolstack comments from Anthony PERARD
> - added dom0less support
> - added doc for "xen,scmi-secondary-agents"
>
> Grygorii Strashko (2):
>    xen/domctl: chain SCI handling before IOMMU in assign_device domctl
>    docs: arm: add SCI SCMI SMC multi-agent driver docs
>
> Oleksii Moisieiev (4):
>    xen: arm: smccc: add INVALID_PARAMETER error code
>    lib/arm: Add I/O memory copy helpers
>    xen/arm: scmi: introduce SCI SCMI SMC multi-agent driver
>    tools/xl/libxl: wire up SCMI SMC multi-agent configuration
>
>   MAINTAINERS                                   |   1 +
>   SUPPORT.md                                    |  11 +
>   .../arm/firmware/arm-scmi.rst                 | 422 +++++++++
>   docs/man/xl.cfg.5.pod.in                      |  13 +
>   docs/misc/arm/device-tree/booting.txt         | 197 +++++
>   tools/include/libxl.h                         |   8 +
>   tools/libs/light/libxl_arm.c                  |  13 +
>   tools/libs/light/libxl_types.idl              |   4 +-
>   tools/xl/xl_parse.c                           |  12 +
>   xen/arch/arm/Makefile                         |   1 +
>   xen/arch/arm/arch.mk                          |   1 +
>   xen/arch/arm/dom0less-build.c                 |  11 +
>   xen/arch/arm/domain_build.c                   |  39 +
>   xen/arch/arm/firmware/Kconfig                 |  12 +
>   xen/arch/arm/firmware/Makefile                |   1 +
>   xen/arch/arm/firmware/sci.c                   |  36 +
>   xen/arch/arm/firmware/scmi-proto.h            | 164 ++++
>   xen/arch/arm/firmware/scmi-shmem.c            | 118 +++
>   xen/arch/arm/firmware/scmi-shmem.h            |  45 +
>   xen/arch/arm/firmware/scmi-smc-multiagent.c   | 830 ++++++++++++++++++
>   xen/arch/arm/include/asm/firmware/sci.h       |   8 +
>   xen/arch/arm/include/asm/smccc.h              |   1 +
>   xen/arch/arm/lib/Makefile                     |   2 +
>   xen/arch/arm/lib/memcpy-fromio.c              |  55 ++
>   xen/arch/arm/lib/memcpy-toio.c                |  55 ++
>   xen/common/domctl.c                           |  15 +
>   xen/drivers/passthrough/device_tree.c         |   6 +
>   xen/include/public/arch-arm.h                 |   3 +
>   xen/include/xen/io.h                          |  10 +
>   29 files changed, 2093 insertions(+), 1 deletion(-)
>   create mode 100644 xen/arch/arm/firmware/scmi-proto.h
>   create mode 100644 xen/arch/arm/firmware/scmi-shmem.c
>   create mode 100644 xen/arch/arm/firmware/scmi-shmem.h
>   create mode 100644 xen/arch/arm/firmware/scmi-smc-multiagent.c
>   create mode 100644 xen/arch/arm/lib/Makefile
>   create mode 100644 xen/arch/arm/lib/memcpy-fromio.c
>   create mode 100644 xen/arch/arm/lib/memcpy-toio.c
>

