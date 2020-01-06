Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D928131229
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 13:29:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioRSN-0008GX-B0; Mon, 06 Jan 2020 12:26:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nws7=23=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ioRSL-0008GS-TE
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 12:26:01 +0000
X-Inumbo-ID: adcbec76-307f-11ea-88e7-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id adcbec76-307f-11ea-88e7-bc764e2007e4;
 Mon, 06 Jan 2020 12:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578313553;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to;
 bh=uYy0np9YnR+jtr/xZXEn1jngSqEKwcD67JPZet7L4yc=;
 b=VdxKQtmwGywq3cMUJU7hGT4KGVdKCdsJYc8n2evDmjH0YLhoMBAufynL
 Mn19wZCpMWVoqptkeg/tSAA1HcXsP4JxQmDkJTWL+annwaGsXpSwrjVTe
 a66QTdS+fLc0k5zcKtYEN2FHEtd9+yqBdoxN+k69KxwIh/1IramY9Ft8Q 0=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vt6EcaNRDbo/Q+WNUh9ITYLxQBONFmuwL6VkWht7EZ61B28JFJjNgmZxLgvOMJPCScovucVUpX
 1oLpERLv0OcVLsKe4otq7hO9PuQuYSZh/UaDUcPPkngjtp4VjCfAx19k53YIcUEdSD7SPQsoaB
 pJWW9MFINUXh3TVG/Z9OS2ZuJiR7XFIV6YyN+s0WDf2VqFZI2pwRfSNxVB5KPEYg8bhO2a8KtF
 Hr0ocllKPrXQ9Pr91YQvoWsGBIcGQmEHyykHKAjeB7oSJ9RvhPRNNAgZjlJULhxHrfdnR5vaSC
 Zec=
X-SBRS: 2.7
X-MesageID: 10644988
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,402,1571716800"; d="scan'208,217";a="10644988"
To: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
References: <20191126100801.124844-1-wipawel@amazon.de>
 <20191126100801.124844-8-wipawel@amazon.de>
 <355ad943-8d05-d8fa-768f-2707630a7299@citrix.com>
 <33212E65-06EE-4F80-9DAA-99F420615936@amazon.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <a1865ef2-afea-632d-da20-d872c1140c5b@citrix.com>
Date: Mon, 6 Jan 2020 12:25:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <33212E65-06EE-4F80-9DAA-99F420615936@amazon.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v6 07/12] livepatch: Add per-function
 applied/reverted state tracking marker
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, "Pohlack, Martin" <mpohlack@amazon.de>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, "Manthey, 
 Norbert" <nmanthey@amazon.de>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============2521357081165256286=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============2521357081165256286==
Content-Type: multipart/alternative;
	boundary="------------F5EB12A8EC953EA9C83AB13D"
Content-Language: en-GB

