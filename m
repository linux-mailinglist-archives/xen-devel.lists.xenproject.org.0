Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3C658A831
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 10:38:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380883.615304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJsqb-0005hh-NB; Fri, 05 Aug 2022 08:38:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380883.615304; Fri, 05 Aug 2022 08:38:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJsqb-0005fG-Jf; Fri, 05 Aug 2022 08:38:21 +0000
Received: by outflank-mailman (input) for mailman id 380883;
 Fri, 05 Aug 2022 08:38:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s4Nu=YJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJsqa-0005fA-5r
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 08:38:20 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130075.outbound.protection.outlook.com [40.107.13.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f430ac65-1499-11ed-bd2d-47488cf2e6aa;
 Fri, 05 Aug 2022 10:38:19 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB5055.eurprd04.prod.outlook.com (2603:10a6:803:53::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 5 Aug
 2022 08:38:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b%3]) with mapi id 15.20.5504.015; Fri, 5 Aug 2022
 08:38:15 +0000
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
X-Inumbo-ID: f430ac65-1499-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QbSi3D91bbilJrF/M2db+x05umSiWv3h3R4n0QtQZe/nO/6u2mx1ZXMwfzmOo5Lo57mVSQQ0dRZhx1/XrHs/+LSQU9DEr+0vJ3KD/UoEdcKJs+XRDmRsuNyEtJRULdWQvuPRFHuwOTD4d+DaOd7/pcUPbzPJ+6jd2PGO3C5WAX8tPZobpnOmYVXZJi3E3RaXcJdqmQ2iOeorMS9TwYISG/NxkyP/U7RetWO/xMAHNs395bbCy/At02p4pO1M3dvmp0qtIaRxCXuy8klXDGJ8zr5sLTPJoAf91g/+xXruRxqyxaOSP8TldpUauHQCUpLbpEonIFS/8WeEQp2WEI4Y0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r4ND0QZIjewxiv+g8758lLOJTKHE4z1UIFkmcwn+BxQ=;
 b=H29IT0jrHcpIiiZ6sqJCOVNB4yhP6mxegBnnT3JAMomkvdYfA7g15Z12F3Pv1f3bOFaGSXQ7AkOe11INaEUxKlDdfNmZ+XfG9YiKipx73AJ5nS24HC8I06PSJgGL0twl2ViQr8g3+jIPgVbm/gyHz2BubLwPgCEE9Jbl3+HG1HKKgP4f+NA9G2SDCCAxNCNdWmU3S5pBKNCQI+f44OENel1GMCKjkKvJiKURmj83E8/JHfJ/EZseLNS/HTymVEk7YpwchnQCXYBYOLW45nYxxV5skdelx0ST0soFPVU5P4hWY8zLmPKAzKjRmbhW0Zzb0QmizsQo9Fh29/5yDJef7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r4ND0QZIjewxiv+g8758lLOJTKHE4z1UIFkmcwn+BxQ=;
 b=P45KMOjC1HgQGEeiF/kOamn9fsyzUXdlFcd1n9i2OWuYaplI4seAMGyxtA0Ezyko5ueTxyasTuybR/xEnL4ko1/Yb1zE8+z7eY46yQJ+GbMy57xCwJ9p0bCD7428e0HOsyH1xciUNcGeydDxxVeA67bn2fcu5eRL/vpJduISH5tJlaAeL15Knt2JpcNHPMllUSa3+nSFD5Jvl0xsOb+63XKN2hgnA4LA7mp6pG6L+8SeZaiu5RxkTqhZeihfxqPe6QCPNAG4xnSLMZyD1TjTVm45Bx6MuBs7k6ENo4FQ1MAXH5i0buOFGkMwsojnjaZY3g8PfBWaPN7OoZdl1fZHLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7d263ceb-3727-763b-0b9b-3b9ed82aa780@suse.com>
