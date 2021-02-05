Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E33310B56
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 13:51:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81691.151033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l80ZT-0006c5-Er; Fri, 05 Feb 2021 12:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81691.151033; Fri, 05 Feb 2021 12:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l80ZT-0006bk-Bk; Fri, 05 Feb 2021 12:50:47 +0000
Received: by outflank-mailman (input) for mailman id 81691;
 Fri, 05 Feb 2021 12:50:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jdnZ=HH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l80ZS-0006bf-2D
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 12:50:46 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2cdd1cd4-9da5-4a52-8f7b-3799ab250f72;
 Fri, 05 Feb 2021 12:50:43 +0000 (UTC)
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
X-Inumbo-ID: 2cdd1cd4-9da5-4a52-8f7b-3799ab250f72
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612529443;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nzCzGFFzNmvLz6Ikgfi4AHuLd9L2881IN3rxWVPOMHw=;
  b=TsrTgellj215RuDh5VUscn1pomI5ebxyCvZOjSKOs4K+natmcqF2M7L2
   wZXoAImQeE4j/zXY2FwQ9SkUXXEo0oMOpcp+O5sZJ1xmQZ1celQoRUxDo
   +NbnCrbh2GGaMSMOWz6x0nFdIQQ+7hascZiUJPySrwQn7aNCUeSeg+j80
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: frZBMeSvHkGny/4cocqOwsggbJPhCuCtzL4kwGLB06mfRKZxRdVPhR+JLnb/PAeJcuA6374x8n
 g56hkFuO8758M1NOmNfqkndMJ1+U6+6qAgWWJA9nWQyQJTgOUBSNy7CfVrus5oJ/IhTCSUPgsH
 eGn2+TrbljdzCb9W8Ljn1y5T0Lbcbccs1rd7/my9cjAboiZ1I0LHXeCd6ygy+LD1adAtzRgBSG
 tyfrkCyVSQDI6ZWAqsLuvy2PzIAfGPHAxNy6CkFQyQ1mSrS8ng4sB8dtq1/4XQ7eP+V1/NuxrZ
 sSk=
X-SBRS: 5.2
X-MesageID: 36668927
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,154,1610427600"; 
   d="scan'208";a="36668927"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JePFRaeokWPCP8CNVuYbmGBOMjmg4riTG22LPVyYakh0yPSxExYqxo2Bv3pBjcLYqB4N8rtL2GeXDCDNPcsuoYEKDSk3JPVeR4AEEq3HM4eUWnGgZQg/+9Nn+CIRU8QeQediARHbRkNE0CnX/roRAp3r7XdPBlEwClYAHMz4ih5gi7vmHge8wyJhOWAVj497y0A3Y1255jH7+zXYCM+2+PF7OhOBONHI6QDvu1xju91DDlFR3XceZlGFgDIfM5KjtL9Z6NRnzr26lZ6sLL0goyBOt/S0p44sCR996Hxz8t+OLqJmnYeKqeVmzfvQd7BwSTFRsqv1DtZlFQdWGwDX2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzCzGFFzNmvLz6Ikgfi4AHuLd9L2881IN3rxWVPOMHw=;
 b=SLl3pw6J2Ge6iSBzn45kFxMi6KnQ+VrMOkBB99Z8D3E7wkRbkTRQke4cgYDG4HhXjIDGXEZJxrkUXD8AvQqXJNRc4mR//kAX2H3oumyBFvZ/MniRb+b2XvK90Yx3U974Lvq0+b66zVZ2wSUxJPl5BRbTUbGaYLIhi4amnPXRVe//84WvyaLjBdk5NO9A3NSbyECI2SBH5EonagO7J14SINbyCnGLmv7E1sa5vcpHgnoVZg8bVY85Uz/4y+2O4g4KZcf6Yri41Ns+U4pnnh/q8Y9dQ+uu51B5s4gefbZ8m3sj1gsmEVNnKDwbCVy2uVjVGMOxZRgEDfffGjcFBCyxhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzCzGFFzNmvLz6Ikgfi4AHuLd9L2881IN3rxWVPOMHw=;
 b=qmdXIpAKPwrewiPOi+t6jltNsnK7wnBCszr8ZBgUiSoMDBXjYPv/tP5J8EGEH2DQASnzHSSsxxwSImeYgnlZgs77eEZx86jNyAXu1AOeK9XR4iN5rjYvSJsiXkNeUyLvtSFXfRhuNfWm1GOLH3KhxsVdG1ofGa8juNfahT05fBM=
