Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC08F3BA46F
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jul 2021 21:49:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149327.276104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzPAA-0002eX-MZ; Fri, 02 Jul 2021 19:49:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149327.276104; Fri, 02 Jul 2021 19:49:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzPAA-0002c1-JF; Fri, 02 Jul 2021 19:49:22 +0000
Received: by outflank-mailman (input) for mailman id 149327;
 Fri, 02 Jul 2021 19:49:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wENR=L2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lzPA9-0002bp-1u
 for xen-devel@lists.xenproject.org; Fri, 02 Jul 2021 19:49:21 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f6bfad3a-4bfc-4041-ba76-585be361874c;
 Fri, 02 Jul 2021 19:49:20 +0000 (UTC)
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
X-Inumbo-ID: f6bfad3a-4bfc-4041-ba76-585be361874c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625255360;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rgW8C+eifQjwPHLKw03S1HEEEfQoGZN/ty46eG1nTFs=;
  b=fSQQlGrdRtuBJfpnmnpSCn8a6t8nqbl8mBHf2Q8OZPAe1v9A5Sgd0ZIV
   tatc7hZijhFKBzEbXKfZjal+/2+slG0Y8LpAWeWoGZeBBfRT8XZKGQYa/
   fKWeJZHOmLzUUByJ5cs1yDjuahzB2fQDWyRifh6LXFzLi3Ex+Otx0cB6f
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Pu2RNO5O3GfQ+IKxB5dpfof/CEFUGnAJlX8ZsnBjyIkelvLKbbS3odC2nBqAYL43kADqnBWBxj
 Ph4E/YmoX1cuLUOEAz/GqQSiiq/wyyZsNTnKIXKq2uMDOq/G/ewxxeybk3Nl6Z3U4orW+xs7u4
 LXFcEwPZm4uoBV6DE91OnqIwIxf2OZdSZuqrEyQMHbzRaVsUnCdOoHDgyvHkVmgPI66MO+08Dl
 fPseAJDASZ7eRjiXv9FaP86F9BVQ2r/pdICEQvHlQDqqgaLo/FFGVL04rbZDhasIVYplDBKGhs
 jik=
X-SBRS: 5.1
X-MesageID: 47554560
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:T4Cwj63a8bWsp/GYzP8Y7QqjBV9yeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5OEtBpTiBUJPwJU80hqQFn7X5Wo3SIzUO2VHYUL2KiLGC/9SOIVyEygcw79
 YHT0E6MqyMMbEYt7eJ3ODbKadZ/DDvysnB7o2yvhQdL3AfV0gj1XYfNu/yKDwEeOAsP+tBKH
 Pz3Lsjm9PtQwVsUiztbUN1L9Qr6ue7267OUFojPVoK+QOOhTSn5PrTFAWZ5A4XV3dqza05+W
 bIvgTl7uH72svLiyP05iv21dB7idHhwtxMCIiljdUUECzljkKNaJ56U7OPkTgpqKWE6Uoskv
 PLvxA8Vv4DpU/5TyWQm1/AygPg2DEh5zvJ0lmDm0bupsT/WXYTF9dBrZgxSGqa12MQ+PVHlI
 5b1WOQsJRaSTnamj7m2tTOXxZ20mKpvHsZl/IJhXA3a/pcVFZol/1awKppKuZGIMqjg7pXVt
 WGTfuspMq+SGnqKkww5QJUsYWRth1ZJGbyfqAA0vblmQS+0koJl3fw//Zv6EvowqhNAKWs19
 60RZiAq4s+B/P+TZgNSdvpEvHHRlAkf3r3QSqvyAPcZdA60jT22sXK3Ik=
