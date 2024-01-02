Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A4B821DE4
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jan 2024 15:40:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660727.1030287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKfwI-0004S6-Uu; Tue, 02 Jan 2024 14:40:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660727.1030287; Tue, 02 Jan 2024 14:40:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKfwI-0004PR-RS; Tue, 02 Jan 2024 14:40:18 +0000
Received: by outflank-mailman (input) for mailman id 660727;
 Tue, 02 Jan 2024 14:40:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=11RI=IM=gmail.com=j.tretter@srs-se1.protection.inumbo.net>)
 id 1rKfwH-0004PL-Mq
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2024 14:40:17 +0000
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [2607:f8b0:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d71ed23e-a97c-11ee-9b0f-b553b5be7939;
 Tue, 02 Jan 2024 15:40:15 +0100 (CET)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-6dbdbf680d6so3456643a34.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jan 2024 06:40:15 -0800 (PST)
Received: from ?IPV6:2603:8080:a900:257c::1004?
 (2603-8080-a900-257c-0000-0000-0000-1004.res6.spectrum.com.
 [2603:8080:a900:257c::1004]) by smtp.gmail.com with ESMTPSA id
 r2-20020a056830134200b006dc0623b202sm1934543otq.73.2024.01.02.06.40.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jan 2024 06:40:13 -0800 (PST)
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
X-Inumbo-ID: d71ed23e-a97c-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704206414; x=1704811214; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:sender:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4ONLUtK4TlZmu94GP5gLzTnRTXIraKo+f2GaDY4sCHU=;
        b=CKtZ38ytPOQ+SF+90bR8QgrQQ3mKghWTf/edpMMvaZVpMzb/bKTOo+Zqgpqpj6KQKj
         XhgkHm/l3UcCxrYqSbciag1qL3KP/4XTWogEXqTYHqL44uQ8mjBEdqc/TB0zV0eUvM3z
         UbbxdhYknulGbfgtSsxplSclTMx2v/rnYVzsYBeZMkzCjGEuxoXoWKmel/oyMsUINV54
         0TuHquQRm1YtdoFNxQBSBm2QoaPXm7qipMK3fzn889iShst9FyHsbL8XF0pABG3l4RBo
         +yo69kmi4ja3QTqV6S9+viLonCelHz0k3jqWQ9LTHKWMBsrYpwUOsX1PDvUPetL2lsVA
         KfFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704206414; x=1704811214;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:sender:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4ONLUtK4TlZmu94GP5gLzTnRTXIraKo+f2GaDY4sCHU=;
        b=prX2E/t0ibK/XMa/0nFtNxhBFCnfZvsukZ7/EFtb2zCmnHKFch96P0wiUHHoTxi5Sd
         QrlG6aXTmGNOqmNlPWgJ/2c5WYzF9UAj8iGa1hqEiKVhLujmcnXr4zdtgg4AExFy8n7E
         4wYadzNXtPtKD7NlKF2E+UOu41l2BCgNV+2dp2EcEWLvLjl+6GbCQ11ZZ16rvu3dtIQe
         3APXjun3KiKxhW7kQH3a9T6QStN6YTt8C+CpA1Q99/q4ACtDgT0Nc6Uu0zsHUj4Deqmb
         PTHa/Jbl0nKe16pwvNLpjVEBUO+Hkn9mxbrWfYfM6dt3Rmm7reqDaw/6N0LigUJsSQQN
         R+gA==
X-Gm-Message-State: AOJu0YzfqoBVxsCFFyGe6LcktQv37MHTtndtOz9NH+l7At4zDxwSXl1B
	hPIm1Hhx1ULFu506vxOiqDA=
X-Google-Smtp-Source: AGHT+IFPVCme0Ogqf0jsAcCSjZLVKYqvVDpefFqDBd/0Z1IZ8nwiWjPPK+8PihzwcTGiMVNmBkDxUQ==
X-Received: by 2002:a05:6830:22e8:b0:6dc:17a:663e with SMTP id t8-20020a05683022e800b006dc017a663emr5959912otc.70.1704206413742;
        Tue, 02 Jan 2024 06:40:13 -0800 (PST)
Sender: Joe Tretter <joerg.tretter@gmail.com>
Content-Type: multipart/alternative;
 boundary="------------CGd0ViBKbw8it84gzjmsfZe0"
Message-ID: <6f81654d-ff07-44c0-a625-d8465e3ac0ed@gmail.com>
Date: Tue, 2 Jan 2024 08:42:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Possible bug in Xen
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <de8b87e2-a4a2-4e49-80f5-97c745f46500@gmail.com>
 <9cc86706-5791-4967-802c-3e665bc97804@citrix.com>
 <a0aa0326-398f-44a1-a5df-fde3e7fea138@gmail.com>
 <cd153225-5cef-4ff5-97e3-44e485c12305@citrix.com>
 <e787b9ba-7a30-4804-b64e-ef56c71f5ed3@gmail.com>
 <caf76de4-89f5-4ce4-b1e3-1de7a21325dc@citrix.com>
 <15ece71b-d1d1-49d8-b937-f697b50fac39@gmail.com>
 <1b1116d0-bbda-4fa3-ae41-321e69626641@citrix.com>
Content-Language: en-US
From: Joe Tretter <j.tretter@gmail.com>
In-Reply-To: <1b1116d0-bbda-4fa3-ae41-321e69626641@citrix.com>

This is a multi-part message in MIME format.
--------------CGd0ViBKbw8it84gzjmsfZe0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Happy New Year! I think it's time I send you an update:
I have spent a considerable amount of time trying to get the latest 
firmware working, but I find a way that does the job.
When I replaced the file with yours, the machine directly restarts on 
application of the firmware.
All ways I have tried either result in the firmware not being considered 
or the machine rebooting on application.
The machine is dual boot with Archlinux and on Archlinux, I have the 
latest firmware running.
I have reached out to the Qubes people for help getting the latest 
firmware working. I'll let you know when I succeed with that.

~Joe

On 12/19/23 11:00, Andrew Cooper wrote:
> On 19/12/2023 4:28 pm, Joe Tretter wrote:
>> On 12/19/23 10:05, Andrew Cooper wrote:
>>> Is it always the same test which fails, or is it random?
>> Which test fails seems to be random (see attached screenshot).
>>> Looking athttps://github.com/Tarsnap/scrypt  it's only a trivial piece
>>> of userspace crypto.
>>>
>>> The fact that running multiple instances makes it fail more easily
>>> points towards some kind of register handling issue, but the fact that
>>> it repros only under Xen, and even with eager-fpu (which isn't the
>>> default on AMD, sadly), is weird.
>>>
>>> Looking at the scrypt source, it has alternative routines for the AESNI
>>> and SHANI instruction groups.  However, because it's a Zen1, we don't
>>> have a useful way of filtering visible for PV dom0 userspace.
>>>
>>> First of all, can you get the exact CPU model and microcode version.
>>> `head /proc/cpuinfo` will be enough.  But while you're at it, can you
>>> include `xl dmesg` too just in case there's something obvious showing up
>>> there too.
>>>
>> I have attachted text files with the (full) cpuinfo and the dmesg.
> microcode    : 0x8001129
>
> That's 0x08001129 when not rendered brokenly, and the up-to-date version
> is 0x08001138 (which itself dates from 2019).
>
> If you can, get a firmware update.  Given that it's a Dell, there's a
> good chance it's already on LFVS/fwupd.  This is definitely the
> preferred option.
>
> If not, and you're willing to experiment in definitely unsupported
> territory, then move /lib/firmware/amd-ucode/microcode_amd_fam17h.bin
> sideways in dom0, and replace it with the attached SummitRidge-08001138
> file (it's important to still be named microcode_amd_fam17h.bin in the
> end), then rebuild the initrd and reboot.
>
> You already have ucode=scan on Xen's command line, so after the reboot
> you should see some messages about updating microcode too.
>
> Irritatingly, AMD don't put client microcode into linux-firmware, but
> there are various collections of blobs found in the wild online.  I've
> picked the one which I think is right for your CPU, and packaged it it
> appropriately for Xen.
>
>
> Anyway, I'm not sure if this will fix anything, but life is too short to
> be debugging stuff like this on out-of-date firmware/ucode.
>
> ~Andrew

--------------CGd0ViBKbw8it84gzjmsfZe0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html data-lt-installed="true">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body style="padding-bottom: 1px;">
    Happy New Year! I think it's time I send you an update:<br>
    I have spent a considerable amount of time trying to get the latest
    firmware working, but I find a way that does the job.<br>
    When I replaced the file with yours, the machine directly restarts
    on application of the firmware.<br>
    All ways I have tried either result in the firmware not being
    considered or the machine rebooting on application.<br>
    The machine is dual boot with Archlinux and on Archlinux, I have the
    latest firmware running.<br>
    I have reached out to the Qubes people for help getting the latest
    firmware working. I'll let you know when I succeed with that.<br>
    <br>
    ~Joe<br>
    <br>
    <div class="moz-cite-prefix">On 12/19/23 11:00, Andrew Cooper wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1b1116d0-bbda-4fa3-ae41-321e69626641@citrix.com">
      <pre class="moz-quote-pre" wrap="">On 19/12/2023 4:28 pm, Joe Tretter wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 12/19/23 10:05, Andrew Cooper wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Is it always the same test which fails, or is it random?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Which test fails seems to be random (see attached screenshot).
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Looking at <a class="moz-txt-link-freetext" href="https://github.com/Tarsnap/scrypt">https://github.com/Tarsnap/scrypt</a> it's only a trivial piece
of userspace crypto.

The fact that running multiple instances makes it fail more easily
points towards some kind of register handling issue, but the fact that
it repros only under Xen, and even with eager-fpu (which isn't the
default on AMD, sadly), is weird.

Looking at the scrypt source, it has alternative routines for the AESNI
and SHANI instruction groups.  However, because it's a Zen1, we don't
have a useful way of filtering visible for PV dom0 userspace.

First of all, can you get the exact CPU model and microcode version. 
`head /proc/cpuinfo` will be enough.  But while you're at it, can you
include `xl dmesg` too just in case there's something obvious showing up
there too.

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">I have attachted text files with the (full) cpuinfo and the dmesg.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
microcode    : 0x8001129

That's 0x08001129 when not rendered brokenly, and the up-to-date version
is 0x08001138 (which itself dates from 2019).

If you can, get a firmware update.  Given that it's a Dell, there's a
good chance it's already on LFVS/fwupd.  This is definitely the
preferred option.

If not, and you're willing to experiment in definitely unsupported
territory, then move /lib/firmware/amd-ucode/microcode_amd_fam17h.bin
sideways in dom0, and replace it with the attached SummitRidge-08001138
file (it's important to still be named microcode_amd_fam17h.bin in the
end), then rebuild the initrd and reboot.

You already have ucode=scan on Xen's command line, so after the reboot
you should see some messages about updating microcode too.

Irritatingly, AMD don't put client microcode into linux-firmware, but
there are various collections of blobs found in the wild online.  I've
picked the one which I think is right for your CPU, and packaged it it
appropriately for Xen.


Anyway, I'm not sure if this will fix anything, but life is too short to
be debugging stuff like this on out-of-date firmware/ucode.

~Andrew</pre>
    </blockquote>
    <br>
  </body>
  <lt-container></lt-container>
</html>

--------------CGd0ViBKbw8it84gzjmsfZe0--

