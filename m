Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CBD6A17D6
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 09:21:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500791.772281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVTJY-0002pw-4C; Fri, 24 Feb 2023 08:20:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500791.772281; Fri, 24 Feb 2023 08:20:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVTJY-0002o6-1S; Fri, 24 Feb 2023 08:20:24 +0000
Received: by outflank-mailman (input) for mailman id 500791;
 Fri, 24 Feb 2023 08:20:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cKFb=6U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pVTJW-0002o0-LQ
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 08:20:22 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2043.outbound.protection.outlook.com [40.107.7.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13cbedd8-b41c-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 09:20:20 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7847.eurprd04.prod.outlook.com (2603:10a6:20b:2ad::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 08:19:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 08:19:51 +0000
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
X-Inumbo-ID: 13cbedd8-b41c-11ed-88bb-e56d68cac8db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cn5ossra50KLT+392CQyQdKvklrE0mVVJv5c7kOOx6kmrbfYQ3mLasAQN8cWq5yo9O/Tlv7SF5R+zrtZBGjx9HLpC2WkCVwnLgSahS34zgaURhVtttVxg2rpUvyNY+W+enajiB6TP3xYxeztXH0bTi5s/Gs8V9BwhNfAEZHPyq/L+mUpwbOd1xodzrOz8qQjp0ypPRimxK+0xhhpWQ9GJgCgbsAzmYCytR6+n7YUvyIky/T2HphDrzFRgFU7xI5rRcDIHBq+dYfdVLwjqpwUwdaIGhQa8QziWJ4MUzBpIUDcyrH12lvXz9ydq7+KJYE8AQW8SezeLQ8Dlm4rEK7alQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Gv+wYNM4QAqxr0nnC0ab+e5SwAxfWJYqyURxigy4ig=;
 b=EU8aaI0n5GS0Iiji3GK+yuZWbNjv2rySw1RBDPyLwmarVikdEECl8DKrym9A03sg7Zp5SYFWuxxkO+bJ0F/xiTnrVSCSdtLra2kVPHcE910cYU6VHG+wZaOHhoBKahRmISo0SyXdFB1VXAK69H2QqMxxKfDUZh02ox8ScVZgbosWg0HKlvhIqHfuPfKh0vDYJfQDW/Y21fvuYncXGam7dR1PQEVF9B8M7ymoZT5mfAPdxOXTpwZKznX2MTMC10nS6KeFk1NibBGDOprJoQk9xpowzjILUjsbm7YyZYMl6wjMSIqaHjCj/xApx+UPOnaLekZQU/QIKmcphwMWVuFDxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Gv+wYNM4QAqxr0nnC0ab+e5SwAxfWJYqyURxigy4ig=;
 b=Z87nXtLCwdZ0GKikIpl2H3OoSQzrLWOnqDikZGKWlOChYSc8ysoZ1mwUQ7EYG+Rk7GDAxJ4+75mpXrtJNlyXI1lquUputcx86iN5rxwdyJb+oBxvGu1nup0zZekxEwlWCNuNsZYAQfMAq9ZUua9WNv2GG9MCjD7u+WJagUaoHdwYpYoW4SA+e9BFEWAIWdj+of5EX/BdC4kV8/t+XaCENejlB90iPgrMtdZL4/bZHaMnL3waeFB3CWUoGy594kWAlKyR9qXqVmRFxZGdZI4tjFDZ9/9vZQUy8ywkgRWAtfZG9+PrCRdWPoUNvDBv8ymMNkU5lOfqv3pMP6uKs1k5Bg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <400b11d9-7905-1cc5-2ab3-e77d3fbd9908@suse.com>
Date: Fri, 24 Feb 2023 09:19:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] Call SetVirtualAddressMap() by default
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <9a0e5021a612951c4174c45099edc8a4fb5bd3bb.1677091168.git.demi@invisiblethingslab.com>
 <dc46acc1-9eb9-8091-28df-405a66879a85@suse.com> <Y/dlPXeJlPRwEB1s@mail-itl>
 <49f35c93-2235-4223-89dd-3e6256a17369@suse.com> <Y/dwd5Gkv5Ps61eC@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y/dwd5Gkv5Ps61eC@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7847:EE_
X-MS-Office365-Filtering-Correlation-Id: 895cd266-cac8-416c-a221-08db163fe675
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yNdiAkIZi9Mn3XcSHZLscTSBuGUgJc1aLyt9CmWshVFC5AGHFSfW5FQ4ZzvPBp3Flme26+SNmraV3M7e+UUxCs9GIRi5C9GMQwXyx270BaWeE5JRMnI/goTB8lI4e01G0Rig8IfncX3TMvxMuevYJKEi5FcYIRtzcgcHncWhrRuPWCoXKxhEhLkRT60yqZMg6agcM+mFYL5hXvo+htqQtAOXc6T8iSguLAHQpJqqCwFFwDUxbPhj5mkCXtzXRV/y+DbvQ5KcXNdnznAMPKZBP+4texPZmSwzerDqVLgkcxQ1NvpNhzYwjVDukE5zDakpT3mz12Nw9LfXctKnpChmG0DROQ7zNy8Jy3yeSJqT+DVi3SvXK0ut3ww14fAevDSniCZ/GYODUfoV/iwTZ51q57MIzTsWIOMvBkZ7E0bjtzkjBsXZn140yzzfTrbavjODXI3O8cT67X0d9xjurPYIOIQGzwAoVnEwJWd943RhLNr3JSVh9kR0TBUAHHKX4eLkhcGoZUUQoxKp7rZDxGGkyku3inHEAJhR58H6L6GLez6IKP0vMF3Zj0INAouCVo8fX/PXw7ExAnsIATl+NMc1Rl/cjb7nTNYd+LuWdpjMy1N0AbU5S+E9FMUHF8oi6ea8Z31u8fAaZEmTAga3fe6O/6pYpeSVMhtJelKUOT3g8R2yeKRYJNhBhzxxkagVDH4oSk+uM7tORQppLqMj8MkhfZCSuvyQbzaGtcxmbpDLeU/pq+wbrobtuNmveghXLj3WxsJl0Ggz131/Rt0N+51sPQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(366004)(346002)(39860400002)(136003)(396003)(451199018)(36756003)(66946007)(6666004)(966005)(6486002)(53546011)(66574015)(2616005)(26005)(6506007)(186003)(6512007)(8936002)(41300700001)(86362001)(2906002)(31696002)(5660300002)(54906003)(316002)(38100700002)(478600001)(6916009)(8676002)(66476007)(66556008)(4326008)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clVxRkxCTERxcUFMTkk0djRoN3ZxNEQ2eXRCcE9nbU5FNGxlN1F5VnFuN2lj?=
 =?utf-8?B?S0p2T3U1dUJOMTRHdUxYbHRHMG1Ib1c1eVI2QWJ0cWFCTXhzTzBmSUVjWXpQ?=
 =?utf-8?B?bUNhdmZsUVN0Q3Y5SUZ3bXhwZURXMUNnUmplR0RvTkFLcjlneTV2OW5KUzlU?=
 =?utf-8?B?M2dTWVpBN2MrWS9TbytVMGZxZlROQ055Mm1sa1c2STFWcVF2UE83cG1TUXVL?=
 =?utf-8?B?NGM0bkxHRW83WFJsREo2Tk5CRHlsc0VITDZsUm1YZk44dFIrL0J3dUZyK1Nw?=
 =?utf-8?B?U1crQWtsNm9MWWNTU2lHdUtaU2UyVCtPblVMeVg1d1VZd3ZZeFovT3NmMjRn?=
 =?utf-8?B?d1V0bEtCUWVhZVhSYXBrSGhJR1JIMVBxN3N4QnRJZ3hFek9oUTNpUnRNWFV3?=
 =?utf-8?B?OXBJZUZaeCs4RUliRGdIeWxsTXliZUZORWhYb2k2YThINXhKejcycVBDVmhZ?=
 =?utf-8?B?SXBaMmdjaVRYV2t5UWkxNFdGbDZiaUduUHlNNXIwNHR5ZWNlN3pXYlF6b0d4?=
 =?utf-8?B?UjNoVjB4K1VZdkxzbmMyck9QVloxYTZFR290ZVQrKzQ4cTFJUGszZktIZTZp?=
 =?utf-8?B?THE3V3hHb2EzeFRFeWRPdVVvZ2V2QlpsTEdIcUd0QnRnTDhIQTU2UllQdWhw?=
 =?utf-8?B?ME9mejdmUjVoaEl5WGt1MjZnSWdodE5ERXFIQlAxVWkvWTNJM0pxZTcrK3po?=
 =?utf-8?B?ZlNMSExWUEpHV2dQTUlMZ2d2YTY4RmpZTGN6K3BPenJpR2FDd2lxbERhaU11?=
 =?utf-8?B?NDRQQzZiUG03UWMyM3FOdTdIdjVkMmJ0OE9xQ2pDSUFOdGhxNi9SSnBiTjhY?=
 =?utf-8?B?U0tXUXZkb0VRRDM0bEtKNGp1MHV2dVJqZGo1b25wZnFaUWhqNitOYy8xYVBQ?=
 =?utf-8?B?OXhDOFZGblM2WC9oQkdMVWlWUEtCcmtNSWMxL0FMUXZyWEd2aXNLSnhINEhw?=
 =?utf-8?B?QjFVSU1odFlidzdhVWdNc244VmEvbDQza3dPd2svT25nSko4aHgxY0VIWHRo?=
 =?utf-8?B?Q2FlR2pkY1BTMGhZcWhBOTgyc25TLzMwYXZ2OVp3NGpGaUh1YUlrMzhPa1RV?=
 =?utf-8?B?WUVVcnJIRDU2Q0ZyQVA3TlowRGN5MVF6UGZybW1ReTRvd2kzL084cWRFV1Vx?=
 =?utf-8?B?ZzJRTEZBRWN1eFFUWnhINHZNRGNGekhaZksxZnNNRnVMNEUyM2dVYzhGTDJv?=
 =?utf-8?B?T3VPRFNsbHFLNkRTRG1ZajF6NDdQaU8xVmx5ZjBOdHVGYXFFNnRBQ2NpaUt4?=
 =?utf-8?B?SGo0MytZSmVBcm9OTVV3TW1sM09ad0tTN3BNZmZtd3pHZTQzdFNEYkljQVc4?=
 =?utf-8?B?WFFLT25PSHpwSXV0alFnQkNQK0hhQnMrZVJpeDBNWUhBdlJ2K2h3QXZXQzg0?=
 =?utf-8?B?M2ExcFdkTDk2UjNEdGhHN1g0RGs0aU4wTittb1plWERqWS9za0J0WmtIVUlZ?=
 =?utf-8?B?eGtKbG1BRFVFUXljWHNNblp5d0RBL3ZhVlE3QnVQbUlxTGFMNDVWS0J3Nkpl?=
 =?utf-8?B?RU05dVFhdGRhQnBHYVlieTBKczArdnA2WHBJSGRUdS9DblFNR3k4STZIVTdj?=
 =?utf-8?B?SWlmU1NQY0RSMCt1bWdZWCtsOWFIenRxUmNINFU3aUNGRlp2dTI0bDlPTDRC?=
 =?utf-8?B?SjhROEEwL0xOUW9CeHNHbHc0UUNGVGNaaEN3dGxKWE9OaEd0TmJuWGtXd1hR?=
 =?utf-8?B?b0l0Z045dHZRM0pHQ2VnVWRiQU44SnNvZloralJjQVlRcUtNZWxEaTJLOUNK?=
 =?utf-8?B?a21vY0pBbVZwZTJPRGZ6LzdJbitYdzRmWnBSbFdiNmxFYW9VZGY0TW1EMEpz?=
 =?utf-8?B?Y2ZlUjhxeE1ycmlrcGV3NC95OHQ3N084NUtJNEVMUmZ4RzF2eTNRVUpLeVBu?=
 =?utf-8?B?RlhQaEQ0NHhOTWNaVGo0WHhnM1RDbkswSGlJMzE1bGdaVythblVvUW04M1Zw?=
 =?utf-8?B?QzRmTlhuNlBFeXp1cm9vWmlkWXIxK2ZGQmt6SmhObXZXNHQxUEMrb1JnOW9X?=
 =?utf-8?B?UDM1Zmdoc3hSNkFtV3NIQW5vaWhBcVNKT1BFRWxaZEdCTVhFY0dnSjBCeU9t?=
 =?utf-8?B?ZkMrL3JZeDQvbU1jOTgrS1lnT2VPRzhNbnkwWVRzQzVCL3ZwS0FFK1lQcmhL?=
 =?utf-8?Q?8ODZT8UzISqjTQk7beqJ8BZcJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 895cd266-cac8-416c-a221-08db163fe675
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 08:19:50.9682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iYXUGy6ScWl9Jqfg/fdKuVzp1IpWvlCAfjK49ZBxPh7/6hxgJqwWr5ua872MhbNyNI2JKK6c4VrccV/SGisO7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7847

On 23.02.2023 14:56, Marek Marczykowski-Górecki wrote:
> On Thu, Feb 23, 2023 at 02:21:11PM +0100, Jan Beulich wrote:
>> On 23.02.2023 14:08, Marek Marczykowski-Górecki wrote:
>>> On Thu, Feb 23, 2023 at 11:16:28AM +0100, Jan Beulich wrote:
>>>> On 22.02.2023 20:14, Demi Marie Obenour wrote:
>>>>> To quote Andrew Cooper:
>>>>>
>>>>>> I know we've had this argument before, but not calling
>>>>>> SetVirtualAddressMap() isn't a viable option.  It's a prerequisite to
>>>>>> function on literally millions of devices
>>>>>
>>>>> Qubes OS has been shipping EFI_SET_VIRTUAL_ADDRESS_MAP for years, and I
>>>>> believe OpenXT and EVE ship it as well. Mark EFI_SET_VIRTUAL_ADDRESS_MAP
>>>>> as SUPPORTED and enable it by default.
>>>>
>>>> This is insufficient justification. The main reason why we don't call
>>>> it is because it can be called only once. Any entity taking over later
>>>> (e.g. via kexec) can't do anything anymore about the virtual address
>>>> associations once set. Hence what's needed to justify a change like
>>>> this is an explanation of why this restriction is not really an issue
>>>> to anyone in any case.
>>>
>>> AFAIR from the discussion about the original patch, kexec under Xen does
>>> not preserve runtime services working anyway, so this limitation is more
>>> about some possible kexec implementation in the future, not actually
>>> breaking something right now. And since Linux calls
>>> SetVirtualAddressMap() _and_ supports kexec just fine, it's definitely
>>> possible to design this future kexec extension to work after
>>> SetVirtualAddressMap() too.
>>>
>>> Relevant parts of that older discussion:
>>> - https://lore.kernel.org/all/272a9354-bcb4-50a4-a251-6a453221d6e3@citrix.com/T/#u
>>> - https://lore.kernel.org/all/20191009235725.GT8065@mail-itl/T/#u
>>
>> Well, there are various statements there without further reference. I'm
>> having a hard time seeing how a full-fledged Linux could do well without
>> runtime services, or without being able to set the virtual address map
>> to its liking. If they can, then a question would be why they need to
>> set the virtual address map in the first place (yes, there is this
>> supposed "firmware bugs" argument, which unfortunately I lack any proof
>> of; at the very least I'm unaware of bug reports against Xen boiling
>> down to us not making this call). 
> 
> The second link points at a thread of one of such bug reports.

Hmm, yes, digging through the about two dozen mails, I can see there is a
connection to (not) calling SetVirtualAddressMap() there.

>> Plus maybe they can merely because old
>> and new OS are similar enough in their (virtual) memory layout? IOW
>> kexec-ing to Linux for crash dumping purposes is just one (important)
>> example of the functionality that needs retaining. 
> 
> It works just fine with Xen calling SetVirtualAddressMap().
> SetVirtualAddressMap() is relevant only for using runtime services, and
> you don't need them for crash dumps. In fact, runtime services are not
> accessible to post-kexec Linux anyway, so this call doesn't change
> anything.
> Additionally, given most stuff works
> just fine with efi=no-rs proves it isn't severe limitation, if it really
> would need to be there - but as Andrew noted, given Linux example, it
> doesn't really need to be the case - it may simply require a bit more
> thinking when adding runtime services capability past kexec.

All of what you say here is what I had meant to cover by adding the
"(important)", which initially I didn't have. 

>> Once we get better
>> PVH Dom0 support, maybe other Dom0 OSes surface with entirely different
>> needs.
> 
> I find this claim rather weird. Runtime services are a thing that Xen
> needs to call, not some domain. And Xen has control over its memory
> layout.
> 
> _If_ PVH dom0 would really turn out to be incompatible with
> SetVirtualAddressMap() call by Xen (which I highly doubt), then some
> alternative for that case can be made. But that's only speculation.

The remark wasn't about Dom0 itself wanting runtime services access:
Dom0 isn't going to be provided such, at least not to the physical EFI's.
If such was needed for PVH Dom0, we'd need to wire it to virtual firmware
hooks (which in turn may or may not be viewed as against some of the
ideas of PVH).

The remark was instead meant to point out that such an alternative OS
may want to invoke another (native) instance of itself for e.g. crash
dumping purposes.

>> As said back then - part of the reason why in the original
>> implementation I've avoided making this call is because of the fear of
>> closing possible roads we may need to take in the future.
> 
> Yet, not calling SetVirtualAddressMap() leads to actual issues _right
> now_, not in some hypothetical undefined future.

That's the way you, Andrew, and others like to put it. My view at this
is that it's not the lack of the call, but the improper implementation
of firmware which leads to an apparent need for this call. Like for all
other firmware bug workarounds, I'm happy to accept any proposals for
workarounds, as long as such workarounds either don't impact spec-
compliant systems, or as long as they're off by default. In the case
here this would mean that I'm likely to approve a change which converts
the EFI_SET_VIRTUAL_ADDRESS_MAP Kconfig to a command line option (as
long as it looks technically correct, of course), improving flexibility
from the present build-time-only control. (Qubes and other distros
would then be free to change the default of that option from "false" to
"true", and that would be a pretty easy to maintain local change.)

However, part of the reason why originally this wasn't (even meant to
be) controllable via Kconfig (or any pre-Kconfig means) was that I
don't think the handling of the ->VirtualStart fields is correct for
this case in efi_init_memory(): The final layout simply cannot be done
there (after SetVirtualAddressMap() was already called). Since I don't
think laying out virtual space can be moved ahead, this would mean
moving the call to SetVirtualAddressMap() past this layout phase. Yet
then we may again end up calling runtime services functions (time
ones in particular, but note that I didn't check the order of things,
so "may" was deliberate) ahead of calling SetVirtualAddressMap().

Plus, once you look at the layout code, you'll find a number of cases
which simply end in an error message.

To confess - I was quite happy back at the time that I could use the
kexec concern as a justification for not needing to solve these issues
right away.

These issues would, however, need sorting (by code changes or verbal
justification) no matter whether the Kconfig default was to change
(or even just the EXPERT dependency to go away), or whether the
conversion to a command line option was the way to go.

Jan