X-IronPort-AV: E=Sophos;i="5.83,319,1616472000"; 
   d="scan'208";a="47554560"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g1TJij7fKF6HiWndX2m0nt5bcF+Vh3JnQlduLBdB1oz9bC1dghIcCUKYvGosUv3OkjZ5ddtfcZQsk0FJUmO8a1BDYx9sBmBTCGOCx+B/sCRB43OFnyHVh2BDi+PwbpfgDesg+l04LxRYvfZS52FMGiI2H783kmVrAYXom3Ym8clh+D3E/wyDr3Kp22fi1bmnipY3pzCcPx2BZ2wKFJ30y/cMVbKhjPTqxfeDSf6HZJcrR7loa/MbfxoEqV19C6EEEuX5R8pS6XBTNij/X54UPhntgpGonz0sELF171+UY+LW6OzNBl3zHp6u6yx6QWc8KOWQr8ZzYKa6Zbb+PMjUhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i7N68Ya0uhCMnAoSNn5iCyw/Z8cNK+0b8HcO4R8m5OY=;
 b=PlrTqP6A8mpZ240ZHFAhu9HRJ1pPQzlJ9g8MPebYgP+4FqEXARHq+mXWRux0YXc6PDEEVh+eu5XwD7qtDsff3BnaSXgzpTc4xeZsg1Ha2YcOaXyozHu5bzAIiaUQLRq2ca46itDnWqgIGAdtUiuxfGl7p6Yp7gL515k2NZxqf4vyXa3hyCsaCZl8ZiodS84CNG5ZuxqiY07UhDXtOvwCtOFD879Mmshz29GLbCG+k1E1CJ2XRRBXfIuvy70yCeP5QUkd0VGBMRlXXjDtXT6K32pfw7pkXjzOnSxZKsttF1EO2LshdJ+hc99mdbGzvqXjvnAu2LFYcOZx2AD/HUg8Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i7N68Ya0uhCMnAoSNn5iCyw/Z8cNK+0b8HcO4R8m5OY=;
 b=sMQb0CSSObXLe570VqDhfq+/+KMcQZW4qrXu7KcgL4rWtoM3e2J3BguryJElvqExx5ThgpBj69AqT5uux9Y7EUNts/fK6V6lzuUBmFtUn6kyfIi7eBV6ffLA8Ybl2pVCQIanCmGZ1+5JBOxJ2ToNIPTsS9CNQrRFq4HNghCMVo0=
To: Olaf Hering <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
References: <20210701095635.15648-1-olaf@aepfle.de>
 <20210701095635.15648-14-olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v20210701 13/40] tools: unify type checking for data pfns
 in migration stream
