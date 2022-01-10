Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C557489FA0
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 19:52:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255535.437907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6zlC-0006co-Qm; Mon, 10 Jan 2022 18:51:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255535.437907; Mon, 10 Jan 2022 18:51:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6zlC-0006aw-NU; Mon, 10 Jan 2022 18:51:14 +0000
Received: by outflank-mailman (input) for mailman id 255535;
 Mon, 10 Jan 2022 18:51:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RiBW=R2=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n6zlB-0006aq-6q
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 18:51:13 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47120db5-7246-11ec-81c1-a30af7de8005;
 Mon, 10 Jan 2022 19:51:11 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:50462)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n6zl8-000kzx-nm (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 10 Jan 2022 18:51:10 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 3E9D81FBFC;
 Mon, 10 Jan 2022 18:51:10 +0000 (GMT)
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
X-Inumbo-ID: 47120db5-7246-11ec-81c1-a30af7de8005
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <6df1ee3f-c14c-8016-397e-0ed12b9e3a82@srcf.net>
Date: Mon, 10 Jan 2022 18:51:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20220107103544.9271-1-jgross@suse.com>
 <20220107103544.9271-2-jgross@suse.com>
 <06bcb18f-5e85-0fc1-86e8-857cb296645f@srcf.net>
 <afa9ce9e-e85d-3886-98db-1e99203c9c89@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 1/2] tools/libs/evtchn: decouple more from mini-os
In-Reply-To: <afa9ce9e-e85d-3886-98db-1e99203c9c89@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/01/2022 12:49, Juergen Gross wrote:
> On 10.01.22 13:25, Andrew Cooper wrote:
>> On 07/01/2022 10:35, Juergen Gross wrote:
>>> @@ -75,12 +86,25 @@ static void port_dealloc(struct evtchn_port_info
>>> *port_info)
>>>    */
>>>   int osdep_evtchn_open(xenevtchn_handle *xce, unsigned int flags)
>>>   {
>>> -    int fd = alloc_fd(FTYPE_EVTCHN);
>>> +    int fd;
>>> +    struct file *file;
>>> +    struct port_list *list;
>>> +
>>> +    list = malloc(sizeof(*list));
>>> +    if ( !list )
>>> +        return -1;
>>> +
>>> +    fd = alloc_fd(FTYPE_EVTCHN);
>>> +    file = get_file_from_fd(fd);
>>>   -    if ( fd == -1 )
>>> +    if ( !file )
>>> +    {
>>> +        free(list);
>>>           return -1;
>>> +    }
>>
>> This wants rearranging to keep alloc_fd() ahead of malloc().  With that,
>> there is no need for free(list) in this error path.
>
> Yeah, but the error path of malloc() having failed is quite nasty then.

Oh yeah.  This is ugly, but I guess it is better this way around.

~Andrew

