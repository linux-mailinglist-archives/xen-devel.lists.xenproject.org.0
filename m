Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E924CA25AA8
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 14:19:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880630.1290711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tewLs-00061i-CG; Mon, 03 Feb 2025 13:19:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880630.1290711; Mon, 03 Feb 2025 13:19:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tewLs-0005zh-8o; Mon, 03 Feb 2025 13:19:00 +0000
Received: by outflank-mailman (input) for mailman id 880630;
 Mon, 03 Feb 2025 13:18:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o2EM=U2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tewLq-0005zb-IX
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 13:18:58 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bd58f29-e231-11ef-99a4-01e77a169b0f;
 Mon, 03 Feb 2025 14:18:56 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4361f664af5so51565925e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 05:18:56 -0800 (PST)
Received: from [192.168.100.192] (lfbn-gre-1-190-108.w90-112.abo.wanadoo.fr.
 [90.112.153.108]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc1315esm186896925e9.6.2025.02.03.05.18.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 05:18:53 -0800 (PST)
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
X-Inumbo-ID: 6bd58f29-e231-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738588736; x=1739193536; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=34pXzXErDRQP/pthRAMElQjtp7dXGnoQ33Ud/Sn9nv0=;
        b=Uap7hjF2b6clFK4FwNhnhbjEVWw681rtCcTLswvy/N6t2/I6El9nsnLpPSV9XRHIYi
         wEmEUicpV3mm44/v2QUomc4boTLyxzvqJz2ZEaYv+JqDXuZKuAt+vpRcqXwhl8mbkSby
         w36DrJ41RfHuP3Kj3ISPHg9UEoI8UP0bqjM6vFTF12qBJpSHfDDBSr0DANKFrjdzbDrj
         MX1srZWqPcd0l5rcl0Yu+cD4oK7ByefQB5aP0xYmzOZbdLEuGsBeV+P1Xf6YXzB6V1Ch
         8yuC2lYnWkwWybD8yIViDrpERUJeOuUmtnyjyAJtDSV/ZFffaL4Qle8R+qgAQld/ZlRP
         kh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738588736; x=1739193536;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=34pXzXErDRQP/pthRAMElQjtp7dXGnoQ33Ud/Sn9nv0=;
        b=Hvb9If0iocvzDxjjAdtsBEhv7Au3o9ieEPYApVf98oTiDv9YWAsAwW8qjJ17o3vOsQ
         XeXI3H1QR2S8Kvq52Lz2EcWSRUYg+iDfQTsow7vs+q/rLVYX/CYSCsI1iAizao7Tx9bI
         HjmJMllMJteKzY7hS739W0eiM2zQIIaAc+Upab42ufhnHpMwIbKUS7R5cxOcERER8KqP
         MMToQnbZ8Mx7YEVRHHqfZGGKSHZwe16xO+z4kM2q4UKh6XexYLuIutSGfd+meSABAl0B
         W0FPewMWNlvgduPsUUOK5lRKHfhruDbrzhKpZGrUH0KhL6aVlUjhM8Mq7XyW5w236x+z
         iiNg==
X-Gm-Message-State: AOJu0YxDSpG0s/iP3aJNz6hW4QueLIY3iWYSA1xi5fHFwMJd7Pq+yHLS
	RdLSltvaY9yq7qjDSt78nG8On+4HkOs0/2/lxG52eb3NnlkcHiOC
X-Gm-Gg: ASbGnct882FjmkiyXbPyfPLftLMDCOVrOTCZDRr3kjCmUNszFqnz8JjJ8ueaYMJkbR7
	ryTOvIKsecQ8Wul9V3aPdG3G7zPEwffuI5xC7XVpJYFOd9qOB9DmHdnhlJXRaeqtYTnwLqoBNDX
	xc6jzQpM88rNpFFrKI0yAliIilwVH3XJ4PULi70zjaxmZml9my7AFVG5jfnSTvQp6AmWcGJTCbA
	H8KSz6OakySeR+qmKXLzvdu1RUvSNZHYwi+pZ124ZpUzsVvHtmwhcn5TJ+oo78ybpVpNQeTOJAO
	N1arJNUmRiRdrYhcBrtoUy8I18LLXrIIaC7wjsPGA9hb/PSuoaN7w/lPpE9KuC5VjeH3bTBVLrC
	mBCQ=
X-Google-Smtp-Source: AGHT+IGVlCdcKSDvHXEyHdpZsTj+JbalTGYcBOwN1DCA/d0fZuCAWZbNanKGqgU65Gy8XvcIgl6vxA==
X-Received: by 2002:a05:6000:178e:b0:385:e1e8:40db with SMTP id ffacd0b85a97d-38c5195f9f4mr17979706f8f.24.1738588734132;
        Mon, 03 Feb 2025 05:18:54 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------qoBoRAmyVRLYz9kyGB77ihBX"
Message-ID: <f3220173-0176-441c-80c9-90207565213a@gmail.com>
Date: Mon, 3 Feb 2025 14:18:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen/arm: ffa: fix bind/unbind notification
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Jens Wiklander <jens.wiklander@linaro.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "patches@linaro.org" <patches@linaro.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>
References: <20250203102123.3002912-1-jens.wiklander@linaro.org>
 <6510AE6D-AA1A-4AF7-93D1-0C2627F1893E@arm.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <6510AE6D-AA1A-4AF7-93D1-0C2627F1893E@arm.com>

This is a multi-part message in MIME format.
--------------qoBoRAmyVRLYz9kyGB77ihBX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 2/3/25 11:42 AM, Bertrand Marquis wrote:
> Hi Jens,
>
> Thanks a lot for the finding.
>
>> On 3 Feb 2025, at 11:21, Jens Wiklander<jens.wiklander@linaro.org> wrote:
>>
>> The notification bitmask is in passed in the FF-A ABI in two 32-bit
>> registers w3 and w4. The lower 32-bits should go in w3 and the higher in
>> w4. These two registers has unfortunately been swapped for
>> FFA_NOTIFICATION_BIND and FFA_NOTIFICATION_UNBIND in the FF-A mediator.
>> So fix that by using the correct registers.
>>
>> Fixes: b490f470f58d ("xen/arm: ffa: support notification")
>> Signed-off-by: Jens Wiklander<jens.wiklander@linaro.org>
> Reviewed-by: Bertrand Marquis<bertrand.marquis@arm.com>
>
> @Oleksii: This is a fix of a bug, can this be considered for 4.20 ?

The fix is straightforward, so let's include this fix in 4.20:

R-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

>
> Thanks
> Bertrand
>
>> ---
>> xen/arch/arm/tee/ffa_notif.c | 8 ++++----
>> 1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
>> index 21b9e78f6399..00efaf8f7353 100644
>> --- a/xen/arch/arm/tee/ffa_notif.c
>> +++ b/xen/arch/arm/tee/ffa_notif.c
>> @@ -40,8 +40,8 @@ int ffa_handle_notification_bind(struct cpu_user_regs *regs)
>>       * We only support notifications from SP so no need to check the sender
>>       * endpoint ID, the SPMC will take care of that for us.
>>       */
>> -    return ffa_simple_call(FFA_NOTIFICATION_BIND, src_dst, flags, bitmap_hi,
>> -                           bitmap_lo);
>> +    return ffa_simple_call(FFA_NOTIFICATION_BIND, src_dst, flags, bitmap_lo,
>> +                           bitmap_hi);
>> }
>>
>> int ffa_handle_notification_unbind(struct cpu_user_regs *regs)
>> @@ -61,8 +61,8 @@ int ffa_handle_notification_unbind(struct cpu_user_regs *regs)
>>       * We only support notifications from SP so no need to check the
>>       * destination endpoint ID, the SPMC will take care of that for us.
>>       */
>> -    return  ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0, bitmap_hi,
>> -                            bitmap_lo);
>> +    return  ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0, bitmap_lo,
>> +                            bitmap_hi);
>> }
>>
>> void ffa_handle_notification_info_get(struct cpu_user_regs *regs)
>> -- 
>> 2.43.0
>>
--------------qoBoRAmyVRLYz9kyGB77ihBX
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hi Bertrand,
</pre>
    <div class="moz-cite-prefix">On 2/3/25 11:42 AM, Bertrand Marquis
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:6510AE6D-AA1A-4AF7-93D1-0C2627F1893E@arm.com">
      <pre wrap="" class="moz-quote-pre">Hi Jens,

