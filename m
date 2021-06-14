Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A84CC3A5FA4
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 12:03:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141290.261030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsjQl-0007e9-TF; Mon, 14 Jun 2021 10:02:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141290.261030; Mon, 14 Jun 2021 10:02:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsjQl-0007c7-Pb; Mon, 14 Jun 2021 10:02:55 +0000
Received: by outflank-mailman (input) for mailman id 141290;
 Mon, 14 Jun 2021 10:02:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XszW=LI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lsjQj-0007br-Mg
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 10:02:53 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d5a9e4e9-51fb-4301-b384-b4f02484d6d2;
 Mon, 14 Jun 2021 10:02:52 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2055.outbound.protection.outlook.com [104.47.4.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-ZjViEyiiPLKoyhGFGDkU1Q-1; Mon, 14 Jun 2021 12:02:50 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Mon, 14 Jun
 2021 10:02:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 10:02:45 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0008.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Mon, 14 Jun 2021 10:02:45 +0000
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
X-Inumbo-ID: d5a9e4e9-51fb-4301-b384-b4f02484d6d2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623664971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sHdTEpmXpCdOEPV+CfkRImOUaqcbwd4uriVh5rok7iQ=;
	b=VDdeFpmpCeMlR6lUhpkyhDTUO6XEJ8aYJfrnXXPx/jPRhS/iIkT+QhpOGBSNJx9b7n+bho
	w+FBfXA011Dx01Yr81JKdMqeEP0cDZqk2EKjImhtCQU7KA2gbIALVpj2mnxAY+7p5eqiDZ
	wqS28gpfat5D1SaiJYo2ZbBuWUEhz5Y=
X-MC-Unique: ZjViEyiiPLKoyhGFGDkU1Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncI++CmL0y/6asVKUsQjZk0mAMNwdoLSdn6Z5rAx3y2UBBynfmfw1nCO0GeOg1jQCTW1950z5SRrpzzYeavnfjUmZ9bssMrIdgAfJqIY/N1qeYNdwYBn/eYCRMfZ04tfN3gijXFWlQOAKlvMXgrkxuYnigIedMm0zxqSqGN44UdF9FsGAQjpgvdfqxEOoH1GN5UTtcZ7tUC7EOBn8lRn5AH4v8fRE1nW5gaEYqcYwGLljSrUJEJw9cltpAX9ui176u9l84tVIBJIXolPkX4YrFS2nfInkgZ3zq3Jcq5X6s+vXPK+TlokBlFgCBBfrcL7m7SIWMbnNjwnmU+p3evYZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sHdTEpmXpCdOEPV+CfkRImOUaqcbwd4uriVh5rok7iQ=;
 b=a2pHaJTggM0TUx+4p6cOb0Kne87wofW1cRDHED+VgwXwnShhUwTk1deKI88s7vm6NgDfKi06IL36BY4G3J1Hsn4fcS35cMfF2w5vCcABoj9wVdd5ch9iNMVoOK/Di6dhwQVEeCqSMf32armCwAk/bd42OC5hyPeJJxlGjWjFNWb8Vc3v99fEDbXqi6geKc6JAZ8kU3q1e9fG5YV2sNEixPcg+MzMI2Rfi+QKAHEGxaVnoz4tojgJ/Us8TqW0EC4W+gDC7kc0Wrr42KjCbdg9gq+St19E1c02CnzbzD6JGLZ3WKR3BFgWL35caUIjx601JsLKa1Hbs0JIVL37/X4xhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] Arm: avoid .init.data to be marked as executable
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6837f903-14f6-4438-ed05-b373149984f3@suse.com>
 <b7e76787-cdae-ed1a-a741-e5db146fc87e@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8c5ec03f-5ea1-99f8-a521-3552d0015ac4@suse.com>
