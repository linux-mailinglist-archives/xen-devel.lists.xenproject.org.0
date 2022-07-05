Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 268BC567277
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 17:24:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361426.590943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8kP3-0002Z1-3s; Tue, 05 Jul 2022 15:23:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361426.590943; Tue, 05 Jul 2022 15:23:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8kP3-0002X2-14; Tue, 05 Jul 2022 15:23:53 +0000
Received: by outflank-mailman (input) for mailman id 361426;
 Tue, 05 Jul 2022 15:23:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8kP1-0002Wq-6M
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 15:23:51 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140052.outbound.protection.outlook.com [40.107.14.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78a8b146-fc76-11ec-924f-1f966e50362f;
 Tue, 05 Jul 2022 17:23:50 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR0402MB3384.eurprd04.prod.outlook.com (2603:10a6:209:6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Tue, 5 Jul
 2022 15:23:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 15:23:46 +0000
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
X-Inumbo-ID: 78a8b146-fc76-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UlIkhHgHDR8dshoMEkic9yk8cvDG9p4cCRqxWyN65rV7CUfXNSb2Qatr48HFvpiEjs7fh8wyiimaJUbF3ByQPX9RxHrbElbGDBX3rSnIFU1j4gKvLbqJ7jTdtzsmqW9VkqIyvfm2GLkpoBY4JBrvCO35aLmQuBzoHOl03PEMhSlP6pEMWIWJ9T3LUZ7NLG4zZVfwdIBTfQfGklTZVKgIHMtP2jQHRLTIvj72cwjkaugHKdEZCclR+NIDgkvSwI0QIzMNPHIkd7bnGYmMlE7LFplOpAFrBhX8F79dbSDsVNZMdBOgFEf2kCg0d3JaUuvCu2Reb+TVWj57Zj4Da8kQkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Raser1oRMnDf3FnglMlwWsez33cNCo08a0a4RUiHvl8=;
 b=AHj3BZWz8cNZ1GoYHLMR3tkO4VG9Wujig/DeQZAY6uaHkUFakjeanjy4sCez3W67m0LRKgXSEO1ZyviDct5tD6YqnDhZTDZyJwZhgCgvoLyErG1rHCcDWaKrRoMyGmfmQiLulOGrBVN4Xa2eu5A/7El4Bg46xsCyacp7YXrgFHzLJcl8yZ/7GJ00AQ/dveZb+KoV1W257jrAfMCPmQ26dDQpR1YbZdsh8JvxNWUMGXYIo2ddYlVF0haZHEuix+dnQ5F+jVrz6zfiJGpgu7XSVlCN6H6+FsEmwBet372+iSeTVew1F3QxhgZPxrMleJDn939fWCRFZ3s+fOq4yeX0TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Raser1oRMnDf3FnglMlwWsez33cNCo08a0a4RUiHvl8=;
 b=kTTVVUw0oBTlW63RDKjMay8x2DkpJ8oJYiFiUi2/cHe/IHKxAitv1+9wguzsl1fCLU77II3db1fL/hI58CMsQWI3bukFu8a1B7ZVrC8OXElc+sEHtEthb2wZC05j0wSsK/dcw5mAPti63YnNzKyzGwRT5vpQlwLyS90p1EbO0WHxDEk0ml1iV73XX1XcmABmh5VJhUppPSKGqdWrGtKDer8+MNZMDvj/pJK1aVWJjRa4JmeSYKIAXVpLe8KkcsHWTpnfuXr8w3JDkluivGd93BGwAoYRMOfljjkSRIXPd1TwUt4CxeyJXGEN7xzZoFz0pld2G/jL26PAc067eHwyAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b62755bc-4a1a-4c68-aebf-14b2faeefe60@suse.com>
Date: Tue, 5 Jul 2022 17:23:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 6/8] xen/evtchn: don't set notification in
 evtchn_bind_interdomain()
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1655903088.git.rahul.singh@arm.com>
 <0cb096d37f2ac6cb7c5aa04cad7ad5377a0934db.1655903088.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0cb096d37f2ac6cb7c5aa04cad7ad5377a0934db.1655903088.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e60f159a-de57-404a-c835-08da5e9a5a5e
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3384:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CVFU4bXi1EEsmq5qc64CXWpYhv3ekzmr2a+VPfycQMAaZi6ZPJgPaD2qVgDbnon++twU9fjRgm7XKQwVMJBMm6NOhkbFUmOwFC0jAeQG3I6Ck5mO7S4S5L2M3n3wn2a0cTKzaSKUnySib7HIeX3PkdZ4QDcrreNm0Kt9lv4oi2N+ApAfni1yyb0ciTQ5FFLGZrrjih8/KIUyV7PAasL6MUVqw9rOfy+qTR84aDSG1k/FIXvMwN/a/8a6KP6ohH4W/zm5U7vnYs9W3+UUoKCnwm81M9nHwYkpIb+xqZ5GEKcL6L/pBeVyPz9gNEXT55bWnhvKgb9U74EP6OazJf0W2T6fxetx33QSfLJT+Zgz4T9moJTeKmsr5z84DPdbUimnbPOiLzjYP/C4bJ9FRZdfyabVUsCmc3CJGv7ZortG/t+C54GgtzzeG714wpBiZgHzUAgKzRki+/6EyuPUt/HM+QumbRV/m1ik+UFoXBMLZFjsXIvpHzOyuUezxR0p+wRlzbw9o25gVB9IBxXgrBoecAc3c8j0JgasFnWffRH2//TftxIVo/p2oKjF6Nc+o/UbX+T4n0/rYRWOAzZbTR3ugRQIN+vpT6lgjrXGqBaX1DuAhU9GFraoGSPaB2dycxLa62KCxmxBcntkI9Jn7rZQu08qjRE36cwsd4RLPJNyWpD5+Xsn6kzu1VFL0bF2npf5lA+bC0V0/IPRqJv/Ub7qSOcWfaMbE2ekgxNT6fcm3aDoKmJeheBLb/YTCcLeJRToiEPHsBttqxWX7tUn3Lu6UoNEihnSqxmSiMjnDK6J9qgY+FmB1bOZOl5WeqMVobGbXSgRWnNgNURlVURMNxjgECbDMoJF5HTek3nQkeXsIeI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(346002)(376002)(136003)(39860400002)(396003)(478600001)(5660300002)(4744005)(66556008)(8936002)(6916009)(15650500001)(54906003)(8676002)(31696002)(316002)(6486002)(4326008)(66946007)(66476007)(86362001)(2616005)(83380400001)(186003)(53546011)(6512007)(26005)(38100700002)(6506007)(31686004)(2906002)(41300700001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QS9FR0xVNzREOEttTVduMlRsNXkrQ0Q5MGUvSkJ3bVpEeHhPaFRnbDZuWUZT?=
 =?utf-8?B?M2hQY2JMM0c1L3p4dkJXRWxDdjN5QTh6YTdWSUpNejlpWEVQTlRXam5SUkJB?=
 =?utf-8?B?V2hnd2FnVFJQTGdOZjVTQzNSTzdOUndxTkMvZVJneDNXSXU5NjY1VW1NeVNs?=
 =?utf-8?B?eFdCeHphdHJzdC9Xb1dhUDVvY0RDMkFVaUdrK2xYR0JxbHhXL1pzWVdXWlNq?=
 =?utf-8?B?SnVCQ09tZkdTaEk5b2RoNUxHOHZNTHpuT2RkQTRKNFZYdWlKdWtmeThmNm1a?=
 =?utf-8?B?MmNpY2NuT21VSHMvQ2l5Z0tpZCtvVjhVdUNuOUtCVTlXN09JQ0VGWFZPald1?=
 =?utf-8?B?NTk1bDVHNzdqVDBtTW1oMkNJL2Q0K1hmSitBOXZiU1FIRDhCaWl0aCtKSXI4?=
 =?utf-8?B?RmpGTTI5NTlsdVpISlZwNXVUcEk2TUJidSs0QjRveWZRTzlnWmtNMjhPUSsz?=
 =?utf-8?B?SHE2MTE5ZnZ0WmNadVpDYUdGR2RaUVJtblJKOTZ1T3NIVTl4WHMwL1Z4NlVk?=
 =?utf-8?B?YTNaaFgxcEYzRnRwZjVwOFErWjhXcEtnMlFHNWdkRG5hSjFBNnEwam1EQktB?=
 =?utf-8?B?L3Qrd0tDeGJwbUV1WjFWaVlZZm9rMXpsZjN6R2x6bk5EdWNHNHRrQzRJbGV1?=
 =?utf-8?B?NHBydlZpZzVacVFpelBCZ3ZKYldlNGdId2hmZkptR3Zibi9nQk9hY2c1VDJs?=
 =?utf-8?B?VlpBVUloWE81Y2VhNkJ4Yy8vSi9nQytvTmpETWtqbHVZMVJpQzlRdmNVT29L?=
 =?utf-8?B?OThPQUd3d0VMbzc3bFBrelNndGVaZUNrZ1d5OUJLa3ZTNmJSSVJQajBzNlJK?=
 =?utf-8?B?WkdFWVBkSndpWURIZXRESnpEeXErYUhja25zN3MvdzVvMTNYVmZjcVJIQnhT?=
 =?utf-8?B?RnBTeGhsdDFqaEliTlp5TTRhZldESU5FMnAxUGtPbXhVd0hxd2V1T1NpVFYy?=
 =?utf-8?B?ZS84ZTVFV1JVdVpqeTZwMzJRTSt3ZFRHazdVV1pWTWNhU2lOSnFzclhybGRi?=
 =?utf-8?B?WmpBZzZ3YnBLVWdWd3pNL0FJb1MrMWQzTW9LNW5NM3RpMVduT3QxZ3B1K3Ru?=
 =?utf-8?B?YVlpZ2xYL0c0QWQzSUpvNmw1SGtMSVVtYnpxcjhYQzdvbXRka0k0WmlWcWFK?=
 =?utf-8?B?SmtHbkVNNUNrcUVSYVdjL2pKeWlCU1VlMnRJT0xFMVEzellBaWFJZ3hSU0ZD?=
 =?utf-8?B?TEF6dkZ2cVhlNlJXS0J3K2RsejU3OHM1QlJWbzVuc2RCRTlOb0VwZG9DdDBu?=
 =?utf-8?B?bTBORFRYUlB1RjJ1bEtiSlBYLzU1VSs3ekpCbGROUWpJRlNXSDRYZVBsck0v?=
 =?utf-8?B?TCtjYzE5T3JTMFk3STg2MlphcDFuYUJiUVhFcVhVSkVlZHMyMHo0U2owNkRt?=
 =?utf-8?B?Rm91ZzZrNU94ZkxQR0w4K09qQzJyYUw0K2N3YXN2V0wyRzluRWloOUw5ZzM1?=
 =?utf-8?B?RmlRRnlwREFMNlJ1amxrWnNXcTArZy9PSU1rT3Mzck9tVjVnRThPQkRtUkNX?=
 =?utf-8?B?MFpScjdQZHZuRG4vVWJTVXlrL05OL1lXUnJsNU03Rkt6VVY3ZCtyZWFYMXRS?=
 =?utf-8?B?bGFSbDBsWStibSsyclVUSHNaZmYwaDVYMlRyMDZONXFXRXUvVkdNckg5Z0VI?=
 =?utf-8?B?Y2lIeXlzdUsrOGZlZmp6TXZxMnYrZzB5WllHWUFBbi91Z1hEMFVHSHo0UzR0?=
 =?utf-8?B?eUFxaVVnWElaZHFYQnJ1ZHpYVW9CUHpvVEdSRFpNUlBUS0J4V3ErT25yalZw?=
 =?utf-8?B?VmpkWExLQzlxV3BoY1Q1blZWaHIzRWVkNXd4eFNPRjdkdUNIRnUvanlONk91?=
 =?utf-8?B?RDE0d1pnVzF0SEJtK1FzUzBBdzRONHJicU5mSitHQ0I4Skl4Sko4UVlRNDFR?=
 =?utf-8?B?Yk1ISk9YdVgyQmQ1eitQbHo3LzdGTFJVWkg4bTBGeTRDRDNyV3hwSWdCUTgy?=
 =?utf-8?B?RTE3WG51SXF0eWtFUVgxM1U0Vmxvd1JxbSsxYnBYbC9mQWxYaHI0d3FPb3Zy?=
 =?utf-8?B?TXZuQVdPRUxITnY2dXNKenY3bWhwNXNmbHhCNlVUd2tvZnJxZURCRk43YmZJ?=
 =?utf-8?B?bWpjc1NQeTh4VXlJQkdOVDJzN2hkWWhaQXhOdnNqTVJ2ODI0UnYxRmU5MTU2?=
 =?utf-8?Q?cdAh12pcCp4uEl/Kn2DZ02JlE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e60f159a-de57-404a-c835-08da5e9a5a5e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 15:23:46.1732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Wl/4JjcR2uqR7kzy2MUnLMhx4iJ4kU3x865YFxc/sxUzxuhI3n7DL6lzY8GiAaRkpwO+GFFysUOGORxDHEWPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3384

On 22.06.2022 16:38, Rahul Singh wrote:
> evtchn_bind_interdomain() sets the notification on the local port to
> handle the lost notification on remote unbound port.
> 
> Static event-channel will be created during domain creation, there is no
> need to set the notification as remote domain is not alive.

So _both_ sides are (to be) created by Xen? I think this wants to be
an optimization _after_ the new users have been introduced; I don't
think the excess notification is a problem? That way one can actually
verify that the uses are as (at this point) guessed.

Also the title shouldn't say (just) "don't" because it skips the step
only conditionally.

Jan

