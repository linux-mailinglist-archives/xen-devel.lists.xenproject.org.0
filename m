Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF404A5A73
	for <lists+xen-devel@lfdr.de>; Tue,  1 Feb 2022 11:47:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263499.456212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEqgV-0006j7-6e; Tue, 01 Feb 2022 10:46:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263499.456212; Tue, 01 Feb 2022 10:46:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEqgV-0006h5-3B; Tue, 01 Feb 2022 10:46:51 +0000
Received: by outflank-mailman (input) for mailman id 263499;
 Tue, 01 Feb 2022 10:46:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JAuK=SQ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nEqgT-0006gp-NW
 for xen-devel@lists.xenproject.org; Tue, 01 Feb 2022 10:46:49 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40925db0-834c-11ec-8f75-fffcc8bd4f1a;
 Tue, 01 Feb 2022 11:46:48 +0100 (CET)
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
X-Inumbo-ID: 40925db0-834c-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643712408;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=UvKDuktzkK+C7c0DPsXKu5pFcyBMKdkkryjYz8rOEgc=;
  b=O5Hoknpp1hK0AtddRA8lfriUs0EbrxrzxkCszPib5RIUK+5Hm/Yp69jX
   jEtQI973z4EH46x9KbO63pMaTPEvXlgjY4vj9XfgKlK8U1RhaOYerKeEL
   B1/2Qk3HnL/y+K6ZRz8u5zzSQ8nsFJTUEPWzDl/+/JdDfJrlEyE7ftoXu
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: xN3ZPd38sdnIDHmbhj/rJeJKXEAVbslWYhp6FZLjNJk3PHDetUAgPKXbtm6OwcgqMgeu/ud9A0
 PGh+AHRcXSNICS9wjHmWANawvVKqvQoMEUSSz/xqkGfc1nJwESgrwGP8/Vwacti9dgOWK//RiD
 U+zFadt3HEslYCDU4fvY9ZIPrVIAoQjeDFgAluu302GISMfnIYjkexxw4MvKwT/qZMDOux/3Ki
 EFuxbCxoxM3ip/LFnf7K3mKSKRc7rs3xPGn+etws1yOg3cPOKh6b/yPJN3DXvcFBealG7XfnnQ
 kP6oPpDIZ4pPjveI/cpset1/
X-SBRS: 5.2
X-MesageID: 63206331
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:e/M4U60c+6XumFjcovbD5TV2kn2cJEfYwER7XKvMYLTBsI5bpzIFm
 DQeCmjVa/2PZWr0etF1O4S1p04E7JHUzIJjTwQ5pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o5w7dh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhp41A5
 tl8io2MUw5yJYn3ybxDQkVKDHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6Diu4QChGlr3Zkm8fD2S
 +wpWWdrTjH6SDp9JQlJVZZ9nrzvmSyqG9FfgA3M/vdmi4TJ9yRu1JD9PdyTfcaFLe1Fk0Ddq
 m/Y8mDRBhABKMfZ2TeD6mirhOLEgWX8Qo16PL+y++NugVaT7ncOExBQXly+ycRVkWbnBYgZc
 RZNvHNz8+5iryRHU+URQTWA/U+qsi8jSuZKGrYhzDrckvTFvxSGUz1soiF6VPQqs8o/RDoP3
 1CPns/0CTEHjIB5WU5x5Z/P82rsZHF9wXsqIHZdEFBbu4WLTJQb00qXJuuPBpJZmTEc9dvY5
 zmR5BYziLwI5SLg//XqpAuX695AS3Wgc+LU2uk1dj//hu+aTNT8D2BN1bQ9xawaRGp+ZgLZ1
 EXoY+DEsIgz4WilzURhutklErCz/OqiOzbBm1NpFJRJ323zpyX+Ld8IsG8veBYB3iM4ldnBO
 hW7VeR5v8c7AZdXRfUvP9LZ5zoCkMAM6ugJptiLN4ETM/CdhSeM/T10ZF744oweuBNErE3LA
 r/CKZzEJS9DUcxPlWPqL89Aj+ND7n1glAv7GMCqpzz6gOH2TCPEFt843K6mM7pRAFWs+luFq
 r6y9qKiln1ibQEJSnCJqdZNdQxbcilT6FKfg5U/S9Nv6zFOQQkJI/TQ3akga8pimaFUnf3P5
 XazRglTz1+XuJENAV/ihqlLZOy9UJBhg2g8OCBwb1+k12J6OdSk7bsFdotxdr4irbQxwflxR
 vgDWsOBHvUQFWiXp2VDNcHw/N54aRCmpQOSJC75MjIxSIFtGl7S8dj+cwqxqCRXVnirtdEzq
 qGL3x/ARcZRXBxrCcvbMar9z164sXUHtvh1Wk/EfotadEn2qdA4IC3tlP4nZcoLLEyblDed0
 g+XBzYepPXM/NBpoIWY2/jcot7wQeVkH0dcE23K1pqMNHHXrji53ItNcOeUZjSBBmn6z7qvO
 LdOxPbmPfxZwFsT69hgE6xmxL4V7sf0o+MI1RxtGXjGYgj5Cr5kJXXaj8BDurcUm+1csAqyH
 EmO5sNbKfOCP8a8SAwdIw8sb+Ki0/AIm2aNsaRpcRuivCInrqCaVUhyPgWXjH0PJbR4B4op3
 OM9tZNE8Ae4kBcrbo6Lgy08G75g9ZDcv3HLbq0nPbI=
