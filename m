Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F4E428A8D
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 12:08:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205685.361060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZsDV-0002Vd-Gf; Mon, 11 Oct 2021 10:07:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205685.361060; Mon, 11 Oct 2021 10:07:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZsDV-0002To-Dd; Mon, 11 Oct 2021 10:07:33 +0000
Received: by outflank-mailman (input) for mailman id 205685;
 Mon, 11 Oct 2021 10:07:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pkLr=O7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mZsDU-0002Ti-7t
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 10:07:32 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1fe4eb6e-a156-4bd1-aed9-c2dd43c37291;
 Mon, 11 Oct 2021 10:07:30 +0000 (UTC)
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
X-Inumbo-ID: 1fe4eb6e-a156-4bd1-aed9-c2dd43c37291
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633946850;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Uksw2cLmbfnOMpMH3BE4/qSLccmWZZpoQ5O7LJuX270=;
  b=a/1kVnBCmteqIFKw5FB99fM7dFMy4ZRxElFGJdKB6HN9C4SlYpx8/eIQ
   jkh02zvWIfg31gp4438PGBshnjFIW8XPz7lrRrdCfvWJcJcclr6jU8jNS
   7R/Kdu+IFOdVsL1MsUwuQfjO3K4dCNLkxdvv7MPtNpzHkRIE5WSbqXDUH
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ytzq53HyMLTHd9wGv515HdPcRtv02HE5vmJcwOs7k4TNYto/VkXzhzWI/sbWSpQ5h3Ph1w8slB
 5JbUomL7DhEhF2AINlc3cjbH0sNmDICeeYotf715+hd91MPTabKqfO3kmmCRmxKO84yOHYhpyY
 1VkLGYnWMwWvU3IRjsHHZuU1ezEsvoHu1enQlq5JD3LXU3GeDwSGM26hjzOE1TnYBtjc5ABN+f
 SfPIb35wWQ79/mtWDKhpRaBZyBnzSkEKLa7W8QDQGg2RIUWSDbq6X44Rb0XZ5A0ONSK0w+h9Z3
 rK0ypo1U6HO4+CrmQ8D2tqBP
X-SBRS: 5.1
X-MesageID: 54437084
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:UT1ybK8CPKarkUt4qE7kDrUDW3mTJUtcMsCJ2f8bNWPcYEJGY0x3z
 TMfXmuEaPiIa2bycop/OYmz8xsHuZTUyNFkGVA4qnw8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGGeIdA970Ug6wrZg29Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPgux
 u8SmKXpEzw1fYfSlNs3CxtfGg5HaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcFgGtr2ZgeQZ4yY
 eIoTgVmMBT5ZyYVPw0NDKojvc3v3nfWJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tlaVo
 CfK8nr0BjkeNceD0nyV/3S0nOjNkCjnHoUIG9WQ9PRnnVmSzWw7EwANWB2wpvzRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiCGKhEExYoMKKPF5wh+B9YCM4QGQKVFRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjtYXZNfAfucQdBFFFfu4Cy/+nfmzqWFo47eJNZmOEZDt0ZL
 9qilyM5m6kIxfAC06G27DgraBr9+8CXEGbZCujRN19JDz+Vhqb5N+RECnCBtJ6sybp1qHHb4
 RDofODEvYgz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvmoldBYxbZ9dJWGyC
 KM2he+3zMQJVJdNRfUmC79d9uxwlfSwfTgbfqG8giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmDOCLbimnk/P+efPOxaopUItbQLmghYRt/jf/m04M
 r93aqO39vmoeLSmOHeIqtRPcQliwLpSLcmelvG7v9Wre2JOMGogF+XQ0fUmfYlklL5SjeDG4
 je2XUow9bY1rSyvxdyiZi8xZbXxc4x4qH5nbyUgMUzxgyooYJq17bdZfJwyJOF1+OtmxP9yb
 v8EZ8TfXagfFmWZo2wQPcvnsYhvVBW3ngbSbSCrVycyIsx7TAvT9966Iga2rHsSDjC6vNcVq
 qG70l+JWoIKQglvVZ6EaP+mw16rk2IaneZ+AxnBLtVJIR2++4l2MS3hyPQwJphUexnEwzKb0
 SeQAAsZ+raR89NkroGRiPnd/YmzEuZ4Ek5LJEXh7O67ZXvA426u4Y5cS+LULzrTY3z5pfe5b
 uJPwvCibPBexARWs5BxGqpAxL4l44e9vKdTywlpESmZb1mvDb88cHCK0dMW6/9Iz75d/wC3R
 liO6p9RPrDQYJHpF1sYJQwEaOWf1K5LxmmOvKpteEiqtjVq+LenUFlJO0jegSNQG7J5LYc5z
 Lpzo8UR8QG+1kInP9vuYvq4LIhQwqjsi5kai6w=
