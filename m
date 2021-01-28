Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E55C308190
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 23:57:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77497.140385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5GDk-0004gf-9J; Thu, 28 Jan 2021 22:57:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77497.140385; Thu, 28 Jan 2021 22:57:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5GDk-0004gD-4E; Thu, 28 Jan 2021 22:57:00 +0000
Received: by outflank-mailman (input) for mailman id 77497;
 Thu, 28 Jan 2021 22:56:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0GBf=G7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l5GDi-0004fw-8e
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 22:56:58 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d6cf2be-e37b-4458-858b-bb4b28549f4f;
 Thu, 28 Jan 2021 22:56:57 +0000 (UTC)
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
X-Inumbo-ID: 7d6cf2be-e37b-4458-858b-bb4b28549f4f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611874616;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4vutLeGcbdzWhDutvGr6QAdayIEZQBdiQy4dMqoZ0i8=;
  b=RysD+UoDFzv7CvE8EDUz9tkc7STYS/h+hpNI+Y+waQ8VQX0H0pkK75nQ
   iWIWJi2WBwq8TaO6mdrCs4GD2B2/FME9Pb8WlafEAUWxw+wvJrj7yJfOF
   kFxAb2Bm7+jAHvo+VjBC9QcbCN0sBkzcQDfbalqQosArA1BeMRBMmhqLq
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 2kzkWGxNWVhNsyAQiIXQ8OoD+hxaUkh4x14rKz/4INmouBqr/4Vb81JG5omsSKln7K/QUQt5Px
 Sg02zWMX8p1PSXPk2sDYEq5aBH+QQmFWhaAG2n5odA8x35G3kggNZFJTEpcGW3XN1BZo8brI60
 wMH2Ys64WusdYajIxmuC3+6CRfWy3tyMJhDshWVoxWvr5BD14iQXDd8nk6pQFz7CV+JWw3JQto
 AE08WkxSJfHUQyLRcZS5l7OUA89L6NioyaN2PWzWRTIlhuZrvT77CpE4v27l+6tQLPdybziPDm
 kuw=
X-SBRS: 5.2
X-MesageID: 36312856
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,383,1602561600"; 
   d="scan'208";a="36312856"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FdVINZUPEbru/6TH05q8JshZwphVskVG5kmvfiS0fvXj8ZuZlkt6qlt4J1QcowHZc1tVkzvlRTVGduYXqYBNnsh4WErEixKEoCHREa87z4jgFaLxbGnsmuT+VNlkUwZOH/Iw2c2+50lFyL9aIw04R+Id4nfMy5W1OAkJ3WNgzSVOej4P1Y2XCtzKqMQcLTLGUDpg0E57+GOLB8vWg7BgErMKABUHB135JSslRARIUkEuEqJZa/9sB5cWORHd/K1yguc1tEdMF8hHZFgiPumpyea1QQ1J0fFzLeXv8JxGkcNXJuDgjr9MibhAtZ/xo9jJIj1h9hdDfPRzE2ddv/+XTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9DeVbFP0FpIngIVcFZlN10VkFski6dZ90h4Ldz3bZQ4=;
 b=gKFH1cJ89md7m13QjxzZ8ki3kmfZbZ8Y654ikO0y0upDiwvE1xWstIinA6p1guIxKCGE8Hj/qcrozRZznIPOdy9Ney1FzR2eatmGeTmsAvpiBJMRVydz6GmJpUVJGgP5UoMEvZQ6t+go15OwGR/ZWRsnfwhpksOww3fcqoaPKQS8yhSLvQ2E2+pQVcBahCTKWko+Qg+lTbSwPdBkfw0JT9f7OthySNi8Ion4RVMM1Uvt35Rq5nACtVl5yGMwXk6tlCNvyV8XkJthJa9nBNTST7tDrH2wF/KJPo6BF+lBZe77s69UO6J8CzXKp2qnCBpqEGaSFffIV6qyxlkHoae4Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9DeVbFP0FpIngIVcFZlN10VkFski6dZ90h4Ldz3bZQ4=;
 b=fT+Q4P/rc13QMstj/Xark8Nm3Fq//45Upo3rMve8LonAcI2LIv8kGBkzoltZY+3bUyrqXn6Uxuf1m4EzbomoF2jHm4Nw5MJdEjcmnWcnsMJ0CJCcBeDNksvM2QvYdq0ruNaj9+PkHOfTRq5nL6ut90nmbWXlWVl8VNuB1k+2C/w=
