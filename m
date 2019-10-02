Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F60DC933F
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 23:06:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFlly-0003hB-6Z; Wed, 02 Oct 2019 21:02:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G8yu=X3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iFllw-0003h6-UO
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 21:02:56 +0000
X-Inumbo-ID: 0123f103-e558-11e9-971d-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by localhost (Halon) with ESMTPS
 id 0123f103-e558-11e9-971d-12813bfff9fa;
 Wed, 02 Oct 2019 21:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570050175;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to;
 bh=zQti7plwVLOaaJge615veYfycFK1iPy2rbEKWqYsgZs=;
 b=EBR4QUeD/pdz01jgjRIqnWjJlU5ynPZ57Bm7EwoJ+41wyuURvVe/O+74
 83QwNrZ+RyAc0uc/1sqU1g9M4HE7TX+jF6mm6GD5G2pbNPu6SI8OP2lv1
 R41cIxFSAskf74zyRe0vhnfcZAUk0z3fA+Gav5j7tpB+OXwKqBdjTH1+J 8=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: FYl/2C7HUJidnO87Zp6uTFwqiodbl1My8fdTTL4WzhkarYh52fbPkK1WM1/Y0el1QIIEWEdSkd
 0DRpq1COiH9oH9d7plyw3DAxLxElePTNNkLuSqoOAFpc+2w/83A0pFYTE9GVH5YxLWsC4bdAfq
 1DSJXtuZ9ikHBj0vQgKMGtNWQf5nj0kG6BlBdfPi9+2tXqoiSQV3s6cm4W7RrU43PfCO4DEf7t
 Me4LdqaveyHE7xwgeCHoNSbtTGpFYK0Xq5iWEUpLog4225UBHYZwPa7CToRQz5qSEw8J4BxY0n
 kxU=
X-SBRS: 2.7
X-MesageID: 6686005
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,249,1566878400"; d="scan'208,217";a="6686005"
To: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
References: <20190930182437.25478-1-andrew.cooper3@citrix.com>
 <20190930182437.25478-3-andrew.cooper3@citrix.com>
 <46bcfde3-83c8-5a2c-9196-832e0ea144ea@suse.com>
 <d73687de-df73-2131-f8ca-4061dc6f0a24@citrix.com>
 <4410be2a-7061-e71d-0578-ebc48e506d7a@suse.com>
 <d7734a40-4ed7-6618-057f-c03e6ba074ff@citrix.com>
 <81BDBA7C-7565-4B47-8F99-2778AC92CF30@amazon.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <6a5d9510-fe42-8b7a-653b-dafa309ef7f6@citrix.com>
Date: Wed, 2 Oct 2019 22:02:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <81BDBA7C-7565-4B47-8F99-2778AC92CF30@amazon.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13 2/2] xen/nospec: Introduce
 CONFIG_SPECULATIVE_BRANCH_HARDEN and disable it
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, "Manthey,
 Norbert" <nmanthey@amazon.de>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============3121651617764503347=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============3121651617764503347==
Content-Type: multipart/alternative;
	boundary="------------20E5156F5FA6BE49E8706ADE"
Content-Language: en-GB

--------------20E5156F5FA6BE49E8706ADE
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 02/10/2019 10:50, Wieczorkiewicz, Pawel wrote:
>>>>> I've taken, as a simple example,
>>>>> p2m_mem_access_sanity_check(), and this looks to be the way gcc9 has generated
>>>>> code (in a non-debug build). Hence either I'm mis-remembering what we want
>>>>> things to look like, or there's more to it than code generation simply being
>>>>> "not correct".
>>>> This example demonstrates the problem, and actually throws a further
>>>> spanner in the works of how make this safe, which hadn't occurred to me
>>>> before.
>>>>
>>>> The instruction stream from a caller of p2m_mem_access_sanity_check()
>>>> will look something like this:
>>>>
>>>> call p2m_mem_access_sanity_check
>>>>     ...
>>>>     lfence
>>>>     ...
>>>>     ret   
>>>> cmp $0, %eax
>>>> jne ...
>>>>
>>>> Which is unsafe, because the only safe way to arrange this code would be:
>>>>
>>>> call p2m_mem_access_sanity_check
>>>>     ...
>>>>     ret
>>>> cmp $0, %eax
>>>> jne 1f
>>>> lfence
>>>> ...
>>>> 1: lfence
>>>> …
>>>>

Answering out of order, because I think this will make things clearer.

> But the hardening wasn’t about spectre v1, but about cache-load gadgets?

Ultimately, yes - the goal is cache load gadgets.

