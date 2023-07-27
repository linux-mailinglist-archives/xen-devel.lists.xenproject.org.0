Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD96765465
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 14:54:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571099.894124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP0Va-0004rP-KV; Thu, 27 Jul 2023 12:54:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571099.894124; Thu, 27 Jul 2023 12:54:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP0Va-0004p6-Hj; Thu, 27 Jul 2023 12:54:22 +0000
Received: by outflank-mailman (input) for mailman id 571099;
 Thu, 27 Jul 2023 12:54:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5Ij=DN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qP0VZ-0004oz-8b
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 12:54:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b327a6b9-2c7c-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 14:54:19 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9186.eurprd04.prod.outlook.com (2603:10a6:102:232::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 12:54:17 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 12:54:17 +0000
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
X-Inumbo-ID: b327a6b9-2c7c-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jb26wsM5ZPewlc7jy8IDlpUwpVDQout/CGm/h7TlkrzZlqu6CXC9/1vfF+bwEeonanDPBpUl4WpOn2r0qgVJyXjNKCArQRCpcbJ0Mjp0Wvj5pUaCSN+UwwAi+O3Q+JDw+C/U0iihpHp0A3HdOJgAPHrXgXbvA9VSTd1zzxq7IkhntkY+7kvz8MS1EhUar+wh0DcD/6vlYYhoNj32BQEuiXOOTPxIzAqimcved7QwcbbYIvf9YyXlTDvTD9PpVyEr9mfS0WzBpftQYTmgvnMlXrgxv5u8B0hu65PPbg3TzBRA5N4qGxVE9kgCEo9EulThDjIoMNmunRjre/9Kujceyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZqKODGiIbEg0iNIQxY5CQvG63OHcDBu6UTgRDLULsU=;
 b=c3gNTCi7MX24Xxfz2zlt6ZKRvzYXqLxzH+XCxpqUu9rygGV2HuWx2OI/HWNA/Jg2yR/DLyfD+xG7f8sq2hxE+vvwWaQzX358YuB26HlFCdIIcneBtSyJ0ywuBU2Q69ziOaYeql2qKKxiTZvEK4calfYl9J+ZNQMqHXEcVU430HB1gxr+vUyMjaNwIftm0LOQr2gkkUHoGcM20AcGMAT8AU/MuG9D9vOOlzxvjOggsbD5HzXd82PCDC57SSIlzGj7IEXNUG4kPrytwA5FI6BfU+6OqGk7yEbd8qzCvO7qhB87bkezojXmCibEazQLqaRTULHzbVjQyy/XpFTur5HMEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZqKODGiIbEg0iNIQxY5CQvG63OHcDBu6UTgRDLULsU=;
 b=q+AMHBRTtwBPPQJaH1MyByI6+Yajl7T9v651tNs86/6oA8p7IBdGXRCLKtqlnjLgf8FWpQxjKkMhPuzgi97/WqJSiZue90z7ZQYO7SUugyrLeumf7zn5Fgdi4m5qZPxymbUFKEDbSXcuWoXmmZzxEC7u9/vKyrr85U4b5WLkGcK8FGxj89EqZTzVN2v5cM/PDN4vYgF4C8A/qpNsvxYyfCV3FBjU6hEr1mquhxBdWDpKmR4amdJFH3RPowNBvB830P4dZ6hSIyz+C0XEhm3SjGDECEFL9sRH+sUYd5AKhw82aG+ZIH8H9BXMToe2r0Oc7oppuuRndgwcCOL4sMrEVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7ab3c4ae-3903-29de-ba32-d328b426d104@suse.com>
Date: Thu, 27 Jul 2023 14:54:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 03/10] x86 setup: change bootstrap map to accept new boot
 module structures
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Luca Fancellu <luca.fancellu@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rich Persaud <persaur@gmail.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Christopher Clark <christopher.w.clark@gmail.com>
References: <20230701071835.41599-1-christopher.w.clark@gmail.com>
 <20230701071835.41599-4-christopher.w.clark@gmail.com>
 <alpine.DEB.2.22.394.2307081144340.761183@ubuntu-linux-20-04-desktop>
 <CACMJ4GYE6PW1SY35dhs4XkXd9ru25igrvMCrh4pJMWEBNNz0YQ@mail.gmail.com>
 <CACMJ4Gb_ZwKSjP7qzfQj98YQjSpBdFuWzeGQJUNNqst0GdXCOw@mail.gmail.com>
 <4e0a0fc9-0c1b-4725-5692-de67ee68a980@suse.com>
 <2994c9b8-c803-1fd9-20df-0d25d2b66c49@apertussolutions.com>
 <ca85fd2e-45a5-32c3-cb4b-1042be6c6915@suse.com>
 <32a22c57-1333-47b0-c61d-abff8d7df112@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <32a22c57-1333-47b0-c61d-abff8d7df112@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9186:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bc58950-824e-454b-f4cc-08db8ea09622
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A0vwkPgBx/nl3D96vHeA7W/H4QOc1+XdOyvkn6LB0gFQ0R0UaC1osoTWSpAsZK+gWR0wo+dGfBw3Plw7ztRsQUf46B5+yX2HQme6hDc2Iujr2vl1fGNlhZXc5M7qVw/BoEBC5WcsdLAiyMPELU/aLZHWMXOPc8uvF81AOGL2SILEUjD0Tq2dv++RAhC9cYSH/BOQ94sHHK7PJ1JedWBCWz6wW0gxeHMYzPPp3df/vX57AvYR5x2JigSyAJZYdxy8UA3z1u/zd7MQVKwVvRpg+gOsFIYtKU05nYtNKEbZf1qk5N0/JI8BSZCQm6Qh7Vd3GmkDa9i9uTx6Vj8zsyhDM/Tlp/2bePOrq2N/rogeH64hg8+ugrpfUWdb/BNKpQzW1QoNfg4f/JRbK5GyLQUqlNZOQ38LcwSmbw1sZOZEcVYLxzOckIuuTbZUbfMieq5kxrmeuYHZkp4qGDaUgZNcxAgJc0oebg0cR57gdD7TkWYPbdKswvhOLvnxPcPUt3FxbBlVPnSPV5inKO+SnAkmt0XWwV7ws/58y42nkLsFf3h7eflVUSYQMmGTrPC9cXtMexPEvV8evwE5SddoS1Wv8xTLPBsptjPmUV+P7b/3/9B0OFgHT0ZfNXdEYGmVkhN9/rees5K5v3+RK8zb0W3QIQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(346002)(396003)(136003)(39860400002)(451199021)(2906002)(66899021)(41300700001)(316002)(7416002)(5660300002)(8936002)(8676002)(36756003)(31696002)(86362001)(966005)(6512007)(53546011)(6506007)(26005)(478600001)(6666004)(6486002)(83380400001)(186003)(2616005)(31686004)(38100700002)(6916009)(4326008)(66476007)(66946007)(66556008)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUpWK0hxNnlKVUZNL0xQYjdWMXlRbzVmZkdOSjhNM0hLRUtjcnpCRG5oRjg1?=
 =?utf-8?B?dFBsWUxjRUhPYlNLVHBIZnZ2cG5QNnM2bmZoVU5LYnZzKzBZK3JycEMwQW5x?=
 =?utf-8?B?cHVJSHVjQTZVejlTNkpVSWxBdDJ3QjVWMU0vVFhxem1MUUdRYjJYQ2NQeFJM?=
 =?utf-8?B?SWREZnZXd3VNc1ZlNGVCaVhpTFZnZVUwNFJxV2FkUVJoMXBxMmY5aXNPUk5K?=
 =?utf-8?B?NmJ1a09oNVYvSmxzTjlOMkEvNnlMK2lxc0hKUVVkc1V4Lzg4Z0xnMmRyalQ4?=
 =?utf-8?B?ekNFL3NFaC94TlRWcnp6UGU5NzIwMkhhMXM3NThpL2tIWnhTS3dJTzBqYXFI?=
 =?utf-8?B?TW5XWHRMR1pLVTFhdWhNWmw4emJpYXdhcWdhWTJ1YWJYaXBwWmlSSVFzRVBT?=
 =?utf-8?B?MGVubXZCQUkzOFBYZWdRVldZSy9SanpSYTdCbzlzMUF0dlhLOENQdXpOYzgx?=
 =?utf-8?B?b2lnNElyK0FqbldCVVRCdE5uTU5mak9oaDFvSFRjVW1IZWlWZ2dad2NhL3RP?=
 =?utf-8?B?K01jSFh2TUVrYytjUjNJbTFjRVk2SnFjKzVTS0g5VzFMUzdqbFM4eWZhWmJ1?=
 =?utf-8?B?Nzc2eXdxeTBXdDhDek5HVE15M1NUQWNyUGkyejVQMnBBU2RObkltYVFJSWNy?=
 =?utf-8?B?Qk9KY0ROa2poajYzdDBFSTNIZG9sUGoyVmJNYUUwUnJNdUlPL3FZeTFMaHRP?=
 =?utf-8?B?VEl3bFlEemRkREN4MFNPM1hUQXlTd1E5Uk50R1J4K0oxbXpDQXFFbUVjSWU3?=
 =?utf-8?B?NGFGT3loaWc4ZjBFRmNlU254SDhwVmxPL1I2U2FveGlMVEdHYnJzU3dEbmJD?=
 =?utf-8?B?WmM1SVBkalpCdlF5Si8wY01Wc2VyTlJHM3k0WEJ6c001NEoycGZoNlB1U2Nk?=
 =?utf-8?B?dUloQmU5Q0JiMW5aeGVWMGJSNm5kWFNLSU9BNXRyTG5GREtqRzh3ZnB5dHQ0?=
 =?utf-8?B?NUtKTExOMFRpVzdPWDZZWXJmWHZETStJMGlrU0xWbElEd3I5d08yemJMMlFh?=
 =?utf-8?B?dmFveEVwaVQwN2Z2TnNhaDRpY3lDVW9ZZ0poVklneTdZN2NjK0dXOGMvVFRJ?=
 =?utf-8?B?NnlzNWFlUSs5SWVBcjVoZHNSOXlleWpRaG44a0VKQ0JRUFh4SDFoaTVCbmo2?=
 =?utf-8?B?WmdLRTZoVWV3SDJwT2w3SVFHMkFhM1VpR1RiK0dQaURHZWo3WmlRaEkwS0pG?=
 =?utf-8?B?a0MwbmlDSHNRU01ETnRId0Jsd2ZKQVJpYWtYc1hTM1lOaUdGd0FZdWxkL2FD?=
 =?utf-8?B?RUV2ci9FcWYxU1FNMkVMTjB3MzgwZlhCaU5tOWVDeU5TTTZnTnhZSFFrbzJJ?=
 =?utf-8?B?bGQxSkx2U01QbjBjdVhWU2MvNFpCNnN4bzNpZ2IvTStNeDQrNGM2c3dvSmpL?=
 =?utf-8?B?WEFBZFkxeTVobTIyNzhmU3FRMFV2N2NvaXNDYXVVVEJ6WUpCcUlUWFJGMC9O?=
 =?utf-8?B?VmVXa1ZmUmhCTzh5WWp4V1lVY3p0QitmM3RTVGZWQkdreTJCS0VBZTAzV0xS?=
 =?utf-8?B?aXFNTVJYVzF1NW01aHYzNHlXYU41TlUvRVdZSGplRU9LZkpOcG9OZ3NTZW5J?=
 =?utf-8?B?NEhZdW1KeUE4MXpQUmZSZUNkTkI5bzJQT2o1aHp5QU9vMmNtaUhHMmdNVTlu?=
 =?utf-8?B?bERJajMzZEhNNE51endYakllUGFZbndsb1I3K1NCWkIwWkxqREtGSVZLZnRK?=
 =?utf-8?B?MGdUYnBmOGxrazhEMS9NZ3FLNDU4VDU0QnVSMjhxdTFLZnk3TGNadlY1QXBI?=
 =?utf-8?B?NGtrVEJ1djdCc09RWkZHalVqOTJHb1VlSUlhc2hTYzIyUGIrYjBKYWMxLy8z?=
 =?utf-8?B?b0pkaWt3VkZSY3U3Ylc2bXBKa3I2SERTSzd0V0hlS2ZBMkRJc1BqdS9sWFVu?=
 =?utf-8?B?NDJRMGwxVXRvWkN1KzlSNXRPWGpNNEhoenVxWkNPbDlvOTJsenNtZkJrb0RM?=
 =?utf-8?B?V1RtdDN5NHFmSVBWQlpIVWVxTXB2VzZPcHJZK3NxeWkyZmtHMEJOZGNaTmpk?=
 =?utf-8?B?Sld4elNRcU04V1Z5TUpPT2hNZlptZDNHM3Eyd3ExS241QktGaTdrRUFCcnVM?=
 =?utf-8?B?dncwZlFMRWJ0OFBIcUNLVDZZamd6SDRYNjJUeTdndGdLVlIrT1h5ZVNjUEpa?=
 =?utf-8?Q?MU+1VwrmzHkytSB6PHmt5z1qC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bc58950-824e-454b-f4cc-08db8ea09622
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 12:54:16.9052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2locTVLxDqn45vxGjLyD7biYxq2Xd7PuqBTqOQzQvxkw1Vs2eiOqVP8t7mDY+xrKBCsWBnZ/W/IdqFE6zTDVFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9186

