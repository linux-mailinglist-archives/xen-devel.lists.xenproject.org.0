Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A562D2F1
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 02:53:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVmml-00087n-5W; Wed, 29 May 2019 00:49:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PiYs=T5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hVmmj-00087i-9y
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 00:49:41 +0000
X-Inumbo-ID: a2e19958-81ab-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a2e19958-81ab-11e9-8980-bc764e045a96;
 Wed, 29 May 2019 00:49:38 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: k7a23iFshuU7XbgUqYSSVHauixk/GxHMw2B89GbJipzUNSIIVjuP4jkvjCWn3sZK4WzooWkEz5
 KCMjNe8rMTBYjXTFb/QHGoxs0KNymamEka5cuNz2fDWf4eBfxn0V98t6oC4xh2Kfa64MZs1Jg4
 iT5tSDynKcd4KkgsLPV8oHhYe1pGHRlxA1pYRwujHViC3u+oYiS8k2p3iOKzFHjv3j2UfwGtKq
 fLZ/iaEzvsy6YpFMpEDVEJKghasM8siGdGQAkI9MWgPtfEyWmGki1/dJsmk+vaLqYppaKkO7QX
 83I=
X-SBRS: 2.7
X-MesageID: 1023089
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,525,1549947600"; d="scan'208,217";a="1023089"
To: Mathieu Tarral <mathieu.tarral@protonmail.com>
References: <f3zRvkN8JOfpv5k6jz7TbWXz-sso4q6CGB-3S05mSco8SuDy0BoN5z5_Lj_-Xnto1FPMCkhE89trkq-_f6itwRZ5F4NI9MKrcqZk8cdT45A=@protonmail.com>
 <76bd924a-34b1-eb7c-d3be-6c33aa7729fc@citrix.com>
 <WL45-Mjyf7to-l_u4XAT3M46R6YcAECvEwl6SDzOWeLE_SOQUyF26Vj2cu0mScD47fS95OaBAWDddX7DL7yujvl03YffFRDoqrpRcFDSnxA=@protonmail.com>
 <oSx3iO5YqwrWedfgCT8yEj4jGrzisHnNA6d9XQIKAJJAOhr6TPANrqVHf6s56L8_WBgLtVMJv37Cypbr2emtg0ZKb25HdHo91eM1J1fVJHo=@protonmail.com>
 <4f34ed81-8993-2e5d-9aea-89a6e2d98b44@citrix.com>
 <rQKAjmE5sqmoHfveLrCC3tRz7edgAIkDUG5CRgmBhF975OXX_8ZdIsCFturwHzr04jeYiq5MPE5gHG3SeltMz5ZnrIs0XcO0QO_OXeBGhTg=@protonmail.com>
 <cf45071e-19dd-7afb-b9cf-55bb425d0908@citrix.com>
 <VDYDkg9Ke3s5AvTA6Dxcn9OU8vKyA-VlOf0K5B_IRIQs0F9B-XSWYjDPcQ-_TIe3qbVy410qpk5cIcL6KXYJAIr31L2qAr1ryodOkQSiUvk=@protonmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <0b97ca78-81f3-a45e-a651-05d2a420dc83@citrix.com>
Date: Tue, 28 May 2019 17:49:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <VDYDkg9Ke3s5AvTA6Dxcn9OU8vKyA-VlOf0K5B_IRIQs0F9B-XSWYjDPcQ-_TIe3qbVy410qpk5cIcL6KXYJAIr31L2qAr1ryodOkQSiUvk=@protonmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [VMI] Possible race-condition in altp2m APIs
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas@tklengyel.com>
Content-Type: multipart/mixed; boundary="===============7111590664273602694=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7111590664273602694==
Content-Type: multipart/alternative;
	boundary="------------C88889B6C5BF0B0175138F7E"
Content-Language: en-GB

