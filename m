Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63269B00520
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jul 2025 16:24:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1039623.1411392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZsCM-00037D-KJ; Thu, 10 Jul 2025 14:24:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1039623.1411392; Thu, 10 Jul 2025 14:24:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZsCM-00034t-H7; Thu, 10 Jul 2025 14:24:30 +0000
Received: by outflank-mailman (input) for mailman id 1039623;
 Thu, 10 Jul 2025 14:24:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V320=ZX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZsCL-00034X-BS
 for xen-devel@lists.xenproject.org; Thu, 10 Jul 2025 14:24:29 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 963d77e8-5d99-11f0-a317-13f23c93f187;
 Thu, 10 Jul 2025 16:24:28 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a6e2d85705so738331f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jul 2025 07:24:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c301d9323sm5392642a91.44.2025.07.10.07.24.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jul 2025 07:24:26 -0700 (PDT)
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
X-Inumbo-ID: 963d77e8-5d99-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752157467; x=1752762267; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wt1d/n1Mnc6hy4dPD+7HTTdcZSeYol8pERm3W4kOX58=;
        b=Q8b7DWhXxIoW+GuCfgc3h6KKcfxN00XWU53MwkaCugxu4bGxJ3rEMj75KiUm3iDhE1
         GR+9MUOeVX0PRtRkIxXGrPR76kqRk4LPtKTjt8U+HuePhe/RDFK/2TGeAs1jNLJcirwO
         dwBb+3fm3Yd1UlXqEsLK26aak9d0eKgDAGSF1ZdSaTXXv0WDR/uRwK0WF8/vav5VqoFA
         qNYDBJy8nUpMHRN6haWxvMI1xTkAR/gNtka8L62f8cBttP1WTLPZ5nyijZ8fwCtnicPF
         NvDg5XMh7CD6UTJi4pj+zexuQTPkZSg81VTwON4icLVWFkQYx2d8xmV1cHv2q6lZ/Yry
         CO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752157467; x=1752762267;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wt1d/n1Mnc6hy4dPD+7HTTdcZSeYol8pERm3W4kOX58=;
        b=hpr/CqNZj5sYuiXy/TClj2RmcUpcnqRoB0YoQsJuj6qY6ZNC1JsSR8pQAMVhEsPnlZ
         gF1WU0z1lGREZCVe+xCM8zX/7nb00nxfjV24NxF/Zq+99CCG6ugEyAw9ai1+5pQF3jgn
         DFbzkTsXCwYbmGrp3EocZz557lg+/IYBGwPksAFgeF/yN6LxXgLw2CkCn0Labtw10a2+
         /oUfZxYXd21FONNU+mrgtBLjuBi66e2seozzRjrFXQzzYJLOZ5gA2TxN2YkDbRNk9U0j
         HEFFagyF1GUW8VdySA66imjxZs2AEId3n20eo5suqjnz+2LrRVB92lgDlh1keb/Zn/IP
         hHKg==
X-Gm-Message-State: AOJu0YxW8wg6yHLkzxlKkIiVLNlNBahXce/Qnw8MXDbHebCIJuSWXPjb
	ST1OJ0aDw9jiHyl5ED6nfC/Jw0twecREHgwTIUckVR3lakUjWGbfW3nU2vG+Y4I8pN9BLNs6qC6
	7ucc=
X-Gm-Gg: ASbGncs+eclxhL+oD4G2HMPpNrTMuAb+pUp2lD1ZD1bPNE8mnVBNtT+VkTI97+lN6hP
	7MOQrzaFC4HAt/CYeAYpaONGs8yf+fd0hTN/bNTwkhy8MuxTU6u+OAhCOs8anlpn4nAyeMIObZF
	pvsUnljskkXLAK2/LKXKod0Emv3U503zLtMp8JSnuwgJkzvE1U4NB6xGEPzsjGbKIrqWSsc1VpJ
	SHZu7I4MMF/fESSm2BvILbDHAXVxO1ySgUWgAhFlBcqTcZZ+Bt+utZdnzRONrXxcVb9iwSb16fL
	bg4Swbre0vPWGTg0ueVLUAqhud+7SB4KuGG5qSWJOUNb77t7NpxS4G+vEVOZ4jRdBXwX4gTJkFL
	+og9D1EG+4FseZLQzIxxlW1tQl6ZyPf5OD13o1+JaLfwC5dk=
