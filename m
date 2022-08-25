Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 214E85A1612
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 17:47:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393502.632501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRF4a-0000FO-7t; Thu, 25 Aug 2022 15:47:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393502.632501; Thu, 25 Aug 2022 15:47:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRF4a-0000DK-3b; Thu, 25 Aug 2022 15:47:12 +0000
Received: by outflank-mailman (input) for mailman id 393502;
 Thu, 25 Aug 2022 15:47:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2f78=Y5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oRF4Z-0008RG-5u
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 15:47:11 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70089.outbound.protection.outlook.com [40.107.7.89])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e275fd1-248d-11ed-9250-1f966e50362f;
 Thu, 25 Aug 2022 17:47:10 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9177.eurprd04.prod.outlook.com (2603:10a6:10:2f4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 15:47:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 15:47:08 +0000
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
X-Inumbo-ID: 2e275fd1-248d-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l9AYSOIvD6NZ1M9gf+i/tOqL7QsRfWl8Iu9yCDwEPp2o6RK5OcZZsN5YpzCuXug3oEv6S8ord8JvLbDJ4VD3v0fPEze2BLfTor7IUTqAx2sUtDiRXK1dcvZtKbSKfotR5wb35trAn4/whc2Yp+6a15Gfh3fWK+DukZSuHiv4YfseNddnklymdKLnEyJZx6btzgOYWmoPmexdTl/KFcXQsGo5p5J+4m9ICJOZcoaH4ZEpTxkHoxN3zWoiuyb5r8B0uJhEEMHhST55fWRKqsqpw9vBCKT92tRs2b85f4ZRCfGdknEwh2hAFJWnZ4cNGFyF3gXj707ME5KsRv6dMQsvLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qp0148i+b4LAtKctqL7Y19z+aFNUs+PjAlvN6SH+0OQ=;
 b=EiKnpfQ8kanRj6xxwyXiYA961lO/grJVJuz8aStoE5lsu1Tm0jA72oKDEkz7JsiGeMQ03pmN1DA5mPdAqsYnyGiGKHwLdXTcKVW0/L7nN/wcwtI+Zhy1mARrILCVd9lG+z2qECr0kisF4s1Uxcds31SvfTEOBxdAp7ltos2T87wjeTVN9ngY4BMgsvgr4jlkpHPNofa7JqKBzl8gVemt1dFKwD0TjjB2tInyan5jtrT1xa1Lo6qt+815AqcKVMbuasGCBdcx9Evu2vmfMZrk/1kU8a1I7lFZQK8EBRjH8jRkeHPa42BZ/r4RjkzkrFYp/cAAvtB3csWVlvN/ucbmrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qp0148i+b4LAtKctqL7Y19z+aFNUs+PjAlvN6SH+0OQ=;
 b=xMEcXPfUIyV9WgFcgtkV1sp3sfESvqmgxtpWrxkFbABvWAZODP2kX+B871fzbh2L15Yso0vkaq4EdpLLAHR6JPJzsIGrCSdPr9qCUa25ncE/YO7ABztrZQ0kvl13gU0ZMLky+nrDd8l4B/hx0KEopxwYFNE2gdPXhFg/+4Ho9mGl+faM8N+44J/Fcr6kbm9QEMr0JgU1IUkUUOLGBbJgO3+Zgm78XAV5MKGGAgeFkdldvCh1hVlXXWVnP1icZcIlFDRx5/E62mqEthWixNCjFmh7zbNQiDDuRHAM/QkXMkaX4Uvn3rMhevSAo+2HCIW9XNHbnP3Wa0iiS2LjJRPt3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <13aaa923-3a54-ea89-4fc8-b639c204a76a@suse.com>
Date: Thu, 25 Aug 2022 17:47:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5 6/9] drivers/char: mark DMA buffers as reserved for the
 XHCI
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.4afa0fece5b70e838e4f1c7c7f25d0fa3d157073.1661181584.git-series.marmarek@invisiblethingslab.com>
 <58476e4d0ce2b819050393f137603d2a9294d40a.1661181584.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <58476e4d0ce2b819050393f137603d2a9294d40a.1661181584.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 039a3c21-b804-4549-374c-08da86b1117c
