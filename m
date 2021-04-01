Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5F8351932
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 19:54:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104698.200545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lS1Vt-0001JM-UL; Thu, 01 Apr 2021 17:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104698.200545; Thu, 01 Apr 2021 17:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lS1Vt-0001Ix-Qu; Thu, 01 Apr 2021 17:53:49 +0000
Received: by outflank-mailman (input) for mailman id 104698;
 Thu, 01 Apr 2021 17:53:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Onq8=I6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lS1Vs-0001Is-DY
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 17:53:48 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e794911-75cd-40ff-96b3-4fdbb5303e00;
 Thu, 01 Apr 2021 17:53:47 +0000 (UTC)
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
X-Inumbo-ID: 1e794911-75cd-40ff-96b3-4fdbb5303e00
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617299626;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=J0mB+ca1/dHzwyG5wpDRMwjhv25AphJTBpchIQNnlvQ=;
  b=JvqB90gp/uUjFZq+sNIzONL1SzKRxsSh+ibcDL071ueEve7xwNGJ6UqQ
   88QyXnKtFfcSuAIluKoJYGt8RXssFz79wfwxVLO+/6+gcgVfF6o2NjGRp
   WnncO4YkUEMTX8tR1MKGIOhI4lFuhOjwuQp0tDmFu1Ek61nEXhUd4VTpN
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: J+cM7BNsWdteVoJ+raiVGyBmkNbp7nusQdg5h2H8jyko8zw+NAaixsSgiB16B9PPz5orL9g+8q
 ky9ZVOc2vu+NtpMBSsn0lKRlzIaSKZ5+9vWyx0WWutdSl9/Kr6e0MRCj1V8ZVDXWytQxPORTHu
 M3TE7Ou3C6yGjXrspRJpfghqy0Yb9QGxe+i3Y3Ou5PTC233kLGbllQdmrVxjVtdBsxTcAXrvR9
 K9xC2WoAjL45g1TtBb6DHbcHTsigxSyM5OVzNm1DXgV6Q7T39TI356cU9lxoX7VUA60oorjD3r
 DXs=
