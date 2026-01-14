Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6B9D1F477
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 15:03:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203176.1518454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg1T9-0007tf-2d; Wed, 14 Jan 2026 14:03:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203176.1518454; Wed, 14 Jan 2026 14:03:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg1T8-0007qa-Ux; Wed, 14 Jan 2026 14:03:30 +0000
Received: by outflank-mailman (input) for mailman id 1203176;
 Wed, 14 Jan 2026 14:03:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81wl=7T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vg1T7-0007qU-D1
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 14:03:29 +0000
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [2a00:1450:4864:20::442])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb789862-f151-11f0-b15e-2bf370ae4941;
 Wed, 14 Jan 2026 15:03:26 +0100 (CET)
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-42fbc3056afso5110931f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jan 2026 06:03:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0dacc5sm50125688f8f.5.2026.01.14.06.03.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 06:03:24 -0800 (PST)
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
X-Inumbo-ID: cb789862-f151-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768399405; x=1769004205; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uDgFbJTg+T7n3yCT1y6vxNtm9qhtDEu+7IPLP3E06qI=;
        b=Uy6896eBhIhaDOMoYhLytsXXiA39LkZPWyyiNXOKwGf0EpfY3uUw046M2J1YLJHmzI
         DlUZcbASQpxv9jDybRbU5FEiK2tIbKUY+IM1bRzZtxT3DstVMOUsKVS/QajXTH3aAGSu
         BVVBM+nSE3G7fE+DQ6k8wr5T6OYA9aLKMYHZ9X2TGW8s8CT/KqB8tH+HzwodRCfp6Vyv
         WsMQxQQ/AFPeLth3yZ7hnc2xVP6ycA6U3ayXsk9IbOIQW1eqVbdahrML3pOxZM9Lphz1
         W2YsrfcpYRhThEq8zlVFd8g1l3F2P0GgGYjZK8WnGc7KeSHi5qU+H0TxqMz4Csr8JpfK
         shJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768399405; x=1769004205;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uDgFbJTg+T7n3yCT1y6vxNtm9qhtDEu+7IPLP3E06qI=;
        b=H+DXu0h3hqIMXS9Du8CInumdQIkrO2pItiQ86vS0bT+3Y2/nEAFldfR8clvrcUK3b9
         kKAanei9FSD2eKJzTvdcEX5DU1Ni767gRHwmRjm+Mr4AU4s+SbOM6s4AiZN6y9qXvnEm
         QuaMIj0sjaTEeXpqMW6hVTCxCugCk76QUWEq8RuoITNdOT9LNUS34+pDrokhHz7HIXxG
         kw5TTn3AnwEtWOt1fmtOIde70dlSeSDPmKoO+e8WaZ/7NweMcwlMJCMHN3RrLNZURr3T
         xhvBoGatdBPA2eZN7bIPDPnl4y+EUns54knmKLmk1MLgnlNFpQPVBz99zz0P8JZk8UUw
         ChgQ==
X-Gm-Message-State: AOJu0YzRRg5rnFJh6BULF4T6UHJhJKkPPpa3VxqTBqeKOahkp6mqln4g
	k4tuF6wr6vF/74XJD/+8n35wpCKpKnHTlYl8TEAJPRuYAWOm06UwJ/3hM/nxxodrGlVgm4zir8o
	1YIA=
X-Gm-Gg: AY/fxX7EO17KXx2+z7JVHvfU+7C4EAWoCSAAXz5m4+9eP4BokQFV4KVDCwBOtaNZ873
	HuTZV3L0GQK8R5S42NawkTg68zNE3S4Q2pGE4YAPk0PErhnE1Vc7PQPLM+VYSk8Igs5RKcMrD1p
	+NoiNzMdC7enq1mmyoBNmqe+w4JoP3nhcms44S36JngMmWsyWfEwTQEROegzE7KyWMZ9eTFzMFI
	kv9TLutQ+1XQ0cnHK1sDtJHP5gygyKe+fM7x/bzGcdjrq+cvdknDqbMd3CWKRJEexNmuS0uEq6A
	sSUr5h9uz7dCAj8dpndGIrDJWCczF+u0aycmPM9MOr0ToWSJOIB6c8KGR7ShJt1fLTDWS4Xd0hm
	G40ITHyY27PUR1EGvNGbwEM3/qcDWeBVizGZIWfCJAEn6/dDdLJnL1EDarHXfxoX36aPGZ1I2Do
	mv2BBNMh92G+LjS0Q/xk/oAsbVtrdjan7Gn+lPHh460Oa6I3WaPvBzGCEVW4E3V/BuflEIDbdaE
	b4=
X-Received: by 2002:a5d:584e:0:b0:432:4c01:db00 with SMTP id ffacd0b85a97d-4342c504ff2mr3629568f8f.27.1768399405467;
        Wed, 14 Jan 2026 06:03:25 -0800 (PST)
Message-ID: <ab8a6f18-522c-4493-b46e-0f51c4350bc2@suse.com>
Date: Wed, 14 Jan 2026 15:03:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] build: avoid Paths.mk in hypervisor build
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Its inclusion placed where it is, it affects the hypervisor build as well.
The hypervisor build, in its _install rule, uses $(DEBUG_DIR), first in

	[ -d "$(D)$(DEBUG_DIR)" ] || $(INSTALL_DIR) $(D)$(DEBUG_DIR)

$(D) is an absolute directory (shorthand for $(DESTDIR)). $(DEBUG_DIR) as
set by Paths.mk is, too. Both point into the build tree. The two simply
shouldn't be glued together.

Note that the earlier

	[ -d $(D)$(BOOT_DIR) ] || $(INSTALL_DIR) $(D)$(BOOT_DIR)

continues to be working fine, as BOOT_DIR continues to be controlled by
config/StdGNU.mk. Its DEBUG_DIR isn't taking effect anymore, when for the
hypervisor build it should.

And of course behavior now differs between building xen/ in a tree where
tools/ was built before vs in an otherwise clean tree.

Fixes: 82b9cc04a7c7 ("build: add make macro for making file from file.in")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This is clumsy, but I can't think of anything better. Suggestions anyone?

--- a/Config.mk
+++ b/Config.mk
@@ -162,7 +162,9 @@ endef
 PATH_FILES := Paths.mk
 INC_FILES = $(foreach f, $(PATH_FILES), $(XEN_ROOT)/config/$(f))
 
+ifndef XEN_FULLVERSION
 -include $(INC_FILES)
+endif
 
 BUILD_MAKE_VARS = $(foreach f, $(PATH_FILES), $(shell awk '$$2 == ":=" { print $$1; }' $(XEN_ROOT)/config/$(f).in))
 

