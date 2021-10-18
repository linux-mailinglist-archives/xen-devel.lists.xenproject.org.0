Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B6643121A
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 10:26:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211808.369471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcNyK-00032q-VN; Mon, 18 Oct 2021 08:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211808.369471; Mon, 18 Oct 2021 08:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcNyK-000303-S4; Mon, 18 Oct 2021 08:26:16 +0000
Received: by outflank-mailman (input) for mailman id 211808;
 Mon, 18 Oct 2021 08:26:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcNyI-0002zx-Tm
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 08:26:14 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e214882-2fed-11ec-82cf-12813bfff9fa;
 Mon, 18 Oct 2021 08:26:14 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-5-TL863SDfOwitNo4jKDmOFA-1; Mon, 18 Oct 2021 10:26:11 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6174.eurprd04.prod.outlook.com (2603:10a6:803:fa::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Mon, 18 Oct
 2021 08:26:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 08:26:11 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR05CA0029.eurprd05.prod.outlook.com (2603:10a6:20b:2e::42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.17 via Frontend Transport; Mon, 18 Oct 2021 08:26:10 +0000
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
X-Inumbo-ID: 0e214882-2fed-11ec-82cf-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634545573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WC8Hjl9zSOo/4nj9xF50M0CWijjrQvuXtd4yotDJfa0=;
	b=VHVPzi01wWf3YSi5jmabt+hlRXzpTuDX264MvKxIoL0xYFd5kXV2VEJb+5ugkNsgSxDk3p
	LudCP7zi+DAv9XNh1hfvMqCanckuvnS7o91R8pcYyJUzXOrIMLLiub16wcVkz3lOLa0k+2
	VbnEVyGhIUHNupV5WBEA3P7pfu2/GF4=
X-MC-Unique: TL863SDfOwitNo4jKDmOFA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nx5c8dDe2nM9ey/E1a24QZjC7+/xz121bNJAqQbsFmQdGREDd6I35qPzpnXQDNAv3gCLoGCNS32QUvrN1mSePHV9psaK6sI3veRy8c0YiizWDjlVDrjGt3KC/DZHks8tdWSJrwwIhHOuIjYv+5nXjJE1iRhOS/2JRrAacVqmYm707/SihUvdDRmIHKNoiAXd/hWsE72HZD2xoUMvJmcG10Z2VYZ0PgeHPvhUkwbYQ92+cJABi6HpXUuBwoeZChFQoEce9Eg/NNEZ7kHr6VLhKWRkWSmaCQnLgObWYUVn7p36cQfyjaX7OVzJewx4sexrdxVabUXnDJN+cVwVWI8P7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WC8Hjl9zSOo/4nj9xF50M0CWijjrQvuXtd4yotDJfa0=;
 b=YN/3wSzVkfX7M76hMLI1AE6v1w6vqUL+bsSauhe0hossAZA4pnDSrXXDEm3hQYKtj3NcpmKo+f6kU+Gj6tIv0+fbx107AQ9i4dkc6PCxF0U4siw9nODN/GO02FFlKSp8yHEJZBkTax21FVAt5TMolHiUeZE4kFmEaeU87GHpKZ4sE88AFgBTcmxd195nED3bEdgQY1pp5DFc9wfJ+ya5j9RBhPJRjnBQRSYrvHUM6KySoNy0WmP3BJe0tDr/XpUEUe6qJdXBRxdv+ijOZzOT11YUQMw+4CzdHLgO3IMPw0ZsliDPAmTm+TNrLBSdm7YvOSGyI7XFd/t4z1Xct/AyUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: bitdefender.com; dkim=none (message not signed)
 header.d=none;bitdefender.com; dmarc=none action=none header.from=suse.com;
Subject: Ping: [PATCH] x86/altp2m: don't consider "active" when enabling
 failed
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Alexandru Isaila <aisaila@bitdefender.com>
References: <f0de7945-84df-8668-f94a-c15cd5196be3@suse.com>
Message-ID: <7f947b0b-4b65-51cb-c098-edf056610fb0@suse.com>
Date: Mon, 18 Oct 2021 10:26:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <f0de7945-84df-8668-f94a-c15cd5196be3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR05CA0029.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::42) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5b7bd61-b33f-4ab8-4e96-08d99210f0f1
X-MS-TrafficTypeDiagnostic: VI1PR04MB6174:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6174E96C2568FDC0A48F5EF0B3BC9@VI1PR04MB6174.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tEo8Qf42ly+0EPXbkaTKtUG4+9ObT5+M7JwbwEa4nLiwnqnWTGsw3RTRnyW4xqTtpgyXjyR97EtfKCZjpHPob3jBcPhWWUgONG60cr0YQqeLJAWeKOmvN2lbWOOBrOsxAtSLs0izWlpu+J6Sb1RhBZEe9Luk2AFuT9AAhGWSCwEb7jXpBmgRHdRSkTYeM1+ytIhMEklLILaEZoCWL3uGxamPEwwipsvKcvJr/meIPBdfUT+Zynf2L48QO15nhWVpSbaoT+ufk2fOXIVPF4MAvshot9DoxrWbRR1qMlTOned/1lYq1R84IMBCZ8T2uF3McWu5sjWZ7cxIEE5mMKWUkYEiG4ItS6Zu0b1x3j21E1WsTrtaozH04DRrubTEnR+2sVYmHBFP/4MKCWkZxtVNCqRmjPQBUQV38uQobZ1STG4Jmo059r5+ha6yViFSU3DD7heQwrSZpNIrdBuNxPr2MQJbKyx9Rt4rnBEzSQJd0/wXZq5A1VaS5RE5B+JASrMaUajZTCv7HbVmG6ZXyGa/VgpoludsLulqGrRlykj3/2ckhiLlogC3VkcYL8K2Z+3Ab2UQAiAFRdTtd5ZU8t2obLISLAoQR6dD6yspI717/gJWhtphEg4Zqwt32RJDtEYRRUUHyxEzhc9lVGh/a5OFbGnMBfIYex+xgP7NusXy5AgoU2iQ4DPOugTzdWROL6WOZjH+9jSL2Pn9sOawrzP+r9JVzMFti31eMt4G9cDcK1/Tkzf2znm+YMyEjqj/f6YR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(31686004)(6916009)(26005)(86362001)(2906002)(31696002)(316002)(16576012)(83380400001)(66946007)(38100700002)(508600001)(4326008)(8936002)(2616005)(6486002)(956004)(36756003)(53546011)(4744005)(5660300002)(54906003)(66556008)(8676002)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGJCOXNOanRUNExSeWwrT3FNaVV5SW50VTRocWVuRzZMMXVjUEVhZEE0RjBy?=
 =?utf-8?B?Y3R5SUMrMjI5WVNjdEdreTQwK3p4TUtkeXNLQTVCdWJPV0U2R2pMMUJQWWg2?=
 =?utf-8?B?a3RxMENDRFQybkg2MDF0Mk53QkNtSkNIVElDM0k5MW5NQkR6ZDd6NUp1ZEtw?=
 =?utf-8?B?aWlJQUNLbWQydkpPWUlQVHlvN3ZIeFJTMGRHamZ2ZVpyU1FSVXBvYUtwK3kw?=
 =?utf-8?B?cHoyeEtma01jc1E5aW5NSlpSZ3VEWk9PQnl4cDRrYVNNczJNMlBXWFJTdElT?=
 =?utf-8?B?SzZRSXNQcnVNc29sUVZrQWd5Z21BRjBiWGpBTkJ3bzhXRDlmOSsyMUtDRTNS?=
 =?utf-8?B?bnd0QUpRdi84aDZHMzBqMGdIb1B2M3ZBcUJWN3cralVDcUpoNlBLMEhoUnlw?=
 =?utf-8?B?Yk1CYm5WZlhkbFdPSjlSbHlEWS9rdnlEalVTWXVhaWF1MkZaOUhBTTFoc1Rl?=
 =?utf-8?B?VWxldE82aGhkL0IxT3lGMVd6TTdXR3lHRWJxb1JENDkxVldtcjF3OVU4MERD?=
 =?utf-8?B?Q01PWEwrbXR2eWZJSUVueXp2Zm50WlUrZCtZY2U4VHFnQ1FmR0hhK095NnNF?=
 =?utf-8?B?T3dKVlZzNGFrSCtjaGhRYklqQ1BhU2JUcGduc2hMMGpldlF5UmJaZ1E0TWcz?=
 =?utf-8?B?NHloeUlXcjUvTUp1dk9ienFsUFM4WERsSncvMnVoQXdTNWFTLzZxeGFTNEtE?=
 =?utf-8?B?MDFKc3FxVEZWQ21QcktMNUNKdmZjeGl6bUM0K1hDK21mWGpFVFRqK2lXdGMr?=
 =?utf-8?B?a2hITkFzU2dsNHFBUGpTYy9YNjZaZTM3b1JKUGg2L21kOHJjdEI4VWlvTGFG?=
 =?utf-8?B?bG9SK0NJYmpTcDlKNVNIOVlzbmNSVUVkNVp2eEpaSURkK0E1b1IvTlcrWHNR?=
 =?utf-8?B?cEFWUUNOQ2RYN3pOdjMrNjJobnJ1Q0pwbnM3UnRmMlpoZmJ4by9td0NqNmtV?=
 =?utf-8?B?V2xCcGVsZlJBVi9scTFHOTFsSU50N0t2VmN1YWlwNlBTcHNJRXVwaWxDWVZE?=
 =?utf-8?B?RHNyUFo4UzcyekIxNzA0dzJpRzNMWW9FWFhvYUNoM0h4dmlqZ0lYVnNZaHQ4?=
 =?utf-8?B?SXdUWTBzWE9HTWdCdVdrc01EOWFHaVB6RVg3RkdWRDEra3BUSHB4VHhFMVJs?=
 =?utf-8?B?TVdLNzU5dEhvaWNmMWNMVjI2KytSOS9Jd2hpb0NVcHpoREdteUdNTmxvTEUw?=
 =?utf-8?B?dmduV0N5c1FLVXYvYnBqUUo5WmxxSUNQeXVJczNFZHhua3dMU1NJWVhrRjc5?=
 =?utf-8?B?RmtOS1N0K1BqREhmRFBDNkJ3alV0aCtOdmNIb0p1dXUzemhFNitmWnVpdXhu?=
 =?utf-8?B?RlJRVVRDWk1DNldvSWNUUUgxRWVxYU5xZDV3YmtlczVCb3NsNk1oaGVkN2lv?=
 =?utf-8?B?eVgreGtONFpZeWVZRmtLS0cvMm1OQ3Z5cStwNlRvTklyM2ZvMU5WWVM0aFRp?=
 =?utf-8?B?cUxpdlJwZVpMdndaLzNPQUtLeVBIdmV2ZkhtaXJIcFlySFZTaHQxaEVqcUtG?=
 =?utf-8?B?YmpGWktybzMrckhzeG1uVEJzZndoN1o1alVNc3paNXMzMUUxV0pucFlDSy9s?=
 =?utf-8?B?NEtMM1doemlXenhpNEJSaWFGc3JUZUFIUGsvdnEzeDQ3WEMreWt1YkRhRm5T?=
 =?utf-8?B?WFV4SDVVOFRpdmdmeDlVNkdXSWYrUjM1UEtTOVRSNStGOFhWeEpVQ3lTUThm?=
 =?utf-8?B?M0d6WlBwWTZ5MFBUYnNLVTFtSlNIOUc0ZXI3dnFSK3lmZmRHekx2K3RwVXE4?=
 =?utf-8?Q?JhjCAHuVtB0ndoEsBU0836Y4yc/oZDznmVpMY6k?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5b7bd61-b33f-4ab8-4e96-08d99210f0f1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 08:26:11.0103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CV8WQ40NfGH1qZdspB1G39jQmIpfFCpVfDnnKqiPHXRyUVJ7IbJgkNlsbUIN4RhTRtsnHm+ND9viN7YNJdb9rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6174

On 25.08.2021 11:31, Jan Beulich wrote:
> We should not rely on guests to not use altp2m after reporting failure
> of HVMOP_altp2m_set_domain_state to them. Set "active" back to false in
> this case.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Because of their relationship, I'm also Cc-ing the vm-event maintainers /
reviewers: Maybe one of you would care to review this one?

Jan

> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -4609,6 +4609,8 @@ static int do_altp2m_op(
>              if ( ostate )
>                  p2m_flush_altp2m(d);
>          }
> +        else if ( rc )
> +            d->arch.altp2m_active = false;
>  
>          domain_unpause_except_self(d);
>          break;
> 
> 


