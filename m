Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCgQJUpejGmWlwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 11:47:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDA112393B
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 11:47:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227220.1533555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq7kN-0002iw-UB; Wed, 11 Feb 2026 10:47:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227220.1533555; Wed, 11 Feb 2026 10:47:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq7kN-0002hZ-Nf; Wed, 11 Feb 2026 10:47:03 +0000
Received: by outflank-mailman (input) for mailman id 1227220;
 Wed, 11 Feb 2026 10:47:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qg4=AP=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vq7kL-0002Tg-FQ
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 10:47:01 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fdfe9944-0736-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 11:46:59 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CO1PR03MB7844.namprd03.prod.outlook.com (2603:10b6:303:271::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 10:46:55 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 10:46:55 +0000
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
X-Inumbo-ID: fdfe9944-0736-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c2JmdyeZs3AnSln0jDWwMWCZDyJgGpkntpGiQS8VzfIu2kH3qYyLkR/fPhs+L5WhFQsgPcJKCrZQaoKnz3xiZN80LeHahGRds1S77Qh6qRfnYz7bCPPeJOyqbg3CWfTgsCl/HW6QeDXPA1mbVnrtLoaNV0DbsoaGkfy5Dby8J40ngI3KAypMaUtmabDoWNcXAZ1QjO6bLtTHRKD43/H8BLlcmQwkENINaWKwOL9gsgHUtEelKrRIbPhk/SlKJwPIjMOkrp1b4cRsddtfjIuTSjITTv494UP5ufempN+s2OcTsPLBfjQIPrDbH0xah9jH3MqWyIpBPU7UdHQxjbe0TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wFEnF/B/qAAmu6sYYVBneacC7PqpTZjrKWQURe561Zk=;
 b=GqJAKzafE8HvK4ztE6wm/cDwuFbJll9WW4/QWe34g9x1TMrDd8nA/iUXX0F+unX6YNYE0WrBxvSsdp3LrKVeiEZfMOngi0UXzop9yTYue+H5psRZkuSvRaw+uRnZFeaNvM7AyWHEOaxPGh1cad8V0T9cmt/4ADiyt3SRVn7SNYWKwbep8DzAi6nbqLjGjGz0RaOtgox02nyqh7ne232NfuKMkuTsXXsCK7TGWYlVO4Dh//O/YkcMZosNUB6NdG4Dim4BaSZQ0Bd8nIRs15Ca8gKPVKs/y6UnsY4mAyM48ZHW2TdRiCYQfLbywRVjwqK9KX7jmbxRKGWtbHuHlr015Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wFEnF/B/qAAmu6sYYVBneacC7PqpTZjrKWQURe561Zk=;
 b=wX+o51hyGgwnnxMVDia0XbWChJNzYhchTD3p3VshWLzduQwYpYIabU+IlISCe4Yla4voOWUUTXicDpbX3iPnG1wx1PzZS30Z/wUADIn7H1fHQHOGOWAd1lgYnzOc6ATNhxqI49gNg/Ws5X2T1dHsVViCqwmS6LvhnlSuHVEm/74=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/5] xen/x86: always consider '/' as a division in assembly
