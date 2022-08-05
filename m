Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E85C58A6F9
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 09:23:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380854.615265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJrgK-0005Cc-7H; Fri, 05 Aug 2022 07:23:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380854.615265; Fri, 05 Aug 2022 07:23:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJrgK-0005AN-4a; Fri, 05 Aug 2022 07:23:40 +0000
Received: by outflank-mailman (input) for mailman id 380854;
 Fri, 05 Aug 2022 07:23:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s4Nu=YJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJrgI-0005AH-Os
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 07:23:38 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140043.outbound.protection.outlook.com [40.107.14.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85664b08-148f-11ed-924f-1f966e50362f;
 Fri, 05 Aug 2022 09:23:37 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB6383.eurprd04.prod.outlook.com (2603:10a6:803:11b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Fri, 5 Aug
 2022 07:23:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b%3]) with mapi id 15.20.5504.015; Fri, 5 Aug 2022
 07:23:35 +0000
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
X-Inumbo-ID: 85664b08-148f-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SW+xUOiM2IA9oOViiqE1XayNT1M9ZeK1i8olmhGE2qhuoDlF5pGtIBaFbJCXSDslpV1IgCoyTfMDZ8VTbGQvaJ3+FCsRocUze6K5Sld896bj+PgPd5d3SuvXa5TWENhcRRA53UMavK595OO7BLGCdHT5tL8QRYq01S/1nicLVr5kb/CwJDnnHmooFmyhNHP4cBFYbuPFFM9qNMVEdUYiGOzjmjmfkpDb67EplRZwlDaqsLiqZ9UmsX41EGFuge6t27FGAS3gDTbHgCLCCed75mXkko7UR1bIucLxwHsfmDxJAdh5uppFaJAKdgefe4BpbB7g4Bkq/xQlnUhtsEdxcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jD3Z5U7ynBWJinUPIyLJ7Q4mDxOQ7+sfhFNLejLCdRY=;
 b=W/Ll0QD36tH/sgMKtLhufKoqzvOihWo2N/orz1Axi2vZ3Jg9YItX8NvyGlupLTRZT4vbSo+S27n75oJmmAeMoB/5argwGsf4QmZA7iOtGFnqFzZt7QtxsaW2UFRfMFhmS2+6IesjCmn2L7/OYwWU6GNTj/iYGLiHnsS+lo5cY4i/kDju2KIcKt0gslcf9etNKQdKXrczYmmJTpdszF4uSI7TtZKyzWr1vOjpE94LO3hMnY11KUpWyqebXiGYx7cnNC+JTKQ0ThZdfM91JJp5rNyxkP9vSsGRexwPN9eykpmmp9tucGjCCRfReBTr2s4cGDTBIgoktL0nQp9y371WGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jD3Z5U7ynBWJinUPIyLJ7Q4mDxOQ7+sfhFNLejLCdRY=;
 b=TyudlxkiS5lcTLkNbx8o7bmR4quZr7SkTLCxvOOjMRWBTS0q4CCF2Zk3ur5ODDU1XEaWo9zb6qBEr14VQ7dF3cCv43wCuK1pvEWOPbOo4MKiyiZwyvJEJ5udKh1GaBqWnHYTYSVHw9WLNePSc0gJx8XZUESyFQTA9IxwHy+Q2cpKGqX3TayURLARHlnbkkJHZAuA3D+X/rewI6OvOgLey0/PFt+Vns34fU+/QJtL6RmpVSozKfdH/wjcX57TMQbgXm08hEhnt7I4G8dy/BL6JXISKtg08nkDymcbvqSa9f3mFKvknoXuj9oYPSoDHeOtg427wfnlaiJZw37OOcAEmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <04256d0a-79a1-56f4-d092-de78f629c7f6@suse.com>
Date: Fri, 5 Aug 2022 09:23:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 01/10] drivers/char: Add support for USB3 DbC debugger
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
 <e2e536b4b3d6ef417efbc399842b58aa420c1e3f.1658804819.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e2e536b4b3d6ef417efbc399842b58aa420c1e3f.1658804819.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f53bc70-87f7-4bdd-bc74-08da76b36883
