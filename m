Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EBF50F710
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 11:26:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313606.531229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njHSd-0002NS-Mu; Tue, 26 Apr 2022 09:26:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313606.531229; Tue, 26 Apr 2022 09:26:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njHSd-0002L1-JP; Tue, 26 Apr 2022 09:26:19 +0000
Received: by outflank-mailman (input) for mailman id 313606;
 Tue, 26 Apr 2022 09:26:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njHSc-0002Kv-5V
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 09:26:18 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec5f28be-c542-11ec-a405-831a346695d4;
 Tue, 26 Apr 2022 11:26:16 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-p4-dLgQlNtSitW9GzNhyCA-1; Tue, 26 Apr 2022 11:26:15 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB3982.eurprd04.prod.outlook.com (2603:10a6:803:49::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 09:26:13 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 09:26:13 +0000
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
X-Inumbo-ID: ec5f28be-c542-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650965176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3K54S1SujMEbj4tNb1lHJwPgChdxiwinUVOH9r/0H4c=;
	b=n6BOd0dNSp4SwvEMx9J+RdXkwiq2ph84r8r2m+qraZZBbrQfYIrSgPd8L/3kaeBk4WGfV6
	kYpyJYELJ1B82laUIaYCRw0xHqGWkJyhSS3xJcaxUy0XdJgkWLW2r0qDcqTYyntwogIy7N
	Ew+Soar+J389kSfXzP5etBbOZX062f8=
X-MC-Unique: p4-dLgQlNtSitW9GzNhyCA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lAYpMD7vTno90vAm3DYcJmUPeqKD8mR7XVyifz2rdB+Ia/PiXdaevZdaqBO5L2kM3d6gaW9Ea1aWpXH65AQXhgqQyT5BSuiNznnvl2GJDMqRTsV8MLK38v2lMKRBQg988S20hjQJTbboR4VWawIOPGGEAaVEabmSwG99xHhDm9lYwfvzYtxkkVSX0FaboHMprXLrw0xHRwXLGVkN3KGkNDlc9L/JRtM7hF0IR+o7Fo0sxv1Mf1MA9nPndfk1ADc0UAXplA523mqGYiSaXHZxwKl2Od6rvrXJZID2c7TqNQgbjCxphTwODjdfnwxlbJgCmdI5s4ZhrKhUXw+YaI+Xaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l8rBkaGs/rdefEP+tisAIrHBmA42h46x1RHh1GtL95U=;
 b=jweDtHnKskaZ/KIcM12UZ/l7rXsSR12IEPi0TnIbRU/iw/4+QCuxV6AhcUV//13NSfNGuTp7D0vkZQIvbcqeB3adtu5ZILHYnFBgvkqmGuuQMAEPCTU8OyZpfZeFLG1GsBUNjKZHrygAfBf3TGjQUmbXSquTfxpHQe5ZdkP9qxZRzQvwC25RPpv1wuz9t4CLHS0+YIDH+XrVY2py+NAvWCP1jcow8GtUVGWdsOJKAu/3V9ovx6SxFCeQP6d/YGiFPpEwerts0eTFWVCz7nim6HOVNfkTi3N0pk8mLvkjcvu+PLuZrLvJWHVvzF6aek4cBrg1o9pQIEKFWiU9qx157A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cf714bdb-4384-d674-2e11-9a9227ed566c@suse.com>
Date: Tue, 26 Apr 2022 11:26:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/2] x86: improve .debug_line contents for assembly
 sources
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <23509d85-8a73-4d81-7ade-435daf46fcd6@suse.com>
 <YlgWKGmR+u41zSsw@Air-de-Roger>
 <04f9bd9c-70da-0966-afa6-96f81e290204@suse.com>
 <YlgiLhvsKVYKKvrr@Air-de-Roger>
 <2eab851f-0fe3-8462-cdbf-b438dc01ade1@suse.com>
 <YlhFiWYQMbjsOOAc@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YlhFiWYQMbjsOOAc@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0299.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::28) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7670d938-fed7-4406-86bf-08da2766ce4f
