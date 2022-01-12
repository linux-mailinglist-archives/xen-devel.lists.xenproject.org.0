Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C30B48C337
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 12:33:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256580.440447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7bsm-0005ml-Fv; Wed, 12 Jan 2022 11:33:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256580.440447; Wed, 12 Jan 2022 11:33:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7bsm-0005lK-Bq; Wed, 12 Jan 2022 11:33:36 +0000
Received: by outflank-mailman (input) for mailman id 256580;
 Wed, 12 Jan 2022 11:33:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BEGY=R4=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n7bsl-0005Ah-0Q
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 11:33:35 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 764bcac0-739b-11ec-9c70-5536b2d1e4e1;
 Wed, 12 Jan 2022 12:33:28 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:47212)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n7bsd-000vfO-9a (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 12 Jan 2022 11:33:27 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id CA57F1FD4B;
 Wed, 12 Jan 2022 11:33:27 +0000 (GMT)
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
X-Inumbo-ID: 764bcac0-739b-11ec-9c70-5536b2d1e4e1
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <0b8166db-7188-5620-15ed-02b7a0d5efa5@srcf.net>
Date: Wed, 12 Jan 2022 11:33:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 10/12] mini-os: add struct file_ops for file type
 socket
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
References: <20220111151215.22955-1-jgross@suse.com>
 <20220111151215.22955-11-jgross@suse.com>
 <659743cb-abc9-31b5-d6b2-0a21aa76bbb4@srcf.net>
 <cf84e6f4-efcb-e206-5cc0-769fe6399de5@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <cf84e6f4-efcb-e206-5cc0-769fe6399de5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/01/2022 11:32, Juergen Gross wrote:
> On 12.01.22 12:28, Andrew Cooper wrote:
>> On 11/01/2022 15:12, Juergen Gross wrote:
>>> diff --git a/lib/sys.c b/lib/sys.c
>>> index 3a8aa68..12deaed 100644
>>> --- a/lib/sys.c
>>> +++ b/lib/sys.c
>>> @@ -99,11 +99,70 @@ static struct file_ops file_ops_none = {
>>>       .name = "none",
>>>   };
>>>   +#ifdef HAVE_LWIP
>>> +static int socket_read(int fd, void *buf, size_t nbytes)
>>> +{
>>> +    return lwip_read(fd, buf, nbytes);
>>> +}
>>> +
>>> +static int socket_write(int fd, const void *buf, size_t nbytes)
>>> +{
>>> +    return lwip_write(fd, (void *)buf, nbytes);
>>> +}
>>> +
>>> +static int close_socket_fd(int fd)
>>> +{
>>> +    struct file *file = get_file_from_fd(fd);
>>> +
>>> +    return lwip_close(file->fd);
>>> +}
>>
>> Actually, on further thoughts...
>>
>>> +static struct file_ops socket_ops = {
>>> +    .name = "socket",
>>> +    .read = socket_read,
>>> +    .write = socket_write,
>>> +    .close = close_socket_fd,
>>> +    .fstat = socket_fstat,
>>> +    .fcntl = socket_fcntl,
>>> +};
>>
>> read, write and close should dispatch directly to lwip_* and not bounce
>> through a no-op local function.
>
> Not with changing the first parameter to struct file *.

Oh, good point.

>
> BTW, this patch had a bug, as the calls need to use file->fd instead of
> fd.

Yay for multiple fd spaces.

~Andrew