On 27.07.2023 14:48, Daniel P. Smith wrote:
> On 7/27/23 07:58, Jan Beulich wrote:
>> On 27.07.2023 13:46, Daniel P. Smith wrote:
>>> On 7/21/23 02:14, Jan Beulich wrote:
>>>> On 21.07.2023 00:12, Christopher Clark wrote:
>>>>> On Thu, Jul 13, 2023 at 11:51 PM Christopher Clark <
>>>>> christopher.w.clark@gmail.com> wrote:
>>>>>> On Sat, Jul 8, 2023 at 11:47 AM Stefano Stabellini <sstabellini@kernel.org>
>>>>>> wrote:
>>>>>>> On Sat, 1 Jul 2023, Christopher Clark wrote:
>>>>>>>> To convert the x86 boot logic from multiboot to boot module structures,
>>>>>>>> change the bootstrap map function to accept a boot module parameter.
>>>>>>>>
>>>>>>>> To allow incremental change from multiboot to boot modules across all
>>>>>>>> x86 setup logic, provide a temporary inline wrapper that still accepts a
>>>>>>>> multiboot module parameter and use it where necessary. The wrapper is
>>>>>>>> placed in a new arch/x86 header <asm/boot.h> to avoid putting a static
>>>>>>>> inline function into an existing header that has no such functions
>>>>>>>> already. This new header will be expanded with additional functions in
>>>>>>>> subsequent patches in this series.
>>>>>>>>
>>>>>>>> No functional change intended.
>>>>>>>>
>>>>>>>> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
>>>>>>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>>>>>>>
>>>>>>>
>>>>>>> [...]
>>>>>>>
>>>>>>>> diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
>>>>>>>> index b72ae31a66..eb93cc3439 100644
>>>>>>>> --- a/xen/include/xen/bootinfo.h
>>>>>>>> +++ b/xen/include/xen/bootinfo.h
>>>>>>>> @@ -10,6 +10,9 @@
>>>>>>>>    #endif
>>>>>>>>
>>>>>>>>    struct boot_module {
>>>>>>>> +    paddr_t start;
>>>>>>>> +    size_t size;
>>>>>>>
>>>>>>> I think size should be paddr_t (instead of size_t) to make sure it is
>>>>>>> the right size on both 64-bit and 32-bit architectures that support
>>>>>>> 64-bit addresses.
>>>>>>>
>>>>>>
>>>>>> Thanks, that explanation does make sense - ack.
>>>>>>
>>>>>
>>>>> I've come back to reconsider this as it doesn't seem right to me to store a
>>>>> non-address value (which this will always be) in a type explicitly defined
>>>>> to hold an address: addresses may have architectural alignment requirements
>>>>> whereas a size value is just a number of bytes so will not. The point of a
>>>>> size_t value is that size_t is defined to be large enough to hold the size
>>>>> of any valid object in memory, so I think this was right as-is.
>>>>
>>>> "Any object in memory" implies virtual addresses (or more generally addresses
>>>> which can be used for accessing objects). This isn't the case when considering
>>>> physical addresses - there may be far more memory in a system than can be made
>>>> accessible all in one go.
>>>
>>> That is not my understanding of it, but I could be wrong. My
>>> understanding based on all the debates I have read online around this
>>> topic is that the intent in the spec is that size_t has to be able to
>>> hold a value that represents the largest object the CPU can manipulate
>>> with general purpose operations. From which I understand to mean as
>>> large as the largest register a CPU instruction may use for a size
>>> argument to a general purpose instruction. On x86_64, that is a 64bit
>>> register, as I don't believe the SSE/AVX registers are counted even
>>> though the are used by compiler/libc implementations to optimize some
>>> memory operations.
>>
>> I can't see how this relates to my earlier remark.
> 
> Perhaps I misunderstood what your point was then. I thought you were 
> taking the position that size_t could not be used to represent the 
> largest object in memory addressable by a single CPU operation.

No. I was trying to clarify that we're talking about physical addresses
here. Which you still seem to have trouble with, ...

>>>   From what I have seen for Xen, this is currently reflected in the x86
>>> code base, as size_t is 32bits for the early 32bit code and 64bits for
>>> Xen proper.
>>>
>>> That aside, another objection I have to the use of paddr_t is that it is
>>> type abuse. Types are meant to convey context to the intended use of the
>>> variable and enable the ability to enforce proper usage of the variable,
>>> otherwise we might as well just use u64/uint64_t and be done. The
>>> field's purpose is to convey a size of an object,
>>
>> You use "object" here again, when in physical address space (with paging
>> enabled) this isn't an appropriate term.
> 
> Because that is the language used in the C spec to refer to instances in 
> memory,
> 
> "Object: region of data storage in the execution environment, the 
> contents of which can represent values"
> 
> ISO/IEC 9899:1999(E) - 3.14: 
> https://www.dii.uchile.cl/~daespino/files/Iso_C_1999_definition.pdf
> 
> 
> 
> With the following two interpretations of the spec for size_t to mean 
> (any emphasis being mine),
> 
> 
> "size_t is an unsigned integer type used to represent the size of any 
> **object** (including arrays) in the particular implementation."
> 
> Wikipedia - size_t: https://en.wikipedia.org/wiki/C_data_types#stddef.h
> 
> 
> "size_t can store the maximum size of a theoretically possible 
> **object** of any type (including array)."
> 
> CPP Ref - size_t: (https://en.cppreference.com/w/c/types/size_t)

... according to all of this and ...

>>> and labeling it a type
>>> that is intended for physical address objects violates both intents
>>> behind declaring a type, it asserts an invalid context and enables
>>> violations of type checking.
>>
>> It is type abuse to a certain extent, yes, but what do you do? We could
>> invent psize_t, but that would (afaics) always match paddr_t. uint64_t
>> otoh may be too larger for 32-bit platforms which only know a 32-bit
>> wide physical address space.
> 
> Why invent a new type? That is the purpose of `size_t`, and it should be 
> of the correct size, otherwise Xen's implementation is incorrect (which 
> it is not).

... this. What C talks about is what the CPU can address (within a single
address space, i.e. normally virtual addresses). With 32-bit addresses
you can address at most 4G, when the system you're running on may have
much more memory. Yet in an OS or hypervisor you need to deal with this
larger amount of memory, no matter that you can't address all of it in
one go.

Jan

