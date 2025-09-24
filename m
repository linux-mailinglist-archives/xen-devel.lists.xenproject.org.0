Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45266B9ABC7
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 17:40:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129522.1469445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1Rbn-0002sa-6l; Wed, 24 Sep 2025 15:40:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129522.1469445; Wed, 24 Sep 2025 15:40:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1Rbn-0002r6-46; Wed, 24 Sep 2025 15:40:43 +0000
Received: by outflank-mailman (input) for mailman id 1129522;
 Wed, 24 Sep 2025 15:40:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9CQP=4D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v1Rbl-0002pn-Dc
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 15:40:41 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d26fb0b3-995c-11f0-9809-7dc792cee155;
 Wed, 24 Sep 2025 17:40:39 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-62fce8b75a3so9679809a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Sep 2025 08:40:39 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-67-38.play-internet.pl.
 [109.243.67.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62fa5cfa883sm12792294a12.11.2025.09.24.08.40.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Sep 2025 08:40:36 -0700 (PDT)
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
X-Inumbo-ID: d26fb0b3-995c-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758728439; x=1759333239; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wVBKlxFl0q41Dyy+SNAdonJB3IkGEvRpEGHFUwik7Jw=;
        b=feoQ6gpXkki8v6XuX9GbZDGvqN8nMytXJv1ZThVRazpOZ1F5qsNBLg5rftbM6jsgKW
         zLepeQZT8w1FuUFsYPFGz5W4iRB+SH+QJDDy6Ghiv48TH+Dvye4HdjjSGhx82tT2mmU6
         pPz7DA+IDGqX7xxIvcVXlJqvnvq8pkbqNQprPlaLHv+GdsTBS3pNDpfeyHupbJxeJ8Zh
         fBA8eF2aBj/gyWYFRoE+CiawghA45N7w4vffr9uB5OtPkylOOq8I+3gFppKqQb8XBDD7
         v+6cmeEkJF6hvBTUgez2KQEGyK+dS9Em6yicEjWWe8NGz5Ma0jQRMmJk/C92H26bRzFL
         cE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758728439; x=1759333239;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wVBKlxFl0q41Dyy+SNAdonJB3IkGEvRpEGHFUwik7Jw=;
        b=c1zh6m3HoOv9oWxqwc7rR7Qq89JOl0XUWkxgtRn6OP8naaq81lBPwAsxk7Y4hh6YXm
         mnBtaXRWLGrpJhKUKjCxfCLanpqJ/zLlaoAgXlY7W7S/8sIbBOnnn2NVcE8oHA8r+phu
         a+FvlOVePp/ElZOgYzZ+/UtIPN8dAyyHMH+QuIGPIZsaf2e44+RyPUIr3s/snklbSHdc
         ngwvvcllvyMushZ39b7Asa1qUzBY1VyBT+SQLvstz4Bo1ry9XsY2+X47YaQJprY5ZpdR
         vvSGLWJKuL0YFwznIFwji1zkNdvYQcSgm5oxKnaf38jt9DeJq72dbEtceuDv4UP7cWIP
         cu9A==
X-Forwarded-Encrypted: i=1; AJvYcCUPJ/6SvnLNX5Y602HwEG1+7JPoGzg4QWLfS0j09EvzBOM6QtYvnjaQcBSW5dCqxgAUTQuELY8FiDg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxzJOAfBfzsOwNL/cXNdJ4HMvQ2jIr3YNC4O7idM/SwyU3lYYuW
	xiMIPv11Gqz3xenyBkeG3ric72VK2tiQNcxvtKo8jgzLZ5aNBf6x3umC
X-Gm-Gg: ASbGnctx17yHPBRx+VwiR6GEOnK7xVPPndkIUfHclyvyhR+Ios35R3Obtck7QpWsQNK
	C0rzskO/04y31F04MCtOoZYu0+Is+gHi3Hv9ziuY8YMx/vR49EDhdd8VU745EFceZU4FKY006hi
	ROq6jPJry+pkQFIRWpuzhfUWjuafvM/hFwSj7Ca1diiNzl+0/BnHZJ5GWZkp2IqCYEeom6ugzEG
	qrmUMbw/5Tld2GRZOzzzNuhQ1SdMiISHDC+ROOKVvN0G3KOV/0cnv10euhbd7ZhqLKey45/9BUb
	dPDYUfVkHdmhM3MrxRxnwKpUTOEeYbpuU7GqerkUbKiiCqIerfdXt7Bo9Ak0d7sKkiHyD1XWpH/
	U84GHyAw48GEat7U+IB0L2dQV3zYfYCdnGs9D/hmwz8mEeUe/AGbbUtRm8cu3aaZB4uZKzDZ6
X-Google-Smtp-Source: AGHT+IERDAEwh5Zcaqw9MJW4RwnxelL38x+IM1tVUdsvkKUm82nki96yCEqfNnZB7mu68in5mS03Mw==
X-Received: by 2002:a17:907:7245:b0:b0d:d831:6fb8 with SMTP id a640c23a62f3a-b34bc584811mr25134866b.62.1758728437255;
        Wed, 24 Sep 2025 08:40:37 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------6YyVHfXiWVeBQLQJtUOQiw52"
Message-ID: <31a0e82c-6855-41d3-ad9c-282261012656@gmail.com>
Date: Wed, 24 Sep 2025 17:40:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/18] xen/riscv: add root page table allocation
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <2b636ea03bf82cae50df87d525e3f58b68f16cb2.1758145428.git.oleksii.kurochko@gmail.com>
 <eda37f82-5381-4900-aa75-3f4bfbc01440@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <eda37f82-5381-4900-aa75-3f4bfbc01440@suse.com>

