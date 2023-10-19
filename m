Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8097CF01F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 08:36:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618895.963163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtMd7-0004IW-DB; Thu, 19 Oct 2023 06:35:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618895.963163; Thu, 19 Oct 2023 06:35:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtMd7-0004Fn-9d; Thu, 19 Oct 2023 06:35:37 +0000
Received: by outflank-mailman (input) for mailman id 618895;
 Thu, 19 Oct 2023 06:35:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtMd5-0004Fh-Lc
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 06:35:35 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3cb4870-6e49-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 08:35:32 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8747.eurprd04.prod.outlook.com (2603:10a6:20b:408::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Thu, 19 Oct
 2023 06:35:31 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 06:35:30 +0000
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
X-Inumbo-ID: b3cb4870-6e49-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aqESlWtdBCbQGMIFh2OAT3w3JTZtwt4998B5aRG3Av61S07wx4fuel5h6frYJqwO9wFP5da8w+hBS81gjCfcpDZlUGY6vw4WGmsZRgPGN/ekKv3z6UdqLbHcIN2Rf7BWhiMe9rzCPQKWfBXWGI1V01cvqxJKfXaNENwj7GoRCLH4Cz5kC/ALJb4rdV2AR4eHf/NAHGnHnC5nzdBu21Bu6XP8j35aO5dz0RKWAZ2wHu/oP2zAyNLMpqja5fCFdqexFRL5wWl0ge0F8bjGdjZp4vxmuFO+l1u4CEFLSuiWgCNNJ7sw+u02LbPmhEAoSKP0gUQApVCm9GDd2z4F8LAOtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tBdhVf6XAkSBxABwGO1mon3mcodc9IwKa3vK1gK8scc=;
 b=bgFJZPo8b83xlT73otOTbFeoXLHsRNOntVqUxeVns+Dvn4N5m7+mwlVvp663ak3nTWWgbIHck5UtqsPWRyW/SXi3bbOfFqAEHHKf6UNaExuZyChaU6Y/PBpR8nMtJbiFYu+cu4HiPFoiuMdmMTSTMA2DWMEWa2VQ1tpUoTBATWSZh1BP1IoNcluO7Vam2m9JJpTlfVpYIsGkF2AXIVXxjSQvrkaXduVBuqitdpVcwftG6QW3uZHZ+4bMKTB09d4JLg4gbq1on6Uwm7xXvkPgtp+W82CUvb8LS7P43BRmnENUCyCLspE2a/kCtPoaBE0OJs4Uiyp7kinSeM8x4zOR3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tBdhVf6XAkSBxABwGO1mon3mcodc9IwKa3vK1gK8scc=;
 b=cTMk9I4oaEIwdtxjGGmcAAiVg1fvzFZl46/mhYr82GloERxRFYkDhy66VgmhQ/rH+D1wQLi32caIPArvq34slh39Tj0hsrr7NCW04WfbsNdCKiASzirmS8EiE4jzskFtFDj4c6y3nVo4LLtUxOhk3mPJo48EXx5givoq0dJizDPHhiMoDzZB50ted9V0B7Mnk20yzFEO5VmvfgvOuXvXWLe9DtHSNIx/1OMVdiJ3z7vU24tOF2gvyqEGHF3zQ/cO4VqjCeFy0JNnL/ATWnX8pBHxAn5QbXvKC6H9/0u5qqlwi9GOJHUjQehCavwCb/alPZLDpLy3+5U7ZCWn1DtMqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0f6a604e-7201-ea2d-cea3-89a3b9b08919@suse.com>
Date: Thu, 19 Oct 2023 08:35:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] console: make input work again for pv-shim
Content-Language: en-US
To: Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Henry Wang <Henry.Wang@arm.com>, Michal Orzel <michal.orzel@amd.com>,
 Manuel Bouyer <bouyer@antioche.eu.org>
References: <ed275abf-351f-5237-7e19-a3856f6d4272@suse.com>
 <f2b51b47-fdeb-45a6-92c7-5b21da1855fe@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f2b51b47-fdeb-45a6-92c7-5b21da1855fe@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8747:EE_
