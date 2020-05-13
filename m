Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 334451D1EC5
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 21:14:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYwpv-0002mg-Pz; Wed, 13 May 2020 19:14:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cxQB=63=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jYwpt-0002mX-UF
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 19:14:34 +0000
X-Inumbo-ID: f9e63e26-954d-11ea-ae69-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f9e63e26-954d-11ea-ae69-bc764e2007e4;
 Wed, 13 May 2020 19:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589397272;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=sYInIXPt4WQOis6dwpeauulW9smubci4iZQh6ZDeLM0=;
 b=XvIpDbQpy57SIjOXmtWH79kVgjOlbxWH8PO/FGCfh3GWB4HDatCesKBb
 4HkQtf+z2WldrRS4LJ81Y390R+kst4ZgPqYOYLC4YFyOtZliSgPKKNCX/
 KDgmbVt6KAPkR4/8sLCrwBnhI+hIFNzvxBZ/VDjg9fqeVRdRFX83nnALE o=;
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: LnTBF+hnFXyzCwpCsPGiILXnbdCJ4E/eDLWoLSoTTTqhovoXQxZUIsyOXUNtktdEVLhDOUKGK1
 i3x2Qiq9mCAWnJZT3Hf2WWSu/24/QCqPRp9zH5E85h3aS/XfMemYaE0vT6C/v75HyvgW/C1FVg
 Jtb2KCbioNYyv8F6sBwO+bWb3olJones0YW7KPFD1kxVw0ihkMbWDL1ujMqUrwDK7hbCTw9rSA
 k9hQFCZVpP/N7kbDnoRnU5QD5kbMQfcFj309qN2Y20Rss5XTJmvdwNW5dd0zQzG7hPnNyx00WU
 eZ8=
X-SBRS: 2.7
X-MesageID: 18153276
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,388,1583211600"; d="scan'208";a="18153276"
Subject: Re: [PATCH] x86/build32: Discard all orphaned sections
To: Jan Beulich <jbeulich@suse.com>
References: <20200512191108.6461-1-andrew.cooper3@citrix.com>
 <a1d1135a-8f9c-81c3-5fc8-bbc3787ebd0f@suse.com>
 <e11b2b5b-5504-f2a3-f1d8-986bc97a4b78@citrix.com>
 <875d5449-dde0-e675-fb1e-c2b3ed238674@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e420b0ab-f0e8-4a31-ef7b-b538a58dd455@citrix.com>
Date: Wed, 13 May 2020 20:14:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <875d5449-dde0-e675-fb1e-c2b3ed238674@suse.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jason Andryuk <jandryuk@gmail.com>, Stefan Bader <stefan.bader@canonical.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 13/05/2020 16:15, Jan Beulich wrote:
>>> But it would be really nice if we had a way to
>>> flag the need to play with the linker script. Hence perhaps
>>> on new enough tool chains we indeed may want to make use of
>>> --orphan-handling= ? And then discard just .note and .note.*
>>> here?
>> The only valid option would be =error, but experimenting with that yields
>>
>> ld: error: unplaced orphan section `.comment' from `cmdline.o'
>> ld: error: unplaced orphan section `.note.GNU-stack' from `cmdline.o'
>> ld: error: unplaced orphan section `.note.gnu.property' from `cmdline.o'
>> ld: error: unplaced orphan section `.rel.got' from `cmdline.o'
>> ld: error: unplaced orphan section `.got' from `cmdline.o'
>> ld: error: unplaced orphan section `.got.plt' from `cmdline.o'
>> ld: error: unplaced orphan section `.iplt' from `cmdline.o'
>> ld: error: unplaced orphan section `.rel.iplt' from `cmdline.o'
>> ld: error: unplaced orphan section `.igot.plt' from `cmdline.o'
>>
>> which I think is going to get us massively bogged down in toolchain
>> specifics.  I'm not entirely convinced this would be a good move.
> That's ugly indeed; especially the .rel.* sections are worrying to
> appear there.

What is even more curious, most of them don't exist in cmdine.o

