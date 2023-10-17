Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9071C7CC062
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 12:17:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618193.961551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsh7L-0005IE-TX; Tue, 17 Oct 2023 10:16:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618193.961551; Tue, 17 Oct 2023 10:16:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsh7L-0005Fy-QP; Tue, 17 Oct 2023 10:16:03 +0000
Received: by outflank-mailman (input) for mailman id 618193;
 Tue, 17 Oct 2023 10:16:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sbBI=F7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qsh7L-0005Fs-1S
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 10:16:03 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b08c937-6cd6-11ee-9b0e-b553b5be7939;
 Tue, 17 Oct 2023 12:15:59 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-53d8320f0easo9380164a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Oct 2023 03:15:59 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 c14-20020a50f60e000000b0053dff5568acsm951092edn.58.2023.10.17.03.15.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Oct 2023 03:15:59 -0700 (PDT)
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
X-Inumbo-ID: 2b08c937-6cd6-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1697537759; x=1698142559; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:references:cc:to:content-language:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x1xnZKfx94PXTI1sJ4b4vYHEkGEOy/fo3hPTelC5fWI=;
        b=VszHHtB131C7Au8jWcySgstXWTUJB+nByN7VWJ/ZOlPDdbPtWadSjGYDHFXgsFZZYl
         wkHZFRS0VGebxuJO90n7b2inl9vOvUB4PQYXiHyu81iM/DSEQABhO7HjX5y417NY2YVP
         GndsiNBGw5//Zq0lOivENqNSjeY1FK15r4DZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697537759; x=1698142559;
        h=in-reply-to:autocrypt:references:cc:to:content-language:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x1xnZKfx94PXTI1sJ4b4vYHEkGEOy/fo3hPTelC5fWI=;
        b=SruQ45egqwjXc7wPhxjthMqMtMYCyTptEwdnidh3+jyZuzIOdsE2fiWyg3/mpkjVsZ
         JyTpH/Zruf3A3kKSe9I+zgKUfoPIb1WIFRSZJlIbSKnG0NWK5AGd3lXfpt77eW5BgBMM
         YSGJJqu+Qx7+oNy9PKaRV527OObZxFUh32A5lVn5Hw2RrMZRNSekkp54dSoOTSoQlpLp
         zQkZz4Ng09jLrM7VRSQBx2JPgFeTa8jI0jpT2jM1Wny6L6xOMFF3xOhGqUvrdP/EEteT
         ub82wAthM7h8cdPraSp8VC8+5c0+fJuO8CBY7LWXp4RP7XMBJtp5NXeIi5UqdHCMV+y0
         o0oA==
X-Gm-Message-State: AOJu0YyPYPaKlPnsUs9dPEzTD6gGjrhdbagPSSPhNDMN1YKufmbGovmU
	H+YEUlTNatTwagL3dIXuL/SPlA==
X-Google-Smtp-Source: AGHT+IGSkATtRyRlc1+vtXS97+qpUqoqfHpa0SjgaJEtkzyIXeCeo8ZRFDkgYw2sOsFik9KUU2KcuQ==
X-Received: by 2002:a50:9fad:0:b0:53f:25c4:357f with SMTP id c42-20020a509fad000000b0053f25c4357fmr525378edf.34.1697537759265;
        Tue, 17 Oct 2023 03:15:59 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------ZLVQ3yYJP0EqtKlsJ8yJvoc1"
Message-ID: <a0fbce20-4022-477a-b150-d8662dd0aa68@citrix.com>
Date: Tue, 17 Oct 2023 11:15:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.18] docs/sphinx: Lifecycle of a domid
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>,
 Henry Wang <Henry.Wang@arm.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20231016162450.1286178-1-andrew.cooper3@citrix.com>
 <90e657ad-4109-442e-2b26-52cd2372f582@suse.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <90e657ad-4109-442e-2b26-52cd2372f582@suse.com>