Date: Mon, 14 Jun 2021 12:02:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <b7e76787-cdae-ed1a-a741-e5db146fc87e@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR2P264CA0008.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::20)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bfef8889-7706-4740-e154-08d92f1b8ea5
X-MS-TrafficTypeDiagnostic: VE1PR04MB6382:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB638234A8B5A821872B47292BB3319@VE1PR04MB6382.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t+ZEtwcMdnFmAF+/OquPKN2nvE6WkKV6ncZwKH0ihHFVXsACHAsqh4qKvlumGK7/CADGi7m5yZt4Jz+PxHNFtUzSxVwILKXDKveSCXTZy9puI+tHQPA5gabcaJrlTwCmbSFBN8x2CLZ3qrDyZ6DgG3RZNDSUck8VkXFN61PwviNBf+x6X3C3YUYm2IIaMc7CQnYf1pXH1Z2PXZXny/MObDWxbphzgUyLj3iADNxTa1zx7SAkCbMuzlm1Kmay5xDWx8YkXZPcqqkWtk1ZzJbH0dU82GigbxFZ5nbi4fN7uU74HGl1jsIkFNy48RU/1f0mD6nJKKm9OexfL0aVjINIsn+5FDPx5ja2/vOly30xDyxIh27RvptTZz5Rw6d51mZ+Tx8Te8R4koKGOsg7+MvVCYD1Zq4CdqPhJyt+o4dlJdyERfQSxHdsfhbc1gU5QtWO5kV850eeuT3Yhls5WfWQQNP9T3SiJGuljCwSbhj0Q/dOyBiS2kikCgfgeEtHJUel3lTddtidJrOUSBFahIfyDV2j6MjWlVKXeV3RI2VJxJcuDRuJdtXxXdt3OCa+L0YVZCtBndGXngAZeBPPiE4+sfk6pK80Shc7K8lBE/oSapD6odtXCYBUwWBsEK1/8wkXBlzaq9bu5dcrK+/ZZD2XToJpQcY2h8fpo3oW4vcXBXetMAfqn69SCXbDJF3hDAZGhg5TMPEA5U7xwM7gLhZLDA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(136003)(39860400002)(396003)(366004)(31696002)(31686004)(26005)(66946007)(478600001)(186003)(83380400001)(16526019)(66556008)(66476007)(5660300002)(8936002)(4326008)(54906003)(16576012)(6486002)(2616005)(8676002)(36756003)(2906002)(6916009)(38100700002)(316002)(53546011)(86362001)(956004)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3l6U3VnYUVFVU9BMVU2Q2w3U0lQZnVEa3EzbTg5dU9XOEdpU0RObG1iS3hV?=
 =?utf-8?B?cVFiR0RlbzNyN05OMkY0a1kzcnBGTDJhTHN1c1RFQ3Q0T0R6a3MyU0JHVkNH?=
 =?utf-8?B?VEFCYzdTbmtxeUZCNTNVbDE5eUY4YnhvYTVTSGR0dmFha1BqM2R1dVNGR3pE?=
 =?utf-8?B?S013SUg3a3owNy9WOEtnY3BuTGY5bXF3dTd6TmdLNlErTHpzVEsyOHYyVkFC?=
 =?utf-8?B?WVZyeDBkWnpJNlZoOHoyeHdOaDNSQnEyVXBvT0ZPSHVnWm5wYi9Zek90VSt0?=
 =?utf-8?B?c1ZpK01DZHIzZGR3eEoyNE9EekpCZHROWERUWU5DWVJtb3FveHpkMUcrdUxP?=
 =?utf-8?B?MzkyakZOVnFwUFhKdHBWS1ZEY09RdjhrdU1TaHN6T20rVHZpRHFWaUlpWFhP?=
 =?utf-8?B?dWNzeUJrNFBDaWxWSDNjcnh1V3BYUTFZZEVBUjNWSzNsaGlYT0srb05WMWc3?=
 =?utf-8?B?MjEzYUF1M0FLZldhZ3FreGZqRFJ4RWtZQ3VFdjR0OUg2RFFQeWMxRnJFNmNq?=
 =?utf-8?B?T1NOUWlhdURhSEJ1MWtJRVJCTG16RWlwbG9GZUJLQlpjT1MyaHU2bldaeFdK?=
 =?utf-8?B?OTIrOVE1Z0J6eU9lMTNoaklyd0orYzh6ZE51cUkrME5nZk9TcVVzTFNCUkQv?=
 =?utf-8?B?aGtVeGZGNG1zZWQ4N3pvRGRCbmFYT2tYb3prZU9QZlNub2l6RnVUME9VOGtw?=
 =?utf-8?B?ZjE0VlF4Qmx1VElVdlFmNnRHWitNcTNTaTZaRlYzN1JFZ21xcUIrd3dmRVhP?=
 =?utf-8?B?ZlZxZ0dVNVlMRHY2MVRDd3grbEh2ajVrcWlSdW91alQyN0d4WWlzUDZwOG8z?=
 =?utf-8?B?Zjl1aHZ2SEdQTTNRdDJUVnhKa0NpanBKejU3dzExZHUraUM2N2I4bFJkd0Nh?=
 =?utf-8?B?Nm1jSWx3cWI0c0dveCs0NTNVUktrM1JkN2FZUnZCQU9nZDlNUCtnU1h0cHF4?=
 =?utf-8?B?V3RweHRxVHdvRkt0Q2pSanZzVkdhdmoyL3dnbHNQZEE4ZWg3WFJWQVM3dTBa?=
 =?utf-8?B?K2JYenh6TUh4WTFXektlOHVPMWltVlRYQ1lmNGFXRy8rUDFWVURvejljUHhF?=
 =?utf-8?B?dnZhQjdEdXhadU9rdFJ1QTErcEdTOS9SVjUrMUJrNkxYZkUrZW5IYVBkdG0y?=
 =?utf-8?B?Wjd1WS8wVkNZSEhDWXZVNDRvWFhqVXoyU28zVlpVQUdzQ1Z4Sm96MmthNStD?=
 =?utf-8?B?MkRYT3ZwYnFCMnBPcEN3SDlaVGRrMllxRXlnZXhCWUppNGJiMVQvTXJ1Y09J?=
 =?utf-8?B?ZnpkVEw2SDczUk04K2dZNDdCb1hsZ1lOM09lUXhFdDRrbk02bDlsU2NNQWIz?=
 =?utf-8?B?eHNlQTA4dGswdy9vZ2grNnU4NDNRWlQ2WU9rY2k2L2dCdTlJZkV1elBXeDRW?=
 =?utf-8?B?ZkZjWFJmdDZGUmhqdUNqNDhGVmtsaWlpaDhua1lkVC9sWWFLSHNkbERkb2xD?=
 =?utf-8?B?V2JENW44eG1aLzkxYXlJMkFvNUJlblBxSGpPYm9jdDBzdWhucFJ5Uk5IWlRw?=
 =?utf-8?B?U3pNZCtjV29DcEYwa3pxc09Zd1V6QU5WTThBdDBZdGh6SktQT0ZHdUNGUWxT?=
 =?utf-8?B?N3ZoZzFyNUxFSnZZOHEreTRsdzR4cnFtS203ajFMRmhLcUkrZTRERmZtVFRH?=
 =?utf-8?B?NHcrUkJMeWJpdUpxVDZKRi9UL0kvOGY1M2RKTFhDVy9teXpEMDNCRFMzd3pj?=
 =?utf-8?B?UmlqemZDMmUzUHd0THNidmxtZk1Vd0VrNVBUOWlOSzJidHlHWVNEdSs0c2lm?=
 =?utf-8?Q?FIbHTDaDMqe8vpRCDUi8tHw0jHq/6OeuusIT8W0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfef8889-7706-4740-e154-08d92f1b8ea5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 10:02:45.5293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PsPdiE2TQDgCfXCtRX1NwqS9akMjxqD57mDTvesF5v01dDlboPmwvlCwuuO39+bXOc0sXUJuhad3/HnxVh3aLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6382

