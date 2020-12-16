Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E242DBF4F
	for <lists+xen-devel@lfdr.de>; Wed, 16 Dec 2020 12:23:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55180.96094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpUtI-0008T7-I9; Wed, 16 Dec 2020 11:22:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55180.96094; Wed, 16 Dec 2020 11:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpUtI-0008Si-Eg; Wed, 16 Dec 2020 11:22:44 +0000
Received: by outflank-mailman (input) for mailman id 55180;
 Wed, 16 Dec 2020 11:22:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cg29=FU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kpUtH-0008Sd-M6
 for xen-devel@lists.xenproject.org; Wed, 16 Dec 2020 11:22:43 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 550920ef-f32e-4602-bd0f-c4deb4847fea;
 Wed, 16 Dec 2020 11:22:41 +0000 (UTC)
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
X-Inumbo-ID: 550920ef-f32e-4602-bd0f-c4deb4847fea
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608117760;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=penWowEIrCCaT2sBFgkZanUNFuHURfWJOg9gJ17z3GA=;
  b=RArOC3mhCmwk+WukgVOuiHb8fqX9Q0QWs24a1AyzPjlEHaf7XHNASqcK
   IEWzZ8ZnjZGL3DtblPOpysjKGQ8/AbJATYPObpC/efbSTfoIbKerQUYBK
   3a0nEQjkEVLpUqC0AwLO6fW9bJgpLXhUfZjp1ZwiGLO8sWCltYugIswZD
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: j+gInFzWtNVKXfq625TT/LdLZ7Z/jsMfLEJtcpjbKmykuFCB/fGmQgm5cL3Y1jcFlx646Mm+rb
 COsAvbr502XlI2ROmcj4cqAoLL8zQX0PWkbiytau4/DXW5IjJWYGNqJUSGqv9kmStcdbN++9ZA
 HVK2Knf0di9TKKgkSq6dCHaStl2n/Y0tcnXM4ZZ1Jbn5zrbQmg7JgLc/UN2FbVRMesyGJ3P/Vu
 YhbQcHpZZB8OW1o6Ic0Y6urncLt6/mnAEIbdHEeNNY0U/LSCoQTcvilXYLl0IuNCijbNOgr038
 dBY=
X-SBRS: 5.2
X-MesageID: 33570766
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,424,1599537600"; 
   d="scan'208";a="33570766"
Subject: Re: [PATCH v10 04/25] tools/libxenevtchn: add possibility to not
 close file descriptor on exec
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	<xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Julien Grall
	<jgrall@amazon.com>
References: <20201215163603.21700-1-jgross@suse.com>
 <20201215163603.21700-5-jgross@suse.com>
 <3c8ab988-725e-2823-23f6-d9286a04243e@citrix.com>
 <e33205e7-11cb-e463-8c6f-92cfff2c74da@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0ae8f6c8-266f-98e2-df83-17eeacabeaed@citrix.com>
Date: Wed, 16 Dec 2020 11:22:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e33205e7-11cb-e463-8c6f-92cfff2c74da@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 16/12/2020 06:06, J=C3=BCrgen Gro=C3=9F wrote:
> On 15.12.20 19:09, Andrew Cooper wrote:=C2=A0
>>
>> Additionally, something in core.c should check for unknown flags and
>> reject them them with EINVAL.=C2=A0 It was buggy that this wasn't done=

>> before, and really needs to be implemented before we start having case=
s
>> where people might plausibly pass something other than 0.
>
> Are you sure this is safe? I'm not arguing against it, but we considere=
d
> to do that and didn't dare to.

Well - you're already breaking things by adding meaning to bit 0 where
it was previously ignored.

But fundamentally - any caller passing non-zero to begin with is buggy,
and it will be less bad to fix up our input validation and given them a
clean EINVAL now.

The alternative is no error and some weird side effect when we implement
whichever bit they were settings.

~Andrew


