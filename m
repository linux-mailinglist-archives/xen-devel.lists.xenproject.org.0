Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Nt4C6cni2m6QQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 13:42:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C8511AEDA
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 13:42:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226367.1532899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpn3N-0007Rh-1V; Tue, 10 Feb 2026 12:41:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226367.1532899; Tue, 10 Feb 2026 12:41:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpn3M-0007Od-UX; Tue, 10 Feb 2026 12:41:16 +0000
Received: by outflank-mailman (input) for mailman id 1226367;
 Tue, 10 Feb 2026 12:41:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tYRw=AO=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vpn3L-0007OX-EU
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 12:41:15 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8c25483-067d-11f1-b162-2bf370ae4941;
 Tue, 10 Feb 2026 13:41:14 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH5PR03MB7911.namprd03.prod.outlook.com (2603:10b6:610:216::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.17; Tue, 10 Feb
 2026 12:41:10 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 12:41:10 +0000
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
X-Inumbo-ID: c8c25483-067d-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vBA3dAod8fysZ2ycGj6uAr3DSCW2N+wc2fMtHFf05mnBnSivb/ynSO7z7kn6q9Xs84gvieI170u3sdESr8M09wiBPtxjJESDV1zX46bWTDJlW053IwrjAXT2ACkKSsL4KEBHmZ9EwUA7uKcq5BXQjGr7rdYrBFEtNPbJL5YrS5tXEYIPXr61X4UDTiMukBJHHal6fBhBWyVX0Kmo92lu9e6NhGlJ4xWGLaGbIQHRdAO0fUFI57JHjZvCCxzr6zBzulN6VgbaZzzeAQSV+0AFRFsR+PS6HjuqlDsbtIS4vDZJNbMkfQjGdAqKTK5QGYSvbKZAVkfwW3QZcxrIIDcJsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+c3Vo6K1nplnoVPLQhq8r6K31zwiP+dmss/NZ0iDDfc=;
 b=zO7rvjHFUJFnwiLNCQcql6YIHKLOl389Xo78tLOx5kQ3WVL8QNWPeOgPIs0GILsGpzBSMU14xMxZEVMghwK/PkuKGIgB6OtDU6EwzSUPRwK7E4ix+FVmDZRg7F9ClaHLxip2roEVJS1ZAIGnHN2WjaK3LZTmgjcKRXPcX1I57V/2IFhvMMwjecrVo5eIY2r+OVN0dX1mbTsVSbQ2upLjUYMw9hBqZoyFS2UPZefYPyj3/r6gp+Ulgy6sc0kMRQSdF4fDraGXmU9WXWLJt+GhCcMZMqIj69qXdXEaPj4BhyGRiAl1yEeJ4WFaI1eA6c/o9inWMHeYqT7Ewvt8pnarAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+c3Vo6K1nplnoVPLQhq8r6K31zwiP+dmss/NZ0iDDfc=;
 b=Q9w6XCRY3Od5cs/PGAa9h6wIW3sSxcOgngSUuJ1AY/NIVuePFp+9nklMAsBu3jlbMTvmQ70W25uQE354d7HgdWsx7dCOfMlOBcBmjQ5+t95svHEoTa/RvyL/IPGmVjVvQpWNC1SdHgCOAm6N65AZq07xb00WePS1Mv2712b3BUE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e1080ebd-8e8a-4914-8979-95445e22e5c2@citrix.com>
Date: Tue, 10 Feb 2026 12:41:07 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 19/22] x86/pv: Guest exception handling in FRED mode
To: Jan Beulich <jbeulich@suse.com>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
 <20251003225334.2123667-20-andrew.cooper3@citrix.com>
 <008cb741-26e2-4f28-9dd9-c88f9fbba743@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <008cb741-26e2-4f28-9dd9-c88f9fbba743@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0142.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::34) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH5PR03MB7911:EE_
