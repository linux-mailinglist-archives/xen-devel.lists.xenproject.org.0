Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BDC51BA5C
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 10:28:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321715.542937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmWpS-0006iF-Gb; Thu, 05 May 2022 08:27:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321715.542937; Thu, 05 May 2022 08:27:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmWpS-0006gO-CC; Thu, 05 May 2022 08:27:18 +0000
Received: by outflank-mailman (input) for mailman id 321715;
 Thu, 05 May 2022 08:27:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T22s=VN=citrix.com=prvs=11701087b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nmWg2-0001qT-Hx
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 08:17:34 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce283030-cc4b-11ec-8fc4-03012f2f19d4;
 Thu, 05 May 2022 10:17:31 +0200 (CEST)
Received: from mail-bn8nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 May 2022 04:17:27 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MWHPR03MB3312.namprd03.prod.outlook.com (2603:10b6:301:3c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.28; Thu, 5 May
 2022 08:17:25 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.025; Thu, 5 May 2022
 08:17:25 +0000
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
X-Inumbo-ID: ce283030-cc4b-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651738651;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=DYHsY0IXWbJ6loB9haX+v463uMMw0RF3zHBUBC6ge6I=;
  b=iawZEIH3f6TDGSgc//KpDfwWYuGDz/CosvgB51HUF/02QqeGg0+Rg64Z
   xnG0OzBdWhJOC7nExhk5i//GIJBUYXUYEEmp2Ecv/KFXIk53ZMDg1BkAB
   TTGKHPbiQtVILy5/U9R6SdMMlNbIQwPtqhsRJIEmpiCpCVg9lM5idHcbP
   8=;
X-IronPort-RemoteIP: 104.47.55.172
X-IronPort-MID: 70022277
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:d53uNa4N26Bc5oa1sqoiDQxRtDXGchMFZxGqfqrLsTDasY5as4F+v
 jQZWj+GaKqLNjDzeN91aoqzp0MAsMDVyoNjSgtqpCtjHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0HqPp8Zj2tQy2YXhXlvU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSTawZ3PPyUxdgjDT4BAyh0H5RPpvzIdC3XXcy7lyUqclPK6tA3VgQcG91d/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfiXo4YHhl/chegXdRraT
 9AeZjd1KgzJfjVEO0sNCYJ4l+Ct7pX6W2IA8AjP//Voi4TV5FBJ9JbuP4rqRsSHat1bt3fFn
 liB312sV3n2M/Tak1Jp6EmEmubKlDi9XI8UG6y18tZrhkGewioYDxh+fUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasoRo0S9dWVeog52mlyKXO5B2CLnMZVTMHY9sj3PLaXhQv3
 16N2tnvVTpmteTPTWrHr+jO6zSvJSISMGkOIzceShcI6MXip4d1iQ/TStFkE+i+idid9SzM/
 g1mZRMW39075fPnHY3ilbwbq1pAfqT0czM=
IronPort-HdrOrdr: A9a23:CwpgEameMOe5ICG+vffhcHm/+BXpDfOlimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0mskKKdxbNhRYtKOzOWw1dATbsSlLcKpgeNJ8SQzI5gPM
 tbAstD4ZjLfCJHZKXBkXaF+rQbsb66GcmT7I+xrkuFDzsaDZ2Ihz0JdjpzeXcGIDWua6BJdq
 Z1saF81kedkDksH4yGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 L4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmR0Xue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqVnSRULAhKePZptMZ8SF/0+kAgtNZz3O
 ZgxGSCradaChvGgWDU+8XIfwsCrDv7nVMS1cooy1BPW4oXb7Fc6aYF+llOLZsGFCXmrKg6De
 hVCt3G7vo+SyLUU5nghBgu/DWQZAVxIv/fKXJy+PB9kgIm0EyR9nFohfD2xRw7hdcAo5ot3Z
 WxDk0nrsALciYsV9MNOA4we7rINoXze2O9DIuzGyWQKEhVAQOFl3bIiI9Flt2CSdgv8KYYvq
 jnfRdxiVMSEniefPFmmqc7vyzwfA==
X-IronPort-AV: E=Sophos;i="5.91,200,1647316800"; 
   d="scan'208";a="70022277"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGGYp5Y/c4JgPoJTyV3hnoEYSd4GJwmEkAaLF5rGHrY3R9lGdxDqZuz6oj0ZfC5DHCX51BSWqkxaNs8oiHwWhF55qKQn5eV8fnPWvhPBjYGt49gK/CRIH5JbjfpXYl8P3Os3tJWb5lDQRh07qy2jDXWd6B4+6/LNNEpGdiujxbsUHXfeggtzWeIm7q90eTRrMPoE6oTH9ym1X22NKljzZsWPxRf2oLIgrA6NB9qFyVL60q0kN7t1i2HOtMq4fi2Vem7gdT3Vfuwyg+Qa/bYsP5uUeOw5jQ0ATi2c3Sg76yTFu/OAcCm9GqoIXYjXMmaO6H2uDamt2cW0j1WDSCHB2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cnXHkI2Htj7a8UjLcH5DgpvCpOmlABz1ln1juOq+kCU=;
 b=QpLYGQCEW8R5or5zrF7a4IZp9Nzf/LsAalpl7itUujV+bdhHJFQ4NdD+xui6R8e+pfLLx1VQOiWVqk8ihf/Bd4rmuiaIrPMU4DzjU19aP5L0Zx3pskkhoFohmhFB2Wt9Rx+tj32S3RIOc7PqOKIHjO4LVcMBZRIIhJY1Vt2s9R4Iizzq7OgGYIja6xTwTuW+4ZXXgeVz2aLSYZ6CT1LBTvPRp6X+WjRgIWLvv0m4QD0kf34KhzD/uD3P3Wm06aQXW9Glw4trlHzKv05/Ys92ohxmmj3vUUEz0O/BxoQlq4/+VfArVWrCI3mYJwuYMKannnVKZx9yi8vKBe812ubpiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cnXHkI2Htj7a8UjLcH5DgpvCpOmlABz1ln1juOq+kCU=;
 b=bC/4ZZRs0+LfY1DgTLcfjspQ0ykkhAqWfMB0WZgSjVPCOpmDg54xty499iVb3NPVMXX0abcPX1ujh6gwqjzuRkEN6qInzfKIbfwlPjo+dM8EDtWNhB4mV92nxmwbEGzG2K7639cVSA32E2AXv8fAHJQKbnJtIarueMdu7GWmPqM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 5 May 2022 10:17:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/3] tools/libxc: change xc_memshr_fork_reset API to
 match hypervisor
