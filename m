Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 050DC7518AC
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 08:14:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562930.879726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJpbF-00069v-SH; Thu, 13 Jul 2023 06:14:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562930.879726; Thu, 13 Jul 2023 06:14:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJpbF-00066P-PT; Thu, 13 Jul 2023 06:14:49 +0000
Received: by outflank-mailman (input) for mailman id 562930;
 Thu, 13 Jul 2023 06:14:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0tL6=C7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJpbE-000660-E8
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 06:14:48 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90363ef2-2144-11ee-8611-37d641c3527e;
 Thu, 13 Jul 2023 08:14:46 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PAXPR04MB8832.eurprd04.prod.outlook.com (2603:10a6:102:20f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Thu, 13 Jul
 2023 06:14:43 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Thu, 13 Jul 2023
 06:14:41 +0000
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
X-Inumbo-ID: 90363ef2-2144-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KwBvZukoAxZx+ef3tOsjMBTcybHHBrSNjAl0oenrHqG7kdHVbekn6t5a1iOI4COPLT/hbPMLfaClbc8ZUGI4ZmryAb2W/vCfBLk/NPvHpVEp6njohV/gx55hmu91PgmhV0QiYGA8o3aLo2WrkHqbd8kmN5AZHp4kOflrLbDM56vjqQ4Pp7yEIVmYl5OSJl6A/nq/ylE0S/oqeghT2FkUpnWx66exC2fRqlIR0MgWnEqK9Gk88Dpz8wPhbdpbPLe+16f3+wGS5zL9JizdnHhkCb61tXQyPgThMOTX3DbtvVv/oEjvUOfTNtGCvXXflIjTB9O9dDoUNJq5HhiCjQ6zxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IfPNIszJKThWY98bg+AiezdmaaKtKc1KVIHa/QFxn3Y=;
 b=XYPnik/4KDAK7AxqyLndPymbGyo5qVMN4LZaAmsmiWkvAj1aMJ3QTfZKCHIcDjB21ScT6mIQpRLJIc6pUa5eLDu5DsFYs9O/ybcIgw8rYnZm3K+DPaDI7jBJDGexWxZg9PCXg1Bv2Zos+qW5j56n1nV4nbiN17HWmLVzRKsw6BFtz5lH72nlwIyXoIWUILnGpCRFJ0OW7KDgKnjepeeVgyfYTX9Nw+0CdA5S3EXYTmHjinS6+7Pw+U6BMkPuigveWHODam8lxdQanHvhZDcD2YkRqWA7j9r2ED1ZbJYrUaQtpSlfnUbgRIoKI6z/gKeRIgFbGY3XBRX4VcBJaZ/V3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IfPNIszJKThWY98bg+AiezdmaaKtKc1KVIHa/QFxn3Y=;
 b=woXz1lGm0oXjhi70LJvn0bRZgXSYG6It8A+w5AJVqzHmAgiv4PSPi8F7qrUBy/2i37dg3YNC+cwqBbqt0bk4Lj72uTO3K2XMOq5wTOys3qHMqbgQhSbxdkhi78DcHe+H2sCikpTBBBuoARAwKs9UvswHgtcr7txfpo0gJwP4PTS7TaZ6GNe1QIAH+2mh+r42bU+xI8Zp2w++W3b6+lYQkVsskvvt7a4tKuPbDvoccRDECg0G8DQ8yS5/3zsopFApKfv4vXi5L/aCre+b9ck/MtqKoxVp9JBr1Mm45JyLIYAQy3KxMg5vdNsAfUSSzwoBxzRpt2QOpy4nyewj9JKybg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <61328d60-7089-5a0d-dd72-23f3cf57f802@suse.com>
Date: Thu, 13 Jul 2023 08:14:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 06/15] cpufreq: Add Hardware P-State (HWP) driver
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230706185440.48333-1-jandryuk@gmail.com>
 <20230706185440.48333-7-jandryuk@gmail.com>
 <eeeb032f-a21b-5eb2-e3d5-63357a04a500@suse.com>
 <CAKf6xptn0OL0qz+DW9qrwU=sFSKSp-O3S7z6vFbZp9RstFanbw@mail.gmail.com>
 <bfacee48-f640-f2eb-7fd7-f440ad03e612@suse.com>
 <CAKf6xpvVd49dx=CtGyPMt+NMuOfhJ4a1fiZb-O4e-guq9BwcFw@mail.gmail.com>
 <cdbaec77-9112-7b18-e9eb-fa12a16d2ccf@suse.com>
 <CAKf6xpspsyShp2O8SLK+=VQvxd=Uaewg-JHYAFPqEPmEWvDRAg@mail.gmail.com>
 <f768b046-4e14-30b3-479b-bdcdebb4d397@suse.com>
 <CAKf6xpt53io1TGDy0hmfhBoDqz5bUHNbpU37Y0xtpUqPVMJd4g@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKf6xpt53io1TGDy0hmfhBoDqz5bUHNbpU37Y0xtpUqPVMJd4g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::17) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PAXPR04MB8832:EE_