X-MS-Office365-Filtering-Correlation-Id: c790bdb3-0ca4-4835-a112-08de68a1ab64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b3lyQk9uYy9JTmtoeHRHdXdHclVPSHBhUDFZeWNJR25CbHAwajc0QWpQb2tD?=
 =?utf-8?B?TkpoWHdFKzBlWU5oZHRkbHorM2hza1c0ODYyaW5GZXB3dnRTdFZUYjlmU1V2?=
 =?utf-8?B?SmFtUTE4YS8yU3YxVm5WT00zSkxML201dEo3b2ZXTFl1SEFEdVcwOVI4RVNT?=
 =?utf-8?B?cGZDZUQ0RFdqMWh1SjFlcXVoQjdFUGFXQzhrY2lsSm5WWnJETWM0emU5YUN0?=
 =?utf-8?B?N1YyemhPMDdNcmt2L21hYllueThTYUh6dWhvclc2WmsvbjlYQjZUMDMxTXJP?=
 =?utf-8?B?elJZSDdjWVBBRStnMDhOTEwySDdnOTlMcmNxbWEzZXc4dHRmeDhRNkk0SnU1?=
 =?utf-8?B?RW1TYjJWZjRoUEw5RkZKMDZZV1JwVHg3S0lsOGdJd3dPc3k4QUpvZ2FrSW5B?=
 =?utf-8?B?OFQwd3BBNy9zTW9FVG9tTTVhdFdqSGJ3SU02UWdOcmtuK0xhTmRYVnlGTmIy?=
 =?utf-8?B?ampDTUtrSUVodzNMR3owNWdoVkh2bDNMbEJjbXRwYU1kc1B3VGg5VHZuYVls?=
 =?utf-8?B?a2dDWWxFYlJBc2ZCRnowbDM5TnQ3UVpxYzk4ajkrWjR5d2tMYkdtaWgzMTRM?=
 =?utf-8?B?dSswcDNFWFhhVTFGVHR4ZDlSUVZ5UTYwMXZYNEFCUlduVThCQnpsZWg4M25G?=
 =?utf-8?B?UUZDTjdoKzNXQjdqL0lOMm80R2JsTm9LbG5Bd01nTWttVEtibmd4S2VoNUFz?=
 =?utf-8?B?M3pFMSs4SVk2WTVFZE04K0dqbld6SDFaWXhid0ZFc3EwbXJ6bGdKZU1XNC9V?=
 =?utf-8?B?d01kZlNONi9kaDE2TWRXRU9BNUtESW92d1EwbXBSMjVoUHpVRDVEd00vUEp2?=
 =?utf-8?B?WGRMZDVNdmM3YWdLZ1YrSHRKMnJmRWhCZUo5N2syMWZLak5MRG1qNWEyVVhQ?=
 =?utf-8?B?Zkw1STNYSU9IbW4rTEczZUJkU2hiMWVoOU1XSEQ4TGRqQm94NG1pM2I4ZzRQ?=
 =?utf-8?B?ckxtaHVuN29PUmsvdFhOZC9hcW9hd096aG9FL0xub1BPeEhGOWF3UTdqTTlT?=
 =?utf-8?B?T21meXBFeFEySjlLYWhNSmsxNTZtNmVubmpvSC9UUnVzTkpmTCtTVlJrdFMr?=
 =?utf-8?B?ZldUWGZsNGNHRXJ3L1JFTlVpblVRcVk2d2d1aVYyL1pjOEtaOFBtY09mY3Fi?=
 =?utf-8?B?NGJUL01Yd1IwVWVHYnRwWDdKYTVhdm5mNnRqdEJQVUxiM2NmNnEvRnVwMXFO?=
 =?utf-8?B?STVmbTh0cW1wbTJIWUtnUnRKdTdkTGN4UGVhSlFLQ1ZSdUFOTXgyNDFzb3gx?=
 =?utf-8?B?OEhXNnJ4b0pyM3ZvQ3hBL01VaWt5LzFMS0lvT2lwekxOaDl2R1pHZjRSR0dE?=
 =?utf-8?B?R3ZJbHEwRGxGa2V6T2Y4VEI1NTNWRnZYbVliWCtuU1BCa1dBbXh6ME51dmxk?=
 =?utf-8?B?bnY3YXR3c1A0TjRNLytmUGNTT2Y3cDQ0czI1VDVnaXFiMFpsZlNDVnAwbEhs?=
 =?utf-8?B?U1M2SzF2N0lRdG8yem1tRTNzUCthZS9WaGxtZ3hRUUd3VXhQNDRaWVRORzdE?=
 =?utf-8?B?eUtuZEJvMHVjYXY1QXFyT0RuWXdBN21kbktVUC8vS3MwUiszNFpNMVczdDdl?=
 =?utf-8?B?czFmVVBmVDJaZCtiSHlmWVMwWmZuc1VEejhkYXpGdGxjcGx2WlRlQ3NzZjlP?=
 =?utf-8?B?V0FGTERWNlZpQTVqbVB6cUVuRHhXckZJMGpubFFiLzhrTGJvcVBNQXNKYmty?=
 =?utf-8?B?M3E1cUFTZ0tEWE9oNlJoVFMvSWxBMVdmU2VlMUxOOVdxeTNBc1lydW9LR2Q0?=
 =?utf-8?B?TWVnVmFqaUFGWmJ3RXRibTN0QXNoYTIrU25NWlk4a0VoZGp3R3JRNmUrNlFW?=
 =?utf-8?B?MTArVDR3TXZxSk1WREp0VkRoQjVVMWw0SEJReFRydHNEdHJOVTh6alNSd3M2?=
 =?utf-8?B?UVlCK1pJL2h6WEJ2Z2w3VHhIYVFxKzltVTZ0cDVtWm96cW9SWWFOdEJoOE42?=
 =?utf-8?B?Zm4xUnp2dHpxMFZJNnpKMlVvNGlVdUdIWUtrdHBLWEJtdUNmMmducGcwMlpS?=
 =?utf-8?B?bytrU0dIb2M0c1Rvb3Qvc3IvRDNoNjZ2TDFPRmZDQkpkaWpjR09nUFk0dGFJ?=
 =?utf-8?B?MUNFNFVYUDRTRisrM2JPTmQ5TmFQSmNCY3lUM2NESWx5cmxabUFTNFJvVGtn?=
 =?utf-8?Q?pTMU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVFkTkZ4aXFla2FSeUtOWnQrTWQ3S1BIMkE1SGcrcUM3a0Q5Tm9tWVZJSVM2?=
 =?utf-8?B?RURjSUhVS1JLTUxSY1p4N0Vra1R1eEpsRTFlbUZIQVRwd1I5bllqVGt6L0tx?=
 =?utf-8?B?eUxXMi96OWEwUlhGQURkNkhsS2JwYzJjaDd4azl4UHJPaWhTK3JRNFl1TStG?=
 =?utf-8?B?WWNpY1NEVXppWWkzYUJGK1gyU1ZYQkpTVWJ2NkRuUzB4NE40Z3Y5aGQ2U0Qx?=
 =?utf-8?B?a3UwVTlpd2lmRWRpTm02RTJwcnAreDJISlRLZWVTQXo5SHRNNkV3cTltQzNi?=
 =?utf-8?B?bVZNUkxyMzhDbXI1RHEyZDArNTV1VDBwNHR3STFLZG55WUpYcEYrbkIxbEg0?=
 =?utf-8?B?V1YzbFdidXNJOUFnTVQ2NktUSTcvV0lwbEc5YUlUNzVEdGIxUkZPL2NKd3Qv?=
 =?utf-8?B?NzVtZWxhN0lPZWFERTcwNTREajlpcXRjcGNzVi9DNXdKeDB4UTkzMGtDUVN3?=
 =?utf-8?B?MjAvbXAwMFJITGcyNXNFNk1kN0svOURMOFd1Ymg3c3Nram5QVWpQbW5LTVdG?=
 =?utf-8?B?amVISUc3UnBmQ283aW1BK2lZb0ZURUl4YXVwQmI3TUhrbmJBemcwdWtkT1ZR?=
 =?utf-8?B?YUMzRmh1UlVxbFRBbEZiUWZuSm9WQkRCdDk3U1BxUUN6NFhYTlg5OFF1Zzd0?=
 =?utf-8?B?dXB6ektmK2l0dDBKS3dIQndrdk1TdW5tZHFSWC9WdEM2ZGJHaVlZMXd3QVpM?=
 =?utf-8?B?WmUzMWRsK3lkSGdIcktiTkpFeXBuOFpVWm1BanVTOVkxMkVWZjJZMXJaQytR?=
 =?utf-8?B?YkdVSlZ6ZlJackhucjZVYkxINHFtQ2RYOUlmSG5tRkJUSlN6cURRTjIrQmNm?=
 =?utf-8?B?KzBBMUMyd1B6VEdHOWdiYVBuRUd3THFySWhjRUd4Tm0xY0JzZkVldUpaVDNQ?=
 =?utf-8?B?dHZFbW9XWWczSGxia3htL3YrRDFpRXc2d1NLUVdKbm8yU2xwVDc3RkxJMTk3?=
 =?utf-8?B?VTVtL2VLUG9YK00vTE1QZnVtTGVjNHNUV0lvVStYMWFtT05CTXBEN3FrVG5s?=
 =?utf-8?B?VG1KcnJlcTl5S2NnYlJ6eTRFdG5sV01rc1BCWU9mVDFLMGhlbi81WkJhK2hu?=
 =?utf-8?B?UDIvc0lWbXhQejZOQmNNNUJxTmtkUVY0ZHRITE9oKytEalROZEhoSGN0dE1w?=
 =?utf-8?B?UHBKTWwyVlBwTTk4d1RVdWtEQ09BcDg4SEdsVFVWY0JGbng3RDNZblZJTHdB?=
 =?utf-8?B?N29XT3h4b2N4T2tKSW9SY3grMldRR1VRb085OHBWNzJkUDNmWVJnV1k3MG5t?=
 =?utf-8?B?bHM2WkYxTElobk95Zkg2TnJNVk5Kc1FOZ3VPQjVXUHRpdVdpckVSSFA5cjgx?=
 =?utf-8?B?Z0ltUkdzbUlaSHNSeHVUeEJxRUh3ZkU5bWhKbFNjcGk2Sm13VWJsTzlERmZs?=
 =?utf-8?B?dHBoZXNMUFRjNFFtZUloWWxsQ3RSNU9iMW9rQ2NWTk9Nb1NaMWw5VllzWGlm?=
 =?utf-8?B?UEtRdTlhNHV3N2I5T3FjT21JaHE4ai90UFRqWnFxd1dsa29UTUxrT24wdjlq?=
 =?utf-8?B?ZXZzbVVxYjYrTXlNWkJxTk1JZmNPM2pScVZHelJpOHh0RERNUk9kMlhrMXQ0?=
 =?utf-8?B?WXczY0wwcGZtNHZHbGpNckM4TnoyM2tNR3FJRlNqOUJBUU14WVVQY1FBMFA2?=
 =?utf-8?B?eGNpZEtrNkIrb1lhOXlCNmtnbUdqYVJzM1RnNmtRd0NWNzIxS3dqUUxtclpt?=
 =?utf-8?B?ZkxpMS8wOWc2MVZ6RUhCNEpjWnBKQ3BYbnNqODNsMS9SdzRpcWVoR3hnS1JX?=
 =?utf-8?B?eThLblJLMUtGTzZkd044SlpZZXdka1pxMElYVCtSWTdMSGI3eWhDQkJpZDBr?=
 =?utf-8?B?MVc0NWlyR3p5OXNtSWg1K0VGZVVJaWRoZys3cHg1eEgzYTIwVmtSdk9MWXVK?=
 =?utf-8?B?SWxLY1hhUUNYK3gya3VKajRWeGVXYW8yem83WmU2eFB4clkyQnp1ckxCaENL?=
 =?utf-8?B?aHdvZmZ3UC96WG5jOVBQdTNvUEtWT1lneGhDVDVlVEZMS3hCZGdvYUgwMjlV?=
 =?utf-8?B?cE5DNERsNVlYUGEvZVdyZ1ZQZzlNUnVYOGJTbW54V3pzYnkyd29hR0RMSW5L?=
 =?utf-8?B?RDRqcFdaQ0VlaUZBU1NqalZFclo1cXhidk8xNG5Ub1NYR29tMmFyYkpxU21H?=
 =?utf-8?B?dW41ajVzQnpjZjlYQnJBMlNneDI1NzdHVElPbTlFaXlqRGFOekZ1SFBxZHE0?=
 =?utf-8?B?OTBmZ1FPSktYN3dha2h6L1k3ejJqeVJoZDlLRU9BWnNNRzN5cUxLNFJoYjlu?=
 =?utf-8?B?QVYxOTlNelczcmduWVhHcUgwUUZZa09UTDArRHh6OXFycXBzN3QweHZpdWx1?=
 =?utf-8?B?K3pBZ21nSExvbGY1aVRDS09OWUUzYy9JNUpCMW1BeUh5WDNneDZBUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c790bdb3-0ca4-4835-a112-08de68a1ab64
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 12:41:10.8589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1M+RE36fIr4fQvoOi6zIcn7xnnlWQZDagIxiasjAPOMTp06qUa/17GWhm2vA3K6MkB2r4SR9fVO9NSJxENBOou3CuOuHJtLPx6DDPXlxkP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7911
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:mid,citrix.com:dkim,citrix.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 69C8511AEDA
X-Rspamd-Action: no action

