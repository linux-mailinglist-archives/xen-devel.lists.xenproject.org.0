Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7B02C97E
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 17:05:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVdcQ-0001s4-8t; Tue, 28 May 2019 15:02:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NYoA=T4=gmail.com=jlpoole56@srs-us1.protection.inumbo.net>)
 id 1hVdcO-0001rz-Jb
 for xen-devel@lists.xen.org; Tue, 28 May 2019 15:02:24 +0000
X-Inumbo-ID: 98c41fc7-8159-11e9-8980-bc764e045a96
Received: from mail-pf1-x444.google.com (unknown [2607:f8b0:4864:20::444])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 98c41fc7-8159-11e9-8980-bc764e045a96;
 Tue, 28 May 2019 15:02:23 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id n19so11670875pfa.1
 for <xen-devel@lists.xen.org>; Tue, 28 May 2019 08:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=cEMi0k3Rp2/gd4C2ahekel3L8jyRIQdDWOCRLQNkGTY=;
 b=KlYXMLGa4dRIkqya3EDEg1BT7gxnIus13dxdAR15TBJp7qbrzgg2b4T6GqSWoP1Vq+
 f2T+LBztWYm2T5ayAwlemMU4a/9CS9uxd22R9y7+T7G/YAISSAg1SBl6VlPruaB3pdu+
 58FKaExFziWFZcoe73AbOI1xiOCL/cH6PjrGofVjlXWEaf6OtUTeJx/e+bcvp9/3hdhf
 066cCHrxH8r5mqg0cT1m9PBbH0gvSj+LvQ62BTS+TNKn+9yL7JE1JZkjSejbECpEZUXQ
 eRVFOhcDGR4/PPNgA5CcD84GNyrOSNpUZZNJiGlxGpQgcdNgFJVVDPJMDo21aydmNuRP
 6G7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language;
 bh=cEMi0k3Rp2/gd4C2ahekel3L8jyRIQdDWOCRLQNkGTY=;
 b=tfMbK0OoTRv+XEo4WGy9vQVZT/iprqCaKJNF54sz+mSxyeyXYs22g/ye5S8UKuEyt+
 XnV4T3m8Au+pag5jIdqa6ZXfZQL49CQ7v90a9vnoHcDCMtu8GA1HYiIeX1UaJufxKIVx
 jlnBep+jlEkiJzRyq1fi82LSPluM1V/HMnfFcbGnwrSpuJ5p1em/Jjt2zZztqvkVf4ry
 8/B5yPgXXXqxJtIHgIEMgHDwtY9/dwPrnyof5LjEC6VDOt2RCcr6ro6AEpP0DbIQorTw
 3MHMXy+4VeZEI99d5P2mG4wY/GXCJ20Wwj1bnmkVcpHmTMWFMP6ISwcQiT3WskYryoxg
 rgrA==
X-Gm-Message-State: APjAAAXWScCybfVSk52svEMlJUWp3Nk6SnN27FrkdM7zMabZs3BhZAEG
 ySus50uu/ZpnS0PLoYuuxdbRxsGM
X-Google-Smtp-Source: APXvYqzb5hw6ElgeNWpjLZz3HQB0ncppHXf5uQZyrz41WGs8lCBb4RWZUASTDQTQROocgB0l8UpWmw==
X-Received: by 2002:a65:418d:: with SMTP id a13mr2412860pgq.332.1559055741992; 
 Tue, 28 May 2019 08:02:21 -0700 (PDT)
Received: from [192.168.1.2] (96-65-223-86-static.hfc.comcastbusiness.net.
 [96.65.223.86])
 by smtp.googlemail.com with ESMTPSA id e16sm2970063pjp.16.2019.05.28.08.02.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 May 2019 08:02:21 -0700 (PDT)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <25b66cdf-94ad-6af1-de5f-e0f5369ae000@gmail.com>
 <5C9B30D002000078002220F5@prv1-mh.provo.novell.com>
 <1fccf915-9d0b-52ac-4d6d-df16194dabb0@gmail.com>
 <5C9B86FA0200007800222232@prv1-mh.provo.novell.com>
 <daff9af3-5008-42ac-1355-ca8ef94fadb5@gmail.com>
 <20190429120238.b4kjlmkpk5l2t6yb@Air-de-Roger>
 <f4f4007c-4643-aecf-6ab7-811c00156fca@gmail.com>
 <20190429152734.qy34zz56e43pawvf@Air-de-Roger>
 <20190527161832.arry25rh4chyxkio@Air-de-Roger>
 <b00833f8-22a2-3f1e-65f6-7a4178377ee1@gmail.com>
 <20190528074113.4o7e4did46e4yymb@Air-de-Roger>
