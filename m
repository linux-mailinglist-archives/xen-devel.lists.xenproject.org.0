Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A66BADF9C
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 17:50:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1134367.1472287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3ccg-0000pb-M3; Tue, 30 Sep 2025 15:50:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1134367.1472287; Tue, 30 Sep 2025 15:50:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3ccg-0000mT-Ix; Tue, 30 Sep 2025 15:50:38 +0000
Received: by outflank-mailman (input) for mailman id 1134367;
 Tue, 30 Sep 2025 15:50:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t+de=4J=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v3ccf-0000mN-L0
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 15:50:37 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3426e015-9e15-11f0-9809-7dc792cee155;
 Tue, 30 Sep 2025 17:50:35 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6318855a83fso11551732a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Sep 2025 08:50:35 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-67-38.play-internet.pl.
 [109.243.67.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b400709f036sm367795966b.35.2025.09.30.08.50.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Sep 2025 08:50:34 -0700 (PDT)
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
X-Inumbo-ID: 3426e015-9e15-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759247435; x=1759852235; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odH/q2GSGoLrrbzqk1O5I44g4duKuQG3XTNgt+lVlzo=;
        b=SgPNF8oxUaBRXzaarg8pCSqFnUDRonIwh7k+fiXhdwmJ7fWOt4Lt6xegcjh8MjRVIP
         FrO9r+Gm37v0NBhkaA53iv4n1hG9u2UMuHBIMi9KjCelZdPUliGxXCsTfS4d+wF5Nysu
         WxDjFzNial3zWgyoGHyX2NrUQsrePIqaYGrd/kfE3Tk+S7LtnzaTjKTxzG0lUa0P7Q0x
         a4DOaZ7w6Rx4yQlKGt5OrBwK6os7yVNrW6hhmfwtmnMztWc7YA9jabkZjpo+itCPH756
         ue8gD+W9X5HX/gUHE3kBMqsV7PnWWF9yxdH5JMSIEhX+RDG9WADUSOBjM9CJAPL9V99m
         DNfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759247435; x=1759852235;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=odH/q2GSGoLrrbzqk1O5I44g4duKuQG3XTNgt+lVlzo=;
        b=X58gbOFrmb+dzrZwu0AjJZl2rU+YIaB10PldPTuWwIbcWRdoSX3gfDTyjCtsseC9md
         uATV3mWG75+ydwO382RZls0vcxc8q2RmHApJ1nik8Hs24Fkd4nNqn/5jJcjDJsXWRZV7
         wA2o9KO4x4FB7bsrUQJxFPzGkziE0BIpLrKPQpYWin32uFEFbSRh7z2kyh5qlGiuPO/+
         JsA62z+1Ev2jhpcPM8c0hxCdg1RA8vy9JUu1vIyUy/0LNorwuMMmwuLsxOh/HZjQL7ND
         2Q9iMKDWmsjkMLtpeBdEjyGEZMS+9MYxJ63fmMEYSmPVbLq1fYvhRVsPPB0ihc/pIdGA
         eqtA==
X-Gm-Message-State: AOJu0Yzq09sxqHizrQhHN2rmjICk7/ky/zbczOKx09HHbt3iTMH+GYcW
	WWRJ4wNoWmeScNnBM3xZ7bbMrU3gfSuEbGQAb9kkUaELCb4dmCHK3zit
X-Gm-Gg: ASbGncvfOzyvmLTbC7nOPqj5SleikY/wk1OLv81dk67K9Imt/jswXPeOiR5pX7Ru0fG
	FvBSZbIRKqiLDRo2omkfAFMktIjqkf3TFtUIaaHhaHDI5Q6B2WM3LsrGi2+iDuA/5yKaNI4xUpz
	fZlUOpCNHWmYGVAkPY63dgbOyaCb/Di/QUtyexbxfridhZ2pMyrTu2xWTjNHxybBE/Ob5WoRL6o
	F3EYflYRZe8sH5iQ6klcwSnA5CoXnXG14XLKVOpzi/4TcYygfhrUm7rbe6DYhg+6Gcej5OoiNhx
	SOe2sPpHRgdHKnUzJHvAXl3d4nXgUuTx/VZXITANRIbnjUAhON2/rqAICWDkuDQk94vGCf5n05h
	DGinIGC4y1CSKQtSxXxA8dKc2Gq1E5gwv9k+nIPkSdPwRd7KkHBkhiIGahFq909YAEKSO9NL5gJ
	eeJ51lzuOhYhpmxCY2r3TG
X-Google-Smtp-Source: AGHT+IF6j++ao7mg+MEo2yPj1tSxFY9nd56GYOgI53dtEc4XMCzaE0bHH8iObyoMejB+GLhoX2HyxQ==
X-Received: by 2002:a17:907:9724:b0:b3e:1400:6cab with SMTP id a640c23a62f3a-b46e585cd82mr10862266b.17.1759247434791;
        Tue, 30 Sep 2025 08:50:34 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------r5uiVIgilOaa4Ja1F0UjuQvz"
Message-ID: <c76993f8-6f58-4d6d-8901-42bb5a098bc8@gmail.com>
Date: Tue, 30 Sep 2025 17:50:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] vpci/msix: improve handling of bogus MSI-X
 capabilities
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20250929084149.70560-1-roger.pau@citrix.com>
 <dfd39bbb-cefb-4d6a-b4cb-b3a787411fb8@gmail.com> <aNvRH-MWRMJuX9w5@Mac.lan>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <aNvRH-MWRMJuX9w5@Mac.lan>

