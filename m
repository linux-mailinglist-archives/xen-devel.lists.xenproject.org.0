Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AmpEoK5nWnERQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 15:45:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B222A1889D5
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 15:45:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240135.1541629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vutei-0008UP-8l; Tue, 24 Feb 2026 14:44:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240135.1541629; Tue, 24 Feb 2026 14:44:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vutei-0008Ro-4w; Tue, 24 Feb 2026 14:44:56 +0000
Received: by outflank-mailman (input) for mailman id 1240135;
 Tue, 24 Feb 2026 14:44:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lz8P=A4=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vuteg-0008Ri-Qr
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 14:44:54 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 605015a8-118f-11f1-b164-2bf370ae4941;
 Tue, 24 Feb 2026 15:44:53 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BN9PR03MB5979.namprd03.prod.outlook.com (2603:10b6:408:134::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 14:44:49 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 14:44:49 +0000
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
X-Inumbo-ID: 605015a8-118f-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W9CSydQaBE/rXCm4oGVIe6U8bvDbaoLnK2ekjiOjaGPXgPV1GqRFM7dODSVyKx8CiaF1zc8xRMlpdIVI1lYFs4s8MEyKvlbNrcuK0IG3IsOJyzTfnU+u4GvB1dtbu808mXeVpW195x6iRoHByQ7QHv91OHMpinUkeSunRR+MjAXb8iLpUphrQXW8rAoBk/41TQoUEQGt3j8mI98MB/EYGfiQ+NJNJMWpBLlpatyetyyytL8svltegs0XXf0behBJaDOAgJrIe/wCkN6/cvUB/rpwGcf9fsFQfXKWmSwTA5uDPu7Ad53O8Y/6SUxLl2ipkXZVgETCYbpUC+Q/aDAYFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pIGS2IRXaTAJkJ9VvfD3HD9PA96bQA6qa32OyvfSm4=;
 b=VIvisoEd0cNjA6Kkr0ptQp5VOz/j+rQIrT+pJfXGMUYTAtwq7OwcrEZ+uhqXpPunsb6I3ZbhNfryRgYfCvYLRw5dhl/Gzjstm6Yxt2+0ZtWWQK+vQOGuPHaVb7N6Nw/z2qAvK+EHmHByXcTORQNWeFyS3Kvu5eP1CKVSlhB2anmRn7EyuxcNjyPK75vg3Os8y3DKVHPHeWFqOCvP70oMtblsWMyHMX3M3/+eKsf1wH5VtbYu9HoAQPNhv4yNVqRz0/jNscMjDcbfNq7F//kEZNCJkZ8KcFGR92Xc9NYm6qqYjRbgQREyc3NEXNoBlzW99IfBkcN0pQmG1wzORRf2oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pIGS2IRXaTAJkJ9VvfD3HD9PA96bQA6qa32OyvfSm4=;
 b=qCQ4dPxs27vV0JF07nO8X8Sc6G4/o/1pBTXVs1etGhm/F5nerq1EqwDY7nF67Icp6jMWNDa2/8v96LS2vxFMcYZ/miyKGc4LF9ZWQXX599qjz4GJdVsgbxhb5+UaVsVuIj1MwnGmu9NWy03E9WTdnkzSJ+FGtHBWSsQUEjr3kU0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 24 Feb 2026 15:44:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Edwin =?utf-8?B?VMO2csO2aw==?= <edwin.torok@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 2/7] tools/tests/vpci/main.c: drop unused variables
Message-ID: <aZ25VwwtfHuDQF1R@macbook.local>
References: <cover.1771840831.git.edwin.torok@citrix.com>
 <dd4cd79981fb24053b0dd17d79b31b1cea7ae5ea.1771840831.git.edwin.torok@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dd4cd79981fb24053b0dd17d79b31b1cea7ae5ea.1771840831.git.edwin.torok@citrix.com>
