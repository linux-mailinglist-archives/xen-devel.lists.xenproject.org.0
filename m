Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9AC75003F
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 09:41:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562014.878567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJUT6-0001Le-Ev; Wed, 12 Jul 2023 07:41:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562014.878567; Wed, 12 Jul 2023 07:41:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJUT6-0001IT-BQ; Wed, 12 Jul 2023 07:41:00 +0000
Received: by outflank-mailman (input) for mailman id 562014;
 Wed, 12 Jul 2023 07:40:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I1v4=C6=arm.com=Peter.Hoyes@srs-se1.protection.inumbo.net>)
 id 1qJUT5-0001IM-5U
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 07:40:59 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 70ca96a5-2087-11ee-b239-6b7b168915f2;
 Wed, 12 Jul 2023 09:40:58 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7A6D2F4;
 Wed, 12 Jul 2023 00:41:39 -0700 (PDT)
Received: from [10.1.199.64] (unknown [10.1.199.64])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A16F23F67D;
 Wed, 12 Jul 2023 00:40:56 -0700 (PDT)
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
X-Inumbo-ID: 70ca96a5-2087-11ee-b239-6b7b168915f2
Message-ID: <2754aaab-922a-347d-7598-f246388ff56f@arm.com>
Date: Wed, 12 Jul 2023 08:40:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 2/2] xl: Add escape character argument to xl console
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 wei.chen@arm.com, luca.fancellu@arm.com, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
References: <20230622141248.459133-1-peter.hoyes@arm.com>
 <20230622141248.459133-2-peter.hoyes@arm.com>
 <3c1a169b-3d3b-43e5-8f90-f8c09a5ac82d@perard>
Content-Language: en-US
From: Peter Hoyes <Peter.Hoyes@arm.com>
In-Reply-To: <3c1a169b-3d3b-43e5-8f90-f8c09a5ac82d@perard>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks for the feedback.

On 10/07/2023 15:43, Anthony PERARD wrote:
> On Thu, Jun 22, 2023 at 03:12:48PM +0100, Peter Hoyes wrote:
>>   /* libxl_primary_console_exec finds the domid and console number
>>    * corresponding to the primary console of the given vm, then calls
>>    * libxl_console_exec with the right arguments (domid might be different
>> @@ -1968,9 +1969,12 @@ int libxl_console_exec(libxl_ctx *ctx, uint32_t domid, int cons_num,
>>    * guests using pygrub.
>>    * If notify_fd is not -1, xenconsole will write 0x00 to it to nofity
>>    * the caller that it has connected to the guest console.
>> + * If escape_character is not NULL, the provided value is used to exit
>> + * the guest console.
>>    */
>>   int libxl_primary_console_exec(libxl_ctx *ctx, uint32_t domid_vm,
>> -                               int notify_fd);
>> +                               int notify_fd,
>> +                               char* escape_character);
>>   
>>   #if defined(LIBXL_API_VERSION) && LIBXL_API_VERSION < 0x040800
>>   
>> diff --git a/tools/libs/light/libxl_console.c b/tools/libs/light/libxl_console.c
>> index f497be141b..0b7293fe71 100644
>> --- a/tools/libs/light/libxl_console.c
>> +++ b/tools/libs/light/libxl_console.c
>> @@ -75,15 +76,26 @@ int libxl_console_exec(libxl_ctx *ctx, uint32_t domid, int cons_num,
>>           goto out;
>>       }
>>   
>> +    char *args[] = {
>> +        p, domid_s, "--num", cons_num_s, "--type", cons_type_s,
>> +        NULL, NULL, NULL, NULL, // start-notify-fd, escape
>> +        NULL, // list terminator - do not use
>> +    };
>> +    char **args_extra = args + 6;
>> +
>>       if (notify_fd != -1) {
>>           notify_fd_s = GCSPRINTF("%d", notify_fd);
>> -        execl(p, p, domid_s, "--num", cons_num_s, "--type", cons_type_s,
>> -              "--start-notify-fd", notify_fd_s, (void *)NULL);
>> -    } else {
>> -        execl(p, p, domid_s, "--num", cons_num_s, "--type", cons_type_s,
>> -              (void *)NULL);
>> +        *args_extra++ = "--start-notify-fd";
>> +        *args_extra++ = notify_fd_s;
>>       }
>>   
>> +    if (escape_character) {
>> +        *args_extra++ = "--escape";
>> +        *args_extra++ = escape_character;
>> +    }
> There is flexarray_* that could be use, but I guess a preset `*args`
> kind of work here.
>
I looked into flexarray but didn't implement in v4 - as it stands, 
libxl_console_exec and libxl_vncviewer_exec are using the same pattern.

Peter


