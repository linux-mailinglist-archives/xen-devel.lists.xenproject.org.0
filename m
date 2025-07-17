Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E39FB08AF9
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 12:42:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046578.1416910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucM4V-0007xO-3v; Thu, 17 Jul 2025 10:42:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046578.1416910; Thu, 17 Jul 2025 10:42:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucM4V-0007vx-0R; Thu, 17 Jul 2025 10:42:39 +0000
Received: by outflank-mailman (input) for mailman id 1046578;
 Thu, 17 Jul 2025 10:42:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W9zS=Z6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ucM4T-0007vr-Fg
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 10:42:37 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0835fdf-62fa-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 12:42:36 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a531fcaa05so340192f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 03:42:36 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b5e8dc9349sm20186386f8f.45.2025.07.17.03.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 03:42:35 -0700 (PDT)
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
X-Inumbo-ID: c0835fdf-62fa-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752748955; x=1753353755; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JuF4RAA4PrrP+7RPkn9EC9riMIGgZCpO0HDaRWuOqhM=;
        b=PBtFy6sziILv6ywnvcwHghceZdNQPeCPT9Ngc2o1Sy3WlmC/Ps1QVocX1lCHUiAHe2
         ZQUtn7dBjNDioyp2Uoecm4hzh5S8EWroOP1NT2HeMpmifwjrAO43ZfMGczF/1oCSwyLR
         k69zl8uZeCjI6SCv/LPQAF8qg0tDNxU+iVpUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752748955; x=1753353755;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JuF4RAA4PrrP+7RPkn9EC9riMIGgZCpO0HDaRWuOqhM=;
        b=nQJggh+aEsf+QNiJDk4d1/CC/9sDW51NsUgXqOIwpcH2a1FV0GEu1Fk8pCy0k4kv3Q
         dhi0CXfDy8XdReHxdhy0cpL7xcLbSzDuFB+wUau5LShKW7Yo3kdVFlkyJIgZwqAFMKDh
         QiB+1uZEpVnUMbSQoFwhDHB0hA1AgrNWssYU0+M1NFgKc/sFEE38AtQ/5eOiR5yzhYs6
         r8OzGC1X05b45sIQjFKaXr3kM7K3xkv+kzMW8P/lqGi/YWeVeFktRObvAPa86RBs5vv2
         ghhyexcKWzRFq8W80la4F9iSjlUc3QM9+Ei02mVZwCOSl1f5+4r1Gz3ZyXAHpVgWpE4V
         VbtQ==
X-Gm-Message-State: AOJu0YxrWbQO+gyuk/syVdaof3DYeD+6UCdyRLjrYJQEPPllv/vPaOFC
	n4lHXjT3Sw/Q8V+ruThV80lobiTrxU2SNf3T6XF5qKjnG2YI7z4/HOE9blChBdcXi4k=
X-Gm-Gg: ASbGncsLrZVHJPluhbNUlFI4BpYkkJcSdKUN6M0o2jZ/AD1JjzPW7sa4rCR3QSKBPax
	mGwfMvfeqU/+f2DxiJiQNMsOuaBZ3xIkbSCtJlMhzPIBN6uyhCCBeXEEHRJlYKIyAT9zUuV0d+V
	FsWCluBf9qiUqpjgHZ9G5UuXkKQDYA+SKvwq959M5Y1ktcwhlvcgA/4dzhYRuDv+cRG3BmR5pNK
	R1AXV8XHMa+ooUb3VUAvY7A8tO7QLUl0FCMwVZbeR7tu5yCy69U3hv9477vp8M1j7KtY1sDTiEG
	zSJECGayu1NyeZVLKMh1B/bPmtglDlwuUeRxRNCOqAvgpl+Q1OA5f6KPgCWxfV1EhOZTThRhdgw
	SPUB/W1YF1gsMmgYfNfoscAO/SbGOHbE4sA6f64L66YLKjy0IHSP1D4o/Ap+x0pSOoA==
X-Google-Smtp-Source: AGHT+IEc9mBJrw3U269ZU4YmyWzJuOGLyfFl4PyL6Mx3vlvq5oBK+TSSlKWG1vEDJ09CtIovZX+/0Q==
X-Received: by 2002:a5d:5e85:0:b0:3a6:d93e:5282 with SMTP id ffacd0b85a97d-3b60e53d2abmr4233381f8f.59.1752748955440;
        Thu, 17 Jul 2025 03:42:35 -0700 (PDT)
Date: Thu, 17 Jul 2025 12:42:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/S3: don't lose previously collected CPU data
Message-ID: <aHjTmtA9f_DLOHLf@macbook.local>
References: <662a4b19-1ea7-47e4-a89e-204fcef3a6f7@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <662a4b19-1ea7-47e4-a89e-204fcef3a6f7@suse.com>

On Thu, Jul 17, 2025 at 12:14:54PM +0200, Jan Beulich wrote:
> smp_store_cpu_info() doesn't call identify_cpu() again during S3 resume,
> hence it is wrong to overwrite APs' data using boot_cpu_data. With
> 7126b7f806d54 ("x86/CPU: re-work populating of cpu_data[]") this now
> results in a crash, as the cpu_to_socket() use in smp_store_cpu_info()
> then obtains a bad socket number, much like was already observed in [1].
> 
> [1] https://lists.xen.org/archives/html/xen-devel/2025-06/msg01879.html
> 
> Fixes: bb502a8ca5925 ("x86: check feature flags after resume")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

