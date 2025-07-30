Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DE6B15E68
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 12:42:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063780.1429515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh4Ga-0004hp-M6; Wed, 30 Jul 2025 10:42:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063780.1429515; Wed, 30 Jul 2025 10:42:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh4Ga-0004fl-Ip; Wed, 30 Jul 2025 10:42:36 +0000
Received: by outflank-mailman (input) for mailman id 1063780;
 Wed, 30 Jul 2025 10:42:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2yBn=2L=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uh4GZ-0004ff-2M
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 10:42:35 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5f4a1ff-6d31-11f0-b895-0df219b8e170;
 Wed, 30 Jul 2025 12:42:33 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id A0DB84EE3C22;
 Wed, 30 Jul 2025 12:42:31 +0200 (CEST)
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
X-Inumbo-ID: e5f4a1ff-6d31-11f0-b895-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1753872151;
	b=nyiWynhwMx4nOzo7g7hlaA46cXuLHx5tEogdw8VgH/Y/XzJg0XAYIYSyPqqoeKDkHFjf
	 wDwr38lcTZEibMzyHbNMhg7vImYv0gFRVTnce82IDBbyPMcIh83XoJG4pKbcpgUHdQ/DK
	 nZlAPCmfvscuL1sXRj7+tjDhwq/GHphpOO6jQ5axenPqgisvas2aCZawGXJNHgTHaelGo
	 GnwRcqddutcLIU5PlohOTQ2Hkagf3AZ76UkLRRk8FRBoU/QbqeoNH/aWxY4AIVaPI8znY
	 HISluuzSzPc4rf1eSxcy0hixmewp1N0ccN8bgoByJuFbobyterjwJZ/e2jznD74vM/BUY
	 LB4RvpyX651LttjclDDEmrOd8dtufiXbhcZ9VRZQtB8phvtH2Y2yE00upHcFpy5uCXJX5
	 IGQs6jWwes5NjUvOfbdeE1p000ZBZoaZRsGH9YVBBE3RbLrWDEs2KChoKoPa2B3ySGBJ9
	 IeiIt1xc+See9ubZ67N/a6qOKDyrWDRZ48p7ois02xHyJ6tcRDMY22+3FHyF1g2LqGksD
	 OuuSppe/SHOQahMvLvcZG5IaP9Ynb4+Nzt1WkzhZ3WvE9Y2flw2ogUzgUF1CZZxXsKERr
	 254JC5yV4ghqWqR3sL2dp2YgTCeWa9Lh1422CN/sBot1dvIrf819W2Wmlig2Wls=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1753872151;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=M+RwKOzQq/GPkLpgZxRZ7iKwsMNzgNdonb6fP3gVAVE=;
	b=4ZBOfTxb2+cQxtdcCgO1Eva36B/XKkgqcncZRjhyMNeMmg73/V3d+Fd0EObU4h1+2OLK
	 f7Yryg8A88rKW9KXOi5Ypr7h/w0kvy4+Tq9hAIZSdyOy4zHLmCeo6F6ZVu1ko47QeUfyy
	 nWc6t7KenV0dLdwQIXfw9q9S5wTs6r8CTjGwT6nUcihcJsEZP8wCdw+V+qyfbZ6wP5Qgn
	 CJL9aMVWJZNtoRrjddyJjHOK6inqqluVnWstyEv3FKE9GuyJ+l+JmiGBmQkP2urMGc4AH
	 1zXRrU24BcmTMd71jgmSVYD/aO8fPn9ksXeIJB2phMqK4H+/1h0mgkyiemOqtgOsv+x7d
	 OOA3J4h4tiqOPf1/CVHNLunC6Jq2s/4Ok55Uy8TReFBfziCSQ3uhkMX2dibnbSw19zuer
	 TFaV8AsLodO5H4Gb3ZfhBdWgXAtn0ahmNZ8zAkqBqKRic7nxCpfC2Xt/C12RTL+Pq9KR0
	 e6FqXj3kY5eOCPEMTILgUAotBiQz2h+PrPR5dspgtaegjuE3q2xYOW+HQftCrjQLAD1kL
	 8N7Yw+JyGoMQ1KKpHVn7zdIutWvtu6NOOGLArT2o2zFxrhL/v9ZfgpoRTNaZo20EavKBm
	 lojQfajKtm3lo/fSGggOFVfVEYVrztUgpCxcfGvyhVkr7/Qa9HV6HUZiRYrHDgw=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1753872151; bh=q0ylRSnJcfp/9c6s7b9g4szPX9SsI4Ng3V13hVZUd7o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nhpUeUWSNsMO4NuqXlhzNC26jWDBpwdH2S+VMqGCKmrdr2DAcLOCcJumy/NMygEpb
	 03a/3LtDXc7waLwXVVPwwKXRf90BSUMhhab87K6kP2T/riF65+cfN8Wa6Yhir9KVC0
	 np2dJho4xBS2NJXysoDZe0z/HFH+SMkSLFVwQOYSjeedVZzb2ZkdTZjoBunB8LHV2h
	 hwc3Y4K5z4hKQ3OnwBpME2+vplbF5iFDqmrV+VO8iMXUUb07Yto7Nw1Yf3ReFVFS8p
	 nV7ou6b1i2w+xQhmghQyxCIF3rvtv7TtHuN+HRVX76OfYgED1Aq4UDwr51QKsn/z6E
	 9Zlg9F1EGD5sg==
