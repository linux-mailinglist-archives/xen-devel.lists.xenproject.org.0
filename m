Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1ACD4D1751
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 13:34:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286796.486441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRZ2b-00089q-By; Tue, 08 Mar 2022 12:34:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286796.486441; Tue, 08 Mar 2022 12:34:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRZ2b-00087O-8r; Tue, 08 Mar 2022 12:34:13 +0000
Received: by outflank-mailman (input) for mailman id 286796;
 Tue, 08 Mar 2022 12:34:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KW+D=TT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRZ2Z-0007wf-Tm
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 12:34:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e0ded31-9edc-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 13:34:11 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-SCFzAxmdMomHpzi13Oxxcg-1; Tue, 08 Mar 2022 13:34:09 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB8317.eurprd04.prod.outlook.com (2603:10a6:102:1ce::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 12:34:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 12:34:08 +0000
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
X-Inumbo-ID: 0e0ded31-9edc-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646742850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EIKALJnr7hAyQiWVu0WlUPWT3Off1RQJ//kUSt+Jco0=;
	b=THvyhOtZHrqLpVdDaHAyufYd2CS3UKEITOJ7u/AKREGgUsQFIFATQBX1evKKzPCTjWSRZf
	YLjuhaoS/2j7DXXKgnq8lH0dIMQ4IW+Z4lNF4Z2T6VKil8N9uMkqoslH8omKz5jb25DxiZ
	NubqXSomI1PwcHz4aQLMiZ0bhmTVPUA=
X-MC-Unique: SCFzAxmdMomHpzi13Oxxcg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FB1K6P8uOIl+O+wBO3YZQ3cPXlkCr8qeJ4p60jd9DQfG0CV1s4XopbabWjMjwBh2WfomqubNnOxSwqdN49RHm6d8aWV3PkOmbxndmNZgqOWeP7SUW8ZfUr4i0jvYqHOcvQfsqtDqFP+4GkrEwne8/3BYtSp9WCm3nlLduthnf3lt2Ig17MwxPCUOuWqDVQeIh06pzHCYj4CKIO1MG73jWiy2AphbZLYkjvvoZcq27eMT8m/JW8ip68fNfADV4ZXbP8vMkYm05lQCrdvN0fwwFIdoBnxjlmyyqBGW8Ao83GPtLJHA9osnJGrqeVwAcCp0WVXa7RzaCdOB0SuIRK6wcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhJaR9rb0xobUbZw7BfM/XRM8H/6pBx/5GQB1oHhRlc=;
 b=he4bdXOWuJT5WhZQcxsxvp3eYMo3Y+tspYAJWtNNCJPxODFL6CAJQQg4Yi7JjDoi6NVcAalpBLJgMI/RtEcZqpKjpnrGgRumS3Vh7lHcItM5vVTUZnV8edo5j21DRwL6DLxBeulu2w8m9hH8Wy3EfvzGO+BZQzJX1nq2n3C1AWh2GarXf6RwLoXP0fHt9LSMDNxNG2gDqpCqV1FO6u1Zu5RFyptldQRvsYI2cQYw3M3D8lxiD8ERz2CFSVgqQSkrxxDHgLDkI3sMb4wcQhUpuw2eT+T+H7FCvxW3gct/GNuFCOXp5ZO+H/t7y+/Du/NTfyJhRShP7fBprtJR47RQnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <90124755-cd69-6352-e75f-80a1e53c93e8@suse.com>
Date: Tue, 8 Mar 2022 13:34:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2] x86/build: use --orphan-handling linker option if
 available
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <289684f6-fa73-bf02-137c-680ad8891640@suse.com>
 <YicsK8xqdcGZYaIn@Air-de-Roger>
 <0cde8972-b357-e2c0-ccc4-a0720cfb3501@suse.com>
 <YidH9La8I4X+M2S5@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YidH9La8I4X+M2S5@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0602CA0017.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87fb6ee8-b606-49e6-cb19-08da00fff082
