Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A279F7EB35C
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 16:20:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632796.987228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2vCu-00055i-EM; Tue, 14 Nov 2023 15:20:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632796.987228; Tue, 14 Nov 2023 15:20:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2vCu-00052N-BY; Tue, 14 Nov 2023 15:20:04 +0000
Received: by outflank-mailman (input) for mailman id 632796;
 Tue, 14 Nov 2023 15:20:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eqXQ=G3=casper.srs.infradead.org=BATV+a8e905033730cff805ca+7387+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r2vCt-0004pW-Fa
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 15:20:03 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 483965f6-8301-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 16:20:02 +0100 (CET)
Received: from [12.186.190.2] (helo=[127.0.0.1])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1r2vCn-008fhY-Fa; Tue, 14 Nov 2023 15:19:57 +0000
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
X-Inumbo-ID: 483965f6-8301-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=8oHKIB2Z25t55M8rg997hmml2qBzYjJja9p3MLoID9Q=; b=MGoU06Rd2CU4tijjS4zit7AS2o
	EK5W2DNxSaap5vdRgr4lcPo4zGcIOq4atxzna3eoqsGisnNIWyNGw93pjsrw6oaP0WFFFgVLYBQZz
	ClKfV7KrSJ1t1EoRo2xxMOh1jnYJshbl0jbHkjAa9cxj5rwxiL2k2+h7xbdzuUF4pLtlgUmOSkME0
	Uq+kwwckEVCRyY9c0wqtGkbt3pl09tWIQNEMt3G1DMKTQtlMxIhdejhXq5Fe0Y7D6jA34FrWF434P
	xU+RMJD/6Br8s11hd/K1O0XHW4bEY9r2voia+3nEj2IVrY/SvDOKzxr05FZJRtBMRX8gdRMisqfgH
	oej8JDZQ==;
Date: Tue, 14 Nov 2023 10:19:51 -0500
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
In-Reply-To: <04917b57-d778-41a2-b320-c8c0afbe9ffb@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org> <20231114143816.71079-2-philmd@linaro.org> <94D9484A-917D-4970-98DE-35B84BEDA1DC@infradead.org> <407f32ee-e489-4c05-9c3d-fa6c29bb1d99@linaro.org> <074BCACF-C8D0-440A-A805-CDB0DB21C416@infradead.org> <04917b57-d778-41a2-b320-c8c0afbe9ffb@linaro.org>
Message-ID: <37D11113-662D-49FD-B1F1-757217EAFEEA@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

On 14 November 2023 10:13:14 GMT-05:00, "Philippe Mathieu-Daud=C3=A9" <phil=
md@linaro=2Eorg> wrote:
>On 14/11/23 16:08, David Woodhouse wrote:
>> On 14 November 2023 10:00:09 GMT-05:00, "Philippe Mathieu-Daud=C3=A9" <=
philmd@linaro=2Eorg> wrote:
>>> On 14/11/23 15:50, David Woodhouse wrote:
>>>> On 14 November 2023 09:37:57 GMT-05:00, "Philippe Mathieu-Daud=C3=A9"=
 <philmd@linaro=2Eorg> wrote:
>>>>> Add a tag to run all Xen-specific tests using:
>>>>>=20
>>>>>    $ make check-avocado AVOCADO_TAGS=3D'guest:xen'
>>>>>=20
>>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>>>>> ---
>>>>> tests/avocado/boot_xen=2Epy      | 3 +++
>>>>> tests/avocado/kvm_xen_guest=2Epy | 1 +
>>>>> 2 files changed, 4 insertions(+)
>>>>=20
>>>> Those two are very different=2E One runs on Xen, the other on KVM=2E =
Do we want to use the same tag for both?
>>>=20
>>> My understanding is,
>>> - boot_xen=2Epy runs Xen on TCG
>>> - kvm_xen_guest=2Epy runs Xen on KVM
>>> so both runs Xen guests=2E
>>=20
>> Does boot_xen=2Epy actually boot *Xen*? And presumably at least one Xen=
 guest *within* Xen?
>
>I'll let Alex confirm, but yes, I expect Xen guest within Xen guest withi=
n TCG=2E So the tags "accel:tcg" (already present) and "guest:xen"=2E
>
>> kvm_xen_guest=2Epy boots a "Xen guest" under KVM directly without any r=
eal Xen being present=2E It's *emulating* Xen=2E
>
>Yes, so the tag "guest:xen" is correct=2E
>
>> They do both run Xen guests (or at least guests which use Xen hypercall=
s and *think* they're running under Xen)=2E But is that the important class=
ification for lumping them together?
>
>The idea of AVOCADO_TAGS is to restrict testing to what you want to cover=
=2E So here this allow running 'anything that can run Xen guest'
>in a single command, for example it is handy on my macOS aarch64 host=2E

Ok, that makes sense then=2E Thanks for your patience=2E

Reviewed-by: David Woodhouse <dwmw@amazon=2Eco=2Euk>


