Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE164149EB
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 14:59:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192720.343310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT1pu-0004Li-Mi; Wed, 22 Sep 2021 12:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192720.343310; Wed, 22 Sep 2021 12:58:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT1pu-0004JT-HT; Wed, 22 Sep 2021 12:58:54 +0000
Received: by outflank-mailman (input) for mailman id 192720;
 Wed, 22 Sep 2021 12:58:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/3we=OM=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mT1ps-0004JM-Fo
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 12:58:52 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6360fc21-d64a-44e8-8fdd-fc1b547767dd;
 Wed, 22 Sep 2021 12:58:51 +0000 (UTC)
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
X-Inumbo-ID: 6360fc21-d64a-44e8-8fdd-fc1b547767dd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632315530;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=z/hNHmKF4p1bxeIGR29Ayx2C2Jjzremz6y3JzrNU0d4=;
  b=JtmieeoqkuQfBV+mb49RCUxUCf3ij4XhoQ2nZ4ldEqC3qands9bl94oX
   q48E0yxiCmxkwkRbruoB+tbGb5qqpeWv9472K8/5qF0GpTuBe4lvZ27m7
   KOCa25yaIXG8ad+1Re3fcAaYj8RFS9pJuptKgR9JXBBLU0CB693BMRLiy
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: OOP/gFVglvDWMjKEvtNjA0LTISCombTNPUTBNwh9sXsGF0iWOyU/lyeqhgz7sUpJxHLHvK9b+/
 fep9+rYRXesj6k14319Lo1Dw6XRs2OR1snIFrVwH/IsHlBQ8T2qCcnxzESG/2WclLB01A1RKbH
 p1NMEmseS0h+2Yp7XqA0gS4VEPU7nSxLL3xKtYhG1ZdqH/A6G7/w+YGJbZNURF2l4FxBnlXnVE
 oFdAIPtuY40Pb7ijJopqWgO4Q+2ZiOEtGqOo0QwSskteIsUpRbBACJQ8sZQuSVzQzCN51id9cf
 qGXG5nLWBb4Ly5HS0JNyykax
X-SBRS: 5.1
X-MesageID: 53732485
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Oykn0K6GERvRQOwLFnWdigxRtKfAchMFZxGqfqrLsTDasY5as4F+v
 msaWj2FMvzfYjbwc9Agb97l9B9Uu5eEyYUwGwpu+Xo1Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVIMpBsJ00o5wrZo2NQw2rBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z8
 9pHjYKwYggQMrDLvd0QbgN8On5AIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gTRqmFP
 ZZJNFKDajzrSQVQMwc8EKsup/ayr1fkaRdklQ6s8P9fD2/7k1UqjemF3MDuUseRWcxfk0Kcp
 2TH12f0GBcXMJqY0zXt2m2orv/Cm2X8Qo16PL+y++NugVaT7ncOExBQXly+ydG4lUyWS99ZM
 1YT+Cclse417kPDZtzwWRKovVaPvwVaRsJdFet85Q2QooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YXCA8raZqxuiNC5TKnUNDQcIQwIK7NjkpIAblQ/UQ5BoF6vdszHuMWium
 XbQ9nF43uhNy55Qv0mmwbzZqwmjrKDXTiU63wnKWUec4z5jQKf6WZP9vDA38s18wJalokip5
 SZfwZHOsrxWVPlhhwTWH75cR+jBC+KtdWSG2A8xRcFJGyGFpib7Fb289g2SM6uA3iwsQjbvf
 EabkgdY/pY70JCCPPIvPt7Z5yjHy8Hd+TXZuhL8NYEmjntZLlbvEMRSiam4hTuFraTUuftjU
 ap3iO71ZZrgNUiC8NZRb7xHuYLHOwhknT+DLXwF503/jNJym0J5uZ9aaQDTP4jVHYuvoRnP8
 sY3Cid540wEC4XDjt3s2ddLdzgidCFjbbiv8pA/XrPTc2JORTB6Y9eMkOxJRmCQt/kM/gs+1
 irmAREwJZuWrSCvFDhmnVg5OeuzAs4g/SxkVcHuVH7xs0UejU+UxP53X7M8fKU99fwlyvhxT
 vIffN6HDOgJQTPCkwnxp7GnxGC7XBj01w+IIQS/Zz0zI8xpSwDTo4e2dQrz7igeSCGwsJJm8
 bGn0wraR7sFRhhjU5mKOK7+kQvpsChPgv92UmvJPsJXJBfm/r91JnGjlfQwOcwNd0nOn2PIy
 waMDB4EjuDRuItposLRjKWJot7xQetzF0ZXBUfB6rOyOXWI92av29YYAu2JYSrcRCX//6D7P
 bdZyPT1MfsmmldWstUjT+Y3nPxmv9a2/u1U1AVpGnnPfm+HMLI4LynUx9RLu41M2qRd5Vm8V
 HWQ94QIIr6OIs7kTgIcfVJ3cuSZ2PgIsTDO9vBpcl7i7Sp68bfbA0VfOx6A1H5UILdvad53x
 O4gvIgd6hCliwpsOdGD13gG+2OJJ30GcqMmqpBFX9O71lt1kglPMc7GFyv7wJCTcNEdYEAlL
 widiLfGm7kBlFHJdGA+FCSV0OdQ7XjUVMumELPWy4y1p+f4
