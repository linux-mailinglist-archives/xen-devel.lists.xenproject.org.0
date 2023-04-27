Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A476F0D20
	for <lists+xen-devel@lfdr.de>; Thu, 27 Apr 2023 22:29:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527078.819302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps8En-0001x1-Rf; Thu, 27 Apr 2023 20:29:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527078.819302; Thu, 27 Apr 2023 20:29:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps8En-0001uM-Oj; Thu, 27 Apr 2023 20:29:09 +0000
Received: by outflank-mailman (input) for mailman id 527078;
 Thu, 27 Apr 2023 20:29:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=81si=AS=citrix.com=prvs=47455b11e=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ps8Em-0001sv-Kr
 for xen-devel@lists.xenproject.org; Thu, 27 Apr 2023 20:29:08 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 271862c8-e53a-11ed-8611-37d641c3527e;
 Thu, 27 Apr 2023 22:29:06 +0200 (CEST)
Received: from mail-dm6nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2023 16:29:03 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5130.namprd03.prod.outlook.com (2603:10b6:5:1e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.23; Thu, 27 Apr
 2023 20:29:01 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%4]) with mapi id 15.20.6319.033; Thu, 27 Apr 2023
 20:29:01 +0000
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
X-Inumbo-ID: 271862c8-e53a-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682627346;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JBpKAFwrPS2Y95fkY1i2lDSfBo12L2oC3NyVZpkpelw=;
  b=dtsy6xT5s5BynRRILJ+UQxGsEx8t4DdnWBhaRHT0niRqhmVuSiTRDxMa
   Oa+8It3AISty+juecFchLfLTSwKGPS6plq8EgWjO+dFcRIeSd/FR/nQ6W
   cf8auLomhHfaH7Vj+fGATFc4EowKjzWzUSCb/BisGPKaKG5Aht//gS0/l
   k=;
X-IronPort-RemoteIP: 104.47.57.168
X-IronPort-MID: 107156018
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:pl3BA6n/FSu2uCvZUApd9Azo5gxMJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbUGjSPPaDNDfxftwjao2/pE0Au5Lczt81HVBs+S48FyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aWaVA8w5ARkPqgX5gCGzBH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 awWITJKck2Pvdvo35KUdfZivtoBHca+aevzulk4pd3YJdAPZMmaBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVM3iea9WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTOLhq6Ay2Q37Kmo7FFo1CkmfuqSDgU+jSvFFJ
 m0/wypxov1nnKCsZpynN/Gim1aLsxkGVNcWH/A87AiV4qHQ5BuVQGMDS1ZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9UQAKKUcSaClCShEKi/Hqpp0ziRTeCM5uCqevgvX+HTbtz
 3aBqy1WulkIpcsC1qH+8VWZhTup/8HNVlRsuFWRWX+55ARkYoLjf5av9VXQ8fdHKsCeU0WFu
 38H3cOZ6YjiEK2wqcBEe81VdJnB2hpPGGS0bYJHd3X5ywmQxg==
IronPort-HdrOrdr: A9a23:OyaKxq+Z/O0ntTe4jLpuk+G+dr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXpVoMkmskaKdhrNhQItKPTOWwldASbsP0WKM+UyCJ8STzJ8k6U
 4kSdkENDSSNykFsS+Z2mmF+r8bqbHokZxAx92utkuFJTsaFJ2IhD0JbzpzfHcGIzWuSaBJdq
 Z1saF81kadkDksH42GL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftxK/mHwOe1hI+VSoK5bs562
 DKnyHw+63m6piAu1Lh/l6Wy64TtMrqy9NFCsDJos8JKg/0ggLtSJV9V6aEtDUVpvjqzFoxit
 HDrzopIsw2wXLMeWOepwfrxmDboXwTwk6n7WXdrWrooMT/Sj5/I81dhbhBeh+cz0Y7ptlz3I
 9Cwmrc7vNsfFj9tRW4w+KNewBhl0Kyr3ZnuekPj0ZHWY9bTLNKt4QQ8G5cDZ9FNiPn74IMFv
 VoEajnlb5rWGLfS0qcknhkwdSqUHh2NhCaQnIassjQ6DRSlGAR9Tpt+OUv2lM7sL4tQZhN4O
 rJdo5ykqtVc8MQZaVhQM8cXMqeEAX2MFPxGVPXBW6iOLAMOnrLpZKyyq4y/vuWdJsBy4Z3sI
 jdUWlfqXU5dyvVeIOzNaVwg1PwqViGLHbQIpk03ek9hlS8fsulDcS7ciFvryP6yM9vRvEyWJ
 6ISedr6rHYXCzT8L1yrn7DsqlpWAgjufIuy6YGsnK107X2w97Rx5rmWceWAobROhAZfU66Kk
 c/fVHIVbd9BwaQKzPFvCQ=
