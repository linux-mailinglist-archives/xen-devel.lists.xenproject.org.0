Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6720E2E36D5
	for <lists+xen-devel@lfdr.de>; Mon, 28 Dec 2020 13:01:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59444.104353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ktrCc-00046u-DV; Mon, 28 Dec 2020 12:00:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59444.104353; Mon, 28 Dec 2020 12:00:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ktrCc-00046V-AA; Mon, 28 Dec 2020 12:00:42 +0000
Received: by outflank-mailman (input) for mailman id 59444;
 Mon, 28 Dec 2020 12:00:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=shBg=GA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ktrCa-00046M-J7
 for xen-devel@lists.xenproject.org; Mon, 28 Dec 2020 12:00:40 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 190d168e-40c1-4bf9-91d8-1f6859327142;
 Mon, 28 Dec 2020 12:00:38 +0000 (UTC)
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
X-Inumbo-ID: 190d168e-40c1-4bf9-91d8-1f6859327142
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609156838;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Eq5JNeZT0l7bMCgcNsChTnPYGNMUpww38oCUh+1OxFs=;
  b=Bs4Z4ObiR1lukz/67SVrMehs1NRZUn2XTEGwCN1WTeO0DGN5woH+0N9z
   hqmPx2g7tWqX969XbzFDDAw75DDccuMt/M9/aFrjdcsicfs9LFEdS8CoT
   G67tUtO914OU3uDFD7rrS4DMfxDGSwKnrNeqtRlz91EiHEdgcYhwMB1k0
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: SB8w2xG7i13nn6+ULaRq0/cNheGhi7GuEpO0tkJiEZypHoCPp/uf5NUL0i+0k5HiSkD8uN296F
 59sMgf0/X1W2owWetdbQmL/GKZeM484G18laLlcoH5QPj7AT4UY/KTQze4LcIp0MV+UheWVQD1
 vBsdFzC7wqMve/zk4M9uv1L9loYIH7/Z+ZCuHWuwOvPRJZJkYPU0k6Wu790jxJ8kzPJiEk59KV
 a4X0Rh13jjddGNrsCSN4y60rGKSqcnuidpeYKIapxIs5fX0S2fiS1TUwmZCblHEl5bxLZgSQrD
 8jA=
X-SBRS: 5.2
X-MesageID: 34056652
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,455,1599537600"; 
   d="scan'208";a="34056652"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XrADel6kosonqSqljEoVSqEqY294tkgVQmEfndrJ1XAf0mmAxtYfhk9JH+iDuBaPwGHNk3oqKaqgzD6/0PiFtv/XdH9sLeZbaW0PyAHYQpC73ZqM7Wt1EJyDP8ZlHXoPY69b/+DLb5KOUjYxMA85lYE+lpDyqwZRnI6zhiR47+gY8UabhoKSY+Xf+MCts9slt+PaIPeTorBFDfrCnYsCqbtzJdyAw3QGOwH2fLHz8bYymCrB5GRIQJwlH1V+MVdmuI/NgtWwPmj22dGSiBTHzQjH/YylQZsWbGuiUGnXRTvzkniJWRLObY9q3jLx+A7EVTOeqxtZ6Qa6LrfGJ6c9hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y0T32xHlRne0BfcFdX3BiJ4ygytSnFj2q7tLSb7MWko=;
 b=JXaWgtVBAVvLPINJt/X9Z04Wr1Zyy5eYzKcxg9NyuVGec8zuilJhCCqWmMGyNEwYGnZRc39UcVUz0Rc9i3UTcmNmE/jDAv84F082dOsKe+wII5V9HIYHv56Po6Lp1B+PQrMdg7xuRkkAOHDkDUzoSBKAKCqJ9lyAWrmwLoNUJq0o9ws1SdMv2pjZNdskJGXASf7OwzfDaqgRmcx55/fXZlWim0N5oiRhBsSB4/CTrLOLdndCKn+Jf2Co7mTGTgSkJCcAeKA563wG1nkU7MabxdzKDkV8Fjv7K2Mjo8hwySfIe5Tg9JIGW1OrV4y9a+H6XgACICh1Tq5YetsGDQegTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y0T32xHlRne0BfcFdX3BiJ4ygytSnFj2q7tLSb7MWko=;
 b=I0b4ugG7tDZPRwm4NxDxcLV1WRjhzjSTLX7GFXeLNJHI7o/l/ntJ2qQqfchdOXRnS8ngH97RUgH7Ldi6Le2GgEAiH1AvqSs0MszAlWapxtfPx9k0o8yEDLLXj3sYENAGgbqFBxNzdkgdYH22q1XIReqQ0NNneFiJagVinj+0tW0=
