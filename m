Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AF4561A46
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 14:24:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358476.587708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6tDj-0007cg-9X; Thu, 30 Jun 2022 12:24:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358476.587708; Thu, 30 Jun 2022 12:24:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6tDj-0007ZU-6e; Thu, 30 Jun 2022 12:24:31 +0000
Received: by outflank-mailman (input) for mailman id 358476;
 Thu, 30 Jun 2022 12:24:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6bdU=XF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o6tDh-0007ZO-Oy
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 12:24:29 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130074.outbound.protection.outlook.com [40.107.13.74])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95cc5bd5-f86f-11ec-bdce-3d151da133c5;
 Thu, 30 Jun 2022 14:24:28 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6732.eurprd04.prod.outlook.com (2603:10a6:10:10e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Thu, 30 Jun
 2022 12:24:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.014; Thu, 30 Jun 2022
 12:24:26 +0000
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
X-Inumbo-ID: 95cc5bd5-f86f-11ec-bdce-3d151da133c5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X9/JAEAppMlaFbbTl47xL6sYU8o17zYXoTXD0+i+D6iaqCDCGhthsDFvq2FIBVjAlzhzen78Y1adFkO5J6I0Sr05pwa3xs8psVcXoFFLAfPQDi6Y2mezaTY8ZWpbzV93B0AMAm7xYWVwZQ9XFwdgnvxspoDze+R6WTaeZiSb+g/YY7ZzTLgSqoPuEZVQiY1Im3h6WsXEADv8VEk3PyMUxB62+dPI5Uy7LiVjKd6Lq7j1CMfpChVFsTwxDbESfAoVXN35C9vR1Yqe0xR2a1CYL4uq4CH2rt1TsmEIbd5fcnvQZUi1fHf+p6UmBqg0Q0NbhGAC6ZwzdL7SnAKtPQCCag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JpaL2K1pu2wSSMdea8KXMD5azt8WoYd/UmJdDdI8xW4=;
 b=HT89mmdRFDarb4CMYSX3DJhtf0iM+Q0RDtxX26/UnEhM5I4dSaOs2Jg5NpgCKqTrD7CZljEid8vxfnYhSIV2SyJURLl4pEpoa+7yd2mlSbJcgM8M30yqrWnsrWnPgA20nfDwa+/2AqG1NOj7EJj1HEJ+/Ml/vYtKIMsLevKuHD1LBGvyMilMZ/M1CUBxqboevaCWBix6AtHQqHcaaEM8hKSqBB/wkrY1OA0N5+b/qOluiZF9BS6INEfdzRtpMs4EqOmZWIbSDoMEI/ptKk9PH6RtXeCacyObGSsun6y50UHIHA2BcA/N3/d7nEFsJXthcDicdqte7SknQte6Q0ITKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JpaL2K1pu2wSSMdea8KXMD5azt8WoYd/UmJdDdI8xW4=;
 b=3P9RY4QQ016ycNGlWpAPineWhFzYufo5kK7Gz35oku0Qkhrwz2f/eGq58BEWoWT/QgIIp1MfZz4bW4ksXZyH1aatxw+tmb6OH+02/HCah4DgsnKT7gpeDeLZjWBAV4GGnbygXU4lHzKWMJo/DCevhfXHy7vSBn1j5HV5rtiGWl4Tf+rfuB4ILDIk4puX2WnNOwYQysKlDsLMj71u7QrFnzX0dM7uofj5i7eDfhPPskBgeHLdRYo9tDu7DdVXpxxu7M0QKLJbUqJV90w9CKloBpop1alBY2XnketHPOF4e7Z86zFpMz+M5NPu3eMNm3n2dAx/kYL+lzENDYIj7RbC5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8d23c11b-38c6-8356-cd28-6550e91220b1@suse.com>
Date: Thu, 30 Jun 2022 14:24:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: R: R: R: Crash when using xencov
Content-Language: en-US
To: Carmine Cesarano <c.cesarano@hotmail.it>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>
References: <AM7PR10MB355942D32F58FF02379C398CF8B99@AM7PR10MB3559.EURPRD10.PROD.OUTLOOK.COM>
 <87d0667b-2b85-f006-ea3c-6f557b2bdc8e@xen.org>
 <AM7PR10MB355972A68A222CB9FBAC43D4F8B99@AM7PR10MB3559.EURPRD10.PROD.OUTLOOK.COM>
 <daa12b90-da87-d463-24c4-a13fba330f1d@xen.org>
 <AM7PR10MB35593AA7F46B4D4A0BBD9841F8B99@AM7PR10MB3559.EURPRD10.PROD.OUTLOOK.COM>
 <AM7PR10MB3559BB8CB733902773B1AD6AF8B99@AM7PR10MB3559.EURPRD10.PROD.OUTLOOK.COM>
 <AM7PR10MB3559A1984F6B53CEFB4FECC7F8B89@AM7PR10MB3559.EURPRD10.PROD.OUTLOOK.COM>
 <ef8b540c-d2c2-c999-d3fe-08fc88665ad9@xen.org>
 <AM7PR10MB355902159111F3CC8C6CDB94F8BA9@AM7PR10MB3559.EURPRD10.PROD.OUTLOOK.COM>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AM7PR10MB355902159111F3CC8C6CDB94F8BA9@AM7PR10MB3559.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P195CA0043.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc0e7c60-70e4-44aa-495b-08da5a9378c6
X-MS-TrafficTypeDiagnostic: DB8PR04MB6732:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KKOyuo9W8e65WcCMVAhgSIv48rYIusmULaeVxkzZyO0rGVqAxwO7ouwCJo3pzfIVutxJxNXv4I4kKinCgtobPgWDtNY9Mz/mKqknXFsMW8OmxBnqmpWh658TlC6TSJBm5xPbo08XvTDQ14tmvG/UUpDRba8zeT/ZS5zq8RhkQi6BdkkOjPS23gj9YbX3emHJY3bOFOXDOWlh74pWyV8yTEH3v9PAj/5GZ3De4pka1F6le5HPxYPdmnNxb0hFNoNL7zKC/T0MbDTx9OoYlp206Ty+kIRl2wEMafkHTRbSVebhIxruc2B63YHi8JESn9J0Sgx6rcsCDrtB6sUTNw4lPtuVe82SaZf59rkqm1xiQkDck27pe9htfReDvGiB/TslMZe4URXCBBe/SF32UScPgZE4RwJx8XZ+CEj4r72Y/YywRyAi9UtEcENvOt6BQsigcKJ+uxhOSAOYWJTKypAsPrczu07WfVylzmZhJn3mlymzmUVtvBqs/qNbamgpQuZ/88aojwOhA/Q5QD4SzYTb2XqXagJvjeQFctf6NJ2ZCCdlh+I4mAkKJPEXIqPAkqOJv5dDCQ/4jDVvE6BLzc7EZj5YW9FQh5ky5lxBIjDCi8FVHxe8ARQlGNMBvIYJRzQJzdjiXNKjmfDTXnA+m2SFwfx/DzbtRCDil0xGbV19tkrDd/jvNv+wgAOv5jg78fsY1wMBEfe+3lot837FY5c4vJa8ueMal1IhEL29FgIalsXYvYWwIq4rfgZGFLeaUIIi33jdmESzyd0APd5s2KWwbCbDgGtj9N0ksJh3u5XClLQKWen/cQtPdpdAv/PzvYaEjhHI8Q/a63Lshju7AB/3p/uc/ctGhyhbWdwQCUpZSDY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39860400002)(396003)(366004)(346002)(136003)(45080400002)(186003)(6916009)(53546011)(6506007)(2616005)(8936002)(54906003)(83380400001)(26005)(8676002)(31696002)(41300700001)(6512007)(6486002)(86362001)(66556008)(66946007)(38100700002)(36756003)(5660300002)(2906002)(316002)(66476007)(478600001)(4326008)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUVLZ0V2MjZUWS9pNzZvQlFobkl5MFYwejRwVi9KVlkzSUtJUk9TRmVuU0pP?=
 =?utf-8?B?VGJURDVQVWZVRm5HOHl5R0xKaHgwSlNpKzFCVmtsRUtTaHVZMHVHamVHTG0z?=
 =?utf-8?B?dEVaSkIrUkZkTXc3QW5mRXlGd2JlVE5jQU0xUm9NTlFmWExaaXVJVU1WMU0r?=
 =?utf-8?B?ZENReSs4QkdaWEFvb1BpNm1WbEo3VXl4WTlSYUdRa3pocnJMV0E4MXRNVkpj?=
 =?utf-8?B?VEFrNmVBNy9tQjN4Zit6bnVsQWRsdWZuOFZjWWRlMU54RlZzYUNNNW9VYnU0?=
 =?utf-8?B?VGNORi9vWW43N0VMNVdSTStYeHI0SmRaK3p3S0xwZitDVTVPTFVab2VJcW96?=
 =?utf-8?B?QWowbTE4MTg3RkpQUTNTQitEM0x2N0ZScmc4MEY5MTE4NWpvaGpHY1g2N1Vv?=
 =?utf-8?B?NUZvWGpHQW54SDcwVW5BYU80UEhCSFdHQk5mTGIzZXk0QzY3WDlySmYvNTdt?=
 =?utf-8?B?V3dUYmFVOVRsbE13OHhqellCUzdLRnk1TG5uU2x2RWQ2MUhJL2dmY1JsQm5S?=
 =?utf-8?B?YlM2YzhyYm54eXdBZG1LajVrMEtkU3NDcVNmcUdkS0g5RHlVbyt1ZG14UWQ1?=
 =?utf-8?B?dENCNEdCRk1oZ0w1Zy9jT2FsUjlwSlM0VnJWcFpCeUVVOTBRbXIyZU9ma3VB?=
 =?utf-8?B?VTh0WEtXYnYzSVRQd0xaazFVWDd2ZnVBeG1NSHlZYjZuUjcyRDRIK3NzYndw?=
 =?utf-8?B?U0FYR2ZHTEYwa2wvdmQ3M0tTRDNEQzdQdXF3bjdNV29qaTVSaTNvMEFUTGZt?=
 =?utf-8?B?QjZ2Y0tTYkpxdUpGT0F2ZWpiTlVHZTc4bkdVcnBvRjR5MlZIRzhEWWs1MDh3?=
 =?utf-8?B?eVlKY3ZjdnBxT3JROHpVcVdWTUFLVjdCQ2ZmK2pGMlVXWXNzVWR3UVFFNkI3?=
 =?utf-8?B?eWRlZlVSV01iemQxTExXOUp3WS9leXhGdjIwTktNTE5MazZHSWRUSEZONDNq?=
 =?utf-8?B?NTJzYTBKck41aWU0SkZVVk5sYm95MjgvZytxaEdVTzBRc1U1NVNFSE05ZDVw?=
 =?utf-8?B?N1l6c3ZSaHI0SWppZHVxVTFCMTJhbHV3MEdvWU1kTjhGaWJVUytUcEF5NXZR?=
 =?utf-8?B?ZXpRb3k5QkZHMmFyUHpzTUwwaFhwM01UY0xQWnEwRWRvc09XSE9sNkFWalFi?=
 =?utf-8?B?TXIyalR2elhOQXhXOURzbEtzRzNZWnlqb1c2QzdZVHVPeThIVzNMOXZlVUF5?=
 =?utf-8?B?NVFHS1JjckFMVjNveVIzUXFSOTJUaEd6TCtlUHpBOXg5MDJsT0dKMjluSVRZ?=
 =?utf-8?B?dTFFUWdJMURyTjJ2eFNIZ1l0QXlTUG40QnJMdHJoMEpzbVBQRUVHclRPcVNI?=
 =?utf-8?B?aXdFaUhSQlNEY1ZYR2hMdFdKRFFvVVpVRHpybHEycjV1Ymw2M2JVK0lpOTdL?=
 =?utf-8?B?bWMwNElDcFRySEl1Sm15SDY3bEZFa2F6TXNoRGpORGpLcWpsRmNpUjhtMXlB?=
 =?utf-8?B?SGdwblJGVzVuNXZhb01aS2V3VjNtNzZOQWllZy90Ym13ZldPQ1hjYkRIcHh3?=
 =?utf-8?B?d2k3S1NKTTJ6c3lXUHA4K0tyTitmU2tFRmE4ajRERkgwQWFLcloyZ1BDSTM5?=
 =?utf-8?B?dVlqUUVjRlE0WFhzUEdTSm5GaCtBa0ZhdFdVdGhoRWJZajNjV1BSazlpL2Rv?=
 =?utf-8?B?ZUtIVXI0aGFtd21tUHFwNURLbCtFb01vMmJUeEFGL05kY2dMZHlEa1BDL2Zp?=
 =?utf-8?B?VG10NjN5VHJRQUFlL2JDemFHYlRaRmNla3ZWSnNvSE93K0NQRjJsUWxLZ0dv?=
 =?utf-8?B?Vk9iSVE1b1JKZWdzSVIxMEFweUV5b0pJUTN3R09MMzhscEpCZGNMcUZHK0Vk?=
 =?utf-8?B?WlFmOGRDRDF0ZjBoSVFqaWp4TjJvOXlHRUVQeDFMWXpIOWs5Mk5VYWlvbDla?=
 =?utf-8?B?ZlowWnQvVlBENHVWL1paSytET3prU0JqL3djdnozQVNNYzFhbDdYaU5TcHBi?=
 =?utf-8?B?Rm1VaXdicndTZWliYXRPMGd6elEvWTRHZFUyaFVxMzVrc1pxNnV5b0luWjhn?=
 =?utf-8?B?Z1JMWHNDMDVvYk84UUJnQ0RuejlPMGRpOGRwWjFMOFZKTHlONjQ1WnR5WmQy?=
 =?utf-8?B?di95bEJ4NmFPYzZJbTFOKzFHRU5oSEZxNmhrZ1huR2t3YXAweGhiZTFsQnhq?=
 =?utf-8?Q?p/rWuGCCr1/sdHMiLS+3fQABK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc0e7c60-70e4-44aa-495b-08da5a9378c6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 12:24:26.0862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1VdexkeQsANpQuoAqz6+i2/cyHrH9E7VzilNwwG/0ktEJwj/MWQHdJY6aWtz8aF/PfWTfFoVwr99WXCRuvr2QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6732