Cache load gadgets are any memory read, where the attacker can influence
the position of the load.  The easy case to think about is the first
half of a Spectre v1 gadget (i.e. the first memory load), but a second
common case is a simple memory read with the wrong base pointer (as
demonstrated clearly by SpectreGS and CVE-2019-1125).

A 3rd case, which is actually the root of this discovery, is speculative
type confusion where the processor executes code expecting to use
{d,v}->arch.{pv,hvm}.$FOO, but is interpreting the data with the types
of the other union.  For people familiar with Speculative Store Bypass
gadgets, this is the same kind of thing as the integer/pointer confusion
in that case.

The only viable fix for these is to avoid entering the basic block with
the vulnerable code pattern in the first place.  I.e. "fixing" Spectre v1.

> Does it mean the CPU speculates over a direct call (assuming no #PF etc) and
> assumes some default return value to be used?

That wasn't the point I was trying to make, although Intel CPUs will
speculatively execute the instructions following an indirect call/jmp
while the frontend works out where to fetch from next.

The point was that, to avoid entering the wrong basic block, the lfence
must be later in the instruction stream than the conditional jump.  The
frontend has to follow the attacker controlled jump, then serialise
itself to figure out if it went wrong.

Serialising first, then following the attacker controlled jump still
leaves a speculation window, which can execute the gadget.

> If not, maybe we should be more concerned about the value the cache-loading
> gadget speculates with, rather than the sheer speculation over the branch.

In a mythical world where a complete solution existed, channels other
than the data cache want considering.  There is some interesting work
with instruction cache and TLB timing analysis, and these are far harder
to close.

Given the SpectreGS case of a bad base pointer, rather than a bad
offset, a non-spectre-v1 fix would have to clamp every register making
up part of a memory operand.

This is the approach which the Clang/LLVM Speculative Load Hardening
feature goes for, and comes with a 30% perf hit or so.  Furthermore, the
current design of SLH is specific to userspace, and there is development
work needed to make it safe for kernel mode code.

Specifically, the muxing of the speculation token against registers
needs to turn from &= token to |= token, and the sense of the token
being 0 or -1 needs to reverse, because of kernel code operating in the
top of the address space, rather than the bottom.  There is a further
complication given signed displacement.  For kernel code, that can still
speculatively wrap around into userspace, and SMAP (on
meltdown-vulnerable parts) won't even halt speculation in this case.

Further further more, for Xen, that would still move incorrect
speculative memory accesses into PV guest kernel controlled space,
rather than Xen controlled space.

>
>> To protect against speculatively executing the wrong basic block, the
>> pipeline must execute the conditional jump first, *then* hit an lfence
>> to serialise the instruction stream and revector in the case of
>> incorrect speculation.
> That’s true, but there are also 2 aspects worth mentioning:
> 1) Example:
>
> jne 1
> PRIVILEGED
> 1:
> ALWAYS_SAFE
>
> We do not necessarily have to cover the 1: path with an lfence?
> We could allow speculation there, as it is harmless.

I agree, but how do you express that using evaluate_nospec()?

There is no information tying what is privileged and what is safe, to
the condition for entering the basic block.

> 2) cache-load protection
>
> It might be ok to speculate over a conditional branch, when we can
> guarantee that the value to be used in a dereference is not out-of-bound.

I agree (in principle, because the guarantee is implausible to make in
general case) but...

> In that case an lfence is used to latch the value in the register. We can
> still speculate over the branch and reach the dereference, but with a sane value.

... this is reasoning about the wrong basic block.  This analogy is:

cmp ... #1
jcc 1f
    ALWAYS_SAFE
    lfence ("optimised" from the cmp #2 if statement)
    cmp ... #2
    jcc 1f
    PRIVILEGED
1:
ALWAYS_SAFE

This is saying that the spilled lfence from cmp2 protects PRIVLEGED
because it might reduce the speculative variability in registers.  There
are probably code sequences where that would be true, but there are
plenty of others where it would not be true.

This is because it is protecting cmp1's basic block (or at least, part
of it), not cmp2's.  It will protect against an attack which requires
poisoning of both cmp1 and cmp2 to be function, but this is orders of
magnitude harder for the attacker to detect and arrange for, than an
attack which simply involves poisoning cmp2 to enter PRIVILEGED with an
architecturally-correct register state intended for ALWAYS_SAFE.

> I agree that lfence might not give us 100% security in every potential case,
> but that is what "hardening" gives you...

This being a best-effort approach is fine.  There is no way it could
ever be called complete with a straight face.

If everything had been done using block_speculation(), that would also
be ok.  There is no way the optimiser can break the safety there,
because it cannot reposition the lfence instruction relative to any
memory references (although the subtleties of it being able to be
repositioned relative to non-memory accesses still make it hard to
reason about in general).

