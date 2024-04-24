Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE0F8B01A1
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 08:17:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711128.1110848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzVvS-0002Vg-PF; Wed, 24 Apr 2024 06:16:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711128.1110848; Wed, 24 Apr 2024 06:16:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzVvS-0002Ss-M9; Wed, 24 Apr 2024 06:16:14 +0000
Received: by outflank-mailman (input) for mailman id 711128;
 Wed, 24 Apr 2024 06:16:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzVvQ-0002Sc-U0
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 06:16:12 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2320d026-0202-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 08:16:07 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-343d7ff2350so4865539f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 23:16:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j10-20020adfff8a000000b0034335f13570sm16097998wrr.116.2024.04.23.23.16.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 23:16:06 -0700 (PDT)
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
X-Inumbo-ID: 2320d026-0202-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713939367; x=1714544167; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kdfnpatrTyQeYsAvSX+9LoX28ahuJFBANRRsy2h7dr0=;
        b=QC+0HTHq0Oy0QHXdgDyu957UYWa51mTOePtgUq9VejHN4WHxnZ0QBNCyz/v7T5ZAGU
         1th469O7vWamnXZOWnT0BLrYQBny+vAeMIjXSlO2rwVSuAn/2m67Y6qOe0y+J4djcWdf
         eYQ5aHdYbHqLDgIKtJdgwMRHFRgj0a0AzoX557XNnioEdcoSTbebVn8BP7hoo1ZyxsfV
         QoSou92AyLtF29YmI5YBLtRRojusxs7GNz5pyCYOXDQvfIl8uRIaALqZ5e7Kf0QlH0HU
         aHZXb7BMScBURCAq6JEBz04bz8MmU5aP91fghZ3H1t13FiVB+u04/kPTVGoIx8PqMjtR
         lJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713939367; x=1714544167;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kdfnpatrTyQeYsAvSX+9LoX28ahuJFBANRRsy2h7dr0=;
        b=XuJG6xHvVr5u8t7iLYpuEzU2VqToc0jfle7GanF93ORiUfM7JPySXNCasUFI9EsGVC
         GgvMEOdX6Ss/qGTPGXrupEAx6uJ3ZuXGpuDcW8SUfEzbDupIIfK5tI5d8EKET3sfwQdB
         reOO8qmbmuH45zRiPWuHlrVwbfK3/TU3uj3uYhGgN75EzMPkeM+mhh5Bzu4kWDCjVAY4
         a3Z0hMItACwG6t/bn3yLC4uNjGHF+df7CanzkW0YJFjaAamtjhdJnwdnWYOhUs75J97t
         UWv0WigcTZKWUTRlbCBil1qvJhMbsexx1C3lfu0d81VsXrUr2WLTFb6uZKFLOZtVsEhd
         Nnsg==
X-Forwarded-Encrypted: i=1; AJvYcCX6H1LuradHoaTBzNkNM3nQ17qmm1ANrJcY3QsbXsFM0VesccfaB1W6u/d3X9FVn0LPhH2ZSBDrrXmGHRcOnkqD6Syby7Idi/qUHzCBX7s=
X-Gm-Message-State: AOJu0YxnS5hu8YCZ4CWvsG/OjYuRQrfTNwmMmkzjC49542n9+mYWA6h7
	gCfQ95ZCOdTUiMVf2A+ykgcqQR+BgDKYeu7E3N/zjz247KyHlT3b0J19EnamWQ==
X-Google-Smtp-Source: AGHT+IFYZj60IhL18hCwdw8hSxd2AWzfGitFMfKe61qm0KWMl88QNf3HQsAgx/U9jveYRtPsUjZwyw==
X-Received: by 2002:adf:cb0f:0:b0:34a:2a90:c45 with SMTP id u15-20020adfcb0f000000b0034a2a900c45mr760344wrh.31.1713939367186;
        Tue, 23 Apr 2024 23:16:07 -0700 (PDT)
Message-ID: <bc2aab70-08c5-4dfe-91ab-c1c24163cd46@suse.com>
Date: Wed, 24 Apr 2024 08:16:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/15] add a domU script to fetch overlays and applying
 them to linux
Content-Language: en-US
To: Henry Wang <xin.wang2@amd.com>, Vikram Garhwal <fnu.vikram@xilinx.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 xen-devel@lists.xenproject.org
References: <20240424033449.168398-1-xin.wang2@amd.com>
 <20240424033449.168398-15-xin.wang2@amd.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20240424033449.168398-15-xin.wang2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.04.2024 05:34, Henry Wang wrote:
> From: Vikram Garhwal <fnu.vikram@xilinx.com>
> 
> Introduce a shell script that runs in the background and calls
> get_overlay to retrive overlays and add them (or remove them) to Linux
> device tree (running as a domU).
> 
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> ---
>  tools/helpers/Makefile       |  2 +-
>  tools/helpers/get_overlay.sh | 81 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 82 insertions(+), 1 deletion(-)
>  create mode 100755 tools/helpers/get_overlay.sh

Besides the same naming issue as in the earlier patch, the script also
looks very Linux-ish. Yet ...

> --- a/tools/helpers/Makefile
> +++ b/tools/helpers/Makefile
> @@ -58,7 +58,6 @@ init-dom0less: $(INIT_DOM0LESS_OBJS)
>  get_overlay: $(SHARE_OVERLAY_OBJS)
>  	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenvchan) $(LDLIBS_libxenstore) $(LDLIBS_libxenctrl) $(LDLIBS_libxengnttab) $(APPEND_LDFLAGS)
>  
> -
>  .PHONY: install
>  install: all
>  	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
> @@ -67,6 +66,7 @@ install: all
>  .PHONY: uninstall
>  uninstall:
>  	for i in $(TARGETS); do rm -f $(DESTDIR)$(LIBEXEC_BIN)/$$i; done
> +	$(RM) $(DESTDIR)$(LIBEXEC_BIN)/get_overlay.sh
>  
>  .PHONY: clean
>  clean:

... you touching only the uninstall target, it's not even clear to me
how (and under what conditions) the script is going to make it into
$(DESTDIR)$(LIBEXEC_BIN)/. Did you mean to add to $(TARGETS), perhaps,
alongside the earlier added get-overlay binary?

Jan

