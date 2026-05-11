Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGd+F2GkAWq+hAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 11:41:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B97E450B21B
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 11:41:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1305939.1578048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMN8r-0000yE-JZ; Mon, 11 May 2026 09:41:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1305939.1578048; Mon, 11 May 2026 09:41:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMN8r-0000wF-Gv; Mon, 11 May 2026 09:41:37 +0000
Received: by outflank-mailman (input) for mailman id 1305939;
 Mon, 11 May 2026 09:41:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wMN8p-0000w9-DP
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 09:41:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMN8n-0044AH-4x
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 11:41:34 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a01a430-5cb7-0a2a0a5109dd-0a2a4509894a-46
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 11:41:34 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a01a44e-2497-0a2a45090019-d1558033b105-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 11:41:34 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4893940bb5eso24218605e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 02:41:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e7040a9a9sm300943895e9.9.2026.05.11.02.41.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2026 02:41:33 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778492494; x=1779097294; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=n/f9AUUPGmipxjgK19TT0cQ/OJNmx4x1CYlAHdHnG24=;
        b=alE5gjly2wpiXDV4NAQnyQkdCi7k+0lN3InA9kjl6rhe/0DFVIaKw26htc7kioL2qf
         hqfgh8SKYiwAEWFLhx6BiA9I3ugeXg+pvxDU3no1vSDUb/f6b3LycnKXYcb+kdmtJ5w4
         Xyp7q9J50RagJ8g5Z3QE+9dVAWeLDN3c1NufUb6hT9jJavtha1oxc5yym0/meGspXgTC
         SA2HAX52LPHmQFGTPiec40rGI16aDnEcEsl7klq1bEpXXITJM9hVnAW8Z8BL7ZzMjPb5
         tAEHO+dLYAUJ6flAWxEW4yj8ddWeMBUL09Ezi7NyrFP1zHdPzUPwA0oIFi4wFymlrdtU
         duJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778492494; x=1779097294;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/f9AUUPGmipxjgK19TT0cQ/OJNmx4x1CYlAHdHnG24=;
        b=e6YvwNPGIPRrxEBYkHOfVGWjk6itxkADl5TuYenDDgbiLRwSSrlbFe+P6GvLknQ3OB
         R7mPergkgAa97qlYIV/cZI70VjTa1Crhq6kuz+pa1GxZuojpADNU2sWy70WmWWK+NJ6T
         Fp4EixtKI2nbjLNWyk4FrpcDKzfR9KdnTlWru+9WGqty1TnGmKu4a12KesR1SEmNfZhj
         f1X1uJxt9Fygp4lbL7BBWUDNmCMHljcO8YBZ2wASZ6I2Ka1+HUBU5fC7zgTrFIQXfuDg
         9m1E9uaTqWyvWPwQdYvolCfo7N+JHqqd/QnIkVh5JPNAWwkV13o0UpcZxUcqy11xbGdJ
         ejuA==
X-Forwarded-Encrypted: i=1; AFNElJ/eTO73bi/iYbn22ITO3lQGSyZRwCAb2nO7CNrLxfZ3v9RxW285zLON7K4C3PacO8kyHiaAVfRhoc4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyteRU6FQ30Yd/WfNsU/Ml5rsAO4zEjUQrzWkUOX+ZEUjcXfcc4
	AOeLMFT9FiJ3sQxIgN2KgssKU54cWLipGloH0rQ90Q9GQlVTH/1lMXd0cd8T3Z2xlg==
X-Gm-Gg: Acq92OHWQuLA4EMgSuolTFYR/41/+/DK32qrMy4HuhgTBIDmRpMbXTG7bMOJ1lO2G4s
	0DmnFng45t5c/tzIQtVpnoDCZ8H2dqIdRzBij40iqhYYmh/WILOo9IJalb5V7/APIUbyAaVnvsw
	S/fqjguTnoY+Bc5PQsL0ar8K/G3AHgfs91kPXU8AuJVuBHiU+hoKJQxQ5XoA0SChPQngIVZClPN
	lM6l/oJmNnD3x1Zvqb5s7oi5gxhkK4ffRvzAu6vrp8r7Vuw8GMAk9dwJU90mceyypizva3rslYo
	q0a5PS44dGlx8CDxspy0uQC97reIeSblxVIsatguM/P7c20AEbm0XmL8yRDEgnbBI9D7q+dQ0BY
	Ba1gmmoyOd71a5Pb5yOdrFbyzdFGPbzPgboJH8Uflst39hXA9wPBU8ZExpRyltBiBNr6G5IKpEd
	UsVrF72pdrpCyIrEWzYONSJJqn59hNUf8v6qfTGaf9PSoldBBUR/HzuSLDlyKp7v78Nd2kLP2A7
	4oduZ2Ha5VDAZI=
X-Received: by 2002:a05:600c:8904:b0:488:a916:14a8 with SMTP id 5b1f17b1804b1-48e6767ddf9mr150619235e9.10.1778492494101;
        Mon, 11 May 2026 02:41:34 -0700 (PDT)
Message-ID: <2a6117e6-e458-4818-9c22-0c356982eb59@suse.com>
Date: Mon, 11 May 2026 11:41:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Code freeze for 4.22 started on May 11, 2026
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Community Manager <community.manager@xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <e21070ac-3a84-4ad7-a4d1-9178d89c1435@gmail.com>
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
In-Reply-To: <e21070ac-3a84-4ad7-a4d1-9178d89c1435@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1778492494-8A589A53-FD705782/0/0
X-purgate-type: clean
X-purgate-size: 541
X-Rspamd-Queue-Id: B97E450B21B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:committers@xenproject.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 11.05.2026 11:35, Oleksii Kurochko wrote:
> I would like to inform you that Code freeze period is started and will 
> be until Fri Jun 05, 2026 (+4 weeks from Feature freeze).
> 
> Bugfixes may continue to be accepted by maintainers without R-Ack.

Gives me context to ask right away: "x86/mwait-idle: sync up with Linux
7.0-rc" has had a few small adjustments and hence would want re-posting.
Question is: Does that even make sense at this point, i.e. would you
give it a release-ack despite it not all being bug fixes?

Jan