Subject: Re: [PATCH v3 1/7] xen/gnttab: Rework resource acquisition
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>,
	=?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>, Hubert
 Jasudowicz <hubert.jasudowicz@cert.pl>, Tamas K Lengyel
	<tamas@tklengyel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210112194841.1537-1-andrew.cooper3@citrix.com>
 <20210112194841.1537-2-andrew.cooper3@citrix.com>
 <6321bce7-1826-be38-622e-088d492fb0c9@suse.com>
 <a96bed35-df20-e77b-1b98-593aa5649ad9@citrix.com>
 <57895dd4-10c7-18cb-bc44-25a45cb688a7@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d85313ae-295e-d3d1-f041-67d6814b959c@citrix.com>
Date: Thu, 28 Jan 2021 22:56:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <57895dd4-10c7-18cb-bc44-25a45cb688a7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0262.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::15) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df3ea582-be8e-4f21-4438-08d8c3e000a8
X-MS-TrafficTypeDiagnostic: BYAPR03MB3607:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB360786E922D457D403FDDE33BABA9@BYAPR03MB3607.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tzNSf6t4Zju7wo0Ut9NxXNtpNm6fnKEs46ZI19+UGGL0AvXoFpM18NmpOOF3/kjJ/FVwVsVdf75B9WVlbffuJNlrDRuJ9MMobqFotvEJi1xv4lk1RrCq/oI6BY0fOJkx6fbLGdunds5TY0no3onlGE/DStuJ7f6sQOYMzDMeZpdDj/b1c519wgvVG6/gs5z76DbVr/fZnTTg57Nm4/j9dQnGShpQx5pH21JCSBUu72qQ9pkK9nqPGIW0T3N0UQn+JD8G5w9TQ38vTnxW7fFfiHlmLv5etmSebdBptFxpfh1ktyy5NODn6L3UJrceYXVpK3KZudr8MJSeNMx76Saj7mZs3bKEdToQACnzrYJyytEJ0yKTxE+BXW6OTityLE3uqBetHIq35L5Hnm+dFB2C3NjjyDxea57vY/+WnI/QmCKZHqaI0Iellh4EIF7bpUG9SboP0MPewgGExlzpIwKc52Qe2Jgu7yf8buL2Fy5x2Az/KC2vMQJV/OLaodX9dzodwCivT4fwK09N7H8WVuytSJlg4on+Wn6sByS4+A9OHte7UGFuwtfUDteflVDPm1T1XNR7zafbUDNks+Sw+DM43iM/T9AgZG3BGFdJVApLG2s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(366004)(136003)(346002)(66556008)(26005)(66476007)(956004)(2616005)(7416002)(66946007)(53546011)(16526019)(186003)(36756003)(16576012)(83380400001)(478600001)(6486002)(54906003)(86362001)(8936002)(316002)(2906002)(6916009)(31686004)(8676002)(31696002)(5660300002)(6666004)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VWEvdkV5MngwNTU2NWcxbWRlbmptSXBkdUphNm5iUkUvb01heWsyY2JOZlZZ?=
 =?utf-8?B?UW5CZVFmb1BhRWFsM292S3ZML3M5V1NZdWs4MHpVSThORHdLZ1NGY3ZPMDdq?=
 =?utf-8?B?dU04VGRuWnhNQ08zb1c0UFp2TFEwRGptNTVwMDd4N3IxL1lkK052Y0VaWEpI?=
 =?utf-8?B?UjZHWDd2VVlLMnFBNTFmTGVOSzVQU3F0WWExUzlPbHE2dkExNTBDNjRzTEVm?=
 =?utf-8?B?NzlDVHFxNzVmZWFmM0lSZnFsa3Vwb1RDc2JabkszRkFWS2tBbldIcDVxL3Ji?=
 =?utf-8?B?WGRmWGU3cG9ZWkMxWkl0YzcyT1lGR2E3ampzWFVIcGJ0dEZURU9aQnp3Nktt?=
 =?utf-8?B?OFE3VXdISXRhR096T0duRy9tQ0NmUG90aVBzZ0l5N29QSll2dXA3VXNoVGNR?=
 =?utf-8?B?bTRjRTh0ZnJVOGEycWZkWU45MVVWSG16disxWWhjWkc2UkRjLzhYSG9ZWHVm?=
 =?utf-8?B?dXA1eWlnWENROFM4VzUxSnJmeGJRT212Q3lrdnFyRTRlTStsQm51YWU3ZEFt?=
 =?utf-8?B?VlpwTlI3SzdYMUxibWk0cFlqUG80VWxkR0dGVXBubmlxYVFOUklDcWo4enFs?=
 =?utf-8?B?RUh6Y2hGZ0ZZb0Z6WFlMZHA2Ri8zMW16OU9pYmJrSGJQQnptWkNmeUhvQURu?=
 =?utf-8?B?V3lYZ3UwdGFpVW9PMlJ5ZThET0hmUWdqWDArampXUUNKdUgxY3pSTGN1TXlx?=
 =?utf-8?B?TGRvMWNLbDBlaW96Q2p3Q1MwekQ2cVo3Slh3dUlsQ1EzM0g1M243Tk5mOCtF?=
 =?utf-8?B?RiticDZDY3dLNklHSDhHOU1vS1lrNjhKZk5yUTRuZlhzUDcyUGdXVHpGaDRN?=
 =?utf-8?B?b2ZUY3NYU25qWFA0RGlBTzlEMDUwVUJVYTEvdXo2QmI4ZEl4WmF6WkxFS2l0?=
 =?utf-8?B?aCtLb04vZDdjdE4wc0I5RmRTTWpnMDJZTVcvckJ5eUF5VmgzYkw1VXYrYXdG?=
 =?utf-8?B?TlFwQVdFaDZyMHlFZmg0MEYrNzFkVkYrdkhyTFJlbUZ5SjJVaUFraXV2Tmpn?=
 =?utf-8?B?TmZ3bnhTbXdBUzJRVWgxRlZ1bU9MR1NzNFd6QS9VRE1nNGRUSnVsaHViRzFN?=
 =?utf-8?B?Q1REeFJYd2JmR3lqb1RsYUt5czZnblpPbVNYanRESnp3Ty9sSUxxMHovUlR2?=
 =?utf-8?B?OVRaYlhRZzhUUnpUQnlVeFNjRThXWmwwNkFDWTF3RHpVbXp0Ym4zN0RBNU96?=
 =?utf-8?B?U2l2NDRLWUdqLzJkTGsyUlVhV0FvbXhOR0xqakgyck8wY1FiZXkvOXFGa0xD?=
 =?utf-8?B?V2lHM01FQWp0bVBBd3R6dE9DY1RKeS9ieWhKWlZLZVByS0V4dmNYTzBuY0h4?=
 =?utf-8?B?Y1lCSG5BODZ6TGJsVDRMK1k1bjdUY0J5b3RsUWFsVlU3c1hDV01mVEJhKzA4?=
 =?utf-8?B?YW5FRDJESGd6anJmSngxWndqdFJyNXQxTENEb05PcjBhcSt0YTdGMW40V3hx?=
 =?utf-8?B?R3BHd0xydUNRNlZpbXZTUUZPV0FaL1FwSVZFZEdnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df3ea582-be8e-4f21-4438-08d8c3e000a8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 22:56:52.5792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oVMlq9RYWrajNFLk7d0TPH9i9qrm7Vace1NUhodXQbdD91OiDyXGdtUKd3XTJ98Hod5gEmp6nQ9RijyGeGe+tWKao2L0GP1A3b1wLhh11D4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3607
