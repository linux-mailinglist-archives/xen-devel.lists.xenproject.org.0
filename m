Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE213BC130
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 17:48:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150408.278096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Qp2-0005ki-8y; Mon, 05 Jul 2021 15:47:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150408.278096; Mon, 05 Jul 2021 15:47:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Qp2-0005iM-4r; Mon, 05 Jul 2021 15:47:48 +0000
Received: by outflank-mailman (input) for mailman id 150408;
 Mon, 05 Jul 2021 15:47:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Qt1=L5=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m0Qp1-0005iG-7e
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 15:47:47 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5764c47a-dda8-11eb-844c-12813bfff9fa;
 Mon, 05 Jul 2021 15:47:46 +0000 (UTC)
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
X-Inumbo-ID: 5764c47a-dda8-11eb-844c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625500066;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/dmB+97IHpmQpJevm3xwUDf/YzGHL/Nm7Ividwuzmts=;
  b=ZMb8gSWqig1VybgE7kWT9LiEEDBN6FTUlXSiAxEHkfGHcpRki6P3oJvw
   k0monJsYcsXwdgSvmjSCJh7dLWd7TMISRg7/soT88w0ePGG9pHix2Xbsw
   9HyHkJLx0XvBtz2Mvy7LEjYJbf6njk/GZjLUn2j5dgRW2qIMMFsQW66MB
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: afdDIlDQUrZbdpWWt9ZkSZRAeBgbbkmU+WDBezKWQ8aQsBr8K0foFql9DghUHT1uPQAk1yDk5s
 bSAFJNa/b03/ZGGlk9On+9cI3OJYrcCOeByOQ+U7JgAiW3hmOt3wx0qT3S6vubOLk5Nxz4X9mL
 77/kmMyfGwi3r5iky8f8UCsLctqcQwPPCCw/2zmxiv8/e0ujVJht2w8scwumFqFYMfyXblzNDE
 xqd/wS2bwDZ8XnOdgfU2/K4oeEeXM2FCC2Y2ID4j6nak0yYdKUpOJyNVd3rQ/vZxa+27coyquy
 Ej4=
X-SBRS: 5.1
X-MesageID: 47593607
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:o6R9aK9iYQYtcKSmDJpuk+AcI+orL9Y04lQ7vn2ZKSY5TiX4rb
 HKoB1/73XJYVkqN03I9ervBEDiewK/yXcW2+ks1N6ZNWGLhILBFupfBODZsl7d8kPFl9K01c
 1bAtJD4N+bNykGsS4tijPIb+rJw7O8gd+Vbf+19QYIcenzAZsQlzuQDGygYypLbTgDP7UVPr
 yG6PFKojKxEE5nFfhSVhE+Lo7+T8SgruOeXSI7
X-IronPort-AV: E=Sophos;i="5.83,325,1616472000"; 
   d="scan'208";a="47593607"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JsXn1zkS16V3rWhffDK8FS59tMcyZAH+zAFnYfFiS49Uy/rht5WoSWE9jdqXo+dULd9jgoVIjT5yVeeKRZxnXkCT2GqjdIRHPKXqO+0o1tfWfddouv2O3VUgPoYf5WhyScn6rORDcwZf9w6+/muYtihrz4GYuuBFXNl9I2qoruyax/fOevVjt0JIuZw1eydp6J1JBG2wxqHrpLRF1tVt6vMODZWm6MA7Yj/dpH+j6HOD3HDoxncz65RVdzBx7XG7rCUB6bw0aKECR0vWohdvjEcm3uhtlAiCJq5Vj0I+efw+czVZXbqZsQsXI0v/MITtRfsFFp/5GreD5bUPbK1Llw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/dmB+97IHpmQpJevm3xwUDf/YzGHL/Nm7Ividwuzmts=;
 b=Dekkn/7N558gEjQlmPogXLHo0o8+KR25QsV8YjfH0gzR6ry2qFGwXGHey7OzWxfwHqHLRYVa4GVNmNHNhP047goWLGp2xsbDvF8GYVbdaJ98fSm/Je1DrrITSpftFcaLApKPP7UW4RZnqvF974GWwp+vlCqkqIFlIUwJmQSKhhKOlCyNQSEc86Poe/2R6uUY4BxdvHD8SWA1H76kfdoV7Zlk72/KMAejecfhTVusJ3On+E1xaqibVSTTYSBDb0dSmu6Qi93v9uMdGnWm3LEqs9RpjjlrMhLwtZEIgcAymnDq1jH+46XJWi1ldFDiwloHKrjJiekdYfUNqOyerCNohA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/dmB+97IHpmQpJevm3xwUDf/YzGHL/Nm7Ividwuzmts=;
 b=obzLFf36eMY/5GB6Qg18N53BIMSaByTDp/tpjr09mgEKRTLLgZ+yBzC5wT7Cjsh1WQNDCbH5SXOI1Rw4pkbJNOJ/zz3tJx0M2pwS0FIAwL2pBJjcWxrDbGKsI9PTmhOYZ7f191r3JJcvzNmRTysZKInvHmHygzlQBzzLezs/9QM=
