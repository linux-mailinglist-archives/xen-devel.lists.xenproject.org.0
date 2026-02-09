Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAbyIwnuiWnDEQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 15:24:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1B3110329
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 15:24:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225454.1531959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpSB8-00075N-P6; Mon, 09 Feb 2026 14:23:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225454.1531959; Mon, 09 Feb 2026 14:23:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpSB8-00072q-Lz; Mon, 09 Feb 2026 14:23:54 +0000
Received: by outflank-mailman (input) for mailman id 1225454;
 Mon, 09 Feb 2026 14:23:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gJZC=AN=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vpSB6-00072k-MV
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 14:23:52 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f45e898a-05c2-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 15:23:51 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS2PR03MB8160.namprd03.prod.outlook.com (2603:10b6:8:27d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Mon, 9 Feb
 2026 14:23:48 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 14:23:48 +0000
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
X-Inumbo-ID: f45e898a-05c2-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D5XUzoYEd0Ngu0pirpdHJJizLUzpvX0FmZM5Q+9zexS/jeU2e2wug/f8kM32zXKKSw/dAiNZ8YKCaKnW9414YBHE+N6HqXl5yGzAoUANprPASAQy0I+misf1BlUHFqnt4BP9Z0yhvHVz5pf1bXVwXxFH2z44veyEZsxYH4llbfIwQ/PmuPxUWQAr2ReNPJy8yLH7S5tC7D3BR9tUwEEnb2thbkHjEoqVKJBRkNC9B48DqejMU2oQuOfxAijNssPrejP2RqW/sA0zPugbhC+pOaEORpAdQvhMI7/2sHlq90xe8kSPCJ5OeDmgbmtmqSzstM3R1VIPEwsnzrixoiLVzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDLOQZu1BZE5A+JIJb3+whYaBA/ZW/ig7mAIpIGC4Pw=;
 b=rJA3YpBdrXQgS7uK5ddnsyE4OBr+jjjdEcmWubeF/WXXs0pFYbeC+WmCadhQXLBUVsxj+w74uUp7HZK5AITE728VtSrdhhSD6wBL815in/Q8fXeqauoVGWWqhJZRuuTJIVejdqK5VMh9L8+VgH0gYs7jrpjnMuauQjysGmklkVRSX0pN4KORYL2D/A08DXGPtyFn+yUHho9m5XyZ2Qv2pHUi5YeDR/RA2YsYPgBrEmuwyAItnUAHgkF51h+/xsNlKAy9Skq/KCxCAyzSxNnio423ZomUwJ0ZKv5NP8VP2A95GG+QpUPQrUo4MY5bn2zOwMAynLKuXz/weNFoveOikw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDLOQZu1BZE5A+JIJb3+whYaBA/ZW/ig7mAIpIGC4Pw=;
 b=BZyNp62ZFhZjP+8XAcAeMiYiDW7FrM/ag7MHsmxBb3Z6Ky+HRmDWdqW6x90UU9lq5n9DkcaDZKJMLknqSyXtIAlxfY9ymVhxmr0RM1KceoSJvAigA1uUDLBNkdu1KFJzWR/sqKHR0eYj6yATjHZuRay5sBJHx4Fh+MH/ksBLq+s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 9 Feb 2026 15:23:45 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5] xen: Add Darwin.mk
Message-ID: <aYnt8WtmjkBn-t-l@Mac.lan>
References: <49c0bd388d45b6936bd852d99fbbc262fb078253.1770633598.git.bertrand.marquis@arm.com>
 <aYngg_ym18d0G-fX@Mac.lan>
 <28A169D0-4454-4D60-B811-72FE377A4318@arm.com>
 <aYnjjHlbaYjr2VqV@Mac.lan>
 <6B8E025C-3235-4289-948A-B26992D0C4C2@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6B8E025C-3235-4289-948A-B26992D0C4C2@arm.com>
