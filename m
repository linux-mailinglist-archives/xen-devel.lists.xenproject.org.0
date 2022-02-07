Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A404F4AC269
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 16:07:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267097.460805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH5ah-0003NS-Rp; Mon, 07 Feb 2022 15:06:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267097.460805; Mon, 07 Feb 2022 15:06:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH5ah-0003KF-Ok; Mon, 07 Feb 2022 15:06:07 +0000
Received: by outflank-mailman (input) for mailman id 267097;
 Mon, 07 Feb 2022 15:06:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nH5af-0003K9-FS
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 15:06:05 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 779a6970-8827-11ec-8f75-fffcc8bd4f1a;
 Mon, 07 Feb 2022 16:06:03 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-bFTQhUw3Mw2WfNvTQZYsuQ-1; Mon, 07 Feb 2022 16:06:01 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2992.eurprd04.prod.outlook.com (2603:10a6:802:9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 15:05:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 15:05:59 +0000
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
X-Inumbo-ID: 779a6970-8827-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644246363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=15dLJ1kaBNPyyCxQhByvkocAZParuX/lDB4KtnLwn20=;
	b=QdyHavaO7Q3NFRnBxwesBuOs0D5CPl7rmHaAxmZ+PUOOFRjHtYiVoTWqOGvFeYo6bqRs8F
	IfPnBOo+bekNH5tUZju3NOVJNmGBB73SuWCOCbaCyi9QP/fm2iwvm0hgaMEtios+N9G5Hu
	5YNHVCMWqOIZNBlECzsVZ35C0P/pcDY=
X-MC-Unique: bFTQhUw3Mw2WfNvTQZYsuQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XzT3TL7qZaQ1nHPjkstil2CB6QqfY2Z2hB68Umftx+XS14tQOe4j0LEpQYTW8/1Or49ggtdYhOEbKab1SOW7FqbwTUl7z8BDuDsLDW/PL2Fozir8vo7ZwLXXh4i4x6RYbGfvSVID3mnrOnMEx2B5B0eQgey6aQe7kYHa0hvxsRyZSlhIyKNDoAA27MmmpxA9wqwh93uNevZbO0Vp0rZDqTJ37Xmh1sPXVSeMtu6mGFj0fiItI2xjaQSnvE0Ikx+KYnfglUvumdJkMR89kJ4yf/sygcDSAMNlUkecmnAMYNeaQOVd5fVQdgbcYOm3MUGGl6kLMwKR5YfxuAgT5F1AqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15dLJ1kaBNPyyCxQhByvkocAZParuX/lDB4KtnLwn20=;
 b=kHnPr2PsUANVvyBboHY1FoFHHIJQxbQ9lBCxLqddg4YTU9Ku1VabRlkRiZ9zpXKjur90c1B4QwGd5ccU956Omn+w9Ra4NBl+fKVBr2hnBNCBASUN/U2LaRuWijsyEnOsmtE2hxR41Gg46x1JW7vSzidwAqafyO9i3B36XQQwOhPX16Ok7vSl1u1hrA/2lpK+llmc1yfnYwSU2S+np0WSzKlyNp8AZDkly+tBaXXvVNS8ahkHyqLI5RDpKvxjFj7W44nTe5AcBE+EJDrr9/HcKYXcSZhqymBHQ1VbTVeYhh4sKc5YOQzjGwjFn6H9OPTunDt6+w4R7t3qKRJRLGue8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f6f16729-8404-6703-11c6-dd7a4ebc658c@suse.com>
Date: Mon, 7 Feb 2022 16:05:57 +0100
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
 <dbef1c95-818c-427c-1963-75d584843cff@suse.com>
 <f34cc940-7f5f-aebd-60d9-d1a3d85d1283@epam.com>
 <8f35e7c5-3193-4b10-ae25-df838e2262c7@suse.com>
 <6b4ea90d-cc9c-edf7-e579-a84d72431d7a@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6b4ea90d-cc9c-edf7-e579-a84d72431d7a@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR03CA0011.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09fc7c37-b053-4958-a60c-08d9ea4b594a
X-MS-TrafficTypeDiagnostic: VI1PR04MB2992:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB2992EFDA72C526907D5CE327B32C9@VI1PR04MB2992.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aHnONTeIi3B9MTCBfL2GkQmqzkeuNkCzKPH8dr24CWn5/zO0OUL24hkwIiYwm4ePQJCXyryi66HU0sHyRYsslG2pBTMtqlYsQv/D84Hbkn9lciTyMf8NQSb2Qzm+UXyNplIdh6CWj2hZtqFCWvt7kqiMwtGw56RHtiKkK9R7EO60WxP2sgjYByRDphpTrncHr7USL0PXrtn/uj7usG0ulL1Fx6DOhM9hZGIQ3CAcTmYgrT7dE3oEAcXvn9YRk6hkZrEY+y+ihzqZMUN20UXNo/L6BUGbnT2Tu0FQIp7OJ2YhoQHmej+Onces+TCxxyIxJL5jZyTyj1YQfiwOWb4PlSlxboU/xPD8PNY56tXT7Pnb1ykaY6nIcZ5H94xO5IsYdzBCrLw/d46LOF/bCCJchnGCmwZYmbemSfbCB1vAHzWergidAIHpBeo3fnFdk4LQgc6khMVIbEDT5TghpxMtVprSntL8wjzJAyum0w+QtHiVj+xNNsutfTDCQN7mp95/fufo+ZHLr8sMRVOzOqWoaWLpjZo3YSjSqht67Uy6nacsTNy4fcYn/CpDRUVYNXzkrx9xgmsq9Llje/hMWGCzRLTFb3Z8EF+6rjjPB/SH1JUuiuFubGA/nj2CzpnbJo3XLW7nbWUHfIzOUUYNL2Nud5yxeJOm7koUm3g96J7U1iXnTbOj7oyg7HbfwOnnx2rEFiWczZRD/hxlswJW61pq6LFImpm5Yzng5l9MdGrtscw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(7416002)(6916009)(2616005)(5660300002)(54906003)(31686004)(6512007)(36756003)(31696002)(186003)(26005)(4744005)(316002)(2906002)(6486002)(8676002)(66556008)(66946007)(8936002)(66476007)(508600001)(53546011)(6506007)(86362001)(4326008)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVZCbHNYUVJaL012ZmUxREt1NmxOZUd5MzI0L3V3T05IaTU4L3JkZWd2Tktj?=
 =?utf-8?B?aGdCRGk2VUtvOFZNbGgwQ1RnTy92S1BSK296WlZBTUl1TzBFUVZLa0xJNDRl?=
 =?utf-8?B?S2JHOWFIWWNwRFQ3WlNzNDh2c0xYSldiVm5haWRMZXl3ajAzSWlqdHhHYXNT?=
 =?utf-8?B?MDhQbjB3Q2I3bFJ1REdMeUVFSVpuQlphUlR4dElZckIvRWlzSGZYSlU3WnRV?=
 =?utf-8?B?ZDdwNklnQ1BTeVVSaHo2d3g4aWQyYlBJM0lYREttT21LTmNPYnloa2Y5d3lj?=
 =?utf-8?B?T3AvRzZWWDBwNk1uVUw2WnJGRHpCSDhhYWZPMEk2OGZXQmxCZUhjR21JeFM2?=
 =?utf-8?B?WFFJaG1FOVNES0E0a2pYbnJIVFhZS01EbERSN044SG0vWlc5cVREVGR4dm1y?=
 =?utf-8?B?ZTgrM2Y1WktJUGI2c04yTDJuSUVYb3FyUDhsS2UyS1Vra3RuemVFem9HYnhm?=
 =?utf-8?B?VmNTV3VmV1lwU1N0WEdhU3FpUDBvczloNnRXYzdQSzFTT1kyblhCZHdtQkZi?=
 =?utf-8?B?MWZlOUxSTGgrUFd2QS90aHllbGM4VW1pU1dpMGZ1WVZWSkNPcWxLL2NiOEVo?=
 =?utf-8?B?U2RRL3p1cXZpdXdqakhyZE1lTnZUT0kvOGppblA4TmduQ3h5Q2UxQmsvTHp4?=
 =?utf-8?B?dUlwMjM4UUR5dGxPTUVFcWx1ZTJsUzl0TWtHanl6RldHcGc1RnVJV29oRTd2?=
 =?utf-8?B?YmhWQ0EyNU1ZZVExYzJDWG9ITTRnRzZYOWJjenBCY1JPTUVjWXRObTRGNXR3?=
 =?utf-8?B?bFJhRmhkM3RSQ2VhQlowMUNPaTNrY3MzeGpTWHZzLzErdHpFSXYvSnRidEli?=
 =?utf-8?B?WkpySnBvWGhudkNabitTdVBVNm5XOXpIZnpFNENsNzlvOXZObHF5d1VMTXRw?=
 =?utf-8?B?RmthODFjcER2Y0crTXVtWGxuUXBsemhxOUlTRm1tWmRSOFFRdDRZMnB4NnZ4?=
 =?utf-8?B?Rjl3bWJ2QTdHV25MRkdQN1NPK01DOWhWUEJyVEU3QkRibkxCTkhSRmRkWG5Y?=
 =?utf-8?B?enlLQ0RkRHExK09FQUN0NExFS0Z4Vlp3MDV6UVdOQ0J5THNjdHdoN0twenJQ?=
 =?utf-8?B?RDduOUlCR1kwd1R6WHZTaTZkOHVmaTExUlo2WTE1NHpDOWRuV01BTlNCak5w?=
 =?utf-8?B?RzB4Umg2b0JJaXdYL2s0bzJnb2Y2RGIyZXpYR2pIVEdjWHlkOFVySElwSXJW?=
 =?utf-8?B?Z2FIZTltTU5MRmFTZ2FocDNDeDRQMWtSK3JxejFDd29kQ2xueUN6OUYwUkdQ?=
 =?utf-8?B?U3A1UVY3UlVEZnB4bG55NitvL201Ujlud2svSkdBQzZnakV4dnpnT0hQUFhj?=
 =?utf-8?B?dEFQYUlWdy91TGt3V21nenJEc1RJU0RBNnlUUmdJSXNLaWsyM1ZDOUVmUll5?=
 =?utf-8?B?T21EK1d0UmVMMU1ST0Npc3BYQnVOcWVJVERwcGZORUloNTJiQ1RWZllQWnhy?=
 =?utf-8?B?S1VNZ3NPdHJidDBhVlZIVithUkdZLzliYUxWbjB1TTdtbEp0RlpNWWFETWEw?=
 =?utf-8?B?S1JOMzVDOW9rVFhwNkxPOFl3RGJONU9aNUIvdytEQ0g2TGh5d2s1SHVzRnlE?=
 =?utf-8?B?Zm9iSEFXVUxuWS9PenAwclk1dmRLNFZnQTdiZ1NNZkwzUDRPRkJ3VHRoa0Zv?=
 =?utf-8?B?VXdMSmQxY0hqaFBsS0FXQ0xYSittWnVNTWc0R0JxeVpQeVNNeWt1dFBlK0gz?=
 =?utf-8?B?L0VrQ1dDamNrQVJ1cktaR0UxTVJPc2lLejBUeFRzdXZNbkJ2L25id0lWU0Zr?=
 =?utf-8?B?RUxGbUFyTVUrSDFzV1o3UjkvMitiSXJWb3UwcGVhVzRVdGY3MzFoblFoSVln?=
 =?utf-8?B?ZWdKaUFKUmxOKzFoRVJoL2p3aHFOeE85V25GRHBDaWFnOG9wVktJYTQrczkw?=
 =?utf-8?B?bVlPNXUwZlVnZ1p0RTdoSDQ4aVZIT0ZRaDdweWQ5dm00d2ZWMlZ4QVRyUVBo?=
 =?utf-8?B?b2Q0WDVpSWR6UkpaTDMxak9QSzdtRVFnTW4vRlFvcFhNanhOdklzK0VrUmVv?=
 =?utf-8?B?Q2JVZzUwazMzRWpkVGk4bHpNV21nQTVkbEZIbUtDYzBtWjBocm93UW1nMWR6?=
 =?utf-8?B?bmNkOU83Y0Rpckh5ekJCa1EwRHR3UWM1eTM3NStTYTZmQ1JZWnBrYzgraHZs?=
 =?utf-8?B?MWdLa0J6QksycFkxaEVMc1Q2cmhHWjFYUHZ0N2x1b1ZaSGpHd2RoMG5Sc3pL?=
 =?utf-8?Q?eI94+/zd2wdIvBkek9iEbM8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09fc7c37-b053-4958-a60c-08d9ea4b594a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 15:05:59.2553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9sZYKry8o6gQW8xafdzW3WntSxUvoHRz3j6puK9E4VJ/QXWZ0vW3qqqxCgP8Qc+byowznanxTi14ZNl/zi4/+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2992

On 07.02.2022 15:46, Oleksandr Andrushchenko wrote:
> On 07.02.22 16:31, Jan Beulich wrote:
>> But: What's still missing here then is the separation of guest and host
>> views. When we set INTx behind the guest's back, it shouldn't observe the
>> bit set. Or is this meant to be another (big) TODO?
> But, patch [PATCH v6 09/13] vpci/header: emulate PCI_COMMAND register for guests
> already takes care of it, I mean that it will set/reset INTx for the guest
> according to MSI/MSI-X. So, if we squash these two patches the whole
> picture will be seen at once.

Does it? I did get the impression that the guest would be able to observe
the bit set even after writing zero to it (while a reason exists that Xen
wants the bit set).

Jan


