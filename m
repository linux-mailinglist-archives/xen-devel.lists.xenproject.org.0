Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F075869E627
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 18:44:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499105.770135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUWfn-0002ko-2p; Tue, 21 Feb 2023 17:43:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499105.770135; Tue, 21 Feb 2023 17:43:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUWfm-0002ij-W1; Tue, 21 Feb 2023 17:43:26 +0000
Received: by outflank-mailman (input) for mailman id 499105;
 Tue, 21 Feb 2023 17:43:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aMCI=6R=citrix.com=prvs=409bf5b25=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pUWfl-0002id-Mm
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 17:43:25 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b356364-b20f-11ed-93b6-47a8fe42b414;
 Tue, 21 Feb 2023 18:43:22 +0100 (CET)
Received: from mail-bn8nam04lp2044.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Feb 2023 12:43:19 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA1PR03MB6468.namprd03.prod.outlook.com (2603:10b6:806:1c3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Tue, 21 Feb
 2023 17:43:13 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6111.020; Tue, 21 Feb 2023
 17:43:13 +0000
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
X-Inumbo-ID: 3b356364-b20f-11ed-93b6-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677001402;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=R8QDHo0m146qUi6RWY3MuPvPg92UpEIcsN1A8VgDBAs=;
  b=hPXoxqcfZjinbduTsnW7yHAtEqgjgLboff2ZLmbS9WG0crsL/ZJsnI3/
   mFXvB0BIGNcG9SgGM/9twVrM3v1cSfhTYXxO61EjJa57q2o7OKjR80Dtl
   5YVsRRQ+R4N9V6pVwwBaHDRz7HI4MkUlm53JsKDyCFMBMtz9QDj5SfjxF
   Q=;
X-IronPort-RemoteIP: 104.47.74.44
X-IronPort-MID: 97854316
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:xRGOBKDDnl8hVxVW/+niw5YqxClBgxIJ4kV8jS/XYbTApDkn1GNSn
 TEeXGyEbvbZYmf0KYojOYux9h8Bup/RmNdiQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtMpvlDs15K6p4GlC5wRlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw5992UGgVz
 8AidWoKXknZg+WI6YnmY7w57igjBJGD0II3nFhFlW2cJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTK+exrvwA/zyQouFTpGPPTdsaHWoN+mUGAq
 3id12/4HgsbJJqUzj/tHneE17CfwH+gAdx6+LuQ0P1Lonq663wqVBxGUGuAmaf+hGOiYocKQ
 6AT0m90xUQoz2S7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZjVIctAhuec9TCYm0
 VLPlNTsbRR0q6GcQ3+Z8raSrBuxNDITIGtEYjULJSMH6dT+pIA4jjrUU81uVqWyi7XI9SrYx
 jmLqG00geUVhMtTi6Gjpwib33Sru4TDSRMz6kPPRGW54whlZYmjIYu19Vzc6vUGJ4GcJrWcg
 EU5dwGlxLhmJfmweOalGY3hwJnBCy65DQDh
IronPort-HdrOrdr: A9a23:sTQyMKG7cfZU3Yt/pLqE+ceALOsnbusQ8zAXPiFKJCC9F/by/f
 xG885rtiMc9wxhOk3I9ervBEDiex/hHPxOgbX5VI3KNDUO01HGEGgN1+rfKjTbakjDytI=
X-IronPort-AV: E=Sophos;i="5.97,315,1669093200"; 
   d="scan'208";a="97854316"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=czLfdDv/+3Svu2mAvAjXX4QxDG/6CUfN8AfpYa3ZYGGxObY857hzLjHF4DOfUzPkVximvZJslscVr/qtF3/aGU5Bq4SFMiovJf/9nRceBiEu6rpVeqV9f/fxY+71PBtDBGl1gJpFBnTbaLbte403AI2zNzECDF643bMMY0IxGveXmtf7JNwn388wbJcaYKSOwGZzDsoaa1BNxI8uN+8oLCcyFEwzaZpo6TwKERODAopcANxlMZAWP5TdlBjGARbEdUy0jDwX9m3gUG800dhdDbwAhyaSxqS2Az1J7Rj8tAiukI1rjb/G7QTwShPqnIiitgrwtiKWmtO1soaQplx1aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hmazuq2y6xTEMviGjaNHVe8PmcmurT0Gu1Bvv/fAg/A=;
 b=UbMdhQIRp0CGCGHgJ+mv+VbDPHigATqRtv9S5VBOEOQPMOOI5ECZQSVNrbpxdRooxrbw3th+omOY2TnDB56m0NOqgPjO0udKUpnID/w4qAxZYDx4RXaTCC9Buy6vXpZERvV/zb3pxt216EfhYLZUa1f/2hN0OSsptVRLKgoGdhMz19rTlRT88lF2nnrgzD2B5e4jx60QRhrrt7VNrSxVAhQuxO4I6vdj8VoW2t2fphG9WdnLteHLFzg96/t9LCtxGNaRu2/i9x5+0wTQwwvz4u0dmdaDuxzhwhhzEebGtl60CsKLZ60z6pSktNk4UdOby9sysKSApWGBcN9n18HCYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hmazuq2y6xTEMviGjaNHVe8PmcmurT0Gu1Bvv/fAg/A=;
 b=VhoPucwmGQ2OA98kcxQSVxSdkn5icGnHMZDQ9rf3t4MKh2gyNh5syan6FEmdAyplZsflliQXKtMde/7ZlRd6UcnNonvgQwSqdQqjAD6rN30uV8wdBmBv0kIqiz222zYDZyYIY89G8/4ktxsUG9+QWGfcvLT7xtcjKr+BKSD1BdM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <af2baf5a-b03c-89d3-8ec0-014a8a696bb1@citrix.com>
Date: Tue, 21 Feb 2023 17:43:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v2 3/7] automation: Remove clang-8 from Debian
 unstable container
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>
References: <20230221165542.7642-1-anthony.perard@citrix.com>
 <20230221165542.7642-4-anthony.perard@citrix.com>
