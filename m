Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id shMnIgURMWpVbAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 11:01:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6583268D5B1
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 11:01:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=Lyl8l4gO;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338833.1599895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZPg1-0000mE-DM; Tue, 16 Jun 2026 09:01:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338833.1599895; Tue, 16 Jun 2026 09:01:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZPg1-0000kP-9j; Tue, 16 Jun 2026 09:01:45 +0000
Received: by outflank-mailman (input) for mailman id 1338833;
 Tue, 16 Jun 2026 09:01:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZPg0-0000j8-3E
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 09:01:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZPfz-004tva-G3
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 11:01:43 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3110e6-bab6-0a2a0a5309dd-0a2a4503830c-38
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 11:01:43 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3110f7-672d-0a2a45030019-d1558031a5dc-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 11:01:43 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-490b3e03939so30648505e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 02:01:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26434dsm43025805f8f.1.2026.06.16.02.01.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 02:01:42 -0700 (PDT)
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
        d=suse.com; s=google; t=1781600503; x=1782205303; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+Ir8X1cHcnOxogTsg6S6E9OZXlvuN+lWcXDa5be49dE=;
        b=Lyl8l4gO41zxDLpe+GFN2claHMqUj6NJUQIRBMro6g4kTAMnJIhCCZT7toiaapa0Tg
         Qpjen9r2KbQGzzvHmn7XEtmMDmtIIly3Y+XIsh+DvRBa8qWsFbH5shAGFjAJFPtJM7Lz
         ckoZ9cNhMgB7PFTxNH0R3tGpWyf8dAeXWnjRc2x9fKuIzo4h4/VdfjBQfegF01U0e+eB
         34YnvMHvG2LcM2w/OKyEo0Wcbx5HYhBYe6WeF9cW+J/gzicQmPg6FsvSN6EPGUg78+d+
         Ncq/PhMsHNM10uMWuVYzmQ7LfMItZJHFau9biG2nmAwpjWhJ4oTDYGqJ43W6bjuVA6ue
         Ajnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781600503; x=1782205303;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Ir8X1cHcnOxogTsg6S6E9OZXlvuN+lWcXDa5be49dE=;
        b=sGCr4E4rwpKKtIvRcyFIPm811HyAdJ6V1E1Hx9c6PyKV4XckLHP439S58DJyBkIpti
         54ig1XMFuJGhDnUKkdYoX7ZqcVj65woJRAkkcRQhGohEpNfsnQ6aKiaUyqvCyDoJ0v5X
         wjWYJ/0OhhIiA+J650NzPR/aZoWqeJrY8rQ2BNEjSFYVmkprQ07z/4IV42iSmvuwpXps
         mFEisUIzT2IGoA5mCpDcg/lfA/2tkFxff98oEwbn8LZ2f9okP4ouWGf+gaJhdB4mZExC
         btpFyPREtr0l26u0IE7FAlYQd5B/Oik3YAVXykPfPR4wiUCBIbp+TedRr6vYQnAN0NH3
         uEmA==
X-Gm-Message-State: AOJu0YznuP1zFHjA7PZY4vkkV2NVYvEBdM6u6IEUVUM8i/v/PaFP2uXW
	v573o33qaoI8UlXo1qMVrTvGFHuXw044S3KrGswIr9tgo9mAJ7Qmvnq5ipLe7U0KS+0Srpmgsi3
	b8rs=
X-Gm-Gg: Acq92OEWbKgtZnsqBnrpB2dTduRiGgs4qCkGxYvDZFC+Cu9ZrbbSz8DSodt0EGwErca
	6x/gUy8dh49JLpzTIGCI68Fk38ND1AV8L51gAD6yu529elbFJ5mCZANYSM6GyADcBz1PKQ6epzB
	1j+H22MqCYFVqjEZ4rDdBlmnPCaDn8MKQh4pUjbWlQDqiDHK+gd6/LC4+1KhmIecWKpZnWFSblA
	yXjZq2ZItWUYKAmCiJlHqj/kfbEjDss/vDkdO0bhGh2wxVq9FeCbrYjF4PALIxtFEoTfqkxCtCI
	w1GvAaCu1U19geSrWyyNzl0+1vDYq0/UiyUg2iAUP/UVoPUrBe+tX7rZSwwfUbPT/udpRgX/c4Z
	QOJ/Pk8xvGIigxU5AEo5stMjL2E4Rm01TVj8gfqe9X/XuPa8TnPkBAJ6pKmouvzoTGLobtg3lQA
	xIi2I0JVzg8xpZqig4eHVOn09o6o+wbve65T1J9pMtRCdq0LnGn3INlK4kvWaiQR+s8h+EPP8eH
	f6VGsxJQC4Pgjg=
X-Received: by 2002:a05:600c:4a12:b0:490:bf3d:c7de with SMTP id 5b1f17b1804b1-4922faf9363mr27448125e9.10.1781600502479;
        Tue, 16 Jun 2026 02:01:42 -0700 (PDT)
