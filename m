Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B66404C8670
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 09:25:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280968.479087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOxo3-0004bT-Gy; Tue, 01 Mar 2022 08:24:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280968.479087; Tue, 01 Mar 2022 08:24:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOxo3-0004Zw-DO; Tue, 01 Mar 2022 08:24:27 +0000
Received: by outflank-mailman (input) for mailman id 280968;
 Tue, 01 Mar 2022 08:24:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nOxo2-0004Zq-AK
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 08:24:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00cd4a15-9939-11ec-8539-5f4723681683;
 Tue, 01 Mar 2022 09:24:25 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-ilgxC1XONL2EGnLxVdLN3Q-1; Tue, 01 Mar 2022 09:24:23 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB8PR04MB6475.eurprd04.prod.outlook.com (2603:10a6:10:103::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Tue, 1 Mar
 2022 08:24:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 08:24:21 +0000
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
X-Inumbo-ID: 00cd4a15-9939-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646123064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9XJQN78ib1MVXdwfiKUllDBBg5cOZ43xtTpNhJqfgz8=;
	b=PgrUIglZmzqTHoy236Rd4OXQk2vGT5bWsHNgYdQIUUDC3F+LmbpvGbNVjf4/hOu7WJDfT3
	26lbZEc6Ck3cMBh3DCHbTaoR9HCF35/Oo3wL2k1rbeA74MAPaeFpktPJyIFuJLd0b1qe/Q
	GNTxFreoO1VtWpYrPXVvfU6+8csItcM=
X-MC-Unique: ilgxC1XONL2EGnLxVdLN3Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQTbS3IwUmDf7klkO5J9m2mCq5QSsiZzoYG+8m5zx9nzlB0UH+VndbGkbGRare+HQ/6jLraJwPt/bbwtm7UYImZxWtV6hESGSGXRLFV5Kc9blNm6MhbGsnGVVyKZ1whKHk7FIF63ah7oUdr9hAcARH7m9LjdpCYbpR4w6SbpdCWfCVdJQwL5Xs8w/3EhYrPMyES5j5pGOF62pa81TpSLMiqtAZB7uqF46N/BCAVdo/9wQTncyb9U+LGbqvATWAhLT1OvELSVS2F+TNYZjlUzIw6y/nif0Q/MHV9TRPUPUH3rYzyRSgrdbeIWhZyAqQQk6Sdt2J3RZmNiFZttuhKnPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9XJQN78ib1MVXdwfiKUllDBBg5cOZ43xtTpNhJqfgz8=;
 b=RilcchYAZLDZ6w5zkGzKcUW7XVN+AyuA2mwvhVC0wVLwiaWRv4+LnGGClVmoAvF8WV/i5C0pcljW+qBLTwsSRCejbwHgjQpkTqkaJD6hHMnJKj0T3ypmky4+yVWNAi2jJT9qTdbhwqMIc/pmHtCEvbMU2X+I3RSW+QF4Lb9wGND1kzE7/n+Cpd9NM3VC381OZM+YPwI2zf+ROUdzQE9ucTUL8nd7gR7QytYbjpsV4y3fGpI/QuP8f26oV0VRJXFQWo5ZLh2ERxnQG4rlZWaSRLoernxOcP4AaaVPq/fxQUhtGOuCOayjhptrFZegCZrXtbpypCyiEJzcecaxBftekA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ac19413d-d5a0-4234-819a-fa99afc31592@suse.com>
Date: Tue, 1 Mar 2022 09:24:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Subject: Kconfig: defaults for UNSUPPORTED
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb8b58fc-94a8-4a86-26ba-08d9fb5ce346
X-MS-TrafficTypeDiagnostic: DB8PR04MB6475:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB64756C02E37604102AFDD373B3029@DB8PR04MB6475.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mdelHzNmD5bflYw2kFUIYQcNxsTMnfwo59lO1aX0SlQzDge461590PG2ZZRZjBlqGQqHwo131yyvaWu1cgCNTIziNVL9p9c3o1f8xMCNIXr5oiGVGTbZMwoCvfarl77Uc+7Q27Hc4y6niq04DubnWVGwaumu63O1pahZUxHOFr4F5/jeEpzl3ETlaqu1Is4LYwwlwEgOrfTKJ1OGw8Hft2sXWSebhHR+u0+vzTC1HOFwXY+6FZ0RGkDbEFQ5dd8rhsboBkh3X0mcZhzLOYHOX0o0pGv/8DuSp7G8ZUFkTqsLMX9Sj0wDxU417fr1u1vMCARGv/VjEan94d0ulPBfblHqu1OBomLqu/1SMN67nKhy1dMME2e5NXwRYWrX1oZrA4MV026qcGIj77v71R1w08tGKkdR4p9Ky9FfLrp3i51gy0gs6vYLTxuXASaIn7TvgN8Yex0LWOta+SKosmzgcAq1xL7b9LYEOISBJawe69UaV+XfBad2PT7VpupFsjFjj7hiPwAdaAaoGzb5boajZtHLjTst/pGLf/Sk49YL/xFAFR4ll3o/QUE0z1TE2Q5CqnlVWazf/gUo7YSFeNWypiht/CGHyBEPV1ENYF1FenjQhiehwZ7TCTw1WPLM5EPM/bTyXDnogl15GvDtxtpwZKX0V7An8MK8eIVPM+lToURUs66CVR5poJUDypgzwGJqshdEXxHMuwGwQTrClHwtgQ1pVBa/ldLuERB1WFkV0Ms=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(6512007)(186003)(26005)(2616005)(6916009)(31696002)(316002)(86362001)(66946007)(4744005)(38100700002)(66556008)(8936002)(66476007)(8676002)(6486002)(5660300002)(31686004)(36756003)(6506007)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVJlUlEyQWhkWmpCMklrcElaaGFobU9hakxJTk5JZnkyd1hxd3FkYytabTFP?=
 =?utf-8?B?U3dlV0FBbXdWWTNkZHV1NDM1aWlwclhYMFk1dWFGbFo0QVBlaDRyMmRyVGVD?=
 =?utf-8?B?NmxBbTRJTkwvV1N4ZitUanlJRHEzWkFER1RNelFQTmJlYjdyZXVDMnp3Sk13?=
 =?utf-8?B?KzZjeVhsOFlRVHVYam9GOHYrR0dFeUNYZEQ2bzZDbThOSUJUTGNnTmhzcUNT?=
 =?utf-8?B?OGkxZlhwSlZrTTYzVGNsMVRCV1luaHo0SUd6dzlWMHMrZUZHWmE4ajlLTXd0?=
 =?utf-8?B?QVZPNkdtbVpsRFBJd3dTMHFHb1htaXJFejB1U1Rob3gxd09jdUxCSUdxeTBP?=
 =?utf-8?B?b293bXRMVFpzQkVvV2Y2MGNadVluZWpGYVdWZUNVdFA0dkZ3K205T3pPM214?=
 =?utf-8?B?b243MWFteGV2VmFTRzJDNXl5Y3hBZGRkQkNYdlArYzlUVVkydFgwOEVnOVha?=
 =?utf-8?B?eUVhalpzTFRvVDJFeXFKL0J1YlBUd1ptVjA3Z2dHOEtMcWJjR20xVHF6YW5v?=
 =?utf-8?B?VENuVzFqVmxQT2N3eHZ6VDdXYW9hZE96Rld0YjhwZkp4QVB2d0VUNDNIdXhV?=
 =?utf-8?B?OHhIN2dYRUp3OVBWanJhQkgvMHAxRm1Na0xHS3Z0d1lxZkFYYlh0OHprcXQx?=
 =?utf-8?B?aWFzNWNqMSs3L2paQUV6UHdOM1YvMXRqaFZabVRRNDdTOERNbGd6Wm5IanZs?=
 =?utf-8?B?VENOS0RYYThENWJxZEZUSkFOZWVmNFg5RDhNRVZSL3lNOTRzUzc0RksvaWZ4?=
 =?utf-8?B?TDVsRisza0lacTQzOG9DbXpRNk5SRXp4ZXJNZ2pCWEVqOEZmSk1qL3Z6bUVz?=
 =?utf-8?B?UDF6N2taOXRWa0V6cU9pT0xSbVBncUg3QzRRRlRoaUV1bjVlTjdIWTVPckxJ?=
 =?utf-8?B?aUVKVnNZTGIycWwrV2pMQVhWaXppNldnK1huVDN0SURoV0RUcm1EclZsNVJy?=
 =?utf-8?B?Zjl2SE5rdEpCVFpMdGxKUEVmSVNhZFZxMUM1ZlpTZFpHQ3lWYmZNM2tmZENB?=
 =?utf-8?B?Nm5rSll5T1JRc1BiL0cwVUQ0VXE0MTc4V3Qrd0p2Y3BXaFlWbFJXVUFrRmJr?=
 =?utf-8?B?MzViWDloamlxc1lYdXN3cWdYZU5hbElWa2t5YkRHQ252L0RkcytCRXoxMGZm?=
 =?utf-8?B?bTAwMTJXeEswYzRXaVR6Z3hGaEMyeW5iK3JkVEN0SWgreFRNMFA2TmVKL3lI?=
 =?utf-8?B?a25leitua1NES3NyUWM4RU9WTGNQMDQwZzAyM0x6QTdaUEpKTCtHTzgrQlZ5?=
 =?utf-8?B?M2NpdmxycHp4bXVUN25NdzUySHEvbmo4Z0crQ0ZpK2RTTHg1dUdwL0s0OFFy?=
 =?utf-8?B?Z1pZMWovMGwxcG5WSjJ6SFJ1NlVxcHhrWXNQN0duaWxjLyt6SzlXK1ZrZFJU?=
 =?utf-8?B?NDBUR0FPaVVJM3FXVXRaaFZrTWlWSnJrSTM5TGZ0ZS91a3VSWEwxSTdDVCti?=
 =?utf-8?B?eFpCQ29OT2NHT2p5SjlmRkhKMWFGbUx1bEVJVkV0WndvRjRVZHJpQnFwZ2VP?=
 =?utf-8?B?SlNWd2xOVUczbzJKcEdYWTh4R0lZWXEwcGlWTmJwN21pVGRsSk1uMGtnbHdW?=
 =?utf-8?B?SlJnM0NCMGMyRWI4MjViVHdFMG51YndaUDlqaWNKNGl2ZlZzMlFWWFhCcDhK?=
 =?utf-8?B?aXJpWEUrRE5FS3oxS0hDcWlwclBsLzVmKzhPZzBlQ3J1dk95UWZVRklPS0Qz?=
 =?utf-8?B?Nzh1RjVZemtIUFQvdnZTTjJ5QjNpNTYzdWF3cUdWakE0SjFTcW9aY2Q1VnlL?=
 =?utf-8?B?UXBIOU5HZU1ZclQyd1pTOC9JbGxpdWlXM3Z0UjVFWkJsVThHaEpob0JQV1BH?=
 =?utf-8?B?bmdEd0YxeThvdUhxZjZ4RkdkSGhiano1bElzOWlRbDVCOTZ6M1RCZjk1TTk4?=
 =?utf-8?B?dnllTUNyQTZtZVNnbkozdHpvY1NyMHFkMmxhMklicVUzNzZLWnhveTJ0cEZ6?=
 =?utf-8?B?WjZjUkRtV3hCb0RuUTM5SjRaeTcrcENJWXZ2WGEwMitQakNEOTZZSmdpNXh3?=
 =?utf-8?B?UXhlQTI5ZTJZUzdqY2VncWlUR0xRRkpzbTQyWVZ3TGJjR1ZhQXRxeGlxOUVh?=
 =?utf-8?B?RzlNZGM5NXdRNmlMWHM2VU9sVDhhR1NhWmgwMTdMS2lMOUVwOUtYT00ySHlz?=
 =?utf-8?B?TksrMXY5WWFzV1drbHpyT2VUQmFKVWN4ak1tQTFRRTZ2VHAzczlYd1FpRHhL?=
 =?utf-8?Q?spKp/X679b/ccFwoq5q4AMs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb8b58fc-94a8-4a86-26ba-08d9fb5ce346
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 08:24:21.9630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZrsY3xnI1i67Z0ovQe++I7Hfysn8hcRDhzme8U8Lz0w5loyeruCbyY1j55I3P+49UWEMByzCaIHCcVfzzc2j8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6475

Hello,

when commit d96e5e6c1214 added UNSUPPORTED, it left x86'es TBOOT
default untouched. This means we default-enable an unsupported
setting, which doesn't look to be what's generally wanted. I can
see defaulting to DEBUG as reasonable, and SCHED_NULL's defaulting
to enabled when PV_SHIM can imo also be justified (there it's
rather that UNSUPPORTED is inapplicable for the shim case, and the
adjustment was also done subsequent to the named commit).

Shouldn't we therefore have a rule of thumb that UNSUPPORTED
entries only ever have no "default" (implying "n") or default to
no more than DEBUG?

Thanks for opinions,
Jan


