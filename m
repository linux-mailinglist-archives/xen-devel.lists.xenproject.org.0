Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 812A469F27E
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 11:09:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499329.770425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUm32-0006ui-I5; Wed, 22 Feb 2023 10:08:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499329.770425; Wed, 22 Feb 2023 10:08:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUm32-0006rf-Ep; Wed, 22 Feb 2023 10:08:28 +0000
Received: by outflank-mailman (input) for mailman id 499329;
 Wed, 22 Feb 2023 10:08:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TNgZ=6S=citrix.com=prvs=410ac2269=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pUm30-0006rZ-1o
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 10:08:26 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6a7508a-b298-11ed-a089-e9535cc0f9c3;
 Wed, 22 Feb 2023 11:08:24 +0100 (CET)
Received: from mail-dm6nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Feb 2023 05:08:15 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6233.namprd03.prod.outlook.com (2603:10b6:510:d7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 10:08:13 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6111.020; Wed, 22 Feb 2023
 10:08:13 +0000
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
X-Inumbo-ID: d6a7508a-b298-11ed-a089-e9535cc0f9c3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677060504;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=K92uLc8rhYz2tw4w3QIKK5F2UC5P0rVMaInszbcBO2Q=;
  b=UfWdeCLmktGuMBxhHcUcQzqG4edz/vBRT12aA43rp9Ht4RCJeLlYU0iA
   YSd8rQ+g6K8oy1IYl/QXUP+IyadcJWpEZGdXud1D/VPujUblBLsAXrGnI
   QdFeZYxVhjSiv5yJtWliyaVTLePbAKuZla327dSdZj7mUu/wkT9qVOwuY
   A=;
X-IronPort-RemoteIP: 104.47.59.171
X-IronPort-MID: 100460146
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:uC7nxakvWLE/PVh0c9/Sdlno5gyYJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIaWT3Saf+NMzHyfYx+OY6x8EoOsZDWzdVgTFM5qntjEyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7auaVA8w5ARkPqgR5gWGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 f0zOA0qMhyTvsGR8qyGYck22OJkNvC+aevzulk4pd3YJdAPZMmZBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkV03iee0WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTOXkqKYz3AP7Kmo7KBcub1z8+PSAtA2dZPRcB
 UUI1iMFsv1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnop4thu3MCkRaGMHOykNSFJf58G5+d5qyBXSUtxkDai5yMXvHi39y
 CyLqy54gKgPickM1OOw+lWvby+Qm6UlhzUdvm3/Nl9JJCslDGJ5T+REMWTm0Ms=
IronPort-HdrOrdr: A9a23:K7SvaqBf+90vvMnlHelW55DYdb4zR+YMi2TDt3oddfWaSKylfq
 GV7ZAmPHrP4gr5N0tOpTntAse9qBDnhPtICOsqTNSftWDd0QPFEGgL1+DfKlbbak/DH4BmtJ
 uJc8JFeaDN5VoRt7eH3OFveexQv+Vu88qT9JnjJ28Gd3AMV0n5hT0JcTpyFCdNNW97LKt8Lr
 WwzOxdqQGtfHwGB/7LfEXsD4D41qT2fIuNW29/OyIa
X-IronPort-AV: E=Sophos;i="5.97,318,1669093200"; 
   d="scan'208";a="100460146"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZqD+AAhMeAhxJVeeuIj/hrNIJIMsdR4Nzc6aVQHW2GU+emSi0tzD4lWO95L8ae7Evhv/mgE+2iz2WUgPF8CBuIZN0txm2glKkS0vNquZ7cqhva20jsKTA+RDm92Jiv3o/gxebXk+srtkp7imfkRp4mQpj48JZ0flGyDvwiMDI0c7bh2ZXAkxiWnPETCttBN2MCvizFekrmUX4clHrTr0LdvAbMXBfQyaXihqp/kJFyvtGAxUkRnTCaZFHL/5B+GLLwAAifDRpXXn+pv/jFjwyi7hll7hn+tUdwAb1xADMNCY2oT/yPn0et2f3VcgMabzCbafwYrVCcFNm7NqFOMYAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K92uLc8rhYz2tw4w3QIKK5F2UC5P0rVMaInszbcBO2Q=;
 b=UO405YkmrpTaP9lVN2/tO9qwHtKWE/VbohXeftxXLSSyoM0KhsIi6qiVRZDcrbocrL6Q5UMId6Y+fhbRhr1Bi4XUDn0NrMDXPlPgMHLs9fgUaWYlNgwuDKZTvuByF5yRFgH7Dfadnt22JdGmcGBA/l5F6Vo3OzcjLkQmKgDyUMp4viI4e6JHA4RlxfO6PtDyp/1AFhPnQuNCZPRLCCQ+yR5QojoIfeqWWKQmWwSB+bchXnZZx6ndXMLcIi+g9UymcjddEPsqyQ3bxPv/hdqxQrMKfI+UsMZE/Rcyqx1BdIsIVc+cFI+oeOgeIO68Xxta5W7QPBXGGBBprWtP2usykQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K92uLc8rhYz2tw4w3QIKK5F2UC5P0rVMaInszbcBO2Q=;
 b=Ntd0mBnrWcgtAu/E7SgzOdBBwOHsUfStVDXA3v56TB/FnrHQNdKrRR3JFR9XS5zj3rXXFF7OCQwRNMwr15/xFYwZTjBFCUePWHgi020lGwaZ37SsV8h8KW7EfYLn7L5VbhUnmZT7vaxwebMwSqhxjdjtFIAsc5dIdUIsg7ipRgw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7f34e7aa-e4a2-f5e7-f111-92e599713cb3@citrix.com>
Date: Wed, 22 Feb 2023 10:08:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Debian randconfig failure, Was Re: [XEN PATCH v2 0/7] automation:
 Update containers to allow HTTPS access to xenbits
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230221165542.7642-1-anthony.perard@citrix.com>
 <19396277-127d-1127-cdad-341368f97e92@citrix.com>
 <621319f4-0924-9b5f-9f84-be275f878cb4@suse.com>
 <e2e4b7ad-bb41-4954-15a5-c62730c5def3@suse.com>
In-Reply-To: <e2e4b7ad-bb41-4954-15a5-c62730c5def3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0016.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::6) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB6233:EE_
X-MS-Office365-Filtering-Correlation-Id: ea860141-6755-436b-1599-08db14bcb574
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gwP8XR4k9AVBGIQze1fvG3Nj8RqKUZh+jX6o4jE5M3Br/TiMC9H42zQrMaSFMvDbBVhpS7XQ6MgmM1xQaY5WfWMuqJp40ZtcZWrIawscxs19urzHgwaqpgxcQhHQsECnMhmHFiZgRzIU5L3KKc2VitO0YbrOZjIhxwyKIpVb6D4GNdaN1uCABOcISDElvmekc4bQ4ZCHnLYiPttwQbKpGfU53amOFtCrIzfOBAJRJ0X3TkQpx6oMLluu375CVFxefxQLxYajyBKYkQ1gWEtfXUHFgs9budAd67gKpmYIKny7c7xtaViKSlmjbKJAGPFN9tOkoTf1oPqATKjmR2DQaSK8LjjgPeiKPYYHCMIoemk1Wb7m91Vct1VbCabKdYpYKHclAElw935tFIP3w24uxcShJdWZRMC9WdzoU6vBeeAlpzwgQb8bmTOBwADMN3sTT7KZCXOREOOUPclkVgHE6TClxBfSPXhqSH2E/YJTgZv6d339G+1g+NSNPMkK/b/mqvmOso1XAjDH69Ntnr2RyjvfM5i4eCc6jhatYxb5pie6h0I/xDSTdmvZ+S+2WqkmSA5/zxwNM3DexGm/f+tPNChFxvyJKBGlJ2yO7mb/f89LO3rekcLUPcksoT7HdwicsuCVK/mivFxNNmA99DmH489NpLqxAzyVINxxxAdRuaThaAgyywdlIejNfZXo6kDD5pCLuS05DLnaUH0y3XY/k+0FG/wZjIVliYToN7K0NsY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(39860400002)(376002)(136003)(366004)(451199018)(316002)(83380400001)(478600001)(38100700002)(36756003)(82960400001)(2906002)(86362001)(31696002)(66946007)(66556008)(66476007)(8676002)(6916009)(4326008)(8936002)(41300700001)(5660300002)(2616005)(966005)(6486002)(26005)(186003)(31686004)(6512007)(6506007)(53546011)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVFWb2hIemcxOVRQeXNzU3B5SXRFaHVreU1VRUF6WHBXb2ZiLzNBWGpjYkJG?=
 =?utf-8?B?YS9vYVNYQlNoTndJc3VjZ0VwdUlwWElYVVZhb2hzODJuZVlBMVdxalVLL2cw?=
 =?utf-8?B?cDVFUGZoZEhBZkpkam5lWVZMa0FqdE1oZ1k5RWZEcWMwMVFPbDg4cFc3WVRk?=
 =?utf-8?B?UGV0VVo2b2lzcFc5aTAwRUNoM21ZUmQyYVo0MkdublJKdmxYUkxzekVIamFI?=
 =?utf-8?B?WkVENS9TVkRZV3IxdWwrdUk1bTdDU1hwaVpQUkhIYTlIRXNVWG5LTWZIbmR1?=
 =?utf-8?B?NzR4QzBqeXk3UlAydGFhaFdkZWZucDBhU25LWGZQWE5MYUxrSk4reDVEUklX?=
 =?utf-8?B?dzM2b0k2dE9vKytnK1d2amw0ZzJMblRoUUQ4MU94L1F0bFN0WlpOTis2YmhM?=
 =?utf-8?B?NFcwSDViWTRUYy9vK2ppdFVjYndWeHhyVTVNRlRuTThOUTNDamR2dlpSekJz?=
 =?utf-8?B?aUlMSnBKUE1VRDR1T1VDL3VmaWcyakN5aWNOSkZXV3lEb0d1ZnN2aU00Tlpm?=
 =?utf-8?B?UDV0K1NDREp5OTFMaTRZN0lhTFp3aXR0NUFqU0VEZ2pYVnd2Zjl3ZnF6MnU5?=
 =?utf-8?B?c296bkxJN3BLR1ZLdE1PL2FEWFVnb2pVYUNsVUlOUkxjOVZ5eWh4ZjJzVFpu?=
 =?utf-8?B?NVdnU21BT1NUdjVoa1hXNk5PM2ZNL0hoOXZZSGZjUXBHTVNlT21kSkdMSkY5?=
 =?utf-8?B?bHhMQzlsSnpZdEpKZFI5VTM4WFpEbFNGZUNlTysybmN5RmNjcFprNWFvTHdk?=
 =?utf-8?B?Skw3N2Fld2xvWTlxcGljSGhjTWNVNjkzUnViNGIyaFZlNklZOEZjMWc0MVU5?=
 =?utf-8?B?M3psRnpJK1pIb3R4Z1I2TC93anY1UktLSHlrTXBJVWVDMTZLSEx1bmFCaWVt?=
 =?utf-8?B?NmFFR0xVQVRyMWpzakFVNjJJOE1zVkxrVHd0Q0VnTG5UaU9vdks5Q0E0K1A1?=
 =?utf-8?B?UHFHUkNNRzM2ZjBXYXIvc3RIQ3FuMTdMT2o2cmpZczdCWFYwY2JhRUh6ZXpt?=
 =?utf-8?B?ZG1tM1RIazM0REcrZW05VmRBYy9rdlUrR3RLeGI1b0o2dXF6VkY0ZnRxRzRD?=
 =?utf-8?B?R2VyRzBkZExNRTlLSVZnRjNoZW96RS80bUtvdmp1OTE3MDZIb0hJQ2ZNK3d2?=
 =?utf-8?B?RUlnVkFjc3orZHRCYWZOaEhsVFhFVDRlb053QXhsdHJVSGpWTll2VWZjaGVk?=
 =?utf-8?B?TE5uQkJ0SUNXU1V4VlJHcTBHQXZMcFRPUGpYcjcxNi9EOTZqNDhsYjBpMUpn?=
 =?utf-8?B?YzY2ZW9qQ2dDTk5pYTFVQ3p5SWhsZlVkOExMZjFKUmhPWHphWERIZWV3aFk0?=
 =?utf-8?B?WE1FREU2ZUMwQXJVMHhEL1JoTjdEekJXVHhvKzJzOUhEVE5oZm1PSjRpTHMv?=
 =?utf-8?B?VFZXVWpTUGt1dnZ0RW5tZkRJaXZadDJQYlhNNE9pWllKd3d5dVVsK21kd0dW?=
 =?utf-8?B?N2JGUktDdjR2eFF0dGVyZU9kWEFOejdOSW10MlJDVlhnMDZjYlBlejVUUXAv?=
 =?utf-8?B?V1RVc1I1emxzcnc4b1UyZ2dpRUQ5T203SkJwclJvOXpRcnFTNWF2YnIrejhW?=
 =?utf-8?B?dU5qMHQ3YWpBamhnY05TckNPbTFRNkxuOFJHNlZFTmprODFTWmtLQ29MNTcw?=
 =?utf-8?B?K2dobWtZR1BLdzFOVktyV0tma0R3cUNZbW15Y1AydlN1ZytiNndyTHNTTjA1?=
 =?utf-8?B?TmJ3YnpOTmdkcnNIYi9YV1BKc0ZUT1dEdzVHSm5qMzBoV1JzMEdUdDA3OXVI?=
 =?utf-8?B?L3dqdVNjY2R4TEVtdW1UbFU3UjNKZktBb2NpVlhkMUZJNEphNmxkNWFmMXJW?=
 =?utf-8?B?RVRRZUdXUDAwdmtFYzZQZUpRbGpyOU9ic1lrQkxvSTV5aTZ1ZC9TYlB0Ly9Z?=
 =?utf-8?B?VWN0ZEQ3dVZYb2xTRTQ4TEJaVFBwZzNMUjMyVHo3TCtaSDIxVnhqVmJRVWtq?=
 =?utf-8?B?K2dCMnZ0MmVJYUxLMUo4OWNCbWQ0cnJQNG5xVmVaWkNDeUtRTHRNaUljSjVB?=
 =?utf-8?B?a1hPV3N5V2VRMzBEZkdNekpORzEyZ2VZdmFRS2E4S0hyOFBmNmpGZmNyMkhz?=
 =?utf-8?B?QW15SGhqQzNVLy9qeXJTaTJBeERHN2ZBWFJab1d5Z0xiV2lzVHlNQU1CcUto?=
 =?utf-8?B?NFRuSjlYdkFETjJIWFh5QkxhSVQ0akZnZGdkTS9sSzVrY1BnY3R5d1A1Y214?=
 =?utf-8?B?K2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9SmD/P0tQHfsxdvG75OAUUGckbva57W2GsYHy/En38p2Nj7ApjRAO8rwbzmKOoOtXYurLUin+LanATV5smgeikmeIlS6l3huOZ0HeGS3aHFze+AbOmw1as06iE5ERLVltXvXZJtXnbhtbyTymqxdQnvTFqGXOdFlCTqH07vHdLRiZTmQULQc6OjP6imZTXDAVtCWwPUQ27+Bh1p4nPLESrTIlaRGUa22AHtXuIAKF2KKt6Rjr3YXzCsjQyl+OTREUh5EjJtWXiOOC4fJxGKnFS5QuqhW0k7hBU4hHpi/5D3csqj0E0/nznFhdtqqP7JH2GCtHeUnx4bEFVjnl5gq/cCOCqIYnjUPRahOpjXP56Ud1wsXULzXVahHxcinV5znoJYEU5O6ys1S6YquOsw+mheOVunrUy5Oo3F8x9ApDee82mXvhSZqdoJVW/XsEw9WnYzZxThqWsIHFICwXooV+jSlC0Ku5TFZEOIcCSMEMnfUV1ZpCYgL/czwsaN1NqJgRbL5eKiCdF51ZLytki9ILNKv3nOtHMnIl0nqyGdhq1JghzbjwORZsqO/5Fguyd1VGYHpFY/0sOG8DqntII05IA4psAstiRMi2KYWkt39UwziU39PcSa85Q+huBLVjW5NmzADW1CimDfSKuUx+IZcHeWMk4f/fjRBSIfhrkSo98hocIuk1KFBGVlzw8+wjEQwkDbGiPrnzfcmWcSorUYkCKBijDHR6K8pxfc0YCuHP6IDg1y7xROW8yv0axAThut0bNWWd0Vn5JWe+fkVP6w9hHgQHpM9R3QPpXVDQ+IgqzFD7jnCAweyrE7BBlnz5q6I
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea860141-6755-436b-1599-08db14bcb574
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 10:08:13.6716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N/Np0F/1fMrLx2hv+bX/rFkBUcLBwv9QxBKjI5FNOBIAwx5DOZhLdoBx4909aJw54HN5FgR+NpRgDRqqIH+/KupAoMgR23TtMHK0516Ys4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6233

