Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB6197669B
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 12:21:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797253.1207152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sogwq-0002WM-SV; Thu, 12 Sep 2024 10:21:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797253.1207152; Thu, 12 Sep 2024 10:21:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sogwq-0002Uq-PL; Thu, 12 Sep 2024 10:21:12 +0000
Received: by outflank-mailman (input) for mailman id 797253;
 Thu, 12 Sep 2024 10:21:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lDyH=QK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sogwp-0001kl-Q7
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 10:21:11 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7a3f3b2-70f0-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 12:21:04 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a83562f9be9so82427266b.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 03:21:04 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25a2539bsm727300366b.85.2024.09.12.03.21.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 03:21:02 -0700 (PDT)
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
X-Inumbo-ID: b7a3f3b2-70f0-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726136464; x=1726741264; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=T9uHIYkP2m3m2DYcgopX817L3bpvVUeHtkuJT4LHJyc=;
        b=bjRD/SZinBbQq6mRvYOUeptDB1Rj4ShkvauK6C4ztE2KkUgnd0OL3dtNNMAiWHAwYd
         fNRc6arHdmKDsyl2pIHFbPbPZMyzROfOM7sHFP9JF+TiFQc8i8T3LYhUKwhF4Drp1wCQ
         wb5U4ai69ftra0bIlhhtK0lfjQUDwlatC6/9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726136464; x=1726741264;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T9uHIYkP2m3m2DYcgopX817L3bpvVUeHtkuJT4LHJyc=;
        b=bHKUmo2bEeaTz0UG9lmZ/qWWwkZQA3fpBsn1DNNsa/tY+dUWJ7+9eztZXkj89vPPTI
         yK+o3/oRe7EHXyGDga68lNUDRgUDDpNaV8Qd03pltpRmY3VsRI4+/1T+C++kyQ7kEP7V
         J8S3mznFVrwnudibz28obZiqaveStA9yETjTUpF42EjZN4mYQQnqIb7fpewidfkO3gwl
         9uljaJn7B4LOkKS4tSUdZ2axGijncjH+TI3ETUxdW7q+YbTOJBOPPjTVdc++qJBzcXZ9
         YBhBU20MCbMTcuWYEsR/KwfyAtquY8l+IxDn1luH4ZjWeCOmamEDm3HWZsA6WtLOsIsL
         BY/A==
X-Forwarded-Encrypted: i=1; AJvYcCUv7vovJm/b2TekjzTMbtmqziZpvV2oWQ30ziQQEeHJtcqln974KGDcTl8WGz44xCm5pVx4LFlX1PE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzNbfs6Eg2M63MW3WVLf3B3MEiGy9m90xKsDHCG1X1YD2hkRRmZ
	fz1QwJVc9mc/WS2hdpxIUdbapQW4ccbc5nBaRRXXzq/YULnZxNsXhddFwtB4Nko=
X-Google-Smtp-Source: AGHT+IHhMZCPvCocOkOqZIFeQcj+Q7M9H9Prt/yuaPb2l3S4h2j6/ngwqWozPuehSrT47n1rktMl3w==
X-Received: by 2002:a17:906:7949:b0:a8d:4db8:9edf with SMTP id a640c23a62f3a-a902961795cmr189367566b.42.1726136463264;
        Thu, 12 Sep 2024 03:21:03 -0700 (PDT)
Message-ID: <82def4c7-f2b7-4af0-a081-531d6c881d82@citrix.com>
Date: Thu, 12 Sep 2024 11:21:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging | 6e7f7a0c
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <66e2a27042b52_2fc0cec83515@gitlab-sidekiq-catchall-v2-74cb86846c-gh22d.mail>
 <271b23d7-bd7c-479b-a568-3fe8f817ebff@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <271b23d7-bd7c-479b-a568-3fe8f817ebff@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/09/2024 11:11 am, Jan Beulich wrote:
> On 12.09.2024 10:12, GitLab wrote:
>>
>> Pipeline #1450299635 has failed!
>>
>> Project: xen ( https://gitlab.com/xen-project/hardware/xen )
>> Branch: staging ( https://gitlab.com/xen-project/hardware/xen/-/commits/staging )
>>
>> Commit: 6e7f7a0c ( https://gitlab.com/xen-project/hardware/xen/-/commit/6e7f7a0c16c4d406bda6d4a900252ff63a7c5fad )
>> Commit Message: xen/x86/pvh: handle ACPI RSDT table in PVH Dom0...
>> Commit Author: Stefano Stabellini
>> Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
>>
>>
>> Pipeline #1450299635 ( https://gitlab.com/xen-project/hardware/xen/-/pipelines/1450299635 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich )
>> had 4 failed jobs.
>>
>> Job #7805959443 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/7805959443/raw )
>>
>> Stage: build
>> Name: opensuse-tumbleweed-gcc-debug
>> Job #7805959441 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/7805959441/raw )
>>
>> Stage: build
>> Name: opensuse-tumbleweed-gcc
>> Job #7805959427 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/7805959427/raw )
>>
>> Stage: build
>> Name: ubuntu-24.04-x86_64-gcc-debug
> There wasn't anything Ocaml-ish in what should be under test, yet:
>
> make -C xsd_glue install
> make[8]: Entering directory '/builds/xen-project/hardware/xen/tools/ocaml/libs/xsd_glue'
> ocamldep plugin_interface_v1.ml *.mli > .ocamldep.make.tmp; 	if ! cmp -s .ocamldep.make.tmp .ocamldep.make; then mv -f .ocamldep.make.tmp .ocamldep.make; else rm -f .ocamldep.make.tmp; fi
> /bin/sh: 1: cannot create .ocamldep.make.tmp: Permission denied
> mv: cannot stat '.ocamldep.make.tmp': No such file or directory
> ocamlc -g  -w F -warn-error F -c -o plugin_interface_v1.cmo plugin_interface_v1.ml
> File "plugin_interface_v1.ml", line 1:
> Error: Could not find the .cmi file for interface plugin_interface_v1.mli.
> make[8]: *** [/builds/xen-project/hardware/xen/tools/ocaml/libs/xsd_glue/../../Makefile.rules:25: plugin_interface_v1.cmo] Error 2
> make[8]: Leaving directory '/builds/xen-project/hardware/xen/tools/ocaml/libs/xsd_glue'
>
> I have no clue at all what's going on here.

That's from last week.  Plenty of subsequent runs have passed, even in
ubuntu 24.04.

What was new in that change was an extra subdirectory, so it could be a
parallel make issue.  However, I thought the Ocaml build was
non-parallel generally.

The other suspicious thing is "cannot create .ocamldep.make.tmp:
Permission denied" which might point to problems on the runner,
qubes-ambrosia.

~Andrew

