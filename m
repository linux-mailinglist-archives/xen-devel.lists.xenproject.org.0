Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB22F46B82B
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 10:56:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240794.417519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muXCG-0001B0-S1; Tue, 07 Dec 2021 09:55:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240794.417519; Tue, 07 Dec 2021 09:55:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muXCG-000196-Ne; Tue, 07 Dec 2021 09:55:40 +0000
Received: by outflank-mailman (input) for mailman id 240794;
 Tue, 07 Dec 2021 09:55:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J7u3=QY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muXCF-000190-6D
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 09:55:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3da8ebc-5743-11ec-9d12-4777fae47e2b;
 Tue, 07 Dec 2021 10:55:37 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-HdPu2g8gOg6Im6CSo5W4sg-1; Tue, 07 Dec 2021 10:55:35 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5599.eurprd04.prod.outlook.com (2603:10a6:803:de::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Tue, 7 Dec
 2021 09:55:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.023; Tue, 7 Dec 2021
 09:55:34 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0033.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Tue, 7 Dec 2021 09:55:34 +0000
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
X-Inumbo-ID: d3da8ebc-5743-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638870936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pj/lEd0HsPGhvb13IAIKSMVJynSm0L/NlAWjwyy29PE=;
	b=fsLs9PswpY5AwJK8rOMKBk5FwEHOCwY6aHWCiLEOGU5rdzfSz9Bqui5BVDfZ9Hfilq6r0E
	cGb+0pjMRMqtvX64QyCJPB/RzyBd+xG5d0SV6XhHcOfYtBGyJjYKaWS5RT+6YdODn2emVj
	/oytTOcNHmwmj3wJORWmPnGl9kgyWSE=
X-MC-Unique: HdPu2g8gOg6Im6CSo5W4sg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fs9g4by6A//JyJcsr6/Eg+zfiojOWl51YOB/cVSKhOZlu1MxdIG2UGhaaXfRj6h8CxkR+3RNxplMPExlXIY0mkkDoY6pkO+v2PoZwK8U4hcKBEdz0s3Pp4Cgd2Ze3uFKY0rwaCL01twLQeqWwF4JyzTP1Sy8olSXJgfMFerbLYwxfQKcxxJQLSv9GmhemDmgbwlG+E5DDyE0lhGNzIDWEJMimKUARp6az8BTf+9qgGon/RUtmM8fLBHl9ZyrTOMhEjvU38fEq+46B+l5QaTdHijiS9+iQOdFZn1uR8++dgd5ZnfccVZdKayF2gQ0mpmmcnBnv4p/5srQTV7tDjkd7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0KlHYmbH61dD+K/LUDBrR1FbJ+1p6kbQA6hhQnRTe8s=;
 b=i5aQ82rsOy0wlaP3UEdfmoLwg3W/p8ClqL3ku62AVS2YmhGhGNOhrxFbOEpqiTGm2uv9fNLDy1/uDOehNy383qN1fOlqnXjaUpwm5dj0kE2ZTaSwW7le4Cui854N1kGLzC+NqrDW41SSTv86+PzwOMnsSVULG9fj7s4h2cPswmSHRY5rHmhSlWof2qko2ff1jLXOVhPmvGdS6/5Klcg1igpzO+9trTpv1QsiQSEDuzM+2LyF3AA2xj1EEIMYZVuc6QKgWPUHOfMwkXUA6/CmsjJc6ZYsxPG7+Wbta6ifDVML56MgGfNMhwQwZlTKbAE/G90INa/bPRq9T1goPrlCag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <086feb9a-7d6b-3797-3643-1b4474e4a420@suse.com>
Date: Tue, 7 Dec 2021 10:55:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] xen/arm64: Zero the top 32 bits of gp registers on
 entry...
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
CC: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <20211206142032.27536-1-michal.orzel@arm.com>
 <f3573439-4893-440f-54e1-fdeba3eb4508@xen.org>
 <dc114877-b9da-7a5b-260d-b9438cddd777@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <dc114877-b9da-7a5b-260d-b9438cddd777@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d13bca8e-fe16-449c-5103-08d9b967b66f