Thanks a lot for the finding.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 3 Feb 2025, at 11:21, Jens Wiklander <a class="moz-txt-link-rfc2396E" href="mailto:jens.wiklander@linaro.org">&lt;jens.wiklander@linaro.org&gt;</a> wrote:

The notification bitmask is in passed in the FF-A ABI in two 32-bit
registers w3 and w4. The lower 32-bits should go in w3 and the higher in
w4. These two registers has unfortunately been swapped for
FFA_NOTIFICATION_BIND and FFA_NOTIFICATION_UNBIND in the FF-A mediator.
So fix that by using the correct registers.

Fixes: b490f470f58d ("xen/arm: ffa: support notification")
Signed-off-by: Jens Wiklander <a class="moz-txt-link-rfc2396E" href="mailto:jens.wiklander@linaro.org">&lt;jens.wiklander@linaro.org&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Reviewed-by: Bertrand Marquis <a class="moz-txt-link-rfc2396E" href="mailto:bertrand.marquis@arm.com">&lt;bertrand.marquis@arm.com&gt;</a>

@Oleksii: This is a fix of a bug, can this be considered for 4.20 ?</pre>
    </blockquote>
    <pre>The fix is straightforward, so let's include this fix in 4.20:</pre>
    <pre>R-Acked-by: Oleksii Kurochko &lt;<a rel="noopener"><span>oleksii</span><span>.kurochko</span><span>@gmail</span><span>.com&gt;</span></a></pre>
    <pre>Thanks.</pre>
    <pre>~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:6510AE6D-AA1A-4AF7-93D1-0C2627F1893E@arm.com">
      <pre wrap="" class="moz-quote-pre">

