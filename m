Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 537A23516A6
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 18:14:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104631.200368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRzxa-0008HJ-7r; Thu, 01 Apr 2021 16:14:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104631.200368; Thu, 01 Apr 2021 16:14:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRzxa-0008Gx-4b; Thu, 01 Apr 2021 16:14:18 +0000
Received: by outflank-mailman (input) for mailman id 104631;
 Thu, 01 Apr 2021 16:14:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Onq8=I6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lRzxY-0008Gs-9o
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 16:14:16 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 189a4ce1-de21-4498-8edc-ab7bd97b2d60;
 Thu, 01 Apr 2021 16:14:14 +0000 (UTC)
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
X-Inumbo-ID: 189a4ce1-de21-4498-8edc-ab7bd97b2d60
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617293654;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KGniY3TxAH1d6q4BTl85KomLpNVYpIDqhes70pRiAAk=;
  b=ZsoJqP3Ny4fXr+fc6A3K8V9/0MSaJWG2NynPAbnwlci/SOs9MZpVgaYj
   eKEAVuq1EtUs48+Mep7tU4OV4OkYlmhH+xBQw1Fglcza0clfWZk7xlrBW
   ssXtmy2dOVbFU4zlSTrgDt0YB2sytqh9B3c24eMG287yPCZSjJV8v5YzV
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: W+sSr3EsJ1r1kpe2A76NjLmxxPp4KwP8kQSEmwE204321Rf2jmgpCCx2I3uyy3Wt14XB9/o5KL
 U8vUy9Iu17P58+1T0fbBLf+6O0+b0NiFRiKt0bEFKdNvSS/u/a3ZUha2G5FvaYt1sRPM+PiodD
 9HQbB4OxaxPomW2AKkh1xUKmo+JvqrNtA/CIb2hzQatmlhAbpVMgMO3wS278S7ApS3pjMOslr2
 erUULXzNWtbWdA1oFuzGRB49rewuLCOAFZAwr2bDge7YVkou+5AlCVS3LRsU9myjhG9shMZMj6
 hos=
