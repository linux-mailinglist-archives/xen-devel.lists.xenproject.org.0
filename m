Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E8B4ED5C9
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 10:37:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296763.505221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZqIl-000631-DH; Thu, 31 Mar 2022 08:37:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296763.505221; Thu, 31 Mar 2022 08:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZqIl-00060N-9A; Thu, 31 Mar 2022 08:37:07 +0000
Received: by outflank-mailman (input) for mailman id 296763;
 Thu, 31 Mar 2022 08:37:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TTh1=UK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZqIk-00060H-03
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 08:37:06 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bdf17f85-b0cd-11ec-a405-831a346695d4;
 Thu, 31 Mar 2022 10:37:04 +0200 (CEST)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2057.outbound.protection.outlook.com [104.47.1.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-oiM6RiRdOJ28LRfF55EXaw-1; Thu, 31 Mar 2022 10:37:01 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM7PR04MB6983.eurprd04.prod.outlook.com (2603:10a6:20b:102::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.21; Thu, 31 Mar
 2022 08:37:00 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.021; Thu, 31 Mar 2022
 08:37:00 +0000
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
X-Inumbo-ID: bdf17f85-b0cd-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648715824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KLA85lekRX135/Wtyxcgm0sHb8ym1qKY9s9jIJH3hsQ=;
	b=OVceWPkpkP+g2C1vYMBraOvHK/JNmSf4s++3LQ8lpgyQvdPw1C42uvZKd56e2OOT1cV7na
	s+J1ab0X3IkjHVOpaj49Xt2iJydAYdk/JQHYR1TjyoBbGZQ/J7CpUphVYLGSKAFzBDjjd/
	qipqpP16hzG0ZIsvDr89RR9rQLQNbiE=
X-MC-Unique: oiM6RiRdOJ28LRfF55EXaw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+GTSjRJ7TpwVfwo+/Ptov95SnHegv0gCGUd27z9kvXx+rM5YvATy2k+h9eJ5/lK9Pn7nHCY/QI9KT5j78PErOKwm1DE62EZLWuxcLH3uspimkDjiT9J7odjUgtVVYFunfNHr/XjkJ2UP7GXwNkJncE3VU8agNln8zLx0lZAtMhQRqntabCVH5KygGzZsPzemYJqfheQjqqDZJsfD9U1wFYpjYf2I48XsyTTiCdSgVlzf1nEJxwBWbS6pKP5Mb2axoJ9fr71DA+zyUBICpI+ogtYtZpFq7jhw9Hpuqs3V+CzUSrVeM0jj1eSoi6+s7EV3Km9DaGPuO4v6p/OfAdgJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vAdUUPg4fzOSX/Xe0jWn0k7lti2vs1FU2xej0K/ol9o=;
 b=jBbmXWC2NxOt8ooq6F40HgFfRTphLRJa74kLH9BIKqbNSdWoe3LMKOa3+Ev6YK7y6d28/fWtRIiSfdNNDTV5tm88NyeN4UZ+695/l5Pa995icD8EQCFYEq8TieMiSo9UQifOW0xdEP9n+V4vRjIl/DuKR0EKwSsbVo7rnhnauHMWqhipXmH+HzDPC0i80I7WJUsGF1IEqF3FcYUmAEJF3pNuUFG41sx6goQtbmMFDsLF5fTyJE3wYkQME37xQA7Oyzjez8UzzIuTdhcikBF0qv7NVryhraCY5Atc9tr+evIN/pZEUpn83pxtGPX7DUnGnVyfLriQ6G4lHT57NRI8yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <76e059cc-d77e-7c40-82cc-ed5e855dcc58@suse.com>
Date: Thu, 31 Mar 2022 10:36:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] livepatch: account for patch offset when applying NOP
 patch
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Bjoern Doebel <doebel@amazon.de>
References: <772f0afc-64db-6b98-af49-bd970ac78cbb@suse.com>
 <YkSNm0mb47Vc6nGr@Air-de-Roger>
 <a6f18801-7959-8fc8-f414-8086ed74ab3a@suse.com>
 <YkVfvW6HiST3fIgs@Air-de-Roger>
 <66beaea7-eb6f-4cac-336b-4dd605bc614c@suse.com>
 <YkVl9bAEc1lo4jpK@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YkVl9bAEc1lo4jpK@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::8) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32f2c17a-5fa5-4070-1f9a-08da12f19fd4
