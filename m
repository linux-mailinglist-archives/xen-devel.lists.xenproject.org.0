Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AD4ABC262
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 17:26:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989950.1373903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH2Ni-0001Gi-K9; Mon, 19 May 2025 15:26:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989950.1373903; Mon, 19 May 2025 15:26:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH2Ni-0001EJ-Hd; Mon, 19 May 2025 15:26:22 +0000
Received: by outflank-mailman (input) for mailman id 989950;
 Mon, 19 May 2025 15:26:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KRlD=YD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uH2Nh-0001ED-Uw
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 15:26:21 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9dc0930e-34c5-11f0-a2fa-13f23c93f187;
 Mon, 19 May 2025 17:26:21 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ad563b69908so219975466b.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 May 2025 08:26:21 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d496550sm601327766b.134.2025.05.19.08.26.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 08:26:19 -0700 (PDT)
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
X-Inumbo-ID: 9dc0930e-34c5-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747668380; x=1748273180; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yRl/PkMU6oguqxB83j7gje4eBUCYPjl7jM58/1LnIHc=;
        b=W1kYqDY3Jn8GKrMkAqSgwrTe3jJwamTxb9sR7AcKgHeiJXNkDlrjz46iIsHHzyrbS4
         3UnJ9B89BBLHdHI50RyVWVeBXZU5niIpskG4mEOrEgkYEC1mj2YnYL7m9aVHzpUZcS+H
         VBeJOchyfgL4G03HcUaooz7WERMOYBSt+ZMXGnmS2cHN4VL7xphSEEY9BnJ2pCzujW6j
         UzwPT6/1Si/0dNbxWkPvRRs3obKsEVCdRp7fDbvR/tHcjHnIIyKua3eSv+ZKcaZkG9ma
         2lagl/AKTIj+gzudJJ3iF+2M6Lm2fYXfRotN7gyE9qQMRdvFJWhipP3+nHdIuLH5FnBM
         cGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747668380; x=1748273180;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yRl/PkMU6oguqxB83j7gje4eBUCYPjl7jM58/1LnIHc=;
        b=onPaV4M1gdz1GtoQfzE+S5A/82/CjFCdDvnBYsEmz4o7+kHC/TMqcp9og9pK+/ZOjy
         dViCKu4+pIEDwp9JZcDMiGXQqf6jvR4C5EB2ErO+uUsLA+Th7EDjPuSHFvo8dVC+qxqu
         O2uSh5CSppw9BxSyMo0JEcZf9tCuWdXbrL4V7sKoSu3vwtf4hLVpBCElO6tV0eE+xN5o
         +JXzJFcKTpqO9UuCPD8W4xqtbUxt6xmt+mKJ+WZdA14ysTmT5pYJh4WE6Xbw1uBjq1Tn
         PsW/q/OQK45xG/pibHHSGSIkBH1mzJbpOPeKMC/sJQaVuqF0PY2cuWwOVJxYaba0bUkU
         8nhg==
X-Forwarded-Encrypted: i=1; AJvYcCXIROveDcKs9xYde7k6dD5nGJ9TymgPd0ulpDX9jF0YKtdKiQSjif0IEREOt8oKzBB0GAm+FZXQutg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZX9lwTZuITgi25dgGeJSHPqA/x9nee2ahvLgdMoCBAsiqpvJ+
	4hwPWh1Ao5BxfPMso0Ua1f8s97MYu6hrB/IhkRPMosWlZY/sxrhU82SU
