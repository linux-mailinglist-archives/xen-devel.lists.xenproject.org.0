Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B76DD9C09F6
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 16:21:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832036.1247433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t94Jx-00015q-F5; Thu, 07 Nov 2024 15:21:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832036.1247433; Thu, 07 Nov 2024 15:21:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t94Jx-00013M-C4; Thu, 07 Nov 2024 15:21:17 +0000
Received: by outflank-mailman (input) for mailman id 832036;
 Thu, 07 Nov 2024 15:21:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GEtt=SC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t94Jw-00011n-67
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 15:21:16 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec9bcf91-9d1b-11ef-99a3-01e77a169b0f;
 Thu, 07 Nov 2024 16:21:13 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5c9c28c1e63so1302027a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 07:21:13 -0800 (PST)
Received: from localhost ([213.195.124.162]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03bb75f4sm898765a12.44.2024.11.07.07.21.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 07:21:12 -0800 (PST)
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
X-Inumbo-ID: ec9bcf91-9d1b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmIiLCJoZWxvIjoibWFpbC1lZDEteDUyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImVjOWJjZjkxLTlkMWItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTkyODczLjI3MDk0Nywic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730992873; x=1731597673; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JM+JLM1VAtFg407nyvJk4DIkApbsRqgPtmJ7TaZfDKQ=;
        b=hQoGxMSu7V6qtvVfc4TzdC7OaKKxSCUoLlZABawkNdgnegvXYLhyAg2gDcsNeTYjFQ
         o7/S0bcNAQDzl/MaY+jAKSPPKblxhN3uyrzL9s/2hWAr9X/b6STrllylWCsL7ojQAJZ9
         8NDYmno0zThVvYbRqTrDOzN89MBSdUKFfERLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730992873; x=1731597673;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JM+JLM1VAtFg407nyvJk4DIkApbsRqgPtmJ7TaZfDKQ=;
        b=bJF2A6GyKqg0o5Ripu3+czBx0jmnnOOv5AwcC9Pfk6o+HgaFSoDZ0RF23GxaFaUvao
         5/igOgZXrlJqH7eNo/TCf1SvmNnWfJQ8wTb/Wgid4qbPVc0/VUMCqQYUkerBtHim9ee8
         NbpjHvGpGZKmvWGphwGnagssKFsP3psnrRI4XYEXlGXUC0qYJuxujsA8ss6F/LkQJoyP
         BWBHGquXovcTGUuO6SiBOOWVBGvJ/6OwJvM2+PP+Z7yKr2qCqKmpyX3wwmDZ5Ydn+Lli
         8F6LJzUIJWw10Cg7ew2IEnSWTeoSIiDP0gJamh/Du22/rSsGWyeVzZLNtXNLwAwPW7XM
         goSg==
X-Gm-Message-State: AOJu0Yxt2cht5laXKlS9k7YQWqfZ7gI9JRs8hSSp2OkRL9M38suKXro/
	wBCxKNC2GX33n5pvEdFZUOb/8YLB/yszctMJbYm5IlsgTxQNrLfRwUpyngIlvR3KRTRUo0gRdlr
	N
X-Google-Smtp-Source: AGHT+IEjUMadQ5abFYngTuObGyFbKfwP/l5BlLVy7wTwTZ74vJI+ZBWlVk1nF0u490dW+7IxIgRVMQ==
X-Received: by 2002:a05:6402:5255:b0:5ce:d6b0:85c0 with SMTP id 4fb4d7f45d1cf-5cf08c2140amr270012a12.22.1730992872652;
        Thu, 07 Nov 2024 07:21:12 -0800 (PST)
Date: Thu, 7 Nov 2024 16:21:11 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Matthew Barnes <matthew.barnes@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2] CHANGELOG: Add note about xAPIC destination mode
 change
Message-ID: <Zyza57tpYLGWYsDx@macbook>
References: <f7e299a8c1af7c5875e07f80b0229b1cd322a5f6.1730987624.git.matthew.barnes@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f7e299a8c1af7c5875e07f80b0229b1cd322a5f6.1730987624.git.matthew.barnes@cloud.com>

On Thu, Nov 07, 2024 at 02:08:31PM +0000, Matthew Barnes wrote:
> Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Not sure it's worth adding a:

Fixes: dcbf8210f3f3 ('x86/APIC: Switch flat driver to use phys dst for ext ints')

So it's tied to the commit that introduced the change.

Thanks, Roger.