X-MS-TrafficTypeDiagnostic: VI1PR04MB3982:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB39820EE1ACD8ED6BA8DF78F0B3FB9@VI1PR04MB3982.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KfsplwQ/JZE1bbZOZm2CnqzgGp/l1Sf9YndUpb+Mc7pm3hMtjHhL1Gh7kWf6vKqzZ0xDA5Eg4YTjFIjbkTMLwYYH+tBIdTHBj2+EvVVJ+95o37z+9StlRqtlpxxV+HGYG9T6VRlluZnsJUSK+l7gL7XVmmIxRW65fYnkNkNSwXCKuZr3px3CtFqthkjtxsJLYbSTA7jvatJXIWwE+G4TvZeLxm3oo5vbVQXKrLEwLMMmN9uQ+SY9TBRIuZa0p2UaEQVbOi2qYKi+rrQ3CSvodMeTN+/XhLy/K41ZdQFj9P8NA/R8KrtO+CQ3cIPclj1f0y7anB7vhJkQJt4kubJ+vOUph7YXX1vpwJoF+vyxJ1va/FuuhJrbGLUtQ8v+erP/UC7tktKAGAp81qgeXrOH4noIPjUa7d+HFm3UmqNdhWZhJk5AxEiTn/RuFFyvYTXNA3dNScStkAhXTqvB/X1CDtQ02a7wxD9HQdN9v21dpervEERa/qcQeD1eZeAdVvXRYO+CYScE6P/1OIFOvWpOZOMeaHkf2Eg8doxvHxn+yW+2Rl4oaTEs0FKqvYRIHwuAlXjYWlx9NnpKJiwbuQpHBkwG1tKFoT/7KIBBa5CcxX7eGvjipU3TWrUgeLatmcika0Hnei07uHeIqXg+ffzzqO35qO1fri1dQDpMViN/b4K1Ilt3Y5tS420aFpnL5cE4xh3DnEFA0AqfSKlZcjEKX1nsSgcUOO4L5aV3Iaz/51RpjNcstOu9NopmfvevuJLXeCg0q+2CNK1fiMVBMWqWVGomlvuO1gPR6Qu9wy+zYzY63ONOyaDSOSz63ax9+0hsH315q4b0nrCpuM9pGGduPQNp3tarScOWPpO7HPBFYaRnCpvCM+2YAMXqFKzX4B/2a2xjypEGKCvQN2CD8aFkjA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(8676002)(8936002)(966005)(2906002)(86362001)(5660300002)(316002)(31686004)(6916009)(66946007)(54906003)(38100700002)(4326008)(31696002)(508600001)(83380400001)(36756003)(53546011)(6486002)(186003)(26005)(6512007)(6506007)(66556008)(66476007)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4gXitXcIhvh8fY11fI+De2d9s91yYdQY91g2S/DPk26DBf1DqjRIPpZ/KPv1?=
 =?us-ascii?Q?D8CVL/u/U9rH5QKeTuV8H71cZDzFq0SWYHDEa63zJTe9AvGFdaWhfLiSAuhE?=
 =?us-ascii?Q?/+o+zWIpjuIhgnodUyJQoYGF6kKm6mTYTgHoaUu/nwlGa7ntIsWoRyZtFeZn?=
 =?us-ascii?Q?nEwTNTcsHV+j8F7jv3O/EgWRTrvSzJu3DmDAzIpY7kr5L1kcyV7Ab1tVuOzQ?=
 =?us-ascii?Q?Dak+kmzPxmdDQVjtqkG1KswXKSJCAz5IaE4H6jxrINJniNXcki3IUlqF5+PH?=
 =?us-ascii?Q?zcPlC9ZBc7Zm5gEGAgpg7Qb0G/BZu7I06kjmPHmXsuypYVRpnxgHSv04JoWR?=
 =?us-ascii?Q?ZwWpWylQgwSR2bDXF9ScIIY5q1aZfg7tm7wOR3BYJ9i9phK7JQVlnF1H+YMj?=
 =?us-ascii?Q?omhSbAvjAGlZohhJUs1teGqvsmpBK/ZogLKtO4BzP/Lpi0JzIuZxjHq+1nlP?=
 =?us-ascii?Q?RgekotBQfxYL/68Cck7mG9NFOeOgTO7tP8YhJwWoc1IuNWLkH8k4cC9e7q1H?=
 =?us-ascii?Q?Nily77kbK4lF4DWT8alt9s46eaaAK/Fxot4Nq3MfgmXKB0MzbHinLQq1gIAA?=
 =?us-ascii?Q?V0XASnUB2f4cUJIlbLVQ8zCj4ON8tUAbUMrGia13xm47WaPKoFnoLmOuCVE5?=
 =?us-ascii?Q?R6hu2Em5Qr/50phffyT2ZdEdewpCPWWGXg8OgTRDJ4o/GKCCJFHl6SQsNUqO?=
 =?us-ascii?Q?MD44Tor/l7VqPiS5T9CZvFTlCJgPKEIGN0dKPT9/cwokedhd9s8jSjH9KG+n?=
 =?us-ascii?Q?dk6iGQjDJ/qQQbtDbZZ6MrRiJptNRG4r1CeX0QKcPtuHe1UrMNDNDRhOgSix?=
 =?us-ascii?Q?oAG7O4z1TpBmXRtNexXLEvNTQYuRr4l4omTXCAXcu9wmIDsuPc8RUtRjPqwb?=
 =?us-ascii?Q?k20EvVwsz6eJYhUK7M5B4171f4ZrtkzjDOL7AF743KaxEcB8Jb99qYmpa4RJ?=
 =?us-ascii?Q?9KYM2e8hj2LvM4FXh96LZEMKESryIfVDfdc+dwPgUjWUx0O/oKvr2bQBmWSO?=
 =?us-ascii?Q?CNCAVtniMMu96NiYtKmCHW27TKdmB9hLpGuLBq/+so/TBm41Qi/xJ6hX8Hei?=
 =?us-ascii?Q?HZGgzQIELefbrXKWssBpvLGghLpR6+1DL1NncNEUi1Uxli6EDlhEYNOBwc5z?=
 =?us-ascii?Q?11lTqAf+sKOQRe4/T6BQ7qVc9aTrhfJNm7NVgTkyjmayhLihWTH+Wv7yJleM?=
 =?us-ascii?Q?92OJmlbXO+ppO4SIa56JlBHEmm1h+YkvZ7x52DgUspHUywWjf4/AxipC8dmN?=
 =?us-ascii?Q?EuMKnJ8z4Yri/kn4GpXNOueaWOi8g7Y0rX1GxFggKXW3Ntb4wyxKt0sAGNY/?=
 =?us-ascii?Q?JVJpPQT9vZ/EL2ZsFMjIhIc1BWSc/BzHjHfcLuy8CRV8mueim0bXaXDpNNYf?=
 =?us-ascii?Q?V7Yxja8J9VDAtwNFoGRlw6AFDYvx6GH8ygUwCijiPrvTdRY3U+kVYEPl3Ade?=
 =?us-ascii?Q?8mduyc0vmdhflojAvaEN+OKFWActG4QuYpMdlMYPxFkCpDJ2oGiqj43PeaU4?=
 =?us-ascii?Q?EcquZ1x5inoJ1akEdXYreSlxaA6mKlRBZ75+excpbXbX/h19e/3U6Kkfq5GF?=
 =?us-ascii?Q?4wh467aO8Tn9ufQ43ORNIW2dqdDKszrVmll9C/Fn/exyy7J6+IZ3+d4j5p0X?=
 =?us-ascii?Q?YDop7uY7OsNINx5DPLGiGxYc5+U9pQSimOx4HvoRk1dIa8pn7HJFq6ZdlKgx?=
 =?us-ascii?Q?DY6cu8I7EJOfclRE809PXWU/DcGybtvN758+bMUFVEqqCzVc6iVh9fmLlmjI?=
 =?us-ascii?Q?bp+oe9iIPA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7670d938-fed7-4406-86bf-08da2766ce4f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 09:26:13.0155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UfCLtC2fR9KEhmyBPbtiqninr+VcoCkw4S5FRcR2I/3W/ua4VH3UU5NEd/Zl9wowaNTnWJFiY5OLGm1spuGyPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3982

