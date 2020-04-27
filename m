Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF771BA9FA
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 18:19:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT6TD-0003D0-Ch; Mon, 27 Apr 2020 16:18:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=niBk=6L=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jT6TB-0003Cu-LS
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 16:18:57 +0000
X-Inumbo-ID: cac0871d-88a2-11ea-97b4-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cac0871d-88a2-11ea-97b4-12813bfff9fa;
 Mon, 27 Apr 2020 16:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588004336;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=FOWGreBxz92IOJgB0QwEMGiJIHFEFFCTUhDLgRDWo5Y=;
 b=NA+yBDDFKFapsxRdnWeQN5/6QBC3ah0TvvjPt6vinH3m8/IWTswOmR3z
 KXswDvJYSk5TCfqn81FH6o7KR4xp8u0LXWssaM48gVwhafzZLBb8eWMy6
 juw9nTRIgOScd0befpD1lTqSBuPN5OAyoXnHw+DBhxNEovCbihUBYxAJl I=;
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
IronPort-SDR: Y8frG35IAEqDcJJd14AgMqpxM8LXM5meRBA/E0va8hFfHxbwrG+dbKsAJmh3noNWdL+BVq7q3O
 vUfOVbyIKMyk8Bv8MFGY1BT6AZ8cBC6Af27VoS4UjeCyeU9XsSXMh4u5iWsO0TgpZ1lvyP4ca5
 9KqPRB2TD6yVf5FyEEIX9Wk6Wgo44T641KnesgRpYtrZttYyM7AsKWprpzmYfi/eTKaj5hP+nm
 /m8ZJfbRjhR2Uc3+J45NuVZRfa3ZyUL879uilNYxIuAb7rYExUxkwPH/a5HUGyD9OdvZp+heSk
 pkY=
X-SBRS: 2.7
X-MesageID: 16329530
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,324,1583211600"; d="scan'208";a="16329530"
Subject: Re: [PATCH] x86/ioemul: Rewrite stub generation
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200427122041.7162-1-andrew.cooper3@citrix.com>
 <20200427151829.GP28601@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <cd4ae124-ce0b-85e6-bae7-94d32e1dba73@citrix.com>
Date: Mon, 27 Apr 2020 17:18:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200427151829.GP28601@Air-de-Roger>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27/04/2020 16:18, Roger Pau Monné wrote:
> On Mon, Apr 27, 2020 at 01:20:41PM +0100, Andrew Cooper wrote:
>> The logic is completely undocumented and almost impossible to follow.  It
>> actually uses return oriented programming.  Rewrite it to conform to more
>> normal call mechanics, and leave a big comment explaining thing.  As well as
>> the code being easier to follow, it will execute faster as it isn't fighting
>> the branch predictor.
>>
>> Move the ioemul_handle_quirk() function pointer from traps.c to
>> ioport_emulate.c.
> Seeing as the newest quirk was added in 2008, I wonder if such quirks
> are still relevant?
>
> Maybe they are also used by newer boxes, I really have no idea.

Its not something which I'd consider altering in this patch anyway.

