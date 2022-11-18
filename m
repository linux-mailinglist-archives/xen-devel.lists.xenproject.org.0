Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C9B62F4D9
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 13:33:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445692.700997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow0Yy-0004i0-3c; Fri, 18 Nov 2022 12:33:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445692.700997; Fri, 18 Nov 2022 12:33:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow0Yy-0004fG-0Q; Fri, 18 Nov 2022 12:33:44 +0000
Received: by outflank-mailman (input) for mailman id 445692;
 Fri, 18 Nov 2022 12:33:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LL5N=3S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ow0Yx-0004eu-Da
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 12:33:43 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061b.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c534490-673d-11ed-91b6-6bf2151ebd3b;
 Fri, 18 Nov 2022 13:33:42 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7542.eurprd04.prod.outlook.com (2603:10a6:20b:299::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 18 Nov
 2022 12:33:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Fri, 18 Nov 2022
 12:33:40 +0000
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
X-Inumbo-ID: 3c534490-673d-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cpw8GUIZY5wICsc80KaP52YExrBcVIKDZiOhLNo/Ch9PDNdpGz0PhDx27T/jFqsgDNecW8w9mBCyCmDiRdH1WDFo2EFxOR9PS95jWXQnFbv5TNOHC1mtgf8Dt74qxufhTholsuBhpDIewIgWtW9O0aYJex5Yvi32J9gkNY0JzUGya++FbZVmpiCXraJhK78rC+nBNCeqgUiWiWTAc9RS0YceVoT/IZDdxwqrsqZArgwR7kJeBUl5b3PZfY8yHFSBDgzRILi+j15wJkO7Hd0zPLz+qIo+mRHokt/lvF6MVHxMVBdSIexMGZY0Kcbn6hrdUxucsIeY0SSXzvZ2TX91Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4RoYC2/PD+8f5/Drcc6saJIflqzzbsLV/xm7Y1nUgtg=;
 b=mnjUMoeCg9jQSAZo6YPmDTcZRbVQPA1wQDlLf+gPveZg5smru75zqsSI9QaHt1S8G1qDBjo2psTTDQJXpeYjxtb7oIvfYCNGke6Yiloofg/tk4NRLzK/YOfl7e3bCRvnFV7yX6llgqC7QXCjCmMHZ4BnvbAhq1kD4otWp+94PKrdatZEKONItOWIpBUQnw8zcfW8oaWEs8Ipe+7YK2Gs504eRS/TXCqbVWhCncqWaw8Lseef3F2fFj7vmk1MlqGipkSjkFWnF3Yhm4ua7T8paDzXQnHi47wmL6QYHRcdUtHBeU/Ufdy03F7ferHtqDOEUjNwGfbU3E9JM/4RlgYnHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4RoYC2/PD+8f5/Drcc6saJIflqzzbsLV/xm7Y1nUgtg=;
 b=4FsPR+nfGaRAE/C6kK3Mphw6XBMQpEh6ZrB99dm5HqlfwWbdkCclok3t8CtbIDJEzBVk/x4Put+rSEztotiNIo07mx9XZ5hwTWm+ItvhWU1+NnPvyitYYGNJzB9jC2VwGmq5rKx67xUMvuu7KJmJfipGBl5MZ2rlsJhc2UBNWTtL4OUaUt0icWibF6cNLfvFIGHzRPHq6BuTZARwx9QZmT/vq3NdtUmn5ZQS+X8rUVWuJ+cm358nrmmhkV5DtuxgpoLORC9+Mwewqmy1LDy416WYRw2ZfFM62qa9/FMhQpiQqIpihoyvN+J7DyHajTENgiWzeqWo8C0O/xg4s06N1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9d034957-822c-74ba-9aea-0944cc456870@suse.com>
Date: Fri, 18 Nov 2022 13:33:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/2] x86/msi: Allow writes to registers on the same page
 as MSI-X table
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20221114192100.1539267-1-marmarek@invisiblethingslab.com>
 <20221114192100.1539267-2-marmarek@invisiblethingslab.com>
 <15138618-5cb0-8304-a56b-cb787e187772@suse.com> <Y3ZwAJITlD/rSf/n@mail-itl>
 <cc75d927-b936-0716-bf36-70bb65be7a1e@suse.com> <Y3d4aW4LjYwEZ85Z@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y3d4aW4LjYwEZ85Z@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7542:EE_
