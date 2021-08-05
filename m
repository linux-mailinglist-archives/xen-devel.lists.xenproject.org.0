Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F703E0EDA
	for <lists+xen-devel@lfdr.de>; Thu,  5 Aug 2021 09:05:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164150.300378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBXQb-0001uX-NR; Thu, 05 Aug 2021 07:04:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164150.300378; Thu, 05 Aug 2021 07:04:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBXQb-0001sB-Jx; Thu, 05 Aug 2021 07:04:29 +0000
Received: by outflank-mailman (input) for mailman id 164150;
 Thu, 05 Aug 2021 07:04:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1FJ0=M4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mBXQZ-0001s5-Rd
 for xen-devel@lists.xenproject.org; Thu, 05 Aug 2021 07:04:27 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1f8e018d-d048-4eec-96df-53263f0524ff;
 Thu, 05 Aug 2021 07:04:26 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-ZfBHanisOiK5TBrWMEtkAA-1; Thu, 05 Aug 2021 09:04:24 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7039.eurprd04.prod.outlook.com (2603:10a6:800:12b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Thu, 5 Aug
 2021 07:04:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4373.027; Thu, 5 Aug 2021
 07:04:21 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR05CA0079.eurprd05.prod.outlook.com (2603:10a6:208:136::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend
 Transport; Thu, 5 Aug 2021 07:04:19 +0000
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
X-Inumbo-ID: 1f8e018d-d048-4eec-96df-53263f0524ff
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628147065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kBlKBEiHbUBBYuvEEBQBsLv3d3jNwgqUNb0n8dMRK/8=;
	b=bJRjL+Q0jhpxwUUsVRLuV/DYUIQBAV0CbptjACRC8WdL82VSY/2Fr/5saJe7NrvpSs4WnM
	3MKNXKCQMEdZ4yZ3KeyQxlLSn6rogNWZtDw3XIezY9I6EHrBDocaSjyQri1tMl5fypdlAz
	ot3FsfhF8KZ8eXDfCxLPFDv7z1EtRZE=
X-MC-Unique: ZfBHanisOiK5TBrWMEtkAA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xbm55i7F0oeKzS2/aAcXco+2qkAaQRSd0U+GYoxp5K2cGJDZqW+DvCelSBSQqk+I1xb39Ky+jMIGArA+YZNNpHZmxgV5gMIp97eolPOMXkJOOmC4OVyFy/1jT3u+BCpxfWrBvrGXuWn4G1D3ZMw0AqCu9Sq2faFk2MHWVPi1FHqx5pYkqemJneLJ8F1Jdf4u3+pWu+9FXOsgweC1UDxutUmLjr52MTLjPvrFbjaIwTj6zS0tASEpiUJnocixDgP6qKDlPunUaiqZ/8io+sm6lobt+Zvxc8nlWxWk+SP+uWjq0Y0LR4Ufdj/osj3hxFnjcD1UWGM3fxxS7o3DH8690g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kBlKBEiHbUBBYuvEEBQBsLv3d3jNwgqUNb0n8dMRK/8=;
 b=kbtdoiITcjwBBbFBKxmMyGHXmQ/FD0vp2dmhnH8GiL9E/peqs2c3iHr80bOUBIvCVJr5MSVWmgLmoeXWwWb9qQy7WAzYV4deNhIzLgWwP3f6hvoJmqyJUiA1kuHUsFlAe7X76IpnhuCJNtCEGIm1OnomrxECdtmHMhmnF3/PP8Xku9/Z5Gwo3yIxb3kIw1PqgekebnjfZ27Y9zZiROl0aX3f3Yt3/GTYRhcqPdxtJEiNVUsQUHw22h2P7PKfRG2smcwlGAwpVe9tnC3Nr4+93TtTLnwI3fCkwyKiBMj845o6u+6nqFZnwWhHW5D8L691YA6i9423O6PF6KsRH7FpRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v6 18/31] xen: move include/asm-* to
 include/arch-*/asm
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Paul Durrant <paul@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-19-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <58a894a9-dc64-6a4d-7468-acb509892777@suse.com>
Date: Thu, 5 Aug 2021 09:04:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210701141011.785641-19-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR05CA0079.eurprd05.prod.outlook.com
 (2603:10a6:208:136::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e1b87a8-e14d-4175-6b77-08d957df401a
X-MS-TrafficTypeDiagnostic: VI1PR04MB7039:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7039ED33B918F72964E4ED55B3F29@VI1PR04MB7039.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZG7jvzePCYRW+OWEHV86OO/SRCYtCaX1pVcdPnAA1No4SOEv2Jbf2CKqTj5hLPzK2nbn7grTtSe7CPrjGzsBZM7bcLETqN9cIgufCjHMOiTYVak+klRz5xqjREEFHcy/Yug1ZGyk360rrtNDFwHQpDTj0tdPPB1xQfp0zWDZV1uGeass2YZh9hHdhgGCHqXSQi0CcJln1NP4D2ISs2gA6+cQpoYfY4dGMWE87TSs2U7SiTH/9bZxW0eYVMbFggBmKwSo1Nx6X4pRYm6BBhWbZ2n6MQxRJYlGD2hJKz+/qHvzA4SbRxT6ZP2n09+KCjbhOtjcrwft457BYCa2O85hDgV+jkCX2k4FGnvB31pyLwvK5FcMxR8Sx6nUZ9l+BxA5WzRLGAmBItqllPy/nCpcR9hK1iNDTgiK7M0BN8PXdz2sZ6V1GDILPz70M3AUvDYLGquGZ+fZbIxq21+qqXsDuLLwGWtXbp15OOg01xn89KY1rrqMOLFdQ2fxi+bdZbaCKsQ9qwZ5RBUlInb5CgCuAIIyp0Q+2JavObXOWj1zbBGFGmHg+ocsev2uiVP3Lc2VvvaPPTdOeVHZgxYXeoMZ5XJwH4I/wKkZAc+dp2CDwu2ILNBRLeQxsIVv2x4iV4Lnm1z8YVM+P5ISGpxkG3YnFgd8zXOjksTuN+otkQX04khJokAcsTJyTcEZHXU3Jk8VNF/N+r81I/7iS1JwZfMu+jlbiRRRggQwD9dnLoJndbg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(376002)(396003)(39860400002)(136003)(66556008)(31696002)(36756003)(6486002)(66946007)(31686004)(4326008)(86362001)(66476007)(6916009)(478600001)(7416002)(5660300002)(956004)(54906003)(186003)(2906002)(8676002)(4744005)(26005)(2616005)(83380400001)(16576012)(8936002)(316002)(38100700002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVAzOVZ5SGdHOWQ1MHRyS3Y5bndVQmN0RUJjZThEL0NvTzl4aGJscjQrZjZ5?=
 =?utf-8?B?czN3OE81bXBGVVlBekFleG1XMEttR1J0czBMTmFOU0RYNDFXaGJwU0o3SDk3?=
 =?utf-8?B?aEtWSFZUUG5YZytJSEhEV1hxc1RiMmVPMVJRbWd5bTlGWkRzeGZIQlpQU2hF?=
 =?utf-8?B?b3NkTkpkdFBUb0pLOXROcHFldDFVSXNZZHN2aGxxU0lBQ2tJZVZ4TlVKUkN2?=
 =?utf-8?B?QlRGcCswaVpHVEZpRkthSllWcEt1elZXVG90VE5uNnh3aHhibUNYNFJva2d6?=
 =?utf-8?B?UW5Pcjg5WlRJT2dCZWt2WWplcnRpYWlzYnU2bHdmeHdBUGpiSFkvLzhBczkz?=
 =?utf-8?B?UnkwVlYyU21wVVh1RXAzOU5zSXcxQWE1OTYwM1ZjWW51b1AyeUtFWm1TdlNW?=
 =?utf-8?B?ZHFGVlFKT3pmVGhQeG8yaVZvblVURGtrTDN3T0ljM1p1QlVSL0ZOZytmT1pC?=
 =?utf-8?B?eVJrUlBHUFpoOWZsV2VCNFRxSmpRN3RxQXlTQWZzRGV5T3V6dWRPYjgra1JC?=
 =?utf-8?B?bWgvenNnOG8wRWdubEY0eWhSbURrSE9OOHowQldMd213VmJzVTFXeWtvV2NT?=
 =?utf-8?B?Zm5WTkRGNC9GMGpKdUZ3ZGVPSmQ3aGpENjJDR2xEZnlWRTdBdm5pdW5NdXB5?=
 =?utf-8?B?Nk5GekR6Q01iVzMybVJISmlHVUYyamJWeFV3VUMyU2NnMlVUT1pkTWlVS0Vp?=
 =?utf-8?B?K09tYTdWQkhmNUd4Uk8vREFxR1pYOU12NVd1SGRLeWVBQ3h5MUhtY1orN1Zs?=
 =?utf-8?B?NHZEenJFWFpubzJIL2I2SXpzZWpVb2psa1VhcFJwSGFWT0RiaFNjWm4yeXVJ?=
 =?utf-8?B?MVZuOEF1TzMrWlhnVVFHbzE3L3ZrdU1hT2REM3U1bFZmSUVZMTJjZlNDRW5P?=
 =?utf-8?B?K3IxZWhQME5UNTZJRXc1Mm45RHcxeUY5bEZuOE5BNE5Qc1BuT1JrVURWaXE5?=
 =?utf-8?B?amV4OU43c2xITExnTG1jUjZ3YkFsM0xhcTRhSVRtS3JudDAvODJvN0VXQ0xF?=
 =?utf-8?B?TnJNWVQ0eHFaeTMwUUpNNkk1NUFiKzhYcm5kUVEzaFpHQXgreEJYWlJ4TGhj?=
 =?utf-8?B?Yk11Mk0xajJJamFQOFJ3TklwcElySG1HWWhyek1VT2FPQjVFdzBsVVdWSmtv?=
 =?utf-8?B?R3pvZGliQlR1eENtMDBBOW9RYU1MNnlLc0NrQitlMFRUcTBHalpETCtBdXNC?=
 =?utf-8?B?SnFHbU5NMmdvK0NlcXJ1UG5ZWWhsZCtGTFVhMm90cFdOeGdpVk02ZzRvdS9n?=
 =?utf-8?B?cS9vUk1CWGdlNTFuYzROV1dQY2lkTGNFcHpKcGwwdGt3T21rWnFTM0hBTUFW?=
 =?utf-8?B?L1d0Rmp3alREKzBma0dZc1NDWmtxcFRGNHlMSG12YW0vblBtMlpoRFVxNThp?=
 =?utf-8?B?eCtUUHRlUGRyOXI5TXNNZXBaQjRJOGZTdEhTUWpJc3NZUzcvdkNOY1llOTZO?=
 =?utf-8?B?SnlZdG5ReTZYYTBuVkNjaTdUWnR0d3VIOUhxdDlkMk1BUVROTUR4TDlKRSto?=
 =?utf-8?B?U2JNWXlzVmYyd3BmSHFLdVdxbk9EQWc5dG1MSjhGZDc3YURaVEJFWTRQNnZQ?=
 =?utf-8?B?emIrQzJwL1FTcDVKSzBhWUNoNTRVVDRNdVIvSXl2NkE0dFpiTVVrL1dDbkc1?=
 =?utf-8?B?eUZsRXdSTitnTG9JYUx5S1hmbEpPSFN1b2hEYTMreXZ5YVBoUlBISHNxcUVT?=
 =?utf-8?B?YTdBaVJYRnY2QTduVUNWQnVSMDRLZkV4c04yQk03VjZrNjc1WkQybUwweFZi?=
 =?utf-8?Q?TSgdc5LoqBBxu4sGhlY9Zn2axd8wt1d0jw4YBz+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e1b87a8-e14d-4175-6b77-08d957df401a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 07:04:21.5781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j2qKdqdLYvC/TDjlEEt+pUO/GQMEbvb3AnqmK9X6l0WPVK0CT/qMkbf0ciC6j52eaxGEx3OoKKPCVlRK2VUAfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7039

On 01.07.2021 16:09, Anthony PERARD wrote:
> This avoid the need to create the symbolic link "include/asm".
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
> 
> Other possible locations that I could think of:
> include/arch/*/asm
> arch/*/include/asm

I thought it was always the plan to follow Linux (and kind of XTF) in
this regard, using the latter of these options?

> --- a/xen/include/xen/bitmap.h
> +++ b/xen/include/xen/bitmap.h
> @@ -14,7 +14,7 @@
>   *
>   * Function implementations generic to all architectures are in
>   * lib/bitmap.c.  Functions implementations that are architecture
> - * specific are in various include/asm-<arch>/bitops.h headers
> + * specific are in various include/arch-<arch>/asm/bitops.h headers

Then, just to take this as an example, referring to just asm/bitops.h
in comments might be enough (limiting churn on some of the ones that
you're altering)?

Jan


