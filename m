Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE87A419689
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 16:40:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197016.349943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUrnw-0002kN-Hs; Mon, 27 Sep 2021 14:40:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197016.349943; Mon, 27 Sep 2021 14:40:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUrnw-0002hl-Eb; Mon, 27 Sep 2021 14:40:28 +0000
Received: by outflank-mailman (input) for mailman id 197016;
 Mon, 27 Sep 2021 14:40:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g88l=OR=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mUrnv-0002hf-42
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 14:40:27 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f36aa982-cf7b-410e-ac89-1cea42103cd7;
 Mon, 27 Sep 2021 14:40:25 +0000 (UTC)
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
X-Inumbo-ID: f36aa982-cf7b-410e-ac89-1cea42103cd7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632753625;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oOEl2Y+nsFDfz8F3hMxC2R9NibfcB39NbSJvpyeONt8=;
  b=Wxs53KBMizbJLHqSOOSXrWU2o27WbHS1Bm1HLeVgIWxLr/4doUTugu4M
   kZM685ycQZAMVZCdFIoK1y10iHRHKJ8rz7rbk6+JSJwe2IMYaBxFOOC00
   lnuuZMC9IqRcWesRuhiGry9DIVYYafl1j0qc3KtQnCezec94mxAr5bNpm
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: savFAdl03aPR77hgo4pEBd/Hfnd6o3G/o6TUNx2gUsrPtU7pQRWutZfr+bC6hZZA2zzW53wM3Z
 2jL0MFsG6D39oIQgW4FALVv21NDYLKvKyMQJiyVozhvoM7FaE5FWccW4k/wjQigcpEKXT3xRz6
 ozKg6l5VIYdRaU/KK/zOJngvmZLdEEJBETr46Zbw8cTaWg5Co0wCr1erTs1IUQhgnosYFdZrZz
 ZSU8hw/0REgZFAXisSh+iP2La6DsWy17MS6O/pBmXYx2fmr6h9A3hCvwTyl4gVXZHwbM72Vs/x
 rmvZ7ILyg9ExA+lXxjf09rAL
X-SBRS: 5.1
X-MesageID: 53315451
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:O6+lvqDrR3KJIRVW/9jkw5YqxClBgxIJ4kV8jS/XYbTApGgkhWEFm
 zZNCjrXPPrbZ2SncthxaYXi9hgFvpfcz98wQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLOs1hxZH1c+EX9w0007wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/ugrTh9t+z
 NZ0sL+2TystE+7nnOsgXEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcFh2xp25wTRJ4yY
 eJHUzUyckSdQCFEZFcmCaMFvuCX2T7wJmgwRFW9+vNsvjm7IBZK+KjgNp/Zd8KHQe1Rn12Ev
 STW8mLhGBYYOdeDjz2f/RqEhODVmjjgcJkPD7D+/flv6HWMwkQDBRtQUkG0ydG4lUyWS99ZM
 1YT+Cclse417kPDczXmd0Tm+jje5EdaAocOVb1hgO2Q9kbKyzemXHAPQTpCUdkFsskaQRFp/
 VuGoty8UFSDr4apYX6a876Vqxa7Ni4UMXIOaEc4cOcV3zXwiNtt102eF76PBIbw3oWsRm2gq
 9yfhHJm74j/m/LnwElSEbrvrTW2utDtRxM56x/bV2aohu+STNX+PNT5gbQ3AOwpEWp4crVjl
 CRa8yR9xLpXZX1oqMBraL5UdF1Oz6zZWAAweXY1Q/EcG82FohZPh7x47jBkP1tOOc0ZYzLva
 0K7kVoPv8UNbCL2PPEnOdjZ5yEWIU7ITo2Nuhf8NIYmX3SMXFXfoHEGibC4hQgBb3TAYYlgY
 MzGIK5A/F4RCLh9zSreegvu+eVD+8zK/kuKHcqT503+idK2PSfJIZ9YYArmRr1ot8us/VSKm
 +uzwuPXkn2zpsWlOXKJmWPSRHhXRUUG6Wfe8ZcKKbLTflQ8SAnMyZb5mNscRmCspIwM/s/g9
 XChQE5Ijl35gHzMMwKRbX5/LrjoWP5CQbgTYUTA5H6khCouZ5iB9qAae8dldLUr7rU7n/V1U
 +MEa4OLBfEWEmbL/DEUbJ/cqo1+dUv02VLSbnT9ODVvLYR9QwHp+8P/ele9/ic5ESfq59A1p
 Ket112HTMNbFRhiFsvfdNmm00i14SoGgOt3UkaReotTdUzg/ZJEMSv0ivNrccgAJQ+anmmR1
 hqMAAderu7I+tdn/N7MjKGCjoGoD+ohQRYKQziFte67bHCI8HCizIlMVPezUQrcDG6kqr+/Y
 eh1zu3nNKFVllh9rIchQa1gyrgz5oWzquYCnBhkBnjCc3+iFqhkfiudxcBKu6BAmu1ZtA+xV
 h7d89VWI+zUasbsEVpXLws5dOWTk/oTn2CKv/gyJUz74g5x/aaGDhoOb0Xd1nQFIesnKp4hz
 McgpNUSul62hRcdO9qbijxZqjaXJXsaXqR77pwXDecHUObwJo2utXAENhLL3Q==