X-Talos-CUID: 9a23:a5RkIGG/TI/M91Y/qmI3+kcWXdx4fkfkkmjwDHCnB153aoyaHAo=
X-Talos-MUID: 9a23:KHhgjwWVc+DypcHq/COrp25wENw12a+vFVEui5gnkPCEaiMlbg==
X-IronPort-AV: E=Sophos;i="5.99,232,1677560400"; 
   d="scan'208";a="107156018"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W7D43DOYMsBgJv4+CD6J//4Jr6lPVT0eSXPZ6Gj0nSrlJ+FyDIbKyvev6XEg2TCeCeMmdx5GBtPeNTe2imDUPIvHWpRa/Qm52SHpctyp6LKv1vC+E1JhcucaMuLH/wins5DjuNJ60U+FAczljMVQm0Duv4Uw7wfkRkL6IfYxs/OycQ0EijekL4+d2NHC5I62e88QYRMcHxBPbYuWiJNCDnspjY2/kwv5L8jA++BUybQupO+g5jE3D//ADB9YT2Jxmn9P4LmmG9gMKSTeKmoVfoA0jQi32OGCooU2a9AFIvgKAxJ92JiNGMx08O4fKjVXzZEem5dCsnpeNCOrjHUybA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBpKAFwrPS2Y95fkY1i2lDSfBo12L2oC3NyVZpkpelw=;
 b=l+6l2ad+C4jGwuRrItf7BPU8zVH/9sy/gPktNGEqGZHG0Nl8VVCTgkINhZoweaAKLdAJGJaQ14jKwMhHxxKhInzqge2WnZwqS47cXtTMIhj/Wdopvwa/CyA5hSJ8P66xEmLoLQH1MgtIUnFZZLGTjm6zb6g2al/2A7aQHoy9ea8x3RilaPDtEzSJ2UvQC7KZwEqTvlqiyumAeycRLgw+VZPr1spCCNj8aPa5eU2dccG/S8pZUF4DfVnKyq7+nyLWlE5rOJiDtkg2SB16bzSlfnILK9RNUCoD34HmyIoq6XbtYl+jHEtgZonbgQJJ4tY2k7wJFHxER9Cg5vbFuh8r6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBpKAFwrPS2Y95fkY1i2lDSfBo12L2oC3NyVZpkpelw=;
 b=ACGMMyMCJQ7cYvfKt1pRynApr7nCsgkBQ9nnZ/xV9Z8K9iir5IhOp/NQCd5A2nNAFQNG0tf93+vkW2LZATejCy/H17lyXuz5vpT1vhBmEcWFIF2mgVrVzUiZmg6hVCrld5ntR2SyvK1/mcMS+cSvxlocGg36v65LMdQOxyUDvLI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <35e5f7aa-dded-d108-ba26-08aa68f09854@citrix.com>
Date: Thu, 27 Apr 2023 21:28:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] xenalyze: Basic TRC_HVM_EMUL handling
Content-Language: en-GB
To: George Dunlap <george.dunlap@cloud.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@cloud.com>
References: <20230327161326.48851-1-george.dunlap@cloud.com>
 <20230327161326.48851-2-george.dunlap@cloud.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230327161326.48851-2-george.dunlap@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0140.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM6PR03MB5130:EE_
