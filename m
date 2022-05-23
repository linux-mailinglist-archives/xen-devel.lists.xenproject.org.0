Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2013F530C48
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 11:11:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335614.559777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt45I-00054P-JY; Mon, 23 May 2022 09:10:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335614.559777; Mon, 23 May 2022 09:10:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt45I-00052R-GR; Mon, 23 May 2022 09:10:40 +0000
Received: by outflank-mailman (input) for mailman id 335614;
 Mon, 23 May 2022 09:10:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1/tb=V7=citrix.com=prvs=135606018=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nt45H-00052L-L7
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 09:10:39 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3496e104-da78-11ec-837e-e5687231ffcc;
 Mon, 23 May 2022 11:10:37 +0200 (CEST)
Received: from mail-sn1anam02lp2045.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 May 2022 05:10:31 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB6344.namprd03.prod.outlook.com (2603:10b6:a03:395::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Mon, 23 May
 2022 09:10:27 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.022; Mon, 23 May 2022
 09:10:27 +0000
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
X-Inumbo-ID: 3496e104-da78-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653297038;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=QmPYcP6Zo8r08YcSlqTd0sab6aSkDy9smRZc5NHTA4U=;
  b=Dp7oxfwXFJin2cKgJyFDXg3qmGB1661Pr0GYZnBUKbF9thOAoGCMyZB8
   FgyOWIX+iELC0W7F/qDbQeGFFeeNGWOjNYqt0qAXicvbhw/fZd/++jvv6
   UH/w9CxuoWunGbG7A/rD35Q4YWG/2MV2z6qxzWKLcB6uEN8nTQZUBpOgE
   o=;
X-IronPort-RemoteIP: 104.47.57.45
X-IronPort-MID: 71785547
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:kWNnDaOvoSmJ6yPvrR3flsFynXyQoLVcMsEvi/4bfWQNrUpz1jMOy
 2FMXziBOPmCYjT2eo8gPtu1p0lU7J6HzodrQAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFYMpBsJ00o5wbZk2NUw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z8
 edEnsWUVBkTFKztgb8FDxZzSjl4IvgTkFPHCSDXXc276WTjKyGp+NM3SUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB7HtafHs0m5vcBtNs0rtpJEvvEI
 dIQdBJkbQjaYg0JMVASYH47tLjx2SmiLmEHwL6TjaZm5FD63DVY7LHkF/zXfM3TeZxosX/N8
 woq+Ey8WHn2Lue3yzCI73atje/nhj7gVcQZE7jQ3u5nhhify3IeDDUSVECnur+ph0imQdVdJ
 kcIvC00osAa7EW2SvHtUhv+p2SL1jYDX/JAHut87xuCopc4+C6cD2kACyVHMdUgvcpuHzgyj
 AfVwpXuGCBlt6CTRTSF7LCIoDiuOC8Ta2gfeSsDSghD6N7myG0usi/yoh9YOPbdprXI9fvYm
 lhmcABWa20vsPM2
IronPort-HdrOrdr: A9a23:pRNFpKrgGmT0jwBLnhiPWGYaV5rbeYIsimQD101hICG9Kvbo8v
 xG785rsSMc6QxhJU3I9urgBEDtexnhHNtOkOss1NSZLXXbUQmTTL2KhLGKq1bd8m/Fh41gPM
 xbH5SWfeefMbEMt6nHCWeDfurJHLG8gd+VbKzlvhBQpElRGsddxg9pAgyfGldtRAZHD5IlFJ
 yaj/A33wZJJxksH72GL2hAVbPbvNvAmIj9bRMBHBBP0nj1sdqH0s+ALySl
X-IronPort-AV: E=Sophos;i="5.91,246,1647316800"; 
   d="scan'208";a="71785547"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MxsCX6vcFKt2K2w+h2FglrX4Rdan/ySQvWwQwCx2O7ZeoRG4GQ4rkRcHHn4hLzQgDVi9ZQshzsH2pebG/jwL9/cGHxSCkzmfonbazVkAYQqBGnNWx+xoh8ta+h+qneT/GGdUXMuqHbMfyyqs1H1f2/cdST7wvpSb0cd4IRFOcBRWl7uPY2FPAQwZs6+HQIg5nISb/l78k3cuOvhcj/CcAzNzHeLRZ4c7sIMH9Bh2TR3FoNhhFM/HYUv3XVZZ7U2MOaB47Ih5euSZDOsxZJs3RQDS93azYa0ahDm58V6kGAyOH9IizgFnoK+MctlDrBRxeJ15MkxTreuEOHJuPmjisw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SKJgNxPQt9o21Nwf5CUmDHwwizeC1rwiuNDaQvhGeW4=;
 b=Y9IBtViT5/0PR+hM4rtH7JDNEPOYh2JmEojjrJx2lF3q+PBEnljwHXk4kshSvlCaPcAtm+JZNR39jDFYuDDpSP7kmq94l7c8leQv9TrQGxx+gHRetc+4zEdwhGrJWC7gRDMRzS+D8ta5XPHu49qcRbMKRHnJ7CBBebbeDTsBNii/ZxZPxlcqkdWDonOFkWHbNDZ2flTRXiDlhrVKU3SH+mDne+IbiWEEz6o45Hgi2NXdL7b69/MhBNEkzAwTLVqIhDZ8AJbdNM2SsrJIf4Q00rDK4f81CjspC8hk3P+r9zNYTJba3648M3dQYkwOdECl7v2L8mN4XWfw9OPkxy8vkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKJgNxPQt9o21Nwf5CUmDHwwizeC1rwiuNDaQvhGeW4=;
 b=qNibvKCqduTQz8bKpJVoI0ruQssc6W/sFUNvZGcHuc/W11Sa6it6g4rzBt98OtUqTFGkDprJneuLqF3cDnW+fkJONOmKsCsJ/EtdYYu7qoGgvMpLmLujFlrVSV2DAZXMT41bOz3N2CHz2jBy35T1EDqRigYvec2AbkhMklX2F9Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 23 May 2022 11:10:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 13/21] IOMMU/x86: prefill newly allocate page tables
