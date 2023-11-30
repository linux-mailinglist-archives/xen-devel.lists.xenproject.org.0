Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7888B7FEAB6
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 09:33:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644446.1005446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8cTt-0000gZ-Dl; Thu, 30 Nov 2023 08:33:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644446.1005446; Thu, 30 Nov 2023 08:33:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8cTt-0000dl-Ac; Thu, 30 Nov 2023 08:33:09 +0000
Received: by outflank-mailman (input) for mailman id 644446;
 Thu, 30 Nov 2023 08:33:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BG3/=HL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r8cTr-0000dP-Kz
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 08:33:07 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062b.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1586a4e2-8f5b-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 09:33:06 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB6995.eurprd04.prod.outlook.com (2603:10a6:208:18e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.8; Thu, 30 Nov
 2023 08:33:04 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.012; Thu, 30 Nov 2023
 08:33:04 +0000
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
X-Inumbo-ID: 1586a4e2-8f5b-11ee-98e4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/OpDxr1ECLs/mxQQeriAuyAuXVDx+h2QYAkQpSxEdL4hnhXuV8VNxkXXUekuoDgnAVeZrie80spIXm5m+gYqxtNyQUdXxYiZkKEzh4bGWrNOMNA0OSrg7LjtMkH06aknQlr/34GP5UjXkiytsfiyOQ0rR/vHNEKR6M0WhlejBNiPDWIBPi1Cvo95TL7s4pIKgxp4XujM8ACN6mJsfA/stZauNIwqiRONnrQujCHpLBrhlipj7pkJbB92OxGbnkxFySNVmPp9DJd7UzAWwFtLuimHfTQgMQ/C3ID0KOwX+5tBhTSJFW/Ps+4cIYkX2fYw8YUHZ8foWn6e0zADFiXcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+NBfqkdRVmLpGGdo+GcVeqodE071n1C/AsXBxSwxSU=;
 b=Wbzvju8IWQyWu1uMbTdmrsQE1/WywW48hO24+Vi5y6s83wHZk+VKAEo/fd2FdkLxmRia4DPsG+t5IWAyYU/rQfZiPvmOctqzLPrrq6IkHBJR8UX8JlrGal5cX1Y356xa3qB1+tTtfFKGahkehJ7okNC0OfSBbC9/cTo2xVBYUWCmJTkqV3hnPBbRuh7z/rgsBdblPwoSa4fiO4FjFs3c5E6+gcmRS49gMqxDdlNw9uwWXVbV6uEQg6+clzcJJljndepxITT0FrsQSvSs3e71nmHInZ3+Xc238DO5yyM5Pju0bC40dIgv5B1ZFzXFNfVx6reGSCwqDf480X3/h9ORBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w+NBfqkdRVmLpGGdo+GcVeqodE071n1C/AsXBxSwxSU=;
 b=QFn01jvidbcSTos1Xb95QXJnhwO8gHPOLjc+0l2+Dt1erTFIUG9fDAnWsLxYoQXyyKCPMRRvVlpA+VvJPKet3nc5ZgMZhD93M8TgU7Hd970ibRYEsNI4Ft4t/Ao/FXXcZ93/3ztwmguZ6RvQhwTFsfoJ99Mb06jSxixKLQz2m9augTVkp0UVsAWDVzcIfF47ydmrmxc4OpukCrwXsyrqBIKZHGmP382oUQbeIXlyT3qZ8kMKR8k95m8NaRXMmbVqTR1kSnkv/SQwCZz4O+1KKiMl8emWLK/BKXguEEWinYFFpAHEzeDOHcYpe5Fv6QDghJoTpqylMwUH5iVUvm8Y1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4cf3d507-a76a-43b6-81c3-bee960e811f1@suse.com>
Date: Thu, 30 Nov 2023 09:33:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] [FUTURE] xen/arm: enable vPCI for domUs
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20231113222118.825758-1-stewart.hildebrand@amd.com>
 <20231113222118.825758-5-stewart.hildebrand@amd.com>
 <8be3763f-a4b6-8962-9183-a2a9c3509726@suse.com>
 <a92b1717-965b-4767-8f11-4c3a4e03418d@amd.com>
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
In-Reply-To: <a92b1717-965b-4767-8f11-4c3a4e03418d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB6995:EE_
X-MS-Office365-Filtering-Correlation-Id: 218e028a-0f53-4e40-8230-08dbf17ef838
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u6JyftjTdRBQqFYQFVHcQwa7hBXRmDp6Sw7DnXQI3xIYMDEFoDut1JBjZ5rZBVqcQ4Vcx1r3K23+uIKpTY0uALqE4EbS8i8xTOnMQvzSxEcMz7V4gvCDIWILN0T3SwwzqM2gcC1RcK6Qfid4uZcbHpZJD1A0XUDnOIqPDOY5U16nEssRBq1sWSxFH4xUJ+Hva54A7jNoF6pjVSWY95ls1DVmLkSDr3i4czqo5kjrZMsi+wNSOGLalnKswBXgJBnX2m0awnavg9aytYS9EmMUTXQZCY2KXN7y0cCkG0r91qiwWToAcNDRk4NW4USzwo440znoHsMQ22kNG/Xf61kI7c/DO9g/D7NnlnLaSAjlLTTWi7wTta2wtwZBvQNlwVx0noQMsT+u86xeRVajQTaZmKI3yu5gRbGL7zP2eAb+IFAZtAFARbPbPDS/g80KC8j6ODDq2fzDnPo/Bt1LXfAO2PyaQhYLptJoY8yOoxk5R5Wr1JaaapoRHHxqu4CXCUnfwRRWSBCwIt/ZmMjqwLT+7B4DT9GWrCmPPprKaXv6tjjExBOjXDqVuD2DJbsnnnv7PktECzbo7BCDi3ZXnI+4HkniQxChM/1M3CuQTx+R6BVkYwun3xT22oYCoqF8MGCu2sWcD/1CoSQOCIwJI29e/Yz9rFmTHm4OK6bWSbzDkwWZ6VFD3KQokks4obZOsHuh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(346002)(39860400002)(376002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(66556008)(2906002)(4326008)(54906003)(66476007)(66946007)(6916009)(36756003)(316002)(8936002)(8676002)(5660300002)(7416002)(41300700001)(86362001)(31696002)(2616005)(26005)(38100700002)(31686004)(202311291699003)(478600001)(6666004)(6506007)(53546011)(6512007)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHhXUTJXdEs1ZnFheW5YWWs3SDZJV2UyaUlnUysvQ0tTTUFOQkpOY3NjaFRE?=
 =?utf-8?B?c1N3bWpwRUszVlV0RnVFQXB6TEtVbkxYVUNPbGo2dUFDRTVER25qejRpTzZm?=
 =?utf-8?B?U2syb3pidzNHQlJ0cnluNUFpaHg4eHE4enpmSHQ2dlU3QlpicWVPdnU2SlBp?=
 =?utf-8?B?VE9yb0g2SEZxY2ZGWk5qSm5xa0JYT2tWRFJ4aWptWk9SZmVwZ29JWVRCc0sy?=
 =?utf-8?B?Ri91TXhGM2U5Sko1NzNLY2NBVjB1NGFoelcyekJRTEk2SUk1S3QwcXdkL2hO?=
 =?utf-8?B?ZDlTSmNDMW40Q09mU3Y2UDJTUS9NUisxTU9Sc0xRVUJFYVJlWDBKOStKWkIx?=
 =?utf-8?B?SXNyeCtiWTQ3bWJRVDVKT01QQ0lQRytUVnA3YTZidVZ2d1VSdlowYm8rUDdq?=
 =?utf-8?B?YWlacmdwZ256Y2xjYmh3ckM1ckIyY1FtN0g0Q20zUmdhUy9oT3ZodjVmbjRL?=
 =?utf-8?B?M3RZeDJpQitOUG9OY3NmWGgyZEU1K2FGMktHTGJEbFd6VXpPZ2lzckRPSUJp?=
 =?utf-8?B?eWJqLzg4SzQvV3Fxb2xXTnJ0SVZuY2hBejR5eE44NnVTZWJhWm9jbHpmaXZN?=
 =?utf-8?B?a1J3by9uczFqaHNOVVNodEpvWXlOa3dvWmdQLzRDOWNZdTF2L1FZQU02NVJh?=
 =?utf-8?B?MUI1M29QUlpJbVA0MWNzbHNoeWdnWkJlTlkxYmJNRjNhdTQ0d0lrV3BKVXV3?=
 =?utf-8?B?UTdzQ0xvbFBkSU1rR3dERlV1TEVTQTkyYUlkK2x1SE9pQ2E1bkpBek5TNjhI?=
 =?utf-8?B?aUc4S21oVzBkNjJaaVlMZVhNL0tRWUdJR1h5WmdKVGUrWnVSYlU4TWZYN2Fq?=
 =?utf-8?B?cTVhVUdNTW9ON3grL3RKeE5tRmUwVU1sQ2FvbzQ0WDhhRStpS2FEemFWRXNp?=
 =?utf-8?B?dE4wU0tudkNpY0o2RlNNZHlIdzlsUXluMWpVSGhnYW1tSndaQ2hEalAzUy9D?=
 =?utf-8?B?MEFONUdxbzlDRnlmQTI2Y3MxVnU2bElieG0wVjhlNXB0MDQrNk44a2xHbzlx?=
 =?utf-8?B?Rkd2YjhaYmhINWFscUdBUENYRFhsOVFSbjJEZmxtMzZ0TDQrdldVZTNYWU14?=
 =?utf-8?B?L1Z0Y294QW1zakticTZ4UDBWSERaelpmbkFqQTNsOHhXNE1oc215cjAybGJ1?=
 =?utf-8?B?TW1ndnAvR3pYdThYT1NwbEF1VC9Kd2c0Rk5jcmNwbDBhV0p3TWdWSEVzOVp5?=
 =?utf-8?B?c28vTm9iN05Yck5ucklHeERDSjY5Rzl3OVZFcjZGOFFNeW5nUmNjcGt3a01H?=
 =?utf-8?B?RnVrSitlRnJ3blRqWlZFWklXZjhwZnJOZEp0UHRVS3hwVDAzaEpGWlhvU3JC?=
 =?utf-8?B?WmZxZFl5RmFSQ1ZnemJWMW1yazVhdXU3UmRKenEvRTgxWkM0Q0dBdjQyNTBZ?=
 =?utf-8?B?NThVQTRMNm1DOUdYeWtrcXRPMko2NU9acjlZVE4vQlRWd25CZlovSCt1dTBO?=
 =?utf-8?B?aHNFRnhVMzVmbmlzQU9xZE1lZHQ5TVFnYmU5ZUV2b1IwRWlmUHJheUNDallO?=
 =?utf-8?B?YkNtc3NOdVNiTk1wbG55Q0xsVUpEUTRtYUFPYjJ0ejI2eXIwUE9BZG5SYTNv?=
 =?utf-8?B?dGRaVTZTSHdnczJLbHVwUlIxZ0FocVpiT1JsVDdFbElHbi80RGV4MkpqWEpF?=
 =?utf-8?B?QjQ2VTJ0MmVLUVZaTnpRbENtbkNtTkg5THFVM3gyNzlhNkdEZVUwL2FIOEZo?=
 =?utf-8?B?bTM0YjBjT3JXK1R5dlBrdjhlcUF5aGVYM3k3bkxMNllvS2pJZFFxTWQyakpn?=
 =?utf-8?B?V0kxaUNMRWs1TGNteTJKd3ZIU1QzWURSdWs3NU1qeDN5WXVRQWhNdllHcGdF?=
 =?utf-8?B?TlBPVURhSUxsYjVzRE1uUkdPSjZubUMraUJtZlhvMjd4NFRRVjBLZllzUS9z?=
 =?utf-8?B?bllLREs3dWMyN0l6V1JtNXZTMkRmSlBJRGx1Rk5MK2RMS3NpUlRIb3VHWjFM?=
 =?utf-8?B?aG4wc2dGdWNxYlcyVThuODJ2bU5ZTjJjOE03MTZIRDFxV1NpclIxcWxlY0s2?=
 =?utf-8?B?TkMvbnFSUUNDTjNvSkJrWENTYnpPc2F4U0llMk03YkpFNFpLOFVRbXppVkln?=
 =?utf-8?B?UHI0NnZUU0tzckpJZGVmMEFBeDlKTzFxdjl2YkRxbU5RYTRoeS9rdFpYMDda?=
 =?utf-8?Q?+2g1t+8eXyi2Rg+O38VIcshsK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 218e028a-0f53-4e40-8230-08dbf17ef838
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 08:33:04.0082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sssVit1ft/SfyUdZScCVztxOHkboTuyhfkonHR/c+EGGb0mIwNfRyk34124MFD6/inzIJxOb1Z5O/otTm08l9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6995

On 30.11.2023 03:47, Stewart Hildebrand wrote:
> On 11/14/23 04:13, Jan Beulich wrote:
>> On 13.11.2023 23:21, Stewart Hildebrand wrote:
>>> --- a/xen/arch/x86/include/asm/domain.h
>>> +++ b/xen/arch/x86/include/asm/domain.h
>>> @@ -503,6 +503,8 @@ struct arch_domain
>>>  #define has_vpit(d)        (!!((d)->arch.emulation_flags & X86_EMU_PIT))
>>>  #define has_pirq(d)        (!!((d)->arch.emulation_flags & X86_EMU_USE_PIRQ))
>>>  
>>> +#define arch_needs_vpci(d) ({ (void)(d); false; })
>>
>> See my comments on the v5 thread on both this and ...
> 
> So, the goal here is to return true for a PVH dom0, and false otherwise (for now). Since dom0 can't feasibly be full HVM, and is_hvm_domain(d) returns true for PVH, how about the following?
> 
> /* TODO: re-visit when vPCI is enabled for PVH domUs. */
> #define arch_needs_vpci(d) ({                       \
>     const struct domain *_d = (d);                  \
>     is_hardware_domain(_d) && is_hvm_domain(_d); })

Looks okay to me, except for the leading underscore in _d (see respective
Misra guidelines, merely re-enforcing what the C standard says). Of course
the double evaluate_nospec() isn't quite nice in the result, but I guess
this isn't going to be used in many places?

Jan