X-SBRS: 5.2
X-MesageID: 42185845
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:lt96rq+WKHEw3K50DY1uk+F3cL1zdoIgy1knxilNYDRvWIixi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmzybdc2qNUGbu5RgHptC+TLI9k5Zb/2DGIIULD38Zn/+
 Nbf6B6YeedMXFTkdv67A6kE9wp3dmA9+SSif3Dymp2JDsLV4hLxW5Ce2KmO2dxQxRLAod8MZ
 Ka6NZOqTbIQwVoUu2QAH4ZU+/f4+DRnJX9bhIcQzIh4g+CjTSngYSKbCSw9BEYTj9J3PMe4X
 HI+jaJmpmLntOa7lvn12HV54lLg9eJ8Lp+LeGFl8R9EESWti+Gf4JkMofy2gwdgObq01oylc
 mJnhFIBbUP11r0XkWY5STgwBPh1jFG0Q6R9Xa9jWH4qcL0ABIWYvAx/b5xSRfS50o+sNwU6s
 sitAj1xvknb2K1oA3H69fFTB1snEavyEBS9tI7tHBDTZAYLIZYsI13xjInLL47ACn45Io7ed
 Medf302fA+SyL+U1nkpGV1hPSjUnMvdy32OHQqi4i+1jhbm21B1E0IxMATtWdozuNMd7B0o8
 vDKahmj7dIU4s/ar98Hv4IRY+NBnXKWg+kChPdHX3XUIU8f17doZ/+57s4oMmsZZwz1ZM33L
 DMSklRu2Iec1/nYPf+naFjw1ToeiGQTD7twsZR69xSobvnXofmNiWFVRQHj9agi+93OLyYZ9
 +DfLZtR9PzJ2rnHohEmyfkXYNJFHUYWMoJ/v4mRlO1pN7RIIGCjJ2ZTN/jYJ7WVRo0UGL2BX
 UOGBLpIt9b00ytUnjkxDfLXXfAfVH+4IJQHKDW8/N78vlICqR89iwuzXip7MCCLjNP9oYsel
 FlHb/hmqSn4Um6lFy4qFlBC154NAJ48b/gW3RFqUshKEXva4sOvN2ZZCR31HuDLRlvctPOHG
 dk1hJK0JPyC6bV6TEpCtqhPG7fpWAUvmi2Q5AVnbDGwsv5ZJUiDNIDVLZqHQvGUzx58Dwa6F
 trWUshfAvyBznugaKqgNg/H+fEbeRxhw+tPIpzsnLQtUKVoOk1XXsFVzuSUcqa6DxeAgZ8tx
 lUyesykbCAkTGgJS8Um+IjKmBBb2yRHfZ7FgifXZ5VnbrqYQl0am+PiVWh+kgOU1uv039Xqn
 3qLCWSd/2OJlZGoHhX3pzn905OenyHc1h9bW17toNBBX3L00wDpNOjV+6W6S+8e1ECyuYSPH
 X+bTweLhhH6vq32BSW8QzyWEkO99ELBKjwHb4je7bc1jeRM4WOj7gBBOIR1o1iLsrSvugCVv
 +/dweZICjjMf4g3xWYqx8eSXFJgUhhtcmt9Azu7WC+0nJ6POHbJ05+QaoHZ/6b9GrpSp+zod
 1EpONwmdH1FGr/atSLk/6KKxFCLw7eum6wQaUDr4tOsac7qbt0GN36XFLzpQd69SR7CP2xsk
 UUBJlfyvTmHKREesQJYSJX/lYzjr20XQEWmz2zJtV7RE0nin/QAsiA7LXJo4c+G0HpnnqGBX
 Cvtwlmu8rfVySN1bQmG7s9DGRfZk878mlj9oq5BsTtITTvU+FI51yhNHChNJdbVaieAL0Vxy
 wKr+2grquydyDi3hrXsiY+CqVS83y/Scf3JA6XA+ZH/5ibPluL65Har/KbvXPSSTGhbV4fip
 AAXUsMbt5bgj1ntbYJ6EGJO+fKi3NgtUBf7zFhnkPs3YbjwF6zJzA2DSTpxrNMXTdSNXCUi9
 /i6ubw7gWn3AR4
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="42185845"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KDx5vURnzyPsw6rBUZ/bSSh6v0L56pyM6d1D2WbqO8hptLRPWoWotwwvot/4COvkP26IKYZPKifFSF2NXMzg4afhFfPeAzz7rzAXItGzhFTa3GqkM+CAwpTJ56FVl4rLi+f9lb0ZgYm14Lv6Z1bCoffHz5eokN5EEKEV88dqvR5YiwAY/xgwUOyRQidyn5hiDYGd4X6+3i5EK2KnXik4YVj4Ibkd2i5dgr1j5mu377bFFu0+h1gfNOMGzJW89S1+0IKbZftQTY0hw3xMAOVnntbJtK7LtNWbemikJ40J12AUXEbePHn3UmsvPD2RbwJgo5TnPEFgK1ybRfTm0/ZQIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0mB+ca1/dHzwyG5wpDRMwjhv25AphJTBpchIQNnlvQ=;
 b=TOE+U+iOdRLDihPztCs8N4LDR6Ml813QTflspwT0NHUMWhor2g6tSTSQBWce0LbxNrq7+C4eETmh05wrzkCN2ErmAP0rBGb8SDWcQOHhboWcuXipEowXMBlu2LB8Y8VvpBcDYC5XOua/EVSVx+rKEM9s5n1y261cZS5sX5IoNHB/uyv0Jb5Oi+WrIVDzA5fjjVDVHdQXNDFfxMGyXKUwbMXK6mndMObsfm6b2jkUPD2Wg6u9zaOSsQCiVGPyRNmIBH3f95OJh0zOiX67azIfGXN0LAKv3vBp2vRx9UUkMV7pulQwJ1jd36qDrMUWa+EhPYrjGoXeDleE0BHjd+OpSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0mB+ca1/dHzwyG5wpDRMwjhv25AphJTBpchIQNnlvQ=;
 b=nx6RbP8XZJNPegAJrucSeTFyIeUEj3ajU/Ov3ecw3iRJsf8NdsqCDZxKRxSFG3zU2YDQ0FO4g6eZqf40F04Lvon6YdzoIP7xoZTV1N+ilpBnGcXRoX2nZe1gnhE/n/vYzrYVOv4yV6MX0DRP3j+QGXF05mT56oLkVaFwvjoi+D0=
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
References: <20210323095849.37858-1-roger.pau@citrix.com>
 <20210323095849.37858-22-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 21/21] libs/guest: (re)move xc_cpu_policy_apply_cpuid
