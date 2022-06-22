Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BD355452C
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 12:17:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353717.580690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3xPp-0006mo-Ee; Wed, 22 Jun 2022 10:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353717.580690; Wed, 22 Jun 2022 10:16:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3xPp-0006jM-Av; Wed, 22 Jun 2022 10:16:53 +0000
Received: by outflank-mailman (input) for mailman id 353717;
 Wed, 22 Jun 2022 10:16:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kzGk=W5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o3xPn-0006jG-UR
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 10:16:51 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70047.outbound.protection.outlook.com [40.107.7.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e62a0be-f214-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 12:16:51 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB5643.eurprd04.prod.outlook.com (2603:10a6:10:aa::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Wed, 22 Jun
 2022 10:16:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 10:16:49 +0000
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
X-Inumbo-ID: 6e62a0be-f214-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9PHbBLnTnufEtHlDV03m+jQOKBcuolr6c/w0O/08QGygVfXB04/pG1Fqgd7YbVdK0d9m4D63JBeTd/TIUh+55e2tqV8NDAce6XDRpu1dHp6UuIGePpX9zy8sRiBnNltY7qt7cKynnWp4OwHimQmtHqCi7Dlccl57ZWzOwcDsBNDncklqKLVaUM2D3RC3dObLEz+m/B+t6MwsEroW7iQ3JZJ6ZnSTF8WI7rHEAwWPHCIcSqAmoapMEpvGcmXLQsEBZmlfwsiTE2R8IzppLLVGsdiQ8cmAFpfUqsXJt05F5PoQP7eMIVghqPVfI/Oganr8SLuKw8vdumjXQmTyRxyEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=voXfmZ3qSmVDqG1NrDJqP3vlhexvEkCy5iaVtnIIr2o=;
 b=hBmkWBokU/6Ya6xafVjsCHG3Kk5ttProzsef319oV0am6USro8FZxClqFblWI/ly90dm2Xu4hTFrrWTcM7ZM9VDeb3ZdQ/gWSMxQNlMd8Zzl3sRCuspEfJOHnufjSSpZgNGYDAHj5YsWQYxu0USwo8aEGR6fgg3k7HQDI8asj1hvJYJNRzEEdfj43cOrjvIzY6DxriC8D5DE6oOQaTdo4FFtquGhPc36rAxOLhK1xt1IkKRHquF68tz4RDmu+vo1u6o3oaiwW1Lk+b9cyFs/GzlRp3NqoiNeDJ2LYfs9zMT3Wi4X5yOD1iIGC1xLQFbUOKFS3UG7kyr2+abXealLqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=voXfmZ3qSmVDqG1NrDJqP3vlhexvEkCy5iaVtnIIr2o=;
 b=qA0jrJnI7AM7qWL18tmVEinCSHXD1XtW8uF9Vsc0A2gtvwDGW2Je5ygPOiyFcSFGJ5BHMkghpEoBgq5znWiMh2abTeHNg29ZKJZ+BI+ldemI0k89cERsqOPlBWYkB7xZNw7enpmMBf7DPrz1R5Mj1tp+6fbW3wrdm9MwDyD81ffb5wPTHabdxJ0UFPKyqMwqf6TZPp+fn05zli7bxm2YZIVXeIWAGSZxpbxqkxQs9iRcbU0iMRuHiaKbrbk9f+St2U9a4lHSsJi1+F2eLsAJOiHvCTB2I2T7epv/TT/LGL6K2t9B33zVp8k0DsVWp+LcCK3Fkk40zOeO5V6szycgxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <386e765e-8bb8-32a0-9170-11db3978a17a@suse.com>
Date: Wed, 22 Jun 2022 12:16:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 5/9] include/public: Use explicitly specified types
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220620070245.77979-1-michal.orzel@arm.com>
 <20220620070245.77979-6-michal.orzel@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220620070245.77979-6-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9P250CA0015.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:532::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51806fe5-ddb0-47d6-a47e-08da543851ad
X-MS-TrafficTypeDiagnostic: DB8PR04MB5643:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB5643D29DDDA6D5541541EB22B3B29@DB8PR04MB5643.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6wsIJATwlC9nqIrkKkLPt1CENdpsNL/BCWYf3ynaHNZAPIFE6vvYvpnAPXZbHpUbUQrGZkcN+/f94Y4nC3WF6oKeLnmBGH156F+3h947mLLMZQf4lX0H7FX2bQ4OUiD/2/AjDJpb42ZGA85nkT6yCZr654YtBByenPjrKT2kQusOTbXgRNWDNP3IPuiBrvcoWdCMWiT2U/pHLxJVqH5HZK919QNhydVRzq56AJlgaa/a9+cnFBgyf8fUC8BcyFCBVFMDL5aT7WKLAJb+hm1YU5zcDR7+1Sj2peI1UpBxMjDSRlB1YSkTCU34eU6wD1GvdcaFLiI4xsez4LSP0qgwmfLNYH7muIBUsRbYSx6B3OABNsIRNsiZ3Jy5W8p/yO18HPS9lr18Bz7gtrxudgI/2WyYRGqGocCtPbfH5ebOtQ25FXthL1oQF9aDyX2UvjMdbyM1TNJM/7LZY8zb3Om3Oe5taU8XlBFUV32+q+ol1ob7u/XMFgxly7hT2NYNbnVKgpmuTwxLp4FAVEr4KlCfLKjwP0YqKXsbFuJWIzOLHiovinXxNXbDyG0Lfb2Z9YVaWbeFkoeij5BV1MW84MXvtbJVDHu3dsVSoa4A8ipnGYmrB6yqG6uhEqs1gQqxya2uXzxj0/mEApgS1d7kcGTmXzv8Lc4zMc4GuuJD3Piupb/0/M9U1GaUVBWzNQf6O+1mP0HLgjIw0+s8DM38Nzl0pf+cZucAtJU1MR+6R+8qlhaua73OEcig2dyQjmS1l4/OHLm+scdSpki/YZQxXY+Pd4rNWsA71NOvNA45qZTDAIM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(396003)(376002)(136003)(346002)(2616005)(41300700001)(8676002)(66556008)(4326008)(66476007)(31686004)(66946007)(316002)(54906003)(6666004)(6916009)(36756003)(86362001)(5660300002)(4744005)(186003)(6486002)(8936002)(478600001)(2906002)(6506007)(26005)(53546011)(31696002)(6512007)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NysrNG9YZDl2ZjVqTE0zNjZzdG1Oc0orVmZDeEMzTGtnd3lWb2lMd2F2S3Fq?=
 =?utf-8?B?aTJiZmtwNGJaM3RKenVjQm90TUIrb0VLeTJVaC9KNktJVVdDV2g5dmNJNy9a?=
 =?utf-8?B?YTFacTBDTjRzSjc1aEJiK0prdUprRDBLV2MxZGVhZm1laEdnbFR3Z1cwZ1Zh?=
 =?utf-8?B?aXFMbWFKTDdJOU1Hdi9nclVGWEd2ZzR3cUI5aS9haFM1Z0Fvd2dyaHBqbjFR?=
 =?utf-8?B?MEt1VFFyU1lpTnF3RjNBa2xDbytRcjdyQWZnQi9aZzJqQzV4cllIUk9aV3pi?=
 =?utf-8?B?SzZSbWdkSzJsYjY2cm1KUDc4S3gvZ3g2QXJ6ZkJVd21wdFhtREppMmhBNGhH?=
 =?utf-8?B?ejZvUVd1MmpYUnMwMHZrZWpYMlFzVFYvcmdKdUdXOHFDUEEwL2czY3ZqQ1R1?=
 =?utf-8?B?ai9iZ2VFNVVFSTFmT0paLytRTzYzMUFsS25vTWpLZmRjcmhTb3J3SVpPSUd4?=
 =?utf-8?B?enAvbkhUMDVYbHJXajFSM1ZkYlNWbTlsbk9iSDFsNWpOS3EyVFJ2TWo0MFlu?=
 =?utf-8?B?dDJxRlFWMFdaMmlMaEVFaXJGdnpWOGlFK2lld3AxQmcvYlQwM3dDc2hUbEdO?=
 =?utf-8?B?YWFxbnYzYWo0YkRKVGF1bXM1ZGNzWVNSckUwSDBSUERSMnJ1Y2Z4cXRyZlBi?=
 =?utf-8?B?YjNqdnFRWHplcWhtVlNSWSt2YXA1dkVGeVVmcE9WWXRxeE5Dd21sa0QwdVlV?=
 =?utf-8?B?VmZuT0diRjFzU0FKaDV2blUxc2JBcG9SS2ozbWJXMThvanh6SkUraXpWZ3Uw?=
 =?utf-8?B?bzFEbHFxRGRiZ2dEclBsQS9OWGFJdTJwbG95aWRUS3RmdWtoMnN0MmxmR2Zz?=
 =?utf-8?B?OG9zR0xCNDBXVVMzNHFISlBWaEtldUxrKzhLdFZSMXJ0a2lCTFZYRG01OHZS?=
 =?utf-8?B?UXJKQXRvMGZlQ1hKaGFVV0ZSOEllbTdvVllOSk5TYWk1MkljMTBjWkpRQWk1?=
 =?utf-8?B?MHpRWFp2bW5DcFZHcWZ5NHZQbkVSUjh1WWtiTHFrYnlTcVl2MllueU9Cbk0x?=
 =?utf-8?B?T1crTjFMS0s5NU9PSXdPaVlRYWtkYkdmdllDRm5VRlEyWUlqRExweXpIbjhM?=
 =?utf-8?B?STcrTUpkR0swdFlNNGYwZitYbVBjQnhKQlBMY1QxOVAzUDFPYWdRWUMvWWkx?=
 =?utf-8?B?Z0doRE03TEkrb1o2Q0kyczNVRWxCUFlsamMyVzRHNDJVbUY5R2NJNW9Ja2tv?=
 =?utf-8?B?L2ZqN29aTkJKMzEvSWdtR0czZnUvVDI2RG00ZnF3cm5PN1UrQjRSUitLY1pB?=
 =?utf-8?B?d0QxRVNTWExkYkFCUjNIejZaelJFQWZuTlVjN0RrcVJXLzFiQlA3SWMxWE5N?=
 =?utf-8?B?bzZ6S21yamh3UGY4MFFwQmxRL1B6eU5BVVczemp5alZGaW9ZWkI2THRRdjBZ?=
 =?utf-8?B?ZEtjNmp3TVpMZGlvZVZjYzZZK2ROYWtQRHk0ektQL2RocDZjYnlOZ09wMnlZ?=
 =?utf-8?B?NHlnTVRML0NoREhiN0JsK3pRRlVjdFJKRVBZSmlSUDhQVjRGa0ZLL3VyTHpz?=
 =?utf-8?B?dWR5U2dhc2RjZnJiK0lKNkxUYktPTFl4cnFkbFF1Znh1c1B2akVMRFp4YlpQ?=
 =?utf-8?B?YkFtRnFpTHl3bGJFTENBMUNGMXI0MkxUdk13Sm5DVEJHTVdQclVleEtXVU1p?=
 =?utf-8?B?c3RtZFI5YVhIdFZUb3dNMExSUkdpMG1FaDA1OU5HQXRoK1JSSzFtRjNxQUpW?=
 =?utf-8?B?dmhkYUwyVmU5SU9NMUkxM0ZJL1ZoeW5GOVhWZ05qOVliZllodzMzRjRSOEsy?=
 =?utf-8?B?Y1VIVkEvMktjNlpNRHBIWTBtT2ZaTWh0d0ZkR0dtby84RE5iRUpFZTBMSUYv?=
 =?utf-8?B?OG9EMUhHbW5rK3pERFRZVHNhVXllUllJYmxqVmE2cGNKM3VQT2tOZnhFL1d4?=
 =?utf-8?B?ZzI1VHlyL1ZRcUJNMTAzT2RZWndTZUVyWHZwWWtRQlUwNmJlVnZQSXg2MmN5?=
 =?utf-8?B?N2o0eS9KNWlKUktrSUpiUjVUMWRjcVRwUEtMY1hvbmtwMHpCcklGRzUxRzBy?=
 =?utf-8?B?eWw2WWdZWXpRM3cveXVrclBxS0JnVUI0UjJieVlBWEF0bmZKRTlRQ3BNeVM2?=
 =?utf-8?B?bHpBYWhEMUs1QUJyQlFTY1g4aXpNRFI5Y2lmdWZVc0lIZ0g3cTRjRGxMbXI2?=
 =?utf-8?B?b3U4NlMxcFF1MVB6ZC9rMnNzVzZSVlM0dnI4N3hoTG1tUU1KODdqQ2lzV2ZG?=
 =?utf-8?B?ZjJ4ZFFoa3lxMTg5WFpyQ1BtOWVacUtFT3FEMzVYOXIzVHhQRm9OUlZxdTlH?=
 =?utf-8?B?Tm43WWhxNDFVN1JMUGhWcmpjRnIzSUlvRENQTG9rd1ZPZTRJMVcwYjludGxX?=
 =?utf-8?B?a01JTDlCU2VLcUhNM1dTRFVpWG9XV1lobnNOTXQrNzZ6Q21FRnQrdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51806fe5-ddb0-47d6-a47e-08da543851ad
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 10:16:49.3769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jXxcoCrVzB9yzPZBKfaoqYJwUb7lHgAoPDKESJrnEA77efDqoJ2RQ36fgU9E76QDUNTUF28gsc0UXVSFDGDVAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5643

On 20.06.2022 09:02, Michal Orzel wrote:
> --- a/xen/include/public/physdev.h
> +++ b/xen/include/public/physdev.h
> @@ -211,8 +211,8 @@ struct physdev_manage_pci_ext {
>      /* IN */
>      uint8_t bus;
>      uint8_t devfn;
> -    unsigned is_extfn;
> -    unsigned is_virtfn;
> +    unsigned int is_extfn;
> +    unsigned int is_virtfn;

It is wrong for us to use unsigned (or unsigned int) here and in sysctl.h.
It should be uint32_t instead, and I think this is a great opportunity to
correct that mistake.

Jan