X-MS-Office365-Filtering-Correlation-Id: 423dceee-9ecd-49a5-ab44-08dac9611f9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VXI3lhtxezT00TqomrMD8T7HUkTVOUEP/eocRud/WtR9BOd7Xgeq2BoaK/JIBIs5RuR9lUclLkPf5Co5D9+MzJsftvhsM/jAAnbr8nZ70RruRMdkkJsfgfSxo7bL6B8V4CMl3KJKDsumKWK9XUXBPJ7LTeh0g9hoZ1R2MaqU5va7vkg83CEQHB4wV11Q6cxCPpppr4yrt6woOMKXvXqwwbzQ0wYG+QsKwvvRQ1P7lBgRwWacIX/dy0FB8dkpPLypE6Cw4p1OIOL/FeLq2kXNY+G9VYSx4MvLTOV3ic+/1bkOdSE76v5XlPGZ2s1nqtqOyziKuDaZ4zH0AOhgSsezmN1co3ptdx25o/wMD/RjcDu3YCTv3x+DU7QbgdC7DHyO6//OQXwNrVaDq79iIgGnub8MrmB5L1hAG22ukjX6CR6aO+1FyvbwfPjo/JVsrxQDdq212yBjv8cqskwduIXwZKnQ09WpPegc4MPultZopnPuFRBjh2dzwvum3ViFBuqIXxGHJue2G4irbu+eJP0i62Qz7h/AFKy1I+MRNtW5uBV5AfVsSV07mtOOzVD98Gf0V33YHiFKRpo3i6flgPfK+u1radLJsnt9XKZLttrHV35hbgPrDuaa0Z5R1/aKi9MuEUkPGxZE+xh/TrnZAfTW8Ai7laa22jfYKa6DkU2W6EKKVaRTe1vW/Q3UO4O7R7p7SKokNBG9ZA7dlsuY1lJ+DeTatzzXUNXz5U10Afsjcyw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(39860400002)(396003)(346002)(366004)(376002)(451199015)(8676002)(26005)(4326008)(66476007)(66556008)(36756003)(6512007)(66946007)(2906002)(186003)(38100700002)(478600001)(53546011)(6486002)(86362001)(6506007)(2616005)(316002)(31696002)(54906003)(6916009)(8936002)(41300700001)(5660300002)(31686004)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NktWdzg1bnMzSXBOeTdoaWhDNGxFN3U3ZlFiS21nQ1U3czJSS1lGSGdWdHEz?=
 =?utf-8?B?OE9ac2kyaGM2cS9EY29UbWMwYlpISytrN2JVRFpYY3h1Y21EdWdGcU1BQXB6?=
 =?utf-8?B?SnRJU2NNamVIelVqcktiVTcvM3VPVVIyMWFFdkI1Vjk5QmFTTUZoZmNPYUFE?=
 =?utf-8?B?Umd2a0dMUnZyWDBFUjBPekZjbHFRYXlRNTBGa3Q0bGxIdkNPMTNzcStkMUJl?=
 =?utf-8?B?eUVsMllyRGdrV3J1K0tpSXhSV0FkVERNa0cyaUdXcm5ZNlc4ak9YNkZlSzNu?=
 =?utf-8?B?Y0RiY1RzLzRUZHhNWlZpZXNyNW1NSUZMY1BPUk1Fc3pndWdQYUw3N2lMQTVO?=
 =?utf-8?B?Z3VZcGkxMUt4NXRmdHhTVEtSblZ0UHFSaGlKOGFybU5qbGJTRDFpWEhPeTU5?=
 =?utf-8?B?dS8rZkpTU2NnVDlNMERlZHIzV2JYWXl1WUFsYUpoam1tRUJtM0pHcHlBdWJl?=
 =?utf-8?B?dHNubXpVS3d3OFFoeHVUa3VLT09zNzNBeUtCNkRkcUpwZWI3SXV6Z3BtNzUz?=
 =?utf-8?B?eUgwVjV3amhHNnFDQndOd0QwTU90Ym9YeUpraExoSldnRXFkeHB3c2g0M0pq?=
 =?utf-8?B?TTdWV0hmeHZLN0crTlUwdHJ3S0ZmNjVGMFpteEhmYUpKWVNsei9PcG9zSkho?=
 =?utf-8?B?QVJ6ZWxEVUhXejlmRDkySXcwY0REeEdSUnpBbldCRjRqa2c5ZE0wSmovd1Uz?=
 =?utf-8?B?aXNldEVZTnozb2EyTUVNWmFmMFZBQmZRcWhuY0N3MUhUNEJoRFhQaGp5RmFJ?=
 =?utf-8?B?bmFFc3B4NU51M24vekRMd3B0dFdSSnc4ajUxZ2JIVHFEaWNFUVpTQXNiYVR4?=
 =?utf-8?B?UCtocTlsdmdjbWVGR09wTkNNNDJLYjc5Y3Vib0xzK2s2YXcvN09ZeSsvUXcy?=
 =?utf-8?B?NWd2aEsvRUtmZVRDWTRPSTdYQkt4Y2g1U0tEYmwvS25ZV3c1eHl6SmpXNUxy?=
 =?utf-8?B?RUdDZWFsMDExclhUSk1kdmJ5bytzZ0k0cmdrK0ovSEJOOGZkbEZLSFpHNjQz?=
 =?utf-8?B?OWduU0FjYzB0NjlVenVoUGQrbnNjaFpkditkU0U2ejV5Z3dyV1orcGdqc0Rp?=
 =?utf-8?B?UFZIa3FiTk5IaDB0QURPb3RtT0p1c1FadFdUcWFEbWlibUMySWJKVEovYitD?=
 =?utf-8?B?UnpPZEorcDNxWCttSTh2QmNMd1l6WmtMU2JvemtmMzVYL3I4d2R6bmVCbGtE?=
 =?utf-8?B?aDB4NWJiSStJMUw5akVreUZzVytOSCtlYWRRUzd5WHNvMjJoM0RTYnQwMzR2?=
 =?utf-8?B?dDA5bUlYWUZsQXN3MXdMWHBDU1FjSDFOL1lnMlY4MFpHVHpMZFFFWE0wUXdm?=
 =?utf-8?B?aGZ6Q3JQQUJWbGtsR2psRExYL1FlVGE1TVZNWmZjMlNBMDUrWUpZajBreGVu?=
 =?utf-8?B?ajJVaGJ3RzFUL045eUd1MXVUUGN3Nmk3dHNXeUVySW03bkhYak82OFJRL0c5?=
 =?utf-8?B?YkVHSlM2cFJQM3crcVJiRG56d1JhMytDeDNmbGFwM2xJOG0zZHhRc3RIUlFJ?=
 =?utf-8?B?MUZ0OXhiaDdNamZ1OEtpRzlWdFo5aWU2TFBmbk9BMzhmbjFlcDdUd25xd2tZ?=
 =?utf-8?B?TWFkUjJscjkzUVUvdWpIa3ljODlpT3U3Wk4zL0dLTWdwbVhSc2NNMnJCdlZN?=
 =?utf-8?B?UGVkRERQMDJDdTlDYk5vSkdUNmFkU2doUGZ5MXpUdVE5L0dIdE1JcnBsWmVs?=
 =?utf-8?B?LzRoMVJ1RFcwakJscVZ0b1JHbWRmblhPdzhRaDdtaGR3WTc1ZVgwQ2F4bnR6?=
 =?utf-8?B?YTFlZFpwbGlJZy9PSkxaZkZZa1VyanlTaFJhRkxROUhoZ2NKR3NrZFR4QXVr?=
 =?utf-8?B?WFhUVGkrdVZQelhTTXovZ0kyRnV0Rm9WR3ZDeEVlV2xiZDhnMFFKQldLU2pw?=
 =?utf-8?B?TWJJYmc1NHVsT3ZHS1ozdy8rMGVRZGRlazZUQjZoUGxJSURXZ010S2ZYRlNm?=
 =?utf-8?B?QVpsYXd2Y3JRcDl0YmhYaU9MODByTkFmTkhvak9takFZb3UxM3lRS3ZOQWNV?=
 =?utf-8?B?TVc1MFpzeHphcXhpM1JONzJBRW5TRGN4RTc0U0FVeHptVkZFbkRmcU9MK00v?=
 =?utf-8?B?a2N0a0tFbk5pNHV4SmhXM3kyN2RBYVJQa3YyN0lwWmxNSFBZcmRTN21lclpK?=
 =?utf-8?Q?UfQRKCIIvjIY4wk0SnfYPV5Lw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 423dceee-9ecd-49a5-ab44-08dac9611f9b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 12:33:40.6434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bzYxj6lcFScOkc1SU4v743JZCkNqI1pnKEHg2l7ItefxmAHKWs+FdT4VIjAr0ZDM7emxoXSOjVMrF8G6jrJCnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7542

On 18.11.2022 13:19, Marek Marczykowski-Górecki wrote:
> On Fri, Nov 18, 2022 at 08:20:14AM +0100, Jan Beulich wrote:
>> On 17.11.2022 18:31, Marek Marczykowski-Górecki wrote:
>>> On Thu, Nov 17, 2022 at 05:34:36PM +0100, Jan Beulich wrote:
>>>> Which in turn raises the question: Do you need to handle reads
>>>> in the new code in the first place?
>>>
>>> The page not being mapped is also the reason why I do need to handle
>>> reads too.
>>
>> Just for my own clarity: You mean "not mapped to qemu" here?
> 
> No, to the HVM domain (in p2m). Xen (outside of MSI-X specific code for
> HVM) doesn't know where those reads should be from.

Hmm, I was expecting them to be mapped r/o to the guest, but perhaps I'm
misremembering. Clearly both ept_p2m_type_to_flags() and
p2m_type_to_flags() take mmio_ro_ranges into consideration, which is
what I was basing my understanding on (without having looked at other
places in detail).

Jan

