Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5C42DFE1C
	for <lists+xen-devel@lfdr.de>; Mon, 21 Dec 2020 17:36:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57437.100474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krOAU-0007Zd-1v; Mon, 21 Dec 2020 16:36:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57437.100474; Mon, 21 Dec 2020 16:36:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krOAT-0007ZE-V2; Mon, 21 Dec 2020 16:36:17 +0000
Received: by outflank-mailman (input) for mailman id 57437;
 Mon, 21 Dec 2020 16:36:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DEM5=FZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1krOAS-0007Z3-CF
 for xen-devel@lists.xenproject.org; Mon, 21 Dec 2020 16:36:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e4088bee-d94e-4b6b-bac8-e0bed1959b02;
 Mon, 21 Dec 2020 16:36:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0F0BCAD2B;
 Mon, 21 Dec 2020 16:36:13 +0000 (UTC)
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
X-Inumbo-ID: e4088bee-d94e-4b6b-bac8-e0bed1959b02
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608568573; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2RfH/dqkXmgIz0W03cuMQrjz/PDs2wXT3pmXDZt+7Bc=;
	b=AZucA73VSZOl1F+v/odFdgJ6bsQN4rMePN4yKkL4686a5HBRzCspDj1h/OGIl1jbV2alCa
	A7ZeuJe371L1HijDcLoEfheMRAvJgqzSSWovQsowZA9HIiBohaa3ysGfim014Rx9avQ7Cu
	c+OsabUUQ4Mbm1vCSwRJdQbF8Cx0TB8=
Subject: Re: [PATCH v2] x86/intel: insert Ice Lake X (server) model numbers
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org,
 jun.nakajima@intel.com, kevin.tian@intel.com, xen-devel@lists.xenproject.org
References: <1603075646-24995-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d6265c58-b553-3dee-9817-1a8673472972@suse.com>
Date: Mon, 21 Dec 2020 17:36:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1603075646-24995-1-git-send-email-igor.druzhinin@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.10.2020 04:47, Igor Druzhinin wrote:
> LBR, C-state MSRs and if_pschange_mc erratum applicability should correspond
> to Ice Lake desktop according to External Design Specification vol.2.
> 
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> ---
> Changes in v2:
> - keep partial sorting
> 
> Andrew, since you have access to these documents, please review as you have time.

Coming back to this - the recent SDM update inserted at least the
model numbers, but besides 6a it also lists 6c. Judging from the
majority of additions happening in pairs, I wonder whether we
couldn't (reasonably safely) add 6c then here as well. Of course
I still can't ack the change either way with access to just the
SDM...

Jan

> --- a/xen/arch/x86/acpi/cpu_idle.c
> +++ b/xen/arch/x86/acpi/cpu_idle.c
> @@ -181,6 +181,7 @@ static void do_get_hw_residencies(void *arg)
>      case 0x55:
>      case 0x5E:
>      /* Ice Lake */
> +    case 0x6A:
>      case 0x7D:
>      case 0x7E:
>      /* Kaby Lake */
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -2427,6 +2427,7 @@ static bool __init has_if_pschange_mc(void)
>      case 0x4e: /* Skylake M */
>      case 0x5e: /* Skylake D */
>      case 0x55: /* Skylake-X / Cascade Lake */
> +    case 0x6a: /* Ice Lake-X */
>      case 0x7d: /* Ice Lake */
>      case 0x7e: /* Ice Lake */
>      case 0x8e: /* Kaby / Coffee / Whiskey Lake M */
> @@ -2775,7 +2776,7 @@ static const struct lbr_info *last_branch_msr_get(void)
>          /* Goldmont Plus */
>          case 0x7a:
>          /* Ice Lake */
> -        case 0x7d: case 0x7e:
> +        case 0x6a: case 0x7d: case 0x7e:
>          /* Tremont */
>          case 0x86:
>          /* Kaby Lake */
> 


