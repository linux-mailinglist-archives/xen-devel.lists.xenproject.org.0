Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C38764E74D9
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 15:10:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294770.501357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXkeB-0007j8-71; Fri, 25 Mar 2022 14:10:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294770.501357; Fri, 25 Mar 2022 14:10:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXkeB-0007gy-3n; Fri, 25 Mar 2022 14:10:35 +0000
Received: by outflank-mailman (input) for mailman id 294770;
 Fri, 25 Mar 2022 14:10:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=73hT=UE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nXke9-0007gs-DC
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 14:10:33 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54f81e57-ac45-11ec-8fbc-03012f2f19d4;
 Fri, 25 Mar 2022 15:10:32 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-Hor0Mtk4OpOnBPqGt5jySQ-1; Fri, 25 Mar 2022 15:10:29 +0100
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com (2603:10a6:20b:424::9)
 by DB8PR04MB6363.eurprd04.prod.outlook.com (2603:10a6:10:3d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Fri, 25 Mar
 2022 14:10:27 +0000
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::5413:50c3:f5e8:d90f]) by AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::5413:50c3:f5e8:d90f%9]) with mapi id 15.20.5102.018; Fri, 25 Mar 2022
 14:10:27 +0000
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
X-Inumbo-ID: 54f81e57-ac45-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648217431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yaNnS2n/i0Q3uNjcxUqxb/chRzneWFMAJAx8oPLdlq0=;
	b=ZFszm2B91rXil7tqGtSeleqPc1rlum2oBIfnEywCFaORYQPP2zHu/8hE6hdR1RUtyiFrWc
	iyQEOVOIYXqJpEhVabAzkQLOgfhb04nxbmHlBEw+VAzy03gDegmrp5ADoA6/wsj6YQmVl4
	bG363D7iybHLSf0RpAVY0iZYMamkQJ0=
X-MC-Unique: Hor0Mtk4OpOnBPqGt5jySQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTiZfKLdHqh4JJpXWOdbw5wvlwW5rejaLn0vfdNL74UHNrWD6LaWQyd67CETFcACD4ZvBP2AFE0GBMOiJWkaJS+tkmbGKrGfzYPdNTTMkW123yBhXPJ6cGCg4IOnNc/O5WlYvWd72auZwHZDab7ddBjYENR05JXSqtiDgJABGny5EWcgltyVP/NfCYa2XiLJO/83qVuqU6PnBLNdQCAcgXn6p2T3ZqaPpuOuCiB8YdQzZ3sdIdL7tP+1A7HnB6QP5J7Lppvx+D+W53YuWyChgsObwOrJmkGx4iQcDHjmR//FU3zQZOEMwyZlrcKQvBmADlLiQm1J95nVkqetFO9YuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yaNnS2n/i0Q3uNjcxUqxb/chRzneWFMAJAx8oPLdlq0=;
 b=TQqd17WmD5gSRkaUtBgbKynSv7gYuUp+JA8ZjQHSmDg2+IqS833Bu0ng/7QcEPOaFBu5SmNom+e0w7MHOgfeZZXV8I+0NxemmJvQY+HaQxaW4zJxtp+3WQSHLAU8v6F29Jlo4mdZirMsyMGNElOwvwCU9Mt1A8IynTIuPHZIyQGz95m3TVjgja6pjrE1ct/JEPRUu27/Sz10c4zP95zHUtkJQLLvAvvywomFEdT7c/w4Q/LU32p7zzhl+AHH0wcKFVPU3g7XkjYY1mMUf2UNKbLBMBZepcYM0o0x1Br5RNGLBbNvCNQ1fVS4acgYFcBcsSP6m/LGjY0NKtQAo0OaIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d9378506-1686-169a-0eb0-0076910e98bb@suse.com>
