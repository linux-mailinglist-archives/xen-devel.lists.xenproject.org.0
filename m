Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 078AD26C0FE
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 11:49:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIU2b-0008Po-2q; Wed, 16 Sep 2020 09:47:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ruU0=CZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kIU2a-0008Pj-CX
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 09:47:52 +0000
X-Inumbo-ID: 46c93bec-3f31-4ea5-81d0-b6d9caf56388
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 46c93bec-3f31-4ea5-81d0-b6d9caf56388;
 Wed, 16 Sep 2020 09:47:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1B29BAED9;
 Wed, 16 Sep 2020 09:48:06 +0000 (UTC)
Subject: Re: [PATCH v4 3/4] efi: Enable booting unified
 hypervisor/kernel/initrd images
To: Trammell Hudson <hudson@trmm.net>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "wl@xen.org" <wl@xen.org>
References: <20200914115013.814079-1-hudson@trmm.net>
 <20200914115013.814079-4-hudson@trmm.net> <20200916073209.GR753@Air-de-Roger>
 <vJMfvKtNZyMgJ7EsE4gKz79cATC-4xxU3hrAkz1PlvmArEQJ_jcXR61uiCggcKjISspFs2h4CrL1M9uLGM1kI25UmudG9YueJY1af6VPDmY=@trmm.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d2687ae0-963b-4d8a-f17a-eabd9945df4b@suse.com>
Date: Wed, 16 Sep 2020 11:47:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <vJMfvKtNZyMgJ7EsE4gKz79cATC-4xxU3hrAkz1PlvmArEQJ_jcXR61uiCggcKjISspFs2h4CrL1M9uLGM1kI25UmudG9YueJY1af6VPDmY=@trmm.net>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16.09.2020 10:37, Trammell Hudson wrote:
> On Wednesday, September 16, 2020 3:32 AM, Roger Pau Monné <roger.pau@citrix.com> wrote:
>> On Mon, Sep 14, 2020 at 07:50:12AM -0400, Trammell Hudson wrote:
>>> -   s2w(&name_string);
>>
>> Don't you need to check that s2w succeed, so that name_string.w is not
>> a random pointer from stack garbage?
> 
> Maybe? I don't see anywhere else in the code that s2w() is
> ever checked for a NULL return. Perhaps a better fix would
> be to modify the function to panic if it is unable
> to allocate.

In current code the result of s2w() gets exclusively passed to
read_file(), where first thing we have

    if ( !name )
        PrintErrMesg(L"No filename", EFI_OUT_OF_RESOURCES);

Jan

