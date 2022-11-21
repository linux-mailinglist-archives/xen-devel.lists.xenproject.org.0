Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1F3632280
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 13:43:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446602.702260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox67f-0006wn-0I; Mon, 21 Nov 2022 12:42:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446602.702260; Mon, 21 Nov 2022 12:42:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox67e-0006un-TZ; Mon, 21 Nov 2022 12:42:02 +0000
Received: by outflank-mailman (input) for mailman id 446602;
 Mon, 21 Nov 2022 12:42:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8l2o=3V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ox67c-0006ug-LU
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 12:42:00 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2060e.outbound.protection.outlook.com
 [2a01:111:f400:fe12::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3a0648d-6999-11ed-91b6-6bf2151ebd3b;
 Mon, 21 Nov 2022 13:41:59 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8526.eurprd04.prod.outlook.com (2603:10a6:102:211::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Mon, 21 Nov
 2022 12:41:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5834.011; Mon, 21 Nov 2022
 12:41:57 +0000
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
X-Inumbo-ID: e3a0648d-6999-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BnDEY7yqNH7Z+nECNdBSEnqJ/o4AZ5M90Lt/AQeyORCk2xClWwmFNZoFKmqU8LmF4k7+V4o4/N5XLz6Yw9T+fWN1BQjaZxlemX5cw1N6Gc1plbNpNohI2CJLRkpd/RGGIL7SGLgZFi3kVJYRM4VzfPWQQR3+r3bMutTAtn5DM1lSRPz+eHwWKBvuZUqWU+oi4oIbQSds/O7TzWCchc375EsfHkLzsnoUcUiHQkM9VF9NQl7rABctcUdu3Loq9VMOUkWQQD0aUB1dM7dlnlV63HrPyW2GHfXDdnLcZWaZTNIOJ/6ZO2GW5nvJCBQbr2VCE55XrmLQzIWdUbTHA/Be3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XEx6ECnOSFnF6BliBWg13i61lRLETnt3SNgJJ4neH6E=;
 b=Ztf1vj7Ae5JylqmgkF4TiYFvJgrkH6F+nuK8kWNOqtZmG/U3sZ5/fqBPoHyGids6RBTq4s9c95r+514emcNIkdSMUx8PiVse9h+9gMQfD2FRw+WmaRE70fEUyd/ToICNXScqlYqR6A9y4l7B9qrSJZh9YES4RGAUzyzNGi81PICwsBaEsQ7N6k4pFH0Vg5BGf5PidBEQWVCw3TD+fR2XUC2Cl2X40w2TKv0OetI6UdYgJQKx37P+QGTqi4Xf8QXniwjdM5QnDI3fn8GHtoX9KBI2fkCWfXQweD3yu75ZIy9VVeDyCYbpuTOdC2QESuvxFE0V91dlPq60DVUYEVfIhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XEx6ECnOSFnF6BliBWg13i61lRLETnt3SNgJJ4neH6E=;
 b=QGUZiK3rF7+cho/mMSmTw6nfyfC+u8pQ20KvvGH6vMoMGKGplQWtUrLL6geP5/VOzBDShNVJ6ZgmNmkMeD7RuOYBtpWp8LVGsjsekZg1sG8+maZtML0jaynboq3D03vQPTvUQVAsv9QhmX7esn0hJjsroyiKjqOmA/6MK/BlVrldGD7E7WdmdhcHGoRUPerzGKc85dA4LjO4vzozAA3ai+SkHrxgO5pFNGLNWEK83/6Fl/A/79YXCazFEEj4w5W62n/0hw5VQOwY39Tnj/HfTqi1GB5sIvGLNuUmFohcDFx+B6EQPfle3QEe1sSJYapuanUGX3rvqYnGmnXAqQgqkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d03dc8b3-4c1f-2db0-4d97-944972dc6e06@suse.com>
Date: Mon, 21 Nov 2022 13:41:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Ping: [PATCH] Argo: don't obtain excess page references
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f9cd7b84-6f51-d797-cd2a-b9c9bc62b0f6@suse.com>
In-Reply-To: <f9cd7b84-6f51-d797-cd2a-b9c9bc62b0f6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8526:EE_
X-MS-Office365-Filtering-Correlation-Id: 99569939-4ce7-4756-e8dd-08dacbbdc69d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ViTtUWdnuDvBsbrY+NYLMDGv2XTnhxRMe1IYOnmbcIpXn85Q6uk3RITPLe9SIOTBDUXzbDph76P23/3aLBdyNt8g+4zpHIPpZnSr2CVyR5N8esVCH+o3E1AQveaXjsFOI2yyKdaEM1UhYTt//Ql5cUirw0fQWkwLyzvKPorbsdWqn2xYZODenKbEe1rpMn2xi/IoxCKm1YpnpuXI5qWEDKxDOCdiFwD56PSltkUhmhNO6e6R41gEVe6TaPnXCaUXi437bsgTPmS+o9zUtwEXqJv4eea7J3cgWYG0QASWoJdLYTXxw1mXVyGEM22truiP5ibzPXmSvNoIs01diiR/CRDNABupk0rc/ZcNrpTjA9U2FxynbnjWfQCYwQ7er8jif7KbHh6m5xAf5K5e/Ckdt2pu9/9Xn3aP71XOP+LKabD1fFh7AompxRYrpxg/oEHhaGygOmWg//y5NwcQTrzdcpkrtZ0oDNBkJy3GpziXILD/4ALOxWK2T5eMg+TIrWzVEGaHpqsNNREDziqXVVu4DlDUPAMQZt1P2kwkr+s3MWqhp3y7FRNiyisit0xewd/aP2HABNA4oGjjqjqnKC5hNc6fZUB3jp9bOhQUUOQa5DZtRQ3BFhgJ7mCrQqaRWRvEbU+vqo9MEFWqIJKJWB/cwF3zTyNUfLJ4Mwpj2SWZjmncMjunVN7s4ZL17JMCDw0WqBnrQ2b8UJVD1ez77mRqStZ7mdFdFeqtyZ/3nzPBHGc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39850400004)(366004)(136003)(396003)(346002)(376002)(451199015)(38100700002)(86362001)(31696002)(6506007)(53546011)(6666004)(316002)(5660300002)(186003)(2616005)(8676002)(6512007)(26005)(66476007)(4326008)(6916009)(478600001)(66946007)(6486002)(83380400001)(66556008)(8936002)(2906002)(41300700001)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUcxU3B1Y1ExUi9LdzJYYmtZaU0rSVFUbHZPUDR5b01OeHZROUU4alhIclY3?=
 =?utf-8?B?NlNvb2RqTjlJdUN4dS81TGZhcTErZTlOcCs1TWk5TmMwN2dNREpvMGZwcmhJ?=
 =?utf-8?B?ZXlwdWQzaXdGbEl6akRla0R6UXpBT0gvYndaQXpNSkt6amNUVERiWW9JYTNx?=
 =?utf-8?B?NFFpQXdRYTZJelAxd204R25vSEFpbVIvaFd3OCtvU2xYRVB1byt4VHg0SS83?=
 =?utf-8?B?K2ZXUzJFbDV5Vzg5RGtVV3dnZHRZbDBqVGpPN09aVzljcFJldUNvVkluTzl6?=
 =?utf-8?B?TDA5SEVNUmhEWTQ1UmwrQ2FwOWdSamd5SCtET3BJT2x0TlFReHl3Mk5yNVd3?=
 =?utf-8?B?LzJSUGtJZCthZVRPbUtodE1UQTh3bnZGSFdHR0NnR0w2K0x4QUllNEEyQ3Y0?=
 =?utf-8?B?UkpXb0Fqb1pURk1DeWNlZWdqdnExdTFjYXgvSTFRalJKbWFYZkg4MDhNVHJm?=
 =?utf-8?B?SUFMQ2tjTWY4UnIzaUJNd1pYZjQ2Vldwb2VYNXNtcFdObUVwZzd5Y0pxZ2lT?=
 =?utf-8?B?OWhJOEJoRWorT0dBbDh6NEhpenNYa2U1dzdsNDFlekc2czEwWll6dldNREwv?=
 =?utf-8?B?NS9uMnQ0K3pEU0FPRDB5OGRWSkJDaHR1RFY0b25uYWZOVlRPcEd2eVdEVktj?=
 =?utf-8?B?NGN5YVFoUDh1Y2s4R2NuUzVKc29IMkNOTHF0UTdyMytoc1VhQTJERUZVSlN2?=
 =?utf-8?B?NFZONjY5NnBoOW5yTTBkYjA4OGE0VmYvNVZseEdtSnUxOHYvZ0IzbXZOT2xF?=
 =?utf-8?B?K2lBalNBTHFQMndURGV0V25IOVZlaXljTjQrcC94RFVnUW9COUdsVG9SUi9n?=
 =?utf-8?B?VitsMjgwRjNnY1pDL2RsNmpwZnB3aG51TENzcHVsd0RVWm10WmZmUGlIOEVI?=
 =?utf-8?B?RkpKVTEzYmhjZDdaTUpNZjl2TXJ0cFYwNmdkNkhUaGNRMVVBTFBXZkVENHNZ?=
 =?utf-8?B?bjN5ekx3VGQvRDd3b0l1Zmh1Tm1jNUcrVFdUS3NIb0RPd01pZXJ4Tm8yNUMw?=
 =?utf-8?B?Zk94amJaemY0VmlGRnNIelVSUHdLamZxTTNaankwWmcxVzdyZGh2T1dpUlF5?=
 =?utf-8?B?QUJjV2U2bzF6WUJwaFRCVFpUYnpmcVY0cE9McWEzenNhL29Eajg5K1pXTVky?=
 =?utf-8?B?UDNzN0pmaEtwV21DQWVPdWY0eFZiMWNtL2VKT3JxUnNQR2xpU0pMWlpOaWFT?=
 =?utf-8?B?VGVGQldVN2ErYWhLeWsvQXJZcHdoalVJeG9paWpyU0J6NFhlS2JoNDdSdEJT?=
 =?utf-8?B?VzJKN3l4eGhxUHFrT3d3bEdqL1M3b0RDS1lHQ0JZOWc5RGIzbmJ2WkVSaXpn?=
 =?utf-8?B?eDFMZlVOaVBYcmJQM2hHZitZL09YNnZMczFESkl1Y1hhZHA0bndkc0Q1cFR5?=
 =?utf-8?B?aXhIMVlVdmcvbTZkVlpYQkVHOFVGZXN1U0JpdUU1SnlYckQxdExwd2VzSXNP?=
 =?utf-8?B?dENuRXM2VklwWjJzcGhZYUg5SE03YzRWdHErYnA3Tk5IdnV1S2xKWjRIZkZs?=
 =?utf-8?B?U0ZGYmhYb3FlYU5QTzZ6aTM1S0pvVDY1NjlmY00vSzMvQkIydWhkNFVGd1BO?=
 =?utf-8?B?MVlzSG1oT0srMGg3Y2Zaa3krYnoxc1VPZ3dZUUZxRHdtandsc1ZoSjBaSUU2?=
 =?utf-8?B?eVg1V3lSNTFUQnBaaEdoNFhhVEFZdTB4S1dFMjJtdUxIS0dXOEpCc2JIT1Nh?=
 =?utf-8?B?MDgyeHVySXBPaXdTRUpGTDVOQ3BsWWhLM2ZJQ1lKbzMzTUh2VjNjTU5oM1g3?=
 =?utf-8?B?cGxaeDk1NlVMQWx4dzZML25PZVp3Z0lZNXEyczNkT3l3SU1meGFBZWxjTGE1?=
 =?utf-8?B?QVdSTXFjcGJkUDVzMi9PM1dhZUFjZVV1ZnNESElFUjczWHZzNENsanZMbERV?=
 =?utf-8?B?eVFiMlArTU1waGNLa1F3WjBRaGVvUTBOQWxEa3o1dDFuZlJFUTNQWmFneW9s?=
 =?utf-8?B?bnpTY3FOK2Z5bmJCSU1JaWliR2c2eXNmMXRSZEprU010Wi83R04yR2VURHZo?=
 =?utf-8?B?WUQrVTVkSGJRdE80V0JHT0FnNm01ODVMNk5IOVZKMGlGU1h2VENlSWdLYzRV?=
 =?utf-8?B?TEcrWVBGTjg5U0dqWU8wZEREbFdGcW1rQWdyVlJSZnJsajNEYlJrSHdBUis3?=
 =?utf-8?Q?U4xlXJj6wxtkfevrNCbXGmWFF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99569939-4ce7-4756-e8dd-08dacbbdc69d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 12:41:56.9091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Gr3xuB28CycJLFIA1Vx3XimdBlHXCJ2grh32vV5mAdfzMLFUBQAbE6yHEBEJbNENbX4fZ14GBJRiQ0cKE3a4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8526

On 11.10.2022 11:28, Jan Beulich wrote:
> find_ring_mfn() already holds a page reference when trying to obtain a
> writable type reference. We shouldn't make assumptions on the general
> reference count limit being effectively "infinity". Obtain merely a type
> ref, re-using the general ref by only dropping the previously acquired
> one in the case of an error.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Ping?

> ---
> I further question the log-dirty check there: The present P2M type of a
> page doesn't really matter for writing to the page (plus it's stale by
> the time it is looked at). Instead I think every write to such a page
> needs to be accompanied by a call to paging_mark_dirty().
> 
> --- a/xen/common/argo.c
> +++ b/xen/common/argo.c
> @@ -1429,10 +1429,11 @@ find_ring_mfn(struct domain *d, gfn_t gf
>          ret = -EAGAIN;
>  #endif
>      else if ( (p2mt != p2m_ram_rw) ||
> -              !get_page_and_type(page, d, PGT_writable_page) )
> +              !get_page_type(page, PGT_writable_page) )
>          ret = -EINVAL;
>  
> -    put_page(page);
> +    if ( unlikely(ret) )
> +        put_page(page);
>  
>      return ret;
>  }
> 