Section Headers:
  [Nr] Name              Type            Addr     Off    Size   ES Flg
Lk Inf Al
  [ 0]                   NULL            00000000 000000 000000 00     
0   0  0
  [ 1] .group            GROUP           00000000 000034 000008 04    
14  38  4
  [ 2] .group            GROUP           00000000 00003c 000008 04    
14  40  4
  [ 3] .text             PROGBITS        00000000 000044 00094a 00  AX 
0   0  1
  [ 4] .rel.text         REL             00000000 000e88 0001e8 08   I
14   3  4
  [ 5] .data             PROGBITS        00000000 00098e 000000 00  WA 
0   0  1
  [ 6] .bss              NOBITS          00000000 00098e 000000 00  WA 
0   0  1
  [ 7] .rodata           PROGBITS        00000000 000990 0000f3 00   A 
0   0  4
  [ 8] .rel.rodata       REL             00000000 001070 000120 08   I
14   7  4
  [ 9] .text.__x86.get_pc_thunk.ax PROGBITS        00000000 000a83
000004 00 AXG  0   0  1
  [10] .text.__x86.get_pc_thunk.bx PROGBITS        00000000 000a87
000004 00 AXG  0   0  1
  [11] .comment          PROGBITS        00000000 000a8b 00002d 01  MS 
0   0  1
  [12] .note.GNU-stack   PROGBITS        00000000 000ab8 000000 00     
0   0  1
  [13] .note.gnu.property NOTE            00000000 000ab8 00001c 00   A 
0   0  4
  [14] .symtab           SYMTAB          00000000 000ad4 000290 10    
15  36  4
  [15] .strtab           STRTAB          00000000 000d64 000124 00     
0   0  1
  [16] .shstrtab         STRTAB          00000000 001190 0000a7 00     
0   0  1

I suspect they are inserted by default as part of processing the
relocations, and end up empty.

With =warn rather than =error, we instead get

ld: warning: orphan section `.comment' from `cmdline.o' being placed in
section `.comment'
ld: warning: orphan section `.note.GNU-stack' from `cmdline.o' being
placed in section `.note.GNU-stack'
ld: warning: orphan section `.note.gnu.property' from `cmdline.o' being
placed in section `.note.gnu.property'
ld: warning: orphan section `.rel.got' from `cmdline.o' being placed in
section `.rel.dyn'
ld: warning: orphan section `.got' from `cmdline.o' being placed in
section `.got'
ld: warning: orphan section `.got.plt' from `cmdline.o' being placed in
section `.got.plt'
ld: warning: orphan section `.iplt' from `cmdline.o' being placed in
section `.iplt'
ld: warning: orphan section `.rel.iplt' from `cmdline.o' being placed in
section `.rel.dyn'
ld: warning: orphan section `.igot.plt' from `cmdline.o' being placed in
section `.igot.plt'

and

Section Headers:
  [Nr] Name              Type            Addr     Off    Size   ES Flg
Lk Inf Al
  [ 0]                   NULL            00000000 000000 000000 00     
0   0  0
  [ 1] .note.gnu.property NOTE            00000000 0000b4 00001c 00   A 
0   0  4
  [ 2] .text             PROGBITS        0000001c 0000d0 000a47 00 WAX 
0   0  4
  [ 3] .got.plt          PROGBITS        00000a64 000b18 00000c 04  WA 
0   0  4
  [ 4] .comment          PROGBITS        00000000 000b24 00002c 01  MS 
0   0  1
  [ 5] .symtab           SYMTAB          00000000 000b50 000230 10     
6  31  4
  [ 6] .strtab           STRTAB          00000000 000d80 000124 00     
0   0  1
  [ 7] .shstrtab         STRTAB          00000000 000ea4 000046 00     
0   0  1

in cmdline.lnk, so the .rel.* sections have been dropped overall.  I
think the =error logic is simply at an unhelpful position during processing.

> Hence patch as is Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks,

As I say, I have a plan to replace all of this completely when a bit
more of kbuild is in place.

~Andrew

