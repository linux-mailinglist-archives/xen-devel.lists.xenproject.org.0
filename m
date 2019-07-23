Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A6871EDD
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 20:15:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpzHa-0003vZ-R4; Tue, 23 Jul 2019 18:13:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VIRi=VU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hpzHZ-0003vU-7c
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 18:13:01 +0000
X-Inumbo-ID: 808d56ae-ad75-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 808d56ae-ad75-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 18:12:59 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: a5LJRX/OVXKa25ZbDjmmTh23HwLC5BrbqeP01Aq+YxldsQclMkfUC0g8zyx9eOz8mUkBMrGiRl
 YqSvVuEyhVqy3yD/WtOW/SSbEOyzczHduzgJUvuvLTcRtCnDXTljAPS+/6IzVuaaaHdbHEM1Ji
 Hh4c99TspbBCRRTEIug89KR/aUaQ4dFPqL/cElrdCeME7d2eHp7z/23aSsZ6eiBe/hnj61QzF7
 4L/qjFBt5osZFXJUcDwspHRcbLNVfvspToePZC0k+SJ7yuXhurNBWmvd5ISvPJ9i1SKDmaZyhp
 kR8=
X-SBRS: 2.7
X-MesageID: 3329571
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,299,1559534400"; d="scan'208,217";a="3329571"
To: Roman Shaposhnik <roman@zededa.com>
References: <CAMmSBy9g-QFHTXhpHK6=xDFiBDj4LpnJ=cXj405MMmA1rJaOUg@mail.gmail.com>
 <b2e4ed0b178e41ebbc8f1db622ecae95@AMSPEX02CL03.citrite.net>
 <20190722114859.dtm4w5ff75uedu24@Air-de-Roger>
 <9238bf1a297c42f38dccc1cfb50bd144@AMSPEX02CL03.citrite.net>
 <20190722134813.c7fedaqtrbo6ojvo@Air-de-Roger>
 <81a7cdc728294e5ca05fd056a87cb21b@AMSPEX02CL03.citrite.net>
 <20190722143953.tkcmv5bb72sdlkql@Air-de-Roger>
 <9f11fd0b6be14ea5a8efbb809df74cc9@AMSPEX02CL03.citrite.net>
 <20190722152152.dvhs4riw2w67rvih@Air-de-Roger>
 <CAMmSBy-P9+00XfK6k2OYqFHNONcxeGuu0V=Qk4peFDC=KOUogA@mail.gmail.com>
 <b5ba8315-ce59-85e6-5bfc-1db4c239eb1c@citrix.com>
 <CAMmSBy-S7nMg-V5DUzV2L2RmK0TnFt+9=C8gE=0FuUOQK3kjQQ@mail.gmail.com>
 <f2d4b51f-b2b1-abad-8040-ad5de26f5b5b@citrix.com>
 <CAMmSBy909uERFmH9=pMqpZkr=Bb7-TVMZiFRarvzV57+=QcK8w@mail.gmail.com>
 <bf7515bb-3c4c-59e1-557a-d3f0106c5609@citrix.com>
 <CAMmSBy_Jh_NHTn_VYkNL8FxcnfMkpiq94E+XqNK9wJWm7tH0pw@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <81416abc-e5f5-76de-a34a-87412e125e64@citrix.com>
Date: Tue, 23 Jul 2019 19:12:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMmSBy_Jh_NHTn_VYkNL8FxcnfMkpiq94E+XqNK9wJWm7tH0pw@mail.gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
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
Cc: "jgross@suse.com" <jgross@suse.com>, Paul Durrant <Paul.Durrant@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============2684725445416770779=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============2684725445416770779==
Content-Type: multipart/alternative;
	boundary="------------E8F69F97790C6D34C7004811"
Content-Language: en-GB

