Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DAD653DDB
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 11:03:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468412.727509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8IPz-0007sW-98; Thu, 22 Dec 2022 10:03:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468412.727509; Thu, 22 Dec 2022 10:03:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8IPz-0007pp-56; Thu, 22 Dec 2022 10:03:15 +0000
Received: by outflank-mailman (input) for mailman id 468412;
 Thu, 22 Dec 2022 10:03:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLdZ=4U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p8IPw-0007pj-O7
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 10:03:12 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2064.outbound.protection.outlook.com [40.107.20.64])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7263c6f-81df-11ed-8fd4-01056ac49cbb;
 Thu, 22 Dec 2022 11:03:10 +0100 (CET)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AS8PR04MB8820.eurprd04.prod.outlook.com (2603:10a6:20b:42f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.12; Thu, 22 Dec
 2022 10:03:09 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::8084:fa5b:fe3a:fa24]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::8084:fa5b:fe3a:fa24%4]) with mapi id 15.20.5924.016; Thu, 22 Dec 2022
 10:03:09 +0000
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
X-Inumbo-ID: d7263c6f-81df-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nn7WAwtQKHWJH3hiNUvNI05hMRVtaJ3FsvQILYWTdtcOg2E0MFAPihtEZPDwUx4Avh7s+8QW0FU0d5v8lv/Ov8kiyJ71+ohfCGVDl44K3rGUeDNHwfjsYfE6e0QQql90gwUgWOs2yt2s+7kry4szHWk3CHsOGrBIoX7ig6HDZyVdbtVZBueErmxB1B8fOoRUNEdiZV8flMv/KnzS2E/P/tBTPZ+e7schICNHI8Do/T4VsuBmQQPBlaMSNi7ibKqt/VdXp9xJVlKaiUb/IeEQv+f3uLjxDMK/N5W+RDhfLTweJe/MOa4R05zViM/o6y2yattSRhRMXUky31c5lhW11A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+mgYqquBmVdXPJenKon82tBCG5zaN6dmlRekcDrR1xs=;
 b=k7y54b+qUZQK/kVdwjDHHNBftUHotB/TP3y11byWpYqm9XoYoZ2PKMqB03Db9EU/1J1uPnVXKIOkA3/PuAuwSIBk91/1OmoEhJ/Ha8gU8zUo6FmktjoQpVBb+ABNJQ/XO5UI9pxWBTm0Ope2sU9kZu5T1nJaM5MrCjR8E9P/QQVNnOgD1RKVYhQbkTCX4oRyKeuaRrxSg+stWp/Jdfz+nG/78NmGvvAghKM3z+lfuXigJkP3zgIkAmHkw2XwUwoNBK45WdreXwvydSLxCUlp6ung1l723W8whfI4uTMrGSIV/YC5U8vyy5yK/B26/mlyz/Kyd/LE6DCljiDmv9iiHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mgYqquBmVdXPJenKon82tBCG5zaN6dmlRekcDrR1xs=;
 b=4Jhx7dZX4D1uQQlXRIE0mU44HhqHrJpfusrTfEJSm8TYXxUqgmADdUAv49wzVrkEDWC4tfptJIwQrpTnxoccxs4I50rJQOVAbIrBEfvp33HIiPp6cabCF3sFTwCXGs54YOaZgZ37ZG48/lKKA6FfKPgUWP58kuPWaMHUDpaG1OI0qxkI8xA/gvLUH8iX9DkKHEZrQ9pFzgQETc1/O5gSzoxGprdEmKlTJpX5RfZ6JuOoB48EPh9JCjNxHmoELKybn20XvUR/2JvAn63Rf6hrWeQPogEBMEwNwWkwNYV0PW12wiuek4Jm9VqKYlwYZG/zqaUQUVmdlCCaPRccUvu4rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f7d54fcd-431b-8978-4a7d-024c27ee1925@suse.com>
Date: Thu, 22 Dec 2022 11:03:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 08/10] x86/mm: make code robust to future PAT changes
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1671497984.git.demi@invisiblethingslab.com>
 <a8920eef3254cbf470a0d35a887dbaf0e4907a6d.1671497984.git.demi@invisiblethingslab.com>
 <06dff83a-b120-a2b4-c61f-7864935d4c3e@suse.com> <Y6QodBfEc828o988@itl-email>
 <700e86ac-7efc-9d6d-43dd-a06bb541a1fb@suse.com> <Y6QqyTzD4FpPtiqH@itl-email>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y6QqyTzD4FpPtiqH@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0185.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::18) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AS8PR04MB8820:EE_
X-MS-Office365-Filtering-Correlation-Id: f1951c8a-19f1-48b4-851a-08dae403ba56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O0BcV5u8pkFFxZ6HT5GWVqibq/1WucMASW0HO6iUfCLzDa47+jpgUyoMX6vrq/PR034NKG00FhsupeU+2CLk5k+IrK8R/TosU+OGVvNWBiE58mhWniuoqyUgf4Bb2OQCusy4Turq1iWJnvA+Asw9sJ0AVU82hCbA6k+IiygAdL2ZYm9FDB3ThQF3wW1Izy5cRZGHMaUAYeG4qk9S7Za1xsRlldRGWpnsiWKmReryvPcvObTz4UDUB7VcC0A4sMPGmddaX128ak6Xs8B1AKesGdfR1rgCyR+ikh1Z72+hN1MKuYupKvXqP7PyPvBNA8PTvOB6FnhGmFnAlsqFjfmzIi9hEHOjPWi4//Eu9yKhqayNkDu+EorRMWHjV2AvwACIahCJBfv4H77c24dkTBythfugEBzsEnxxEBbRcSLme7Jw27vsRQ2EhlTZFbzlj6R3m4CBSVCr/9z//uHwjHz46GO1OkyWm1mmygDnOBqVECM7PBZYB0VtkLAgia3eGNIOfpa+hxHPusBAWfJkKfGAJin6N5o4lJY7ajpmghQ9RMFFR85stVUxDw9yGMtf9YlgW+FNKmHtdkJFFHX0HQE5Ktzif5J63udDxD2Q6K8Gi4xQeMKykDPqTv+TEEOKGUuI3UW/7AJG+AAsNr7wS8OsmXV2mlI7q+lWMO+ttl0U91iSEafKwJOdy1uYOtjR0LKE/lxmRJjIrGtXTh+6HDIpc+GVRWkb842w7gItpDR6QIg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(366004)(376002)(346002)(396003)(136003)(451199015)(86362001)(316002)(31696002)(66946007)(8676002)(66556008)(4326008)(66476007)(38100700002)(2616005)(36756003)(54906003)(6916009)(2906002)(8936002)(5660300002)(7416002)(83380400001)(41300700001)(31686004)(6506007)(53546011)(6512007)(478600001)(6486002)(6666004)(26005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Skh3bFQvaUNtMmFreVltV3VDMFI2ZU1EUGd4bXM0Rk5xUkRVRFJUaithVWxk?=
 =?utf-8?B?Tk5mSUdhSlI0cWlhRnFQdFNDWnE0N0swdlRIVXhvOHBnbDFLcEFqc3VpL2Fn?=
 =?utf-8?B?YmMzNE9OVGtHYUkxSkRLZHVZcjJWRjlvSWRDZWJxekNkdm5CeTYwdUNqb1hG?=
 =?utf-8?B?bFc4L2FGcFNScThsQVZXVVJ3dEE3TlVxcExNQ0dsY05zMXNuYTU3d3JRb1Za?=
 =?utf-8?B?OWFZM2ZzSThGVjR6RHpDOHh0eVovOER4ZTVVYjVwRUlNRGdHc2I4YUxxOVN2?=
 =?utf-8?B?aTJTYzhhV0lwbHlXczVFb1dQNWNoYzJ4QTI4b1Vxem1yT3hVYWl1TFpZY2Jh?=
 =?utf-8?B?cStUSlgzSGczYkhURVAyelgrSTY0OGtXdGFjeG81U3QxUC94WHYxKzhNSVN5?=
 =?utf-8?B?RjJPWURTTXhIem9OMlhBRjlxYmZrak9heGR1T3BiS3JPZGVDMjA0bVdQcmts?=
 =?utf-8?B?ZmxYUzJBZFFBVkVPK3ZkZzM1TmRWN0pkd2tWTEVXaXE1cjU0RVBmaG1HOHl1?=
 =?utf-8?B?bmZLZVdtMW1GYVhzWmVJaEVEbkk3QlRYMEZiUDI1UGp2MGsvL3hDWmlsdVpP?=
 =?utf-8?B?YzNlU1RzQkhuWUpkQm9EbjBXOHA1RGZYV1NEZytjUEpuVlpsRm8xV2hnaHlK?=
 =?utf-8?B?SWEvNHN5c1I2bGdIWDdzaGlNOTRMc3g4QzVuamhVNlZCT3prdis3d1hUYlJU?=
 =?utf-8?B?QUVHV0hwWU9tMm82MWJaK1hhaFoxTGRMdmlRTnBMeWlIS3c3TEJmVkxUZ1Ry?=
 =?utf-8?B?QW5xTEo3RHFoMGZkRTFVRDNTZzRhTmFub2R6RGZMVFhDUE9xeXJtZENQeUlx?=
 =?utf-8?B?QmJ4NnlMMFhmVWhqb2V3cGZTNDFOUjRXZjM1VDBXbkpuZmJhTXQ0eVJSdHI5?=
 =?utf-8?B?R0hqYmRPeW1IZm5VdEczZGNDU0N6Nk9sNWI0cWFHL2xEazlacWdVSXc0anpv?=
 =?utf-8?B?UllBMDAwRUFtOFFOL2d0L0xydnJmQXVXaDJKYWlHNlVaUmFPbUpHdGpoZU5v?=
 =?utf-8?B?aTZjT09kTldoTkxYbWx1TEVSOVY1ZytrOW8zd3ExVThSMmh4RENwVWt4a05G?=
 =?utf-8?B?d3YzU3I3SnFGL0VhT3VVeEt2R0pHQ1NlRndIQmlrRlQ2MVUxYW83NmhWL3Z3?=
 =?utf-8?B?dWRPWU93dzh1eWJzdVdicGVQcG9SaWo0Z3pINjhsa1ZYWlFJcXMyTE10QWxS?=
 =?utf-8?B?dVZJYzQrQWhUMDNHR1YxbXhZWWJYbG05dDhMd24zektadjVXNzcxenVDOFFQ?=
 =?utf-8?B?bmlKeHAvUkJkUjQ4QnlTWExzNEJmUmlsYVlSWUtPenZVMmsrVWd5eGlobjVO?=
 =?utf-8?B?TnJzYUdTVUk3K0ZvaVdPS3dSQWd6bmRJTlJ3cUlTNEw0WUd3YXF5emgzQ3h2?=
 =?utf-8?B?cUJiT3duRGNYZHNtVHRaS05Mc1NOd1VTNDhHSjZZM2cxMzJ5UmE1TVZpUk11?=
 =?utf-8?B?WlNrSHNpYjdwWkk5bi9NbkNZSnF0S2N2NCtOdGMyVFQ2cXJmbEplcjczUmQy?=
 =?utf-8?B?YVp6UDAwWloxQUdYUEtRN3dZeXJhdUlrNHlUMkN6Y1BpanJXamc4NVhzT0xm?=
 =?utf-8?B?bTQ5VHBSUFRBMU9IWitjVjRsSHpwbGgxMk9VMHhpbzEyRmJ3ZjlUZnFPQm5h?=
 =?utf-8?B?b0RpOG1kei85RTlyaDFOYVByQlV0NUhxcllvN3Z4bXdBdWFMczhyNTkrUksr?=
 =?utf-8?B?aFZ6SHA0U040ckwrQTJQZDRUY1ZsY2p3SXZ3cm1rcXo3aUhiRVRpNWxKckh6?=
 =?utf-8?B?aTYzZ2lvc25UT3pxeVQ2bXJhaW02NzY4cHA2RVNnWTc0TVEzU0JseEZXVXlU?=
 =?utf-8?B?TlRqQmc4Q2Jrd095T3FzUEdUaTlzdVlOblRYeDR2b0djcjl2V2lsZld0aDBo?=
 =?utf-8?B?bnB2cDd1ZWo4WjFsbWlMbTVraGd1cnhodWZOVzJ4VlZuTGNiRlZDMDB0Z3JO?=
 =?utf-8?B?eEhOUXVOWmJtTkFSNGZWbXJHYVF0ckVMSEUvNlBjVGd1TzZnUUJMYWxZajd5?=
 =?utf-8?B?Q0NicCtYTDB1TDhLUlNidCt0RlNSQ2hCRWpwSlpQaHAwUVBOWnBWMlEwNmJo?=
 =?utf-8?B?Vmw2MjlpMW1NWTFNRFBTTGVtcThpaEFqSFRpN041aXZwZnZQQTR5Uk1EZjJN?=
 =?utf-8?Q?qEQLvwSgZtTBavbrRAmZSPZnz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1951c8a-19f1-48b4-851a-08dae403ba56
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2022 10:03:08.9863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: upjBv4zprwuEo3C9nDpeOWODz+BxgzKs/mBlebAFvWHPMAiuWYzRtI7xUAGzUBxTQuL7MZvM59HX6L+rX20XlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8820

