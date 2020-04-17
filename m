Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2871ADEA1
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 15:43:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPRHa-0003wQ-07; Fri, 17 Apr 2020 13:43:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=f44r=6B=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1jPRHX-0003wK-Om
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 13:43:47 +0000
X-Inumbo-ID: 74f87c35-80b1-11ea-8ce6-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 74f87c35-80b1-11ea-8ce6-12813bfff9fa;
 Fri, 17 Apr 2020 13:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587131025;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=+5W5SMf3LfxShpfVPxwa76djMVbv6G1uq8Zf3be7nqA=;
 b=Bncg1tWPiM/AUM+3fBJqTcb2zKnQOrnO/LxMZ7XOmIVmk05wWH1j4Pbl
 w0jVdJYR4CcBjldWUKKn1vYVKosHqx9BThwglvhBbFgUA7FQtwSYtYBn/
 hs+pbT+SMw43uA9Vx+5Sg0DT7l9CdC+PtPLPMN6jqX9If1PfzJ3Ndd7O/ 4=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
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
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: LdzRVlFhzQ3FsvQL97yGXmJnVEPAE6C0WztRsxKXgBeeri5iZMqbizVtaXSJazcaSOTGTnLBNe
 BW1OBWlLSRKaGJ+20zY5lVz/YvlXkQc2I952BBTqH1ZSYgPvt6/n58p93FkgCSwsNY+a5QojJx
 noThwM/6Ufm9bxYfN9C+lRNStXwsPH+8oZWTs+Pr7Hn7K3kr7YJWwUsBdacHRC2x7iRJqCYnSo
 4krihPlL8CTfqy1qWT/gsErrBIBR5oqBtw772hCrIBQHnaabHRGLMIaLAojh2ZVppniy9wLf72
 Da0=
X-SBRS: 2.7
X-MesageID: 16520376
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,395,1580792400"; d="scan'208";a="16520376"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Dario Faggioli
 <dfaggioli@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] sched: print information about scheduler granularity
Thread-Topic: [PATCH] sched: print information about scheduler granularity
Thread-Index: AQHWE8nCYlq/J4KoL0iU4gkSoIElX6h701EAgAD/WICAAHCoAA==
Date: Fri, 17 Apr 2020 13:43:42 +0000
Message-ID: <1587131006806.63738@citrix.com>
References: <20200416083341.21122-1-sergey.dyasli@citrix.com>
 <d2577c4b4ff040c8f256d203e647619d9d4d6ebb.camel@suse.com>
 <3dacf98c-c4b7-a263-01d3-f8562619ff53@suse.com>
