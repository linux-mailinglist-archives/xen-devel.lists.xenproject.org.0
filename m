Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FAB3A25E9
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jun 2021 09:55:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139647.258236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrFWh-0002kM-6U; Thu, 10 Jun 2021 07:54:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139647.258236; Thu, 10 Jun 2021 07:54:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrFWh-0002i5-1y; Thu, 10 Jun 2021 07:54:55 +0000
Received: by outflank-mailman (input) for mailman id 139647;
 Thu, 10 Jun 2021 07:54:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sV8R=LE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lrFWf-0002hu-H9
 for xen-devel@lists.xenproject.org; Thu, 10 Jun 2021 07:54:53 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1136146a-edeb-4bc5-b8d1-23faea77719a;
 Thu, 10 Jun 2021 07:54:52 +0000 (UTC)
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
X-Inumbo-ID: 1136146a-edeb-4bc5-b8d1-23faea77719a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623311692;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=X7/AESbqMCZStgHVgrx1hhFimx2DE8DJqNRE1XvfzKg=;
  b=ZJ4D1B+Cq7lhQX1fT68sVQvW3QkuT1iwHFUvULcaxaPXgE8fWyYAZ/gb
   eLasCWlZTqzrdrx8wkqnqDoLuGIaFDJSbNSJvfHVfqi3E2uJtbdgtHbCk
   0ld3sQVN6GkfVHCo6fNZZJ2YWsn60o6wvBRfT5Fo8vRCwDfjhHn6rN39n
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qBJcfkdp4OF5pEqEX7mx58Jdfr2jbIHnpM1hONdPUMYRbWP5+a2Px++ryVdBB2zGuk9931Q2pY
 GAdQ7mmPHzg9x7oCoV8K6Sj0QbeEB55P6JRoxUnTrLZPfE6eAj+cwXzyi4tuNiM/AWq6eKPFl0
 Qr7IJcRS2s0VnHmAHbvlviQXMShpFiURQvGiTLWHo3U+9Ym/sHJBQ4HbreB83pswUzhDNNmVeS
 en4q5BkSfFdSb5JFHNPYHvTYFasIUQuuVb0EAZ0b/iHbV6WOPV/omrf2QoEK06YoYP6QudeJ+O
 sYY=
X-SBRS: 5.1
X-MesageID: 45798123
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:MoZUe6jrPn1T/hVPW3KE28GLpHBQXyt13DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3I+erhBEGBKUmsk6KdxbNhQItKPTOWwldASbsC0WKM+UyEJ8STzJ846U
 4kSdkDNDSSNykLsS+Z2njBLz9I+rDum8rE9ISurQYecegpUdAa0+4QMHfrLqQcfng+OXNWLu
 v62iIRzADQB0j/I/7LS0UtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K13DDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa3O
 XkklMFBYBe+nnRdma6rV/GwA/7ygsj7Hfk1BuxnWbjidaRfkN7N+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnzUQ1wnEbcmwtirQcqtQ0cbWIiUs4VkWRGl3klVKvoXRiKprzPKd
 MeT/01v51tABSnhxmzhBgd/DSuNk5DVituDHJy/PB96AIm6EyR+XFojfD3rk1wga7VdKM0kN
 gsEp4Y342mHfVmJ56UOo86ML2K4zv2MG3x2SSpUA3aKJ0=
