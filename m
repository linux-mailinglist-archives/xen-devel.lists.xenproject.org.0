Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B964935F5
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 09:01:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258752.446002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA5u1-0003tp-9d; Wed, 19 Jan 2022 08:01:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258752.446002; Wed, 19 Jan 2022 08:01:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA5u1-0003rU-5Z; Wed, 19 Jan 2022 08:01:09 +0000
Received: by outflank-mailman (input) for mailman id 258752;
 Wed, 19 Jan 2022 08:01:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uvFD=SD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nA5u0-0003rO-6i
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 08:01:08 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f498ac65-78fd-11ec-9bbc-9dff3e4ee8c5;
 Wed, 19 Jan 2022 09:01:07 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-aFHZw4pAN9CtAye-ixSSwg-1; Wed, 19 Jan 2022 09:01:05 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4189.eurprd04.prod.outlook.com (2603:10a6:803:3d::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Wed, 19 Jan
 2022 08:01:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 08:01:03 +0000
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
X-Inumbo-ID: f498ac65-78fd-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642579266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+FtF9TJjmzIV8qT2rKaIME+8pKJBchWwwz0fT/555Xw=;
	b=dmWwt8D53+lefDyM3MCqfetYEAVCHCM4wIfblWncrfdndbyMAnH1sOuf4Ou+1tVfaNS2lp
	yK+rRkuuPRC/vJS/WPU/ZZgSE487mPN5c+KkxGQw6Mrszez75DFCkGTI2YDnMHRnEZvKfm
	H7Wzp/0WlIs3o+em68U4cSspMUOL4as=
X-MC-Unique: aFHZw4pAN9CtAye-ixSSwg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hAfOTZ7Egh3rzKn4rR3p/b/2RjseSAV10fhj72sHxZI7N/cRrsY2i0a6HNlDtHuFqKdQqy4pbceNoeawhsa+V90bPQZa0v9E+LekG9br8H8weOftkIDA1FIeFYfi3hpaVOxRqLxZEBl6hmhSWobqOZWcUm1pFPvggUwpN7eimSqOJmhm1pmvRTsGKAXg9Z846K1NukPGaBJBZDd3OyNovvYpqTNbMD/fIh0aNT8x0oFAJVgp/PakmmpwgLVEW6f/qQr1v0/C2d3Axw5jFJoRJqMZsi4nfQKQFMlyC2FwlC0o5/rhyCOMfQmj0c32+gXQDcH6rY9d1qXSCtRVoMuiWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r34Yo6NQ4MAu+j7w5zvsrNHhgIa89o6u00DxsWPYDoU=;
 b=m6/ChCPHKohU2jimQ+TkAioX8APhVQ/MDHI0vzvFOiry9m/hWUILSUnFyhuBXxqZ9lbd4eKkGBcYOvhvY03jxLJdjNywj3wOJY+BKi+RZOMMz0kEHLQ1G2spW8SewfjFvKgkNbZ4oT0lHKaekbR+MmNvwjCmoXjUinXhn854CPmLJQu7qoDQck294g7i92byp3lCp40kcyRfJ3nlufInaNxuF0j+N/rykYudFDyrwxVJindrHF1U5UMDKzC+ntoTQ2VyF03p47ZMbrX8kry0qBgpvCAtVANN30XgAD1PSF3YE0kSB0TWZLzqT58heJRquYgi8Ae9xlmhH67zFUKkQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ee91673b-9bbf-c4fa-583d-a080f5f5426d@suse.com>
Date: Wed, 19 Jan 2022 09:01:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 08/37] xen/x86: add detection of discontinous node memory
 range
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-9-wei.chen@arm.com>
 <3fe681fa-d01f-d5df-23f2-6c6d8089fd8a@suse.com>
 <PAXPR08MB74209486B9983A392AB66E059E599@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB74209486B9983A392AB66E059E599@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0202CA0009.eurprd02.prod.outlook.com
 (2603:10a6:203:69::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 099cc534-8e8a-4b2c-1026-08d9db21d695
X-MS-TrafficTypeDiagnostic: VI1PR04MB4189:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB418990474EC19B34D9CF3D27B3599@VI1PR04MB4189.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QTDIxHPnqEjfnQKUJcrS/o2RtjcjRiGFpNJgieCQOV4TQ6aJ4EfiTg9tyweUI3rUay/6oiCpVYr5UNs2mqa0+OvNQRuMEYcYnpfiwPbT078WT7Dc4qT2qZenEW2Yqn/oKETwwjbyFSRCp32hfLamKrsKVyhOBIg1xgatWvVeJLwS1f1MvaZdMmlWHYbo8v2w3Yc7xI+HKyqRXQBGZpk3kBSq87l64KFSk9aJ4E+MKA9Vh/zyruHGmrER97qcDR1qWFIyOpEyjdOT+hkkraIunxSKkVs+83dkZRA/zd8tCsLezCAVxWcRr7w2KD7I/b8mjbGegkwYpei6i3Zk1DUOLFpXlFxqVT5jN9DyJgFwCQ5IoF0jX3AXWoMESow1fG0qcPH2moAo1TeUsDk9gCLRC4b4C8zjGq84AfFdfNqls/Bh5slufZkUivxOMwnvNi0CrleeIziZVSwanSgW61VJHvMKdppDPQP5yQsFB5E2F4W5MC4kNwCBgPMdl2bMirCII5gVHlgpF5MEOGVdKPUn5+dSbx5crejUuC8uyIgHNxzgfUAx5DmxNKtMWZxEAkiI/nGUCY/BZMdZcf5/28wVB/W4qx7MjQwNX5mfode9v6QI4mROGQ/zJWVmtXcr2uRWikwL1tzHTwNkNsNTw5NfJwmwc0KNAqTVK45ViaWEaIhFFievU5ublbmw4fl+udKz6tzr9KFTpne7svwlIoH61nAG1yQHn3inr5QXUysS5KAWrRGQ7jqFnX4npFrFT8y2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(2906002)(4326008)(2616005)(6916009)(316002)(8936002)(54906003)(36756003)(6506007)(508600001)(6486002)(31686004)(8676002)(5660300002)(26005)(6512007)(53546011)(186003)(38100700002)(66556008)(31696002)(86362001)(66946007)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/D6m1GH4/4Mf6ag2zjV7yA7BvfmiWJY1h6wiBpwzdK44j3hbpQBJpnIY5XmI?=
 =?us-ascii?Q?RQE+vS5c27KBaG26M5gHkk0HTXSDF/CTHVlhAwYunlxxnXbhuB0f3JSmMyxT?=
 =?us-ascii?Q?FFBd60+dKWlxXht9sbavDejz36XCCNhAlSOyYzL/gOaHA9O6RWNjyecasd3Y?=
 =?us-ascii?Q?SWUoGwWgGVd+mPpoJ/ZvZy45iUf4EmXzIGkkgQPOtFMpYapByx9zUwSwte0q?=
 =?us-ascii?Q?Z28h642h9l9TpzourmFcpZnseO0rtTXSkFyEQXjrY6zlFWVeK/X0bpeaLb5H?=
 =?us-ascii?Q?HrziK39uKyLhxz/ikzI3N8bl8A3KLdVjof/oh89X6/vUTPmXFTEx5/oNk7ZR?=
 =?us-ascii?Q?HDCG3S/wM0yXQx/qwCBg/9gW0+Vs0aDkw2vL190/h0JSnCLh+soXP8vsgUNK?=
 =?us-ascii?Q?M3wcjZkAIswZSRU7Y0VUUhnw4r1DNohye7Gdn5XDYICsmhJxNuvu6KuEHyfA?=
 =?us-ascii?Q?BtztBVtq+AvWdYFeuRQcExLqSWqSzjMtYGTfWqa+mIKuJxiPBlNskVM2UB+w?=
 =?us-ascii?Q?4YNTG/C8vO2lNBHRa4BJGhMQukzqJjcQKWV2ru9ga4LjDyEW8CA3erfUMQQe?=
 =?us-ascii?Q?EtUI8xgOO4UmBRgyUC4mtQOtOkC/UDx/DqtyrLv8U0GQxJshhrwZJOo/vz6O?=
 =?us-ascii?Q?N57FsddYcXypJdd4oD4zqKpbF/ZeznBLJdSa86OzOhxGGeTWzpYtqy3ZXbU0?=
 =?us-ascii?Q?G5mLwYpkwE5Amq3sJyYhyFECi05cWKFO2sF/MCYyTFYyRBRF1cIhSkck2zFk?=
 =?us-ascii?Q?jOayIT5DdqolxPX8wXT+UfISFOmNPeSgRS9kYbr2h/e9L/fow8R3J/+rAhkt?=
 =?us-ascii?Q?9/qymqrNdBBQxQtqISsvSmcbpqLRfVtlQiZYqG5jRzJnwxqXhm/0qUQIxhwa?=
 =?us-ascii?Q?eRvNFR1F/Exl5fDG7CFrZdvS/UB+yH6rpM6HT1//zgySPIMqr3FX8wM+eTR4?=
 =?us-ascii?Q?R1xn3XCpUDH7IMh30rABTJ8G60vOZdvrPCqfzdoxEZfCcNhC424dsExHT7Zb?=
 =?us-ascii?Q?LdgX2HfY0vCrtUptjc4z9b3xoREH5vjxAUoqDipIUm9QfTe3hg8XZngQ2QZA?=
 =?us-ascii?Q?38IJOVPzkH8OsxP412oUrpocmDVyfX0lumgJqge7vlrDlTOZL6xj4WEB4ZNX?=
 =?us-ascii?Q?nicyZPxpKctgVTtiX6Cyz12if9XKWTDKWETiqfHhRsP986GT3Nolbl27dez3?=
 =?us-ascii?Q?CWZc77wtKZajEnqIohZvF/fIyUmvoguIDJTKn4xEwAfpM3kihQPF0M+gEK4j?=
 =?us-ascii?Q?tGHotdQBwzAaEzRgpyDGVAPMtI9c1mkzBQqQTHLGhhYd64zzvPblZc8tg4nT?=
 =?us-ascii?Q?qc8meVZFcWwGbH59jXAmzK/zLixvmiEPsuIN79HnHQfLOSX6sdoPypWZfS8f?=
 =?us-ascii?Q?XiNL7dPFADpo2xo1ESxHh8d059cwW9ldFMIwLR682S6F15bTzwyYny5TycVD?=
 =?us-ascii?Q?C8Fs1sbXbMLM3ccJOkeqy4i+iSFPtnIVWg6fyUDbeGHShWtAQZcECkYzfnX4?=
 =?us-ascii?Q?xVOVQK6WaFZpnngiI7uJRiOTpkMmA7eE6zAYMiWMdHwj111BP3+mJEOZL0s3?=
 =?us-ascii?Q?+Y4uGNUGiar32Nt55d6wSCJ9llVrvXSXOn8etGIGJMIlFNB9diVl36KEeRZt?=
 =?us-ascii?Q?8t10trebClzNkeykEHOFQro=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 099cc534-8e8a-4b2c-1026-08d9db21d695
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 08:01:03.1521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hvEEtJ1rqL0dpA0YsAzIcyoTJvB99oBtSvGxn0LyokE3TSwoImDr2ZD4lg0OxuGAb4s3COAxbzUkWYtKb6RcyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4189

On 19.01.2022 08:33, Wei Chen wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022=E5=B9=B41=E6=9C=8819=E6=97=A5 0:13
>>
>> On 23.09.2021 14:02, Wei Chen wrote:
>>> One NUMA node may contain several memory blocks. In current Xen
>>> code, Xen will maintain a node memory range for each node to cover
>>> all its memory blocks. But here comes the problem, in the gap of
>>> one node's two memory blocks, if there are some memory blocks don't
>>> belong to this node (remote memory blocks). This node's memory range
>>> will be expanded to cover these remote memory blocks.
>>>
>>> One node's memory range contains othe nodes' memory, this is obviously
>>> not very reasonable. This means current NUMA code only can support
>>> node has continous memory blocks. However, on a physical machine, the
>>> addresses of multiple nodes can be interleaved.
>>>
>=20
> I will adjust above paragraph to:
> ... This means current NUMA code only can support node has no interlaced
> memory blocks. ...
>=20
>>> So in this patch, we add code to detect discontinous memory blocks
>>> for one node. NUMA initializtion will be failed and error messages
>>> will be printed when Xen detect such hardware configuration.
>=20
> I will adjust above paragraph to:
> So in this patch, we add code to detect interleave of different nodes'
> memory blocks. NUMA initialization will be ...

Taking just this part of your reply (the issue continues later), may I
ask that you use a consistent term throughout this single patch? Mixing
"interlace" and "interleave" like you do may make people wonder whether
the two are intended to express slightly different aspects. Personally,
as per my suggestion, I'd prefer "interleave", but I'm not a native
speaker.

Jan