X-MS-TrafficTypeDiagnostic: PAXPR04MB8317:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB83172788F5F87E3566F59FA7B3099@PAXPR04MB8317.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nGI+2e8FcKtWuHgikxT0jGUv/Siihn9KqRZEPcs/m8l9iQsdPPIZwf8JoRrLqQYUjxZGqcC18soxRKTiCDTZGruektTcQSqZuelCw5wMWx96T8M6EHzC/2ZVdv7qizox6bWyEddGLG6ngSlUSpdsGvepE3Wg8uNa1O6JLk+APsbZjMRFfuiQTROp7n08im3fkCZIVY0gEEReom7Fr/m9GsbUPKfpsjOcdkpCOcAL7E2WFK2pcB9wp+4xcy/54E1rZrLWTeHDSKHxD+d6VxByu4i0u/PUPLsruKsIsLAgAaepWVURE5xJUxOYG5MrKca/5JLmWz0deulu6RYm7oH3aJP/JKbAC5P76DH3vH0kr9Izt5Rcfdk/+MbLcjpggRoY0plpJkzxvn4uPgBFNCbfnfxqhq2mzMWjNo8aRcEs0OSEXoZut3cldtuysH0D2AHd+oewONs3Sfe6DalbwazIv/KlVtzXAuZ8iuYiiqdkE7ORZ7mTrd5CHhWrLH7GwUrgtTVaRaUJtlc7KSiFJAMl5ig0rnP95T6RCArW0vPdVfP5nGPyLi09Ed4Kv/FZOsb+JCEXrDSZ+0rRY4ycPsM8pp3Ccn5afdFY7WhHEmE/frB4vf447z4y2UVg0zrBOMOFaOnRLmwDyahXC64hdrxtOvI6eY7h3qwr5H5F7X8QQDQcWX0t/mjDbsBC5TkrNa1Y8nJokKeUwt/yau3oex7sRXJts9dks745x1EZvZRcOrU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(53546011)(6916009)(6512007)(6506007)(2906002)(4326008)(66556008)(66946007)(8936002)(66476007)(8676002)(5660300002)(86362001)(31686004)(38100700002)(54906003)(316002)(31696002)(6486002)(83380400001)(186003)(26005)(2616005)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZBsuspbgb2pWoaC71zABHq/7bIuiovRme9E1632T4ZYjv2U0P/Pe/LqOhQXo?=
 =?us-ascii?Q?44z2Rcxc4y7GyobV90NlzNzb2+gpiapSbHjbaH6pKHe1MYlg9rMKto+49cGF?=
 =?us-ascii?Q?3KA+X/asSxHxhuGdCfoiiePGo7/ThBh6RNg9QeIOYc/rTSZ4rVLXhcy4bA9w?=
 =?us-ascii?Q?M6AZRwJMhiaM80EG/0adHeXBg238JlK0TYrVS0EbNgd3kXxWjAqhoKrr1Rpg?=
 =?us-ascii?Q?TTu9KoDMPy04PwzG7/wIGp+Nc38j/AH2uqec1DQvaAOILl/d9uFjGimyO5OF?=
 =?us-ascii?Q?yHhHOx6eXmqe5ua7eZ4T7S6UuXANuAh2yzEUyyvIA3sjGWwQdOUI1EJ4/7Gn?=
 =?us-ascii?Q?LeqJ0MSNMzVOxn1hwnu/Gx9MxEBRe5kyIEHCVSzLd4cHrRxLtDwz9krQayEO?=
 =?us-ascii?Q?SZ7pD6zfpoCGrCgv+UAloqPwxC2RnPMce10IyI/xKnZ6HaQ/nxLj3BbZuNy2?=
 =?us-ascii?Q?Bt0pE2ipW1d5pMNTDiu7jkWaVON/HXeH04kUZzO+5uiuawChf7b3cyJ58lYi?=
 =?us-ascii?Q?RG/l9t3K8xYz/WtFruhXakl6KhB0bYob7HceE4/KvgbTyc5E679Mu638atN0?=
 =?us-ascii?Q?4MUDp/zFI5DOHboStf0uCqu6KWVNUGqozwhIQVBaQSxJQIzmaasOvO9/+a05?=
 =?us-ascii?Q?iJc79lqzTTka28/JkAUP6qTog4EF+d+AJaEaWk7kw25YlqV7cMOncm4gLyGD?=
 =?us-ascii?Q?987qR2a25ELbMFFUkv6oUrnDrAp8YWMvpeqBrNC1WglP27pN2LMNXP4M3DT4?=
 =?us-ascii?Q?2r+Uk1lqyJ52aBLvzwUqQEOgYCCtOHS4Z9dl3gTP3h/KGJ2rmWb1yfL50kR3?=
 =?us-ascii?Q?jKd8ls3MHi3IlcauOU+WmRpvAqtlAXs0tqttKMA9T0DSOsmQtY55a/2QYLIZ?=
 =?us-ascii?Q?I5/aXG3nHkjTM7pqhsPG9oU/8dtvu2lH42pibLh6iNH8NJOUEb0ALcV9brFL?=
 =?us-ascii?Q?DllWodecEJHFlcqcI6B0xze/nBvno1X2wY8L1T+RTOnY7fxP6iJoWN6qXGTx?=
 =?us-ascii?Q?gcpExLl34RF8MyeEQz7XAn4vrtqVCTd3xRlFz5echweHNcuff93VrLs/bIOX?=
 =?us-ascii?Q?XcS6cEkUL9qNXPrKq9Io4TT9iKVf8JRCqV8xI8xcYKtYybyc8PU5OK6dNi4T?=
 =?us-ascii?Q?US64iW4LcuONteSwXZ6iFJRdCKBd4RoeDw0LM3nkmZhE+0hN5pOD0Cy0KCWy?=
 =?us-ascii?Q?kgSpPVVv+CQJwH+yvhS204bkREcdb022xzQGlePGYrIk8gMge3NrgOVpFlor?=
 =?us-ascii?Q?DrUmjv8o6BnjYFTo8cTeGnltNuGqGyTiz3zNpbbICKrdgsGtotCcTVtddJC4?=
 =?us-ascii?Q?yKkBFNDYD6/y9qwl8rWg6OPPOaFfKuupM+nxQALQUwMvmCiVTZFg90NNdntU?=
 =?us-ascii?Q?2ixwiJz6Bi0Gtu3/ZlssCI1U0lx2mPMs8Tq9nlHE9+utfQkUOnuimixJ6gjO?=
 =?us-ascii?Q?ey2ks3A5LKsvjowe+Ljsq63hJeCSRwkTWBtexBoSEaIZUOFq2pBwbZ4ybEuB?=
 =?us-ascii?Q?sEqo+2INY4Mc5nbobkVIzz4jNPxCc6cUpDWYo12OjTsG8YrOg8Fnc+Cg6d+Q?=
 =?us-ascii?Q?kvu4nMLXDjrFG7vSUTWOhSLQUBJiHJoTRLheSHjmsx/A569F8xlWzp5bjAWZ?=
 =?us-ascii?Q?98wx6uht/coXlXi9iSUxCy0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87fb6ee8-b606-49e6-cb19-08da00fff082
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 12:34:07.9516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 07QX0SckwmXZ8ZE0+vNqekgXSZzDKpagFjefQo6sQG1JAKaDDVkweOh00F4URFcaMvhTKXhLl6GA3dnY8bgYsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8317

