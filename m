Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72624B26DEF
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 19:49:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1082121.1442034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umc4f-0000jy-B0; Thu, 14 Aug 2025 17:49:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1082121.1442034; Thu, 14 Aug 2025 17:49:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umc4f-0000iW-7Z; Thu, 14 Aug 2025 17:49:13 +0000
Received: by outflank-mailman (input) for mailman id 1082121;
 Thu, 14 Aug 2025 17:49:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QQqN=22=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1umc4d-0000iQ-IY
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 17:49:12 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa867b72-7936-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 19:49:08 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 98C784EE3C04;
 Thu, 14 Aug 2025 19:49:07 +0200 (CEST)
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
X-Inumbo-ID: fa867b72-7936-11f0-b898-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1755193747;
	b=evJP8l7QeIUq/oYk43X5JBzf+yAmxLnEn2D/hfH2oJdDs71zSN4IpZl7Nc+YDO0uLp2/
	 bg6xqx2KOZMTMDHQnIu9m/1lJJB0P86iJX5NnononoDaLQrVk0RN40knbIG3qPP0n1C+A
	 KkaczgVwVye5aV1ef8RKoxWpjyjjXkcNSgZIuJPpbZWEhjOgRNaGpUuhJHUP11jjSNrpD
	 4vKM4TSgsJIGu6qmg5hRtmJydCS4PKk5PHLKPiBK04o+lzb5hBiPYOxyF33I8XndgsLDf
	 4qnmsWXfuKP1YVoI5tltl2n6hTG0+BLFz6t1smYfK56zeG0ybcqprZXGhOe993P62sGgd
	 o81Sf/4UNFnC8F4rI0HEsPxP08YLwgqGzOLakzcW7iOJRhjhHFgYxcIzqQ4koDiCpJPVf
	 GwGl6CyGYNieaJo9tAspyTo0zv/M3REJNEAELjcPNRj4mgZgIiLGcCo4bwxVOsFrKGN9E
	 9wVLocHpKnyB1IIf3+rlmClAR2p9dH4TPMiT4EZDjvGZXHbCxln1O5pO+QDSfVyPaGvT0
	 9LGH5JyIZjKNIxNXOGxwCFV4QqEfJ9yF/EKMChwoXEqyL6jiEYomV2la9p2pCq1PChQsh
	 6866NXhgQkiiF8LUg5HbiSSTL2Y2U+QssL5IWpptYap7SbF5i+oEA6E2mYDURW8=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1755193747;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=YO7Ya9iBWiFrBHR+XdC+uFThSUh8MFN6TXgkgn+bID8=;
	b=ZZLzAmdsPn/Mq4DPMasEmesxhFQLsL2s+CluNPIHkBuWm5YQxQ9TmxbUu5yHefZXUqo+
	 LFbs07hcz5PzTVSikyEEDUFfvxfE/65fl0wTE+AabBieMS3C8Kop2YbpJ9g8g0hepSKgg
	 LuyrpG/jpxwvCLPKrTGkZQk98qAuwph5jnomquQ6kmCbxH+GL0991Ko5zsvO1zrXWoOWp
	 P/+ddpUMMtI4xlQJMipTnEAstwf0upkp+h5YE+BMQsIctDFtCwvmBPSE3S+Nd2noTKuzG
	 YcsfxNsGU1YUSyZIWfRzCYS8p2e68oNVy0Hi/NnuHJa6o4mMoSWvcssnGJgicqDS5Bk8q
	 WSTCOA6jjOWjq2XaB3Bm/NJikQnXHAAGm/GxXux8B1WX9gKsFa0duwg7Rf4j8PbP4FUGG
	 eZR/NEi6HQISClVTWpVcYIlu3z6BPCTnL9j+Hl9nR8iAoTHMgXkqJ8QZ/3CfJQvVd1OT+
	 KQVPeZL369MpgzT4upTo0OJlTNetM5nwzC4PdmzNDE320yRjGWAUakxpbmX8VAsrb35cn
	 pCUob/9hKaMakj5v+YH776IErdFGdrzxyqcohngiJ7Udb/0a+AjfSVInvW4o08JScEG9y
	 LoxjWvVeNUjtGSYmJe0UH5MJIsd89taKn8dxJYsEpjhjlWgDvYvNnsDS+AoETIg=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1755193747; bh=UOLYbN34On77eNfK6ujLWY3o1aFbm4jVSPgMTCAbHws=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lDMYaTeVN5andKJKDFXgjtj6okcZ3kZ6VsVY15/wYS8gwMW1iJpUz3X5P3pz7hgH6
	 E38uEGyPxRNZu/YARO7SosqRGTe9w+DWABlo13whXXXlZ38HFBS0ZIXgR3AFkhT5E/
	 73F4h81Fp4mvRGiYSA9WLnHSqcsdUl/DF+7Gk8DaqQSz0vYf9/UghyZ3AUPk+wM8Yi
	 IaU41mNK7Um7vqLVkRTaBi4fzSpB48+UEmyNq+OVz326xE7j4q3nUwBTDtQgoXHTrN
	 ENemWQc2nKIOObuz2BAvNQE6z/4qIc4detcrY60roPSq87b6cRdjUcoEsvZ5CAoxLw
	 1ua1oVvLQihMw==
MIME-Version: 1.0
Date: Thu, 14 Aug 2025 19:49:07 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, consulting@bugseng.com,
 dmytro_prokopchuk1@epam.com, andrew.cooper3@citrix.com, Doug Goldstein
 <cardoe@cardoe.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 2/2] Address violation of MISRA C Rule 13.1 involving
 asm side effects.
In-Reply-To: <0b55d5f9-35ad-4598-94ab-1aa4991c0e3a@suse.com>
References: <1283be3b76d76814af244bbca544f6a3b74a04de.1754689062.git.nicola.vetrini@bugseng.com>
 <c4da2554d94c3f7bd4b1e460dcaa27db382ece2f.1754689062.git.nicola.vetrini@bugseng.com>
 <0b55d5f9-35ad-4598-94ab-1aa4991c0e3a@suse.com>
Message-ID: <2994bb7cfe2b0a5f86876a3ead64bdff@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-08-14 09:36, Jan Beulich wrote:
> On 08.08.2025 23:40, Nicola Vetrini wrote:
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -437,6 +437,10 @@ write or not"
>>  # Series 13
>>  #
>> 
>> +-doc_begin="Consider the asm instruction to read an Arm system 
>> register to have no side effects."
>> +-asm_properties+={"asm(any())&&child(text, 
>> ast_field(value,^mrs\\s+%0.*$))", {no_side_effect}}
>> +-doc_end
> 
> Is this actually strict enough to not allow multiple instructions in 
> the asm(),
> where some of the others would yield side effects we actually need to 
> respect?
> 
> Jan

Good point, I didn't think of that. As it is, there is only one MRS asm, 
so no worries here, but in general the remark is valid. The regex could 
be a bit stricter, though the real solution here would be to match the 
context in which this asm is present to limit the scope of the 
deviation. This does not make much sense for an asm property because the 
properties of an asm statement (at the level of granularity targeted by 
ECLAIR) can be derived mostly in isolation from the surrounding code.

Another improvement we are pursuing is allowing single effects in 
init-list-exprs, but it will take a bit of time to surface (i.e., next 
major release probably).

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

