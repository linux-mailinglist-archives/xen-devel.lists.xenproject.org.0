Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB0756720C
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 17:06:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361394.590890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8k8B-0005zT-Gy; Tue, 05 Jul 2022 15:06:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361394.590890; Tue, 05 Jul 2022 15:06:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8k8B-0005vy-D8; Tue, 05 Jul 2022 15:06:27 +0000
Received: by outflank-mailman (input) for mailman id 361394;
 Tue, 05 Jul 2022 15:06:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8k89-0005vo-Pt
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 15:06:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2045.outbound.protection.outlook.com [40.107.21.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0940f7fa-fc74-11ec-bd2d-47488cf2e6aa;
 Tue, 05 Jul 2022 17:06:24 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB6025.eurprd04.prod.outlook.com (2603:10a6:10:cf::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Tue, 5 Jul
 2022 15:06:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 15:06:20 +0000
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
X-Inumbo-ID: 0940f7fa-fc74-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EAtHXaa0lhoZt76IS6yQsJYdovcuq93izWnHsucSjdZ+Lcvc2z15xqkEv+71NAxhQSkTeo30pW2THv2fztsbo37iAHOKpqDjYl3AldvE5+W9ley8jexyakX9DnUZlj2mdPLfqvej4yNhEnyNQreVVP9YbFOXEemMyUgOMwYo1Kwkvrs3kywkNyMaTLu4jwAFs8TMXuiIAbfAl16Zy6zuD0H08jB3zy9Ch4zlAMqy7P+icVVj40KGHPRRMBWRrMWbJ0qRJsbTrJgwxP44TwNMQ+1j4mfbs0jP+UeqnhAcRshUI9qtsKGIgzQd9fNEa8hFE2RZLUMupCI/vrvNS+xfLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1K2o/RUtIEyu3ZgTyUpcbjVDofNnDg8YPvkvXfJ5DG0=;
 b=kitqLFWgWlkRZX99MKLhAdj5jaJojoPchSaerDKgG4ZEGAd5VQR8EKy2V1ngSzkmdspN7DvMQOHDvmhYoUskBDnFGEPTgDp+tVeiATK+oFXEL1O6Y9jvPrwdq0sfJi4G7wV4b1EJb7ClQ4cBrKLBv95vLhXXfCbEQzeUNZzTBbDCEBEV8ECCSTqhHKNEA0HgcrLa3YKW0ZhNDPG4a51hN+IOV3F7/fHzYW1vUFn3GM6TpfBjfR67culmOXle9GyLVNancpHzHZiq/sPEPDeA23UM7YZtk7baCfHRScccsYcGZ5Aynv5N64HMp3bTvBsTpYZOjZztNtQMZXk0CGhSJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1K2o/RUtIEyu3ZgTyUpcbjVDofNnDg8YPvkvXfJ5DG0=;
 b=Y8UHhwBWZVx6TlyOSa8T2dK/xaHGyLpDPXvduvWGhpZXBL/Pc6k36ML94ZggoKI/2/E17wt3ZUkF931kLpmjMhfDYRyLGEH0rLtmIhs7AswyuAXXYrns11/p3ctwZHX33OkMXqPjU76M0SALhEj0CvBiBNKEojnq0dBtr2dYhexxt+DipPTBggChB8UH2fO9G5v5xAZ2HOZXSHC9gXv/5bKSuq6akZ8/fSxss3Wzj7jtmXhm4n5aV9T87gn0tkz5SyHDlF/ek06NKC7kJq2tWS1Vw2fI5AU5yPt/SQJapr50ybUyeZOW9wstHtqBI7IukYBjPTtWqEDVnogIGc1SCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6a5cffb8-6510-8031-264a-807f3919ea24@suse.com>
Date: Tue, 5 Jul 2022 17:06:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/8] xen/evtchn: modify evtchn_alloc_unbound to allocate
 specified port
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
References: <cover.1655903088.git.rahul.singh@arm.com>
 <5ea66595248c41a011ac465bfabd7a7a40dcd565.1655903088.git.rahul.singh@arm.com>
 <2cdde2eb-33ac-568b-a0ae-b819b7b4161b@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2cdde2eb-33ac-568b-a0ae-b819b7b4161b@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR02CA0013.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::26) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84d49c29-3758-4c6c-0dc3-08da5e97eb43
X-MS-TrafficTypeDiagnostic: DBBPR04MB6025:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CpoQ/XfB0YSAMX3YB+VpmiEBrDa6ilqhp6VGlNczfS3e1YzAdhGMpDQhIjPD3TwguZHSd0+7yFltRbiAbcEdRkcj7b1gY2bxDdNHCILXXzBImqDLzMlWM3zPWBhySdZ+Y7HyUbarEZZ4R6etXid6fzhLOYzrqrfxlFJIVr5A1i89Fy5+LbUDwkvtjJqaQ+dNNBqU4Ebv7xKLmBY6TE6ywnDLXhYtkvT6FLVT+zLIeE3mFXa3AK2JuXqN9pFRuLh448KeYqLOSdS578mPye4vYAMTMGBZYIDE8un6g2NX4eLqJOWujGF1Cnv7q/KkdewDUDtHCbTke/WztbeZ62LFQsZmtMmISVtca5WIL6LbLf8SJGtjtvmALmDBlIbz4n5Wb8rqDiHYQBYHBTx6phqdtwBYKnxPBIaquLUYVjUwc2voMeX9wV3vzfksPbIPeWJwkdcTZUA3t/PDH19vsJ8as/d58Tdf34Z1uxRN+HdbBO/6b9Z9aCRHHOJ4/NGyqy/IItRi7wnkvCeV6NW6qgdFVdpXE//rFVWe1LF+MMCBLXxtdS3qMUi4UK1h7IjkXi5LfVYQSYIUCGIw/iKsQsPXMoRHLzcmstYKAO77F6F+f2Rq1ESRyQtUy/h2jL+893yM9ZH54IKaGMBZDiPZ/1bHCbBeldMmYOxId5BjMBnMGKo6o8Nilw3StLk0HjDfKsRjCz+4ezjQBBuXyByKY2VPOdE3hmClQzd8dTO5m3Atj5FV8tZJjcVWEkvzHWSHeOTaLkWlyZ/w0K1zlLcdOtZLgidHlOOX0RdGChPVYRe70GUGN0H/jeRzqHyiU0vZ3D1AZRcp7MIQttSxuV6dt/GzkWGcZ2ON8SC/FaOsftoTCoY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(376002)(396003)(366004)(39860400002)(316002)(54906003)(6916009)(31696002)(86362001)(8936002)(5660300002)(83380400001)(4326008)(8676002)(66946007)(66556008)(66476007)(6512007)(26005)(186003)(2616005)(38100700002)(6486002)(478600001)(53546011)(6506007)(41300700001)(36756003)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dktYLytZYUVBQ2poV2lQOStpVENzQzludnZvWXlVRHVLWFZGV0xpVDJTRmJq?=
 =?utf-8?B?NW54aC9aVDlpTElQYnNkOFJZeWtFMFVVYy91Z21pL2lSdkNpUUpOeW1oNXd1?=
 =?utf-8?B?WXh3Z2Vac3AxY3MzOEZyZ1V6cHFwS1ZjTDl2R2NTUDJwaGl6RHQ3dWU1NXNm?=
 =?utf-8?B?L3ZHL1lpVlBOS0xYU3lyejRZRnREWFBzaU1XVmlrcGpKWVQvS1hVNDdjckdq?=
 =?utf-8?B?Q3JDOWhjMFQ1c2U5YnE5RFI2dE93TjlCc0VEZFk5NzFQTkdtNnZzbmdMRlhp?=
 =?utf-8?B?cENaazh2cHR1Rm0zYU5UaVhHeTBUdENWZFRjMDdiSDRwRkxSdTU1WjFxM3ZF?=
 =?utf-8?B?cVRybmE1UFhrdDQ1RmE2ZjdSZ1RwRjB2ME5DZldJM0pKSnRNK3h4bFpkTm9h?=
 =?utf-8?B?QXhuZkhEUXdmM25vTW44V1NwNENWazMvVGx0a2FrczRENk1ucUtjYndUK3px?=
 =?utf-8?B?VlhyMnhQeEh6VER2dGNHUUw1bm4xZjR3YnFrQWROOUJscVVodkNWM3FOVjRO?=
 =?utf-8?B?djE3Z0h1TDVORDEvRW9IdjF0eVlxcGoxeWtxQlR2a0hsdEw2VDVvL1hsVVNV?=
 =?utf-8?B?YVNvcXJnQkNyeFlqTHBvVFJpR0V5ejZJVXg0cHV6RTMvQjg1S0VrRTNSc0th?=
 =?utf-8?B?WEV4TDArTURqKzQxekRUa1FFY2xtWnpWVUxJY0tCazlYMHJiUjR1OWhIcmJL?=
 =?utf-8?B?elFJdytMajlNUGd4QWZVQUEzL3BUQ2VBVkRlVjg4WERwZC9yV1dWNXY3bEVH?=
 =?utf-8?B?eWRzTm81NmxIazBzSkQ5cEVGaUtmZFFtbHFibkpVY0FzRXc5QXFUcE5PR0wz?=
 =?utf-8?B?ZnBISEVNTzkzdWh3TmVGUVhvc0dvMVErelMyTk1HNlRRUmxMRWdITlhpVUZV?=
 =?utf-8?B?T1Evb3JLQnkzUllUUGdLYksrdGUvdXkxQmdOaTJYbjUwM0ppUW9uQkJDSDRQ?=
 =?utf-8?B?S0ExL0dGWW9UNm5pQVRwemFWM0M3bmlRd1dXc05pWnpQU2VtWDQwbW1rKzdj?=
 =?utf-8?B?MVpKS0RrRHJ2cWxFUVYxN3lpb2VTMlJob2FwaWNrZnFFMllZRWtGS1dnTXR2?=
 =?utf-8?B?WCtwcjV4WHM0Sll1aUQrSHJJQldoZjJINUR4U0FkRCtxKzJpa0RaVjVybXF4?=
 =?utf-8?B?cS82VFIvdHp4dFFhVitINWJ6VU9MSVZwenRUYUcyTWM0ekRHUzB4L2szVFEr?=
 =?utf-8?B?TXJYRTM2TE5iQVJoQk9oMW84anNJa1kzekt0WHBJQWMwWTc3dDJ5ZHRPU2k4?=
 =?utf-8?B?QTBCVWxsa1dBS2k1amhlRmt2Y05oT3JweVJwZVRRTTN0WTgzNCtuMFNOL3JE?=
 =?utf-8?B?T3ZvelgreWZiK2RmYnlpeUd0bmdBVnltYnlzcFFWaTJDbndrbXliWGo2d3Zm?=
 =?utf-8?B?SzBkSWFreTZIRlR4WTdxcFJ2ZmxCY0c3NkJna1RRd3pYeDlBbzhrUGNLOE42?=
 =?utf-8?B?Tkd6RFN1MjVYL2FaZEVUYUZmVUtiRzBCQWh6L0VRYVNaUkhIdmFqOGtGajN0?=
 =?utf-8?B?a2VrUFdQdWgxZ0VmREYvNXE0Y2lacGZISVM1TWtXcFRqQXJhbzE5dTI2QW1y?=
 =?utf-8?B?THc4Ym1UaGcwcUJmaGE0TFYwTzV4ZUE4elFVcXl5SUpQMU8vaVFVRzJrQjZ1?=
 =?utf-8?B?K1RXRzU0VUdHZ0QwbkpLdVVieDkxeUwwVmhDemFUTDd2SWszK2tUT0VhZGRk?=
 =?utf-8?B?b0VmbEhYa3ptbUZTMzlwV3VMcEFPN1hNRDB4WVd0eDA5d01wcHJiUUNsRUxJ?=
 =?utf-8?B?Rjl0K0F0YW82Q2xZS1dJMml3TGl2THRtV3ZmVWlmcDFmM3hsYjEreldsRExL?=
 =?utf-8?B?RUtMOExDWi9DQUpkdmFiRURaWnBxaXk2WkxVSjdDRFVlanUwVEQ2Sm00UmVQ?=
 =?utf-8?B?cUxxekxNYTNGOUxyTFF4N0tQMkxIZHEwa1FSQ0VxOUdBQlBwa1poWTRQWGJJ?=
 =?utf-8?B?QjBtdENWa0dPWURjcnZrUHNwaWZzUk5TSzZCQkdxdHpGb0tGaTcwSWFBcTVh?=
 =?utf-8?B?c2paVit6TlFwQWJJdGxJb2xBWkFEcEk5RGV2d0ZFS05YRWFVR0VzcC9MV2U4?=
 =?utf-8?B?amQ1TDV4TVdNcU15S3BwV0xlTWFKWHkyTnRDb2tCaUt3bGlieTJ3b01VQWg4?=
 =?utf-8?Q?/B0bCGJy1muPMJnMokuSvAZDu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84d49c29-3758-4c6c-0dc3-08da5e97eb43
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 15:06:20.7552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3//4S9OvYDhH435YY9lr0Mfik+QbkwWXlieutfdDyo5AwnFhnH9GPT9ZuqjVLhWj26293N0nHsvrx7F3F89Drg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6025

On 22.06.2022 16:51, Julien Grall wrote:
> On 22/06/2022 15:37, Rahul Singh wrote:
>> evtchn_alloc_unbound() always allocates the next available port. Static
>> event channel support for dom0less domains requires allocating a
>> specified port.
>>
>> Modify the evtchn_alloc_unbound() to accept the port number as an
>> argument and allocate the specified port if available. If the port
>> number argument is zero, the next available port will be allocated.
> 
> I haven't yet fully reviewed this series. But I would like to point out 
> that this opening a security hole (which I thought I had mention before) 
> that could be exploited by a guest at runtime.
> 
> You would need [1] or similar in order to fix the issue. I am wrote 
> "similar" because the patch could potentially be a problem if you allow 
> a guest to use FIFO (you may need to allocate a lot of memory to fill 
> the hole).

At least from an abstract pov this is an issue with the shim then as
well, at the very least when shim's and the underlying Xen's alloc
algorithms would differ. With the nature of the shim that's not a
security concern, though.

Jan

