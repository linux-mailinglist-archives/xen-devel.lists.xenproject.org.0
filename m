Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B414B6CA0
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 13:49:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273130.468203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJxGp-0006ni-T4; Tue, 15 Feb 2022 12:49:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273130.468203; Tue, 15 Feb 2022 12:49:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJxGp-0006kr-NS; Tue, 15 Feb 2022 12:49:27 +0000
Received: by outflank-mailman (input) for mailman id 273130;
 Tue, 15 Feb 2022 12:49:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=p95L=S6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJxGn-0006gH-Pa
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 12:49:25 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b402a812-8e5d-11ec-8eb8-a37418f5ba1a;
 Tue, 15 Feb 2022 13:49:24 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2055.outbound.protection.outlook.com [104.47.4.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-n1EzV4T3OBmOPGZu6QCiog-1; Tue, 15 Feb 2022 13:49:23 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM8PR04MB7475.eurprd04.prod.outlook.com (2603:10a6:20b:1d4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Tue, 15 Feb
 2022 12:49:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Tue, 15 Feb 2022
 12:49:22 +0000
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
X-Inumbo-ID: b402a812-8e5d-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644929364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ks5G3+K9agsJFJ8Q5UpQ/uwTa+dFY0jG4w2XFjRM/Ng=;
	b=UeuwINtENgZdmnR+VEhi37oEkDL5NaLLJG9XC+f8zX58TB/5/0EvMy+7hM3lKgzB1HCIYl
	H8YAKpD3oVGN//EHAsmEftaSzwwWD7yrYLoaefgWhSX00Jmwa+3YCXmt0LQiMazWe1b/aK
	lSTEmlZgNXsJslSlHdAaIY/TErJ8M+A=
X-MC-Unique: n1EzV4T3OBmOPGZu6QCiog-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LwhzS2HsKDHOTwaBU2fyNTd//PrJfJfLmOGkGYzjgnj66CBS/SXHf1WGfkODvcA57xqBeQODjwxYHcQepDvPHV8a/LxBng1Y14T/ECeyBtr4G+i1I7LDdvFW2hKjaPdrG3idkO4DWPYPq9cb3SlqsT6lC6SCqDCbRM1CzB4qmlRvzVdz7B4VLRsMhxVAgqHwUeILhJpb/sRJGnEZQBQReT5v2UbMvsfn2rvp6wcTdeP7CgHXoVjoE5RyCNSgcWnIphJLE/Joz1JN7rVu0Nx6znEVcNQR12so0Fop7/C2Z+xbjoEv5xjOSiddEJRU5bLHM6skHAlEj1qmKRgSwFkgzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ks5G3+K9agsJFJ8Q5UpQ/uwTa+dFY0jG4w2XFjRM/Ng=;
 b=UYVI4G/H+BNT29Q5cknS8TRihhEmhUgwmd+wks7Z2ntBbefLyFD8QYwPtbHNcHkvh7+Es0vV4KUY5D7t6RMeF02DgsiP23bfc7gg24o6T+ajQrk0/bgC3XpXePrswjYfxsN5Q8GGRTlJ6zHEthKkfNLskBmDNLhX7Ln8ud7Oq3IDxa0LPBw7DH9OP9nkRGW3shBztBHfSzDcgHUsyXC6vOPCMADC7HlESxB7b4cmucU2f/wjszRX+lQ3WcJI00QRRHvukC2wyrbEj/2eY54XuviUyDKey4ueCz6vtICpyShO5j4nipsNRBHZb5iYc3C1fmHGEahdaO+4/pTgQ/kWDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <34832b7b-c1c0-06e9-9214-6c434cfb1282@suse.com>
Date: Tue, 15 Feb 2022 13:49:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2] vpci: introduce per-domain lock to protect vpci
 structure
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20220215081135.1497470-1-andr2000@gmail.com>
 <YguE7RWOteSnvVNY@Air-de-Roger>
 <c5b9b02c-93f8-d018-6048-9abf2e7de4dc@epam.com>
 <YguQ8wfhfYFXTWSU@Air-de-Roger>
 <70dbd7fd-3f74-d0d3-6e30-c1e1e24fc279@epam.com>
 <0d8f01b2-b015-a08e-dd49-e9c688ff7245@suse.com>
 <bbb36ebc-de66-297d-f82f-abc0e63f20a2@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <bbb36ebc-de66-297d-f82f-abc0e63f20a2@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0040.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b5e5def-d5ba-4b10-ca1e-08d9f081969a
X-MS-TrafficTypeDiagnostic: AM8PR04MB7475:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB7475AB007FEF2724100DCD12B3349@AM8PR04MB7475.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KMPFsZ3ED89ARuP/FmMGR8/s0qmfZWldVJBoVIIfAwyGCFSfaqRh4+vcm8oMmrAU8luXC/+60TucLlE9FPgYX/TQ3HikPF3V14VSHo3EuS4nXVgRbqJGBF847HFhIZ+ZOVL3196G9805H262Zel7b6+JyP7ry6g8lWUETLvxUVCMbwexYUvLYBtNp+C0DjVff43B0TwM765zCQaTB9nnP2AoDKxV5o3nn9Eq+DMUgkGTgGpku5bSoywcqPe8pvaSk6fiH2bLqKFZBMPOdEZZM1fNor91uQ+LnU7ztblBzqbYxnoKWm82CgjKxe+yxaoo9TinJhnwo0P7kUER2PrNdaUaQHghVy4fmrR6fjlgFLIPYswC3/YI7UUEYc2Dv5CY/4ydwmBdLMHqx+9/RfBX/Ax7ZgfV8bHHmYYUkQiHckRTC3Flp0blJTUiQ6jRVVVXSfcdMX1t5b5GkR/uSFTg0dcPS3n4S/MZlFpAgZQ68xZr5WiU2RVCQLJa2s6PdN2mqK4LmIKycv5+L20GA823XpC945Zq73mAu3INiNBf19ir4SznrKmtdjsBXvm72p14hT8aR+K7FsBW6YU07bK8CL1/Zgtz7AUPMUzL1wLgRzZzAQbB1nXhedM51oaXbH1vymOX/D2Tx53Dot3Bx8pP/WPYwK3wyyZ8NYS7h6wCpOjTqss4li9CGts0WM0Ro/qmLfZgBsr9xbKviSMmVL+GHIbLbB0L7lw1G9BlnSU7mtI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31686004)(8676002)(4326008)(6506007)(4744005)(7416002)(26005)(8936002)(36756003)(186003)(53546011)(6666004)(6512007)(2616005)(86362001)(6486002)(83380400001)(38100700002)(316002)(2906002)(6916009)(66946007)(66476007)(66556008)(31696002)(508600001)(5660300002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGlZcUNUS2dCTjAxeTZVTUhWM3hPOE5vdVI5dnFVVWUwYWVLakg3YVA1dEpL?=
 =?utf-8?B?OWJVRS9tVkY3Tnd5ZzZuZnJPUjJ3NXN1WnFSVGlHY0psOC8zOHpGTW42UW1x?=
 =?utf-8?B?b1I4TFBxOTNISDhnMlh0eHJJQVBSSUpUL0luWUg4M0U4VytLSUFsOFBiQlVJ?=
 =?utf-8?B?dExSNHBZcjY5d2VhRHk4SmhQNUxDcnRTemJIZC8vMG1GSDhEdFB2b1VBTWo5?=
 =?utf-8?B?cnQzbTJOMmFSK1hKRVNOSGFnQVRpdTRvaTlmZUJxSEt2TUptNUVMd1VDQ0tP?=
 =?utf-8?B?b3NKVllnL0FMNmZBUlozR1kzMzZGVDJnbkpmSjVKVmZ6a0ZIR3l4WWVFc3Rx?=
 =?utf-8?B?TTdQbzlDV3ZhTXM1OHA4eGFUa1pCL01iTzd1b2xTa1VKVDJuZktaSGNvT0E0?=
 =?utf-8?B?VVA0NUZjYTBGeHRjM3lHZXNtNll3c0JzNW0yamppakNlZnRWa0VVT1JYa0JZ?=
 =?utf-8?B?UnZ3aU41VXMwcU96Zk9xdVQ5Sk91b1R1UHVLVFFvWHVZQkxzNVErTmxkNkFq?=
 =?utf-8?B?cnZhZ0JMdTZ5MCtGenJEZU95NkJoTC83dTBhS3l6Q3AyVUJxdHZ0bGFBblJ5?=
 =?utf-8?B?ZkdOcjdnWWRybFdERUJZcU9UY1ZUQmxXU3NsSDRHRytYNUZlK2NHQy8xeExu?=
 =?utf-8?B?RzFYTXREczIwcjkxdlBvZ1hESEREakdFdzdKUzRUZ0J4MVJGT2p3cXp2NzBD?=
 =?utf-8?B?UUpNY2ptTnhrUHlubEpueTQ5ZWVoTmxtYTB2SVNTTnNjbGhsSndYNWVLU2JB?=
 =?utf-8?B?V0N0SjFGOXpodGhJMEhnNkJRWGxMMEtSWkgwc0h5Rjhxc1ZoVkUxenpWdDRY?=
 =?utf-8?B?RW9VV3BvUGd1Wnl5RTU3Vkh4RFhmVnFsaU1VVFpvR1VzWnprL2RSamRlQTQ4?=
 =?utf-8?B?dXFNZWFvM1owdGc0REpqUHlZY01ocGhPSXVEbTZwKzdNd2o5SEZFckFWWlhW?=
 =?utf-8?B?Qm5kT1JETXBOL29XVkZFMkJjOURtOW5Dd2ROYWFkWk43anhYWTQ4S1Jnd3ps?=
 =?utf-8?B?eGFWdDZMVkpaMDREaW1zVGRVYVlta0U5eWFQbzFzZytvM3orajlZS3FQZTR4?=
 =?utf-8?B?RkNLdmx1UjNhR01NWm5QWVhYa2JYZU4yTlZwSFJYRThSQmlKaFprby9jZTE1?=
 =?utf-8?B?QXg5bXVCMnRRcXBoeGJPOFZwcVNQZEJsSEZWZWFqa3ZXaVBOVTJTYzVCekZC?=
 =?utf-8?B?S294ZVlzekZCNzBlRmhuUEx5Wmlsb3YySWtKbk1wbjF3bzlZeDlGTG9DTjNV?=
 =?utf-8?B?M2o5YXpiNjk5WksvNUtWYXl1ZldZUGZrdjc3ZGx4K093T0lXVkhrcTNPR0hl?=
 =?utf-8?B?M3FWdjJzWlhDbnBkMkdTS1JyK2Zsc0hXeG1mU1IrYXUvSVFTblZRVndGUEdK?=
 =?utf-8?B?aTk0S205Sk1JT2JRZk9kVmZEQ0h4Z0l4eFV3THk5QUtNNjF0YzNzaUo3Y251?=
 =?utf-8?B?Y3NlMTZkeEFhVUhNRE0wN3gyYXI0NW4wc2NZZ2xid0c3MThuT3R5WC9nVU96?=
 =?utf-8?B?ZFRtcitoYUdFSXlJMFJIMUhJcy82RE9heFNpZTZrNDg5SUpEYXYvcjBIWlN5?=
 =?utf-8?B?NHJPd3E5ZnpVb05HbmRzR1FwZXdza2xiS0hhRTFiYkRFY0xvcitDeitSNDU4?=
 =?utf-8?B?OW1Cem5maGVOQ0NSeld5TkZVL1JHRU42UEp6QlI4SjAvWjRPQUlwYzk4QXFn?=
 =?utf-8?B?Y21KTVlZM2ZFdi9vSXZzMlJFbWszQTFQd0RVT1pCTDBqN21RVi9oMmJHSDBV?=
 =?utf-8?B?TVdSd3JCUUdFRDFYSFo5OUpwQ1IzNG0xV0ZIQjF6c2FFbFFuSWtNUXk5aDh1?=
 =?utf-8?B?Qjg3SGFOT1hHVDRpQVlJU3psS29UR25vZmRFb3dOTkxsOE0yciswb2VUZFAv?=
 =?utf-8?B?blYveUloeHZ3aEFWMGRSeWZuSWZVS0wzYXE3WXdTNGpaTjRpdmxFU0NLUm5z?=
 =?utf-8?B?bHNIbklwOXZiWDN6OEZVRmN4RkNMNXhCYTllUS9SVEswcllZNmFFR0twMUlC?=
 =?utf-8?B?SHJiUkJ2NHpZRVZRTzhwdy9vcHNpcVd2dG5ZdGgvWS95a0UrYUdnNjJ5VStS?=
 =?utf-8?B?Zi8vdVJyd0hOeGRmalFhV2VFVEg1YVFTQXptU1d2T3F3NmhCbjBKMk0vZzQw?=
 =?utf-8?B?Z3A2ckl4RnZ3YjRVdGc0ZFRQd0Qzc2VwdTF6VG9Fa3V3MElBbDNDQndUTUlY?=
 =?utf-8?Q?jeLImo4P6+e5t1xDIiH4QDs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b5e5def-d5ba-4b10-ca1e-08d9f081969a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 12:49:22.0153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UPq2xNMIuuhrVHNxgfoz1oFri8bO9pXZGODdze0ptp+jGkcRAZVSAlNb2Dgg9omzhM1o24rgHgebgk7gC11vWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7475

On 15.02.2022 12:54, Oleksandr Andrushchenko wrote:
> On 15.02.22 13:50, Jan Beulich wrote:
>> On 15.02.2022 12:45, Oleksandr Andrushchenko wrote:
>>> I'm on your side, I just want to hear that we all agree pcidevs
>>> needs to be converted into rwlock according with the plan you
>>> suggested and at least now it seems to be an acceptable solution.
>> I'd like to express worries though about the conversion of this
>> recursive lock into an r/w one.
> Could you please elaborate more on this?

Not sure what to say beyond the obvious: At the time of the conversion,
there certainly was an issue to be solved. You'd need to solve this
issue differently then. Plus you'd need to make sure that no further
incarnations of the original issue had been there or have been added in
the meantime.

Jan


