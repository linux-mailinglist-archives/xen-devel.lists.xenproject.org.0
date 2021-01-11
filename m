Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 315102F1033
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 11:37:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64757.114463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyuZM-0008Qf-Bd; Mon, 11 Jan 2021 10:37:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64757.114463; Mon, 11 Jan 2021 10:37:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyuZM-0008QG-8J; Mon, 11 Jan 2021 10:37:04 +0000
Received: by outflank-mailman (input) for mailman id 64757;
 Mon, 11 Jan 2021 10:37:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ci+=GO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kyuZK-0008QB-B3
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 10:37:02 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 20ded69b-1c37-44e7-b017-788f136e59d4;
 Mon, 11 Jan 2021 10:37:00 +0000 (UTC)
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
X-Inumbo-ID: 20ded69b-1c37-44e7-b017-788f136e59d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610361420;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=1izhtoUn9hLXGbT+UF0mIvWpVF4nqbKOXmnLVycxsOs=;
  b=hTQAOEdnOy1EDCxRIGcsrxJO0lrvhzd8dGnAfMbQFQhuZMh4l8Wvka8s
   puZgcIWtDry1026WNUHN+7XTULTrbN6knRuTVw8v9haqbb1u6awJ+VeWd
   3K2bP8XmBMcx48g6uHu7Rit3tLUginG8XJfqnzkBSE9hijm0h8vkrGaXv
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: hPGRCCtk3OmrrLPqn8KVKjfQt5fOccAzdpYb8+1EYGR0LFV6ThIR1KJM4wguOBuETnjOBhVN1X
 7RkZLLp1/gHQhXebz5JM6l+aGJ8leOKIbS8LjHf8zagTluFgiFadpqeeLA+WTDyIjPEoaJxJ8o
 qEBsTxXqa0jTlSwraV6lfKf3GCGQsBmJhFWHwEpaKjZQWH48N5r3ePfC6nt/l8/geudXvk1D65
 if4GqFmKAr7ENw54P+0RtqFGgVMCQthXTu522YmivfFA6aYX3/fVGK+UG1cZEC7DWHtt5xzruQ
 4p4=
X-SBRS: 5.2
X-MesageID: 35179592
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,338,1602561600"; 
   d="scan'208";a="35179592"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ga83IX+RHKpWMBmOSXhCdgsSXKhKL5UCu5uxesnkbI0yd+yA4f6K/J8qGurZeBBLFCSyc1plCl2lcp87U8CTQW2MzxOkPKJ8RtBAhXaubRkhrNfrwtsy7TAFLsD8G5sxbBJ/FcwUFgMwBjPxTrRTJQ4sZ9pMUpAkBJ0ADt9dSd6ftKrQnnMJMpdzE3nIgY1SqbE1+LSJ/DxRoWfbF65R9pI/3bIpLozbEE8u8wSE8b5JpHA4VSXpt6gLj4PRD0tORQy0wU8BfcTvfx1hB9tYD4Uv2tGRuBlsFetLd9We/eg5ob1VjjQ25pmROvEt7705bgnx4z6hhgau3aMZWDjK8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i791hPIHS+GdEsm1BbPjsZfKF067/VAD0sO+e6MAg24=;
 b=f4bGxyFOiMo19ioXjBTzIIy9gDS/zoF+eEi4/NoP2zcACz7s8n48bHH9jke0kodR1JjQT9tF/ESSI6gontjxfT18t4dxUOuKcvqP+E8KXVq2fXLnyHvz+194IqfS5wCuI/dtkc3Y4b1sGiA2+JONfOKJS6ib18Pn+SovK/BX9fCSoohkZfyEgqwy7J4LgU3WvJSKiwYXAt23BqPsZf03awYZeUBgm/sFhZ0x5ZMFRtGZ6kpw9HvXvEtaf0AxpPJXUZII3EbtzwlnjiPTSaQ+TBJ5GWNsDTeyU0fZruS48L92Ls5MHRqo0OEOBY7RXWM9n4pZtuQf8w2Amlm4Juhhog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i791hPIHS+GdEsm1BbPjsZfKF067/VAD0sO+e6MAg24=;
 b=EWH3IVA+SzKQfOqpm3hW26YxRKH4BniAIxGSiiaDgIqlN4L23UrzV3ozpqht2kAUnPkBO7hClrMqdo9FfD3Mz6fNd9PwP7JmdVT483SclIb78nt7Buo0U5CL7hSNdDsiP/x12oo/2iWSj5u+k5o8lkKvFeexLC83RL9QK+xp4EM=
