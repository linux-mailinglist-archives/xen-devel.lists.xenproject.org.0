Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D18072E0ACC
	for <lists+xen-devel@lfdr.de>; Tue, 22 Dec 2020 14:34:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57852.101412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krhms-0002bD-1O; Tue, 22 Dec 2020 13:33:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57852.101412; Tue, 22 Dec 2020 13:33:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krhmr-0002ao-TL; Tue, 22 Dec 2020 13:33:13 +0000
Received: by outflank-mailman (input) for mailman id 57852;
 Tue, 22 Dec 2020 13:33:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=if9N=F2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1krhmp-0002aj-QS
 for xen-devel@lists.xenproject.org; Tue, 22 Dec 2020 13:33:11 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ccccdc02-1497-44ce-a857-172d72b43d6b;
 Tue, 22 Dec 2020 13:33:09 +0000 (UTC)
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
X-Inumbo-ID: ccccdc02-1497-44ce-a857-172d72b43d6b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608643989;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=B910IV10YJCOGXeO+mzYlyOiOazKXkt5jawqu+hoPXY=;
  b=Ok/4udg2OGzWqsY9iKop43YnbiG3OoRGP86QPmchaEK9FplpEkpjD2uz
   e3gkss/yqzomAe51MLckYLvsl8vfLVOHJ3ZM/AlY+JUvj8WEmU2WFqsaG
   mcA7wDEfjUxIq1ZrPvDFsL8BUcWFVikH+/1HNFipGPSywAGpkabQyUUNJ
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: VZ/FELI8126R1aSUnzT0L/WRrWER1hmdbf2vzwFw/Ehvo9mLYnbg2God0pcL+dmAky2noZXTj7
 PMlONQxoTlq8MihfwXsq6Hoo7zA0PjGVwU4n9BwD8TppaTqEy3zHVaMMxvS20G3w0oAUpZToSk
 e9CxBOYEojhONFR4/I/94c8VnoZGALlk6bjtdlXnEN2ytfcOojsoZy2U0nfcqhdnEOgUSyj1Au
 K9h5uwod7QOFSjslgHuT8vp99liZ9QwZ9Gw2IlY4Px3WRVxGotK5eLWSJvf62KOA5ASTwkX4KZ
 ti0=
X-SBRS: 5.2
X-MesageID: 33741732
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,438,1599537600"; 
   d="scan'208";a="33741732"
Subject: Re: [PATCH 3/3] xen/evtchn: Clean up teardown handling
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
References: <20201221181446.7791-1-andrew.cooper3@citrix.com>
 <20201221181446.7791-4-andrew.cooper3@citrix.com>
 <3d72bcb6-dabf-2b26-cecd-5f2d36505bd5@suse.com>
 <683f7808-aad7-1c42-e9e9-3e251e1a4561@citrix.com>
 <5d66a8c9-e3d6-e329-7daf-6b1d0e220e13@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <91ec88c5-fa7b-e700-2466-322dd3db7397@citrix.com>
Date: Tue, 22 Dec 2020 13:33:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5d66a8c9-e3d6-e329-7daf-6b1d0e220e13@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 22/12/2020 11:52, Jan Beulich wrote:
> On 22.12.2020 12:28, Andrew Cooper wrote:
>> On 22/12/2020 10:48, Jan Beulich wrote:
>>> On 21.12.2020 19:14, Andrew Cooper wrote:
>>>> First of all, rename the evtchn APIs:
>>>>  * evtchn_destroy       => evtchn_teardown
>>>>  * evtchn_destroy_final => evtchn_destroy
>>> I wonder in how far this is going to cause confusion with backports
>>> down the road. May I suggest to do only the first of the two renames,
>>> at least until in a couple of year's time? Or make the second rename
>>> to e.g. evtchn_cleanup() or evtchn_deinit()?
>> I considered backports, but I don't think it will be an issue.  The
>> contents of the two functions are very different, and we're not likely
>> to be moving the callers in backports.
> Does the same also apply to the old and new call sites of the functions?

I don't understand your question.  I don't intend the new callsites to
ever move again, now they're part of the properly idempotent path, and
any movement in the older trees would be wrong for anything other than
backporting this fix, which clearly isn't a backport candidate.

(That said - there's a memory leak I need to create a backport for...)

>> I'm not fussed about the exact naming, so long as we can make and
>> agreement and adhere to it strictly.  The current APIs are a total mess.
>>
>> I used teardown/destroy because that seems to be one common theme in the
>> APIs, but it will require some to change their name.
> So for domains "teardown" and "destroy" pair up with "create". I don't
> think evtchn_create() is a sensible name (the function doesn't really
> "create" anything); evtchn_init() seems quite a bit better to me, and
> hence evtchn_deinit() could be its counterpart.

You're never going to find a perfect name for all cases, and in this
proposal, you've still got evtchn_init/deinit/destroy() as a triple.

What we do need is some clear rules, which will live in the forthcoming
"lifecycle of a domain" document.

> In particular I don't
> think all smaller entity functions involved in doing "xyz" for a
> larger entity need to have "xyz" in their names.

While in principle I agree, I'm not sure the value if having perfect
names outweighs the value of having a simple set of guidelines.

~Andrew

