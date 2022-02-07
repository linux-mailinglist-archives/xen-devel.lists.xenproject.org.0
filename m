Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C06F84ABEAB
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 13:55:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266877.460591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH3Xt-0005MJ-Ph; Mon, 07 Feb 2022 12:55:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266877.460591; Mon, 07 Feb 2022 12:55:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH3Xt-0005JX-ML; Mon, 07 Feb 2022 12:55:05 +0000
Received: by outflank-mailman (input) for mailman id 266877;
 Mon, 07 Feb 2022 12:55:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nH3Xs-0005JR-5r
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 12:55:04 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a160cef-8815-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 13:55:02 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-8tWZRZ5qO0eAsylcQB6IDA-1; Mon, 07 Feb 2022 13:55:00 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR0401MB2363.eurprd04.prod.outlook.com (2603:10a6:3:25::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Mon, 7 Feb
 2022 12:54:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 12:54:58 +0000
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
X-Inumbo-ID: 2a160cef-8815-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644238502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=979PX1I0R6Ko1kf1qG7DviEMdxQrwOkr/l8gOMvtMDM=;
	b=cbN1U5ZjDw5Btam/TwRXsz1eoFj3hiXD/UI/R6pw//RFGC+S3DLXmfBXlSwG1ztJScCEKV
	I6UjH+UuxLpnlh/aZT1zrPu690eCjzuMtNj/QvMRml1YTIylBH9zNcDI16mirbLZ0j6NXM
	rKM9O8DVmAo43z4KwyHV5JnNvNYvuHE=
X-MC-Unique: 8tWZRZ5qO0eAsylcQB6IDA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hslUalNb2kcAqUMPWfxGrPGZdUSQIBm3p+zc95I2ymD8Ir65mgUE+t1VXpsFGNVljnbNB0fR0hTs6bXXfxlk2ee/stxxv55lrCIBZMmMPzTtf9V02GxSJH5RpTbGqtUiZebxoXWksQHVP79aHuGPE2aHoHBAAC08U2HZjTa3d4BOj2pvIpWLb2RuW/tVcrT7a1bqJFQigfjXBbDDIBJcwbgxAkSP3yaBArwmP8PKT3ZtzCwBYrytkil43oEswTQdU/UlvL2XlQLZLzrAC2jzXd8Gws6CWDeD6pPKdKJDFEziOVm3HD28y5b0jL1f7efwX8MuhDOZGlqdc2GhS59i2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=979PX1I0R6Ko1kf1qG7DviEMdxQrwOkr/l8gOMvtMDM=;
 b=CnXlt9lX/N9g8Nz9rKSG+COhZcEWFLoiq7BpccTylXMitAjVUeF4YxiSBYlW6Blii4dhfp236SqTSdtZpBKEWeNruPojORDQTEyjZoGFvfaS4ZBDwcuUxd4TjtB1W9AFnJxtKLzJSqvKO2gEEka62zXo8Pg6Gcj36PbTPweblQReq3Rz/PYUYkDULU3tT9P1kNqA+IG6z6CHKDbC6deUHPmbtaXhiXPHbi58gqXap7alnr7YB/ws88SwzdmLQrNNdEUW8aQOT30PKddRk2+ocOC0nRYkt+Vl9NyXPG61XFtoEzEXf0PAIaGTuy5Z+SUA+Izwt1kwQEoU6ShhLYvY3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dbef1c95-818c-427c-1963-75d584843cff@suse.com>
Date: Mon, 7 Feb 2022 13:54:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 10/13] vpci/header: reset the command register when
 adding devices
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-11-andr2000@gmail.com>
 <96381d7e-dafc-acee-3abf-f9815deb207c@suse.com>
 <ef76faac-f9d3-1cb8-06b5-189ccd299542@epam.com>
 <6f0a015b-c48f-76ed-9a51-39c045ff5927@suse.com>
 <2ad372d4-a181-9307-ef50-a5adb61dae66@epam.com>
 <49380584-0577-96f2-ef1c-a96eabf0d227@suse.com>
 <fbd410d1-84ad-2309-ca05-b9ac7f95f1f9@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <fbd410d1-84ad-2309-ca05-b9ac7f95f1f9@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0601CA0071.eurprd06.prod.outlook.com
 (2603:10a6:206::36) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9157604-b695-462b-0221-08d9ea390bcd
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2363:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0401MB2363122E1A0F5DF3828DE847B32C9@HE1PR0401MB2363.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	f9vPjsAyzKiHdaae/OsT0ZSfNxhTGoocfxcLLkVADaqVsGAfLuxYk8ZW3RSOx1ISvZRkORJgd93VUSTOpb3m5DryCBRU5dNgM6gtQNXrtv3OhqcjwgtGxx7kdUwyAwJWiAoUdLxZOMEGtquyfcKoHBBsJ/HvfYFG/WQD+a+eQbe/+1GtecQ1WtK7WsRcYmaBVMYy7vuD8r7K7WKCuRb8C2i4M8ahicv86skeqowiA+SdBImNyWL4jfFnAfRhrCt3we7tS5eU4W9siOzinYAExyoixzAgZCgPkZFG8bUmfBQCQ/RqlsSsqLAL+H3PfdgcpUMa6bX/SyHpPEtd5KDRF8EhbwUXDH2ODpSbKSrZvsfaUcm4GNU8UGPpItp7lxcluZ58afv/K8Uj/Jejxe7dype1M77niJKmt0VVzpqjExuZvUxbaWjJEQc1wx4Lc7mYtqRgOUDLrycwXkQrtgvGvsXwpfyUd1i/7ZkV/Bsrroo6F6mP0/iWRQI9d8vinYOCPD08ni7Wyu1//tLCAIZlLO7cSjU19KbK6rB185riM6b3vT29Rwa/lBXTYiaAMlr6jUS0rgExcCnph8vTY/9/gE9TACelJS/aBu607Z+a/FRqGAQgTfe93+cwnyJFvUWSg9XQGGThHMvSrGRYWZUh3i5apsQUiPxiA8MYal2kDv5blF4TamYE7KL5ExT31AcDa7ugYkRbkFNRnf3zC5f1B67Uf8jbaI2gTd5ZVwARMFo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(31686004)(186003)(86362001)(2906002)(5660300002)(7416002)(6512007)(66946007)(6506007)(6666004)(83380400001)(2616005)(53546011)(8676002)(8936002)(66476007)(66556008)(31696002)(4326008)(54906003)(36756003)(316002)(6916009)(508600001)(38100700002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmVOWEV4elpoV1dKaHUyN2gwL3FrTzFpTjdacngralF2ZGpqY09GQnNvd1J4?=
 =?utf-8?B?eXVSK2g5d3hkc0J5VHhUZkllZzZLdlFyblpsc0FkNlo3SC96cGRmbVNBSEdK?=
 =?utf-8?B?dDFsbmt4d3ZHWFNwNytCZytiTzMzSVdnN09BMnRzSm1qSnpNTzYySU03UmNT?=
 =?utf-8?B?bmZQazJtQzcrMTZnNFo1K2R3ekdFZ2tyWDYwbGpoTk9Sc2toU3M5Y1F4dkNC?=
 =?utf-8?B?blJKL2RmWnE4bHNnbWp0RkYyRkFXNjM4Z2k2aGNKWUF0MStOVmJxZ3V3R09H?=
 =?utf-8?B?R1B3aVhIcVF6NGJpUEZxZlhUcjFtL0hoQ0lUazdLS21sU1J6V05UZ2lnWkxL?=
 =?utf-8?B?amNJZHdlang3K1ZrbU54Y1hGWEpHaGZFejFTRityWVR2RzVvT1FOOFVNMXVk?=
 =?utf-8?B?VCtSZyt5ZnliS2p4VStZaWdxSTNjV0tLVi8xenJwcUxpOGVpbE9OZU9UZ3RC?=
 =?utf-8?B?WGQyNUNKVVB4OGt3U0t0amhacHJYOFB0T0tyWFNXQ0xtclU5R29xN0JXR1Jl?=
 =?utf-8?B?a2hKKy9xS2p4TVVablMyT09PWVlUMzJDaEVXMFNxR21yeExlMDB1R04wUjV6?=
 =?utf-8?B?SGxSS2MzRlVkaXkxKzQzeWdpenc0VXpBRk8vczhkNTNMUGJ0Y0hodjRndE9K?=
 =?utf-8?B?bGczYkhoWkpHc251aktudm1TcnFBcXR2R1dJSXg4aEJaNVkrSDJpVjRiamQ0?=
 =?utf-8?B?RWxqeE0xZy93Q0pKaXMzSmRET3VLQVZIYjlqOE5rU2VrNlVqdWhIOVBuOHFJ?=
 =?utf-8?B?M0I3SSt4R3pIVERDekNwVWozTEJrcWkxMzFFRGFWTVBQR2NZbEZhc0NNWWcx?=
 =?utf-8?B?Ni9TQXMycnJ6M3p0UlF2OUNTRE45bFJtT09VSVJheDVpakpySTBnZE9zc05z?=
 =?utf-8?B?UTd4SzdCOGxCUE5ZQWFXOWE2ZFZqNmZWN1F0dTlBQXVvVS82OHdWenA1c3J4?=
 =?utf-8?B?UWV0ZFF5ZHYxRldRdEdDYzFKVFp4b0p4TnFwbFFPUGRJYkZUNDJ4N0RwOTVr?=
 =?utf-8?B?dnlWR2FFdHlxeFFVdGZ6andiK3A4WThaWmhJYlBuVUQxOVNqNXR1UDM5QVNY?=
 =?utf-8?B?dlgrN2RaOEhwT1h4RlhuOWVjSDBJQUpjT2ZkMU5IeDY2djhVN1NJQnZtVTRU?=
 =?utf-8?B?eWRGVlR5c3Y2bzZ3dElqNVl0RXFCTnhRNnNRaUF0dDNxdmRLcmpWbTJnZnRN?=
 =?utf-8?B?bTBQNHNOUE9kMjRxZlU1UzBUOGRSak1EUDdJVmh1RXNGd2V1c3h2Vm5sMTE4?=
 =?utf-8?B?bUtKL0RHRWlwRmVGdFhoWkthNUE1aWxCcy94K3BCTTgwMlpXdTFtTVRxUUd6?=
 =?utf-8?B?b2FHcENncktFYXMxOWZTVUp3aSt3V1pjNkdXMFVIQjB6dDZSUGk2d1hxZEFu?=
 =?utf-8?B?STlWK3QrU0hwUmI0MEc4RFBBQXQwaTFod1RJa0pqdGY4RHB5anc3Q2RYSXVM?=
 =?utf-8?B?b21VdTJhdVphNi9Na2VnTEJudjRIZWROOExEZE1FbnpNcUJUbUZvUVhnY3Rl?=
 =?utf-8?B?VlBrMS9zY1hBcDVTT1dQTkdMeW54ZWQ0MmVBem51UW4ydTFSeldnVGN6aEZV?=
 =?utf-8?B?alkrMHhVQ3IxS0VtSmNlK05CaXNlcURRM2hDUWppd0hod0J0YWNtdS9USFgr?=
 =?utf-8?B?VHB5dUQvbDBsMWxvYlh4cENGcklscGhiWFNPYkxCNmsrVjFOUjE4VHVPVHNS?=
 =?utf-8?B?MElpYjJDL1V2M3Q2eDhRMk03NEs2aSswdkZUS1RoLzQzOWhCV2hxYlpMemJ4?=
 =?utf-8?B?SmJXODViTzdYT2xTR0MxMFMzWWVHSWVVWWx5Wkp0NjFXNVZEb0ZHTWJHV2Vs?=
 =?utf-8?B?aE5TUnI0R2I0VlNOSERpT2NFT0ZEOFRaeU13d3NxaThSTmloakxhQmR4aEhN?=
 =?utf-8?B?L0JNd1NLY3pFUEE1TXo0Uks5S2E4a1llS0ZwZm1EajUrTWlqNnhwYkJLa1ZF?=
 =?utf-8?B?YWNkQ1ZyeU5RWGxLM1kvcmJoQmlDd3UwekN1OFFmNU5oRzYzd3dnQ3pteTh0?=
 =?utf-8?B?R3FaR3pmWXM5SXR4N3paTUtJSkY5eDVuQTlRY21PMEJ2SkZQUk1UOWtTSkZK?=
 =?utf-8?B?VXhVR0dGWFpYajlDZ2JVdnJVQXdEK1hZYlBVR01rcUNwU1M5MTZZVzRWc3Jn?=
 =?utf-8?B?Tk9kR2plOU5LcGI5SFYzcnBZZTRUQU1NZzVUTWQrRU5UcFJ5OUVLTkdRUndr?=
 =?utf-8?Q?KfIB0mt0DyTxSyG2q2t24rU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9157604-b695-462b-0221-08d9ea390bcd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 12:54:58.3218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gCygJDhQmq5Jd6j58QD16vNENNR4kZDdCjsR3gQmoAFff0csuGcUhkCOef17cLNu/wiERMow/QN8o2nztV7R1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2363

