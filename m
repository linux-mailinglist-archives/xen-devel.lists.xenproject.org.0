Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C982E5D9
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 17:12:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL7tt-0004nu-DJ; Mon, 29 Apr 2019 15:09:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FxyF=S7=gmail.com=jlpoole56@srs-us1.protection.inumbo.net>)
 id 1hL7ts-0004nm-Lx
 for xen-devel@lists.xen.org; Mon, 29 Apr 2019 15:09:00 +0000
X-Inumbo-ID: b6d13a1e-6a90-11e9-843c-bc764e045a96
Received: from mail-pl1-x630.google.com (unknown [2607:f8b0:4864:20::630])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b6d13a1e-6a90-11e9-843c-bc764e045a96;
 Mon, 29 Apr 2019 15:08:59 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id y3so4367712plp.0
 for <xen-devel@lists.xen.org>; Mon, 29 Apr 2019 08:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=lPHCpW2ROTojZodPFKMqW5rxn6IwAUMeeLRt0lckMkU=;
 b=EXFe6dHNeuTXRZ+myjc31jiasCbOOFJZTlevjPy/lkSoRhdCoCGqzHpkJTzuxH+610
 02ZsboiAo6XBQQj8YXwdygs/JXpyfc8A0/q8kNkpMpxEG6Z8sCpngBraYL7KfAhEs0+o
 yeFFoXu8YcbkWHsTlH8lPnjvEmLGp5TRN+W3ytyHWeU8GhbylUCiRF+aKtoDrNcAvoXe
 ddIs0/8y+JfI0mKE4XdzxxLGIvdA0nVm9GpiSS9M9z90Qoj/XucBTWL4xxQfqJza1pbO
 TonwpKxJlxSB3MgtK+azjmPwZFj0FeESPCJimDzP27xRC9lkVlclZv96dC+l9X96nSOd
 V4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language;
 bh=lPHCpW2ROTojZodPFKMqW5rxn6IwAUMeeLRt0lckMkU=;
 b=UhHX2nb3FZc2hFDBITA9hZ53QcZBZYwM+0gb5Vz9xb9QDis0W8d00a7P10OdXewZ6b
 xhii6hmYTVNo3GOq+xzG2BwG23W9E4rk91Ypr4/sftSMrQxgXx695Xt1iAsUfUzb1oQm
 7/o1dyaaGdeXQcYhK77pmby2CiMRVovUrrmPOxgLzJw96nxSCuiN0wJ32DtI/6pPSdm5
 CWBydmxXaOwMwToTjjx4hDbuIIrw1767WHHu9s8jjWmPPWAVEWwPqlZxlzpbhkpKmhZH
 elx/QJtMsvR8F1UW7h5+Vw+T2Gp/H/K5UPSnoRg7wXEcb7tGa1DntGZkwVeRI+hsVH/G
 3gOg==
X-Gm-Message-State: APjAAAVyu4Ow5x5ZvMf/TKb5Cz6Q0TnptWaS+XgH/DoNSz67mYX/tuIO
 bIOADPjAtrT3rwKtn8zuTTxLlgFY
X-Google-Smtp-Source: APXvYqyYicUnoI7dfiW+kgVe48fPyh8XsNZ/aP0BweI7omPYC7D1WsN5R1HaUE03fG0eGxiZ1p/TTw==
X-Received: by 2002:a17:902:aa83:: with SMTP id
 d3mr20272134plr.108.1556550538040; 
 Mon, 29 Apr 2019 08:08:58 -0700 (PDT)
Received: from [192.168.1.2] (96-65-223-86-static.hfc.comcastbusiness.net.
 [96.65.223.86])
 by smtp.googlemail.com with ESMTPSA id m2sm14671813pfi.24.2019.04.29.08.08.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Apr 2019 08:08:57 -0700 (PDT)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20190322075941.bdf6i3veheiblwzs@MacBook-Air-de-Roger.local>
 <9f9c4a21-b426-f0fc-7c09-2f5d392b488c@gmail.com>
 <5C98F95C0200007800221B56@prv1-mh.provo.novell.com>
 <9288a3b8-8c59-c80f-68f3-14aaca9272d4@gmail.com>
 <5C99DD160200007800221D00@prv1-mh.provo.novell.com>
 <25b66cdf-94ad-6af1-de5f-e0f5369ae000@gmail.com>
 <5C9B30D002000078002220F5@prv1-mh.provo.novell.com>
 <1fccf915-9d0b-52ac-4d6d-df16194dabb0@gmail.com>
 <5C9B86FA0200007800222232@prv1-mh.provo.novell.com>
 <daff9af3-5008-42ac-1355-ca8ef94fadb5@gmail.com>
 <20190429120238.b4kjlmkpk5l2t6yb@Air-de-Roger>