X-MS-TrafficTypeDiagnostic: VE1PR04MB6383:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OFKEUbdceh96Mqfz3gmiysPKrglhiuJs+omwwcCs5n2zqYN8HOO3+oGSF2HO4OAiJH/S7ucb+8Vuh2MnD1PoOZm4A8H/0AKBYYTR8nw+TfitSngkdeEa/6BSuUpSMCLrOVZaP31d/fPmpN7Mx4Rd8BpKJ0JEHo0FjtWg8O/X7mahGFM0tR+rN720RuCaMKgTczXArWn00dIJs/1cDrYScLK6rPgRforlOwzC4t1vB77+hR/63+VBHa8pKBZWgWt3BcJR92fZk4REyzHuUmuXcypNIoTTcB1uqtttn3Pmhh6UBgv+kEXmbH8U6i/OKFmXGsC44u/khfX5ny29ZfM8Z157JRzbgI1qN6Vo4A7+FpeR/UfjejygMNf6ApIE0Hn2AxK2iHQTvfXUJq0tP5SOFhaPBmodjpyRa9ifG5soYtsNp4xgvHdqUxSyKUg764XIFqxKZ/7bysBCQWO3k7IJHlr0YmcrtErxCA5ZYeVJ1b/LeDqDD4ueRHOKAqdJ8HAk0VzGkUgs4D6V6nxaptmsrAqU3jfuuArlMAoltgdgSYsGKJD2iZu+zgIDyAeBbu36VxqqdwX8juZp5di3XLRQZlAUUrITALfZk3KsRPUd7ul3/Ue2rVuSR7ovIdQfHCSZDU0akr5PgC7H+YN806AmX7haR7QkzdehXuLZWW1ssEHlAl/+5f7rg7oMRdihEs3Maxe1BEaTmtuxbQN3ZB8pdlo2PQSWcaNN8tdX+qmuOjhnVaA7HASWu4ZYSx4FWq7no0AcJKYxUaYY9aVXMD6srU6sCkGdYiLjt9fCLQoND6vGGdK6ejjBShzeqxv3cnJwuX06EMruFK6Wxp2PjWI6Pw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(39860400002)(396003)(376002)(346002)(186003)(36756003)(2616005)(66946007)(54906003)(31686004)(66556008)(8676002)(66476007)(8936002)(4326008)(6916009)(41300700001)(86362001)(31696002)(5660300002)(316002)(2906002)(6486002)(38100700002)(6512007)(53546011)(478600001)(6506007)(6666004)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWNPaFowUmZtYnpYbmlac2JhcUtZMHFiNS9waHBzOWxKOUY0U25LTFdmelVH?=
 =?utf-8?B?Ym1IZUlnRXZHU21uNHpJZDZYellFbTBXaGpoRTUvZ3BBajZxSUVISmxRM1FU?=
 =?utf-8?B?ZVE2R0hDeit5OEFaTnpZZ3dPNjFGdFVVd1o2Y2E5d09lR2RQbEd0blIrQmNa?=
 =?utf-8?B?aUFtUndrK2cvemFyaDhBcjZ0TTNBZlRMQ0JlZmk3NzFBclUvL0dtWnliMGUy?=
 =?utf-8?B?TkxQenVHVERGcFVKR3BjUEhFbjZQdHlabzFyeldkM1d0WWs4a3hXSi9kcHo0?=
 =?utf-8?B?aStHaGFNRm1JeVowM3lsUkkzK1hpWDhHd3hrZE1PWWJXZ2loZDJSV1lwZlRu?=
 =?utf-8?B?bUprWmFRQzZjc1JBTzgzWmFtZzJwcmJGekRjdU8wUmZqWGVmQ2Q4aWRiRHY4?=
 =?utf-8?B?eDVkTDV2WjFQZUdrLzVodWxPZHY4SXE1KytHOGtjRG5HVHlmZ2tzNjVkc3pv?=
 =?utf-8?B?M051MFlFOU5TM01KWFBTWEdTaE1vR2V4Vi9kSmpkTkd0N3IvUThLeGVxZndL?=
 =?utf-8?B?QkJRQStJVVI5Q3JIaUFndXRLRXMybTRsbHVrOE9uRDR3R2ZvcmZVSThEVitY?=
 =?utf-8?B?TExzNmFxU0htakZhNVZnelpnNmI2SHVYeE5TTDduaDBxL0phYi9tQnFVZmNS?=
 =?utf-8?B?UzhuVlhUaTk0eG9OVFplV3ArNk9mMVZIbEExL0sxKzhvSHA5SVNjbDQ4ODRy?=
 =?utf-8?B?NHpWUmN1QitzWWwyWnpScUFWMndvZTJKSi9pZlNkSW9vSVowZERtYmhYWktR?=
 =?utf-8?B?Zk1Vb0pTRVJWL0lvOGNBL2VKd1ZZdlE1cXEydGEwZDd6K3RrWDI3TW1VZ1NN?=
 =?utf-8?B?RXI1T3JZaTY1UVo3NFo5WWNsTzFjUkpkVmVkVlU4ZWJ3NDY2WGNWdjFEZnJk?=
 =?utf-8?B?THNIU0F2TFd2OVZqTnY4MldraG1wL3dramI1V3hnT3dDMlJVdUNkK0pKcE9C?=
 =?utf-8?B?N3FTWEJZSmoyYnJsRkt1WHl6bkE1c1Q0UmJQelNYNmlKM1NBZUtqNkMvbzlX?=
 =?utf-8?B?K1Yyb09MRldGYWN6WnRyL0EvL3dZblNQYlIzY2d1QkNua0JrVXBjNGkxaVFT?=
 =?utf-8?B?TmFnVE50dmJ1VUt0cGRTcmp0cnZLYStMa1JDVWJycG1PWXFCSnBwTkM3U3FS?=
 =?utf-8?B?Q2E3TlB3WWRPTmRhRHhFN2QzSVFhOVZlUW5DNnZWODZpc3IyNjdvbVpyYU9y?=
 =?utf-8?B?dXh2SUM3U0dadXFSOVlZTlppZ2ZUODNuZXpJQ21CREdRK1FnS0FRQlMvbnNH?=
 =?utf-8?B?RTg5K2J3WnhrSWc4ZWJqL3VQMVdqeHVsNWVyMFUvRW1WVGgxNEFxNWNRZkVZ?=
 =?utf-8?B?RkJRaXE2TjZsQkVTdjQ3b3NzRGN2bmRtdXRrdFh4ZEhVa3RVZlRBbkhtWkE3?=
 =?utf-8?B?YTVsM2dVb1VESi9SNDZsNjQ4ZUlXZVFJcC9rbTZad3hMT1lkMGhPbmdGczdu?=
 =?utf-8?B?MjVXcm5EalZERnJzdkxKSWJSeFRaTFZGaGVFTzFaOGxsQXc5UmVmYkp3a2Vh?=
 =?utf-8?B?K25QdkwyYjN4bWlaYkNmczRJMTZPMk9ZVlpoZ2RLdHlRK0RkaXB0YSs4Q1ZK?=
 =?utf-8?B?bnlqd1ljNEVsR0huVEl6YSs1K1B4aVFnUDNMYm9CdVZvRjdxTWJoajNrdHUr?=
 =?utf-8?B?U0hzQ3RySzRTUUtrVTBmczRvVGtRdXBpZi9jMlZyUm12Mmt2ZmNaZEtwaFNq?=
 =?utf-8?B?SmpOMEl1SWlYNTQ2WGdQTU0rMVI1azU2ckU1K245MkxycVFnWFRLUVpWZ3Zx?=
 =?utf-8?B?VXhUbUUvbHE4MzFJVlg1emlRRVJIM1c0akpTTkp6VExEN3hjRTNmNHRsSU1V?=
 =?utf-8?B?MmpJaDUwSktQUG1uKzYvb3lHbGJzSnRrOERWSCt6TDNZRWMzS1FaNFJBenhC?=
 =?utf-8?B?VUNBMWZubHhNWjZhdEI3MEUzWTltdkRaZDBKNU1SMkZxWU9uTHp6QzZTaVRS?=
 =?utf-8?B?azNocjBielovR2pYU1dFcWNRMTJZWi9abkNnaE1rZTJUQy9mT2FhUEJOaERF?=
 =?utf-8?B?MGdlSDFCUjNyL0MxdjNrd29zRWlDT3FKTzF3SDdLeWpva280RUxsZnN2QjB3?=
 =?utf-8?B?bGNGbThIMjNIQ3k0MEZnRHlLenNxZTAvUkJDV3huemozak9uYVZFMUJEN0Zy?=
 =?utf-8?Q?CAqwhHITguNXyfdpS1Yho8Djk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f53bc70-87f7-4bdd-bc74-08da76b36883
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 07:23:35.3377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9hc3NMpFiQ2uv+IK7K8CPjW8BJLwRN93m8rTr+Q4Kdcyk2m/4/rblLREUvuX7YFhIhag+7mR/LDYNGEJ9tvpuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6383

