Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBb3DZPlhWnCHwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 13:58:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D505FFDCB4
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 13:58:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223189.1530782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voLPM-0006R5-41; Fri, 06 Feb 2026 12:58:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223189.1530782; Fri, 06 Feb 2026 12:58:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voLPM-0006Oy-0d; Fri, 06 Feb 2026 12:58:00 +0000
Received: by outflank-mailman (input) for mailman id 1223189;
 Fri, 06 Feb 2026 12:57:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RA+/=AK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1voLPK-0006Os-GW
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 12:57:58 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 757dbe33-035b-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 13:57:57 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b8ea3d15580so87374466b.0
 for <xen-devel@lists.xenproject.org>; Fri, 06 Feb 2026 04:57:57 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8edacb18d0sm79499466b.40.2026.02.06.04.57.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Feb 2026 04:57:56 -0800 (PST)
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
X-Inumbo-ID: 757dbe33-035b-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770382677; x=1770987477; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BBgIkJRx76QyS8sZ0e4NRUt9O0kSm6br4RWWPw5x1C8=;
        b=iIeJtz5SuJeZhJ8lak7bgIEQ6Sc5fpoBTtT48HIL3LliSc3oimeBDm978mgkhELyGM
         N4FDzLvgYoVWvzTaia10NN0HtpyZi09EI/VcevXd+LHNarf7dFUVzlccNsehy01v3gpQ
         cQ3CJqL5YJipjvH+QaIQ44nJeEg7Q146Lpw4dDqAuZ+unZtF7X9YhvQGzuA+v3lAo1iX
         eKOYc26z5mp8dyIzuV4ZVMrXzPHuVYPQnqhK5T/cDQjGuDajW9m7hc1HOGeCuR9bRVmX
         ijF8KbixLmBT6oQ5i9R73xIFIQURTo3qD0ynBxDTVu77qTdWKAOnL2ZLriZUZyjpcmDB
         +JNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770382677; x=1770987477;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BBgIkJRx76QyS8sZ0e4NRUt9O0kSm6br4RWWPw5x1C8=;
        b=dMlymiLuT1YtJY7+Hb5DIrZlcFfPlq2dFlM0Txl4325y0JtJz6a1BBgmCIg9zjeWzo
         lYhwKdYVvl986KqsBanlI8qH2EvG+Ux7CUfsN7FUAP6EzltJIjH5BTM0bMsHiyZQv8EU
         su2iK8tLv05n9jzK+3C8evlLQNHdU+MIZaEFxSOj1P1R5Wl+C+5G7upQPoT78Ue5RITW
         Zx/rkYpUbyt87x7EugVM6RJpxEiBEDh9bb+dFlO5O2AEx64qdsSpV4pwscmnPZbuYKWX
         GpLp5/3KFEgwt4oCk/Ar7rudMxXSFCS46JY8hzDPIM40I5u6n9sdzeAfjM1INUfSFPFA
         LC/w==
X-Forwarded-Encrypted: i=1; AJvYcCWhHrUbj4gte/v/y4d1U9WZAtonTzE92dRjaMpDPD9k7wJ7UyaX4HU2lzuOAlxkpXhw5RPWy06BLKk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3FHhdZcKzldIyRsJfunsSyWGjqsF3pGLDSabdLzY0eCb3Uel3
	NDAVk9m3gAib2gbdV4o3ocpYC92V0D4Hx9YBXYU9aWoyStyX+BPZ+tuN
X-Gm-Gg: AZuq6aInBDru+4uUIwSmsdNNS9z2D/Yq3pMvhkX9ci1EYUiDpqdZinxesGTXKhCWW+W
	b6go+9Q/4ImoeiOuHzW3MM7FgIvpaNXnX3DbBlLe1hMVsQbCbPJGMZxQxBrW6FRUn2D0+6umseF
	F+z78y7i4M78EuhLRFnKcI4BfBVlPi1q0cPyql/xInn09e1r6o+IWV1SFXkqyGrcvSmtVdT5yHy
	tMyYbThp2igvfPYJ6M5pIewihhO5xTe8/SCMJvwozA6irla6CFc4iKBj2zmHgX7U/RqJxetp3xS
	q/cv+Wbz7aJRm18vkAsCQVH0LLHRkdd+eOR0Kzj6x2oXYn0PwMgeqjRJZipvhG7aoRkjR760ySf
	VockPh3TBA6KbZZDIrzkuVejTZtkzLurUwthqgoa8EFUfGMSx0NbmSJ2X4XBix8mduJtz6iBG1l
	GctuAokKtgc4Svlk4IUw1uWFiEsXZEi5XcRwnZHwmBercQFODzjis5iin4FAmDIRg=
X-Received: by 2002:a17:907:a05:b0:b87:756b:cfab with SMTP id a640c23a62f3a-b8edf2faa52mr155963466b.36.1770382676601;
        Fri, 06 Feb 2026 04:57:56 -0800 (PST)
Message-ID: <1beb7c04-5c21-4ba2-a74e-467f659224e5@gmail.com>
Date: Fri, 6 Feb 2026 13:57:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched: move vCPU exec state barriers
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Juergen Gross <jgross@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>
References: <1e2df446-b116-4861-a396-b87895a96c67@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1e2df446-b116-4861-a396-b87895a96c67@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:sstabellini@kernel.org,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:jgross@suse.com,m:dfaggioli@suse.com,m:gwd@xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D505FFDCB4
X-Rspamd-Action: no action


On 2/5/26 12:33 PM, Jan Beulich wrote:
> The barrier in vcpu_context_saved() is specifically about the clearing of
> ->is_running. It isn't needed when we don't clear the flag.
>
> Furthermore, one side of the barrier being in common code, the other would
> better be, too. This way, all architectures are covered (beyond any
> specific needs they may have).

Don't we want then move ...

>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -333,17 +333,7 @@ void sync_local_execstate(void)
>   
>   void sync_vcpu_execstate(struct vcpu *v)
>   {
> -    /*
> -     * We don't support lazy switching.
> -     *
> -     * However the context may have been saved from a remote pCPU so we
> -     * need a barrier to ensure it is observed before continuing.
> -     *
> -     * Per vcpu_context_saved(), the context can be observed when
> -     * v->is_running is false (the caller should check it before calling
> -     * this function).
> -     */
> -    smp_rmb();
> +    /* Nothing to do -- no lazy switching */
>   }

... to common code with ability to re-define sync_vcpu_execstate() by arch
as only x86 does something inside this function?

~ Oleksii


