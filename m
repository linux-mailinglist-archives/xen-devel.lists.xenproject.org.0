Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1BB36C6EE
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 15:21:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118503.224679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbNeG-000744-Mj; Tue, 27 Apr 2021 13:21:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118503.224679; Tue, 27 Apr 2021 13:21:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbNeG-00073f-JP; Tue, 27 Apr 2021 13:21:08 +0000
Received: by outflank-mailman (input) for mailman id 118503;
 Tue, 27 Apr 2021 13:21:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vdCB=JY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lbNeE-00073a-KG
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 13:21:06 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8ec2ecc8-ee4b-4c16-8cc3-143e24368119;
 Tue, 27 Apr 2021 13:21:05 +0000 (UTC)
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
X-Inumbo-ID: 8ec2ecc8-ee4b-4c16-8cc3-143e24368119
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619529665;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HxO45XiQmkjoqoXBwjfek8oYkGhQ66n/lVcY1VECMoQ=;
  b=W4JjTq0wbIyfSqFe9cN11CpDG+xBgG2UOdRwxPYfuB8PXj/O+shcDHcG
   OlTARHaJ5NRdcCoPdyWibxr0JT/6gvJhco6z2sRHDAoNPeHHSaZ6XigPp
   sFCFV7fhyada1LyOW6o1xN0W97+bBWr2Ee+OWjtQr23lhAABPLNpgzLCq
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: vnDHYbU7NcUBsMXUR7JH5xtSe/uFaDm8AcKQkLkAj4xsCLTse4LIbK2AP0HY2YclFG8zJ/USwu
 UBnuR4p2MhTi+8pX+M1JyMlSi2+YWLS5pv545GRSojQ8w8Vzs7QTz6Uqf2x7MlXwhNB9YtedJA
 KsSMMxlLb38sKr+gSs5woKuaxeFNRE5azR9du0qWziEmZsvHwCZw8aF/XkYWzHdrnjFmsZc3+O
 ONqEj+MNNOx7DKT1ps7H6+sfk2Mq4lPliq1JGKXz2PWzUKYsO0ZwmrniH6c0x3X7lWFrkm+rCG
 2wk=
X-SBRS: 5.1
X-MesageID: 42890654
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:sM4/e62pmHhOoTaU6jJVSAqjBR93eYIsi2QD101hICF9Wvez0+
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/FIyKErF/OHUBP9sGWlaLtj44zr3iH6F0TFmtJ1/Z
 xLN5JzANiYNzVHpO7n/Qi1FMshytGb8KauwdzT1WtpUBsCUcBdxi1SYzzrdnFebg9AGJY/Cd
 647s1IuzKvdR0sH7uGL1MCWPXOoMCOqYnvZgQICwVixA6Fiz6p77CSKWnl4j41VTRTzbA+tV
 XUigCR3NTfj9iX6D/5k1XS4ZNfhcf7xrJ4avCkp8AJJlzX+36VTat7XbnqhkFSnMiO7xIQnM
 DIs1McOa1ImgnsV0WUhTeo5AX6yjYp7BbZuCylqF/uu9bwSj5/K+cpv/MhTjLj50AtvM5x3c
 twtgrz3fonbmK0oA3H69fFTB1snEavyEBS9tI7tHBDTZAYLIZYsI13xjIkLL47ACn45Io7ed
 Mebv302fA+SyL+U1nkpGV1hPSjUnMvdy32OXQqi4i+1jhbm21B1E0IxMATtWdozuNNd7B0o8
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
X-IronPort-AV: E=Sophos;i="5.82,254,1613451600"; 
   d="scan'208";a="42890654"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O9bMtcuGdsJfnV2JWUmIXG6TSxjQVw3c8fZ/susWrpMkuWuLIKwxjqvDz1pr9iq0Ku3DqoMfKNC7YGfgghbq32ykl9CIIPTZwoSWzVsiY4qcIr1LvymkC/I4L6XTXNQJ3YHFLsgLHPgJE1SWAxmydU9IJ3cSrlLUwdVxALoKhXdNRwcMRayd5PRExPrPVS6f+KAt6M8Zwx4Uw7Q0eNas1iiSjYLzgDSDFhWejjAM7iC4+KH0wuGCRzsNvXDwCBWUUwN4pAxdgZxSv9+5T2actuGyCtDLfqWd1Ug7D4kh2AO25VoQ+ATCt6JuvPkDhMVeD2HR6IdgCGFmrdCEFG86bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HxO45XiQmkjoqoXBwjfek8oYkGhQ66n/lVcY1VECMoQ=;
 b=dQXhD2WaPA/ripu98+mD/gfaogUK/fndFy+GOGSsGYIIMf5imC6oaQempKs6SN3fJ7x2w4MrC6hqCNCVpcUPtcrP2oxrtPqJ3dA5Apigy1YALQltAUQf8/X9xtOQWMD3DrB5cesxLCzf3a083VQZ1mwNgIhVdFtO5DVL27oQR7XGZsbGXJrcm7G7/UpNcFFZE1O/bNIJvoSsV9uzeUpb7KKny8ZFBGjmzzqpy54jXe102vtl3kng9i0egYyFVT31qN93c35LDQm4E5ZLmf6gB3P5wPhcdGZRnAPYVPS4j/zylmbUjLneNa+gBR3XvJovqPz6ZdXNk5+Rq8vwD7CiHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HxO45XiQmkjoqoXBwjfek8oYkGhQ66n/lVcY1VECMoQ=;
 b=B34H1y5Y2AV6y4XXnimRDBnVzIjoPkc0wjBOapCFG7B5poa4WT6H1nCErgBaXwOfi0c6VeneP0ETsyyOf5oKv4gj0XMhakxUtoLQV/8RNF7QbgQeL7rY1QHPQdAmxA57u/kw4aCbyKNvP05BTnnBhANID8d9ubPXUuW5AzPhBHI=
