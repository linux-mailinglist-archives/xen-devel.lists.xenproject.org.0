Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D1B7D575F
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 18:06:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622158.969421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvJur-0002Su-Id; Tue, 24 Oct 2023 16:06:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622158.969421; Tue, 24 Oct 2023 16:06:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvJur-0002QA-Ev; Tue, 24 Oct 2023 16:06:01 +0000
Received: by outflank-mailman (input) for mailman id 622158;
 Tue, 24 Oct 2023 16:06:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=krZT=GG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvJup-0002Q4-T9
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 16:06:00 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2059.outbound.protection.outlook.com [40.107.13.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 386193fd-7287-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 18:05:58 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8922.eurprd04.prod.outlook.com (2603:10a6:20b:409::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Tue, 24 Oct
 2023 16:05:29 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Tue, 24 Oct 2023
 16:05:29 +0000
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
X-Inumbo-ID: 386193fd-7287-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GL+ow2ZkEHnD2KD9GzSTJk5zQ1PnlbkdbJ8TdHY6LlXXucEKhC8cYLZWKhzRvw2WaFLjTekEyuYu9UbDEzxdXYgVtHrViXIYuNgajgPCVsnJb7+fR3U/ZVkiYNWZY3JgK9BY95VIcpyvBZIwkKAmg+I81B/rPP2fZCSs2hNawzFp2+uNMTucGIzA1uGrk4llXf4rOqYf7Rcjzy33u4LOjPbde1m5wZTHQzp5Npq5gaoBVpVMpoKpN9QLjXd01w317dmnhWfvKKOtap77B7yfv1n660MpekPlyPqHtKwRk29OpayCsRvFLknAwlFVzydrBeXh8OjO48kQ9gYEEfyjQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+GoKLKJWy4GhDflO04Brfcph0A3Adg6c6OHB2iNZnu0=;
 b=dHXMyQ52dGZTuUoNzGh4AACvqoYvBKs+GC4Jtj/K+qRLDw9vV5AZdSqTfCTj1lbytUeBl4NB0dMGqYOO+02/0ZNH/ILXGSsWeoiRzfa6BcgySRLemeaJQqNn/+o6n3vDUobRrsOnG/T+QAKrfeL7d9B449wdfM18VuPFT95ArsOfylw3ADuDjn4gCQN+/JAJ3MC1T0QDwuei8Fm/z0hSTC04S8XfvZoryZtH+b+yL8b5kImWq7+nc/iqx6yTZZTriPoINiPXrQ34/QFMHj7hnI/BTcVYMgcf/u1z4MUveJpumQwSQWF+m2d2TuMHKwrjSiKbLPWRIHmr0ADBS3B10A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+GoKLKJWy4GhDflO04Brfcph0A3Adg6c6OHB2iNZnu0=;
 b=HdMew6q6N4ohRzXNq1zcOI2FN4GXjdZ0NntoCDJ1NF0uz/5Q+MIYM9+hUrlJxqQMY/oWzkoICAQEebmnxVx80L3TLjpZ2n+FgByYhRJrzSVoC4+Bn8G6XbQh8xWhp9UGhaPF63msKoNYH4KHfo5hSuhiZDJ3LHwjHvzxgLzrTuEmR0OZwgbIT6lYThnw2rrGKV6LRMXZtyjFUN5ara0hO6XwDef7TjIkD39a3LSsbRWmF1dmGjDDDFosLFysmFuNQgNfGLXlM9rgEUZnGrXabpHpwBqNIaa6Djk+DdfqOCws1BGwkElG9Pk4UCgTxnlZttCRuMTGs8Qcpub6xOEXjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ed88161d-a2e9-8005-729b-b81eec9b0a04@suse.com>
Date: Tue, 24 Oct 2023 18:05:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN RFC] xen/automation: add deviations for MISRA C:2012 Rule
 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <565552f9e7cfff56fb1d1037cfa9662a1818c5d3.1698153310.git.federico.serafini@bugseng.com>
 <4019825c-3307-8e0d-63f2-22d651a7ca32@suse.com>
 <91821158-66ff-4c4e-b117-9b7f0f17eb10@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <91821158-66ff-4c4e-b117-9b7f0f17eb10@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8922:EE_
X-MS-Office365-Filtering-Correlation-Id: c6c3184b-7e00-4fb8-537e-08dbd4ab0b07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lq31KSmgeLMcY1L7GcVzb+/6tqE/ntuAaNAPPHGU8RioEgXWlVBZKGVraLFIC2fnJo+Iyy1FAgyLns5QerBrH2E00dlMCxHhyc41j5t0QYvOaW3KFlwmFou5xE5LgYWOtOoktQn73vCZiqlOawuh6LnWjYmmmy3GVIOM+7QO4aIgxWk9sjGcaO5Iql5ONl1rO4mPFLBOdoim9+Cb1AXCbARZeFrDHpSVd1cK4bu3CJod7RKeBl6fE2aol0W4/c2jBppD6m1Vb0zm29cbXxY9r5nUZgBy9/aDe+5LOUa0RILQsgQs4Dc1xt4wWzEcoCVSDB2QSOW6ytA3ma1wLCbUm3ERiFJ44aam7i8zuCYjtzwdfaXnWl5qhcAVO6nSw2wXBOOQF9Et1+ys5Tx8UnvzPEvtPdXeiXBt6a42EWB/DX0rh3ZewrP0gq7io6a26iRhUMHYxfmVAaqSEpVFMXyfLGScYjVF7z7IEe59ECucfAKGt5K9xJNYbkMQuYV5xbiVIklV1u+BFTOcczhwjMdGyfJdPc3+RqafJA9+6VH/8gOWH+4hHCymBTlRO52lo7MKXpIjkfO0u/DgmeTTlO1wYMI9CxCqLYoSZ1K1PxgXW+HenXFw2Efg63xGLZlLUdWoXlaSup1+VLY/oVIM9HOS1A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(366004)(136003)(346002)(376002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(36756003)(2616005)(53546011)(26005)(6486002)(6512007)(6506007)(38100700002)(316002)(66476007)(66556008)(86362001)(31696002)(6916009)(66946007)(54906003)(478600001)(83380400001)(31686004)(41300700001)(4326008)(8936002)(8676002)(7416002)(2906002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXhCNkJIWFlsSHdjR2kzeTVvS2d3NHZQREZPV1psSE96SFpDdXh3OThCR1dI?=
 =?utf-8?B?MXZ6aUNFb2NKejlpRFpoNUJyR0xrcFExSWVYZ2lKdEY3UDd2NUVQWmdoaGRR?=
 =?utf-8?B?MkdIN3BkSlp4SjdsK0pGZ1Buc1Bna3Y4NjY1aUdYYnZ6RWxKTDNSeGZRaHZi?=
 =?utf-8?B?UVd2WFR1aDllZVdKVTkwNHcrSTg3U1RNU0s1eWdFUXkvdjh5d05JRFZteFox?=
 =?utf-8?B?RkF6Z29KNDNXdUFWYlhXa3dqYzd0MndmV09kUlBmNXFBODNTSHdxNkZTbmI5?=
 =?utf-8?B?U3JmbDl3YWJhZEpIWFEwRVFZbGJGdU9rbFNUN1IyT3B2UEJxRmpiNFhyQm9s?=
 =?utf-8?B?RWpJdlhCdWhWMXhmUzZtT1Z3WjdGeTVFc2k0NDNtUmNwWUNNSi8yODZRSGti?=
 =?utf-8?B?WlBuTEhTdHlCYkNHQlFLaU9TZlJHdGwybmlnZDg2VHNqKytSNG9vTGtNS3Nu?=
 =?utf-8?B?SUZFZytOOC9IVEtBUE5jTkpTMkVRU3gwYyt3ZjRRWjdhOGZKME12WGJQcys4?=
 =?utf-8?B?UlIzYUdwVE1oZ1ZhZmp3cGo4aFplMXFUekdWU0c1Qm0rZll2NkhudVNMdm1U?=
 =?utf-8?B?SXNkVGVXZ0dnaFlMTG13NjU2QU5vd2tlbEtvM1lUeFJSL1hlSzlIMWFHNHcr?=
 =?utf-8?B?MHlRZE9VeWFmS3NndHNHYjBoTzlwY1dCWFd6bndSdHlGTTVzek80Y3VYL0dp?=
 =?utf-8?B?aDU1SksvczRETExUb1hXN1B6ZUcyTmIvazY2MTlnMmQ5UUZka29SSkQrVzZz?=
 =?utf-8?B?anhvVVJxWjdSMVdCNGdEMkNSUFFlTnVQQUF5TG5ZV21ReTVDWE5UQ1BKYXlm?=
 =?utf-8?B?QUFxOVlnQTVuZ3VsWWJWV2VGWkNrRVFXS3Y2Z3NXSWtDTG8vQ2NtWGxycVJj?=
 =?utf-8?B?Z3JIYzFlSzFtYUthejg5aTVrYlhTYlEzT0RVdTVyckJxTE9FTVlmQmdmeVVZ?=
 =?utf-8?B?TGpxa2hYYktQM3BLaEQreTU3bXkxdkIzMElDVUFBbWpzSUtnZzhxMk93Z0F6?=
 =?utf-8?B?MG9pcURMSE8wcFR1NlY3S21FeFUvdlIvTzNRV2t5YVcwc3QzN2RuMitZN1Fs?=
 =?utf-8?B?MVgxeGtPbmZBZGw1SDZ4QzRxbVhMSy9QVjlEY3AvY3JHTWYzeE1abUVpTnN4?=
 =?utf-8?B?Wk5CVUlYc1lhTHRKVW82SEVrNHd2WS8zQU9CUWpJaGcxYjF1L2pMdVNWYnlQ?=
 =?utf-8?B?ZmdjcHF4YTVBUHY1amJJR2gvajFRZTBwSldFV2F1ZXhUR1l6MHRJK2FuRXlN?=
 =?utf-8?B?ZDRkVHlRdmtYNkk3VGRrMjNWMHYvQS9VRVVpUXVFcGV2d3Y5VFJOcmxuUzhM?=
 =?utf-8?B?bk1SNDhlVWRHSXE2L1ZKQXlxZkZmUS9uWVVRZWg2MEtrdHluMElpbGlpUDBM?=
 =?utf-8?B?VndqZWgySVRoNzNETjlhRGlwNnhuQVFOMGk3azl0SlNZd3dxTGg1cDlLczVN?=
 =?utf-8?B?TGp1a0g2QjJXNytFQkpMQWhEWUMranZ6UEZQWTR6RUprL3ZaUWVPaFpZSW1I?=
 =?utf-8?B?VHBrREIweEZYZThrcC91VUZ0WWpIODFnYm9xbmVIWThyczJIZGIyaHhrSzJH?=
 =?utf-8?B?bjEwdWR4SzVkMExCejBybkI3SkJHRDBGNVFTSmxwaVJjMFVhQ1BtcE5rSzFF?=
 =?utf-8?B?RHFFQXVnand5M0ZmODBZam9HUGVBc3VHOElBcVl4cTczOHdRYWZvRExaVmM3?=
 =?utf-8?B?eTlKS0JRTHpIUTFTS2orZ1E4U1lIL3U2Z2dCTE5DY1EyQmRESTcrMTlEMmsx?=
 =?utf-8?B?OFlDbzJGczVzZC9nS1hOOFNoeit2ZzA2VjZNQi9hQ1FoeVNhTFVwRG5KZlps?=
 =?utf-8?B?ZUwwRE40bE5IUjBLaWRsQmNPcGw3aExCU1I5ODNaMGRCUERTaEl6T2I4VWt1?=
 =?utf-8?B?eXpEYnd0SmVzMlJXR0dDWTFpc1lPVklqSS9rNVgvS2ZvY0RvcHVGOU52aS9x?=
 =?utf-8?B?ajlSQzhhTmJ5OG84QlNBSVc3em9VaHdKQUY4aVVBamdCTkdTVXJlSkI0WE9P?=
 =?utf-8?B?eFNDbmRHcmNQQzFVRmVVOUttTkJZWWlaN3hIWTg1ZjQ2a29tbENsZUo0aS8z?=
 =?utf-8?B?cEZxRnJ5U3pTZU9DTWRIeS8yVzh1eituYjdGRGErNGlzMzBQdXVac2xFNEl2?=
 =?utf-8?Q?hhLAsl8lTPNo7hlk0Vq7eFTxq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c3184b-7e00-4fb8-537e-08dbd4ab0b07
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 16:05:29.3776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fEhUgscubzXMGXe7a4i27hibowSRXgXb7r+WtTSLPmOYm8uroADhhuRhsmpCHhyPKIKAikCOCFLJJp9IIVJ4Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8922

On 24.10.2023 17:22, Federico Serafini wrote:
> On 24/10/23 16:32, Jan Beulich wrote:
>> On 24.10.2023 15:22, Federico Serafini wrote:
>>> Update ECLAIR configuration to deviate Rule 8.3 ("All declarations of
>>> an object or function shall use the same names and type qualifiers")
>>> for the following functions:
>>> - set_px_pminfo();
>>> - guest_walk_tables_[0-9]+_levels().
>>>
>>> Update file docs/misra/deviations.rst accordingly.
>>> No functional change.
>>>
>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>> ---
>>> I had a discussion with Jan about the reasons behind the choice of parameter
>>> name 'walk' for the definitions of functions guest_walk_tables_[0-9]+_levels()
>>> and the parameter name 'pfec' for the corresponding declarations.
>>> Also for the function set_px_pminfo(), it seems that the parameter names are
>>> different on purpose.
>>
>> In this latter case I wonder why you think so. Did I end up making a
>> misleading comment anywhere? It looks to me as if naming the parameter
>> in question "perf" uniformly would be quite okay.
> 
> No, it was just my impression.
> What about the mismatch on the first parameter "acpi_id" vs "cpu"?

The two can't possibly be used interchangeably, so whichever entity it
is that is being passed should determine the uniformly used name.

Jan