IronPort-HdrOrdr: A9a23:Dd9lm6ldfYpiaoCm7Jjngs5v7YXpDfIo3DAbv31ZSRFFG/Fw8P
 re+8jztCWE7Ar5PUtKpTnuAsW9qB/nmqKdgrNwAV7BZmfbUQKTRekJgLcKqAeAJwTOssJbyK
 d8Y+xfJbTLfD1HZB/BkWqF+gAbsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.85,326,1624334400"; 
   d="scan'208";a="53315451"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CFuz92T6NghP7WdMUt5rleuaChtOsJrvqO5TMWiD2I390lceuiGDsBe4zVq/ogI0nL2J9A8y5927OI7VaGueRWfXjNt6hUPnbWbcMtuoBqmlMbjw2vjN0LqjbUoWMmrChwLMvHO9wd4LKz0NHVQCAtH171WN8Rj2e1anzpk8/FLw6K6FAzNHIHNNWniWnTz+ZECOCX9UNi5AhuA65DvvKTTEHRQy/37xjdx3d4I8JxszpzXM4IlECtZLDV/9ZU8unTPQ6M3Gy6ILPRr4hi+JHmSiQoYBg4s+poLtGnRJ5WrZKioziBLd8GvvAWrWzQLkYAgU4aR93iL1bWf9UNC8iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=oOEl2Y+nsFDfz8F3hMxC2R9NibfcB39NbSJvpyeONt8=;
 b=UDk+h/KmjgrPqPGS2azd77Zq+iDVC8cs0hvJvZEjw83lT887+tgFK5Zx3iXkdrw0SbvrTAgdAojfaNoMyn4e1KEsgHabMFkxXYziZZYMducvxc0E3OISAZC6Z0BSAri35GNtuRVYSwpPALBrDMWlyl+JJvwMNBh2JYrjfrOTL1qDl+eJEYLyf7aYviPTvolTsLX1KTZ20w04R3RqFAcNc4doZfROHZqnBOuKvNCm/oOx4C8F0vWYsY3Hy78j5uKV6FxxDTxU69/e4ptTQX6YGlSfmDbvY0V7cKsRj3NN4Fa0hcfgX80JsvjyQQgGVpLojTkgXGsrJoUT+Wr2813DnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oOEl2Y+nsFDfz8F3hMxC2R9NibfcB39NbSJvpyeONt8=;
 b=e0FShg4iILQYmZbDrewJaFhuVJllq0JyxK/KgoOT/Ef+ee5E17NpWs/T6IlZrYyTW42y14P5dIHmWkVHtKSOPjCy4vyDmRk8cT0Y0OzG7h/wIbk5Gnl5jVhJVPKxsYZAUoKb1QJdZaWEukILReNElvR2blqXvEZWko5fZp8nNf0=
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210927104813.19772-1-jgross@suse.com>
 <20210927104813.19772-3-jgross@suse.com>
 <f858dda9-b844-48e4-c079-75296cc36316@citrix.com>
 <20bd7f1f-f0fc-b7a6-c0e8-05192714d384@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 2/2] tools/xenstore: set open file descriptor limit for
 xenstored