Subject: Re: [PATCH 6/7] video/vesa: drop "vesa-mtrr" command line option
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <6d6da76c-ccc8-afa2-bd06-5ae132c354f2@suse.com>
 <afa6121c-42bc-4078-0013-24fa7397fb12@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <7a08eb5b-3281-fb2f-57c8-0fa0fe76c7ff@citrix.com>
Date: Tue, 27 Apr 2021 14:20:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <afa6121c-42bc-4078-0013-24fa7397fb12@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0293.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ce12dc0-8788-4b40-26c7-08d9097f4d28
X-MS-TrafficTypeDiagnostic: BYAPR03MB4359:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4359ACB03E50F9315664CBB6BA419@BYAPR03MB4359.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SwwI5keq+I9x2Aa1aObZMidcbnmCSTs2w/9a8FFxKU9QSIueKOE+B3dUYof2IK/z2G7mvuI3ty7EI7qa1xU4ZOVXZ565pffYdQ7Ak/+b3zKbp1cFmvaQTxhjE3FVwrNGaguO+w5tki5t7MXOPCOXx/w+kShO0Ua/E1NorG4Y9V8m1dLufYmt9jTNKCCciKvd2BGmNThrbD3hvzcn18V0lSScpXMlfma4xz3G6hYG14ILIYIuM/OOv/kk9yhZXSoeqFkwZZoXx8NwHtR7F2/oqb5TzKGITI0qozwBqla9HMb9HkFcQDK4uuO3a18/y2e8HFXEV/OuVHJoFY9t+Xw8UpPG9jyL2L1yQBCeYcFgZ0DMulpLP6OZURxCvKiorsRZaUr4Yn8iMNOTTj8luO4cARyYJZH/l6nhxRLvmMqquxurFYH+xrSVZ+YWypZVGlb7lU4dZOAXzm6YYMaQY/c95P520u+UjWv5xxIYbzcgK58slE5FbiDnkRv39g/TEXn/R0+TwAAOGycH7RocbqpQKKPtqFpGL4cWOFKLCns9UJdpUZtGx3y4c1GTP3K1yUF6EMEhoHdgqP2Q2LuSv32WrzwF/N+6Jt7qEEKHLRGnJ5rSXX8wKZZQ5kRYTnJGu1YAHgewBjlHyMoB8GpwvOaEp8ABk+Ns7jYFvG+2ABQkkAYwBzqlpjDO6iNC6zGUPJ0C
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(39860400002)(136003)(396003)(4326008)(6666004)(478600001)(36756003)(107886003)(86362001)(110136005)(53546011)(8936002)(5660300002)(316002)(54906003)(38100700002)(956004)(4744005)(8676002)(186003)(66476007)(16576012)(2906002)(26005)(66946007)(66556008)(31686004)(2616005)(6486002)(31696002)(16526019)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?THAvcWJPWFJVY3cxSXQ5S3dIaWMxQzRLbEtNeElRNmFtRE5hbi9DQVBTbngx?=
 =?utf-8?B?LzM1czJYaHFJNUNFdnpia3RWOHlTTWlRcDgycThRVEt3UDNJK0trZ3NCbHZt?=
 =?utf-8?B?WExwVWMydGVpTFhwZDRPaDRmRCtpSWNwb1hXQVIzV25pZndvTzdaYkJHcE05?=
 =?utf-8?B?YllJalhPWWphNW50MjVIbjUxT2JRLzl2R1FGWlRVdXZ1eWF3c28wQzh2OVFJ?=
 =?utf-8?B?NUlzdXlsSmlULzNFc2JlRGZQLzFWV2t3TFZQVGZQRjZhZWREOFpYblFaWSt6?=
 =?utf-8?B?d0tySUdzUmVFTWxKWk1MdmVDdDI2eUJMMGhxQTRQeDB3ZE11ZXNURENtTWxG?=
 =?utf-8?B?Q0YrZEIvaXdmVkF1MXRsTW9wWSt4aFhKNm5YcVRlcUZKRExIRHROMHIwcGpR?=
 =?utf-8?B?RENDZXFtazN2Q2VWekFIdUJkV2JpUWQyTXM5YUJGN2tSM0w3NGhORk5LUFJx?=
 =?utf-8?B?THQrYzVleE95WlhNbDhQY2lGZ1RBK3Q0T3lvajkyWUpGNXhsNjRGY0JoRGZN?=
 =?utf-8?B?VjhBSFI4cWR6RzRRV3Jnamt6aW0wN0FielhZa2RNWDhlQ053TXpzMm16QnRn?=
 =?utf-8?B?L0JmT0dyVjZ4MDdLWS9wc0ZXdkNLTSszQ1JsWjQ0WmEzNlVwTC9YOG5tZkw1?=
 =?utf-8?B?ZVJsTjNoUmJTWVpqbFlYM0E1dDZ0ZFhNTWp2UlFVNDB6cXZnVVRVbmV4a1FL?=
 =?utf-8?B?ZmNXdGZwVkxibEYzcTZZcG9rbkhVWGppZ2hLamFMWW9yay91dDFHN1k4N0dM?=
 =?utf-8?B?MElncUxIOEZWMGYrKy91RE5RYktZOFY5ZkVMNk9vVFhIbUxqNUFCLzdRcDFh?=
 =?utf-8?B?SERUdWc0ZGdmSVlNQzMxMDYwQ3FxQmVZcnN6RnQ3bVdPUXJyYWdRRVhpUkRa?=
 =?utf-8?B?WUYyNFZVcGJjRiszaG5NS2xOSlovQjdJcmV0Qm9TQmZvc2dRNThnL2I0SXZE?=
 =?utf-8?B?eEFUejZuQ2lISzgxU3BzOXRSYzF4OFlRSUk1ZzF0UE9DbzdSbEdXM0VCSW5o?=
 =?utf-8?B?K2tzRjJPQTlsc1U0Y1J3aWliUE91bW5FU2M2a3FZL0wwKzRySDBFQXVLd0h2?=
 =?utf-8?B?WW1MRE5kNFk3MTk0Y01TRGJNWFJObUVRRFlBem9JYzlVb3d1enBZRUwrRGJi?=
 =?utf-8?B?c3dGQjB6L3RENWNtREZ5czJLRVUyYmtBdU5ZRU9aMVBYQUF4TEs2R25HdSta?=
 =?utf-8?B?M0x4a3R6a3VJVGM2RXFhVXNYRHMrdDNWcGw5ckhLZXR6bVV4bE5RaHM2bkJ0?=
 =?utf-8?B?Ym5tZG95T1BIOGdKS2dpTWlFYkVHWXhVMlQ2eGpHalhTdnJEMGRtODlBWTBB?=
 =?utf-8?B?SDdiM043TU4rcU5YWitEcXVRRU1pRGRTZXFZTFUvWFdHZmJILzFsRGhQL0Uw?=
 =?utf-8?B?UVVFRnNoV29BUDNWaHhTdUJvcVpad1pkT2pRcDU2YnJIQTZOWEx3SGdPaTEx?=
 =?utf-8?B?dkw4TkhPdlpyV0NLNjJuUmplZ1lwWmIvcWoycmN1ZGQ3YUwrVm1VQ21mMEJt?=
 =?utf-8?B?blRtSE9UY1dMK2M0bHdGREhqejA5bmp6ZzBaSGpUcEg0dVBxWnRIY01DUmds?=
 =?utf-8?B?NU1XVEh3Q1RuUFlLTFI5U25GMUhueEM0aFV5ay9YQ21zQmlDTEFvc3NtZ3Fa?=
 =?utf-8?B?Tkh6bHdydzB1NGV1UjRiWmh1YkhlRDdWWURCa3VoMFNwQllwWCs2aEhUaTh6?=
 =?utf-8?B?ZGtkSk5kdElTOUF4YTdvU0s3c2RjZ2NTSmlyTSs1VDZ0OGVUdkZFZmNFUmJn?=
 =?utf-8?Q?xZh5aq1tSS+u9e3kXbOXDWwXRqQsY1srzc1M7QA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ce12dc0-8788-4b40-26c7-08d9097f4d28
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 13:21:01.1158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gX6s4OX1J29H7e/yWyDyyToU7p8nCcWCyYz71/xVj6oBZkmlQ72CXY7QTrNLoZKpBN0AqRj2cO24ua6w77Sxhoo76b4U5mUHsTUU74R9Oww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4359
X-OriginatorOrg: citrix.com

On 27/04/2021 13:56, Jan Beulich wrote:
> Now that we use ioremap_wc() for mapping the frame buffer, there's no
> need for this option anymore. As noted in the change introducing the
> use of ioremap_wc(), mtrr_add() didn't work in certain cases anyway.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