On 07.02.2022 13:51, Oleksandr Andrushchenko wrote:
> 
> 
> On 07.02.22 14:38, Jan Beulich wrote:
>> On 07.02.2022 12:27, Oleksandr Andrushchenko wrote:
>>>
>>> On 07.02.22 09:29, Jan Beulich wrote:
>>>> On 04.02.2022 15:37, Oleksandr Andrushchenko wrote:
>>>>> On 04.02.22 16:30, Jan Beulich wrote:
>>>>>> On 04.02.2022 07:34, Oleksandr Andrushchenko wrote:
>>>>>>> Reset the command register when assigning a PCI device to a guest:
>>>>>>> according to the PCI spec the PCI_COMMAND register is typically all 0's
>>>>>>> after reset.
>>>>>> It's not entirely clear to me whether setting the hardware register to
>>>>>> zero is okay. What wants to be zero is the value the guest observes
>>>>>> initially.
>>>>> "the PCI spec says the PCI_COMMAND register is typically all 0's after reset."
>>>>> Why wouldn't it be ok? What is the exact concern here?
>>>> The concern is - as voiced is similar ways before, perhaps in other
>>>> contexts - that you need to consider bit-by-bit whether overwriting
>>>> with 0 what is currently there is okay. Xen and/or Dom0 may have put
>>>> values there which they expect to remain unaltered. I guess
>>>> PCI_COMMAND_SERR is a good example: While the guest's view of this
>>>> will want to be zero initially, the host having set it to 1 may not
>>>> easily be overwritten with 0, or else you'd effectively imply giving
>>>> the guest control of the bit.
>>> We have already discussed in great detail PCI_COMMAND emulation [1].
>>> At the end you wrote [1]:
>>> "Well, in order for the whole thing to be security supported it needs to
>>> be explained for every bit why it is safe to allow the guest to drive it.
>>> Until you mean vPCI to reach that state, leaving TODO notes in the code
>>> for anything not investigated may indeed be good enough.
>>>
>>> Jan"
>>>
>>> So, this is why I left a TODO in the PCI_COMMAND emulation for now and only
>>> care about INTx which is honored with the code in this patch.
>> Right. The issue I see is that the description does not have any
>> mention of this, but instead talks about simply writing zero.
> How do you want that mentioned? Extended commit message or
> just a link to the thread [1]?

What I'd like you to describe is what the change does without
fundamentally implying it'll end up being zero which gets written
to the register. Stating as a conclusion that for the time being
this means writing zero is certainly fine (and likely helpful if
made explicit).

> With the above done, do you think that writing 0's is an acceptable
> approach as of now?

Well, yes, provided we have a sufficiently similar understanding
of what "acceptable" here means.

Jan


