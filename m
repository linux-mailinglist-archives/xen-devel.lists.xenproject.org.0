Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9561F3497D
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 15:55:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hY9rD-0001po-1b; Tue, 04 Jun 2019 13:52:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KH14=UD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hY9rB-0001pj-BH
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 13:52:05 +0000
X-Inumbo-ID: edaa748e-86cf-11e9-9294-d379a146b5b4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id edaa748e-86cf-11e9-9294-d379a146b5b4;
 Tue, 04 Jun 2019 13:52:02 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: s/ua6dcFMcC+1KaqSjFQW14IbAKTR6+0xLlBSuwR8eraiSoGxH0lfm4Ar5zerUAL4RcRHe/xIO
 H4udyYS2ANpz6ohFtoNMD3LcEQ4BHLsjvQQHcitPbHDwX1n0SaE3GY+J/a39UMr76PyaowryFV
 OZmH3LCIW/yrMGtNXdxhQlo8+bIl8bNg9vYAzaDwCsiijCX2J/JfqqG/+VyFwBt9CRVuhZoXm8
 sOK69+/on4ge7Rrrmt3PEF1SHW+osAGV+OzqlmL60tINHYZpr6WC+lpyVZde5ONJCCekIM84u8
 cEA=
X-SBRS: 2.7
X-MesageID: 1291335
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,550,1549947600"; d="scan'208,217";a="1291335"
To: Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <5CF664580200007800235089@prv1-mh.provo.novell.com>
 <5CF667500200007800235116@prv1-mh.provo.novell.com>
 <4c58c2b3-4d47-1a47-59f6-dda8b3077d9d@arm.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <b0b56e46-44a9-9ac7-a26a-284d9075f1e8@citrix.com>
Date: Tue, 4 Jun 2019 14:50:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <4c58c2b3-4d47-1a47-59f6-dda8b3077d9d@arm.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 2/4] PCI: move pdev_list field to common
 structure
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian
 Jackson <Ian.Jackson@eu.citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@cirix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============8764100593017349792=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============8764100593017349792==
Content-Type: multipart/alternative;
	boundary="------------3D34F3B132F7002A77E18B7E"
Content-Language: en-GB

--------------3D34F3B132F7002A77E18B7E
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 04/06/2019 13:55, Julien Grall wrote:
>> @@ -476,8 +474,6 @@ struct arch_domain
>>   #define has_pirq(d)        (!!((d)->arch.emulation_flags &
>> X86_EMU_USE_PIRQ))
>>   #define has_vpci(d)        (!!((d)->arch.emulation_flags &
>> X86_EMU_VPCI))
>>   -#define has_arch_pdevs(d)    (!list_empty(&(d)->arch.pdev_list))
>> -
>>   #define gdt_ldt_pt_idx(v) \
>>         ((v)->vcpu_id >> (PAGETABLE_ORDER - GDT_LDT_VCPU_SHIFT))
>>   #define pv_gdt_ptes(v) \
>> --- a/xen/include/xen/pci.h
>> +++ b/xen/include/xen/pci.h
>> @@ -121,7 +121,9 @@ struct pci_dev {
>>   };
>>     #define for_each_pdev(domain, pdev) \
>> -    list_for_each_entry(pdev, &(domain->arch.pdev_list), domain_list)
>> +    list_for_each_entry(pdev, &(domain)->pdev_list, domain_list)
>> +
>> +#define has_arch_pdevs(d) (!list_empty(&(d)->pdev_list))
>
> This feels a bit strange to keep "arch" in the macro name when the
> code is now generic. How about "domain_has_pdevs"?

I agree that keeping arch in the name is a little weird, and this is
definitely the patch to rename it in - there are only 9 instances in the
entire codebase.

For the patch overall, Acked-by: Andrew Cooper
<andrew.cooper3@citrix.com>, however this helper ends up being named.

~Andrew


--------------3D34F3B132F7002A77E18B7E
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 04/06/2019 13:55, Julien Grall
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:4c58c2b3-4d47-1a47-59f6-dda8b3077d9d@arm.com">
      <blockquote type="cite">@@ -476,8 +474,6 @@ struct arch_domain
        <br>
          #define has_pirq(d)        (!!((d)-&gt;arch.emulation_flags
        &amp; X86_EMU_USE_PIRQ))
        <br>
          #define has_vpci(d)        (!!((d)-&gt;arch.emulation_flags
        &amp; X86_EMU_VPCI))
        <br>
          -#define has_arch_pdevs(d)   
        (!list_empty(&amp;(d)-&gt;arch.pdev_list))
        <br>
        -
        <br>
          #define gdt_ldt_pt_idx(v) \
        <br>
                ((v)-&gt;vcpu_id &gt;&gt; (PAGETABLE_ORDER -
        GDT_LDT_VCPU_SHIFT))
        <br>
          #define pv_gdt_ptes(v) \
        <br>
        --- a/xen/include/xen/pci.h
        <br>
        +++ b/xen/include/xen/pci.h
        <br>
        @@ -121,7 +121,9 @@ struct pci_dev {
        <br>
          };
        <br>
            #define for_each_pdev(domain, pdev) \
        <br>
        -    list_for_each_entry(pdev, &amp;(domain-&gt;arch.pdev_list),
        domain_list)
        <br>
        +    list_for_each_entry(pdev, &amp;(domain)-&gt;pdev_list,
        domain_list)
        <br>
        +
        <br>
        +#define has_arch_pdevs(d) (!list_empty(&amp;(d)-&gt;pdev_list))
        <br>
      </blockquote>
      <br>
      This feels a bit strange to keep "arch" in the macro name when the
      code is now generic. How about "domain_has_pdevs"?<br>
    </blockquote>
    <br>
    <pre>I agree that keeping arch in the name is a little weird, and this is
definitely the patch to rename it in - there are only 9 instances in the
entire codebase.

For the patch overall, Acked-by: Andrew Cooper
<a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>, however this helper ends up being named.

~Andrew
</pre>
  </body>
</html>

--------------3D34F3B132F7002A77E18B7E--


--===============8764100593017349792==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8764100593017349792==--

