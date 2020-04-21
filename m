Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC4F1B1F8B
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 09:09:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQn1S-0004t8-In; Tue, 21 Apr 2020 07:08:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dLRr=6F=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1jQn1Q-0004t3-C9
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 07:08:44 +0000
X-Inumbo-ID: eeae8538-839e-11ea-910b-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eeae8538-839e-11ea-910b-12813bfff9fa;
 Tue, 21 Apr 2020 07:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587452923;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=qeD5LJPhG08+uyODt3+zNlqT7vUrOUWeuBGqitvC/AQ=;
 b=JIBsMMDWbOWpT0cdNla101mFByD60FifAPaGwHwhM2jqSRRt8XJlv/J1
 ShSp7HdPXWJyOXS4tWOBZ3nfpe0Tbo6de7Tsy1Hu4JvpoDhXB+sXF5r+7
 Z6wrZF7EcUDdnl17+JSwB/S/94yF27282Qf/2bCDS2PilwP113ndR5HnT 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: uiWh71NJu13r3dyLexoYQLqp7h/XoklX77h5gEsZ+lgWADzGbIbAmzvYJKlTfbkidtUdXGynxf
 zQgAFt3as2XoIhE+oa00U08oaqtNcObhhIO+PCZEFUJwGIxG72Yqdrd7yEm4FSgGrsBdUVpUw6
 ABmFRCr2Pio3pp3g7N2181lCxYh8JrrmsQ2dmOQQb5iD3UGa0RsDX0GOELw1rozZ3uOWz1JTpo
 TC8SyHvkq8mIeGZauNoOXTfjDmHn/M921Cf1MEMzWg+BYUvNhs0a/2uH+E72fprFQVYrWCsrs7
 kUE=
X-SBRS: 2.7
X-MesageID: 15968401
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,409,1580792400"; d="scan'208";a="15968401"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] sched: print information about scheduling granularity
Thread-Topic: [PATCH v2] sched: print information about scheduling granularity
Thread-Index: AQHWFxSXjjMvJMzYJESueOXaD39h5aiB5BuAgAE0AwA=
Date: Tue, 21 Apr 2020 07:08:38 +0000
Message-ID: <1587452901632.99554@citrix.com>
References: <20200420130650.14341-1-sergey.dyasli@citrix.com>
 <fd6eb92b-0708-186e-7d17-3527a2673dc8@suse.com>
