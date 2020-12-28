Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1BB2E69FD
	for <lists+xen-devel@lfdr.de>; Mon, 28 Dec 2020 19:24:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59567.104568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ktxBs-0004nV-4o; Mon, 28 Dec 2020 18:24:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59567.104568; Mon, 28 Dec 2020 18:24:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ktxBs-0004n7-1P; Mon, 28 Dec 2020 18:24:20 +0000
Received: by outflank-mailman (input) for mailman id 59567;
 Mon, 28 Dec 2020 18:24:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=shBg=GA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ktxBq-0004n2-MY
 for xen-devel@lists.xenproject.org; Mon, 28 Dec 2020 18:24:18 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 474be9e3-ac94-47bf-b6fc-860b8c971072;
 Mon, 28 Dec 2020 18:24:16 +0000 (UTC)
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
X-Inumbo-ID: 474be9e3-ac94-47bf-b6fc-860b8c971072
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609179856;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=aiHen9JT4PeYKMzQFcFqnfx+rv1IBcBTuskJWWUR4fE=;
  b=edLh36iNFIa/7VjXd6/ZUVkIEqOjaQREfZNgHmtE903R6EteWYLP0jR6
   oqxhFxj0hYKZeV+V6Yi0tP28NkH6CEqrNT2NnJwAZlAoVnNVK+dzLKmLg
   oBgYJQykk5VN5Yn9RRNi7/N7iK7J4dDm5ewRGgEu3A2JZJLuD6EpYazEI
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: G0MHHDGztW8jcpVC85qqgKHT74YdiMdmaHUOTZQTNNlBFLrmaybYIwt7qNZWULfTqIY/qEN3aZ
 NDrPCskRkmIc1e38iO5KOuGGFcuxxS8dOSifEPrcuLb8xkmBtxLDhK3holL5LAThlFsUu2iE+a
 rLBXQq9eIvpAwlEc9XitOeDRcJA0Jn7nGgN2H3agzzYZ1MFxryPvJUGVUv3eC3l5CaGjrEn4lP
 7pQ7OwvxF6CnqWr8ifm/mDwGv0COFomZnrzzvHf2L0nIyeRo1gLZTYnvkGW+wwkdUtZuca1/M7
 kc0=
X-SBRS: 5.2
X-MesageID: 35298032
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,455,1599537600"; 
   d="scan'208";a="35298032"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jXHYvzvr2PZtJwSIdx4lqsBqTXur6Okn1LoT/HFokKd5DIWk2jqfDVBkSm/fjmLg+hkCjdG25T6O2+dnN3O86jxvtBM7XSTKiZRxBlXidNIfGvUIxZxJglDESu/V9M3Ve3r/m3UgE7EzKpJjhErGiQIjtKWTea81o5mhit17+7P60C6QdQVRIMXTngB9E3Xdqq4M+VD5Ae7s1/Qa9ewrtvvMgoncDIksRmpBrPwGSuvVDIqmotKcN/0bmBZmms1v0lSIY2cxo8oVReZhZTtACjFzYqF3R9Yq6ejPeDp+gMAyCKj8MmRHCCbmG8Y/raCJeeJ0bYwZdnYMDaS+6HSWjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFXoTKwokUNFL67JtthriUpbVVuEHjE1CFWaQMsXsEM=;
 b=mF5m8Q7GkTd9Ah5l7Fi93A5zSfe324yKD1AUAz4WQPUx2QY2bfXHVZJkeuI+7cEJ2JNtej3kc85FM2Y6SetLvkxY51khpMMdhQbcYr/fJips3iOY1d0EoZj/r8dIwJigoU87vu8yKa1dW0BCvtvfPsnGqEwdkWK7UF9TtHk0qA+RdjF9Bp3mPRdQNhvw/QUUq/NvPXGFJ3jBjledTryj+iLZ4rPo2iRLYCMFxJhiN+z5KMn3MRvAYXQxEkEi4EsArtZToIv+1EuAhO2mS+iRp3ReuhMMSTUwnD86IATzvjuYM0mGwbmiHh7XuczC/CtiCcnZfIpc4udikWn6nzqm4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFXoTKwokUNFL67JtthriUpbVVuEHjE1CFWaQMsXsEM=;
 b=l+CbRnGrhABJFtcWH18L3X2vWQiv0ARPZyHHiWBnHXyO3i/RsSJQpe9DBRJF8LDbz1D0mNnSgXz9SuSm/UIwJZy+haZSiLQNiqW+rsWBgVJMdaHtoi/kafQw+KbsYr9jk/7y1tLz8cyNUjEU+THGE9viyoiRSMPzh4ZjSmEBnCI=
