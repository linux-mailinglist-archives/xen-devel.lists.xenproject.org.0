Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CD46C2E97
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 11:20:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512301.792209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peZ69-0001OF-GG; Tue, 21 Mar 2023 10:20:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512301.792209; Tue, 21 Mar 2023 10:20:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peZ69-0001Ld-DG; Tue, 21 Mar 2023 10:20:09 +0000
Received: by outflank-mailman (input) for mailman id 512301;
 Tue, 21 Mar 2023 10:20:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peZ68-0001LX-My
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 10:20:08 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3fa759c-c7d1-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 11:20:07 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8350.eurprd04.prod.outlook.com (2603:10a6:102:1ce::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 10:20:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 10:20:05 +0000
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
X-Inumbo-ID: f3fa759c-c7d1-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hyvKgq+9nhdaDq25iyJD4+nOTdqBtKPkB84AktQJi7EDeTQwIdF1+/gpUEdJ2PzwkeN0vWiYvL8qw6k/M2Q5V5G+yBQWDUT1nQFSIc9TCqj2NwWoLnl5aJVLxmtjkHR22QzxxIj0Kfw2/RjTTKppu/0+Mf2NX1UR22KI800bny7DiKgNhV1cUjBhCgXLnu3XD1HQPip6cdniABO842tQj3+35oiQNwn+srhsd8uMpBMI5oaOR2j3if4v4f7sUujLV+V0Kyz+hakWOa2WKMV/LxvSuRW/fkvNba6pLx3wfTXu5VTKfVrECvkT7rvPhSK8IGiJntffBiRmawK68HtsXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7Htdve0SQ3Y3tsPQp5D5V+al7+vdnQg8kbz/lS9jdU=;
 b=hKbGU7mYaU4Vna9KzETv9Vhp100j+ySahEBuNaZ1c3O/GwmrGOxao5MYjin6BJBATJvZudr9IgboLgBs0tRjsrRSREQ28PngxxjRmQwIkJBJ6XbkWQRkdjpbBYeVIO79JVfMJ4c2LBKcQvBjpAZikG5RtI2FGR/l2i8mA6imfXJlWRMLOPwjUUZ7lz2+Dw/Kom6+3ofIwIpEKd+OKtN9l7cwnQW+rgaybqJCO1LNFXu3QmbdztpTc/tz9piNuLsoNbVZCKS7xFNi9meQI4Gl+Zhea5TpvLPLGE62K4csR+JZaOB/xh5uEcqCLWq8eyMSmBLw26+DKNUQhG59DtINqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G7Htdve0SQ3Y3tsPQp5D5V+al7+vdnQg8kbz/lS9jdU=;
 b=13Sbolnot6v3vQgcX+K+tFFXTJ1lK4mJrTDXYnzEA6jfJFusmiuM7vZa8zwuukOMSaLEBhxfj0n7RipjpHw+dSzYLGaZ7uTnL+SG4V2vYPJUIrBrrTzzKTRJlELDWncvMrHh/eMNLu1Rkhyz095fZIzAmSI5Bd1EtyOjtHIIZvj5Pf3P0BbK1JyO9ywCQYkM4QsRq4I3IR477EdJosP2GmGr85b56/S88geNsTOUDoSuXtUREgoNN8ODpNHtTNeHZSKzg+oN+V04AQvJD9ksn4nGY+0JCTBmbVNODXNAeJd+lw8IyKctu/dBQEPJs+21z8VhSX71euQ6IgKo2ngrhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cae4e673-65d8-273b-66b8-08d374797da2@suse.com>
Date: Tue, 21 Mar 2023 11:20:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC XEN PATCH 2/6] vpci: accept BAR writes if dom0 is PVH
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 "Huang, Honglei1" <Honglei1.Huang@amd.com>,
 "Zhang, Julia" <Julia.Zhang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-3-ray.huang@amd.com>
 <8adfeb57-1ddd-255d-6d93-24a74b463f59@suse.com> <ZBl6iU6T1CsWqVx9@amd.com>
 <ace92506-fd86-9da4-aeb2-37a80094d02a@suse.com> <ZBmDl8XjIos57EIy@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBmDl8XjIos57EIy@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0202.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8350:EE_
