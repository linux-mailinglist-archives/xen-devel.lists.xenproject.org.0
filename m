Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A928B8AF759
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 21:30:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710967.1110551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzLpr-0001Oj-Si; Tue, 23 Apr 2024 19:29:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710967.1110551; Tue, 23 Apr 2024 19:29:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzLpr-0001M6-Q7; Tue, 23 Apr 2024 19:29:47 +0000
Received: by outflank-mailman (input) for mailman id 710967;
 Tue, 23 Apr 2024 19:29:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6UPA=L4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rzLpq-0001M0-3P
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 19:29:46 +0000
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [2607:f8b0:4864:20::112f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d61378ad-01a7-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 21:29:44 +0200 (CEST)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-617e6c873f3so66364527b3.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 12:29:44 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 x17-20020ac85391000000b0043770fd3629sm5428121qtp.75.2024.04.23.12.29.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 12:29:42 -0700 (PDT)
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
X-Inumbo-ID: d61378ad-01a7-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713900583; x=1714505383; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tFeh65T9cDhQ2wbkH3+iEHfZ5mmu+JnRYETxtRR/Rkw=;
        b=aqFruu3x28JyIpRlfLTH+zzDwt69sL0Qq+YCx/o43X2iNMXM+iWDRQiCMf+yBgnIT/
         zmZarO8YVYkeuBVZ7K06exuaK6FY2yWWOY0erey0Mkv691SAycCCX27gqTALCy0nlrAe
         QgVoCL+ROQgVH6XiVy8vpj9jnNoY6UrEMGRbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713900583; x=1714505383;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tFeh65T9cDhQ2wbkH3+iEHfZ5mmu+JnRYETxtRR/Rkw=;
        b=qDlzivs2LnkJFNjj5OFxDTPLpwVszb1CSCzh8TtzfzV/7jPix0kokx5JndoigdX5R3
         Pq4xK5yP7kz8MpkOn+VNvcNTC3bCyJHA7MQQYElVvRyPoRrXe3WuGSQ8wBToHVEufMya
         cLqK3Unu3r6tIq1C85de+/ZW05hMWATcAmJwu8ZtPl5/SFE/30wi+Uy08UDdiqdXJ/8e
         I35fWLsEAOrEC3pVrmrc73oKv18MqADuo4H2SfmtWLrUOrX829snoICajRHLn18RnlCD
         U253/hRuGbG+VMLhic7X1KaLuTfhTfTCMCUKEt5kZpWSZC4uga5IuGfFwf4PiDHu6r9h
         nyxA==
X-Forwarded-Encrypted: i=1; AJvYcCXWGyhYZjyvoDqrGe8FVKDrXGDzbhIig6UKzuPwOdA3ryB5sNU7PcxT50sf2EViazHRuu1VyN1ZYpPJlLbFF8goUSH20+IhfMds0+HXHPQ=
X-Gm-Message-State: AOJu0YzI3rs1/nM3rOkvjt5p03kBcL0FrFCaaPMZ7gcrSasQTF4k35UK
	3usyBkfODGpMUCzw2sb+QkJatAoymP/omh7rR2Qt0GUegBxz2dkEsYwnd72Qihk=
X-Google-Smtp-Source: AGHT+IHQMNOAQSxC3tbdGEz/E9cJa6oMMhcLl0jHBVEJYzC7jv8yY9N+yIUk25rBXVk03whxQHktQA==
X-Received: by 2002:a05:690c:6ac2:b0:618:1202:3222 with SMTP id ij2-20020a05690c6ac200b0061812023222mr460556ywb.38.1713900582903;
        Tue, 23 Apr 2024 12:29:42 -0700 (PDT)
Message-ID: <c38e488c-a3fb-4fcb-bd8c-b33c3fbfc2fa@citrix.com>
Date: Tue, 23 Apr 2024 20:29:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] x86/P2M: write_p2m_entry() is HVM-only anyway
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <0d846228-323b-4427-87d1-684c3d0047c5@suse.com>
 <296c3ecc-b04d-4734-a451-0d4f9ed312d4@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <296c3ecc-b04d-4734-a451-0d4f9ed312d4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/04/2024 3:31 pm, Jan Beulich wrote:
> The latest as of e2b2ff677958 ("x86/P2M: split out init/teardown
> functions") the function is obviously unreachable for PV guests.

This doesn't parse.  Do you mean "Since e2b2ff677958 ..." ?

>  Hence
> the paging_mode_enabled(d) check is pointless.
>
> Further host mode of a vCPU is always set, by virtue of
> paging_vcpu_init() being part of vCPU creation. Hence the
> paging_get_hostmode() check is pointless.
>
> With that the v local variable is unnecessary too. Drop the "if()"
> conditional and its corresponding "else".
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I have to confess that this if() has been puzzling me before.

Puzzling yes, but it can't blindly be dropped.

This is the "did the toolstack initiate this update" check.  i.e. I
think it's "bypass the normal side effects of making this update".

I suspect it exists because of improper abstraction between the guest
physmap and the shadow pagetables as-were - which were/are tighly
coupled to vCPUs even for aspects where they shouldn't have been.

For better or worse, the toolstack can add_to_physmap() before it
creates vCPUs, and it will take this path you're trying to delete. 
There may be other cases too; I could see foreign mapping ending up
ticking this too.

Whether we ought to permit a toolstack to do this is a different
question, but seeing as we explicitly intend (eventually for AMX) have a
set_policy call between domain_create() and vcpu_create(), I don't think
we can reasably restrict other hypercalls too in this period.

~Andrew