On 08/10/2025 1:28 pm, Jan Beulich wrote:
> On 04.10.2025 00:53, Andrew Cooper wrote:
>> Under FRED, entry_from_pv() handles everything.  To start with, implement
>> exception handling in the same manner as entry_from_xen(), although we can
>> unconditionally enable interrupts after the async/fatal events.
>>
>> After entry_from_pv() returns, test_all_events() needs to run to perform
>> exception and interrupt injection.  Split entry_FRED_R3() into two and
>> introduce eretu_exit_to_guest() as the latter half, coming unilaterally from
>> restore_all_guest().
>>
>> For all of this, there is a slightly complicated relationship with CONFIG_PV.
>> entry_FRED_R3() must exist irrespective of CONFIG_PV, because it's the
>> entrypoint registered with hardware.  For simplicity, entry_from_pv() is
>> always called, but it collapses into fatal_trap() in the !PV case.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
> Nevertheless ...
>
>> --- a/xen/arch/x86/traps.c
>> +++ b/xen/arch/x86/traps.c
>> @@ -2266,9 +2266,82 @@ void asmlinkage check_ist_exit(const struct cpu_user_regs *regs, bool ist_exit)
>>  
>>  void asmlinkage entry_from_pv(struct cpu_user_regs *regs)
>>  {
>> +    struct fred_info *fi = cpu_regs_fred_info(regs);
>> +    uint8_t type = regs->fred_ss.type;
>> +    uint8_t vec = regs->fred_ss.vector;
>> +
>>      /* Copy fred_ss.vector into entry_vector as IDT delivery would have done. */
>> -    regs->entry_vector = regs->fred_ss.vector;
>> +    regs->entry_vector = vec;
>> +
>> +    if ( !IS_ENABLED(CONFIG_PV) )
>> +        goto fatal;
>> +
>> +    /*
>> +     * First, handle the asynchronous or fatal events.  These are either
>> +     * unrelated to the interrupted context, or may not have valid context
>> +     * recorded, and all have special rules on how/whether to re-enable IRQs.
>> +     */
>> +    switch ( type )
>> +    {
>> +    case X86_ET_EXT_INTR:
>> +        return do_IRQ(regs);
>> +
>> +    case X86_ET_NMI:
>> +        return do_nmi(regs);
>> +
>> +    case X86_ET_HW_EXC:
>> +        switch ( vec )
>> +        {
>> +        case X86_EXC_DF: return do_double_fault(regs);
>> +        case X86_EXC_MC: return do_machine_check(regs);
>> +        }
>> +        break;
>> +    }
>> +
>> +    /*
>> +     * With the asynchronous events handled, what remains are the synchronous
>> +     * ones.  PV guest context always had interrupts enabled.
>> +     */
>> +    local_irq_enable();
>> +
>> +    switch ( type )
>> +    {
>> +    case X86_ET_HW_EXC:
>> +    case X86_ET_PRIV_SW_EXC:
>> +    case X86_ET_SW_EXC:
>> +        switch ( vec )
>> +        {
>> +        case X86_EXC_PF:  handle_PF(regs, fi->edata); break;
>> +        case X86_EXC_GP:  do_general_protection(regs); break;
>> +        case X86_EXC_UD:  do_invalid_op(regs); break;
>> +        case X86_EXC_NM:  do_device_not_available(regs); break;
>> +        case X86_EXC_BP:  do_int3(regs); break;
>> +        case X86_EXC_DB:  handle_DB(regs, fi->edata); break;
>> +        case X86_EXC_CP:  do_entry_CP(regs); break;
>> +
>> +        case X86_EXC_DE:
>> +        case X86_EXC_OF:
>> +        case X86_EXC_BR:
>> +        case X86_EXC_NP:
>> +        case X86_EXC_SS:
>> +        case X86_EXC_MF:
>> +        case X86_EXC_AC:
>> +        case X86_EXC_XM:
>> +            do_trap(regs);
>> +            break;
>>  
>> +        default:
>> +            goto fatal;
>> +        }
>> +        break;
>> +
>> +    default:
>> +        goto fatal;
>> +    }
>> +
>> +    return;
>> +
>> + fatal:
>>      fatal_trap(regs, false);
>>  }
> ... I'm still somewhat bothered by this almost entirely duplicating the
> other entry function, i.e. I continue to wonder if we wouldn't be better
> off by eliminating that duplication (say by way of an always_inline
> helper with a suitable extra parameter).

