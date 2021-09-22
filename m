Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D7A414563
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 11:42:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192355.342767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSylz-00060d-4e; Wed, 22 Sep 2021 09:42:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192355.342767; Wed, 22 Sep 2021 09:42:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSylz-0005yq-1a; Wed, 22 Sep 2021 09:42:39 +0000
Received: by outflank-mailman (input) for mailman id 192355;
 Wed, 22 Sep 2021 09:42:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cZP0=OM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSylx-0005yk-38
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 09:42:37 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id da850208-27c4-4ec6-9e6a-045a230829be;
 Wed, 22 Sep 2021 09:42:35 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-uwwGKn7bPUWryCrDMtmVMg-1; Wed, 22 Sep 2021 11:42:33 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4381.eurprd04.prod.outlook.com (2603:10a6:803:6d::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Wed, 22 Sep
 2021 09:42:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 09:42:31 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0073.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Wed, 22 Sep 2021 09:42:30 +0000
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
X-Inumbo-ID: da850208-27c4-4ec6-9e6a-045a230829be
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632303755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iDjBQ38nJO8k1QEfC+dQfSOVo0hUKeEfFVKmKsaSuZA=;
	b=PvWdGu3YKGV7cRtJqw6+zNKZpObOJNWyA6umlsvEZ6HFbzGB7efsLycNxNZI4ZecyhiU0Y
	IxOXkR1yMcG0BzGV3QrP9OBGXQ0Eh/3q39m/B8kgTkdu4SJZVjAU8H9ocZbc8V8NqO7Tv4
	pb8sBhttTO1XY2qBUCv//Frkr/TclQM=
X-MC-Unique: uwwGKn7bPUWryCrDMtmVMg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DX5HxuabYYLmatJY4WB0Ni6uXcVWs17djQ4RDSRc23PYdaGsTLtArzVhmCbQkbTbAlaulphOGfLnHO7XKve8l1gHQ90r6nu2xS1fcznyQiT9lPYJJOt+sxPklXzVTUJvcqLQq84Lf/tXwOIZPMKCAa0vrRl1B0hKjhGlOKBWK4iETywlJzstQJQaiCorC6v/cjoBprYjIXfn/Idc1yAWZqqPcCgLsbDdDJBDpqEF2L0MOXi/2eDmWaq69eiQmtclQQZzYzBDIdUPH/RvuSIb4QVwJjVhn9KbLvuhOua6iLPY1IrCERmIOO6uXBD6eU75YE6cHyfxpasFcqK4cgzf9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=JlO4UEtcn4rMUvF0lnKX7qcvk1YI7qoy84TsIWDScdg=;
 b=Lktjx2diPO+td9d5hf4JA20RrZP/ZS3K1vUsc+jFVwDZAuaSE6tJM9SV2Lso3rf12yvZAzlrZxY0KQt3fGYyNecw40OrGie4XwwTInYjy64YzgFnX0JQ6b+FhASZ/giWLgirNXwihMqfv5i+flLHzc3VaosFHoUyLGLy/YxukebYy7lIoUWp8Mzl6xgHaVjs+O+2zloS0dBQVYTK+DdwRYbIZxK6i2XPAeXZgGKL795pc+LYLiZ1x2C6jH8owjX3M+l5PEy2LH9c/3NTOKwW+9BR31gUiPvJzpFVhohxfsCH+3bCMUUdE2771yELIF9jIBsETtvhCb0vxjDEejfA/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 1/2] gnttab: remove guest_physmap_remove_page() call from
 gnttab_map_frame()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
References: <4f54456b-e8da-f67f-b6a0-b5ce2cf12cae@suse.com>
 <8b73ff7c-4dd6-ff2e-14b9-088fdce0beb9@suse.com>
 <YUhgdMyTbfL8Hyke@MacBook-Air-de-Roger.local>
 <5c1fd288-2972-d264-d6b0-3c7bc6d67be0@suse.com>
 <YUmYpzhJrBZkSYyd@MacBook-Air-de-Roger.local>
 <ae0fb20c-b7c9-2467-0951-b84b2f647382@suse.com>
 <YUr2zZL3kV4/nBQp@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8fd9e2d5-b875-ef7d-d80a-15b6ba2948b5@suse.com>
