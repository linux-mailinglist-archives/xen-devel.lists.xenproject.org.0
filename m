Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F474363F1
	for <lists+xen-devel@lfdr.de>; Thu, 21 Oct 2021 16:17:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214462.373012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdYs0-0001zU-4K; Thu, 21 Oct 2021 14:16:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214462.373012; Thu, 21 Oct 2021 14:16:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdYs0-0001xg-12; Thu, 21 Oct 2021 14:16:36 +0000
Received: by outflank-mailman (input) for mailman id 214462;
 Thu, 21 Oct 2021 14:16:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FF+c=PJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mdYry-0001xa-Iw
 for xen-devel@lists.xenproject.org; Thu, 21 Oct 2021 14:16:34 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7d59be94-3279-11ec-8379-12813bfff9fa;
 Thu, 21 Oct 2021 14:16:32 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-adw2vX9aOpeDVcU13EfUxA-1; Thu, 21 Oct 2021 16:16:30 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6864.eurprd04.prod.outlook.com (2603:10a6:803:138::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Thu, 21 Oct
 2021 14:16:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4628.018; Thu, 21 Oct 2021
 14:16:27 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0601CA0041.eurprd06.prod.outlook.com (2603:10a6:203:68::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Thu, 21 Oct 2021 14:16:26 +0000
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
X-Inumbo-ID: 7d59be94-3279-11ec-8379-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634825791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vY5xAjw1zQP/7a0lPh85sUUKQUpYnQ73bKWEERsYhgc=;
	b=BbtQZuJKL5lCz8sQXluMzXj3ALvzIbOCQIThTgSHw58WLbVzMEhwb6c9JWDrcOGsMgCTEj
	n5z7POpbiVI8dc1SUbZfw3T0J9Py29XjHkUzqjC9KHytTfEm7c/QdKFI5FtRHnkTVMU2t7
	BbiyrbVPPJZ2kYKUYwMR6nu0F0fagUQ=
X-MC-Unique: adw2vX9aOpeDVcU13EfUxA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L10N8byApC6lHOqR7Zpa5yIQkV54JFSvD4RQQon387y9w1OC+vmEZs2IwtkU0tQTMip/zP41upTJ6CS+s6ICRE2kg9tOnmHdVavLgK6dsaRQw+fNv3lVoiw509Uouelld2xXJxeprCJSc8jYRqMMzKjYGhnzlOhSq6wBlH/xCp66vN+v+ol9gcclIuA7ntoM5jK35npLFWafnUH/Oy6YLyNgzbIXckTqTsEqIdCvce/mT4+rBxOnozmr9KhMDxghKtvLaj7Pmxa196N9/j8hQmGuH/nkmSmlJYFsP5knlBypUOnd5pGtY3vGtU3s6b1eQ84HSLvpwgG/V97yPi1WWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vY5xAjw1zQP/7a0lPh85sUUKQUpYnQ73bKWEERsYhgc=;
 b=ITxGqUKo/GcETJJMsrixbSimyO18i9RVdh0vQhJgce2DotV++aEorqSaiTUFinQp1jhStjqNa+u+HVk3yKx8axXfP2VEfif6kbRSHbblhEN5YGIsx9xS/A+EwQOTmJtRIknuScRW4WVpotcFZV7DHSc49WJkPXtxSnmceZ9ic/cvYeqNkDcZl+essTq1OPvuzKyU/wo5jk7+fYwF+47ODhJ/EJ4DxnU1VEVczGW5wYCGW46PInXsZoTqbGyx2swWtWb5fZEiTEb5evexYpqCwqzX5nMKVimQWdSa5FsAv2XgfNeMCSCG1f2eYzOoWGamEUWemDzbMDrWD7YOtr5CSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 42/51] build: grab common EFI source files in arch
 specific dir
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-43-anthony.perard@citrix.com>
 <43684fcc-f6ca-86f2-9fb1-d3d5d9dbc20d@suse.com> <YWmse5Sv2SFyRMdj@perard>
 <fd11108b-db66-3c0e-9a7e-a5e30b0b5b1f@suse.com> <YXFJD3LlFfbivA6Z@perard>
 <938f059d-9d08-75bd-01ee-5d442a5e9961@suse.com> <YXFxLJ/F9uXtTuaH@perard>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1d16dc6c-3299-88c4-a25d-c46b0bd021f3@suse.com>
Date: Thu, 21 Oct 2021 16:16:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YXFxLJ/F9uXtTuaH@perard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0601CA0041.eurprd06.prod.outlook.com
 (2603:10a6:203:68::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 481f1e05-0abb-4167-f24f-08d9949d5ef9
X-MS-TrafficTypeDiagnostic: VI1PR04MB6864:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6864D61689A4D884B6FE91B2B3BF9@VI1PR04MB6864.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MnqHlgSUUUnlOaysHQAbolFg4GFn+dHEcsc9bdgiiTWIDt0VX6WEy9yrXCOdsuBm5puvAVlzPUFfBCQXGAske/mJFxacKORi1oMplUh+J2fiQ7SjNFTQGMpwbPaXB1Z4wjKw0tHO/VIUSLHSDQBkAjludaJrhHOCydIuH3s87zMSEjLNr5rDgnhsq9TMTmqz/EDkkcIKaJjrGQgKtOcsYRQjLFANEx6v3Qy+0quI5RWSJR1QGfTNpeyy5dt8ormtcZb7g/7V097fKAY3f5dWfsb0S5LFBHPY13Pe2r5GTAd3ut1/Bqhqqk9HwQwwVStmdCpVPlDI7KfebXapX8+rldqQZRZmdDBPRj15Y495qIPu87xZ8/03wCzX0N+dEUYDpz0Wp1G4QklvlUSjmjyOvSqPYPjSsAFgsYLRWXHSkWZ9MDBUjxlKdwi16htS0TlZZ0ilbM71WPK84ZY20c/e0yv/Xk2acl4ApB1I8QBvRElPq8FQzTK5Cw7Egc8XazUU/NeJk6Wkww6WEske0An8bi+VY6guZ0nsvwVvFozyvESDFQjsCJHwCKNjieprv/rDIMFBy6LdjmuU34dD1FVfUVEasHrKB/LMjtd3nsfTBuOa6mwoWgNVG8dNtrYU/mq04AhX7qV2m5q0UBo9CyX4YI7tEJqJ7OBenwCzIGNvb5hFEf5I53Isvj1FFgc4N2hL9voDJCBHbw/7BAsALC7D3K0DL0eSaq7bnRSxxJN8Tdk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(6486002)(2906002)(956004)(36756003)(8936002)(26005)(4326008)(7416002)(31686004)(16576012)(54906003)(86362001)(66556008)(2616005)(8676002)(66476007)(66946007)(53546011)(83380400001)(31696002)(38100700002)(186003)(5660300002)(508600001)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0JVblVTdzU3aVB5dE1ySktFemlaL0o4RzBFcThNT2NmVjZXVkxmQTZwM0ph?=
 =?utf-8?B?a2lVZk1JVk5CU0JzOG5PM28rYzZJM2N6dHVMei9MOENwc2l1YmowV1pBaXdi?=
 =?utf-8?B?L3hFcTYzMlVISE5WUXFQSmNKOEkzanZkc1Y4U0RZby80UVRTUFBTeDNaWTdh?=
 =?utf-8?B?U2MzdWpiYlFwOVcxU1g5MjBHUmFUV0lKc0YvZnBudDRGN04vNkVrMTQ1MFNt?=
 =?utf-8?B?bzAxNjBYa2RpeDFkL0FzMzJJR0tsRUlROCtvUExwMFF2STJNRGVEaktlV285?=
 =?utf-8?B?TFJUa2tsd0FDTTdWSE4ybnNuQlFRQmhaWXVHRUp2TnZLMjQrWFFxSTBXNFND?=
 =?utf-8?B?NTVlQkJVeXZyRERhT2lvckRjNHJNZmdhM0NRVVFYV2g3U0xyVEh0YzRBNlpJ?=
 =?utf-8?B?OEF5bUlnY25heEduMVJEUklveDJKN3VpQTN0NGdzdEFPd2w3OVg1dUcrelFB?=
 =?utf-8?B?MmpRaDBJT0dXYlQwcHl2ZTJLcjl4a0ZYMFZkeWs4Y3hlZ21HNlhrbG1LVUZO?=
 =?utf-8?B?UXpKaForVGxyWHl6TUIrRUZLeGpHb1pmMDRaOHVZL0ZpL0krSC9mTFVKbzZi?=
 =?utf-8?B?R0tiSlc1MlFoR0djaktjVmI0eEMzdTJoK3AyQldHVWc1VldoeHh3SHpQWXk1?=
 =?utf-8?B?K3dMZytpaDFyOGZnMm42UkNyMlpEVXBSNVdmLzY5aDkxR2w3ZUZaMnhZaTZs?=
 =?utf-8?B?RS9oNDMrYVRjdE80TDJ6UUFORlpodU0wbkdJdmQrVWEwSWRsNWo5ZmxlWFhX?=
 =?utf-8?B?RHRKYmc5OFl3TG1aUWJjL1NlamhWUGVJRERmNmUyZWVJbnlhT1YxZDROUXFW?=
 =?utf-8?B?VHRvOGp6bmRTOU43WGxwNTBncWNsZkxkUytQamptVUlqK3R1S3JTamRwSWdT?=
 =?utf-8?B?bU1XdmdYZVpRdmtuTFZJOFMyM0FmMW8wemgxdVJ6OHloS0l0VGVxMXg5cVRo?=
 =?utf-8?B?Yy9jZk9BTUN3UCt1ZkNvN3dXTE1DZGRBbXM5aW40RFZEMWJQSkVoR1pQcU5s?=
 =?utf-8?B?ZWhpOEptMzVyL1lLQkl5aUpZNnowalUvcmQ3TzFESS9MSDhwRDZnVmloZjdi?=
 =?utf-8?B?SmxJNG0xNzc4V2xWOHRCZ0NJUWJPYm13dkFXeHA5RmZHWGhXZUc2Zkl4Uklm?=
 =?utf-8?B?ekg1REE5anpPMDFRVzltWmh6eG93QUltQlByRWxJaDFJYXpWS0ljUVVVdjZK?=
 =?utf-8?B?QlVCWGlXVFozZXYrWmdPV0JTUWEySE9GRnhjWVNEajVMd1QxWE9yUk5HWE9z?=
 =?utf-8?B?NnJ4elBEZkxJUGorcHlIVXlibEhNNjFybWRsREdPTkhIZnE4SWhnajN5NFgr?=
 =?utf-8?B?bk01bDBoNkZTY1NQdHpYTGxORGJRN3o3MTA1MWdTdExGUnBsamdVWFhCZTdY?=
 =?utf-8?B?K1lHcUlHRUZvQmdUSlRYdWFJT090bVVyOG9SWUluc2NTVnZVZzhKYWlrS250?=
 =?utf-8?B?L3JOYnRLZVZrM2lvblZGL0ZzeVpDV2cxL2NiZUF2WmtBSEttajh1Tloyc0dk?=
 =?utf-8?B?VzBoOFVoRnFKeDVMREpyMEdJK0ZvUldOcVUwM0xtdHB4SkVvZTlIK01WS1Bj?=
 =?utf-8?B?dFU2Q0diT3ZsZEZmVEZlR25yQ3A4c1B2MEJhemNPZGFKZnhzdXhydmswbHNH?=
 =?utf-8?B?aUh1ZHQ0WmdvaTFnZ2dlSGcyK2FlSjU4dUdHVDZBRUhqRkQxWG9mV1RINjNN?=
 =?utf-8?B?dU1WcmRmQ3lIUXJGNzc5Z01RSzZsVVc3QWNDVkV1R1pKeTJTV0E3SkljZWdl?=
 =?utf-8?Q?27BzETEz64L5Jcvoc4u4vzi+Lxi8c2MPbrf98Pi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 481f1e05-0abb-4167-f24f-08d9949d5ef9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 14:16:27.9527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jbeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6864

On 21.10.2021 15:54, Anthony PERARD wrote:
> On Thu, Oct 21, 2021 at 01:24:27PM +0200, Jan Beulich wrote:
>> On 21.10.2021 13:03, Anthony PERARD wrote:
>>> On Mon, Oct 18, 2021 at 10:48:26AM +0200, Jan Beulich wrote:
>>>> On 15.10.2021 18:29, Anthony PERARD wrote:
>>>>> On Thu, Oct 14, 2021 at 10:51:44AM +0200, Jan Beulich wrote:
>>>>>> On 24.08.2021 12:50, Anthony PERARD wrote:
>>>>>>>  obj-y += boot.init.o pe.init.o ebmalloc.o runtime.o
>>>>>>>  obj-$(CONFIG_ACPI) +=  efi-dom0.init.o
>>>>>>> +
>>>>>>> +$(obj)/%.c: common/efi/%.c
>>>>>>> +	$(Q)cp -f $< $@
>>>>>>
>>>>>> In case both trees are on the same file system, trying to hardlink first
>>>>>> would seem desirable. When copying, I think you should also pass -p.
>>>>>
>>>>> I don't know if doing an hardlink is a good thing to do, I'm not sure of
>>>>> the kind of issue this could bring. As for -p, I don't think it's a good
>>>>> idea to copy the mode, ownership, and timestamps of the source file, I'd
>>>>> rather have the timestamps that Make expect, e.i. "now".
>>>>
>>>> Why would "now" be correct (or expected) in any way? The cloned file is no
>>>> different from the original. Nevertheless I agree that -p is not ideal;
>>>> it's just that the more fine grained option to preserve just the timestamp
>>>> is non-standard afaik. You could try that first and fall back to -p ...
>>>> Otherwise, failing hard linking and using "cp -p", I'm afraid I'd prefer
>>>> symlinking despite the arguments against it that you name in the
>>>> description.
>>>
>>> I guess I'm missing something, is there a reason to keep/copy the
>>> timestamps of the original files?
>>
>> Avoidance of confusion is my main aim here. I certainly would be puzzled
>> to see what looks like a source file to have a time stamp much newer than
>> expected.
> 
> So, there isn't really anything to do with the timestamps :-). I guess
> we could keep using symbolic links, but force update the link at every
> build.
> 
> I've tried that:
>     $(obj)/%.c: $(abs_srctree)/common/efi/%.c FORCE
>         $(Q)ln -nsf $< $@
> 
> and make seems happy. The link command run every time (due to adding
> FORCE), but the `CC` command isn't, so that seems good. The recipe that
> would run the `CC` command check if the prerequisite are newer than the
> target using $? so it doesn't matter if the rule that update the source
> file as run or not.

Looks okay to me.

One additional consideration, though: Linux puts a "source" link in the
build tree. If we did so as well, then that could be the only absolute
symlink that's needed. Links like the one you suggest could be relative
ones into source/. But I guess this could as well be left as a future
exercise, in case anyone cares to limit the number of absolute symlinks.

Jan


