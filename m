Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8531447F2C
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 12:55:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223316.385983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk3Eh-0005sS-M1; Mon, 08 Nov 2021 11:54:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223316.385983; Mon, 08 Nov 2021 11:54:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk3Eh-0005pw-J3; Mon, 08 Nov 2021 11:54:51 +0000
Received: by outflank-mailman (input) for mailman id 223316;
 Mon, 08 Nov 2021 11:54:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d70C=P3=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mk3Eg-0005pX-0E
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 11:54:50 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab04641f-408a-11ec-a9d2-d9f7a1cc8784;
 Mon, 08 Nov 2021 12:54:48 +0100 (CET)
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
X-Inumbo-ID: ab04641f-408a-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636372488;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=/znmLqQoiQTabby6FUoeYBnRM19Uj0wN5USDwpr6GPk=;
  b=bjv1/oqRwdkrxFRz2K4ombF2B4dwSERbZBiOm1GwYYCuxp/6yNRpXp7l
   ROWBvpH+e+W+VMMRul31r6yYtFBCm/6cIQrjQbA2mma8o6MdPeWJx8mWJ
   COGRPRksFLfhjNBP6AHoDp13AZGvFUmd7nxRWjD9b2arMWlHQC4/l+ug0
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: WFb/6hKgfGKpTOSN7ArkPDRUqdK5Z1o/pR0lgBXnKrDEGhKq1JLaQyCPo2v0j5gS7xcybbtOEU
 GUL9+ME1qUziv2gaFQnctJneUqGQ0ffhfxMBk8ls1bHu8yzJO8jo/Euntvt1Fu66yH6jcMyjtQ
 XBImXGVPnVX5sHeM8x6whedCrIMhvW1ZOXLGNPrSWA7mwcP+RG/2sHy38kpwjJv+QaC9Nnxr2w
 TmoZWoTEsbZRpIM+eVlnKOBpPfP6+Crj9LBlIpL0hnpTKIsUyiaouX7on9dVVRD5VC2+xGH91b
 VVhZnCCtOAej6l9fS9C/6XAN
X-SBRS: 5.1
X-MesageID: 56827957
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:x8KGCq6kjkNXPJCEzyPRWwxRtM3AchMFZxGqfqrLsTDasY5as4F+v
 jAbCGyOPayDNDejet9zbYS29UlS7MPRy9JiSQA9/3hkHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdg2t4w2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z0
 u9OpMKPGDUTALTjgd46fzd1HiRHMvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgWlg3J8fQKm2i
 8wxeD4/VDXwPSB1Z3hPCY85nMqipH77SmgNwL6SjfVuuDWCpOBr65DsL9j9atGMXd9SnEuTu
 iTB5WuRKgkTKdi32TeDtHW2iYfngifTSI8UUrqi+ZZCglee22gSAx0+TkagrL+yjUvWc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUHBBqlk/SOpVzDXy5dE2AHOIdOWNIKqSICz
 GWKjo3WVA5VjqS6UEi62pm5oDaLNn1ARYMdXhMsQQwA6tjlhYg8iBPTU9pueJKIYs3J9SLYm
 G7T8nVn71kHpYtSjvjgowib6965jsGRFlZd2+nBYo6yAuqVjqaBbpfg11XU5O0owG2xHgjY5
 yhsdyRzAYkz4XCxeM6lHb1l8FKBva/t3NjgbblHRchJythV0yT/Fb28GRknTKuTDu4KeCXyf
 GjYsh5L6ZlYMROCNPEsPdnoUp12kfi+SbwJs8w4ifIUM/BMmPKvpnkyNSZ8IUi0yCDAbp3Ty
 b/EKJ3xXB72+IxszSasRvd17FPY7ntW+I8nfriil07P+ePHPBa9EO5ZWHPTPrFRxP7V+239r
 ocAX/ZmPj0CCYUSlAGMqtVNRb3LRFBmba3LRzt/LLfbc1U3RDF4YxITqJt4E7FYc21uvr6g1
 lm2W1NCyUq5gnvCKA6QbWtkZq+pVpF6xU/X9wR3Vbpx83R8M4up8okFcJ47Iesu+OB5lKYmR
 PgZYcSQRP9IT22fqTgaaJD8qq1kdQiq2l3Sb3b0PmBncs4yXRHN9//lYhDrqHsEAB2ouJZsu
 LanzA7aH8YOHlwwEMbMZfuz5FqtpnxByvlqVk7FL4ALKkXh+YRnMQLrifozL51eIBnP3GLCh
 Q2XHQ0Zta/GpIpsqIvFgqWNroGIFepiHxUFQzmHvOjubSSDpzit245NVuqMbAvxbmKs9fXwf
 /hRwtH9LOYDwARAvb1jHus51qk5/dbu+eNXl1w2AHXRYl23Ibp8OX3aj9JXv6hAy7IF6wu7X
 kWDpotTNbmTYZ63FVcQIEwub/iZ1OFSkT7XtKxnLEL/7S5x3byGTUQNYEXc1H0DdON4YNE/3
 OMsmM8K8Aju2BMlP+GPgj1Q62nRfGcLVL8qt81CDYLm4ubxJoquvXAI5vfK3ayy