Date: Wed, 11 Feb 2026 11:46:34 +0100
Message-ID: <20260211104638.7938-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260211104638.7938-1-roger.pau@citrix.com>
References: <20260211104638.7938-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0028.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::18) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CO1PR03MB7844:EE_
X-MS-Office365-Filtering-Correlation-Id: 426d5362-b009-448b-34cb-08de695adf4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VnBVSG5Kbmw1R0hiWU41TGhMWDBZa0tSVVZSa3RKV2gyNzFUNlFveXY3K0Y0?=
 =?utf-8?B?S3pxVzhYaGE4alNBNVdLbzR0Q0xmSUxFaTVDQXhpamFpTUIzYnFad2tNdTVy?=
 =?utf-8?B?M2I5M09WN0Z3MC9xY0xSRmorQVJBdng5eVBVSmJSZmIzaVdNMHpxeVZQdE03?=
 =?utf-8?B?RlBHa3NjVHhnNDZPVEdJbVc4TEJBTFFMRjRnU2tiS09TaktiNzR2TmZxVktv?=
 =?utf-8?B?U1dMWnYwOVRYc0YvaEUvcHd4WjFXS0hvVzRqcFFFZERnNVJGVmVpcDdVcnda?=
 =?utf-8?B?MEdrdjNoYld6cHZiZnNVeGJwUUNtQTgrMmwzaXFncjVoNHpQdUpadU1LblVy?=
 =?utf-8?B?eDBhd202RmtwTVQ2UjRzUzdLTCt2bzB5TytYZWNuRU8zR0FPeExkU3MxeXBy?=
 =?utf-8?B?VXorL01pYjRwclcvK2YzMHlubDIxTnpVMi9TWW1yd3M5QndvTTNNWDRENXNB?=
 =?utf-8?B?TFVEd0U4UlNnTGNQRTR3VzNMbzFvTFl5c05DTEx5QWRhUlhpRjAxKzg3MGRJ?=
 =?utf-8?B?WDlyZGR5VnlkVG9XNjViazhlSXphNUhYZzlvTCtnZ3JqZDJISGhDcGZvSnBj?=
 =?utf-8?B?WDRqRVZlSlBCMExvNVI2dEswMk0ySU85dFRUZVgyTlY3eFhKdmxJbkwrdEVW?=
 =?utf-8?B?Q045ZEpCd1lUWUJzRFF6MkdXM0tJNkZqbUxVWitpY1JyOFNpemRzVjRLc3Jt?=
 =?utf-8?B?L09HeG5tODFGcG8rVXRsby9pWFIxOGFYQUJwKzd3SXd0ZkNPWWpSeEx3djRZ?=
 =?utf-8?B?emsxVFdUbFM1MFZyOC9JaGk5Yk8vNHo5UDdLbGJjWFpMWGdETndkbzFVU092?=
 =?utf-8?B?WUNZUEJwTFcyeE5zMis5dUZwelN3VEtNTlFkNUoyQWM0dzFZZ1J1c25MS3RM?=
 =?utf-8?B?VlVvU2tPSkVnWjVtb0g4SkNkUkhHOFZ5TmRaYW9GTmhNaXhhbjArS2ZpY2Mx?=
 =?utf-8?B?Q0dibHFPSDhSNElMN2hQekhlVVplYW83UkVxU1hQb3lPenpldTYvUnRYZ1ZW?=
 =?utf-8?B?RFgyTGd4UU5Rb0ZNemZsT29wZXNRNGpDSnJiME12dURTT1YrQzBZS3QvWUlt?=
 =?utf-8?B?MDJHaFdadkNNL0psR09JS2pRQ0h2L2N2RUxrVXlWM0pna2FSVFlCNmpkc2hV?=
 =?utf-8?B?U244TTlHN0lTUnZzRTBselRkSUtlZ2ZnSXZRai9XUXlKcS9EZEx2LzZTYnB0?=
 =?utf-8?B?OERHTHZzZXpJeUhiTWlhV1pwcU5naXo5WmNYUm1wUTJMaHI4K1ZJTTd5cUEz?=
 =?utf-8?B?c05yaDJWd21lRGp4MjNzVVlhRGMvRWN1eml1dEhvT1RYc001OEhHeGhlNEhh?=
 =?utf-8?B?RGpER2lHeGFxd1VJTi9PSklVRmtuUlZKVzV2SjdBUXdYYnhXMkNxK1E3aUNG?=
 =?utf-8?B?NDVsRGh3S2dadXVkWlo5Wi9kb082NWIzVlp6UGNzZDRoWTZSalRSRVVHNkoy?=
 =?utf-8?B?Y3RFS1lXSThmUGV3RnloWmNaV3dxS0JJQVVjVEtLa1R5V2ZEKy85Zy9tVDl3?=
 =?utf-8?B?ZWpXdEJXNXlDUEExdCt6a01qMkpialRpWXpSV0RlR2dwQUNtSGVHdlRZaHVF?=
 =?utf-8?B?dEVlclBDMmZEbWhTZFZTbm5DVDhxS0x0WGVzeTRtbEM5Y2ZtakxPdGRjaW1J?=
 =?utf-8?B?SmpJOVBORkVLOUxDdnFkNXgyVUFFYkwxUXlaVGl5S2kxcDhwTG5kbFRPbFNv?=
 =?utf-8?B?QzMrSEsyVkR1U1BSOUN5dUQvT2JySnNmck0zbUlIdTNIVGlLTzdrdjZid3BC?=
 =?utf-8?B?WS9PT3JoWlVtWlRxUzRLYkM1V3B6OWo0UWVVSUU1N3B3bWlsSFRtQlc4TnRV?=
 =?utf-8?B?RmUza3dnd2NWR3c3ODd6SnpFRjdsV2ZXUnZkc21tMGpVZVh1VHNjTGlKb0RU?=
 =?utf-8?B?QmJ5bEVSOU9XeitxUkZ5ZUJpYk9tTHQvdzFUaURybS9IK3VyQlRxRVNGZXFF?=
 =?utf-8?B?YnE1a1QzVUcrVC90RHBlWEVQbHlxL3o4eXkrcGZud1Q0VnN6aGhWcXdIeXJU?=
 =?utf-8?B?K2ZvMjhiZXU3UWk2dkVRMkMxNHdpSG5tdDE1N3F3NnNmaDdpd28rbXdOZE05?=
 =?utf-8?B?QTlFa0VXR1BPUExBRlY3ZkFkNmptZnV2ZDV1bHFncTNhR0lDSWhlQmlBcjB3?=
 =?utf-8?Q?UFZ0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUZJdGdYb2NxWGVTMDN1WkVlYVhIamMwcThDU2s4VVNORlZTZUprK2ljZUhw?=
 =?utf-8?B?UUVvZ0dsejZ4b0tZT3c5QXFKZ3E2T2lPRDVlUXZjQ2xUYTR1ZlVJVlZkcG5Y?=
 =?utf-8?B?UWFiOTNwNzJOU0VWOGQ5UVIvZUVCeVZlTUpGRUxhYWJ1cmxHV0pyUnFYeTlU?=
 =?utf-8?B?S3YzNXk2VkxRLzdOT3ExN09BdnhYcWRMeFd0SUExUWdEUjVmTHNjMEpLQnpX?=
 =?utf-8?B?RFZtRE5oeUhFMnNNVDA0UjFoU0xpL1BGM3UzYzFkNm4zbXlld09jbXZSUXNY?=
 =?utf-8?B?ZExXWUNidU1SZ3krTEdETlBKaG5KOXEvV1hQdmQ0QnRPU0VpRE1YTWZ4TjVD?=
 =?utf-8?B?S1k0V2FvV0kxcEhXellNZ3VTVExlQlRVWmxuckFNQXFqejhRNzVSMURYNUZN?=
 =?utf-8?B?VmIxL0NUUEJWODRZU29KdDdrcFFoSEdGdkdtaTI1NURRd0laZjg5VVZCV0xT?=
 =?utf-8?B?OEt2OEJka2dXN3o2R2U2dlNYeCtrS3E1ME80VDNUaFhQMXdsQVVkdWk5eGZU?=
 =?utf-8?B?M28zTmg3c1RmcGRzVHRXblRrWGZXb05ORHZEQW5KVzYyZVZaQlYrd25XOVYy?=
 =?utf-8?B?d2plcWV3dGxSVlVaN0NpTFJSaHZaN250cjBqMHNzakZ2UjVHdno3T3JjU1ov?=
 =?utf-8?B?UlhUclpoc2RQdmh6SXc5UE96WXk3SWdSTCs2Zm9ta3lZUVFSaWdnZXg4aHZU?=
 =?utf-8?B?Zks2bnJQcGpCREcrU1o5THM0cDRQMUg4V2prL1Bpb2lDaDlNNmpxMHBzYW9E?=
 =?utf-8?B?SDRkRS9pcHBnYmNNNSswN2hHVzBITFJNcG9IL01Beml2SDBOUC9DL2hBdTZ4?=
 =?utf-8?B?NTNNTFprVTJYMy9QZVpzWmUxejJaYlZBV3RRQ00vdGxlNzVMM2h2US8rcTV0?=
 =?utf-8?B?K3A2WkhtTzRya205NGNGQ0Q5MXBzZGY3UnlrWW5CZHowMWQ1cGpFMTRNNjQ1?=
 =?utf-8?B?MEYvMlRYZU1kcjF1N3pDcVBUTURDbTNhL3lLQmdUeGdOZnlqOXF3V0VqREFr?=
 =?utf-8?B?TTBiRkdBV1BKWmdQNkpCMUE5Yjl1SUJEbXl5NDFqV29JY2pFUFkrUWZ1eWhQ?=
 =?utf-8?B?WVpkRXEwUWQwdWJKaHljaFRlYXlVUzV0RTBER3J6QmhtY1dMeGV0NmFtZjlP?=
 =?utf-8?B?RlJKVjBXbFEzOFNQSjZvbnBrdyticHhmZWpuWkpvdk1sbEtnRnVRTkV2Tm1T?=
 =?utf-8?B?cnFtNFpGWnIxWEJOYndqdGdYejJ0N0lveXlqcVYyYVEraE1yQnhOWVBjblBD?=
 =?utf-8?B?R0RGeDFqQnVheUVXNkJaM05hZnpJaUoxRHVEYURVVWVIb1NZenVTUmVTS3FP?=
 =?utf-8?B?clViZU83WW13bHlRcW5SZElGb0VINm9Cc052MUVTalBIOEtqZXFES3lIbmV2?=
 =?utf-8?B?TmJWSGtKRnBlWjY5dFcxQ3J0UnljTHhKUnQ0NG5YOW1tdWt5N3RBUnhaK2Iv?=
 =?utf-8?B?ckx3VkJEL01iZlBEM1pyWnM3Tll1NG1Pd0FUZGhjL1JjOTlza1B6Q012ZFJU?=
 =?utf-8?B?RHRFMWF4a0FsYW9mVDB1NFJWTDU2c1IyWHp2QlBza1hqV1RBdnhUZERnTEhW?=
 =?utf-8?B?WXFIVmg0K3lKTk1UbnZPa05zbmRFc2NZU28rRFNwTUEzcmdoZzRnL2JSdlc4?=
 =?utf-8?B?cTd6Ky96c0NPeGhCbGtYWkYxMWFlUE5yeFNiL0lZUWR1aWxjeUZEeGhId25H?=
 =?utf-8?B?aFhzbjRzeDlNbDBPQWxTYnRlT1hqN2VBS0R1azhiYzZPZjFKTVZ2K282Wm1Y?=
 =?utf-8?B?UExPU0dZSzRudzhxMzhOMVYvZ1VtM2ZuK2JHeDNQMW0xb2ZJNU12Sm8rMnRl?=
 =?utf-8?B?LzRHdDg4Y2I0N3NHWVp6U00wanBUd00vVVl2SXEwb0kyRGZOOVRTWlBYRkJY?=
 =?utf-8?B?WFV5ZnhLZEprdG5VbVZIa1pqMndEK0w2ZTFHZ1NwV05hOUsxOUF1czk1WDJh?=
 =?utf-8?B?UUpFODE3cTFVQTdLbXpycGl4WHEvZ0M5ZTNLREFud2FYaG5JMURVakxKTyti?=
 =?utf-8?B?ellDN1BHZDFrbCtaTU4xRzliV21haU1iQWtDZEIvUTVtNGxSY0tISVB3dTlN?=
 =?utf-8?B?TlROTWxsM0VtTDZHREgvNHZqdWNwenBCdFBMSWpudDNiMDZVbzEvR0ZJaS9Y?=
 =?utf-8?B?QnhSckVNRjNjckxpeml1Tkx1WDJDZm8rNDNDU1ZMeTl0UW5VVzlFdjBGNW1k?=
 =?utf-8?B?V3pzRDlOZ3c0TUVUa0QzOTFhck1TSDJlRjQrZGVncXk5bERTNnMwYXJOdnRh?=
 =?utf-8?B?VVEzS3NJQmFUdTVBQWhqeWNkcEpVS1Q1Y1ZBeWZyUndSWk55UlJlcU9pYjBo?=
 =?utf-8?B?bitPR0lyU3Z5dUp2TEdsVmZvdnkvSys4VmJiMUZUOVNmeUg3alRGQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 426d5362-b009-448b-34cb-08de695adf4f
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 10:46:54.9623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VaWqudgwtO2r26QdQgy0/cvJWMICQE7afgAZdUqs+ia/RDPN6rmtcVmq+p4iHLk/kapurHBiiLGrOYH+j3Ug0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7844
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 2EDA112393B
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
 - Guard option setting to x86 only.
 - Adjust comment.
---
 xen/Makefile | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/Makefile b/xen/Makefile
index a054315fa4a2..4c83e2a46477 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -413,6 +413,13 @@ ifneq ($(CONFIG_CC_IS_CLANG),y)
 CFLAGS += -Wa,--strip-local-absolute
 endif
 
+ifeq ($(CONFIG_X86),y)
+# The GNU assembler will interpret '/' as a comment start marker instead of a
+# divide for some ELF targets.  Pass --divide when when available to signal '/'
+# is always used as an operator in assembly.
+$(call cc-option-add,CFLAGS,CC,-Wa$$(comma)--divide)
+endif
+
 $(call cc-option-add,AFLAGS,CC,-Wa$$(comma)--noexecstack)
 
 LDFLAGS-$(call ld-option,--warn-rwx-segments) += --no-warn-rwx-segments
-- 
2.51.0


