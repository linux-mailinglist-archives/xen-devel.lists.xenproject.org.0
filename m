Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 659B1588B9D
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 13:58:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379820.613611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJD1N-00081d-It; Wed, 03 Aug 2022 11:58:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379820.613611; Wed, 03 Aug 2022 11:58:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJD1N-0007zL-F2; Wed, 03 Aug 2022 11:58:41 +0000
Received: by outflank-mailman (input) for mailman id 379820;
 Wed, 03 Aug 2022 11:58:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PneM=YH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJD1M-0007z9-7u
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 11:58:40 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00068.outbound.protection.outlook.com [40.107.0.68])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c3bd893-1323-11ed-bd2d-47488cf2e6aa;
 Wed, 03 Aug 2022 13:58:38 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7325.eurprd04.prod.outlook.com (2603:10a6:800:1af::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 3 Aug
 2022 11:58:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf%2]) with mapi id 15.20.5482.016; Wed, 3 Aug 2022
 11:58:36 +0000
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
X-Inumbo-ID: 9c3bd893-1323-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iOt8YS0hUWBeIQGCiuP5/exRCUPUjIS1dSCzrGr97STCxEZTrq8DMUNL5CUT7cVesMDah7qCzq/LRMG8vRfy462PwpvMKaKeej2Bj1RBJZpZDYYMDzTxwRR+tV4UJr58JSA8cMkMVZxsCuxsXKJwF6U4jhaC/bAgUCn9khwpwg+yuQID7wiLcylQ/f34FEKJsOYsgjgLF3B4wTz4EYsYbIOCKmOurmS4fEWLqr3ZR7daP6qVNoSc9lwcR21sGgZV/J2tw9zrQ33IZvDD9p/vXzKS7VGAHsQ8ftRjYF3lq2VTSliy3ik9g+5TqsWwCQ5QX7+YAhh38X+j4kxOc03zow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9X58dBGrmsJDVuukOgpfhtgGk7sBVQMsUdtuJZftnQ=;
 b=C5j2O2EGmuDl60aA7aj0o+G+eWmR6ANfW0dh/HSjyimH2N1MoqN9ajGWbxRWrBy5Xeb30lWWAc2Tg8q8NeTGcG8DOsu0Em3+HICz7KDMNBP7EmnLkeH+BJpGjGBZzevtt0QMkO/GyWNjUJLXkh7yrJDgvGxBdd3QuZx0SuplwYwDUp8inIhkbNcwojylAeGztTP3xfNw9sP3apK2DNfn9UfdG2vFOpnvfbVQas0KnfcHVz2aidBaleFvh5jbEDzbL0SwE+P63Dp1Dw/iwAvvnURblG5GKV1dw8SKlB/BL/AwWFPQx3HJM75XE5EMhAicsqJOL+RaWbgoHj7FWhlj4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9X58dBGrmsJDVuukOgpfhtgGk7sBVQMsUdtuJZftnQ=;
 b=SJTRmv+cixrtLm8wO0IF2BucgUx7WUByMVfOdqnON73QcSLb1hUlUKUpMVUNeIoHD37r9BcHZAa94N8XISdgvC6cXexdZHb1fQBJBIYO4fn5pwYGwhmIRhFZDevdcOCg8thQiPZYBp4tm6rylUQtjZ2XicAGwyp8hLc7mweChSlBddyxm7gyoHC1juzmBXU196h/V76EwJJw4W09jv4BNnQ3rmXpFq1BfsjDaHQSMBxXR/ye2M0iwhfXa7JtcA0n3eymkPVXKPpSHdbQFgXEQhCgCgN0Zqi/Hg87BixDt16C0f00Dn1w1BnXdZnNkx0yXxcPVZ7YJOdhzn1Rsx3TNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e6adf8c3-0120-a737-aea9-6ae37cae3be1@suse.com>
Date: Wed, 3 Aug 2022 13:58:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 1/7] tools/ocaml/Makefile: do not run ocamldep during
 make clean
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Edwin Torok <edvin.torok@citrix.com>
References: <cover.1659116941.git.edvin.torok@citrix.com>
 <835ba84cf1fb7619fa6672d194aaf279795a5246.1659116941.git.edvin.torok@citrix.com>
 <6b7a9b52-d378-f404-57a9-20b148f2e7a2@suse.com>
 <FEF021F3-739B-4585-82D6-D13CDCBBC24F@citrix.com>
 <YupUhpinFKt2Dl0s@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YupUhpinFKt2Dl0s@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f34625d-6bf4-4f78-f130-08da75477ef7
