Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 869D97619C4
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 15:22:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569687.890634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOHz0-0001TW-Mf; Tue, 25 Jul 2023 13:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569687.890634; Tue, 25 Jul 2023 13:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOHz0-0001Qs-JT; Tue, 25 Jul 2023 13:21:46 +0000
Received: by outflank-mailman (input) for mailman id 569687;
 Tue, 25 Jul 2023 13:21:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n1im=DL=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qOHyz-0001Qm-4d
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 13:21:45 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 149555d0-2aee-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 15:20:53 +0200 (CEST)
Received: from [172.20.10.2] (unknown [37.160.93.75])
 by support.bugseng.com (Postfix) with ESMTPSA id 841084EE0739;
 Tue, 25 Jul 2023 15:21:41 +0200 (CEST)
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
X-Inumbo-ID: 149555d0-2aee-11ee-8613-37d641c3527e
Message-ID: <9290ef80-cea6-9b29-3fcf-cf6590dfcf76@bugseng.com>
Date: Tue, 25 Jul 2023 15:21:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v2] device_tree: address violations of MISRA C:2012
 Rules 8.2 and 8.3
Content-Language: en-US, it
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>
References: <502a92e9b53960a6b78fabb48d354cbb5bc1750c.1690187572.git.federico.serafini@bugseng.com>
 <421bcc71-006f-af73-374a-b54266052a42@xen.org>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <421bcc71-006f-af73-374a-b54266052a42@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Julien,

On 25/07/23 12:02, Julien Grall wrote:
>> -unsigned int dt_number_of_address(const struct dt_device_node *dev)
>> +unsigned int dt_number_of_address(const struct dt_device_node *device)
> We have a structure called 'device', so wouldn't this result to violate 
> another MISRA rule because identifiers are re-used?
> 
> In any case, I would prefer if we keep the shorter version (i.e. 'dev') 
> as this is more common within device_tree.c. We can replace the other 
> 'device' at a leisure pace.

If you refer to the rule 5.3 ("An identifier declared in an inner scope
shall not hide an identifier declared in an outer scope") then no,
it is not a violation because there is no hiding.
To my knowledge, this does not cause violations of any other MISRA rule.

However, I agree with you,
the parameter name 'device' is not the best choice.
I will propose a v2.

Regards
-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