X-IronPort-AV: E=Sophos;i="5.83,263,1616472000"; 
   d="scan'208";a="45798123"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jNoufSonGXXLycwBc1ZJkC7ydbBl1lSAQie0zpoNIyItfyAHsXdpqO9hoDhqfgkXRmF5jfX5PRGj5SQ8EYdC6QVMGPjm66C+ePAnJIfgEoeWgbeLxZleTUkHiv9awmkkls7TGI55p2MbBjC9G+2n0Ds/sqDqy7pmciaUTSUZrjszrRYJxWVeqhJnVxeLbRVr7hcn60oPIe7DyqC/Z9r8f5R9ESfBUMbMKcdFX5HiNHow+ps8zB1BuSepWAWVZSP1Z8BUYyzS+qTk9QezHvK45bWSqL6JCvOukPOwIxgtLuZJ02BnNwJFeyTggjOg3LobVSZcuIkvl2W7nGPixrEhwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUP7Nqu6Fmge9xIhhwPZjy2IirUsrJcuon4/g2rpM/Y=;
 b=YqpMcUBPLYW1kvACF8ARtfAxKQa9vIUDbcJZ/JgqhvPxo45/hCDZXkNe3hHldoMnw6xWNPjLJPh7Uv4fPnJuA78zAQMgBolg8InM4CNo9LTsfMpRlGXnWYkxjg6fYGhVCoqBJcjU9jMr1FJrOGp4MMgP8mE1lnbHI0eIc+t+Ng9xLungtXxxmBX4tisaSr07pFIK+GucM7Le0z4CxFq4imCER8QU+EqxCGhuVbAu0RMtmjaxlvgyA0+q8vBPRu1Z3iiENf8sDxVfYJfIN3/X9S0iu7Aj0Y6YIhubeVJpVtSdL589uEXu77HSijgvOQFCVJy9bNFc+uWSzdT0Qh7wYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUP7Nqu6Fmge9xIhhwPZjy2IirUsrJcuon4/g2rpM/Y=;
 b=KX8atIBQcEpETEAzK4mOXl5mBqVskSd6AlgxZNjko6VQsFXI+f5cql2uygAKv4n+UzlAk1r8OcHVTzqt8PAG9uS4x/E6aiZm8oarjxEuY4UycuAixQLUaW7z/9XAO/qJc8O0/wAln+P/hdCqttWIKV5XZMhSsXllMgjHgvRLrJs=
Date: Thu, 10 Jun 2021 09:54:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Jan
 Beulich" <jbeulich@suse.com>
