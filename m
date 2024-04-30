Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 003498B765C
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 14:55:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714850.1116189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1n0d-0001WK-57; Tue, 30 Apr 2024 12:54:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714850.1116189; Tue, 30 Apr 2024 12:54:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1n0d-0001Un-2Z; Tue, 30 Apr 2024 12:54:59 +0000
Received: by outflank-mailman (input) for mailman id 714850;
 Tue, 30 Apr 2024 12:54:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ve62=MD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s1n0c-0001Kt-86
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 12:54:58 +0000
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [2607:f8b0:4864:20::731])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8274c09-06f0-11ef-b4bb-af5377834399;
 Tue, 30 Apr 2024 14:54:56 +0200 (CEST)
Received: by mail-qk1-x731.google.com with SMTP id
 af79cd13be357-78f05afc8d6so427921585a.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 05:54:56 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 v5-20020a0cf905000000b006a0d1d120cesm1637150qvn.125.2024.04.30.05.54.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 05:54:55 -0700 (PDT)
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
X-Inumbo-ID: d8274c09-06f0-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714481695; x=1715086495; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dT5Vz5WNlZUNU2nxll5+WFrdcNYRtO/WY3YdcwOW1kw=;
        b=t9qnYOxmKZSJoX2+M2as1J5ZTxfHbnittK7SPR/gX6osBZ/qTteDUqxouie0P+cUfn
         nRcdWq8v683yXTFfGPjDgBAkNZATGx5CL1bv9qnGRs9Au2G11EJaNs2Qtxs+VNuZcvl5
         ePyl2gXWME9IJki/HMPOX0gy5o0iS82GCqTYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714481695; x=1715086495;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dT5Vz5WNlZUNU2nxll5+WFrdcNYRtO/WY3YdcwOW1kw=;
        b=hH+bEyvzziHOPbmDURLa7vK/j2C3kG+KY6yPnFY+/7JMOGCn2Z/NufPrNJssg6gPhq
         6KcJo0no5gVu9kf0321q9FT36wQUVlBWX9bTuPFl6sUug6GfgoLw/MwnddsHGN8IZ8h9
         Q8WjLLCXBE6EZAf04d6+cubIgiJtcj6hlgZgWWwbD0SVds8Rv7D1cg2fzAElBdL7vndi
         F/1nj0NKEE/gWiFzs7LRsoYBcjtOFYd60gxsNy1m7QXiOAZwoXqXlmFhA5vm8LdARZQo
         RTLe9/ABlpqbjGdTUWkosi4XX4iIpL9Ft6NrDTNbJQ6eJL7PRhSNqfO2CW/+kRBzQKWX
         DLOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoe12hAk/gECpWA722OcMwfCXksHHZ8giTo6dE2y2+X3e9C0QWIvf6zPJQy4UhbMOvglTmvP7L+cyZy8A+0nX1N74g9/RR1XIvaecHs0E=
X-Gm-Message-State: AOJu0Ywd6iEM00JrPgydK23XtxUgxVYJBB5rOUOuVgUDY2nbNo1kY3Jr
	HQ2pZHhYyp3OwWTc5ympUkvJT6sU5KXPadUhDzQ45Rn2hDwKYK9KbInnOlTFBHM=
X-Google-Smtp-Source: AGHT+IGtbsJnve4hf+Yudr4YftkinK0rmwobE0KBeoLEh7kMnqy73HjyiTb2CZi7FD/IjwkDus5bYQ==
X-Received: by 2002:a05:6214:d48:b0:6a0:5673:e50e with SMTP id 8-20020a0562140d4800b006a05673e50emr15756370qvr.53.1714481695384;
        Tue, 30 Apr 2024 05:54:55 -0700 (PDT)
Date: Tue, 30 Apr 2024 14:54:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony@xenproject.org>,
	xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.19] tools/xen-cpuid: switch to use cpu-policy
 defined names
Message-ID: <ZjDqHfdjUE1CTk1W@macbook>
References: <20240430082901.77662-1-roger.pau@citrix.com>
 <78d009f4-6610-4fcf-9cdc-ee1081e6c763@suse.com>
 <ZjDVN6kexFD0vcT2@macbook>
 <f1e594f7-2bf2-4898-824f-abd407690644@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1e594f7-2bf2-4898-824f-abd407690644@suse.com>