Date: Fri, 5 Aug 2022 10:38:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 10/10] driver/char: add RX support to the XHCI driver
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
 <e273efdbf75cbc37b5c35798da7fde34877ac3b8.1658804819.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e273efdbf75cbc37b5c35798da7fde34877ac3b8.1658804819.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0082.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4169e65-c29f-41d1-412d-08da76bdd725
X-MS-TrafficTypeDiagnostic: VI1PR04MB5055:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j3G0pIHg96M1Ihjs/gx6L8OMA+kt5DLlOJOxoJc0kT9ERM0sYm4adSQMUZcnScV9lzmH9DvIa0NjZBFmJjEJVK7KUa9F4n8ojMRdEk1fW403/J/ZaT3YiVn4QFXpMjwFWMmP1EolJUKa8QXM0Iny+LvQvaQFXdxKOuf2MtJ9ArpZDwqvOPAqkcoGdlYteopYf10I3oEZ/IJcNSVlScki9Yhlvo6lBtfnrdJRt2RjAHgDQQBBtUMwDwjcQQiLr7J8xhQ2S9OsYvUImZpf/6JQK9ZY3i3CfII9CIH1AtrmHXWhTyTNQg+CVmh/bI4bGnm0tB+NSPqDtZBS8NF+sKGNzWDZB0AjI0/lVgQPEiBz1RVmpVIEY50UDJMc1gRUbqbBsVp7eBleOdGnK9k+m7DOWrm3Z4vESD6dLycALwyCipd1wA5YcEHSr6CcT7k4JbBlsSC2xPkOyPjWBnZBZEbL6qm5exTmhQb3RltzAZwbT+uR8vQh+QlkMYv1LBb0HCo33zTaI1T0Q7+oEc/XE0EIOBz8yaL51h/t+x48M5yA7gy/+4S+bFS1VR/pHVcPo3Bc0m9USbmg4o+VrlmGhAnc6Qj5eY/V62EY+/oWsi+SOBNwCmFReKyZpKQl+LWDz+ZcSvBkXInExOkqdUPtqA7nJtb9NZ6xI/nBO2bOSP/LwDYx42jCXbFObrxL3EZW3hyZHpVLJdC+SbYINeQ1YuIjMaO/LkPnE0DCLMrlQNWRk/UD4lEY9jaKbaM3f490T4Y0Uy6J0nmAbsnQrhMMgEvSt/prAXurX5LGwq5XyWYAJaTqy30peeJTPWZ+x30EFvAXX5GKBaqLyBYjnB+CzwNCHA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(366004)(39860400002)(376002)(136003)(41300700001)(31696002)(86362001)(6512007)(53546011)(6506007)(26005)(38100700002)(66574015)(83380400001)(2616005)(186003)(66946007)(66556008)(66476007)(316002)(8676002)(5660300002)(31686004)(8936002)(2906002)(4326008)(478600001)(6486002)(36756003)(54906003)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEM0N2dvTUozVlVpdXM4MjBMTDIrYnZLc1laQ0t2eWpKRTc5eWluSkQ3cm9h?=
 =?utf-8?B?bFJ4VkhXY09FelB4QzJBMm9TZGtya3Bwamo3N2dMTEdlT1hwNXJudDRFbkZF?=
 =?utf-8?B?M0FybTVuRXBQZ3ErcEo5aHBXbXRGYXB3eHN0MFhqOU1xeC9FdExaZXNXbTh1?=
 =?utf-8?B?ZGJGUDFwdzYvT2ZPbUx1aUg2TkkycjB4N1B2Yk10SWZ1dkhaalhyMXF2bjA5?=
 =?utf-8?B?S3dQRXdPdXl2VzA1U1lvcG93aFhYbGZybVdlM0lkWW1GMjVlUkFtY1BGT2hR?=
 =?utf-8?B?UGlEV3kzSnVBZFZhRVp0eDhNSkFWc1FpWk00b051OWI1a0M4SEJGV2Q5N0g3?=
 =?utf-8?B?WFp0RGhBYWtOTVYzTCtxTkdpYXM3dEpPenh6M2ZUZGZTeVpndEIvcXlvdDJG?=
 =?utf-8?B?ejZSUjZGNURVK1hHd0J5T0N1TjQyK2krbE51dzdmazVJRjFWYkdOMXd5aFBE?=
 =?utf-8?B?RGZjVU51ZUxraWVEWGNpVEhjbGU4NmpQTmFuZWQ4KzcwdmhqcXBsMGh5Y04v?=
 =?utf-8?B?aTlMMkNHZ0hUcWhuVk14M3BNMzlKZjNWSHdvejR6OFlMckE2NUZma3RIZ3o3?=
 =?utf-8?B?cXZwaHoxdnZrNzFod0pOemk3ZmhNSWFya1V1VnBXV2VuM0lJV0ZWTSt6WkpM?=
 =?utf-8?B?Vmc1dTQxQkt1RjFWWVI1aVdEY2NYYkFJUlpsMDM4Wk9zQ1g1SEZsNStlOFhJ?=
 =?utf-8?B?eFhaQ1RmOG1mbUc2RFlFZDZsR1NITThtYnFPL1R5V294emwrVTJ2M3ZaV0E5?=
 =?utf-8?B?RjVrR0x5U3hMbTlJUEhGbjZwVytJY0RuRGxmalJ0Z0tDZ3dHZm40NDlHUXB5?=
 =?utf-8?B?WDR2RzRiYVBFMEZSWGkralh2OTZRbkFEcDliYjFEY0lwUi9obWpNbDRjby9a?=
 =?utf-8?B?YlhJcGZuYUVKMXdHblgzYkxzMVdZaGNrSDVicW15ZXpSK0Y5MzJoRTRNNDMv?=
 =?utf-8?B?Sml3YTkya2hqdmdJQmdYWDZCandzb1BjZHIxSWdhdGhEd0o5NW9pTjVZQVV0?=
 =?utf-8?B?ai9rQVI4dzBQeTJ0UXpyK2lvT1hPVlloTk1FOGp2Nk9NWWlOY0FyT042M3FL?=
 =?utf-8?B?am1BVHRuN1J3UGVWdEQxWjZOczlaNE9TK2lpZU1kVDgycVk5ZWJxeU1DUXdS?=
 =?utf-8?B?bGk2YjhNU1EySHdEUzczMkM0Uis0UVZzb0FzbVNWcURyWmZYYUUxTEs2T1dW?=
 =?utf-8?B?QnYweDY3eENiak56eGZabGFYOGxOQkwrU2NhVmF6OVExMmd4VXhUUDQyNFlJ?=
 =?utf-8?B?OU8rc1FUdHp2OTVGdm9zSkZ4aWpyQzJ5Sjl6WGlzY25qa1dwSjl3b0FuSkFU?=
 =?utf-8?B?NEVzRGNiSmlyUzlBODVFb2w2QzRUTDhvaWlxZDk3cDA3cHZQMXdGVkZFRVNT?=
 =?utf-8?B?Wkl4MUtjNmtsanNmTWNSRzg0bHdxYk5SVWZXaVlpQjNBdGpmdWEwam1Ia04w?=
 =?utf-8?B?YlYzN2FyV0o1dXp0TmpXbVk2RnhRUnNRWVlWVFBtQVVGUnlFUWZHNThTY0I5?=
 =?utf-8?B?UEVWbzA4dWc4SkJ4Sk1mWFJOZzNPeUlLaHNHcGE3WEdOdWRDQVN3OWo3WStI?=
 =?utf-8?B?NktzMWtsTXR3WmhGRExCcUZpeHBIejg1MUJFNkhvTE5iblhrZWtwTFZJcnhL?=
 =?utf-8?B?eHVCLzdtU0hMbmE3ekhLcXMyQ2ptNFpwY0FkdWtGcC83Q3U3WUZLdTQ1bFZJ?=
 =?utf-8?B?WkQweU0vVm9MelNCVHV1R1htYWhYdFoyWUZsU2ljdzU3WnY5ZUhacmhLdTVU?=
 =?utf-8?B?eWFkUnRTQW5FZk1wM3VicEY5amhaRWNYVk9oS3BjY2RsZmRKdzg0WWpJUHpj?=
 =?utf-8?B?VlNBTUVGQ0VzV0VQMWc3TlU2Z0xwdGxORVRwdUFmdHFJNjNUVWxkQmxOZGhm?=
 =?utf-8?B?K3ZWcENYZ2JmZER4Q3hDaGR4RlF0WjVHNG1FT1Vxb3R5RUNFUHdzbzdHdWJm?=
 =?utf-8?B?WFJIc1dTaEk2Wm5DK293bFZVNGdxTGp0aCtlQklPZCtnWTlKYUl3OCtPWTVB?=
 =?utf-8?B?eFhDZnB1OVp6akRkUG8wZXZ4UVVOdWIxQXQ2VzJJdGI2a1hKRGE1Sjh0MWcw?=
 =?utf-8?B?eUl0bERRRWhYQ2xrQndlSGtJM25JNkVBMTBsYitiL1NVN052ekd6MnNsNFJO?=
 =?utf-8?Q?OJArklKUFxjtqWEh0Inj3y+vK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4169e65-c29f-41d1-412d-08da76bdd725
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 08:38:15.7567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jdKrPxHfpJ+XXUUhTlukB+zaZQolHYa1A5IfD1BWNstM0S3lJTjwHpC2KxFk6xtogRR/0Heagr+1YLgJlRH8Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5055

