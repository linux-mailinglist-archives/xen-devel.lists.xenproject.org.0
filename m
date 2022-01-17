Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A50349040C
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 09:41:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258018.443838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9NYl-0002dg-Os; Mon, 17 Jan 2022 08:40:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258018.443838; Mon, 17 Jan 2022 08:40:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9NYl-0002bH-Ka; Mon, 17 Jan 2022 08:40:15 +0000
Received: by outflank-mailman (input) for mailman id 258018;
 Mon, 17 Jan 2022 08:40:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZUQe=SB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n9NYk-0002bB-TP
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 08:40:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16a3fa14-7771-11ec-a115-11989b9578b4;
 Mon, 17 Jan 2022 09:40:13 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-BAs_4uA0Pbin6C-3kX53Dg-1; Mon, 17 Jan 2022 09:40:12 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB5667.eurprd04.prod.outlook.com (2603:10a6:208:12e::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Mon, 17 Jan
 2022 08:40:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 08:40:11 +0000
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
X-Inumbo-ID: 16a3fa14-7771-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642408813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EXBI+jbDpbVm+39fD7xags9I7eg3O563CUjjNpqi+HA=;
	b=NmaEpNgtR/HtCqa2qd8+BpAOdRr49uT79PXljC6AMK/Gl3heb97eYSgn+XYGxN9cHvaUQP
	R/vTkLGhROi2cefkeFG7dBr8Ygu7HAuEW7iMoEyy/tSlrMT6yAwOnwnJhl6Ih5oWmFLMLJ
	CsbEKiiNkyEQAQVisSO1pBMvmX7iO9E=
X-MC-Unique: BAs_4uA0Pbin6C-3kX53Dg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h2etC3MAfhN/R3qgny0O7g4Iic0evGA3TCOLc22tpw0Z4tJirCYlXNjlb/ZOn/AwCG15IqmSDx0tqdnIh2sEQ5kk+uVl/3W138Yzs/KAIfG85THQO5IhJxTNLDRLzHpKrvocEebLA8YCge2V07mtoqQLK7LQBp4dN426BzrPiUbQdTyrEETM6fg89o6C6d+z16PDVBLz2Sa/RpUIE9k0H9osMmva69asO/qnUVDAI4koChZZQIXNBK4Yn2IsYWBE5iyCX9cVc3LXKV/VDRogqcU0Cc+Es7aB6BGUMCoOjyWHS+wrC3SUjAyprUBb/5YUtFnDofu/sH+u8gEtWro0WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Lub6VoJCRb/tOK8VZv1GPR4pVEDTwDx13vn1yxivjQ=;
 b=CbRN5HUMsS2ZIgmS5EFVAJyXKcees7l2Kqp+5rS7tvosnJ+CDRJe1WQEQPADrsk1nPniNXryaqr8O+VhlsO33Mo8b1JXiTVqNgB8DfOizlzZbZWp5EMa6/wMCcEvyyQKH+JVus2ycozAqO1XMeV+41I11OJvYUHQk0v6HoNqSY1/vbEWWP3jQhatl9a5PEVxoPvCjAo7x313Uk90mlqPnl7ru7tyVrj3VLCg5Yp+b38K+XGRJ2LamyEFWGXwLVDD50ZG3oLvWIeW4w/Pplp7q7dNJdS1mYDvX5x6LpZpvo/ohE2PR69DLTMv8V5ntqbC0J0VZpmn/BIetAH0AzKnhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <25c6055c-0ec6-863b-6a4f-6605f680709f@suse.com>
Date: Mon, 17 Jan 2022 09:40:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] x86/time: improve TSC / CPU freq calibration accuracy
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <595b3447-0eba-dfc8-fa24-6bb8b964a137@suse.com>
 <85939a58-ab7f-31ea-1014-91cabe746046@suse.com>
 <Yd6zEgfPTdBdFR2y@Air-de-Roger>
 <8c18b93f-8da9-ff38-065a-5050767d17a0@suse.com>
