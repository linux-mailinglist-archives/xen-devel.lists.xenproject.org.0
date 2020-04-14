Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B06E01A89FB
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 20:44:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOQXG-0006OV-Bt; Tue, 14 Apr 2020 18:43:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JNOL=56=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jOQXF-0006OQ-78
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 18:43:49 +0000
X-Inumbo-ID: e016173a-7e7f-11ea-83d8-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e016173a-7e7f-11ea-83d8-bc764e2007e4;
 Tue, 14 Apr 2020 18:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586889829;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=EBQMiQ2jgYn+oPnB6DtmMKkWKmvsMtEMA+Ls2Y/8qEQ=;
 b=fiCay6QRhgTOtaFQEgJ7tkta64HMD1Fj6KxwRLE8XZfQdRdz0v+a0Qcb
 XobqcuoZaWp4RzcWTjV9ZS0/WlP9+Xh6XV2wlNjWiwMXy9AAoMtvpZvKB
 hQrsny+p+BPGOJDLuFrY9n3uSyXPzqTRDMsIjUF3E3Uq077rzSQDXsiIu 8=;
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
IronPort-SDR: Vs99ILpszvDFV58HEgzvm8EoKyhLoxYsYgjGc/fF6b1dzZ3cdmsuFAPoEReDmFDShCOqoqUDl9
 yQVU8mckMmSuanAcuOvbdowooT4Gv5OXceD8p5QT3b9Dy8wgzgUpSQDKQ7tJr9IbiDiTDXzjTE
 BNQctFsFKb5RmiSZGXV+sc7Rlze2DzuX+/26U7L6XNQZhzxLtkCkYwF+5p1cpKH5OzI7j69ork
 ecdVctcqNnymtGOjIFhgikX6pPeegp4l5bQ8OrJltrxUN9tPo32R79d8GlAWFk34Y+m6XgDMjy
 hJ4=
X-SBRS: 2.7
X-MesageID: 15909004
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,383,1580792400"; d="scan'208";a="15909004"
Subject: Re: [PATCH v2 07/17] libxc/restore: STATIC_DATA_END inference for v2
 compatibility
To: Ian Jackson <ian.jackson@citrix.com>
References: <20200127143444.25538-1-andrew.cooper3@citrix.com>
 <20200127143444.25538-8-andrew.cooper3@citrix.com>
 <24148.2202.912512.939428@mariner.uk.xensource.com>
 <cea79256-f260-1710-a783-dadec276e32a@citrix.com>
 <24161.10156.858608.199136@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <2076e9a4-c07e-9aab-1cc2-f38f7eacd8c0@citrix.com>
Date: Tue, 14 Apr 2020 19:43:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <24161.10156.858608.199136@mariner.uk.xensource.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05/03/2020 16:24, Ian Jackson wrote:
> Andrew Cooper writes ("Re: [PATCH v2 07/17] libxc/restore: STATIC_DATA_END inference for v2 compatibility"):
>> On 24/02/2020 17:32, Ian Jackson wrote:
>>> These 17 lines appears twice, in basically identical form.  Could it
>>> be refactored ?
>> Not really, no.
>>
>> The error handling (i.e. half of those 17 lines) is different, making it
>> somewhat awkward to fit into a static inline.
> You could handle that with a small bit of code around one of the call
> sites to adjust the error handling.  (Also, what a mess, but I guess
> we're here now...)

... which is the majority the code you're trying to abstract away.

>
>> More importantly however, by design, common code can't call
>> arch-specific code without a restore_ops hook.  Deduping these would
>> require breaking the restriction which is currently doing a decent job
>> of keeping x86-isms out of common code.
> I'm afraid you're going to have to explain that to me at a bit greater
> length.  The biggest thing that is confusing me about your statement
> here is that your patch is indeed adding x86-specific code to a common
> file.  But also I don't understand the comment about restore_ops
> hooks - do you mean something in restore_callbacks ?

No.  restore_callbacks are plumbing between libxl-save-helper and libxc.

restore_ops are internal to the restore code, and come in x86_pv and
x86_hvm flavours, with ARM existing in some theoretical future.  The
design of the common save/restore code had deliberate measures put in
place to make it hard to get arch-specific details slip into common
code, so porting to different architectures didn't have to start by
doing a bunch of cleanup.

tl;dr I could put an #ifdef x86'd static inline in the root common
header (xc_sr_common.h), but the overall complexity is greater than what
is presented here.

~Andrew

