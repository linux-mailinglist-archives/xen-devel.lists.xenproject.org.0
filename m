Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EADD50E1C6
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 15:31:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312949.530368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niyo3-000360-Lf; Mon, 25 Apr 2022 13:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312949.530368; Mon, 25 Apr 2022 13:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niyo3-00033W-Ij; Mon, 25 Apr 2022 13:31:11 +0000
Received: by outflank-mailman (input) for mailman id 312949;
 Mon, 25 Apr 2022 13:31:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1niyo2-00033Q-Ju
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 13:31:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3ead956-c49b-11ec-a405-831a346695d4;
 Mon, 25 Apr 2022 15:31:03 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-tPpNObtHPJeVG4mlAbbMXQ-1; Mon, 25 Apr 2022 15:30:54 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB6518.eurprd04.prod.outlook.com (2603:10a6:20b:f8::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 13:30:52 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 13:30:52 +0000
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
X-Inumbo-ID: f3ead956-c49b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650893463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dM3QqwvkL/RyYaonWo+r0tMrDZssVgCQBPKVMgMSKlk=;
	b=R3tAdzjjm4WfU8xS+FWSceZGQb7p+ijwcZULxTcqH5y00liWVRNq6+GyleZC3IdpQ6m1X9
	wsQ7+fPXpu/FkoyijnnAN5d7ucLeuXEajruJ/G3GtSyL9q0y0+0aoIU3S38W34ahUTjr+a
	huEbmdRV477yK+zSEGX/tcGkbIuzFiU=
X-MC-Unique: tPpNObtHPJeVG4mlAbbMXQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WX1RbCXg7LRbPasKbYP/Zu99lZLMBTqJBKGQTREPvjtcU61cy85Z+PhYZvHEvd6nZmcu4LisUahhvDOaT2mHzNthaPqouYm9kr9s8GFuI378ZeH7xKmYmVobZ6w5y7OdCcpR4YGGpYBJ0xfZxd4/yuJCQulObkSdoD+fmKjncUNsc1FfUuGIQza+pOjClqMl4t8XzcbF18oFARtSGE4EcpZjUloGcVro525iAaa9kfKKEuV6wKYZkT4qoQXvG0MPGWrYe1PU2r4NXRrx7pgJy5MUoblK9k8kcD/5ZTc5r7WRwR5q+DcZwF1pdny7/xyfWioOHRfuOShAI/3sytnIOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dM3QqwvkL/RyYaonWo+r0tMrDZssVgCQBPKVMgMSKlk=;
 b=W1sDamvE2I2Ej+7wt3TA1fCyNINcq8E0YyfFU5+v8yaHus2+eJ2Z83clAVt7ueokiphU6C7cQKU9q54WbaiKiXYPLh07oPfFLC8yS0WTIB9Q2/Mp4miGiLhmTS3A8Lw/Szx8qvQPkYqJ2dqXdkzO+d87xg8ijNaPdW3bfHGWzXtVHTWl/f0fVFXfpraOQLw+hK2Hb0zbxOw/oSEob/GkX1rGgQpk5WbYe4Px8T5wL41aLG6upIm5LG8uR4mBWKtiJFEEPRcf4XKS8Pxpf/udo/rG3ay0LxNw65X/Qp7UQSZQ4w3LhHjepQfN8LSkSeDJuTVaSRIs+yxu8H1AurTUuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e03936f3-2f65-79a6-51c1-194d25cd5c1b@suse.com>
Date: Mon, 25 Apr 2022 15:30:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4] page_alloc: assert IRQs are enabled in heap alloc/free
Content-Language: en-US
To: David Vrabel <dvrabel@cantab.net>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 David Vrabel <dvrabel@amazon.co.uk>, xen-devel@lists.xenproject.org
References: <20220425132801.1076759-1-dvrabel@cantab.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220425132801.1076759-1-dvrabel@cantab.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0003.eurprd07.prod.outlook.com
 (2603:10a6:20b:451::18) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c9e5885-fb3c-4b60-438c-08da26bfd179
X-MS-TrafficTypeDiagnostic: AM6PR04MB6518:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB651881EBC1198F422031A5DAB3F89@AM6PR04MB6518.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LW9XUNDlWdiTq318z/OnIUPls7xNCrP1YM3gYBA7QKp6NPxWU/wVfbssn6izeDdWgMagPc9WGrcnyE7ERnr+dhtWUqajn6HMxHREQz3+3N2URq9X0VG0ibe9ywhsGSMp06e4g4V/RyZbBhGpawULsDVzI0LTSTv6ILSlqksurM6vijPDQUZU4bEhjb7zIR3Be5f8alzsF889Exgnsgis25Ech3xqf7QwWWwsEOziXI/HP/szuGfwYVkc5pgiDG09OFqrsDoHzLZef/VQ2VYn3rtoN01SSgEyAXDwvEIcEoOiZbnNQHpU3DgSLMpgFATTotgCJCY2JS7BvO1mpgj0dvhtRVaEJMm1SPNhWWj/SLrPtJkHHkHkMGbKDapZkpL3m3uqWlLglPa1hxvDmAaWuA2BOFoGpHbFGsgaVxWzooF93a+hyRkv82ltR5+BKyYhx7KZSVg4CzyH5nsPMvTlFNLlcs3kyeGwV3aMmC83au8LGA/vjg53CHeA9MHr1t7SUQL0XDkfSvSbIa/Wl7b5xMfO75ZNskMipZXmH0VMnRfQlNlMdy9UoPgS9S4IO37YL2PMbR3pEj706GAnVyq8hJVyUkiXS8uj2mgyjEeRtvuTKHfd57pasYthtGTE2Ui26fZFCB9mvDt5axDcPOgqgb8ZVMLTLbq+ADWWyeHJkQprcJFjzeVsao+6E4Dz77SGYHVFrKNI+kYMyekGZ5bHEwUQDCDbXeCIV1+lzAUgUq8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(6486002)(54906003)(2616005)(8936002)(508600001)(4744005)(2906002)(83380400001)(31686004)(5660300002)(8676002)(186003)(66946007)(4326008)(66476007)(66556008)(26005)(6512007)(6506007)(53546011)(316002)(6916009)(31696002)(38100700002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXhUb2tia2tJSHlBcGpvRHhHN25zS0wxM2k3MXB1ZDNTbDFpRm1IOEI4VTZX?=
 =?utf-8?B?THR2aXNySVZEY2F1MDd5ZzFqWnBjMWl5R2dldzJUTzFRYUdkNTA1YUViY1Z3?=
 =?utf-8?B?emgvNUpiZXNQSjhkMDNTdWR5MDlYNWVwM3JVWlhWcWFzOE5RdTFnWjUrV0dE?=
 =?utf-8?B?MUxta2VtVW85SGw1OWJZMnNDcWRDODEycDNTcUxhRVNnaXVudlFySjYyZEJJ?=
 =?utf-8?B?K2R4V2IwNnBLMUxDWnM4UnFuaEtDaFh1RU5PSmwrRTZ3eFpKVllMOVo0eGV5?=
 =?utf-8?B?VGRhZS9RNVIzZnpJTVUrS05qQUxmS2srM0pCaW9zVEdLWEh0S3N2WHNlRXYz?=
 =?utf-8?B?QVpldDQxR3JtcVNaUzcwcmE3WVJyR0krZmhVM0taZVZQVXFnRzhuRlB1Z01h?=
 =?utf-8?B?V1dsenplck5JQm9tdVdWWHQ4M3pTcVoyYlFSRXBkZjVJT2IrL1RkVllGQmRx?=
 =?utf-8?B?Y2JuMmVXN3AycFZhRXRHZ3pMeE1nMm8wWWEzWjZnSjEwRWpNUDFqaktONU1v?=
 =?utf-8?B?eHpTTHBkUHNoMExvMW9DQWFjWHkrTlhUVC95WUY5RHVScS85dDJ1SGx3WVUz?=
 =?utf-8?B?WG42T1dPS1BlVFhUcmNPQjdhdnJzUFJVNms2algrcm1DMnNxWGcyUHk5NE8z?=
 =?utf-8?B?YlFPZXc2UG5FMktzN1IxKzdNZExlalRROW9zZEVHYmE1K1Y2YjkyenpBREN3?=
 =?utf-8?B?QUxwdjR1ZTdjWG1XNHNoTkR2NkI2SkVGYkMzTzljYm5jdTZ1ZDRRTXNwRXVF?=
 =?utf-8?B?K2o2bE9IZ0FQN0FlMUpUMDFBeld6QlZKdzJpdk9NR25Fdzd2VzVuY2l4N1ox?=
 =?utf-8?B?VHZJZTFnVllCdUt0RWZmZm8wRXlPakF3c21IS1ZSMnk5eXBJS2dJTjUrL1hP?=
 =?utf-8?B?V0RiRDFNQVpBc29EcUNGMTVFZm91ejg4Ky9GMnQ0RnpmNFhEdDNJWk00UFNB?=
 =?utf-8?B?Zmw0SWlOdDJnL2s3WWF3bGZzL1FLdEhTcGdxOWZacnUxaEhBY0pOaDJVWnQy?=
 =?utf-8?B?L3pyTmlxZDVhOE9zdjVIbjlCcXRJcFR3Y24xc1pidnZmYkpNTDd2UG1wZHZa?=
 =?utf-8?B?Qm9kTFMyNFkrYVNUb01JYzVXUExDam1tL2lKVUttc2hIZml2VDJiSFRmMStO?=
 =?utf-8?B?bmRObWNJQk9naUU2Z1lsNmdibDRHTUJuYXkxWCtqVTBORlVtNUs5V3ppNzBC?=
 =?utf-8?B?NVpSZE1KaWtaV2pkNmRrVUM3dVhkUWFrdmVOTzFQbmZUMm56U3RFR0l0QmFw?=
 =?utf-8?B?THRtRzQxTVpydEUrZmZpUk9SMks0a3ZPeFp3QVBVQVhjSGVHd29sNXdlcVJB?=
 =?utf-8?B?M3ZMd1h6UVBUR2dPcVRZNW5sOVNJblpyVE42emJDSndXdmVoWGRtd1FsZUpN?=
 =?utf-8?B?ajdmSUVWaHZYZ2FlVlZOU0lkbEtDWVdVMC85OEc1d1BadnRFQ2U3MEovY0Ur?=
 =?utf-8?B?ZWh6QUlUS3JsajN4MHc5Z2FTbTVnOEczb3JMR3hDNEdoSXNLUlNYOU11WDY5?=
 =?utf-8?B?UWh2ck5iV1V1ZDhuVHVickZXaHpDN3RBaG1hTWxCWWxYVDBDQ1J2SFhUNEsw?=
 =?utf-8?B?UFN4NVNRbUFiOHgycnhBWk5TbVV3eEhYK3pYL1BpRHI4cUthU0JYUmNSa2po?=
 =?utf-8?B?VHBOazBEUHRZaG5rME8wSTMxcDNrUzlCVHdXSW9pYm5OZWFKc3hiQWRTSFdO?=
 =?utf-8?B?M0JtZUx0NU1LZENaczRzWDhWQzVwaXFhMnFLeEZnZk51UVhIQnBVVkhMZTFO?=
 =?utf-8?B?SDdvWk5iY2x6bmJMcTB4Y1IzVUNQN0FkQldsODFWWTFLbUFQb3MvTWtWRHAw?=
 =?utf-8?B?Sys0ODd4d3RPdmExSWUyNGplRnA3bmN2YWladXc5WExrT2VmUlFrbWh6bUpa?=
 =?utf-8?B?TzE0U05ibHZteERGMmdZM1JSOEVscTBGT3JFQ2JhR1lkdDBtYkU2Uzhiakd0?=
 =?utf-8?B?Y0lOMlJDL1BPaXpwMVUyRkdkQUNleElPK0wwenhJRW5kY2VGQUVsblVQb1Zn?=
 =?utf-8?B?QWYzc1gwQm5waXE4ZXgvR0VuZmgzblNYY3l3RnpiZktReGRjSVhqSGJKWEdi?=
 =?utf-8?B?NHVaWWEvQjRHTlhVTDgxeTJsdnpmS00vMEZ2WWQzaWRrREI5NUtOczQ2c3ox?=
 =?utf-8?B?bDgxVU56OVdIaVZUOWJEcWNEVWkwTVZrWmRkbWFjalVYTFJQM1pRMWFlY2Yr?=
 =?utf-8?B?bjRoeGRtWUZHTnFpWWdlRjk5NXBPNjZTei9IbHg2ZEdpSUVTWHVFb29CUDBR?=
 =?utf-8?B?Q3hSSzBqT05DcUdtMUlqVEYrd1VQY2JsTkNGRy9aQU1FSU5iblVYL3JHS3NK?=
 =?utf-8?B?M01Rb05NM3IwQnNITTZHRUd1aHRjRHNJeTV3b1NSM0JMRG1CYzMrUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c9e5885-fb3c-4b60-438c-08da26bfd179
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 13:30:52.2759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ShGefq590y8DB012s027z7Pajw5et5lHd+3rSS8OHG8KqOJ0qBlyGgJd0Eio1Zdk+H/MXKknozeN7u2KHuUPuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6518

On 25.04.2022 15:28, David Vrabel wrote:
> From: David Vrabel <dvrabel@amazon.co.uk>
> 
> Heap pages can only be safely allocated and freed with interuupts
> enabled as they may require a TLB flush which will send IPIs (on x86).
> 
> Normally spinlock debugging would catch calls from the incorrect
> context, but not from stop_machine_run() action functions as these are
> called with spin lock debugging disabled.
> 
> Enhance the assertions in alloc_xenheap_pages() and
> alloc_domheap_pages() to check interrupts are enabled. For consistency
> the same asserts are used when freeing heap pages.
> 
> As an exception, when only 1 PCPU is online, allocations are permitted
> with interrupts disabled as any TLB flushes would be local only. This
> is necessary during early boot.
> 
> Signed-off-by: David Vrabel <dvrabel@amazon.co.uk>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


