Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FFD199A45
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 17:50:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJJ7D-00064b-MR; Tue, 31 Mar 2020 15:47:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fshn=5Q=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jJJ7B-00064W-OX
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 15:47:45 +0000
X-Inumbo-ID: f60337ea-7366-11ea-ba2e-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f60337ea-7366-11ea-ba2e-12813bfff9fa;
 Tue, 31 Mar 2020 15:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585669664;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=tbv2qf+lhvvwBScA44qqYXNhA1ok3Ph/JdeduGS5xxI=;
 b=LD/p2100pj3/H5TjSY1jNqXpJ1MEyB9j3pi0B38DXQqweXo7VUABXgpf
 +m+Pdgg4MTLaTf+xGQFv/ygPhxxoBLalpPZkd9O2tf5QxFQHFdMZoz88K
 hCCAh5sWqS6iBbB33LFfw+ea15yyq9xoh9mgZdgEy5c8cpoOFuzWPDU+a o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YS8TAxNKE2rwUITxrEfbrgx3ICVefjgXhk9Ac9v6O8YhjlN28CXZXBfR+b0nJPIw+YMLKvIivY
 SIj10xo5caqNap3iBSONlarpYyAyqgKIPsJ9R4tIvTBNLJh/KWaUwf87iOmWB+JPUUTh1N7Vzi
 +cwJBe6elk1jLFgbVR1D/5fKA+7dm4SZX6/X+ZI6sOl4hnBvEiudd6nGjjQOtcrb1U/2YfLTi0
 33eK5ZVaHBOqPysaFh6NCsiWNL7Bnl4I7WIhAioZzwZnSXryeupw08DTPPiMkoLYd7+eJp2ptr
 m+8=
X-SBRS: 2.7
X-MesageID: 15267286
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,328,1580792400"; d="scan'208";a="15267286"
Subject: Re: [PATCH 09/11] x86/ucode/amd: Remove gratuitous memory allocations
 from cpu_request_microcode()
To: Jan Beulich <jbeulich@suse.com>
References: <20200331100531.4294-1-andrew.cooper3@citrix.com>
 <20200331100531.4294-10-andrew.cooper3@citrix.com>
 <a3a577ab-9470-2a6b-1e2c-b8d762b35d57@suse.com>
 <e1d54f14-9e2c-3f0b-61a4-2cbf220d1f54@citrix.com>
 <304e008b-6483-9a9a-d4e5-8dcd844ed7c7@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <3bc2b672-c950-8e66-e953-bea944ff84ba@citrix.com>
