Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4995B360961
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 14:26:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111102.212403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX14S-0002Ge-BS; Thu, 15 Apr 2021 12:26:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111102.212403; Thu, 15 Apr 2021 12:26:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX14S-0002GF-8B; Thu, 15 Apr 2021 12:26:08 +0000
Received: by outflank-mailman (input) for mailman id 111102;
 Thu, 15 Apr 2021 12:26:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E4R4=JM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lX14Q-0002GA-IQ
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 12:26:06 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 90076cb5-6bb8-47f2-bf43-520b773215e9;
 Thu, 15 Apr 2021 12:26:05 +0000 (UTC)
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
X-Inumbo-ID: 90076cb5-6bb8-47f2-bf43-520b773215e9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618489565;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=zxhkqwoa0zLwrwg5FgmIMZlxI6mJ/dX4grJonJJzTlA=;
  b=K/kA8wxSoFpGYEpyRwG4AUFCTiIG/03ayyEDnZ13sEuUyb1McwoZYCpB
   rk69GdNDWtgqx5QE+5hMttpDgDOh9VAGCjCWbVk1DJe2wYNLQqpgkRoFS
   WQUaEbp3yZ4LE8lidXK6Y8pcy8kXIETPmOykZ7STuCUNxjHWFx4FEGXAa
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 2lx5JxxVqRpT6QhNxXjXfJQpLO8y5hPxS3A4s1tEL9e451qxzBrVLo6EeRp9uruAnpZw7R41Cc
 aFmpkXDsq/Sr85IuUOk7E9w+WHvJgFHHJxAQhO3N3/CMFoOpyHbGFO44hkAk/CsYa6cZ43sV3F
 EcjCNA+odRvdUH9ItefEMYBdn7JQ0XhvmynJt/aOwUJHQdzhM9uDIaCnZXAve6ZV5pwMjwCwcx
 4ad9qQFItEsC753RnNANmQnRY0KmzwSOtprrwVV1nkw+T6mK2HqvrV++B1oQTibk+cJD4DwYUK
 BeM=
X-SBRS: 5.2
X-MesageID: 43146561
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:JmAhaq79q7NmgAFDHAPXwRqBI+orLtY04lQ7vn1ZYQBJc8Ceis
 CllOka0xixszoKRHQ8g7m7VZWoa3m0z/5IyKMWOqqvWxSjhXuwIOhZnO/f6hDDOwm7zO5S0q
 98b7NzYeebMXFWhdv3iTPWL/8O29+CmZrHuc7771NACT5ncLth6QARMHf/LmRTSBNdDZQ0UL
 qwj/A3xAaIQngcYsSlCnRtZYGqy+Hjr576fQUAQycu9Qjmt1iVwYTnGBuV1Ap2aUIs/Z4e9w
 H+8jDR1+GYnNyQjjTd0GLS6Jo+oqqd9vJzQPaip+JQBjHligODbJlsVbuYrFkO0Z2SwWdvqv
 bgiVMNONly9mPwcwiO0GTQ8jil6hkCwTvDzkKVmnTqq8CRfkNFN+Nxwbh3XzGczmhIhqAa7I
 t7m1i3mrASMDb72AP63NTMXwECrDvOnVMS1dQ9olYabZETc9Zq3Ooi1XIQKrgsNgTg5rsqFe
 F/Zfusnsp+QBehY3fVsnIH+q3UYl0DWhOPQk01sseIyTRhnHdg00sCxMAE901wjK4Adw==
X-IronPort-AV: E=Sophos;i="5.82,225,1613451600"; 
   d="scan'208";a="43146561"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wf6u+vptNOyoluZTjIU3xdsPmslclTOmoELPEc78NyjcswU8rcr0E4FvCfII7YMV48Wt2KiFshN0nJFUvMlqLv0w3xBjHcDXf++i8WZ4FOkoRR2PdfSebw89SyV1em14rxswiSZTpifkXPsyVujrFlJXi/2hY7YJuK/s3bvWi9gjeXIoAVot73DlLvzGfwooGvVGuKp46c5/0mlmatUQVPgFZd+XE9tvZnSq1IcSFUKwNz5EciX13sn1XFVBRNOi4AFQzHsWc0a7EuZsKfpvA/OHav6CMAv3kJjx/v1OSH9efHZ9ZexRUDTzyxEZXbl4TYBXD5kXRjD6erpvcLDv7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zxhkqwoa0zLwrwg5FgmIMZlxI6mJ/dX4grJonJJzTlA=;
 b=eUsA3kdpZ//KNgZJH67PqMaD/9d3cCUlq+KlTKHa1qVO1Q5ZTRugOmu18FeLrKk/55IsTatU/K9QqgOumD3kW21GIwgyp1XogNr/o/LNZSXKRmkDiWGR0BjqSlxWr4SNE+eGGjuplblOVgYUgKLQIMnQco/V9OhKiLetXPsVo6CPCLYhtJEDrqHYQRcT6GKabgJBVGfxx7SWqQl9ltUobivXnLNVFm5JvEKlx1WTq9bZ6Y6QtdhxKFAcbMW7Y3Aj2u3wjj4wOKc0G3xN3wEgknOxx0ndw9L4oQZl3pxZQjQoWR/xwHzWjmIXZaq8BlYjRkjSXclq50R/050+sNjTfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zxhkqwoa0zLwrwg5FgmIMZlxI6mJ/dX4grJonJJzTlA=;
 b=qPyPtIF9SY5aWd7AayRq9a4O00q8HZIb9FVMCdvzDznqbGMsgovMPzHvpjqb22UjtKv73hSEpYovmDDaqpdr0Zv6Yg2VyJQNB8nGFpEIvk+VQtvCKcXkFBHi2FaE7cfU8vAoiOqIi8dF8zkVIl3p7Ad9kbDNdYcwV/wbCM5rqLQ=
