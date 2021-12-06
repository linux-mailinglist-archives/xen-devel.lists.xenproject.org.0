Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DA1469CB3
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 16:21:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239239.414681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muFnn-0005XX-M0; Mon, 06 Dec 2021 15:21:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239239.414681; Mon, 06 Dec 2021 15:21:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muFnn-0005VI-HG; Mon, 06 Dec 2021 15:21:15 +0000
Received: by outflank-mailman (input) for mailman id 239239;
 Mon, 06 Dec 2021 15:21:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muFnl-0004E4-Ob
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 15:21:13 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22e65ace-56a8-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 16:21:08 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-nScjYSXWPgqcoBQ7azuCFQ-1; Mon, 06 Dec 2021 16:21:07 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3295.eurprd04.prod.outlook.com (2603:10a6:802:f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Mon, 6 Dec
 2021 15:21:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 15:21:05 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR10CA0081.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.17 via Frontend Transport; Mon, 6 Dec 2021 15:21:05 +0000
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
X-Inumbo-ID: 22e65ace-56a8-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638804068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A8yGCbuRfPLdHuumi0i8w7IofLM0p4XnO4lBTRfXeZQ=;
	b=TrENjTj+yxo8GsKg3cvJtdqX5a8ErI0nTZItG3ixpqgAMiXlEQPnrdYrbszwSJ7HapdVjc
	09odcVseQZCcTm/0buCdP33+Ka2SVpVI0Sq8V46HmDO+UP6J8Mzyh3B5fkmt5SNjIq3JIo
	UYbbMlHPswfxLXRuz+77PIhnTzMmQBY=
X-MC-Unique: nScjYSXWPgqcoBQ7azuCFQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hmtz5PN13TySJ9KDyuzzveVriKxOuf9ZXw39FzhnlmnFgppoQF4vwKXUUtiuJasRIcWl6w9ghUlyTbslzwcVx/WIAJD3EfuzeTdQ4qG7Mi2XmzFo1nD/3unF7TT3Vg1CJUBkkLxSal+jn2TEMwnPk4uGExJMbM0JBkosZ7fIF3MAMFKJqIdjA2O9z28quMDkusAEIFPF22DsC1Vnn9umnTgqscQWQ3XWHIbTs8B2pA1PWV9Sp2uyR/aTP3pYcyLk9cPDI6uvBpRICmRVUYXPZ7WIQSfezxUQOclomvMCfNgF/a05XlgjzWZP5fzPiXVZ1eHLoArnK1wjbmAgP5rnJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A8yGCbuRfPLdHuumi0i8w7IofLM0p4XnO4lBTRfXeZQ=;
 b=b2o5dMwfX5UoDwFU6pHVYmmTu5PDNP3gz+X5VM6eB+DMvcCha4G4W4DhkhWojei12sBz6oZWC6IuPvLNstgICFmoukoBrjfeoDYq30LmcUqBsaCUTIhT+OS7nijwDEP6RgL65FgwYfLmSm1eBc/+DSdmqzcvsch8l3imTQGZ5ROgoPzUwXp8CV5VEPhklbIdUIWdcONgGmxc6Gl04SFdffVrJeBLm4cmek2VENFCcRFLWGwN3IoKgQZ7uN3u7xEGTnI9+u832/2/meA2KB49oh9sHui9HcX6loSu91z0Rg3EObpnSkoTX3xIjHXgrJNoOjxnLckuB0xOAC1Z0vWHrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b0932fc9-b55c-59d2-29cf-e0ce76dedcc0@suse.com>
Date: Mon, 6 Dec 2021 16:21:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] x86/boot: Restrict directmap permissions for
 .text/.rodata
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211206130855.15372-1-andrew.cooper3@citrix.com>
 <9ac98bc7-5b39-3c88-556b-53a5fdeb2445@suse.com>
 <211f1b19-5f36-3153-bdc3-d904193b3643@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <211f1b19-5f36-3153-bdc3-d904193b3643@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0081.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c95e97d4-eb28-43d5-f6fe-08d9b8cc059b