--------------C88889B6C5BF0B0175138F7E
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 28/05/2019 13:33, Mathieu Tarral wrote:
> Hi Andrew,
>
>>> The bug is still here, so we can exclude a microcode issue.
>> Good - that is one further angle excluded.  Always make sure you are
>> running with up-to-date microcode, but it looks like we back to
>> investigating a logical bug in libvmi or Xen.
>
> I reimplemented a small test, without the Drakvuf/Libvmi layers, that will inject traps on one API in Windows (NtCreateUserProcess),
> in the same way that Drakvuf does.
>
> I did some quick testing yesterday, with a Python script that was repeatedly
> starting the binary to monitor the API, and at the same time starting Ansible
> to run "c:\Windows\system32\reg.exe /?" via WinRM, to trigger some process creation.
>
> The traps are working, I see the software breakpoint hit, switching to the default
> view for singlestepping, and switching back to the execution view, so that's already good.
>
> After a series of tests on 1 or 4 VCPUs, my domain end up in 2 possible states:
> - frozen: the mouse doesn't move: so I would guess the VCPU are blocked.
>
> I'm calling the xc_(un)pause_domain APIs multiple times when I write to the shadow copies,
> but It's always synchronous, so I doubt that they interfered and "paused" the domain.

xc_{,un}pause_domain() calls are reference counted.  Calling unpause too
many times should be safe (from a refcount point of view), and should
fail the hypercall with -EINVAL.

>
> Also, the log output I have before I detect that Ansible failed to execute is that the resume succeded and
> Xen is ready to process VMI events.
>
> - BSOD: that's the second possibility, apparently I'm corrupting critical data structure in the operating system,
> and the Windbg analysis is inconclusive, so I can't tell much.
>
> Either way, I can't execute this test sequentially 10 000 times without a crash.

Ok good - this is a far easier place to start debugging from.

> -> Could you look at the implementation, and tell me if I misused the APIs somewhere ?
> https://gist.github.com/mtarral/d99ce5524cfcfb5290eaa05702c3e8e7

Some observations.

1)  In xen_pause_vm(), you do an xc_domain_getinfo().  First of all, the
API is crazy, so you also need to check "|| info.domid != domid" in your
error condition, but that shouldn't be an issue here as the domid isn't
changing. 

Furthermore, the results of xc_domain_getinfo() are stale before the
hypercall returns, so it is far less useful than it appears.

I'm afraid that the only safe way to issue pause/unpauses is to know
that you've reference counted your own correctly.  All entities in dom0
with privilege can fight over each others references, because there is
nothing Xen can use to distinguish the requests.

2) You allocate a libxl context but do nothing with it.  That can all
go, along with the linkage against libxl.  Also, you don't need to
create a logger like that.  Despite being utterly unacceptable behaviour
for a library, it is the default by passing NULL in xc_interface_open().

3) A malloc()/memset() pair is more commonly spelt calloc()


And some questions.

1) I'm guessing the drakvuf_inject_trap(drakvuf, 0x293e6a0, 0) call is
specific to the exact windows kernel in use?

2) In vmi_init(), what is the purpose of fmask and zero_page_gfn?  You
add one extra gfn to the guest, called zero_page, and fill it with 1's
from fmask.

3) You create two altp2m's, but both have the same default access.  Is
this deliberate, or a bug?  If deliberate, why?

Finally, and probably the source of the memory corruption...

4) When injecting a trap, you allocate a new gfn, memcpy() the contents
and insert a 0xcc (so far so good).  You then remap the executable view
to point at the new gfn with a breakpoint in (fine), and remap the
readable view to point at the zero_page, which is full of 1's (uh-oh).

What is this final step trying to achieve?  It guarantees that
patch-guard will eventually notice and BSOD your VM for critical
structure corruption.  The read-only view needs to point to the original
gfn with only read permissions, so when Windows reads the gfn back, it
sees what it expects.  You also need to prohibit writes to either gfn so
you can spot writes (unlikely in this case but important for general
introspection) so you can propagate the change to both copies.

