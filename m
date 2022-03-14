Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7AA4D8827
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 16:33:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290278.492251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTmgn-0005Wb-Eg; Mon, 14 Mar 2022 15:32:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290278.492251; Mon, 14 Mar 2022 15:32:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTmgn-0005Uj-BH; Mon, 14 Mar 2022 15:32:53 +0000
Received: by outflank-mailman (input) for mailman id 290278;
 Mon, 14 Mar 2022 15:32:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=knG6=TZ=citrix.com=prvs=0654505ba=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nTmgl-0005Ub-8I
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 15:32:51 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 007d224f-a3ac-11ec-853b-5f4723681683;
 Mon, 14 Mar 2022 16:32:49 +0100 (CET)
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
X-Inumbo-ID: 007d224f-a3ac-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647271969;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=E9OS8d9jzjZQfY6n0u6QyB/ndXIcII+2g2Wq8WAnwU0=;
  b=h2cDzYTu+u3IZhh4gsM52aduOY8gN7dL+vpy+AENMjeax+3wZOq5wKE1
   Q6VEyPPO9R4RuYbbimNWSnWFRcY8rBRICf84WczOQTXCSw6TkLBQz2PzV
   4Wl4CHXc13bSOm82CjmsKbKRRH2nOv6urdguC127eKIcp6jc/HLvkMZB+
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66187930
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:tnIkdaA9I+cGyxVW/yvjw5YqxClBgxIJ4kV8jS/XYbTApGgmgWYPm
 GIdUW7TP/qPZmfzc4siYNu090MHscPRztFrQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Vg3tYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh98
 v8Sp8ORdTsnBYGVlL0ceTJ2KTlHaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGgm5g2ZEVRZ4yY
 eIYOWZxdhj9cyRLK0gcFrJuv7u5libgJmgwRFW9+vNsvjm7IBZK+KjgNp/Zd8KHQe1Rn12Ev
 STW8mLhGBYYOdeDjz2f/RqEmevnjS79HoUIG9WQ9PRnnVmSzWw7EwANWB2wpvzRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiHK+lEEOBPtsL+MBxFiBk6v+yCijHlFRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqVFr5e/LiJYsoZ8N0a6
 xSDt2AAiroalqbnPI3rrAmc01pASnUkJzPZBzk7vEr4tGuVh6b/PuREDGQ3Ct4acO6koqGp5
 iRspiRnxLlm4WuxvCKMWv4RO7qi+uyINjbR6XY2QcV+rmXyoSb8ItkIiN2bGKuOGpxYEQIFn
 WeJ4V8BjHOtFCbCgVBLj3KZVJ1xkPmI+SXNXfHIdNteCqWdhyfclByCkXW4hji3+GB1yPlXE
 c7CLa6EUCZLYYw6nWHeb7pMjtcWKtUWmDq7qWbTlE/8j9JzpRe9FN84Dbd5Rrtgvf3e/1mNr
 Yo32gnj40w3bdASqxL/qOY7BVsLMWI6FdbxrclWffSEOQ1oBCcqDPq5/F/rU9U790iJvo8kJ
 k2AZ3I=
IronPort-HdrOrdr: A9a23:NstrdqjdLhnWoPWiqjXpAe0Q4XBQXzZ13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskqKdxbNhR4tKPTOWw1dASbsN0WKM+UyDJ8STzJ856U
 4kSdkCNDSSNykFsS+Z2njALz9I+rDum8rJ9ITjJjVWPHlXgslbnnhE422gYytLrWd9dP4E/M
 323Ls6m9PsQwVfUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZozU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDm1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo9UfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWw2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 giMCjl3ocZTbqmVQGZgoE2q+bcHkjbXy32CHTqg/blnAS/xxtCvgglLM92pAZ0yHtycegH2w
 3+CNUZqFh/dL5mUUtDPpZzfSKWMB27ffueChPlHbzYfJt3SU4l7aSHpYkI2A==
