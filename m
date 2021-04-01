Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FCA35153A
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 15:33:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104455.199764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRxRa-0005TR-DF; Thu, 01 Apr 2021 13:33:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104455.199764; Thu, 01 Apr 2021 13:33:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRxRa-0005T4-9d; Thu, 01 Apr 2021 13:33:06 +0000
Received: by outflank-mailman (input) for mailman id 104455;
 Thu, 01 Apr 2021 13:33:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Onq8=I6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lRxRY-0005Sz-F8
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 13:33:04 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b51ede2-3768-4e82-96cd-66e5c45d1d2d;
 Thu, 01 Apr 2021 13:33:03 +0000 (UTC)
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
X-Inumbo-ID: 2b51ede2-3768-4e82-96cd-66e5c45d1d2d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617283982;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WgvTekEWeEc0gEBpw9NIx3wGqTvh7izwE7TdeeV+6tQ=;
  b=NBPbPwx/jtpyGmn6T10z7fxqGQVx+ZPgQZaOZQRSN2cRNK7Urk9aSXOK
   C8r5q3H+KHNEDshnwK0/gnifYWF74yhukpH59Ou1KEwWOiPWverFo+0Tg
   CPeqEnwMk0HSfW1WntmhS7cf1ivbcNzgrInSM5p6tfH63ZmfK+PdpXG1E
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: t6PBrsHe+O5PWQWBtko7Y1XG1ug77vd2m5wkV+9Kh4jLt8tlA5XkpH5rg9u0Hu+nnypskeO63z
 EuVq+dG9b7ss+OopeI6KA5gyGATvfWF6AcjwUGFOum+A8HlUN1V6N3+QlasUhQyTbY/+gk4wZF
 zlVV6Ov3cFwHjjgh/b/QWu1BJe/b4tLCdggg4UqqU0yhPKw9xUj1FTAb4CBzMYbz8OQMUXRONY
 Ntgq3YLGR/6XNZmmcbd6PTvY93wfU04/L3vnOhdqbXsJmMMXU4TXW1urSTGTCvXvBAvQ34XcNy
 ay4=