X-Gm-Gg: ASbGnctoORnofaYBG8K6Si3y868ijsQ8Q1xO2MdjfCtfmY9fFxtYvhvA0ITWWKo3iCT
	JtaYePP4/zkdhAI972uhOvAwmcDAACGgsiASQ+c/4fHrSXOghzwRR2ox5YQGdZBTYlBMpm1Fgdc
	0fx+6r3GlyBDTHnD9tNhPcPeTLIVWbBC0OvdHkjMqC5bQdaZZdkc4LvxZHOxg3wleaErBkmbJ6u
	YT1Kkej0wOvbiywDGPNcogML331+V5JJOD0DAkpXpQCER66h+/6nGFc9TjR6x6p2C2xH3p7kFoP
	AYrOKGYWojvjXN+SllEfURq6RsD/P74aye7l0anxwRRt9BDHTw5tiWjv1rO4MtJptXWlQys7iVq
	46GqYUPQbHHa4rJc2KPD75gLG
X-Google-Smtp-Source: AGHT+IGx3SLRWBY8MEz7CVvAS1gTDVF/2sgUzHOdR6lIKA7RRyVxwvcmy1UxA14RwrUsvH4kTfLPVg==
X-Received: by 2002:a17:906:2418:b0:ad5:480e:c0a4 with SMTP id a640c23a62f3a-ad5480ec7a5mr676614666b.8.1747668380169;
        Mon, 19 May 2025 08:26:20 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------P0N0FGKoqVbxlPleYZXhfR2f"
Message-ID: <4b948489-6fb9-4554-9a4c-4fa75de7345d@gmail.com>
Date: Mon, 19 May 2025 17:26:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/16] xen/riscv: imsic_init() implementation
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
 <f7588e93d0ddacc29ce5d89b2855624f82d6baa9.1746530883.git.oleksii.kurochko@gmail.com>
 <0d9a9a9e-3454-465f-ac1d-cd65ba4a5792@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <0d9a9a9e-3454-465f-ac1d-cd65ba4a5792@suse.com>

This is a multi-part message in MIME format.
--------------P0N0FGKoqVbxlPleYZXhfR2f
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/15/25 10:42 AM, Jan Beulich wrote:
>> +                   node->name, imsic_cfg.msi[cpuid].base_addr + reloff);
>> +            imsic_cfg.msi[cpuid].offset = 0;
>> +            imsic_cfg.msi[cpuid].base_addr = 0;
>> +            continue;
>> +        }
>> +
>> +        bitmap_set(imsic_cfg.mmios[index].cpus, cpuid, 1);
> Depending on clarification on the number space used, this may want to be
> cpumask_set_cpu() instead. Else I think this is simply __set_bit().

cpumask_set_cpu() requires cpumask_t which uses static definition but we are
using dynamic allocation.
So it seems like bitmap_set() is the  best one option or reworking to static
allocation will require.
Am I missing something?

~ Oleksii


--------------P0N0FGKoqVbxlPleYZXhfR2f
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
    <div class="moz-cite-prefix">On 5/15/25 10:42 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:0d9a9a9e-3454-465f-ac1d-cd65ba4a5792@suse.com">
      <pre class="moz-quote-pre" wrap=""><blockquote type="cite"
      style="color: #007cff;"><pre wrap="" class="moz-quote-pre">+                   node-&gt;name, imsic_cfg.msi[cpuid].base_addr + reloff);
+            imsic_cfg.msi[cpuid].offset = 0;
+            imsic_cfg.msi[cpuid].base_addr = 0;
+            continue;
+        }
+
+        bitmap_set(imsic_cfg.mmios[index].cpus, cpuid, 1);
</pre></blockquote><pre wrap="" class="moz-quote-pre">Depending on clarification on the number space used, this may want to be
cpumask_set_cpu() instead. Else I think this is simply __set_bit().
</pre></pre>
    </blockquote>
    <pre><pre wrap="" class="moz-quote-pre">cpumask_set_cpu() requires cpumask_t which uses static definition but we are
using dynamic allocation.
So it seems like bitmap_set() is the  best one option or reworking to static
allocation will require.
Am I missing something?

~ Oleksii
</pre>
</pre>
  </body>
</html>

--------------P0N0FGKoqVbxlPleYZXhfR2f--

