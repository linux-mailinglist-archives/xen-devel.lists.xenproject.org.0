Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAAF1A7AF3
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 14:38:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOKoh-0004JK-2y; Tue, 14 Apr 2020 12:37:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9vXG=56=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1jOKof-0004JF-FH
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 12:37:25 +0000
X-Inumbo-ID: b0d43e26-7e4c-11ea-892c-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b0d43e26-7e4c-11ea-892c-12813bfff9fa;
 Tue, 14 Apr 2020 12:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586867844;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=L+KTtZyepbJ/UWd8lcxQnDdmM63Oveq6fypoOTICUdw=;
 b=cf2H1cLY8ILwYMlZ6xSacCepUnsWkzRGjZ7rOXAZxMEbampYAh1aX4MD
 Ry3+gTWlX49/z8rds01yCuoNdwKS5GjJoeW9M9JaBMkhlI8V9HvoiaP3K
 k12Y+DHNBWbXmFYgJpWfUZ8dZNwFLYFVvA/lvoXz8rwy1EYlEOi1BBHnL 4=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1OJHJ+h8J7+qnZsuQrKP6LLMrh8ir/Y8pd42gFxC5OMVkic4oV37hywsU7+Gb+AnlO8PbTxIUc
 DJ3La4g62ocjLknJJVKJU4XG9WAat8JDQ3XBTqwRulPza5ce21NVsbSjIouTpajnE3qQq+ZaLA
 c8bZW7nHe9XIA87lPbG4moroDl8SB7BTERwLDLuZgbnWNZ0m/4k+PejkxviTkCqhHFZUn8ggfq
 u/3/7mpOAVj9TqB3Jy3BM4LUf+OggpkNw8mnHy5sy3gI9DzTyFtP5W3Vfaf43EqQJ4AJRWtJvF
 qE0=
X-SBRS: 2.7
X-MesageID: 16040844
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,382,1580792400"; d="scan'208";a="16040844"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] sched: fix scheduler_disable() with core scheduling
Thread-Topic: [PATCH] sched: fix scheduler_disable() with core scheduling
Thread-Index: AQHWDlMf+hls+gjzYE+KOswEHefQ3KhwnMkAgAfn8QA=
Date: Tue, 14 Apr 2020 12:37:21 +0000
Message-ID: <1586867831219.70127@citrix.com>
References: <20200409094137.13836-1-sergey.dyasli@citrix.com>
 <8db96ff6-53e3-8c01-0737-5181ccc348ab@suse.com>
In-Reply-To: <8db96ff6-53e3-8c01-0737-5181ccc348ab@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: AMSPEX02CL03.citrite.net (15.00.1497.006)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <1D5FDD915FEC364B8E7788227A5C7436@citrix.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>,
 Sergey Dyasli <sergey.dyasli@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

(CC Igor)=0A=
=0A=
On 09/04/2020 13:50, J=FCrgen Gro=DF wrote:=0A=
> On 09.04.20 11:41, Sergey Dyasli wrote:=0A=
>> In core-scheduling mode, Xen might crash when entering ACPI S5 state.=0A=
>> This happens in sched_slave() during is_idle_unit(next) check because=0A=
>> next->vcpu_list is stale and points to an already freed memory.=0A=
>>=0A=
>> This situation happens shortly after scheduler_disable() is called if=0A=
>> some CPU is still inside sched_slave() softirq. Current logic simply=0A=
>> returns prev->next_task from sched_wait_rendezvous_in() which causes=0A=
>> the described crash because next_task->vcpu_list has become invalid.=0A=
>>=0A=
>> Fix the crash by returning NULL from sched_wait_rendezvous_in() in=0A=
>> the case when scheduler_disable() has been called.=0A=
>>=0A=
>> Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>=0A=
> =0A=
> Good catch!=0A=
> =0A=
> Have you seen any further problems (e.g. with cpu on/offlining) with=0A=
> this patch applied?=0A=
=0A=
This patch shouldn't affect cpu on/offlining AFAICS. Igor was the one testi=
ng=0A=
cpu on/offlining and I think he came to a conclusion that it's broken even=
=0A=
without core-scheduling enabled.=0A=
=0A=
> Reviewed-by: Juergen Gross <jgross@suse.com>=0A=
=0A=
Thanks!=0A=
=0A=
--=0A=
Sergey=0A=

