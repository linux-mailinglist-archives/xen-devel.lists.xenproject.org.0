Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7542B19F6A6
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 15:17:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLRbX-0003ye-GO; Mon, 06 Apr 2020 13:15:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z9GA=5W=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jLRbW-0003yY-AS
 for xen-devel@lists.xen.org; Mon, 06 Apr 2020 13:15:54 +0000
X-Inumbo-ID: bdc3a288-7808-11ea-b4f4-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bdc3a288-7808-11ea-b4f4-bc764e2007e4;
 Mon, 06 Apr 2020 13:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586178953;
 h=subject:to:references:cc:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=43uLD/0MVWyZ8H9pok8ak2jCqyJ6D+/XeX6YdRq1LJE=;
 b=PfqELVhj+zAxV8hTp1o4ciE7Sjt27F/MB+Bj5o83K3fJUIWfHaOtn+vB
 FwFpDvl445Kwiu4v545cOpQGS87RDRBWSC45GEZQiCMydgs/g6pYEFT5p
 ivi8qOCPeKPn61l5ZxTH8FXAwbghKANXoO1BoCEPOn00qqAwSAi+FtFHJ w=;
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
IronPort-SDR: g9mwFGVCsw54ChHTbnndR6O41r4/+DGHRDhVxMD00VdRYolyZ7Y9lWTOE0y+H77aGWcvbPq8LQ
 6W3SnQ5Mh865THRANb/2BssN7s0ZPZOe9A4D46DEKuE1JFXYrXRS5k76YarPcVkOx+TLRpmAOg
 3wHsBDBydV9jPm6PAdr2TzB4uLJLUYNt6YGFK3s38Se9R5M7mwCvqDmqQSDTjNgCilJ5G3kjAO
 Kh/EW2sYUMQH7ZUKlMpXddAFMAX2npbd4xCQpDGjv3YYPMrdFCdmptFHalXQ3nOkMsu/Fw6MBK
 uM4=
X-SBRS: 2.7
X-MesageID: 15245679
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,351,1580792400"; d="scan'208";a="15245679"
Subject: Re: Live migration and PV device handling
To: <xen-devel@lists.xen.org>
References: <CABB6KG-UCdPTa3yM57JB13G=Yebe8chuQKvKkNbtoGRSZ9Ypsw@mail.gmail.com>
 <a8c56ab0-bc51-fa1c-c63f-cb9ada8a1823@citrix.com>
 <d698f1ed-247e-404c-04ce-762c651771d1@oracle.com>
 <001301d60be8$06afa1a0$140ee4e0$@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <391f80f6-6038-2d2c-cf0f-bdbda27af378@citrix.com>
Date: Mon, 6 Apr 2020 14:15:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <001301d60be8$06afa1a0$140ee4e0$@xen.org>
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
Cc: 'Dongli Zhang' <dongli.zhang@oracle.com>, 'Anastassios
 Nanos' <anastassios.nanos@sunlight.io>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06/04/2020 08:50, Paul Durrant wrote:
>> -----Original Message-----
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Dongli Zhang
>> Sent: 03 April 2020 23:33
>> To: Andrew Cooper <andrew.cooper3@citrix.com>; Anastassios Nanos <anastassios.nanos@sunlight.io>; xen-
>> devel@lists.xen.org
>> Subject: Re: Live migration and PV device handling
>>
>> Hi Andrew,
>>
>> On 4/3/20 5:42 AM, Andrew Cooper wrote:
>>> On 03/04/2020 13:32, Anastassios Nanos wrote:
>>>> Hi all,
>>>>
>>>> I am trying to understand how live-migration happens in xen. I am
>>>> looking in the HVM guest case and I have dug into the relevant parts
>>>> of the toolstack and the hypervisor regarding memory, vCPU context
>>>> etc.
>>>>
>>>> In particular, I am interested in how PV device migration happens. I
>>>> assume that the guest is not aware of any suspend/resume operations
>>>> being done
>>> Sadly, this assumption is not correct.  HVM guests with PV drivers
>>> currently have to be aware in exactly the same way as PV guests.
>>>
>>> Work is in progress to try and address this.  See
>>> https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=775a02452ddf3a6889690de90b1a94eb29c3c732
>>> (sorry - for some reason that doc isn't being rendered properly in
>>> https://xenbits.xen.org/docs/ )

Document rendering now fixed.

https://xenbits.xen.org/docs/unstable/designs/non-cooperative-migration.html

>> I read below from the commit:
>>
>> +* The toolstack choose a randomized domid for initial creation or default
>> +migration, but preserve the source domid non-cooperative migration.
>> +Non-Cooperative migration will have to be denied if the domid is
>> +unavailable on the target host, but randomization of domid on creation
>> +should hopefully minimize the likelihood of this. Non-Cooperative migration
>> +to localhost will clearly not be possible.
>>
>> Does that indicate while scope of domid_t is shared by a single server in old
>> design, the scope of domid_t is shared by a cluster of server in new design?
>>
>> That is, the domid should be unique in the cluster of all servers if we expect
>> non-cooperative migration always succeed?
>>
> That would be necessary to guarantee success (or rather guarantee no failure due to domid clash) but the scope of xl/libxl is single serve, hence randomization is the best we have to reduce clashes to a minimum.

domid's are inherently a local concept and will remain so, but a
toolstack managing multiple servers and wanting to use this version of
non-cooperative migration will have to manage domid's cluster wide.

~Andrew

