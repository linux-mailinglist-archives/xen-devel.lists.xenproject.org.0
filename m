Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCEnKOgavGlEsQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 16:48:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C41572CDF9E
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 16:48:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257326.1551739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3FbH-0000y8-B9; Thu, 19 Mar 2026 15:47:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257326.1551739; Thu, 19 Mar 2026 15:47:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3FbH-0000wB-8J; Thu, 19 Mar 2026 15:47:55 +0000
Received: by outflank-mailman (input) for mailman id 1257326;
 Thu, 19 Mar 2026 15:46:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q39+=BT=oss.qualcomm.com=punit.agrawal@srs-se1.protection.inumbo.net>)
 id 1w3FZm-0000qh-GL
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 15:46:22 +0000
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5701268-23aa-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 16:46:20 +0100 (CET)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62JFMZML3368471
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 15:46:18 GMT
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d00f9ksdh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 15:46:17 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-5ffb295babbso1571118137.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 08:46:17 -0700 (PDT)
Received: from localhost ([2a01:4b00:b703:c200:1ac0:4dff:fe39:5426])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486f8c40ccbsm129162465e9.9.2026.03.19.08.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 08:46:15 -0700 (PDT)
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
X-Inumbo-ID: c5701268-23aa-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DvNqP241qE8dFBqHq5L6qVz4
	ghSD7knOgVJYfSQ1B58=; b=Yld7gZy2Vwg7aTwn9M0NrrFrVWWy2GG/gLK7dKB6
	3Xxqr/TDd+CZGMnsnJPz/K3Qa/xinQn4bBim6e/SIY2lxHC59LsOg3Ir/Bzop+FN
	nXALqgBdEtgGwTx4hrDwAIgi3E++GbgchA/Tb9JqtNNJE0lGCxQFp70ZN7dnnhpb
	gA2H4CjR3pEBLlK1y3IKFMLVtPdf3IqARQSJUG53twBLZifGbwlK4ijMhGb9hsol
	oPtOLe3EiflHII4K6ErRMacybeKHiy5UDD1BRgXKQBSo5+2t7g6sdf7GTIUnXg7/
	1fuSHqndq50QugXJHsDKcZ6CqP2RsEPQJBrTEF2i7yH6vg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773935177; x=1774539977; darn=lists.xenproject.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DvNqP241qE8dFBqHq5L6qVz4ghSD7knOgVJYfSQ1B58=;
        b=CqxQm94IfnlklXJ5PLqXbhFv6S4VJk1UMPsnu1PJaXJGlOfniCzSGqMYn7Hpm53h4H
         kg0bWo4p16Sf4dkPY9OBtT19VbGko6wTi+7Q55vbG3gg8bhMsMyZOzdlPUEwQY6t/v9Q
         NavVZm4UpWjPbYZpOV/bjOT9ttKdgwgNIFdE+4NXP9lohYCDfdOGPo8UMAOiIodqlPky
         qzYE19h6X/y/0xUP/7/tJLgQw3vx7Cp8MjSuUEUGAlVd+GV7TgdHkNE2vhtK1O2a3xQL
         pKYhWtpuSX2E0C2OEx5a1tVJKMNkW7TA5c1gUrCYVJ8Nri4/s/WPxwOi2k/2iox0RP76
         z2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773935177; x=1774539977;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DvNqP241qE8dFBqHq5L6qVz4ghSD7knOgVJYfSQ1B58=;
        b=qkeIvdYYKnyrrgDaNaDnSPOolRMzIubdUxfor5umRTy5LVqZvWSWUv4JV605qZTmqG
         K03kMnhZ/kMJXOVlyM4uWgqrMEokWgD6lCXjt1I9YT7WQ3prqKrcSYp8f6ddVfBuqmpv
         qAxFMO2HjEcrvhWdW7/MdCG1HglgWXkSA7bO79KzrpV1oeyaqUFgEH6DVsQAzaGnkd/l
         PCzmtrm4XftpEGYy3i+zhJrGwgijAND+KEfRO+bIsURdwheRNxKbupAu9jtdi9XH9Awd
         GkfFro7NqSqgaF+0KT0RTjqnYWNSPQnBE8b0xlQFZL+6q8Dg27/AJFvZ6J3qozOcaoQD
         L3MA==
X-Forwarded-Encrypted: i=1; AJvYcCWvtkzHJmKTUL3/ufnknttA3rqgjR7t7aby0nLIBSEObENRQ0uvW4l7MP05g+hpP0sK1pGN/G/3EMw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLhVuA8n/nw/bEQCBPvrdz9J7n77sx+H2k7G5Eoc7sys/WCVMB
	+a5HvpiReE/zhKq176XE5wpFyD9PJqbjOFjid0N6mRci/zWLUfaFOLQwbaxEvABq0FozfIc1gwa
	blzOFdl1Nx8lNEOxQQqCBWFVhoBiO1Wwl7mBgC8kt4yDqET8QnDrYh/wvhoM3MM3mfCxECA==
X-Gm-Gg: ATEYQzwNzThoQjJ7a2Xh+TQkWDCYwFKVwdrY0+WCDt3eYllhRWqt/1tkT/mg2SKpFqC
	FP0SU9OiYupj6k6EgBlxgF33PyGhpjc+aY7V4jCcGbCrJiu2KpH1xDz4J3Kh3pIaLO0E1dHuHY/
	1FwJ1ej+fNp9pj9Hb0qyjiDCcIev1K47sz0XAjH616L4KnFYEIT048k6WeABS2Y6iltNI5gfSV4
	hWOB2I2IasEDWOoBwq+8WsFtMeEXKPvH/Zx8OW/Xw1Jh9/ONZEenKMNLUWG/GelndRcVu33S4u2
	lJGu2dWnZ07Oshz0+nN86gmax2POeL12KMUAogbqO51kdAtmMlSEuRtcbLmA3UlXKPQZ2/HkVlN
	egyKIJSDC8ExqoQFORh4RAsLW7XaGpuuHEeT4pw==
X-Received: by 2002:a05:6102:d89:b0:5ff:9d74:967b with SMTP id ada2fe7eead31-6027d330b13mr3043060137.20.1773935177055;
        Thu, 19 Mar 2026 08:46:17 -0700 (PDT)
X-Received: by 2002:a05:6102:d89:b0:5ff:9d74:967b with SMTP id ada2fe7eead31-6027d330b13mr3042963137.20.1773935176396;
        Thu, 19 Mar 2026 08:46:16 -0700 (PDT)
From: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
To: Chengwen Feng <fengchengwen@huawei.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Catalin Marinas
 <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Rafael J .
 Wysocki" <rafael@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah
 Khan <skhan@linuxfoundation.org>,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave
 Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>,
        "H . Peter
 Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
        Boris Ostrovsky
 <boris.ostrovsky@oracle.com>,
        Len Brown <lenb@kernel.org>, Sunil V L
 <sunilvl@ventanamicro.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Kees Cook
 <kees@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
        Sean
 Christopherson <seanjc@google.com>,
        Kai Huang <kai.huang@intel.com>,
        Tom
 Lendacky <thomas.lendacky@amd.com>,
        Thomas Huth <thuth@redhat.com>,
        Thorsten Blum <thorsten.blum@linux.dev>,
        Kevin Loughlin
 <kevinloughlin@google.com>,
        Zheyun Shen <szy0127@sjtu.edu.cn>,
        Peter
 Zijlstra <peterz@infradead.org>,
        Pawan Gupta
 <pawan.kumar.gupta@linux.intel.com>,
        Xin Li <xin@zytor.com>, "Ahmed S .
 Darwish" <darwi@linutronix.de>,
        Sohil Mehta <sohil.mehta@intel.com>,
        Ilkka Koskinen <ilkka@os.amperecomputing.com>,
        Robin Murphy
 <robin.murphy@arm.com>,
        James Clark <james.clark@linaro.org>,
        Besar
 Wicaksono <bwicaksono@nvidia.com>, Ma Ke <make24@iscas.ac.cn>,
        Wei Huang
 <wei.huang2@amd.com>,
        Andy Gospodarek <andrew.gospodarek@broadcom.com>,
        Somnath Kotur <somnath.kotur@broadcom.com>,
        <punit.agrawal@oss.qualcomm.com>, <guohanjun@huawei.com>,
        <suzuki.poulose@arm.com>, <ryan.roberts@arm.com>,
        <chenl311@chinatelecom.cn>, <masahiroy@kernel.org>,
        <wangyuquan1236@phytium.com.cn>, <anshuman.khandual@arm.com>,
        <heinrich.schuchardt@canonical.com>, <Eric.VanTassell@amd.com>,
        <wangzhou1@hisilicon.com>, <wanghuiqiang@huawei.com>,
        <liuyonglong@huawei.com>, <linux-pci@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
        <linux-riscv@lists.infradead.org>, <xen-devel@lists.xenproject.org>,
        <linux-acpi@vger.kernel.org>, <linux-perf-users@vger.kernel.org>,
        <stable@vger.kernel.org>
Subject: Re: [PATCH v9 1/7] arm64/acpi: Add acpi_get_cpu_uid() and switch
 arm_cspmu to use it
In-Reply-To: <20260319065735.45954-2-fengchengwen@huawei.com> (Chengwen Feng's
	message of "Thu, 19 Mar 2026 14:57:29 +0800")
