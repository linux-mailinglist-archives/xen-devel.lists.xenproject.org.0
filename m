Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 477DA7EB307
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 16:08:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632760.987158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2v1a-0005B2-SF; Tue, 14 Nov 2023 15:08:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632760.987158; Tue, 14 Nov 2023 15:08:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2v1a-00058l-Pb; Tue, 14 Nov 2023 15:08:22 +0000
Received: by outflank-mailman (input) for mailman id 632760;
 Tue, 14 Nov 2023 15:08:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eqXQ=G3=casper.srs.infradead.org=BATV+a8e905033730cff805ca+7387+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r2v1Z-00058f-GJ
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 15:08:21 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5776f36-82ff-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 16:08:20 +0100 (CET)
Received: from [12.186.190.2] (helo=[127.0.0.1])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1r2v1Q-008cvI-6u; Tue, 14 Nov 2023 15:08:12 +0000
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
X-Inumbo-ID: a5776f36-82ff-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=gPlTnLrWpPWWoUPGEpERtBAlyTDR8Uk7y5kKdp/k5WQ=; b=u1gqmmwUiYpHqi0uHXy3+ToCOg
	KHEul+myRl+dxaYk/qNKWcNttIq8/dZePgwrAoIO8+fIFGcpyX/LBLL2RF3dFIzW6YXDETCZ5hfdq
	YZnC8QwR/QP/IvY2HE0U0K/ebiBiubW4IMEq4rDgmwiw4LF9zQ9Px1M/iVxncLveLC5156Q51zRLu
	GjIunmXq7yWhG/pb+jRvc4LqTUV4u3FdRaGslz3bGN3HeiCKr/xGZcicCi1VgEx37L59bWG6O/YPG
	/eR3o3YdWcexfFKmcOp0M3zHSiDW5cr8dZvQU9Ui86+l8t77xJryJcV0HGOzffZh0FI7e30+d1pvR
	v+oQjvuA==;
Date: Tue, 14 Nov 2023 10:08:09 -0500
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
 Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH-for-9=2E0_v2_01/19=5D_tests/avocado=3A_A?= =?US-ASCII?Q?dd_=27guest=3Axen=27_tag_to_tests_running_Xen_guest?=
User-Agent: K-9 Mail for Android
In-Reply-To: <407f32ee-e489-4c05-9c3d-fa6c29bb1d99@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org> <20231114143816.71079-2-philmd@linaro.org> <94D9484A-917D-4970-98DE-35B84BEDA1DC@infradead.org> <407f32ee-e489-4c05-9c3d-fa6c29bb1d99@linaro.org>
Message-ID: <074BCACF-C8D0-440A-A805-CDB0DB21C416@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

On 14 November 2023 10:00:09 GMT-05:00, "Philippe Mathieu-Daud=C3=A9" <phil=
md@linaro=2Eorg> wrote:
>On 14/11/23 15:50, David Woodhouse wrote:
>> On 14 November 2023 09:37:57 GMT-05:00, "Philippe Mathieu-Daud=C3=A9" <=
philmd@linaro=2Eorg> wrote:
>>> Add a tag to run all Xen-specific tests using:
>>>=20
>>>   $ make check-avocado AVOCADO_TAGS=3D'guest:xen'
>>>=20
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>>> ---
>>> tests/avocado/boot_xen=2Epy      | 3 +++
>>> tests/avocado/kvm_xen_guest=2Epy | 1 +
>>> 2 files changed, 4 insertions(+)
>>=20
>> Those two are very different=2E One runs on Xen, the other on KVM=2E Do=
 we want to use the same tag for both?
>
>My understanding is,
>- boot_xen=2Epy runs Xen on TCG
>- kvm_xen_guest=2Epy runs Xen on KVM
>so both runs Xen guests=2E

Does boot_xen=2Epy actually boot *Xen*? And presumably at least one Xen gu=
est *within* Xen?

kvm_xen_guest=2Epy boots a "Xen guest" under KVM directly without any real=
 Xen being present=2E It's *emulating* Xen=2E

They do both run Xen guests (or at least guests which use Xen hypercalls a=
nd *think* they're running under Xen)=2E But is that the important classifi=
cation for lumping them together?


