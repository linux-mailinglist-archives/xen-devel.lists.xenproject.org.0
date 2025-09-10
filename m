Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F0FB524CB
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 01:47:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118961.1464556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwUXI-0005Rq-3X; Wed, 10 Sep 2025 23:47:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118961.1464556; Wed, 10 Sep 2025 23:47:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwUXH-0005Pk-W9; Wed, 10 Sep 2025 23:47:36 +0000
Received: by outflank-mailman (input) for mailman id 1118961;
 Wed, 10 Sep 2025 23:47:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kMwI=3V=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uwUXG-0005Pe-KW
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 23:47:34 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 800813fc-8ea0-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 01:47:24 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-45cb6428c46so1626215e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Sep 2025 16:47:24 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e015784c3sm5139035e9.10.2025.09.10.16.47.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 16:47:23 -0700 (PDT)
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
X-Inumbo-ID: 800813fc-8ea0-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757548044; x=1758152844; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=S+0jbgcvmEaxlDS/V2Fg6mrwR+BPyJ7ya3qULySWySI=;
        b=onXpSidz0Ff23Hm0BkYRS5FAfaR8arpiKsaY1m5aOziGO/LJdzy2kZQAdS9gUsOhx8
         VOWIjVofXH6h4f+BmwdisNHHcaaPWsWv86pLOkLlgKm2ZiOfCrdFdV+DEYkIh9cveDRI
         jwE/71toV+MhO9OEJnjyD/Ha0XMAjwmJ3BTxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757548044; x=1758152844;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+0jbgcvmEaxlDS/V2Fg6mrwR+BPyJ7ya3qULySWySI=;
        b=mMT4xDVF2yP/VpE1LBEehkiQELVdMmGAWlsAi2lrSjqVzSwtRcbt87ZQpTZig29X6Q
         0bVnRSWBiTWJRL/h+lwyq6A5YacArnWjPDkDyWA/CA3O/heBeFE4YHtXUeQEPmbVP4yz
         1TB2zouBBaH8JMnzEDEvr3Arr96TlCjJU7eElIjaqwvMihLwiDugL7SWPMnQs6U00t8T
         TgFrp+v6eeF3q8GhyFM0L7CaBrVYUhPo49BSG7ocaHmnp5r8C7n5QDlujw6MXgL1I6hU
         eNXIRhqL17xsZPwF6HG1imAXTAhxxMMKig5gpwN97EvyNByn12KpHUffAFGsRAwh/Lka
         NbFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUc2uRvGKvEgDa0cT35GwhjYF+Pi2VeAGWHWHnc7IYr/CnR5+clFAF6tEB7GLn5q5zdqQ9RTVkeG0I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzToZGhyHJgJTE1VEXUjhjZkFaiEUXtgt4zvusFdvePRV0FdfGx
	Iw+InYKpUAJQM9yzbrIF7R8ZAJXx1iD1/eiSJIjC0WvOFIIeYWM7SoUIV6y5wLulFgg=
X-Gm-Gg: ASbGncuc0dBdkTxHojMaHmXUVlJgbyEyPk51XiecKVt6hx0MGhCFcgNba/A2XxklRTF
	epFRPm9B3zif+R/sISQt87enaww4ypDsRspmqnBQ+HEeQsXMpr2j1aQ4yYyvqFmsKoRHOQu46RV
	43bTbKPTaV6TA0WgczsEhPa4txRA7Uf1umCtly0BV8JgAqPaj3gTwkWdIn84EWuDepstPXgH8E8
	XZsHHgO7gMe6+NMKvZWUMZc0CIkecOvAZSr3JVUgbr6zuSphYb74VOBisDYZPYLlvdEJHXUbXzq
	fJp7OxE5Y2B3fDdyurvWJZNEgyXofC67IwgakjFUfWqD+OQ+xwyCSnqIIc2LMZE2TH5gRi2QUxF
	p0Clk5tOURYlnEW38ydsDn1P6jFrgbtw+CLT6AoPjo/ZTAIGfQ0wnvS129pPanlBnQJmTq6bQ95
	56cCE=
X-Google-Smtp-Source: AGHT+IEWfgwNtnTl8WTz+lNaJ0U2zfFL9OHwwqCYMfAFSYZ8ZaQCrLHJWXff+Vnvgy66xEur8m9/+w==
X-Received: by 2002:a05:600c:1390:b0:45a:236a:23ba with SMTP id 5b1f17b1804b1-45ddded76a6mr143623435e9.22.1757548043858;
        Wed, 10 Sep 2025 16:47:23 -0700 (PDT)
