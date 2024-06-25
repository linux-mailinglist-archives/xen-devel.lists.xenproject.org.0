Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D50A1916575
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 12:44:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747600.1155046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM3f6-0005yc-Vo; Tue, 25 Jun 2024 10:44:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747600.1155046; Tue, 25 Jun 2024 10:44:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM3f6-0005wV-Sw; Tue, 25 Jun 2024 10:44:32 +0000
Received: by outflank-mailman (input) for mailman id 747600;
 Tue, 25 Jun 2024 10:44:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vmrN=N3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sM3f5-0005wP-76
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 10:44:31 +0000
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [2607:f8b0:4864:20::1131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5215b74-32df-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 12:44:28 +0200 (CEST)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-632597a42b8so47889297b3.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 03:44:28 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b51ed16142sm43441276d6.31.2024.06.25.03.44.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jun 2024 03:44:26 -0700 (PDT)
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
X-Inumbo-ID: e5215b74-32df-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719312267; x=1719917067; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WgWtGWDisyl5UE7KYOMuG0SxuCrtt+a2R5+E4pVs6MU=;
        b=al8p1iFZenAQ2idLqttmtIlmKUqsJOM0TvkqCSvyvkeX+riOjkgAiRsFUrsrdrSZiN
         F678UCXLFtwkDCuRR0UJYsNfPKt9k5MVIbAwwnqliJ75F41ndr2HHt8h48czI7y2o5Aq
         3iHOKP9LMX+5AFY7++Z4joKRJXsE6hKBYzxe4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719312267; x=1719917067;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WgWtGWDisyl5UE7KYOMuG0SxuCrtt+a2R5+E4pVs6MU=;
        b=m6o23enyBeA7ZUfNGMSsQoJtBI9oZMB5JeN24BgfjkN+uIxXETuc7WDxB3pazdQKJ/
         1hDLei2ay+qlWLBg8i2M01/v0+a1uc28VuK7FS9IYOBOywWb69mY/AzUE54gGIooGBcn
         5jJzds9QQWD2T7QmtfNB2LemEi5zL+mlzOWKrxU/PwZNojLFVNcQhIMCFzYo8MEE6UUJ
         EekeQZEu7ULvi/MxSQTz+iBz7DQBmLkj/RMrc5JFBSpPE/55a/CbihID4CZxInsNKvxa
         ETkbp00hRt67NGjKXUSOrAZKbx6y1C4L191/gV3Sb05Vfwm4tQ1f014c1/aeljwmCfQ0
         dllg==
X-Forwarded-Encrypted: i=1; AJvYcCVBSpEAVBP5ouXhMqFZWJDCfWaH2G7BqCBVvbOmwWnk2BOWkREyrk7CcE25T1yCFrA+PsiyYNFmETv7StkcycYphGiuXlcke3ED5DF7fOs=
X-Gm-Message-State: AOJu0YxE8mc+muoLp2vkZZnlfpW/J6XSVJwlx/leInDMLfIv/4n+06LJ
	FZkzy1/+twdj7f2Es9UxxwkmHT3Bb+AUwb6hA0IJfYmgI8AuG7NagI/Cf3u1MIc=
X-Google-Smtp-Source: AGHT+IGsOxgT0M+W9AGXUG2DiWEBpIAwvFcs1E2V/hS+x7wOIyROwn5T7fJ1gv0fKoFCEe6ZMiqzoA==
X-Received: by 2002:a81:9e12:0:b0:62f:7829:6eaa with SMTP id 00721157ae682-643aa2baaccmr74695697b3.15.1719312266983;
        Tue, 25 Jun 2024 03:44:26 -0700 (PDT)
Message-ID: <3fa398eb-368a-48dd-9324-a46573c0289c@citrix.com>
Date: Tue, 25 Jun 2024 11:43:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] gnttab: fix compat query-size handling
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <00bb4998-d0a7-43dc-8d3c-abb3f66661cc@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <00bb4998-d0a7-43dc-8d3c-abb3f66661cc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/06/2024 8:30 am, Jan Beulich wrote:
> The odd DEFINE_XEN_GUEST_HANDLE(), inconsistent with all other similar
> constructs, should have caught my attention. Turns out it was needed for
> the build to succeed merely because the corresponding #ifndef had a
> typo. That typo in turn broke compat mode guests, by having query-size
> requests of theirs wire into the domain_crash() at the bottom of the
> switch().
>
> Fixes: 8c3bb4d8ce3f ("xen/gnttab: Perform compat/native gnttab_query_size check")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Looks like set-version is similarly missing in the set of structures
> checked, but I'm pretty sure that we will now want to defer taking care
> of that until after 4.20 was branched.
>
> --- a/xen/common/compat/grant_table.c
> +++ b/xen/common/compat/grant_table.c
> @@ -33,7 +33,6 @@ CHECK_gnttab_unmap_and_replace;
>  #define xen_gnttab_query_size gnttab_query_size
>  CHECK_gnttab_query_size;
>  #undef xen_gnttab_query_size
> -DEFINE_XEN_GUEST_HANDLE(gnttab_query_size_compat_t);
>  
>  DEFINE_XEN_GUEST_HANDLE(gnttab_setup_table_compat_t);
>  DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_compat_t);
> @@ -111,7 +110,7 @@ int compat_grant_table_op(
>      CASE(copy);
>  #endif
>  
> -#ifndef CHECK_query_size
> +#ifndef CHECK_gnttab_query_size
>      CASE(query_size);
>  #endif
>  

/sigh - I almost rejected your and Stefano's feedback on v1 on the basis
that it didn't compile, but then I adjusted it to look like the
surrounding logic.  Much fool me.

But, this change *cannot* be correct.  The result is:

$ git grep -C3 CHECK_gnttab_query_size
compat/grant_table.c-31-#undef xen_gnttab_unmap_and_replace
compat/grant_table.c-32-
compat/grant_table.c-33-#define xen_gnttab_query_size gnttab_query_size
compat/grant_table.c:34:CHECK_gnttab_query_size;
compat/grant_table.c-35-#undef xen_gnttab_query_size
compat/grant_table.c-36-
compat/grant_table.c-37-DEFINE_XEN_GUEST_HANDLE(gnttab_setup_table_compat_t);
--
compat/grant_table.c-110-    CASE(copy);
compat/grant_table.c-111-#endif
compat/grant_table.c-112-
compat/grant_table.c:113:#ifndef CHECK_gnttab_query_size
compat/grant_table.c-114-    CASE(query_size);
compat/grant_table.c-115-#endif
compat/grant_table.c-116-

and the second is dead code because CHECK_gnttab_query_size is defined. 
It shouldn't be there.

So - my v1 was correct, and your and Stefano's feedback on v1 was incorrect.


The problem is, of course, that absolutely none of this is written down,
and none of the logic one needs to read to figure out it is even checked
into the tree.  It's entirely automatic and not even legible in its
intermediate form.

We are going to start with writing down a very simple set of
instructions for how the compat infrastructure works and how it should
be used.  If it's too complicated I will delete bits until it becomes
manageable, because this is completely insane.

~Andrew

