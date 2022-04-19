Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED37506939
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 12:59:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308032.523522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nglZW-0007qY-Ec; Tue, 19 Apr 2022 10:59:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308032.523522; Tue, 19 Apr 2022 10:59:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nglZW-0007oK-AR; Tue, 19 Apr 2022 10:59:02 +0000
Received: by outflank-mailman (input) for mailman id 308032;
 Tue, 19 Apr 2022 10:59:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TFaJ=U5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nglZV-0007oE-AS
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 10:59:01 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b79de497-bfcf-11ec-8fbe-03012f2f19d4;
 Tue, 19 Apr 2022 12:59:00 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-QdnaEASgOPWPRc2WzdjMMg-1; Tue, 19 Apr 2022 12:58:59 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB6PR04MB3080.eurprd04.prod.outlook.com (2603:10a6:6:5::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.20; Tue, 19 Apr 2022 10:58:58 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.013; Tue, 19 Apr 2022
 10:58:58 +0000
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
X-Inumbo-ID: b79de497-bfcf-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650365940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=651Ir3xi2t9bra1dRu8jqR7TRzXHsGcij0UhxH5zzDU=;
	b=h0F4v5+U1A/iewqNN2x7Rd7ZQ3iTH70edIoYSZWBABISr83dypOTd2ht+nxU/HSDX7R9PJ
	R5h/seiDXn1Vt5lOLfavlJQM7/UUADhCD2W1rB2rp6HCKneuk/HAH70xJ9RC0+aoA0DcVF
	ijhldX6LFAMgNme6y3STdQ8ttwIfjeM=
X-MC-Unique: QdnaEASgOPWPRc2WzdjMMg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=btUVPc9DhI36+LZgxeth6rJAyr6C35xdc77OyYpCSIEv5wofh5PiQRYKUoWkWQpPaty8rbTb0H52vtm8evwnHAnf24u7pE1GpovQS4yIuyrl22equ+qdPlTXOR83TFV7SCDeOK4XmPJlYVzmN4s1UiNtOf4T3ewyDhc4KfD3WMB4kaJw4YlA7z6ed4eJvTb/i6UJeeQsQVdya+oLu88J8rC6bHZE9A6lbuO47WUiHEbWbUc0k3UQklAcUqJ3II+v//vX2i62Jpa8LKtv+5y5P3w8MU0nOPm8r8A+fOkg2hGc4NRb4f/whW5MHOwChA/wd5dQ4lJGNRUKUQ5mDLCwWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XMF2QP4JiD6lAd5TY/BvJitjdqmdkDexMhqRSsWikug=;
 b=d0um1ys+EK4uf3pONYQLQoi60eywYFiCqI5r94ekck1wgM1Ocud5PgodLSArAiX8IANoKjImdNx6FTNUKjXgmRhD6+FHMJ9SruGdmIntsTbVErZKu/iGdZcM6p/7cS0oolD+mfcInSEA9Tjmi6KqJhn/5rQEAUYDc/Lt/8LBtRjpa0FavD+fNVcA6GaTk0UZARWvwEUVTZ7dNJsR7gx1AFX2CMMf6xtgbxDZK8GFoTYNQ4YWYV36D4JJKQIgu/7XQ6GFxxiWXQINQDOlD2tbHvB5WjLlfDutWsWx8+WGj90V4mxFxPAvEcZK/IVSlEZSqiCdAGpRqYb8p1uObWoFeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <48fe2a98-98de-8aa5-8d3b-e70427008edb@suse.com>
Date: Tue, 19 Apr 2022 12:59:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] IOMMU: make domctl handler tolerate NULL domain
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bc61d9cd-5da4-e35c-fb21-eeba5ab6e529@suse.com>
 <6732a3c3-fc19-cbdf-7483-9f5946f1935a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6732a3c3-fc19-cbdf-7483-9f5946f1935a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0226.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::25) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d22b18ad-1dc4-49c1-0c9d-08da21f39a81
X-MS-TrafficTypeDiagnostic: DB6PR04MB3080:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR04MB30801EA04B05AEEC828A5692B3F29@DB6PR04MB3080.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9lkuIJr9fyujfboJV6UdBewN3wQa9+mNiQ2nooHTTcBjeCVx2ynQV+EuPhBhOp5v+qce2nUeYcq0NYJ9H/2kgA2MC6/A1/+zFA6F6Dpa8ETkNDonPkJFaIbHSnW/37meID9N+OsTHmFpRbJ/rAlE5nhCRjgiCoCdWotDj0HjmSvVhJp5f9xa6utQ+91ol6b+nIcdVNZQkCcr521QX5EESZsqSKt3zeKMDOasu5nZ/HIa7wzR+aw00gqWGG0i9N/AyBiCOfY4HC3h7B+38hqdaBj6kMKERH9gVSPCrhCDb6gv3/vciIngkFIxfOzgYjLmTjEksW0QSrIKpjZA1WY2H0FZDmy2z0CPpqlPRD1pIA+0riJgQVuAU/zoPFuuHlhIYHZiFCZ/gfF+0mkgsStxvLpKj32XHdtsgy2nX/g9fHZ2/Pu0lFHAx319DRq7tYanxcvPUr6VumN1U3SV+enXR7ZvkkO6iQ/nFGk95DOVAY4y7mg2K6hK8fQR/M+xGyCTmqCFD4MEqrA1/mwE8fou3xbClORelHCbj8hpNCT1Vl606yI6jNYTKa2wX5RdyOHJ7/r8lgu0etDG4OABQ7hKaLEIiXpzjjBNNwraKYF1T47fN9yEp+GYox6U0YjUhXHXiF8aksXd9uwNMCMof4zE9kefjmJ4cdUcm+LLi/sBlzSrYv1oP79I36X6BpTGAX5ADtqLdx5N5eaYNDGhtWFvMKyuYM6SWVvM6XImkzxURj/gERrouP83j7thtMIjN4+a
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(316002)(508600001)(6486002)(36756003)(31696002)(5660300002)(86362001)(8936002)(66946007)(4326008)(66476007)(66556008)(8676002)(53546011)(6666004)(6506007)(38100700002)(31686004)(83380400001)(54906003)(6916009)(2616005)(6512007)(186003)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?niaKALgkQfdI2VlMPHAnIWBGWpCRwc21DT7LSNB3jLyoFVXSNprdWHQIzX17?=
 =?us-ascii?Q?5lUlci8l4b4tAll2Em96rwF8InUMLVZ6/sfJhq4epwtWyRLXTUW7k61hszZP?=
 =?us-ascii?Q?NQEDBUrzcoAztJjP0JRTkNZvpnoFAweqbWuzZVttOiEuwVv2P8Veo9O8zN8U?=
 =?us-ascii?Q?suqxrTq2qQq+Y4G6gz85ergJWYWP6OmXEXuKx9whWGiHWKXl7Ai+YIUAy2t2?=
 =?us-ascii?Q?ns+xRu8R9mFMU1bop7wOGsDZOfezz/gv4SJojrU+u9Hvbf/ZEYDXe2NQ+5s0?=
 =?us-ascii?Q?gKUpOicRskIU5IQR5VUkTF8rOY3WV2xHeUIN5gD8E4Jo0Ve9mjhFBTnVPXq3?=
 =?us-ascii?Q?iNVIBB7GL5qh/OnUQztWu2VNFMqnzxxpsX52kItg3zVv85zvPr3ZY8uFWUqU?=
 =?us-ascii?Q?SseGiii52NJ4Ti6yNGRGIikNWrq4BK2fUMZKZ0hXY81/ysNcpI7RyStJHoB+?=
 =?us-ascii?Q?rtSqAWTQEXuF7f/YoP+knX7yq2sNSarBRZxtrxx4d98uxx7ddtXVkHk0R6E1?=
 =?us-ascii?Q?biobFJE5FWxP2q9pQmEMecKJwbDKRWdtWLuNzQRCpgtYD+j4vjSJd+qpLI5b?=
 =?us-ascii?Q?YNuSqip7tnHCvFp3SzaKoI9ZSgJjwHguFt0tcHpjZ+ElEyJRuPIwRhMPrnow?=
 =?us-ascii?Q?ln2HPQx//JqEu7WR6s1gp+DbUdtn5SdWtr9eTZAdD9Rf2KEe9gTCD8S/iOKd?=
 =?us-ascii?Q?etZ6UHVXYMPlrIqCVtIZ+LTwtNpAJPSeMYlVq9MT0P4KEoH/Wv8xWXDaS+61?=
 =?us-ascii?Q?9+Q/MM4OhSnTW3t+zj5pqR8mqSECV1GiLKRM7138fVMZZp7zmLNDcy3Adzbt?=
 =?us-ascii?Q?guofVYHmgkWGQAQhd0dx7YWEhcOUu/h/dMTgEU49R7BWOV9L5G+ASrEGYRUq?=
 =?us-ascii?Q?nwh7jUZnJpWjaDtmLBBOqePQazccA+Vr8v9ZdSdofDEoqzjbruRsx40ztoNZ?=
 =?us-ascii?Q?9jhDBRM1RIe9vcWt7bcTlZYiPLK5Fd861+VcJ8tVR3yucsq92M+S65Oupy2i?=
 =?us-ascii?Q?RXhQthf5dtqfNrlEkEILxODGXUVjpf9rOA7M59jeswNSIQgtyEzeTUuqMPBe?=
 =?us-ascii?Q?wZPkR69pLGc7itZuSNOVj7/B8WoVce7klTQK6V6yjTJPPZX8hcKvqZV/M5OQ?=
 =?us-ascii?Q?g/n0OgXsFtmlif8i+Iax8ojV8Ww74jP3a7YUeIC6R2TsjG4XypeOlZmTLDJT?=
 =?us-ascii?Q?FUDlXbhtndhoDshA3H2mPi4ApXJJZ6l0KM5dW3OXWn7snE+p+C0Z7yOpjxGF?=
 =?us-ascii?Q?7FEvVb4f4JRx53yy5W5Q8scJmPKp1yUocyo4falJPhtHyIlbcJ+yChe4Zjm7?=
 =?us-ascii?Q?02nIGmjHneMzaxR5g9pY11ZxKtPFoMXNtBvT0et8kc4D1PqAURdunUaAlCvM?=
 =?us-ascii?Q?FphBhEMPDyKpNh/dXgbNEBpJjGTpPCom7OtIc8natVoxGUt7LUwAXRm3muKy?=
 =?us-ascii?Q?ekJclmGV20vii4DRlVSnUxQ1AaO1eeWrpmHF0HSKX+S/daJ8FuadFhKmpWtl?=
 =?us-ascii?Q?N3+HdY1ES8f7k1WLJ/TVdd70qUDQ+uPf/QdNqXk9pw5FTrHJlDR1+2kFJIL/?=
 =?us-ascii?Q?+A/w9YAZFbhVC7F8luhtM8ISYJClMLRhIq3qRYa2QghdEXOIEasqLIEYv+fQ?=
 =?us-ascii?Q?hUfVdXX93mqUixKrG+g8t9yyJNXoAnytRC/ETBSLJrt4oEpbdxhpvlyqvjo4?=
 =?us-ascii?Q?cZzp7KKOGV7xbjV0Tvb1QkebI6LzolC99vAQ+WFt3Eb7Lwrip2E5Ev/xjPxC?=
 =?us-ascii?Q?sSDy4wwMSQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d22b18ad-1dc4-49c1-0c9d-08da21f39a81
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 10:58:58.1139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nvieDfRyMWOU8fcCmabrfPNucQLxllsBh5OlLPRF/0wVOoM86rotQ4PvKudZ8XXFPvH/zT4hckTkjH6X5kRj+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3080

On 19.04.2022 12:49, Andrew Cooper wrote:
> On 19/04/2022 10:39, Jan Beulich wrote:
>> Besides the reporter's issue of hitting a NULL deref when !CONFIG_GDBSX,
>> XEN_DOMCTL_test_assign_device can legitimately end up having NULL passed
>> here, when the domctl was passed DOMID_INVALID.
>>
>> Fixes: 71e617a6b8f6 ("use is_iommu_enabled() where appropriate...")
>> Reported-by: Cheyenne Wills <cheyenne.wills@gmail.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> I disagree with the Reported-by tag here.=C2=A0 At best, it's "also notic=
ed
> while investigating".

One can view that way as well, sure. But this change alone would be
sufficient to address the report. (As would be J=C3=BCrgen's change alone.)

> Furthermore, under what circumstances is test_assign_device legitimate
> when passing DOMID_INVALID ?=C2=A0 This has been broken for 3 years now
> without report, so it's clearly an unused codepath under both xl's and
> xapi's idea of passthrough.

I guess xend had a way to drive the domctl this way. Iirc this was
to find out whether a device is assignable at all, without needing
to know of any particular valid domain.

Jan


