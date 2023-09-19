Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A42537A5E01
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 11:33:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604514.941931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiX6U-0001mm-MH; Tue, 19 Sep 2023 09:33:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604514.941931; Tue, 19 Sep 2023 09:33:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiX6U-0001jx-Ik; Tue, 19 Sep 2023 09:33:10 +0000
Received: by outflank-mailman (input) for mailman id 604514;
 Tue, 19 Sep 2023 09:33:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmoc=FD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qiX6T-0001j3-1h
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 09:33:09 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20612.outbound.protection.outlook.com
 [2a01:111:f400:fe16::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a2d19d2-56cf-11ee-9b0d-b553b5be7939;
 Tue, 19 Sep 2023 11:33:07 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS4PR04MB9316.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 09:33:04 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 09:33:04 +0000
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
X-Inumbo-ID: 8a2d19d2-56cf-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SEjL8KTEuOR7cWTA6alag0gUiC3bse78MUItygEg1xS9mI+/bQUnex/pKhiBUJgmmQE6S/FPnlnbDXOlTQp+BBDSD7uAM5cCt+0kC3i8VvO8pnRlGTNJ1M4TZ5tE16gs1ungEkQ+R42x7TCDP9o/1sgz7pE5ZnO1wPk8S8cFlVdBfHafHjIzZ301EGZ7sim31shwgEBBkEzzHFDBD9Jdsii3CSy12VbKhoxIqwTtHpxSB/qTqwUingC8PYTmY6kBcPg7oQNhSi786DyAu+xgxUHtlmtNng79dlB65ltGrH+Cfii/Z2S5zoaUm+WbHFicUVpGhwsQz8KBhdK+wCfAFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZXt98HxqLSuuwVXWNs76uXiXwfhgmUTGTmxcGdlXZ8=;
 b=B5OBva0p5yu08rWNbXkFyZ8rI/PTo1XqdSGCLCY7xINKB02SmpAZuA/cp66tSquFv9g887xRXMNI5MY/jA9S0w4sKy+jFV/7sooxkOxfVaQFCHB1f/d83yceoxlbqLIz9VNdI37CntR17WcK5j1ulzmrbPpagfEKbyD3EWcf57arAwJlSqovDUrySZ/anI5XwaRWrw26h6lG146cE0GDytxVVxM8npwbfnR4YQyzaj0xtTkqZB6gCKcU5EhXCq0wssF9x914mgVJvQUBwgVwR/b3psqvuo0lII8yF03aIOycTJpXuoTXm17ZvtbsNvea/Jqp+yuz6v3sdWAum+chhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZXt98HxqLSuuwVXWNs76uXiXwfhgmUTGTmxcGdlXZ8=;
 b=pOm1PzEkwxo3MrUqtJXcHBjY4yGoKmlh49FvisHc9YE9LT4Fawejve00BsXpD/wyf4nHPs9eJlJSoyPOo8Wr2+lVNibIDFSUPHE/UR13NUcqP9yAbuwRw+u/FT2wg9MVNWz3BcZGGIxQpdXX9F/+m78+/MX4pq/jQz/rGFWRFn6XUySbZJ8tMesBzsk1bZhCcDnAzRfYwyrW3DyTkmRgFbiZS2iTZ9QVvJYmI4GYxK8d93m6+MiFR7WPk1MPzpQt8hzPhzC2IyNuZs+MH4fkibKaV3D2IIC0jl8ifsbxpUQ9bzUBtjEJzQArDBBiQ5aQBLeb8WGxLRj/StTmN5TBkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9c43273a-cf20-73bf-96fb-f3095ce3a122@suse.com>
Date: Tue, 19 Sep 2023 11:33:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH] xen/types: address Rule 10.1 for macro BITS_TO_LONGS
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>
References: <b3aaaf5265c7e7ce6228ba2146f57aaae09f55e6.1693899008.git.nicola.vetrini@bugseng.com>
 <540ae128-a934-8c4c-6fec-e475dd072c3e@suse.com>
 <aa2084eb925ade9caa4e1dfbfb425537@bugseng.com>
 <9b673dec-f391-9948-3ce9-25ddff8c9d7b@suse.com>
 <948c3c6c0b9dff859df58eab419d01f6@bugseng.com>
 <7937ae31-e511-8e41-9cbb-98d8666e66b8@suse.com>
 <alpine.DEB.2.22.394.2309061828360.6458@ubuntu-linux-20-04-desktop>
 <6818e3ac47edca6ba107b8eeff95955a@bugseng.com>
 <a52733a0-ec5a-3b49-ccec-7a7e8e775c4c@suse.com>
 <7d07fc38-14e8-6cc7-2b0c-816bc68c7317@suse.com>
 <3d44b3b0b185418482ab60a693d930a9@bugseng.com>
 <alpine.DEB.2.22.394.2309081236360.6458@ubuntu-linux-20-04-desktop>
 <ed1f468463841e7f3f5bb90de4d9a227@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ed1f468463841e7f3f5bb90de4d9a227@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS4PR04MB9316:EE_
