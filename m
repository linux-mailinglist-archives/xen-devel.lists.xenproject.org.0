Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 295918BD151
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 17:13:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717716.1120179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4025-0000Uk-Tx; Mon, 06 May 2024 15:13:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717716.1120179; Mon, 06 May 2024 15:13:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4025-0000Rp-R4; Mon, 06 May 2024 15:13:37 +0000
Received: by outflank-mailman (input) for mailman id 717716;
 Mon, 06 May 2024 15:13:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VpOg=MJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s4025-0000PP-8V
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 15:13:37 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3061ef17-0bbb-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 17:13:27 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-346359c8785so1697280f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 08:13:33 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 i15-20020adfb64f000000b0034af40b2efdsm10895356wre.108.2024.05.06.08.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 08:13:33 -0700 (PDT)
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
X-Inumbo-ID: 3061ef17-0bbb-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715008413; x=1715613213; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fh1uLXLzofTd7zjk31n+Gl39sS6WkpHfgVe3CHmMTh0=;
        b=agD0c10thd3qJNPiXl4TvKPjA0xQ6Ofw0vhmZ9qNE3A5sOaLeRO52ipeEkTmw+doYH
         TIuy7hoU8hzKnRnxegY9MRQEhjQJAZm9kOBtsVcl3J7aS1CKfWRwjdrkqerSpRHS430b
         m4fzyIBngq19BQ45wBcZAPU0wLtJW76NIXprA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715008413; x=1715613213;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fh1uLXLzofTd7zjk31n+Gl39sS6WkpHfgVe3CHmMTh0=;
        b=ErbpwNTIbrx8Xe0IreL7ImEeZ/ZOtg67ZJ6bI/bUZDjai1ch3thrITuQtMqUmN8Cwe
         LB7P2o/ETrtu6T84HDSrIbfgLyQ2mOpfh8LM6LeP9ZtVqWHj5PhlzQ1JBs5IzEvH3KM+
         fjut/opNtBaiz1gknj7mZZ8lcBbwmASQZHaaM4UyZH8pw4WaHF//VRqSZJ0zor7OoiWK
         T9UH/OnVz/xrpUj+ZOL0JEdx/TNvrwfPl6BFveuq2KJdrWQy04mr2c+RQA8y7zByAm68
         l1f38yy1HNmeUYgMVWOVS3kU6R2pOy5/ql33Cn2/S7UzTGKe9apIjdo7T/hTnU14hhY3
         iJYA==
X-Forwarded-Encrypted: i=1; AJvYcCXXOHTOi3ZwFQL49RqVAUWrpsX6kY5EMI/XZJJJ7IsVhRyjgvJ9iUMn4wzwT0RM1qaAh3DB/FuULysr7vSdMUj19Fxwv3HvOLwF24mK6BI=
X-Gm-Message-State: AOJu0YxcuaM6gyDwmZa2ZlPtNp4ojeOAGESObs54jGOQQBZAZYqPueA6
	uIne0koMmNAMwskElOxvchf5qqHrBEd+yNmomdh+SmIp2yBAeJ7yhTZfa3SQp6M=
X-Google-Smtp-Source: AGHT+IFYJ3oRUHNmGejMJYGPtvnRDN2GCmlkI0ukot09ZFENVj3AxpAjq/SKPs+IDdpOGLEJNqEYNw==
X-Received: by 2002:a5d:678b:0:b0:34c:77bc:6c51 with SMTP id v11-20020a5d678b000000b0034c77bc6c51mr7278265wru.1.1715008413347;
        Mon, 06 May 2024 08:13:33 -0700 (PDT)
Date: Mon, 6 May 2024 17:13:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.19? 1/2] xen/x86: account for max guest gfn and
 number of foreign mappings in the p2m
Message-ID: <ZjjznLLJq-w3Kob8@macbook>
References: <20240430165845.81696-1-roger.pau@citrix.com>
 <20240430165845.81696-2-roger.pau@citrix.com>
 <45c52348-e821-4e36-9bd6-7dda00eeb7d3@suse.com>
 <ZjjqEPRycO-ZIkAe@macbook>
 <4ef79e54-deb1-4242-bcf6-af2b324326b4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4ef79e54-deb1-4242-bcf6-af2b324326b4@suse.com>

On Mon, May 06, 2024 at 04:55:45PM +0200, Jan Beulich wrote:
> On 06.05.2024 16:32, Roger Pau Monné wrote:
> > On Mon, May 06, 2024 at 12:07:33PM +0200, Jan Beulich wrote:
> >> On 30.04.2024 18:58, Roger Pau Monne wrote:
> >  My initial intention was to do it
> > in p2m_entry_modify() so that nr_foreign and max_gfn where set in the
> > same function, but that requires passing yet another parameter to the
> > function.
> 
> I was indeed implying that would have been the reason for you to not have
> put it there.
> 
> What you don't answer though is the question of how you determined that
> none of the other ->set_entry() invocations would need to have similar
> code added. There are quite a few of them, after all.

Aside from the mem_sharing copying/forking usages, the rest of the
uses of ->set_entry() looked like changes over existing entries, and
strictly not adding new entries.  I might be wrong however, I see that
some of the altp2m usages could also end up populating altp2m entries
(not that the teardown will work with altp2m-s anyway).

Thanks, Roger.