X-MS-TrafficTypeDiagnostic: AM7PR04MB6983:EE_
X-Microsoft-Antispam-PRVS:
	<AM7PR04MB698322592A6DD43C3723759AB3E19@AM7PR04MB6983.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	loYCGX2MhDMVP5ODTx7C7i+/Jog8bIRF/f070SZG2CdDgNOtArGxRxANFQxOtOhfkOTjeQAaEoJiw1UzKNe8KLcFzMOz2RgP5DWgEAPKFwQoflXYOZVtvDzU8x3R3JBLZzvZfwYtdDzV4kzhGKvrwOZBAY/KpDqTvTABHc3aPtNVTFccAl87QYX2s6TGI+37EYxkElWsB1HSWCn0iZWFaYa+KLQsygoNRaM+loOHgcsos1jPyo27O2gx7gYqGHd7qN1imc7pOIuJDDvDRb4MdYeD/p/qLzZxPvcyY2Xq9YLKoY1yyArQZv2J13CGGiZeyu68sdw8FIskGzCFT619O8hwdiQdJqE9CVoS7SuumcIoQRxeXsNE5lonxhFwuVEoFGW++VKLtV/XSwcIZmguKRle/DmittwhuxhD+uKwMhqS24b9EoWcq2qv4jJGK6oh+wIiyw6mAet00HpAbRFuD3uKyx5/3uvK4Nk81rpkDaCYKfkiPnOVZOp/6W+Ad1UjmxbsgTQN72qBv4WXwvkmKCOeTtkZFyAzHZ660Q7LSAGeefoXvBbRGWqHrZTUwbFJYJWYTkRzr8ir4oOY+ZHF8eCrtEV8c0ZzvVlvk15jmfWO1KXrtX8Tg1WWOXlcBPQoLPl4qYkAIg0UDZfUdgikYoQIywcmbfJLglD8EqOId+LjdvD4NwDCc2vNMfjbkIHx/LPexAp4FDZ8xmX8hZtSjmbJC+4hXgL5InF1eYPj/S0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(4326008)(31696002)(6916009)(31686004)(6486002)(66476007)(66946007)(8676002)(66556008)(8936002)(508600001)(186003)(26005)(86362001)(316002)(54906003)(38100700002)(6512007)(6506007)(53546011)(2616005)(5660300002)(36756003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wTPH8SAYn9uzM5/uczPAoIxoESMYaeaqwEvjS39ssEMym++o2Mu4lpPzDS04?=
 =?us-ascii?Q?mhMJ6yoJGw4vgASe9ySfhxzFQTWbsYFikXSZ36DH9Eqj9CNh3Nx15EGoSxLp?=
 =?us-ascii?Q?/vA7cB2OEILygYdeQCWflfBWp0u1gVoWog8Dnr5S2WKQoDV1pZBkQb8atKx1?=
 =?us-ascii?Q?MDo0R+wvIqbkq2mYtOa5qhnpUJlXG2ZOJHLRYCWXTs/69yH9zDaJxJCXq+Lx?=
 =?us-ascii?Q?cfFxv3J0t7HsUlfovK4vQtznnn8s3ZYRTk67ejZGNJp1XehqHo4nM1nZTtjf?=
 =?us-ascii?Q?z0iyKvMnKYKOmSMLhU7DCnZTxpVAGXai0KDU5NascNFEQ1ltZLek42UCusso?=
 =?us-ascii?Q?/0DYPQNiMCHMJfWDnFXnnh5GGDNYyI8qvxnIxpAgP9KmAucmZxJAJtiVlw8U?=
 =?us-ascii?Q?Mt5/n7T6rJkJsLhMZysaQIeMDPOwH28MfLwmGfbhzeVDOzgibPQeZ4RhwjKP?=
 =?us-ascii?Q?5ggPSxrosVP6PrsXq3gROH+bCVv99fQ4vLMl0z2BFtXqj6Z1DSHgSQ4D2+8k?=
 =?us-ascii?Q?1xLDTI8XQIYNW3qXpRKopiv2aKr2bAjpt8T21MaJ//890NfMlmtLY9DITlfT?=
 =?us-ascii?Q?SopMNhDXLp6rxQQCYTMesISEDfHdAK720sE8nNwppB9yQDrzek7Pxm/PtY0P?=
 =?us-ascii?Q?vGQmFhUoyu1CXOzcqxD1h9/SmBDknTb8UzaXxWi5kfNUC3mVzRkJuql+FxjK?=
 =?us-ascii?Q?U2bIvf36tOwFnkETqk/Qahny+efOXmQJ03aEeCTOkTmb6sngbLXP+fiayvvC?=
 =?us-ascii?Q?ToMN6rMbYETUXKV7nDx4jHPPEbEe6ZH8chcgkL65eRFdiwYtxcV83wI2T+c/?=
 =?us-ascii?Q?UyroTFpPaTPxcYgOX+fId50WvK9crixetMpb2aV3y/FXxUApyoLIsJH3W067?=
 =?us-ascii?Q?DhA3l+CXmpS47OVOWCltgIy0AzoeXyD1v3Z7TAqNdRPar4JyeVKT/RmA2NUD?=
 =?us-ascii?Q?R3f5UK7/6v4YnzLIi+sR/GUVOa9QFPyhafA+BvhrMh6J0KQtBcDYyTuNuSZJ?=
 =?us-ascii?Q?vOwnpvyVtZbOxZnQ2YgUVBwtIp1g/OC0qbnKB2D1rTGcXNz/bf3qryJq5flC?=
 =?us-ascii?Q?BCDl21WleMK8N+4uYfgFTarZk+3Vs0S5U4SHYQKh91r3pHGCzaD2XDU7mpN0?=
 =?us-ascii?Q?FlIbtZFBfhEO5X6KZJEj3PHKfXtOuQ9Tn9DcqZzOfrGsNipy0XpaKKjFn3kC?=
 =?us-ascii?Q?1RbuKT8LEQBs/SqFo+MFo1464Fs2s6OEA9HAhpUzY4+Ca5k+76SLdjmcr8mh?=
 =?us-ascii?Q?xtcKhUWU2unmAbVWIkH3dlq8Img4cHxfBJ1Y9iAoWfneloEuuIQE1dR9GyDa?=
 =?us-ascii?Q?qSAIKKLcOWYcsWgwJqKwZADGf1TDSp2CEBhAKBsmknUYW7ui4QgXhhzmd/S9?=
 =?us-ascii?Q?IRdwI3jIWyqBfnPxqXVI4OonEiWZFDWFETfmSqOfi7Ewx8/J8Hm+4iZorM9j?=
 =?us-ascii?Q?Sv8PeyEAhp2f+LoF2wS5iH7TQ8NwBueiozSgzxT/TwxZdlaEChxfRxeQzcYD?=
 =?us-ascii?Q?Mj0gYG4OyxcdY0sKW6IGH04HjXuBT3EB5FKK1K9T2xKRGhQYi7OfAnptVxtI?=
 =?us-ascii?Q?A5SqCpcvACwrmRuMw++NkQBAiOQNTbInxDY7DfVWEak+rtUTlRw+F4fO1/AK?=
 =?us-ascii?Q?h49z25nWmN1jwR34jwGYOjEg2VrR9zog+5GPPt5iaYIcW9K+fKIpPe6RYcNz?=
 =?us-ascii?Q?0hNvjFaYX82cAs3AUyfmyr9FivT8ckl78HUuY8kZ4PVfNk0jcqlZg+9Lw0l0?=
 =?us-ascii?Q?+vh2uPu6Jg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32f2c17a-5fa5-4070-1f9a-08da12f19fd4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 08:37:00.6430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1BbDx5I4uC3SJluTNSP9FDYU5rFsujciB/cBliQ9OuGRbz7n2gwLDPoPEsoqhy0Dc3UMWDzPxDa+EkZ8UtRsIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6983

On 31.03.2022 10:27, Roger Pau Monn=C3=A9 wrote:
> On Thu, Mar 31, 2022 at 10:13:06AM +0200, Jan Beulich wrote:
>> On 31.03.2022 10:01, Roger Pau Monn=C3=A9 wrote:
>>> On Thu, Mar 31, 2022 at 08:42:47AM +0200, Jan Beulich wrote:
>>>> On 30.03.2022 19:04, Roger Pau Monn=C3=A9 wrote:
>>>>> On Wed, Mar 30, 2022 at 01:05:31PM +0200,>> --- a/xen/arch/x86/livepa=
tch.c
>>>>>> +++ b/xen/arch/x86/livepatch.c
>>>>>> @@ -157,9 +157,15 @@ void noinline arch_livepatch_apply(struc
>>>>>>       * loaded hotpatch (to avoid racing against other fixups adding=
/removing
>>>>>>       * ENDBR64 or similar instructions).
>>>>>>       */
>>>>>> -    if ( is_endbr64(old_ptr) || is_endbr64_poison(func->old_addr) )
>>>>>> +    if ( len >=3D ENDBR64_LEN &&
>>>>>
>>>>> Sorry, didn't realize before, but shouldn't this check be using
>>>>> old_size instead of len (which is based on new_size)?
>>>>
>>>> Yes and no: In principle yes, but with len =3D=3D func->new_size in th=
e NOP
>>>> case, and with arch_livepatch_verify_func() guaranteeing new_size <=3D
>>>> old_size, the check is still fine for that case. Plus: If new_size was
>>>> less than 4 _but_ there's an ENDBR64 at the start, what would we do? I
>>>> think there's more that needs fixing in this regard. So I guess I'll
>>>> make a v3 with this extra fix dropped and with the livepatch_insn_len(=
)
>>>> invocation simply moved. After all the primary goal is to get the
>>>> stable trees unstuck.
>>>
>>> Right, I agree to try and get the stable trees unblocked ASAP.
>>>
>>> I think the check for ENDBR is only relevant when we are patching the
>>> function with a jump, otherwise the new replacement code should
>>> contain the ENDBR instruction already?
>>
>> No, the "otherwise" case is when we're NOP-ing out code, i.e. when
>> there's no replacement code at all. In this case we need to leave
>> intact the ENDBR, and new_size being less than 4 is bogus afaict in
>> case there actually is an ENDBR.
>=20
> Hm, so we never do in-place replacement of code, and we either
> introduce a jump to the new code or otherwise the function is not to
> be called anymore and hence we fill it with no-ops?

If it wasn't to be called anymore, it would be better to fill the
space with INT3, not NOP. I think the purpose isn't really to nop
out entire functions; it's just that the NOP testcase in the tree
does so.

> Shouldn't in the no-op filling case the call to add_nops be bounded by
> old_size and salso the memcpy to old_addr?
>=20
> I'm not sure I understand why we use new_size when memcpy'ing into
> old_addr, or when filling the insn buffer.

I was wondering too - it would have seemed more natural to either
require old_size =3D=3D new_size in this case, or to demand new_size =3D=3D=
 0
matching new_addr =3D=3D NULL. I'm afraid I have to rely on the livepatch
maintainers to answer your questions.

Jan


