Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF324BB2D9
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 08:05:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275141.470871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKxJX-0001l3-IU; Fri, 18 Feb 2022 07:04:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275141.470871; Fri, 18 Feb 2022 07:04:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKxJX-0001id-EZ; Fri, 18 Feb 2022 07:04:23 +0000
Received: by outflank-mailman (input) for mailman id 275141;
 Fri, 18 Feb 2022 07:04:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v1rr=TB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKxJV-0001iX-9l
 for xen-devel@lists.xen.org; Fri, 18 Feb 2022 07:04:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd983962-9088-11ec-8723-dd0c611c5f35;
 Fri, 18 Feb 2022 08:04:19 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2059.outbound.protection.outlook.com [104.47.8.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-3UZRo5NjMN-wKeIjbMATIQ-2; Fri, 18 Feb 2022 08:04:17 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR0402MB2777.eurprd04.prod.outlook.com (2603:10a6:3:d6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Fri, 18 Feb
 2022 07:04:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Fri, 18 Feb 2022
 07:04:15 +0000
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
X-Inumbo-ID: fd983962-9088-11ec-8723-dd0c611c5f35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645167858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=deGc8pyup6UHsfzl7QgokKt0quEDIb1buVKBQmqvZgY=;
	b=Gh52bFN3lLuVs3wQ+Hwl5T5kA4W81HZuCKd2HtS9gKeCmAE6PYtrCPfL8iBrlxbM+rrgra
	Ve3i29BizL9kQoGWy0cTOGAfD75saditSnxzPKHO8m64UaZi/fUszEyTMDnnIn5QrPgWuo
	444LwOi7EW5V2nEs4mEZRvMJyfZ+AYE=
X-MC-Unique: 3UZRo5NjMN-wKeIjbMATIQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OVqrARCo5bHigfgEZXWWfFA+ytZh9FTul/O8hZ2j8wXFA900akYoRdc1qtBTOeRuArqG4u0uUx2W98lIZxi6JRX9z6JorPfEydPg516g5QJB2SI4fppFO45v3R7GxNKACxGbIRv9U6brqvr1d7FgpKzHVAa/i294jLARguCMaOy6B6uBlYxd5a4ppEwvuglvbdSVANU2PW6ISKnYxkDw0HojnAZO3SJ0pOXi1S2crMOBWD2rlw6rELbuEmU1S+xvP98rtiXxnHSUf2pknXAJz4LjMlWbh8yHBR5ERqmBM2G9L8Bvx2kBY1COIqcPMioRwHbQS2xV/UcijJncsNKPVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=deGc8pyup6UHsfzl7QgokKt0quEDIb1buVKBQmqvZgY=;
 b=bBSlSIC2IxMP19ik5Pdw7jMiAmFcAbM0C3DuE1mdzM2CuNuxHOQ/XhrpD9S8fgzRQ88jMxnJyqWMI6taw3qgSVPANLA59pL6xgWr6E+YiFuJ14Vv3ZSzQeT5lULHuVX8mBVdT8ejrbuixGk7eHXtMnE3icXq84SBWMhvZz9R/HEN5jOsnwgHpXr9RuaiyXVh4Giz5VtsIn2/wpWU2YV2egOKUtpZfVon1EFLmueX6J+O15x+ZYV3hmnB3jI7a5HEn6vfVAxrMbE9HHACcRnFibhX0bHIUHSgQzN8IUwrWCa4gMt/o10rMIfJpWHpE3F7gkQJwPImTbcanMOyLkkoNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dc1a4483-7dca-aa72-6b86-4217e6840efb@suse.com>
Date: Fri, 18 Feb 2022 08:04:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: IGD pass-through failures since 4.10.
Content-Language: en-US
To: "Dr. Greg" <greg@enjellic.com>
Cc: xen-devel@lists.xen.org
References: <20220214060011.GA24404@wind.enjellic.com>
 <198ef291-4dee-ddac-aef6-8451bc1e880c@suse.com>
 <20220217201534.GA29303@wind.enjellic.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220217201534.GA29303@wind.enjellic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0253.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f2ea688-4d45-4cd9-25b9-08d9f2ace003
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2777:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB27771811F6AD2FF46DCDDAB6B3379@HE1PR0402MB2777.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LRK6gNa5PbIYqZuBpdqvYlqgtehGpuR0ty20Z3HcuWxjCLhdKylci2lt5jJmScR0WS/cwzqYxQ/NNhSTHussAgMq3pkNA/sgfNglvHQLOOMy3sTWKAp1d4ZMb4mk8SDn+icS7K9LpxZS/GMZUcV8eWD9XmVwtSzLbtczmU4lzePHFEr5Peh81qiUIZRTIKs0xTvyzwU3gx4TTWVqwVLrpRWcCQeZV6wwRpUa6Cu7AJVJZKJyFyL7PdBp+D1ayFDTEpCeaDQK1loel2Qak6Ma3TGDzH5nbOzZLxL4RbEchZsry5MUglkgEPMCKLTwIhxSxnglTqBoinB7wBiDrjcpl7frW4LzcJnp02d8iC90nuVmmxlNkfdTRyTW1tStXb/KmrX7QD0QenB/awKC72hD3yHFyrU8nFR41PT6oS3wMuy1msim/+hmQSyw8RxrWLwiXuPuMSF/C0DwWR9VPUJW+jTQkWJBWqE4mZCaT0B4b3YhyyhHYRavzbO73NTT5RYu59nVJ+bXs2N3d1N+TYsRShoXAOtDfvdzIxk6A8nRu8QxGTGpL4FHUT4av8qnTpQpomn6MrRbL05r3szFUQkk4UHK5x7g8OQDW7HgA1NEYSONXyCellsAFmVOvH/mQsR7E4wDbfnKiL/SI14ITgbRalHmnKAhv6vqL9eNhmit6NCY+K+VigUVtm4Vg3f/7CX4nyyT6d2FweUeVd6Us0CMWW46a7FV4poN9ilJpbrAaYk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(66556008)(8936002)(38100700002)(53546011)(66946007)(66476007)(186003)(26005)(6506007)(8676002)(5660300002)(2906002)(6512007)(2616005)(31696002)(31686004)(6486002)(6916009)(83380400001)(36756003)(86362001)(316002)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGthbmtqWWtKMTVUTktnc3VjV0VieFppbTRXUnRMcWgvYzJ0VDlhUkl4Y1Ry?=
 =?utf-8?B?Nk1xdXBMV1FURGxzNitQU1EwWm1IMS9JbkF6YjZnWnhGM3ltQVYxZUFhMGVK?=
 =?utf-8?B?SEs4bFdpbzRqUDlXY21Bd1ZKOXpmelloeTdvSUppb0FaVytDa3FOd2cremJR?=
 =?utf-8?B?SGdnOEhpcHFRbHB3M2dsSDVxcUd1VmZ2dFZ4YlFUYi80YlJQcVBTd2ZIWTNm?=
 =?utf-8?B?M2lzL3pjd2kwSmxRWHEyc1ZqRUEvTzVJd1p2MEZtbURUb0JKZjdqaUg2dity?=
 =?utf-8?B?dndHNjI3TmYvTG8zdlc5eElUbkRraG5wWXdwdnIzMlNuWk9ndGVBS2NFTFdz?=
 =?utf-8?B?MXlXeFc2UEdsS09LMWlBNW5GcTRkdmhDbUNjSElKUlVGMmNmMHR3L2tsOFZB?=
 =?utf-8?B?TlA3aXUzWHBNcWRyTW0xSGk2VDUzbVgrcitZZXBueVdHR1I4M2pVSU9DZWdW?=
 =?utf-8?B?elpKZ3I0UGsrL05Na0xuelBVS1lIMkVPU0xsUmZ5T1NkK1lXbnk3U3YrcUty?=
 =?utf-8?B?Mk5QU240UE4yOTdlalRtNkltRU5vQmZWYk9ZWVB5L2wzQmdwTlVkTmlLSzBG?=
 =?utf-8?B?VHZ0ZE9XRlVxVEdoWUtaS2o3TUQxbXhCNmNwOWRuUWVQbDZZbEtmeG9peWJM?=
 =?utf-8?B?T2hmMG90K2kxRjdUNEdQZXIxZ2lrY2NuM2w3MmFEcmNsMWZ2WXcxdHVhL1Zp?=
 =?utf-8?B?dHhsSmcwM1hMVWR6bG1KaUVJUi9xdDk5dXNtMzArcG5kM2JCRnZDMUJxeE5i?=
 =?utf-8?B?aGZpdEd3anRBL0JCV01LbmNtc0N0REpic29LaTNqaHR3OWxJRjk3cHNKUnVZ?=
 =?utf-8?B?aGlQVk8vSWQxL2pDRkcvcG95YUljQWdzeWlLUG8rTkIwOVM5V0w2KzVUa1Nq?=
 =?utf-8?B?dU4zb2RudjlEVjRrNzVZWWN4VXd5TFZrZ28rOG1xNjNiNXhnVEFzaTNpTjM1?=
 =?utf-8?B?aWhFQkNwMXpTWmEvWTM0UGpXS0J2dlRZVytscWZ1RVVPaW1uQWhLTkplZkVO?=
 =?utf-8?B?RU4yYkdocjlsWUVzSUt3WWFTUnVVT0JvbFFZcEdHZERmZ2FzcmdpMXJINEo2?=
 =?utf-8?B?Q1pqOEl3dEliUjMxWWQrUkRGdWhCM3JYYksyQVZmcmtGQ1o1cW1LNDdsVnRX?=
 =?utf-8?B?dVVYaTJZWVNvSkJyOGFMbXZ3bVBjbVpMWVRleG1TYk01MFZZMitXRjBnM2Vj?=
 =?utf-8?B?VE8vOTBrb2RPZEFRNHBHQytRNGJVTjI0QVJlek1xd2dyS1NFanlBSEhaVEFn?=
 =?utf-8?B?Q0crWFBLTUxNY1BsSHpIUFg2bysvSWVsdk1mU210TjluczdJSThObnYrT2xi?=
 =?utf-8?B?TFl1RHk4UVZzZ0VENy8yZlY5Q0hCZXdKNEpBZ2N6NHlrZlFDNHIxbWJTQ0pQ?=
 =?utf-8?B?eG5NcUF2WlNRbHV6K25USERsUUV3MGIzcjFnL094ektpZDZMSnlrOWp6Zllr?=
 =?utf-8?B?ejB3TERtenhQK0ptanNadUh3L0NLVGloTThYVW52ZTZSeUdSdUp5cjliZVZt?=
 =?utf-8?B?Um1TVjJwU1dvWDVmZXpNdDBCYmc4R01mN0dOL0M5aSszQXZDazdsem5Gb1l0?=
 =?utf-8?B?NWk2cTdCbVFqa0xyYTAvbys1TGJXaW8wbk5YTzVOZ1FjODJlUUxTcTNLQ1U0?=
 =?utf-8?B?ZkNXbTA2SWYyOHNuYmJVdGxkR1VKU00xRTN4T1NDcWdZd2ZSWmhYTks2OHVk?=
 =?utf-8?B?SHRYdXUzUnlCY21KV1o5WS8zalh3a0UwaGtZR1E3NVVwZGl6OXBld1ArcmJL?=
 =?utf-8?B?S1hIUy82aTdtck5LRHJ5UjlJZ2t4ejFWUTlaYlZxQXQ0VUFmZkxnN0pUSURS?=
 =?utf-8?B?VlNNbTErWnZXNW5LNnhYbklxQmhuak9KVmhJVTV4ZzNVTXVBbnIweDVjeG5R?=
 =?utf-8?B?SnltTFlFcEFVaFVsNkpwSlB2NWVFblFmeWVaMTBqMDNKYWZBdXZSbzhKU3JT?=
 =?utf-8?B?V1Y0MHNybU1SVE56eEd6QWNzbzRDV01lTEhGaktmcCtGSS8xU09TQnJ5Rk0v?=
 =?utf-8?B?dVpoR3pvbDNmLzBWdkdsOVY2cVlwQWNSdEttV2tReU1HaG5zbWhBb0pSckx4?=
 =?utf-8?B?WHduR3JrbGc2amtSNVFDWWpiMEdhcW5LSVFGVjcvRVhEQWVucWZtaTNMOGh2?=
 =?utf-8?B?WXg3ZWdnTHgvNytQdUhZMXNxUEw3NjNTN0NiV1ZDK2pZVG1KbDUzdWFrMkU4?=
 =?utf-8?Q?YZG0aOJ/9epiowySXg8qcqo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f2ea688-4d45-4cd9-25b9-08d9f2ace003
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 07:04:15.7797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uPgCS587nLQSDQE3Hv+J/uEQ1MoSswrzPOWtLWZcpN9W7NmaPof/wC8T3PlYYVoK43xu6J1OaEnEpvMhzszJOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB2777

On 17.02.2022 21:15, Dr. Greg wrote:
> On Mon, Feb 14, 2022 at 09:56:34AM +0100, Jan Beulich wrote:
>> On 14.02.2022 07:00, Dr. Greg wrote:
>>> It appears to be a problem with mapping interrupts back to dom0 given
>>> that we see the following:
>>>
>>> Feb 10 08:16:05 hostname kernel: xhci_hcd 0000:00:14.0: xen map irq failed -19 for 32752 domain
>>>
>>> Feb 10 08:16:05 hostname kernel: i915 0000:00:02.0: xen map irq failed -19 for 32752 domain
>>>
>>> Feb 10 08:16:12 hostname kernel: xhci_hcd 0000:00:14.0: Error while assigning device slot ID
> 
>> Just on this one aspect: It depends a lot what precisely you've used
>> as 4.10 before. Was this the plain 4.10.4 release, or did you track
>> the stable branch, accumulating security fixes?
> 
> It was based on the Xen GIT tree with a small number of modifications
> that had been implemented by Intel to support their IGD
> virtualization.
> 
> We did not end up using 'IGD virtualization', for a number of
> technical reasons, instead we reverted back to using straight device
> passthrough with qemu-traditional that we had previously been using.
> 
> If it would up being useful, we could come up with a diff between the
> stock 4.10.4 tag and the codebase we used.
> 
> One of the purposes of the infrastructure upgrade was to try and get
> on a completely mainline Xen source tree.

Depending on the size of the diff, this may or may not be helpful.
What you sadly didn't state is at least the precise base version.

>> would suspect device quarantining to get getting in your way. In
>> which case it would be relevant to know what exactly "re-attach to
>> the Dom0" means in your case.
> 
> Re-attach to Dom0 means to unbind the device from the pciback driver
> and then bind the device to its original driver.  In the logs noted
> above, the xhci_hcd driver to the USB controller and the i915 driver
> to the IGD hardware.
> 
> It is the same strategy, same script actually, that we have been using
> for 8+ years.

Right, but in the meantime quarantining has appeared. That wasn't
intended to break "traditional" usage, but ...

> In the case of the logs above, the following command sequence is being
> executed upon termination of the domain:
> 
> # Unbind devices.
> echo 0000:00:14.0 >| /sys/bus/pci/drivers/pciback/unbind
> echo 0000:00:02.0 >| /sys/bus/pci/drivers/pciback/unbind
> 
> # Rebind devices.
> echo 0000:00:14.0 >| /sys/bus/pci/drivers/xhci_hcd/bind
> echo 0000:00:02.0 >| /sys/bus/pci/drivers/i915/bind

... you may still want to try replacing these with
"xl pci-assignable-add ..." / "xl pci-assignable-remove ...".

> Starting with the stock 4.11.4 release, the Dom0 re-attachment fails
> with the 'xen_map_irq' failures being logged.
> 
>> Which brings me to this more general remark: What you describe sounds
>> like a number of possibly independent problems. I'm afraid it'll be
>> difficult for anyone to help without you drilling further down into
>> what lower level operations are actually causing trouble. It also feels
>> as if things may have ended up working for you on 4.10 just by
>> chance.
> 
> I think the issue comes down to something that the hypervisor does, on
> behalf of the domain doing the passthrough, as part of whatever
> qemu-traditional needs to do in order to facilitate the attachment of
> the PCI devices to the domain.
> 
> Running the detach/re-attach operation works perfectly in absence of
> qemu-traditional being started in the domain.  The failure to
> re-attach only occurs after qemu-traditional has been run in the
> domain.

Interesting. This suggests missing cleanup somewhere in the course of
tearing down assignment to the DomU. Without full (and full verbosity)
logs there's unlikely to be a way forward. Even the there's no promise
that the logs would have useful data.

Of course with qemu-trad now being neither security supported nor
recommended to use, you will want (need) to look into moving to
upstream qemu anyway, trying to deal with problems there instead.

>> I'm sorry that I'm not really of any help here,
> 
> Actually your reflections have been helpful.
> 
> Perhaps the most important clarification that we could get, for posterity
> in this thread, is whether or not IGD pass-through is actually
> supported in the mind of the Xen team.
> 
> According to the Xen web-site, IGD PCI pass-through is documented as
> working with the following combinations:
> 
> Xen 4.11.x: QEMU >= 3.1
> 
> Xen 4.14.x: QEMU >= 5.2
> 
> We are currently having IGD pass-through with qemu-dm (3.1/5.2) fail
> completely in those combinations.

I wonder on what basis these statements were added.

Jan