X-MS-Office365-Filtering-Correlation-Id: d1e8a846-06b9-4b73-1951-08dbd06d96de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yyCIJdhSyb+egeqAYKcvfnay+ruByjxEI1dNLd4olYMVU5fMlXEB62YD3kMwwix80SzUhI/+RJ52PFBMWYdFGfJ1EHoXSrMxWbFwHk+SxD/XGPqsqk411232ggv2+yoFff4dcIoPIeSqakLd1PwmweEi79EUyTYLlo67Nj57Q13bJC4vqphta8YArFNSB8ElTPNfyfgQlod9SZ2ZkmZ3vNnGuZpZNgzZM3vg1zzF6Ig2E/dTw1XllsTTvLYDBNaxElKvm9hnqBAx90zci0X0QRXt0nNKtsVlhsnAize6+eWU+l+l4Q1BWfA6hm6WH8fp4DPH6uZr9/s7cSBwvB8gW7aFjTIcT/XNWm7EoHp2nrlsy9RNeezfbAa9MiRqhND5HnLFeMZs6CjLUzZJulUXNeGDh1r4DdFlK0oSsGpomtlVIRAQsSAG7W1o+bMscE2PtiD7LfmUX0Ry9nynHgFfn9MwhH/HbZ5CIL81YzJYtYeIo94yJ7zPJXl8KswrXhgk2OrDAQpcxFqHNQzS88PPNSu5ez1Zwlj+a6PCwezyHzlG84CJ05/me1J5hDxxvUQpEW9BHI4aTmU2ycn6f0qZ2rsA/jY4oQ/O4bEGcX3TvfoVAiyBqifVAhqL7/h1svaVtpYH2xgG5eq9Q3ICJBra7Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39860400002)(346002)(396003)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(26005)(2616005)(83380400001)(8936002)(6506007)(53546011)(316002)(5660300002)(41300700001)(8676002)(478600001)(2906002)(54906003)(4326008)(6486002)(66476007)(110136005)(86362001)(38100700002)(31696002)(66556008)(66946007)(31686004)(6512007)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXd1czhYeTZucG9mMkZMd08xVjVXOW9jYjZuTkJMWXdnWi9tN1IrRVB1WU5L?=
 =?utf-8?B?TUtQT20rRmtERE5Vanl2T0JnS3NZMGZaRTBFSkNkMEZUbkMvdURRWE8rdmdR?=
 =?utf-8?B?N2duMXFWWHdKMG1pQm9pUXBHejd6SzRoRU81MUovLzJvbTU2Z2JMS1E3NkxY?=
 =?utf-8?B?UHkzVUhpL3RnOVVsNXRzOUNRUGdUZ2NNSHBqMGJqaVR3a0ZuSVNacDVETzIx?=
 =?utf-8?B?OGlzMnZYUDVRM3pxS2M0ZHNCMnZkajZrd1dpUFM1R3Z0K0V4VG85QkNUMlVz?=
 =?utf-8?B?bUlCdFAyZEVqVTlXcHlaUG1kOEg4T2J3NDZrbjRLLzFSVFhPbWplRHovaGox?=
 =?utf-8?B?eWxVS01PWGd1a1hucVg3U0wxNHpsOTg5eW4wS3RTb25rMDFvc3ZrYWJjZUNl?=
 =?utf-8?B?RDZoV3U4RGYrODY2ZldZMVVuQ2pqWHVSZTRYckRMTi92TGd6VWZhSU9RZGVK?=
 =?utf-8?B?YjNON1J0UExGRDdQdHExWmo1a3RMN0RnV3g1RWtpZzhHK2UyTXY5ZkxMVXBa?=
 =?utf-8?B?THZwQUZXbUQ2OG1mRTE5QzlyMG4vME9BUnV4TjRPU3NUZGxyeEtXWGc1cm84?=
 =?utf-8?B?TnZyRXNFSVN4MVAvby9LWGFLb1VCKytJejNCUUVKbGZGRHl4bmtHMExKeS9u?=
 =?utf-8?B?Q2kxQ2tIM0Ricm5LSEpTak4xOFFDYWw5SWpFZHdCUXdMTm1DaTlmb3ExdXd4?=
 =?utf-8?B?WWY4Q2xRRFJ5TmtpdHZweGIwMGlXR0xwVnVpNGcyUmZ0Qi9palBYSkNkUUhW?=
 =?utf-8?B?c2JKSDFTWldORC9vR3B3QzY5Mm8zaEY4MHBhSVdXRi94SVpsQk5NVEdGQnJj?=
 =?utf-8?B?aENhWUJNaXdLS3hoV2IvTUNEVFFVcE9WblBabWUrRndHVm44RkdKRFA1Sm5x?=
 =?utf-8?B?a2ZsWGNRSURCc01xemY1R3o4SkpFUjE0TGNJNU9QYXhURUQyTmZwa2JaNENa?=
 =?utf-8?B?a0hqMWI1SXl3bnBjdXIxUGdJVlk5cHRZOHZRMWMxOVZSOEl2Nkx2M2h0Smph?=
 =?utf-8?B?Y1ZPSjhqdnlubUVBZzlZbWVHTTNnN2VSVytDRWVTS1BHV1pUaGw1SmZKRlk2?=
 =?utf-8?B?RnhnZGkvV2hSTStVWi92SXMzWWZtMTVtRVhFd3FpWGtqK1lMQVBCQ0tCTU5j?=
 =?utf-8?B?ZlJTc2tsNE5QRWx6cXZPQWRibDdaRTFGemx3ejNyYVkxSG5HWTBXZ1FnbHNq?=
 =?utf-8?B?SEFKT1RncVFUWnF6UHZVUVd4azh5V1owenRwMUVaaHJ5cm1xaFg1dnA0YUli?=
 =?utf-8?B?cENGckJ6QjVwK010UlNPMlFPQWthN055RS9Ra1VYd1UvVVdvczhicXdIZzBh?=
 =?utf-8?B?YkFHS29WV2w4RUhwYmh6bnVjWFczdjdWS1A5MHhLL3lHbFl5Q3oyR21hNVd4?=
 =?utf-8?B?NHdDa0gvOXBrNzVSZWd4cXNlajB2ald4RytocEhiczRvZmdiZmxaYmkycGQr?=
 =?utf-8?B?TzM4ZGJ3dmszTUkrTnUweFRLTG9kN3QvVW1sK3ZSSkFiRXhJVmdkd09hV1hW?=
 =?utf-8?B?VTcrK2cxdFRzU3p5U25hSmNmNFEvVUVsb1p3Q0NweXR2MXpHUkF2ck1MMkVn?=
 =?utf-8?B?VnJoYVpaRDU2Slk0WUdSM2pNVEFrRzhPR2NqQmUvS0dsZ0c1eHBRVkM4UUxO?=
 =?utf-8?B?eDIxU2RYdldBOTlVWTdGRmo2S3VLYWdOcWdnMVduSXkzVGxWZ2VrRlFHdUxs?=
 =?utf-8?B?djNNaE5WdjladXVyYWpmekxPUjFMRityOGp0OE11SkhPWWp2Vi9uUWRCdVhq?=
 =?utf-8?B?empFWE80a21KbjA1aW5uT25oUzREUGx4QktoOGIyVlpPa1JXMGVpR1ovSHFa?=
 =?utf-8?B?anl1c3FoaXlMdzZNVTNvTllidHNUdUszVVBBZ0pEd2pJcEhTS2oxWUpJdWMw?=
 =?utf-8?B?K28vWEVPSlBWMzRFSWcrNTB5dFNteVdtZFRJS2JWM1EwL0dCbk1xaHd2WlBj?=
 =?utf-8?B?MUw2R0l4WmltMWd0SEF5VWh1aTdKUWc0SFpuTkl1eDFQWE9YWGdJVExFVHVJ?=
 =?utf-8?B?NXZsWFlnMktNRWI3dUhPa1ZXWHB5YzNTT2Y1VmhiRTFyVmo4M0ZESGJGd3Ew?=
 =?utf-8?B?dnBXSHZ3U3c1NmlhQ2ZOWGE0Yk52TkNTdU90UEpQeTRGVlduaHFCQStDSzlL?=
 =?utf-8?Q?uTdOYwNbYlTsnc6BHVNqnR1xo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e8a846-06b9-4b73-1951-08dbd06d96de
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 06:35:30.7962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g2J6N+4wFdC+un5UmM77O4mK2x/iP2keTa4SBTUlmzKlx5OMt7xg6MIziUVuzIkMZRJeGjXahcd0dFykRGpQFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8747

On 18.10.2023 20:00, Julien Grall wrote:
> On 18/10/2023 15:58, Jan Beulich wrote:
>> From: Manuel Bouyer <bouyer@antioche.eu.org>
>>
>> The use of rcu_lock_domain_by_id() right in switch_serial_input() makes
>> assumptions about domain IDs which don't hold when in shim mode: The
>> sole (initial) domain there has a non-zero ID. Obtain the real domain ID
>> in that case (generalized as get_initial_domain_id() returns zero when
>> not in shim mode).
>>
>> Note that console_input_domain() isn't altered, for not being used when
>> in shim mode (or more generally on x86).
> 
> I think it would be worth to either add a comment in 
> console_input_domain() and/or #ifdef the code. In any case...

I have such a patch already, but intend to submit only for post-4.18.

>> Fixes: c2581c58bec9 ("xen/console: skip switching serial input to non existing domains")
>> Signed-off-by: Manuel Bouyer <bouyer@antioche.eu.org>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> ...
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Thanks.

> Also, should we consider it for xen 4.18? (I notice there is no for-4.18 
> tag).

Of course we should, as it's a regression. I probably should have added
the tag, despite my dislike for such. Intention was imo nevertheless
clear, by me having Cc-ed Henry.

Jan

