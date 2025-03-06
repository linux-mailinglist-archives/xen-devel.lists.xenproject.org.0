Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A220A54937
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 12:25:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903414.1311317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq9Lw-0007p7-Ki; Thu, 06 Mar 2025 11:25:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903414.1311317; Thu, 06 Mar 2025 11:25:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq9Lw-0007mn-I4; Thu, 06 Mar 2025 11:25:24 +0000
Received: by outflank-mailman (input) for mailman id 903414;
 Thu, 06 Mar 2025 11:25:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qAxi=VZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tq9Lv-0007mh-HO
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 11:25:23 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0ac8636-fa7d-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 12:25:21 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43bc4b1603fso3242125e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 03:25:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c1037bfsm1753129f8f.96.2025.03.06.03.25.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 03:25:20 -0800 (PST)
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
X-Inumbo-ID: b0ac8636-fa7d-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741260321; x=1741865121; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0i1AVq3SFWy6g02i/aw2Xp3pHuLEmtNFaXJSflJCW5g=;
        b=MrAKRH4c5/3QxT8sHbVpOKjdXEChaFT4eeUDSyLnZTJ86ieBHHCA25gvAVLnr19Gl0
         7eBROSbkjtySqQPKw164+s7W+QF83bB4OKP9L6DYan5h243KgMabLJlgNiF7pRkJnaDR
         33nnDpX341bJeOAY+7To/OC/QoOcPcT12rugwmLjtSZNDZgmO/MxPOugfK8RJ5t3EQD1
         epLNiFRJE3wXegit1gAyervmUrPtIDAUaUdYIr74YlyixpG6GKSeutv+aRDJVAoWMjR4
         lJzr/CAP6xauK23JHMXLEfUlW2t8bkmZAMSGRfaK4ZVvDB6wBJIYEEJDODL2uB9H6E38
         TCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741260321; x=1741865121;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0i1AVq3SFWy6g02i/aw2Xp3pHuLEmtNFaXJSflJCW5g=;
        b=aeOgQ23z+/ogRTe2qgfwMJQsdJJyw9dPjDDeIVWqseqxBTQDwhf1gW0VzTduFgKFPM
         pQShHm7CHE+OMgs9ZXIXGxLt7iGaRT4y8opJW8Y85jSueAyQMrM55drHrV+wut+GxaMI
         Ay/mbYMfTVdM3Y4zXvpfavijTP3uoLjSw94kiDq22ZtdbWxaD2kq0c6DjdfY2iZWIOSY
         ta4rL11fIGTnQo5I3CE2XmSjhTxlJE5iQQcnntKBJvwYP5xlUqnjA5ksErznypEnmjZS
         BnmaKl7bDc0XRkOtWtUZY89AJRer66619yLhvSFJS+S1jgyPMU7rp/G9zg2iAlFCPLPl
         cL9A==
X-Gm-Message-State: AOJu0Yz4pYbhHQOPKXq1clr/ul7yVObNDM8ECxUE4kcxPpXEfTlVNoJO
	OewzTDjBmMxOfufeHh2HJUSCSL82YOBLkUN/TY66wrqUJSYQl2rvt7yaF8hbY40WnEPEzEbImbE
	=
X-Gm-Gg: ASbGncvYALIK7Xm53raDlj8gsYFzlPZDVwhLER9cVWvoL8MzxWDddqqpWnz3rFLNKrh
	bfyWMGgKc3gPzn0NgtAWnHCc8/DRaklhZiXszIJGn0aJc51s2AXa3XybfRl9Z8u4YpgHqyvF6Lr
	OAc3BIt8IwFeVibt3s5oRvBys0w3kFY0/fE1ZY5AV6yF6kWzP3d8eCk9M1Qj95Lg793IQqUtjO3
	CsXXdhP+L9IEuMFy031EiZC4cAegcsaS5Id2nGtdgeZ114AlzgHpSn4tsrzCjV8N1bmgBOo/Y2y
	iYOYQvhXLz7SBW9nhYY8w9Q3MgoZXtN4SaIzuFCPZNEmTOo0llM1U6iZEOcGl9jTgvzDRiMwpIP
	n2eJhIenETzajN0+0wU2LqBKeQNh5GA==
X-Google-Smtp-Source: AGHT+IEu6xzM328i4Is1EdiqaflQhddCSk9c5Grs5O2onRGWbuWmymmfND6uReg2qJfjqZ5oYWwVig==
X-Received: by 2002:a05:600c:4f87:b0:439:9d75:9e7d with SMTP id 5b1f17b1804b1-43bd29c4593mr44899675e9.22.1741260320780;
        Thu, 06 Mar 2025 03:25:20 -0800 (PST)
Message-ID: <0d3655d6-8551-486b-85ca-e64378231278@suse.com>
Date: Thu, 6 Mar 2025 12:25:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] libxl: avoid infinite loop in libxl__remove_directory()
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

Infinitely retrying the rmdir() invocation makes little sense. While the
original observation was the log filling the disk (due to repeated
"Directory not empty" errors, in turn occurring for unclear reasons),
the loop wants breaking even if there was no error message being logged
(much like is done in the similar loops in libxl__remove_file() and
libxl__remove_file_or_directory()).

Fixes: c4dcbee67e6d ("libxl: provide libxl__remove_file et al")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This is the simplest possible adjustment. Depending on why there were
retries, retrying a few times may make sense. But then, especially for
the specific error observed, presumably only after having tried to empty
the directory another time.

It's further questionable whether trying the rmdir() makes sense at all
when emptying the directory failed. After all failure of opendir() also
results in bailing from the function without trying to rmdir(). If this
makes sense, then I further think that "rc" would want resetting ahead
of this final loop in the function: If the rmdir() succeeds despite
earlier errors, all is (kind of) fine.

--- a/tools/libs/light/libxl_utils.c
+++ b/tools/libs/light/libxl_utils.c
@@ -577,6 +577,7 @@ int libxl__remove_directory(libxl__gc *g
         if (errno == EINTR) continue;
         LOGE(ERROR, "failed to remove emptied directory %s", dirpath);
         rc = ERROR_FAIL;
+        break;
     }
 
  out:

