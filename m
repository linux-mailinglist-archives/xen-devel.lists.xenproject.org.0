Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 348134C8565
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 08:43:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280905.479015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOxA9-0004sx-Gx; Tue, 01 Mar 2022 07:43:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280905.479015; Tue, 01 Mar 2022 07:43:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOxA9-0004qv-Dd; Tue, 01 Mar 2022 07:43:13 +0000
Received: by outflank-mailman (input) for mailman id 280905;
 Tue, 01 Mar 2022 07:43:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nOxA7-0004qp-Sw
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 07:43:11 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3df022c4-9933-11ec-8eba-a37418f5ba1a;
 Tue, 01 Mar 2022 08:43:10 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-j-vCEuMeNjuw-6_NMlmtOA-1; Tue, 01 Mar 2022 08:43:09 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB4900.eurprd04.prod.outlook.com (2603:10a6:208:c9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Tue, 1 Mar
 2022 07:43:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 07:43:08 +0000
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
X-Inumbo-ID: 3df022c4-9933-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646120590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w5DX0udg4woY/xz8lzpN0tu8Ytb/rhBWFqUXG783oug=;
	b=hJOrupEBY80+m9q4DUwkS4oT91NOiY4DqeIF17XaRPU+eNmMIUgEG1ESEfsvVqFeaLkHaD
	zfx5FFelvMJOospqgMNcx/U/uTwX2VkkOWpBExq8cbKMlOSWkmkYzZHmcVyYq/eqPyt5Ac
	azIaU+Id+mmWS+kSimOmWFmunL31pQQ=
X-MC-Unique: j-vCEuMeNjuw-6_NMlmtOA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZUMm/tST9bd9eWlDck8VsycV/xbT6PPKlJvWvUPRZuKY2QPteJMeR9Pu15uperTJ+lxt1F4cafxgjEd9489RCDo9o3d91PKD1onc14WWVRshLF9XoCvvmrCwqrUx470R4QoRh2o6KQoN3jj2idzAXQYMLXqCz7nnaKYV7gVhBGAp9aqUCtaWUIFbrqHemqt+xtYaWZz4nRTTgIC6nL4zfBabHWrZkiDQe4Z/umtSvOW3+2qBN9opm8eQ5SQl9/3/YSwXR9hTktXYRLynIOhkdZgKA95J8Xw/0M3npbp94/movyPy26QNubCVfS6TT3EbvC5st/3gQTxT3wYvZB4ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5DX0udg4woY/xz8lzpN0tu8Ytb/rhBWFqUXG783oug=;
 b=aytmH14XCewHVyZnE5wvnbRDzWfurqgCQEZeCVvu1vLugg+ilkBvam5oAWAx9qG2pxFN5vhxAacOPLxgWhHEg/+fzsgEAFSHUFLYR98tLTnCevt4gUJL6iG7qib8dyBs9xYGNmqGKDF4zWmmB5tfziUiE+pkuGxgSNANfVku9o0rofaoApfOFo3UCtUpPTvQtqErkY1hdeXFKAtVjdfRSFz8EhPg/JRNvmki46FfwbX53tit/u34lBygUV7T07GGm0KDWnEK1BVUFKoUiJbGfPylk/H4wH2iVR8LpMtiJu1DCnKBPrxRh45vSIBiPjpN2g8VxUBcyiPALVX43aTJng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fc21f371-9eda-f2bf-677c-e1e25ee5084a@suse.com>
Date: Tue, 1 Mar 2022 08:43:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 2/2] vpci/msix: fix PBA accesses
Content-Language: en-US
To: Alex Olson <this.is.a0lson@gmail.com>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20220225153956.1078-1-roger.pau@citrix.com>
 <20220225153956.1078-3-roger.pau@citrix.com>
 <d8da3251985684ab9099ce95a8329a7e35535a7b.camel@gmail.com>
 <Yhn8rzRIC/TNiPv2@Air-de-Roger>
 <3986c91f62cb1bf3a042f669c40b900653f1ab51.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3986c91f62cb1bf3a042f669c40b900653f1ab51.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0005.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c81a05d-8e24-4ef7-cae7-08d9fb5720c8
