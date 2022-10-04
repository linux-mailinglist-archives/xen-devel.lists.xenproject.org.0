Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 204D55F4403
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 15:15:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415548.660149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofhlM-0005WT-Ms; Tue, 04 Oct 2022 13:15:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415548.660149; Tue, 04 Oct 2022 13:15:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofhlM-0005UP-Jo; Tue, 04 Oct 2022 13:15:08 +0000
Received: by outflank-mailman (input) for mailman id 415548;
 Tue, 04 Oct 2022 13:15:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ofhlK-0005UJ-JM
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 13:15:06 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2059.outbound.protection.outlook.com [40.107.22.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8fc8c7c9-43e6-11ed-9377-c1cf23e5d27e;
 Tue, 04 Oct 2022 15:15:05 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7865.eurprd04.prod.outlook.com (2603:10a6:10:1e2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.31; Tue, 4 Oct
 2022 13:15:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 13:15:03 +0000
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
X-Inumbo-ID: 8fc8c7c9-43e6-11ed-9377-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eb3MQ/w8ptHweIjKkwuiD5oaEOT50/oIyUrKQP++OShUTclJEkcII92I/hzVwzQSDPveZeRsjZyY5j6nboatAMk1tUnFAhYzPjfGqsfpqRmU+95UXFKwyfXVLEMvzFFHLpwnpp4alB0c1GSeo4zVEjqY6ZqZ7ZjrEeGvZRLPtIP7DP9rsywxQ1odQ7dAhx31OWXfYilhuC8c0tx0W1AmMp9qrRd6PQTv01imdMdgHtCp/ScMkMNAV1e7TNVZ03Z5grFN/XFKp3ocEAgHHFygDYTVIQ5vD4WUF9F0gfCuXmGmcDt0pGkb/7l2JPj0xY1uwv1cWLElgymgcOX3QrpRiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WY28JleGgm14bR/Hoq9wXLhD9K8eFTzfudYbdELTh2U=;
 b=ENv1VkAA6L/aafP4KmMVnfzgkpo8UbRoePDEK0mnkDzuIuNOI0Rs4esYL6q0/3Ulqehh/g8IZABvnIlnKuLg7hc1q1FNpaURVmR/PbTQCUe82pqnresJ9uA7hqfq1tMSrEdfmjDj9OFaCGGQ+ulhImfj29vAUkE/XNL93B5XQsfNxxUtBUnJkzYgpF+BItxkMj+Lz3DHjKMvcEqw/2A8use0R4mNQ66ik5CAl4c/VYmMXDmu66WXmX0hBYoZYl1TCFNhwkwHWzJcEl3JST1r5Z17W2q/lu8HCOKNbruMlxGSc2Mn4BGPVhmMMh001KWLaqMlA74Y5LNM6QqX2L1llQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WY28JleGgm14bR/Hoq9wXLhD9K8eFTzfudYbdELTh2U=;
 b=Z7lG3ob8O4yG61JFnUyx1c+VHpmF+1yVApZ/HZ/3K1Oy+6gqUE/sb/7Tg0uMhkPSTDykafilM2i5gj/xpYGqD7yIZ6N+MRhS/D3Fz9w9ZNkQ82qMvyWlOmqdzBC0myY4uoY1+BK1lVJxtWvSSCtVuiZkxn5HVMzGRnQ/G5olLLmQ9jwHuUt7vQiiSAZcXUmrTdNUoPZ2TxCYHRtdKfXL3nNMxik+0YnRXGbSC9e6M1BqvCtqolyhE3aqdb9TrMkXEYzyzZ9u01qRum0eSNF9YM/AUC4B6P2br9Tl+zr9QYCrT7tkOAekM4MxVdiN7kOcpoNOLks+TxkBFHdO6hVfvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5c0f68e5-145a-1616-a128-a2b1a602c1bc@suse.com>
Date: Tue, 4 Oct 2022 15:15:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH for-4.17] x86/efi: don't translate EFI memory map MMIO
 regions to e820 RESERVED
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220930141737.67574-1-roger.pau@citrix.com>
 <e3235c0f-5964-0f95-fcc0-bcc44bf9d784@suse.com>
 <Yzv8lpnf28aXgQQM@MacBook-Air-de-Roger.local>
 <ea544e76-0dfd-4f24-89ef-25265f7b049a@suse.com>
 <YzwkXh+8xzbCZdkO@MacBook-Air-de-Roger.local>
 <2d49fdfa-bd76-0469-0840-6260c5a8ff48@suse.com>
 <YzwuJTOtcIopeOlm@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YzwuJTOtcIopeOlm@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7865:EE_
X-MS-Office365-Filtering-Correlation-Id: d5f66f00-ba43-4420-4bdd-08daa60a72fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	36/iQytJByrDeMEZ6T6AOWADHbeZEWx3ISWYf6c4llxJNqxhDf9sBI1sCTdNi3RfWj9sfBsmnvgASDHZwHob+Lv7sC5pwrKOcxIdFPSIfzkAI/zBJnzBRlvycCxdOsI00QIYGawBdIfttLI9gzfy2NzRzfivKpQdSqDPh5D1NWw+D6MIi/Sy+NsGqQNCmGKQ5/fG9RjJ5qUsw1hJDQ8+JSDqWNQ0cEgVvOEMlXtj7OBjSE7uq+9n7yVOcQdkZwz6YOZZqdoZSUx1wel4i1lOso1p9N1/rnhK6NqLonNImbidBrvSJafK0CZM2GMtmdpNjgyTxj4poUvQC3jYgNGJc32ct+kx0btxBmECWu+jcLMp19smleYvbIu8Ru7GpWESUHUXVhV8cN8IkWmKv0jUwHcz4Z1uk/ljiw/Jq/T/aL4YibHJgM5gW96MhJbPWMRU/c1WvOGGo2cmej9NNeZGs3JJUFalhRLQxs6+T1BOIn5do8PPIOFpSmlJ4qEi3pRK9Rh8N+V9XeTpQMquUW9tvRFnKlaQFuJw81b4/8M2NK8mXXxR1gNB3OMYSk9MnprgV92mU7J18Zdsf6oxO1zAzUMRbCoxsGSFRuSS7s2HlqLNHB/l42Wr38W4dnQGtdRMECrtKN+xLyZdOSuX4wMrVBK0oSubB/hSIrpVlgnqa4v94sHtYTcHs9LpLIJWViq3KUlsL04y0eeQI2ma4OQINhZp7riQ4oMH/WsZ6xnunTpdWOaMrGYx2ecmm6/12yvbxRupcvndIPCS4eAGqPPzMSOBZnVgVR8M2s/zDlEtEas=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(366004)(376002)(396003)(136003)(346002)(451199015)(2616005)(83380400001)(186003)(38100700002)(5660300002)(2906002)(8936002)(6486002)(6506007)(26005)(6512007)(478600001)(6916009)(53546011)(66556008)(316002)(66946007)(4326008)(8676002)(66476007)(41300700001)(36756003)(31696002)(54906003)(31686004)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y055TnE4VWxZVjdDVk9BZWpkYXdTQWJqUThXUC9lYzlqMTF0eDI4ODNOdGVa?=
 =?utf-8?B?L0VWRjNiaTNEOGtrR0EwVk9PVnhuTXh0Nzk5RTVDYkpxWHQwUW5QZFVpcTJt?=
 =?utf-8?B?OFYwWi9abHF1akJmMkduczhua3cvSm93QTcveVd2WURYbER0REJRZ2V5dTVy?=
 =?utf-8?B?YmhsUU5Wd2srNXAvcWxOU3h6TVhzblNTdHl2Q001MEZTVmhzbkJIZzJzc0Yv?=
 =?utf-8?B?aGdSQ0hmYksyL2x5S0NtR0pNZTViS0NUWHhsRFE0UnVzbkR1My9VZ2lzT2Y0?=
 =?utf-8?B?TEFTc1NKMXd5Qk9vTFhzOTVGNDRtNldneklZS05TSW5QRWtGdy9iQ2VRM2xB?=
 =?utf-8?B?MHR5RUloT3duUk0rcG1QNFJJRFRUMWtzbHdSb05lb0NOclpTSjJaRERTNFd0?=
 =?utf-8?B?Y0crYVJtWmVneGNyY0hDQkh5UWtkSWM1KzhZaGNBSkIyL1VMVHNiVEpyQXpF?=
 =?utf-8?B?KysxUG91U3Jnd3lDQU5KbVlLcHhGa1dKbTF0d0QzaThpV3BnZ1dmSUVLZTlP?=
 =?utf-8?B?TUttRUQ2bFpXWnFxY3F6TE8xMHFWWTBTaW03eWsyTmNXb1Z5RmthTEZtSVJN?=
 =?utf-8?B?TXJ6ZGhLZkdXTWRnMHJvamkvRW9LdTdjdkZYZktjUSs2WWh5cGh6RlNiNjc2?=
 =?utf-8?B?dzFtc0ZGSnRIYm9uZFdWelJXYWo0bFVQOUwrYkFhODk3clZsZnI4YW9sWHM2?=
 =?utf-8?B?dU00UytxSEdoTDYyNWxIS1dWTHBndStITmcxZkNIcG8raUM2WmNyZ2E4ZlpE?=
 =?utf-8?B?SkdGQ0owMndHNGQ4ZG1WVGd5akdCWmplR2ZkeTEwK3NYVENQbzAxL2VubXVz?=
 =?utf-8?B?a01JQk9zY2VwTmtNK3dvYkk2WHF2dlgrVWpjRWd5NUdRalZzVkwzRHYyQmRU?=
 =?utf-8?B?bitmMld3dHFKM3J0d3ZleFRPN2RQaU50d21nNDNtUGlUa1VUaVo5S1FDMXFo?=
 =?utf-8?B?c1RaUTBKVUpCc3B0ZFpRaXE1VnhLZ2RmKy9HVjJVRVV1Rkx1SC9Gb2pwajVo?=
 =?utf-8?B?MzUxbnBEQXFwbFgwNXlhTHM2Uy8xOEY2WEtPMVlIY0N5Y1ZxVGFIcXFCK2Z0?=
 =?utf-8?B?N0taL09hUXd5cWw1ZXd0aXZidkZPaVJTK2YrU1NVUEEzc2doL3B4aEJ5bHBk?=
 =?utf-8?B?OUd0alNHK3VUc0N1Qjc4NnRORHlLYklUZ2gxYXFadHZMMjEyZE4wOVRscmYx?=
 =?utf-8?B?N3haYVNnTDR1U0Z1OTBRSUhHZStDb3YyRlJLZndkOUJibkpQRjRKV0xvakpt?=
 =?utf-8?B?b0J0eU1TQ0xJZDRnek42MXVHNmpsNEgxcnd4NFFyZjJDclBEUkNvNmxNc0tH?=
 =?utf-8?B?WG5SYkIzVUxJQlBPek8wOG01cHdaTUJDSXRqTEg4U0tVeXd2OUxsVG41cmJa?=
 =?utf-8?B?L1pReDM5ZzRjRzg1RUhiVlJuVksyQUZhMkNMdC9QUWM3WXIvUGZTZWpHN1Uv?=
 =?utf-8?B?TkxKY1ZMZW55U2IraUZGVVdtMG1mazhkcVVWT1BBNGxhTENSZGUyNTFpY0Ux?=
 =?utf-8?B?RTVrUDdmM1pUUlpYd0JITVo4MG5uZldCbmlZNzVlMnNPUHZXVHhpbTY4ZHZy?=
 =?utf-8?B?aXFaV0FtR0Nmc1JNR3R4Zzc0bW1FSnlDcmx5TklGK0Q0STRQSkVkTHlERkhi?=
 =?utf-8?B?UFZ0dHBGVHFwK2F5bzhlWEdTOFBDQlp0R0tKTVBHeUxvbzR5blJwK1VMcm5H?=
 =?utf-8?B?Vzh2cXlreGd3RFExVkI0bVpUWnY0WE13WGJ0WDBBdHN5a1VVaVd1bmtMSTVN?=
 =?utf-8?B?bHJZNEpEcXBSRC90d2ZOTXVWMXhVRW5HR2E0eEtoSUNMK0tjUmJQemFnMkNv?=
 =?utf-8?B?Zm5DaksrdlBuRVRFaCtIa2JRQVQyY2F0YUpJRXlpdG9XdDAyTjRKVFoyTXJR?=
 =?utf-8?B?ZXVSbGVqWTNxejUvZlJETk1UNVVZaFFoQ0E1VVRyZUxQQkdJY1E0c2xIczFS?=
 =?utf-8?B?ZEpxUkRsTXlBTE5mNjcydm90K2I4bERPY005Yk5pMFpHUFBIOVpzNVBjNFNr?=
 =?utf-8?B?ZXUrL2JVejlOYzZBVUxidlhyOUNDdVhmTmNCMWJXY2dyK240UGxaeHhSYnZO?=
 =?utf-8?B?VlZ6T0d4L0pyRW55azRHd09vOWFSZFh5aWd6aXRzWisxVVMvSjRReDE0QkVT?=
 =?utf-8?Q?M0LggRyftUIpPRHAqdLKwEfa1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5f66f00-ba43-4420-4bdd-08daa60a72fe
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 13:15:03.6592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0O7CgoAbiUisN16+oiAtjV3OQbR7cw4Mhp47DS9G1FvXQAbYdARDjN+CXWzMpg2jBN/fQ1suJy0rDm9uaiJVWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7865

On 04.10.2022 14:59, Roger Pau Monné wrote:
> On Tue, Oct 04, 2022 at 02:21:20PM +0200, Jan Beulich wrote:
>> On 04.10.2022 14:17, Roger Pau Monné wrote:
>>> On Tue, Oct 04, 2022 at 12:40:10PM +0200, Jan Beulich wrote:
>>>> On 04.10.2022 11:27, Roger Pau Monné wrote:
>>>>> On Tue, Oct 04, 2022 at 11:01:18AM +0200, Jan Beulich wrote:
>>>>>> On 30.09.2022 16:17, Roger Pau Monne wrote:
>>>>>>> The EFI memory map contains two memory types (EfiMemoryMappedIO and
>>>>>>> EfiMemoryMappedIOPortSpace) used to describe IO memory areas of
>>>>>>> devices used by EFI.
>>>>>>>
>>>>>>> The current parsing of the EFI memory map was translating
>>>>>>> EfiMemoryMappedIO and EfiMemoryMappedIOPortSpace to E820_RESERVED on
>>>>>>> x86.  This is an issue because device MMIO regions (BARs) should not
>>>>>>> be positioned on reserved regions.  Any BARs positioned on non-hole
>>>>>>> areas of the memory map will cause is_memory_hole() to return false,
>>>>>>> which would then cause memory decoding to be disabled for such device.
>>>>>>> This leads to EFI firmware malfunctions when using runtime services.
>>>>>>>
>>>>>>> The system under which this was observed has:
>>>>>>>
>>>>>>> EFI memory map:
>>>>>>> [...]
>>>>>>>  00000fd000000-00000fe7fffff type=11 attr=800000000000100d
>>>>>>> [...]
>>>>>>> 0000:00:1f.5 disabled: BAR [0xfe010, 0xfe010] overlaps with memory map
>>>>>>>
>>>>>>> The device behind this BAR is:
>>>>>>>
>>>>>>> 00:1f.5 Serial bus controller [0c80]: Intel Corporation Lewisburg SPI Controller (rev 09)
>>>>>>> 	Subsystem: Super Micro Computer Inc Device 091c
>>>>>>> 	Flags: fast devsel
>>>>>>> 	Memory at fe010000 (32-bit, non-prefetchable) [size=4K]well
>>>>>>>
>>>>>>> For the record, the symptom observed in that machine was a hard freeze
>>>>>>> when attempting to set an EFI variable (XEN_EFI_set_variable).
>>>>>>>
>>>>>>> Fix by not adding regions with type EfiMemoryMappedIO or
>>>>>>> EfiMemoryMappedIOPortSpace to the e820 memory map, that allows BARs to
>>>>>>> be positioned there.
>>>>>>>
>>>>>>> Fixes: 75cc460a1b ('xen/pci: detect when BARs are not suitably positioned')
>>>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>>>
>>>>>> In the best case this is moving us from one way of being wrong to another:
>>>>>> So far we wrongly include BARs in E820_RESERVED (_if_ they can be
>>>>>> legitimately covered by a EfiMemoryMappedIO region in the first place,
>>>>>> which I'm not sure is actually permitted - iirc just like E820_RESERVED
>>>>>> may not be used for BARs, this memory type also may not be), whereas with
>>>>>> your change we would no longer report non-BAR MMIO space (chipset specific
>>>>>> ranges for example) as reserved. In fact I think the example you provide
>>>>>> is at least partly due to bogus firmware behavior: The BAR is put in space
>>>>>> normally used for firmware specific memory (MMIO) ranges. I think firmware
>>>>>> should either assign the BAR differently or exclude the range from the
>>>>>> memory map.
>>>>>
>>>>> Hm, I'm not sure the example is bogus, how would firmware request a BAR
>>>>> to be mapped for run time services to access it otherwise if it's not
>>>>> using EfiMemoryMappedIO?
>>>>>
>>>>> Not adding the BAR to the memory map in any way would mean the OS is
>>>>> free to not map it for runtime services to access.
>>>>
>>>> My view is that BARs should not be marked for runtime services use. Doing
>>>> so requires awareness of the driver inside the OS, which I don't think
>>>> one can expect. If firmware needs to make use of a device in a system, it
>>>> ought to properly hide it from the OS. Note how the potential sharing of
>>>> an RTC requires special provisions in the spec, mandating driver awareness.
>>>>
>>>> Having a BAR expressed in the memory map also contradicts the ability of
>>>> an OS to relocate all BARs of all devices, if necessary.
>>>
>>> I've failed to figure out if there's a way in UEFI to report a device
>>> is in use by the firmware.  I've already looked before sending the
>>> patch (see also the post commit notes about for example not passing
>>> through the device to any guest for obvious reason).
>>>
>>> I've got no idea if Linux has any checks to avoid trying to move BARs
>>> residing in EfiMemoryMappedIO ranges, we have now observed this
>>> behavior in two systems already.
>>>
>>> Maybe we could do a special check for PCI devices and allow them
>>> having BARs in EfiMemoryMappedIO, together with printing a warning
>>> message.
>>
>> Right, that's one of the possible quirk workarounds I was thinking of.
>> At the risk of stating the obvious - the same would presumably apply to
>> E820_RESERVED on non-EFI systems then.
> 
> One option would be to strictly limit to EfiMemoryMappedIO, by taking
> the EFI memory map into account also if present.
> 
> Another maybe simpler option is to allow BARs to be placed in
> E820_RESERVED regions, and translate EfiMemoryMappedIO into
> E820_RESERVED like we have been doing.
> 
> I will attempt the later if you are OK with the approach.

I might be okay with the approach, but first of all I continue to be
worried of us violating specifications if we make this the default
behavior.

Jan

