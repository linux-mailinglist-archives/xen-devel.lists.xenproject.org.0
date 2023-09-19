Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3627A5A2E
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 08:51:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604412.941773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiUZ0-0003Do-Ek; Tue, 19 Sep 2023 06:50:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604412.941773; Tue, 19 Sep 2023 06:50:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiUZ0-0003BA-BF; Tue, 19 Sep 2023 06:50:26 +0000
Received: by outflank-mailman (input) for mailman id 604412;
 Tue, 19 Sep 2023 06:50:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmoc=FD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qiUYz-0003B4-DG
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 06:50:25 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20618.outbound.protection.outlook.com
 [2a01:111:f400:fe16::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce2e484f-56b8-11ee-8789-cb3800f73035;
 Tue, 19 Sep 2023 08:50:24 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7959.eurprd04.prod.outlook.com (2603:10a6:20b:289::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 06:50:20 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 06:50:20 +0000
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
X-Inumbo-ID: ce2e484f-56b8-11ee-8789-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AFEg4adyJ8g/ctDtjTW7HXBGzsxVJUOkyIbljLDuJztne7Ziw4Yy5uMq32uiSLiuL1eBkIRSwxvAk0MuZ7A78f4AkPa8NjdAyo0ljkmZ300sFSHvc43uoenl5rz1QX7N6DnMAIWEEi7Ho5NgJvVAk1dr1bniFQVOB8cZvfN1SPKWuPajiRI/2Nk73aQmscOsx6YAdvyiKylyvNmMb6BlRrr+pX7bkILuYrmtMzHvst3k7JYM0KCKbImffKrW+nzEtKJx7M1uLGovCRKJFHMlbGaANnfMwAf041V0hdFEGzIeiMl7tZu7DPw21lr/2A7aB5x3mPu7RwJGtEQrQW2Mjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFhp9GM0eXU5zgyUcsybJm4r529sv8FPjU4UvhhI+N8=;
 b=BOoI5aWj+lhvgFCG408ZloL9Sa5pEp+Lwny2DH2g8e4qhj1vB4VGmaB2hSME8NkZxT2JUo4KN9jlXdsQDRXDoH/pXW0s3TaUgLRJkbnaSxuJQWiIQO5Eee3LT2UNfH4+e6XtHetVjmmw8q/u3GH8tREvcAHtaKZVAYYj6w6fa21TuRnJ2j4EZKYtlLQHpIHeBQbu0PNa79cvLQJm3BTiCeuZoWj1sgFznuNebHmVIcfXso8Tupe9Vjk6r7DCKpeInx7u7IQfR/jTPmcUR5oslY6L+4oNUU5SvPzTuW2s+xVhCIZmhE7VJQauNTIld1O/uC5a4CEGn7nol+PLX5QejA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFhp9GM0eXU5zgyUcsybJm4r529sv8FPjU4UvhhI+N8=;
 b=3Y3v7yd4ImSfZ0+tPxLbBxmRehFI/xHOQQJOD2ynh9+8i2C6E0Wv0saQkfadaegcQovagwgGnR8XG5PVzFk6rFC2KOA9+dR9p2k2Mi8xlSqHdSiB3Sc0SMWJ9zNiEevLzsmLY8OVbbKGGt+0XnXoQxmzWPFeMPY6R5CJ3AnUT7OwTHUz/JgabL0iP2SLpXR2BdqbrOqTFzv9DNCNDfA7J1T26rhf2wMKgprEX2gNbS1tnh2JGErB9qKpco3dTup6uJU89jH84FdHCIewUYK6KQI7iIVoHgvSjsPOX8M5fwdnNfO7ewn5b7ue3r2xxUyr4vV8jXFES//dx3eQh2u+6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dff889ef-ec24-2cac-5565-18376f5e331b@suse.com>
Date: Tue, 19 Sep 2023 08:50:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH v3 4/4] README: remove old note about the build
 system's python expectation
Content-Language: en-US
To: Javi Merino <javi.merino@cloud.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1695104399.git.javi.merino@cloud.com>
 <83e6857f16eb000f8368fcd9995e0411f0177c2e.1695104399.git.javi.merino@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <83e6857f16eb000f8368fcd9995e0411f0177c2e.1695104399.git.javi.merino@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7959:EE_
X-MS-Office365-Filtering-Correlation-Id: 59d14d2f-fec0-471c-56f5-08dbb8dcb0fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ew3UhRfuWY3reEIwJQB0nRVygS0+UR8gVLpZAKhKrqteAXC9hPtC8ObtPlqRIuxGJCjJYlBuZRz7XBcS49+DMrc+BC9fFxZO/x5k2Eje8SVCbK2GwNeELVfReUnR8Ca98dkKnbTQnpU+dozhrdoSH91rbAoR1t3zb+ph7ZlIu3PAu9K4Scqtj7mWkGmdcGd2fAfZEydmFpk+PmBeZY6gVriK/515Ocu0UnVzVPaGAxlYAlN5zgnsJ/oaNOq4AaZQD87A9B5sUPaPhhyrtfVjAq1EqJC2/FCjWn0bwpJDvc6FoPpLj6WYUURGM++r9HyRIarDcuAMr2ALT+5AjWuPhAaGEc9UW+k4gj0L0Pg5N2XPIgK71BnrGp4Q+c+EN1FVPdgZKyUQxjcvdG1yuSgDzaDhMp1O3qUfl0y9ma6gqPmrhE/Jb5nDKve5xGlbwp2GPq8qBP2ar7OuD3kaA0KdniWh22LmvDwJ9yi6cQ3tCCB7AfdugGfZlBjoXgpR+52o1EQXqFmuPiu0QARY2v8MdMg3ARzfRbrVP4M3Lbb71kG2oY9q2q5inSz3bEgsLqv7/aR+1+CUy14rjlf/P906IqH3/c092Z0aij/2sSPazrUEomnOYJxjdN2d5kkvLQ0ZAySvS4stpT+mhGxGDC9ZUw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(396003)(366004)(376002)(136003)(451199024)(186009)(1800799009)(31686004)(36756003)(38100700002)(86362001)(31696002)(6506007)(4001150100001)(53546011)(478600001)(2906002)(66946007)(66556008)(54906003)(5660300002)(66476007)(8936002)(4326008)(8676002)(6512007)(83380400001)(316002)(41300700001)(4744005)(6486002)(6916009)(26005)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWoyY3ZWM2xpdzdLZk5OdUtoWEJIaTFaWHNqQVZGZXJHbHAvS2kzdUxKUy9K?=
 =?utf-8?B?SGxjaUxVOTBhcE4rREdDR0dMRG85RGlkMjlWTnVmL2RRalZ0V3lEeGFVZGdr?=
 =?utf-8?B?TUMzYW9zZFlVK0Q4MVF0SjV5YWZ1bk04dnVxdnRqdDhHeHFHUi9aOUJFUWVD?=
 =?utf-8?B?UXZneUYxZ0hpMjcreXpHdXdPWlhNUHlLT2ltaHZYaUczaGlsSldHQ3VXQUlK?=
 =?utf-8?B?eHh1VU9zeWJSVmVTanNEUEdDYkRpM2lKNUpJd0xWcS9GQkxZaU5RYTZRRDM3?=
 =?utf-8?B?SmNSM1JObU9mV1pvV2xSR3ZFUHExY0JVZkhGTDZDOGRnWEh1WkExeVpIanp2?=
 =?utf-8?B?MjlpQkk2R1Z1YUFTZ3BJTnhzWFZHckhXbENhRVJOOVViL0k1N09VOUQ3TlZ6?=
 =?utf-8?B?TDdNK0huWWlGTTRzMVlmVnNQN0JHMVJ2NUJHR1M2OUdZVUJMMXJmejZJWnVo?=
 =?utf-8?B?WnY1cDNLeTZrdnF3K2hPa3NQL3ZWUmdvTEdRSzR1SkR0N0Q0SDNlR1BWblp6?=
 =?utf-8?B?RkJUWU5QYzlkdkVVbnk3NXp0Q1JDbGZPUDZSNWp4and3aTZ1QTdubncrZjR6?=
 =?utf-8?B?RDFkS3l1YnFZV3VWUXlZUmVGa2ZoUDNONzRGdXdrajR4SU4rKzhWeWdaUU1l?=
 =?utf-8?B?V282OEJpUDNBSjZQTkxPd21rK0lPU0s5Ui9SM1prcUxpZitGUG55eENDdUhR?=
 =?utf-8?B?cnMzS1ZXVHc2RGI4MXJWOUJIQVVsclRjOU5yK1UzTVh1UnVrM1BJdS83RTFk?=
 =?utf-8?B?VE5VbFpITUVnb2FsTS9pT29iSUNQVnhtTlVhZjBMSHZIVW1PeEVXVS9zdUUy?=
 =?utf-8?B?WkFnaUNwNDZYcDJSQTh3cjhDc1V2eStiSlpaY2hNUU1lYmMyUUJKVjNCeVRk?=
 =?utf-8?B?K2VWMS9OaVZuVlhpcVNvcEIzMXNtUHA1MTV4UW5meXVYYk91SHRUTG91Yksy?=
 =?utf-8?B?bTZvQ0hWK1g1QkpvVDlxdzUvdFF0Mkh3R3NXSFQzV1NsTG1jZ3hIQ0w4Q04y?=
 =?utf-8?B?YWQvMEFVTFdHb08vNHhRcllEaU9rV2VHbnp1bUh4a0VOWXRKL3NKS2JPY0pR?=
 =?utf-8?B?M1laUS9xblFYaDRLRnNWbUZHTldvZHc3c1lkR21DWWJwd29QS0h1cG96YVZo?=
 =?utf-8?B?bWxnd2FTWDZnWnVrMWtiVjlGZ2c2K2poME9SRlFyYjRWZ0FPYmV3cFZEaVFq?=
 =?utf-8?B?OVdMY1o0bUpVSmdtNG5GSHJlRHVsdlEwTVFvWjd0UVltcUcvUjkwVEY4eUZM?=
 =?utf-8?B?MkRGL3kxWWxNc3lIT2pWcW9HVk9DN003eEpMRXVBUHFUeXltNDdZQ2JNWU5X?=
 =?utf-8?B?cEd4M0ZBSU1HK0VuTWVRMlhmRnAzbVhPeDkvSHBZVDBqQlVaV0sxMW5qRHB4?=
 =?utf-8?B?dlJtMFlqOFc3RmFBWDlDRVlKZ0Y5V2Z0b3pzb3dja3dSZ1Bmb2FONko5aDMv?=
 =?utf-8?B?bXpKYXJXWndtRWd1ZEhEanRqeURLbTZEOVNaNFVMRXh2M1B5cG5QazZVaUl5?=
 =?utf-8?B?cDB2M0JKWWV3N3pEc0lKUlh1WGFYdU54OWJlTitHNU0wMjhJRE9FKzFtVE1y?=
 =?utf-8?B?cml5ZWdlOU1HNDFWVTh3UHpxelcxejZjdmE1bHljcm82RDh1Tmk5cVVIdmUz?=
 =?utf-8?B?Q2FkR3V0NzFPTVJiR2hCaUE0Y1pRMDF5R3BLWDUyS3UzR0ZJdU5tNUlnd050?=
 =?utf-8?B?aVUxb2IveGNhRnVQWmlkdmpLWmhkbTRoNE9DUDhxUythSmhBN1lmdXlYdlJz?=
 =?utf-8?B?M1NtTVI1OG15TUFHdmtCYzB4NEdBa0FVTTcvaDl2Y0xkVTJSU3F1cGZFSU9D?=
 =?utf-8?B?WWptUVJqK2V3UFZtWDRyc0pyK2RWWVZITGQyc0d6bkhzUnVORmt4blpDSnRl?=
 =?utf-8?B?a1k3QUhaOXJibGVNcThYL2JGUnBnNjRpZjRYMWxDRmk5OHRlaUtpTUUyVExs?=
 =?utf-8?B?dXJ2OUtxSlZINjhWWjA5cVM0MHlJUG0zTHVWbjhhODZBVlREMHRzU1YyOUZY?=
 =?utf-8?B?ZGZJMUQvOEgwQk1zWVZDUFpzQXF6bDl4akNQbTJ5NVI2V1kyeXVjVEFZQlcx?=
 =?utf-8?B?RHd6aXdQQkxMSjIwYTVnRWtQKzBtamRHOFV0cHMyclh3TlBXQkpqc3ZJSHBJ?=
 =?utf-8?Q?jDucQfneb1OZidAlLuJYGTs6T?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59d14d2f-fec0-471c-56f5-08dbb8dcb0fa
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 06:50:20.5630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tpMDNTUKcT1cEEwzhFS0289dGEt66Enm1PmVbAoQtRSlmtvX3oyTkmpc6mtNpurJqByk0KaeYC1v118tO9nP4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7959

On 19.09.2023 08:30, Javi Merino wrote:
> 5852ca485263 (build: fix tools/configure in case only python3 exists,
> 2019-12-11) changed the configure script to test for the availability
> of python3, python and python2 in that order.  It sets PYTHON to the
> first one found in path.  You don't need to have a symlink to python.
> 
> Remove the outdated note from the README.

But that note also covers the hypervisor build, which isn't affected by
./configure, and even less so by tools/configure.

Jan

