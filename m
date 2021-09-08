Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17065403824
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 12:43:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181749.329033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNv3B-0007Jp-UH; Wed, 08 Sep 2021 10:43:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181749.329033; Wed, 08 Sep 2021 10:43:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNv3B-0007HU-R1; Wed, 08 Sep 2021 10:43:29 +0000
Received: by outflank-mailman (input) for mailman id 181749;
 Wed, 08 Sep 2021 10:43:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NNqu=N6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNv3A-0007HO-J4
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 10:43:28 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c7040d2-cd60-40e5-8b52-ae17bc609e4e;
 Wed, 08 Sep 2021 10:43:27 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-2m6IG6VnNLCd58WGwDgg8g-1; Wed, 08 Sep 2021 12:43:25 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4384.eurprd04.prod.outlook.com (2603:10a6:803:6f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Wed, 8 Sep
 2021 10:43:24 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Wed, 8 Sep 2021
 10:43:24 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR04CA0005.eurprd04.prod.outlook.com (2603:10a6:208:122::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Wed, 8 Sep 2021 10:43:23 +0000
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
X-Inumbo-ID: 4c7040d2-cd60-40e5-8b52-ae17bc609e4e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631097806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6/VVPUxhJU9k+lxB/ME4qx3Y4zC/7I21qhXyIqu0Ua4=;
	b=Qv/jZFFVWtzBUb37FERgOJP3t9Zcmu9+QlQLkLTb7sMgMDD3swi1mb2itkFBftX2kvMXmq
	D2qxAY2pt66tqiGYH1v7DP9sKuEq6fdZVg4P9EMlDE0nF4vb+/J9tu9zg8Gr6QXY4XZqv5
	wpaqdTnyKthpP5Sk8Cte8HDCcv4jqSk=
X-MC-Unique: 2m6IG6VnNLCd58WGwDgg8g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EtTJgrsJpdDKa96B5JuDxjoLX1wcsGZDK+9PWBGOvYrkxjyzFRrxzxJYWgVtxOowi5CYTTijJGJfuehsgeSbpvQYoalIQFZiLa+rYin7wTtkLndARr7ZFt2MVupxhBPtA839WRgR6IJ+jkKbQL/ObU9b90wf75vy8YNeEw580D8HVPoPDrC7xJWpgInhqeilHkrkzN6Ob0rsj4P9P3GK8yWSGYCipLR7nMGY06IpQjvPMCdU/jqUg2Bxu7QLqIqFzC42J8xbARMsA19tZsp7eGxNyO19uAEsQj8H65Kef8iwd9YYwz03XyKsSJb9dd8TBJuUdlut0AYt7JU5pGx9Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=6/VVPUxhJU9k+lxB/ME4qx3Y4zC/7I21qhXyIqu0Ua4=;
 b=TT4MbePL+EEW4g458+wRgUgLp/ObCRunsri7wpKn4uBPcNhn+EZW76tCuqQmy1d0n9HMUPk0ovA+QM8RczW7yhM+AlUaq5736UirYpNlvW3llyZyHdOyQuKEvtnPUjffDjdwkKIqMVdT5J4kLVwRZxvUoZ90Em6Ny7IKhnt7VmULC4033YZ1CB8jZsnCbYmCE6u22o8h3jWlgTN121j4pFwX4raLWGPdxJtRgx36RzR8679BK/MrrZPXdECizC+2NIO2jS52uR5g4LrmI9XPdIOm66VpuTmuhUKXyStYNFuHTiRmhZZojDPZ+l+bN4hhQESfrTlmO3IOXNLnkXgxdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 3/3] x86/amd: Use newer SSBD mechanisms if they exist
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210817143006.2821-4-andrew.cooper3@citrix.com>
 <20210907161908.17402-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1fa45e94-ecd8-8920-1f08-027b348a71e1@suse.com>
Date: Wed, 8 Sep 2021 12:43:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210907161908.17402-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0005.eurprd04.prod.outlook.com
 (2603:10a6:208:122::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2974fa39-e0e2-4986-1473-08d972b57bbb
X-MS-TrafficTypeDiagnostic: VI1PR04MB4384:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4384C4F47EC4720E3A915DBAB3D49@VI1PR04MB4384.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ytJvn9LIvS/BYip1OR527o0y+Dx980pEnCK7xsQMETl5yJM1/7GTGlcGqPP7WEypUNAT2sVK+KelGUKqQ4dSLvFaTb64OsXCYJAruYIzoGuVGHmlRAZOcEEPoLtHQfJq0/OeQZZsjFzI51rm4DiFw+XqQqGOuZ/8JA9cYDPkn3e6k/rm0/dolfwIZG2rWGHkGrzQtA4fkPQGn/mLf8TIPQ98nPTlICTk46Gc8Qg/lukt3OfakMDw1FpxLofbbOIXDpYd28/qBivrc5xopFLHNsvv3ePllrNf3NcxFZjPLQBP/13sQrCPPwib58WmYaeyKuHsKnHLFin5kbphHA2/qET3tethmGZRY4R1oMcaigZkIhLflFbSBXvnjNuPI02GInE3T/yVxXnknpXZBDaGfFEG/3SdOdasPVX1KtKsleVex9gD/fYamV5dIr1gn2+mCu2S+cFVnWp71RBJtu5JyPzaiOuzR30c605kovdxUN6DXeCrD2ngCFLcMVfa9k/L8boxAI3a2RuXTH8CuNNs0XGbWGykaP15f7549gk86dYyITfDA5tpxlIPrHVCnuLK/0QqOromtLs/Kkx3wJHEijUjd5z3SIsTkWDBS6lNPcnSuG96aWf77xAdQrUWwUtpWRTN67Qap5I2jbmJ3fx7kfkHTzZntVt9T0uzZrtPgmqJu9l/p0OQ+OpmTpPpqn0YAY9F0CoGOMQqiRE+G1UF7iAkbYnjc4C28hYd58wzPcWlVJ+kq/4NR4VKuAMhiUoH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(39860400002)(136003)(346002)(366004)(16576012)(36756003)(53546011)(6916009)(8676002)(4744005)(956004)(186003)(8936002)(38100700002)(478600001)(5660300002)(86362001)(316002)(6486002)(4326008)(31696002)(54906003)(66946007)(66476007)(66556008)(2906002)(2616005)(26005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlNPS2tqU0VVTFlnaEh1Q2hmWWtpRmFVUW9wTWRiaEY4dUhFTXNkSUgrbGZm?=
 =?utf-8?B?QWszZzRNbTBvcG44R0pZUDQ3dG1qWU1kaCtkNlRGQzNWWUVVMmlJZGlEYlhJ?=
 =?utf-8?B?dzRIbVNGN3c4YlFKazg5K0p2c1FSeUliNUEvR3g0QTlHQ0dUMTh4RXRtdnhl?=
 =?utf-8?B?NTFsOFg1TUEyUEdHS09qMDdPL05JUUtxVGFrelNid0N3bTMrWW84aU1weEps?=
 =?utf-8?B?QXp3azNkMldWbGVPRlI4ZUl0aEhBVmx2MWlrQ2ZjaVBqVTg0cE81MDdkb1JC?=
 =?utf-8?B?QlpKalRtRHhlS3YyeDRIMnJmNEpGZGpaa0VKaDhuUnJUZ0UwYU1mZkZtRjA1?=
 =?utf-8?B?ZzJWbHVyNTk4TlA5RFN6YWx3NXQwZVVXRWJRUkNoSGtVbjdJK1JiS0ZpNytL?=
 =?utf-8?B?Um1yWkgzR2NaVDU5blU2WmxzbTM5K1dldzUxWGFiUk4vYXNQOXNwd3hOdm85?=
 =?utf-8?B?NUR4Q29jWkhXREtIcytDazRXaXd3VHR5QVRPem1ZNUVOMU9WbVBvWTRTdXUv?=
 =?utf-8?B?Qk1wYW15WjU1NkdhZ0hTZFh4clhBYkhndzBrL1ROcldjYVZYT3FTalMxTTcv?=
 =?utf-8?B?VDVwai9sQUE0TFE5UEI0NmhDV29kYjZHeUxvUGdKbTV0Y2hHYzdXS3MrdHRr?=
 =?utf-8?B?clpPZ2xJUk9YNVYzLy92cElranRGcm8rRDl3TW83NG55L3hFdndMV0lBNFFG?=
 =?utf-8?B?MjAxL0o3MmdhRDJqODFmR0ZieUw3YmtJK3EwcHBzMVZoWkdLejVwU3VsMFlz?=
 =?utf-8?B?YjBQTWtRS2ptQmNPWURmcThRNERJN1VnWjByRDhZTXoyL2RTS0xIdExnbUFi?=
 =?utf-8?B?VXhwdU1XbGszL1B6d0pYUlplOVJOdzcweE5GZGhBS3E0WS9xTVRYMCtiazFO?=
 =?utf-8?B?SE1DSkE0bUJaNzZYNmNQaUxCbHBMd3o5bGFXQ3ZoMEF4ZHNKU2JlSFF0TXhK?=
 =?utf-8?B?NVRBU1VWUDN5V0NUTWRRMnZDNFlaK3MxRGc1NzRUdDFtWU1FejdpRWt0ejcv?=
 =?utf-8?B?cjhVbVNMbEFFcUJWNWpMdld5ZmJpRHZyRFFBL3F5ZDNWclh4THdlOVhqczYz?=
 =?utf-8?B?d1g3R3RkVmkxZWxGL3JHL3FRdU5LUUlPM2hZN3ZXWTkzeG9xbDEvKzEvQTla?=
 =?utf-8?B?Y1ZBZVFVSzBNaVkrbmM5YTZJNWpSbXlGY1NCcGF0cERJV2VkM2ZzMnl4U0M2?=
 =?utf-8?B?NlJManlHbGliTDB2K1MyMlhRWGZyUHdScWtSZE1QTzR4L2dQcFZLRmZOMHp1?=
 =?utf-8?B?RnhNMmZqdXdScDNFYmNwWjFGNzAzMEg0blQ1QXliVUlhamczS1VpS0ErRDdo?=
 =?utf-8?B?Y09Xd3g0OEVHN1hwY3BzVXFSUEFIQW9Gbkd6MlZDZVNoNnZwY0FoR3A3MjF5?=
 =?utf-8?B?NnpHbk1aL25hOEpERTRTUlMwUlJpSUJPQUJiMEVJbVVxM2NjM1g3dE1zR1ly?=
 =?utf-8?B?N3d6dncyVnpUeSt0b2xDZHcrdkZ0eDNlZ05UbmVWaDlCVlJqZUNrTHgxTzNh?=
 =?utf-8?B?dlpFWE9VdXJqWVFXak1hWTBpd3RyZytsYTRJYlZiSVUyVmlmQ0M3a2tsbEpB?=
 =?utf-8?B?SEVPMEZ2SmhQUHB6a3BvampBUTJLcnhPNnorUVBMaitNRHBQdGFrY2gvOWdN?=
 =?utf-8?B?dWtrS1VsVmtTRnRMSkxXbzZMZmRKaUJJYTNPR0VZWUprZEo3UUlPQUpFSjlR?=
 =?utf-8?B?ZThkRGZzUFNsQnptZnIvdERuWHM4S0VMYzZBQ3EzbjltejEvUUJXdUJGMDUx?=
 =?utf-8?Q?ET4nFEcWO1w0NdhY8SDp3Lqa/iqYPl6AmgTq3W2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2974fa39-e0e2-4986-1473-08d972b57bbb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 10:43:24.1290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7EpAq56XH6YiOn2fBn2mlCNzgB14T2NVhkTTqJV2vo8m5HCko4W+aOj4u63PDnbfYZ4ZPXgx6LsJaYyA4gvKYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4384

On 07.09.2021 18:19, Andrew Cooper wrote:
> The opencoded legacy Memory Disambiguation logic in init_amd() neglected
> Fam19h for the Zen3 microarchitecture.  In practice, all Zen2 based system
> have the architectural MSR_SPEC_CTRL and the SSBD bit within it.

Don't you mean Zen3 in the 2nd sentence? Otherwise there's a missing
connect between both sentences.

> Implement the algorithm given in AMD's SSBD whitepaper, and leave a
> printk_once() behind in the case that no controls can be found.
> 
> This now means that a user explicitly choosing `spec-ctrl=ssbd` will properly
> turn off Memory Disambiguation on Fam19h/Zen3 systems.
> 
> This still remains a single system-wide setting (for now), and is not context
> switched between vCPUs.  As such, it doesn't interact with Intel's use of
> MSR_SPEC_CTRL and default_xen_spec_ctrl (yet).
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


