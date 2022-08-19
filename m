Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0755599658
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 09:54:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390072.627273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOwq0-00029O-At; Fri, 19 Aug 2022 07:54:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390072.627273; Fri, 19 Aug 2022 07:54:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOwq0-00027Q-87; Fri, 19 Aug 2022 07:54:40 +0000
Received: by outflank-mailman (input) for mailman id 390072;
 Fri, 19 Aug 2022 07:54:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iUym=YX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOwpy-00027K-P3
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 07:54:38 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00074.outbound.protection.outlook.com [40.107.0.74])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c4fb86e-1f94-11ed-bd2e-47488cf2e6aa;
 Fri, 19 Aug 2022 09:54:37 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7655.eurprd04.prod.outlook.com (2603:10a6:20b:292::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Fri, 19 Aug
 2022 07:54:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Fri, 19 Aug 2022
 07:54:37 +0000
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
X-Inumbo-ID: 2c4fb86e-1f94-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQU6dPVEDqp6IR2w+GP0QITFzPMuWVIKlPFoQOlO5FF+m8rxFK/cI9E5q0kSRuye82aKVncu8skmnxabyluZmWvpIJPLB/qgsnuQOEAoR2NFntZznJC8IabKbZSVkgW1n7okCXo3OsIm0NegrDKv6rfc2d9axPqrOoEgHjIvY9SzY3gQ5JyZbNbILJpf91CuiMUR3KImAmp2QK4xuN0VIicU1+zj+sImzzwAHsdbDbjadXiCJwoSVB50cAN0z9w/Yenzjg3v6LlHK0aK+RUExW9slJzyO11/tXnRcj+djz//h3hbpyqScPzxZe4Ei0npkDOQS2F13ycfWYm7ScGYIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7d0nMZNZNvptAANXQERA/+RjLQ07WmWXfG6lDAfd9fg=;
 b=RSugumAcWDQF7xdxDW0oKjg9wdvpAvbAjiREsA2823ZGsP3RKBDG9e84TmnVWyt1cQyS/2zown0vEj6FesxEimuYCuu0rizmHZg9xo0rSZMMIbRVWJyrqFe5ggD+GjzyeIK/IN8+CTNJ+9K6cLOwhE5kIbWJ8ok6A7CNiANajNJEwv7Hzbx9hlj116EkxiwhW1WuwprMAowEW63Ql5X7LuyAy8bd/yQ+aLMW5NIzHUyZcksXR1iDr8m6XocuLr5zCLmfTLwXfoJ5279xQ8QWDOxgcTzsOalCGWcCOYE6ae1Fh70MrozJ8joMqg5mvkeEUrvo9k/OOGbMyQ/kpXnd+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7d0nMZNZNvptAANXQERA/+RjLQ07WmWXfG6lDAfd9fg=;
 b=5zeIX9SmfHtTD8FuvCSNFxzqHEj1A+oSLw58Yg/JvEv910VhOh0/3uPMJ6S1qhn6yJWh+b0VmLsLGdhljS5Bkrf+GyCDcvqKrhOSk2zzucSLopCy7Dc+4bi4qNFQOFVP3UZ9FM5jROaoWjctyCf248g5PeJYWaRtMXPmAershquDoMw9SR+SB+qq2TI75TyYO57gp1rBgMZ7RTTwn6g5J5mM0LQPJyQM3xpFTzX07d0h9jSvXvwgI4r6Uzi8DRfTMdQg6Eri62PaN8TU5MumYC2wjicsCfzPGt4wMD5G4seBPnriRvaYpwd5hu5yx1Gd+oNcGkXvEMuBqEwTJesyvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bf21b37e-c745-ef8d-8606-242c8ebb5955@suse.com>
Date: Fri, 19 Aug 2022 09:54:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/3] Add SPDX to CODING_STYLE
Content-Language: en-US
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: sstabellini@kernel.org, julien@xen.org, wl@xen.org,
 george.dunlap@citrix.com, andrew.cooper3@citrix.com,
 bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2208181453530.3790@ubuntu-linux-20-04-desktop>
 <20220818220320.2538705-1-stefano.stabellini@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220818220320.2538705-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4162324e-05e3-4ad9-e633-08da81b80ffd