X-MS-Office365-Filtering-Correlation-Id: f3f8976b-1f36-4781-6abc-08dbb8f36cac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9uYYNgTfB/yzHz2XpT6h3Xgi0J/jEFFCtZZ7ZOlBK+gDpx25tSThkR521fTWpW2eqVsQM4sYPTM10hq/cePDNgarahNAFzALrZVRzRpPirwK6NxuQrGXOH5MbbYiv8NPFUM+T6jz+QdJtvdN7pxXo+HUu2muna6t+HW8qMDFUOX4F8DJQxXbAGBPih9CZ1G9c9JNW1GYXNwn8ZxTE1wgg9K0uD+jrcnpWZaDVZ52/6A+aclGFDypKRC2lv3wA2HncxdC1bp7xTepM73u2bctq6aHN5NSJjshunDV50BmkJ71kM8ou2MDvYYsVZYSsLV4tgJ0MTFYg4kQdUUW9Fb4IKQaZhVDUwXXpYOWtEmfwuQXCbkrFWH92Uhh6FU0RAFRRQUJmxrofIdPHw1VFIPQnpDvctLOW3lEyUJWBA8nm2X8WID8RYCeO4bs9KCtsjNo13Pgej+ikpczD/2WPXCmZ/xtMsqXPfNpp2zSZatlZGq9E3mCS24ZGoFMKzu9xY9W4VUJO/h8TxRXcDPzEwXAN7gj9JuyKTXib0UxoZQmI9IwgjVGibE1SJgtaw/GV6lAVnVZt0FnaxtxOkhf0MXU5/tvBcZ20AVLmUlsACvir3D+Fc10T0oBPTA2Dxmq6SThVUTZlotFzi3q7/w9lmELRw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(396003)(346002)(366004)(136003)(1800799009)(451199024)(186009)(31686004)(2906002)(7416002)(5660300002)(4326008)(8676002)(26005)(41300700001)(6916009)(8936002)(316002)(66476007)(54906003)(66556008)(66946007)(478600001)(6666004)(6506007)(53546011)(36756003)(83380400001)(2616005)(6512007)(38100700002)(6486002)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmFsYmJrbzBJVmpFUk84b1daaGlhcGpWZGxrRnpZT2taS1ZyMkxQQmkxQ1l6?=
 =?utf-8?B?cnBHaW9zRnVEaTIvdldlUldlNVptR1kxUUhCYjNHbFB1V09iUW5aOUhmTTdY?=
 =?utf-8?B?aVQzOERWYVc1M2VRU3JkN2ROdGNiK0JTTEIvMHNLd2l4V0RJVTQ2REg1WXpE?=
 =?utf-8?B?d1d2Wmd4K3g3VXdmUVVZNEUxR0UrMG1mNGZSZUF0NEQyYkwyTjd0R0c1eWt3?=
 =?utf-8?B?ZHlHSFNXRllSK2IrM1pDM0dMV2ZNdEh2a2NIVnlHdnhoNXRmN0o1dEt0Nmxq?=
 =?utf-8?B?WjdHbUVIeUtEeUc4LzBGaUZWaTgxQXNuWDBjTzdzWlFVNGs1YitXZFVOMEZU?=
 =?utf-8?B?ZWY2RUMyb1RMclZkakhPdXc2eXJRZExScytpTTZEODNsQnBJZ0RiV2lPQUZj?=
 =?utf-8?B?cUhPaE5mYXNlTDFFZzhwbTJyVHptZ0ZxUTJocXExUzRrMlJjb0JJeldRdjNB?=
 =?utf-8?B?K0wrTDgwcmR4akFlYjUrK1hNQlppMlNWT1JLYkVCenpGcCtQVnZVZUlaeWZr?=
 =?utf-8?B?b2EyV3hoUmdJREhIMkFZaTZFTXRlZmVoa05EMGtjWTM1NkkrbVJaRy81ZUZQ?=
 =?utf-8?B?eTdsMVdsa3VNNUhiWHZxc0srRm9naTl4Z0x3SURjais0Z2hJdGJBclBwaTZv?=
 =?utf-8?B?TU1CbWM5UW5YR0dMeFlBem1mWlB5VjNzdTIwb2ZFSUJHdnFQUFhheEV0RzM2?=
 =?utf-8?B?S1JHKzNVbXdzUWd2NVpJcTkwdFNsem04dGpXNzN4TWlpdldZNzA3ZmRVcXRN?=
 =?utf-8?B?QzhoYmVJdWUzY2lIRFk5amhNL2hOMjUvclMrYy9FdkRHWHVTY2NaWnFSWVRL?=
 =?utf-8?B?L2hIRGpveStjd2hFcjQxUEtPOUJQS053LzhUbTJXamVyTGI2Z3VMYXk3T2Rx?=
 =?utf-8?B?QlpEekZJZEF6cFRPMUFhVkYzRVRtU3hPK1g1Y1JkUVZCak96QWpteTl1c3Y4?=
 =?utf-8?B?SDVTMjkwT2dJcGhTQTFZMERxTXJLOU93dDc3K2VqT3IyMnAyS3hjbHA3Y3dJ?=
 =?utf-8?B?VFo1MWhNRzB3SHhaUXRpUjZFL001SkNWZUhtSndWeVViRTg5akQ3bkJYWnVE?=
 =?utf-8?B?USs1eERtRlhWZzdKbktKTjlDMTdITlpRc0ZBMlIzeFFzaW9Pb0puUzJBMExK?=
 =?utf-8?B?WUhBcEJSWTBJKzcyR20wZEJ3VGNVSFBUbmtmM2hJUGZmQjBIaWRMVmhYd1Fx?=
 =?utf-8?B?TldVTjh1NjV1MXJyTk1CckVxOHJvQ3M5UWppbHMzbTlNWlVPdDI0NERHd05q?=
 =?utf-8?B?R2VNK05kTVFjSnBYNlp0MDZDRFJCaVBVeTgxUkYyYlZrcnliL2kxeHBIdUpV?=
 =?utf-8?B?bE1nV1IwU2lJaUxzZFVXVklOSW53OTdKS3lNeXJ1b21UWGdCZjQySFJzeFVw?=
 =?utf-8?B?b2dFWlVFRU5KQyttOHBNMEt1T2NOdFdIWGZvZG9NYUd3UTcraHd1YndYcm1h?=
 =?utf-8?B?bUFYeHYrbVRuLzJUT2J3VFFPZzZ0ejF1WlFXOXhTUThpUWdBY0kwendJcDlR?=
 =?utf-8?B?UkZOZGZDbHJHaUR5d0NYaFQwMXpWQVNEUG04NXVZYUE0V0dTU09VTWhrbmZP?=
 =?utf-8?B?QWFxRjNCZ1JJNFBOR2pxbkdzeTYvU2cyM1M3YXNjOUZGbDh0bFBRNTh5VWZ1?=
 =?utf-8?B?YTFIQ0RMSlNtSlBNZzg1bzFEcDFISGkzaXdZajlyU2hyc0huL3Q2T05Jdmph?=
 =?utf-8?B?QjA1TlBRbGxUUWtxVmg5RTI1OHFkZElUa05MZEs0RmhUdGNtM0hwdm1WcDR2?=
 =?utf-8?B?UDYwNFFlby9oVlhyb1NsTWdublJuV0N6VUQyUEE4WTNieVljdTZUYU04am1Z?=
 =?utf-8?B?MmN6KzBwNXA4RnlrVURJa0VNbW9pV2xNV1Bmc2ZHSEhtelgrTHg5a3hNbXlx?=
 =?utf-8?B?eUc5bVRmVjJqSzRGWkhWaTl4ZGlMU28xREdZWkI2UllMQW0xMVRiQkVFczI3?=
 =?utf-8?B?VHJocGxnSlVjRU5QNHFmcVVjNlZYTnRzZS9XaXlvWER1M2ZrLzJ1RVpqTUJh?=
 =?utf-8?B?MW5KVU9PK201ZUhNek56aW5RamxuOHVQSzdFNE1WdFdjQ0c3SzRRZjhRU3pP?=
 =?utf-8?B?VkhMRUp4OVdnVEpjL0t1d3FlaDczakVhR3haNjhWem9qRk5PZFA3anRQa2Z4?=
 =?utf-8?Q?srhoG3lGIk0PnSPbjAaXko3n3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3f8976b-1f36-4781-6abc-08dbb8f36cac
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 09:33:04.7915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1AL2ey3RgSGSyl/visZYT0yfLIdqvLf6flseVWO9G2DBk4ACUfPSv2Uz/P2UdGwQ6Mlu6JkYS5PaZz3s5PW7jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9316

