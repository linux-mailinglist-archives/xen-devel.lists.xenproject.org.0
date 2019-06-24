Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BAB50A56
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2019 14:05:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfNgo-0002al-RP; Mon, 24 Jun 2019 12:03:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TGna=UX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hfNgn-0002ag-II
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2019 12:03:13 +0000
X-Inumbo-ID: 08c547be-9678-11e9-adbd-7bd2079155b5
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 08c547be-9678-11e9-adbd-7bd2079155b5;
 Mon, 24 Jun 2019 12:03:10 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: nDN+sIuDfW59fbnYomGp76f/8T6sKIqplMF0a92b/bt9Aabv4APirYVMGqfIRMZBvHJhnDVojF
 sKcWKs3wM/cw5HP19/fnjnCXbXbOHOGCopptzIIQHnUlH2pX9/CPR0HYKPNAFZu6/XqBqyY+zv
 toXEILpDEQJoNuGL7o5ONRXVoZ1OJ7uqitKpsKtk86rNYH9rmOVOnTUcDwsIkpA/FBQfGjU+9o
 YQDwv/fgCE6vpPZRhggf+CyKRmS8rORNg0fXhpaH6eJzDmdGUP+bRXuPRGB0XxaBGrW7Uf7RFJ
 Wok=
X-SBRS: 2.7
X-MesageID: 2146997
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,412,1557201600"; d="scan'208,217";a="2146997"
To: Julien Grall <julien.grall@arm.com>, Denis Obrezkov
 <denisobrezkov@gmail.com>, <xen-devel@lists.xenproject.org>
References: <ee1f4b9b969e6cf67278905e0405bc4fa5d6080c.1561147189.git.denisobrezkov@gmail.com>
 <ecfa161d-1389-1541-e92c-dfa3b8c7e402@arm.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <670083cc-00d8-ccfd-7abc-e6fd98e7ff2b@citrix.com>
Date: Mon, 24 Jun 2019 13:03:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <ecfa161d-1389-1541-e92c-dfa3b8c7e402@arm.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] xen/arm: Switch OMAP5 secondary cores into
 hyp mode
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
Cc: Hunyue Yau <hy-gsoc@hy-research.com>,
 "julien.grall@foss.arm.com" <julien.grall@foss.arm.com>,
 Andre Przywara <andre.przywara@arm.com>, tim@xen.org,
 Iain Hunter <drhunter95@gmail.com>, baozich@gmail.com
Content-Type: multipart/mixed; boundary="===============6710457968038577948=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6710457968038577948==
Content-Type: multipart/alternative;
	boundary="------------732A65DD8738749055F71C14"
Content-Language: en-GB

--------------732A65DD8738749055F71C14
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 24/06/2019 12:09, Julien Grall wrote:
> (+ GSOC mentors and Andre)
>
> Hi Denis,
>
> Thank you for the patch.
>
> First of all, may I ask to CC the other mentors?
>
> On 6/21/19 9:02 PM, Denis Obrezkov wrote:
>> This function allows xen to bring secondary CPU cores into non-secure
>> HYP mode. This is done by using a Secure Monitor call.
>>
>> Signed-off-by: Denis Obrezkov <denisobrezkov@gmail.com>
>> ---
>>   xen/arch/arm/arm32/head.S             | 11 ++++++++++-
>>   xen/arch/arm/platforms/omap5.c        |  5 +++--
>>   xen/include/asm-arm/platforms/omap5.h |  3 +++
>>   3 files changed, 16 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
>> index 5f817d473e..120e034934 100644
>> --- a/xen/arch/arm/arm32/head.S
>> +++ b/xen/arch/arm/arm32/head.S
>> @@ -36,6 +36,10 @@
>>   #include EARLY_PRINTK_INC
>>   #endif
>>   +
>> +#define API_HYP_ENTRY 0x102
>> +#define AUX_CORE_BOOT0_PA           0x48281800
>> +
>
> I have thought a bit more about the placement of the code. I think it
> would be best if it lives in a separate file (maybe
> platforms/omap5-head.S).

For something this trivial, it is easy to put straight into omap5.c

Completely untested, but this ought to work:

diff --git a/xen/arch/arm/platforms/omap5.c b/xen/arch/arm/platforms/omap5.c
index 6b5cc15af3..1dcc92d3a4 100644
--- a/xen/arch/arm/platforms/omap5.c
+++ b/xen/arch/arm/platforms/omap5.c
@@ -23,6 +23,16 @@
 #include <xen/vmap.h>
 #include <asm/io.h>
 
