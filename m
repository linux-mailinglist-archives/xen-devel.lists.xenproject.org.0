Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C9C465874
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 22:40:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236231.409765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msXJe-00081F-6J; Wed, 01 Dec 2021 21:39:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236231.409765; Wed, 01 Dec 2021 21:39:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msXJe-0007yZ-1Z; Wed, 01 Dec 2021 21:39:02 +0000
Received: by outflank-mailman (input) for mailman id 236231;
 Wed, 01 Dec 2021 21:39:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fqf2=QS=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1msXJc-0007yT-7f
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 21:39:00 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15ffa05d-52ef-11ec-b1df-f38ee3fbfdf7;
 Wed, 01 Dec 2021 22:38:57 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:40266)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1msXJT-000rqI-pW (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 01 Dec 2021 21:38:51 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 985851FA8E;
 Wed,  1 Dec 2021 21:38:51 +0000 (GMT)
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
X-Inumbo-ID: 15ffa05d-52ef-11ec-b1df-f38ee3fbfdf7
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <77a6b9b4-8117-e818-e68e-af37eeec2dd7@srcf.net>
Date: Wed, 1 Dec 2021 21:38:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, Ayan Kumar Halder <ayankuma@xilinx.com>,
 andre.przywara@arm.com, Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
 xen-devel@lists.xenproject.org
References: <20211130181238.5501-1-ayankuma@xilinx.com>
 <c018e9dc-5221-a7e8-3da9-ebdb2c88311b@xen.org>
 <3caf216e-95dd-97e1-b380-a31f5388dc86@suse.com>
 <959d50ef-2a4c-8850-4a89-7eff0b649a13@xen.org>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH v2] bitops: Fix incorrect value in comment
In-Reply-To: <959d50ef-2a4c-8850-4a89-7eff0b649a13@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/12/2021 09:56, Julien Grall wrote:
> Hi,
>
> On 01/12/2021 09:38, Jan Beulich wrote:
>> On 01.12.2021 10:33, Julien Grall wrote:
>>> On 30/11/2021 18:12, Ayan Kumar Halder wrote:
>>>> --- a/xen/include/xen/bitops.h
>>>> +++ b/xen/include/xen/bitops.h
>>>> @@ -5,7 +5,7 @@
>>>>    /*
>>>>     * Create a contiguous bitmask starting at bit position @l and
>>>> ending at
>>>>     * position @h. For example
>>>> - * GENMASK(30, 21) gives us the 32bit vector 0x01fe00000.
>>>> + * GENMASK(30, 21) gives us the 32bit value 0x7fe00000.
>>>
>>> ... there are two extra changes here:
>>>     1) The bitmask is now described with 8-characters (rather than 9)
>>>     2) 'vector' is replaced with 'value'
>>>
>>> The former makes sense to me, but it is not clear to me why the latter
>>> should be changed.
>>
>> Would you mind explaining to me in which way you see "vector" accurately
>> describe the entity talked about?
>
> This can be seen as a vector of bit. I can see why people may think
> otherwise. However... if you think it doesn't describe it accurately,
> then I think this ought to be changed in Linux first (where the code
> and comment comes from).
>
>>
>> I also think the commit message is quite fine as is.
> IMHO, this is similar to when one do coding style change in a patch.
> They are unrelated but would be acceptable so long they are explained
> in the commit message.
>
> What I request is something like:
>
> "GENMASK(30, 21) should be 0x7fe00000 and only use 8-characters (it is
> a 32-bit comment). Fixed this in the comment.
>
> Take the opportunity to replace 'vector' with 'value' because..."
>
> This is simple enough and clarify what is the intent of the patch.

This is an unreasonable quantity of bikeshedding.  It's just a comment,
and a commit message of "fix the comment" is perfectly fine. 
Furthermore, the intent of the text is clear.

However, "32bit $WHATEVER" is also wrong because GENMASK() yields a
unsigned long constant.  Importantly, not 32 bits in an ARM64 build.


This trivial patch has lingered far too long.  I have committed it,
along with an adjustment.  Further bikeshedding will be redirected to
/dev/null.

~Andrew