Date: Thu, 15 Apr 2021 14:25:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/2] x86: use is_pv_64bit_domain() to avoid double
 evaluate_nospec()
Message-ID: <YHgw0/FzaUUgO8HF@Air-de-Roger>
References: <3bc868c1-1003-2f80-1617-d64a1e7441bc@suse.com>
 <1d5cb279-203c-4188-5910-7b01dde4239e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d5cb279-203c-4188-5910-7b01dde4239e@suse.com>
X-ClientProxiedBy: PR3P193CA0018.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b638d55-c9f2-41ad-07b2-08d90009a1a1
X-MS-TrafficTypeDiagnostic: DM4PR03MB5998:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB599891D547BA498BF679AFA98F4D9@DM4PR03MB5998.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:311;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lIPQ7oHjkVlU00er8bfRq7hnysDsf3V9tWQ+YGgmqp1Xb6tCoV6UcvFunxGXXdL6Fu6uVKW9adoCpYhnrinjN5BtKoA94gg7APjQ1SJhjsP0lMCIG/Ko0Ta6qsziAN7HeQdLhZ5pbaB4D5ukfB5gxx/tjSFepWJvcVpmo1arvV7xud7xrI3Xe2Kd3hjsLHMwOav5hTGS56ITEhPi2jmdp7pkR43eo2/AK5+NVG1BT7oFp2i0bPzKgWADM88sE5fXmQt1FLQ3S3DDU3KQFZOVVNWUApvZ4EI2UQlNLCzB8Oleh7SwfVB0LI0peQ5e9cg58v+IWYZ2KHmEmLe9PaagbiQjJrpaP7mbd7PKRuCwZUuFc15fj/V1JLkm1fjiAOweBTlLLRZKQpkmYpLzSircSZvfF7b030D49HznRNfJ9CxL94Uqu/eEdKe0ZUtUVjLkDIKrW9BbeKhR2xuwyvEfx/1VvYwCVOgay5GfA1Q8N83hxmKEmtgOROfT9AOhUVvEJgANJpyt3u+KXxU2eftEWK1hiRvkgqNMV1236HZiKrCbW4H1ZFX1DQ32KC0iDHtuy+kxKvbkRKSFaHsACIAXR0THWmD21fQv2HGq2+xooPw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(39860400002)(346002)(396003)(366004)(136003)(186003)(33716001)(316002)(6496006)(38100700002)(4326008)(558084003)(86362001)(66476007)(66556008)(6666004)(6916009)(66946007)(6486002)(16526019)(9686003)(8936002)(26005)(5660300002)(2906002)(54906003)(8676002)(478600001)(956004)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c2gvV1JodzVFSjVnZFZDOEs2dVV6bTByOU1sMkFaT2NnWHFsUkhIQjBLc3l2?=
 =?utf-8?B?WWhZK2hha2Y2L28yWk5IeHN2bGRZS0tQTVdzcU15N3hxTWd5TXorOGthRi8x?=
 =?utf-8?B?MkVlSlF1RlJoc0hId2RNN3hPUU55aVNPSmxSWmRTemVBKy9rTi9VZ2duZWhL?=
 =?utf-8?B?dlA0UmhxZFByTVQwajdmWHJybUZpc1VRNWlyMGdkcll5Nk1oZWR5cmgvTHY1?=
 =?utf-8?B?RjY2SUU2dlp5K1UxUEludnBodVZLRGU3NGZqdS9ZbGMxZUNNanIybi9aR1lO?=
 =?utf-8?B?WWsxUXdrc3lmQ0FzNWIzL0lUTG0rQnR4RVBuVVQ5dTZ5bEkwd0dqMEQvL3FP?=
 =?utf-8?B?dE5tMGxsejBlL1lZOGdFWnZmY2w2eUppMklQQjlGMWkvQUVrWUgwY3BITTNI?=
 =?utf-8?B?S1BaNVQwNXNudHFBNzF3RjJYNjBKRXBDQkdJY3ZUOSszakdxRHYvMENWb1Rx?=
 =?utf-8?B?T1NGd3lwU21LcDRUc0czZU5iRmtsa2JTLzlwQmpGWGVRWDdSR0xRdDVSQUxD?=
 =?utf-8?B?WmJaYUJybjNiSHoyREVTdW9TWXVtbkc4MVJzNitUbjNjZExNbWZBb1Avb1cv?=
 =?utf-8?B?TVZpRGQ1MmxKYkJyZnFXMWZ4MnZCVE5FK0RKT29zWXRnTE5KbS9yRDgzaFU0?=
 =?utf-8?B?VnV1M1Y3Y1FWQ0tUa01Eczd2OVBLN2lGY2I2MUxPUUVmV2wyS2JWd242THFS?=
 =?utf-8?B?MzZBMGh1cER6b0J2WnJIK0s5UEc0NTArSVJkeENjYk5mWm5CRzNQaFE1VjNZ?=
 =?utf-8?B?dlFqV0lxMjJuQ0RpRkhQUm5WRGZCajdGcmswN1FNWlBHbEpGL1lLelozQXJl?=
 =?utf-8?B?RndjMHMzdkRsN29MZytoZTJnMnpqTVdERFB3dk10OVFNV0N1OUVVOENPV3pG?=
 =?utf-8?B?TFFmdmpUaWl5UzNDeExLcHpYMHBIdVBhY2thZnVNalhyUU10Z2tMQ1Vvc0JC?=
 =?utf-8?B?bmY3Uzl4MURrVXRzQUJiQVM3L1F1K2ZWRWlKZDFPQUR3cDBMRlBaVFpKWnlE?=
 =?utf-8?B?aU5BdGJMajI0YmFtVmpqWTdXMVR4N3p5YXlxcjNGcGlIN1NDaUpiUVc3UEFY?=
 =?utf-8?B?aFlFcVBBM0Q2Y1hBOU5EeElLV3Q0R3hMU1FqNEcwS1NkcWo2WUx4QmlPbjht?=
 =?utf-8?B?SHNDRElPdXVmYk1QR05EN0hWQkM5eVp2emN6U3plVHE5SXpHNklyNUpUV2dw?=
 =?utf-8?B?ZGdRQWZYdm5zOGF0VjNCWHpiWnNJZUc2ckpjaFhOck5hc1hqYUtQMlhiZ0Y5?=
 =?utf-8?B?SlNLWUlLcmI4OC9zbjZYbzNNZkV1NktKbU1UVkF3Y2VoN0J5bHEvcXI3OUJR?=
 =?utf-8?B?YmZTMll1KzFJSlRZZGo2cEl2bS9ESHUxYTBvTW56WmtueVFlL3AyUVJTdFA5?=
 =?utf-8?B?dzV0Sk04NzhQbnl4di96aTJ1YVB0N0tEcUxTbHRDWkN6Qld4MGsreG9qKzZy?=
 =?utf-8?B?aXYweS9oSWpTeDNMTHBZRkNJc1A5V0ZJcnNsQUtmWVlsSkZZaGhzYzFVS0JF?=
 =?utf-8?B?Wk5RVjk5V1hmdkI5Z3lKU2RkMDVMZFJSSldzSHRNTmhuSVpLQjd4amgxSCtW?=
 =?utf-8?B?dERmUlB6NjJDMmtaVEU1WlQvREdHKzlzNU4xRmhZRzRaRURVRUxQNHNHcXFr?=
 =?utf-8?B?UVJka2M4OURvbStFQmNDczU0c05aNFBDV0xPeVdQcmpLbjlOSGd2MEhGZDFz?=
 =?utf-8?B?Ujdwakx3bSt4S1Y4V2ovamYyZ0l5OU40bFZPRFFzM0QraWVyZ0x1NXpLRG1x?=
 =?utf-8?Q?fljQHLSpCjF8qbfjOJIJGEj+ZoRCniaNVNzKGrC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b638d55-c9f2-41ad-07b2-08d90009a1a1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 12:26:01.7196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dplifANH9xjqNiYhPEVmE3140mLXmVzfDq7qpFcvMFi1fqMRD+tC6ndMZUwXAMK5IHOnLAco/Ihk9p7V3OdlZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5998
X-OriginatorOrg: citrix.com

On Thu, Apr 15, 2021 at 11:36:18AM +0200, Jan Beulich wrote:
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

