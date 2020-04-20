Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD40D1B16C3
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 22:17:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQcqa-0004Qx-Ug; Mon, 20 Apr 2020 20:16:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=61/n=6E=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jQcqZ-0004Ql-Be
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 20:16:51 +0000
X-Inumbo-ID: ddfcc4da-8343-11ea-90a5-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ddfcc4da-8343-11ea-90a5-12813bfff9fa;
 Mon, 20 Apr 2020 20:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587413810;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=9XsHSpVgplvVQrJBKTgSYyVxLH1WryzAKV3bjpi9r9A=;
 b=em0ysZHoibH8np+JRDi/Lo1yvZPjUI3vbV+y38hy7G7Ogu5TZycgcrdc
 Ykif4kGvjHS0nCht3nOLdu+KrC9/JqmzxkHqpfLY0nOqGbH1H1GbwRq8T
 GwTRzIoK0VxSPb8RqQgILQ86ibwDvt4haB1kxXrjCHHcYvj5m5K11uWiN I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5KlfpzTaGjUzWPOT65dlL7Y6WTJEUFvOea1IHb3rOvn2o0FsGfEzRDT3iFD0ONEJ1t+7nMbHbi
 663pp4va7LGdFQ16w8xylAXjEwYHFvmKnegfdIEmX9yZqYtNiOkV74YITzScfhPeMDPcZyZIZP
 DkIkXYdm51gw+NpFlNZCz09NU8VaVxu37NgeHV70P2pslWwHe/RhpSL6vVP81LFg7SJxAI/I/3
 RNSLAr6HOhPWCPzMLG4jzyE/ZMIlzZYuNsPsvT+Mpie8d0uvYau1dAoiP82Fy/Q39oAlbSNHch
 b5E=
X-SBRS: 2.7
X-MesageID: 16642379
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,407,1580792400"; d="scan'208";a="16642379"
Subject: Re: [PATCH v2 2/2] x86: validate VM assist value in
 arch_set_info_guest()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <51dfb592-2653-738f-6933-9521ffa4fecd@suse.com>
 <f46967a9-f55d-63f1-1825-352a122fdd8e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <eb5a529b-4adb-7307-38a6-f146cbc80c9a@citrix.com>
Date: Mon, 20 Apr 2020 21:16:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f46967a9-f55d-63f1-1825-352a122fdd8e@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14/04/2020 12:35, Jan Beulich wrote:
> While I can't spot anything that would go wrong, just like the
> respective hypercall only permits applicable bits to be set, we should
> also do so when loading guest context.
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

