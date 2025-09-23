Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDED3B95071
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 10:40:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128316.1468716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0yYy-0002AR-5D; Tue, 23 Sep 2025 08:39:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128316.1468716; Tue, 23 Sep 2025 08:39:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0yYy-00027h-1y; Tue, 23 Sep 2025 08:39:52 +0000
Received: by outflank-mailman (input) for mailman id 1128316;
 Tue, 23 Sep 2025 08:39:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u1Uj=4C=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1v0yYv-00027I-D1
 for xen-devel@lists.xenproject.org; Tue, 23 Sep 2025 08:39:50 +0000
Received: from 10.mo575.mail-out.ovh.net (10.mo575.mail-out.ovh.net
 [46.105.79.203]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc988644-9858-11f0-9d14-b5c5bf9af7f9;
 Tue, 23 Sep 2025 10:39:48 +0200 (CEST)
Received: from director4.ghost.mail-out.ovh.net (unknown [10.109.249.19])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4cWD1Z63skz5xZf
 for <xen-devel@lists.xenproject.org>; Tue, 23 Sep 2025 08:39:46 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-qvgpv (unknown [10.110.168.159])
 by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id CF987C28F2;
 Tue, 23 Sep 2025 08:39:45 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.112])
 by ghost-submission-5b5ff79f4f-qvgpv with ESMTPSA
 id 5/dgI9Fc0mgKYxwA7uDI/g
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 23 Sep 2025 08:39:45 +0000
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
X-Inumbo-ID: dc988644-9858-11f0-9d14-b5c5bf9af7f9
Authentication-Results:garm.ovh; auth=pass (GARM-112S006dd9377a4-e982-43c7-b819-bc527ffc762e,
                    4804EDC472500D38916C4D805CCC5D85F75C271A) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
Date: Tue, 23 Sep 2025 11:39:36 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 05/22] x86/boot/slaunch-early: early TXT checks and
 boot data retrieval
Message-ID: <aNJcyA-4sJdQNFK3@MjU3Nj>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <a05ef5d70803eb25ab959de011c9717ce9194558.1748611041.git.sergii.dmytruk@3mdeb.com>
 <0024c24f-39a4-4b5e-af7b-536f7cebfaff@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0024c24f-39a4-4b5e-af7b-536f7cebfaff@suse.com>
X-Ovh-Tracer-Id: 6688408398192882777
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTG1tSPZGeNdD43htroYh5Q5QsWhRrwfRxFz1DfWq2bbDkc8kWbl8oSH7m9zAOp0K6Jsh2PIv3gLHtOliqc5w56bZ7XZvIx4b5NI3Yob8WfWy6Imu9OX5bC7kS4lad9a/0fbtoGqbC+TOSLEuqDR1M6yDwULuwLJUyVyWRFey0vgetPMzjjDYvnukzzVevMNiiVkWQ7VGywgIhXVS+hEDeKKedj5riva5xP+hhUFWGxmRTmpzwCqMG60cxFTLur4ojZe0O2Gi3kskxsKJUw6u5uQ5fK8LGvZXAQMq4KkoAUqLv2bdXW4HGjWSeRXD3qXYjfkcrK6dosdMcu5sKDrCbcatL9kT0GMItTlhEF6ARt6UpQ6NhbFQtP6qlp5rB1Q6k7n18da1JEFef0NnnUWbiN+TnN3dQB8BPwoQp+59FWuXmV/A2tg/n9QFlhu0psBxCMKWeMfd2csP4L+vYXKskkgg2qQVJZMQetDC4JODjNhPe55vUVrXJOwX2X7W6L7KMHr2R4rWweYrcdMpBxBeO6rF0/TFxq1LnmCsLcZaiRHv495+oK3Na/pyuBRrDBmK19vU38PIg88OMUTWYqxO27oRtyKec8d2ZMc+JRxizU++pTuIxfvGWO8lmrIhk7D/LzTE2+YM7h6+f8k3g2tpeDp2yEu6LWX4tAnGu1+n0YNcQ
DKIM-Signature: a=rsa-sha256; bh=MrZXviuwD1X+tppEyjVOgaltKaFgtrsSJ6ig/6M59Hs=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1758616786; v=1;
 b=TiKU8h3CJgK7d2Sdk7T3wrkLqFrwIo2X7OS+4JRQ9ka871Oile4oJp/Rj8Tew+rO3zO06aJ0
 9chl+0upjuzgFzwy2iNHLSrqG5jrRYgTM+V2cO0NPEPeMeRWOllT4WmR2TTDeqnAvBOUbbAXsEx
 d6UydHiVgz1W4pMHqrlqYkRpAMg5xXtvUVLwGvvGVqAQaMeyEjzYyZ527jsI3xBDA4aqKx37vRH
 /MmgknTcHl0ZiQyqtr6ymaeUh+zZ3OFhcQj5lbqFpdlMm6wBPG7i8J9neNy6cY+ZfTQHOXWVysf
 3hvY1vzlPZfwlnAgC7si2LmHwPjOxoKuQhp8HigrrQCbQ==

