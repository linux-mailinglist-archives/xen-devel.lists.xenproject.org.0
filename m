Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 926AE200642
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 12:29:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmEGV-0008Tk-GK; Fri, 19 Jun 2020 10:28:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DmpW=AA=lucina.net=martin@srs-us1.protection.inumbo.net>)
 id 1jmEGT-0008Tf-Up
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 10:28:53 +0000
X-Inumbo-ID: ab136fc6-b217-11ea-bb5e-12813bfff9fa
Received: from smtp.lucina.net (unknown [62.176.169.44])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ab136fc6-b217-11ea-bb5e-12813bfff9fa;
 Fri, 19 Jun 2020 10:28:51 +0000 (UTC)
Received: from webmail.moloch.sk (w3-s.a.lucina.net [62.176.169.73])
 by smtp.lucina.net (Postfix) with ESMTPSA id DDE30122804;
 Fri, 19 Jun 2020 12:28:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucina.net;
 s=dkim-201811; t=1592562530;
 bh=n/UcbhmynjYkE8I4QJZoH1EVb+BPwxBhePbHkQIhJ9U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GyaCk2uHNYTD3+9cf+WBXPBbTmyvFMy8yrwKd0q9pDQaOQiZ96NCAgfmvQ3q1KRQw
 KiSkwWeSj6FLwui58hlSi7Xmy61cHuRxiJC5FHP5KHmq7+EnfQfDZXd3/Dw1JBm9uv
 SUeZgqDPdLp2G+3wdvk2G/dx2dJCBguPZHPwdK2Smq1vImhLfafaaqNdTHnBN+LW49
 Ej5Htdagf/MUwDFWDMweTQIFOrk6CTMxsM7YRhOk7YIlJC/3p/liwBt1cqLOBZeeoR
 cdLvP62mds4GcvfGpaAeU/kZjnk/t/O91WLhvq61fiySBUpNdZFud0RaU9LaeVpVJg
 q5mvmn3LUUn9w==
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Fri, 19 Jun 2020 12:28:50 +0200
From: Martin Lucina <martin@lucina.net>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: Event delivery and "domain blocking" on PVHv2
In-Reply-To: <20200618114617.GJ735@Air-de-Roger>
References: <62479d08f7650c22678d7a86851eafc4@lucina.net>
 <5865159c-4190-e841-8020-7a4f3cf0fc24@citrix.com>
 <20200618101330.GB10330@nodbug.lucina.net>
 <20200618114617.GJ735@Air-de-Roger>
Message-ID: <17deb17cec442f96cc7aba98ef4c047c@lucina.net>
X-Sender: martin@lucina.net
User-Agent: Roundcube Webmail/1.3.3
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 mirageos-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 2020-06-18 13:46, Roger Pau Monné wrote:
> On Thu, Jun 18, 2020 at 12:13:30PM +0200, Martin Lucina wrote:
>> At this point I don't really have a clear idea of how to progress,
>> comparing my implementation side-by-side with the original PV 
>> Mini-OS-based
>> implementation doesn't show up any differences I can see.
>> 
>> AFAICT the OCaml code I've also not changed in any material way, and 
>> that
>> has been running in production on PV for years, so I'd be inclined to 
>> think
>> the problem is in my reimplementation of the C parts, but where...?
> 
> A good start would be to print the ISR and IRR lapic registers when
> blocked, to assert there are no pending vectors there.
> 
> Can you apply the following patch to your Xen, rebuild and check the
> output of the 'l' debug key?
> 
> Also add the output of the 'v' key.

Had to fight the Xen Debian packages a bit as I wanted to patch the 
exact same Xen (there are some failures when building on a system that 
has Xen installed due to following symlinks when fixing shebangs).

Here you go, when stuck during netfront setup, after allocating its 
event channel, presumably waiting on Xenstore:

'e':

(XEN) Event channel information for domain 3:
(XEN) Polling vCPUs: {}
(XEN)     port [p/m/s]
(XEN)        1 [1/0/1]: s=3 n=0 x=0 d=0 p=33
(XEN)        2 [1/1/1]: s=3 n=0 x=0 d=0 p=34
(XEN)        3 [1/0/1]: s=5 n=0 x=0 v=0
(XEN)        4 [0/1/1]: s=2 n=0 x=0 d=0

