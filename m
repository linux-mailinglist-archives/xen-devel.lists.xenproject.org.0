Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 631DBA2738A
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 14:57:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881542.1291727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfJQA-0004A2-Qu; Tue, 04 Feb 2025 13:56:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881542.1291727; Tue, 04 Feb 2025 13:56:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfJQA-00047s-Nb; Tue, 04 Feb 2025 13:56:58 +0000
Received: by outflank-mailman (input) for mailman id 881542;
 Tue, 04 Feb 2025 13:56:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yR1u=U3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tfJQ8-00047B-SS
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 13:56:56 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4d60c54-e2ff-11ef-a0e7-8be0dac302b0;
 Tue, 04 Feb 2025 14:56:55 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4361b0ec57aso57607375e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 05:56:55 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23de35csm190132435e9.10.2025.02.04.05.56.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 05:56:54 -0800 (PST)
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
X-Inumbo-ID: e4d60c54-e2ff-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738677415; x=1739282215; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LtXMUWYtuMhe92M30lD+7wr0yzTekz1YWdhTgCPh+/8=;
        b=k0lOAjwEKsfGhqp7qutu6hGW5G6eGcLb8pwGBOTr/8LFY0dqMHVFntNs2/UXoveNoI
         igu5U5n9P2TFuz1BeZ9jknff1BlHu3aUF+JfR0ev5M5C+WyC8/hcJXCVbjitV2PorZoc
         2sHOkVqH0KacmPAEcIQB8eWOFU+1BAK33hqhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738677415; x=1739282215;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LtXMUWYtuMhe92M30lD+7wr0yzTekz1YWdhTgCPh+/8=;
        b=T7z9i74+r+ZveoDQup1OtZUxmZHVJwIzgbJQcXsV3ikHQVZzbP/H5t0J9ZzpPRQaq6
         my2u6hdxkskTOZry+56oIsEjwP2tNaflEcjd6Xsu+kR4UWTD7O4rzER+kFEEZBSFTFy4
         fLRI1WBvp+X74VR+fyMo31rLu3tCoy2qq4QZ64RtWAT/ZpU1U6kPpcSSRfo1WgDFVMQH
         ju+/y73mol2hpZ8TewJbNingBlL/JaBV5O5Y15SUdocIYoK1LDwRBg1Vy6XtOHFBGywL
         mf8sALF3RmNN8fin3cYD9va4e8lZC98ftzgRJkKmO00IzWiV6hw1OSkyq0Jbzdz1mx39
         18Hg==
X-Forwarded-Encrypted: i=1; AJvYcCX1h14BGaVd37vH0wn/yJCpfXca3kxQyEOibcHhvLisk8nbeITuUjVLSWqjFph5TnmlbZEwGlOUylI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywhrjnp9SPCbb/yphOsrpHsWxga3pTFeAUMfpth/8wwij6DDxLU
	0ypsyogYDx/ywJb4VHDuMzmrt/ktXY6KzaVRPeoMPrYO3+RRrK9K7nk1HKd9/T3YGcXXvkk1UB+
	ZjGs=
X-Gm-Gg: ASbGncvGbeMy+n6QASbmNpqx9odIaNV7cBGoIBhALvZkmLtBdmCFjjNEV25vm+ogePG
	5/OBJEjWv+NZ+RL4BdIbwceX/bptaPaeM7p4v07/ljoJ0lQJbCa23zPNhvsDQQK9k8hwMlB6xeI
	wnYXEUy95vc2J9/+/fx3FTFrE24ZzX7zJmQdy91P1lhZy5VZbWjEz+/SS8frIFnGaNvwwpTD+4L
	oVCSkNPhAdqKO8CfFRKY/caL5Y3j9fPOS8wtzpdnjgXkTW8L1ZraANJhl0jMZYFjSO2Fz0rN0MO
	GR8AkpKLU/nuVyC8Kp7I71j9vAYTLd/jEtQqZup42LCegvf9ioYcrKw=
X-Google-Smtp-Source: AGHT+IFVoB8vcFAkPLVTgsiavyBcIK1lniccQdWD7/ot/MQG/dOxH5M2WOO4omBXElEsTZXrXFtmQw==
X-Received: by 2002:a05:600c:1e02:b0:434:ffd7:6fd2 with SMTP id 5b1f17b1804b1-438dc3c22d4mr236826545e9.7.1738677415151;
        Tue, 04 Feb 2025 05:56:55 -0800 (PST)
Message-ID: <9a982d84-a22a-481e-804b-3483bfa9247b@citrix.com>
Date: Tue, 4 Feb 2025 13:56:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 for-4.20 2/4] radix-tree: introduce
 RADIX_TREE{,_INIT}()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0a006732-2b6e-46f0-a706-f432abd45d2c@suse.com>
 <e1114d64-61f9-47b9-a1ed-33b526d40089@suse.com>
 <8c0dc0bb-0fdc-425d-bbe6-796573bb7f61@citrix.com>
 <3be372f6-a102-419b-9022-750f0092f725@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <3be372f6-a102-419b-9022-750f0092f725@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/02/2025 1:19 pm, Jan Beulich wrote:
> On 04.02.2025 14:10, Andrew Cooper wrote:
>> On 04/02/2025 1:03 pm, Jan Beulich wrote:
>>> --- a/xen/include/xen/radix-tree.h
>>> +++ b/xen/include/xen/radix-tree.h
>>> @@ -72,6 +72,9 @@ struct radix_tree_root {
>>>   *** radix-tree API starts here **
>>>   */
>>>  
>>> +#define RADIX_TREE_INIT() {}
>>> +#define RADIX_TREE(name) struct radix_tree_root name = RADIX_TREE_INIT()
>> We can still use this form in radix_tree_init(), can't we?
> Only indirectly, and that's imo ugly:
>
> void radix_tree_init(struct radix_tree_root *root)
> {
> 	RADIX_TREE(init);
>
> 	*root = init;
> }
>
> RADIX_TREE_INIT() cannot (directly) be used because {} isn't an rvalue.

Even if it's not ideal,

    *root = *(struct radix_tree_root)RADIX_TREE_INIT();

works.  We use this pattern elsewhere in Xen, so it surely will be fine
even on ancient compilers.

~Andrew