IronPort-HdrOrdr: A9a23:U9adMKqaWYiSk1EcigSfKFsaV5uzL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NCZLXTbUQqTXfpfBO7ZrQEIdBeOlNK1uZ
 0QFpSWTeeAcWSS7vyKkTVQcexQueVvmZrA7Yy1rwYPcegpUdAZ0+4QMHfkLqQcfnghOXNWLu
 v52iIRzADQBkj/I/7LTUUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K13jDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa2u
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0LrEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4GS1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfusq8q+SWnqL0wxg1Mfg+BFBh8Ib1W7qwk5y4CoOgFt7TFEJxBy/r1bop8CnKhNPKWsqd
 60dpiAr4s+PfP+W5gNcNvpcfHHelAlfii8Ql56AW6XXZ3vaEi946Ie3t0OlZSXkdozvdwPpK
 g=
X-IronPort-AV: E=Sophos;i="5.88,333,1635220800"; 
   d="scan'208";a="63206331"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUpk3FUha+gNtug8o3BdG++LhOsKphvCGgBHc8TBdsXifib2tLZeQCKt+R2OwMkLdUQHBmk/0VjK/oEWq/Zj9W9XumBaPE0wdRqxKBwPOUjAj+tQHs2seedLa9jNF/u5XkOnSdXiW+Kgro+b8Md4Lbhj2VR5TzWv+R5Bw0QHx/bVAi5rmvg6KKlJdmEXw8OXElZaztlYFsIBWT/aP/kJwfL1Ofdz2jNfNlj/JKp5p7SrBQve1GBGCyKviC3Ip/DBBKoUFbKgKLUKpasHqSNf3OWvm3iYm0sNn0mAWV9QkRN/KGbiWVbC/U/Z/Dk1VmgcPMd/Rgbs0eIrOpBZ3go+8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e+WMN5BOS0K+xYHBVO/0BL8FhkxwhPDMV5eBp038iCM=;
 b=DbG/6ZpA/9RPaiEUWltINJlHOxUkuMbmuNw7C7jb9nUzh2gkduMDYSbG87hT6vp92g/wuEqoZlbGp2gn/G8amhRWSnyEQ1lKnAcQaR09nIFn5NEFP76gNpy8h5cBlcVHwaz9L1+6djNKVKjnx8vRf9jqM5SZYBDXoK/z9hsoRu0LP2IILnM9xath27hxAmYkUlgvgEai10RK6dZuTivPlCp5cxSXdiLtjRiXIwJypHKtQiMcHrOhLr5ijLfw12WnK+ssSMxJBuDPpKUyXu61AOoAFAdi+XMB3qLBZl4Gh16grRNukgAH4ITCQHyutNxLltvmfI+V5qrSkSqAkDPbfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e+WMN5BOS0K+xYHBVO/0BL8FhkxwhPDMV5eBp038iCM=;
 b=plQjLbBm4nDwRhNrL6mREWUMPSbXWi6qdw8e+I/zH4p0S0GC4wKPUkjg+9t1OALPyFyiMA5T9PdLZRi9SDiEqFPQi9Wn7SgaRrTXTDTLc2OWB+3BHC551ja/qYDWs93VBy3wuomu5iqou7gFI0mo45A37a31CXhTzNeOXyTq/NU=
