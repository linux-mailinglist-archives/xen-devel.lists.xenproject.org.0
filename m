Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DA61E25A0
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 17:39:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdbfD-0006AO-N2; Tue, 26 May 2020 15:38:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vgeY=7I=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jdbfC-0006AJ-Hb
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 15:38:46 +0000
X-Inumbo-ID: fc18e6ee-9f66-11ea-a661-12813bfff9fa
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fc18e6ee-9f66-11ea-a661-12813bfff9fa;
 Tue, 26 May 2020 15:38:45 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:52580
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jdbf7-000xmp-Lx (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Tue, 26 May 2020 16:38:41 +0100
Subject: Re: [PATCH 02/16] x86/traps: Clean up printing in
 do_reserved_trap()/fatal_trap()
To: Jan Beulich <jbeulich@suse.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-3-andrew.cooper3@citrix.com>
 <aca22b53-895e-19bb-c54c-f1e4945c95c1@suse.com>
 <8f1d68b1-895a-d2a6-4dcb-55b688b03336@citrix.com>
 <b1ef905c-dab6-d1c3-4673-4c06c7e94a0a@suse.com>
 <560c3bce-211a-52ab-c919-9ca1ab9beab3@citrix.com>
 <45545b0c-2f0d-1de8-88ec-472d0a110eaa@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <8f5dc985-502c-3ed5-1e4e-980a91acfba4@citrix.com>
Date: Tue, 26 May 2020 16:38:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <45545b0c-2f0d-1de8-88ec-472d0a110eaa@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19/05/2020 09:50, Jan Beulich wrote:
> On 18.05.2020 18:54, Andrew Cooper wrote:
>> On 11/05/2020 16:09, Jan Beulich wrote:
>>> On 11.05.2020 17:01, Andrew Cooper wrote:
>>>> On 04/05/2020 14:08, Jan Beulich wrote:
>>>>> On 02.05.2020 00:58, Andrew Cooper wrote:
>>>>>> For one, they render the vector in a different base.
>>>>>>
>>>>>> Introduce X86_EXC_* constants and vec_name() to refer to exceptions by their
>>>>>> mnemonic, which starts bringing the code/diagnostics in line with the Intel
>>>>>> and AMD manuals.
>>>>> For this "bringing in line" purpose I'd like to see whether you could
>>>>> live with some adjustments to how you're currently doing things:
>>>>> - NMI is nowhere prefixed by #, hence I think we'd better not do so
>>>>>   either; may require embedding the #-es in the names[] table, or not
>>>>>   using N() for NMI
>>>> No-one is going to get confused at seeing #NMI in an error message.  I
>>>> don't mind jugging the existing names table, but anything more
>>>> complicated is overkill.
>>>>
>>>>> - neither Coprocessor Segment Overrun nor vector 0x0f have a mnemonic
>>>>>   and hence I think we shouldn't invent one; just treat them like
>>>>>   other reserved vectors (of which at least vector 0x09 indeed is one
>>>>>   on x86-64)?
>>>> This I disagree with.  Coprocessor Segment Overrun *is* its name in both
>>>> manuals, and the avoidance of vector 0xf is clearly documented as well,
>>>> due to it being the default PIC Spurious Interrupt Vector.
>>>>
>>>> Neither CSO or SPV are expected to be encountered in practice, but if
>>>> they are, highlighting them is a damn-sight more helpful than pretending
>>>> they don't exist.
>>> How is them occurring (and getting logged with their vector numbers)
>>> any different from other reserved, acronym-less vectors? I particularly
>>> didn't suggest to pretend they don't exist; instead I did suggest that
>>> they are as reserved as, say, vector 0x18. By inventing an acronym and
>>> logging this instead of the vector number you'll make people other than
>>> you have to look up what the odd acronym means iff such an exception
>>> ever got raised.
>> You snipped the bits in the patch where both the vector number and
>> acronym are printed together.
>>
>> Anyone who doesn't know the vector has to look it up anyway, at which
>> point they'll find that what Xen prints out matches what both manuals
>> say.  OTOH, people who know what a coprocessor segment overrun or PIC
>> spurious vector is won't need to look it up.
> And who know to decipher the non-standard CPO and SPV (which are what
> triggered my comments in the first place).

CSO, and no.

Anyone who doesn't know the text still has the vector number to work
with, and still needs to look it up.

At which point they will observe that the text is appropriate in context.

> What I continue to fail to
> see is why these reserved vectors need treatment different from all
> others.

Because it has nothing to do with reserved-ness.

It is about providing clarifying information (for all vectors which
currently have, or have ever had, meaning) for mere mortals who can't
(or rather, don't want to) debug crashes based on raw numbers alone.

> In addition I'm having trouble seeing how the default spurious
> PIC vector matters for us - we program the PIC to vectors 0x20-0x2f,
> i.e. a spurious PIC0 IRQ would show up at vector 0x27. (I notice we
> still blindly assume there's a pair of PICs in the first place.)

That's not relevant.  What is relevant is the actions taken when we see
vector 15 being raised.

Hitting CSO means that legacy #FERR_FREEZE external signal has been
wired up (and it is very SMP-unsafe, hence why it was phased out with
the introductions integrated x87's).

Hitting SPV means that the PIC wasn't reprogrammed and something wonky
is going on with one of the input pins.

Both of these are strictly more helpful in a log than "something went
wrong - figure it out yourself", and both indicate that something is
very wrong with the system.

~Andrew

