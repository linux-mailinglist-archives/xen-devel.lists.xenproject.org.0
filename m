Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A9E64C630
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 10:43:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461934.720101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5OIS-0006kN-EN; Wed, 14 Dec 2022 09:43:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461934.720101; Wed, 14 Dec 2022 09:43:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5OIS-0006gZ-BT; Wed, 14 Dec 2022 09:43:28 +0000
Received: by outflank-mailman (input) for mailman id 461934;
 Wed, 14 Dec 2022 09:43:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dEbZ=4M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p5OIQ-0006gT-Vi
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 09:43:26 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2071.outbound.protection.outlook.com [40.107.15.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1a8938b-7b93-11ed-91b6-6bf2151ebd3b;
 Wed, 14 Dec 2022 10:43:26 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8991.eurprd04.prod.outlook.com (2603:10a6:102:20e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Wed, 14 Dec
 2022 09:43:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 09:43:23 +0000
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
X-Inumbo-ID: c1a8938b-7b93-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HCDGt13o/tY7l7TmOp88kcEKAHXO8ghSaYK7xr4Qrqz9SNT2ZjhLXLbAEvEMQXFVc3NoHtBw3mZMMi2BB6NnMov0ov/uQ7PTBMKzAY16YviJN5iGEfESQw2/sUHTS+3Ym+ArPLByVd1cG8XdO1TVBANEZ6IVcD6q0orG19KVHC1OWujRoN21Kw3jzSttg4EMADzpl7x7nYPjrrWgeUs4zn25o3SpnQCA3G8yB1+9p5x+O95gW0b7rM6PYVmUU03v+K5VBSQ7SQIx+UINF500UAtxqiqSebIp10fSsUBkFU3IoRHIHfN9JZ7D6IRnFIOP7RXIPws7MUCDphUqmJ0Z4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gYGDK2bdy8MGV58xl3EAdl3TsLTNCNSxhEe74Ekk9nY=;
 b=b5ks5edxZVgQu3ugqUH5i1yGAIkC3LxOKfxObkAS/ZQ3pttT4XuxL+J++3z6HASd8pOCJFP3q2u73dJy1+hPm6ieqJaimXzKbGNhtNLi757Ah0NrgurOwYKPBzPW3RheR/nYHt7sEbBFec/vBWs3lVwQrAQO8ewpFXEc1dddxzUWVeLuCPEqsGixPs9PQeVcHRr+Sl3UAQXY6sJJ7k6ohMC3f+IN8lkDxxCYbbJUruNA/xOTQyw+A6Zcy5Vhc2BY8k1xSwb7Fr8Wmlc+D9jCaBqDl4RC187sj7f8iyTNQ5Jx5YnyHWkbcGL1Fs7AffiAxxU0PmbBc9V0U7pSYOewMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gYGDK2bdy8MGV58xl3EAdl3TsLTNCNSxhEe74Ekk9nY=;
 b=qzT8vU1EwC3QgZ+tByGD8BJyEvkCEnrYfB9a+Llkz9eXFwpqrWLQyXjRILdodqm2l1eVKcxwLLn++MtCO2KcVicU3WQCSZS+Mim3qtjPdMCTBjEpb4o+mmCDHOXTFZwZokt9St5f1uKUH0u9KBP3yNuuFGoQMtcMlVZQ55SO+ZDY58s+eEGG/aykagMQmm6VStjqqNoSxcotrlNZQmKQaSvnm/NMzubyHZ12tD9/db+WJIqI3CpV84YSktuEDitym4d/eaN6tnY3uuvFBOoUV62vo0cfZ8/yrjqXXAQpZSJ/+lPWn/FEs5YFIkMKJp2bQ284VNW/Ho2k16vJNvDTkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4cb91eb8-f44d-f517-a0c9-b7aad5493324@suse.com>
Date: Wed, 14 Dec 2022 10:43:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 01/14] x86/mm: Avoid hard-coding PAT in
 get_page_from_l1e()
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1670947711.git.demi@invisiblethingslab.com>
 <71482430c20a701b1d577e87dc72e7c2661e69de.1670948141.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <71482430c20a701b1d577e87dc72e7c2661e69de.1670948141.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0185.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8991:EE_
X-MS-Office365-Filtering-Correlation-Id: 520ff578-d7d0-4772-aab2-08daddb7a471
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AafLgAgk1KER2I4Qe+hBS5tkquHu55wySmzBYFCKCfkzqMVGF5pS/mDNITYxBdkrFrjELd0FHhyLsoRoMwFKTochwucnkDoWk6epa34mWI0VuzJXto47AUBTBqhZk85NkIE0FGzKQWbxdlI57cABZWi0Sp1ePhu/vtjsE1GGmnPNEbQ81J9Adh9llCtWqAZdL5+LVqlmaceksvwT3rPKl6WhDG5MArVBSIaEMlGIfO1mdUL2KCd7G3+/1LR3mf+vpXNAXsRxOjwlvmuTEk/HM+771n+U2rLjcr09KjvZMSsjpyevFShGQs5l0l1gbMkJr8vcGG20MB9r2rr4pkje/yqYcLoJxUTl9g+1qmiL9FyXRBm3LyYc2SuVdm1se/zAzHo+yjzyo8l4xiSx2y9CfuEsj0NnLlNdK7fS1GdmdUst8YqtI9d3eFkiaoNkT6/T3tatqbcjSaBfvS0Eeg/HqiUXCCjQgYYAwUCttd2D/5Mfjc0rgi1NyichfKNMdPIVRhDJZJ1t3uiXHGLiOdHL/n3sH6iBYhKq5HAU2+5PPsY35uLUWDhTC/cCxzRZN6bUpkQqQ68Y1U3x4oaUWrnAhHIAvPcodJKdHVFlnwG33BeVi5UhGpHUjqMmLm+SjZR3My5El4idfYjj86ZB2w2AwiySD2YOYY6PgAcGUZoDvz/mywzb4oMf4v1xkQl5/fbPpVc3HM2Waw2a8xegVm3QKPhrpONLT+PCc74ateX91GU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(396003)(376002)(366004)(39860400002)(451199015)(6506007)(53546011)(31686004)(2906002)(4326008)(2616005)(7416002)(558084003)(41300700001)(5660300002)(86362001)(36756003)(8936002)(31696002)(66946007)(8676002)(66556008)(66476007)(186003)(26005)(6512007)(316002)(54906003)(6916009)(38100700002)(478600001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzBpRTZWTE5vYm8wT25QQlROY3A3UTFXdTh1emMzT09zTitPM0ZTYTdMd2xH?=
 =?utf-8?B?bzYwZ3hjUnZRdFJPUFBoSExyZGRnYVBITGxENlZDL3p6dWlpUzkybWY3bXg0?=
 =?utf-8?B?bUdFU2srbzhuRytLMG9PRmI2UzJiUnFjSnRRODJOakJvY1M0WVMyVTIxRE84?=
 =?utf-8?B?WDI3alJ6Q0RqQ3QyckpUeEJLVmJvRVNlbnJzZmVKUDg2K1JkanJreWxHY1NO?=
 =?utf-8?B?ZjFFb3lscFl1SWgvOGMvdm4rcUZnd3BWTXNTdTl2b3VHcEI5YjhrTisxZHNk?=
 =?utf-8?B?WG5ZYnhnQm9KbEtGMjY0U0t5UGlIUFFUMEEzMll0cy9QM2pDUFpIcUVudWlH?=
 =?utf-8?B?cVRHQVB3dE1ia3dIdUZZQVZsQW94R0dHUjlWMmszdkwwWC9mU2RrVHVDcFJM?=
 =?utf-8?B?YjliVEsyOWJFRnRzR2ErdVdTai9GV045RDRQYUNPQVZYZXo4VUpqZXFSd3JY?=
 =?utf-8?B?K0NOUWF3bmtoekE4RWYwMjh2UFlBQkVCYWs0M2dQbFh3eTRFTDdsYjZWZngx?=
 =?utf-8?B?OWZXZjdrLzJwY1lvUG91ZndIWXh2MTF3VklET29VbVZpaHM2aW9HV3V5TEVT?=
 =?utf-8?B?T0RyMVVoMkRiTm1FYjN5bXo1d0pFcGhCaGdqbmN0NFI3eDY5MytyVUIyTTVu?=
 =?utf-8?B?VkFrRDN3Z1IrS2tTa1JFYWtWNzJkcHF3UUg2a2pLTVNsa25jUXpEQlFtaDkz?=
 =?utf-8?B?Y1c3ZnZQdnVRYVVCL1ByUHZjcENjeFBBaktNQSs0OTdqcGZPOWdoaDFkemxX?=
 =?utf-8?B?U3lwTUhIbjRaNm5OTVpGeGo5OE5UOVE0NXZhRkZpdEpVVnBEaXhHQVJzNFBn?=
 =?utf-8?B?SzA1bU5lejFlbzhtSU4rT0tKTDQwQ0c3MlVaTGtYeFhVQWxXb0grZ29lN0x4?=
 =?utf-8?B?MHArQVQxQjlxUXk4dVBJWVY4WWhFKytpU3FHdGlhWXhPK01qSGg5RFVZR3RZ?=
 =?utf-8?B?dXd0WXBsaEVrOSttM29WaU4yUDlKWlVBRzJ5cWpobGtWSG5ZVlpaQWtsUEFt?=
 =?utf-8?B?Y2NsL2s5Z0llZUxRc2pTY2JRa3JjOXRpK0E0TmF6eFVvMXdXL29mQ1I0Nmt2?=
 =?utf-8?B?NDFQNmtVNFdUZ2owSDB4MTZIVEcrNWIvVFh6THBTaEZlQm83TXN1NzgwVndx?=
 =?utf-8?B?ZlJBRng5SlBKUzdWMjlXWFFST2Q4ZGJ6djFDWGpjdkNmQytJbnBsZHZmWmdQ?=
 =?utf-8?B?STBCZENRZFN5d1RIVjVUbE5XbWdBc2kwWEo2OUdRcWZ3eW1ZRzl6TTNUdTlq?=
 =?utf-8?B?cTJyRFdnak5idnMzcHo0OEJwOUZpQ01RRWo4a0hKNWhMQ1ZpdE5qek55OW1k?=
 =?utf-8?B?MDVQNlpabkJidHpCWmRwWHdxTU5TZkRqZlMydkNQdVNNaWd3ZHJOSmtvVmRO?=
 =?utf-8?B?QW9RSnVhQ291YWVuZitEby92aVdJL1NpSDg1NkZteEF0TW9jVjJ1aHBtMXEw?=
 =?utf-8?B?cGludTR0U05McGxDd051Z2NDZWlYQkVyWm5FSHlSMUpnUWQwc3ROYW9GMkVW?=
 =?utf-8?B?Qk5GSEdUd0J1OE5BNG90L3hHRTVDd002eVZBOGREQnVJeWZkejc3R1B3Sk9s?=
 =?utf-8?B?eXRGK0RUcWNtNTBGMDgrZkZER0xJa1hUdWh4REZaWUFNU3hxVHlzYllsamVC?=
 =?utf-8?B?NVlFWHF1YnY5eGVYcXdXTGFLT09yVEdzcTAxcEdRQnhUU2cvc1c4a0dXbUlh?=
 =?utf-8?B?Tzh2b3UycW5SSUZCTHlpYW5WQXlQaldGZS9lQWMzcGhmbFozczNNNm03NGh1?=
 =?utf-8?B?bmRGR2pZMjAzV0x5UjZpYld0eEt0c0I1amhBWHFyS2dpT1VaR2RzUytOMTU3?=
 =?utf-8?B?K2lZYUJtVHU3MnJWZTFpS0VqRHBsSzFHWkRVMEJSR2VCUGpYdjJPN2ZhZ01Z?=
 =?utf-8?B?eHd6RU9KREhtL2tVc04wcVI1RC83NWk4VjRWdG1BWE5QUGxPOTZoQStjMy9Q?=
 =?utf-8?B?Y1RLUHR2NzliQnhoa1pnNXp5L0x3SWl3dVl5R2dKWmlPU29GZG5yYVZqS2hK?=
 =?utf-8?B?Rm1NNW5mdGxuYlczcE5NRG9LTzhEQVdkMlRVbU1rbG5qY010MEhjaVFVdXM2?=
 =?utf-8?B?c3YwdlBZalhTdDFnNWpnWWZVNVR5YnpjS2d3aWI4RlZ1ZXVZd3p5b3hDbGdB?=
 =?utf-8?Q?H/rDV/4Vy8AUKmAsgSpRNS3RW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 520ff578-d7d0-4772-aab2-08daddb7a471
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 09:43:23.5731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E7LfkitQf7ylZwfG2hIir77Rdn6WridhqO7gA9d8XAR2yLpTtq9QmPPVFMlwejOCX4RoC2r7ChqjcMPbe7Dc5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8991

On 13.12.2022 23:26, Demi Marie Obenour wrote:
> Also force the unused entries to UC and add a comment.
> 
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>

See my v1 comment as to what further needs saying / justifying.

Jan