In-Reply-To: <8c18b93f-8da9-ff38-065a-5050767d17a0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0077.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d42fd3d5-36ce-4c19-7165-08d9d994f938
X-MS-TrafficTypeDiagnostic: AM0PR04MB5667:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB56679A4B97CAE0A7918A65F8B3579@AM0PR04MB5667.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BKyswKbR4bVWWQuj4EnTQuCEbXOAY5r3g8PakUc3VhgWl3/3cBFm9MpXIm2j0OkDgb3/x6+s7r55CqBZq4+sjoNTPyFlzcZTTkrvGXLcUutHfwoMANnrh+F4GPt5SNlRNwaca/dfbFherdSCCaj3/HZZfsZnMmEyBWQmnkCYDCnLe6mrMdVSEqJZOxXrX3Rb3m3is7aNg2B+DUeqjg0vafcTQcx3s6Pj/2Rk14QT8Y+IAVuzTN+INnUHl2NEoYmVp6ILuoGIEnpxqGT4TQP9Ri7ou+/oeIfqy7nSVwj4EWbtIDj+IIZbOAuQeRZaZ+tnAe2wK4vtP9XgOkBtKPv/TFlxz1SalahCFUJ8deWjhGAar1oAz6TESS3kjvJ1xGxg85K9JiNagXT2+jQmSe5Y9malmLPuEA7uNwunATQ5LeR4ib4QhwaeH7mzZfpB+CHDga7NCsSI6Fx3vhvNlYGl3j5CwcfHFq2rJHqj2zfc4oo1fsXwERYBrddfydyA102NsYgGgUYlHW1Nl0LpAdKpkqybdsHQpsMpKiPPSI1c0o2BcaN11vtBtsasdVKmIXNNWjlrawmEVaYopKpFOVY7+GmAfieYhEp+PD0jOuAbbiP8AQDgXUc60tckN4SH1JDAgmJHKwPSmg/hXob7S1HXRWWjvrHlt5N3M6NCgQPOpwOD3aTwC4ZiDs7H+4B9RKhPV5mrcRBJTGEqnnkdiZRyYxMDYECwyTjGwdhef5Mr3ypjUek82RMx0VXbwFr83F8kB/RSUeArmdCGBPeAhTIDdlSQL93BJS6Nxri+qzHXxEYLhFIWZt7L6zEvltBo6W4y
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(54906003)(8936002)(2616005)(4326008)(6916009)(316002)(2906002)(6512007)(186003)(508600001)(5660300002)(26005)(66476007)(66946007)(36756003)(86362001)(38100700002)(53546011)(6506007)(8676002)(31696002)(66556008)(6486002)(557034005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ytkt6lsXQvatz92IA9SFKXDOfMgLMDV3L7+psW1bVRaFr/JaPAIH+Yhw/rfE?=
 =?us-ascii?Q?S80n1219Dy+0zZXgMaxsdTxFZIhveI4O9T6vomznde0vKq3iUtbPkeVoGoIB?=
 =?us-ascii?Q?B0jVPV6RMy1aXTrulob+p2sEIdlLOTW1rV1qye1giodlOYku7GpD8IGkoYJo?=
 =?us-ascii?Q?TEIuu367pOREOrHPpxE3aKT9dgDweX65WpSmFqzL9ew5kRT9hbWykuuNP8hq?=
 =?us-ascii?Q?A55GgFf70z6LAoZ+4QhSnc3UGYuYkT3BxOXe+7MJLB+jJhL+YxJqf/9XhGxY?=
 =?us-ascii?Q?3HoTosrrsNgR6IZRnLTtWGH9onfU3ZkOX7ZV3/zK+OOTAczqkXPw25cktjeC?=
 =?us-ascii?Q?wBMq2Vl+UIPiPWd0C/3jXIQNS06NJuxAhzQzxfl9kX/u2LWws6ajMkrXRoNC?=
 =?us-ascii?Q?dd4n61KKTkdsgafAP5vKMC/z3wpU7+eqY1fpN0S5L34uS4qE2++gpc5Jolpy?=
 =?us-ascii?Q?UGAinkzujlQDDYuPNYP58Q4jey0K/cGBaoaFwEO/RsZnCLavYnmjcM3+e7mh?=
 =?us-ascii?Q?1SGs0c9E4BsJKo2z2TYxoLcwxC3dv9DEFb5wfIAt9O8X1qqbXcMo60eYdy97?=
 =?us-ascii?Q?OCjVXkjkKipCOOmCfmU9Xlq3LBpX1JENvhWwPi5etJaxLN+qbvxXojAoLGyz?=
 =?us-ascii?Q?/tvm3G34gxKWo+bNOb2QkBBi0yRt2b9ACJq5BHt+qSxfeZK3+Ecz3y8toKgB?=
 =?us-ascii?Q?74Hv7HkCiRy48k6IHKmISyR/5aQ9pUkHoVNdSQUCwKnC2EumMW7sKFMb2T1Z?=
 =?us-ascii?Q?bL8oRKHHgMvqS6Kwq1hdwpMR+y7cLX+KWE/RxNbS5GCXrTjpSU3yv8nDiwgv?=
 =?us-ascii?Q?oPHZYmPqbLpDBZ+DBYvjxuu8iP+Zpfe3QbcoCiT3UTTuLg6Ct9Jkv9CJanlF?=
 =?us-ascii?Q?hLDHsQ7tD246ODyolk+ndgb2tQ71oj03haAZn1GAyruo9Kdsc2mrQV2JPnJ5?=
 =?us-ascii?Q?mhwAdrJmJo8IX5CdDn0/UPaY/8aIXAmYQB86BNJ3hHwQAKvtDo7/jVo//Rfv?=
 =?us-ascii?Q?C7Cw2zoa0Fz2GbWI3yXOb75Sbr8Ttrhun2Ry2LnoTKgNalEnOXWMnO/XOgSO?=
 =?us-ascii?Q?6rzEkNXYHMcjbqWHRYF9yKt7EuzrinAaVgcUWM1bfrTAZQlMuGSmfy/WuLOt?=
 =?us-ascii?Q?4BK7OrfX4pNbqDKu1l7hfQUNIu1oAoAn2E1qBRc9xDWY9EFEEEX+JvD4A7tu?=
 =?us-ascii?Q?dD7kWapZfZqbPjKFXucEmy5t5LEziukU2+uwOqRt/Sqj5xgDlnnLTIMvDRu9?=
 =?us-ascii?Q?MCsq/ZrRb3Cn5AMNMZeuyHPz0oq5p0a1jolo1GTRctIP6y6+LmsnMWnGDU8U?=
 =?us-ascii?Q?BHQ2DQgaY3dWdtGJr9dHb4fvXPJmnt0rTszXTIZspZTKez0nhDZarqNTz0/C?=
 =?us-ascii?Q?PAjjxbcPal6dJRa9x/uIADux5T8JvYGEOMNZIF+EMVTk9F0CRbbXjOyfBPif?=
 =?us-ascii?Q?m8B/9kH9wfFQyO7CKwN4M43/LtLXfosHJ6eapCivtKRz9u97gJ07kX9Aujzm?=
 =?us-ascii?Q?dPm+U4srVzXSShCms3z2PKQfsUqiOAA/Svhube4ilP0b81pdMV4lqrtBKuTb?=
 =?us-ascii?Q?3QIfPF4aDm3pfhZdzLmc1/zRAtmSjm4pTJ2Jgip17GTgpYnBugyWRJcbwLTg?=
 =?us-ascii?Q?nI80AKmGBw70OLmR34yvaEs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d42fd3d5-36ce-4c19-7165-08d9d994f938
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 08:40:11.2337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2qkmCfN24A3NZL5daURqyaR/VoXuxIMAKouqyzXdYQxb4t3YEKxPGuD02Nt5khAQaE9VQIp7uMPxWOjkWlVpqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5667

On 12.01.2022 12:32, Jan Beulich wrote:
> On 12.01.2022 11:53, Roger Pau Monn=C3=A9 wrote:
>> On Wed, Jan 12, 2022 at 09:56:12AM +0100, Jan Beulich wrote:
>>> I'm afraid I don't see a way to deal with the same issue in init_pit().
>>> In particular the (multiple) specs I have to hand don't make clear
>>> whether the counter would continue counting after having reached zero.
>>> Obviously it wouldn't help to check this on a few systems, as their
>>> behavior could still be implementation specific.
>>
>> We could likely set the counter to the maximum value it can hold
>> and then perform reads in a loop (like it's done for HPET or the PM
>> timers) and stop when start - target is reached. Not a great solution
>> either.
>=20
> Not the least because reading back the counter from the PIT requires
> multiple port operations, i.e. is overall quite a bit slower.

What's worse - even is programmed to the maximum value (65536) this
timer rolls over every 55ms; as said elsewhere SMIs have been observed
to take significantly longer. I conclude that PIT simply cannot safely
be used on platforms with such long lasting operations. As a further
consequence I wonder whether we wouldn't better calibrate the APIC
timer against the chosen platform timer rather than hardcoding this to
use the PIT.

Jan