--------------F5EB12A8EC953EA9C83AB13D
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 06/01/2020 12:22, Wieczorkiewicz, Pawel wrote:
>
>
>> On 5. Jan 2020, at 12:36, Andrew Cooper <andrew.cooper3@citrix.com
>> <mailto:andrew.cooper3@citrix.com>> wrote:
>>
>> On 26/11/2019 10:07, Pawel Wieczorkiewicz wrote:
>>> @@ -1274,6 +1297,9 @@ static void livepatch_do_action(void)
>>>         else
> <snip>
>>>         break;
>>> @@ -1309,6 +1338,9 @@ static void livepatch_do_action(void)
>>>             else
>>>                 other->rc = revert_payload(other);
>>>
>>> +            if ( !was_action_consistent(other, rc ?
>>> LIVEPATCH_FUNC_APPLIED : LIVEPATCH_FUNC_NOT_APPLIED) )
>>> +                panic("livepatch: partially reverted payload
>>> '%s'!\n", other->name);
>>> +
>>>             if ( other->rc == 0 )
>>>                 revert_payload_tail(other);
>>
>> Coverity highlights that this contains dead code.
>>
>> The LIVEPATCH_ACTION_REPLACE case, unlike all others, uses other->rc,
>> which means the rc ? : check will always pass LIVEPATCH_FUNC_APPLIED
>> into was_action_consistent(), due to the rc = 0 at the head of the case
>> block.
>>
>
> Yes, this has to be other->rc instead of rc. Thanks!
>
>> If this were the only problem, switching rc to other->rc might be ok,
>> but there look to be other confusions in the surrounding code.  Would
>> you mind looking over the whole block of code for correct error handling?
>>
>
> What are the confusions in the code? Could you be more specific and
> point me to them?
>
> I have just checked the LIVEPATCH_ACTION_REPLACE case block again.
> It looks correct to me. That is, it preserves the original logic of
> error handling there.
> I just added the extensions. But, the flow for rc and other->rc should
> be the same
> and correct (modulo the was_action_consistent() bug).

So long as you've double checked and you think the rest of the logic is
fine, then ok.  It was the further mixed use of rc vs other->rc which I
was concerned about.

~Andrew


--------------F5EB12A8EC953EA9C83AB13D
Content-Type: text/html; charset="windows-1252"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 06/01/2020 12:22, Wieczorkiewicz,
      Pawel wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:33212E65-06EE-4F80-9DAA-99F420615936@amazon.com">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <br class="">
      <div><br class="">
        <blockquote type="cite" class="">
          <div class="">On 5. Jan 2020, at 12:36, Andrew Cooper &lt;<a
              href="mailto:andrew.cooper3@citrix.com" class=""
              moz-do-not-send="true">andrew.cooper3@citrix.com</a>&gt;
            wrote:</div>
          <br class="Apple-interchange-newline">
          <div class="">
            <div class="">On 26/11/2019 10:07, Pawel Wieczorkiewicz
              wrote:<br class="">
              <blockquote type="cite" class="">@@ -1274,6 +1297,9 @@
                static void livepatch_do_action(void)<br class="">
                        else<br class="">
              </blockquote>
            </div>
          </div>
        </blockquote>
        &lt;snip&gt;<br class="">
        <blockquote type="cite" class="">
          <div class="">
            <div class="">
              <blockquote type="cite" class="">        break;<br
                  class="">
                @@ -1309,6 +1338,9 @@ static void
                livepatch_do_action(void)<br class="">
                            else<br class="">
                                other-&gt;rc = revert_payload(other);<br
                  class="">
                <br class="">
                +            if ( !was_action_consistent(other, rc ?
                LIVEPATCH_FUNC_APPLIED : LIVEPATCH_FUNC_NOT_APPLIED) )<br
                  class="">
                +                panic("livepatch: partially reverted
                payload '%s'!\n", other-&gt;name);<br class="">
                +<br class="">
                            if ( other-&gt;rc == 0 )<br class="">
                                revert_payload_tail(other);<br class="">
              </blockquote>
              <br class="">
              Coverity highlights that this contains dead code.<br
                class="">
              <br class="">
              The LIVEPATCH_ACTION_REPLACE case, unlike all others, uses
              other-&gt;rc,<br class="">
              which means the rc ? : check will always pass
              LIVEPATCH_FUNC_APPLIED<br class="">
              into was_action_consistent(), due to the rc = 0 at the
              head of the case<br class="">
              block.<br class="">
              <br class="">
            </div>
          </div>
        </blockquote>
        <div><br class="">
        </div>
        <div>Yes, this has to be other-&gt;rc instead of rc. Thanks!</div>
        <br class="">
        <blockquote type="cite" class="">
          <div class="">
            <div class="">If this were the only problem, switching rc to
              other-&gt;rc might be ok,<br class="">
              but there look to be other confusions in the surrounding
              code.  Would<br class="">
              you mind looking over the whole block of code for correct
              error handling?<br class="">
              <br class="">
            </div>
          </div>
        </blockquote>
        <div><br class="">
        </div>
        <div>What are the confusions in the code? Could you be more
          specific and point me to them?</div>
        <div><br class="">
        </div>
        <div>I have just checked the LIVEPATCH_ACTION_REPLACE case block
          again.</div>
        <div>It looks correct to me. That is, it preserves the original
          logic of error handling there.</div>
        <div>I just added the extensions. But, the flow for rc and
          other-&gt;rc should be the same</div>
        <div>and correct (modulo the was_action_consistent() bug).</div>
      </div>
    </blockquote>
    <br>
    So long as you've double checked and you think the rest of the logic
    is fine, then ok.  It was the further mixed use of rc vs
    other-&gt;rc which I was concerned about.<br>
    <br>
    ~Andrew<br>
    <br>
  </body>
</html>

--------------F5EB12A8EC953EA9C83AB13D--


--===============2521357081165256286==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2521357081165256286==--

