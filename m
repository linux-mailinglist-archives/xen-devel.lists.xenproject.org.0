Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3AABAE89B
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 22:28:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1134486.1472347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3gx1-0001Yc-9q; Tue, 30 Sep 2025 20:27:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1134486.1472347; Tue, 30 Sep 2025 20:27:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3gx1-0001Vv-6C; Tue, 30 Sep 2025 20:27:55 +0000
Received: by outflank-mailman (input) for mailman id 1134486;
 Tue, 30 Sep 2025 20:27:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jqmq=4J=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1v3gwz-0001Vn-Qj
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 20:27:53 +0000
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [2607:f8b0:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed9ed82c-9e3b-11f0-9809-7dc792cee155;
 Tue, 30 Sep 2025 22:27:48 +0200 (CEST)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-78127433a32so3229311b3a.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Sep 2025 13:27:48 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.157.132])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78102b64a87sm14613842b3a.69.2025.09.30.13.27.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Sep 2025 13:27:46 -0700 (PDT)
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
X-Inumbo-ID: ed9ed82c-9e3b-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759264067; x=1759868867; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/mRpoLgFc8U26Jlg/SSZYXO8nFhlzFTCTlSmEDP24rk=;
        b=P9Wety39JmWmVQloW6Znucv+G9QERvFTWe5aXdAGOhIKPSEmv9YaOQk52CU0zn9uel
         yOoze12NXK1mZuFHgboQhhPLaD7FGID73s7GErj6WMbgvAM5tskwFy6AzsrCpOmCLF+i
         C75McjVm3McY1sYfWQcr52bCx2jFAdTRfOzmD3/tR6XU/R+DerXnfdfUw3BfgVB2Fe74
         sfsRqtXWNe3GXZ8wJJpAObhp+jozOPd3F5J3nWFVyHmTwjUTcNcqIbVCIF9lO4snQtIy
         hxD28XQKfo5pWzGKb4G3ZrajaCjXpuH3s5yjqjwOXS3N80Dt0U01M+1evWrWW0dtO7ai
         ThWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759264067; x=1759868867;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/mRpoLgFc8U26Jlg/SSZYXO8nFhlzFTCTlSmEDP24rk=;
        b=BiCIREJd/6Ya/1+peoJzwZ1M7OJGzLs/dkZ/6c9+v6/r7Dl2OIYVYDTb70VorWSIH0
         H2f/56kKtz2jPJGInG8VEOi/aXLEnn0J7EVZ1LMAa3O+LVxCkA7TQBL+ZUIdZgw+UWCR
         d02XxlQv1pNrr5kz0qaIOPzfkpEOI59txDzSLIxRedfqxw5VnHN2rjAryDpKDDMUx87N
         F01zEviFEGtdNbgo9TWRNKbvbKOIySZtovHWR69TyuCGZfwgFSzCueK1LJ0epPJ07b+S
         V3ml0VctH4+uJGQNI6k85VQHD4I5YiH0ngqBNRKc3zlMnqf6qdgROQ1ai3lVz1xXt34w
         ZaLA==
X-Forwarded-Encrypted: i=1; AJvYcCVPZXIMbBPYKekdWJzb3PGV9D6yTM4TmvCf1djTNQJCrTrp5DoDAPWPoi8XITdLWDWosuqrzc7Yl/w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy017Oz+u4NshJv60qbX0sc74S6zp5EgsQfnr2Hj9bi+9GiwG+/
	1fEogByWsXMGFMhTT3U9PvwAQOqdTmrMUs5OJio65XK1h1xz/6yBQ9esEk+wcgowjMU=
X-Gm-Gg: ASbGncvMrBP6OQKYP0LJe7B/kdWtQsHXNYm5ZzFjkSYeHj9lAlhj3BXMP68KckoNgOA
	ZPa3czjoBmpdQNc9NliR48kLipoz1CbZD+bB0MlIOVF+tCLOrO+3flK1VpwrMiM7oRuk/nDq6Md
	rsSyyBWTpKa+YnhZw5cOmU26YtM7fD/C6i1n5qHwTZvyz6W1hPAhKBYGHbubICMZkW7+VYfJ/Tc
	VHeREH16yknMmG15Rw0+y8YR1diOOsSuSjDwYytTmhta9e8yOdbmtP3UJkI4zFKQUXHcMok+gd6
	ldBLa+WJBSJAa42cqfX4nQXfBgQ9/pDaF19G3TY+951p1rgLvxmFaA1isN/zD3G2QNGa67bbIaN
	mIYAx8gE9oEgxRYI9YkRD5Vs7ECWkWPSlLGAogV7eqaldJl9DJSrwp0J7HTIrVAH/WsK59Ao=
X-Google-Smtp-Source: AGHT+IGHwGdaI9/7x3FSGjAll2aiAsXQ51koCXbRJnhtoa+Tb/JHj9ZGjhNKi09HfL4J9l5mVWb8dA==
X-Received: by 2002:a05:6a00:1146:b0:781:2320:5a33 with SMTP id d2e1a72fcca58-78af3ffe1e5mr846993b3a.9.1759264066784;
        Tue, 30 Sep 2025 13:27:46 -0700 (PDT)
Message-ID: <429e61aa-a9af-4a97-a549-d7d782e34fe5@linaro.org>
Date: Tue, 30 Sep 2025 13:27:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/18] system/physmem: Un-inline
 cpu_physical_memory_read/write()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Cc: Marcelo Tosatti <mtosatti@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Peter Xu <peterx@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 kvm@vger.kernel.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org, Stefano Garzarella <sgarzare@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Anthony PERARD <anthony@xenproject.org>, Jason Herne
 <jjherne@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eric Farman <farman@linux.ibm.com>
References: <20250930082126.28618-1-philmd@linaro.org>
 <20250930082126.28618-15-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250930082126.28618-15-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/30/25 01:21, Philippe Mathieu-Daudé wrote:
> In order to remove cpu_physical_memory_rw() in a pair of commits,
> and due to a cyclic dependency between "exec/cpu-common.h" and
> "system/memory.h", un-inline cpu_physical_memory_read() and
> cpu_physical_memory_write() as a prerequired step.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/exec/cpu-common.h | 12 ++----------
>   system/physmem.c          | 10 ++++++++++
>   2 files changed, 12 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