+void omap5_init_secondary(void);
+asm (
+".text                            \n\t"
+"omap5_init_secondary:            \n\t"
+"        ldr   r12, =0x102        \n\t" /* API_HYP_ENTRY */
+"        adr   r0, init_secondary \n\t"
+"        smc   #0                 \n\t"
+"        b     init_secondary     \n\t"
+);
+
 static uint16_t num_den[8][2] = {
     {         0,          0 },  /* not used */
     {  26 *  64,  26 *  125 },  /* 12.0 Mhz */


I personally find this favourable to introducing new stub files.

Ultimately it is Julien/Stefano's decision, but I'd like to point it out
as an option for anyone who is unaware.

~Andrew

--------------732A65DD8738749055F71C14
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 24/06/2019 12:09, Julien Grall
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:ecfa161d-1389-1541-e92c-dfa3b8c7e402@arm.com">(+ GSOC
      mentors and Andre)
      <br>
      <br>
      Hi Denis,
      <br>
      <br>
      Thank you for the patch.
      <br>
      <br>
      First of all, may I ask to CC the other mentors?
      <br>
      <br>
      On 6/21/19 9:02 PM, Denis Obrezkov wrote:
      <br>
      <blockquote type="cite">This function allows xen to bring
        secondary CPU cores into non-secure
        <br>
        HYP mode. This is done by using a Secure Monitor call.
        <br>
        <br>
        Signed-off-by: Denis Obrezkov <a class="moz-txt-link-rfc2396E" href="mailto:denisobrezkov@gmail.com">&lt;denisobrezkov@gmail.com&gt;</a>
        <br>
        ---
        <br>
          xen/arch/arm/arm32/head.S             | 11 ++++++++++-
        <br>
          xen/arch/arm/platforms/omap5.c        |  5 +++--
        <br>
          xen/include/asm-arm/platforms/omap5.h |  3 +++
        <br>
          3 files changed, 16 insertions(+), 3 deletions(-)
        <br>
        <br>
        diff --git a/xen/arch/arm/arm32/head.S
        b/xen/arch/arm/arm32/head.S
        <br>
        index 5f817d473e..120e034934 100644
        <br>
        --- a/xen/arch/arm/arm32/head.S
        <br>
        +++ b/xen/arch/arm/arm32/head.S
        <br>
        @@ -36,6 +36,10 @@
        <br>
          #include EARLY_PRINTK_INC
        <br>
          #endif
        <br>
          +
        <br>
        +#define API_HYP_ENTRY 0x102
        <br>
        +#define AUX_CORE_BOOT0_PA           0x48281800
        <br>
        +
        <br>
      </blockquote>
      <br>
      I have thought a bit more about the placement of the code. I think
      it would be best if it lives in a separate file (maybe
      platforms/omap5-head.S).<br>
    </blockquote>
    <br>
    For something this trivial, it is easy to put straight into omap5.c<br>
    <br>
    Completely untested, but this ought to work:<br>
    <br>
    <pre>diff --git a/xen/arch/arm/platforms/omap5.c b/xen/arch/arm/platforms/omap5.c
index 6b5cc15af3..1dcc92d3a4 100644
--- a/xen/arch/arm/platforms/omap5.c
+++ b/xen/arch/arm/platforms/omap5.c
@@ -23,6 +23,16 @@
 #include &lt;xen/vmap.h&gt;
 #include &lt;asm/io.h&gt;
 
+void omap5_init_secondary(void);
+asm (
+".text                            \n\t"
+"omap5_init_secondary:            \n\t"
+"        ldr   r12, =0x102        \n\t" /* API_HYP_ENTRY */
+"        adr   r0, init_secondary \n\t"
+"        smc   #0                 \n\t"
+"        b     init_secondary     \n\t"
+);
+
 static uint16_t num_den[8][2] = {
     {         0,          0 },  /* not used */
     {  26 *  64,  26 *  125 },  /* 12.0 Mhz */

</pre>
    <br>
    I personally find this favourable to introducing new stub files.<br>
    <br>
    Ultimately it is Julien/Stefano's decision, but I'd like to point it
    out as an option for anyone who is unaware.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------732A65DD8738749055F71C14--


--===============6710457968038577948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6710457968038577948==--