X-ClientProxiedBy: MA4P292CA0001.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::20) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS2PR03MB8160:EE_
X-MS-Office365-Filtering-Correlation-Id: 0911f657-0be0-4f03-331d-08de67e6d715
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UVdjN1EyVnd6OHRyZWJYckxHUFVnYzIxRnlpMjJlNk8rK0MrQkYwZVk2czQr?=
 =?utf-8?B?bUtXY3czdXBnMC83RkJXOEZHSlFQT3pNSVpoU2M3VE5BczE0Sks4VG5uRFZK?=
 =?utf-8?B?RnI0ZUpQS2RKbTBoNVFMY3VnVWlVL0F5NGNTd0JXQ1ZHSE1xNjhRbm1ldXlr?=
 =?utf-8?B?bURWMTdEdzZ2SkkyU2xtaDYvU2NYMEgzM2o0d2I2b2FIQkdXMmhxSlpQYWpa?=
 =?utf-8?B?VmZPS0hJM1pHWUhydFpuajcrOEpMdkRtdlo1YnQ3NVAvVFBwWFVPbHlLVktz?=
 =?utf-8?B?QkdkODBJMkxFLzI5bHZPNjZXTmFBWU8ySmVxMGpXZHRVU2o4OGJNY2dLOVlL?=
 =?utf-8?B?Y1dnNi9LSlo2VEFDTGd4WjVLbS9wdWRUd0FFNFdmeHU0SHU5eXpEZFBPZVIx?=
 =?utf-8?B?YXlVSXhiVWtReUUrcVQ1UDJ6UUtJaVJ2clFaZ3hJdmlwWSs5b2NJSjVvV3ly?=
 =?utf-8?B?cU01RGlsWk9leFRZeng0T2s3NjR0bzdXcnE4Q3V6TllDWUxxR29lRmNXUUVB?=
 =?utf-8?B?QkZCZ1RoVjNyK2U5OG9PTFRFUjRBL3Vha1R5eVhkWXFmczRpUWpZcWE2YlF3?=
 =?utf-8?B?dnR0TXV5aU9CSVdQREFkbkZQRy9TYkVFQXhzcUhoZTdHbTlEU0FNY1dycjZL?=
 =?utf-8?B?ZkM1OXhRdnZDV0tEazY0WWQ2d0xHZHAxV2hoell3VituYjlZRFloeDlCRWpx?=
 =?utf-8?B?Z2xiZFRsRFdoOUlvUjExdWw2Nk4yQ3JZL2JOREpNZ2VINUozaWd1cktnN0pz?=
 =?utf-8?B?UFBOallYdDJEZ0JPa3Iyd0tZSzRqM3pEL1UxaUJrbVJUclBoL2VIcld2T1o1?=
 =?utf-8?B?RXNCRGlOdzloZGttNWlPOTUrNXJTRG1lcjNkYUlzMVlYN1FLTVpqUWx1YXNl?=
 =?utf-8?B?ZjVvWTdNcU10bHlBMFQ2QmRDZGp0QUJGeFRvenpPQ2RYaFAxYTZhZDJsVUg0?=
 =?utf-8?B?TVMrMWlHSHFkUFZwbkF0RUI1QkpPTUQ5TUcva0FRYnIzRmJWN0R4NU5xbFNY?=
 =?utf-8?B?eXJpV0hpQlgwN1M1eW1UeTg3d1RMWXBwTWlBSjdzTjJEdmpQMUtrQTNYZHdy?=
 =?utf-8?B?U1BSdFB5UXdvRXhZZ1Z4TWFldzBRUnZFQXc3T3E2bGpySXFmdTJzWlg1cnht?=
 =?utf-8?B?V0pDSXU2NWQvOFIyMjJ5eXpnOWRxU01sVWtYbUI1b29iS3BRekhHb3ZITDQx?=
 =?utf-8?B?TzRzS0hycDBTeUgwcVBHR1VaRFVSa0pPUys0TDI5U3dQWmZpUkNhSkFsM0R4?=
 =?utf-8?B?SHVpalB0T0U5Vi9qY2xtNTU4bGRXMHh6OGd0ckQ2Q1pHMnRwUE1NaTRqRlgx?=
 =?utf-8?B?a3FGT1RDUFpJQWhBeGhjeTAzMkxuVCtxZ2FDa2s1Rklqd3R5cHFuNk1SbVEr?=
 =?utf-8?B?bjhhUTZRdXpsM1Z0MGJwK0dFVFlhNWVSQXpSUklVSGFQRXVHd3o4VTRHQWU1?=
 =?utf-8?B?elp6UHVIank5UVhkVWVjdEg3bEhBYldzaWlJRkFIYkpQNUVQQkVRTkRScDBX?=
 =?utf-8?B?eUZmbU53RkpqQjJmZnhkTnovNTFzSzJXTUNtbHU5QkdTeFlLTnVnUTNoa0tS?=
 =?utf-8?B?YnNXQXVvYVVkdU5oQmtlYmRDVzh2UFhyM0hKbjBFcGZ6amdTRnR2OFA5eHp2?=
 =?utf-8?B?YzVmUHZhcE44UDdUYlIrb2VDdy9ibWFLelV5Q0ZOb2JHME9oaGlYcmNZY05H?=
 =?utf-8?B?UThoNVhlSGU5ejRnVTJ1ZTM3MTFteVlkOER2MDhsamU5MDRZME9EMnh3UUtl?=
 =?utf-8?B?RUtGWHJoWlY2KzFnQlNvOXNtRmZFMTlMUzZMVS9oVldWeWJRM3hwbEc3Qzl2?=
 =?utf-8?B?OHcyeHNPRmZ3alFYSTF0TG5JM01TejBhakxiOVgxR1ZXdHZJcE0yR081VHpT?=
 =?utf-8?B?ZlM3Mlk2dVZtSUx0UG1PL2JlSUxLNmJYYVpCRXdjM0Rqckw0ZGFsOVlVYUdG?=
 =?utf-8?B?eW9lNU1odHh5cUx1TzRwZGN5cEFBR3Eya3BGQlpjcE81WUl6M0Q4VmVtUWsr?=
 =?utf-8?B?Y2luN3M2T1QxUTRBVjA0cWp3dExYMzU2OHlMRDJzTTRRU1A0MWZEb3ZraTky?=
 =?utf-8?B?ZGFQaDRkRWFieU9JNUFpc3NjN0pyb29vNzladUpaV0NFRUlzYy85cURiTmVB?=
 =?utf-8?Q?gkAw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVQ5emNPdG9NWWxuMU16Q2VYK2hVOW0rTGlMM3M0THgrZXRIREFVOFczajRr?=
 =?utf-8?B?OTcxR2xyaEd5dmZvRStoVzVSQ0J1SUFiaVVITk9CUkNWUzM4TTNTYXNjSE1w?=
 =?utf-8?B?cWFnaHo1NW9BT1YvaGZMcVdZL2JSNkVUWXNZQUg1V2xEb0lYM3lJVDczSzhi?=
 =?utf-8?B?UjQ2RGFJWUhxUTB3TDhqYnU2MzdxcHFVQTNWa3pZeVJnWjEreXdFTFRFNmlG?=
 =?utf-8?B?TVg2YWd5NGo2bXV3U3JoOWFDeGxSTDNZZEx4SkFmZlhhODUvMmM4UE8zazM1?=
 =?utf-8?B?Z1M2dG1Uem1jY0kvVVFLRkNxOXRJTFUxZnNUanl0SWF4UzVpN2VxeEJ1U1VQ?=
 =?utf-8?B?U1JFUmxQRjZwdXhPVjJSZFRkMFIycFZxN1ZnN0RjNWNDL0orMmoyQTFZdXlS?=
 =?utf-8?B?YzNkYm14OWRDNWtjcUpVTXZVbVNpTEl6eDZzSlAwbkd1UFFJTEYrMXZqK1E5?=
 =?utf-8?B?aldUWDhQQzIzTGdMeGx2V1dXSW12bmRiemFuVyt4ekptU2svUUdEREVoQTNj?=
 =?utf-8?B?Q1ZzV3hGUjVGOVhIQnpaMFpHTnQxWTZQbGMrRDFpeTVDZ0t6WStGVjh6bUtB?=
 =?utf-8?B?K2VTc3owcUMrd2ExbXVmTjFERTRuOEtvRUE5NWdBQW9GKytPYW90QjZPT0p1?=
 =?utf-8?B?QkFVaVQyTXdlbjdqRHBMdWlyUUNYeWZIbjNpbWNDeDlxWVBURlVRdHY4N2J2?=
 =?utf-8?B?a3Nkb2lqNUplTUxIZEZNV0lIZ1V6SzdrcHpxaCttRGFHRkNnV1FOanBnZmZI?=
 =?utf-8?B?cU9FSjJpYm1RcnVIaEs5MkIvYXA3N3VJdm9qWW9xNGlQbVJOMDZ6bE1KWTJi?=
 =?utf-8?B?KzhJTTFJOGxoOTdYK2Q1ejVKQUxvSk1uVVBzS1pJcXNtSTdEcUFTdjdaeEc4?=
 =?utf-8?B?bG1DdnlZemNxa0w0ZlN1QTdHdDliOTR3VS8xc2lnVlM2aERnazhGaDllVjFV?=
 =?utf-8?B?S3ExOTZqc2ZhcC9wUUNJQmJ5dnlhUmx4ZWJTTWR2NllyUkdKYzdFdzRSYkpn?=
 =?utf-8?B?dk9wSVo2Smg1dUlLQ0ZQSWRyVTRRU1h2dDVnS0FkajhITWEyWnQreUgwQnlZ?=
 =?utf-8?B?UDFaUVN3RVg4VTNjalRRSW1aL2xSbmdRSlRVbWpJRXNWQkc0UFB3Z2xTcDI1?=
 =?utf-8?B?UWt3MTZJdlJwQmVCZEt2WkFaK0xlWHFTamJUZ0h3QURBWmZ6bEdzcE9CQ01l?=
 =?utf-8?B?bG5ucTF2L2FBdk5EMkZISmthLzg0UmoyRCt1cm0zM2dpTmNma284WFZQRjBV?=
 =?utf-8?B?allBS1cyUHlKcHB1QjFTam4wUzc5SS85dUdsU1l0QzA0NDNjWlBsWEtaNjRJ?=
 =?utf-8?B?SEIvRFA3YSt0L3NvUlFaR1hLbXpxeFRTQWRveisraEtzbWhjVnVjQ2Z0Uld3?=
 =?utf-8?B?dSt1MVdSc01raUF0NS9LZFYxek5PUWxLMUgxbThQSUVlZjZuME1sdGRVR1ZY?=
 =?utf-8?B?UWhzS3QrOXJpVFNvVGZzZ0F4UnNQdStEWHJBbDlndXVveEhzQjBDTVN2d2Ro?=
 =?utf-8?B?cUNsSHkxOHhmMWV1OTVzWkF6dS9DSzRpWEwzWWVuRkVDUlhQQXdSOXVOVWJD?=
 =?utf-8?B?cFcvRStWblRFMXgreWhNOXBSSzJUbUFlVmZWeXcxSHVlYWJmekpaTTMrVkV2?=
 =?utf-8?B?UlVnc1V5cGgxaFhMWndRSEdoVFRkOVBsWUlxUkkxL0NPRVJYS0pLeFRsS2Fh?=
 =?utf-8?B?cE1BQ1Qwaldmcml2NmdoRTM1MGJtMEFCeFdtSjIvNTZKUVRtRTY1TVFzcGRJ?=
 =?utf-8?B?eFhwS015b0ZLalE3dGZIRUplcjhkUWs5MFZWZnhJUW81dzE5S3FRbEJ2YXEr?=
 =?utf-8?B?c3FqdmNiNzJ2M29la0M3MzZ2SHNoNitQbkNBcUxGelExOVV6VUJ3SjZJWmdD?=
 =?utf-8?B?TjludVVLdDRGMlFJaEtSTC9uY0Q0azBDbTJ0VTl2UVBKRk1JWDF3d0F6TVRr?=
 =?utf-8?B?NjJzRlZ2cFh1MlR5amNQMWEwUlBRYVZ4cklQTDg5SHNJRGNaU0pYek1NNGJs?=
 =?utf-8?B?ZitaZDRnQzdqSWY0WTNFazRSK3hUY05PdUlnL2JLVWsvOWdVMzNFUlhicGNW?=
 =?utf-8?B?eGJQTUg3S05EdkZZOE5YTEJTREU0UFVpRHdjMTFyWERvb0RmWDVzeE84a2h4?=
 =?utf-8?B?Y0RobmVYbmRBcVNTazVzaTgwemJhdGhyUHpwRmxFbUVnOUJtdEE3T01pS1N3?=
 =?utf-8?B?YlhvUDZNWTFndVBxMFUzZFc3TCtJMmZ1WkJvaUFYV2JvNW83UG42UGpOQytl?=
 =?utf-8?B?aTdBSTQrZDhyZGlIK0NHN0txeDc4eWwvUzBwUnVEODFOUXJRMHAvM0xVYy92?=
 =?utf-8?B?S0NXMENFK3FlQW9ieFlkUEQyNDdHRi9KdnR5TG1CTmVpVUdIaCtOZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0911f657-0be0-4f03-331d-08de67e6d715
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 14:23:48.5254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gl5wwBmj8DrzWQiGmUYI1FMLijPyzXZHu8LUeE0JQkqOClxdb/BX6AQtPJSwNukkUqgU876Dzz7Otb7UidIFbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR03MB8160
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Bertrand.Marquis@arm.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,stdgnu.mk:url,citrix.com:email,citrix.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: EB1B3110329
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 01:42:05PM +0000, Bertrand Marquis wrote:
> 
> 
> > On 9 Feb 2026, at 14:39, Roger Pau Monné <roger.pau@citrix.com> wrote:
> > 
> > On Mon, Feb 09, 2026 at 01:33:13PM +0000, Bertrand Marquis wrote:
> >> Hi Roger
> >> 
> >>> On 9 Feb 2026, at 14:26, Roger Pau Monné <roger.pau@citrix.com> wrote:
> >>> 
> >>> On Mon, Feb 09, 2026 at 11:46:44AM +0100, Bertrand Marquis wrote:
> >>>> Xen does not provide a Darwin build configuration useable on Mac OS.
> >>>> It is possible to build Xen Hypervisor (tools are not supported) with a
> >>>> toolchain able to produce ELF binaries (GCC or others).
> >>>> 
> >>>> Add config/Darwin.mk to include StdGNU.mk and force
> >>>> XEN_COMPILE_ARCH=unknown, ensuring Darwin builds always follow
> >>>> the cross-compile path so compiling on Mac OS is always handled as a
> >>>> cross compilation case.
> >>>> 
> >>>> Only compiling the hypervisor has been tested !
> >>>> 
> >>>> An example of how to build the hypervisor for arm64 on Mac OS
> >>>> (tools cannot be build for now) using a compiler from brew:
> >>>> - brew install aarch64-elf-gcc aarch64-elf-binutils
> >>>> - make XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-elf- HOSTCC=clang
> >>> 
> >>> This needs 'xen' target passed.
> >> 
> >> Without any target, xen is built by default so i kept the simplest possible command
> >> But I am ok with adding xen
> > 
> > With the `cd xen` omitted, won't that also attempt to build the tools
> > then?
> 
> This is supposed to be called in the xen sub-directory not in the main directory.
> 
> Now i get why you wanted the xen (and hence why there was the cd xen before)
> 
> Maybe having -C xen would be a better idea, building from main Makefile could
> bring other side effects i guess.

I don't have a strong opinion, both -C xen or xen seem to work for me.

Thanks, Roger.