IronPort-HdrOrdr: A9a23:k4X5M62sC3UtjNmzH7DT8gqjBIwkLtp133Aq2lEZdPUzSL3+qy
 nOpoV+6faaskdyZJhNo7C90cq7IE80l6QFh7X5VI3KNGOK1FdARLsSlLcKqAeQfhEWmNQttp
 uIWpIOcOEZUjNB5voSmjPXLz+L+qj9zEnSv4jj80s=
X-IronPort-AV: E=Sophos;i="5.85,314,1624334400"; 
   d="scan'208";a="53732485"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dRkjtH3WKoDiarzFD7fkkvbHRthIRib0/s10ECaT9kNJwC9C9/J2zCcZH0jy3AWUf+F+JZoBU2u7rBvnWwBXkndAdECximjic5aGrqmTY2H4fmuWUJIBqG2zy8oCGLnOxMyb2vzKaQmHLq0jDR3p38tOWbVEz1oNi+uoADegbIuxfzFpSoHHjIRx5gRkEUc7gQ5XAiyXUIJTiGMKqn9oGdOZ+FGKL5EepmYUXeq4Xu1vPUZqzVGxpJ/3d/2AW7YA+0NsQn8oAhFJqAxZfzGiQ9BKtTez9hNTjMqKNry1YE+iQDjaQcjnDy6fUG1efmXV0rfXmNqT482QMavsEplXiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=1KX05VlyxTNYGz7J4fRuoOrsB8QhhDZUG8KbfqC+gXw=;
 b=BSFyt4WcnKyJl8ANwYrJeoMHbP+qTJWhuTVvEHIu5t2Pj6T8fQsV6RnyYl1CotPpxym0cijhypnjLBIdJk7z/zTGxN6izQuq5TUukg9GHA+gARayck2rKbVwq7UKwyUrkEJ0yRw339/bahJtlh5GWY9JFSQWQZGp6NcyQpuVXpwzixcTO4+f1rS+Wy1kODtOn9z/5nTaSQ6qXhnnSdQ8GklgqYYFH3XSvX9iBgFfZ75worwMQb+48Wbln1dyJPlBfdU3iOCtsa45/eWCZea4uLhxkgO6jWW+U7X8NRi+Q9jpdXaMpRVEQlvKeW58x1ppq4ExQ+vk7E7m5rqWoLpoGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1KX05VlyxTNYGz7J4fRuoOrsB8QhhDZUG8KbfqC+gXw=;
 b=hXRTmkPVO9EGWDSOkk5DnwIFdkiQZckNhU7Hcyck1jRIdrpjS1Y5QOr+ZXr75Pqm+xxgMraSKo5d80vlJ9IfMa4cBRNtXne3IWFcIAoBod1KKDVomLfcIljW0mn2Munnffb00/v+HUmakNulLGrQxEjN5WgOYxylrm9EVKw2TJM=
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Dario Faggioli
	<dfaggioli@suse.com>, Meng Xu <mengxu@cis.upenn.edu>, Xen-devel
	<xen-devel@lists.xenproject.org>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
 <20210920172529.24932-2-andrew.cooper3@citrix.com>
 <731e3474-77bc-b11b-41ca-5dff57831264@suse.com>
 <171e6f01-63cc-e453-7268-1bf2ec6fe7cf@citrix.com>
 <69770706-85f6-6509-b5c4-bda61dfdf994@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 01/12] xen/trace: Don't over-read trace objects
Message-ID: <84b780c0-7177-d1ba-fabd-9a6258985f9d@citrix.com>
Date: Wed, 22 Sep 2021 13:58:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <69770706-85f6-6509-b5c4-bda61dfdf994@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0399.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d05cf1ea-b40b-4382-0ae6-08d97dc8b2bc
X-MS-TrafficTypeDiagnostic: BY5PR03MB4998:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB499880C5FE3B445DD42EB5EBBAA29@BY5PR03MB4998.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TCVx2uTIgEpaVPF8PZR+Wvy7TibW3N8PCdjIOHhAKdJ2Yws45wwTQXa14XkiVtNg7fWU6cVLTemz0VF6jlOt5nHO24JjBjNFLm2UWlkT/XWCIguXghgv+P4SF/YQmq94bL++L3U1F5f36M+BHw9HjvZtLuFep+QS9953dQjC6oS2wSqPpG0kG6DbIvms6cYXGsQoEJOYtY3JAajZKW1EJsWsf1wWlPBSuaecuu0xLsghpJptDOuMB0MJYP/oZ4YO5NBohU8BPI6f84THskIpg9C275k6OAMbNHimITI4LTdXk405aYwevVzCM4yY0+7q349JJtffgS1u0PJklYFlIyP/ysSbLFom2VyV/blLu/Ih4R6hP3D6o5B6Y+shbpI6/dLdRzxrYRIwi8Q4iGENHJDPVg3j7mPcBNXAWWljrQ6J3BPCTJ/tguCsu/hccuvCtKfZZsuGcaXUkWet9Dca+vlo8K0k0Qn9H/Qpv6r14O8xZ34iERvvjDwLn2P0dhzq95F6hD7pLBzG+iX7+FaEaJb554qi5G3JIKfMbaAK4htvXYC8lTmEJXgRrebWqDGM7286mOAYW4Rxbk8uJyRkt4kBczfqyORlqixOHs4ym8Vl14efybKrWt9FMJZKpk0XoskjHVoYW+8j+gelvEt1RpRgk6u3pbGNuu4JhwBVxUu15AHZZbViCPN8DYHy3rxjZ5lXpuWTk1Fjq0UiLw/5Bq+gWDw0De1qBjc93Jfat0c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(508600001)(2906002)(86362001)(316002)(36756003)(16576012)(31696002)(5660300002)(6666004)(6916009)(53546011)(38100700002)(31686004)(8936002)(4326008)(26005)(8676002)(956004)(66476007)(66946007)(66556008)(186003)(2616005)(6486002)(55236004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkdzZFlzV3QyQjZTbndLUEFyNXl0ZTUxTjE4cW1NRFI3UkZ2LzdRRU9lS05v?=
 =?utf-8?B?ZXF3cDdqa0xqUXhqYVRCY1RmdXl5dDVvRjE2QjZucjRoTGhGSkpaZzZsODAv?=
 =?utf-8?B?aTF6V1JNVjBzd0VLZWQxZHd4QUFxM2ZOTmphRWlYcWJxczRxdUt2Q3pwY2N3?=
 =?utf-8?B?d2dpdWp3cjdRQUhmUVhOZ29FNWxEODUzZFROM2lHWU1GaFh3ckNQQUFDWCtU?=
 =?utf-8?B?aFlaWmlSMzk1ZUIvb1AxSkhZRmNLWE5OWmFPVHdla0NUOXdjbEQzT2E0cGVL?=
 =?utf-8?B?b3l1SnUvVzJ3VDVnYjE2RFZ6SnZzMzBiRWIxYVZsOVpSem56Y0hKUlNNeVB0?=
 =?utf-8?B?YW1lMno5RDBuYkJYNThaQ2xpeHBLTHlWdFpFcWlnR0ljbExoS2d0Wm9kaGl1?=
 =?utf-8?B?OVU2KzliSU1HMUg4Tzlod1BWaDhhYnkyYkNKTUQ5WitKVzZ1YUh5MmxMYlBP?=
 =?utf-8?B?bVBiblZPK2RYYmNNUXlzdnIwckdyMi9RbmZIYTBsd0pIcjBObSt3OGhyd1RV?=
 =?utf-8?B?QWp4R3M0OGU2SzhEbUhJR2gzSEJiUERVcnUvU0ZzMWNSOUtkY0k5bFBldm1x?=
 =?utf-8?B?SmkvVVRMRzd5RW1LVjdUdU9zaTc2Q0pVOHVQQmo4YXRjSjNHRkdjdUZLZVZJ?=
 =?utf-8?B?U1YrSE1uOTVRVUdlemh5SlRpVlFsTWRDWSsreDRvbmhDY1BwKzQyb1EwMXZY?=
 =?utf-8?B?T0RSVVFNL25hRStwaHI1dWViZXpNMDlvellkQlpnRFVjc0FVYzdLQnRwamRN?=
 =?utf-8?B?c25qSVJXSXlTenJON2FTL2YrYTUvM2RSUWdOVkF6QWE5S0tLdENUZEdZeGhS?=
 =?utf-8?B?K1pEUmp2UWdNVXhLcm9HT3J0b1RrVXV6WXdMMncyeURqckdkanJUZWdOQ3d0?=
 =?utf-8?B?TGt5ME1VWEtSYjUyT1lmWmFaaTZaVXh5QXI4RzJ3S3dYcUs1dVlzWkE1RENy?=
 =?utf-8?B?aHljb1pBNnJQM1p0SlhIMEZlN0R3VVN3SXR2M2pTWDNialpoQkJmU2I0dDBQ?=
 =?utf-8?B?OTBMMHBBQVJrTXFnUmN1Z05pZHluaE03WkpueldQQUdwQW55OVhVeEJrTnVo?=
 =?utf-8?B?VWtnK0ZDZ1ZaUDhzak9SZm11NWtQZFFKRnVXUmZOZE5kc0ZaVDBEN09POFZX?=
 =?utf-8?B?cjR4VE5wTkxoSmlQdU5lUlE5TDRhOFFDL0VERGVxcUQrTmF2eHlNblBMTFMv?=
 =?utf-8?B?TUw0U29Rc0xxelJHNWpJT2xSMEx1cDl5a2dMa3E1NzBpcElsQWRrYWRKSDFV?=
 =?utf-8?B?RFpWd1Zkd2haelZMMWFadklnODBSaDlOSDMxemV4aTNTeDB4Z0QzSUVQK0tm?=
 =?utf-8?B?SzNleDlMU0hrL3BOU1dnYmlFeU9VZXFDaDJoRnJ5UzN0Mm1FYTA4WHptQTNl?=
 =?utf-8?B?RVJUeVFFdXVhbDc4NTIxcXlFcTFlSk1iQWwrc2h2NlVzUUd1QUpVTHBIaTZu?=
 =?utf-8?B?bndkZ2VzY3FRK2RhMVRDdEx4YXlpMUtOYkZuN1kzTVBET2o1RHRydlVjeTJL?=
 =?utf-8?B?MFZTUWJEOWtTQUtxRmhUWmp6MDNIZWM3SXNPUk5EMFc4VlcxVk9Mc1FWNk1o?=
 =?utf-8?B?L2FIWUtvYitWRHFzbHBlOWN2bFN4Z3NpV0ExOVZKZjFYeDR5SFhWNDBOeS9M?=
 =?utf-8?B?UVF0VzVob3hvNWZheFdubFpNZ1pxYVd6OGlBWTM5Skl6TTFvdEF1eHdhUjJ2?=
 =?utf-8?B?QWp1QlN3N3lTN2RNanp2VGMzQWdBMm1nQXZzNDNsRzhSa1FnSG5xcXF2d0J4?=
 =?utf-8?Q?sm1u+8kH3QHZeWzpjxdUholDAHB+bTR9+VNIJPQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d05cf1ea-b40b-4382-0ae6-08d97dc8b2bc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 12:58:39.6614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /KORh8WC0r/TdBTS5TT82PeJ1zfBBdEguX8m/BaD+CQ4jXUAIlgYGP6Oiodj5YHfQ+0J41QUd2kdH6WNvXyxvdhJ3wSGxEMCuw3tg9pFWtc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4998
X-OriginatorOrg: citrix.com

On 22/09/2021 08:01, Jan Beulich wrote:
> On 21.09.2021 19:51, Andrew Cooper wrote:
>> On 21/09/2021 07:53, Jan Beulich wrote:
>>> On 20.09.2021 19:25, Andrew Cooper wrote:
>>>> --- a/xen/arch/x86/hvm/hvm.c
>>>> +++ b/xen/arch/x86/hvm/hvm.c
>>>> @@ -5063,8 +5063,9 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDL=
E_PARAM(void) arg)
>>>>          if ( copy_from_guest(&tr, arg, 1 ) )
>>>>              return -EFAULT;
>>>> =20
>>>> -        if ( tr.extra_bytes > sizeof(tr.extra)
>>>> -             || (tr.event & ~((1u<<TRC_SUBCLS_SHIFT)-1)) )
>>>> +        if ( tr.extra_bytes % sizeof(uint32_t) ||
>>>> +             tr.extra_bytes > sizeof(tr.extra) ||
>>>> +             tr.event >> TRC_SUBCLS_SHIFT )
>>>>              return -EINVAL;
>>> Despite this being a function that supposedly no-one is to really
>>> use, you're breaking the interface here when really there would be a
>>> way to be backwards compatible: Instead of failing, pad the data to
>>> a 32-bit boundary. As the interface struct is large enough, this
>>> would look to be as simple as a memset() plus aligning extra_bytes
>>> upwards. Otherwise the deliberate breaking of potential existing
>>> callers wants making explicit in the respective paragraph of the
>>> description.
>> It is discussed, along with a justification for why an ABI change is fin=
e.
> What you say is "This has no business being a hypercall in the first
> place", yet to me that's not a justification to break an interface.

