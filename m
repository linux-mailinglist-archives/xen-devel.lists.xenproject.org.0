Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E58364ABE9A
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 13:38:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266798.460504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH3I1-0007EN-A3; Mon, 07 Feb 2022 12:38:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266798.460504; Mon, 07 Feb 2022 12:38:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH3I1-0007Bl-5S; Mon, 07 Feb 2022 12:38:41 +0000
Received: by outflank-mailman (input) for mailman id 266798;
 Mon, 07 Feb 2022 12:38:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nH3Hz-0007Bf-NI
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 12:38:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfa07ba1-8812-11ec-8f75-fffcc8bd4f1a;
 Mon, 07 Feb 2022 13:38:38 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-3x787tPcO1-nh4f4bCkPoQ-1; Mon, 07 Feb 2022 13:38:37 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB5415.eurprd04.prod.outlook.com (2603:10a6:20b:93::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 12:38:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 12:38:35 +0000
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
X-Inumbo-ID: dfa07ba1-8812-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644237518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZVwdK2e0+//SUF7WggRKgo4oJIYl1NTAT0qMqKjbX8M=;
	b=AgYTBV3p3mD8LQHYEaXKS3YpOvPQQH2ZSdTiGd6N3Rk3aytygk5D9Vr8z+QFhpmSyAjTE1
	wxRzSQLKzZ+T0XHOpKFJPhmHIEovZTtz/51rMJ6dWm3LZUALetABbJJhL1HVbFnR9boFrl
	1tbZPAhz2o1Sl3t+dXJMy7J729v1Wv4=
X-MC-Unique: 3x787tPcO1-nh4f4bCkPoQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QKFCV8GaP9mHD+oUZW+jWMRsd0ESgmHR3bnAw5z/wbuyEtJvcrtdd770YCbSWluCm/oxNcwWRa711JJeNpwnt+b3GQRK1msppOgz55FnDXQD8qx1uFmW8KrZ6fKIfuwOBVIpmjVxfQcI9SGEpqfxAlP/M2zeNi2KCXV5uL6AqcnRj9bZP/dpIitFi7LjUkOqJ3k/AQZN0bd6gX2ahFIJHT32FRF/Ry4BbXJBbbXuiRtuEUHuX89r6z7wQ1zqxJzNDAmEccAnRTrG/SZTWsjEOI6dbIHhCa6V4YJybA518R0qWumzZIMS/iQrlmay58Epc4aOJPndDftLGZIHt2xGkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZVwdK2e0+//SUF7WggRKgo4oJIYl1NTAT0qMqKjbX8M=;
 b=jJwHdlXm+EYIf+YgrouEejj6cCV5/YAj/p4b0exD+Wbp33DZLvJOw+8zvd1C6rjkLxOyoqVpdf5vI6zStX9LRGBpG/MODzJ5AZWDC9DnTcQJbMzghJXb40721677ALuatPqgxAfgj4Q7olvcj7JEvKTKBRKATNOsopJeX0K3x+WP4vuYY9INb1TOPqDLr6qEgxrrfIA2E34OxM2ynZ8RcNeiogLAFcfEGq/xH4UlRJnPW9uxKMEmD5RdE7dbXyX1V+5A31ILbpKHyxoKT4HtawOJlkR9Yu+JCnchfXiQ8VO9FKAFfhlWd8uWFRzcYzFBiLeRpz0gMzYQWp/w0DQCOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <49380584-0577-96f2-ef1c-a96eabf0d227@suse.com>
Date: Mon, 7 Feb 2022 13:38:33 +0100
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2ad372d4-a181-9307-ef50-a5adb61dae66@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0084.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3cf65a11-d519-41cb-f7e1-08d9ea36c1d6
X-MS-TrafficTypeDiagnostic: AM6PR04MB5415:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB541554D9FD5EAAB0E5A7B9A6B32C9@AM6PR04MB5415.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/01hvzmpH0O1MsXx3ky9fax3nx+HOda1M1RDd78I465n8+UHtEpaIm8SeTuQdknDd4NwxKj4kvyc9oK6NtBSxQSWPB/X4CxxK3k+ondTIA2rrPafPg1WGCmvfZb0NN9clQW3Y/2egqfhRKwvXXIwxEgp9lA+aWprQnAnrV9u6UFsO7p1D29AdiTHTYl4/GJMwUvDzG8b/NPdEYm4NJxcme56kBLg+/cBlX4T+bw52JqFmXEDHbWyLFaDctqXuX54D7Z9j5veoOqjzkU55A2gTauYlHdtQfD+cC4Vqp82NyQkPFKubS8qtC80YIs5P5avThf9JA2kujHp2dSvyKoRgstZZ1JZRp7z+dgIzw8BeFIVhtWFW14Wnimkjk2bAzf5Emt8YtIjx7I2MY6Cn20jhrYJ1VZRONR8y32oyfmRKrsNWZCyg6W1j3KnxqZ8aYP7yyh1q8QI4FMRnAgGFlEfnnBrySa9zuZ01etxij3l4+j4NiByxnTfSNfm/cvaN+0finYYtTiF5CT7qEWW8EUThRmj5TFp56hG2VIOU77aDmUxC5bXseWgOvj3TvwaTQnEQk7uWFcLgOrjzjt8lXqCAb0Ha1+oGjewrNVXuewGHLUQMolBtux27uC0KtoqG29wRH4RgN7auyL/M20LD31ZRPq6GhuFMNTvKKoHeCX1SKijFVRQCLx+VhaJl3Qj7bXkpQOTfIvVywuW7neIjyR00VCr/aVOOyV4WKlONqkhsVhvrahNO+OqxAKWqndzr2XJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(6512007)(38100700002)(53546011)(86362001)(31696002)(54906003)(186003)(2906002)(6916009)(6506007)(66946007)(316002)(7416002)(31686004)(66476007)(8936002)(4326008)(2616005)(66556008)(6486002)(26005)(83380400001)(8676002)(36756003)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmFVTUVrUVBPNGIxS09ycHpZYTlCeTVFL25WMUpGdmlkYkh1OGRnRlJIdFVs?=
 =?utf-8?B?WjZMb3FJNnFQamFjc2pGTXFiK1NINDN5Tk5jVkcwOG1Gd05pUUtFSXdXYlJK?=
 =?utf-8?B?QkFjSUhxUmhrVjJFZkF4ZDVRdUIraEVNS0Zjd1NSbmY0Y2xaZmNVOE9lOSth?=
 =?utf-8?B?ekhGN3VqMDRxbzYyTGplbWZLWEFjYzZTeFlnQ2dYbkF4cTBnSzN3OFNJU1gz?=
 =?utf-8?B?RFVpSFk4bmhBYmNlMnNINm9Kdlg2ejR1d21QeDBPcWtNbkE3K2I1UmQyQS9V?=
 =?utf-8?B?aSs0TmF3QzVPck53WVlqY3oxd2tDRzNVNTR6MnBJUk4wVU9DUHQ5NGVpSVFR?=
 =?utf-8?B?RXlGRVhDS0pIUEhlWjFob3RJc0F4eE5EaUFNbFQxQk9LYmZXRnVKTUMyVHBQ?=
 =?utf-8?B?K3F3WjJwL3RzZ3IrYXRYUDZaNFdMTEk3cDkrdzEvKysxTktUUGxWWmFEaFo1?=
 =?utf-8?B?MUJ4ZE5Ua292RGtXOHA1YWdGc1lZTWw0azd3bW54VlduUnBpSERiU3hTRndE?=
 =?utf-8?B?V25nallTdzdyWTZoQnd3UkEzNW45MmV1K25rUUhiMndTVUJkUHE1ank1dnM0?=
 =?utf-8?B?OHpZbEtpS2pFeTNZT3FUZWhLT0Q2U1JGZDMyQUpDZTBQTUp5R3BHcWRMTnpt?=
 =?utf-8?B?c0E3Zk0vbjNJeWtVYmZUelh6OUFPUFdFa0swYXd4M1VDazVZNE5qdkR0Sllu?=
 =?utf-8?B?K2hyV20xd0hmYzJzbWlSNXpaamJqY3BBUFFLWDhpbDJ6QzJuZlhEVHkxMGto?=
 =?utf-8?B?MUhuRjYxRkljd1N6d011VDcra1Y5VTB1bnVMTWtZZVNUWVUwRmVuN0IweWZq?=
 =?utf-8?B?RDIvV0lRRzFPcE9pZTZCLzZhR1BBQThFZ1BneDRyQmduNitPQVFLNVFTK1FE?=
 =?utf-8?B?dW5uazNkS05XUjdDSk1nMXY4ejhsc0hzVm5RRHJwaHE2OXBVRjFkak1JYjk3?=
 =?utf-8?B?aG5GQmlZTDN5TndXTHp3S25zQWJucVhsL2d5dlFGenVDM3N6QjArQ3FUR2FG?=
 =?utf-8?B?RmRHU1JsaGtKQ29Ma0tLb05nYmE0ODJ4ajJSUlJtd2dPOCs2Zy9uSEU1RXU5?=
 =?utf-8?B?R3RDVnhCZ0tsUVhORUZQa21VMGhNZXBPdXJIRHRsTE9BNVFUN1l3RUU3NVly?=
 =?utf-8?B?am9uNWRBbUQrak1pbXhhSkthdThiaFpKV0U0TkhHZHNhOXdMcXRsZy9EZkZO?=
 =?utf-8?B?WERPbEI0VmQ3WmxNQkE2V3RmdysxeFJPYnp3WDVSd21MYWlKeC95UklyTko3?=
 =?utf-8?B?aGozbFVQOGVSWU1QVG4zTWVVaUV1WjRrNkxWbTVXenN0Yjg2UzN3b2JIblZN?=
 =?utf-8?B?bk1BOVJiQjdsdk42cHV4R2x3NDQwTUZTWWFpTUl0N0hreFFpdkYzNzhwNzVS?=
 =?utf-8?B?Zk1XY0pNeDcwdVpiWjluS2xsdTJqNnhsQVBCT3F3OGRCdUVFbThjcld4YU52?=
 =?utf-8?B?Y3F2akpKUnB0ZlRwTVZCd3I3dGg5MGNJK0JsSVdIVUJxRGVFNm1mODdVZzA3?=
 =?utf-8?B?TDlrRkRyTExaRzVlRTJnVzQvTHJrK0FsVUd3cXZOcG1KM0pLdGwyNk90NEc1?=
 =?utf-8?B?NE1PZ2E4YlMycFhqQVJCcFV5SGlORWl5UTFlUWROUVVNWFlJVGhBZkJNT3dv?=
 =?utf-8?B?ckF1NWpUdTZHTzNIR0hvTEpncnJhQUtYb0VwZFhDQkdRSFBQMTAzSlFDNlYx?=
 =?utf-8?B?OEZtcXJmbDdIUW1waDI0UmRXa2FoWHhJRXNJdXduaUlZMlV4RjNqOGRNMU4z?=
 =?utf-8?B?cS9HRTNiQWdHa1FSMVY2eTRnaFI0T1NsdlF1Z2FyWi9Ma0o3OHhZRW12eUk0?=
 =?utf-8?B?Z2hVbVdJZmljd2Z5QmJ0K0wzSWNhWFFnQWk2c1J1T1l2Z05tcTVKTk1uNTla?=
 =?utf-8?B?NkF0Q0RBQkJ2WlJkbDBOQ2QwczR0UUV6V1hFNnBQREpWZFdXOGpsQzgxLzlv?=
 =?utf-8?B?TFdTNnlSYVBHNU0rYWtzblQ1d1BGRUd2dTdtZ2FFMjJtTk1wOVQ2UnI4M0lx?=
 =?utf-8?B?ZmljdjNNZUo1NGFaTXhtQ0ZhOXBhdUxxRElUQWx0Y2xqeW8yenhoclpxdmt0?=
 =?utf-8?B?S1pZUGhWZTdaY2dZdUpvdy9TYlBZRVlrUHZrTHpUVzNZNTcyZUZaQUthYmhK?=
 =?utf-8?B?OUczNXMzb1pPTFRuZjdzVEtLVEFHYk1zYjA0WGFOMFllaU1ObEozbFQ0ZGxa?=
 =?utf-8?Q?K1NEczcPd+CMjjdimw9Xppo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cf65a11-d519-41cb-f7e1-08d9ea36c1d6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 12:38:35.2110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jeXxsXkmG+QIiRPVn/l8E0SI1maIIX5tEgo+MLB4lSDoCTdm9I6Zdu9I9hZeVKOlFzeOh3lPwviQH0cejSmmiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5415

On 07.02.2022 12:27, Oleksandr Andrushchenko wrote:
> 
> 
> On 07.02.22 09:29, Jan Beulich wrote:
>> On 04.02.2022 15:37, Oleksandr Andrushchenko wrote:
>>> On 04.02.22 16:30, Jan Beulich wrote:
>>>> On 04.02.2022 07:34, Oleksandr Andrushchenko wrote:
>>>>> Reset the command register when assigning a PCI device to a guest:
>>>>> according to the PCI spec the PCI_COMMAND register is typically all 0's
>>>>> after reset.
>>>> It's not entirely clear to me whether setting the hardware register to
>>>> zero is okay. What wants to be zero is the value the guest observes
>>>> initially.
>>> "the PCI spec says the PCI_COMMAND register is typically all 0's after reset."
>>> Why wouldn't it be ok? What is the exact concern here?
>> The concern is - as voiced is similar ways before, perhaps in other
>> contexts - that you need to consider bit-by-bit whether overwriting
>> with 0 what is currently there is okay. Xen and/or Dom0 may have put
>> values there which they expect to remain unaltered. I guess
>> PCI_COMMAND_SERR is a good example: While the guest's view of this
>> will want to be zero initially, the host having set it to 1 may not
>> easily be overwritten with 0, or else you'd effectively imply giving
>> the guest control of the bit.
> We have already discussed in great detail PCI_COMMAND emulation [1].
> At the end you wrote [1]:
> "Well, in order for the whole thing to be security supported it needs to
> be explained for every bit why it is safe to allow the guest to drive it.
> Until you mean vPCI to reach that state, leaving TODO notes in the code
> for anything not investigated may indeed be good enough.
> 
> Jan"
> 
> So, this is why I left a TODO in the PCI_COMMAND emulation for now and only
> care about INTx which is honored with the code in this patch.

Right. The issue I see is that the description does not have any
mention of this, but instead talks about simply writing zero.

Jan