X-MS-Office365-Filtering-Correlation-Id: bc305f96-0919-46d5-6b0d-08db836871d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YGJoFiMIO3kCjUpkPtiTljS+hAdCLzVSh1h3cgmJuWwdKwSXhlpzh4+XwmzK2IerANY8Z6WaSvUgi5smupIYszxQNWRZt+cbKuaY9rsbIztzKXgj8pbGpJGuu2navCBdDcXjmneWPUqRglXVr083MSk/4K/ARiwfLNb9TI5Y3BVou9VSR5KgYJ28hTf0eCCitNx284zbInpzGZJ/DTtqqjSsv1CsHUXmESXNjNBO0DyZ5WaP/oMQcHjHQbokRLIDSyV6M1bbuvqRSpEVidF1cALg0B8JDM22CZC2Qk2FWWSavAgvoezLv9uFCtIDbi5gGm48QpBKwKOmUN1eb4WmCVKyjQvgKxu7tjUjT8ZDLOOvgvEjlkczhheEsl/kr08dWaLUAn7MWXyaiVz7mI7mUKhyDqRmitEciqFifE6dGgXtdwXhk/ILsHFNrMFcqVRug0WEdTZuHfVSEwwVmt28EZDaqFgmBN3tzwf8nAJu+4LJ4U/lA66CAc27d7X5Dnx7x00L+dcJPnsd63ROTRt+fwhA/OtfZFAdUKnfP0rh0YxcVpVwsgPc59HZTbzap//6j0qfs1gFYdB5icVcaTMYGKb+UckWdfbSEgoJo86V3D4oUi2qbGzOqi+iOe3Vn6sA1qoQC5JkNafxMuOr84TQqg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(39860400002)(346002)(376002)(366004)(451199021)(8676002)(8936002)(54906003)(478600001)(26005)(41300700001)(36756003)(31696002)(2906002)(31686004)(6486002)(5660300002)(86362001)(316002)(6506007)(38100700002)(66476007)(6916009)(66946007)(53546011)(2616005)(186003)(66556008)(558084003)(6512007)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QS9jMkhRVlRDWHRRUGs4NVJERVh3dnd2bzFEYkZjUDVZVkhMK2FWZGNBRXIv?=
 =?utf-8?B?WE40UllHZFBtblRZU1dqdU9SQzNCZnJEZHdYcGQ1Nmd1d2gwalRmVlo5SU1z?=
 =?utf-8?B?VTBZZEdPbXRrL09hR3VJNkhLRksvN3hOb1gvWkk3RlYwZ3k2ZnVmaDdWUk5O?=
 =?utf-8?B?UUlVTEIveTkxTjFaUXE1Uk1yU1JVb0psaEZ1UUVsUGVwOEZSU01WM1pneThR?=
 =?utf-8?B?ZThacUpBMzNzc0NBaVVZYVl5aU5ralgzUTRDWGlXR21pSUg4MjA4K21YNG9r?=
 =?utf-8?B?YWFRMTBQWUdLZ3VRNlZ5T2VKTnRDc29JMWlYRFE0WUlYNTJFRnJQbnVSenE2?=
 =?utf-8?B?aXMxVkJsbUV5UldyejA4dU1jQnVSSDRkMmRwVThpa1pqejNIVWFKbDNHbDFo?=
 =?utf-8?B?UXpvUUxmL2pzS2ZmMHV2dnZBRGJBSnl3aFdlWnF3dGZvV0c1K0NMajFWekNK?=
 =?utf-8?B?NnkremxJYVAveEZQak4yOTI3emhDQnAvV2tOZEVXckR2RVdjY09iUXR4QnE5?=
 =?utf-8?B?cW82K3Q1UzZ3Q21ZNVZHMzN4bUM2WUhyWjFHdUJDayszSkRWazRWdFZDZHdU?=
 =?utf-8?B?cjAzblZRRUhINHFFdUZzMUg2WmdpMG54VlY4eGlRa29kOEI4L0tRYUJYUWZz?=
 =?utf-8?B?WHZyRGRjM0lvZFcrOU1icUZSRDg4bzZ4SHBxQ1hrbmhqSzRFd0I4NDE0M3h1?=
 =?utf-8?B?bmF0YWo0RDZhd2o0QTJSVGpyQkEwL09TWEVqSGZJcWZvVmZHdVNXMGZFWFF2?=
 =?utf-8?B?MWQ3KzVEVFp1VmhzRE9QYzBkUVpxaThjVUFQdmRUSTlhNmorL0F5R0RBdXRZ?=
 =?utf-8?B?NnlPZlZxRTFBWm1LOU9WVDFWTHFTUFRyVG5HOEhlZC9PQTQvUWwwNW50N1ZQ?=
 =?utf-8?B?LzhZa2JJUk5uRmZpQ1A0THRLOTFRV1pKbXRtWUNKcEhXNk4yNXlERUlkSDI2?=
 =?utf-8?B?aVRFeHVubXdISXVtOVVDN2t1bzRyZUk4WkNuSkQwMHNtQ3V3V0p2ZjYwbmxh?=
 =?utf-8?B?UGVyS1ZSc0FXbmh4cTQ0dHpZVStnTm01ZkNSZnY5QlJCbWJrR3hYSXFDQ0ZC?=
 =?utf-8?B?OGlDKzhMbFFhRG50Nm1JTGhyZi9MRGZMNkt2c2hCWUFFcTI4Q2VKelM1cFNY?=
 =?utf-8?B?dktSeEI3cjBkd1V4d0FQWjkyZWNLOUVISVhZakNEOWk5N0ZhU1p1L2tjR2dN?=
 =?utf-8?B?UVdmZHNjY2QrQVltVXViODZ3Y0QrRDIzTEJ2K002VHBHOGdXVVpDYlg4aitT?=
 =?utf-8?B?bXFOQi9JVEE5Z0hELzc3Z0QwdUtYY2czNll1ZlR0RFd2YWtvRC82bUNlR29v?=
 =?utf-8?B?aEZDNGxKdGlIU3hFbnkrd3UxVlZjbFJKZ1FabmcrV05OcE9SSnVYUzA2S01M?=
 =?utf-8?B?THhBQkRkcHg0YnZFT2VFTEdCQzZWcytyN3hTbjJhVHgrdW44N3RxUVp6TnFm?=
 =?utf-8?B?VkxmR3cwRGFramI2RS9ZMDRYMVpsdXU5WHVyS2NmRlhFY2dOdHBJZXBDUlVh?=
 =?utf-8?B?OGl6N2ZtV29SNnZQZWtQRDFGQm9odWlkcGUwbXpNWDU3dDBJKzU0d3I2aDQ5?=
 =?utf-8?B?K0MrbmovNGFqZzA2RlMvQ21lUVFuTDNSUy9yVzBGWHRIUFFGaXNyb2Riem56?=
 =?utf-8?B?RTE2TGdZTktwRXhsalYwWFd1Z2pGc0RVSExwdGxTUzlVekx1QUNidkhyS0py?=
 =?utf-8?B?MnloSiswMkhCRlpEdXJRZktDNlNvOFdaVHgya0xBRisvNk5QT0Q5SXViNFN4?=
 =?utf-8?B?akw4ellLLys0ajY2c1hHYzR4MzR5YWwrWGMveVUyTGh1MjkrbWE0bU9rN0ZT?=
 =?utf-8?B?M1JHUEV1ZGIwVU1ZN0VLNG94aWVHU0ZvSDQ5NDFJbkFmamlEejVzNWR3alEv?=
 =?utf-8?B?NmhGSGVYVjRDMllHdERPVlZsTkhCd3lhVG5raEE1M0xMRkNRNkRQNzBLWkdu?=
 =?utf-8?B?SlNRaXRYNGZNVll2VkRKNE5QQW00eTM4eFhNSjExTXU2ZHlhckZ0N3E4ZWlT?=
 =?utf-8?B?TjdlRXdPRzY3Z092a3BBcG10Z01vQ21sVC9BSThQTGEyeGVJcUc0YkliZDd4?=
 =?utf-8?B?cmpGOXRsUER4Vy9xMG10bkVjdW1UdFBmY3VYRE1jQzNvQlhUenpZRFZEWEli?=
 =?utf-8?Q?Vcpyn1WgF0F5h9+twIFC2ovpc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc305f96-0919-46d5-6b0d-08db836871d5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 06:14:41.4220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VaWtqTRCncgdpEOKid2nEArnV29HZZ6X7z4jfYa/CmtXERAeHr9dCopNK1H3tGLd+rG+2qeO8trws+j2JhJC+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8832

On 12.07.2023 21:38, Jason Andryuk wrote:
> I think I just prefer the ';' separator and letting "verbose" be
> weird.  It maps well into the existing syntax and I liked it when you
> first suggested it.

Well, okay, then let's stick to that, emphasizing the weirdness in doc.

Jan

