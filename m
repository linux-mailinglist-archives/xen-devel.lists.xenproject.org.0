Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C7F19990B
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 16:57:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJIIQ-0001Cq-St; Tue, 31 Mar 2020 14:55:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fshn=5Q=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jJIIP-0001Cj-Ct
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 14:55:17 +0000
X-Inumbo-ID: a177477c-735f-11ea-9e09-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a177477c-735f-11ea-9e09-bc764e2007e4;
 Tue, 31 Mar 2020 14:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585666516;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=W3pQzY+SOIenh2W+tkNSDvsXKTuxvadCFLMX3CAsqn8=;
 b=IqlfC2dikFdtUX3lynZ4ObRU9HOO51iZapR5rop7mB1eXWfURjGPr8FH
 equX6frbA5NAqS09qYBaMEnrlgCmZD7V6S3HA476xK8RuZS0i+LEpNAJD
 m3pl3JXOstWVFRca1sfwJ0akhCTV2MXYUWU4EP7Q7bwL5LSbfIUQ9hYuw A=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: f5B05I3hyPAjWgMhBIktpgTogNjUR/MgfTr+mjQcNw/9R6/eQfHivj04mflFGJD8ToQgcTn47o
 Rayry4oBW2rdLliKyZxHF12y+m9taXDXLwHMXDyRuVbVzJ23DpjkmdxS6jbqY0uvEZaFViS7p6
 m983Ftw+HYVbmmsMjmfc3qphEFmLKOGBE7klWKM2ftGzl731IHqwQQKrYYgnTpBR126fYveFTO
 Ytfbi226xSBlUU+4tBk/X2JuWpeHOf3IudrcCI5iK0iQpV91BJBAoc8dJcW6/iyveHn0tPuzMT
 MOM=
X-SBRS: 2.7
X-MesageID: 15156781
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,328,1580792400"; d="scan'208";a="15156781"
Subject: Re: [PATCH 09/11] x86/ucode/amd: Remove gratuitous memory allocations
 from cpu_request_microcode()
To: Jan Beulich <jbeulich@suse.com>
References: <20200331100531.4294-1-andrew.cooper3@citrix.com>
 <20200331100531.4294-10-andrew.cooper3@citrix.com>
 <a3a577ab-9470-2a6b-1e2c-b8d762b35d57@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e1d54f14-9e2c-3f0b-61a4-2cbf220d1f54@citrix.com>
Date: Tue, 31 Mar 2020 15:55:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <a3a577ab-9470-2a6b-1e2c-b8d762b35d57@suse.com>
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

On 31/03/2020 15:51, Jan Beulich wrote:
> On 31.03.2020 12:05, Andrew Cooper wrote:
>> @@ -497,57 +456,54 @@ static struct microcode_patch *cpu_request_microcode(const void *buf, size_t siz
>>       * It's possible the data file has multiple matching ucode,
>>       * lets keep searching till the latest version
>>       */
>> -    while ( (error = get_ucode_from_buffer_amd(mc_amd, buf, size,
>> -                                               &offset)) == 0 )
>> +    buf  += offset;
>> +    size -= offset;
>>      {
>> -        /*
>> -         * If the new ucode covers current CPU, compare ucodes and store the
>> -         * one with higher revision.
>> -         */
>> -        if ( (microcode_fits(mc_amd->mpb) != MIS_UCODE) &&
>> -             (!saved || (compare_header(mc_amd->mpb, saved) == NEW_UCODE)) )
>> +        while ( size )
>>          {
>> -            xfree(saved);
>> -            saved = mc_amd->mpb;
>> -        }
>> -        else
>> -        {
>> -            xfree(mc_amd->mpb);
>> -            mc_amd->mpb = NULL;
>> -        }
>> +            const struct container_microcode *mc;
>> +
>> +            if ( size < sizeof(*mc) ||
>> +                 (mc = buf)->type != UCODE_UCODE_TYPE ||
>> +                 size - sizeof(*mc) < mc->len ||
>> +                 !verify_patch_size(mc->len) )
>> +            {
>> +                printk(XENLOG_ERR "microcode: Bad microcode data\n");
>> +                error = -EINVAL;
>> +                break;
>> +            }
>>  
>> -        if ( offset >= size )
>> -            break;
>> +            /*
>> +             * If the new ucode covers current CPU, compare ucodes and store the
>> +             * one with higher revision.
>> +             */
>> +            if ( (microcode_fits(mc->patch) != MIS_UCODE) &&
>> +                 (!saved || (compare_header(mc->patch, saved) == NEW_UCODE)) )
>> +            {
>> +                saved = mc->patch;
>> +                saved_size = mc->len;
>> +            }
>>  
>> -        /*
>> -         * 1. Given a situation where multiple containers exist and correct
>> -         *    patch lives on a container that is not the last container.
>> -         * 2. We match equivalent ids using find_equiv_cpu_id() from the
>> -         *    earlier while() (On this case, matches on earlier container
>> -         *    file and we break)
>> -         * 3. Proceed to while ( (error = get_ucode_from_buffer_amd(mc_amd,
>> -         *                                  buf, size, &offset)) == 0 )
>> -         * 4. Find correct patch using microcode_fits() and apply the patch
>> -         *    (Assume: apply_microcode() is successful)
>> -         * 5. The while() loop from (3) continues to parse the binary as
>> -         *    there is a subsequent container file, but...
>> -         * 6. ...a correct patch can only be on one container and not on any
>> -         *    subsequent ones. (Refer docs for more info) Therefore, we
>> -         *    don't have to parse a subsequent container. So, we can abort
>> -         *    the process here.
>> -         * 7. This ensures that we retain a success value (= 0) to 'error'
>> -         *    before if ( mpbuf->type != UCODE_UCODE_TYPE ) evaluates to
>> -         *    false and returns -EINVAL.
>> -         */
>> -        if ( offset + SECTION_HDR_SIZE <= size &&
>> -             *(const uint32_t *)(buf + offset) == UCODE_MAGIC )
>> -            break;
>> +            /* Move over the microcode blob. */
>> +            buf  += sizeof(*mc) + mc->len;
>> +            size -= sizeof(*mc) + mc->len;
>> +
>> +            /*
>> +             * Peek ahead.  If we see the start of another container, we've
>> +             * exhaused all microcode blobs in this container.  Exit cleanly.
>> +             */
>> +            if ( size >= 4 && *(const uint32_t *)buf == UCODE_MAGIC )
>> +                break;
> While, as already indicated, I agree with shrinking the big comment,
> I think point 6 is what wants retaining in some form - it's not
> obvious at all why a subsequent container couldn't contain a higher
> rev ucode than what we've found. That comment refers us to docs, but
> I couldn't find anything to this effect in PM Vol 2. Assuming this
> indeed documented and true, with the comment extended accordingly
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

I think it is referring to the internal PPR, which isn't even the one we
have access to.

As to the multiple containers aspect, I've deliberately "fixed" that in
patch 11 so we do scan all the way to the end.

Its a much more obvious way to do things, even if the default case is to
only provide a single container applicable to a specific family.

~Andrew

