Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B652810E7
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 13:05:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1911.5762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOIsS-0000fV-Tc; Fri, 02 Oct 2020 11:05:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1911.5762; Fri, 02 Oct 2020 11:05:28 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOIsS-0000f7-Pp; Fri, 02 Oct 2020 11:05:28 +0000
Received: by outflank-mailman (input) for mailman id 1911;
 Fri, 02 Oct 2020 11:05:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iJBK=DJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kOIsR-0000f1-8T
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 11:05:27 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf28328b-1d65-45d5-a35b-fd764b9abca8;
 Fri, 02 Oct 2020 11:05:26 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=iJBK=DJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kOIsR-0000f1-8T
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 11:05:27 +0000
X-Inumbo-ID: bf28328b-1d65-45d5-a35b-fd764b9abca8
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id bf28328b-1d65-45d5-a35b-fd764b9abca8;
	Fri, 02 Oct 2020 11:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601636726;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=LlGMt2gR70LijQzCMasO19ZCOl1CsAHLpIhOPQuW0eM=;
  b=FRJUVZqMI1DccePmoMYy0qUx2/CsuAaswHaUeT7sDz3QUntYri+2u6cp
   jLEPGW13ojGVdDQuVI7wFq9H2w9pGoe93rvc8pr2HCpaAXiS1CWGt5nPS
   PhiLtxShW60aynAC0k2SYS4IDIyePDiBnswx9TniZK7WaXdg6SYWc/kK8
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ZzOvdlpDCPo1BFRgQe3Ch+tkC/gsBLxEDueoj12E3vfP/UWVt7mBYJZsdn+w92KwRnW9eq+7TW
 NYZTNTkR3H5W1lA1voZwKdTBNVKOEVTfB+zQfw5FCewF5Oul66e6iCZsNBrrCjYAt02jKkHfBJ
 nGdGgh5pV4Ving88bGNxtSTrfHuKGeGft3jk6j5uh3b20m+kL50bgJIL0aTUzJ9S0wnAOoHADJ
 Yxo1zRgs9fTaxjZaylrs61LMSu5xq2PxeZgJTgfz3Lms4WPBYBCpj6Kp1aqYExfZN68XhOHbXP
 0Ew=
X-SBRS: None
X-MesageID: 28240433
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,327,1596513600"; 
   d="scan'208";a="28240433"
Subject: Re: [PATCH v3] tools/libs/stat: fix broken build
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20200912130836.11024-1-jgross@suse.com>
 <5232FD74-9636-4EF4-81F8-2EF7EE21D326@arm.com>
 <87CA2B55-B372-458C-82CC-2423B8AC3EEE@arm.com>
 <f12092a1-119f-ce68-8804-1a8772f1a923@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <06775f15-da14-c4eb-7076-8ebe8d964339@citrix.com>
Date: Fri, 2 Oct 2020 12:05:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f12092a1-119f-ce68-8804-1a8772f1a923@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 02/10/2020 05:50, Jürgen Groß wrote:
> On 01.10.20 18:38, Bertrand Marquis wrote:
>> Hi Juergen,
>>
>>> On 14 Sep 2020, at 11:58, Bertrand Marquis
>>> <bertrand.marquis@arm.com> wrote:
>>>
>>>
>>>
>>>> On 12 Sep 2020, at 14:08, Juergen Gross <jgross@suse.com> wrote:
>>>>
>>>> Making getBridge() static triggered a build error with some gcc
>>>> versions:
>>>>
>>>> error: 'strncpy' output may be truncated copying 15 bytes from a
>>>> string of
>>>> length 255 [-Werror=stringop-truncation]
>>>>
>>>> Fix that by using a buffer with 256 bytes instead.
>>>>
>>>> Fixes: 6d0ec053907794 ("tools: split libxenstat into new
>>>> tools/libs/stat directory")
>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>
>> Sorry i have to come back on this one.
>>
>> I still see an error compiling with Yocto on this one:
>> |     inlined from 'xenstat_collect_networks' at xenstat_linux.c:306:2:
>> | xenstat_linux.c:81:6: error: 'strncpy' output may be truncated
>> copying 255 bytes from a string of length 255
>> [-Werror=stringop-truncation]
>> |    81 |      strncpy(result, de->d_name, resultLen);
>> |       |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> To solve it, I need to define devBridge[257] as devNoBrideg.
>
> IMHO this is a real compiler error.
>
> de->d_name is an array of 256 bytes, so doing strncpy() from that to
> another array of 256 bytes with a length of 256 won't truncate anything.
>
> Making devBridge one byte longer would be dangerous, as this would do
> a strncpy with length of 257 from a source with a length of 256 bytes
> only.
>
> BTW, I think Andrew? has tested my patch with a recent gcc which threw
> the original error without my patch, and it was fine with the patch.
> Either your compiler (assuming you are using gcc) has gained that error
> or you are missing an update fixing it.

All I was doing was using the gitlab CI, and reporting the failing tests.

~Andrew