X-MS-TrafficTypeDiagnostic: VI1PR04MB5599:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB55994B528B7E83873F3331E9B36E9@VI1PR04MB5599.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HDI3WA9ezf+cHfYOFBl8SgFEbq0Ab2nxNqDyDOOdufkvKxaDWsqH4ZfYIv6ZEhbLezMOa+nTt9yUAJTG8nUQp3WM0cNtDOw/s6GBIMLRRe9+jvAqxc6hS+N0R3TRTAvw7tY0xBRxKG+3yBA6oLHS3G0N37gDjQUEq5rw8v49cL9bu1Ys5iLgZDAVxUaLgatxrxIt4g7dzXdHg0kg4SGHIqIN7sYjDhuiWQD9KezujtkjIdwl1SoXJ3X/K+WC2P8WJ1cREP85wF+krAuEG5/ebnNFd2xY8u0q/x2IF6wbhIKsYKomly7gT/JiZ7dAXwtdB9XWho+8vbJEDFeAPBvQKHXT+OpX6SvlgyszDp0ttNxoqXzDxHsYL2p5MeyqnjAUAChvg06me7sRGxBdVgaHLvvcAcc5uSxKguhG+LBoE/Q4RIN8MAlVRre6m6u69lA4smYjWBPVmqi12Gy083wMtwUv+15/sxS3Dez8YLQkrBZVSHtXyMDqyL8FNWOr4ylD99ETHhTHI5S1NyEoeLzK6eTlnJaZVGsMBzo9mubNiNrYtykHol7hza7Pkz/7pgN/DI0Q3+x9Ha3uELY4OGrVLFVSKAcRqjFlKVWHH8Nrqw2GlnyPQUKHpEmdzngaexIcdDnO6uW/icE19OVwLpDYUZrzbSnd4o17yM4RQw/cVKdO/cgvit6bHaSHBhGzy40vhU/3ZTdoJcMsPEPUBwFfPrdUvwe+eOIwOwr+/YvVo5U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(4326008)(508600001)(6916009)(66556008)(66476007)(66946007)(26005)(8676002)(86362001)(5660300002)(186003)(16576012)(2906002)(31686004)(316002)(83380400001)(38100700002)(6486002)(2616005)(36756003)(956004)(54906003)(53546011)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cwAwcfwiGt6Z09OtGa2Rjd0LtGZCnBUHqLloyAOfk14tdXdhp7cp8iWIuLfL?=
 =?us-ascii?Q?oME67i/XfGAZQU3Up6De/M3MqsRYLYtb7X25/XbS0e5wGUn7EhOy/jh1/fkn?=
 =?us-ascii?Q?fbm/VAyWR/ADGyd4Utfyd+BGXZmqE+X51OWQtXIAs1b7MffXG9TgCmGrJTj1?=
 =?us-ascii?Q?VLDoBJwWWbbpUdSPBrIClIfUx6O/9lBBw3xG2J6qHN3zIji5xbLE3kkvb9Dq?=
 =?us-ascii?Q?FJ3t82mickjZdZqxwcLqfmgPlYWZRBJoOQVxvj8z7aYrV4Lb+En3IxQqmXd2?=
 =?us-ascii?Q?mg9tomCRe6/YkuDY0U2fh2rPXIjqILx4K0tXLtO/Y0qRMR+BusKdsmyvIdZ1?=
 =?us-ascii?Q?qGJl9yoUfsg40KlAsXiZXiB7MFQOjGyNGN7gkPmvWTApgJsCdzD7W6JaBH03?=
 =?us-ascii?Q?EDFOydKOvZ0a88A8BZg1zfXrGOAt5K5COUi2+D3Zslb00ljhbokmsDn+CINb?=
 =?us-ascii?Q?cnwQxMnv2DoI+GwwkD/yfRwg9XmM5a7AdRxwwOE4dUrpAfefvbYU9K4B2y6M?=
 =?us-ascii?Q?2bD+v984Nwe8SPBvsbr2tmmMBKaT4hCIeCC4PJY8aThHf3Z9w4oB4UTWFzSZ?=
 =?us-ascii?Q?o3rvFkM7aKOtWu0kcN5U3QhkWoLH3hM9xanTHS2Zb2Bnu/0xUwP5hZZD9aVk?=
 =?us-ascii?Q?IzfJjiOSY4I5t2MPZ9M1WlEYpXAWIDL6RvVXnZtMlLEHXkfvmA6umcYy5ESB?=
 =?us-ascii?Q?kzCPFJ7uVwD/1K+BXmP715NE8pvqhNkBkzLNuGGmByO8q9ZQj5jCHUgb+3d6?=
 =?us-ascii?Q?ici3bl1RUJBfWcUVMImUSQgXY2oDJqvZHnrt93iydTjN3y7uE2SYkMRf8zYa?=
 =?us-ascii?Q?O7nN3vNpGXbWy4np5a4f2/i/yxOabnqQSu0Fe03h0UDToEZrdAGdDp/kHyS5?=
 =?us-ascii?Q?+Su3xyRQHilYRBxL6bSL2I8hGWyq30kWOHR40SpuxPGhA4w3IyJChyklAyfM?=
 =?us-ascii?Q?MvMj+M6pY0pdbHiCf+4W6/UHJtI3hioQ9AiYvMmPOpMSyEHFprUvdjPrIyBR?=
 =?us-ascii?Q?zhG8YqRnYCxsz/QZf4RqP5McQHlJnXGQQNGC3a0eNSWQg/uU1Xo3BuS6eUqG?=
 =?us-ascii?Q?4/iPviGQ8KC9QaBCtgLf282RFy8iV0r1YmUDM0NeINiD5V/XTVigP93FMkhc?=
 =?us-ascii?Q?SRrcdrd3MDqTij6fV+YLjkPguPfxeuTTr6+wbwJF73kDhuZ+Q2ANc4ORLGJq?=
 =?us-ascii?Q?EpMjEZXStE7YN0TTEYE6IL2DxnIHHaWXbH7HYOv61WcPNX9rK+cGHMlbFrV4?=
 =?us-ascii?Q?uOfmiBeURPLsmrzW052PtvwOGw3yTm8WbDnYgXDeBGq9HKi3cRMDDEt3Wi6l?=
 =?us-ascii?Q?c1l4NL7KvqLo4WoSV9pW+5ZJ0FDhoJMcQCebP0J91iDQxjjepd6mAA820VqX?=
 =?us-ascii?Q?mXCJDuRcjxWyu1AUTwvqxATQbwDXAHeXkHJrf0jod44gR7gQOgM/eQGTQBKK?=
 =?us-ascii?Q?aVSIJXfF21fkEAc38dX19TZ2iLncuGstm1j3A8N4FogmWs8j1xw2vn7+Q6x4?=
 =?us-ascii?Q?7diB1t1Z72LmAqTs3uUsTdxolkRVV05v+FGP9BSgf7ogfSoz40uO4GboFSE8?=
 =?us-ascii?Q?QBvHVPInzI5T1yIcP6TG8KTK5GvQlt3OY6zgrd7PRfApb5gfX45XekuPVOkZ?=
 =?us-ascii?Q?qqftl7hA8qMJ5VAhB7YkOTo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d13bca8e-fe16-449c-5103-08d9b967b66f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 09:55:34.5003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MgQz/pHFGeUVgap+IlAY66ZZjwc2+KjH5S3PsM81vUTfp06PQWPtvojHrKsw467K3WPty2E/WMu1mLFhqbAgoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5599

