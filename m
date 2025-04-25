Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31569A9C7C1
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 13:38:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967780.1357499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8HNW-0007CR-H6; Fri, 25 Apr 2025 11:37:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967780.1357499; Fri, 25 Apr 2025 11:37:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8HNW-0007AB-EM; Fri, 25 Apr 2025 11:37:58 +0000
Received: by outflank-mailman (input) for mailman id 967780;
 Fri, 25 Apr 2025 11:37:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=snHQ=XL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u8HNU-0007A5-Be
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 11:37:56 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9a8cda5-21c9-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 13:37:53 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5e5e63162a0so3195969a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Apr 2025 04:37:54 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6e4e69d9sm126703866b.50.2025.04.25.04.37.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 04:37:52 -0700 (PDT)
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
X-Inumbo-ID: b9a8cda5-21c9-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745581074; x=1746185874; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/oCzall6IJjEf2NA5xua/OK1BYGT7Y/JTGA8KS6iqJ4=;
        b=Wz63E8V4Ufhs8/gkAs08fAtG/PXCJo+bgkE8IoW1VVv0GjrBrM3otrrpG7YITrFybF
         5F3Cd6Ulyboetm9KZO6Oko3IwVm5tUVzKTEjheEG9sef1DKM3eGPbjl7cyF6o9oMcrkG
         fPJU9tgNMvfs6cON84/dNvr/If8e+gHDhWmHINexUCK05UM3zZUwHN/n7H4Cnj12phQ8
         ieNXOc+3geVlLgs+qqr0cI5fNRQVO5c88t2EDGYmsQpH40b+itQP/JCD5w19Y/oe4y+1
         zVXuST0oo1inlZ57YQs7knDIxFOt0xVOv6LQr/AlGpLZSFgeNxtn2qdbkJAGQ++M12qj
         7TDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745581074; x=1746185874;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/oCzall6IJjEf2NA5xua/OK1BYGT7Y/JTGA8KS6iqJ4=;
        b=QOGCa7ZD+ME6/fkn0Am3qPl1n/gd5X5a+gBGv4WsKDNaXXSwIpi9+wlcg7W7J6+bVo
         JPRlFyFtwetTW007TILgjrtqCtwYv9/iaggqVa8g712qLGiNIMLJeVh3jKT1pW3Y6pP2
         Wqij/yvmQL9avHN399I2j2fH27YfH47/XLC8Q0u98FbofKYtPGwdl5ejkImLh9gAyiGQ
         HGU42R57RbGadaz+A26qYpdNAxJt6lke9iFjzlKp9aeq0NcVmqI2eCUQCKjG/amXd1ds
         nBd6CN/amtcO94UmYVaV4OlNFN2vAktmS4oL7LXYXzX+/2WTtsM2RBV5ym17HKzkMcEE
         ZoOQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7ug9gix2TYI2PcIuABNWETuwR+2kWi89J1Gs56ZXjn89Xjh36ad1vMT2dpMRH+CQ6QN7pt8HgSco=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6TIDm7NvtS6qp5CwPou2GgJSU8saii0wzZJSp0B9nStIgvGtb
	UN2xz4dn8lQRin7EiBo0KZAIYS0PaP4JkCGx/gI00PculG/KFF+Z
X-Gm-Gg: ASbGncu9DayUDujGtlo9KhUtAlXef2ivtSH3A8FeCvI0WIS4rzSoPIFjCwJQdSGGz6+
	8kbWrwiYRDyP83DxdMYNPxjGi6Fl5ibplhKOKUOlpULGB/ztRcbYzs9t1GDwuzTlD+cgP3FRcSM
	irHx/+X7r4FHZBzk6hMuMGpyC39azYxHxNF7/FshOItZzKuavsgVWe8e7EdKrDauQIf0FCADDPq
	qK+AIXUZtUgvrmqFOjdrRXtC27e1As/epZnNUdM/gKR84zSK2Mc6b67w6Ddq214RXI6hwFqsT59
	6h20IoPz0EgRt36VTVwEwaqJdIfzA47jqF4ktTNLNWgk+Oc9IYABaVVsF2m+nCXeUugLzVvSbQ5
	UXwK8Cr+XSrwIeAwN
X-Google-Smtp-Source: AGHT+IEI/86n+Ar6kMSJ9ijLJwsfUJhgn8c8m2xYfHxjDpCXV0xyKhxlirWGiQinIxD+Am7dlL1k4A==
X-Received: by 2002:a17:907:9712:b0:acb:4f4a:cbd0 with SMTP id a640c23a62f3a-ace73a45d2bmr152419666b.14.1745581073209;
        Fri, 25 Apr 2025 04:37:53 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------XMoOdFwmyq6FjXzEzOhZitU5"
Message-ID: <71e1847a-6469-4596-b721-38e8e0060194@gmail.com>
Date: Fri, 25 Apr 2025 13:37:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] ppc/mm: Introduce mm-types.h
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>,
 Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20250425112415.245585-1-andrew.cooper3@citrix.com>
 <20250425112415.245585-4-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250425112415.245585-4-andrew.cooper3@citrix.com>