IronPort-HdrOrdr: A9a23:EJRPSam9YsGPlMjiLePg35LMq2rpDfO2imdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPlICK0qTM2ftW7dyRaVxeBZnPDfKljbdREWmdQtt5
 uIH5IObeEYSGIK8foSgzPIYurIouP3iZxA7N22pxwGLXAIGtFdBkVCe36m+yVNNXd77PECZf
 yhD6R81l6dkSN9VLXFOpBJZZmIm/T70LbdJTIWDR8u7weDyRuu9b7BChCdmjMTSSlGz7sO+X
 XM11WR3NTuj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhHhkByhaohNU6CL+Bo1vOaswlA3l8
 SkmWZsA+1Dr1fqOk2lqxrk3AftlB4o9n/Z0FedxUDupMToLQhKQvZptMZ8SF/0+kAgtNZz3O
 ZgxGSCradaChvGgWDU+8XIfwsCrDv0nVMS1cooy1BPW4oXb7Fc6aYF+llOLZsGFCXmrKg6De
 hVCt3G7vo+SyLVU5nghBgt/DWQZAVwIv/fKXJy//B9kgIm00yR9nFohPD2xRw7hdYAo5ot3Z
 WzDk0nrsAIciYsV9MOOA42e7rBNoX8e2O+DIusGyWTKEgmAQOEl3el2sR/2AmVEKZ4uKfa3q
 6xFm9liQ==
X-IronPort-AV: E=Sophos;i="5.87,218,1631592000"; 
   d="scan'208";a="56827957"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=glUjEAOe+SEZPYlmjZIke40fIZHeCiku0GuQA8lu27wvI/ll42Kp/chBJINKCBO1Cw9c3rQgKyGP15lrSgE0/dt4RKK2xZOeb24ch8+Nn2e65nQC4l2dFpyqjEjmAArPhXVZhGsIk+Cyyv/4+tApUjfK0xItvRzWS5udU+wNm4x8ROHhUPuW9MFqNDwRBlob9XP+v02i1PEFTiNCDD39ekSYt96RK8gqtIL4Z2OL3pUxPP6x2dUoayKTLiu+fFOn4KNWPI0pgFt2GC3eTQ+r4XlaRUQNkaqHmil6sbCvuGeD91R43JFStPufB+4LxXc/KkugdSMQDEUflHSwHVOu2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvwTWBO78gYjePkOz6Qet8Iqr9ShlnVZ5B/L6m9IocA=;
 b=nCazKOwCBwkZaZrsCEEIKDG/Ye3mwZTvPeFDBk2p4HYnYau+Qnpp2FPzWyBmGvi7nRHRxmrNomvDKIXC+jzhQrKf0yv5H9YcwfNiq2dFXq1cBC5BtGCoeG4lli9z9bZqK1Qs5hivD0+WBWMoJ2Z0pdnzMjFLZfY995iQHpf6g7/mbNvMXWlKmRXbrtN1hptes5NX9NfT4u0ieVMJAyeHOBQmr93uP5ppBcovll12x3n/OjStNodxcVl7/s6o0GPrfJYCPTaD6T0DefL0Zmi0yqD1Bx2OUthG8K9o/9OEpzpDlFKI/R8umKZ9QXJw5AF8KJYM+Cl/4pMC4uBojdrZ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvwTWBO78gYjePkOz6Qet8Iqr9ShlnVZ5B/L6m9IocA=;
 b=OAqvTxKNTAZxZtz4W9j5E9+nY8jEcyA148fLJaVPW+zEdtXQBXBCx84AbQKbDLU3YFul/whbCdW8QmHWxoeUC0Y3BWLL2z/mulbBYD4pR53bh25KEVWzqsSmWxUF5Q2+55RXDz/jqN8VRRFh/nb/scfbVRdG/ghKdvCsi5jcUP8=
