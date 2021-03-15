Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5C833B35B
	for <lists+xen-devel@lfdr.de>; Mon, 15 Mar 2021 14:11:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98005.185829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLmzK-0002Iz-03; Mon, 15 Mar 2021 13:10:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98005.185829; Mon, 15 Mar 2021 13:10:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLmzJ-0002Ia-Sx; Mon, 15 Mar 2021 13:10:25 +0000
Received: by outflank-mailman (input) for mailman id 98005;
 Mon, 15 Mar 2021 13:10:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQgs=IN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lLmzH-0002IU-It
 for xen-devel@lists.xenproject.org; Mon, 15 Mar 2021 13:10:23 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 99900c39-ac89-4816-8800-d70180679a22;
 Mon, 15 Mar 2021 13:10:21 +0000 (UTC)
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
X-Inumbo-ID: 99900c39-ac89-4816-8800-d70180679a22
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615813821;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kjWQGlDwdH7nECD7Bk+xM0dhigSxiu1m+WywbhwPd24=;
  b=FNtKqvjKDh0uK/gzbQ9Z2PnvMyRWLwRQr2loU9kNIlCUWCF9S5j58jsP
   60JxuK1P9vigsF5mY0WtaW+ccYQqIoIn6puLmxUuPocX8KPdFueAkM7l8
   res5FuRLYTtqV1Eaq3tsnEEDN9d0VU+mSX1wnF0RA9Wo+CMKBy17iGNLS
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: UYNE7QZKHapMC/dpTDfaT7IdEbCxDrVuy8n+ACm+4IOYeUvEqrkjoBRt7fAvSx3xMI3oGisTiw
 e+JX3tW6VdsAqjh79MMjCu5fMDJQyNbZabS69z/1pHs8ByrnWlWcCpw6W2WnyvC0rA8uXeLr44
 H80vwhigh+cIV/GgX21lMLv5SOxfLrU+uNLwdC+ndReJ3zQcg/lREaJbUTFvpLDQ8ZJvYR6huU
 +I/pCcRDKZDxYEA/iGGG/yyD/3vq3OsHmHDazrpBzII+m55pnuw5Pb4r9tmzmTiqQP7EBw/701
 nVY=
X-SBRS: 5.2
X-MesageID: 39301357
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:GG5kza8p6PzPsuXM0XJuk+FRcL1zdoIgy1knxilNYDRvWIixi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmyybdc2qNUGbu5RgHptC+TLI9k5Zb/2DGIIUHD38Zn/+
 Nbf6B6YeecMXFTkdv67A6kE9wp3dmA9+SSif3Dymp2JDsKV4hLxW5Ce2OmO2dxQxRLAod8MZ
 Ka6NZOqTbIQwVpUu2QAH4ZU+/f4+DRnJX9bhIcQzIh4g+CjTSngYSKbySw9BEYTj9J3PMe4X
 HI+jaJm5mLntOa7lvn12HV54lLg9eJ8LV+LeGFl8R9EESVti+Gf4JkMofy2wwdgObq01oylc
 mJnhFIBbUI11r0XkWY5STgwBPh1jFG0Q6Q9Xa9jWH4qcL0ABIWYvAx/L5xSRfS50o+sNwU6s
 sitAj4xvkneC/opyjz68PFUBtnjCOP0B4fuNUekmBFVs8mYKJRxLZvjH99KosKHy7x9ekcYY
 9TJfzbjcwmE2+yU2rUpS1GztCqQx0Ib2y7a3lHkMmU3z9KpWt+3ksVyecO901wha4Vet1q4f
 /JPb9vk6wLZsgKbbhlDONEesevDHfRKCi8fF66EBDCLuUqKnjNo5n47PEc4/yrQoUByN8XlI
 7aWF1VmGYucyvVeIKz9awO1iqIbHS2XDzrxM0bzYN+oKfASL3iNjDGYEwykuO7ys9vQvHzar
 KWAtZ7EvXjJWzhFcJixAvlQaRfLnEYTYk8pss7YVSTucjGQ7ea99DzQbL2Hv7AADwkUmTwDj
 8oRz7oPvhN6UitRzvWmx7Ud3TxelHu3J55HaTAltJjirQlB8lpiEw4mF657saEJXlpqaotZn
 ZzJ7vhj+eaqACNjCP1xlQsHiAYIlde4b3mXX8PjxQNKVnIfbEKvMjaXWhT2XCANyJuVs++Kn
 8am31HvYaMa7CAzyErDNyqdkiAiWEImX6MR5AA3oqO+NniYZF9Kpo9QqR+GUHqGnVO6EhXgV
 YGTDVBal7UFzvoh6ngpocTHvvje951hxruB9VVp3LZvUC1vtouWXMfYj6rXaes8EUTbgsRom
 c0374UgbKGlzrqA3A4mv4EPFpFb3nSPKhLFz2fZIJfmqnifSZ5SWviv03ctzgDPk7Rs2kCjG
 3oKiOZPdXGGEBUtHxj3qH2y19sbWmGc0Vsand1jJ1lGQ39ywRO+N7OQpD2/3qaa1MEzO1YCj
 3DbDcICi5Fxty81neu6X2/PERj4q9rEv3WDbwlfb2W52ikL5eQk7oaW9VO+ox+CdzouugXcO
 6WdgOPNgnkA+cx1wH9nAdiBABE7F0f1dXm1x3u4DLmgDoRAf/OLE9nQL9eCdeG9GTgT+uJ1p
 I8rd9dh5rGDkzBLvq9jYfQZHp/DzmWh0icZeQhs4pVsqI/r6EbJeiSbRL4kFV8mCwjJ8L1nn
 4ESKt14Lr9KpZiFvZiDx5xzx4MrpCzN0MlvQz9P/8mcXwsh3HdOcmV47Cgk8tYPmSx4C/xM0
 KY6StT4rPsWDaCz6cTD8sLUC5rQXl5zHRp5+WZcYLMTC2sauFY5VK/dluwaqVURqTAObIeqH
 9Bkpy1tt7SUyrzwwbLuzRnZopI7ma8WMu3RDu2JtQgya3yBX28xo2w4MCyiz/rSTy0L2Qg7L
 c1C3A4X4BkkTktjIo+zy6obLf4y3hVymdj3Q==