Date: Tue, 31 Mar 2020 16:47:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <304e008b-6483-9a9a-d4e5-8dcd844ed7c7@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 31/03/2020 16:13, Jan Beulich wrote:
> On 31.03.2020 16:55, Andrew Cooper wrote:
>> On 31/03/2020 15:51, Jan Beulich wrote:
>>> On 31.03.2020 12:05, Andrew Cooper wrote:
>>>> @@ -497,57 +456,54 @@ static struct microcode_patch *cpu_request_microcode(const void *buf, size_t siz
>>>>       * It's possible the data file has multiple matching ucode,
>>>>       * lets keep searching till the latest version
>>>>       */
>>>> -    while ( (error = get_ucode_from_buffer_amd(mc_amd, buf, size,
>>>> -                                               &offset)) == 0 )
>>>> +    buf  += offset;
>>>> +    size -= offset;
>>>>      {
>>>> -        /*
>>>> -         * If the new ucode covers current CPU, compare ucodes and store the
>>>> -         * one with higher revision.
>>>> -         */
>>>> -        if ( (microcode_fits(mc_amd->mpb) != MIS_UCODE) &&
>>>> -             (!saved || (compare_header(mc_amd->mpb, saved) == NEW_UCODE)) )
>>>> +        while ( size )
>>>>          {
>>>> -            xfree(saved);
>>>> -            saved = mc_amd->mpb;
>>>> -        }
>>>> -        else
>>>> -        {
>>>> -            xfree(mc_amd->mpb);
>>>> -            mc_amd->mpb = NULL;
>>>> -        }
>>>> +            const struct container_microcode *mc;
>>>> +
>>>> +            if ( size < sizeof(*mc) ||
>>>> +                 (mc = buf)->type != UCODE_UCODE_TYPE ||
>>>> +                 size - sizeof(*mc) < mc->len ||
>>>> +                 !verify_patch_size(mc->len) )
>>>> +            {
>>>> +                printk(XENLOG_ERR "microcode: Bad microcode data\n");
>>>> +                error = -EINVAL;
>>>> +                break;
>>>> +            }
>>>>  
>>>> -        if ( offset >= size )
>>>> -            break;
>>>> +            /*
>>>> +             * If the new ucode covers current CPU, compare ucodes and store the
>>>> +             * one with higher revision.
>>>> +             */
>>>> +            if ( (microcode_fits(mc->patch) != MIS_UCODE) &&
>>>> +                 (!saved || (compare_header(mc->patch, saved) == NEW_UCODE)) )
>>>> +            {
>>>> +                saved = mc->patch;
>>>> +                saved_size = mc->len;
>>>> +            }
>>>>  
>>>> -        /*
>>>> -         * 1. Given a situation where multiple containers exist and correct
>>>> -         *    patch lives on a container that is not the last container.
>>>> -         * 2. We match equivalent ids using find_equiv_cpu_id() from the
>>>> -         *    earlier while() (On this case, matches on earlier container
>>>> -         *    file and we break)
>>>> -         * 3. Proceed to while ( (error = get_ucode_from_buffer_amd(mc_amd,
>>>> -         *                                  buf, size, &offset)) == 0 )
>>>> -         * 4. Find correct patch using microcode_fits() and apply the patch
>>>> -         *    (Assume: apply_microcode() is successful)
>>>> -         * 5. The while() loop from (3) continues to parse the binary as
>>>> -         *    there is a subsequent container file, but...
>>>> -         * 6. ...a correct patch can only be on one container and not on any
>>>> -         *    subsequent ones. (Refer docs for more info) Therefore, we
>>>> -         *    don't have to parse a subsequent container. So, we can abort
>>>> -         *    the process here.
>>>> -         * 7. This ensures that we retain a success value (= 0) to 'error'
>>>> -         *    before if ( mpbuf->type != UCODE_UCODE_TYPE ) evaluates to
>>>> -         *    false and returns -EINVAL.
>>>> -         */
>>>> -        if ( offset + SECTION_HDR_SIZE <= size &&
>>>> -             *(const uint32_t *)(buf + offset) == UCODE_MAGIC )
>>>> -            break;
>>>> +            /* Move over the microcode blob. */
>>>> +            buf  += sizeof(*mc) + mc->len;
>>>> +            size -= sizeof(*mc) + mc->len;
>>>> +
>>>> +            /*
>>>> +             * Peek ahead.  If we see the start of another container, we've
>>>> +             * exhaused all microcode blobs in this container.  Exit cleanly.
>>>> +             */
>>>> +            if ( size >= 4 && *(const uint32_t *)buf == UCODE_MAGIC )
>>>> +                break;
>>> While, as already indicated, I agree with shrinking the big comment,
>>> I think point 6 is what wants retaining in some form - it's not
>>> obvious at all why a subsequent container couldn't contain a higher
>>> rev ucode than what we've found. That comment refers us to docs, but
>>> I couldn't find anything to this effect in PM Vol 2. Assuming this
>>> indeed documented and true, with the comment extended accordingly
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> I think it is referring to the internal PPR, which isn't even the one we
>> have access to.
>>
>> As to the multiple containers aspect, I've deliberately "fixed" that in
>> patch 11 so we do scan all the way to the end.
> Right, meanwhile I've seen this. But shouldn't patch 11 then adjust at
> least the "Exit cleanly" part of the comment? You're merely breaking
> the inner loop then ...

I'd still argue that "exit cleanly" is fine in context.

Without it, the end of buffer case happens fine as size becomes 0 and
terminates both loops, but in the case that there is a following
container, without it we fail because of the "!= UCODE_UCODE_TYPE" check.

~Andrew

