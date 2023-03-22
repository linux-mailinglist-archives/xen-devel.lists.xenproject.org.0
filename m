Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 630746C46A7
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 10:38:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513270.794055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peuvF-0006Ww-F5; Wed, 22 Mar 2023 09:38:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513270.794055; Wed, 22 Mar 2023 09:38:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peuvF-0006Uc-C8; Wed, 22 Mar 2023 09:38:21 +0000
Received: by outflank-mailman (input) for mailman id 513270;
 Wed, 22 Mar 2023 09:38:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peuvD-00068H-NZ
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 09:38:19 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20604.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46a11cb5-c895-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 10:38:18 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7526.eurprd04.prod.outlook.com (2603:10a6:20b:299::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 09:38:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 09:38:16 +0000
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
X-Inumbo-ID: 46a11cb5-c895-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fTFCiUajNc221/cOMD2PCwdA4qcEKgIUqXNW5J5kcqIgMsRD6lCqXJn+Cw9RT5O0kkSgQEMTNdShCRdZvDSuY6FSGMaIi7OdIdLtUvq2dmR5p4EUXFYyRjWS2bHoPFQvfwCI79HMa0EpPpW0a7T8xWWRSY1YmFUdngcgHcTkdwvHzeKSkR0UqmqsfuXWvM6RAn0fRgtALlEYe2MmrkgS5Yw9+CIdt7CL7/tmr/o06KA9c/jVWfwD+QU9pfk3rHPIrJXgne/2pgDp5wNEuYKvkkIsW3tREPEA9IjZSKHY1vlQZZcYRs4+RKVhvNhnZlMttta6s53SYQasgFbij1yiUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cEqVEv6hnrXt0HrtRsLdnSxoS+k1kdzCtSY7As/Jre4=;
 b=FzVnHVfxfQ+FcPKYMlKPxPIBbBbTLle/A8HVZWc2PW04Osdl0E2ajAjyGMS81bAzk7Ok5/9RtC09rtvBCkxgSvU0gBzha7IgEodcj5DqVRqydvpVdACHGsF20v6T97ImLyxgJWxNj7ynSrcAXUYds6YriWMPATgPgQpOTB1iW3/2YrWiE85cXT26vrQ/6yp4t0+zNbaVNKh5J9a44BvOlA8E3cX1IyWVgTsxgT6gIEs97EyXZGooBuBviIxynNuWl2aND92WERVVAYxV2lO0TCm1mGbO1gIsTQdUkiQqpIZ4cxdU8RoQ0gVy8XRsSiBsSoK8pPNViWIj5wDX1F4HPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEqVEv6hnrXt0HrtRsLdnSxoS+k1kdzCtSY7As/Jre4=;
 b=u9QCtarDOr1oThrcwbrSZCVHDD1Ro5bkf9i+w+HgJZLfjBB2ASxvmTAUiNyQlDDKJzloGm4bdKUyGA2kLZ+1AaCIqA5ET99f4zORD7Gx6lxUenSPJq3L5+v3QenhSkaEIQHCKgRMwj+ISTTm+vW9FnoYg4u2kSEon/ThmZyPNY8kOS72kpgSOAUImlqEGImvuADfFPgu2GYO5ZjpqSJhzsCC+xEH9/D2mk8Flnub8RlJGiHx+ldP0kcP+wpGdh2Scfpwd0/3u94owg2dE5O4fYzyVSz2GAYUhEgs0B2ruFyg/eTeW4SUYPAbqmXhqlSDbVwD6dPLr7ymJnTgGivyoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1c2bd7b9-34f9-bd00-cf36-7cf6e0bb8c3f@suse.com>
Date: Wed, 22 Mar 2023 10:38:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: [PATCH 16/16] x86/PV: conditionalize arch_set_info_guest()'s call to
 update_cr3()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
In-Reply-To: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7526:EE_
X-MS-Office365-Filtering-Correlation-Id: 01fdf09e-c4f4-4146-54c4-08db2ab929b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tNroTL7VgW0a5ebnec6FWkocSwLdNS30+nc9wJCdhb0iPguBOw3TGt4aIC1iCtYqNkDEOTC8/wH9rKhOnEBm8in1npYgZpDvuLosC0GPHP0NVE5S8WoazJkj29DHy952rfMWFs4Ll2xRSkfiJ/8JPeIarSEcZJqflajS8FGgGPOpB21zhxDNKMb/Qut+JncqDPYF03BWisShC5Ozz3iXHEWJbuTfyTd+GyEbaA/zXezxH/m78dX56WcKEV6fUYgoJlmN9UyqVDN4tP7mXuAnP+Jx8wJkP4mqaJnrssExICvwOUk+VunAdrZsQDh8ApM092CA45+8x1I/XKZCbor/18ik4s+nV/yHlJZF8jWqadUwWazDMcoAEOf8O3UGBKWj8KaeCXMmilx6nhl6TJNk9BOjEeeJG8VKghSKI1rUBNWy/GxilAu+drI+kb2NsgAgxB96o4ZR+mP8edjEtlZcVPzuCvlyeLAAstfpRmZpYjlhXIattme2/Yh26EoowJLUP5rmWbPwf2KpdYIca5eACjBWblcMcn15UFY3RhyUm43InoiE5N9vqAjHMO2alu+EdA0m+E4tXjJBjtQ6PSe/1nX01jgYGmi/ZZkGQH3yzeDj80Ed8AUbwViqIEypj2HtxfSeWTLVwMSg63kBKhKDj4wXbh63I/1iR7ifyHe0F6O/fJmeYU7BQabgy1sXmsQm2b4z/Y1InjEAiQcT/pp1i42aUzc5v8cK8cZIinh+SXo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(39860400002)(396003)(376002)(136003)(451199018)(4744005)(5660300002)(41300700001)(86362001)(38100700002)(8936002)(31696002)(36756003)(15650500001)(2906002)(4326008)(6486002)(83380400001)(478600001)(2616005)(186003)(6512007)(26005)(6506007)(54906003)(8676002)(31686004)(316002)(66946007)(66556008)(66476007)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFVpYWNRQlRvQlo4dktOQ0RNY3liN2ZUcWY0RFkzTW5BVWVYMjdXakp1aGpq?=
 =?utf-8?B?VDJieW5JWWlyMU1pcGVTdWxoVlNsYlNpRnhlK0RtTXNBU3EveEhUM25NdjVo?=
 =?utf-8?B?d28xTTJ6bysvYmIvcW0ySEZiSnlwTCszMEZaMTNHUUlrM2FTMjBSTzhpNHJz?=
 =?utf-8?B?M3JKNG1xRm1rL1JZTEFSYmd1b2cyVWNWS0hZbTRDQ3YxWnNGR1k5ZnZoRTBm?=
 =?utf-8?B?b3lCdWZvaThpOENqVU5QWlNGaGpPalhEaVVZWkt3VE5jSkx2Q3VvMUZRTFZH?=
 =?utf-8?B?WW80dFZ2UnQ0dUphRTVzWEcvaEV4TjNGbFI3QjAvcGF1RDBFQ0NKT3JXWWkx?=
 =?utf-8?B?Z29WMmhsNExmVHFnUXVjQ3ZieG9JcEk1U1NXVEE0d0lhNjUwRk9SVmptc0Fj?=
 =?utf-8?B?WGNSQW1NQmZRWDVHS09KSm9RaVhwZWw1d0p3dlp6UUxSWmFkbGVpNDRJZnE2?=
 =?utf-8?B?d3IzeEVxRzNEd0tEZ05tS214R29tV29BTkxQL1NRZ2o3ZVZ6VFV5bWxhL1lQ?=
 =?utf-8?B?MXJGTzNBS0VLdE4rWnYxN1M4Y1dPc2xMSDBUL0JjbDdMUC9uVjVIYXdUczlR?=
 =?utf-8?B?RjF4WmVZelByZStaOWpYcjBYM2NnZFhnWW9Qb2d5NjBNWnE3Q0VtZnZ0N2Ft?=
 =?utf-8?B?UnFWUkl6Q3NTZzB0OFQyY21VakgybkpuZVlpd2tJNThzTjFsQVpQVXl1TXV3?=
 =?utf-8?B?WUN6dU1YM2pGUVBIMHRKOTF3SU1USDV1UDhRbEtQcy9VMEZIRnZxMnRrNTl5?=
 =?utf-8?B?bm9FdVhicUMvUEQrZldOTmlyREhNSkdFeHZDU0ViUlhKWjFabDBEZlExVi95?=
 =?utf-8?B?MzU4VTFWRWhhcjFwdXJDWm9acGoyRXMzbFJrbVVCamo4RHArUThlbjRZZU93?=
 =?utf-8?B?OEIzMmxGMkFzRG1yZ0NJVmpNM0VBQ3VINjRrSkZBTlRJaXVTOE5WUG5jRENL?=
 =?utf-8?B?a3dvaHRPdFdnejdXem9nZG5NZ2RQK2xGUEIwMWVFUWNUSXJEU0ZOeElzVXFH?=
 =?utf-8?B?WjNscGI5S2NpbnFqYWpDUlgzWXByOFJDUVJ1N3RDRVJ0TDZabVpJVjIrR1pY?=
 =?utf-8?B?WUh2QUhkT0lTUkFNb0QwK2tZQVNVcDBxeFp3VU0xMnhEL2NRcDR3Y0YyRnYw?=
 =?utf-8?B?Y281L1R5RFJSeWJQL3h1eWFsNzkzb3N2MUhiV2JlTnFxaWNveDd4dHNJVFpi?=
 =?utf-8?B?cmZUbU5XQmJNZk9qVUlZSlk5cWRxSndTWmdvZXhpSHVPYWlUa2ozQ2s0Y2FC?=
 =?utf-8?B?Nk5VcVpzVGsvT1hLbWtNYkZoZTdQZnNxN2Y2TTJKYVFtYmJxZFpKSjdDMGlJ?=
 =?utf-8?B?NW44b3BrdTNjbGpjS1U4cjB6NjF3OUVXNkZIMHQ0SDlWVTY4bGNRVy9pWjI3?=
 =?utf-8?B?Z1NxbjdabU1xM0xXZkFRMGVKMHh4Q3lMczBQUEdySFZEVjFvL0Y4dEptUFpC?=
 =?utf-8?B?b3B1L0c5cFFwQkNPTEJ2cTFSQVZZYzQ5MFJGeDkrY1Y4VVN6UWgrRGxOaHcz?=
 =?utf-8?B?OTVpMlJYVXRLUFFxSk5oS0hjcGRObmg4RC9MVVVmQ1ROeEJ3OHhlY250b1ZI?=
 =?utf-8?B?Wis1elgrZllPS0pZUmpXU0sxK2dQZmpTaFp3cDZ5VVNabGk0ZGNFMFRXdFRT?=
 =?utf-8?B?bkxVMGx6MytDOWFJRGxabXNIY3ZqYUFlT2NXRk0xdjEycjg1blNLM0xpK3Nz?=
 =?utf-8?B?NkZpUWxseDI0Ukg3M1ZSbiszMEVMaVE1TWhsZlN6VENUYmFtK0UyelRTYVBX?=
 =?utf-8?B?ZGtWNU9US2g2UzVHT1NtRkVxc2VlUEdHcEdraSthYTZXS3AzWHdHT1loclVS?=
 =?utf-8?B?dXB1REZYY3QrM1BnL1JJQU5ZeExSWFUrWm9CUDh1UDN2WUZjM2h5bGpVWnQ3?=
 =?utf-8?B?UDEvSUNieUlXNTc0RkxUWmk4UmlhekNYRHN5TDhCUW1ZRXluUWxkRU5tdnF3?=
 =?utf-8?B?R21xT2JPemFEZ3k2NmJUMTNHZ3dDLzRWZ0dmRStzREFkbVg3dW5IYkQ0dk9n?=
 =?utf-8?B?ZkpaZnMvdmpnQ2UrT0hRSFM2cTZ4VnlQcnRmRnIydjV4bG5vZU5XRjMzckJQ?=
 =?utf-8?B?NTlZMEMrMXpTZ3puZGNzdWtUbTh5WDF2UjFtRWhFRVhIYWVuVkgzK2F0RjFz?=
 =?utf-8?Q?p8kP6RnmhXj7ouPAtgEApn7XN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01fdf09e-c4f4-4146-54c4-08db2ab929b8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 09:38:16.7975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vwVPhQLYbaHwn8dP1/p+uu+BX5CvIlE5Zju88914EauSkFLAx5Ik32CIu5iqS4qYiWy7VgphKuufXMwQJQa2Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7526

sh_update_paging_modes() as its last action already invokes
sh_update_cr3(). Therefore there is no reason to invoke update_cr3()
another time immediately after calling paging_update_paging_modes(),
the more that sh_update_cr3() does not short-circuit the "nothing
changed" case.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1445,8 +1445,8 @@ int arch_set_info_guest(
 
     if ( paging_mode_enabled(d) )
         paging_update_paging_modes(v);
-
-    update_cr3(v);
+    else
+        update_cr3(v);
 #endif /* CONFIG_PV */
 
  out:


