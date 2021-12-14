Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7B547465F
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 16:24:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246856.425729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx9fG-0001rt-An; Tue, 14 Dec 2021 15:24:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246856.425729; Tue, 14 Dec 2021 15:24:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx9fG-0001q6-7u; Tue, 14 Dec 2021 15:24:26 +0000
Received: by outflank-mailman (input) for mailman id 246856;
 Tue, 14 Dec 2021 15:24:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C1I2=Q7=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mx9fF-0001px-LW
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 15:24:25 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eab3baf7-5cf1-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 16:24:24 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:43026)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mx9fD-0002Do-7i (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 14 Dec 2021 15:24:23 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 2A91E1FDB0;
 Tue, 14 Dec 2021 15:24:23 +0000 (GMT)
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
X-Inumbo-ID: eab3baf7-5cf1-11ec-9e60-abaf8a552007
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <f7c89a9b-cfb6-5489-c55a-419d687557a8@srcf.net>
Date: Tue, 14 Dec 2021 15:24:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] x86: drop/replace MEMORY_GUARD
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <f751205c-941a-5ce0-44a1-e8151a1a0887@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <f751205c-941a-5ce0-44a1-e8151a1a0887@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/12/2021 15:13, Jan Beulich wrote:
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -642,7 +642,7 @@ void show_stack_overflow(unsigned int cp
>  {
>      unsigned long esp = regs->rsp;
>      unsigned long curr_stack_base = esp & ~(STACK_SIZE - 1);
> -#ifdef MEMORY_GUARD
> +#ifdef CONFIG_DEBUG
>      unsigned long esp_top, esp_bottom;
>  #endif
>  
> @@ -650,7 +650,7 @@ void show_stack_overflow(unsigned int cp
>          printk("Current stack base %p differs from expected %p\n",
>                 _p(curr_stack_base), stack_base[cpu]);
>  
> -#ifdef MEMORY_GUARD
> +#ifdef CONFIG_DEBUG

Looking at these, I think we'd be better dropping the ifdef and
compiling it in unconditionally.

This is only used in the #DF path, which is a fatal error path. 
Throwing away information we trivially have to hand is actively
unhelpful to whomever is analysing the logs.

Preferably with the ifdefary dropped, Reviewed-by: Andrew Cooper
<andrew.cooper3@citrix.com>