References: <20260319065735.45954-1-fengchengwen@huawei.com>
	<20260319065735.45954-2-fengchengwen@huawei.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Date: Thu, 19 Mar 2026 15:46:14 +0000
Message-ID: <87341vq0u1.fsf@stealth>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDEyNCBTYWx0ZWRfX5S0rkx4BUgfK
 AHPlAxTJ/ZDkEHQ+vo+awAltIHEt0KvCjH6eWm9EPw8YvcziKhq8tOGDyF7C/bcKXJNmKXq2M8l
 l8mjxZ0ocKsbe/7aH8nPiR43XoGDk5Ghr1giwejsPL7bs6pMABfX5KwDFyNAqM4FB39O09XD09u
 SM8EKMLvWXnz4Y2vRBna5UirSohWd0sfpztoQve1WbsIM5rB8syalDZrl21UeCZQmD9XlW/fHKu
 C685jcpVpzihW5zBN5QOzbLKKvZYZvFAjZDFIQ889dggg7YptzfV2JbtWUmsc69EGcMnH8nZIdw
 RbDPjxwHFYgRu+NpO8bZaygZiPjR9ZQ+KmcYVxFlq9CmkyKqf+esguYUPHQ9R3zRzks9zIv14Sa
 2618qqkDPcbKGxJZwNXcKOCXoBksszm70qu8cASbCBXFkkQgtWeLqhZZJYFL8r5oiSwxQxkaMa0
 iTwwn8FgpxpRiveyjCQ==
X-Proofpoint-GUID: ngJoS0GrslX8GBmSgO2-fK44nja0h8ut
X-Proofpoint-ORIG-GUID: ngJoS0GrslX8GBmSgO2-fK44nja0h8ut
X-Authority-Analysis: v=2.4 cv=MJttWcZl c=1 sm=1 tr=0 ts=69bc1a49 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=i0EeH86SAAAA:8 a=VwQbUJbxAAAA:8
 a=Gl9ZV0r3yxOOH3mhj0oA:9 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190124
