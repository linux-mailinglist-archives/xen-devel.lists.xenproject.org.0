Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ADT3MTcRMWpnbAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 11:02:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BC668D5C6
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 11:02:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=BOXPYbZr;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338840.1599904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZPgk-0001OE-Lb; Tue, 16 Jun 2026 09:02:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338840.1599904; Tue, 16 Jun 2026 09:02:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZPgk-0001Mp-Hk; Tue, 16 Jun 2026 09:02:30 +0000
Received: by outflank-mailman (input) for mailman id 1338840;
 Tue, 16 Jun 2026 09:02:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZPgi-0001Ma-Ta
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 09:02:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZPgi-002z0G-AE
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 11:02:28 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a311118-bab6-0a2a0a5309dd-0a2a450bbc0e-48
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 11:02:28 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a311124-212f-0a2a450b0019-d1558032dda2-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 11:02:28 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-49222fb062bso32872445e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 02:02:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49230a45b30sm41084035e9.2.2026.06.16.02.02.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 02:02:27 -0700 (PDT)
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
        d=suse.com; s=google; t=1781600548; x=1782205348; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+O/5aLoJh/nqfou7kFqhsCjNAsFYq66chW2xynNKcIA=;
        b=BOXPYbZr0sbBrzg4gFtmFF8Wj7+I4EoJK4kf4Ykp/gO6994ieJIhKvvxMWdG1sIKE8
         0SnSW6cnHNiNlIG1IKAxIqIA1BjeuW1ZsJAEYjUP0DgvX3eQQG7lAlxJqsllsvWFggww
         t+hhzOSYWuyJk+Jv7DO41xqZg17D2ejJFV/FoJbza1KzmJ6PX/AjFtCElBkjPYlDY/Kv
         PfVbFdIkKjsMhbNKvUtpsK4K5WpGvlRKiiEClVxc+wr29s8NaqR7UOh8rDpRBKmOIWgD
         7yZCsIUR1CiHeoRm4lrTy4njYXiSE4eVRceLEKBwjXHq9pqnbJS+eoqagVF7nkMnSask
         UFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781600548; x=1782205348;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+O/5aLoJh/nqfou7kFqhsCjNAsFYq66chW2xynNKcIA=;
        b=ChtOl5s+m/dsoPo7PMKpSZQY2RuKWUlA15o9sKAoxSYQ2SxkRX+NeOrSKGgCsp49Tu
         E1r2XE2lyQhERIbqbSHCjnpWmbyhyakE0EF0cXll7EDU1W+Bs5ZX0V0ODdit22k2kv6y
         q4giSUavbpavMsNsKGZvlF92Pcq5gbnQIQCUgeBnt46RkaOfiIEUDcYCkl0p4U+GwerH
         Kfcy7GOMPjHryysSdalq94Ogvcs82uAWlG54LHtH+ZevmOX6BNbvjptfipB86zLGoHn0
         JHlQHYIHe/+0K/BgUHk7tQwcqxBe0Twv7KJdXYKKmfIFthfvsvZ5TVrLOoWfsWCmndlM
         lN+g==
X-Gm-Message-State: AOJu0YxRZOnT0xTKrEY35xXu+Z4II/a5w6O0aeeqLMF7rB6IDaztw5bO
	4kqoi4vipWs9RLbrFxMWLp12O+QQTRSQZ8tW0M+gcEe0fsiMvIvBnAkoLy0tB1IGED5HfiqrhVA
	RXKY=
