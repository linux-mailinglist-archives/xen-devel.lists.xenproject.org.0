Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C377D82AF
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 14:32:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623781.971953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvzWw-0001TP-89; Thu, 26 Oct 2023 12:32:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623781.971953; Thu, 26 Oct 2023 12:32:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvzWw-0001Qx-4e; Thu, 26 Oct 2023 12:32:06 +0000
Received: by outflank-mailman (input) for mailman id 623781;
 Thu, 26 Oct 2023 12:32:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VqC+=GI=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qvzWu-0001PT-3p
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 12:32:04 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa8eb622-73fb-11ee-98d5-6d05b1d4d9a1;
 Thu, 26 Oct 2023 14:32:03 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id BA2784EE0742;
 Thu, 26 Oct 2023 14:32:02 +0200 (CEST)
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
X-Inumbo-ID: aa8eb622-73fb-11ee-98d5-6d05b1d4d9a1
MIME-Version: 1.0
Date: Thu, 26 Oct 2023 14:32:02 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [RFC 1/4] x86/ioemul: address MISRA C:2012 Rule 9.3
In-Reply-To: <41562c7a-6260-3104-b2d4-d6fd4df0cffc@suse.com>
References: <cover.1698155925.git.nicola.vetrini@bugseng.com>
 <76c9f78179a8bb5b4f99b34f163933394f79066c.1698155925.git.nicola.vetrini@bugseng.com>
 <60e26ad6-7366-2604-e9b2-ed401cee6e73@suse.com>
 <alpine.DEB.2.22.394.2310241317030.271731@ubuntu-linux-20-04-desktop>
 <41562c7a-6260-3104-b2d4-d6fd4df0cffc@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <4e88d7ab94b9fc73554eee5b78612b63@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 25/10/2023 09:56, Jan Beulich wrote:
> On 24.10.2023 22:27, Stefano Stabellini wrote:
>> On Tue, 24 Oct 2023, Jan Beulich wrote:
>>> On 24.10.2023 16:31, Nicola Vetrini wrote:
>>>> Partially explicitly initalized .matches arrays result in violations
>>>> of Rule 9.3; this is resolved by using designated initializers,
>>>> which is permitted by the Rule.
>>>> 
>>>> Mechanical changes.
>>>> 
>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> 
>>> While not overly bad, I'm still not really seeing the improvement.
>>> Yet aiui changes induced by Misra are supposed to improve things in
>>> some direction?
>> 
>> I think the improvement is clarity, in the sense that the designated
>> initializers make it clearer that the array may be sparsely 
>> initialized
>> and that the remaining elements should be initialized to zero
>> automatically.
> 
> That's as clear from the original code, imo.
> 
> Jan

There's also this functionally equivalent alternative, with or without 
the zeros, which
doesn't incur in the risk of mistakenly attempting to initialize the 
same element twice,
while also giving an explicit cue to the reader that all elements are 
truly zero-initialized.

          .matches = {
              DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
              DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant DL5"),
+            {0}, {0}
          },

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