Date: Wed, 22 Sep 2021 11:42:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YUr2zZL3kV4/nBQp@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR0P264CA0073.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07315a81-ac3c-4e38-5ac1-08d97dad4c61
X-MS-TrafficTypeDiagnostic: VI1PR04MB4381:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB438182AAB9E2BD3CB9C20CC2B3A29@VI1PR04MB4381.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F8KpQAYtL85O3CqVTQrDEAxSoS2CP7R2nyemVQqHOW21a7lXFwaIugT7GhQ4NR2Jzl5x1bgLcfzW18eLBhEhFAKb2zHCbReL1+E5Eq42vqXXOsOwmudi/uaIwLEwuy48mh9Yy615f3At1Ho4IFLU4rhZQfE//y/EjgIu7tF6+whjxcujQ/38qYgHZeJEaOBCW8zwmY5O1gMjaFxyJz3F3GRR6uNaYVfB5+qZoSCXFIvJyNhvAtC1ddrfN+lHo1W/iLGa03fQEuUayeyxwI7ViULuW3SOIRo+EEEpjE4xs6MSt3lIFLifbIS5dSBap/vlacWL3mIftRCb8Ia8NB4bPUEkdA1oCigthZhhMEUY1hpMmnhQjP6uJnQJpfyEPGpv+IlKODhoDxuUd6mWaDgVCqLDMM8qrW4WjpVaA4/eu6s/IDv/eMmV1gFoUJAxinMsEKH8FfBNyeYWw/zlUq4HNbqhPIYPCM3tcLemiEFfE8N5KF6G6mBoHRR9WRlCLmSF7n8byCLzwuWOYXfw75aGkcEPWHct5+ILNtSbchG3c8nRpJ30W/Axz/+bx6POzqcat/iVh/jBI/BUYlonYSzM9arTxY0qlwCN0khL+3au0P3mElOUC/RGT8o4512svB0mGWm3lT94/mYCjsrqOX+fQWTiSoBAyoeyJvFcYoXE0n0aSGpZiZTAnkLt9002Y/xoebCV/yftHvNqqaa3fwZ8qhps/NxnX5/PmUIA1Npkec508EsknQbNPx6SbCDton/T2lVD+T76iBPumaNLaNe2Ew==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(86362001)(508600001)(83380400001)(16576012)(6486002)(53546011)(316002)(36756003)(8676002)(2906002)(54906003)(31696002)(4326008)(2616005)(186003)(38100700002)(26005)(66476007)(66556008)(66946007)(956004)(8936002)(31686004)(110136005)(76704002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CM08BZww7A35lbq1kPZEw2NJS2s3bDqKI1XhuXoOu+PT2Nn4igiVKXmMiwsO?=
 =?us-ascii?Q?mOFgyUalqlJpewoaupRzKIZYY9yNenuqdHHDhKZRmxNhDAkevBuebd9G+r9w?=
 =?us-ascii?Q?w29+LlS3Ko/qG6fMrU+3iISdZh2+fMTsI4WZ5T5H9fHz9pxa+oVW2nJzIAOA?=
 =?us-ascii?Q?r5qw8NlANVvvoXV4kzXuK+tcQ67ieIJwpAmGYqqaT9gtwlYspOVl1vryxVLj?=
 =?us-ascii?Q?+L7+l8/u0tfbhcgFifpnHoQK2pi+iwKP4s7QwCtPxYFWkynMvJuz1hCnGeVu?=
 =?us-ascii?Q?J4vhbyDUPebB/0DUKXgrZAB1VyBTM5a0f4al0zP/VBj42XJmf6GwkEi0aPk5?=
 =?us-ascii?Q?Ens7wjwPfBLKOBZpnZZXm4G7HSGw/wlTok22NTYgfS4YUZM0v33xtMgKzxj3?=
 =?us-ascii?Q?WxgGlHD8YHgnPxNc+C4RQ3lurN4BPB97i+JybmdssIOcv6gRcVL9lJmyxkDC?=
 =?us-ascii?Q?7rmX4Z2X0J3CN3iEr7E/4qMs4nAd938Xol42Uzmrpc4sCi2JNAasBp20ra6Q?=
 =?us-ascii?Q?unIpECWAltxK6T8cwNDQ0RsGCfyoMj/iGc5skbLWMl8BW+P4qiPceBC/6qnk?=
 =?us-ascii?Q?D5ZjPUZEYx1wWUAjd7XO9/n/QM3DUD2kVyZt3Qbv+cmgtQKm6HHcr5KQgndE?=
 =?us-ascii?Q?eE6uIqAneYu4xITkrWBy6Ebu/jha8Q+buiwYzjNsk74PIJ0dh6PPetmbA/Si?=
 =?us-ascii?Q?djg3ptNvlUyaXFwRX72YhOf2FeQZE3w5zDMyOTSvlUiSBsNEnkWe+eXaUGKE?=
 =?us-ascii?Q?wOutnuRFgCkftS0k96KQd0dUeZw7mC8KcSDRKjfgRq/p1MvLfbNRRUTbKPSW?=
 =?us-ascii?Q?VbHtRiS99Bb7AqPJtGFsAZuZ0hGoJ0uuik9m63Y5NuIwsaxt2AuT3hp0K/Yi?=
 =?us-ascii?Q?Q/bOjhbssdt7X9WENlNCD3JUPv1z9aPQTZ1wCPgOEfYkRIYItyVizn5GkOAu?=
 =?us-ascii?Q?yhA16aILPR9EAOyqA2cIUe29Y/U98ycBptuplxuV/RBQ1UNhMWFY6XYnpOL4?=
 =?us-ascii?Q?OIPbxFJK77KXVy/56vK1qTJdmpuwLYwDtpDijJCUjYJrjVWdpBPEewvoNvQE?=
 =?us-ascii?Q?XOZLFO+MtwR/o4lB5PmjRW6HkhMkpk+vrEp93Qr9PGP6MxiVDCP/UN0jilfc?=
 =?us-ascii?Q?kq25v/shRc49kPAQsMC9miKeYruy12y6xRdH7E/nqtTvMOtLFgPv/ggKeGE8?=
 =?us-ascii?Q?16ttRb52rnwQxtdK0tQgUBgFFfnZ6hAQCdtmEHDz0F+BQOrxY4mY2kxquSoy?=
 =?us-ascii?Q?hGSgFqorCJk6oHUbSBLfq0N2/cDaOZBL5eu/9hemCm3MQCLFOV9jN7a246to?=
 =?us-ascii?Q?wvKsZWabIpFgkJfGJon3QHN8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07315a81-ac3c-4e38-5ac1-08d97dad4c61
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 09:42:31.4698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ImVMNTR6gYKHbokDdbNmMdjMBfraEpr2AOcH08CrsA4/j5aN5XC/mfXT16H9yY5j1CUb0aOs8o2+7Eqi1jdIng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4381

