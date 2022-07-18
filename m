Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2014B577DA1
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 10:38:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369372.600752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDMG6-0005So-Uk; Mon, 18 Jul 2022 08:37:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369372.600752; Mon, 18 Jul 2022 08:37:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDMG6-0005PZ-RE; Mon, 18 Jul 2022 08:37:42 +0000
Received: by outflank-mailman (input) for mailman id 369372;
 Mon, 18 Jul 2022 08:37:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pu44=XX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDMG6-0005PT-Aw
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 08:37:42 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2063.outbound.protection.outlook.com [40.107.21.63])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2b23d76-0674-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 10:37:41 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by VI1PR04MB5616.eurprd04.prod.outlook.com (2603:10a6:803:e0::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 08:37:38 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 08:37:38 +0000
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
X-Inumbo-ID: e2b23d76-0674-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YB0TVyxLt8bWSRR+Srdlrz2EMoVeXqOr3ZFQ6xvlMMWyt690p+qnLfYIQzSoDAA4YGSFZshBRekObvNNO1qKYIgb1mNaHe2HoBg8Sit5uEjFc+AtFuDLUYamz2N+DVbkj3EgblTeUSamF2aawGfW3UhKFwAlse9cslCmR/ftxE/67Vk08hOsLjczwU3RbwmlRMtWpRL+EH9Nc5fx9khXpLStI8wP0z3ukOuog2UBOblEOEiebMLByFTI1OKHGy26SJfXQapLaEJi70tb1WDI/+g3PAhOGExY03XMi/Mbya4+YlSD7uyrj7JuqHCWrMYCbBHjahBu8p6RMk8jzPMabQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c9D/Ywffqtx99+quMO0eYCLpSRFiRiHpqbZLvUVT6VU=;
 b=N+gR5sURQFTln0U/JkgOujAJkvLpJMILIJ0WGbVWoW8KsgdLl0BNscoufJJnXvvtpu3GUNTVLg85lVDcEWZG5IU9XqgyeXREkCz5s6FKbA5OoVKJfwtWGe1ZI1OZ+6LQjx1R8uFrMzx12FrCtDn8F28SCSuOSHUJ/oh9MYjLuo2XtqPb8MXX/10WKxLuxvAZJ5M0OWQZ9F1dvb2d/Ju1yUPtMfZ3A8OzExSHzPo/kjp8gO+ycfYKqH+EZqJoEPXPoTrRZOzoUNa1Mj1pPhsR/FnVK8d8k4qZjUAlHu5PRO1d2XhML9n4bCsZD3bpG17wwVB5maIUFOUa0n4L2y1+FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9D/Ywffqtx99+quMO0eYCLpSRFiRiHpqbZLvUVT6VU=;
 b=V7dmyPrqthQTm7/mOZKTGwT7V7li5GuBHC5LnVGHicQ6FpJSWiK5npFMPJdhk5DprVqPIOxVeBhxyoou6lqkbLyYleR81YvoaWcBt9lUxU3pQ1teKD2ARwE4lpoVy0hxU6apF+JrIHk4CMBlLXnmfRs+5DtoPgysuBaa7RoFBRzchgA46lNNIUmTIyO6M8pb7tXDCrIItiGqQrf5hj4Z2rPbmYQbg16Ixfct5HaCNPsZ4RmXnX5F8go/ONwjAyIU/fjG5KOPpg3lPGxYGT/v7aOEI/vrhgBQ6e8GLm6ADnwCkab5Mo5PVefkeDTKtCx7GOQAVFxbpnoUFfPPE3BBog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <414c8615-6449-89e2-d119-14b0198d89bf@suse.com>
Date: Mon, 18 Jul 2022 10:37:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Arm64's xen.efi vs GNU binutils (and alike)
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <04b5e393-e7ad-956c-dbea-8203b6846726@suse.com>
 <911597d8-4655-6963-853a-7088044a3e20@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <911597d8-4655-6963-853a-7088044a3e20@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0166.eurprd04.prod.outlook.com
 (2603:10a6:20b:530::27) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6978c874-df1b-4be5-2706-08da6898c552
X-MS-TrafficTypeDiagnostic: VI1PR04MB5616:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kXId6Q0Esa2bIu7NW07RgWBSQzu9i1QHjmuUuSRlKQwq2GglrL0jUwImp/o4Mc1MtfnLzw50dU5cTtR8pNgWhfwSftoMZ77r6H6RGO+AmwAj1vJexJMQgOqVjxlnKA7DeWD89QdzpCuIX9shy07useVrZdHuKNilmDPATUWJwtd8rx0O7OJPaVFHM5XHUrr/1hJtqCiJrh0T2+XzwxxTJZfiQELBJHGFlre367t7UPHy7QattZ3pIJtlLg5UGESBq6+U8Jp6xa+7CjRVLgVh0moZICmdO6EjpY1Py/fB1xd59Ib8E6hPrrVw/WAdM/f3j8ryNiFMbTPQKZC3imfErFfVBkjAt8HeNO37QixrVpulhn0/fkiDljp09xGwYDHV2zzvf4L0bheCqATlGk+VNvQKghJ9p2V/Bh5gf+cxpNXivJBToghz8h1rGjYrknrNi6BUpLApObuH4B1Lc/ulzDhO0RQKBg5i7ntjjEL2Gq1AkvFIsmHmPFMxWiI16V1Xt15k9nLoPwvOTckG7I2WPn6UwdctEMRzevROs058G82BzifLe4otw9x2PF1IXj/Sm1uZhqn8GZsVY+FTyYkCzf+TlNY3u900cziB95BiW15Iu6LRwG8jcYKWepr5bk12O3gOuht70tDzZ6wzu+jghROClxez5Y/65sPx4X10/rGXEz0zJ1a+Sm3o6CSnykLu3yJfEwhO67G6p52DMFATWZ9CZExLGV4yrq80BMULDXKDcPNGCFIyQDqNtQXUOhLZxjL2wumII57kO5yqifxbJ/NbDd8+YBU3dqB3kxYzAbwVX8gnkoGlW9ZqChVP2wB/3r67RUs3kMUs49hTyFrXAk8dsc4GNIUX7tRubG8Gn4M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(376002)(136003)(346002)(39850400004)(6916009)(38100700002)(316002)(66946007)(36756003)(66556008)(31686004)(54906003)(8676002)(4326008)(66476007)(26005)(2906002)(41300700001)(186003)(6512007)(83380400001)(5660300002)(2616005)(6486002)(31696002)(8936002)(53546011)(6506007)(86362001)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTQydzAvRjc3MHZGaDBDbnFSanM4cHRkYWRBVWdNaHZ3T2MvVGozR050VnJH?=
 =?utf-8?B?SUFXMUFVd1FlcTFSSUtTc1ZiSjNkTTM1K21jeVF4MFczaHR3Z1VMVlV0ZjVS?=
 =?utf-8?B?eVd2aEJiWWt2UWw5eDkyY20vNy9BMi9XSkJEQUs2M0o5UytaUGRzMEJib2xa?=
 =?utf-8?B?QmowTW5pVDA5aE1kb2Y3ZXlBNEQrRExUWEpINGg3alJVQVBHT1Zua3dIYk41?=
 =?utf-8?B?enVBaFRubkZKTjdHTHhoTGp6Yzl0ZUFmcThiaC9CK2VYb2oyZEhLcmhOUzNZ?=
 =?utf-8?B?czFNdCttR2JseGZCaU5tdnpPTjEyMXlwc2IzSzlUMWg2TytkclVBVFdmaDNU?=
 =?utf-8?B?d1B1Y2M5MXgvRjh6eWlQTXFUb3lndm1PWXBRbS9xK3FCbFNOc3JmMHFYUWtT?=
 =?utf-8?B?dEVtTXlIL2p6dW1CSnNEYXM4VHVpbjlJU291L0Vlb2NMcjZrYUkwK25DeG93?=
 =?utf-8?B?eVpjUENRUk8vLzVaZjZibEYzbXhoRUNwVHViWnorTDFNVWtxZnBsQUl3MEFP?=
 =?utf-8?B?cXA1VURzdnFTYjdJY2llZE1QbXJRSDdmT01oazQ0MElYSGY5Tzd6blVMbzA1?=
 =?utf-8?B?MlpRV1BHVVBteFNqYkNMMGg0K3U5TFVUVjB4ZmhaeDFaWEhkcEVVeTl4NVl6?=
 =?utf-8?B?dGdqWVdqQTNEVDBkMUF1b0M1MUg5blc3YXVIUnQrUmllektrZGZHbEY0Qk1p?=
 =?utf-8?B?RTRTSDhWSDMzbFRMVmk3akVtUGt1OXNXSDU4bnZ5MGZjajdIT25GUDZ3VzRO?=
 =?utf-8?B?ZWl3Q3Z6MHpoRmVEYzRLMGk1NGJGaTR2NWdGMEhVeEVWMVlzOE43dUU4NXVO?=
 =?utf-8?B?WktLUy9jaTNLSkJzbWg4RTYvaWRJQWJjYzBCSlEzNWd5dlAra1BhbVZyZTFD?=
 =?utf-8?B?R20zV3MvODBSK1A4Ykt4M3RPUnFmSzhtQW40K3RPNmd6SHhiaXZZOFkzcVZJ?=
 =?utf-8?B?ZFpWYTNwcEJjeisxdTR6bXEwUWFRNW4vcmNiTWNWZzlIdkFwckY5eGNxUHhr?=
 =?utf-8?B?ZFVucm5Kc3JjbkI5TzZnRDJPb1hWd2Z0ekdkMnZocW5EWVgwKzNEN0RzMENS?=
 =?utf-8?B?TURKRHdTN08yOTR4SWVnQ3YrdVlIK3ZTT1IrRmxIdHFsM0l2RXp2R2JDUDJq?=
 =?utf-8?B?TzV6UEIzc2dVbHhXN2RLdnRQUGpFZElvNEdHZ2VVd2x4K00vUFY1aWwzYWkv?=
 =?utf-8?B?R1hvcEZYcGhsdlF2eWFyQlViRis5NXlycFZQc2hRVlJPQU42ZW9GOWZQNzFP?=
 =?utf-8?B?Zko0SjRTUkpseXJhb01pSE8wZ2JLemo2TlFVVmQ3Y05jcUd4MVVUdWVCL2NF?=
 =?utf-8?B?N1pLOThKVUczNzZObTJGV0Noa0twM2FHcFhVTmRhT0Y4UnlDY2dxWG9ta2dq?=
 =?utf-8?B?WXhrK284ZTQxaThzbHM5b2Q2bVNkUFBiSFc1cWYvS1BSSC9lTmxjQ0lnZ3lJ?=
 =?utf-8?B?VHYwVi9GMUtpNkxDSWRNN2tvU0pWdXBNQ1dXd0VKNEhJTnlaZUg5Q2wvdkQ4?=
 =?utf-8?B?WXhOWmVGYXNrZjZYU2kzYTJTVXQzN09MRTZpWVh3cVgxYmI5aHlkR1gwOC85?=
 =?utf-8?B?R1Q3UlBxRHVialFFRThwNDdhQi8yNUtUdUw0dG9jb0dqangrbWJEVHFFV1Nq?=
 =?utf-8?B?cG5zZUxqVis4QkxkVnB6Y09zQ2JBQjdORVlqbVNzSlFiNXFzZFJOUDBiMFB4?=
 =?utf-8?B?Ym95UitvbHc0MkE1cmFqWno2OG02WFRvS1h0VjIwMVkweXVvaFFLUDZMeWlJ?=
 =?utf-8?B?UG1oOEN4TGQySHd4NHFqTE9FQmNnTytDd1FYUnhJRXZBZHFEVmZleGdRRC9t?=
 =?utf-8?B?azJkbUNhZjdGV1RTYU9GbUprT3VFelRGbjZDeWlCRm40NkJiM2VEV00zU2RU?=
 =?utf-8?B?eW93b2JwcFdXaGxrTDA1anh6RVpKSWNOc0l5bTRSTFlDRERheEFhUTF0eEdx?=
 =?utf-8?B?Uk55c1JMMXRMSysyMkc3dWUvZXF6MGQrNHlIRW9wMENSWEtHcmt3Y2F4dlFN?=
 =?utf-8?B?ZzNocG9ZNUVPVWw4TStoWmgxRzUwY1E3bDhyRFFPcHdIOTZuSEdZK1pDeTNj?=
 =?utf-8?B?MTQ0RHdDanRIMDVTMzl4ZWE0RVoyS0hTV1M1TFpKSUNEZVpTK3dmelVjUUl5?=
 =?utf-8?Q?yetQ9xrd59UT7GIrJkPo88j3t?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6978c874-df1b-4be5-2706-08da6898c552
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 08:37:38.2409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8YY0Nwe/fyL8gO5uhmPlUyseM8CHKWUdgB87Y8gLJXJci+tlwrqw1kgYm99I14M+Gf9gM5UGqtbuWFUDM3vMyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5616

On 18.07.2022 09:43, Wei Chen wrote:
> On 2022/7/11 22:32, Jan Beulich wrote:
>> the other day I wanted to look at the basic structure of xen.efi. First
>> I used my own dumping tool, which didn't work. Then I used objdump,
>> which appeared to work. I decided that I should look into what they do
>> different, and whether I could make mine work as well, or whether
>> instead objdump is broken and shouldn't work on this sort of binary.
>> While I'm not fully certain yet, I'm leaning to the latter. This is
>> supported by GNU objcopy corrupting the binary (I assume this is known
>> and considered okay-ish).
>>
> 
> Did you use x86's objcopy? AArch64 GNU objcopy does not support any
> PE format file. So I'm curious about the version of objcopy you are using.

I did use an aarch64 one, yes. Are you sure (partial) support wasn't
added? I've had no error messages, just a corrupt output binary. Btw,
this is 2.38's entry in bfd/config.bfd:

  aarch64-*-linux* | aarch64-*-netbsd*)
    targ_defvec=aarch64_elf64_le_vec
    targ_selvecs="aarch64_elf64_be_vec aarch64_elf32_le_vec aarch64_elf32_be_vec arm_elf32_le_vec arm_elf32_be_vec aarch64_pei_vec"
    want64=true
    ;;