Message-ID: <YnOIEb9sNfshZwtZ@Air-de-Roger>
References: <7f03387eebf9de474f404ef661f80133e3725365.1651073086.git.tamas.lengyel@intel.com>
 <f3fdd4e99892549dc68e7511f2d84f51af446e86.1651073086.git.tamas.lengyel@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f3fdd4e99892549dc68e7511f2d84f51af446e86.1651073086.git.tamas.lengyel@intel.com>
X-ClientProxiedBy: BL1PR13CA0237.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::32) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fabb4bac-0689-4281-3b88-08da2e6fafc3
X-MS-TrafficTypeDiagnostic: MWHPR03MB3312:EE_
X-MS-Exchange-AtpMessageProperties: SA|SL
X-Microsoft-Antispam-PRVS:
	<MWHPR03MB3312F8B8A60F2E9818DD61E18FC29@MWHPR03MB3312.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B8VYaXdB3fjcCegRklxTCVYMyVEqIyaWypVhyj15EIWz9CVAFdFYS7UQIlAUqu7oDb/6TZ+MV8S1H1Bo0dBQl0ILQaDQyUbAQPSJym7P0Evq5+ehFCfQC/h8iImF2cZrp5uUowpzMX+ff6TYj6Ul/DisotWtMojNzplHQTa4FNliX+5E+iyXdNlC3AJcRnK314Kdg+nIDUNmA7QF5Wco7mLtiCWVKwv96jZHpqFQe06ygoJIid8X7UltCE0atpVuxENfTA1EmCD7uN+pniqE0qCntrXOFxHlMqiXGoHKYK2fpWgzdZ38eIzf4EHF1sASNXl9q2OQ6p1Tu+AsQkLnmVZhw8L8qOwl1H77ooCkt1Gqd1+DNBzbCWli1aTRUEvx5TPKj6eyMbLyFwdyfpy5+phMlFdRizW1I03tGQ8lcry2pwH0qjpJjN9fg1P8Qnp6KnE+Q8dddD7z1enmsw+hVVUo3JPNhvChPJpx3kTxziCtQaVcD1b+Xjc8iYS3Th47AXqGFErtqkq3JbNdxvLeo31NBoAOE4OTJcKzzA3wfuglwrAOuSqq6AS4qNmdXxtT9iYTbX4BX0rHDQsSjdDdbJuiT95sAqVODcHVDjv2/YvrRk6K4SbTaKtX8+Tu32pKSTZbeTN4DLqnzFGP6ZvWFA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6506007)(6666004)(8936002)(86362001)(4326008)(8676002)(6916009)(66946007)(66556008)(316002)(66476007)(54906003)(82960400001)(38100700002)(508600001)(6486002)(6512007)(186003)(85182001)(33716001)(558084003)(9686003)(2906002)(26005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3QyQ2laSE0wb094Q3FWQTVxK0tNUXJmT2FDc2xha3NwQWZvSDBTWktSNHJp?=
 =?utf-8?B?YldPTjBiYWpOUFFNTVVNTTJRaXJHLzEzdzNET0dkWHhWRkd0aUNqOGVHNjE1?=
 =?utf-8?B?dDQ4RXZjQUx1c3RHaG9VS1pyWFRkblcvWWxJckFudTBFejhQbWtkODVYTHFq?=
 =?utf-8?B?NWQranArSnNvZnJ4MHR5RmdhZ3V4WHFmTFNQSjNGRVAyQVJXOWlQbXhRR3pm?=
 =?utf-8?B?dzVnZVByMTNpYUZ6UlhWbkNKb2UvVFdTUGJHU1NZMktCMlZ3RUV4eVNGRmdS?=
 =?utf-8?B?V3VKZkErN1JCS01DS2l4bkxpTStFbXdROGQ2U0I1TlJYdUlWMnh4WjNpNVBQ?=
 =?utf-8?B?VWNlTENLSU4remR1MDhzWWZ0dVBvZVJnUm0wU29iaXFpVkVpbm8wdW9IZjNZ?=
 =?utf-8?B?SWlLM2R3eGtmblNVYzdRNWZHVU5yNnBCL1RDcGRlT3dYR2NmTC9pNkNqVis0?=
 =?utf-8?B?amM3K2xzNXdBMG9STTF2SGc0U1RFYnpObEsxVnU2VTZEbnpGWFhuSUxGdGRR?=
 =?utf-8?B?TTNxbE5PSFlGOGJZQ3p4L0ZIMHJFR282a1VPRlFYSmNaNVhSNlpWakplWW91?=
 =?utf-8?B?aUx2Z2NIVmRRZFRSbW5EdEtCM3pLL09TU0hiWWZNMG9LekQrVTdFOHNVTkcy?=
 =?utf-8?B?bkh0bXNmS3BsVXIzNEVZYnlMbHhYcHBMcUt2eHVQZkpOUUhHVWJKOS9scXEw?=
 =?utf-8?B?dzdicHR1S1cyRmRYa3Z2S0lLNWtIRkVLSW1sZ3UzNGlkNTBKZEZDZ0hSUS8r?=
 =?utf-8?B?ekw2aU9GQ3FlVmVvUXB4aTZYcHNFVS83aWxpT2NJemNXUGpidm82NEFaRm16?=
 =?utf-8?B?RW03OWk5VS9LTHlaNmFKcmNyN1pFUnJISmF0QTkxeXYzazZZaEY1dFVONW1N?=
 =?utf-8?B?Vk9zREpkMkNtYVlRUHd1cXloOWpJY3VWei9CV0taWHRra2R3Y042S1I1aWJw?=
 =?utf-8?B?UVM2SHZWWFNsSlRhaDB0OWFjOUVZbE1LVndVWmtlR2xpNzBOSVFNenNoMFBz?=
 =?utf-8?B?cnA4WnZqb2lQbkgrYmF6ZUdMRG8rMjVSNFdSVEM2OEowZ3hJTk5xZTdpVmVs?=
 =?utf-8?B?L0hKdWc5WDlVaEE0M2xwVFJMZVB2YTdsSGdsTDFvSWJiSzNRR004aFBlUlhO?=
 =?utf-8?B?SlRvbHljNHA5N2hBUU9PSG9IR3pidGJEbmFCQk5BeHR6aldKa0dOWTN4Qi85?=
 =?utf-8?B?YUpZUWhkbTh0ZjlWZ1lJRnczY3NvSU40ZjJNQ1lsWndhRSs4bGZZaXdZMlhn?=
 =?utf-8?B?QldXQTc1ZGRIWGZDYjNJN0VWOEZZTnRRNjhraVNyVDZndDdLVUhvTEVZSTZl?=
 =?utf-8?B?YmIyY2RrUWtzNk41T0VMZlVOMDJsRWUzM2t3SEdIS2lCcGkrN0UxSEJqNXgx?=
 =?utf-8?B?RTJ6elhDbm4wMkg1ZkNOSm9GK1NKQ3dhTXZjdHgwT3h1VnlQZ3FmUHU0NmtC?=
 =?utf-8?B?V1FyZzcyNkU1WWdZUDRCaGkyaFFkUWRnN1hQUitsajArMzNxemtNaytZMm9O?=
 =?utf-8?B?cW1lNXJxc2h0dzVnS2k5dlpFakdlbmNQZlkveDlqM01KczdjMWdYb1p6V1pB?=
 =?utf-8?B?NExKTTFncDhZSXlERWVhSXpMcWozSU11eEVvL3NnV2JYdW9NMnQvRnFLQ2hk?=
 =?utf-8?B?M0QxSDVQTUdUZmZ5bk5IZ3hrL2VsK0FzV1hIS09xV05Kb3ZTZEhOVCsrVEhl?=
 =?utf-8?B?Y25KZVFqSG5MWVpSRzhUQzJxeWRCRk9aYmN2aG9ZMGE3MW9RdzI5VkZTclRi?=
 =?utf-8?B?K2dqdUZXVnBMdWVHV2pjMjFQbm92ek9MVTNxZENhRWU1b2h6UU1xa0Z1aC8y?=
 =?utf-8?B?UGNXbnVxbGtzZy9uRXhQUlNNL1dXRWNGeHRuNVlWMUhNdFdGUDc2UEw2SW11?=
 =?utf-8?B?SlZ5SEhCbmttMTNkVUFZRDhZbC9GUGNDZnZuNUdpUHozRVd1c0VOOUJGLy9Q?=
 =?utf-8?B?Vk8raFk0Q2p5U1VrYXFtck9oR3FFZStPMDN6QjU2QzFqRWk3UjZEWHo3NGxx?=
 =?utf-8?B?S1FZT0lURmdEWk5BenhJUEtvSHg5MGs0WVpZdFZtWGlOZ2wxMVhLeitTRHps?=
 =?utf-8?B?b3Q0dVR1QXdCeEd5ZG9UaTJ1d0hyQi9DSDZKeFQzeXRhckZWcUd0M3JZei9T?=
 =?utf-8?B?OGVFKzZNWnV6MWdwMytiVk1wRUJFbENSK2NOSWhtMnFMYm9ERlB3N2E2bEh0?=
 =?utf-8?B?SkVKSS9iaFE1Um1LTlNTbGkrYkl6VjRjby92d0xmUkZBY1hRQ3VoMmVHeGNX?=
 =?utf-8?B?QU41VmlyYlF2aklHN29YRnJ0QTZieWhITHVTR2hmWVMrcjV1S0N1Z1lVcDNX?=
 =?utf-8?B?Rm0rU1NFNzJqVTJVY2JuNTJ6Si9VU05rbXk1em5qUnpQM00vWEZpUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fabb4bac-0689-4281-3b88-08da2e6fafc3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 08:17:25.3744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: urIGGIGaqjXeFCwdtLa8rj5Ry+aRHUEXkqjibRg4PZE3XyVkCvpOzqva302xeqB5Tu5p6IucdpNutFhCftuIUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB3312

On Wed, Apr 27, 2022 at 11:34:19AM -0400, Tamas K Lengyel wrote:
> Need to separately specify if the reset is for the memory or for the VM state,
> or both.
> 
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

