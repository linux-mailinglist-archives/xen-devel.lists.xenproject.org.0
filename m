Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A59A5088E2
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 15:07:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309230.525275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhA3C-0005OI-NU; Wed, 20 Apr 2022 13:07:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309230.525275; Wed, 20 Apr 2022 13:07:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhA3C-0005LH-JH; Wed, 20 Apr 2022 13:07:18 +0000
Received: by outflank-mailman (input) for mailman id 309230;
 Wed, 20 Apr 2022 13:07:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YZ94=U6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nhA3B-0005LB-9p
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 13:07:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cce31b9d-c0aa-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 15:07:15 +0200 (CEST)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2054.outbound.protection.outlook.com [104.47.10.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-nz7PdrciNt6wqHE0gCiDrw-1; Wed, 20 Apr 2022 15:07:12 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB7PR04MB4138.eurprd04.prod.outlook.com (2603:10a6:5:19::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 13:07:11 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.014; Wed, 20 Apr 2022
 13:07:10 +0000
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
X-Inumbo-ID: cce31b9d-c0aa-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650460035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H/K3F3UrZRB/ZyGYDvjGe1Wk9XC2zVjl4+MXZ2dzlFk=;
	b=GgIOvaUUcXSSZAs5gNyFuYE2BsLKqnAVgkz48v0+PlPzR1aUm2Spr/nefg70zYb+Aznt3i
	PsThM1zdNM7DuCxCmLvLzvzwOtWmuwOoQTaT/Ozwd2INFvkBIw3bRu/6KqoQWDH/xAdUXC
	KUEFxf9WWezTlcejNLxiffESxPZ0Kco=
X-MC-Unique: nz7PdrciNt6wqHE0gCiDrw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eZXfjoqGF0Jyf6FThr1FyqDRE2BWMK2fV8lr3JsrJIvV4UmekENOw4RTTlGdvsTClih1OpXGDoUIkC4/2vBDalpf0rDa5jYTrrwLdZeoB/lztxFv+lljB+neMhIrLqce+4t5yE7yHFfE6hnxvF1lIL7LEF42ugPKNYQYO+qbHTo7rWj5Bdu2aIsacUNdBU0jJQJ/lVGAXeHQdShFe4lnFk58x3CH2IPGa9q6tH4ALNcKl/9W6Gakz8oiw6OwgvBDL4vtk6YwW7A3CcocYgwfUf2oW+QZjPer4QGuEQELIBD8n22eLv9tC3txCD7Y2bOdgJszIe0Z+nLhrBM8EloVjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/K3F3UrZRB/ZyGYDvjGe1Wk9XC2zVjl4+MXZ2dzlFk=;
 b=dfWCeS0UqMmXh4oETGmWAKK3I26ZuDmkxo6Iq1oP140uUv3mVh1RjBchSo8QW5zjebZQcvGDdHYfyX7+5HQeDOC6uYBadgK9tZdu7uuuViDHdKKBLyopUgK9wuuiFttHBO9pxso7rWdtfjtk9diEZwh5CMuzlvzeraucDEaHHuMoy76ARDjV4EHDiYcrqNf8DsnGy3gAWPcaUGJHtKwaCq+LHxu240jIR6gPJLX/f1oJjBNEKjpaAZdFCbY9MZRplk9+58lD/xFD2/Yl+WWVFoQUshKTrnejOY0yHUse5bopNJGbJoPFCdM/V89mM8Vu8zMbQbaWFTkQgMsOyG1kfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7d1d06ce-6bbb-b4c6-5b59-32ac37e41c4a@suse.com>
Date: Wed, 20 Apr 2022 15:07:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: DOMU: Virtual Function FLR in PCI passthrough is crashing
Content-Language: en-US
To: Naresh Bhat <nareshb@marvell.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <DM6PR18MB3193BA01B3A6FE2A4A9EAE5CB9F59@DM6PR18MB3193.namprd18.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DM6PR18MB3193BA01B3A6FE2A4A9EAE5CB9F59@DM6PR18MB3193.namprd18.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0152.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::21) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a12d30f-951e-4cf3-6519-08da22ceae2c
X-MS-TrafficTypeDiagnostic: DB7PR04MB4138:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB4138128D001254DDE3558D50B3F59@DB7PR04MB4138.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7UjSOQc1MCX2qYU2jVUCUKnngjUpKBMoVN6h5lOLc0ikrjGDbnZZLPIYO0tCp6ZBTvcg0zELYyQEKGdjOYEA9MhIp2kdTgIlcqdFPqNg5fXAM8N/mA85FnBEcq5ycPZH7Uyo5zYbbZaM0z9hcr7MVq1vndm7tB9906iHJYMgr8cmZ05msCUhVgz4zTEE0amNjIsrix0GbbCF2Rm319eM83HXP7ImCXiBwC+iVKF6SXnxHUdwbCM+/liQ6do2CbLSzLvh7uQD54Mhd+H9QWnvWX/Iiur0Etb0ZHIUzuzFKyhfUQO7DqW/06DZdNzluMfrKIE6EzYJsBonB0EuAO/Qtbgd/RZNhzM/8lZfc3bEbFY8hRycsBdAaw6rHIR2dP98Ehxb7VL2wl3t6pKDgyUNbSd3dxm14Q/moWnURhvEqQ5lF7BbFHyQfmbwO1Xfaei/M2Ujk2Rw8i0nEgSgRLpMpYIUDrh7EPL+LjsEUW0HD+iacWKNLtTY/ew4fCjsnLXHPacmwvhqHrIbVQseLbGeNe4kls6foRwRORDqwXyNjfVFMZEkvR5o8BZ5/avBEm1IZJHnv+Vl79wtVgzykJedeydpIIQHfgOw9cFJM/nrouPw+ycS4QiuxBhKyGkHitb2X8wdWcBI47fAyz8r2DPQkAueLb2hrWfOtBjeBdQJTAcWhU17JPYt7+xHDOHQFK0WMcI7Y7uIJ4WfrL3qm5Qah1rPmCCHVOo0yG3CSZh3mSE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(66556008)(53546011)(54906003)(6512007)(8676002)(508600001)(8936002)(4326008)(6486002)(83380400001)(86362001)(66946007)(66476007)(38100700002)(31696002)(186003)(26005)(2616005)(31686004)(36756003)(6506007)(5660300002)(6916009)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2VNaDRRMHVTU1k3c2ZUU2h1TjN6d2J3ekZHNmxTMEJWWWZ1T0xCVzY0SWVw?=
 =?utf-8?B?WUtZdk1ZdEZPTERyRTUwWmdKTEEyZHlOR1Bnd1FOeHUwajVwdGgzbWxFRWhX?=
 =?utf-8?B?WVMyWlZybktvMExJenpzSXdQWE5Sb1pIN3dPUXBUdjhLLzNpUVB6dHVZL0Ra?=
 =?utf-8?B?YUxCOVc0WEZiZUZ4Z2Y0RzR5cjR3YUR4RmFIeVF5clQvS3c1dTNib3kwdE0y?=
 =?utf-8?B?WnlFVUJvY2l2RTgvbnh3MGFJOVFPN3M5cTdTVkw3SkJNcGtTMDRQVXVWM2k5?=
 =?utf-8?B?WTZhamFVQTJaRXZ1VnFrYzBCNXZyZTJiRStLWTBTbVp5OHI1MUNVVlF4c2th?=
 =?utf-8?B?bHg4eTFBemhqUWVObHBWM3Zxei8zYWJrUExUSUxqRE51ZDNSV3cwTXloRzJI?=
 =?utf-8?B?TmZDUEI5VXh1OUQxdSs3b3NMUnIwdFdmeXJMYUJOaktlelBUVVpJVmlaQlZj?=
 =?utf-8?B?THZIdC9DMHFuZktOOGFmSzFJSlhOR0UrWTQ5aGlpalU3NE9lZnpEbW5MbnFF?=
 =?utf-8?B?bm9KRVVCemxQUlVEWTlqckg2RHFqOFMrZk42L1ZxZHNPMkRSRWxZNzZCejh0?=
 =?utf-8?B?d0VXbUxIMmg4cGppdEUvUy92bzVQQzE3OFZVQnYycDhmL3FVd3lOZHNJb1ZQ?=
 =?utf-8?B?dy9qU1djdUFoanB3cjlZTlQ3ajd2VUhNc04reEZ6NmJ4dGxTOS9tbnEzR3Y4?=
 =?utf-8?B?NERPdUZhSnpoN1BXbG5PRjZhRTc3Z0ZGRmc5UWhKak45VmppY3RQTGlTNUph?=
 =?utf-8?B?cUhrdnkzdkxSK1cxRkxsMHEzZ2wxS1NjMXhYR3g3bkJyY2ZBU2ZpSElYc0lD?=
 =?utf-8?B?KzM5V0xhRkZZZFZmVFJXZUVzMWx2bW9URTJ3OTVxWGliUGRaNWRhTnFjZno3?=
 =?utf-8?B?TXg4eTU0QlM3dTllVDRMdjhPaFovTUtDbEs4QTJvdGVjZW8vRzY2U3NXREN5?=
 =?utf-8?B?Sm80ZGY5ZUF4dk5pR1ZGaTJPNUtXNElLcnBHWkttTjJ4QkJBT1Ntbk05cWNB?=
 =?utf-8?B?N01Pei85OWF3M1RYNkhvQmg0R3QzT1FYVmtVMlBPUjc5UVB4Y0lhQmtWQVBi?=
 =?utf-8?B?U0Ewb0Jqd2l6SzhJQ2x6V1JNNVhrNTQwRldoVFBpc3ZGc25ZendwNHhQR1N2?=
 =?utf-8?B?RGs1bWN5d2xuQkJVV0I4ekJUZlFDR0IrV2VrUExVU2lGSnF2dm0vYWxveG9x?=
 =?utf-8?B?TGxlTkYwTzkyZG1jdDh4WnB5VlJ0RTVFR3NDQW9zbmtDK25DVzlmZGJwbFZp?=
 =?utf-8?B?WWZnWTFTV3JjdzVhU1FTRWR3NlZIY2ZrTjRlbW1PV1UrcVlBZ0JKNTA2UVpx?=
 =?utf-8?B?aXFBNmFnbWJ1TlNUK0NRSWUzanZHTlBxb1ExL2dwTzV5YWRPdllsbC9kdTM1?=
 =?utf-8?B?dTRtRnd6QWI0V1ZwMFRQTGF0SVJTaElWY0hVTCtoMEZMRG9aZnZlU3MvcWFs?=
 =?utf-8?B?c2E5VjBQNVNJMG96d1hOMzIvT3BZRFNWd1ZkNnFhMzVrZGJEdnlDcklmeWZQ?=
 =?utf-8?B?aG8xWi80dDhyb280c2lYRXlnems0amFtem85aFFYL2RpanZmTjJBSGFTNHBm?=
 =?utf-8?B?dkIxbXN5WGgvUlUyY3BWV3BEL0ovaXpOaCt6UU1scXFiM2gxZXZYWVpyRjFP?=
 =?utf-8?B?bDU5ck1Bc3orNXdCQU9oSk82Z3hwekFVNWFqaW1yMVhDbTR1Q2QyYXRxdFVr?=
 =?utf-8?B?SmRvM3lvMS8xZ09WYkdoZHh3VDVHamhqUThjUHcvbEk2T3RvKy9sQmVKb2lR?=
 =?utf-8?B?b05kaC83MmpqU0NrdkpJZjQvdEJKZXEvUkNZUUpnbCt3OTNYQmtpWTFhaGFl?=
 =?utf-8?B?cnFFYk1kZWZBV0d6RFdIaXpnM1c4MTRYZFo3UGkwOS9PTlRleUdpcmo2dTFX?=
 =?utf-8?B?eGl5L3BtMGdkNDJNOGhyRGx4UC95RURoM2NtQ0tXWFZIOVVqNHJMbjRaNW9R?=
 =?utf-8?B?TXpqdHhSckozSHFESTAyamI5TzBsL3RZSEZycWZyTWRJZGlOYXVTeUlyeWF6?=
 =?utf-8?B?UnNnTThVWjZWRkJvcHg5V1lYdG1jQUVGZmlDQ0pXaWRsUU5Cb3hVNkhGMVlm?=
 =?utf-8?B?MzIrNU5FOXllS29RRTY0YTRiU1Evdmhja2hucnk1Vkh6eXdXbjIvTSs2dWwz?=
 =?utf-8?B?RXg2YVJxQmU5ZFZZczc5U2FNYnNyemVrays1V241c0YyOUk1L3dTNXVkYUxC?=
 =?utf-8?B?Y2YvaGNhNlhaRGZCaDVVZStyUHJuT3lyQmlmSk5aa0NnUnZkM2JaKzJTRHIw?=
 =?utf-8?B?N1JOU3Y4RVFhcDROekhDdDVnQnhSdGRJam1sZVB0emxEZVhaRGpGWXQ1ODFz?=
 =?utf-8?B?cE5uVVR5RVloQ0p3WmVXbmpYbU5iV29QTEZ6cy9jdHRGclRXMmhrUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a12d30f-951e-4cf3-6519-08da22ceae2c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 13:07:10.8816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U7zDYDTC397FEHmIWipoiXGU1JFgV08xnob2M6F7eUQU5thrRZmopS2SQt6JHJbuchYTFgbs6iAtOhGoif9g1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4138

On 20.04.2022 14:48, Naresh Bhat wrote:
> I have the following setup and try to test the Function Level Reset feature.  Any suggestions or pointers will be very much helpful.
> 
> DOM0
> Distribution: Ubuntu-20.04.3 (kernel 5.8.0-43)
> Xen version : 4.11.4-pre
> 
> DOMU
> Distribution: Ubuntu-18.04.6 LTS (kernel 5.8.0)
> PCIe device with SRIOV support, VF (Virtual Function) interface connected to DOMU via PCI pass-through
> 
> Issue on DOMU: 
> 1. Enable MSIX on DOMU (We have used the following kernel APIs pci_enable_msix_range, pci_alloc_irq_vectors)
> 2. Execute FLR (Function Level Reset) via sysfs interface on the PCIe passthrough device in DOMU
>    # echo "1" > /sys/bus/pci/devices/<ID>/reset
> 
> The following crash observed 
> 
> [ 4126.391455] BUG: unable to handle page fault for address: ffffc90040029000
> [ 4126.391489] #PF: supervisor write access in kernel mode
> [ 4126.391503] #PF: error_code(0x0003) - permissions violation
> [ 4126.391516] PGD 94980067 P4D 94980067 PUD 16a155067 PMD 16a156067 PTE 80100000a000c075
> [ 4126.391537] Oops: 0003 [#1] SMP NOPTI
> [ 4126.391550] CPU: 0 PID: 971 Comm: bash Tainted: G           OE     5.8.0 #1
> [ 4126.391570] RIP: e030:__pci_write_msi_msg+0x59/0x150
> [ 4126.391580] Code: 8b 50 d8 85 d2 75 31 83 78 fc 03 74 2b f6 47 54 01 74 6e f6 47 55 02 75 1f 0f b7 47 56 c1 e0 04 48 98 48 03 47 60 74 10 8b 16 <89> 10 8b 56 04 89 50 04 8b 56 08 89 50 08 48 8b 03 49 89 44 24 20
> [ 4126.391606] RSP: e02b:ffffc90040407cc0 EFLAGS: 00010286

The RSP related selector value suggests you're talking about a PV DomU.
Such a DomU cannot write the MSI-X table directly, yet at a guess (from
the PTE displayed) that's what the insn does where the crash occurred. I
would guess you've hit yet another place in the kernel where proper PV
abstraction is missing. You may want to check with newer kernels.

As to FLR - I guess this operation as a whole needs passing through
pcifront to pciback, such that the operation can be carried out safely
(e.g. to save and restore active MSIs, which is what I infer is being
attempted here, as per the stack trace).

Jan


