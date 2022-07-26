Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA43A5815E6
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 17:03:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375395.607749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGM5v-0005gf-G9; Tue, 26 Jul 2022 15:03:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375395.607749; Tue, 26 Jul 2022 15:03:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGM5v-0005eI-DR; Tue, 26 Jul 2022 15:03:35 +0000
Received: by outflank-mailman (input) for mailman id 375395;
 Tue, 26 Jul 2022 15:03:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGM5u-0005e8-4L
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 15:03:34 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062.outbound.protection.outlook.com [40.107.21.62])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d8dfa83-0cf4-11ed-924f-1f966e50362f;
 Tue, 26 Jul 2022 17:03:32 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB6597.eurprd04.prod.outlook.com (2603:10a6:20b:d8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Tue, 26 Jul
 2022 15:03:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Tue, 26 Jul 2022
 15:03:31 +0000
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
X-Inumbo-ID: 1d8dfa83-0cf4-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TlpIE6dHM5GGTkkMe1VroxPB3AW0ODExVW67WkCscbUXfDhQK9IJ7W2pXwajhgMkpkzpr+lB7b1PmgcPUOJzxRLUEItfu9OiIJlxlrzWy+vYnrZ+M6Y6Cmav3ImqgSs6XoylUin9iqI5B3x7gBS4dxm9C6XVASSPeDhLt/17d4Zbu8J54UJ76vzXKbAxKUqf7ygyhikFSRCgRolHrYypEJg80E9rBraeG56RNlxhKithgwCJ8t9pQGvppX3Mi75DGfj0QkC3JbFOmt9uwq4QgMrWwmXaMk3/MmT2T3sJb1LODKYAn01HEzwLdS/uA0viEb3QzRAFTZxqmStS7rEaVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XyLDKeaUM74v5FRmG63pbSzmEKAmc4NPj9pqzbOsBkg=;
 b=AonYRQqfCR06Qei3t+YP5brb4ScItBhpJ+BnCBpO6sKS2l0SwlEYjVptoXfvhzo1ef3lIYcLg5k2eWluXzYlSO+tVK5kqKvIHgDCOu0Q501CvHmfaGlKhCZoAfU9oy/jxuX7KvR1NmCIZxQWQ69iSl7j0F4L0wFJlQklv1gcV1pymBeum/tUZeOUg5Qitk1AfRpCYYxsQOTFqn5LlWj4im5XxelvjxQCin1B/qNtrXUbT1IWDKf9FQE2FQdv0vS949JhkSCP6HeMawjVSmHlQiMLq/x2l3DIrE9zGm/sfAk5imBYGXlOpARv4FdFSofEEVq28gMPZkVCl0hO8vdeWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XyLDKeaUM74v5FRmG63pbSzmEKAmc4NPj9pqzbOsBkg=;
 b=b7LRRYUbvgQp4wUViYaz3zaI+XWz9MLJd+UV/OYzM+z7oX4TiaLOOer6HYjukhmJ1nZXVEIe1mIQ9I8UKodCo7xTeLA5X6F6hgN/USEtlMtu0gNpWtL6e0dySryEuEPyJ+2e56qNil/gw68aFj2PtbijFkLOLiyIbyNwENRrd/R7mj6v+f10GqAjysuNelPtA+HGFiVm2ShrUAsunVtscf3ZQCbYGen7Npl/ALSh4mC9SrmunL2f5yioJAOP721t4s58VGKvJYJ80gU70b57qsIWaB87rUyNEe/H7PEDU7pBjm36WqVp1hE+42HIa9x9QbsSawQQeqQ86wr/PfI9sA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <47ae6b9b-eca1-7e42-a7c9-12cd9030eddb@suse.com>
Date: Tue, 26 Jul 2022 17:03:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xen/check-endbr.sh: Explain the purpose of the script
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220726142328.12246-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220726142328.12246-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3894c676-6db6-4a9b-1784-08da6f1800e3
X-MS-TrafficTypeDiagnostic: AM6PR04MB6597:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Dk9+VRctIZPLkY5kdst7N2e/mCrUwZQGtGfr/qiZ9vTK+fkKC5nySsYKELlepZjDDmKTrba69xcnW8/9K3TgGKUm0dqlR2C1zONKixnKivZbsybYQUrUSihNMo8jQIHLM4Q9tSXSOFQqBERKpy6uctiDa1uWODjp7tMiit750IbLXlvFdyqX4jLrwZ95bGdbMFUiDuvVqj0Jg/FNHd7KRRnFVPR0pHqtOcN8qtcs0xI4RHgeaLxE9eBrpOGmmglg8a+UfrGoQtwwMGp6dCPIiBv9J8UyZyqi/MaU8rvEt3dYG9XvgVyM9/bmRTtS9R2dlKQUMlcq2x841WFHzrHTVMHl7VBslOzouNVbfiEXkHGrYY/8Iah2W7ouRJIE7OXWIyO/i+YG3d2RbyjaQifregD25x2SkTaO3bfIZ7CXEQQq6F645/vTqSBz30O+jOjLNWBVz8CHiybHO78mHSDFeol6Wmu4jVdYxlp4mkImdKmwzNZqiH9P1JaVScBnHlpgvgviYEHEP+W0qjXc5kGOYXl93/lNQmj2kh01h/z61jnVDgYA1USV/BYcC9Xd8dfcsk7nuDAQpz78oUrVq03qVBDZShJ5OS8+JgfY7dqvHZjDtQ34WXFuRLLlBhujL1kQO8cTrfnrChYgi7cPz3gkoIKkOfXYx3R57XwhNHNozvvsM2gRvcq/lq0IeFbabsMJkFwj9SBbskXNiH1MdM1uTU05ZHkMlnkJ8j+yxQvdQ21mR5S06shIhAqqyZ8BxhbGJ9yhYazx5GoYNw/kxHGBL5Papzic7eR+mn27GpFLH5TkdLlnazkJs0HSMuHJ3O7n5uuaD4unbzf6iqSIeUXRkQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(39860400002)(346002)(366004)(376002)(186003)(2616005)(6916009)(8676002)(4326008)(66946007)(66476007)(66556008)(54906003)(6512007)(36756003)(6506007)(53546011)(31686004)(41300700001)(26005)(2906002)(558084003)(86362001)(31696002)(38100700002)(316002)(478600001)(6486002)(8936002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3IvaXVpVk85U0JJTGw3R1l5dklGZ0RqSHg0R2hKZ2NhdmptVUM1WW1TekdR?=
 =?utf-8?B?d005VUFXSjhvYjhyV0FZUXNkMUdBa3dJVDN4Sk5HUHljNG83LzNBSW5MUWY1?=
 =?utf-8?B?NGFHZFR6K3grbERHbVRYaW5wMkppb0dJeDlhTmVxdlBhdzBwT2NVUHZacU9V?=
 =?utf-8?B?OStSb3h0OE9LSGlxUjFMOUpSWEk4Q0h2Y3RkOVRNaDRSUDFJajM5clFrQ0ZP?=
 =?utf-8?B?MjZHWmNBaEFKVXpZODV6aTh0Qjl2cCtoNkR0WC9nNHlOTXY2dVVCek5xQ1pW?=
 =?utf-8?B?cEo0NnV6M25WS0c5MHlzaENWOHBJa0hibVpmbzFIdERCdWdBUHlTbGtZQldh?=
 =?utf-8?B?QVlJSkdCRU5LS1NBSzZTZWo1cXQ2WkFicERNeEtlZDk3QXJiUy9RWFhhWkZ4?=
 =?utf-8?B?L1ozLzJJTXZTQ0VVMHlvQXBjaFBuYyt5U2hmVFpURGNOc0E0ZUtOWnRqWFNV?=
 =?utf-8?B?dWIyWVpLZHA4MXFkMUpmWS9xcFNNUDVyUVdnNi8wWjFUYzdjRXJMSGtReWc5?=
 =?utf-8?B?dHkwTUFlWEhTSkdyRy8vVmhzV0phVkpTR3oyUmR5MW1UT2RnMWlhMFRiTCth?=
 =?utf-8?B?VzRJZnBzcnljUzZ4WnE2K21JZEZMSjZuMUN1Wlo4bXNuYy9TaW4vdUNLaE1U?=
 =?utf-8?B?Z3EwS0ZyQ2loMzh4aDhqNUNlVmxINnZLSXpyR08xdGV3dUhjN24vbHMrT1hD?=
 =?utf-8?B?bkw2OUQ0YVI0Ujg1SW1QRmVvSzhFWlpmNzFIME1TWnRhcGhXcloydW16WExR?=
 =?utf-8?B?UW9kcGllOVlZSUFCcGo5czI0WTQybWd5RUIzNkhqcDVvaVNUWXJNT0ZFd2ZF?=
 =?utf-8?B?RTZ3QlJ6anRYQ1NFZnV2S2I1cm1tbWJkellObDJ1UEk3allNdDRYWS85OFBv?=
 =?utf-8?B?VmZ3dHA2QmQ2ZEN0bUI0Z2Z6enRaU1MzZlZnb0FWcWtUcEpjdk9vangyT085?=
 =?utf-8?B?b3ptdEJxSHUvUHRBajVrYXc0RXk2UmFSYWRmVCt1TGhDYnpVUk83VTJDSitD?=
 =?utf-8?B?TE9hQjd0Tk0vNzZxem50YktMWXRxTnlvakVlY1h6ck8rRDRNbHhDNmhhTWVP?=
 =?utf-8?B?azM0dGhKeW96NWZQeUNnaWhxejAva1pneCtPMHlLd2VITE9EaTJ3Yy9ZeHQw?=
 =?utf-8?B?Z08wSkFhdXBURmJ6c0NNcll4M0tEeUVybWsyZEFJYWpaczNOTENwSmdnYVdN?=
 =?utf-8?B?MjVWZi8xeEJFK0FKeEsyTVlSWnk2Z1Q2NjU2bmRpTE1Xc0VzWG1YUlNIbFBB?=
 =?utf-8?B?QkYyMlV1RCtoSVREbE1JUnFCR05wZ0ZwT0t6cllaQTJETTl5SDg5Q2Z4US9q?=
 =?utf-8?B?UjE2eXR3Rms0UU5rT01IcXdKVGQ0K2ZtaE5oRUJKV2ZYaXlSeW9JRzFxQlRm?=
 =?utf-8?B?YUYwSnFmZkltTG9XSzRtbVZqNW9ucGE1Q2ErQUcxM1B6aDlLNWNrY1Bxc0Nv?=
 =?utf-8?B?Yjh4Sk5LZFZaVmJQRUEzejhtV2htbFpEYyt2ajcrUVc5V1FiV2VJcUlBdVhJ?=
 =?utf-8?B?L2RZbVhlYS9mbi9uMmVHeTRRMzY4VzlMZGdrY3UvU2llWG95S1g4SlZCMU1o?=
 =?utf-8?B?K2tSb2gwVlhOeG9hVzN4MDNaM1h2L01nMXMrVVlHUndQUlo1OS9FbTZ3b2xq?=
 =?utf-8?B?UGVLSUVRU2Fqekl1ODhESUdSZk0wWFZYNlhCY0U5OXJIbEpieFJ1ZDN1YUpv?=
 =?utf-8?B?UkpTUTVqZnpRbmNNVTBYVmFnN2pvL1FNVTZtS21uQXdDZXJKR3kvc2w4TklN?=
 =?utf-8?B?OENjcVR6bGgzZUxtcVk1OENkY1Z4V096anpJei83Q3JkTXpGaWlwTGJxQjYy?=
 =?utf-8?B?RC9VaHVqVFV2NTdYS094cE1vdVpLLzZvMkNVM21LR05NM3IyeWowejNETXcw?=
 =?utf-8?B?Z0NZSWNZSTVMYnRhY25ycDZ0UmsrN2ZkN2VlWlQrNVhzamdxSHpySFlEWmFD?=
 =?utf-8?B?K3ZlMjRQeXltMUFLckFsclE1ZWpDRnYrREtiNmExWm92aGYrcjZMU2ZZVUNK?=
 =?utf-8?B?Wk5hc0lVUHZoWVVBSDF3WHkxaWtSamYxQnNodVpHazRHSmhBU0dsZ3V0VDFD?=
 =?utf-8?B?R0Vxa296dG5sZlVwc1dpUTdjdWh6QWhnMnZPRS9NSE5CbDZGb0I1WE1OZkZF?=
 =?utf-8?Q?Zn+5NvmV+Q2HMc17v7pdm9TEa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3894c676-6db6-4a9b-1784-08da6f1800e3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 15:03:31.2221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mqB5IsRPSiyHxKJ6UdsFEri1dCzwvko/13ST02zOmbw3VpFY3ad6MRNUTES57ddWjiE6hljjCxSZaMweAmG46w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6597

On 26.07.2022 16:23, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