On 26.07.2022 05:23, Marek Marczykowski-Górecki wrote:
> @@ -440,6 +442,16 @@ static void xhci_trb_norm_set_ioc(struct xhci_trb *trb)
>      trb->ctrl |= 0x20;
>  }
>  
> +static uint64_t xhci_trb_norm_buf(struct xhci_trb *trb)

const please.

> +{
> +    return trb->params;
> +}
> +
> +static uint32_t xhci_trb_norm_len(struct xhci_trb *trb)

And again.

> +{
> +    return trb->status & 0x1FFFF;
> +}
> +
>  /**
>   * Fields for Transfer Event TRBs (see section 6.4.2.1). Note that event
>   * TRBs are read-only from software
> @@ -454,6 +466,12 @@ static uint32_t xhci_trb_tfre_cc(const struct xhci_trb *trb)
>      return trb->status >> 24;
>  }
>  
> +/* Amount of data _not_ transferred */
> +static uint32_t xhci_trb_tfre_len(const struct xhci_trb *trb)
> +{
> +    return trb->status & 0x1FFFF;
> +}

Same as xhci_trb_norm_len()?

> @@ -985,6 +1054,33 @@ static void dbc_flush(struct dbc *dbc, struct xhci_trb_ring *trb,
>  }
>  
>  /**
> + * Ensure DbC has a pending transfer TRB to receive data into.
> + *
> + * @param dbc the dbc to flush
> + * @param trb the ring for the TRBs to transfer
> + * @param wrk the work ring to receive data into
> + */
> +static void dbc_enqueue_in(struct dbc *dbc, struct xhci_trb_ring *trb,
> +                           struct dbc_work_ring *wrk)

I can't seem to be able to spot any use of this function - it being
static, how do things build for you?

> +{
> +    struct dbc_reg *reg = dbc->dbc_reg;
> +    uint32_t db = (readl(&reg->db) & 0xFFFF00FF) | (trb->db << 8);

I think I've seen this constant in earlier patches. Can this be
a #define please, such that one can easily connect all the places
where the same things is meant?

> +
> +    /* Check if there is already queued TRB */
> +    if ( xhci_trb_ring_size(trb) >= 1 )
> +        return;
> +
> +    if ( dbc_work_ring_full(wrk) )
> +        return;

What made me spot the lack of caller are these return statements.
Without letting the caller know of the failure, how would it know
to make another attempt later?

Jan

