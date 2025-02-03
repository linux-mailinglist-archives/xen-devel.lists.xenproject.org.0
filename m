Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF75A2604D
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 17:38:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880894.1290990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tezT2-0004ul-Gc; Mon, 03 Feb 2025 16:38:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880894.1290990; Mon, 03 Feb 2025 16:38:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tezT2-0004sX-E0; Mon, 03 Feb 2025 16:38:36 +0000
Received: by outflank-mailman (input) for mailman id 880894;
 Mon, 03 Feb 2025 16:38:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o2EM=U2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tezT1-0004sH-Eb
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 16:38:35 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ec15194-e24d-11ef-99a4-01e77a169b0f;
 Mon, 03 Feb 2025 17:38:33 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43621d27adeso31777935e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 08:38:33 -0800 (PST)
Received: from [192.168.100.192] (lfbn-gre-1-190-108.w90-112.abo.wanadoo.fr.
 [90.112.153.108]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1016a1sm13299149f8f.21.2025.02.03.08.38.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 08:38:32 -0800 (PST)
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
X-Inumbo-ID: 4ec15194-e24d-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738600713; x=1739205513; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jec4xQFAjJUK1Xxy9CGJ6NSI3M2lrZt0q1fmhc9Yy2c=;
        b=metWHi6+gGKOU5KreTg5ijTNd5mhCr33f0d7/hKpkwTsP08N2fGk9S37s0OkyhRrVX
         zTAByBEX4CLOia4lZ6qJxhNBYmZC6aNHHDlIkop45Sue3RHZllieBpwWX53e5JmPPJBW
         DCiedDYadyBwKuPZC7FRPfMWputxHGJjHrGaJ30/Z4pfRthOyZL4mHIg0EreuObeqUEt
         J03v5+R8dK5TpQIaQfadzDpxnWQOFT1gKhwnWWbIuDo14UmmpnU7uyju3d/AIVqPzlBC
         YshWyfvYDrZMT7ae9xhfPsdfUU3fLExd6Lm+4eIUGmKhMRsOJG8qQKomniFip8idxCMe
         hCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600713; x=1739205513;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jec4xQFAjJUK1Xxy9CGJ6NSI3M2lrZt0q1fmhc9Yy2c=;
        b=JSMFvK12vbydofa0hsWdrpi/kXvubXEAamqEbaSDZP9TV6ANskLblDrFrP2GerL3xe
         1Uog3FKJwjOd72TaUvvlzVmVGs9Sv+Z0qoOffmdWByiyY0JPACqk9FN+O2AFgqQal55I
         LPwbCR8rXDNXLhsuvvj1Gpm95gzpjKXno+62s26p9BaoVRBsESEima86cjWPAwBgdkEL
         f+qqMYQBXIdz0IlNr1J2Iy1wudESC1UEbBHxXGTneZDHYieIMs3IW152/HN2xfiySsgH
         K3OAOpmuL02c18jQW9Aj9hs204dlQLN/2f0t+bK/SnRl37kSAE8QFjpuNbnaI437HLlO
         xGBA==
X-Forwarded-Encrypted: i=1; AJvYcCWsOkl3EIQLqXwSwfcLZWW5OhbK7lT7NvLsqCmPj/3ga50IhJGsnlsGUH5g2x28TvUDHvnqjxTtViA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzpKRKV5UwLqkbKOCr8/rhRDyJwbGt/hRVYQRRRjs6NtRh54nYG
	DoxSQ3XRJ25mYgWsGwaeiVBb6H7XF3tCzCU8dW3Z3TMhvJlPqUwH
X-Gm-Gg: ASbGncuw1k5nA51Vpp6/dTtum8z+ZFz2pUSeftW9wpa2J9Uw7cUK+uAjfG9qQSqfF3r
	dHf5FURPO/A3xlww/LSyIwrH5EWRztY1DFSIdN+ZF+RY7rz4j+AXteD4aB3v/GWffo0Ipx8xWhb
	rWjurDALkOAG0o6SseQOeCCjQHvWuaNZ1OoPIz0RHgYWFLDZ3be0rRt51g1Kmyy5L4pXN0+xjXu
	I1F13Ttrqkxsp5W1h5R1Lrj/aZ5W4xINHm9u3+IdJJ4PzLuIWo9Ef7kpRK0XYpGSfRJmHI2aYPw
	XJKgKBvvFix8/6vcGDNAgjHIKL4FwyPcwjiNI5sBEEmaDSxeF20qBvIY3TPC0CV2P1zZSRmCpeE
	lE4U=
X-Google-Smtp-Source: AGHT+IHT/ccNVEAS9e4qIaX8I7YL7tk5rV/RolhQqCggKTquGp6n9FdenRmj1ZnV1vFTYrA1qbmzFQ==
X-Received: by 2002:a05:600c:1f10:b0:434:feb1:adae with SMTP id 5b1f17b1804b1-438dc3ae88amr192019685e9.3.1738600712692;
        Mon, 03 Feb 2025 08:38:32 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------JBuM1xB5RYqZ3h6f0uBmV7rF"
Message-ID: <3a049628-8693-4fe5-81a1-1961b1402e50@gmail.com>
Date: Mon, 3 Feb 2025 17:38:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 0/6] AMD/IOMMU: assorted corrections
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <30f29dde-15e1-4af9-b86f-0040658c381a@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <30f29dde-15e1-4af9-b86f-0040658c381a@suse.com>

