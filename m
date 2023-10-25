Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C627E7D6DD8
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 15:59:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622916.970186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qveQ6-0000Rg-EM; Wed, 25 Oct 2023 13:59:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622916.970186; Wed, 25 Oct 2023 13:59:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qveQ6-0000Pf-Bg; Wed, 25 Oct 2023 13:59:38 +0000
Received: by outflank-mailman (input) for mailman id 622916;
 Wed, 25 Oct 2023 13:59:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e1rq=GH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qveQ4-0000PX-S6
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 13:59:36 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb06e5e0-733e-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 15:59:36 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9631.eurprd04.prod.outlook.com (2603:10a6:20b:476::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Wed, 25 Oct
 2023 13:59:33 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Wed, 25 Oct 2023
 13:59:33 +0000
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
X-Inumbo-ID: bb06e5e0-733e-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RKHlhEiWtMR6V2jqvGgvWVnCYVpucDNDMNp0bS1i/qX7gE0ApMwYTOU4KkTdpm8X3NIhofizu/zTfRx+YjpJ0KrxRgrLWrCWYOy0fljrYr8qX2HwtwNITIiPkFnVUp72ubiK9HOy1wsznKdCRGEfdG3hjHyY9B0YMm3MTbkiZqu3vR7bESTv/KXXItvHFLsGZ/KLKlikt7RoziggdXB28aah7rGBL9DItL00CXxWGlJ4fkFuY/+QwhTRSjPCTJot9JjYYoY5A2iKqb84xPA+/2apuL6Az+7cmxjqc76trGQIwctPR3/vp0a4GmGx6a5x0NoAXp0LIRW5isLdYv0GqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZJUxIbGiXB/O8MtGTmUAigWKMIU0D8qXzzMMFhtR1w=;
 b=HmJu1fVfolMt5IoV7ZmJRaUgcBIQpEdybnUc0ssct0qvLAwAaSMhx7V4cKpSG/zyoYbIFtfipFdLkDt6AoM/GG5zYsaBayxcohVo9mGHv6Uv+l0eChxzrN5gQnyHgaXGaODRqFknbhr+3ZXFvB+Mc6vFUlWCky8qHJ2WQm+7KJN3QgIeOpACAF/M92RpuIA/MYuiwfUu/QYLTKGajRngD6hscNIQDyIVNGbH62SR3n3UGc4lU5Kdhup3PEekk/qTjEMCgd49sLQSvJvx0izJE19Ba8UD3RmwxvKnSfmhJ4NGNwPe8BMTYYs9EpfzyIniiw+qeOAbyHvnowOVBJwmHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZJUxIbGiXB/O8MtGTmUAigWKMIU0D8qXzzMMFhtR1w=;
 b=uuGO8IP0CtzD1DC7clPINcf0wm+ToDobRWCybkWsM4Hk3DTKi/qA8FKFWZVm2WZqD/dNCF/6x+DrUKaUmxoV9J9Y8Uv8bDwLQf39OlE6igRJRAgaO4TLUQ+rfFJ+u3XDKVarfg836VzSCRP9yoZO1J46BY+Hc+DttMjXCYTzlOCvAHTaub9McyJA2szkXalFNgzucXWyLU4DxT1lEqWcSi0sQEUEzWCx6yrnU2fI2kQTC/euT7BHmT+81kX1vCLrtwfCmOqDO4BvJNN2H5hVZ7N2XRbw1RCk91Q8ybxKeZiUehMV9F6F7eaIgqFoF/GE8NeVhdNGgtp3wY6NGaMdyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d36578da-aa45-32c9-d007-840352d1294c@suse.com>
Date: Wed, 25 Oct 2023 15:59:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/7] x86: don't allow Dom0 access to port CF9
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <95129c04-f37c-9e26-e65d-786a1db2f003@suse.com>
 <74c9e6a8-9094-4646-d06f-cfe0a427bb37@suse.com> <ZTkLyGE5ulk1NSpf@macbook>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZTkLyGE5ulk1NSpf@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9631:EE_