Subject: Re: SR-IOV: do we need to virtualize in Xen or rely on Dom0?
Message-ID: <YMHFQA1L61ntKNRq@Air-de-Roger>
References: <c10e16c9-ec42-336f-e838-caca49b39723@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c10e16c9-ec42-336f-e838-caca49b39723@epam.com>
X-ClientProxiedBy: MR2P264CA0122.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8fc9bcd9-4cc5-4d44-fb95-08d92be50448
X-MS-TrafficTypeDiagnostic: DM5PR03MB3067:
X-Microsoft-Antispam-PRVS: <DM5PR03MB306755186EA35277BAAA07BD8F359@DM5PR03MB3067.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ur2Qp4FDJ/xPQutqBmDsScumP9OqVhhYvkmP6IwbINMcWWZaF35sKbGu2KFJqFhhkBEKpCpo9AK0LaYfhbCXvsgalpR11WIYZsTpFztbrTu1XuecFNOWlWKefgsfHgGaMSdKaD2iAAqwTtCjCkUCdYb5Tga+DJEU3nJIvuToVo02ndpH3VWe33f7ryQhWGHOZIsWPu8hT0sp3IpURQ+xwe6ACggClqclTBFLr+D/rE1LqebCyvyZgYdi+6VuSmMfSBHHVhuxBORwMyqsTASz4egs8CLRn26DWuItIB1bSq8E9R/fY7eHUZhR9yffqd0+f1McWwYMHKj98vOwEIbHYPf6iwFx2gy4qFdxPMb5gf4fZieusDOR4wohnyXuiIatD9f6cGxoDK1hiKYUgohyD8dQ0fFe39dTgQbtLLY0vNGzCNmd3ZznmZ7hecHWLu+RsiSModJO4WO6zJk0cXbuZ8lGYHn8YUfiJkzVk/gCeqOasrmQ8CltCRKh4DCm5bLX5b9AHgM9B1jdKKZzT+uarHiF53mpM+8IZlt095sKr+LUsLRpTlDtwJvsblUVE1cfOTtA5L92MibtfFP119MUFTO+KIBjq5PpVamLJIp7Y89LO9+UYwPXqIPo87Wb341eAZflGWquQvrzWiclhm3s36ZIYX2pYc1aG4Sq7OtUYKdskY87H1Ip3bXgEN6LY2C/TMiqIA4VGogJVb2/0ms0d8WAxjfFBW8v6b+1AlC5T91OfrGd9x2PUqns6utuUL+q
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(346002)(376002)(366004)(39860400002)(396003)(83380400001)(6666004)(4326008)(2906002)(66476007)(8676002)(85182001)(6916009)(54906003)(316002)(5660300002)(6486002)(478600001)(6496006)(966005)(33716001)(86362001)(8936002)(66556008)(66946007)(9686003)(38100700002)(26005)(16526019)(186003)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzZVcGhjSGJ0R0pzekVBVnk4MjFFVFM0SnR6WGxnS0phS1BEWTF5cUZUT0hv?=
 =?utf-8?B?WDUvTGo3K0FPZzY4d1JkVE5MTHAwZDVlMGloYlZrQzR3VW8yWkhyM2FiWmVh?=
 =?utf-8?B?Z08zVHFtL3d2c1BSbnZlVlhYbW0vSDg5Z0h6cStTQWJXRjZzYlJyekJ0TGhr?=
 =?utf-8?B?VVVJeVcvVlhDUXRkUDVvNVNzV25aQXJPTHB0Rll2RlJvOUswbzg2UWFlbUlB?=
 =?utf-8?B?UnZ1YWRsaHM0QzRrMVhYU0FyUk1RRFBmb3FJcG9NNlF1dmp4d0NNZkJqcXNE?=
 =?utf-8?B?OWhySVJ5cHpOZHh5TStWRHRlUVAyUE9JQkU1aGJYSVhHWUlIaDFxZFA4RzU0?=
 =?utf-8?B?Z1hlVUI4STNUWGxvM1oxZnptY1hBb3BaaEI0cStEd2hZS004TC8vV3JhN21p?=
 =?utf-8?B?YXVpZlBCZWY3MTVRZk1tRTFnZk1uK05hUlpycUcra0FBYUl4R0gvVURjbFVN?=
 =?utf-8?B?WWtYSWcrRFd6bmtPL0FyeGlMMnJwd1ZBZjV4UW9yUVZNRnlmWUhVZnQxVjdV?=
 =?utf-8?B?RW0xbVBIWnJNb1pSaFIrUmZjMDVOWkF1cnEzR1dEcWxLbHR3WWNHaDNHL1Iw?=
 =?utf-8?B?VVJId3RKTzBib1NqLzdiMVdJc2crVDlnbmFYTVFwc1FVbitBc3FUWTV6WEdL?=
 =?utf-8?B?ZVBuZTAwTUdmckJLQXZrR3IwS0VaWTA3T3JjcTNSSGozSmQ3bVl6YkV3RnJV?=
 =?utf-8?B?VkphOXhlZEliUTkvWm5oMVpGdEF3S0tvME5EemM1QlVVOEtoaHlqSDROOVdR?=
 =?utf-8?B?cnJpWGY3Qy9OWC9YQzhCaUFKTEk0RUEyRjkwd3Z5MWJSZjlSd05udG1tMTB0?=
 =?utf-8?B?Qlp5NUJCaXltVVZFaGFhZW1XdTBHMlJMc2h1djBKbXk4TURMeW1qcGtkVEVP?=
 =?utf-8?B?dUQrOVlOTG1DUlNpa0tKb3JjQ0UxdFdpT1R1RHNtUkttcWNUek5QQ1VIeXh4?=
 =?utf-8?B?Ym9vd2tPWE9wYTV2UTdDWmhBaTVwTFdkV1AxUmdTaXVmRExzZk9vSTZZRGZM?=
 =?utf-8?B?STJPdmhpTWZZZGVWMzY4T0JEcS9WNkhoVi92d3BjWC95VE04Q0xub2Nza1Zs?=
 =?utf-8?B?aXAwNjc3SDRmMWVBa3Urb3NSc3R5aHI5V2tCS1RJdTUyR1hTMXFUYmpqU0ha?=
 =?utf-8?B?KzNtMFZtay94YVFYUXdVZUNFMXNJcUZRMWl3VmZtVWQyWlkySWovVi83Tkx2?=
 =?utf-8?B?ZThZYlU0K2JUQTJLT1hFcWdyemtsMit0NHFPc3I5NTVjODBmTlZXMFUrT0Iy?=
 =?utf-8?B?a3o2TlJuMSt3K2xoYnVsZEdnVXZtQ0JmSll6Y3ZTaVBXb21OWFloSFU1elBp?=
 =?utf-8?B?dGVId2NOcXZWRVhuQ3JiRXIwOFlTRG9uakJJUStMcFFKRFBmRmJQTVdqc0Fi?=
 =?utf-8?B?QlpyWHJGMC9jblk1dGpOaUI3enA0T0p3SXVNSFV5cWdaM3hQazMvVUJxTTZn?=
 =?utf-8?B?dFYwQWVMT2FPQ0QrdU1iaWxvaWVRRlZrVXVqaHY5QXdNbFNRdndMc0lvMTdX?=
 =?utf-8?B?VDdNOXBaaHlSR2F0K0w0b3EvaGxadlVjYVNmTCtMUDJWdllHMUZlUkI4R0pB?=
 =?utf-8?B?cVhSMmVqLzNkUEJPTUR1TjI4bXRtcXBJNU10SWdVRHE4dGdCWGthdmg1REM5?=
 =?utf-8?B?RU5IU1EyUUVvanlRME42Mk5EVWdTTzJPMzhxc2dLZ0xTT3pmOTN5VmdMbUMw?=
 =?utf-8?B?NmY4NkozNEs2YmQ0RGhhK09JbzBTOVdrOEZCcG5oWHYySkNqekc5S2xxcHBV?=
 =?utf-8?Q?wF6pavi8Vv1hjfeD76Smk/2fynOuSF9mFAMHMiu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc9bcd9-4cc5-4d44-fb95-08d92be50448
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 07:54:47.1920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R8BNNvUZLpsbzKPru1PDJKZDYUygOWfl69RYPYFPInqlBjSUq2JoTBLQ35WfcwyzhRRAL2vke4Kowhw0R662gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3067
X-OriginatorOrg: citrix.com