No, but "cannot be used outside of custom debugging" means there are no
users in practice, and therefore it really doesn't matter.

> It is part of the ABI, so disallowing what was previously allowed
> may break people's (questionable, yes) code.
>
>> But I could do
>>
>> tr.extra_bytes =3D ROUNDUP(tr.extra_bytes, sizeof(uint32_t));
>>
>> if you'd really prefer.
> I would, indeed, and as said ideally alongside clearing the excess
> bytes in the buffer.

Why?=C2=A0 The entire structure is copied out of guest memory, with a fixed=
 size.

It's not Xen's fault/problem if the VM didn't initialise it correctly,
and an explicit ROUNDUP() here maintains the current behaviour.

>>>> --- a/xen/common/sched/rt.c
>>>> +++ b/xen/common/sched/rt.c
>>>> @@ -968,18 +968,20 @@ burn_budget(const struct scheduler *ops, struct =
rt_unit *svc, s_time_t now)
>>>>      /* TRACE */
>>>>      {
>>>>          struct __packed {
>>>> -            unsigned unit:16, dom:16;
>>>> +            uint16_t unit, dom;
>>>>              uint64_t cur_budget;
>>>> -            int delta;
>>>> -            unsigned priority_level;
>>>> -            bool has_extratime;
>>>> -        } d;
>>>> -        d.dom =3D svc->unit->domain->domain_id;
>>>> -        d.unit =3D svc->unit->unit_id;
>>>> -        d.cur_budget =3D (uint64_t) svc->cur_budget;
>>>> -        d.delta =3D delta;
>>>> -        d.priority_level =3D svc->priority_level;
>>>> -        d.has_extratime =3D svc->flags & RTDS_extratime;
>>>> +            uint32_t delta;
>>> The original field was plain int, and aiui for a valid reason. I
>>> don't see why you couldn't use int32_t here.
>> delta can't be negative, because there is a check earlier in the functio=
n.
> Oh, yes, didn't spot that.
>
>> What is a problem is the 63=3D>32 bit truncation, and uint32_t here is
>> half as bad as int32_t.
> Agreed. Whether the truncation is an issue in practice is questionable,
> as I wouldn't expect budget to be consumed in multiple-second individual
> steps. But I didn't check whether this scheduler might allow a vCPU to
> run for this long all in one go.

I expect it's marginal too.=C2=A0 Honestly, its not a bug I care to fix rig=
ht
about now.=C2=A0 I could leave a /* TODO: truncation? */ in place so whomev=
er
encounters weird behaviour from this trace record has a bit more help of
where to look?

~Andrew


