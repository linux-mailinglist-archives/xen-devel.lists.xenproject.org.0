Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA5A1EE228
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 12:12:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgmqs-0006qS-Te; Thu, 04 Jun 2020 10:11:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NfFn=7R=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jgmqr-0006qN-0D
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 10:11:57 +0000
X-Inumbo-ID: d18b419c-a64b-11ea-ae57-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d18b419c-a64b-11ea-ae57-12813bfff9fa;
 Thu, 04 Jun 2020 10:11:56 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: JW+8Ma8rK3J/RLJ/tobmpVsemQwnCPOWbgFx6kLfufZt5muS+5Z9R4iCkdKkQREccG2xdpxHm7
 T8EgDVCNf8cctxeGgHJ3wX3bkNjMcONxyHoUJgAFwsUWn1UiNgK4qLDIq+cbvrPp8tb4U+CNBm
 x7OuvGOoA4ZpfyYw+uk8mVUtqjTi8+JLKHVWPJZXygZ5D0+cl3skK8PSW3OiD6JyFBdUSnAhDH
 htv070kDndjSrxnp3RML6LgjVJP52v+9ORn6JuJWGsW4nIMxxXlMiqMwesQl8s/H+CNssG5Glt
 Jw8=
X-SBRS: 2.7
X-MesageID: 19557215
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,472,1583211600"; d="scan'208";a="19557215"
Subject: Re: [PATCH for-4.14] x86/shim: Fix defconfig selection and trim the
 build further
To: Jan Beulich <jbeulich@suse.com>
References: <20200603170908.13239-1-andrew.cooper3@citrix.com>
 <1a158ff8-e11e-432c-236d-ff884602d48a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a5a0708b-6738-8cc7-af55-dc2331761ece@citrix.com>
Date: Thu, 4 Jun 2020 11:11:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1a158ff8-e11e-432c-236d-ff884602d48a@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04/06/2020 07:43, Jan Beulich wrote:
> On 03.06.2020 19:09, Andrew Cooper wrote:
>> Several options (TBOOT, XENOPROF, Scheduler) depend on EXPERT to be able to
>> deselect/configure.
>>
>> Enabling EXPERT now causes the request of the Credit1 scheduler to be honoured
>> (rather than giving us Credit2), but take this opportunity to switch to Null,
>> as the previously problematic issues are now believed to be fixed.
>>
>> Enabling EXPERT also allows XEN_SHSTK to be selected, and we don't want this
>> being built for shim.  We also don't want TRACEBUFFER or GDBSX either.
>>
>> Take this oppotunity to swap the disable of HVM_FEP for a general disable of
>> HVM (likely to have wider impliciations in the future), and disable ARGO (will
>> necesserily need plumbing work to function in shim).
> Odd. I was quite sure this is the case already; in particular my
> own build test of a shim config has this already.

It is currently off because of its default in Xen, but even if that were
to change, its not usable in shim without further development work.

>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
> I have a question though (without implying the patch here needs
> adjusting, but rather with a look towards after 4.14):
>
>> --- a/xen/arch/x86/configs/pvshim_defconfig
>> +++ b/xen/arch/x86/configs/pvshim_defconfig
>> @@ -5,19 +5,25 @@ CONFIG_PVH_GUEST=y
>>  CONFIG_PV_SHIM=y
>>  CONFIG_PV_SHIM_EXCLUSIVE=y
>>  CONFIG_NR_CPUS=32
>> +CONFIG_EXPERT=y
>> +CONFIG_SCHED_NULL=y
>>  # Disable features not used by the PV shim
>> +# CONFIG_HVM is not set
>> +# CONFIG_XEN_SHSTK is not set
>>  # CONFIG_HYPFS is not set
>>  # CONFIG_SHADOW_PAGING is not set
>>  # CONFIG_BIGMEM is not set
>> -# CONFIG_HVM_FEP is not set
>>  # CONFIG_TBOOT is not set
>>  # CONFIG_KEXEC is not set
>>  # CONFIG_XENOPROF is not set
>>  # CONFIG_XSM is not set
>> +# CONFIG_ARGO is not set
>> +# CONFIG_SCHED_CREDIT is not set
>>  # CONFIG_SCHED_CREDIT2 is not set
>>  # CONFIG_SCHED_RTDS is not set
>>  # CONFIG_SCHED_ARINC653 is not set
>> -# CONFIG_SCHED_NULL is not set
>>  # CONFIG_LIVEPATCH is not set
>>  # CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS is not set
>> +# CONFIG_TRACEBUFFER is not set
>>  # CONFIG_DEBUG is not set
>> +# CONFIG_GDBSX is not set
> I assume both the "enable" and "disable" sections here are ordered
> like they would be in a resulting full .config.

They are, yes.

> But this being two
> separate sections, doing so doesn't help e.g. diff-ing.

Having them in order helps massively with scanning through the two files
together.

I'm not entirely certain why the two sections are separate to begin
with.  Merging them would probably make things even easier, but I think
the file does want to stay in .config order.

~Andrew