From: "John L. Poole" <jlpoole56@gmail.com>
Message-ID: <f4f4007c-4643-aecf-6ab7-811c00156fca@gmail.com>
Date: Mon, 29 Apr 2019 08:08:33 -0700
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190429120238.b4kjlmkpk5l2t6yb@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen 4.12.0-rc Hangs Around masked ExtINT on CPU#
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: jlpoole56@gmail.com
Cc: Jan Beulich <JBeulich@suse.com>, xen-devel@lists.xen.org
Content-Type: multipart/mixed; boundary="===============3978920105339081176=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.
--===============3978920105339081176==
Content-Type: multipart/alternative;
 boundary="------------E8989E25E6CF240196060D32"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------E8989E25E6CF240196060D32
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/29/2019 5:02 AM, Roger Pau Monné wrote:
> On Tue, Apr 16, 2019 at 09:23:11AM -0700, John L. Poole wrote:
>> On 3/27/2019 7:21 AM, Jan Beulich wrote:
>>>>>> On 27.03.19 at 14:25, <jlpoole56@gmail.com> wrote:
>>>> On 3/27/2019 1:14 AM, Jan Beulich wrote:
>>>>>>>> On 26.03.19 at 18:21, <jlpoole56@gmail.com> wrote:
>>>>>> zeta /usr/local/src/xen # cat xen/.config |grep CONFIG_HVM
>>>>>> # CONFIG_HVM is not set
>>>>>> zeta /usr/local/src/xen #
>>>>>>
>>>>>> # tried 2 boot attempts
>>>>>> log at: https://pastebin.com/nL4BWJ6Y
>>>>>>
>>>>>> Hang points at lines:
>>>>> Thanks for trying anyway; one further possibility eliminated. Looking
>>>>> at the logs I've had another thought (wild guess again, so not really
>>>>> much hope): Could you try "mwait-idle=no"?
>>>>>
>>>> I modified man_xen.cfg by adding at the end the kernel parameter:
>>>>
>>>> mwait-idle=no
>>>>
>>>> Rebooted.
>>>> Result: hung:
>>> Thanks. I'm afraid I'm out of ideas for the moment.
>>>
>>> Jan
>>>
>>>
>> Jan,
>>
>> Recall, the Xen kernel successfully launched in 2017 when I first built
>> Xen in Gentoo, that was about version 4.7.1.  I had to launch it
>> from an EFI console.  I've tried to revert back to 4.7.1 and
>> build a kernel and I have found it too difficult as certain
>> dependencies have since been removed from Gentoo.
> Unless some of us can get our hands on one of such systems I think
> your best bet would be to try to bisect the changes between 4.7 and
> 4.8 if 4.7 was indeed working on your system.
>
> Note that you only need to build the Xen hypervisor (make xen) in
> order to bisect this issue, there's no need to build the tools at
> all, which is where almost all of the dependencies come from. The
> hypervisor is mostly standalone and only have dependencies on a
> couple of tools.
>
> Roger.
Thank you, Roger.

In Gentoo, there are two packages of xen and xen-tools which
tend to progress with the same release number. When
I try to go back an install a 4.7.x set, my compiler errors out
in the xen-tools  with:
"directive writing up to 39 bytes into a region of size between 17 and 37 "
so I suspect the advancement of my compiler is finding problems
my compiler of 2 years ago could not.

I'll try to if I can modify a xen 4.7.x package pointing to a recent 
xen-tools,
e.g. 4.12.0.  If that doesn't work, I'll try using a xen source from your
repository and hand compile.