Message-ID: <YotPfkl2mot7jigj@Air-de-Roger>
References: <YnUDeR5feSsmbCVF@Air-de-Roger>
 <6666ab70-b68a-eac5-a632-893f950a984a@suse.com>
 <Yodx21zhWtZCV2dY@Air-de-Roger>
 <600c894e-a35b-e27c-898e-8f1cf3ea0ee4@suse.com>
 <7163fdba-c128-1226-e1cc-d210c5db06ad@suse.com>
 <YoeH+9eMU0ui68Mn@Air-de-Roger>
 <ae722d7b-a958-1927-abfd-43c04bc6b369@suse.com>
 <Yoelfhe5wLGy2cfd@Air-de-Roger>
 <Yoen/kI3WTIZaEQ6@Air-de-Roger>
 <fa7b050e-cd3e-6c1e-b0d4-1e3355b4664a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa7b050e-cd3e-6c1e-b0d4-1e3355b4664a@suse.com>
X-ClientProxiedBy: LO2P265CA0126.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ffb5e64-dd08-4e2b-bbe4-08da3c9c138f
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6344:EE_
X-Microsoft-Antispam-PRVS:
	<SJ0PR03MB63441DC9677DE8CE205A343F8FD49@SJ0PR03MB6344.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Yc1HKtc57ZcR0EMcViQkhQ+71Ob+FyWpEUqZTCCgoDVcu6CUZndTt6Fd0XtSpZSlZEnMaNSTeO2LJeKudhlgA++cxk1wZ36mz1s3b3wp/ffjfz+IOya4RBMwyl2PUOc+Okt8q/leC1FiUb6UtkDSqFRpdnEkVNoJOjRULzRDFpXS4Q/gwf9zwBdQi7eOagXugk+W91cE1EZzSjFTJwDyHll9cQ5j54uqUsP2kG/GJTedNd5+6ggq9BrLgzExZ7nBu507wJWMqIjnv0SZphPIQw8ZCpvXkwvEh5KuwU7rbhlX2vnJphO4HMQNwSWZTAzI3KLRA6nMoDWqbhESWMOs8ThewtmIvxd+Ec3ieSlJSDiDeCyhRKvxPofApy4OrTifrxNSbR7lWk7PyjvbIDvfFXlPdlhkVxb/Ik7duBAEYIe4kxmAoPXKkwTlGIGK7/k1qKwTO3xO9YdcXzcD1NhSJcYyejl1hRVowk5T1fXUArWzmw5ilx/nYaj/rBUFudCpZl2Qrhpvh6WzjiqGYbpFMH6Rj8UKlXesyPKYCmY+kiqwxWl71KLa8oQCS7Zg0c5yLMi/x59YReLNzloUv+LbZyQ/mAI0ZQTbfc6yqzZnCRDhdIps6Rdgly+QPiUkNAcwkR1s+7nzjiiEcew7oSma7g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(83380400001)(508600001)(86362001)(6486002)(186003)(26005)(6512007)(2906002)(6506007)(9686003)(33716001)(38100700002)(66946007)(66476007)(66556008)(4326008)(8676002)(82960400001)(85182001)(8936002)(5660300002)(6666004)(316002)(6916009)(54906003)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVlHeWhoMytnazkydklKOUxuYWNnUE9KeFpFci9VRXNuWW1lZGRhbEhocHJD?=
 =?utf-8?B?T3BoUGNKV243RzhkVjhQNTJpUVJOT2NpUWZvclFVVCtGMS9IWkhiL055U2FI?=
 =?utf-8?B?Wm0vWmoycFlIcWVEVk9vMGRGS3RMVWdqeHV5RS9MTmZ0RmI0aXRGd242UkdL?=
 =?utf-8?B?RVNXVXRkTndFbUdObm5oWXNzUnA3NUU2aEsrOHBQY0txcGpYMUY3WldnM1Nm?=
 =?utf-8?B?MnhxeU93NFczSFo1MEx2alNUSm9zZ3p4cTJOUlMweCtZOStmQXZmY1RWUUtu?=
 =?utf-8?B?ZFd0TmJENUNIQWVteDZzVUF2dzRMUm9kR3RqNHNmUDZEdTlrZzY3S3dGcHRl?=
 =?utf-8?B?ZWYvbnM2TTVxSnRzdFEyVkIxK3hlRDNMeDEyYXUxblVHd21KSk1xdTBzMVBa?=
 =?utf-8?B?LzNxenFlSE9oZlcxdGRLQnFjRDhJc1JwTlhvNzB4RnVUOW9jdHlSanRDUjNI?=
 =?utf-8?B?alljdTNQN2I1VkZnbnZKQ2RKSWNwNTZTYjdWOERNUmtvdmZxcGF0SEVHSG5N?=
 =?utf-8?B?Zmd0Y2lHa08vdzFhS2dvVlVpZElLcnh2M0gvNHFaZ2ErOTlQY0xaalYxa1ph?=
 =?utf-8?B?VnUvSStaVy9NS3JsRmJjeTd0bjlPcGZvelhEN3hhQlc5VWJFc0d6dHY3M2RN?=
 =?utf-8?B?ZWZOWjlhcU1ndkY0c0dNdEVwSGtpM1hXaWVXRENIT1h4M1JLSzlVUnVCQlAv?=
 =?utf-8?B?Z0crdmlhQjUrS095d1RXQmZRdEs3NytPSlJnekVZa3ZQWHhCWldSVjNQcmR5?=
 =?utf-8?B?cGJPdC9MWnpIUTZXaGJpMWIrdU8xZXRhQTZUeWxqb3JzOUptUlFXRG5oZTR1?=
 =?utf-8?B?QTVyUnZFYnNKQWU3cy9zdGZCRlpJdmIyUkZsaWJ4M1g2WVl5N1laaHpEZWdQ?=
 =?utf-8?B?N2Vyc0NuZ2h4QnpmZjFHcW9qR1NGUTVuK21pM1BRb2tELzhRUmNPcjdhR2hu?=
 =?utf-8?B?NDRWakt2R0ZsSnM5Tk42eHRCeFl3QkVNMDBUTlRBbXJOelVPMGJPRkJkU0Rw?=
 =?utf-8?B?TWcvVlgxSlpXc0w3OFRQZFFzTnB2dFlsWUNGb0NnaW95WU5tWVBaYXlNaVRJ?=
 =?utf-8?B?Rm53STdoM2c4Z3ZJWXBIRFRIaUV1LzNydmc0aFhnMWN0Tm1vdnQxUC92Smtt?=
 =?utf-8?B?b1dscllHeFV4Z2I3dUc1QUY4MVRSUjNEQjJSaS9hYlZVQTBrWGl0NGNtbDVQ?=
 =?utf-8?B?OGRvZWpFcHhjTTNXYVFBenlSRmxuMU00b3pFTWVIQ29kNmNwdnpzSVRpa3hY?=
 =?utf-8?B?RnlBM3NJaWNReXg1OW44ZjBWRGFiYzR6RjI2TzU0T25NSHdyUENDbXBsWGp4?=
 =?utf-8?B?bXVXd0drVmN6dnhtamRZT3R3UEVZV2J1K3M0eHlIdU5BVDdxMm5tZGNMRnNq?=
 =?utf-8?B?OFhUS3UwaTZBOTUxN1luVlQzaEhDSml1dGFLdGJNTk5ZVCtmU0YyWVVINzZQ?=
 =?utf-8?B?UlpRcUtwaldKSGxZRzRRVTVqb2ljZUdWNklLdUdWT05rNllLaU56MnFQa3ZU?=
 =?utf-8?B?bmVIenZrdDRTQlpTQmZ1QmNsbFVoeXFvdUU3bFVnSFVZU0hpMU5FSTdVdFg3?=
 =?utf-8?B?QVlCYmpKZFBwUlB3Y3MxaWFoSVprbStRYmVRdVIrd296M1RzOEkrYVRkT0ll?=
 =?utf-8?B?ZFFqQmE5amttQWdTdjZselJQbmIxcEFrL3ZFaVYxeWVScENlRUh0RnlkK3dp?=
 =?utf-8?B?Tzk5SkozcVlJTDN3RVVUbFlycTFKeWJIbUoyQ3k1US9wNkd3cGZJN0ZOWi9r?=
 =?utf-8?B?ZHZuVGdTdkJLNE1xb3dBTmZvcURDYXV0L0R2Njkwb2Z0QmNhQ0x1cUxJaTdw?=
 =?utf-8?B?UXhvRWI4dE1maFIwYjRoc2ZBSmk2NEtKbEsyanowK3JJNENsOFZHY0FybFRo?=
 =?utf-8?B?aUM2NGpsWGU1cVU5QzRGU0pPd1pqelAzWTBORkdBRWtiT1NNVThOTDI2d1Nq?=
 =?utf-8?B?S0NRaXAzL0FhU2dqeUlLVUcwS3dxWHpzSGpPQ1pmbXg5M0FFK290djdPM3Zx?=
 =?utf-8?B?cmo5UlZUSjRDTStoSnVoNDI0VkQ3MGhlZ3RGdk1HRlhRN05Kdmp5cWcvdHJY?=
 =?utf-8?B?dUF2L1BuVlE2Tk9ZSTBVS1lEeWZEd1pSOUJta2xkZ3Q2cFhLTzRGSERPS1Rk?=
 =?utf-8?B?aC90WGVCZU1yT1AybVlKWk9EWmEyZHM0aHNKRUxZdzdjTVgxWU5YdS9MWnJ5?=
 =?utf-8?B?RFBUaTl1b1JQOWNFVTdaVkJFU25tSkw5RkE3WjdPVFZCS3NUM3dmaHU0MFBi?=
 =?utf-8?B?N2JlL0NvVUJUamJ5MlhxcEFFNG1IclFrWEZiNGMrb2Y1QVJoTXl3R0dxSmhO?=
 =?utf-8?B?Ty9zRUg3RUtzT3lmNmptT1lWOGlrN3BYdTVoZENyb0crRzZDWGwwVDNFUHRu?=
 =?utf-8?Q?iGA4zdWliJa56a6Y=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ffb5e64-dd08-4e2b-bbe4-08da3c9c138f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 09:10:26.9143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 64z7/ondMcf1L5ounOAqmqv05FvJmRLWEQo+CE/MSJ44v3O31Apzoz0q1dWZuc5oT5zpmFwv8O2XxCf9qjO04g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6344

