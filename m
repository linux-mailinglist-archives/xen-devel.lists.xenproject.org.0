Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1FF220D41
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 14:45:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvgn2-00062o-2k; Wed, 15 Jul 2020 12:45:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jvgn1-00062j-Hf
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 12:45:35 +0000
X-Inumbo-ID: 136bcf60-c699-11ea-bca7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 136bcf60-c699-11ea-bca7-bc764e2007e4;
 Wed, 15 Jul 2020 12:45:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8554FACBF;
 Wed, 15 Jul 2020 12:45:37 +0000 (UTC)
Subject: Re: [PATCH 1/3] x86/HVM: fold hvm_io_assist() into its only caller
To: paul@xen.org
References: <42270be7-43d6-ba53-3896-e20b5d7e3de0@suse.com>
 <94d683d7-302b-f0c2-0108-3f6d76b8df9b@suse.com>
 <001901d65aa5$27c03560$7740a020$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ec74b9ba-dbc5-7ab4-0f65-6119bc49c333@suse.com>
Date: Wed, 15 Jul 2020 14:45:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <001901d65aa5$27c03560$7740a020$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 'Wei Liu' <wl@xen.org>, 'Andrew Cooper' <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.07.2020 14:40, Paul Durrant wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 15 July 2020 13:04
>>
>>  static bool hvm_wait_for_io(struct hvm_ioreq_vcpu *sv, ioreq_t *p)
>>  {
>>      unsigned int prev_state = STATE_IOREQ_NONE;
>> +    uint64_t data = ~0;
>>
>> -    while ( sv->pending )
>> -    {
>> +    do {
>>          unsigned int state = p->state;
> 
> I guess this is beneficial from the point of view of restricting cope and...
> 
>>
>>          smp_rmb();
>> @@ -132,7 +121,6 @@ static bool hvm_wait_for_io(struct hvm_i
>>               * emulator is dying and it races with an I/O being
>>               * requested.
>>               */
>> -            hvm_io_assist(sv, ~0ul);
>>              break;
> 
> ...(as you say) allowing this early break, but a forward jump to an 'out' label would be more consistent with other code. It works though so...

Since this gets restructured by subsequent patches I thought I'd
avoid the introduction of a disliked by me "goto".

> Reviewed-by: Paul Durrant <paul@xen.org>

Thanks, Jan

