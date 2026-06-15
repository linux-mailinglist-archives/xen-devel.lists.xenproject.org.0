Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j1UxDFgJMGr6MAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 16:16:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 942E9687054
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 16:16:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=Pm60VdkL;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338312.1599338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ87I-0004dL-Go; Mon, 15 Jun 2026 14:16:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338312.1599338; Mon, 15 Jun 2026 14:16:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ87I-0004aX-DG; Mon, 15 Jun 2026 14:16:44 +0000
Received: by outflank-mailman (input) for mailman id 1338312;
 Mon, 15 Jun 2026 14:16:43 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZ87H-0004aJ-Eb
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 14:16:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ87G-00Cp0v-RW
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 16:16:42 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a300937-bab6-0a2a0a5309dd-0a2a4506863c-44
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 16:16:42 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a30094a-7371-0a2a45060019-d1558033c923-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 16:16:42 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-490ac10e337so23624925e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 07:16:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492202edec6sm283417445e9.3.2026.06.15.07.16.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 07:16:41 -0700 (PDT)
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
        d=suse.com; s=google; t=1781533002; x=1782137802; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rXHv9yKRduSEsLK27njfQAEzXBihUPnOeQ8o3z6l2bw=;
        b=Pm60VdkLRrwhVQQVW5OWi3DeWCWKe6AAph688PJYiwUVZeqIcFgVHptXu2vgUK8S9g
         Ycv+DHwDfVs0utrrcuIxXy1xZDsZqMBXkaUR1LpRdEcpLsYNNAK8TShMmeuIGRr3UKWJ
         qG1+TzCVKHX3dHoNZzgxUqi7r60+xgcqczmW60sSPsdVh+rCJPH064fjXwBajyA111Fs
         Dvhv6LBCQt+l+gG7KPljNy2kUE4Ag1X2ElGzcG4Ysgovf+/qD3VDnZyQ5UdHneslj5KS
         RVXMIsc6YPKdW+fFt/Gwrcfk7tA8xqqJP8GB0G6dIez+/VPd7zEW+bH7lb3HGERf6Fzs
         q/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781533002; x=1782137802;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXHv9yKRduSEsLK27njfQAEzXBihUPnOeQ8o3z6l2bw=;
        b=r7K8x9GaqqsOz+I7+wHDAIEIzUoxMaODBdj7MLbIBOGw/sLO4rTohYtOMWyAxpO6v8
         311STMnsvV9YD0NDzZumOV4PIunUIDh97mBHD6mrnzGILxFcjQD7qWMd/JNZQ1S69bEN
         Di4u13FY33MnTxv1zMLODckde5JGqzY9wYl790jXk70zkYdkdZ9MbhTePw/JOLalPdzY
         0Cu3PjC/y6JN2qc7ZaWbYsSk550aiPYqZIIS3ugYy9mtsAj/OFAQDWUgaFcFI0PwwuOI
         CRrMWmchwF2UMSoTmlqEKf/1ADI3Cbr9YmJbmI+XLSCjaWm0FM2NFm16iMrUFl5rVJ94
         xWgg==
X-Gm-Message-State: AOJu0Yxy/liLDD2chR3ruAWlDb2qwW6ESVh0Y4ePzTnSdK2+kcTk1RCn
	Spzvkjc4cbCOFK/vwVjWE45K+BgN/wUlkD4IXLb7r4veUMXjKOARmNjzvGESnfC6lfq/NsT6DSU
	Uux4=