X-SBRS: 5.2
X-MesageID: 40697609
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:FFlMn6+N9qxkUzy3SCluk+F1cL1zdoIgy1knxilNYDRvWIixi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmyybdc2qNUGbu5RgHptC+TLI9k5Zb/2DGIIUHD38Zn/+
 Nbf6B6YeecMXFTkdv67A6kE9wp3dmA9+SSif3Dymp2JDsKV4hLxW5Ce2OmO2dxQxRLAod8MZ
 Ka6NZOqTbIQwVpUu2QAH4ZU+/f4+DRnJX9bhIcQzIh4g+CjTSngYSKbySw9BEYTj9J3PMe4X
 HI+jaJm5mLntOa7lvn12HV54lLg9eJ8LV+LeGFl8R9EESVti+Gf4JkMofy2wwdgObq01oylc
 mJnhFIBbUI11r0XkWY5STgwBPh1jFG0Q6Q9Xa9jWH4qcL0ABIWYvAx/L5xSRfS50o+sNwU6s
 sitAj4xvkneC/opyjz68PFUBtnjCOP0B4fuNUekmBFVs8mYKJRxLZvjH99KosKHy7x9ekcYY
 9TJfzbjcwmE2+yU2rUpS1GztCqQx0Ib2y7a3lHkMmU3z9KpWt+3ksVyecO901wha4Vet1q4f
 /JPb9vk6wLZsgKbbhlDONEesevDHfRKCi8f166EBDCLuUqKnjNo5n47PEc4/yrQoUByN8XlI
 7aWF1VmGYucyvVeIOz9awO1iqIbHS2XDzrxM0bzYN+oKfASL3iNjDGYEwykuO7ys9vQfHzar
 KWAtZ7EvXjJWzhFcJixAvlQaRfLnEYTYk8pss7YVSTucjGQ7ea9tDzQbL2Hv7AADwkUmTwDj
 8oRz7oPvhN6UitRzvWmx7Ud3TxelHu3J55HaTAltJjjbQlB8lpiEw4mF657saEJXlpqaotZn
 ZzJ7vhj+eaqACNjCL1xlQsHiAYIlde4b3mXX8PjxQNKVnIfbEKvMjaXWhT2XCANyJuVs++Kn
 8Zm31HvYaMa7CAzyErDNyqdkiAiWEImX6MR5AA3oqO+NniYZF9Kpo9QqR+GUHqGnVO6EdXgV
 YGTDVBal7UFzvoh6ngpocTHvvje951hxruB9VVp3LZvUC1vtouWXMfYj6rXaes8EQTbgsRom
 c0374UgbKGlzrqA3A4mv4EPFpFb3nSPKhLFz2fZIJfmqnifSZ5SWviv03dtzgDPk7Rs2kCjG
 3oKiOZPdXGGEBUtHxj3qH2y19sbWmGc0Vsand1jJ1lGQ39ywRO+N7OQpD2/3qaa1MEzO1YCj
 3DbDcICi5Fxty81neu6Xy/PERj4q9rEv3WDbwlfb2W52ikL5eQk7oaW9VO+ox+CdzouugXcO
 6WdgOPNgnkA+cx1wH9nAd9BABE7F0f1d/40hzs62a1mEMlCf3JOVJ8WvU1Jcqf42WMfYfA7L
 xJyfYO+c2+PWX6ZoTYleX5bztfJgjSpmDzZecyspxQtb8zsrw2P5Sza0q+6Fh3mDEFaOHznw
 ciZY4+xpbrEIpmZdYTdCJU5UBBrqXFEGIb9ijNRtYjdlQshULBN9yH47D0uaMia3fx0DfYCB
 26yWlh5P/LUCuI6K4CB48xKWpQblIg6H4KxpL1S6TgTCGrffpE5ly0LzuUd6JcUrGMHdwr31
 tHyuDNu++cbCzj3g/M+RN9P6JV6m6iBee/GhiFF+IN09u0Pz238+eXyf/2qDf8Uj2gbUsEwa
 VDaEwLd8xGzgAYs7df6Fn7doXH5mQ/k1Vf5jl7llninqieiV2rY31uAEn+mZVZXT5aL36Sq9
 /KmNLojEjA3A==
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="40697609"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IdJWk2NxmslbdkFUGevaTWX8KS670H95SOb0WzGHt4WFGHoryjb26DIZsuqAIQ+82Lpp3SwN9XJb5Y/6+9jc21dQ6BqjMU2aJ8QK1ALfEPWYdeDXqRDUoB9Bkw6IZh1a/lJhpiHT66uKL6/AS4NGQL5ddReyB8GIdOoVkfQgCd92U89gU4U6cmGDXSs0cV0wGNusI+uIeMV/u1+lZ8/2IH8nIs0SD3eCvHBxpkpbfuO4pNGM4h3IfIHq87NylWH+qAc8NFpt9+3g7rGdIQPMVCZivdYAR+0yW2d1Ual28vp8tsURdNVDFlsRJbznfbX2NQUd9hNK9Rvjw3mB2mjaag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqhfqYHbcZHVO7ustC/BjskR5c/CovCVK45ufO95EOQ=;
 b=Np4CGdeAKD/5c8ss8INDHHBjvpgkQ6xmouRfsK1dfo9oOvIdlZshTbof17OLpUFXZyRFpLsNfG1Uzx5GwjEGXMmndODgXqM5iE5mGJi5wBMoch0ow8oNpLExMBjcLKfgU6XqKexF0QMjIcZEmv8Lw8d/jb7ll3BuFmR3tsnqTlHc87PCqydvtBvM1AIDHC3cvEAag4i00FIW3ah/JGRX6Haj+4go0wssvsF/Cgkv725OcY2LmbwZricjzAY45R+n+NKUDrSAFAG+3wBLJ5xXzBafu4S52dRhLcDcO9VuHm+3SqVTvWaB9Qk5dH8K32xeeU/HhHiObt2GG7GXbGhorg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqhfqYHbcZHVO7ustC/BjskR5c/CovCVK45ufO95EOQ=;
 b=HkFwt6o4w0Gx1sjwVlMvhY772pamacqJyM/M73VeBAkmZPDmfoxuJ6w7Nwkv2x0DS0kLTdWEYr2LAvPts9FdK5QB2AWPCK2DlLQcDOquQvtQAf2h5lIbgxb7yBGT2Ph97A80vZGQDYLJRzY/NT/nPN4QcYeLDMRAip1EdMa6tOk=
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <20210323095849.37858-1-roger.pau@citrix.com>
 <20210323095849.37858-6-roger.pau@citrix.com>
 <87d48996-6b8b-d801-c43b-30b919244fcb@suse.com>
 <YGRXzRw+wBP5Gm+w@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 05/21] libs/guest: introduce helper to fetch a domain cpu
 policy
