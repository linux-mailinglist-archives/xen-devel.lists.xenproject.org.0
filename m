Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DDB58FD85
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 15:39:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384631.620043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM8OY-0000qN-51; Thu, 11 Aug 2022 13:38:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384631.620043; Thu, 11 Aug 2022 13:38:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM8OY-0000ob-2C; Thu, 11 Aug 2022 13:38:42 +0000
Received: by outflank-mailman (input) for mailman id 384631;
 Thu, 11 Aug 2022 13:38:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eubj=YP=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1oM8OW-0000oV-81
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 13:38:40 +0000
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [2607:f8b0:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e71203f3-197a-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 15:38:38 +0200 (CEST)
Received: by mail-pf1-x42f.google.com with SMTP id h28so16481238pfq.11
 for <xen-devel@lists.xenproject.org>; Thu, 11 Aug 2022 06:38:38 -0700 (PDT)
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
X-Inumbo-ID: e71203f3-197a-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=xnHqZDNGnZc5b7MP7xNff02YIiaMYNtpO3qGseQwAUg=;
        b=ztgk7H9meRnG112AV5/iiM2wg7+CBWEDQnqIl8ERQD8vRw6VfJXbI5rVaD4EgpxOjA
         CXirhiDe2P6W2FJi0gf7+cawIk/tvG0vAT6kv7YUhDHEwvWhH0g0Xp9UBmfywHq1Us89
         45542KuCYXs4pUTGdrXJOLhPgTVUNwzUMNm7DSwdhSpAWYmQi7xhTAuFMWtIK/TYOhSv
         a6gy3qfgflUUuYwSwWpjqsX1Vh2voje0yaP45Yz+5v7uUaB56G44m1lBCTuwpLxHoyFi
         6mf4Jel6i0sU5ivnSwaYEA1bcj/JLpa8b6mwCu8RDRlfwyWGa86Q6/QCPs/Iz+3FuvU8
         bewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=xnHqZDNGnZc5b7MP7xNff02YIiaMYNtpO3qGseQwAUg=;
        b=0trGHVDawt0iUcTn98DhTY2pZ+Z4tJX3SGebInwEpkFvBXq/4YStpCR5O3bMgngfgh
         91JqdBmzcTwPlucDjFbrETuouQjyFdiIVTj6/EeN45GQaNHI7hDrmrGcz42JTUYrb546
         LWke59iycsk+QxqQ9uA4aH4+HGFz/XVTUNhs8EoAS37JHcqucEyYB5JGGB1HfQWtdhtH
         IFDcvhhndxdN43plrGq+4rS2clo9oOs1bMDiy4WrstS0txTXeq9w2kPFWHt/Lfi4qeDT
         hMG1yOaY02HzPkyDcGDOhaQQDqkuqcsZLzQ58bIph2THQln7gg43Hmns4CmTCUiAeYsX
         y0dA==
X-Gm-Message-State: ACgBeo3YhWTG9/SHNvnR8pp+kaqMlUAecxaYWMXd+LLq1NWRYKbj2q1B
	WvNQd6pwZNYZE9hIyVStbM5izTAk7JKkKM8yZOVXQg==
X-Google-Smtp-Source: AA6agR5wvQL2hXktVlLrd7PxdcVfdJeJ+31PFw0jutE15Cvic2Q5ZO8CK2Vg4I3GmkpdAOqzfK7DRwsytzSD1SvLhbM=
X-Received: by 2002:a62:30c7:0:b0:52f:9a31:5935 with SMTP id
 w190-20020a6230c7000000b0052f9a315935mr13531307pfw.14.1660225116535; Thu, 11
 Aug 2022 06:38:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220622134219.1596613-1-jens.wiklander@linaro.org>
 <20220622134219.1596613-3-jens.wiklander@linaro.org> <a6610563-38b2-bb66-feab-df2ea29a9bb8@xen.org>
 <CAHUa44GLbbnxrKWQP2ZLGJO_rDUukdiO4_jOs8Ai55iLFh5YmQ@mail.gmail.com> <2444aee6-13b6-a208-d6ba-89c42b43315e@xen.org>
In-Reply-To: <2444aee6-13b6-a208-d6ba-89c42b43315e@xen.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 11 Aug 2022 15:38:25 +0200
Message-ID: <CAHUa44G1Ea6Ry_TTPzOGG9yqFYabnPQbtsUc49048DCJd36BkQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] xen/arm: add FF-A mediator
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Bertrand.Marquis@arm.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, Jul 28, 2022 at 9:41 PM Julien Grall <julien@xen.org> wrote:
>
> Hi,
>
> On 27/07/2022 07:33, Jens Wiklander wrote:
> > On Fri, Jul 8, 2022 at 9:54 PM Julien Grall <julien@xen.org> wrote:
> >>> +    unsigned int n;
> >>> +    unsigned int m;
> >>> +    p2m_type_t t;
> >>> +    uint64_t addr;
> >>> +
> >>> +    for ( n = 0; n < range_count; n++ )
> >>> +    {
> >>> +        for ( m = 0; m < range[n].page_count; m++ )
> >>> +        {
> >>> +            if ( pg_idx >= shm->page_count )
> >>> +                return FFA_RET_INVALID_PARAMETERS;
> >>
> >> Shouldn't we call put_page() to drop the references taken by
> >> get_page_from_gfn()?
> >
> > Yes, and that's done by put_shm_pages(). One would normally expect
> > get_shm_pages() to do this on error, but that's not needed here since
> > we're always calling put_shm_pages() just before freeing the shm. I
> > can change to let get_shm_pages() do the cleanup on error instead if
> > you prefer that.
>
> I am fine with the current approach. I would suggest to document it on
> top of get_shm_pages().
>
> Also, if you expect put_shm_pages() to always be called before freeing
> shm, then I think it would be worth adding an helper that is doing the
> two. So the requirement is clearer.

OK, I'll fix.

>
> [...]
>
> >>
> >> How do you guarantee that both Xen and the domain agree on the page size?
> >
> > For now, I'll add a BUILD_BUG_ON() to check that the hypervisor page
> > size is 4K  to simplify the initial implementation. We can update to
> > support a larger minimal memory granule later on.
>
> I am fine with that. FWIW, this is also what we did in the OP-TEE case.
>
> >>> +    for ( n = 1; n < shm->page_count; last_pa = pa, n++ )
> >>> +    {
> >>> +        pa = page_to_maddr(shm->pages[n]);
> >>> +        if ( last_pa + PAGE_SIZE == pa )
> >>> +        {
> >>
> >> Coding style: We usually avoid {} for single line.
> >
> > OK
> >
> >>
> >>> +            continue;
> >>> +        }
> >>> +        region_descr->address_range_count++;
> >>> +    }
> >>> +
> >>> +    tot_len = sizeof(*descr) + sizeof(*mem_access_array) +
> >>> +              sizeof(*region_descr) +
> >>> +              region_descr->address_range_count * sizeof(*addr_range);
> >>
> >> How do you make sure that you will not write past the end of ffa_tx?
> >>
> >> I think it would be worth to consider adding an helper that would allow
> >> you to allocate space in ffa_tx and zero it. This would return an error
> >> if there is not enough space.
> >
> > That's what I'm doing with frag_len. If the descriptor cannot fit it's
> > divided into fragments that will fit.
>
> Oh, so this is what the loop below is for, am I correct? If so, I would
> suggest to document a bit the code because this function is fairly
> confusing to understand.

Yeah, I'm sorry about that. I'll add a comment describing what's going on.

>
> [...]
>
> >>> +    if ( read_atomic(&mem_access->access_perm.perm) != FFA_MEM_ACC_RW )
> >>> +    {
> >>> +        ret = FFA_RET_NOT_SUPPORTED;
> >>> +        goto out_unlock;
> >>> +    }
> >>> +
> >>> +    region_offs = read_atomic(&mem_access->region_offs);
> >>> +    if ( sizeof(*region_descr) + region_offs > frag_len )
> >>> +    {
> >>> +        ret = FFA_RET_NOT_SUPPORTED;
> >>> +        goto out_unlock;
> >>> +    }
> >>> +
> >>> +    region_descr = (void *)((vaddr_t)ctx->tx + region_offs);
> >>> +    range_count = read_atomic(&region_descr->address_range_count);
> >>> +    page_count = read_atomic(&region_descr->total_page_count);
> >>> +
> >>> +    shm = xzalloc_flex_struct(struct ffa_shm_mem, pages, page_count)
> >> This will allow a guest to allocate an arbitrarily large array in Xen.
> >> So please sanitize page_count before using it.
> >
> > This is tricky, what is a reasonable limit?
>
> Indeed. We need a limit that will prevent an untrusted domain to DoS Xen
> and at the same doesn't prevent the majority of well-behave domain to
> function.
>
> How is this call going to be used?
>
> > If we do set a limit the
> > guest can still share many separate memory ranges.
>
> This would also need to be limited if there is a desire to support
> untrusted domain.

I see that someone obviously has asked the same questions about the
OP-TEE mediator in the TEE mediator framework. I'll try the same
approach with limit etc since I guess the use-case there and here at
least initially will be similar.

>
> [...]
>
> >>> +    ret = get_shm_pages(d, shm, region_descr->address_range_array, range_count,
> >>> +                        0, &last_page_idx);
> >>> +    if ( ret )
> >>> +        goto out;
> >>> +    if ( last_page_idx != shm->page_count )
> >>> +    {
> >>> +        ret = FFA_RET_INVALID_PARAMETERS;
> >>> +        goto out;
> >>> +    }
> >>> +
> >>> +    /* Note that share_shm() uses our tx buffer */
> >>> +    spin_lock(&ffa_buffer_lock);
> >>> +    ret = share_shm(shm);
> >>> +    spin_unlock(&ffa_buffer_lock);
> >>> +    if ( ret )
> >>> +        goto out;
> >>> +
> >>> +    spin_lock(&ffa_mem_list_lock);
> >>> +    list_add_tail(&shm->list, &ffa_mem_list);
> >>
> >> A couple of questions:
> >>     - What is the maximum size of the list?
> >
> > Currently, there is no limit. I'm not sure what is a reasonable limit
> > more than five for sure, but depending on the use case more than 100
> > might be excessive.
> This is fine to be excessive so long it doesn't allow a guest to drive
> Xen out of memory or allow long running operations.
>
> As I wrote above, the idea is we need limits that protect Xen but at the
> same time doesn't prevent the majority well-behave guest to function.
>
> As this is a tech preview, the limits can be low. We can raise the
> limits as we get a better understanding how this will be used.

OK.

Thanks for the review.

Cheers,
Jens

>
> Cheers,
>
> --
> Julien Grall

