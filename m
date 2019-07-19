Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E38406E440
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 12:27:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoQ4J-0003NJ-Mx; Fri, 19 Jul 2019 10:24:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qfBs=VQ=gandi.net=nicolas.belouin@srs-us1.protection.inumbo.net>)
 id 1hoQ4H-0003NE-R0
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 10:24:49 +0000
X-Inumbo-ID: 6e7850af-aa0f-11e9-8980-bc764e045a96
Received: from gandi.net (unknown [217.70.182.73])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6e7850af-aa0f-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 10:24:47 +0000 (UTC)
Received: from diconico07.dev (unknown
 [IPv6:2001:4b98:beef:a:e7c:1fb4:ff55:f4a9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by gandi.net (Postfix) with ESMTPSA id 3D6FA160559;
 Fri, 19 Jul 2019 10:24:46 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <20190718215428.6727-1-george.dunlap@citrix.com>
 <854f62f4-000c-d090-320e-5097887e02b4@gandi.net>
 <643C0338-ACDB-4581-A16C-0DFCC22C7C07@citrix.com>
 <FBF82058-59FC-40B7-859C-A42D6756CC05@citrix.com>
 <3591522b-2724-61d5-3ab2-240f41a2e2ce@gandi.net>
 <595cd2a7-382b-0800-c6de-096c2317d5d0@citrix.com>
From: Nicolas Belouin <nicolas.belouin@gandi.net>
Message-ID: <7199d48d-cf68-e1a3-25cb-904f3a53c1c0@gandi.net>
Date: Fri, 19 Jul 2019 12:24:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <595cd2a7-382b-0800-c6de-096c2317d5d0@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] golang/xenlight: Add libxl_utils support
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: multipart/mixed; boundary="===============9047619658723022441=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.
--===============9047619658723022441==
Content-Type: multipart/alternative;
 boundary="------------D06294C5441A51F8A24C244F"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------D06294C5441A51F8A24C244F
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 7/19/19 12:09 PM, George Dunlap wrote:
> On 7/19/19 11:03 AM, Nicolas Belouin wrote:
>>
>> On 7/19/19 10:50 AM, George Dunlap wrote:
>>>> On Jul 19, 2019, at 9:47 AM, George Dunlap <george.dunlap@citrix.com> wrote:
>>>>
>>>>
>>>>
>>>>> On Jul 19, 2019, at 8:34 AM, Nicolas Belouin <nicolas.belouin@gandi.net> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 7/18/19 11:54 PM, George Dunlap wrote:
>>>>>> The Go bindings for libxl miss functions from libxl_utils, let's start
>>>>>> with the simple libxl_domid_to_name and its counterpart
>>>>>> libxl_name_to_domid.
>>>>>>
>>>>>> NB that C.GoString() will return "" if it's passed a NULL; see
>>>>>> https://github.com/golang/go/issues/32734#issuecomment-506835432
>>>>>>
>>>>>> Signed-off-by: Nicolas Belouin <nicolas.belouin@gandi.net>
>>>>>> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
>>>>>> ---
>>>>>> v3:
>>>>>> - Wire into build system
>>>>>> - Add reference to C.GoString() handling NULL to commit message
>>>>>>
>>>>>> Nicolas, could you test to see if this actually works for you?
>>>>> Tested it, it works.
>>>>>
>>>>> I must confess I do not use that import path as the new modules mechanism
>>>>> introduced in Go1.11 downloads and compile a versioned copy of every
>>>>> dependency per project, and this behavior is incompatible with the build
>>>>> system used here.
>>>> It’s possible that something fundamentally has changed, but I suspect that rather you don’t quite understand how the current build system is supposed to work.  (In which case a write-up in the tree would probably be useful.)
>>>>
>>>> Go has always insisted that there be no binary compatibility between versions; so it’s always been necessary to re-compile all your libraries when upgrading from (say) 1.8 to 1.9.  Which means that any useable distribution must also include all the source files necessary to recompile when you bump the version number.
>>>>
>>>> So the core mechanism of the “install” is actually to copy all the source files necessary into the right local directory such that the go compiler can find them; ATM this is /usr/share/gocode/golang.xenproject.org/xenlight
>>> Nit:  This of course should have a `src/` between `gocode/` and `golang.xenproject.org/`.
>>>
>>> NB also that this naming scheme was designed so that at some point in the future, we could actually host the xenlight packages at the URL provided.
>>>
>>>  -George
>>>
>> This new mechanism of modules is described here:
>> https://golang.org/cmd/go/#hdr-Modules__module_versions__and_more
>>
>> The module system is intended to supersede the GOPATH approach and
>> provide a way to get versioned dependencies, as such
>> it does not rely on GOPATH at all and doesn't use sources or compiled
>> packages present in GOPATH elements such as /usr/share/gocode
>> and systematically fetch (at the asked version) and compile a copy of
>> the dependency as it might be a different version from the one
>> in GOPATH.
>>
>> As far as I tried, I have been unable to build my module even with the
>> library installed.
>> I have to use xenbits.xen.org/git-http/xen.git/tools/golang/xenlight (or
>> one of its mirror) in order to build the module using the new
>> mechanism (the golang.xenproject.org/xenlight works when building with
>> modules mode disabled).
> I took a look at the module stuff when it came out, and I was never able
> to make sense of how it was supposed to work.
Basically it is the same idea than a python virtualenv with
|include-system-site-packages set to false: never use what is provided
by the system and download everything in the exact version the manifest
tells you to.
|
> <rant>On the whole, it seems they basically hate the idea of distro
> packages, and seem intent on breaking them whenever people manage to
> start to get them working.</rant>
Actually yes because they don't want to be bound to the version provided
by the distro (I will not enter the debate of whether it is a good thing
or not)

Nicolas

--------------D06294C5441A51F8A24C244F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <br>
    <div class="moz-cite-prefix">On 7/19/19 12:09 PM, George Dunlap
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:595cd2a7-382b-0800-c6de-096c2317d5d0@citrix.com">
      <pre class="moz-quote-pre" wrap="">On 7/19/19 11:03 AM, Nicolas Belouin wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

On 7/19/19 10:50 AM, George Dunlap wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On Jul 19, 2019, at 9:47 AM, George Dunlap <a class="moz-txt-link-rfc2396E" href="mailto:george.dunlap@citrix.com">&lt;george.dunlap@citrix.com&gt;</a> wrote:



</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">On Jul 19, 2019, at 8:34 AM, Nicolas Belouin <a class="moz-txt-link-rfc2396E" href="mailto:nicolas.belouin@gandi.net">&lt;nicolas.belouin@gandi.net&gt;</a> wrote:



On 7/18/19 11:54 PM, George Dunlap wrote:
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">The Go bindings for libxl miss functions from libxl_utils, let's start
with the simple libxl_domid_to_name and its counterpart
libxl_name_to_domid.

NB that C.GoString() will return "" if it's passed a NULL; see
<a class="moz-txt-link-freetext" href="https://github.com/golang/go/issues/32734#issuecomment-506835432">https://github.com/golang/go/issues/32734#issuecomment-506835432</a>

Signed-off-by: Nicolas Belouin <a class="moz-txt-link-rfc2396E" href="mailto:nicolas.belouin@gandi.net">&lt;nicolas.belouin@gandi.net&gt;</a>
Signed-off-by: George Dunlap <a class="moz-txt-link-rfc2396E" href="mailto:george.dunlap@citrix.com">&lt;george.dunlap@citrix.com&gt;</a>
---
v3:
- Wire into build system
- Add reference to C.GoString() handling NULL to commit message

Nicolas, could you test to see if this actually works for you?
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">Tested it, it works.

I must confess I do not use that import path as the new modules mechanism
introduced in Go1.11 downloads and compile a versioned copy of every
dependency per project, and this behavior is incompatible with the build
system used here.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">It’s possible that something fundamentally has changed, but I suspect that rather you don’t quite understand how the current build system is supposed to work.  (In which case a write-up in the tree would probably be useful.)

Go has always insisted that there be no binary compatibility between versions; so it’s always been necessary to re-compile all your libraries when upgrading from (say) 1.8 to 1.9.  Which means that any useable distribution must also include all the source files necessary to recompile when you bump the version number.

So the core mechanism of the “install” is actually to copy all the source files necessary into the right local directory such that the go compiler can find them; ATM this is /usr/share/gocode/golang.xenproject.org/xenlight
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Nit:  This of course should have a `src/` between `gocode/` and `golang.xenproject.org/`.

NB also that this naming scheme was designed so that at some point in the future, we could actually host the xenlight packages at the URL provided.

 -George

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
This new mechanism of modules is described here:
<a class="moz-txt-link-freetext" href="https://golang.org/cmd/go/#hdr-Modules__module_versions__and_more">https://golang.org/cmd/go/#hdr-Modules__module_versions__and_more</a>

The module system is intended to supersede the GOPATH approach and
provide a way to get versioned dependencies, as such
it does not rely on GOPATH at all and doesn't use sources or compiled
packages present in GOPATH elements such as /usr/share/gocode
and systematically fetch (at the asked version) and compile a copy of
the dependency as it might be a different version from the one
in GOPATH.

As far as I tried, I have been unable to build my module even with the
library installed.
I have to use xenbits.xen.org/git-http/xen.git/tools/golang/xenlight (or
one of its mirror) in order to build the module using the new
mechanism (the golang.xenproject.org/xenlight works when building with
modules mode disabled).
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I took a look at the module stuff when it came out, and I was never able
to make sense of how it was supposed to work.</pre>
    </blockquote>
    Basically it is the same idea than a python virtualenv with <code>include-system-site-packages
      set to false: never use what is provided<br>
      by the system and download everything in the exact version the
      manifest tells you to.<br>
    </code>
    <blockquote type="cite"
      cite="mid:595cd2a7-382b-0800-c6de-096c2317d5d0@citrix.com">
      <pre class="moz-quote-pre" wrap="">
&lt;rant&gt;On the whole, it seems they basically hate the idea of distro
packages, and seem intent on breaking them whenever people manage to
start to get them working.&lt;/rant&gt;</pre>
    </blockquote>
    Actually yes because they don't want to be bound to the version
    provided by the distro (I will not enter the debate of whether it is
    a good thing or not)<br>
    <br>
    Nicolas<br>
  </body>
</html>

--------------D06294C5441A51F8A24C244F--


--===============9047619658723022441==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9047619658723022441==--

