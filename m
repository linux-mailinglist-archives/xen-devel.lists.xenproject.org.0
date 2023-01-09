Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 802B166202B
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 09:40:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473370.733923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEnhF-0004s0-BT; Mon, 09 Jan 2023 08:39:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473370.733923; Mon, 09 Jan 2023 08:39:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEnhF-0004ou-7W; Mon, 09 Jan 2023 08:39:57 +0000
Received: by outflank-mailman (input) for mailman id 473370;
 Mon, 09 Jan 2023 08:39:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f6do=5G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pEnhD-0004oo-To
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 08:39:55 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2087.outbound.protection.outlook.com [40.107.249.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30c48fcb-8ff9-11ed-91b6-6bf2151ebd3b;
 Mon, 09 Jan 2023 09:39:55 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7093.eurprd04.prod.outlook.com (2603:10a6:20b:11d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 08:39:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 08:39:53 +0000
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
X-Inumbo-ID: 30c48fcb-8ff9-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OFssc1o728s/XI9pI/909eCPUbOjqfhLyRNGxBl9NEDRVlnu9TFc0rXgHeAv7P82t6u5lf0qfbwFPZrvng87iNHTXzkasl+p4Akag2J5V2ahLzKuQ2ZkeFSjvk/TTzIsnQJZ4/suR4lqHM0fLueP6JlMmZQmEt2f9tdp3kycDMPtf6lhUNeN7Sw4DG6Q5PXxR98thKIQYKW9UYJ7m0Bwqv7sNE/QcbvwEWIhzymr1jmtARs9Q3Gwuliz91O6ycigX3CPwVbVRG4NRVWkrYLgifqFrOy6Cx6d4HWGwmmivpP9bpfEO8sAx0KE8urPnJnKJcW72wAO+hnXsXnCxCUrFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/vQoGlSzAJMqyZU02m9lIFhjHp/l09qgQro552DAa8=;
 b=ir2WkemBCq/kbWjgkvntvhYJGrNxIhNKt+qMmwXJQ/RZVuedNiYtFUUbxa+9IDDrKBgbJSZ3y508nBhL/RD+h7/3KPo9dyZveG0JqvazRxC6ks1ZW2PceT1aeDi6BKtjYMx/nFcSQYUMYtzZypF51F8s3KIekbmGOVnyxViyS5/FGbuG6kT8BNcZIjdUOZthXttdulhho1lzeJN1SP3LB4Mi8J0zK6K7dHpUIz8zXdvVmPJoR31xJRaAmn5ZQWBODVhlWgU1uEEVtdtntmqG5hKK1dyeQPeecwg87Vwak/C+5yiyHd/IdYvqB3y8EcuLdOiWuFYiJ1pdWizuqQ6p5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/vQoGlSzAJMqyZU02m9lIFhjHp/l09qgQro552DAa8=;
 b=cbIyJCZqIDZ6H+JIDe9IiisFEG8GXbYwuwTmg5zprbMt5OO5hCiN9gDsb+naVuBEjkiqDAa/9zU7nSAqE6cYwjFcIZ3o9EJQbVOYeybwgYJU/3EZA9jsDKLLVEoT0S1VL9RT3/Q4G6uePDNxN0EcCuzJDkbf15mVbczsrAzQQxPHh2c2qqEabSfnzaKWAJ+o44WownImk68Loy5bMAOnTiPtiRiZCLnGNrWQkooW4TFsLlWWRiHaNq3TccuYYu8ixLllOqhHIBgBRkn9Lppnk4mzLmcbV93555qqpwBin7HlKhvyqy8hzAlYmVuLAucSM6IKKatNwxOCrBKeXCkwLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0a5da887-d1f5-5a50-306c-d60be95ccca4@suse.com>
Date: Mon, 9 Jan 2023 09:39:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 05/11] x86/shadow: move bogus HVM checks in
 sh_pagetable_dying()
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <074dc3bb-6057-4f61-d516-d0fe3551165c@suse.com>
 <76cc0b4a-27ca-21b7-841f-315f31833762@suse.com>
 <37bfe65b-d989-7c34-5e14-171a23df37f8@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <37bfe65b-d989-7c34-5e14-171a23df37f8@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7093:EE_
X-MS-Office365-Filtering-Correlation-Id: 806feb09-f4c0-4ab6-4aa6-08daf21d13f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	US750JBcwczqFONrfAtt1BfJJUj/2Cl4IIKiG3gRF9lyCbOe4LBCfMKSdwDdUA3JFawfclELYqoTDn/tNoQbVSIAWIubqbi98Xvl59cptAKL7fukE8tIoIn0uwkc/cyAgpvCGS77iEj02GOnJFnjd8HB0T6uZmS504OMxyzxvFi+OHgFBWr5SYdM9CL/RMaKfO+BMcYB5AbHGGXTjkxyzhBcdHWyv5JkDiXLJxirlJCdycvSd7fXrNurAWHQnbEKyw+KMz1OyTXb316RQRm8eFtYAAm6YhVpRCyRG7Gw6bN/ttbR8VYjILkq13Ykswn8+7aTRXB20O90JhKVJn+8PLyoGEm/G8TfQvf5oQnhhpbhkh3BHrN+0v7+ofHmn6/5sjfoMW5V9ZkboCBCGYGdZo5obyR0omLSJBycphN4riOSALensd9e5k2kzppGB9HY2rD6RRzAexYmhwTLWZ+aEWMeilqN8M70qFcSEBXsIqLeL4hWxvoDrtyeW19g01ghLpqMRdLuoAmbTKMEfh7TypuunRAJy7mRukl95fqysEcb5PKeFQ1VNtknXOjOaawXcUmdCIeDry6/mSOMS1knVv4b3JqBm2uBkYrPVOFgXuTwJEZdWCNJcllAukb6ySm+SFJhnT3v5QW2TcuvEKkMtCTQLY/VVHubsxYD+4AZj+mV4Dc95dBH1Pg0+DnBPIs4x3pRrCgtQMDE8Dn+giFYlbLFXpVO6ibCXss+IVrm0IY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39850400004)(346002)(376002)(136003)(366004)(396003)(451199015)(8676002)(4326008)(6916009)(316002)(66946007)(66476007)(66556008)(54906003)(4744005)(2906002)(5660300002)(8936002)(41300700001)(86362001)(36756003)(31696002)(83380400001)(53546011)(6506007)(6486002)(478600001)(38100700002)(2616005)(186003)(26005)(6512007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVh6T2REZTBCeStwdUp3TjlUYzh6RStWMU9Hck5pQXJSNVZ2enp0N2QxNUtw?=
 =?utf-8?B?WVh0WUpYTW1YUk9OZDRINmNFL2I2Q3JPZ2o1amFaWDFKUmg3b05EWWVDQUFJ?=
 =?utf-8?B?ejVERlArV2tkaGNUM1FkdHozKytHUEFRNjFmRHNHYnhJYkxOUzBvemc4dzV5?=
 =?utf-8?B?bGtKTkR1SGU5YnRsQXFCYStIVWEwemRqeEptNzZHU1lZeVh0RTVVUUFwK1Yz?=
 =?utf-8?B?VXdHSjlUQTJBeUViNFhTTzZRekNiRm02T2NuQUtuUEpsRGFGOUhlZkdiS0Vj?=
 =?utf-8?B?azc1Z21DcUtpSWJNQlhwcHZDSm44WUZBZ0FsS0pheUtEMnJYb0Z2RHA4djIy?=
 =?utf-8?B?TUVreHZoR3luRkt4bTFvNDRZMXhNYkdhWFhOc2g5amFhS25xMWFyQ1Bacmdp?=
 =?utf-8?B?Y1Fiend3Skw4T0RDbVArNkxSUFh1ai8wUFRzQnJsTXZtelVtTU11Y0MyOVdN?=
 =?utf-8?B?RXQrWlJPSkZQdURCQi9ONjE4RVRnQUNSK1NhdHdQZlFUZUIyTi9FelVhbGU1?=
 =?utf-8?B?U0dtblE3c0oyYi9vbUtTbnVwSWpqc240OGhRSXlDcytVSjBnK09MamlvR2dN?=
 =?utf-8?B?WnJYVnFvdU0rTENUdFZCam1yNGZrb2p4WEhiODAwN2JZZTZjVi93cWNMbGg1?=
 =?utf-8?B?VHo5Ky9YMHpjS2VJSFNBTlJNNGhxNFl5dyt3ZHRXWS9JZzRrUWxtSEJ4VWJJ?=
 =?utf-8?B?di9ZbE0xQUhyVDBQWVdtRW5DLzhUVGcyNFk2emIvbW51anFCSUc2OU9QNE1h?=
 =?utf-8?B?Qnc3QWhvRDlMWEVwWlVlUDlZZ2FiWDRYNXlSTUg2TDVEVFBnbTlQd3pXNkpP?=
 =?utf-8?B?VGJrM0Y4UDN1Rk1HOFAwQkVIblRCRjNIM0ZMOGlpZ0c1TGdCRVNRZFRadERF?=
 =?utf-8?B?by9tVW5LMkRLaXQxM3ZWN2gwbU5rVmNXVE12b3NlRjFiWURCTzJRYVZLZDhX?=
 =?utf-8?B?NVFQTTJQdDF6L0hBL3BqeDFxYlFHQTdiVXpXbDhoOGpwNHZUc0tTR3NkYTdl?=
 =?utf-8?B?RkJYWWtIdjhEdVhKV0pGaTlwOW1KejNudzhrR2w5My9DWkVYZnRnc1hDcG5o?=
 =?utf-8?B?UnR2REkyenEwZnE2d0hnbXNna1pSaWpTdUhNT2RDQllpUUZjNmFNOTZ4MmdW?=
 =?utf-8?B?elRUeGhxalFtQU1GbHVvMFRRNmc1eFhEc3h3OCtTVUlXWEVrM3hPTnE5U2Zy?=
 =?utf-8?B?ZFU2dmhVZENLZ3ZZTTdjb1cvYjZUMmdkT3JLNnZLcURCczZHa29SUklzY0M5?=
 =?utf-8?B?VDMzbnZLTm91aDBUZXpxZmM1OVEwcG5sTDB5SmN3YnVna20wMWFHVm5NdkxE?=
 =?utf-8?B?OVlEQUxKeGZLc0xCZkFaV0RWM0Q5NGs5dXZYdENHRjluWnpHbXpPWEJSb0h0?=
 =?utf-8?B?UkovWTZvMW5RQnpBT3htVUNza3lpL1Y1TlRhSEdyWEN6Y1B4Mm0wYmVheCtC?=
 =?utf-8?B?eFVhckYrdFJXdjU3TEJKaHEwdFE4Y0ZJR05DMEx0YW9xK09jS0dHRkppNy80?=
 =?utf-8?B?UWZ3bVMwZHdkR3p1TEtiTG05RWF1NGdwVnpsdTdYcEY0UG9aaVpVM1ovelpY?=
 =?utf-8?B?YnFDTUp1blJYQUVDOEpSNXdZUmQ3TEMvMnZlbEdnYy9ld2RsYnAxTGhOa3Qv?=
 =?utf-8?B?OG5IRFpTMGZHWnFMdlpTeUI0YmNYS0FOVWoyMWVvZGpGOGs0WVJhWjFUK0ho?=
 =?utf-8?B?OGV6c1h4S0N6QkZrd1o1ZnVpME8rM3dNYTl6MEZYU0xFaFNiQXppMGVreThT?=
 =?utf-8?B?dGRNNFE1eHVaSi9SczdJaGlpRmp3dDRvakJNY001akg2YjU2Z1dCRm5kbWE1?=
 =?utf-8?B?S2dNZ3hvQVM3RzJ0U1JGQlpQdHh0OTdXbGNIZXFYUEV6SDFuZ2c4azJnVVN4?=
 =?utf-8?B?dmhKZUszVEdHbVZseFVHSWFyNVZMQlNoTmgvWWgzMTRjSk5TcGpZc0UrZHlY?=
 =?utf-8?B?VzNjR29RemErLy9XclMxblNNRlMzRjJqWCtZRm5tYXhYU3NBU3ZjaEs0cnRF?=
 =?utf-8?B?WFFSekh4dHJCQzlWdmo1eHRVZ3dCcUxxM0djWEhhQzlZSzlLV0VIc25pdHZ2?=
 =?utf-8?B?M0hFWk92VjRSazN1UjFJaUsvcVFZbVFiMHI5c1NRU09tS3FMazkyaUtkbi9K?=
 =?utf-8?Q?/lEGbwzy567fm1Z9ZwdjtHGst?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 806feb09-f4c0-4ab6-4aa6-08daf21d13f2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 08:39:53.2715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +VVuD1v/xioKYOe/J9Azpjz9bbirBzhKmjrhPUbnElvBp9HjAh1WO2mZvdZMrNr55sOLOsDkKNSw1DVqS1v69g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7093

On 06.01.2023 02:00, Andrew Cooper wrote:
> On 05/01/2023 4:04 pm, Jan Beulich wrote:
>> Perhaps these should have been dropped right in 2fb2dee1ac62 ("x86/mm:
>> pagetable_dying() is HVM-only"). Convert both to assertions, noting that
>> in particular the one in the 3-level variant of the function comes too
> 
> "came too late"?
> 
> It doesn't any more with this change in place.

Fine with me either way, so I've changed it. Iirc in particular George has
been advocating for writing descriptions in present tense, even if in the
course of a change the stated fact changes as well.

>> late anyway - first thing there we access the HVM part of a union.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

Jan