Date: Mon, 28 Dec 2020 19:24:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Manuel Bouyer
	<bouyer@antioche.eu.org>
Subject: Re: [PATCH 1/5] x86/vPCI: tolerate (un)masking a disabled MSI-X entry
Message-ID: <20201228182407.5ntx7qppe4vu7fvu@Air-de-Roger>
References: <f93efb14-f088-ca84-7d0a-f1b53ff6316c@suse.com>
 <fef14892-f21d-e304-d9b1-7484e0ea3415@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fef14892-f21d-e304-d9b1-7484e0ea3415@suse.com>
X-ClientProxiedBy: MRXP264CA0042.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 960016ae-50e3-4c23-5e98-08d8ab5dc6a5
X-MS-TrafficTypeDiagnostic: DM5PR03MB2491:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2491BF6A28DBD9898BDC5CF58FD90@DM5PR03MB2491.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SExZkCHxlRQgEx4pSuKam/31c0JsupyYN9liMT/D0NTHzHJxgcYevjBGP2CRISh7UVHPFzGLoPwe/sopZEPLeNsytrymJXmj5rUBP0CySI5QfeqWVCtNzxngRMwGABN6bk0ti/ZLxH1qdjbzlBinMfBWPazZ25QZkCRpSYm+1Cs8pUwObcgRBQXSN3baKdyLLPJ27XK6BrPEjN/xgn4Pcmf4M0b0MNJ26B3sNTIFFcnqV0HjYg/JlVFf7UlfgNKvzB2rTRpYEeWm6hCae4OjkG445orrEWQ2/3OLPKyaih/AswzVvuzT5DnHCXsOJk4gKksoFyGduD52SdZLgjeizpdlPYpwkhfJn9BacVVIG/XRAzGHoR/YDT1UAay+WFI5lCUZjuM0jmpIm9Pd5C9vZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(396003)(346002)(376002)(39860400002)(136003)(4326008)(956004)(66946007)(9686003)(85182001)(478600001)(8936002)(16526019)(26005)(54906003)(1076003)(66476007)(86362001)(66556008)(6916009)(6486002)(8676002)(5660300002)(316002)(6666004)(186003)(2906002)(83380400001)(6496006)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aVEzUzRnUkQzaWFoQWJ3UitvTHFlVFJjeGJVZFVoRGo5N0RYZENPMHQxZFdo?=
 =?utf-8?B?ZkNSNzRlQ1EyclpBS0dSOG5STjR5QWc2OXhBdHFCQjMyNGhtT0ZNT1VqcC81?=
 =?utf-8?B?d3NDTTVDZ0tFZEZTNGxSS2UrdHVpN3ZuUElVK1RaODEyS2ZtWUVHcUhpbW1h?=
 =?utf-8?B?OWRoNjhwRWVlRUpmZzVTRTB0bmZyY1V3Q0s4U1dQMVp0M0JvaVlyQndrY1dN?=
 =?utf-8?B?b2dkZXluWGZMdFRxeGpoSVZOeHdNdldLRUJZR0l5QWtic2x4QmNERDI0b3Vp?=
 =?utf-8?B?ZmMxY1k2YU9ubWJuM3h6Q3JUaU9SZDZXT2RBZFVJenYxYjNsRlNVekV1ZG0v?=
 =?utf-8?B?SEE2NmJZL3VrdUJueFlJKzIrb1ZqaFd5NHV3U3Nvb2IxdHdmV0d1MWFvc1M3?=
 =?utf-8?B?VkN5czMzeVJWZjc3cGZCSmpHdkVqNjA3Nko0VWVHVU9XNG83UURPTW1PV0Ev?=
 =?utf-8?B?NWpaRFNIbFoxdllKNnI4eU1DM09PVEVpbnlwbGwvNHBXV0V5TWpXeUttZWpY?=
 =?utf-8?B?Q2M5S3MyYjBkYnR3ajMzK3NMdmx1bmhNMDEzY09wbmJGNkkxRWY3Q1E5Vm5p?=
 =?utf-8?B?Ym1RRnNyK0t1S3dwY0hRTjlJMVhZZ1FOYncwdGEvNnZ2SmVkR3lPRVBCL0dz?=
 =?utf-8?B?ZEI3Wi9YUWpPV1VzK1NtUDBBRWZZN1c2TThrMVZJeTRxNkhkVS9WbzJBbi85?=
 =?utf-8?B?K0hwZnVWci9sSG9IYjZ5V1BwSHBrWHVDaGVtbDRkL3d1QThDWEFiRTNLYkp1?=
 =?utf-8?B?NlppeHd6Q2xXZ2lmNjI4VHphRSthM290NEVUcWVob2hXUnJQUnpKakxmY2tk?=
 =?utf-8?B?V016WUJPbVhmWGNUdEtqdnBhckNScndYamVVajdoQWlleWRTaTdoUGxJU1NM?=
 =?utf-8?B?Zzk0U0x5K1hhRHJrSzBReCs3MzNiT3Y1RTExcGZLWURud25VRDllUkc5Q1Vl?=
 =?utf-8?B?NHFWUUpaK055KzczVlltWWRGMWJ4RVpYNW5vVVJqaytmN2lRQkM4R2EvMmQ1?=
 =?utf-8?B?Wm1Zdmszbmt3Q2o5dU4zYUZrSlFWL0x1OXV0Sm9Tb09TT3hJWXB6RnpxTFM1?=
 =?utf-8?B?L1dYeEVWYkxGNkRNRkp4R3g4RFBBZUM3aEhwRU9MaEJYUXl1cVNMaDhheVFX?=
 =?utf-8?B?dmw0Q3JQeUJ3aCsxeTg5NUtjSTdSMmlLaFlzcEVwdlVWNFdyc3B3bnI3cmZv?=
 =?utf-8?B?b25MNFN3VGovREhJR1JNUWlhcXFIRHlxc0VPeFRBRkYreFl1TzRCSnNBQTZm?=
 =?utf-8?B?aTRlNjhZZUhzbmpRUTVYaDkvN1g3OG1lTExEOWFqa2YzUjhSMlhnekZtYW00?=
 =?utf-8?Q?JpaqbPkU5kiNtax9q1UvdE/OpPbQBEE/iX?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2020 18:24:12.4391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 960016ae-50e3-4c23-5e98-08d8ab5dc6a5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OT6GIIwu+u/iSC2Fk2O0giGrmNosiv5ad1fG31+zDYrSf1oQn7iPAHeP67Q/NGFNjJLzjzlhfC6xaJeXHVvfWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2491
