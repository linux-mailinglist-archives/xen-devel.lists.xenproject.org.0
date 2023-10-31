Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4742C7DCBE2
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 12:34:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625638.975128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxn0a-0000A5-Rq; Tue, 31 Oct 2023 11:34:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625638.975128; Tue, 31 Oct 2023 11:34:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxn0a-00006U-O5; Tue, 31 Oct 2023 11:34:08 +0000
Received: by outflank-mailman (input) for mailman id 625638;
 Tue, 31 Oct 2023 11:34:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9ZX9=GN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qxn0Z-00006O-CV
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 11:34:07 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65460c71-77e1-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 12:34:04 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-53e70b0a218so8794462a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 31 Oct 2023 04:34:04 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 30-20020a508e1e000000b0053dab756073sm990996edw.84.2023.10.31.04.34.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Oct 2023 04:34:03 -0700 (PDT)
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
X-Inumbo-ID: 65460c71-77e1-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698752044; x=1699356844; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:references:cc:to:content-language:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1FJxZD6mY/SutwuFq7lYwPQWcGMXb9HHhhSlBW7oqsc=;
        b=a3Pd4qXNXnwuOtSjoCjXWaB4ikqUSAo+Oai75SbK6cPWLrXCnPgbAN/tMb4xlXe9bv
         amauJ/tSPOXEW4E9sMpOl/JNXyVlXM3xv3iTLmrEz46aExgRYpUIzpJ+uvhmRClRz4By
         huExg0v0pogkKc2g9dRekljDGw1mKy99/H8vo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698752044; x=1699356844;
        h=in-reply-to:autocrypt:references:cc:to:content-language:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1FJxZD6mY/SutwuFq7lYwPQWcGMXb9HHhhSlBW7oqsc=;
        b=Ln5WIIit1bVUGGaijzHxwZgmLIlCmUiapP29vRI778YYzgjn7KukqGmYPat0iflAqx
         FW5ilD+K7wTIjGl+IOWpKV9llsc8esxNSdeadjstDAySBhHgj+6ujGMotj0iR5d8sXJN
         2yGazlLPjIU68MV7K6wYLTFy+QQ8hQruoRmLvm9qxjNXc0D3C2H9HiPCuhPAjNy3p2j5
         r3tdLur7NS4QGn8AocxF/hhIUdVw1D3AtVLgAXOXpOcxdtufsoElK/j9UxKcyPxlXTFW
         gJ+g6tXmmHnnBTZ4tZj+MH2r6fkfC1CXtmgJtg2l3da7j5UypHpPSdLfOU18rxNgBBaR
         UoXQ==
X-Gm-Message-State: AOJu0Yy0H9gOHJY176Fd9lh65xxyI9XEgTbTw0/WkdNJngFrEDhGWP9G
	zlCxW1vH2lTV70zHoUl8NzK6CA==
X-Google-Smtp-Source: AGHT+IHYYwi+3E3cOrC0cgozH3U0LgIikGXoB00hABbzZRotK+dcoRCPThB8tEyAEZ8fnXd2toRuDw==
X-Received: by 2002:a50:9b10:0:b0:543:5717:c7b1 with SMTP id o16-20020a509b10000000b005435717c7b1mr2466489edi.12.1698752044048;
        Tue, 31 Oct 2023 04:34:04 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------EU1GzGMDzUpoPtO3xrPun7LK"
Message-ID: <e82f5119-c3e7-4138-8e78-2bea48b638ab@citrix.com>
Date: Tue, 31 Oct 2023 11:34:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [RFC PATCH 04/22] x86/msr-index: add references to vendor manuals
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?B?RWR3aW4gVMO2csO2aw==?=
 <edwin.torok@cloud.com>
Cc: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1698261255.git.edwin.torok@cloud.com>
 <7e4418cfb1daa172e78fc47098a4018ae0493e23.1698261255.git.edwin.torok@cloud.com>
 <356aa412-453f-f6d7-d61b-5946ba8832e2@suse.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <356aa412-453f-f6d7-d61b-5946ba8832e2@suse.com>

This is a multi-part message in MIME format.
--------------EU1GzGMDzUpoPtO3xrPun7LK
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/10/2023 4:15 pm, Jan Beulich wrote:
>> --- a/xen/arch/x86/include/asm/msr-index.h
>> +++ b/xen/arch/x86/include/asm/msr-index.h
>> @@ -13,6 +13,16 @@
>>   * Blocks of related constants should be sorted by MSR index.  The constant
>>   * names should be as concise as possible, and the bit names may have an
>>   * abbreviated name.  Exceptions will be considered on a case-by-case basis.
>> + *
>> + * References:
>> + * - https://software.intel.com/content/www/us/en/develop/articles/intel-sdm.html
>> + *    Intel(R) 64 and IA-32 architectures SDM volume 4: Model-specific registers
>> + *    Chapter 2, "Model-Specific Registers (MSRs)"
> ... at least Intel's URL has changed several times over the years. Volume
> and chapter numbers change even more frequently. Any such is liable to go
> stale at some point.

https://intel.com/sdm

This one has been valid for roughly the lifetime of intel.com, and is
committed to stay so.

>
> Jan
>
>> + * - https://developer.amd.com/resources/developer-guides-manuals/

whereas AMD really have broken this one, and don't seem to be showing
any urgency in unbreaking it...  Right now there is no landing page at
all for manuals.

~Andrew
--------------EU1GzGMDzUpoPtO3xrPun7LK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 30/10/2023 4:15 pm, Jan Beulich
      wrote:<span style="white-space: pre-wrap">
</span></div>
    <blockquote type="cite"
      cite="mid:356aa412-453f-f6d7-d61b-5946ba8832e2@suse.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -13,6 +13,16 @@
  * Blocks of related constants should be sorted by MSR index.  The constant
  * names should be as concise as possible, and the bit names may have an
  * abbreviated name.  Exceptions will be considered on a case-by-case basis.
+ *
+ * References:
+ * - <a class="moz-txt-link-freetext" href="https://software.intel.com/content/www/us/en/develop/articles/intel-sdm.html">https://software.intel.com/content/www/us/en/develop/articles/intel-sdm.html</a>
+ *    Intel(R) 64 and IA-32 architectures SDM volume 4: Model-specific registers
+ *    Chapter 2, "Model-Specific Registers (MSRs)"
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
... at least Intel's URL has changed several times over the years. Volume
and chapter numbers change even more frequently. Any such is liable to go
stale at some point.</pre>
    </blockquote>
    <br>
    <a class="moz-txt-link-freetext" href="https://intel.com/sdm">https://intel.com/sdm</a><br>
    <br>
    This one has been valid for roughly the lifetime of intel.com, and
    is committed to stay so.<br>
    <br>
    <blockquote type="cite"
      cite="mid:356aa412-453f-f6d7-d61b-5946ba8832e2@suse.com">
      <pre class="moz-quote-pre" wrap="">

Jan

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+ * - <a class="moz-txt-link-freetext" href="https://developer.amd.com/resources/developer-guides-manuals/">https://developer.amd.com/resources/developer-guides-manuals/</a></pre>
      </blockquote>
    </blockquote>
    <br>
    whereas AMD really have broken this one, and don't seem to be
    showing any urgency in unbreaking it...  Right now there is no
    landing page at all for manuals.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------EU1GzGMDzUpoPtO3xrPun7LK--