IronPort-HdrOrdr: A9a23:QbmanK0TeG5cmSgpRd/BtgqjBSFyeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5OEtBpTiBUJPwJ0800aQFnLX5Wo3SIDUO2VHYVr2KiLGC/9SOIVyaygcw79
 YFT0E6MqyOMbEYt7eL3ODbKadZ/DDvysnB7o2yvhQdL3AYV0gj1XYDNu/yKDwGeOAsP+tBKH
 Pz3Lshm9L2Ek5nEPhTS0N1E9TrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJqJmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O87CsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNXkHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa1XackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmMW9yV0qp+1WH/ebcGkjaRny9Mw8/U42uonlrdUlCvgklLJd1pAZHyHo/I6M0r9
 gsfJ4YzY2n46ctHNVA7dw6ML6K41r2MFvx2VKpUCba/Z48SgbwQr7Mkf8IDbKRCdE1JKVbou
 W2bLofjx9rR37T
X-IronPort-AV: E=Sophos;i="5.85,364,1624334400"; 
   d="scan'208";a="54437084"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bbkdnhENPo+0McbGVa+u+XuzxShfU9+csd/+c4AKM9UT8i+eonbQFhv6c24uIdFMdjCggm9GPwZ3YTbJDGBhMwuKIEwj8biqIhzXO0quLSC4weTUlFRdkS78+/30bHToL8N8KkVs0Ltpzf8XtBExbadnpohmFDolLEsWL0N+hEjjAPgCi0D/mHG7abm/6dJv6Qy89hUkyUPH+c/AznAi/6L/LeVBSBuCLs7JHiI4b/+NDumRzYDMT07bPA9mMfHkf/taMZJHDTPB8TlNUk54k9x5lW48HNsQPZPGeRk9iGsPgSOOwXt16ZfZ2n5lczwJrMPpYv4ElG1L6FN1+DHqGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8D2APnASnPIx2KKHfB9HVWACRoM0oq7S+IKo1fir02c=;
 b=TF7OJk96LuukVejr+hLnpUcGly5gQV95cbuLF297lBwjqCh/4B3BWNu9Cvrj5O2WZOlZTQ66mlqqH0xMdIMZec3JeF7Kqzv96KT0WdN53RM6jVmifA61GpjLqvPTXO9SjadgIszjx4SDrK0IG7ZenYYHtXC8OJ78VJe6ps6mCR94WIneyc/L1E915zQkVpEH9cZ5kZ6KkTBk14/xDA6A1IaZ3QLzt2K2W1a2SK1zngOJbC1RQ4wX7uAQMDkbzp4EdOTAUWV3hH3hVMAoy0P3WckEwE0Npax26GvwNL5miXva/IDjQI72maf8neu5TekEi9bhoVg89z9tz1eRPJZwKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8D2APnASnPIx2KKHfB9HVWACRoM0oq7S+IKo1fir02c=;
 b=mklM/JqyU376ERYtTqvn4PljlIM4qnzkcWtOZ7l08CbOGBXXR2SJDeyDwuSPZK+S1BMoIyRxqlOOJ1viqnKn83qD/R30pmhIsPKREbdI+DzuJAyxI0XZAagKy+LPOz182eNxS7NABm1m1hxPWeehwIisZzQXniaCTMcWtdnV+zg=
