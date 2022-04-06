Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1354D4F57EA
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 10:45:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299717.510832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc1HN-0006IJ-B6; Wed, 06 Apr 2022 08:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299717.510832; Wed, 06 Apr 2022 08:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc1HN-0006GD-7y; Wed, 06 Apr 2022 08:44:41 +0000
Received: by outflank-mailman (input) for mailman id 299717;
 Wed, 06 Apr 2022 08:44:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nc1HM-0006G7-0M
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 08:44:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf91211e-b585-11ec-a405-831a346695d4;
 Wed, 06 Apr 2022 10:44:38 +0200 (CEST)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2054.outbound.protection.outlook.com [104.47.10.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-eD1DKtLiPzaQGRbNPmqt2w-1; Wed, 06 Apr 2022 10:44:16 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB5505.eurprd04.prod.outlook.com (2603:10a6:208:111::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.19; Wed, 6 Apr
 2022 08:44:15 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 08:44:15 +0000
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
X-Inumbo-ID: bf91211e-b585-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649234659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dxfr3LMtYTRwl09k+dhYZQ5kG6EZwAPE+Hmdov+RE3g=;
	b=Vo5sXI0mSvehxoqGogcXQ1q5QVWGhYDpv1jrcHBxe7Ya+BUadNzkeru2wRs4wCi7f7aTT4
	jqokVfMYIQ6cRTZ1NtU4K4s9RdkdFBrxwRAufYMYNkr6ojsV7YpLfA6hL+fY4SQx2M+7AV
	WQthzxG/BCkMPw0wHHDASn5NQeq7VQ0=
X-MC-Unique: eD1DKtLiPzaQGRbNPmqt2w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGrbqwBsrYPiFymcV+vGyT64RsrfPfpS2xC4q65CuTi0F0jFcWi7ayoV8PjQXSoxU7z/TzC9HIrx+wS8pA8i6qkCPSPpd1tGMy4xWcwx+mNCCwmwgz+J9f1UDxqvKo8g/lN3zV6MV1kL740LHbMSefFfjTeGRWe38c8lxILA5Avjy3Tzdp9JLNMSLGPT/kWGv+chkheFNnc1dUH1nIRDlbn5oK0/YHadylPSZ/4TY1SLnQ4PBRe9cPJ7XxTRgxDl+12jIleOZIMqrADpHu/db1YFv38Mgo3EXY2rER/6ft3ICc5VL5LU+9ewYysZn4ZMg0FVAU8e2Gm/GTypUnvQag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xWmlH7K5oMVHAVbbonVfpBJtic6qwjgRbrZCHQB0ptY=;
 b=dqbrSHrSHCezkqImfS5KXTAEYikQP9PBHzi80gdJyglDUy+yJD4dc4/X26/Ke4qhUhYFBV99vVm5AJzALwRhVqx2FWOSRtzCtvSHmI/MEYy0NZCuPMQLF1jJPOIxzUg80UfhP5t8qhWQT4nhl4maHQa92REB72zWm6uQc7pHSDqgy4QwOwwOa/6waDlro7+alocXzBQ61WMI8vPGlApQR0F4LTpvVE/N8bwg5zNSv/tI2SV6V1594IdW6kMTNdkZnRumJKv6QApqjxwOxtzGMbpSF/Cf5cAqJ2PdWPjY30qqpq4bY30foFHrGG+0Pv3XlSIv6fgpta++aa6wRvLMng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <17163e1a-6598-5949-47cc-eb9734bc69ac@suse.com>
Date: Wed, 6 Apr 2022 10:44:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 3/8] x86/EFI: retrieve EDID
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
 <c11d267f-f6b7-558f-18ce-2b081ae12427@suse.com>
 <YkwZnBIOQ/jwzq9Y@Air-de-Roger>
 <39640fec-de8d-0c5a-c9aa-daf83fb785b0@suse.com>
 <YkxkfbNpR7yfLP7W@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YkxkfbNpR7yfLP7W@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR04CA0049.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::34) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 366eefcd-eb83-41d3-ecbb-08da17a9a141
