Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3AEBD2DF1
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 13:59:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142298.1476486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8HCw-0007U8-Fl; Mon, 13 Oct 2025 11:59:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142298.1476486; Mon, 13 Oct 2025 11:59:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8HCw-0007SG-D8; Mon, 13 Oct 2025 11:59:18 +0000
Received: by outflank-mailman (input) for mailman id 1142298;
 Mon, 13 Oct 2025 11:59:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hmnp=4W=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v8HCv-0007SA-4P
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 11:59:17 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a9757bc-a82c-11f0-9d15-b5c5bf9af7f9;
 Mon, 13 Oct 2025 13:59:16 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-63bc12a5608so526960a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 13 Oct 2025 04:59:15 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-146-38.play-internet.pl.
 [109.243.146.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63a52b7144esm8559971a12.23.2025.10.13.04.59.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 04:59:14 -0700 (PDT)
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
X-Inumbo-ID: 0a9757bc-a82c-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760356755; x=1760961555; darn=lists.xenproject.org;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qCLlQ3osFWQy7lyr4DMEcTqM9+pCBBaIU8EjjcbSCk=;
        b=CIQRgGh/BZAuXPyKVnA9UFB5yQGmuMpQnLPJfWuCw4E43IcYr8fJPXJdqT2+MFomX6
         +ssqCiW/ci+auhFNAbS2Gbv/mLYaphJkTGd65fp5Cn7b9nOLA0LkBQbNy4+XSA4Yrezy
         PE8jXhgUMOINcuN8zby4pdS0TY9ulOKGeBvQDOAIGsxzajo46YEo1knQrPqcvdneRvon
         o3BeOG8BtTLaKDNPS4qJPEliO9IpOYuDfyiCdYkLkk/schOlrpUsuVggw9VLGrGXvB8K
         g6YLVCS0bFP18z2Zy3QBXTJ7JdlMiS8dw3vzhPM//hzWRTAN8teg3D6Kbv1Nw59oggTs
         C1kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760356755; x=1760961555;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3qCLlQ3osFWQy7lyr4DMEcTqM9+pCBBaIU8EjjcbSCk=;
        b=YwdbnebB80TveyyEy1tYfRUqGIkokEH+RLJ6B9eTqdlfobI7TVYtqvTXNCYsu+Wo/D
         yHIHzLFvx8SVc1QsbYqk08nkZFBCarE/MCgGTUEzOwWlUI4+dGs/rGnaiwLy/p8zL4Mj
         VRRJKNSdqPhpQNGgkEYWL61TDVcbPL33Wyo896WvO6r7lHMWToBWckE1Kr5n2xAzb0Tw
         i3cbmEsxdPygaarygl6awHxh0UZ61jUlNtWjVeUOTib7U8g42knWtOS8uRHO0GbS6XOj
         jGxSmsBwCu5PT57CtY+b9ocXd9pbqeZXnUYiZzYrNWoMGZF2/XmYMpQ4Pm+BAFNflaU6
         MzAA==
X-Forwarded-Encrypted: i=1; AJvYcCUqMYz06LXIVaWz7O+zxYeOVRUAVWhULmnFl0dYr7q/1CgkYqqIp2qjixzP3H0wJ5sydWcnqzNRYF4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz1icmm6F4LNFia4Qwpg47o/AIA6FxCwj4CDHFcqy9oDhptltbi
	dVxRlzJSkEz1gtrAM09IyTEPwNuXmCOFi6ja9Sh+uQJ/T5NReCxr5nz2
X-Gm-Gg: ASbGncv87E1vdEHMmOg2yUZFPOYjkZWNBpZXULk7YUa+tkHcSS5MC52J0XJ8UqN82ID
	rznxadFcwsApaxaepryrgI4EINj61znn31+kX8b99xbGrCbZ13KnZARLYE7u3VMjD6otlI7vvQ5
	vn972l3a7OX9m+gMg3VUOe8YJtU4oIrzOLe73fVaE8mHsLXqYfsXgoMcbyOudHZmc1MpffyPJ3A
	g5zpuy1C/sQOG+WttPUWBR7JzDY5IoChoMeHLGe923RyyMWSdSU0hNdE3ieHPIsPoIqy7vlQbOz
	DhzVIKO17eB269Tb51g78LW/5y1C6y+ZZlELSXq1g8RfL7jgdHi9VEhmAZ0mVo9zoIle8W5Y/xY
	bfYfwVxDT2qxG3nnW8TIRmJAIwwaS3bXCoxdULvkTxNiDCLvELAXSPGpgI7gLi2T2D+zGOj+ycJ
	7GxMqZunvYTcvMSOWTYiBlGNmpy5YbgNu4
X-Google-Smtp-Source: AGHT+IGkKB3hsfCESdaPnMFXx8WfGJrlhidHYR6jCp0Vkxc1Y7nt7LU7L/c8WXymcOQVRabnDynvOQ==
X-Received: by 2002:a05:6402:2709:b0:637:e271:8071 with SMTP id 4fb4d7f45d1cf-639d5c5943cmr20641475a12.27.1760356755057;
        Mon, 13 Oct 2025 04:59:15 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------rzlY9FsOxvAFx0HJYCBTmL6T"
Message-ID: <682706a0-4d40-459b-bab5-31b986d96bb9@gmail.com>
Date: Mon, 13 Oct 2025 13:59:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/18] xen/riscv: implement p2m_set_range()
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <5e325267a792a9a0f4cb387b4e3287d22dc8d173.1758145428.git.oleksii.kurochko@gmail.com>
 <6ee4846e-dd27-4588-aac5-f2fe2937db18@suse.com>
 <a5c016c9-aee4-4a86-a6cc-0d89dd5e9216@gmail.com>
 <6b62cf4c-8367-47dc-9911-206c220fb050@suse.com>
 <b60c5228-d7da-4b8e-b12b-3fe26825759b@gmail.com>
