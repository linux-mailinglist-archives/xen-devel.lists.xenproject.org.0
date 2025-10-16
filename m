Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1AEBE30B0
	for <lists+xen-devel@lfdr.de>; Thu, 16 Oct 2025 13:23:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144458.1477853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9M43-0004JC-VL; Thu, 16 Oct 2025 11:22:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144458.1477853; Thu, 16 Oct 2025 11:22:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9M43-0004Gt-SG; Thu, 16 Oct 2025 11:22:35 +0000
Received: by outflank-mailman (input) for mailman id 1144458;
 Thu, 16 Oct 2025 11:22:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CbFY=4Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v9M42-0004Gm-9Z
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 11:22:34 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 682fc8ab-aa82-11f0-9d15-b5c5bf9af7f9;
 Thu, 16 Oct 2025 13:22:32 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-46e42fa08e4so5573055e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Oct 2025 04:22:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42704141cdfsm850331f8f.4.2025.10.16.04.22.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 04:22:31 -0700 (PDT)
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
X-Inumbo-ID: 682fc8ab-aa82-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760613751; x=1761218551; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RLKloBFXheLu4im6IxeM27UC4SxM+8g/sFqkBBvRcDE=;
        b=bfnvEbxJIXE+1H8WrJOHJptm+9zVVj8D8/lVLSWb3CarR5p7SrMAIprQLgCPWCdm1h
         oFxrZWz7oGeaF3X71dFdprgMVx8SiYbyzyBymzhdnBrRKRsZWIFIzagyl/4o7dvid9Ya
         OhTotPcnwVX5aaq/1atdcQmlElWRZsA0bhw22aEmVzkJyl9IlAo70F1wn5U2HbLgv9/u
         N39yDJP8MozQM+0QlF6wKCwgTmMIfn9sELqXYrUbp7Y2wQNJbieYeJj1ECGqkE4TSs95
         TJq9UAufCRliuDwJvG2/Hk7P8Y3S3N1e8AGR7wfq5E9WnDSNvxCXpa5GPNdE3pLLaQrg
         Mglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760613751; x=1761218551;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RLKloBFXheLu4im6IxeM27UC4SxM+8g/sFqkBBvRcDE=;
        b=UfdMYF9P4Ad52IxZxIywM0dnmFQFSmSjy69CMzrb2JvLKW0+U9Rs0ZFsZyo1VhudZ1
         M4bOss14zrpU2TN1mJz7rFoX927h/zzZTP/VDTeZibNfWZwFaidEG8xma8q9iDXG6ewl
         Wc8vTM7gkVD5Dk/c39iVUgMUPFG5v9h0gDkexTBn/8jHZlXBECMnMadv05ypDP2feqm7
         QY71CgVKVD6jrPd5Rl4zCWYjIIQBIo4zT2FNoarUKnD+e3SkEb8jBZJ3fJdcNT1RsTyz
         u9eW87tczdDEEv3jo0yntHgVk2upWej/44rqHUN1qZFocGuaKG/uHyUZFUw41og1tG3i
         DNHg==
X-Gm-Message-State: AOJu0Yy4F5vf3Y/ySDvcvBzrXWmrRU6LRwcmwL+bzU1ifKXbiNjlbwID
	6fIgAjXQ9l4Mh2s1io3EivshNYM7R8oXJupyVwg7fkB5cmWRsM2B8RJAfMjZMsDZd6pEbgTien4
	E5Rk=
X-Gm-Gg: ASbGncumpY+yO0RzgCwf8e9t0wAz00GWJxPtpBxR37XufbLCFfRqg0LZjPtEUWDYInS
	D5CjVWxVXeu93HCCroxqe6vK9xa527Z1sjzPVirdi0pCKAlyBaCVl0YaYxP+fE7S3QwAjwkBZ2d
	J/0LzFOGZ6FQz4Jkp2Iy2QM2vCHuxlBqlVlhNMljbx8LFFXtvKN4EJRKNjzDY5074gjChb2PwfG
	c2PrHAgsKmiWCej8ESfn4uBZXVT8q9iGAxMugm7lCdT8ApqG83hVnztP64tZGUyoro0uoMcXUBQ
	RfrH8kc3TQM5U3zxqbmwlE5ylspbkT3B/nhm8vTIAdo9M2JG7CTgkI48/EB+MKp/iKP0qqxipA+
	u5APCcu2nAMi79Doz9Oim0ChH6dLJFRFOuRsIkfcOQZNTpPPMDfoR21HUX0KGHvVQZtYT/Sv7Hk
	ExusS/9zlf55Lclq8RZnrj69vxXazQ1TaWW21+yF+su+UgT4Tnx/pdpI5I13JcDk9VojoR8ys=
X-Google-Smtp-Source: AGHT+IHs7PKiy0vymqp5DUvFn8ypkdyBZYOI+gfKNtQvbbZiRi3NU57nE5a8fmF0EySoLh3EGQ8Twg==
X-Received: by 2002:a05:600c:c4a3:b0:45d:d8d6:7fcc with SMTP id 5b1f17b1804b1-46fa9b055e6mr212687215e9.27.1760613751350;
        Thu, 16 Oct 2025 04:22:31 -0700 (PDT)
Message-ID: <751bb140-3f00-47f1-9492-464c01ea1429@suse.com>
Date: Thu, 16 Oct 2025 13:22:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.21] libxl: make gentypes.py compatible with Python older
 than 3.9
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

removeprefix() was added only in 3.9. As long as the "jso_sub_" prefix is
always going to be there anyway, switch to a less specific but more
compatible construct.

Fixes: f6c6f2679d49 ("libxl: libxl__object_to_json() to json-c")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Sadly this is only the tip of the iceberg. Some minimum version of the
json-c library is apparently needed for the toolstack to build, but no
minimum version is being checked for.

--- a/tools/libs/light/gentypes.py
+++ b/tools/libs/light/gentypes.py
@@ -384,7 +384,7 @@ def libxl_C_type_gen_jso(ty, v, indent =
         s += "int rc;\n"
         sub_scope_object = "jso_sub_1"
     else:
-        sub_scope_object = "jso_sub_%d" % (1+int(scope_object.removeprefix("jso_sub_")))
+        sub_scope_object = "jso_sub_%d" % (1+int(scope_object[8:]))
 
     if isinstance(ty, idl.Array):
         if parent is None:

