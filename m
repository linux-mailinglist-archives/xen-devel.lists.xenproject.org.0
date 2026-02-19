Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGDqMj44l2l2vwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 17:20:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD1616096E
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 17:20:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236569.1539246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt6ki-0006jH-IO; Thu, 19 Feb 2026 16:19:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236569.1539246; Thu, 19 Feb 2026 16:19:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt6ki-0006gq-Ef; Thu, 19 Feb 2026 16:19:44 +0000
Received: by outflank-mailman (input) for mailman id 1236569;
 Thu, 19 Feb 2026 16:19:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vt6kh-0006gk-50
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 16:19:43 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb149e07-0dae-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Feb 2026 17:19:40 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-436e87589e8so1166553f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Feb 2026 08:19:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ad0166sm50860604f8f.35.2026.02.19.08.19.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 08:19:39 -0800 (PST)
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
X-Inumbo-ID: cb149e07-0dae-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771517980; x=1772122780; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ql2Nt2Ea+aMvTlqF6cbBN8BiyHfVVPyd+7TbpqYmClI=;
        b=EFzxSDNWcjPrXdtZ4k6kZ1mEuoK5U1h7iqobLJmV1FrjHgfJOsmLkE0wz9rh5WL7Yz
         GNErgzt8cdvEQvERcm73AmpRKyAugkIfPYT6fmDWeLSmvceRfCvaU5QjCcHo4zGEYNRw
         6tpTnt/Vdl5z6oWvsXByLStC60zeqPrXvium3A4yeKBQMgN4Om3aFO6XblBsLJuJPiU9
         yO8oIkt17RuJFA70goJFZUOQ/36SQiHp20+tjF3tipLeawy1nKFJrdBn9iL1vGycB7go
         hdG+rvnVSufmp6YGN7jIhulfg22qLE5n1sg0hk1dRkSCOAdZGGclV3wqdU8eb4DTcdR2
         siJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771517980; x=1772122780;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ql2Nt2Ea+aMvTlqF6cbBN8BiyHfVVPyd+7TbpqYmClI=;
        b=p6UhodT6vk02Q0W25VrcfSCdX2mouhHLioe+WJFJaaRscOx6EO+h/d7G80YHDOuR7F
         rYddowpth/3PzUNI04G4BgrDnEJqpKE3KYWsVD8TY1tglpDrG1duJYyEjV3tJpGEqOqJ
         A4Vi6xf4C2PIK08ovDvEmIquQcoxZZbJwScmALk0T7MxRRDLQhCiQ93cdbSBNxNZuOwh
         KI8SznsItem2KQG8dJu/PJe6aAsMd7munuZTZ52ZRgp2ogzGrCD254RgpaT42XzZ19v+
         8AWGys1UKP5Uf77/avDPHExuM1058jb5fvJ4iJgGpaXC3/klgBljs528sFyfkANnyNLz
         ykgg==
X-Forwarded-Encrypted: i=1; AJvYcCVWhjcw1PLZ2AB/wEF08+pJOHo7pzqCjNqRzL/COE5RLy5MVJdMX9/e+mfVRA7nifixZ+V5gJmQ+gI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx8yBRrLZvVS7+sKD6LjlccqWq5qfF6ymuZIIgBFkWdpH3z5Uma
	avRvbe1/oqFKpaBZcWpGMunhSL+XkRz/y9OLbh4MFWr9UcSLWKmzHLFSvXTkShSlGw==
X-Gm-Gg: AZuq6aKEw4Dn/3kaAePAVjqDlXImfDfh9WDsM1A1ErQa20YolekYr3HQhLUufgTWBRc
	BFHy2sjoBvwGqffUXXQWKDNIyXXy1y47DwRQd7P/cpm06ofFlRC0gd1gdtTgt3XPQ8wcFWqXUtk
	rr+TK/jCbcpDX3AQhR5BmnX3AktlS+K2NkTZ0YSqmWz2GlC2sg5G0Lyy5Q1DcqD8XNAOmnrXmTu
	kk+0npl2pmlsh2ujiYfJrF4gGJUzNJo22q1ZTN3eM8SWGWUphbHc6tEfB3GPpO1L54OGZrlozFC
	Bf2Nn2Prl/DibZOEX8gTrBguyq/YNvGykoLtryD0ulD8n5ZrvJ4vxJgg1MGS6i2VLbAaPDz4kfb
	3ItU063CXvNroQQNPKc44V2AK/sIogVpCDbaK8CXjMeZYmcLs/JI625OicA9V6h95ihQuiYn5TN
	Xay9lprc14+4IZ/TI/TsV3WHJnPcp/sjWFq8hLWBkwW649MWtoWfsTUQcaDPF5WXq9tnAkPJpxN
	jNjYCwBfI9+IGM=
X-Received: by 2002:a5d:64c9:0:b0:437:74f6:f3aa with SMTP id ffacd0b85a97d-4379792bcbbmr44330641f8f.56.1771517980241;
        Thu, 19 Feb 2026 08:19:40 -0800 (PST)
Message-ID: <67168bee-6a59-49ce-afcd-85df406679e2@suse.com>
Date: Thu, 19 Feb 2026 17:19:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] x86/svm: Add Enumerations for the SVM virtual NMI
To: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
Cc: roger.pau@citrix.com, teddy.astie@vates.tech, jason.andryuk@amd.com,
 andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
References: <cover.1771424278.git.abdelkareem.abdelsaamad@citrix.com>
 <a3dd02ed3a01c5aaae804bc69f494de2a47a75f0.1771424278.git.abdelkareem.abdelsaamad@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <a3dd02ed3a01c5aaae804bc69f494de2a47a75f0.1771424278.git.abdelkareem.abdelsaamad@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,vates.tech:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:abdelkareem.abdelsaamad@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jason.andryuk@amd.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1FD1616096E
X-Rspamd-Action: no action

On 18.02.2026 15:48, Abdelkareem Abdelsaamad wrote:
> Introduce the cpuid bit for the SVM vNMI feature support for the x86\AMD
> platforms. The feature support is indicated by the CPUID
> Fn8000_000A_EDX[25] = 1.
> 
> Add defines for the three SVM's Virtual NMI (vNMI) managements bits in the
> VMCB structure's vintr_t:
> 
> vintr_t(11) - Virtual NMI is pending.
> vintr_t(12) - Virtual NMI is masked.
> vintr_t(26) - Enable NMI virtualization.
> 
> Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
> Reviewed-by: Teddy Astie <teddy.astie@vates.tech>

Acked-by: Jan Beulich <jbeulich@suse.com>