Message-ID: <93b71cf5-5f58-4170-8e4e-0dee2ec21484@citrix.com>
Date: Thu, 11 Sep 2025 00:47:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] coverage: add missing include for macro
To: victorm.lira@amd.com, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <ae1c963aa985694967ca7ba87929b2a66dcfd8bd.1757545904.git.victorm.lira@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 xsFNBFLhNn8BEADVhE+Hb8i0GV6mihnnr/uiQQdPF8kUoFzCOPXkf7jQ5sLYeJa0cQi6Penp
 VtiFYznTairnVsN5J+ujSTIb+OlMSJUWV4opS7WVNnxHbFTPYZVQ3erv7NKc2iVizCRZ2Kxn
 srM1oPXWRic8BIAdYOKOloF2300SL/bIpeD+x7h3w9B/qez7nOin5NzkxgFoaUeIal12pXSR
 Q354FKFoy6Vh96gc4VRqte3jw8mPuJQpfws+Pb+swvSf/i1q1+1I4jsRQQh2m6OTADHIqg2E
 ofTYAEh7R5HfPx0EXoEDMdRjOeKn8+vvkAwhviWXTHlG3R1QkbE5M/oywnZ83udJmi+lxjJ5
 YhQ5IzomvJ16H0Bq+TLyVLO/VRksp1VR9HxCzItLNCS8PdpYYz5TC204ViycobYU65WMpzWe
 LFAGn8jSS25XIpqv0Y9k87dLbctKKA14Ifw2kq5OIVu2FuX+3i446JOa2vpCI9GcjCzi3oHV
 e00bzYiHMIl0FICrNJU0Kjho8pdo0m2uxkn6SYEpogAy9pnatUlO+erL4LqFUO7GXSdBRbw5
 gNt25XTLdSFuZtMxkY3tq8MFss5QnjhehCVPEpE6y9ZjI4XB8ad1G4oBHVGK5LMsvg22PfMJ
 ISWFSHoF/B5+lHkCKWkFxZ0gZn33ju5n6/FOdEx4B8cMJt+cWwARAQABzSlBbmRyZXcgQ29v
 cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPsLBegQTAQgAJAIbAwULCQgHAwUVCgkI
 CwUWAgMBAAIeAQIXgAUCWKD95wIZAQAKCRBlw/kGpdefoHbdD/9AIoR3k6fKl+RFiFpyAhvO
 59ttDFI7nIAnlYngev2XUR3acFElJATHSDO0ju+hqWqAb8kVijXLops0gOfqt3VPZq9cuHlh
 IMDquatGLzAadfFx2eQYIYT+FYuMoPZy/aTUazmJIDVxP7L383grjIkn+7tAv+qeDfE+txL4
 SAm1UHNvmdfgL2/lcmL3xRh7sub3nJilM93RWX1Pe5LBSDXO45uzCGEdst6uSlzYR/MEr+5Z
 JQQ32JV64zwvf/aKaagSQSQMYNX9JFgfZ3TKWC1KJQbX5ssoX/5hNLqxMcZV3TN7kU8I3kjK
 mPec9+1nECOjjJSO/h4P0sBZyIUGfguwzhEeGf4sMCuSEM4xjCnwiBwftR17sr0spYcOpqET
 ZGcAmyYcNjy6CYadNCnfR40vhhWuCfNCBzWnUW0lFoo12wb0YnzoOLjvfD6OL3JjIUJNOmJy
 RCsJ5IA/Iz33RhSVRmROu+TztwuThClw63g7+hoyewv7BemKyuU6FTVhjjW+XUWmS/FzknSi
 dAG+insr0746cTPpSkGl3KAXeWDGJzve7/SBBfyznWCMGaf8E2P1oOdIZRxHgWj0zNr1+ooF
 /PzgLPiCI4OMUttTlEKChgbUTQ+5o0P080JojqfXwbPAyumbaYcQNiH1/xYbJdOFSiBv9rpt
 TQTBLzDKXok86M7BTQRS4TZ/ARAAkgqudHsp+hd82UVkvgnlqZjzz2vyrYfz7bkPtXaGb9H4
 Rfo7mQsEQavEBdWWjbga6eMnDqtu+FC+qeTGYebToxEyp2lKDSoAsvt8w82tIlP/EbmRbDVn
 7bhjBlfRcFjVYw8uVDPptT0TV47vpoCVkTwcyb6OltJrvg/QzV9f07DJswuda1JH3/qvYu0p
 vjPnYvCq4NsqY2XSdAJ02HrdYPFtNyPEntu1n1KK+gJrstjtw7KsZ4ygXYrsm/oCBiVW/OgU
 g/XIlGErkrxe4vQvJyVwg6YH653YTX5hLLUEL1NS4TCo47RP+wi6y+TnuAL36UtK/uFyEuPy
 wwrDVcC4cIFhYSfsO0BumEI65yu7a8aHbGfq2lW251UcoU48Z27ZUUZd2Dr6O/n8poQHbaTd
 6bJJSjzGGHZVbRP9UQ3lkmkmc0+XCHmj5WhwNNYjgbbmML7y0fsJT5RgvefAIFfHBg7fTY/i
 kBEimoUsTEQz+N4hbKwo1hULfVxDJStE4sbPhjbsPCrlXf6W9CxSyQ0qmZ2bXsLQYRj2xqd1
 bpA+1o1j2N4/au1R/uSiUFjewJdT/LX1EklKDcQwpk06Af/N7VZtSfEJeRV04unbsKVXWZAk
 uAJyDDKN99ziC0Wz5kcPyVD1HNf8bgaqGDzrv3TfYjwqayRFcMf7xJaL9xXedMcAEQEAAcLB
 XwQYAQgACQUCUuE2fwIbDAAKCRBlw/kGpdefoG4XEACD1Qf/er8EA7g23HMxYWd3FXHThrVQ
 HgiGdk5Yh632vjOm9L4sd/GCEACVQKjsu98e8o3ysitFlznEns5EAAXEbITrgKWXDDUWGYxd
 pnjj2u+GkVdsOAGk0kxczX6s+VRBhpbBI2PWnOsRJgU2n10PZ3mZD4Xu9kU2IXYmuW+e5KCA
 vTArRUdCrAtIa1k01sPipPPw6dfxx2e5asy21YOytzxuWFfJTGnVxZZSCyLUO83sh6OZhJkk
 b9rxL9wPmpN/t2IPaEKoAc0FTQZS36wAMOXkBh24PQ9gaLJvfPKpNzGD8XWR5HHF0NLIJhgg
 4ZlEXQ2fVp3XrtocHqhu4UZR4koCijgB8sB7Tb0GCpwK+C4UePdFLfhKyRdSXuvY3AHJd4CP
 4JzW0Bzq/WXY3XMOzUTYApGQpnUpdOmuQSfpV9MQO+/jo7r6yPbxT7CwRS5dcQPzUiuHLK9i
 nvjREdh84qycnx0/6dDroYhp0DFv4udxuAvt1h4wGwTPRQZerSm4xaYegEFusyhbZrI0U9tJ
 B8WrhBLXDiYlyJT6zOV2yZFuW47VrLsjYnHwn27hmxTC/7tvG3euCklmkn9Sl9IAKFu29RSo
 d5bD8kMSCYsTqtTfT6W4A3qHGvIDta3ptLYpIAOD2sY3GYq2nf3Bbzx81wZK14JdDDHUX2Rs
 6+ahAA==
