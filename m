Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC6619FB62
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 19:24:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLVTo-00006F-EX; Mon, 06 Apr 2020 17:24:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z9GA=5W=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jLVTn-00006A-7S
 for xen-devel@lists.xen.org; Mon, 06 Apr 2020 17:24:11 +0000
X-Inumbo-ID: 6d3b3cd6-782b-11ea-b4f4-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6d3b3cd6-782b-11ea-b4f4-bc764e2007e4;
 Mon, 06 Apr 2020 17:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586193850;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=zv5Ps5xjHsXAYaOwPaDrmUzWPCet1fFLdpUcET3SQR4=;
 b=cOyHeIZ7dHoKdwqNIKU6J7mQcTnMU2q3VJxosSZZpSCbF0+fapF33zSj
 BgGnz0RGOjoCuRrf7r9No8WnrKZl5JqnhwIhaUX3gSYJwekQlZwQZMgID
 E0j0Wz8mpO3N1fkgPpNDuY9zadLXgvlHICaTGeQ+vdC2mQRzsWEUf/oX2 E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8JaVI4NcjVacnUnmjnqArloL3ZLuonP9J9vRjIWDS8LejwhizPCK5V1LWpYoHB6la7+PzxLgw7
 tXs2ntKJ75EBL88jTceIzfCbravw22ki1oXf+dpCQ4dEhPMX3DjC8z8UrCF2N0+kBqML+xYJ7X
 rHTJ2HybX7VjWfqhPczhGET5JnrA0ZU2ZedIQw05EgjxnNAj0vjoD1s7jrY9oDo8lz8JaK5Tx9
 EPH8xVUaoY2CAovH3C10V4SZ4hoPfCZ1XfgugKMtofBJgogAgb5DCTOcl7tmPbYlRHVU24JeuC
 7+s=
X-SBRS: 2.7
X-MesageID: 15264431
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,351,1580792400"; d="scan'208";a="15264431"
Subject: Re: Live migration and PV device handling
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
References: <CABB6KG-UCdPTa3yM57JB13G=Yebe8chuQKvKkNbtoGRSZ9Ypsw@mail.gmail.com>
 <a8c56ab0-bc51-fa1c-c63f-cb9ada8a1823@citrix.com>
 <CABfawhn_hw=o5j+G9VfqPK6opytqt=q2-cz4GjNgCTA5zBvNrA@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6bb7eb58-01c6-00e4-672e-83d5fcb87ea0@citrix.com>
Date: Mon, 6 Apr 2020 18:24:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CABfawhn_hw=o5j+G9VfqPK6opytqt=q2-cz4GjNgCTA5zBvNrA@mail.gmail.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>,
 Anastassios Nanos <anastassios.nanos@sunlight.io>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06/04/2020 18:16, Tamas K Lengyel wrote:
> On Fri, Apr 3, 2020 at 6:44 AM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> On 03/04/2020 13:32, Anastassios Nanos wrote:
>>> Hi all,
>>>
>>> I am trying to understand how live-migration happens in xen. I am
>>> looking in the HVM guest case and I have dug into the relevant parts
>>> of the toolstack and the hypervisor regarding memory, vCPU context
>>> etc.
>>>
>>> In particular, I am interested in how PV device migration happens. I
>>> assume that the guest is not aware of any suspend/resume operations
>>> being done
>> Sadly, this assumption is not correct.  HVM guests with PV drivers
>> currently have to be aware in exactly the same way as PV guests.
>>
>> Work is in progress to try and address this.  See
>> https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=775a02452ddf3a6889690de90b1a94eb29c3c732
>> (sorry - for some reason that doc isn't being rendered properly in
>> https://xenbits.xen.org/docs/ )
> That proposal is very interesting - first time it came across my radar
> - but I dislike the idea that domain IDs need to be preserved for
> uncooperative migration to work.

The above restriction is necessary to work with existing guests, which
is an implementation requirement of the folks driving the work.

> Ideally I would be able to take
> advantage of the same plumbing to perform forking of VMs with PV
> drivers where preserving the domain id is impossible since its still
> in use.

We would of course like to make changes to remove the above restriction
in the longterm.  The problem is that it is not a trivial thing to fix. 
Various things were discussed in Chicago, but I don't recall if any of
the plans made their way onto xen-devel.

~Andrew

