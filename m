Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F26CF58FABD
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 12:35:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384398.619765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM5Wq-0003mP-20; Thu, 11 Aug 2022 10:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384398.619765; Thu, 11 Aug 2022 10:35:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM5Wp-0003jd-Uo; Thu, 11 Aug 2022 10:35:03 +0000
Received: by outflank-mailman (input) for mailman id 384398;
 Thu, 11 Aug 2022 10:35:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3/DV=YP=citrix.com=prvs=21511e084=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oM5Wo-0003jX-UI
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 10:35:02 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3fb74cab-1961-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 12:35:00 +0200 (CEST)
Received: from mail-dm6nam04lp2045.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Aug 2022 06:34:57 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW5PR03MB7007.namprd03.prod.outlook.com (2603:10b6:303:1aa::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Thu, 11 Aug
 2022 10:34:56 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5504.020; Thu, 11 Aug 2022
 10:34:56 +0000
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
X-Inumbo-ID: 3fb74cab-1961-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660214100;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=z0o48xIdAaWOZ6a0sVgYEg00NTBFScV06bbRsb74HIk=;
  b=e3u7J5YKT1lY7+R8E3mCT7d3hGx9s4mVcM+TDEBH9pW0GsFImp4KIrko
   h2LCDB78555QQCmn71dUFUYvL+G2RiEBlyiQyQBu8Ws8t2dvt+nq2OCb5
   9TjUI+qnsNAtcnt7rF8GhGbsTM/bfTXyfXGR6QWEiNu8mCN5CsCaae3YZ
   8=;
X-IronPort-RemoteIP: 104.47.73.45
X-IronPort-MID: 78299631
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:yRxBo60WP/SigJhPwfbD5c1wkn2cJEfYwER7XKvMYLTBsI5bpzcEx
 2AcXzjTbKvcN2KjKY1/bI+2oRsEuJ/Xz9QxHFY6pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOKn9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUwx4VlmrBVOSvU0
 T/Ji5CZaQTNNwJcaDpOsfrT8Uo35ZwehRtD1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86rIGaRpz6xE78FU7tJo56jGqE4aue60Tum0xK6b5OKkBlazhHe545gXBYqheW7vB3S9zx54
 I0lWZVd0m7FNIWU8AgWe0Ew/y2TocSqUVIISJSymZX78qHIT5fj69hnDxASYNYDwbtmOTpO/
 NcZMzkubw/W0opawJrjIgVtruIKCZG3ea865DRnxzyfCus6S5feRamM/cVfwDo7msFJG7DZe
 tYdbj1sKh/HZnWjOH9OUM54wLju2SK5L2AwRFG9/MLb50D6ygBr3aerG93SYtGQHu1en1qCp
 3KA9GP8av0fHIPPk2vUrCn17gPJtSzyBN4+MaC1z9800WKhhWhUFSw0WkTu9JFVjWb7AbqzM
 Xc86ico6KQ/6kGvZt38RAGj5m6JuAYGXNhdGPF87xuCooLW6QuEAmkPThZadccr8sQxQFQCy
 Vuhj97vQzt1v9WopWm1876VqXa+PHYTJGpaOSscF1NZvp/kvZ05iQ/JQpB7Cqmpg9bpGDb2h
 TeXsCw5gLZVhskOv0mmwW36b/uXjsChZmYICs//BwpJMisRiFaZWrGV
IronPort-HdrOrdr: A9a23:C9R8i69U0r1NV6mxo8Ruk+F7db1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQodcdDpAtjifZtFnaQFrLX5To3SJjUO31HYYL2KjLGSiQEIfheTygcz79
 YGT0ETMrzN5B1B/L7HCWqDYpkdKbu8gcaVbI7lph8DIz2CKZsQljuRYTzrcHGeMTM2YabRY6
 Dsg/avyQDBRV0nKuCAQlUVVenKoNPG0Lj8ZwQdOhIh4A6SyRu19b/TCXGjr1YjegIK5Y1n3X
 nOkgT/6Knmmeq80AXg22ja6IkTsMf9y+FEGNeHhqEuW3XRY0eTFcdcso+5zXUISdKUmRIXeR
 730lAd1vFImjHsl6eO0F3QMkfboW8TAjTZuCKlaDPY0LDErXQBeoR8bMtiA2XkAwBLhqAC7I
 tbm22erJZZFhXGgWD04MXJTQhjkg6urWMlivN7tQ0XbWIyUs4nkWUkxjIiLL4QWCbhrIw3Gu
 hnC8/RoP5QbFOBdnjc+m1i2salUHg/FgqPBhFqgL3f7xFG2HRii0cIzs0WmXkNsJo7Vplf/u
 zBdqBljqtHQMMaZb90QO0BXcy0AGrQRg+kChPbHX33UKUcf37doZ/+57s4oOmsZZwT1ZM33I
 /MVVtJ3FRCD34Gyff+qaGj3iq9MFlVBw6du/22z6IJyYHUVf7sLTCJTkwono+pv+gfa/erKc
 qOBA==
X-IronPort-AV: E=Sophos;i="5.93,228,1654574400"; 
   d="scan'208";a="78299631"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fNs7Jzx0MhyxcvnLqbVXkhWujTyzzAGMz5xSEOpe7r3N2bY/KWG7wombu8VH60aoddjAE4RIqdO563JBZea2ZCalDf7aritrfJYSOz2ndsiJkCvQSTHhxmaJJ+6RrZFzx1X2viSWh5oetOKLN5CtRx3Kn+ZotBaZ7lZxoJ8T5rclrVxMqb0E/Ph7kASbY3A3EyB77jJn5c7rg6gMQmYH89SDwnEN67tgdOLHBVe/kWy5QyqvNur4kXvHVif/YXdhcO6PdGin8KU/IzgE4Dh1LGWfPXmr3blAeWm7hUrbzj4V0XjjYmJBnfZOiSFtbOgpbEqunalJG0PYpe6pMtxm/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0o48xIdAaWOZ6a0sVgYEg00NTBFScV06bbRsb74HIk=;
 b=alVyu3FzXSWlcVblz6N9zBKmszihmHT0I5AGEV8fTwKftEODY6mORjjHxDgtFvdeRwS3KxHQyfLp+iixpITWQnR+9f1sIXEQp4kasseEkH0NlTHNGlngSmFf3IlgEHJjWfbLSqBOgCyASF3WSQeZ4GgMfyG6LpIy5vZxwwyAWs8UexzOpa5PhwtSUflmDr/rKLmCZlZsI/cJ6HpnTP714d1/saTRxfI6l4YXwfmhi2pUPecMvjnTdcQ6JguQe4tOj7/38q2yYkbDjREcgG5Xpu/v2wIK2qJw3s6FlqerRMJ3V+ZHokwRkhdzG0MXAg3nGKYWqmyL7xp9gPAqgjItig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0o48xIdAaWOZ6a0sVgYEg00NTBFScV06bbRsb74HIk=;
 b=uAX1cccIg7w8/aGA0F/VCz4tlLJV0e1SiyuR/ziR9LJIz1sGNr6y3jd5cprETxFNTWi4hhWa4LBH8nES6tGLcLbv3F+H/otm9h+WxnG7licophrOTK+wHMEnhcyvSvQhtL2/UwF4pccZUJaOB7SBEl3grQdsDnkvoEBmSNlbllU=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/cpu: Drop _init from *_cpu_cap functions
Thread-Topic: [PATCH] x86/cpu: Drop _init from *_cpu_cap functions
Thread-Index: AQHYrWuqM0jpHL25IEyIFgBUnyY/9K2pfX2AgAAChoCAAAEjgA==
Date: Thu, 11 Aug 2022 10:34:55 +0000
Message-ID: <e848e6a7-2c8e-d0d3-6aa8-24d9d78ae491@citrix.com>
References: <20220811101715.3947873-1-ross.lagerwall@citrix.com>
 <7ff6d006-0a6d-60e9-ebb7-70ad3c6d6a5b@citrix.com>
 <PH0PR03MB63827F5CFCCB8277405FD70BF0649@PH0PR03MB6382.namprd03.prod.outlook.com>
In-Reply-To:
 <PH0PR03MB63827F5CFCCB8277405FD70BF0649@PH0PR03MB6382.namprd03.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0730b4a9-e9f8-43ac-416e-08da7b852228
x-ms-traffictypediagnostic: MW5PR03MB7007:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 prkkhZUi1mOLX+IBCRAtRfMtY0bT2QzifDobN8Y8jho4iyYBqVO1t9BdDvwxd3HM3nHir4LnXimQlwPngp8TzacRiRDeErPLgnsQBhIO3Qh8itTD58f6VqTd72ZLAw4TfOXibBMsKj/8hSkWxc/E5Ts1keohkO/yg09xQRHMEWFxTL8Evvx9K/o0NUrtOeo9Qr7nri2FJOgnqE/mA3B+VEjpFOOxCKfaX3gOdZQ0Mdt0Wu/amNtT96ruk1yQHNcYr62w6zqLZYwrORc6PE3ty7fSJARckrhpwrHK3SAtlZDJBpz8DZqc70RHTmxb1dTFZq33HD+DG3aso7X9hF4F7jxiXrMDND7Ll2ijsMLEHkV4SUiRQYOOy+z8gZ5d93LpOlyPJSq5h3MWKeweh16BQKDNNb5YpHAm9qegZityufEY4jUoHdliEIQwZaW6GQfE8NUCHDcfF6Q5aGJS8mV2gRSwZIEThsV+IpOmaY1arXZC+9rLP4b7gyG+GcmOaHketSbUDt32QizEa2wtN2X4swXzKqIJMJ7XIXN8OgcyD7Z96i+jn4Op29EbfiMskinhBDFFIITOlDe5Iwq4fXh3ITYoAzsakIQbcWcSWK+CpHN82MdGiQpXo3bp/YIhYcRwwwqzjT1LoPzmQk/ImoCpWMxL1hiVrvp+MtW6san6w852O0HPTcqSB48EiNxTo0h5vhVJLfcORnRt3jr9o1U2wYE8MjZKxLt/yEXa5rNpkh0rl7l1CWZBXZORvExyu7vgdJFMJDIHs9UeK9fzqjZzoj8V2uAHdjR9etUY6QPLIWJzh3h4Z19bwtugOnFGJ+21llkSFoPmtpXAslu8j7Uvc4ByCDY4ZRbtoc7ycgsh92zTX+f/vN6S9p8jtVnyCLPi
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(366004)(136003)(39860400002)(376002)(76116006)(38070700005)(31696002)(66446008)(122000001)(71200400001)(2616005)(83380400001)(2906002)(6486002)(186003)(478600001)(36756003)(38100700002)(31686004)(86362001)(54906003)(4326008)(82960400001)(53546011)(316002)(110136005)(5660300002)(64756008)(66946007)(6512007)(6506007)(26005)(41300700001)(66556008)(66476007)(8676002)(91956017)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q3JpMzExcDNjeXRMUG9JdDNPOVUwNXVxb1h1ZWF5QWxyNEhCTUFjTG5rODBW?=
 =?utf-8?B?TmdoRnBWNzNoQnpGSnpGWndER0RjZkRxN245cVZ2c3lZaFBVNG8yUDhEZDhU?=
 =?utf-8?B?TG9sVjJCYU1NRGFkVVAxKzBUcDlWRWJyOWEzaExiTjJWUEF4Y2l3OFBBd0l0?=
 =?utf-8?B?K2RiSjVtTTlXRlUydkVEd2JWdm5XZ2o1ODJyMWJjK2ZiTXFrR3AwMUNTY3Jh?=
 =?utf-8?B?aDI4Y01JcUJCeHdkRmRidVdFOVpkMGFteXBOZ2YwamtaN2lNaGQrR2dLNVNY?=
 =?utf-8?B?aHNQb0tJOHNTeFo5TmJxSGhLK3oxMzVZejNEOUVDLzlMYUROLzRZNjI4akEv?=
 =?utf-8?B?c2l2bGszWlllTk1udVRFQ29KZFR6T2syendCOHd1YjFUUWRnYU9Cc0ZrUCt1?=
 =?utf-8?B?dWFoM21mZFhPRjhFTFlkOVNMRlBFamZlRlg4eGpjK0RrRFRDQlpSMHRJU2o5?=
 =?utf-8?B?UTBVSmtSSU1QS0ZJZm9nRFI0eFRGY1JnbUp4MWZ1N1FyaWRURE42T1hjY3Y4?=
 =?utf-8?B?czNGZDdrT3c3cE0yU0lYZ1lnaldlWnZMYm45cjZoeTBQd1dyNk1UYUlJRFhO?=
 =?utf-8?B?UGRrVzJCdWpsSWw3WXRqeVlxS0Z6WmJGQmwxdEg2RGFzYWRZTkNMelJpMEJC?=
 =?utf-8?B?ZVZjb25pZVM0Tnd4VGtOQzd2d1NWcXBpckVDQTVzT0J4c2U2TjZRMEVrdW5X?=
 =?utf-8?B?NmZjM1BiWUVIcG9hNHZIQjJEVG1ubEFFUjg5ZXpoQWtOQytlTmpCQmpLTGZK?=
 =?utf-8?B?cUNjS0hlL0ZPQXRBUTJhb1FQY0IyTE5TaVM0RVgvbGJjZzJtVUFtVnJmWUFk?=
 =?utf-8?B?a1g1S25PQzEzNWZkeFZXYisvNEEydzQ1UDAyYUQ4cnJrTEVkYmhRMHZZaCtU?=
 =?utf-8?B?SnFiNGdvbndHc2dxVGdHQjZYN2lqSzVBakF3UXpZT1VsVHdiZy9qLzZud0t6?=
 =?utf-8?B?ZTlnQzBjWXl5WVFHQThnL3lmaW9BZm1VSi9pNnF3aWVBclpmVVFZb2VnekJz?=
 =?utf-8?B?UUNybzhES28zd1Z3NEROVWJ3QS82aHJSZkNpZ1dyNjhldis5RFUyNTIxcHIx?=
 =?utf-8?B?R0xOSGJWVEo1UzlpVTZsRjlXOVdnbUN0bXcvMUtOWSsvUktOMURxdUZ0WTVX?=
 =?utf-8?B?VTlRT1owS2R1SkViUlRtaCtBR01FWEtad0lDVTdXMXc1MWUvVms5eDNQK1By?=
 =?utf-8?B?aWxoc3hoWTJtR3oyVktiaGZYTENrTExJMzcxTUMrMEJmVnNtelR0YUtFUTJJ?=
 =?utf-8?B?SjE4WWorL1d4VUtPdjlkQkFuSlpNek8xU0hOZ0UrOVNTQmNGVndXTC9IREdC?=
 =?utf-8?B?RC81NHBXaUJibTdZV05Qa21rWUxHRlVvUUZpS2hzSEtiY0lzVW92MWJ3TGda?=
 =?utf-8?B?VnZJM25hNS9uOXFCb2dPT0UzRDlsamEvcDdKTW5MNXAvdE12cW9YaWhXclhp?=
 =?utf-8?B?UVlud3p5dUhtMW5NSjgvU21oM0g0SGFsaUV3c3FoMU9qSkhTbGp3STJXNXNn?=
 =?utf-8?B?WXpHTWFtc1dKdWxnU3dRM0dtaVBmMzNFR3VNWW9ZTEd0bE13Mmc4V3lIQVJO?=
 =?utf-8?B?SnIwdHdQSzFpcHZ5VmZBSForVzJSbjhDR2k0dGZJQTNYS0NxMDZJcGlidXhH?=
 =?utf-8?B?V0V5cTJydk9WazhSSytQbUNzaXZuL2pERS9kWmJvUVpvS0J2emt2dE5Qa3lG?=
 =?utf-8?B?Y3VBaGpiSUhVUW9RM0R2LzhtUDQzdmo5OXlvOGtyM3dlZDIyeXIyRVVPbjMv?=
 =?utf-8?B?Vm9EVzNxejdZU3dmZmJuNjNHa2FZcXB5aEZMZ1lwYUt2Q1NmSFMyTmp3TVZM?=
 =?utf-8?B?WmFRdThmc0oxWGxHYlN0Q3luNU5pYk45T1lSNGJjaWJ2aGdBa0V2bHFDMjR5?=
 =?utf-8?B?SXQzN3ZvenNjazlmV2VZVG5kWG1rdExZVUVrbVJkUHNHR2xFeXJiaUg1VkJo?=
 =?utf-8?B?N29iVVp2SXpzdjJVVHlHMkxnRFhhOGl2RDE5VWl4a3ZRM0lXVTRrYmVnU2dq?=
 =?utf-8?B?SzhaR09sNDI5RTlWbEZiMGxwalhCUkJqNFk2NFpLWDh5b3A2TE4vMEJaSXY3?=
 =?utf-8?B?UURaTklCcXVKZEUrZjl0S2Jhb05hVnA1aFp4anBkTExUUy9iY3BsQ2hnL3Z3?=
 =?utf-8?B?QnJTbWF1dXp6b1k0YlVwaHdaSXc1OC9jYk5XS1VoT1MrVmM5Vjh0b3VFNUg5?=
 =?utf-8?B?QUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8D89EFAB3AFEC943BC6A4410288DF037@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0730b4a9-e9f8-43ac-416e-08da7b852228
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2022 10:34:56.0120
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lNDuUdrcj3WLhyR0uXqh5viAuON2byTNxvn1mJPbaUy+vT52rqmJTawM42xqJjOIMHceJNwgLks3qWuAzYIUq7wLC2G72NkMWKlN5XawZAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB7007

T24gMTEvMDgvMjAyMiAxMTozMCwgUm9zcyBMYWdlcndhbGwgd3JvdGU6DQo+PiBGcm9tOiBBbmRy
ZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPg0KPj4gU2VudDogVGh1cnNkYXks
IEF1Z3VzdCAxMSwgMjAyMiAxMToyMSBBTQ0KPj4gVG86IFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxh
Z2Vyd2FsbEBjaXRyaXguY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIDx4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+DQo+PiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPjsgUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaSBM
aXUgPHdsQHhlbi5vcmc+DQo+PiBTdWJqZWN0OiBSZTogW1BBVENIXSB4ODYvY3B1OiBEcm9wIF9p
bml0IGZyb20gKl9jcHVfY2FwIGZ1bmN0aW9ucyANCj4+IMKgDQo+PiBPbiAxMS8wOC8yMDIyIDEx
OjE3LCBSb3NzIExhZ2Vyd2FsbCB3cm90ZToNCj4+PiBUaGVzZSBmdW5jdGlvbnMgbWF5IGJlIGNh
bGxlZCBieSBpbml0X2FtZCgpIGFmdGVyIHRoZSBfaW5pdCBmdW5jdGlvbnMNCj4+PiBoYXZlIGJl
ZW4gcHVyZ2VkIGR1cmluZyBDUFUgaG90cGx1ZyBvciBQViBzaGltIGJvb3Qgc28gZHJvcCB0aGUg
X2luaXQuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdl
cndhbGxAY2l0cml4LmNvbT4NCj4+IEhtbS7CoCBUaGF0J3MgYSBidWcgaW4gaW5pdF9hbWQoKSBJ
J2Qgc2F5LsKgIFRoZXNlIHJlYWxseSBzaG91bGRuJ3QgYmUNCj4+IHVzZWQgYWZ0ZXIgX19pbml0
Lg0KPj4NCj4+IFdoaWNoIHBhdGggZXhwbG9kZWQgc3BlY2lmaWNhbGx5Pw0KPiBUaGUgc3RhY2sg
dHJhY2Ugd2FzOg0KPg0KPiBzZXR1cF9mb3JjZV9jcHVfY2FwDQo+IGluaXRfYW1kDQo+IGlkZW50
aWZ5X2NwdQ0KPiBzdGFydF9zZWNvbmRhcnkNCj4NCj4gSW4gc2V0dXBfZm9yY2VfY3B1X2NhcCgp
IGhlcmU6DQo+DQo+ICAgICAgICAgLyoNCj4gICAgICAgICAgKiBPbiBwcmUtQ0xGTFVTSE9QVCBB
TUQgQ1BVcywgQ0xGTFVTSCBpcyB3ZWFrbHkgb3JkZXJlZCB3aXRoDQo+ICAgICAgICAgICogZXZl
cnl0aGluZywgaW5jbHVkaW5nIHJlYWRzIGFuZCB3cml0ZXMgdG8gYWRkcmVzcywgYW5kDQo+ICAg
ICAgICAgICogTEZFTkNFL1NGRU5DRSBpbnN0cnVjdGlvbnMuDQo+ICAgICAgICAgICovDQo+ICAg
ICAgICAgaWYgKCFjcHVfaGFzX2NsZmx1c2hvcHQpDQo+ICAgICAgICAgICAgICAgICBzZXR1cF9m
b3JjZV9jcHVfY2FwKFg4Nl9CVUdfQ0xGTFVTSF9NRkVOQ0UpOw0KPg0KPiB3aGljaCB3YXMgcmVj
ZW50bHkgaW50cm9kdWNlZCBieToNCj4NCj4gY29tbWl0IDA2Mjg2OGE1YThiNDI4Yjg1ZGI1ODlm
YTlhNmQ2ZTQzOTY5ZmZlYjkNCj4gQXV0aG9yOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPg0KPiBEYXRlOiAgIFRodSBKdW4gOSAxNDoyMzowNyAyMDIyICswMjAwDQo+
DQo+ICAgICB4ODYvYW1kOiBXb3JrIGFyb3VuZCBDTEZMVVNIIG9yZGVyaW5nIG9uIG9sZGVyIHBh
cnRzDQoNCkJhaCwgYW5kIHRoYXQgd2FzIGFsc28gYmFja3BvcnRlZCBpbiBhIHNlY3VyaXR5IGZp
eCwgdG8gZXZlcnl0aGluZyBiYWNrDQp0byA0LjEyIGlzIGJyb2tlbi4NCg0KPiBTaG91bGQgdGhl
IGZpeCByYXRoZXIgYmUgdG8gZ3VhcmQgdGhhdCBjYWxsIHdpdGggImlmIChjID09ICZib290X2Nw
dV9kYXRhIC4uLiIgPw0KDQpZZXMgcGxlYXNlLg0KDQpTb3JyeS4NCg0KfkFuZHJldw0K

