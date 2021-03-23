Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE11345BA5
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 11:07:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100590.191808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdx1-0000p1-JU; Tue, 23 Mar 2021 10:07:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100590.191808; Tue, 23 Mar 2021 10:07:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdx1-0000nc-3x; Tue, 23 Mar 2021 10:07:51 +0000
Received: by outflank-mailman (input) for mailman id 100590;
 Tue, 23 Mar 2021 10:07:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJMG=IV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lOdqZ-0006c2-W1
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 10:01:12 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 361e98fd-7e1a-4343-8257-b18ed40b1f10;
 Tue, 23 Mar 2021 10:00:47 +0000 (UTC)
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
X-Inumbo-ID: 361e98fd-7e1a-4343-8257-b18ed40b1f10
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616493647;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=DR+QXS/ul67exuNBj6emUyOCRNTyaDn6XpX3sgTsimc=;
  b=EvJXfkXbGgPLyBOG30ah7Wdt1To9Fd+qquf5jvHOgXC0uucmptaHGy1N
   qIQrngbk8eHieEya9oF6WPiXim5rLkxjik6rIM/pejtRo32UlS4MSruwB
   J3eGiOVefIOzs57cGDs3nFXEBZoa+ExeW7rYhsmWKT5ab6kKxJJgfiG+0
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: +9D8T9GfCxt2Zw2O9jwG/CyqTUuuKHuMWNZ908N7eLj90uPzlfEe0RW0AWNmjxKKXhbN2wO7cc
 luk2MLgJ054Eo7MFKfPW55bftPxJNfDgc22zgkFF1f4bNWXy9Cy71tAWJws1XBWHTGF2tpBmRS
 jeLERQjWuvvghdcBw5BCt+NLJTrxrce6SKkkjRDj//jAp0JaNqLGNJSxFLL//EJVYwcMcBDsEa
 Asuj0Pr3291OjZPSPxDWjP/QrtaTwyRMXPrwmZFuXki3a1W9MjnCwzt+EXYZMK6t2m+K5KOkES
 NPA=
