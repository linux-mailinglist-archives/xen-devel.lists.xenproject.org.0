Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id znwRBGwRMWpwbAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 11:03:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 600CC68D5D5
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 11:03:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=btlMAXWb;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338846.1599913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZPhh-00028F-1q; Tue, 16 Jun 2026 09:03:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338846.1599913; Tue, 16 Jun 2026 09:03:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZPhg-00026k-U4; Tue, 16 Jun 2026 09:03:28 +0000
Received: by outflank-mailman (input) for mailman id 1338846;
 Tue, 16 Jun 2026 09:03:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZPhe-00026b-OH
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 09:03:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZPhe-009KpH-50
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 11:03:26 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a311155-2eae-0a2a0a5409dd-0a2a4502defc-46
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 11:03:25 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a31115d-af86-0a2a45020019-d155dd36ad45-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 11:03:25 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-45fd45e596cso2403789f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 02:03:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4619b9b7750sm14807493f8f.6.2026.06.16.02.03.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 02:03:24 -0700 (PDT)
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
        d=suse.com; s=google; t=1781600605; x=1782205405; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Dga1/oyfPqrdOGX1Yrc05VbMApsKHkKaZphLkonwUHo=;
        b=btlMAXWbl6LoCkfw9vbx4ER5AFrsec2liHhD7z+7BbvPk9AMYGbFqFksg8EJb4XBre
         ZA4ATa8z5ODkL04mqQV9aswBaEYxD+lV84N9opLeZ5i1E0vnp+N3biNFoAOS/ccxGUEM
         Y6sblVfKjO9qWVHdlIMotBDOzgdCwNaI8qorPjrAOvcehDXQslC5sJa7kTFdh3IJVYjO
         WIYCFWompVTTwwWC5Rr02ZbAL2BiCqtS/7FVBegI7aGo1cTy3f+mvRzhv1tUye3CshsU
         VX4Gp5WUJJsy1tzfLKLN8VpzGmEyV9P8rwY2gGbR6IRs3cLy2RLA7vT4zV7cflB7wLEe
         CjGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781600605; x=1782205405;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dga1/oyfPqrdOGX1Yrc05VbMApsKHkKaZphLkonwUHo=;
        b=ie2KcYBos7ckbI9wPgIzLXWVZBj9ixydLWDPORPMMx1GugeAwTvoAbm9/k6zSUB+Ha
         0OC68kbxJ/6pkIK98vJh8ZQK9JEWCIzE1ybkZbFDj/u8ze0qGKUdK4po7mYWHNwbR/BS
         xX/dPZpSx2g2D9X4CzAbUdocsf9Yf6/7ReXcJSZkcnuTsLfzWzKQ5U6yBI6URjqd8unx
         7bAhczNQ2fHoD0qbBsGia29Qj77vhmM5r8lYzT0ZGSHgUxpTvuWbHg5bewXDb1OCaAvq
         CPC0aBkGCbnYDEuQOgsAyXGf7eIuuVlD6g2/b5vyHahot7Yg+rzszd8Z2p83mn28gOhC
         yGNg==
X-Gm-Message-State: AOJu0YwGuCc2xPNJ88chthr84QkoQYrRDHGcFXLNFWXfrubGmnTusWTV
	UN/NTSHIudUxbQ8yo7S0vrWFtuQB+yEBXp0No4JtPeRjAfOsvRCvK38bwbA5wnWETZaihFQWic+
	P9Dg=
X-Gm-Gg: Acq92OGRoIv07SCytCnDZEzfkt3TQqH7wAvhiwuRMYxVsBqngi3piCLl7EC0wEvIvmw
	Ze6Hiw58CHD4inWjdKlvABv36SMMOGEDdFM6aijZRTiTizIZeDE+VTLUf50FuZFlNi2jYGJd4q5
	nJfYh7GfYNuGuVqH8Lo64M5Kn9iLTXdeDpyaEojMDzCzjBi4g/pb+Ta6T4+CfB02ScWko0PkrQj
	1mNv4kQhOV345EmJ0FSxLWcqB3jBuYeC4H7SFHmewi28jgQazru28w3r4R80/RL7UCRhNgvbYiC
	0kUorfWjlAzIgS/UaU4jMlYvqXISdrg7Xa8t1FPdqctEA9zP8gHD5kQCIl6piieh2eMUvvy3tK9
	4+qtHtB6sBGDgo0//JY7PaWnDL8pYpy5Ll24PvFj8gzkpQaIcdA4IUyl3sict5qr9NM++n8h0uT
	1so2cSzOJtHnIxoXPkKWSkdGT3bCZaVnmId3VWS1dsDk1pRca2IG1uvATUW2Xw4oOvCu7DHsP5g
	/g13Bxlsx0Gd3U=
X-Received: by 2002:a05:600c:34c3:b0:490:c2a2:e91e with SMTP id 5b1f17b1804b1-4922ffc0622mr43887735e9.34.1781600604754;
        Tue, 16 Jun 2026 02:03:24 -0700 (PDT)