Date: Tue, 1 Feb 2022 11:46:10 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 1/2] x86/mwait-idle: enable interrupts before C1 on
 Xeons
Message-ID: <YfkPcm3GFI3MNoH3@Air-de-Roger>
References: <faff6a1e-9f00-e924-9766-deda8f0b38c1@suse.com>
 <379483c7-fe7d-16ee-454f-8f8dd001dc48@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <379483c7-fe7d-16ee-454f-8f8dd001dc48@suse.com>
X-ClientProxiedBy: LO2P265CA0111.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 692806a6-3456-49ec-684d-08d9e5701249
X-MS-TrafficTypeDiagnostic: BN6PR03MB2706:EE_
X-Microsoft-Antispam-PRVS: <BN6PR03MB2706583D2CB59F28E1B9382F8F269@BN6PR03MB2706.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mp8W+jHiq6nGWF6WRVWrS0ZsTZtqHZvN+V9mpldCy4Wyr3a37MWK+cib67IrkVkg/pnSELL1TVr2UG3eKDD86Nf7JBSTadIKjp1tdNhP6wOMXPrAh2E4X/FuKCcGYDlTaelEIAhi/F2tsEjHVd77H0tddQt2YmftzBgquSVPEPD8vgztBwJGi7NEupyoevkKqAnrJFzaapUaZl2reKQ5GAdX8ILGh5n8BIu81lxQ152SHA2TQSYTKEb5Gh9Spl9h5KgAXAcAiTJxHFJsS2mQ1vQit6SCajHpXMZ0Gvlk7fOfqIr7GxAKSHLLG9o7lh418s4pzuAlSDZRTTDzozRc/VxKUXYAoQuksYGEyKE23bUS9bqiuXNQAPgkS8s+XmFDL8seuCBWHb8RGV2SihHGJ/JjP1JB6W+H+OXFFL0VDmDG5Me8R5iZhjc9vwCDBuIlsHw+zYhT4ET/fnZWtcnajqH6m8U0t3W1iSTBvZ9x5lkw1OjBugRG90jKqPqrK8ZjnnQdoPNF+37Gck4pcbigVU3AiqH22WZvYIIbRVFT2btxAfugQyU1HensYUWbPabFvllqL5Qp/TFr9ZPvDvYGeHzWjERdS3wQsz+TwoICNznwDDLUcPOIr6bbIVlXb+yn/wZzQ8ZcuA++B5YeZmdUm+gM4h6zhYmLbLhrS8Ng6NPLtgwW1WTE0XeWyFQbNzqr4kdcAtQ9RNWR5vPP8Tjasg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(38100700002)(508600001)(33716001)(82960400001)(66476007)(8936002)(86362001)(66556008)(66946007)(6666004)(8676002)(9686003)(6512007)(4326008)(5660300002)(6506007)(83380400001)(54906003)(6916009)(316002)(6486002)(2906002)(186003)(26005)(85182001)(21314003)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXEyYXhzRjR3aHpJZmlFOXVpeG1aa0NRdkk5bXpCY2VnSUd6c3hUc0pITlln?=
 =?utf-8?B?Rkw2SDN4TGZSSU9qbFRjR3hWMmRldVJJbGdvaDJ4VVppdnlKWHd1Vm14cFhu?=
 =?utf-8?B?dGYrK0VKOVJ3Vi9hS3hWSzd0VUMrZWZ6QzJjeE9aYVZaeTR4N0I3SHY5TUhI?=
 =?utf-8?B?NzdCVEpCZjdiSEl6R2NiR1pDL0piQmZ6cHNndXErdDRXaEdRN1V3UEJnSlht?=
 =?utf-8?B?NlVxR0dyTnE2RTFzMk1kTWovSzdXb0U3eGQ5V1dtR3dWYW0vNEJaMnZDeHVE?=
 =?utf-8?B?NzJWNmczUHJvckd1bGxCNEtCR3VVdTRVTzh4c2J0ait6NjZVdEx2Y0hsRWo1?=
 =?utf-8?B?MlArRE1qVnVBNEpCUWUwZUF3bFVadzNISnVocENsTURPTmZlSVNCUmF4L0NF?=
 =?utf-8?B?aE5hV2pGQ3VPRy9YSjJOSW5hQlJJQU9KYm94Snk2TWtmaWYyT1lYN1ZoQkpX?=
 =?utf-8?B?SGZ5RW1odFZSZGJjUi85bVcwRVlVdDZTQ0ZoVjdCa0dUV2Y2TllDSmM2Y3pq?=
 =?utf-8?B?SURuamp0dENtelE5bnd2UHl2Y055ZnBRTVJRak10NlZKTCtqOW8wblkwenFx?=
 =?utf-8?B?QmlJN3FTRVlpcStlaGRDenM4dlpwSHpha3NtZzBHQ3g3cjg4STRJRy8wSjM5?=
 =?utf-8?B?U3dtU1RCcnRUTGFsSjZoRVF4ZGpaRHdDSzRiZXY2UXN1ZUprcG85TWwxMlZj?=
 =?utf-8?B?VE9YSUtYWVlydnA4UUcrL2U1a21HV1E3Qi9jcW5HQU5Vb0tpbEhlWGwxdlZ2?=
 =?utf-8?B?VmJTTVU0VFhXYmo0WEcrSjJVR2FkRkR6bzR3bTFFbUVpa1BPeUZOQ08xaFoz?=
 =?utf-8?B?cG1LTUVIQjA2WSs0aDJIYzZ5M0hZMDFkMUJTcDQySEl3SjBsK1pwd01kWHdr?=
 =?utf-8?B?aEZTUkt4aGJuTVpXcGRqZkpoVjBIVm91WTY1NVh4UCttLzZ6MTd3YjY1UWdC?=
 =?utf-8?B?bUhkS0Q4M1BKeno2MDcyS2QxUGlzbkxxUkRlb2NYYkJrbC9nTkhPeGk2SjBn?=
 =?utf-8?B?ZkZYMGhoLzliQjVmYkZuQit2MEhEMXJoWFlaOFdoNTRrelc2N1grZW0vUnhB?=
 =?utf-8?B?OWNETmNTOU5VNUI4UkFGNEYyYTMwemRQKzBuVFpyeGFwanVTMnVKSVBsdDlP?=
 =?utf-8?B?bW1FVWR2cjRhUHBIK1N3L2FJdVFEdTgrL0NYY3JyQWZWeHdYTUxTbE1mRDQv?=
 =?utf-8?B?SXRLcWlKQmN0K09IZzlIbnJ4M2hCejhYYm1laCtNRlVSTlM1a0FlSWk0bEtG?=
 =?utf-8?B?Vk53RzgrUGc2ZEw5QjVZTHBYZnhFN1RPZnRiVXJWMUVHbzZwZVRJZlJkRVVO?=
 =?utf-8?B?YjhkcVZNYmFYUnJCR2FqeHBBZWxHblJ3RjVDanVyMkpKWUk2dWRVeVlLQTMy?=
 =?utf-8?B?K0xRS2NZcHlYVGpjbjBrR2RYZHdSeElMdnRYM0JJM2hocVJvRnlFMzl6a2Fs?=
 =?utf-8?B?cFlDeDFjckc0TGRIQ0RkOXpUUEIyamFlRVRHcGhkTWNHWGllU05pbzN6bm1T?=
 =?utf-8?B?L2hBUEdpOTZYZEpTa0p6OXRXRlVtWmZLWWVjZlpsOURtMnZkSzBvMlg4clg4?=
 =?utf-8?B?T0N5MjlkWnFrUm5HQ2J0UWMxZk00MFM2WFF4TWszbG9RUFIyNytRSjgySUE1?=
 =?utf-8?B?TDJkMDVkbDFhYXpRRnU5TkVYUXkzU1ZTUnJYNmNGR01GMWNYc1JyRDRweWEr?=
 =?utf-8?B?elVnR3dDenFHUXpKMWFDVk5Tb0duU1ZzbXJmYlhiUWJGR0tZTERkM25lZllM?=
 =?utf-8?B?Z1lUNE1OdHhlaCtRQithb1VDNjF2cS81NEhwOUtKa0FxYTJiY0w4bmpLOTlz?=
 =?utf-8?B?bFBsaHdOcTZROHM3L0xCMVNTeTI3bG05RndPQ2RxZDFVaU16MG9hVDNXZzVN?=
 =?utf-8?B?OHZHcWlYdURBa1pIdWhENnJOMDU1WUUvWmxSRGwwcDdsZ2VwUWQ1QktMWjhs?=
 =?utf-8?B?TkFqQ2RycHRONzdOZzlvTlZzclZYRFRoRlFLOVhtOURDWXJ5YTNjOGRLUU1o?=
 =?utf-8?B?SVdwcmJwR3ZWVjR5azFNYThiY21ZMVlyMVQ2VVVneVBDNUkwTjYyY2ZQa2kz?=
 =?utf-8?B?SU9vSGgya2RObVFZdzVhVHZ2NmJ6dDVXNnlCUGZybDB0ZEVOVm1MRWxjNXJW?=
 =?utf-8?B?ZmlGZUp2aWN2ZzM4ZEorRkYvUGgxeVhyZEdXUmNwdVJQeEdWcEMybFRwRXhn?=
 =?utf-8?Q?uN+z0mWjhUVAQ+bEOlkmOG0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 692806a6-3456-49ec-684d-08d9e5701249
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 10:46:15.6641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ReLBKocUj++bNuVS3bj9nanPaXyfjhCdX3c7pbmbU7i6Ieeh8BkEN0XDht71Q0y1BWPECewtX5X2E4ECRFb2NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2706
X-OriginatorOrg: citrix.com

