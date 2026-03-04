Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGsTBtA+qGl6rQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 15:16:48 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DB1201295
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 15:16:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245441.1544810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxn1P-0003yH-Va; Wed, 04 Mar 2026 14:16:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245441.1544810; Wed, 04 Mar 2026 14:16:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxn1P-0003wX-Sx; Wed, 04 Mar 2026 14:16:19 +0000
Received: by outflank-mailman (input) for mailman id 1245441;
 Wed, 04 Mar 2026 14:16:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xh4z=BE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vxn1P-0003wR-8W
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 14:16:19 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5aab99d-17d4-11f1-b164-2bf370ae4941;
 Wed, 04 Mar 2026 15:16:17 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4806cc07ce7so78664095e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2026 06:16:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851a8ea6c1sm12343105e9.11.2026.03.04.06.16.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 06:16:16 -0800 (PST)
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
X-Inumbo-ID: b5aab99d-17d4-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772633777; x=1773238577; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iWAMMFhGSYsl003M4aG2kfxFpIIqe0C5XbSQwJju3C0=;
        b=FAx7rUggOkD6Q2XR/zsLAHMraWORCQv1xo3G2FK5Rr1Zq+nxdGQclZ7SwAIVY5fSHz
         HXraC1VYmJR+KPeJGi3iPmlevYIjayQ9X3yYRqTOnYd0glx33/UZwPOUv2mO3JsZscU/
         sdxT1+3yyftPoXu4kzJjUmjM8lhdkQMtbGcynAVfZqhDJtlvEddlcqBBkMoGp8RWCjw3
         /rVRAmhmNjXXMjvdKHe9LZskgkQaXRTc2UhwvEe0lS0LhApuGgKxFq9kcZ1g4+Acuhce
         ba1hOnQlteQz9u23bVh+1YIcbcS8eWRWut0xt/d6YgE6OCiCwV3P0qDY/3kfWDjufqEX
         HCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633777; x=1773238577;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iWAMMFhGSYsl003M4aG2kfxFpIIqe0C5XbSQwJju3C0=;
        b=ZyFRBY2AlXUyghiWCoONpKhjxREveDo8CGaohyOvTcIloX9GN9puM8eC07ezyUrKqj
         EZZJe60IlZyOXFbogUJ3nri2MPMe3Ih/0xPTphFk+0xlkUzn+lKq1VMZ7QRFK0FpoaDE
         KsDlVcUN8q+8s7SMT5sY+k9LbFuDHdzZAv0FoWrxBsN8kap8cFBM9zLTOUETNfM7RHME
         59jaZHB94HRCiEQvs356yfLpAdfPkzfsvOJ7JO/fRoTCwNFBL+Zrzh1lnDBdqby+v9US
         clmNBR9PC7PCSOhekTpYDpWwX4iUjgSjPB+/akPDxds3cPWjEg4JWkZS7uctt5v2+lZE
         DVdw==
X-Gm-Message-State: AOJu0Yxl/8qTOLRN+zWPXf2S/kiGPd+hyu9laOgWWuCgqoNIq7PE2q90
	LZaQ3Td8a4FM/MKHK0QOYQQqsz9S2eOPEMYHfGhr9n90M4b0Wz74gTQMa6R7U98hvroQGVFrSQV
	ZnRw=
X-Gm-Gg: ATEYQzwUL85+xSzkwp+cjTD91x5cfeokA88M1xKMlPd10OulBT9ssFqdvps0nKEDUvH
	23FDgOH7EHWOo7Mf+AoSQW1VEmPO6UtAwg9dDG8FBqL/xy/H7Pu8/FW5nRoZFHkckKXuuuF2q0n
	k7wpAPFrPFWzIq5/C3C2J//1pxig8WA6DlXoTGfan/Xbfyd4vfey6EmePYes06TjtIUhjY1TrDO
	PMfbgb3pe2Gql/YeIo7HkqSFTD96+0hveOikhHPfwpUeXrOpZFzhTdi+6hkUFt1wzEDED5s6Vr9
	QHKXyCjDYFDkKMqnc0WUHeZzNhSYcjK3ExhDu08oYKDIGJcwvJb0jfDWNA81NIUWxDKaeQhqKs/
	RB8Q9GeJvwD5/mNL9uoVWm2Lr+XiW/I/NCAeTlyt9kg0jVkBLjxuYCVmO3O/E/TH4OH62h+rJ7y
	GsA2ARnQ5iZrlf470s59Po1tjBHehMbuUB9SDY8jsttITf8h0haXp2JMP8pQvWan1o4KKcBOC10
	JA2gFwzN+2wqzr4X3+UJKnFUw==
X-Received: by 2002:a05:600c:1e2a:b0:465:a51d:d4 with SMTP id 5b1f17b1804b1-48519848388mr31960925e9.6.1772633776800;
        Wed, 04 Mar 2026 06:16:16 -0800 (PST)
Message-ID: <573bebfd-af24-48ef-934a-74142c7139ee@suse.com>
Date: Wed, 4 Mar 2026 15:16:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: preparations for 4.21.1, 4.20.3, and 4.19.5
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>
Content-Language: en-US
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B0DB1201295
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:anthony.perard@vates.tech,m:community.manager@xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email,suse.com:dkim,suse.com:mid];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

All,

the releases are due in about two weeks. Please point out backport candidates
you find missing from the respective staging branches, but which you consider
relevant. Toolstack backport requests please go to
Anthony PERARD <anthony.perard@vates.tech>.

I have already queued (in addition to what went in today)
878a9cfa4518	x86/ucode: Support discrete modules being CPIO archives
a934a600c454	x86/pv: Don't assume that INT $imm8 instructions are two bytes long

Jan

