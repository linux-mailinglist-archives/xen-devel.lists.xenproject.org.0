Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 844137A2E67
	for <lists+xen-devel@lfdr.de>; Sat, 16 Sep 2023 09:38:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603520.940539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhPrU-0007eP-8q; Sat, 16 Sep 2023 07:37:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603520.940539; Sat, 16 Sep 2023 07:37:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhPrU-0007bo-5J; Sat, 16 Sep 2023 07:37:04 +0000
Received: by outflank-mailman (input) for mailman id 603520;
 Sat, 16 Sep 2023 07:37:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V1Uw=FA=gmail.com=jinoh.kang.kr@srs-se1.protection.inumbo.net>)
 id 1qhPrT-0007bg-2R
 for xen-devel@lists.xenproject.org; Sat, 16 Sep 2023 07:37:03 +0000
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [2607:f8b0:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2a28550-5463-11ee-8788-cb3800f73035;
 Sat, 16 Sep 2023 09:37:01 +0200 (CEST)
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-53fa455cd94so2135167a12.2
 for <xen-devel@lists.xenproject.org>; Sat, 16 Sep 2023 00:37:01 -0700 (PDT)
Received: from [10.137.0.57] ([14.33.99.107]) by smtp.gmail.com with ESMTPSA id
 h18-20020a62b412000000b0066684d8115bsm4115010pfn.178.2023.09.16.00.36.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Sep 2023 00:36:59 -0700 (PDT)
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
X-Inumbo-ID: d2a28550-5463-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694849820; x=1695454620; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j0S51/pBUY6hmXFoUgUPjQ7JL3/euyO3Px8Jqn+fpdk=;
        b=Dq/0SAvxQuxglJycLd9dyGmJwn1xYKmstmVlei5x9tZeWRVqcSlorqhvgeJEx1wN9Z
         V3eXeBmKHLCQc4B794oXdfhpvdyWi/648PKiGqnNkPfyQyInMZJ2SmJQZ6L/UbMOOD4I
         QBsjFw8PJAFwmaQd1JBVyE7ZebvCmmQATbrl9xrWlJuQ17PvWxs2W05pobKi4WvCtUYl
         9Q6AvZnqsaoFeu5H7NaExz4MDithqPyIhGSoaUbyiaL6dqsJWYtQ5Ny0Lf4uRFgDVU0h
         a9frhIket0rfdzNJH8jSGOhGTpdTQOD9ZzRwIPnt+9NMRNKpAmHvRk8SN2ENaxeg7g6+
         yfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694849820; x=1695454620;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j0S51/pBUY6hmXFoUgUPjQ7JL3/euyO3Px8Jqn+fpdk=;
        b=Mpidctk7pkB8Yx4QlKwIw2KbhVnTXG9Hb+JbrPFW/bRpoy6RsOz0PahBJa22bPqK8+
         8nNk8FzkbUevFtigqWWqhB9f67vaSbUIJ2GBvy5WYYTjhpBckYVd/b7sW5SHBWTLGIZ4
         UWSHeIg4w7jK0X10UP9o0aGmZXBqQkdPAVwWEXPPc8DIE+4pyhr4qeFdRXAgC+n7LlbX
         Ki88CfHAyeQzgQcAvNOS7xVoJESEjnzWnj+4P0Kx7w0TRhFS8S4c9LL097ggQLLBS9gk
         +iDoGmKuP67TO5KCAFb6WhFA61ZamLSFg+Cv6lz50GiBOVlOYqGTpNRG7d+dG4OFTtDZ
         mlrw==
X-Gm-Message-State: AOJu0YwI1uhF7T3Y3zLnjV6/syjZmYvfOMIAVT2LVg8QTPCbTz81mlVW
	U6nMdQSu/tpjGBj7SaMJNbs=
X-Google-Smtp-Source: AGHT+IFundl9U8Fv5LEXrsFHxSeLqH78IU7tWeqGL1ByLSZ3sVZTgYxaGHwDV/IORmYPln8rlDYegw==
X-Received: by 2002:a05:6a20:320d:b0:14b:8023:33c8 with SMTP id hl13-20020a056a20320d00b0014b802333c8mr3554550pzc.2.1694849819989;
        Sat, 16 Sep 2023 00:36:59 -0700 (PDT)
Message-ID: <095d4737-3728-b1c2-d64d-dc5e9b438b80@gmail.com>
Date: Sat, 16 Sep 2023 16:36:54 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230915203628.837732-1-andrew.cooper3@citrix.com>
 <20230915203628.837732-5-andrew.cooper3@citrix.com>
From: Jinoh Kang <jinoh.kang.kr@gmail.com>
Subject: Re: [PATCH 4/7] x86/pv: Drop priv_op_ctxt.bpmatch and use pending_dbg
 instead
In-Reply-To: <20230915203628.837732-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/16/23 05:36, Andrew Cooper wrote:
> @@ -658,7 +660,7 @@ static int cf_check rep_ins(
>  
>          ++*reps;
>  
> -        if ( poc->bpmatch || hypercall_preempt_check() )
> +        if ( poc->ctxt.retire.pending_dbg || hypercall_preempt_check() )
>              break;
>  
>          /* x86_emulate() clips the repetition count to ensure we don't wrap. */

(snip)

> @@ -726,7 +729,7 @@ static int cf_check rep_outs(
>  
>          ++*reps;
>  
> -        if ( poc->bpmatch || hypercall_preempt_check() )
> +        if ( poc->ctxt.retire.pending_dbg || hypercall_preempt_check() )
>              break;
>  
>          /* x86_emulate() clips the repetition count to ensure we don't wrap. */

These two hunks look like a behavioral change in singlestep mode.

This is actually a fix, assuming the emulator previously did not handle
'rep {in,out}s' in singlestep mode correctly, since it now checks for
PENDING_DBG.BS in addition to PENDING_DBG.B[0-4].

If this is the case, (at least) this part of the patch looks like a stable
candidate.  You might want to edit the commit message to reflect that.

(Ideally all the HWBP handling should be part of the emulator logic, but
 I don't see an easy way to generalize the PV-specific logic.  It could
 be its own patch anyway.)

-- 
Sincerely,
Jinoh Kang