On 22.09.2021 11:26, Roger Pau Monn=C3=A9 wrote:
> On Tue, Sep 21, 2021 at 12:12:05PM +0200, Jan Beulich wrote:
>> On 21.09.2021 10:32, Roger Pau Monn=C3=A9 wrote:
>>> On Mon, Sep 20, 2021 at 05:27:17PM +0200, Jan Beulich wrote:
>>>> On 20.09.2021 12:20, Roger Pau Monn=C3=A9 wrote:
>>>>> On Mon, Sep 13, 2021 at 08:41:47AM +0200, Jan Beulich wrote:
>>>>>> --- a/xen/include/asm-arm/grant_table.h
>>>>>> +++ b/xen/include/asm-arm/grant_table.h
>>>>>> +        if ( gfn_eq(ogfn, INVALID_GFN) || gfn_eq(ogfn, gfn) ||     =
      \
>>>>>
>>>>> I'm slightly confused by this checks, don't you need to check for
>>>>> gfn_eq(gfn, INVALID_GFN) (not ogfn) in order to call
>>>>> guest_physmap_remove_page?
>>>>
>>>> Why? It's ogfn which gets passed to the function. And it indeed is the
>>>> prior GFN's mapping that we want to remove here.
>>>>
>>>>> Or assuming that ogfn is not invalid can be used to imply a removal?
>>>>
>>>> That implication can be (and on x86 is) used for the incoming argument=
,
>>>> i.e. "gfn". I don't think "ogfn" can serve this purpose.
>>>
>>> I guess I'm confused due to the ogfn checks done on the Arm side that
>>> are not performed on x86. So on Arm you always need to explicitly
>>> unhook the previous GFN before attempting to setup a new mapping,
>>> while on x86 you only need to do this when it's a removal in order to
>>> clear the entry?
>>
>> The difference isn't with guest_physmap_add_entry() (both x86 and
>> Arm only insert a new mapping there), but with
>> xenmem_add_to_physmap_one(): Arm's variant doesn't care about prior
>> mappings. And gnttab_map_frame() gets called only from there. This
>> is effectively what the first paragraph of the description is about.
>=20
> OK, sorry, it wasn't clear to me from the description. Could you
> explicitly mention in the description that the removal is moved into
> gnttab_set_frame_gfn on Arm in order to cope with the fact that
> xenmem_add_to_physmap_one doesn't perform it.

Well, it's not really "in order to cope" - that's true for the placement
prior to this change as well, so not a justification for the change.
Nevertheless I've tried to make this more clear by changing the 1st
paragraph to:

"Without holding appropriate locks, attempting to remove a prior mapping
 of the underlying page is pointless, as the same (or another) mapping
 could be re-established by a parallel request on another vCPU. Move the
 code to Arm's gnttab_set_frame_gfn(); it cannot be dropped there since
 xenmem_add_to_physmap_one() doesn't call it either (unlike on x86). Of
 course this new placement doesn't improve things in any way as far as
 the security of grant status frame mappings goes (see XSA-379). Proper
 locking would be needed here to allow status frames to be mapped
 securely."

> TBH I think it would be in our best interest to try to make
> xenmem_add_to_physmap_one behave as close as possible between arches.
> This discrepancy between x86 and Arm regarding page removal is just
> going to bring more trouble in the long term, and hiding the
> differences inside gnttab_set_frame_gfn just makes it even more
> obscure.

Stefano, Julien?

Jan


