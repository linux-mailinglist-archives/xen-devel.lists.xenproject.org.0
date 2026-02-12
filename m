Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OA9UBc/njWkm8gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 15:46:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 708E412E784
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 15:46:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229152.1535163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqXxf-0003cv-LW; Thu, 12 Feb 2026 14:46:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229152.1535163; Thu, 12 Feb 2026 14:46:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqXxf-0003aV-Hy; Thu, 12 Feb 2026 14:46:31 +0000
Received: by outflank-mailman (input) for mailman id 1229152;
 Thu, 12 Feb 2026 14:46:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hp9h=AQ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vqXxd-0003LH-A3
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 14:46:29 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9cba75b3-0821-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 15:46:29 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH5PR03MB7838.namprd03.prod.outlook.com (2603:10b6:610:216::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 14:46:26 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Thu, 12 Feb 2026
 14:46:26 +0000
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
X-Inumbo-ID: 9cba75b3-0821-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GISd4GFEL8vXLf5v/9lSvKn2tmQMUWogRTAISxdIdyC/zZWa/f0gVWMsCl4zRv+7BHC+h8OQhDIvdRpDYjEM2yNDRnB4Zey+QKc7xV/HRqIbdPddSA2EdN2vZioMCH9Ji8jAKWGbwD9DZBwmtJ1smGcfmv2AP1lKLMKjB0zYmKhhUUTX5dtOW9LBBYMswU62Xj/GYdU6+zejy2r79GPAFdbQGOnCJ8VM71YHhTFO0Dddjni9Pr4qhr4cPxmdkRk7rCePw7RZD7FHauabbDoCpED4S37WXCypZE7pUFzHQW6PeEZs4plzWGk8iMfizWVk100VEtO+J6q4nbgDh1fxOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wh320IbJQxO6ze/dPB0WWfdclKSpmzsopc5TM88YTsA=;
 b=Aq1ujrfnF7KWsZdCI+HeIHMfnfjc+TcAuNo65xbpf1+9nZ/CZDsOuHt/62S73rvijItD8r4/W/J3DEan8uiXskkhmlqVGu3kfVhyn2nYBRo70glpJHU4RP7sqbrbRsYDnglXie4PjMh2xnjy4u15p/VwTyvX2cUQv+CVjKaRD6vOV0uTqc6Gn7m2RSpKtp2E374laireH6/BXF2qvn+Fkl3kWS6ctQvJJ0jdp3+3FBfMXRayHQYy909j+kGXdngKKMtFi4iLe+xILgY2iOj12sypKDszD3n9KOhdLfWKSML2p3LxkR/7Ij79XBBBK1ADPYpRvqXGUXzUMmN6UwIH2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wh320IbJQxO6ze/dPB0WWfdclKSpmzsopc5TM88YTsA=;
 b=vsP8R8hzPglWWZwS2aD2QzmkW0GS9gaus9uVj7Hjh+S0SLI05ve3e/cdbWxZFdGpIcpaKOyXgMhzh7o6q+wKKPn/88X8FkfpnD+Fv4AYAkh/pfgaBVSmmOF0wyYNIotMYMlxPsOMAsNC1fwCmu2fbCxanbsKTvZvGgwlItJ/kqA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 1/5] xen/x86: always consider '/' as a division in assembly