X-SBRS: 5.2
X-MesageID: 42172572
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:3sq7s62vahDeQfjxD/BxzAqjBR93eYIsi2QD101hICF9Wvez0+
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/FIyKErF/OHUBP9sGWlaLtj44zr3iH6F0TFmtJ1/Z
 xLN5JzANiYNzVHpO7n/Qi1FMshytGb8KauwdzT1WtpUBsCUcBdxi1SYzzrd3Febg9AGJY/Cd
 647s1IuzKvdR0sH7uGL1MCWPXOoMCOqYnvZgQICwVixA6Fiz6p77CSKWnl4j41VTRTzbA+tV
 XUigCR3NTfj9iX6D/5k1XS4ZNfhcf7xrJ4avCkp8AJJlzX+36VTat7XbnqhkFTnMiO7xIQnM
 DIs1McOa1ImgnsV0WUhTeo5AX6yjYp7BbZuCylqF/uu9bwSj5/K+cpv/MhTjLj50AtvM5x3c
 twtgrz3fonbmK0oA3H69fFTB1snEavyEBS9dI7tHBDTZAYLIZYsI13xjIkLL47ACn45Io7ed
 Meav302fA+SyL5U1nkpGV1hPSjUnMvdy32OXQqi4i+1jhbm21B1E0IxMATtWdozuNNd7B0o8
 vDKahmj7dIU4s/ar98Hv4IRY+NBnXKWg+kChPcHX3XUIU8f17doZ/+57s4oMmsZZwz1ZM33L
 DMSklRu2Iec1/nYPf+kqFjw1ToeiGQTD7twsZR69xSobvnXofmNiWFVRQHj9agi+93OLyZZ9
 +DfLZtR9PzJ2rnHohEmyfkXYNJFHUYWMoJ/v4mRlO1pN7RIIGCjJ2aTN/jYJ7WVRo0UGL2BX
 UOGBLpIt9b00ytUnjkxDfLXXfAfVH+4IJQHKDW8/N78vlJCqR89iwuzXip7MCCLjNP9oYsel
 FlHb/hmqSn4Um6lFy4q1lBC154NAJ48b/gW3RFqUshKEXva4sOvN2ZZCR31HuDLRlvctPOHG
 dk1hNK0JPyC6bV6TEpCtqhPG7fpWAUvmi2Q5AVnbDGwsv5ZJUiDNIDVLZqHQvGUzx58Dwa6V
 trWUshfAvyBznugaKqgNg/H+fEbeRxhw+tPIpzsnLQtUKVoOk1XXsFVzuSUcqa6DxeBQZ8tx
 lUyesykbCAkTGgJS8Um+IjKmBBb2yRHfZ7FgifXZ5VnbrqYQl0am+PiVWh+lcOU1uv039Xqn
 3qLCWSd/2OJlZGoHhX3pzn905OenyHc1h9bW17toNBBX3L00wDo9OjV+6W6S+8e1ECyuYSPH
 X+bTweLhhH6vq32BSW8QzyX0kO99ELBKjwHb4je7bc1jeRM4WOj7gBBOIR1o1iLsrSvugCVv
 +/dweZICjjMf4g3xWYqx8eSXBJgUhhtcmt9Azu7WC+0nJ6POHbJ05+QaoHZ/6b9GrpSp+zod
 xEpONwmdH1FGr/atSLk/6KKxFCLw7eum6wQaUDr4tOsac7qbt0GN36XFLzpQZ69SR7CP2xsk
 UUBJlfyvTmHKREesQJYSJX/lYzjr20XQAWmz2zJtV7RE0nin/QAsiA7LXJo4c+G0HpnnqFBX
 Cvtwlmu8rfVySN1bQmG7s9DGRfZk878mlj9oq5BvvtITTvU+FI51yhNHChNJdbVaieAL0Vxy
 wKru2grquydyDi3hrXsiY+CqVS83y/Scf3JA6XA+ZH/5ibPluL65HarPKbvXPSSTGhbV4fip
 AAXUsMbt5bgj1ntbYJ6EGJO+TKi3NgtUBf7zFhnkPs3YbjwF6zJzA5DSTpxrNMXTdSNXCUi9
 /i6ubw7gWk3AR4
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="42172572"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cmJT6q65j9OPctGFC89x7pQMIqKdHfcr1aC3jBSz4ZFiDKqBb9ilokiT12vUxkjrLJ8BSrJF2GOFQMOGXmHpOVmEPE52GqyRuZDcUff2aCBRZFEcCp5FPYwYSxXLyTxGgYptL7unvM8mrdb+p0qsIVnGqLQMx3i/ez7Oha0F4LUdxmigZ5Ij8/roXpGu0tRwxLALpL1CverLg7XEV8MnDeGkToAyAUrpfBJvwlXNWDL22EBlZDvgqKpIvt0UPEQGscpCSamgesWvqx6qWMyzpBoOrGVUjgID6UN4bdM6oBs6c0WORQoQARvfe4beAsvp6Xl4d060grYBAivGf+2E6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfXPlgZ/bDUFcYMUMBa1Z1Lg5gOrCCz5BHQH0RgHPAI=;
 b=N89+M21xJKub4uvtScW0Z4nLriaQ5wBWaUl0pV9OMmdYW3bYPEFaFd3Oe2DmCmaHUMssbmCjDK+RU0xppWAnLj/POkZ/NisvkAoyW1wN09emZkeCMrwKDCkY0Zd8B8hwS3tgydUPznqrhTyoKfCRZw6W9m+DZhhSEHuQm2xun5o6lwVHwzm/0djF1Z1CPR7VbNJndcSHzEj4lU5WhLZK5LZDCD0HZ6K1/WppGtufpvf73o88zth/Psnoz4yk9e4LAlgFJhVHuBpfCCZPLL8CRApS+KWqnnMDYvLCMpZkEjhzo3MeJfVkUW/jPeHQKA4dydEt/8nkyt4aB3HXkHU6/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfXPlgZ/bDUFcYMUMBa1Z1Lg5gOrCCz5BHQH0RgHPAI=;
 b=EwI8CQxYvfb9iy76rIEJ4WCk8MGDeyuytcJLxtm6+9SYm7n/I+PVg57tSPX+sh3r7uqYiSmToZFIvxCz7PIeIxlz4a6WcxEpqrvfZ75xlY5N85TXgDnXZsnFxW615pRgVupnjqUlpVBabqvQy7FbVoKjnqV9nFTzujRWhjgKzUA=
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210323095849.37858-1-roger.pau@citrix.com>
 <20210323095849.37858-15-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 14/21] libs/guest: introduce helper to check cpu policy
 compatibility
Message-ID: <cc57be9c-d55f-6a1b-7759-5de1c40bcae7@citrix.com>
Date: Thu, 1 Apr 2021 17:14:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210323095849.37858-15-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0047.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::35)
 To BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 609ab3b8-7e87-48f8-addb-08d8f5292e51