>
>> +
>> +static unsigned int ioemul_handle_proliant_quirk(
>>      u8 opcode, char *io_emul_stub, struct cpu_user_regs *regs)
>>  {
>>      static const char stub[] = {
>> @@ -19,18 +22,16 @@ static bool ioemul_handle_proliant_quirk(
>>          0xa8, 0x80, /*    test $0x80, %al */
>>          0x75, 0xfb, /*    jnz 1b          */
>>          0x9d,       /*    popf            */
>> -        0xc3,       /*    ret             */
>>      };
>>      uint16_t port = regs->dx;
>>      uint8_t value = regs->al;
>>  
>>      if ( (opcode != 0xee) || (port != 0xcd4) || !(value & 0x80) )
>> -        return false;
>> +        return 0;
>>  
>>      memcpy(io_emul_stub, stub, sizeof(stub));
>> -    BUILD_BUG_ON(IOEMUL_QUIRK_STUB_BYTES < sizeof(stub));
>>  
>> -    return true;
>> +    return sizeof(stub);
>>  }
>>  
>>  /* This table is the set of system-specific I/O emulation hooks. */
>> diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
>> index e24b84f46a..f150886711 100644
>> --- a/xen/arch/x86/pv/emul-priv-op.c
>> +++ b/xen/arch/x86/pv/emul-priv-op.c
>> @@ -54,51 +54,96 @@ struct priv_op_ctxt {
>>      unsigned int bpmatch;
>>  };
>>  
>> -/* I/O emulation support. Helper routines for, and type of, the stack stub. */
>> -void host_to_guest_gpr_switch(struct cpu_user_regs *);
>> -unsigned long guest_to_host_gpr_switch(unsigned long);
>> +/* I/O emulation helpers.  Use non-standard calling conventions. */
>> +extern const char load_guest_gprs[], save_guest_gprs[];
>>  
>>  typedef void io_emul_stub_t(struct cpu_user_regs *);
>>  
>>  static io_emul_stub_t *io_emul_stub_setup(struct priv_op_ctxt *ctxt, u8 opcode,
>>                                            unsigned int port, unsigned int bytes)
>>  {
>> +    /*
>> +     * Construct a stub for IN/OUT emulation.
>> +     *
>> +     * Some platform drivers communicate with the SMM handler using GPRs as a
>> +     * mailbox.  Therefore, we must perform the emulation with the hardware
>> +     * domain's registers in view.
>> +     *
>> +     * We write a stub of the following form, using the guest load/save
>> +     * helpers (abnormal calling conventions), and one of several possible
>> +     * stubs performing the real I/O.
>> +     */
>> +    static const char prologue[] = {
>> +        0x53,       /* push %rbx */
>> +        0x55,       /* push %rbp */
>> +        0x41, 0x54, /* push %r12 */
>> +        0x41, 0x55, /* push %r13 */
>> +        0x41, 0x56, /* push %r14 */
>> +        0x41, 0x57, /* push %r15 */
>> +        0x57,       /* push %rdi (param for save_guest_gprs) */
>> +    };              /* call load_guest_gprs */
>> +                    /* <I/O stub> */
>> +                    /* call save_guest_gprs */
>> +    static const char epilogue[] = {
>> +        0x5f,       /* pop %rdi  */
>> +        0x41, 0x5f, /* pop %r15  */
>> +        0x41, 0x5e, /* pop %r14  */
>> +        0x41, 0x5d, /* pop %r13  */
>> +        0x41, 0x5c, /* pop %r12  */
>> +        0x5d,       /* pop %rbp  */
>> +        0x5b,       /* pop %rbx  */
>> +        0xc3,       /* ret       */
>> +    };
>> +
>>      struct stubs *this_stubs = &this_cpu(stubs);
>>      unsigned long stub_va = this_stubs->addr + STUB_BUF_SIZE / 2;
>> -    long disp;
>> -    bool use_quirk_stub = false;
>> +    unsigned int quirk_bytes = 0;
>> +    char *p;
>> +
>> +    /* Helpers - Read outer scope but only modify p. */
>> +#define APPEND_BUFF(b) ({ memcpy(p, b, sizeof(b)); p += sizeof(b); })
>> +#define APPEND_CALL(f)                                                  \
>> +    ({                                                                  \
>> +        long disp = (long)(f) - (stub_va + p - ctxt->io_emul_stub + 5); \
>> +        BUG_ON((int32_t)disp != disp);                                  \
> I'm not sure I get the point of using signed integers instead of
> unsigned ones, AFAICT you just want to check that the displacement is
> < 4GB so that a relative call can be used?

Displacements are +/- 2G, not <4G.

Using unsigned here would be buggy.

~Andrew