Subject: Re: [PATCH for-4.15] tools/tests: fix resource test build on FreeBSD
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210205121938.4636-1-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <89d70b24-5b47-6e7f-6a89-8d6a4cb2e59a@citrix.com>
Date: Fri, 5 Feb 2021 12:50:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210205121938.4636-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0110.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::7) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a56a748b-3e6e-4aac-4282-08d8c9d4a292
X-MS-TrafficTypeDiagnostic: BYAPR03MB4277:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4277C77FBFB94E9003E475C0BAB29@BYAPR03MB4277.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SBPYvV+/kgXzoAuETQJIy8unh5+L1KxBQm/QJ9e3mzsYC1r+95O9KzSTK9HdjSQEZDeXlpHlhMkB+OdvDuFl3BIRHZ3I499Q8pays3cKUM3wn+qQPsjF3NKqXrPZrxM84kLlZpBaEVgVAXVM0eJBIcZPVkBhUAGAgbyeZHQII9Hk1etXsuzYjXesebzRwaDlMxEJcCFvmN4kL0si1gwbYWuaLXJvC+K+1TfdgoASF+hr6T6T4M/8IuOEKcNxvqR8kOFafI/in6Bf+lhXD3TmOZMj0IkzrnLKvbK4U+IuFFpycmzIbYKxe6rsnwrjSfq7nyEZLKFTt21r+5yWazi4y8bYgNjqxrSxeweK4batnncN0pSeXINN9e0b+BM4XahxYCVt8/xitsGlP3kM/qAmHOa9wrWfJ+PlMlZ4lerXclHaoYPsVYDH7loxA0I5sk9yozOGKQaSVVcYWebE1EuLApBhpT1LnScVyBrOnV3IswsM/pZJhU/asIO/lNfl87gYZ1W+oykBvldtDhBOC2MLfQFeGd3KwIBTiq7SIqtom6XY+7MoUklXrnGtnK6ZWYDlC94zO0VgdScI3c1A6BZOCyR/uRb058qm7shHYLvAGpw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39850400004)(396003)(366004)(136003)(36756003)(316002)(4744005)(16576012)(54906003)(6666004)(478600001)(66946007)(66556008)(16526019)(2906002)(66476007)(8676002)(2616005)(956004)(8936002)(186003)(53546011)(86362001)(26005)(31696002)(4326008)(5660300002)(6486002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?a1h2Yk5rNFo3Zyt2cjRjTm1aa2JsRWlLSFVMYzRubWVubXF5WFBvOVJPcFdj?=
 =?utf-8?B?dVN2aDZaK2NxUUxxdEtkb1A0YUd0dFIrNmdLVkY0R3hIRW9jaWVnZWJYeXdY?=
 =?utf-8?B?K293U1dObzJ6cXk0NnR6ZEcyZHYyUWo3K3V6QmF5L1g4MEhpMVdXeGozRnBE?=
 =?utf-8?B?NExocWNtNGs4dGdsWklNMFdTS0xFUjV0cUFwRk9iNjY3RFd0OWEzNTRaN1ZD?=
 =?utf-8?B?emVwMnlpaHZZNG0vaXpvOHVxMjdqd3NWbGxONUtHL2pENk5ML3ZHeHR4MzJ6?=
 =?utf-8?B?cWJMWUZObGtINEtYSHUzNTVpU0dGb3dtbHZjZWVuU0t3VkdIMHd5S0I1a3J2?=
 =?utf-8?B?VWVsUVJaSkZud1U3NUlRVnYxOEpzZHMzZjFyYzZlMTFSNmZOQkgrbVpaYTA5?=
 =?utf-8?B?eWRqVUVyTTZhVi9IRTA4bGN1K1RhcitXV0NaOGc3eE85N3Y3VjNla3VvWk8x?=
 =?utf-8?B?Mm5TWHhiTzYzUUNlNktiT0tkWlJURFhEekZTTEw3NlFaR0ZnSnFOMXFQeURY?=
 =?utf-8?B?ZDVkaEdlUzdEMkJ4d0RpaUZZdDJLdHczSU9BeG1zeHFPL0R0L1A2cUlCdW56?=
 =?utf-8?B?dGM3NG5MWnNnWGx5OVFtMTBibjFLSG15a3NubzNHUm1OYS9XZEZ2eG94U2Rt?=
 =?utf-8?B?c05zRVJHOXlmTGdFelpFQjFHREhvWHZMT2IrL1RiMThOUUNxQ3JzR0ZpUEty?=
 =?utf-8?B?dGY3NGdnWjFGWWJQS2lyMWlPbllScFVRVWdPVEVodng4M09LQlY2ZVU2eEFt?=
 =?utf-8?B?eXpGNStMU3J6Yit6S1dacFB6VE1BUDV3T1RzVW9MaDJBN3poRUtqQ2E0TnFj?=
 =?utf-8?B?Q2NCT0J1Q3ArMnUwa0pqNXQzL2ptUFE4ZFVtRXNTQjdhM3hNWkpvM25WcUZq?=
 =?utf-8?B?dEw1cDdqMXUyWVg0d1VORUVjQzZsdmRhVWc2Zk5KU0gxekpuaktVY3ZXVEIv?=
 =?utf-8?B?Sy81dlVwMXl4US8zL0NVTzRXRWVpSXlPUzZwVHJDOVZIWStRS3pOeW5vS2Rr?=
 =?utf-8?B?YkZiUWh0QStEa0d2NTZ0WVlSSmZLa0NBNUx6aklWRFp2bWZMaTdhOXVjWUNL?=
 =?utf-8?B?VTd3S3A5cno2VmQydWswNHlLclcydngweUQ3WklCYzlXelEyNGozNjFFd0hE?=
 =?utf-8?B?cU0zOUt4Y0VCSER1cXBub1Eyd0prZzY0RUVJY0JPS0E0bS8rR1dRM1NkdXNV?=
 =?utf-8?B?MW9IdnJrL01CL2czZGFNaUg1ak9mZlFrZVpKSEh3RStZZS9uOWJnaXBWRDFU?=
 =?utf-8?B?bENNWkdaczZ2T3NkL0V3QmE3bFV5RG1UblBtelR2SE9xSFNHMG9qbmVwZ0dH?=
 =?utf-8?B?R09neWNYWHdwUXRGOEhSSUxUWnh0OWJDZVVlWGI5aGVzREsxOTYySjl4aldM?=
 =?utf-8?B?eVlDcGhkNWhCWGR0K0ZHZnYrSjhsaGZyQ1BWMy93MC9oR3lJSitKSHhLcGJS?=
 =?utf-8?B?VzFGWGJ1eDZXRWN1WDhJeDRPdUVvemNBTTJFbVNhWUk3RUFZUkV0dnhqSkw4?=
 =?utf-8?B?bkRUSmxRd1pCWEsxTU1CSit4RGNoc05XdGc3Ris3M3JFeEx1ZVJ4amkzbW5L?=
 =?utf-8?B?Z054ZFQyY2lwK3g5WVZWTXJXeXBkLy84ekFrWUlKYi9ZVVpDV3F3Y3lZUVho?=
 =?utf-8?B?UmNjVUh2VGd3L3BqcWxSUnFNd1p5aVV4V3JDYjBQRGkxMWkvMFo4K3BiNU9i?=
 =?utf-8?B?NkZMdVB3a1ZHY3FvSTQ3N3J1d3F6QjRrREhtQzFvSktoZDhiN3ZiUXR2RW1y?=
 =?utf-8?Q?3M1y9tvvPxzx+hM9dHQMhayaVjia2Kg8V4Npx/I?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a56a748b-3e6e-4aac-4282-08d8c9d4a292
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 12:50:37.2638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: stkl9qXS3NU6bc1WEB3OW4mY0Oc1p73SlsaXII5vymSjGkFl3H0R6tp6NGaXRI66oEE46ZPluxhxkDj3cVsELFwxDQzE9mC5yrNYHT26mvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4277
X-OriginatorOrg: citrix.com

On 05/02/2021 12:19, Roger Pau Monne wrote:
> error.h is not a standard header, and none of the functions declared
> there are actually used by the code. This fixes the build on FreeBSD
> that doesn't have error.h
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Urgh sorry.  Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

