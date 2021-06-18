Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A29D3AD08E
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 18:35:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144869.266591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luHT2-00071H-QX; Fri, 18 Jun 2021 16:35:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144869.266591; Fri, 18 Jun 2021 16:35:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luHT2-0006yr-NA; Fri, 18 Jun 2021 16:35:40 +0000
Received: by outflank-mailman (input) for mailman id 144869;
 Fri, 18 Jun 2021 16:35:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UjTI=LM=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1luHT1-0006yV-HF
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 16:35:39 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 26cbc658-a2d0-4e0d-b0c9-0688d50c9c35;
 Fri, 18 Jun 2021 16:35:38 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1624034124464510.7593830258778;
 Fri, 18 Jun 2021 09:35:24 -0700 (PDT)
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
X-Inumbo-ID: 26cbc658-a2d0-4e0d-b0c9-0688d50c9c35
ARC-Seal: i=1; a=rsa-sha256; t=1624034125; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HukGgTr7YThUCg13o8ENVb++NzuLt+JUzZ3I+kUUqwE/7+TMyXvig22rXMuljWosYScOgXR+Bsues32DOkHyPkhWT4wRpIBDqFZ3RkrwEHph6Dhxwj7sUyjRfyEzhiLOHcBxNz6/x1yJ/uLpUurSaI483scT7QzVfnv4Uyc6BHo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1624034125; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=IGVKY4qQeOEt4A6vIiT7QkQMNAdGzI6LenF3GB37rkQ=; 
	b=jrSt+19BF2S+bculTFGSiA8SdpJcY/Ipm6RZ53Me1cSuLKKnU6H8FuPn+fsDS9TFT1UwnnmSeCStcqudofg893SUzvhZiaydcZn/gn5DBq78aF/lHyrslqUyxXIWETt1rt4esPz6XyugGEKtA06/kx9zCf/9gzOrJslnANp7xV8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1624034125;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=IGVKY4qQeOEt4A6vIiT7QkQMNAdGzI6LenF3GB37rkQ=;
	b=vYCU5t76s1bLKPzrnvPFjATVRPH2kUnl1EQZ92gz8ipuqBsQxXTsSAslJjeoOIDN
	SNU83JN28hoRvCr2lw85Z/F6K+hERaVty32pw/Qxf6kx7YshcWUqu3UgRx6jiyizdZ7
	YafAqLOdnFAd9xrm6A89MxBqU2kO/cKfWxhdWDC0=
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Tim Deegan <tim@xen.org>,
 Juergen Gross <jgross@suse.com>, Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Dario Faggioli <dfaggioli@suse.com>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, persaur@gmail.com,
 christopher.w.clark@gmail.com, adam.schwalm@starlab.io,
 scott.davis@starlab.io
References: <20210617233918.10095-1-dpsmith@apertussolutions.com>
 <20210617233918.10095-4-dpsmith@apertussolutions.com>
 <a8d60866-b9d9-8a76-3acc-703799b204b6@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 3/6] xsm: enabling xsm to always be included
Message-ID: <3df8648d-f706-9684-4e6d-9438dc9f0894@apertussolutions.com>
Date: Fri, 18 Jun 2021 12:35:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <a8d60866-b9d9-8a76-3acc-703799b204b6@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 6/18/21 7:53 AM, Andrew Cooper wrote:
> On 18/06/2021 00:39, Daniel P. Smith wrote:
>> The only difference between !CONFIG_XSM and CONFIG_XSM with !CONFIG_XSM_SILO and !CONFIG_XSM_FLASK
>> is whether the XSM hooks in dummy.h are called as static inline functions or as function
>> pointers to static functions. As such this commit,
>>  * eliminates CONFIG_XSM
>>  * introduces CONFIG_XSM_EVTCHN_LABELING as replacement for enabling event channel labels
>>  * makes CONFIG_XSM_SILO AND CONFIG_XSM_FLASK default to no
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>  xen/common/Kconfig            |  55 ++++-----
>>  xen/include/xen/sched.h       |   2 +-
>>  xen/include/xsm/xsm-core.h    |  26 ----
>>  xen/include/xsm/xsm.h         |   8 --
>>  xen/xsm/Makefile              |   4 +-
>>  xen/xsm/dummy.c               |   4 +-
>>  xen/{include => }/xsm/dummy.h | 220 ++++++++++++++++------------------
>>  xen/xsm/silo.c                |  17 +--
>>  xen/xsm/xsm_core.c            |   4 -
>>  9 files changed, 142 insertions(+), 198 deletions(-)
>>  rename xen/{include => }/xsm/dummy.h (63%)
>>
>> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
>> index 0ddd18e11a..203ad7ea23 100644
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -197,22 +197,33 @@ config XENOPROF
>>  
>>  	  If unsure, say Y.
>>  
>> -config XSM
>> -	bool "Xen Security Modules support"
>> -	default ARM
>> -	---help---
>> -	  Enables the security framework known as Xen Security Modules which
>> -	  allows administrators fine-grained control over a Xen domain and
>> -	  its capabilities by defining permissible interactions between domains,
>> -	  the hypervisor itself, and related resources such as memory and
>> -	  devices.
>> +menu "Xen Security Modules"
>>  
>> -	  If unsure, say N.
>> +choice
>> +	prompt "Default XSM module"
>> +	default XSM_SILO_DEFAULT if XSM_SILO && ARM
>> +	default XSM_FLASK_DEFAULT if XSM_FLASK
>> +	default XSM_SILO_DEFAULT if XSM_SILO
>> +	default XSM_DUMMY_DEFAULT
>> +	config XSM_DUMMY_DEFAULT
>> +		bool "Match non-XSM behavior"
> 
> There is no non-XSM behaviour any more.
> 
> Is it time to rename Dummy to "traditional dom0-all-powerful" or

Well, I left as dummy since that is what it has been known by thus far
and additionally the subsequent patch set was going to rename this to
XSM_ROLES/"XSM Role-based Access Control" For the intermediate time, I
can change the wording to reflect the correct state.

>> +	config XSM_FLASK_DEFAULT
>> +		bool "FLux Advanced Security Kernel" if XSM_FLASK
>> +	config XSM_SILO_DEFAULT
>> +		bool "SILO" if XSM_SILO
>> +endchoice
>> +
>> +config XSM_EVTCHN_LABELING
>> +	bool "Enables security labeling of event channels"
>> +	default n
>> +	---help---
>> +      This enables an XSM module to label and enforce access control over
>> +      event channels.
> 
> Please use help rather than ---help--- for new options (its changed in
> upstream Kconfig).  The indentation of the help message wants to be one
> tab, then two spaces.  (Yes, sadly...)

ack

>>  config XSM_FLASK
>> -	def_bool y
>> +	def_bool n
>>  	prompt "FLux Advanced Security Kernel support"
>> -	depends on XSM
>> +	select XSM_EVTCHN_LABELING
>>  	---help---
>>  	  Enables FLASK (FLux Advanced Security Kernel) as the access control
>>  	  mechanism used by the XSM framework.  This provides a mandatory access
>> @@ -250,9 +261,8 @@ config XSM_FLASK_POLICY
>>  	  If unsure, say Y.
>>  
>>  config XSM_SILO
>> -	def_bool y
>> +	def_bool n
> 
> I'm not sure we want to alter the FLASK/SILO defaults.  SILO in
> particular is mandatory on ARM, and without it, you're in a security
> unsupported configuration.
The intent here is the default is the classic dom0 configuration. What
if I did,

def bool n
def bool y if ARM

v/r
dps