X-MS-TrafficTypeDiagnostic: VI1PR04MB3295:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3295A6F8F9E17211862A61CFB36D9@VI1PR04MB3295.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3FzUCNNRLXMc3aLCckO7Ajhw7X4jBdC6jBegs8OQjFxWOkfC6QeTraIuummnF/oCvvombvRE3PN1mNsS4LUwtaEnwqM+V/haBhLc0GOZrtm6+/rCf8fjVUetknNg6b3+8aNqsheACWITS9Q7IdBYvjPZjdmFaLxfQ0tv2esenhC4rr0fLJA/qrN3MeIv9cOe56bevOhKLqjoaUzZYdhcR4RDx1Qwc8vhTfS1WBzUhAyR6sC53QeHeq4En1QcWxp6kV3Z4tLmivopI/Nq+NrpV1Rl8+/RAif44oIMez5pChxYYQtjDk7pzu/nJunosKKpgqy1rJmTbWEB4fBLcUpqKhEY5mSLq5OSgzyDwuCtnXzMNd6Ob96qUVJ+PsKk++UghtT9+b5lplnNGvP6dIDyQAEESoRd2QjFq/byzvHWtFXdZvu4wZ8+lnPObHh5P1pxsCiXG1Kmag9nZsgs26FyFdNHvqevtBeoEk0mRrFIZ4OAxteVp+t6K/B9LMANFTKB27o/8NLkyWCJ4U9IP7K5ttj8UcrbVxgv+R6EFu8waQhk2OV++/XO4OfLLNwlsH6txYZt5kMjEzAiqqd+YVlF3Xa7dCl6ACfPcIBh94dxhVHsSXhfE1fVGQhQY2dWeCR2pzganvB8dD+L7HmXLumUhUyBkd2FqFjEunG+bmVxMtvRsquKXOmf64Kd6ymHHW9S2xepLqBDMGA8WN97vMZkicOOQsPs9Z1B8VS4TBFIQP+6vatPt1Jv8y31lIIb68o09tdE3gFOfOvZujvtMCQ6rA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(16576012)(83380400001)(66556008)(38100700002)(110136005)(5660300002)(53546011)(956004)(36756003)(66946007)(4326008)(26005)(508600001)(66476007)(6486002)(8936002)(31696002)(8676002)(2906002)(31686004)(2616005)(186003)(54906003)(86362001)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2pXSzJKaGZtMjFMNi9Wc1ZqNFhDb1p5RWVOTkZKeDB0c09Jc3lWYm50dEsz?=
 =?utf-8?B?YXczZXhab2Zmc3NVVHI3QURJbXZWbGR0Y3Q1K3lSZzltdnBtbTlEWitWeHI5?=
 =?utf-8?B?U05sNGNiVlpFZ2toWDRlNjVxTlh5Qm1mZU9MWVJTRHY0a2c3a3VKSlB2Y2FK?=
 =?utf-8?B?MmZ2OWY1b0djcGJqc1RGa2h1TVcwQkdTSGpid0ZBd0dzY0lHOTM3WmtuQkRJ?=
 =?utf-8?B?ei8xVWNKWmlrU3R1bEd1bTY2WTFTWnN1akJlZ0NJeDJISXRZUDlHZWFmSTlB?=
 =?utf-8?B?eE9YQVVpdWRrSGNoZ2ZDUFExZU8ydWRyWmEwck5lUXVpMzZwZ3NZUTl5VUIr?=
 =?utf-8?B?NkViZ0hjaFBBV0lzdDFjUjUrRkpDYmFCalFhRHo2RXN1dDc4Q0JkSERmMHAy?=
 =?utf-8?B?dGg2VTk4Z2RXUk1Sd2VhR005N05zK29vcm9hZTlBN21TSGJETExvZkozbTVo?=
 =?utf-8?B?ZlRaay9uMVBNRzJSSmRZQVZLY1YxNExmOVQrMXpCazA3cE54dENoVkZRbDhV?=
 =?utf-8?B?WC9XNDUyT0ZjS2dpWWpDVXE5bThNNVBncDhGdmRoS0gyK3JTNWRmSzdCWnA1?=
 =?utf-8?B?Yk41eDlXeHdzc0VkUUxZcUluNEh3dk5ZblFqVEpsaENuRmJxSkNzSnhDMDND?=
 =?utf-8?B?UHcwbzdtbTY0VnUwQWZxaDJYenl0M1dqbzh1WDFLMEpXRXphRFJwWnpvR2FN?=
 =?utf-8?B?d1JIaG9yaW9yUVVkYXNDanBLWkpqVm1lTVBZc0YxcUJNYUxuQVNjVm9sT1Fw?=
 =?utf-8?B?QVY5bmNyUWs2WVFERmhIMVVVUlJLM0Z4L1lCOGN6NXpJY2pINHlyYW5qODdo?=
 =?utf-8?B?OCswclZzU2EvOTh2MzRkaGJaMHh5ZlNTVVB0SFZsM1pQeFNzQ1RsbzgxUFhx?=
 =?utf-8?B?dFArZkhxYTFZREVmeGpRQVllS2NKUGFnK0J4VzdBb3ZvbjhiNmFwcEM1YTc0?=
 =?utf-8?B?NVZTMzVzS3d4ZmZmblYxRk5zM2ZaZ2NHNnJSLzd6azFjRE1HN2haMEYrTnJn?=
 =?utf-8?B?VFNESUZaZ25STE9jMjJ3MXJKUDRRVXREdGZrZEtneStqeU1hdmpLck96S2tw?=
 =?utf-8?B?azZGSExHWlZqNDFuV1Q0OWVNU3BqMXg0NTBVYnJoOUo2bWhWdjBIa0NlNTRs?=
 =?utf-8?B?RStmQ3JHUnBlcGdaeWsrOGMvL1RnQTgwTWdSMlM3WWp3UG9SMFFQaDkvVDJW?=
 =?utf-8?B?TElyTUhwSGpNU1JHRjJUYWszZTgzR0I0elE5a2Izb0NLYnRxbk5vTVdOQysy?=
 =?utf-8?B?ZVpYL2o3aklyM2NORUxNVFJGaExqRVQvUW9ZNkR5RlpyU25vT09rekVYeURM?=
 =?utf-8?B?REZwS1o1d2p3QkdYN1pXSnYzOTg4ZGx1YWo5RVlBS05acGhqckpEZTg2Y3Zw?=
 =?utf-8?B?V2theDk1ZmxGSi9SN1RFMHVYaGtvbExNeE4zUEJERHY5ZUZRakZURXl5OUsz?=
 =?utf-8?B?cjA1QXVUd1I2YjJoSjZHV0hpdnB1R2p3WVFBMERCWjFjMXVKQ3lTR1NpNG9V?=
 =?utf-8?B?bmRqRjBoQ3k5U2MrdDR4emYxa1g2ck1KMFEzZU5Xa3UxQjd1VSs5RkdZVnFW?=
 =?utf-8?B?VTJlZkRNSE1zUWFHSDllN3lKWC80ajNwVFc1M1Awa3hJQStuY0FCNC8vRXhT?=
 =?utf-8?B?eWJFRDlxdk5WL3MwYUk5ZzBZL1F1eHltcDZnWUZYT2lrTTFFcFhsbGljelN1?=
 =?utf-8?B?bStzajJIajExbDhMWHI4dkhBUTd1NXdaWjhWTFA3VXA4ajJpdWpGRXdHVFQ4?=
 =?utf-8?B?UEo5d3owU0Zzemc2dEJYZyszbi9XdjNKejdPS3B2Zkt0L3llajZwblFlQ0h4?=
 =?utf-8?B?OURjckU2TmpoTGxFelZzbGdqd1Q3ZThJTEFXYUlmVSt5MUgrb2s4N3JlSm80?=
 =?utf-8?B?WHFEaUdIcXlpQ2dQM1VLUWtrUzRlTkpkN3VOTzZpQnVtYW8yMnR3cnJLYU1D?=
 =?utf-8?B?RzFWeXNkRlZaakFDSlptWVFSc2pGYXljbkhDM0RVT2t6UVEvdXVIa0VGcGJ3?=
 =?utf-8?B?UStub1VOSWNIYXo1UlpOQkl3NHZ3RGhuWnYwdjdvMVNlc1BiZHdUdG9laE9N?=
 =?utf-8?B?aUNjV3U1UU9zZEREeHc4Yzl5MFUycTJxNHM4M0w0V0JwUldhQmtaOFBJQy9B?=
 =?utf-8?B?cjI0S01uVGlXSnpLNktyTjNoWUdrUzJmN0kxbFFFR0FMT1BDRE8vdEhCWE9t?=
 =?utf-8?Q?FFVW/fqS6dy3CJp6bIRZzXs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c95e97d4-eb28-43d5-f6fe-08d9b8cc059b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 15:21:05.7811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IB02vbxsFbh1MfqeIa9zwdUd27xLiPSzouHjWuKCv4+PLboFI9IN5YeNJiqZ1BXzLul7htNm8s5+KNMr+LYrxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3295

