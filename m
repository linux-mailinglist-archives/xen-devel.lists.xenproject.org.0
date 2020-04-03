Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BA419D6DF
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 14:43:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKLf0-0003p4-R3; Fri, 03 Apr 2020 12:42:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=okFK=5T=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jKLez-0003oz-FH
 for xen-devel@lists.xen.org; Fri, 03 Apr 2020 12:42:57 +0000
X-Inumbo-ID: a3e47dd6-75a8-11ea-bd06-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a3e47dd6-75a8-11ea-bd06-12813bfff9fa;
 Fri, 03 Apr 2020 12:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585917776;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=GB+UzNsb0WpNA5Fk9PHZBaIvSA7QPsTZnOv85s4Ksns=;
 b=eUNzJKg226b8rwXckmHdKrIjskIgcLfC+619zNtUoSI6SRBwXMOqj1d5
 C0c5HmyAE37iM8w+gzL6hc/eoBUDn3uqyNws7AB8mJXCceQZfkuZ9POAc
 InK5YTftBCEkuTnid9XRXIVIg+9PEqXztKV7QOuOOYzFazxVwBvgiW/qS 8=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: XAYd7pj08FBM3tUzRDNos8PJAI3MFLTUU6i4EBPNQZ2CxY0lLMl0mDL5f8I84afq0Y30Y2cSWr
 9pka7dt4VSE+jMzJFFeo1coIZrBzW3XwliIrhKrSfLYHvOZHa8odGjG1Uyf6mJGMsDLaEtY0HJ
 4/exBw1WPPuQWLiJeBx8BPCbwXbHq24bFLqzJSWHq3cjFrIHkRh88TL7rhP2asY44BnuPPWbuE
 82tqSZk3VQUmu5TloWs1mkc8p5VTGrWykr/F9jewTJZuwgnmltsjybUL1hLftgDJtryCmiIkvM
 GEE=
X-SBRS: 2.7
X-MesageID: 15452674
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,339,1580792400"; d="scan'208";a="15452674"
Subject: Re: Live migration and PV device handling
To: Anastassios Nanos <anastassios.nanos@sunlight.io>,
 <xen-devel@lists.xen.org>
References: <CABB6KG-UCdPTa3yM57JB13G=Yebe8chuQKvKkNbtoGRSZ9Ypsw@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a8c56ab0-bc51-fa1c-c63f-cb9ada8a1823@citrix.com>
Date: Fri, 3 Apr 2020 13:42:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CABB6KG-UCdPTa3yM57JB13G=Yebe8chuQKvKkNbtoGRSZ9Ypsw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03/04/2020 13:32, Anastassios Nanos wrote:
> Hi all,
>
> I am trying to understand how live-migration happens in xen. I am
> looking in the HVM guest case and I have dug into the relevant parts
> of the toolstack and the hypervisor regarding memory, vCPU context
> etc.
>
> In particular, I am interested in how PV device migration happens. I
> assume that the guest is not aware of any suspend/resume operations
> being done

Sadly, this assumption is not correct.  HVM guests with PV drivers
currently have to be aware in exactly the same way as PV guests.

Work is in progress to try and address this.  See
https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=775a02452ddf3a6889690de90b1a94eb29c3c732
(sorry - for some reason that doc isn't being rendered properly in
https://xenbits.xen.org/docs/ )

~Andrew

