Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DE646EA65
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 15:57:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243112.420449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvKr5-0007Zz-HA; Thu, 09 Dec 2021 14:57:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243112.420449; Thu, 09 Dec 2021 14:57:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvKr5-0007WY-Db; Thu, 09 Dec 2021 14:57:07 +0000
Received: by outflank-mailman (input) for mailman id 243112;
 Thu, 09 Dec 2021 14:57:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UPJR=Q2=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mvKr3-0006xe-IH
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 14:57:05 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44e45722-5900-11ec-9d12-4777fae47e2b;
 Thu, 09 Dec 2021 15:57:04 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:35910)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mvKr1-000MZK-6l (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 09 Dec 2021 14:57:03 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id DC9DD1FDB9;
 Thu,  9 Dec 2021 14:57:02 +0000 (GMT)
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
X-Inumbo-ID: 44e45722-5900-11ec-9d12-4777fae47e2b
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <6827208b-477d-d960-c0d6-8618eeef9635@srcf.net>
Date: Thu, 9 Dec 2021 14:57:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2] tools/libs/ctrl: Save errno only once in *PRINTF() and
 *ERROR()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: anthony.perard@citrix.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20211209134054.20757-1-jgross@suse.com>
 <a098fcae-7aaf-b5fc-79fe-acf9922e2cdb@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <a098fcae-7aaf-b5fc-79fe-acf9922e2cdb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/12/2021 14:50, Jan Beulich wrote:
> On 09.12.2021 14:40, Juergen Gross wrote:
>> All *PRINTF() and *ERROR() macros are based on xc_reportv() which is
>> saving and restoring errno in order to not modify it. There is no need
>> to save and restore in those macros, too.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> V2:
>> - style corrections (Jan Beulich)
> Thanks. Sadly there still is ...
>
>> --- a/tools/libs/ctrl/xc_private.h
>> +++ b/tools/libs/ctrl/xc_private.h
>> @@ -122,28 +122,18 @@ void xc_report_progress_step(xc_interface *xch,
>>  
>>  /* anamorphic macros:  struct xc_interface *xch  must be in scope */
>>  
>> -#define IPRINTF(_f, _a...)  do { int IPRINTF_errno = errno; \
>> -        xc_report(xch, xch->error_handler, XTL_INFO,0, _f , ## _a); \
>> -        errno = IPRINTF_errno; \
>> -        } while (0)
>> -#define DPRINTF(_f, _a...) do { int DPRINTF_errno = errno; \
>> -        xc_report(xch, xch->error_handler, XTL_DETAIL,0, _f , ## _a); \
>> -        errno = DPRINTF_errno; \
>> -        } while (0)
>> -#define DBGPRINTF(_f, _a...)  do { int DBGPRINTF_errno = errno; \
>> -        xc_report(xch, xch->error_handler, XTL_DEBUG,0, _f , ## _a); \
>> -        errno = DBGPRINTF_errno; \
>> -        } while (0)
>> -
>> -#define ERROR(_m, _a...)  do { int ERROR_errno = errno; \
>> -        xc_report_error(xch,XC_INTERNAL_ERROR,_m , ## _a ); \
>> -        errno = ERROR_errno; \
>> -        } while (0)
>> -#define PERROR(_m, _a...) do { int PERROR_errno = errno; \
>> -        xc_report_error(xch,XC_INTERNAL_ERROR,_m " (%d = %s)", \
>> -        ## _a , errno, xc_strerror(xch, errno)); \
>> -        errno = PERROR_errno; \
>> -        } while (0)
>> +#define IPRINTF(_f, _a...) \
>> +        xc_report(xch, xch->error_handler, XTL_INFO, 0, _f, ## _a)
>> +#define DPRINTF(_f, _a...) \
>> +        xc_report(xch, xch->error_handler, XTL_DETAIL, 0, _f, ## _a)
>> +#define DBGPRINTF(_f, _a...) \
>> +        xc_report(xch, xch->error_handler, XTL_DEBUG, 0, _f, ## _a)
>> +
>> +#define ERROR(_m, _a...) \
>> +        xc_report_error(xch, XC_INTERNAL_ERROR, _m, ## _a )
> ... a stray blank ahead of the closing parenthesis here; I'm sure this
> can be taken care of while committing.

Yeah - I'll fix on commit seeing as I'm doing a sweep right now.

~Andrew

