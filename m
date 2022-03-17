Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F864DC203
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 09:56:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291427.494585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUlvG-0003xm-5f; Thu, 17 Mar 2022 08:55:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291427.494585; Thu, 17 Mar 2022 08:55:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUlvG-0003v0-1V; Thu, 17 Mar 2022 08:55:54 +0000
Received: by outflank-mailman (input) for mailman id 291427;
 Thu, 17 Mar 2022 08:55:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RBlk=T4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nUlvE-0003uu-31
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 08:55:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b0eb9a0-a5d0-11ec-8eba-a37418f5ba1a;
 Thu, 17 Mar 2022 09:55:50 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-VGZI8ge8OESSGE-ypJANyw-1; Thu, 17 Mar 2022 09:55:48 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM9PR04MB8809.eurprd04.prod.outlook.com (2603:10a6:20b:408::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Thu, 17 Mar
 2022 08:55:47 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::2d79:4387:3887:ef9d]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::2d79:4387:3887:ef9d%9]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 08:55:47 +0000
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
X-Inumbo-ID: 0b0eb9a0-a5d0-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647507349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J0WQxJiYeovZM0eZB03v/+TH3KSM5K/BTwmc+se3C2w=;
	b=fH9HKAJe56BZPiZQRR6onPjNLOvkCS/bbl2fdLZOidUaCFtrfekOQS4WwkxeQQrJTykM+G
	1I2F8JOhU7K7MAvTHAml6VnJ/oK7JXmAOIGUlTI9CNYGKuEgbQqr2fF+4Eai8avBFDuBG3
	74198cSzvlaBv0qOcGL1lt7OuibIK5A=
X-MC-Unique: VGZI8ge8OESSGE-ypJANyw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lvO2Q/+kgPIm8QxF94+/eYVeS+qGDgIC7q1PQJUNq+wEYT9EWhMchUZI7EmCxoMbHCivZoSHJs1rZ56KN3w7XoBJJFq9GmpKXdiQRQL0wHz22OF8xwo5uzkf4oAdjHKi5jIcM1940otBufd0vvjh+yMTioGcEtK129DEOemmy/W0SaGa5zf8KLD2Qp9M6xgTVtgPSIepXv9hdUoL1A/U571KRaw7x0LGuPXIvVE0fb4QqNwmwF0i2xGn4uwAYggKDzpw/HGqS6EpqLPiBIHxlurmGL6HwtGXxLta9V9KY75rVwjEtwsguB0nLdddkUfNHvkn6vjQU1B1fm4IL9zyZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0WQxJiYeovZM0eZB03v/+TH3KSM5K/BTwmc+se3C2w=;
 b=nY5v90TnI8zI3Sh/wc+YkJxEfFvhL7WJVpifDXX4klp+OjM+NPKJzTQJWMQIu+Jvu9BqA/VB0GE0bfjp+x5xF0lBy27ptCDcW12cAm0R7RjIC27hRf+rBhrDLjbhqP3hT/4H7tuh7IO0DRnjnGapKeuZNhuwCwco56TvfabE4icS9B2oRKImpGs7e9c/P4EYLJhVmmCxe1FcR8M6OT3RZpCkDTQXBGECELVoVc9s/y3UmD+JtP9AuzrB5BwbcaRNr9oH7bwArk1LBpTBCnVE5Hf8saGbS4F0PmHvSyAgJk5aLYm13+n+cwmFPwzK7zWFyu7EGTxO9WKiAG0U0WrXkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ba5f6a5f-2acf-cc9f-e371-3fd334442318@suse.com>
Date: Thu, 17 Mar 2022 09:55:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 20/23] VT-d: free all-empty page tables
Content-Language: en-US
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "Cooper, Andrew" <andrew.cooper3@citrix.com>, Paul Durrant
 <paul@xen.org>, =?UTF-8?Q?Pau_Monn=c3=a9=2c_Roger?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
 <807a48fe-3829-d976-75dc-1767d32fb0f4@suse.com>
 <BN9PR11MB527622E58C2E4EF90CF29EF88C379@BN9PR11MB5276.namprd11.prod.outlook.com>
 <9432990c-6de4-ad12-e9fa-12792200748a@suse.com>
 <BN9PR11MB5276930B2AFE79C4961E66548C0F9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <ca2ad24a-0703-de6c-81a5-e01615f93d21@suse.com>
 <BN9PR11MB5276A8DF0810DE510C1294038C129@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <BN9PR11MB5276A8DF0810DE510C1294038C129@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9P194CA0020.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::20) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f38deeac-32fe-4afd-5fd2-08da07f3ed98