MIME-Version: 1.0
Date: Wed, 30 Jul 2025 12:42:31 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 consulting@bugseng.com
Subject: Re: [PATCH v9 4/8] vpci: Hide extended capability when it fails to
 initialize
In-Reply-To: <8051d388-48f9-4878-8924-8e645f313238@suse.com>
References: <20250728050401.329510-1-Jiqian.Chen@amd.com>
 <20250728050401.329510-5-Jiqian.Chen@amd.com>
 <8051d388-48f9-4878-8924-8e645f313238@suse.com>
Message-ID: <562265e2a66b4eae06c4703a836e7d21@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-07-30 11:50, Jan Beulich wrote:
> On 28.07.2025 07:03, Jiqian Chen wrote:
>> +static int vpci_ext_capability_hide(
>> +    const struct pci_dev *pdev, unsigned int cap)
>> +{
>> +    const unsigned int offset = pci_find_ext_capability(pdev->sbdf, 
>> cap);
>> +    struct vpci_register *r, *prev_r;
>> +    struct vpci *vpci = pdev->vpci;
>> +    uint32_t header, pre_header;
>> +
>> +    if ( offset < PCI_CFG_SPACE_SIZE )
>> +    {
>> +        ASSERT_UNREACHABLE();
>> +        return 0;
>> +    }
>> +
>> +    spin_lock(&vpci->lock);
>> +    r = vpci_get_register(vpci, offset, 4);
>> +    if ( !r )
>> +    {
>> +        spin_unlock(&vpci->lock);
>> +        return -ENODEV;
>> +    }
>> +
>> +    header = (uint32_t)(uintptr_t)r->private;
>> +    if ( offset == PCI_CFG_SPACE_SIZE )
>> +    {
>> +        if ( PCI_EXT_CAP_NEXT(header) <= PCI_CFG_SPACE_SIZE )
>> +            r->private = (void *)(uintptr_t)0;
> 
> Eclair regards this a Misra rule 11.9 violation. Elsewhere we use (void 
> *)0,
> which I then would conclude is "fine". But I can't say why that is. 
> Cc-ing
> Bugseng for a possible explanation.
> 

Hi Jan,

I only see

0|$ git grep "(void\*)0"
xen/include/xen/types.h:#define NULL ((void*)0)

which is fine for R11.9 of course. As Andrew noted, I don't see the need 
for the use of uintptr_t either.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