X-MS-Office365-Filtering-Correlation-Id: f9acfe9f-e588-46ae-b116-08db29f5d6f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sg36CV+/sioBzl2AWEFJ7bu3CeGTUK2irtIW76HXTg+9ilGC5mkpBps43HfhNNlDIJw6Awz+VxvgbGeV4rNTpxnVvVf960n8sJmszlrX34C3GdtuiFt/Sa/a6MCgcuRT5BvIeDuAT6X+279qQiXxEaqZi0+440qBzBhdAqGZn5C2dF6BMxQIy6aKvsbIMcfG/4AVVIZdUQmR6CCMBOhW0KJX52vZ+xncjQINMHMrdTQHyejcYi6xLVvYDJCGb3lsJMXKQ3ykDB5Pawy+cqEkoWbxNWptrg8ShOX36ag1y9ATi8TeZhPeO0KutNxTKMuArDW5ZtlBwWRNvqr6v2JUO63j8hFXmqIlEK1T8gZqVWu/5uiPUAWPHG2Wn3/5cMd9ftM9uQV0cYZw0+BGerGU7BmyFqE5cgcEoYouFRe4c/rbWqWxmf2+8jWX9uZRN13af5dfNHOD37yX/eGbTgBdYd4Ij6aE6gbidIPwOMeONcmnOU7Wj8OH4cZvJrf53x1t2YRVYVnoFpSe2LhgK+zz164jakALR2TwopMbF+m46AVOfwpir67QxuWUHwoB67GcdN8ClAIUllsWd5WlDmQws+GjkPLzi2TIUYd/g3puzslFGMIDEdz3l4CLnIXBS77P/Av1jofzyFUr4nlOHndKD7NibFphDeAXwL595iJycRfGmgT94xdIXyODfaNXmBhZjfXVvy90Wj3w7jX+1AgJVEDVidT6NyW2c75IoiHFtBA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(396003)(136003)(39860400002)(346002)(376002)(451199018)(8936002)(5660300002)(7416002)(86362001)(31696002)(38100700002)(2906002)(36756003)(4326008)(6486002)(478600001)(83380400001)(41300700001)(2616005)(6512007)(186003)(53546011)(26005)(6506007)(31686004)(54906003)(316002)(8676002)(66556008)(66476007)(66946007)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3RKTlZZVlRBMVNTeHlQN1dhNGlQaWJ5ZEM1aTRVM0tkV3lsMEoyVHE2MWhI?=
 =?utf-8?B?VVlQdFE4QW1heG9JY245aTFaSnN4NE5YdDYyUzZnTW16R2NQeDhETWtJOHo3?=
 =?utf-8?B?K2NvelppZ3RhWjhFYzJpR0dzRzgvT2ExZEZHL3cxOHhjUy9zUzI3b3Y2ZzhX?=
 =?utf-8?B?MVFqUG5zSjBpZXM5NWJiMW9YN09sOFFBWXVWMVkrdVM4a0VSUHVXMGRjM3Zi?=
 =?utf-8?B?OE1NeXZJNForMGZSd3VheDNlZ3dmUHVJNzlIVVhaM3V0Y2RCakRJelF1blA5?=
 =?utf-8?B?Tm50Mnd5eGpiT0ZFK01mUVlxbm4zV2grQmNOUy9GOWdLVldPZTNQYmswSTBN?=
 =?utf-8?B?VHhWZzZxMkdrS1dyN2VSMDhBRGNPVFl5QlFJYkttZjRyMGV5RUNWZnNyeVYv?=
 =?utf-8?B?eTlIUmNMUGNnUE5odXo0V2Jsb05DdTJEY082M3pxcW44dDJ4bzNSVlpxL1BB?=
 =?utf-8?B?akg2NnJIYzQ1MHJxbnNONTRjREU3WkVPL2xvdElmcnp4MDRCYzlNYzNpaFJG?=
 =?utf-8?B?WTAzOEZQYXFxcjhKdm5kQ3E0RmxTS2t0VVg5QnBNR1VpUHZBUWRja29tNll0?=
 =?utf-8?B?clpkRUZKYkdUSldZZ0ZrYzNJaUtIZ2lPZ3NFYnBVSk9nSEpZZjY0TkNGNXJE?=
 =?utf-8?B?b1l2RXpZZ01QVW1uSHcvSXg5WTdScnNSM3F0bEphK25mQ1RMdldlWFM5VFlM?=
 =?utf-8?B?MVo2bS9RNk42K3VsRmg0ZjNJVGdYSzJJVGxKejJyWENCSWxMUUFGSXVtZE0y?=
 =?utf-8?B?U1d0TWUxSVUwYXBlRWQ4MDNHSnp0TXhtSGs0WFhlczUwYXRMSmtvNHVGQTdR?=
 =?utf-8?B?MEMvRHU0N1RnNGhaNXlYTERsYk94cTRkY1ZRRFFRV2xtdVpKQ2ovREVidFZO?=
 =?utf-8?B?dzdMSElIWUlFZHRaYVVVQTlreWtJcmVDaWIzZS82bDR0eFdYVGF5cWNseVll?=
 =?utf-8?B?bXByWWVGeU9mUytjeUxsZGJXSzVIa3Q5TXdvbFJQOGtVNTMveElJeU56eEgv?=
 =?utf-8?B?TnorUG5LaHk3R2YrUmFJK1ZwNTlqdllxUkxoTGhoREdyZGxVcXJjd3hOQUNz?=
 =?utf-8?B?NzhtZDlEVGFpVkxLV1NSMlp2OFVEcmpMdFRxVFFaa3JIeTBiRmhOWmxkZTJR?=
 =?utf-8?B?bFJjUW4wZXRYQS9ZMUZ5SUYwb2IwbTI2ZWZXS3ppdXhJcTl1ellLNXFFQWtE?=
 =?utf-8?B?MExBNURWVGZ5bG16S3liMW5rYlBzQm1WYUhWQUw4ZFo5YVJsR1VFWFAvZ3Az?=
 =?utf-8?B?MHI3eXR0eDU0dzNsbm50Q0xVUkZxT0FreGtieSswalFpdVBnU3pVZW01UTlS?=
 =?utf-8?B?QVNCa3NKb1hPS2wrQmptREZTdGhTZlA1M3JrYnNQOWhEZXBPSlpXNzZJN0hq?=
 =?utf-8?B?a1QyZnBreVp1N09ra1N4WEpQeWlMd2dKV3VqWkVyaEdRMGhhZXMvWXZsc2xY?=
 =?utf-8?B?YmlaeFM3eXRvTit5RE5Jd3p6K0ZRYUVnNldHZ0E1Q0hkNkM0OHl3elhrREhZ?=
 =?utf-8?B?NWRPZFcxdnhpSVBITEZhdlNmOXZKZGdqSWxLSjhSN0NQWHJkc3hLY1NGZ0Fa?=
 =?utf-8?B?dTNXVHg1WTJOOU9UcDZkMEJPOG9TTXNYSEN5NEJLenFvQ1BFMC9FdTFJWEpH?=
 =?utf-8?B?VHlKZTFhSGcxTldiR09ONnFBMlM5ajN6Q2VxYThmcmR2bUtVNWJKVjBqdHNP?=
 =?utf-8?B?SHRlZ1dLRkRJb3VWcTdKUG5KQmpwMTRuakEwTDZ4SFVaeCsvWnFoZmgxZmZ5?=
 =?utf-8?B?OStnSlNuVURTcC9PQlRIK0JtU3lXSEt0Y1hsemt4cS9sOXY0bGJzNzlaZGYv?=
 =?utf-8?B?RXh5Vmd6cis3MjFOYUJNQmVxQldLbkhhMCs1MDlncEc5OEo2VEdxdzhhR3lZ?=
 =?utf-8?B?VzdnOS9xR1FOOHNUUTg5QTlEalQ3eWMzVWMwMkYrTE5XQ3o0amlNWEFvWnRw?=
 =?utf-8?B?cE9waGNXa0Y5blFTd3RwVVBOR2x3VjlkYy9iZHdvT3FSUXlMSi9VbllTV0RY?=
 =?utf-8?B?bzBBOVo2Si9qdktjM3QrUDFCTUlyK0hneFlPWW1GVUZGdmtBdWdXSC9JSzRi?=
 =?utf-8?B?SXUyVElTWGVKa2k1VlVrZ3MzZVhjL2hWUDM5cmRxSyt4NnZSb0Jxa1Y2OUxP?=
 =?utf-8?Q?Ipu2rPSmfH/CKh946I7XRwW7w?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9acfe9f-e588-46ae-b116-08db29f5d6f0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 10:20:05.6475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tXldqQox4X68tufAlhVwRoqBRRXLQLaoBn5TDlJX+Jk3ww5Xmqhpz0z3EavWFWRBWkTJZYrSSi/I+DDbd94n2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8350

