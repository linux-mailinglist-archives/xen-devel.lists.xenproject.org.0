Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 476F64AC13F
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 15:31:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267046.460751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH52z-0005yu-UD; Mon, 07 Feb 2022 14:31:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267046.460751; Mon, 07 Feb 2022 14:31:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH52z-0005x5-Qt; Mon, 07 Feb 2022 14:31:17 +0000
Received: by outflank-mailman (input) for mailman id 267046;
 Mon, 07 Feb 2022 14:31:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nH52x-0005wt-Od
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 14:31:15 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99c4639a-8822-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 15:31:13 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2051.outbound.protection.outlook.com [104.47.2.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-5pFxRSd4N3C4Cp0VItJ-ew-1; Mon, 07 Feb 2022 15:31:11 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5648.eurprd04.prod.outlook.com (2603:10a6:803:e5::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 14:31:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 14:31:09 +0000
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
X-Inumbo-ID: 99c4639a-8822-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644244273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bQPXztmSsN/WlqoqGglenb983o+SKCoxVV8WvV8ZyXI=;
	b=id7a29eBLE68w2QmMt1JT7DZbTzSfTsdur+Fr6CrEJDmUJGMSl50Lkka6eIj8wekrbyw2Q
	GjGuG9IMknTE1UjvtgUF70AdJqzvisj4GvuoaeTROupCQ4rVWkhAxWp2IwGqTRqHA2Oq9W
	xycx0OqoQQ775pal5mWGl/CB3RSktBw=
X-MC-Unique: 5pFxRSd4N3C4Cp0VItJ-ew-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SM6uArVAjTPQvs8bhAdMFcLpTPZ7+S+5OjuxBLUDu1E+1eqpMPFjoO7acbDnoFLG6nwwLhK90hLVnCOL66aOIh9jNllEspIf+RMW/vJLJMAUvQSyTUY8pwZfKy+hySc4aR6pjpwLFdPPMCfRAfcX32r9O8/vF54iIbBmgh+cTGrFFWu2I8kx7VvoyFg5v0qQcfr8/Vdur1cX48Jj09dEIayco2fe67+YpPvHqWPtUGIqYlZeXSJJ7Cwg2RIKBe1IsipT0KszpKikSHrGON3kopGq6UIv65QahCZHNW4CPmWlM2pIydA8EPvdEB3MzTogmiOd2EVOWzUrWBqw1bLU6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQPXztmSsN/WlqoqGglenb983o+SKCoxVV8WvV8ZyXI=;
 b=oK25qfMAkwvRj2HrW897IysiI88W3COzt+0G+KerncIGspPKGh8v1/1aYxeJpi37UY+jW6KgE1ktk3tOVVRV1vx4wtGZsMBlkD2k7XHc+UZhFtSA/DynAcFcmx99DJrasPWcKK9S3ANsSls4b4AI9NsmHdMUA47+BOqYWcwwqqDMd09iZUeglKEjAI76Vh6DAiFJVnMMUrmQ2SE8geCtRIXdGahFsY5GRFOAJi8tI7l1hELlBsOSiJObPRhexVhuc3rS25NSXekQdZJW0RPPT0/iARrhaP9XWLNinnZG7FZaBVyTCHXXsHzJJpsZUieJp/ccNQhG7g7Mzzo/nCT/Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8f35e7c5-3193-4b10-ae25-df838e2262c7@suse.com>
Date: Mon, 7 Feb 2022 15:31:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 10/13] vpci/header: reset the command register when
 adding devices
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-11-andr2000@gmail.com>
 <96381d7e-dafc-acee-3abf-f9815deb207c@suse.com>
 <ef76faac-f9d3-1cb8-06b5-189ccd299542@epam.com>
 <6f0a015b-c48f-76ed-9a51-39c045ff5927@suse.com>
 <2ad372d4-a181-9307-ef50-a5adb61dae66@epam.com>
 <49380584-0577-96f2-ef1c-a96eabf0d227@suse.com>
 <fbd410d1-84ad-2309-ca05-b9ac7f95f1f9@epam.com>
 <dbef1c95-818c-427c-1963-75d584843cff@suse.com>
 <f34cc940-7f5f-aebd-60d9-d1a3d85d1283@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f34cc940-7f5f-aebd-60d9-d1a3d85d1283@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0301CA0032.eurprd03.prod.outlook.com
 (2603:10a6:206:14::45) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65270e7a-ed5f-49fe-5279-08d9ea467bab
X-MS-TrafficTypeDiagnostic: VI1PR04MB5648:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5648E7723EC5BC0B8676593AB32C9@VI1PR04MB5648.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vvgOeT/lAspD+kGhO0BcNMqOKA+3HBsH1Be2OZH+mWMijz09bJY1gild/tTiG/tV7cPBAGuwyDZS7e5vX/Wu63oPQnAT+KE6twdwmZ3O/wOYPjYfFTpAltx7j8OYurufmT8A4xngcjmx3HLel4V+5Ak8onxLyP3OKWBul8oYHAZrAcKwsZNv33/ueYB/MltRp+G1g0NFhtnWd3J6vS6dbfYazYoR69KkbNA3ZD/7HhFX2FlULZ74Ufrhx7rFBFxyi+zVclppmvGD/wMe0u7j8Pdwl5HJ/eE9tl20Ev6d21zPKsO8I74OaKGYrB+V7YBscTxRK3BSWrmgKvbFRaonNiOVTFDW9kPFKpxTwyxkGJ33PHXUj63RKKMmi2QEzMr6uRT/c/mRNms0l6Tx49T5MM1B+b84SHsgmBLfZC7OblCJf2dM/wc0bMFEfpxqdsiKMvvoSkGFdrn0LOX0Rr7KyUpPH/ikBr+OX2SRdmDh4pDcqyoUpqqc7q9RmlSjZg3yaXlcuizXEke9Ni4P/wZG9lCICG6+LOnmXBeT1sHd2+Q8PEqFMosFrv2wea7v7M14Ullw/ODOiPk7Gd7hVIspWuuiT7fE/SvkBHjEUf7Yno3B+wflxB3lbugrFeFh30bxMFMIbkvlxFyXari5oY0dRQMuMoap+hVRilWJpwzstuAbjbuiSk43ExqnaXzchGicPnOXEDelK2fjD7ClXpdQ1suKQVicq1cA6VYN44jdNKM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(83380400001)(53546011)(6512007)(36756003)(31686004)(6666004)(8936002)(66946007)(26005)(6506007)(508600001)(186003)(66476007)(66556008)(38100700002)(4326008)(54906003)(7416002)(2616005)(2906002)(316002)(6486002)(6916009)(31696002)(5660300002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjZYa05ReFpPVE96OG5JTS85c0txQjdkVm9ZbG1iY3pJQ250U1VMWklhdGs1?=
 =?utf-8?B?VVp4ZzAveDc3YnB1WTBWNmlvcCtMQVFGeGV0Uk9JMnA4L1BLM2E3K240TGRt?=
 =?utf-8?B?SGdhYTZwSTlUOE9wVTY2NmtFS1hnWkpydHVoWjllRXdPSzFiTHJXYTlWMXJh?=
 =?utf-8?B?YTVuVzBINEdMY2RET0xMNHpaMzRobXFHVVAxaFVQMi9Od3FMUjdTZGdqcHFH?=
 =?utf-8?B?VUhHN0IrQU9VbjVhenZvKzFqN1FZWlhNcW0wMmlSRTl3ZVF0Qnd5ZW9hQVlm?=
 =?utf-8?B?TkpVaTZOWUdOenRPYnlGY2xCaFFOc0VqOGNKZWVsbUtudlpSd2pOSXVPTmJp?=
 =?utf-8?B?YWx6Nlh4TThzeFR2OFNJL2UxcExyK3Q5UHVLTmdjODVNVDhYWTFMaUNCSzF5?=
 =?utf-8?B?OURCc1BidjNoaUF4cVZUM09vNUUxZmx0UUlISEUyNmoyN0JWWjdBd2dOd0pK?=
 =?utf-8?B?SFkrVHNyaFNUbSt1UHdWU2I0NklrMHBRNDM4VGFFQ2hoN0p2bHErd3E4aXc0?=
 =?utf-8?B?OExXRVdVV0JXWWVzYnhnVzc3aEVJamMwd0lEVjlMbyt4L0p4QzNaSWJKVWVR?=
 =?utf-8?B?Nm1JdVdCdGV2aXJMMFkydWRJckNnaU9Kb01zVm1LNHEybUxBekpaSnV0dytV?=
 =?utf-8?B?am1PdnVoWXhHaktGd29xWmMxUEg4dUt0ekgvVDJ1L3ZNVWN2ZDVBRERuTVAx?=
 =?utf-8?B?alhSUWFhdU82UnpsYWV1WmRRTVFncmNNc2lUOFd2dHBFU3ZBeEFmOGVXRVVT?=
 =?utf-8?B?NExnekxuc2p3R2MxYWlRdmtCTFFnRUFIZlEycGpRSzN2ellia01lVFR6SmxR?=
 =?utf-8?B?c3RoR3EvWHZGTWkvUzRuRWNIcFdzTGRmbFhPaGw3TEFlcjcyM3EzM0hueU9x?=
 =?utf-8?B?aVowbk5ZTzFEREJMbm41ZHRReVkyMGNTVFcvWXlMMUIwZGZyOWR1L3UvMkxX?=
 =?utf-8?B?SU5rRUFKNTVQMFYrUUtIS0F6THdua0VHZTZWTkhUN3JkWUZmMEVzWFUzT2lj?=
 =?utf-8?B?RGF0c0VJTzFZMVlCcU1LcC9sNGNxK211cnVTU2J0eUV6RlJoY0lEVm5lQ2dv?=
 =?utf-8?B?Yi9xYkRDWFJBZWk1SHdkMzdtUk5US2xnUlR0QkJVWE8zanpsQUx1WWgxK2Nl?=
 =?utf-8?B?NGplYmZlRkdoRG0rOVhVdmRGaENVVGlJcUNEQlJpbFFmcGQwY2Nxb0ZpM3l5?=
 =?utf-8?B?TjhXYkJYMnhyQjNYSVpQd1RHSmpzeU5KdkdhcEVOMktMSUpzcmk4WE9YR2sr?=
 =?utf-8?B?QU5lTk1BM0tlNVVuZjJzQUIrbkcwSlk1bGtZSjRyRkpEaVBrNHdGK1p3TzRK?=
 =?utf-8?B?ckZOc21YUjF5cnUyckFlWDcrbnl5VVMwMGxKaFN2UU4rYUFOZjJsM09WMmR3?=
 =?utf-8?B?dS9UdkpudXVLdTV6bTFXMkdDR214TFFwOGh4NEpzU2VDc1JlTHBkNUl2MzVU?=
 =?utf-8?B?cGM3azdNbDBxVVg4eGR2TWRGeDVOK0JBSWQ1d253Y2kzcTgzdTJjbVhPOUQ4?=
 =?utf-8?B?SXR1MFJFNnZERjd0Zlh0NEhJSElKRmFqZTFwYU9GQmtOUlJtUEFRUnJiVWxE?=
 =?utf-8?B?eHVENDdZVUVDOGp2Nm5salo0Z3NjbUd1ZlBsUWJyU0xWTnBCTTVBdUNYdFVa?=
 =?utf-8?B?clBFdnlQSHdNTkxlZTlhUkxFMWsxQWFDNEJXb3BHUyt2YStaMlR3NEhMM1Jk?=
 =?utf-8?B?WkUwVFkrT2ptVGtpeDlZSHlsdHBvanRBSVMwaC9KV3dMOFE3RUVLSmRYaDFk?=
 =?utf-8?B?KzJLd1dQTjZKck56cHRJYXZOY0V6K3JqN1YzaFBMTHpNODU0aW9wblBQeWVR?=
 =?utf-8?B?aEUvL3dLNzlXcThwUFhvTEpGdXZKYVFCbzIxeXBTSDRZdGRWSVpjY1hFTDN1?=
 =?utf-8?B?NWxWeUdBOENjS0N4WUlVT2w4TDk0Q2JtaE5LVmdTazFWVXE3dGg4RHlKaEJJ?=
 =?utf-8?B?MldwNDB6dnJDT1g3Sk1HamRZSjlyVjllMEJwUEkzbEpKR1prdU1LYlhaZ1gz?=
 =?utf-8?B?WS9zYjNOZjROcVpvVWxGdWpOZTY3ZXJSMnhickdROFFYbEhTZXN0MFRwN3g1?=
 =?utf-8?B?K2EvazBxc1BjOXNUSmJvYm5sQmhpVDI4WThxVndSaFBBU00vZmYzcGNzMnYz?=
 =?utf-8?B?SDJwU1JjRFBxWlRZODVXcTdkL1oxWlJMSlBMTUx0WTRYZStZbHNoVmYyVmxQ?=
 =?utf-8?Q?FiHypAiCzCLbSP6HqJvCTcQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65270e7a-ed5f-49fe-5279-08d9ea467bab
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 14:31:09.5102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VThkhggbWKhKRQKvlVIb9+oC6R09vT/zYpE5QjiITefry7Aw2OTlMys5ITrC1To+cdZlaqDbh4hzw0kWBaKYRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5648

On 07.02.2022 15:17, Oleksandr Andrushchenko wrote:
> 
> 
> On 07.02.22 14:54, Jan Beulich wrote:
>> On 07.02.2022 13:51, Oleksandr Andrushchenko wrote:
>>>
>>> On 07.02.22 14:38, Jan Beulich wrote:
>>>> On 07.02.2022 12:27, Oleksandr Andrushchenko wrote:
>>>>> On 07.02.22 09:29, Jan Beulich wrote:
>>>>>> On 04.02.2022 15:37, Oleksandr Andrushchenko wrote:
>>>>>>> On 04.02.22 16:30, Jan Beulich wrote:
>>>>>>>> On 04.02.2022 07:34, Oleksandr Andrushchenko wrote:
>>>>>>>>> Reset the command register when assigning a PCI device to a guest:
>>>>>>>>> according to the PCI spec the PCI_COMMAND register is typically all 0's
>>>>>>>>> after reset.
>>>>>>>> It's not entirely clear to me whether setting the hardware register to
>>>>>>>> zero is okay. What wants to be zero is the value the guest observes
>>>>>>>> initially.
>>>>>>> "the PCI spec says the PCI_COMMAND register is typically all 0's after reset."
>>>>>>> Why wouldn't it be ok? What is the exact concern here?
>>>>>> The concern is - as voiced is similar ways before, perhaps in other
>>>>>> contexts - that you need to consider bit-by-bit whether overwriting
>>>>>> with 0 what is currently there is okay. Xen and/or Dom0 may have put
>>>>>> values there which they expect to remain unaltered. I guess
>>>>>> PCI_COMMAND_SERR is a good example: While the guest's view of this
>>>>>> will want to be zero initially, the host having set it to 1 may not
>>>>>> easily be overwritten with 0, or else you'd effectively imply giving
>>>>>> the guest control of the bit.
>>>>> We have already discussed in great detail PCI_COMMAND emulation [1].
>>>>> At the end you wrote [1]:
>>>>> "Well, in order for the whole thing to be security supported it needs to
>>>>> be explained for every bit why it is safe to allow the guest to drive it.
>>>>> Until you mean vPCI to reach that state, leaving TODO notes in the code
>>>>> for anything not investigated may indeed be good enough.
>>>>>
>>>>> Jan"
>>>>>
>>>>> So, this is why I left a TODO in the PCI_COMMAND emulation for now and only
>>>>> care about INTx which is honored with the code in this patch.
>>>> Right. The issue I see is that the description does not have any
>>>> mention of this, but instead talks about simply writing zero.
>>> How do you want that mentioned? Extended commit message or
>>> just a link to the thread [1]?
>> What I'd like you to describe is what the change does without
>> fundamentally implying it'll end up being zero which gets written
>> to the register. Stating as a conclusion that for the time being
>> this means writing zero is certainly fine (and likely helpful if
>> made explicit).
> Xen and/or Dom0 may have put values in PCI_COMMAND which they expect
> to remain unaltered. PCI_COMMAND_SERR bit is a good example: while the
> guest's view of this will want to be zero initially, the host having set
> it to 1 may not easily be overwritten with 0, or else we'd effectively
> imply giving the guest control of the bit. Thus, PCI_COMMAND register needs
> proper emulation in order to honor host's settings.
> 
> There are examples of emulators [1], [2] which already deal with PCI_COMMAND
> register emulation and it seems that at most they care about the only INTX
> bit (besides IO/memory enable and bus muster which are write through).
> It could be because in order to properly emulate the PCI_COMMAND register
> we need to know about the whole PCI topology, e.g. if any setting in device's
> command register is aligned with the upstream port etc.
> This makes me think that because of this complexity others just ignore that.
> Neither I think this can be easily done in Xen case.
> 
> According to "PCI LOCAL BUS SPECIFICATION, REV. 3.0", section "6.2.2
> Device Control" says that the reset state of the command register is
> typically 0, so reset the command register when assigning a PCI device
> to a guest t all 0's and for now only make sure INTx bit is set according
> to if MSI/MSI-X enabled.

"... is typically 0, so when assigning a PCI device reset the guest view of
 the command register to all 0's. For now our emulation only makes sure INTx
 is set according to host requirements, i.e. depending on MSI/MSI-X enabled
 state."

Maybe? (Obviously a fresh device given to a guest will have MSI/MSI-X 
disabled, so I'm not sure that aspect really needs mentioning.)

But: What's still missing here then is the separation of guest and host
views. When we set INTx behind the guest's back, it shouldn't observe the
bit set. Or is this meant to be another (big) TODO?

Jan


