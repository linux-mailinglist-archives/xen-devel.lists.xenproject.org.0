Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAIBG3I9A2oq2AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 16:47:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB930522DD1
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 16:47:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306832.1578588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMoNG-0005Mt-HZ; Tue, 12 May 2026 14:46:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306832.1578588; Tue, 12 May 2026 14:46:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMoNG-0005LD-Ev; Tue, 12 May 2026 14:46:18 +0000
Received: by outflank-mailman (input) for mailman id 1306832;
 Tue, 12 May 2026 14:46:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wMoNE-0005L7-OV
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 14:46:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMoNE-00AHY7-55
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 16:46:16 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a033d2d-5cb7-0a2a0a5109dd-0a2a4503d1c6-30
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 16:46:16 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a033d37-672d-0a2a45030019-d155802ad525-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 16:46:15 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-488ba840146so50706295e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 07:46:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4548ec6b071sm32678652f8f.14.2026.05.12.07.46.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2026 07:46:14 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Autocrypt:Content-Language:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778597175; x=1779201975; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ef0Ej7/EwGOt8gsXR4m1PlHknpHJki/daNNQxhNXIi8=;
        b=AQKc++IRs2q9crTXDygnm2D1dpgGRl/Oi384E2RhQ4IdAKGIXlM244Idd2bZskNAS6
         pGQZUqeMwpsMD2lXHqf5F0QkEXLzpu50hEE8Qw4ssNLp15DpiVESMocQ+V7bAj5pAf0X
         Wd5bvbAP068wmHICtdty3Tj7+409Erq1L03ibIMOuOS+QnjX3LmBgY06uPSmL2na4SpV
         Bh5eQZiceLuekGmb7ABQck0QrQsMMVnHd9fKatQjqNqhQ5qDGRA40P3hvWTjryqzUKBY
         T09BzZhiyLAq32U7kCfZIGX51L0u4W2jl1cHJYTGQfUqSCyziziYWVOaSoz7pVGuJ4Eg
         KTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778597175; x=1779201975;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ef0Ej7/EwGOt8gsXR4m1PlHknpHJki/daNNQxhNXIi8=;
        b=I3QRh2WKXjHUXiNhZPTODZlNj66/sF9YnbNgtaqvHlH0rUE6INnHrWoCY+817R/a1h
         DaOymv8YLNo2rF8dTfXJMqYcpXwVWy34AN9UBxMzi7sKf6jBBstOdK5sd4AYTcHrUsSB
         YU/TTmu9yry3vQrX77Jn3Yg82kzI5ZV56N+Pt9Z+PnhcxEEDEl38bJ5cAVlOilB85ERH
         Hd/YVdujA3ZmW+q55I8aiSioiblHgbaRXgMWqV5dNFjQVsSl6Z6GuTMVblx+W1C8LoSC
         bBVoP03w9qz7QlYTRE6aTRUeYbMhqwuYxzx6shsjIdRR+PiNXp3RwOf1KIylKq4OX15m
         smeA==
X-Gm-Message-State: AOJu0Yx3clgRgI6MVXAxEw8he56IHVaQ8MtqTu7ScIyMaiXvlYcR6t9S
	Exifw47yitmG+xD+87hy+3T8O9wfCTq7P67t0f9kZhsxlO0OaOOkYQyRBmIu5OuPG4OmZNZCPI0
	tuQk=
X-Gm-Gg: Acq92OFTAULNj6mm46nOkEXTGnbS6ay6TUr5PfA+d0Mu9aTC3fEe3tFzqc+VuDrhOgT
	qynnHYweliwBCvZZP2oI1kCM1fzkoUaQLBOhiVvpvMqmGhU9Admjp8uLjNOnKB+Tpnn0whuYGl+
	8JFhtYwnRNYRJ8fbnjY+iBoutLGUEIZaD0lceBd9cEx6PV6TvrVYqAZgb7BiMATgDVdNuWSB+B6
	FD+N9d3UtZTHG9uXFMj1pmW4DL+TPa4HIR4H3xvaMEgaVtcvWoYMzUwM06yMKpQG2Tig4a5psHV
	aTpV4SaIjbRjenoVSm8YkPhJZLrK4KAk7+Dkp6AtoBtYWOP0+tGbAulPAVYkFZ+kT7BngTgNaAr
	EsWv/rS0Z0sulXPd6iVHcvF8LKsWIBHLjIM1rm4s5K+ktLCFJ5Eq91wBfNB69VzmYkWsl8ec8m3
	DN/+tNUAYK5pSDX5Vg4SAk0I0Jzax+gL6GRMTMXxGxIsPLWZzadvebCuQcmfz29xltdEiokSSUc
	GhmDI2Snsqyk2WgR9ty0+n7mA==
