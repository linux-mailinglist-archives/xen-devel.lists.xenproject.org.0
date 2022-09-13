Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CA35B719E
	for <lists+xen-devel@lfdr.de>; Tue, 13 Sep 2022 16:48:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406453.648846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY7CF-0000IR-Jn; Tue, 13 Sep 2022 14:47:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406453.648846; Tue, 13 Sep 2022 14:47:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY7CF-0000El-Fj; Tue, 13 Sep 2022 14:47:31 +0000
Received: by outflank-mailman (input) for mailman id 406453;
 Tue, 13 Sep 2022 14:47:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lE7m=ZQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oY7CD-0000Ef-H1
 for xen-devel@lists.xenproject.org; Tue, 13 Sep 2022 14:47:29 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150084.outbound.protection.outlook.com [40.107.15.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fce0d883-3372-11ed-9761-273f2230c3a0;
 Tue, 13 Sep 2022 16:47:28 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7521.eurprd04.prod.outlook.com (2603:10a6:20b:2df::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Tue, 13 Sep
 2022 14:47:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 14:47:26 +0000
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
X-Inumbo-ID: fce0d883-3372-11ed-9761-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OLb4FRFVjkm3VUH2JaTV4yzZzEwCWUpwjEu/k60dg7kCJmRQtm6Wg41Vnd2UOWp92EpD1ywrZF/3CVmCW2oAH/r+2aOFybuNti5yx1tVR1T81AGI/zTa14tCbs+zZEF8YxxMj+9QmYfU0VCZJa37SNQvKclaQP9tN1O4flEvgQ+IvID42eHlDF43PHG+xTV3BWh8mzpJsZKk72V4HyQQaE4TSlAwSppkw30cwNu+3ukGtMLWCmhntroRhNk8JpGspv5umOuLPqMw49VqdJvx1uicCsx5ZUWt2gWIFfljJ7rru3ttJvejPiCAD0n650wVgo/RVWI5OHQUzGcOQu/Eog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JieG0+yjczxZII7mkixQScW6qARtcfxGwTOvp1NNMqU=;
 b=lRCo6iF4hQ1lz5vXzhc6i2W12fBzUth0w9+ondaKpSsBTWgBRk8xuI2YgPky4nN+KaNqP5Tpk3U6FmGTReh3q2GP8I/4ejVGccoPHYgAeKQlyg+374vkgwfrF58AJ0AGJ4DoFht2RDuAF77DfEKAYS2YYebTIes40CB3KvKE/eer03WfzAZhf0kPZ6Qf4U36gTfhdSe5C0zhrC4FqNH1Ax7xlvfwl4+r7XEAIYG8axp95cozY+mWPIkYtNVhWHC2D3EF5oELXMxzgMvaln/Uxf7bLNf/VPuTeCBdYqK5EjqMeRfA2YdcPJ6dhSumJU8+vLHdEI1PovxJMMN1Nr5Avg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JieG0+yjczxZII7mkixQScW6qARtcfxGwTOvp1NNMqU=;
 b=KZDfMLkBKZyzAYPbZbSo15mXy/TzELA+UazaNbbWhqL5P0sBRIJIJucxg1n9rInB2HsWvd9UJD9vMeLhUmQmQPVjANeR9qhRiZHNDX/7Rm7QZ+Onw5IM3AfYvua8eE+GTJCWOBM0gKz22uE/W+sMndl/PAA0osdyFfhJuQ/U20r6nws+V+XjnP4fKvP9ytPCkwwkKrT3wVn/xRrmaiWMI//WjIW0RedspvxecIGbHBZocdDyKQ9W/uKpoWCXOZ7fP4/jGD1YSXgUKh/kOBU+HWZdWOUj1RlqAMkCZN3bdKWwM9mJCSdN9Kk9EhUiLjZd9lyVfv4kGKDg0vGiX2V9Rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <037151d0-0920-5d99-9932-df044729c00a@suse.com>
Date: Tue, 13 Sep 2022 16:47:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Setting constant-time mode CPU flag
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Simon Gaiser <simon@invisiblethingslab.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <YxFk2GaIQVCAFsyi@itl-email>
 <1d7b9e30-975b-b49f-fe09-e2aeda9e2af6@suse.com>
 <1b85702f-7efd-b13f-40d4-615750e20f4c@citrix.com>
 <YyCSIxyH4hDmTXIh@itl-email>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YyCSIxyH4hDmTXIh@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7521:EE_
X-MS-Office365-Filtering-Correlation-Id: 53fae753-b32a-4bd1-daaa-08da9596dfd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZT8Z+4lVpULOmffrB7pZC0eYIYuxmtRftuhDVNSGHFBsjUva8AQey5z2rOVy9ymjuPgkP2APt1y9uCiEfHQqXCBRdmqq3vSpGVUDIvhAdT0MH+78rA2Sx/oaRnIt7ln5Wome02WszL2y72v1YMaWJqzR3ZsEnP8kRgvd4MVMwbvyFkHxGDUCgRng4th1dC3EB49nrxHNgMyj9+YvJX0tftBXJAz/9MXkiYsaw6rLG2L4THXmPEGcFaWqRstXTyjB2gWmqGwh6UriNUdk2AVANn6jwihidQw2+9qdTXb3+VxEAsGycZ2yYt8U9INCektkJWcZpKQ2nWx52EWUebaXitaU47p+pyUzGrUmpcjpbWRvWXBOydEpAP8HdAIBLZuDuyv29AOc+jerczVPDvAiv72TkuwtnQfZ4ZLub7fERcvV9J50i00x2b0vM9VSWCC6g5ogQnbQRmQdzZxWX7RGup4SUZyTUDDk7lPYFX8Nc2iu6V8+cIHQSsbl0jzYlzZnhDgYDom1AMMoMzGiZbF3khakHz/gM3yO9e6kJoYfLhqtb84+JJXZzeIZxIf65YGL8+EInQXd3wuALyEpYxUOMLChSED+RE9m11C3ezJjK04Ertif8OPumpWkx/tFZE6x4pbjraFMwhY/D7BR6XpQHeUnF0Oqo2u5Dim3qWO1+Gi5W5QjazGtjs1FD3FFV3B+YWpt71SXXcbHdUQT7IR1U8qey18Rg3858QEehYltPRB/U7SQ9xlUdxloqPjuMod97z/dLybKkbJPmpI20arU9dH/X0XlIM/zf0U8CeOfcmEsolLqN7KzRo0MNTYVyLiWDoYOfJXoaZj0H41AVnBQ8A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(136003)(346002)(39860400002)(366004)(451199015)(186003)(6486002)(2616005)(8676002)(6916009)(54906003)(5660300002)(53546011)(4326008)(66556008)(86362001)(66946007)(966005)(6506007)(31696002)(66476007)(8936002)(6512007)(38100700002)(478600001)(2906002)(316002)(36756003)(41300700001)(26005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDByTy9CNTFWQVZFd1ZEWkViZjFFbXV5c2NqMGRQYzJxaHNJMXY0UEMyQ1lO?=
 =?utf-8?B?S0NtZTU5N29BbmlsTmhKOU1pblp0MUJLWGt0eWt1SXV5UWZrVER2bEpuL0o5?=
 =?utf-8?B?ZjFYS09wTmR1Q1BWZGZQMlJGVmN1Q3FjTndhbkhvRWswNFFGVVpQT2tjaGJn?=
 =?utf-8?B?ajZrcVkrT0JFSE5VUmV0cTFWWUNrMU85b0JLU2ZzR1FyWE1taWt0UUlESk14?=
 =?utf-8?B?VndUS0xETXArUGJXdXk1VWpaN0FUVE5VZkVZZmRlK0RyVllrYTYxUUliL0dJ?=
 =?utf-8?B?OEtxaGdOS3o1NFh6OUZYT21BZUZjdFFoOUVjMVhjWC9CYlFsN0x5R3F0OWw5?=
 =?utf-8?B?bFJRazRBN0VEQ0wxNXBxUmExUVVQbGFYMFRmTlk0dmp2ckdMdTNNYm5QZDRn?=
 =?utf-8?B?bVZzVnBHb1VPbFZiVDc3cmNJbDE5MEI5My9HUXRqQmlVM1plREQyRDdvTzRs?=
 =?utf-8?B?cjBYTjQxRTAxOE1YNFo2djhUM1RDa0tGZ3p5a3k2T3lPa2htcGR3NEZJU0x1?=
 =?utf-8?B?b25EekI4bCsxQmkrZmpOa1NSOVpIUUh5SWZpbXBBb21IT1Q5NE14dUFCakRy?=
 =?utf-8?B?Wi9qN1JHRS94MW10ZGQxc1hmbnM5NUVLeGxWLzdhZVR5MnpMSFd3TmRUOTR1?=
 =?utf-8?B?YnFQczBsaDRFNXZkbTloTWJhTVJlL1NKczduMmFvaWZ1QVUxVWN1eC9NbElG?=
 =?utf-8?B?TWVndEZjNi9hRnFsTlQwQUxBRkkxa0l1MHNPQzkvdjZZbG4rZHl5NTRERS9a?=
 =?utf-8?B?QXorV1cycysxR3llYm9yeXlKcXBOcmNQb0Fwa0tJOWZSRkhHaTZuQXMwaUl4?=
 =?utf-8?B?YXZ4UlVDdisrQmxaQUF5UTFBNzR0YTZjLy9yMjcrcHZ3akZuZ2R4K3Y1R1lj?=
 =?utf-8?B?c0J2SHdxT0FHWmVzbldxRVZwYnFZQTBtcVZHbWFWWU5HdzJYUDhVVHdBVy93?=
 =?utf-8?B?aEpvbHdxMmdtT012ZWZWOFMvSDhEODNOM3R0M0tjaGFFeGVLcklvNlpwT1BX?=
 =?utf-8?B?K3ZuMFNRMys3cUxUeXE3ZGFsY1FZYmR0UVpPaXdZMnBpVU9TMTVQeEROL0h6?=
 =?utf-8?B?ZGFsL01VYmtIMlZYenE0a1M5anNKLzNVSEYxa2N2V3liRk4wcjRINURRV1ho?=
 =?utf-8?B?SjFPS1Q1dTczUzhqYVJxVC9LV3lHS1BMQ1FKMmc3aGdKZ0tlOWg1ekgycEox?=
 =?utf-8?B?MW9yUXVERnhkbVdHeVdZcVNUdzU5dS91clk5dHpHU2NlcVhvdmNBVWxtOFcw?=
 =?utf-8?B?ZFhxVEJ2T0k1S3ZiZXRmVGhTSGhTUTNFRjNLaTRnb2ZuMmJRTm9zYzRYUmwz?=
 =?utf-8?B?M2RRTHZJWTJkcFNoMmxOb3VCV3I0MnpBQUtTaEQzdFd2UG9UczBDOVN6VWox?=
 =?utf-8?B?TGcrWUdDUmd6Tk9sNkxGUnhzaGNxYVNWMDRMRzVWdGZJRGtrQ0xyTU8rejZw?=
 =?utf-8?B?L1BIakg0cHZxd1J6NjR2WjlDcERzeWNwRFF1cHZueVRYdEJ5Slhhemt4YitT?=
 =?utf-8?B?YXlBVS9kMkFrK1ZrR3hxVUcvL21YeUdNc0s4YXB4UFhEMU1XVmU2RitSMGtL?=
 =?utf-8?B?NGxPMlRlS0Nhb1dMVElEL1hGeUJKc1NIOHViK2taYlRGVFBCWWM4KzNOVTY2?=
 =?utf-8?B?QVdmUHEyU3VUYlEwTllJU21ZT3BKaXZQRFhuczl5cGZKeGM3WnlWbG81akZO?=
 =?utf-8?B?cDNKaGRpdDJBS2NhMnBoNnBoU3RzOTJ5Q3A0WFFMc1V4S0JlNWt5aXpMTHVw?=
 =?utf-8?B?LytPS0lNdUt3Tk1vQk9pQkgyUTkzcmNHV0tYQk9VaGw2Y1gxRDNldkJmRTI1?=
 =?utf-8?B?YUthTC8wQXFwOUMxMDk3QzB0OXJZZVpzei9IUkJsemFLUUJpOG5FdXl0Q1pU?=
 =?utf-8?B?TWdkYXRMNi8zaVBRZEhYRDRJc3M1M1NwbEZvamdIK0IvaFI1YVczNmVnTzNx?=
 =?utf-8?B?b1Y0TTdUeldiazJnMzRnV2ZGdDhRTStTeGtvcWRTRk5oWTJkaExBSGZSYVB3?=
 =?utf-8?B?eXc3blNjb2s4UjE3YWl4K01sSit5WGwzTWVFa29xWnZIUDBJdVhiby9RWS9y?=
 =?utf-8?B?dnhSc1JEK0dVVVZlZmJhYUFzMjhzWmVPUGhLN3IwZGtjZ3hNZFFtUHludGNI?=
 =?utf-8?Q?eLPfFW+R5PsNJKf0M0jwtsTr5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53fae753-b32a-4bd1-daaa-08da9596dfd6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 14:47:26.1098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KVX3OEI/YdpOCuPusW8QBARszgYu8TWjkyp3Thc4NwOuLKzqNpw7o1BFPhrq4z5RWvVSZaqH4UrVMT1ME8lt4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7521

On 13.09.2022 16:22, Demi Marie Obenour wrote:
> On Tue, Sep 06, 2022 at 10:01:00AM +0000, Andrew Cooper wrote:
>> On 06/09/2022 10:52, Jan Beulich wrote:
>>> On 02.09.2022 04:05, Demi Marie Obenour wrote:
>>>> On Intel chips (Ice Lake and later) and ARM64, a bit needs to be set in
>>>> a CPU register to enforce constant-time execution.  Linux plans to set
>>>> this bit by default; Xen should do the same.  See
>>>> https://lore.kernel.org/lkml/YwgCrqutxmX0W72r@gmail.com/T/ for details.
>>>> I recommend setting the bit unconditionally and ignoring guest attempts
>>>> to change it.
>>> I don't think we ought to set it by default; I can see reasons why kernels
>>> may want to set it by default (providing a way to turn it off). In Xen
>>> what I think we need is exposure of the bit to be guest-controllable.
>>
>> We absolutely should not have it set by default.  It's a substantial
>> overhead for something that is only applicable to code which otherwise
>> crafted to be constant-time.
> 
> Either Xen needs to set the bit by default, or guests need to both know
> the bit needs to be set and be able set it.  Otherwise code that *is*
> intended to be constant-time has no way to protect itself.
> 
>> As for why Xen doesn't enumerate/virtualise it, that's because
>> virtualising MSR_ARCH_CAPS for guests is still not working yet, so the
>> feature can't be enumerated yet even if we did support context switching it.
> 
> Intel and ARM64 guarantee that CPUs that do not enumerate this flag
> behave as if it is set unconditionally.

I'm not qualified to talk about the Arm side, but may I ask what you've
derived this statement from for Intel? The doc page referenced by the
link you did provide (still in context above) specifically further links
to a page listing instruction with data operand independent timing. All
other instructions, as I conclude, have variable timing unless the bit
in ARCH_CAPS enumerates DOITM and then the new MSR bit (of the same name)
is set.

Jan

