Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB8A463227
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 12:18:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235041.407830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms19O-0005o8-Tm; Tue, 30 Nov 2021 11:18:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235041.407830; Tue, 30 Nov 2021 11:18:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms19O-0005le-Pk; Tue, 30 Nov 2021 11:18:18 +0000
Received: by outflank-mailman (input) for mailman id 235041;
 Tue, 30 Nov 2021 11:18:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AOGb=QR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ms19N-0005lW-Dd
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 11:18:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36e668c5-51cf-11ec-976b-d102b41d0961;
 Tue, 30 Nov 2021 12:18:16 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-CneNYOSLPOyPusszXi0Xzg-1; Tue, 30 Nov 2021 12:18:14 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4190.eurprd04.prod.outlook.com (2603:10a6:803:4b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Tue, 30 Nov
 2021 11:18:12 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 11:18:12 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0088.eurprd04.prod.outlook.com (2603:10a6:20b:313::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Tue, 30 Nov 2021 11:18:11 +0000
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
X-Inumbo-ID: 36e668c5-51cf-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638271096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VZy5shlTsgjXzuUwnVwC9fRCAFmrMvq9Fl0If/RZzpY=;
	b=Z2UhRNzZbASX/u7tc1IHwy4fmmzTQ/I+1udaJBZJOWvzEt2C1gaPRq6vKn/aaN8ecWjuhP
	xOYB8NyDKArIfleGbNP45U02qo5qSOdhCk9G66qSbKZ4PiPThud7EQZq6S/QITXb9RxcY1
	xWXgRNpoC4zmlM+56d35Ar31ELdcIe0=
X-MC-Unique: CneNYOSLPOyPusszXi0Xzg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TI1Ca/1Rz1sn7haHA9Qpt3AgpGkH4/4MdprrcgQ6Oqwv1p8p7dtO+z3VxYKE4EwUOHhev0fODichacoDAdw561/Gdi9S4johppRnMpBkcbaC4O5lLYmcsM6Mc9lqwyWVRE2gVNeuX5ZcrLxHrFz0JTH5MBdRxeQpSWlSdKjZrLhMV9LbL8lFcTdjOGN5e0b+rklzp4pHlvrQUIT8WvvZ/3V/yqvHueKwgws42vAauVTwW+nr7IwY7bN31QhIXf49x0t7ZBaLKY6IsByp8btiProrWZBXspn1KawU2sM6qSoc7BVOO3Qdq3I/5o3tp/nbAVtg/LyJxmmZuA2PB1ZThA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZy5shlTsgjXzuUwnVwC9fRCAFmrMvq9Fl0If/RZzpY=;
 b=eE1caTP+hO1qEpKkiHLthucxtUl2X5gEmEHNOmcu6x3bMJLImVtDB3VjUYR/laSa5EmPWuQDG7RawZpAfserMYZQdT0XFstNFBujqVfKltoVrBcgntdxB5/DSZsFLm0IQL7da2f6Dayd0i34pC4iyJ/xZCaOsLvBKIm1J4UA84oDXaJFsHqEGzCXSqyduIzDuXdW5sY4kexD+OoKDm/USYq26Y7G2h56EFq+SDxpZQ5ep+YcyyjpM5KyoHLwbUdJyml9lweUgHVwS/KOWoBznAKic5nEEXS8v1zZqCsEitmbvUApfOWKMVp2it/0o0MrCwh1tvbkkgnRTUBZAlzlrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5f1f7e92-e6f9-1430-6d9d-5baeb23597fb@suse.com>
Date: Tue, 30 Nov 2021 12:18:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH for-4.16] SUPPORT.md: Define support lifetime
Content-Language: en-US
To: Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Community Manager <community.manager@xenproject.org>
References: <20211130111617.14925-1-iwj@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211130111617.14925-1-iwj@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0088.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48ae6173-23ba-42d8-5033-08d9b3f318f6
X-MS-TrafficTypeDiagnostic: VI1PR04MB4190:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4190F95185BF21A253E1F9ACB3679@VI1PR04MB4190.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tOQzZCce/fWsIdUgsMsOfN4bVoufWMRt1ioGpkTYOS7J+JRwPBw9xXGB8UUxPZyocywGHYZrnktwCRf5Z3k0sPotIje1qNNOgnmF32S3+ARD7oNXLIZouYFzbBtuzsfFFp+9fUZiv67oKAt28O+rLCP0rqUOYJQS5dqsMj9lhf8lmGOit3tgHxIZjYn6GT95slTGMCZV2cwS4POAuUY6dn4qemlzbbx/nYezgbcu557rnNMd4ws2ZQUXa5GodQMPLj1YFhAfLO5MW1mP9we5pUqbNVvztiau2lWQbGwvtuEcaFW6TyWVjn3UbHTwkaTS2yXY5eon29w6GZ1YNgB73oIjJSH02hddZEa1zYpcITAErsWVBJsyKqU/pLw5W0ab9Zyngd3P38NJp5k1PJUEG384rJu/qJy8xlECOt0mbJRii1RemJcABOfTM5CmTscDhXdRgfpvczLlABeNS87m7d9GpOA7zVcsgkDj3RrYxjNdzZDfwq08as16aG5oeS2gzz5TEaooXSWPGLwxq+22XUs7uDvnMaWmhz7/o/Tg1OYVJ2OdjX1MrmRWHJ8daXyb4mHsbxjgoAUPuMVPBCeyP4tgttNOrcWsRZqgqdpKHse5FglmyPPxRAwCStUPUd/10ywnWjUAIjFFMybayqISA+YknKEcDOrzboogADCy18RUnZo96+fyUW0a8ewEYlgnZ5pNM6BVrZxjgECcH3UER4Qzbcfcue+62yr/UH+bXRMIb7SG0stfSa/akXr6RSHLw8q9a6IhTsmP2L5ULhxWcijXIhxKbd9azAmLREVOX2Xx+EO+9F0KSQ71MGbYte2S
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(16576012)(316002)(66476007)(54906003)(66946007)(8936002)(31696002)(38100700002)(31686004)(166002)(83380400001)(2616005)(956004)(4744005)(5660300002)(36756003)(6486002)(186003)(86362001)(26005)(53546011)(508600001)(8676002)(4326008)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajJlN2l3ckthTk15cFBTcmUrd0xLaUVoQ1BybTZiVitCaXljM3NIYlMyVnVS?=
 =?utf-8?B?RFMxYnVQZDh3VGh0czQzZTVvTmgyMTF0TUhJMXdsR3lDQ2RlSUxEVlJ4Tnp1?=
 =?utf-8?B?MjFTZUhOcjF1UjZjcEdsTVgwdXQyUk1NdXJqN2l1R1lnY3dITkRDTEhickND?=
 =?utf-8?B?QzlqT0FDOUo0R3ZldHp6SlA4RE5CNVpPSHlGYmljZHh6LzdkSnExK1BubFFU?=
 =?utf-8?B?ekdVaVpEajRHSnNpeGhvU05XMEZZR2JMNEFBeTM0ZUUrOTRaZlMyTjBaQjZ5?=
 =?utf-8?B?eWp1Y1h4M0JVRFd2S0Q5ODFQd0o1R2RVOFd4c3hTSEtNRWY3Z0lpNVcreEtI?=
 =?utf-8?B?ZDE5ZGJJdGJCZTRLeDVXWW02bUcyUXNMNVVmMndzOEdiMzRNSkVEaUJBMlJu?=
 =?utf-8?B?Q3Z0bFdWNHNCSmtOZ0hzL2NSTlJFVGU4OHovL3dnNU9zRUw1aWVESHdpT1ll?=
 =?utf-8?B?NHNraFZKT3JqM0tDMmZtTTBFSWd5YW1QMzZIS0t5VlBtUUJBbEVUdk1GeDJR?=
 =?utf-8?B?dEpHZ3dYd01zek1hakVvNDZ1RlVNdTI2ZVlMVXA5MENKWXVIWXpjU0E1WnY2?=
 =?utf-8?B?dG9IYTNXNytjdjNib0xHNFNuajdLS05neE9may9oOUFuMmNXTERSL3ZpSGU4?=
 =?utf-8?B?d0padmtXeVdWSlN2aVNVelVxbkNpRUFGdEZjRGttcnpEdE0rMkdpaXg3NHoy?=
 =?utf-8?B?SXFSYUZSeFhka1R5Tkc0eCt6K0xtaUp5aXVSWFZpUDdmVUh0ejc2MDR1U1E2?=
 =?utf-8?B?MG1vemdGOWtDOUMrOUh2ZGpaVkJMSThyNyt1MTdWM3NwdFB4WElKbmE0eVVp?=
 =?utf-8?B?NzNlNVBtYWFYRU11ZVVQbEtRUnZLWkJWeW9NU1FITTlWYzNxVGRjYzBxRjBX?=
 =?utf-8?B?c0YvSldBMTFpdWJUOFN0QzRVQUtac0JXZ1ZyajJKNFZENmtkODZNQkpMUjlm?=
 =?utf-8?B?aFhIcUEzbFplOUxHZ2JHUHJYVWRRalBzQ2FHbE1tekp4dG5ET2w1VC9QYllN?=
 =?utf-8?B?RzJSY0kvNFFKU00vZ2Z3NHdGM0dRN1E2Yyt2eWJmSzVuZG45UkpQM1hKV2tY?=
 =?utf-8?B?VzZVeW1aVTFqTFhER1Nwa0JhdGpPK0Z1RkM4LzhxUUYwN0lpR05EVlZXRTlU?=
 =?utf-8?B?dVdQNEFPYjRSRnk4TzNMaTVzdjM3Zlo0MVZGNlV3WmZoOXkvM0hoTTVsWlBU?=
 =?utf-8?B?b2JLQTRucmd3Z1N0cTRpdWlQNjdUNm0vVmJ4MUNpWkovT0k4TWdIUkNyS2NV?=
 =?utf-8?B?ZWZWcXpUUnI1aUtJdkJzYzY1elRmT0RnS1NPYXRhUUxRL05NZER1NUd6V2Yw?=
 =?utf-8?B?NDFqUkZFanN3QXRieFNlSlMxS2hFblMxdmRidFNkT0k2UlJ1bU4rall4cjV6?=
 =?utf-8?B?UDJiQnc2ZUN3ZnFmclF4cjYxdUdRdDZsTHc5b3MyMVdsWExGNFo2YUVESnR5?=
 =?utf-8?B?U0t3azB1b1VhQUE5SDZock9ETVBmeW9FNzQza1Y1MnBXZmVhdlhVTzdFdkw4?=
 =?utf-8?B?VDFDeE8xWm0wb1IyVk42aFVnVXcwdHVtQllVbE1zdmdWUDZFTndoMEp6SEln?=
 =?utf-8?B?dC83cnJ3NFgwdWMvMUhtcktyWWFzRWJSNHZ4cHFQNTRSZDZsZXNkSmFoWGNK?=
 =?utf-8?B?eTAwOGtjSjdhb053bXJseWtxbGd3VTNQYVErek9FUUhrRXZpU0xQV0FtTEFz?=
 =?utf-8?B?Sk5icXJubWgzQ0IvMjF2K28xSzNMYi9hc2hOTEdTTW5xdHB3K09WZC9IVHpo?=
 =?utf-8?B?K1hPM053blJqL1AzNmdkeW82NHRVTFE5ZTh3akF2WTNreUp3ZngzWWMwbDlW?=
 =?utf-8?B?OHdIQmZsdzhqNkI0QytXcVBtR0FyQnhDYTBIcHdmdzFnSHBOMWIzUXFGSU4y?=
 =?utf-8?B?OU1nbnR4RTV0Znl4dTBoMjBjYnNhTFpiWnJVdGxqT3MzeXNQZVRKRjVVbFRV?=
 =?utf-8?B?dDhYNVh5cW1jdUNpREs2bHRRRHZEVHFkbXdlRFZjbndKVC8xS2ZsYlZvQkFV?=
 =?utf-8?B?TUZZRTFCczloUkFkOThuaTVvR0N1YWNIa2pSV01wd3cwSkVuMnZ0RzhYRVZr?=
 =?utf-8?B?MEdsV3M5NUtUZTd0SWhkUTVUTVEvOE90SDJxSEd1OURSbHdoMUtiZm81WTJE?=
 =?utf-8?B?TEIvQzlSQVBIMnZBWnFoZ0RETnlIbzZyUnVVTUNXbjhhYjRJN0dROHE0cmRk?=
 =?utf-8?Q?pbT8UZfqn1vPWqvNQ/JN2W0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48ae6173-23ba-42d8-5033-08d9b3f318f6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 11:18:12.8225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CL/n/8KC3KMgM+FXjQzJoRaZcoiNyXbTjE/2Z8JUX75X7OpQhP7JyTmYS4tsD2hh/RSSwY+iC9DY9q+s3V5mXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4190

On 30.11.2021 12:16, Ian Jackson wrote:
> Signed-off-by: Ian Jackson <iwj@xenproject.org>

In case it matters
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

> ---
>  SUPPORT.md | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/SUPPORT.md b/SUPPORT.md
> index b1367e2b22..85726102ea 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -10,9 +10,9 @@ for the definitions of the support status levels etc.
>  # Release Support
>  
>      Xen-Version: 4.16
> -    Initial-Release: n/a
> -    Supported-Until: TBD
> -    Security-Support-Until: Unreleased - not yet security-supported
> +    Initial-Release: 2021-12-02
> +    Supported-Until: 2023-06-02
> +    Security-Support-Until: 2024-12-02
>  
>  Release Notes
>  : <a href="https://wiki.xenproject.org/wiki/Xen_Project_4.16_Release_Notes">RN</a>
> 