Message-ID: <da79b1c1-b195-d11d-af1a-b694a0558220@citrix.com>
Date: Thu, 1 Apr 2021 14:32:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YGRXzRw+wBP5Gm+w@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0166.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::9) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 662a7b76-68df-464c-b82b-08d8f5129db6
X-MS-TrafficTypeDiagnostic: BN6PR03MB2515:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR03MB251549C6FE5A1716D421F352BA7B9@BN6PR03MB2515.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aamXuZBm0H6zp58xvnaj3Uue5NTr7/kqYT44iO3a8TPRruaQAlO1RhXVplWzlSmiNxyE8u5u3MxVbifksIRLsrnLPiMJFVq31ysSRC8M+uFNC7kIGly4mSJqc0tpjhla6Av78tPoP7FNWy69JoO0r0gacrhR19hWDG+Sp6Oz8sI2yB7Wqr2+WoJJ3zAth2z2ttxhpOaNZMspxnTJQYSpGvy6N2wjByg7TlzHty0wNvlvJnqdnuFjXeZKDK7Qg0UrUnP64MERPX4FnF4K8AHIOPrR3l/jfb1t0ULUYowILpT+5CLmtQ8cDkQY7NtaV08QrpCGMe8J4AhGZ4UNQK7z2sXjfsyUpVDPwpANdpMEjw5FGfVQ4JSh8uSLa/I6ODzlHAkL5ewSamI7EuOpLxhbpy4pApWwbY0L8W5kLaQJugAT3D/IeBTHs+YvTL/Lmzv1wElqm8AYTtwf1GNe9rzOLbrDQJefVg8U54DBCqPFst7ZBsgiJbBiVKE/2yuYFpuSulkf2jOE0E4AZ+fgB3h62xqycVQctlh4R0IQ7hnsLVD/VM/b22OE1BX2KVUyucyVlBABQp4jlqzlnW/glp6/rSYtSYypXm/ZoOHoP77lvclbMdIFN9PWgKBzAkx94hurSbw5csBZ0+VETf4ZbLCudCugKhbB6cQGy5PihInXw2Ym76YTxqRxxzJfkt0dIVJtWqq6B1o9GLMYbnLKijjp+r/hZWmMwrMwut7HTWinUgE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(376002)(396003)(346002)(136003)(86362001)(31686004)(2906002)(5660300002)(2616005)(478600001)(36756003)(31696002)(66476007)(66946007)(110136005)(66556008)(54906003)(186003)(4326008)(53546011)(8676002)(6486002)(8936002)(316002)(16526019)(6666004)(956004)(26005)(38100700001)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WFFUWCs5TFlQZStSeC9JTzZjTVhsc2VWa2l6bWhuMnlIR0xDeWNUenNHZUQx?=
 =?utf-8?B?RnhEbGxVRmpnRDU4Q1Nsakk5eWR5V0ZhUFFPYWl3WVhUS1J2STk4M3J5TVlw?=
 =?utf-8?B?UHJmTTROQ1p5R2NXb3oxa1JGUkhxNStPS3V2aXZtZzY1bFBjNmQzVW94ODdO?=
 =?utf-8?B?WU1XRllESEgyRDFxM21SQWpyQTR5THVOVENUdFU5bWY4dFNYdTNjRFQ1WldR?=
 =?utf-8?B?d3J2eDNOWENmUHkrVm01dmRDa3VtSjVrOGlTTWlCcVBodEFVV3kwM1g3amcr?=
 =?utf-8?B?N0hla3Jvak1JaXV1UHJrNFJteWhSaTNDalljaW40Qy90S285eXA5WkZxRkh2?=
 =?utf-8?B?dFdnbVpsWXhGeE8yTzhGQkxucThkdWJhcW5XM1V6cG9HL2VnNHNLVDNZcmcz?=
 =?utf-8?B?QlBoc2ptSWxLTGU1TGNLZDMrN3ZIZnU2S1BNNjYzM01jTWd0VlptdEllK2xI?=
 =?utf-8?B?QWphWG9hK0lmMFhaRUoxZmdnckVNQ2xFejA3VmlHTk1CVFdvSHVuaGlpNUpi?=
 =?utf-8?B?aUlZcFlxYjQ2RFgwSjIzYVR4L2h4dENMMm9OZngzWGFlT3pxcHVHYndTeU01?=
 =?utf-8?B?ZEw1Ylh3bjlWV3B5Q3k2YUNGNml5Szk2THZudHVmbW55RkJLcHhhV2toNUJT?=
 =?utf-8?B?VXZVRnJOR2JiME1vUXI4WVk0ekZ0QnJxNjhubGtGSEdoV1hEYVJyMXVLQUpx?=
 =?utf-8?B?WjJua0xLRzFZSVNhZTh4RmFyeGs4VmFVcW11UmJ4RW4rLy82YWNZMGUzU00x?=
 =?utf-8?B?OWRYQUlIM3RURHRIb0FiTVdDOVFXVm9vVmxGcGY3bWNxRnphQ3NFSXh6YjB6?=
 =?utf-8?B?WU9xNDJJNHhEVkNDRlNwSzlMRVpWNk83VWdLVnFHUTZrZ1N2ZWgzQko1azlN?=
 =?utf-8?B?ZitydEdkb2dBNDZ1a0VkK3dyUXdpQkN5WmhiM3Uzcy9ucGU5aDBhWndDUVRG?=
 =?utf-8?B?ejh2RkdwdFZvYkxlbTdkWTN1Q0NOQWZ0dnlicFhzYzZHbTJ4RkZRSXMybXg5?=
 =?utf-8?B?bnYreS90aW1mWlppUmgyRm5zVzI1UjVIYmVXRnZIVFJzK0hnSUU4QWh4YTRa?=
 =?utf-8?B?S3R2YkZxYnRXcFgwMHUxK0lCMVlHMGtkaGNOTkxzTHFJbW0xRU4rVk5DQXFT?=
 =?utf-8?B?MFFmS3I2S3VPR25Ob0ZYN3BDeFZEU1hIWTZNRi9ZbFQ5dUFTZzJrdkY0Sjl6?=
 =?utf-8?B?YlVjVElJUmN6bTByMjBQZDJPTnEvcnB2NmU0ZzZBbnQ3Uklqcm81VUNYR2Y3?=
 =?utf-8?B?aWp4TlltZE9HZFJKc08raHVXU3lDcFFKZmxDV3JMQnFwam5pRXpCYXVNTXJp?=
 =?utf-8?B?V3FBd0VrTGpnVWJYWnk0dzlJU0s3V1JxQ3RMbnZ1aU5tTzFYM2VYMm1JV1l5?=
 =?utf-8?B?K3ZBczNzSXhraHh4NFBHZmxuRDBiMkk2eUMwV1d5UHpSY1F5aTNzRU9yVXBW?=
 =?utf-8?B?YUdrNnJ1VzhsMThQUVp5RFMyV1MzNjBXM1B6TG5yMEd0bUZCeTNxVzAwa3hh?=
 =?utf-8?B?RFhiUW1OVGsxZ2hyN3dBejFNK3N2K2ZnckRiVnp2M1dYdS9oQlJPSWZzY3ZM?=
 =?utf-8?B?ak9Ecm40dUtVRlNpTExsTWFyMWlDbC9hRnhnb2xEMGJ2WVpzUTVzaHArdG5K?=
 =?utf-8?B?SGNDbkw0VXdBMVVoS2VXNHA5TDYyWVRxMDVLK1NrM1VuTWswMTNGNHpjMndU?=
 =?utf-8?B?cHR4Vm53MjNvTmtPZXJ3L29RWXRDbDdTLzJoRjE4Ny9VeFB2V1IyRUF1d1NG?=
 =?utf-8?Q?2nhLSkER4Ddu+l5HM/iQnNv5MhGA2jTRUHMkLV0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 662a7b76-68df-464c-b82b-08d8f5129db6
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 13:32:38.0257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6J++VQbTp+l+Mzdk1aLsWOc+bjaCS4qvbnUxhSpKawjsCv2tCQx7PZS59H0zMSTslaMXiq+e6hW58p5tfbCgda8x0ps7rM2w4JCn6BRZQBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2515
X-OriginatorOrg: citrix.com

