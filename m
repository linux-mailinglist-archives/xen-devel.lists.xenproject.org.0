Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EB7AC083F
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 11:11:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993331.1376757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI1xc-0004sy-3k; Thu, 22 May 2025 09:11:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993331.1376757; Thu, 22 May 2025 09:11:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI1xb-0004qG-WA; Thu, 22 May 2025 09:11:31 +0000
Received: by outflank-mailman (input) for mailman id 993331;
 Thu, 22 May 2025 09:11:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N/yA=YG=redhat.com=pabeni@srs-se1.protection.inumbo.net>)
 id 1uI1xa-0004CG-Eh
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 09:11:30 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd605087-36ec-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 11:11:27 +0200 (CEST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-bTkOZMoaNP6jvjmYRUQrxQ-1; Thu, 22 May 2025 05:11:24 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43ea256f039so60909935e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 02:11:24 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:247a:1010::f39? ([2a0d:3344:247a:1010::f39])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f6f05581sm97329145e9.13.2025.05.22.02.11.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 02:11:22 -0700 (PDT)
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
X-Inumbo-ID: bd605087-36ec-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747905086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Efw/xOoBR5JtsAGWTbkGb39F5QrJRSJy0Aiy1rPkylA=;
	b=ISOQZg9Ku2Jm3YWSfGM5qZjGumLJ4SlE/J1M0ERPml0wEXoHSDffyuORHMuNHd3fgsFy3j
	GHcRPRJlB1XQ+MPaOYVCzsVRsCcSHdFtOl7Tk23Twsi3XSQGlvv9p3qheiME65JzJ8Tv8R
	XmbXDGsRw5GhMIiSpMrvDuDrUS61PsU=
X-MC-Unique: bTkOZMoaNP6jvjmYRUQrxQ-1
X-Mimecast-MFC-AGG-ID: bTkOZMoaNP6jvjmYRUQrxQ_1747905084
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747905083; x=1748509883;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Efw/xOoBR5JtsAGWTbkGb39F5QrJRSJy0Aiy1rPkylA=;
        b=rBbPFp35WwcajZHtIF3BmOlaWJkC2Ry2LLMbvsQ/4TBvkPNfdDc5G305h2yAXx7wgC
         8AWM5XAPj6XTQXUOWn60qTIhunAIGUWDfcZeC1konxGSYVXVusjw0k7097SYAQPB9564
         yOy9E0PhyfiRFQDSrg4b+kgGrsep/vGuiVASFbDlyBHqNu5xAFdBeAFhGhncsj1+BxsY
         AajOGAGKx9o/QanA58yp9a0oNqCKXQP857ykgG1Bpt5HGlEiYNUTNZRDzZIBZTTrClxV
         uYqN7Jf/OmyMDGAoGV2DLqkKpbfYVzKKDKF7FKK1fVXBVbJt56r7nXEY3QKYKNykayzV
         E2MA==
X-Forwarded-Encrypted: i=1; AJvYcCW9uYet3Gn5qIdjsHHKbN7jEll+iYPn11xju9kzrqKrNpTsfeDDgp3lsH+6ES6nTK+ctlAA6GCplg4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYZ/xu+xeW0d3WaPXUmNOSG20qvG97Z6kO03LFA0vgMVdYJ3Jr
	0T2C7nUoHTAvjRipZ8yTxH2O3SsxU46T0uZe52HBpywDA9eHhY4hSag25HVKxyo2GUw8AcKmNeY
	nJTwcDSip96Pbz3W4po35VT5Mnn2Trsb+FNYbYx7KfryUgKFOWfHLHRdCIHE3wPRu3Ezx
X-Gm-Gg: ASbGncsxveVJrynAct6Eohacns/H2XDpY0fbiWQ/w110/uxHw4ysbnd0yhBlLfyPMKL
	UmlArYBoPYfue5BjT9bgpNGKJTYseBZLCJfL6jGecvHN+YoHDUqQAhS4F9pxVPcjGhXqCresoN4
	yQzhzo5ZQLLYBHVjjod2kJvaaaFcP1afWOxYeyIovTuBE3Mc+QV5VW8pyGD/p2XlZjxElBMWZgl
	wkTmtF5nJM6daTXEKk786mxTxo4PY1DIl+LQ0W/KbeTv5gbKE/W6SyHq50KJ2mZ0XDFJ7IptYvO
	BcsFwKE05+hLItVt5v4=
X-Received: by 2002:a05:600c:a016:b0:441:d2d8:bd8b with SMTP id 5b1f17b1804b1-442fd622c81mr247895365e9.8.1747905083665;
        Thu, 22 May 2025 02:11:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEciTJ/zcRf4AXElu0pqBhYj5jKqeehae3NT83Gy64LvlkBARBipL5idMvjE3WFf06oe/P65g==
X-Received: by 2002:a05:600c:a016:b0:441:d2d8:bd8b with SMTP id 5b1f17b1804b1-442fd622c81mr247894945e9.8.1747905083275;
        Thu, 22 May 2025 02:11:23 -0700 (PDT)
Message-ID: <f8640da1-c442-4704-8f0a-8d498e1b7e16@redhat.com>
Date: Thu, 22 May 2025 11:11:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 net-next 5/6] socket: Replace most sock_create() calls
 with sock_create_kern().
To: Kuniyuki Iwashima <kuniyu@amazon.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Willem de Bruijn <willemb@google.com>
Cc: Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuni1840@gmail.com>,
 netdev@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
 ocfs2-devel@lists.linux.dev
References: <20250517035120.55560-1-kuniyu@amazon.com>
 <20250517035120.55560-6-kuniyu@amazon.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250517035120.55560-6-kuniyu@amazon.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8ODJYG7RA8TK3KoqhuIaeFFp0fCdYlzd2VERTZw1aUQ_1747905084
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/17/25 5:50 AM, Kuniyuki Iwashima wrote:
> Except for only one user, sctp_do_peeloff(), all sockets created
> by drivers and fs are not tied to userspace processes nor exposed
> via file descriptors.
> 
> Let's use sock_create_kern() for such in-kernel use cases as CIFS
> client and NFS.
> 
> Signed-off-by: Kuniyuki Iwashima <kuniyu@amazon.com>

The change makes sense to me, but it has a semantic change, let's add
more CCs.

Link to the full series:

https://lore.kernel.org/all/20250517035120.55560-1-kuniyu@amazon.com/

/P


