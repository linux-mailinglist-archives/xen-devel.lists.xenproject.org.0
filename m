Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1016AE438
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 16:14:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507500.781083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZZ0z-000160-FO; Tue, 07 Mar 2023 15:14:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507500.781083; Tue, 07 Mar 2023 15:14:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZZ0z-00012c-CI; Tue, 07 Mar 2023 15:14:09 +0000
Received: by outflank-mailman (input) for mailman id 507500;
 Tue, 07 Mar 2023 15:14:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4ndv=67=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pZZ0y-00012W-GH
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 15:14:08 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0606.outbound.protection.outlook.com
 [2a01:111:f400:fe02::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3a0fc6f-bcfa-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 16:14:06 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9147.eurprd04.prod.outlook.com (2603:10a6:10:2f6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 15:14:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6156.028; Tue, 7 Mar 2023
 15:14:03 +0000
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
X-Inumbo-ID: b3a0fc6f-bcfa-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K9MBwRPBVomUj++g0CXbRqUzFKAmHxIQIDltpl9uxIF3A6ZGdP5CrCbfK1mLd+25pYhKtTVgmskmNmPlVNLW9bMhESx7Nzak3IX9ivguZb1kFYuI63sFnom9Tj0sl9HGThHjbhuLLXA0q2punLXMah9z+p5VDO5gZ8draNLdxJUkdr5//3t3ef+Bco0P9orx4cIuNKXDfIuqzIkBaDIVRYZF7wsmu6PhfhkJrUb3LOcwezgv6cCRX+yem9MExEDy49ybVfU0YOqdssE9LiRWf6zBHZ9xvSIMTVDiVGjZm+aOEHlkXRFSuq5sJSebl59uoFFvPWExb5pOPC85t9plmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdbkMmyiMnsYMWhRLQ7ZOfmRll1iHGhzpzksAo7bTJo=;
 b=IKGD617/WrzqJ3gkRcVzqov/8r7xycwWNcBN0WgN+8mZzmiIb+B+MuNAA+sfNffLko63jXuBIwxhI8JFAuK472U87WBSd7B6QoHCQT5zpdYkkFiYc9zCPTDYPXUPI6A96QJ5vT120Ub3BonTF8xt5CXiT/E3NUqxFA5WKvxbsibM0smKO2gDGOKI0TTEnaRIMZm13G9VDp27VUS4JMPgjvWPIVuYkFqxdGKI6L/VSY4T88CyVE0WdzwceV6pu4qJJGO79N/+l303UFROrLCfibAox/KO5vZg8ViR9WzpyR7iw84ZMYl7b5D/Fm1C/Th/ocoqFZtnFthOjtr9jlmBWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdbkMmyiMnsYMWhRLQ7ZOfmRll1iHGhzpzksAo7bTJo=;
 b=mzGGXEVH8GbgQfiIoTl3M8qlg0un15Gmzm11DWbLFhnOZZMyO3r6I5veUGs8ysqc+NfDGvlX7d2N4Fp/OTANWzFBYe4GiE4VfiGW2dkLxd8oKiad1yb1NayX80Kl/0mTM/t1f+PlGoKnL1ePxin8Do9krZWsFmAnGf65afZw1VPZkdSDqGwpvgn1lJjFrajjhshR7HFvmxeOE6GTDdeeHjszndL5PBD5vapIoae+/eX5fwFlOiB+JXv6LXSWnJr08z9ZsnYMe/zEgZtXZ73W0qe/SoWcdRWjcWHecNH7FqPwZILndLQI8D+USG+Ef8wOd6r/zDOKQvrWwuO8dXJY8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e4298b1a-e8b4-61d8-1975-a78adf55bcdb@suse.com>
Date: Tue, 7 Mar 2023 16:14:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] xen: update CONFIG_DEBUG_INFO help text
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230307063214.30569-1-jgross@suse.com>
 <20230307063214.30569-3-jgross@suse.com>
 <e673b686-abcb-1e38-1e2d-dcbc77c65576@suse.com>
 <d0aefe0b-4e71-458c-0072-345e1c505083@suse.com>
 <825c0085-ba84-9ede-ea91-f07dce66f214@suse.com>
 <9537fcd2-99ae-0570-aba3-41fd1fefe4ba@suse.com>
 <c8c8209f-0ad1-2a13-946d-0ac9a0f454bc@suse.com>
 <7f4d5da3-13b8-f120-69fc-14aa65e735e3@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7f4d5da3-13b8-f120-69fc-14aa65e735e3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0179.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9147:EE_
X-MS-Office365-Filtering-Correlation-Id: 999db743-6148-4646-a3e6-08db1f1e9646
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KLpN0gwsX7v4S2uYH3/s6mTSqLTKntlW1PQ086OOSMCS4ZW1ExlZ0C1mxf5LM1VDtR6sq+a5O4OrZ3horBeaKtv6KDOHYG4TMYlMUdB9mix1BZyj//iGlfw+qJAcRgplXLMDzsqGYaVVVQcWoi7HtGLIwV55B1owO/j0qHtZQNd+jQLXoqAHJxvff0+ys3oc/spRRrwjRPUBGu5aF0D4uLKMGEe1crbY4uowr20UIvxIpIXq/HmSsDJ9Iv4fvi9Gx0KQpkZmPVa4I9tsaQ/AkBIyJB+VZ9Ale/P19saxMLH4clenRq/YEJHLVXTKSobi5WszFpUqQcwqG4oxtXwiZM4JVXkm/3jA3LKnNMpYGO/hClwd38vtshebp37a2gh6iJo2Xx1JU4+7lyiC8WDfcZ5inpaCKUXs764qPyTgNufsUI7/gPZDTldyxgvUEt5eVNOT6MCyLezjTeXaUoC6GN3BbSWA+JdU33p8LPJfqfy1F7KOuEyvU0ebruj/FQc3fryzrMSjkHZ23PR+fAT0ljFau+p4tstSplfZuvoTDQGwjbGOlKs4BEQLVwnUWF7gJwidAO1j8UVIsbaiNUai3g5iqLxhPoF6D0d66ePKzlL/LtqEPPBLH7QHm2axoAGO1q7hCuwLr+cMM1PbWnPmPPNo2Fbmh3WEaBjFuBYezaBvgldOoyeUUgHJ9vxNqT017W67cp26RiR6KNa1DqZjsOsqVJoOVYAIN5qaReU6d14=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(346002)(396003)(39860400002)(366004)(136003)(451199018)(2906002)(31686004)(5660300002)(8936002)(6862004)(41300700001)(15650500001)(8676002)(66476007)(4326008)(66556008)(66946007)(83380400001)(316002)(54906003)(6636002)(37006003)(6486002)(6512007)(53546011)(6506007)(478600001)(31696002)(86362001)(2616005)(38100700002)(26005)(36756003)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGJpTDdiNllaYUVCZHpzanc0VEoyTFAvZUZwYTBUQ2V6RWZmY2NzQWt4YmxN?=
 =?utf-8?B?ZnliNWFTcXZ2YWxtZk92YWdET0s1Rm1xSTNXYjVhckRkamRSZXV6R0RQTUc5?=
 =?utf-8?B?S2QyTmM1dGp5Tk8vNnpLVEtCc0J3T3hiN1F3R0FPdGh6NlpSQ0dpZEo2OTB0?=
 =?utf-8?B?ckczRlI3d3N0Sk9Fb2FQY2s5c3grL0ZqMDhoOXM5V2NocEJJVnFKYWNkdk9x?=
 =?utf-8?B?RE9ST0poWnZlWFVVek12ZjhMSjZzNTdaMzYwTzlZR1MwVEJhZkgyMDdRTUxF?=
 =?utf-8?B?c1kyNi93emlleERtcWZuRTB5TEtFeVhTRGZ5K3NhbWlJcTdOL0ZSdXpBbjJ4?=
 =?utf-8?B?MjRIUkx2b0VzblpYeWJuUTdKaS9YWWxwV1pSWFl1QkE3SzluRGNYai9LR2tk?=
 =?utf-8?B?NFFDYnJFQW0zTEErZERxSC9POElDdEZTbW5JN0JyaE9kR0FtcFJNTEdhSXc0?=
 =?utf-8?B?R2VxeDFDektwelV0bnUwZHJVUTVpYytyNW4xMTlyOFFQTUk4eDYwL1g4Mmdm?=
 =?utf-8?B?N0s5T2JoalJMRjZkZzQ5SlJkMk5BVXp5SDF2SzNvcU8wYXBXK1czT3htK1Fu?=
 =?utf-8?B?SWx3bm9RdDMrUUVldVVzcTlpYmlTYXZISUZYVVJLVnZsNmdoK0QyQVVvaHNR?=
 =?utf-8?B?a1l5cUlLd1A3RUxUTW5WdktTS2Yyd0o3dGZ3dElCbEYzN1BXZzg4YjFVQVRn?=
 =?utf-8?B?NW1WMThwWSt4aThXRlRPaXArT1c2TXJJQnBCVThUcnBrcVkzR1RxaThkSU55?=
 =?utf-8?B?ck8yYTRyQUc5dnJOVW1Pb1BaOHEvZ2xnK1FyVDlZMXZ0c29TcWZaS2ttOTdr?=
 =?utf-8?B?NXhOZ3p1VitWaUlqTkxpSDFsR3gxWmxLNTJZQWIvZnV5ZVcrZGZCZllBeVlV?=
 =?utf-8?B?dDQ2eW1uT3doa2FRckwzdkxVVVRhNUxNUDgxdE9oK1lZNFZEWUxRQTZudEtp?=
 =?utf-8?B?aXdodXA1eXpaT2wzVGN2Z3BXb0txeFNqaHZVNHRuM0MzZEZzK3F3RFpyVGxk?=
 =?utf-8?B?YnpENkdLWUt0eHJCd2JMZ1NhQVlRT25ZNEJxQkRTcE5XN2F5MUFUcUtEczNU?=
 =?utf-8?B?YmcyNHBoU29nMDY0NXJxcDZrTXExOTJENUFRSXRkeTU1YWMyMXNLQlBGdys2?=
 =?utf-8?B?ZTFSMGxCZGw2Rzl5SVcrblMvR3ZDUjdCOUxxeWJ2UWFsZkY5VmtMbldRdVZ5?=
 =?utf-8?B?dmkzdnZFbXQ0bFh0SmZvVWgwVW42Y2xuNzgzOFp1cFBIb1RzTThiWXhXZ3ZY?=
 =?utf-8?B?d3Izak9sUVlOWi91aFlrbllOQ1NFSUQzZTc3d1pmQ2FseWh6b0dMWUxQUDJ4?=
 =?utf-8?B?SmJVK1JFdldtYTNLaVFHNjJ6US9HMUF0V0NBUE41OG90QnZLeVdJNW1lb3ZU?=
 =?utf-8?B?TFoyYjJYOW93SFBocWdsZVpnb1Z4TTFNcnpoRjlxemEwRHIzYTA4NzZlZ3Nn?=
 =?utf-8?B?OThrQ0ZpN01reitDR2Z1b2g4TkZaU0lNQTcvMU8xWmlQcHh4ZXZPajZLOWox?=
 =?utf-8?B?SmJxQklOY25QaEhoZUpJOGw3TWw1dkpwLzB1eEk1Ym0zaXNnUUJDZXU4WStw?=
 =?utf-8?B?Q3B4cHpqa1Q5a3JtT2pTY1BFMmdPUk11RHZkWWNieU5zRi8zcnkxeHZxQkhK?=
 =?utf-8?B?SHMvdzJza1Y0WGRxNkZJQVRYRHVUK29mWThvVU9WYjNidGN4bC8ycnlxQkJY?=
 =?utf-8?B?b05QWS9CU0I4VkVEa1ErWW5ySWJDN3FESmtZYURlZkp0ajJxMDJGRVdKVEVk?=
 =?utf-8?B?TXIzUFRyTDZxSmpldUZZeWFzc2Jpd1pPMy9CK2tQL1o3S1hnV3FoOHRSdThN?=
 =?utf-8?B?d2RFMlcvZEJoS001a2wzcDdKMzlONVV6MElNOWlzdzVWOGlqTURvWE9LQTQw?=
 =?utf-8?B?QkZCU0Q2YVRJd1lKak9BejNYdkU2QzZScDE2WldhMmQ2cEJLTW1mdFRBOE9E?=
 =?utf-8?B?VE9FTXpxZmdkY3hiUUd3cVJCQ0k0NmhZYzhnaWx3eVorUmVUYXVRQ2RDaHha?=
 =?utf-8?B?WHBsQXlqVjg3OEhnb0lMQ2hJaExVazBkR1N6QXFFbVNDTDNyK0djZWY4aEVs?=
 =?utf-8?B?UW1DWDJnRWkzc2xmYlBqYjNHQUxncnRCcU5rUWxMMG9MSmRpRVJpaDZheGha?=
 =?utf-8?Q?S5uy9KR92YJTTaj1uv5F6H8el?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 999db743-6148-4646-a3e6-08db1f1e9646
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 15:14:03.5780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VRs8Eu1Aj3CIwflbpasbKL139EcaSrfcf6zeca2P1KJ4l3nj8ikBC239SS42Jzn2qMl1LXMT0zA/7jboCoHK1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9147

On 07.03.2023 16:02, Juergen Gross wrote:
> On 07.03.23 15:34, Jan Beulich wrote:
>> On 07.03.2023 15:23, Juergen Gross wrote:
>>> On 07.03.23 15:18, Jan Beulich wrote:
>>>> On 07.03.2023 15:04, Juergen Gross wrote:
>>>>> On 07.03.23 11:41, Jan Beulich wrote:
>>>>>> On 07.03.2023 07:32, Juergen Gross wrote:
>>>>>>> --- a/xen/Kconfig.debug
>>>>>>> +++ b/xen/Kconfig.debug
>>>>>>> @@ -15,8 +15,11 @@ config DEBUG_INFO
>>>>>>>     	bool "Compile Xen with debug info"
>>>>>>>     	default DEBUG
>>>>>>>     	---help---
>>>>>>> -	  If you say Y here the resulting Xen will include debugging info
>>>>>>> -	  resulting in a larger binary image.
>>>>>>> +	  Say Y here if you want to build Xen with debug information. This
>>>>>>> +	  information is needed e.g. for doing crash dump analysis of the
>>>>>>> +	  hypervisor via the "crash" tool.
>>>>>>> +	  Saying Y will increase the size of xen-syms and the built EFI
>>>>>>> +	  binary.
>>>>>>
>>>>>> Largely fine with me, just one question: Why do you mention xen-syms by
>>>>>> name, but then verbally describe xen.efi? And since, unlike for xen-syms,
>>>>>
>>>>> For xen-syms I couldn't find an easily understandable wording. I'd be fine
>>>>> with just saying "xen.efi".
>>>>>
>>>>>> this affects the installed binary actually used for booting (which may
>>>>>> be placed on a space constrained partition), it may be prudent to
>>>>>> mention INSTALL_EFI_STRIP here (as a way to reduce the binary size of
>>>>>> what ends up on the EFI partition, even if that wouldn't affect the
>>>>>> "normal" way of putting the binary on the EFI partition - people would
>>>>>> still need to take care of that in their distros).
>>>>>
>>>>> What about adding a related Kconfig option instead?
>>>>
>>>> How would a Kconfig option possibly affect this? You want debug info
>>>> in the xen.efi in its standard install location (outside of the EFI
>>>> partition); or else if you don't want it there why would you want it
>>>> in xen-syms? It is the step of populating the EFI partition from the
>>>> standard install location where some equivalent of INSTALL_EFI_STRIP
>>>> would come into play. That step is done outside of Xen's build
>>>> system and hence outside of any Kconfig control.
>>>
>>> We have 2 binaries for the non-EFI hypervisor (xen-syms and xen[.gz]).
>>> Why can't we have the same for EFI? E.g. xen-syms.efi and xen.efi.
>>> The former would have the debug-info, the latter could be installed
>>> into the EFI partition.
>>
>> I view the two-binaries model of the non-EFI case as merely an
>> implementation detail;
> 
> The ability to do crash dump analysis is more than an implementation
> detail IMHO. It is a feature and as such the availability of xen-syms
> should be seen as an interface which functionality should be kept.

That you're looking the opposite way at things: The oddity is that we
can't use xen-syms directly for booting (which is also why it has this
specific name; otherwise "xen" would be what the linker produces).

>> it just so happens that there's little point
>> in mkelf32 retaining debug info. I therefore don't view it as very
>> reasonable to artificially introduce yet another binary.
> 
> In case there is no other way to enable hypervisor crash dump analysis
> I don't see this as an unreasonable approach.
> 
> It should be verified that this approach is really enabling the crash
> dump analysis of a crash dump from a xen.efi booted system, of course.

Right. First question would be whether they manage to consume Dwarf
debug info from a PE/COFF executable. Possibly the way to go is to
separate Dwarf data out of xen.efi into an ELF "container"; I have no
idea whether objcopy could be used for something like that.

Jan