X-MS-TrafficTypeDiagnostic: AS8PR04MB7655:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XdaJtwCpNeQ99OFmr7cR+5GlmMClmLXOP9PKeV48HiCh9ns8rEnch8dh3gvIkrqOeP8MrThq1jDuRJ8wjjbdAEkPwtYmEKNyQSQ6Y2b/VVvb8GLaqthovRrpBLz+2FNnWGq4BLYyzH4JwDapemk2NnJhMdNb2pCuE1LTufl8mq8rhXKkZsvbnokX4KsVpQ3NXNKEp2NLgf5bVbDcSHBIPp7nP5GIYtHyArfaer8pPXQmpOr/pRoxCBPfUzZIrGrUDf1M79bRmmRopVlWdkgfeK4PWPAy/A2MdvkhQ0NFsbVh+MmbJ7xQN97ztAqN5ZPQM9Mx7tkJBp85j8QAVOcPDVe0yMk+dc6aMmxk4w5iNItmsfmJcmBHmOONi6Z08NIr8G/GsefZ6bS/6/FbCkMa34JbX88hqxQS2zeVRkLVflZqtw02ajg7ncxihT1vdGeEFuEaCfRBuwZXwgLZbKGeU1hH+kDHIwxCvuuxl6EamMXYhQNoh3vF8spdkXcOdfmDxnHrgHiPTLWkJTgh33Z/OHt99WIOBFsZhEsDTSyTk1xwTpaKMuNae0z/ah7xz6tfinmSdSL/4x/kHd6DjG2pItZMz8hpgHoIZJ+oq+uGFxyqeH7WGf7GzTOtIqCDPzkRFDE7BGmuhfGZbOaaJuvRKK4LkTn9mjnRhG6OfCQoC6JLXFaYPbDdghRAD34fWnqyyBX2qnGWqVv3/mJh4wCodY5dvazxYZy+5QD6OBbDrL2vFseVnUPcghEri36xq5Tl9YcnLg6YPPsH86zwfszAihJMwpZvoRBU4neqaOqeGHM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(346002)(39860400002)(376002)(366004)(6506007)(53546011)(26005)(6512007)(86362001)(31696002)(6666004)(41300700001)(6486002)(38100700002)(478600001)(2616005)(186003)(66476007)(66556008)(66946007)(6916009)(5660300002)(8676002)(4326008)(7416002)(316002)(4744005)(2906002)(31686004)(36756003)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3VrdnBDV2ZzQStoM1hxQ3lJU0lPNUF6d2cxTjBod3d1aTFYNmg3WGpkSnho?=
 =?utf-8?B?a1dJeDhLQjVzTGN0V1JwTmxoVCtDMm45a2w4MHZnZ0UzeVJXWlNpK3hKWEhM?=
 =?utf-8?B?dk9Ja0hKZ1dJejk0YXBlWnBmOFhKSHZBV0VUeWdtenF2RGJMRmZlenF1ZDNK?=
 =?utf-8?B?Z0dTTW9Yb3hVTGtZRGJIMlRDQ1dldVdWUTNGREcwMFFPdVNuM3UyWmJzZFB6?=
 =?utf-8?B?SHpwU3ZiNUFQR3VuRUtXd0drajU0T2V5NHYzc1VPNEJDcG0zVTZlUE9TcmFj?=
 =?utf-8?B?bXZvZ0xpcTVKcTgzS3Z2U0JqWVVQeHFaSndXM3gwbVJOTkFHVHdWb1N0TnhW?=
 =?utf-8?B?Y0hKR3JPZ3o4eGlZK2diS1JKWjF4a2d6VGQrdG5OTmRBNFJYY21XU2R4VWlB?=
 =?utf-8?B?MDhoWVZIcHN3VXo4a1FhOFhWT2E5aWQvUjJ4b2lsUktwVlBNS0dqME5pQ2RP?=
 =?utf-8?B?SDB6Uk9UYXIrSUxkRlhxQ3QwTEpmV05iOU1keUU2aDNkSnZRSFdUNEpaRGp0?=
 =?utf-8?B?dkZ6MTVxNFI5S3pxd1ZaK1dDNFNUcDdBRGtSWjRmcjRQa1RIM2wzYkRTd1lI?=
 =?utf-8?B?SC8yblZ3RVJNZGxaVzM3Y25lR0xJbTdCSkZlNy9zczNYU0p6c0xCZGlKM2Rn?=
 =?utf-8?B?OTdRNjlZaUR5YVA5RXJIWTc4cTFhTnQ3L1hGZUlnSzBRVHhoMTRwcHUrUksy?=
 =?utf-8?B?SkdMSnRPUlo4NEI2VGNINjZkaFl0REVjTkJUakk2WEJBeVFIS2tOb0E3YXc1?=
 =?utf-8?B?RmdUSk80NnFpR0ZTKyt2Wm16anV5U1pIRGJPWHQzbnJVMDVPMlowcjdEZEJG?=
 =?utf-8?B?RG15bFJNZlk0bVZlYUdKdGZya1liWWVST3VpWWNvRXdPUlJzZ1Fsa1doTHRN?=
 =?utf-8?B?OTZCY3pXVEJyVUlaSzBHSXc1WGN1WnRpb0M5cCsyeUQwVXoyYzFLWGE3UldU?=
 =?utf-8?B?SUYvdzN0VmtDb3hFUGtyUnNSTnQwUG90T3BmV0l0V2ZFajlWNFIwQmRUa3ZS?=
 =?utf-8?B?QVhXaVhRV3UrMFhqakdzbloySkNFSXB0ZisxaGN2T3RJRFNoaTZiTDlGUkxh?=
 =?utf-8?B?TVo1aTdiTXJxUXdaZGZNbDh3REhCVzI1RTErenR0NGMwZWw5UStuM0pVaFVy?=
 =?utf-8?B?Yy9TTVowdHZXdmRQNHFmMGVBQkNQQWZTcU9yZkNtaUJ4QVZmalZ2bWk3R3Jt?=
 =?utf-8?B?NTFJTnlaUkpva1MxVjVhK2EwOHM1SXJLaUpqNXFqRUZ1Z0dUSnhxekt3QlMy?=
 =?utf-8?B?VXhQODU5dk44NGd2dXJMOWhVeUlHeFJBSCtoaExTbFhXTXNWUkZBUUtpRWt6?=
 =?utf-8?B?ZEJXZTNoTzBQUXJtUUl0VFp4T083NkZpSEZwZUxGbjAwelhRcnNGQVo4elcw?=
 =?utf-8?B?b3U3Nno0cTlqRW4rSXZWM3l1N3BoRTNDZ3cwYU5FTnBSS0xnM3hFUWpSazYw?=
 =?utf-8?B?UW55L1l4ZXMzTHV4N084RG5VZGdKRVF2ZUhRbW9rVHVQRjlCWURxQXhPbWhw?=
 =?utf-8?B?ZFNxWjRlZkVuVmxhbGlLTGJZaUZVbWJ4NlV1NGZPZnlSczlMcXJDU3F0MEdN?=
 =?utf-8?B?M1l5ckE0dmVZRWwzc0dkcUZsWDRwTmgvaHVLWEpwNWo0Zm5lZjQvQlNSNU4x?=
 =?utf-8?B?YU10SWEwdnJtYXpadTdQVUtZRWM3NVdMcE41NFRFS1ZFMjgzS0wwdktqNXZO?=
 =?utf-8?B?dmFiczlVSUNYY2VPbkFUalo1TWJ5eFpGQzliVnIyR05xUktkY1IrYStUQk95?=
 =?utf-8?B?Wmg0ajJvZTlWT2FqakZ4cW85TE5ZZWhIc1VYdjZTMXRvc0VEUU4zTW9zRDYx?=
 =?utf-8?B?UGR0WG5LQUtDMVVRTEw0d2pHS0UwN1BKWFRScjBoUldpeW9UalkyMFVxZ3BE?=
 =?utf-8?B?aDhQSFY2c2YxTHQyVUdqNUJlVm9wSXBnQkJ6YUk5RFRpang1b1k3TEt3ak5F?=
 =?utf-8?B?V2ovNGNmUS9ndXVtKzVSRzBPb2xpSmRJSjFQWkRSZFB3enVCbU5vN3Jhb3FX?=
 =?utf-8?B?WDh3ckt4bXVaa3BmL2pwWFBsVmlwSUhMcWRKT3JqbG1JUEQ0WkpWTk43Ykoz?=
 =?utf-8?B?djM1LzdMWmVLT0VmQzNNdWxZL3BaYklmdXIvYnZqSStSMzBqVDF2WXFBYXpM?=
 =?utf-8?Q?kxHnoWE+lD6JUE3N2lXFj5OgB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4162324e-05e3-4ad9-e633-08da81b80ffd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 07:54:36.9859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P0lBfYS2ECzuVnybiWgqpTc8TqGUp3SThhZKQceH87ECttEw109hU9qdcv1bxXMckn1HlKMnMUVN5UbkkMsw9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7655

On 19.08.2022 00:03, Stefano Stabellini wrote:
> --- a/CODING_STYLE
> +++ b/CODING_STYLE
> @@ -14,6 +14,16 @@ explicitly (e.g. tools/libxl/CODING_STYLE) but often implicitly (Linux
>  coding style is fairly common). In general you should copy the style
>  of the surrounding code. If you are unsure please ask.
>  
> +SPDX
> +----
> +
> +New files should start with a single-line SPDX comment to express the
> +license, e.g.:
> +
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +See LICENSES/ for a list of licenses and SPDX tags currently used.

In which case this patch should come after populating LICENSES/.

Jan