X-MS-TrafficTypeDiagnostic: AM9PR04MB8809:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB88091E14772121B4F2972B58B3129@AM9PR04MB8809.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LAkxdqTSR8uq//bhjjApfzb/XzwoVRj4miRjDng3/eUljQ1uG3ClDOEz+dFkXqXSJ9r0tLBKJxm2CJJ9aFud+kxwl2kmJ3DLOxsAel4NCSy3F46YuddY9QJgEz6XCGCNbjH7bHRteXyEN+71AUYwWYboHDMZ2kY/3nS64oMCi7mgrkcHPmjaP+d/Uue05EVbhGCiuYA5RQk84UAZ9TjeWbVQr29QxBZvtE+o1bw7x9F2Vu6vtjDOIcyFnTcWEDcIBMjOjPQy9TBioOSp+T0rCLPW+dWyawZx516vOkJXwVEsboOw6Uk0XzyoMrd2axnkH+VEMMiyQ3J7hq5GherGd397+duVWBMPxKMpz8qKyxVXn06YkadXg7uKQYjQAfFNnuKq3YdUbV1iW9164Q28DHye1+CikipDhYGEs2X0UsvkF83qTBkuq2yCllyB6t4/6ROjyXRDXXkAqRGKzTEHKXYkiJWaQzJEz1fa1kXtdUFKugkWjH5GmZiC/xRvbBoQdHZEbKAwuftw2Ua6nb9dyTAdb/Xqc8KuDIxuxQ5ukpoITU45yW80m2HK79Lc1ck4eIxIl+xm0lTPQmYacyvOfaln/13Ok0x2uV7rRg6dKois5ZsLMVeJnpt+kijU7ldqErqLSRyH7JO2EB1uSWGfKUqdrwFByPZmdOc8CdIZedaQJAIFx6GegomFyVEJIKezT0cj+Xn4EfGD4MdUMKMFtfDfJwFc+7+8NmLHH+VtXw8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(83380400001)(66556008)(66946007)(66476007)(6486002)(38100700002)(508600001)(6506007)(53546011)(2616005)(6512007)(8676002)(4326008)(26005)(186003)(8936002)(2906002)(54906003)(6916009)(36756003)(86362001)(31696002)(31686004)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDRRN213VUk3Qm56dzllRUhjUjVJNzJlcWNDMTUyRG1ZYi9CeW5KVHI3cGRZ?=
 =?utf-8?B?SEpSaWVkSDNFWE1aU0k5RUY4VmN4K3BTWTROb21SOFlzOGxJNGdZTUliY3Ji?=
 =?utf-8?B?NXBvM0YwL1VxT1kzeVBCQWR2OHZkSkx1OHF3eHNqakRmTWpITFJ0WU5MUEoz?=
 =?utf-8?B?OVZDZ0w1L2JSMGIwbzhaRHZtTU1DZlVHUHZ2YW9HcUZhNC9yWXAxUmFqVzBu?=
 =?utf-8?B?cXVnUzZTQ2FHOVdPVnhnV05CM3k0VEpKRGw1eFRLT2Q2djcvelRMUGpVKzVz?=
 =?utf-8?B?SUZCWHcxZFArQVBBWUtJMUxkMnJRL2tvcHhzR3Y3VndKalB3ZkN4aFAwdDBL?=
 =?utf-8?B?QjB0bm5jdW9HWnFKempHNm1OV2xBOTEyTnVqMk9RdXIyRkRZWDcwVkdwQlln?=
 =?utf-8?B?cUpwajVLbFJoQmdJUjZ3QWtTR2JGei93K2lpeTVGaW90eGtEd2Q2bFpuT1NM?=
 =?utf-8?B?Q1RocEFjYjcvUlVrVFdodTFlR0NrMDhxejFmT1YwcGh6YWc3UGFMOFZla3Za?=
 =?utf-8?B?Z3hwYWcweUlhcUhSTGhEeHN6R2NoR3Y3c2wxT2YzN3ViVmhXMGlCc3VNNmVE?=
 =?utf-8?B?cWhpU0Jja1R0b0J1ODJtN2d5SXViQXhSaGZ0ZFRzWkNiN1QyeFRUNEUyZEJP?=
 =?utf-8?B?eXZjSEZPT2QxSUQvcXVoclIwdHdyWWFUMXRhclRwNC92bXZwL1U1ak9LOTVs?=
 =?utf-8?B?UXdsU1N4VUZONXdFeWsvR05vWktLclZ6NHRrcmhrZk1USC9lVnV6aC8xaEcr?=
 =?utf-8?B?Y1ZLRDJ5WkZ4ZjBsb1g2QmF1alM4QWN6YXlodFlRR3NpVjQ0U05Da0ZTWlJw?=
 =?utf-8?B?eHl0aGhIN3dIbGhGRlVmWUEyM0wzdlFaU1lreXRHUVlpSlRLN0dqNmpGNnBJ?=
 =?utf-8?B?TTFjOFBYOWVpRHlzV3FnK01yVmxBbUg1VmpNNHV6MU9sTVI0NWE1R2hYbGo0?=
 =?utf-8?B?VFJOdG5mOVgzYWxMelZPdlNwZHlqREtCSEFxTFE1Tjg3akdURTBaeFJvclZW?=
 =?utf-8?B?WXd6NGEvMXVNWHl5QWFlQUEvS0RzMlJCL0ttSktGcDAzOG5VTFlsc24wcUVX?=
 =?utf-8?B?YWRxSnV2d1dteDJHQktkNkN3dUc2VkpLbkVEM2pUN2lERWpUV1Y5K1A5QTJD?=
 =?utf-8?B?NnlSZDJqaTdPcEtKOG1hVTZBRUdaWHZxM3o2N2p6QmdIcGpoWFZBVXBnQ2pr?=
 =?utf-8?B?RFdhdGkzVmZISmtyQ0U5bHRCZWVCcUdJQ3hpR25NekczTk5BY2RwM09qRkFi?=
 =?utf-8?B?cmpTYnlJM0lsdk1ReU5lMWVXczhGa0syOXVNZ0MyTkM4a2tCZW1DbjhlUWpi?=
 =?utf-8?B?UlpHMFhPRHF2dC91cUhzOGFXRGFFdzJmbWhtYStkejZJWEZWTmhzVTBlNEVJ?=
 =?utf-8?B?TDBMY2hFVW50ZnpvdUE0RUFmd2hUVGp0VERrb292S2dsaE9KU2l2NHRzblNx?=
 =?utf-8?B?Vm93b1ZJdjRyQXJnQmxMR1pCVVRKZVdMYTNlTmdRekN6dmdaZ3hmdVNFczRr?=
 =?utf-8?B?M1lSVExsNmhpdmQxTk5pdFBDc1ZZR29tbndyRFZjczdzVlVCeHJmVGRnVGh0?=
 =?utf-8?B?NGxwTXpVdzhka3VSODJaaDJqak1nS3QzS1E2N01WNzBuNW5RTERJWUUyVFZT?=
 =?utf-8?B?bm9NdDNGRS9iMUFiZ3lzVUxVUXpzdmNETGlLQmMzanh1Z2JTNWlkZmYzN2JO?=
 =?utf-8?B?aVpXQXhqck9sbEhXVVI5TFdDM1RKZmRGNVNFVWVnMWE5RURla0tzNVBtYXJM?=
 =?utf-8?B?VWJhSFkwL1c0bVF0bStCZ3ZCcll5bzBpdWpCTVhVaVVPYUF4R1E1QkRZSTZj?=
 =?utf-8?B?THZwZlpOWHB4VG1xbC9MMHhlSitmTUNyVk1keWtLUGVoZGdiTnFkRmNuZzhR?=
 =?utf-8?B?dE9CWWEzVGovR2g2ZHZJMElKdW16SHoxdndOdG9VRnJsOUJLak0xS3o0SzVR?=
 =?utf-8?Q?7kBZi2e/1YxFegpOQQC30MjOJCno0oWY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f38deeac-32fe-4afd-5fd2-08da07f3ed98
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 08:55:47.1917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MlX5B5lEuAkICrjhkioXYPclZPgXFJwYO2Xyh1Ci9NulI6rBrpO5mPlpKP3j86yZMZsqid6C1DFSOcue5t4Krg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8809

