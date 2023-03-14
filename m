Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD6B6B9B6B
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 17:27:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509738.786107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc7Up-0005t8-8e; Tue, 14 Mar 2023 16:27:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509738.786107; Tue, 14 Mar 2023 16:27:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc7Up-0005qn-4i; Tue, 14 Mar 2023 16:27:31 +0000
Received: by outflank-mailman (input) for mailman id 509738;
 Tue, 14 Mar 2023 16:27:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3caR=7G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pc7Un-0005qh-8C
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 16:27:29 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on061b.outbound.protection.outlook.com
 [2a01:111:f400:fe02::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1bd9dfe0-c285-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 17:27:28 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6906.eurprd04.prod.outlook.com (2603:10a6:10:118::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.27; Tue, 14 Mar
 2023 16:27:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 16:27:26 +0000
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
X-Inumbo-ID: 1bd9dfe0-c285-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QSKsEsBnlETQ3L0B4aq7/RXzUyxgI1+bsRujWQA66pH4lpmMp6Nqibj1ygl/ihLpFPWRrpYaxlupueVDH58vuLxIlv+BA20UQf2DPiMkHgDYqQNJItPX4mBOZdEyDTt4bQdHt4xntqUFvVBESVKDKzdjN291LZ+nCJnuEvSOwH3x7t6rbPrB7Ml+gQLZTUzI5pG2CqZRrU3VEFlVJnr0ZNN0U8pmwqrOzuPr20tjywnMoVAFu7VIJXKGnyrm4KnNZTRV7ntFUSyzDdNf3MsG3NERAk5dH+eJmzyG3L1sf/vV/2ZLj3xIvBjC9IgkPWaHrkrMHgef2re6CCdV+b6mlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mv6JBrm4n+jwHmZLbRILtinlqYosKCYMAH49dE9ybxI=;
 b=j9oKr6RROnZ9f+2JeSoQV9pdgO46X8ZnpiIH+vCsjcbdMCSEZYMzQDnPH7MHRVErvwoPovQwz07Pmrj9P9Sv/AS+yQ5rF/BQwLKZEaIqxdMuSEX36oZr8Wbl/q5pqvpRqY8rj8K4+5mxtUSS+AcH7AVPMH7r15FbRYkZHvE814lL4ROu8s7BinOlp/hoRL47wl+FpsO9lt4KMjIEpjXCoeHxh++b3I73Y8r/wcNTLdwSGvscyMkvVYkxoY1NdLaaCti7PGDismuhZloBUvm5UwJayoXteAdKfH05GjQoXwBf5v9lh3W7/Qfe94AHden6qWAHfcXyRYCrQUae3slCcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mv6JBrm4n+jwHmZLbRILtinlqYosKCYMAH49dE9ybxI=;
 b=0/i5LNumr+lk5P4kysOstNUh7ylyFiesXEBZiE7S4L5HMna+IYroiMqs5i7mied+hSk5ibavehJwVwI6CUZR3NgROizSmcjv3Bj4sFvB9gixXFMMVuBHTRmIwCwNAYdDfWT78T6siUzcJxMzHjClHjTqCuGT4j3gL8sKxmDtS73KDFBEHtvLUr8di+A/cn2fwJHQhanSUNR027/pg0wqKcOVEerfF+LgD9Y3yLng8arEltu0/hdou9ozu7XoZqJ06yAkYu2UWZQnB4CaBEU+vxY64yR+3VNobKvZg0WEeDWiGbn5xxUKLxY9CIrnI6fu5CHcKUPralgW6DPb+OdDyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4eb7333d-085d-f97f-a3d7-a70447c91cc7@suse.com>
Date: Tue, 14 Mar 2023 17:27:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC XEN PATCH 3/6] x86/pvh: shouldn't check pirq flag when map
 pirq in PVH
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-4-ray.huang@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230312075455.450187-4-ray.huang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0210.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6906:EE_
X-MS-Office365-Filtering-Correlation-Id: 95b4b005-e3e0-4cea-5844-08db24a8ff30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DwB1UOS76wmRKB8QXV34R51owNVWKCea7+V3RY3gxSm73HPV9YEe3IAWcU9S/C3lN6yupx/8QgkthGVZ+qZOgYBKXT/41Vw0skMRadNSKB0yKdqJwrxR06gCvuwPnfGdNcNNuS9Sp270e7BORhivYsf/fwAcYdpE3p3Hz1O/GyqMkmFeZlxBSZH3fzX3p/njV1Fb/Aa4FYVrtjrWI+bkiGzZwkeKeE/o5eQZIyiJH7sb/O6TilxS1lBHNTK6aSf8S5cl+c10J4inpGi7HjD6iIwzAfurRiLIgIcuNdu9QRG4ZvqZc++qt2fjCOToVz1+EEiQH6RfT8puuclXNLzYs/Um1O/5hfr/K6LQFFsgdBc2jeQvF3zSSzrLOA8liujzRSwdT2NnDELjvCj86E3psfwWPKtc+reNyMB52JuPzEw3LQnP2HpvbvShCWC9AloMNOvEBoOJjJFR9zJrFBfPbdYbZF80wwnv7OeRGy8NqAm9Y6SUYlUE3rJe4jqSAoFKnqRSw/tVVhFYwQ+gKI7Dt9SDA0wwHeFVI/u9unoNba1WVLD4fxyO9ZZrxBWjxbFaHbp1ioaAGr4PEhrqkfsqBs7r7BxGa1Hr67zuyhGjvBsE+fepUtb45G8YumXLXergMXee8MJm9+sbNyzEXvZxtUUF5cUqGkQhFd/5taNPQGOIIlZRTKD4Z03EnsQG2XnSjTG2yv6ZPeO+mghhf52vYbcpV7PsWfk3GlIRFDZZFoo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(39860400002)(346002)(396003)(376002)(136003)(451199018)(31686004)(8676002)(6916009)(478600001)(36756003)(54906003)(316002)(66556008)(4326008)(66476007)(66946007)(7416002)(8936002)(5660300002)(4744005)(2906002)(41300700001)(86362001)(31696002)(6486002)(26005)(53546011)(6506007)(6512007)(6666004)(2616005)(186003)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGlHdjlhY0h0QXVDdkhnbFJpU3Vwc251dEZ6cjFTSHl4dFdVZGlPdHJXaHhY?=
 =?utf-8?B?c2Q2YlIxY09MMDNqa3VINTdwWHhxQU5HS3NQZzlWN0J6WXNYT2Uxa2cxZ2Zl?=
 =?utf-8?B?YkhHckpwQ3Q5anlHQjNYYTNzQUlPV0RUeGVrMVdOVzVSVHNLVlFXY2N1VFpQ?=
 =?utf-8?B?MjRWcjhjWEtSVHpZcEczSWx2aDUvMXZrWFlRZFJhTVhWTlFsWUNxMXNCK0FI?=
 =?utf-8?B?K09wU0F2Q0FSSWJxblJxMS9SMTBqcVIzeUNsY1o4RHhHaHpmZUdoZkpXSSt0?=
 =?utf-8?B?N29pR0U0UlcrendsZkdvbE5pclV0RXNFeTIrUnNEWlZPc3E2SDBSL3QxVE00?=
 =?utf-8?B?NStZWlhhTUh3UDgzZGlJY2NUcFVMS2VMczM3b0xwNUVHT3NLalhlQWhSSE9J?=
 =?utf-8?B?T0h5cGNBVFlOc2hLSXFNeTRGMDAycTF3cWZjVU5KOUFCa2JXSjR3UVlJdzZV?=
 =?utf-8?B?K0VHWjBpckNnb2lUZFhSR2dWSy8wU3hnNFlqNlh6ZmlvU0lrYTIzRTFpckhk?=
 =?utf-8?B?QVg1T0VaRERDSTdGRTFPMzMwcVBZZUM2Z3ZVNDNuRlNLOUpjOU5uWjgyWmZa?=
 =?utf-8?B?STFNYXlKSHp3VjE2bkdNV3hMUGExZGxzUEo1VUNPa3FEbUd4YVdTTDVoRGZt?=
 =?utf-8?B?dSs1em55LzBrUXh0aDhzbFFXZmdpQlh0N0F5UU5BSFcveTcyTnFadGxDdkFR?=
 =?utf-8?B?T2p6cGZ4Q1l0UFNNNk9RMW9Vb05Ld3BEVm0zVXJnKy9EVXhIT3VhUVkvUXFX?=
 =?utf-8?B?RzNCeHFNYnhYNUkvbkZWMG5xNjAzT1JhcmxnSjFaZzZYS1B1M2t4eUJCQzl6?=
 =?utf-8?B?SlBZVXA5VnE3dDQ3SU13OGZrQWVvN3hTNmZhN2NuTVZqZ0FYT2habHFvM2Jh?=
 =?utf-8?B?MEIwM0pjU2FWRnhUbHcxM0VvTjU4UFNoS3dRa0pJbW9zMlo3V3dYVkdzK0p4?=
 =?utf-8?B?Vmszek1Qd1gyYUlNdTB0dGZIMXB5ZllnVWNyZXVLSFFCTGtHc1lVL1A5dFVY?=
 =?utf-8?B?M3ZyVzhnYWY1NnNXRlZBcUJrSnNmNk1CczY1Tkd0eUQzM1p5VzlMS1ArTXVN?=
 =?utf-8?B?R01CK0owY0lNUlFhVUQ3UWpYOFVieDJLcTZONTJmZGh4SkJFdHNhdEJyczNs?=
 =?utf-8?B?NjQvSFBVOTJYbDJWaGhjTU9SSHNTbUgwTWx0ZDJkRHp1VnVmWG9JUG9BNFFU?=
 =?utf-8?B?dE9UV2RJNWNxTEN4VHZidTdndXA2YXo5NUxDSmdLZGJVWkZPVVNhY3BMTGlx?=
 =?utf-8?B?K3lJdUFlTENFdTFwTDJDekphK2FSUHg4Q0YzYmZGb21VeXJGMmdRUnBFbkN1?=
 =?utf-8?B?MmFoeE5ZaVFZWVZXUFdpMlhqQUR0WFBmTmVjQWQ4UmZiRUFsaEl2Y3FTcFpP?=
 =?utf-8?B?dDg0NHRldmZSOTJudzNSUWVUQWNqMzk4V1JiaWtNb0lhSGRiQVJ6MkEveDJp?=
 =?utf-8?B?b1cvYnUxLzYrMmIzbm9wNDNOWGFJZWxXek81bjZ4Q2d0SUJsUkJZb21xSXlJ?=
 =?utf-8?B?K1lmR0Z6OWpxSllkcFl1T2ZtS2VYSzA2MVY3Y3VteHVseVVYNEpESUhldE1Q?=
 =?utf-8?B?bXdzNTVOUTdQdTJPRlErVndaUUl1ZVR6UFhyU1JjVG1yd0s5Y3VqWVh5TVpD?=
 =?utf-8?B?b2U4c2dHMTQzMGNZTUhLelJxUm04SmhQSjlDejYxRjRDd3BUcTFqbTdKV2Q3?=
 =?utf-8?B?RVIybDZvcUVBZUlQOHdveHE5UGd5ZVpaU3ppR1JhelZxRHN0OHp0U0RVR1hO?=
 =?utf-8?B?M3hvL25rZEJjTHd6ajdvUVQ0ekxOaC9LckV2ZE1mNzJXYzJwcDhncVViNzRo?=
 =?utf-8?B?eWJwUFp1OXZ4RWlWS2lyZGpnV0YxL3FPdVFzNXZVcUd3UFFaYndWVC9CV3Uz?=
 =?utf-8?B?Wm15ZzBGM3dRZnl0ZHdqQm1sbWZROU9CbG03dFBYa0w3QXhtTzlKY29aczJI?=
 =?utf-8?B?bkk5SWV6RkYvOUNMNFk1aUZzQ0ZoNVhGZ1NLTkgySE1ncVVtRzhnSmtYQ1Ev?=
 =?utf-8?B?Q0JtZEtGZ3N5bDJZTXhueGdHUkdiNzNpSkJEbE9BZVo3cE1LdERvNjc2NGpT?=
 =?utf-8?B?ZVVyWFZ4ajJFb1c1VDIrZkF3cUJPenpCeFlzR1RIOHcyVFJYZ0ovVWdGWW9i?=
 =?utf-8?Q?q0+e/bBZ/Ccz60PIW96A63jEm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95b4b005-e3e0-4cea-5844-08db24a8ff30
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 16:27:25.9552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cUUrjpqzIYtcdcLJbFDScgZhd4nzFCYjdN3nZsPGB5WBZsoyKCVeqr8SNdxsuYjBqC0DYPFgujOS/iWMqMaFcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6906

On 12.03.2023 08:54, Huang Rui wrote:
> From: Chen Jiqian <Jiqian.Chen@amd.com>
> 
> PVH is also hvm type domain, but PVH hasn't X86_EMU_USE_PIRQ
> flag. So, when dom0 is PVH and call PHYSDEVOP_map_pirq, it
> will fail at check has_pirq();
> 
> Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>

Please see b96b50004804 ("x86: remove XENFEAT_hvm_pirqs for PVHv2 guests"),
which clearly says that these sub-ops shouldn't be used by PVH domains.
Plus if you're after just one sub-op (assuming that indeed needs making
available for a yet to be supplied reason), why ...

> --- a/xen/arch/x86/hvm/hypercall.c
> +++ b/xen/arch/x86/hvm/hypercall.c
> @@ -89,8 +89,6 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>      case PHYSDEVOP_eoi:
>      case PHYSDEVOP_irq_status_query:
>      case PHYSDEVOP_get_free_pirq:
> -        if ( !has_pirq(currd) )
> -            return -ENOSYS;
>          break;

... do you enable several more by simply dropping code altogether?

Jan