X-MS-TrafficTypeDiagnostic: VE1PR04MB7325:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O0wQ/Z9lgIM2EXwV/nC0MzARDmuA+JrUCJm3FRMuzjK4xYYPVsvJ4aqZTLL814CvsUBjevv7pwQNBDMX812Aw8pqaXaF1e+Rq03k8F8dISqRWZB7rmdyhzVY8pSWLLg3q6XqEuGskOpUdSRVN6yRUW7i211nMiv272SJN6tiRunxh1ZxcUaCM572BLRyeucszLn8qncclUMvzw33ds1BBskWE0B75LLdPTIMZF2f9TKkh3deDEHUqnns24rGPZBWTCXWXLEr2v9Ex9KdvvfcHGvJGOlJCfyJ/1g4rWnHZ1WzqujLFjiYJ4lmpgvt6SFgJNK3PokAKE0GGn2Xs6m6h3S9otMCUW+vr/nOSgZLhXw8qrDDRIKX6dm4Gme7bju/g5nyresoT8yYxjwvy18jLqtX4J4Ot52n9WkxhRW65JYBsg5wVtGJSOilevxjEVidoR1t+2r1v62M71j3gUzrtdaxzgzwvqqjF43jNf2qm/RxMUyqKZnOFKscYS1sLxhiTyx/AXKJfv6bN8j6DowMB4NUVqfvFs5Z4SIBl6WUe5VfkTaQ3GkzrRxg/6h7wHLDS1fV0tVqlNpvUcAESYQTKbo85Zvq6BoJRGivRMQRh/Sghwhh/ZbG/6VOs1cUqFGFziNY4ji8DKMLtuq81o6fCUgPLZ3F6epSzbRvcul9aG8aqR/ATvfzlwXWaO+fmeZtNBWXjNbdGJMuBN4jkXd3xGq1QVeV2ckvqP+ldZtcfzpAhmV9hReAjG5Qqw+M4SDvvATj5IwiEoMgpmjK4DgyC1PMcD+ocqncPFb8XUt0gvQeDsS+PH50GFjZHsZI7ZHVLQzPR1zbpzB4Ic88+5JQDg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(39860400002)(346002)(396003)(366004)(31696002)(6486002)(86362001)(2616005)(478600001)(6506007)(53546011)(6512007)(8936002)(4744005)(186003)(41300700001)(2906002)(26005)(38100700002)(5660300002)(36756003)(31686004)(66556008)(66946007)(66476007)(4326008)(8676002)(316002)(6916009)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkhVdW1tRDhLdG9rZ1hETnJrMmZURStwOXQ0NFVWZzNOWWxMeWw5eEhvZFdn?=
 =?utf-8?B?WnFETTVDd3VoUHB6RXhNWWxMU3BJQXdZRDR1YURUSW1lTGNENDJaOFdKdW41?=
 =?utf-8?B?TVVxSDlqMmZvWEpUVmdWd3RtL1pGempvaDlBVWpzbmUwaTdtdHVwZHAzS2Ns?=
 =?utf-8?B?a0l3QVFPT1U3NCtsd0NqbFZXeXI3UTlkaStEZTRqcTFzOFErQmNiV21hMFJ1?=
 =?utf-8?B?ZTVBS1Q4ZHpMR3BLeVFEUURnQTFjRGM4RXRzblRmelRXcGcvTkZVRkxzZnI2?=
 =?utf-8?B?YUMrQXVtMDZCU1NjbEdOMVU0b2N2WllXZC9xSDV6cEZ0bUFka2RjMDNKU05E?=
 =?utf-8?B?Yko2bjRJMHJ4L0NCVm56WElvSjd6Vys2RHBmNTN6Y0txaDI3OHdlZCt3T1c0?=
 =?utf-8?B?amZrNGI5RlpCMEFMaWJicnZZUURiZ1FLN2FXTUUwRXpLcDJHakVEK3B0cWEw?=
 =?utf-8?B?MkpEQTAzOEl0QmVGVW14ZHlEVjY3azhzRmcxOFBsUmp1Sk42VDF2RFdpTzQr?=
 =?utf-8?B?WTV0RnhlVnNNS1Z5SG16eFd4Uzg0bmROOHRKaDEvQys5N09GQ29MSG9kNmRi?=
 =?utf-8?B?N0JEM3BQVHAvMjV0ZW1ld1pzanBibDR6YlgycSswVkZjZS80K1dNU0pYNHBv?=
 =?utf-8?B?QjR0bHphbnRnQ296RERZWWt2N094SEFGeVpsZVMrU0pOYVB1emhZUmdZVTI3?=
 =?utf-8?B?MlQ0TGtqYkpqejE4Y2gwQ2k1SkF2TkpEdk1pY0VqN0F6dERsOVU0aXNyT2hj?=
 =?utf-8?B?Q3lDMGltckNxY29IcTVQZmkxWGlaaEdTN3crbXY2Ui84eGEwdWZ4V0V4RXg2?=
 =?utf-8?B?Yi9DcERROSs0dWlTd3MzcEQxdGZPQmc4NGhrcUFxeG1BSWpvOW1OYXVlZGZN?=
 =?utf-8?B?SEovaXlaYzljYldBWGxNeFdadGY2bWVNRkM3MHVTY1RsdzlhVnhYRytKd21P?=
 =?utf-8?B?Q3RaYmpyZDhMcnRUQWZhc1ZNUHFQdHNVR2Q2Z3BIeEdUSHZYcTZ0NjdoRmxB?=
 =?utf-8?B?UjZzWHEwemJWaklvL3N5aC9ZY2trd3pxMUlZMUEwQ0s5TXJobWN6R2Z0Wmx3?=
 =?utf-8?B?SlhhOHJMaW9XdURMV2d3SFdZOG9SZS84eUg1Mm9BRmRaVDcxSUY1WU1qOEtx?=
 =?utf-8?B?REc1TDYrNnp6cWQyS2FncHBzU09Cek81amZ3dmE4MlozR21tL2g5L0EwU0FL?=
 =?utf-8?B?aHdCNGdSVTJxelh0WVJ0aG5OWnlaVTk4TUhkU1pPQWlrNjExanNvVHc2em12?=
 =?utf-8?B?NHNsWHhVM2pmeHZER3BkcDdlbmNIamhFaURldWpFRHJ2dXFNamFNT3ZEYlJS?=
 =?utf-8?B?NHVLN2lrckpnVXU5UGJGbDJJbWp5YXRaY2tTcitBTFJFOUF1QktKMk1nelR2?=
 =?utf-8?B?ckluVFh5YmlKOG5mMFA4bmVzcloxODk4eG8vbU1lWHFaMFI1UlFMM2kxV09U?=
 =?utf-8?B?cFl5dlEyMDFnU0JkcC81R09LMmlXRjduSjJQU3AvclU1YWkzeXplTWJGQ1Er?=
 =?utf-8?B?RHZoYkZYZi83MEZlRGRDMnlrc1dNeXp6RVBIQlc1bjZxNm13TjlnWm5Bd1RR?=
 =?utf-8?B?MEU0anhaS2k3aERBWDFSaEJJL0lmNlQzOTdMb2EzWStuKzh0Y29jNzIvTk9Q?=
 =?utf-8?B?c0RlN0dML01TaHhDaStqWjlqNnV6dVgycWMxNVp1cWhXSzlTMFZsaWVtUkJn?=
 =?utf-8?B?dzBsaStwSmpIYlRNelQyQjMzTkoxdXBvZldweElSeFBJZ3g3NUpEOGlFSnpr?=
 =?utf-8?B?TlhnSzRoUEZlZDkvUlZEbG45MGs3RE1YbnJScTlVZHJvcFhBSzVpOHN6YVFk?=
 =?utf-8?B?SEoydEUyMmJmTHd2OE95bTdzTUdlcDlkNzFNRDc2czZBM3JsazYrcFlZNVlP?=
 =?utf-8?B?T0xMSXh4Z1ZoVENwTzl3a3VIZUJGOG96N3lLYkpnZHdKSE8xSWhuY3Vmajhl?=
 =?utf-8?B?RTlDb0pDd1l2SWNXTXJZQ3A3cGRudVV2Y2s0T0pjbmI0S2F1eW9SbDRsQ2lE?=
 =?utf-8?B?RE5UNXVjeGZNMnk1eVd3d2ZGbkFDZldnYzJ3UDB1TG1JU0lPOUU0Nk1HYmZp?=
 =?utf-8?B?UGFxWmdUTTdFS0Y0b2kvcWd5MGprcWs3aDMrTmpVR1pabzE1NUZENStBM0ll?=
 =?utf-8?Q?eozvrkOQhlOxi78vAGRRkIflT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f34625d-6bf4-4f78-f130-08da75477ef7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 11:58:36.0746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1D2bedc591pckYa9OxlTefJjFwEdhX9IOi/85lWbUb+c+/W8M4dBaCHqw32ltTiDM43Fn8bwUy50xie5sF7chw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7325

On 03.08.2022 12:57, Anthony PERARD wrote:
> On Wed, Aug 03, 2022 at 10:24:26AM +0000, Edwin Torok wrote:
>>
>> -ifneq ($(MAKECMDGOALS),clean)
>> +ifeq (,$(findstring clean,$(MAKECMDGOALS)))
> 
> I think it would be better with $(filter-out,):
> 
>     ifeq (,$(filter-out %clean,$(MAKECMDGOALS)))
> 
>>  .ocamldep.make: $(ALL_OCAML_OBJ_SOURCES) Makefile $(OCAML_TOPLEVEL)/Makefile.rules
>>  	$(call quiet-command, $(OCAMLDEP) $(ALL_OCAML_OBJ_SOURCES) *.mli $o,MLDEP,)
> 
> Also, don't hide this rule, instead, hide the "-include", there is no
> need to have make waist time trying to find a rule to make
> ".ocamldep.make" and failing when not needed.

Hmm, this sounds like I should be reverting the commit?

Jan

