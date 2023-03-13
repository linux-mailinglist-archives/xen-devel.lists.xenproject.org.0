Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A3B6B790E
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 14:34:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509268.784729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbiJ5-0004zp-83; Mon, 13 Mar 2023 13:33:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509268.784729; Mon, 13 Mar 2023 13:33:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbiJ5-0004xP-4h; Mon, 13 Mar 2023 13:33:43 +0000
Received: by outflank-mailman (input) for mailman id 509268;
 Mon, 13 Mar 2023 13:33:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=koCJ=7F=citrix.com=prvs=42903c55b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pbiJ2-0004ws-Tw
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 13:33:41 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41cbc234-c19e-11ed-b448-930f4c7d94ae;
 Mon, 13 Mar 2023 13:55:06 +0100 (CET)
Received: from mail-mw2nam04lp2174.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Mar 2023 09:17:50 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5018.namprd03.prod.outlook.com (2603:10b6:5:1ea::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 13:17:48 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 13:17:47 +0000
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
X-Inumbo-ID: 41cbc234-c19e-11ed-b448-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678713485;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=AR63Iv20gejFUGsDItsF7ctyAQmLi7csQoJfOJ6ZYRE=;
  b=AB3j9lef4vHu9wGMgtLJ6WiT2nl5zDhhhgvVNK3OIm6Y9avVUb+pQCAx
   mCDPJY1BMzj4XKRSr68obbdMRvHktD6Uc4W6CMolySROcwoKSAGhuS3DZ
   Exm7aICW9Hv5LxvLE3U1wIeu0CxmM5iob8JPRdyQjXoDq2JGlRWrt10/R
   4=;
X-IronPort-RemoteIP: 104.47.73.174
X-IronPort-MID: 99975353
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:DkeEJ606H6Wsa+rfo/bD5QNwkn2cJEfYwER7XKvMYLTBsI5bp2EDm
 zEeDGuEPP2NMzSmL48jaN+3oUNQvMSHmtBmTwo4pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gdnPqgQ1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfIUV17
 acZayo2YQGc2v7om7PkG7FDiZF2RCXrFNt3VnBI6xj8VapjZK+ZBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxouC6Kk1AZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXKqCd1PT+DjnhJsqHi63U8xKgYxbgWU/uOUzReaZ+puN
 FNBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9Vna15rqS6zSoNkA9LmIcZClCUQoM5fHipp0+ilTESdMLOKyoiJvzEDL5w
 TGPpQA/gakeiYgA0KDTwLzcqzelp5yMSxFv4AzSBj6h9lkgO9LjYJG041/G6/oGNJyeUlSKo
 HkDnY6Z8fwKCpaO0ieKRY3hAY2U2hpMCxWE6XYHInXr323FF6KLFWyI3AxDGQ==
IronPort-HdrOrdr: A9a23:xRmjOKHqSq94EgzcpLqE18eALOsnbusQ8zAXPo5KOGVom62j5r
 iTdZEgvyMc5wxhPU3I9erwWpVoBEmslqKdgrNxAV7BZniDhILAFugLhrcKgQeBJ8SUzJ876U
 4PSdkZNDQyNzRHZATBjTVQ3+xO/DBPys6Vuds=
X-IronPort-AV: E=Sophos;i="5.98,257,1673931600"; 
   d="scan'208";a="99975353"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VyM800N+N8HSkuXOezeO1cJ0AR7UQo5M4S9Wh23nYVGaZIndnfgF/7Ddagbl5V7+itf80QgWBmaYJj8B3fatW90wmYR06R1MJP/+adCtMwdQTZ6Ns5SizZ2U/Kk9oX6aa1bJquWeJCLNnpYDLmMaNH3ZBGZAFGrgExP2i10Mb6px9K9tHu79JToGKMB8s1FKmw84cgmStqj67IJIxYnAZBbMD2Poznw8gwQaje1SZRBgc5xbxOPUgY13J+Lbzpsz4C9rMhvhK3yotu2HSiHA1LXo49A311Q4NWazyAi/x98DBj2wdfnwpa7yqwFr8jPz9RW7CpuqP8PYrDCh0HfeLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZ9meqrnwLm4tCcSdDK3DC7S1mPw6undEotOl6ih1DE=;
 b=SmapysPI7+XXo8dRzRXQuCtrNbLVVHQa816glOsqNemtNuqFjsxKs3UTBAvgpJ19kFxNbre8BqVaVkpd2pBIoFvd9gOBRj72vnekSo9L14ca9VO3kZszkaQ/NHDe9S7sqH74pXBCM52Nxsl/McEZHJf1LINUbZqdjsTRfzznDYyUYuQJDXCFBPjEQUHaZweHZZUGtt6f7bWUoMX4pq50yqkgwkv7ic7mJdHpmsulJNi996rCrz0Bne1osc792sDRilwHTWQ7h2CY82sbCdBHhkPR08noCJ194xamip9iaKS+X2HlEHSqa1xUVUb7LVBDcnsXVDfhAnmxi/XSHXFp9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZ9meqrnwLm4tCcSdDK3DC7S1mPw6undEotOl6ih1DE=;
 b=gHTbvxwQsyRitPPurxA5cKuztn4ZHPuMTmlu1MQdm3GEMUKUr2XWpzU7SaCi8goFvDKjMu4FIJEQmh9/i7udqO+++IZ+75e2+bPoPQzwxevbITOT4d37AsIDgybZOVASUvY82yN6F6ziGu5Ozs9Tyaqb8hUpKAqyNKSnWRWPuWw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <17005fa9-9a50-ec4b-b494-a6db63a0ffac@citrix.com>
Date: Mon, 13 Mar 2023 13:17:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/altp2m: help gcc13 to avoid it emitting a warning
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <3a455e81-6db1-be47-42f1-9aa49531d715@suse.com>
In-Reply-To: <3a455e81-6db1-be47-42f1-9aa49531d715@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0312.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM6PR03MB5018:EE_
X-MS-Office365-Filtering-Correlation-Id: 437f290c-d04f-4076-e252-08db23c556b4
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5cauip3OIxjA321C1iGGdYrGxMVs82qjnh4bpjca8XTeV+oHddZNx3Vc7qcsgu7Xtk3qhS3O1SK6We0FRz7SNyvcOaOYHHu4+EokgMv593/NG6VEVaUdJYr86wdfTYfiY5Xho5XiKa5QN7um4TDa3Qs4sxAe0cqLzYjZDDRIQSBM8mUqPmZbxxHPzvd2hOntlDKQ25fmnmrsc7T6os699AHqDAEYyZjNrFQ2ZlXeWfi03gWdqYOpLTSQ68S+WY5Y60AHJGWIPOWVKs+IKbOoOKiMaeDCm0PQ+0YMxgWJT/fvwLbJgvtEl8djFBVZl4KjKo9ORzfxXatFBYoFFcxQnANaF1pSLhqTBeuRbYECHoSfpoamHaq2JN/tWWPo+YHvuPvcHuanA27UJ1qzsrUdomzjmO6x6a8Z4Cbvbf9Wd63Ea7sjhyksIl5ytg3P1iA1ZcGjQH1enwUcxzEFxK2/x8bHx53+WSRt8jMTSA/+RdO/TXsJCfgZ28st11lRGBOgPm9h5K9mncw3WJ8n5gNdN5K6Vh29Pia4z9nrriUPaiegMHXgSoqaTJ8m0+PEg2gJj5yBfonYC2j5J5tx86iVRJItofoCopp253yLQHfMXQYY6gDfgxmBA4JNfI9mqXNpILVD+aB69BQ1WVSatRKQYhIvAIvhGhYfXmuJ/tGiBv7FOxEOBlPrIRycxOYJJipz3lpKG/PAdb4FzPgiI69Z82vdIDlp3hHu/47aUhhggkc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(451199018)(86362001)(31696002)(82960400001)(38100700002)(36756003)(41300700001)(2906002)(8936002)(5660300002)(4326008)(6506007)(26005)(83380400001)(6512007)(53546011)(110136005)(54906003)(316002)(186003)(2616005)(8676002)(66946007)(66556008)(66476007)(478600001)(6486002)(6666004)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTFMb0Y0a1JJNm1rcjBIMmNXYzUva1BQT0ZFNEhaZHNUemZWTHRvL3RRWmJU?=
 =?utf-8?B?UTF2dmc2ZGNhUm9ocE94VlkxRDFhT2hMbEZWa2Zhd2dsWis3VG43QWtSUGl4?=
 =?utf-8?B?SStzRmxPbmQ5R0JUSTFZeWJzWmgzWlhwT2V3NXI5WjJUSEFpdDVrc1JRR2Z2?=
 =?utf-8?B?SWVzOHJacDZ5Um1VQk9UL3pxRmIxb1VOWGFYZDNlOFYzV0M2M1BuVWJQUjNS?=
 =?utf-8?B?N2xwUEZPZGlUU1cvNTZiOTNsd1lqQVdMc09Jd2thdXJDVFZDamN5aGYwc1ZK?=
 =?utf-8?B?WEwybmQrQVlRVEsxSW43eFZsZHUwRW9Pd2llQ0VibEdVZncwd0Z3WWJ2NHFQ?=
 =?utf-8?B?YXprWFFpR1RyQlNNSzR6ZC9rcE1NcGdVa1dMTzJXR3A0TjE5dWxsR3hsZ0s3?=
 =?utf-8?B?eXE4dnl5VHZmVVQzRm5PSUJpN2ZLZCswZEFheFpNRGxnV2pJVzZVZmJsR1B1?=
 =?utf-8?B?K0cyWi93bGx1VEU5OWxDTy8wOWo2dlJRUlNXTWhLQ2V1ZTNTallzcGtpSHVq?=
 =?utf-8?B?MGdTc3F1SlBGYUw4WGxvMUVMOU8zNDlQUmlNY0JmUDdrWW13cnk0TFlrQ3VK?=
 =?utf-8?B?cERyR3JoRi9WeDQ0RFNXVEVVTzdDM0YrbUFEV2JKQkdXQ3BlTHRLUitqWnpP?=
 =?utf-8?B?dTdsakhEYnNIdmN4R2Z0QnVweTBxWUlCdXJ1RktwSmJTQUJTVDlCUXNPN3Zp?=
 =?utf-8?B?bzRQYi81NmJ3S1dETkdyUE12OHl0SlJQVEtZU0ZydllGRVFqay9ydUtjUktB?=
 =?utf-8?B?NWlEOGgrV0xRR08yeSthcktBR2FkcHgrR0hUeklQZlFMWkdWS3RBSmxCUy9i?=
 =?utf-8?B?NEZCNkM2aHhKQTRFa2lOUldNcnFLTVhqd0s1UjNCWEFiSnFNSFI2WEpIMVEw?=
 =?utf-8?B?bHE3d0lBK0dpRnpHVUM5K0tUZzc4NTBhZkMvRmJUMDdUM1BSa3ZJZ05OUzVL?=
 =?utf-8?B?TUYxclNXWTRsZFVNcndtZ3piclhDdDJEcGxPQXVoNW9ka0IvZ1VHU3pocFNC?=
 =?utf-8?B?cVFkajlXckpkQVJSV3NnajdFQjRDQmpnL3hrbmJ6Q3FYYTVJWkhvd1RPNklv?=
 =?utf-8?B?S1gvTWRvUXAzZVlRQ2JOaDBKaFlBUXRkN0hWYkdnbzU5eWVYQ3FOQThLVkE3?=
 =?utf-8?B?UXNJbWpHaTFQdjFuVnM1bXA4MTAvWFlVUk9RN29WeWlFMTBKaXFHVFVtNXRD?=
 =?utf-8?B?eU9zR3JJTmcxMzFZSXl4cEJMcjJVdW9zSjNTeEZsSFdZVWJXSDVoTEN0eWRE?=
 =?utf-8?B?V0I5TzRVQVFHdk5TNlVReUlCV1FjMzBIYnBQSTBsT0psQ1o5SnpyRW9CQjNR?=
 =?utf-8?B?SzR5QTY5a3JOZExTMnN2d3ZxTmVkd1dnTXU2VFVMb2Qvd3lxM2luNWJ3a2Fj?=
 =?utf-8?B?QWp1R1pPR0xYOVpKWndWQzNEdjY1aGwxVHRmTXlQdFdSSFZ1RmIzK1FUMHVq?=
 =?utf-8?B?MzE1TFdpb2I4VTBaejhXMkxRV1VCRFZ3ZGFXeG1pODJ3NWZxbm1Ma0ZuWTZL?=
 =?utf-8?B?OFlCWVYweEpIN3ZTSlNUZi9ZeGdEM3JJMXI0cEYxL3hQZnFtNEVLUnBPZ2FK?=
 =?utf-8?B?cEJGeGF4U2tVcXRmNkdmUHE4RFNxd1BNMTIrWkVqaVRaTzY1KzdKWE5UeUVy?=
 =?utf-8?B?TWluMXVlekxhVUtKM0VtaGVBcFpHM2QybGJlb0FrZmg1Sm5VVnZqVkFtdFFL?=
 =?utf-8?B?T0R4a2RWVGRLRVk5cjFXRktWc2tyejgvdEV2cXZUdXlwa3JPb3J0YnVhRmtD?=
 =?utf-8?B?ZHJvQmhWQi90aml1VC9VMnd2L09EazRoUmRwb1RJWU9WWGIvalpueGY3R3JY?=
 =?utf-8?B?c1dOYzhTbWc2dkY3eFhYc2tpWHJXMm8ycHp6RU5lL2U2U3VtdGsxQlMrNndq?=
 =?utf-8?B?S0hqenNJelZwdHJOY2NMVGxVcW80YkZDS0ZxWWdGNU8zZ0RrWWFzd25CZFA1?=
 =?utf-8?B?TjRjYU9Xbktlb3JDS1ZleFZ5VjQrcWsrVlVTWGRKQmN5bEQ4REZ3SVNacEcy?=
 =?utf-8?B?N1lkc04yZGdFTnFYYTl1b3BkMmJYNkZwYURKVGtxNTRySzV6Ykw5cFQrdUVF?=
 =?utf-8?B?UVBEVlE1Ni9zRlRqaGx5L1BuT0lzWHIvQVF5NUQ2RjMrQ25DSjc5d0tRdHhi?=
 =?utf-8?B?SjFCd0JuUHBody9OZ3Q2c2orZGVVcGw1M05mMzZJRTRIdnhLSmdZaE1wK3ZR?=
 =?utf-8?B?aWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WlOQzmU9FSed7feKPSUCxsrNnnxxGxxwb3wePssGZYY7Y6KIhg/u4hhC0rFJXjB5Rf7KNxONFuZoAGuEdt9tRDzGWNhuZ2tEsmmMO4lbpA0PVON0/6tpe3UN1f6W5cX7RPLCrVT7LJGU2qZHMyn6kAqclwY+x6BWgE7v0bAOCIk4my9mWgoerq9/iVRkPgu4iNm84I8gNytrmAB5sxEkzt29wxWDY5TMWI8L6zrrIN4NMUQ4aJJEFqt5928R2+egwxDDs1kqEFom3nEzadRzE+SnIgHlUwlvdMdy2kU8WymPBdYihEucS0TFyFJpqMfuHKVg7l1qC4RsDKYD2bQa2AlkwcsaRjT9Ib4NEyhDdGUWGuoz/5TsGs5ExTpyR38bbyVIzTryLGCxcM0xlfWIUqbfxpLnNQ4OHhIUv5BCDsNyT49Tx2u9ZjkOcsj+ebQ2EzQnm4c0U78bDoNWidsk9D2yxO/oiA0C1dMvl/zC9pyAsoUz+RDT0/1QcrwgvBDpSA++3lPenBMcwcgkOE5I9c35CAWgc4W0n1I2nPSMrl4AWj1RPJd6+XgnsheT/eamAXyle1Plc2Kp94lDmmMf9tiVOonGVbYl0r215MQJSodNfvchtpmLdx/1X7JWswEJa8Y/7QSJ8bsqGYzX2Boq/tZY7qWpKBd/N50gSMcAg3BK6Ln7b65tY02Uphat9KaUp1mg8blgMogtto4qSl8hpiJkBhMgIbAOKv7XV1W0xudF4VFl22nHNAJW8eKfKnVVy3oh5vvUtpmuGTAOaBA6jjIJRzt0AQua7VIgbEIB7u6c3FcJFUWqk1IS1JYMpE3L73P94U1V4ZOV4PUZ/zz1bLWJcoIc86RpZ+w8quSZDrM=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 437f290c-d04f-4076-e252-08db23c556b4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 13:17:47.6250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vuEzelJ3Ilz4CJdK75NkJk7E5qkF1OVPVAHIDUT/HtX3oi/fQUVHeDjh6Hp859vP2GFkWgC/J20x5rVLB8Ow5xBRyotif9lEvNEWPBKfCLw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5018

On 03/03/2023 7:31 am, Jan Beulich wrote:
> Switches of altp2m-s always expect a valid altp2m to be in place (and
> indeed altp2m_vcpu_initialise() sets the active one to be at index 0).
> The compiler, however, cannot know that, and hence it cannot eliminate
> p2m_get_altp2m()'s case of returnin (literal) NULL. If then the compiler
> decides to special case that code path in the caller, the dereference in
> instances of
>
>     atomic_dec(&p2m_get_altp2m(v)->active_vcpus);
>
> can, to the code generator, appear to be NULL dereferences, leading to
>
> In function 'atomic_dec',
>     inlined from '...' at ...:
> ./arch/x86/include/asm/atomic.h:182:5: error: array subscript 0 is outside array bounds of 'int[0]' [-Werror=array-bounds=]
>
> Aid the compiler by adding a BUG_ON() checking the return value of the
> problematic p2m_get_altp2m(). Since with the use of the local variable
> the 2nd p2m_get_altp2m() each will look questionable at the first glance
> (Why is the local variable not used here?), open-code the only relevant
> piece of p2m_get_altp2m() there.
>
> To avoid repeatedly doing these transformations, and also to limit how
> "bad" the open-coding really is, convert the entire operation to an
> inline helper, used by all three instances (and accepting the redundant
> BUG_ON(idx >= MAX_ALTP2M) in two of the three cases).
>
> Reported-by: Charles Arnold <carnold@suse.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>