X-IronPort-AV: E=Sophos;i="5.81,249,1610427600"; 
   d="scan'208";a="39301357"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gqll/SR6rdF4qLGK9yORCouEJWfQF8MD9PfacGneCCYcAkCUsbCirNK9lrLFzE1r+frynnC9CpTac5/nG5hr5yuQXBBWfIeTkoR5otm03SntGAfsrZxS/uwY0B892XWsafF7fPb/kZ9iW7KVJ6zY8uoJnu30rBYmsZAGJPNXtPc7oEtONVSURVDGwUHIfndofaoG/vY3GI5Ig6x1N0FNl6tl2lfW11oUwLR1VRwPGKBuvmWgrBvwGP/uv4E1eiWH3CT0f5Ub2rx/IZQ6BJ8fTqtzZo6z/LVvv3TyeTOiEHfzNxy7I9K9ERayPzi5YiLvBd7koAdGjFVrkmDnWqojBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kLg4WT1Sz6m6LfVms0NcqEnTwEcIwi1eOjbAh5DHhQ=;
 b=P6qLpjikYtvehLv+52Q2hGFJkbMZo4NW6yV/FVHgur9RtBMGuDF7fH8YCY0xR0VQrMdF5q0L4H5kj6xBNQwWSO5VPG1ThL0tlC3+c6GAF9ZVygm9Vv8IKlhWu25iHLzisf3leSm3uBzFMORS7zigA20MXentgKMSKAnixCAuDksEt3aCiQ9Kryf8MlMY0Z54WYJjvBF2oUXYiiyXDHMOyW0YV9R3pWewmXINrzUYhMPk0oWOGywBi/RAJ4k5hj8lIVRoJqn8x0129NqFb4jg6tfSnG2vqKn+6ehbcE9eGUzNVhWZEB7t+499mSB6LP9ZeJQT5jh3FJx3QpfoQ2ltqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kLg4WT1Sz6m6LfVms0NcqEnTwEcIwi1eOjbAh5DHhQ=;
 b=Z2Tqf8v1tz3BkW2i0r4O7UTh898xVfi72Udlt6GX6yHNfPia7VJWwJByvjtuVV1k1a0Owqe9TBUQxB8CI58t/CiPIxeCIyV97YC10t6UeJ4sQzVbissW5TkZedgedS5TBqgZmOg27UY+cFhivRoKs5tppsya++Bfcq6/RAc3/1w=
To: Ian Jackson <iwj@xenproject.org>, <committers@xenproject.org>,
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?=
	<frederic.pierret@qubes-os.org>, Dario Faggioli <dfaggioli@suse.com>
