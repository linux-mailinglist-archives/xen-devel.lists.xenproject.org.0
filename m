Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2B725F39A
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 09:11:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFBIi-00005S-BJ; Mon, 07 Sep 2020 07:10:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fIG9=CQ=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kFBIg-00005N-8B
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 07:10:50 +0000
X-Inumbo-ID: 354c2ca2-63c1-4bf0-92ca-5a503510dbbb
Received: from mail-wr1-x431.google.com (unknown [2a00:1450:4864:20::431])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 354c2ca2-63c1-4bf0-92ca-5a503510dbbb;
 Mon, 07 Sep 2020 07:10:49 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id c18so14558093wrm.9
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2020 00:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=EdK5cmNhJC69jXVQIpwY6lwwuS/M8Zw5Jeud6J8OYpM=;
 b=oQGepoKu4qrqIHFWuqNyiVrv0S1YaRNkxGaoJ4PY6U9Uxmbqkl65AIpnAnKu2zt4vC
 uY9shj+DX1W85WvHYx0q8RNS+ZpENirvvsSKN8F812W2bpZjYr+1uUL4StGy0FCIP8af
 qJ3R4d8Z0vI3hmuoD4YDI0oamL+JyjMIl/7oJK3zeg9UdXZfsw+/okGS4k3n+2qHmeP4
 uwZnHKhDziCHO8xxZ4vx8Ucn3QxR80q6FtPHwE9fHFh2mFkfMAe5kAkgcvjP2EhRbxIy
 yyoa6p/nOmrIE6MzUW6p+itUhdYwOwYhhvWyXFnRfr3GVYYKUJXZl5O6BYa78G9W+7Cx
 5+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=EdK5cmNhJC69jXVQIpwY6lwwuS/M8Zw5Jeud6J8OYpM=;
 b=ImIwKNQ0rw/zZSzyrZ0f9x9909vvMyryOY65Xihmxese5HVjVVMjnCBJoyrXWcDvyB
 /KwBw//u9Xk+W583q0DnssedJ15BsV6vc81KQ2R+vdGHYMICYtzl2pVk7wArsJS6Oexp
 Tru8M7gClnc8nMWR5pnBxMdQeWQrPkVJgs+Ue/hLVsDPmOIDVpG/WR0SHC1YXNTx7EiO
 hGFIyY/pYPSN+R+qEfVkpCTzTDsn13dCdQGI2a0Ka5k6vWf4fLQNt8qQSQdvJ5K1m4T3
 2d+7X3hubHFcV7vRVZmWeyx3zggmoD3eVE6WdX8/5vLrelnm2FiBpjz7U0XC3slnsgX6
 uHFQ==
X-Gm-Message-State: AOAM531DZwJog0wWU6KEKMIxNDN/kucPp6lWc57StQl8CDXXxljgeYLe
 RpPIg+za1epaaXbDt7ea+Vk=
X-Google-Smtp-Source: ABdhPJx4yjfo9tUSyA+HjFAjynFKlp0ymO3ImdvYIJv5HtvFDwm7+vWSuFMRzZKF9oeKBZdritO+JQ==
X-Received: by 2002:adf:fc92:: with SMTP id g18mr21454385wrr.201.1599462648083; 
 Mon, 07 Sep 2020 00:10:48 -0700 (PDT)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:2027:c75d:4528:a82d])
 by smtp.gmail.com with ESMTPSA id s17sm27625143wrr.40.2020.09.07.00.10.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Sep 2020 00:10:47 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
 "'Ian Jackson'" <ian.jackson@eu.citrix.com>, "'Wei Liu'" <wl@xen.org>,
 "'George Dunlap'" <george.dunlap@citrix.com>,
 "'Julien Grall'" <julien@xen.org>,
 "'Stefano Stabellini'" <sstabellini@kernel.org>, <paul@xen.org>,
 "'Jan Beulich'" <jbeulich@suse.com>
References: <20200818103032.3050-1-paul@xen.org>
 <20200818103032.3050-8-paul@xen.org>
 <cd33c5ce-ea85-6576-b9f2-b4dec90d5025@suse.com>
 <003501d682e0$f4e8a1e0$deb9e5a0$@xen.org>
 <174bb33f-9acb-dc52-76d1-e1ad7a350dc1@suse.com>
In-Reply-To: <174bb33f-9acb-dc52-76d1-e1ad7a350dc1@suse.com>
Subject: RE: [EXTERNAL] [PATCH v7 7/9] common/domain: add a domain context
 record for shared_info...
