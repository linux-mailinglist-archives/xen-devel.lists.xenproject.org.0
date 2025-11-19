Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B7DC70920
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 19:06:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166270.1492847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLmZm-0004Pa-J3; Wed, 19 Nov 2025 18:06:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166270.1492847; Wed, 19 Nov 2025 18:06:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLmZm-0004Ny-GA; Wed, 19 Nov 2025 18:06:42 +0000
Received: by outflank-mailman (input) for mailman id 1166270;
 Wed, 19 Nov 2025 18:06:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t1IC=53=redhat.com=peterx@srs-se1.protection.inumbo.net>)
 id 1vLmZk-0004Nj-Iv
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 18:06:40 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d1e1283-c572-11f0-980a-7dc792cee155;
 Wed, 19 Nov 2025 19:06:38 +0100 (CET)
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-T5Dtxxx7P1m28COS9VU3uA-1; Wed, 19 Nov 2025 13:06:32 -0500
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-88236279bd9so309216d6.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Nov 2025 10:06:32 -0800 (PST)
Received: from x1.local ([142.188.210.156]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8846e46a846sm181466d6.18.2025.11.19.10.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 10:06:31 -0800 (PST)
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
X-Inumbo-ID: 7d1e1283-c572-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763575596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zxKk+ZBrfy+3vEGqZdJgfoqPz6L6wSNR8CNOxVRPE4c=;
	b=VlMsuoi1p6TTwBjL+hh5RMlHl10hjws/DsevogC9RL29qNOj8Zeo8v86n5vGduoYgzSfup
	5jkmgfkL3zseIRrkxloqfhqs9grilag+Aw834J59RUdtgXbB1ln7LnC27szOiftTqXTuRa
	4teI5N/Tk0hPqPonCUmbp9Pvx0yKUog=
X-MC-Unique: T5Dtxxx7P1m28COS9VU3uA-1
X-Mimecast-MFC-AGG-ID: T5Dtxxx7P1m28COS9VU3uA_1763575592
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763575592; x=1764180392;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxKk+ZBrfy+3vEGqZdJgfoqPz6L6wSNR8CNOxVRPE4c=;
        b=wCSUNanUwXlBckPi1BU5p6laeoCBLwLUHvbrjzSosv5cJhU/9PNVfUC+UID5QgZu9R
         g295DfoifwKXHHNTWW06O+JuRgVi24t1fpWlhHdnqBSGs4kCrEXHDMYcYvQjuJRYktH8
         9kggQfiErdczJfNWv0vMb/1JON44IyDvjLXn4Z3su2BAgNRF1c3B7dNWgz6S51VSWeci
         gdJpn/+B98zYR78lKUo3tdEUZccqNdlzNM5XMl/erld1E29wGo2uakhEnUasQ8Uf5jAV
         jhsPqa1iJzt5OnZQeZncxjjEgcuC8A5g80F3M7nGeejkUjdYgYa4edVrOF915IQL6U4a
         94sw==
X-Forwarded-Encrypted: i=1; AJvYcCU2pKZ6n14b6s1PEg+RUpwO1LcMcMqpMTBsGVzyGAiJ2eslRXtsrc46R6jo9xSmtv6fNy1GbXXynok=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyiX1bU3RwCNgSW6ESsg3NtjnFI/CgYNz5NQXL905eHI97XXrHj
	UJCDcXHy2Cnh/Uz6u1zOUIR5498lbxjJvh8usSrdnHd6mo8E1JZ8GgZlfa7bwIXNGUFd/+9TMiS
	zEcXmcbcpq932OXLSHRs3kEqNNfUVj9Czn36wUzoNWew613dF4i0V+8N4/iTIaMJMW4oW
X-Gm-Gg: ASbGnctG0arymW8l1E57SKXvKIo6Y2VzmK9bfOSu48PYvmuOsrGHTqDeaEW2zhBDrat
	zc3lnZeJLR8O0fDcXp5DTBPQ4exs5FujFgsdwN9AIS9lqU21BY3GrLj9VzZsyBqw+1tY1CYlIwb
	xUyeMeN5WHYQ3FD8xn6QDfYG7Yu5Xu08XZMpQPpcdG/8L+lFZj+1ZBtzj4AJaJ3Ff5Vq6jPEd1i
	Yu5Dk0Y8rjd2HoFGSolKp7OyVZHLaskWyqlBwLD/eQmkjtZX9muPD0zuo0qlRVVtyL27XZ2reXs
	EjXPvULk8Dn1E8KKf2FcYuB/D6RPqpP0CIZllkTZAgNxYdjPSLZia7C5/LHxgE4ZuF4RkQpB08a
	FVBw=
X-Received: by 2002:a05:6214:20ad:b0:880:48c6:acfb with SMTP id 6a1803df08f44-8846e1d1ee1mr1616206d6.49.1763575592089;
        Wed, 19 Nov 2025 10:06:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFA3KddVigP0uQkMDW+wiQ07QNB1nQ4u8CPelnAOsxIbSfbRmY+sPznvOSd7uBlcPTF+2F45w==
X-Received: by 2002:a05:6214:20ad:b0:880:48c6:acfb with SMTP id 6a1803df08f44-8846e1d1ee1mr1615226d6.49.1763575591593;
        Wed, 19 Nov 2025 10:06:31 -0800 (PST)
Date: Wed, 19 Nov 2025 13:06:29 -0500
From: Peter Xu <peterx@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
	mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com,
	gengdongjiu1@gmail.com, peter.maydell@linaro.org,
	alistair@alistair23.me, edgar.iglesias@gmail.com, npiggin@gmail.com,
	harshpb@linux.ibm.com, palmer@dabbelt.com, liwei1518@gmail.com,
	dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
	sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org,
	berrange@redhat.com, farosas@suse.de, eblake@redhat.com,
	vsementsov@yandex-team.ru, eduardo@habkost.net,
	marcel.apfelbaum@gmail.com, philmd@linaro.org,
	wangyanan55@huawei.com, zhao1.liu@intel.com, qemu-block@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/5] hw/core/loader: Make load_elf_hdr() return bool,
 simplify caller
Message-ID: <aR4HJQGqCswwH022@x1.local>
References: <20251119130855.105479-1-armbru@redhat.com>
 <20251119130855.105479-2-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20251119130855.105479-2-armbru@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5N7CIaM51r64DAMGbAuBBWn2gZaEaqNmmqfSebRkRa0_1763575592
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Nov 19, 2025 at 02:08:51PM +0100, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