Message-ID: <e2d95536-655d-4ce4-8170-e5be8f5baa99@suse.com>
Date: Tue, 16 Jun 2026 11:01:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/4] libxc: drop size parameter from xc_flask_context_to_sid()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Daniel Smith
 <dpsmith@apertussolutions.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
References: <5d242cad-d907-4321-8ac1-363c0f9b623d@suse.com>
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
In-Reply-To: <5d242cad-d907-4321-8ac1-363c0f9b623d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1781600503-42F62938-4E29E7BF/0/0
X-purgate-type: clean
X-purgate-size: 3553
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:jgross@suse.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6583268D5B1

Nul-terminated strings are passed in all cases, so the strlen() can very
well be invoked by the function itself. In preparation for a hypervisor
change also include the nul terminator in the size calculation.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Ideally libxl_flask_context_to_sid() would follow suit, but aiui doing so
would break its (stable) ABI.

Of course the casts in xc_flask_access() are suspicious.

--- a/tools/helpers/init-xenstore-domain.c
+++ b/tools/helpers/init-xenstore-domain.c
@@ -108,7 +108,7 @@ static int build(xc_interface *xch)
 
     if ( flask )
     {
-        rv = xc_flask_context_to_sid(xch, flask, strlen(flask), &config.ssidref);
+        rv = xc_flask_context_to_sid(xch, flask, &config.ssidref);
         if ( rv )
         {
             fprintf(stderr, "xc_flask_context_to_sid failed\n");
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2372,7 +2372,7 @@ long xc_sharing_used_frames(xc_interface
 /*** End sharing interface ***/
 
 int xc_flask_load(xc_interface *xc_handle, char *buf, uint32_t size);
-int xc_flask_context_to_sid(xc_interface *xc_handle, char *buf, uint32_t size, uint32_t *sid);
+int xc_flask_context_to_sid(xc_interface *xc_handle, char *buf, uint32_t *sid);
 int xc_flask_sid_to_context(xc_interface *xc_handle, int sid, char *buf, uint32_t size);
 int xc_flask_getenforce(xc_interface *xc_handle);
 int xc_flask_setenforce(xc_interface *xc_handle, int mode);
--- a/tools/libs/ctrl/xc_flask.c
+++ b/tools/libs/ctrl/xc_flask.c
@@ -83,10 +83,11 @@ int xc_flask_load(xc_interface *xch, cha
     return err;
 }
 
-int xc_flask_context_to_sid(xc_interface *xch, char *buf, uint32_t size, uint32_t *sid)
+int xc_flask_context_to_sid(xc_interface *xch, char *buf, uint32_t *sid)
 {
     int err;
     struct xen_flask_op op = {};
+    size_t size = strlen(buf) + 1;
     DECLARE_HYPERCALL_BOUNCE(buf, size, XC_HYPERCALL_BUFFER_BOUNCE_IN);
 
     if ( xc_hypercall_bounce_pre(xch, buf) )
@@ -247,7 +248,7 @@ static int xc_flask_add(xc_interface *xc
     int err;
     struct xen_flask_op op = {};
 
-    err = xc_flask_context_to_sid(xch, scontext, strlen(scontext), &sid);
+    err = xc_flask_context_to_sid(xch, scontext, &sid);
     if ( err )
         return err;
 
@@ -323,10 +324,10 @@ int xc_flask_access(xc_interface *xch, c
     struct xen_flask_op op = {};
     int err;
 
-    err = xc_flask_context_to_sid(xch, (char*)scon, strlen(scon), &op.u.access.ssid);
+    err = xc_flask_context_to_sid(xch, (char*)scon, &op.u.access.ssid);
     if ( err )
         return err;
-    err = xc_flask_context_to_sid(xch, (char*)tcon, strlen(tcon), &op.u.access.tsid);
+    err = xc_flask_context_to_sid(xch, (char*)tcon, &op.u.access.tsid);
     if ( err )
         return err;
 
--- a/tools/libs/light/libxl_flask.c
+++ b/tools/libs/light/libxl_flask.c
@@ -21,7 +21,8 @@ int libxl_flask_context_to_sid(libxl_ctx
 {
     int rc;
 
-    rc = xc_flask_context_to_sid(ctx->xch, buf, len, ssidref);
+    assert(len == strlen(buf));
+    rc = xc_flask_context_to_sid(ctx->xch, buf, ssidref);
 
     return rc;
 }
--- a/tools/python/xen/lowlevel/xc/xc.c
+++ b/tools/python/xen/lowlevel/xc/xc.c
@@ -1754,7 +1754,7 @@ static PyObject *pyflask_context_to_sid(
         return PyErr_SetFromErrno(xc_error_obj);
     }
 
-    ret = xc_flask_context_to_sid(xc_handle, ctx, strlen(ctx), &sid);
+    ret = xc_flask_context_to_sid(xc_handle, ctx, &sid);
 
     xc_interface_close(xc_handle);
 