'l':

(XEN) d3v0 IRR:                                                          
                                                                          
                                                                          
                                      ffff8301732dc200b
(XEN) d3v0 ISR:                                                          
                                                                          
                                                                          
                                      ffff8301732dc100b

'v':

(XEN) *********** VMCS Areas **************
(XEN)
(XEN) >>> Domain 3 <<<
(XEN)   VCPU 0
(XEN) *** Guest State ***
(XEN) CR0: actual=0x0000000080000033, shadow=0x0000000080000033, 
gh_mask=ffffffffffffffff
(XEN) CR4: actual=0x0000000000002660, shadow=0x0000000000000020, 
gh_mask=ffffffffffc8f860
(XEN) CR3 = 0x00000000002e9000
(XEN) RSP = 0x000000000ffffec0 (0x000000000ffffec0)  RIP = 
0x0000000000209997 (0x0000000000209998)
(XEN) RFLAGS=0x00000297 (0x00000297)  DR7 = 0x0000000000000400
(XEN) Sysenter RSP=0000000000000000 CS:RIP=0000:0000000000000000
(XEN)        sel  attr  limit   base
(XEN)   CS: 0008 0a099 ffffffff 0000000000000000
(XEN)   DS: 0010 0c093 ffffffff 0000000000000000
(XEN)   SS: 0010 0c093 ffffffff 0000000000000000
(XEN)   ES: 0010 0c093 ffffffff 0000000000000000
(XEN)   FS: 0000 1c000 ffffffff 0000000000000000
(XEN)   GS: 0000 1c000 ffffffff 0000000000000000
(XEN) GDTR:            00000027 00000000003e13c0
(XEN) LDTR: 0000 10000 00000000 0000000000000000
(XEN) IDTR:            000002ff 00000000003e10a8
(XEN)   TR: 0018 0008b 00000068 00000000003e1040
(XEN) EFER = 0x0000000000000000  PAT = 0x0007040600070406
(XEN) PreemptionTimer = 0x00000000  SM Base = 0x00000000
(XEN) DebugCtl = 0x0000000000000000  DebugExceptions = 
0x0000000000000000
(XEN) Interruptibility = 00000000  ActivityState = 00000000
(XEN) *** Host State ***
(XEN) RIP = 0xffff82d08031dd30 (vmx_asm_vmexit_handler)  RSP = 
0xffff83009c057f70
(XEN) CS=e008 SS=0000 DS=0000 ES=0000 FS=0000 GS=0000 TR=e040
(XEN) FSBase=0000000000000000 GSBase=0000000000000000 
TRBase=ffff82d08055e000
(XEN) GDTBase=ffff82d08042e000 IDTBase=ffff82d080559000
(XEN) CR0=0000000080050033 CR3=0000000172a67000 CR4=00000000003526e0
(XEN) Sysenter RSP=ffff83009c057fa0 CS:RIP=e008:ffff82d0803654b0
(XEN) EFER = 0x0000000000000000  PAT = 0x0000050100070406
(XEN) *** Control State ***
(XEN) PinBased=0000003f CPUBased=b6a065fa SecondaryExec=000014eb
(XEN) EntryControls=000053ff ExitControls=000fefff
(XEN) ExceptionBitmap=00060002 PFECmask=00000000 PFECmatch=00000000
(XEN) VMEntry: intr_info=00000020 errcode=00000000 ilen=00000000
(XEN) VMExit: intr_info=00000000 errcode=00000000 ilen=00000001
(XEN)         reason=0000000c qualification=0000000000000000
(XEN) IDTVectoring: info=00000000 errcode=00000000
(XEN) TSC Offset = 0xffffffcf8453199b  TSC Multiplier = 
0x0000000000000000
(XEN) TPR Threshold = 0x00  PostedIntrVec = 0x00
(XEN) EPT pointer = 0x0000000172a0b01e  EPTP index = 0x0000
(XEN) PLE Gap=00000080 Window=00001000
(XEN) Virtual processor ID = 0x000e VMfunc controls = 0000000000000000
(XEN) **************************************

RIP 0x209997 is the 'hlt' instruction in 
mirage_xen_evtchn_block_domain() so we are indeed blocking waiting for 
events to show up.

Martin

