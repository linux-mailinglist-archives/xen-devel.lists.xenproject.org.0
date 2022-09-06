Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B155AE903
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 15:04:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399861.641231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVYEz-0008TP-Cd; Tue, 06 Sep 2022 13:03:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399861.641231; Tue, 06 Sep 2022 13:03:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVYEz-0008RL-8p; Tue, 06 Sep 2022 13:03:45 +0000
Received: by outflank-mailman (input) for mailman id 399861;
 Tue, 06 Sep 2022 13:03:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gBRN=ZJ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1oVYEx-0008Qo-BN
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 13:03:43 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5397ab2a-2de4-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 15:03:41 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1662469413122228.98779621741687;
 Tue, 6 Sep 2022 06:03:33 -0700 (PDT)
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
X-Inumbo-ID: 5397ab2a-2de4-11ed-a016-b9edf5238543
ARC-Seal: i=1; a=rsa-sha256; t=1662469415; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dQNZZNMBVGr0ay2duC2LgqAUT5e36Y/hY0tCQd1fCm1NBGAs1m9f8tdWdsnbqUtD2I5GFz68OHTRyB835JA+cpB+6xpDeffjV5bScaVL6B+8N01Ak+zZM5CrRN5BMz2ZA9KzxnkPmW4sXlsiZ4DZz5m7SiMGBA1m8YFH1szodR8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1662469415; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=R8Vmmbujb9hQkdWWvzPye+jAnykUiJ8pcszJcQ2IX64=; 
	b=k++Glc7bTZWx+RbgMkLSI1IHy/iiP4amJVo5zTbml88hwJO2EEyq3s4lKGmtylMjQoiUAf/n1HepFWCetOeirZ24VpIAzIkqEafZsyiycPamqJ7Xh/gqGJWJ7Qr2vWd4T76w9V/ifaQqgfI/Qa5vfFKcKubdYb2lrH166WQA5bM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1662469415;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=R8Vmmbujb9hQkdWWvzPye+jAnykUiJ8pcszJcQ2IX64=;
	b=bMrKlsk6VkyVfymQqUcRjcVkMKBacARnxBA3l+Zr/9Mf/W2bMitI/uw6V9P19Xrw
	u4nl80mqfm6nTlwXbluc7SL2oU8RtJwVOwfkJRW/gzuz9fZuXV0RVrFSWzO7ZG6WdAV
	R65Jsz9XwDXWoBFJmiqO3TBZ5NTDLxemWmwiHTjI=
Message-ID: <582d350e-938e-b53b-a7fd-56625437fe91@apertussolutions.com>
Date: Tue, 6 Sep 2022 09:03:31 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>,
 Jennifer Herbert <jennifer.herbert@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <20220830202706.1618386-1-jennifer.herbert@citrix.com>
 <CAKf6xptUEirC7zh32Sg8=Tde4b8Sw8wkcnMxJ=82KuxaoH0JbA@mail.gmail.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH] acpi: Add TPM2 interface definition and make the TPM
 version configurable.
In-Reply-To: <CAKf6xptUEirC7zh32Sg8=Tde4b8Sw8wkcnMxJ=82KuxaoH0JbA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 9/1/22 08:55, Jason Andryuk wrote:
> On Tue, Aug 30, 2022 at 4:30 PM Jennifer Herbert
> <jennifer.herbert@citrix.com> wrote:
>>
>> This patch introduces an optional TPM 2 interface definition to the ACPI table,
>> which is to be used as part of a vTPM 2 implementation.
>> To enable the new interface - I have made the TPM interface version
>> configurable in the acpi_config, with the default being the existing 1.2.(TCPA)
>> I have also added to hvmloader an option to utilise this new config, which can
>> be triggered by setting the platform/tpm_verion xenstore key.
>>
>> Signed-off-by: Jennifer Herbert <jennifer.herbert@citrix.com>
> 
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
> 
> Thanks.
> 
> Is there a particular reason why CRB (Command Response Buffer) was
> chosen over TIS (TPM Interface Specification)?  I think of CRB as more
> of an embedded device TPM interface, and TIS is what is usually used
> with physical TPMs.  My experiences have only been with TIS devices,
> so that is influencing my outlook.  Hmm, this patch seems to reference
> the Intel Platform Trust Technology (PTT) fTPM (firmware-TPM) as using
> the CRB interface:
> https://patchwork.kernel.org/project/tpmdd-devel/patch/1417672167-3489-8-git-send-email-jarkko.sakkinen@linux.intel.com/
>  If PTT fTPMs are using CRB, then it's more than just embedded
> devices..

This continues to create much confusion. There are two CRB interfaces,
one is the PC Client CRB interface defined in the TCG PTP specification,
which is based on an MMIO HW interface. There are claims that Intel's
PTT provided one, but I myself have never seen an MMIO CRB in the wild.
Then there is the Mobile CRB specification, which defines a
mailbox/doorbell HW interface, particularly for Arm devices. The Mobile
CRB interface has no notion of locality. As a result, there are ongoing
discussions on how the specifications may be normalized and enable
locality support for a mailbox/doorbell HW interface to support the
recent Arm DRTM specification.

v/r,
dps

