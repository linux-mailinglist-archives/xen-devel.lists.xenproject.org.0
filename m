Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9B23CD513
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jul 2021 14:47:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.158390.291600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5Sfo-0006Fc-35; Mon, 19 Jul 2021 12:47:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158390.291600; Mon, 19 Jul 2021 12:47:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5Sfn-0006Cv-WE; Mon, 19 Jul 2021 12:47:04 +0000
Received: by outflank-mailman (input) for mailman id 158390;
 Mon, 19 Jul 2021 12:47:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTRW=ML=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m5Sfm-0006Co-LG
 for xen-devel@lists.xenproject.org; Mon, 19 Jul 2021 12:47:02 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 68decaf6-e88f-11eb-8b09-12813bfff9fa;
 Mon, 19 Jul 2021 12:47:01 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2053.outbound.protection.outlook.com [104.47.8.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-NU59TSSzOmy5f81apEmkrw-1; Mon, 19 Jul 2021 14:46:58 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4845.eurprd04.prod.outlook.com (2603:10a6:803:51::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.25; Mon, 19 Jul
 2021 12:46:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 12:46:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR05CA0076.eurprd05.prod.outlook.com (2603:10a6:208:136::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23 via Frontend
 Transport; Mon, 19 Jul 2021 12:46:56 +0000
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
X-Inumbo-ID: 68decaf6-e88f-11eb-8b09-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626698820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yejCnSlCvMuRZqL24NmBaM2ZtEnrJ3V7NRIpXFIVvFM=;
	b=PRtAdTM5VQQl+5KA1RBLja3Fr2LtNZsWlEDQZrMpCjeIW8Dqc041hVffrQtaUkrSwlTfXl
	RE5PrNrNKLGbOtAd2L3FPkvOqwdnc6wY6daerbAruM0rZJfmsrmzFmFIgt1hlXGM9y3hOJ
	SlPBInPxw2YnyKfu3heBRqYAURafBUM=
X-MC-Unique: NU59TSSzOmy5f81apEmkrw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rcj9tPcXcuBDJ8bu1uvXvN58t76haV64wjqicereqgugfpHWZf+LfMg80eWaZ1cWFpyFPMcqv014jqXQ6401DtAsmZCEiopRt5A7td9Ubo5iTnIM6qvIgHQrWhI9MrczF7s0Ye1divLXAMZhtvXuT7XTsE87z1z5UdR+NXwf1zaeTrjUie6a4o3nNYkJraTc6wWAkT02TBaMx8epdVYJZujw59JHg5q/U8tCXNHjxli4uAqrOwdOv6wKNHZ9X50Gh0jIj3Rv/e1VMwJf1Phrwh3Eq1FnWfU4q5VXW+9Tshsy/aLyKMvJAbuFymV5ZPJO87/JPChPmdkoenQaiyTdOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yejCnSlCvMuRZqL24NmBaM2ZtEnrJ3V7NRIpXFIVvFM=;
 b=e4TTIOVAtPmw2WE0ocs6r8OmNuqSTFkrN7eDJZF53215bXcyCkBw8gAW/Q050OVAQ/GyIq4NyaRNNTeLez7p0+CB54RP7TDgl+ngX1Qg0VSlMxoRf2hmsJMPJxJ8wkl82I/QvMNscTbTffF398r3qvtpi1Khqauw3NWwUFXWzyuhasvIxhc/yItjSctivSYe4Mj4eVBMCJsbnRXwTcrzbY9nVmsXohnLfITvQ8nxgj0l9O8iXnHDk8nF2nUBUs+R0d3WRgCYKdsqA8V2PQ366qB9QCxxNr5Dvnw8lwrYF5MRZ+OexUJ8ZxdsjcSiV3alx6l6n++Kc8F23r/oEVxSqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86/hvm: Propagate real error information up through
 hvm_load()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Igor Druzhinin <igor.druzhinin@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210719111449.21337-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2b12abb9-4fde-f21a-e763-38de14847e3b@suse.com>
Date: Mon, 19 Jul 2021 14:46:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210719111449.21337-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR05CA0076.eurprd05.prod.outlook.com
 (2603:10a6:208:136::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da82c196-8a05-4a49-7ace-08d94ab34af9
X-MS-TrafficTypeDiagnostic: VI1PR04MB4845:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4845E1B0765D94FB9BE3D838B3E19@VI1PR04MB4845.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zt7tGXkxDS+SAC08U+khyp9orb9WmVXhbqN5dS8YezQF6kcVEakvZJx7ykF9jUrMPwrGTh8zd9GLdlvOv6NcOPsJdF/j+nmDlCL0foPdCPNycJRO4eIQmMxv2lPKiuiijEH2aghLCUPmDnvuC9hjk8JvCxtJeVdvsvT4OGZMDwWQnmCssAya2kHetVtrFbcAhMiXq2nuMKya/V8p6Yr/dgvVIZEZhWv98gMRR0BOWE3iqCB+rQrclOYAzWv62bBR8QCMJ5uQSdBqV5gUbDxvUJre1WjzW2VVydKo9caScjlyWKgBv8vT4jlqWRYMZORiBlu9hLTNSqMf3eqAbXafd0DRrx06rwVV8/BvrkhJAzfhAvmoDS9FfjsSzg56s420JQHpAGoxeaFGn1vNPHW0B2wdAX1ILMiTienR1S1wgJ9IiPfZq0qTRYEvFq1bu2tUzoAokLt1IGHzAiZG+Q1ox+OOmDvwQCQh42qL/aDeQFCXjQu61kSDnpBWnmgKrwtlKMRwgM+8DMTEVjitTxbctW0ROZmn7w1B/x28hZfbfTlMDiGsNAgaQD24VqJcgxa7UTIYGFhiOXRUtg1bMsePR2xQmizcl4TABlFiNi0IwizyNokM96pXqacJpnTAYaxy9f+BLe772sV0o5dNxvxt6T+I5jRpE5TvFT429wm/0vAEuWuzdlprNOhVgUd2j9hodb9vYBTN5zKyWGFoo3qWu85eDgXaDCE0IZc/DNNkFxc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(66946007)(316002)(66476007)(8676002)(956004)(8936002)(16576012)(6916009)(83380400001)(31696002)(36756003)(186003)(38100700002)(26005)(2616005)(66556008)(53546011)(508600001)(5660300002)(4326008)(2906002)(31686004)(6486002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjA4anJWQ3NWYUxoOVo2RGZPeDhUUDhTK0VwdXJOWmlXampac2xnSTdFbDhM?=
 =?utf-8?B?N09jdjREOWJPTjBuY1ozSTJpRWhSaml5VkNXclZnNHNicGIycEdSWWt5aXRi?=
 =?utf-8?B?UEtSeUJIZUpIMWw3cWRVZVR6cXlJa28yc0pSN1ZFSDVRR1hKMVRjWTNBVUVj?=
 =?utf-8?B?TWNOazl0a1MvUmlwVGppOUljMkJzT2dwZDZkVjVtMWNxeEZnNTFKQVJMK1Np?=
 =?utf-8?B?SjZXRXg2ejdpbE9LQ1h4bmpJZUI4R1B4VmhyU3d6cEo0MVNFZlFlUjk5UnEz?=
 =?utf-8?B?U3lQWjlMNkYzRG8wMDkweVpNeklveHVFb1QrSmQ2VzFwTS9FY1hlcnJGUE81?=
 =?utf-8?B?QkVsS1l2RlU2WkZBZzVTTE1OZVRJRHN0UmIrNlM4SlFJRUV6Zk5aWk9jVTRK?=
 =?utf-8?B?TzJLaHZUUEZ5ZW5sTHN6T3B6U2lGSHdxRG1rUW9WcFdUWGRGTE1NdUprQWd0?=
 =?utf-8?B?MHdadHBJZk9vMXJybHdSTytOOW4rSHplSDZRaC9OL2VWQWpueXJGSVJDWHFx?=
 =?utf-8?B?bDRQRWlhWlREMXptdXhwTVhIZUNLUCt5a0RIYWZ2QlQ4WnI2ZFVVTVJWNWpk?=
 =?utf-8?B?QkFjT0tsOEdoZEV4Ny9Xbi9vbnpVT3NPcUJNQnNoWUFoVmdwSWVjNHEzOEtB?=
 =?utf-8?B?clFCTEUrZjk0VVlYQk11dVVoa2hkK1hVc0F2Tm5Ha0V1RmU1ZG5YaGNOeUdY?=
 =?utf-8?B?b25RRkkvQ3dVQWtDNitxZlk0UXk5MVlMZS9XWTNkNWxMMXpMbVV0S2g1QW13?=
 =?utf-8?B?MThJNzVtNERHa2hTa0tsdkVyZTBVbkNaTndtNHJvcWpBdEo4Y1ZQOEtaZFIw?=
 =?utf-8?B?Wm9ZSkJIWGhMVGE4QlhmYU13QktrMElBcTIwZ0FFa2RBa0d5NEU3WFdZbjlt?=
 =?utf-8?B?RnMySWxCWitTVU1hQjFMcWFRcTFDYlp4Y2tia0YxaTdBSlBzbHRESzY5bHNM?=
 =?utf-8?B?R29kU0VyM2I1bzlmZlJHeDZsWjJQTVZzbHF2b00xQU1HRTJEejJUMnVGOFhu?=
 =?utf-8?B?QVFSUHhZV2ZYa1RwZlRtbGZUOUltMUFMSmRmTHRLTDZyQllHM0ZHbU5Ic0w1?=
 =?utf-8?B?d2dFYnZKbUp4VWhYTnBHdGNndXBSU2xZSGpTenI3VmJEWWUvMU1nckhRNmV2?=
 =?utf-8?B?UG50MGZWTjVjU2NuN3pmWDd5dTRZcXZ2aHBmTWhLbFQrbm9ZK2xRcnVuNGQ3?=
 =?utf-8?B?SkNMM1gxVlovampzcXJMR2JCQ3lXeHhhYzdSWXJLcGd1blRCVzlBaTBBYmZL?=
 =?utf-8?B?V1FiN2VQV1pUcmNEQzBBaEdFYWsyK3FobytDTTJQZUtmT3ZmMGNMK2s3VHNy?=
 =?utf-8?B?UzM1alBNOFR4cGYrc0xlTzZpZUlDcFpVanNsTEM3d05xUk5qRGc5dDZNbzY1?=
 =?utf-8?B?ODVkZjI5OWxPUmdrVmY1YVFJRlBlbWliOE1ydkQ0UHBjUGFONGpETERReXhM?=
 =?utf-8?B?ampDMURub0syVDNUQ09EMi9OOUV5RWlQVkx4R2RNQkhVQWtpNlZSbWJYd1gw?=
 =?utf-8?B?d3dvQXI1eVNSOWx2eW5oemo3bVlSM3gwN2ZwUFREUjFyV2hiTFVMWk05a2NW?=
 =?utf-8?B?cmRJZytQTk5ueHZ5ZThrNW44a1cwUGhGcDZ5YWRSQTFrTWd3OUJFNUE3LzdC?=
 =?utf-8?B?Z09qYkVKQ2hJRStIaTNLTW5VQ1g5VCszU2h4eDY5b09SanJTeEIxdUo2Mytx?=
 =?utf-8?B?YkREY1ZGSG5SVmJ4Y2NxY2Z0MWJkZ01DSHVSWnVWOXB2UU5kMHVlWTJFYkQ0?=
 =?utf-8?Q?W6mnxOH9iZJRIpprn9BSBYgv+m5Ue1WIf7lsRtN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da82c196-8a05-4a49-7ace-08d94ab34af9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 12:46:56.8590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9eJK4pIHxBZSt4CKxk5zVN1bBkWXIAPQpec6Lb64LI8kEpoX6Ss2WdaygKzuhKdpGbBF2fNBrkz6lGYesO7vjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4845

On 19.07.2021 13:14, Andrew Cooper wrote:
> hvm_load() is currently a mix of -errno and -1 style error handling, which
> aliases -EPERM.  This leads to the following confusing diagnostics:
> 
> From userspace:
>   xc: info: Restoring domain
>   xc: error: Unable to restore HVM context (1 = Operation not permitted): Internal error
>   xc: error: Restore failed (1 = Operation not permitted): Internal error
>   xc_domain_restore: [1] Restore failed (1 = Operation not permitted)
> 
> From Xen:
>   (XEN) HVM10.0 restore: inconsistent xsave state (feat=0x2ff accum=0x21f xcr0=0x7 bv=0x3 err=-22)
>   (XEN) HVM10 restore: failed to load entry 16/0
> 
> The actual error was a bad backport, but the -EINVAL got converted to -EPERM
> on the way out of the hypercall.
> 
> The overwhelming majority of *_load() handlers already use -errno consistenty.
> Fix up the rest to be consistent, and fix a few other errors noticed along the
> way.
> 
>  * Failures of hvm_load_entry() indicate a truncated record or other bad data
>    size.  Use -ENODATA.

But then ...

> @@ -421,8 +421,8 @@ static int pit_load(struct domain *d, hvm_domain_context_t *h)
>  
>      if ( hvm_load_entry(PIT, h, &pit->hw) )
>      {
> -        spin_unlock(&pit->lock);
> -        return 1;
> +        rc = -ENODEV;
> +        goto out;
>      }

... use -ENODATA here as well? Preferably with the adjustment
Reviewed-by: Jan Beulich <jbeulich@suse.com>

I'll pick this up for backporting once I see it in the tree.

Jan