On 26.07.2022 05:23, Marek Marczykowski-Górecki wrote:
> +static uint64_t dbc_work_ring_size(const struct dbc_work_ring *ring)
> +{
> +    if ( ring->enq >= ring->deq )
> +        return ring->enq - ring->deq;
> +
> +    return DBC_WORK_RING_CAP - ring->deq + ring->enq;
> +}

Doesn't unsigned int suffice as a return type here?

> +static int64_t dbc_push_work(struct dbc *dbc, struct dbc_work_ring *ring,
> +                             const char *buf, unsigned int len)
> +{
> +    unsigned int i = 0;
> +    unsigned int end, start = ring->enq;
> +
> +    while ( !dbc_work_ring_full(ring) && i < len )
> +    {
> +        ring->buf[ring->enq] = buf[i++];
> +        ring->enq = (ring->enq + 1) & (DBC_WORK_RING_CAP - 1);
> +    }
> +
> +    end = ring->enq;
> +
> +    if ( end > start )
> +        cache_flush(&ring->buf[start], end - start);
> +    else if ( i > 0 )
> +    {
> +        cache_flush(&ring->buf[start], DBC_WORK_RING_CAP - start);
> +        cache_flush(&ring->buf[0], end);
> +    }
> +
> +    return i;
> +}

The function's return type is int64_t but the sole return statement
hands back an unsigned int - what's the deal here?

> +static struct xhci_trb evt_trb[DBC_TRB_RING_CAP];
> +static struct xhci_trb out_trb[DBC_TRB_RING_CAP];
> +static struct xhci_trb in_trb[DBC_TRB_RING_CAP];
> +static struct xhci_erst_segment erst __aligned(64);
> +static struct xhci_dbc_ctx ctx __aligned(64);
> +static uint8_t out_wrk_buf[DBC_WORK_RING_CAP] __aligned(DBC_PAGE_SIZE);

I've been trying to identify the reason for the alignment here,
compared to the other buffers which are no longer page-aligned. I
haven't even been able to locate the place where the address of
this buffer is actually written to hardware; all I could find was
the respective virt_to_maddr(). Could you please point me at that?

Jan