Thanks
Bertrand

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">---
xen/arch/arm/tee/ffa_notif.c | 8 ++++----
1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
index 21b9e78f6399..00efaf8f7353 100644
--- a/xen/arch/arm/tee/ffa_notif.c
+++ b/xen/arch/arm/tee/ffa_notif.c
@@ -40,8 +40,8 @@ int ffa_handle_notification_bind(struct cpu_user_regs *regs)
     * We only support notifications from SP so no need to check the sender
     * endpoint ID, the SPMC will take care of that for us.
     */
-    return ffa_simple_call(FFA_NOTIFICATION_BIND, src_dst, flags, bitmap_hi,
-                           bitmap_lo);
+    return ffa_simple_call(FFA_NOTIFICATION_BIND, src_dst, flags, bitmap_lo,
+                           bitmap_hi);
}

int ffa_handle_notification_unbind(struct cpu_user_regs *regs)
@@ -61,8 +61,8 @@ int ffa_handle_notification_unbind(struct cpu_user_regs *regs)
     * We only support notifications from SP so no need to check the
     * destination endpoint ID, the SPMC will take care of that for us.
     */
-    return  ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0, bitmap_hi,
-                            bitmap_lo);
+    return  ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0, bitmap_lo,
+                            bitmap_hi);
}

void ffa_handle_notification_info_get(struct cpu_user_regs *regs)
-- 
2.43.0

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------qoBoRAmyVRLYz9kyGB77ihBX--

