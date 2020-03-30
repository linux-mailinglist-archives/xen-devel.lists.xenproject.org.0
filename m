Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 810F91974A1
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 08:43:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIo6M-0006gQ-SB; Mon, 30 Mar 2020 06:40:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QcrT=5P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jIo6L-0006gL-EK
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 06:40:49 +0000
X-Inumbo-ID: 63be3abc-7251-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63be3abc-7251-11ea-bec1-bc764e2007e4;
 Mon, 30 Mar 2020 06:40:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D1F17AB8F;
 Mon, 30 Mar 2020 06:40:46 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <6fa81b4d-528d-5c33-50c5-a18396b4383a@suse.com>
 <6e500b1e-2ff1-5fc3-de2f-e0ac0e4cf094@suse.com>
 <93f9f425-1346-63cb-d9e6-810130d56df4@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f1baf162-de08-d5ac-ba7b-425b754c5b12@suse.com>
Date: Mon, 30 Mar 2020 08:40:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <93f9f425-1346-63cb-d9e6-810130d56df4@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [Xen-devel] [PATCH v5 01/10] x86emul: support AVX512_BF16 insns
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.03.2020 19:20, Andrew Cooper wrote:
> On 24/03/2020 12:30, Jan Beulich wrote:
>> --- a/tools/tests/x86_emulator/evex-disp8.c
>> +++ b/tools/tests/x86_emulator/evex-disp8.c
>> @@ -550,6 +550,12 @@ static const struct test avx512_4vnniw_5
>>      INSN(p4dpwssds, f2, 0f38, 53, el_4, d, vl),
>>  };
>>  
>> +static const struct test avx512_bf16_all[] = {
>> +    INSN(vcvtne2ps2bf16, f2, 0f38, 72, vl, d, vl),
>> +    INSN(vcvtneps2bf16,  f3, 0f38, 72, vl, d, vl),
>> +    INSN(vdpbf16ps,      f3, 0f38, 52, vl, d, vl),
>> +};
>> +
>>  static const struct test avx512_bitalg_all[] = {
>>      INSN(popcnt,      66, 0f38, 54, vl, bw, vl),
>>      INSN(pshufbitqmb, 66, 0f38, 8f, vl,  b, vl),
>> @@ -984,6 +990,7 @@ void evex_disp8_test(void *instr, struct
>>      RUN(avx512pf, 512);
>>      RUN(avx512_4fmaps, 512);
>>      RUN(avx512_4vnniw, 512);
>> +    RUN(avx512_bf16, all);
>>      RUN(avx512_bitalg, all);
>>      RUN(avx512_ifma, all);
>>      RUN(avx512_vbmi, all);
>> --- a/tools/tests/x86_emulator/test_x86_emulator.c
>> +++ b/tools/tests/x86_emulator/test_x86_emulator.c
>> @@ -4516,6 +4516,80 @@ int main(int argc, char **argv)
>>      else
>>          printf("skipped\n");
>>  
>> +    if ( stack_exec && cpu_has_avx512_bf16 )
>> +    {
>> +        decl_insn(vcvtne2ps2bf16);
>> +        decl_insn(vcvtneps2bf16);
>> +        decl_insn(vdpbf16ps);
>> +        static const struct {
>> +            float f[16];
>> +        } in1 = {{
>> +            1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
>> +        }}, in2 = {{
>> +            1, -2, 3, -4, 5, -6, 7, -8, 9, -10, 11, -12, 13, -14, 15, -16
>> +        }}, out = {{
>> +            1 * 1 + 2 * 2, 3 * 3 + 4 * 4,
>> +            5 * 5 + 6 * 6, 7 * 7 + 8 * 8,
>> +            9 * 9 + 10 * 10, 11 * 11 + 12 * 12,
>> +            13 * 13 + 14 * 14, 15 * 15 + 16 * 16,
>> +            1 * 1 - 2 * 2, 3 * 3 - 4 * 4,
>> +            5 * 5 - 6 * 6, 7 * 7 - 8 * 8,
>> +            9 * 9 - 10 * 10, 11 * 11 - 12 * 12,
>> +            13 * 13 - 14 * 14, 15 * 15 - 16 * 16
>> +        }};
>> +
>> +        printf("%-40s", "Testing vcvtne2ps2bf16 64(%ecx),%zmm1,%zmm2...");
>> +        asm volatile ( "vmovups %1, %%zmm1\n"
>> +                       put_insn(vcvtne2ps2bf16,
>> +                                /* vcvtne2ps2bf16 64(%0), %%zmm1, %%zmm2 */
>> +                                ".byte 0x62, 0xf2, 0x77, 0x48, 0x72, 0x51, 0x01")
>> +                       :: "c" (NULL), "m" (in2) );
>> +        set_insn(vcvtne2ps2bf16);
>> +        regs.ecx = (unsigned long)&in1 - 64;
>> +        rc = x86_emulate(&ctxt, &emulops);
>> +        if ( rc != X86EMUL_OKAY || !check_eip(vcvtne2ps2bf16) )
>> +            goto fail;
>> +        printf("pending\n");
>> +
>> +        printf("%-40s", "Testing vcvtneps2bf16 64(%ecx),%ymm3...");
>> +        asm volatile ( put_insn(vcvtneps2bf16,
>> +                                /* vcvtneps2bf16 64(%0), %%ymm3 */
>> +                                ".byte 0x62, 0xf2, 0x7e, 0x48, 0x72, 0x59, 0x01")
>> +                       :: "c" (NULL) );
>> +        set_insn(vcvtneps2bf16);
>> +        rc = x86_emulate(&ctxt, &emulops);
>> +        if ( rc != X86EMUL_OKAY || !check_eip(vcvtneps2bf16) )
>> +            goto fail;
>> +        asm ( "vmovdqa %%ymm2, %%ymm5\n\t"
>> +              "vpcmpeqd %%zmm3, %%zmm5, %%k0\n\t"
>> +              "kmovw %%k0, %0"
>> +              : "=g" (rc) : "m" (out) );
>> +        if ( rc != 0xffff )
>> +            goto fail;
>> +        printf("pending\n");
>> +
>> +        printf("%-40s", "Testing vdpbf16ps 128(%ecx),%zmm2,%zmm4...");
>> +        asm volatile ( "vmovdqa %%ymm3, %0\n\t"
>> +                       "vmovdqa %%ymm3, %1\n"
>> +                       put_insn(vdpbf16ps,
>> +                                /* vdpbf16ps 128(%2), %%zmm2, %%zmm4 */
>> +                                ".byte 0x62, 0xf2, 0x6e, 0x48, 0x52, 0x61, 0x02")
>> +                       : "=&m" (res[0]), "=&m" (res[8])
>> +                       : "c" (NULL)
>> +                       : "memory" );
>> +        set_insn(vdpbf16ps);
>> +        regs.ecx = (unsigned long)res - 128;
>> +        rc = x86_emulate(&ctxt, &emulops);
>> +        if ( rc != X86EMUL_OKAY || !check_eip(vdpbf16ps) )
>> +            goto fail;
>> +        asm ( "vcmpeqps %1, %%zmm4, %%k0\n\t"
>> +              "kmovw %%k0, %0"
>> +              : "=g" (rc) : "m" (out) );
>> +        if ( rc != 0xffff )
>> +            goto fail;
>> +        printf("okay\n");
>> +    }
> 
> I've just tried this out on an SDP.
> 
> Testing vcvtne2ps2bf16 64(%ecx),%zmm1,%zmm2...pending
> Testing vcvtneps2bf16 64(%ecx),%ymm3... pending
> Testing vdpbf16ps 128(%ecx),%zmm2,%zmm4...okay
> ...
> Testing avx512_bf16/all disp8 handling...okay
> 
> What is the "pending" supposed to signify?  I can see that these three
> are linked, and that is fine, but at the point we've checked the
> intermediate results, it should be "okay", no?

I didn't think so, and hence I've used "pending". Whether the result of
the first two is indeed correct is only known after the 3rd.

Jan

