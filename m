Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF3B77B20A
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 09:07:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583211.913289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVRf7-000629-Dt; Mon, 14 Aug 2023 07:06:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583211.913289; Mon, 14 Aug 2023 07:06:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVRf7-0005zS-B1; Mon, 14 Aug 2023 07:06:49 +0000
Received: by outflank-mailman (input) for mailman id 583211;
 Mon, 14 Aug 2023 07:06:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q53I=D7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qVRf5-0005zK-2I
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 07:06:47 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 207ec5a2-3a71-11ee-8613-37d641c3527e;
 Mon, 14 Aug 2023 09:06:45 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8966.eurprd04.prod.outlook.com (2603:10a6:10:2e1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 07:06:42 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 07:06:42 +0000
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
X-Inumbo-ID: 207ec5a2-3a71-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HR7ex3eM4ppj1CkOWSezEQQHw8uMp//zHXHI61f9FwysJawTrRXG2zUJ7LPWxGcVqIJQH0jUi6Rt68NMNNlmDwRER7EEO4NHA7ae4LiTwJw2e2wR0dFpV/lQBp8DTnqgenr5/FhrjfWeUV93p7UpvLfd3ivwzanM/6QX+9nQH28ZdfRjmk51Cn7ysnK4M0NqKBaiCQcaF3bu/hMAR0Ydnt/1zB5Gfhl01nOUwZFsVSSDDwSi2argqynJIvQIX+JBYRsGustvZbwBSBxjzle6zntbLDmLxUC4IuYRzkAN2yOwkr5CW6Ioupk2X4Yf13XgrvPlJL/dAsT8VXxc6W5tDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z2woV/ng/nyzy+lSTOkMPdiFfI4fnGFigN9WwfghKkc=;
 b=DqmlozNJpYGqJy0ZeP22kc3TkFQajm+Mna8ChhrFGLnse1i+vdXt8br8zltsqXx42+9ij2CoRzg0n7MJP80JnhN0/UrKT96bXmD/BQvUvX3IZBvcGp+RfKBH3YoX3vpANFY9oEtzR2jEkl9z4GpwcxVX3E11heNll2mXfncC6WIvePQQ+RyaHqhfcbvDHUS/UVed6pOuMO8SaTtp82MZKLB/BnCdDXHHQGL6ouBqL+S03EwpsYmvbBw9D49dAf9UJUM3Iw304leB6Z6uxNvoBAHEhmcm7EHEASz7hlsMjhvUFwiVLnUWuuV6Oim46PzB9STwv+AuJ++IilQeADYg5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z2woV/ng/nyzy+lSTOkMPdiFfI4fnGFigN9WwfghKkc=;
 b=yx1CvbYoBK4ax8iYta+Rbavn6ZADcgTpZUTvFWMZo97lrqKN9gs9o97f1aCifgNAo7MSWU0jcv/TWCV8+LSf+pS7B46m51lWLpeYLcFVe+eRpBU4FkuD2J6F0fCDKGQb7L938pu0e5GyQxP92nYLMGk+xo3WC4aEhOCIeqNMFJr3gjmKekfS5R+vryRTyV7TvYzcpRtvIzCmRJ8YULOcY1CR+xUC0o80Qo8MrPcA6qsgtNyCGcXLRP67j3Qc/wnrtZZcJd4cXvn3Fk7wgEyLBw1GYy+r2LApmeI4Ro+rmAZ9wuc2RshF9UP87d5Et5fdq3yZD7JxikhwXFdyGw1ePg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <72128571-2898-64ef-e11f-3cffa85236f2@suse.com>
Date: Mon, 14 Aug 2023 09:06:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 1/5] build: make cc-option properly deal with
 unrecognized sub-options
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <10ce72fb-4fb7-67de-41ec-7291dbac0038@suse.com>
 <60da37cf-abec-be58-d433-e98eec0c59bd@suse.com>
 <9dd1134b-8bc8-4fea-a2d7-dd20bd6af9c5@perard>
 <41f5ab35-504d-4310-db72-8a9e3ff0a890@suse.com>
