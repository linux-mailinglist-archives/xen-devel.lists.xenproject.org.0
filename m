Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6B33D0A54
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jul 2021 10:11:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159178.292811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m67JB-00006z-IG; Wed, 21 Jul 2021 08:10:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159178.292811; Wed, 21 Jul 2021 08:10:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m67JB-0008VZ-EY; Wed, 21 Jul 2021 08:10:25 +0000
Received: by outflank-mailman (input) for mailman id 159178;
 Wed, 21 Jul 2021 08:10:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NGKG=MN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m67J9-0008VT-Rc
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 08:10:23 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 178fbab2-e9fb-11eb-8c09-12813bfff9fa;
 Wed, 21 Jul 2021 08:10:21 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2050.outbound.protection.outlook.com [104.47.4.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-gElLqH_KMNeIB8VfQjF-6w-1; Wed, 21 Jul 2021 10:10:19 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5326.eurprd04.prod.outlook.com (2603:10a6:803:57::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Wed, 21 Jul
 2021 08:10:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 08:10:15 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0163.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Wed, 21 Jul 2021 08:10:15 +0000
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
X-Inumbo-ID: 178fbab2-e9fb-11eb-8c09-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626855020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kocI4D2dJiS81cLtvgQrxWrlWLMgPZKDLgcY+/Zijo0=;
	b=LgRPe9bbMIkBleDWbgr1hA3j8vev4IkiGQLInXsAbg3YG/PAwXZuiHv5fBQV3llSXhjP1n
	l3Y86X8GsOPzuwlVjsmsbde5uohQxX577P6MSI5my7IaWlUK/YCipo4PxP9G9hgNRjPa57
	YOJ3QsF3+8QXXMoKITOte9o041K9WJM=
X-MC-Unique: gElLqH_KMNeIB8VfQjF-6w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TuU4XGq62SNIQWLvpOZkgHvLc4chpzr5dh60Ruf7C2SkI2p3YSnWdgNX633ozEjoNM+r2drFRsMVqPw8lbrGmba53h1NIdpROR30qqOvy45b1ugQeKDoDn8jpJ6H1+nbvkYl3oWqE3tbtBpAX07MQQSfPymrJamVzUzJXr1bDO3iJzy864XIGvx5yqNqHKFuI72syQrNcR0UYBw5rKVssXMbPaMDtEfav7OASZZ7qw5Nj+ZTVteq5F7Xj3hvkehK6bia67WfXsTw1gpGTm1mRLcP8NrHZnHKceG6xe+NokmTFAwKnHCDJqCcyAYBBKcvSbzZQw9nFd+sFHNihqOjmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kocI4D2dJiS81cLtvgQrxWrlWLMgPZKDLgcY+/Zijo0=;
 b=llQmi2doLTpmz6lt4npkz3FRDJSKjF1DQyNYAmA3EsCWfnzQQYKO6kQWr5dnojB8m7MO6qd5xaYiBca3j+NP/crxS5ef2MBtjLKE2NbU3QUqeM+n53wduE0BPOfKnAZjLUQWSPl0kaNapZjWNTX0C2poqfwe1HfRvNNeGjsRkuqT5oYYWjzjPKFyMTyobCjJWVM92ZknLjmpUKlNsR4d9dRtWjG/jbKU+w3/CWTe/6sKGRkHZe0yqRQp67frsdhEuoksKSVm4teNNTU8g3XGuPj7e2P8EKEqYJ7XKjuaT4dknMNRuvU+5vESIAcM1wR8uuLu+0WYhbu02PyTGYJwWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: 5.10.40 dom0 kernel - nvme: Invalid SGL for payload:131072
 nents:13
To: Andy Smith <andy@strugglers.net>
References: <20210720223239.fqbwj3escedolaqa@bitfolk.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c3d7f7c7-0231-dba2-344f-e2e3588e0cab@suse.com>
Date: Wed, 21 Jul 2021 10:10:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210720223239.fqbwj3escedolaqa@bitfolk.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0163.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08b65597-7155-4225-3c06-08d94c1ef89a
X-MS-TrafficTypeDiagnostic: VI1PR04MB5326:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB53268B967E73F01FDAF81A26B3E39@VI1PR04MB5326.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6EpScpnw4ts7RpKObKqemIP99Hp11JmqTjfs+ttEwooqvAD0eJ+8evHry73y+Fzg5BvT57NBzmZ8mv7T+LKPY40+E2Fy+0zz40wqHDV/5HD2lXOyPva0caqmi5uJQjTrsPaj7nW0yoSykk7aPMXP00tjzIClNuXS5R5tegXNPabMULyb4JMyzKcgB04RpFmeAqh+Vn9QFSj9ugi4o0VKPWGYkxghUMAokjID5QR3klsKec1lFMreB9Hate0IgNfnskRO3yTRVKz8ZNelCAMVr4RANseSIrRig+D98+Plfs/gboFfLJo+mHZBa7xbq9rAyk5OqaV6otVxK1enIc7gBXnJw5TQc87AThcPeBfvB8CWOuVvMSYsi72kQB2GxYx4LUuM+SCEMisIbbHsOMvXnwLWZ3WMzmvf4nG360WgGIPrO5elp6Qj66aA9eXWleluYNntTwvlDPzT+NZqHa2dKVeR9AiJ8E11fiH+Ngbdn4G3C3FSghaAGLVxbebiAcQEqDO2QaXRBaCupyKDU23sTq8d6V8OBuYmR8x1a2qHkMT9vknZpgWPm1T0d0wNSmYTpE/TJLX0iQSDfgHmyA87GxWGvxONGmFDg+tXzKsTsrvWJ0kB34AXVLPc1BeObIVq1obEsRePtC6ixNg3O1ywl0Q8HTf9TTm5gsdI7U1xc/7f42Eo/1WMR38Bx99ms0QfEPvZIC9oi1eN54E0V55g+cdxMAjtOZ7hTzCCZnQn3B/AvPxdM1rvxzjdfnYcFhLeVXrgeYGkO+hmkpc/8woVznz23zcYeCbTFOEEiC5e2Iy51w5vBTDqYqTXxKpy4+Lt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(376002)(366004)(39850400004)(346002)(36756003)(5660300002)(2616005)(6916009)(6486002)(956004)(66556008)(31686004)(4326008)(16576012)(316002)(66476007)(38100700002)(31696002)(66946007)(26005)(8936002)(2906002)(966005)(86362001)(53546011)(83380400001)(478600001)(8676002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzRWOTJ0aVMrc0U2Z3pHY3BydUV3TVFlRkdTb2FIRWd5bnREMVlLSGlpOUNJ?=
 =?utf-8?B?TGYwZERNZzA1N0xVV2F2MWpmS3Q1Zkk1ZG9GL3ZLdFZ4VWljVGcrY213Ky96?=
 =?utf-8?B?ZUJZWFNJdnBLbmU5N0F6Z2hGM2VtUFlISWEwMVRkN3ZBeEZjZ3I2amtpSURO?=
 =?utf-8?B?VGJrSFNtS2p0Z29pbkRaM3h0OEZDa2xkeFd5RVRtdFZYRlBrYXAyVGg1d3FE?=
 =?utf-8?B?OXJnb1hBc3l2OXJoR2x1TWRPUFpRUEkzblNYYjVDdDFpek1wL2NKN2duS1ds?=
 =?utf-8?B?M2NXUEw0SWlDTlBQcUQ2WUlUNXRydEhTMW9IYVZrRTN3ZDdmOHNMRHE1Q0VS?=
 =?utf-8?B?UWJXUkJyemhPY3FKbmdrVkJXK29leVNVcEtFcTF3ZFFrSVlOUDR3c3lTek13?=
 =?utf-8?B?T041c0pNajY2VTZ4d01MbjZDWUtBNXltTllrOEIxa2Q4TUFraThZUWx5L2N3?=
 =?utf-8?B?L0dRVGRETFJ1ZERxV245SlpGNEEwbXoxaVVXL0JYRG10Mk5ZZDVjYjNTMU8r?=
 =?utf-8?B?M09hR0RkbThZQnpnNnBGTzJpZnY2a0RvbTVSV0Y0aUV2aG41M2hJNE4vTGFu?=
 =?utf-8?B?Slpxc2Z3OWIwM05EOURUd1BmYjdqRnZLaXc2bXJ2UzhUM09sRit3MnZOQU5p?=
 =?utf-8?B?T01HUXZCWXhPVFl4L0dXNUtGQ3FYd0hYZ2svM0dKbURwenFGVEk3MzhFWm5B?=
 =?utf-8?B?cXJoVVRoN2RicVNIaDNaSWJLQjZyU2JFbXFmQmNXZk1VYnRRc1dQTlRVMXJq?=
 =?utf-8?B?YkFLb2w0Vk1QN1pJU2tNZkZsYnU2TWNuWlVXWGNXU01CejBjOEdRVE8yd1dB?=
 =?utf-8?B?QTQxSjRhVGpTczA4dmZlVjlkWUtGYjQ0VHNhTGZHN3p2V09DUEtOa2JTekRJ?=
 =?utf-8?B?OVpRRWU4cy9taWpvdnF5RktQbkJ6MHZFSDBHRjNacjVITnpFRG96bGZEN3U5?=
 =?utf-8?B?WjAvOCtjZGtDbzM5MFZVN1psRjZaUi9XTHdMcTJXZHc5dUkxYStIaW1jWlpB?=
 =?utf-8?B?czZrZittNkx1TTBLcVZVOHhERXVUNHhYUjVDVDVtaWdpREFPVGRWd3dkWTd0?=
 =?utf-8?B?Y3NpeDNCSjhpUE4zYW9rNVE1S1NyYlJQWUplQlRZRE0wTTJNd2JYTUNPZXNB?=
 =?utf-8?B?d0dPUS9BRThYVFhpVXZPemhuM3NxQmNFTWFBV0hyWnNtREZHR3NkaU9wd3ZD?=
 =?utf-8?B?WGF5em43RjdqNUphZ0U1R3FBajZ0TTF4WW1WZU9JRVIzSHRrYTZZZHd0YnlY?=
 =?utf-8?B?VGdLRXFBQis1TnovcDNudUdqbkhCZGZXVWd3L2tOQ3doZkZ4RDZTWTBvSFBK?=
 =?utf-8?B?SS9KcUp0clZjNXR4Ny9Xb2tRcHI4RUJaRkhkL2RnK1BVMkdMR011M0NtOVhv?=
 =?utf-8?B?SkZ4ZXVUbWNDMm95N3M1SVo0MXNrVitQOEpzZXU1WVUwSDBPYjBPV3hneDVl?=
 =?utf-8?B?RFkycUhyMXIvbzNSSGUvQ3dkMU16OEx1UDVNOW4xR21oejlmaW5QVzloczBw?=
 =?utf-8?B?SWlDTU9LS01aWmFUODNESzJhR3F4YjNjZlI5UlgyNDhrR3FyTGVDR3BxOTRI?=
 =?utf-8?B?MUY3dXUvRXg4MURJamQvYXVpRTNxRDlBNjdrRUpyMUdCSVhDdGZkck0wQVdh?=
 =?utf-8?B?YlEyQTlpTHFzTzc3UC84YnVjRkdCamtOUVZYRmsyQy9HVko1bk5FeHMydEFj?=
 =?utf-8?B?YTdZZmgwaUwvWWo2amVrWTNLbFJrdUlBQldzOHJTRi9FVjhBa2tXclphbkly?=
 =?utf-8?Q?riiLI8QfDUHSkZ3EyoMejYlUyDZMUnpr9vO7SnI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08b65597-7155-4225-3c06-08d94c1ef89a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 08:10:15.5371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: spxkD3t44VorMHH8n2ZYEkr/OaZMH0yqOPfuVAvfzy8yCsHhK+FC0tQUXzPBDtooRh5R0CZjGqYwZVpmh0XfWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5326

On 21.07.2021 00:32, Andy Smith wrote:
> I have a Debian 10 (buster/stable) dom0 running hypervisor 4.14.2.
> For almost 2 years it's been using the packaged Debian stable kernel
> which is 4.19.x.
> 
> Last night I upgraded the kernel to the buster-backports package
> which is based on 5.10.40 and about 4 hours later got this:
> 
> Jul 20 02:17:54 lamb kernel: [21061.388607] sg[0] phys_addr:0x00000015eb803000 offset:0 length:4096 dma_address:0x000000209e7b7000 dma_length:4096
> Jul 20 02:17:54 lamb kernel: [21061.389775] sg[1] phys_addr:0x00000015eb7bc000 offset:0 length:4096 dma_address:0x000000209e7b8000 dma_length:4096
> Jul 20 02:17:54 lamb kernel: [21061.390874] sg[2] phys_addr:0x00000015eb809000 offset:0 length:4096 dma_address:0x000000209e7b9000 dma_length:4096
> Jul 20 02:17:54 lamb kernel: [21061.391974] sg[3] phys_addr:0x00000015eb766000 offset:0 length:4096 dma_address:0x000000209e7ba000 dma_length:4096
> Jul 20 02:17:54 lamb kernel: [21061.393042] sg[4] phys_addr:0x00000015eb7a3000 offset:0 length:4096 dma_address:0x000000209e7bb000 dma_length:4096
> Jul 20 02:17:54 lamb kernel: [21061.394086] sg[5] phys_addr:0x00000015eb7c6000 offset:0 length:4096 dma_address:0x000000209e7bc000 dma_length:4096
> Jul 20 02:17:54 lamb kernel: [21061.395078] sg[6] phys_addr:0x00000015eb7c2000 offset:0 length:4096 dma_address:0x000000209e7bd000 dma_length:4096
> Jul 20 02:17:54 lamb kernel: [21061.396042] sg[7] phys_addr:0x00000015eb7a9000 offset:0 length:4096 dma_address:0x000000209e7be000 dma_length:4096
> Jul 20 02:17:54 lamb kernel: [21061.397004] sg[8] phys_addr:0x00000015eb775000 offset:0 length:4096 dma_address:0x000000209e7bf000 dma_length:4096
> Jul 20 02:17:54 lamb kernel: [21061.397971] sg[9] phys_addr:0x00000015eb7c7000 offset:0 length:4096 dma_address:0x00000020ff520000 dma_length:4096
> Jul 20 02:17:54 lamb kernel: [21061.398889] sg[10] phys_addr:0x00000015eb7cb000 offset:0 length:4096 dma_address:0x00000020ff521000 dma_length:4096
> Jul 20 02:17:54 lamb kernel: [21061.399814] sg[11] phys_addr:0x00000015eb7e3000 offset:0 length:61952 dma_address:0x00000020ff522000 dma_length:61952
> Jul 20 02:17:54 lamb kernel: [21061.400754] sg[12] phys_addr:0x00000015eb7f2200 offset:512 length:24064 dma_address:0x00000020ff531200 dma_length:24064

The nvme driver, by calling blk_queue_virt_boundary(), announces that
it wants sg elements split at 4k boundaries. The last two segments,
while contiguous in both physical and DMA space, have been split at
a boundary that's not in line with this driver restriction. (Element
11 is [perhaps not just by coincidence] 11*11 sectors long. Adding
another request of 11 sectors would bump total size of the element
past 64k, which iirc the block layer uses as an upper cap on sg
element size. Hence I expect the series of requests submitted to have
remained split at that position, rather than the bio-s sg[12] is
comprised of to have got merged into sg[11].)

Since xen-blkback only talks in terms of bio-s, I don't think it is
the party responsible for honoring such driver restrictions. Instead
I'd expect the block layer's bio merging to be where this needs to be
observed. Perhaps it simply doesn't expect to be passed requests in
multiples of 11 sectors together with the capping at 64k (as said -
iirc) and driver restrictions on where splits may occur? And as to
earlier Linux versions working - perhaps the merging logic was less
aggressive back then?

> I've reported this to linux-nvme as well, but I did find this thread
> from 2017 with a similar warning:
> 
>     http://lists.infradead.org/pipermail/linux-nvme/2017-July/012055.html
> 
> In it Christoph Hellwig says, "Given that this is a Xen system I
> wonder if swiotlb-xen is involved here, which does some odd chunking
> of DMA translations?" so I thought I'd ask here as well in case
> anyone is aware of something like this. Unfortunately that thread
> ends without confirmed resolution.

I don't think swiotlb has screwed this up: From the dump of the sg
list we can see that up to element 11 all elements are suitably 4k
aligned. It wouldn't alter the element sizes of an sg list it gets
handed. Yet if the size of a non-final list element isn't a multiple
of the boundary restriction the driver has put in place, then - no
matter whether offset-into-page values got changed - the requirement
is necessarily violated.

(As an aside, seeing the DMA addresses in the dumped sg list, it is
quite clear that this isn't a very efficient way to express the
request to hardware. There would really only 2 elements be needed,
one covering elements 0-8 and the other covering elements 9-12. All
that matters to hardware is contiguity in DMA space.)

Jan