From: "John L. Poole" <jlpoole56@gmail.com>
Message-ID: <7dc6fc80-8204-9cf7-25fd-87e1bddacf8e@gmail.com>
Date: Tue, 28 May 2019 08:02:22 -0700
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190528074113.4o7e4did46e4yymb@Air-de-Roger>
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
Content-Type: multipart/mixed; boundary="===============2178899756295332199=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.
--===============2178899756295332199==
Content-Type: multipart/alternative;
 boundary="------------0599D36274BDEB0F89C51F49"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------0599D36274BDEB0F89C51F49
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/28/2019 12:41 AM, Roger Pau Monné wrote:
> On Mon, May 27, 2019 at 03:35:21PM -0700, John L. Poole wrote:
>> On 5/27/2019 9:18 AM, Roger Pau Monné wrote:
>>> On Mon, Apr 29, 2019 at 05:27:34PM +0200, Roger Pau Monné wrote:
>>>> IMO it would be better if you can build directly from the upstream git
>>>> repository [0], that way you could use git-bisect(1) in order to figure
>>>> out which commit broke your system. For example:
>>>>
>>>> # git clone git://xenbits.xen.org/xen.git
>>>> # cd xen
>>>> # git checkout RELEASE-4.7.0
>>>> # make xen -j8
>>>>
>>>> That should give you a set of Xen binaries in the xen/ directory, IIRC
>>>> you are booting from EFI so you likely need xen/xen.efi.
>>>>
>>>> If that works, then you can test RELEASE-4.8.0 and if that fails to
>>>> boot you should have a range of commits that you can bisect in order
>>>> to find the culprit.
>>> FWIW, I've been unable to find a box with the same CPU model (C2750)
>>> that you are using. I've found a couple of old Atom boxes using
>>> different CPUs but they all seem to boot fine using latest
>>> xen-unstable. I've looked on eBay for that CPU but everything
>>> containing it is server-grade and >200$ which I'm sadly not going to
>>> pay.
>>>
>>> Unless you are able to bisect the tree and give us the bad commit
>>> that's causing your issues I'm afraid at least myself I won't be able
>>> to progress this any further, sorry.
>>>
>>> Roger.
>> I attempted to work backwards and ran into a nightmare with Gentoo.   I kept
>> getting compiler errors which I suspect was a result of having a newer
>> version
>> of GCC and other things.  It's not an easy thing to travel
>> back in time in Gentoo because everything keeps getting upgraded.  I just
>> cannot make the time now to unravel this as I have some demands on my time
>> and will be engaged for the next four to six weeks.
> IMO your best bet is to build Xen using Debian stretch, that's used by
> the Xen test system, and is likely to be able to build the different
> Xen versions, stable-* branches tested by osstest should build on
> stretch.
>
> What I've done in the past if that also triggers compiler errors is to
> build a chroot with an older version of Debian and then build Xen
> inside of it. You can do this in a box different from the one you are
> testing, ie: you could create a Debian VM and build Xen from there.
>
> Note that in order to bisect this issue you only need to build the Xen
> kernel (make xen, no need to run ./configure), there's no need to
> build the tools, hence you need almost no dependencies installed on
> the builder.
>
> I've done a build of the stable-4.7 branch myself and uploaded the
> hypervisor binaries to:
>
> http://xenbits.xen.org/people/royger/stable-4.7/
>
> Could you give those a try (I wasn't sure whether you need xen.gz or
> xen.efi so I've uploaded both) and see if you still have issues
> booting?
>
> Testing those binaries should be as simple as placing them in /boot/
> and fixing your bootloader configuration to boot from those. Please
> send the serial log when booting from the provided binaries.
>
>> How much would it cost for you to obtain the machine you need? I may
>> consider paying for it. I bought this Atom server just to economically run
>> Xen so the machine has marginal value to me if I cannot run Xen on it.
> Even if we go that route, there's no guarantee that I would be able to
> fix the issue, and there's also the possibility that the hardware you
> have is somehow broken, and that the new one won't exhibit this issue.
>
> Roger.
Roger,

You have given me an idea.  I have several VMs on my hard disk that are not
backed up.  So, I think what I'll do is remove the current hard disk and 
place
a fresh hard disk in and then try to install a Debian based Xen anew so I
do not risk altering my Gentoo-based hard disk.  This approach should free
me from the entanglement of a bleeding edge distribution, e.g. Gentoo.

I was looking back at my notes.  I acquired this Atom-based server in 
November
of 2016 and installed the Debian Xen to test and it worked.  So I then 
installed
Gentoo and ran into problems with GRUB.  I learned that GRUB was not yet 
ready
to support EFI and Xen, so I used the manual method to drop into an EFI 
shell
and launch my DOM0 instance.  I later tried to upgrade the kernel and 
ran into
problems and aborted an upgrade, I just kept what I had working since I had
already created some Gentoo-based VMs.  During my build process, I had
run into an issue "coff-x86-64 pe-x86-64" which Jan Beulich had assisted 
on and
determined was something worth of the attention of the "binutils folks."

I'll attempt the hard disk swap in a few days after I receive a shipment 
of the new disk.

Thank you,
John



--------------0599D36274BDEB0F89C51F49
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/28/2019 12:41 AM, Roger Pau Monné
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20190528074113.4o7e4did46e4yymb@Air-de-Roger">
      <pre class="moz-quote-pre" wrap="">On Mon, May 27, 2019 at 03:35:21PM -0700, John L. Poole wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
On 5/27/2019 9:18 AM, Roger Pau Monné wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Mon, Apr 29, 2019 at 05:27:34PM +0200, Roger Pau Monné wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">IMO it would be better if you can build directly from the upstream git
repository [0], that way you could use git-bisect(1) in order to figure
out which commit broke your system. For example:

# git clone git://xenbits.xen.org/xen.git
# cd xen
# git checkout RELEASE-4.7.0
# make xen -j8

That should give you a set of Xen binaries in the xen/ directory, IIRC
you are booting from EFI so you likely need xen/xen.efi.

If that works, then you can test RELEASE-4.8.0 and if that fails to
boot you should have a range of commits that you can bisect in order
to find the culprit.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">FWIW, I've been unable to find a box with the same CPU model (C2750)
that you are using. I've found a couple of old Atom boxes using
different CPUs but they all seem to boot fine using latest
xen-unstable. I've looked on eBay for that CPU but everything
containing it is server-grade and &gt;200$ which I'm sadly not going to
pay.

Unless you are able to bisect the tree and give us the bad commit
that's causing your issues I'm afraid at least myself I won't be able
to progress this any further, sorry.

Roger.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">I attempted to work backwards and ran into a nightmare with Gentoo.   I kept
getting compiler errors which I suspect was a result of having a newer
version
of GCC and other things.  It's not an easy thing to travel
back in time in Gentoo because everything keeps getting upgraded.  I just
cannot make the time now to unravel this as I have some demands on my time
and will be engaged for the next four to six weeks.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
IMO your best bet is to build Xen using Debian stretch, that's used by
the Xen test system, and is likely to be able to build the different
Xen versions, stable-* branches tested by osstest should build on
stretch.

What I've done in the past if that also triggers compiler errors is to
build a chroot with an older version of Debian and then build Xen
inside of it. You can do this in a box different from the one you are
testing, ie: you could create a Debian VM and build Xen from there.

Note that in order to bisect this issue you only need to build the Xen
kernel (make xen, no need to run ./configure), there's no need to
build the tools, hence you need almost no dependencies installed on
the builder.

I've done a build of the stable-4.7 branch myself and uploaded the
hypervisor binaries to:

<a class="moz-txt-link-freetext" href="http://xenbits.xen.org/people/royger/stable-4.7/">http://xenbits.xen.org/people/royger/stable-4.7/</a>

Could you give those a try (I wasn't sure whether you need xen.gz or
xen.efi so I've uploaded both) and see if you still have issues
booting?

Testing those binaries should be as simple as placing them in /boot/
and fixing your bootloader configuration to boot from those. Please
send the serial log when booting from the provided binaries.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">How much would it cost for you to obtain the machine you need? I may
consider paying for it. I bought this Atom server just to economically run
Xen so the machine has marginal value to me if I cannot run Xen on it.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Even if we go that route, there's no guarantee that I would be able to
fix the issue, and there's also the possibility that the hardware you
have is somehow broken, and that the new one won't exhibit this issue.

Roger.
</pre>
    </blockquote>
    <div class="moz-signature"><font size="2"><font face="Verdana">Roger,</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana"><br>
        </font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">You
          have given me an idea.  I have several VMs on my hard disk
          that are not</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">backed
          up.  So, I think what I'll do is remove the current hard disk
          and place</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">a
          fresh hard disk in and then try to install a Debian based Xen
          anew so I</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">do
          not risk altering my Gentoo-based hard disk.  This approach
          should free</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">me
          from the entanglement of a bleeding edge distribution, e.g.
          Gentoo.<br>
        </font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana"><br>
        </font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">I was
          looking back at my notes.  I acquired this Atom-based server
          in November</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">of
          2016 and installed the Debian Xen to test and it worked.  So I
          then installed</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">Gentoo
          and ran into problems with GRUB.  I learned that GRUB was not
          yet ready</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">to
          support EFI and Xen, so I used the manual method to drop into
          an EFI shell</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">and
          launch my DOM0 instance.  I later tried to upgrade the kernel
          and ran into</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">problems
          and aborted an upgrade, I just kept what I had working since I
          had</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">already
          created some Gentoo-based VMs.  During my build process, I had</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">run
          into an issue "</font></font>coff-x86-64 pe-x86-64<font
        size="2"><font face="Verdana">" which Jan Beulich had assisted
          on and</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">determined
          was something worth of the attention of the "binutils folks."</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana"><br>
        </font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">I'll
          attempt the hard disk swap in a few days after I receive a
          shipment of the new disk.</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana"><br>
        </font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">Thank
          you,</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">John</font></font><br>
      <p><font size="2" face="Verdana">
          <br>
        </font></p>
    </div>
  </body>
</html>

--------------0599D36274BDEB0F89C51F49--


--===============2178899756295332199==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2178899756295332199==--

