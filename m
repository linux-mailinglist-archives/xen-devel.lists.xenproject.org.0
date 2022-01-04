Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A696E484293
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jan 2022 14:36:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253259.434331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4jyz-0008In-0M; Tue, 04 Jan 2022 13:36:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253259.434331; Tue, 04 Jan 2022 13:36:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4jyy-0008Fr-Sk; Tue, 04 Jan 2022 13:36:08 +0000
Received: by outflank-mailman (input) for mailman id 253259;
 Tue, 04 Jan 2022 13:36:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+k5u=RU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n4jyx-0008Fl-BY
 for xen-devel@lists.xenproject.org; Tue, 04 Jan 2022 13:36:07 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 414cc93e-6d63-11ec-9ce5-af14b9085ebd;
 Tue, 04 Jan 2022 14:36:00 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2050.outbound.protection.outlook.com [104.47.0.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-2pbi_h5VP2aqkNJ7pEI8kw-2; Tue, 04 Jan 2022 14:35:59 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3936.eurprd04.prod.outlook.com (2603:10a6:803:23::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.16; Tue, 4 Jan
 2022 13:35:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 13:35:57 +0000
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
X-Inumbo-ID: 414cc93e-6d63-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641303360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3EG6iLztMzCQAvn75LltMc4vHGKHiooMr3SJUqaNMj0=;
	b=Bi60tSsUseo5JomS3s0pUU1Ns5XWJtwlhI4HP2PecURfSF0Z2Yjq058UhPFrepdWobqfvW
	P9vHuqQjZJ8h+s9akJZcpzQ3Ca+MEY3VdmMdFtUKEtFas0HgzgJ0X9n4xoNb7GHeseQd6k
	6EWtAmXkzAsO4+xxWokPQzzwNeYs99I=
X-MC-Unique: 2pbi_h5VP2aqkNJ7pEI8kw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pq9N9RpdBsp6UTKh+5C/063W+uVRy9B9gjtDkDQ2QRjPklVFXiofGQ+WhQxOO1Ok/siGtQoHPHE7kjYNUG32xG1YoHYUO/hmMfTvipexax1qNrFeafYABygTw3zZqUWQ2hNy2tms8sL1aufF0oYDqOrw22Dh3DcM2htE9EPGJtUSZxe/j2A4gYQj4Az4nHlhybDgOfV8p4oLgPubc/EuPrVcnJuABzgZS7OJ1wWNbdaMnnr/GAjuYMeE5GGzrErrPXGiTm+Nehc8Ph/WFZL//BFIycKM9kXWqIllCwaugqZcKcmZY9i6E3DxE5jtwa/+NaiPEGLs2FlcEFjZIyaspQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3EG6iLztMzCQAvn75LltMc4vHGKHiooMr3SJUqaNMj0=;
 b=WB237NiTASjoalyk8+2GNIJtlQ9Ykg7bWn4PRYZRq7HahLk4Y6Uty7duk+cOtolilvLjF0fTo7FwLgbZKJRlts29pYzZCv9r9105duN/P4SgRN9Ev03KzH2YZUopMfu8cpNf1k6i7VRN/K43v8Sy/S1Cgudz1CrxwYEaZv+XLrucW62zH6whNB1Z+uGdcCuaH2pjbOgg/5212IA9FZ5ojQdCf4mtr17SgBoL3Hs07TVbZ4Nq6cHn52MVAZIbYfWyL7mtxRFOHVw3ymQeHwluXr3s5hA3Ms6sXbOmOXsSlbPdmi14AsltmlhkVdJzDlW1xgSs1PLYbWgdWWYQsufYWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ae71c131-ccc3-cb56-8b19-e1b26074a695@suse.com>
Date: Tue, 4 Jan 2022 14:35:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: Fwd: Updated invitation with note: Xen Community Call @ Tue Jan
 11, 2022 11am - 12pm (EST) (julien@xen.org)
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Ashley Weltz <aweltz@linuxfoundation.org>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0000000000000dc59605d3479e02@google.com>
 <6b9e5cfb-c637-5050-7654-47f3cc74da6d@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6b9e5cfb-c637-5050-7654-47f3cc74da6d@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0159.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 744c4142-3175-4006-3f35-08d9cf872397
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3936:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB393665DBC0C83C48109B8BDAB34A9@VI1PR0402MB3936.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	okyf/0BvP4STuEVTNSwf+owXBrfh6OBA/NLFyex7BWqHu81Jt00ShGPf5rRdh1xLia2gQ2KdRGEarbEqVQIRcOc+o0jqI8Q3rUyItVzBjeXMCZTExuknRRXHA9YU61UnPLPBk1z+d2EhlVTeB5sEYaIWOTlEc789Zxa0oCg5tggC+LWXKbKVorsIKnfHW8OBPS6bbqwBHLQDAFM6xXyvc7C5XP/6GE+Xir9joYoznLYt3sAM1Rr8yoTRe18EMfEaDz9Nm3R/1wIzR+vK0Xsm8CxHOhZAl3I7MteDw1krrkP4q21ndW2PXT1bYQ7QlHF38pyEqgq4+05I0t4TlG80ffcdarc5SrcsIRcXQ/vkhJ5nCG2oLxmLqKPqavwxTHaMTph0lnYWkrfwb1XDvU+lg8Wn1SRoTKSLEjlSF7ID/N1YowYBBduyPGUbivinjNzhgXlhAgOxNXMGn1SMwbgGJfssxnvnnYOYoBYWhCJ/P3TmSUua8WStG7vG17RrQnHtuSqcQUmSxEd4/5feynM0KHQHjsCZ0WJXOzMTOOcxJk8dwUSUg/5yIvinrxkub7/9Lkj8wzvlDpbkvf+DJN6T7ByixBTdvsUt5FcLkqG80PyasMa7Oir7v2XgEDGHoXBVWXKWKHrDEa5rA+Qj6IiguZzufaLyFOJLNJ/ctQCNNJKSopLrCvk9qF8ML0PPG2w29xC32mMX+kt5C7my+bLAxG8Y1/eXWWZ0rzySgx1bCnQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(53546011)(2616005)(6506007)(6916009)(31686004)(26005)(2906002)(5660300002)(558084003)(86362001)(38100700002)(508600001)(66946007)(66556008)(6486002)(4326008)(8676002)(66476007)(31696002)(36756003)(316002)(8936002)(6512007)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHRnRHEvSlBCKy8yWXM5VXpXNjliN21ha2NlVWNmM0pwTTQ1NVBpaU81MVJa?=
 =?utf-8?B?ZllncmVvUzE0VHl0T1Q5ZGl0Kzh3eVBSazQ2UjFLb21xWnZMeGtiVk1YWFU4?=
 =?utf-8?B?UFpiTVFLQkVTR1A2R2ZlL2E0b3dya2tUanpGakVaMEtPL0R6cTFBZzYyN3N1?=
 =?utf-8?B?di9KK1V1MnZPN21leEozQnhKbmFvbDVDMW1LOEVPcjRaSldNcC85ZFhYWmJX?=
 =?utf-8?B?aE8xcUdUbnVhaGlCNVU3VDhHOGFNQWtNejd2OW5DbHFmS1Y1azFGZkhTVEpN?=
 =?utf-8?B?UGdKcERvd1BlV1o0b3liZWpvSjgzTE1zMzZJcW9zQWlTOUR2WDdINlkzVFVk?=
 =?utf-8?B?TUZOakJlSGtHeW1Jcnkwa1NadklOc01KanEzQlI3Y0h3LzdyZ1ZEMkRoa1g1?=
 =?utf-8?B?QnNZc0MvU1BEWUtiR250ME43WTNCS3NTUmdlNmtJbCtaMkhzYWIyeE9KMGcr?=
 =?utf-8?B?S3hEOUdZMXllamVBbHZaR1k0dWNSMlp4MzU1Uk5STnRGQlluSnVSRFJPZzlD?=
 =?utf-8?B?MFdEVTQ5K0tSS2h3UTgrbW9IZ1VPSXdhczJ3bVlGZE43ZnhVSXhhdVVEVGxT?=
 =?utf-8?B?U0kvL2RFQUtFUmhGNEtaZHZHUjVxOE1XQzg2Y0RGTkJpSjRpT2ZGeU10VHhW?=
 =?utf-8?B?M2thTWt5QWZnQnk3VTFqSnBucmhycEhPczNjMmJDTHFJbllPdUd3T3B3dzZi?=
 =?utf-8?B?TFpVaE9PNW1wRlJHanFqWWR4UE10YkMrSlNENU8xanE0c2R5bm9RRmp4N2tE?=
 =?utf-8?B?b3o3bnF4OTRtcFZNR0RTUjdrRFhFdWxYR0FsN1EycjlTb2VWQUQrNTBmRGp5?=
 =?utf-8?B?eHFtcFozMDVHM21WdU11azJLOVRVM25jS2hxeThTNVc2TVBJbnFFQnJIZ1A1?=
 =?utf-8?B?YWI3dXFUZVNnbGJmMkR2NURIL0pxUUxHc0VGejQ4MVNRVEhOS0xuVGphRzRi?=
 =?utf-8?B?N0FGOUtHLzdMUmZoaVNlRXhocThla1U3MllRTmVDNWFubEdueWx5ZnB2Z1pa?=
 =?utf-8?B?L1lsUStNeWVhQTQrUC9rQlV6WmtNNXoxNzhFUENFZTFreHJPaEJLcDRBeml4?=
 =?utf-8?B?ZC9IbFdEZXZhaUdtS0Ezb2dnTlB0Sm0xY1Yzc3JvbDQzNWpzOGlaQXFnSWRG?=
 =?utf-8?B?dkJNWlcwVGp0dTBBOXNGSVBoaFJKcXlDbEg3UGNKaWZMa1liNTdkMUd2aTJx?=
 =?utf-8?B?R1liM01VaGx5NUlTbEwydU85OUhkOGhjU2hpM0UvTnoxR0FUU2NVVlJTQUdS?=
 =?utf-8?B?WVE4YVIxTDdXYjBodmNKbWowNU5ESW5Vbmt0czRudUgzYWlDWWs2NHZCa3Q3?=
 =?utf-8?B?UEhldkNXUGhNNGNVaTlUR3RKc2srdUFQZTRRZytPTmc3RS9SK25kNVNyTytn?=
 =?utf-8?B?eFZXSHpsLzh1OHJGNHI2QURnRW50akk3UmE1WEJIYS9GWUgyU1I1UFZRcmtz?=
 =?utf-8?B?dDB4aEFjc2FlSjg4V2d3S3BzYTQvbTlTRmpnOERvVUN4Z05kRllqa1pVK2gw?=
 =?utf-8?B?Zll6SHJaeUt0S2hGa1RKSWcwV0dVVktCeXVFTHRjQTl6YWp5Sks2MDdtMGRC?=
 =?utf-8?B?ZlVIS1dXemErRzdJYWhEK0N2VzFzQUJpR1BwMENtTnI0UVVIQ2Ntakk2b2xQ?=
 =?utf-8?B?VG9XTFlKd1JQeHkybzMwOHMzSHVnWE93dGxKeGZDcWUwbTdLSnBmejBXa0x4?=
 =?utf-8?B?ajlJMEl5MDdtMGROcDYvanZEQVdyU2hMTWwweEpYTkpQR25la05xeXZ1WmlS?=
 =?utf-8?B?SFAxQ2dWdUtoN0YwYTkzaFd2ZmQ2QjduRGxOV1doeVd3dUh4cG1rUENqTk1o?=
 =?utf-8?B?NDlSREZPSVpRWGFQOW1NSCtEQm4vcDE1bUVaWGV2LzZiUG9Ga0ZyU0t0SGts?=
 =?utf-8?B?QWdobnhpdkNKd2hmUyt4blRrdDVRSUIyL1VhcVhFeGlkdzdDRHdNeGdldTRX?=
 =?utf-8?B?WmgzZmlSWTZRNlZ0RlAvUU5GdUEyd3pPOWJSUmp0K1VLMjJJQnlZdklIM3BX?=
 =?utf-8?B?UWVnSmRTSHpvTGFWcDdQZnpxNy9ZYUg3L3VPeHNnTzkvVUZ3S243QWZZc2RT?=
 =?utf-8?B?cXNGQkhHVndORzVscjZheGRQSWM3bkw5KzByVVA0VkVYd29GZHN1Ui9PS2ZV?=
 =?utf-8?B?OTBBYUtvd3R6eFI0UWx6ZmpkdXlvck5KakFsWjh3ZTRLZDVoVndod09ZREhi?=
 =?utf-8?Q?Q05aoPlIcQfuwDbiL2takLY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 744c4142-3175-4006-3f35-08d9cf872397
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 13:35:57.6983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rJy9ftIEZAPvzhK88z23lE/Nl0jE17YvEzFa6L8oti8uVNVzPDxaJXB6hoUZNs/coEhvPGr42kRTjwZPADjwyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3936

On 04.01.2022 14:31, Julien Grall wrote:
> Sending the e-mail to xen-devel as well. The community call has been 
> moved to the 11th January, 4pm BST.

FAOD I assume you mean GMT / UTC, not BST?

Jan