X-Received: by 2002:a05:6000:24c7:b0:44a:198a:5256 with SMTP id ffacd0b85a97d-45b138873e9mr4882549f8f.24.1778597175256;
        Tue, 12 May 2026 07:46:15 -0700 (PDT)
Message-ID: <6e3dbb4f-5849-4525-8f8b-a2818c39da2d@suse.com>
Date: Tue, 12 May 2026 16:46:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.22(?) v2] gnttab: simplify (really: drop)
 gnttab_set_frame_gfn()
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Rafal Wojtczuk <rafal.wojtczuk@7bulls.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Content-Language: en-US
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
X-purgate-ID: tlsNG-33051d/1778597175-42965938-03EF2E91/0/0
X-purgate-type: clean
X-purgate-size: 3269
X-Rspamd-Queue-Id: CB930522DD1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[xen.org,kernel.org,epam.com,arm.com,amd.com,citrix.com,vates.tech,7bulls.com,gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:sstabellini@kernel.org,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:rafal.wojtczuk@7bulls.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Action: no action

It's not really doing anything for valid GFNs, which renders its one use
site pretty pointless. The other isn't so much about setting anything, but
rather about clearing.

The main point here, however, is about Rafal spotting the double
fetching of the GFN (first in gnttab_unpopulate_status_frames(), then
again in gnttab_set_frame_gfn()). Re-purpose the macro parameter to pass
in the already fetched GFN, while dropping the no longer used parameters.

As the result is a mere wrapper around guest_physmap_remove_page(), drop
the hook altogether.

Suggested-by: Rafal Wojtczuk <rafal.wojtczuk@7bulls.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Drop hook altogether.

--- a/xen/arch/arm/include/asm/grant_table.h
+++ b/xen/arch/arm/include/asm/grant_table.h
@@ -50,13 +50,6 @@ int replace_grant_host_mapping(uint64_t
 #define gnttab_dom0_frames()                                             \
     min_t(unsigned int, opt_max_grant_frames, PFN_DOWN(_etext - _stext))
 
-#define gnttab_set_frame_gfn(gt, st, idx, gfn, mfn)                      \
-    (gfn_eq(gfn, INVALID_GFN)                                            \
-     ? guest_physmap_remove_page((gt)->domain,                           \
-                                 gnttab_get_frame_gfn(gt, st, idx),      \
-                                 mfn, 0)                                 \
-     : 0)
-
 #define gnttab_get_frame_gfn(gt, st, idx) ({                             \
    (st) ? gnttab_status_gfn(NULL, gt, idx)                               \
         : gnttab_shared_gfn(NULL, gt, idx);                              \
--- a/xen/arch/x86/include/asm/grant_table.h
+++ b/xen/arch/x86/include/asm/grant_table.h
@@ -32,12 +32,6 @@ static inline int replace_grant_host_map
     return replace_grant_pv_mapping(addr, frame, new_addr, flags);
 }
 
-#define gnttab_set_frame_gfn(gt, st, idx, gfn, mfn)                      \
-    (gfn_eq(gfn, INVALID_GFN)                                            \
-     ? guest_physmap_remove_page((gt)->domain,                           \
-                                 gnttab_get_frame_gfn(gt, st, idx),      \
-                                 mfn, 0)                                 \
-     : 0 /* Handled in add_to_physmap_one(). */)
 #define gnttab_get_frame_gfn(gt, st, idx) ({                             \
     mfn_t mfn_ = (st) ? gnttab_status_mfn(gt, idx)                       \
                       : gnttab_shared_mfn(gt, idx);                      \
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -1844,8 +1844,7 @@ gnttab_unpopulate_status_frames(struct d
         {
             int rc = gfn_eq(gfn, INVALID_GFN)
                      ? 0
-                     : gnttab_set_frame_gfn(gt, true, i, INVALID_GFN,
-                                            page_to_mfn(pg));
+                     : guest_physmap_remove_page(d, gfn, page_to_mfn(pg), 0);
 
             if ( rc )
             {
@@ -4285,8 +4284,6 @@ int gnttab_map_frame_begin(
          */
         if ( !get_page(pg, d) )
             rc = -EBUSY;
-        else if ( (rc = gnttab_set_frame_gfn(gt, status, idx, gfn, *mfn)) )
-            put_page(pg);
     }
 
     if ( rc )