On 07.12.2021 09:37, Michal Orzel wrote:
> On 06.12.2021 16:29, Julien Grall wrote:
>> On 06/12/2021 14:20, Michal Orzel wrote:
>>> to hypervisor when switching to AArch32 state.
>>>
> I will change to "from AArch32 state".
>>> According to section D1.20.2 of Arm Arm(DDI 0487A.j):
>>> "If the general-purpose register was accessible from AArch32 state the
>>> upper 32 bits either become zero, or hold the value that the same
>>> architectural register held before any AArch32 execution.
>>> The choice between these two options is IMPLEMENTATIONDEFINED"
>>
>> Typo: Missing space between IMPLEMENTATION and DEFINED.
>>
> Ok.
>>>
>>> Currently Xen does not ensure that the top 32 bits are zeroed and this
>>> needs to be fixed.
>>
>> Can you outline why this is a problem and why we need to protect? IIRC, =
the main concern is Xen may misinterpret what the guest requested but we ar=
e not concerned about Xen using wrong value.
>>
> I would say:
> "
> The reason why this is a problem is that there are places in Xen where we=
 assume that top 32bits are zero for AArch32 guests.
> If they are not, this can lead to misinterpretation of Xen regarding what=
 the guest requested.
> For example hypercalls returning an error encoded in a signed long like d=
o_sched_op, do_hmv_op, do_memory_op would return -ENOSYS
> if the command passed as the first argument was clobbered,
> "
>>>
>>> Fix this bug by zeroing the upper 32 bits of these registers on an
>>> entry to hypervisor when switching to AArch32 state.
>>>
>>> Set default value of parameter compat of macro entry to 0 (AArch64 mode
>>> as we are on 64-bit hypervisor) to avoid checking if parameter is blank
>>> when not passed.
>>
>> Which error do you see otherwise? Is it a compilation error?
>>
> Yes, this is a compilation error. The errors appear at each line when "en=
try" is called without passing value for "compat".
> So basically in all the places where entry is called with hyp=3D1.
> When taking the current patch and removing default value for compat you w=
ill get:
> ```
> entry.S:254: Error: ".endif" without ".if"
> entry.S:258: Error: symbol `.if' is already defined
> entry.S:258: Error: ".endif" without ".if"
> entry.S:262: Error: symbol `.if' is already defined
> entry.S:262: Error: ".endif" without ".if"
> entry.S:266: Error: symbol `.if' is already defined
> entry.S:266: Error: ".endif" without ".if"
> entry.S:278: Error: symbol `.if' is already defined
> entry.S:278: Error: ".endif" without ".if"
> entry.S:292: Error: symbol `.if' is already defined
> entry.S:292: Error: ".endif" without ".if"
> entry.S:317: Error: symbol `.if' is already defined
> entry.S:317: Error: ".endif" without ".if"
> ```