This is a multi-part message in MIME format.
--------------XMoOdFwmyq6FjXzEzOhZitU5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/25/25 1:24 PM, Andrew Cooper wrote:
> From: Shawn Anastasio<sanastasio@raptorengineering.com>
>
> Signed-off-by: Shawn Anastasio<sanastasio@raptorengineering.com>
> ---
> CC: Jan Beulich<JBeulich@suse.com>
> CC: Roger Pau Monné<roger.pau@citrix.com>
> CC: Stefano Stabellini<sstabellini@kernel.org>
> CC: Julien Grall<julien@xen.org>
> CC: Volodymyr Babchuk<Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis<bertrand.marquis@arm.com>
> CC: Michal Orzel<michal.orzel@amd.com>
> CC: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> CC: Shawn Anastasio<sanastasio@raptorengineering.com>
>
> Possibly not for taking on it's own (might be better with the PPC
> implemenation of map_pages_to_xen()).
>
> Nevertheless, this patch alone now does trip:
>
>    diff --git a/xen/common/vmap.c b/xen/common/vmap.c
>    index d6991421f3f7..9552806dba39 100644
>    --- a/xen/common/vmap.c
>    +++ b/xen/common/vmap.c
>    @@ -228,6 +228,8 @@ void *__vmap(const mfn_t *mfn, unsigned int granularity,
>         void *va = vm_alloc(nr * granularity, align, type);
>         unsigned long cur = (unsigned long)va;
>
>    +    BUILD_BUG_ON(sizeof(pte_attr_t) != 4);
>    +

Could you please clarify what kind of changes should done in the case if
sizeof(pte_attr_t) == 8 (unsigned long)?

~ Oleksii

>         for ( ; va && nr--; ++mfn, cur += PAGE_SIZE * granularity )
>         {
>             if ( map_pages_to_xen(cur, *mfn, granularity, flags) )
>
> in PPC builds only.
> ---
>   xen/arch/ppc/include/asm/mm-types.h | 7 +++++++
>   1 file changed, 7 insertions(+)
>   create mode 100644 xen/arch/ppc/include/asm/mm-types.h
>
> diff --git a/xen/arch/ppc/include/asm/mm-types.h b/xen/arch/ppc/include/asm/mm-types.h
> new file mode 100644
> index 000000000000..06a3af1c6eda
> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/mm-types.h
> @@ -0,0 +1,7 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef PPC_MM_TYPES_H
> +#define PPC_MM_TYPES_H
> +
> +typedef unsigned long pte_attr_t;
> +
> +#endif /* PPC_MM_TYPES_H */
--------------XMoOdFwmyq6FjXzEzOhZitU5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/25/25 1:24 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250425112415.245585-4-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">From: Shawn Anastasio <a class="moz-txt-link-rfc2396E" href="mailto:sanastasio@raptorengineering.com">&lt;sanastasio@raptorengineering.com&gt;</a>

Signed-off-by: Shawn Anastasio <a class="moz-txt-link-rfc2396E" href="mailto:sanastasio@raptorengineering.com">&lt;sanastasio@raptorengineering.com&gt;</a>
---
CC: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:JBeulich@suse.com">&lt;JBeulich@suse.com&gt;</a>
CC: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
CC: Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:sstabellini@kernel.org">&lt;sstabellini@kernel.org&gt;</a>
CC: Julien Grall <a class="moz-txt-link-rfc2396E" href="mailto:julien@xen.org">&lt;julien@xen.org&gt;</a>
CC: Volodymyr Babchuk <a class="moz-txt-link-rfc2396E" href="mailto:Volodymyr_Babchuk@epam.com">&lt;Volodymyr_Babchuk@epam.com&gt;</a>
CC: Bertrand Marquis <a class="moz-txt-link-rfc2396E" href="mailto:bertrand.marquis@arm.com">&lt;bertrand.marquis@arm.com&gt;</a>
CC: Michal Orzel <a class="moz-txt-link-rfc2396E" href="mailto:michal.orzel@amd.com">&lt;michal.orzel@amd.com&gt;</a>
CC: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
CC: Shawn Anastasio <a class="moz-txt-link-rfc2396E" href="mailto:sanastasio@raptorengineering.com">&lt;sanastasio@raptorengineering.com&gt;</a>

Possibly not for taking on it's own (might be better with the PPC
implemenation of map_pages_to_xen()).

Nevertheless, this patch alone now does trip:

  diff --git a/xen/common/vmap.c b/xen/common/vmap.c
  index d6991421f3f7..9552806dba39 100644
  --- a/xen/common/vmap.c
  +++ b/xen/common/vmap.c
  @@ -228,6 +228,8 @@ void *__vmap(const mfn_t *mfn, unsigned int granularity,
       void *va = vm_alloc(nr * granularity, align, type);
       unsigned long cur = (unsigned long)va;

  +    BUILD_BUG_ON(sizeof(pte_attr_t) != 4);
  +</pre>
    </blockquote>
    <pre>Could you please clarify what kind of changes should done in the case if 
sizeof(pte_attr_t) == 8 (unsigned long)?

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:20250425112415.245585-4-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">
       for ( ; va &amp;&amp; nr--; ++mfn, cur += PAGE_SIZE * granularity )
       {
           if ( map_pages_to_xen(cur, *mfn, granularity, flags) )

in PPC builds only.
---
 xen/arch/ppc/include/asm/mm-types.h | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 xen/arch/ppc/include/asm/mm-types.h

diff --git a/xen/arch/ppc/include/asm/mm-types.h b/xen/arch/ppc/include/asm/mm-types.h
new file mode 100644
index 000000000000..06a3af1c6eda
--- /dev/null
+++ b/xen/arch/ppc/include/asm/mm-types.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef PPC_MM_TYPES_H
+#define PPC_MM_TYPES_H
+
+typedef unsigned long pte_attr_t;
+
+#endif /* PPC_MM_TYPES_H */
</pre>
    </blockquote>
  </body>
</html>

--------------XMoOdFwmyq6FjXzEzOhZitU5--

