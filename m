Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9A51A3D8C
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2020 02:59:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMi0C-0008Q6-JN; Fri, 10 Apr 2020 00:58:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5/QT=52=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jMi0A-0008Q1-Qk
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2020 00:58:34 +0000
X-Inumbo-ID: 66a871b6-7ac6-11ea-83d8-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 66a871b6-7ac6-11ea-83d8-bc764e2007e4;
 Fri, 10 Apr 2020 00:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586480312;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=wGth6PMI1MAXOrsQjOxcdiLOjZYHKsUhNzPRHjBy9fU=;
 b=HV9enyLyMIkkX0opvnl2nKfWLJ3OJnc76RwnmjXSQKV+VtOufPh0J9Kl
 cYrysSPDRLBeakICSgV1YbyEVdTRQodxzZKv9ajlLaZviHIfbD6eTf8h0
 fYO0sGMM9kerlAyYlDxckNrVtv/0ze1ZG11quUsIZCEpsIAFmVAUHhcVu M=;
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
IronPort-SDR: 3jDhGpUFKgTyx4jFb806c7YeroKRwDGEQenkN3bXfr8oD92c3I7ReZ8KpawvOgyzt+VGjnreTT
 Gcrh0BBx60oP6j4Ssz7mbDV8Ok5BMs7lCGDI6T+c1DjfmcqmPVP2JG+tdCnqDFqnOcup8eyXL0
 Jww8gPv2dwDJ1rKKvqxhkWe3c0XDajDB3Dvob01cqFiOQ/fyNuAPOlFbnJCBVF3a7qMhWndcs2
 +Vuf9Y5ZFdP5+xZmhdONN1Z2pzR0CEHfBX6mSOyzbHEoQc9yABNvz3iHUbRNn5Y3GbRW3oo2SC
 mF8=
X-SBRS: 2.7
X-MesageID: 15488991
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,364,1580792400"; d="scan'208";a="15488991"
Subject: Re: [PATCH] x86/mem_sharing: Fix build folloing VM Fork work
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <20200409204837.7017-1-andrew.cooper3@citrix.com>
 <CABfawhnhfTScVDRxezP3qRarBczCPs2EVmLZMnN-FMpxyWN8XQ@mail.gmail.com>
 <769887ee-c381-ff58-bdf9-bd1a3032cbfb@citrix.com>
 <CABfawh=UPcyHRgNvsA8wNwV798e3RL_FhSF6ZrOrx89up4w+fQ@mail.gmail.com>
 <a89b2a51-8c54-4a35-4f77-e31018936534@citrix.com>
 <CABfawhm4Tdcp7QWqOyUXb_7Ag9yuQ93E3knH6joG4TDyXbgufA@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <be90b42c-5e7b-fda3-9c57-29cea0dc66d5@citrix.com>
Date: Fri, 10 Apr 2020 01:58:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CABfawhm4Tdcp7QWqOyUXb_7Ag9yuQ93E3knH6joG4TDyXbgufA@mail.gmail.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 10/04/2020 00:23, Tamas K Lengyel wrote:
> On Thu, Apr 9, 2020 at 5:00 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> On 09/04/2020 23:38, Tamas K Lengyel wrote:
>>> On Thu, Apr 9, 2020 at 4:05 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>>> On 09/04/2020 22:24, Tamas K Lengyel wrote:
>>>>> On Thu, Apr 9, 2020 at 2:48 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>>>>> A default build fails with:
>>>>>>
>>>>>>   mem_sharing.c: In function ‘copy_special_pages’:
>>>>>>   mem_sharing.c:1649:9: error: ‘HVM_PARAM_STORE_PFN’ undeclared (first use in this function)
>>>>>>            HVM_PARAM_STORE_PFN,
>>>>>>            ^~~~~~~~~~~~~~~~~~~
>>>>>>
>>>>>> I suspect this is a rebasing issue with respect to c/s 12f0c69f2709 "x86/HVM:
>>>>>> reduce hvm.h include dependencies".
>>>>>>
>>>>>> Fixes: 41548c5472a "mem_sharing: VM forking"
>>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>> So staging definitely compiles for me both with and without
>>>>> CONFIG_MEM_SHARING enabled. By default its off, so this shouldn't even
>>>>> be compiled so I'm curious what's happening in your build. That said,
>>>>> I have no objection to the extra include if it turns out to be
>>>>> actually necessary.
>>>> Exact config attached.  I've just double checked that staging fails.
>>>>
>>>> We should get  to the bottom of exactly what is going on here, if it
>>>> isn't the obvious thing.
>>> Strange, with your config it does produce the error. With "echo
>>> CONFIG_MEM_SHARING=y > .config && XEN_CONFIG_EXPERT=y make
>>> olddefconfig && make" it does compile.
>> You lose XEN_CONFIG_EXPERT=y in the second make, so it rewrites your
>> .config behind your back.  (This behaviour is totally obnoxious).
> I also compiled with export XEN_CONFIG_EXPERT=y and it compiles fine.
>
>> Diff the current config against original?
> drt@t0:~/workspace/xen/xen$ diff .config .config-debug
> 6c6
> < CONFIG_GCC_VERSION=80300
> ---
>> CONFIG_GCC_VERSION=60300

;-(

I occasionally forget that `diff` defaults to unreadable.

>> # CONFIG_XEN_ALIGN_DEFAULT is not set
>> CONFIG_XEN_ALIGN_2M=y
>> CONFIG_GUEST=y
>> CONFIG_XEN_GUEST=y
>> CONFIG_PVH_GUEST=y
>> CONFIG_PV_SHIM=y
>> # CONFIG_PV_SHIM_EXCLUSIVE is not set
>> CONFIG_HYPERV_GUEST=y
> 61,62c65,74
> < # CONFIG_XSM is not set

With XSM compiled out, xsm/dummy.h is used, and has to include
public/hvm/params.h to get XEN_ALTP2M_* for xsm_hvm_altp2mhvm_op(), and
this bleeds through into everything which includes xsm/xsm.h, which is
basically everything.

Are you happy for me to fix up the commit message to this effect,
replacing the previous guesswork?

~Andrew