On 17.03.2022 06:55, Tian, Kevin wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Monday, March 14, 2022 3:33 PM
>>
>> On 14.03.2022 05:01, Tian, Kevin wrote:
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Friday, February 18, 2022 4:31 PM
>>>>
>>>> On 18.02.2022 06:20, Tian, Kevin wrote:
>>>>>> From: Jan Beulich <jbeulich@suse.com>
>>>>>> Sent: Tuesday, January 11, 2022 12:36 AM
>>>>>>
>>>>>> When a page table ends up with no present entries left, it can be
>>>>>> replaced by a non-present entry at the next higher level. The page table
>>>>>> itself can then be scheduled for freeing.
>>>>>>
>>>>>> Note that while its output isn't used there yet,
>>>>>> pt_update_contig_markers() right away needs to be called in all places
>>>>>> where entries get updated, not just the one where entries get cleared.
>>>>>>
>>>>>> Note further that while pt_update_contig_markers() updates perhaps
>>>>>> several PTEs within the table, since these are changes to "avail" bits
>>>>>> only I do not think that cache flushing would be needed afterwards.
>> Such
>>>>>> cache flushing (of entire pages, unless adding yet more logic to me
>> more
>>>>>> selective) would be quite noticable performance-wise (very prominent
>>>>>> during Dom0 boot).
>>>>>>
>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>> ---
>>>>>> v3: Properly bound loop. Re-base over changes earlier in the series.
>>>>>> v2: New.
>>>>>> ---
>>>>>> The hang during boot on my Latitude E6410 (see the respective code
>>>>>> comment) was pretty close after iommu_enable_translation(). No
>> errors,
>>>>>> no watchdog would kick in, just sometimes the first few pixel lines of
>>>>>> the next log message's (XEN) prefix would have made it out to the
>> screen
>>>>>> (and there's no serial there). It's been a lot of experimenting until I
>>>>>> figured the workaround (which I consider ugly, but halfway acceptable).
>>>>>> I've been trying hard to make sure the workaround wouldn't be
>> masking a
>>>>>> real issue, yet I'm still wary of it possibly doing so ... My best guess
>>>>>> at this point is that on these old IOMMUs the ignored bits 52...61
>>>>>> aren't really ignored for present entries, but also aren't "reserved"
>>>>>> enough to trigger faults. This guess is from having tried to set other
>>>>>
>>>>> Is this machine able to capture any VT-d faults before?
>>>>
>>>> Not sure what you mean here. I don't think I can trigger any I/O at this
>>>> point in time, and hence I also couldn't try to trigger a fault. But if
>>>> the question is whether fault reporting at this time actually works,
>>>> then yes, I think so: This is during Dom0 construction, i.e. late enough
>>>> for fault reporting to be fully set up and enabled.
>>>>
>>>
>>> My point was that with your guess that the ignored bits are not
>>> ignored some VT-d faults should be triggered. If the reason why
>>> you cannot observe such faults is because they happened too
>>> early so no much can be shown on the screen then trying to
>>> setting those bits at much later point might get more shown to
>>> verify your guess.
>>
>> Pretty clearly there aren't any faults. And in fact my suspicion is
>> that the bits are used for addressing memory, and then the memory
>> access hangs (doesn't complete).
>>
>>> btw any progress since last post? How urgent do you want this
>>> feature in (compared to the issue that it may paper over)?
>>
>> Well, one way or another the issue needs to be dealt with for this
>> series to eventually go in. To be honest I hadn't expected that it
>> would still be pending ...
>>
> 
> Sorry I didn't get your meaning. Do you mean that you didn't
> expect that I haven't given r-b or that you haven't found time
> to root-cause this issue?

Neither - the comment about the series as a whole still being pending
was a general one. After all it's been over half a year since the
original posting of the first parts of it.

As to root-causing this issue: I don't see any reasonable way for me
to do so. Hence it's not a matter of finding time anymore (that was
only the case until I could actually associate the behavior with the
one specific piece of code that causes it), but a matter of simply
not being in the position to sensibly try to dig deeper. I continue
to think that the only reasonable way to gain further insight is for
someone with access to the sources of the (I assume) involved
microcode in the chipset to spell out what the expected behavior
given that microcode would actually be. Without such knowledge I do
not see any alternative to what I'm currently doing to document and
work around the issue. Yet I also understand that given this is
rather old hardware, there's little interest at Intel to actually
put time into such research.

Jan