Clearly PEI (the name used in GNU binutils) is included by default.

>> Many problems boil down to the (ab)use of the DOS executable header
>> fields, yielding an invalid header. The first 8 bytes are instructions,
>> with the first carefully chosen to produce 'MZ' in its low half.
>> (Oddly enough Xen and Linux use different insns there.) This doesn't
>> play well with the meaning of the respective fields in the DOS header.
> 
> UEFI executables are regular PE32/PE32+ images, Arm64 EFI applications 
> use a subsystem "0xAA64". PE32/PE32+ require images to have a DOS header
> for option#1 backwards compatibility,or option#2 to prevent images to be 
> run in DOS. I think Arm64 EFI applications select option#2. In this case
> I don't understand why we need a valid DOS header? For my understanding,
> we just need 'MZ' for file type identify and "offset to the PE header".

This last step requires reading a field from the DOS header which hadn't
been there forever. Therefore one first needs to establish whether the
field is actually inside the header. Yet the fields used to determine
header size have been re-used (abused).

> Other fields have be re-used by other purpose when load Xen image as
> binary. And lots of bootloaders are following this header format to load 
> Xen (Linux, or other Arm64 OS/VMM) images. Therefore, it is not 
> currently possible to construct a valid DOS header.

Which would carry the implication that well-behaved PE processing tools
should refuse to work with these binaries.