Date: Mon, 28 Dec 2020 13:00:28 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/5] x86/build: limit rebuilding of asm-offsets.h
Message-ID: <20201228120028.f5clmk4jr3jrlo7b@Air-de-Roger>
References: <46d83c92-0b06-fc09-4832-7a7d7935d5c2@suse.com>
 <d437bdbf-3047-06ad-2fe8-f445cf8b3240@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d437bdbf-3047-06ad-2fe8-f445cf8b3240@suse.com>
X-ClientProxiedBy: PR2P264CA0022.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::34)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25535cff-e0f3-4a12-6f65-08d8ab282f55
X-MS-TrafficTypeDiagnostic: DM6PR03MB5340:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5340B5C9B0E12F5F0CAAD4968FD90@DM6PR03MB5340.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pxDZnDNEjpAV7DQ6PSIGUKS5mchT6zSYebrTCkHxTsWtPh9Q14nFmUV39ivEcUXzO/e9IQxxyzD/EVz0RxVhr/uajMqf0em41UwzY8UFNbTd0fG24Toih2xkaFr0dRFCTN5EdkR8N7U5a+KHPU1eMYysteYEfcNikm6Gd49mSO3ZsFtZsxd2ExDSsI4ivwUD1k1iQWbVkpMcin2hXLsKYRs7s2UuN0PxzmCb0t8YwDQvSFRaBBL39oR4hRsRJOaE/Rosm7W4ojf/UdNPqT8VkjE4NynSvDUBLrQ8YC+nmQQizG7mA6QzCWoeg+gSao5jlQNxQkkFFEKqemXOM8vdPJmcVsIt6uUdpRhN+IIWi+aArTbJUvAx0wZusjhgsJEwuh6jEIWL1ybRs6Ncyc55kg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(39850400004)(346002)(396003)(366004)(136003)(186003)(478600001)(956004)(6496006)(4326008)(2906002)(6666004)(16526019)(6916009)(85182001)(6486002)(5660300002)(54906003)(8936002)(66476007)(66556008)(9686003)(8676002)(66946007)(33716001)(316002)(1076003)(26005)(4744005)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZStxZWlqQTlHSWxGUW5jVDFCdXhNSnFnT2l4Q3ZQK3hUYUQyaW9BRzV5QnRN?=
 =?utf-8?B?ejZRWWpoUHVqQmlBOE1LZWpJYXQvVTVzVjZpRUxRSUZWRTdWRmZQV2FhaVhq?=
 =?utf-8?B?Y2lCaG5tYTRweG4waE1WdEJWNzFOTG5JdEt5NTJhbmFBMlczMWRabUwxd3Fx?=
 =?utf-8?B?RzVrU1ViUzhTeWI1UzdNdjJWZWpqcncrMXdRbHI3NGtmVUdBM01RcHJ5UEQ4?=
 =?utf-8?B?cURkZDFTeElWMlJwcW1OZ051akJNWlBpZWVsYUl0ZFdSa29KUkdqb2oxbXZo?=
 =?utf-8?B?QnZra215VFVKazFEd3R0UVRLeWxEd2daS204MFZpQWhta0dRUjJ5MEVpTm1D?=
 =?utf-8?B?Rld3clc3TUpac29qUndEMVVxWDlwWW11d1RBU1dPTjJEMGs1RDhPRnhaK0p6?=
 =?utf-8?B?S1htZHNjSlFTVEFhT3NnT09BNDNDczF1YXZCQy9vSVp3SjlyVFU3UGdHUkdE?=
 =?utf-8?B?dDBOK1g1cVh1MWluOW52QmgyYkpRQXZaSzB1QmRrSUQ2UXUzVmpqeXVZdnQw?=
 =?utf-8?B?QThTTXlEYjBYejBWZ2lHa3pCUnlWVk1RR0JwOGl3WW1LWEhHNU9yMkM5ZHF4?=
 =?utf-8?B?czhQTi9OTnBLZ2ZIMlZ5Vzg4dzlZMnFKSVhzTkJ0MlA2aExqbm5TQ1VRMEY5?=
 =?utf-8?B?bUp2WlFZV0Z5NWR5bUtqb1lpUnpTVFdxK1FSUEtZVWtsQUZ3clJVWE8zTlJk?=
 =?utf-8?B?RksvdzdmcXVtUU5mNGh3UVB2Q0sxUSsxZTJINldJVU9Jd2dSWStSRXNQdHk5?=
 =?utf-8?B?S1JWWlUzOEFocTEwNzE0TXZYNjg5N3FDbEJoa3FGTzZ2dVBRNFlWeEp5OGRP?=
 =?utf-8?B?ZCtkRzZsZ2JWVHdiYnN5amdTeVJpbDRva0o3ajJYMnNtMmErZWhwSnJBWk91?=
 =?utf-8?B?TTZQRlczUVkvYmxoajhvTDNVMDlBdEJnelo4TWR5WGdoeVRiMCtjak1Cdzdp?=
 =?utf-8?B?YldsMEVJUzhaWXRPeHVmWENtQnp2R04wd2JkYzJRSmhXOUhzK0cxQmRoSG9l?=
 =?utf-8?B?TlRBMFo3YytVcCtLUm8rVHkrci9SdEpKVmFiWFYrQnhsOThDV3BERVlYZnpC?=
 =?utf-8?B?WFZtcnJuY2RadU5CR25wOUY4eXd6MWxydmZwWmRWZzJnSVl1MWg1ei9sTWVn?=
 =?utf-8?B?VWd2TTlwN1RIR2ZvdWp6alFUWFN3d0NhaTRQOHc2aW1YZjQwcWMzMVN2RWRv?=
 =?utf-8?B?b015U1k0R05WUVl1eVN6eWx3bW5aWGtLblJJdXVITmFEdHRYRXhDODNXakFG?=
 =?utf-8?B?WjJyMUVXYkdsNzA3M1RtREtWUXpIbmJGZXZSVGJsSVNCNWJlRExWMGZpb2xJ?=
 =?utf-8?Q?FNA+g24bDaGWdObYlYgC/fKJQZN92U6OgG?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2020 12:00:35.3437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 25535cff-e0f3-4a12-6f65-08d8ab282f55
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MRQq7SbjCJNdkmyNrQ7QfYSElv61vHcn1NzooMDvLsH+E4+EZCGm+8TOeQY1v8PrUPj+R99EO6wPYIAZ3p2cAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5340
X-OriginatorOrg: citrix.com

On Wed, Nov 25, 2020 at 09:45:56AM +0100, Jan Beulich wrote:
> This file has a long dependencies list (through asm-offsets.s) and a
> long list of dependents. IOW if any of the former changes, all of the
> latter will be rebuilt, even if there's no actual change to the
> generated file. This is the primary scenario we have the move-if-changed
> macro for.
> 
> Since debug information may easily cause the file contents to change in
> benign ways, also avoid emitting this into the output file.
> 
> Finally already before this change *.new files needed including in what
> gets removed by the "clean" target.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> Perhaps Arm would want doing the same. In fact perhaps the rules should
> be unified by moving to common code?

Having the rule in common code would be my preference, the
prerequisites are slightly different, but I think we can sort this
out?

Thanks, Roger.

