Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A13B4A1B470
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 12:10:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876686.1287044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbHZN-0007P8-08; Fri, 24 Jan 2025 11:09:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876686.1287044; Fri, 24 Jan 2025 11:09:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbHZM-0007Mt-TY; Fri, 24 Jan 2025 11:09:48 +0000
Received: by outflank-mailman (input) for mailman id 876686;
 Fri, 24 Jan 2025 11:09:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AkuS=UQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tbHZL-0007Mn-U3
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2025 11:09:47 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b48fb139-da43-11ef-99a4-01e77a169b0f;
 Fri, 24 Jan 2025 12:09:40 +0100 (CET)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2166360285dso34699615ad.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jan 2025 03:09:46 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72f8a77c7casm1595729b3a.139.2025.01.24.03.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 03:09:44 -0800 (PST)
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
X-Inumbo-ID: b48fb139-da43-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737716984; x=1738321784; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XhwjDzLmdgIzTMagG6tmcBvirtJNnZa7zDDq27LSVWc=;
        b=FAtnrSR41wGlw/mcUNP06vEUnu9B3C+QwY4zMj4AKZzKRtE6R8Mp0FjM/jYIXv20ze
         8KZjV+tfu03XeOl22xYb6Ad6OFXpkWlVa+jXEluudrOYvts+HKDJUKkKZGnIDibSu1Pb
         mxpDbvRBOQkOxjGQ0+83V53NEaBPW2nUUQb5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737716984; x=1738321784;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XhwjDzLmdgIzTMagG6tmcBvirtJNnZa7zDDq27LSVWc=;
        b=LuuUGVeGgNkFmNMeJpC1WeWukjvpqCmiG9kf7pkpjFgAJOKIyFRv1iFiggbzwNRj9H
         QDURVoGgyynZ2BvXg71fs5oGsqSh1IupZJSWEsoNfeFEzMHDD7QKzKqnRgWmLs65Fu3f
         hW1JCewA5JZq8CJAeBLbdEbrGLc9a6Rs5LPoKr2v2PrAB9KPmjI1Kl5cu8mGvwVmi9lF
         qofgNap5arOpnyUJZs2fAFGZx9uZkSKmTtk8xhwN8qfNN/HeLbcQ4mxAay4YCu0H0Nqr
         tSw3sZBAR2xMICZ9gGrp00QGMHIbBIl4T1vd2sh/osyJexlK6wtQBkrlqqQKwBx38E3a
         aotw==
X-Gm-Message-State: AOJu0YwI3X/HAa65/655l3np9bp6kTzJMpHoAa5sp+sZK9JdhCshywWJ
	tV+1ojYSN3Vtwa2qKLoEylC+zMrmmuEC3lLEfLeUMQT7Ai94Up2Lm8OusfvNJgg=
X-Gm-Gg: ASbGnctPt/5OaLENXqPEzAtxkjbw8yO7FQ6aMxXFZdWsFgUwlHuzg8xb8WxCK9cpDd9
	k/aSEn/BsAXZTWdLpiAQMVCGbpRlYOr0UQyJZlfz5mnTuZWXMAxoJG1WX/cDssnZ1+2tEI0dK9g
	XYSSgc9awxBGG0jK/FML5IuU8R0TGsC6u2uF+1O5OEbZdiyf9aQ6KdZeMYLZYvRvs37aHaEbKm7
	tKtbZDPlvIbqhmNLBiIofXbEIU0k+knbAR1NAL+0lgw/dqY8r/DfFI6+MoAQA7pbxTCcdzi+9Zw
	7ldbvHMOMTiaFwA=
X-Google-Smtp-Source: AGHT+IHySiw7jOdyC+v5hDObCzBP/Bqpr29abrUVqNiMB790KvukKNHww3L6KTyUcb3CIz4UNgopCA==
X-Received: by 2002:a05:6a00:4fcb:b0:727:99a8:cd31 with SMTP id d2e1a72fcca58-72daf97b5d3mr44134201b3a.14.1737716984565;
        Fri, 24 Jan 2025 03:09:44 -0800 (PST)
Date: Fri, 24 Jan 2025 12:09:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>
Subject: Re: [PATCH v3 00/12] x86/HVM: misc tidying
Message-ID: <Z5N085zua-Z8NJLI@macbook.local>
References: <293e5aef-8843-461c-bc96-709a605b2680@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <293e5aef-8843-461c-bc96-709a605b2680@suse.com>

On Mon, Feb 26, 2024 at 05:40:25PM +0100, Jan Beulich wrote:
> 01: VMX: don't run with CR4.VMXE set when VMX could not be enabled
> 02: x86/HVM: improve CET-IBT pruning of ENDBR
> 03: VMX: drop vmcs_revision_id
> 04: VMX: convert vmx_basic_msr
> 05: VMX: convert vmx_pin_based_exec_control
> 06: VMX: convert vmx_cpu_based_exec_control
> 07: VMX: convert vmx_secondary_exec_control
> 08: VMX: convert vmx_tertiary_exec_control
> 09: VMX: convert vmx_vmexit_control
> 10: VMX: convert vmx_vmentry_control
> 11: VMX: convert vmx_ept_vpid_cap
> 12: VMX: convert vmx_vmfunc

 For the "convert ..." ones:

 Acked-by: Roger Pau Monné <roger.pau@citrix.com>

 I've taken a quick look and it all looks like mechanical
 transformations.

 Thanks, Roger.

