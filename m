Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C170D4D003B
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 14:38:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286043.485370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRDYn-0000fL-8J; Mon, 07 Mar 2022 13:38:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286043.485370; Mon, 07 Mar 2022 13:38:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRDYn-0000cg-5D; Mon, 07 Mar 2022 13:38:01 +0000
Received: by outflank-mailman (input) for mailman id 286043;
 Mon, 07 Mar 2022 13:37:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XxC1=TS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRDYk-0000ca-Th
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 13:37:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb9b90cc-9e1b-11ec-8539-5f4723681683;
 Mon, 07 Mar 2022 14:37:56 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2054.outbound.protection.outlook.com [104.47.9.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-n5Qcd5AeMkON5a2jUvVHnw-2; Mon, 07 Mar 2022 14:37:54 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB5140.eurprd04.prod.outlook.com (2603:10a6:208:ca::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.26; Mon, 7 Mar
 2022 13:37:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 13:37:51 +0000
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
X-Inumbo-ID: cb9b90cc-9e1b-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646660275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kIqkv8ybezUixvUhAtSNcJLi/OOxgZMaTY3yByPj5Bk=;
	b=B+mJ27+54ipWhC9fgOZFZBSN4yxgzjThmCL6xZZpd1H5d1js2hVMXKRd6TuIRw5WozSQYc
	wUUoYIefnVNL54yweo5A1X5JphN6wj+sntDIa4CEhOJVnq+gm4vsFGX3LhW/zqPFIhbvBl
	p6Uy/Dwmq8hd5C/AaaGNf1KgNHGTFrU=
X-MC-Unique: n5Qcd5AeMkON5a2jUvVHnw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TVYvA4qxwWJF+XLv/kkgt7tQXrDAiyQ3JjTCjUT07DW3NGNUeATSzcssFJIEckAH3ewST19nsQfqoooSsDwVz1eht32z/SLqLmNoGRpdw+sMqKEyTYW0qOO1O+ent37eptQ3EPYErqTARKOJosOChLk7OXuGpQvTWoPsBOblsym4XOStPBueTFurVImtmdrw5qv0qGpTgkd8RAnRXMm4jc7YgQSVsUpHRa3h/k6bBi3aA1iVy1Cnh7Gtrv8zOKFcy9JByjwsisG+HNwNtASD6nxRiiBq3tUBMwWPPdUonpshG8bDwPOEXl/PHyMtEyYsp/2nbpcK2ikw4TaoF0pjUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kIqkv8ybezUixvUhAtSNcJLi/OOxgZMaTY3yByPj5Bk=;
 b=cN5dgoSuo9Jp15MxafvOjQIVN8RWvcbRtXLZNdyJ9pvp5Pl2JcZGM0T1ODDOvX6TTuBqe20yWdLVwCtd7A3JpCBfHLUJwea3detvJJnPGoxy5pbtOo8vSUoE/lrVEGM5Qr6Psqat/MBAyAXvBfcRGbV0W6S45P2dVas3zT3cC9TxAeqUN88QT2cJchhqQEyQkkCgtiKDZ/7nUweHnIIK3hHA/DqBrAM94sAWS04dO0r0kCAS7rdC8m8xBFCPJ1FAEHEvPP9DVara5HCwvwzYcodOY/Hdxv4zC3L4f5lRNAV9zdxaNPxglUniIZvlLqB2PGlIDojMnGQMuWyxSiEJBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <298b7b5c-0c5a-c449-deb9-4495a704b3d3@suse.com>
Date: Mon, 7 Mar 2022 14:37:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v4 1/2] xen+tools: Report Interrupt Controller
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
References: <20220302150056.14381-1-jane.malalane@citrix.com>
 <20220302150056.14381-2-jane.malalane@citrix.com>
 <240602ab-412c-8607-ed6c-916cf37343f7@suse.com>
 <67296830-aa16-4231-69ba-f07d2b1a4b65@citrix.com>
 <fa957ce7-07f8-9726-9537-8b05e9b6d76e@suse.com>
 <ee556d51-bcf7-5749-6e3a-92d1ec3092f9@citrix.com>
 <299a0fe4-e7c0-b381-4318-a27f02c96d98@suse.com>
 <0d0dc2f0-470e-4ef7-ff88-f411ba79617d@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0d0dc2f0-470e-4ef7-ff88-f411ba79617d@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0104.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::45) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56eae4d3-f44b-4678-fc88-08da003face2