On 08.03.2022 13:11, Roger Pau Monn=C3=A9 wrote:
> On Tue, Mar 08, 2022 at 12:15:04PM +0100, Jan Beulich wrote:
>> On 08.03.2022 11:12, Roger Pau Monn=C3=A9 wrote:
>>> On Mon, Mar 07, 2022 at 02:53:32PM +0100, Jan Beulich wrote:
>>>> @@ -179,6 +188,13 @@ SECTIONS
>>>>  #endif
>>>>  #endif
>>>> =20
>>>> +#ifndef EFI
>>>> +  /* Retain these just for the purpose of possible analysis tools. */
>>>> +  DECL_SECTION(.note) {
>>>> +       *(.note.*)
>>>> +  } PHDR(note) PHDR(text)
>>>
>>> Wouldn't it be enough to place it in the note program header?
>>>
>>> The buildid note is already placed in .rodata, so any remaining notes
>>> don't need to be in a LOAD section?
>>
>> All the notes will be covered by the NOTE phdr. I had this much later
>> in the script originally, but then the NOTE phdr covered large parts of
>> .init.*. Clearly that yields invalid notes, which analysis (or simple
>> dumping) tools wouldn't be happy about. We might be able to add 2nd
>> NOTE phdr, but mkelf32 assumes exactly 2 phdrs if it finds more than
>> one, so changes there would likely be needed then (which I'd like to
>> avoid for the moment). I'm also not sure in how far tools can be
>> expected to look for multiple NOTE phdrs ...
>=20
> But if we are adding a .note section now we might as well merge it
> with .note.gnu.build-id:
>=20
>   DECL_SECTION(.note) {
>        __note_gnu_build_id_start =3D .;
>        *(.note.gnu.build-id)
>        __note_gnu_build_id_end =3D .;
>        *(.note.*)
>   } PHDR(note) PHDR(text)
>=20
> And drop the .note.Xen section?