X-Google-Smtp-Source: AGHT+IF9x2GGB4zqyotYS+tWUQwaZdw5mUwm9cl10kxU0ckcxxj0XjkuYKtuwNl6ir4p0ocaOsUZGw==
X-Received: by 2002:a5d:5d87:0:b0:3a5:2182:bd11 with SMTP id ffacd0b85a97d-3b5e44ea087mr5959471f8f.20.1752157467382;
        Thu, 10 Jul 2025 07:24:27 -0700 (PDT)
Message-ID: <94bdf8e4-188b-4d04-a52c-0f598d311d46@suse.com>
Date: Thu, 10 Jul 2025 16:24:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: replace custom handling for SHLD/SHRD
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

Use an existing macro instead of open-coding the operation and flags
handling, just like we already do in x86_emul_rmw(). While possibly
yielding slightly larger compiled code, it's easier to maintain this
way.

Note that the setting of dst.orig_val was already redundant with that
done ahead of the main switch() (where DST_MEM is handled), the latest
as of 4e59f578cb75 ("x86emul: simplify SHLD/SHRD handling").

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -5108,7 +5108,7 @@ x86_emulate(
     case X86EMUL_OPC(0x0f, 0xa5): /* shld %%cl,r,r/m */
     case X86EMUL_OPC(0x0f, 0xac): /* shrd imm8,r,r/m */
     case X86EMUL_OPC(0x0f, 0xad): /* shrd %%cl,r,r/m */ {
-        uint8_t shift, width = dst.bytes << 3;
+        uint8_t shift;
 
         generate_exception_if(lock_prefix, X86_EXC_UD);
 
@@ -5125,28 +5125,13 @@ x86_emulate(
         {
             ea.orig_val = shift;
             state->rmw = b & 8 ? rmw_shrd : rmw_shld;
-            break;
         }
-
-        if ( (shift &= width - 1) == 0 )
-            break;
-        dst.orig_val = dst.val;
-        dst.val = (b & 8) ?
-                  /* shrd */
-                  ((dst.orig_val >> shift) |
-                   truncate_word(src.val << (width - shift), dst.bytes)) :
-                  /* shld */
-                  (truncate_word(dst.orig_val << shift, dst.bytes) |
-                   (src.val >> (width - shift)));
-        _regs.eflags &= ~(X86_EFLAGS_OF | X86_EFLAGS_SF | X86_EFLAGS_ZF |
-                          X86_EFLAGS_PF | X86_EFLAGS_CF);
-        if ( (dst.orig_val >> ((b & 8) ? (shift - 1) : (width - shift))) & 1 )
-            _regs.eflags |= X86_EFLAGS_CF;
-        if ( ((dst.val ^ dst.orig_val) >> (width - 1)) & 1 )
-            _regs.eflags |= X86_EFLAGS_OF;
-        _regs.eflags |= ((dst.val >> (width - 1)) & 1) ? X86_EFLAGS_SF : 0;
-        _regs.eflags |= (dst.val == 0) ? X86_EFLAGS_ZF : 0;
-        _regs.eflags |= even_parity(dst.val) ? X86_EFLAGS_PF : 0;
+        else if ( b & 8 )
+            _emulate_2op_SrcV_nobyte("shrd", src.val, &dst.val, dst.bytes,
+                                     _regs.eflags, "c" (shift));
+        else
+            _emulate_2op_SrcV_nobyte("shld", src.val, &dst.val, dst.bytes,
+                                     _regs.eflags, "c" (shift));
         break;
     }
 