Date: Fri, 25 Mar 2022 15:10:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH] xen/build: Add cppcheck and cppcheck-html make rules
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <Michal.Orzel@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <77c79e86050eef2b706ee11e64183d57a0f5bcee.1648119732.git.bertrand.marquis@arm.com>
 <d797474e-97c0-7545-c68f-1378a3b2fbd9@suse.com>
 <E6DE6BBA-EBA6-4279-A79D-22942D6F5840@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <E6DE6BBA-EBA6-4279-A79D-22942D6F5840@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0082.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::6) To AS8PR04MB8609.eurprd04.prod.outlook.com
 (2603:10a6:20b:424::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e5b34b2-bcdd-45fe-8cd3-08da0e693668
X-MS-TrafficTypeDiagnostic: DB8PR04MB6363:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB63634964260E3014C655218DB31A9@DB8PR04MB6363.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0dK8kmCgN0gLYsDhisRJjCnlOucsD1AUKoDEY8TlUprXd3kkE9bx5O+ePE38LP8TIRAV9wqmwwzIGgMsrFPHqU2qVZaJmF9121bj2qSckSCZ1esqbTp/dMu9L8v7ahtIJH8w+utgD9wO7JfFi2OVKpjugyAs4EvT9a3YfJ9e3s20NEPsqmmpyOlsuuYlSg8KFqwGtYNSecy/uH1+b4k5ErQC/668+lxpwSTsnZyJ8SxyJ8YUssgwqnzD04vb8p46pNpQtzWs+Fs0uzYWoxijoUt1n/aazK/JZHEDU6n+7nqpSNZ9+Ny9vUmwc03wd2iRAIRpECojWM00eqvOdGXrvIjx5LMBgA5N51ne4uW/oh2LETdqNVjyd18pxWbbQcMXuC/yMVt/9fI0jJJs6Fz7wkdQ3yjoWcvfsV/f7jufVQ1t/ZQnAckNuaiFLMS/sm8Z3uvOdHLqs6J8fZ/hu0OqcjSEMu2KmsfCcpM8jcxkSafpKsPyuS7H3YKF+mhhqQ6hwAFVcTphoIj3VICc/8klsbi1V8jPrQXeMTxbbseeV3q/w7K7q0l3zvC9m01lKKTk/aK/COrve4MFAa6w1Fw7TgvEeuPf2oYZDwlcecUjW4qkX3GHzW59A1TFlyk1zOMhHMq1iqo4n+k1zUujBGYGJQsICkXvDP1GltmFe8qkY1ExvKNGV6azyOrNx9YJ0GaPOh0kgwnAC0Q5EABHv64Li6DTrsjdqj8P7sW0YJ7CIgM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8609.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(26005)(6506007)(6486002)(6512007)(2616005)(66946007)(53546011)(38100700002)(66476007)(508600001)(66556008)(86362001)(6916009)(316002)(54906003)(8936002)(2906002)(36756003)(31686004)(8676002)(5660300002)(31696002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDlYV00wN01yV2NhMngrTFQzTkxXUkZxcTRjeGkwaVFHRW9yNWRzOU1lQWV5?=
 =?utf-8?B?QTdhQmhKcFA3L0grZG0vRy9NNEFIanJTYnFaa2RtVEZ5TGVaVUU5b1dhWVEw?=
 =?utf-8?B?bXJNRmNMWGI0MEEwVzNsaklWRktPUFpEc29uUUcrTlRDZlNTSk9tUkVBVGdu?=
 =?utf-8?B?RlN5dUFuVmxJd2VXQXZwRVp2bERlajB4bXdsRmZGZXh6bEgvY2JQTzBKa3R1?=
 =?utf-8?B?VFhxaXN3RXo3NTVQekEwdDFEVS90NUgxendySFNzRW51UXNjSVQ3YlJJVlZN?=
 =?utf-8?B?SURiZEQzRklDSUg3eHNKR0w5czRLbnNRei94U2E4b01zSmswbmQ2a3ZBNzR4?=
 =?utf-8?B?aGJXT0NBSEVDN0dSY3pBY0lhS2dEYmxBcGxVdmErZVRoOWREaWVmQjh3NnVQ?=
 =?utf-8?B?SjlMSU94eEoycVJTZllwbWpVamlEcG14azR6ZmNQWmY4L0R4S0lRakptQ1lV?=
 =?utf-8?B?Q2o2VDR0SW1pUFN2NU1JZHBpdmpOR1Rkb1ZDdGJvOGcwTDI1cnpUMjZ5b2tn?=
 =?utf-8?B?SmtOYWdSbTlUejBmdkZQMWprU1I0Y1d4QTVLQ3Yyc0tIYkl4ZTExaitUalJ3?=
 =?utf-8?B?V2RPMGZINnpmWmhWYU8zSjBzUHhBeDV3TDNPUmJsdm4vekthR2EyS2RGZ1lk?=
 =?utf-8?B?V2lvSFAxZkRSYkJrK0Nma3AyQ0k1ZmtrRGxGUC90UktVa3ZKc1pBRlloRWpL?=
 =?utf-8?B?RWZLcVNvS2EyaGN4MU9FVG1xNXJXcTZ4aWZmTHZSd1RFa1k5cDdaWkJwak9o?=
 =?utf-8?B?OVdLMWtsYkpNcnRSVklZTGp6RHBZY21sTExpa3pML1l1dDg2UzZibVFmWEpN?=
 =?utf-8?B?QkMrNXczbkxjZ2ZFc084R3YycDdsU2tIM1dTamgwSzN4Rk5tRVJLVkRLTURW?=
 =?utf-8?B?UTJtcWE3RVp0a1J3amFXMUdXVy9wUVljWUY3SU9BTXhWSlpZci9HcWxBQ09C?=
 =?utf-8?B?dmtIcVUvR2xkVnhRWDE4YnNYS1NDYWs5aFFDdjV5dDhzMGZqK2lZdGxYcmpx?=
 =?utf-8?B?NHFLMHJaRzQrbURuc24yQ0ZDMFdlaUgvSFZjbk5VbkZmU0ZscS81TDBsTTc0?=
 =?utf-8?B?ZDJWaHpaWS8zZ1NrK0RnbHRIKzd1bHJocEJMNE5rZWduaXJmYjhMRXlkZnFU?=
 =?utf-8?B?aHZMSW9nWXpqVnAxN1JoK2Q5c004Q3JCeFkzdGRXMHdYRkcxd3VMcUNnckU0?=
 =?utf-8?B?eTFCTGQvNVpuUFA5RG4zWnEyeXovQjF4SERBcFJjU2lnMVlCNmRPVHFDZTdB?=
 =?utf-8?B?MGRXQmYya3BaeGZ0VlVsS25kbFlTVjBSb0ZxTTgvdEFiV3l2MmVIS2FZK3Jp?=
 =?utf-8?B?eEt2eWcxWU1zSmtnTEhPN1hvY2MvcGJDdHJrNWFYRHFTaTc0dHZFNFFzbHlE?=
 =?utf-8?B?cTRRaVVtWXBubHJCUGtXcWdEZWtDQ0NOMUFUQ3ZxdUJGY3lnc1JBbXZtbXF4?=
 =?utf-8?B?LzNONXVmL1c4VTJXQS9JcGVsTS9XT0Z2bmdJWlhiY09KR1ZsbG9tZHI3a3E5?=
 =?utf-8?B?K1NYS2tyK3JDNDJEclU0bFlwRWRBaHFaeVdDM1JCOHFRblBMeXhTcXVVblpt?=
 =?utf-8?B?RElKS2ZPempzdXp4TWsvbXF2ZkZmdUtOdTVsRm11bXF6WEtXL1cwZ0YxUWNN?=
 =?utf-8?B?Z3RIRkFOZk1HRkJtV0NpSUVlNW5ETGREeVV4d0NRSmNvZUl6aS8zUVBDZ3dN?=
 =?utf-8?B?bFRkYUJqSzRqSmoxSkxLblhBMzlEcVFYczk2NWhmY2lWOWVXYXR1ZlJ5aWtR?=
 =?utf-8?B?cG84Mlh3RWh3S2M2ZlpwK3VXWWNVZmJQa2pkRFhhK2Rkd0hxOGF3dkJ5M1RH?=
 =?utf-8?B?U0dUM3FaMUh0S1Z2L2pQRnErVkpGOGMremUxck1ZL0YvaE9yZDRyREVzbVR5?=
 =?utf-8?B?NUc1M2E2K0FWYUZnY3VqVHdLMmpMZmU1SW42c3owSGVVWGljTi8wU2RSMVhN?=
 =?utf-8?B?ZnR1azNIQUtaKzRvSFlmeHpEdXl0M1dHWUtjQmlwY0xoanZhUE96UFV4VkhN?=
 =?utf-8?B?UFdtNGxNR3ZzNndIbytXd244d3pNZG5QZWV6aU8rWC95aWROVk14a0xtSEs5?=
 =?utf-8?B?OTRtSDl6KzFob2htSjJ1VHVvUnQvRXhsbUk3YVNiUS90QUpYRi92L3dRV0lx?=
 =?utf-8?B?L2lPZ0dvWnFSbTZpWE84b3FIcCtid1BsTXYzS3MzOGhMWWxqdlRCR3BYcHBo?=
 =?utf-8?B?VFZ4cHhtVzRXN2NzdFZNelVIUldneVJFaFQ3UkZzTEZOc1lNdjNqTy8yS3Ns?=
 =?utf-8?B?SkZlNHJBZm1HbjJwalJROHhvZjVrU1YwZGd2VzRjU0d0QlVjNTR5WkdNZzVR?=
 =?utf-8?B?cjhaR2MzVHlrbTNWZFgwcDVnc29FSVVBYmdpWHQ5ejFGOC90YkQrQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e5b34b2-bcdd-45fe-8cd3-08da0e693668
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8609.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 14:10:27.6502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RJ6JAQviE9xh3yRBB+tm5GD6pOCgSvD0OwZrnBsFNd8J9MYzghVMqRFITpaiwAHhcV3JzBTemmLpRh3+4uYTQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6363

On 25.03.2022 13:57, Bertrand Marquis wrote:
>> On 25 Mar 2022, at 12:43, Jan Beulich <jbeulich@suse.com> wrote:
>> On 24.03.2022 12:04, Bertrand Marquis wrote:
>>> --- a/xen/include/xen/kconfig.h
>>> +++ b/xen/include/xen/kconfig.h
>>> @@ -8,6 +8,10 @@
>>>  * these only work with boolean option.
>>>  */
>>>
>>> +/* cppcheck is failing to parse the macro so use a dummy one */
>>> +#ifdef CPPCHECK
>>> +#define IS_ENABLED(option) option
>>> +#else
>>> /*
>>>  * Getting something that works in C and CPP for an arg that may or may
>>>  * not be defined is tricky.  Here, if we have "#define CONFIG_BOOGER 1"
>>> @@ -27,5 +31,6 @@
>>>  * otherwise.
>>>  */
>>> #define IS_ENABLED(option) config_enabled(option)
>>> +#endif
>>
>> What are the consequences of this workaround on the code actually
>> being checked? Does this perhaps lead to certain portions of code
>> being skipped while checking?
> 
> Cppcheck is not optimising the code but looking at the syntax so the
> consequence here is that cppcheck is checking some code which might
> be optimised out by the compiler. This is not optimal but still it should
> analyse properly the code.

Aren't you saying so merely because all uses of IS_ENABLED() in our
sources so far are in if()? It would seem to me that when used in #if
(as can be found in Linux, which hence means could be the case in our
tree as well sooner or later) sections of code might either be skipped
or syntax errors may result. Or wait - IS_ENABLED() does itself kind
of rely on the respective CONFIG_* to expand to a numeric value; when
expanding to a string, I guess the compiler would also warn about the
resulting construct when used in if() (and reject any uses with #if).

Jan