On Thu, Jan 27, 2022 at 04:13:21PM +0100, Jan Beulich wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> Enable local interrupts before requesting C1 on the last two generations
> of Intel Xeon platforms: Sky Lake, Cascade Lake, Cooper Lake, Ice Lake.
> This decreases average C1 interrupt latency by about 5-10%, as measured
> with the 'wult' tool.
> 
> The '->enter()' function of the driver enters C-states with local
> interrupts disabled by executing the 'monitor' and 'mwait' pair of
> instructions. If an interrupt happens, the CPU exits the C-state and
> continues executing instructions after 'mwait'. It does not jump to
> the interrupt handler, because local interrupts are disabled. The
> cpuidle subsystem enables interrupts a bit later, after doing some
> housekeeping.
> 
> With this patch, we enable local interrupts before requesting C1. In
> this case, if the CPU wakes up because of an interrupt, it will jump
> to the interrupt handler right away. The cpuidle housekeeping will be
> done after the pending interrupt(s) are handled.
> 
> Enabling interrupts before entering a C-state has measurable impact
> for faster C-states, like C1. Deeper, but slower C-states like C6 do
> not really benefit from this sort of change, because their latency is
> a lot higher comparing to the delay added by cpuidle housekeeping.
> 
> This change was also tested with cyclictest and dbench. In case of Ice
> Lake, the average cyclictest latency decreased by 5.1%, and the average
> 'dbench' throughput increased by about 0.8%. Both tests were run for 4
> hours with only C1 enabled (all other idle states, including 'POLL',
> were disabled). CPU frequency was pinned to HFM, and uncore frequency
> was pinned to the maximum value. The other platforms had similar
> single-digit percentage improvements.
> 
> It is worth noting that this patch affects 'cpuidle' statistics a tiny
> bit.  Before this patch, C1 residency did not include the interrupt
> handling time, but with this patch, it will include it. This is similar
> to what happens in case of the 'POLL' state, which also runs with
> interrupts enabled.
> 
> Suggested-by: Len Brown <len.brown@intel.com>
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> [Linux commit: c227233ad64c77e57db738ab0e46439db71822a3]
> 
> We don't have a pointer into cpuidle_state_table[] readily available.
> To compensate, propagate the flag into struct acpi_processor_cx.
> 
> Unlike Linux we want to
> - disable IRQs again after MWAITing, as subsequently invoked functions
>   assume so,
> - avoid enabling IRQs if cstate_restore_tsc() is not a no-op, to avoid
>   interfering with, in particular, the time rendezvous.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> RFC: I'm not entirely certain that we want to take this, i.e. whether
>      we're as much worried about interrupt latency.