References: <24655.20609.834996.744652@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [ANNOUNCE] Xen 4.15 release update - still in feature freeze
Message-ID: <f51a833f-5ca7-ecef-01da-2192123d661f@citrix.com>
Date: Mon, 15 Mar 2021 13:10:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <24655.20609.834996.744652@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0151.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::12) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d940651-696f-4d42-b638-08d8e7b3ad1a
X-MS-TrafficTypeDiagnostic: BN8PR03MB4801:
X-Microsoft-Antispam-PRVS: <BN8PR03MB4801501D1FA3EE418E71CECABA6C9@BN8PR03MB4801.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: psGp3QT7ikyroxp4r9zmrkzedYs94QBMoMrqUGIsbJ6VA7CHQoGBy145Bfus/Wl2nR/cD6+lyN9EPtjwgpM41Yrhp+MqfXcO/afrsVqTeY6X97VZ0FGhHsgfCPIqlCTm3N/xX4/gkhUZCe99IlobzyLNaMTHFdAZhGSD3/7OmwtPS8VQ1fZCRGbmSwhoyi90RICtTbPrcGYJjr7/2PfCRBCcyv9Y4cKy/m95Y5bXz2ad2h9WOKZsTVDivFzOMFzfTZVhetQV/H++dCOX7zUVTGrwbbmQnqsaKhQXtEDyQBkZsgajzwOQB0xgFBXmsMFlpl4dLaGUpFOTT6R6Pgoz2PzBp1ygBfFv2/oRe+GPP4NLHWLB5z/C9/iyLcOzBHd97xYaBgABObyEwxlZEPcawXnFwgJOZighFJysmSTIJmA+awUHFP6CkRRxMhNm0X5njE6rCLvJ3Q8wkz7Rt4qG65C2hyGZdQBAG7DnRiUQzPGHfhVDV3BcVBiQlMD49II5aIFSM72R77m6Oh0GeJeXeDxoO61qXM6PlDvO3+G9krBjXwk8xPhxYzshppvbrmPJ4W0lXwQDp/bmQnUC5su4CZGnPorkMrwtusv8Ag4Z+NYI0GQaG5w6lLIcv+y3fSUyu9Rs1+HOO+2ajLKWragO7TcEZ0SO76RXuBSEAcDJNSFCtA/jf8AGqojEivrO4aIc2VInmz30tRFpfSsAMpAtn3Heof/tf3VwWbkCJM4Cwjo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(366004)(396003)(376002)(346002)(8936002)(83380400001)(66574015)(2616005)(26005)(36756003)(16576012)(6486002)(956004)(2906002)(66556008)(966005)(54906003)(478600001)(66946007)(86362001)(31696002)(186003)(31686004)(53546011)(6666004)(66476007)(316002)(5660300002)(4326008)(8676002)(16526019)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?a0VXUi9iSDRvZmVRdTBtWmdBOU5Pa2FCTUZVRUpoZ0NXR0VXQUhMeUpqYS9D?=
 =?utf-8?B?QzdzdytGOEtWRTFobVlRajZUU0RSWUxiK0NEVDJoTWVHZlorUjduVHQxeDlj?=
 =?utf-8?B?MXdpbU8wVlFlV0U2cDdOYmx5ZkJNYzhZNnQzWThjZ2VuU3JDM0RYN1o5amJ0?=
 =?utf-8?B?Rkp4Z0ZTeC8vMks5WHN1enJmSTBxTTBlTnIxZE1qNEtiTVdhT1pmVVN2MmQr?=
 =?utf-8?B?dGgzOWxxSVJ1N253N2ZaczgzeXMralhpSGlPMmJwVlBkOEVrMWVBNGtpNjJR?=
 =?utf-8?B?OGhVMjY1dk9GYWhUdlpSRjlHNTNtNnVrVlRsMEV3bld3bklvVzJnRWhHcDUx?=
 =?utf-8?B?Yjc5YUhBVjlDSm8veS9BZ0F0RWNmRHdJcWhpbzlZQk5tWFVKV0NpY015eGxl?=
 =?utf-8?B?SHBLWlBwK3FTZkxrOHVRdkdSaHUwTjJ3UllrZUhqS2ZMRFhybDhMV0lKZ0FO?=
 =?utf-8?B?U0l1V05mako4a21SbUZMTGRrd3RpWjZjeFRYd0dkcDhDaDZiUnEwR2xXK0g3?=
 =?utf-8?B?TEUydUpHRXZhT2RzbFFnZFkzUTlRSTdDN0JsM1ZiM3dhS1diQmwzM3M1dmJx?=
 =?utf-8?B?ZFdGM3pNbzVoQjFOSVJONnAweEt6RlUrQkpoM3pJcWdFK0FtODVoclRBRUlk?=
 =?utf-8?B?RlV5bDhlMnJBdllaek1xREhmb2pIQzhHV3dzVDI2RVAxMnFmYlRJc3RiQVpE?=
 =?utf-8?B?YS85dXZVNGM4cG5nYURVamtIUUZvVk1jdjVjZjhqWjJ0ZjZ2VDh4a3NWYXhM?=
 =?utf-8?B?ZWN0QkV2QWQ2VlVEWHlMZXBCY1BwTXFWTWcrSGswekRZMzZ5Y3JDd2xHaUhv?=
 =?utf-8?B?UEU4MnFqNEZ2VkVLTlppdlZYckl1SjVaQmR3S1JDbXo3dTVIYVNncFY3OHZi?=
 =?utf-8?B?a2pmbXVHa1I3YWJScW9DV0Y0R2ZFeTZRejFhWnJUeENLZE5ZZHVkNm5Uc2VY?=
 =?utf-8?B?c1FwZnI5UlJWVzRoMkFaOFJPb0xKUXdyQ3N1L1RaV3NRTGVFODFlSDRDZE1m?=
 =?utf-8?B?RG5tczYyMnJIbTRWY3BVSXp2N3J4K2pDZlkxV1R4bEExb00xcHI0UDQ1VVdO?=
 =?utf-8?B?SWtmSlNRckpvWCtucy9BWHdKd3o4RmRvb0Q3d0pUMDZVdElsMlhGOS9yNXc1?=
 =?utf-8?B?cm9lTmU4USsxcFQ1MDc5V0t4Wmg3ak5paG51NWd5M3B0enhYSjBlU3FDRm9E?=
 =?utf-8?B?NGtZYS9JREt3Rm01SlMxZWNUMzIweVJrWlFNK245UkhGQnFkK2VYM3pUM2ta?=
 =?utf-8?B?c3FTd1RRSVlaVWRDZWxrQkJVTFRXU2cyQ1E0SzEydGF0bXVHWUIxMHI2cGxt?=
 =?utf-8?B?RWtrcm5udEVTeDJaM1p3NlJIUE9RazV1aHZ0SW0za2JEUVhVbW9PZUFKWDVO?=
 =?utf-8?B?bTFOa0hsMjdyY0Y3YU1ndDIrYkVObU14a1c4OWZ2TG5tVTUrM2xqYkNDRXRR?=
 =?utf-8?B?UmdUNzFCb2hzK3ZPYVdTVnVHUXFSZFJZMjg0NnNrOG84YlRRTlZYRlphQ2hL?=
 =?utf-8?B?Wnhvazg2SCtTTS9ydUNVT2FtMlkzMjQrZTdka01mRDRIck03SzhDUWtVMVQ1?=
 =?utf-8?B?L1JiR0RUT2xIWVJ0Wml4ZndkT2pKVnJYRmJqd1U5Wm9CcVhlOXEyS1BJc0Ix?=
 =?utf-8?B?VmFLYWozdlFISnNkRkU3bGE4V2tscVZzb21xNjVsYTRWV2FiSnhOSVdyVTh2?=
 =?utf-8?B?Uk5YYmJFMmZla3JxYi9yUlhMcmk1SFhlMFRWeWt3ZFkvMXRvVEx1bENUWmpW?=
 =?utf-8?Q?DetMwAdZiaY+0FLvQT8xgWb2Xf9VM/bIeokT06a?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d940651-696f-4d42-b638-08d8e7b3ad1a
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 13:10:16.4465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jJSSAaTUiMHdKEGyZFI9BfPHn78iiqpGmI08G6RuM3nm9kEJggIPE7xeN19t3IaXzLzwBRrH8Fsxn23xwpNFiU0qvmcD4EJFfk9IYDzlrw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4801
X-OriginatorOrg: citrix.com