On Tue, Jul 08, 2025 at 06:00:13PM +0200, Jan Beulich wrote:
> > +static inline int is_in_pmr(const struct txt_os_sinit_data *os_sinit,
> > +                            uint64_t base, uint32_t size, int check_high)
> > +{
> > +    /* Check for size overflow. */
> > +    if ( base + size < base )
> > +        txt_reset(SLAUNCH_ERROR_INTEGER_OVERFLOW);
> > +
> > +    /* Low range always starts at 0, so its size is also end address. */
> > +    if ( base >= os_sinit->vtd_pmr_lo_base &&
> > +         base + size <= os_sinit->vtd_pmr_lo_size )
>
> If you leverage what the comment says in the 2nd comparsion, why not also
> in the first (which means that could be dropped altogether)? If the start
> is always zero, why does the field exist in the first place?

The range always starts at 0 here because txt_verify_pmr_ranges() reboots
earlier if this assumption doesn't hold.  The field can have non-zero
value, but I guess the more memory is protected the better.  I'll remove
the first part of the check as useless and clarify the comment.

> > +static inline void txt_verify_pmr_ranges(
> > +    const struct txt_os_mle_data *os_mle,
> > +    const struct txt_os_sinit_data *os_sinit,
> > +    const struct slr_entry_intel_info *info,
> > +    uint32_t load_base_addr,
> > +    uint32_t tgt_base_addr,
> > +    uint32_t xen_size)
> > +{
> > +    int check_high_pmr = 0;
>
> Just like Ross mentioned for the return value of is_in_pmr(), this one also
> looks as if it wanted to be bool.

Will update.

> > +    /* All regions accessed by 32b code must be below 4G. */
> > +    if ( os_sinit->vtd_pmr_hi_base + os_sinit->vtd_pmr_hi_size <=
> > +         0x100000000ULL )
> > +        check_high_pmr = 1;
>
> The addition overflowing is only checked later, and that check may be bypassed
> based on the result here. Is that not a possible problem?

Thanks, that looks like a problem to me.  Moved the overflow check from
is_in_pmr() before this check.

> > +    /*
> > +     * If present, check that MBI is covered by PMR. MBI starts with 'uint32_t
> > +     * total_size'.
> > +     */
> > +    if ( info->boot_params_base != 0 &&
> > +         !is_in_pmr(os_sinit, info->boot_params_base,
> > +                    *(uint32_t *)(uintptr_t)info->boot_params_base,
>
> What is this "MBI" which "starts with 'uint32_t total_size'"? Do you perhaps
> mean multiboot2_fixed_t? If you really can't use a proper structure ref here,
> please at least mention whatever type that is in our code base, so the use
> can be found by e.g. grep.

Yes, it's MultiBoot2 Info.  Nothing precludes using multiboot2_fixed_t,
will update.

> These inline functions are pretty large. Why do they need to be inline ones?
>
> Jan

The functions are run at entry points, one of which is in 32-bit early
code and another in 64-bit EFI.  Having this in the header is simpler
than compiling the code twice.  Despite having many lines, it's just a
sequence of checks, so it didn't seem like too much for a header.

Regards

