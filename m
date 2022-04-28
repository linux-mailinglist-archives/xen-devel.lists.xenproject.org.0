Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0210C512CC8
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 09:27:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316028.534733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njyYe-0005KQ-JD; Thu, 28 Apr 2022 07:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316028.534733; Thu, 28 Apr 2022 07:27:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njyYe-0005I1-FK; Thu, 28 Apr 2022 07:27:24 +0000
Received: by outflank-mailman (input) for mailman id 316028;
 Thu, 28 Apr 2022 07:27:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h8bM=VG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njyYd-0005Ht-0c
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 07:27:23 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a445b5e3-c6c4-11ec-8fc3-03012f2f19d4;
 Thu, 28 Apr 2022 09:27:21 +0200 (CEST)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2053.outbound.protection.outlook.com [104.47.1.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-z0lRdeVXNk26zi8dbPq4VA-1; Thu, 28 Apr 2022 09:27:20 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM9PR04MB8636.eurprd04.prod.outlook.com (2603:10a6:20b:43f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Thu, 28 Apr
 2022 07:27:18 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Thu, 28 Apr 2022
 07:27:18 +0000
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
X-Inumbo-ID: a445b5e3-c6c4-11ec-8fc3-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651130841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v+2MRioiVUfFC6JaahT5pqXD/IdMyfdG3fLWbdwmFCw=;
	b=nbSMwNDzyolkADUVIu3Arc46PnjQkWmOtNaCm+9QrHgVA87r97+dYib0aUf4wwtFszh7n0
	YUa2TaZVYRDcuWdD0QlGg86ICFhW+YKiAImPLoiOWIp2icj0DZN1d4D6iT+rcQiLEYh6rz
	y2ya8D3f0KwlHWfYhb7GAdRQnLuFAdU=
X-MC-Unique: z0lRdeVXNk26zi8dbPq4VA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CMzw7vtvaotWaIwLikmDifKz63xK8l2raMmThnUd3j/G5SJw26qmDqJvggVBQqm7Rs2upfDEjroDwZHAS83/SSxdTGf0/zYKzV4+LOaOwU8yxEFuxvNzB5kearrRCSWzGNFD/EaW/J8UpZ0F6CJrPL19lQ7JNTZ892R0WzbALfExs0HwP8fj+8hD3FwD1cljzU9Czvr3m2XXHaBcB8MysutyOl2/uqbcSPKawEuFSPsIxZTIO1cYzbx8nYEij0ocvGkv2/xbT3xtsA5e8JN91k0TzxmqAK3L2WiovusdEEsRFabZ6YuDiugGw9qIizQwUp6JoDRMzPrly0HHbNsk2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nmlaLJ6caXKxLsGhAN3oS612Sc6Dfi4O4FgH/hA9zDI=;
 b=fpo8HdZxW5cYNeLK82X8WNcTLn9mOQcX0Eo/P9nORLGxaoFVY8uEVUsiwCjHbh3SV0F/WwXJLWu81wRi/9XMx57u+QgYu9RELLoxaWjO8KClyi2hqQx0uy23t/E/WGrMoiVR6lSSaSwPdjdbtOBergCYqhKNxeepkoLgBBvjBXENpRN0oH/ctYjTMVs+idB6bnL/aWUqCcWCv+nDZo5cZAbDMaDEo13/LBcRwVQVRpo34jP6k5gaA6oUdN998fZGX4zOrSijXsMhLYped1m5UFFA6xPeSS1hCAj9AD7tR9gtM8Dm9Aq0J42iJdGScuuFoA/cDsd9jAoH8iNkG4iovw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a95ab39e-f1a8-470c-735f-bf970a670b8a@suse.com>
Date: Thu, 28 Apr 2022 09:27:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 3/8] gnttab: Remove unused-but-set variable
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
CC: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <20220427094941.291554-1-michal.orzel@arm.com>
 <20220427094941.291554-4-michal.orzel@arm.com>
 <313fdb48-9164-3165-365b-5073b09e68da@suse.com>
 <590d34a8-744f-4170-74a6-1b02013488df@arm.com>
 <0c067fff-32a9-0d21-2410-611ec9a2b91c@citrix.com>
 <e59dfb31-e5dd-649b-d9f7-67bcc423ed80@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e59dfb31-e5dd-649b-d9f7-67bcc423ed80@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0150.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::16) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c546275-88b2-49cd-c31a-08da28e8867f