X-MS-Office365-Filtering-Correlation-Id: b4f57ab3-f2a8-4958-8e4a-08db475e0909
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a5CQ8cJahvMPVQMCqLn33F2uc2UMH/GlggDC74XJe7VJiEdtkdU0D33KaqzWtTNOS/7GKjhdaeYSY+AKJC94JDIJQS82RGxsp/wDX0YDbbbBwsgpgkxx+UuklT3FaeMt3sIodN81qttmeWrhZCR/jOZiNEaUZIVD6G/4Iv2MQgqkImS0gdOWsUbkueRfagOktLCP3fxSCiObe8+IQAkO96RLJ8Hbx8Sw+q5LPfOobwmM/ZGsuJrRQNxPZD4aU5PtO6FEBLbYnTciOoaxXCEmh70KVo7zPZvQ37sXAASnLp/TtWMZu7HRHmW1ASXXKLVJ0dffNCaWFQaLLjGeQPh//0yqJxXUtAJKm1idI78ZKaGgNdBRlk2LRwrZLpVQJVbywT5g6EjmLG1c/79vXP4Sl0uXFIy8oxkhVKN4LX8TIXoNweonldyGGvKugqVXDeigliwkRJMUT6QDBRI0sCuKUYLyWCg7yVZpfIBkuhwJZOjCZFwmOSsB6Am+/YakaD3FQABn1x68fpOVvN6tnxw5CD9t6wWhLXvPMluYKWwYw7cM89Nymgq9F09bsRKLWhFa8dEVBV1x/jX91p5zBcWDmmuLDqzpLkoDjpVE+fbTfbx0RU3zCd8EL0k6tJRP8LG8Rtxf2nRcJSeQRKuv4YXroQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(451199021)(478600001)(2906002)(36756003)(66946007)(186003)(66556008)(66476007)(4326008)(6506007)(83380400001)(26005)(53546011)(6512007)(86362001)(31686004)(31696002)(2616005)(558084003)(5660300002)(8936002)(8676002)(38100700002)(6486002)(6666004)(41300700001)(82960400001)(316002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1g2QjBYSm1NMzNFZHZ6Z3J1QXJab29BQnY2OHF2U1pBUlI2SUxCS1V3NzRq?=
 =?utf-8?B?eGduUUl3KzBxMFpyUHowcXVLOW54Q3BHdUxKYnNNSEpGYWEwU1haVjNoUU5L?=
 =?utf-8?B?blVWYkZUL1JOWVlFSktGT1oyTUEyczd3L0M3UDVuZ0RCcVA1R21MRGZJUUlH?=
 =?utf-8?B?WHpaTG0zdEJ4ck5tSzFLNEV6NXNYRmczRFZlZ1VUOFBqaHlHL1lrTnZ6WGlY?=
 =?utf-8?B?QktyN2NTaklaQjh6TzBtWkJQeFFCUXhqcGRCR3RzRkZ0enRiN0ZQOWsvUkFs?=
 =?utf-8?B?Wml0cHdGUnBPM3A5ckgrWExEM0QyRVkxeW1vZzNJWGdodkFHb2w5UDVtYUxP?=
 =?utf-8?B?K0dJRk9xWnFYZSs0ZWM3WFFMaFRjQ2NzbElXNjdtUktNNlhiYTFxR1VvR25X?=
 =?utf-8?B?b29zYTN5Tm5wcmpQc1MyNlhpUzdON3N4dlU0bG1HaStwWENoTmdiYzIybU8r?=
 =?utf-8?B?aG9JMlBnMGR4ZTZnWlhBS2MvZG4veHZMTkxUVUVPUWxwakJrWjNoKzA2YWVi?=
 =?utf-8?B?SVp4ZnlyNEdSTFdiN3lLVE1NZ2N3aE9qamRZTUU5S1lMQ3hocmtuclVyVHZL?=
 =?utf-8?B?QUVZbEIxOWJLeVVnVTJCQmhBQWJjTGNHL3JyaFVMbTRLejhMUGttWEh2YUVh?=
 =?utf-8?B?WFJza2UwaHJuQmkzNkFBc1NCWW1YUjdyMTNUOFVzRnpabnBOMzNuS0hXU0lq?=
 =?utf-8?B?OWlka20wbG5nRW5rbkxRZHhPcE00ZXRDVGpGZEZMcUFLdzR6YjdtZkhpU285?=
 =?utf-8?B?a2JURW5NQlpHajhFS0E3dngzdlcvWWFMMm9RdE1wbVB3dHBja1loRGpqMnNv?=
 =?utf-8?B?T0F1RVc0L3JpVit1WThMbzBHSnUzSWxjNXpNRjFQd2RGbFBMSDdnMENRL3Ey?=
 =?utf-8?B?VGtOWUhTRWltNjE3aG1aYytMVUZEUVRMUXduMU5hSWdsZFptU3ZXTUJxLy83?=
 =?utf-8?B?bHh4NW9wY2hmVnVDc1V0KzVVT0RJbGF0ODgyNWQyTExocnpKQXVLUkY3UUZG?=
 =?utf-8?B?amYzS2llbnZwS0tMdk9LUHY0L1lvSTdIWW9QZGFvbFRLWkVwZ1Y5emlCcUEy?=
 =?utf-8?B?UExRb3VtSldRVkZSK0o4M0RKWWxRSEFEZVZhR215Y1Mvb2VOb0JINXlKUmxI?=
 =?utf-8?B?cm56azlHUFpBeko0VzU4N2s3TUlONEFMMElKb2szZTN4U0d2SmI4ZWN1LzMr?=
 =?utf-8?B?cjBSN2lUbTYvSXBHQ0RlZXgySHlqTGFVVjAwS3BtVXVKWDZENVFWTWluYkMr?=
 =?utf-8?B?QXM1K1B3VjB5MzBXNXhNUEJBVFZUNnZHWHlhMWZHT0UvUE01NmJtak9TMWsx?=
 =?utf-8?B?OE85WnptQUZNTFNweDFJUDF6a3Y3UXFrR292WlFDUTNiMTh6MlNVQW1xdjJ3?=
 =?utf-8?B?ZDFJakx0ZFFUdnROSW56OHhQWnQ0d1VvZ1VqSWg3YjBDdDR3a1VtNXlXT25P?=
 =?utf-8?B?azkrZElPdzJFRTAxblJBNGxobFcwWEFLTTdteCtrUkhCcFZEODZoSUFxU0hs?=
 =?utf-8?B?L3NDL3pXbkdjVnZRNm1YaWc0UndXUWlicUtNZWlYdXVQUmlmdWpSekYyTlBi?=
 =?utf-8?B?YTdVTzVjaDVYWDZCT2hXZ0kxWEg3anZhTVA2WGJuVGt0anB5K1cwak9iemYv?=
 =?utf-8?B?dTByd1RJN0N6bE5Yd3FzKzltSklpU0dSNkFRZWVsSTBKKytXMUxUMTZWd1d3?=
 =?utf-8?B?WWxGMTROSEVNQUVpakIyWnh2UkEwVDAyQlMxZ09jS3Exa1duajdENTVyeWpR?=
 =?utf-8?B?SkFwZFpqNFdqY2tYOEpOZVY3cFJGN2F3a3JFZEtkZU1JNFAwL09SeG85aW5r?=
 =?utf-8?B?QmRTZzNFcnIvTERnOU4rMCswWEFsWnVQT1VOV3JWV0xnUEJ4RWZMYm1QNk1q?=
 =?utf-8?B?dFI3QThuYkRJMW9xMTlXOWtMNGc0WXVQcCtJbWhzeU45ejlxTTRxWFdTc2VI?=
 =?utf-8?B?RTF3bU84ckh5MXk1TEwvTGRESUZJMHhuTG01THlreUhFNEZzZnZTZlpSMU9z?=
 =?utf-8?B?ODFHMzFqc1UvSmdvZjR6QzB1NTViWm9oOXhRV05pWldIaGE3RkR1OUdZMUlm?=
 =?utf-8?B?bUxqREhUODRPM1FLeEN1ODk0aHhuUGpJRnF5SWhVZ0pZVlpwbjQvd09MTnpK?=
 =?utf-8?B?MzFleEJ0QUFKS1RLL2wyUDRuMVAwZFR5Q09UUWM3Y09rdVhpOTFyOExHa1V5?=
 =?utf-8?B?bFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	unVZXvEXNm1tZGN0CD9G6MCrCLBpXz2QsUnKgy0pdKi8JIlS/NCsrKV82FYV4mtLGXdcIqm4cYtHJfHe5FdWAsN50jlRLPmpCHfs2p/CST84Aosb1iB1YGX+JK2c8oKxk+/1oizB4dkOgVedlqRmrBjdSghod/1o3wL1u5muwmxJ3nJmY1yX7oFtTHAxdnhUCqInYYPPtPw9v/oTez55vNmjQB3McHlQJw6+3MXDdk/IBbOJSFKtW06oba7/BZ13YpE1DBxSaaggSSXUhA4XNUhr/CuACt/rurPW6VyvQlPgGJ870YkgT1+Xv3h7sdDJBhtB0bNMT0Pfitlm42a/dyB+63kRvIVWoduD6YOyozH/kS7TnzGyYH9jOR/adBl9I0fObdDyX2l0TJgfJDPVUlk4wD9++afIDsFz7qAn9Ma6W9SgvmZXASdQD65j0w+7L7S3Jdw7own4ypv4UUF+sjOG8VXZs07DbTes3BOhdCSPzbP3Ox+gkshX9UvxXxCnYnJvot6ts2YLb9Ar6LkJXJKcBXa6Iyni9VoJ8YzZUMle2yMU+KrvKXqoNY3MZAKM94aSJ1Ud0yQEW55a1V/ly7f88SD/xwB4JVcEQtgfJBpT7Icg3oqCBK3TZKKcMYS3FvKKa/ol0LOkFcDbBlGRMm7GwFTJWqys153VoSnRDpGPMmP7142+WTKVlQh+m8of4kClxYbpm1Qx+UUUcMEHcRtSQjtytYErowM+On9vJZa23lt7hm4X++ZHknJ9k59pwL6/IYv+0kL0jprRydsUnHRnPVhTY1tnvG9KHxGwZWvvJGVheXXn4os9s5NVV7PBr5zfAQ3kB4BYrrO34DdTAw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4f57ab3-f2a8-4958-8e4a-08db475e0909
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 20:29:01.3828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W4Z8w+fGClgLT9QBcNYGvoflUkTVNXMXzWoTlZWTxDEBsinHqsOMxM/6IvOtndf0BuwXvJuId0ovGgVMVK+GO/XevpIzS/kT8AlqGdzAaX4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5130

On 27/03/2023 5:13 pm, George Dunlap wrote:
> For now, mainly just do volume analysis and get rid of the warnings.
>
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