This is a multi-part message in MIME format.
--------------6YyVHfXiWVeBQLQJtUOQiw52
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/20/25 12:14 AM, Jan Beulich wrote:
> On 17.09.2025 23:55, Oleksii Kurochko wrote:
>
>> +{
>> +    return MASK_INSR(mfn_x(page_to_mfn(p2m->root)), HGATP_PPN) |
>> +           MASK_INSR(gstage_mode, HGATP_MODE_MASK) |
>> +           MASK_INSR(vmid, HGATP_VMID_MASK);
>> +}
>> +
>> +static int p2m_alloc_root_table(struct p2m_domain *p2m)
>> +{
>> +    struct domain *d = p2m->domain;
>> +    struct page_info *page;
>> +    int rc;
>> +
>> +    /*
>> +     * Return back P2M_ROOT_PAGES to assure the root table memory is also
>> +     * accounted against the P2M pool of the domain.
>> +     */
>> +    if ( (rc = paging_ret_pages_to_domheap(d, P2M_ROOT_PAGES)) )
>> +        return rc;
> I read the "ret" in the name as "return" here. However, ...
>
>> +    /*
>> +     * As mentioned in the Priviliged Architecture Spec (version 20240411)
>> +     * in Section 18.5.1, for the paged virtual-memory schemes  (Sv32x4,
>> +     * Sv39x4, Sv48x4, and Sv57x4), the root page table is 16 KiB and must
>> +     * be aligned to a 16-KiB boundary.
>> +     */
>> +    page = alloc_domheap_pages(d, P2M_ROOT_ORDER, MEMF_no_owner);
>> +    if ( !page )
>> +    {
>> +        /*
>> +         * If allocation of root table pages fails, the pages acquired above
>> +         * must be returned to the freelist to maintain proper freelist
>> +         * balance.
>> +         */
>> +        paging_ret_pages_to_freelist(d, P2M_ROOT_PAGES);
> ... "return" doesn't make sense here, so I wonder what the "ret" here means.

In both cases,|ret| was supposed to mean/"return"/, since in both cases we
“return” memory.
I agree that in the case of|paging_ret_pages_to_freelist()|, the flow is
slightly different: a page is allocated from the domheap and then added back
to the freelist. That looks more like/adding/ than/returning/. Still, I felt that
“return” could also apply here, as the page is being given back.

For more clarity, do you think it would make sense to rename
|paging_ret_pages_to_freelist()| to|paging_add_page_to_freelist()|?

~ Oleksii


--------------6YyVHfXiWVeBQLQJtUOQiw52
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
    <div class="moz-cite-prefix">On 9/20/25 12:14 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:eda37f82-5381-4900-aa75-3f4bfbc01440@suse.com">
      <pre wrap="" class="moz-quote-pre">On 17.09.2025 23:55, Oleksii Kurochko wrote:

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+{
+    return MASK_INSR(mfn_x(page_to_mfn(p2m-&gt;root)), HGATP_PPN) |
+           MASK_INSR(gstage_mode, HGATP_MODE_MASK) |
+           MASK_INSR(vmid, HGATP_VMID_MASK);
+}
+
+static int p2m_alloc_root_table(struct p2m_domain *p2m)
+{
+    struct domain *d = p2m-&gt;domain;
+    struct page_info *page;
+    int rc;
+
+    /*
+     * Return back P2M_ROOT_PAGES to assure the root table memory is also
+     * accounted against the P2M pool of the domain.
+     */
+    if ( (rc = paging_ret_pages_to_domheap(d, P2M_ROOT_PAGES)) )
+        return rc;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I read the "ret" in the name as "return" here. However, ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    /*
+     * As mentioned in the Priviliged Architecture Spec (version 20240411)
+     * in Section 18.5.1, for the paged virtual-memory schemes  (Sv32x4,
+     * Sv39x4, Sv48x4, and Sv57x4), the root page table is 16 KiB and must
+     * be aligned to a 16-KiB boundary.
+     */
+    page = alloc_domheap_pages(d, P2M_ROOT_ORDER, MEMF_no_owner);
+    if ( !page )
+    {
+        /*
+         * If allocation of root table pages fails, the pages acquired above
+         * must be returned to the freelist to maintain proper freelist
+         * balance.
+         */
+        paging_ret_pages_to_freelist(d, P2M_ROOT_PAGES);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... "return" doesn't make sense here, so I wonder what the "ret" here means.</pre>
    </blockquote>
    <pre data-start="207" data-end="302">In both cases, <code
    data-start="222" data-end="227">ret</code> was supposed to mean <em
    data-start="249" data-end="259">"return"</em>, since in both cases we
“return” memory.
I agree that in the case of <code data-start="332" data-end="364">paging_ret_pages_to_freelist()</code>, the flow is
slightly different: a page is allocated from the domheap and then added back
to the freelist. That looks more like <em data-start="493"
    data-end="501">adding</em> than <em data-start="507" data-end="518">returning</em>. Still, I felt that
“return” could also apply here, as the page is being given back.</pre>
    <pre data-start="607" data-end="738">For more clarity, do you think it would make sense to rename
<code data-start="668" data-end="700">paging_ret_pages_to_freelist()</code> to <code
    data-start="704" data-end="735">paging_add_page_to_freelist()</code>?

~ Oleksii
</pre>
    <pre></pre>
    <br>
  </body>
</html>

--------------6YyVHfXiWVeBQLQJtUOQiw52--