Date: Mon, 11 Oct 2021 12:06:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] x86/PV32: fix physdev_op_compat handling
Message-ID: <YWQMqq2Z9BNro9IL@MacBook-Air-de-Roger.local>
References: <af2f934a-49d8-a15d-3b66-94abc0d39081@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af2f934a-49d8-a15d-3b66-94abc0d39081@suse.com>
X-ClientProxiedBy: LO2P123CA0057.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7689d92c-0771-4319-c27f-08d98c9ed128
X-MS-TrafficTypeDiagnostic: DM5PR03MB3068:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3068E878288E196AA90D7E688FB59@DM5PR03MB3068.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IGSu9zgYiZh2WXAGTV16jV/XR2IGUxpMxJXbw/3uYrsytOQa2baJaS597oaHZA7572SDsMKniKFLdBx2U23tbYQTNXKaP9zC6b4O8TRMDIiBT+qxzk1vNATT9+95h0Y9lAW+GQ6bNCA6ipedcae6Mp3qQK7hMECxBPvq/M38/O1i3f+mz7vug50rcMezyFuS3vYcogJhv6oHw+3j6Dia9VYUpjlSdVkECOYGJxdGgXvhtaFBZcSuT9pGL5GiRV1ZDJ5wLru4Scjt4EnMkFHa74LWM7t344IOfzXRSIUU/P7Pq7t1JxJL4wRMrfUvqnqL2s8q/DJTOpnl7iLIGk15DdJSA4630KhN3DZ3w55Ot+PrPDzhWEp2pF0tDmg8yRx879H0GnzfjfqBX+SKGbglz3VY1Mx66KazC/pXOH8BsT5w6PQM75ROHsmIz3/qKJ6WIZFR90YjdDJKdRZcM8I+Gz5yPrwVFJTUykoVW6KuptBDqHCqMYTaLbhc8UIisDtMDdIRA69K1i6qpHXwaMPKEoRzdHfSHOs1ETbqNyZ0mZQY4Oeseym0LXzi64jLVzcmsJ9LaVDhOm6q2Dbfg8odKatzB+jQnq4F0nnye/OHFJLt3Zj8WLKDi4r6XTU6Xduocd0rCLxTL+TIUrn13V82PA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(85182001)(4326008)(26005)(6496006)(38100700002)(8676002)(956004)(6666004)(9686003)(54906003)(66946007)(5660300002)(86362001)(186003)(508600001)(6916009)(66556008)(8936002)(316002)(6486002)(2906002)(66476007)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bndlV2tZbUJsMWlDTDljeTlXN01wQVRxM3VidEFaUFpFS1lWUThTSWNqdEMr?=
 =?utf-8?B?NkxzS2xpQmtLeGxORnkxWFVrbGFNd25WM01PNDZ0WlhPSnJkTmJ0QXB0dWVB?=
 =?utf-8?B?RE10b0tsOTQvRHk2Wm9JTnhKaTJXRldNZTFYSFJjMmF4UlB1OGNOYWRNa1Zh?=
 =?utf-8?B?K1liRUlCVCtsNGZDYVViZm0yVS9FZ3FWckhRUDFFeUthUmNDZHNUZGU0emlD?=
 =?utf-8?B?Z2o3YU1ENnFHOHdDN0ZCMWpLRE9IWWNkZ0tmM3BzWFdSUzJLd2I5YUNaNG5Z?=
 =?utf-8?B?SXpBODN1WFkwSGVZaVI0Zk83RzVEbkN0RU4vQ3JtZjBrMlIrVlRZVXczZXlJ?=
 =?utf-8?B?QWYrTzBNREM4Q0sxa3Brd25oaTN5TjJOL3FZako3N2tHdkFRdU43VjhGRHli?=
 =?utf-8?B?ZGtWUHpVR3RPY1M4YVBSVk12Y0ZQeFRBdHJVOUl5K1phdHVpVlAzQWVoK1p3?=
 =?utf-8?B?Wk9xcXpSRFdjdmtPMEs3OWRRY1NoYUlrUERVeUU3TlhqRWFqY21UNzRtczk2?=
 =?utf-8?B?TVJOTTNKbkYrTFZpN1Z1bUFvdGh6cUJIbzNYK2RTSGxocVhUUTUybGJ2WWF0?=
 =?utf-8?B?dERCYk1YbzU3bDJ3MGZ1RkR2cTR2NWVpVzk5NDlhS2liTXNPTVFWRXp2UGFN?=
 =?utf-8?B?bVZPc3JDZ1V1dXdOKzJpSnJlbzlPMUFnVC8vN1MrYXZFWXNPRkNQd1ZESGF5?=
 =?utf-8?B?ZzNzU1AwSWpOMzVGUlVFTkdMMDc3STJGRjFTV2lpNHRnQ0s1WXFqbDBsdExH?=
 =?utf-8?B?OEFWdk5PSUZsb1BPQk1OYjhLbUNVOVl3OTdXdjMzWFJJTUE5V1NHbm5UVjh3?=
 =?utf-8?B?OUNJQlpnek51VHRCZkZzU2lYSTY1RlVackVhempWRnpuNmJKSlZBNjFRekk3?=
 =?utf-8?B?cGNTUGsydU9WUFEzdkVKWTRlRlBkd0x6TS9iUVJqQkpEa2ZybGN5TmJTM3RJ?=
 =?utf-8?B?c3NZSUt3V3NLQkxGZDV2NitnOHNBd1FCbnA2WkxENlVXZ0s1Zk1vUmlacTNo?=
 =?utf-8?B?QTBMemlmTThjNWEwQ083c1EzZXpUQUNMWEtoVHdOcTFMODFxQUNNNlduT2R1?=
 =?utf-8?B?ZVlJQnVoMnVFR2lsa1dOdjVKRW1DSlJjWEYxamozdVZPNXBUMDVMUTBjeXRv?=
 =?utf-8?B?ZVIvRWRaZVRsOVBnMXN5OER1dzZnYlpNRXE4dERnM00rU2JCZVp3SW5mMzlC?=
 =?utf-8?B?bkNJUTJMQVZXTklXNjdPRVhOU2lBcmowaEcwZEFJS2lySVBhbVg1QUxvTGxy?=
 =?utf-8?B?QXdUMmpJdUFYOGRSZUJmY3Q2QmZMV3VnUHBic05lbHVDS0U3QThESUlOVWFB?=
 =?utf-8?B?ODFURDB1WG0wVVNNanBxMU9ueW1rbVB2bS95UXA5eTgyc2FqL2lzeTU4Yk9j?=
 =?utf-8?B?NFdIckgwRHNidHZ6TFRWWHNQUTVETVpUODJXakZLNDVHSUxXY0NMcElqRHkr?=
 =?utf-8?B?ZGZ3RXcvamdZbStnQWlYTFJyUkhwY3VmVEVteWZZU25DTS8rY0VSbllUNSt4?=
 =?utf-8?B?WGpVUVVNL0JHZkk4Y1lDODdhSzNpQzdhbitpVDJBNWsxZmpRZ2RPMy90NGEv?=
 =?utf-8?B?RTAxRkRCM2JiSDI1eDFIOGhNWTRxWUhLbEV3WFVoL2pEZXVVRkgxQTZaVzZY?=
 =?utf-8?B?ZGhNSVhrRFBTa0cxOExxTEw5M3VmV0IyZjA0Q3BmVkNXOW9hTS9PeWZwWDdj?=
 =?utf-8?B?Y2VSL3dNT0ozc3dUVGdNMFJzaHRxcEpoSFFxL2U5SXRNREVkbmlMcG1Sek9H?=
 =?utf-8?Q?ez3aZ1R67sbaS9U/JBXhR6DfgZgmGdWeg3BdD6K?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7689d92c-0771-4319-c27f-08d98c9ed128
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 10:06:39.2502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xMNwRf0u9326I63eJUS6sHuIFbIUJgWTOBhL4LI0A4yVM6/zKhADpNRykL8u+ZNFljGmApoRMyfE+/o8rPdbqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3068
X-OriginatorOrg: citrix.com

On Mon, Oct 11, 2021 at 10:20:41AM +0200, Jan Beulich wrote:
> The conversion of the original code failed to recognize that the 32-bit
> compat variant of this (sorry, two different meanings of "compat" here)
> needs to continue to invoke the compat handler, not the native one.
> Arrange for this by adding yet another #define.
> 
> Affected functions (having existed prior to the introduction of the new
> hypercall) are PHYSDEVOP_set_iobitmap and PHYSDEVOP_apic_{read,write}.
> For all others the operand struct layout doesn't differ.
> 
> Fixes: 1252e2823117 ("x86/pv: Export pv_hypercall_table[] rather than working around it in several ways")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