On 14.06.2021 11:41, Julien Grall wrote:
> On 11/06/2021 11:39, Jan Beulich wrote:
>> This confuses disassemblers, at the very least. Move
>> .altinstr_replacement to .init.text,
> 
> The alternative code was borrowed from Linux. The code has now changed 
> to cater very large kernel. They used to keep the .altinstr_replacement 
> and altinstructions close to each other (albeit they were both in 
> .init.text).
> 
> I am not entirely why, but I am a bit worry to separate them. What sort 
> of test did you do?

Well, just build tests, on the assumption that relocation overflows
would be reported by the linker if the sections ended up too far
apart.

>> dropping the redundant ALIGN().
>>
>> Also, to have .altinstr_replacement have consistent attributes in the
>> object files, add "x" to the one instance where it was missing. >
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I'm uncertain whether having .altinstr_replacement inside or outside the
>> [_sinittext,_einittext) region is better; I simply followed what we have
>> on the x86 side right now.
> 
> This means the altinstructions will be marked executable in the 
> page-table. They technically should not be executable, so I would move 
> them outside _einittext and make sure the section is aligned to a PAGE_SIZE.

Hmm, are you saying you bother getting attributes right for .init.*
in the page tables? I ask because we don't on x86, and because it
would seem wasteful to me to pad to PAGE_SIZE just for this. But
you're the maintainer, i.e. I'm merely double checking ...

Jan