X-MS-TrafficTypeDiagnostic: DU2PR04MB9177:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nD5pQOjihnF2301hF7QHnIcHCcqnH0tkIhD/4bHSpqsjaZLqZOUWWSHzLiWxz/wxxR0sgnfmEbxxPoBGcdjKg+UEzkNnEqudngWGiUIWJFfqBaB8L83iX5nPL5XUFUqynT1liERyFZ2kIJiYThp60mA93I28eGnzCrWVuLydL3nRXH8DwNsaCtAqczVyqgX8/4lmge/ByYrV8RcQsdl+doJ5g7VcpMW+Z+yel+ItyElq3ggDApfmdpl5/uq4mh5qxMQhzy7jqT+ydI/yFik+j9FJxCNpUb1YW3XWxs/iaoLGamuIzovAb10rPX3J58HATL4YAiqBZ1ziXH1XEt/1QVyDr1yN32FepRQ2cOOeEYY61sxO70G/2H0M3qfo1B+JvvnfATUpUoY1GTJLVgFLZG/9w2+0VTZfdKHDXdCbBIjtstRTOpShtuoIrxXuzEQS6T86XW3t6fhqpnX0KgGeVEDT763zGJJsdnnhzFfnyTr7O7EMF/k31AvXD7g4ugVaaHaXr0y1DSQb4aeo9v8JQp9EHvB6GuEh8PF2q/JAv0F9t0tjBIpvAoMWju6uwJD74Neps17ssRQ3oPOYVz5+sXKJ9KurVM7qyMWkEKor8UT5cS2mrWe/z4B1QRo1/BVR6lGkEaa3PsusJ63YkvM1MnSOW8Q7YqrxKx6L5lwx3EjWrp420msVr2g/22871RHHCQ2qbZdMswofK6G6KfBRUJrVkLCB3j4WAS+CJvE+2Bibrc0z75jTQg8v60XqQnv2vyhYqhhSAe3kYNELqxbC7tq6IePSO6uQSXH3wiOb+2o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(366004)(136003)(376002)(39860400002)(36756003)(86362001)(38100700002)(4326008)(31686004)(5660300002)(2906002)(66946007)(8676002)(2616005)(66476007)(66574015)(66556008)(83380400001)(6512007)(53546011)(26005)(6506007)(41300700001)(8936002)(4744005)(6486002)(6916009)(54906003)(31696002)(316002)(186003)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWZNUU12ZWhCdXVmRjVSMWJQd09mdFJyT0xvdk5aVThmK3Y5RkFzVGtVTWFh?=
 =?utf-8?B?cit0QnFtV0dKWG5SRzMybEJrRm9YMWxyeHE4U25UelFvVXBrUU9aOUpBdW8v?=
 =?utf-8?B?Z3FTWGEzaXBheC91bzZZRm9pb0FiTlBwOVdGZUVHOXN6aWVCM3JvQ2p3OGVo?=
 =?utf-8?B?RmIvbjQ5N0NjWnl0OVR5elU2VVBYcitZRURQb29YWGlZYm5mblF4RHg1dVFL?=
 =?utf-8?B?YlpmYjVNQVR3bVhpQUJQdHhjWUZ2dXRwMGVyclhlZXlUOHMyWHNxeXQvS01o?=
 =?utf-8?B?WStJNm5saHhMcDkyalB6SGFNeEpqVlNvSlJpSi8yUXJmMlRNVDNOclhIN1l3?=
 =?utf-8?B?d0piWmQzcUhOSld0SHVJdUFjMUpocWxKYktibWIzZmFJSVRRdkVWWEV5L0Zv?=
 =?utf-8?B?K2hCVjJKQmhhbTZJK3hwb1hKUk1Gb01ndjRzbzM4UCtuSmhsYi9tMUswb0du?=
 =?utf-8?B?NC9yVk4xc09PaDFzSm5QVEVGZ3B2eU5YcGdaQmxxMGRLTllsZm51cjNsRUhM?=
 =?utf-8?B?TW5ENGFIUktXdTRJQ3RSRWhHWlYyWDhzNmNqZHo3NFJSM0FuTmc1bkp0TmJC?=
 =?utf-8?B?cklFT2paOWhhVUl0VGs5VUNjSVlmaXlORXUvWXdtZUZJeUlVZGhrRlR0djlB?=
 =?utf-8?B?dWJzVHhBbHNDOHZQMlNXRzhOS3ptNEQycytnRnNBVTRKMGN6am52UmxwU1FE?=
 =?utf-8?B?WHNUNWVhdGc5OUtrN2NIeTBVWFpxVnZlTDNyZ0JZcCtkTGxLU0trOUNSR25h?=
 =?utf-8?B?NDVDOUlocFZ0Nmx1SGJKSWNXaHl6ZVROdXYvanJnWmhVaU5LV3p4TkFiTVpF?=
 =?utf-8?B?QmtVTFV1VXg3bmIxbFFBWGVpWHhLSjl6SExHMnRqS3ZRQ3FZL0pKTVRnNEp2?=
 =?utf-8?B?LytabkFzVFk1N0xPNWVNOEpWVHlTU0NHa1I2R3RPdXdSWmRXNU9xM0RRaGxL?=
 =?utf-8?B?bmdXSHZPa1VPVFRtYWxkeGd3bDcycndsWVNSSUZZS2lzT1NYSDBQcHY5TXVm?=
 =?utf-8?B?Q3R6R1lNMCtCaTZKTDVMNHNGcDB1NVdkNmpqM3ZLNGJRYjk2VkZNc3FkRFFY?=
 =?utf-8?B?cWdRNk1Rdk1yVlVUMzNXaTlqOUtJRG8zbjc3K3dHSHZEMWVUNDg5VDRqQ2hr?=
 =?utf-8?B?ZnN6U2dET3N1WCtpOHlaTitBQzNzTU5Kek1BcUNkVTY0R05IWkFJNXpiOEh3?=
 =?utf-8?B?WXJTZGJuMkxmMFpBaDZudlkwN1N1UXJYbGhTUFUxbXQ5ei9mZjBHOGxoSWlo?=
 =?utf-8?B?bWV2cVM1dTNXNHZPWTNPOTRTWkhUVis1b1ppdzJBZFkycmMxeUc4WHRtS2x6?=
 =?utf-8?B?aTMzUDdsMHZuZ3p1aWZvdHhGcEVHSGhaeDBTbnhpWTdOTmVqNmZLRWpYbkxv?=
 =?utf-8?B?WW1YYXI5eitWZE1VMHc1NWlMSGpPcGJMOTg1RG9BOXl0Y0hWY005KzZhbkds?=
 =?utf-8?B?cjFERXVwdFFrYURqMmJ2RE9jWFVHSUJVWmJPblVWVUNFV1BQTUVuT2JPL2Mv?=
 =?utf-8?B?azdRaFcxUVB6VC9YSFFZeVl6clM5RXhmRDMzTlluNUQ4cUQveHloNWdxcXdn?=
 =?utf-8?B?R2tBcGRCUEpDN3FnTnFmVnB6ZENUM1hJMFZIRTJaWlIwUklOcHJYcjNJeERj?=
 =?utf-8?B?TmNxSXJ5aFREZXZtdC9DaDIrMW5DdThrc3F2L0p3NER6ZXhuSVE4b2dGc25h?=
 =?utf-8?B?cy9tZnI1RmxodFpLUnJOTG01RTlFVWNEMDNrWGxIQk5NMVZPZG0va2dwSWFW?=
 =?utf-8?B?VW5iUlZpQzJhWDdaZlZONlhMY3o2TUdHV2pCQWtJelBXaGY4Rnp5SVNXWlF5?=
 =?utf-8?B?QThLaEU1RUlDaFR2SlpNbEVuYTkwb0V3dWYvOW5vdUtQSDcvUUVkeVN4UmlI?=
 =?utf-8?B?ckd3c0xRWGt2WVRpb2d3cXc5TnVqeFg0a29oZUtEa1hJdDZrd0tsSDNkYzlq?=
 =?utf-8?B?TG5KaG41TjErKzNSdWpyODhQaDRyZWI4VVR3TlQ0RFpXMDQ4QSsrSHBheGpB?=
 =?utf-8?B?Ylc2TUtMQTVMM0hwRkNGOFdPblIxNFVLRjFod05OQ3JMK1NkdmNBOGRvczY1?=
 =?utf-8?B?RlUwSXVxc3VZbVNjdVVETU9wR042ckh1M0NjNGpVT1RLVlJYOTBsZkIyVTBO?=
 =?utf-8?Q?VYC2ohiVUkYdmSJd46Sr9ra/n?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 039a3c21-b804-4549-374c-08da86b1117c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 15:47:08.7970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MT9PcEzPuKIkqff9wC9AIK05v4ucx/SUQ+5WY5X3tcTrmBfPNCSeqGFNkwLsoiNctWEDzCNX0DmSLru6fkcymA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9177

On 22.08.2022 17:27, Marek Marczykowski-Górecki wrote:
> The important part is to include those buffers in IOMMU page table
> relevant for the USB controller. Otherwise, DbC will stop working as
> soon as IOMMU is enabled, regardless of to which domain device assigned
> (be it xen or dom0).
> If the device is passed through to dom0 or other domain (see later
> patches), that domain will effectively have access to those buffers too.
> It does give such domain yet another way to DoS the system (as is the
> case when having PCI device assigned already), but also possibly steal
> the console ring content. Thus, such domain should be a trusted one.
> In any case, prevent anything else being placed on those pages by adding
> artificial padding.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


