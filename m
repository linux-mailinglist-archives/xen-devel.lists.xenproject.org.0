Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 264F87FA434
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 16:13:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642241.1001616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7dIQ-0003CC-JO; Mon, 27 Nov 2023 15:13:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642241.1001616; Mon, 27 Nov 2023 15:13:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7dIQ-00039e-Fw; Mon, 27 Nov 2023 15:13:14 +0000
Received: by outflank-mailman (input) for mailman id 642241;
 Mon, 27 Nov 2023 15:13:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nblC=HI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7dIO-00039Y-Qh
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 15:13:12 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0607.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ab8b3a8-8d37-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 16:13:11 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VE1PR04MB7392.eurprd04.prod.outlook.com (2603:10a6:800:1b2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.19; Mon, 27 Nov
 2023 15:13:09 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Mon, 27 Nov 2023
 15:13:09 +0000
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
X-Inumbo-ID: 7ab8b3a8-8d37-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=heiwIfyIvH2xv+AEgXJTDtepUNNGPQ7MIYPxcZWa2CVmfYP/vl9A8N70RLuKRhiWsEFHYRkNCsCtRGFuaJZccfVqeXdUcTFXyRypDf58wX2f7HKH/xehBT0LfDk/gsCTdSyxFxF73FezPsO0FZg0UHdY0V8H/M6Gip7vYUfjq57UmDTAUeim+FIU495KSFHFkGWHjE8pYdFD1cBmJhqjA6Yo0N3SOxL7xHv+4QdnXRph5weP92gVnH1Qf7E3Yp9HdITeSGGT/DUe5Qw//e774qnR0JTR+0zLu3WLQcbiy+9YUnK1vJ+vyrYcJvt9nl4Y+q2H72yLEgDpee1tzX1OWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ru9w74zy+inVfA/LL1VJRcOLJEFKNSgHeUk4Q33v+w=;
 b=aA6MChh8EJlBP21L6+45XnuI9CXFEQXLLy5NUi5RJGjFWf9Uu9lql6bziwKS9bjYyezH+cq3UoR5MU5HMxQUMRXiccg2eMUQYY78M62WViTr2+faSS9jfDSKfm0v5YZsI3QhXA8RLFgLijxRAzOmVqKhAi3VcYI2+GKEd1ocO1/757fMZGT1YLUc/L/muBLEttQZoJBBlg0tbMoBRjaM2WgctRjWIo9wLJq5neQJK/nFuNh+jPgso0YDHFv9zyZZ9T4fB0HKWzC8pi5WfYegN2vNbv7/UyVXD1wh5+0elb8Bx/aKfc7k5T8fBcmQ+QBTvU5wetCpTiLkFbGq/gNMaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ru9w74zy+inVfA/LL1VJRcOLJEFKNSgHeUk4Q33v+w=;
 b=3HS5/9LkF3KWqj1uZnT5rybZvfVsI2BT5uhvhFvoFTpfji7k5R1yPn3fAgZtzCpPehI7/dHCFQdD0gR6j0YMXX8xM9W9paKUOQ6CF2pHUPEDnOfX1gSHJ5rtz0Z2oM5io6tVDOtvjppvlB4SvpXPDPyWzOBL9w7Hvh3IcCpCtlMGCjo8KdMCwEKWdlPUf7HCZ1mpX1JuWXwWKMBvgkEwQtYA0M+/EKo7EKBCe0/6OmTJQ4CZi+Z65spcoTrp/+ubC/bTzVicHSkfx61brc/iToHQDnydhhstRBhn7uCwcVUKIKk/OFNNo/W5geSZ6VOaR2dXkoeIjQL+BZcgPN3jug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a99681e4-e201-4abe-bf6a-fda61674074e@suse.com>
Date: Mon, 27 Nov 2023 16:13:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Clang-format configuration discussion - pt 2
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <Michal.Orzel@amd.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1B83FF45-E93B-47D7-AD21-615CFCFD0816@arm.com>
 <1e770335-9606-4e9a-9f96-d04834675426@suse.com>
 <3E69667A-BB66-427D-A907-FA1537CFA1CC@arm.com>
 <838395c3-41ba-4004-abf1-948b655a5ef2@suse.com>
 <B5AF6A9F-3986-4F3C-90F7-122D63A2B31A@arm.com>
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
In-Reply-To: <B5AF6A9F-3986-4F3C-90F7-122D63A2B31A@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VE1PR04MB7392:EE_
X-MS-Office365-Filtering-Correlation-Id: 588f0af5-2f81-413e-a6a3-08dbef5b5da0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EClRZfNKMr3FLGbVw+UlIJmFgGLj2pjugzbwlAszNy8y8X2efgenszl2olSa9YWcLRZJTyMIkugr3iBaicb+2nuv/wj7qpGY3KOET5vkfUZ4Ay95ageuLlAo+qq/01I0bspmrmgneHLarTtSNh1eulHJDxZRNnTbWD1RBz7q1xVFtTyhMG8F7F7YLLxEE7V9vHfiIksEhJf4CcDVmMkxldRO0MS0WdQZ3nAnx4IzzpPL0cGziF6TtSZUMYajoaZS5MQKEe4CeuiGNpbqB/QcUSxOOx5RMnVtfCVhL6oIBg5f61xvtfly6sHJ+9t6y7vKvgabmlEfQJVMVPqY7WJzE8cn3kPz5zmL/5QS+mp2GiAORTcu7LWl2VrTZDsOqU7a4BAIRAOh8LP+O24fcL8HxgP/Xeo2TZWJbYoAjkQlKpx5HMOCcqU2/OZo8KVNzECKysjLx48i5auhXP/HIr6hmMkX3A9HJj9/eeh05LNC1WTpB2dNGPs1BfmQZ6/ptWyUDqgYzIC8iXhLMrXzkCiPSzMt3S3LOV5F6SU4DRcKL8hH2h0AWhIdq2tBFSFw3602KaehlGpu5x7d20FT81ip5c6tdxv/FzfMkhdK9lsknwQWQRLakMxmGYTJ3B1bjlkUH0OE5gpjb2JebxfTI05Mbw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(396003)(366004)(346002)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(2616005)(26005)(6506007)(6512007)(53546011)(8676002)(8936002)(4326008)(6486002)(5660300002)(7416002)(31696002)(86362001)(966005)(478600001)(316002)(66946007)(66556008)(6916009)(54906003)(66476007)(38100700002)(83380400001)(31686004)(41300700001)(36756003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGEvbDk1aWhSMW1jMTlqaGhBaHRUalptK3R2eW1RR2p3QlJOUHVlUjc4OFFF?=
 =?utf-8?B?dFJwR0VLZFhXN2FrQ1E5VUR4bkt1RGhPZ3NUNGxBTjVKYUNzVU9SQ2s2K05K?=
 =?utf-8?B?OGN2KzZETjhGbDdjb0VnTmV6emxMVm1JVHZDZTlaYlRyQmZpL1oxSTJuMnVY?=
 =?utf-8?B?cDFBcnlVdEt0RFd4WW9BY252aEhwdWtQa2FBSWxtUFhjZ2taekhnUG1TblA0?=
 =?utf-8?B?blRiUW4zK3lLV28ySXdRaVRNVXlLQ3l0cmVBQ2s3aEt0V2N5REQ4SVlOc3BF?=
 =?utf-8?B?cDRnVU9DNmYvT0JoTWxHdXp6SnZGVWJJVDFFTURXNFBSZElsMDFKdG1kM3Rm?=
 =?utf-8?B?V3RmM01YakhMNTVOSTRQUzJua0VJVWdzN3VtbnhMeUZ3eFJjcmxuLzllN3Bi?=
 =?utf-8?B?WWhNaVNVbjJETnVaMjhHb3hUMk1VYjNyU2xVR2NXSnJmMllJTnZhTU5TbnIr?=
 =?utf-8?B?WlFmZGlKUTVXdUwrT0pKNDZxSDh6SjBLdWw2SDA3b3pTb1ZQWXNDTzcveGV1?=
 =?utf-8?B?V1poR3lwSCswZVEvMGcvODhYQWpDM1Z1MEpOa2MzbHhPQXowUExFbFZLdU1F?=
 =?utf-8?B?SGg0aFRVVzlwRjdEbUUxdTdpK1JqdjhvLzhoRHVzam9sTjdWZ0dMRUpDc3R6?=
 =?utf-8?B?TzlHTUpQWTlNYzBaaE1FYlJwazVpcFhqaDZBS3o3YlFwK2Ntdkhwam16TmNR?=
 =?utf-8?B?SU5xQUZJbElPQTJzaUROQlJXUnV0K0tqbTdqTlNzb2NGK2lJaGdVa3R6akRI?=
 =?utf-8?B?dXJ5MmZpeHR3NmJRbjdYWjBaV2tLTmFyOUpjeGlnaVF2ekd1T1lFd29IYUpV?=
 =?utf-8?B?Vzlybk1TQXRFU1FNWWZwemFvNGw0R0E4MmJZcGhhcWNhMStIeXVjY0ZYeVZl?=
 =?utf-8?B?VWxTdlZ2Nno2M1JTY1ZkQndrQjlVTDFlTVc4eklCdTg4cnA5aTVXaW1Ya3Ex?=
 =?utf-8?B?L0VFUzBBNDFXazVJVm1ySXdwalhpUTMrelorU1FhRUNETXRONUYybG5sKzgv?=
 =?utf-8?B?RmlPbmd4a25MV0N3Tm9tY01aZ3FzVFphYzZRV0VJVzJ3dU9FN3NRbXBDcURJ?=
 =?utf-8?B?SDQvbzBZc2xCUFgwOTBkV2VCRVdXaFQ5TXQ4N082eEF2aXJvd2lZNEJuOE14?=
 =?utf-8?B?Tk9JNE9CaVNtTWlHbTdtM0VTWldIeUkwbVR2RndPSzB0SWpQRllSL0liblB4?=
 =?utf-8?B?M2ZaV1dsdXVzMFEwMmFFSW1lU3c1SlhvVVhRMVZOMnVSeFRHcXh3Yk1OM29V?=
 =?utf-8?B?eDVFTFhXNFViYnZ6TDdna2tuOU8wbVBqNmdsNGtpZzJUeEEvajMxN1d2UkJ3?=
 =?utf-8?B?dGpMTEExTDU4YjdLRWN4Y0tQMW1HS2NpdnNnUjdialNWNnlLNE10TjNpSjhS?=
 =?utf-8?B?dHRjOC8xeHE4VUEwMXRwWEFZM3kxZlRzRTA1QkJ1eEtmTWo4NnNKUG9Sd3hK?=
 =?utf-8?B?UVRIODlUSWdqRjJMd3NSWVRjRXN4SEljeTQrdHJqR0x1N2FZYzRrWEJJcHpO?=
 =?utf-8?B?UWxxODZpbVdMTUVDaGtJQ3RFNloybTk3RzZoVzBnUnpMRW0wMHFvQnZsZ2Fj?=
 =?utf-8?B?TVNNTnc5dHVNTVBFTGJYdTBwN3FMMWplbGRKTmJOWnhQMEh2TS9oQWp0bm9S?=
 =?utf-8?B?Und2SUdyN2dDYkIranpMVVJtTEUrazVsUU9tOEdodlB0S0lUdEJnSGNJTjYy?=
 =?utf-8?B?ZkVQUW1vT2k5dWhxT3hJaHRicHN1dE5lMjR5b2lFYmpTMDR4UEVuU1RTVHIx?=
 =?utf-8?B?c2tWd3JHTEVUa2k2VWZsWDlyeW5PT0lla0RiZWEwYVN3R3c1S01uOEg4WE5Y?=
 =?utf-8?B?Slk5Wk5BdS9sQmVNZ202MXhPRUNDVUlmcUg4TmY5dmVNRjN6aHhZZDg2eXlh?=
 =?utf-8?B?VUxKSmllQkswdVlJQTBpZlZHU2xuSFBDSkgvRzB4eHNELzJUZFhCSjkrMDRr?=
 =?utf-8?B?OUo2Qm10M052Yk9ydTRlMG1GZ0NoU1lQTnFPWVJvbGl2NmNHWERSb1dtc1pl?=
 =?utf-8?B?dEIrcCswajFJYU5XbDJXTUtFTnRCWkdPdTVkRGtmbFcyN3pOWFJWQmhta1hZ?=
 =?utf-8?B?RjdaUEwxUkU5cTdadmEzcTBVOWhUTUlmYnJOY0dIVmNrUXMxcDg1K1IxbHp3?=
 =?utf-8?Q?lLUgBy3OpI98JXjd5Eq/xNkYd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 588f0af5-2f81-413e-a6a3-08dbef5b5da0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 15:13:09.6462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G2OOLUpfTgSkhBqor1zlPKvrHCl/MfvdkCmoFBVDI/Hz5qDapQSXTuZltGYpr2Z9FPiVxy+qAdH4Vtzher96xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7392

On 27.11.2023 15:58, Luca Fancellu wrote:
>> On 27 Nov 2023, at 12:20, Jan Beulich <jbeulich@suse.com> wrote:
>> On 24.11.2023 15:52, Luca Fancellu wrote:
>>>> On 24 Nov 2023, at 12:47, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 23.11.2023 15:47, Luca Fancellu wrote:
>>>>> Let’s continue the discussion about clang-format configuration, this is part 2, previous discussions are:
>>>>>
>>>>> - https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg00498.html
>>>>>
>>>>> You can find the serie introducing clang-format here:
>>>>> https://patchwork.kernel.org/project/xen-devel/cover/20231031132304.2573924-1-luca.fancellu@arm.com/
>>>>> and there is also a patch linked to my gitlab account where you can find the output for the hypervisor code.
>>>>>
>>>>> For a full list of configurables and to find the possible values for them, please refer to this page:
>>>>> https://clang.llvm.org/docs/ClangFormatStyleOptions.html
>>>>>
>>>>> --------------------------------------------------------------------------------------------------------------------------------------------------
>>>>>
>>>>> Our coding style doesn’t mention anything about alignment, shall we add a new section?
>>>>> I can send patches when we reach agreement on each of these rules.
>>>>>
>>>>>
>>>>> QualifierAlignment: Custom
>>>>> QualifierOrder: ['static', 'inline', 'const', 'volatile', 'type']
>>>>>
>>>>> ---
>>>>> For “QualifierAlignment” I chose Custom in order to apply in “QualifierOrder” an order for the
>>>>> qualifiers that match the current codebase, we could specify also “Leave” in order to keep
>>>>> them as they are.
>>>>
>>>> Where do attributes go in this sequence?
>>>
>>> I think function declaration/definition and variables.
>>
>> How does this relate to my question? I asked about the sequence of elements
>> listed for QualifierOrder:, where attributes don't appear at all right now.
> 
> Sorry, I misread your question, attributes are like invisible for the tool, they can be placed wherever between
> each of the QualifierOrder items.

Hoho, one thing where various options are tolerated.

>>>>> --------------------------------------------------------------------------------------------------------------------------------------------------
>>>>>
>>>>> AlignAfterOpenBracket: Align
>>>>>
>>>>> ---
>>>>> This one is to align function parameters that overflows the line length, I chose to align them
>>>>> to the open bracket to match the current codebase (hopefully)
>>>>>
>>>>> e.g.:
>>>>> someLongFunction(argument1,
>>>>>                               argument2);
>>>>
>>>> The above matches neither of the two generally permitted styles:
>>>>
>>>>   someLongFunction(argument1,
>>>>                    argument2);
>>>>
>>>>   someLongFunction(
>>>>       argument1,
>>>>       argument2);
>>>>
>>>> Then again from its name I would infer this isn't just about function
>>>> arguments?
>>>
>>> I think it applies to parameters and arguments of functions and macro, given the description in the docs.
>>>
>>> I see your two snippets above but I’ve always found at least on arm a predominance of
>>> the style above for functions, so arguments aligned after the opening bracket, for macros
>>> there is a mix.
>>
>> The latter "above" refers to which form exactly? The one you originally
>> spelled out, or the former of what my reply had?
> 
> In my reply I was referring to the one I originally spelled out.

But that's properly malformed, for not aligning argument2 with argument1.
Where are such constructs commonly used? I just took one example (cpuerrata.c)
and only found my first form of wrapping.

Jan