X-SBRS: 5.2
X-MesageID: 39779652
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Sh0DAqtK4HkPV5dJOzZPj0B97skCCYcji2hD6mlwRA09T+WxrO
 rrtOgH1BPylTYaUGwhn9fFA6WbXXbA7/dOjbU5FYyJGC3ronGhIo0n14vtxDX8Bzbzn9Qx6Y
 5JSII7MtH5CDFB5/rSyAOzH888hPyO9661jenTpk0dND1CQYsI1WZEIyycFVB7QxQDIJI/Go
 aV6MYvnUvZRV08aMOnCn4ZG9XSvtGjruOsXTcqJT4CrDOPgzSh9aLgH3GjtSs2fjtTzd4ZgA
 34uiPj4KHLiZ6G4z/ak1Te9pFH3Obmo+EzYvCkrugwBnHShh2zZIJnMofy9gwdhO208l4lnJ
 3tjn4bTqBOwkjcdG20vhfhsjOIuAoG0HPsxUSVhnHuu6XCNVUHIvBcjoFUeAax0Sodlex8y6
 5C0ia4sJdaHHr77UbAzuXITB1jmw6Ip2Mjm4co/h9ieLYZAYU+kaUvuGduVLsQFiPz744qVM
 N0CtvH2fpQeVSGK1jEo2hG2rWXLzkONybDZnJHlt2e0jBQknw85VAf3tYjknAJ8494Y4VY5t
 7DLr9jmNh1P4MrRJM4IN1Ebdq8C2TLTx6JGnmVO07bGKYOPG+IjJLr/rMv5qWPdIYTxJU/3L
 TNOWko+lIaSgbLM4mjzZdL+hfCTCGWRjL20PxT4JB/p/nyX7zuPSqfSE0/kseprvkFa/erGs
 qbCdZzObvOPGHuEYFG00nVQJ9JM0QTV8UTp5I6Vju104L2A7yvktaeXOfYJbLrHzphcHj4GG
 E/UD/6I9gF6kiqX3T/kQXAQn+FQD29wbtAVIzhu8QDwokEMYNB9iIPj06i282NITpe9qosfE
 V/J7vjmrihpXa/+HvJ62kBAGsSMm9lpJHbF19arw4DNE35NZwZvc+ERGxU1HybYgNkQ9jOCw
 5ZrVRv8aexJ5idrBpSSe6PAya/tT8+tXiKR5ATlum//s/jYIo/FYtjcrd2Dx/3Gxt8nhtKpG
 9PZBQffFLWEirjhMye/dkpLdCaU+M5oQ+wZeZItHrUtCyn1LoSb0peewTrbOm6rkIFQSFOil
 h47qkF6YDw4wqHGC8Ersp9HX9tTCCsALxADAOKDb8kw4zDSUVLY0nPoRPysWB0RkPas389qC
 jbARepXMyjOCsbhllolpzF3hdJUk24RWJcA0oK9bFVJCD6njJa66ukTIyV/AKqGwM/6+kALT
 DIZiYTKAtyx9axkAWYgiqGCG9O/ORTAsXYFrQ7RbTa0X+pMuSz5Nw7Nu4R85B/ON/0tOgXFe
 qZZg+ONTv9T/gkwgqPux8eSWBJgWhhlfPjwxv+6mekmHY5HPrJOVxjLotrVO20/izhR/yS1o
 9+gs9wteysMn/pYtrDza3MdTZMJlfSpmGxJttY36x8rOY3tLFpGYPcXiaN3HZb3A8mJMOxjV
 gAWs1AkcL8E54qe9ZXdzNS/1IvmtjKJEw3shbuCut7eV02lXfUM96A/rKgk8tmPmSR4A/rfV
 WP+SxU+PnIGzGO0rMXEKo8K2VbYkpU0gUXwMqSM4nLTAm6feBK+1S3dmKneLhGUa6fBPEeqA
 1579zgpZ7lSwPonATL+T11LaJF/zz5HYe8AAeQFfVJ9NL/M1KWmaeu6NOyijCySTbTUTVoua
 RVMUgLKsJEgX0+iYdy1C64QKn+uFgknFtT+isPrC+Z5qG2pGPAWVhbOgjYiIhMVTZdMnKUnd
 3ImNLoqkjV8XxAw93fD09ecdFFBsgIQoX2JyloL9IMvLTAxdtevg1TJBE0D2A9jzjh3+Rpmb
 ehsc+iJNHfNQ==
X-IronPort-AV: E=Sophos;i="5.81,271,1610427600"; 
   d="scan'208";a="39779652"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WKgRxfXU5qXLkh+zQxN10xz5TtDTH7tVQTa/Qrk6bNTZmvmSyNMUF9SGkr+66nFO25CKms52sgMG0RmBoS6LzMEV7QwIfZ2VvYPx1mMr8ofUVrncT4vWR32Y9PXTWjFRL6PJzAoJj+CTjuGF/VDaWLZLnlr4puiTuPkjhLR+nz6xGXDfT7F8zhSHNxVmGpqv9lKi0+H8wIjNA5IQ238YKEaJXEp6En34B4fXFpKUBSTpp09XxLwRMF9Jc463sRKq0Uoo3HMATjpeMlJz8ji0Isaa4MGKvSdusqfNvYT60HShE5bXvOixvGxSfO61Hf34CvLLhC9RqsANXnMmUmRsMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3WiOg86VPd8L28F4qhC0/C6RZk1orVvsRJ5t1bdvfc=;
 b=nqAC3p/WoP+h5dthD9zobly7JWmH7SJYYPGzR7tjpc6dR6/YVessvhhwB3h38zHJLftDn6pgYGQm1VLStJBfZ8dpwEdUdb61vtPxPnjjv5Ugeoh/xEIf5N8prRJtT4dJ91wLaOcmnaeSoUd7t0k4EuJ7wuG0sMHFhtX7GvHx5wSPLvM3B8I7AvAiFoJmfFoKa23xAbxJM1QY028Mwmr/ycRGMoBZOVMcuqTG0yCHnuppxHdH5mzsI/Xm/TNNQhGWF30M1MVgmbDqwT/H4QklgKutqYxNJCmYwqPt84sPYlBMkvu4RfKvEI6qlcet20nTexWqrqbIi+xTsAqIEwr0wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3WiOg86VPd8L28F4qhC0/C6RZk1orVvsRJ5t1bdvfc=;
 b=R/ftgb2rOGdXxIjNJZIgXA9FNI1FVF6I7mMHYnDrw2WnKfRXsg/NcYXwq4i3rNml3A0LY9FPjsLkS7FnrzniayxXFsXqOEnEJ+sSwgXUbILM8oYD9NXax13nn1sDX4wX3gcNhF08WIE+Zvd5T3hA+q5W3fr2qdriGsr6z00Iq6E=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH 12/21] libs/guest: allow updating a cpu policy MSR data
Date: Tue, 23 Mar 2021 10:58:40 +0100
Message-ID: <20210323095849.37858-13-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323095849.37858-1-roger.pau@citrix.com>
References: <20210323095849.37858-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR0P264CA0122.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62396a62-fd03-4077-3964-08d8ede286c0
X-MS-TrafficTypeDiagnostic: DM6PR03MB4969:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB496993AB7A9F398DBB12D85B8F649@DM6PR03MB4969.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gJ+0e3/yEvCf3OD/VV18k5lEBHDIb+D0htT6R24DSCgVTzRmfTmXtHRIhXl85JqGzlEkA/1sROUssgi4RXWDhaJ6cuR8bek8LnGGXrzPMEMg7UL5oYklXCl5WPBlXTMqXQ2mhVDGFuTb7e1s+32DCqNdvFBSEnr7/x05f8QDrTUyV8kEZ5Ic8V774c7b2ORfqk/zBt9hY5C2DScjKeGJw5wJewizxx1R+uxzS04CdZKaxyqumI2DsmSnE+kBTIVEYf8xU30yQO7+0bA47X2uqYml5059fABxlaslF1ZsaZOmnfj05r2bJB2BsUrtALngNKfZA178/2B39W4CxmOo4Mkh7lP8fxRu3YJokPG+vlqdpffORDifvOEwVZDuojwtNfHPN06zGsYaAPKY67yFWLkOtRlJgHZtDbRu2I7o7nsEQwkmtPR73Lcf12bdiwwgTIrZoqLklNK5/ub31fTmMqaTW3QvwPQFkEBERFlSYDTbBlYhH3ePZ+a2IIAOlxdFzm9HErl5FUgiE0/AyY1lboMI8697lEDupirJ5/e7/4LT3jVcg1zec3aj0as05CH5sEA769NzK4SaLFFaJmaI+s5mueLSy3FoihHtYJDZD/stXmcCOIhfo4mNcwT4KllBED/eXq+W2Mvoksj/H4K7TPFcjJ57TZ7WHAzu4HoCxaU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(54906003)(36756003)(2616005)(316002)(26005)(6486002)(956004)(16526019)(186003)(2906002)(86362001)(66556008)(6916009)(478600001)(5660300002)(8936002)(6496006)(38100700001)(83380400001)(6666004)(66476007)(8676002)(66946007)(1076003)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bldURTFaclpWaHUrVTF3ZmRpaGErT0hnNXNpbWVrb0JXMlZOT3ZzMDR3WCtP?=
 =?utf-8?B?RHBhbWRsdCtOa1ljSko1MGdnYlZwdldWSkI0eTlXZmhTVjM4SVdxZmxxeFFp?=
 =?utf-8?B?b0txbFJvQkplVUYyRmV6YnFYOWRlaHhoZitGTjNMbkovV2ZuOG8rYTNkKytJ?=
 =?utf-8?B?UkxCU3pXZ0JXZ3Z1Y3FGRlBpL2JSdzhaWkdsdHNvQXA4cjUyemZudTNRUmxK?=
 =?utf-8?B?d1k1YVFRaThodlJ5T1hjSlRzUkQxUmtDa1NDYkVuRkVnMUFPWXZNVllVak5E?=
 =?utf-8?B?aHlIRDMyTS9QeGxTVE1TbVZucXp3MW9abkp4VGxQaUpPVmxxWFA3Qk54R3lN?=
 =?utf-8?B?QWdjTjgwNzlkVjYwWXdEV05vS2VKR0M2QmFJTSt6cTU5VEdnRHhpcUExaVJx?=
 =?utf-8?B?ZjdtTytoWHZDWXV1Z3BmcE9hS3Z0Z0llRFdyV0hOdVBOcjkwS3gxT3l6OGFT?=
 =?utf-8?B?eGU2czh5SGNka0M0K3NIZ2NuZUUxZWE1Mmx3dExMaWJHR2ZhUm9TUG5MUkxq?=
 =?utf-8?B?Snk0QzVoZ2psbEJDM0ZkREVjMFBMWTRPU1hWamdrbTJtSEFMS0JkaUp1Y1VY?=
 =?utf-8?B?YThwZkxQbVVkdnJQRjZNT3pUb3RrZ1ZCVDl2Tjl1QVptQ0QrSjN2NGVSdURk?=
 =?utf-8?B?WTFoa2lpM3NvblU3eSsvSW5kRUdINzRFNytCWkdwZWd4VkhMTVRkS1h3R0tG?=
 =?utf-8?B?VnpJZ09lTm1GQWZLZ0ZkVGtPc0N1TVphTFZWTkpvbDZTNDhYQW5mWU13YmZ2?=
 =?utf-8?B?aDNBYUYwQktNbVo5QWtwNjFDYWt4U3RFQmxQN01EWm9Jc2lNYzcySmRxdmlR?=
 =?utf-8?B?dlJ1L2FrcEdSM2VjUmVaSVZEREFta2Z2aUN6WmY3VXZSc3dSODZJZFNZUmtM?=
 =?utf-8?B?eEt1U0o4eUk2aXRnSjB4ZVAvT240eEFraHhTTWlxZWRhckdhOHNyQ3VidTRJ?=
 =?utf-8?B?Q1hnSmJPbzJ6NlgyY3lOOXZpZTFBVS80YzNOVklteWg5dEJTV0xmd1BwOUNH?=
 =?utf-8?B?bmdvcTgwcFJkWTlMVHBJbEFlMHFGMVlhZGZaaEdTTVlBeGp5ZjhjNC9nZCtM?=
 =?utf-8?B?Q1hQNm55TmlMYk12aUZYeHdlTm8xcUJSWmpsWFdxQmpKbHM0ODc3UG8rMG9G?=
 =?utf-8?B?a2RleTEySU12OEQxemlMY1NyWm1TaUlOR1dsaXFQY2U0aE13N09BeWd5T3Ro?=
 =?utf-8?B?dmJtZ2tTVDF5SnU0Rm9rWHdKbzZwRzJDUEd2My81d0tjTm9mT1gzYnRrSWJN?=
 =?utf-8?B?c2V3WXdIRFVzRG5EWGpzK3RDN0g4eWZVRmVIdFE2eHBZcExFcm9td2dVUysy?=
 =?utf-8?B?bHR3cDR0eW9UNS95ajZ6RGFVOHBHc296WjNnbnI5NVIzMXNvUTN5VGtkSTd2?=
 =?utf-8?B?d0tTRGFKQUdkVk1EOG5MWXE3TGw3cVJ0dWhuZDdiZFFUM2RsdWN3dTJSNGVI?=
 =?utf-8?B?ODJBSVZ4N3plcWJpL0RYenkxc1hpTDk3b1poU0hhQUg4a25rNi9JbEtTYVd4?=
 =?utf-8?B?M1lsTWlSdm9iVmJ2OWNHWFJpWXNIWUloby92ejVqM0VOZjJndm44aVZ1YVlE?=
 =?utf-8?B?c0MrbzVXWlVGMU9hTFpJMG9oVE52MmRoNXpBZjVMTVdtT3hKV3lzMi9EK3hB?=
 =?utf-8?B?bGc0ZjBMY1lkNkUzbFFEamp1VUx1Z2JMdG1EdkN5azRTbkVqT1REYU1nNWFJ?=
 =?utf-8?B?MURaeWVTRkU4YjRidFdrTFpLakRzWDZ0Mnp5T0ovd3IyeUV3N3NFSDQrQ3dW?=
 =?utf-8?Q?+z9hYBEyNKcbO2utk/gwbtIc2BA8bGaDnPZK6xK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62396a62-fd03-4077-3964-08d8ede286c0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 10:00:45.3983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /vrQ9KfsTgcxLzCHRgoOq6tIsf1pxZDIXJTppdHgFKQI7JDZ3+BqwwaMbMC753NFfAoELZxuCYoBT+4/Lr63Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4969
