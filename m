Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1DE82F337
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 18:32:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667936.1039645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPnHJ-0000RI-F0; Tue, 16 Jan 2024 17:31:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667936.1039645; Tue, 16 Jan 2024 17:31:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPnHJ-0000P2-Bo; Tue, 16 Jan 2024 17:31:09 +0000
Received: by outflank-mailman (input) for mailman id 667936;
 Tue, 16 Jan 2024 17:31:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AzGb=I2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rPnHH-0000Ou-Rh
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 17:31:07 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04c6ab29-b495-11ee-9b0f-b553b5be7939;
 Tue, 16 Jan 2024 18:31:02 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3366e78d872so10237848f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jan 2024 09:31:02 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 u2-20020a5d5142000000b00337bfd9bd47sm383876wrt.73.2024.01.16.09.31.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jan 2024 09:31:01 -0800 (PST)
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
X-Inumbo-ID: 04c6ab29-b495-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705426261; x=1706031061; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LdS0Cxz54THmi7JrdZvsgp/JMlWr4E1vbYMIyrMxIIg=;
        b=QuKFa/OcN2X8LIt64+YEPV0EnyAapujxr/ikDHrHVvGUqvk3xAEVmAUQGeZpkGo4co
         6bKUmcfvzPIsdP+jl3jezFRdZpfe5zbvFKWq3JGSIZX0fJLf/SsvC/Q10No39xQkDTQR
         M/gI1Ko5akwsgjvvqx74jKqeh+OVzhLQHZDak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705426261; x=1706031061;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LdS0Cxz54THmi7JrdZvsgp/JMlWr4E1vbYMIyrMxIIg=;
        b=IA0H2AQLicQI/Vd7UH8UyJDFF7li/INPLMp4WV3wt0nrpaxnA9zqRvx1lb/9omz7QF
         ndmEx7BKT4TIoJM58IISV1XgXN4BBVlCuKCw3lTYw2OEd8iF+t8M5eQLvYghOXhMfRsd
         vTlVbVwve/3gsoY4kXmk9Nalbi38TaFpYx3YVdKUqTDW+gjBwzUxCitfRTCjAFt87tS+
         OsTvzpL3xzCe3AJi8nZ2ctswY9SlqEXRWC+QCGPoANbTPdhDkzFmN56LagzQQnSZyNTj
         B4oABbNmAFTrS6Sg26Kh15OzTPCZkz/IbOPOltLzTWTzpOTtp/3KpzULmxfPhDe47uv+
         QTtw==
X-Gm-Message-State: AOJu0YyWSVC4J9rzXAov/DgPG1ZezusFfr76aI6RrfiHO0hPw18TtmDr
	KD3DMZb7IhtgMHYVtL68xanSv3frzLq+Mg==
X-Google-Smtp-Source: AGHT+IFo+GTlnKOrBzYD4jaPBNW1enFUjg6Z3NlXjkaIgYWxptQZAOma4B1NUkq1sV6WGY8UFSkLmw==
X-Received: by 2002:a5d:6ac4:0:b0:336:5423:6c9c with SMTP id u4-20020a5d6ac4000000b0033654236c9cmr2300110wrw.16.1705426261475;
        Tue, 16 Jan 2024 09:31:01 -0800 (PST)
Message-ID: <3623ab9b-903e-4576-81b9-c6debe0f900c@citrix.com>
Date: Tue, 16 Jan 2024 17:31:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/PV: use altcall for I/O emulation quirk hook
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <5f7afa11-3216-4175-b05b-3ff78920fa00@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <5f7afa11-3216-4175-b05b-3ff78920fa00@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/01/2024 4:58 pm, Jan Beulich wrote:
> This way we can arrange for ioemul_handle_proliant_quirk()'s ENDBR to
> also be zapped. Utilize existing data rather than introducing another
> otherwise unused static variable (array); eventually (if any new quirk
> was in need of adding) we may want to use .callback and .driver_data
> anyway.
>
> For the decision to be taken before the 2nd alternative patching pass,
> the initcall needs to become a pre-SMP one.
>
> While touching this code, also arrange for it to not be built at all
> when !PV - that way the respective ENDBR won't be there from the
> beginning.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Obviously the file may want moving to pv/ then. I wasn't sure whether
> to also fold doing so right into here.

For PVH dom0, we allow almost blanket IO port access.  We could do the
same for PV dom0 by setting up a suitable TSS IO port bitmap.

That said, x86-S is soon to revoke the ability to do that, so maybe we
just save ourselves the work...


I'm confused about "rather than introducing another otherwise unused
static variable (array)".  Why an array?

In this instance, you could use the same trick as the ctxt switch mask. 
Whether we match DMI or not, it's safe to clobber the ENDBR.  We could
also consider a __{read_mostly,ro_after_init}_cf_clobber sections.


However, it's probably better still to have a `bool prolient_quirk` and
a direct call.  No extra vendor hooks have been added since this was
introduced in 2007, and I really don't foresee this changing in the near
future.  Lets just simplify it and drop all the alternatives/clobbering
games entirely.

~Andrew