Date: Thu, 12 Feb 2026 15:46:14 +0100
Message-ID: <20260212144618.43200-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260212144618.43200-1-roger.pau@citrix.com>
References: <20260212144618.43200-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0029.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::16) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH5PR03MB7838:EE_
X-MS-Office365-Filtering-Correlation-Id: 3adfb911-633b-44f0-8a4e-08de6a457fbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aWF4Q2NsbXpocmk0NklDSm9XVFlHanVrS2cvSlhXcWVoNGRoY25ZVUJhMEU5?=
 =?utf-8?B?QnZ5TWExTi85Sm1yU1ArNjJXekIyK2NCY3A0SmthWDZuMGo4Q1dPZlNkU2Vo?=
 =?utf-8?B?bXA4MW4yRVhYSFBFT0l3N3NTeC8zN09LYU5wS0hSZllqTHRkN3pQSFQ0bVA1?=
 =?utf-8?B?NUFSOE50d3VNT0tYNW5GV0hiYVoxeFZkd2dWSE9UOStJa0lOc3hNaHFzSFdY?=
 =?utf-8?B?bVpkSTFjNXlwYkVwbWdxcm43d1JBZ1RnZFFIYVF1N3ZvVDNyTndJSS9xM0JY?=
 =?utf-8?B?VjgxY09HQ3hORmh2ZFZzeUwxNHBqUm9Nc0FaRXV5TnViZ29lTVpNTHZWOHhT?=
 =?utf-8?B?NXJuOGEyTnRiRTZ2TWRqUElKTERKT05Ia2xDZWtwZGhlN3ZBZ3hUS0gzVXk4?=
 =?utf-8?B?QkRUU1ZveEdXTkF4K2VSSGFRZGRqUDdldmhaY3pzdlFNSVNjQ2tMekRLK0lS?=
 =?utf-8?B?TFJuK2U3b2dvdklkNFZUcXZOYXNEdEY2dmlBSmt0S3lWQ25aZ3BZR3pkK0ZE?=
 =?utf-8?B?c0tYL0V0cWhHVFE5aHRRVXRibzB1a2dFM09FQzFJOGpNSGt1anNMWGlyb1ZW?=
 =?utf-8?B?NEtTQ1NiSkdHZWR3S3g3UENsRnVvUFFqazlvWEUzS2wyd2FVSHZoL28vT1o4?=
 =?utf-8?B?eWd0RFQyYlFib2lpS000ZHdLMzBQR3pvZGZ4NzBZWTdqL0d3K0orZUpETkJh?=
 =?utf-8?B?TnQxR1Q1Y3FpckZvY3krNVE1TEhnYkRiMUl6STY4Y3VNeW4zOEdQYUlGRkVU?=
 =?utf-8?B?RHFRa3c2VVdhNVpMMlZUcStxU25RQS9sMWV0UDFVSUMzeWxwZGNKSkI0NUJk?=
 =?utf-8?B?WmhJUnRRdktuRUQ3ZG5VWjMzL2lWNmVPbkJGQ2d4Y01lQkQ2MFI2QnNSQWxu?=
 =?utf-8?B?N3QvekNxYTlkR3JEc2FsSkZGQys1eTZ4bnppbm9LekV2dGs2STdwdHBPZjF5?=
 =?utf-8?B?ckN5SEpCU01KNkl5MDJKckRBZWhyMXBBVFNUaUJaUmMzeTNWRmlkRFBrdUN4?=
 =?utf-8?B?YW14dkVPUlNNdjVPN0JPS0Z0MVVyd29yUkxaK3FNalNJYzY2LzBEMzk5WTVx?=
 =?utf-8?B?VDNNWGRBbGk0ZnFXckExUUVEQmw5dDJrMGxOK0ZhZkZzRE5OL1VwUDIzWEVI?=
 =?utf-8?B?ZU1TK1FUZXVianRHeldsN3NzMDFseHFBZnBMVnQxU0pKTXk2citTQmxNeXN3?=
 =?utf-8?B?Ulh0VWlzdkJ1N1NGVHo5cUQ1K2I4WGg0bjAzdnRtZU52RllUUU8vVnQwYlFG?=
 =?utf-8?B?dU1CQ0VGUjI2bFFwelRHdkR6cGZuSVFheGFWQzNpVzd1Ukc1a2tBZFRiR0lE?=
 =?utf-8?B?QWNLV3M1aXZ2ZGRZTnFqZ2VzNjlycTFoV05CcjU0QlhrWVdFcHBvSHZ2dGRC?=
 =?utf-8?B?NFJ4ajhMUG9qVnpDSkJ4ZVJkZXN1dzNxcjhZL21yT2UyOVduOTdrQ2NJQ1FH?=
 =?utf-8?B?bnRkdVpjcGVXVFlJYUg4MURrWWFnbmpCdUFpenpKWWFVcXpkNjkxckVNb3gr?=
 =?utf-8?B?b0JHTjZteUcwZkJpZXdjNVUvOWhZUXlFaUY5MUhjSFEyL1ZqMTdBOE9JTWhs?=
 =?utf-8?B?YzJtNU9OSCtWT0FydDYwUk40NjdWUFNlcm8vYzBnOVlQaTRDQi9nN1pBeWVm?=
 =?utf-8?B?Mkd0QldyQWFMdmtsdFB2WDR3eFFoZUR5SUpRU1JzR3FIZkZ2QllqSEhNUmc3?=
 =?utf-8?B?QzJrTmJKQ3I3S25vbmV6bHVPNi9CZWhrRG1RSkNxUmYrNk1OcGJEWGJnVE5Z?=
 =?utf-8?B?VEcyd1NOS2hMTm1PeDFEaDhWbzczNlhsQjk4SU1kMUlDT2ExeXIvMkk0MGpB?=
 =?utf-8?B?cU5LWWg0R3pQMlorZUV2eW1oL0V2MFZiejRGeU4veHlUaWhTYjVZNy85Ri8v?=
 =?utf-8?B?ZFVnb2pBZVNJSUQvMUY1WTM4QTBHaEw2dTJvVjIzeFJqVlhsUXZhZGtyUnZJ?=
 =?utf-8?B?aWVCY0kwQk1xWS9jYUZlajllY0pBMjVhTy93Wk8vWjR3YnJkYkE5OFlTSHZy?=
 =?utf-8?B?cTRWZmlWQnFnMExrYnRUMDhJK2MzVzIzZjluVm5lQXBjNHR1a3pqOTcyUHJa?=
 =?utf-8?B?NDU4bVZQOGNZUy95RzZkcGcweVNhUkJiQVhweHBzZTNGT2h2UnNPTlQrNld0?=
 =?utf-8?Q?ZVIk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZURZSVRIYUx1K3RmOFUwdUJYS0pBNEYwV21GaWxTTVV5MkxNbjZWbDFBeUh0?=
 =?utf-8?B?aTZGaFh2cU5aT2x0UGs2THl5VStxVGxFVlpRanZyZHRRU1k0QlRvQUNaQkxH?=
 =?utf-8?B?bmRpblJNZytHTk84ZTlhZ1BnbERTM3l1WHdPdk43S2k2TThMNE1SSlVKYWVk?=
 =?utf-8?B?cXU5TGZVRS96UENqVHlENCtudkRJQ0o0VUh2RFgxMDlFNkdZVGkwaXRHbjJu?=
 =?utf-8?B?YUFmZE1iczBwSWtEeFFIczRja2w1bVZ3djMrY0srVEt6WHovVzZBaXFYelRL?=
 =?utf-8?B?Tkh3cDV4SjYwbGRvWVV5MkxsNTJPRmpITUZBNW9xbG02QTdRKzE0UmVPbkdJ?=
 =?utf-8?B?eXNrV29hZG01RVZzRWx3T0xKQlMzTjg3ODlIbUFNNDlQalBNRFFOV1Q2Y2lM?=
 =?utf-8?B?S2NGcUVjSGdvNDgxYnp2ek1QcWJLMHViZ2g0YngvazB2M1pDZ00zMVRHVUN1?=
 =?utf-8?B?R1Y1c2cxLys0YnN4VFRlbWcvaG5vZXhtNTQyZTUySWFzMEp3SVdqRnFLZ291?=
 =?utf-8?B?Mk50eTF4ZktlZkVRTUVlQStjdjFOYnpuYzRhb2tPTTNsRmtyRkxTVkpxYTFZ?=
 =?utf-8?B?b2w2b01JWk1mOTBzNVVJQjdTOE9aUm92di9lckJCSVF0R1p1UGhrOG1mUXp2?=
 =?utf-8?B?WlZGUTAvRlBPUHEvUllES2tzUXR1U2RVaTMvRjE2VG5ac3pNVWFXK2lxb1lS?=
 =?utf-8?B?SjVMUXJhdklxZG4xVytncjljSmFSTjc2bXFlZndFbStGNXE2NE9pSFE1TkFn?=
 =?utf-8?B?Vm9OZjJFTnVndXZXQkJKUTBkTzZWN1hBV3ltZ1VrN0VoZ2tCemhaNVN2SVFU?=
 =?utf-8?B?SkJXT2x5cWhEZ0ZCV2lBeEhiQkxUNDBwZjQrcDVIdXpEaElsTkhjZWZ6TW14?=
 =?utf-8?B?NDF2dXlBV0N6YXBUdGZ5NzlObmh3dlJtLzEvWVpZWDJ5SG9TUm85MEJZd0tO?=
 =?utf-8?B?R3BlUmMrMWdzb1c5Nkp6STdZWGc2WXpMTHNvaE1MM2Q5a09EdWJrUUJ6Y1ZM?=
 =?utf-8?B?T3laZ0NLMkc1aXFXeEFPdFFUZ1AwK1pxdUlGY1FDcDZwZ2RranRPNUZTcmpF?=
 =?utf-8?B?cnEwYUlld2o5dlE4cnN6Q01oSFUvUEF5SysvZGlzbU54ZE5XWjdMaVJ3Q0Qz?=
 =?utf-8?B?ZnZDRWR5WE1zQVlyNGF6ak9XTmNoUXBoMXVuVWo3cnhBSklEckF0UW8rRzUw?=
 =?utf-8?B?YmVHQ2V1L3o2YXpYMGl2Y1JQT1JEd3ZwMVhpbmVjNWZBOWtIQ013TzE4aDhi?=
 =?utf-8?B?c3V2QlAwRDRiVjVlUWpPUTh6cnhRRVk1VnN2cVVGRFY1V1YwRGxxd3F5QXJv?=
 =?utf-8?B?UEErTHZjYnd4QUcvYUJNLzhDZDdnaHZtYnBETmpKdlpVcks4MzJnbDNzWkc4?=
 =?utf-8?B?aHA5R1JxMTFzWWdidjI0Vk83ZGxKbDZoazhEckgwYVBuMEs5bEdWL21vSi9L?=
 =?utf-8?B?ZkdTYm44MWF5U0xVdmZTTHJyalcxWTBTbGJVWVpHU253L0N2cjI3S3MranZL?=
 =?utf-8?B?ZG5OVDBpYXZFUmJGSnVqYWc2WG93c0ZBWldBTGpCdkQ5aUJyTW5EUUR0MVZC?=
 =?utf-8?B?blpWclR6SGNNVDhIY0hSSC95WWhVWWpiR1NMcHlDWHJPNFpGRWlGRStzVys1?=
 =?utf-8?B?bkVRVVFXemdiSXFzeGNGbHhOcW1WaUM1Z3FUc0ExRStwNDM3LzMvUWxmb01V?=
 =?utf-8?B?bzdwRURZQy9Vc2k4Nmtpbk1UVUVNOWRoRTZPYWVxN296QmN2WXJucWJOMjBC?=
 =?utf-8?B?ZUNFOU5GZEFtVm5OMnJnNWMzTW0zUU10TjBGTERWWGFRV1FKbWNIS1pVeGJk?=
 =?utf-8?B?Nm1DTFVkM0d0dUszTmJ2aDk3WUxINENGV2xkMitQT3RiSXNYZjVXTzJ0VEpW?=
 =?utf-8?B?Q1E0ODdtYlBKNjRsWm9oNW96b1FvYTRRb05sVkhuUmdramtqTUttTUMvTFph?=
 =?utf-8?B?cGg2RWlkVFFxTU1hNWtma3U2VVBSUHZZc0dvSnhIK1V4MUQ5VjJnRlU5Wkc4?=
 =?utf-8?B?MWV0SGgxRzlGSkJrNE5HQjZ0Z0pFaGthMjBZbWxCR1lZWGJqSWRJVm9YNG9v?=
 =?utf-8?B?WFpHVFZiYlV6R2NJZG1Ta3M0RThBb2VtSGZwandlajJWQ200V052RzN1aDkr?=
 =?utf-8?B?dWpQRWs1S21hUkJFVUoveVZVTmFjSXZiWkpIVjNTUS9xZEZUalZvMUNCSjhT?=
 =?utf-8?B?ZWJuajIzd0hmSUtOMFFqbkdtOWxST1dHK1BZNHJVdEhtWjJtdHJVT2diS0lW?=
 =?utf-8?B?TXk2SDh6MGJPL3lncDFzSW1Sa0wxYU5WNGEyWWtuQkpPRGI0b1Z3T3pwdHp5?=
 =?utf-8?B?ZnV4cE9QbU9iSUQyZ0ZrL3M0Uk9qV0NYTkhDL1czTmlueHo4aEtoUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3adfb911-633b-44f0-8a4e-08de6a457fbb
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 14:46:26.3622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +UcHvQq8NeRiqVRtRYumavcULybVQFgkEBG4Q68okwSWoo+SsI0JlknUwrbsyQKNuMXqFKHNN9HrCfstIDZuvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7838
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 708E412E784
X-Rspamd-Action: no action

On x86 GNU assembler will consider '/' as the start of comment marker for
some ELF targets.  This is incorrect with Xen's usage, which does use '/'
in assembly files as a mathematical operator.

The behavior of the assembler can be altered by passing the --divide
option; unconditionally pass this option when available to force the
expected behavior.

Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Move option add to x86 specific makefile.
---
 xen/arch/x86/arch.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 0203138a819a..2e06ae2582dc 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -123,3 +123,8 @@ endif
 
 # Set up the assembler include path properly for older toolchains.
 CFLAGS += -Wa,-I$(objtree)/include -Wa,-I$(srctree)/include
+
+# The GNU assembler will interpret '/' as a comment start marker instead of a
+# divide for some ELF targets.  Pass --divide when when available to signal '/'
+# is always used as an operator in assembly.
+$(call cc-option-add,CFLAGS,CC,-Wa$$(comma)--divide)
-- 
2.51.0


