Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D205968BD72
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 14:02:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490400.759072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP18c-00027G-7Y; Mon, 06 Feb 2023 13:02:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490400.759072; Mon, 06 Feb 2023 13:02:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP18c-00024b-3W; Mon, 06 Feb 2023 13:02:26 +0000
Received: by outflank-mailman (input) for mailman id 490400;
 Mon, 06 Feb 2023 13:02:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pP18a-00024O-IJ
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 13:02:24 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e5a0338-a61e-11ed-933c-83870f6b2ba8;
 Mon, 06 Feb 2023 14:02:22 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9323.eurprd04.prod.outlook.com (2603:10a6:10:356::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.28; Mon, 6 Feb
 2023 13:02:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%6]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 13:02:19 +0000
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
X-Inumbo-ID: 7e5a0338-a61e-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qu6ZSQsBEKp+EiIjdo9Mnl/MhAbKJjGeYu7MLb6Rx7hUmY+9aC0bhoHPByczr4CWio4Ek7pOG7qjdM2mDjmHtTolP+2e9uZSaeLJCS7+0KmkL5m77uOZPWyI9/QKxIk2SpLEht3B2GCgGq+8vQUnaGgcgP86GAsSTsW/oOGYigmfaIw1KQp87NMkDM9kMgmiEL8fyUc3QV6JhbtvCQ5Y6mK1ifAJbt4Lk4VECGu7UqPZlffYj6KJwHdn2y7VuRtflpxk5TCVTf0XSMUKULkgojIW4WDg7klRPyTwGqrSTCv3DgcRE9tgZOcupXW0I2K+Fy/ew8l1MxgArk7UDznc9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P2rO2sJBZZ6PuZXWDQhs/j0995OZMo+nliHBXPSk+Ks=;
 b=BTzmVA0dlXA89YrEH40amRc8ta6buWNWY6M/vZps147z1hJANIxGN6U8A2OcM9LwbeAYsyzVtb3sORE/RgLanKFxHdPnFaAMHx3BR5d3arRvBtt71R2tCKNdh0GusM5YzkCfSVHidd3mLXY3+YNbCdNR556tb7Q7bStPhPZMx1QiflW/Jm8AppxYt8vk4OsVwEfCafAaiEpXovdrTrxxXGWWuB00e183gtA6+GXpIzMKnn4Rl0Vx7N2cnxL3ODu6d+ihlWSyZ//WpvZXO5SfGWtWqo2xDG0RSA8me24RLegd5AEyA16hrygpDIurEUjYZmJYYiTTMQINjWT6T786/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P2rO2sJBZZ6PuZXWDQhs/j0995OZMo+nliHBXPSk+Ks=;
 b=UuA+YshOF3ywpMEO/wPy2Chjzdvajewc2AaXeg8jgQELemgbobIi+5wOKJtoKBkE4FDPSM6+M7KoV/oWmKflEaCMdBdI5+hXKFhG3DpoGRxJv4XN6fEsPFefN54FCAI8ZzyfBCmVM7tJ2t45UIWorYArjf+X6UStzSMr3FWimq1Gmdyvhwi8dhWYWjHyyIH6IlyFBUTKvJNy+QX9/vUwvCxTKHmJumXa0QUrOrXpyEyq19dHBbub4WeZqaeraFifJRRZVUR5iquHl2AfSsqBXXAYHUChpYr2A7wnyjW44wA8YK3O2hK2LqYK1b9i/EiVeMuPq7Ir006Zjso01yRgCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <610daf0b-8325-ca2b-3c3c-d89338945710@suse.com>
