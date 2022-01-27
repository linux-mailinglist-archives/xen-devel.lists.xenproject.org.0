Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E7449DCA8
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 09:37:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261309.452288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD0HY-0001bG-8Q; Thu, 27 Jan 2022 08:37:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261309.452288; Thu, 27 Jan 2022 08:37:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD0HY-0001Z9-4Y; Thu, 27 Jan 2022 08:37:28 +0000
Received: by outflank-mailman (input) for mailman id 261309;
 Thu, 27 Jan 2022 08:37:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nD0HW-0001Z1-4l
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 08:37:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a37930e-7f4c-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 09:37:25 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2056.outbound.protection.outlook.com [104.47.0.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-m3sGIoKoP8yT8Lgb4jbN8w-1; Thu, 27 Jan 2022 09:37:23 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB4977.eurprd04.prod.outlook.com (2603:10a6:208:c1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 08:37:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 08:37:21 +0000
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
X-Inumbo-ID: 5a37930e-7f4c-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643272644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6/dwuMhovaHMY4aXLL/RUwa/txH3GtpWP/4vt7mQosI=;
	b=SSroprRIsuTSH71EFwLXGAOAoHfRE9EBDXFLEujNdDWsZyotzskNCD4jk5WGyJdMZXswCR
	inPLvR3IPKLIdlWNg6GwtarAlF/2INmP0SY/AZyX8PBBI4kbCs0uIn7HAfi4VeHbC7i11j
	z8ERvf9tbqwF2ForMD3d05yGKXMWRXE=
X-MC-Unique: m3sGIoKoP8yT8Lgb4jbN8w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i3LPhXMhVGWe/qft570zunPQDKYBM8RSJWyWbjseN/X4k2ubCh/USpt0yUmKL57650O3wMhEZ/J8hQGv8YScWMtWfpXALvxFRlE9/4yyFF3nfQkGIBI5ekfERtddBqscqT+bj23drggp6pIa6bPUGETvuu38u1HaNT6qJIWAzdwR78TUxGIv/0rvhBmHfWv8SGI1lai0LxtT/75xfN59daF7bsF3+TRV8qQDEwT3XS+5tup22sLLa7Io6L8A8KLsu+xopNOalzQvY75ukAOrFEJ3Pefg6zjmNMMx2ip0XzaSu5xT/Npo0EvkhPcZ447nQZeBZ0UDxL4cs+xwwqTqsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qrR5IIovUV8hqi7Wt/gCp+G+J9JQRpJy2jVPcWNFArc=;
 b=HVcR1ytmp2L/1j98DGwfLQfzABLXk2mxcCDmGtRRwORchXyfHDrIZoLcXlVnHZB/Yl7VO84eVj6e8m2YtDCFej5yg2EQwFWq8f3pEcY+vZfJp0wRRQ+OoXYWJBuiksZcewKw4l8pp02+jzZTFB8SYrEh/gAc0KxoQhXwfncYHGaUnvdUnAJouYN4l07H5HJKWGCya3CIT+6appiz98Fd+M2crUryUkJ3eu6IZlI4daC2+8noK8VtHsn1AHm3wGL/azajLCk2quSCI17YY8c7wr94vTXAwd9AbZhXszDphJB7N+/2iW5cgSTGLCmDa/eJt1XV6PdHx6iz1uEq90TmmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fab7bd72-b370-45dc-90d6-64ea49ce4aa0@suse.com>
Date: Thu, 27 Jan 2022 09:37:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 16/37] xen/x86: export srat_bad to external
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-17-wei.chen@arm.com>
 <de67a7ab-785b-f545-5aa3-36e710db0868@suse.com>
 <PAXPR08MB742092EAA94BF614FCF7EE3E9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB742092EAA94BF614FCF7EE3E9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR07CA0048.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9d18978-b777-4c9b-16dc-08d9e1703c67
X-MS-TrafficTypeDiagnostic: AM0PR04MB4977:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB49779E4B288C773951DE179BB3219@AM0PR04MB4977.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2+Ai3s9SGMDqhw21q6nPQD4c8X8evzxwYIQsPjfWcPZaP5GtkMdNfNlggKq3M57VQFqguoL+Elhh8thDwsitTU8/qm730mxowyA7zXOHllQ+lp9CX5f3EYfw0LNcGxfeJwG9GYtY8cVPA/LjSITmzapIxeinZKnY65XhEQAWVBwqhrt6tTADYc8oUanZIcnEyJDPd8s170qhlzyFxziNwOWg0bt7ZEgMroKAhLk98lJQfKXfy4aTEnzTQVFUaDY4qLs+tArLf0yVo6pWeKT1KPoq+22KJ2DoTmO0oVGQSSe9ERefBKgsFsSyXDQ15PjQIvZ8OigYmq6W46jIXXobj4ja4DlNj0SHJLzVFinSfeMBdhwMA5zQmVQS0HA7ybZMh7I9dY+yZUcQOnP60EebK+/TcEmgH727sO4t4YWO8ooJ4GF/Gi2qC1zY0EwkkPdJzTh/vB6PJPNmy+Jh3+Nu5/lDmFfaN2RJ7+ZTyAWC6vVXHm+z9yoCFE4Dqc1toUdLORqySSp8Q1At5ex7N269Zj/K5sTpplaGzJCGTx1N+F7gdH6bVkBwXZzwzPb6QMRc17PaV2fkEl6vECAxITe0S3m5bKL1q5r2KJZPQNo3iIL3inGlmanmDK5Ybh5DlmUoWGqjdEnsaUxLP+KQ6tzq0C3CBrZetomBZLCBHrzpVPLhmH9X8EXqTSmdGrqyvVSpEvXDrb6t0dtMcfAcNWFg1HkvuoNNYqdxuLxw/jxYxAfVkdsWPIfP/+QNN9fEX0J0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(66556008)(66476007)(8676002)(36756003)(8936002)(38100700002)(4326008)(54906003)(5660300002)(2906002)(6916009)(316002)(6506007)(2616005)(31686004)(6512007)(83380400001)(508600001)(53546011)(26005)(186003)(31696002)(6486002)(86362001)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?euUG9A74ySaM1yFUTtmxMnkF167I15/0FtAutEkYuB4xtrVXKWFZjZnhHiU0?=
 =?us-ascii?Q?fRwv067Z2hspoZBBfaVAsgao5pmoxavfXNHenYS6t9qC+4x0etkxktOUwI8T?=
 =?us-ascii?Q?/LI9+Xohkh+wZI2cqqScjspyRIGZD4vuNpuEzN3bdHybGXOEU7M6qBV+fRXN?=
 =?us-ascii?Q?RlM/md9t301XkS1JccZeSf98p+Z9T8i2BwqkjPjUBKzkTvYU90DiWAnoNsfF?=
 =?us-ascii?Q?t6WzQw5P4/XNoXW0Ij17kogIkLYFMYmsfNvzg8rpVWE6c8mNPIJPOex2hiLh?=
 =?us-ascii?Q?RUF5PGfXUqEWUkCferBkGbVO4LimpGxNEh+5iH9sEDr/mXF5YsC/DkHGvc49?=
 =?us-ascii?Q?XaCD1PbB6Ypev7jKiIU5AuZFlRdJIEv/CL8UPCLkiuiM8xOcEaY1iYGsDqXT?=
 =?us-ascii?Q?wSCuNlORN3GOWlvTBjXiU7syL9BZuMLx6ssCIK23orTiQVNdmdB/zmfcfOHz?=
 =?us-ascii?Q?cw4YWocQdWyGsyUITxN28adIrToDa1kzblBwCI4lWngfEMmeb5d5cN5L+jdB?=
 =?us-ascii?Q?93nNQQUFEhOw7eDwSZGxEIVH/a+SiYgyO/jL34qjPQ7mJVtougfHa3nMv0xq?=
 =?us-ascii?Q?+v9Dw2uu43WJ428SHo7uSX+IyX5a5NYnODvOdNAKIKsBAdg0tJ875Fx/XQGF?=
 =?us-ascii?Q?oOsj5oWmdLC+wMl6sXsHeQd42ejY9BbVFd3UVdjKUAdfqZjJhF8uy5sBOW/j?=
 =?us-ascii?Q?Az/fayBqJDEQoJ+OdYiE+KYILNyWBcz+XEzulBVz27HjB7A/zqb7m7bTlxCn?=
 =?us-ascii?Q?I6c9EZ+7HVX4hD41dVGsENb1eZr4dupoJsvNCVsrzcFF2qyCW7UlVNO0bKkV?=
 =?us-ascii?Q?C5xR6TtpHOO9s9Ai6lQhHPTDMT+o4OfSXLiBfR5MUQAdmI+pC96H8ikww5l7?=
 =?us-ascii?Q?GzCE62W8m3NaZmvePlNa234b5Rd9EhNNrbHp7qbK61x/uBdKtQR5eQoE6r4t?=
 =?us-ascii?Q?onpo6gRwWzWhOVdm8iwE31fPZrBipivfmZJGzR/ujWUkrihy/80cRkIWnyBO?=
 =?us-ascii?Q?8vGcZmwGmAkX4epKTTAoUNG6b9MsXUQMNrbkWrwK1FPSvzfLz1hN0Aw/2znO?=
 =?us-ascii?Q?Ip7tI9bLrx0K/bqA5oUua+ObnJh5P8rD/vZYhT+qcN6QyDtuJfeDJaaM1Tba?=
 =?us-ascii?Q?5ZTDFsmk24OvXawmuI6avnVLHqyh1OkRUY/zb0Y7hDr2uxQsj+wwRjCRguRY?=
 =?us-ascii?Q?mkakWogwiA1KrUz7ipPnw7+opr8MDyInJG3GeNTfKEmQBos9iZP3mBq90KGU?=
 =?us-ascii?Q?2d17jaYXx2AS5XiVcBe5LSrcysL/ExydUc/GmsIQYyPQnyJFqkABKGwb4/uB?=
 =?us-ascii?Q?+UvNYrk19D9N4vHwBXXAd/CTusk2AXxNk1VmTVDYumkrOGlePMVVsMbkJPnp?=
 =?us-ascii?Q?CrBwpsBJ6uqeN3/8x4ektS/MUToM60f5+68k5Q5m5WzYxvYgu7R1MxwrEznk?=
 =?us-ascii?Q?In8MQvtAu11OZE7XSSww8f8vmRK+iwwMzcgYou/rbd+0XBY9dDxU8p4vSJI/?=
 =?us-ascii?Q?vNbglObvtYip3M8h+gmjjUpcuZ1HeW3171acqQ7dAspecJGUaAudJ6jo+Q5M?=
 =?us-ascii?Q?ZCCGnoLYWE4oBNzLzvs8d8MMjwWZpAgELsHAwl7In+vDwVPDcrpoXNkgiufB?=
 =?us-ascii?Q?AY91fopeYaMJlnWcVz1NwyU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9d18978-b777-4c9b-16dc-08d9e1703c67
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 08:37:21.6705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H/722nqLfiwEISUa2MiSDTcqyuIJJKxZK4/71dvOX3pQP7i4qXM7K4vrFLJBBXePkJjpTBcHo4DSIZ6kzVdbvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4977

On 27.01.2022 09:35, Wei Chen wrote:
> Hi Jan,
>=20
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022=E5=B9=B41=E6=9C=8825=E6=97=A5 18:22
>> To: Wei Chen <Wei.Chen@arm.com>
>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>; xen-
>> devel@lists.xenproject.org; sstabellini@kernel.org; julien@xen.org
>> Subject: Re: [PATCH 16/37] xen/x86: export srat_bad to external
>>
>> On 23.09.2021 14:02, Wei Chen wrote:
>>> srat_bad is used when NUMA initialization code scan SRAT failed.
>>> It will turn fw_numa to disabled status. Its implementation depends
>>> on NUMA implementation. We want every NUMA implementation to provide
>>> this function for common initialization code.
>>>
>>> In this patch, we export srat_bad to external. This will allow to
>>> have the code mostly common.
>>
>> Here as well as in the subject it would help if the function name
>> wasn't the wrong way round. I also don't see how you mean to use a
>> function containing "srat" in its name from non-ACPI code.
>>
>> Perhaps alongside numa_mode() (see the reply to the earlier patch)
>> you want to have a set_numa_off() helper (name subject to
>> improvement)?
>>
>=20
> Yes, actually, I want a function to disable the numa when we encounter
> any error in numa initialization. And we also so want to indicate the
> numa off is caused by configuration error. So we had thought to use
> numa_fw_fault to replace srat_bad.

Why not simply numa_bad() or, say, numa_disable()?

Jan


