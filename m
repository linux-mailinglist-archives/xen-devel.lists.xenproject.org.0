Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EBC73A2E8
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 16:21:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553637.864305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCLAZ-0007QA-R7; Thu, 22 Jun 2023 14:20:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553637.864305; Thu, 22 Jun 2023 14:20:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCLAZ-0007N5-NO; Thu, 22 Jun 2023 14:20:19 +0000
Received: by outflank-mailman (input) for mailman id 553637;
 Thu, 22 Jun 2023 14:20:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CGH2=CK=arm.com=Peter.Hoyes@srs-se1.protection.inumbo.net>)
 id 1qCLAZ-0007Mz-1R
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 14:20:19 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id e9ac6119-1107-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 16:20:18 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CFA2C14;
 Thu, 22 Jun 2023 07:21:01 -0700 (PDT)
Received: from [10.1.199.64] (unknown [10.1.199.64])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C3D63F663;
 Thu, 22 Jun 2023 07:20:16 -0700 (PDT)
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
X-Inumbo-ID: e9ac6119-1107-11ee-b237-6b7b168915f2
Message-ID: <fac4045d-2f3c-7924-5e50-0c6efaf0323a@arm.com>
Date: Thu, 22 Jun 2023 15:20:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] tools/console: Add escape argument to configure
 escape character
To: Jan Beulich <jbeulich@suse.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com, luca.fancellu@arm.com,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230622135503.409150-1-peter.hoyes@arm.com>
 <7205472d-041c-d369-861e-08ccb6be9400@suse.com>
Content-Language: en-US
From: Peter Hoyes <Peter.Hoyes@arm.com>
In-Reply-To: <7205472d-041c-d369-861e-08ccb6be9400@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/06/2023 15:07, Jan Beulich wrote:
> On 22.06.2023 15:55, Peter Hoyes wrote:
>> From: Peter Hoyes <Peter.Hoyes@arm.com>
>>
>> Dom0 may be accessed via telnet, meaning the default escape character
>> (which is the same as telnet's) cannot be directly used to exit the
>> console. It would be helpful to make the escape character customizable
>> in such use cases.
>>
>> Add --escape argument to console tool for this purpose.
>>
>> Create parse_escape_character static function to convert a character
>> string (which may include a '^' modifier) into an ANSI integer.
>>
>> Add argument to getopt options, parse escape character and pass value
>> to console_loop.
>>
>> If --escape is not specified, it falls back to the existing behavior
>> using DEFAULT_ESCAPE_SEQUENCE.
>>
>> Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
>> ---
>>   tools/console/client/main.c | 17 +++++++++++++----
>>   1 file changed, 13 insertions(+), 4 deletions(-)
> Short of a cover letter, replying here: What has changed from v1? This
> then may or may not explain why Luca's R-b aren't here and in patch 2
> (anymore).
>
> Jan

Luca's R-b are in v3 - the only changes between v1 and v3 are the footers.

I'll make sure to include a cover letter and an inline changelog in 
future versions.

Thanks,

Peter