An alternative might be to use

.if 0\compat

>>> --- a/xen/arch/arm/arm64/entry.S
>>> +++ b/xen/arch/arm/arm64/entry.S
>>> @@ -109,8 +109,16 @@
>>> =C2=A0=C2=A0 * If 0, we rely on the on x0/x1 to have been saved at the =
correct
>>> =C2=A0=C2=A0 * position on the stack before.
>>> =C2=A0=C2=A0 */
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .macro=C2=A0 entry, hyp, co=
mpat, save_x0_x1=3D1
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .macro=C2=A0 entry, hyp, co=
mpat=3D0, save_x0_x1=3D1
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sub=C2=A0=C2=A0=
=C2=A0=C2=A0 sp, sp, #(UREGS_SPSR_el1 - UREGS_LR) /* CPSR, PC, SP, LR */
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Zero the upper 32 bits o=
f the registers when switching to AArch32 */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .if \compat =3D=3D 1=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 /* AArch32 mode */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .irp nr,0,1,2,3,4,5,6,7,8,9=
,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mov w\nr, w\nr
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .endr
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .endif
>>
>> So Jan mentioned, the x0/x1 may have already been saved. So you may need=
 to fetch them from the stack and then clobber the top 32-bit.
>>
> So I would do the following:
> -fetch x0/x1 from the stack
> -clobber them
> -store them again on the stack
>=20
> /*
>  * Zero the upper 32 bits of the gp registers when switching
>  * from AArch32.
>  */
> .if \compat =3D=3D 1      /* AArch32 mode */
>=20
> /* x0/x1 have already been saved so fetch them to zero top 32 bits */
> .if \save_x0_x1 =3D=3D 0
> ldp     x0, x1, [sp], #(UREGS_kernel_sizeof - UREGS_X0)
> .endif
>=20
> .irp nr,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,=
25,26,27,28,29
> mov w\nr, w\nr
> .endr
>=20
> .if \save_x0_x1 =3D=3D 0
> stp     x0, x1, [sp, #-(UREGS_kernel_sizeof - UREGS_X0)]
> .endif
>=20
> .endif

Wouldn't it be more efficient to store 32 bits of zero each into the
high halves of the respective stack slots? Afaict same code size, but
less memory / cache traffic. Plus it would avoid the latent issue of
a user of the macro actually expecting the two registers to retain
their values across the macro invocation.

I'm also puzzled by the two different memory addressing forms, but I
can easily see that I may be lacking enough Arm knowledge there.

Jan