>
> I used the compat APIs, like Drakvuf does.
>
> @Tamas, if you could check the traps implementation.
>
> You also have stress-test.py, which is the small test suite that I used, and
> the screenshot showing the stdout preceding a test failure,
> when Ansible couldn't contact WinRM service because the domain was frozen.
>
> Note: I stole some code from libvmi, to handle page read/write in Xen.
>
> PS: in the case where the domain is frozen, and I destroy the domain, a (null) entry will remain
> in xl list, despite that my stress-test.py process is already dead.
>
> I have 4 of these entries in my xl list right now.

That's almost certainly a reference not being dropped on a page.  Can
you run `xl debug-keys q` and paste the resulting analysis which will be
visible in `xl dmesg`?

It is probably some missing cleanup in the altp2m code.

~Andrew

--------------C88889B6C5BF0B0175138F7E
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 28/05/2019 13:33, Mathieu Tarral
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:VDYDkg9Ke3s5AvTA6Dxcn9OU8vKyA-VlOf0K5B_IRIQs0F9B-XSWYjDPcQ-_TIe3qbVy410qpk5cIcL6KXYJAIr31L2qAr1ryodOkQSiUvk=@protonmail.com">
      <pre class="moz-quote-pre" wrap="">Hi Andrew,

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">The bug is still here, so we can exclude a microcode issue.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Good - that is one further angle excluded.  Always make sure you are
running with up-to-date microcode, but it looks like we back to
investigating a logical bug in libvmi or Xen.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

I reimplemented a small test, without the Drakvuf/Libvmi layers, that will inject traps on one API in Windows (NtCreateUserProcess),
in the same way that Drakvuf does.

I did some quick testing yesterday, with a Python script that was repeatedly
starting the binary to monitor the API, and at the same time starting Ansible
to run "c:\Windows\system32\reg.exe /?" via WinRM, to trigger some process creation.

The traps are working, I see the software breakpoint hit, switching to the default
view for singlestepping, and switching back to the execution view, so that's already good.

After a series of tests on 1 or 4 VCPUs, my domain end up in 2 possible states:
- frozen: the mouse doesn't move: so I would guess the VCPU are blocked.

I'm calling the xc_(un)pause_domain APIs multiple times when I write to the shadow copies,
but It's always synchronous, so I doubt that they interfered and "paused" the domain.</pre>
    </blockquote>
    <br>
    xc_{,un}pause_domain() calls are reference counted.  Calling unpause
    too many times should be safe (from a refcount point of view), and
    should fail the hypercall with -EINVAL.<br>
    <br>
    <blockquote type="cite"
cite="mid:VDYDkg9Ke3s5AvTA6Dxcn9OU8vKyA-VlOf0K5B_IRIQs0F9B-XSWYjDPcQ-_TIe3qbVy410qpk5cIcL6KXYJAIr31L2qAr1ryodOkQSiUvk=@protonmail.com">
      <pre class="moz-quote-pre" wrap="">

Also, the log output I have before I detect that Ansible failed to execute is that the resume succeded and
Xen is ready to process VMI events.

- BSOD: that's the second possibility, apparently I'm corrupting critical data structure in the operating system,
and the Windbg analysis is inconclusive, so I can't tell much.

Either way, I can't execute this test sequentially 10 000 times without a crash.</pre>
    </blockquote>
    <br>
    Ok good - this is a far easier place to start debugging from.<br>
    <br>
    <blockquote type="cite"
cite="mid:VDYDkg9Ke3s5AvTA6Dxcn9OU8vKyA-VlOf0K5B_IRIQs0F9B-XSWYjDPcQ-_TIe3qbVy410qpk5cIcL6KXYJAIr31L2qAr1ryodOkQSiUvk=@protonmail.com">
      <pre class="moz-quote-pre" wrap="">-&gt; Could you look at the implementation, and tell me if I misused the APIs somewhere ?
