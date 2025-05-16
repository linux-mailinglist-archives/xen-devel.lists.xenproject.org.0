Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2692CAB9E21
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 16:04:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987239.1372652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFvfV-00072m-Cd; Fri, 16 May 2025 14:04:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987239.1372652; Fri, 16 May 2025 14:04:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFvfV-0006zw-9r; Fri, 16 May 2025 14:04:09 +0000
Received: by outflank-mailman (input) for mailman id 987239;
 Fri, 16 May 2025 14:04:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n8HW=YA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uFvfT-0006zn-EU
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 14:04:07 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1222eda-325e-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 16:04:06 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a36463b9cbso133175f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 07:04:06 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f482f1d6sm100456375e9.14.2025.05.16.07.04.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 07:04:04 -0700 (PDT)
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
X-Inumbo-ID: a1222eda-325e-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747404245; x=1748009045; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/edY+Zskoh0wrOH6vmFE+9XhkCbiUGh0UQtxuebu1lo=;
        b=cXCivGgBnOxboVq0nT8lUUE2S6bKblMHfTit2UwUATO+4f8XraY44Wz3hTqUe8tI1/
         H/PXb9THauW9coSy1ljbTGra8/ipx4UPtpPlJhBW4hKi0VquficgOUTq2J9gDIlikCVg
         3wjXBD6ezyGBJRXqzjLLpitsvvG6+R+0sNGWW5Gpi69f76cPG3vNsz5nU0qUfDdZSVcw
         PPkPa3KXdt1mXddzDwXUa4/P941UDFPAjbANnul/uF+rYTuQe+mKpYv2yhMA8fwMW2PV
         s2z0PsIpGwy+29c1Zy7l3mK60viGr3B/+0gBU+zzNluVJMDwrZ+kUgk7xTIy8iPqljgM
         +toA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747404245; x=1748009045;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/edY+Zskoh0wrOH6vmFE+9XhkCbiUGh0UQtxuebu1lo=;
        b=WPR3mJHW39pavL3kP+1l94EirxMjLLGaHnCUrtVJR3UGLxkcHH7iR8WfKLwB/sfppp
         OfjpuTdKY94El23lqtLgCsbp2NMTmOwLrClPn92isA5nPpUGqOQwE7J4GOs8xoRvELur
         qDttRyKgykRDNWtyxUq1+X3Zl2Aw3RsdFdKiGOg9On520r12vrP1uDAqgT2QyOCiYONy
         LYe4QAuuSm89O6fWeNYiW4JV2PRTjxTGx2HyG80Uq5+GxAu50myZFd4BTH1aUKWqUt5x
         RUkWxLOwl3J9/0MRZ/HqoNS97LeOjCaAMEbIIsSWbvSmkT0H4ch2+DGSCiAeIBT0nWg/
         1ktg==
X-Forwarded-Encrypted: i=1; AJvYcCXRfreujrRVE+AY+50eijITsQUQtJHeveL0FxNR0d2p7eWOtm6bYukfgRVSgf7oB2tZBC9j8EpLu5k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzFk2DoHJuAqwTLetZmjHXqlqNF7QmLUbdyX5rp4sAD/xpYbdX8
	L4Gju2vYoOk4IemJG0YfuAxNSzY4hTR9pwNdCvgdq8n2L2GLLQvtDGUK
X-Gm-Gg: ASbGncttzv/v52p8UVkBy6P1UmSQfbgrmDCabEQ6mO9YNFVZyODvheNLJac/BJI5AWt
	in5q+Etc+MRxlyBM57VRJw55cb0857HB3s2U67KGW3nTR+Znsih3kJRqWGd3NUmwxTs+u58uU+2
	/JS87ChIMdZPpc0JHSocXFzRvXwoftQcnhfW5+yjHxCsICKR/CWrxTU9xge8r2JyhiwHWmENeqv
	9HoqlqF55j7xFoG3oasQBkKfGQfludr9ZBy125jywuHvQMPOXzs61j8huHrDQWfIBf4EFC4gGD4
	SVIztBjeC9Uxt8Edas8ZyN8zDKiCC8/pjXozm800DV7kPGjcvnegrfvU4CfW67NYQub9HaKOKNS
	obrvRWTUeV1mmuTV97SCsLlpZ