Subject: Re: [PATCH v2 10/13] libxc: simplify HYPERCALL_BUFFER()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
 <2d8b0f54-3045-f881-4705-28317e5ab509@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <7734681a-601d-b81b-5ebd-a0838512d021@citrix.com>
Date: Mon, 5 Jul 2021 16:47:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <2d8b0f54-3045-f881-4705-28317e5ab509@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0034.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 077a73fd-325a-40d2-826b-08d93fcc3770
X-MS-TrafficTypeDiagnostic: BYAPR03MB3494:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB349471A575E996D0CEE66E4DBA1C9@BYAPR03MB3494.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GnGrUcoudTu9i0VlxIHdrHxsbMpZ45IqIT3sYnqp7pgIbgUWZWI1/hSqviU8wV6XHEL3nkoCNn6pMzZV3zfqaQ4R0sgqNM/0HMohPwDVRQslexBRaC5gOFTf9vXJ8ar72g6Z4Xkm3Ew7B701SPyt2ofjuDzaURjFn8CnVvhoZfNBQHmaRJLo3T0PQrjBUZB4xmkWpJJ/zJz2El1+4ruIefrsTKBdtbV29fJZml4Nq8PzhnPMzz+jmkXaK6Rveuj1lIffxae1Cgs6OggLxndS/7JuakegI1tXZ54TW8mgCeRBsBr0RjnvpSrPW02AF5Gi2dTk6firZ4yGpDPqu8amEgej+fud5jsSqM/OnyzGeNLmoj6OLYAdjrjq0dm3/Nq1QtI8K0vzB6xfFJRLJI3lu2RHHj9YUgtSLUplcHpp5o5G8llk4USj/Rx/hLhK0aduVDF5CW/dV/w2XaTU37WLl0De/dBEQmlwaCFkMQgrW2GG+wD+nxUw7RNpQoCVGRP/kWLfWQUZvb5si28IC9FKJUJOPRnHspmJ4yGdBg5JJrap5YPbYBq+mktlQUSRmsqPcoyZLEV/9j1etWg1o4knEOGp/KrTB8LjUIzPUjmk5XOMEXleIrg3zomyUXAAeFhI6Kd4k5edx0pQOSjCmogHS1Dynh36FYrlDcKVBsVnVkun9y/l7o8yzbrkT/VtATw2c0detRhptFm1oWNKkO6Es5ue7MB3zFtUWo+D3CbIPLE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(366004)(346002)(396003)(376002)(8676002)(53546011)(86362001)(26005)(8936002)(4744005)(478600001)(6486002)(31686004)(36756003)(16576012)(316002)(83380400001)(6666004)(956004)(2616005)(4326008)(186003)(110136005)(38100700002)(2906002)(16526019)(5660300002)(31696002)(66556008)(54906003)(66476007)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTh6TVJjVkJ1cmU1NmFxVzJaeEFWM2ZweUsrODg1Z2ZYOEVWQWI4ZFdSeDB5?=
 =?utf-8?B?WnRLQ3dCQnUwNEdCeCtvK2pLTEV5VWJTekt3eXVpVG1DdWdaRjZkRk5ZaWRl?=
 =?utf-8?B?U015NjVoRlNrUERJS3JOL01DK0E0RlE1U3VpSlJLQ1dNTXVHRlJtY1ZYcjBU?=
 =?utf-8?B?ck5CUzVhcUFoMU1Nd2tMUkpMaS80WGVFZzVma1lpZWZvVUcxcVhPZTlQb1Zs?=
 =?utf-8?B?am01RDROWXZ5cWVaYjhtcG8vTHMzNjJyRW1zQXU0QUsxVDVPdHlNZzVkOFB6?=
 =?utf-8?B?UVlPS3p1MS9ibHNpa2VyZ3Z6RWhMMkFxbFhUVzkxK1AzckRDLzdQd0hTbSs4?=
 =?utf-8?B?UE9XS2tJeTBaZ0RxUkUyamxyaGZUdGgzVTZWeFpvVXZ3ZDZWTTl3YTQ4dWZD?=
 =?utf-8?B?UDhzekRjTDArQW90OHIrcDdKTmZlQUZwOVZPMjIraDliZU5OUndRVTNzai9F?=
 =?utf-8?B?NUN3MXhsQUpoeHN0SUcxRytjUUpvaXFIWlJlaVVSZklraFRkRHZHcTdCQXdO?=
 =?utf-8?B?UjA5TGpwdnlBTlVHT2Mwa1IxQTZkOGpTemQ1MnA0ZStPLzhyK3ZvOFZ2bU1J?=
 =?utf-8?B?YndsTjF6NCtjaXJlRUQzdVh5c0ZxNlA5bmZRTFpFaEtWZDUwQit5aWszT201?=
 =?utf-8?B?M2ZiT2lscENFZER4d3JTNGE3dllCc056RStzOFJYSjE3R2YyaXN5clg1RUpQ?=
 =?utf-8?B?R25CdkU2ZkY0RWtuZ3cyVWE1V3pvdGNyMWt3Z0FDeWluelZtWjJPRHRPSCtT?=
 =?utf-8?B?anpCZ2pWVmtNNTVWeWwzQ2ZqOWlyUFB0R1BXc0xMdU05d3cyUTQ4ZGFvbUFC?=
 =?utf-8?B?Mm1DamxoL1MvSk45dlRlWlZrZ21jTFVPak84WDJsRWZhVTgrUzVYVnRtbUhJ?=
 =?utf-8?B?b1BNWFJhOXVGWlh0bXMvMHYvY21tUWxpOFd4eFVWT0F1OXgvRjc1UXVlM2RJ?=
 =?utf-8?B?NHBOZm9udjE1ZERib2FjWjVwQkh4MUdVT2M3eUErRDJzSzNNQ3M4QngvNU9J?=
 =?utf-8?B?bUVsVk5KaGNwS2NrdEpZb2hVaTNRUExUYnhMQlA4MkR5aGpaazRiYmxHdXJU?=
 =?utf-8?B?Tm42anVwUG1ORTlFbGUzTUZGcDRQWG1BQlJGUzhjTExuQ0RUTXBCdzE2L0Nq?=
 =?utf-8?B?UGxFVGwxK0VpWnVkdWNTK2VsZUxPRm1GNUhrNnVWS0tTK3lUck9LNytVVnZs?=
 =?utf-8?B?b1BYNklBMVl3Nk5kdEo0b3FCbXkvK0VTd2lGdWcxckhoV2ZQU3FMTDJwSWlL?=
 =?utf-8?B?YVcyb0VYbnRIc1pYYVN0WHdYWHlzQWphQzA4YkhpL3o5bEdZS2RNdlYyamZl?=
 =?utf-8?B?TllnYzhxTTNFeHJxdTFBOE9KSGlFV3ZNUDg4QVVqYXlETnREaHgrYUxtM21L?=
 =?utf-8?B?WHBjdXJVNlZraHlYRzZkV01kb2VLTjVaQjFoWFRBV2pFTFB5NE1CUDRaWFNk?=
 =?utf-8?B?SnQxT2QzbXhuUjJ6REpjc21Ud3Brd28renQ2RUJ6VWhDODZrNXFFNmRzbXlp?=
 =?utf-8?B?UFJ1bTRxT3dYWkhDN2xRL0s3cUtGQ3hqM1IwRmNkdkJNV2Yvc1c3blBZNU9k?=
 =?utf-8?B?dDA2YTZqbU5oOTlmK092YmxxcVhYa3JuQ3ZUa2xOc00yRHRQcE1nYmtRZU5j?=
 =?utf-8?B?WVZ6OW0rdG1uM1NpUFpJUnRDODZNVjFDRzBnSjViNEo5ajlDYS9rYUdYOENu?=
 =?utf-8?B?SDVNUjA4eklkd2J3NXRwZ1lFS2E0MmdaRERFTnNRUWcwUWVkd0xHNDVVU25a?=
 =?utf-8?Q?GBI4nbAO/FsDpeY5/KDjU2A0bpauDIlYiTGyf87?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 077a73fd-325a-40d2-826b-08d93fcc3770
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 15:47:38.8952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mxKZkK5hhK7exCLYV8kY6UsvVZ5nbnVeanmGT5uDX6oYU36DWbJw4QYJn5/eItpxTacCuKju4NCtCjsw1CvkNmvsq74I0TxGSe6VZEHPVHA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3494
X-OriginatorOrg: citrix.com

On 05/07/2021 16:16, Jan Beulich wrote:
> _hcbuf_buf1 has been there only for a pointer comparison to validate
> type compatibility. The same can be achieved by not using typeof() on
> the definition of what so far was _hcbuf_buf2, as the initializer has
> to also be type-compatible. Drop _hcbuf_buf1 and the comaprison;
> rename _hcbuf_buf2.
>
> Since we're already using compiler extensions here, don't be shy and
> also omit the middle operand of the involved ?: operator.
>
> Bring line continuation character placement in line with that of
> related macros.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