>> Subsequently there are a number of .quad-s, some of which again yield
>> an invalid DOS header. I'm therefore inclined to submit a patch to
>> make objdump properly fail on this binary. But of course with both
> 
> I have not used objdump to dump xen image successfully. I always use
> xen-syms for objdump.Sorry, Maybe I didn't understand your question clearly.

xen-syms is an ELF binary. That's of course easily dumpable. The
question very specifically is xen.efi, which ought to be a valid
binary (and hence possible to process by tools understanding the
format), but isn't really. As a result the question is: Should GNU
binutils be able to deal with this half-broken format? Imo the
answer can only be yes (requiring all tools to properly handle it)
or no (suggesting all tools to properly refuse to work with it).

>> Xen and Linux (and who knows who else) using this hairy approach, it
>> may end up necessary to continue to "support" this special case,
>> which is why I'm seeking your input here first.
>>
> 
> Yes, like I said above, most OSs, VMMs and bootloaders currently follow 
> this format and boot protocol. Therefore, it is difficult for us to 
> completely remove it all at once.
> 
> 
> 
>> Furthermore the fake .reloc section overlaps the file header. The
>> section is zero size (i.e. empty), but a reasonable PE loader might
>> still object to its RVA being zero.
>>
> 
> I am not very clear about "overlaps". Is it because we are setting
> PointerToRelocations to zero?

What is PointerToRelocations? There's an NT header field (entry 5
of the Data Directory) which is supposed to hold the same address as
the .reloc section's RVA. And it is the .reloc section's RVA being
zero which makes that section live at the same address as the image
header (both at RVA 0). The section being zero size, it can
effectively be put anywhere, and hence I cannot see why it isn't put
at a valid address (outside of the header). As long as it comes
ahead of .text in the section table, it would e.g. be fine to live
at the same RVA as .text. (Note how on x86 we had to adjust the RVAs
of .debug_* to match the general expectation of RVAs of successive
sections to never go backwards. Without that linker script
adjustment GNU ld would have produced a broken and unusable binary.)

Jan