In an ideal world we likely could, yes. But do we know for sure that
nothing recognizes the Xen notes by section name? .note.gnu.build-id
cannot be folded in any event - see the rule for generating note.o,
to be used by xen.efi linking in certain cases.

>>>> +#endif
>>>> +
>>>>    _erodata =3D .;
>>>> =20
>>>>    . =3D ALIGN(SECTION_ALIGN);
>>>> @@ -266,6 +282,32 @@ SECTIONS
>>>>         __ctors_end =3D .;
>>>>    } PHDR(text)
>>>> =20
>>>> +#ifndef EFI
>>>> +  /*
>>>> +   * With --orphan-sections=3Dwarn (or =3Derror) we need to handle ce=
rtain linker
>>>> +   * generated sections. These are all expected to be empty; respecti=
ve
>>>> +   * ASSERT()s can be found towards the end of this file.
>>>> +   */
>>>> +  DECL_SECTION(.got) {
>>>> +       *(.got)
>>>> +  } PHDR(text)
>>>> +  DECL_SECTION(.got.plt) {
>>>> +       *(.got.plt)
>>>> +  } PHDR(text)
>>>> +  DECL_SECTION(.igot.plt) {
>>>> +       *(.igot.plt)
>>>> +  } PHDR(text)
>>>> +  DECL_SECTION(.iplt) {
>>>> +       *(.iplt)
>>>> +  } PHDR(text)
>>>> +  DECL_SECTION(.plt) {
>>>> +       *(.plt)
>>>> +  } PHDR(text)
>>>> +  DECL_SECTION(.rela) {
>>>> +       *(.rela.*)
>>>> +  } PHDR(text)
>>>
>>> Why do you need to explicitly place those in the text program header?
>>
>> I guess that's largely for consistency with all other directives. With t=
he
>> assertions that these need to be empty, we might get away without, as lo=
ng
>> as no linker would decide to set up another zero-size phdr for them.
>=20
> We already set the debug sections to not be part of any program header
> and seem to get away with it. I'm not sure how different the sections
> handled below would be, linkers might indeed want to place them
> regardless?

Simply because I don't know I'd like to be on the safe side. Debug sections
can't really be taken as reference: At least GNU ld heavily special-cases
them anyway.

> If so it might be good to add a comment that while those should be
> empty (and thus don't end up in any program header) we assign them to
> the text one in order to avoid the linker from creating a new program
> header for them.

I'll add a sentence to the comment I'm already adding here.

Jan


