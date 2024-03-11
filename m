Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB68877E6F
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 11:55:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691385.1077325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjdJY-0003jh-E4; Mon, 11 Mar 2024 10:55:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691385.1077325; Mon, 11 Mar 2024 10:55:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjdJY-0003ge-Az; Mon, 11 Mar 2024 10:55:28 +0000
Received: by outflank-mailman (input) for mailman id 691385;
 Mon, 11 Mar 2024 10:55:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p0J3=KR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rjdJW-0003gT-Ti
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 10:55:26 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddc07ad0-df95-11ee-afdc-a90da7624cb6;
 Mon, 11 Mar 2024 11:55:26 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4132600824bso5738905e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Mar 2024 03:55:26 -0700 (PDT)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 o16-20020a5d58d0000000b0033b87c2725csm6117958wrf.104.2024.03.11.03.55.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Mar 2024 03:55:25 -0700 (PDT)
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
X-Inumbo-ID: ddc07ad0-df95-11ee-afdc-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710154525; x=1710759325; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8KYI5kGDhcj4DC23WDO5d3YQClzg6IQFRR/v+VHskNA=;
        b=Cj3xbjyo2HjhnklktrFQ7XZOqsZJolbWHNtgrr4IEIOo++TD2oLxXbP7mCeHSdvNyS
         tezch8xx45lQcDxKP2Ryi96HJoEMBP44sk76d5/+EuJscUm+clZsyFMUmFsyMQ/nbjma
         MC4JljTZCxqsDkb7eShldNrwMOmOIccukZWhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710154525; x=1710759325;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8KYI5kGDhcj4DC23WDO5d3YQClzg6IQFRR/v+VHskNA=;
        b=BdmrygKX6aFQzY77w0BckDwQFblQ/wwsR8ijl9oN2Z7HuMhKNij8qIB0rEg7tlqG6D
         6cN0hu00aGUWbhs6Gg9QR2hCGfai/rMjqNGANUeVPnSCo78z6K6KGAWeD3YukXOuUccD
         jhgJzIlk/GwYn8znK0pQPgb/VKzFQfMhPLnqEtpAV6aCrwEmRkAilOGBIh1d7is95Qz5
         liomGCIzAyvBNTtdvrjCObnwl79+j+/+c6t58rQLSBZx+xqnBW0gWhBelYybgffpCoDd
         QR3cW38YDwtlc/itq2aTVSL7zbkwuDL2pIBGxNKIVCGSbctY0tKXqjRiyQaqur2Z44Y6
         kl5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU8wAXKbFh0tQsln97Kdi8q8g7q6KDYxTFU+oetkqSqS6GjTM8hDQLEON3xyD71EqYLBPFaoTDSf2fGcyxD+m7sDLpM3/see1R5HPcsZ+4=
X-Gm-Message-State: AOJu0YxxcPCyJjg5aL4hD80zeIvBrjZDl4grVWpnAi7hIc83UngI/sB3
	xuFqfIK8yq5fF0+mfAjaxTDvwQDOLbuxuN9XW9vNoTT7a5e/GgR5hs6rKs7GQAiviUdCH4Bc76X
	q
X-Google-Smtp-Source: AGHT+IEAM9P3cmoPeV2oKWkNhkBBe2yRDB4Bqn/X7NcSs5e6kD0MI4B3eBmDM8G9hopOcOqzc8tWwA==
X-Received: by 2002:adf:e582:0:b0:33e:8b93:e79e with SMTP id l2-20020adfe582000000b0033e8b93e79emr19101wrm.26.1710154525427;
        Mon, 11 Mar 2024 03:55:25 -0700 (PDT)
Message-ID: <abf15524-7f1a-4daf-870c-284d62266020@citrix.com>
Date: Mon, 11 Mar 2024 10:55:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging | 1396892d
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <65eed87594573_2c8a3cc158049@gitlab-sidekiq-catchall-v2-df9f7d5b4-wgfn8.mail>
 <167864dd-32b7-4ce2-b844-c033815308cf@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <167864dd-32b7-4ce2-b844-c033815308cf@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/03/2024 10:20 am, Jan Beulich wrote:
> On 11.03.2024 11:09, GitLab wrote:
>>
>> Pipeline #1208444169 has failed!
>>
>> Project: xen ( https://gitlab.com/xen-project/hardware/xen )
>> Branch: staging ( https://gitlab.com/xen-project/hardware/xen/-/commits/staging )
>>
>> Commit: 1396892d ( https://gitlab.com/xen-project/hardware/xen/-/commit/1396892d801cf148644cd5590be2f143648f9083 )
>> Commit Message: xen/ppc: switch PPC to use asm-generic/device.h...
>> Commit Author: Oleksii Kurochko ( https://gitlab.com/olkur )
>> Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
>>
>>
>> Pipeline #1208444169 ( https://gitlab.com/xen-project/hardware/xen/-/pipelines/1208444169 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich )
>> had 2 failed jobs.
>>
>> Job #6362114743 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/6362114743/raw )
>>
>> Stage: build
>> Name: alpine-3.18-gcc-debug
> Perhaps a networking glitch:
>
> make[2]: Leaving directory '/builds/xen-project/hardware/xen/extras/mini-os-remote'
> touch mk-headers-x86_64
> wget: can't connect to remote host (104.239.192.120): Connection refused
> wget: can't connect to remote host (104.239.192.120): Connection refused
> make[1]: *** [Makefile:90: newlib-1.16.0.tar.gz] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make[1]: *** [Makefile:119: zlib-1.2.3.tar.gz] Error 1
> wget: can't connect to remote host (104.239.192.120): Connection refused
> make[1]: *** [Makefile:139: pciutils-2.2.9.tar.bz2] Error 1
> make[1]: Leaving directory '/builds/xen-project/hardware/xen/stubdom'
> make: *** [Makefile:151: install-stubdom] Error 2
>
>
>> Job #6362114850 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/6362114850/raw )
>>
>> Stage: build
>> Name: debian-bookworm-gcc
> Possibly here too:
>
> fatal: remote error: git-cache-proxy: git remote died with error exit code 1 // Fetching origin // fatal: unable to access 'https://xenbits.xen.org/git-http/mini-os.git/': Failed to connect to xenbits.xen.org port 443: Connection refused // error: Could not fetch origin
> make: *** [Makefile:23: mini-os-dir] Error 128
> make: *** Waiting for unfinished jobs....

The networking isn't as stable as would be idea.  I just rerun these and
they tend to go away.

>
> However, I'm puzzled by quite a few ocaml issues along the lines of
>
> File "config.ml", line 102, characters 16-31:
> 102 |       | Failure "int_of_string"   -> append (k, "expect int arg")
>                       ^^^^^^^^^^^^^^^
> Warning 52 [fragile-literal-pattern]: Code should not depend on the actual values of
> this constructor's arguments. They are only for information
> and may change in future versions. (See manual section 11.5)
>
> Apparently just warnings, but the "Failure" in there makes them not appear
> so at the first glance.

"Failure" is just a type of exception in the Ocaml Language.

This overall diagnostic is just a warning, and fixing it is one a todo
list somewhere.

~Andrew

