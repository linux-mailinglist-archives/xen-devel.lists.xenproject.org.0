Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EADD62284F
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 11:23:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440826.695035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osiEe-0005sv-Rm; Wed, 09 Nov 2022 10:23:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440826.695035; Wed, 09 Nov 2022 10:23:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osiEe-0005qQ-Oe; Wed, 09 Nov 2022 10:23:08 +0000
Received: by outflank-mailman (input) for mailman id 440826;
 Wed, 09 Nov 2022 10:23:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xaUo=3J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1osiEd-0005qK-0k
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 10:23:07 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20045.outbound.protection.outlook.com [40.107.2.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d134d20-6018-11ed-8fd2-01056ac49cbb;
 Wed, 09 Nov 2022 11:22:08 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8235.eurprd04.prod.outlook.com (2603:10a6:10:243::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Wed, 9 Nov
 2022 10:23:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 10:23:02 +0000
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
X-Inumbo-ID: 5d134d20-6018-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fxy+AFpiaOYJen5ptxwOCCrnqSx2m/qZ2ZJpqgBTYRCsiu0O+OX9ajPqJ40c/JB+1wVMdqokfHItPcg7y6Wx2Ry8IUTGqkzemXxXCMBeo5uDAsMRKmqcDFtlCZEb+SYhZZui7zmTWAj+RH2aRti3G+LXcPgkBxuv39kZlH094MIYFK4bqrdzzML1bWpMFMfOaSPdzaDTMsb2nhEpYOvD9FsukCScNR64oGK6kqMr8zv230WSzL2F3nTJQLYyjIvoYZPZjgdHKU9+qIbDKxHZNHdkS1uglePU8eoCG916jR9+OI2pK9vH5b/Zr7GlcRM0PMTqbkPS5ybyFUpJcF6Ruw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jRECr6tP4wvvHgzeKlxFk/LOVO7VZVdSy/dOcaq8ppA=;
 b=BdIJPvtN1yTMZyhn8fQJMOOkL1np8iSzczhtZ6/QvUEWRSLc0wR2bWaMBGSfZ+9ocz9cY16HYR5SiZmeq74exyGxM2QV8lZ7XQDJ5GZwpcYAxjNwP7AUAf44XRoXZsHywMIl5zsmtT75PBEZEfJc2Ru7hhgzI+CaCIzJoaeQZDSTDgH4A+lBTlteXHLJ95ZL2OlwztZ1yBFaLADQlchH+XgHc0B11eUTp4psjWuDtwz4W7JPbuWBQSG5JWUgIv49LZxN+B/BLn2bGzHtv6j/Ro1JVpNC+9RpJ5aZtDW2ccmoqMM1MJ3PmIgbycZXOLYLIF8rjtedcHNbWVwcafNogw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRECr6tP4wvvHgzeKlxFk/LOVO7VZVdSy/dOcaq8ppA=;
 b=ERySILirB4/KMJOFHFrn1yd/TAT25V6GYF2d3SFlIdc8SvIjEXn1oZGwxwMhBClzHO+mYIr6PlXbrfAPATS7NfgEkbegpNP4oVFhJ8NZ7FWRAm/GvKuAmGgfO6COfjGNAXOpe3puZpnS/2zrF7AmD20Hb069xKfs9UNnXHn1t0iw2YgGN3H2VOSa84pJVnCx2RjraAWtOoYmupqEC+Ddv5lsWlrFpZT/sAUqbLGideXxzdY8p2sik6+9Ee2oiLbbmcXWDplIkHobJTSOzAAbSMOvLYlcaP+tWkM+3qhhgeyewFlhHhnOkmpXLck/AAyElcZ7QZ443DaTglQzvB/ukA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <afbc37a1-99cb-ea09-575e-dc6448cd6f92@suse.com>
Date: Wed, 9 Nov 2022 11:23:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-4.17?] x86/paging: return -EINVAL for paging domctls
 for dying domains
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20221108113850.61619-1-roger.pau@citrix.com>
 <ae400ea9-ae42-9876-9c53-bf91ddc08a51@suse.com>
 <Y2qHOfemg/wrc07N@Air-de-Roger>
 <58d5e890-e052-47df-42bb-6cc84aedd4a9@suse.com>
 <Y2qOtSyuM43RfwAx@Air-de-Roger>
 <76cde159-088a-3351-56e2-0cf14e9c8116@suse.com>
 <Y2t87YE5acLfiClF@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y2t87YE5acLfiClF@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8235:EE_
X-MS-Office365-Filtering-Correlation-Id: c68cca7f-d6e0-448c-8438-08dac23c6207
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	51F8b+6HOBau0DVQg9lugnD2fya2W0dQvjk1NBnI6dhoKf7i60J+cBT6fSNSXM1n995a1xBdmpM7/vhr2qG8FOgAdLBnDxLggguB7lOWV/49FFjbljvZ/1j4Lz79hazYLyUbRTUXIIlPCc2Ke9IXclR4a4sEajNWb3YG1yBRs8HYCfTCfOKYnPhemMtyavwkeGfe8O+MBi3nIpAxktIRZ4LxHLWo9HGHADUN5GJ8CcOjy3iYRBsDa7hOZ0jbwoErLMcmyNRKMLbA3RAEOH/DERptJgqYHC25G3aHf3msW5/wapW45pDEivHsk70Cwbb02HUTyIPKgvyg5AJ9LcmUBz+DVOlaww6fWzijIgQcZhJA2kofkuJEV+TlEuOtbOB8HKiPiUPIEm5w61VUzc7NlB1WNKmtxDttkuFKGPk/PDtYDzR0bms0uQMelhGsNF5DDrUJ0zAHU1UNqnf2gtbrkLOHVNHMs7139U7nhD6MmrskzoxxiGCTfzwA73yneVK/15SuNpBazY5DaA7+OTBmGjWLV/vOc2exscQlZIkmaCNzz3hvnSO6KCay0qH9zD3aEF+m9qlqIzLvT1C8S7a8gWdobanDdOcefohSRrPKtMpU41Mhj3Sy8uqmc7bTg98vEFn40boWNuzu1elAtbptKL/Kc48c3auI8EUUlu6K9ZpX7lMwOevya7oTQDH/SQ0EHpbtphmW/uNTT+J+y1v8c4WV94bH78YjMsTE3zQu/nSozeSX2d0IXJB0PFYDVSCJW7069rUChv4GiNB8YEatcy7XqIA6P8L26i408fnfC2I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(39860400002)(366004)(346002)(396003)(136003)(451199015)(31686004)(86362001)(26005)(41300700001)(6512007)(478600001)(38100700002)(6506007)(2906002)(36756003)(2616005)(186003)(8936002)(8676002)(5660300002)(4326008)(31696002)(54906003)(66476007)(6486002)(6916009)(316002)(66556008)(83380400001)(53546011)(66946007)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkNUc1V5NWVpaE5IOW5aN2pCK3pwNkJxZ1V0WWc0M3BHczZSK1BSMDNzQVJZ?=
 =?utf-8?B?Q2drR2d1QzBXd1ZxZUkzR3p3SEZURmlnQWZkbEVIUmVCQ0xQRy92eHU5SHZO?=
 =?utf-8?B?RmFEOXozTE9HMGVLWStwUUpYeHZBRE1Cd0hyaXhUMzlFb3FxbU9aM2MraWtV?=
 =?utf-8?B?Wk4yU3J1R2xRa2Fua2ZvTFloZVZIZXgvN1QyTUNPazk1KzBnOVNrZ3ZwaC84?=
 =?utf-8?B?Wm1xUkhxbUZEVDkraWhlcU93Nm1XcUIrRmRLeFgxNEJqQmxTTHdUMHkrbFZJ?=
 =?utf-8?B?SFpsVm1HQmlQUTZFT294ZzNuVnkzOWlBMjhvOEhqUUViRTcrWHNSaWc0NUNS?=
 =?utf-8?B?WC9yOUxsVExHT2t0a2FLcko0TkxVWit2UkFxL3BYVFlrckhjalBvcjRLUm04?=
 =?utf-8?B?Z1Q4SWhQeTBTcVQzbGtDazNqeC9NL3IwTDJ2OG1ESHp2dXlkR04xcDQxa252?=
 =?utf-8?B?bXJONXFwOVN0L0o5a0xsODBhZ1loZ1hzZWxGOTI0VVZVT0JJSmlmeHpiejdl?=
 =?utf-8?B?MXV1M3ZyRk9haXpiUkZmR0p4ODFFaTdnSnNLcHdYSmNYWDdKK25wdUlFWkFQ?=
 =?utf-8?B?RGQxZDMrQUtDK3UvVWVoaUFvR2NTbVB3ZnJnWlV4OVNISTlPcGYyOTN6VStT?=
 =?utf-8?B?WXY5bDByQUtzck4rYno0MG1UWXQ1a3E5TmJkVUlBWXQxak1uN2duNE5kVlpH?=
 =?utf-8?B?Y0pOWXhBbllIN3RqeWJud21kUWd4WnY0U3dnRTVrSWN4R2RqUllZUXVtOHBO?=
 =?utf-8?B?Y1gwNTA2QUJ1VHBGaUpWbGdqV1MxV2NWMVVzcHU0eU16R3NGZEEwT1hxYzk1?=
 =?utf-8?B?UVc0VERsOGVpbWFSRUFGOS9ZdytSN3hHL2FuVUhJVXM0OGdhVCtXMDNCbFlx?=
 =?utf-8?B?aSsvd3FiSUdPZHRjeHhsNjN0ZjZVK1ZXRG1iMHVqOXY1dkVpOGh4SlJJVUln?=
 =?utf-8?B?Vi9QK3dyaVViUWlnaU5PWnNwV01aa21vTlJQdlVldVFNYmdnVXgzRWF6NVpN?=
 =?utf-8?B?ZnFYNjdCMVRxT09XNkxqUll2M3NNSlNMc3Q0QU13b1lhL2U5b3Y0RThZaHBa?=
 =?utf-8?B?Q3JSMFluaXFtYVI2VmRuazFlVjVvbmpKR3NKdDZWMndzNTZWb1I5dFBLNk83?=
 =?utf-8?B?RGY2Y3l1R0FValIxUVIzT3RHSnY2U0JpQlY0Nm9mdnFlakE1bStxczljVFo3?=
 =?utf-8?B?MUFxd1cwSUI0bTlXWWtTY3ZXM3p3RXhxM1lrZWwxVk80VTRIMk5yLzN1OXJi?=
 =?utf-8?B?NVFNSHhzUDB3RUllK1VrOTUxa2g2VHZBbERRY0JzZDVDSXlJeHljZ1NzYXh1?=
 =?utf-8?B?VVcvbTJNYiswLzdrMi9ud2p1VXJiVkk3SzRyS25LUXFKQ1RvZS9aWGMvbVpK?=
 =?utf-8?B?YTFkb3NDSG8yN0pZRWgwWk5kYmtKRVhwQkRPUEtZY1VzaVU2eDkvUFhEYmE3?=
 =?utf-8?B?clk2YUwxZDVTWWM2YlNkRVh2V1g2Y2Y1WWhNRzJzcjZFOGJyUHk2THdSbisw?=
 =?utf-8?B?MG1nTk5Ca1NTcVpCUndMNkNwSFdwL0pwVVlvMllBRjdNaGk5RVpDRzlOZVRE?=
 =?utf-8?B?RDBtbjQvTUdLSnNGMWk3LzhUMlRkcWVQc0lrNlZDVjMvQkdnRnhCMnhmeFBv?=
 =?utf-8?B?UDNLVUV3UFdMMDhpYWNXaitEakx3Yng1UmlRMGRBeGFmaEt2L3ZTbEJTSDFO?=
 =?utf-8?B?am01TmJkeXBuQjV1akJ5RlB4YW5yeC91Y0xFM09mSCtmTVRPbmM0aVVXSmdn?=
 =?utf-8?B?LzNESHVOQTlTaFAvZitMRklqa1RaVm9oVVF0Uzgyb0lScEE5VTF3enZZL2I0?=
 =?utf-8?B?aG5GSklUSjd1bjdSY0JiaE5xK3E3bU4wcFJCMzFSb21GbnBPbVJtLzA5cTU2?=
 =?utf-8?B?b3VpZWVVK2w2elZweFdYK1U4c3hFNTBiaFRIWGt1dW1EYXM4cFdDRngrZk1w?=
 =?utf-8?B?SkRwak55ajRVNTE1QUgxWXo3OG02Y1VDVng5R3ZWRldzWHg0aWdma3d5N1Yz?=
 =?utf-8?B?SEFvZmdzb2tQaURuQmUzZEl2WnhrbzVFT3BIdXo0ZWdObUhZeU5JV2FKRU1p?=
 =?utf-8?B?T0ZUT1didWVwRW9uVVcyd3dSaDhUVldQQW1jOXpxOThmMVpaQTRZOXVFd05a?=
 =?utf-8?Q?8fmEMNj8jwsk+9KbekC8ut2t7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c68cca7f-d6e0-448c-8438-08dac23c6207
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 10:23:02.7644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sFWuIj/cM0cvF/hp2bRp61ZN3dW8JN7N87bRxwBGnL1pjHoRVnkY/L6JTKS/ScUk1oDzcRG+aHgond6d4e8IZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8235

On 09.11.2022 11:11, Roger Pau Monné wrote:
> On Wed, Nov 09, 2022 at 08:48:46AM +0100, Jan Beulich wrote:
>> Finally I'm not convinced of the usefulness of this dying check in the
>> first place: is_dying may become set immediately after the check was
>> done.
> 
> While strictly true, this code is executed with the domain lock held,
> so while is_dying might change, domain_kill() won't make progress
> because of the barrier on the domain lock just after setting is_dying.

I guess I'm confused now: This code is called with the domctl lock
held, which - as said before - is a questionable thing, for serializing
things more than necessary as well as for holding this lock for
excessive periods of time. IOW I consider it wrong to depend on that
in paging_domctl() to synchronize against domain_kill(). Yet indeed that
should eliminate races at present.

Jan