X-IronPort-AV: E=Sophos;i="5.90,181,1643691600"; 
   d="scan'208";a="66187930"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PlAqaXM1DAmvayt18UpsSERCEbe0L2CRd7w3FuF1/VO84XpDR2TLY7Q5NuiEHxrQrMRohagbYHYPNu7pb6+rgtc59TsorwKOAWONenseQ7HEbAEZDMdDeeqlI9yq8cDXOkMsi/yLcIM+g3rPUk0ce1TMfJG9QTlGULTEvqFPP6zzeSmFUFzrXDyzn5mFU9RkZDfv4+qLe/DAFckWkSIIZh0LkENRQGoJZmSudR66RF5h3VX69wKz0Yz4JwvVDO4FBdpvc9Z2G66phR8PUomm1YiBBYMPYxcfbe4LqRogP7iCtu+sy0BS1JlIS3AP7x7XyD9KJe2jgyS403OEbxN1fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bWeRYe84E+mnxzJfF2PeK0WPHzXUiM7smqvJeYTiW6Y=;
 b=mqqETKGOYKUs/h5rQ3sBUksitZl7fHak5FBvSEnOXAdaPv49CgffbtD/8NPz3f8kuYntS7mwWH9GLgf2M16QouM1q2Q81tCo/Q0O97Hc9xrYn+jN9csFHsu2j3+Ye0IDN6lMjUv8fXtzP+DF+uWnHtbSQL3EPWq387HFVUQFWMjBNA7RQ1kQnhhsXGvJlylf/ld6HEPRZVrydIpoSJ64lrbuVsmntQD1Blg6dXi1HSFUHoGwEIeeNEoaui3Mc/0dR27HTxxxXsckRDd6rXw4b1XWcaMhDgj7cJS7JIhDNK/rTVaDfx49lHYZaHTRa8/8sQpF4oJ7vBIZy4Sp4IVj5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWeRYe84E+mnxzJfF2PeK0WPHzXUiM7smqvJeYTiW6Y=;
 b=A8zSYTs/YFzzMbDX4Qpp6CjpS5sPPUicF+OhzHKC2+fht8AlQMj6ejX0aCjKL2nylwJ8C705K4nKuOTsbAvvY08RjKyzIw/EDDyBjGWgtoFq8VVeHe4u7dcwSrQnnJl4eZMu8w4jDbDFC9pGn0j/iYagLOC0ClORjiBIU3DxJME=
Date: Mon, 14 Mar 2022 16:32:26 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 3/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests
 using legacy SSBD
Message-ID: <Yi9gCkK3Qhr3awNI@Air-de-Roger>
References: <20220201164651.6369-1-roger.pau@citrix.com>
 <20220201164651.6369-4-roger.pau@citrix.com>
 <63da71fb-820f-bab5-4cec-f9ec54ffbce1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <63da71fb-820f-bab5-4cec-f9ec54ffbce1@suse.com>