This is a multi-part message in MIME format.
--------------r5uiVIgilOaa4Ja1F0UjuQvz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/30/25 2:46 PM, Roger Pau Monné wrote:
> On Mon, Sep 29, 2025 at 05:59:00PM +0200, Oleksii Kurochko wrote:
>> On 9/29/25 10:41 AM, Roger Pau Monne wrote:
>>> I've had the luck to come across a PCI card that exposes a MSI-X capability
>>> where the BIR of the vector and PBA tables points at a BAR that has 0 size.
>>>
>>> This doesn't play nice with the code in vpci_make_msix_hole(), as it would
>>> still use the address of such empty BAR (0) and attempt to crave a hole in
>>> the p2m.  This leads to errors like the one below being reported by Xen:
>>>
>>> d0v0 0000:22:00.0: existing mapping (mfn: 181c4300 type: 0) at 0 clobbers MSIX MMIO area
>>>
>>> And the device left unable to enable memory decoding due to the failure
>>> reported by vpci_make_msix_hole().
>>>
>>> Introduce checking in init_msix() to ensure the BARs containing the MSI-X
>>> tables are usable.  This requires checking that the BIR points to a
>>> non-empty BAR, and the offset and size of the MSI-X tables can fit in the
>>> target BAR.
>>>
>>> This fixes booting PVH dom0 on Supermicro AS -2126HS-TN severs with AMD
>>> EPYC 9965 processors.  The broken device is:
>>>
>>> 22:00.0 SATA controller: Advanced Micro Devices, Inc. [AMD] FCH SATA Controller [AHCI mode] (rev 93)
>>>
>>> There are multiple of those integrated controllers in the system, all
>>> broken in the same way.
>>>
>>> Signed-off-by: Roger Pau Monné<roger.pau@citrix.com>
>>> ---
>>> Cc: Stewart Hildebrand<stewart.hildebrand@amd.com>
>>> Cc: Jan Beulich<jbeulich@suse.com>
>>> Cc: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>>>
>>> While not strictly a bugfix, I consider this a worthy improvement so that
>>> PVH dom0 has a chance to boot on hardware that exposes such broken MSI-X
>>> capabilities.
>> Based on your commit description it looks like a bug as without it, for example,
>> SATA controller can't be used, right?
>>
>>>    Hence I think this change should be considered for inclusion
>>> into 4.21.  There a risk of regressing on hardware that was already working
>>> with PVH, but given enough testing that should be minimal.
>> We have some PVH tests in Xen’s GitLab CI, but I assume that isn’t enough?
> It's a very specific controller, which we don't seem to have any
> examples of in the lab.  The model is in the commit message.  Without
> this fix the device doesn't work as expected when used in PVH dom0
> mode.

Thanks for the explanation.

I think we should consider to have this in 4.21 as it is still a fix of bogus
behavior:
  Released-Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

~ Oleksii

--------------r5uiVIgilOaa4Ja1F0UjuQvz
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
    <div class="moz-cite-prefix">On 9/30/25 2:46 PM, Roger Pau Monné
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aNvRH-MWRMJuX9w5@Mac.lan">
      <pre wrap="" class="moz-quote-pre">On Mon, Sep 29, 2025 at 05:59:00PM +0200, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 9/29/25 10:41 AM, Roger Pau Monne wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">I've had the luck to come across a PCI card that exposes a MSI-X capability
where the BIR of the vector and PBA tables points at a BAR that has 0 size.

This doesn't play nice with the code in vpci_make_msix_hole(), as it would
still use the address of such empty BAR (0) and attempt to crave a hole in
the p2m.  This leads to errors like the one below being reported by Xen:

d0v0 0000:22:00.0: existing mapping (mfn: 181c4300 type: 0) at 0 clobbers MSIX MMIO area

And the device left unable to enable memory decoding due to the failure
reported by vpci_make_msix_hole().

Introduce checking in init_msix() to ensure the BARs containing the MSI-X
tables are usable.  This requires checking that the BIR points to a
non-empty BAR, and the offset and size of the MSI-X tables can fit in the
target BAR.

This fixes booting PVH dom0 on Supermicro AS -2126HS-TN severs with AMD
EPYC 9965 processors.  The broken device is:

22:00.0 SATA controller: Advanced Micro Devices, Inc. [AMD] FCH SATA Controller [AHCI mode] (rev 93)

There are multiple of those integrated controllers in the system, all
broken in the same way.

Signed-off-by: Roger Pau Monné<a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
---
Cc: Stewart Hildebrand<a class="moz-txt-link-rfc2396E" href="mailto:stewart.hildebrand@amd.com">&lt;stewart.hildebrand@amd.com&gt;</a>
Cc: Jan Beulich<a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
Cc: Oleksii Kurochko<a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

While not strictly a bugfix, I consider this a worthy improvement so that
PVH dom0 has a chance to boot on hardware that exposes such broken MSI-X
capabilities.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Based on your commit description it looks like a bug as without it, for example,
SATA controller can't be used, right?

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">  Hence I think this change should be considered for inclusion
into 4.21.  There a risk of regressing on hardware that was already working
with PVH, but given enough testing that should be minimal.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
We have some PVH tests in Xen’s GitLab CI, but I assume that isn’t enough?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
It's a very specific controller, which we don't seem to have any
examples of in the lab.  The model is in the commit message.  Without
this fix the device doesn't work as expected when used in PVH dom0
mode.</pre>
    </blockquote>
    <pre>Thanks for the explanation.

I think we should consider to have this in 4.21 as it is still a fix of bogus
behavior:
 Released-Acked-By: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

~ Oleksii
</pre>
  </body>
</html>

--------------r5uiVIgilOaa4Ja1F0UjuQvz--

