Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7EE461BAD
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 17:17:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234743.407366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrjLJ-0000Aq-EG; Mon, 29 Nov 2021 16:17:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234743.407366; Mon, 29 Nov 2021 16:17:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrjLJ-00008p-Ar; Mon, 29 Nov 2021 16:17:25 +0000
Received: by outflank-mailman (input) for mailman id 234743;
 Mon, 29 Nov 2021 16:17:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LLD+=QQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mrjLH-00008g-VT
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 16:17:24 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4e6c45d-512f-11ec-976b-d102b41d0961;
 Mon, 29 Nov 2021 17:17:22 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-5qOZQujlPSSYcCMLULEFQA-1; Mon, 29 Nov 2021 17:17:20 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6176.eurprd04.prod.outlook.com (2603:10a6:803:f6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Mon, 29 Nov
 2021 16:17:18 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Mon, 29 Nov 2021
 16:17:18 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9P194CA0001.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.22 via Frontend Transport; Mon, 29 Nov 2021 16:17:16 +0000
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
X-Inumbo-ID: d4e6c45d-512f-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638202641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tUiodw+6kINvVCJSlFIzqmgVWlS9vittYEmMsi6tC78=;
	b=SVd9BLbysxSlZqCiymwMGUfyXYlHHOCtY4aXnrEp4dTeWBJIN/wFHEHFGP3s7nsDVhJINi
	TLXegEvWvFwkp5UA1tqyK46ZHNo/zsNB2Vbw7kyXO8wWYQ8OGECqzlUcXlWv2CzrotCa/M
	F01RT8nuZB3HuPmhybjiMz7mcKoP/DM=
X-MC-Unique: 5qOZQujlPSSYcCMLULEFQA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iew6drm5w5x86TzgZmNl7ik45KjwTZC+/6434Fj9P7BxsZArUyNeb5AwOYOhB9ZqBYwD67mx0KM30W7yGY7kR8f1PzJKZqFdgmvMi6CUm/IRmq/7O7wAW+kfiH4f/hpWcgXSLedlBBpxhxgYRYl5YRsVgZBxIiHKnzc2l/lt92Of8SC9TrOCl/dt03ovc015Ew/9U+yFzA7bOmsMt6LvUrFcA73LkEgPQRTRtnCiJX/NXAJXnjjpaNstciIUXie0r5aWqSua2x42Uyo0THA9QskmaOPzFbbUTeAx5iZ6JcmYrzi/3EjYmYFsW7yohNW3R4sPlGjtRDIH5oQwSRjHWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5DO0ua4Csy7EOR/h2PhqnA0ZieH7W206sA6OBpBu/g=;
 b=an2cjrgxm5dFZQPkixCzsIJE6qTmH0aDgmLdOmDxIO9qhWbztUYG70U1pthKcJTgAosgYtg2O1OjXvgjhmRLAxhhgKhEZpK6+AzV7QcewiwA0IEpy23yAHyqx+ScFKo0YdxJWPe5aa57Jjqn4BvSVqnw/LHyYVv5rnS6CDZW326Rr8wFclwnhUHgNrwwC85oFSNpplRFvvYrudYINMDLLADWb8cF8kEPQv+ebv5nmv74naQmjgWJx8mmqE309x1uyYBwTyjxKFRgY1QKwGwKooufqekGf5y81hJ8Nyw6mGWQiH7AnvlNQmGtvPRxYb08AxnO0P6FV1KFmXcDd0UsGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a290daa2-f20d-2d94-9bc8-a657773cb802@suse.com>
Date: Mon, 29 Nov 2021 17:17:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 00/65] x86: Support for CET Indirect Branch Tracking
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <178aa1cd-b510-7e3a-2074-a2ae261d4975@suse.com>
 <c05512bf-ceff-8402-07ec-17e44163d45f@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c05512bf-ceff-8402-07ec-17e44163d45f@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9P194CA0001.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ded2e325-8a30-4bc9-f683-08d9b353b69e
