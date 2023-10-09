Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AB67BD40B
	for <lists+xen-devel@lfdr.de>; Mon,  9 Oct 2023 09:09:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614184.955151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpkNc-0002f1-7r; Mon, 09 Oct 2023 07:08:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614184.955151; Mon, 09 Oct 2023 07:08:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpkNc-0002dL-5B; Mon, 09 Oct 2023 07:08:40 +0000
Received: by outflank-mailman (input) for mailman id 614184;
 Mon, 09 Oct 2023 07:08:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o9Np=FX=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qpkNb-0002dF-LH
 for xen-devel@lists.xenproject.org; Mon, 09 Oct 2023 07:08:39 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aadcb673-6672-11ee-9b0d-b553b5be7939;
 Mon, 09 Oct 2023 09:08:37 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id EB8E64EE073F;
 Mon,  9 Oct 2023 09:08:36 +0200 (CEST)
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
X-Inumbo-ID: aadcb673-6672-11ee-9b0d-b553b5be7939
MIME-Version: 1.0
Date: Mon, 09 Oct 2023 09:08:36 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: andrew.cooper3@citrix.com
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, jbeulich@suse.com, roger.pau@citrix.com, Simone
 Ballarin <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19 1/9] xen/include: add macro LOWEST_POW2
In-Reply-To: <fadc9eb9-152b-4956-8809-1188a706eac6@citrix.com>
References: <cover.1696514677.git.nicola.vetrini@bugseng.com>
 <d27f52eaaa62ec4ebb9ce8b6cf243779d341367d.1696514677.git.nicola.vetrini@bugseng.com>
 <fadc9eb9-152b-4956-8809-1188a706eac6@citrix.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <e337f150e5d1a01c8074f9438ceacb41@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 06/10/2023 18:35, andrew.cooper3@citrix.com wrote:
> On 06/10/2023 9:26 am, Nicola Vetrini wrote:
>> diff --git a/xen/include/xen/macros.h b/xen/include/xen/macros.h
>> index d0caae7db298..bb9a1c9a53d0 100644
>> --- a/xen/include/xen/macros.h
>> +++ b/xen/include/xen/macros.h
>> @@ -8,8 +8,10 @@
>>  #define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
>>  #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>> 
>> -#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
>> -#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
>> +#define LOWEST_POW2(x) ((x) & -(x))
> 
> Naming wise, LOWEST_BIT() please.
> 
> The fact it's a power of two is incidental, and POW2 is ambiguous,
> because it includes interpretations such as "calculate the lowest power
> of two greater than x".
> 
> ~Andrew

You have a point. I'll change it.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

