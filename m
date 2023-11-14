Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13ECD7EB441
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 16:57:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632853.987358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2vmW-0002NN-7J; Tue, 14 Nov 2023 15:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632853.987358; Tue, 14 Nov 2023 15:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2vmW-0002Kq-4i; Tue, 14 Nov 2023 15:56:52 +0000
Received: by outflank-mailman (input) for mailman id 632853;
 Tue, 14 Nov 2023 15:56:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1wlO=G3=desiato.srs.infradead.org=BATV+c0bb53cb81094deeb936+7387+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r2vmV-0002Kk-EO
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 15:56:51 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b176942-8306-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 16:56:48 +0100 (CET)
Received: from [12.186.190.2] (helo=[127.0.0.1])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1r2vmM-002YdA-0t; Tue, 14 Nov 2023 15:56:42 +0000
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
X-Inumbo-ID: 6b176942-8306-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JfeV0qK8CgxsVSu2eoR2UV6eTjBlrnZLZoYR1NzgBIE=; b=bgwhwUbvJ39iHovOHLIjZRuYBI
	iqXx8yCvVgl16/UeT3qm+ITCuxnj7dx/R19vrz6jG4ClQBKJZB2HlsWRvTfgl7QINLlnCDSniROfZ
	TvXrdS6AObLK2YQuW5WAgCoSqIW6+6pjppciWZKYJ4LxHBad9Zo/xlQFXy+D1v5IoJxWevGiF4C3H
	jvUOBc8KZLf+Dg/5oCTe0K00sFe/Di6RytUaBWsDh3pwdCsLv/shZtt5AXYtqV5CAepgDLUx3ULWm
	/4/pOMD7KYrL3+skL+3V8pO4O1Q0c5Dz+kPmNHK5F/rzeI5WrIWKFi3LAtjNrsms6s3kuYjw8XEUj
	Oj643nXA==;
Date: Tue, 14 Nov 2023 10:56:38 -0500
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 David Woodhouse <dwmw@amazon.co.uk>, qemu-devel@nongnu.org
CC: =?ISO-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
 Paul Durrant <paul@xen.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>, kvm@vger.kernel.org,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH-for-9=2E0_v2_18/19=5D_hw/i386/xe?= =?US-ASCII?Q?n=3A_Compile_=27xen-hvm=2Ec=27_with_Xen_CPPFLAGS?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20231114143816.71079-19-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org> <20231114143816.71079-19-philmd@linaro.org>
Message-ID: <F6740A4D-7968-4F51-835E-E50AD646468B@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

On 14 November 2023 09:38:14 GMT-05:00, "Philippe Mathieu-Daud=C3=A9" <phil=
md@linaro=2Eorg> wrote:
>xen-hvm=2Ec calls xc_set_hvm_param() from <xenctrl=2Eh>,
>so better compile it with Xen CPPFLAGS=2E
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>

Reviewed-by: David Woodhouse <dwmw@amazon=2Eco=2Euk>


