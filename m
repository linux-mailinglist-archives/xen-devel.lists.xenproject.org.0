Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE82194217
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 15:53:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHTqX-0003RU-Pq; Thu, 26 Mar 2020 14:51:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4pkz=5L=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jHTqV-0003RK-Cz
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 14:50:59 +0000
X-Inumbo-ID: 33ccee58-6f71-11ea-8803-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 33ccee58-6f71-11ea-8803-12813bfff9fa;
 Thu, 26 Mar 2020 14:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585234259;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=bodu48aQchL7pvkTh/OIRHNut+30xq96pMJPzVrtuXI=;
 b=cvndHVX3IReWbeiu7jMJH+bKobJrT4bU0laH0yKpB8cFIZPf2yF7XqqA
 l4shCc2ocXL+p5oPZVhc5umhtqa0368GMhZFNdTmILlKyxw4ZzArjc0Gv
 XwGuB1e0sCIL8GeyfW+2511c6W+RPgcWHOXDHUyAruxdU6SQy3nBjZFcA g=;
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
IronPort-SDR: tVAD0Yw5RYnyaChXDQHBxP+ypJoSVEoxHhWZVuIVq1AYl4r/jT81VyNG2po2aHgLqUUrUf6+DG
 z3VL0EeHYPXMc07HjN78miRyulcKX1TjPi1B+6NQA35wnlzcwK/R5lJ0zmIGLheK4EMNcQSaVh
 hn3+pMUnnVGKe+UKVSp3/ce79fjEPvlQLtiwhWQAYiN49/S1yGEKqlLyzDOD3FAKmFYSllgFPc
 dtVCcuNpY/5RrdCoefqM+pasqDeLPVZQ74Gl/UX95qBsoI8wYyCNfLEY0uHkXJiFGfrIA/S4ji
 3HU=
X-SBRS: 2.7
X-MesageID: 14901986
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,308,1580792400"; d="scan'208";a="14901986"
To: Jan Beulich <jbeulich@suse.com>
References: <20200323101724.15655-1-andrew.cooper3@citrix.com>
 <20200323101724.15655-8-andrew.cooper3@citrix.com>
 <de9a73c3-4568-c010-4669-e39aa0b9c31d@suse.com>
 <3e157f6d-e237-68d2-f628-10f4d42e578b@citrix.com>
 <a7a03cf2-a8ce-3b82-5c0c-22f4bccc0c8e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <154fef1b-5c73-4716-e649-4ea99cba3c72@citrix.com>
Date: Thu, 26 Mar 2020 14:50:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <a7a03cf2-a8ce-3b82-5c0c-22f4bccc0c8e@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 7/7] x86/ucode/intel: Fold structures
 together
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26/03/2020 12:24, Jan Beulich wrote:
> On 25.03.2020 15:32, Andrew Cooper wrote:
>> On 25/03/2020 14:16, Jan Beulich wrote:
>>> On 23.03.2020 11:17, Andrew Cooper wrote:
>>>> Currently, we allocate an 8 byte struct microcode_patch to point at a
>>>> separately allocated struct microcode_intel.  This is wasteful.
>>> As indicated elsewhere I'm very much in favor of this, but I think it
>>> wants doing in one of the earlier series, and then for AMD at the same
>>> time.
>> I've got some ideas for an AMD series given the replies I got, and will
>> be able to do an equivalent microcode_amd => microcode_patch folding on
>> that side.  There is also further work to do, including unbreaking the
>> OSVW logic (which has been totally clobbered by the start/end_update
>> debacle).
>>
>> However, given that it taken this whole series to make the transition
>> look safe on the Intel side, I really don't see a way of doing this
>> "earlier".
>>
>> In particular, no amount of ifdefary suggested below can AFAICT make it
>> safe to do this transform without having microcode_patch opaque to being
>> with.
>>
>> Yes - there is a bit of churn, but I can't see a safe alternative.
> Something like the one below (compile tested only, and not really
> cleaned up in any way)?
>
> Jan

Thanks.  I'll experiment with this approach.

On a perhaps tangential note, what (if anything) are you plans regarding
backport here?

These defines are ok for a transitional period across a series (and
probably means I'll need to get the AMD side ready to be committed at
the same time), but I don't think we'd want them in the code for the
longterm.

I personally wasn't overly concerned about backports, but if you are, we
should probably take this into consideration for the fixes.

~Andrew

