Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FE24C6D6C
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 14:07:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280528.478494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOfkV-0002UD-Ej; Mon, 28 Feb 2022 13:07:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280528.478494; Mon, 28 Feb 2022 13:07:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOfkV-0002RO-BE; Mon, 28 Feb 2022 13:07:35 +0000
Received: by outflank-mailman (input) for mailman id 280528;
 Mon, 28 Feb 2022 13:07:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A4HT=TL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nOfkU-0002RI-BM
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 13:07:34 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64348c96-9897-11ec-8eba-a37418f5ba1a;
 Mon, 28 Feb 2022 14:07:33 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-ULg0KHdnMqGTER4OVB4Ppw-2; Mon, 28 Feb 2022 14:07:31 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR0402MB3943.eurprd04.prod.outlook.com (2603:10a6:209:16::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.23; Mon, 28 Feb
 2022 13:07:27 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 13:07:27 +0000
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
X-Inumbo-ID: 64348c96-9897-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646053652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u0sBbVarfRdbPd8mf0FQyjjqMuEG/CN9bdsDecxtUQE=;
	b=frDZqOxyI7Rz44Eo5v01rLnq+bvclnC4fPoOo+D7YrPPNOncPNdO8vJOwPGElx5UE6Or7d
	QVgw0s49vO+Fy2CEbvPySY85rMi7Wv8wc0NupbhjsQ9QvBd+/WKPqUtQjDdjedouOn3D9v
	U6fiMthZydONHhU7v5mw5jfw5TYzS70=
X-MC-Unique: ULg0KHdnMqGTER4OVB4Ppw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jEJTS2YImhOS363GhQ6GCC/31Zn4o0We5hTmPAs2LmIY3whI5CfaNz2zm9lNv75a+0cjCi2XnGuMG/xiYqQ/Vjkl49PKjgeSKflxmCJMIzMGmchO3ljr2lu+ms24Mx3yyRrMWxzQsSR4qtVboUl6R1YMuw/0zLJcWwELc+49CWFc3aozO+vOD7j9YRg2xobVM0lcR4ZIXn+B7kKLoB4ZWLAqxcTxcMH3nKcjtoucDmeXS6n/yPeVwozDSINLcbg+4vbeDXkSbdmbbeyCH3CFDN0cb0YpTp+IfVFdp9gJzu3qznIsSdpIFltK1l69JTgVRSCUlwBRDNJMgnPu6nQqvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u0sBbVarfRdbPd8mf0FQyjjqMuEG/CN9bdsDecxtUQE=;
 b=GBQXZO5eXpOKLu4fLpFAbvEDBAQv+5welM3mpDsVOSvOHRkLZYUW4W4I8HJIlWVMquIpJ2Bxc095g+HavpSgFRrZRrg9506cFhU7rq98jRb/EVEXohSaM33taNoYlEEJEVnsT2ghggInsQSiZSc+ycfmHvxFg8BIxWEiX2WuRvvGlZ276cLnGOKBBfKexbOtPtBMJRQ3Q04QFA9eUFWhJAqUzRvkmM3zt+WxJj/RFxyKkUrmwQHIM207aQnl370Pi8wyDHJybn3PYCE490L2nmYH6cp2x6mxn2bVDjdrBYQ0E3t6xlug28tQOttGWG9neWo/IgBSD8N9q6kTCppEcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1b302f7e-01a8-eb00-f801-2f4cbfbef959@suse.com>
Date: Mon, 28 Feb 2022 14:07:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Content-Language: en-US
To: Jane Malalane <Jane.Malalane@citrix.com>
Cc: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220218172943.12182-1-jane.malalane@citrix.com>
 <20220218172943.12182-2-jane.malalane@citrix.com>
 <0a31970c-c0f8-c995-ce04-67523a4a830a@suse.com>
 <22ae35a0-9df8-9357-4b44-2f00586144fc@citrix.com>
 <de431523-ad71-1cb6-a28d-07418886ee23@suse.com>
 <b594fe28-6b47-d697-a038-b1a9ee903288@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b594fe28-6b47-d697-a038-b1a9ee903288@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0202CA0004.eurprd02.prod.outlook.com
 (2603:10a6:203:69::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2eb8538b-1d5d-41f4-f3b8-08d9fabb452c
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3943:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM6PR0402MB39439335ADDB6AD436B0CBC8B3019@AM6PR0402MB3943.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tbiFE5QF/4QLRK5P6vrKY6YQ92ucv7nkUFrJZ9W7ZDqiO3NTq6X9+i2OYKqOULeAxLfkgA3jFEmF8GmTenN3uyY1C5857Qiw8OecyuciLbvcWONLTWoUgOZvB4DSWBCaSkekr95mR7YPf6lGClSnd5hPZFFixJIjk7zNONYv5H5ESnD0/t/EG60we0f4W2yK9ORU7c/GUaWLMQ4cE4wWN8LgCF/P/rtsEd3nQxQ/RPVIFkY7mP9VDMPG1KG74O0K7g5MgQ01xJT6PCr20qcDZWG/13q2sZ3aDBrUE0gKUClIBndtf6kP8swYHCusdytx33yxBPfzk7FNZpCPEks269clgz2M+dytecQiWUYGnTqi703uSu9X3tDE2xs6lCugqleZrNNHlXo5bMiIHk2Y7++1dsGyzhDVBCoEINv4mMLcAOWgEuid9JEHGb2DAauHqkwEE87iZiIIngEF4MmC2fbvQh4uUtkEjlT53DYsDH0jJyEHVf+wHW+BhFTgWG8+SUxH6p4LA44JWiAKSX/QCg0lfSMeU/XCBxCfI5Qa2IWlPvXBAzupuMJ0ooG4hlvKYv6y865/g3bhtYa22Ccgk/HhW6K0j2BFffK3JMTiUXVXHtUlpGFrU8U/CAxoqSKUn08RV318nzYxnNVYq8IiTc/Pt3pGq4RBEXpdDiT1oxw+FvFILGuphIJYj7I5T23ugCsmeWisVtyAys9wqbjS3YMey+2oxZKolrBJU3tFE8tSK627CpM/THwZRAD/r3zq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(54906003)(316002)(38100700002)(508600001)(6486002)(36756003)(53546011)(6506007)(2616005)(2906002)(31686004)(26005)(186003)(31696002)(86362001)(8676002)(4326008)(6666004)(66476007)(5660300002)(7416002)(66556008)(66946007)(6512007)(83380400001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1p3UjVNNFhQOWJQc2hTRTVDVnhVNjZ2dXJLWkJoMGFsN2NKVHExOWV4MFp2?=
 =?utf-8?B?MWhyZTZ6WVQ0TFBVaTk0bzRtVWcxdkVIMFpQZ2dPU2Q1OHdYTVIrVW9tRi9X?=
 =?utf-8?B?L0RteFZMOFpQTk1PZmZsMmVVc0pOVFByM3V5WkN4ajh1b3AyTm5ibUZGVDJ6?=
 =?utf-8?B?aXZCZk1YeGZic1k2cThwSE5kVVRJVW50SUJKNjRUZXBQR204Umk3Y1dVb3pE?=
 =?utf-8?B?UWtGMUgrUGxNaVk3V2p3VmplL2pIZE0ydDVRTllmam13WDgyMWhUVVQ0ZXhu?=
 =?utf-8?B?bk5Ec1BScXBXMmZhMEhGY1FGaHNvNUtLcXE4aXVLNStCb1VnN2Y2UXRNMEtj?=
 =?utf-8?B?R21QOTNnVWZ5MU1pMHRxWWVmUkVDYWVlYlJvRTlyREpYbFpOYmxHTFBtQzd6?=
 =?utf-8?B?M0JxWFg4RzZmQVZlNFRZbHhpRXMvM1dYR2NFejFObkxZMkhPYzhmS2JtdGIv?=
 =?utf-8?B?MFpiNy9VNWFzS1R2OGVqUlNqOWE3MUJFRVBwODZCMmpWZDd6bUhBdDRpdXha?=
 =?utf-8?B?WHNidkNjYkxKbjJJamJPS3RTZkdENzdod3E5NW5SaCtHamtFai9ueUczZGc5?=
 =?utf-8?B?dXJkYzJTbXgwdUtUTHBNcXpZNTdWbTEvSEtLZGpkRklaNVBRek9zajE2RFpr?=
 =?utf-8?B?eWRxSTIwMmN0WUkzN2xIQlFmUGE1OUk2WDJ6VUFlR1kzYW9VbHRvaTVISTlV?=
 =?utf-8?B?K1ExV2ZaWldDMzFPcGdsbi92QUlPTXJOVVBkbUF0N2pGdnJxa1gzemVRazNR?=
 =?utf-8?B?YWN4QVdCc1B3WEN1K2lFazArY0E1VWVyMGo2NGJqZGJGN0lWQXFVSWRzVGUw?=
 =?utf-8?B?UXZCaHZqRmM4dlR6cEhGYVN3UndPMFVkbXJDTG9ld3E0M0hMdTQydHc4M0Fx?=
 =?utf-8?B?MEwrRzhGNkM5Yzl5a0RPcjZFT1F5ZWVsOGlsM01hWWFJL0w4UDRWVGdKMkZP?=
 =?utf-8?B?NmNscjFweUduYmJEQmhLMUxSYTdLUUkzZVIzcFhvaGxDZmJGY1NxWkJUZE8x?=
 =?utf-8?B?MkRCeHdyR1ZCY0Zsa1oxeUtvYldrWUZYR0Npcm9lL1ZXVjZOazNuMDRNd2hJ?=
 =?utf-8?B?RFhlM2JxbjlUcUtleHFGYU11L1dTSTBvSmRzelJjU1pqV0Nva3Bua1ZDWUt2?=
 =?utf-8?B?S1lYVzZCZGJYQ1g5V0RkRnlJR3Rac1crZFNUL0hFUWtCVUZzejArT2VTSXZB?=
 =?utf-8?B?OVJHSTdKdnhZWko2YnRKZ0xTZkxLQWwya3JRalI1ekZRR1JaMExHOGJjYkJK?=
 =?utf-8?B?aG1QVXJwczRoRENJMzk4bkJyUmcxaHc5dS9zTnNvdHJPWmxiOGlGVzhPNkFt?=
 =?utf-8?B?WG5RZ1dTVi9YWEg4aHprYXBFaVNMcnA2SHdtaU12RVRtT0Z0U0hsdXN6NnR0?=
 =?utf-8?B?ZUwzdzhxQkxzQVBMRHpFK0xKVkp6WllLSFV2WHZONDQ2ZmJVLzl5ekZJR3hN?=
 =?utf-8?B?Njh0cE94WU12b0VWK3A4dW0yTlRIYkprMzVXZ05ha2JONzFpOTI1VE5RMUlN?=
 =?utf-8?B?YndlT2tHVXVmNXVKQlFvTUwvakU4VmthNFkvVXpHTWMvSVZaYnVXQjFqTnFi?=
 =?utf-8?B?KzY3ckxaNEZJMVJCNGcyekkwc1JVVlh0cjdkRGVLQlpBeWQrWkNNbFVRcXZW?=
 =?utf-8?B?cmhmcUVGWnlTUTRqdmphdWZlVVhKM0dsSkRRR2FObnlObGJCQ0dLbjRLTXBx?=
 =?utf-8?B?b3JMV043SFpZdDFhYUdmR1FXRnhBSnFETnFqUDNxaWlJa0VhUDBvY0RxSE1j?=
 =?utf-8?B?RFZkc05HNGU0cUhUejgrWFdhT3pLRktuQVZRS0Q4Z0x5VVBBNWZQR2kzZmlZ?=
 =?utf-8?B?REV1VElVQWlNZ3NjMHorenp2QVhOZnFtSkFZR1ZlSUFORkZkNy9vUnVEY0Fp?=
 =?utf-8?B?VzdrT2xlc203YXFlSHU4NTVuQ004cHlpaU1rdVIzdkVyblg2a1h0c0Nqa3Vq?=
 =?utf-8?B?VDZ2QmZjMEJqNHM3YVJKYUdsL0htYTcwaG9rbG0xbi9tREpMSG1iQnlkaStq?=
 =?utf-8?B?WUZNdWFhR1cybjhJcjJWbVYydVpoNlVNMTJXTlI0NWUwV0xXUmdOMm1uaEhr?=
 =?utf-8?B?Wkc5REZoZ0xQRWdNeDRJUFVSMENjVndyTmVMcVFrQW41bWgyUjVVWU5RUVRE?=
 =?utf-8?B?bklUWFNvd3VxRVJXYzdDQlFTV2RJRmthRkk5dTRid0tJb1hUMDE0ZjRpOG1L?=
 =?utf-8?Q?ujVznvN7BrNLNeGZFX799QA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eb8538b-1d5d-41f4-f3b8-08d9fabb452c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 13:07:27.7444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0PmxTIwwWKDO04Vpm7BZvtd7hO8SmEg/GvvQxJgIkNEOFkyB3xiVECcOu8hoFVrSWwZl63r059umhkZ1wUE8Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3943

On 28.02.2022 13:09, Jane Malalane wrote:
> On 28/02/2022 07:32, Jan Beulich wrote:
>> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
>>
>> On 25.02.2022 17:02, Jane Malalane wrote:
>>> On 24/02/2022 14:08, Jan Beulich wrote:
>>>> On 18.02.2022 18:29, Jane Malalane wrote:
>>>>> Add XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_xapic and
>>>>> XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_x2apic to report accelerated xapic
>>>>> and x2apic, on x86 hardware.
>>>>> No such features are currently implemented on AMD hardware.
>>>>>
>>>>> For that purpose, also add an arch-specific "capabilities" parameter
>>>>> to struct xen_sysctl_physinfo.
>>>>>
>>>>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
>>>>> ---
>>>>> v3:
>>>>>    * Define XEN_SYSCTL_PHYSCAP_ARCH_MAX for ABI checking and actually
>>>>>      set arch_capbilities, via a call to c_bitmap_to_ocaml_list()
>>>>>    * Have assisted_x2apic_available only depend on
>>>>>      cpu_has_vmx_virtualize_x2apic_mode
>>>>
>>>> I understand this was the result from previous discussion, but this
>>>> needs justifying in the description. Not the least because it differs
>>>> from when XEN_HVM_CPUID_X2APIC_VIRT would be set as well as from what
>>>> vmx_vlapic_msr_changed() does. The difference between those two is
>>>> probably intended (judging from a comment there), but the further
>>>> difference to what you add isn't obvious.
>>>
>>> Okay, I will make that explicit.
>>>
>>>> Which raises another thought: If that hypervisor leaf was part of the
>>>> HVM feature set, the tool stack could be able to obtain the wanted
>>>> information without altering sysctl (assuming the conditions to set
>>>> the respective bits were the same). And I would view it as generally
>>>> reasonable for there to be a way for tool stacks to know what
>>>> hypervisor leaves guests are going to get to see (at the maximum and
>>>> by default).
>>>
>>> Like the "cpuid" xtf test allows us to?
>>
>> I don't think I understand the question. That xtf test is concerned
>> about checking the CPUID output it gets to see itself. It doesn't care
>> about what other guests might get to see, nor the maximum and default.
>>
>>> Makes sense to me. I'm happy to take that up after.
>>
>> "After" what?
> So I meant to say that I could add the Xen CPUID leaves (40000x...) to 
> the policy so that toolstacks could know what hypervisor leaves guests 
> are going to see - in a future patch, as this wouldn't just expose 
> XEN_HVM_CPUID_APIC_ACCESS_VIRT and XEN_HVM_CPUID_X2APIC_VIRT 
> (0x40000x04) but other features too.

But doing this in a future patch (i.e. subsequent to this one) would
mean to first introduce the sysctl just to then rip it out again.
Hence my desire to consider the alternative before we settle on the
sysctl.

> But, at the same time, w.r.t. this patch in particular, using 
> XEN_HVM_CPUID_APIC_ACCESS_VIRT and XEN_HVM_CPUID_X2APIC_VIRT to detect 
> assisted APIC gives us less flexibility to add more fine grained 
> controls in the future.

I'm afraid I can't follow: All I'm talking about is how to expose the
same kind of information to the tool stack. I don't see how the
mechanism chosen would limit flexibility going forward.

Jan


