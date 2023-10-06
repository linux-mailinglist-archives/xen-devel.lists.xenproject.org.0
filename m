Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4587BB64A
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 13:20:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613541.954117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoirm-0001Uu-TR; Fri, 06 Oct 2023 11:19:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613541.954117; Fri, 06 Oct 2023 11:19:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoirm-0001Ry-QE; Fri, 06 Oct 2023 11:19:34 +0000
Received: by outflank-mailman (input) for mailman id 613541;
 Fri, 06 Oct 2023 11:19:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vVKM=FU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qoirk-0001Rc-OF
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 11:19:33 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37d6324e-643a-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 13:19:30 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-405417465aaso18886625e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Oct 2023 04:19:30 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 15-20020a05600c028f00b004065d67c3c9sm3555407wmk.8.2023.10.06.04.19.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Oct 2023 04:19:29 -0700 (PDT)
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
X-Inumbo-ID: 37d6324e-643a-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1696591170; x=1697195970; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:references:cc:to:content-language:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Gb/Pz/0HTLyDkmtx1dNVsHhwkTrFEn5fioJcJoW+z58=;
        b=qd+UM8tkbyK3fPf0ISh+BKtim+bjtipYhxeZhsAAViS4+DaYN5ATP1pCn7pTUoFuMb
         Yy0j5GCZ9n5nv2YfQdDRXZZIb+t/dF+aifGPw1JPu/lc+j7/eai/WTxiQvfU4D4oSc7A
         E2y+TSCnBWYQ7muPEyD3U0AcDgDUsXPM2jrQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696591170; x=1697195970;
        h=in-reply-to:autocrypt:references:cc:to:content-language:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gb/Pz/0HTLyDkmtx1dNVsHhwkTrFEn5fioJcJoW+z58=;
        b=vTyz2hpyYuB5VH1u2jfvoLXACN21jauouyNqL25wK4G+RwByI2d4ukjwaX+Fgq6k1V
         tHedrCemQuBRfMVxS7zUH7xsQdglLR07xbYJLHOs9TgXpZBCyOI6w4aTEzcJF9++nB4h
         9QtVMJaD3Nz1kMl/nG3L3BY+rF92CuX1cRBW72F85X2JpIwjFysoNgkCrczq9xnKXXHw
         XQ1e4dHoXkPBDYiNpmo0IHh26R146ghnUxzn1F2JtTgaDxPOwYQ0ml6va8yAtrjLa8uL
         NnnRVSeISQCvzFWA99XHGuyCLeYmRQkIe9SHNC7bom7N8vFzYxDF7IhlvixbvGLjoJJ6
         974A==
X-Gm-Message-State: AOJu0Yze6osns+Y47pam19ijJOkRlReA9eGjRRmZOXWV894bnKEk1F0a
	h7H40NMKKrnadsT2yyU6zyiooA==
X-Google-Smtp-Source: AGHT+IH3uZ1jyDY7sk4aMM6nD0fb7rs5rd1HAdN4mpHEfk2Esc+n67+Ywp0B+HlqBoyeRFUTJqxwQw==
X-Received: by 2002:a1c:ed07:0:b0:406:44e5:b915 with SMTP id l7-20020a1ced07000000b0040644e5b915mr7146449wmh.8.1696591169836;
        Fri, 06 Oct 2023 04:19:29 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------06oX6csJDR7tV0foAJHDKics"
Message-ID: <c9b260af-0d97-4117-a62a-5adc8b5e2621@citrix.com>
Date: Fri, 6 Oct 2023 12:19:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] domain: expose newly introduced hypercalls as XENFEAT
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20231006091353.96367-1-roger.pau@citrix.com>
 <20231006091353.96367-3-roger.pau@citrix.com>
 <ac4842a9-7f62-4c64-9a3a-2ec2b1e97699@citrix.com>
 <ZR_pRUvNLXQ0ftt1@MacBookPdeRoger>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZR_pRUvNLXQ0ftt1@MacBookPdeRoger>

This is a multi-part message in MIME format.
--------------06oX6csJDR7tV0foAJHDKics
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/10/2023 12:02 pm, Roger Pau Monné wrote:
> On Fri, Oct 06, 2023 at 11:47:48AM +0100, Andrew Cooper wrote:
>> diff --git a/xen/common/domain.c b/xen/common/domain.c
>> index b8281d7cff9d..df994bd30fd2 100644
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -1998,6 +1998,10 @@ long common_vcpu_op(int cmd, struct vcpu *v
>>      {
>>          struct vcpu_register_runstate_memory_area area;
>>  
>> +        rc = -ENOSYS;
>> +        if ( 0 /* TODO: Dom's XENFEAT_runstate_phys_area setting */ )
>> +            break;
>> +
>>          rc = -EFAULT;
>>          if ( copy_from_guest(&area.addr.p, arg, 1) )
>>              break;
>>
>> and a matching one for XENFEAT_vcpu_time_phys_area because I'm even more
>> serious about this becoming a domain controllable setting following what
>> OSSTest had to say overnight.
> While this is all fine, please note that the newly added code
> {,un}map_guest_area() is also used by the existing
> VCPUOP_register_vcpu_info hypercall, and that one can't be disabled.

Yeah, I'm aware we're stuck there, but a crap interface from the past is
not an excuse not to do new interfaces properly.

~Andrew
--------------06oX6csJDR7tV0foAJHDKics
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 06/10/2023 12:02 pm, Roger Pau Monné
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:ZR_pRUvNLXQ0ftt1@MacBookPdeRoger">
      <pre class="moz-quote-pre" wrap="">On Fri, Oct 06, 2023 at 11:47:48AM +0100, Andrew Cooper wrote:
</pre>
      <blockquote type="cite"><span style="white-space: pre-wrap">
</span>
        <pre class="moz-quote-pre" wrap="">diff --git a/xen/common/domain.c b/xen/common/domain.c
index b8281d7cff9d..df994bd30fd2 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1998,6 +1998,10 @@ long common_vcpu_op(int cmd, struct vcpu *v
     {
         struct vcpu_register_runstate_memory_area area;
 
+        rc = -ENOSYS;
+        if ( 0 /* TODO: Dom's XENFEAT_runstate_phys_area setting */ )
+            break;
+
         rc = -EFAULT;
         if ( copy_from_guest(&amp;area.addr.p, arg, 1) )
             break;

and a matching one for XENFEAT_vcpu_time_phys_area because I'm even more
serious about this becoming a domain controllable setting following what
OSSTest had to say overnight.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
While this is all fine, please note that the newly added code
{,un}map_guest_area() is also used by the existing
VCPUOP_register_vcpu_info hypercall, and that one can't be disabled.</pre>
    </blockquote>
    <br>
    Yeah, I'm aware we're stuck there, but a crap interface from the
    past is not an excuse not to do new interfaces properly.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------06oX6csJDR7tV0foAJHDKics--

