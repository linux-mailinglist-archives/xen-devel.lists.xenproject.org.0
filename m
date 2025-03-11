Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23449A5B9C8
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 08:30:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907261.1314521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tru3a-00070y-CC; Tue, 11 Mar 2025 07:29:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907261.1314521; Tue, 11 Mar 2025 07:29:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tru3a-0006zE-9S; Tue, 11 Mar 2025 07:29:42 +0000
Received: by outflank-mailman (input) for mailman id 907261;
 Tue, 11 Mar 2025 07:29:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+cUl=V6=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tru3Y-0006z6-It
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 07:29:40 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9793fdce-fe4a-11ef-9ab8-95dc52dad729;
 Tue, 11 Mar 2025 08:29:39 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso13614035e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 00:29:39 -0700 (PDT)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ceed32e64sm89167575e9.5.2025.03.11.00.29.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 00:29:38 -0700 (PDT)
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
X-Inumbo-ID: 9793fdce-fe4a-11ef-9ab8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741678179; x=1742282979; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nhHodvfz83K8okGx6PVYNh8AahNsL56U7T1i1KJXP8w=;
        b=ADmHkj4mKlFG+8oTE95qyUFP0KaACmh5wdQ3dK/GJ7OdjjcQFbuic13Qahp2z7i1Sq
         XjQ+1adUGirZSmSfTtbRniiACTVBH7VRIcMdudgPcGfLPETXi8gLHEoN4QEVFfQeXrba
         wp15/i1XcjmL3ew08dJievPoqehFS8TtWMZQ26B9SEZbx6IFEu+E9ixOUXaSBphyBzhi
         qGHv4hjDPhptMvdSS6MYkZvq+MD1gyZMciwhigbx2fNY1uuHAh4cXNVSlWGRwyvfTqKm
         CzeVoWlMiFhzgTLpKfTLONHx2pXIJmwoXBk44BiidVemZT00lRpczN6iBN/DiDlxoNCj
         KaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741678179; x=1742282979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nhHodvfz83K8okGx6PVYNh8AahNsL56U7T1i1KJXP8w=;
        b=oOcP+pwrl3AWmttjSs5waJZjJNO0B/AySxij4fXW+xjQRn/aHtYH6LBOwaZdoQNTo3
         JBnmTyNyIPKvtybGIMTNOTplZcetQAutev1pzBtq8p0cbfLgorKnrxNlBm57FPJxyb5A
         6rxO+tDQRDkjrCl3xhiT3+ZmLbkU83MantklCB+3wSU2A5wpIHJA60OnqD39D0/g5K/x
         fehj9lRzNh4W2QldZQST3EhDludirXvCE7pHER4FtdEQSGxoBcIlcE9zLyROI8VePG5B
         KvdD3BsMlkUStVdpZ3xBRQTNq6w1rdF464kyh/BqBpgIycpcMJQYLmnHJtS4M+ZTOI4p
         WfOA==
X-Forwarded-Encrypted: i=1; AJvYcCUhZW4Rz6zwZa21lyUCOvlSJWWlhZP/qQnMIetmYDbwGjqjNSzfKC6b9Efmb1wXgnQNjxU20R6es7k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzK7LHmYkwlTp/oVySaFVZrKsCcKjct5vMS+4VTgk1yLJbFIoch
	9R1nVPDdfSI3QuTq2vgJT5UrZWpGPzcc1QNSFUFyrhN5OmcweHX2U6zYRMmg6yQ=
X-Gm-Gg: ASbGncucLpQb8980zfI8NqQ7OJotO/HxpbqF500ngWYjiVc+8/sSHBwuVRI4D5kBcqy
	ChlIwn3u8jl7ud5JO3dyPAFPIpL7tQR3N+INgdQxEGfkUbxFI/pSP3l1peQ7YqsXS1lR5glBc8m
	xEgFkuo0qO8lTBS1p3TE1zQmCt1QTNaqvBqnp2q5IMANp0fg+2sIdUBoxohtDFJDO8448dRZQfr
	0ZeYHslDU0CFE+HCti1yo7OZWUkmLDI9x7Orr7vyK094TnELdkiC1blvZBXYFbMGWO/qFEqSz9q
	Bldq9AdcJWJp44bEXjzZmnGZ/D7udJq3h4+SWiTsw8lQbMVwE2oSgD+LN69rdyExk46lfeoDHWl
	4HNDxRebrLUvW
X-Google-Smtp-Source: AGHT+IGCQ0WPIofxeMF6qiP5Neb98oKIcffSaO1IosDf7UGuxLQbtl0ssdei0czfpoqguWEGtKCbYA==
X-Received: by 2002:a05:600c:3545:b0:434:fa55:eb56 with SMTP id 5b1f17b1804b1-43c5a600909mr128191755e9.7.1741678179189;
        Tue, 11 Mar 2025 00:29:39 -0700 (PDT)
Message-ID: <2aa408e2-a412-4eb6-b589-1bc2f5ac145a@linaro.org>
Date: Tue, 11 Mar 2025 08:29:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/16] exec/ram_addr: call xen_hvm_modified_memory only
 if xen is enabled
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Xu <peterx@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, alex.bennee@linaro.org,
 qemu-riscv@nongnu.org, manos.pitsidianakis@linaro.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Anthony PERARD <anthony@xenproject.org>
References: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
 <20250311040838.3937136-12-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250311040838.3937136-12-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/25 05:08, Pierrick Bouvier wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

I didn't follow this direction because Richard had a preference
on removing unnecessary inlined functions:
https://lore.kernel.org/qemu-devel/9151205a-13d3-401e-b403-f9195cdb1a45@linaro.org/

> ---
>   include/exec/ram_addr.h | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
> index 7c011fadd11..098fccb5835 100644
> --- a/include/exec/ram_addr.h
> +++ b/include/exec/ram_addr.h
> @@ -342,7 +342,9 @@ static inline void cpu_physical_memory_set_dirty_range(ram_addr_t start,
>           }
>       }
>   
> -    xen_hvm_modified_memory(start, length);
> +    if (xen_enabled()) {
> +        xen_hvm_modified_memory(start, length);
> +    }
>   }