I would assume taking this would make it easier for you to pick
further patches.

> RFC: I was going back and forth between putting the local_irq_enable()
>      ahead of or after cpu_is_haltable().
> ---
> v3: Propagate flag to struct acpi_processor_cx. Don't set flag when TSC
>     may stop whild in a C-state.
> v2: New.
> 
> --- a/xen/arch/x86/cpu/mwait-idle.c
> +++ b/xen/arch/x86/cpu/mwait-idle.c
> @@ -108,6 +108,11 @@ static const struct cpuidle_state {
>  
>  #define CPUIDLE_FLAG_DISABLED		0x1
>  /*
> + * Enable interrupts before entering the C-state. On some platforms and for
> + * some C-states, this may measurably decrease interrupt latency.
> + */
> +#define CPUIDLE_FLAG_IRQ_ENABLE		0x8000
> +/*
>   * Set this flag for states where the HW flushes the TLB for us
>   * and so we don't need cross-calls to keep it consistent.
>   * If this flag is set, SW flushes the TLB, so even if the
> @@ -539,7 +544,7 @@ static struct cpuidle_state __read_mostl
>  static struct cpuidle_state __read_mostly skx_cstates[] = {
>  	{
>  		.name = "C1",
> -		.flags = MWAIT2flg(0x00),
> +		.flags = MWAIT2flg(0x00) | CPUIDLE_FLAG_IRQ_ENABLE,
>  		.exit_latency = 2,
>  		.target_residency = 2,
>  	},
> @@ -561,7 +566,7 @@ static struct cpuidle_state __read_mostl
>  static const struct cpuidle_state icx_cstates[] = {
>         {
>                 .name = "C1",
> -               .flags = MWAIT2flg(0x00),
> +               .flags = MWAIT2flg(0x00) | CPUIDLE_FLAG_IRQ_ENABLE,
>                 .exit_latency = 1,
>                 .target_residency = 1,
>         },
> @@ -842,9 +847,15 @@ static void mwait_idle(void)
>  
>  	update_last_cx_stat(power, cx, before);
>  
> -	if (cpu_is_haltable(cpu))
> +	if (cpu_is_haltable(cpu)) {
> +		if (cx->irq_enable_early)
> +			local_irq_enable();
> +
>  		mwait_idle_with_hints(cx->address, MWAIT_ECX_INTERRUPT_BREAK);
>  
> +		local_irq_disable();
> +	}
> +
>  	after = alternative_call(cpuidle_get_tick);
>  
>  	cstate_restore_tsc();
> @@ -1335,6 +1346,11 @@ static int mwait_idle_cpu_init(struct no
>  		cx->latency = cpuidle_state_table[cstate].exit_latency;
>  		cx->target_residency =
>  			cpuidle_state_table[cstate].target_residency;
> +		if ((cpuidle_state_table[cstate].flags &
> +		     CPUIDLE_FLAG_IRQ_ENABLE) &&
> +		    /* cstate_restore_tsc() needs to be a no-op */
> +		    boot_cpu_has(X86_FEATURE_NONSTOP_TSC))
> +			cx->irq_enable_early = true;
>  
>  		dev->count++;
>  	}
> --- a/xen/include/xen/cpuidle.h
> +++ b/xen/include/xen/cpuidle.h
> @@ -42,6 +42,7 @@ struct acpi_processor_cx
>      u8 idx;
>      u8 type;         /* ACPI_STATE_Cn */
>      u8 entry_method; /* ACPI_CSTATE_EM_xxx */
> +    bool irq_enable_early;

Should you use a bit field here and limit the field to :1 in
expectation of maybe adding more flags at a later point?

Thanks, Roger.

