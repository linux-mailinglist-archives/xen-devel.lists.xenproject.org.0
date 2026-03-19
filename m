Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEcgFSMSvGnbrwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 16:11:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F377A2CD752
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 16:11:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257302.1551723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3F1u-0004yV-GR; Thu, 19 Mar 2026 15:11:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257302.1551723; Thu, 19 Mar 2026 15:11:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3F1u-0004vo-Cq; Thu, 19 Mar 2026 15:11:22 +0000
Received: by outflank-mailman (input) for mailman id 1257302;
 Thu, 19 Mar 2026 15:11:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jTMs=BT=bounce.vates.tech=bounce-md_30504962.69bc1215.v1-31e2dd9da2eb448da680b6e2bc7c8072@srs-se1.protection.inumbo.net>)
 id 1w3F1s-0004vi-S5
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 15:11:20 +0000
Received: from mail132-30.atl131.mandrillapp.com
 (mail132-30.atl131.mandrillapp.com [198.2.132.30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e18c02a4-23a5-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 16:11:19 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-30.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4fc8Kd3vCtzP0KfTk
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 15:11:17 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 31e2dd9da2eb448da680b6e2bc7c8072; Thu, 19 Mar 2026 15:11:17 +0000
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
X-Inumbo-ID: e18c02a4-23a5-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773933077; x=1774203077;
	bh=c7EBVJpm1lWVHngN6dHa2Z7JDKPHyxmFCynx1E221vk=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=bFUkLlyWUO83CnNQxz4/WUNiT/ggrrvmoBOORsj4nvxp1msRwD8IEQee4sRgLmJNS
	 15F8vV/nz/eAVm57EO/Vo+6tQxJcfAJxyiONawwlz7aFfaVgZBXQTAG3ZMYMZ4RhSC
	 KLgGjQ9bb/4+PkqO/XZA3dwZpV8crI6nM897D6yurf6PW+HYbSSlzjFEmCHtXmgFcU
	 B926UwHcZPF687n3imU7W/qv4ox7j2w1VC/CecJr9Tcb5LX4pSFTRcWJ0LT0Vw6tiq
	 hywY8P8KwqF4n5wpycED+rDOc7H6PIaAikQ3TkE5gUCqhjSJCCwevv/PeYcFMdjofk
	 qfAAL8hEtJzJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773933077; x=1774193577; i=thierry.escande@vates.tech;
	bh=c7EBVJpm1lWVHngN6dHa2Z7JDKPHyxmFCynx1E221vk=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=u5H0gc02sSq4Oe0PqdPvfoYtvtsH3AAUVzqVVHTqUqAMCOWu4QFHPay+cquq7X0DM
	 oOfHBaHDuvJmzeJvy7lKOI6IzWzSOrOplJD4C3Ov4xCaPLQ1V+ebpAZ1diykbgRyEW
	 KvrKsdTm40n8o0qMNB9VG+eLWjF6PtYkJLHFtPYocmO2QMYIh3yGYa8GOr9QrXbeWG
	 wtNhWD2SCAzql9F30TdmRqZjG62iZ6zG02mzv3mJRjOR16JbT7mrO7fs5R2D/P/Kuo
	 YBQkByFOcyoXrFApZkjIqw6Lrs3frdxPpbmzqEOcm9y21bdb7q6qLDlEteCER1qgCz
	 5ABJJTPZFEgoQ==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20install.sh:=20Preserve=20directory=20symlinks?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773933076902
Message-Id: <74138709-b2c7-4bea-8569-6904c298ade6@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20260313172456.871518-1-thierry.escande@vates.tech> <7ee208c4-1f83-4bec-86db-bae22bd2040c@suse.com> <3bc905c5-a0e5-4ca0-96f4-eb6bb73b2361@vates.tech> <929c9e0e-c465-447d-ba65-30053051a88e@suse.com> <79295381-5d8a-4f78-95d2-fd67da25ccb2@vates.tech> <0e2ce96e-b30d-48b4-965b-0880ff26b4d9@suse.com>
In-Reply-To: <0e2ce96e-b30d-48b4-965b-0880ff26b4d9@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.31e2dd9da2eb448da680b6e2bc7c8072?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260319:md
Date: Thu, 19 Mar 2026 15:11:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mandrillapp.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	NEURAL_SPAM(0.00)[0.824];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: F377A2CD752
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/19/26 15:09, Jan Beulich wrote:
> On 19.03.2026 14:59, Thierry Escande wrote:
>> On 3/19/26 14:48, Jan Beulich wrote:
>>> On 19.03.2026 14:26, Thierry Escande wrote:
>>>> On 3/19/26 10:31, Jan Beulich wrote:
>>>>> On 13.03.2026 18:25, Thierry Escande wrote:
>>>>>> In various distros (i.e. Debian) some folders like /lib or /var/run are
>>>>>> symlinks. Using the tar option --keep-directory-symlink preserves these
>>>>>> symlinks.
>>>>>>
>>>>>> Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
>>>>>> ---
>>>>>>  install.sh | 2 +-
>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/install.sh b/install.sh
>>>>>> index 3e11c4d46f..5d0b7a4933 100644
>>>>>> --- a/install.sh
>>>>>> +++ b/install.sh
>>>>>> @@ -27,7 +27,7 @@ tmp="`mktemp -d`"
>>>>>>  echo "Installing Xen from '$src' to '$dst'..."
>>>>>>  (cd $src; tar -cf - * ) | tar -C "$tmp" -xf -
>>>>>>  
>>>>>> -(cd $tmp; tar -cf - *) | tar --no-same-owner -C "$dst" -xf -
>>>>>> +(cd $tmp; tar -cf - *) | tar --no-same-owner -C "$dst" --keep-directory-symlink -xf -
>>>>>
>>>>> How compatible (between flavors of tar as well as between versions of GNU
>>>>> tar) is use of this option?
>>>>
>>>> It's supported by GNU tar since version 1.27 (from ~12 years ago) but it
>>>> seems to be the only implementation that supports it. BSD and busybox
>>>> don't support it. I didn't check for other implementations.
>>>>
>>>> I can add a flavor/version check if that makes sense.
>>>
>>> Possibly. One question then is what the behavior was prior to that option
>>> having been introduced.
>>
>> From the patch at [1] introducing the option, and more precisely the
>> test done at [2], directory symlinks were simply overwritten.
> 
> Which makes it hard to suggest useful behavior when the option is unavailable:
> Simply refusing to install isn't nice, but corrupting the installation is
> perhaps even worse.
> 
> I take it that the (presumably) more standard -h doesn't help here?

-h definitely helps but it has the same behavior for files and folders.
So if an already existing symlink is meant to be replaced by a file,
then it won't. I chose to use the folder specific option.

That being said there is probably no usecase where a real file replaces
a symlink in the dist archive. And anyway, that would also stand for
folders.

I'll send a v2 with -h.

Regards,



--
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


