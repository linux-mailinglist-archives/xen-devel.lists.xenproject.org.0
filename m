Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E68B96D96B3
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 14:04:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518880.805851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkOLC-0001RV-OG; Thu, 06 Apr 2023 12:03:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518880.805851; Thu, 06 Apr 2023 12:03:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkOLC-0001Pi-K2; Thu, 06 Apr 2023 12:03:46 +0000
Received: by outflank-mailman (input) for mailman id 518880;
 Thu, 06 Apr 2023 12:03:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w3yY=75=citrix.com=prvs=453e3c94d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pkOLA-0001Pc-87
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 12:03:44 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 110cf3b7-d473-11ed-85db-49a42c6b2330;
 Thu, 06 Apr 2023 14:03:41 +0200 (CEST)
Received: from mail-dm6nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Apr 2023 08:03:30 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6987.namprd03.prod.outlook.com (2603:10b6:a03:43b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.28; Thu, 6 Apr
 2023 12:03:23 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 12:03:22 +0000
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
X-Inumbo-ID: 110cf3b7-d473-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680782621;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eU7mxl30llzqrhO3LN68GckiTQC15SCNsmT0mt0lHKk=;
  b=RsmdA1coAMUTfAEsi4DV7EJkcr/XSdVJUcVWzGtjVv5KGdXJ45HhCNQJ
   zFdG7dpn8q9uKX9RS/QRsBziWSYiKKCCEqizNlYFsi/OCdSVgki7cUNmh
   WQ121H2bHvFYOAxnLHLt/t3s+2Kp0DeXaZKc1d5Lh6wXedW1AbaqjWD7k
   U=;
X-IronPort-RemoteIP: 104.47.58.103
X-IronPort-MID: 103916226
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:FRPVnK/EILh/rvNOooCrDrUDpH+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 GMaCGuFbPbeZ2bxco93YY7n/EhXu5DdzoNkHANp/is8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmOagV5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklkq
 PZJJjUzViqogues6ai/SeJvqMsKeZyD0IM34hmMzBn/JNN/GdXvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWDilUpi9ABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdpJReTmrKQ06LGV7lc2JgIzXHn8m9ughUCcX5VfF
 FEU4xN7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3Oc1Qjow3
 1PPgNLtBhRoqrSeTX/b/bCRxQ5eIgAQJG4GICMBEw0M5oC7pJlp10qUCNF+DKSyk9v5Xynqx
 CyHpzQ/gLNVitMX06K8/hbMhDfESoX1czPZLz7/BgqNhj6Vrqb/D2B0wTA3Ncp9Ebs=
IronPort-HdrOrdr: A9a23:d7TxqaDGWC6cKLHlHemi55DYdb4zR+YMi2TDtnocdfUxSKelfq
 +V88jzuSWbtN9yYhEdcKG7WZVoKEm0nfQZ3WB7B8bAYOCJghrMEKhSqafk3j38C2nf24dmpM
 NdmnFFeb/NMWQ=
X-IronPort-AV: E=Sophos;i="5.98,323,1673931600"; 
   d="scan'208";a="103916226"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aTrJRnWWTdBIZe9cID1HrVYEwuVs1kjWJsCkk/VDHpCXDubzlEAetgOxHYrZjxU9k53JekxQdjocgkyhUel+V7GPbAcgORyP91wpp5gRZYFLLR0tX55DEPyN/IYKprrxlwdgAkeX4Ft86p8gfhgqrriMn6F+QhzCUmXpl1xUslKFxg2QLxCj5ienJgDwWiShm8EwdfZDHNJZIjMlfvBBYxdfA4U0x+BWfQ7PwElqDvcqcQZNkbkBkqmnOOvxBllMp7/yVQGSY+ElBIOMuWz2UKjKmT15rk6L8quA+Kg3TDMjAed8ktxlzuhfEKZ5iFHWsmzWk8ABP9IOhd1FdaIuaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6i38wPZdc2HHQZDfVFyx6muok1UOMPpytAyqDoQ5UiU=;
 b=huPk0GdIFidvY78QhSIK1PJBqR9UbA5G4c0VhKON1juM459RyoZOk/O/ZO3Md5jMY4ojfQRATRs48l09O8MCP891JJlQGjGfPTE4EmhiUGFPIC27Z13yGTQY0hRyyhlQcAbBKtJxPkXLpMloZ6HYo/qCydL3MR1YOC5ilLH02V9qBlADXmCuy7x725k4i+6N4e4N33B99StETO9AbcUNyM/706TGHvn4nmOQ5FveRrE6QAfdXQWUQWKuoKQGg+J978y0IRld7HpjnrL8ALtvaTgmN+O7esaCrHB+SAOAZVs3s/oh9K5Sie4/vzkn0EZYmIIuQ/O4y8CrtDZd2NZifg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6i38wPZdc2HHQZDfVFyx6muok1UOMPpytAyqDoQ5UiU=;
 b=RrCF3KP2eeOX71SIYDrm34Us1n/6qH7VKSBOUyHb5n3QIzWYh+NGEGwoLV78Q177IyVtrd+aAYO/GM7cr+LcGQJDJHrm/A2/9F7a6fjdBrivQtNe/Weq1k49erPrQWQmZE7OcTpNITi5rFLG7QP+ZFXR7lxMHpsUDaa8JlUchG4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <df05f3fe-41e9-5ddc-2a9a-00882d4e54f7@citrix.com>
Date: Thu, 6 Apr 2023 13:03:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2] livepatch-tools: remove usage of error.h
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20230406114106.54735-1-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230406114106.54735-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0410.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6987:EE_
X-MS-Office365-Filtering-Correlation-Id: ad3f8de8-525c-45d0-37bb-08db3696eb15
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	feejIuUdtno+9H2vaqMCxKylL2bt6/bDgzqdIS4MeAvyPJJQ+iYDqMRckyUKa88x4ceCERnQxCAPv9qvWF68d3urdRM6nbvBs33dAWzEF6KAOUcWKhS1K+Ybm/zd/IrxF5ZfZCHO/8d4ZcrDt8z4wik8e5aUYRbS6U+fxavvWHx08Y6627DrB09rhIFAmG/BBfg27GqqN167rtmVOcv0lH7e5fjt+mbyJyuqa6gLw5Gk9Y7Ced3je6NltqSIfch3F/b+n4nQ/BtZQtt1tYGsz0b8x194dsNfdkDtOBD3MJdeyUcHM4T/+id/WRfrrPHzhDAXE4v/k9t/eqCamMI5FB9qkAawX1r6OTqxMhzDVDtC7RUXCi19be8nuwlTX1iJPXONkGCV0wr+JF1B/EuF3LRnP90vBPPXaQ7tA+1Z57N0VdVC9drZy7VqDPLb4yrUgVnT7fO/mExKUhW/jIHGIfiG0gC6gxjVy2dU4ThJJiAeC/xn0a+9IoAZ3m2bx4am9mWTKpjTt7B/1qA5KMXC6MRxA08zeBh/vmcrS9ix8klo0GmarUywZCtMvpJx2LxQ5iMOZxfNDkIh6j0KLy0mgu8BIaatmeqy6UKULurGGAjw0w0BCL6HmbHAa3DRVrJgSNMM5Hx23opPBPs1QoJqmA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(136003)(366004)(39860400002)(451199021)(31686004)(38100700002)(66946007)(6486002)(54906003)(36756003)(41300700001)(316002)(66476007)(66556008)(6666004)(86362001)(31696002)(558084003)(4326008)(107886003)(26005)(2616005)(478600001)(2906002)(8676002)(6506007)(8936002)(5660300002)(6512007)(53546011)(82960400001)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlU5YjdGRTJJN2g3UFVlYzBmMkN2Y0NCTWVjRGN3RGRLQnJrRURySHhWSy9W?=
 =?utf-8?B?cnduNVhndzhxaTU4VGg4L2lkQmY5YUhuS0ZWNG5wcllvbDkwM2Rsdld0UkZI?=
 =?utf-8?B?OVJCSUFjdUpSMFNZelJzd1pZQ09pcEUvaWpVZDNCcGVGVUtWeHloM2oxQzR4?=
 =?utf-8?B?SzdDUlNsaEp1ckdKalBQenNaNHFJS0ZXblF4REVkcUVJODU0TFdxTEVNNUk5?=
 =?utf-8?B?QmYwbUtiVVdpeG0vSE04TFJ4d3FsNjZramlHdXBGQmgrU3pNVmJtZjFyZ2Ry?=
 =?utf-8?B?Yk0vK0dzWVRFcEFSVzA3aDdQVnRtU01vMXdZUllSc0dGcHFsbE1vM1VxRG8r?=
 =?utf-8?B?VG4vM3VMR1o1VGdRaEdtaUlrc2tuSnVNU0tyVkdYaXoyYis3b3Jkc3hDV1R1?=
 =?utf-8?B?VkRWRWhLeWtDcDZHNDVoeVVLa1llSDNhcHhiYnA3Z2R3YjJ4RWorTFJjNzYv?=
 =?utf-8?B?ZndmU1lyazgrQUlnYmlxdkRNN2FyRVhPSFJZNTljVkVZOWc3WVRuR1R1ZkRt?=
 =?utf-8?B?aGdxdFNLeERhSVp0S0wraTBDN2Uzd0hNMWxZTVJNNU5mbjNsNkhtSG4rY0Ev?=
 =?utf-8?B?VjIyWXdNMVFCSGZrMXkyTW1MeVNvZ0NHVk0zbGhJV1p2NEllQlAyakpUTDYz?=
 =?utf-8?B?VVlja3hHdS85emxWYXk3dCtGS3BFSmNGdnVlcmhUTlF0NVdmS2toMjA4L3Zr?=
 =?utf-8?B?WWEwTTNYUzFDNkx1cmIxeVZRaldBT0tsWDMxR2ZpVzRpUGR1eWFOemtlTU1s?=
 =?utf-8?B?NWVqK2NNL2h3ZGZBWXk0bHN1SFFSWVNBMmIrQ0VvK0I4d2F1R1JrKzVEZnQr?=
 =?utf-8?B?Q1NRTnJiVEoxU09YellLemVOOGNua3I5aEhHS3lhaWxtK3Q5Q0QvN0hqN2Vv?=
 =?utf-8?B?eEE3cncrMjJyK3F6cGNkZUpQdjh1azlIcElaalpDc1RVQTZyelRWYUhGZlRk?=
 =?utf-8?B?dUpUSWhNMWZNZG1wamd3SDhxZys4OW13N0ZpUTYwY2x0OFlja0dxZlUrakwz?=
 =?utf-8?B?RzF4N3dmWVAwcDhCTEVxWHkzVGhILythcHp3Q1Ivd1UrY2ZtUTg3R0xKUUNF?=
 =?utf-8?B?T2FIQ2hCRnRKSER4QzVaZnEycm9yVkI2cGsvTU85Nml6TDc1SFkzc3doZ0Rn?=
 =?utf-8?B?VnRlZEd0WUthNW1pbmkxcjlLK2d3OXJsVFg1cSsyZWFOZUxTRFpTWWlLelgz?=
 =?utf-8?B?aHMyVXJjMXVPcUhrVXRFdFhvK1FUMm9zYVZjRkVhd1JWMWpHbnJJVXkrcTVI?=
 =?utf-8?B?SjRIY2cwTng5eTR5UGptNVV6LzUrbUVEMEVnUCtMMUtZd0ZJOWxQU3lBSjVZ?=
 =?utf-8?B?RnFUM004ZGVZL2NpZlBRc29DUFRZZUFZeHUzeDM2Wlk0d2N3K0xabEhWekpM?=
 =?utf-8?B?VFRaSUlDcEczYlJ3dWFNWDBLQjBnai8xZlJ4UUk2Ry9CNlpBVFhqb3dVeTI1?=
 =?utf-8?B?SkxualJtNFlpUW4xSlEvd2NSNU5XbzJSajNVUEtyaHpYc0VSdVNwbjhuYjQ0?=
 =?utf-8?B?RWZHYXdMMVh0WVkwVnpKcFcybUFWRFVVZFVhTndsY0lrTzhadW94YmQrZmhP?=
 =?utf-8?B?bURCSTRPU21QcG9hUmZ6Q25XYlhPSXJBS1EwUTNjVktVOERVakJxeUZFMGpX?=
 =?utf-8?B?VDJuZmhiTWNyNmRWWlZWdDBtS3dQb1BsMTVOYmp2NUttU01NN1lkSVpIY3px?=
 =?utf-8?B?eFJVVCtTYXZMbnA4THNRK1VxQzE3TUE3R3BxbjUzZm5RUWM5TWIrbUF5K1Jp?=
 =?utf-8?B?NTRlV2hjd2cySGNZTkRpS2czZk9vUG16TWVnTjZ1aDlEQ21UYktmOVNMZVNR?=
 =?utf-8?B?RnFvQ3piTEZUTVBRTWJUM1hLRDJFS3dZbzNjUUoyZHFQdjJ2eHd0T2hnWE5t?=
 =?utf-8?B?N1lQU1lTZUx5NjM1TDJqMzY3aEhKaGxCOGswZkQ0WVhGRWIzYmVMVCtlMnBR?=
 =?utf-8?B?N3Y4ajBRcTgrcnYrRjZWNzhNNDdDWDRZbHdVUk4zdWhxdU1YcS9tbk1QNmgr?=
 =?utf-8?B?KzhYREd2VmlDdDJobjZneWNtSGxFd1creEZyZTB0NnRQYjFjcm55YjZNeHBO?=
 =?utf-8?B?cEFQQjRCQmQxLzBBUkhRa2ExRWJEcnN5SFFSSkwrTU9pNlFSZDU4VCtmdmhx?=
 =?utf-8?B?RHR2SXRZaVhLaE91VjJGWGluUkRiaTVmQUlpSkNjVmxkUUNNOVU0M0F3N2sr?=
 =?utf-8?B?NlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	c9NATHlX099kTY5/bfjafgXO94OWI+TAy6VTyXdtiEioicngMx8bhVboCJuoxSa2A4U/r0TcyNYQr2CQw2vyvQdWSCvXO+nwZiWVUJV9wNbJSS+6zhwNnDhFjnXhj1HyPHXmnvXfaDE+C71DcR7Y6u60CE/Nn5WKqGtunckDD6jI5XtLKybbhgvJxrAcYd+Qep7fKLKZ5rzFwecgwnU1ZhlVLOh2yhDsj80b0K5DsswdYPLF8XZR1rYUyGZUUs130MAiE1EY4/U7edn4E/b9+2vXC9I5tBlRyDlWv7j3KmW+RfNT61NhuVMaVxkYdgueQ7qq4R6uaOtYdWS6bcOjAthVYMW4JYXe3yr2c5w58JRLv13YuVfui6mDuiZi9XOrWoiqLrvLk+Id/7/SQM0DrqdQyTRVI6vGlu/2Vr/ZtCVTBsocqKE2jKAOXb1e26b0Tj6ENuE07X7oJKfii8MjNFkmnbg84KKcMIwtpvzOyPc4XKm8rwEx7S4xl3fD1SJy6MhLjenSIxUiYl+8C/9uPp1TBEZ2zClgwHABfJR/PxZo9CUWm2IFddHQ8qSg7ZNGWn0nFRM5JWChqPQ9ZQwoHavVGwK/EjzDTxT/uS87z7+sNjAHESUtfjMR1GkQQWN0o+VADtAgNJxxkZj4z6LIv5RZxVmGxYJFapA40xuaitVBxYJ58rlAsXOEeNWOIDkjF7HtJSF9SbOy4+frAo/153AMLRPBPTh5TdooxMQarpBcOiLF+vg7BxAUuFzQoY34fRuT35ygIQQJrn+qg/JlSst6aadncuIn6gmiLtFF0iYaNixidnk6bKEOswUwGnFt
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad3f8de8-525c-45d0-37bb-08db3696eb15
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 12:03:22.6327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XXfAgakRayJAD1BS3vL5Obk7GYlbbIHKFzZ1wjfg4KzSGOSLu4IZW5DxyamHlgn09yzQzvVs3m2uQo8JDl0cJ1x6oOtuTPM2K3tyYUNbdzQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6987

On 06/04/2023 12:41 pm, Roger Pau Monne wrote:
> It's a GNU libc specific header which prevents building on musl for
> example.  Instead use errx() in ERROR() and DIFF_FATAL() macros.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