Content-Language: en-US
In-Reply-To: <b60c5228-d7da-4b8e-b12b-3fe26825759b@gmail.com>

This is a multi-part message in MIME format.
--------------rzlY9FsOxvAFx0HJYCBTmL6T
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/26/25 10:58 AM, Oleksii Kurochko wrote:
>>>>> +    /*
>>>>> +     * Free the entry only if the original pte was valid and the base
>>>>> +     * is different (to avoid freeing when permission is changed).
>>>>> +     *
>>>>> +     * If previously MFN 0 was mapped and it is going to be removed
>>>>> +     * and considering that during removing MFN 0 is used then `entry`
>>>>> +     * and `new_entry` will be the same and p2m_free_subtree() won't be
>>>>> +     * called. This case is handled explicitly.
>>>>> +     */
>>>>> +    if ( pte_is_valid(orig_pte) &&
>>>>> +         (!mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte)) ||
>>>>> +          (removing_mapping && mfn_eq(pte_get_mfn(*entry), _mfn(0)))) )
>>>>> +        p2m_free_subtree(p2m, orig_pte, level);
>>>> I continue to fail to understand why the MFN would matter here.
>>> My understanding is that if, for the same GFN, the MFN changes fromMFN_1 to
>>> MFN_2, then we need to update any references on the page referenced by
>>> |orig_pte| to ensure the proper reference counter is maintained for the page
>>> pointed to byMFN_1.
>>>
>>>>    Isn't the
>>>> need to free strictly tied to a VALID -> NOT VALID transition? A permission
>>>> change simply retains the VALID state of an entry.
>>> It covers a case when removing happens and probably in this case we don't need
>>> to check specifically for mfn(0) case "mfn_eq(pte_get_mfn(*entry), _mfn(0))",
>>> but it would be enough to check that pte_is_valid(entry) instead:
>>>     ...
>>>     (removing_mapping && !pte_is_valid(entry)))) )
>>>
>>> Or only check removing_mapping variable as `entry` would be invalided by the
>>> code above anyway. So we will get:
>>> +    if ( pte_is_valid(orig_pte) &&
>>> +         (!mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte)) || removing_mapping) )
>>> +        p2m_free_subtree(p2m, orig_pte, level);
>>>
>>> Does it make sense now?
>> Not really, sorry. Imo the complicated condition indicates that something is
>> wrong (or at least inefficient) here.
> Then, in the case of aVALID -> VALID transition, where the MFN is changed for the
> same PTE, should something be done with the old MFN (e.g., calling|p2m_put_page()|
> for it), or can freeing the old MFN be delayed until|domain_relinquish_resources() |is called? If so, wouldn’t that lead to a situation where many old MFNs accumulate
> and cannot be re-used until|domain_relinquish_resources()| (or another function that
> explicitly frees pages) is invoked?
> If we only need to care about theVALID -> NOT VALID transition, doesn’t that mean
> |p2m_free_subtree()| should be called only when a removal actually occurs?

