Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9045E9DA9
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 11:31:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411575.654551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ockRq-0007UX-Qx; Mon, 26 Sep 2022 09:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411575.654551; Mon, 26 Sep 2022 09:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ockRq-0007Rs-Nd; Mon, 26 Sep 2022 09:30:46 +0000
Received: by outflank-mailman (input) for mailman id 411575;
 Mon, 26 Sep 2022 09:30:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ockRo-0007Rm-OS
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 09:30:44 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2075.outbound.protection.outlook.com [40.107.21.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4b26b5b-3d7d-11ed-9647-05401a9f4f97;
 Mon, 26 Sep 2022 11:30:43 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8384.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 09:30:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.016; Mon, 26 Sep 2022
 09:30:40 +0000
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
X-Inumbo-ID: e4b26b5b-3d7d-11ed-9647-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EyqlxPK5QqNxzYovsaI7oHssxUTcfj5OvTRXltZXDewLNDwIoFLRH+Hp4NqVBH9HlYZAckCsAHMsb78WMwm3VfP1bbcip+6/p+MWMirPjECEInrse9yWwPubmkqgxyMMoKzCZcFRbnXH0ia7tENgA/83UujHvHqn/XT3xjoaZYjsXdCmANiaNnpYR4KLR9kEit7L1Uk8DLbmUmK4MBqUXznT7GcTZPLiJvEtkg+NEnetKUmu7KVssfHuVZc0YBNtib2iNEbKell3QQ+lUZyv8+BYm50OgL8bmvR/qWEEoJqaQxFYTq0Gek6AUvXw1d4W5ATfLzToGui6SMj32rsbOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=36aA06mf3eqFMteeQaZDhocyqplfnDuQ1lntQKtwgmk=;
 b=eDh8UPnE2Wp6ByYDXB5V1AsgMWbJg4RJcIC1sAVnnyhaGObxefflbRtqtjM0T1zyCHDTW62GSTgizT1PhYw+wHx9F4uYYSFFmTp72GuS8YtolaENT7FlbCOVK+VvvfWp6hxq/NGf8oc2AT9p6B67QDovVJ0ZwQ6IoYolos9ZJS/ZuziBufUAL3JV1BUtErzxJWpL674+puOlzhZjzN84vZuYG8Ylm9DPEblYS9PseRYpEP3MhnZd6xMcfJYrAwJli/yUkRS0p+9nOZlrBm9bMGFll0/bR3Aoen3fTyn7D95oU4H92zizQI/2iplCDuLENgUYra8J/s5AE+qScBz1lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=36aA06mf3eqFMteeQaZDhocyqplfnDuQ1lntQKtwgmk=;
 b=zp03Mw06x7faG39/oldN8g0bPMKstq3r1eIcvfcFyxVM0VcMMQ/02iaz6cfW2MhrhO35sSkFCUJX9q7zHl6pEfWMtsNH0ALoa/ZvZV+FNNP8OTe1/6agAbJB38tnKzdds6zp5PDeIzGISc1ZBX6wYW2NDKluaJAuBqcw7FPjWIQlUm/nUlqIWWy7Q7Bio5vJyOi8H/oxkLN8FoNMnn9j3dfUH9QqROhHbpaLRm1Vfj1pYhqUxMfB/43HNPNroo1AC+MpB/6D76a+K4tjUMRA1xcXS/JlsSQc+1pBy6H/VmAd9Sy6gdoZwWPXaGC8iMJA2djuRY+2UvUgfmg3LWJlDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <065ff8d4-2f8a-a771-e3a1-6853bb332b3c@suse.com>
Date: Mon, 26 Sep 2022 11:30:38 +0200
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
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8384:EE_
X-MS-Office365-Filtering-Correlation-Id: 931cac15-5e2f-4fc9-991c-08da9fa1c708
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0KyZQw+IONyLT30xahyaHji3aizzjhqb0MsTJm4H6eB23Qp482pGLndHYibwcnFqG2If/3KZPHAraiFHrKH6q4+gf8InS/wNQgiPnKM+uL5ncggLKNwBCoR+7f4SJJL7GQNhHLw/djQmkg5SjF1dT1NeFVkeviibjNzGpOUMtAEppQY0iMHBWflnRwZbpL/TjigAF3Z0yW1p64sofbzfpXy/Rm2oi9Zkce/nrD8o3cuVZcYKsU1MYbcOmQvBZMR/4/Y3qj+iH5QKYPQBCuOh/O/dpmzk73Wn1L4YQVq8efiXm958bnpJJws47sy4Dtka4ZHabju/DXgfX1VLVVo8pmNXH+ABwg4sxqzU4bz8FSeuQe9LINtdWlEyDyXqKLQYvYjrffcuZzkZ+ivmGOPteK5r9kzAGF+8+rIWLjY+oRynJyGjfnpn5ij0yrjKWSMOatRM4dKV31Yhbhv5J3vWw2lWhQ7lrB+BzThtyM02xH+fsVg1+Q+71VPEYfyO5B3HTkXd/YM18cqjijv0LWpozSznBGWPizChX/7yEXj8+CkSlSJtD5/QVonJ4hUVje4118K5YzGyzzhLwLlK3tN0sU4UC4EKFgmeSHc5nd0Ge9l0HU7H0uhfKdjVwUo1DKrcMZ8srW6uIOSCzP8C75qurJQlkXZFTcnldbgbxKCJwcRzFJ+LwMarEn4qvxxOke39eVuAWeLtyevj+BzkglXTHYVSzrdEy6zqaFQmgTVEaWrgOpYmKkvRMkXjWyWG03lygPnU2of6X90IPYiJEhE81/438Nmw6Nmd8Dx/Wvxghvc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(346002)(396003)(39860400002)(366004)(451199015)(186003)(2906002)(66574015)(83380400001)(2616005)(38100700002)(36756003)(86362001)(31696002)(53546011)(66476007)(66556008)(66946007)(478600001)(8676002)(6636002)(66899012)(54906003)(37006003)(316002)(6486002)(4326008)(6862004)(8936002)(6506007)(26005)(6512007)(5660300002)(41300700001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUdidndKL1hLWU5wR3B5YlFFUXRVa042RW54NDJzQTdJOXlQcWh6d2l1amNa?=
 =?utf-8?B?Y2J6S2FoWllIM2M5VU50Um92bDJJVFljZGhGbkJ1L1pDenZnSjhzc0p0K3g1?=
 =?utf-8?B?WDFVdTdLZ3RBeG1BYndWTnROT3FTTHl2MU9SSk1ZanRXL2xnUFBDSFg4VGF1?=
 =?utf-8?B?dFBYRTkrRGNnY0o1Q3cxZXRIMzBybDFIdkR5aXZyN2F1L2lmdTczZjdYUFBY?=
 =?utf-8?B?K2xpUG9PSjlDcjNnM0ZXSEhZc0xsYjJMS0xwYjgzUTZ1N3Y5emR2djJhSTY2?=
 =?utf-8?B?aGs3eVZSbDlhTVdjMEM0d29XRGk0d2ZtS0ZYV2hManVYTzN6L3RlczJSYjI2?=
 =?utf-8?B?TVNFRExyRTZDWXhMS2Z4OWNWWWFrMlA0NmFYdDg2cEY0bTA0OWRIWVlGbGkz?=
 =?utf-8?B?bUF5a3BtNURSbnR6YmplZGtsaXRSRjBDcFQvRDhDMUwvMUJhcFBmUHNjZThG?=
 =?utf-8?B?cHRvQ2xwWDJkd1BITUNqMlFWMXR6bWFjaEh5eWEvMnhTbHpNM200amRMUEdB?=
 =?utf-8?B?YmJScHZGbGVnTEVIeTBpbzNFZ3JoaWJlU0tWa1R6Ym1KRUYvRUV0SjNORDcr?=
 =?utf-8?B?VTRkRmRpMEVZTCtsTll3KzFkMGR4REJpRnpDOEt2UGZOZFJSTTBQdTV0WUtm?=
 =?utf-8?B?bExnKzQ3OWdpd2ZzMGUrVWcwVHArSFBGdFZkdGpMK3crY3g2NDEzY2hFZmlt?=
 =?utf-8?B?citpOEdxQmpIZjBVbW11aG1kcm91aENvSjBJYXBRbmFvVXh5NXlWRHIvc3g3?=
 =?utf-8?B?aVA0dmJuSWlweFhkc291RS9RY0FZWjhsQmR2Y3I5MEE1bHpiUUR4Tkdld1Ux?=
 =?utf-8?B?Qmx5d3hPTEtsdEZaVG04Z09JMUV0czVrKzFnTVV2bnZKNktqR3I2NVUxMkZ3?=
 =?utf-8?B?WEQxOElYZjV3L2hJTy9jSG1MaGU3SjNMUWgwQkRPRVcyaWRnQXNSTlk3aDAz?=
 =?utf-8?B?UWFDbVk5SS9XQ2x3ejRsQVRxcFZZRVMyQlVhYXVVY2Jxa1BjWjlud3ZCZFI5?=
 =?utf-8?B?QTZhaWV3UktGYnhET3A2QU9MT2VPbEZOVk8rUnFVTTQvNjJZN2NqellPcjVR?=
 =?utf-8?B?NERtK2pZdmdBZGNTL0t5ZFN2VnUvaFNHcG9iVE1MYXRKZ3JOSGRMSVJURm02?=
 =?utf-8?B?SmNaV1NyZ1h0QXpHV0FrWHZSMlNoSzJYdGc0S3NwTkpudzdCWmtCK0pEOG9C?=
 =?utf-8?B?ZDRaWCtwYnp3OW5Md09pV2J2ZWFMMnpxbHZSTXhCKzFOb2R4TU1xTnB4SVVp?=
 =?utf-8?B?WVlLdTFmU1VKbTJ6eHVxamsyeDkxS2FyNkp2dVRzTzBYMjRVODZtZzVqdE1R?=
 =?utf-8?B?T0NDeDV4NFNOcllYMjM5cXdPNTNpZWN2Y2RuTGczakkxSFBMYnh5WFNBZmNU?=
 =?utf-8?B?NDNLbklWUXVvbTlOMDduTU5mQkdhYVRCQVdyVHZJbTl5Qy9xT2NWUDdaQ1cr?=
 =?utf-8?B?MFFJTnpvMWFGWmRyODhrTFVVSzB6QXZFK0VjdWdQakJqSVg1N0hkZWd6TnY3?=
 =?utf-8?B?c1hTd1gzV2RqTUQrOTdyVkdDejNiUThIeTdMaTgzWFI5a1dmWlQydE5DSk5r?=
 =?utf-8?B?c1pYQktJeG0wUmRWZGtqRWV5M0dJYVpES1h4RE00dExmdGNTVVdOZnNqaE1U?=
 =?utf-8?B?WW9wUzFlbEI5aDBrM2huMXhwWWorZmt2WnAzMlNWOUpFZGZhWktCcER4SXhl?=
 =?utf-8?B?TnZJdHJZckp0WjcySEtvWDUza3NEdTNRb0VsQUdXb1dIS3p5ODdHNTh6a0o3?=
 =?utf-8?B?QXZaN1RzcjdzZ1IycTVjM2hCeDVVQmFxNXBjQWp1akdSMDlrY2pIR2FPWG51?=
 =?utf-8?B?SWRpbXFVMHFlOEhlMFpsL2dMUUZkUExleDVZc3R2T2lzc3ozU3FXUEd5Rno5?=
 =?utf-8?B?dHlRZ1FWeU1XUllTUUlrRVJFUWhEVmVOQXdJQ2liTU9ocEFjdXdlV0RoTjhp?=
 =?utf-8?B?S1lTZ3AzeWZ3U2E5NGQ4UFhsS09RWWJPRU80OUJrN29JUENSSFFnZ3dMcmps?=
 =?utf-8?B?NzRkZUZRclA3M0hXL0syYU55RE5ERElHZnVxUGpabUFGL2tPMFA5RnNIbzli?=
 =?utf-8?B?V2dBRFk5aXdFZm5DZllEVkVZMUcyeUVCSWduOHhBZi9XdnM1dnVnQjRiWWUy?=
 =?utf-8?Q?c8KBxRkVSkzAvJToa5436J+Oq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 931cac15-5e2f-4fc9-991c-08da9fa1c708
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 09:30:40.5845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xtoAadFzmEdwwEbipscocJe6fhFjoynNdSOEBHj+zZPgXzLJa02zZT1KpMy9cchHdluMRDG+S19XLKYroD5AEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8384

On 26.09.2022 10:33, Juergen Gross wrote:
> On 26.09.22 09:53, Jan Beulich wrote:
>> On 23.09.2022 10:20, Juergen Gross wrote:
>>> On 21.09.22 17:53, Marek Marczykowski-Górecki wrote:
>>>> Session description (by Jan):
>>>> In the course of working on an XSA I had to finally get PVH Dom0 work on at least one of my systems, in a minimal fashion. This had turned up a number of issues, some of which have since remained pending. Therefore I’d like to gain understanding on whether there is any future to this mode of Dom0 operation, and if so when it can be expected to be better than tech preview or even just experimental.
>>>
>>> ...
>>>
>>>> Jürgen: PVH dom0 performance?
>>>>
>>>> Roger: it's bad; mostly relevant is qemu interfaces
>>>>
>>>> George: only for safety certifications? performance penalty may be okay
>>>>
>>>> Jürgen: hypercalls can be improved (virtual buffers?)
>>>
>>> Some more thoughts on this topic: Having hypercall variants with physically
>>> addressed buffers will help, but there is an additional complexity: what
>>> about hypercalls with really large buffers (e.g. the bitmap for modified
>>> pages for guest migration). In order to avoid having to allocate huge
>>> physically contiguous buffers for those purposes we'd probably need
>>> something like scatter/gather lists for hypercall buffers.
>>
>> Not sure. I'd rather see us add new (sub)hypercalls for such non-standard
>> cases. E.g. the bitmap example you give would be amended by a new flavor
>> having the caller pass in an array of GFNs (perhaps, as you say, with
>> further indirection to deal with that array also growing large). I'd
>> really like to keep the common case simple.
> 
> The question is how many hypercalls would be hit by the not common case.
> 
> Taking a quick glance I spotted:
> 
> - grant_table_op (subops setup_table and get_status_frames)
> - memory_op (several sub-ops)
> - multicall (main list of calls)
> - console_io (console data)
> - mmuext_op (some ops allow lists)
> - xsm_op (not sure a buffer can span pages, but interface would allow it)
> - physdev_op (subop set_iobitmap)
> - hvm_op (altp2m handling)
> - sysctl (multiple sub-ops)
> - domctl (multiple sub-ops)
> - hypfs (node data can exceed page size)
> 
> Do we really want to special case all of those?

Looking at the Linux uses of several of the ones covered by the top three
entries in your list I find they all use contiguous buffers already, to a
fair part because of limiting maximum number of entries. Therefore I don't
really think all of these would need special casing, until a reasonable
use case is demonstrated where such large lists are actually needed.

Jan