On 19.09.2023 11:19, Nicola Vetrini wrote:
> I just noticed one further issue with making BYTES_PER_LONG unsigned, in 
> that causes
> several instances of (1U << 3) to appear inside the file 
> xen/arch/x86/xen.lds
> produced by the build, which in turn causes ld to fail on that 'U'.

That should be avoidable if _AC() is used in the #define.

Jan

> For 
> reference, the version of ld used by the build is the following:
> GNU ld (GNU Binutils for Ubuntu) 2.38
> 
> The following is a snippet of the output:
> 
>         . = ALIGN((1 << 12));
>         __ro_after_init_end = .;
>         __start_bug_frames = .;
>         *(.bug_frames.0)
>         __stop_bug_frames_0 = .;
>         *(.bug_frames.1)
>         __stop_bug_frames_1 = .;
>         *(.bug_frames.2)
>         __stop_bug_frames_2 = .;
>         *(.bug_frames.3)
>         __stop_bug_frames_3 = .;
>         *(.rodata)
>         *(.rodata.*)
>         *(.data.rel.ro)
>         *(.data.rel.ro.*)
>         . = ALIGN((1U << 3)); __start_vpci_array = .; 
> *(SORT(.data.vpci.*)) __end_vpci_array = .;
>    } :text
>    .note.gnu.build-id : AT(ADDR(".note.gnu.build-id") - (((((((261 >> 8) 
> * 0xffff000000000000) | (261 << 39))) + ((1 << 39) / 2)) + (64 << 30)) + 
> (1 << 30))) {
>         __note_gnu_build_id_start = .;
>         *(.note.gnu.build-id)
>         __note_gnu_build_id_end = .;
> 
> 