X-OriginatorOrg: citrix.com

Introduce a helper to update the MSR policy using an array of
xen_msr_entry_t entries. Note the MSRs present in the input
xen_msr_entry_t array will replace any existing entries on the
policy.

No user of the interface introduced on this patch.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/xenctrl.h         |  2 +
 tools/libs/guest/xg_cpuid_x86.c | 65 +++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 2143478fe4b..46f5026081c 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2616,6 +2616,8 @@ int xc_cpu_policy_get_msr(xc_interface *xch, const xc_cpu_policy_t policy,
 int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t policy,
                                const xen_cpuid_leaf_t *leaves,
                                uint32_t nr);
+int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t policy,
+                              const xen_msr_entry_t *msrs, uint32_t nr);
 
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 13c2972ccd3..07756743e76 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -1033,3 +1033,68 @@ int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t policy,
     free(current);
     return rc;
 }
+
+int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t policy,
+                              const xen_msr_entry_t *msrs, uint32_t nr)
+{
+    unsigned int err_msr = -1;
+    unsigned int nr_leaves, nr_msrs, i, j;
+    xen_msr_entry_t *current;
+    int rc = xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs);
+
+    if ( rc )
+    {
+        PERROR("Failed to obtain policy info size");
+        return -1;
+    }
+
+    current = calloc(nr_msrs, sizeof(*current));
+    if ( !current )
+    {
+        PERROR("Failed to allocate resources");
+        errno = ENOMEM;
+        return -1;
+    }
+
+    rc = xc_cpu_policy_serialise(xch, policy, NULL, 0, current, &nr_msrs);
+    if ( rc )
+        goto out;
+
+    for ( i = 0; i < nr; i++ )
+    {
+        const xen_msr_entry_t *update = &msrs[i];
+
+        for ( j = 0; j < nr_msrs; j++ )
+            if ( current[j].idx == update->idx )
+            {
+                /*
+                 * NB: cannot use an assignation because of the const vs
+                 * non-const difference.
+                 */
+                memcpy(&current[j], update, sizeof(*update));
+                break;
+            }
+
+        if ( j == nr_msrs )
+        {
+            /* Failed to find a matching MSR, append to the end. */
+            current = realloc(current, (nr_msrs + 1) * sizeof(*current));
+            memcpy(&current[nr_msrs], update, sizeof(*update));
+            nr_msrs++;
+        }
+    }
+
+    rc = x86_msr_copy_from_buffer(policy->msr, current, nr_msrs, &err_msr);
+    if ( rc )
+    {
+        ERROR("Failed to deserialise MSRS (err index %#x) (%d = %s)",
+              err_msr, -rc, strerror(-rc));
+        errno = -rc;
+        rc = -1;
+    }
+
+ out:
+    free(current);
+    return rc;
+
+}
-- 
2.30.1