They are not sufficiently similar.

By the end of this series alone, they differ by IS_ENABLED(CONFIG_PV),
the condition for enabling local interrupts, the ERETU fixup, and the
SYSCALL/SYSENTER handling.

NMI handling is still an open question (deferred for now, because it
functions, albeit inefficiently) and adds a further difference.


>
>> --- a/xen/arch/x86/x86_64/entry.S
>> +++ b/xen/arch/x86/x86_64/entry.S
>> @@ -63,7 +63,7 @@ UNLIKELY_END(syscall_no_callback)
>>          /* Conditionally clear DF */
>>          and   %esi, UREGS_eflags(%rsp)
>>  /* %rbx: struct vcpu */
>> -test_all_events:
>> +LABEL(test_all_events, 0)
>>          ASSERT_NOT_IN_ATOMIC
>>          cli                             # tests must not race interrupts
>>  /*test_softirqs:*/
>> @@ -152,6 +152,8 @@ END(switch_to_kernel)
>>  FUNC_LOCAL(restore_all_guest)
>>          ASSERT_INTERRUPTS_DISABLED
>>  
>> +        ALTERNATIVE "", "jmp eretu_exit_to_guest", X86_FEATURE_XEN_FRED
>> +
>>          /* Stash guest SPEC_CTRL value while we can read struct vcpu. */
>>          mov VCPU_arch_msrs(%rbx), %rdx
> I also continue to wonder if we wouldn't do a tiny bit better by using
>
>         ALTERNATIVE "mov VCPU_arch_msrs(%rbx), %rdx", \
>                     "jmp eretu_exit_to_guest", \
>                     X86_FEATURE_XEN_FRED
>
> Or by converting the few jumps to restore_all_guest to alternatives
> (duplicating the ASSERT_INTERRUPTS_DISABLED there).

I'm quite firmly against this.

Sure, we could save a 5 byte nop, but the cost of doing that is merging
two unrelated pieces of logic in a construct explicitly to signal two
related things.

The added complexity to follow the logic is not worth the 5 byte nop saving.

~Andrew