This is a multi-part message in MIME format.
--------------ZLVQ3yYJP0EqtKlsJ8yJvoc1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/10/2023 7:34 am, Jan Beulich wrote:
> On 16.10.2023 18:24, Andrew Cooper wrote:
>> +Termination
>> +-----------
>> +
>> +The VM runs for a period of time, but eventually stops.  It can stop for a
>> +number of reasons, including:
>> +
>> + * Directly at the guest kernel's request, via the ``SCHEDOP_shutdown``
>> +   hypercall.  The hypercall also includes the reason for the shutdown,
>> +   e.g. ``poweroff``, ``reboot`` or ``crash``.
>> +
>> + * Indirectly from certain states.  E.g. executing a ``HLT`` instruction with
>> +   interrupts disabled is interpreted as a shutdown request as it is a common
>> +   code pattern for fatal error handling when no better options are available.
> HLT (note btw that this is x86 and HVM specific and hence may want mentioning
> as such) is interpreted this way only if all other vCPU-s are also "down"
> already.
>
>> + * Indirectly from fatal exceptions.  In some states, execution is unable to
>> +   continue, e.g. Triple Fault on x86.
> Nit: This again is HVM specific.

Triple fault, maybe.  fatal exceptions terminating the VM, no.

For both, these details are not important for the document.  This is an
list of examples, not an exhaustive list.
>> +Destruction
>> +-----------
>> +
>> +The domain object in Xen is reference counted, and survives until all
>> +references are dropped.
>> +
>> +The ``@releaseDomain`` watch is to inform all entities that hold a reference
>> +on the domain to clean up.  This may include:
>> +
>> + * Paravirtual driver backends having a grant map of the shared ring with the
>> +   frontend.
> Beyond the shared ring(s), other (data) pages may also still have mappings.

Yes, but again, this is just a examples.  Other data pages should only
be mapped while data is in flight.

~Andrew
--------------ZLVQ3yYJP0EqtKlsJ8yJvoc1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 17/10/2023 7:34 am, Jan Beulich
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:90e657ad-4109-442e-2b26-52cd2372f582@suse.com">
      <pre class="moz-quote-pre" wrap="">On 16.10.2023 18:24, Andrew Cooper wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+Termination
+-----------
+
+The VM runs for a period of time, but eventually stops.  It can stop for a
+number of reasons, including:
+
+ * Directly at the guest kernel's request, via the ``SCHEDOP_shutdown``
+   hypercall.  The hypercall also includes the reason for the shutdown,
+   e.g. ``poweroff``, ``reboot`` or ``crash``.
+
+ * Indirectly from certain states.  E.g. executing a ``HLT`` instruction with
+   interrupts disabled is interpreted as a shutdown request as it is a common
+   code pattern for fatal error handling when no better options are available.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
HLT (note btw that this is x86 and HVM specific and hence may want mentioning
as such) is interpreted this way only if all other vCPU-s are also "down"
already.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+ * Indirectly from fatal exceptions.  In some states, execution is unable to
+   continue, e.g. Triple Fault on x86.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Nit: This again is HVM specific.</pre>
    </blockquote>
    <br>
    Triple fault, maybe.  fatal exceptions terminating the VM, no.<br>
    <br>
    For both, these details are not important for the document.  This is
    an list of examples, not an exhaustive list.<br>
    <span style="white-space: pre-wrap">

</span>
    <blockquote type="cite"
      cite="mid:90e657ad-4109-442e-2b26-52cd2372f582@suse.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+Destruction
+-----------
+
+The domain object in Xen is reference counted, and survives until all
+references are dropped.
+
+The ``@releaseDomain`` watch is to inform all entities that hold a reference
+on the domain to clean up.  This may include:
+
+ * Paravirtual driver backends having a grant map of the shared ring with the
+   frontend.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Beyond the shared ring(s), other (data) pages may also still have mappings.</pre>
    </blockquote>
    <br>
    Yes, but again, this is just a examples.  Other data pages should
    only be mapped while data is in flight.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------ZLVQ3yYJP0EqtKlsJ8yJvoc1--