This is a multi-part message in MIME format.
--------------JBuM1xB5RYqZ3h6f0uBmV7rF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/3/25 5:22 PM, Jan Beulich wrote:
> The first two patches are functionally independent, and they're presented
> here merely in the order I came to notice the respective issues. At least
> patch 2 wants seriously considering for 4.20.
>
> While alternatives were considered for patch 2, it's left as it was in v1
> for now. The disposition there depends on (a) the four new patches, in
> particular what the last patch does and (b) backporting considerations
> (we probably don't want to backport any of the radix tree tidying).
>
> 1: AMD/IOMMU: drop stray MSI enabling
> 2: x86/PCI: init segments earlier

R-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com> for first two patches.

For others it seems like nothing serious will happen if to merge them after 4.20.

~ Oleksii

> 3: radix-tree: purge node allocation override hooks
> 4: radix-tree: drop "root" parameters from radix_tree_node_{alloc,free}()
> 5: radix-tree: introduce RADIX_TREE{,_INIT}()
> 6: PCI: drop pci_segments_init()
>
> Jan
--------------JBuM1xB5RYqZ3h6f0uBmV7rF
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/3/25 5:22 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:30f29dde-15e1-4af9-b86f-0040658c381a@suse.com">
      <pre wrap="" class="moz-quote-pre">The first two patches are functionally independent, and they're presented
here merely in the order I came to notice the respective issues. At least
patch 2 wants seriously considering for 4.20.

While alternatives were considered for patch 2, it's left as it was in v1
for now. The disposition there depends on (a) the four new patches, in
particular what the last patch does and (b) backporting considerations
(we probably don't want to backport any of the radix tree tidying).

1: AMD/IOMMU: drop stray MSI enabling
2: x86/PCI: init segments earlier</pre>
    </blockquote>
    <pre>R-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a> for first two patches.</pre>
    <pre>For others it seems like nothing serious will happen if to merge them after 4.20.

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:30f29dde-15e1-4af9-b86f-0040658c381a@suse.com">
      <pre wrap="" class="moz-quote-pre">
3: radix-tree: purge node allocation override hooks
4: radix-tree: drop "root" parameters from radix_tree_node_{alloc,free}()
5: radix-tree: introduce RADIX_TREE{,_INIT}()
6: PCI: drop pci_segments_init()

Jan
</pre>
    </blockquote>
  </body>
</html>

--------------JBuM1xB5RYqZ3h6f0uBmV7rF--