Date: Mon, 6 Feb 2023 14:02:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] x86/hygon: do not include asm/hvm/support.h when not
 used
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230206124251.911744-1-burzalodowa@gmail.com>
 <20230206124251.911744-3-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230206124251.911744-3-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9323:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f53b7e6-28ac-44ae-02c4-08db0842611a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vCoQi3x9aTycYUtBUou3o6Myv6smHRDTc7116Wg8dDPjNxb6ZMXhkDTAUWdgEXZ9fhxazN10TFkK6yPe35+UMONDVCCdtg0xbTy2c3b0z2v1SRWfUoiJ2awIBDJSsXJiGEKBGs/NVMtNHoblSpaKgQjAQaz463pw8uFZEwt98mbnuEUWAAfn+QztIXk8Qoc3xLxy88npR/+qfaUj5J7VOnLbjKIH5C7JRssSEpJKmLIpJEVSh7YF459kXJkZsaiWSz9yazh4qEOm9TDZAp2HnYBRNlj7Qk+RRKvWyXGsCEl2UJmKD1aPwiDRf/jt/4hHw4j371IOGrRmf9tmo+LJbElsxCcCBCxzjZJzesTZ/K2PAOzWrCX7yGiESnb0ZH6hBYQBOuQTq1Tsybywk1gPFeJIOnIXI2z9dBwC8dV6/tA8bnHIsdoBZDGmp2Xy02Xe6UICqFfPlZq+ZKee7SzBc3ZrcWI8QZ2afR6lux/4H+MJSFSDQOu9nCPQM86+XyxbfMoIorsPMdN8ZSKyvgudS3htxvMYffZHNPXXy3A6QuOtTvX0TZC2z/6qB0GzJJ6aBEtcqUWUy3ol44fQXQ456nUyczaN5cPlfbOq11HTOzyYj06vd5E2TIyBWmzjhcOfkVL0uKUtn/XHF0t20qjgNYiSC1TQF1uyaB0qQH03xoWYpNel+QULIeGJVkMFMbZYCBzxn3lqHl5foDzFVJQ+gJehND2AekQjzHt4pXAXTV0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(136003)(366004)(346002)(39860400002)(376002)(451199018)(6512007)(186003)(26005)(31686004)(4744005)(6506007)(38100700002)(5660300002)(36756003)(53546011)(8936002)(54906003)(2906002)(2616005)(66556008)(6486002)(316002)(66476007)(478600001)(41300700001)(31696002)(86362001)(83380400001)(66946007)(4326008)(6916009)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDFlZHd0RGhNTzhNRDNUTUxKQVk5Mk1UelFWRUNyalAzZ0dIejRlMms2djFq?=
 =?utf-8?B?M2NmaVZKejZOeXhmMmNUT1VZbDl5UXBwNjRoTCt3NmNTNnVObUlqMm8xUE9S?=
 =?utf-8?B?QWJHRFEyUm9UVXZ3Qm4zV0RwNXRvWWJNOE4vcVVLbGZBL0R1Z1BPZmdxN3RZ?=
 =?utf-8?B?VllwMktqbWFpQUlsS2tCMkEwNEhoYUJkWWh6TC90OXZSWjJiaDZrWEpiWDY4?=
 =?utf-8?B?SzVUSncyTVdJZG5KUXRQcVoxeTdFL0wwbXFsK0RWYUpoT2RreGw2cXJYYm16?=
 =?utf-8?B?VDBZWFJHREYwVGNqWHZLRHJKM2J5Tkl0bjFsV0Q0b1BUL1AydndJS1RpcDdx?=
 =?utf-8?B?aGpHYlFRSEFUY3F6c29LZGRjVUFGTVRsR2R1S0NJYm9Ib0N0L0cxWnJvdi9K?=
 =?utf-8?B?Nkc0UTVlRnVQdHppWWNGR0NZNFN3c0Jrdm1nSFZQWElHZjVNYXFiVFdPOFpp?=
 =?utf-8?B?bk9LL2VrYlZnL3F3SUpvb0tUcTRlcXN2d1FsSmpsWWlUM2dhWjkwUTZiUUFs?=
 =?utf-8?B?NlpUbDByQ0JNamhVRXVjeUwwSUJhUVc5SmFkbVB5cXJMMjdUWkdUNldHMnZp?=
 =?utf-8?B?c0lzS2lHdk85QTFvTUdQRXRnTWpDYU9vMWd5T1ZLVHdzek1ERUora2JQZEdv?=
 =?utf-8?B?T1U2YnBmeGhuQ3h2dXpPb1ZVMlJLc1VGNk8vemdoNWEyUS90c2k5UDc0MkVj?=
 =?utf-8?B?enV1N3ZQcWlxaEZ1NWxQOUxoR1FzMmladmdFWmRFS2F1Ri90UmJiaVppd1pH?=
 =?utf-8?B?czQvQXBwOWdBUGFVa1FFZDJyaTZWZVBZcnJrbmtIN1hmbnBuMGp3dWdpK1V6?=
 =?utf-8?B?RnQrSzRTRHFEM2E1Si9nU3hMZ3p3RE1kSXFKVCtvanVaNzVvb1dnaDd1Q3Ey?=
 =?utf-8?B?Y1piRHd3RTlUckxpZG9GVzgwaXlxaTJETG9JVjNxaTdUeGJJRUlYcjhiQmJC?=
 =?utf-8?B?M1JtTXN6aVVzTTdodVJzb3lFV256cVExQVd6Zk4xQXVxWmEzMGxjeThkeTBz?=
 =?utf-8?B?azFlNGtXRDY1MzR2T05oM1NrNVd3T1RFdTQ0bkNYNE92UHhsbWxoRUZjR1ph?=
 =?utf-8?B?VmpuVS9USHd5amNFNDYrTnV4QnUxdGNzenBvZWIwLzR3WjIzMFhuRjBQRXhm?=
 =?utf-8?B?aFc0VTNndUpXU2diaWVEaHFEVUVwa1RVUDAybDRha3F5VG5TRVNmbkRlWFdu?=
 =?utf-8?B?VFZzTFJjYjVnUTMrZHN3d2tJRUpGVEc5Mmwxa0pnNHNXalM2K2c2a1dmT1RZ?=
 =?utf-8?B?WWh2MWpKa2I0YWNuQlpVQ2orWTJxaC9ZeHJFOHdBaFVhc0lTVlFoOVNHMkFN?=
 =?utf-8?B?ejl5OEt3T1NJYkZNOXRNamdOQk45eHcrQm96ZjBEamdRNFk4Q1Z4eEVxQmFa?=
 =?utf-8?B?MXoveWQ1VFd2azgvSUhZL2NsRHlTd3JkbFZQcDc4eTlraTlPMEpubEFiRkdP?=
 =?utf-8?B?ZmtkZ00xSisxSjlsNWdGeFVLK20wcTc4VzBucXRHUnd3U0JWTU51T1AxbktO?=
 =?utf-8?B?OUVabVJVVjBCdEg3alVzUTMyU2hNZlR6bGRTSGhtYXdzQ3ZTdEpHbmtDNm1T?=
 =?utf-8?B?YzRZcFVLOXhCcElwYkx2aExLWS9ERzFqbTRLbDVKUCt2ZEhYcW0zaHh2YzZE?=
 =?utf-8?B?ZTNuMUpJOVhOMkREN1l6Sk5rcG9YaEZER2lZVk9NOTV5b2FDM2hiWHVEaVJT?=
 =?utf-8?B?VlhDanNCUTNza2lQVys5Yll5OHRMWDJYenZ4ejcyazVJYTFFZWZaOWJDaHl1?=
 =?utf-8?B?OWVyZTVTVlFVVk9lalpJVWl0TVdRZFU3SmNzL01pUXBtYnEyc2hqZGwvVVY4?=
 =?utf-8?B?RUV1Tll5Y2d4ZCtNMTBZb0gvTmlWMkQxdm9uaE1CYVdBc201dERMMy96VlJj?=
 =?utf-8?B?K1hZK0kzazR2Y2pXdWtnb1FHdko2cUtQOVlZZEhLeXoxZE9FbXgxR3RnMFpH?=
 =?utf-8?B?WUorQjduZkRjWm9CR1hacm1lUTZ3Rk1HSGhWc2tmdzZDYWFyOFgzVkx1cVJ0?=
 =?utf-8?B?Rm9VdVdBbmE3NWdoTmNkWmx3S0lIaFVqU3k4ajJiYm54Rit5N291RjhKeVpF?=
 =?utf-8?B?VklEMCtGT0Y5b1BvTHBSMVM0QWJJNlptTFQzZ3VtV1VIekpSdVBEQ2hoUXB4?=
 =?utf-8?Q?ykXNsKt0UAVsW9VEgqrk35dzw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f53b7e6-28ac-44ae-02c4-08db0842611a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 13:02:19.5359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ER6b5iVzOeJO8q3bTebBpBUdeXdE6qNYEluvlWBdAIhK4OzsgUtolPM3bH5MtY3gXZ4ZcgltRuNIMwuOHTU7Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9323

On 06.02.2023 13:42, Xenia Ragiadakou wrote:
> Since none of the declarations and macro definitions in asm/hvm/support.h is
> referred in x86/cpu/hygon.c, remove the unnecessary include.
> 
> To resolve the subsequent build error for implicit declaration of wrmsrl()
> and rdmsrl() triggered in asm/spec_ctrl.h, replace asm/msr-index.h with
> asm/msr.h in asm/spec_ctrl.h's included headers.
> 
> No functional change intended.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



