Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6816B1CFE01
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 21:10:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYaIA-0002F5-RP; Tue, 12 May 2020 19:10:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sh4E=62=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jYaI9-0002Ex-NV
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 19:10:13 +0000
X-Inumbo-ID: 3440d754-9484-11ea-a2f8-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3440d754-9484-11ea-a2f8-12813bfff9fa;
 Tue, 12 May 2020 19:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589310613;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Ok9vrPMEnIt9CRPWXOchhDesY4y4P9LTshix2i9L3qQ=;
 b=ID9RmqsL7cmMaS00C8Nod54vIITeqEkbpBYpWOi/cWaT5IwZJ4troi7o
 u95wm/1WCRUdrAfUcCfiDCiQlhyRlurKslvZoVS8OGa1s4hgqQyb60/nj
 9kFo9CRto0SKgh0tLI+jzXfonE6yuAqkSorXn9xSzIqYe9hWrXk5ViiL2 8=;
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: njvaU9IXbt00zFhAduUe/8NtmSADjHQsV+3Wjl0M0KWc+3Lw/I0+363CavNUfMufDk1n4q3C0d
 yo4g7ExsfhXiqKl5Qczxnl2r/urw7JVagCnq4JwV0a/s9P78ji44FRgnQI5fRyPAaNXP4+klop
 N1LgzB4cgl4cqTPTt0uYzGOysN8sKoKMi9ywmSsrMFFwZuh6Mq3wcwHw1wbW3UvMkQgsTYwUw8
 L2JHV5dfAdIwqlGsR8ySMhCtHZuepkqOTOb6b9zuxKGmZQyLUESFF5btk1KBvkVPs4Q9hFgg3g
 NSo=
X-SBRS: 2.7
X-MesageID: 17347110
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,384,1583211600"; d="scan'208";a="17347110"
Subject: Re: [PATCH 2/2] x86/boot: Drop .note.gnu.properties in build32.lds
To: Jason Andryuk <jandryuk@gmail.com>
References: <20200512033948.3507-1-jandryuk@gmail.com>
 <20200512033948.3507-3-jandryuk@gmail.com>
 <69dd92f0-5b23-7a3d-3568-feab20874f97@suse.com>
 <372f83e4-6016-cc10-a8e6-970d644eb561@citrix.com>
 <CAKf6xpsmYpXSkSoVxafcRMH8dQ2DJ6rOfp+ah=RyoS6DheUj4A@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <cfdcff79-e196-9ec8-79bf-c811ec6cd529@citrix.com>
Date: Tue, 12 May 2020 20:10:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAKf6xpsmYpXSkSoVxafcRMH8dQ2DJ6rOfp+ah=RyoS6DheUj4A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefan Bader <stefan.bader@canonical.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12/05/2020 17:17, Jason Andryuk wrote:
> On Tue, May 12, 2020 at 11:58 AM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> On 12/05/2020 16:32, Jan Beulich wrote:
>>> On 12.05.2020 05:39, Jason Andryuk wrote:
>>>> reloc.S and cmdline.S as arrays of executable bytes for inclusion in
>>>> head.S generated from compiled object files.  Object files generated by
>>>> an -fcf-protection toolchain include a .note.gnu.property section.  The
>>>> way reloc.S and cmdline.S are generated, the bytes of .note.gnu.property
>>>> become the start of the .S files.  When head.S calls reloc or
>>>> cmdline_parse_early, those note bytes are executed instead of the
>>>> intended .text section.  This results in an early crash in reloc.
>>> I may be misremembering, but I vaguely recall some similar change
>>> suggestion. What I'm missing here is some form of statement as to
>>> whether this is legitimate tool chain behavior, or a bug, and
>>> hence whether this is a fix or a workaround.
>> The linker is free to position unreferenced sections anywhere it wishes.
>>
>> It is deeply unhelpful behaviour, but neither Binutils nor Clang
>> developers think it is something wanting fixing.
>>
>> One option might be to use --orphan-handling=error so unexpected
>> toolchain behaviour breaks the build, or in this case perhaps =discard
>> might be better.
> The toolchain uses .note.gnu.property to flag object files as
> supporting Intel CET (Control-flow Enforcement Technology) enabled by
> -fcf-protection.  The linker/loader uses the note to know if CET
> should be enabled or disabled.  CET can only be enabled if the
> application and all libraries support it.

Right, except we're a kernel here (rather than userspace), so the
practicalities are different.

> So it's legitimate to flag compiled objects with .note.gnu.property.
> The .S files generated by build32.mk are .. interesting.  It seems
> like they should only be the runtime code & data, so we don't want the
> .note in there.

Yes...  Self-hosted relocatable 32bit code is tricky at the best of
times, and this is a very good example of how not to do it.

I've got a plan to get rid of it completely, but it needs a bit more of
the "switch to kbuild" series to go in first.

>   So I guess this is a workaround for how the .S files
> are generated?  My first attempt added -R .note.gnu.property, fyi.
>
> I'm not familiar with the linker options Andrew references, to know
> how usable they are off the top of my head.
>
> -fcf-protection=none could also be specified in CFLAGS in build32.mk
> to avoid generating the note.
>
>>>> Discard the .note.gnu.property section when linking to avoid the extra
>>>> bytes.
>>> If we go this route (and if, as per above, I'm misremembering,
>>> meaning we didn't reject such a change earlier on), why would we
>>> not strip .note and .note.* in one go?
> Maybe?  I made the conservative change since they weren't previously discarded.
>
>>>> Stefan Bader also noticed that build32.mk requires -fcf-protection=none
>>>> or else the hypervisor will not boot.
>>>> https://bugs.launchpad.net/ubuntu/+source/gcc-9/+bug/1863260
>>> How's this related to the change here?
>> I think there is a bit of confusion as to exactly what is going on.
>>
>> Ubuntu defaults -fcf-protection to enabled, which has a side effect of
>> turning on CET, which inserts ENDBR{32,64} instructions and generates
>> .note.gnu.properties indicating that the binary is CET-IBT compatible.
>>
>> ENDBR* instructions come from the Hint Nop space so are safe on older
>> processors, but do ultimately add to binary bloat.  It also occurs to me
>> that it likely breaks livepath.
>>
>> The reason Xen fails to boot is purely to do with the position of
>> .note.gnu.properties, not the ENDBR* instructions.
> Yes.
>
> I referenced Stefan's bug since it specifically called out build32.mk
> as problematic even after supplying -fcf-protection=none for a
> hypervisor build.  I was trying to give credit and reference a helpful
> bug entry.  I don't know how Xen handles such things, but I am fine
> dropping it.

Typically a Reported-by: $PERSON <$EMAIL> tag, but frankly it would have
been nice if anyone had posted any of these problems to xen-devel 6
months ago when it was first discovered to be a problem.

So far, we're at one definite (and fixed) toolchain bug, one
obvious-but-not-yet-debugged toolchain bug, a robustness fix in Xen for
the 32bit mess, and overriding of a system default, and thats before
getting to the iPXE issues.

~Andrew

