Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD62C5AE500
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 12:06:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399770.641077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVVSs-0008OX-TV; Tue, 06 Sep 2022 10:05:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399770.641077; Tue, 06 Sep 2022 10:05:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVVSs-0008LS-Q8; Tue, 06 Sep 2022 10:05:54 +0000
Received: by outflank-mailman (input) for mailman id 399770;
 Tue, 06 Sep 2022 10:05:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVVSr-0008LM-BL
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 10:05:53 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60066.outbound.protection.outlook.com [40.107.6.66])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d072883-2dcb-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 12:05:52 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB5759.eurprd04.prod.outlook.com (2603:10a6:803:de::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Tue, 6 Sep
 2022 10:05:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5588.017; Tue, 6 Sep 2022
 10:05:47 +0000
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
X-Inumbo-ID: 7d072883-2dcb-11ed-a016-b9edf5238543
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dcq+gXC8Cx560Qdwe5ViRlg6MF+1D9Ip7uRY+MFp8aj2Lmh4Wd4Clb3lHM0IVVx7nXT6sVK8TXNuB0puJ5Hyb8uAN1sIhNTn4P1oCYova7oWGWvUewYmRxsODQkkAyd2EJwF2ma72zE82055WT8HVXTrT/xUrOWNxOVRE9QwP1Cec9OlqltQ7rp/YBKB4lm/TSunVHyCapR1qMKUGn0EzMgHjVAC/ZJp7C0CLcLRa8AxhBBbWENJ7QlJe9zN3cR8ZvefgNamIV29dreHNuxaiBg/kpoyEpnq4i0yz1lKDlL+RP3GfEYEhRwRet9J/3bZamyrUVAyGjqCWD3BB+H6fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FLQF+2g4GDwLXRDnzsN1h5zIwD75Zx/nle5iRa5mjuI=;
 b=A8seNi3hLhhAji0lMUAcrGkCWHAWiDNlT1ecms5b8tvWlJXxkIcmchoA0EDopkPlN4ubq98oRtc/BFH8hdNlfhq1Cfsl/iLO46pFiea/ztEr1cVjYWwcRRD4a/+agCFOHaeA560jkpFdziBpPcwrVMkszbEZ/d0QP2e+JsA3m0x483noHC2VwzJ8P/GzcfRkcrVmv4zKivSppS+vvj5KbsZhAUKcP4jw5GZEDDJj8xer5nUThfB7irqtyajZ7cmPKwYKF/GLKJnLdfy13+ERq999z/+1okXqPQQkuU8ksGgSQR207J0xLqDNzRwSDI55U6lLKAox1k33NdNAOUOJSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FLQF+2g4GDwLXRDnzsN1h5zIwD75Zx/nle5iRa5mjuI=;
 b=T+rCW1o5Ok6ZzNj6KpQlni9uTYLujndkyDf7TSU0swAHOnH+bgln4g6E3GaRsAhj6EQjtTiuITD6m6/KAYiJucIA3Cl3NUsXFVW5AERQ/2P87ohaf+hNb7Iz5ctboc9QFu0qk5L1+Sigd3X3w0W6Y21K3RabPg+mjI6RybCKv3eGQSOTjI1op9rn3eXZOs1NTSp4qRA8IGcUmhE1vDj2+0+tkIHF4MJI+H+FPKYfnZQkcgPf8rzAaxlDcpY/t99h9duWlxQLwuMQ69mbQk00RqiFkDrFM1vvYbGiDtcNc3WJOuPeQM5cwOnSmG1ibnIEy688R+rpp44lrrBU+TwPsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <acbf1ac0-6891-f412-fadd-04b14a34505e@suse.com>
Date: Tue, 6 Sep 2022 12:05:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: Xen 4.17 release: Current status before the feature freeze
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <AS8PR08MB799103D2B44302893AE39A97927F9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <YxYOt4+D5VtkMscV@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YxYOt4+D5VtkMscV@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e6e5c94-c503-4a43-7851-08da8fef5eae
X-MS-TrafficTypeDiagnostic: VI1PR04MB5759:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+cXigB/59Mx4CUp9elDTLIXK6nsf9xi4np9O+KC/GSaxSGIfItuPkWxLGPBXPvNUHVJojtTnnNao5ReS6tnzn3/SyoSYiTK9Xi+MXjjv3tnurepH+xgznxkNKL1JOgZkYms1g1ZrTEL2B2HKnN1EGpT31FWBik0ts9ZSODfNWOfz9TCkEWtjbZxTxiuS25gnGE8ABbOAvQuxHzk+Q5MqayTvoja0+YxEQMW49xWRHTmesjMzsG7Eju+0AmDuNb6dscZEfXNvuBoNXyXj9Hxb9CpNt39XfNcUvVLKcPnJd4m8xmpnQSxl4KGo+YBRqHwja+RIBXc5SHQHhFiu1ATHSOv6XYGjz9HbzkVAxpIqFa8MeBdrMu0qw60UL7jIhXjlfGEQ+yMry+7WeLDWzzTttLOknh8q9ctJY+0Y8xMXej5SNUgKRju11L5T5fiHCw7NamyWWzr7f7qcJSALsgM0N6XDd9+8ArsAJycRnAl/J4pMkPSRmWovpb+tabxn5nQQWIaHqI9g7p2Rqd0XweZs5DkfrSfMoNb0dm7h9NoLBrb93wLCJOxJdpN20hQQTim6ALgSgcsaK1qMk61z9L4NlgU2YoIZNKGo8YEMvwTcAkgy6rhh7AznTcQIecf6R4vNQHK3YVgoAYtxgl3u9YomYfD+oRlwemxfeni+tkWrKRULGoijitmMXHdFfRIS0SIGvK+NGPaPNH8BpUtLsl/fEUFvMox3YBcr0leZqnnRQzV53g7Q+cL+TVRH8NfgVMDEwJSiypXb7KZG+C8jAj5KSRxAZVsKFNkgDq50M43sAG/CKfWUDoLfWwE4QiLJvFRBxZ8LnZdMoTce8iW04ULzgQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(396003)(39860400002)(346002)(376002)(8936002)(316002)(110136005)(186003)(4744005)(5660300002)(4326008)(2906002)(8676002)(66946007)(36756003)(66476007)(66556008)(31686004)(2616005)(6506007)(478600001)(41300700001)(6666004)(86362001)(53546011)(26005)(6512007)(31696002)(6486002)(966005)(83380400001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDVreVdqQzVMcEV3N0c5bjBRc0NmbzE0elZ6MFNoQ2Z3UzFRZTYyK1l0QTdm?=
 =?utf-8?B?dHdhMThxK1cyUU5UTm9OR3hlRlE5TC9RalVSVmdNSFVPaXNXc2JqV1NQeU1H?=
 =?utf-8?B?UG44NWQ0STVlR0ZYZVFMTjlSeDZTZHFmMENhNGlXWDRWckRoVzlpMzhSMmlP?=
 =?utf-8?B?YnFvN1R3L2N1K2ZJM0hnT2VPSU93WC9ZZ1g2WWMwNDhFaVYrQnRwYkswNmZr?=
 =?utf-8?B?Ukxwdkx1Q0tsM1lNOFZXQXVqSzlCd084QTQwZjJSUUxTZG9FUkc5NTFXSU9q?=
 =?utf-8?B?RkQvUTFmM1AwRU1aQ0lQKzNaK1ZZL0EyZTkwNXhzZmlqVVdFVE1JVWJvN29k?=
 =?utf-8?B?QWdMTENxanIyMWRCY0xQZTlJdHk5SzVZbkpLNUJhckx6bEt5SHUwTHVueWZC?=
 =?utf-8?B?aU9GOTVOYlM0T3pHRkVJSFB5L3FOY2dXTE45OHZYQmlUMHV3TmtOQkJZd2hM?=
 =?utf-8?B?ekppV0lZMlZjZXQyVEsxK3p1Yy9ZbVhpOEZkdWtxWTAxVytKZ00rRjhBWmFr?=
 =?utf-8?B?RFlFYlVvekdEWlZocERsdk5yOWN3TDZjdGpobGpveEJWQVFaRXhBdkJqMURZ?=
 =?utf-8?B?RFNEREplTm1wUzZCTERDU044OHVxcUpUUlhqNW1rQ0o0eDdhOHIyK21rdHoy?=
 =?utf-8?B?TDhGSVR6VmJPZWhpdEx2Z200V0tJLzJFeEhOcEZ3ellvTHdHTU5aR0hneklE?=
 =?utf-8?B?eUxZVnlJQkJtVDBQeWRyODJqN29sZ3Bzb2taOU9IVGNFQ2I4RGErRlpMNk1W?=
 =?utf-8?B?ZUpFOHVSbUgzMDVWcG5SS2hXMDNIc29TVGQzaCtMbVZPSDVCRHRLWFlVdEw1?=
 =?utf-8?B?Y2tBbGZYRUUxZDVySjhhUGhyOEE3SjAxdm5wdk1TU3NQSEV6b1R4bS94UDdh?=
 =?utf-8?B?OWVHbmpPb0hTSHJqd0FuOWVUTkp0SGdZM29vWmZBYVk1MWpWOWQ0ZHJjb2Rr?=
 =?utf-8?B?ekpGaW40SFBYaXhsbG4yeWk2UlRFV3ZWTGk2cjNqcm5Ld2lHTWJrSGZHYkdX?=
 =?utf-8?B?Y3J0dmkzVkJ0Mmw3ZmNxb2tCTElTbUh2OXVOZTRzRHNqbzFncE9adloySTFC?=
 =?utf-8?B?WjBBSHF1WkhvM1g0eUI1OVVPVlpkK2w2YTJtQlhWSDJ2TDd3ZVUvOW1GWmJX?=
 =?utf-8?B?Z0J1VnNsRk1oM1MzQzZuQXRCWTVOR05tSXhLQ21vOTArOWdZb1lmcnlmMmFk?=
 =?utf-8?B?bmswcEgzUnVoNUxQVFc2RlV4TGJ2L0RRUUhMTGRLZWlOT2JxK1JXeUQ1UzJo?=
 =?utf-8?B?aTZ4a2ZOOXR6bUtZTzdCRWRmZG1vbWhNY0xUMmtnZjhQL0JtL3lYcWs4NGpp?=
 =?utf-8?B?MFJ3NElHY2F2bSswbG9HWmdNa0tkTkxzMTJWMUtScHFoOWZReGpYQnNEdGZu?=
 =?utf-8?B?b0dhY2VheHFDMWtCSmRvVTBocmVQS0VpSHU3RzdiRXZlUTgxSzA0Q2xNWUQw?=
 =?utf-8?B?WDFGY2hHMFdSNTJ6S083ZTlONnFndDBzbnIrRklDc2NGNTl3YUUrUGtPb3lh?=
 =?utf-8?B?ZVplSU1QSEtNREE1ZkRkRlp5bkQ0U2ZoZDZDc21RTWliczJZa3p1VzdWZHJ3?=
 =?utf-8?B?UFpaNkJVcjhWV2hOSngyNXBNYnFWZlhuYUluZlA4NUxpNzkyM1oyVW1TOU03?=
 =?utf-8?B?bU1pOU5sTUNwWFN0TlNqMm5yYkpOSTk1bW1GMFRNWjRiWXRucFVmQmgrQXho?=
 =?utf-8?B?UElLZVhiTE9uVXBEc3RoNkdtTkxjd3BoQ2NaYjFWelk5SkdrY0lxV3NCRmRu?=
 =?utf-8?B?d3Q3VU5FV2E2c004dGkzL09YbVZXWTY0dkFXUXJEck5COFRLNjR0VmJRMm5L?=
 =?utf-8?B?SWlSOTZvZndRQ2JDYlFUdTF3TEZucUFTSDZSaHczZDlwL0lDUXYrL3BubzBq?=
 =?utf-8?B?bk5NWlpIWmE1dFVjMlFYbzNkaEE4U0lpN2hzSlJ5QzdxZHRrYTVrc3d4eXhw?=
 =?utf-8?B?ZktiVXZtd2cxNC9qdWFJV1ROOHlRK2Q5amM0QWw0ellIMEV2V0dwNnk0bzQr?=
 =?utf-8?B?ZnNoNzg5UzU4eUFPNnF6a28wKzg4WGlRM3lac012WklZVnJlNFlnSEMzRzN3?=
 =?utf-8?B?N2h2OHdIckloN2I5MS9FYTVrY1JUbFRIb0dlK1NyTGo1T1czSXFqelIzQk1u?=
 =?utf-8?Q?jPkKxXUd5EHJNtHPghJ+JxYfg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e6e5c94-c503-4a43-7851-08da8fef5eae
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 10:05:47.6513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eY9kuONBRmkk2IESncSIsiEzoti4WwWqxjEm/uJrvaq7fJnbo0UtNGcKt0YWxHrMo3Geg5VIaJx+yZQzDL+D1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5759

(shortening Cc list)

On 05.09.2022 16:59, Anthony PERARD wrote:
> On Mon, Sep 05, 2022 at 03:44:33AM +0000, Henry Wang wrote:
>> ** Common **:
>> 10. [XEN,v2] build: Fix x86 out-of-tree build without EFI
>> https://patchwork.kernel.org/project/xen-devel/list/?series=668331
>> Status: Reviewed but not merged.
> 
> I believe this should be a blocker. And the status might be that I need
> to update the patch.

Right - afaic at least the description wants to be changed.

Jan

