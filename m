Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDA8C242B7
	for <lists+xen-devel@lfdr.de>; Fri, 31 Oct 2025 10:32:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1154109.1484216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vElUK-0003AA-I2; Fri, 31 Oct 2025 09:32:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1154109.1484216; Fri, 31 Oct 2025 09:32:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vElUK-00037r-F8; Fri, 31 Oct 2025 09:32:04 +0000
Received: by outflank-mailman (input) for mailman id 1154109;
 Fri, 31 Oct 2025 09:32:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o9nX=5I=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vElUI-00037l-Iu
 for xen-devel@lists.xenproject.org; Fri, 31 Oct 2025 09:32:02 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74478c0c-b63c-11f0-9d16-b5c5bf9af7f9;
 Fri, 31 Oct 2025 10:32:01 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b5b823b4f3dso352905266b.3
 for <xen-devel@lists.xenproject.org>; Fri, 31 Oct 2025 02:32:01 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7077d05d42sm134803266b.73.2025.10.31.02.31.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Oct 2025 02:32:00 -0700 (PDT)
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
X-Inumbo-ID: 74478c0c-b63c-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761903121; x=1762507921; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jcwXRgSEkXn3WI94G3eMn530YnNOgBbc7EnCZyhUbZM=;
        b=X+Htn/w5P1b2uISZ5R/67SD8M8yDmVUk+T+XK1HGYkcwt+P4IyFbf7Up2lliyIcOoV
         X2HmEeXEM/fva53rHVi0GMFC3d2dTdOd2Oo2cce0QCEfHEPtRd5NFKgtst4yD4yfP2e3
         dRcsOag7BS7088GcVZabWLl50mrTAKJvI2/TcT7oraLpHREKpl06+jBhwjzncRMuVC27
         Fu3Ofy2NAVG7xwym9qvbZm7DLL6RpoRSe88e+y1rcfO1LJRdH52z97kL9yoLv4LbdaX2
         EFRO3VP/6dMoISnLgzyeV+7J9NVIzueG7N25t8ZtNY+MehTYgcmiSdquf4FIYdvyamtQ
         1uVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761903121; x=1762507921;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jcwXRgSEkXn3WI94G3eMn530YnNOgBbc7EnCZyhUbZM=;
        b=hKA4g9lmSLXZlOADBd7JVeqaDg4Wxh6SJxF7v6eTWdhp7Xe9IO7xXkpgcMCLg9X367
         QpUsBNu69aJr88HJu7yLCMuY0f+f58XYbkjIt0bDmoug0i39zELxZSlWF2e2O2/lfiWu
         rYH1v2TcK/lUS0iDtUQLtL2MbCfUCzJvRwD+RQy5O0ySZp/8KmGVKDWi1We4INd8Q4ZI
         bK0oEF/pCNV37bXomM4ZIwdvdq6eY9sVgVsKGhx7xESCzb4pZS8p9ekwZ1g69XpUOztH
         mRFGSbqfULm8j9GQzX+z02Lo8ywL5BzhjOJ3hDuOkiKX92NUH1XS8myoch3QEqE0fHVr
         yuSw==
X-Forwarded-Encrypted: i=1; AJvYcCXITnhLZvwttkWPHUb3KivLZ5AZUuB+sOmFBngAoebboPKpHes9+HrJ9s18SnX3Ueexw5BtD3hOc9k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQc9uFbfiO5p1V/vq6dm5eoqPy7h3uvlQdnShw5rXbkptxDWHW
	KImKREOIdXrdPjha9PhPC0Yp0V5bVX0iF1O4yy7HmH5v1Wsg8GO0tfDeft3UXQ==
X-Gm-Gg: ASbGnctlk1MDPiNXfp+nydyXP/ft3bR17yS5bYDNrJNK7L1X80IYZ2VliNIlRnAlGQs
	pKbAs8BtkvHW3bhch0MrRjIUYM1ZvB+ZfvtoIY5k8wabSxFbxfvBjEPvKGRpiCbIgJIJ5RLBFQ9
	9hgYtE0Ne9KRUWKKFG/05xYvBSmaUeXc1qqhwxJKSvPD5Q6996w/JxzwlXmA+WKFYcTijN3SesC
	3zdLLef7PCFaW7Id9sRLdDIGT8Pk9F01qfwXyQY2kaVJPE0C8ne197Yu3puGpww9dEmYdosdCex
	woKQg+lvUjAyknB8etEnbp2RWjtNTX/YGvrt2OJThdjjg996ZpQbgcSGmi50mvuYyd5bh+Au/tc
	ICRRR+DVZVhRwT6Vt6JpmXQmWYQADxcL0fMkzhNbsSSxrIvTnYJoQ0Y3wBklEd6MvO2BUtkZvR1
	crTn4D0AvWE6SDNZDzuuqzWYUrn86ZcG2uSgyUcU2CJk42vw+8hCEM19uSSLh8
X-Google-Smtp-Source: AGHT+IFzO3m9E/O5R4at62hn7ZgdJTOj1ZMlMomg5EznKnQQbhfE6o/0cnY59uckn1Pu91ZEO40c6g==
X-Received: by 2002:a17:907:3da0:b0:b3d:9c3c:9ab6 with SMTP id a640c23a62f3a-b70701c6653mr296364066b.29.1761903120583;
        Fri, 31 Oct 2025 02:32:00 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------MIqlxIefaXBd2jD9aVfW0jtD"
Message-ID: <abf30e99-47be-48c9-b826-18d142453dcf@gmail.com>
Date: Fri, 31 Oct 2025 10:31:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.21 0/2] x86/AMD: deal with RDSEED issues
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <272093dc-c97c-434a-9977-ad1c26e7e229@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <272093dc-c97c-434a-9977-ad1c26e7e229@suse.com>

This is a multi-part message in MIME format.
--------------MIqlxIefaXBd2jD9aVfW0jtD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/28/25 4:32 PM, Jan Beulich wrote:
> Both patches also want 'x86/CPU: extend is_forced_cpu_cap()'s "reach"' in
> place.
>
> 1: disable RDSEED on Fam17 model 47 stepping 0
> 2: disable RDSEED on most of Zen5

Both patches LGTM to be in 4.21:
   Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

--------------MIqlxIefaXBd2jD9aVfW0jtD
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <div class="moz-cite-prefix">On 10/28/25 4:32 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:272093dc-c97c-434a-9977-ad1c26e7e229@suse.com">
      <pre wrap="" class="moz-quote-pre">Both patches also want 'x86/CPU: extend is_forced_cpu_cap()'s "reach"' in
place.

1: disable RDSEED on Fam17 model 47 stepping 0
2: disable RDSEED on most of Zen5</pre>
    </blockquote>
    <pre>Both patches LGTM to be in 4.21:
  Release-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii</pre>
  </body>
</html>

--------------MIqlxIefaXBd2jD9aVfW0jtD--