X-MS-TrafficTypeDiagnostic: AM0PR04MB4900:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB49006B35FEC8CB205BCDC045B3029@AM0PR04MB4900.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qNCKIsJkI2ZkjXAn/F2UnUqz9neBnOHvZ20JqpMRYkcSvUMk5VZBTjaF8XxoE9e0zfOgO+E1yWeBI1cRJUw1x5h3I+5xuZdqxXs51sEqKsrhDIF6eOVyBr+SI/U3xPgRGf8ibjPBR0x7SEcMygXpMzFlS7ifKCqGkXC2iSc2m478NlY1MFxr9SEd8qBOwRybWPxnFt3QyAPCQF5rWZMO3PccuJa5BdDWf5te6vvlL3KqjdjlEhYoTT0kpVdk9nUbuLIhBOKTisyYmQL4Qv6rP2+ecRvP2Ye3XqU9PiThIGQOA4PxKpDev2WCSIDjb7SJ33EP4RBUyRKJg9hlm/XWF5Y4+MlOiBiPmby13zUvXT+amz1x7suz8iuxiQt4Mqr1FyB+wWk7sH1QSBNpAQHNWmxhf/UWMtw8q+6TLQsJavKHzmwwBRi8OeUDVpVJFZWkd22FCKpOQ5F/D+jEh6cITKWOtw+sM8rcngXa1/Gvm+9Kyc0FknYMZpbgzeb8mdD+4eaOgEPH67tx2AMaBmaXergcrpJQNvSsnbz+36dD/g1zaZnLXnGhA6AJGfUW62O+UAOhd36rlfBSoCEas+KkTdlrNC6KQnajuhY57eTVXd5PhttqdhIg3v2UjhIEgjDD/9HFwp3VzEW0L/dM/LtdCckPt4NLVkExl2ruj0ZjiFPr1e71vthwyRlX1U5+u/lI04tv8sb3H3tghVCurUeA5WjLJmtjmzg0dNxgt+jeitzMMKkh7NstoJAdID9AIUoE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(36756003)(53546011)(31696002)(2616005)(6506007)(86362001)(508600001)(26005)(186003)(66556008)(6916009)(8676002)(4326008)(66946007)(66476007)(38100700002)(5660300002)(31686004)(8936002)(6512007)(316002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnJqRXdoUFdLWHN5NTkway9KRGJoeHhFV3JESGhSZFRiQlNHdFVYT2gybGZn?=
 =?utf-8?B?b3BvZDc0RDZVN0pIckVQbmJTZG9scm82WnpJNzZ3aXVxeUtheFEzL0JMTG52?=
 =?utf-8?B?Qno2U2lLRGVQZXNVZ3VXQlJFdjd6aUdWUWNxNFdOMEFRVVdoS1dyODA4V0Rl?=
 =?utf-8?B?amM5OVNRMUwwaHNLbk5wdXlBQmhzYStzOE5DTDZ0TmZjMG5zZXB2T1Q5Uncr?=
 =?utf-8?B?RDdCcDNLcFI4L0tYa1FCOUV2QzZqQmRoeEdiZmxqK0prSEhmc1hKekx0eDBt?=
 =?utf-8?B?SWJvRFB4VWhjUmZQZnc0dlBJSldDQVBQN3ZjbVFSU1RBdWZTK2VuRmdRTGps?=
 =?utf-8?B?bjhiZU1XOC80UnE3M2lmdS9NN0tTcHBjemdJeENHZThwSTJ4RmdmMGROakFu?=
 =?utf-8?B?Sk1JOGNwN3g1VzdjSEw2cVhsQjZveUJJOEFIanBxcUxOK0NzdUlaUlRsS1ls?=
 =?utf-8?B?eG14UCt1d3pubHQvZHk3Znpka1plVzg1WlYzaWtlVUR1bXhiN3MrV25mMVlP?=
 =?utf-8?B?b2V1cFBmTVpDYW1OOUZOdXlLc1hkRTlrTzBycGtNaktrcCtEMGk2OUR1RVJa?=
 =?utf-8?B?YitlL0NmcFdHL05xTEQydU9UdUtQTi9Vd3prRWg5dlJjQS9vQTNDTVFxUmFH?=
 =?utf-8?B?Z01MRlpLOHgyQUdiZTRiYVZsZHRHS09lM053OUVvV3hrbmFuSlRVaHU5cUlO?=
 =?utf-8?B?dTIzUG43K25OZ0UwL1V2QWd2eUxtZFVWRUFmU2lDZHZwZTJLWjlHenRFMmdh?=
 =?utf-8?B?ZVVKSkZ3cmNrM0VzN1NyQTE5WXlURTZkNERkWGR0MkhlakI2eExJOUY4WFpC?=
 =?utf-8?B?elV6TFdTNjBnanh0RzdvdFArUUdDQzNRaTd5N2h0TFppa3ViUVJEcmxnMzNj?=
 =?utf-8?B?a0p0SkdLTWpUdUxsNDU0ekZQNG9uQWdJUUZlRVlIWTB1bEh6RlhRSzIxUFhx?=
 =?utf-8?B?Mmk1L2JzL1dRdkhXQmZpY0tYbktKRktzQkVEYzV0WU9oeDhvZGNabDFHN1ZJ?=
 =?utf-8?B?Und6N0VYaFZ5YUZIckthQ1pxeVE4SlJ3QTFRMXBraWJEOS9OSEpjeGFtakhx?=
 =?utf-8?B?VllqSDhwWFpkUW90SS9Oc2JkanRvbUxkaHZVR3F1WTNvMjB1N3BmWjR1b21X?=
 =?utf-8?B?ZzFMMTZKMGhyVlkySXErRWc3akdleVBlOGlQb0RqT0RDTjQ5UCs0MDhPc1pn?=
 =?utf-8?B?OUNjclZycU05MkhZeDFYZVdwNnZ6VlVHcFc0dDFKb1BJajI5Mzdja3FUMW42?=
 =?utf-8?B?UGQ1ME4vQ3pqTHlYalUyU3dnbnlKSnRDcmRXdzZoYU9FYmw1V1dlSVBYeTN6?=
 =?utf-8?B?ejBKOVJRdjVuZUlsdzBYYTJFZHRKbEFTOFJROVdodTdSY0d2dlFTbXV4bmEx?=
 =?utf-8?B?RFVHMHorblJXVkR6ZXczTVpZcytNODB0RDAwbWE5Mm1SOW9GbTh1V2hFMmRK?=
 =?utf-8?B?cmE0cU5ZSXJHU2lsZXlWN1hzM2JsQlFlWjJoZ1NkcTJxZTRSY1NMVWUzMUhk?=
 =?utf-8?B?T2lJYkwwRDhyMFBYRGNpUWxJTDhRNXE0RnhyNTR5Uk1BZzFORVdrWHdiWHdk?=
 =?utf-8?B?cHQyK3BseVBrc2NrUS9aZWJPOTJqNlFiZElXM2RQSVAvMU96YncxVks3dUt5?=
 =?utf-8?B?ZXdkMlpsZlJaS3pQMGhJeGtJQ3Y3R0c2Y1hTNVgvSUIyOVUxekdpcy9XU291?=
 =?utf-8?B?Wkx2NENDTUpUdUVlZ2Y2ZGNPcHkzV0dwWlcycS9acW43eEE4ZDlIdUZJd2ps?=
 =?utf-8?B?c3VHcVFPSHlyMVZFTmFqUk81MGpBZTdMSEdTQ2FyTUJ4YWFxRmYwdHoyb1Zm?=
 =?utf-8?B?bXplVGFjK3RMak12WVQzYWNVTm5GbW1YTzNVVCtGNVY5SDFya0FhN0tqWXV3?=
 =?utf-8?B?THpaVkhXU0NvR2lkSWN4UFJ2V2I5RlRSSHpITUJLZlBRYlY1K1crb1VvN2dY?=
 =?utf-8?B?T2lvQlZCaUVka3FWSlp3eFNHS3lvZnJKTWU1TjlEZHBaQ3E4Vi9UM3phR3dr?=
 =?utf-8?B?Sk1CUUhuTnpoTWd5Z1pLRHJtb0VuZW1CL3owMjV3YU5JYllWRUI3cm9TL2sy?=
 =?utf-8?B?cjJHU3FQd040UVdjZ2hCV0k4Z0VjWGtyNzF6U3NsNForVzEwMlBuZXh5V1hW?=
 =?utf-8?B?VEVCUWJtUTB5YTd4Z3pCVE9ON3EwQklRdXVKNFBLOFBwdWhUQnpBb2RaZmNq?=
 =?utf-8?Q?NdvruEjPNmaxPcxKVBAX3ag=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c81a05d-8e24-4ef7-cae7-08d9fb5720c8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 07:43:08.1954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J9Jm2vABpuFPMWAfg7ecOsbIU871L5o9z8jYee2CxTDm8Fsuni7jSxYsvUXeH9B5u9Jk2NgoX+rxJHRdPHBIyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4900

On 28.02.2022 19:19, Alex Olson wrote:
> FYI, with this patch,  I was seeing  msix_read() and msix_write() being called
> during the driver's self-test on physical address 0xfbc01800, corresponding to
> the beginning of the PBA (lspci excerpt below):
> 
> 
> 02:00.0 System peripheral: Intel Corporation Xeon Processor D Family QuickData Technology Register DMA Channel 0
> ...
>         Region 0: Memory at fbc06000 (64-bit, non-prefetchable) [size=8K]
> ...
>         Capabilities: [ac] MSI-X: Enable+ Count=1 Masked-
>                 Vector table: BAR=0 offset=00001000
>                 PBA: BAR=0 offset=00001800
> ...
>         Kernel modules: ioatdma
> 
> 
> 
> The functions involved on the Linux kernel side are:
> 
> ioat_probe()
>  -> ioat3_dma_self_test()
>   -> ioat_dma_self_test()
>    -> ioat_free_chan_resources()
>     ->  ioat_reset_hw()
> 
> drivers/dma/ioat/dma.c:   ioat_reset_hw()
> ...
>     ioat_dma->msixpba = readq(ioat_dma->reg_base + 0x1800);
> ...
>     writeq(ioat_dma->msixpba, ioat_dma->reg_base + 0x1800);

Wow, a clear and apparently intentional violation of the PCI spec. There was
a workaround for a reset issue introduced by commit 8a52b9ff1154, which was
then revised by c997e30e7f65 to take the present shape. However, both commits
claim this only affects certain Atoms, albeit the latter less explicitly by
having "CB3.3" in the subject. Yet you're seeing this on a Xeon D ...

Jan


