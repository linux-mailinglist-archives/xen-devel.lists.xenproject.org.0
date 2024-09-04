Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E71E896B8A3
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 12:33:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790090.1199798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slnKR-0001JF-Q9; Wed, 04 Sep 2024 10:33:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790090.1199798; Wed, 04 Sep 2024 10:33:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slnKR-0001G9-Mr; Wed, 04 Sep 2024 10:33:35 +0000
Received: by outflank-mailman (input) for mailman id 790090;
 Wed, 04 Sep 2024 10:33:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EFI/=QC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1slnKQ-0001Fw-3N
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 10:33:34 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21d50757-6aa9-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 12:33:32 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c3c34e3c39so551273a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 03:33:32 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c24372d393sm5355001a12.23.2024.09.04.03.33.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 03:33:31 -0700 (PDT)
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
X-Inumbo-ID: 21d50757-6aa9-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725446012; x=1726050812; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kV2b0jt7cIiDdlsooWobDVTPYb6tjUgt5tJFTuZ6NZ0=;
        b=vBzNnPPhqIvbPv8gAHFJjkW5AooY61cPkxF+DQNhzUGOu/c4LHJamxc/Qvz8FsJLEu
         0kfQxsFGDyowac8EZYubvb1skUq+AatTzPsxIWytUOjh2/tKODBWZK2cceZkEeGy8Xk9
         zqjYmuGEsXMOY9he+RCA6e4QagIqRiOwRq9R0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725446012; x=1726050812;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kV2b0jt7cIiDdlsooWobDVTPYb6tjUgt5tJFTuZ6NZ0=;
        b=DBQRPjDGGijGXFsDJCX8ugo23Zy4wTtRoBoDbOHx9dHQ2V4EAGpNlmFUCa0yfEyrgj
         2E9qcMjvfgaE2j4N74HreBC96lB1/TiWw4+ZSTUERnhTYUQR0vBy5KAN0aK3fiPDmRZ4
         RxtfWyE7i6/ZYjxOT0DV45tK4jfAwc5k0tbCKqQZ5PmxCi1GpC/IldpASUPg8YbHfEv6
         tWtf0wCru6j8iaYy30moWHPPjHvAPm5FF/tcupDEEr4Um20ZgsDGGEwNG7Qz7zlIEW4h
         O4jDXph5ytSSw2Tz+X4RHZTOIb0o4hfOGW5dHsOWMKiLtZB1kFqNRR/Btr/MjqPeAOIi
         ga3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWFCpE8XGhFyghMx2jUoIHS7bf/aws8yPEapAZpaWXHz1JgKN7SBFOfxvl9gW78Mjaetnnbun7pQlM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy2jHomHs3/oNGCylAEWdJZgvmoWkgzIgXnfB32dhjON9ZNMp+T
	q+/P2U2gMZyHf0GBjZH7MUX5EJW4S28j0OyEll6kTZfV1WDNqkE0Zziw1vW/wEI=
X-Google-Smtp-Source: AGHT+IGlg+6G0FbrjuJBk80PgnljozZudJby87z4WW0jEXKpKHKA4Z/sQ81j8jCwk1RIbi8ic6YqFw==
X-Received: by 2002:a05:6402:26d2:b0:5c2:106b:7194 with SMTP id 4fb4d7f45d1cf-5c243723c8dmr9086332a12.3.1725446011517;
        Wed, 04 Sep 2024 03:33:31 -0700 (PDT)
Message-ID: <2a11cf93-75d1-41c7-811a-6c45ac0a9f0e@citrix.com>
Date: Wed, 4 Sep 2024 11:33:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mktarball: only archive Xen
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony Perard <anthony@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <14f8887b-1f66-428e-8417-f552b8851c71@suse.com>
 <291083ba-7480-4cfa-90c4-997f83c7a3a9@citrix.com>
 <a45dc467-a1ba-4053-b8c4-24b500c051ed@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <a45dc467-a1ba-4053-b8c4-24b500c051ed@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/09/2024 11:26 am, Jan Beulich wrote:
> On 04.09.2024 11:59, Andrew Cooper wrote:
>> On 19/08/2024 4:10 pm, Jan Beulich wrote:
>>> As was basically decided already a while ago, remove - in the simplest
>>> possible way - the archiving of both qemu-s and mini-os from tarball
>>> generation.
>>>
>>> With this the subtree-force-update-all prereq isn't needed anymore in
>>> the top level Makefile. That goal, including the respective ones
>>> underneath tools/, then also are unreferenced and hence are being
>>> dropped, too.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> This is the simplistic approach; I'm sure this could now be done quite a
>>> bit more efficiently. I also expect there's no longer a need to run
>>> ./configure ahead of the invocation of this script, but since I have no
>>> idea why it was needed earlier on, I'm not removing that here from the
>>> doc. IOW all cleanup that's probably better done separately, by someone
>>> actually using all of that machinery.
>>> ---
>>> v3: Drop subtree-force-update-all rules from underneath tools/.
>>> v2: Drop subtree-force-update-all prereqs from ./Makefile.
>> Removing the archiving is one thing, and we have agreed that's a good
>> thing to do.
>>
>> However, the makefile rules might be used manually.  While we have the
>> other trees cloned in Xen, I'd be wary about dropping the rules.
> They're not mentioned in what the help: goal displays, which makes me
> worry not overly much here. And Anthony had basically agreed to their
> dropping, in part by asking me to drop more than I did initially.

Fine.  Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