X-MS-TrafficTypeDiagnostic: AM9PR04MB8636:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB8636B472FBB4C657E05C3A12B3FD9@AM9PR04MB8636.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EkTfWrGR6AI6XbkKlv4E+ATCdLwBCMbS7ZmV7lHJrOYIR3aYGL1GgZlyJAWDGXRIZhAgM1HxHjIFE2XA6dnioov+XUvwo9TzGF3DerYS7+ARBAaTEqfEi15PDWgQ4YBfkVvS6sInvXlBU79Lco1BfwoSf9fDWhyBOPPpp2uMI6VvZpkq3J9Y1G1p+wJUPMwMW3OOOpeoqAOFLnNJ/jAofytii4Gj1Ylyz2/rr0SLqqhGNqSQAjB+iFOaw9lqbLgMz0xWZegxwKz+fK8hZoBWvjynpDdk7d9bvsoc/gq70q9YE57QfS2Eqvgd0ssrCVlNsBgK2uuzcLSwumgfDd9YdYy8iiD21JfUZ3fwAZwo3N91L0+NdwanxWyYfFpSRKdUWhllI0IW/gRj0w1pwNp/kKXwy9Qb6C2y3OWyloIqJdzoC87Qdf2cUhClogBR2VsHO/W66K0cOFIIvOJJG7l0zQRNwZs93WNK0eeSZWPxeriu2u6nvLym54OGUpwQeIuPYzl3MtlfHgyOrKPJfNv+hikI8z28MfBN4eovxHVqT+MIwI3hFuzxmCvTz0i9EMlF5JzJ/vGvX+GQAUi6FuyepR1EB27gla/6S7ogJSOXPqU9TdUKo8U+ElC1XfNGOKaZJ+Q0AT9zAWr+70B2F9sOzYax0pTuJKhm170mz6RE+aSI9x1esJjSSAZyFzbRCpZBxdscZdMeRkRPaGNU3hDu7prbMt8xncOWv53fEqyz/sXHdniF5ma3dzO+nc33lqAc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(6486002)(508600001)(86362001)(2616005)(26005)(6506007)(53546011)(6512007)(38100700002)(186003)(66476007)(316002)(2906002)(66946007)(36756003)(5660300002)(66556008)(8936002)(54906003)(31686004)(6916009)(4326008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fMVWxPZcUMz8c4WvpTjBqb73fbca80p0N/hdqt+BHZhbzkLTRU2MifarYRRr?=
 =?us-ascii?Q?QErRVinrk92b5tLSs9jnBwRoWsnGp187MpUY321CPrzwnv38FYhQanemD04u?=
 =?us-ascii?Q?hAXHpX14WJdQ7u2Q01CMxrUVeSkinwHfMsJZlxSroOnQdGjQzHF8n2YvD+cA?=
 =?us-ascii?Q?6IUbiAtWypcZ56+2Gk21UACPruCDE7TtGrs95TyNZiLu6ppl6jTs8NZhiMhD?=
 =?us-ascii?Q?zy68O27qDCkM9mBmCGZPJPHdPsT+LFS284oiGv4/u6G0Q8aolNqq7myZn8TZ?=
 =?us-ascii?Q?hjFYFmrEQFvI2fi3CqbvLySm9vgJD+5nfYDxFjGSY/qoQIG90DHeUSJD0ClQ?=
 =?us-ascii?Q?dTQ+YhtzGoiLBg2x3Xmia5h38CBStX8ekPOrh57OAmJyfdQx6phY8isp34az?=
 =?us-ascii?Q?2j6Yv3qjtO2EnKjXzljOGKbuEcNQgZ+EVEQlG0LDLHxAIwRxGawaBP8QfS34?=
 =?us-ascii?Q?IehiemUqRScc+4fqD9XeeCskIKHMp5SNE253xSe3N3uDXa0mnkqPuWyGOAJx?=
 =?us-ascii?Q?eAUCdMRYnBhql/uMZTNeRU2Xq/W72bVzCzhvAFR2L9sN+AFaPzCrRmgGeFT9?=
 =?us-ascii?Q?neTGaXd6YG722o7gSLoKNIX7aXmw46YcvgYJsfevzUyJw/hP+9y+kftXqJ2+?=
 =?us-ascii?Q?f1R1sqa3Em5JcjUtjlZ5oHaMkFVLWTB9zp768WTd883e8DJ7YOd19qy1jUh6?=
 =?us-ascii?Q?rLI6hUa+YXYWHPpUav2FiK5hfVmYTUA/mUZHHRYMQ0ajjfmjgT10X/AhqDZl?=
 =?us-ascii?Q?tzad5AAzw0TwtcCSF8vD1BxTBuEeLTgTcE5YQS/nfekHn//PnCPZ7+ZPVMc6?=
 =?us-ascii?Q?jNWEu4Ar6U4Mg4WaJB4P5U0hp6BEzkZlR9dC+WjiX5EwXeblYhjWDB1rDaEu?=
 =?us-ascii?Q?IoSg9bmQHttLNATFgP5OjbCEYpcLhYyq0YJGJqKyUTIRwYOaMdaa7WebNDAC?=
 =?us-ascii?Q?WiVUzYQm3ZcqFaw5jcZYzBqjUf1sW0ocNAVnWz3YtNywEErHkGzNhau0AWZO?=
 =?us-ascii?Q?MdqM+jwP3luqpKnAQb3wh/gg1/PpXZQJsBaLI+4fUYGGRPbErBygaRgvF+vH?=
 =?us-ascii?Q?9cyanwnLZezNUj8W6WKx3xLu1RcQ+B53Q+UP/LRYDs5C9UbQfHg0FtawEdKQ?=
 =?us-ascii?Q?DgD6kB9sid2wLJtOaeq0SV+4nT6Nze9pqlIaH4pWg2u6WaDcso0hZkoS2WQE?=
 =?us-ascii?Q?gvBp9Q9/ZmMyIBx7mjJQbWgfVVoxzBePI+puWd6JzPa3vsNvoQo4slm531zx?=
 =?us-ascii?Q?PR8OwlNjd/IxcttbF//2UlM9+iFBB+lkp9+OOQMcv5KwWt+zeOokGWAvZCzc?=
 =?us-ascii?Q?R8j5xMTgVWoYe5zrfeqSP3fSp40sE2/UucfUFdjtScGGjvB7D/aHCCtv0qRo?=
 =?us-ascii?Q?eijHrwy12oJyucMZ3ZE9HyUL5Y9WzBR28V6XZLX1TYxqKmLzhjCz7E9P+6x4?=
 =?us-ascii?Q?et+571WjV3wHbsW3BBqRSvEE4EopS2CWAw+yTVIW1CeBcneZgvW8ThtuuFqT?=
 =?us-ascii?Q?waTeuvY5yqb2z5e9xDE9xv+P6RUj2c/NBP4sLD0dk74kbOCOM4damnVsogC2?=
 =?us-ascii?Q?5Bv/Ppd126qT3esTyDn20J2Yx12w5/4we3N4c/PXhb0aGvJEZySS6grZafng?=
 =?us-ascii?Q?Chn3G0MbY/fsLrW8xb4IOGP2iG9w/ryRERLPBloYAXMCQx/GKvgzx74UkA+h?=
 =?us-ascii?Q?rmm+7VQTd0vH4NZ+Yp/ltFwc4kZc+NttKjW4lXD5XV3txgPzvCm1IDYUgsOc?=
 =?us-ascii?Q?jvsl3qK3DA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c546275-88b2-49cd-c31a-08da28e8867f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 07:27:18.1796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5HCzRu/y1Ai4Gcf0mpdNsDxr2PsFXhGpu5zamSr313ip1lSX/SuZUUZ6ID3DKEhNgmV6tUF+AvM3ma7Y1NqptA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8636

On 28.04.2022 09:16, Michal Orzel wrote:
> Hi Andrew, Jan
>=20
> On 27.04.2022 14:33, Andrew Cooper wrote:
>> On 27/04/2022 12:06, Michal Orzel wrote:
>>> Hi Jan,
>>>
>>> On 27.04.2022 11:59, Jan Beulich wrote:
>>>> On 27.04.2022 11:49, Michal Orzel wrote:
>>>>> Function unmap_common_complete defines and sets a variable ld that is
>>>>> later on passed to a macro gnttab_host_mapping_get_page_type. On arm
>>>>> this macro does not make use of any arguments causing a compiler to
>>>>> warn about unused-but-set variable (when -Wunused-but-set-variable is
>>>>> enabled). Fix this by removing ld and directly passing current->domai=
n
>>>>> to gnttab_host_mapping_get_page_type.
>>>> I think we want to retain the ld / rd notation. Therefore I think it's
>>>> rather the Arm macro which wants adjusting to not leave this argument
>>>> unused.
>>>>
>>> I would agree provided that the ld variable was used in more than one p=
lace.
>>> As it is not, it does not seem very beneficial to keep a variable that =
is used
>>> just in one place and stores the macro value.
>>>
>>> When it comes to gnttab_host_mapping_get_page_type macro, on Arm it is =
defined as (0)
>>> so modifying it seems to be a quite big overhead.
>>
>> diff --git a/xen/arch/arm/include/asm/grant_table.h
>> b/xen/arch/arm/include/asm/grant_table.h
>> index d31a4d6805d6..9f68c2a37eb6 100644
>> --- a/xen/arch/arm/include/asm/grant_table.h
>> +++ b/xen/arch/arm/include/asm/grant_table.h
>> @@ -31,10 +31,10 @@ static inline void gnttab_mark_dirty(struct domain
>> *d, mfn_t mfn)
>> =C2=A0
>> =C2=A0int create_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int flags, unsigned int
>> cache_flags);
>> -#define gnttab_host_mapping_get_page_type(ro, ld, rd) (0)
>> +#define gnttab_host_mapping_get_page_type(ro, ld, rd) (ro, ld, rd, 0)
>> =C2=A0int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long new_gpaddr, unsigned =
int
>> flags);
>> -#define gnttab_release_host_mappings(domain) 1
>> +#define gnttab_release_host_mappings(domain) (domain, 1)
>> =C2=A0
>> =C2=A0/*
>> =C2=A0 * The region used by Xen on the memory will never be mapped in DO=
M0
>>
>> It's about parameter evaluation, not about adding extra code when compil=
ed.
>>
>=20
> Unfortunately, solution presented by Andrew does not work.
> We will get the following error due to -Werror=3Dunused-value:
> "left-hand operand of comma expression has no effect"

Perhaps

#define gnttab_host_mapping_get_page_type(ro, ld, rd) \
    ((void)(ro), (void)(ld), (void)(rd), 0)

?

Jan


