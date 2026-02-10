Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHNJBodfi2msUAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 17:40:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D05D11D5DD
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 17:40:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226709.1533221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpqmY-00040S-TS; Tue, 10 Feb 2026 16:40:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226709.1533221; Tue, 10 Feb 2026 16:40:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpqmY-0003yB-Qr; Tue, 10 Feb 2026 16:40:10 +0000
Received: by outflank-mailman (input) for mailman id 1226709;
 Tue, 10 Feb 2026 16:40:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WUYk=AO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vpqmX-0003y5-HF
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 16:40:09 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26743446-069f-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Feb 2026 17:40:04 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-43591b55727so3842821f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Feb 2026 08:40:04 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43629756bc3sm32676169f8f.39.2026.02.10.08.40.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Feb 2026 08:40:03 -0800 (PST)
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
X-Inumbo-ID: 26743446-069f-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770741603; x=1771346403; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=COrjMK8OEYgsjTwS51atPufdJANAHpQy+jQ5A3f66oI=;
        b=Dr/TkF3KeCn2okThI/iCowURGhgss0Imyre2Hr76Llf3NGDm4XcO01tTyNfn1mvwZ5
         nRFS012++cTcoe/9xdxotAGKLmhbSP+o2hpUANX5U63wAP0cKW42/SmIlvqMFpK/5tWd
         K5xHxSmcWfMO7XAgpCB24skEK3DYoIxeGG8NZ17xx9wr4cHkQQA8tJTh4elL01RGuNvV
         KXLTgk9bEB/mMPwlWQcnzlnXYSyt2mo7d2DG522lF2UaXZRiGQpkhThecBCidOhVGM+i
         BHf2DDWwC7FUYCms98n5ThCUcInw8pY7aO13zH2sXJARAAHobvzi0z371WkgRuhMhUt0
         CM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770741603; x=1771346403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=COrjMK8OEYgsjTwS51atPufdJANAHpQy+jQ5A3f66oI=;
        b=Cf+eAIpZp4oqD/H2ZyxtDAZ2hhN6XlHvVU6btUY9ziwW+NXX3IoLBCrKDUwGHcQGCJ
         yNf2qJsF+LMqpczquTx6vIHRozXGL+mX6FFNtuS8jErrhr7mQYJ8KzFvjGdvRpexUWMR
         9Tb+3gj7zqryEoRYp5eMI5664ccTZK6/yweFxJMdcZESWJpL/HBoFjByEVQsLRXcq5mp
         UcEMGTcyqHdiotJo4vAjowaHmMfltMhf2uIgBzKggVwf/e6vb/3y3hILjcqdZ6y8oUm5
         Mvdpw/X5WwpaFt7lrlA/a+jbmh9jcXe3s+pvPvtB78c+WGjMiz8L8mj+CN4HmtP9BUgz
         cZdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXU2e10TGKPXQLNpRnLPeVwuRCYH2VTWGZ4JTlUf2YAhFSLiKIuJ7Gj1T+XvvftY4Fdu7QAsj64emQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZZRJ1X+/iCb+RCM09zpZgN/B/UHxBiikRRGNO/8+Qsm8ukic1
	ZyYq3QUVOrU1PDzUJCqfyn8ZJN/u0YJ64pTmCLsCd/avtD6Gva0Rshwh
X-Gm-Gg: AZuq6aKEv46FCReVWdRod35I0EaJM8/GRjtCCDOFsdth3745fAK38G64LojVBRSsTYX
	kRG8r6ElUHFW5YR4644I9lqq8NiqJGmaDXhyquXhPl6zpyEqCuSrpmz+F8p4RhMCA/9M9d0AFiz
	6qJezOKMqzMOveH4AuRg2Lxylxd9ZwrOPmE9T9wNX2ZvqWMNkTBEvBToMmv7pxrbBpSytR6/21G
	3RGep228pyqrWsht7EO/0h3s+79LQdBYTdlobyq/gzjB51+j5kjgVNG7NPEjtVAUQ74+gFPbheu
	LZrnwNezTDmuDU1wfgMHRXt0vNallxlTth2OVJNH6bPs/gw5hAFmX2nQOYhQ7cuPqEeTYOmxl9n
	xBrgT66jltHaayNHCf/DK2X3Pc7cq7JdZ1jUbBBwQ65/c64krRhNJc/Jx3WTHWJ1Ng861tBmxib
	4kb6HoHTO9bNgCOoIlVSErv699kQ8Dxn/vKR/QvJ6zCO2JqxzOpgX9RhXKA4BB5OwlXtorlO0SC
	cA=
X-Received: by 2002:a5d:64c3:0:b0:437:677d:42d with SMTP id ffacd0b85a97d-437677d05edmr15758012f8f.63.1770741603380;
        Tue, 10 Feb 2026 08:40:03 -0800 (PST)
Message-ID: <9cfd188d-b515-4d5e-8268-3ad51ee6b7e4@gmail.com>
Date: Tue, 10 Feb 2026 17:40:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Strip vcpu_switch_to_aarch64_mode() from PPC and
 RISC-V stubs
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20260210163445.2796291-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260210163445.2796291-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:tpearson@raptorengineering.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email,suse.com:email,amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,raptorengineering.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9D05D11D5DD
X-Rspamd-Action: no action


On 2/10/26 5:34 PM, Andrew Cooper wrote:
> This is absolutely too much copy&paste from ARM.  All other stubs look
> somewhat reasonable.
>
> No functional change.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Timothy Pearson <tpearson@raptorengineering.com>
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> ---
>   xen/arch/ppc/stubs.c   | 5 -----
>   xen/arch/riscv/stubs.c | 5 -----
>   2 files changed, 10 deletions(-)
>
> diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
> index f7f6e7ed97af..a333f06119a0 100644
> --- a/xen/arch/ppc/stubs.c
> +++ b/xen/arch/ppc/stubs.c
> @@ -162,11 +162,6 @@ void arch_vcpu_destroy(struct vcpu *v)
>       BUG_ON("unimplemented");
>   }
>   
> -void vcpu_switch_to_aarch64_mode(struct vcpu *v)
> -{
> -    BUG_ON("unimplemented");
> -}
> -
>   int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>   {
>       BUG_ON("unimplemented");
> diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
> index acbfde79b5a7..d071c8b86d07 100644
> --- a/xen/arch/riscv/stubs.c
> +++ b/xen/arch/riscv/stubs.c
> @@ -126,11 +126,6 @@ void arch_vcpu_destroy(struct vcpu *v)
>       BUG_ON("unimplemented");
>   }
>   
> -void vcpu_switch_to_aarch64_mode(struct vcpu *v)
> -{
> -    BUG_ON("unimplemented");
> -}
> -

These changes looks good to me:
  Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks for cleaning it up.

~ Oleksii


