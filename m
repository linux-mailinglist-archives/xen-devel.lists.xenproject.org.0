Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AED5EABAD
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 17:53:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412007.655164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocqPR-00019Q-8W; Mon, 26 Sep 2022 15:52:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412007.655164; Mon, 26 Sep 2022 15:52:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocqPR-00016S-5X; Mon, 26 Sep 2022 15:52:41 +0000
Received: by outflank-mailman (input) for mailman id 412007;
 Mon, 26 Sep 2022 15:52:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ocqPP-00016J-9d
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 15:52:39 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70080.outbound.protection.outlook.com [40.107.7.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ec4e9e7-3db3-11ed-9648-05401a9f4f97;
 Mon, 26 Sep 2022 17:52:38 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9296.eurprd04.prod.outlook.com (2603:10a6:102:2a7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 15:52:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.016; Mon, 26 Sep 2022
 15:52:36 +0000
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
X-Inumbo-ID: 3ec4e9e7-3db3-11ed-9648-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c9Nx7g1UpWeVsmV7CQtjtGpr58dbWKfk+StEu8ZCkYHzGP+R4EdJZwW/1VgTJn0+p72PLnwTm3TfmYmNfalq9OSdLIfiN1Td85OGfdxSyWFIVfMA6BYU/8mqKgWcgOjDnI3Xr647Y1UTeJM6Tg0FSHxwGnYw64eRZd8XxqlKiKauIdlcYGF0WzWIPUfbCuIwvkLQEE4dWaDnFAluRmo2F6xrdaXnTOLkqPpsYMTdIdcIA0DX5+3o0rtGpBRrpD+bvu+D6An2PgbqaK+/LpwUKHTDdDr8LaWsDCXeegDQ1sE88cZ+6ExmhOFFaaCokYjreEu0CNCbCvulH34e1pc6bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4Q5j4CgqRlyXplvwGKGlv+opU2Bw+QbT6FnbH3OG+I=;
 b=EixAqlbGbHS2x2f1j5MbiYBoxHAmN6cicD6qyZ9tB2LrDps1zYXGdU82j7VGe1VFHv+mD3UxqtagpwZ1CjW7W65qva/DPOLY3/JzTdDi7VupOxd2Z5WSP+lISnFIKftVW1Hsoofd7ZD+UOoK/qiFfNy83aY2sfnUaOnt5F37+JrvJZblLBueU59LcgqiVySSD6oMSYY632uzy0CrRzd6GwwFsSZlvIA3OpPZPErKGB1+0qSnVmyEhxPm6YDalmkUuiHkAicwFFsGADm/3LgjrZYJgzQrRi2sd58wI1HypkEUovflBdaS/gxjjPlyAlCm6FYFbCRTeEasTZpjTnDzRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4Q5j4CgqRlyXplvwGKGlv+opU2Bw+QbT6FnbH3OG+I=;
 b=juFbANwsuPGGUWRZSjBn5AxIKMwE2Qg3ChdUQdSEHVn8V/ndYphg1E/5AwI6TXgJxWBCy4wjvKwEq3UkvTaLgaPQp5Q4JemH5GxC1z4Q1yUQ6UxXafYJbAmO18rKb+53azF105HWRbgEDFljcA99W5aJjNyBHPzgkL0Uzw3qdlQySUYXRrmNK9xAvKwurKfmJfx6f37bhnxrqcI3KhEOKs+LoIO8ENVBCYj506DFr8eyVMtdYU3Vawxz8oRgn9xU9volX74+XZ9TmzP3GjG9QYzXX9eMtmnTWJRrntvkz7EzP5B1FGY2MI0VIrLlDpWOPzcWL8GEhp+pc3MGGunSAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a91f9205-9f75-7fff-d5db-26d7729847db@suse.com>
Date: Mon, 26 Sep 2022 17:52:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: Design session PVH dom0
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <YyszY+qHOVkCTe92@mail-itl>
 <e81e9b3a-baf2-cba1-01f1-89ba4a9ccf33@suse.com>
 <bbb0a75f-4687-3e18-6219-ee32de298664@suse.com>
 <8de37e96-cf67-2306-b586-dd45019a536d@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8de37e96-cf67-2306-b586-dd45019a536d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0262.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9296:EE_
X-MS-Office365-Filtering-Correlation-Id: 693abcb4-c693-4653-c7ee-08da9fd721f2
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D+TW8odJu/382t+RxE6pb/pDGdAWO7r3SGEu80p0FZ0Fc1hFeImhCehF8jiYECTNbTm7q23w5hxXIX0Q5j4PmEE4fPLYVv32JZiKqpscg1xMlxPRc95ZUCNRgXDpY2VfE9a3hHDm2CtnGRGGADbQ2DKHIRn5A6zetiwxXPTOw1UYPSQTF6yhC/1K1k02CuBRvdfYFlBOdflu1UWKF2oLH2yreGJby9lZEBgM5zRayHGbvDsBNEPHVWAInQHupdkP/TDOxLCnmSrWmMSE//iSbZ+GTZ7v9s6a3NhK8ma+Vq6c/1xg0+KT/mUctc2aKQurrPPef6B3b66Y/rvtrO4rf1Q2PKD77esnPKW5SZm75WbZXemYCV+dWqbufGTXxzmliunlYcQdWEB6B2x1WsjyAyx0VNbna7myHFlf3KuwgPw4bnBi3wzQNNQf9PTS1EaGACMZWdsrKvf5yiKFtgM9XgiOTZvmWcb32QL5H5FB05Ym+QeKeCxBLNiqqcjcOy+FqXgtNWLjx0bwVYmCP87dReTgvSqk6aJfN9K2NUfCBt3XxUPEnLmZagh8qhIXpMF//O9x0CrBSDd5Kia8A1PJY6T3reEfoQ2ksssxUu3GUtHXxPPGUkNzK/gZFt+uX1n3kfbh82UyzS63mOwHGpVCe9DlqtudwCYqQz/hocOWnR8IY5/cUOg8hcoXePZ+1Azis2Mo8jqKTNhIf1SYVvnaAo6DuwllsrNkF9LfCr4rVhU6DDnTGPn95z76A7LSICiyn+uY7coWa8g/EME4A8/MHbHsukbzYSDLe9paDIMfdgI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(346002)(39860400002)(136003)(376002)(366004)(451199015)(31696002)(86362001)(38100700002)(36756003)(31686004)(2906002)(186003)(26005)(5660300002)(6512007)(6486002)(53546011)(41300700001)(478600001)(6506007)(2616005)(316002)(6636002)(54906003)(37006003)(8676002)(4326008)(8936002)(66476007)(66946007)(6862004)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkRCMVA0dUxSQTRxOHJrd1lvTVRPeCtaUXhHWVdodmdYZWViRUJzcG5jbERZ?=
 =?utf-8?B?TG9WS0hqSlF0MmJyNXVHZTFRQXhJUlBpKzNXMFBSSngrc0Q4Wm5oOTJQNHdk?=
 =?utf-8?B?dDNVMFVBMmRCOG84MjYrdkd3RFZYTWQwcGFJZUc2cFNHdUJ5OTJjdis1c01Q?=
 =?utf-8?B?SDh6NXBYSG5BTGhoLzdnamZKTURVdUpPa1JyRzY0U2FveWVyMCsvRnpwZ1dZ?=
 =?utf-8?B?NjVyMWx2UFRpUlphT2NISEFYbHB6OERDempQbmtWUE9iSUdFVzVLaCtaUmJM?=
 =?utf-8?B?aHBUdlZVL0RHejJoY3psUzJ6SXpRQmRVSzBoV0l1L0tsT0k2U0VIenFYdjli?=
 =?utf-8?B?WkREeCthZ0F2WmxrME45dG1BcE9zZXFtRTF3K3lDdmFKZHNPelQxdDZMVnl6?=
 =?utf-8?B?ZEl5aG1ZZG43MjFLR05TQ240T2haRU1TczRFVDdiMTlmRXI3NlVoWnpwT3Zi?=
 =?utf-8?B?VmlPbVhmYTVMN2pxZFJZaTZManlNeVUxZDVzQnNCYjE1ak1Wd0hzbW1ScWRo?=
 =?utf-8?B?T21ScDAvSkxtcUJ5MHRDM3Nza1B2b2czU2dFSDk4YmFCU0hqTTNYK044SVFN?=
 =?utf-8?B?K01YNzZlME5DckpjekxyN3dHdGRZcW5zWjRRMmljWDIrcEI0NHYyMzMvMisv?=
 =?utf-8?B?SEFKc1oxRHMvQ3dybVNBdW5Ob0VVNU1wckhLT1VOT3BjN2YvcnNzb3NEKy9J?=
 =?utf-8?B?MEFQODc0WTV1N2h3T1dhTm1vYktqYWVkY3dWaVljYXNVNzJ4b1JhZW11SnFI?=
 =?utf-8?B?Y3l4S3NjbkZTSnQ4RHBGcWZkU3dqbHgycW1ZSE0ySXcycWRVK016NEI1b0FZ?=
 =?utf-8?B?blBGcjJLVkVwS3dDTmp3R1FiNHdKVFVGRXhPM1J3Q01WbDJTNXRhRXdXTnBr?=
 =?utf-8?B?VExWRW9BeStFYUNxY3ozSDUyRVZ3NGozWlY4QWhONDZrYlloRlZOODlmOHVn?=
 =?utf-8?B?ekhNUFNDamJhV0drMW5yVDRkVUsxTDFjK21xS3RQbVpreFdDa2o2OU1NRVdj?=
 =?utf-8?B?a0tabnBnb1lBTGhHY0dEOFl5TlFzdHJTNHJqT0NsZmhlS1F3bWoxOWN1MXhr?=
 =?utf-8?B?ejZNRmpFMFhZbXlBdnp3dUh0Q1BxaVVhQnRtYnF0dmRrODZ5UVE5U2NPNUxX?=
 =?utf-8?B?VHFDczZ6djFBUHFSdlpHNkRFRHVNdWVOb3EveDhPa1h2ZTZYVGZBMHZzUUQz?=
 =?utf-8?B?MEpBTXgwWTlnYVZvWVlRMmhEWWlBd2FCOTk0TXRlc2hNL0ROV2ZKRytOUHUw?=
 =?utf-8?B?Mm8rN01oY3oyWkovaHY3VHhYdTgycnZSUll4bDBuV1JTTE5waXExVVh2WDBZ?=
 =?utf-8?B?NFE3cWIwbWlFNW1Ya1AwOFdINW00QllIczM5S1FuMFozb0ttVW80bGM0RHZB?=
 =?utf-8?B?SUtSQlNBOFYyN2h0SDFOaloxcDlHNzhaQVRRT2gxWUpOeUFNTVFzb3JTcUdE?=
 =?utf-8?B?em1Ta1BDb01BMjF3NDRJUlFkZmMvT3NsbXR2WUpHWkVvUlFRbUM4bi9DSnZM?=
 =?utf-8?B?amFQQ1VLVGdKMGlNTVNPZTl1Ny9KTzdQUW9pOWZORDhDbXRKWGNqTm9ZYVRU?=
 =?utf-8?B?WUJBL0VOMzZTanNIQVFZMjNKd3VwU25KRTdVdVJOUU1RTzBPcll3SS95QWli?=
 =?utf-8?B?QTZsWVRGZVQ4VHRiVnhWYldOYmRkTmxPS2pqdUhhY0JHdmxqUUVSR1NjSXVI?=
 =?utf-8?B?d1FpM0w1MnhiTDR3dEY0UWN4RU8wVkhhNDhIblc2REVEVFd3cE44djloUHNo?=
 =?utf-8?B?L0JCbktyKzh0ZlYyN1c1Ry9UY1diU0tCQ0tWVHNDS1J0REVqQWtPWTE1UkM3?=
 =?utf-8?B?a0ZRMGx6S0M2a0ZUZk9RRjR0S1ZkcGppVXU4SjRaMmlrWnV5SXhQaDFVT21h?=
 =?utf-8?B?a2NwRG14NitHQXlRM0xmVWVQNFVTdWFmVlNhdDZGMXRrNGpwWVFWNllManpY?=
 =?utf-8?B?RC9kVDE1cDc4RFJ5Ry95YldNUFRXTktpd2RHd0hBbVI0eVNkekdhY2s1dVhy?=
 =?utf-8?B?ZXNLaXFvVjJvTWdqU1RLVDdrbHdiUkZCYnlFbkdIUjN1bXd0bzI1TXJPOUN6?=
 =?utf-8?B?OGRNQ1lGRk82SWQrajNESnVwQ0dKbmR3b1diTFJaT2h3dGFjZ0FNWk16WkZ6?=
 =?utf-8?Q?qEpR3iWPE8qbWmIX3iBoXV2hW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 693abcb4-c693-4653-c7ee-08da9fd721f2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 15:52:36.4565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vCtyOqnDTXHwDEpn5JQIdFymBPXNCOmoIdO6oZ3xLCDb5fbsjaIdD+ftXPZqa6K1c0WgFBmeZHDOhRQJHIN9XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9296

On 26.09.2022 10:33, Juergen Gross wrote:
> On 26.09.22 09:53, Jan Beulich wrote:
>> On 23.09.2022 10:20, Juergen Gross wrote:
>>> My favorite solution would be some kind of buffer address qualifier for each
>>> buffer (e.g. virtual, physical, SG-list, maybe nested SG-list). So the new
>>> hypercalls would not mean "physical buffer addresses", but "qualified buffer
>>> addresses". By requiring a minimum of 4-byte alignment for each buffer (can we
>>> do that, at least for the new hypercalls?) this would leave the 2 lowest bits
>>> of a buffer address for the new qualifier. If by any means an unaligned buffer
>>> is needed sometimes, it could still be achieved via a single-entry SG-list.
>>
>> While this might be an option, I'm not sure I'd be really happy with such
>> re-use of the low address bits, nor with the implied further restriction
>> on buffer alignment (most struct-s we use are 4-byte aligned at least,
>> but I don't think it's all of them, plus we also have guest handles to
>> e.g. arrays of char).
> 
> The unaligned cases could be handled dynamically via the single-entry
> SG-list.

Can they? The first example you gave, the bitmap passed to collect the
output of XEN_DOMCTL_SHADOW_OP_{CLEAN,PEEK}, comes as a handle-of-uint8,
i.e. generally large but not necessarily aligned (even if in practice
the caller likely will pass a page aligned buffer of multiple pages in
size). If we introduced physical-address bases replacement sub-ops, I
think we would make the buffer described by an array of GFNs, not even
allowing sub-page alignment or size.

Jan

