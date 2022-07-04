Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C302D565A9D
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 18:07:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360470.589877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8Oba-0004H5-L0; Mon, 04 Jul 2022 16:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360470.589877; Mon, 04 Jul 2022 16:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8Oba-0004ED-Ht; Mon, 04 Jul 2022 16:07:22 +0000
Received: by outflank-mailman (input) for mailman id 360470;
 Mon, 04 Jul 2022 16:07:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rvAI=XJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8ObY-0003ID-Pz
 for xen-devel@lists.xen.org; Mon, 04 Jul 2022 16:07:20 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150047.outbound.protection.outlook.com [40.107.15.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61992529-fbb3-11ec-bd2d-47488cf2e6aa;
 Mon, 04 Jul 2022 18:07:20 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB4938.eurprd04.prod.outlook.com (2603:10a6:10:1f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Mon, 4 Jul
 2022 16:07:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 16:07:18 +0000
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
X-Inumbo-ID: 61992529-fbb3-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mPWRok2sCGGycIAlABkByXbAYPk5RWkhijdDt/a+OFPxfbqkOf3xfO6BqyKfgNbuntRU731FoWYVRncJVXq6LSLkt9t+C873sZTk/kqXPO8JPu1VkgFZF2YYSbVEeyHMz2peWIyKxefnIrx3AKcJGg8zSzJnY2oz4CIESZxV1wvU0Ipyk++OWtEnQ2JYZgH6Hsr8cZoMXeLwXt6QyGn5FehaindcSEUnrR5JgtHciqqew16cfbdYBHgDen86UVmthtAgWhnjmmgKahgJ3e7KwwLAzcodnFdMraTS61exgt+7i719HThfrOyO2BBHIu4YQ+PsqUxwKDtYq91vhlkkLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrLnmREYn27xx1jqBfZXAI2eo/abf2oVC83FWsdzA7w=;
 b=dNms2NHWLchCinJh1H7iVUsivXu57OGbz2aUyNnMVGR31BKe+w3KB+zeqLXYXMJ3h+z25qRMVLzBmoCTPlB79Ysi8fwiJvGNL1WsuIVWyuW7pquX7NzTaIGvyJ6uxKKZcZLH7HUSAYWoLMou2LqmS93KAxO6WP6tP1/fdgJKUINB9r8YiM/ThWjXNGPL/xHaRDf/ylw0RheE9EhGQtwbZhRrGJJiHKk6pIx5uiRTJ0jEFSYKllCPjFQ7EY8Tlt56/GOugvBSedyk/uqz8eDdeoN1mDaoolYkiqpuZ//zZkmaWt7wU91UhjsH1C+b9XpE0TcY7kOeUvweAxB4+P1ZhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrLnmREYn27xx1jqBfZXAI2eo/abf2oVC83FWsdzA7w=;
 b=3lR7FepSH6oV2JZU65Y0mC1AknvzP28cIsMlD9wz4ZmvBXgtEs7Ek94TuJH28UKzVE56JgK0Mj+PQzkH2HmeQWPKrL3E4pw8lcq+bGTUjry+fKL7ISLu3I6y8Sjtp+Nt9Wi8kK2Id4tsNMuv7R1MxNdmQOWp3uiXgQR0B4Cfs9yg8bAq+qU8e4BSxr2XYWfZY/PLysTCJPL0sjj+O9gy4AHggqKCeOTjhXXFdPyZqr8WJBwqltvfKxTqsnLciS3q3wZxKqR6mbYkAzwpPl3pO/b8xFti3suvO3/Cp8eZ7mj/RVXERqM5+AzkygfeKTLusucsrARwg3shVIUzusDIRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7f58eb84-f969-dec2-dde4-18351761c216@suse.com>
Date: Mon, 4 Jul 2022 18:07:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: PCI pass-through problem for SN570 NVME SSD
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xen.org>,
 "G.R." <firemeteor@users.sourceforge.net>
References: <CAKhsbWb4FyqWBraid=99mfr=_wbXQHfKq6jBszN9-WmV_OiBYw@mail.gmail.com>
 <YsK3/fDX8c0Tzfv0@MacBook-Air-de-Roger.local>
 <CAKhsbWakmx6Bw+fJZ49pbcmRx68WWuSCpYzJDg7uiYWuEnu0qg@mail.gmail.com>
 <YsLmlIrCBt/Ldg1G@MacBook-Air-de-Roger.local>
 <CAKhsbWZkbx8WrmuhAO3P_UxFihx_4UZHnUjrKZaFV1uwF6ifEg@mail.gmail.com>
 <CAKhsbWbs_QZ-DN6duUKXGBsNfq0awXFbVJkdZ9SoNxa8ySkRoQ@mail.gmail.com>
 <CAKhsbWZOB4NscA04Ez4e0q1LUHWjH1ugUdY073hoBYUqOEGxeg@mail.gmail.com>
 <YsMP1+6/Txj5s7q/@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YsMP1+6/Txj5s7q/@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b50884ef-1a18-485e-e5ab-08da5dd744c3
X-MS-TrafficTypeDiagnostic: DB7PR04MB4938:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FnRB/H0CuImOPMCz1ShLYxNiHs//qhzUsbIGtiGABxh005RgAxqC5XFhPYoxnctDPmqLa4W1OCaMw/v2YkSNE3eCCUujcw9v3el8HwPHMtEVmUFXGI+e06XlQjDr+gmQR0Ai5BTkmcXjdSjuqW2fKgks5AkQgMqFSDTiAiij8OxfdK2WW6PEljlIYumhR+9RSWdI1R4/R2xibsyJp7EgfxskZ15odbeJy6WrZ/vlJYyR6ik37t/kMPszzGaQzf3h7dijzOndCCS9IzjNz8VJHF1lCjZoGg/OhrX+YiblC1orDrxXK5izz+q43zSd8QR8Hv3QNUIbOpy3q/CZElAk0JraDo4bJ+MWcPV9jsUJMgiSYYfMo6PkN2OmcFHfFRUCE7KCaUJYo8EQM3WeYLVcQLM4xatYQlcE07LG0+UeW8al2SvRcyb3GRMcX/kvqUkAsLlf44B9Z1y5wM9FtaIKg7r8vUw9KsEh1mplB9w4G3KN0oWOs2xBq0z7RrjkLCKIwi176nXIG16Oq00bVTkLj7s04tyJzV+WT+u5vinQnFAwZd2PDQRRzk25z7PBZB4tfcHfkfaGheQbfXZm00vl8YPY3uzdkTJwlt+pGUCegUVYP+Kv+wQyhU3AG2dIRT3nYwReAwxbr8owZwgDvX+d01dEmghiBBYrtfgN1gQh8kI+4msgMNfP5FilWONyMinRldY6CyGumZDy2BSn8ip75xShuWO3P88jxnpw/ZtDHt6EFSxOTrxcYLO1SsswS36pWW8W19H3Ox1oTJSdKmIL1ETRBo6oD5NXsAZYXv+uUskLIxpUuloLaVYf8h4vAaUBrx7nIIeHHiRMFIGvR4I9OLtHYMh7gQF/Z+bwB2Tegs4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(346002)(136003)(376002)(39860400002)(8936002)(4326008)(6916009)(316002)(86362001)(66556008)(66946007)(38100700002)(8676002)(66476007)(54906003)(2616005)(31696002)(26005)(6512007)(6506007)(53546011)(41300700001)(6486002)(478600001)(5660300002)(2906002)(83380400001)(31686004)(36756003)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2hPQVF6bU1Xc2JKQkI5dVR5NXBQSzRiT2QvOGRJWnJocEk1cyt0UFdNRXdC?=
 =?utf-8?B?V3dFQkFDMGx6U3FqMlRDcS9lTHlSM2tjdWtaekcxODBzU1QwWCs5Q0dNSzls?=
 =?utf-8?B?bWlGa0xLam85ek94K3dUTlJYcWx2bllTMHlZYXVKYmZ5amlTeitIS2djejV1?=
 =?utf-8?B?MFdDRkQ2SitsQ0N6YUh0UUpDZmRhSURTajl1bjkrS1I4bkI4NFJuUWY4bkR6?=
 =?utf-8?B?UDJxZ2tocWRDM0E0cjE3TnVueS9ud2ZmZUZhL3NYOGdEbWVtVWZwQUZoMEpT?=
 =?utf-8?B?d25kbWpXTVVkOWVBSUlMQXROYnZoRytIY0FxQ1lkemRTcnNQb0VIUXVwUmQy?=
 =?utf-8?B?TTF2TDJ6b01VTnFWc2dPT04wNGtIVm5BRzBlUWwwVEhXdjlmaHo4ZitORVFF?=
 =?utf-8?B?WEo4Ly9nUlc0THpoNDRObGNvT3QzYkF2QzZrZVBueTlmbHdEazE5V0drT3dJ?=
 =?utf-8?B?M1dmV3JNYWxjUE1sNFUveis2dUszMDhKQUNIY2pvb2JSNGdVNzlsVXpETzhB?=
 =?utf-8?B?ZUlIbDdGdzlwazIzSlc5TXIzcjdOazczalJocnkrSFpXTFZveW8weHlDMm8r?=
 =?utf-8?B?aEJ3a2psZ3I2bUo5YkRzV3pCYWpYNGcwZm9JcFkyV3JyQnBUc1FOeW10QVpj?=
 =?utf-8?B?bTRRQU5ZelFqMi9WOUhlVUgvZTN0d09tWFFRbnkrVjdNT01uYnNPUkdZNkkr?=
 =?utf-8?B?YkFTaUR4bnBNa3dnRGg2Wmt6LzBQMnZTUnVvc3FsKzRXY2ZZUVk3cWVXRXZU?=
 =?utf-8?B?eDAxTlFVNDVNUXVqUzdtZS9INC9hOGZvNFk5bjVINVEwc3oxcnYzZkFyUWZp?=
 =?utf-8?B?QkhBcHdBdnl6azJmSHUrR3V6YjBESGNYNHZ1akVlMXFxS0ZOY1FuSWU0RWpR?=
 =?utf-8?B?QzYzbHZOdlljODdMNXR1Rlprazh3bGZiUjJIdnAzUExxNzJOWG5STENIa0Fm?=
 =?utf-8?B?aERVYVZRdnBzQWVTcWVEc0k0M1pHYlpibEd2SlN0cHlFRkcrL2UzM1JRMzJK?=
 =?utf-8?B?UmFnYXJoWDEyOGRvTmhTdzdlYWhJbThSOHJLaVBja3NlUkdPcmhEK0J1b3JQ?=
 =?utf-8?B?cktBeEk2QVRSQzh4S2lWWWhFYUI0Vlh0RlRvU2k0RDRCYm1nMCsxc1Y3UW83?=
 =?utf-8?B?OGg3amRUK01aMC8xKzhtZmZVNyt5R2hkd1h3RlVCZmRMUXM5QzFxVldXWDht?=
 =?utf-8?B?aE10Wjc4Mnc0OTZyZUd0UGtRdDRnNVhrbUp1dFZ5Rk5kdjEyRFlHdHhETnpo?=
 =?utf-8?B?QWJBdW12bXNsL1VUY2g0elJGYTJCYmFRaXQ2R2phQnc5azZxeDJGN0FGR0dM?=
 =?utf-8?B?b3NDa1I3T2RPNEd0OVh3ZUVNVkZ4cFNLazhsRTd5dVlMWTRwTlhMVkdUZWVy?=
 =?utf-8?B?elNvNU1qSDZoNHNGenl6RnJpM0NaenJ0dklCc0pKRW5xZTNEL0VpV0FRS1ZE?=
 =?utf-8?B?a2JIUEorU2VOOTA0L0hQaGxuM2E0aVd5cldrVThpVE9XOEN2NW5WcEdaZUZn?=
 =?utf-8?B?ZmZpdWw4d3JISllEOS9aZ3VhdHo3UlJUZ3NFVG56WVVaZWtpKzJwS3Y4UktQ?=
 =?utf-8?B?MGwvSW9EZkpoMzQ1M2tmK1JVM3dXOHFyTjlEeHlKZy9rK29uZUJMUy9GTmd1?=
 =?utf-8?B?b25vcmVLTE94aXR1VitkZ1ZmdEFaMFlRQkpWeUtETE03NllNOUM2eVc3T056?=
 =?utf-8?B?SG1JMU5Od1B5VFB0Wm0venpHbmJ3NklFQmtucXMySGZhL2tsakFQVGZsS2t6?=
 =?utf-8?B?cDhrR1JzNGFHM0Y4VHF5TFJFWDBmSG9TdzVhMnRtQU9uaytDODU5SG5xMjlh?=
 =?utf-8?B?UVpIOGxyVlJnREx5bS9JbXNPVTFPa1lPQ1ZRMlgwNlFhRGozNlRZdWVGZE9R?=
 =?utf-8?B?LzQvMmlwYmQ2Vy9pUTN2RGo1NU56eEVjV3RiQkhVdEI1VThHKzdiMlZXd0Ex?=
 =?utf-8?B?MDlWbUZIZGNEWnpyQ1FZRE1KL3llczBabjg3NWlGVVVZeFVrTEwyaUJuWEh2?=
 =?utf-8?B?RFg4YWZPTXcxK0pGVk5maU9pMWFyUVg1bVNXT1pCQXVyVmVER3paTzFEeStZ?=
 =?utf-8?B?b2dDRUhHcGloS014R2dUdEl2dUg0YUZFTnF5T0Y3Vm5wSFBwUHVqN1B1UGtN?=
 =?utf-8?Q?QRQqNf5hJpqVQO0t/9XERAvz6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b50884ef-1a18-485e-e5ab-08da5dd744c3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 16:07:18.0949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TfezfpLUnrRAddoaLDZt+d1aUI/c/7lVvY7r/bxeWJvQzg5ERnVoD+6tDwqSYgVuXjxOF/LFVu7ApVc/HfjVTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4938

On 04.07.2022 18:05, Roger Pau Monné wrote:
> On Mon, Jul 04, 2022 at 11:37:13PM +0800, G.R. wrote:
>> On Mon, Jul 4, 2022 at 11:15 PM G.R. <firemeteor@users.sourceforge.net> wrote:
>>>
>>> On Mon, Jul 4, 2022 at 10:51 PM G.R. <firemeteor@users.sourceforge.net> wrote:
>>>>
>>>> On Mon, Jul 4, 2022 at 9:09 PM Roger Pau Monné <roger.pau@citrix.com> wrote:
>>>>> Can you paste the lspci -vvv output for any other device you are also
>>>>> passing through to this guest?
>>>>>
>>>
>>> As reminded by this request, I tried to assign this nvme device to
>>> another FreeBSD12 domU.
>> Just to clarify, this time this NVME SSD is the only device I passed to this VM.
>>
>>> This time it does not fail at the VM setup stage, but the device is
>>> still not usable at the domU.
>>> The nvmecontrol command is not able to talk to the device at all:
>>> nvme0: IDENTIFY (06) sqid:0 cid:0 nsid:0 cdw10:00000001 cdw11:00000000
>>> nvme0: ABORTED - BY REQUEST (00/07) sqid:0 cid:0 cdw0:0
>>> nvme0: IDENTIFY (06) sqid:0 cid:0 nsid:0 cdw10:00000001 cdw11:00000000
>>> nvme0: ABORTED - BY REQUEST (00/07) sqid:0 cid:0 cdw0:0
>>>
>>> The QEMU log says the following:
>>> 00:05.0] Write-back to unknown field 0x09 (partially) inhibited (0x00)
>>> [00:05.0] If the device doesn't work, try enabling permissive mode
>>> [00:05.0] (unsafe) and if it helps report the problem to xen-devel
>>> [00:05.0] msi_msix_setup: Error: Mapping of MSI-X (err: 61, vec: 0x30, entry 0)
>>
>> I retried with the following:
>> pci=['05:00.0,permissive=1,msitranslate=1']
>> Those extra options suppressed some error logging, but still didn't
>> make the device usable to the domU.
>> The nvmecontrol command still get ABORTED result from the kernel...
>>
>> The only thing remained in the QEMU file is this one:
>> [00:05.0] msi_msix_setup: Error: Mapping of MSI-X (err: 61, vec: 0x30, entry 0)
> 
> Hm it seems like Xen doesn't find the position of the MSI-X table
> correctly, given there's only one error path from msi.c returning
> -ENODATA (61).
> 
> Are there errors from pciback when this happens?  I would expect the
> call to pci_prepare_msix() from pciback to fail and thus also report
> some error?
> 
> I think it's likely I will have to provide an additional debug patch
> to Xen, maybe Jan has an idea of what could be going on.

No, sorry, not without - as you say - further debugging output added.

Jan

