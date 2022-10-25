Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D4B60D146
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 18:07:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429979.681376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onMSK-00075f-V4; Tue, 25 Oct 2022 16:07:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429979.681376; Tue, 25 Oct 2022 16:07:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onMSK-00072j-RC; Tue, 25 Oct 2022 16:07:08 +0000
Received: by outflank-mailman (input) for mailman id 429979;
 Tue, 25 Oct 2022 16:07:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1onMSJ-00072d-J4
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 16:07:07 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060.outbound.protection.outlook.com [40.107.20.60])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 121db4ca-547f-11ed-8fd0-01056ac49cbb;
 Tue, 25 Oct 2022 18:07:06 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6816.eurprd04.prod.outlook.com (2603:10a6:803:12d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 16:07:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Tue, 25 Oct 2022
 16:07:04 +0000
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
X-Inumbo-ID: 121db4ca-547f-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KDPN+FqH+RaQd3k9a79QIn5TyVCW8dTbwyGlKx/eXE/TCRFvILheIYANDPPwfgM44krADcLVilY8w/pjq7RkEvQ9H9rZjWZYeXWuH0M5TgDXVXHXP1iePJy0/8mjmKNTAD5HlIZxF21MyrAfswR2lfWthQvIntGF7NwsThlTQzzZRI5sa95sz5i1pKuG2RsNYQae6+SM88+01tUjKzXu1qkwXPsgtlFGJBI9x1+Je2JE2ulUU6rzunX3+vbRq2YBReIlErz4UoCH07jLNHpgej+ssTzqcOj7TK5URpIrzvkja5ZrF0b8zXKpnI3iv/USafTCF5yJRXqCPJmpo+287A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kzDs02ECJydrm9OLb34e/Go0RUqZDfEPGFdVioZAiaU=;
 b=IeubrjZQHUqOXqmDMeW3IP4C9NpD2Jp1JYMkOo82DQ68CNE5RZ9n7ZLE4dpMr63YDoSL3kG9rJryXk18edFKAQWeLTvO6+MEDkKKGM0Xo2zRq7IwjVDFKFz4ZpyuVqfn/Y+CISTIV0keemEuzSsomujx3GNz/X/eu8PWUWAImy+4EF/AZh1cQnGKTL42o/2KPSBgyxnqhJ+c9RYqG0Rc57mKmz6oNwECTYi4zBSuxQMJTIAy6ZdRC2aiFEekHIa/gkhAwTdAq1p8IhhUCluSbnYXHRe7nSiLfLHwBVEodTARljlOyLrQJ/mi8Ez7eMq0IQjkOB6ifWBoZNIZ+5lPsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzDs02ECJydrm9OLb34e/Go0RUqZDfEPGFdVioZAiaU=;
 b=hH1C3HgUEoE5G2BcEDg2kunX5Tm4centqlkL1cfRi462eSk9/bgq68ahqT9bRLnGst3wqqLJvrojeSC/OFpt8OqWEkRaaS8Pt/YSt7+2wfF9O9k2FMdas4yGQdGIZXf7mGr3gYqEQx2VqGl9SM2Q/eGul3bnkDB960GDCyx/pmIcsIP7ABesPC0R30sJzWjJF+sSKkHPDPIP8flzr9ZMWjAxZVIxRYpQ1Zn+yJSD2FrXYxdBA/z2v+jI55qgVZmRcGvJbtge/eADQqlHXG1Kthzvcb4y5V1jKnRTiwHkuO/1xlBFoDa0tkZ1J3zOS+69+/8/lywR4Jjd9ROlq2vbfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b9c190ee-f916-b03d-e56f-0a54d93ba948@suse.com>
Date: Tue, 25 Oct 2022 18:07:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: [4.17?] Re: [PATCH] common: map_vcpu_info() wants to unshare the
 underlying page
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <b2382fad-e328-fb03-2860-cca93625f4bb@suse.com>
 <Y1gD7GmclguLZCM8@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y1gD7GmclguLZCM8@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: 40f65f52-0ca4-4fc3-f945-08dab6a2f559
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jbqjFQTL4K0UQhBddh8VsNYGjGC8Gi5Z4EGquzWANw9/IiZUDcAMKcS6qTibELbX8AiAASlYCMpyg1H2tAgQleILf/A4FDNf0dlfQz1cJfMc7pTHDdH00Tcq5qJqbhvBJy0o5lK1l2772vD9KtM8WNE20PrTfPjR6WDy2WQy6zkJ4pCacr1BEjUdptzD3/mUAmNPaQzFqw7sB9IdhPD/8B5bQjLoXoClQyIX6DrAcPB5WbQwztfWO0FZDx3XUZJxkltEHEiJfgvZlh8Yay6geATJtKLO9DjQ4y2Y9K3BGhyKR7m5ZQ5R/LMBLb5HNUIam2Y+87/4jkUGBmtUANnImk0Qd8RwFbwRptxl70LUGtLQmpbM4zHM3t+f8F9uu3g2HS/fz6ZBRGvLv9fo+HLdCe0WMhlQL7H7PNPBJSC4ERNxhLe5dr1IuC1H0B0FFgYEKRJ3dEOT7ZEjrNvHUlY3OS/o2Jg/QManFfUX1aApz5ND1H4fwo87tIMP5eO2tb8WTJirTOVCoDoyManuM8xmxwrhoHJzYcLJpgBM2GLW05eLYqBvD3AR3vSPT+javr5yJAOHILX+sAuKNXZQe0P3J05mLx4Nw0vNVWhwNj+dMcyV0GgO6pCppD3lhXwVU+wvwth6bafb2vF6ph02iJhjZE6hdfIpzqWvRL995N29Ttgjoh2seG0mVrBqApjSDAHleuW6T+0lpULiAY+ppIrtdKzeIsajh54QNCqtoaA15ZDX1264Ge2ZA4Vk7tqAfdojP8Gfw8B7Q6h84s+eQWR0yHOyrzWfJE2chSZR35SDtco=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(376002)(396003)(39860400002)(366004)(451199015)(66476007)(8676002)(66556008)(66946007)(41300700001)(36756003)(2906002)(4326008)(6486002)(6916009)(54906003)(5660300002)(8936002)(4744005)(478600001)(316002)(83380400001)(38100700002)(26005)(53546011)(6506007)(31696002)(86362001)(6512007)(186003)(2616005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTJmQnVaRVp3ZEQ0MGRDTWlrLzc5bUxoSnNON2xyOVhmWFRkbEhxOUxCWmpH?=
 =?utf-8?B?R1hTVVcxdjhzdTFHTkFWOXNyZTV2YlhEWEFPejRLbmhoRHVLUTlaOXhoLzlW?=
 =?utf-8?B?VWJlN3M2aEN4cVdPWmhicUJMSEZ6T29GZ0lkaUdwWFl3OVY5OUZpTmhxcHVT?=
 =?utf-8?B?bFl5QWpqSW1aZldRbHVFMXYzOUxieVhPOEoxaUpqQThSWUt4c0VoRllWdVhX?=
 =?utf-8?B?MVVyTzYxR0x5aG1jblhKS3RCMzFNbGl5ZVZYWGtLUTJPbmYraVMvdlRTazEv?=
 =?utf-8?B?Mkh4R0J0cy94d0ZmVmpqQ1dsbzQrVm9mU2E4TVNJYzdzSGJaazF6NVB6MlBN?=
 =?utf-8?B?dWVoWVB5NEk3LzUyb1NRZVN5Qkw0YzRYLytIRzlrNjk0dXZ1ZG4wbG1NVkkr?=
 =?utf-8?B?NHVYNnVzaFMwTEJnUU40NmVVS1hhWjllT05EWC9waEd6aUhscEJYVVh2NTNy?=
 =?utf-8?B?bU03Y2dxMVI0bzlxQ2RqTE1ycXcrUHFwUUlKTEtPQWNPMUYrUEhuK3FKWW91?=
 =?utf-8?B?T1NoQ1hZQTVNSytUbVh2VzVHaHNZNlNXL0ZUNXl3TFllVEtZeWhDMlhVMlFk?=
 =?utf-8?B?N043cnJpblQvSENyc21SaWUwSEpVNUFmVVl1S2NBSmhtdEZLbmdpMFNSQk1W?=
 =?utf-8?B?bjNUdEpLSHBOcUZXb1k5SWRDWXFKNEJFUzAxMVk5MTVJTmNFMTNQdEVxZ0dx?=
 =?utf-8?B?em4yVnBHbFR5MDZkSmZDQkdONXFTbHo0MElHRG9ocTVvRnFTME1GaklJdTNM?=
 =?utf-8?B?UkJlbUJteDNMQ094NzhmWGxUekNmWUJUL2s4emhwUTI0L28vZE1hbXhHWG9u?=
 =?utf-8?B?YVRITEZiV1R1YVhKNUM0TUpxU0hsZU12NXlaZEthWFAvdlhKMWtSY1lYVCs2?=
 =?utf-8?B?RUkvR3N6MytZejRpK0JzMzhadndEbkEzZ2h2MVVvekNBbFFDSGZnVTFrMDhU?=
 =?utf-8?B?RjNSbHpsa1I1NXRoUkp3YzRyek1BN2VlQUplREowZ2xPenRaY2QyZHJnblNh?=
 =?utf-8?B?WEwvbGVTeTJLUm1tdUlYanlKdUxsVEgzdXZlMGFITjlHaitYN2ZROE1oaGRx?=
 =?utf-8?B?aUNxVjZFWVJ6Q1F2Ty9kZ3d6VTRCaUVZY3N5TmxaVmJBOUZKUHhKanBaSE5w?=
 =?utf-8?B?OFZtMWdCYWdadmtaZHF0emZlR0NKOHdndEp4eDRKWWpIWlM2L0NBbFZ6SDJ1?=
 =?utf-8?B?U1JvekVPZ3ZMV1J1TmJicHFRdWI5M09WRWJZSUcyUUtxTk52MlBCWTNwU3lE?=
 =?utf-8?B?TjA5Z0FGaFdMdmU1RlJtUFNDeVdmbjdaVUU4bU9FT3plU1lQK2NpTFVZWHZq?=
 =?utf-8?B?U0RyMlZlQ3RESVE1bTZyWmNBV0xPemQ1ZktjV0dRNk1XRjBZTTdyajVDaUQ5?=
 =?utf-8?B?cFNwVEY1WEFoRGl6cFlZcE83TWFydnNwMEtLMVJVTExzdjYrUmlOVzNRMmg0?=
 =?utf-8?B?TGZHL0JEcnRKWjEzKzNqVm9nNG5sejV0NDJObjU4aHVtdzg1NjRWd3I1ODNK?=
 =?utf-8?B?cEptU3hFcTQzVTl3aFdTb0ZIdVZqVzJEcDRSRmpRZ09NdGxJVks4Nk52a2VD?=
 =?utf-8?B?b0NFVUIwWlh0c0FzYitpWlRmZmlEeFA3S3B0cWRSellXU0lnZkg3cHBvUXRK?=
 =?utf-8?B?Q08yK2VZUW5QeURvNzNUY1dVUUEvcnF6b2JNWFlScVNnNTJHemJSOTEvdVNr?=
 =?utf-8?B?VmJ4WFd1RmY2WEFRM0pySXY0V2FsMWlURWhJK1Z5NjdBTysrSVBWcWRPLzRj?=
 =?utf-8?B?NDJBNWFQNytSNnpnbXZkUU9QSExOb244RnA3YzRxVldQMndKRTF3T29ocXJR?=
 =?utf-8?B?c0NreUs3dHFmd09neG1jc2t0dmZ6aFE1TUlQaWwzQjBPcE9BY3JhQ3Azc0ZX?=
 =?utf-8?B?VkVFSVJHZHN2Qm5CWjRrMnNrZmNaU3lNYlg1bUFPZXNVdmVydWJXTTNZQ0s5?=
 =?utf-8?B?NDRvcXduRTV4MUlCSFFsV0tCU3hZWlQxUkU3SlRpNDI1bmZFdEZkVU9ZN3ZF?=
 =?utf-8?B?ZStjaXpxcFR4QmdKbUFUbDErNHRZTWFtRGRzR21mSVh3Wm9FZk5XcnNSU2VP?=
 =?utf-8?B?d1NQU3BmWUVLRVppSStQOGRxOTNJZ1lXaXN4SHBMcnk0cUZIY2VDOVFFNzBT?=
 =?utf-8?Q?csuv+2scPtTdbLGXnfi1DVprv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40f65f52-0ca4-4fc3-f945-08dab6a2f559
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 16:07:04.4711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Zxtzr+neO0WpAsM1B47M6ZK6aJxbKIdAi2rpoI38vNV6w7RPhH71vxAzzJVYN4ib0LQxevlDi1lnGifjfYJ1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6816

On 25.10.2022 17:42, Roger Pau Monné wrote:
> On Tue, Oct 11, 2022 at 10:48:38AM +0200, Jan Beulich wrote:
>> Not passing P2M_UNSHARE to get_page_from_gfn() means there won't even be
>> an attempt to unshare the referenced page, without any indication to the
>> caller (e.g. -EAGAIN). Note that guests have no direct control over
>> which of their pages are shared (or paged out), and hence they have no
>> way to make sure all on their own that the subsequent obtaining of a
>> writable type reference can actually succeed.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I didn't Cc you on the initial submission because mem-sharing isn't a
supported feature, but upon reconsideration I thought I'd at least ask
whether you would want to give this a release-ack. I don't really see
any risk associated with it.

Jan