In-Reply-To: <20230221165542.7642-4-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0249.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA1PR03MB6468:EE_
X-MS-Office365-Filtering-Correlation-Id: cb060044-5636-4685-d35a-08db14331b25
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1Dsj7U6rtF1bj7GQdChq17PyEgMGJd7oEYQa87bVw3EnwIaT4muSlxdI2hep8zOaejFMYSVKbKuLuhYLhn1fW41C1YgtRR/yXc+TSCvi7Ut3HYk+7wMqweeRk0Uq+Z1qmJcBL1ZD9CcvNwRVVUPa6oIStmzA+TobtQid48+u8kuEbb0NAq/Ph531UL2PJry1wb4tMf1M6EwOqMl3XrTSjITAj+tCspX8N+nzb0j0SOaxc4N1rUGCFJwHYDPc24Lr4pm9RdH+mLSkLXf7ua06nNCcynf3gjcoNr9wBfICSAWrFIPqolZRIfGKg9K0QqBnbw3eMU3W9DPeKhnrcafQyCNQdcMqRgGItD3m8hhUZlnt4CsU833enlq5gnthZTnarxYaB6DwxcuvM/bFJFux6kwd9Jb0wnpyfX6FttyZDW/2AJwHWIt4nYA0g1bshygQ5ThCSL3OjNW1ECIz4JmqbgjJk1YNRLYDNAj7yvGYj3tgcRyx68+CV4DGIxU2xd9q1vur+Rhfa29EEQYa8etYFTEs5ykzl0WHN0SOcZdR0Nw2ChZ6yae8xYwR0YNaRZPIP7ktJxCtVUA0UyVbCcgLAtNuZrPOMVBJJIs7nxORbCnGuTvYmtGQXSG/KxCAezxszfJBdVKAAutdmiLcVCq3UNPyPRxOE4MtRiiIrxlv4JXSJxSntqW0c7wAJ4PqS9QZ2/VGCp7BDtlLwBOU8BbJD+Hp439y9pxdv14qtYdd9bs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(366004)(39860400002)(136003)(396003)(451199018)(8936002)(41300700001)(38100700002)(31696002)(54906003)(53546011)(6486002)(83380400001)(66556008)(8676002)(4326008)(316002)(82960400001)(478600001)(2616005)(6506007)(26005)(36756003)(66476007)(186003)(6512007)(86362001)(66946007)(6666004)(2906002)(31686004)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGpnWWNEMHY1dHNyYzdRaTdVQWpNVkNaRjc1K0k4QmxhMGJKOEh3WjZ1OHRK?=
 =?utf-8?B?ZFY3RmxmaW9vblJ4T0lzMC8wQktpRGRPZXBVN1JUa2wwaUVZbStTa2dpWk00?=
 =?utf-8?B?cUJJeDloK3NWaG1nM2lXZFlIbEhadTNHR2ZhRmRoWjFFcVdRUldla0VXR09B?=
 =?utf-8?B?ZVBadVVpcFhmNmJuMkpGYlNrSWZyTFc1VWo4QXhhWXhQR1Iya0JESzBHazRE?=
 =?utf-8?B?ZVhFQ2VqaENQYVVaUm9DejF0WkMyMDRYWG5ieldXNWZkRzN6SUg2cFZYNkhO?=
 =?utf-8?B?TTJwZG15U05mVUZOVVpqUXhXYkFxRHFyUVVlSm1aenBPYmZzRlpHWGhlVFBV?=
 =?utf-8?B?dHN3VU1rN1p2ZWszZ05jeUdyVW1oVGVvbFlhSStGQ3JIb1NNejczczYxMmw1?=
 =?utf-8?B?ekUvOFZNWXczc25kZEVQSUNTZ0o4VkI1ejc1SU5jM0V4QWFlME9KT0htbzRj?=
 =?utf-8?B?ZlM4dnphNkMzcFYzalhpeUtKYis1ekNtS3ByYnRBdDB6YW1tMmYyRzNNcjg5?=
 =?utf-8?B?Tk5Pc3B2cGZxdGF2K1F1a1NVa0k1N2lCL1o1Y3VYV1FuN1gzbGptc29paVQw?=
 =?utf-8?B?M1U0SWEzRlRoUW5lUkVJUkZTTXExRG9EeFhxSmlaRHkreUl3Ny95aktpQnhL?=
 =?utf-8?B?QmVlUzdxcGR1a084TlNlaTNlQm5mYXdZWDlBS3JSbE53cmxGVmkxS01VRW1h?=
 =?utf-8?B?SGdGbWpwbEh2dXdUZmM0MjdKRkNUWnUwa0QrUTFONG5yQkI5V3FGTG9xL2J0?=
 =?utf-8?B?VDllb3RnUkFGMzA5WWc0ZGJIWW4wZ2dsRjhFakVJV0d1cUJRa2VqMFVkdnFG?=
 =?utf-8?B?blovSEhVYXAvN2FVbVhCTFo3MTNsUnJHL0Uvd1c3ZklhUG9NZnR4dlVBczVv?=
 =?utf-8?B?d0JQSVFOVS8vSjZEMk16RTZ0aU5zTzJudTJ6d0ZsNnpNMVZBbU0ybXNyWkNE?=
 =?utf-8?B?SGQxeS9nL0RQSjhCeE1yaENENDZhNGduUDcrWGwrWnFjaDRESWR6VEJheWNv?=
 =?utf-8?B?ck96NStuR1NoUERqMzJxV3hIMnQrdThmbUtFcWtpWVdoWXlHNlpyM1JtLzBm?=
 =?utf-8?B?WXBWT1V2ei9VMFFhWml5Y3hMVFBGZmFLQ0Y4MERmY1FrdEhQUlQ1d1ByTVFN?=
 =?utf-8?B?eWpqRDdkWkRIVytOcEhmY1A3bXBaZEhwbDAwbTFseEkxZ3RXSTdvK3N1Z25J?=
 =?utf-8?B?SFd4a1M0bm9EeGViSmlUWjlhL1gySmRUSSsxM0VsNCtOcGlIQzU0VDBUQzlz?=
 =?utf-8?B?Y3EwangzaTlsd0hyN2RUallTVURsQ2R2MU1OTTNYeEJDRnVuYUk2R2cxQUQ5?=
 =?utf-8?B?MHh2VEZNT0RKMW5DdXJlbXh1bDNtc1FoRlZMUU14WHBJTFM4enQzWU84bWFJ?=
 =?utf-8?B?cENxaWhyTWszK0ljVE9mcXBKNS9lcjBiMHdYMzVNa3BoVEEwQTBIWm1YSUhm?=
 =?utf-8?B?dGQyUnJudVgyclZLT0lmaFQ3Yjc2a0YzRm83THc0NTB1ak1NdjRETFJDRi9z?=
 =?utf-8?B?MERSekd4Um95Zk8xcHUzTmU3c1dYcExmUFpWRDdOK3RVaVJMVUpWYUZFa3N3?=
 =?utf-8?B?NHNRS1F0RDA2YS8wbVdPNHJuUk5KZys0emF6YjhqcmhGM0EvYWR4YnV6RjBR?=
 =?utf-8?B?UmJtT0crbEx3OUw3dXozQTVpbmtWa3dOdEpGTWltMzJuREFmWmpINkJjZnl1?=
 =?utf-8?B?U1RXYTUrWFN5WE5wRzBmbUJQZFF4Mk5Jb3JIL1JMcFBBcENuK25mQkFPV2pj?=
 =?utf-8?B?YTEzU2o5bUlSckZGblo5eFRHajUvdi9BcFJNMnUzSHQvUTV2MXNzOUdTYUVh?=
 =?utf-8?B?cHE5UmxEeUJQVU1pSTRkamNpN21POHB0dW5sZjNNdTEzN29ydDlDZldmUGJQ?=
 =?utf-8?B?NU9iZmpid0dOWmpScEs2cXBsV2JZRHJ1TEVJR043RjhKSHcxYWc5RW94RWVR?=
 =?utf-8?B?cXZPcWhybDlWRHp6cUoyZ29adTdJYWdhWi9qTUsvQm4wKy9LQ1RTckFCRmRu?=
 =?utf-8?B?WElJMUh0Zm4zdmpRSHlpSk4yT1lZekFQTFMySDV6Y0ZLbTBuL1NQN2R0a200?=
 =?utf-8?B?aGJNdDMvQ3ZOKzRiVmhuaW9Ta01yRzB4QnhyMXcrOFJtMTFzbm9PRVFlN1Ar?=
 =?utf-8?B?K1pYQnBwbGxCRE9OeVo5Z2I1TXpyNjhPZ3Qxb3UrZ082ZGVxMXZTem1Tandh?=
 =?utf-8?B?ZlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6o5Nm+zf/vqj1QS4+PXaVo22nsIfffvn/9jKLhMbEttMxTiPjtTlX11LDZMkyAwkKI+6hoVYTtxYETu4zlMKtDmVjbEAJbafBcSJJNmZe+ikKeAiWo8DIrNG2Crs+a8Klapp9NU5Zizh2ZJI6eC7PDnz9lKq5nK0wVLjGD+K8W3FnFIuWHY7nYy8qmXW1NpjP/MQiIcqBqwQH+fFkEn5pslYT7IZR3kAga1nDu18N8qU50ExT03VGIzea/BZ08PKZwNd2820Y/KriAzU65l5XA87TykD0LP+9G79gEJTo2HmDudpunko8YIwcgMNPo118nsWwPfDzRcTb/OC11y2bsKHDo1UoBfSsXSjEuisArN5lox3v1+v96Lwf+kIyEov2Ti5yNAAfy06+v6wmr9V1W7KKL+4aYcK75bEHgQfUYTewyuPa8hi3Mtn5CH+IiosHPwHsf4UhyjNTveBlMb0Q8tOjnVU3UD7jVkqy1fYRhcWk2zlbo5hti/LhbdPZ1T4JLESlA2QYS7UHUzt8aLW1LfVLsgxjclqLfryyd6ziRGWbDlFHMHEoxCAmd6kjOEwnwI3TzlPs1TOGfojuOsvKAR2YNJCasWtIyuG3H9CCL+Tachoefw4v53TAyIUn8ZDqfvy612uOh533dS1xtszqmToaDtTWEzBnKXzuw9Mo15l+Kp/A5cuJ0icdiSfkZveIkT+NvTX7O+Wn87+YGO8DltAxC/GRe5d7Xj2BUCMvne4x2MDTTYsgjeXR30/o5VEfIJYkYDdu8Kh1xiln6PazMZ1QQ0B4So/XzLDUDJYv1mUOJvMcJ/+E91iFH4LCWUvl6rBXXsu7K1kbFrvkmF477SsUqLgb+G2fNXdd4zNFao=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb060044-5636-4685-d35a-08db14331b25
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 17:43:13.7220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gxZOUhKikfcLsXUvstq7+oqWUvN/Xp+QutcDlyrY/2ElVj/I3oAy94/TQ8Hgb5xPegC1vCNnKXGVKYe3y2addBdjS7WnmP+VCQGBCfRo1Uc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6468

On 21/02/2023 4:55 pm, Anthony PERARD wrote:
> First, apt complain that it isn't the right way to add keys anymore,
> but hopefully that's just a warning.
>
> Second, we can't install clang-8:
> The following packages have unmet dependencies:
>  clang-8 : Depends: libstdc++-8-dev but it is not installable
>            Depends: libgcc-8-dev but it is not installable
>            Depends: libobjc-8-dev but it is not installable
>            Recommends: llvm-8-dev but it is not going to be installed
>            Recommends: libomp-8-dev but it is not going to be installed
>  libllvm8 : Depends: libffi7 (>= 3.3~20180313) but it is not installable
> E: Unable to correct problems, you have held broken packages.
>
> clang on Debian unstable is now version 14.0.6.
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
>
> This change will break "staging-*" branches as they would still test
> clang-8. So patch needs to be backported. (at least build.yaml change)

Well - it means we should backport this to all trees before rebuilding
the container.  Which is fine, but we need to be aware of this going in.

CC'ing Jan just so he's aware.

~Andrew

