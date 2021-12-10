Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A45846FB9E
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 08:36:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243585.421424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvaR7-0008GR-3I; Fri, 10 Dec 2021 07:35:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243585.421424; Fri, 10 Dec 2021 07:35:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvaR6-0008DW-WA; Fri, 10 Dec 2021 07:35:20 +0000
Received: by outflank-mailman (input) for mailman id 243585;
 Fri, 10 Dec 2021 07:35:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aCrA=Q3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mvaR5-0008DQ-Ly
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 07:35:19 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8e83d3a-598b-11ec-9d12-4777fae47e2b;
 Fri, 10 Dec 2021 08:35:18 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-Z8L-EvIyOtKSESYPDv70xA-1; Fri, 10 Dec 2021 08:35:16 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4189.eurprd04.prod.outlook.com (2603:10a6:803:3d::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.22; Fri, 10 Dec
 2021 07:35:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.024; Fri, 10 Dec 2021
 07:35:15 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0502CA0014.eurprd05.prod.outlook.com (2603:10a6:203:91::24) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 10 Dec 2021 07:35:15 +0000
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
X-Inumbo-ID: b8e83d3a-598b-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639121717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xvOfb2mwzj5tVqo3Msu+rs5pD5sEr5fmus0vWBUIRHw=;
	b=NZFl81b9IL4zWrruPa82bOHgSdP8jYS4dk8EzeRzJAyXd316lmXnpBIcZrbASutvkLIuXY
	3TZS4Cf3g+46uHw6KGhpoFNZ97RvGZX7NM+fut8VKqPsUxVXcbKZR7mK7nxwTqBK93nJSM
	rKnAx1RzGRRT257RVd6yKEwWL+TPZ8I=
X-MC-Unique: Z8L-EvIyOtKSESYPDv70xA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lUmqguYYBU23RfXx4mV5iPd/3+FiOaphjjjcmARMQddN9T80gD4CwyB//ucBTSKpbMOdBYM4VBPXpCCAxCdlfneNZMWYA4SjZ5fbEYD4lkwrhJvRfxs8bQdbgWT988o6/l1vIZzL2fFn4FZdZwjLYbJYhjXjbxl+P4WrIkZAUKTi1Jr263LrMrna7JY/D6i2FyaJR9lc13gKJwbeTbegHgm8p5I45vXMVzuZXhTiyrvWiZ5FmyvoFkGe8QNkBcm7HaxuHVPoVG2y9nEfOQlE6ZGo4Yb0kHnAH8DLuhbARTaasL5mzvivaL9jhETy9A4is6e8PrkpE9ZJ0zFyotbegQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=voGRfI4hjarnJNIRTmU5gWi/djIx3fUZDvlLaJuWedM=;
 b=RbAPcFayQe7QKb7Jgvl+qDmVLv41ksF4z4PBiSMLIIrD46XypfqWufmyDICNaaaB4JKDRjZKrVbKxf5GgzSupdhVueRyyuXxg6gJOiWKGVC9BES6njCDwUtvYok9mEVIKT6VPwS1to2aiMAvAeNAQWjywRb960dICWIoQqmxhTOJpIwE4x0JPEpOywvWxqaUMRrpi+ujaCta06L+7rjICfpRMqWA5KmCtqvKkvH0hTzBKdRoqgoKdo0CZ3FKySzJ0wbGFBBCjRVRWVV3yGQilFfH7/RgS0s3Qml18eprl97TrA61grUnut7Gpj2JJLDzmE+EexnjQrlgQqynDLkUow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <61fd577c-2ada-5018-f065-53cf8dcd9efc@suse.com>
Date: Fri, 10 Dec 2021 08:35:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 2/3] x86/boot: Drop move_memory() and use memcpy()
 directly
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211207105339.28440-1-andrew.cooper3@citrix.com>
 <20211207105339.28440-3-andrew.cooper3@citrix.com>
 <81893ccf-6b94-ddc7-d92b-f254861fe994@suse.com>
 <becdcf55-51fb-0b62-6b34-d5c790b7d238@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <becdcf55-51fb-0b62-6b34-d5c790b7d238@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0502CA0014.eurprd05.prod.outlook.com
 (2603:10a6:203:91::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a11820d-d234-4637-b499-08d9bbaf9bc8
X-MS-TrafficTypeDiagnostic: VI1PR04MB4189:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB41898CBA1858360DC9E6C16BB3719@VI1PR04MB4189.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7MNMq76C7+6hG1HYurvwHn/U+RP7Qq5zfLoB4+bewxD7yA7Xh5RjaKSzCdNW+W1hCmZdj6rIOMrNztqzygHb5R7QvsriRC041d8I46olykaSiKuAhg3C3WGJV21gQQmcfUFSlBJD2p5Vk98lOWgJXxLCB71PdowJkYC4XfyEvMY4+EFqJNWmnW2Reja+vZB0pYkjdH4XtJHqPGqV+t3sEoemKchd4wkT1drzjk9i+0XcFdePLgucFn1+fcKQ1HXLpEorCkkp0wKS2QJ3kBwMsfeoMN0b5G3EBL8zdXDMOGbKDkRgEulFw0Hi6CCR4uUmcPYBW4G+V8GOYGG2lWa9SCZx3a7oSKr4JTVAHbGw7LtmJDpUoXKAN/KbZU9n0HTAWFlHYOQ5BsQnK9lBuiFzpRDwvZAuG4wF29QReSUMNP/JQE6UUbySkasSSX66hSxykcWkEgTklGQ+N6IM5+8IDQkNCLIpG7uC7eUNcl0+piwj+VbTNrMah809xrXxu0DTlY3qCpCqZ120/yMR91a5gZpJqahLY9XMKUZbp5Ai0i88oKj9NvbRskIC/l1REuu8dU6yJF9i6ZeE/2w1jJ4vONf+xnxJ1nDVe2yxnaDDDNi98GfT81cX6UOlenJxSqr6s8T44P9gzpbIlKTWpAsKJShCNMKz14gYgdr7c+xq7/vCTFy70SqBmi5Dnj4hHUGRC/NSfhjf0YJL8X71wWqzhKk2WDjD2ND/dnpvJ4F40JYZMoHp1XtTHJtSVugByumX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(36756003)(2616005)(956004)(38100700002)(83380400001)(31696002)(66946007)(66476007)(66556008)(54906003)(110136005)(16576012)(2906002)(8936002)(26005)(316002)(31686004)(53546011)(8676002)(508600001)(86362001)(4326008)(186003)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2iSaWr3TL39cmgJcmB9lNLfxOL0nErI9YhVyEp+czidaKmRsf45hxEbDSkwk?=
 =?us-ascii?Q?cv4kLLlsFYsNCof4u/zhIPlKMl5BRH6F6rAl+okN8TiDY4WZ8/7h6upVTkx3?=
 =?us-ascii?Q?dBUKtRSMoocmZKLv7np3tbB5UR4WSkaWv+2lRlAK22WZqKUpCrydnLpxRdLv?=
 =?us-ascii?Q?ErtHy4sUIkvHNZ9UbFyy8/udL+dN8XHyfSDgqgNjihqKwGfPkLa/ZqtABivg?=
 =?us-ascii?Q?4XgciUzYOzjlNE+VMysglCKau2HZAObW2/hyAYTp2cB7eQskvXVXRSc+k0uF?=
 =?us-ascii?Q?1DTahWJ9tvFnUPwsFKfEv7tHi9ghjNR8azfwr6dLdXB46mqkKKDSCAMUUytk?=
 =?us-ascii?Q?pszBh8CqXwsR8Z2v/9LfVEJjBMdioFR68dedAnbmu9AJtJJPEZQtN2PsBU9W?=
 =?us-ascii?Q?cG5JsCh7mgpGGPo7YX8JHcg+2C+Zzon3bOBNc7332orvRiNr2WMQ1Lta0TfJ?=
 =?us-ascii?Q?hz/1HLJ58JBGzBmslkhK8H4TD6g2dNeSnmeEdNWJanyb2LqZkEZbtNA5yQ4W?=
 =?us-ascii?Q?wvzDwKEDo/FAsoGz6wKyb661B7arCqBR6b8ZqSGrPmKTZK6QBESjHDSWElvm?=
 =?us-ascii?Q?9GXdUyYQbuGQ/wLBsfwl3k3qc3c+zFGwJYFmLOzv1h7tcXQhXetG3970EnAV?=
 =?us-ascii?Q?mbm8bDQNxY0mEKvfivjFbpD5iQc6ll98WjRzxiNoCVFGzR10jSrbJUksbrGj?=
 =?us-ascii?Q?epfJw+5Se/dxQZsUwmHqi6Tjf/oy1Npc+2J5HwnYGuLdROFrplVW2AlTJpzd?=
 =?us-ascii?Q?XLSJIjqTM5LIUhNx8y+udF/+k5tBRCHhLkjbKDxoHa2GFFZ+4yhbXsPySW4X?=
 =?us-ascii?Q?zleagUDEfF4pZlZhl8nfds3foLGqtVurKVtCtUPQm9+SwMCAlE1yn7Tqpa2n?=
 =?us-ascii?Q?BTNm6lnd5YO5yGkWbmq2orq1jGor8t0O/lwWvgQkfERSk6hZ9H9yaCbX0adg?=
 =?us-ascii?Q?KzBBNJJ5CvUtcTIXqh7Uua3O2xy94x7wjKowKkVN/hsGH1twxs9yF9aSwUAl?=
 =?us-ascii?Q?uqSCkJrgR20JH8aP6Rm/jBtho8nAV7fWyFZFQWp4swAmMR9eWD2Q2yt5UL33?=
 =?us-ascii?Q?QAdMC9SFSBwj6TUKnhl3AK+tt211qGs0kM+qd4rOtdCxvhLG35L8L0tybSuE?=
 =?us-ascii?Q?xl7FbDjCOoa2XguKrxx9cxrmcFqt1364W9tCNImB1YlJul5g8nqzb0GsTvfh?=
 =?us-ascii?Q?XVXG+Jz+ZLQKTuSB2zYpKS8B9lRvL00VTEIh//LpcP/vrHvNy7+xuBrX48PI?=
 =?us-ascii?Q?hZ0EJQVQJZeg79J6UIfU9sP+3pDEVYTzh/pc6AukJ4kGo87TnMYl/aPX3U2z?=
 =?us-ascii?Q?uBjpaFk5yott3HoSwkNnNSVU3tOlas4ZGc0JV8A7iyvBd3psPRxow7fxpm8l?=
 =?us-ascii?Q?fS3itCV7kSk5+i8Mbf48jFnQuhzqLJBsSqzhGUh0VwWoCBnkzdrBNy1f5SKs?=
 =?us-ascii?Q?hXPDYNG9cZrTnFSLUJkLsgqF4fTisj41o10Nhi2rGHnfTQjvUoE46L4bl+zY?=
 =?us-ascii?Q?XSTGBfwjSehbZgOZBmfpPZbNkLTGT+uCdODmjLTS6H8CFAKqFmpDt1si0zsF?=
 =?us-ascii?Q?aVrzh/dSrT6AFzGwMHkf/64fPwMIK3XeAW9bOJNV5wQWbfNwUF/hX/GiA2lr?=
 =?us-ascii?Q?yVEYj2OpIOXg1truSp0J0Ec=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a11820d-d234-4637-b499-08d9bbaf9bc8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 07:35:15.8197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zmL86wKKxS7rSSte/IU0Ju6eUFXPqCFi/stvJPki0oqonARWVatu9BLZCPQ3vW9TZB1+cowX1txAf8Dgj9SbgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4189

On 09.12.2021 20:58, Andrew Cooper wrote:
> On 07/12/2021 12:03, Jan Beulich wrote:
>> On 07.12.2021 11:53, Andrew Cooper wrote:
>>> @@ -1243,7 +1196,7 @@ void __init noreturn __start_xen(unsigned long mb=
i_p)
>>>               * data until after we have switched to the relocated page=
tables!
>>>               */
>>>              barrier();
>>> -            move_memory(e, XEN_IMG_OFFSET, _end - _start, 1);
>>> +            memcpy(__va(__pa(_start)), _start, _end - _start);
>>> =20
>>>              /* Walk idle_pg_table, relocating non-leaf entries. */
>>>              pl4e =3D __va(__pa(idle_pg_table));
>>> @@ -1300,8 +1253,6 @@ void __init noreturn __start_xen(unsigned long mb=
i_p)
>>>                     "1" (__va(__pa(cpu0_stack))), "2" (STACK_SIZE / 8)
>>>                  : "memory" );
>>> =20
>>> -            bootstrap_map(NULL);
>>> -
>>>              printk("New Xen image base address: %#lx\n", xen_phys_star=
t);
>>>          }
>> This bootstrap_map() must have been dead code already before, except
>> for the "keep" argument above needlessly having got passed as 1? Afaict
>> passing 1 was pointless without using the function's return value.
>=20
> bootstrap_map(NULL) is necessary to zap the constructed mappings, but it
> seems like the use of the return address was dropped by c/s 0b76ce20de
> "x86/setup: don't relocate the VGA hole" in 2013.
>=20
>>
>>> @@ -1325,9 +1276,10 @@ void __init noreturn __start_xen(unsigned long m=
bi_p)
>>>                   (headroom ||
>>>                    ((end - size) >> PAGE_SHIFT) > mod[j].mod_start) )
>>>              {
>>> -                move_memory(end - size + headroom,
>>> -                            (uint64_t)mod[j].mod_start << PAGE_SHIFT,
>>> -                            mod[j].mod_end, 0);
>>> +                memcpy(__va(end - size + headroom),
>>> +                       __va((uint64_t)mod[j].mod_start << PAGE_SHIFT),
>>> +                       mod[j].mod_end);
>> I'm not convinced this can be memcpy() - consider_modules() specifically
>> allows for the current module's source and destination areas to overlap.
>> See also the comment ahead of its invocation a few lines up from here.
>=20
> The comment which says:
>=20
> /* Don't overlap with other modules (or Xen itself). */
> end =3D consider_modules(s, e, size, mod,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mbi->mods_coun=
t + relocated, j);
>=20
> ?

Yes, with the emphasis on "other".

> memmove() in move_memory() is broken, and in fact always results in a
> backwards copy, which means that one way or another, overlapping source
> and destination doesn't work.

We agree on this aspect.

> If it was really broken before, then it can be fixed now by using
> memmove() here, because using 2 directmap mappings means the
> forward/backward check will now work as expected.

Use of memmove() here is what I've been trying to suggest. I'm actually
surprised we've had no reports of breakage, so I will admit I'm not
fully certain that I'm not overlooking some aspect excluding the
potential for any overlap here.

>> I'm also not convinced we have the source range (fully) direct-mapped at
>> this point. Only full superpages have been mapped so far, and only those
>> for the current or higher address E820 entries (plus of course the pre-
>> built mappings of the space below 1Gb [PREBUILT_MAP_LIMIT]) located
>> below 4Gb.
>=20
> PREBUILT_MAP_LIMIT is 2M, and that's only to cover the fact that we
> build l1_directmap[] with the VGA UC range at build time.=C2=A0 I was hop=
ing
> to remove it in due course.
>=20
> As to the other mappings, that is awkward.=C2=A0 Perhaps what we ought to=
 do
> is split the loops.=C2=A0 First fill in all 2M superpages into the direct=
map,
> then relocate Xen, at which point we've got plenty of frames to feed
> into the allocator, to let us do a second pass filling in non-2M regions.

Well, we already have such a split of the loops, just that the 2nd part
occurs later right now. So what you suggest is either moving up that
2nd part or moving down the relocation of the modules. If you're
convinced either of these can be done without breaking anything, this
would indeed seem to be the way to go. I have to admit that I'm not
convinced (yet).

> We can depend on the modules living in RAM regions, but might want to
> explicitly confirm.
>=20
>> As to the 2nd argument - if this can indeed be converted in the first
>> place, may I suggest to also switch to using pfn_to_paddr()?
>=20
> Honestly, that's taking a terrible situation and making it worse.
>=20
> Calling pfn_to_paddr() on what is logically a paddr_t already ought to
> be a compilation error, and the logic which makes this change
> deliberately is some of the most nack-worthy logic I've ever come across.
>=20
> It's very much not ok to have mod_start be a paddr or pfn, and for
> mod_end to either be an end or a sized, epending on where you are during
> boot.

Well, feel free to propose an improvement. Using the modules array
for recording this data seemed better to me at the time than having
a 2nd, almost redundant data object.

Jan


