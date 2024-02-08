Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDE984DBEC
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 09:52:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678036.1055064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY07y-0003j4-27; Thu, 08 Feb 2024 08:51:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678036.1055064; Thu, 08 Feb 2024 08:51:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY07x-0003gb-Ul; Thu, 08 Feb 2024 08:51:25 +0000
Received: by outflank-mailman (input) for mailman id 678036;
 Thu, 08 Feb 2024 08:51:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YTSP=JR=rabbit.lu=slack@srs-se1.protection.inumbo.net>)
 id 1rY07x-0003gV-07
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 08:51:25 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3be67c38-c65f-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 09:51:22 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40fc22f372cso13031615e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 08 Feb 2024 00:51:22 -0800 (PST)
Received: from [192.168.2.1] (82-64-138-184.subs.proxad.net. [82.64.138.184])
 by smtp.googlemail.com with ESMTPSA id
 q30-20020adfb19e000000b0033b2221d938sm3135967wra.76.2024.02.08.00.51.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 00:51:20 -0800 (PST)
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
X-Inumbo-ID: 3be67c38-c65f-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rabbit-lu.20230601.gappssmtp.com; s=20230601; t=1707382282; x=1707987082; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JzUyytzaAKCWO+7wPw+FR11d2mjz6ZrQxww+yYXLRMY=;
        b=sI0sjlUMoM9GwkymEJmM9skDm+6JifXi0vJHUi5CVcxQzOxPVaNOaTj9ws6HNpqOOA
         PVbn57uIhgzgojR3hWQyzpDxwWV6EEGjENUosRsOpt9sZPqssBYrUOyFzdImJfgvD+K0
         90fYB+fkKmNeV4kBqNiHT9/45+FgwQV2Dlgs1OC5wQOM45aKWutVbq6SC+JfxXSWbHY2
         kItEFGrMlx+3RxY18V075vtmJRz2FKfTwnlxF7sjiEBuJIlQo79HfwlYiSF6RIim+IPe
         cTt2krGjwymVS3ZVjDFCQPq6ZzaxEakY3CIevvqFqVEHkJomcPEw7UZgSv9g7Q8aWgRm
         Nb1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707382282; x=1707987082;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JzUyytzaAKCWO+7wPw+FR11d2mjz6ZrQxww+yYXLRMY=;
        b=pYUiHSPfliU8so6NqiTFFOLpJ4KmJUpaGvhN0CoXeCb18+b27L6BkhTP7tFgi51r+r
         AmU0KYvu7bEaynIaaYyTGHQSdx4hMwiD1BYw/38pglKjHEckDHYRc/wf6xRvZCDYED4N
         i0bKBTIH9Cn7sXWtPMf7OUG6QoQlTILfRUjbLgb+U4sh98PZCQMlFU7c2CoH6AT13uLh
         5gjKEs0JDS5TpQNLCsOdyGOXgkwnSxpoM5wbnGc58M7kikcoLVTqqk+SBv2VqmikDRdh
         ZrjjUweA9rv/yY6/d299rUkUAJB3gQPwTZHIxevsez/LIbhdokGfiO6hw2vjWBcCkGPL
         pFdg==
X-Gm-Message-State: AOJu0YxqZsbAPMquN9wWNPoDeM+r6Cq9IKRsa8s1XjIhkF6wUe2IMo+3
	GbDbJK3vQE6zAIP/wpjCiMUr0p1LIRpca+iRbA4Fv5aDsFCzc9qhuTRhj9YRjIg=
X-Google-Smtp-Source: AGHT+IHJfJxk9UExK2yDzdkgiZdwUFjwmCHGho+cWobWW4Rkq/bQsWQkFdHUlk6dOapc+IHKotbp5A==
X-Received: by 2002:a05:6000:1843:b0:33b:2f8f:da32 with SMTP id c3-20020a056000184300b0033b2f8fda32mr6420762wri.10.1707382281353;
        Thu, 08 Feb 2024 00:51:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXuLOqCiftNaQG+dqkyCuzK1E000kZlTRwHeHU9K3zQYcb2lExkf0SoD1iaK5HzXLJqmW+VdYIvyI5W
Message-ID: <a096dab8-88c4-4450-8c55-60d68346367f@rabbit.lu>
Date: Thu, 8 Feb 2024 09:51:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: zithro <slack@rabbit.lu>
Subject: Re: [PATCH] tools/xentop: add option to display dom0 first
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <87846acd5b31991e38561c9765eb97730c79d0f3.1706723494.git.slack@rabbit.lu>
 <a8194dec-70f0-4f90-898d-f15152a5018b@perard>
 <1f2fab6d-6eaf-4e32-a124-cf1042c31312@rabbit.lu>
 <5f6c6a52-9ef1-4db2-9e5e-2ca916bdf225@perard>
Content-Language: en-US
In-Reply-To: <5f6c6a52-9ef1-4db2-9e5e-2ca916bdf225@perard>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07 Feb 2024 16:44, Anthony PERARD wrote:
> No worries, and your patch was reviewed so you didn't failed to the 
> strict minimum ;-).

Ahah, true, just felt a bit stupid ! Thanks, and also for the gdb pointers.
But sorry for nooby "non-rebased/non-squashed" v2, fixed now ;)

>> I have a "display dom id column" in the pipes, ready to send [...]
> That TODO file is 18 year old, and never been touch since. I don't 
> know how relevant it is. As for wanted features, I'm not aware of 
> such list.

TODO is 18 y/o, but some ideas are still nice to have ! At least
for me ;)

Like adding a "domain id" column, I ask beforehand because it will
change the default, expected display of xentop in "batch mode", and it
will annoy everyone relying on a constant output. Should I worry ?

To preserve old behaviour, I'd have to add the possibility of
displaying/hiding columns -before- adding the "dom_id" column, to then
make it hidden by default.

> I'm slightly worried about adding domain management, what if someone 
> hit the wrong key and kill a domain when they just wanted to do 
> something else, but I guess we can make domain management work more 
> or less safely. In any case, any feature is welcome.

I share your concerns re. domain management, we've all messed up at
least once with the wrong term/window, could be a real PITA !
Some have seen a ":q" followed by "oops" in XenDevel recently :)

I'd create a "*M*anage domain" bottom item, as a prompt, asking
the action and domain, like "pause domu1", "r domu2","s 42" :

     Manage domain (p/r/s/d <Domain>): _
     Manage domain (p/r/s/d <Domain>): pause domu1_
     Manage domain (p/r/s/d <Domain>): s 42_

I think it's practical -and- safe enough, even the shortest form.
Would that be a good starting point ?

((( Rest of the mail is a list of alternatives, but requiring the 
ability to select a domain/line :

1) Select the domain, press <M>, enter the action in a prompt :

     *P*ause/unpause,*R*estart,*S*hutdown,*D*estroy domain 'mydomu' ? _

2) Like (2) but add a confirmation step :

     To pause 'mydomu', type [y/yes/pause/dom_name/etc]: _

This confirm step could be user-chosen with a cmdline option, like :
     -c/-m [no-confirm/y/yes/action-name/dom-id/dom-name]

3) Arrow-keys and menu driven: select the domain <Enter> select the
action <Enter> (could also be used to display more domain info/config)

)))


-- 
++
zithro / Cyril


