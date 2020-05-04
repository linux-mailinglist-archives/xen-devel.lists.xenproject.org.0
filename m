Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6891C41A6
	for <lists+xen-devel@lfdr.de>; Mon,  4 May 2020 19:13:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVedt-0008Ev-B2; Mon, 04 May 2020 17:12:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SbWK=6S=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jVeds-0008Eq-F9
 for xen-devel@lists.xenproject.org; Mon, 04 May 2020 17:12:32 +0000
X-Inumbo-ID: 6faef42a-8e2a-11ea-9d3b-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6faef42a-8e2a-11ea-9d3b-12813bfff9fa;
 Mon, 04 May 2020 17:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588612351;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=B+d6I1J6DSHGkVXz26upfmgklP4aKmjkpXU/WYX8rgQ=;
 b=CMz/QXBOGiYt3mz1v19r3BTE+BeOvGHA0Cv43hAkD1jQ097Qo7wjgQgG
 YzLyrG8GXbwE+/9xQUZcocKq0Qh7mt9w9lKIiHRTaFIi5qc7BQvwm1WjK
 +phrJVJWzitbjqxrXXeVHw4CCu/IMLPIEotWjSvt8fpP+tjCVMUE1FjML k=;
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
IronPort-SDR: x0opOaB4aaHfUbCUEGbOkWP1KkFZLDaANwSFSHm9Dpf42t9I+94Hvmlh3N3ddZbE3iKo54xhzu
 n1z1XwrFxeC/zkMJPKQ1JpITpJhaOLofBg40lIzc4KNCtBUzDC5ptpK1WXz9kHbcfve5wo4TT4
 THLrqeGSo7efVrbdF2nrZmkvG1DqJ5nqQvPHrrNIfzRTgv7v6kEtQ8Pa4hR1Z+0WOYJewM/MMX
 tt9rjqRX8eMtioD2a1wIzp8ZBJLyVCIygiTqXHRrzVWVTeDUhVcAdQ1vmTCqWdYKH6BFaeXUBb
 FIw=
X-SBRS: 2.7
X-MesageID: 16957999
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,352,1583211600"; d="scan'208";a="16957999"
Subject: Re: [PATCH] x86emul: extend x86_insn_is_mem_write() coverage
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <5bf829b6-c60d-7849-e2a5-f84485849197@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f0fea332-6f79-70a3-502a-6e8e3193115e@citrix.com>
Date: Mon, 4 May 2020 18:12:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5bf829b6-c60d-7849-e2a5-f84485849197@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04/05/2020 16:06, Jan Beulich wrote:
> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
>
> Several insns were missed when this function was first added. As far as
> insns already supported by the emulator go - SMSW and {,V}STMXCSR were
> wrongly considered r/o insns so far.
>
> Insns like the VMX, SVM, or CET-SS ones, PTWRITE, or AMD's new SNP ones
> are intentionally not covered just yet. VMPTRST is put there just to
> complete the respective group.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