X-ClientProxiedBy: MA3P292CA0012.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::16) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BN9PR03MB5979:EE_
X-MS-Office365-Filtering-Correlation-Id: b4c209d4-ee0f-48bb-d47b-08de73b3432c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OVZZem8xL1hXbXV4aG4vZUoraTdMbExGQ2ZnMEdjZWVlVThyM0pKWjFTOEJQ?=
 =?utf-8?B?M2lwME5lSDZzbHNsNUgwVXA0Mk0wbDVOMVJSOFp3bEh3dHV4WERQUFpPcE91?=
 =?utf-8?B?YW9zci92K1Jvem1oWVR2dm1xNU5KQWt0QzBsNXo1SjRzbUlSOWNOR25HTjJT?=
 =?utf-8?B?SGR5bW9jT2hhbWkxV2JXbDFSK0xiUGEwL1F5UTZnY2xQN002aVR6MjB2eWlE?=
 =?utf-8?B?cktMb0t5Wi9SVEZGZkJrUTNCcG11QWpvZUJ6dTlJT2FzOXNyYmY5Rit3U2Vq?=
 =?utf-8?B?VEYwaGxmR2lENGZPZkd4WjY5UFFpcWtVakFHaXYrc1RmeFJBOEFlM0hOT2Z2?=
 =?utf-8?B?czZEcGZFb3dMUUF6QjI4elRkSjNRUVVhRFZBNUpDRHFIOEppYXgzZERyZW13?=
 =?utf-8?B?OXNReHBzUTQvYm1qVEMwTTFWMGZubnV6S2ZLTCs4TFpsSENEL28zSU94N3Vt?=
 =?utf-8?B?ZlBSZi9jd1E3cVhsUWlMejZxWkNRVERPTWdxUXBRZDZmT2dDYkJXekNYTk9t?=
 =?utf-8?B?b0JmZG1ha0ovWC81OVlkdHhiMUFBc3F6Y3JTMTUxRGZkWEtGeGVtbFYrdVU0?=
 =?utf-8?B?dEJ0YTBrVnBJeGVJMUpoUUZybHFVWGhqQkNobGFuWGZnQUVTaGtyOTh3dlBJ?=
 =?utf-8?B?cU8vT1JraUhRaVJwOHFyWFNoSUI2RXRZRmJHNFJHVkNSaFVEd0tLcmk2MlZQ?=
 =?utf-8?B?R2hMWHFhaW1BdjUwUVErQmFscTNUYjhtWmtwZlFncUwzVTNzclhuUm9Ub1N1?=
 =?utf-8?B?MTlzenhTaHM4U09UV1hvN1ZqNG8wYnA3aHN0bVFQSFMzL3BlR2JqNFc5Z1gv?=
 =?utf-8?B?R1E1WmZIeW9HU2YrV2RYVUtxRmo1RmE4SXlCWkxkK0FneFBSV1ZSSkVGNTlR?=
 =?utf-8?B?QnBDQU0zL2dhUk5VQjRvdkd5VGhRN0lrdDN4Z2s2WExkdW5EWVJ1dkNEVzBr?=
 =?utf-8?B?T3JpcXFvSkRsSGlhcmJqNDBrZ1RsL1JVVW5jWk83VXlaR1F6SHY4VEh3bmR4?=
 =?utf-8?B?bG0zejJmeXJyT1hrb1dtdFg0Vm9FTGRibFBDcTBRZzhOSkxScU1GaXREcWJ4?=
 =?utf-8?B?aVowREZtV0kxTWp2WXpqanB2RnA0N0xCTlJHRnBZUHAvb09xeHRPK1I5YjM4?=
 =?utf-8?B?U0JGNkhwSjhDbFlKNUIremMvRit2WmxuMkFRUURYRU5hR1UwVnVtbU9Sa0Q0?=
 =?utf-8?B?WVZDOTd4SmthRmh4c1VOMWhCYjNvV2VqUHZlR1Q2MXQ5WmNRTEJNWGhMYkF6?=
 =?utf-8?B?L2Y5U3JWZTZEZzhvV2dIL1Q1cUlaa3E4aGUxM1dLTjhtNlljYXJqUTFTcXNV?=
 =?utf-8?B?U2VZakQxTE9XQURmZGpiRWVjNllsb3lXR0hMc21FUDZndkZQTHFSSUlhVzky?=
 =?utf-8?B?emN5U1FQVnZCcHlWWDJNWHFYYTdqWnhIeVRwSUMrU2tabk1SdmdINGFFM0Jo?=
 =?utf-8?B?MytxREdJdk9zd1JIcVlUY0dNQi9MbEtXS1F4cHl0MUVrUkFhZ0F1dlBWTzMv?=
 =?utf-8?B?ekY5UTdPNlpvZEk3c2FsRE9VYVRUL0E5SktNcmdyZzhnSURpdFpXb3NNazhj?=
 =?utf-8?B?c3hLYlpCVUFGNXZ4TFNDNTcySWkvbGw3RUwwSEtOYjFxNU4vOE9vby8zcCtF?=
 =?utf-8?B?YkpqejFaSVFSUDlVd0VrOFZiVnJXRFZZV0FYY1J1TmJLNjgrT1hSKzgyMlY5?=
 =?utf-8?B?SFJ2Q1JWTXlFc0hjcWFGZE5OdUN2cm9aaytuZkRkUVVoUEUzb2dHeFJIM1lX?=
 =?utf-8?B?MGFjNUxkS29VejVCTUl5dHhVclE5VFR6SGlZdkpJMFlGKzI1RDY3NE1XWW8w?=
 =?utf-8?B?ZmxaVEM3NnU1Ymx2ZW9lMkdRMzkwU2xOQkxEQ2I0dzJCTkFvS3NCdHlKdmxL?=
 =?utf-8?B?WkVGL25VeDhtRTJhK3Z2SEZDKzhZbzdKcUpFZGJWeXgycGh0T2FjN3gxZTU2?=
 =?utf-8?B?dmNLM1ZQVGZuVHFiZlAveS9EVUQ2a2d5Q0tKcFozSlJIZUhrNytnUUFZQlJm?=
 =?utf-8?B?bEZweTNQbEFqc0xpVjhSbVpVWCt5UWFjUTJuSWhWc3ZSbm1tRFVVYnIvN3Jz?=
 =?utf-8?B?TVErdWJSUzh5THhCZnVKWHk1UmhURGVFWk0wMXk2Y2EyekZXTW9oNUpNVjQ1?=
 =?utf-8?Q?hXHA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0poRlZrWE5XZWNmUmtkY2EvMmJDSlJGZTdXZTVsbzBpWVdlWGswTjk1UDlh?=
 =?utf-8?B?RDNFUFU0MWw3M2xJUytSR0g0V1VCNEVWOElZSmxOYzRSajFUN0w2c1pTdkkv?=
 =?utf-8?B?Uzg0ZlFSMzUrOHFlVndEM3VIemFxV1RHOVVkM0JUdjFZK2tNNS9rWHU4MkpF?=
 =?utf-8?B?VGZkYndrL01TVGIzcitQQ2tORENnTjZKdkxmMGwwbXJFUkZsK0hKeDNpQXBN?=
 =?utf-8?B?OU1pZHZmR2NuL3RvSjd6Q3UzdE9IZE01eThsWDJKZVZXQnlWV1VUcE1hblhH?=
 =?utf-8?B?bnVNMlM0ZitZTlVxQ0lyQ1NaUVVwb0pJMXFTbG84U00wRUtldFhMMHQyelFZ?=
 =?utf-8?B?c3Z1SXpCZm5oTjIzbXVYL1Y2MzFVbmZISHBaSHE4WVVaVStESHBuL3ZuazVX?=
 =?utf-8?B?Vmh0SlNNVGQ5dHhZSTZMMVhNeitSSlhqZThzYmUrdU9LeGgzeko2R1BodG9P?=
 =?utf-8?B?bVNVYWJUbTYwYk5DamZmOE02aXp4SHptV1lDekhzTUxta2dwbktRQTB6d3ZN?=
 =?utf-8?B?WXpPOEt4KzZLRWliZHBMRGVHTUlWQVFocnFmdDRTL3hmUi8zNWE3amk1K3dF?=
 =?utf-8?B?VnNBaWo1VUxFMGRETTdHYklSZEkvOGlUbzFxamxmWlFiQjN6SS9nTkF2M1BP?=
 =?utf-8?B?OGdURnQwWG04YlBqSGNoVW8wZTJBQThjb1JtNXJ4SFlxVnl4VldhSzVYSGhD?=
 =?utf-8?B?dXlKUExJdEZQUzZjdUdaSkl3NUN1SmpETmgwRHN6UWdDWFoyUjdpU2ZZUEdo?=
 =?utf-8?B?NGI1L3llQjhZdENnYnNWRGQ5eDhscmN2MWZvbStuaDc0NnhqNzNNQTNTY2hk?=
 =?utf-8?B?WVhOTTFVdDh3VDl4YlFPajBVT2tKUXBoV0s4TlY5NVlnY3JiT2UvTGFlWEgx?=
 =?utf-8?B?eEx6TlRGVHczZS84bGIxS1hwSzF2M09rNXJSemZXYldyQ3c4WjJob3VmVjZm?=
 =?utf-8?B?T2VMQ1JCR0Y4OXBjYzBJQnRIV2YvMGI4TGI2WG1wMkJpU1BxZVJvY2VLaHFp?=
 =?utf-8?B?Z0hycnBxRlBiRzUzUWZUVEtPZ1hnVFYyZnZGV29YWlgzZ3JYem5ndVdnOERG?=
 =?utf-8?B?amJyR1pxTVdqZWFQdzlnd1hLanVOU2M0dmR5MWhQWHdJdWM5K1hnZDU0d0RO?=
 =?utf-8?B?N1dqQUdNdXJ1dVh0dTRqOGRnK0RGa2dpbi9kMnJYdzkycURTT2JjdmpZK3Nq?=
 =?utf-8?B?SnlqYUpZYmphSGZtbHdmWGhaTy80c3NESzJYSHZFTmt6UlNBMnNqWjlxQXcv?=
 =?utf-8?B?Q1dFemdjaHlEUXh6Q3VaYVJ6bVZBMzlMUERIY1ZtaTV1a3NZQ25ydGlpQnIv?=
 =?utf-8?B?T0J6a0hVZzdXNGpGUlY0ZkRMYURaVHcwTmY2UFd4dmFJZlljbzdTR1FnMGdX?=
 =?utf-8?B?aHQyMFBRcWR3SDY2amZ4OGlFL2IvQ2tzTGpFN3VCdmY1YVoyRGtFZGkzOE1u?=
 =?utf-8?B?cUlHQ0ZWWUEzek9WV2UrdE5PT2JqYkZuckZOV2ZpdlpzNU1VTUlRUXRpTUo2?=
 =?utf-8?B?NmdqSjRwbkNCYk51QWsybnFWbWx4WHBiTnNGRENnL2tlbkxQN3JyQ0RUMlpF?=
 =?utf-8?B?N3JEbDA1VEliZnpzbVo4VWJFY2NIRTlQcjFiOVpud3d2WDBGd2lZMmNCcXlz?=
 =?utf-8?B?Q0hYVGxiaTQ0dFU2TjBhTjM2WnJ2aStYa0hGbU13VER0OXRIVVQxVCtOSzcx?=
 =?utf-8?B?VXg0TllnaGxGczYrR0lZbnB0WnlNSExKR3pzS244ZkZoeWl4cUozbGxRZmVX?=
 =?utf-8?B?TXBKYVpvWVk4SUI0UVg4RWxXR0cxemFUT0s0L0lJVTdHSjVSR2FSTUU5ZTZZ?=
 =?utf-8?B?eWhxTEVLK3c0eVFQWlJ1UjlZUVg2aWNZZWVETWJCaGNyaU12TUNSTWlwdkhW?=
 =?utf-8?B?T252OXhKcERwZ1pweFNnQjl2TnI0TkNlL09kV3JQU1hpTGRWVkF3TERCQldX?=
 =?utf-8?B?NDBqTkw0WUlYUXQyeGJBeGkwMlJiU0lVMHR0NmFSekI1bFg4RFlGaFl5eXlj?=
 =?utf-8?B?R3l6WFFWeFk3MFJCcUxSU3o5WGQ3WjUvOW04Z2lQZytkOE0vV2c4RGRjVTMv?=
 =?utf-8?B?eWpJVDRJd3VFZUtXNm1OaVdMbzVqbExyRjQybkF0eTZwWWM5MHdIRlg0M1NJ?=
 =?utf-8?B?QzJ1VlVVd1VtaStPY0ZDaFh0MFJBcTEvbjc2WEoya1QrODVUeWEwTWNOTXA1?=
 =?utf-8?B?Y0Z4ZjV3WFE0R2NJR3dJaTRsRWdsWmtTL3lCZDYyYkRGcXZUa3ZDZDhXdjQz?=
 =?utf-8?B?OTYvM1o2RDdUcHgrdnRwSmxCa0VSbFNjM0ZZU0d0S1NXQVczWHZOSWNsTlc2?=
 =?utf-8?B?NnR4cFVaWEtZbEw0NGpKYVorMThNVGMvMkVaNUFvMExUUVlxSHhFZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4c209d4-ee0f-48bb-d47b-08de73b3432c
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 14:44:49.7792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2VnsVp9rzKZpZzyVDpp7suTZgAhGy8m1MeeEuPty/DLjaPSN1ex7Ak0u5TAlj62Y9BARecKEFiMInJ21WboAhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB5979
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.35 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MIXED_CHARSET(0.83)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:edwin.torok@citrix.com,m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B222A1889D5
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 10:14:06AM +0000, Edwin Török wrote:
> They may become build failures.
> 
> Signed-off-by: Edwin Török <edwin.torok@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

