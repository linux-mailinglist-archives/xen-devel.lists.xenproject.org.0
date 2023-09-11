Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2393779A8A9
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 16:36:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599509.934958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfi1m-0001fN-Bi; Mon, 11 Sep 2023 14:36:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599509.934958; Mon, 11 Sep 2023 14:36:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfi1m-0001cx-8j; Mon, 11 Sep 2023 14:36:38 +0000
Received: by outflank-mailman (input) for mailman id 599509;
 Mon, 11 Sep 2023 14:36:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xbw8=E3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qfi1k-0001bU-Uw
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 14:36:36 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe02::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c0f8278-50b0-11ee-8785-cb3800f73035;
 Mon, 11 Sep 2023 16:36:36 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AM9PR04MB7586.eurprd04.prod.outlook.com (2603:10a6:20b:2d5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Mon, 11 Sep
 2023 14:36:34 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 14:36:34 +0000
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
X-Inumbo-ID: 9c0f8278-50b0-11ee-8785-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vz4qw3Zsfh+FYGnm5TafrmoePw6kvmt7WfVozq9lcSiJcKNbqtCQqOhsMpUaUwP6xoenZk8zx6JicGToXThP6w7bbp33PO7q5rVdTY6Jmc8OiKJRA1/92OBetR1v5GlBJwRU5xXc5jkmSpxLLEiswNDBXda8pfwgu+0uuWujqKSbI+Cd5BibX3mlH2KAwOPKHI+Yo9x2+YUXuuJA4e7tSCgn+b4n+E0nbVuxAtPDYJucG8vhNiuWl09p81rrqfOahpWgErKA9eWseJYwpsIsO7P1PfpUzARHJYfUD9hX4loWEqIsUiQmtm9ypEVffVPMzY+E14GfLH8MB/CZtYVlUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqIdHcZyDR+MR0MB1grWK5WNX9bj/EiMBf/IG+XxCco=;
 b=YmJP4xsze5KCKDW6FhnEyur10MpIZnn47Pe2riGaK2dlcNoqqNsQfqZSeL/8sbZF57+YXPQ3msNreAux230v851sROTawyd49mBAiuwixPfQLbYlIqAzpDhs7Mq1v+SWakvnP5+HmXcPbxbqJdLv9PpkbTb1FAfXDH0phibAIA6Q1kDqoeYl9yrLwSy15AaqE63yn8pS6ocAeAWvOHl4P9lVd4Y/CQ14j0c1aJmnZZZcSuGOmMJlE4xL8JseQwffnXXrDuwv1hAjHeVH1iJdhjjDaxTmRWa2ehiczy25f6yaz5QGJLfU9BIWMa1yHdKv+1CuQYhPiUNzdzb0Gnnw4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqIdHcZyDR+MR0MB1grWK5WNX9bj/EiMBf/IG+XxCco=;
 b=nLnKStn0v9CJ9pcb/iNQMdfod4rSIT/PG56wXGVvNP5Cg6wvk9MiqokmxS8V+8aeO+BnrN23ARqAEnoah0qtag//wgl/aP0odQLnZJFI6pZTiydpl60ahSziWv4cqqskzBQYCW3pqHAOnxMBXwo8cEPkj9J8YfOZ3AyKTnTVe93Z7hVe4dzVlCMNVSVx5v/CNJTsIIDvlJHMduUSoavQ5O2EsBC7mLujuhJzM9EPBsTRs6krq14t5hhB+X8+WpLFbDZqoUR4pwnrHeW1GzuIfWGaf4Jctm9hYxa7g+ngMElcBAPx27+C57iKXkbnbzBGSVR9XMl/1Qe8MNYXATnGSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4edeae5a-4bce-ff1c-199c-243311f3ecbf@suse.com>
Date: Mon, 11 Sep 2023 16:36:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] cmdline: move irq-max-guests doc entry
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <74aa0f95-e059-f6a4-b085-03c7e4b2fceb@suse.com>
 <CA+zSX=acfj1E2-mzPFVUJSkWKro71S-dcUj1b4LKz0Aj_icbbQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CA+zSX=acfj1E2-mzPFVUJSkWKro71S-dcUj1b4LKz0Aj_icbbQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0216.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::20) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AM9PR04MB7586:EE_