--------------E8F69F97790C6D34C7004811
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 23/07/2019 18:58, Roman Shaposhnik wrote:
> On Tue, Jul 23, 2019 at 10:50 AM Andrew Cooper
> <andrew.cooper3@citrix.com> wrote:
>> On 23/07/2019 18:48, Roman Shaposhnik wrote:
>>> On Tue, Jul 23, 2019 at 10:35 AM Andrew Cooper
>>> <andrew.cooper3@citrix.com> wrote:
>>>> On 23/07/2019 18:32, Roman Shaposhnik wrote:
>>>>> Hi Roger!
>>>>>
>>>>> I applied your patch, removed no-igfx and I still see the original
>>>>> problem. Please let me know what other logs/debugs would you need at
>>>>> this point.
>>>> Please can you collect a full boot log with iommu=debug
>>> How long of an output should I expect when iommu=debug is enabled?
>>> I've just enabled it and I'm looking at what appears to be an endless
>>> scroll of debug info.
>>>
>>> This is all I see for the good 5 minutes at this point. Culminating with:
>>> (XEN)   (XEN) APIC error on CPU0: 40(00)
>>>
>>> and a failure to boot.
>>>
>>> Note that this is still without no-igfx
>>>
>>> I'm attaching the tail end of this log.
>> Sadly, what is useful is the head of the log, before it starts
>> complaining loudly about every DMA fault.
> No worries. Take a look at the head of the log attached.
>
> Btw, I'm kind of curious why iommu=debug would actually make it crash

The system is rather sickly, and is debugging at a rate slower than
incoming faults, which is going to starve whichever CPU is taking the
IOMMU interrupt.

I wouldn't worry about the APIC error now.

Curiously, there is one single intremap error on boot, which is likely
unrelated.

(XEN) [VT-D]INTR-REMAP: Request device [0000:f0:1f.0] fault index 0, iommu reg = ffff82c0008e0000

(XEN) [VT-D]INTR-REMAP: reason 22 - Present field in the IRTE entry is clear


This will be irq0 from the IO-APIC.

Can you try booting following the guidance from

(XEN) [VT-D]found ACPI_DMAR_RMRR:

(XEN) [VT-D]  RMRR address range 8d800000..8fffffff not in reserved memory; need "iommu_inclusive_mapping=1"?

(XEN) [VT-D] endpoint: 0000:00:02.0


which I noted on my first reply?  Given that Rogers patch didn't help,
something else is going on.

~Andrew

--------------E8F69F97790C6D34C7004811
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 23/07/2019 18:58, Roman Shaposhnik
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMmSBy_Jh_NHTn_VYkNL8FxcnfMkpiq94E+XqNK9wJWm7tH0pw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Tue, Jul 23, 2019 at 10:50 AM Andrew Cooper
<a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
On 23/07/2019 18:48, Roman Shaposhnik wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Tue, Jul 23, 2019 at 10:35 AM Andrew Cooper
<a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a> wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On 23/07/2019 18:32, Roman Shaposhnik wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Hi Roger!

I applied your patch, removed no-igfx and I still see the original
problem. Please let me know what other logs/debugs would you need at
this point.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Please can you collect a full boot log with iommu=debug
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">How long of an output should I expect when iommu=debug is enabled?
I've just enabled it and I'm looking at what appears to be an endless
scroll of debug info.

This is all I see for the good 5 minutes at this point. Culminating with:
(XEN)   (XEN) APIC error on CPU0: 40(00)

and a failure to boot.

Note that this is still without no-igfx

I'm attaching the tail end of this log.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Sadly, what is useful is the head of the log, before it starts
complaining loudly about every DMA fault.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
No worries. Take a look at the head of the log attached.

Btw, I'm kind of curious why iommu=debug would actually make it crash</pre>
    </blockquote>
    <br>
    The system is rather sickly, and is debugging at a rate slower than
    incoming faults, which is going to starve whichever CPU is taking
    the IOMMU interrupt.<br>
    <br>
    I wouldn't worry about the APIC error now.<br>
    <br>
    Curiously, there is one single intremap error on boot, which is
    likely unrelated.<br>
    <br>
    <pre>(XEN) [VT-D]INTR-REMAP: Request device [0000:f0:1f.0] fault index 0, iommu reg = ffff82c0008e0000</pre>
    <pre>(XEN) [VT-D]INTR-REMAP: reason 22 - Present field in the IRTE entry is clear</pre>
    <br>
    This will be irq0 from the IO-APIC.<br>
    <br>
    Can you try booting following the guidance from <br>
    <br>
    <pre>(XEN) [VT-D]found ACPI_DMAR_RMRR:</pre>
    <pre>(XEN) [VT-D]  RMRR address range 8d800000..8fffffff not in reserved memory; need "iommu_inclusive_mapping=1"?</pre>
    <pre>(XEN) [VT-D] endpoint: 0000:00:02.0</pre>
    <br>
    which I noted on my first reply?  Given that Rogers patch didn't
    help, something else is going on.<br>
    <br>
    ~Andrew
  </body>
</html>

--------------E8F69F97790C6D34C7004811--


--===============2684725445416770779==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2684725445416770779==--