X-OriginatorOrg: citrix.com

On 18/01/2021 08:23, Jan Beulich wrote:
> On 15.01.2021 17:57, Andrew Cooper wrote:
>> On 15/01/2021 11:56, Jan Beulich wrote:
>>>> +    /* Grow table if necessary. */
>>>> +    grant_write_lock(gt);
>>>> +    rc = -EINVAL;
>>>> +    switch ( id )
>>>> +    {
>>>> +    case XENMEM_resource_grant_table_id_shared:
>>>> +        vaddrs = gt->shared_raw;
>>>> +        rc = gnttab_get_shared_frame_mfn(d, tot_frames - 1, &tmp);
>>> ... this will degenerate (and still cause an error) when frame
>>> is also zero, and will cause undue growing of the table when
>>> frame is non-zero yet not overly large.
>> Urgh, yes - that is why I had the check.
>>
>> In which case I retract my change between v2 and v3 here.
>>
>>> As indicated before, I'm of the clear opinion that here - like
>>> elsewhere - a number of zero frames requested means that no
>>> action be taken at all, and success be returned.
>> The general world we work in (POSIX) agrees with my opinion over yours
>> when it comes to this matter.
> I assume you are referring to mmap()? I ask because I think there
> are numerous counter examples (some even in the C standard):
> malloc() & friends allow for either behavior. memcpy() / memmove()
> ...

This entire infrastructure lives behind an mmap() (or equivalent) system
call.  Other specs are not relevant.

Any request for a zero sized mapping is a bug.  It is either a buggy
caller, or buggy continuation logic.

>> I spent a lot of time and effort getting this logic correct in v2, and I
>> do not have any further time to waste adding complexity to support a
>> non-existent corner case, nor is it reasonable to further delay all the
>> work which is depending on this series.  This entire mess is already too
>> damn complicated, without taking extra complexity.
>>
>> Entertaining the idea of supporting 0 length requests is really not as
>> simple as you seem to think it is, and is a large part of why I'm
>> stubbornly refusing to do so.
> I'd be really happy to be educated of the complications; sadly
> so far you've only claimed ones would exist without actually
> going into sufficient detail. In particular I don't view placing 
>
>     if ( size == 0 )
>         return 0;
>
> suitably early coming anywhere near "complexity". Even more so
> that as per your reply you mean to undo removal of a respective
> check, just that in your version it'll return an error instead
> of success.

I am not being a belligerent arse for the sake of it.  I've got far
better things I ought to be doing with my time.

I spent a lot of time getting this working, and with sufficient testing
to demonstrate it working in practice, particularly in continuation cases.

You've spent a lot of time and effort insisting that I reintroduce
support a fundamentally broken corner case, despite my best attempts to
demonstrate why it will livelock in the hypervisor because of the mess
which is the double looping between the compat and native handlers.

You've also spent a lot of time obfuscating the overflow checks and
breaking them in the process.

You are welcome, in your own time - and not mine, to use the testing
infrastructure I've already provided to discover why the compat mess has
a habit of livelocking in certain continuation cases.  (It won't
actually livelock if you switch to using return 0.  You'll instead hit
the ASSERT_UNREACHABLE() I put in a failsafe path specifically to avoid
bugs in this are turning back into XSAs.)

Combined with the fact that 0 length requests are buggy in all
circumstances, I chose to implement logic which is robust even in the
case of failure, because the compat logic is almost intractable and
borderline untestable because noone runs 32bit kernels in anger these
days.  I can't commit my test infrastructure which spots the problems,
because we obviously can't have a hypercall which panics when the input
buffer doesn't match the test pattern.

I am not inclined to adopt an approach which is fundamentally more
likely to contain security vulnerabilities in a fragile and untestable
area of code.  You are going to have to come up with a far more
compelling argument that "because I want to support 0 length mapping
requests" to change my mind.

~Andrew