Message-ID: <c8735173-53b2-6b50-49cb-ebfee8863e3f@citrix.com>
Date: Fri, 2 Jul 2021 20:49:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210701095635.15648-14-olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0054.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 861b2a03-5e29-4148-5e8d-08d93d9279c1
X-MS-TrafficTypeDiagnostic: BYAPR03MB3942:
X-Microsoft-Antispam-PRVS: <BYAPR03MB394205437C0313478B8493F9BA1F9@BYAPR03MB3942.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:644;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YJLadaferQiwVYamK8BYiLInt0yRxrv+D+jF5tnjZpjORTM/SV4nqxdmftajLzYDzCvi3P0wDXPWm+V0I730+0zWztBnEarbhMXOJftE2Q25up2oFLLj1LGsqSIX2T73hecnGNiztrfFSNdQy5atrhZg3y20yANfMivBAW1+YAeWZb1fjhyDatX4dQvYuP6VhPTOX4aidXeiEFzTrrWxPstogoAGVUi5+z43wZG9uhsEu8EFTNcoEC7nLbLnHpJDmJPx6iGwA469iuSxWiZcYrrEicP6e10wvvLTgQ25zCWooMYNAyZzUyo/hGCj43N3IxpGhjckM86OPk8Twtbc+h7d1u/NpOzDI+N9jRKWahI8AtkGWHVRlHM+EjZJrens6hBXLOxfz6LQk4ayZQnmMnOHw66qox9z0skN7Mb+aNXlD8GrCaqU1EeRGGmBeQzY7V8yP4yxLtFLwucBPrn/zS3Mh5mkuStlujRxo+rO502FQLBZDs9DcpWteWK4xv/MmP6+tfXAUNbWh8e9BKM+fTwB89h7E/LLtcUmVLZH/Kb5qoSEr842X3a8GeMdVElwzuHKodfCubZ1BTjgYCd3PWTS4zLQys+Q1Cm8WF5UKNpWCRQcOjBv+VgpwvaxrVKzAql2KD4zo/t0ZBXg8Au2FzR8nBXp+PmCI8bq3nvlzSQehGbwajrG5tLRIqfh0ab+1Md5ufIY4SjEZRAMlhnJche5Hopq6KHodk0jSvePGmtX7DF34zV5k8fR2HqnAhFW
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(366004)(136003)(376002)(346002)(31686004)(86362001)(83380400001)(38100700002)(31696002)(8936002)(4326008)(2616005)(956004)(66946007)(66476007)(66556008)(16576012)(26005)(36756003)(478600001)(5660300002)(6666004)(53546011)(4744005)(316002)(54906003)(8676002)(6486002)(16526019)(2906002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWs5OGhUNEhtNlMxZDVnZnV2VStnZ2xDOVpBejZHKys2Nzhtd0ZLZTdCMzcv?=
 =?utf-8?B?WXVoY2hJUW4zN0l1TVBjUlBhZzlkTzlxL01JdEd3cWx3Z3A3TkFjbUxNbmda?=
 =?utf-8?B?dmczWkE1RHo5djRLb2ZzWEZLd0VZRG9veWlhN0Y0TWtjVjJHYUJhYnlycWpF?=
 =?utf-8?B?ZEZvQXRPZExmSXd6LzhqRUZlR2k1ajdBRTR3VGdxZ2VKc3pnVzI5czlhSTg5?=
 =?utf-8?B?N0F4T0JhSnl0RXQwN2tVeXFUN0tOdFlmalVuWUJQZjgwUC8ydjdKR1hxR2xm?=
 =?utf-8?B?KzI5dFBFaEhlRTBibTF6NjB1SVpLR3NHdkpQSmJwWnAzWU1na1lTK2RSdkY5?=
 =?utf-8?B?dTZ5bFEzYmY4aDZSVEVyODZIeHZxNG1sQ0Z2VnVINVpjQ3VDTHhtUEFJK0lZ?=
 =?utf-8?B?OHJsWDdOcW4yNTlnako3WjdMNUZPQkNNbFpDWkxxMk5qUWZmVUhhYWJOTlBI?=
 =?utf-8?B?ZFNoWEkrTlNod0s5YjdHSUgvWks1NzVxWDA0RndlaU83QWZnTFJSd2dMWi9w?=
 =?utf-8?B?dElFaVZ0NFJiaVY5VEEzYTBqRFRmWkRPNnVYL2ZKcER0MnU4bk1oK0lCc2w4?=
 =?utf-8?B?S1gySnZvckVhbUcwU0hvRnJuanlHNlNGM0pDY0hUdWN4bmQ2ZURNSlRqSjlk?=
 =?utf-8?B?NS9mcGIwMkJ3K3V3YVRKelpDRDROM3dNMC9ZOVhJMjJwYXh0ODJkS0Z2Zmhm?=
 =?utf-8?B?UnY1MkR4ZmdyaTMrZlRtSUZDR1k1bVpRWVhkUmE4a3lDa0FtbkJHOWNQUEV3?=
 =?utf-8?B?SWpLSDZyYWd0SnlwMFUyRG9NMzBGVmRweEg1YzBSYyttR0l6WDZqNUJ3WkhZ?=
 =?utf-8?B?Y3llRnA1cXl5YU1oMFRlSVozYXFJbVI0bzZNWEVwU2Fqem9IRGxhUEI4VVl5?=
 =?utf-8?B?TnRGTXhUUGVRakVQcHpTalpOSUgxZTJmV2xvWSt6cHE1NTQxUytDRnAzT3NO?=
 =?utf-8?B?ZWpFZzNEUGo0SG9DbnZXNnJPMUtraGl3TWtqU2Rta1phOE03dk9KN0c0QUM4?=
 =?utf-8?B?cEViU1NGWHdNeVF3NW9BSEhtVkNmN3BybmowQWgxT0VsWEpsY0RnLytESzZR?=
 =?utf-8?B?eTAwM3dCT0hhRlFBZDVGY2ExOExjN3pVd3hOMFRmZzBxWDdKc1U1Ym5MdldY?=
 =?utf-8?B?KyttWVBVSDN2MEhTa1hVeXhGM0ZCSklBYThVTGJMOXpVYVFKdG1mT2tSREg1?=
 =?utf-8?B?bU54U2daYlcvQnJUaTdPbFVDZnlaTkl3WUFTRmxVN2dmSkRKWW5IdUJ6dGRK?=
 =?utf-8?B?V0R2U05rNzJ0T3hnQlpsejl5M1kyVENGcTc1ZUdpTWxKTGZOemN1ZmN4bUlh?=
 =?utf-8?B?Y28zNFpUMXFkOE5IdHNCU29jSkttUjlnaSsyVUt3VFFQcm1YYzNJbnllSU9Q?=
 =?utf-8?B?aDZSSFFVYjdFNjlhTHhKS0Fsa2l4S2pCSitRWW1MQkZWUXhuUklNUWZ6VitF?=
 =?utf-8?B?bXVjTzZIVVF6d1ZNZDdvSUhrTjN6VDJZZ2lUVVlDd28vMDI3OENXSGl0SCtF?=
 =?utf-8?B?WVRuWTFveURuT1Y1dk5YUU1Oc09mSHBkTWU2YzM4eHVGc0RCZGU4dWFxMVlS?=
 =?utf-8?B?c3dYYTVMRmRBWnVwa1Y3cmpPYWFJODhsOGt4UjFzQkpITE40Ni9DYW5jT3pj?=
 =?utf-8?B?aTVzY2JhZW5NMGowMlplM2ZjcW1OV0dPSEtjQkluYSthcDJ4Q2VIT2Y2ZjhK?=
 =?utf-8?B?QmhIQ0ZnK1hEaFU3SlhHN2p0WkpUTkxkNzl0aVFuKzN1a3h4NERTUXdIK1h2?=
 =?utf-8?Q?ggQDs8wrE7pwBtsYHPSyV2yEQOnV5Av65WMqcHf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 861b2a03-5e29-4148-5e8d-08d93d9279c1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2021 19:49:16.8780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jnJyu0vtBs0Fvx5040oIxy18gABPryTzteri4YjULepcZnqSlXtgJIHI+KBdyZfpxoJdyoPMoeyqyJbE6DEIhwqDpqTken1xxW+jUJeIORo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3942
X-OriginatorOrg: citrix.com

On 01/07/2021 10:56, Olaf Hering wrote:
> diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/com=
mon.h
> index fa242e808d..905b4078f6 100644
> --- a/tools/libs/saverestore/common.h
> +++ b/tools/libs/saverestore/common.h
> @@ -517,6 +517,24 @@ static inline bool page_type_to_populate(uint32_t ty=
pe)
>      }
>      return ret;
>  }
> +
> +static inline bool page_type_has_stream_data(uint32_t type)
> +{
> +    bool ret;
> +
> +    switch (type)
> +    {
> +    case XEN_DOMCTL_PFINFO_BROKEN:
> +    case XEN_DOMCTL_PFINFO_XALLOC:
> +    case XEN_DOMCTL_PFINFO_XTAB:
> +        ret =3D false;
> +        break;
> +    default:
> +        ret =3D true;
> +        break;

As with page_type_to_populate(), we shouldn't really default the
unallocated types to having stream data.

Subject to this and the other style concerned, Reviewed-by: Andrew
Cooper <andrew.cooper3@citrix.com>

I'm happy to fix up all the issue for the page type helpers on commit,
if you're happy.

~Andrew


