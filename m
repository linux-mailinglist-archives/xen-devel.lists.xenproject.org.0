Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 521AA48B7EF
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 21:14:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256087.439275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7NXF-0006J0-Kz; Tue, 11 Jan 2022 20:14:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256087.439275; Tue, 11 Jan 2022 20:14:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7NXF-0006Gy-H8; Tue, 11 Jan 2022 20:14:25 +0000
Received: by outflank-mailman (input) for mailman id 256087;
 Tue, 11 Jan 2022 20:14:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JwWh=R3=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n7NXE-0006Es-2q
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 20:14:24 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fe8785f-731b-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 21:14:22 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:47592)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n7NXA-000nKA-iW (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 11 Jan 2022 20:14:20 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 9404F1FBFC;
 Tue, 11 Jan 2022 20:14:20 +0000 (GMT)
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
X-Inumbo-ID: 0fe8785f-731b-11ec-9ce5-af14b9085ebd
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <9ff34b30-02ef-9a4f-13e0-d094c87b613f@srcf.net>
Date: Tue, 11 Jan 2022 20:14:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 03/12] mini-os: use alloc_file_type() and
 get_file_from_fd() in xs
Content-Language: en-GB
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org, wl@xen.org
References: <20220111151215.22955-1-jgross@suse.com>
 <20220111151215.22955-4-jgross@suse.com>
 <20220111200615.b5tpi4faz3cak2ft@begin>
 <20220111201136.yqp274wyqju5zshs@begin>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <20220111201136.yqp274wyqju5zshs@begin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/01/2022 20:11, Samuel Thibault wrote:
> Samuel Thibault, le mar. 11 janv. 2022 21:06:15 +0100, a ecrit:
>> Juergen Gross, le mar. 11 janv. 2022 16:12:06 +0100, a ecrit:
>>> diff --git a/lib/xs.c b/lib/xs.c
>>> index 4af0f96..ac830d2 100644
>>> --- a/lib/xs.c
>>> +++ b/lib/xs.c
>>> @@ -18,23 +18,55 @@ static inline int _xs_fileno(struct xs_handle *h) {
>>>      return (intptr_t) h;
>>>  }
>>>  
>>> +static int xs_close_fd(int fd)
>>> +{
>>> +    struct xenbus_event *event, *next;
>>> +    struct file *file = get_file_from_fd(fd);
> This...
>
>>> +    for (event = file->dev; event; event = next)
>>> +    {
>>> +        next = event->next;
>>> +        free(event);
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static bool xs_can_read(int fd)
>>> +{
>>> +    struct file *file = get_file_from_fd(fd);
> ... and that would be simplified by directly getting the file* from the
> parameters.

I actually make exactly the same suggestion for close() in
libxenevtchn.  The callback hooks don't need the same API as the libc
functions.

~Andrew