On 21.03.2023 11:14, Huang Rui wrote:
> On Tue, Mar 21, 2023 at 05:41:57PM +0800, Jan Beulich wrote:
>> On 21.03.2023 10:36, Huang Rui wrote:
>>> On Wed, Mar 15, 2023 at 12:02:35AM +0800, Jan Beulich wrote:
>>>> On 12.03.2023 08:54, Huang Rui wrote:
>>>>> --- a/xen/drivers/vpci/header.c
>>>>> +++ b/xen/drivers/vpci/header.c
>>>>> @@ -392,7 +392,7 @@ static void cf_check bar_write(
>>>>>       * Xen only cares whether the BAR is mapped into the p2m, so allow BAR
>>>>>       * writes as long as the BAR is not mapped into the p2m.
>>>>>       */
>>>>> -    if ( bar->enabled )
>>>>> +    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
>>>>>      {
>>>>>          /* If the value written is the current one avoid printing a warning. */
>>>>>          if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
>>>>
>>>> ... bar->enabled doesn't properly reflect the necessary state? It
>>>> generally shouldn't be necessary to look at the physical device's
>>>> state here.
>>>>
>>>> Furthermore when you make a change in a case like this, the
>>>> accompanying comment also needs updating (which might have clarified
>>>> what, if anything, has been wrong).
>>>>
>>>
>>> That is the problem that we start domU at the first time, the enable flag
>>> will be set while the passthrough device would like to write the real pcie
>>> bar on the host.
>>
>> A pass-through device (i.e. one already owned by a DomU) should never
>> be allowed to write to the real BAR. But it's not clear whether I'm not
>> misinterpreting what you said ...
>>
> 
> OK. Thanks to clarify this. May I know how does a passthrough device modify
> pci bar with correct behavior on Xen?

A pass-through device may write to the virtual BAR, changing where in its
own memory space the MMIO range appears. But it cannot (and may not) alter
where in host memory space the (physical) MMIO range appears.

Jan

