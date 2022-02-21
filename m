Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F3F4BDA1D
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 15:15:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276274.472388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM9S2-0004KQ-4B; Mon, 21 Feb 2022 14:14:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276274.472388; Mon, 21 Feb 2022 14:14:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM9S2-0004I2-0t; Mon, 21 Feb 2022 14:14:06 +0000
Received: by outflank-mailman (input) for mailman id 276274;
 Mon, 21 Feb 2022 14:14:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HaM=TE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nM9S0-0004Ht-Cv
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 14:14:04 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84ecd807-9320-11ec-8539-5f4723681683;
 Mon, 21 Feb 2022 15:14:02 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2058.outbound.protection.outlook.com [104.47.10.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-_4TdxAoDMYqexnxTYYPV5g-1; Mon, 21 Feb 2022 15:14:00 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB4162.eurprd04.prod.outlook.com (2603:10a6:208:60::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.27; Mon, 21 Feb
 2022 14:13:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.4995.027; Mon, 21 Feb 2022
 14:13:58 +0000
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
X-Inumbo-ID: 84ecd807-9320-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645452841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zp1I+RrgdDB2yriKTJYhFfVm2mtAsDk+R6DDnfd16UY=;
	b=V5+56WjESCkdn7sXRFW/rWS6EaSLKp1hFo1PUDPWdHT3CoZFRzhNoa8uiUB92jtiXf/R+Y
	ZGLgxedfxHzS+ET3mMUJ7QTfKEgveQB1ijYV+izJyOQci5hSLalwswkWtx2Pa691d4E/K0
	q8GdUF7m8HnYveOb5PUQIviqTAmhXmg=
X-MC-Unique: _4TdxAoDMYqexnxTYYPV5g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iUa7gIiidOQrOMazQIdPUdS2sQYjRzYIi+9aJ1m2SM2arm6YMuKUCPhq1i87SFK2GBBtjFyDdQSuLBJWQSbCO/vhLVodHGP38iPnOCZTZ3msZhhaEZUgQTUb6jZUsJlqE8Y3iFbvzHMHfKECQvcOSGOeiSoiGcJPn9tc8I/tBORi3LXcfYu+uvXceVud6RAnm2PPDkIEx3VIrf40LYS26+bJb6c0B5NYhOclYJXtTaw9hzuxMX09QXEP6HwnaqPGkr10bTVEui2YLvI6GHwGIjwLhCbrxajzFExr/gFPhk6i2qMm5252pRFo2IrBJ5dpRtF8qCzMqiPohHplwL8IgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zp1I+RrgdDB2yriKTJYhFfVm2mtAsDk+R6DDnfd16UY=;
 b=nsfQtQI3DoukJwoZxCALPezp5uUk+iWv1b/3wAP6Yin8L/gn0eGlE5+Bdc2RjF6Xc6+EFNfKUt7Jiw3X1nwWjBe/9MHl7MzfytKdhOGzP7BfCogP4ak3iYWdELUj/n8484jPXeocIL/Vhg10hYTXWyvghxJSazh5883tNXYe6KPYxjDNgzpUwwbWSMb2UGBXOFbNAXy9iSF8WvOJQomdm+uPMiemm97MnH2XTSjiIWE/LsHCogSFiEhZ+rQ9F9o3HRek08osoDYdSNcnZfumiRKlUCg5iR/Ju8cxLKym/IS2KtPhAFysg68nzPen9CnekAMnsjM/bpzPSHwa9YsDTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <311ad8d4-0988-005c-93b7-6e24bda77a8b@suse.com>
Date: Mon, 21 Feb 2022 15:13:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 2/3] xen: Rename asprintf() to xasprintf()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
 <julien@xen.org>, Paul Durrant <paul@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220221100254.13661-1-andrew.cooper3@citrix.com>
 <20220221100254.13661-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220221100254.13661-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0015.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d63e0021-17e4-4ead-5bd7-08d9f54466a6
X-MS-TrafficTypeDiagnostic: AM0PR04MB4162:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB4162FDF1B99B02BF6C77C587B33A9@AM0PR04MB4162.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nwKsuXTw1Tu/XG3BcRZterJnvMai0mI4B87+x+uDu9IUJATx0vM6s6cCuJXcDfwO6nuBNYsK3tlmqDusTwx4gdRm5Hgt8jfdpgxan6Mn0ZFQw3wagm84A7T1DpsJx9G+7zNmMjPMlZ4CiQZNOjId7SWT/1xaY2GiqkJFIpoZhm9wwi/xikJePjHwBwUEsZuYh+pF98iN4tL2q0YpqAbeSnEW/4ze8/Rvc4mBC3oDLwsdScsHimFLVcIsIcLI16xFqzP1UGW1n0JC3USfuztiAnhmB++qA5ZTNEcX59z13Ptr4aVo5RrSt2KbdrBeB5o3NAMIN4r0ovfmPUDlRxxoKL16uyGeIlIx/J4XnuE2UwiUY8OrDPoqKNz0MD94s3fYjzF6iG58ZkliRqsuhy2oyn00cgxuczSBkZVYuWPu5DPEIFyC3Yx8Ww565BLFQ/9I1/G3heKFCu4RRVFD5VVDmCE2p3Et+AEGAa5p9In1iudZbA88gZ+H4juOgWGR65moZxpHO2Niz2pRsoepTNnCKyDvrOFptUmu6WyvO+b+0Cd0ezMSwz9+Vczi7P+4ke3hz6Oom9dTBCQkgg6sPTsCxVkEhChfqeCmN/i3B0anHCUeVRgQpWlp9JRvHn/+I08fiATk/oPsXKJxGZqqtH4ggWhtOLsoWq1dRrDrHTm9Foo3Pq4PoCm13N/I4PHr6dImpi3dv6GDNWXirW32QMTRT0GFVojGx2z8A799DAGhd8c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(6506007)(4326008)(66476007)(36756003)(66556008)(66946007)(186003)(38100700002)(31686004)(53546011)(26005)(6512007)(2906002)(6486002)(508600001)(5660300002)(316002)(2616005)(54906003)(4744005)(31696002)(86362001)(6916009)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djIzcEVmMFM1YWdVMm5HZlVYcTlRMFV1V0xYeWlzcGZxN0lHMjFCa1pTTnJk?=
 =?utf-8?B?eWljaWtSalBMZXl5b0VScTVYZmN4aU04MEtkK3JvV1lzL2poSndjMTRjN0t6?=
 =?utf-8?B?M1VIbVRPUTJMR1VycVBIUDJPNE92QkhGanNaZElhWUpHZjJwMC9UVnVDS29R?=
 =?utf-8?B?V0RWOEp0Q2ErRyt4WDFQZU1ldm9CaGpBaFRyY0lmVHBwNEZuV0lJMG9wNkhU?=
 =?utf-8?B?YXZMYmluNHY4NkhmZ1ZCdjVlWlBlQXgwek04Vm1nZng3U3Y0SDNabncraEhT?=
 =?utf-8?B?L3FrMEY4UFQwaEYzVUZyTWNqaW1oOEgyY1hyWU41ZGVjaEVxc0lJeW13elRv?=
 =?utf-8?B?ZWQ5VGVZOTlSaE9ZSmNEdHN4MG9panpDMFNUbUpYdEcwaGlEU20vdzgzQ2dw?=
 =?utf-8?B?VWdSWGRWdGpFRzJUYU82eE9XOWNVTlRzU29JM1JnQWV3ZGV6S3VKWjlONFZM?=
 =?utf-8?B?S0xNTC9YTzF3UFBvTytaODJ5dko2Y2pWVHZPNzNBWSsvdTBNSmdDcmg1OFJi?=
 =?utf-8?B?bkF5R3FQZlB6NXhMNkpWWjRTc21aUkZYZWNKMyt1a0FwTzBlWGN5N2tvTVlF?=
 =?utf-8?B?VTh3MFVqUUhKUGR1OHY1cGJQOGdMVk9QM1pMcXI4TTV4VWFCY1lhajRGNGJV?=
 =?utf-8?B?YzVvbHNOS0xLTUFHelZiMDU1WEhVOTEvYUI3Y3VLZkpEUVFtaUU2RUtrdGVF?=
 =?utf-8?B?VDdwQWN4Z3QraU1xcnZOU2EvKy9zSDZsblF5YzhPWW5zUHAvQzVCQzh1SmYx?=
 =?utf-8?B?S0JrZ2FLbHJ0Ti9JVzl2WEV0d1Z2dURzSm5SbVRwQXJGRVZLamxPSndHd1R4?=
 =?utf-8?B?WUFQSUtWdXdDMkFOVHBla1h3cjZZdzBaZ01EY0Zac0xLeTF1ajdnSnFzYTBK?=
 =?utf-8?B?aWZIVXVESlZ1M0RUUnJyaFdUckNld3BSRnpHTFZZQmJhc2htVzNObHhlSXlh?=
 =?utf-8?B?SmowQVI0YXNEaWFuTTd1Y2tYNGltc1A1RHNrdk00V1JoekU4NjB0VHVWOW4z?=
 =?utf-8?B?K3dKcW5mVnIyVVAwSENFaGdLZ3RoWE93UHJidWtVRnNjYVRtdEJ5VWZRaWpu?=
 =?utf-8?B?UnVhdlc5cjZUSWlMV2hkdTFlTzNHYmkrWVhGNDRFeFdYQk1SZS9PUEJ1dTht?=
 =?utf-8?B?SVcvNndxNUp0d1JnMng0ZlFueUJTYU9SbDJGYkJBcEVndWxMRzU1aW5pWW1E?=
 =?utf-8?B?VlE2SHFHblVrOEQ0b0RML1lrTWhyZTVJZm5RN2tFNnh2cXcrQkRkK3Y1NWxT?=
 =?utf-8?B?OUY5UHdLWElZNVhSYXhpR3ZSbjRTTXJ2TURmUFV3WUV0UG5sSzJMem8zZW5i?=
 =?utf-8?B?cHZiYU9NZ2tqYkpZME03OUl2UkRpbVdiN1Y5Qyt1VFFmSkFPRXdkNUNuRWFS?=
 =?utf-8?B?TkViZTM0YW5NT043dmNzdFBDNFRNL1ZlR2pXUTBTVmp5emNoa2xXcC9pYTN1?=
 =?utf-8?B?dENkRURxZGFGc2s5U29Ra2RHNGRGaXNHUWdNU01ucjdlcGJDaWgzYS9kNnpa?=
 =?utf-8?B?Mm1talhFdkdTTVArNzh3SDdWc2Urc3pEMVY1cWxIR2JGR1JERTNEcFJzaEpK?=
 =?utf-8?B?MFBWWC9lU1hQRHpQaE9sRURMQ0s0VnBhYzl3SUw1UUJmc3dVcFF2YzJRbEl0?=
 =?utf-8?B?TURhUFdyOFloTUZybFVzb2dxbWxDd0FLVGhSL1ExRDIvUVEzUTVta0NjZWFa?=
 =?utf-8?B?ODJ3Sk0zTFNxRkpDci82U2VyL3FadkxINlJCQVNERWtLbkZlWVQ5U0pVbVlv?=
 =?utf-8?B?YWk5azI5amY2bmdmVHpQMGFqNVR4OHgweHFvTUhNWEdQVzVWY1JsWFRrZ3Nk?=
 =?utf-8?B?OHFEZVpCVmFrY2owMld0TlhXaXhjQld0WlA1UUJoOUJaYTF0MjdaNXdPVEI0?=
 =?utf-8?B?ZzAzalkwb1hBL1l0NjN3eGVhK25DZWV4L3JQNzZuUkV2Yi85b0V4Qk1NNHdq?=
 =?utf-8?B?S05rS3k5eFFXdXN1bUpuWXFucGtvak9Td0tFRTZ0RGNRTXpvV1ZTSWVURjlh?=
 =?utf-8?B?R0N5Y2pVcVlzcUNZc1lyWk0vZVdNcXcxYnFFM0pweEtia3ZIVm9IWXZjWVNG?=
 =?utf-8?B?QTdzTjBNeGFGVHdMMmtHdnY2SnZtRE5IRzZCbHNpLzh5a0JkMXE0L2k5RFEz?=
 =?utf-8?B?WHMvNjY1L0wrWEhuejE0WFFmbFFRb2UyZjlBV1NmN0luRVBLeVlHR255Mzl6?=
 =?utf-8?Q?al8Ow8ItiiP9OMJVLCQNEkg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d63e0021-17e4-4ead-5bd7-08d9f54466a6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 14:13:57.9801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FOqlz6pw3dmN7G9l7cXvuCTSiCW8SMbgWLTjTjx70jnRvZM5dXeVZZ/um07Pck7/mRsCxKIvNURj1s5RUXUwnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4162

On 21.02.2022 11:02, Andrew Cooper wrote:
> Coverity reports that there is a memory leak in
> ioreq_server_alloc_rangesets().  This would be true if Xen's implementation of
> asprintf() had glibc's return semantics, but it doesn't.
> 
> Rename to xasprintf() to reduce confusion for Coverity and other developers.
> 
> While at it, fix style issues.  Rearrange ioreq_server_alloc_rangesets() to
> use a tabulated switch statement, and not to have a trailing space in the
> rangeset name for an unknown range type.
> 
> Coverity-ID: 1472735
> Coverity-ID: 1500265
> Fixes: 780e918a2e54 ("add an implentation of asprintf() for xen")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