In-Reply-To: <ae1c963aa985694967ca7ba87929b2a66dcfd8bd.1757545904.git.victorm.lira@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/09/2025 12:40 am, victorm.lira@amd.com wrote:
> From: Victor Lira <victorm.lira@amd.com>
>
> The missing include prevents it from compiling when CONFIG_COVERAGE is not set
> and the header is included in a file that has not already included errno.h,
> causing EOPNOTSUPP to be undeclared.
>
> Add the missing include.
>
> Signed-off-by: Victor Lira <victorm.lira@amd.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, although

> ---
> example of the problem:
>     diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>     index 7ad870e382c..4d27f16e8ef 100644
>     --- a/xen/arch/arm/setup.c
>     +++ b/xen/arch/arm/setup.c
>     @@ -10,6 +10,7 @@
>
>     #include <xen/bootinfo.h>
>     #include <xen/compile.h>
>     +#include <xen/coverage.h>
>     #include <xen/device_tree.h>
>     #include <xen/dom0less-build.h>
>     #include <xen/domain_page.h>
>     ---
>
>     In file included from arch/arm/setup.c:13:
>     ./include/xen/coverage.h: In function 'sysctl_cov_op':
>     ./include/xen/coverage.h:10:13: error: 'EOPNOTSUPP' undeclared (first use in this function)
>        10 |     return -EOPNOTSUPP;
> ---
>  xen/include/xen/coverage.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/xen/include/xen/coverage.h b/xen/include/xen/coverage.h
> index ba5fb67947..28506c239b 100644
> --- a/xen/include/xen/coverage.h
> +++ b/xen/include/xen/coverage.h
> @@ -5,6 +5,7 @@
>  #include <public/sysctl.h>
>  int sysctl_cov_op(struct xen_sysctl_coverage_op *op);
>  #else
> +#include <xen/errno.h>
>  static inline int sysctl_cov_op(void *unused)
>  {
>      return -EOPNOTSUPP;

... this is starting to get overly busy to read and could do with some
extra lines around the primary #ifdef CONFIG_COVERAGE / #else / #endif.

Happy to fix up on commit.

~Andrew

