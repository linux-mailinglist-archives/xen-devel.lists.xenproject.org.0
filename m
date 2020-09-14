Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5DC268AB8
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 14:16:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHnPG-0007zm-8D; Mon, 14 Sep 2020 12:16:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kHnPE-0007zd-Hi
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 12:16:24 +0000
X-Inumbo-ID: 2a676938-bd89-41b8-b0da-2261c0b45629
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a676938-bd89-41b8-b0da-2261c0b45629;
 Mon, 14 Sep 2020 12:16:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 79ECCAC79;
 Mon, 14 Sep 2020 12:16:38 +0000 (UTC)
Subject: Re: [PATCH v3 4/4] efi: Do not use command line if secure boot is
 enabled.
To: Trammell Hudson <hudson@trmm.net>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20200907190027.669086-1-hudson@trmm.net>
 <20200907190027.669086-5-hudson@trmm.net> <20200914102450.GD753@Air-de-Roger>
 <fbcs49Ps8wnxc2ZwN9e7ptr8gwGxRSVEg6J58A8W84wo2RYwkSUS0bhHeocFpGVXsd4YWDL72FkYOHeye8VzWmy_EUyHKMNeBnAzspklDls=@trmm.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <deab1428-c329-b1e5-aa92-866887836f8e@suse.com>
Date: Mon, 14 Sep 2020 14:16:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <fbcs49Ps8wnxc2ZwN9e7ptr8gwGxRSVEg6J58A8W84wo2RYwkSUS0bhHeocFpGVXsd4YWDL72FkYOHeye8VzWmy_EUyHKMNeBnAzspklDls=@trmm.net>
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

On 14.09.2020 13:36, Trammell Hudson wrote:
> On Monday, September 14, 2020 6:24 AM, Roger Pau Monné <roger.pau@citrix.com> wrote:
>> On Mon, Sep 07, 2020 at 03:00:27PM -0400, Trammell Hudson wrote:
>> [...]
>>> -   static const __initconst EFI_GUID global_guid = EFI_GLOBAL_VARIABLE;
>>> -   uint8_t secboot, setupmode;
>>> -   UINTN secboot_size = sizeof(secboot);
>>> -   UINTN setupmode_size = sizeof(setupmode);
>>> -
>>> -   if ( efi_rs->GetVariable(L"SecureBoot", (EFI_GUID *)&global_guid, NULL, &secboot_size, &secboot) != EFI_SUCCESS )
>>
>> I'm slightly worried about the dropping of the const here, and the
>> fact that the variable is placed in initconst section. Isn't it
>> dangerous that the EFI services will try to write to it?
> 
> The EFI services do not try to write to it; the API doesn't
> even bother with const-correctness.  The prototype has IN
> and OUT, but they are not used for constness:
> 
> typedef EFI_STATUS(EFIAPI * EFI_GET_VARIABLE) (
> IN CHAR16 *VariableName,
> IN EFI_GUID *VendorGuid,
> OUT UINT32 *Attributes,
> OPTIONAL IN OUT UINTN *DataSize,
> OUT VOID *Data OPTIONAL)

And I think this underlying aspect if the reason for a lot of apparently
missing const in our EFI interfacing code.

Jan