In-Reply-To: <fd6eb92b-0708-186e-7d17-3527a2673dc8@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: AMSPEX02CL03.citrite.net (15.00.1497.006)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <22C434D97EF9164F98A7171B9AF1EB1E@citrix.com>
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20/04/2020 14:45, J=FCrgen Gro=DF wrote:=0A=
> On 20.04.20 15:06, Sergey Dyasli wrote:=0A=
>> Currently it might be not obvious which scheduling mode (e.g. core-=0A=
>> scheduling) is being used by the scheduler. Alleviate this by printing=
=0A=
>> additional information about the selected granularity per-cpupool.=0A=
>>=0A=
>> Note: per-cpupool granularity selection is not implemented yet.=0A=
>> =A0=A0=A0=A0=A0=A0 The single global value is being used for each cpupoo=
l.=0A=
> =0A=
> This is misleading. You are using the per-cpupool values, but they=0A=
> are all the same right now.=0A=
=0A=
This is what I meant by my note, but I might need to improve the wording=0A=
since the current one looks ambiguous to you.=0A=
=0A=
> =0A=
>>=0A=
>> Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>=0A=
>> ---=0A=
>> v2:=0A=
>> - print information on a separate line=0A=
>> - use per-cpupool granularity=0A=
>> - updated commit message=0A=
>>=0A=
>> CC: Juergen Gross <jgross@suse.com>=0A=
>> CC: Dario Faggioli <dfaggioli@suse.com>=0A=
>> CC: George Dunlap <george.dunlap@citrix.com>=0A=
>> CC: Jan Beulich <jbeulich@suse.com>=0A=
>> ---=0A=
>> =A0 xen/common/sched/cpupool.c | 26 ++++++++++++++++++++++++++=0A=
>> =A0 1 file changed, 26 insertions(+)=0A=
>>=0A=
>> diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c=0A=
>> index d40345b585..68106f6c15 100644=0A=
>> --- a/xen/common/sched/cpupool.c=0A=
>> +++ b/xen/common/sched/cpupool.c=0A=
>> @@ -40,6 +40,30 @@ static DEFINE_SPINLOCK(cpupool_lock);=0A=
>> =A0 static enum sched_gran __read_mostly opt_sched_granularity =3D SCHED=
_GRAN_cpu;=0A=
>> =A0 static unsigned int __read_mostly sched_granularity =3D 1;=0A=
>> +static void sched_gran_print(enum sched_gran mode, unsigned int gran)=
=0A=
>> +{=0A=
>> +=A0=A0=A0 char *str =3D "";=0A=
>> +=0A=
>> +=A0=A0=A0 switch ( mode )=0A=
>> +=A0=A0=A0 {=0A=
>> +=A0=A0=A0 case SCHED_GRAN_cpu:=0A=
>> +=A0=A0=A0=A0=A0=A0=A0 str =3D "cpu";=0A=
>> +=A0=A0=A0=A0=A0=A0=A0 break;=0A=
>> +=A0=A0=A0 case SCHED_GRAN_core:=0A=
>> +=A0=A0=A0=A0=A0=A0=A0 str =3D "core";=0A=
>> +=A0=A0=A0=A0=A0=A0=A0 break;=0A=
>> +=A0=A0=A0 case SCHED_GRAN_socket:=0A=
>> +=A0=A0=A0=A0=A0=A0=A0 str =3D "socket";=0A=
>> +=A0=A0=A0=A0=A0=A0=A0 break;=0A=
>> +=A0=A0=A0 default:=0A=
>> +=A0=A0=A0=A0=A0=A0=A0 ASSERT_UNREACHABLE();=0A=
>> +=A0=A0=A0=A0=A0=A0=A0 break;=0A=
>> +=A0=A0=A0 }=0A=
> =0A=
> With this addition it might make sense to have an array indexed by=0A=
> mode to get the string. This array could then be used in=0A=
> sched_select_granularity(), too.=0A=
=0A=
I had thoughts about that, and with your suggestion looks like I need=0A=
to go and do it.=0A=
=0A=
> =0A=
>> +=0A=
>> +=A0=A0=A0 printk("Scheduling granularity: %s, %u CPU%s per sched-resour=
ce\n",=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 str, gran, gran =3D=3D 1 ? "" : "s");=0A=
>> +}=0A=
>> +=0A=
>> =A0 #ifdef CONFIG_HAS_SCHED_GRANULARITY=0A=
>> =A0 static int __init sched_select_granularity(const char *str)=0A=
>> =A0 {=0A=
>> @@ -115,6 +139,7 @@ static void __init cpupool_gran_init(void)=0A=
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 warning_add(fallback);=0A=
>> =A0=A0=A0=A0=A0 sched_granularity =3D gran;=0A=
>> +=A0=A0=A0 sched_gran_print(opt_sched_granularity, sched_granularity);=
=0A=
>> =A0 }=0A=
>> =A0 unsigned int cpupool_get_granularity(const struct cpupool *c)=0A=
>> @@ -911,6 +936,7 @@ void dump_runq(unsigned char key)=0A=
>> =A0=A0=A0=A0=A0 {=0A=
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 printk("Cpupool %d:\n", (*c)->cpupool_id);=
=0A=
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 printk("Cpus: %*pbl\n", CPUMASK_PR((*c)->cpu=
_valid));=0A=
>> +=A0=A0=A0=A0=A0=A0=A0 sched_gran_print((*c)->gran, cpupool_get_granular=
ity(*c));=0A=
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 schedule_dump(*c);=0A=
>> =A0=A0=A0=A0=A0 }=0A=
> =0A=
=0A=
--=0A=
Thanks,=0A=
Sergey=0A=
=0A=

