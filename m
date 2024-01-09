Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E2082892F
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 16:42:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664734.1034860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNEFH-0005Dq-9g; Tue, 09 Jan 2024 15:42:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664734.1034860; Tue, 09 Jan 2024 15:42:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNEFH-0005Be-6J; Tue, 09 Jan 2024 15:42:27 +0000
Received: by outflank-mailman (input) for mailman id 664734;
 Tue, 09 Jan 2024 15:42:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bEKq=IT=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1rNEFG-00055i-3k
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 15:42:26 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af41ce82-af05-11ee-9b0f-b553b5be7939;
 Tue, 09 Jan 2024 16:42:24 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40d5336986cso40462895e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 07:42:24 -0800 (PST)
Received: from jmerino-thinkstation (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 n12-20020a170906688c00b00a2825a9e1d0sm1178339ejr.174.2024.01.09.07.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 07:42:23 -0800 (PST)
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
X-Inumbo-ID: af41ce82-af05-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1704814944; x=1705419744; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ze6XnSneRG0PU0NqUP6k/xJLsZgsIR3r5by7spki+J8=;
        b=PKrkO1L77njKhQVSjcKT4XS1Tj7+yLlNlVewAu9emgneKv2Z1UL0SINONpwcRUcZn/
         qoLVZfWIXL+heA5B4/n8y4jKoCJFI+peVsyytcZsZS4ZES6BmzmaJBVaelX8i5LqzOol
         W1AP6YK5JRs2vnU6/iExkOWm+kRDNQPErD0mE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704814944; x=1705419744;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ze6XnSneRG0PU0NqUP6k/xJLsZgsIR3r5by7spki+J8=;
        b=VnU+kHo+4JjfxcuSky4JpkIu46wpY+UiynE3WS8j9XlMFV9Gblgcz5HriJvOsVJZae
         GP1pepycxyTL3Bx+A8ZYjvYECY9++Hf1S8NrWrGchrIxH0TU+OEvb17FZ1BahuCXS86H
         cC7YJPV7grj03I1BPpHmuqCyE7kpwvLqel0SuUlulxg2tdcJjWLxCK+q7QIly/Dpoo2s
         yyNdLYU7wpgjFNElWKdKhawvjN4myDDBisWg4bOKMXeKKaZTD8vFwAgZCilRlKg0xZfH
         JQuSRdpUA7xemaeZNr9H1TZ1f3uUVbg/21WBioHKP1QGt3Z3JmKcGQ/OtE56wCwct1Ss
         /+kg==
X-Gm-Message-State: AOJu0Yw97AR+QUiGmBYOeBq5raFqg4NnTU0lZawEU+VUH+LNOa1vu6b+
	/T0ppqCdljA32WktIoe4xt0SSO5GkQsdfc+lZ0VjDmW/Nbs=
X-Google-Smtp-Source: AGHT+IF+CS7jBnnpsaMTW59lFi3xv/3471PJsW6gRajdwQDu4OXkjXhCn7eBY83/AZ44Nu+9mZifag==
X-Received: by 2002:a7b:c395:0:b0:40e:4e14:b90a with SMTP id s21-20020a7bc395000000b0040e4e14b90amr616394wmj.146.1704814943973;
        Tue, 09 Jan 2024 07:42:23 -0800 (PST)
Date: Tue, 9 Jan 2024 15:42:23 +0000
From: Javi Merino <javi.merino@cloud.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, 
	Vikram Garhwal <vikram.garhwal@amd.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.18 v1] xen/common: Don't dereference overlay_node
 after checking that it is NULL
Message-ID: <4pfn6xyqw2eum4hokedzeqzvteyrwjokynt2zxq6wesaxfwzsp@cfk6iab3etey>
References: <6b2db92de764b6031647926d27cb14dd455eff7d.1704809355.git.javi.merino@cloud.com>
 <e579994b-80ff-42db-bf57-6c6068fca902@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e579994b-80ff-42db-bf57-6c6068fca902@xen.org>

On Tue, Jan 09, 2024 at 03:31:55PM +0000, Julien Grall wrote:
> Hi Javi,
> 
> Title: Any reason this is titled for-4.18? Shouldn't this patch also be
> merged in staging?

This is for staging and 4.18.  If the tag "for-4.18" meant "this is
only for 4.18", then that's not what I meant.  Sorry for that.

> On 09/01/2024 14:19, Javi Merino wrote:
> > In remove_nodes(), overlay_node is dereferenced when printing the
> > error message even though it is known to be NULLL.  Fix the error
> 
> Typo: s/NULLL/NULL/
> 
> This can be fixed on commit if there is nothing else.
> 
> > message to avoid dereferencing a NULL pointer.
> > 
> > The semantic patch that spots this code is available in
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/coccinelle/null/deref_null.cocci?id=1f874787ed9a2d78ed59cb21d0d90ac0178eceb0
> 
> Good catch and glad to see that coccinelle can work on Xen. I am looking
> forward for more work in that area :).

I'm working on a series to add a "make coccicheck" to Xen, similar to
the coccicheck in the kernel.  All the other semantic patches that I
think are relevant to us only give false positives, but I think it
would still be beneficial to have them.

Cheers,
Javi