Message-ID: <9076ecc3-8509-f687-df11-82a561cb5b2d@citrix.com>
Date: Mon, 27 Sep 2021 15:40:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20bd7f1f-f0fc-b7a6-c0e8-05192714d384@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0050.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2bb5e1d-8746-4082-cb67-08d981c4b826
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6270:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB62701D7DAB74A6BFEA3E2937BAA79@SJ0PR03MB6270.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PWsrKN0KQv4WeQN68whL9o7gkjLpHL7ny8J/Mc+4IuAjLNzmab4W7aR5BYUTnHPQwYbzxndqlOtnaiW0qIAr3HfmHk/HLYUJ3i7ztkYlII9hq1bMz2HAWdCO5p2vaznDgZgEKKd/4YXLcEqrbIGoxpgo9YJDybBlmSljvpij10VTWfB/6Is8GlFAVipOgZ0CQGbI+kYPcGFWL9EXQymAEfvfHkPNNkq56sDTJXuQ2lm5Lqd4HvYPcb0Ti9E0EojxPFBDmPCl9etPo9FyZ1FrCXYTan0mxogrms5Gc9mlJCGy2KbKMhgZs+cCoaQQmakgm82GD1/QN0OXBwGvjb5j6yssm861FloKs1CP5h4RR3VWBsCQp8868srFn42/+b4oEGBDDM6fI2WfhvBybU3+0pZUOgUBk0quL5wK9uxnTLNV2ZSsYTL3GgmlVA26ioS1J7cK3hhfEf4GHBVeCguSfSsb00zocG4Zxec4Y6TQ9uyDjxNW/ai8tTLHP9b3XhqzcGw69TEEBtVBazt1hAylb6lRVa6ZxnHokwPzDAUmmhK8yWRk3a4BEWyeA+6hnEYt4O4cCvrvt9j/LTZRVfGOgyzLwPzuBsfQNp0jCOOWAYI22Sn+5Lh6u5QxvslOV82PgGBIAXoigcTMHevvosLOpzCr1pdZdRYAnFnjca0cp/cIt7DDV4AQ+bJgSypaVddBeXq2alOnSp7fugD8VSsG4RIH20ZZSQRO2b6YrrNcT8y62TNX3TyHo9q/a4ZCP5n0joSdceRjM6t3NOEDdvdHuDnf7JaJspjzMAXg2oC3fQkL8k6uQHARhDlFDO3I1lmK/1dHv4ZAnvOVPXYg06rZpg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(66946007)(86362001)(55236004)(2906002)(53546011)(6666004)(83380400001)(8936002)(956004)(966005)(31696002)(2616005)(8676002)(54906003)(5660300002)(26005)(36756003)(186003)(316002)(508600001)(66556008)(16576012)(6486002)(31686004)(66476007)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUp3b0gxa3BsaHBOeDFRWm90L3BXamhxaDYydDhnY0drMGI5TVczbXFOVEpz?=
 =?utf-8?B?ZmJQZ0IrY1dMUWJXUjBXaWRrOC83KzkyVmFqcXR0UldGNHJ1NXhWcDFacTk3?=
 =?utf-8?B?cGs3MmtvK250Q21uOGVweFRacjRrVlBaSHEzRmtTU3lhSUFGZmJaOUlqZ0o5?=
 =?utf-8?B?TVpGQmltZThCSTVCb1hoUkY1cmF1TnVLelJZQ1FVbjk5QW8vckJhcys3R2Rl?=
 =?utf-8?B?VDFMUXl3YXRIUENOdW5ySkxxK290QkJGVEhvdDlEMVZzR2R2Z2tNZUFaYWJq?=
 =?utf-8?B?TFBUR3pPQTBrNGFJT0VGajZvemtqY0hZNGhtcHpCU0tCbjFpUTZlOGM1VXBV?=
 =?utf-8?B?YUpFVEZ5YWdCZVBBdGRWRkF2ZXNnN3kraE9vTmJVRllGMlZuR3R5cnlEV2d0?=
 =?utf-8?B?VDE4Z2dGNk1OR3BZZkxmNnF0MWNqbVdpRnVla0FkV2YzdmtTM09JVHFGQXdM?=
 =?utf-8?B?dENWSFFSclZtQy9TYmF3SGJheEFlVVRpNmNvNmU5ek5Vd2pja0pTYStEVHho?=
 =?utf-8?B?a3dha0hIWkdaeG5yYS95OHB3aksvS09qQnRmWVNBWmJKTnBrQ3lsd1ZiQ25G?=
 =?utf-8?B?ZDFCUVQwcTVKSncreG1ERDl3cHpoOHE5SmlnUVowbzVOZGo5OG1hcTdlK3FV?=
 =?utf-8?B?ZHVsdGZzM3pYS0twTHlzYzdOcjc3ZUx3TEgrTTVJSUw0S1lsZnJFWktMTlp4?=
 =?utf-8?B?a2d4d0tWcW5yWXdPMmdUZDRWMmlTdmJucys2eGlnMjdncXFHRVRRSW5jSVlP?=
 =?utf-8?B?L1lCU2JCVjA1ampwbHRZRUI0bFBtWmFtdzlBUmV0NWdDWWs3ZkdHeWZOa2Zv?=
 =?utf-8?B?ZXJUN3NOdFFyM3VsMVl4ZEFvZ3JyTXloU1lUTVkramFBWjRLUXJ6UEdVbUVw?=
 =?utf-8?B?OFBmWWxTU0c3elJPd1BZbVpzV3pra1FzT2h2UGFQalRaSzRlUmphM3RlU2kv?=
 =?utf-8?B?bXgxTnNYMEVtaDlURnVCQWtFZXFkWWZMbllBcjlhb3FnbDkya3huTXl4d1dW?=
 =?utf-8?B?bVllL2krQ3J1ZG9udmNWQ21KWGVEcTYyMi9MMDQwQWJBRGRDdDBOVmJ6QzVu?=
 =?utf-8?B?REpUN1NETUhnaTJaaXFVNWt2eVBJa1VUTEluVGtNOElYcWtrQi9xNVp6RXdN?=
 =?utf-8?B?dk51RVl3aGhxVTFDZSt0RnVLZzFoZDNpUVV1eG5jZFQ1UklnSURVNEJaVUxW?=
 =?utf-8?B?T0JPMGNZNzZnZU5ndjc3KytrZDJVQ1R0bXRMTkVDdXEvSDc1a2liN1Z4UHZE?=
 =?utf-8?B?NXc5dHdIUHJhdGF5RTJPNnN4NkpncXRLdmRsZjgzbE9GUlNFMWFpMk93Mzh5?=
 =?utf-8?B?WHBoNFVZSlV1Wk1DeTRrNUcrSnBPQ0dtdFhxUlZ5dktBOXo1MVBrNFRzM3pS?=
 =?utf-8?B?U2RQZUNQbXpqNnAySG5lWHc3RkRncTRUNE12V28ybkZpMkNSVkc0a1RrcTZ3?=
 =?utf-8?B?MktCbjFMazZzeHowcWRQclVTUitkMDJQems4L3dXcXZWUndOdi94WTJCV1Rm?=
 =?utf-8?B?cjZmMDFLdGh4c2Mwc0RweTFodGdqQVRHemk3Qi92SlBLZ3NScWhzWUxiM2NB?=
 =?utf-8?B?blRtMC9RVC82V2RTcVRjUi9RMG9zbE82QTNwR1VkY1RleklwbUJ1eDJVWFdJ?=
 =?utf-8?B?b0IvZ1RkL21ySHdlT1dUd3U3Z1M0NVRmTlpkQmdlYkJwSytMOUFNYTI3Wldw?=
 =?utf-8?B?d2RaTGJlaWk3N2hQVUZoOEpKSExaeTh6cGdJWHdJS01ha3UwbG1idU5IMFF3?=
 =?utf-8?Q?+UOIveGKXnH2OWdbYZPFnjKnCShuoiPX54A1Gn5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2bb5e1d-8746-4082-cb67-08d981c4b826
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 14:40:15.3828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqOz6MJiYhJfTmjyRzm4DMOVeyYcHHgQl3TlJ7ZQoMry2Et5FqJ+09ktz0k9HM9dvp2WXhUv1ioisTkWkt9VBt5Kx7X/9Kpr7p7dTsxio+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6270
X-OriginatorOrg: citrix.com

