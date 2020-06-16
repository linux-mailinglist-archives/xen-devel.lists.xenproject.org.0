Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3181FBDCE
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 20:17:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlG95-00016C-S6; Tue, 16 Jun 2020 18:17:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CuXX=75=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jlG93-000165-Jp
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 18:17:13 +0000
X-Inumbo-ID: 99142a8e-affd-11ea-b930-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 99142a8e-affd-11ea-b930-12813bfff9fa;
 Tue, 16 Jun 2020 18:17:12 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: rbklXlwjIEZTtPFq8K5+OVoUIngeX31A+norekkFqZe6P6oMKL/zjVmFtZI/E+W7caLjgfRMKK
 Q2b0a1oCtwghjOKxOWPps21494hvzI0/7Bunye7LnCfemQQN7HRJZuAHnInjPhlKaVprvAo/xD
 S5sRpxJYnX3PRvqzoZ6ioN+m7B96JL6C/RZW622hdfsob2Ph406eUmrK+e8g+EH47sbxmNa9ix
 0hD/JvqEZrM3644U66JeBvlpXTmcDC/1ev1RCGi/Xz8z/CZLcvaXf0RBpkmbP3oNs1vMTJldUl
 vB4=
X-SBRS: 2.7
X-MesageID: 20199518
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,519,1583211600"; d="scan'208";a="20199518"
Subject: Re: [PATCH v1 0/7] Implement support for external IPT monitoring
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <cb530abc-bef6-23b9-86d8-f43167e14736@citrix.com>
Date: Tue, 16 Jun 2020 19:17:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16/06/2020 16:16, Michał Leszczyński wrote:
> Intel Processor Trace is an architectural extension available in modern Intel family CPUs. It allows recording the detailed trace of activity while the processor executes the code. One might use the recorded trace to reconstruct the code flow. It means, to find out the executed code paths, determine branches taken, and so forth.
>
> The abovementioned feature is described in Intel(R) 64 and IA-32 Architectures Software Developer's Manual Volume 3C: System Programming Guide, Part 3, Chapter 36: "Intel Processor Trace."
>
> This patch series implements an interface that Dom0 could use in order to enable IPT for particular vCPUs in DomU, allowing for external monitoring. Such a feature has numerous applications like malware monitoring, fuzzing, or performance testing.

Hello,

I'm very excited to see support like this appearing.  However, be aware
that we're currently in code freeze for the 4.14 release, so in-depth
reviews will probably be delayed somewhat due to our bug queue and
release activities.

That said, I've had a very quick look through the series, and have a few
general questions first.

AFAICT, this is strictly for external monitoring of the VM, not for the
VM to use itself?  If so, it shouldn't have the H tag here:

XEN_CPUFEATURE(IPT,           5*32+25) /*H  Intel Processor Trace */

because that exposes the feature to the guest, with the implication that
all other parts of the feature work as advertised.


Are there any restrictions on EPT being enabled in the first place?  I'm
not aware of any, and in principle we could use this functionality for
PV guests as well (using the CPL filter).  Therefore, I think it would
be helpful to not tie the functionality to HVM guests, even if that is
the only option enabled to start with.

The buffer mapping and creation logic is fairly problematic.  Instead of
fighting with another opencoded example, take a look at the IOREQ
server's use of "acquire resource" which is a mapping interface which
supports allocating memory on behalf of the guest, outside of the guest
memory, for use by control tools.

I think what this wants is a bit somewhere in domain_create to indicate
that external tracing is used for this domain (and allocate whatever
structures/buffers are necessary), acquire resource to map the buffers
themselves, and a domctl for any necessary runtime controls.


What semantics do you want for the buffer becoming full?  Given that
debugging/tracing is the goal, I presume "pause vcpu on full" is the
preferred behaviour, rather than drop packets on full?


When this subject was broached on xen-devel before, one issue was the
fact that all actions which are intercepted don't end up writing any
appropriate packets.  This is perhaps less of an issue for this example,
where the external agent can see VMExits in the trace, but it still
results in missing information.  (It is a major problem for PT within
the guest, and needs Xen's intercept/emulation framework being updated
to be PT-aware so it can fill in the same packets which hardware would
have done for equivalent actions.)


Thanks,

~Andrew

