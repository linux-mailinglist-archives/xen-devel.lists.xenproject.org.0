Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8480A101D0
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 09:13:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871002.1282053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXc38-0007iM-Nq; Tue, 14 Jan 2025 08:13:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871002.1282053; Tue, 14 Jan 2025 08:13:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXc38-0007fx-Kk; Tue, 14 Jan 2025 08:13:22 +0000
Received: by outflank-mailman (input) for mailman id 871002;
 Tue, 14 Jan 2025 08:13:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Vp6=UG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tXc37-0007fh-KW
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 08:13:21 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69429ac2-d24f-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 09:13:18 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4364a37a1d7so53682745e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 00:13:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2df3610sm200368795e9.20.2025.01.14.00.13.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 00:13:17 -0800 (PST)
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
X-Inumbo-ID: 69429ac2-d24f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736842398; x=1737447198; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JwagmJ2ZAkkmElCxfguveqeewZ+CyIQy8EcKOsWL3NE=;
        b=HNujk0jOglArFy2A4YOmuqsmmRiArzA8vuaCnk5FWxyq/McNFzQSgqx2NBvEPRxYyc
         MxNneS0NGpIYIc/dbNU0xnJm55d82ZvG4B4Dmxlr8b/rWbuglzvxmprJZaULjdGlYmOp
         VOik0vWMv6ZbM5ctnTpYVVN5+nQ21/ewK2rC73vmvrYyTwp0S+6fgD9CvC2g4bU0RGcV
         2Bzhhd8mTc8LSdwH3b76X+0BFCWZ4JF2JyTESTzw7lLd4p5UrubEGiqDUOJdcmi1JQ26
         QhGz88My3BcqmiJZ4XG33z0M1fzEiqcvIHi4l5NuhgMrWL/RVm4i6LiSfLKfnaDgsj5I
         kmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736842398; x=1737447198;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JwagmJ2ZAkkmElCxfguveqeewZ+CyIQy8EcKOsWL3NE=;
        b=JuF6Ei72pY0JECZOeHMD6+4Rj/6wchvLTp/X84EoH44u+7j6Oj7VGGGWn+1ZNZjLwK
         FQcpVJPKAqic46NS+xlI/BnCWInWadQ2RH7g02TxeFBU4dzzcWKrDORfgrA3pAUJ+10B
         5njQthR8TUmevGisEaf7KHm4NwfDe6QjkwxA4Jls0hnYTCBVbGeLje4snAdgmvZ/PRPn
         +dXX9DPnq3+fWqSAnIUpsp15dVOucU/MGsYLqthYDQW3XiP292+YNnPvAIu6Gepeo9JT
         gjoJwz2SIihBO8rrQ5xkWTaAE+k3FeD8wJE8f4hOWdtkvIwK7D64ekh6Y64jsQcyU7Mc
         smow==
X-Gm-Message-State: AOJu0YyMn+EFeApZ7Lz1+tBjqOKGsV3Rw+uwHhwAV0/GNNopH1F9LA4G
	ldR59p6OtdCJ8fxBicSdaXMlVORQsxMoFZcyzdk3h0wzkRy8DKq/aRRamahjJOrRR6OoGX4rFM4
	=
X-Gm-Gg: ASbGnctzvXTaQn8Lo3qEbrVGmsTSCzlZHgSlzA+IDm1FLZGS+NaIw9OOf//K0ectfg3
	mF/C41w2rwIHp4KNTHImd6a6QUdwMW4biClV7yKHmqHwz2ft2hdjcKUTre3ibb0wXMFrLTIlDOr
	EO8W8rsVWScfmgdD7yMri00zmi/c5Yg+qcSOWuHNDgA4FbqGr/seSL3klcyXtA4XKv3IkwNh1WG
	2fDJT0/YVeRlkNPP37VjI0VvkS8IBFOYJdn/ZqyjlAeyWprul3siBYwEz0CQca70F/Gi3zKkcuH
	rjSF+rYl7DwSZeX/hGzvh0vAkeDw3TU4/I6KV73W+Q==
X-Google-Smtp-Source: AGHT+IErj72sXb3jhvigDRw0HX1z5VN7aJzdaxPDu0IH+dcPDkVSRWWElIo0FzUAyCkeMqWa4yRUJw==
X-Received: by 2002:a05:6000:402a:b0:38a:418e:1171 with SMTP id ffacd0b85a97d-38a8733063dmr19997415f8f.37.1736842397840;
        Tue, 14 Jan 2025 00:13:17 -0800 (PST)
Message-ID: <73a01ddf-6090-4fda-a8c0-5703e7c9e81b@suse.com>
Date: Tue, 14 Jan 2025 09:13:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xl: properly dispose of vTPM struct instance
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
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

The backend_domname field requires separate freeing; make sure to call
libxl_device_vtpm_dispose() also on respective error paths.

Coverity-ID: 1638719
Fixes: dde22055ac3a ("libxl: add vtpm support")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/xl/xl_vtpm.c
+++ b/tools/xl/xl_vtpm.c
@@ -44,12 +44,14 @@ int main_vtpmattach(int argc, char **arg
         if (MATCH_OPTION("uuid", *argv, oparg)) {
             if(libxl_uuid_from_string(&(vtpm.uuid), oparg)) {
                 fprintf(stderr, "Invalid uuid specified (%s)\n", oparg);
+                libxl_device_vtpm_dispose(&vtpm);
                 return 1;
             }
         } else if (MATCH_OPTION("backend", *argv, oparg)) {
             replace_string(&vtpm.backend_domname, oparg);
         } else {
             fprintf(stderr, "unrecognized argument `%s'\n", *argv);
+            libxl_device_vtpm_dispose(&vtpm);
             return 1;
         }
     }
@@ -65,6 +67,7 @@ int main_vtpmattach(int argc, char **arg
 
     if (libxl_device_vtpm_add(ctx, domid, &vtpm, 0)) {
         fprintf(stderr, "libxl_device_vtpm_add failed.\n");
+        libxl_device_vtpm_dispose(&vtpm);
         return 1;
     }
     libxl_device_vtpm_dispose(&vtpm);

