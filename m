Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 723BB1C9703
	for <lists+xen-devel@lfdr.de>; Thu,  7 May 2020 19:02:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWjtm-0005rc-Sq; Thu, 07 May 2020 17:01:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gPsh=6V=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jWjtl-0005rX-Ad
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 17:01:25 +0000
X-Inumbo-ID: 5e5d6af9-9084-11ea-9f50-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5e5d6af9-9084-11ea-9f50-12813bfff9fa;
 Thu, 07 May 2020 17:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588870880;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=ur5VtiotyWcbSJIqszELjrS4++33DvzXvBT6MW4p10Q=;
 b=RGtckSUVWwU6jM4lOM7eYdC3r1zZs9Sb+qEDH3kaU+YoqY6cTuTv/Y39
 WlTi/tVGB6552+joY0oZ53TJ2RbbZo7q9ZlfBlkhVyN3VSZfoW6j4nczs
 B13srbzMz/sVIL6wgdRzFD+yZdr2deVK9YCpjs3ntDL8vRp0Eacm8OXvo o=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: MfqJggDCYZAEjZN18NUPuygfIq++wVfxO4jIuFdwtOzdGVTibxfvHx0ZuLUIdmm0hYm+BfB98y
 QTeaIhwh9InKdxl7ZzCqWoUVztu6ai/Y6vNsIRpcXMqPXjSfJ/iCgWuijJs81C4niZZLI9ClYT
 NMLmayTyoA1z1vjibx7/fFfLczVX3x37tMxKmXu3Takm710/kdpd7nmpSWeWtHZE3BjZfVHn7i
 m1kOrqifomdgMFDm64FDzldb3RLvA2UWnUttV+Haxb86/xkgDWoGSRLMiKmWQFJ0+2rvHX7tv8
 gB4=
X-SBRS: 2.7
X-MesageID: 17687438
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,364,1583211600"; d="scan'208";a="17687438"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <24244.16076.627203.282982@mariner.uk.xensource.com>
Date: Thu, 7 May 2020 18:01:00 +0100
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH RESEND 2/2] xen: Allow EXPERT mode to be selected from the
 menuconfig directly
In-Reply-To: <1d8eb504-51e9-b8e7-f1af-862760f0f15d@xen.org>
References: <20200430142548.23751-1-julien@xen.org>
 <20200430142548.23751-3-julien@xen.org>
 <3a4ec020-f626-031e-73a6-b2eee97ab9e8@suse.com>
 <123BE55A-AACB-4FE3-94E2-1559ED73DD09@citrix.com>
 <24240.3047.877655.345428@mariner.uk.xensource.com>
 <1d8eb504-51e9-b8e7-f1af-862760f0f15d@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Julien Grall writes ("Re: [PATCH RESEND 2/2] xen: Allow EXPERT mode to be selected from the menuconfig directly"):
> On 04/05/2020 13:34, Ian Jackson wrote:
> > George Dunlap writes ("Re: [PATCH RESEND 2/2] xen: Allow EXPERT mode to be selected from the menuconfig directly"):
> >> On Apr 30, 2020, at 3:50 PM, Jan Beulich <JBeulich@suse.com> wrote:
> >>> Well, if I'm not mis-remembering it was on purpose to make it more
> >>> difficult for people to declare themselves "experts". FAOD I'm not
> >>> meaning to imply I don't see and accept the frustration aspect you
> >>> mention further up. The two need to be carefully weighed against
> >>> one another.
> > 
> > Yes, it was on purpose.  However, I had my doubts at the time and
> > I think experience has shown that this was a mistake.
> > 
> >> I don’t think we need to make it difficult for people to declare
> >> themselves experts, particularly as “all” it means at the moment is,
> >> “Can build something which is not security supported”.  People who
> >> are building their own hypervisors are already pretty well advanced;
> >> I think we can let them shoot themselves in the foot if they want
> >> to.
> > 
> > Precisely.
> 
> Can I consider this as an Acked-by? :)

I am happy with the principle of the change.  I haven't reviewed the
details of the commit message etc.

I reviewed the thread and there were two concernes raised:

 * The question of principle.  I disagree with this concern
   because I approve of principle of the patch.

 * Some detail about the precise justificaton as written in
   the commit message, regarding `clean' targets.  Apparently the
   assertion may not be completely true.  I haven't seen a proposed
   alternative wording.

I don't feel I should ack a controversial patch with an unresolved
wording issue.  Can you tell me what your proposed wording is ?
To avoid blocking this change I would be happy to review your wording
and see if it meets my reading of the stated objection.

Alternatively, if you can get agreement from others on the wording of
the commit message, you may put my ack on the patch.

HTH,
Ian.