X-Gm-Gg: Acq92OECMGeHM8eghvAKsfL5gh2xiquPQhtOdB/ci1wIoQCPttmqIA/BhacsoUNfxH1
	CgQ94+7FGrlnMtlxupYuDdSOnq7PL9Bqj3GfwfI2xikOkj7oJC3Th2oieKfRr93Oj8ID/D/UB7p
	3yYibkLnnC/kNM8sn/W2+oXdji20FL0U8K149n2+jOG4Tt4dmP2y0da1DLKlulCA00bAzsnghzJ
	nQp/kkobvLQcvU4OcbNuZcXiDkqlU87jRleeathvZb+lNsKfpBKBegLaEgCEdaI6hZCPY1juyfR
	o6lUVGa+mU6XYxqsjPUxYTW3jHTu7if7/axUVW2/iA7IpO43rMgIB6VAW9kDrnXpIrdC4l9rdWQ
	x7yprGTsmNMxFaaLMEQFr5Ru7Fi7PxzuR8auJmzIzKNChnARMAcUsW0t0+gf7SqW+wA+vsP+ru+
	yS41Za6pzs3SuIjIKXUIb6541EWSATpFQUnvDLXtRjZRgrCCkgp0iUSVBW7p64ETCD7zlc+5NGZ
	ZB87XHSNRWL9nk=
X-Received: by 2002:a05:600c:314a:b0:490:4b89:5362 with SMTP id 5b1f17b1804b1-492200c0416mr129045525e9.24.1781533001867;
        Mon, 15 Jun 2026 07:16:41 -0700 (PDT)
Message-ID: <b0a50973-7a84-4e69-8241-d761e9b887dc@suse.com>
Date: Mon, 15 Jun 2026 16:16:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH for-4.22? 9/9] x86/HVM: more checking for
 XEN_DOMCTL_ioport_mapping
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <e2f2cd28-a8f9-4455-8a3b-f55f8c08e1dd@suse.com>
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
In-Reply-To: <e2f2cd28-a8f9-4455-8a3b-f55f8c08e1dd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1781533002-86168D75-F4DB4F5E/0/0
X-purgate-type: clean
X-purgate-size: 2286
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 942E9687054

When adding ranges, only alter existing ones when there is an exact match.
Don't accept ranges overlapping existing ones.

When removing ranges, only remove a range if there's an exact match.
Return an error when the range isn't found, and also don't call
ioports_deny_access() in that case.

Fixes: 192c4dabc344 ("domctl and p2m changes for PCI passthru")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Should "exact match" perhaps also include the guest port number? I'm
uncertain here as that kind of conflicts with "add" being treated as
"change" when the host port (and now count) match.

--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -731,14 +731,21 @@ long arch_do_domctl(
 
             write_lock(&hvm->g2m_ioport_lock);
             list_for_each_entry(g2m_ioport, &hvm->g2m_ioport_list, list)
-                if (g2m_ioport->mport == fmp )
+            {
+                if ( g2m_ioport->mport == fmp && g2m_ioport->np == np )
                 {
                     g2m_ioport->gport = fgp;
-                    g2m_ioport->np = np;
                     found = 1;
                     break;
                 }
-            if ( !found )
+                if ( fmp + np >= g2m_ioport->mport &&
+                     g2m_ioport->mport + g2m_ioport->np >= fmp )
+                {
+                    ret = -EBUSY;
+                    break;
+                }
+            }
+            if ( !found && !ret )
             {
                 g2m_ioport = xmalloc(struct g2m_ioport);
                 if ( !g2m_ioport )
@@ -759,12 +766,14 @@ long arch_do_domctl(
                    "ioport_map:remove: dom%d gport=%x mport=%x nr=%x\n",
                    d->domain_id, fgp, fmp, np);
 
+            ret = -ENOENT;
             write_lock(&hvm->g2m_ioport_lock);
             list_for_each_entry(g2m_ioport, &hvm->g2m_ioport_list, list)
-                if ( g2m_ioport->mport == fmp )
+                if ( g2m_ioport->mport == fmp && g2m_ioport->np == np )
                 {
                     list_del(&g2m_ioport->list);
                     xfree(g2m_ioport);
+                    ret = 0;
                     break;
                 }
             write_unlock(&hvm->g2m_ioport_lock);