In-Reply-To: <41f5ab35-504d-4310-db72-8a9e3ff0a890@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8966:EE_
X-MS-Office365-Filtering-Correlation-Id: 6609086b-cc37-4682-8ff7-08db9c95034b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ucGbZJuzFTLJzTJPsDu4auz/arvVwyIwEom4FD+JSX7ktjR8h0h2SHh8F62px//DAVbvvWuXTr9bLoyO/xbh7Q1nd2aKKnW7CAoqGIqQPXo7gYPXAog23q9Co9KcaQ56LTErmIiogHRvm6T/hvSbMXladUUcXmRkDVG06FYQV6PA3f86B8gt80bYgO0c2qEGvU77MhH7ZBAcWXnd64OzKUrON4lUzzGpTVH4JhCQcHCH0EVp3t5lkgFKtj3RsIoC93yxyBgPTNPjhD97A57fWfPtY+l9CCmGRTFPkw+WD4HzfjtdRp/t6SSAUTdzoWzAUYpx+qmQida52yJDmuOrw1Y7anaUlTINretjNZWQNX7W+P80RrZ7rFlBMqyetDhqIxU82FYCvPa2nkJMopZJw3Zs2Q8SiQzTDOLJXbu/hvGADNqwWkfl0Dv9PFMSXxiZJCxHxD9BVMhNZXvbjavgHs7u+/LIWgXBYyrS099QHhYwCcDuyVKp7w1OeBDqd72zTr76hebC2gCDp9+l7Kmpru8oQ8NjEdTRGdroVSQLdwACclmUwPjibmFuuoOWGE8F33Z5R+1hvZSCvcG4zTUWhxno3ydFsCJVgl3dCPnZzGKj8tL/LHTL2W4Pb/jyMgM7GIrCi94fYACpx0G0yEgUdw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39850400004)(376002)(366004)(136003)(396003)(1800799006)(186006)(451199021)(53546011)(26005)(6506007)(41300700001)(8936002)(66476007)(66556008)(66946007)(316002)(8676002)(6512007)(31686004)(2616005)(83380400001)(66899021)(6486002)(478600001)(38100700002)(54906003)(31696002)(36756003)(86362001)(4326008)(6916009)(5660300002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3RNNXkvbE15WkRmbWZWTnRaUkl4VEw0MFg1MTI3akE4REk2RExhaVk0VEZi?=
 =?utf-8?B?NG1kcnZrWCtwWElQOTZjbUJIYzdDa3pzcDdlc2Z2aHRuL3JFSWlQRXdCVVdp?=
 =?utf-8?B?eitZODlxUnlpY1dNamx3ak00cFhKSzVyUnJZVTRPeEpXS1pVYVlwZUl3a2kw?=
 =?utf-8?B?Y3lPb2xlUGxMSW9TeTB4M3dIdUF0K0QrdDZnb25rYmF5VDZQbW5FNzVUQ1V0?=
 =?utf-8?B?U2RjKzZXbUxFL1hERldpeXYydFQrcEN4SzNiQ2NVZHR1ODNHU0NYYzZoaVhi?=
 =?utf-8?B?aElKeVliK2Q3eFBiN1VDRzdpQ3dtQzh1d1BINkhrV1pDVVRiWnJMZXNxTUNP?=
 =?utf-8?B?MlQzQmtkdFAxNkw2TTNTb2NHVCtYSlJHVU1jMmdEQkE4dEFBRzVkdTZQRjU4?=
 =?utf-8?B?QmU4cUQ2NEgrSHIzdkNhcWNxVFFWVGZNd3JyVFMyemtCRnNxbXNBM0FWRmdh?=
 =?utf-8?B?NVU1ejQzZE8zOWFFeDhlK1BtNmZSMkFiL3BQOHRFRXF1NVNSb0NUWUhDVldv?=
 =?utf-8?B?MjhmM3JpMmh4emIwV1FjbnVLSmZ6ZkIxM3BjWUFOTlNtRVY4NWtzQ2g1Uk9J?=
 =?utf-8?B?a3RVUnJURWRyVUJRZmVwRkZNSEswQ050R2F1RjNXelYzdERHS05rRTVseUpE?=
 =?utf-8?B?RTZPaG5RTFFSa3l0ckZFMUpxVVdXNmtiamhMc2l2OFBGSkZXb3dIbTRkaml1?=
 =?utf-8?B?UStVR2pDa3UrVW1QYmRvTlZTMXRURGdCQU1mN2pVanJHajNvWFlJY1JWS29K?=
 =?utf-8?B?cGE1THVqSmJ6NVBBOWhhZG84d3BBQ1RCRWdCMzdSTmdaL3dmQlRkYkFhQ21X?=
 =?utf-8?B?d2JjMWd1Y1J5ZjV6OG5EUjREa3dwYzBSYkhpN2w1NkpmRzJJZS93Szc5a0Rl?=
 =?utf-8?B?b3hlWUw2bkE5ZE5Td0VUSFExTjhmOVFEUnFCcy9LZktuRTJJRitQelZaMXRO?=
 =?utf-8?B?MHJJbjR4TnZVa21TeFY3dVloWGQzRW5RdlRWQUJjYnNsOHg4c0Ixcnk4VUEy?=
 =?utf-8?B?eFkxaDdxM05xSkw0OW8vSEFQYm1ieis0VnQxN0FXemsrTStBV0Q0cUhzV0ty?=
 =?utf-8?B?MzdqUW5TQ0YvOHFZRnR3U2xoS0RONHJyUnNxUDMrMjUxVmlyYWc0VnhxK29J?=
 =?utf-8?B?QmlmV21vaVY3VVZ2V1JMaUFHeFZ0MEVXUGpsUjNkakJMU1hGbWlxeU4wMXc0?=
 =?utf-8?B?L2RDVUMxalFFWXVHTXJYMVYzYzBBSzdCaGRMWXNPUytaMFpxR1RFMGxDOVRl?=
 =?utf-8?B?OTlkQUIrQTlybUsvZEtLWVloSHUwLzZ5ZUVuSW1pa01SUGNVYi9YMTlkOEty?=
 =?utf-8?B?dWk4ak1qM3VxNHc0NForRTA1THpoU1RXTElSaWU2SW90YkFpYlg0QlhJcFVp?=
 =?utf-8?B?L0pOclNHSU15dW92cG54UlY2NlhxTXRBT0xpcUFHemRickZqYldCVjZlekJm?=
 =?utf-8?B?Tk1HUm55UUJ5cFZzZlVqRE1DcE0xcGVZU1pBcUJvNjQydVZjZHhFdktpNlRY?=
 =?utf-8?B?SlhuTkZCNG9zY3JhSUJWNTRndTdjMlhBWTRFSFhUV2p5a004b1R6ak9Ycm1j?=
 =?utf-8?B?TXZHbWJEZFI4S3lwejl0b3JZa0xQWGdyOXcrWjFVR3RlUE9xWTBVOU5nZ2Qr?=
 =?utf-8?B?dVl2c2l2UGFaTUhyaEd5N2ZINWtNVzlSb0FJQWtVWFU3ME1aTHNCa2pPR1JG?=
 =?utf-8?B?V2JKOXFtRkhqc2Z3TjBCbU5KTzN4RWJNUlRHb3F0SVJOdmNKVTlJV2RDbEpk?=
 =?utf-8?B?cWxsMDhTNmEyQzVndEdTTXBhNU5Oc0NnNjNNOTAzMDdzWXNEdU9NT1F5T01n?=
 =?utf-8?B?MU9KSEx3Sk5iNUNMcWtGZXhFS3BITzN1N1VjQVVwTVJJTm8wYUs2cHY5WUln?=
 =?utf-8?B?L2M0TjB2YU1FMDQ2ZWFJSzhYTzZ4YUxsSkRKdXprV3RYT1hGNmtYM0Y4OGU1?=
 =?utf-8?B?ZWRYclZrcnZpS2U5QzFRcWRtZkN4ZEJZTFZiek9jd09mSHJUK0hyUU9NKzRD?=
 =?utf-8?B?TUdscmVTL0dYdW90OTYzL3VwTjJ6YndPUUNTNHp1UkRKUnByOUl5ZDl2K2Zy?=
 =?utf-8?B?N3NBbWtON0pLck1GSmgwNkpTVU1BYlhjd2h3c0YrL0tXNlF3KzhrdVg0dE5G?=
 =?utf-8?Q?VZnSOAtFvCN8BE5qDg+ARykDH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6609086b-cc37-4682-8ff7-08db9c95034b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 07:06:42.3596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L9hCIYDnvhnqGBn21c3wDkFWCw+fQ51Nek8Oe7bkwPOcA6jGmg5eWlvAo6VZilHG9430pnQj49fdVmoDqhDokw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8966