Yes, be assured I did, at one time, build xen on this machine as I have
a couple of VMs on there that I depend upon and I have to confess
that during my upgrade I did not take the step to back-up the
working xen kernel.  So now I am effectively locked out from my
day-to-day resources on my atom VMs which has compounded the
exasperation I experience.  have been without my working data
set locked up in a Gentoo kernel VM because I cannot launch Dom0.
A very painful lesson learned: always back up the working kernel
and EFI files before undertaking an upgrade.

--------------E8989E25E6CF240196060D32
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/29/2019 5:02 AM, Roger Pau Monné
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20190429120238.b4kjlmkpk5l2t6yb@Air-de-Roger">
      <pre class="moz-quote-pre" wrap="">On Tue, Apr 16, 2019 at 09:23:11AM -0700, John L. Poole wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
On 3/27/2019 7:21 AM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">On 27.03.19 at 14:25, <a class="moz-txt-link-rfc2396E" href="mailto:jlpoole56@gmail.com">&lt;jlpoole56@gmail.com&gt;</a> wrote:
</pre>
              </blockquote>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">On 3/27/2019 1:14 AM, Jan Beulich wrote:
</pre>
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">On 26.03.19 at 18:21, <a class="moz-txt-link-rfc2396E" href="mailto:jlpoole56@gmail.com">&lt;jlpoole56@gmail.com&gt;</a> wrote:
</pre>
                  </blockquote>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">zeta /usr/local/src/xen # cat xen/.config |grep CONFIG_HVM
# CONFIG_HVM is not set
zeta /usr/local/src/xen #

# tried 2 boot attempts
log at: <a class="moz-txt-link-freetext" href="https://pastebin.com/nL4BWJ6Y">https://pastebin.com/nL4BWJ6Y</a>

Hang points at lines:
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">Thanks for trying anyway; one further possibility eliminated. Looking
at the logs I've had another thought (wild guess again, so not really
much hope): Could you try "mwait-idle=no"?

</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">I modified man_xen.cfg by adding at the end the kernel parameter:

mwait-idle=no

Rebooted.
Result: hung:
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Thanks. I'm afraid I'm out of ideas for the moment.

Jan


</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Jan,

Recall, the Xen kernel successfully launched in 2017 when I first built
Xen in Gentoo, that was about version 4.7.1.  I had to launch it
from an EFI console.  I've tried to revert back to 4.7.1 and
build a kernel and I have found it too difficult as certain
dependencies have since been removed from Gentoo.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Unless some of us can get our hands on one of such systems I think
your best bet would be to try to bisect the changes between 4.7 and
4.8 if 4.7 was indeed working on your system.

Note that you only need to build the Xen hypervisor (make xen) in
order to bisect this issue, there's no need to build the tools at
all, which is where almost all of the dependencies come from. The
hypervisor is mostly standalone and only have dependencies on a
couple of tools.

Roger.
</pre>
    </blockquote>
    <div class="moz-signature"><font size="2"><font face="Verdana">Thank
          you, Roger.</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana"><br>
        </font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">In
          Gentoo, there are two packages of xen and xen-tools which</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">tend
          to progress with the same release number. When</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">I try
          to go back an install a 4.7.x set, my compiler errors out<br>
        </font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">in
          the xen-tools  with:</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">"directive
          writing up to 39 bytes into a region of size between 17 and 37
          "</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">so I
          suspect the advancement of my compiler is finding problems</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">my
          compiler of 2 years ago could not.<br>
        </font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana"><br>
        </font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">I'll
          try to if I can modify a xen 4.7.x package pointing to a
          recent xen-tools,</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">e.g.
          4.12.0.  If that doesn't work, I'll try using a xen source
          from your</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">repository
          and hand compile.</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana"><br>
        </font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">Yes,
          be assured I did, at one time, build xen on this machine as I
          have</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">a
          couple of VMs on there that I depend upon and I have to
          confess</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">that
          during my upgrade I did not take the step to back-up the</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">working
          xen kernel.  So now I am effectively locked out from my</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">day-to-day
          resources on my atom VMs which has compounded the</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">exasperation
          I experience.  have been without my working data</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">set
          locked up in a Gentoo kernel VM because I cannot launch Dom0.</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">A
          very painful lesson learned: always back up the working kernel</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">and
          EFI files before undertaking an upgrade.<br>
        </font></font></div>
  </body>
</html>

--------------E8989E25E6CF240196060D32--


--===============3978920105339081176==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3978920105339081176==--