Date: Mon, 8 Nov 2021 12:54:36 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2.1 1/6][4.16?] x86/x2APIC: defer probe until after
 IOMMU ACPI table parsing
Message-ID: <YYkP/CHNz7bK466i@Air-de-Roger>
References: <d88cfda3-54e4-2323-f536-547879380815@suse.com>
 <0c006378-964b-3e48-4fe0-4df88e3131e5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0c006378-964b-3e48-4fe0-4df88e3131e5@suse.com>
X-ClientProxiedBy: MR2P264CA0168.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e23d4b9-18e3-425e-b04c-08d9a2ae8c8b
X-MS-TrafficTypeDiagnostic: DM5PR03MB2633:
X-Microsoft-Antispam-PRVS: <DM5PR03MB2633D3AE29E2DD85F148E0EB8F919@DM5PR03MB2633.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WKqPyxU1sQi1t2wEm20xPnZLW8lJ30PW9VUQybTs9k0QwmZHMeKrKelDvK/8PYFMYQy4yAB5RKNqKZQ7dpGlJYd/xVZeN5bATochKpulYTD4v/ALuXBaeMKlGGERSWZiJhzHtj3s3JOmT7Y4p+DigpsKp+0H0g16pVM7d4X4dsUL2vHrDJiZtuCl7ek+RxY95884JGUbH59VGcLeOGurCA2GmNvYekExf5QB7cO1w/ul9piQBBz294QKSoUkS9JBcotKb4nciR9ZGSqoa1SNO6TA67B9jnNt02c1wMeC5BTuACPEzFn+xs3gfjMrWknu9Ngsp7tbmHzgsuKReeuRXyVC9Wy1KS8ITk8tmsJXkpLMbtPwNzKKkkUDyTmoDL4g+9RLXxE17pkpFSzIns+gf8DCRkjlrs5tSKaduwQX9B8/RtVmFS+f45hvLqQC2vREFlUIUgSnzXxtyAyIBJnrK++3T7Um1ONe8A9J930X5T//mFoaEZj5lHZrxio7SZbndQpNbJOe9PUyWYOHCdtjcgqB0jyAzHXQ9xthriDBdQKwNI4L8emExEZPfBE71i0cnfsSlesQs3I2l30mnCfKv5MJb8YyuBkYI44BBNr2ooxWn1LtVQiGOr/2O3t6Zg2z43weFljqYdVWD6nnnTQdTA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(316002)(54906003)(2906002)(6486002)(8676002)(956004)(26005)(6916009)(66946007)(9686003)(66476007)(5660300002)(186003)(33716001)(38100700002)(8936002)(86362001)(66556008)(82960400001)(4326008)(85182001)(83380400001)(6666004)(508600001)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUVXb1NjT1FScUhlRlRSU3JRQS9DaGNVNkh2bUxtalE4WUhTWGVmSkVPVnBw?=
 =?utf-8?B?a2Fnb3hFcVl4SVNjaTN3Zk9xTlZHdHUwZWVTZkZNaVl2VFZlc215eEVOVFRa?=
 =?utf-8?B?ZFNhdXc0K1h4c09MWTdPdFVNbWtjc0cvdHpQMTlVemRVQyt5MWh2WWZ6ZWpj?=
 =?utf-8?B?MmlIcmkyQlBPTGdlMWdpMy9TdjRLb3JTeDVsV3hCajJoRlp1RS9EY2lIVE4z?=
 =?utf-8?B?eXAwMHRUanlvNWNKMVorMG9RTTJCemtYZ1V1Mmp3M1o0MUw0RG1oZklkcW15?=
 =?utf-8?B?S2NQVnZJbG1NRnc1MGlBOVBmQ1V2RTB3djZlUGZpUktqblJJRDgwbnk0RC92?=
 =?utf-8?B?VnVMU2xwZlJWZmd2RnFJNkY0MEcwSXV1eW9rTWFUVS9CZytlM3RxN2k1ZWcw?=
 =?utf-8?B?WCtkQ25aWGd1TlJMVzZ3OEF4dGlEY0pXUkt6R0ZHa3FDL2E5cDJFSGpzK2hS?=
 =?utf-8?B?Z1V3OWlrL0VNaEV3dlZDVWY3VmprTEFERkUzYkRjTFJjNjh4TDBKamlaOHZV?=
 =?utf-8?B?QXBwTm54Q3MwenliR2tpbWdnbW90MlpXdGNuMnpQVmhLSC9MU3pBYXhlMEhk?=
 =?utf-8?B?SkNSWWRuRzM2SzFnUURnbkJBanlad2dQSUw2bW1VdWFsdi9PSk9vL1c1YmhL?=
 =?utf-8?B?WmdqZzRUajF2RURKVldmcWFBSk1ZWGNtOEx1aStBdHVsUjNqM3NRSHloaVNp?=
 =?utf-8?B?VndueDRXM3BoT090cHhhdWxLTDNCdWxHQmhyMDhpU2JST2tNZHpnRkhuN1l3?=
 =?utf-8?B?clVMNWZUcEp4TlRTRlJPcFdZTkludzhzVHV1Mks2aEJWUm1GWk12KzMrSHhm?=
 =?utf-8?B?TnBIZFBZR0Z2S0NPSUxCeEZKV0k2TWtleTZkY2ZxSXIxMGlpbGNGZGdvNjM0?=
 =?utf-8?B?ZFdRV3JlcExsZHFJSmJ2cTVaNThmVHBaUDhOb1NzWUxYL1I5QW1EeVU4UVNu?=
 =?utf-8?B?eDFXQ011dE9FdmRCQTl5a3pEZmkzb2J6QUZpaHFhek1UeTl1OTFYRkpCdXVj?=
 =?utf-8?B?YkdyeWFxS05nYUZ1TTJOOVFPeXhEcHNrTkluU1c1RmlVaGF3YmJ0SzI3ZVA4?=
 =?utf-8?B?MXJQVllXNlZwdFkvYnltSGdvMW5WdFJkdE5FSkgzWXYwcngrV1lKN0xTMSto?=
 =?utf-8?B?eEVvcDFidHdwMnFDR3hMWGtCVGR3cVArTCtJa2hmcDB1dk93WTQxL2diOWhQ?=
 =?utf-8?B?QW5TREgxOUdod0txc1FqUWROVHBvVlR2VVNZMzY0U0JMeC9hU1Z4TU1wK2Qw?=
 =?utf-8?B?bWt2VVBVVndCTkFMUC9vQ24xdDhuS2FrWVVkanQrNk9aY0ppYVMrUm9RVStx?=
 =?utf-8?B?WFJOVm5wNUk3VGdrUkhKVTQrS3BEczMwdnRYTkJpV3ZjbTRtakd3Ti9mb0tF?=
 =?utf-8?B?K0IrQ09NSXVZQTNaQ3VQUmh6MEZBUWtKbDJMeTJtdGdnL3NRaHZDUGVPaW1p?=
 =?utf-8?B?ODliQUNqL2g5ZFgzR2pwYUxkaEZMNnY2VnVBR2hjWnhYOUpaL0pUcjZtN3FC?=
 =?utf-8?B?VVhZTXR4TUI5MW43SHViRzJTb2VESTFFOEpiVHFSbjNxRHBacGdJZi9qZGVM?=
 =?utf-8?B?SEdPc2xSWTVqQmpEZEs1ekxiN25mM0ZQYW5UOHpBTnpZNlZ3c2l4bXFwdENG?=
 =?utf-8?B?NzF4OE1wTzRSVkhiQ0JvODBRQnlDU1RMOUEwdGFMbnFERGRGaUZQSzhpV2NC?=
 =?utf-8?B?TjhEalFTYW9wbFl4cCtCbm1mMzNLU1pFTkN0czBpZHQ0dXNibHVMZWVuZEoy?=
 =?utf-8?B?bU4xTzhUd3k1M080cjBCcGV0RkxuQm5HME8rYVZoaHlOekdXc0l2THMrWnZu?=
 =?utf-8?B?K2tNd2RTMGRybnpQRGw5UlJiQjVBbTZqcUd4RldKTERrUWN5VDVnYjdMaTVh?=
 =?utf-8?B?bW5BYjJaamVaYlgzekxaRm9neFJKMGRKTk00bG5pKzRHYkR5czVoOG5ZSWo4?=
 =?utf-8?B?K3RZNmZmT2ZQTGc4eTNzQmVWSy9UYXhEK29ON2RabU9pK0xxZmFFQXhjWWoz?=
 =?utf-8?B?WWdxUWpQTFZJeVorWWR1eEs2MkcvVkRhTWNNcVUxZklKdHREREh4TXdScHVp?=
 =?utf-8?B?bCt1TkVJczhKdVJLOVh4L2hRa2lzSnhxejhvVFRMRVRoQjZGRjVTUkFmdzZw?=
 =?utf-8?B?QVcyd3JmZ1ZMVUk1bjUzcXE3djhZREdrTlNBRVQ1UEZjQWhqdFNHN1luWGhU?=
 =?utf-8?Q?9lqr12i46zD4+9SlQoYgzcM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e23d4b9-18e3-425e-b04c-08d9a2ae8c8b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 11:54:41.7601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W97yJajgMel+gVNmlZwX0AlwuGUMPbx70I+J/WgMSxLxDmoefMc9PgzH7YnUKufAKZNjspJM7dBncAaq2s+eZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2633
X-OriginatorOrg: citrix.com

On Mon, Nov 08, 2021 at 12:40:59PM +0100, Jan Beulich wrote:
> While commit 46c4061cd2bf ("x86/IOMMU: mark IOMMU / intremap not in use
> when ACPI tables are missing") deals with apic_x2apic_probe() as called
> from x2apic_bsp_setup(), the check_x2apic_preenabled() path is similarly
> affected: The call needs to occur after acpi_iommu_init(), such that
> iommu_intremap getting disabled there can be properly taken into account
> by apic_x2apic_probe().
> 
> Note that, for the time being (further cleanup patches following),
> reversing the order of the calls to generic_apic_probe() and
> acpi_boot_init() is not an option:
> - acpi_process_madt() calls clustered_apic_check() and hence relies on
>   genapic to have got filled before,
> - generic_bigsmp_probe() (called from acpi_process_madt()) needs to
>   occur after generic_apic_probe(),
> - acpi_parse_madt() (called from acpi_process_madt()) calls
>   acpi_madt_oem_check(), which wants to be after generic_apic_probe().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