On 14.04.2022 18:02, Roger Pau Monn=C3=A9 wrote:
> On Thu, Apr 14, 2022 at 04:15:22PM +0200, Jan Beulich wrote:
>> On 14.04.2022 15:31, Roger Pau Monn=C3=A9 wrote:
>>> On Thu, Apr 14, 2022 at 02:52:47PM +0200, Jan Beulich wrote:
>>>> On 14.04.2022 14:40, Roger Pau Monn=C3=A9 wrote:
>>>>> On Tue, Apr 12, 2022 at 12:27:34PM +0200, Jan Beulich wrote:
>>>>>> While future gas versions will allow line number information to be
>>>>>> generated for all instances of .irp and alike [1][2], the same isn't
>>>>>> true (nor immediately intended) for .macro [3]. Hence macros, when t=
hey
>>>>>> do more than just invoke another macro or issue an individual insn, =
want
>>>>>> to have .line directives (in header files also .file ones) in place.
>>>>>>
>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>>
>>>>>> [1] https://sourceware.org/git?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=
=3D7992631e8c0b0e711fbaba991348ef6f6e583725
>>>>>> [2] https://sourceware.org/git?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=
=3D2ee1792bec225ea19c71095cee5a3a9ae6df7c59
>>>>>> [3] https://sourceware.org/git?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=
=3D6d1ace6861e999361b30d1bc27459ab8094e0d4a
>>>>>> ---
>>>>>> Using .file has the perhaps undesirable side effect of generating a =
fair
>>>>>> amount of (all identical) STT_FILE entries in the symbol table. We a=
lso
>>>>>> can't use the supposedly assembler-internal (and hence undocumented)
>>>>>> .appfile anymore, as it was removed [4]. Note that .linefile (also
>>>>>> internal/undocumented) as well as the "# <line> <file>" constructs t=
he
>>>>>> compiler emits, leading to .linefile insertion by the assembler, are=
n't
>>>>>> of use anyway as these are processed and purged when processing .mac=
ro
>>>>>> [3].
>>>>>>
>>>>>> [4] https://sourceware.org/git?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=
=3Dc39e89c3aaa3a6790f85e80f2da5022bc4bce38b
>>>>>>
>>>>>> --- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
>>>>>> +++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
>>>>>> @@ -24,6 +24,8 @@
>>>>>>  #include <asm/msr-index.h>
>>>>>>  #include <asm/spec_ctrl.h>
>>>>>> =20
>>>>>> +#define FILE_AND_LINE .file __FILE__; .line __LINE__
>>>>>
>>>>> Seeing as this seems to get added to all macros below, I guess you di=
d
>>>>> consider (and discarded) introducing a preprocessor macro do to the
>>>>> asm macro definitons:
>>>>>
>>>>> #define DECLARE_MACRO(n, ...) \
>>>>> .macro n __VA_ARGS__ \
>>>>>     .file __FILE__; .line __LINE__
>>>>
>>>> No, I didn't even consider that. I view such as too obfuscating - ther=
e's
>>>> then e.g. no visual match with the .endm. Furthermore, as outlined in =
the
>>>> description, I don't think this wants applying uniformly. There are
>>>> macros which better don't have this added. Yet I also would prefer to =
not
>>>> end up with a mix of .macro and DECLARE_MACRO().
>>>
>>> I think it's a dummy question, but why would we want to add this to
>>> some macros?
>>>
>>> Isn't it better to always have the file and line reference where the
>>> macro gets used?
>>
>> Like said in the description, a macro simply invoking another macro,
>> or a macro simply wrapping a single insn, is likely better to have
>> its generated code associated with the original line number. Complex
>> macros, otoh, are imo often better to have line numbers associated
>> with actual macro contents. IOW to some degree I support the cited
>> workaround in binutils (which has been there for many years).
>=20
> Seems a bit ad-hoc policy, but it's you and Andrew that mostly deal
> with this stuff, so if you are fine with it.

Actually I think I'll withdraw this patch. After quite a bit of further
consideration, it should really be the assembler to get this right, and
once properly working there the directives added here may actually get
in the way.

Jan