X-ClientProxiedBy: MR2P264CA0064.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b0da6f5-4bde-4893-167f-08da05cfdb72
X-MS-TrafficTypeDiagnostic: BN3PR03MB2387:EE_
X-Microsoft-Antispam-PRVS: <BN3PR03MB2387E5E3B31EA141E98254CB8F0F9@BN3PR03MB2387.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a6aZjExwO9bXg4zFHsHBF3M8w0uvrZ5Mwo+bsqASDsShP9v7bQt7Q5KMrAPb8+2+7NVhVd4WcQBhp2Hsygl3QQEzGG6nDP0T/dm+GZ+xJ6kq2v6W9eIvghCcURrORfdHhCWxv/gF/CcknHsXNgRcd3/ePvF2mCocPCgmbn1YlwaljwZH7MKXX/BoRSB3jM8FrE7tcIeY9h2XX8+1Bpiot5waIKpwQBdSXTcP8Hv3cV2RXI8uvKS+GEOPyxYUjuTVpKMU6ztqZs//VaKDtGG9uMJHhBMuTVR6P4lnrlTJWyPX5fSZpfwfiQUCNuwfaRYEa8rY8LyMDU0nqMFGu/LuutYDCZTxYb5RKj3Uez0cxPuksOU/5I0/F7WL0kFCe8KYisY5N7zXEYSorelqFez0o2Nv+LGh/YvSsIZjeUF65OWYwrDTCem74LO6+uPacA0IG10nFnoE4zUUmj93nYobLVrt1GkTHemgm7PtE/YX3jV/L8jSw7T4iJ9HEP5OTKFDd4MPShdY+WAVLHXmPrexh/x3G2M3mMiIt8L6OlQ/pWwNNvL+RUwJjbG/Y/nReBqMFJ54kVIN1Titp4QQSDmn7NM54Bpp2WbmF1cLLwLl3P0yVbhO6RfTDzLC4GLCnlu3v2mOQoMjI7JUW0cnWZPUPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6666004)(8936002)(66946007)(38100700002)(53546011)(508600001)(4744005)(6506007)(5660300002)(26005)(66476007)(66556008)(82960400001)(85182001)(186003)(9686003)(6512007)(6916009)(6486002)(54906003)(2906002)(33716001)(316002)(83380400001)(4326008)(8676002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekthNmRRM0ZGalpsT01aT050Rk9nSGxuWmM1dXUvYU9TL0lQSndLR1NlMy91?=
 =?utf-8?B?dGN4WGF2MHhFWCt4Q3lJS05hOEljMVAwUjNGZ0Mxd0o5WEl2Vk5UZEZqSzZU?=
 =?utf-8?B?WHdWaG9JWFFKN0ZqQXRjNXhQY2lubWJTRGZqNkVVMkZTNXhDN0tUMjhKZXNB?=
 =?utf-8?B?SzdsZ01rNjlMcmlSWlBEaUxod2xuZ09QZDhjWTRObGIzOUhPZ1ZwdDdZSDEv?=
 =?utf-8?B?bnBENWNGditySHRGVUJLNysrb0xRZDIzZlp5ZmNJTHJiWVRURnRzQUY3U0JO?=
 =?utf-8?B?QmszakZWdVh3OWt6QVk5UkRESGFRazBpVXpzTzBTTzZvVVgxZkNoS21hTkIy?=
 =?utf-8?B?V0VoMEhQZXlXOGxkUFErNW91Y3Z0amF2Q3VodkJ0WHYxMGFzV1B5b0IyWGhZ?=
 =?utf-8?B?T3FydzJnd21seXBYc0kvZUtBSzNlS3JaS3ErV2FmalcyV1dqVEpza3Q0WXpM?=
 =?utf-8?B?NUNGRTQxT2x6RVZZWklWL3JBSlZDU0tCWDhuZ0Q2SkVmaFBFUjBRM1F1amlr?=
 =?utf-8?B?cVIyL3lRbGgrSVJNV3lZWW9GTlJud0o5WnlMVGhkUEg2UVlUNjJDeS9ZZUpR?=
 =?utf-8?B?cHMwNXhaS29sUUlYRjNDRkQ2RVlJejRzd3JYdFFzYkZnR2pVUTFFam1zTm16?=
 =?utf-8?B?WmQ4VlgrVGZ6anNCeEVXMkpTeFp0WHNrajNPSlljS3Vua2J2OFVpR2xIMFBj?=
 =?utf-8?B?b0l3QVlWWkN3MC82eTVkUXNVclRVS1dZTHBReUJHcnk2MFpXeFlTZEsvUzV2?=
 =?utf-8?B?RlRyRXU2Mnlsa0k2YUJJaHBHSGR4ZE5WNUZhS3l6MDRSZlFyR003RU9lMzE4?=
 =?utf-8?B?UzY4WW9iWU13eVRDWGgyQ25pZEJDOXBpODVtRkhyYmk1Y0podS9BUHpyYm5T?=
 =?utf-8?B?bDA2bGtsdXk0TnoxQTBUUmNHaDVpak9hN1llZjc5cXQzSldja3lmU2IzZ0M5?=
 =?utf-8?B?aExRZDdjY3hIbHJocDVXY2plUDFuTXlmcDd5dnc1K2JTNVBOWkxlRElObU1o?=
 =?utf-8?B?SW1ibmUrdS9OYmFtL1R2Zk5RRzcrcUlMNzhObmYyVForVGlSVXlNdHQwYU9G?=
 =?utf-8?B?LzNzOEx3Z01jdkRDQWRWd3JZNzh3NitBbXlkNlpqQ2dRK0MwOExlYVB0RjZi?=
 =?utf-8?B?SGFlcFpMNXl0MHF0UjV2RXp3M2ZUTnRpaERiUDNnNnY0OHdJTXJFcG1TVnJ0?=
 =?utf-8?B?ZllPL3pLSWp2VFB5UjZvblJoUTVjNjl6TUdSN21XbWJCWWlHcVJZdlB2V2gv?=
 =?utf-8?B?dVFqcXNYYVd3ZC9jMjkvZmpORndYcjIyc3NOcXNxSklqWE9RaENBcjV5Q2Jr?=
 =?utf-8?B?V1g5NFYvTFB0QTFPNDZFbTRGckFFOFZ6YXVRMURyQ2dscVJQNldjY0pJRVg4?=
 =?utf-8?B?azlwZkg4M0h2MmVlbngvM2lXMVAreFZFNlI5Q3VSTW9wcVFrZjN5cEJla2xm?=
 =?utf-8?B?eVNTZWdXaVl4ZWgvM1RvVjJpa0xWVG9nTUpvTDIxZ3FjSHBxbEI2T3N0TmU5?=
 =?utf-8?B?blVrc2VCSnhMUTBSNGxrTjNzWkxVMU1RRUdYbkVUY3pjazJkM0NYb1RzdmNB?=
 =?utf-8?B?S3FnS2tKb0pHZUoyMENOdmJ6Vk5qbjhJcHdOd3RZSXoxVHJIRW0vNDZZbHF0?=
 =?utf-8?B?Vk1RUnB3UHhzL2NaSEt1S0RLZElrYkhheHI1SmVEeWxTQm9wVnJvUCtNZ3hl?=
 =?utf-8?B?RFNCSlpOWlhXSEQxZkNOY1hsOHJ5azB2T3dtckcvQWI2YmRYczhkMDIrQkRW?=
 =?utf-8?B?QW1nTEc3R1RrRHJnOWFwQkkyNkdnUWlkWDZxRml3ODdCSFhyclVKeE1BdEhl?=
 =?utf-8?B?aDBvcmRZRXhUNzVCanF2bVdEaFljTTU4eHZYb3FUZ0ZQMGkxUFd6cVNZUzdR?=
 =?utf-8?B?aFRDbTFPUFJhS2N3MFVCQXZMZ3FEWDdVblZESXRQOXExZnhNS090YXUxM1VC?=
 =?utf-8?Q?dEGyGbtDHu9KoYvcDWzjTSK4o6dTJquC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b0da6f5-4bde-4893-167f-08da05cfdb72
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 15:32:32.5808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CjmDSO4WH8hIvkEzGtO7L8nMC7yuKOTZftvN6jgf5CIrWjf/SmZ8PVM1kNp9Tg+7JyQt19MJMINeF2ituJlkOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB2387
X-OriginatorOrg: citrix.com

On Mon, Feb 14, 2022 at 05:44:01PM +0100, Jan Beulich wrote:
> On 01.02.2022 17:46, Roger Pau Monne wrote:
> > +	ASSERT(core->count <= c->x86_num_siblings);
> > +	if ((enable  && core->count == 1) ||
> > +	    (!enable && core->count == 0))
> 
> Maybe simply "if ( core->count == enable )"? Or do compilers not like
> comparisons with booleans?

I had it like that, but decided to switch to the current code just
before sending because I think it's clearer. I didn't get complaints
from compilers, but I felt it was kind of abusing to compare a boolean
with and integer.

If you wish I can restore to that form.

Thanks, Roger.