X-Google-Smtp-Source: AGHT+IGF2wSQmYpEBCL/akwVepdZjGoqTRKqOSNhvf4mx6gUMtkVlD2C4NLQy3ui62kqlWC5nwUmQw==
X-Received: by 2002:a5d:5849:0:b0:3a1:f654:b84e with SMTP id ffacd0b85a97d-3a35c845c23mr3619414f8f.55.1747404245089;
        Fri, 16 May 2025 07:04:05 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------now59vvmZaF6uxg1wijNK0zA"
Message-ID: <e6aea8e0-cf70-40ff-8729-24be0f432aeb@gmail.com>
Date: Fri, 16 May 2025 16:04:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/16] xen/riscv: introduce platform_get_irq()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
 <a6198571b19be1f10b549e68a1b712a6653429e6.1746530883.git.oleksii.kurochko@gmail.com>
 <f2d61436-739c-4e41-95a5-22a5176d9415@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f2d61436-739c-4e41-95a5-22a5176d9415@suse.com>

This is a multi-part message in MIME format.
--------------now59vvmZaF6uxg1wijNK0zA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/15/25 9:33 AM, Jan Beulich wrote:
>> +int platform_get_irq(const struct dt_device_node *device, int index)
>> +{
>> +    struct dt_irq dt_irq;
>> +    int ret;
>> +
>> +    if ( (ret = dt_device_get_irq(device, index, &dt_irq)) != 0 )
>> +        return ret;
>> +
>> +    if ( (ret = irq_set_type(dt_irq.irq, dt_irq.type)) != 0 )
>> +        return ret;
>> +
>> +    return dt_irq.irq;
> What guarantees the value to be at most INT_MAX (i.e. no silent conversion to
> a negative value, signaling an error to the caller)? Actually, looking at
> irq_set_type(), what guarantees irq_to_desc() there to not overrun irq_desc[]?
> There are no bounds checks in aplic_irq_xlate().

I'm afraid that both aren't guaranteed. I think to have the following in platform_get_irq()
should be enough:
     BUILD_BUG_ON(NR_IRQS > INT_MAX);

     if ( dt_irq.irq >= NR_IRQS )
         panic("irq%d is bigger then NR_IRQS(%d)\n", dt_irq.irq, NR_IRQS);

Probably, the first could be dropped as I'm not sure that anyone will use such big
number for NR_IRQS.

~ Oleksii


--------------now59vvmZaF6uxg1wijNK0zA
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
    <div class="moz-cite-prefix">On 5/15/25 9:33 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f2d61436-739c-4e41-95a5-22a5176d9415@suse.com">
      <pre class="moz-quote-pre" wrap=""><blockquote type="cite"
      style="color: #007cff;"><pre wrap="" class="moz-quote-pre">+int platform_get_irq(const struct dt_device_node *device, int index)
+{
+    struct dt_irq dt_irq;
+    int ret;
+
+    if ( (ret = dt_device_get_irq(device, index, &amp;dt_irq)) != 0 )
+        return ret;
+
+    if ( (ret = irq_set_type(dt_irq.irq, dt_irq.type)) != 0 )
+        return ret;
+
+    return dt_irq.irq;
</pre></blockquote><pre wrap="" class="moz-quote-pre">What guarantees the value to be at most INT_MAX (i.e. no silent conversion to
a negative value, signaling an error to the caller)? Actually, looking at
irq_set_type(), what guarantees irq_to_desc() there to not overrun irq_desc[]?
There are no bounds checks in aplic_irq_xlate().</pre></pre>
    </blockquote>
    <pre>I'm afraid that both aren't guaranteed. I think to have the following in platform_get_irq()
should be enough:
    BUILD_BUG_ON(NR_IRQS &gt; INT_MAX);

    if ( dt_irq.irq &gt;= NR_IRQS )
        panic("irq%d is bigger then NR_IRQS(%d)\n", dt_irq.irq, NR_IRQS);

Probably, the first could be dropped as I'm not sure that anyone will use such big
number for NR_IRQS.

~ Oleksii


</pre>
  </body>
</html>

--------------now59vvmZaF6uxg1wijNK0zA--