On 22.12.2022 11:00, Demi Marie Obenour wrote:
> On Thu, Dec 22, 2022 at 10:54:48AM +0100, Jan Beulich wrote:
>> On 22.12.2022 10:50, Demi Marie Obenour wrote:
>>> On Thu, Dec 22, 2022 at 10:35:08AM +0100, Jan Beulich wrote:
>>>> On 20.12.2022 02:07, Demi Marie Obenour wrote:
>>>>> @@ -6361,6 +6366,72 @@ static void __init __maybe_unused build_assertions(void)
>>>>>       * using different PATs will not work.
>>>>>       */
>>>>>      BUILD_BUG_ON(XEN_MSR_PAT != 0x050100070406ULL);
>>>>> +
>>>>> +    /*
>>>>> +     * _PAGE_WB must be zero for several reasons, not least because Linux
>>>>> +     * assumes it.
>>>>> +     */
>>>>> +    BUILD_BUG_ON(_PAGE_WB);
>>>>
>>>> Strictly speaking this is a requirement only for PV guests. We may not
>>>> want to go as far as putting "#ifdef CONFIG_PV" around it, but at least
>>>> the code comment (and then also the part of the description referring
>>>> to this) will imo want to say so.
>>>
>>> Does Xen itself depend on this?
>>
>> With the wording in the description I was going from the assumption that
>> you have audited code and found that we properly use _PAGE_* constants
>> everywhere.
> 
> There could be other hard-coded uses of magic numbers I haven’t found,
> and _PAGE_WB is currently zero so I would be quite surpised if no code
> in Xen omits it.  Linux also has a BUILD_BUG_ON() to check the same
> thing.

Fair enough - please adjust description and comment text accordingly then.

Jan

