Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 614224D010E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 15:22:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286092.485452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nREFX-0001DN-Dp; Mon, 07 Mar 2022 14:22:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286092.485452; Mon, 07 Mar 2022 14:22:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nREFX-0001BL-AA; Mon, 07 Mar 2022 14:22:11 +0000
Received: by outflank-mailman (input) for mailman id 286092;
 Mon, 07 Mar 2022 14:22:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pTMl=TS=cantab.net=dvrabel@srs-se1.protection.inumbo.net>)
 id 1nREFV-0001Ax-Vu
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 14:22:09 +0000
Received: from smarthost01b.sbp.mail.zen.net.uk
 (smarthost01b.sbp.mail.zen.net.uk [212.23.1.3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f83c3a29-9e21-11ec-8539-5f4723681683;
 Mon, 07 Mar 2022 15:22:08 +0100 (CET)
Received: from [82.70.146.41] (helo=pear.davidvrabel.org.uk)
 by smarthost01b.sbp.mail.zen.net.uk with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 (envelope-from <dvrabel@cantab.net>)
 id 1nREFP-0003Vq-3t; Mon, 07 Mar 2022 14:22:03 +0000
Received: from apple.davidvrabel.org.uk ([82.70.146.43])
 by pear.davidvrabel.org.uk with esmtp (Exim 4.92)
 (envelope-from <dvrabel@cantab.net>)
 id 1nREFF-0005Go-Ra; Mon, 07 Mar 2022 14:22:02 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: f83c3a29-9e21-11ec-8539-5f4723681683
Message-ID: <31b6eb2a-31cc-efa4-fe22-e0012acdf2c3@cantab.net>
Date: Mon, 7 Mar 2022 14:21:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Bjoern Doebel <doebel@amazon.de>
Cc: Michael Kurth <mku@amazon.de>, Martin Pohlack <mpohlack@amazon.de>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1646653825.git.doebel@amazon.de>
 <deb5d86b20c02312023959bae06b0fe651a4b2f4.1646653825.git.doebel@amazon.de>
 <8315826a-c6ae-0abe-a25b-74e37080383e@suse.com>
From: David Vrabel <dvrabel@cantab.net>
In-Reply-To: <8315826a-c6ae-0abe-a25b-74e37080383e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 82.70.146.43
X-SA-Exim-Mail-From: dvrabel@cantab.net
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	pear.davidvrabel.org.uk
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no autolearn_force=no version=3.4.2
Subject: Re: [PATCH 2/2] xen/x86: Livepatch: support patching CET-enhanced
 functions
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on pear.davidvrabel.org.uk)
X-Originating-smarthost01b-IP: [82.70.146.41]
Feedback-ID: 82.70.146.41

On 07/03/2022 14:03, Jan Beulich wrote:
> On 07.03.2022 12:53, Bjoern Doebel wrote:
>> @@ -104,18 +122,36 @@ void noinline arch_livepatch_revive(void)
>>   
>>   int arch_livepatch_verify_func(const struct livepatch_func *func)
>>   {
>> +    BUILD_BUG_ON(sizeof(struct x86_livepatch_meta) != LIVEPATCH_OPAQUE_SIZE);
>> +
>>       /* If NOPing.. */
>>       if ( !func->new_addr )
>>       {
>> +        struct x86_livepatch_meta *lp;
>> +
>> +        lp = (struct x86_livepatch_meta *)func->opaque;
>>           /* Only do up to maximum amount we can put in the ->opaque. */
>> -        if ( func->new_size > sizeof(func->opaque) )
>> +        if ( func->new_size > sizeof(lp->instruction) )
>>               return -EOPNOTSUPP;
>>   
>>           if ( func->old_size < func->new_size )
>>               return -EINVAL;
>>       }
> 
> I continue to be concerned of the new local variable causing compiler
> warnings. With the adjustment made compared to v1, the specific
> warning would have changed, and we're now liable to see set-but-never-
> used ones.

Linux has a sizeof_field() macro for this sort of use.

     /**
      * sizeof_field() - Report the size of a struct field in bytes
      *
      * @TYPE: The structure containing the field of interest
      * @MEMBER: The field to return the size of
      */
     #define sizeof_field(TYPE, MEMBER) sizeof((((TYPE *)0)->MEMBER))

David