On 30.06.2022 11:07, Carmine Cesarano wrote:
> Sorry for the images on the ML.

Please note how Julien had also asked you to not top-post.

> If I wanted to change my setup instead, is there a tested and working version of gcc for xencov features on xen stable-4.16?
> (I read GCC 3.4 or later in the documentation).

Judging from the sources someone had tested with gcc7, but earlier you
said you see the same issue there as you had seen with gcc10. I assume
you did make sure to do a full, clean re-build when switching compiler
versions.

No update was made after gcc 7, so it's not entirely unexpected for
things to not work anymore with newer versions.

Jan

> Da: Julien Grall<mailto:julien@xen.org>
> Inviato: mercoledì 29 giugno 2022 20:02
> A: Carmine Cesarano<mailto:c.cesarano@hotmail.it>
> Cc: xen-devel@lists.xenproject.org<mailto:xen-devel@lists.xenproject.org>; Andrew Cooper<mailto:andrew.cooper3@citrix.com>
> Oggetto: Re: R: R: Crash when using xencov
> 
> (moving the discussion to xen-devel)
> 
> On 28/06/2022 16:32, Carmine Cesarano wrote:
>> Hi,
> 
> Hello,
> 
> Please refrain to top-post and/or post images on the ML. If you need to
> share an image, then please upload them somewhere else.
> 
>> I made two further attempts, first by compiling xen and xen-tools with gcc 10 and second with gcc 7, getting the same problem.
>>
>> By running “xencov reset”, with with both compilers, the line of code associated with the crash is:
> 
> Discussing with Andrew Cooper on IRC, it looks like the problem is
> because Xen and GCC disagrees on the format. There are newer format that
> Xen doesn't understand.
> 
> If you are interested to support GCOV on your setup, then I would
> suggest to look at the documentation and/or look at what Linux is doing
> for newer compiler.
> 
>>
>>    *   /xen/xen/common/coverage/gcc_4_7.c:123
>> By running “xencov read”, I get two different behaviors with the two compilers:
>>
>>    *   /xen/xen/common/coverage/gcc_4_7.c:165   [GCC 11]
>>    *   /xen/xen/common/coverage/gcov.c:131          [GCC 7]
>>
>> Attached are the logs captured with a serial port.
>>
>> Cheers,
>>
>> Carmine Cesarano
>> Da: Julien Grall<mailto:julien@xen.org>
>> Inviato: lunedì 27 giugno 2022 14:42
>> A: Carmine Cesarano<mailto:c.cesarano@hotmail.it>
>> Oggetto: Re: R: Crash when using xencov
>>
>> Hello,
>>
>> You seemed to have removed xen-users from the CC list. Please keep it in
>> CC unless the discussion needs to private.
>>
>> Also, please avoid top-posting.
>>
>> On 27/06/2022 13:36, Carmine Cesarano wrote:
>>> Yes, i mean stable-4.16. Below the logs after running "xencov reset". The situation for "xencov read" is similar.
>>>
>>> (XEN) ----[ Xen-4.16.2-pre  x86_64  debug=y gcov=y  Not tainted ]----
>>> (XEN) CPU:    0
>>> (XEN) RIP:    e008:[<ffff82d040257bd2>] gcov_info_reset+0x87/0xa9
>>> (XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor (d0v0)
>>> (XEN) rax: 0000000000000000   rbx: ffff82d04056bdc0   rcx: 00000000000c000b
>>> (XEN) rdx: 0000000000000000   rsi: 0000000000000001   rdi: ffff82d04056bdc0
>>> (XEN) rbp: ffff83023a7e7cb0   rsp: ffff83023a7e7c88   r8:  7fffffffffffffff
>>> (XEN) r9:  deadbeefdeadf00d   r10: 0000000000000000   r11: 0000000000000000
>>> (XEN) r12: 0000000000000001   r13: ffff82d04056be28   r14: 0000000000000000
>>> (XEN) r15: ffff82d04056bdc0   cr0: 0000000080050033   cr4: 0000000000172620
>>> (XEN) cr3: 000000017ea0b000   cr2: 0000000000000000
>>> (XEN) fsb: 00007fc0fb0ca200   gsb: ffff88807b400000   gss: 0000000000000000
>>> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
>>> (XEN) Xen code around <ffff82d040257bd2> (gcov_info_reset+0x87/0xa9):
>>> (XEN)  1d 44 89 f0 49 8b 57 70 <4c> 8b 24 c2 49 83 c4 18 48 83 05 a6 81 4c 00 01
>>> (XEN) Xen stack trace from rsp=ffff83023a7e7c88:
>>> (XEN)    ffff82d04056bdc0 0000000000000001 ffff82d04070f180 0000000000000001
>>> (XEN)    0000000000000000 ffff83023a7e7cc8 ffff82d040257a6a ffff83023a7e7db0
>>> (XEN)    ffff83023a7e7ce8 ffff82d040257547 ffff83023a7e7fff ffff83023a7e7fff
>>> (XEN)    ffff83023a7e7e58 ffff82d040255d5f ffff83023a7e7d68 ffff82d0403b5e8b
>>> (XEN)    000000000017d5b2 0000000000000000 ffff83023a6b5000 0000000000000000
>>> (XEN)    00007fc0fb348010 800000017ea0e127 0000000000000202 ffff82d040399fd8
>>> (XEN)    0000000000005a40 ffff83023a7e7d68 0000000000000206 ffff82e002fab640
>>> (XEN)    ffff83023a7e7e58 ffff82d0403bb29d ffff83023a69f000 000000003a7e7fff
>>> (XEN)    000000017ea0f067 0000000000000000 000000000017d5b2 000000000017d5b2
>>> (XEN)    0000001400000014 0000000000000002 ffffffffffffffff 0000000000000000
>>> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
>>> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
>>> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
>>> (XEN)    0000000000000000 ffff83023a7e7ef8 0000000000000001 ffff83023a69f000
>>> (XEN)    deadbeefdeadf00d ffff82d04025579d ffff83023a7e7ee8 ffff82d040387f62
>>> (XEN)    00007fc0fb348010 deadbeefdeadf00d deadbeefdeadf00d deadbeefdeadf00d
>>> (XEN)    deadbeefdeadf00d ffff83023a7e7fff ffff82d0403b2c99 ffff83023a7e7eb8
>>> (XEN)    ffff82d04038214c ffff83023a69f000 ffff83023a7e7ed8 ffff83023a69f000
>>> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
>>> (XEN)    00007cfdc58180e7 ffff82d0404392ae 0000000000000000 ffff88800f484c00
>>> (XEN) Xen call trace:
>>> (XEN)    [<ffff82d040257bd2>] R gcov_info_reset+0x87/0xa9
>>
>> Thanks! There are multiple versions of gcov_info_reset() in the tree.
>> The one used will depend on the compiler you are using.
>>
>> Can you use addr2line (or gdb) to find out the file and line of code
>> associated with the crash?
>>
>> For addr2line you could do:
>>
>>     addr2line -e xen-syms 0xffff82d040257bd2
> 
> Cheers,
> 
> --
> Julien Grall
> 
> 


