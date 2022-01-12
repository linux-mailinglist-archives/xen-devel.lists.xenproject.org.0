Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7275E48BFBE
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 09:20:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256367.439874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7YrL-0000rV-6h; Wed, 12 Jan 2022 08:19:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256367.439874; Wed, 12 Jan 2022 08:19:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7YrL-0000pf-3W; Wed, 12 Jan 2022 08:19:55 +0000
Received: by outflank-mailman (input) for mailman id 256367;
 Wed, 12 Jan 2022 08:19:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BEGY=R4=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n7YrK-0000pP-8y
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 08:19:54 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6aad2ea2-7380-11ec-9ce5-af14b9085ebd;
 Wed, 12 Jan 2022 09:19:52 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:48190)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n7YrI-0010Q3-0w (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 12 Jan 2022 08:19:52 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 196A91FCF3;
 Wed, 12 Jan 2022 08:19:52 +0000 (GMT)
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
X-Inumbo-ID: 6aad2ea2-7380-11ec-9ce5-af14b9085ebd
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <559223b1-68c1-87fb-7b7b-190f8671b4c2@srcf.net>
Date: Wed, 12 Jan 2022 08:19:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 17/18] mini-os: use function vectors instead of switch
 for file operations
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
References: <20220111145817.22170-1-jgross@suse.com>
 <20220111145817.22170-18-jgross@suse.com>
 <a2d4c905-c477-8553-85a7-90168d914b6e@srcf.net>
 <08672989-53be-1551-f001-0d2c0435b586@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <08672989-53be-1551-f001-0d2c0435b586@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/01/2022 07:34, Juergen Gross wrote:
> On 11.01.22 19:08, Andrew Cooper wrote:
>> On 11/01/2022 14:58, Juergen Gross wrote:
>>> +
>>> +off_t lseek_default(int fd, off_t offset, int whence);
>>> +bool select_yes(int fd);
>>> +bool select_read_flag(int fd);
>>> +
>>>   LIST_HEAD(evtchn_port_list, evtchn_port_info);
>>>     struct evtchn_port_info {
>>> @@ -183,7 +210,7 @@ struct evtchn_port_info {
>>>   };
>>>     struct file {
>>> -    enum fd_type type;
>>> +    unsigned int type;
>>>       bool read;    /* maybe available for read */
>>>       off_t offset;
>>>       union {
>>> @@ -199,7 +226,7 @@ struct file {
>>>   extern struct file files[];
>>>     struct file *get_file_from_fd(int fd);
>>> -int alloc_fd(enum fd_type type);
>>> +int alloc_fd(unsigned int type);
>>>   void close_all_files(void);
>>>   extern struct thread *main_thread;
>>>   void sparse(unsigned long data, size_t size);
>>> diff --git a/lib/sys.c b/lib/sys.c
>>> index 323a7cd..c327247 100644
>>> --- a/lib/sys.c
>>> +++ b/lib/sys.c
>>> @@ -98,6 +98,39 @@ struct file files[NOFILE] = {
>>>       { .type = FTYPE_CONSOLE }, /* stderr */
>>>   };
>>>   +static struct file_ops file_ops_none = {
>>> +    .name = "none",
>>> +};
>>> +
>>> +static struct file_ops *file_ops[FTYPE_N + FTYPE_SPARE] = {
>>> +    [FTYPE_NONE] = &file_ops_none,
>>> +};
>>
>> Both want to be const, because all file_ops ought to live in rodata.
>
> file_ops[] can't be const, it will just point to const data.

Oh, of course.

>>> @@ -709,6 +805,18 @@ static void dump_pollfds(struct pollfd *pfd,
>>> int nfds, int timeout)
>>>   #define dump_pollfds(pfds, nfds, timeout)
>>>   #endif
>>>   +bool select_yes(int fd)
>>> +{
>>> +    return true;
>>> +}
>>> +
>>> +bool select_read_flag(int fd)
>>> +{
>>> +    struct file *file = get_file_from_fd(fd);
>>> +
>>> +    return file->read;
>>> +}
>>
>> I don't see these getting used, even in a fallback case.
>
> They will be used in later patches.

Yeah - I found them in later patches.  It's probably worth a note in the
commit message saying "provide some functions useful for file_ops in
future patches", particularly as it's actually a later series which
takes them (due to the ordering constraints).

~Andrew