On 31/03/2021 12:06, Roger Pau Monn=C3=A9 wrote:
> On Tue, Mar 30, 2021 at 05:37:02PM +0200, Jan Beulich wrote:
>> On 23.03.2021 10:58, Roger Pau Monne wrote:
>>> Such helper is based on the existing functions to fetch a CPUID and
>>> MSR policies, but uses the xc_cpu_policy_t type to return the data to
>>> the caller.
>>>
>>> No user of the interface introduced on the patch.
>>>
>>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> with again a minor remark (plus of course the same that I made for
>> patch 4):
>>
>>> --- a/tools/include/xenctrl.h
>>> +++ b/tools/include/xenctrl.h
>>> @@ -2599,6 +2599,8 @@ void xc_cpu_policy_destroy(xc_cpu_policy_t policy=
);
>>>  /* Retrieve a system policy, or get/set a domains policy. */
>>>  int xc_cpu_policy_get_system(xc_interface *xch, unsigned int idx,
>>>                               xc_cpu_policy_t policy);
>>> +int xc_cpu_policy_get_domain(xc_interface *xch, uint32_t domid,
>>> +                             xc_cpu_policy_t policy);
>> Generally I'd expect domid_t to be used for domain IDs.
> Me too, but xenctrl.h seems to consistently use uint32_t for domain
> ids. I'm fine to use domid_t here, but I assumed there was a reason
> for using uint32_t uniformly there.

There was a tools-wide change making everything uint32_t a while ago,
but libxc itself has never used domid_t.=C2=A0 IIRC, it was to do with
problems concerning the INVALID_DOMID constant.

~Andrew


