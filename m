Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PoYVKxX1MGoSZgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 09:02:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 096E268CB2F
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 09:02:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=Kv+pyeXh;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338696.1599733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZNoa-0005cT-1b; Tue, 16 Jun 2026 07:02:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338696.1599733; Tue, 16 Jun 2026 07:02:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZNoZ-0005Zg-Uh; Tue, 16 Jun 2026 07:02:27 +0000
Received: by outflank-mailman (input) for mailman id 1338696;
 Tue, 16 Jun 2026 07:02:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZNoY-0005Za-Sz
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 07:02:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZNoX-004QxI-1i
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 09:02:25 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a30f4f9-5cb7-0a2a0a5109dd-0a2a45098de0-16
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 09:02:24 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a30f500-2497-0a2a45090019-d155802ae440-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 09:02:24 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-49230a567a9so1613475e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 00:02:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49230a8ec56sm32172025e9.9.2026.06.16.00.02.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 00:02:23 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781593344; x=1782198144; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bgyRZYATOgcCc1f1nXN5l+8GA+GHT5k21gBFZWEcl0Y=;
        b=Kv+pyeXhecS/kZVF91oZ8gkWR7fNWzPBeCd632Ui3uyRqOQrOq2I8QXDGEdfN+MGkj
         k6KhGN4qDYaoQxYKxpEQMXYvnujqwibqqka4xA9X6xQUUOo0MiHFH91WPrDxBoC4iBzs
         q6yN/PUHTaU9edqmukGPMTnsYULaoka79cDzKYZyWUSGgD7b5tQqCdUHX8QKhfnyuKBb
         H04DTX8u+/ceDts0phKz/FW8q5B8nkSc7rVWz1z6yKt30OJWQ/Mvin88Te9md3O2bxAX
         ucRA676kBZIjIjoglFCWmFQOpbCEFFrTKEca5dYih+CdiIqtEmLqXQu0zRCEmrIHk18R
         RtBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781593344; x=1782198144;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bgyRZYATOgcCc1f1nXN5l+8GA+GHT5k21gBFZWEcl0Y=;
        b=n8P9klMM3SuN7QjI5wONuz3+X2DGiyUDioZ6heY5GoXDRa6IFm08qyUgaHa4jkqfXv
         WU9Vk1otlEif79hIc244x2gQ5FtKTOEG8N2zvjKtjsZYxH3/+SkdFLiKtDFKF164xsGH
         QKv5vHWRQ4b7AWIxFJHPf6jYKdss6lDrwCIellVOjrJaX7fKFmJV74ZGq3Ll8aV8QMth
         nq+SCUzkHVfWr2W8XWzKHvcQoRUKILOMwcoM7423/axkMrdBpVKKI7uGmJmxrs7oF/kb
         DPbRKeGF6O6Td4BQ4WsiHWcsa+MZyWAJm5w5ZXr3j8mcJEW2aRGiEmkiE3oxbdUXhaYz
         BsvA==
X-Gm-Message-State: AOJu0YwUybsUM7SzGE96A/SrboEeypBoekY6LurUzgzgWLjY6qXoWiue
	23OrPAx2MqOYZuvbcBl0RhaECOQGzvWuAxJd7soo4xHeCBlC6uxeOgtcFGl4PrTuiKj8c9yT/ux
	13xA=
X-Gm-Gg: Acq92OF+4AT8IZo04znifnS82jdof5CQH7M5hgyqr9/LtuJN3YCAXoZDVspq75mvwDw
	qyQn/KmD8EntfG7bUkoPQrQXiUuSd55OAGSPa/anRtYHMOVCDalCO6tOkKZrrD3zy/YIXkzFBjB
	OAFzL36QLzewJyTalu7EsaqN5f533GNeZ68SGZ2fp4Q2mo9gSqYn1sZP30IulpI3zGcQng4o2gG
	V0L0/uxwVDqhpUJFV551oYxnlnw4+GXdAQmtFTjB0Qvq4KlqItZUYPPM+fkh4tt/wFxMQcDgtDJ
	zXM/xG550y8NDvsInl5CoptOabj3Gfsj4EP4YizouTBtRk6aFbP8BHQK8Rn4aayguyKaRlyvaPz
	05JZlCUSqZl2YJHSGkJkPCZC47TYOFaFvryTFuwZbixBJrfmkQFIoTQgDjrkqufSw4+kNjAJOq6
	cBf10XucZYKusu7MyDjXJyTUF7jT0h+HefrTxb27lz0wvgTBFdm69riy5rXx3y8phT/EtC3rq8M
	5Ztua04emj5gDQ=
X-Received: by 2002:a05:600d:8496:10b0:492:3214:cbe6 with SMTP id 5b1f17b1804b1-4923214cd1emr1984885e9.23.1781593344040;
        Tue, 16 Jun 2026 00:02:24 -0700 (PDT)
Message-ID: <d0702419-2cec-45fe-86b4-470cf4d55b5e@suse.com>
Date: Tue, 16 Jun 2026 09:02:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.22] gnttab: drop dead local variable from
 gnttab_map_frame_begin()
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
X-purgate-ID: tlsNG-bad1c0/1781593344-3777AA53-5C9C681F/0/0
X-purgate-type: clean
X-purgate-size: 950
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,amd.com:email];
	FREEMAIL_CC(0.00)[citrix.com,xen.org,kernel.org,vates.tech,amd.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 096E268CB2F

As Michal had indicated in review, status is now a variable that is set
but never read. I made the resulting change locally, but then committed a
stale version of the patch (also omitting Michal's R-b).

Amends: eff88c4d3543 ("gnttab: simplify (really: drop) gnttab_set_frame_gfn()")
Reported-by: Michal Orzel <michal.orzel@amd.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -4255,7 +4255,6 @@ int gnttab_map_frame_begin(
 {
     int rc = 0;
     struct grant_table *gt = d->grant_table;
-    bool status = false;
 
     if ( gfn_eq(gfn, INVALID_GFN) )
     {
@@ -4268,8 +4267,6 @@ int gnttab_map_frame_begin(
     if ( evaluate_nospec(gt->gt_version == 2) && (idx & XENMAPIDX_grant_table_status) )
     {
         idx &= ~XENMAPIDX_grant_table_status;
-        status = true;
-
         rc = gnttab_get_status_frame_mfn(d, idx, mfn);
     }
     else

