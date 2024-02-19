Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3627859E6B
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 09:36:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682693.1061791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbz7u-0006xg-0Z; Mon, 19 Feb 2024 08:35:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682693.1061791; Mon, 19 Feb 2024 08:35:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbz7t-0006vL-U4; Mon, 19 Feb 2024 08:35:49 +0000
Received: by outflank-mailman (input) for mailman id 682693;
 Mon, 19 Feb 2024 08:35:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NiMn=J4=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rbz7s-0006vF-8s
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 08:35:48 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0cf6369-cf01-11ee-8a52-1f161083a0e0;
 Mon, 19 Feb 2024 09:35:47 +0100 (CET)
Received: from [192.168.1.229] (93-36-216-194.ip62.fastwebnet.it
 [93.36.216.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 612194EE0739;
 Mon, 19 Feb 2024 09:35:46 +0100 (CET)
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
X-Inumbo-ID: e0cf6369-cf01-11ee-8a52-1f161083a0e0
Message-ID: <56b4a4bb-d3e8-4a21-8c0d-d4ee10c8f9b3@bugseng.com>
Date: Mon, 19 Feb 2024 09:35:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 2/3] x86/uaccess: replace __{get,put}_user_bad()
 with STATIC_ASSERT_UNREACHABLE()
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1706259490.git.federico.serafini@bugseng.com>
 <ec849d3a-4f6a-4afd-a7c4-418906eb909a@suse.com>
 <alpine.DEB.2.22.394.2402061707520.1925432@ubuntu-linux-20-04-desktop>
 <22ee2311-1e6b-4f2e-86e4-12d20b5ba4a2@suse.com>
 <6451696b-0366-4069-b82b-094e63eced8d@bugseng.com>
 <0b0b5a50-7692-4500-baa4-68df8f1c5d7a@suse.com>
 <d7812cd9-7d06-493b-b8a8-d2353f148e8b@bugseng.com>
 <a5d9b91d-4e56-4512-9b15-d6868a383923@suse.com>
 <04a2c7b2-07e5-46fd-835e-42b3c6307547@bugseng.com>
 <a4c2f7c0-66bc-436f-bc99-8f8ba4ec822e@suse.com>
 <fffaa145-16ff-4969-bf4c-cfe0be98b66a@bugseng.com>
 <2117bb4e-94a3-4990-945b-6fb141ae1e63@suse.com>
 <3ed651c3-4ed3-4237-bf57-3a99a790df1a@bugseng.com>
 <3edafece-f15e-4a28-9f17-a4b08d3e0215@suse.com>
 <35249e32-9eb2-4c51-868d-de2cd2d8230b@bugseng.com>
 <45c19a87-5833-4350-a374-3a70fd3aa9ae@suse.com>
 <d735e980-c5a5-46b1-a511-cc2d666dac23@bugseng.com>
 <123c446c-e56f-457e-9cf4-58a43a3b069a@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <123c446c-e56f-457e-9cf4-58a43a3b069a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/02/24 11:32, Jan Beulich wrote:
> The important difference is: Here we're told that there was a use of
> __put_user_bad, which is easy to grep for, and thus see how the
> supplied function / file / line(?) relate to the ultimate problem.
> 
> I'm afraid I'm meanwhile confused enough by the various replies
> containing results of experimentation that I can't really tell
> anymore what case is best. Hence I can only restate my expectation for
> an eventual v3: Diagnosing what the issue is, no matter whether the new
> macro is used in another macro or in an inline function, should not
> become meaningfully more difficult. In how far this is the case wants
> clarifying in the description of the change.

I think the best thing at the moment is to deviate
__{get,put}_user_bad() for Rule 16.3.
I'll let maintainers further explore the possibility of having a
compile-time assertion based on the assembler error.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