Date: Mon, 7 Sep 2020 08:11:38 +0100
Message-ID: <003b01d684e6$21857ff0$64907fd0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHWhOTS49gHRTwbh0qbz9ndNWSq2qlcwh0Q
Content-Language: en-gb
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 07 September 2020 08:01
> To: paul@xen.org
> Cc: xen-devel@lists.xenproject.org; Durrant, Paul <pdurrant@amazon.co.uk>; 'Ian Jackson'
> <ian.jackson@eu.citrix.com>; 'Wei Liu' <wl@xen.org>; 'Andrew Cooper' <andrew.cooper3@citrix.com>;
> 'George Dunlap' <george.dunlap@citrix.com>; 'Julien Grall' <julien@xen.org>; 'Stefano Stabellini'
> <sstabellini@kernel.org>
> Subject: RE: [EXTERNAL] [PATCH v7 7/9] common/domain: add a domain context record for shared_info...
> 
> CAUTION: This email originated from outside of the organization. Do not click links or open
> attachments unless you can confirm the sender and know the content is safe.
> 
> 
> 
> On 04.09.2020 19:29, Paul Durrant wrote:
> >> From: Jan Beulich <jbeulich@suse.com>
> >> Sent: 26 August 2020 14:58
> >>
> >> On 18.08.2020 12:30, Paul Durrant wrote:
> >>> v7:
> >>>  - Only restore vcpu_info and arch sub-structures for PV domains, to match
> >>>    processing of SHARED_INFO in xc_sr_restore_x86_pv.c
> >>
> >> Since you point out this original logic, ...
> >>
> >>> +static int load_shared_info(struct domain *d, struct domain_context *c)
> >>> +{
> >>> +    struct domain_shared_info_context ctxt;
> >>> +    size_t hdr_size = offsetof(typeof(ctxt), buffer);
> >>> +    unsigned int i;
> >>> +    int rc;
> >>> +
> >>> +    rc = DOMAIN_LOAD_BEGIN(SHARED_INFO, c, &i);
> >>> +    if ( rc )
> >>> +        return rc;
> >>> +
> >>> +    if ( i ) /* expect only a single instance */
> >>> +        return -ENXIO;
> >>> +
> >>> +    rc = domain_load_data(c, &ctxt, hdr_size);
> >>> +    if ( rc )
> >>> +        return rc;
> >>> +
> >>> +    if ( ctxt.buffer_size > sizeof(shared_info_t) ||
> >>> +         (ctxt.flags & ~DOMAIN_SAVE_32BIT_SHINFO) )
> >>> +        return -EINVAL;
> >>> +
> >>> +    if ( ctxt.flags & DOMAIN_SAVE_32BIT_SHINFO )
> >>> +    {
> >>> +#ifdef CONFIG_COMPAT
> >>> +        has_32bit_shinfo(d) = true;
> >>> +#else
> >>> +        return -EINVAL;
> >>> +#endif
> >>> +    }
> >>> +
> >>> +    if ( is_pv_domain(d) )
> >>> +    {
> >>> +        shared_info_t *shinfo = xmalloc(shared_info_t);
> >>> +
> >>> +        rc = domain_load_data(c, shinfo, sizeof(*shinfo));
> >>> +        if ( rc )
> >>> +        {
> >>> +            xfree(shinfo);
> >>> +            return rc;
> >>> +        }
> >>> +
> >>> +#ifdef CONFIG_COMPAT
> >>> +        if ( has_32bit_shinfo(d) )
> >>> +        {
> >>> +            memcpy(&d->shared_info->compat.vcpu_info,
> >>> +                   &shinfo->compat.vcpu_info,
> >>> +                   sizeof(d->shared_info->compat.vcpu_info));
> >>> +            memcpy(&d->shared_info->compat.arch,
> >>> +                   &shinfo->compat.arch,
> >>> +                   sizeof(d->shared_info->compat.vcpu_info));
> >>> +        }
> >>> +        else
> >>> +        {
> >>> +            memcpy(&d->shared_info->native.vcpu_info,
> >>> +                   &shinfo->native.vcpu_info,
> >>> +                   sizeof(d->shared_info->native.vcpu_info));
> >>> +            memcpy(&d->shared_info->native.arch,
> >>> +                   &shinfo->native.arch,
> >>> +                   sizeof(d->shared_info->native.arch));
> >>> +        }
> >>> +#else
> >>> +        memcpy(&d->shared_info->vcpu_info,
> >>> +               &shinfo->vcpu_info,
> >>> +               sizeof(d->shared_info->vcpu_info));
> >>> +        memcpy(&d->shared_info->arch,
> >>> +               &shinfo->arch,
> >>> +               sizeof(d->shared_info->shared));
> >>> +#endif
> >>
> >> ... where does the rest of that logic (resetting of
> >> arch.pfn_to_mfn_frame_list_list, evtchn_pending, evtchn_mask, and
> >> evtchn_pending_sel) get done? Or why is it not needed anymore?
> >
> > The resetting logic is still in xc_sr_restore_x86_pv.c (see patch #6).
> > It's going to need to stay there anyway to deal with older streams so
> > I made it common to both cases; it seems slightly separate from
> > restoring the shared info.
> 
> I guess I at least don't fully agree: The resetting is part of restoring,
> as it effectively determines which parts are restored and which parts
> are simply set (not truly reset, but I agree the perception may change
> depending on whose position you take). Hence at the very least this
> aspect wants clearly spelling out in the description, I think. But
> really I'd prefer if for old streams libxc took care of (all of) it,
> and if for new streams all logic lived in the hypervisor.
> 

Andrew, do you have an opinion either way?

  Paul

> Jan