The problem is that, at the moment, the optimiser is undermining the
safety which is attempting to be inserted by the use of evaluate_nospec().

We have code which appears to be safe at the C level, and isn't.  A
false sense of security is arguably worse than no security.

The random sprinkling of lfences will reduce the amount of speculation,
but this is of very little use when it is only actually protecting
against certain more-complicated, and therefore rarer, gadgets but
leaves the common gadgets still exploitable.

~Andrew

--------------20E5156F5FA6BE49E8706ADE
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 02/10/2019 10:50, Wieczorkiewicz,
      Pawel wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:81BDBA7C-7565-4B47-8F99-2778AC92CF30@amazon.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">I've taken, as a simple example,
p2m_mem_access_sanity_check(), and this looks to be the way gcc9 has generated
code (in a non-debug build). Hence either I'm mis-remembering what we want
things to look like, or there's more to it than code generation simply being
"not correct".
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">This example demonstrates the problem, and actually throws a further
spanner in the works of how make this safe, which hadn't occurred to me
before.

The instruction stream from a caller of p2m_mem_access_sanity_check()
will look something like this:

call p2m_mem_access_sanity_check
    ...
    lfence
    ...
    ret   
cmp $0, %eax
jne ...

Which is unsafe, because the only safe way to arrange this code would be:

call p2m_mem_access_sanity_check
    ...
    ret
cmp $0, %eax
jne 1f
lfence
...
1: lfence
…

</pre>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
    <br>
    Answering out of order, because I think this will make things
    clearer.<br>
    <br>
    <blockquote type="cite">
      <pre class="moz-quote-pre" wrap="">But the hardening wasn’t about spectre v1, but about cache-load gadgets?</pre>
    </blockquote>
    <br>
    Ultimately, yes - the goal is cache load gadgets.<br>
    <br>
    Cache load gadgets are any memory read, where the attacker can
    influence the position of the load.  The easy case to think about is
    the first half of a Spectre v1 gadget (i.e. the first memory load),
    but a second common case is a simple memory read with the wrong base
    pointer (as demonstrated clearly by SpectreGS and <span
      class="c-message__body" dir="auto" data-qa="message-text">CVE-2019-1125</span>).<br>
    <br>
    A 3rd case, which is actually the root of this discovery, is
    speculative type confusion where the processor executes code
    expecting to use {d,v}-&gt;arch.{pv,hvm}.$FOO, but is interpreting
    the data with the types of the other union.  For people familiar
    with Speculative Store Bypass gadgets, this is the same kind of
    thing as the integer/pointer confusion in that case.<br>
    <br>
    The only viable fix for these is to avoid entering the basic block
    with the vulnerable code pattern in the first place.  I.e. "fixing"
    Spectre v1.<br>
    <br>
    <blockquote type="cite"
      cite="mid:81BDBA7C-7565-4B47-8F99-2778AC92CF30@amazon.com">
      <pre class="moz-quote-pre" wrap="">Does it mean the CPU speculates over a direct call (assuming no #PF etc) and
assumes some default return value to be used?</pre>
    </blockquote>
    <br>
    That wasn't the point I was trying to make, although Intel CPUs will
    speculatively execute the instructions following an indirect
    call/jmp while the frontend works out where to fetch from next.<br>
    <br>
    The point was that, to avoid entering the wrong basic block, the
    lfence must be later in the instruction stream than the conditional
    jump.  The frontend has to follow the attacker controlled jump, then
    serialise itself to figure out if it went wrong.<br>
    <br>
    Serialising first, then following the attacker controlled jump still
    leaves a speculation window, which can execute the gadget.<br>
    <br>
    <blockquote type="cite"
      cite="mid:81BDBA7C-7565-4B47-8F99-2778AC92CF30@amazon.com">
      <pre class="moz-quote-pre" wrap="">If not, maybe we should be more concerned about the value the cache-loading
gadget speculates with, rather than the sheer speculation over the branch.</pre>
    </blockquote>
    <br>
    In a mythical world where a complete solution existed, channels
    other than the data cache want considering.  There is some
    interesting work with instruction cache and TLB timing analysis, and
    these are far harder to close.<br>
    <br>
    Given the SpectreGS case of a bad base pointer, rather than a bad
    offset, a non-spectre-v1 fix would have to clamp every register
    making up part of a memory operand.<br>
    <br>
    This is the approach which the Clang/LLVM Speculative Load Hardening
    feature goes for, and comes with a 30% perf hit or so.  Furthermore,
    the current design of SLH is specific to userspace, and there is
    development work needed to make it safe for kernel mode code.<br>
    <br>
    Specifically, the muxing of the speculation token against registers
    needs to turn from &amp;= token to |= token, and the sense of the
    token being 0 or -1 needs to reverse, because of kernel code
    operating in the top of the address space, rather than the bottom. 
    There is a further complication given signed displacement.  For
    kernel code, that can still speculatively wrap around into
    userspace, and SMAP (on meltdown-vulnerable parts) won't even halt
    speculation in this case.<br>
    <br>
    Further further more, for Xen, that would still move incorrect
    speculative memory accesses into PV guest kernel controlled space,
    rather than Xen controlled space.<br>
    <br>
    <blockquote type="cite"
      cite="mid:81BDBA7C-7565-4B47-8F99-2778AC92CF30@amazon.com"><br>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">To protect against speculatively executing the wrong basic block, the
pipeline must execute the conditional jump first, *then* hit an lfence
to serialise the instruction stream and revector in the case of
incorrect speculation.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
That’s true, but there are also 2 aspects worth mentioning:
1) Example:

jne 1
PRIVILEGED
1:
ALWAYS_SAFE

We do not necessarily have to cover the 1: path with an lfence?
We could allow speculation there, as it is harmless.</pre>
    </blockquote>
    <br>
    I agree, but how do you express that using evaluate_nospec()?<br>
    <br>
    There is no information tying what is privileged and what is safe,
    to the condition for entering the basic block.<br>
    <br>
    <blockquote type="cite"
      cite="mid:81BDBA7C-7565-4B47-8F99-2778AC92CF30@amazon.com">
      <pre class="moz-quote-pre" wrap="">2) cache-load protection

It might be ok to speculate over a conditional branch, when we can
guarantee that the value to be used in a dereference is not out-of-bound.</pre>
    </blockquote>
    <br>
    I agree (in principle, because the guarantee is implausible to make
    in general case) but...<br>
    <br>
    <blockquote type="cite"
      cite="mid:81BDBA7C-7565-4B47-8F99-2778AC92CF30@amazon.com">
      <pre class="moz-quote-pre" wrap="">
In that case an lfence is used to latch the value in the register. We can
still speculate over the branch and reach the dereference, but with a sane value.</pre>
    </blockquote>
    <br>
    ... this is reasoning about the wrong basic block.  This analogy is:<br>
    <br>
    cmp ... #1<br>
    jcc 1f<br>
        ALWAYS_SAFE<br>
        lfence ("optimised" from the cmp #2 if statement)<br>
        cmp ... #2<br>
        jcc 1f<br>
        PRIVILEGED<br>
    1:<br>
    ALWAYS_SAFE<br>
    <br>
    This is saying that the spilled lfence from cmp2 protects PRIVLEGED
    because it might reduce the speculative variability in registers. 
    There are probably code sequences where that would be true, but
    there are plenty of others where it would not be true.<br>
    <br>
    This is because it is protecting cmp1's basic block (or at least,
    part of it), not cmp2's.  It will protect against an attack which
    requires poisoning of both cmp1 and cmp2 to be function, but this is
    orders of magnitude harder for the attacker to detect and arrange
    for, than an attack which simply involves poisoning cmp2 to enter
    PRIVILEGED with an architecturally-correct register state intended
    for ALWAYS_SAFE.<br>
    <br>
    <blockquote type="cite"
      cite="mid:81BDBA7C-7565-4B47-8F99-2778AC92CF30@amazon.com">
      <pre class="moz-quote-pre" wrap="">I agree that lfence might not give us 100% security in every potential case,
but that is what "hardening" gives you...</pre>
    </blockquote>
    <br>
    This being a best-effort approach is fine.  There is no way it could
    ever be called complete with a straight face.<br>
    <br>
    If everything had been done using block_speculation(), that would
    also be ok.  There is no way the optimiser can break the safety
    there, because it cannot reposition the lfence instruction relative
    to any memory references (although the subtleties of it being able
    to be repositioned relative to non-memory accesses still make it
    hard to reason about in general).<br>
    <br>
    The problem is that, at the moment, the optimiser is undermining the
    safety which is attempting to be inserted by the use of
    evaluate_nospec().<br>
    <br>
    We have code which appears to be safe at the C level, and isn't.  A
    false sense of security is arguably worse than no security.<br>
    <br>
    The random sprinkling of lfences will reduce the amount of
    speculation, but this is of very little use when it is only actually
    protecting against certain more-complicated, and therefore rarer,
    gadgets but leaves the common gadgets still exploitable.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------20E5156F5FA6BE49E8706ADE--


--===============3121651617764503347==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3121651617764503347==--