X-Spamd-Result: default: False [-0.19 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:fengchengwen@huawei.com,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:rafael@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:lenb@kernel.org,m:sunilvl@ventanamicro.com,m:mark.rutland@arm.com,m:jonathan.cameron@huawei.com,m:kees@kernel.org,m:si.yanteng@linux.dev,m:seanjc@google.com,m:kai.huang@intel.com,m:thomas.lendacky@amd.com,m:thuth@redhat.com,m:thorsten.blum@linux.dev,m:kevinloughlin@google.com,m:szy0127@sjtu.edu.cn,m:peterz@infradead.org,m:pawan.kumar.gupta@linux.intel.com,m:xin@zytor.com,m:darwi@linutronix.de,m:sohil.mehta@intel.com,m:ilkka@os.amperecomputing.com,m:robin.murphy@arm.com,m:james.clark@linaro.org,m:bwicaksono@nvidia.com,m:make2
 4@iscas.ac.cn,m:wei.huang2@amd.com,m:andrew.gospodarek@broadcom.com,m:somnath.kotur@broadcom.com,m:punit.agrawal@oss.qualcomm.com,m:guohanjun@huawei.com,m:suzuki.poulose@arm.com,m:ryan.roberts@arm.com,m:chenl311@chinatelecom.cn,m:masahiroy@kernel.org,m:wangyuquan1236@phytium.com.cn,m:anshuman.khandual@arm.com,m:heinrich.schuchardt@canonical.com,m:Eric.VanTassell@amd.com,m:wangzhou1@hisilicon.com,m:wanghuiqiang@huawei.com,m:liuyonglong@huawei.com,m:linux-pci@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:xen-devel@lists.xenproject.org,m:linux-acpi@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[punit.agrawal@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,huawei.com:email,qualcomm.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[punit.agrawal@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_GT_50(0.00)[70];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C41572CDF9E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Chengwen Feng <fengchengwen@huawei.com> writes:

> Add arch-specific acpi_get_cpu_uid() for arm64, and update dependent
> code:
> - Declare acpi_get_cpu_uid() in arch/arm64/include/asm/acpi.h
> - Implement acpi_get_cpu_uid() with input parameter validation
> - Replace get_acpi_id_for_cpu() with acpi_get_cpu_uid() in
>   drivers/perf/arm_cspmu/arm_cspmu.c
> - Reimplement get_cpu_for_acpi_id() based on acpi_get_cpu_uid() (to
>   align with new interface) and move its implementation next to
>   acpi_get_cpu_uid()

There is no benefit in describing the code changes like this in the
commit log. It makes it hard to follow the intent of the patch.

> This is the first step towards unifying ACPI CPU UID retrieval interface
> across architectures, while adding input validation for robustness.

I would simplify the commit log to something along the lines of -

    As a step towards unifying the interface for retrieving ACPI CPU uid
    across architectures, introduce a new function
    acpi_get_cpu_uid(). While at it, also add input validation to make
    the code more robust.

Just my 2c.

The code changes looks fine.

> Cc: stable@vger.kernel.org
> Signed-off-by: Chengwen Feng <fengchengwen@huawei.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> ---
>  arch/arm64/include/asm/acpi.h      | 14 ++------------
>  arch/arm64/kernel/acpi.c           | 30 ++++++++++++++++++++++++++++++
>  drivers/perf/arm_cspmu/arm_cspmu.c |  6 ++++--
>  3 files changed, 36 insertions(+), 14 deletions(-)
>
> diff --git a/arch/arm64/include/asm/acpi.h b/arch/arm64/include/asm/acpi.h
> index c07a58b96329..2219a3301e72 100644
> --- a/arch/arm64/include/asm/acpi.h
> +++ b/arch/arm64/include/asm/acpi.h
> @@ -118,18 +118,8 @@ static inline u32 get_acpi_id_for_cpu(unsigned int cpu)
>  {
>  	return	acpi_cpu_get_madt_gicc(cpu)->uid;
>  }
> -
> -static inline int get_cpu_for_acpi_id(u32 uid)
> -{
> -	int cpu;
> -
> -	for (cpu = 0; cpu < nr_cpu_ids; cpu++)
> -		if (acpi_cpu_get_madt_gicc(cpu) &&
> -		    uid == get_acpi_id_for_cpu(cpu))
> -			return cpu;
> -
> -	return -EINVAL;
> -}
> +int acpi_get_cpu_uid(unsigned int cpu, u32 *uid);
> +int get_cpu_for_acpi_id(u32 uid);
>  
>  static inline void arch_fix_phys_package_id(int num, u32 slot) { }
>  void __init acpi_init_cpus(void);
> diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
> index af90128cfed5..24b9d934be54 100644
> --- a/arch/arm64/kernel/acpi.c
> +++ b/arch/arm64/kernel/acpi.c
> @@ -458,3 +458,33 @@ int acpi_unmap_cpu(int cpu)
>  }
>  EXPORT_SYMBOL(acpi_unmap_cpu);
>  #endif /* CONFIG_ACPI_HOTPLUG_CPU */
> +
> +int acpi_get_cpu_uid(unsigned int cpu, u32 *uid)
> +{
> +	struct acpi_madt_generic_interrupt *gicc;
> +
> +	if (cpu >= nr_cpu_ids)
> +		return -EINVAL;
> +
> +	gicc = acpi_cpu_get_madt_gicc(cpu);
> +	if (!gicc)
> +		return -ENODEV;
> +
> +	*uid = gicc->uid;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(acpi_get_cpu_uid);
> +
> +int get_cpu_for_acpi_id(u32 uid)
> +{
> +	u32 cpu_uid;
> +	int ret;
> +
> +	for (int cpu = 0; cpu < nr_cpu_ids; cpu++) {
> +		ret = acpi_get_cpu_uid(cpu, &cpu_uid);
> +		if (ret == 0 && uid == cpu_uid)
> +			return cpu;
> +	}
> +
> +	return -EINVAL;
> +}
> diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
> index 34430b68f602..ed72c3d1f796 100644
> --- a/drivers/perf/arm_cspmu/arm_cspmu.c
> +++ b/drivers/perf/arm_cspmu/arm_cspmu.c
> @@ -1107,15 +1107,17 @@ static int arm_cspmu_acpi_get_cpus(struct arm_cspmu *cspmu)
>  {
>  	struct acpi_apmt_node *apmt_node;
>  	int affinity_flag;
> +	u32 cpu_uid;
>  	int cpu;
> +	int ret;
>  
>  	apmt_node = arm_cspmu_apmt_node(cspmu->dev);
>  	affinity_flag = apmt_node->flags & ACPI_APMT_FLAGS_AFFINITY;
>  
>  	if (affinity_flag == ACPI_APMT_FLAGS_AFFINITY_PROC) {
>  		for_each_possible_cpu(cpu) {
> -			if (apmt_node->proc_affinity ==
> -			    get_acpi_id_for_cpu(cpu)) {
> +			ret = acpi_get_cpu_uid(cpu, &cpu_uid);
> +			if (ret == 0 && apmt_node->proc_affinity == cpu_uid) {
>  				cpumask_set_cpu(cpu, &cspmu->associated_cpus);
>  				break;
>  			}

I think cspmu changes go via a separate pull request. You might have to
split this change into a separate commit.

