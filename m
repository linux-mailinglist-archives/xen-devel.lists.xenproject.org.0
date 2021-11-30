Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5124B463B5C
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 17:12:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235295.408283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms5ji-0007O1-78; Tue, 30 Nov 2021 16:12:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235295.408283; Tue, 30 Nov 2021 16:12:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms5ji-0007Kx-2t; Tue, 30 Nov 2021 16:12:06 +0000
Received: by outflank-mailman (input) for mailman id 235295;
 Tue, 30 Nov 2021 16:12:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AOGb=QR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ms5jg-0007KE-EX
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 16:12:04 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f2ad5b5-51f8-11ec-b941-1df2895da90e;
 Tue, 30 Nov 2021 17:11:59 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-dxrnbv9UMYmrPH2awUO_xA-1; Tue, 30 Nov 2021 17:12:02 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5327.eurprd04.prod.outlook.com (2603:10a6:803:5c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Tue, 30 Nov
 2021 16:12:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 16:12:01 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P191CA0031.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.22 via Frontend Transport; Tue, 30 Nov 2021 16:12:00 +0000
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
X-Inumbo-ID: 3f2ad5b5-51f8-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638288723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=M5VznKEmvi3D+4dL8sK9NcwuWORXDFGH1k74atA7BxQ=;
	b=IiJoPCmO1XjZTYEFKNHX1ny4fBE7kk59ZdACMxI6F4u1DUlCjgh8Z6WlV4BHW7FsOPyurc
	7+1XAFrvy3SwCvZoRlLLdX2cYip2BkC13w35gnfM7TRgWaaxMDqZHi9lyWSWHTgHR4aCAQ
	qgCKpd9tVI+UVKhXrnH3T+Wr1HGSRIY=
X-MC-Unique: dxrnbv9UMYmrPH2awUO_xA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HYB01ihS+5cHP+i3I2okdmVZqTjf/scoGVleBEgApvd2q48vRlZag9/Wiym/bcYvgmBmTIthdSdjZOaIQZulRZR0xtu3UhwY42fl+2bvzrPZ5KPxAA4TyTjtomi20URELPszPZgOGX1KUCh6KCiYsFCKyr/tV8O6v8i3bFZfJ7nVgkKX84Jf/YS8Ac9HJb8h5P+nGkd94YuKAMahhcqqDWN4Tbg3gifCpXUG6W4krF7U2lAnLBpYQWLhr+wT0mzhciZiK0wEcXYvMWK9rWI0ySlgo1pkRahKTQxuTRNlvSK3f/C3JiWedR3dVBuStsnJLZCtPo9VnYIaMYsz+rlGMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M5VznKEmvi3D+4dL8sK9NcwuWORXDFGH1k74atA7BxQ=;
 b=F9yix8AkvKKcLX3lGuv7ZJnVEvmS2p34yUMhie+kt7voqyeBkurZlYGuTW8Zlgsmxed2qAUoy7f/M7RIjLpHV7OWdK90VjizgU8P/gfW2lsWHvAUex0Ho3bA4d7d8il6ovitJOdE0b79h2zqE9EF1EJIgGekFoPnygigZidLBUn+kdhxArXyEtvZv0M0xW6xytolhtxosm3kIJ/ngdRhpZO5Zd4JX/eFoCDV1BjsYe3AtGkpWSuxdQxRy78nr7S7nZLYsvIJ1xRrp7fA75KqKnT6EvYlY1Oh5bzGc3j3Hy+/d91HD2jQTEcIW4rqH/qMGoIl8BWf+MLyUQCpwzmgrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <925bb889-8048-e275-12e7-a4f5d31fb76d@suse.com>
Date: Tue, 30 Nov 2021 17:11:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/monitor: don't open-code
 hvm_has_set_descriptor_access_exiting()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0031.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::44) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a18fad97-0f1e-470b-49a6-08d9b41c245a
