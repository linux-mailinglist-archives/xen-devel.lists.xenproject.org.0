Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A5F597110
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 16:30:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388984.625774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOK3M-0006k7-UM; Wed, 17 Aug 2022 14:29:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388984.625774; Wed, 17 Aug 2022 14:29:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOK3M-0006hV-RW; Wed, 17 Aug 2022 14:29:52 +0000
Received: by outflank-mailman (input) for mailman id 388984;
 Wed, 17 Aug 2022 14:29:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U7n3=YV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOK3L-0006hP-CM
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 14:29:51 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2043.outbound.protection.outlook.com [40.107.20.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d0bb75e-1e39-11ed-bd2e-47488cf2e6aa;
 Wed, 17 Aug 2022 16:29:50 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9427.eurprd04.prod.outlook.com (2603:10a6:10:369::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.28; Wed, 17 Aug
 2022 14:29:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Wed, 17 Aug 2022
 14:29:47 +0000
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
X-Inumbo-ID: 0d0bb75e-1e39-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6plZabQs8vGsIxp1Y/9RMaxia+LbleTd+MXt9ihkD3xNl8BknBDfttx4l4UtpJZJIiZflAIAmx1FJatFpw9ndaBnh+ggp16on7u/nd0RbTD1o7WmfXonEE3EVaJKns6GWmAmmgb7ZyKQi7dD1EhyFB6OYtzdk0xHR+BedEnqe1r4VtDfUi+HacFK9/150k46ZvEbm2Bl1h4hMG4hBt7dcWz1CsghjXQs3AN/ZkrgpkyT1Jwg2opJR8eevcU+k0DA0ATq5SGrzJ4DjlV4SS+9DYewLwR+Qdka/1y1GCUdwNLg5KuPM+C/FHWzkk68dIUnt9CvTE6HB1wRfy/ORZOag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DZJKcAwlEU1qoI2pdE7e9hyJXL3XadLkHJccRGdxfV8=;
 b=S38kdqsLNKD4P6fo4PhH5Z13oUfZWQC65YiIwnhW9oB3RMeJHcJt7BdIKXUAFI/4E4tSRYebLgV5ZlHmoVQ0cAeSP9dxqB+zqRnL5yA/QhEFEpySqpMI5EO1ItEU0wjRBOaaJhVnbnVLQzbVfcacdsUfTV02tyJx5KYvq6YewKoMAcqsWr4x1I83TjEVtDWqH9nVNjr1LKZsGjWZ+H2XDWfTuKnWaZUBIK7CEjP72rTX3E7TL3Dl75NCr9CEaxjN6ePTNCZfQjze7mGLiMF4bTZQnsGFFSRj/uwe/eE7673QZF7IHv+vY3AL74rSc43cONvgigRMN006T5baQMKxlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZJKcAwlEU1qoI2pdE7e9hyJXL3XadLkHJccRGdxfV8=;
 b=FSEDlyA05wTbBwrP8RZc3N40pp0CtzRU/wz8jGUTHAG7DPcfOfTpkhnuJASBQEq5CNjcZ1OZbBa62MT9nqMD4mC44fFhbjUZQ4AuKouXsQnNYnrvXgtZQ3LGPs9st50AuUSsnCgbrXPn2fUKXSbFam6af3MFf0hZFPjqeJBDtH2ysuOSmogJIxL5o/SpTF5RdVZtpRd8Jnz8155IV9fqwelZ1i29OyVma9Mrrs4iG9SGq30JSE6Er9a60DL9CoOJWlL1UBY0wmElikilrnd4Cbr9E0cdepH7FOQTYqqg3I6AFk2hMT8r8nVgB4h0+kM3htYx6l4bunlvNqK2snuXTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a2a517e7-dd38-e0cd-dd23-7071bbf237ab@suse.com>
Date: Wed, 17 Aug 2022 16:29:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [XEN PATCH v2] build: Fix x86 out-of-tree build without EFI
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220816103043.32662-1-anthony.perard@citrix.com>
 <20220817091540.18949-1-anthony.perard@citrix.com>
 <e2d3cc4d-4b5e-560a-53f1-380d260a66b6@suse.com>
 <Yvz3Yuc+gqcKQ59R@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yvz3Yuc+gqcKQ59R@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5440c310-8539-465b-c3ee-08da805cefd7
X-MS-TrafficTypeDiagnostic: DB9PR04MB9427:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h77vigwv0xVX7lu7zasNfGYdhcXSeB3z7l8KCLhSVfk2w+vIZfrVcrKG+c7LRr7Arw3ymQ7iZ7wbOLUW8luG54bgjDAmZhJqTIYdxvK2BusRgMIukf1PGkdJEJX76AqEV1ll+qM3BOToQ4cStcmzLjzrKzv/qaN/4PR87AWqq+A5tQQgHnNIHEE6NeAto4ZbyGb3wWnLYTOn8B6+XR4r24nC/Ym1nB1/btqQo3KBY/j8suY2FogY1QiYSQnHBNNJqvuCysLbKyZtUnhuN96ZX9QmX08mLiB83xxmbTTCquN7hw46cI6KkRBFRLppZzM7pXyzBA5WYZmLNUDKG4JH3vmxAlCLWnYIok8YNH+IFZBI8XwTTwX3xlOmBkXO/7zZCidc6RDKHkEo4Fz8hTfZY22+HgYSa1TUdOmxVaHS+WLQIqiwOxvGgXiYGKpz28W0CGGLvX8UV9P+Jkv7aDAopzSB9LKTQxPxUEbih6/ghSuke5Tg6NUDEmyWsF+WskdZDbqjjeojwQoUi+LA0WirGKiwVybMRLFGqejB5MQUObxbh5qUusuVtZWF47Rz9udMHuiKF2oaNMJYotrPrXcFf2S6IQAwkwI2+xoS11B4BDz5Xql9VaVS9yDasNVGt6rojCQpNOM5Nv6BbzM5rIY1B5vOwUttJ8F2dGewU8MKyywgH1rvj1Eo72zOQKEt3H0yxOa8ZzenKTUI4wPcXg7bOS9oG5SNbty7yCHznfw/PHxkToUG6qONDsbG8YGLncyP8/7+jTgOp8whsd6D+Rfl1hczP8SpLdD6UWRk9hbtw8LERxUXF1P0QgudplDl7KB1Qrp4J91EwJxILxoRimKd2g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(366004)(346002)(39860400002)(396003)(6512007)(31696002)(478600001)(5660300002)(6486002)(8936002)(31686004)(2906002)(7416002)(6666004)(6506007)(66946007)(86362001)(8676002)(54906003)(6916009)(316002)(38100700002)(2616005)(41300700001)(4326008)(66556008)(53546011)(26005)(186003)(36756003)(83380400001)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2E2U1lhWVF3dGhmcExBTkhhblhJV0JXMks4dTNuV0k0VlJ6VzZWR2h1dlhl?=
 =?utf-8?B?ZlpEWkRLeEZTMWVZR3l1bnBPMFJRb2hXQ21zQlVmeGFvejljVTVvRGVJNUJE?=
 =?utf-8?B?Wnc0NWxiN0VTc0JhMEwyaXAraFhoWExXcUtKRzhZTWFpRndSRVhCcHdQMlJw?=
 =?utf-8?B?TDVCdHBHVW5kTUpZSVVpSHF2VzZoRlpCUTlLR0laTWw0cWUyL1pjS3duNUQz?=
 =?utf-8?B?ZGxMMGV2QW5LWm1jK3N0d1l1RnZxR1Z0SkdZKzZjQml5UUc5THdXVVNpa0RC?=
 =?utf-8?B?bGYvS216K3RENCtYYnhBaWN1SGNtbStKWW52cFQramZIK2txNXpKUGI3dVU5?=
 =?utf-8?B?SXBwL1lsZFNpZVNEaHlrQUxPMjdKR09XVkl4T2p1cDZxQlIweThBS0ZWTEp2?=
 =?utf-8?B?TXJlWmtnSFFXVllHSUNkLzZnNkpwV05pdlNjOVE2R29VR0xTb1c5MkhJVGRY?=
 =?utf-8?B?SS9KVkw3YVRFb1JLSTV0Ylo1dHVLVTE1ZjV3bXZPdytuSHRwclFFeTlpTHVX?=
 =?utf-8?B?YVRWMC84dEEyancwdXZNQ3lZaUFQWTB2TkF1WXpoUUxKd0hKY0N3enlCcG1j?=
 =?utf-8?B?QUJrK1pSRzQ3VXUzbC9zWFh6TFRVenlBcysvSkNIKzlmeUVUMDFVVXVBbWRh?=
 =?utf-8?B?U05YVWdGTmhEWXVLeFVsL00rQ00xcDBUOVdwbkNObE9kU1NWb2tKZVRuMm45?=
 =?utf-8?B?QmZjVXZCT3k5WStQbkQvaFlIbDV4ZUtiRHh4MDRaVEZtdm1ra213dkxydFk2?=
 =?utf-8?B?ZklOOThXVTAvRGIvTXpHWFlOTnNoMmFKNjdJQ1pqank3V3E0YWw4SWd2dHNN?=
 =?utf-8?B?anFxT0JlWGFGMlpETytRVUtWVmIwQ0FpT3pyMTFwZi8vSDJFVm5pQ1lyTjFm?=
 =?utf-8?B?QlFqQVl2V3oxS3U3VmVnb0NsSm8vSUc0YVpicExiRFJDNzVVNUErQ2NjbXdU?=
 =?utf-8?B?ZGRqV3VCZFpqNXg4aWhVc1AzRTB3aVJOd0JWbWN3bms2Q29LcEhsWS8vMUtQ?=
 =?utf-8?B?cDNhbVl2c0ZmQVBRNmthV0lsQXd3RE5DS0dmTTRlQU9FV3JOcDhKUndxY0Jy?=
 =?utf-8?B?S0ZRbzYrK1FMVDRpdWRHdmZjVmluZXM1MTBtR1dheEtlVXRGZlZXY2hYcXJ0?=
 =?utf-8?B?U1VqcThsN1RTandpYWFiYTV4OFBtUTNjZ0h2a05tTXRBTG4wakErV25jcXdY?=
 =?utf-8?B?QUljV09TeDRqV2NYbmovR1VhS3k3cFAwcW9xQU95YkZLekpVcVZkZjFTVzh5?=
 =?utf-8?B?SENIVnJaREF5SGdrV1JUZ0x1QnlZRXVOUUs2WmFyVFV2Z2M1VlExdWZYNlBG?=
 =?utf-8?B?bTgzNndoT0JOcDVEbW4zN0pSaXErVGtWN3ZFSzF6M0w0UzdGYysyMmZaaUkv?=
 =?utf-8?B?cUw0WnZwNWptaFdSQVd5Wk5OQ0s3SkpIRXE0MDcwWVZ4T3pvYUc5SThjTC82?=
 =?utf-8?B?M1ZKWGhuMU9oTHJPNEY4bG56RXVwNmkySXdYdFFRS1V4ckpLcXFWcHdRczRC?=
 =?utf-8?B?TmZYRGQxUlNQTEpwYXh5ZW96YWc2VEZ0UWhETDkwSXBwMkhIVEt4NHNYTzUz?=
 =?utf-8?B?eTRsSzdzT3RodTVXNUV2QkRya1RFSEJ5UTJLbzRXSWQ0bVNxaDBTN3lsTlFn?=
 =?utf-8?B?Yk1aWTczRlo1ZzVFZUdHT3o4WnRrZmx4bXVvaEYzZjh2SDdzdlE0cnBpWFEr?=
 =?utf-8?B?bDlxRTFON1dSSnFyU253bzErb1c0b1NoNElHR3lRa0psSzVxVTBKNFpFRENG?=
 =?utf-8?B?U2NxVnlqams0NDI1dTRqZGhHaGxkNUhlMUttd2RuOTQwUUhIQ3RCNHBSOGt6?=
 =?utf-8?B?dlU0SEpSTzJ5RDZjY2hPZjNYOEdsQzU1K3MvT1JQZENITFRURE91YUZDYWhG?=
 =?utf-8?B?bTkyV21EVENDZ1BqdThPWnNhY0pUQURrLzBpRTBpRHNDSVczaFE5bWdmS0p5?=
 =?utf-8?B?YmV4bHRiQzVtLzFVMGVRQnVOL3dnaytQajVUczRNUkJYeDZXZnV6TEsvMFBM?=
 =?utf-8?B?czdZZnhnR2J6a0tCN25Ydm1XS3hYY1hMajJWQmNkWUhSazBxb2Fyb0E1d082?=
 =?utf-8?B?ejQ5akdZN1Y4ZHZKa05SMVRLMi9EQ1Rod2R5bVZqekhPeHBaanBlK0F0YmRR?=
 =?utf-8?Q?xBRhZB7nsTYtrztGEWKFS+fPG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5440c310-8539-465b-c3ee-08da805cefd7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 14:29:47.6681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uix5rurrdU4wNobLUqjb5er/WRwj8hhIibUtHYd9jjU8lX8U0fBt5H1i43PB8fZVL5QMERt7k4KXAOzDVHEhVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9427

On 17.08.2022 16:12, Anthony PERARD wrote:
> On Wed, Aug 17, 2022 at 12:38:36PM +0200, Jan Beulich wrote:
>> On 17.08.2022 11:15, Anthony PERARD wrote:
>>> --- a/xen/common/efi/efi-common.mk
>>> +++ b/xen/common/efi/efi-common.mk
>>> @@ -9,9 +9,9 @@ CFLAGS-y += -iquote $(srcdir)
>>>  # e.g.: It transforms "dir/foo/bar" into successively
>>>  #       "dir foo bar", ".. .. ..", "../../.."
>>>  $(obj)/%.c: $(srctree)/common/efi/%.c FORCE
>>> -	$(Q)test -f $@ || \
>>> -	    ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/source/common/efi/$(<F) $@
>>> +	$(Q)ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/source/common/efi/$(<F) $@
>>
>> I'm afraid the commit message hasn't made clear to me why this part of
>> the change is (still) needed (or perhaps just wanted). The rest of this
>> lgtm now, thanks.
> 
> There's an explanation in the commit message, quoted here:
>>>  The issue is that in out-of-tree, make might find x86/efi/stub.c via
>>>  VPATH, but as the target needs to be rebuilt due to FORCE, make
>>>  actually avoid changing the source tree and rebuilt the target with
>>>  VPATH ignored, so $@ lead to the build tree where "stub.c" dosen't
>>>  exist yet so a link is made to "common/stub.c".

Hmm, yes, I had guessed that this might be it, but I wasn't able to make
the connection, sorry.

> The problem with `test -f $@` it doesn't test what we think it does. It
> doesn't test for the presence of a regular file in the source tree as
> stated in the original tree.

I didn't think it would to that. $@ is the target of the rule, and the
(pattern) target explicitly points into the build tree, by way of using
$(obj).

> First, `test -f` happily follow symlinks.

Which is of no relevance here, afaict.

> Second, $@ is always going to point to the build dir, as GNU Make will
> try to not make changes to the source tree, if I understand the logic
> correctly.
> 
> Instead of `test -f`, we could probably remove the "FORCE" from the
> prerequisite, but there's still going to be an issue if there's a file
> with the same name in both common and per-arch directory, when the common
> file is newer.

This would be a mistake now, wouldn't it? I did add "(still)" in my earlier
reply for the very reason that it looks to me as if this change might have
been an attempt to address the issue without any renaming.

> So `test -f` needs to go.

I'm sorry to conclude that for now I continue to only see that its removal
does no harm (hence the "(or perhaps just wanted)" in my original reply),
but I still don't see that it's strictly needed. Therefore I'm okay with
the change as is, but I don't view the description as quite clear enough
in this one regard.

Jan