In-Reply-To: <3dacf98c-c4b7-a263-01d3-f8562619ff53@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: AMSPEX02CL03.citrite.net (15.00.1497.006)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <734F0004E7610C44BE63323EB5575303@citrix.com>
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
Cc: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17/04/2020 08:57, J=FCrgen Gro=DF wrote:=0A=
> On 16.04.20 18:43, Dario Faggioli wrote:=0A=
>> On Thu, 2020-04-16 at 09:33 +0100, Sergey Dyasli wrote:=0A=
>>> Currently it might be not obvious which scheduling mode is being used=
=0A=
>>> by the scheduler. Alleviate this by printing additional information=0A=
>>> about the selected granularity.=0A=
>>>=0A=
>> I like the idea. However, I don't like how verbose and long that line=0A=
>> becomes.=0A=
>>=0A=
>>> =A0 Messages now look like these:=0A=
>>>=0A=
>>> 1. boot=0A=
>>> (XEN) [00089808f0ea7496] Using scheduler: SMP Credit Scheduler=0A=
>>> (credit) in core-scheduling mode=0A=
>>>=0A=
>>> 2. xl debug-keys r=0A=
>>> (XEN) [=A0=A0 45.914314] Scheduler: SMP Credit Scheduler (credit) in 2-=
=0A=
>>> way core-scheduling mode=0A=
>>>=0A=
>> What about adding an entry, just below these ones. Something looking=0A=
>> like, for instance (both at boot and in the debug-key dump):=0A=
>>=0A=
>> "Scheduling granularity: cpu"=0A=
>>=0A=
>> (or "core", or "socket")=0A=
=0A=
I agree that the line becomes too long. I'll print the new information=0A=
on a separate line as you suggest in v2.=0A=
=0A=
>>=0A=
>> Also=0A=
>>=0A=
>>> --- a/xen/common/sched/cpupool.c=0A=
>>> +++ b/xen/common/sched/cpupool.c=0A=
>>> @@ -38,7 +38,35 @@ static cpumask_t cpupool_locked_cpus;=0A=
>>> =A0 static DEFINE_SPINLOCK(cpupool_lock);=0A=
>>> =A0 static enum sched_gran __read_mostly opt_sched_granularity =3D=0A=
>>> SCHED_GRAN_cpu;=0A=
>>> -static unsigned int __read_mostly sched_granularity =3D 1;=0A=
>>> +static unsigned int __read_mostly sched_granularity;=0A=
>>> +=0A=
>>> +char *sched_gran_str(char *str, size_t size)=0A=
>>> +{=0A=
>>> +=A0=A0=A0 char *mode =3D "";=0A=
>>> +=0A=
>>> +=A0=A0=A0 switch ( opt_sched_granularity )=0A=
>>> +=A0=A0=A0 {=0A=
>>> +=A0=A0=A0 case SCHED_GRAN_cpu:=0A=
>>> +=A0=A0=A0=A0=A0=A0=A0 mode =3D "cpu";=0A=
>>> +=A0=A0=A0=A0=A0=A0=A0 break;=0A=
>>> +=A0=A0=A0 case SCHED_GRAN_core:=0A=
>>> +=A0=A0=A0=A0=A0=A0=A0 mode =3D "core";=0A=
>>> +=A0=A0=A0=A0=A0=A0=A0 break;=0A=
>>> +=A0=A0=A0 case SCHED_GRAN_socket:=0A=
>>> +=A0=A0=A0=A0=A0=A0=A0 mode =3D "socket";=0A=
>>> +=A0=A0=A0=A0=A0=A0=A0 break;=0A=
>>> +=A0=A0=A0 default:=0A=
>>> +=A0=A0=A0=A0=A0=A0=A0 ASSERT_UNREACHABLE();=0A=
>>> +=A0=A0=A0=A0=A0=A0=A0 break;=0A=
>>> +=A0=A0=A0 }=0A=
>>> +=0A=
>>> +=A0=A0=A0 if ( sched_granularity )=0A=
>>> +=A0=A0=A0=A0=A0=A0=A0 snprintf(str, size, "%u-way %s", sched_granulari=
ty, mode);=0A=
>>>=0A=
>> I'm not sure about using the value of the enum like this.=0A=
> =0A=
> enum? sched_granularity holds the number of cpus per scheduling=0A=
> resource. opt_sched_granularity is the enum.=0A=
> =0A=
>>=0A=
>> E.g., in a system with 4 threads per core, enabling core scheduling=0A=
>> granularity would mean having 4 vCPUs in the scheduling units. But this=
=0A=
>> will still print "2-way core-scheduling", which I think would sound=0A=
>> confusing.=0A=
> =0A=
> It would print "4-way", of course.=0A=
> =0A=
>>=0A=
>> So I'd just go with "cpu", "core" and "socket" strings.=0A=
> =0A=
> No, this is not a good idea. With e.g. smt=3D0 you'll be able to have=0A=
> "1-way core" which is much more informative than "core".=0A=
=0A=
Can confirm the above. "sched-gran=3Dcore" on a Knights Mill produces:=0A=
(XEN) [  232.018648] Scheduler: SMP Credit Scheduler (credit) in 4-way core=
-scheduling mode=0A=
=0A=
While "sched-gran=3Dcore smt=3D0" gives:=0A=
(XEN) [  259.337588] Scheduler: SMP Credit Scheduler (credit) in 1-way core=
-scheduling mode=0A=
=0A=
--=0A=
Thanks,=0A=
Sergey=0A=
=0A=

