Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C642E27999B
	for <lists+xen-devel@lfdr.de>; Sat, 26 Sep 2020 15:21:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMA8Y-0006Gu-I6; Sat, 26 Sep 2020 13:21:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a+g/=DD=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kMA8X-0006Go-9z
 for xen-devel@lists.xenproject.org; Sat, 26 Sep 2020 13:21:13 +0000
X-Inumbo-ID: 667d94a5-5c70-4394-81ff-a332dec64807
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 667d94a5-5c70-4394-81ff-a332dec64807;
 Sat, 26 Sep 2020 13:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=91RvZniQ9BVTh4tgUvFdOEPxxj9Zl9s29yN2Sd6t6/Y=; b=j0MUhiHqAvNOjMSH3qt4iFDFtt
 l6gm1lPtpnNQ/47pOOY3ov1CwRfSTtirFe7YxT7S7CTi0VVIGsJ4PbWtrnB6ky/RgZViHsSeXsEyr
 9D5AfbU7BpTx7PQe8f+xsuDjRcRYR6/L0VJBCQ8Y04rkvq/8l0k21l7l8C16Wdw4zmAA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kMA8T-00076c-CQ; Sat, 26 Sep 2020 13:21:09 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kMA8T-0008DL-3x; Sat, 26 Sep 2020 13:21:09 +0000
Subject: Re: [PATCH V1 09/16] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-10-git-send-email-olekstysh@gmail.com>
 <be3401e8-db2b-82a5-b117-2c0fc8b85811@xen.org>
 <7fbab25d-18a9-83d6-2596-f0f9d149058c@gmail.com>
 <e4009c0f-1057-f031-c3bb-6b7c850a0aa1@xen.org>
 <fcb40929-9487-1d20-3990-09c79cab8df8@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <aa284c2a-c632-a446-2f14-03b22b402919@xen.org>
Date: Sat, 26 Sep 2020 14:21:07 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <fcb40929-9487-1d20-3990-09c79cab8df8@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Oleksandr,

On 24/09/2020 19:22, Oleksandr wrote:
> On 24.09.20 20:25, Julien Grall wrote:
>> On 23/09/2020 21:16, Oleksandr wrote:
>>> On 23.09.20 21:03, Julien Grall wrote:
>>>> On 10/09/2020 21:22, Oleksandr Tyshchenko wrote:
>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>> Could you please clarify how this patch could be split in smaller one?
>>
>> This patch is going to be reduced a fair bit if you make some of the 
>> structure common. The next steps would be to move anything that is not 
>> directly related to IOREQ out.
> 
> 
> Thank you for the clarification.
> Yes, however, I believed everything in this patch is directly related to 
> IOREQ...
> 
> 
>>
>>
>> From a quick look, there are few things that can be moved in separate 
>> patches:
>>    - The addition of the ASSERT_UNREACHABLE()
> 
> Did you mean the addition of the ASSERT_UNREACHABLE() to 
> arch_handle_hvm_io_completion/handle_pio can moved to separate patches?
> Sorry, I don't quite understand, for what benefit?

Sorry I didn't realize there was multiple ASSERT_UNREACHABLE() in the 
code. I was referring to the one in the follow chunk:

@@ -1955,9 +1959,14 @@ static void do_trap_stage2_abort_guest(struct 
cpu_user_regs *regs,
              case IO_HANDLED:
                  advance_pc(regs, hsr);
                  return;
+            case IO_RETRY:
+                /* finish later */
+                return;
              case IO_UNHANDLED:
                  /* IO unhandled, try another way to handle it. */
                  break;
+            default:
+                ASSERT_UNREACHABLE();
              }
          }

While I understand the reason this was added, to me this doesn't seem to 
be directly related to this patch.

In fact, the switch case will be done on an enum. So without the 
default, the compiler will be able to notice if we are adding a new 
field. With this new approach, you would only notice at runtime 
(assuming the path is exercised).

So what do we gain?

[...]

>> I think Jan made some suggestion today. Let me know if you require 
>> more input.
> 
> 
> Yes. I am considering this now. I provided my thoughts on that a little 
> bit earlier. Could you please clarify there.

I have replied to it.

Cheers,

-- 
Julien Grall

