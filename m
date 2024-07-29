Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF33493F5ED
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 14:54:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766715.1177223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYPsy-00016O-Tk; Mon, 29 Jul 2024 12:53:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766715.1177223; Mon, 29 Jul 2024 12:53:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYPsy-00014u-Qt; Mon, 29 Jul 2024 12:53:56 +0000
Received: by outflank-mailman (input) for mailman id 766715;
 Mon, 29 Jul 2024 12:53:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QfTU=O5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sYPsw-00014o-MP
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 12:53:54 +0000
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [2607:f8b0:4864:20::732])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b5c2cd0-4da9-11ef-8776-851b0ebba9a2;
 Mon, 29 Jul 2024 14:53:53 +0200 (CEST)
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-79ef72bb8c8so129547185a.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 05:53:52 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a1e4292ae6sm347878285a.74.2024.07.29.05.53.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 05:53:51 -0700 (PDT)
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
X-Inumbo-ID: 9b5c2cd0-4da9-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722257631; x=1722862431; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ObDcHphduOFVb9T8BaQz9ibo8RiD6nspOnXXFzzwsQw=;
        b=sfBm5SpCOSR7YVeWkZ8z2gwxiENzQyYxQNN5fvXa/mgiaVUgdcsRh6N6zL8YLMlfIi
         KQ+NrYzUA9iq0nJUqSYSEUi+7pHTXQST8jWv+fC9hIOM7qdL9duaq3f7v0JU4+OC/qQA
         Wjr1DzJFUjVq6b5lj864BvjpOhgo/NsLpy6U4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722257631; x=1722862431;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ObDcHphduOFVb9T8BaQz9ibo8RiD6nspOnXXFzzwsQw=;
        b=gTEwIcjKAPdWAkhE8KyKNBn13SyWNCWdMJui1wSVnoZV8MFJposzrpsRJlsxEYNSxU
         hRffhwouEc1OAxlurs4QRhhuziOuZokI/UK53jgj2Jkm8XBuMuri5hI5cBNWe2Wo9s6d
         hrK9lGOmhQmckuZ0xymrK6vMIBfnJ9/+gC8Z0ZBCQQj+a41MYVECpaeN/hCGAwLjghhP
         Ukh/7kfyFawVG4Xf1d49roLV2TnK+Q65nnYsIqd+LKCUKbHhLV4R3N/e04OQGLvfrOQj
         0zJYq/MsqK+cESt14AxBj2eCZdlqLG6EExUiTo/RcF0wYPzmXWbl5ejRsRi78sj6DYI4
         uWrw==
X-Forwarded-Encrypted: i=1; AJvYcCVgmc1kAYU5VBna8SwkiBuONKZkDZx0BQohVkhzFjzGa2EImW5xjIZ3VheFq4jRE9KV/d7+aAQr+Tv0drGRGtJZTRr5iE+1Ot6Ex/nTofs=
X-Gm-Message-State: AOJu0YxGKg70g/ceOJ4xT8fpW5VCLcul8SUONoGTlmuA57uOMF9/RNd9
	kdBuYNnt1Wp3ke43/noI5DtZFgkuNq8FuXMmZyOwKXhYzjsDQM0xQXFbzP1/R10=
X-Google-Smtp-Source: AGHT+IH8kunUhb9TKWqwzdDgmVUF5lcfRFtAebuKGxjAcavbW7OB2/XQsjRM3qUVb2JQSLl3mGwEgA==
X-Received: by 2002:a05:620a:4711:b0:79c:9431:f71a with SMTP id af79cd13be357-7a1e522f672mr1023123285a.11.1722257631382;
        Mon, 29 Jul 2024 05:53:51 -0700 (PDT)
Date: Mon, 29 Jul 2024 14:53:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: alejandro.vallejo@cloud.com, Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 01/22] x86/mm: drop l{1,2,3,4}e_write_atomic()
Message-ID: <ZqeQ3KKyBe9sJ8Qf@macbook>
References: <20240726152206.28411-1-roger.pau@citrix.com>
 <20240726152206.28411-2-roger.pau@citrix.com>
 <c46c1d62-c9d3-4549-8006-9e846fbc9d3d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c46c1d62-c9d3-4549-8006-9e846fbc9d3d@suse.com>

On Mon, Jul 29, 2024 at 09:52:50AM +0200, Jan Beulich wrote:
> On 26.07.2024 17:21, Roger Pau Monne wrote:
> > The l{1,2,3,4}e_write_atomic() and non _atomic suffixed helpers share the same
> > implementation, so it seems pointless and possibly confusing to have both.
> > 
> > Remove the l{1,2,3,4}e_write_atomic() helpers and switch it's user to
> > l{1,2,3,4}e_write(), as that's also atomic.  While there also remove
> > pte_write{,_atomic}() and just use write_atomic() in the wrappers.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> In the description, can we perhaps mention the historical aspect of why
> these were there (and separate)? Happy to add a sentence when committing,
> as long as you agree.

Sure:

"x86 32bit mode used to have a non-atomic PTE write that would split
the write in two halves, but with Xen only supporting x86 64bit
that's no longer present."

Would be fine?  Possibly added after the first paragraph IMO.

Thanks, Roger.

