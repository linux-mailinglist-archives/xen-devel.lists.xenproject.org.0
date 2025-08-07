Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0272B1D928
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 15:35:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073091.1436012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk0mL-0004WB-0g; Thu, 07 Aug 2025 13:35:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073091.1436012; Thu, 07 Aug 2025 13:35:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk0mK-0004Su-T1; Thu, 07 Aug 2025 13:35:32 +0000
Received: by outflank-mailman (input) for mailman id 1073091;
 Thu, 07 Aug 2025 13:35:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oMMd=2T=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uk0mJ-0004So-Rq
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 13:35:31 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63048c59-7393-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 15:35:30 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-6157b5d0cc2so1415896a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 06:35:30 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6176052d163sm6033291a12.48.2025.08.07.06.35.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Aug 2025 06:35:29 -0700 (PDT)
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
X-Inumbo-ID: 63048c59-7393-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754573730; x=1755178530; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMQQUPqbSmAQ84PcDpsPR1TssQhbrv8TMUlid5SMt7U=;
        b=m8JNP52qLmGDLPbhnclYlDxUaOMejxStOU5w6vJmQI87A36ndAG8ALgGM78e0dz0oW
         tdrhkOZKk0Q4VKaoTVAd7DYsYW6Tu3bIAEvoWoRtkwy8tFtHnGPV4cSFl9ERF6m6QTD2
         BvUZdGOlgpHfYfzt8XQYaeqDa2cPXlJyJMYMQuWknpdg3LrqJ2O3UyEYEWbUoLbRj7R0
         FUDvYiECAdNO4KXwpQVH0fIbxOqDO/IrVRWhxJkDOIdXWQ2QZiHBljJL4bYHU2/O8+i7
         9iEGp09Hfsjd+OcG9HTlG5nGkL5uBLSaaEaMH+YbI0+V0R+/jBab0hjue3iE7FEhP3RW
         JlLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754573730; x=1755178530;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZMQQUPqbSmAQ84PcDpsPR1TssQhbrv8TMUlid5SMt7U=;
        b=TCP90csNVkcuGsOXqTaR/YgGZ4xhIrA7zCLqCT+V+fWhZ2fWVwa8hkm0f2i6ovD3pq
         AKr40m/kYkXPkTH/iuhl8mN0rLpIWcACUibYhh4LsTRADmmSTYit23jtImLxNMFafpy6
         ks5WFitZaTVKR7SBq0mdh/zKlq/UlRA4ThjUndM9BYpM9+HLlP9E/hC3t1wytrRNT8Cn
         6e5coc45SKQ1PsiCIU4u1lEyW3WGUa5RZVupOpTRB+8haQX9B/QLv+Y2wxEPIoGtf2rW
         rQHNmi7aaoYTieI8qvbXVlP8rknwK3rye6Gx10Onq49GB/h6nYb5F8WdD4teeCvfv2oX
         0f+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVi+RrKFdgi2SRAuG8lylA1Caw9jJ01oIcmzfHSZTPYFalwcJjyJZZDX8bvEdU6+s41ughRUgY9KsY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwzqUlYw42li6f0TA/IKIQUMHlU2I2uK7diux6rJdCH3j9bk+jx
	QnAr7KplVKJVhcUf0S2r/vb6efCZo9MYS5YbbqZzpeSR4DoB/j4+tw/v
X-Gm-Gg: ASbGncsIQjmpKM0P0N86MX2Tfjn+bpUB81rT2yHDeaNjitOfwMOeFc2RZQ6sAAkQhnh
	w3ogvWc0i3o9hj66rUNulZfie93UfnIwzwSqPRD23tWXsrhtY8sPwnCTqWk2GsqHMe7ISmw273h
	eIVXrCstQDz2T0EoTKNZZjsgYA7tJizQM/oHJDGyzxLNDIWWy81P8R5PxP9AqqbsUy8mGiU8y12
	F8UwC55sol1SDVJEVvQME150/x1xPIdczZM985Jfij1+/UchBqqLC9LkVKjCHW4Le+1XPvK2OQ7
	DcI4fKnQfzEbCyJ82GZEW/VJOIWHlx6v4+grcWAg7RHZmXauYWzedyTOq6xfpfz8+ENL6K8Ll1B
	JTOKYUw04bFEeU/f8nXS3TckXz2svUqhmz63ral6lqb6XzJnwYD1jfXBstdQW8USk0CmSWSs=
