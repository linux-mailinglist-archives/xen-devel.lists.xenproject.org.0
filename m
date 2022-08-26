Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E46EB5A2199
	for <lists+xen-devel@lfdr.de>; Fri, 26 Aug 2022 09:19:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393662.632740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRTcH-0005Lj-HX; Fri, 26 Aug 2022 07:18:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393662.632740; Fri, 26 Aug 2022 07:18:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRTcH-0005If-Dl; Fri, 26 Aug 2022 07:18:57 +0000
Received: by outflank-mailman (input) for mailman id 393662;
 Fri, 26 Aug 2022 07:18:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cVPj=Y6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oRTcG-0005IJ-Jb
 for xen-devel@lists.xenproject.org; Fri, 26 Aug 2022 07:18:56 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130041.outbound.protection.outlook.com [40.107.13.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57c79da8-250f-11ed-9250-1f966e50362f;
 Fri, 26 Aug 2022 09:18:55 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8743.eurprd04.prod.outlook.com (2603:10a6:10:2e1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 26 Aug
 2022 07:18:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5566.015; Fri, 26 Aug 2022
 07:18:53 +0000
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
X-Inumbo-ID: 57c79da8-250f-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y6R2EsmKOB6pWg9ht8BhV8C8nZR26S65VVvlZZeJnd23lmv2rBKajkDaRXESd8QL9lyZfWp0osgYfcpZSCRTcRB59HB1z8i7PgX0nLxMJBddyhh5j3XBnLa5GA6mMUL11eq/jG5QUOuemGutb7X4IBMQDqSvZpcwD+oxF16AirkAkdMMcpVA1vaWDU8zzse+Jt9KNaPtYk8+4NEG3MjnHhMSfduqJI4agWfizqendB0TBeUqZPhPFbu6bE45UMnSCxRjhIzoCk3fSKUdLTIJiWomtxXZiRooOzx7PLAbXw/jN+rlCtSB5UWZhgrG7eOgvyzUBrjklb4HrQsoUmEX4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fERJhCbW7Qhz8g7gxHu9+eACuNs4lGe0G2DrDRCF94c=;
 b=bvzQE0veLxgWzs/lN9WpnczQKAEzWzC+HRjxBVGES5fKY6PWayUtPE7cJESmwN/tRsdFwotIR1ssZzn1XI2pZmbYSFVDK6+XS8a9d6IRSmmblzqalpau6XY3pl/UDwdM+Ibcxa0itseBFyzVwLuf696JH6fYVnAo3jSiOMQxzdktI8e7i4+deP/ND2PFpKV/BoUYMnkbW6d7uVCWFw34KYlHJNlyfpLrVHDXXZtVidBqibndpxbkp96FSxMW4ITW44ORfApbPdvg6IMvYUW1evzcklqEVu+9C14SgZ07PiHDzl2a7BrUtkRXSdx2oKAQdoa1B6ec2h0Pd4MWEJklAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fERJhCbW7Qhz8g7gxHu9+eACuNs4lGe0G2DrDRCF94c=;
 b=gj0S8PUSEdkpnj1haGI9ly78yLt3z52mgVazs92P8E47iBsjOhMYNcPmvY2GeGYn0r25dnMkq56BidgWZ9VUhMk/PBe7NxhnSbiY00r8D3hJ21vsp6m3S0PRlBYjyrNv6zIlEwhwU1n7CZyOEyfXE3Z7ZeQ/Tw1YYVBa0Ft8bp8AFJE6K0eRPeDeE2BrJYbXULS1Wk+VS6gSy7l5BFnJmQ2idRhlc3exBa2XQtp+ph8Re6cbRxRNjtXdOm6mjzUfjeRyBpau1lHC4DwTezStaB2OYpZzyjZgUSDj6kS/MFp6hODs1ykOG4HQAFpFQGuvZFM7q8s5F81Bt6sRrvqlIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ab973fa7-85db-af53-9d4c-cfb8c2099135@suse.com>
Date: Fri, 26 Aug 2022 09:18:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] Make XEN_FW_EFI_MEM_INFO easier to use
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
References: <20220824210452.3089-1-demi@invisiblethingslab.com>
 <df443aab-a2eb-75c2-3a4d-df6d093b5788@suse.com> <YwfdpPH9PyPXlMAa@itl-email>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YwfdpPH9PyPXlMAa@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0045.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::30) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b86099a-b649-4b87-d03b-08da87333af0
