Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED652566A87
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 14:00:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360814.590258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8hCw-0002OC-AY; Tue, 05 Jul 2022 11:59:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360814.590258; Tue, 05 Jul 2022 11:59:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8hCw-0002L1-7T; Tue, 05 Jul 2022 11:59:10 +0000
Received: by outflank-mailman (input) for mailman id 360814;
 Tue, 05 Jul 2022 11:59:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8hCu-0002Ks-Dt
 for xen-devel@lists.xen.org; Tue, 05 Jul 2022 11:59:08 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140048.outbound.protection.outlook.com [40.107.14.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de7e000e-fc59-11ec-a8e4-439420d8e422;
 Tue, 05 Jul 2022 13:59:06 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7898.eurprd04.prod.outlook.com (2603:10a6:10:1ed::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Tue, 5 Jul
 2022 11:59:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 11:59:03 +0000
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
X-Inumbo-ID: de7e000e-fc59-11ec-a8e4-439420d8e422
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQlXatSYyAPUb8RcCXAl1TM/eIlVgASChECw7lfQIYU83ASK9dj2TlYbWCLfxtuEevruuihunEm5RN3nxzHnwKC5QMWaIbbtJm8cNKwDDHPdvPTvXwB/v/R+BBmf6CzbQKpCstBDW1rBSp4lVBff3MK4fcxD5ipTe7pDRvExpjkUl6bbXva6JT+4PDi6akXmY69du+lZsHEOX3boQidAQ4GUxjwpjr2F0OjIWXT9j2kEFsr+/gOUy7SeuvevcJOlDtvWRsIQT/rkMrnIEMgvuPGQ77doGG6z7Ihzbk8ciProUA4H88G5wzk6D1jeM3FFYsy86pZpBz3pM2zUCb4ZOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z69hHlsITH5q8CXok0Q2UKGeWhmtuhywEZWkEyPNaP8=;
 b=B4tWdzDbynmEpashzUpM65BsyjxbvdalslrJohMH8zKbeUDRokz8cWAeGtNaK4KdwzVGFwECj74oZ1OSPAz88P/6QOBwNyN87PZf0lEugh/UM25uBCe/7n0SjDAaWLb5ufziTxE6D6DTdOIWQDASqsFuMCUnNnYRNdJk12s2WQG6jKhVzPXUD1VZR+nY/3h0qw5zfTjhlE5LkrjvXkZlenpsKtoCqjVX3K/PgnLDvMaN/nW/e+vY0F2/eIS0+ZBcMu/pg5OjXgtpHd+F25hcsOWP9Hj+vCkkOfmzEMtRtYEdFagVVnLL00KzSQT1zREkhIK8H+Q6JIX08/NdwJJVhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z69hHlsITH5q8CXok0Q2UKGeWhmtuhywEZWkEyPNaP8=;
 b=ZxBVeWf89yPuNkSPjmYXYSGNJL18x7n4bCj9L5JJ2P1khXGf9v8anPvtUaaM3PZS1h1KdhcNI48QS73yNDjwgR+aC9V4Y8ESGZlrrRXeuCd1jm6x4RBpFsr3QOL98McVo1X9cf22UPPLCPFEIEKmK+6Rn7QlvOEC7PDohpw+Nm/3Won3iSVVXvParwwXumfIXVJ4PTLgRGk1Q2IVy4991dvFk3063dbsvjpR77ypawW7sQISeMvN2KoErb6q9r9141MtoGLISsd1RDqq1W9lXV6awhCmP5YcCV/V7wwW49rgCbgLCt33ATnfcQqbWROTgqIWnkRqucsA/5RYYBuddg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f689313d-cd8e-80b9-d2ea-7120610a487a@suse.com>
Date: Tue, 5 Jul 2022 13:59:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: PCI pass-through problem for SN570 NVME SSD
Content-Language: en-US
To: "G.R." <firemeteor@users.sourceforge.net>
Cc: xen-devel <xen-devel@lists.xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <CAKhsbWb4FyqWBraid=99mfr=_wbXQHfKq6jBszN9-WmV_OiBYw@mail.gmail.com>
 <YsK3/fDX8c0Tzfv0@MacBook-Air-de-Roger.local>
 <CAKhsbWakmx6Bw+fJZ49pbcmRx68WWuSCpYzJDg7uiYWuEnu0qg@mail.gmail.com>
 <YsLmlIrCBt/Ldg1G@MacBook-Air-de-Roger.local>
 <CAKhsbWZkbx8WrmuhAO3P_UxFihx_4UZHnUjrKZaFV1uwF6ifEg@mail.gmail.com>
 <CAKhsbWbs_QZ-DN6duUKXGBsNfq0awXFbVJkdZ9SoNxa8ySkRoQ@mail.gmail.com>
 <CAKhsbWZOB4NscA04Ez4e0q1LUHWjH1ugUdY073hoBYUqOEGxeg@mail.gmail.com>
 <YsMP1+6/Txj5s7q/@MacBook-Air-de-Roger.local>
 <CAKhsbWZmoC3JzZAZ5T1R0aUif3joJq-oncaYVpMcPZ0A1OXxJg@mail.gmail.com>
 <def66a62-e6d5-38bd-2e78-9ad9a7eff14e@suse.com>
 <CAKhsbWYROUgYti7UE3Of25wKw4uE84UPrC5DkkSLrzR5fS1Cgg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKhsbWYROUgYti7UE3Of25wKw4uE84UPrC5DkkSLrzR5fS1Cgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P191CA0092.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::33) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1660cfac-4ecf-4f4e-b6fa-08da5e7dc166
X-MS-TrafficTypeDiagnostic: DBBPR04MB7898:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4NVIhCMjI2T0W93PJE82OhOpgugNUtj0wZFSu/CwaxcuvBiPK7uxJ2rA5FInmtb8RCS90FKPKrRzqDeIe5n4xKfj8tomN4/0Lp5b84TmHH+VQmVT+i+LuGL0Uen2D0GIIyT574SRfgcp83Qi4NAQp35yr6nsgACcKFLHRKsPX0LRyZz9g1u023jA2dZbzHooVkiXesmW5cBIwVHrCZmXw+JHVDitvKJSIKwiSgriVfXdlZg+uA7+bdR5HngvPHi6rvZh1ETQvRkrePUG3W7FXiHnkhe+A1oQDrpk35YuwvLOVx25PKGNe3Gso01TwJsl8uoHwokart3AUrZd2wn8BkNnv3tZNgFgfzrcvH83rJmiDcJTLu67QZxoPhRL7mexDxbFj3BwO376eaIp7QxAsfxEYX1HrZUhxG2dziMso+J47g+h3cH9VF3QC/xo1rBesBS4rmxoe5aJ9TNjWIfUWTioFsCIdf9FoVPrPov4dAHiloMDqwbePmjkGZ4BvTnHmFcmEKvzZ501BQJ7WJVVaXwMhF6LfRM6r7MApZ64MmbdjDxFrVV82ybEwGyRYHY5fzufUP44Iw5pjccow6K0flXeymTw5qXU5AbhxoJaxxCV/fjooSZVDmbgbypooLfAkypmKfVa5iXYUWsn3WVZ8+Ui6rkYdmbCdRuMx49OTXMUAhY5th+upOJ408/eyfMAFDH0WHtSij4dxGhONyjqskUCYz9va00DLGZ0U6AxMH+H/g6BQiZzHe960iwVTN3Lj8CYe6/K4o5U114+hMzTWE1d0LaGTkECNqdxDCjp8wBe6axegZcHJl+6kv1rzyp9JE4rDfq4W3ZpEQybrNl9lg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(376002)(346002)(39860400002)(366004)(8936002)(31696002)(6486002)(478600001)(86362001)(38100700002)(66946007)(4326008)(6512007)(8676002)(66476007)(66556008)(5660300002)(2616005)(26005)(186003)(53546011)(36756003)(316002)(6916009)(31686004)(2906002)(6506007)(41300700001)(83380400001)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cm9aOGhmQmppNythU3NMK2EweWJsRTk0bzBWUGtMb0F0TXp2QnZuYmYyU21k?=
 =?utf-8?B?andBcllZTVBPREJ6OEtBcjRkb01rT1NIaER0VEFySldvY2g2dk5rRVZpcldj?=
 =?utf-8?B?a0RTT0JwNWs2Z2grckV3aHFkR3llYk5jSHNnS0xzdmRDeHhjMnBDd3Z3YkFQ?=
 =?utf-8?B?aXRSUUEvU0xoeFg1S3ZYR3ZyUy9qODVqbmdDK1lsTzNLTWdMYy9hVlo5KzBK?=
 =?utf-8?B?Rmk3ODExTHkwa1F5T3hRTlJ3WW94NVBWV3NRSngzZXh0OFhRQkhwa3F0ajBV?=
 =?utf-8?B?SmcwZjYxZk16ditISnNVVEhNRkdFbkpLV2xLNXhRTUNWVzl5dHIzVy96cHRO?=
 =?utf-8?B?dnRGdDRkclBLWVpiZUVVRDU5dm5aYy9NTlNFVDN6Y0pRaGhDV0RHWlM5Z2RL?=
 =?utf-8?B?bFJnMWJkd2ptWUE5cE5BeUcrQzhNdFdIVzljRDd4ODB5dVF5TThLMEhLTG94?=
 =?utf-8?B?UDhjNURuK2kwWGF5RFhJN2ROa28rSDhpR1RTd1ZnMjAzNUl0VTVObzNCaXZT?=
 =?utf-8?B?anJzc1R6VFNKN0ErVDFEWmN1dmdoRTJQZmxlZ2Vxa2FuNWVqRVg1QkpYVkxL?=
 =?utf-8?B?cmhraHpxQVJvMko5Y1J5N00wdVA1bytqNHZOOGdWQ1poOExxTUFyOU1jb0lS?=
 =?utf-8?B?TU5FaWpSRVIxdmhiekhNeW1VOVRNM2VtYXV2Si9laWVoV3BwaGFqdUZ1bFc5?=
 =?utf-8?B?RlQwSklVdm5UaGF0by9GTkFhZmE4ZWxqRkwvVEpIRjBGaDN3UnE0QTNaRjl5?=
 =?utf-8?B?bXArYnB5dmJ5VVhIenFWQXRQQ1lIOFI1OVZRdjR3MWlrdmNlUC9RQUpJdXJE?=
 =?utf-8?B?eHVTWDlTQUtFVlNmTi9wNy9ERk1wTWdCSEtlaUVBQUpKd0lhSG5FNFhMWHVk?=
 =?utf-8?B?ZE9sUEZXZkpkSldjQ28wQWFycWN4UE81VnJZay8rdUlITHRMU1h6UXZXNkJ6?=
 =?utf-8?B?WkloQ0NCMUdPTnpBc2FoYXdtSDQ2UW1wYU83ajdtejM2RDFTaDdUSVNrK2dI?=
 =?utf-8?B?Q2ZmWUF5QmRvbTU3alhKWjdBbUpWOTJwTzQwNXk2cUtINWJybDVvbXFPd1VF?=
 =?utf-8?B?ekpqK1hlcGc2T1A5SnRjd2FHeExGRm5hODVwbFFUMkF2UmZJWGhYTFZFYTh4?=
 =?utf-8?B?WWx6amhFbUJhVWdVYzM2dURudTZHbzZGdlRjVnZna1dySFBIU2RSY29oelhH?=
 =?utf-8?B?WkZoNXBsT3VlQU5vNUtHYzYxVEhSRXJVSGNZQmJ5bnhBOUI2MGdpV0ppbE12?=
 =?utf-8?B?UWJOSDE1RFd1QW1wMFR4Q2wzTkFhMTZxN1dvT056UjZaNTB4M05TRFBOWWxw?=
 =?utf-8?B?eUdUMGMwSWtMK1VCSlpzQk0vMm0zRXVLM2JvM1M2aC9nRmlJc1JSSExZTk40?=
 =?utf-8?B?R2dyOHBVc0dPc0pUMTh3M0NRRnlMY1g2RmVhUEN4dkdBekVNa0ZEWVAyUWlJ?=
 =?utf-8?B?MUp2dHl4K0NmZnd3S0NEYWtsdG1PSExyNSt0Q3ZkYkNsQTF5d1BiR1A2NU5p?=
 =?utf-8?B?bXpiSE5hZzFCeFVqc0NIOTNiTDhSYkJyNzlIY2Riak9WQmswSE13VDJlZWFz?=
 =?utf-8?B?UzlDNkJnWXVyajM4aTBoTm51VVBRZWpNTVUwakt2TUkvRWRvdW9hcVhZN3NZ?=
 =?utf-8?B?dm4wQlFsRXJpY1llZE1JNDIzNWdGK2YzQTR2MXJYb1RoWHBPYndmRHdDNk5z?=
 =?utf-8?B?cjQ4bVAvOGVjVmxFbGRkcHdDeVk3bkZzMlVnd2ZWcjJEQkZRUWZwMExvLzAz?=
 =?utf-8?B?a1hDT1JlVUJEdFlYemdrSCtoYXNxWStyYVJVbEk3ZmRTakdUM3JoUlVsTlRx?=
 =?utf-8?B?OUdDSW90RmJZa0lQKy9GdHIxWnR2TzZIVWF5WXNXeGpaWmJpdVNRQlJvZ0pV?=
 =?utf-8?B?TXhsWXo4dGVjNk85bnF3a0ZiL0RGbzl1WnpHQVBwR21vLzA0TmhYSEpnblRF?=
 =?utf-8?B?cXlmSmwzY0sxNUFwVWVNQ0UrbEo4Vi9JYmZ0UmZaN1pCaHd0TmUxeUIyWkZk?=
 =?utf-8?B?N3RuT2p1aWJjcUxxaEg0SmVVNXZOTGRlSEVTdlFaTDB6aXdXUHRKK3pTbnNN?=
 =?utf-8?B?ck9OMHI2QnY4dHREMVZNdWR5b1dVa0phZVBuZ1lhVWdpbHpUUW1YbElQZlF3?=
 =?utf-8?Q?i4u7s1nhDGVANRjcL5QEnVhpj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1660cfac-4ecf-4f4e-b6fa-08da5e7dc166
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 11:59:03.6878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cn17wy5LCQ1+chxOQRkO79Y/pXxGSj4qq3ybJziTtM+qR4CLMRApQbGylYV3XzOUXs+uSqxlZu1d34gYAlraUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7898

On 05.07.2022 13:31, G.R. wrote:
> On Tue, Jul 5, 2022 at 5:04 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 04.07.2022 18:31, G.R. wrote:
>>> On Tue, Jul 5, 2022 at 12:21 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
>>>>> I retried with the following:
>>>>> pci=['05:00.0,permissive=1,msitranslate=1']
>>>>> Those extra options suppressed some error logging, but still didn't
>>>>> make the device usable to the domU.
>>>>> The nvmecontrol command still get ABORTED result from the kernel...
>>>>>
>>>>> The only thing remained in the QEMU file is this one:
>>>>> [00:05.0] msi_msix_setup: Error: Mapping of MSI-X (err: 61, vec: 0x30, entry 0)
>>>>
>>>> Hm it seems like Xen doesn't find the position of the MSI-X table
>>>> correctly, given there's only one error path from msi.c returning
>>>> -ENODATA (61).
>>>>
>>>> Are there errors from pciback when this happens?  I would expect the
>>>> call to pci_prepare_msix() from pciback to fail and thus also report
>>>> some error?
>>>>
>>>> I think it's likely I will have to provide an additional debug patch
>>>> to Xen, maybe Jan has an idea of what could be going on.
>>>>
>>> pciback reports the same MSI-x related error.
>>> But even with DEBUG enabled, I didn't see more context reported.
>>> Please find details from the attachment.
>>
>> And nothing pertinent in "xl dmesg"? Looking back through the thread I
>> couldn't spot a complete hypervisor log (i.e. from boot to assignment
>> attempt). An issue with MSI-X table determination, as Roger suspects,
>> would typically be associated with a prominent warning emitted to the
>> log. But there are also further possible sources of -ENXIO, which
>> would go silently.
> Please find the xl dmesg in the attachment.
> It's with the two FreeBSD domU attempts so it should have captured
> some culprits if there is any...

Nothing useful in there. Yet independent of that I guess we need to
separate the issues you're seeing. Otherwise it'll be impossible to
know what piece of data belongs where.

Jan