On 14.08.2023 09:01, Jan Beulich wrote:
> On 11.08.2023 15:48, Anthony PERARD wrote:
>> On Wed, Jul 26, 2023 at 12:33:07PM +0200, Jan Beulich wrote:
>>> In options like -march=, it may be only the sub-option which is
>>> unrecognized by the compiler. In such an event the error message often
>>> splits option and argument, typically saying something like "bad value
>>> '<argument>' for '<option>'. Extend the grep invocation accordingly,
>>> also accounting for Clang to not mention e.g. -march at all when an
>>> incorrect argument was given for it.
>>>
>>> To keep things halfway readable, re-wrap and re-indent the entire
>>> construct.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> In principle -e "$$pat" could now be omitted from the grep invocation,
>>> since if that matches, both $$opt and $$arg will, too. But I thought I'd
>>> leave it for completeness.
>>> ---
>>> v3: Fix build with make 4.3 and newer, where the treatment of \# has
>>>     changed.
>>> v2: Further relax grep patterns for clang, which doesn't mention -march
>>>     when complaining about an invalid argument to it.
>>>
>>> --- a/Config.mk
>>> +++ b/Config.mk
>>> @@ -8,6 +8,7 @@ endif
>>>  comma   := ,
>>>  open    := (
>>>  close   := )
>>> +sharp   := \#
>>>  squote  := '
>>>  #' Balancing squote, to help syntax highlighting
>>>  empty   :=
>>> @@ -90,9 +91,14 @@ PYTHON_PREFIX_ARG ?= --prefix="$(prefix)
>>>  # of which would indicate an "unrecognized command-line option" warning/error.
>>>  #
>>>  # Usage: cflags-y += $(call cc-option,$(CC),-march=winchip-c6,-march=i586)
>>> -cc-option = $(shell if test -z "`echo 'void*p=1;' | \
>>> -              $(1) $(2) -c -o /dev/null -x c - 2>&1 | grep -- $(2:-Wa$(comma)%=%) -`"; \
>>> -              then echo "$(2)"; else echo "$(3)"; fi ;)
>>> +cc-option = $(shell pat='$(2:-Wa$(comma)%=%)'; \
>>> +                    opt="$${pat%%=*}" arg="$${pat$(sharp)*=}"; \
>>> +                    if test -z "`echo 'void*p=1;' | \
>>> +                                 $(1) $(2) -c -o /dev/null -x c - 2>&1 | \
>>> +                                 grep -e "$$pat" -e "$$opt" -e "$$arg" -`"; \
>>> +                    then echo "$(2)"; \
>>> +                    else echo "$(3)"; \
>>> +                    fi;)
>>
>> This patch looks fine. Shouldn't the comment been updated as well? At
>> the moment, it only discuss about -Wno-*, which it seems is why `grep`
>> was introduced in the first place.
> 
> Right, but that has been an issue already before.
> 
>> But isn't it doing doing pattern matching on an error message going to
>> lead sometime to false positive?
> 
> There's a certain risk, of course.
> 
>> Linux's build system seems to works
>> fine by just using the exit value. They've got a few trick to deal with
>> -Wno-* and with clang.
>>
>> For -Wno-$(warning), they test -W$(warning) instead. For clang, they've
>> enable additional warnings:
>>     -Werror=unknown-warning-option
>>     -Werror=ignored-optimization-argument
>>     -Werror=option-ignored
>>     -Werror=unused-command-line-argument
> 
> Ah, yes, this would likely be a better way to test things. Time to redo
> what was done 12 years ago. I guess for the purpose of this series I'll
> keep what I have, but take note to rework things afterwards (which now
> would likely mean post-4.18, as the new-submissions deadline has passed).

Hmm, or maybe I could simply call this v4 then, especially when directly
integrating -Wno-* handling right here (by suitably using $(patsubst ...).
The extra Clang aspects (if indeed needed; didn't check yet) may not
easily be coverable that way, though.

Jan

