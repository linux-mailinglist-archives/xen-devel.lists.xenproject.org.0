Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A78DF28F1A1
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 13:58:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7276.18986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT1t5-00058U-8K; Thu, 15 Oct 2020 11:57:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7276.18986; Thu, 15 Oct 2020 11:57:39 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT1t5-000585-4r; Thu, 15 Oct 2020 11:57:39 +0000
Received: by outflank-mailman (input) for mailman id 7276;
 Thu, 15 Oct 2020 11:57:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LoCs=DW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kT1t4-000580-41
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 11:57:38 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f82852d-5414-4c48-86ed-039df559f224;
 Thu, 15 Oct 2020 11:57:36 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=LoCs=DW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kT1t4-000580-41
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 11:57:38 +0000
X-Inumbo-ID: 4f82852d-5414-4c48-86ed-039df559f224
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4f82852d-5414-4c48-86ed-039df559f224;
	Thu, 15 Oct 2020 11:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602763056;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to;
  bh=p5jFLXPkePOi3rvQj8z0hA6OfTK1Oc2PnfKQR1b0BNs=;
  b=U3/+27u43PVDMRwJny+8NMayfwI0S+TXP5sxt09HbCcd0ZNWT4h+nkBR
   ia6Ww+TWScercgFm4DuMDtfEkNBTydxeVZyoj6+eiIbHsyVYhFet1gibV
   odGGgGQcH3fA/Pnlmh1zFMENIR2tHkIga/Q7fEml7BgdR6Rkb37cd/rda
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: +COeSubuh7AKluxEmgAOVNOt0ijioLPIFs1FUE9jRg+SygzzHXfi1KTzG8hwBNHhaQwblyYz+S
 lI+nGRPLxqvawSAjDUenXdLxjsrXu77m3JENtL4vZ24c9DYgQADa3k6yrNYsYEmQ9lgWw2B3JJ
 cQr+JTxwD/hB+XadJZzmUjfCMcF/MGcaJU48TGAjc4qV4eivcFNIdn4xVe/2snXNCorkTTGD0d
 a+pE9hC/wQoEeqCRHxAC7z9PiRZfz0gtl71kdN3L8hnqcyqBlJjC8TtjUNysn6ZOhJa2VsesQI
 fPs=
X-SBRS: 2.5
X-MesageID: 30108690
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,378,1596513600"; 
   d="scan'208,217";a="30108690"
Subject: Re: Ryzen 4000 (Mobile) Softlocks/Micro-stutters
To: Dylanger Daly <dylangerdaly@protonmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9lQU_gCfRzGyyNb2j86pxTMi1IET1Iq7iK3994agUZPrTI5Xd-aCJAaRYuJlD3L5LT2WaV4N3-YF4xKl5ukialT0M_YD0ve6gmDFFfatpXw=@protonmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <2cc5da3e-0ad0-4647-f1ca-190788c2910b@citrix.com>
Date: Thu, 15 Oct 2020 12:57:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9lQU_gCfRzGyyNb2j86pxTMi1IET1Iq7iK3994agUZPrTI5Xd-aCJAaRYuJlD3L5LT2WaV4N3-YF4xKl5ukialT0M_YD0ve6gmDFFfatpXw=@protonmail.com>
Content-Type: multipart/alternative;
	boundary="------------6A7E07F0E413729C47F15F11"
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

--------------6A7E07F0E413729C47F15F11
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 15/10/2020 01:38, Dylanger Daly wrote:
> Hi All,
>
> I'm currently using Xen 4.14 (Qubes 4.1 OS) on a Ryzen 7 4750U PRO, by
> default I'll experience softlocks where the mouse for example will
> jolt from time to time, in this state it's not usable.
>
> Adding `dom0_max_vcpus=1 dom0_vcpus_pin` to Xen's CMDLINE results in
> no more jolting however performance isn't what it should be on an 8
> core CPU, softlocks are still a problem within domU's, any sort of UI
> animation for example.
>
> Reverting this commit (8e2aa76dc1670e82eaa15683353853bc66bf54fc)
> <https://github.com/xen-project/xen/commit/8e2aa76dc1670e82eaa15683353853bc66bf54fc> results
> in even worse performance with or without the above changes to
> CMDLINE, and it's not usable at all.
>
> Does anyone have any pointers?

Does booting with sched=credit alter the symptoms?

~Andrew

--------------6A7E07F0E413729C47F15F11
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 15/10/2020 01:38, Dylanger Daly
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:9lQU_gCfRzGyyNb2j86pxTMi1IET1Iq7iK3994agUZPrTI5Xd-aCJAaRYuJlD3L5LT2WaV4N3-YF4xKl5ukialT0M_YD0ve6gmDFFfatpXw=@protonmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div>Hi All,<br>
      </div>
      <div><br>
      </div>
      <div>I'm currently using Xen 4.14 (Qubes 4.1 OS) on a Ryzen
        7 4750U PRO, by default I'll experience softlocks where the
        mouse for example will jolt from time to time, in this state
        it's not usable.<br>
      </div>
      <div><br>
      </div>
      <div>Adding `dom0_max_vcpus=1 dom0_vcpus_pin` to Xen's CMDLINE
        results in no more jolting however performance isn't what it
        should be on an 8 core CPU, softlocks are still a problem within
        domU's, any sort of UI animation for example.<br>
      </div>
      <div><br>
      </div>
      <div>Reverting <a
href="https://github.com/xen-project/xen/commit/8e2aa76dc1670e82eaa15683353853bc66bf54fc"
          target="_blank"
title="https://github.com/xen-project/xen/commit/8e2aa76dc1670e82eaa15683353853bc66bf54fc"
          rel="nofollow" moz-do-not-send="true">this commit
          (8e2aa76dc1670e82eaa15683353853bc66bf54fc)</a> results in even
        worse performance with or without the above changes to CMDLINE,
        and it's not usable at all.<br>
      </div>
      <div><br>
      </div>
      <div>Does anyone have any pointers?<br>
      </div>
    </blockquote>
    <br>
    Does booting with sched=credit alter the symptoms?<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------6A7E07F0E413729C47F15F11--