I've decided to "simplify" the original condition to:
     /*
      * In case of a VALID -> INVALID transition, the original PTE should
      * always be freed.
      *
      * In case of a VALID -> VALID transition, the original PTE should be
      * freed only if the MFNs are different. If the MFNs are the same
      * (i.e., only permissions differ), there is no need to free the
      * original PTE.
      */
     if ( pte_is_valid(orig_pte) &&
          (!pte_is_valid(*entry) ||
          !mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte))) )
     {

I hope it would make more sense.

~ Oleksii
   

--------------rzlY9FsOxvAFx0HJYCBTmL6T
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
    <div class="moz-cite-prefix">On 9/26/25 10:58 AM, Oleksii Kurochko
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:b60c5228-d7da-4b8e-b12b-3fe26825759b@gmail.com">
      <blockquote type="cite"
        cite="mid:6b62cf4c-8367-47dc-9911-206c220fb050@suse.com">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">+    /*
+     * Free the entry only if the original pte was valid and the base
+     * is different (to avoid freeing when permission is changed).
+     *
+     * If previously MFN 0 was mapped and it is going to be removed
+     * and considering that during removing MFN 0 is used then `entry`
+     * and `new_entry` will be the same and p2m_free_subtree() won't be
+     * called. This case is handled explicitly.
+     */
+    if ( pte_is_valid(orig_pte) &amp;&amp;
+         (!mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte)) ||
+          (removing_mapping &amp;&amp; mfn_eq(pte_get_mfn(*entry), _mfn(0)))) )
+        p2m_free_subtree(p2m, orig_pte, level);
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">I continue to fail to understand why the MFN would matter here.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">My understanding is that if, for the same GFN, the MFN changes fromMFN_1 to
MFN_2, then we need to update any references on the page referenced by
|orig_pte| to ensure the proper reference counter is maintained for the page
pointed to byMFN_1.

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">  Isn't the
need to free strictly tied to a VALID -&gt; NOT VALID transition? A permission
change simply retains the VALID state of an entry.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">It covers a case when removing happens and probably in this case we don't need
to check specifically for mfn(0) case "mfn_eq(pte_get_mfn(*entry), _mfn(0))",
but it would be enough to check that pte_is_valid(entry) instead:
   ...
   (removing_mapping &amp;&amp; !pte_is_valid(entry)))) )

Or only check removing_mapping variable as `entry` would be invalided by the
code above anyway. So we will get:
+    if ( pte_is_valid(orig_pte) &amp;&amp;
+         (!mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte)) || removing_mapping) )
+        p2m_free_subtree(p2m, orig_pte, level);

Does it make sense now?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Not really, sorry. Imo the complicated condition indicates that something is
wrong (or at least inefficient) here.</pre>
      </blockquote>
      <pre data-start="61" data-end="520">Then, in the case of a <span
      data-start="84" data-end="101">VALID -&gt; VALID</span> transition, where the MFN is changed for the
same PTE, should something be done with the old MFN (e.g., calling <code
      data-start="212" data-end="228">p2m_put_page()</code>
for it), or can freeing the old MFN be delayed until <code
      data-start="282" data-end="313">domain_relinquish_resources()
</code>is called? If so, wouldn’t that lead to a situation where many old MFNs accumulate
and cannot be re-used until <code data-start="425" data-end="456">domain_relinquish_resources()</code> (or another function that
explicitly frees pages) is invoked?</pre>
      <pre data-start="522" data-end="684">If we only need to care about the <span
      data-start="556" data-end="577">VALID -&gt; NOT VALID</span> transition, doesn’t that mean
<code data-start="608" data-end="628">p2m_free_subtree()</code> should be called only when a removal actually occurs?</pre>
    </blockquote>
    <pre>I've decided to "simplify" the original condition to:
    /*
     * In case of a VALID -&gt; INVALID transition, the original PTE should
     * always be freed.
     *
     * In case of a VALID -&gt; VALID transition, the original PTE should be
     * freed only if the MFNs are different. If the MFNs are the same
     * (i.e., only permissions differ), there is no need to free the
     * original PTE.
     */
    if ( pte_is_valid(orig_pte) &amp;&amp;
         (!pte_is_valid(*entry) ||
         !mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte))) )
    {

I hope it would make more sense.

~ Oleksii
  </pre>
  </body>
</html>

--------------rzlY9FsOxvAFx0HJYCBTmL6T--