X-MS-TrafficTypeDiagnostic: AM0PR04MB5505:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB5505ED2763361794F1F19572B3E79@AM0PR04MB5505.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AmrNXb/QXmijfsW+NyGMfIDreOKV6tWLJjetkIBInzOtAS5HFZKstp8f60XnKwTIKnhcLSGWHpqQ/9hO2oIY+ItuNohMDRoJkppQjlrGWW75NeZT5hDXy8SC/mRqC8kYAMHJKCMlPJ/CQQVDTikTNQgxLDVrwKTuWAwXdNQKCDLEW9+RWckvT18x7fS6KZjAvX/+sueA4NKAZ8kycUpcbEPYIcmYxwlDvakOYxaHANxBYNRwgrPh11Md0Hpj/y7Lynvv1v5/wAnp3zHTt+X7s6lX1spg0PjRDgu+eahFqsXo+heRmMtX0tUEj1kKHv8W4qJYx8gEOyIZcBGPvJSvdF4ITPnZYoILgjjXjmLp6ss7VZjXjwzPmil8zvqOqRAt4v7lYcFpHHD5zw9uytMwqswyTZWetH6wcNREyZSyk2iklySumF8d2Jdxlr59f50DRxqps09NW9q5O985JSMrGw4kTs/lWm6FfNKagSgkvCPp9YOakhAizoorgdMt3hL4yHf/TVeAjQEtOcgT0A4lA1IRcYnfL+tM97D40c1QslNvNTH45Ti/vQ4FRWnkNccDAvTezxOODqmh7No65WW7nzAOjSQ+8CaZj3cCHn2RkmW72W6S10OdyRCV52e8RSWWqKFWDh4BwJP4lp0sxeEavF49RWcsv99W61m6diJbH4K2G1gJNsib5Rloj6XNne4yLagSf6K/yOjcYtQHCXY6RCgRvNfeWWr3F9xF/xbYbEs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(53546011)(6512007)(6666004)(2616005)(186003)(26005)(4326008)(8936002)(83380400001)(36756003)(38100700002)(8676002)(5660300002)(31696002)(2906002)(31686004)(6916009)(316002)(508600001)(54906003)(6486002)(86362001)(66476007)(66946007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?40CtyKLSvCIhMDTB6XyEMf6rjLOZONWrTXQCpGGBuKCXd6K+3QiAQb+DBIBS?=
 =?us-ascii?Q?blrJrYofbPWdkDdt67zbhyjApvGCxAORiasSD2tfOQHpnfZ8kNXYbcibdinJ?=
 =?us-ascii?Q?ZjlqTR8UNsoOuPJv3quvuyKBg7xo1dELPHw0i1WW2fh/NjBopg1ggB2zrf9j?=
 =?us-ascii?Q?ZnZ8KpyOqfP/G3qlelhH5sYH4tIAtMWxPisGu+lf6FkL0gRkO27WLbYv3Cbc?=
 =?us-ascii?Q?Ph4qeGJFlTZb0Lj3nM5Hpbk8SlMUiis6ARiX4wT0lNWJy/QHaM202EcXsdd8?=
 =?us-ascii?Q?tBFTwsQtfET3tUbg6Y8hERDQA0BegrYuNnD9fmXiX2UbG6iZbIhrkK2ptDat?=
 =?us-ascii?Q?lH63+3tdxR3v/87MoK1XYxAsFimCwAG12wfuOW7Pz08qnJ5k5Eot1yGbfc3h?=
 =?us-ascii?Q?4tbVIyOdNnexvEHKZjKtrcosiTy5AtWBVvHhPxQzVBUXXPKDZpJLEcNld+UT?=
 =?us-ascii?Q?ebcwahMV3RgK8uvaGwwAd0jjDVgSnKhSHPwCzaIO4RlgpF7/TwcthCaNKH4L?=
 =?us-ascii?Q?8az4tmKbm0zrDdlt6ZkUBUVx6sOEegcAw6MjkDBlrHUIB5+61ttUg/38Rxiv?=
 =?us-ascii?Q?H0ceJ/X+AbdcKJ/0UXUc37vyHh6S0Ii2tQQ88zj3wwg/fHiZ3oA9i+1J5rII?=
 =?us-ascii?Q?iTlBvMz3s/jDLD20XuLaKgI0IADOpRgL28E7f+GkBTiOb6mzY0Vfh/fKjDnB?=
 =?us-ascii?Q?UxjSWqgql8hk7rBLvQhpopFSCYSySPOambUipnH7eucUHmNGEbfVL/iQR3dy?=
 =?us-ascii?Q?u/vOjEN9LSnAXDQf08b0eV4tCC88/y5+fbMESleaJkSC5uzLasrdbZUlT54+?=
 =?us-ascii?Q?ezkpeefXlcSc7OWZtBjnsJUnsjkoxR7i5Ea0kn6juCFiitXLND8jvtvNYPbs?=
 =?us-ascii?Q?LpKAEdnj2ZtW/lRk8D3p5wdnmrlsly5QMla9/DtQrDapKd7lFxTwkVPDIEdV?=
 =?us-ascii?Q?EJGZrxR7NJUH1gihxMjV9t0At4jWaX30kZ7ZLI2v3jY6hAfMpbzFmzGeyqv5?=
 =?us-ascii?Q?3qI4hKsYafaJ632S/IUJyZsS1FYUkKTCNhQEE9mDXzf/OtlVtW5AGQlLYiql?=
 =?us-ascii?Q?CmOYCronO5hT80fekrlZKeDc/hvgsbDWjkVNhRVEb+NpVgsq/DloGWXroJNB?=
 =?us-ascii?Q?cPF27G8Cs0DMXVk4WLrGYlR3/zAaFviwzX6RLBqwJj5Bs0qo0M02a0c39XUT?=
 =?us-ascii?Q?knX44cBr15CJs8uSTz6FLyaE1VfaO/NrLM7YJfM+UaauWJ7qTwZBzruG+ZYL?=
 =?us-ascii?Q?CcJNwBLTwgB60ihiwMqDIWQdmMFkZg+JioGnF6sIlLJ9KPG8TSB1zfUZqyLW?=
 =?us-ascii?Q?Fgwu4OGci9S5ikWRErrBlgF+nwllh7zNamRSLQN0ntPy4NSAlG3ZCB3oKhMd?=
 =?us-ascii?Q?/Uc70bePNwE3CQAm7EFUd3aj4Y+QaleboGEPRbyiPVqE2px5d/W+8QLCB2og?=
 =?us-ascii?Q?ZV8PRAlHGemFZIKx17ZrE7vxl5xqV9ECZhdMTVpDBhrq/PFw0T4tayKGCzBx?=
 =?us-ascii?Q?jLt1gwDbNG+onUAZ3xb9104TmGCjKHUr4PHb33VNLyXK9GjT0DUtwBpEcKAm?=
 =?us-ascii?Q?6wpd3zxhY//Tlyy3Ytatde42cYYgDl7pthvvCqKAhFFAhsKSH/I6YS8/XlL/?=
 =?us-ascii?Q?Jp6zSYqAvyHKlaLLoHbAHTy++KmXb8Gc8XdG9XTYfQ9HnTYIhGLabh5/fD/u?=
 =?us-ascii?Q?8Jd16MoIMZOwkN5hvBwNudF8QDIoduYvHiA7hm/X/VoL/aVAfTBRRtBeu5+C?=
 =?us-ascii?Q?eCrZEYF0RQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 366eefcd-eb83-41d3-ecbb-08da17a9a141
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 08:44:14.9960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MfBDxRKbG9Vpgh/Vxt9vx4NaWGHPj5RAqXVG0MIhZXaQ3sPFFfxqweRXZA7k+G3v9sDCNnKzKrMWheDFZtxy4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5505

On 05.04.2022 17:47, Roger Pau Monn=C3=A9 wrote:
> On Tue, Apr 05, 2022 at 04:36:53PM +0200, Jan Beulich wrote:
>> On 05.04.2022 12:27, Roger Pau Monn=C3=A9 wrote:
>>> On Thu, Mar 31, 2022 at 11:45:36AM +0200, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/efi/efi-boot.h
>>>> +++ b/xen/arch/x86/efi/efi-boot.h
>>>> @@ -568,6 +568,49 @@ static void __init efi_arch_video_init(E
>>>>  #endif
>>>>  }
>>>> =20
>>>> +#ifdef CONFIG_VIDEO
>>>> +static bool __init copy_edid(const void *buf, unsigned int size)
>>>> +{
>>>> +    /*
>>>> +     * Be conservative - for both undersized and oversized blobs it i=
s unclear
>>>> +     * what to actually do with them. The more that unlike the VESA B=
IOS
>>>> +     * interface we also have no associated "capabilities" value (whi=
ch might
>>>> +     * carry a hint as to possible interpretation).
>>>> +     */
>>>> +    if ( size !=3D ARRAY_SIZE(boot_edid_info) )
>>>> +        return false;
>>>> +
>>>> +    memcpy(boot_edid_info, buf, size);
>>>> +    boot_edid_caps =3D 0;
>>>> +
>>>> +    return true;
>>>> +}
>>>> +#endif
>>>> +
>>>> +static void __init efi_arch_edid(EFI_HANDLE gop_handle)
>>>> +{
>>>> +#ifdef CONFIG_VIDEO
>>>> +    static EFI_GUID __initdata active_guid =3D EFI_EDID_ACTIVE_PROTOC=
OL_GUID;
>>>> +    static EFI_GUID __initdata discovered_guid =3D EFI_EDID_DISCOVERE=
D_PROTOCOL_GUID;
>>>
>>> Is there a need to make those static?
>>>
>>> I think this function is either called from efi_start or
>>> efi_multiboot, but there aren't multiple calls to it? (also both
>>> parameters are IN only, so not to be changed by the EFI method?
>>>
>>> I have the feeling setting them to static is done because they can't
>>> be set to const?
>>
>> Even if they could be const, they ought to also be static. They don't
>> strictly need to be, but without "static" code will be generated to
>> populate the on-stack variables; quite possibly the compiler would
>> even allocate an unnamed static variable and memcpy() from there onto
>> the stack.
>=20
> I thought that making those const (and then annotate with __initconst)
> would already have the same effect as having it static, as there will
> be no memcpy in that case either.

You cannot annotate non-static variables with __initconst.

>>>> +    EFI_EDID_ACTIVE_PROTOCOL *active_edid;
>>>> +    EFI_EDID_DISCOVERED_PROTOCOL *discovered_edid;
>>>> +    EFI_STATUS status;
>>>> +
>>>> +    status =3D efi_bs->OpenProtocol(gop_handle, &active_guid,
>>>> +                                  (void **)&active_edid, efi_ih, NULL=
,
>>>> +                                  EFI_OPEN_PROTOCOL_GET_PROTOCOL);
>>>> +    if ( status =3D=3D EFI_SUCCESS &&
>>>> +         copy_edid(active_edid->Edid, active_edid->SizeOfEdid) )
>>>> +        return;
>>>
>>> Isn't it enough to just call EFI_EDID_ACTIVE_PROTOCOL_GUID?
>>>
>>> From my reading of the UEFI spec this will either return
>>> EFI_EDID_OVERRIDE_PROTOCOL_GUID or EFI_EDID_DISCOVERED_PROTOCOL_GUID.
>>> If EFI_EDID_OVERRIDE_PROTOCOL is set it must be used, and hence
>>> falling back to EFI_EDID_DISCOVERED_PROTOCOL_GUID if
>>> EFI_EDID_ACTIVE_PROTOCOL_GUID cannot be parsed would likely mean
>>> ignoring EFI_EDID_OVERRIDE_PROTOCOL?
>>
>> That's the theory. As per one of the post-commit-message remarks I had
>> looked at what GrUB does, and I decided to follow its behavior in this
>> regard, assuming they do what they do to work around quirks. As said
>> in the remark, I didn't want to go as far as also cloning their use of
>> the undocumented (afaik) "agp-internal-edid" variable.

Actually it's a little different, as I realized while re-checking in
order to reply to your request below. While GrUB looks to use this
only "just in case", our use is actually to also cope with failure
in copy_edid(): In case the overridden EDID doesn't match the size
constraint (which is more strict than GrUB's), we would retry with
the "discovered" one in the hope that its size is okay.

> Could you add this as a comment here? So it's not lost on commit as
> being just a post-commit log remark.

As a result I'm unsure of the value of a comment here going beyond
what the comment in copy_edid() already says. For now I've added

    /*
     * In case an override is in place which doesn't fit copy_edid(), also =
try
     * obtaining the discovered EDID in the hope that it's better than noth=
ing.
     */

In turn ...

> With that:
>=20
> Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

... I'll wait with applying this (thanks) until we've reached
agreement.

Jan


