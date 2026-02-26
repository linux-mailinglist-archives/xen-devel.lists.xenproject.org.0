Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPtNORoMoGnbfQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 10:02:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A9B1A30FE
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 10:02:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1241323.1542409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvXFn-0001H1-DB; Thu, 26 Feb 2026 09:01:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241323.1542409; Thu, 26 Feb 2026 09:01:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvXFn-0001ES-8s; Thu, 26 Feb 2026 09:01:51 +0000
Received: by outflank-mailman (input) for mailman id 1241323;
 Thu, 26 Feb 2026 09:01:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S+Ht=A6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vvXFm-0001EM-50
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 09:01:50 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7f5c472-12f1-11f1-9ccf-f158ae23cfc8;
 Thu, 26 Feb 2026 10:01:47 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4836d4c26d3so3937285e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Feb 2026 01:01:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd68826asm202289185e9.0.2026.02.26.01.01.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Feb 2026 01:01:46 -0800 (PST)
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
X-Inumbo-ID: c7f5c472-12f1-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772096507; x=1772701307; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vIsd0i+wjQKbVJ2Ph4V6pW75bmKywqwHk3mSnKxv6yQ=;
        b=ea46KkwBxeRafRfE9D4M5F2XtsjOXp8jRk8IWQgKls5o+lmHJxrh8qLUE33QxL7FIt
         CQMsnf6W33RdhSninXPYzeIZWea/Qg2MdMF3CSHIcJCTPN3eMMRiqxRJSEXCN1kV4dqr
         I1W3ZHrVkm+dNh8O1R51PjNT+8lCYGeUHDXXnyg8j/VizJZWOu1mWgap/vBWARv/kB+T
         68000pCGhq8kCoOR5/hnmmyleocxmE7RsER3CFVQq+U5/TxVtIXFBfFpi7oGGr7y9mQK
         QM06C1RBFum1ftuhwQ4DCExX1AlsqU2er3v5JmgckW1G9Yj9muAvlYKHmsFdS/Nf4ves
         NqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772096507; x=1772701307;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vIsd0i+wjQKbVJ2Ph4V6pW75bmKywqwHk3mSnKxv6yQ=;
        b=rCPko/sn+/7jv0KClaOl1AAnic8MbvjXGhavk1/gnPKKBZET5gj+yXUByXO/Xj6tu+
         MFKrO9p9RedbeqUcZTlp/NLGEHLtfG7nSdL2JjODfyJIzpEIyLvuBBlZO8z0dl9kUqmR
         ji8tIwNOs517M5j9cQzmPpZKZoZgGQcuIqSAA5RsDxdw5Tl0a1rrYnG+9xOZ27jvVWq+
         qTK1niA1/G5EDKRa7AapjkQID/CaZSnUzHxadBbtmW7Q5vEixR+JjgIxXYQQkJTBv0GS
         uZo/QDssZvx6mG0zNVO+vml2zR2U0Wv1siReXFingsStJX3w1ykn2Zc7kDrFsZwaq4/6
         RPTg==
X-Gm-Message-State: AOJu0YwojcU+faYLnBoqNY4b2amjSJiO1rF/ypF3EXmT/mGg94BbuwEN
	bKZFdSZB0lxAalhFoPSiUH/miw74lxdoZJKjLULr85Pn5dn8dtB09yAJWrNIpSsPZkoEvcr1SP3
	U46E=
X-Gm-Gg: ATEYQzymJUwdQSYRFzlccx48ohiL3XjUMhf0GU1V4/Y4clenI/MqmM0O9qjzuaH1MPS
	k6CYOeGXPi9IPZ5f3Va5h5rcMDga2JCUUngdjH3LvvK0Dzcq3vUgTbPNDt7kxe4mfALhr+iUhLw
	3/F/Jke8t3DHukgLfth62R8Sbq6tWI6nMvoGZTHQzEbqC7N5WVLZHutcwB7c77YaSFygPHLto7o
	EoKZm3BIj2t/OlUs31fxqAomfnEJFInPRmpwYG9pijrAvfCH6z4pWyeXiyR3OSVJXMgI2j94u75
	I11Lj64P1dzqESHBHbmdnt/Ii7w6jqUiX0zg5HTh3SKS4x/NAnNUCwT4AP+EJA8iH06lBo1nXgh
	JWYmMtlrv8+t4Y+vU1RvpR+l7YuEOTUWxtEiek2eqIDHaQtwQV9Dc+Zx2AyvXuX5vG11U0i1nJ2
	0wPFr+/nuWGdxA35xyBHM/HNU5/5GUtED8Mo14/qat7aoq4YYjaoMIhlRYAfPBTPBW+LXFTSsaG
	jxObzQsHzQOzi8=
X-Received: by 2002:a05:600c:470f:b0:46f:c55a:5a8d with SMTP id 5b1f17b1804b1-483a95a852cmr332100975e9.4.1772096507104;
        Thu, 26 Feb 2026 01:01:47 -0800 (PST)
Message-ID: <7af56fa6-4254-4704-9843-a0d099e6bb0b@suse.com>
Date: Thu, 26 Feb 2026 10:01:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] domain: use unsigned loop induction variable in
 complete_domain_destroy()
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[suse.com:query timed out];
	RCVD_COUNT_SEVEN(0.00)[8];
	ARC_NA(0.00)[];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:query timed out];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RSPAMD_EMAILBL_FAIL(0.00)[jbeulich.suse.com:query timed out];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 68A9B1A30FE
X-Rspamd-Action: no action

Using plain (signed) int variables as array indexes can be unhelpful on at
least x86, where the compiler may see the need to insert sign-extension
insns (strictly speaking it should be able to avoid that when the loop
continuation condition says >= 0, but that's not generally the case even
with gcc15).

Observed effects with gcc15 (will of course vary with compiler version and
level of optimization):
- on x86, one less preserved register in use, yet due to sub-optimal
  choice of register variables still a small code size increase (%r12
  isn't a good choice when it's used for base-without-index addressing, as
  it requires a SIB byte which other registers wouldn't require),
- on Arm64 code size decreases, albeit that's eaten up by padding which is
  being inserted ahead of a few labels,
- on Arm32 code size increases for a reason I didn't fully understand (my
  ability to read Arm assembly is still somewhat limited).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1475,7 +1475,7 @@ static void cf_check complete_domain_des
 {
     struct domain *d = container_of(head, struct domain, rcu);
     struct vcpu *v;
-    int i;
+    unsigned int i;
 
     /*
      * Flush all state for the vCPU previously having run on the current CPU.
@@ -1485,7 +1485,7 @@ static void cf_check complete_domain_des
      */
     sync_local_execstate();
 
-    for ( i = d->max_vcpus - 1; i >= 0; i-- )
+    for ( i = d->max_vcpus; i-- > 0; )
     {
         if ( (v = d->vcpu[i]) == NULL )
             continue;
@@ -1511,7 +1511,7 @@ static void cf_check complete_domain_des
     xfree(d->vm_event_share);
 #endif
 
-    for ( i = d->max_vcpus - 1; i >= 0; i-- )
+    for ( i = d->max_vcpus; i-- > 0; )
         if ( (v = d->vcpu[i]) != NULL )
             vcpu_destroy(v);
 

