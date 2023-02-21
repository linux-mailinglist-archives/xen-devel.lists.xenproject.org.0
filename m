Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D5C69DE74
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 12:08:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498766.769673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUQVc-0002er-C9; Tue, 21 Feb 2023 11:08:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498766.769673; Tue, 21 Feb 2023 11:08:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUQVc-0002d9-95; Tue, 21 Feb 2023 11:08:32 +0000
Received: by outflank-mailman (input) for mailman id 498766;
 Tue, 21 Feb 2023 11:08:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pUQVb-0002d3-2B
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 11:08:31 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbae7cbc-b1d7-11ed-93b6-47a8fe42b414;
 Tue, 21 Feb 2023 12:07:52 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8782.eurprd04.prod.outlook.com (2603:10a6:102:20d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 11:08:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 11:08:27 +0000
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
X-Inumbo-ID: fbae7cbc-b1d7-11ed-93b6-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z30V7QMiDnKXkPwEAGKTNlDUE8xJa1GnNJKf5KrWkJaTSvQ3K4r6qmy1ahB2Epjbn/HZpr3GpVrWSy34xIdGI3o+QjwKmGEdypa2aQrQUjG8UmqBVc5ksapkvLPtC0/evTBLuVVi5rZrlpuLTBDOf7gvq9mYzic7knKzTLMjTFuouyijGbxSbv7ZWAV/vMEotJC+TzJdg9YE2LpC0dOZ1pDP8z5Txlnh7lQnUNAxZIDVHfSn0DgphnHBAdY1nbMVe0ZLgKwukQSbHpxJIb/HMS8f3OdhFTpl4R5ru492wLssezHTpC9EAc9aIsatDQzhIfiwTTnfrp5jhCjIvuuRJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HyQhtl55amC85ClUqlqFMX619EtzJopA5hlA96JbDP0=;
 b=ETIARZ3ZlcU2RwhAFd3dI8UXV5NsOlBB2mvLDGIn53177OM7eabor2sSdEyunQkLhofyohSwnb5u/u44eI/9SnprUDmwSNZSq1PDNADjSd26Vuaee1E6aLoe/p+weqvbOQq0yP19CdyidFZxVqg6NWecmLlxc+MX2b0HxSED4tpCab2VLx6KQi6IwT6HLi/FRLivRUxROUf5mCHK3fnTnJvXYeznc1g5AVSA3r/98l0TkaZS5oZun2Winz4M7xqDxzw3zWpU9+ypc8pJiuFZGZBq/I4GuOrSx1b1oys+rttwM7apl7VxnyhR9DVzyPa6sXsDcYOLtewCbf2iIg6skA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HyQhtl55amC85ClUqlqFMX619EtzJopA5hlA96JbDP0=;
 b=RiW7OiYUp4XKmzMeNpVOn+iOH3gtHgT1rrtAyZQO3q+fsGg6Q9RPgwr5w3WLPR36aGG2Ageov0fF3gQnSytW4YreybFAoo/2IB8h+QhdTpiEDwWHlrse9fVIa1VSn4qvBtZvOBRSwgv13FY+BmK3zwP60YtbrX145MvNzH+A3A2mUMRNskwsZH3xna62bIxREB6dfKGBSk4YeDnqd0ckC2SNCct0WSt60av0QLSj7rOUh5kPANr+JM6hDRWxsPwFi71Ofk0v8BZh48Ke2p646Ek7j+p2ymEEXwxLRYZybyG/NW/pqnbTLQsJAxMJslqjDczxmMTIjOHECtHDMPyK4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0939d140-a6ba-02f5-09d8-8aea961f5d51@suse.com>
Date: Tue, 21 Feb 2023 12:08:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFC] xen: Annotate printk() as cold
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230220131325.1524786-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230220131325.1524786-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8782:EE_
X-MS-Office365-Filtering-Correlation-Id: 87eb3930-b57f-4abb-3fad-08db13fbf4d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AHDT70pTN/Uo0DVUd2F4lksOnRS3H+B4GbmI1g0YAO33Ut9tpNmmEeZuVh6igD/kCPGMYzVF+cNj0qkwoTGCeojPljmXUOKA2Jj82hbqnq7QD2c8eppXVI1hRQ7JrIr9t5r+QmAvTObIFA91uOB4qUHiskyWuZIsacVfPqhqE9D62iWb8/m6eOFHvTmj5buCRojuGbUyQHaSBxnk3VGZ8PF576A5FNvRTWDBc10Udq+9mDSruHgT7aawEiEtYeCORwRtr5I2TWDdqRA1NqBUM2tG4XziJBUZOgoNbOkhmibZPXdw9Av05kP1MgpdVbTRgHRPneoZO9f6gqEP3aBmbv3oFRg4+pdpLzFigMal33VyGwDKu9X0Q/o6XJgnEi8SdfujTz06I00KdGA8gVK58eQGdVS8ew0qwNRH5BLyLu4kMIYpaTRM7a5S7DMtZrECv2bP+9jANDwv1g2aC0emav2b9fAv+HCiid06lYsVmeqOK3bJeUf/8tVM+PaPdphsMrZiFP8NAVK59AUrTI8NbmT0ddRB0Qo5dl/J1LcEVBRKf1SZWl1erfDJA4V1iLKh0SaT1JUJZiuURsglm/XmGTlxBlkylgEKH5udz2ITfCIyk9z1HuFmLcuDLfDiCTFBLkSzPEsHf4vfkmDxpeRZulBedgOMwhReiH3QIyLlqixZcwXbPfSHwRFEEh89dz9E1LxieVeZgZc+JVIps3s7jj9jbztQ5vV8lZQai21aHFh49PduUDuPikbpXBcTfT9JkFJKC1A5Ce5rrtDbLseFM/gewotvVNpCkMqobr8W0cs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(366004)(136003)(376002)(396003)(346002)(451199018)(41300700001)(186003)(6512007)(54906003)(26005)(316002)(53546011)(86362001)(6486002)(31696002)(478600001)(6506007)(36756003)(2616005)(66946007)(66476007)(66556008)(4326008)(6916009)(8676002)(2906002)(31686004)(38100700002)(5660300002)(8936002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ditvQTZnTEJacWdzNUJzUU9lNG12WDVLekxkSnZNakhPd0JzbS9RZU9PZnVL?=
 =?utf-8?B?R1pGRE9XbGdiUDgzYzBLVjlScHk4VUc4L21CVHgyNUEvY1Vqbi9qa0tHbjZa?=
 =?utf-8?B?WlJYNWh2NlgwVjY5ZTJoSTBadDZ5Ujd4MDVrUTZZbm9INk5rQW16ZkRFeU96?=
 =?utf-8?B?alJFb1VpOW82MUVXbzNsRnNlU0pySGVaQkRINU80Rm8xYzdRSG10SStyUlhT?=
 =?utf-8?B?dU9vU0FVSVpHZnNMd3VIbUpKTURYWUh3RmtzY1diNG5yczRPbVBqWHNObjVs?=
 =?utf-8?B?eVJDTGRSNWM4cG1ML3cyRGlETWRlVVU2ZGNWUVFKSkJiaE9uVi90ZjlKTVk5?=
 =?utf-8?B?YmZnenNEc0QxOG9vdXhUR3RucUtxekJ0dnJQRVBuaHZMYUtmVGlFdUgySmF5?=
 =?utf-8?B?d3dFbWZLVDcxa3locDh3WXFPSFlXcStWL1lvV3FtTUpFVDJiZmc4dlNvdlBx?=
 =?utf-8?B?dkFDcURSV1VnamdtbnRFVS8rb2ZHY0h6VWFNVzZHOWh5K1pvTkFzTzIrSlpH?=
 =?utf-8?B?cURaYWNLOFlzZStIem5uOEdSZ3loUFhNdHU3Q0h3ckErNEtpNHFRYlQzZ0pY?=
 =?utf-8?B?ZENHdHdFTm80SHFCaE5XWExNUDhkRnhVRHBJU1ZwTmt1N05qQW1QS0lyRm9V?=
 =?utf-8?B?Wk1CSlZROXJwQUNDdGJMNnQ1TEtUVWlkZ2QrNURRSExVTmd5SjNtb1UrVEx2?=
 =?utf-8?B?WkZhbFpUYTh2M01lODkvempLQzRQSVFkM2FQcnIvM3E4d3M2MkhEaW5yWFdx?=
 =?utf-8?B?RVNoYlBSZTc1djNaU3Q4ekhXSnlOY0dUS1l0dzhJMVRteWhkaXQreUlSekNN?=
 =?utf-8?B?K0NIUXV2T1g2cWs0bWdFS0crVXJLS3hoSVhQT0c1Q053UERGWWhvaStBM0gz?=
 =?utf-8?B?Ylo0T09ubWFzYjJxdDBHdzVVRmFjVktVbkpLZXR1MzhvTDNWTGc5MStpbVJj?=
 =?utf-8?B?Z0krNUJ6K0tyd1N5ZWxQWWRNVGd3ZWxCSWJrMXRoUVd1eXpPR0N4OXhuTEVP?=
 =?utf-8?B?K1p3Ym5GU05YQjV2a1FBeG1qdzVlRzRjWXZrTkVld2R2Y1h6NU1qLzhsTTFQ?=
 =?utf-8?B?eDgrdmRicEJOcEFlejlaK09jYlFoOTJLNk4xZ0QwZ3Rla3NkYXhnMlg3b3Mx?=
 =?utf-8?B?aDJYNFM3eHF5d1F5a1RldEJJOXZPdFdtRTg4Z3lIWm5BMDZQRHdWd3NpbGFm?=
 =?utf-8?B?WWMzQ28yR3d0Q0Z4ZDBFaVVIQmN4eGVmTG9iYWsvYTR0eXN4SGtJcEY5Z0VS?=
 =?utf-8?B?djllaW4zVTJ2VWdtL2pNOTdTdmJhU2pieEVUTEdob1dKVGMwUWVITWZnVFNS?=
 =?utf-8?B?clNtTmdIYlJ4bGlYSkFpOVYxdmxmSjJ3TXo2QmxpakNJbVV2QUMxZ0ZkaEp5?=
 =?utf-8?B?aElEa3ZmWG0vS01NNkdKZWRZUjJUSEp4MGZqOEVFZ200NEVJbkx1T3RXVXoy?=
 =?utf-8?B?d0laRDZPK1o4SDJvcGJjUStFVEswVkp2aEh5NkNpYlJCTGxIQ1Q3N2tlM3Fs?=
 =?utf-8?B?dXpiUldWQkRTM0RFT1I1RW85MGIwN1gvMWRMTHNVTzJEZ2c5djNoNGNSbk95?=
 =?utf-8?B?clZCOHlydFhUU2xPMU51cVMyelNPSlNNU01CaGc4SG1ESUtyMjRFNkFOSE5w?=
 =?utf-8?B?YkMzbEhTRVNwam80U01ZYmFBWnIrY0ZySkU5VXhMaklMcS9KOFRYODFCbVdo?=
 =?utf-8?B?MTQ2a29FWUQxVXhFZ1NnYUhmdnFaWThVeTZSWHB3ZVhxWW5KTzh6NTBlSEZl?=
 =?utf-8?B?WFE3Q3JBSjVIaXFCZjVoU2d3UGw2dC9ROERBVkk0OUEybEkwWFNTaFlUYmRB?=
 =?utf-8?B?R0FOaGFESm9vVDRKaFJVcTh6WDZNUkFVcXBLRkNCRDdVSkpkOFJaZVlVMVNn?=
 =?utf-8?B?ZHlMejFvTlo1aE9scDlaSTlTeWlTaDBPTERCbnNHSWFvdVI4TE5STDhKMVI3?=
 =?utf-8?B?Qlh6SVBMa3dSNkFYR0pmc1hheXJTL0p1OStFK0ZDZGRmUEtONHF1NEdrRHN4?=
 =?utf-8?B?WmlsTHdpa09SOVl1aGlOb1hqbUl4UFhOZmQwMFBjQ1h4aTl0VFdOaGtwbWx2?=
 =?utf-8?B?bkVsQWdoZElHd0xBUnpYZ2VEZURJY2doRURwT0YyNXV1aVI5ZW9QY2NmakxY?=
 =?utf-8?Q?In7yGdqpvUA8j9laIY1YIwA9s?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87eb3930-b57f-4abb-3fad-08db13fbf4d4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 11:08:27.0201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gmgDmYNZuywOq2xJKp7EWAWE2OVXS67g6mtSbfjtFI3AYCGgPE7Poo3EAti0SxUISUesYkIOhi2FiKMtOtRsGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8782

On 20.02.2023 14:13, Andrew Cooper wrote:
> There is no such thing as a fastpath with a printk() on it, making printk() an
> excellent heuristic for slowpaths.
> 
> Net delta is:
> 
>   add/remove: 595/2 grow/shrink: 56/762 up/down: 70879/-87331 (-16452)
>   Total: Before=4085425, After=4068973, chg -0.40%
> 
> because cold functions are optimised differently.  For example, one function
> with a particularly large swing is:
> 
>   vmcs_dump_vcpu.cold                            -    2172   +2172
>   vmcs_dump_vcpu                              7030     408   -6622
> 
> with a net delta of 7030 down to 4450.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> There are other functions which will be good heuristics to annotate, but we
> probaby want to collect .cold together in one location rather than having them
> spread out across all translation units.

Doesn't the compiler put it in .text.cold? Or is that compiler variant
and/or version dependent?

Jan