X-MS-TrafficTypeDiagnostic: BN9PR03MB6025:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR03MB6025952324AF9A61A29FB15DBA7B9@BN9PR03MB6025.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W9eLXzk9pWQWXnr6jiLwjM/0cTSzHez54un0KxHzrtB6ql/wTCyFSWQhHD/SiKTReofppt8idnRlRTGUxZJTaNpb3agIoxktRR+BRHrjhFSgZBG6UyBgbhvIBeVBuVlbOv0nDD4f2nB5WLKroGEeucA4F5YuQIfxMK/KKYE1PN0YZTWGH/Ccy6u6SWoDka4O+rAD4u+LB30y1s0O/uYiJhWybzJupjtZ4c8oaNPfPvmxi9ikbLjQ5IVDRW9qUxtKfIOmAWAFHh1lR+/tD3wO8wFB+NWuBxsANYclYB0XCZ1zK1P+XT4acpnnxsp88FUD0GBFJVle/0m3xoUdOhlv8jESqkUwxnSDYIggq9VqCBYbqiFoLe5GHzZYXTEsG36vRJouxqZbkPZJ8/6IJ2OdxSfyI8JInj/jbDEnL39Es/hjumOtNpjJFSQmGJekd8HqlmFOuREt4gbomv4iRT1LP/fKKItJjfiTi7Ft6lpLbShlfIAWSnI11PdmiduiK5XKJ/2YrLBfA8VVIC1xKTLWQbGqGp5yYiMES2rgwvbkGpLDFQA2QR6EZ4RqnkncrWvzo/7o4adMPIyln1zXzO+0Ds8C751HOzRjK7HbNypxg5YZgHmV7yKlOUXnud9zpAvuJ4ZnaLJEg+PJCYCfcN1H/H4qJHhE7WEU44T5jHBe3G44XN9hc89nQlEcpWdziZLTxFhqLxio2FhujLuVGrq2EQikiTeqWFG7gZHijjMWI9g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(8676002)(31686004)(8936002)(31696002)(6666004)(2616005)(186003)(956004)(54906003)(16526019)(26005)(83380400001)(6486002)(36756003)(86362001)(66946007)(316002)(478600001)(4326008)(16576012)(38100700001)(53546011)(66556008)(66476007)(5660300002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T0hSWWtENGFEVXBVMHRiQ1JJY1RQSXJGYXJvQ0pRcDVZM2wwY2FvNFZKczZE?=
 =?utf-8?B?dVR3R05BcW5WclFPQUkzZmk5NGswcFdrbHdvSXQ2b3g1OGpPeWxrZGVRdnFo?=
 =?utf-8?B?UGJTVGFBSmJqSHIwQW1nUzl3SzI1SjczeEVWY25UVWFGWGoxbmlpbCtwcnI1?=
 =?utf-8?B?RDBOZGRtQTN2cDBjdWhiSFlOMTdOYU41UjY2SGlYQW9XeWJNNE9WYnFpRVlJ?=
 =?utf-8?B?cHAzcHNUTURNQlhvZVM3ZlRJYmRXRzRRbWNEMmVKNkQ3Y3JSNFZwdk1OMnph?=
 =?utf-8?B?ZFVyQ1JRY1RBRU4rTlFRdkVKOTJiY2Q5aGU4UGpFRk5IRERFeTQzbXl5MnNI?=
 =?utf-8?B?Q2dnb3p2UStsT2VXckJIZi9pN3hvbmxSd2IxZ0pjeXJHM1doUENXNTFoaXN0?=
 =?utf-8?B?ZnNTRVZYcDFTS1V2UnJ6aWZNbjVKZlQwajZOK3Q0cmM5dGNnWkZRd0ppWnBC?=
 =?utf-8?B?YUJPZ2k5aEtvbzhJcHdCUnAyT3Y3OUFtSEVabEFaVGljbk5OUHZGcnAvTmdw?=
 =?utf-8?B?K2o2OTVLTU5nV1kvZnFCa2tYNE5DQm1RaVAxaUVHZE1wOExMekNPTDJJSTRV?=
 =?utf-8?B?TS9vWHBvd0s4ZVJpVy9zRlZIb1hWMFdlcUhHWnFpVGpKYXlTRUFCNHF3VDRq?=
 =?utf-8?B?Tm5Tc2h3OHhrVXpuUmxJYnFFY0xPaUkzcWRkTTlFSGc4bStvcmZUMkRBak0x?=
 =?utf-8?B?Smh1a3BuQUFia28xdGRJbUtvZ3lac0MxVGhwNU96UU1uMFJjbU1SN2F3QWRk?=
 =?utf-8?B?NUFuOGxjeW1vaXNoT280VmxZcGtRTjI0TUdXTFZzanNXZitaWFNsSWVZWWNC?=
 =?utf-8?B?RlJ1S0xnZWxxUDhYMWthbTlBa0JrY2xLTHpBTkhRNUcreXpsemtjYmdiTUxC?=
 =?utf-8?B?YUdpU0RJcjkyL0Y4eGFScjJCMmVHT0swM2ZDL0dGaHVVWWN2blVDNW5PNXh2?=
 =?utf-8?B?UFNkVjhRNkFWUElzRkNKUUVkcmQzaWRtZzBVdmRRVUgvc1YwUTdMUDRYbWNh?=
 =?utf-8?B?M0l6cEw4ekxIdHdmMTlWTi9TUzZJVThlc1RMTkFOMjNJSi94ZVRrR2dlbXY2?=
 =?utf-8?B?K2l6MkpFaWtQSFlvSVdkYVVFR1lBRllycTJySkg3VUZobTZTNy9EK0RPQmFP?=
 =?utf-8?B?WEF2MlhERzNFbCtVV01FWkpTeHhVNWdFOXU0WVdHYW1LemtVejR4dklLZjBW?=
 =?utf-8?B?NHdJWXZYMmpXd3VuSE1TcDFtVHBKbUFEaWNTMU5tdUdLTTZDNjZjQStHaTZQ?=
 =?utf-8?B?amlRTVQ3SitsN2xIWFRWazVTN0JpclVQeVpDL09SdnBmUkJpTy9Ic1lVcnRi?=
 =?utf-8?B?SWEwbWE5UytlMngxQm9IeE40WVdGWmh3NzBTU1VvdzZtdFJQR3V4NWVMYVcv?=
 =?utf-8?B?c2UvbzlUakhLanFpYXEwT1M5bm9mSk4vVjZ0bVpNMmZWdDRLWjl6T2VnWnJO?=
 =?utf-8?B?YzBlRFpCaDIyMFA0TE5nY2NnVGRkTHFUZklINFQ0U1FXZGxKb0p1d3dWaG8x?=
 =?utf-8?B?Y0lmQWxUaVVzK2lqdVBNUldCN3dyQ2d3SnN1N291TWZvSEZET2VwRWcvVDVj?=
 =?utf-8?B?VitxazZWaThsYXkxV3MxMmdIVVB2YThIcVVlWnFCU1VWYW5WdGxFbnNVUVpy?=
 =?utf-8?B?bmhrSXphM0dHK3V0RTRQNjkwbWtUdXV5LzQyWitkOGpZMXJ0TUN2S1EyOEta?=
 =?utf-8?B?NERjSDZUSGtweTcrSmI3MGlhcU9xd2JIS1JPaUJGSWwzdzF2TmF3NDBvd056?=
 =?utf-8?Q?veu5ihZlUBD+iHt8djVaKsbH2PSrCJ1PVv4UP1H?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 609ab3b8-7e87-48f8-addb-08d8f5292e51
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 16:14:09.4273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VCeH0RWGcSCKRFX3fj1+KAbee3OzW8BX5cUMFlMhKraAF8V9qBftAs50Ae58d88phXXnGnO7Ey+B59EakAynZHwuOw9B3+xT4Y/bGe4xUCA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6025
X-OriginatorOrg: citrix.com

On 23/03/2021 09:58, Roger Pau Monne wrote:
> Such helpers is just a wrapper to the existing
> x86_cpu_policies_are_compatible function. This requires building
> policy.c from libx86 on user land also.
>
> No user of the interface introduced.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  tools/include/xenctrl.h         |  4 ++++
>  tools/libs/guest/Makefile       |  2 +-
>  tools/libs/guest/xg_cpuid_x86.c | 17 +++++++++++++++++
>  3 files changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> index 164a287b367..165beff330f 100644
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -2619,6 +2619,10 @@ int xc_cpu_policy_update_cpuid(xc_interface *xch, =
xc_cpu_policy_t policy,
>  int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t policy,
>                                const xen_msr_entry_t *msrs, uint32_t nr);
> =20
> +/* Compatibility calculations. */
> +bool xc_cpu_policy_is_compatible(xc_interface *xch, const xc_cpu_policy_=
t p1,
> +                                 const xc_cpu_policy_t p2);

Exposing this in the interface is useful and necessary.

However, the operation is not commutative.=C2=A0 p1 and p2 are not
interchangeable, is why the libx86 function has specifically named
parameters.

This distinction needs making clear at this level as well.

~Andrew


