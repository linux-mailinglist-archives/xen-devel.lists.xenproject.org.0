Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F72666DAA2
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 11:10:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479299.743063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHivH-0003bL-OQ; Tue, 17 Jan 2023 10:10:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479299.743063; Tue, 17 Jan 2023 10:10:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHivH-0003YQ-LO; Tue, 17 Jan 2023 10:10:31 +0000
Received: by outflank-mailman (input) for mailman id 479299;
 Tue, 17 Jan 2023 10:10:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IWGa=5O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pHivG-0003YK-4M
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 10:10:30 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2070.outbound.protection.outlook.com [40.107.249.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2af97631-964f-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 11:10:29 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7880.eurprd04.prod.outlook.com (2603:10a6:20b:2a5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 10:10:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Tue, 17 Jan 2023
 10:10:27 +0000
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
X-Inumbo-ID: 2af97631-964f-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XjZI9SseASnBqWI4aSsmRxpcpwRE/zpOsuEEm5DRHq/EOjRTd7OCE4BDg5l/5Pc+uucUUPVwvLIZqG0SAuhaG74M3IkKJg8f5+FAW8z7edUBfDDTypf8VUjWtnShzkThGl6HZaiItRhdIWeGJzlEdlqIUjM90T8yk+JQ+8tVvMRTppXxi7Gzxxt6Cg2KsE1HjcoLksuDSYxTkaLStSAEEP/VGP9Smee0/7dEgl+bWAHgynECJbKIiGVw9cSHorG+Ir5+5XdxwwxP/jpA0qQ8w4Sw9B7pUuouAc4k1D8vWDDR42vZG5nFlkfVogblO427ZapBLw3/W6JwGn1DqeFkDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8uhDYCizP86w4i/B2PdFA4z/3S9n/2WFsq/Es3tf4EU=;
 b=IrIvZVvtETp9h9wGtNmIIAJl9ADZHCBfvpXt992lbuzutswyaanosOdhNs8VjDMEs5BVVgVaGp5SlhCfi2jzB83zfaAgfTQjI8A+VEduj08G6CUUkp/SUkl+t8e/k09LjXmmNYKr3N7Pubvldi5uueHBTHxnjyjnteBsyIgDu2N3BRH+SgDsIu1/DygzFmiplwHI+zkYv3QY8AqQJNu2ZUSHl0g+AicT/mfk5gng4aFSkJos+EaShr2m9KLr9cQngms/4oKN+Id7cJkD8lzRZeQkczDCVop4sijsFXeJff+ZndVWgvu7z8m0VCWq4ADB3z9aRFD9c19GbFIXgwmZvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8uhDYCizP86w4i/B2PdFA4z/3S9n/2WFsq/Es3tf4EU=;
 b=EHxZk73NJcJHdlZJ6636HsWxIIHBepBgM4wnFiiwKmFxsteJo0cHj12XUMoa6tI4yFEztl6bI0+3/S0Qxy2jmnfU6MFf4GfNGviHmvLXBZzci6avbysrit/ZsWUO95NIHcyKpgPqCCkfz9z1yoyTIWF6jztJICNEWEZCHEiwcUK2D6mkSg60vxLV8vSYKUGOKYrxuugG4ckEWN1rWxKhLUfZN/rGGgD6OZw8d+ZQbWj7kjPl1hS4gZIgiUdJuYycUOXXTdWbPC3gg5mpcPBrTEHxckYLVXqAS5BT4gcv85/Fkje+Bz+5nAqiCH3W9wUA43Zr08ULHIfkCcbpZ6XZHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0d7ed55d-11b2-3a40-9b4e-2b52fc5a5cac@suse.com>
Date: Tue, 17 Jan 2023 11:10:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/9] x86/shadow: replace sh_reset_l3_up_pointers()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <f17d07b3-2558-70b8-9d1b-b599a54a2d59@suse.com>
 <d91b5315-a5bb-a6ee-c9bb-58974c733a4e@suse.com>
In-Reply-To: <d91b5315-a5bb-a6ee-c9bb-58974c733a4e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7880:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a68bc7e-f6d3-4d00-98af-08daf8730e36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FHghy3YJakVuLiP04OtreIbw8IinpJAOHrWBha86CPwn5mfb3HfTW7ZZeJlzT4Rp+hsopB1FqHWzeWhaonRPDGbwJQ+3juhvMYCFCJuaZwJdbKBIJs6sorH3Qx+OmI6AwpkVBG5iguz6j90EBDfb1bXpHVrNnTZQMvGmiNwjR8+FwkOoPEd43VaxGR1IU7tw9GfDx/d731i79lVcXY0pQKHCH8AKNIIVv9iUwmkmIJLAmUvKau5kKRwLiHAn9AFBg299H/3uIh8cWZBGtR1+JuY2yypdfGgQiWOd7HJ3rn+t70H7nGW8MzWRwFEFB5w4O5+njd3EtMOM1e9ilmV57wj4NofZhYNLijpCfLptC9qTHYfZgzQHGco+MhDC8yq7zzU1USBkrnSrTOqkLCqPvYQUlPaqb5ftmubn4eg9S3RqV5LyZ6gCy9EZ2tA0CcfIUC9myAy/uGYyMJWBQE1DBRx58ZW/a0naVGHbA1oOh6hNhmFUk6DTm5AT9AcJwCdbFC3+yj/PjmtL2dSir+Ls3/IU0RLWr+55L4fVqRzfvawwQZYi0fumC/leFLqqvB4ts4s2ate2qVA5wWI8zwi7Zro0OfiaSG05yle06i321BIwjDzxnhDOHVt0ttEM62rvN2BlqYTi2uNQtKR/16l3/uf8V/WpPwSSgvO78YdCSmqDZvYchgQFfC7S9w3wFq46is/wtwanfjeOwMEBnHbSg5fmlf0AfKuwhtCV8rbhlz0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(136003)(366004)(39860400002)(396003)(451199015)(36756003)(53546011)(86362001)(186003)(6916009)(4326008)(6512007)(8676002)(26005)(66556008)(41300700001)(66476007)(66946007)(2616005)(316002)(6506007)(31696002)(54906003)(478600001)(6486002)(2906002)(4744005)(38100700002)(83380400001)(5660300002)(8936002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVUvWEZSY1NxQmtReDNOaTM4V2VpUmRleHViUGkrV3FaOGJ1V3o5U1NOM041?=
 =?utf-8?B?eFF6ekZxbmU4QjVpVk5obzNIZWxXMzlwZlFqQWNOc0tVYlpXT1U4bEdFQUlX?=
 =?utf-8?B?VmpqSVo5ZXdhT0Z2SThNUFBDdHpZVncwMk9qdmtHUGRmTVI5elZFa3pmdG9y?=
 =?utf-8?B?T3BPak9vTkVvVWtqVm9URFl5bjM3VTV1OVk3eHpBQkg4L2lYVkdQdk1qa3Vv?=
 =?utf-8?B?ekU2cDhHOE5KR0o0UU1aZ1NLMUxlTG9raHJEREw4OUpBMlQ2S05kQjVnZ0NO?=
 =?utf-8?B?dkgxMXN4bzdmTTR4dEtOV0t2VGtuWEVTRXA0WkJYOVNISWZjSGM1bnZpd1ll?=
 =?utf-8?B?QnpWY2hhZmlCWHdYRWZDdHJnUUhkYm5saHZwajNqN3I2M09zZG1KOU9vRS9U?=
 =?utf-8?B?TWNiTEhidUxjS2c0WEo4OGplT2tLRWh3L2JnZDlsQ2NodWt1UjFoYmFIQUhW?=
 =?utf-8?B?eHhmczdxOVhOa3ZNSWdKamxPN0RpdjVLTzhhWEJWRzZBbWpiYkJSRE1MZ3M1?=
 =?utf-8?B?Wng5aGpTRFlUS0ZkOVdtVmtlNUc1Z2J4dW9jY2psdjVwT29BcXlER2VmNnlk?=
 =?utf-8?B?eElib1ROYU1xL01NdDVpYkRGZk0zc1VFKzNqYVJZOFJONE41VUcxK1l5VVcw?=
 =?utf-8?B?eitueXdwUkRWRSs5eW9pWGdldE01UWRNQXNvQm9ZRnR6emc5ak5icks0S0l1?=
 =?utf-8?B?K0xRaTc3dm44S3RYMkJTaldNcVBDU00yU0tBOFhrNUdrdWR6NmhYSTZtY3M4?=
 =?utf-8?B?WUwwc3pxc2x1ZmN3aERSOE5rYWo3bXBQV2E3a1BTS002VWpPYktoOHQrTGtC?=
 =?utf-8?B?dGgvWlpWZnN2NWxyaWhTNE9lY0lTS21sbFU5dVYyU2pKWi82STB0K3RtajlE?=
 =?utf-8?B?SHJYWHRwc01Mb29Jc3lMdk1xcWtFeEZBaDNuMDRHb3Z2RWd2RlI4NW5LSjVm?=
 =?utf-8?B?cldMd2NIdXE1cXYxaWRFbER5alo1NS85TThrN1p3cFZnTzJqZ1lmNHBvSHF1?=
 =?utf-8?B?aFFyeHZ1cGxQYlV6R0VTanVtSFRydkwrMklVS2JhbW9taWYvallqNzFvNzB4?=
 =?utf-8?B?eDBEaEVjTHBXRXhPbVVRYURDV3cvdkd2dFRpbCtXMXIzazJZN0JUWkIyRFQ5?=
 =?utf-8?B?RGM3MnBTZEM5YU00alJZdXBza2dhZ2t4ZkJBc2lOQXAxbWxuU0dVMkZQYWRn?=
 =?utf-8?B?QWttN2QxTHltbDFaM3h0MENDdWlvazRyNWxqZ0tuREozd2R4TFlsY2Y4OEdQ?=
 =?utf-8?B?elZXdnJOekF4azJUcTFMdTNRQStXbmUzRjc4WnljZVdqMWx1RTlqS3dBNVJI?=
 =?utf-8?B?dUlyd24vV0Jkay9kcU96U3lyZ0l2QlFNclc1TFB6Y3JHQVExellxVkJkWmdk?=
 =?utf-8?B?S3VEb2hxWC80SC9JU25IZHJIeno0VGQ5R1grcUpBY3NKbGJUOTBPMFdqTHJF?=
 =?utf-8?B?UXhsWnd2b1R3Rk0vNFhaYzdJOVBCZEo1YzJTN0lzSUp5ZzNEejRUVlFEeTZt?=
 =?utf-8?B?eHpnS3B0WDFxRVBnMUJaajdrcFFhcU9WNEZMczFIbW1RMXVSS01SWXEvUHBx?=
 =?utf-8?B?Kzd4aUpuTU0wSHVSS1VOTEtXa0RIUXZsYWpIQStBRVpTNDFUWVh4WHY5UDIx?=
 =?utf-8?B?RVFFWUFEZTZGNGZUa21kdTFPcjdGM3VGVTBFM1daVmJQT3dVaUdSMVh5eU5y?=
 =?utf-8?B?R1ArSWhlUFhQVGJMY3crM1RKbzhmZ0VQM0MvVG1Za0hHcklHd3VuREVXTXEy?=
 =?utf-8?B?WERSa0VGbXVxRWVPRnhPbVROWXNkeFRoYk9FRksrVTZBdXJMcU0wVW1lSXkr?=
 =?utf-8?B?QkZWM0hiVnNNV3c2Wk1mU01Td0JEL1ZIbGlwUEg4NWNZUTUrSVZGbWszOFpy?=
 =?utf-8?B?QmhHdW41eVRISDdkbU1HdE1YY3BEc0FORWtGTStnY0pmMW5uRmxWNUFiM2c4?=
 =?utf-8?B?QURxcnJ1TWlDY1RzWnV0RTJCcWQxaDRpZWhxc3NTVjhMYStLK29oT0d5ZEZD?=
 =?utf-8?B?a203cmgvY2RpeGlncGxlVXZId3NOSHl3UzJmcTFMU1Fublpqb2ROT09qUkRK?=
 =?utf-8?B?alJVeXRaekxiWWhNRE1SVGVJamdBOUp1TXhSUWtZdEpOYzU1Z3BpeVpEYzEw?=
 =?utf-8?Q?FgkIqCDN0vz0CGNtemYMF3Avs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a68bc7e-f6d3-4d00-98af-08daf8730e36
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 10:10:27.1607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CF46I5qBOV6tT40AkNR9yCL6071vOUnBGdgHZJBwjYxLHtA19lt7SnpdDnDmiqJDZBrzqrSL2imzAopxJ9ymQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7880

On 11.01.2023 14:52, Jan Beulich wrote:
> Rather than doing a separate hash walk (and then even using the vCPU
> variant, which is to go away), do the up-pointer-clearing right in
> sh_unpin(), as an alternative to the (now further limited) enlisting on
> a "free floating" list fragment. This utilizes the fact that such list
> fragments are traversed only for multi-page shadows (in shadow_free()).

I've added mention of sh_next_page() here as well. Not sure how I
managed to miss that, but this doesn't change the reasoning.

Jan