On Tue, Apr 30, 2024 at 02:06:38PM +0200, Jan Beulich wrote:
> On 30.04.2024 13:25, Roger Pau Monné wrote:
> > On Tue, Apr 30, 2024 at 12:37:44PM +0200, Jan Beulich wrote:
> >> On 30.04.2024 10:29, Roger Pau Monne wrote:
> >>>  static const struct {
> >>>      const char *name;
> >>>      const char *abbr;
> >>> -    const char *const *strs;
> >>
> >> While how you're doing it looks all technically correct (so even without
> >> changes I may later ack this as is), I'm still a little puzzled. I was
> >> kind of expecting xen-cpuid.py to be extended to supply another (set
> >> of) #define(s) more suitable for use here. In particular, while
> >> performance surely isn't of much concern in this tool, ...
> >>
> >>> @@ -301,21 +52,32 @@ static const char *const fs_names[] = {
> >>>      [XEN_SYSCTL_cpu_featureset_hvm_max] = "HVM Max",
> >>>  };
> >>>  
> >>> -static void dump_leaf(uint32_t leaf, const char *const *strs)
> >>> +static const char *find_name(unsigned int index)
> >>>  {
> >>> -    unsigned i;
> >>> +    static const struct feature_name {
> >>> +        const char *name;
> >>> +        unsigned int bit;
> >>> +    } feature_names[] = INIT_FEATURE_NAMES;
> >>> +    unsigned int i;
> >>>  
> >>> -    if ( !strs )
> >>> -    {
> >>> -        printf(" ???");
> >>> -        return;
> >>> -    }
> >>> +    for ( i = 0; i < ARRAY_SIZE(feature_names); i++ )
> >>> +        if ( feature_names[i].bit == index )
> >>> +            return feature_names[i].name;
> >>
> >> ... a linear search, repeated perhaps hundreds of times, looks still a
> >> little odd to me.
> > 
> > I didn't benchmark what kind of performance impact this change would
> > have on the tool, but I didn't think it was that relevant, as this is
> > a diagnostic/debug tool, and hence performance (unless it took seconds
> > to execute) shouldn't be that important.
> 
> As indicated, performance itself isn't much of a concern here. My earlier
> question wants reading in relation to the other question raised, regarding
> the script maybe wanting to produce macro(s) more suitable for the purpose
> here.

Hm, we could maybe produce an array of strings, one per feature bit
(features without names would get NULL).

I will see, albeit my python skills are very limited.

> > I could switch to a non-const array and sort it at the start in order
> > to do a binary search, but that might be over engineering it.
> 
> Switching to non-const would in particular not seem overly desirable to
> me.
> 
> >>> @@ -326,6 +88,7 @@ static void decode_featureset(const uint32_t *features,
> >>>                                const char *name,
> >>>                                bool detail)
> >>>  {
> >>> +    static const uint32_t known_features[] = INIT_KNOWN_FEATURES;
> >>>      unsigned int i;
> >>
> >> So this variable exists solely to ...
> >>
> >>> @@ -336,11 +99,14 @@ static void decode_featureset(const uint32_t *features,
> >>>      if ( !detail )
> >>>          return;
> >>>  
> >>> -    for ( i = 0; i < length && i < ARRAY_SIZE(decodes); ++i )
> >>> +    /* Ensure leaf names stay in sync with the policy leaf count. */
> >>> +    BUILD_BUG_ON(ARRAY_SIZE(known_features) != ARRAY_SIZE(leaf_names));
> >>
> >> ... calculate its size here. Thus relying on the compiler to not flag
> >> such effectively unused static const variables.
> > 
> > I wondered whether to add the unused attribute, but seeing as gitlab
> > didn't complain I've forgot to add it.  I could add it.
> 
> Actually I was rather trying to hint at omitting the variable altogether,
> like this:
> 
>    BUILD_BUG_ON(ARRAY_SIZE((unsigned[])INIT_KNOWN_FEATURES) != ARRAY_SIZE(leaf_names));
> 
> Yet I realize the look of it may not be liked, so adding the unused
> attribute (if a suitable abstraction exists in the tool stack) would
> probably be fine, too.

There's no abstraction ATM, but I could add one to common-macros.h as
part of the patch.

Thanks, Roger.

