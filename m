Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16212B262E0
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 12:36:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081473.1441555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umVJM-0002dJ-PX; Thu, 14 Aug 2025 10:35:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081473.1441555; Thu, 14 Aug 2025 10:35:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umVJM-0002as-Mp; Thu, 14 Aug 2025 10:35:56 +0000
Received: by outflank-mailman (input) for mailman id 1081473;
 Thu, 14 Aug 2025 10:35:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Upc=22=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1umVJL-0002G6-UI
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 10:35:55 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 749f3947-78fa-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 12:35:54 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45a1b0bd237so6177615e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 03:35:54 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45a1cda0021sm14641485e9.13.2025.08.14.03.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 03:35:53 -0700 (PDT)
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
X-Inumbo-ID: 749f3947-78fa-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755167754; x=1755772554; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nJCEyfdgtEnWVmk8MeOuk/smWvq0tuH31sEx3Fy6Hjc=;
        b=KgpyoO2qVatAhHLVxsI2YFxytqE2k6evfhGvMBVwUf5cgSNYaLLB/ZwhbtCtYKwV4I
         g7/5mRZ6wxs7W2uW/JKuHMT3NLszAfVVl+Rl/y9Hxz2DFVqPJ7t9agFJOlio9AYF9mX+
         aVAaKlqBgl+XbRndNus7woRqAMiOEHwaYlkS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755167754; x=1755772554;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJCEyfdgtEnWVmk8MeOuk/smWvq0tuH31sEx3Fy6Hjc=;
        b=THwVz8SOy6mz/OkOKBuUzHnyo6GZuFZ8LZR5Mf33b403GJ2SWRCCY7ahF/zK6HKFOa
         S0+6BoZ6ZY8HKsFhhvIrU9T/ffMMLSnh0r2zQrWapgl7huIGo+MxGjuP9rD8zz6sN0zZ
         CbtO8NGe/3PQvkQ8mQQt86B1tV+RQseZf3GQsNLWeaiOaJEUBV2p0rqi0PN8G1TCrTm4
         YxyOHvuR93gvdEY/ggtk9IKn0fJl0aHt8/E47AtAZTrNoh1B5wiZV0beCKhMh9qcw9K3
         qQIhM21gDgPh0Pa36431MNeegqlfasN4fG7n10bPwbxpuAFd+lbcP76ZJFQ0BCHBilea
         batg==
X-Forwarded-Encrypted: i=1; AJvYcCUI4k5zt7sm5BDX3r5MObJp7D7xOO8f3n715NmVOkGUHmd2FYlrRrwABp3PRE7pgQmXMAFeBzldo74=@lists.xenproject.org
X-Gm-Message-State: AOJu0YygkxbE8C7GTBzdxQUwtsdpPeeUiarurTrd7OWLWkL4W5QPcCQd
	b/T1hMTEkdALhyRQxSF63JALNF6SdF0r45R8aKx+kDlUHU74e9gkgX6XYn4l3knOhOc=
X-Gm-Gg: ASbGncvv86S4zk+7LtOhXJ9hAegwBbz8F5GgheVxjOlF0RJtTKwMYdQDYM12IAYC/Vb
	MWnYLa4nGL0oZwHwKpWyfZEDOlv3eRWTtDrN2VcrmSsWFsQOgbco68JmzHbN6IzRY+789VbmYO5
	/e/PzSJSL4Lz8fnVa3bIfU2CTj33V2ejnr/rwPM7VZQpLUe8gutIvtsfif/8k2B0Nqtuy6lF2oW
	4JYApCqEoM9ZsHmIKMUDH5P+0cq1+xtTs9Qlgs12QL4XSN8Cu56ccSimwEXP93k4zYrB3uRpOW1
	XXRojOHkYzSAI+PToQHNCRab5LYCA0p7LpfLx2cfMwLry+llkM1bfqnXNWS4XnJrKw7yiRL6/1r
	uwGsuRxIW6dpIxVUMlwW8gxm6FG/UoRtre1/TDh+1rWy1qLKqfdF4c2yzDyV4EmmHpg==
X-Google-Smtp-Source: AGHT+IE3hXVFSwHUYCS/ZJ1l1sTcEIfs36SyqftiZxLLEqORrL+K0wbpY8n8hyP6zVIEncxJ4fL0KA==
X-Received: by 2002:a05:600c:4f92:b0:458:b01c:8f with SMTP id 5b1f17b1804b1-45a1b60f583mr19988305e9.8.1755167753751;
        Thu, 14 Aug 2025 03:35:53 -0700 (PDT)
Date: Thu, 14 Aug 2025 12:35:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/pvh: update "Host ACPI" support status
Message-ID: <aJ28COzujqBlrov8@macbook.local>
References: <20250813093220.76030-1-roger.pau@citrix.com>
 <becdc624-7bff-4b78-94c2-2999bad114fb@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <becdc624-7bff-4b78-94c2-2999bad114fb@suse.com>

On Thu, Aug 14, 2025 at 09:21:53AM +0200, Jan Beulich wrote:
> On 13.08.2025 11:32, Roger Pau Monne wrote:
> > For x86 PVH dom0 makes uses of the host ACPI tables, and hence the status
> > of Host ACPI entry should have been updated to reflect that PVH dom0 is now
> > supported, and Host ACPI support is not one of the caveats.
> 
> Well, not explicitly, but seeing changes like 6378909b41c4 ("x86/PVH: expose
> OEMx ACPI tables to Dom0") I'm not convinced we're there yet.

How would we know when we are there?  I think listing it here means it
had some degree of testing (which it does in Gitlab CI), plus that we
will address issues and backport fixes (which to my knowledge we
already do).

AFAICT the only way x86 PVH dom0 can get it's hardware information is
from ACPI, so not listing it as supported is IMO weird, it's not like
PCI passthrough or some additional feature, without ACPI support you
cannot really boot a PVH dom0 I think.

Thanks, Roger.