X-MS-Office365-Filtering-Correlation-Id: 36fb6db9-b531-4ff3-0981-08dbb2d47f51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qIRZZFCc2IkQ7s5nTnZz6m3j46PFaEq607esqgDjlQtel2FR39fQv/bVdEXzveOWU4LlBi6hs1K4G8H0pFZx+edncRAZGAZRB8QCSeri1pEMETJHsoHWvz3wpIESN2p0xkHoGgzFQHDi0cG6aXqXDFMHdWVVKRVAqfqRf88PrxXzpwSn3XAKN3qopRiGQ+3FZFccwyhgZgS+/HFWv5qGGR+l6oLly5hQ04BlYx0kNuHX8MyYKUD/sO12kAPEchkj+Qmx/eJPVfRa0MtsL+ewDQL6C6v0eq4c/8era2eGRZqEwJxikX97wQ9EUl9QItYbf8AhW3lhf3jOV1Od0MtsZKakL2vchUICvL5LlNBx9rCf3Sdydg2gRTuj4BqiKZhVxot1yCTnxlpnmheonfU0p7+onny1rj0VNSyeJ+VeuE/URhT6FOgdz6KMEfIAxmcSzPNgM3ADe1qjVTcmJwriycVwy2VTthHH3EDTUHki/j6Mbdua4e/179p0TRzn5qeBvVeMB01V2AKrexFYiGSB9WCn78thFuSxOOU+C7Ys4CKBBkHWst4Ptfk8yIzfWJVRLS/cX0oMElvma8QkJsEg8YMPin/BEgMcmxhLlySeZTqERmzNeUEZeWiCTgvP1Ir2kJ/nxx0V8DgZjsYWUqq+xA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(396003)(39860400002)(366004)(1800799009)(186009)(451199024)(53546011)(6486002)(6506007)(6512007)(86362001)(31696002)(38100700002)(36756003)(2616005)(26005)(66946007)(66476007)(4744005)(66556008)(54906003)(316002)(6916009)(41300700001)(2906002)(4326008)(8936002)(8676002)(31686004)(478600001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U08rdklKdjJDTHA4R2tOZGpjdGFzK3FFTE1pM3A5M0RIZkFTSUkveGNDMGxE?=
 =?utf-8?B?NDdWbWFxaTAzRTRRalRRN0UxaDZEcm9pQXZjaEs5bmF0K3pZeFR1TWpPTWhD?=
 =?utf-8?B?RmRaUGlWOHEyL2J6dVVOM1VZL0I0MHFIcmZ5RUgzV3RYZlA2akF1TVQwVE1K?=
 =?utf-8?B?S2ovRVBpZVR6MU5SVGdSZnhkSnRiMHZnczcvNWsyc041QU5LNk1ia0JhZEkz?=
 =?utf-8?B?eURtODFKZU1uMmIyOHNrVW5LM1BVYjVMMzBRN1ZJekIxMkRvbEFUR3AvUTF5?=
 =?utf-8?B?RTJWVWczRHl0emUrM2xDQWh4aFAwT1Q0aE40VUozcDJPRFZhdWtxREhyajBm?=
 =?utf-8?B?TUozRkVGTEdCdUtPQ2ZOd0luWnhtWTRXaVRuV2FSbWhyTVk2cGNpaEZWL3BQ?=
 =?utf-8?B?S0FXTVFBbXJlRStVcjI2SmRCODdueFI2aWRRSXliM0xFOHJJWEJsWmlYTFAx?=
 =?utf-8?B?YXdqYTZBR1l1c1BKdFBRcVdPTkU0RlFLd0RCMXk2SDlmdC9sN1c5Wkl3amtv?=
 =?utf-8?B?S3lsMzluTW5hSWZiOFVkelA2b3pGVVZMTXpsdDE5ME51cW10M2lUS1YxRTRC?=
 =?utf-8?B?YXVrTkduTkhLRGpXWndheGpKaTdhYnlJT2RzK2x4a2RibGswdVRGNUhwVlUv?=
 =?utf-8?B?RUdyek9SWE84anZOcXRvZ3p2bGVzS3pxVzZMMmlFNE9KalFwZzdBYzU2Y0hv?=
 =?utf-8?B?TTVKRWtzTUVweGg4bnpnRHQ4Q1Fxam1FNWdZcGxrTEJjeERHY3paOG10bHpL?=
 =?utf-8?B?c3o3d1NTUTUybzJmM1ZGN1luV04vbmF6bDhpMjRiRUI3UDhYeEkyQm5ITFlr?=
 =?utf-8?B?cVVyUHN4VVU5MTgwSmlNcVE1TndOeVZabWVObU9GeTVpNHZ2anZtTGY0OGxk?=
 =?utf-8?B?UEdjdFhQNHZtNEJONVFOWWZQOVFPcCsvK2VMU3J5YTlGK0pzc3M3WXVGOHhP?=
 =?utf-8?B?Rk5laE5pTEVrajRJWDIxbXY2aTY5akFZY3AwMi9QcHhHckNnSk82alVEZjQw?=
 =?utf-8?B?R3Q4aDJWMHFFZ0U1aC80Q1Y5S0picFdJREJkSHp3UVFLNHkvVjVPZ1lFOUYv?=
 =?utf-8?B?NWM5U0NoNDdaS3Z3aVVmVU0weit1c1VTZG9PMzhHMzhHdHRWekJyLzdiSkRJ?=
 =?utf-8?B?YU5ldkxIM0NwTWJBS1h0U1hDTk9zWWVDWlBuQkl5aWZ4bitCclV4eEhjM0xO?=
 =?utf-8?B?SHlKWnB6M0l5OUgyTElreVpyTUp2SVZ0NHA5VllyUk1JMmJ2WjJxZ0JzTk02?=
 =?utf-8?B?eVU1OXZGSWRqYTNuRG1yK2NONERRcHBrK3J4VTFZQllXVkhSQXFua2s3UVdt?=
 =?utf-8?B?Rk9CYkR3aGZMd0JkR0NaNWhyQVJoS01vOElhcEN4MWlSTzFBYnpWbjlINUZk?=
 =?utf-8?B?dXpLL0tMS2ZLWEpPRDY4OTBSanV0ZE5RQlViM3NxRXpET29vNGJHNnNzWC9T?=
 =?utf-8?B?MGxyRTRDdVAwSmtwY1h4U2ZxazhEcVg4RHlzeFAxQWtWaUNsbnRxdmdUL2to?=
 =?utf-8?B?YjR2TWZBdUZPYzV5bVU2TmZtRHBNZ3Z6YWFiblBTNmgrc0gvS1dyMVFESDBq?=
 =?utf-8?B?cWtiWVQ3cWlydmpuM3BRbFMvditMemNnMEdJVHhvbm44U2VMRVZST2h5YXVC?=
 =?utf-8?B?c3ZTUTJPZW9kcDh1ZzBnTVRUMTA2RnNvMmVqaloxK013MC84aS9DWW9ZSWJh?=
 =?utf-8?B?bmJ3Wlo0Rk1EREE1Njc2cEsreTJ1eGk0UFNaVndPeVZ4bmErOUdqSGJEQzd3?=
 =?utf-8?B?aGIvM2M4RmgzZ3h2bFRyRWcwUHdnMVJNYjdOOWJHbmxETEczN1VMSHpIUkx2?=
 =?utf-8?B?ZmwvcFJvZWNtZ0E4TzBlbWJWeHZYNDNPSHQwWGZyV3dGK0d0K0kweCtWZ2tL?=
 =?utf-8?B?aUxCQmZBY1ZRRzg1WFBuU2JFeEFUcFF3SFZiY2JGbEZiT0hvOHNhT3RzUDJK?=
 =?utf-8?B?Sm93enNWMk5IY2pYUE5qYXZmU3laN2VRTHBXQ2Q3aXpNWk42UUhVT0JpbGdX?=
 =?utf-8?B?VEl0UUl1NG5jSFhoZ1I5ZGZhL3RtNWtva1hJazFrOTlyc09hbFhycU0xSW5C?=
 =?utf-8?B?VXQrWUNYTklMMXBBSzAwTmZmN2wxTUdOWlpnUG94czZDMTdYcFRzM3FrWnJT?=
 =?utf-8?Q?yDzvv8KfmJEDY3MsY6qZ8t4Su?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36fb6db9-b531-4ff3-0981-08dbb2d47f51
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 14:36:34.3077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U2nJJox4YKZEQtoZUX6McuT7ZOKzM4pe+oHdXNJaGrZzYGhbcf5y8PjNVXo20BPD8SeX0tn/aC+ccF12/4w0sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7586

On 11.09.2023 16:34, George Dunlap wrote:
> On Thu, Sep 7, 2023 at 3:17 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> ... to adhere to intended sorting.
>>
>> Fixes: e373bc1bdc59 ("x86/IRQ: make max number of guests for a shared IRQ configurable")
> 
> This seems a bit strong, but in any case...

I can drop it if you think that's better. I wasn't really sure either way,
to be honest.

>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: George Dunlap <george.dunlap@cloud.com>

Thanks, Jan