X-MS-Office365-Filtering-Correlation-Id: 24a1517f-a27b-4c7c-ae5b-08dbd5629de6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kCDhU6wUgEyriN6lZRJdSymJ0PBAE8pTpatT6+fTQPyAmKWnV8Dg2iLQJF8vgctyRt8BwM8B1eaELHPnMa3e0hJzhNQoEsQRFvw+242+B2Q0IdKEVjDwufys5BAk9GP2IH9P/+E0k23vYOOtJqZpl7uVU4lpIE7ztsU/QmmCe9FW2eL0nYvYoKqmua3vnThoCTyrkZ8nt8m6oJuX0TDXe0oA8ZrP5rC/r96WG06mNDiVnRmwq+5/1OWEEaMRGpbhrKWP283tbYVjVCBJ99nyFEMmNck1a3khy5jbWHAPV5b9pU9AHaXlEV0kd7r4zd6/pZZVCL56UY9WJkt63icqqqzOWDI3EVLsoM9SHC4BhyJmOCG9PN7beAS5Fdb4aE79DYFz9TO/xMVf1WPLkrev7KdCpG+vcse6usYpszXuzpfiHJGTW2Bj0aQAB/yaDg5vP+AkLKq6kzrVz9APdgQ+kZrckQjMNRsG0Lze+jWn+Oh24fJQAsf1vQTIPGnsMiLaxkpbPqK1TZRheZN/MDwoaHCpyfsntq2ZScB2S7E3QJUdEzExNuCKIMVT06gXmkEc4OKGjSDYmV4RB8SNp1UNq0GpDRM7Pq0pThZpSV/NZCG8M6JRQzFfYuCinxNh8lhVjSE8rFMnan/M2ZpjQ+cK1Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(376002)(136003)(366004)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(53546011)(83380400001)(6512007)(478600001)(6506007)(6486002)(86362001)(26005)(41300700001)(54906003)(316002)(66556008)(4744005)(6916009)(2906002)(8936002)(66946007)(8676002)(66476007)(4326008)(5660300002)(38100700002)(36756003)(31696002)(2616005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVVHUzArWjJuRDg4UGpJd0lrQTFRNkdtZGZrY204dmdWaE1hZTVIbmh3RTRX?=
 =?utf-8?B?RW0zNURrbjAya1ZoME9PQm5wQmNNZHFGbVd3a3dTSHl1ZmFlbGxOR3dPbXpp?=
 =?utf-8?B?WkVPenkyRkZIVnRUUndJdlpTWUxOTmllVmRjYmh3NndYUC92SkFYYjQ0SFhr?=
 =?utf-8?B?dUJFdmtHNHdaTDllNWJUR2xyS1FOeGl5a3orQWRoaCtMckN4QkdDNVpidkhV?=
 =?utf-8?B?UDZjakFwdDBOMm1JUlFJNUlpT2prTEFGMHJCcFRVYXd0VStucTRQc3NkNXdp?=
 =?utf-8?B?aVVlS1RqU0dKaHVZRnpaRUFXWndwaTBVMVljTXNDb2F0bldhSmRSbmdEcDhj?=
 =?utf-8?B?cTNYdDJINmxtajBoSnQ3OFljalJUNjFuUE02am1ybkZSM2c0MmVFR3ZsWkxx?=
 =?utf-8?B?bElDN0pMV3NqMm1nRjUydG1sanA2c2dHQk9zK0VQMTQrNHE5THRvSVlUc09k?=
 =?utf-8?B?V0twem5SSDdPTXFrczBERGQxNlJNMW4xRTVPQWZHS2VXeisySVloeUNQYXJo?=
 =?utf-8?B?UCszR0FXQlFmTXNDRlRJOE41Q2hOUmlBZ0hPeW8xWXIzVVFyWFM3b25iMnBH?=
 =?utf-8?B?aTdETkxKTkFPVkVNNkpGSU9NTTZhM3lGSGZmTVVKa3FlUy8rTFhuM3hpZnlo?=
 =?utf-8?B?bXR0WC9FSDBHNVRyNVZZZDRVSmtmb3pOT2pqVzA4dXVpblBCNGFCa2FXTnBs?=
 =?utf-8?B?SGhPNktUSFFxbEVHcnFBYXZzc2lCZnE1cSthWWVvWEQ0bXliWWNBbHF3clVy?=
 =?utf-8?B?eTljOVo4Z0VVWmxxbzdQb3lYLzJvTTJ6NmRMQm94eG9ub2xMa0R6WEdBNkpq?=
 =?utf-8?B?ekNCNHcyOFZ6Q1k4UVJ0Qkpna292a2RkTFZaRkRKUVVkcGozalk2c0tSdXRY?=
 =?utf-8?B?bitvdE9TdkxJeU9VNUhEV2U5UkRnbEtEM2RZckF6VzZNNy9vMnhjYk90SnlQ?=
 =?utf-8?B?WGdZUEppRElDWlBpdGVuck1WZDhrZEo5SVhyWjFFNlptU0JWeVF3OCtqblh3?=
 =?utf-8?B?UHpnVEpjalRiWjhNY1REbTRLSmVUcDJ2WGFRVENlRkFyTTdDUXF4RTQwQlI2?=
 =?utf-8?B?U2RjRzZ4b3Zic2FmSkROSUdMZmZjYUFibWwrQTF5eTlBQktkc1Z0N3NPOVNM?=
 =?utf-8?B?ZTZyTy9zWk1oaGFrWU8wSndFOFhNQkEzUnRNZ2RsVlpiMmwzRjhwSGZEWVRO?=
 =?utf-8?B?T2pLRXNSM2s1Q25lUDhIazN4WFErS1R6cHVLSW5sMis0RCtxOXNNeUxhMUNk?=
 =?utf-8?B?R0ptbm1teUs2UTRycitYZFpmR2ZtQzk3dVNiZFVReDBYZUZBRWxQV3JGbDlO?=
 =?utf-8?B?MkZzWXkyamQwMEZqVzBuMmZrdVY4YU11ZHJsYW5kbkNGUjA5TTFzaytxUlhx?=
 =?utf-8?B?aUEwVGhXYVdOaW9McjFCNFU1Mk43U1NxSEczSmtYNG1oK0tvdzZ2NEs1bGlr?=
 =?utf-8?B?K1VpUGEyRGdGR2VPM0trakJqZ01FTjYrUVpmTzJtWW5Rdkw1bUIyVmxJdWx2?=
 =?utf-8?B?bDRwaVlISnZSR0lVQURaaFBOZm5VT1VpOXBNR09xU1lyRVMxUVBEajVIMVVC?=
 =?utf-8?B?K0xIazJNa3YwUDJUNU5BNUZKYUVDdE9lVXg3TnB2ME9WbmVyb2oxSCtkRk5r?=
 =?utf-8?B?K1dJZ012VjVjT1ltWG11ZSt1Yk1aUktkMTRKNitwWk41ZUc4YithOENNSWhN?=
 =?utf-8?B?Z205cGsrNHBUS0tZWStBODZ4emlwRDJUa1lnZjFtN0JkT09mQjU4anA2OVk5?=
 =?utf-8?B?eENrUE0vTUMrZE8yRWhuaTNjZ2tjVTl4bjcxN04wSjB2T3c3SHREK0I1ay9x?=
 =?utf-8?B?UWlsOFQyajNSb3p5K2NScWZOU3pIRittYk96dVVvRjgwQys0WmpZQzAveTBp?=
 =?utf-8?B?MnpGcHl2QjErdUZWVjJ1SjV6eXNWaXBwTUV0ZnVmazVRclhsUXdSa1Qwdjln?=
 =?utf-8?B?enExVExJNmV2TWVmTGhXZ0pSOGpuM1JZMzV1amdwcmdFRTYxRnJJYldFV0Nw?=
 =?utf-8?B?QVYxdHphVG44ak0vUHZUbXBES05pYzlEcCs4TG1oN2xHbmZqZUg2cVVSZ2xn?=
 =?utf-8?B?N1diUzVEdG11NXZwdWpST2Q3SjhRWjNtQ2t5WkNFL2ZUTFZTZW5JbGtlVmgw?=
 =?utf-8?Q?HjurTV7wos30dPAUaYJlUQEEM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24a1517f-a27b-4c7c-ae5b-08dbd5629de6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 13:59:33.7154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lJOKqvPT/5sI+/bnJrmlsfuPZkvgYU6yXdzxzxBAsI9Sv+vxl8R4syhvFBBfFsd+5Asvsm5PoabyVdNvOG/LSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9631

On 25.10.2023 14:36, Roger Pau Monné wrote:
> On Thu, May 11, 2023 at 02:05:11PM +0200, Jan Beulich wrote:
>> This allows to initiate machine reset, which we don't want to permit
>> Dom0 to invoke that way.
>>
>> While there insert blank lines and convert the sibling PCI config space
>> port numbers to upper case, matching style earlier in the function.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> Should we also do something about port 0x64?

That would be more involved, as its reset (and A20) functionality is
only a small subset of what it is used for. IOW we'd have to intercept
accesses and pass through the majority of the operations.

Jan