On 15/03/2021 12:18, Ian Jackson wrote:
> OPEN ISSUES AND BLOCKERS
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> io-apic issue on Ryzen 1800X
> Related Qubes issue tracking this:
> https://github.com/QubesOS/qubes-issues/issues/6423
> Information from
>   Jan Beulich <jbeulich@suse.com>
>   Andrew Cooper <andrew.cooper3@citrix.com>
>   Fr=C3=A9d=C3=A9ric Pierret <frederic.pierret@qubes-os.org>

Debugging ongoing.

> ABI stability checking
>
>    [PATCH for-4.15 00/10] tools: Support to use abi-dumper on libraries
>    [PATCH v2 for-4.15] tools/libxl: Work around unintialised variable lib=
xl__domain_get_device_model_uid()
>    etc.

The libxl thing is already committed (2ff2adc61fcfa0).

> This is testing/build work and will enable ABI checking of future
> changes to 4.15 after its release.  I don't think it's a blocker but
> it would be nice to have.
>
> My most recent impression is that there are still some loose ends
> here.

Plan 1 (committing dumps into the tree) won't work.=C2=A0 Plan 2 (OSSTest a=
nd
other systems doing a double checkout) probably does require a tweak or
two in 4.15 to make it easy to start in 4.16.


Also, "xenstore_lib.h and libxenstore API/ABI problems" still has work
to do for 4.15.

> ISSUES BELIEVED NEWLY RESOLVED
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>
> Fallout from MSR handling behavioral change.
>
> I think there are now no outstanding patches to fix/change MSR
> behaviour and there is no longer any blocker here ?

Still one known issue remaining, as pointed out in Roger's summary.=C2=A0 I=
'm
still working on it.

~Andrew