Message-ID: <67f7251e-dbe6-37d9-472f-79937e9b1a01@citrix.com>
Date: Thu, 1 Apr 2021 18:53:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210323095849.37858-22-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0445.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::18) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87b978fe-e29c-4530-c935-08d8f53717a9
X-MS-TrafficTypeDiagnostic: BN3PR03MB2371:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN3PR03MB23715F5E7F105016E91A37B9BA7B9@BN3PR03MB2371.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6Ty1iysBRvDGwxyLtsXABzTrmJ0WYHbutxjKG4jvYrF0mv5+CTAOT+7IvvncNPQQXPQ0B1wHOJdnedxQY2ogsEbJ86Y4r1PAiWY2WyTloCsAQZUaWcomtax6LAAyVD/ylLaJlBrSloi9hkTzpgmy50w1B1Uj6eB/RQXAwcx08G8Vod7roNCIRU2PFgsEQRXItb6BkTxXlN04aXvc5em5zjmTI/TdKDb/pY0nwCItfy+c3apxFDobAIbES87UZAl0ogJRFQis4YuRA5J+vIs42mLBzFRs4PAEuxAcMFqW6iQg4ERIYNag4TdA+oWrhTtOv5g10/ZBXypbrtfHR9AicIatWvPbXcKXg8aBnayRXKjChq0AX3qYEzd/HKdkGfD/ark6RkOqdrbCVkC8HlBFvbTmQwfyhiss2hQO6JCgu+WDIfr/HpW4k39mWflhRfKy0Oj2n4EMQs0PO2BiqjBrnV8BoyQjId9HahlLr8R/kkCu4jQmAaous9FGIr9viDfFZByrvNmW6PtDTy64TkzH35xL6KebF3HXQLT251uU8FUkLL1IFkgGgVZYTf7dLTT1NdfyGTE0/tZxx1sbDFWBwFEkH+uqv2DjiOy3WCLmqjibFcF0xKP5mUzqn2B7tNUTCWhdS1j4tJqMfjHbpgt2PnzKt8eRrWRNhShdWXapd8y+VvjD89XCwUWgp8VcEcY7RRGB9IJ3L+FTJVjgvASxf8Mo1wnT7S8+so9qFsSTiaQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(107886003)(6666004)(36756003)(16526019)(66556008)(8676002)(186003)(5660300002)(26005)(31696002)(8936002)(53546011)(31686004)(956004)(478600001)(54906003)(6486002)(2616005)(66946007)(4326008)(16576012)(66476007)(38100700001)(86362001)(316002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SnJBd0VOUlphM05ySENXaGttM0E3MGhFSGdSOXZuZnpLYXFhcGlPMThLSEZM?=
 =?utf-8?B?cUpVVm83emxwNDJHY3VUUU5IYi8xYVBjOFA0cUVienY5UXBYdFFDWHVIWXIr?=
 =?utf-8?B?RWN3NittWmFNVTh5N1RRek5VTTFqMTZYNmRzdzIrakZaOUVLL1JuWnd4dkk0?=
 =?utf-8?B?REFMWVVMRXFPR0I2ZXVoeVZLYTJSdUZIWE9TRDlOM20vWGlMMWFOSjErMVNx?=
 =?utf-8?B?SWd1czZha2hCanZxT08zb2hITk1XbmdSZ3Vkeit1bmlMZ0hLaFQ5TndiMXo3?=
 =?utf-8?B?MnEvMUhRbWF0L2lOd2V3WjgzLzBWaWg2OHE2TnBiZE5oM0cvRkdtRC8zTThE?=
 =?utf-8?B?VEh0Y1ZjSFA5ZWxVRjE5MHh4Y2ZIYnJGdi9wSFlSS203NmRMVUFhR2NYWXJa?=
 =?utf-8?B?YWtwMnEvQllXQ1FLMU9DU2ZaTW0rQmovZjVWNEdObVFHWnppR0c2aUIzb2RP?=
 =?utf-8?B?WWlwVENnRk1oMGJueUYxOExXcVZ4QzVBeGtwZmRQcE5uZ1Nocnk4RDQwYXBi?=
 =?utf-8?B?anJVKzRUdDhka0F6WTkxcXRuWFVCL0FPQ2lIYTl4ay95YzAxelFVaHc2WHdV?=
 =?utf-8?B?V3NSaGMyeXE3NWpKS2xManJMdkdEMlhRdEFOdmhGajlFYndzcUc5U3FVUFBv?=
 =?utf-8?B?MG5VNm4rQXdNZDAvTHpCYkpaL3Qzd3hmOWdwTkhJNzk2SWhiVFc0NVVaTlBj?=
 =?utf-8?B?OHdUZEVRYTNzRElZcEJXdndJVk1hWENTNEQzVXlwSnJJNURnQi9lcTR3N2hY?=
 =?utf-8?B?UnlKc3RlRXJVWVQvZkxNaFhCL1BTRjMyeVdCdTl3TG9Xa0xyMHFYbW5WenRp?=
 =?utf-8?B?VC9oYStCN3pJZjlFOVZoRFQxdXZIanZXczAwRmVnRE41aHZUakpKeENBNlla?=
 =?utf-8?B?Y2pRR0NuUUtLVlBxZS9ZVnJ3VWZ3enl0RkQvamJaMVlPLzA0Yk1TT0lYQlUv?=
 =?utf-8?B?em5YNXBOM1lSOTFjTG1OOUMzZ0lXaVhNRjJML3lxaTlJRUlwZG45SnU0S1Va?=
 =?utf-8?B?N2VKWm9GUHV3NTUrMnNHVnFGMjZpREpaK0Y1by8vZFQ1ZytEVndoNm9HbkRt?=
 =?utf-8?B?UXVtYm5hS3NwVzhEZWtibjRiU01LS3hhOHZTaHZtSDNSalRod29reVowNk9Y?=
 =?utf-8?B?QVIwNXV2OWJab3JuSUF2UWVsRFZxM2E0WnRlUlU4SFAya2NjaGtiTnNqSkh4?=
 =?utf-8?B?MlBMc0hsNFMzcTdTcng1ME5SYmhHQzFVZ1Ftb2tERnNvWGwzcjhQZmJkV3hj?=
 =?utf-8?B?NWR2WVJZOXFoTUxzc3BqWXovbnVTT1U5Tk1IOXJORVZPdEUvdUdMalVXWThi?=
 =?utf-8?B?MWkyYWJDWXI0dlhkN2dTUzBhNzcza3ZSN0xCS3VTeE5ucFgwdUN5bTVocGkv?=
 =?utf-8?B?anZVbXRBOWlxeE5DeUx4ZVpTejgxWkZGb3VYOUtZeDhKTW10SHJiY3UyUnkw?=
 =?utf-8?B?R1d6MlVYMXBhamNUekxCV1AzeGZwbWlSYXVLYnRCdGtIeW00NVpjb0FuNG5l?=
 =?utf-8?B?SFBwTFFBbTEwSmpnbG9IQzBzMjEvU1A5Skw3WVBOdXdnZUNQTTB2Z0MrOE9C?=
 =?utf-8?B?ZE81eXgvLy8rNGROL1RkYzlKL1ptbzZaeHhXbWIrL1kvNjNRakIrQUNGS1VY?=
 =?utf-8?B?Vlp5eXd3QWp0NGxGMTZKNXFUUDNJSGFFcFZ3ckE1U1VVdVd1amtiVDZlZ1JI?=
 =?utf-8?B?ejRUbHFmcHRzQlhOTjJzL2tMaTYzcGFGSGgzNmxpdkRPQmxVWXU0eWVIQ0NJ?=
 =?utf-8?Q?c3qBaoQikIqb63fzk6iesYexPPPoAOERcIgfZyo?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87b978fe-e29c-4530-c935-08d8f53717a9
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 17:53:44.3153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tWuDEf4nVCi+iorOf1zsZM2J7pKQmmYmM52sdB2sUjuGl+Bgzr/mcwtYA52Xa9Q0XZMo8EYuUjMnCPIuEx/3IhT020zuwp8OfBPBRAyJOlI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB2371
X-OriginatorOrg: citrix.com

On 23/03/2021 09:58, Roger Pau Monne wrote:
> Move the logic from xc_cpu_policy_apply_cpuid into libxl, now that the
> xc_cpu_policy_* helpers allow modifying a cpu policy. Having xenguest
> parsing CPUID data in xend format was a layering violation, and by
> moving such parsing into libxl directly we can get rid of
> xc_xend_cpuid, as libxl will now implement it's own private type for
> storing CPUID information, which currently matches xc_xend_cpuid.
>
> Note the function logic is moved as-is, but requires adapting to the
> libxl coding style.
>
> No functional change intended.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Its not a layering violation IMO.

It was only in 4.14 that I dropped the Python and Ocaml bindings for
xend-format strings, in an effort to simplify this work.=C2=A0 Before then,
libxc was absolutely the correct place for the logic to live.

I do intend to re-add python bindings in due course, but I really don't
expect that to extend to the xend format.=C2=A0 So moving this logic probab=
ly
fine, unless we're expecting to re-introduce it elsewhere?

~Andrew