X-MS-TrafficTypeDiagnostic: DU2PR04MB8743:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZLn2vNlb8DlXkkIrW7gXdCcR/nuqnjP1O+bb8KtDk/e/NC0fOMvfNIkBLHaD5FvbLMRtWIwqC3EuLLypDrQQNNjwN3xUPo5RLfRIhJ7iDp0iJKDfF0LqrUIhjySYBwkHJsAIiZrkfzSnqgcGKHQ0ia47rIjGwAoJXzfILCaGQbEk0FcvF25wuc1uCDgpDEiCcC89BwbE8X3r55lXmcgPj//OoXluovvUk66SwXbiPiE4RFqjK6R+gy6c0nnD1I15m20l6zOlwfpMHHnReiDZZyBZMWeytfoIQEN3TPueG3LI7sXinpIkkESDMMCpwy6uBsV16NYzPJhLBGLGKkYAY0dtWTbNqoDIzjhhEUJ3G00+rl9fdBWZ8LF0YnjmC6cVhJsIEXV/jXqYpyn/uMPwkHcyrzttuCoK7/7wfgRJGJuHdZQge8Wdw+Rs/SRZFZ78qX9M7gAf4ohVFKNn1i4ap1KQ0EcvLhmFP5ZLgrrYcpGbdm+nm0808E29gFaCaFl/iyUZ1lMLvLJl7QxogjHDTiApeXmc/I8y07tYEVuG7KbSP/IZCe5e/gY+/3HrU42PdYAe+XoQ59UZ8gfzOR+ZCCs+rUBJtl+vQF0oMbKcQuuzlDcJnlzSyKQopywqk7/ppCiIUUtlj9cVXI3WMGUhVXS6BUMiU63QRf17hFtgU4sE15alINe4lIjd6aiqVNEbRCPa8vHtY0gQ+I+u057kXJF2L+aLZPUuBlD/PGHMkAVqNNnpB5vMyDF4LejfKwUZKcJCxqrYXR6L8E896lSNMnhMlruMgqDtFJxwdJhjRH0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(39860400002)(396003)(346002)(376002)(6916009)(54906003)(6506007)(2616005)(6512007)(26005)(31686004)(2906002)(6486002)(53546011)(36756003)(86362001)(5660300002)(8936002)(31696002)(316002)(38100700002)(66556008)(41300700001)(478600001)(186003)(4326008)(66476007)(8676002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWRsd1AwS2dpVjBqYXgxbGFDTTI0YjhkaktYRG5kdWliaDZwSzBrRi9EcDl6?=
 =?utf-8?B?bko3ZGhORlp2Q21VczgzVjFJc202MXJVY0RBYy92eTVLZFJPMlp5NWE4ZzZz?=
 =?utf-8?B?eW94LzlvV0hlRm9iZzFpSXdwK2ZOejd6eVFZMUdhNEFvR2dtWlcxcncyOXBH?=
 =?utf-8?B?c2RlNU0wMkJZWk9sUi9PalFHUXFmeTBXYTZBQ1F0SXBab2c5M2VHdWtsUEZi?=
 =?utf-8?B?L2dQTUxnR0tSbUFIeTE3OHJlbkVuMHhJSFlSUitIWGNmZkJUbFlJcVROUTlD?=
 =?utf-8?B?dXpDRGtVL2tvQUtLQWVNM3FraGhiemJFVnpqNC96L1hrWWlsRDRtUkUxOEJr?=
 =?utf-8?B?VnJtZ3BzV1AvSmhxd3prQjlSMVh5WFRMWU0zekhrZm9US2ZDSDIxQjFTb3Fs?=
 =?utf-8?B?Tmw1Zng4WlRaOTA3R3NDTGcrLzR4aURFODIya3QyUE1CNlZVSlpkQTZJSXA1?=
 =?utf-8?B?MWZWSWc1NlhmRklQYXVZQjFMdVF3czBwVHhkMTVrN295dFVwN0lNc2EyT2RS?=
 =?utf-8?B?NGl2QXdTRGdGb2dHV0xGclo4Y09IMzdlMHk5Z0JsWmdHdld2NVk4K2Y1WlNs?=
 =?utf-8?B?dTcvd1ZnZDVaaVVJVyt3OHpkaUVtMnN4VDBycVZjQ25tTkJEVHZ0UDZMSmEr?=
 =?utf-8?B?aFdtUDhyN290VHZtNkQwbzVBdGVYUzlrTlMxMitPVkZtNDI0MDA2OFVGMFhq?=
 =?utf-8?B?SUhoRnAyZ1BMRFFqN1E4akFCdkJFbUZRZ1QyQVQ4NmM4V1dUdSs1WDJTK2wr?=
 =?utf-8?B?YUNHeU5vd0JaSHZlYURzZDl5NHBrcS9DZXk3bkVQYzY1WFhWdENabTR4MHZN?=
 =?utf-8?B?UU1jcTdKdnZjUHpyNjdYb21LYXFaZW1KWkl0bzF5VjlVQTFIcjN5R0hIbEdi?=
 =?utf-8?B?Sk1FVm0yWWQzL1MzQUE5RXlINWFYYWF4ZzFaSWp2d0xyWkxheWNLMDU5YUlF?=
 =?utf-8?B?bHhZNGxyK3F6ZzJNVUd5K0xNcFVPdnV5OHZMQUdDalMvdHRRVFZ1cUhyT0Rt?=
 =?utf-8?B?SjBPMDN2eFNUc1g4VW9JSUhjalU5QmF4cnVkYjUwRFN2WDV1aWRmdHI5OEZ2?=
 =?utf-8?B?VHUxNm4rQ3lqQU5nNThLZm5GVHlxZnhIbER3Ly9aalNRTFhXMkZNbGwrRnZm?=
 =?utf-8?B?b0s5ZDRHOWlwUlNlVCswQ1liNHl5dnZMdVd0OXlWWnRrbkh1L2JLQXhCdFRN?=
 =?utf-8?B?UkdqZGNHY1pDbTVKbTJTTU5vTUJ3bld5S0FKaEFtZnh4dDBFZmgrS2hiU2Jt?=
 =?utf-8?B?WUZmaEtGeDZPNlZldWJ2TUNsWE5BSFNUL29XWStyWkVyM01meUFCZXR6WS9H?=
 =?utf-8?B?azVLbUxJNm94WlhnT1NrUy8rVllkRkw0ZFVuM2hId1M5enhPa0NsN1YyYW1K?=
 =?utf-8?B?Rkk3aDMyaklXNUJsK2VaNlJSdExzYnFIOWxIZEFjRWNVdmQ2QkhtY2pCc2Rw?=
 =?utf-8?B?SHRObXNrL1l0NTh3NmN3dDB2YUE2S2NUalhOOUxXTTJycVJMOTJ0SUF4d3dl?=
 =?utf-8?B?MkJKQzBKazJOVzBXRllNS1lpdDF0cjZqTEF3UkdGbEtqRzZ4dm9xQ1Mxei9p?=
 =?utf-8?B?cFZyWGpOeCtLNlZZdzBBM0U0WlZOS2N1YVd0Qk9teFpMVFBoRnloK1hLSnVJ?=
 =?utf-8?B?OW1RRElrU0VPdTNQMEQzRUhjWDltbDR1czVkMEJmRjBYUWhZM1E3MmovWkpV?=
 =?utf-8?B?QkI1S0IvcEpZdzVIOTVUZkJYZjNzNDRBV2I0YkpRSFNRYUh3dWQwNXlVcExv?=
 =?utf-8?B?UU1GNEtFN3J5Tjg2cG5DMlpZbEFZRHhLVTh4ZnNBc3RDaXhERUVxNFF0cHBk?=
 =?utf-8?B?MUJlTFg2UUtmWHgwaEFSbnlTVmt3ZGVaQ3pEVUFvM1hpSXIyb0xSdTV6Nkk2?=
 =?utf-8?B?Mk1pSTd3Z3YzT3JqdFhFL1hFNWFaNWFacWFZMVJUVGNRRUtNUlNaRUVRWXQw?=
 =?utf-8?B?aGtOeHArM3Azb0hhVkpCK3oybTZKMzlwRklKaDA1V2gwUmlrL0hBZEJPM0JY?=
 =?utf-8?B?emZPaFpjaGFzeExSSVZLK2lpeXplR0VVSTZJWGRUMkVZU0pCV3lteWxtSHpD?=
 =?utf-8?B?NnlRUytWb2hlL2xTcjVqb1FydlRrRXFMVWd5d2Y3MkVzVElNMU42NERRMita?=
 =?utf-8?Q?biWcAJv5y3PdeYGD14xdJfYQs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b86099a-b649-4b87-d03b-08da87333af0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 07:18:52.9694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pyWgaqJ4oGjZ2B6vxPCVCnjZo44+ZkdwCiUu+rUAEs9bmudMu0XdlKBgN+z5jnvnO505wL+TxWzL4KkmTdTjdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8743

On 25.08.2022 22:36, Demi Marie Obenour wrote:
> On Thu, Aug 25, 2022 at 09:59:56AM +0200, Jan Beulich wrote:
>> On 24.08.2022 23:04, Demi Marie Obenour wrote:
>>> Fix both of these problems by unconditionally setting the memory region
>>> size
>>
>> If you were to report a larger ending address, why would you not also
>> report a smaller starting address?
>>
>> But before you go that route - I don't think we can change the API
>> now that it has been in use this way for many years. If a "give me
>> the full enclosing range" variant is wanted, it will need to be
>> fully separate.
> 
> Does anyone use this API?

The XenoLinux forward port of ours did, and upstream Linux still wrongly
doesn't. The two functions efi_mem_type() and efi_mem_attributes() still
wrongly fail there when running on Xen.

But how does this matter? Even if we were unaware of any users of the API,
we can't know there are none.

As an aside: Something's odd with your reply. When I opened the window to
write this reply, Marek and the list were put into To: (instead of Cc:)
and you were dropped altogether. I can only guess that this is what
Thunderbird made of the Mail-Followup-To: tag which your mail has.

Jan

