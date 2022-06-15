Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E7354C66C
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 12:44:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350022.576244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1QVb-0004ny-SR; Wed, 15 Jun 2022 10:44:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350022.576244; Wed, 15 Jun 2022 10:44:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1QVb-0004kp-Oq; Wed, 15 Jun 2022 10:44:23 +0000
Received: by outflank-mailman (input) for mailman id 350022;
 Wed, 15 Jun 2022 10:44:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56zs=WW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o1QVa-0004kj-U9
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 10:44:22 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d8d0647-ec98-11ec-ab14-113154c10af9;
 Wed, 15 Jun 2022 12:44:21 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7111.eurprd04.prod.outlook.com (2603:10a6:20b:118::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Wed, 15 Jun
 2022 10:44:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Wed, 15 Jun 2022
 10:44:20 +0000
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
X-Inumbo-ID: 1d8d0647-ec98-11ec-ab14-113154c10af9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NwPRmMNlK2HqHB32EXPCjhsskkJVbcPWTLnXRzfVvl2/UG+ft+pE3Op9bvsSXibJyaWdqGCkGFPhgaKCOTQ7hzbVXervknlQiBrz30h52h61z8ElOA7iWnQAWKXpHJOB+SAFEAoOsfLqdeETD8ASQ88oc0QJO1Jsic6zGktuwGDaf2ajEbt2MW/vBC9hLY31zID9zfPABQwYWuIAXce9gEkO+KJyjvZYcdRaQGpYRQZlDbIWPe/riCIh7MnJj15LzVg8rirezWl8/AKEuBg3Yg6C/CyrA6omCnuCxM0hYVK6Gn29AqKHaAg2n+Gx7fSpcu7d5DVaIbNCxg2YLM3csw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3zB8A7BFijukqjC6xGoPOJL5l8xfeQLWHlypK/IB/54=;
 b=FrMmb49zsUHUvun1gPsplG6j6WONqH7hNQXKkymD3rmwHekyVU/nMKo2nlbA0HGVtXMQApWFqfZshxUqmvnG5qf9n54j2D1wIzLTTskcNA0gY3pUyEbpnnRFYVcdnfFr3h6cmFnPi3VGSEMvo6c5mcqlGddrT7gN1cp2XfuzKMwqoxh5AEAUDwds9jfZMFyByj65XjY/UZO69MENlytuVE/nsUW6OGUsQW2PXueEZLbAevyzPgALYPihh2m3eQSVZ3wMM4Uf5JnHlqpO/gcKp0bFrRSnO7URx0RfWsr3dr4+o/1iI7vl41kYrltYoLprfGLC0Jri0TqStYhbC+6bWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3zB8A7BFijukqjC6xGoPOJL5l8xfeQLWHlypK/IB/54=;
 b=VQvcLWCK2fDPFulu/EAkQaWENg8G+MaPNFIHJsbSdadKZ9ira8V/acQlg66A6QZ9ilhPY+dnxb4bWBeDYtBmGSWWgoMhvbZMlnMKz4oVklDZD9YDzfswWN+OTmCndtkj6UKtrlyAYSz1ZEm9SdYdX4ClekL80vrQLCL/nzLAkgvrhvC0IN8S19if9HyVlpLeB9E3dqdoMWwjVzhzUC5M8PzvBZZYgRWGGwFdrr9L1vgo+Wa8LHTqeo4rCVNXonMGLYoB/23MGG7NYYtRDKsTWNMBCXa9MNCdG2rUcuxDuvDOb6YmXIVYIlBp3yvqR7aiwMUZyU9ndPd8hO3wIWTFXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <62972285-4228-fc79-2824-1a541bc022fd@suse.com>
Date: Wed, 15 Jun 2022 12:44:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [XEN PATCH v2 1/4] build,include: rework shell script for
 headers++.chk
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220614162248.40278-1-anthony.perard@citrix.com>
 <20220614162248.40278-2-anthony.perard@citrix.com>
 <09b49900-9215-f2a2-d521-a79cf5ce5f0f@suse.com>
 <Yqm06hdvXE2caKpq@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yqm06hdvXE2caKpq@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR02CA0001.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62ae32e3-4fa1-42aa-f26b-08da4ebc00a6
X-MS-TrafficTypeDiagnostic: AM7PR04MB7111:EE_
X-Microsoft-Antispam-PRVS:
	<AM7PR04MB7111157B8A30349CA9874410B3AD9@AM7PR04MB7111.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iEx6v21EcFe5mXVFiM9AmajT5PZRXeB/r/KJIrB3ft0E/Ec3DV1XQTz47Fa/blSARGI5S5c+n/+IeJpftTdEpNZDYrOf+jzOwz8QdZV7hBsP6rRNiFbVWoNLXfhNcFRDSXAMXbpMg/hXEGMBrNYPp7RkAlnuYR9X4ai5mxQdMFGofPx/Ch1c0F6OX4PcFiAJoEabvzvlWrn+wR+/g8Ax9pfJSmtWqTNw2t2Vjr7pkETIUr5WQuTdotLBSjuuVM11dQ7GLgAZGOqlSpxWvV+tVDZGWyGaJaSX7rqgORuNwZPtvmxHpasPtJetgzlPOD6j0djZQ0G05SFufZ2hZlotZBojZX3iuWOs0RW6v3OxmHp/qUo2+e6QOXpbAf+eX3a78lGvuCwSHdiyfLPWX81Nl19dHGMNbwMt8LN7i2VXDDSZT5LoO3fTOwNJmJ6yC219li9qJxSqeQI0hsmOYlRZVDyAwmFwob27WJM65XDY57YV8uB2b02y07yLHwN/Vuf1bsxXL+CPtZcAhPgAQVEqcSabJFTyLGwCGWWrmmAuNYVJw3IoCIKWEaKa9sUmlzo0voeQDwFd+M1/XqL+9tcKZah7qW3ZwpCsb9+NM4M6KSrGAphmO83l/2VymKKqzcdNC8ZuQATB9dicnTui9K6lR5b623zItYqVk1Zh8AFzrJqQT65QzJrrb9oetSq3DjAZumh3Guz9xaItAp2wNR1UfBEPOj+dLeTiE4RcmPjdLORWfu38EshI0iRzdTuKpl4NcfV+53POMXO03d14U4T6d0tk7TxbxSmhYoRhP4ubEcs24ET2h5Ik/7GDNy7UCiGY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(8936002)(316002)(38100700002)(53546011)(5660300002)(8676002)(4326008)(6506007)(6486002)(966005)(6512007)(6916009)(66946007)(66556008)(31696002)(36756003)(508600001)(54906003)(6666004)(2906002)(66476007)(26005)(186003)(83380400001)(2616005)(31686004)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cTJEN1NiRU1pWDJpZnhhK0w2aXR3NnlDcWhZQTRBY0txWktzYXlWcjdYZ0Fl?=
 =?utf-8?B?VHhGL24vV3RiRlljTXBZTzh3RGtwMUlOVlpEWmYwQ3VMN2NLT0kybzhvZlJ5?=
 =?utf-8?B?Z2dzLzI4ay9ObFZJRjM3anlvQmhsZDM1V2F1K1hhM3VERi84d2sxKy9YSHNa?=
 =?utf-8?B?cFVrQlZZOXpzQ0ZaZmtQTUpYcXhHTEFxeGFhUWNiV1pnOWdEVXdrOTlxMVBC?=
 =?utf-8?B?eVJkRTNSWHdjZEV0aVU5dWh3Wm4xVTYva1lVYkNsUUtIU1dITlI2aHFtNDky?=
 =?utf-8?B?MHdjSW01b05MS1ZiNVNzUGZBWTlKMjM1eHBaUnZjb1dESGNsQm5KWnpCNU9M?=
 =?utf-8?B?bm1Fb000LzJaRm1hVWFGS3lYZm5UWnNrNFVLQzNPVE52S1Y5aWRGRy9jSXBy?=
 =?utf-8?B?MXV0ZG1nV0htSE9pK3Y5N0UrVjlyTXAyNXZ4MVU3Z1VGS2VqOW4wTk1mYWVC?=
 =?utf-8?B?b0pITFFxQ0ovVnZpUURlL3VGS3N4NktIbHlMdnBGUWpnaHJLYitJOU41OUUz?=
 =?utf-8?B?eXkyS0J6aFVkeVZrZ0gxZVR2YVFHNUl4Mm1SRzZodzcrYmFLRVhZcHplOEFP?=
 =?utf-8?B?eHNZWkpCdlNsUTFDZlhiSm1XVUJqUXZleFlPYkRJSUt0UnhYQUl6SnZiYUg3?=
 =?utf-8?B?QlZzYkZXa0ExR2RFZTh4em5kbkZSRFgrUVc0UXVKc0FvRmQ1TFlNUWJNSDJa?=
 =?utf-8?B?K0I2amFRVDk2bWdrVTNWcVNudVBtNkRiZTZjdUw2WllpL1R4WjlBT0NzdFly?=
 =?utf-8?B?QXBOTCs3M1pGZE8wbnc2c2pOaUJpZjZMWUplYVQ1NXQwWU05NFFDRG1XZHlo?=
 =?utf-8?B?d2dxOXpmb3NsZEtzeTNwd0FON0NPTUFwM0pSd1IzME5uc1hVMVIwMGQzd1Zq?=
 =?utf-8?B?VXJIeGpIREdUajg5VGpPMnZhblJ2TGFRamVEWTRPNnBrL25teGdnWnNTU3By?=
 =?utf-8?B?ZnpqWGRRcWF3K3EvTW1kU05HMUxqZ0VGb2pVdnEvZHhsb3RpdmNRN1lSNTNT?=
 =?utf-8?B?VkFmNE91Z1ZWSkpoSjVCK1pNVmN1OVRYdXRoMUIwRm56Snd1YWVZZC8vVmt4?=
 =?utf-8?B?TCtzZkJjVkR5WndLZitqNis0NFdaTW91dkZNV3dyOHUwaUhiOGJIbzJ4RTNQ?=
 =?utf-8?B?cDd3M2JZQUVjMlRhbGtJRlFsSzZPeFVmcS9GZm84WFJLd2orRkFJUC9MWUlM?=
 =?utf-8?B?MDFJZjAxT1pnaFM3V3U1Z3NKRENvWmtZcTdmcnlSVTdMN2poOXdGL0dEVVdk?=
 =?utf-8?B?MHRYa2RKRHN6N09nb0YvWXFxbHpBZ0UvSHlUWjlzelVNeE1hajNTc1N5ME5Q?=
 =?utf-8?B?YnhVNWxNekF4eC9zNEsyZlZTK3pwZVZsTUkzcmRwV0ZBN0dFUWt1cGovdjRh?=
 =?utf-8?B?UVEzNURpaEZ0dmtEWjdlQ2dUekEzYlA4cVRkYjlNTkRvODB6bEJTR1d0YndB?=
 =?utf-8?B?VWFNMGZ5aDZqRDVtd1Q5Y0pqbXFYUUdUbmVmWXUrREVEOVpMbmdjcmZFTitF?=
 =?utf-8?B?WmN2Y2NwUURENWk2SjhIODlJL2M1YTZ3L0FtUUJKdUMxNGxQbWRBeVZRWmM5?=
 =?utf-8?B?WDBmY2VwalNrU3pnNnhWaS9uN3h0SXFFYmRlc3JldHJaTnplNEdWMk5DTnpw?=
 =?utf-8?B?bk50UHBlaEZVbEt2b2cwa0Q5ME9yRWNjc1huZVRGMmlyNDdCb0dDdERsMXFK?=
 =?utf-8?B?NU9oRU5ZSDdZR2hDc3NqTG50S3NMdC8vWnVUQ25OYzJwMUQ3ZkM5bENGRmNa?=
 =?utf-8?B?VVQ1Y0tuRE1ucFpoVmFPbFRmWXhYZ3hXZ1BiTzNVQTVId2hWTkh3SzVDQnBZ?=
 =?utf-8?B?cDF3UWpGQUFPMkJlelB4L2VHUEZtUEFrSGhwd3BlZlBScEZKcmRxdzI1RUpw?=
 =?utf-8?B?UW93ZDlUMW01TndEbTRuV2FyZ3BhMXVhODQrQ3ZBSEN2dFRtTW9SR2J5WWlm?=
 =?utf-8?B?U21aMTUvTEVWcEN0WGh2T2c2cUx0MFlnQXV3OXRpSytJQ2kwQzJiMlVCWE8v?=
 =?utf-8?B?VTczeVlVazhkTDVPN3J6U2syQXJsUUZsd3JGSFB5NEJTUzg1ejh2VWR0NU9X?=
 =?utf-8?B?UDNyVDVjY2EvZWVZa2k1QVI1VzdVK2FPeHdHb0VLMlNqN2hPTjlBWUNzcm9u?=
 =?utf-8?B?Syt6ejdEVUx6NkllK2l2aDBNNW1sdHdqWTdaM3BPMUV4R0hDMkF6WUtWbmVk?=
 =?utf-8?B?d2VYeGdnQTR1bDJSRWp5b2xody9Wbjc2d3Rwa3NIK1M5bEU5L1V5cUo1RWlZ?=
 =?utf-8?B?a09yVDlZZSt2dEpKUzJSaTlxQ0RqQ3NlMzk5R2xkcEdvTzdxbWNKTm1oSUF2?=
 =?utf-8?B?ejhTcXBzZTFya1EyRzBEeWNPMVN2UEViK3dBNE4rL3Z0RTVUVDhDdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62ae32e3-4fa1-42aa-f26b-08da4ebc00a6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 10:44:19.9668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pQ+j8ReDrq1i0wBDnjLqqve5W0eRM7hq20PduFDDur1YPvtTHm8LaYSoUk7bmr3elKW5rrKVF+NORfeVvlDxyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7111

On 15.06.2022 12:31, Anthony PERARD wrote:
> On Wed, Jun 15, 2022 at 08:37:42AM +0200, Jan Beulich wrote:
>> On 14.06.2022 18:22, Anthony PERARD wrote:
>>> diff --git a/xen/include/Makefile b/xen/include/Makefile
>>> index 6d9bcc19b0..49c75a78f9 100644
>>> --- a/xen/include/Makefile
>>> +++ b/xen/include/Makefile
>>> @@ -158,13 +158,22 @@ define cmd_headerscxx_chk
>>>  	    touch $@.new;                                                     \
>>>  	    exit 0;                                                           \
>>>  	fi;                                                                   \
>>> -	$(foreach i, $(filter %.h,$^),                                        \
>>> -	    echo "#include "\"$(i)\"                                          \
>>> +	get_prereq() {                                                        \
>>> +	    case $$1 in                                                       \
>>> +	    $(foreach i, $(filter %.h,$^),                                    \
>>> +	    $(if $($(patsubst $(srctree)/%,%,$(i))-prereq),                   \
>>> +		$(i)$(close)                                                  \
>>> +		echo "$(foreach j, $($(patsubst $(srctree)/%,%,$(i))-prereq), \
>>> +			-include c$(j))";;))                                  \
>>> +	    esac;                                                             \
>>
>> If I'm reading this right (indentation looks to be a little misleading
>> and hence one needs to count parentheses) the case statement could (in
>> theory) remain without any "body". As per the command language spec I'm
>> looking at this (if it works in the first place) is an extension, and
>> formally there's always at least one label required. Since we aim to be
>> portable in such regards, I'd like to request that there be a final
>> otherwise empty *) line.
> 
> When looking at the shell grammar at [1], an empty body seems to be
> allowed. But I can add "*)" at the end for peace of mind.
> 
> [1] https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_10_02

Hmm, indeed. As opposed to

https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_09_04

> As for misleading indentation, I've got my $EDITOR to show me matching
> parentheses, so I don't need to count them. But if I rewrite that
> function as following, would it be easier to follow?
> 
> +	get_prereq() {                                                        \
> +	case $$1 in                                                           \
> +	$(foreach i, $(filter %.h,$^),                                        \
> +	    $(if $($(patsubst $(srctree)/%,%,$(i))-prereq),                   \
> +		$(i)$(close)                                                  \
> +		echo "$(foreach j, $($(patsubst $(srctree)/%,%,$(i))-prereq), \
> +			-include c$(j))";;))                                  \
> +	*) ;;                                                                 \
> +	esac;                                                                 \
> +	};                                                                    \

Hmm, not really, no (and it may be more obvious looking at the reply
context above): My primary concern is the use of hard tabs beyond the
leading one (which is uniform across all lines and hence doesn't alter
apparent alignment even with the + or > prefixed).

Jan

