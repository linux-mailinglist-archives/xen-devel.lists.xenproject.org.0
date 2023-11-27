Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE687FA2FE
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 15:37:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642178.1001496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7cjG-0001Nd-QE; Mon, 27 Nov 2023 14:36:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642178.1001496; Mon, 27 Nov 2023 14:36:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7cjG-0001Ku-ND; Mon, 27 Nov 2023 14:36:54 +0000
Received: by outflank-mailman (input) for mailman id 642178;
 Mon, 27 Nov 2023 14:36:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nblC=HI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7cjE-0001KP-BI
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 14:36:52 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2062a.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6648ffe4-8d32-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 15:36:50 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB9761.eurprd04.prod.outlook.com (2603:10a6:800:1df::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.19; Mon, 27 Nov
 2023 14:36:48 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Mon, 27 Nov 2023
 14:36:48 +0000
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
X-Inumbo-ID: 6648ffe4-8d32-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A3/WiXDu6chVf7dr8whhq9U/CyrbvxfvyN1xjyNPQbxf8P7LWa4kpew/kplj5WAqj37f05Uu6EZyrK/k8lXjXFUWXEczL5Wb7xwVrwfzopRLSBf6igg0ICnC3aAP59MEyzY3mqqqPxLaX1ZRWaZdqUkFBlraOd2d3L5ZWV/ibdwqWbwk91aQzw0zsXHFXhVR5uRGzGDEbTVdu+J9n6yjhVmH/WCQx5arIYimg0jM7ZClRDgwDm6t/I/j/mqcSjv66Qc1wY3QSE+pdzm7OAA+bo5qzQIZxSketUy6k6vwvVxcCT+csEIugl/UgWP1qyGjxxZlM19R+XkpWNQQ0l1qOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3GkbICPkBAaYGCxb3Q9Aw6MMEe633c4wx+Cvx2SSmOg=;
 b=ioIlp44ZsCT/pSef+WQi+zy44D130lGXPjQqumob43VAe5RArVMrCDHzwc2q9pxw1Y9vVMmyDS6HgGgpkeK5XRjyHzf6rq1S/wsdBdJnqoYFA7UiR3l6j/1Mfhwuk798p18yE/HTq7mKdKU/KzbfLEGmLJIGYfgiz+vBldbcLyiuudiDBAYwHuBpCKL+NGdZf0koVuYGKV3cYYaNsYEeH3zs/g6UDbZh+RUtV6sNNIhiOweA3X+6TqYpFDade9qunrHk9gtP17P/TNiGLJilnAlfI/8icOJ4g4vtXwZ9C06bFFhKgEUsrDVnm3x2y+D7wjlhbpnaI35zcdleTWjlkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3GkbICPkBAaYGCxb3Q9Aw6MMEe633c4wx+Cvx2SSmOg=;
 b=pvK3IJ5sSxnPPDxfjL/4IyoJwNY8gG6hdlYa9Xt5IIodfsfw1VfQBQgFXn493xcTVqbGutWZWUHcUYFN/toE1gcbcyFPZw0PS8+aNLz+msRbdO38XzKeUGzBWaBWU13s1x7PLX9IuiUc9xWYfBdzZ7njtxILG0Il24wpSuus9bmADKYMVHGcF9uW33YnO11M//jHUqfHMJp5/Cja/lUFRauL+lfca43KYPf1ZfxEtAPyAEvAKiPDAFiR6suktMUn1+rErBKfyY4ylWbAOXsvCLghA/EPlduxHUqci8SDVpacyK+ZZmLPBmOX/F2M6Sul7e7aEv1hEVYQ8NNQqQ7UxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <36211cd7-6b62-40ec-ba1e-110df2653c5d@suse.com>
Date: Mon, 27 Nov 2023 15:36:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/14] xen/asm-generic: introduce stub header softirq.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
 <090991be61252cabefc06da19597e3a86a4cd1da.1701093907.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <090991be61252cabefc06da19597e3a86a4cd1da.1701093907.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0186.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB9761:EE_