Message-ID: <7e492b98-26d5-4d90-a703-ee25beae7e23@suse.com>
Date: Tue, 16 Jun 2026 11:03:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 4/4] lib: make safe_copy_string_from_guest() validate input
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Daniel Smith <dpsmith@apertussolutions.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
X-purgate-ID: tlsNG-720697/1781600605-80145161-240C44FE/0/0
X-purgate-type: clean
X-purgate-size: 3965
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FREEMAIL_CC(0.00)[citrix.com,xen.org,kernel.org,vates.tech,amd.com,apertussolutions.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 600CC68D5D5

... rather than papering over guest flaws: Strings passed ought to be nul-
terminated (yet sadly libxc hasn't been doing so thus far). This way we
also avoid order-1 allocations, seeing that all present callers pass
PAGE_SIZE for max_size.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I can't spot any caller side use of FLASK_DEVICETREE_LABEL, hence there's
no corresponding prereq patch.

--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -11,6 +11,8 @@ The format is based on [Keep a Changelog
    to obtain an automatically allocated domid.  The prior sentinel values (0
    since the start of Xen, and DOMID_INVALID since Xen 4.21) now no longer
    represent a wildcard input.
+ - XEN_DOMCTL_DEV_DT's, FLASK_[GS]ETBOOL's, and FLASK_DEVICETREE_LABEL's input
+   string sizes need to include the nul terminator.
  - On x86:
    - Enable pf-fixup option by default for PVH dom0.
    - The libxenguest bzImage loader now uses the system liblz4 library.
--- a/xen/lib/guest-strcpy.c
+++ b/xen/lib/guest-strcpy.c
@@ -3,8 +3,8 @@
 #include <xen/err.h>
 
 /*
- * The function copies a string from the guest and adds a NUL to
- * make sure the string is correctly terminated.
+ * The function copies a string from the guest and checks there's a NUL
+ * terminating the string.
  */
 char *safe_copy_string_from_guest(XEN_GUEST_HANDLE(char) u_buf,
                                   size_t size, size_t max_size)
@@ -14,8 +14,7 @@ char *safe_copy_string_from_guest(XEN_GU
     if ( size > max_size )
         return ERR_PTR(-ENOBUFS);
 
-    /* Add an extra +1 to append \0 */
-    tmp = xmalloc_array(char, size + 1);
+    tmp = xmalloc_array(char, size);
     if ( !tmp )
         return ERR_PTR(-ENOMEM);
 
@@ -24,7 +23,12 @@ char *safe_copy_string_from_guest(XEN_GU
         xfree(tmp);
         return ERR_PTR(-EFAULT);
     }
-    tmp[size] = '\0';
+
+    if ( !memchr(tmp, 0, size) )
+    {
+        xfree(tmp);
+        return ERR_PTR(-EMSGSIZE);
+    }
 
     return tmp;
 }
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -574,7 +574,7 @@ struct xen_domctl_assign_device {
             uint32_t machine_sbdf;   /* machine PCI ID of assigned device */
         } pci;
         struct {
-            uint32_t size; /* Length of the path */
+            uint32_t size; /* Length of the path, including nul terminator */
             XEN_GUEST_HANDLE_64(char) path; /* Path to the device tree node */
 #ifdef __XEN__
             struct dt_device_node *dev; /* Resolved device node of the above */
--- a/xen/include/public/xsm/flask_op.h
+++ b/xen/include/public/xsm/flask_op.h
@@ -26,7 +26,8 @@ typedef struct xen_flask_setenforce xen_
 struct xen_flask_sid_context {
     /* IN/OUT: sid to convert to/from string */
     uint32_t sid;
-    /* IN: size of the context buffer
+    /*
+     * IN: size of the context buffer, including nul terminator
      * OUT: actual size of the output context string
      */
     uint32_t size;
@@ -86,8 +87,11 @@ struct xen_flask_boolean {
     uint8_t new_value;
     /* IN: commit new value instead of only setting pending [SET] */
     uint8_t commit;
-    /* IN: size of boolean name buffer [GET/SET]
-     * OUT: actual size of name [GET only] */
+    /*
+     * IN: size of boolean name buffer [GET/SET]; must cover nul terminator
+     *     if "name" (below) is an input
+     * OUT: actual size of name [GET only]
+     */
     uint32_t size;
     /* IN: if bool_id is -1, used to find boolean [GET/SET]
      * OUT: textual name of boolean [GET only]
@@ -150,7 +154,7 @@ typedef struct xen_flask_relabel xen_fla
 struct xen_flask_devicetree_label {
     /* IN */
     uint32_t sid;
-    uint32_t length;
+    uint32_t length; /* length of the path, including nul terminator */
     XEN_GUEST_HANDLE(char) path;
 };
 typedef struct xen_flask_devicetree_label xen_flask_devicetree_label_t;


