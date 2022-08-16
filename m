Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5ACF595CA4
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 15:02:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388284.624901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNwD4-0001y5-B9; Tue, 16 Aug 2022 13:02:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388284.624901; Tue, 16 Aug 2022 13:02:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNwD4-0001vj-8D; Tue, 16 Aug 2022 13:02:18 +0000
Received: by outflank-mailman (input) for mailman id 388284;
 Tue, 16 Aug 2022 13:02:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oNwD2-0001vb-JH
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 13:02:16 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2083.outbound.protection.outlook.com [40.107.22.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a69ada8b-1d63-11ed-9250-1f966e50362f;
 Tue, 16 Aug 2022 15:02:15 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB6376.eurprd04.prod.outlook.com (2603:10a6:20b:d8::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Tue, 16 Aug
 2022 13:02:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Tue, 16 Aug 2022
 13:02:12 +0000
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
X-Inumbo-ID: a69ada8b-1d63-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IdZJVXjEkdCAi++HD+K1KVLPkYRxkLvxFs8nHPOKiZqJOfaEykHf0FzW/pryHyviVfxFYAlM00LltWGz2OBTWJ95uD4O/rj+dDRp8R3WHNvrytmsYvuB1LTfMeLCCP7M5YBWeqtdIMmjQEI5ST8y17OrXRURoGpVT3Hs+5W5n2oiS4+FLTs1rET1WtDwCoOmd1NnUcgEmJ8IqcGEM7cCEylopuOOABpQ6CrytL1njw6zM+DtE+ukdUyfVBVANDHWrswq6aIz5cNa8ROgm319xuG+9M6y7FwYxJV+LO6k3ax993PXw0CYojVbraUYGjrBUI+2YmB5u2Es94IO62tbgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RdSuHhwhrm46v3ObyrtiMu+QT0/tENgG7zqq4aYFtVg=;
 b=GHv1WHNSDMVwBGSQei1Gm1bBdkOrCxB/ejDTn4VARuco2md08IHGgp/vZ9jN5p/KPKct+3kESEdv+LL3+lp2skSuoXldn8SLUMXKuaNhxgUnfBmJN4o6J88bA/8OGICcLa3Mp31rMp7ajlPPULC5vzrjtVhikOMeIzULX9T9uuW78hDoFs4YQjlZZOI9hXFNXX/g/r/NksXZhX7h201091Rx5A2+htpKYvx8FQ8scBigmcmYVyaMp+VTGuxk7uKViZQpyztxxe5OMo3Davh1fXSO4jyM8awd8bMTjMjVZGmVdN/gIxccWXmEkTMCnSWnQmho/N5Sd21oe79+WSdmOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RdSuHhwhrm46v3ObyrtiMu+QT0/tENgG7zqq4aYFtVg=;
 b=y+g28O5AXnZrzxNFiB7cBUYlzVEebZEqszDq4YCQImwGsGzKv8ze012OdDVFK50p3zWKEhpBK/YiXI9jh9An5vRi/hkRWbs93hQYcdWdBZw/e88AjCyIo7YjmkiQi1PpyuJyX+xfAqJcouL2usRjrwOcqLbxIws5mb9hqspauq0vyphCtNRnG391CxqrwBiLU8M+UO953xnST6AJhNPkFl7vi6jLNjQf4B98lxsg5VxUwmgfZRoVIXevZkRdpeADeNVAjz8qCw3hwR+3uIoX/Szig0BYIDoi6XxmtNe8TCIYgNLVlTofYWLdRy59lCXee1Hwf1YGyKbasGxXUs8Asg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fb2a0fab-3e87-9a2a-a881-31ea7bdeae99@suse.com>
Date: Tue, 16 Aug 2022 15:02:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [XEN PATCH] build: Fix x86 build without EFI
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Wei Chen <wei.chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220816103043.32662-1-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220816103043.32662-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0201CA0006.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5642fbba-4611-4de5-b991-08da7f878948
X-MS-TrafficTypeDiagnostic: AM6PR04MB6376:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ccpE8A4SJxqG71yqMLozxHsgWNxGYsdFphQJBKcnukWFpJyUDvgn/f11mw5/ClsUuIWsxw11fuiPEG8pqezB6/nca3IdN+zY6PFJXcHS7srqgSmswccqiTlbi84Jtxt6Bt1mtQxDHQNWuUaUXmjnujR9xDLTJn8DMQJqqlDFOwfRBWULIQaFaMXr0Lur7YDOrS+ZfFDz9xrclGJ6UNj/YVuTpt8jrJfhunwH/L7wkJUYvOhf5YW+Jzq7QNJmfuVMdOO2Vp+LkDcL8bFvteOBJYSPd86NTw+KduAzf2YRztCWpwjkrTb7gdcSVAwjTnKnano+tl73oihBQFcBSQkz3uteGxHj80x27SfpfXcl8vCHvVBCRgmwfn53lCh6KGD483YgbTResYPYIFI4AIjjL2FHx6XVnufpIiIGdoEj7o9UeoSL3BZyrvbdKzQto8A51ZWPmtTznXW2aRirpXIAqew0xOFcKL0a9SX6NLKn1esPMo9Fifzo14a/7CiAfcNYMZmSLHLsmtdg7lKXsv64OVhMT/WGhbURZGFB/5Art4qG1le6Kq3kC6wQJOJoVK9ZbFi2G5MDG2UZVrjrn+XuEWZoZEvnueQT6n7ba9bucloFRWocqoTY73Cv2AEzviMjlSduKQ1tsORXSOC64rg2EuCGaCypiSFFAzVFRaE9AjQb1abmIFsoHQLElyveA1o2bZpiE4nLGOwiGep8qep1bVQ702qpusGC9aQNgJ1p/V9YJ/Cz/XdCd7A3qrADFwi257MC30EDhU/P2fRX91zJt8c07UvX2eNvblzBK5NKH5/pJOL6skVQBRwISkbqe5LtCd2AW9b0osfh38PCFZs9iw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(376002)(346002)(366004)(39860400002)(66476007)(2906002)(86362001)(31696002)(8676002)(66946007)(4326008)(38100700002)(66556008)(8936002)(316002)(53546011)(6916009)(83380400001)(54906003)(6506007)(2616005)(186003)(26005)(5660300002)(36756003)(6486002)(6512007)(41300700001)(478600001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUdEejZtVHpvR0JrSWhjRTZ5MnlYQlRnbXlUTUhHb294eDJSd2xndVVXN2hh?=
 =?utf-8?B?UzlsODYxWTdPOTdYL2hpT1FPKy9TLzdvZkhmNlVEamRWdWlmeUVhejk1SmFR?=
 =?utf-8?B?NWJzTE9pbTZsTU1NMENmUSszYUU3endIaXNNckhxVVJ6bFBwRy9PR2RNanFL?=
 =?utf-8?B?RHVBYWdjVmlWSGYvQm1YN3R0UkRnUUdLTGdLd1VwenZsdGNUODBTd2hMRC9I?=
 =?utf-8?B?RUhxS1ViMy9BbTVUdk5PTHo1REVwb2tYTDNEOFUzUzNOY2NPa09VeGh5RDJ5?=
 =?utf-8?B?V09DT1NXREh6cHpaeTVjcmxIaVp0ZWI3MjhHdVltZzlvaVFpdG5KbzdoV2xI?=
 =?utf-8?B?NFdhQmczQ3JHNzBwVFlDaUlBZDVQVjlHNXNNQWhncWtaVnN6T2YxMlFqQi9N?=
 =?utf-8?B?TGlKOEFHelR6dkxabXVhTHJ6eFlpaHF0UWhjb2piZW5LTXk1eHpUUXNXM3NY?=
 =?utf-8?B?MGZxTFdwejFrOS9XczFlbHA5VFJMZDFWR3dKUnozcE14ME05OVhUa0FEZ2lx?=
 =?utf-8?B?eVlaNExiR2VKcEFONGNraHF5c05OM1BHcEZPYlJWV0F3L0RXcE5RVVB1aGQy?=
 =?utf-8?B?aSsxUlpTbnlyWTc2M3VXNDBnSkdyVlZHMUZOUi9admhMMWs0MjJMd0xCV2Vx?=
 =?utf-8?B?ZzhvWFRjUUFjYVZSbWNNdzEzNXgzQWV3ZzdKN0dua1E4TmlBd0t6ektkblVp?=
 =?utf-8?B?ODNpTzRMNWJQc05RQVNnNngwKzkyZXFHb1h5eDllaXFraVk0Vm1KaFZqdUFm?=
 =?utf-8?B?ZFRFU0JUQm9yMXJMNTJpWUZFb2txdzhUVmc3Ukt1L2NiOFQ1U3U4U3RaQ3ZG?=
 =?utf-8?B?clZxUmp3bGVMS2NxbFgrRlJKaEM0VXJKWjh5NWtlOHg4S21ZaUIzREYxaHdr?=
 =?utf-8?B?SFkyelF2dkdJbTJLdytncXIvcmduSGxrSEtnVi9aSFA0V3J6akdTSFpNR2JN?=
 =?utf-8?B?UUQ3QTJNbzM0U09xNVB2ZVRHeVBhV0RQVnlDZmUyd3RoTzc0cFZwNmpwbDgr?=
 =?utf-8?B?L01PL0M3dG9zLzkvRmp3VXRXeUtzVFEwN3hoNFNPMnVlWjM3SWhSQm5xSlFV?=
 =?utf-8?B?dTJzT0NZL3pyZ3pYbVp3NFJNWFNiTGJpckx2RnNsSGhpa015TnFOeXNMbEZ1?=
 =?utf-8?B?M29pQWw2YWlKekE0cENMbEhMTmJSLzcrK1RsT05qUHNqd0Q1OXp2R0tFM3JB?=
 =?utf-8?B?bGVWS0dOVFdHVGp1b3l4QUVZcW9HdktTa3pyYWNiSForNVRVSkpyWlNsYWZt?=
 =?utf-8?B?V2ZvUGR3YWgrV3grTXVpT3Q3OGVQcmd1eWFwaUJiRHJURWVFOWlvaGYwTkky?=
 =?utf-8?B?K3B2aU1wb2VVRk1IWVIzY2JLU3JRRFRJRXYyVEFIOG02QmMwY3pEVmxIZERG?=
 =?utf-8?B?SkxDQXdONWI1Z3dyeXNlRVFTM2NOVHk0QU5qTTE5eWJpdmw4MkhteDA0ZVJ2?=
 =?utf-8?B?ekxWNVVvMUpJeVpjY3dnQ0FvSFBxSytTMWVqMXNmRG9xc3VBN3FtTjg4ZUZp?=
 =?utf-8?B?dXlZR28vdTZodVNwZlRyajdMZXNGNXdqTmZpZ3RsUzRrNmJJbGw0UTdFR3RN?=
 =?utf-8?B?ZFRzaFF4QlB5UU0yU0h0UkZ5dk9wTmlQSFNkR0lNcEdmbkF5RG85OW9ISHRR?=
 =?utf-8?B?ekQ3bm9RTnhoMjRRSEdYYm8xNWRmWlZWbmZSYjdaT0ZkRG81dnpvWUpVRDNI?=
 =?utf-8?B?MUVkdmVXRDNQUWc3QjRaQytLaVVvYU9qUUR2bC9xNVNDNW1HdElrclpVQkdJ?=
 =?utf-8?B?clBKeVpUQXpJSjk2RzljL3dWaEpobzFLUkYyNG84MFFpWkpHVStvOVB1ZkZz?=
 =?utf-8?B?MjdveDdRV3p5VXg2Q2F0SElMS0VKcTY3cXlnK1dNSzZKdWxRVHM2UnAvR1R5?=
 =?utf-8?B?WDNVS1p2K2ptTVZWMUIweUhjRGxCQklOWHE2RTk3YmxpZDZmelNBUjZWZjJX?=
 =?utf-8?B?M1ZWenp6bDEzY1BTeFc2R0NOY2s3a3hMMFNvdzBSeCtacE8wM1NlTWF6RW1C?=
 =?utf-8?B?RUxuWE1qL3NXcVplR2JaVkVZTmlUeDM2VUNkVzQxWU9wcmpPc0RSOFFDNzV2?=
 =?utf-8?B?SVdLVXJjV1J0bDdWNXB0OS9YNmdHNU5EMUVNYXpSeEpPbXJJanVPQkFlRUJz?=
 =?utf-8?Q?Y41QntPawOEeMtQFMZLZ+LBy9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5642fbba-4611-4de5-b991-08da7f878948
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 13:02:12.8153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r650qfzjo8zI/FSV9ndqwEw984cek/9A3yJP/65wkqpYTXAVOCMM+yKgL1yxLjBepWde1TU/dy4hI9gCad3soA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6376

On 16.08.2022 12:30, Anthony PERARD wrote:
> We can't have a source file with the same name that exist in both the
> common code and in the arch specific code for efi/. This can lead to
> comfusion in make and it can pick up the wrong source file. This issue
> lead to a failure to build a pv-shim for x86 out-of-tree, as this is
> one example of an x86 build using the efi/stub.c.
> 
> The issue is that in out-of-tree, make might find x86/efi/stub.c via
> VPATH, but as the target needs to be rebuilt due to FORCE, make
> actually avoid changing the source tree and rebuilt the target with
> VPATH ignored, so $@ lead to the build tree where "stub.c" dosen't
> exist yet so a link is made to "common/stub.c".
> 
> Rework the new common/stub.c file to have a different name than the
> already existing one. And build both *stub.c as two different objects.
> This mean we have to move some efi_compat_* aliases which are probably
> useless for Arm.

These useless aliases want avoiding there imo. Already when the original
series was discussed, I requested to avoid introduction of a file named
common-stub.c or alike. If names need to be different, can't we follow
boot.c's model and introduce a per-arch efi/stub.h which stub.c would
include at a suitable position (and which right now would be empty for
Arm)?

> Avoid using $(EFIOBJ-y) as an alias for $(clean-files), add
> common_stub.c directly to $(clean-files).
> 
> Fixes: 7f96859b0d00 ("xen: reuse x86 EFI stub functions for Arm")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
> 
> For the cflag addition in non-ARM_EFI, I was tempted to apply it to
> the whole directory instead of just stub.o. (Even if there's only a
> single object). I think that would be enough to overwrite the
> -fshort-wchar from efi-common.mk, but I forgot what cflags come after
> that. But adding it to just one object mean that it's added at the
> last possible moment.
> ---
>  xen/arch/arm/efi/Makefile                | 8 ++------
>  xen/arch/x86/efi/Makefile                | 2 +-
>  xen/common/efi/efi-common.mk             | 4 ++--
>  xen/arch/x86/efi/stub.c                  | 7 -------
>  xen/common/efi/{stub.c => common_stub.c} | 6 ++++++

At the very least I'd like to request to avoid the underscore in the
file name.

Jan