X-MS-TrafficTypeDiagnostic: VI1PR04MB5327:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB532782B88E1020B1F0D91832B3679@VI1PR04MB5327.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5tvN8bVuLJxCVrmRxaMemClLmQvRR0xjB7zRMzlsWfa7ppyTyroYTOAX3gMKR1Rvh6Fi4txSTaeSMH5b3G/Xore46n4QEGf7I5OI++Ww1DZRWbdQ6BfiCMKMgEwYSQ8ye5F4+w2bFHfNR9Ay1jij5Y4kEpaiDYr/wKm47+tbI27KrkshALdG/C14O7B/vE25DSsdFqUW7HjHZm6E3uRhW7+FIsKiaOzkkeWJsT8qVs6m17XjzfQiLGSnE4t13PQqZghrb0V4tIhDrLVm7C7iyhTlQIXRGriIY2gKXGldNfAYLiiFbrgE5uRgtNLzR6bsWDUE9xjSJoJgOXJDzol1Am6FSIDyvwABWxtMDptjOlsCyKF40yLMz9i57TScz4BFCvhn+3O9QooaHu8My8S9ypf9CNEYeTIimWmUq1hcD+0omM2yfMXbNPBHyGGZ4yY/hKLso5yNHBcHuI4UUTNuW18O8D7YMELG05FXqTpzUIfW61X0ecc/+4qqhMum6tsM0hJ2jsRkBdj2juxq53D5h0GshyiTvTITbeZlhogTD5UxAxniHwMYDD2EuUuihgliz9RRqQlQGuSU9ZflgLhgjYnhAhnQs0+dN/dDSlI6GvorA4Gy3KZ1rdiGuW6pG+zX/fiwMz1Lq59yTxvoZKGeSZuXvM3NqupGe3AHGkxmfQ1UZsDxxAw8k2bTerMvy9fmJDoat6xVbT9lyKkbRu7zMlTVz885h9sc64m1zc4+GPLstbwJGJVIm7ScOpWzy/V2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(5660300002)(31696002)(956004)(4744005)(54906003)(186003)(4326008)(6486002)(2616005)(2906002)(508600001)(31686004)(16576012)(8676002)(86362001)(66946007)(66476007)(8936002)(36756003)(66556008)(26005)(38100700002)(316002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c284TEcydDRpeFZ3OXJQTHFrSWNCUFpkYzV1SzVGL1B3dzk3TGNrdUQ5QXN0?=
 =?utf-8?B?Z1g0T0lHcTBubFlZbHozQkRJOXI5amhPWHJoTFBkbEpNZFlsTTdWeTlvaWhJ?=
 =?utf-8?B?RENFRWdGVzZZZm81cWxMaGJBODhCbmU1YWw4Sm5iT0ZCSkFnQUtYdktKd0Y1?=
 =?utf-8?B?Q3ZiNVpvRGNKM09qN0JlZ1ljVGNoTTBsWVVsS2pGaVFic0JPb21sR3FuS0xY?=
 =?utf-8?B?UTRRSmVDOXRQc1hVclpOL2VrTEJxVys4aUhLc1JseVhWNXEveUFTanJ4bFBU?=
 =?utf-8?B?eHJsWU9vSzFwWUFqTmoyNTJhRHcrSUxEdG1Oa0NqTGFyVk5pclJhdkNmQkRx?=
 =?utf-8?B?TnBXUnROdXRrbXNLSFJ3N0pGUzRVOFBiSDE1bkwvUlFhWE9sOVBVY2t0UlJP?=
 =?utf-8?B?dXliZ0QreEk1WVRKay8vZzRhT1Z1UkRRS3dFWWxoUGgrazhxNlY3SlBYVmRR?=
 =?utf-8?B?UkRVWlNYbTNyZzJUcGcrV1NXa1VOY1RXbXh1VE9YV2F5THo1eXVxblVIRzRk?=
 =?utf-8?B?aU1sWEc2MTYvcEJZWm9JcjBFZFJOZHRZVUhWZ1V2enVpNVpNeEJxK0M3cDM4?=
 =?utf-8?B?MGs1VkowL0ZiY2tQYjNtMFV2STNQN0hHcUpKZ2ZYazZyV3QzNERTMG10dTVO?=
 =?utf-8?B?RVpQNjZXV2RSQ2NNdWZVbExzNVA0UjZ1OU5lQmdjR3VNSnAxOFBkdGhjNDdt?=
 =?utf-8?B?WjZjV3lXSi9NNnQvUFBqUHZsM3MzZ0wyelgzVXh6SldocnJ5V1ZKQkl0V0s1?=
 =?utf-8?B?MHovTzdmODlVTU1NT3BpVW5ueGtsd2w2eDhQQjgvUHQ3RzAybnJyOVBaQ05X?=
 =?utf-8?B?YlZCVnU2MGxYN2gvU0hDVEVJT0pJdllhYUc0ZVBQeXlzS1VEd3FBMjd4MnVB?=
 =?utf-8?B?Kyt6b3VYWDdESlp6UGFRd1JQU3kxeUNKWDdvM1lWTWdPa3JDY3FqUjhnVUZU?=
 =?utf-8?B?aWxUMCthRk9qM0FpZWp3MUFrNWpZR3pSbTgwNjkwRUxSbVJYWExLMnZvTU5w?=
 =?utf-8?B?WkJPU0hIVTJZNGpDVDcrVTFGZkEyVUtGOCt2aW4xVm9NTGVreldQTi9RUkMz?=
 =?utf-8?B?cGh0S2g3dVp3MEYyN2IyeWhsTXBBQXJmMTVYaXV0ekdZeFFFZXpINWZZbDBH?=
 =?utf-8?B?cmJ4OEl3V2wwN1FwMzE3Nks5Wm1KWjhIMExhVmpMMXhucjhoK21uWkYzeWJt?=
 =?utf-8?B?TzFoSXNCTWcwbkdibkM1WnFyUzJpV1VHN0FLc2Z0ZHptZ3VoMWpFMC9hcVZI?=
 =?utf-8?B?Y2xSbHJXWW1od2Z1aGxQOXEycTlpQmFIYTYxVEkvOGpNR3hoREU1VitqaFFY?=
 =?utf-8?B?U0t2cUN6ZkZyYTVTWWRIOHZKdlpZRnN1ajBoUG43LzVSTGtwUWtscjlidUI2?=
 =?utf-8?B?aTZxeTFLQm5tSkRtTFBmbmNZNEp6QUl2cHdTbkVQQ2Fic1VqaDkwdjluZWJj?=
 =?utf-8?B?VC9hREEvVTFENUdRTVowdjBhVTVNeHRoL2tHYkcrSWVVZEVCU1FINThDV3VL?=
 =?utf-8?B?VFVMeWZMeWwxMXM0QnIxQjJFeWprQ29peDM5allwckJLYzVRT0RMOUxWU2pM?=
 =?utf-8?B?RnlTWHpzUEJ0NjdNWTFvV05WRnVVUHVMWjdyMlBlVWZOMTc5UnV6aEVqd0Ev?=
 =?utf-8?B?NVFkNGlnazhKTGdHbXMwR0xHN0hoVmRIUTZJVE8xSTYzdDlwb1JmaXdvZk5E?=
 =?utf-8?B?QzAxRkMxSzlGb3ZrcHB5bUhWbkIrNVhNeWgzQVlFTTJ1S1pZL3pBME1JTDVi?=
 =?utf-8?B?aC9Bc0ZPSzZUd1o3ZmtwY3lMa0ZXR2U4VWlSYWJIWHJNZncwTGEra0dRL2lK?=
 =?utf-8?B?eWdzUm0yNU82OXJmUFcwaTZyektacjJpWkluZEdUcE8wdGFlZUdxL080UFE4?=
 =?utf-8?B?a0d3cnl5aDYyZDdtTnM2QnIxZmNCQmhCRUhiQmRIb0NCNU1jZFd0MEdUNkkv?=
 =?utf-8?B?L2NxYzZxSkRranBTNk9rUTdPaHZ5VFN6MGg5Y1VRR3ZCS1g4bnNscmRxK3NG?=
 =?utf-8?B?Wm9LdWVCbDMwNlJaT3h3U0VvMmh2a1ZteWp5OHBpaSs0OERlL3VXWS9FZXVz?=
 =?utf-8?B?cFJKckRQeDAxZEg4OVpXblduMVFFc0cySW5COXVJQmplS3p1WGJUL3hTWW4w?=
 =?utf-8?B?cVJoeUplTWlXRlRkMFN1ZEJ3ZFVyWlNEWitLMzhnSUo0UjRQZVFmZ2VzbXE3?=
 =?utf-8?Q?23JUO3UUr8qRs7aXsOXJdKA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a18fad97-0f1e-470b-49a6-08d9b41c245a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 16:12:01.3285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pbU6ZxHtGXzP5zj+ymIu0gyt+eabNbewKjM2G6wGQkJN4ULphnzMMr6U/hEX2yK0DM/+fd40IdGWOoLWg/1eew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5327

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/monitor.c
+++ b/xen/arch/x86/monitor.c
@@ -263,7 +263,7 @@ int arch_monitor_domctl_event(struct dom
         if ( unlikely(old_status == requested_status) )
             return -EEXIST;
 
-        if ( !hvm_funcs.set_descriptor_access_exiting )
+        if ( !hvm_has_set_descriptor_access_exiting() )
             return -EOPNOTSUPP;
 
         domain_pause(d);