X-Google-Smtp-Source: AGHT+IEM0roZqSysoFXqrDxjwksiGBMuheWYWRwh/WggvQ3R1gIncLhEctJQNa34eECIheOm/jWesg==
X-Received: by 2002:a05:6402:3111:b0:615:399e:d3ba with SMTP id 4fb4d7f45d1cf-61797e2b407mr3699780a12.32.1754573729903;
        Thu, 07 Aug 2025 06:35:29 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------Ai0G5NcisNLRIKxItrFcJzkT"
Message-ID: <ccdd5caa-2c91-4125-9c6b-067c941649b1@gmail.com>
Date: Thu, 7 Aug 2025 15:35:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/20] xen/riscv: add root page table allocation
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <23c79f07221dee7eb782ebb160442f3a796a41b2.1753973161.git.oleksii.kurochko@gmail.com>
 <7491c934-f847-4fe2-9d9b-a500f0888198@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <7491c934-f847-4fe2-9d9b-a500f0888198@suse.com>

This is a multi-part message in MIME format.
--------------Ai0G5NcisNLRIKxItrFcJzkT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/5/25 12:43 PM, Jan Beulich wrote:
> On 31.07.2025 17:58, Oleksii Kurochko wrote:
>> +static int p2m_alloc_root_table(struct p2m_domain *p2m)
>> +{
>> +    struct domain *d = p2m->domain;
>> +    struct page_info *page;
>> +    const unsigned int nr_root_pages = P2M_ROOT_PAGES;
>> +
>> +    /*
>> +     * Return back nr_root_pages to assure the root table memory is also
>> +     * accounted against the P2M pool of the domain.
>> +     */
>> +    if ( !paging_ret_pages_to_domheap(d, nr_root_pages) )
>> +        return -ENOMEM;
>> +
>> +    page = p2m_allocate_root(d);
>> +    if ( !page )
>> +        return -ENOMEM;
>> +
>> +    p2m->root = page;
>> +
>> +    return 0;
>> +}
> In the success case, shouldn't you bump the paging pool's total_pages by
> P2M_ROOT_PAGES? (As the freeing side is missing so far, it's not easy to
> tell whether there's [going to be] a balancing problem in the long run.
> In the short run there certainly is.)

I think that total_pages should be updated only in case when page is added
to freelist.
In the case of p2m root table, we just returning some pages to domheap and
durint that decreasing an amount of total_pages as freelist has lesser pages,
and then just allocate pages from domheap without adding them to freelist.

~ Oleksii

--------------Ai0G5NcisNLRIKxItrFcJzkT
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/5/25 12:43 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:7491c934-f847-4fe2-9d9b-a500f0888198@suse.com">
      <pre wrap="" class="moz-quote-pre">On 31.07.2025 17:58, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+static int p2m_alloc_root_table(struct p2m_domain *p2m)
+{
+    struct domain *d = p2m-&gt;domain;
+    struct page_info *page;
+    const unsigned int nr_root_pages = P2M_ROOT_PAGES;
+
+    /*
+     * Return back nr_root_pages to assure the root table memory is also
+     * accounted against the P2M pool of the domain.
+     */
+    if ( !paging_ret_pages_to_domheap(d, nr_root_pages) )
+        return -ENOMEM;
+
+    page = p2m_allocate_root(d);
+    if ( !page )
+        return -ENOMEM;
+
+    p2m-&gt;root = page;
+
+    return 0;
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
In the success case, shouldn't you bump the paging pool's total_pages by
P2M_ROOT_PAGES? (As the freeing side is missing so far, it's not easy to
tell whether there's [going to be] a balancing problem in the long run.
In the short run there certainly is.)</pre>
    </blockquote>
    <pre>I think that total_pages should be updated only in case when page is added
to freelist.
In the case of p2m root table, we just returning some pages to domheap and
durint that decreasing an amount of total_pages as freelist has lesser pages,
and then just allocate pages from domheap without adding them to freelist.

~ Oleksii
</pre>
  </body>
</html>

--------------Ai0G5NcisNLRIKxItrFcJzkT--