<a class="moz-txt-link-freetext" href="https://gist.github.com/mtarral/d99ce5524cfcfb5290eaa05702c3e8e7">https://gist.github.com/mtarral/d99ce5524cfcfb5290eaa05702c3e8e7</a></pre>
    </blockquote>
    <br>
    Some observations.<br>
    <br>
    1)  In xen_pause_vm(), you do an xc_domain_getinfo().  First of all,
    the API is crazy, so you also need to check "|| info.domid != domid"
    in your error condition, but that shouldn't be an issue here as the
    domid isn't changing.  <br>
    <br>
    Furthermore, the results of xc_domain_getinfo() are stale before the
    hypercall returns, so it is far less useful than it appears.<br>
    <br>
    I'm afraid that the only safe way to issue pause/unpauses is to know
    that you've reference counted your own correctly.  All entities in
    dom0 with privilege can fight over each others references, because
    there is nothing Xen can use to distinguish the requests.<br>
    <br>
    2) You allocate a libxl context but do nothing with it.  That can
    all go, along with the linkage against libxl.  Also, you don't need
    to create a logger like that.  Despite being utterly unacceptable
    behaviour for a library, it is the default by passing NULL in
    xc_interface_open().<br>
    <br>
    3) A malloc()/memset() pair is more commonly spelt calloc()<br>
    <br>
    <br>
    And some questions.<br>
    <br>
    1) I'm guessing the <span class="pl-c1">drakvuf_inject_trap</span>(drakvuf,
    <span class="pl-c1">0x293e6a0</span>, <span class="pl-c1">0</span>)
    call is specific to the exact windows kernel in use?<br>
    <br>
    2) In vmi_init(), what is the purpose of fmask and zero_page_gfn? 
    You add one extra gfn to the guest, called zero_page, and fill it
    with 1's from fmask.<br>
    <br>
    3) You create two altp2m's, but both have the same default access. 
    Is this deliberate, or a bug?  If deliberate, why?<br>
    <br>
    Finally, and probably the source of the memory corruption...<br>
    <br>
    4) When injecting a trap, you allocate a new gfn, memcpy() the
    contents and insert a 0xcc (so far so good).  You then remap the
    executable view to point at the new gfn with a breakpoint in (fine),
    and remap the readable view to point at the zero_page, which is full
    of 1's (uh-oh).<br>
    <br>
    What is this final step trying to achieve?  It guarantees that
    patch-guard will eventually notice and BSOD your VM for critical
    structure corruption.  The read-only view needs to point to the
    original gfn with only read permissions, so when Windows reads the
    gfn back, it sees what it expects.  You also need to prohibit writes
    to either gfn so you can spot writes (unlikely in this case but
    important for general introspection) so you can propagate the change
    to both copies.<br>
    <br>
    <blockquote type="cite"
cite="mid:VDYDkg9Ke3s5AvTA6Dxcn9OU8vKyA-VlOf0K5B_IRIQs0F9B-XSWYjDPcQ-_TIe3qbVy410qpk5cIcL6KXYJAIr31L2qAr1ryodOkQSiUvk=@protonmail.com">
      <pre class="moz-quote-pre" wrap="">

I used the compat APIs, like Drakvuf does.

@Tamas, if you could check the traps implementation.

You also have stress-test.py, which is the small test suite that I used, and
the screenshot showing the stdout preceding a test failure,
when Ansible couldn't contact WinRM service because the domain was frozen.

Note: I stole some code from libvmi, to handle page read/write in Xen.

PS: in the case where the domain is frozen, and I destroy the domain, a (null) entry will remain
in xl list, despite that my stress-test.py process is already dead.

I have 4 of these entries in my xl list right now.</pre>
    </blockquote>
    <br>
    That's almost certainly a reference not being dropped on a page. 
    Can you run `xl debug-keys q` and paste the resulting analysis which
    will be visible in `xl dmesg`?<br>
    <br>
    It is probably some missing cleanup in the altp2m code.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------C88889B6C5BF0B0175138F7E--


--===============7111590664273602694==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7111590664273602694==--