On 27/09/2021 15:24, Juergen Gross wrote:
> On 27.09.21 16:13, Andrew Cooper wrote:
>> On 27/09/2021 11:48, Juergen Gross wrote:
>>> Add a configuration item for the maximum number of open file
>>> descriptors xenstored should be allowed to have.
>>>
>>> The default should be "unlimited" in order not to restrict xenstored
>>> in the number of domains it can support, but unfortunately the prlimit
>>> command requires specification of a real value for the number of files,
>>> so use 262144 as the default value.
>>
>> Citation needed.
>>
>> prlimit -nunlimited
>>
>> prlimit --nofile=3Dunlimited
>>
>> both work fine, and strace confirms they issue correct system calls.
>
> Not on my test system:
>
> # prlimit --pid 734 --nofile=3Dunlimited
> prlimit: failed to set the NOFILE resource limit: Operation not permitted
> # prlimit --pid 734 --nofile=3D262144
> #

What does strace say in both of these cases?

>
>> Support for "unlimited" as a parameter has existed for the entire
>> lifetime of the utility,
>> https://github.com/karelzak/util-linux/commit/6bac2825af7216c5471148e219=
dbcf62ec5ede84
>>
>
> Yes, but not all systems seem to support raising the limit to
> "unlimited".

That's as maybe, but

prlimit64(0, RLIMIT_NOFILE, {rlim_cur=3DRLIM64_INFINITY,
rlim_max=3DRLIM64_INFINITY}, NULL) =3D -1 EPERM (Operation not permitted)

is a Linux issue, not a prlimit bug.

~Andrew


