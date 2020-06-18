Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7BF1FF70B
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 17:39:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlwdP-0007tJ-CZ; Thu, 18 Jun 2020 15:39:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fT7M=77=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jlwdO-0007tD-9K
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 15:39:22 +0000
X-Inumbo-ID: e0eab95e-b179-11ea-baae-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0eab95e-b179-11ea-baae-12813bfff9fa;
 Thu, 18 Jun 2020 15:39:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C7785ADC8;
 Thu, 18 Jun 2020 15:39:19 +0000 (UTC)
Subject: Re: [PATCH v1 4/7] x86/vmx: add do_vmtrace_op
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <34833328.8766172.1592320926648.JavaMail.zimbra@cert.pl>
 <20200616172352.GT735@Air-de-Roger>
 <1599209169.9756264.1592493912556.JavaMail.zimbra@cert.pl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e2e873a3-6050-d4bf-f74c-ba31d7eef2f0@suse.com>
Date: Thu, 18 Jun 2020 17:39:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1599209169.9756264.1592493912556.JavaMail.zimbra@cert.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18.06.2020 17:25, Michał Leszczyński wrote:
> ----- 16 cze 2020 o 19:23, Roger Pau Monné roger.pau@citrix.com napisał(a):
>> On Tue, Jun 16, 2020 at 05:22:06PM +0200, Michał Leszczyński wrote:
>>> --- a/xen/include/public/hvm/hvm_op.h
>>> +++ b/xen/include/public/hvm/hvm_op.h
>>> @@ -382,6 +382,33 @@ struct xen_hvm_altp2m_op {
>>>  typedef struct xen_hvm_altp2m_op xen_hvm_altp2m_op_t;
>>>  DEFINE_XEN_GUEST_HANDLE(xen_hvm_altp2m_op_t);
>>>  
>>> +/* HVMOP_vmtrace: Perform VM tracing related operation */
>>> +#define HVMOP_vmtrace 26
>>> +
>>> +#define HVMOP_VMTRACE_INTERFACE_VERSION 0x00000001
>>> +
>>> +struct xen_hvm_vmtrace_op {
>>> +    /* IN variable */
>>> +    uint32_t version;   /* HVMOP_VMTRACE_INTERFACE_VERSION */
>>> +    uint32_t cmd;
>>> +/* Enable/disable external vmtrace for given domain */
>>> +#define HVMOP_vmtrace_ipt_enable      1
>>> +#define HVMOP_vmtrace_ipt_disable     2
>>> +#define HVMOP_vmtrace_ipt_get_buf     3
>>> +#define HVMOP_vmtrace_ipt_get_offset  4
>>> +    domid_t domain;
>>
>> You are missing a padding field here AFAICT.
> 
> 
> Could you point out what is the purpose of this padding field and what should be the size in this case? It's pretty unclear to me.

In the public interface we aim at making all padding explicit.

Also, as a general remark: Please trim your replies.

Jan