X-Gm-Gg: Acq92OHCUxox8bjv71Oe8Yz/ZRed9LSXvZ0OAc6NA2RHIh77NPcjkYpoGmyVVcFCFD0
	+LfWFzofJVtB3BkH6Ef77Dp1egT34Z8apMqyuAQjG9Eeggu0h/3qDOnu0a3GSaZuCgDMqKJ99We
	lm1eLCuJ+d3r3vgTpT19ukeJr+oe4AAAjeDkEA3+dnFAV+FQ5JK63RHdB9Ed9b/o+3xIzAGnL4w
	C5NwmA/1h4yCtCo+ds9fjRzQOZU6UPDuo+6sEriUX6xXTuBFQbuxBgPyYskFc9BNRDJMD3abENV
	6PtV8pdgchEAxRuygeAT7RYDrLkzByjahKhEkaesmJ5sUPajARQ8Z3dEYaMENcTVshmiB3SNvwe
	zqhCcO6Bf9aB+BSzuR8RGBapxDSefh8Xjul6vG4JV5RDimzWbCev4vuagjWaIEYafBxcd/WdxbC
	+QidUmPgxEGEHeiKBeE+9GHKfDUil98ygqZuezu9AVJ01XouJlJl1PhRmWW/D/V6rybjv/Trts9
	LzC79azMukL2YM=
X-Received: by 2002:a05:600c:4e4e:b0:490:b28d:a6f9 with SMTP id 5b1f17b1804b1-4922ff72917mr38595785e9.8.1781600547537;
        Tue, 16 Jun 2026 02:02:27 -0700 (PDT)
Message-ID: <83af338a-3ef2-4be3-99f0-cfe38a09cda0@suse.com>
Date: Tue, 16 Jun 2026 11:02:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/4] libxc: adjust string size calculations in
 xc_flask_{getbool_byname,setbool}()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Daniel Smith <dpsmith@apertussolutions.com>
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
X-purgate-ID: tlsNG-42698a/1781600548-13F7EF3B-8FC96224/0/0
X-purgate-type: clean
X-purgate-size: 1718
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:jgross@suse.com,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	RSPAMD_URIBL_FAIL(0.00)[lists.xenproject.org:query timed out];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 70BC668D5C6

In preparation for a hypervisor change also include the nul terminator in
the size calculations. (Note that xc_flask_getbool_byid() doesn't support
FLASK_GETBOOL's "ID being -1" variant of operation, and hence doesn't need
fiddling with.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/libs/ctrl/xc_flask.c
+++ b/tools/libs/ctrl/xc_flask.c
@@ -187,7 +187,8 @@ int xc_flask_getbool_byname(xc_interface
 {
     int rv;
     struct xen_flask_op op = {};
-    DECLARE_HYPERCALL_BOUNCE(name, strlen(name), XC_HYPERCALL_BUFFER_BOUNCE_IN);
+    size_t size = strlen(name) + 1;
+    DECLARE_HYPERCALL_BOUNCE(name, size, XC_HYPERCALL_BUFFER_BOUNCE_IN);
 
     if ( xc_hypercall_bounce_pre(xch, name) )
     {
@@ -197,7 +198,7 @@ int xc_flask_getbool_byname(xc_interface
 
     op.cmd = FLASK_GETBOOL;
     op.u.boolean.bool_id = -1;
-    op.u.boolean.size = strlen(name);
+    op.u.boolean.size = size;
     set_xen_guest_handle(op.u.boolean.name, name);
 
     rv = xc_flask_op(xch, &op);
@@ -219,7 +220,8 @@ int xc_flask_setbool(xc_interface *xch,
 {
     int rv;
     struct xen_flask_op op = {};
-    DECLARE_HYPERCALL_BOUNCE(name, strlen(name), XC_HYPERCALL_BUFFER_BOUNCE_IN);
+    size_t size = strlen(name) + 1;
+    DECLARE_HYPERCALL_BOUNCE(name, size, XC_HYPERCALL_BUFFER_BOUNCE_IN);
 
     if ( xc_hypercall_bounce_pre(xch, name) )
     {
@@ -231,7 +233,7 @@ int xc_flask_setbool(xc_interface *xch,
     op.u.boolean.bool_id = -1;
     op.u.boolean.new_value = value;
     op.u.boolean.commit = 1;
-    op.u.boolean.size = strlen(name);
+    op.u.boolean.size = size;
     set_xen_guest_handle(op.u.boolean.name, name);
 
     rv = xc_flask_op(xch, &op);