Date: Mon, 11 Jan 2021 11:36:48 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>
Subject: Re: [PATCH 2/5] x86/PV: fold redundant calls to adjust_guest_l<N>e()
Message-ID: <20210111103648.qhe2pwspekxeizrs@Air-de-Roger>
References: <10a01f61-197b-7df4-192d-917fe135df70@suse.com>
 <0199d771-a138-702a-2514-9139d0881175@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0199d771-a138-702a-2514-9139d0881175@suse.com>
X-ClientProxiedBy: PR3PR09CA0004.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69b35060-2c74-4e7c-f9c2-08d8b61cd0a6
X-MS-TrafficTypeDiagnostic: DM6PR03MB3738:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB373810EBF4DD6DFBCE4709468FAB0@DM6PR03MB3738.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QBgLIB0gwYogsHF2UGhmrQGOc7GG9nsZzpKhC4GRMzyrpNAFYYgIq70I+VRydZeiuQaaz7+z+IOmNYnR5+qmCtWFnsED66ybjDcfc/98lSPN/p+asTlQeN0XQS/tYXSTgXxFZxOZBThU7+r7jJ/ktiyVAhy2VmnTz0CvrO3QMU6LQO7bx/6l27jRNqbBks8C1P8ORZIBnazMpriqp0V7G6pGgPg3jfnLmRcDFyXage1D5MNWfAIuqRtEFYF+LRnWgKyVY9GmwWVx0iNmCGuQUieY+jj03JEnHL30gW7lQ3mQCzybhOVASEzU+KdeGLFDIx1nUUjKFEjy75uNCrjpx+deB/0bEltHyCp9Hs0clLD3jdOz/aJB3oGlxGHM4yxJpp9MrElWUiWkO76gEYY2FQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(346002)(136003)(396003)(39850400004)(376002)(66556008)(2906002)(5660300002)(478600001)(33716001)(8676002)(9686003)(6666004)(956004)(54906003)(8936002)(16526019)(6496006)(26005)(186003)(85182001)(316002)(6916009)(66946007)(107886003)(66476007)(86362001)(4326008)(6486002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K1U0czBRWHFBdEFSSDZNZ3NDRWVscmc4cFBPYWdhemxQQ3EwQ0NhZVBXeVRG?=
 =?utf-8?B?bWh6NEozdWEzU3lOb2tZRjBRUThrb3VIQmdFblYyejVBeFJJQ1kvOXBkNHJW?=
 =?utf-8?B?QXNNc0lWdzJFVEhZTG1kQmd1MmN3UU1icGxxWjVENE1paHpyRGhJcitxT0VT?=
 =?utf-8?B?a09QcHpLRmRnVW03Ym92b3NBL040Z3ZxSWJleGdVNzRJMnJtQmJPUXlpc3NV?=
 =?utf-8?B?ZVBDV0FQQjQyOHU0WlZoUlNNenVVcFpreDdHK1lmZXBEMmF3K0NHc3RETU5l?=
 =?utf-8?B?WWJ0Q2gxNGR5aXhzUW1tQitSNS8waXAzbzdBV3ZCTHBSQ25SMEFhcTkzUCtB?=
 =?utf-8?B?Rmg3bmpUek5GUFYwbWhrN1QvQkI1ZmNzNGNGbG0zS2NTLzRyOHZ1Y2dac0Rx?=
 =?utf-8?B?TjYwRlpFMWNRV3hQUW1kRHoyNU4zT0JmUUZxc0ZXQlhaNExRRUJDN3hxRzNz?=
 =?utf-8?B?cFdvenB1ZzMvT2hzdlhBMWV5QitRdm5TeHQ5RS95Z295amFuM0tZSGdDeW1Y?=
 =?utf-8?B?VFhHaVMzU1FFa002bnhyTmxtSm4rUko4YmdyMHVsektRNmRXY3U0S292L1I1?=
 =?utf-8?B?cit3eVdtMjdwRjdXQ3JlYzgvazBza3VIczdMditka1VzZ1JkNk5DWS9YOEtl?=
 =?utf-8?B?b0JkMGkrbXhmdUcyWVE1cHR2S1M0YWFXcGFZR3J4Z0NKZnRyRVlYYWh3M1gz?=
 =?utf-8?B?YUhTeWk0RUwzMkpqUG9KQjZEeS8rUWZ3WjgvajBIb0U5K09TTjVGQ1hXUmti?=
 =?utf-8?B?YWpuUUZqb3hLWWwyRHpVWnNyWE5OOS9ubWdMUGQzNzN6a3l4cytBNSt1NGRa?=
 =?utf-8?B?S2Fua09OYTY2WTAvVlVzZXczclpGR25sTWt2TmszT2R0RWRMK3c0NXpRUEVC?=
 =?utf-8?B?eFBUWExkaUQyemdyOVM0YUJxRm9Nc0xPQlQxbmFoOW9vSHBOdFE5YzJFazM5?=
 =?utf-8?B?YWVkVDUxY0IrS2RNdDFVWE9NeWZtVjdxTEd4Q0s5dy9WbVVxeCtoZWhXOCt5?=
 =?utf-8?B?Y0ZLNTZQYzgwZ1c0K083Nm0rQkZhMUJ3b0YvMk1GS0tFM05kVFZMd1FhZUQ4?=
 =?utf-8?B?MUIwREhBM2ZIL3NKVy8yOXNEdDFUeHVGMjRvS1RibUZnQytpNzRhNEpnWUhL?=
 =?utf-8?B?TVh1OVVWdzZQTitVUUJHZXZrbEJxUjRENXRqemhMemZXTml3dFNiM3BndkxO?=
 =?utf-8?B?ZDRkTEVpTkN0ZnVzOElhT0V4UUI0VmdySHRRTW9oLzRPclprQlY1dDl2V3dP?=
 =?utf-8?B?RkFlS3F6WXhyWVA3SUpNbGRtdk5yaUZMamprQllkdnNMSk4rN1A0cElzOVJJ?=
 =?utf-8?Q?JpSsDqTwsPGxrmYtmG+mpRyTQMfApAEW5T?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 10:36:54.7355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 69b35060-2c74-4e7c-f9c2-08d8b61cd0a6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tGLFQkggxLsVH8weQ48sdbbgXN0FLSVL7+c6r8TRp9FLoeo7mdfKMGTx7yhx4yPxF7EZkwuPlTIAWcsrSzxE8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3738
X-OriginatorOrg: citrix.com

On Tue, Nov 03, 2020 at 11:56:44AM +0100, Jan Beulich wrote:
> At least from an abstract perspective it is quite odd for us to compare
> adjusted old and unadjusted new page table entries when determining
> whether the fast path can be used. This is largely benign because
> FASTPATH_FLAG_WHITELIST covers most of the flags which the adjustments
> may set, and the flags getting set don't affect the outcome of
> get_page_from_l<N>e(). There's one exception: 32-bit L3 entries get
> _PAGE_RW set, but get_page_from_l3e() doesn't allow linear page tables
> to be created at this level for such guests. Apart from this _PAGE_RW
> is unused by get_page_from_l<N>e() (for N > 1), and hence forcing the
> bit on early has no functional effect.
> 
> The main reason for the change, however, is that adjust_guest_l<N>e()
> aren't exactly cheap - both in terms of pure code size and because each
> one has at least one evaluate_nospec() by way of containing
> is_pv_32bit_domain() conditionals.
> 
> Call the functions once ahead of the fast path checks, instead of twice
> after.

I guess part of the reasoning for doing it that way is because you can
avoid the adjust_guest_l1e in the slow path if get_page_from_l1e
fails?

In any case, adjust_guest_l1e was only called once from either the
fast or the slow paths.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