X-MS-TrafficTypeDiagnostic: AM0PR04MB5140:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB5140D9CCE3F6183668272CCEB3089@AM0PR04MB5140.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E/pqCTBR+RGdHqyem9ePMl9dPuIVkgsAkJ2t973/UU25/tOUY60SpFbcuGYTlYuByfIzJTbqnZAMz52rXf1Z9ciU4LNiBvpKdPYXsXy8JAYL5aT5b/LWL1jNeclnQxgU0tJzehPCk7tuMKWq4o8FNZ9hDrMcWrklYy3BbhWmmJ972uVmx99qo5tocTBBITn5Zgwi5IkC1dHLDMF5hsQfID7NitVlfv9N0GHlbSgQkuO1mNkwaA/tu7UH5NvvUgSYtAsTpWFq/sBzf/fnN/iCO5GPj1UuJ657+FJ5O4reHm5pdtNUeeELiA+P8LLTHldDcUXB8Ab7oGDrAwk3Oigr8glVdeTU7E7LjiCKIXGTlnSEYX8x60034wsyHfwpc2S9Kqg4Yf/3ivjKvSsn7gZsIISkLtKjQcgk0bEa5vh4+He8G5LklXTFGLViXVhoUZYvGI46woI4adR3DPZquMcmKTx1a/eNcwRt8xmswh/5Aw9WP3NDFz74Vo71IvSYtY6JrP9MntyZiMMFBRwZQs4YfWMZ8Yc+8llr2uC2zoycKNGXyoMkAraoWeyrGbksyQ2g6uLvidHLVjGAaSSGeBLGyBSmgjJGnlDPF9YSsskl94ABKCN//+quXDqiubRLsXmDV5FPjcBtNEd/Eih7FXNFPUEBR2tgNxkUJ/Z62IhfNCPBZ+9MnP67y1pPvXdVCCVJClJ4J9+xcfTYb75/qZ7ZJF1wM3SP73/vJeXF1uIHiMA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(6916009)(26005)(316002)(38100700002)(6512007)(6506007)(53546011)(54906003)(83380400001)(2616005)(186003)(508600001)(6486002)(36756003)(86362001)(31686004)(66556008)(66476007)(5660300002)(7416002)(8676002)(4326008)(66946007)(8936002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHBubDdaaXc2dFRvTkVPZXNNS1hXTHA3ZGxRV1BGZUp2OXhhV00xREp5SnFj?=
 =?utf-8?B?TmpuN21HY041U0F3eDFLZkJTMzZMVzZqMThRTE5NSE16N1ZLNTFMMnhkbjlQ?=
 =?utf-8?B?ckJIVEM5azlxdGZWTndheVhOUUE2bkU0dWU5Y3VaN3pUR01rNlNKY0g1L1hX?=
 =?utf-8?B?aHdSVHIza0Z1Z0pjMG43bStlSkpPK3dEbkF2WmNPMDNNcUJQbVNvb25FTmV5?=
 =?utf-8?B?RHl5WVNYSG1Zd1RLTVRiZGhEeHdCUnlqdXI5K0k4S1VMRFJGb3g4Y0JTR2FO?=
 =?utf-8?B?dlJaTVhha0U0YTdzb01HTGIyYlhhUVRROXV1ZjJiUlV5eUVJaGN0ajJhZjNZ?=
 =?utf-8?B?bDJ6SWt2M09ta2pVaFM3RzZIT1ZDN1ZSU3JIQTlGMDhVUlZlL055V0liazlx?=
 =?utf-8?B?elZZc2RoQkpOaDF4L3hXSUFKVzdoY1RjU1IyZ3hlclA5ZmdxTE9lb1dEQTgv?=
 =?utf-8?B?WlFva0taY2ZGZUgvZ05MZ0wxTTlxWGQrVnJXSW5RaFZSWDlRNWtzdHV1ZjZl?=
 =?utf-8?B?Qm5obXRwTkorR2J0YzBDWU4vTEh4cGRkbmo4R1VBVWdVYkRMdktudHZsMTAw?=
 =?utf-8?B?VEhWaVFTTUk0Z1Z0UDFHNGhzSnQ1MklZTFYzcVBKZTRKVkZhakdTQmZGeFMx?=
 =?utf-8?B?bW9zYnFaczFXbWUrYzNJc3hEZ0p0dFg2anhHbCtKQTFncHhzWWExbyttRXBr?=
 =?utf-8?B?aXN1ZXNpUHBNUEc3eFROTXY1VUt4ZTlWelMyOXYwRG9vS3kxK2pLRXZ3bzA2?=
 =?utf-8?B?MUVLQUE5ajVldjhlak9LMXNTT28rbW5Vc2N2OEw0UDhWSkpQeFVjSDJHRVlZ?=
 =?utf-8?B?SXFCcHQ5eXZGNnlXWkZGV0sraUlWVFd2WEdEOGVac1VnemhuM3hUOU5KUmJx?=
 =?utf-8?B?dzc3YktoNzNmYk9PenNCcy9XOEtLRWRpcnBxV2FlRmhaVHhxK0doOVdqNTYx?=
 =?utf-8?B?dk1jYzN3ZEFZcUNQNHo4anViQXhCbjdhL0ZQNHB6Z0s5U0hWWEVBRHdpdlFM?=
 =?utf-8?B?Vnd2Umxld1VsMnRDNjRwTUZNU2hiekJrQWs5NVBxaTcvZnBFTktWRVNrZTdr?=
 =?utf-8?B?VEc4cHBtUWV5ZG1reG82bytKZVJ0bURwRVA4MzlTRWRjYlNnWGdBVkg4WUs3?=
 =?utf-8?B?OGN1eWxsaFpVVWxBOXVEdENtVUo0WmlvY2VCalBlT2ovZ1VjVkhiMU9VVWRh?=
 =?utf-8?B?eXNYcVp5bzB4aTU1cU1kc3lnekg5QlU2VDNINWlNanNSZ0tsUStQR1RtZnhC?=
 =?utf-8?B?d3dXNC8vOFF2cEwwM1BzN29pcHMyRmlRQUI2ci9KeHYvWEo2aXRBQU12U0ZI?=
 =?utf-8?B?NGc2S1NpVENzS29Kb25HejBtQlZDUnZLdXQwb3lsQWNvTTJzTlJ4QU1tdE9B?=
 =?utf-8?B?K0puT3AycmlLZkVYNG1UUHhRN2ZOMWI3RFM0bzRFeG9jQnNOTHQ4OUdLcDhF?=
 =?utf-8?B?MnBaa0hBL3ZnR1ZZNnFDTUN2YytVamE0TWNUVzVWbEI0dWdOenRDUnVYWEhJ?=
 =?utf-8?B?dzd3cDR5cGRuR3g5WXJ2Rm9KeGtyb1NRMEwySlIxZGwzNklTSzJCMjlVTUhx?=
 =?utf-8?B?TkxuZ1pFTUdvc0h2UUxVaGF1YVFDR0NIdUlPNjNDV3dkUU41QnNBbWlLbklO?=
 =?utf-8?B?MXdlWVpBSFlCUTk3bFlDVlozYlNrWWJrOHFtbWI3L1FLZG12Z3dGZXlrZnVC?=
 =?utf-8?B?UXlRMHhhYlFUUVBDTVlhc0hlUEx6S1N1OTA2RUhJcmNOcWhaU0ZlczNOVXQx?=
 =?utf-8?B?YWtwa052Ky9EenV5R3FNZjBkK3E3TGtXbkptV0VaVnFPWklKd3lmQ0prMG1p?=
 =?utf-8?B?d240OGwyTElGdytBYmtobUp1SGlpMVZ6UzF2MXVUWDBENFpjc0t6dmpuQ3l0?=
 =?utf-8?B?aFRnVzZIcUtPUFUraWlzNEhLbkJsNVJOWVZFbS9hWjNqSHk2aStXeXI4YWJj?=
 =?utf-8?B?NHY4elAyU1BmdUpSLzEwWjI3cjIrMktYdHF1b3Z2WEtxM1F4K2FmUkJhZ2g2?=
 =?utf-8?B?bHVUMStIdUQvY1dLRXJuRWxmNzh6c3lTOU0vTXN5dTRlL1U4SHpyRG00VjlN?=
 =?utf-8?B?UkZpR1g2SW5wNkR4SXJqd3pTeUhEdlJWMkNxRExpeEE0b25vTXlaNTVPbTRl?=
 =?utf-8?B?TjExUXd2aHB1MnFmNkdZQ1FHM1RueEQ5ampxQU5mREJRUmxVNlNXeU9xeVNI?=
 =?utf-8?Q?jZOiyocWQRkNmgP/vQYWptU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56eae4d3-f44b-4678-fc88-08da003face2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 13:37:51.2655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lrJYeILm0BwlYQtUCy9AsN1E5e9svvCq2T9p8A0c7pXS2Hpf58fs0+oFGjA/Hn41mfL/oZFmJMcpSFDbIQ8bIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5140

