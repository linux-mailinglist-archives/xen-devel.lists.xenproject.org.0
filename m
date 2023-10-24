Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7500E7D54AA
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 17:05:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622097.969291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvIyB-00086Q-0S; Tue, 24 Oct 2023 15:05:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622097.969291; Tue, 24 Oct 2023 15:05:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvIyA-00084C-Sq; Tue, 24 Oct 2023 15:05:22 +0000
Received: by outflank-mailman (input) for mailman id 622097;
 Tue, 24 Oct 2023 15:05:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9CvU=GG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qvIy9-00082w-Vd
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 15:05:21 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bff30229-727e-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 17:05:20 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 823A14EE0742;
 Tue, 24 Oct 2023 17:05:20 +0200 (CEST)
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
X-Inumbo-ID: bff30229-727e-11ee-98d5-6d05b1d4d9a1
MIME-Version: 1.0
Date: Tue, 24 Oct 2023 17:05:20 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [RFC 2/4] x86/shutdown: address MISRA C:2012 Rule 9.3
In-Reply-To: <71bcda90-0351-9487-5b68-89718146bb9a@suse.com>
References: <cover.1698155925.git.nicola.vetrini@bugseng.com>
 <b4781f1a558a32747f1aca53b6da50a2d4b61f1e.1698155925.git.nicola.vetrini@bugseng.com>
 <71bcda90-0351-9487-5b68-89718146bb9a@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <9b7c945c11b7c4adde0a4c8aabf6112f@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 24/10/2023 16:56, Jan Beulich wrote:
> On 24.10.2023 16:31, Nicola Vetrini wrote:
>> @@ -225,8 +225,8 @@ static const struct dmi_system_id __initconstrel 
>> reboot_dmi_table[] = {
>>          .ident = "Dell OptiPlex 745",
>>          .matches = {
>>              DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>> -            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 745"),
>> -            DMI_MATCH(DMI_BOARD_NAME, "0MM599"),
>> +            [0] = DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 745"),
>> +            [1] = DMI_MATCH(DMI_BOARD_NAME, "0MM599")
>>          },
>>      },
>>      {    /* Handle problems with rebooting on Dell Optiplex 745 with 
>> 0KW626 */
>> @@ -235,8 +235,8 @@ static const struct dmi_system_id __initconstrel 
>> reboot_dmi_table[] = {
>>          .ident = "Dell OptiPlex 745",
>>          .matches = {
>>              DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>> -            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 745"),
>> -            DMI_MATCH(DMI_BOARD_NAME, "0KW626"),
>> +            [0] = DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 745"),
>> +            [1] = DMI_MATCH(DMI_BOARD_NAME, "0KW626")
>>          },
>>      },
>>      {    /* Handle problems with rebooting on Dell Optiplex 330 with 
>> 0KP561 */
>> @@ -245,8 +245,8 @@ static const struct dmi_system_id __initconstrel 
>> reboot_dmi_table[] = {
>>          .ident = "Dell OptiPlex 330",
>>          .matches = {
>>              DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>> -            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 330"),
>> -            DMI_MATCH(DMI_BOARD_NAME, "0KP561"),
>> +            [0] = DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 330"),
>> +            [1] = DMI_MATCH(DMI_BOARD_NAME, "0KP561")
>>          },
>>      },
>>      {    /* Handle problems with rebooting on Dell Optiplex 360 with 
>> 0T656F */
>> @@ -255,8 +255,8 @@ static const struct dmi_system_id __initconstrel 
>> reboot_dmi_table[] = {
>>          .ident = "Dell OptiPlex 360",
>>          .matches = {
>>              DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>> -            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 360"),
>> -            DMI_MATCH(DMI_BOARD_NAME, "0T656F"),
>> +            [0] = DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 360"),
>> +            [1] = DMI_MATCH(DMI_BOARD_NAME, "0T656F")
>>          },
>>      },
>>      {    /* Handle problems with rebooting on Dell OptiPlex 760 with 
>> 0G919G */
>> @@ -265,8 +265,8 @@ static const struct dmi_system_id __initconstrel 
>> reboot_dmi_table[] = {
>>          .ident = "Dell OptiPlex 760",
>>          .matches = {
>>              DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>> -            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 760"),
>> -            DMI_MATCH(DMI_BOARD_NAME, "0G919G"),
>> +            [0] = DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 760"),
>> +            [1] = DMI_MATCH(DMI_BOARD_NAME, "0G919G")
>>          },
>>      },
>>      {    /* Handle problems with rebooting on Dell 2400's */
> 
> Well, no, this is what absolutely should not happen: You're breaking
> the code here, but initializing slot 0 twice in multiple instances.
> From looking just at the patch I probably wouldn't have noticed, but
> the "always elements 0 and 1 only" pattern made me "grep -lr", where
> the issue became apparent. Otherwise I was about to suggest we shrink
> array size to just 2 elements.
> 
> Jan

Right, that was a shortcoming of my regex.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

