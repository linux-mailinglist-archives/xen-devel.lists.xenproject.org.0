Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 608D4A5F84B
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 15:31:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912355.1318646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsjb9-0003yu-01; Thu, 13 Mar 2025 14:31:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912355.1318646; Thu, 13 Mar 2025 14:31:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsjb8-0003x2-Sr; Thu, 13 Mar 2025 14:31:46 +0000
Received: by outflank-mailman (input) for mailman id 912355;
 Thu, 13 Mar 2025 14:31:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NEXk=WA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tsjb7-0003wo-Oz
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 14:31:45 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3481795-0017-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 15:31:44 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso9182725e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 07:31:44 -0700 (PDT)
Received: from localhost ([66.81.170.107]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975c6dsm2343049f8f.54.2025.03.13.07.31.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 07:31:43 -0700 (PDT)
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
X-Inumbo-ID: e3481795-0017-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741876304; x=1742481104; darn=lists.xenproject.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7dRXH6xiWbQ8AwfXpG3ARoEDTnoaNMiSVWfa6lb2gFs=;
        b=GGfOmShZPxGFgouEqmAeT0Of1PlZt/Nc+d10LKgvVvHNANFqBZtPRtmPi6BwuplZRW
         E3szrLF2tpQmlI91/u/1c97f4+49UQFtyFs9LCknjy0GVTMY2JrkUydZ7zYj0+o8luRO
         vip0Y/0GRfZQLTygLx9UmQglXF0RrgQSbR/wU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741876304; x=1742481104;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7dRXH6xiWbQ8AwfXpG3ARoEDTnoaNMiSVWfa6lb2gFs=;
        b=GgDUPMsN/xueXp18fbL1/l2Ak2x5StnOd52AOKOkl91llvkDy5xFS1SJm9qLxU+xWX
         Rql6Q1PAFH2cjoPDbEVJ8eXXdXu8QBoC27hZ8L+HCo35oUrMOKZJMGsLib5Y5uBsCyh7
         OL8PKuPb3ewD/PdZ5kRnk7TQbcctiOfgEzbFeAIOF9vVkpXQGj9Jn0Ggr2xxfzQF9oK3
         77VOgl+gjaK7h6uFAN2FRw4cLFGOyLZb8VwvB132u15TLYu5z5tnXHWdrOOmMb6wVzUf
         OIEaZKFZALFovf/RJH+AwIJwCZFDtoS49BLPFEwz1WYK3O7LJUOHx+t4c4AWljjyfaIO
         +PnQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0WCeL7oF5VOV+7AJhljHWNNflZBilUj8gN+5bezOEkGJvMtqe/c139J9WdC6m4IHmvGQwPJe2jXQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz7GDdTN8eswXCXMbYKfm/0nbRY4xSwHu/IwChGCoUwZQigC0LP
	uHWB0LEOcsP1zY0knIip7VATGDLYcVh3jljzryuNjzGetM2HZF4hHZz9WwN+Hpg=
X-Gm-Gg: ASbGnctWD71VgP0K3Ykkky8zKTVBSukrzaotAjFfA8dWvlMB2patUW5nau1f24ymGsG
	ZH5xCsyTPDLAOr+81srAAsyb9XRkOYre6SKcQAM9Yqz0I9m/mFfiNzuigg20EbS0oCbNBccyT4T
	W42+n6eQ5LrwJ1BvfM6gydgrWD1mdSlKpTiC4Wj6CL7JMHIxCuhIiyCA8agmSHNNy6ZMSbpiL/Y
	jI0/7SQnZVqR7RLGdkzhoOx4/7sAiKOOZHm1w2J9lWgA2V88PK8+cthEogi7eQ1kJ0nJjo7o8cH
	Lbj7drNNpHnnSWpByn2/hrJo2Emo8fq0DCjNq+dG0fT2wZNMJjM=
X-Google-Smtp-Source: AGHT+IF8zqXPhfJaTS2PH9ZgnNKsze2rgGJ4Kr4PZCizF5Fxqqqs6lxzLkKnMiyBXBglbfv8OdHZvQ==
X-Received: by 2002:a05:600c:35d3:b0:43c:f1cd:3d78 with SMTP id 5b1f17b1804b1-43cf1cd3ecbmr158818345e9.12.1741876304123;
        Thu, 13 Mar 2025 07:31:44 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Mar 2025 14:31:39 +0000
Message-Id: <D8F7M53TBZKS.2XTO21B8G2HRU@cloud.com>
Subject: Re: [PATCH v1 02/19] xen/xsm: wrap around xsm_sysctl with
 CONFIG_SYSCTL
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: <ray.huang@amd.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "Penny Zheng" <Penny.Zheng@amd.com>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
 <20250312040632.2853485-3-Penny.Zheng@amd.com>
 <D8F41PA5JHTU.ABSSG427OH5@cloud.com>
 <34a1119f-62d4-4b73-b1e3-c8e945352829@suse.com>
In-Reply-To: <34a1119f-62d4-4b73-b1e3-c8e945352829@suse.com>

On Thu Mar 13, 2025 at 12:05 PM GMT, Jan Beulich wrote:
> On 13.03.2025 12:43, Alejandro Vallejo wrote:
> > On Wed Mar 12, 2025 at 4:06 AM GMT, Penny Zheng wrote:
> >> --- a/xen/include/xsm/dummy.h
> >> +++ b/xen/include/xsm/dummy.h
> >> @@ -180,11 +180,18 @@ static XSM_INLINE int cf_check xsm_domctl(
> >>      }
> >>  }
> >> =20
> >> +#ifdef CONFIG_SYSCTL
> >>  static XSM_INLINE int cf_check xsm_sysctl(XSM_DEFAULT_ARG int cmd)
> >>  {
> >>      XSM_ASSERT_ACTION(XSM_PRIV);
> >>      return xsm_default_action(action, current->domain, NULL);
> >>  }
> >> +#else
> >> +static XSM_INLINE int cf_check xsm_sysctl(XSM_DEFAULT_ARG int cmd)
> >> +{
> >> +    return -EOPNOTSUPP;
> >> +}
> >> +#endif
> >=20
> > Doesn't this need to be -ENOSYS instead?
>
> There shouldn't be any ENOSYS outside of the top-level hypercall handlers=
.
> Granted we have many violations thereof, some of them not very reasonable
> to fix (for guests looking for the specific but wrong error code).
>
> Jan

That would be the case if the else branches were dropped. They have no use
AFAICS.

Cheers,
Alejandro