X-OriginatorOrg: citrix.com

On Mon, Dec 07, 2020 at 11:36:38AM +0100, Jan Beulich wrote:
> None of the four reasons causing vpci_msix_arch_mask_entry() to get
> called (there's just a single call site) are impossible or illegal prior
> to an entry actually having got set up:
> - the entry may remain masked (in this case, however, a prior masked ->
>   unmasked transition would already not have worked),
> - MSI-X may not be enabled,
> - the global mask bit may be set,
> - the entry may not otherwise have been updated.
> Hence the function asserting that the entry was previously set up was
> simply wrong. Since the caller tracks the masked state (and setting up
> of an entry would only be effected when that software bit is clear),
> it's okay to skip both masking and unmasking requests in this case.

On the original approach I just added this because I convinced myself
that scenario was impossible. I think we could also do:

diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 64dd0a929c..509cf3962c 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -357,7 +357,11 @@ static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
          * so that it picks the new state.
          */
         entry->masked = new_masked;
-        if ( !new_masked && msix->enabled && !msix->masked && entry->updated )
+
+        if ( !msix->enabled )
+            break;
+
+        if ( !new_masked && !msix->masked && entry->updated )
         {
             /*
              * If MSI-X is enabled, the function mask is not active, the entry
@@ -470,6 +474,7 @@ static int init_msix(struct pci_dev *pdev)
     for ( i = 0; i < pdev->vpci->msix->max_entries; i++)
     {
         pdev->vpci->msix->entries[i].masked = true;
+        pdev->vpci->msix->entries[i].updated = true;
         vpci_msix_arch_init_entry(&pdev->vpci->msix->entries[i]);
     }

In order to solve the issue.

As pointed out in another patch, regardless of what we end up doing
with the issue at hand we might have to consider setting updated to
true in init_msix in case we want to somehow support enabling an entry
that has it's address and data fields set to 0.

> 
> Fixes: d6281be9d0145 ('vpci/msix: add MSI-X handlers')
> Reported-by: Manuel Bouyer <bouyer@antioche.eu.org>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Manuel, can we get confirmation that this fixes your issue?

Thanks, Roger.

