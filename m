Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7962642538E
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 14:59:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203556.358696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYSzx-0000qm-BC; Thu, 07 Oct 2021 12:59:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203556.358696; Thu, 07 Oct 2021 12:59:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYSzx-0000oz-7l; Thu, 07 Oct 2021 12:59:45 +0000
Received: by outflank-mailman (input) for mailman id 203556;
 Thu, 07 Oct 2021 12:59:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qfpx=O3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mYSzw-0000oq-5S
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 12:59:44 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dfef1abe-aac7-4ba0-9fa2-898daffdc08c;
 Thu, 07 Oct 2021 12:59:43 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-37-sBjaWvp8NbCiarQhRNOtHA-1; Thu, 07 Oct 2021 14:59:34 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3119.eurprd04.prod.outlook.com (2603:10a6:802:10::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Thu, 7 Oct
 2021 12:59:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.020; Thu, 7 Oct 2021
 12:59:32 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0152.eurprd04.prod.outlook.com (2603:10a6:20b:331::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.19 via Frontend Transport; Thu, 7 Oct 2021 12:59:31 +0000
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
X-Inumbo-ID: dfef1abe-aac7-4ba0-9fa2-898daffdc08c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633611582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5BK+/dEZF47hh6M6yP/qjvxQtUd3lmj2uaxkYYAvL1A=;
	b=E03DV2QkLgKRjMNmNLjBkRrNdflMf7GfppGmDw16e3yjRSkRdM52xvHs6Pa7zVN6EDO/II
	hPRpZJqfyE5NihB0VhWRimzO4ADieDVoJeKmoiJEa31CKgbaW/3IetIM8oacaXa/tqRUBM
	Jj1MBkWcpSgYqw3FE8P8Bhsa64PToqQ=
X-MC-Unique: sBjaWvp8NbCiarQhRNOtHA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BPwvgFF6oSEnMelVaQs1HyiTo7ecwLTbRWT5LXLL9RjzaHoOo6j51KMgidTzUMU0v/PKzZRywUBky2ltO9qiMzmRvPwCF9yVeA0xA9zB/u2/4BjhEwdYo5DBLXxTdff796JQZQub1noJKsdZVXgoTLF45fPEPs/a4MWqMlHI4XRd5ENLTkp2+d/MTnnJsW67ye/uM0HvstYKcZ4CzWMRUbY4x+c8PPBURNHDLOBypQGV+270Kzit4dE8uBFdbvcQVaDbZad87fcFWPCIYjyUXO4i5nTwGMOqOihzGXM6ce5B1NT+md/qHdeqmokVybbFn2kGM4wkBZTrSaRKf09ozg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BK+/dEZF47hh6M6yP/qjvxQtUd3lmj2uaxkYYAvL1A=;
 b=UfyzYyQw92CC2drMgQQ6/qWBnvo8l7GiOTmm/ioi3er2fWR7PGrxrp/ttWVmhiC52G5kEa6Ck7RMp79pYTnn8dRHD9Yqoq8RXxJvSlXqyH2ZHJZtICEdANW16RasVr0ILDZm4sE5HtlKcHOnoJNblnuiCXiPpxWEdoMHVwX8MxCoyTtCLuWH4jvwq6eNzEwLJlGMSAn6zCvCc5eeGgOa3h4xQ4KIv9fPHfztKC+n8tamv65dVtfXCMNtZb4OWaA81bkD5p8W3lFtmunAjViAz2FBD3QW4iJIiXx7yEPrHKYJO7VHCAocgejKhtTY3ErZ2jPMIaE8JhbHecfL4NDouw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v5 03/11] xen/arm: Add cmdline boot option
 "pci-passthrough = <boolean>"
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Andre.Przywara@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1633540842.git.rahul.singh@arm.com>
 <e7d91ded71816d07f559b98027e5be1ff172dcab.1633540842.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <08e3b378-2c18-6103-477f-18eb5a096c6e@suse.com>
Date: Thu, 7 Oct 2021 14:59:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <e7d91ded71816d07f559b98027e5be1ff172dcab.1633540842.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0152.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25d2b190-558d-4377-d043-08d989924e90
X-MS-TrafficTypeDiagnostic: VI1PR04MB3119:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB31195D1AF74F0C33A8F745DDB3B19@VI1PR04MB3119.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rG286zt3IRLqb/YU3/hDxH4A56OCsOLrI1k1RaHHjb2mBCL6MVT8cblRX3yfGz+cxXCtpFvxiH9jHvo6t1CmFEwkuuuG4KIHzW44zeED3JKpNYnm7Vgjug6nFYIeuZ1YYDOQmYBkiUiodMxOLDQJABAt8Yl/NzpAdfX9B/CjjjruhwlAkXmKHvAH2VXJtFuXo0zshnb71mFhRCzzxJc7lT+/gZ2LAhdxMJWPX3GohJGa0ga8LLGhkYbjG9DwPIKzreXYTZR2PFGvw4LIyVD2e0RZjDCAxrhLu11ZUQGv7F6PPwopwZN5Ai32zeuWZ8bCiglIuDpfr+1a5+JFnehFRjm/naOQV66V3hgwEm/nbubKzwAyVJZ5LOcXq5YTJ6rwmzm67pvFA24/TjhafHodV/9ytOPIS4xjiHQu/ln5UwoFaT0POjjhcwHxt+e8uOce8pW35kK+NQzpwKklD16FzjurmJWQ8lV+WRENefAgVUXMELYZEhGaR2pxiQqUBGK4JyjTpL5Id5OANykv/c2ofALYV9N2gyXmnErhMIz84te83Lpng3EDEcVDmfnDxBbxr8Wd3hcPu51z89sRZEvR6XuvRXgANrDTQ6MtVUcr1+09m9CbATNl0Ll5zpdrHE310EmtYbEBP5G2nLeN5SpG0RIU3hK0eSL4WksP89Ww/BK3RajMTym0I1r/631h11OrgtGG4tdbHuEuBKZKjpBtM25jJUpvHlUWXFeWgif8ysVUdThMzQsF/vAVk1HKyHGg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(4326008)(31696002)(2906002)(26005)(54906003)(5660300002)(186003)(4744005)(86362001)(8676002)(16576012)(8936002)(316002)(53546011)(66476007)(36756003)(956004)(38100700002)(6486002)(7416002)(31686004)(66946007)(6916009)(66556008)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RG8zdE1oL0xhUkZTZDRtR1ZHYml0NTE5WW1aVEZ5UVh6aDYrQmZWcXJKRmNo?=
 =?utf-8?B?TXB0TFhSelNjSVdZMTE5OVVUZ1ArbHQvSmhkQmlQV0JTdFpJZXVaQmFreTRD?=
 =?utf-8?B?SXdBY1F5R3d6RXg1SklZcmdpaDNySFZSR09oUml6QUNUZ1ZWSzRDTTFRTjU3?=
 =?utf-8?B?V1Y1NVFPRDU5U0p0YlFxUTZ0WXNmMFRFRm9iNXR2ZTlZaStKUFZhNHZ5Y3FY?=
 =?utf-8?B?MHlOb21GeUtFdjNJdGJPcElLbVJ2V2luTk9LVTRVZVdjYjJ1R2wwNHd2VjNW?=
 =?utf-8?B?QWwwa0RXQ1Y1T0Z2RmpFNVNobmNzWEMwbzNjZlFMQWg4UGRzUU4rS1F0dEdy?=
 =?utf-8?B?OW5UWFFzcXdTZGZBRktRcG5hRVZ6V3R1a1JvZnVFcEJ4c2RwNWU3ZG5ycTdS?=
 =?utf-8?B?c1ZXVHp5V05Kdm1DV1g1c2dnRGl0ZXFmdVNOU0JxZ0tsbG9PckhITDNVTTZl?=
 =?utf-8?B?bVFLREUrWWlJWW9GalprL1JlOUk2VjIrRWZ6OXQrME1hZmhsclhWM1A3WVk0?=
 =?utf-8?B?VzNyQ2hsdGtIemF0VFNlbWpPWXpFOVZyWHIzenJlaXpZQjBnLy81cUhKVGRv?=
 =?utf-8?B?SEp5QUg0RC9TN3hrWnkwQytVN3FJaVdRS1g2bTRlOXZNb2l0Qmw2bVZuUGFw?=
 =?utf-8?B?c0xqRWNBdVF6eWYvQkJoalJaYUptOWx4QUpiVlR2SWRKbFJFeTFiNlgwczBF?=
 =?utf-8?B?MHVhQjYyNk5Xc1hVUUtMb3VZa3RjdUhUdW5IdENuMjU1dm91VUtVTVhZbGxO?=
 =?utf-8?B?WWU1bW81QnM2OWNpWTgrSDAyNG8xK3lzNXpNSU9BVDFYTi8xNGY4TUh5UFJW?=
 =?utf-8?B?RCtidFFuRW5mS1hyTi9NbEtKd2FuRmU1cmFCbTNkd1NnRS9WVEJxS0FNbkxv?=
 =?utf-8?B?Qzc2TlZZUWtFYm5uNnZ0MytVWW51REpDWlBLYXBQbGJzWU9UVmRlbjFwU3k5?=
 =?utf-8?B?czFqOVhKNVZVV21nV2M0RGVDMkNoSzNiVGFKQ3JOcUgvS01ENjFwUkVibWFk?=
 =?utf-8?B?c2lpMDZxZEI4U2JScnRxdmV0bWNnTTBIUGk1OFJudFBOQ3E3b3NKbDF0NFI1?=
 =?utf-8?B?OWhSY1BtbDJOVFB4OFlnRGs0NFJzOVliNUZKeVBHckdVM1Y0ZnZodXpteWhp?=
 =?utf-8?B?ZmJMdnlSQ1hRK1FjNC8reWNBWXBPQ3ZtckdhQlNFUEhnUW5vbldDNkxMUXNW?=
 =?utf-8?B?d1ZMOEgrVThMdWJjUGdPRHlvUWFtK1NERHR4bFY2dXBTQmFSVUNxSC8wZzMx?=
 =?utf-8?B?ZDhKMS9aZWxITHRJZ1B0TnpXSXh1MUlYK0wrdGNmTDJwMnhjbjdleHJtbUxo?=
 =?utf-8?B?eHc2QlprMFFRb0JqOHFyTGFZTzZVeTJ6UVhMYlI1ZTV5S3VZY1N2b3BmdEFz?=
 =?utf-8?B?V3hDOS80a1B5cVYwdDhpZFBEZ2t3cTgrbkVPb0U1NjlidFR4TEU3M3FveWJ2?=
 =?utf-8?B?NzR3Q1JNYzk0NGhEVnphSG4zUEhUbHp4SHR5bkJNWXNOcFIxa3ZuYVYvcDQ2?=
 =?utf-8?B?L293bUFacXIzRGE4cUdNbGpWS2dBZUNEQm54ZHpCNndzdzY5STA4c3ZhcWtN?=
 =?utf-8?B?dHNNV2E1ekVyOExFY0hkQXhnVXBZS0JnUWlmbmdUQzlabDUrOHhpTTJudS82?=
 =?utf-8?B?MjVtdFhJZjRJWlZMWnhld3FLS2txRGRSeENYTEtwT2dKYVRZellrZTdad2l2?=
 =?utf-8?B?am5sRTllV2VVTE9QSms3SjFEdnhjS0I5UFFIV0ZKVkxaYlNKdTRJWFk3bGNx?=
 =?utf-8?Q?zk0a6yRYJBEw5EL6UW2Ba90Njm1low8omGZi9JL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25d2b190-558d-4377-d043-08d989924e90
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 12:59:32.7059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OZxFTCbCBT6+/8iLEg8H4fD7etbZ6aaeO8PxDN6VVZ06LXVj8VpDYC2oxnenrWEIjh1GWv07uprAiXSdOTECHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3119

On 06.10.2021 19:40, Rahul Singh wrote:
> Add cmdline boot option "pci-passthrough = = <boolean>" to enable or
> disable the PCI passthrough support on ARM.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


