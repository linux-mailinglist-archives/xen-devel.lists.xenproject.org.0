Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C31B1A918CA
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 12:07:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957292.1350444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5M8n-0003jQ-Lw; Thu, 17 Apr 2025 10:06:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957292.1350444; Thu, 17 Apr 2025 10:06:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5M8n-0003hy-JA; Thu, 17 Apr 2025 10:06:41 +0000
Received: by outflank-mailman (input) for mailman id 957292;
 Thu, 17 Apr 2025 10:06:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s05F=XD=nppct.ru=sdl@srs-se1.protection.inumbo.net>)
 id 1u5M8l-0003hs-6o
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 10:06:40 +0000
Received: from mail.nppct.ru (mail.nppct.ru [195.133.245.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a53bf121-1b73-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 12:06:36 +0200 (CEST)
Received: from mail.nppct.ru (localhost [127.0.0.1])
 by mail.nppct.ru (Postfix) with ESMTP id B1D331C0E85
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 13:06:28 +0300 (MSK)
Received: from mail.nppct.ru ([127.0.0.1])
 by mail.nppct.ru (mail.nppct.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id QL2QoR6GtQbS for <xen-devel@lists.xenproject.org>;
 Thu, 17 Apr 2025 13:06:20 +0300 (MSK)
Received: from [172.16.0.185] (unknown [176.59.174.214])
 by mail.nppct.ru (Postfix) with ESMTPSA id E7C761C0B18;
 Thu, 17 Apr 2025 13:06:15 +0300 (MSK)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: a53bf121-1b73-11f0-9ffb-bf95429c2676
Authentication-Results: mail.nppct.ru (amavisd-new); dkim=pass (1024-bit key)
	reason="pass (just generated, assumed good)" header.d=nppct.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nppct.ru; h=
	in-reply-to:from:from:content-language:references:to:subject
	:subject:user-agent:mime-version:date:date:message-id
	:content-type:content-type; s=dkim; t=1744884380; x=1745748381;
	 bh=Qwhi2s63HsxRtHICbBpWGt5b2QqGDsQZCyOZuPfERcs=; b=aF1PMShgR4s2
	rIdnPPryN3jLcI2o7KDlTCVNW6frRFDm06VKAdeq0FvKgdSD32R90XC1ZDZRpRLq
	E+TtslvjJSCsJUEKG+BfMzm6czCCPrOvoTShDhXkHJMntAZg36KmTWkzdwQ35qOv
	fYA5A5Y+qzGd5VB66Hl7i9kOXzRqjas=
X-Virus-Scanned: Debian amavisd-new at mail.nppct.ru
Content-Type: multipart/alternative;
 boundary="------------bqF0MSv5WJ0c3whaFFPtK5rv"
Message-ID: <8264519a-d58a-486e-b3c5-dba400658513@nppct.ru>
Date: Thu, 17 Apr 2025 13:06:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen-netfront: handle NULL returned by
 xdp_convert_buff_to_frame()
To: Juergen Gross <jgross@suse.com>, Jakub Kicinski <kuba@kernel.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, xen-devel@lists.xenproject.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 lvc-project@linuxtesting.org, stable@vger.kernel.org
References: <20250414183403.265943-1-sdl@nppct.ru>
 <20250416175835.687a5872@kernel.org>
 <fa91aad9-f8f3-4b27-81b3-4c963e2e64aa@nppct.ru>
 <0c29a3f9-9e22-4e44-892d-431f06555600@suse.com>
 <452bac2e-2840-4db7-bbf4-c41e94d437a8@nppct.ru>
 <ed8dec2a-f507-49be-a6f3-fb8a91bfef01@suse.com>
Content-Language: en-US
From: Alexey <sdl@nppct.ru>
In-Reply-To: <ed8dec2a-f507-49be-a6f3-fb8a91bfef01@suse.com>

This is a multi-part message in MIME format.
--------------bqF0MSv5WJ0c3whaFFPtK5rv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 17.04.2025 11:51, Juergen Gross wrote:
> On 17.04.25 10:45, Alexey wrote:
>>
>> On 17.04.2025 10:12, Jürgen Groß wrote:
>>> On 17.04.25 09:00, Alexey wrote:
>>>>
>>>> On 17.04.2025 03:58, Jakub Kicinski wrote:
>>>>> On Mon, 14 Apr 2025 18:34:01 +0000 Alexey Nepomnyashih wrote:
>>>>>>           get_page(pdata);
>>>>> Please notice this get_page() here.
>>>>>
>>>>>>           xdpf = xdp_convert_buff_to_frame(xdp);
>>>>>> +        if (unlikely(!xdpf)) {
>>>>>> + trace_xdp_exception(queue->info->netdev, prog, act);
>>>>>> +            break;
>>>>>> +        }
>>>> Do you mean that it would be better to move the get_page(pdata) 
>>>> call lower,
>>>> after checking for NULL in xdpf, so that the reference count is 
>>>> only increased
>>>> after a successful conversion?
>>>
>>> I think the error handling here is generally broken (or at least very
>>> questionable).
>>>
>>> I suspect that in case of at least some errors the get_page() is 
>>> leaking
>>> even without this new patch.
>>>
>>> In case I'm wrong a comment reasoning why there is no leak should be
>>> added.
>>>
>>>
>>> Juergen
>>
>> I think pdata is freed in xdp_return_frame_rx_napi() -> __xdp_return()
>
> Agreed. But what if xennet_xdp_xmit() returns an error < 0?
>
> In this case xdp_return_frame_rx_napi() won't be called.
>
>
> Juergen

Agreed. There is no explicit freed pdata in the calling function
xennet_get_responses(). Without this, the page referenced by pdata
could be leaked.

I suggest:

case XDP_TX: -get_page(pdata); xdpf = xdp_convert_buff_to_frame(xdp); 
+if (unlikely(!xdpf)) { +trace_xdp_exception(queue->info->netdev, prog, 
act); +break; +} +get_page(pdata); err = 
xennet_xdp_xmit(queue->info->netdev, 1, &xdpf, 0); if (unlikely(!err)) 
xdp_return_frame_rx_napi(xdpf); -else if (unlikely(err < 0)) +else if 
(unlikely(err < 0)) { trace_xdp_exception(queue->info->netdev, prog, 
act); +xdp_return_frame_rx_napi(xdpf); +} break; case XDP_REDIRECT: 
get_page(pdata); err = xdp_do_redirect(queue->info->netdev, xdp, prog); 
*need_xdp_flush = true; -if (unlikely(err)) +if (unlikely(err)) { 
trace_xdp_exception(queue->info->netdev, prog, act); 
+__xdp_return(page_address(pdata), &xdp->mem, true, xdp); +} break;

--------------bqF0MSv5WJ0c3whaFFPtK5rv
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 17.04.2025 11:51, Juergen Gross
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:ed8dec2a-f507-49be-a6f3-fb8a91bfef01@suse.com">On
      17.04.25 10:45, Alexey wrote:
      <br>
      <blockquote type="cite">
        <br>
        On 17.04.2025 10:12, Jürgen Groß wrote:
        <br>
        <blockquote type="cite">On 17.04.25 09:00, Alexey wrote:
          <br>
          <blockquote type="cite">
            <br>
            On 17.04.2025 03:58, Jakub Kicinski wrote:
            <br>
            <blockquote type="cite">On Mon, 14 Apr 2025 18:34:01 +0000
              Alexey Nepomnyashih wrote:
              <br>
              <blockquote type="cite">          get_page(pdata);
                <br>
              </blockquote>
              Please notice this get_page() here.
              <br>
              <br>
              <blockquote type="cite">          xdpf =
                xdp_convert_buff_to_frame(xdp);
                <br>
                +        if (unlikely(!xdpf)) {
                <br>
                +           
                trace_xdp_exception(queue-&gt;info-&gt;netdev, prog,
                act);
                <br>
                +            break;
                <br>
                +        }
                <br>
              </blockquote>
            </blockquote>
            Do you mean that it would be better to move the
            get_page(pdata) call lower,
            <br>
            after checking for NULL in xdpf, so that the reference count
            is only increased
            <br>
            after a successful conversion?
            <br>
          </blockquote>
          <br>
          I think the error handling here is generally broken (or at
          least very
          <br>
          questionable).
          <br>
          <br>
          I suspect that in case of at least some errors the get_page()
          is leaking
          <br>
          even without this new patch.
          <br>
          <br>
          In case I'm wrong a comment reasoning why there is no leak
          should be
          <br>
          added.
          <br>
          <br>
          <br>
          Juergen
          <br>
        </blockquote>
        <br>
        I think pdata is freed in xdp_return_frame_rx_napi() -&gt;
        __xdp_return()
        <br>
      </blockquote>
      <br>
      Agreed. But what if xennet_xdp_xmit() returns an error &lt; 0?
      <br>
      <br>
      In this case xdp_return_frame_rx_napi() won't be called.
      <br>
      <br>
      <br>
      Juergen
      <br>
    </blockquote>
    <p>Agreed. There is no explicit freed pdata in the calling function<br>
      xennet_get_responses(). Without this, the page referenced by pdata<br>
      could be leaked.</p>
    <p>I suggest:</p>
    <pre><span class="token unchanged"><span
    class="token prefix unchanged"> </span><span class="token line">	case XDP_TX:
</span></span><span class="token deleted-sign deleted"><span
    class="token prefix deleted">-</span><span class="token line">		get_page(pdata);
</span></span><span class="token unchanged"><span
    class="token prefix unchanged"> </span><span class="token line">		xdpf = xdp_convert_buff_to_frame(xdp);
</span></span><span class="token inserted-sign inserted"><span
    class="token prefix inserted">+</span><span class="token line">		if (unlikely(!xdpf)) {
</span><span class="token prefix inserted">+</span><span
    class="token line">			trace_xdp_exception(queue-&gt;info-&gt;netdev, prog, act);
</span><span class="token prefix inserted">+</span><span
    class="token line">			break;
</span><span class="token prefix inserted">+</span><span
    class="token line">		}
</span><span class="token prefix inserted">+</span><span
    class="token line">		get_page(pdata);
</span></span><span class="token unchanged"><span
    class="token prefix unchanged"> </span><span class="token line">		err = xennet_xdp_xmit(queue-&gt;info-&gt;netdev, 1, &amp;xdpf, 0);
</span><span class="token prefix unchanged"> </span><span
    class="token line">		if (unlikely(!err))
</span><span class="token prefix unchanged"> </span><span
    class="token line">			xdp_return_frame_rx_napi(xdpf);
</span></span><span class="token deleted-sign deleted"><span
    class="token prefix deleted">-</span><span class="token line">		else if (unlikely(err &lt; 0))
</span></span><span class="token inserted-sign inserted"><span
    class="token prefix inserted">+</span><span class="token line">		else if (unlikely(err &lt; 0)) {
</span></span><span class="token unchanged"><span
    class="token prefix unchanged"> </span><span class="token line">			trace_xdp_exception(queue-&gt;info-&gt;netdev, prog, act);
</span></span><span class="token inserted-sign inserted"><span
    class="token prefix inserted">+</span><span class="token line">			xdp_return_frame_rx_napi(xdpf);
</span><span class="token prefix inserted">+</span><span
    class="token line">		}
</span></span><span class="token unchanged"><span
    class="token prefix unchanged"> </span><span class="token line">		break;
</span><span class="token prefix unchanged"> </span><span
    class="token line">	case XDP_REDIRECT:
</span><span class="token prefix unchanged"> </span><span
    class="token line">		get_page(pdata);
</span><span class="token prefix unchanged"> </span><span
    class="token line">		err = xdp_do_redirect(queue-&gt;info-&gt;netdev, xdp, prog);
</span><span class="token prefix unchanged"> </span><span
    class="token line">		*need_xdp_flush = true;
</span></span><span class="token deleted-sign deleted"><span
    class="token prefix deleted">-</span><span class="token line">		if (unlikely(err))
</span></span><span class="token inserted-sign inserted"><span
    class="token prefix inserted">+</span><span class="token line">		if (unlikely(err)) {
</span></span><span class="token unchanged"><span
    class="token prefix unchanged"> </span><span class="token line">			trace_xdp_exception(queue-&gt;info-&gt;netdev, prog, act);
</span></span><span class="token inserted-sign inserted"><span
    class="token prefix inserted">+</span><span class="token line">			__xdp_return(page_address(pdata), &amp;xdp-&gt;mem, true, xdp);
</span><span class="token prefix inserted">+</span><span
    class="token line">		}
</span></span><span class="token unchanged"><span
    class="token prefix unchanged"> </span><span class="token line">		break;</span></span></pre>
  </body>
</html>

--------------bqF0MSv5WJ0c3whaFFPtK5rv--