X-MS-TrafficTypeDiagnostic: VI1PR04MB6176:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6176589AC4E5171EC0F0BC78B3669@VI1PR04MB6176.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4HgCrbQZIQH81oeRj9cuncI1QXKPfMhWYG0b5ma4CNG9WbJEHQG/2m+Chq/UuD+wyEZGE7bLOUz3emlo0mQIHVK99UdcaWdJqLogrASNX2MDmevJ5jc5pGwXHlLZ+BUXhICKjJS4qMA8vwHaOUKSst1fK9j9/6y39VuBIzu2HsZlCILd2d9uuAF+r83zZhuR8RTutf30TTi8lXhcPa0JQ0h76F31IITPNFXrlHPXc1JjC6Z+IfVIJayuqlBUuf9ZQzACHSt6Pp+uM8RwFusmmy6ttp+TpVC+m6arKvsK3jVHikgOa7a3cXpihlgLDxS2LSNIRv3OYg8T9qHMsv6NtP93vRIPaIUvDdebe4tMuAE338rE8WOMjCtDjBxFnVNMA+1xgCDSQb4MCghQR7Iem5ZsDrBugGzuviKFF3+BK2PxsxBeagHLeho5FigJTJCYqYXCie6TzxYwWcNC1Wm68NmRKXioa8HymbSVw6gtxC/zbSQS7UMM5bQ2z03GcUcqJkSipV5zq4QKCMoAFLXWNCHf6QKdCyWw7WjcsQgM0jIGdH3sF+VlA8+y3Q+Nh+pW791hzx4tfWTxO9FvguNMxPAe2ekuwamsp8rWDw7tc9eRaVAXauWOiLq2ASX9h7+n0DVLQ9EOLWbPxn8AAxSJUZe6+FkUtQiFdW9VoWoCfFJj3eXe2UI+HRdTylW0RNKhZVw6byH3I8Qn3y+fRBp+jMSMFgu1Xm4B0s9+vnxbSIQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(66556008)(956004)(66946007)(2906002)(8936002)(2616005)(31686004)(316002)(508600001)(53546011)(5660300002)(26005)(31696002)(86362001)(36756003)(8676002)(110136005)(186003)(54906003)(16576012)(4326008)(6486002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0J8FIxYUxFZpa2xkokS49xN+2o1r7INKcl7H2M2OlgZUepxkfUD/yqPFUuFw?=
 =?us-ascii?Q?aheYnYMWZmFcR9rJHGSAst+7Kc9gpnI6PJOopsYNbRx65hmM1meZC8WaHhF/?=
 =?us-ascii?Q?fAP0QHZ0AtcfD40b+TcLjmrBww5EcKJsQqR6IJaQQ/MJncpf5q/5kmdkDrbH?=
 =?us-ascii?Q?pzVQkTaU9ND1GDiLgA85Hqp8O78eR7M8n6XtdLmIMBsdS+Qq2j8Y+zpptL+t?=
 =?us-ascii?Q?kHA7GrFxZoEv42Z2I9UzX86Qgrvh2MINE/2ApSxHB6k8HkK6RKbLGfAY6zI6?=
 =?us-ascii?Q?G9C/uIEcE9DVL/lzJt2tc3YGyQMBu/tqesDZGBSE72ULkWhUewUkPqI6RYuv?=
 =?us-ascii?Q?r5n02OEMejw39Yn8vqco4Y0HDl/zeiXTbnvDQqiN8y0Y2rU+h7IYZSsNCh8d?=
 =?us-ascii?Q?onXlc7UzBSMwzR9yc6bAZP3Xi4uRpcuUEVMZ15sdaEEGwcC5oKXy/WHWQQzC?=
 =?us-ascii?Q?4r+NnFYMgCmPdDMMEgGBrIaVqZjxPqizqVmCJqCHdmy0fIUiKeXymX7JxHU/?=
 =?us-ascii?Q?GFLgrtceylj9ipIY1oW0TEaMJbWG2TNYvc0YHUKKYDbpbnLu/6mPq4wsbOfQ?=
 =?us-ascii?Q?N56cCuhFYT1wPILatd+4fX+GK2mwRMeL57Ha/ZYqhoc94Cma6vu/k7mVWL0c?=
 =?us-ascii?Q?zRS+esK+ZESQvGRylH8rUhV6AuH/z10fpN+ck1HNDz7TveMiHqBwZV0lgtvL?=
 =?us-ascii?Q?JZ7Y/R3H6RJTf9lZ7fC+0V+ggccndSBCHjOjQgujELbolSuzcRVj4VZHrWkt?=
 =?us-ascii?Q?MPuzFZ+NBdC98Oe8xF2e/gCCyoyx7xemqS5a6shmdzLKvuy9zmYqsNcNntot?=
 =?us-ascii?Q?NG9huzfDohz25BKEvkS2b8fd1wpcwonf6J7SdHGRYCDy+PVRpuJ7mnuvbUFn?=
 =?us-ascii?Q?i9AmhPdpeaZLXfgXx4el42ttjPlPCdfth03VIz2HoAXwkLkPlvn9e4mJ93Cy?=
 =?us-ascii?Q?4Ef7FIpl/n2N6qYgJ8cYfsjkUPkEflVgNC3OULKVGVIrWq4NYT2n372zbOPU?=
 =?us-ascii?Q?vmYtMAGRQN8vJcD544+tTJyGLpf29WXTfCTqU+g048zK7tvD+F1ubdRR1fn6?=
 =?us-ascii?Q?TZX1baYnePXmA70z1q1LzjZQj+NS21tnsmJwhgpJRL1XqDHvoT4vJWIif2/k?=
 =?us-ascii?Q?CgPUw34LFyfHaWcSRGFPd2eWloZefDewokdU+WycD7yzf1VmI1GU8wEqoFKP?=
 =?us-ascii?Q?xhGUGxZ3y52J53q4tayzY+wIK1ei9t0hpLGUo4pE/X+YJkYHkPQOG5PKxUxG?=
 =?us-ascii?Q?gXfciQ4kXnBSm6fhPZmf3HoigcmidzBrdQ/iQzMWybwhAe+obdgplzwLEnY6?=
 =?us-ascii?Q?GYlvXjVAsiVOrvK4RCv9vMshtMuk5j4lZM5Vx0hnBAk8OjRD4xR0gb0k5LuM?=
 =?us-ascii?Q?/iz+BgkFEH5LR85hI4HtJznZLuemW96CovU2rfq5weZ7qm3Ow5zLdY3GA9Ez?=
 =?us-ascii?Q?/VoP4cwD35YBvM55j5Eseigap3lBsCMg4bddjeCI6dUoeiDfdlghlaKnXF7Z?=
 =?us-ascii?Q?vzOI8YnbWcC0MdOsfg58eCyPnRRSK/wOl/ZoDMmNHgHZ3MVfhmo+IhpkyTw8?=
 =?us-ascii?Q?KbZ+aKzqZQDRTlcPitZMPRg/RQzHFPupaBI6fDNXW9gF3uhnoyibOLESEd3f?=
 =?us-ascii?Q?rPtU7TjvySfjWBNFOX4EgK4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ded2e325-8a30-4bc9-f683-08d9b353b69e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 16:17:17.9193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hec1S8g2p/XXaOEtWHQaAvs9an/oaEhwPOhwGM1uK8frL5iHB8mZXtiGNEcpR7HoYMwXVf7hBxoM3Z2hz2jWBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6176

On 29.11.2021 16:09, Andrew Cooper wrote:
> On 29/11/2021 14:44, Jan Beulich wrote:
>> One question though: With the large number of __init functions gaining
>> cf_check, wouldn't it be possible to turn on CET-IBT only when we're
>> done using .init.text?
>=20
> 233 to be precise.
>=20
> GCC can't distinguish init from non-init functions as far as the
> improved typechecking (patch 56) goes, so omitting __init would cause
> compilation issues.

Oh, right. Should have been obvious to me, but wasn't.

Jan

> Furthermore, CET-IBT is only one Control Flow Integrity scheme
> attempting to use a nominally arch-neutral interface.=C2=A0 There are oth=
ers
> (PaX RAP, and Intel's FineIBT) which have software components to them,
> and for those, the function pointer callers and callees need to have all
> appropriate ABI modifications.
>=20
> I'm pretty certain that if we skipped annotation of the __init functions
> for now, we'd have to add them in due course anyway.
>=20
> We could defer enabling CET-IBT until late on boot, but enabling it
> early gets us better coverage of issues until the first software scheme
> turns up.
>=20
> ~Andrew
>=20