On 07.03.2022 14:16, Jane Malalane wrote:
> On 07/03/2022 12:31, Jan Beulich wrote:
>> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
>>
>> On 07.03.2022 13:17, Jane Malalane wrote:
>>> On 04/03/2022 08:17, Jan Beulich wrote:
>>>> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
>>>>
>>>> On 03.03.2022 17:37, Jane Malalane wrote:
>>>>> On 03/03/2022 11:37, Jan Beulich wrote:
>>>>>> On 02.03.2022 16:00, Jane Malalane wrote:
>>>>>>> Add XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_xapic and
>>>>>>> XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_x2apic to report accelerated xapic
>>>>>>> and x2apic, on x86 hardware.
>>>>>>> No such features are currently implemented on AMD hardware.
>>>>>>>
>>>>>>> For that purpose, also add an arch-specific "capabilities" parameter
>>>>>>> to struct xen_sysctl_physinfo.
>>>>>>>
>>>>>>> Note that this interface is intended to be compatible with AMD so that
>>>>>>> AVIC support can be introduced in a future patch. Unlike Intel that
>>>>>>> has multiple controls for APIC Virtualization, AMD has one global
>>>>>>> 'AVIC Enable' control bit, so fine-graining of APIC virtualization
>>>>>>> control cannot be done on a common interface. Therefore, for xAPIC HW
>>>>>>> assisted virtualization support to be reported, HW must support
>>>>>>> virtualize_apic_accesses as well as apic_reg_virt.
>>>>>>
>>>>>> Okay, here you now describe _what_ is being implemented, but I'm
>>>>>> afraid it still lacks justification (beyond making this re-usable for
>>>>>> AVIC, which imo can only be a secondary goal). You actually say ...
>>> Is the following any better...?
>>>
>>> "Add XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_xapic and
>>> XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_x2apic to report accelerated xapic
>>> and x2apic, on x86 hardware.
>>> No such features are currently implemented on AMD hardware.
>>>
>>> HW assisted xAPIC virtualization will be reported if HW, at the minimum,
>>>    supports virtualize_apic_accesses as this feature alone means that an
>>> access to the APIC page will cause an APIC-access VM exit. An
>>> APIC-access VM exit provides a VMM with information about the access
>>> causing the VM exit, unlike a regular EPT fault, thus simplifying some
>>> internal handling.
>>>
>>> HW assisted x2APIC virtualization will be reported if HW supports
>>> virtualize_x2apic_mode and, at least, either apic_reg_virt or
>>> virtual_intr_delivery. This is due to apic_reg_virt and
>>> virtual_intr_delivery preventing a VM exit from occuring or at least
>>> replacing a regular EPT fault VM-exit with an APIC-access VM-exit on
>>> read and write APIC accesses, respectively.
>>> This also means that sysctl follows the conditionals in
>>> vmx_vlapic_msr_changed().
>>>
>>> For that purpose, also add an arch-specific "capabilities" parameter
>>> to struct xen_sysctl_physinfo.
>>>
>>> Note that this interface is intended to be compatible with AMD so that
>>> AVIC support can be introduced in a future patch. Unlike Intel that
>>> has multiple controls for APIC Virtualization, AMD has one global
>>> 'AVIC Enable' control bit, so fine-graining of APIC virtualization
>>> control cannot be done on a common interface."
>>
>> Yes, this looks quite a bit better, thanks. Assuming, of course, it's
>> in sync with the code in v5 ...
> Yes, ofc.
> 
> Just one thing, since vmx_vlapic_msr_changed() uses 
> has_assisted_x{2}apic anyway do you think it's still necessary to add a 
> comment pointing to this function in vmx_init_vmcs_config() when setting 
> asissted_x{2}apic_available and v.v. ?

If they both use the same, non-open-coded condition, then I don't think a
cross reference is needed.

Jan


