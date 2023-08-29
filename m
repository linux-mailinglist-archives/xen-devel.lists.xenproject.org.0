Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD2D78C3F0
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 14:12:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592130.924749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaxZO-0002bn-KR; Tue, 29 Aug 2023 12:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592130.924749; Tue, 29 Aug 2023 12:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaxZO-0002Zn-Hi; Tue, 29 Aug 2023 12:11:42 +0000
Received: by outflank-mailman (input) for mailman id 592130;
 Tue, 29 Aug 2023 12:11:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fHNM=EO=leemhuis.info=regressions@srs-se1.protection.inumbo.net>)
 id 1qaxZN-0002Zh-4S
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 12:11:41 +0000
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [2a01:488:42:1000:50ed:8234::])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3541d283-4665-11ee-8783-cb3800f73035;
 Tue, 29 Aug 2023 14:11:39 +0200 (CEST)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1qaxZL-0005te-66; Tue, 29 Aug 2023 14:11:39 +0200
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
X-Inumbo-ID: 3541d283-4665-11ee-8783-cb3800f73035
Message-ID: <e4f32537-bec5-3d9e-11b1-0aa79fa10103@leemhuis.info>
Date: Tue, 29 Aug 2023 14:11:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: UBSAN: index 1 is out of range for type
 'xen_netif_rx_sring_entry [1]'
Content-Language: en-US, de-DE
To: Linux Regressions <regressions@lists.linux.dev>
Cc: Linux Xen <xen-devel@lists.xenproject.org>,
 Linux BPF <bpf@vger.kernel.org>, Linux Networking <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <7e3841ce-011d-5ba6-9dae-7b14e07b5c4b@gmail.com>
 <20230723000657.GA878540@dev-arch.thelio-3990X>
 <e208365f-dbc6-06d1-ccc9-3b2e945a0bff@suse.com>
 <73019154-6a34-f714-96b5-b43038569feb@suse.com>
 <202307252204.09AC0089@keescook>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <202307252204.09AC0089@keescook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1693311099;b5c329c9;
X-HE-SMSGID: 1qaxZL-0005te-66

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 26.07.23 07:06, Kees Cook wrote:
> On Tue, Jul 25, 2023 at 03:34:26PM +0200, Juergen Gross wrote:
>> On 25.07.23 15:24, Juergen Gross wrote:
>>> On 23.07.23 02:06, Nathan Chancellor wrote:
>>>> On Sat, Jul 22, 2023 at 07:21:05AM +0700, Bagas Sanjaya wrote:
>>>>>
>>>>> I notice a regression report on Bugzilla [1]. Quoting from it:
>>>>>>
>>>>>> I rebuild today latest version from mainline repo.
>>>>>> And i notice issue regarding xen-netfront.c.
> [...]
>> Oh, in fact there is a way in Xen to do that correctly. It schould be enough to
>> use ring[XEN_FLEX_ARRAY_DIM], which will do the right thing.
>>
>> So I'll write a Xen patch first, after all.
> 
> Perfect! I went to go look, and yes, this is good:

#regzbot resolve: will be dealt with on the xen side
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.