On 06.12.2021 16:11, Andrew Cooper wrote:
> On 06/12/2021 13:58, Jan Beulich wrote:
>> On 06.12.2021 14:08, Andrew Cooper wrote:
>>> While we've been diligent to ensure that the main text/data/rodata mappings
>>> have suitable restrictions, their aliases via the directmap were left fully
>>> RW.  Worse, we even had pieces of code making use of this as a feature.
>>>
>>> Restrict the permissions, as we have no legitimate need for writeability of
>>> these areas via the directmap alias.
>> Where do we end up reading .text and/or .rodata through the directmap? Can't
>> we zap the mappings altogether?
> 
> I felt it was safer to keep readability via the directmap.
> 
> I'm not aware of any logic we have which reads the directmap in order,
> but it ought to be possible.

Could you add a sentence to this effect to this description, please?

>> As to superpage shattering - I understand this is not deemed to be an issue
>> in the common case since, with Xen moved as high up below 4G as possible,
>> it wouldn't normally live inside a 1G mapping anyway? This may want calling
>> out here. Plus, in non-EFI, non-XEN_ALIGN_2M builds isn't this going to
>> shatter a 2M page at the tail of .rodata?
> 
> cpu0_stack has already shattered down to 4k, which is likely in the same
> superpage as rodata in a non-2M build.
> 
> But at the end of the day, it is a security/performance tradeoff.
> 
> memcpy(__va(__pa(divide_error)), "\x0f\x0b", 2);
> asm ("div %ecx" :: "c" (0));
> 
> is an especially low barrier for an attacker who has a partial write gadget.
> 
> The security benefits are substantial, and the perf downsides are a
> handful of extra pagetables, and a handful of pagewalks taking extra
> steps, in non-fast paths (i.e. distinctly marginal).

How do you easily know what paths there are accessing data on the same
(potential) superpage? However, thinking about it, with the directmap
mapping presumably not getting used at all, how the mapping is arranged
doesn't really matter (except for the extra memory needed, but as you
say that's probably marginal).

Jan


