Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7A2540105
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 16:16:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343329.568644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyZzu-00036n-Tn; Tue, 07 Jun 2022 14:15:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343329.568644; Tue, 07 Jun 2022 14:15:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyZzu-00034H-Qz; Tue, 07 Jun 2022 14:15:54 +0000
Received: by outflank-mailman (input) for mailman id 343329;
 Tue, 07 Jun 2022 14:15:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nyZzt-000349-N8
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 14:15:53 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 566bce19-e66c-11ec-b605-df0040e90b76;
 Tue, 07 Jun 2022 16:15:52 +0200 (CEST)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2058.outbound.protection.outlook.com [104.47.5.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-46-V2_x6K3MOu2ZC8HOKqvi7Q-1; Tue, 07 Jun 2022 16:15:49 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB4205.eurprd04.prod.outlook.com (2603:10a6:803:42::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Tue, 7 Jun
 2022 14:15:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 14:15:46 +0000
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
X-Inumbo-ID: 566bce19-e66c-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654611352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LhlZbOwPp9043ER1BXoZcj7AFVJiR8ps1Vacfd5r/OI=;
	b=dMkpjwJvEtIEPHgR0Acw0MtBz+rQq0UiFX27jcSqO5a+coO1viWodAt6raS5bwtyyNbjMp
	YhflKayfIzcT5P3CRxclVx7hn5hXV3LONmo3L68KjHMyKx7FiM1f41U1N9IDiZskvAtP2a
	4XUsNrndREW40+Pmp1sxhsidXEMrfS8=
X-MC-Unique: V2_x6K3MOu2ZC8HOKqvi7Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WfegiwFWLcoUFZgT+yDUuoXz3b4kupT5IHZYTFJG8HOnYh4QRUwegfONzB5B+DHpJYSdTM+f/6xt0jUVolOcn+xSYMtOFEUs6p8VPAQclb2KLBL1BNOSsW4a2KvUqK8mIf8Cy8Wqy4j+EhIZ/YHkpJeyCe9FU5sxlu9JJMDe6PMST2/f4wUkMBRbmz8ciTNLATvmsDg9cDmFU/3YdRkfkr70zuTgyygRqoSS/OoHeVExmwsdpVBq1r/yFpqNm6PeIDQUYOs1W+2XGTRMLbHnodUVTIOviCGYJnnIWWk2KfkGFwccspmFSFspI0Kk6JmaopoYcU+8Rfs0XLMq20iffQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LhlZbOwPp9043ER1BXoZcj7AFVJiR8ps1Vacfd5r/OI=;
 b=ZLSeWPJNwrsk5++GnrO1j0KzSv3poHBNoShoWoOsfcE1Ya+t/W8td4e80cIx9ChmfkzcaL8ZXANyA/605zsW/87JqlSQp2AsCx63e2wuCpY00Sm5TypRKObjxjPOHo3wHG9/3Dj8YMhLpBdDjSapkFqxTsfBQa7qGY1ZyVN8Cdezh1yuDeDKjv4mWiOdweW3lE25ck1ZJ6RQt8kcVPZV65iS24lqus3yZb2fg6odlCV0EEtnnPF/lwtIBKDFdU2yf4G4Oc5jMcuKNLYP72T9I49PBl3NXY7DSiZYlI5KjaAaOYe06UQE/QTRhy9Xrh99pxvo/Hp+oJg1teDuS/vRsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LhlZbOwPp9043ER1BXoZcj7AFVJiR8ps1Vacfd5r/OI=;
 b=eILwualKGcLUNRqOLffFuhV+P89VYnQVibLMu9cE24/iPLLVTnq9ZCzqXEgf9ndkyH5m6/du010mvQElf63+OJoe1o0eexBRBJF7V2UFnh4y7vz0zuHJjOHOJ8uzvYiHt2EoPt1rP3rQAJw81i3APW2060fbrLJlVONFswu3IkDKCu3cXbvF3qMm9K5IZlDB13fLmRMe901yR7a572tUI8Wy8T0hSpsVnfuljyGNHNVxFuU7jy6JTDmgtt+0ydxLrML/wzFS4jJXmnyp5ct28bgPeoDvT5vWIPRhcl659nivg6dxcj1R8sOPpBICv4cHFjujfWAZnp/r8Jr7h3sU8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bab0e4ed-643d-01ad-abf8-de569ae83036@suse.com>
Date: Tue, 7 Jun 2022 16:15:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 2/3] xsm: consolidate loading the policy buffer
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io, jandryuk@gmail.com,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20220531182041.10640-1-dpsmith@apertussolutions.com>
 <20220531182041.10640-3-dpsmith@apertussolutions.com>
 <17edde4a-0d00-0da7-5910-09874ab70838@suse.com>
 <6447f0ff-993c-9d39-52a8-40a434be9e52@apertussolutions.com>
 <054d4009-6042-c985-cc10-b133fc2341b1@suse.com>
 <523f3594-02d5-e762-27bf-9d48d4b8c6e1@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <523f3594-02d5-e762-27bf-9d48d4b8c6e1@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4f99fcc-e5ba-405e-2897-08da4890375e
X-MS-TrafficTypeDiagnostic: VI1PR04MB4205:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB42055A4A5208E78CB941F62BB3A59@VI1PR04MB4205.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xixvD3Ya4U90+q68XqnTHlu9myM8RXkHE1CuY8b2i2yU06UOgBRPt74VMXu6dHfsaQ3aVVVA6sK6jI5llKe1wFs6OPP1hwSdMcGuXCi1mwxyvlfWilzWBUcuEh9QCeU9BXxXM+UJUTTnmijpqUUrQ68wDXufn2oIiVAy/NByTHG+MLMYm4GegFUf/33mU5AxU1bMIAohTlJfZjmW9kjAGzI0CT6HVH1HbBA7hw1Z1kjX9u0A2GNnlCROjkTfinv0TeyBqNjqrWdoRdtEkntwxr9xy7YIziRMUwUIaF02y5egqx4XKfNaMw8klsB+lUzCLygi4HMGakAjVO9hF8H+nQNHrBrJLLelcTJQMlZ0HeCtk8BjxgMAXO0h5j0oFOquFf9OtR57i/A+uZoJC1YZ2ybX+ENr0PFmr4RgkWlz0Aw+1updtysnRl+SxcUsU7PiUsr+aUYCmSd0idIYTcfF0xi3Lpkxblqab7YcUQ2EUBfOfJbbMFF5FAZFJU/STvzT6CvDCY2bOvEyDufF0PVg+Uz9r7fQHB/cg7DqXGyDRE7ySMfmwmkW69EAtspWAT5PjGM3KhWgQwSWcYJhFfwAjE5GBTRFoHbiNcHmKZtBpCLR5YODxirL/dMif+VwiIbF/sYfezJl7vYhvJ1/mdrBjc/C9+k4giusq7dYCOWrfA25AhSbZPt1Mc0PFPnSM/lWApP9QCK6oTMaQ6IQ/F8ominkRkHgsRDLRO8kq5U+tksS3ycGAENR0OSYY92mKtPk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(66946007)(8936002)(66556008)(6916009)(36756003)(2906002)(316002)(5660300002)(31686004)(26005)(6512007)(66476007)(4326008)(83380400001)(6506007)(8676002)(53546011)(2616005)(508600001)(6486002)(186003)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkc1RGpZNVlWTDJYZGMveUE4cEVJUlY5V05ZNjdxOVp4Yi9jSFN3Mk1BejR1?=
 =?utf-8?B?TTRGOUhqOFRBZy9sSUxzY0grRW1nYTlJS3NOdDBRTGVIWDV6VUMrbE1RUEE3?=
 =?utf-8?B?K3E1anhFVW5tVVYrTFI3WTlFMUJzWnM3N0MyY05nU2hOazY5blVMaTlleHVz?=
 =?utf-8?B?cmRPQ3RnREkydlRtekNGTWRBUEFZTDFiTkpuNHdKRU9kZXl4alhkYWdFTUM2?=
 =?utf-8?B?NWx3MHZFaVloTExKMkNQRGVtTUErVW42cWVjdGpVMG8zUllrY1dKR25idHBo?=
 =?utf-8?B?SjhWTkVObjdsZ3hsTXI0NUprbFVFSTZvTFFoN1owakpmYnVLS0NpOHRZQnIv?=
 =?utf-8?B?OUVaT29ldlZyTFRXVVRzMWJtWG02cVRURk1ETlZXOWEvYVVPRkw1Tmx4d2l4?=
 =?utf-8?B?RUJUdXhKbUc4ZklsV0tsRHlmR01kUFVvKzlHd1NFOTJiNHlIOUVQc2Rsa1RX?=
 =?utf-8?B?UElGaFBHdWd1Sk9Ha0RiYXZqMnNCSERyakFjem5uOTB0L2NMa2RlczQxNDdq?=
 =?utf-8?B?VVBFRGdjREFjcllObzBFMTBXak9RY1JSY3U5YndGMUJTNGpSUG5BbG9VTjZu?=
 =?utf-8?B?b216ZkdOTlhQTW5hajBRNjRSc256VHA0d3g2T0tCc3lRZVpqZ0ZObnlZeXFj?=
 =?utf-8?B?Sys0aFluNEwzWXNoYlVzRitKdEhKbkRZamNFQjg3M0QwWW9CZGoxU0s1MUhX?=
 =?utf-8?B?OVVzU2RuSi91aHVoNCtPUUZrUHgzSDVDdUYxN2RKQXFxUUwwc3NlcDd0Qm5F?=
 =?utf-8?B?Z1JFRWVDbnJnQ2FqdHB0d3NncnZjTjNBWXVCSHFud0VvUG5KandEU0J3cTl3?=
 =?utf-8?B?akFaR2YzSmZpNGk2K2lHWjJNNWJpZXQxaUFVRTJFc05zS3hQcHFzd1ZJUXEy?=
 =?utf-8?B?SFJaemcxcEdFaFNsWUEwbmpXam96MG14SUM3dFl4SzV6UExrQ0lTR1lFbDVL?=
 =?utf-8?B?WEZPclFtNS9KWjFiOFF0ZmdSc3RUcnU2RWorQ01QVDdyZXRGQmdMVGZrQldn?=
 =?utf-8?B?WUhhMWh4aXVKQUIvSHh4NDlYWHphKzBuUzFIUjVlbjZCSzJweWtFcmovY0hr?=
 =?utf-8?B?M3pDbkJoSiswaUtxb050c3VFaDBUdUJJZ1U1RUlnWEo2OXl3bGpvcDNFK1Bm?=
 =?utf-8?B?aXNQdXdPSU9rcjE0Z2NJU2lPYlVYeDVBZ3FhVDd3Q2FVdnk3RHBLb0k2cDI3?=
 =?utf-8?B?Mzk2ek5kT0hYVTN0aVdDRnc5Yy9xU3dVUExaM01sQmtWakc0NE5nTWRUUmtx?=
 =?utf-8?B?aWpwa01iZzg2NDRqazdBZ0NaS2p4VHdrNktEWVlXQlpRRG5HUjkyUHFyR3hO?=
 =?utf-8?B?RUtobkwxb3dJNWc3NUdSLzlZTzdHRmdLZDVlT253TzdxOUJrdjJrcmc3WE5S?=
 =?utf-8?B?c0lYRkVSS1VKRGxiSGhKdXNuWTJOaUc3ZitBOUQ0WWR6MjloeGFDR1JyZEs0?=
 =?utf-8?B?SmsvQjFOb2o4Sy9lZEsxY1I3R0R0ZU9OVW9PQzBlTFNYcGRML1pIc015czFV?=
 =?utf-8?B?d0V6OE5kRm9oQm1mMVI0TExCbkJFcTNidWIycHRrRUtrcEg4VVhobDR1RFly?=
 =?utf-8?B?UW1iaEJvRlNXeU5nZlBtbk9UQURaWVBKaC9mN2JzVVNzN0xJRUduUG1OWXdl?=
 =?utf-8?B?ZzBSK0lnZ3hVYVdYYkdJdmdXbjJvRkZKcFVqN214QmhCQTNOWjdjV2R4Y0Jn?=
 =?utf-8?B?Vmk5cmNjWlp2MWZmK3JxVldMbXpZejM0b2tWRTcxdlBkd2l5SEtZaU0yYkhQ?=
 =?utf-8?B?NUVvZFhiQW1hUzRqZERsUGxLUFFicnFaeUI5NW0vWmJWYzM0ZHpneExFc1F4?=
 =?utf-8?B?QUJhWi9Ub0kzUU9yWlFOYjJndzBaL3lCVWRaL0RJZG0zQW00TU43UkxiOWxE?=
 =?utf-8?B?cnY5am5aT0ZWOTlOcDBJd0t2NGNBMkU0V3NWRUh5Wm1xampPR21yTkh0Rnl0?=
 =?utf-8?B?cVVLS1BHRC9iQmFtb2NqdEFxS040eGJ5Qm1kR08ybWhndzJWV0ZMc1VQNlJG?=
 =?utf-8?B?OG1BRmgvOWpzN0ZKK3Fpd28vYUtJeGF5NmsyY1A3RDRLbzQ4MlRYa0tyVEd4?=
 =?utf-8?B?VXNLbHBkbVJSSFUzcmo4SDFHa3U5V28zRkNzZjJOUWVYdzdTbnh6RGhDdUZx?=
 =?utf-8?B?eVE0S3Z0NjB1Wkl4UEliVjlnTzF0VFg2V3g4QTBsaTJZU0RPZkpFTzd6cFBO?=
 =?utf-8?B?QWZFN3VLVVlkbVBHVmNueE9tbzIyZmNiTDJYK0s1em1CTnVNOE4vSGc4ZXlV?=
 =?utf-8?B?eDdKRUcvRlUwczFLSGRYaWRLZTNjSFAzc2tRcVcwTE9qOGNMekd5Z3hZRlZu?=
 =?utf-8?B?N1pVaEZHamQzbmR4NUt0cE5Gdi9zS0swc1VRd0tvVVp4eVF1ak9tdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4f99fcc-e5ba-405e-2897-08da4890375e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 14:15:46.9004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HZxkKwVDamEDKjproAJpB/utiTkmDqEv3sdwDk4ZwicE0696bvUNJ404UhjyBYw31PegCM7XiDe2+kwPdMdgZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4205

On 07.06.2022 16:10, Daniel P. Smith wrote:
> On 6/7/22 09:58, Jan Beulich wrote:
>> On 07.06.2022 15:47, Daniel P. Smith wrote:
>>>
>>> On 6/2/22 05:47, Jan Beulich wrote:
>>>> On 31.05.2022 20:20, Daniel P. Smith wrote:
>>>>> Previously, initializing the policy buffer was split between two functions,
>>>>> xsm_{multiboot,dt}_policy_init() and xsm_core_init(). The latter for loading
>>>>> the policy from boot modules and the former for falling back to built-in
>>>>> policy.
>>>>>
>>>>> This patch moves all policy buffer initialization logic under the
>>>>> xsm_{multiboot,dt}_policy_init() functions. It then ensures that an error
>>>>> message is printed for every error condition that may occur in the functions.
>>>>> With all policy buffer init contained and only called when the policy buffer
>>>>> must be populated, the respective xsm_{mb,dt}_init() functions will panic for
>>>>> all errors except ENOENT. An ENOENT signifies that a policy file could not be
>>>>> located. Since it is not possible to know if late loading of the policy file is
>>>>> intended, a warning is reported and XSM initialization is continued.
>>>>
>>>> Is it really not possible to know? flask_init() panics in the one case
>>>> where a policy is strictly required. And I'm not convinced it is
>>>> appropriate to issue both an error and a warning in most (all?) of the
>>>> other cases (and it should be at most one of the two anyway imo).
>>>
>>> With how XSM currently works, I do not see how without creating a
>>> layering violation, as you had mentioned before. It is possible for
>>> flask_init() to know because the flask= parameter belongs to the flask
>>> policy module and can be directly checked.
>>>
>>> I think we view this differently. A call to
>>> xsm_{multiboot,dt}_policy_init() is asking for a policy file to be
>>> loaded. If it is not able to do so is an error. This error is reported
>>> back to xsm_{multiboot,dt}_init() which is responsible for initializing
>>> the XSM framework. If it encounters an error for which inhibits it from
>>> initializing XSM would be an error whereas an error it encounters that
>>> does not block initialization should warn the user as such. While it is
>>> true that the only error for the xsm_multiboot_policy_init() currently
>>> is a failure to locate a policy file, ENOENT, I don't see how that
>>> changes the understanding.
>>
>> Well, I think that to avoid the layering violation the decision whether
>> an error is severe enough to warrant a warning (or is even fatal) needs
>> to be left to the specific model (i.e. Flask in this case).
> 
> Except that it is not the policy module that loads the policy, where the
> error could occur. As you pointed out for MISRA compliance, you cannot
> have unhandled errors. So either, the errors must be ignored where they
> occur and wait for a larger, non-specific panic, or a nesting of
> handling/reporting the errors needs to be provided for a user to see in
> the log as to why they ended up at the panic.

Right - I was thinking that the error code could be propagated to Flask
instead of (or, less desirable, along with) the NULL pointer indicating
the absence of a policy module. That still would satisfy the "error
indications need to be checked for" MISRA requirement.

Jan