On Mon, May 23, 2022 at 08:49:27AM +0200, Jan Beulich wrote:
> On 20.05.2022 16:38, Roger Pau Monné wrote:
> > On Fri, May 20, 2022 at 04:28:14PM +0200, Roger Pau Monné wrote:
> >> On Fri, May 20, 2022 at 02:36:02PM +0200, Jan Beulich wrote:
> >>> On 20.05.2022 14:22, Roger Pau Monné wrote:
> >>>> On Fri, May 20, 2022 at 01:13:28PM +0200, Jan Beulich wrote:
> >>>>> On 20.05.2022 13:11, Jan Beulich wrote:
> >>>>>> On 20.05.2022 12:47, Roger Pau Monné wrote:
> >>>>>>> On Thu, May 19, 2022 at 02:12:04PM +0200, Jan Beulich wrote:
> >>>>>>>> On 06.05.2022 13:16, Roger Pau Monné wrote:
> >>>>>>>>> On Mon, Apr 25, 2022 at 10:40:55AM +0200, Jan Beulich wrote:
> >>>>>>>>>> --- a/xen/drivers/passthrough/amd/iommu_map.c
> >>>>>>>>>> +++ b/xen/drivers/passthrough/amd/iommu_map.c
> >>>>>>>>>> @@ -115,7 +115,19 @@ static void set_iommu_ptes_present(unsig
> >>>>>>>>>>  
> >>>>>>>>>>      while ( nr_ptes-- )
> >>>>>>>>>>      {
> >>>>>>>>>> -        set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
> >>>>>>>>>> +        ASSERT(!pde->next_level);
> >>>>>>>>>> +        ASSERT(!pde->u);
> >>>>>>>>>> +
> >>>>>>>>>> +        if ( pde > table )
> >>>>>>>>>> +            ASSERT(pde->ign0 == find_first_set_bit(pde - table));
> >>>>>>>>>> +        else
> >>>>>>>>>> +            ASSERT(pde->ign0 == PAGE_SHIFT - 3);
> >>>>>>>>>
> >>>>>>>>> I think PAGETABLE_ORDER would be clearer here.
> >>>>>>>>
> >>>>>>>> I disagree - PAGETABLE_ORDER is a CPU-side concept. It's not used anywhere
> >>>>>>>> in IOMMU code afaics.
> >>>>>>>
> >>>>>>> Isn't PAGE_SHIFT also a CPU-side concept in the same way?  I'm not
> >>>>>>> sure what's the rule for declaring that PAGE_SHIFT is fine to use in
> >>>>>>> IOMMU code  but not PAGETABLE_ORDER.
> >>>>>>
> >>>>>> Hmm, yes and no. But for consistency with other IOMMU code I may want
> >>>>>> to switch to PAGE_SHIFT_4K.
> >>>>>
> >>>>> Except that, with the plan to re-use pt_update_contig_markers() for CPU-
> >>>>> side re-coalescing, there I'd prefer to stick to PAGE_SHIFT.
> >>>>
> >>>> Then can PAGETABLE_ORDER be used instead of PAGE_SHIFT - 3?
> >>>
> >>> pt_update_contig_markers() isn't IOMMU code; since I've said I'd switch
> >>> to PAGE_SHIFT_4K in IOMMU code I'm having a hard time seeing how I could
> >>> at the same time start using PAGETABLE_ORDER there.
> >>
> >> I've got confused by the double reply and read it as if you where
> >> going to stick to using PAGE_SHIFT everywhere as proposed originally.
> >>
> >>> What I maybe could do is use PTE_PER_TABLE_SHIFT in AMD code and
> >>> LEVEL_STRIDE in VT-d one. Yet I'm not sure that would be fully correct/
> >>> consistent, ...
> >>>
> >>>> IMO it makes the code quite easier to understand.
> >>>
> >>> ... or in fact helping readability.
> >>
> >> Looking at pt_update_contig_markers() we hardcode CONTIG_LEVEL_SHIFT
> >> to 9 there, which means all users must have a page table order of 9.
> >>
> >> It seems to me we are just making things more complicated than
> >> necessary by trying to avoid dependencies between CPU and IOMMU
> >> page-table sizes and definitions, when the underlying mechanism to set
> >> ->ign0 has those assumptions baked in.
> >>
> >> Would it help if you introduced a PAGE_TABLE_ORDER in page-defs.h?
> > 
> > Sorry, should be PAGE_TABLE_ORDER_4K.
> 
> Oh, good that I looked here before replying to the earlier mail: I'm
> afraid I view PAGE_TABLE_ORDER_4K as not very useful. From an
> abstract POV, what is the base unit meant to be that the order is
> is based upon? PAGE_SHIFT? Or PAGE_SHIFT_4K? I think such an
> ambiguity is going to remain even if we very clearly spelled out what
> we mean things to be, as one would always need to go back to that
> comment to check which of the two possible ways it is.
> 
> Furthermore I'm not convinced PAGETABLE_ORDER is really meant to be
> associated with a particular page size anyway: PAGE_TABLE_ORDER_2M
> imo makes no sense at all. And page-defs.h is not supposed to
> express any platform properties anyway, it's merely an accumulation
> of (believed) useful constants.
> 
> Hence the only thing which I might see as a (remote) option is
> IOMMU_PAGE_TABLE_ORDER (for platforms where all IOMMU variants have
> all page table levels using identical sizes, which isn't a given, but
> which would hold for x86 and hence for the purpose here).

Since you already define a page table order in pt-contig-markers.h
(CONTIG_NR) it might be possible to export and use that?  In fact the
check done here would be even more accurate if it was done using the
same constant that's used in pt_update_contig_markers(), because the
purpose here is to check that the vendor specific code to init the
page tables has used the correct value.

Thanks, Roger.