On Fri, Jun 04, 2021 at 06:37:27AM +0000, Oleksandr Andrushchenko wrote:
> Hi, all!
> 
> While working on PCI SR-IOV support for ARM I started porting [1] on top
> of current PCI on ARM support [2]. The question I have for this series
> is if we really need emulating SR-IOV code in Xen?
> 
> I have implemented a PoC for SR-IOV on ARM [3] (please see the top 2 
> patches)
> and it "works for me": MSI support is still WIP, but I was able to see that
> VFs are properly seen in the guest and BARs are properly programmed in p2m.
> 
> What I can't fully understand is if we can live with this approach or there
> are use-cases I can't see.
> 
> Previously I've been told that this approach might not work on FreeBSD 
> running
> as Domain-0, but is seems that "PCI Passthrough is not supported 
> (Xen/FreeBSD)"
> anyways [4].

PCI passthorgh is not supported on FreeBSD dom0 because PCI
passthrough is not supported by Xen itself when using a PVH dom0, and
that's the only mode FreeBSD dom0 can use.

PHYSDEVOP_pci_device_add can be added to FreeBSD, so it could be made
to work. I however think this is not the proper way to implement
SR-IOV support.

> 
> I also see ACRN hypervisor [5] implements SR-IOV inside it which makes 
> me think I
> miss some important use-case on x86 though.
> 
> I would like to ask for any advise with SR-IOV in hypervisor respect, 
> any pointers
> to documentation or any other source which might be handy in deciding if 
> we do
> need SR-IOV complexity in Xen.
> 
> And it does bring complexity if you compare [1] and [3])...
> 
> A bit of technical details on the approach implemented [3]:
> 1. We rely on PHYSDEVOP_pci_device_add
> 2. We rely on Domain-0 SR-IOV drivers to instantiate VFs
> 3. BARs are programmed in p2m implementing guest view on those (we have 
> extended
> vPCI code for that and this path is used for both "normal" devices and 
> VFs the same way)
> 4. No need to trap PCI_SRIOV_CTRL
> 5. No need to wait 100ms in Xen before attempting to access VF registers 
> when
> enabling virtual functions on the PF - this is handled by Domain-0 itself.

I think the SR-IOV capability should be handled like any other PCI
capability, ie: like we currently handle MSI or MSI-X in vPCI.

It's likely that using some kind of hypercall in order to deal with
SR-IOV could make this easier to implement in Xen, but that just adds
more code to all OSes that want to run as the hardware domain.

OTOH if we properly trap accesses to the SR-IOV capability (like it
was proposed in [1] from your references) we won't have to modify OSes
that want to run as hardware domains in order to handle SR-IOV devices.

IMO going for the hypercall option seems easier now, but adds a burden
to all OSes that want to manage SR-IOV devices that will hurt us long
term.

Thanks, Roger.

> Thank you in advance,
> Oleksandr
> 
> [1] 
> https://lists.xenproject.org/archives/html/xen-devel/2018-07/msg01494.html
> [2] 
> https://gitlab.com/xen-project/fusa/xen-integration/-/tree/integration/pci-passthrough
> [3] https://github.com/xen-troops/xen/commits/pci_phase2
> [4] https://wiki.freebsd.org/Xen
> [5] https://projectacrn.github.io/latest/tutorials/sriov_virtualization.html