X-MS-Office365-Filtering-Correlation-Id: 29d11e5b-3c25-461e-eda3-08dbef56495d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YS2vtpHOKFVhlOHB91k3N3YWw+S9l1yShTkQrZpHsAovrFc/fqjRTuVxCqi7vGuf3bRoAWGpZDEsINFcJopmgaTL/W7WEyrbsavpGU5EJO95g+gijf66vz6yF3I82MmyjexGkL5Pt4qPfeeTvo3LGZwUYq7UPmpJsFo6KwUXNve7KJ/LmGD2Orm7KxHB7sQwHioe0mWBxfrZjnCw9759V6l8YfR3gbSq7ImS/WInzpj4q6LCw6hSMz42XRmNDR2pXywL9kFPR/4fFiD9P055t+0phQ5Cl30BmNA8E7w1y0aggQQYMB1sT+2v7v29tnZ47H/1tw+ArJVLrGer/k/eREi71YACav82lcAGV+ycpqHHPvjSs0/uzQB/3G51mqusWlYpW1YPkTiGgPJKtBYjim4w7oP1lea96DQTDy4lAmCVwppYBc48Ix0cRWFbxCISHMZDB92SC95iDSpR4uLA9+iBJrPQ1G2vtIGNd4dF98lTBagvV0KdU6pLhH7QPdOVNVRTiMTHNiB4VRMQREUMQVLAqVJYzw8lpem3FmmjuhPVxgkVpZI7do58vPIoNK/r4vY7S7j+S2Njsl4/rY1ZdFMk4zYb8/gtjVKULyQjinsp5JIW02LmIZM/YKIwuQhLWZgoEul2F8JbObYVw3Xi8AIb9DKp5HJYmayanaUFEI4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(366004)(376002)(136003)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(2616005)(26005)(6506007)(6512007)(53546011)(4326008)(8676002)(8936002)(5660300002)(6486002)(7416002)(31696002)(86362001)(478600001)(316002)(66946007)(66556008)(6916009)(54906003)(66476007)(38100700002)(31686004)(4744005)(41300700001)(36756003)(2906002)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjZDbUkvejhtZlVnaURxU3NneDFpcCtNT09RRk1mYXU1OWRRVXRmVlJQSlZP?=
 =?utf-8?B?ejZKRklsOHJqME5hRVFwOHQrNFRqVVAyVjF4MHUzSHZpWHRGaDY1TzYwcVhZ?=
 =?utf-8?B?UXp0NWU3OHUxTlhkZUZIV3FmWXpBaWlGZElsL0s0T1ZqSTlSUnlucVNqTXV4?=
 =?utf-8?B?ZThXbjBWUG0xSXUyWUJSRi9RRVp0MjdZTXdwbGxGd3JwOFBFUFUwSmdBSHM5?=
 =?utf-8?B?cUhQSDJ1QnRxV1F2cWRoai9icy92d0o3cVBDVkc0ME9pSDIxdDQyUXFsZEI2?=
 =?utf-8?B?U3lXd1hqd2NnZi9BMUdmSEhVRC92SWV2b3I0dGZXSjkzR01GMTBYMG05bWpy?=
 =?utf-8?B?UGlsUlFLREI0RW5HTytIcnIzK1VMcDMyZXo0d0R1cHpoay96ZmV6aWJXdk1T?=
 =?utf-8?B?ck1qc09QWFBDakx1MURUc1c4UlNsNFJIT1hlbm12bVk3NkRaSy9vL0xXWUpO?=
 =?utf-8?B?RUFFRCtoYUp5cWE5WkdWZ2ZiMDVFT3JUN29pd3MvOVRVaXdzU3VsbUg1VldY?=
 =?utf-8?B?bDRJRjhjWWh3N0E3bU5GTjlzVlpjdnVZa3U1RVZqakRWbkoxbXlZSk5CZlJY?=
 =?utf-8?B?ZEd5WWg1aFlMNE05cWh0UXBFUEpJUGdrOTY5RU1zRzVqaGZ5djVhQ3IrL1p5?=
 =?utf-8?B?SVZ5c1E0enBMWU0xYUd4OGJoeE9jMjhmY3dWSmpjdTFETEwvcWhnc25mNmFq?=
 =?utf-8?B?dnZ6ZkpzS3RjVU1sVVJmbjhBRWp4SzBHZWdoV1o2Q3NjQ3J5bXJPZElnK1Np?=
 =?utf-8?B?bmJzc0t0QnEzOFhyV2lYY3VaR2UxNS9LOS9RWFZSdGFIbnFsbmkrSWl2MGda?=
 =?utf-8?B?WXcvakVjSHkwdjh4RE5kaG5sdTBaYlQwTVQvTnh5YTZDLzhvTXNGd1FXclJa?=
 =?utf-8?B?T2Fvclh2MUZXVHhzNWNtSE9QWTNrcDR2SzVLSWN5R2UrZVRBaGRVamFBVlZD?=
 =?utf-8?B?WldUNysrTWJqeUxIVVJqcCsvaVlJdEdJWmQwMW1kRFZNbUhZemNnN1hKa2hQ?=
 =?utf-8?B?VnZBamtxRm5zclJNVUIvSjFrZDZidnVZSVNiSEVCV2lyNHZGU3hHdFJVY05D?=
 =?utf-8?B?YUQwOGk5SkszeTYvRE1WZklOUkZBNUF4dDl5SVlwcnFwTUVBMU5hMDYvZWZm?=
 =?utf-8?B?a2huL1RtVDMxMnM5emQyN2w5am1nWmNjNmRzQTB1UTRRWUZsOCt4b09DK2hi?=
 =?utf-8?B?R0l3UWdWMkVibVhrQlZjb3FGZ3Q0MDJ6WWdkRk5BeTRIT2xkdU9FOVZjZFR1?=
 =?utf-8?B?b1NaWW1sYUpEWDJBODBuVW9YSExTS2lodjk3THlnSG44aGFrbndKazF5czFO?=
 =?utf-8?B?MVN4dW92dWM2SjRQK1VqaktxOUZaRU9mRnh0L0g5M2Vpc3B2RGZtTk1DMElp?=
 =?utf-8?B?L2QreUxYeXh4dDM2YXRnVHB2N2xZdk9tOXJWWDB5MmppcGNiMlB5SnV5cEtL?=
 =?utf-8?B?NUZWeW5OWXVRYTNRYXJnTGpleVhnTWdxSXN1dmhnN3Bjc3NqMmxKTkk5S3U0?=
 =?utf-8?B?SGZWRnA2MHpqNGkrbVdIYjVNd1RiOFBvOE5yZFlDeUFYODVBcVEwazRpRy9U?=
 =?utf-8?B?bnpiL0NLMGE4dS95MlNJd1dJRllrWEFTOUlZUEkrcVFxNXNIeUE0ejlQckho?=
 =?utf-8?B?VVpNSjhRaVZQc05xaUdJU0l6Zy9IREpNR3dRQXZVYzNJcHg4WnN6eGhEZ01u?=
 =?utf-8?B?eWRnc0duc0E5QUlOUE8rOWlzQzZnTFA5TXBMVm1vS0Y3ODZlVUpHenJveUI0?=
 =?utf-8?B?VTVRbXA1N1dCeGhTemxwR0RxeUpDR1h3VUNURUdFNXRVaE5XUEN6Qzl0U3Fh?=
 =?utf-8?B?R2Y3cDc4a3JjV2p1cTlremQwUTZTcUgxWFF0aFFkQ2RNb3d6NmRWMnJNV29h?=
 =?utf-8?B?L0NBeFZvQTZEUGZrcEhKck9LQU5WcXk0emlXWk45dlR4N3h2T1d6NS9ISTVv?=
 =?utf-8?B?clhuY202STJveFBWT2UzRTVaK3IrbVllTXg5TDMrYm0zNTNJMHpLWmpSeXFz?=
 =?utf-8?B?NG1CTDE0NDZrbW1hbjNCeFlMUHlISXU1dVI0a210dFBiQlVWMy9EbzNEM2Np?=
 =?utf-8?B?TEdVVmZIclpSZFV0WDNPR1Y0T1NMZEEwL0I2U0k2RDJhR0lmeDlYQ3Fibnlq?=
 =?utf-8?Q?vYinDMAwztz3fcv98c7ceSRpl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29d11e5b-3c25-461e-eda3-08dbef56495d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 14:36:48.1186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NTD7pA5CJjxwyK3uPulOE9uHV8D7URgG1cPnc7T5ygnR4nb81wPwkAqvKMjaGduMlHvO+UpXBTxOszbEHmOFnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9761

On 27.11.2023 15:13, Oleksii Kurochko wrote:
> <asm/softirq.h> is common between Arm, PPC and RISC-V so it is
> moved to asm-generic.
> 
> Drop Arm and PPC's softirq.h and use asm-generic version instead.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> Added Acked-by: Jan Beulich <jbeulich@suse.com>

In case a v5 is needed, please drop the stray "Added".

Jan

