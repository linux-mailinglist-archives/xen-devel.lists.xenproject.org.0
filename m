Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4907162846C
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 16:54:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443415.697964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oubm5-0004qX-6U; Mon, 14 Nov 2022 15:53:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443415.697964; Mon, 14 Nov 2022 15:53:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oubm5-0004oh-3G; Mon, 14 Nov 2022 15:53:29 +0000
Received: by outflank-mailman (input) for mailman id 443415;
 Mon, 14 Nov 2022 15:53:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l1QY=3O=suse.com=jfehlig@srs-se1.protection.inumbo.net>)
 id 1oubm3-0004ob-9r
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 15:53:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78f7c7db-6434-11ed-91b6-6bf2151ebd3b;
 Mon, 14 Nov 2022 16:53:25 +0100 (CET)
Received: from AM0PR04MB4899.eurprd04.prod.outlook.com (2603:10a6:208:c5::16)
 by PAXPR04MB8238.eurprd04.prod.outlook.com (2603:10a6:102:1bc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.16; Mon, 14 Nov
 2022 15:53:23 +0000
Received: from AM0PR04MB4899.eurprd04.prod.outlook.com
 ([fe80::3342:8b15:bc9b:3d47]) by AM0PR04MB4899.eurprd04.prod.outlook.com
 ([fe80::3342:8b15:bc9b:3d47%7]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 15:53:23 +0000
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
X-Inumbo-ID: 78f7c7db-6434-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q6TEHFbJzBod3q8943dNCoY7HinDI2SCtjIZKU1dxwf7I0NQFHguhZ8nFdD5K2um9lwXOOIOhJ0Kl+RXpAIGVDV8WE2gZgNy/0B6L+vR15OG2LWC3WHKChxTldKXIVkc/TLZk9ILg1PazvJ64sS4D+gkFwm7lClbc+a7vaA4QukHEqgh1res9I6RCTuiHFwH2tRHyqPDLX9x9TrTN2ASgSo8S3o1ZcPslYAlUr1HaiI5uE1z1mo+hJ6/rWdwQP7HlnOFA3DjYgm+Ie0Wdi9BKwK2azOk9UtR+bcbrgFBZBpuhHj3Y/cH788U6/gDQ9soikvolzcAhhoGus+gBSdoHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G5xEF9WofVQd1cS4v3OPFN8SNzwMy+Tm4AXP1Fjabsw=;
 b=EDsOdaxgsPLzJ99h0YSLIH58tSPcvjtRqSBOCX8oP0TMv/1H+ypRnPbKXh+du2ZXKOfmNq2gCvtdJaefPZeOH3IlSfoblPLxLLUWncCw0WV6WNJVuWwXtIwqKQ7rBdJTLqznzmX4yPrxCpx5R0MHDwsHwuncDDAfDm7EuxZcmXdEEfSuGB9Fj80IfD8G+gTDc33MMl63bVlEGmYrP6slBFfomHArVJ4y97H1UfOHHpLQnEfPep8B0elTM2AJOEK/ojECu179B5ilmo1O7vC9DTLWjW0N4D9VffxeQ8CpnAllbJiUTu7DJQfOOCVLiReUz0UHz1PE02PcMOg8WevlEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G5xEF9WofVQd1cS4v3OPFN8SNzwMy+Tm4AXP1Fjabsw=;
 b=JoQIYENObUyUPzFCxxG7eaSt4rywovl9rxcZ63fI/MZTtqYoUu6bG+PjzpdEuGpGO1W/97540B09hvK8nFxvptKY5l4s+TkdzLjlrZjVqJJTfRCQUVBRO2HQ5d3dIfAalDfRuH/oNnk+OvHEqTX6HWZMC9HQlYMx3mqXa1NuL8WsTVVrqGMvqeV+ZYMbvV+cXng6sAiUCU4Cnfb3ugEwCTBkUF6xvmaIEQPYuZfNvsvxpul87X973socsZETCtDgBZQ1LtWBBNbOl0io1tfca+drd89D4jywjmTZQuvNyXmzgGeApKs/cnbpdzRe2wQSxPyd5akhCAOjT04FzYPLKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fb2f034c-9e65-ea64-6e54-71301497b37a@suse.com>
Date: Mon, 14 Nov 2022 08:53:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: vnuma_nodes missing pnode 0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Henry Wang <Henry.Wang@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <2046b5fb-2533-02fe-69e8-f46174cf825d@suse.com>
 <AS8PR08MB799119CD58863C6D1D309E9092059@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <AS8PR08MB799186D9559BB2A066D3349092059@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <d3697867-7df2-0a1e-2485-18957b3b94a2@suse.com>
From: Jim Fehlig <jfehlig@suse.com>
In-Reply-To: <d3697867-7df2-0a1e-2485-18957b3b94a2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::12) To AM0PR04MB4899.eurprd04.prod.outlook.com
 (2603:10a6:208:c5::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB4899:EE_|PAXPR04MB8238:EE_
X-MS-Office365-Filtering-Correlation-Id: c8bc7a8e-77b9-4f09-7420-08dac6585bdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wLTT5tplE2Upfs3gm2N9I3zfMycrFpXFPcR8XngMaQb03DcmSDoDvW/9Zqx1n4prj/EWLhK10GJ6gNVBIsWKapgxdzsE7S7pyb9r2KsI3aYkvYZZ2Njir42Jp5i62jWpmXpTzpe//ccuifqHnvuJGsO0Nnwq/YvKywuTJaLV8yu3Zi+oNtv91cHAW7PQkN6hHGtiLIJiv3soVK46DAx2SdPCcrRnnSbe5plC67Lg/SssS2zFPy50R0NDbEk2MGnmHPZ5PB81vURBZu0sd+2m6DFPUGidCC1jmVBQnXnPJkjf568UBYkPGq3c5BFaSsO6vyIcAVcY4fQAcum4n26DoOqhzasGkvr0yCZH81/mEXmiJ7SkWPKwJnwz4Js/cSl+GqwfTCfXGoOYuEhL9hOFMaGiU7w2cbC1wVs6khfJMHeRFr7YUNOSoaF2fvfQ3y4EYYHdjT0OalBTjam801RiB4z4/f2KFuiijMSkQD+bWiyjPX0kkQd6O5VrwUxSAVBHiE6PHju6G0TGdnOj2QxUHPFDYRY6mBPg7Viq9VlZbzxwxKAdrcSXZWRT+mFEXalxyHa48imcYM6onsXyi4vz79WEj7G1+2P+352djln20nVC0ffhfTdq24+wmmlRaDHSekvp/hs25dOR4qA7/gqZG8pZRlzS8EeoXM2S9Q8QHaJx/t88lSas9k5JReds8CdsgBWWKy2wrcUr9/Ts3oj6GNM5DjHrHgbRmIJXvxPPg1bgLjWrqjc3+bdlJh2Gz0H0VdnSFKjNe2tKuBGMWWZP1VWH4qYbDT4i0O0D+qcWbBY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB4899.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(396003)(136003)(376002)(366004)(451199015)(54906003)(66556008)(86362001)(31696002)(316002)(4326008)(7116003)(8676002)(8936002)(41300700001)(36756003)(5660300002)(66476007)(66946007)(2616005)(38100700002)(186003)(83380400001)(478600001)(6486002)(6512007)(6506007)(53546011)(6666004)(110136005)(26005)(2906002)(31686004)(66899015)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXJ6eFk5OHhwSnFOclE0SVgxL1lLdlduM1M3ZlpESE1uVERvWCtZVlJnN0tJ?=
 =?utf-8?B?S2pSVVF2UFJ5c3J5VVBocmNCYnlST1BUeFRlWjg1ZktTQnB6aWxMSVkzOEt4?=
 =?utf-8?B?NUloMjNJRXhjTStzeFJUczVFaWNXMWpHaE5qTFFNNnYwVE8xRlVRdFRLUm5E?=
 =?utf-8?B?VmR5dkNRK2kyeUNycWUxL01MYWN0OFR4b3VGWUxuSlZ3YXV4b0NGd213QjlK?=
 =?utf-8?B?a0ZjTUlJQ1QvOFovbzBjMjFneXEvYmpSczN5SE4xR3VIT0hnT0paWFYvMUFn?=
 =?utf-8?B?S0Zsc2ttc2lxOVlFTVFBcE5zemlEc0ZocENpbDJOYnpzRFZZMWNiOG5WeDBV?=
 =?utf-8?B?cXlhTDZvOVNtRXVBeDZsdzlDWU1xYndFMGpjMnpwYSsvMXN5em45YU9qSFhv?=
 =?utf-8?B?elBEYldQY3o2bHRmQXNab3prY1kwNk93NDVkcTR2Q2N0M3FYdlNKY09SNk8r?=
 =?utf-8?B?VmhVcjR3bEczZm40RmhrU3pYN1dGc3Y0MWxmWTBldWZtakl6alpWbkd3ZDlh?=
 =?utf-8?B?YkpUeFNGUDh3Q3FOaVgzaWU4MXhUeVJvaHI1WVk5R2NlZHl3RTFtczNkbGxt?=
 =?utf-8?B?ZmpJb3EvV0VLR0lRTDBCYmJNYXVVRW8yN0F6RlFnVUlZR3RoNHJleDIrdVBJ?=
 =?utf-8?B?OWlabllud3d6MVM2ZjRuaDZaeU9EeWVLU2U1NHZpQ3JVc3Y2MHJLTEZnSXZ1?=
 =?utf-8?B?QlFCUGhWM0t0NmxlQTNOM3dOLzFHcnY1SERPaFFkTGVnQVJpdmFrWml5bFNG?=
 =?utf-8?B?aGgxaVViOXF0YzZjZTdzS1RFakRsVVpIamNJQ0xDajdlbjY3MjZ6YU1WM3BC?=
 =?utf-8?B?NjVRaThSMXlpUFVKdmlZMUFKNWR5R2c5OVAydFVnRjFRRWEvWGdzdDJCMmtt?=
 =?utf-8?B?TE1Ubk1ydzJKWjN0eE4xQWVmcGw4QXM0TkpDMnZZczRYVFpqSmZnblo3dmNv?=
 =?utf-8?B?NTMwWTNMalVsamcyTVRNTjlxd2Q0MFRwY0swZ3RWZ1pKRXozcEhBaEpuNzVH?=
 =?utf-8?B?Z0VUcjFGeUZKdzhHT3J2R3hkeGZzN2orVG96d0JqbDFTMHVEN1RXQ0VhWVVx?=
 =?utf-8?B?ZFozOG9UbkI5eGw0K2xKWUg1eHpLY2MvYXFlVDkvUFlwc1JhWDhoZGRva2hv?=
 =?utf-8?B?YWJnV2NSV2VDakRjeWtIcE5zaVl1bWdLSnUveDQ1T000UUpQRFEvaXRYbGRS?=
 =?utf-8?B?ZmVmR0VUTUdRY1VHUzkrdmNpdFU4amNGUG9SbDRNVi8vVzhGRjhNZFh3NTlm?=
 =?utf-8?B?WWRyOHpuUERJL0wza1ZTbGppYWVBNUVFUkJUeXZPbU1yb2JyUVhnMmF2a2JZ?=
 =?utf-8?B?djJVdGJ1SnlFTm5jUUFEYTFRZmNuNmlRYlNwZk9nS3VtQTlYNm4vTUlabE5h?=
 =?utf-8?B?QjZrb3p4VnFLTXBWbUtYUlZVL1U4ZkMwbDcvRGRvVVVYa29HVm5Ea3g2aFVL?=
 =?utf-8?B?ZG9NWnNFdzc2dThVZkNVQ0JLQXYwSFlvRCt6VnpZU1FDa3JlNVlTengwaDhj?=
 =?utf-8?B?MFV4eVZMZ1BySVJtSTFaWVJEc1dwK3RTZkYzZkZGVk12WkkvblpJRXhJR0J2?=
 =?utf-8?B?KzQ0bXN2MnFtRWpVU2k1eUNMa2VxcDFRK1NrRjlyZEtZTVhUakdwY3M5WGpV?=
 =?utf-8?B?OW9halNCU3FWTnpiSnRvb2pPVkF2TVZ6UmxoWlpKRVlIVmZSODcyODRIano0?=
 =?utf-8?B?SG9qc0tUcEVnc0tWNUxvTHNQQnh5YUVVY2x3cDN5OXJrcFV2dXEyeUdkVDZn?=
 =?utf-8?B?RjBrVk40dlZzbVF0SVgxR0QrUHZZUDlKSUF3MnJ5MkhNQmtVUFNDOHZPanVH?=
 =?utf-8?B?VzI2TW5oNFlXQWZsSXJkVCsrRjBnVm95T3NJSnRnelpJS1JXMFhDWGV3M2My?=
 =?utf-8?B?Vjl1Ymc2R29xWHpQZWw1dTUwa2doVmV1alRWSk40ZmJpR1I4cGNwYnlISEcz?=
 =?utf-8?B?aHArTjZBZ1VPVzViQ0E5U0VlUDFJWjd6d0FyUS9teXJqWGl4aElMQUozWm5E?=
 =?utf-8?B?TGpXUGVjbTJDSmNsSlZ0RFFpaW94eDdUSzdRNHBJRGdaYnB0VGhEelZjVjlL?=
 =?utf-8?B?TWpRQk1NOTJGWlJIdHZiSkRFZGY1Vk0xb2dkZ05RVUxiWHJnazhQUEw2ejNm?=
 =?utf-8?Q?JboAWW+JbxX/XoAcXGp7N4lxh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8bc7a8e-77b9-4f09-7420-08dac6585bdc
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB4899.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 15:53:23.0067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MIVi3gBuqIPNmIBg0zjPDxG3o5VLwiiPRxLaUw8BsDr3YgyWptn2/bf7kaNcFJq3nctHOG7oE0WysqKaw+5ZWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8238

On 11/14/22 01:18, Jan Beulich wrote:
> On 14.11.2022 07:43, Henry Wang wrote:
>> Sorry, missed Anthony (The toolstack maintainer). Also added him
>> to this thread.
> 
> Indeed there's nothing x86-ish in here, it's all about data representation.
> It merely happens to be (for now) x86-specific data which is being dealt
> with.
> 
> Internally I indicated to Jim that the way the code presently is generated
> it looks to me as if 0 was simply taken as the default for "pnode". What I
> don't know at all is whether the concept of any kind of default is actually
> valid in json representation of guest configs.

0 is definitely ignored in the generated libxl_vnode_info_gen_json() function, 
which essentially has

if (p->pnode)
   format-json

I took a quick peek at the generator, but being totally unfamiliar could not 
spot a fix. I'm also not sure how such a fix could be detected for testing 
purposes by libxl users like libvirt. I.e. how to detect a libxl that emits 
`"pnode:" 0` in the json representation of libxl_domain_config object and one 
that does not.

Jim