On 22/02/2023 9:53 am, Jan Beulich wrote:
> On 22.02.2023 10:42, Jan Beulich wrote:
>> On 21.02.2023 19:05, Andrew Cooper wrote:
>>> On 21/02/2023 4:55 pm, Anthony PERARD wrote:
>>>> Building randconfig on debian unstable seems to be an issue.
>>> You're talking about
>>> https://gitlab.com/xen-project/people/anthonyper/xen/-/jobs/3769926509 ?
>>>
>>> + gcc --version
>>> gcc (Debian 12.2.0-14) 12.2.0
>>>
>>> arch/x86/extable.c: In function 'search_pre_exception_table':
>>> arch/x86/extable.c:200:27: error: array subscript -1 is outside array
>>> bounds of 'struct exception_table_entry[1152921504606846975]'
>>> [-Werror=array-bounds]
>>>   200 |     unsigned long fixup = search_one_extable(
>>>       |                           ^~~~~~~~~~~~~~~~~~~
>>>   201 |         __start___pre_ex_table, __stop___pre_ex_table-1, addr);
>>>       |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> In file included from arch/x86/extable.c:8:
>>> ./arch/x86/include/asm/uaccess.h:414:37: note: at offset -8 into object
>>> '__stop___pre_ex_table' of size [0, 9223372036854775807]
>>>   414 | extern struct exception_table_entry __stop___pre_ex_table[];
>>>       |                                     ^~~~~~~~~~~~~~~~~~~~~
>>> cc1: all warnings being treated as errors
>>> make[3]: *** [Rules.mk:246: arch/x86/extable.o] Error 1
>>>
>>> Jan: do we need some more gcc-wrap sprinkled around?
>> I think we can get away without, but first of all I'm curious why gcc12
>> spots an issue there, but not in my (and perhaps also your) local builds.
>> Being a randconfig failure, is this tied to a specific setting in .config?
>> Off the top of my head I can't think of any which might affect this code.
> Looks to be the combination of DEBUG=n and COVERAGE=y.
>
>> To work around this, instead of adding gcc-wrap-ery, I'd favor simply
>> changing search_one_extable()'s 2nd parameter's meaning from "last" to
>> "end" (i.e. the range passed in from [,] to [,) in mathematical spelling).
> I'll make a patch along these lines then, I guess. Should I credit Anthony,
> you, or both of you as the reporter?

Yeah, I did wonder about changing the final parameter after sending this
email.  It stands a reasonable change of simplifying
search_one_extable() anyway.

Probably Anthony.  All I did was look through some logs.

~Andrew

